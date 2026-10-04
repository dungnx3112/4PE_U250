#!/usr/bin/env python3
"""Instantiate the O-projection ILA in an unpacked PE0 HLS IP."""

import argparse
import re
from pathlib import Path


MARKER = "O_PROJECTION_ILA_RTL_INSTANTIATION"


def require_signal(text: str, signal: str) -> None:
    if not re.search(rf"\b{re.escape(signal)}\b", text):
        raise RuntimeError(f"required RTL signal is missing: {signal}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("rtl", type=Path)
    args = parser.parse_args()

    rtl_path = args.rtl.resolve()
    text = rtl_path.read_text(encoding="utf-8")
    if MARKER in text:
        print(f"[OK] ILA RTL instance already present: {rtl_path}")
        return

    swift_match = re.search(
        r"\bgrp_int4_swiftkv_attention_pe0_fu_(\d+)_ap_done\b", text
    )
    linear_match = re.search(
        r"\bgrp_int4_linear_local_stage_pe0_fu_(\d+)_ap_start\b", text
    )
    if not swift_match or not linear_match:
        raise RuntimeError("cannot resolve PE0 SwiftKV/O-projection RTL instances")

    swift = f"grp_int4_swiftkv_attention_pe0_fu_{swift_match.group(1)}"
    linear = f"grp_int4_linear_local_stage_pe0_fu_{linear_match.group(1)}"

    probes = [
        ("o_start", f"{linear}_ap_start", 1),
        ("swiftkv_start", f"{swift}_ap_start", 1),
        ("swiftkv_done", f"{swift}_ap_done", 1),
        ("writer_q_addr", f"{swift}_activation_q_address1", 7),
        ("writer_q_ce", f"{swift}_activation_q_ce1", 1),
        ("writer_q_we", f"{swift}_activation_q_we1", 1),
        ("writer_q_data", f"{swift}_activation_q_d1[31:0]", 32),
        ("writer_scale_addr", f"{swift}_activation_scale_address1", 7),
        ("writer_scale_ce", f"{swift}_activation_scale_ce1", 1),
        ("writer_scale_we", f"{swift}_activation_scale_we1", 1),
        ("writer_scale_data", f"{swift}_activation_scale_d1", 8),
        ("o_q_addr", f"{linear}_activation_q_address0", 7),
        ("o_q_ce", "activation_q_ce0", 1),
        ("o_q_data", "activation_q_q0[31:0]", 32),
        ("o_scale_addr", f"{linear}_activation_scale_address0", 7),
        ("o_scale_ce", "activation_scale_ce0", 1),
        ("o_scale_data", "activation_scale_q0", 8),
        ("o_output_addr", f"{linear}_output_mem_address1", 9),
        ("o_output_we", "projection_we1", 1),
        ("o_output_data", f"{linear}_output_mem_d1[31:0]", 32),
    ]

    for _, expression, _ in probes:
        require_signal(text, expression.split("[")[0])

    module_name_match = re.search(r"\bmodule\s+(\w+)\s*\(", text)
    if not module_name_match:
        raise RuntimeError("cannot resolve local-controller module name")
    module_name = module_name_match.group(1)
    end_marker = f"endmodule //{module_name}"
    if end_marker not in text:
        raise RuntimeError(f"cannot find module terminator: {end_marker}")

    connections = ["    .clk(ap_clk)"]
    for index, (_, expression, _) in enumerate(probes):
        connections.append(f"    .probe{index}({expression})")

    instance = (
        "\n// "
        + MARKER
        + "\n"
        + "// probe0 (o_start) is the recommended trigger. The remaining\n"
        + "// probes span the SwiftKV writer, activation BRAM read, and O output.\n"
        + "(* DONT_TOUCH = \"true\" *)\n"
        + "ila_o_projection_pe0 ila_o_projection_pe0_inst (\n"
        + ",\n".join(connections)
        + "\n);\n\n"
    )
    text = text.replace(end_marker, instance + end_marker, 1)
    with rtl_path.open("w", encoding="utf-8", newline="\n") as stream:
        stream.write(text)

    print(f"[OK] Instantiated ila_o_projection_pe0 in {rtl_path}")
    for index, (label, expression, width) in enumerate(probes):
        print(f"O_ILA_PROBE probe{index:<2} width={width:<2} {label:<20} {expression}")


if __name__ == "__main__":
    main()
