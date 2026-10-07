#!/usr/bin/env python3
"""Attach ingress and arithmetic ILAs to the *actual* PE0 accumulator RTL.

Run on an unpacked XO's hdl/verilog directory. Resolve declarations/instances
from that XO, save a probe manifest, and fail rather than invent missing nets.
"""
import argparse
import json
import re
from pathlib import Path

MARKER = "O_PROJECTION_DEEP_ILA_V1"


def declarations(text):
    pattern = re.compile(
        r"(?m)^\s*(?:input|output|wire|reg|logic)\s+"
        r"(?:reg\s+|wire\s+)?(?:signed\s+)?"
        r"(?:\[\s*(\d+)\s*:\s*(\d+)\s*\]\s*)?(\w+)\s*;"
    )
    return {m[3]: (int(m[1]) - int(m[2]) + 1 if m[1] else 1)
            for m in pattern.finditer(text)}


def require(nets, name, width):
    if nets.get(name) != width:
        raise RuntimeError("missing/wrong-width RTL net %s: expected %d, got %s"
                           % (name, width, nets.get(name)))
    return name


def module_name(text):
    match = re.search(r"\bmodule\s+(\w+)\s*\(", text)
    if not match:
        raise RuntimeError("cannot resolve module name")
    return match[1]


def insert_before_end(text, block):
    at = text.rfind("endmodule")
    if at < 0:
        raise RuntimeError("missing endmodule")
    return text[:at] + "\n// " + MARKER + "\n" + block + "\n" + text[at:]


def ila(core, probes):
    ports = [".clk(ap_clk)"] + [".probe%d(%s)" % (i, p[0])
                                       for i, p in enumerate(probes)]
    return '(* DONT_TOUCH = "true" *)\n%s %s_inst (\n    %s\n);\n' % (
        core, core, ",\n    ".join(ports))


def describe(core, rtl, probes):
    widths = [p[1] for p in probes]
    if sum(widths) > 4096 or len(probes) > 1024:
        raise RuntimeError("ILA too wide: %s, %d bits" % (core, sum(widths)))
    return {"module": core, "rtl": rtl.name, "widths": widths,
            "probes": [{"index": i, "signal": p[0], "width": p[1]}
                       for i, p in enumerate(probes)]}


