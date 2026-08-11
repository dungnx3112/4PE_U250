; ModuleID = 'C:/KLTN/u250/proj_int4_decoder_xo/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<12>" = type { %"struct.ap_int_base<12, false>" }
%"struct.ap_int_base<12, false>" = type { %"struct.ssdm_int<12, false>" }
%"struct.ssdm_int<12, false>" = type { i12 }
%"struct.ap_uint<512>" = type { %"struct.ap_int_base<512, false>" }
%"struct.ap_int_base<512, false>" = type { %"struct.ssdm_int<512, false>" }
%"struct.ssdm_int<512, false>" = type { i512 }

; Function Attrs: noinline
define void @apatb_int4_decoder_token_controller_ir(%"struct.ap_uint<12>"* nocapture readonly %position, %"struct.ap_uint<512>"* noalias nonnull readonly "maxi" %model_bank0, %"struct.ap_uint<512>"* noalias nonnull readonly "maxi" %model_bank1, %"struct.ap_uint<512>"* noalias nonnull readonly "maxi" %model_bank2, %"struct.ap_uint<512>"* noalias nonnull readonly "maxi" %model_bank3, %"struct.ap_uint<512>"* noalias nocapture nonnull readonly "maxi" %rope_lut_ddr, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %residual_pe0, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %residual_pe1, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %residual_pe2, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %residual_pe3, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %logits_pe0, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %logits_pe1, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %logits_pe2, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %logits_pe3, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %kv_cache_pe0, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %kv_cache_pe1, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %kv_cache_pe2, %"struct.ap_uint<512>"* noalias nocapture nonnull "maxi" %kv_cache_pe3) local_unnamed_addr #0 {
entry:
  %malloccall = call i8* @malloc(i64 834772992)
  %model_bank0_copy = bitcast i8* %malloccall to [13043328 x i512]*
  %malloccall1 = call i8* @malloc(i64 834772992)
  %model_bank1_copy = bitcast i8* %malloccall1 to [13043328 x i512]*
  %malloccall2 = call i8* @malloc(i64 834772992)
  %model_bank2_copy = bitcast i8* %malloccall2 to [13043328 x i512]*
  %malloccall3 = call i8* @malloc(i64 834772992)
  %model_bank3_copy = bitcast i8* %malloccall3 to [13043328 x i512]*
  %malloccall4 = call i8* @malloc(i64 2097152)
  %rope_lut_ddr_copy = bitcast i8* %malloccall4 to [32768 x i512]*
  %malloccall5 = call i8* @malloc(i64 4096)
  %residual_pe0_copy = bitcast i8* %malloccall5 to [64 x i512]*
  %malloccall6 = call i8* @malloc(i64 4096)
  %residual_pe1_copy = bitcast i8* %malloccall6 to [64 x i512]*
  %malloccall7 = call i8* @malloc(i64 4096)
  %residual_pe2_copy = bitcast i8* %malloccall7 to [64 x i512]*
  %malloccall8 = call i8* @malloc(i64 4096)
  %residual_pe3_copy = bitcast i8* %malloccall8 to [64 x i512]*
  %malloccall9 = call i8* @malloc(i64 32256)
  %logits_pe0_copy = bitcast i8* %malloccall9 to [504 x i512]*
  %malloccall10 = call i8* @malloc(i64 32256)
  %logits_pe1_copy = bitcast i8* %malloccall10 to [504 x i512]*
  %malloccall11 = call i8* @malloc(i64 32256)
  %logits_pe2_copy = bitcast i8* %malloccall11 to [504 x i512]*
  %malloccall12 = call i8* @malloc(i64 32256)
  %logits_pe3_copy = bitcast i8* %malloccall12 to [504 x i512]*
  %malloccall13 = call i8* @malloc(i64 335544320)
  %kv_cache_pe0_copy = bitcast i8* %malloccall13 to [5242880 x i512]*
  %malloccall14 = call i8* @malloc(i64 335544320)
  %kv_cache_pe1_copy = bitcast i8* %malloccall14 to [5242880 x i512]*
  %malloccall15 = call i8* @malloc(i64 335544320)
  %kv_cache_pe2_copy = bitcast i8* %malloccall15 to [5242880 x i512]*
  %malloccall16 = call i8* @malloc(i64 335544320)
  %kv_cache_pe3_copy = bitcast i8* %malloccall16 to [5242880 x i512]*
  %0 = bitcast %"struct.ap_uint<512>"* %model_bank0 to [13043328 x %"struct.ap_uint<512>"]*
  %1 = bitcast %"struct.ap_uint<512>"* %model_bank1 to [13043328 x %"struct.ap_uint<512>"]*
  %2 = bitcast %"struct.ap_uint<512>"* %model_bank2 to [13043328 x %"struct.ap_uint<512>"]*
  %3 = bitcast %"struct.ap_uint<512>"* %model_bank3 to [13043328 x %"struct.ap_uint<512>"]*
  %4 = bitcast %"struct.ap_uint<512>"* %rope_lut_ddr to [32768 x %"struct.ap_uint<512>"]*
  %5 = bitcast %"struct.ap_uint<512>"* %residual_pe0 to [64 x %"struct.ap_uint<512>"]*
  %6 = bitcast %"struct.ap_uint<512>"* %residual_pe1 to [64 x %"struct.ap_uint<512>"]*
  %7 = bitcast %"struct.ap_uint<512>"* %residual_pe2 to [64 x %"struct.ap_uint<512>"]*
  %8 = bitcast %"struct.ap_uint<512>"* %residual_pe3 to [64 x %"struct.ap_uint<512>"]*
  %9 = bitcast %"struct.ap_uint<512>"* %logits_pe0 to [504 x %"struct.ap_uint<512>"]*
  %10 = bitcast %"struct.ap_uint<512>"* %logits_pe1 to [504 x %"struct.ap_uint<512>"]*
  %11 = bitcast %"struct.ap_uint<512>"* %logits_pe2 to [504 x %"struct.ap_uint<512>"]*
  %12 = bitcast %"struct.ap_uint<512>"* %logits_pe3 to [504 x %"struct.ap_uint<512>"]*
  %13 = bitcast %"struct.ap_uint<512>"* %kv_cache_pe0 to [5242880 x %"struct.ap_uint<512>"]*
  %14 = bitcast %"struct.ap_uint<512>"* %kv_cache_pe1 to [5242880 x %"struct.ap_uint<512>"]*
  %15 = bitcast %"struct.ap_uint<512>"* %kv_cache_pe2 to [5242880 x %"struct.ap_uint<512>"]*
  %16 = bitcast %"struct.ap_uint<512>"* %kv_cache_pe3 to [5242880 x %"struct.ap_uint<512>"]*
  call fastcc void @copy_in([13043328 x %"struct.ap_uint<512>"]* nonnull %0, [13043328 x i512]* %model_bank0_copy, [13043328 x %"struct.ap_uint<512>"]* nonnull %1, [13043328 x i512]* %model_bank1_copy, [13043328 x %"struct.ap_uint<512>"]* nonnull %2, [13043328 x i512]* %model_bank2_copy, [13043328 x %"struct.ap_uint<512>"]* nonnull %3, [13043328 x i512]* %model_bank3_copy, [32768 x %"struct.ap_uint<512>"]* nonnull %4, [32768 x i512]* %rope_lut_ddr_copy, [64 x %"struct.ap_uint<512>"]* nonnull %5, [64 x i512]* %residual_pe0_copy, [64 x %"struct.ap_uint<512>"]* nonnull %6, [64 x i512]* %residual_pe1_copy, [64 x %"struct.ap_uint<512>"]* nonnull %7, [64 x i512]* %residual_pe2_copy, [64 x %"struct.ap_uint<512>"]* nonnull %8, [64 x i512]* %residual_pe3_copy, [504 x %"struct.ap_uint<512>"]* nonnull %9, [504 x i512]* %logits_pe0_copy, [504 x %"struct.ap_uint<512>"]* nonnull %10, [504 x i512]* %logits_pe1_copy, [504 x %"struct.ap_uint<512>"]* nonnull %11, [504 x i512]* %logits_pe2_copy, [504 x %"struct.ap_uint<512>"]* nonnull %12, [504 x i512]* %logits_pe3_copy, [5242880 x %"struct.ap_uint<512>"]* nonnull %13, [5242880 x i512]* %kv_cache_pe0_copy, [5242880 x %"struct.ap_uint<512>"]* nonnull %14, [5242880 x i512]* %kv_cache_pe1_copy, [5242880 x %"struct.ap_uint<512>"]* nonnull %15, [5242880 x i512]* %kv_cache_pe2_copy, [5242880 x %"struct.ap_uint<512>"]* nonnull %16, [5242880 x i512]* %kv_cache_pe3_copy)
  call void @apatb_int4_decoder_token_controller_hw(%"struct.ap_uint<12>"* %position, [13043328 x i512]* %model_bank0_copy, [13043328 x i512]* %model_bank1_copy, [13043328 x i512]* %model_bank2_copy, [13043328 x i512]* %model_bank3_copy, [32768 x i512]* %rope_lut_ddr_copy, [64 x i512]* %residual_pe0_copy, [64 x i512]* %residual_pe1_copy, [64 x i512]* %residual_pe2_copy, [64 x i512]* %residual_pe3_copy, [504 x i512]* %logits_pe0_copy, [504 x i512]* %logits_pe1_copy, [504 x i512]* %logits_pe2_copy, [504 x i512]* %logits_pe3_copy, [5242880 x i512]* %kv_cache_pe0_copy, [5242880 x i512]* %kv_cache_pe1_copy, [5242880 x i512]* %kv_cache_pe2_copy, [5242880 x i512]* %kv_cache_pe3_copy)
  call void @copy_back([13043328 x %"struct.ap_uint<512>"]* %0, [13043328 x i512]* %model_bank0_copy, [13043328 x %"struct.ap_uint<512>"]* %1, [13043328 x i512]* %model_bank1_copy, [13043328 x %"struct.ap_uint<512>"]* %2, [13043328 x i512]* %model_bank2_copy, [13043328 x %"struct.ap_uint<512>"]* %3, [13043328 x i512]* %model_bank3_copy, [32768 x %"struct.ap_uint<512>"]* %4, [32768 x i512]* %rope_lut_ddr_copy, [64 x %"struct.ap_uint<512>"]* %5, [64 x i512]* %residual_pe0_copy, [64 x %"struct.ap_uint<512>"]* %6, [64 x i512]* %residual_pe1_copy, [64 x %"struct.ap_uint<512>"]* %7, [64 x i512]* %residual_pe2_copy, [64 x %"struct.ap_uint<512>"]* %8, [64 x i512]* %residual_pe3_copy, [504 x %"struct.ap_uint<512>"]* %9, [504 x i512]* %logits_pe0_copy, [504 x %"struct.ap_uint<512>"]* %10, [504 x i512]* %logits_pe1_copy, [504 x %"struct.ap_uint<512>"]* %11, [504 x i512]* %logits_pe2_copy, [504 x %"struct.ap_uint<512>"]* %12, [504 x i512]* %logits_pe3_copy, [5242880 x %"struct.ap_uint<512>"]* %13, [5242880 x i512]* %kv_cache_pe0_copy, [5242880 x %"struct.ap_uint<512>"]* %14, [5242880 x i512]* %kv_cache_pe1_copy, [5242880 x %"struct.ap_uint<512>"]* %15, [5242880 x i512]* %kv_cache_pe2_copy, [5242880 x %"struct.ap_uint<512>"]* %16, [5242880 x i512]* %kv_cache_pe3_copy)
  call void @free(i8* %malloccall)
  call void @free(i8* %malloccall1)
  call void @free(i8* %malloccall2)
  call void @free(i8* %malloccall3)
  call void @free(i8* %malloccall4)
  call void @free(i8* %malloccall5)
  call void @free(i8* %malloccall6)
  call void @free(i8* %malloccall7)
  call void @free(i8* %malloccall8)
  call void @free(i8* %malloccall9)
  call void @free(i8* %malloccall10)
  call void @free(i8* %malloccall11)
  call void @free(i8* %malloccall12)
  call void @free(i8* %malloccall13)
  call void @free(i8* %malloccall14)
  call void @free(i8* %malloccall15)
  call void @free(i8* %malloccall16)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([13043328 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="0", [13043328 x i512]* noalias "unpacked"="1", [13043328 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="2", [13043328 x i512]* noalias "unpacked"="3", [13043328 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="4", [13043328 x i512]* noalias "unpacked"="5", [13043328 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="6", [13043328 x i512]* noalias "unpacked"="7", [32768 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="8", [32768 x i512]* noalias nocapture "unpacked"="9.0", [64 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="10", [64 x i512]* noalias nocapture "unpacked"="11.0", [64 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="12", [64 x i512]* noalias nocapture "unpacked"="13.0", [64 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="14", [64 x i512]* noalias nocapture "unpacked"="15.0", [64 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="16", [64 x i512]* noalias nocapture "unpacked"="17.0", [504 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="18", [504 x i512]* noalias nocapture "unpacked"="19.0", [504 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="20", [504 x i512]* noalias nocapture "unpacked"="21.0", [504 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="22", [504 x i512]* noalias nocapture "unpacked"="23.0", [504 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="24", [504 x i512]* noalias nocapture "unpacked"="25.0", [5242880 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="26", [5242880 x i512]* noalias nocapture "unpacked"="27.0", [5242880 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="28", [5242880 x i512]* noalias nocapture "unpacked"="29.0", [5242880 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="30", [5242880 x i512]* noalias nocapture "unpacked"="31.0", [5242880 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="32", [5242880 x i512]* noalias nocapture "unpacked"="33.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a13043328struct.ap_uint<512>"([13043328 x i512]* %1, [13043328 x %"struct.ap_uint<512>"]* %0)
  call fastcc void @"onebyonecpy_hls.p0a13043328struct.ap_uint<512>"([13043328 x i512]* %3, [13043328 x %"struct.ap_uint<512>"]* %2)
  call fastcc void @"onebyonecpy_hls.p0a13043328struct.ap_uint<512>"([13043328 x i512]* %5, [13043328 x %"struct.ap_uint<512>"]* %4)
  call fastcc void @"onebyonecpy_hls.p0a13043328struct.ap_uint<512>"([13043328 x i512]* %7, [13043328 x %"struct.ap_uint<512>"]* %6)
  call fastcc void @"onebyonecpy_hls.p0a32768struct.ap_uint<512>"([32768 x i512]* %9, [32768 x %"struct.ap_uint<512>"]* %8)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>.1039"([64 x i512]* %11, [64 x %"struct.ap_uint<512>"]* %10)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>.1039"([64 x i512]* %13, [64 x %"struct.ap_uint<512>"]* %12)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>.1039"([64 x i512]* %15, [64 x %"struct.ap_uint<512>"]* %14)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>.1039"([64 x i512]* %17, [64 x %"struct.ap_uint<512>"]* %16)
  call fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>.1002"([504 x i512]* %19, [504 x %"struct.ap_uint<512>"]* %18)
  call fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>.1002"([504 x i512]* %21, [504 x %"struct.ap_uint<512>"]* %20)
  call fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>.1002"([504 x i512]* %23, [504 x %"struct.ap_uint<512>"]* %22)
  call fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>.1002"([504 x i512]* %25, [504 x %"struct.ap_uint<512>"]* %24)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>.968"([5242880 x i512]* %27, [5242880 x %"struct.ap_uint<512>"]* %26)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>.968"([5242880 x i512]* %29, [5242880 x %"struct.ap_uint<512>"]* %28)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>.968"([5242880 x i512]* %31, [5242880 x %"struct.ap_uint<512>"]* %30)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>.968"([5242880 x i512]* %33, [5242880 x %"struct.ap_uint<512>"]* %32)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a13043328struct.ap_uint<512>"([13043328 x %"struct.ap_uint<512>"]* %dst, [13043328 x %"struct.ap_uint<512>"]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [13043328 x %"struct.ap_uint<512>"]* %src, null
  %1 = icmp eq [13043328 x %"struct.ap_uint<512>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [13043328 x %"struct.ap_uint<512>"], [13043328 x %"struct.ap_uint<512>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [13043328 x %"struct.ap_uint<512>"], [13043328 x %"struct.ap_uint<512>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %3, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a32768struct.ap_uint<512>"([32768 x i512]* noalias nocapture "unpacked"="0.0" %dst, [32768 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [32768 x %"struct.ap_uint<512>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32768struct.ap_uint<512>"([32768 x i512]* %dst, [32768 x %"struct.ap_uint<512>"]* nonnull %src, i64 32768)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32768struct.ap_uint<512>"([32768 x i512]* nocapture "unpacked"="0.0" %dst, [32768 x %"struct.ap_uint<512>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32768 x %"struct.ap_uint<512>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [32768 x %"struct.ap_uint<512>"], [32768 x %"struct.ap_uint<512>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [32768 x i512], [32768 x i512]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %1, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5242880struct.ap_uint<512>"([5242880 x %"struct.ap_uint<512>"]* %dst, [5242880 x %"struct.ap_uint<512>"]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [5242880 x %"struct.ap_uint<512>"]* %src, null
  %1 = icmp eq [5242880 x %"struct.ap_uint<512>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [5242880 x %"struct.ap_uint<512>"], [5242880 x %"struct.ap_uint<512>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [5242880 x %"struct.ap_uint<512>"], [5242880 x %"struct.ap_uint<512>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %3, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([13043328 x %"struct.ap_uint<512>"]* noalias "unpacked"="0", [13043328 x i512]* noalias readonly "unpacked"="1", [13043328 x %"struct.ap_uint<512>"]* noalias "unpacked"="2", [13043328 x i512]* noalias readonly "unpacked"="3", [13043328 x %"struct.ap_uint<512>"]* noalias "unpacked"="4", [13043328 x i512]* noalias readonly "unpacked"="5", [13043328 x %"struct.ap_uint<512>"]* noalias "unpacked"="6", [13043328 x i512]* noalias readonly "unpacked"="7", [32768 x %"struct.ap_uint<512>"]* noalias "unpacked"="8", [32768 x i512]* noalias nocapture readonly "unpacked"="9.0", [64 x %"struct.ap_uint<512>"]* noalias "unpacked"="10", [64 x i512]* noalias nocapture readonly "unpacked"="11.0", [64 x %"struct.ap_uint<512>"]* noalias "unpacked"="12", [64 x i512]* noalias nocapture readonly "unpacked"="13.0", [64 x %"struct.ap_uint<512>"]* noalias "unpacked"="14", [64 x i512]* noalias nocapture readonly "unpacked"="15.0", [64 x %"struct.ap_uint<512>"]* noalias "unpacked"="16", [64 x i512]* noalias nocapture readonly "unpacked"="17.0", [504 x %"struct.ap_uint<512>"]* noalias "unpacked"="18", [504 x i512]* noalias nocapture readonly "unpacked"="19.0", [504 x %"struct.ap_uint<512>"]* noalias "unpacked"="20", [504 x i512]* noalias nocapture readonly "unpacked"="21.0", [504 x %"struct.ap_uint<512>"]* noalias "unpacked"="22", [504 x i512]* noalias nocapture readonly "unpacked"="23.0", [504 x %"struct.ap_uint<512>"]* noalias "unpacked"="24", [504 x i512]* noalias nocapture readonly "unpacked"="25.0", [5242880 x %"struct.ap_uint<512>"]* noalias "unpacked"="26", [5242880 x i512]* noalias nocapture readonly "unpacked"="27.0", [5242880 x %"struct.ap_uint<512>"]* noalias "unpacked"="28", [5242880 x i512]* noalias nocapture readonly "unpacked"="29.0", [5242880 x %"struct.ap_uint<512>"]* noalias "unpacked"="30", [5242880 x i512]* noalias nocapture readonly "unpacked"="31.0", [5242880 x %"struct.ap_uint<512>"]* noalias "unpacked"="32", [5242880 x i512]* noalias nocapture readonly "unpacked"="33.0") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a13043328struct.ap_uint<512>.1211"([13043328 x %"struct.ap_uint<512>"]* %0, [13043328 x i512]* %1)
  call fastcc void @"onebyonecpy_hls.p0a13043328struct.ap_uint<512>.1211"([13043328 x %"struct.ap_uint<512>"]* %2, [13043328 x i512]* %3)
  call fastcc void @"onebyonecpy_hls.p0a13043328struct.ap_uint<512>.1211"([13043328 x %"struct.ap_uint<512>"]* %4, [13043328 x i512]* %5)
  call fastcc void @"onebyonecpy_hls.p0a13043328struct.ap_uint<512>.1211"([13043328 x %"struct.ap_uint<512>"]* %6, [13043328 x i512]* %7)
  call fastcc void @"onebyonecpy_hls.p0a32768struct.ap_uint<512>.1065"([32768 x %"struct.ap_uint<512>"]* %8, [32768 x i512]* %9)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>"([64 x %"struct.ap_uint<512>"]* %10, [64 x i512]* %11)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>"([64 x %"struct.ap_uint<512>"]* %12, [64 x i512]* %13)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>"([64 x %"struct.ap_uint<512>"]* %14, [64 x i512]* %15)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>"([64 x %"struct.ap_uint<512>"]* %16, [64 x i512]* %17)
  call fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>"([504 x %"struct.ap_uint<512>"]* %18, [504 x i512]* %19)
  call fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>"([504 x %"struct.ap_uint<512>"]* %20, [504 x i512]* %21)
  call fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>"([504 x %"struct.ap_uint<512>"]* %22, [504 x i512]* %23)
  call fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>"([504 x %"struct.ap_uint<512>"]* %24, [504 x i512]* %25)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>"([5242880 x %"struct.ap_uint<512>"]* %26, [5242880 x i512]* %27)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>"([5242880 x %"struct.ap_uint<512>"]* %28, [5242880 x i512]* %29)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>"([5242880 x %"struct.ap_uint<512>"]* %30, [5242880 x i512]* %31)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>"([5242880 x %"struct.ap_uint<512>"]* %32, [5242880 x i512]* %33)
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>"([5242880 x %"struct.ap_uint<512>"]* noalias "unpacked"="0" %dst, [5242880 x i512]* noalias nocapture readonly "unpacked"="1.0" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [5242880 x %"struct.ap_uint<512>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a5242880struct.ap_uint<512>.964"([5242880 x %"struct.ap_uint<512>"]* nonnull %dst, [5242880 x i512]* %src, i64 5242880)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5242880struct.ap_uint<512>.964"([5242880 x %"struct.ap_uint<512>"]* "unpacked"="0" %dst, [5242880 x i512]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [5242880 x %"struct.ap_uint<512>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [5242880 x i512], [5242880 x i512]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [5242880 x %"struct.ap_uint<512>"], [5242880 x %"struct.ap_uint<512>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %1, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>.968"([5242880 x i512]* noalias nocapture "unpacked"="0.0" %dst, [5242880 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [5242880 x %"struct.ap_uint<512>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a5242880struct.ap_uint<512>.971"([5242880 x i512]* %dst, [5242880 x %"struct.ap_uint<512>"]* nonnull %src, i64 5242880)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a5242880struct.ap_uint<512>.971"([5242880 x i512]* nocapture "unpacked"="0.0" %dst, [5242880 x %"struct.ap_uint<512>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [5242880 x %"struct.ap_uint<512>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [5242880 x %"struct.ap_uint<512>"], [5242880 x %"struct.ap_uint<512>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [5242880 x i512], [5242880 x i512]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %1, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>"([504 x %"struct.ap_uint<512>"]* noalias "unpacked"="0" %dst, [504 x i512]* noalias nocapture readonly "unpacked"="1.0" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [504 x %"struct.ap_uint<512>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a504struct.ap_uint<512>.998"([504 x %"struct.ap_uint<512>"]* nonnull %dst, [504 x i512]* %src, i64 504)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a504struct.ap_uint<512>.998"([504 x %"struct.ap_uint<512>"]* "unpacked"="0" %dst, [504 x i512]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [504 x %"struct.ap_uint<512>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [504 x i512], [504 x i512]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [504 x %"struct.ap_uint<512>"], [504 x %"struct.ap_uint<512>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %1, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>.1002"([504 x i512]* noalias nocapture "unpacked"="0.0" %dst, [504 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [504 x %"struct.ap_uint<512>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a504struct.ap_uint<512>.1005"([504 x i512]* %dst, [504 x %"struct.ap_uint<512>"]* nonnull %src, i64 504)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a504struct.ap_uint<512>.1005"([504 x i512]* nocapture "unpacked"="0.0" %dst, [504 x %"struct.ap_uint<512>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [504 x %"struct.ap_uint<512>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [504 x %"struct.ap_uint<512>"], [504 x %"struct.ap_uint<512>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [504 x i512], [504 x i512]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %1, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>"([64 x %"struct.ap_uint<512>"]* noalias "unpacked"="0" %dst, [64 x i512]* noalias nocapture readonly "unpacked"="1.0" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x %"struct.ap_uint<512>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a64struct.ap_uint<512>.1035"([64 x %"struct.ap_uint<512>"]* nonnull %dst, [64 x i512]* %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64struct.ap_uint<512>.1035"([64 x %"struct.ap_uint<512>"]* "unpacked"="0" %dst, [64 x i512]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x %"struct.ap_uint<512>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [64 x i512], [64 x i512]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [64 x %"struct.ap_uint<512>"], [64 x %"struct.ap_uint<512>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %1, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>.1039"([64 x i512]* noalias nocapture "unpacked"="0.0" %dst, [64 x %"struct.ap_uint<512>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x %"struct.ap_uint<512>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a64struct.ap_uint<512>.1042"([64 x i512]* %dst, [64 x %"struct.ap_uint<512>"]* nonnull %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64struct.ap_uint<512>.1042"([64 x i512]* nocapture "unpacked"="0.0" %dst, [64 x %"struct.ap_uint<512>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x %"struct.ap_uint<512>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [64 x %"struct.ap_uint<512>"], [64 x %"struct.ap_uint<512>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [64 x i512], [64 x i512]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %1, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a32768struct.ap_uint<512>.1065"([32768 x %"struct.ap_uint<512>"]* noalias "unpacked"="0" %dst, [32768 x i512]* noalias nocapture readonly "unpacked"="1.0" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [32768 x %"struct.ap_uint<512>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32768struct.ap_uint<512>.1068"([32768 x %"struct.ap_uint<512>"]* nonnull %dst, [32768 x i512]* %src, i64 32768)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32768struct.ap_uint<512>.1068"([32768 x %"struct.ap_uint<512>"]* "unpacked"="0" %dst, [32768 x i512]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [32768 x %"struct.ap_uint<512>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [32768 x i512], [32768 x i512]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [32768 x %"struct.ap_uint<512>"], [32768 x %"struct.ap_uint<512>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %1, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a13043328struct.ap_uint<512>"([13043328 x i512]* noalias %dst, [13043328 x %"struct.ap_uint<512>"]* noalias readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [13043328 x i512]* %dst, null
  %1 = icmp eq [13043328 x %"struct.ap_uint<512>"]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a13043328struct.ap_uint<512>.1207"([13043328 x i512]* nonnull %dst, [13043328 x %"struct.ap_uint<512>"]* nonnull %src, i64 13043328)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a13043328struct.ap_uint<512>.1207"([13043328 x i512]* %dst, [13043328 x %"struct.ap_uint<512>"]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [13043328 x %"struct.ap_uint<512>"]* %src, null
  %1 = icmp eq [13043328 x i512]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [13043328 x %"struct.ap_uint<512>"], [13043328 x %"struct.ap_uint<512>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [13043328 x i512], [13043328 x i512]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i512, i512* %src.addr.0.0.05, align 64
  store i512 %4, i512* %3, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a13043328struct.ap_uint<512>.1211"([13043328 x %"struct.ap_uint<512>"]* noalias %dst, [13043328 x i512]* noalias readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [13043328 x %"struct.ap_uint<512>"]* %dst, null
  %1 = icmp eq [13043328 x i512]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a13043328struct.ap_uint<512>.1214"([13043328 x %"struct.ap_uint<512>"]* nonnull %dst, [13043328 x i512]* nonnull %src, i64 13043328)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a13043328struct.ap_uint<512>.1214"([13043328 x %"struct.ap_uint<512>"]* %dst, [13043328 x i512]* readonly %src, i64 %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [13043328 x i512]* %src, null
  %1 = icmp eq [13043328 x %"struct.ap_uint<512>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [13043328 x i512], [13043328 x i512]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [13043328 x %"struct.ap_uint<512>"], [13043328 x %"struct.ap_uint<512>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = load i512, i512* %3, align 64
  store i512 %4, i512* %dst.addr.0.0.06, align 64
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_int4_decoder_token_controller_hw(%"struct.ap_uint<12>"*, [13043328 x i512]*, [13043328 x i512]*, [13043328 x i512]*, [13043328 x i512]*, [32768 x i512]*, [64 x i512]*, [64 x i512]*, [64 x i512]*, [64 x i512]*, [504 x i512]*, [504 x i512]*, [504 x i512]*, [504 x i512]*, [5242880 x i512]*, [5242880 x i512]*, [5242880 x i512]*, [5242880 x i512]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([13043328 x %"struct.ap_uint<512>"]* noalias "unpacked"="0", [13043328 x i512]* noalias readonly "unpacked"="1", [13043328 x %"struct.ap_uint<512>"]* noalias "unpacked"="2", [13043328 x i512]* noalias readonly "unpacked"="3", [13043328 x %"struct.ap_uint<512>"]* noalias "unpacked"="4", [13043328 x i512]* noalias readonly "unpacked"="5", [13043328 x %"struct.ap_uint<512>"]* noalias "unpacked"="6", [13043328 x i512]* noalias readonly "unpacked"="7", [32768 x %"struct.ap_uint<512>"]* noalias "unpacked"="8", [32768 x i512]* noalias nocapture readonly "unpacked"="9.0", [64 x %"struct.ap_uint<512>"]* noalias "unpacked"="10", [64 x i512]* noalias nocapture readonly "unpacked"="11.0", [64 x %"struct.ap_uint<512>"]* noalias "unpacked"="12", [64 x i512]* noalias nocapture readonly "unpacked"="13.0", [64 x %"struct.ap_uint<512>"]* noalias "unpacked"="14", [64 x i512]* noalias nocapture readonly "unpacked"="15.0", [64 x %"struct.ap_uint<512>"]* noalias "unpacked"="16", [64 x i512]* noalias nocapture readonly "unpacked"="17.0", [504 x %"struct.ap_uint<512>"]* noalias "unpacked"="18", [504 x i512]* noalias nocapture readonly "unpacked"="19.0", [504 x %"struct.ap_uint<512>"]* noalias "unpacked"="20", [504 x i512]* noalias nocapture readonly "unpacked"="21.0", [504 x %"struct.ap_uint<512>"]* noalias "unpacked"="22", [504 x i512]* noalias nocapture readonly "unpacked"="23.0", [504 x %"struct.ap_uint<512>"]* noalias "unpacked"="24", [504 x i512]* noalias nocapture readonly "unpacked"="25.0", [5242880 x %"struct.ap_uint<512>"]* noalias "unpacked"="26", [5242880 x i512]* noalias nocapture readonly "unpacked"="27.0", [5242880 x %"struct.ap_uint<512>"]* noalias "unpacked"="28", [5242880 x i512]* noalias nocapture readonly "unpacked"="29.0", [5242880 x %"struct.ap_uint<512>"]* noalias "unpacked"="30", [5242880 x i512]* noalias nocapture readonly "unpacked"="31.0", [5242880 x %"struct.ap_uint<512>"]* noalias "unpacked"="32", [5242880 x i512]* noalias nocapture readonly "unpacked"="33.0") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>"([64 x %"struct.ap_uint<512>"]* %10, [64 x i512]* %11)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>"([64 x %"struct.ap_uint<512>"]* %12, [64 x i512]* %13)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>"([64 x %"struct.ap_uint<512>"]* %14, [64 x i512]* %15)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<512>"([64 x %"struct.ap_uint<512>"]* %16, [64 x i512]* %17)
  call fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>"([504 x %"struct.ap_uint<512>"]* %18, [504 x i512]* %19)
  call fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>"([504 x %"struct.ap_uint<512>"]* %20, [504 x i512]* %21)
  call fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>"([504 x %"struct.ap_uint<512>"]* %22, [504 x i512]* %23)
  call fastcc void @"onebyonecpy_hls.p0a504struct.ap_uint<512>"([504 x %"struct.ap_uint<512>"]* %24, [504 x i512]* %25)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>"([5242880 x %"struct.ap_uint<512>"]* %26, [5242880 x i512]* %27)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>"([5242880 x %"struct.ap_uint<512>"]* %28, [5242880 x i512]* %29)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>"([5242880 x %"struct.ap_uint<512>"]* %30, [5242880 x i512]* %31)
  call fastcc void @"onebyonecpy_hls.p0a5242880struct.ap_uint<512>"([5242880 x %"struct.ap_uint<512>"]* %32, [5242880 x i512]* %33)
  ret void
}

define void @int4_decoder_token_controller_hw_stub_wrapper(%"struct.ap_uint<12>"*, [13043328 x i512]*, [13043328 x i512]*, [13043328 x i512]*, [13043328 x i512]*, [32768 x i512]*, [64 x i512]*, [64 x i512]*, [64 x i512]*, [64 x i512]*, [504 x i512]*, [504 x i512]*, [504 x i512]*, [504 x i512]*, [5242880 x i512]*, [5242880 x i512]*, [5242880 x i512]*, [5242880 x i512]*) #5 {
entry:
  %malloccall = tail call i8* @malloc(i64 834772992)
  %18 = bitcast i8* %malloccall to [13043328 x %"struct.ap_uint<512>"]*
  %malloccall1 = tail call i8* @malloc(i64 834772992)
  %19 = bitcast i8* %malloccall1 to [13043328 x %"struct.ap_uint<512>"]*
  %malloccall2 = tail call i8* @malloc(i64 834772992)
  %20 = bitcast i8* %malloccall2 to [13043328 x %"struct.ap_uint<512>"]*
  %malloccall3 = tail call i8* @malloc(i64 834772992)
  %21 = bitcast i8* %malloccall3 to [13043328 x %"struct.ap_uint<512>"]*
  %malloccall4 = tail call i8* @malloc(i64 2097152)
  %22 = bitcast i8* %malloccall4 to [32768 x %"struct.ap_uint<512>"]*
  %malloccall5 = tail call i8* @malloc(i64 4096)
  %23 = bitcast i8* %malloccall5 to [64 x %"struct.ap_uint<512>"]*
  %malloccall6 = tail call i8* @malloc(i64 4096)
  %24 = bitcast i8* %malloccall6 to [64 x %"struct.ap_uint<512>"]*
  %malloccall7 = tail call i8* @malloc(i64 4096)
  %25 = bitcast i8* %malloccall7 to [64 x %"struct.ap_uint<512>"]*
  %malloccall8 = tail call i8* @malloc(i64 4096)
  %26 = bitcast i8* %malloccall8 to [64 x %"struct.ap_uint<512>"]*
  %malloccall9 = tail call i8* @malloc(i64 32256)
  %27 = bitcast i8* %malloccall9 to [504 x %"struct.ap_uint<512>"]*
  %malloccall10 = tail call i8* @malloc(i64 32256)
  %28 = bitcast i8* %malloccall10 to [504 x %"struct.ap_uint<512>"]*
  %malloccall11 = tail call i8* @malloc(i64 32256)
  %29 = bitcast i8* %malloccall11 to [504 x %"struct.ap_uint<512>"]*
  %malloccall12 = tail call i8* @malloc(i64 32256)
  %30 = bitcast i8* %malloccall12 to [504 x %"struct.ap_uint<512>"]*
  %malloccall13 = tail call i8* @malloc(i64 335544320)
  %31 = bitcast i8* %malloccall13 to [5242880 x %"struct.ap_uint<512>"]*
  %malloccall14 = tail call i8* @malloc(i64 335544320)
  %32 = bitcast i8* %malloccall14 to [5242880 x %"struct.ap_uint<512>"]*
  %malloccall15 = tail call i8* @malloc(i64 335544320)
  %33 = bitcast i8* %malloccall15 to [5242880 x %"struct.ap_uint<512>"]*
  %malloccall16 = tail call i8* @malloc(i64 335544320)
  %34 = bitcast i8* %malloccall16 to [5242880 x %"struct.ap_uint<512>"]*
  call void @copy_out([13043328 x %"struct.ap_uint<512>"]* %18, [13043328 x i512]* %1, [13043328 x %"struct.ap_uint<512>"]* %19, [13043328 x i512]* %2, [13043328 x %"struct.ap_uint<512>"]* %20, [13043328 x i512]* %3, [13043328 x %"struct.ap_uint<512>"]* %21, [13043328 x i512]* %4, [32768 x %"struct.ap_uint<512>"]* %22, [32768 x i512]* %5, [64 x %"struct.ap_uint<512>"]* %23, [64 x i512]* %6, [64 x %"struct.ap_uint<512>"]* %24, [64 x i512]* %7, [64 x %"struct.ap_uint<512>"]* %25, [64 x i512]* %8, [64 x %"struct.ap_uint<512>"]* %26, [64 x i512]* %9, [504 x %"struct.ap_uint<512>"]* %27, [504 x i512]* %10, [504 x %"struct.ap_uint<512>"]* %28, [504 x i512]* %11, [504 x %"struct.ap_uint<512>"]* %29, [504 x i512]* %12, [504 x %"struct.ap_uint<512>"]* %30, [504 x i512]* %13, [5242880 x %"struct.ap_uint<512>"]* %31, [5242880 x i512]* %14, [5242880 x %"struct.ap_uint<512>"]* %32, [5242880 x i512]* %15, [5242880 x %"struct.ap_uint<512>"]* %33, [5242880 x i512]* %16, [5242880 x %"struct.ap_uint<512>"]* %34, [5242880 x i512]* %17)
  %35 = bitcast [13043328 x %"struct.ap_uint<512>"]* %18 to %"struct.ap_uint<512>"*
  %36 = bitcast [13043328 x %"struct.ap_uint<512>"]* %19 to %"struct.ap_uint<512>"*
  %37 = bitcast [13043328 x %"struct.ap_uint<512>"]* %20 to %"struct.ap_uint<512>"*
  %38 = bitcast [13043328 x %"struct.ap_uint<512>"]* %21 to %"struct.ap_uint<512>"*
  %39 = bitcast [32768 x %"struct.ap_uint<512>"]* %22 to %"struct.ap_uint<512>"*
  %40 = bitcast [64 x %"struct.ap_uint<512>"]* %23 to %"struct.ap_uint<512>"*
  %41 = bitcast [64 x %"struct.ap_uint<512>"]* %24 to %"struct.ap_uint<512>"*
  %42 = bitcast [64 x %"struct.ap_uint<512>"]* %25 to %"struct.ap_uint<512>"*
  %43 = bitcast [64 x %"struct.ap_uint<512>"]* %26 to %"struct.ap_uint<512>"*
  %44 = bitcast [504 x %"struct.ap_uint<512>"]* %27 to %"struct.ap_uint<512>"*
  %45 = bitcast [504 x %"struct.ap_uint<512>"]* %28 to %"struct.ap_uint<512>"*
  %46 = bitcast [504 x %"struct.ap_uint<512>"]* %29 to %"struct.ap_uint<512>"*
  %47 = bitcast [504 x %"struct.ap_uint<512>"]* %30 to %"struct.ap_uint<512>"*
  %48 = bitcast [5242880 x %"struct.ap_uint<512>"]* %31 to %"struct.ap_uint<512>"*
  %49 = bitcast [5242880 x %"struct.ap_uint<512>"]* %32 to %"struct.ap_uint<512>"*
  %50 = bitcast [5242880 x %"struct.ap_uint<512>"]* %33 to %"struct.ap_uint<512>"*
  %51 = bitcast [5242880 x %"struct.ap_uint<512>"]* %34 to %"struct.ap_uint<512>"*
  call void @int4_decoder_token_controller_hw_stub(%"struct.ap_uint<12>"* %0, %"struct.ap_uint<512>"* %35, %"struct.ap_uint<512>"* %36, %"struct.ap_uint<512>"* %37, %"struct.ap_uint<512>"* %38, %"struct.ap_uint<512>"* %39, %"struct.ap_uint<512>"* %40, %"struct.ap_uint<512>"* %41, %"struct.ap_uint<512>"* %42, %"struct.ap_uint<512>"* %43, %"struct.ap_uint<512>"* %44, %"struct.ap_uint<512>"* %45, %"struct.ap_uint<512>"* %46, %"struct.ap_uint<512>"* %47, %"struct.ap_uint<512>"* %48, %"struct.ap_uint<512>"* %49, %"struct.ap_uint<512>"* %50, %"struct.ap_uint<512>"* %51)
  call void @copy_in([13043328 x %"struct.ap_uint<512>"]* %18, [13043328 x i512]* %1, [13043328 x %"struct.ap_uint<512>"]* %19, [13043328 x i512]* %2, [13043328 x %"struct.ap_uint<512>"]* %20, [13043328 x i512]* %3, [13043328 x %"struct.ap_uint<512>"]* %21, [13043328 x i512]* %4, [32768 x %"struct.ap_uint<512>"]* %22, [32768 x i512]* %5, [64 x %"struct.ap_uint<512>"]* %23, [64 x i512]* %6, [64 x %"struct.ap_uint<512>"]* %24, [64 x i512]* %7, [64 x %"struct.ap_uint<512>"]* %25, [64 x i512]* %8, [64 x %"struct.ap_uint<512>"]* %26, [64 x i512]* %9, [504 x %"struct.ap_uint<512>"]* %27, [504 x i512]* %10, [504 x %"struct.ap_uint<512>"]* %28, [504 x i512]* %11, [504 x %"struct.ap_uint<512>"]* %29, [504 x i512]* %12, [504 x %"struct.ap_uint<512>"]* %30, [504 x i512]* %13, [5242880 x %"struct.ap_uint<512>"]* %31, [5242880 x i512]* %14, [5242880 x %"struct.ap_uint<512>"]* %32, [5242880 x i512]* %15, [5242880 x %"struct.ap_uint<512>"]* %33, [5242880 x i512]* %16, [5242880 x %"struct.ap_uint<512>"]* %34, [5242880 x i512]* %17)
  ret void
}

declare void @int4_decoder_token_controller_hw_stub(%"struct.ap_uint<12>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*, %"struct.ap_uint<512>"*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
