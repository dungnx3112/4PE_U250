from pathlib import Path

import matplotlib.pyplot as plt
from matplotlib.patches import FancyArrowPatch, FancyBboxPatch, Rectangle


OUT = Path("prism-uploads")

NAVY = "#172033"
BLUE = "#dcecff"
BLUE_E = "#1877b9"
GREEN = "#def5e5"
GREEN_E = "#189b55"
YELLOW = "#fff1bf"
ORANGE = "#fff0dc"
ORANGE_E = "#d97706"
PURPLE = "#eee7ff"
PURPLE_E = "#7c3aed"
RED = "#ffe3e3"
RED_E = "#dc2626"
GRAY = "#f4f6f8"
GRAY_E = "#64748b"


def canvas(width, height):
    fig, ax = plt.subplots(figsize=(width, height))
    ax.set_xlim(0, 1)
    ax.set_ylim(0, 1)
    ax.axis("off")
    return fig, ax


def box(ax, x, y, w, h, text, fc=GRAY, ec=GRAY_E, fs=8.0,
        weight="normal", rounded=True, ls="-", lw=1.3, z=2):
    patch = FancyBboxPatch(
        (x, y), w, h,
        boxstyle="round,pad=0.008,rounding_size=0.015" if rounded else "square,pad=0",
        facecolor=fc, edgecolor=ec, linewidth=lw, linestyle=ls, zorder=z,
    )
    ax.add_patch(patch)
    ax.text(x + w / 2, y + h / 2, text, ha="center", va="center",
            fontsize=fs, color=NAVY, weight=weight, zorder=z + 1)
    return patch


def arrow(ax, x1, y1, x2, y2, color=GRAY_E, lw=1.3, style="-|>", z=3):
    ax.add_patch(FancyArrowPatch((x1, y1), (x2, y2), arrowstyle=style,
                                 mutation_scale=10, linewidth=lw,
                                 color=color, zorder=z))


def label(ax, x, y, text, fs=7.5, weight="normal", ha="center", color=NAVY):
    ax.text(x, y, text, ha=ha, va="center", fontsize=fs,
            weight=weight, color=color)


def save(fig, name):
    fig.savefig(OUT / name, bbox_inches="tight", pad_inches=0.03)
    fig.savefig(OUT / name.replace(".pdf", ".png"), dpi=300,
                bbox_inches="tight", pad_inches=0.03)
    plt.close(fig)


def figure1():
    fig, ax = canvas(7.0, 2.8)
    ax.add_patch(Rectangle((0.015, 0.08), 0.97, 0.84, facecolor="white",
                           edgecolor=GRAY_E, linewidth=1.2))
    colors = [(BLUE, "#2563eb"), (GREEN, GREEN_E), (YELLOW, ORANGE_E), (PURPLE, PURPLE_E)]
    for i, (fc, ec) in enumerate(colors):
        x = 0.035 + i * 0.24
        ax.add_patch(Rectangle((x, 0.16), 0.21, 0.68, facecolor=fc,
                               edgecolor=ec, linewidth=1.5))
        label(ax, x + 0.105, 0.77, f"SLR{i}", fs=10, weight="bold")
        box(ax, x + 0.035, 0.48, 0.14, 0.15, f"PE{i}", fc="white", ec=ec,
            fs=11, weight="bold")
        box(ax, x + 0.025, 0.20, 0.16, 0.13, f"DDR{i}\nweights +\npersistent KV",
            fc=ORANGE, ec=ORANGE_E, fs=6.3, weight="bold")
        arrow(ax, x + 0.105, 0.48, x + 0.105, 0.34)
        label(ax, x + 0.112, 0.405, "AXI", fs=6.2, ha="left", color=GRAY_E)
    label(ax, 0.50, 0.885, "Alveo U250: one bank-local PE per SLR", fs=9.2, weight="bold")
    save(fig, "fig1_slr_pe_ddr.pdf")