def patch(rtl_dir, dry_run=False):
    candidates = []
    for file in rtl_dir.glob("*int4_accumulate_local_partial_tiles*.v"):
        text = file.read_text(encoding="utf-8")
        nets = declarations(text)
        if nets.get("compute_command_dout") == 64:
            candidates.append((file, text, nets))
    if len(candidates) != 1:
        raise RuntimeError("expected ONE PE0 accumulator with command port, got %s"
                           % [str(c[0]) for c in candidates])
    parent_file, parent, nets = candidates[0]
    if MARKER in parent:
        raise RuntimeError("deep ILA already present; use an uninstrumented XO")
    parent, declaration_count = re.subn(
        r"(?m)^input\s+ap_clk;",
        "input ap_clk;\nwire o_deep_trigger;\nwire o_deep_is_o;\n"
        "wire o_deep_weight_fire;\nreg [19:0] o_deep_weight_index;", parent, count=1)
    if declaration_count != 1:
        raise RuntimeError("cannot declare propagated debug wires before instances")
    canonical_aliases = ""
    # HLS may use the caller's private snapshot name for memory ports.
    for stem, data_width in [("activation_q", 448), ("activation_scale", 8)]:
        if stem + "_q0" not in nets:
            matches = [name[:-3] for name, width in nets.items()
                       if width == data_width and name.startswith(stem) and name.endswith("_q0")]
            if len(matches) != 1:
                raise RuntimeError("cannot resolve private snapshot port: %s" % matches)
            actual_stem = matches[0]
            for suffix, width in [("address0", 7), ("ce0", 1), ("q0", data_width)]:
                actual = require(nets, actual_stem + "_" + suffix, width)
                canonical = stem + "_" + suffix
                if canonical in nets:
                    raise RuntimeError("partial canonical memory bundle: " + canonical)
                canonical_aliases += "wire [%d:0] %s = %s;\n" % (width - 1, canonical, actual)
                nets[canonical] = width
    write_ports = []
    for port in (0, 1):
        stem = "partial_blocks_"
        if all(nets.get(stem + name + str(port)) == width for name, width in
               [("address", 5), ("ce", 1), ("d", 128)]):
            if nets.get(stem + "we" + str(port)) == 1:
                write_ports.append((port, stem + "we" + str(port)))
            elif stem + "q" + str(port) not in nets:
                # CE is the write strobe for a dedicated write-only port.
                write_ports.append((port, stem + "ce" + str(port)))
    if len(write_ports) != 1:
        raise RuntimeError("partial RAM write port missing/ambiguous: %s" % write_ports)
    partial_port, partial_we = write_ports[0]
    canonical_aliases += (
        "wire [4:0] o_deep_partial_address = partial_blocks_address%d;\n"
        "wire [127:0] o_deep_partial_data = partial_blocks_d%d;\n"
        "wire o_deep_partial_fire = partial_blocks_ce%d & %s;\n"
        % (partial_port, partial_port, partial_port, partial_we))
    required = {
        "ap_clk": 1, "ap_rst": 1, "compute_command_dout": 64,
        "compute_command_read": 1, "compute_command_empty_n": 1,
        "activation_q_address0": 7, "activation_q_ce0": 1,
        "activation_q_q0": 448, "activation_scale_address0": 7,
        "activation_scale_ce0": 1, "activation_scale_q0": 8,
        "weight_buffer_dout": 512, "weight_buffer_read": 1,
        "weight_buffer_empty_n": 1,
    }
    for lane in range(4):
        for suffix, width in [("dout", 16), ("read", 1), ("empty_n", 1)]:
            required["scale_lane%d_%s" % (lane, suffix)] = width
    for name, width in required.items():
        require(nets, name, width)

    helper = """
reg [2:0] o_deep_mode;
reg [31:0] o_deep_transaction;
reg [19:0] o_deep_partial_index;
reg o_deep_q_return_valid;
reg [6:0] o_deep_q_return_address;
reg o_deep_scale_return_valid;
reg [6:0] o_deep_scale_return_address;
wire o_deep_command_fire = compute_command_read & compute_command_empty_n;
assign o_deep_is_o = (o_deep_mode == 3'd3);
assign o_deep_weight_fire = weight_buffer_read & weight_buffer_empty_n;
assign o_deep_trigger = o_deep_is_o & o_deep_weight_fire &
                     (o_deep_weight_index == 20'd0);
always @(posedge ap_clk) begin
    if (ap_rst) begin
        o_deep_mode <= 3'd7;
        o_deep_transaction <= 32'd0;
        o_deep_weight_index <= 20'd0;
        o_deep_partial_index <= 20'd0;
        o_deep_q_return_valid <= 1'b0;
        o_deep_q_return_address <= 7'd0;
        o_deep_scale_return_valid <= 1'b0;
        o_deep_scale_return_address <= 7'd0;
    end else begin
        o_deep_q_return_valid <= activation_q_ce0;
        o_deep_q_return_address <= activation_q_address0;
        o_deep_scale_return_valid <= activation_scale_ce0;
        o_deep_scale_return_address <= activation_scale_address0;
        if (o_deep_command_fire) begin
            o_deep_mode <= compute_command_dout[2:0];
            o_deep_transaction <= o_deep_transaction + 32'd1;
            o_deep_weight_index <= 20'd0;
            o_deep_partial_index <= 20'd0;
        end else begin
            if (o_deep_weight_fire)
                o_deep_weight_index <= o_deep_weight_index + 20'd1;
            if (o_deep_partial_fire)
                o_deep_partial_index <= o_deep_partial_index + 20'd1;
        end
    end
end
"""
    ingress_probes = [("o_deep_trigger", 1), ("o_deep_is_o", 1),
                      ("o_deep_mode", 3), ("o_deep_transaction", 32),
                      ("o_deep_command_fire", 1), ("compute_command_dout", 64),
                      ("o_deep_weight_fire", 1), ("o_deep_weight_index", 20),
                      ("weight_buffer_dout", 512), ("weight_buffer_read", 1),
                      ("weight_buffer_empty_n", 1)]
    for lane in range(4):
        prefix = "o_deep_scale%d" % lane
        helper += """
reg [19:0] %(p)s_index;
wire %(p)s_fire = scale_lane%(i)d_read & scale_lane%(i)d_empty_n;
always @(posedge ap_clk) begin
    if (ap_rst || o_deep_command_fire) %(p)s_index <= 20'd0;
    else if (%(p)s_fire) %(p)s_index <= %(p)s_index + 20'd1;
end
""" % {"p": prefix, "i": lane}
        ingress_probes += [(prefix + "_fire", 1), (prefix + "_index", 20),
                           ("scale_lane%d_dout" % lane, 16),
                           ("scale_lane%d_read" % lane, 1),
                           ("scale_lane%d_empty_n" % lane, 1)]
    ingress_probes += [
        ("activation_q_ce0", 1), ("activation_q_address0", 7),
        ("o_deep_q_return_valid", 1), ("o_deep_q_return_address", 7),
        ("activation_q_q0", 448), ("activation_scale_ce0", 1),
        ("activation_scale_address0", 7), ("o_deep_scale_return_valid", 1),
        ("o_deep_scale_return_address", 7), ("activation_scale_q0", 8),
        ("o_deep_partial_fire", 1), ("o_deep_partial_index", 20),
        ("o_deep_partial_address", 5), ("o_deep_partial_data", 128),
    ]
    require(nets, "partial_blocks_full_n", 1)
    ingress_probes.append(("partial_blocks_full_n", 1))
    manifest = {"version": 1, "ram_read_latency": 1, "cores": []}
    manifest["partial_write_port"] = partial_port
    core = "ila_o_projection_pe0_deep_inputs"
    manifest["cores"].append(describe(core, parent_file, ingress_probes))

    # Arithmetic remains in HLS's row-loop pipeline submodule. Add explicit
    # ports carrying the parent's common O-qualified trigger; no XMR probing.
    loops = list(rtl_dir.glob("*int4_accumulate_local_partial_tiles*Pipeline*.v"))
    loops = [p for p in loops if any(s in p.name for s in
             ("local_partial_continuous_mac_loop", "debug_group_row_loop"))]
    if len(loops) != 1:
        raise RuntimeError("expected ONE MAC row pipeline, got %s" % loops)
    math_file = loops[0]
    math_text = math_file.read_text(encoding="utf-8")
    math_nets = declarations(math_text)
    math_module = module_name(math_text)
    inst = re.compile(r"\b" + re.escape(math_module) +
                      r"\s+(\w+)\s*\((.*?)\);", re.S)
    matches = list(inst.finditer(parent))
    if len(matches) != 1:
        raise RuntimeError("MAC pipeline instance missing/ambiguous in parent")
    parent = inst.sub(lambda m: math_module + " " + m[1] + " (" + m[2] +
                      ",\n    .o_deep_trigger(o_deep_trigger),\n"
                      "    .o_deep_is_o(o_deep_is_o),\n"
                      "    .o_deep_weight_fire(o_deep_weight_fire),\n"
                      "    .o_deep_weight_index(o_deep_weight_index)\n);", parent, count=1)
    header = re.search(r"\bmodule\s+\w+\s*\((.*?)\);", math_text, re.S)
    math_text = math_text[:header.end() - 2] + (
        ",\n        o_deep_trigger,\n        o_deep_is_o,\n"
        "        o_deep_weight_fire,\n        o_deep_weight_index\n);\n"
        "input o_deep_trigger;\ninput o_deep_is_o;\n"
        "input o_deep_weight_fire;\ninput [19:0] o_deep_weight_index;\n") + math_text[header.end():]
    math_probes = [("o_deep_trigger", 1), ("o_deep_is_o", 1),
                   ("o_deep_weight_fire", 1), ("o_deep_weight_index", 20),
                   ("ap_start", 1), ("ap_done", 1)]
    # Capture enable/bubble/stall state. Operator CE is a clock enable, NOT
    # by itself a transaction-valid flag; preserve these states for alignment.
    for name, width in math_nets.items():
        if (name.startswith("ap_enable_reg_pp0_iter") or
                name in ("ap_block_pp0_stage0", "ap_block_pp0_stage0_11001")):
            math_probes.append((name, width))
    quantized = [name for name, width in math_nets.items() if width == 448 and
                 (name == "quantized" or re.fullmatch(r"quantized_fu_\d+", name))]
    q_alias = ""
    if not quantized:
        # The group-latched versions are often scalarized into 32 signed
        # 14-bit pipeline arguments. Reassemble their bit patterns in lane
        # order; do not substitute the snapshot RAM's output for these args.
        input_names = re.findall(r"(?m)^input\s+\[13:0\]\s+(\w+)\s*;", math_text)
        families = {}
        for name in input_names:
            match = re.fullmatch(r"(.*?)(?:_(\d+))?", name)
            families.setdefault(match[1], {})[int(match[2] or 0)] = name
        complete = [members for members in families.values()
                    if set(members) == set(range(32))]
        if len(complete) == 1:
            quantized = ["o_deep_quantized"]
            q_alias = "wire [447:0] o_deep_quantized = {%s};\n" % ", ".join(
                complete[0][lane] for lane in reversed(range(32)))
    if len(quantized) != 1:
        raise RuntimeError("actual MAC Q register/arguments not unique: %s" % quantized)
    math_probes.append((quantized[0], 448))
    for stem, width in [("act_scale_f", 32), ("global_group", 7), ("row_block", 5)]:
        names = [name for name, w in math_nets.items() if w == width and
                 (name == stem or re.fullmatch(stem + r"_fu_\d+_p\d+", name))]
        if len(names) == 1:
            math_probes.append((names[0], width))

    aliases = q_alias
    operators = []
    instance_pattern = re.compile(r"(?ms)^\s*(\w+)\s*\(\s*\n(.*?)^\s*\);")
    counts = {"sitofp": 0, "fmul": 0, "fadd": 0}
    for match in instance_pattern.finditer(math_text):
        family = next((f for f in counts if match[1].startswith(f + "_")), None)
        if family is None:
            continue
        lane = counts[family]
        counts[family] += 1
        ports = {p[0]: p[1].strip() for p in re.findall(
            r"\.(din0|din1|ce|dout)\s*\(([^()]*)\)", match[2])}
        required_ports = ["din0", "ce", "dout"]
        if family != "sitofp":
            required_ports.insert(1, "din1")
        for port in required_ports:
            if port not in ports:
                raise RuntimeError("operator port missing: %s.%s" % (match[1], port))
            alias = "o_deep_%s%d_%s" % (family, lane, port)
            width = 1 if port == "ce" else 32
            aliases += "wire [%d:0] %s = %s;\n" % (width - 1, alias, ports[port])
            math_probes.append((alias, width))
        operators.append({"instance": match[1], "family": family,
                          "index": lane, "ports": ports})
    if counts["sitofp"] < 4 or counts["fmul"] < 4 or counts["fadd"] < 4:
        raise RuntimeError("expected independent conversion/mul/add operators, got %s" % counts)
    manifest["operators"] = operators
    manifest["quantized_signal"] = quantized[0]
    if q_alias:
        manifest["quantized_lane_arguments"] = [complete[0][lane] for lane in range(32)]
    core = "ila_o_projection_pe0_deep_math"
    manifest["cores"].append(describe(core, math_file, math_probes))
    parent = insert_before_end(parent, canonical_aliases + helper + ila(
        "ila_o_projection_pe0_deep_inputs", ingress_probes))
    math_text = insert_before_end(math_text, aliases + ila(core, math_probes))
    if not dry_run:
        for file, text in [(parent_file, parent), (math_file, math_text)]:
            with file.open("w", encoding="utf-8", newline="\n") as handle:
                handle.write(text)
        with (rtl_dir / "deep_ila_manifest.json").open("w", encoding="utf-8", newline="\n") as handle:
            json.dump(manifest, handle, indent=2)
            handle.write("\n")
        with (rtl_dir / "deep_ila_manifest.tcl").open("w", encoding="utf-8", newline="\n") as handle:
            handle.write("set o_deep_core_specs {\n")
            for core in manifest["cores"]:
                handle.write("    {%s {%s}}\n" % (
                    core["module"], " ".join(map(str, core["widths"]))))
            handle.write("}\n")
    return manifest


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("rtl_dir", type=Path)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()
    result = patch(args.rtl_dir, args.dry_run)
    for core in result["cores"]:
        print("DEEP_ILA %s probes=%d width=%d rtl=%s" % (
            core["module"], len(core["widths"]), sum(core["widths"]), core["rtl"]))
