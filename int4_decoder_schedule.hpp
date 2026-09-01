#pragma once

#include "int4_model_layout.hpp"

// Every PE and every reduction service walks this fixed schedule locally.
// Keeping the schedule definition in one header prevents a central mode/state
// bus while guaranteeing that all independently synthesized controllers stay
// in lock-step through their blocking data streams.
static constexpr int INT4_DECODER_STAGES_PER_LAYER = 7;
static constexpr int INT4_DECODER_SCHEDULE_LAYERS = INT4_NUM_LAYERS + 1;
static constexpr int INT4_DECODER_LINEAR_STAGES =
    INT4_NUM_LAYERS * INT4_DECODER_STAGES_PER_LAYER + 1;
static constexpr int INT4_DECODER_RMS_STAGES = INT4_NUM_LAYERS * 2 + 1;

static_assert(INT4_DECODER_LINEAR_STAGES == 225,
              "unexpected decoder linear schedule length");
static_assert(INT4_DECODER_RMS_STAGES == 65,
              "unexpected decoder RMS schedule length");

static inline bool int4_decoder_is_logits_layer(int schedule_layer) {
#pragma HLS INLINE
    return schedule_layer == INT4_NUM_LAYERS;
}

static inline int int4_decoder_stage_count(int schedule_layer) {
#pragma HLS INLINE
    return int4_decoder_is_logits_layer(schedule_layer)
        ? 1
        : INT4_DECODER_STAGES_PER_LAYER;
}

static inline ap_uint<3> int4_decoder_stage_mode(
    int schedule_layer,
    int stage) {
#pragma HLS INLINE
    return int4_decoder_is_logits_layer(schedule_layer)
        ? (ap_uint<3>)INT4_LINEAR_LOGITS
        : (ap_uint<3>)stage;
}

static inline int int4_decoder_model_layer(int schedule_layer) {
#pragma HLS INLINE
    return int4_decoder_is_logits_layer(schedule_layer)
        ? 0
        : schedule_layer;
}