def figure2():
    fig, ax = canvas(7.0, 3.0)
    box(ax, 0.02, 0.61, 0.16, 0.25,
        "Projection\nmatrix $W$", fc=BLUE, ec=BLUE_E, fs=9, weight="bold")
    arrow(ax, 0.18, 0.735, 0.22, 0.735)
    box(ax, 0.19, 0.57, 0.24, 0.33,
        "$128\\times256$ tile $W_i$\n$S_{w,i}=\\max|W_i|/7$\n"
        "$\\widehat{W}_i=\\mathrm{clip}($\n$\\mathrm{round}(W_i/S_{w,i}),$\n$-7,7)$\none FP16 scale / tile",
        fc=PURPLE, ec=PURPLE_E, fs=6.2, weight="bold")
    arrow(ax, 0.43, 0.735, 0.47, 0.735)
    box(ax, 0.47, 0.57, 0.25, 0.33,
        "PE-consumption order\n\n512-bit word\n4 output rows $\\times$\n32 INT4 positions\n256 consecutive words / tile",
        fc=GREEN, ec=GREEN_E, fs=6.7, weight="bold")
    for i in range(4):
        x = 0.485 + i * 0.055
        box(ax, x, 0.59, 0.05, 0.055, f"r{i}", fc="white", ec=GREEN_E,
            fs=6.2, rounded=False, lw=0.8)
    arrow(ax, 0.72, 0.735, 0.76, 0.735)
    box(ax, 0.76, 0.62, 0.22, 0.23,
        "row-tile striping\n$r\\rightarrow(r\\,\\mathrm{mod}\\,4)$\n"
        "0,4,... $|$ 1,5,...\n2,6,... $|$ 3,7,...",
        fc=YELLOW, ec=ORANGE_E, fs=7.2, weight="bold")
    for i, (fc, ec) in enumerate([(BLUE, "#2563eb"), (GREEN, GREEN_E),
                                  (YELLOW, ORANGE_E), (PURPLE, PURPLE_E)]):
        x = 0.11 + i * 0.22
        box(ax, x, 0.13, 0.18, 0.25,
            f"DDR{i}\nFP16 scales\nseparate metadata\n---\nINT4 payload\n256-word bursts",
            fc=fc, ec=ec, fs=5.9, weight="bold", rounded=False)
        arrow(ax, 0.87, 0.62, x + 0.09, 0.39, color=ec, lw=0.9)
    label(ax, 0.50, 0.06, "Scale reads do not fragment the main unit-stride weight bursts",
          fs=7.2, color=GRAY_E)
    save(fig, "fig2_tile_packing.pdf")


def figure3():
    fig, ax = canvas(3.5, 2.35)
    rows = [("DDR read", BLUE, BLUE_E, 0.70),
            ("Packed MAC", YELLOW, ORANGE_E, 0.43),
            ("Dequantize + write", GREEN, GREEN_E, 0.16)]
    label(ax, 0.02, 0.95, "stage", fs=7, weight="bold", ha="left")
    for name, _, _, y in rows:
        label(ax, 0.02, y + 0.08, name, fs=7.2, weight="bold", ha="left")
    x0, step, bw = 0.25, 0.105, 0.095
    for t in range(6):
        x = x0 + t * step
        ax.plot([x, x], [0.10, 0.91], linestyle="--", color="#cbd5e1", lw=0.7)
        label(ax, x, 0.06, f"$t_{t}$", fs=6.5)
    for tile in range(4):
        box(ax, x0 + tile * step + 0.01, 0.70, bw, 0.16, f"R{tile}",
            fc=BLUE, ec=BLUE_E, fs=7.0, weight="bold", rounded=False)
        box(ax, x0 + (tile + 1) * step + 0.01, 0.43, bw, 0.16, f"M{tile}",
            fc=YELLOW, ec=ORANGE_E, fs=7.0, weight="bold", rounded=False)
        box(ax, x0 + (tile + 2) * step + 0.01, 0.16, bw, 0.16, f"W{tile}",
            fc=GREEN, ec=GREEN_E, fs=7.0, weight="bold", rounded=False)
    label(ax, 0.62, 0.94, "steady state: three successive tiles overlap",
          fs=7.2, weight="bold")
    arrow(ax, 0.355, 0.70, 0.365, 0.60, color=GRAY_E)
    label(ax, 0.36, 0.645, "FIFO", fs=5.8, color=GRAY_E)
    arrow(ax, 0.46, 0.43, 0.47, 0.33, color=GRAY_E)
    label(ax, 0.465, 0.375, "FIFO", fs=5.8, color=GRAY_E)
    save(fig, "fig3_pipeline_overlap.pdf")


