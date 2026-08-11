<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" projectType="C/C++" top="int4_decoder_token_controller" name="proj_int4_decoder_xo">
    <files>
        <file name="source/swiftkv_attention.cpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/int4_weight_packer.cpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/int4_linear_controller.cpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/int4_decoder_controller.cpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/int4_decoder_blocks.cpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/gemv_tile_pe.cpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/gemv2_pack_bench.cpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/swiftkv_attention.hpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/int4_weight_packer.hpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/int4_model_layout.hpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/int4_linear_controller.hpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/int4_decoder_controller.hpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/int4_decoder_blocks.hpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/gemv_tile_pe.hpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
        <file name="source/gemv2_pack_bench.hpp" sc="0" tb="false" cflags="-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_INTEGRATED_TOP -DSWIFTKV_INTEGRATED_TOP" csimflags="" blackbox="false"/>
    </files>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
</AutoPilot:project>

