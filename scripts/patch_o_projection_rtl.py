#!/usr/bin/env python3
"""Instantiate comprehensive PE0 O-projection forensic ILAs in an unpacked XO."""

import argparse
import re
from pathlib import Path


MARKER = "O_PROJECTION_FORENSIC_ILA_V2"
LEGACY_MARKER = "O_PROJECTION_ILA_RTL_INSTANTIATION"


def require_signal(text: str, signal: str) -> None:
    if not re.search(rf"\b{re.escape(signal)}\b", text):
        raise RuntimeError(f"required RTL signal is missing: {signal}")


def instance_suffix(text: str, prefix: str, terminal: str) -> str:
    match = re.search(rf"\b{re.escape(prefix)}_fu_(\d+)_{terminal}\b", text)
    if not match:
        raise RuntimeError(f"cannot resolve RTL instance: {prefix}")
    return f"{prefix}_fu_{match.group(1)}"


def xor_fold(expression: str, width: int) -> str:
    if width % 32:
        raise RuntimeError(f"cannot fold a non-32-bit-aligned bus: {width}")
    return " ^ ".join(
        f"{expression}[{offset + 31}:{offset}]" for offset in range(0, width, 32)
    )


def ila_instance(module: str, instance: str, probes) -> str:
    connections = ["    .clk(ap_clk)"]
    for index, (_, expression, _) in enumerate(probes):
        connections.append(f"    .probe{index}({expression})")
    return (
        '(* DONT_TOUCH = "true" *)\n'
        f"{module} {instance} (\n"
        + ",\n".join(connections)
        + "\n);\n"
    )