def figure4():
    fig, ax = canvas(7.0, 2.65)
    panels = [(0.015, 0.04, 0.28, 0.92), (0.31, 0.04, 0.31, 0.92), (0.635, 0.04, 0.35, 0.92)]
    for x, y, w, h in panels:
        box(ax, x, y, w, h, "", fc="white", ec="#cbd5e1", rounded=True)
    label(ax, 0.04, 0.91, "A  weight packing", fs=8.5, weight="bold", ha="left")
    box(ax, 0.04, 0.68, 0.10, 0.14, "$w_h$\nsigned INT4", fc=RED, ec=RED_E, fs=7.2)
    box(ax, 0.17, 0.68, 0.10, 0.14, "$w_l$\nsigned INT4", fc=PURPLE, ec=PURPLE_E, fs=7.2)
    arrow(ax, 0.09, 0.68, 0.09, 0.59); arrow(ax, 0.22, 0.68, 0.22, 0.59)
    box(ax, 0.045, 0.46, 0.22, 0.12, "$w_p=(w_h\\ll23)+w_l$", fc=GRAY, ec=GRAY_E, fs=8.0)
    arrow(ax, 0.155, 0.46, 0.155, 0.35)
    box(ax, 0.075, 0.20, 0.16, 0.12, "$w_p$\nsigned 27-bit", fc=BLUE, ec="#2563eb", fs=7.3, weight="bold")

    label(ax, 0.335, 0.91, "B  multiply + accumulate", fs=8.3, weight="bold", ha="left")
    box(ax, 0.34, 0.69, 0.11, 0.13, "$w_{p,k}$\nsigned 27-bit", fc=BLUE, ec="#2563eb", fs=7.0)
    box(ax, 0.49, 0.69, 0.10, 0.13, "$x_k$\nsigned A15", fc=YELLOW, ec=ORANGE_E, fs=7.0)
    arrow(ax, 0.395, 0.69, 0.395, 0.60); arrow(ax, 0.54, 0.69, 0.54, 0.60)
    box(ax, 0.35, 0.46, 0.23, 0.13, "DSP48E2\n$q_k=w_{p,k}x_k$", fc=GREEN, ec=GREEN_E,
        fs=7.6, weight="bold")
    arrow(ax, 0.465, 0.46, 0.465, 0.35)
    box(ax, 0.345, 0.19, 0.24, 0.13, "$A_p=\\sum_{k=0}^{31}q_k$\n46-bit accumulator",
        fc=GRAY, ec=GRAY_E, fs=7.2, weight="bold")

    label(ax, 0.655, 0.91, "C  extract + correct", fs=8.2, weight="bold", ha="left")
    box(ax, 0.69, 0.73, 0.24, 0.11, "$A_p$: 46-bit packed accumulator", fc=GRAY, ec=GRAY_E,
        fs=7.0, weight="bold")
    arrow(ax, 0.81, 0.73, 0.72, 0.61); arrow(ax, 0.81, 0.73, 0.91, 0.61)
    box(ax, 0.66, 0.50, 0.16, 0.11, "$D_l=A_p[22{:}0]$", fc=PURPLE, ec=PURPLE_E, fs=7.2)
    box(ax, 0.84, 0.50, 0.13, 0.11, "$D_{h,raw}$\n$=A_p[45{:}23]$", fc=RED, ec=RED_E, fs=6.8)
    box(ax, 0.66, 0.28, 0.14, 0.10, "$D_l[22]$\nsign bit", fc=GRAY, ec=GRAY_E, fs=6.8)
    box(ax, 0.82, 0.28, 0.16, 0.10, "$D_h=D_{h,raw}$\n$+D_l[22]$", fc=RED, ec=RED_E,
        fs=6.8, weight="bold")
    arrow(ax, 0.74, 0.50, 0.73, 0.38); arrow(ax, 0.905, 0.50, 0.90, 0.38)
    arrow(ax, 0.80, 0.33, 0.82, 0.33)
    box(ax, 0.66, 0.10, 0.14, 0.09, "$D_l$\n23-bit", fc=PURPLE, ec=PURPLE_E, fs=6.8, weight="bold")
    box(ax, 0.84, 0.10, 0.13, 0.09, "$D_h$\n23-bit", fc=RED, ec=RED_E, fs=6.8, weight="bold")
    arrow(ax, 0.73, 0.28, 0.73, 0.19); arrow(ax, 0.90, 0.28, 0.90, 0.19)
    save(fig, "fig4_packed_w4a15.pdf")


