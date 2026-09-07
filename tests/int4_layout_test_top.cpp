#include "int4_decoder_schedule.hpp"
#include "int4_model_layout.hpp"

// Small synthesizable wrapper used by C simulation.  The unit test exercises
// the inline layout helpers directly; this top keeps the HLS project valid.
int int4_layout_test_top(int layer, int mode) {
    return int4_weight_offset(layer, mode) +
           int4_weight_scale_offset(layer, mode) +
           int4_decoder_stage_count(layer);
}