def print_probe_map(core: str, probes) -> None:
    for index, (label, expression, width) in enumerate(probes):
        print(
            f"O_ILA_PROBE {core:<7} probe{index:<2} "
            f"width={width:<4} {label:<24} {expression}"
        )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("rtl", type=Path)
    args = parser.parse_args()

    rtl_path = args.rtl.resolve()
    text = rtl_path.read_text(encoding="utf-8")
    if MARKER in text:
        print(f"[OK] forensic ILA RTL instances already present: {rtl_path}")
        return
    if LEGACY_MARKER in text:
        raise RuntimeError("source XO already contains the obsolete narrow O-projection ILA")

    swift = instance_suffix(text, "grp_int4_swiftkv_attention_pe0", "ap_done")
    linear = instance_suffix(text, "grp_int4_linear_local_stage_pe0", "ap_done")
    save = instance_suffix(text, "grp_int4_save_local_projection_0_s", "ap_done")

    fsm_match = re.search(r"\breg\s+\[(\d+):0\]\s+ap_CS_fsm\s*;", text)
    if not fsm_match:
        raise RuntimeError("cannot resolve PE0 parent FSM width")
    fsm_width = int(fsm_match.group(1)) + 1
    if fsm_width == 20:
        fsm_expression = "ap_CS_fsm"
    elif fsm_width < 20:
        fsm_expression = f"{{{20 - fsm_width}'d0, ap_CS_fsm}}"
    else:
        fsm_expression = "ap_CS_fsm[19:0]"

    save_dest = "o_ila_save_dest"
    save_we = "o_ila_save_we"
    save_addr = "o_ila_save_addr"
    save_data = "o_ila_save_data"

    helper_signals = f"""
// Consolidate the four possible save destinations into one forensic channel.
wire [3:0] {save_dest} = {{gate_we1, v_we1, k_we1, q_we1}};
wire {save_we} = |{save_dest};
wire [8:0] {save_addr} = q_we1 ? {{3'd0, {save}_q_address1}} :
                               k_we1 ? {{3'd0, {save}_k_address1}} :
                               v_we1 ? {{3'd0, {save}_v_address1}} :
                               gate_we1 ? {{1'd0, {save}_gate_address1}} : 9'd0;
wire [511:0] {save_data} = q_we1 ? {save}_q_d1 :
                                 k_we1 ? {save}_k_d1 :
                                 v_we1 ? {save}_v_d1 :
                                 gate_we1 ? {save}_gate_d1 : 512'd0;

// Full-bus XOR fingerprints give the control trace visibility into every data
// bit; the data ILA below records the corresponding complete raw buses.
wire [31:0] o_ila_swift_q_fold = {xor_fold(swift + '_activation_q_d1', 448)};
wire [31:0] o_ila_ram_q_write_fold = {xor_fold('activation_q_d1', 448)};
wire [31:0] o_ila_ram_q_read_fold = {xor_fold('activation_q_q0', 448)};
wire [31:0] o_ila_o_output_fold = {xor_fold(linear + '_output_mem_d1', 512)};
wire [31:0] o_ila_projection_read_fold = {xor_fold('projection_q0', 512)};
wire [31:0] o_ila_save_fold = {xor_fold(save_data, 512)};
wire [31:0] o_ila_gmem_write_fold = {xor_fold('m_axi_gmem0_WDATA', 512)};
wire [31:0] o_ila_gmem_read_fold = {xor_fold('m_axi_gmem0_RDATA', 512)};
"""

    control_probes = [
        ("o_start", f"{linear}_ap_start", 1),
        ("o_done", f"{linear}_ap_done", 1),
        ("swiftkv_start", f"{swift}_ap_start", 1),
        ("swiftkv_done", f"{swift}_ap_done", 1),
        ("save_start", f"{save}_ap_start", 1),
        ("save_done", f"{save}_ap_done", 1),
        ("pe0_start", "ap_start", 1),
        ("pe0_done", "ap_done", 1),
        ("parent_fsm", fsm_expression, 20),
        ("swift_q_addr", f"{swift}_activation_q_address1", 7),
        ("swift_q_ce", f"{swift}_activation_q_ce1", 1),
        ("swift_q_we", f"{swift}_activation_q_we1", 1),
        ("swift_q_fold", "o_ila_swift_q_fold", 32),
        ("ram_q_write_addr", "activation_q_address1", 7),
        ("ram_q_write_ce", "activation_q_ce1", 1),
        ("ram_q_write_we", "activation_q_we1", 1),
        ("ram_q_write_fold", "o_ila_ram_q_write_fold", 32),
        ("ram_scale_addr", "activation_scale_address1", 7),
        ("ram_scale_we", "activation_scale_we1", 1),
        ("ram_scale_data", "activation_scale_d1", 8),
        ("o_q_addr", f"{linear}_activation_q_address0", 7),
        ("o_q_ce", "activation_q_ce0", 1),
        ("o_q_fold", "o_ila_ram_q_read_fold", 32),
        ("o_scale_addr", f"{linear}_activation_scale_address0", 7),
        ("o_scale_ce", "activation_scale_ce0", 1),
        ("o_scale_data", "activation_scale_q0", 8),
        ("o_output_addr", f"{linear}_output_mem_address1", 9),
        ("o_output_ce", f"{linear}_output_mem_ce1", 1),
        ("o_output_we", f"{linear}_output_mem_we1", 1),
        ("projection_we", "projection_we1", 1),
        ("o_output_fold", "o_ila_o_output_fold", 32),
        ("projection_read_addr", "projection_address0", 9),
        ("projection_read_ce", "projection_ce0", 1),
        ("projection_read_fold", "o_ila_projection_read_fold", 32),
        ("save_dest", save_dest, 4),
        ("save_addr", save_addr, 9),
        ("save_fold", "o_ila_save_fold", 32),
        ("axi_awvalid", "m_axi_gmem0_AWVALID", 1),
        ("axi_awready", "m_axi_gmem0_AWREADY", 1),
        ("axi_awaddr", "m_axi_gmem0_AWADDR", 64),
        ("axi_wvalid", "m_axi_gmem0_WVALID", 1),
        ("axi_wready", "m_axi_gmem0_WREADY", 1),
        ("axi_wstrb", "m_axi_gmem0_WSTRB", 64),
        ("axi_wlast", "m_axi_gmem0_WLAST", 1),
        ("axi_write_fold", "o_ila_gmem_write_fold", 32),
        ("axi_bvalid", "m_axi_gmem0_BVALID", 1),
        ("axi_bready", "m_axi_gmem0_BREADY", 1),
        ("axi_bresp", "m_axi_gmem0_BRESP", 2),
        ("axi_arvalid", "m_axi_gmem0_ARVALID", 1),
        ("axi_arready", "m_axi_gmem0_ARREADY", 1),
        ("axi_araddr", "m_axi_gmem0_ARADDR", 64),
        ("axi_arlen", "m_axi_gmem0_ARLEN", 32),
        ("axi_rvalid", "m_axi_gmem0_RVALID", 1),
        ("axi_rready", "m_axi_gmem0_RREADY", 1),
        ("axi_rlast", "m_axi_gmem0_RLAST", 1),
        ("axi_rresp", "m_axi_gmem0_RRESP", 2),
        ("axi_read_fold", "o_ila_gmem_read_fold", 32),
    ]

    data_probes = [
        ("o_start", f"{linear}_ap_start", 1),
        ("swift_q_we", f"{swift}_activation_q_we1", 1),
        ("swift_q_data", f"{swift}_activation_q_d1", 448),
        ("ram_q_write_we", "activation_q_we1", 1),
        ("ram_q_write_data", "activation_q_d1", 448),
        ("swift_scale_data", f"{swift}_activation_scale_d1", 8),
        ("ram_scale_data", "activation_scale_d1", 8),
        ("o_q_ce", "activation_q_ce0", 1),
        ("o_q_data", "activation_q_q0", 448),
        ("o_scale_data", "activation_scale_q0", 8),
        ("o_output_we", f"{linear}_output_mem_we1", 1),
        ("o_output_data", f"{linear}_output_mem_d1", 512),
        ("projection_read_ce", "projection_ce0", 1),
        ("projection_read_data", "projection_q0", 512),
        ("save_we", save_we, 1),
        ("save_data", save_data, 512),
        ("axi_wvalid", "m_axi_gmem0_WVALID", 1),
        ("axi_wready", "m_axi_gmem0_WREADY", 1),
        ("axi_wdata", "m_axi_gmem0_WDATA", 512),
        ("axi_rvalid", "m_axi_gmem0_RVALID", 1),
        ("axi_rready", "m_axi_gmem0_RREADY", 1),
        ("axi_rdata", "m_axi_gmem0_RDATA", 512),
        ("parent_fsm", fsm_expression, 20),
    ]

    for _, expression, _ in control_probes + data_probes:
        base_signal = expression.split("[")[0]
        if base_signal.startswith("{") or base_signal.startswith("o_ila_"):
            continue
        require_signal(text, base_signal)

    module_name_match = re.search(r"\bmodule\s+(\w+)\s*\(", text)
    if not module_name_match:
        raise RuntimeError("cannot resolve local-controller module name")
    module_name = module_name_match.group(1)
    end_marker = f"endmodule //{module_name}"
    if end_marker not in text:
        raise RuntimeError(f"cannot find module terminator: {end_marker}")

    insertion = (
        "\n// "
        + MARKER
        + "\n"
        + "// Two synchronized cores provide a control trace and complete raw\n"
        + "// 448/512-bit data visibility across the PE0 O-projection path.\n"
        + helper_signals
        + "\n"
        + ila_instance(
            "ila_o_projection_pe0_control",
            "ila_o_projection_pe0_control_inst",
            control_probes,
        )
        + "\n"
        + ila_instance(
            "ila_o_projection_pe0_data",
            "ila_o_projection_pe0_data_inst",
            data_probes,
        )
        + "\n"
    )
    text = text.replace(end_marker, insertion + end_marker, 1)
    with rtl_path.open("w", encoding="utf-8", newline="\n") as stream:
        stream.write(text)

    print(f"[OK] Instantiated comprehensive PE0 forensic ILAs in {rtl_path}")
    print_probe_map("control", control_probes)
    print_probe_map("data", data_probes)


if __name__ == "__main__":
    main()