def figure5():
    fig, ax = canvas(3.5, 5.6)
    label(ax, 0.92, 0.965, "$\\times4$ bank-local engines", fs=7.5, weight="bold", ha="right")
    box(ax, 0.08, 0.86, 0.84, 0.09,
        "8 local heads: $h=4j+p$, $j=0,\\ldots,7$\nrotated $Q$ + current/cached KV records",
        fc=BLUE, ec=BLUE_E, fs=6.6, weight="bold")
    arrow(ax, 0.50, 0.86, 0.50, 0.81)
    box(ax, 0.06, 0.69, 0.88, 0.115,
        "Five-word INT8/G32 record\n$\\{\\mathrm{meta},K0,K1,V0,V1\\}$\n"
        "four 32-value groups; independent 5-bit K/V shifts",
        fc=PURPLE, ec=PURPLE_E, fs=6.3, weight="bold")
    arrow(ax, 0.50, 0.69, 0.27, 0.63); arrow(ax, 0.50, 0.69, 0.74, 0.63)
    box(ax, 0.05, 0.47, 0.42, 0.15,
        "key score path\n16 fixed-point $\\times$ INT8\nshared group shift\n"
        "$s_t=QK_t^{\\mathrm{T}}/\\sqrt{128}$",
        fc=BLUE, ec="#2563eb", fs=6.0, weight="bold")
    box(ax, 0.53, 0.47, 0.42, 0.15,
        "value update path\nlow/high V streams\n2 $\\times$ four-lane engines\n"
        "8 lanes; 16 phases / record",
        fc=GREEN, ec=GREEN_E, fs=6.0, weight="bold")
    arrow(ax, 0.26, 0.47, 0.38, 0.405); arrow(ax, 0.74, 0.47, 0.62, 0.405)
    box(ax, 0.06, 0.22, 0.88, 0.18, "", fc=YELLOW, ec=ORANGE_E)
    label(ax, 0.50, 0.375, "online-softmax hardware state", fs=7.0, weight="bold")
    box(ax, 0.10, 0.285, 0.21, 0.06, "$\\mu$\nrunning max", fc="white", ec=ORANGE_E, fs=6.1)
    box(ax, 0.395, 0.285, 0.21, 0.06, "$Z$\nuQ13.17", fc="white", ec=ORANGE_E, fs=6.1)
    box(ax, 0.69, 0.285, 0.21, 0.06, "$Y[128]$\nsQ15.17", fc="white", ec=ORANGE_E, fs=6.1)
    label(ax, 0.50, 0.247,
          "$c$: uQ1.17; ExpApprox: 33-entry Q30 table\n5-bit index + 12-bit interpolation",
          fs=4.8, color=GRAY_E)
    arrow(ax, 0.50, 0.22, 0.50, 0.17)
    box(ax, 0.10, 0.045, 0.80, 0.12,
        "35-cycle reciprocal $1/Z$\nnormalize $Y/Z$ $\\rightarrow$ four A15/G32 groups\n"
        "gather in global-head order",
        fc=RED, ec=RED_E, fs=6.2, weight="bold")
    save(fig, "fig5_bank_local_attention.pdf")


def figure6():
    fig, ax = canvas(3.5, 4.9)
    # On-chip retention region.
    ax.add_patch(FancyBboxPatch((0.035, 0.08), 0.93, 0.86,
                                boxstyle="round,pad=0.01,rounding_size=0.02",
                                facecolor="#faf7ff", edgecolor=PURPLE_E,
                                linewidth=1.4, linestyle="--"))
    label(ax, 0.50, 0.915, "on-chip retained vectors", fs=7.6, weight="bold")
    box(ax, 0.07, 0.80, 0.22, 0.07, "Q / K / V", fc="white", ec=PURPLE_E, fs=7.0, weight="bold")
    box(ax, 0.325, 0.80, 0.25, 0.07, "FFN intermediate", fc="white", ec=PURPLE_E, fs=6.3, weight="bold")
    box(ax, 0.61, 0.80, 0.22, 0.07, "residual", fc="white", ec=PURPLE_E, fs=7.0, weight="bold")
    # Residual rail stays outside the operator lanes.
    ax.plot([0.90, 0.90], [0.29, 0.835], color=RED_E, lw=1.4)
    arrow(ax, 0.83, 0.835, 0.90, 0.835, color=RED_E, lw=1.2)
    label(ax, 0.91, 0.55, "residual", fs=5.6, color=RED_E, ha="left")

    # Fusion boundary 1.
    box(ax, 0.06, 0.63, 0.23, 0.08, "RMSNorm", fc=BLUE, ec=BLUE_E, fs=7.0, weight="bold")
    box(ax, 0.35, 0.63, 0.20, 0.08, "A15/G32\nquantize", fc=YELLOW, ec=ORANGE_E, fs=6.2, weight="bold")
    box(ax, 0.61, 0.63, 0.23, 0.08, "Q/K/V or Gate/Up\nprojection", fc=GREEN, ec=GREEN_E, fs=5.9, weight="bold")
    arrow(ax, 0.29, 0.67, 0.35, 0.67); arrow(ax, 0.55, 0.67, 0.61, 0.67)
    label(ax, 0.45, 0.595, "producer quantization fused; no FP32 DDR round trip", fs=5.5, color=GRAY_E)

    # Fusion boundary 2.
    box(ax, 0.06, 0.44, 0.23, 0.08, "online attention", fc=BLUE, ec=BLUE_E, fs=6.4, weight="bold")
    box(ax, 0.35, 0.44, 0.20, 0.08, "A15/G32\nquantize", fc=YELLOW, ec=ORANGE_E, fs=6.2, weight="bold")
    box(ax, 0.61, 0.44, 0.23, 0.08, "output projection", fc=GREEN, ec=GREEN_E, fs=6.2, weight="bold")
    arrow(ax, 0.29, 0.48, 0.35, 0.48); arrow(ax, 0.55, 0.48, 0.61, 0.48)
    arrow(ax, 0.84, 0.48, 0.90, 0.48, color=RED_E)
    label(ax, 0.45, 0.405, "residual add fused in output writer", fs=5.6, color=RED_E)

    # Fusion boundary 3.
    box(ax, 0.06, 0.25, 0.23, 0.08, "SwiGLU", fc=BLUE, ec=BLUE_E, fs=6.8, weight="bold")
    box(ax, 0.35, 0.25, 0.20, 0.08, "A15/G32\nquantize", fc=YELLOW, ec=ORANGE_E, fs=6.2, weight="bold")
    box(ax, 0.61, 0.25, 0.23, 0.08, "down projection", fc=GREEN, ec=GREEN_E, fs=6.2, weight="bold")
    arrow(ax, 0.29, 0.29, 0.35, 0.29); arrow(ax, 0.55, 0.29, 0.61, 0.29)
    arrow(ax, 0.84, 0.29, 0.90, 0.29, color=RED_E)
    label(ax, 0.50, 0.115, "DDR traffic retained only for model weights and persistent compressed KV records",
          fs=5.7, color=GRAY_E)
    save(fig, "fig6_fused_boundaries.pdf")


if __name__ == "__main__":
    figure1()
    figure2()
    figure3()
    figure4()
    figure5()
    figure6()