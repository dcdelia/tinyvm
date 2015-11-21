; ModuleID = 'mcomp.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.MV = type { i16, i16 }
%union.int_mv = type { i32 }
%struct.macroblock = type { [400 x i16], [400 x i16], [256 x i8], i8*, [25 x %struct.block], %struct.yv12_buffer_config, [8 x i8], %struct.macroblockd, %struct.PARTITION_INFO*, %struct.PARTITION_INFO*, %struct.PARTITION_INFO*, [4 x i32], %struct.search_site*, i32, i32, i32, i32, i32, i32, i32, i32*, i32*, i32, i32, [2 x i32*], [2 x i32*], [10 x i32]*, [10 x i32]*, [10 x [10 x i32]]*, i32*, [8 x [3 x [12 x i32]]]*, i32, i32, i32, i32, i32, i32, i8*, i8*, %struct.mv_context*, i32, i32, i32, %union.int_mv, i32, i32, i8, i32, [4 x [8 x [3 x [12 x i32]]]], [2 x [2047 x i32]], [5 x i32], [4 x i32], i64, i64, [4 x i32], [20 x i32], [20 x i32], i32, [20 x i32], i32, i32, i32, i32, i32, [1024 x i32], void (i16*, i16*, i32)*, void (i16*, i16*, i32)*, void (i16*, i16*, i32)*, void (%struct.block*, %struct.blockd*)*, void (%struct.block*, %struct.block*, %struct.blockd*, %struct.blockd*)*, [16 x i8] }
%struct.block = type { i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16, i8**, i32, i32 }
%struct.yv12_buffer_config = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i8*, i8*, i8*, i32, i32, i32, i32, i32 }
%struct.macroblockd = type { [384 x i8], [400 x i16], [400 x i16], [25 x i8], [7 x i8], [16 x i16], [16 x i16], [16 x i16], [16 x i16], [25 x %struct.blockd], i32, %struct.yv12_buffer_config, %struct.yv12_buffer_config, %struct.modeinfo*, i32, i32, i32, i32, [3 x i8*], [3 x i8*], [2 x i32], %struct.ENTROPY_CONTEXT_PLANES*, %struct.ENTROPY_CONTEXT_PLANES*, i8, i8, i8, i8, [3 x i8], [2 x [4 x i8]], i8, i8, [4 x i8], [4 x i8], [4 x i8], [4 x i8], i32, i32, i32, i32, void (i8*, i32, i32, i32, i8*, i32)*, void (i8*, i32, i32, i32, i8*, i32)*, void (i8*, i32, i32, i32, i8*, i32)*, void (i8*, i32, i32, i32, i8*, i32)*, i8*, i32, [12 x i8], [704 x i8] }
%struct.blockd = type { i16*, i16*, i8*, i16*, i32, i8*, %union.b_mode_info }
%union.b_mode_info = type { i32 }
%struct.modeinfo = type { %struct.MB_MODE_INFO, [16 x %union.b_mode_info] }
%struct.MB_MODE_INFO = type { i8, i8, i8, i8, %union.int_mv, i8, i8, i8, i8 }
%struct.ENTROPY_CONTEXT_PLANES = type { [4 x i8], [2 x i8], [2 x i8], i8 }
%struct.PARTITION_INFO = type { i32, [16 x %struct.anon] }
%struct.anon = type { i32, %union.int_mv }
%struct.search_site = type { %struct.MV, i32 }
%struct.mv_context = type { [19 x i8] }
%struct.variance_vtable = type { i32 (i8*, i32, i8*, i32, i32)*, i32 (i8*, i32, i8*, i32, i32*)*, i32 (i8*, i32, i32, i32, i8*, i32, i32*)*, i32 (i8*, i32, i8*, i32, i32*)*, i32 (i8*, i32, i8*, i32, i32*)*, i32 (i8*, i32, i8*, i32, i32*)*, void (i8*, i32, i8*, i32, i32*)*, void (i8*, i32, i8*, i32, i16*)*, void (i8*, i32, i8**, i32, i32*)*, void (i8*, i32, i8*, i32, i32)* }

@vp8_hex_search.hex = private unnamed_addr constant [6 x %struct.MV] [%struct.MV { i16 -1, i16 -2 }, %struct.MV { i16 1, i16 -2 }, %struct.MV { i16 2, i16 0 }, %struct.MV { i16 1, i16 2 }, %struct.MV { i16 -1, i16 2 }, %struct.MV { i16 -2, i16 0 }], align 16
@vp8_hex_search.neighbors = private unnamed_addr constant [4 x %struct.MV] [%struct.MV { i16 0, i16 -1 }, %struct.MV { i16 -1, i16 0 }, %struct.MV { i16 1, i16 0 }, %struct.MV { i16 0, i16 1 }], align 16
@next_chkpts = internal constant [6 x [3 x %struct.MV]] [[3 x %struct.MV] [%struct.MV { i16 -2, i16 0 }, %struct.MV { i16 -1, i16 -2 }, %struct.MV { i16 1, i16 -2 }], [3 x %struct.MV] [%struct.MV { i16 -1, i16 -2 }, %struct.MV { i16 1, i16 -2 }, %struct.MV { i16 2, i16 0 }], [3 x %struct.MV] [%struct.MV { i16 1, i16 -2 }, %struct.MV { i16 2, i16 0 }, %struct.MV { i16 1, i16 2 }], [3 x %struct.MV] [%struct.MV { i16 2, i16 0 }, %struct.MV { i16 1, i16 2 }, %struct.MV { i16 -1, i16 2 }], [3 x %struct.MV] [%struct.MV { i16 1, i16 2 }, %struct.MV { i16 -1, i16 2 }, %struct.MV { i16 -2, i16 0 }], [3 x %struct.MV] [%struct.MV { i16 -1, i16 2 }, %struct.MV { i16 -2, i16 0 }, %struct.MV { i16 -1, i16 -2 }]], align 16
@vp8_refining_search_sad_c.neighbors = private unnamed_addr constant [4 x %struct.MV] [%struct.MV { i16 -1, i16 0 }, %struct.MV { i16 0, i16 -1 }, %struct.MV { i16 0, i16 1 }, %struct.MV { i16 1, i16 0 }], align 16
@vp8_refining_search_sadx4.neighbors = private unnamed_addr constant [4 x %struct.MV] [%struct.MV { i16 -1, i16 0 }, %struct.MV { i16 0, i16 -1 }, %struct.MV { i16 0, i16 1 }, %struct.MV { i16 1, i16 0 }], align 16

; Function Attrs: nounwind uwtable
define i32 @vp8_mv_bit_cost(%union.int_mv* %mv, %union.int_mv* %ref, i32** %mvcost, i32 %Weight) #0 {
  %1 = bitcast %union.int_mv* %mv to %struct.MV*
  %2 = getelementptr inbounds %struct.MV* %1, i32 0, i32 0
  %3 = load i16* %2, align 2
  %4 = sext i16 %3 to i32
  %5 = bitcast %union.int_mv* %ref to %struct.MV*
  %6 = getelementptr inbounds %struct.MV* %5, i32 0, i32 0
  %7 = load i16* %6, align 2
  %8 = sext i16 %7 to i32
  %9 = sub nsw i32 %4, %8
  %10 = ashr i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32** %mvcost, i64 0
  %13 = load i32** %12, align 8
  %14 = getelementptr inbounds i32* %13, i64 %11
  %15 = load i32* %14, align 4
  %16 = bitcast %union.int_mv* %mv to %struct.MV*
  %17 = getelementptr inbounds %struct.MV* %16, i32 0, i32 1
  %18 = load i16* %17, align 2
  %19 = sext i16 %18 to i32
  %20 = bitcast %union.int_mv* %ref to %struct.MV*
  %21 = getelementptr inbounds %struct.MV* %20, i32 0, i32 1
  %22 = load i16* %21, align 2
  %23 = sext i16 %22 to i32
  %24 = sub nsw i32 %19, %23
  %25 = ashr i32 %24, 1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32** %mvcost, i64 1
  %28 = load i32** %27, align 8
  %29 = getelementptr inbounds i32* %28, i64 %26
  %30 = load i32* %29, align 4
  %31 = add nsw i32 %15, %30
  %32 = mul nsw i32 %31, %Weight
  %33 = ashr i32 %32, 7
  ret i32 %33
}

; Function Attrs: nounwind uwtable
define void @vp8_init_dsmotion_compensation(%struct.macroblock* %x, i32 %stride) #0 {
  %1 = sext i32 0 to i64
  %2 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %3 = load %struct.search_site** %2, align 8
  %4 = getelementptr inbounds %struct.search_site* %3, i64 %1
  %5 = getelementptr inbounds %struct.search_site* %4, i32 0, i32 0
  %6 = getelementptr inbounds %struct.MV* %5, i32 0, i32 1
  store i16 0, i16* %6, align 2
  %7 = sext i32 0 to i64
  %8 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %9 = load %struct.search_site** %8, align 8
  %10 = getelementptr inbounds %struct.search_site* %9, i64 %7
  %11 = getelementptr inbounds %struct.search_site* %10, i32 0, i32 0
  %12 = getelementptr inbounds %struct.MV* %11, i32 0, i32 0
  store i16 0, i16* %12, align 2
  %13 = sext i32 0 to i64
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %15 = load %struct.search_site** %14, align 8
  %16 = getelementptr inbounds %struct.search_site* %15, i64 %13
  %17 = getelementptr inbounds %struct.search_site* %16, i32 0, i32 1
  store i32 0, i32* %17, align 4
  %18 = add nsw i32 0, 1
  br label %19

; <label>:19                                      ; preds = %21, %0
  %Len.0 = phi i32 [ 128, %0 ], [ %104, %21 ]
  %search_site_count.0 = phi i32 [ %18, %0 ], [ %103, %21 ]
  %20 = icmp sgt i32 %Len.0, 0
  br i1 %20, label %21, label %105

; <label>:21                                      ; preds = %19
  %22 = sext i32 %search_site_count.0 to i64
  %23 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %24 = load %struct.search_site** %23, align 8
  %25 = getelementptr inbounds %struct.search_site* %24, i64 %22
  %26 = getelementptr inbounds %struct.search_site* %25, i32 0, i32 0
  %27 = getelementptr inbounds %struct.MV* %26, i32 0, i32 1
  store i16 0, i16* %27, align 2
  %28 = sub nsw i32 0, %Len.0
  %29 = trunc i32 %28 to i16
  %30 = sext i32 %search_site_count.0 to i64
  %31 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %32 = load %struct.search_site** %31, align 8
  %33 = getelementptr inbounds %struct.search_site* %32, i64 %30
  %34 = getelementptr inbounds %struct.search_site* %33, i32 0, i32 0
  %35 = getelementptr inbounds %struct.MV* %34, i32 0, i32 0
  store i16 %29, i16* %35, align 2
  %36 = sub nsw i32 0, %Len.0
  %37 = mul nsw i32 %36, %stride
  %38 = sext i32 %search_site_count.0 to i64
  %39 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %40 = load %struct.search_site** %39, align 8
  %41 = getelementptr inbounds %struct.search_site* %40, i64 %38
  %42 = getelementptr inbounds %struct.search_site* %41, i32 0, i32 1
  store i32 %37, i32* %42, align 4
  %43 = add nsw i32 %search_site_count.0, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %46 = load %struct.search_site** %45, align 8
  %47 = getelementptr inbounds %struct.search_site* %46, i64 %44
  %48 = getelementptr inbounds %struct.search_site* %47, i32 0, i32 0
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1
  store i16 0, i16* %49, align 2
  %50 = trunc i32 %Len.0 to i16
  %51 = sext i32 %43 to i64
  %52 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %53 = load %struct.search_site** %52, align 8
  %54 = getelementptr inbounds %struct.search_site* %53, i64 %51
  %55 = getelementptr inbounds %struct.search_site* %54, i32 0, i32 0
  %56 = getelementptr inbounds %struct.MV* %55, i32 0, i32 0
  store i16 %50, i16* %56, align 2
  %57 = mul nsw i32 %Len.0, %stride
  %58 = sext i32 %43 to i64
  %59 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %60 = load %struct.search_site** %59, align 8
  %61 = getelementptr inbounds %struct.search_site* %60, i64 %58
  %62 = getelementptr inbounds %struct.search_site* %61, i32 0, i32 1
  store i32 %57, i32* %62, align 4
  %63 = add nsw i32 %43, 1
  %64 = sub nsw i32 0, %Len.0
  %65 = trunc i32 %64 to i16
  %66 = sext i32 %63 to i64
  %67 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %68 = load %struct.search_site** %67, align 8
  %69 = getelementptr inbounds %struct.search_site* %68, i64 %66
  %70 = getelementptr inbounds %struct.search_site* %69, i32 0, i32 0
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 1
  store i16 %65, i16* %71, align 2
  %72 = sext i32 %63 to i64
  %73 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %74 = load %struct.search_site** %73, align 8
  %75 = getelementptr inbounds %struct.search_site* %74, i64 %72
  %76 = getelementptr inbounds %struct.search_site* %75, i32 0, i32 0
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0
  store i16 0, i16* %77, align 2
  %78 = sub nsw i32 0, %Len.0
  %79 = sext i32 %63 to i64
  %80 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %81 = load %struct.search_site** %80, align 8
  %82 = getelementptr inbounds %struct.search_site* %81, i64 %79
  %83 = getelementptr inbounds %struct.search_site* %82, i32 0, i32 1
  store i32 %78, i32* %83, align 4
  %84 = add nsw i32 %63, 1
  %85 = trunc i32 %Len.0 to i16
  %86 = sext i32 %84 to i64
  %87 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %88 = load %struct.search_site** %87, align 8
  %89 = getelementptr inbounds %struct.search_site* %88, i64 %86
  %90 = getelementptr inbounds %struct.search_site* %89, i32 0, i32 0
  %91 = getelementptr inbounds %struct.MV* %90, i32 0, i32 1
  store i16 %85, i16* %91, align 2
  %92 = sext i32 %84 to i64
  %93 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %94 = load %struct.search_site** %93, align 8
  %95 = getelementptr inbounds %struct.search_site* %94, i64 %92
  %96 = getelementptr inbounds %struct.search_site* %95, i32 0, i32 0
  %97 = getelementptr inbounds %struct.MV* %96, i32 0, i32 0
  store i16 0, i16* %97, align 2
  %98 = sext i32 %84 to i64
  %99 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %100 = load %struct.search_site** %99, align 8
  %101 = getelementptr inbounds %struct.search_site* %100, i64 %98
  %102 = getelementptr inbounds %struct.search_site* %101, i32 0, i32 1
  store i32 %Len.0, i32* %102, align 4
  %103 = add nsw i32 %84, 1
  %104 = sdiv i32 %Len.0, 2
  br label %19

; <label>:105                                     ; preds = %19
  %106 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 13
  store i32 %search_site_count.0, i32* %106, align 4
  %107 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14
  store i32 4, i32* %107, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @vp8_init3smotion_compensation(%struct.macroblock* %x, i32 %stride) #0 {
  %1 = sext i32 0 to i64
  %2 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %3 = load %struct.search_site** %2, align 8
  %4 = getelementptr inbounds %struct.search_site* %3, i64 %1
  %5 = getelementptr inbounds %struct.search_site* %4, i32 0, i32 0
  %6 = getelementptr inbounds %struct.MV* %5, i32 0, i32 1
  store i16 0, i16* %6, align 2
  %7 = sext i32 0 to i64
  %8 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %9 = load %struct.search_site** %8, align 8
  %10 = getelementptr inbounds %struct.search_site* %9, i64 %7
  %11 = getelementptr inbounds %struct.search_site* %10, i32 0, i32 0
  %12 = getelementptr inbounds %struct.MV* %11, i32 0, i32 0
  store i16 0, i16* %12, align 2
  %13 = sext i32 0 to i64
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %15 = load %struct.search_site** %14, align 8
  %16 = getelementptr inbounds %struct.search_site* %15, i64 %13
  %17 = getelementptr inbounds %struct.search_site* %16, i32 0, i32 1
  store i32 0, i32* %17, align 4
  %18 = add nsw i32 0, 1
  br label %19

; <label>:19                                      ; preds = %21, %0
  %Len.0 = phi i32 [ 128, %0 ], [ %198, %21 ]
  %search_site_count.0 = phi i32 [ %18, %0 ], [ %197, %21 ]
  %20 = icmp sgt i32 %Len.0, 0
  br i1 %20, label %21, label %199

; <label>:21                                      ; preds = %19
  %22 = sext i32 %search_site_count.0 to i64
  %23 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %24 = load %struct.search_site** %23, align 8
  %25 = getelementptr inbounds %struct.search_site* %24, i64 %22
  %26 = getelementptr inbounds %struct.search_site* %25, i32 0, i32 0
  %27 = getelementptr inbounds %struct.MV* %26, i32 0, i32 1
  store i16 0, i16* %27, align 2
  %28 = sub nsw i32 0, %Len.0
  %29 = trunc i32 %28 to i16
  %30 = sext i32 %search_site_count.0 to i64
  %31 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %32 = load %struct.search_site** %31, align 8
  %33 = getelementptr inbounds %struct.search_site* %32, i64 %30
  %34 = getelementptr inbounds %struct.search_site* %33, i32 0, i32 0
  %35 = getelementptr inbounds %struct.MV* %34, i32 0, i32 0
  store i16 %29, i16* %35, align 2
  %36 = sub nsw i32 0, %Len.0
  %37 = mul nsw i32 %36, %stride
  %38 = sext i32 %search_site_count.0 to i64
  %39 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %40 = load %struct.search_site** %39, align 8
  %41 = getelementptr inbounds %struct.search_site* %40, i64 %38
  %42 = getelementptr inbounds %struct.search_site* %41, i32 0, i32 1
  store i32 %37, i32* %42, align 4
  %43 = add nsw i32 %search_site_count.0, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %46 = load %struct.search_site** %45, align 8
  %47 = getelementptr inbounds %struct.search_site* %46, i64 %44
  %48 = getelementptr inbounds %struct.search_site* %47, i32 0, i32 0
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1
  store i16 0, i16* %49, align 2
  %50 = trunc i32 %Len.0 to i16
  %51 = sext i32 %43 to i64
  %52 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %53 = load %struct.search_site** %52, align 8
  %54 = getelementptr inbounds %struct.search_site* %53, i64 %51
  %55 = getelementptr inbounds %struct.search_site* %54, i32 0, i32 0
  %56 = getelementptr inbounds %struct.MV* %55, i32 0, i32 0
  store i16 %50, i16* %56, align 2
  %57 = mul nsw i32 %Len.0, %stride
  %58 = sext i32 %43 to i64
  %59 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %60 = load %struct.search_site** %59, align 8
  %61 = getelementptr inbounds %struct.search_site* %60, i64 %58
  %62 = getelementptr inbounds %struct.search_site* %61, i32 0, i32 1
  store i32 %57, i32* %62, align 4
  %63 = add nsw i32 %43, 1
  %64 = sub nsw i32 0, %Len.0
  %65 = trunc i32 %64 to i16
  %66 = sext i32 %63 to i64
  %67 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %68 = load %struct.search_site** %67, align 8
  %69 = getelementptr inbounds %struct.search_site* %68, i64 %66
  %70 = getelementptr inbounds %struct.search_site* %69, i32 0, i32 0
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 1
  store i16 %65, i16* %71, align 2
  %72 = sext i32 %63 to i64
  %73 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %74 = load %struct.search_site** %73, align 8
  %75 = getelementptr inbounds %struct.search_site* %74, i64 %72
  %76 = getelementptr inbounds %struct.search_site* %75, i32 0, i32 0
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0
  store i16 0, i16* %77, align 2
  %78 = sub nsw i32 0, %Len.0
  %79 = sext i32 %63 to i64
  %80 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %81 = load %struct.search_site** %80, align 8
  %82 = getelementptr inbounds %struct.search_site* %81, i64 %79
  %83 = getelementptr inbounds %struct.search_site* %82, i32 0, i32 1
  store i32 %78, i32* %83, align 4
  %84 = add nsw i32 %63, 1
  %85 = trunc i32 %Len.0 to i16
  %86 = sext i32 %84 to i64
  %87 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %88 = load %struct.search_site** %87, align 8
  %89 = getelementptr inbounds %struct.search_site* %88, i64 %86
  %90 = getelementptr inbounds %struct.search_site* %89, i32 0, i32 0
  %91 = getelementptr inbounds %struct.MV* %90, i32 0, i32 1
  store i16 %85, i16* %91, align 2
  %92 = sext i32 %84 to i64
  %93 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %94 = load %struct.search_site** %93, align 8
  %95 = getelementptr inbounds %struct.search_site* %94, i64 %92
  %96 = getelementptr inbounds %struct.search_site* %95, i32 0, i32 0
  %97 = getelementptr inbounds %struct.MV* %96, i32 0, i32 0
  store i16 0, i16* %97, align 2
  %98 = sext i32 %84 to i64
  %99 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %100 = load %struct.search_site** %99, align 8
  %101 = getelementptr inbounds %struct.search_site* %100, i64 %98
  %102 = getelementptr inbounds %struct.search_site* %101, i32 0, i32 1
  store i32 %Len.0, i32* %102, align 4
  %103 = add nsw i32 %84, 1
  %104 = sub nsw i32 0, %Len.0
  %105 = trunc i32 %104 to i16
  %106 = sext i32 %103 to i64
  %107 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %108 = load %struct.search_site** %107, align 8
  %109 = getelementptr inbounds %struct.search_site* %108, i64 %106
  %110 = getelementptr inbounds %struct.search_site* %109, i32 0, i32 0
  %111 = getelementptr inbounds %struct.MV* %110, i32 0, i32 1
  store i16 %105, i16* %111, align 2
  %112 = sub nsw i32 0, %Len.0
  %113 = trunc i32 %112 to i16
  %114 = sext i32 %103 to i64
  %115 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %116 = load %struct.search_site** %115, align 8
  %117 = getelementptr inbounds %struct.search_site* %116, i64 %114
  %118 = getelementptr inbounds %struct.search_site* %117, i32 0, i32 0
  %119 = getelementptr inbounds %struct.MV* %118, i32 0, i32 0
  store i16 %113, i16* %119, align 2
  %120 = sub nsw i32 0, %Len.0
  %121 = mul nsw i32 %120, %stride
  %122 = sub nsw i32 %121, %Len.0
  %123 = sext i32 %103 to i64
  %124 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %125 = load %struct.search_site** %124, align 8
  %126 = getelementptr inbounds %struct.search_site* %125, i64 %123
  %127 = getelementptr inbounds %struct.search_site* %126, i32 0, i32 1
  store i32 %122, i32* %127, align 4
  %128 = add nsw i32 %103, 1
  %129 = trunc i32 %Len.0 to i16
  %130 = sext i32 %128 to i64
  %131 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %132 = load %struct.search_site** %131, align 8
  %133 = getelementptr inbounds %struct.search_site* %132, i64 %130
  %134 = getelementptr inbounds %struct.search_site* %133, i32 0, i32 0
  %135 = getelementptr inbounds %struct.MV* %134, i32 0, i32 1
  store i16 %129, i16* %135, align 2
  %136 = sub nsw i32 0, %Len.0
  %137 = trunc i32 %136 to i16
  %138 = sext i32 %128 to i64
  %139 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %140 = load %struct.search_site** %139, align 8
  %141 = getelementptr inbounds %struct.search_site* %140, i64 %138
  %142 = getelementptr inbounds %struct.search_site* %141, i32 0, i32 0
  %143 = getelementptr inbounds %struct.MV* %142, i32 0, i32 0
  store i16 %137, i16* %143, align 2
  %144 = sub nsw i32 0, %Len.0
  %145 = mul nsw i32 %144, %stride
  %146 = add nsw i32 %145, %Len.0
  %147 = sext i32 %128 to i64
  %148 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %149 = load %struct.search_site** %148, align 8
  %150 = getelementptr inbounds %struct.search_site* %149, i64 %147
  %151 = getelementptr inbounds %struct.search_site* %150, i32 0, i32 1
  store i32 %146, i32* %151, align 4
  %152 = add nsw i32 %128, 1
  %153 = sub nsw i32 0, %Len.0
  %154 = trunc i32 %153 to i16
  %155 = sext i32 %152 to i64
  %156 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %157 = load %struct.search_site** %156, align 8
  %158 = getelementptr inbounds %struct.search_site* %157, i64 %155
  %159 = getelementptr inbounds %struct.search_site* %158, i32 0, i32 0
  %160 = getelementptr inbounds %struct.MV* %159, i32 0, i32 1
  store i16 %154, i16* %160, align 2
  %161 = trunc i32 %Len.0 to i16
  %162 = sext i32 %152 to i64
  %163 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %164 = load %struct.search_site** %163, align 8
  %165 = getelementptr inbounds %struct.search_site* %164, i64 %162
  %166 = getelementptr inbounds %struct.search_site* %165, i32 0, i32 0
  %167 = getelementptr inbounds %struct.MV* %166, i32 0, i32 0
  store i16 %161, i16* %167, align 2
  %168 = mul nsw i32 %Len.0, %stride
  %169 = sub nsw i32 %168, %Len.0
  %170 = sext i32 %152 to i64
  %171 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %172 = load %struct.search_site** %171, align 8
  %173 = getelementptr inbounds %struct.search_site* %172, i64 %170
  %174 = getelementptr inbounds %struct.search_site* %173, i32 0, i32 1
  store i32 %169, i32* %174, align 4
  %175 = add nsw i32 %152, 1
  %176 = trunc i32 %Len.0 to i16
  %177 = sext i32 %175 to i64
  %178 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %179 = load %struct.search_site** %178, align 8
  %180 = getelementptr inbounds %struct.search_site* %179, i64 %177
  %181 = getelementptr inbounds %struct.search_site* %180, i32 0, i32 0
  %182 = getelementptr inbounds %struct.MV* %181, i32 0, i32 1
  store i16 %176, i16* %182, align 2
  %183 = trunc i32 %Len.0 to i16
  %184 = sext i32 %175 to i64
  %185 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %186 = load %struct.search_site** %185, align 8
  %187 = getelementptr inbounds %struct.search_site* %186, i64 %184
  %188 = getelementptr inbounds %struct.search_site* %187, i32 0, i32 0
  %189 = getelementptr inbounds %struct.MV* %188, i32 0, i32 0
  store i16 %183, i16* %189, align 2
  %190 = mul nsw i32 %Len.0, %stride
  %191 = add nsw i32 %190, %Len.0
  %192 = sext i32 %175 to i64
  %193 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %194 = load %struct.search_site** %193, align 8
  %195 = getelementptr inbounds %struct.search_site* %194, i64 %192
  %196 = getelementptr inbounds %struct.search_site* %195, i32 0, i32 1
  store i32 %191, i32* %196, align 4
  %197 = add nsw i32 %175, 1
  %198 = sdiv i32 %Len.0, 2
  br label %19

; <label>:199                                     ; preds = %19
  %200 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 13
  store i32 %search_site_count.0, i32* %200, align 4
  %201 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14
  store i32 8, i32* %201, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @vp8_find_best_sub_pixel_step_iteratively(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32 %error_per_bit, %struct.variance_vtable* %vfp, i32** %mvcost, i32* %distortion, i32* %sse1) #0 {
  %sse = alloca i32, align 4
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9
  %2 = load i8*** %1, align 8
  %3 = load i8** %2, align 8
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8* %3, i64 %6
  %8 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %9 = getelementptr inbounds %struct.MV* %8, i32 0, i32 0
  %10 = load i16* %9, align 2
  %11 = sext i16 %10 to i32
  %12 = ashr i32 %11, 1
  %13 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %14 = getelementptr inbounds %struct.MV* %13, i32 0, i32 1
  %15 = load i16* %14, align 2
  %16 = sext i16 %15 to i32
  %17 = ashr i32 %16, 1
  %18 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %19 = getelementptr inbounds %struct.MV* %18, i32 0, i32 0
  %20 = load i16* %19, align 2
  %21 = sext i16 %20 to i32
  %22 = mul nsw i32 %21, 4
  %23 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %24 = getelementptr inbounds %struct.MV* %23, i32 0, i32 1
  %25 = load i16* %24, align 2
  %26 = sext i16 %25 to i32
  %27 = mul nsw i32 %26, 4
  %28 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %29 = load i32* %28, align 4
  %30 = mul nsw i32 %29, 4
  %31 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %32 = getelementptr inbounds %struct.MV* %31, i32 0, i32 1
  %33 = load i16* %32, align 2
  %34 = sext i16 %33 to i32
  %35 = ashr i32 %34, 1
  %36 = sub nsw i32 %35, 1023
  %37 = icmp sgt i32 %30, %36
  br i1 %37, label %38, label %42

; <label>:38                                      ; preds = %0
  %39 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %40 = load i32* %39, align 4
  %41 = mul nsw i32 %40, 4
  br label %49

; <label>:42                                      ; preds = %0
  %43 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %44 = getelementptr inbounds %struct.MV* %43, i32 0, i32 1
  %45 = load i16* %44, align 2
  %46 = sext i16 %45 to i32
  %47 = ashr i32 %46, 1
  %48 = sub nsw i32 %47, 1023
  br label %49

; <label>:49                                      ; preds = %42, %38
  %50 = phi i32 [ %41, %38 ], [ %48, %42 ]
  %51 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %52 = load i32* %51, align 4
  %53 = mul nsw i32 %52, 4
  %54 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %55 = getelementptr inbounds %struct.MV* %54, i32 0, i32 1
  %56 = load i16* %55, align 2
  %57 = sext i16 %56 to i32
  %58 = ashr i32 %57, 1
  %59 = add nsw i32 %58, 1023
  %60 = icmp slt i32 %53, %59
  br i1 %60, label %61, label %65

; <label>:61                                      ; preds = %49
  %62 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %63 = load i32* %62, align 4
  %64 = mul nsw i32 %63, 4
  br label %72

; <label>:65                                      ; preds = %49
  %66 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %67 = getelementptr inbounds %struct.MV* %66, i32 0, i32 1
  %68 = load i16* %67, align 2
  %69 = sext i16 %68 to i32
  %70 = ashr i32 %69, 1
  %71 = add nsw i32 %70, 1023
  br label %72

; <label>:72                                      ; preds = %65, %61
  %73 = phi i32 [ %64, %61 ], [ %71, %65 ]
  %74 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %75 = load i32* %74, align 4
  %76 = mul nsw i32 %75, 4
  %77 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %78 = getelementptr inbounds %struct.MV* %77, i32 0, i32 0
  %79 = load i16* %78, align 2
  %80 = sext i16 %79 to i32
  %81 = ashr i32 %80, 1
  %82 = sub nsw i32 %81, 1023
  %83 = icmp sgt i32 %76, %82
  br i1 %83, label %84, label %88

; <label>:84                                      ; preds = %72
  %85 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %86 = load i32* %85, align 4
  %87 = mul nsw i32 %86, 4
  br label %95

; <label>:88                                      ; preds = %72
  %89 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %90 = getelementptr inbounds %struct.MV* %89, i32 0, i32 0
  %91 = load i16* %90, align 2
  %92 = sext i16 %91 to i32
  %93 = ashr i32 %92, 1
  %94 = sub nsw i32 %93, 1023
  br label %95

; <label>:95                                      ; preds = %88, %84
  %96 = phi i32 [ %87, %84 ], [ %94, %88 ]
  %97 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %98 = load i32* %97, align 4
  %99 = mul nsw i32 %98, 4
  %100 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %101 = getelementptr inbounds %struct.MV* %100, i32 0, i32 0
  %102 = load i16* %101, align 2
  %103 = sext i16 %102 to i32
  %104 = ashr i32 %103, 1
  %105 = add nsw i32 %104, 1023
  %106 = icmp slt i32 %99, %105
  br i1 %106, label %107, label %111

; <label>:107                                     ; preds = %95
  %108 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %109 = load i32* %108, align 4
  %110 = mul nsw i32 %109, 4
  br label %118

; <label>:111                                     ; preds = %95
  %112 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %113 = getelementptr inbounds %struct.MV* %112, i32 0, i32 0
  %114 = load i16* %113, align 2
  %115 = sext i16 %114 to i32
  %116 = ashr i32 %115, 1
  %117 = add nsw i32 %116, 1023
  br label %118

; <label>:118                                     ; preds = %111, %107
  %119 = phi i32 [ %110, %107 ], [ %117, %111 ]
  %120 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %121 = getelementptr inbounds %struct.macroblockd* %120, i32 0, i32 11
  %122 = getelementptr inbounds %struct.yv12_buffer_config* %121, i32 0, i32 4
  %123 = load i32* %122, align 4
  %124 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %125 = getelementptr inbounds %struct.macroblockd* %124, i32 0, i32 11
  %126 = getelementptr inbounds %struct.yv12_buffer_config* %125, i32 0, i32 13
  %127 = load i8** %126, align 8
  %128 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %129 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4
  %130 = load i32* %129, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i8* %127, i64 %131
  %133 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %134 = getelementptr inbounds %struct.MV* %133, i32 0, i32 0
  %135 = load i16* %134, align 2
  %136 = sext i16 %135 to i32
  %137 = mul nsw i32 %136, %123
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i8* %132, i64 %138
  %140 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %141 = getelementptr inbounds %struct.MV* %140, i32 0, i32 1
  %142 = load i16* %141, align 2
  %143 = sext i16 %142 to i32
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i8* %139, i64 %144
  %146 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %147 = getelementptr inbounds %struct.MV* %146, i32 0, i32 0
  %148 = load i16* %147, align 2
  %149 = sext i16 %148 to i32
  %150 = sub nsw i32 %149, 3
  %151 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %152 = load i32* %151, align 4
  %153 = icmp slt i32 %150, %152
  br i1 %153, label %154, label %162

; <label>:154                                     ; preds = %118
  %155 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %156 = getelementptr inbounds %struct.MV* %155, i32 0, i32 0
  %157 = load i16* %156, align 2
  %158 = sext i16 %157 to i32
  %159 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %160 = load i32* %159, align 4
  %161 = sub nsw i32 %158, %160
  br label %163

; <label>:162                                     ; preds = %118
  br label %163

; <label>:163                                     ; preds = %162, %154
  %164 = phi i32 [ %161, %154 ], [ 3, %162 ]
  %165 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %166 = getelementptr inbounds %struct.MV* %165, i32 0, i32 0
  %167 = load i16* %166, align 2
  %168 = sext i16 %167 to i32
  %169 = add nsw i32 %168, 3
  %170 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %171 = load i32* %170, align 4
  %172 = icmp sgt i32 %169, %171
  br i1 %172, label %173, label %181

; <label>:173                                     ; preds = %163
  %174 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %175 = load i32* %174, align 4
  %176 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %177 = getelementptr inbounds %struct.MV* %176, i32 0, i32 0
  %178 = load i16* %177, align 2
  %179 = sext i16 %178 to i32
  %180 = sub nsw i32 %175, %179
  br label %182

; <label>:181                                     ; preds = %163
  br label %182

; <label>:182                                     ; preds = %181, %173
  %183 = phi i32 [ %180, %173 ], [ 3, %181 ]
  %184 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %185 = getelementptr inbounds %struct.MV* %184, i32 0, i32 1
  %186 = load i16* %185, align 2
  %187 = sext i16 %186 to i32
  %188 = sub nsw i32 %187, 3
  %189 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %190 = load i32* %189, align 4
  %191 = icmp slt i32 %188, %190
  br i1 %191, label %192, label %200

; <label>:192                                     ; preds = %182
  %193 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %194 = getelementptr inbounds %struct.MV* %193, i32 0, i32 1
  %195 = load i16* %194, align 2
  %196 = sext i16 %195 to i32
  %197 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %198 = load i32* %197, align 4
  %199 = sub nsw i32 %196, %198
  br label %201

; <label>:200                                     ; preds = %182
  br label %201

; <label>:201                                     ; preds = %200, %192
  %202 = phi i32 [ %199, %192 ], [ 3, %200 ]
  %203 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 9
  %204 = load void (i8*, i32, i8*, i32, i32)** %203, align 8
  %205 = sext i32 %202 to i64
  %206 = sub i64 0, %205
  %207 = getelementptr inbounds i8* %145, i64 %206
  %208 = mul nsw i32 %123, %164
  %209 = sext i32 %208 to i64
  %210 = sub i64 0, %209
  %211 = getelementptr inbounds i8* %207, i64 %210
  %212 = getelementptr inbounds %struct.macroblockd* %128, i32 0, i32 46
  %213 = getelementptr inbounds [704 x i8]* %212, i32 0, i32 0
  %214 = add nsw i32 16, %164
  %215 = add nsw i32 %214, %183
  call void %204(i8* %211, i32 %123, i8* %213, i32 32, i32 %215)
  %216 = getelementptr inbounds %struct.macroblockd* %128, i32 0, i32 46
  %217 = getelementptr inbounds [704 x i8]* %216, i32 0, i32 0
  %218 = mul nsw i32 32, %164
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds i8* %217, i64 %219
  %221 = sext i32 %202 to i64
  %222 = getelementptr inbounds i8* %220, i64 %221
  %223 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %224 = getelementptr inbounds %struct.MV* %223, i32 0, i32 0
  %225 = load i16* %224, align 2
  %226 = sext i16 %225 to i32
  %227 = mul nsw i32 %226, 32
  %228 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %229 = getelementptr inbounds %struct.MV* %228, i32 0, i32 1
  %230 = load i16* %229, align 2
  %231 = sext i16 %230 to i32
  %232 = add nsw i32 %227, %231
  %233 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %234 = getelementptr inbounds %struct.MV* %233, i32 0, i32 0
  %235 = load i16* %234, align 2
  %236 = sext i16 %235 to i32
  %237 = mul nsw i32 %236, 8
  %238 = trunc i32 %237 to i16
  store i16 %238, i16* %234, align 2
  %239 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %240 = getelementptr inbounds %struct.MV* %239, i32 0, i32 1
  %241 = load i16* %240, align 2
  %242 = sext i16 %241 to i32
  %243 = mul nsw i32 %242, 8
  %244 = trunc i32 %243 to i16
  store i16 %244, i16* %240, align 2
  %245 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 1
  %246 = load i32 (i8*, i32, i8*, i32, i32*)** %245, align 8
  %247 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %248 = load i32* %247, align 4
  %249 = call i32 %246(i8* %222, i32 32, i8* %7, i32 %248, i32* %sse1)
  store i32 %249, i32* %distortion, align 4
  %250 = call i32 @mv_err_cost(%union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %251 = add i32 %249, %250
  br label %252

; <label>:252                                     ; preds = %758, %201
  %br.0 = phi i32 [ %22, %201 ], [ %br.17, %758 ]
  %bc.0 = phi i32 [ %27, %201 ], [ %bc.17, %758 ]
  %tr.0 = phi i32 [ %22, %201 ], [ %br.17, %758 ]
  %tc.0 = phi i32 [ %27, %201 ], [ %bc.17, %758 ]
  %besterr.0 = phi i32 [ %251, %201 ], [ %besterr.17, %758 ]
  %halfiters.0 = phi i32 [ 4, %201 ], [ %253, %758 ]
  %253 = add i32 %halfiters.0, -1
  %254 = icmp ne i32 %253, 0
  br i1 %254, label %255, label %759

; <label>:255                                     ; preds = %252
  %256 = sub nsw i32 %tc.0, 2
  %257 = icmp sge i32 %256, %50
  br i1 %257, label %258, label %312

; <label>:258                                     ; preds = %255
  %259 = sub nsw i32 %tc.0, 2
  %260 = icmp sle i32 %259, %73
  br i1 %260, label %261, label %312

; <label>:261                                     ; preds = %258
  %262 = icmp sge i32 %tr.0, %96
  br i1 %262, label %263, label %312

; <label>:263                                     ; preds = %261
  %264 = icmp sle i32 %tr.0, %119
  br i1 %264, label %265, label %312

; <label>:265                                     ; preds = %263
  %266 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %267 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %266, align 8
  %268 = ashr i32 %tr.0, 2
  %269 = mul nsw i32 %268, 32
  %270 = sub nsw i32 %tc.0, 2
  %271 = ashr i32 %270, 2
  %272 = add nsw i32 %269, %271
  %273 = sub nsw i32 %272, %232
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds i8* %222, i64 %274
  %276 = sub nsw i32 %tc.0, 2
  %277 = and i32 %276, 3
  %278 = shl i32 %277, 1
  %279 = and i32 %tr.0, 3
  %280 = shl i32 %279, 1
  %281 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %282 = load i32* %281, align 4
  %283 = call i32 %267(i8* %275, i32 32, i32 %278, i32 %280, i8* %7, i32 %282, i32* %sse)
  %284 = icmp ne i32** %mvcost, null
  br i1 %284, label %285, label %303

; <label>:285                                     ; preds = %265
  %286 = sub nsw i32 %tr.0, %12
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds i32** %mvcost, i64 0
  %289 = load i32** %288, align 8
  %290 = getelementptr inbounds i32* %289, i64 %287
  %291 = load i32* %290, align 4
  %292 = sub nsw i32 %tc.0, 2
  %293 = sub nsw i32 %292, %17
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds i32** %mvcost, i64 1
  %296 = load i32** %295, align 8
  %297 = getelementptr inbounds i32* %296, i64 %294
  %298 = load i32* %297, align 4
  %299 = add nsw i32 %291, %298
  %300 = mul nsw i32 %299, %error_per_bit
  %301 = add nsw i32 %300, 128
  %302 = ashr i32 %301, 8
  br label %304

; <label>:303                                     ; preds = %265
  br label %304

; <label>:304                                     ; preds = %303, %285
  %305 = phi i32 [ %302, %285 ], [ 0, %303 ]
  %306 = add nsw i32 %305, %283
  %307 = icmp ult i32 %306, %besterr.0
  br i1 %307, label %308, label %311

; <label>:308                                     ; preds = %304
  %309 = sub nsw i32 %tc.0, 2
  store i32 %283, i32* %distortion, align 4
  %310 = load i32* %sse, align 4
  store i32 %310, i32* %sse1, align 4
  br label %311

; <label>:311                                     ; preds = %308, %304
  %br.1 = phi i32 [ %tr.0, %308 ], [ %br.0, %304 ]
  %bc.1 = phi i32 [ %309, %308 ], [ %bc.0, %304 ]
  %besterr.1 = phi i32 [ %306, %308 ], [ %besterr.0, %304 ]
  br label %313

; <label>:312                                     ; preds = %263, %261, %258, %255
  br label %313

; <label>:313                                     ; preds = %312, %311
  %br.2 = phi i32 [ %br.1, %311 ], [ %br.0, %312 ]
  %bc.2 = phi i32 [ %bc.1, %311 ], [ %bc.0, %312 ]
  %besterr.2 = phi i32 [ %besterr.1, %311 ], [ %besterr.0, %312 ]
  %left.0 = phi i32 [ %306, %311 ], [ -1, %312 ]
  %314 = add nsw i32 %tc.0, 2
  %315 = icmp sge i32 %314, %50
  br i1 %315, label %316, label %370

; <label>:316                                     ; preds = %313
  %317 = add nsw i32 %tc.0, 2
  %318 = icmp sle i32 %317, %73
  br i1 %318, label %319, label %370

; <label>:319                                     ; preds = %316
  %320 = icmp sge i32 %tr.0, %96
  br i1 %320, label %321, label %370

; <label>:321                                     ; preds = %319
  %322 = icmp sle i32 %tr.0, %119
  br i1 %322, label %323, label %370

; <label>:323                                     ; preds = %321
  %324 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %325 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %324, align 8
  %326 = ashr i32 %tr.0, 2
  %327 = mul nsw i32 %326, 32
  %328 = add nsw i32 %tc.0, 2
  %329 = ashr i32 %328, 2
  %330 = add nsw i32 %327, %329
  %331 = sub nsw i32 %330, %232
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds i8* %222, i64 %332
  %334 = add nsw i32 %tc.0, 2
  %335 = and i32 %334, 3
  %336 = shl i32 %335, 1
  %337 = and i32 %tr.0, 3
  %338 = shl i32 %337, 1
  %339 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %340 = load i32* %339, align 4
  %341 = call i32 %325(i8* %333, i32 32, i32 %336, i32 %338, i8* %7, i32 %340, i32* %sse)
  %342 = icmp ne i32** %mvcost, null
  br i1 %342, label %343, label %361

; <label>:343                                     ; preds = %323
  %344 = sub nsw i32 %tr.0, %12
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds i32** %mvcost, i64 0
  %347 = load i32** %346, align 8
  %348 = getelementptr inbounds i32* %347, i64 %345
  %349 = load i32* %348, align 4
  %350 = add nsw i32 %tc.0, 2
  %351 = sub nsw i32 %350, %17
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds i32** %mvcost, i64 1
  %354 = load i32** %353, align 8
  %355 = getelementptr inbounds i32* %354, i64 %352
  %356 = load i32* %355, align 4
  %357 = add nsw i32 %349, %356
  %358 = mul nsw i32 %357, %error_per_bit
  %359 = add nsw i32 %358, 128
  %360 = ashr i32 %359, 8
  br label %362

; <label>:361                                     ; preds = %323
  br label %362

; <label>:362                                     ; preds = %361, %343
  %363 = phi i32 [ %360, %343 ], [ 0, %361 ]
  %364 = add nsw i32 %363, %341
  %365 = icmp ult i32 %364, %besterr.2
  br i1 %365, label %366, label %369

; <label>:366                                     ; preds = %362
  %367 = add nsw i32 %tc.0, 2
  store i32 %341, i32* %distortion, align 4
  %368 = load i32* %sse, align 4
  store i32 %368, i32* %sse1, align 4
  br label %369

; <label>:369                                     ; preds = %366, %362
  %br.3 = phi i32 [ %tr.0, %366 ], [ %br.2, %362 ]
  %bc.3 = phi i32 [ %367, %366 ], [ %bc.2, %362 ]
  %besterr.3 = phi i32 [ %364, %366 ], [ %besterr.2, %362 ]
  br label %371

; <label>:370                                     ; preds = %321, %319, %316, %313
  br label %371

; <label>:371                                     ; preds = %370, %369
  %br.4 = phi i32 [ %br.3, %369 ], [ %br.2, %370 ]
  %bc.4 = phi i32 [ %bc.3, %369 ], [ %bc.2, %370 ]
  %besterr.4 = phi i32 [ %besterr.3, %369 ], [ %besterr.2, %370 ]
  %right.0 = phi i32 [ %364, %369 ], [ -1, %370 ]
  %372 = icmp sge i32 %tc.0, %50
  br i1 %372, label %373, label %428

; <label>:373                                     ; preds = %371
  %374 = icmp sle i32 %tc.0, %73
  br i1 %374, label %375, label %428

; <label>:375                                     ; preds = %373
  %376 = sub nsw i32 %tr.0, 2
  %377 = icmp sge i32 %376, %96
  br i1 %377, label %378, label %428

; <label>:378                                     ; preds = %375
  %379 = sub nsw i32 %tr.0, 2
  %380 = icmp sle i32 %379, %119
  br i1 %380, label %381, label %428

; <label>:381                                     ; preds = %378
  %382 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %383 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %382, align 8
  %384 = sub nsw i32 %tr.0, 2
  %385 = ashr i32 %384, 2
  %386 = mul nsw i32 %385, 32
  %387 = ashr i32 %tc.0, 2
  %388 = add nsw i32 %386, %387
  %389 = sub nsw i32 %388, %232
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds i8* %222, i64 %390
  %392 = and i32 %tc.0, 3
  %393 = shl i32 %392, 1
  %394 = sub nsw i32 %tr.0, 2
  %395 = and i32 %394, 3
  %396 = shl i32 %395, 1
  %397 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %398 = load i32* %397, align 4
  %399 = call i32 %383(i8* %391, i32 32, i32 %393, i32 %396, i8* %7, i32 %398, i32* %sse)
  %400 = icmp ne i32** %mvcost, null
  br i1 %400, label %401, label %419

; <label>:401                                     ; preds = %381
  %402 = sub nsw i32 %tr.0, 2
  %403 = sub nsw i32 %402, %12
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds i32** %mvcost, i64 0
  %406 = load i32** %405, align 8
  %407 = getelementptr inbounds i32* %406, i64 %404
  %408 = load i32* %407, align 4
  %409 = sub nsw i32 %tc.0, %17
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds i32** %mvcost, i64 1
  %412 = load i32** %411, align 8
  %413 = getelementptr inbounds i32* %412, i64 %410
  %414 = load i32* %413, align 4
  %415 = add nsw i32 %408, %414
  %416 = mul nsw i32 %415, %error_per_bit
  %417 = add nsw i32 %416, 128
  %418 = ashr i32 %417, 8
  br label %420

; <label>:419                                     ; preds = %381
  br label %420

; <label>:420                                     ; preds = %419, %401
  %421 = phi i32 [ %418, %401 ], [ 0, %419 ]
  %422 = add nsw i32 %421, %399
  %423 = icmp ult i32 %422, %besterr.4
  br i1 %423, label %424, label %427

; <label>:424                                     ; preds = %420
  %425 = sub nsw i32 %tr.0, 2
  store i32 %399, i32* %distortion, align 4
  %426 = load i32* %sse, align 4
  store i32 %426, i32* %sse1, align 4
  br label %427

; <label>:427                                     ; preds = %424, %420
  %br.5 = phi i32 [ %425, %424 ], [ %br.4, %420 ]
  %bc.5 = phi i32 [ %tc.0, %424 ], [ %bc.4, %420 ]
  %besterr.5 = phi i32 [ %422, %424 ], [ %besterr.4, %420 ]
  br label %429

; <label>:428                                     ; preds = %378, %375, %373, %371
  br label %429

; <label>:429                                     ; preds = %428, %427
  %br.6 = phi i32 [ %br.5, %427 ], [ %br.4, %428 ]
  %bc.6 = phi i32 [ %bc.5, %427 ], [ %bc.4, %428 ]
  %besterr.6 = phi i32 [ %besterr.5, %427 ], [ %besterr.4, %428 ]
  %up.0 = phi i32 [ %422, %427 ], [ -1, %428 ]
  %430 = icmp sge i32 %tc.0, %50
  br i1 %430, label %431, label %486

; <label>:431                                     ; preds = %429
  %432 = icmp sle i32 %tc.0, %73
  br i1 %432, label %433, label %486

; <label>:433                                     ; preds = %431
  %434 = add nsw i32 %tr.0, 2
  %435 = icmp sge i32 %434, %96
  br i1 %435, label %436, label %486

; <label>:436                                     ; preds = %433
  %437 = add nsw i32 %tr.0, 2
  %438 = icmp sle i32 %437, %119
  br i1 %438, label %439, label %486

; <label>:439                                     ; preds = %436
  %440 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %441 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %440, align 8
  %442 = add nsw i32 %tr.0, 2
  %443 = ashr i32 %442, 2
  %444 = mul nsw i32 %443, 32
  %445 = ashr i32 %tc.0, 2
  %446 = add nsw i32 %444, %445
  %447 = sub nsw i32 %446, %232
  %448 = sext i32 %447 to i64
  %449 = getelementptr inbounds i8* %222, i64 %448
  %450 = and i32 %tc.0, 3
  %451 = shl i32 %450, 1
  %452 = add nsw i32 %tr.0, 2
  %453 = and i32 %452, 3
  %454 = shl i32 %453, 1
  %455 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %456 = load i32* %455, align 4
  %457 = call i32 %441(i8* %449, i32 32, i32 %451, i32 %454, i8* %7, i32 %456, i32* %sse)
  %458 = icmp ne i32** %mvcost, null
  br i1 %458, label %459, label %477

; <label>:459                                     ; preds = %439
  %460 = add nsw i32 %tr.0, 2
  %461 = sub nsw i32 %460, %12
  %462 = sext i32 %461 to i64
  %463 = getelementptr inbounds i32** %mvcost, i64 0
  %464 = load i32** %463, align 8
  %465 = getelementptr inbounds i32* %464, i64 %462
  %466 = load i32* %465, align 4
  %467 = sub nsw i32 %tc.0, %17
  %468 = sext i32 %467 to i64
  %469 = getelementptr inbounds i32** %mvcost, i64 1
  %470 = load i32** %469, align 8
  %471 = getelementptr inbounds i32* %470, i64 %468
  %472 = load i32* %471, align 4
  %473 = add nsw i32 %466, %472
  %474 = mul nsw i32 %473, %error_per_bit
  %475 = add nsw i32 %474, 128
  %476 = ashr i32 %475, 8
  br label %478

; <label>:477                                     ; preds = %439
  br label %478

; <label>:478                                     ; preds = %477, %459
  %479 = phi i32 [ %476, %459 ], [ 0, %477 ]
  %480 = add nsw i32 %479, %457
  %481 = icmp ult i32 %480, %besterr.6
  br i1 %481, label %482, label %485

; <label>:482                                     ; preds = %478
  %483 = add nsw i32 %tr.0, 2
  store i32 %457, i32* %distortion, align 4
  %484 = load i32* %sse, align 4
  store i32 %484, i32* %sse1, align 4
  br label %485

; <label>:485                                     ; preds = %482, %478
  %br.7 = phi i32 [ %483, %482 ], [ %br.6, %478 ]
  %bc.7 = phi i32 [ %tc.0, %482 ], [ %bc.6, %478 ]
  %besterr.7 = phi i32 [ %480, %482 ], [ %besterr.6, %478 ]
  br label %487

; <label>:486                                     ; preds = %436, %433, %431, %429
  br label %487

; <label>:487                                     ; preds = %486, %485
  %br.8 = phi i32 [ %br.7, %485 ], [ %br.6, %486 ]
  %bc.8 = phi i32 [ %bc.7, %485 ], [ %bc.6, %486 ]
  %besterr.8 = phi i32 [ %besterr.7, %485 ], [ %besterr.6, %486 ]
  %down.0 = phi i32 [ %480, %485 ], [ -1, %486 ]
  %488 = icmp ult i32 %left.0, %right.0
  %489 = select i1 %488, i32 0, i32 1
  %490 = icmp ult i32 %up.0, %down.0
  %491 = select i1 %490, i32 0, i32 2
  %492 = add nsw i32 %489, %491
  switch i32 %492, label %753 [
    i32 0, label %493
    i32 1, label %558
    i32 2, label %623
    i32 3, label %688
  ]

; <label>:493                                     ; preds = %487
  %494 = sub nsw i32 %tc.0, 2
  %495 = icmp sge i32 %494, %50
  br i1 %495, label %496, label %556

; <label>:496                                     ; preds = %493
  %497 = sub nsw i32 %tc.0, 2
  %498 = icmp sle i32 %497, %73
  br i1 %498, label %499, label %556

; <label>:499                                     ; preds = %496
  %500 = sub nsw i32 %tr.0, 2
  %501 = icmp sge i32 %500, %96
  br i1 %501, label %502, label %556

; <label>:502                                     ; preds = %499
  %503 = sub nsw i32 %tr.0, 2
  %504 = icmp sle i32 %503, %119
  br i1 %504, label %505, label %556

; <label>:505                                     ; preds = %502
  %506 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %507 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %506, align 8
  %508 = sub nsw i32 %tr.0, 2
  %509 = ashr i32 %508, 2
  %510 = mul nsw i32 %509, 32
  %511 = sub nsw i32 %tc.0, 2
  %512 = ashr i32 %511, 2
  %513 = add nsw i32 %510, %512
  %514 = sub nsw i32 %513, %232
  %515 = sext i32 %514 to i64
  %516 = getelementptr inbounds i8* %222, i64 %515
  %517 = sub nsw i32 %tc.0, 2
  %518 = and i32 %517, 3
  %519 = shl i32 %518, 1
  %520 = sub nsw i32 %tr.0, 2
  %521 = and i32 %520, 3
  %522 = shl i32 %521, 1
  %523 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %524 = load i32* %523, align 4
  %525 = call i32 %507(i8* %516, i32 32, i32 %519, i32 %522, i8* %7, i32 %524, i32* %sse)
  %526 = icmp ne i32** %mvcost, null
  br i1 %526, label %527, label %546

; <label>:527                                     ; preds = %505
  %528 = sub nsw i32 %tr.0, 2
  %529 = sub nsw i32 %528, %12
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds i32** %mvcost, i64 0
  %532 = load i32** %531, align 8
  %533 = getelementptr inbounds i32* %532, i64 %530
  %534 = load i32* %533, align 4
  %535 = sub nsw i32 %tc.0, 2
  %536 = sub nsw i32 %535, %17
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds i32** %mvcost, i64 1
  %539 = load i32** %538, align 8
  %540 = getelementptr inbounds i32* %539, i64 %537
  %541 = load i32* %540, align 4
  %542 = add nsw i32 %534, %541
  %543 = mul nsw i32 %542, %error_per_bit
  %544 = add nsw i32 %543, 128
  %545 = ashr i32 %544, 8
  br label %547

; <label>:546                                     ; preds = %505
  br label %547

; <label>:547                                     ; preds = %546, %527
  %548 = phi i32 [ %545, %527 ], [ 0, %546 ]
  %549 = add nsw i32 %548, %525
  %550 = icmp ult i32 %549, %besterr.8
  br i1 %550, label %551, label %555

; <label>:551                                     ; preds = %547
  %552 = sub nsw i32 %tr.0, 2
  %553 = sub nsw i32 %tc.0, 2
  store i32 %525, i32* %distortion, align 4
  %554 = load i32* %sse, align 4
  store i32 %554, i32* %sse1, align 4
  br label %555

; <label>:555                                     ; preds = %551, %547
  %br.9 = phi i32 [ %552, %551 ], [ %br.8, %547 ]
  %bc.9 = phi i32 [ %553, %551 ], [ %bc.8, %547 ]
  %besterr.9 = phi i32 [ %549, %551 ], [ %besterr.8, %547 ]
  br label %557

; <label>:556                                     ; preds = %502, %499, %496, %493
  br label %557

; <label>:557                                     ; preds = %556, %555
  %br.10 = phi i32 [ %br.9, %555 ], [ %br.8, %556 ]
  %bc.10 = phi i32 [ %bc.9, %555 ], [ %bc.8, %556 ]
  %besterr.10 = phi i32 [ %besterr.9, %555 ], [ %besterr.8, %556 ]
  br label %753

; <label>:558                                     ; preds = %487
  %559 = add nsw i32 %tc.0, 2
  %560 = icmp sge i32 %559, %50
  br i1 %560, label %561, label %621

; <label>:561                                     ; preds = %558
  %562 = add nsw i32 %tc.0, 2
  %563 = icmp sle i32 %562, %73
  br i1 %563, label %564, label %621

; <label>:564                                     ; preds = %561
  %565 = sub nsw i32 %tr.0, 2
  %566 = icmp sge i32 %565, %96
  br i1 %566, label %567, label %621

; <label>:567                                     ; preds = %564
  %568 = sub nsw i32 %tr.0, 2
  %569 = icmp sle i32 %568, %119
  br i1 %569, label %570, label %621

; <label>:570                                     ; preds = %567
  %571 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %572 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %571, align 8
  %573 = sub nsw i32 %tr.0, 2
  %574 = ashr i32 %573, 2
  %575 = mul nsw i32 %574, 32
  %576 = add nsw i32 %tc.0, 2
  %577 = ashr i32 %576, 2
  %578 = add nsw i32 %575, %577
  %579 = sub nsw i32 %578, %232
  %580 = sext i32 %579 to i64
  %581 = getelementptr inbounds i8* %222, i64 %580
  %582 = add nsw i32 %tc.0, 2
  %583 = and i32 %582, 3
  %584 = shl i32 %583, 1
  %585 = sub nsw i32 %tr.0, 2
  %586 = and i32 %585, 3
  %587 = shl i32 %586, 1
  %588 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %589 = load i32* %588, align 4
  %590 = call i32 %572(i8* %581, i32 32, i32 %584, i32 %587, i8* %7, i32 %589, i32* %sse)
  %591 = icmp ne i32** %mvcost, null
  br i1 %591, label %592, label %611

; <label>:592                                     ; preds = %570
  %593 = sub nsw i32 %tr.0, 2
  %594 = sub nsw i32 %593, %12
  %595 = sext i32 %594 to i64
  %596 = getelementptr inbounds i32** %mvcost, i64 0
  %597 = load i32** %596, align 8
  %598 = getelementptr inbounds i32* %597, i64 %595
  %599 = load i32* %598, align 4
  %600 = add nsw i32 %tc.0, 2
  %601 = sub nsw i32 %600, %17
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds i32** %mvcost, i64 1
  %604 = load i32** %603, align 8
  %605 = getelementptr inbounds i32* %604, i64 %602
  %606 = load i32* %605, align 4
  %607 = add nsw i32 %599, %606
  %608 = mul nsw i32 %607, %error_per_bit
  %609 = add nsw i32 %608, 128
  %610 = ashr i32 %609, 8
  br label %612

; <label>:611                                     ; preds = %570
  br label %612

; <label>:612                                     ; preds = %611, %592
  %613 = phi i32 [ %610, %592 ], [ 0, %611 ]
  %614 = add nsw i32 %613, %590
  %615 = icmp ult i32 %614, %besterr.8
  br i1 %615, label %616, label %620

; <label>:616                                     ; preds = %612
  %617 = sub nsw i32 %tr.0, 2
  %618 = add nsw i32 %tc.0, 2
  store i32 %590, i32* %distortion, align 4
  %619 = load i32* %sse, align 4
  store i32 %619, i32* %sse1, align 4
  br label %620

; <label>:620                                     ; preds = %616, %612
  %br.11 = phi i32 [ %617, %616 ], [ %br.8, %612 ]
  %bc.11 = phi i32 [ %618, %616 ], [ %bc.8, %612 ]
  %besterr.11 = phi i32 [ %614, %616 ], [ %besterr.8, %612 ]
  br label %622

; <label>:621                                     ; preds = %567, %564, %561, %558
  br label %622

; <label>:622                                     ; preds = %621, %620
  %br.12 = phi i32 [ %br.11, %620 ], [ %br.8, %621 ]
  %bc.12 = phi i32 [ %bc.11, %620 ], [ %bc.8, %621 ]
  %besterr.12 = phi i32 [ %besterr.11, %620 ], [ %besterr.8, %621 ]
  br label %753

; <label>:623                                     ; preds = %487
  %624 = sub nsw i32 %tc.0, 2
  %625 = icmp sge i32 %624, %50
  br i1 %625, label %626, label %686

; <label>:626                                     ; preds = %623
  %627 = sub nsw i32 %tc.0, 2
  %628 = icmp sle i32 %627, %73
  br i1 %628, label %629, label %686

; <label>:629                                     ; preds = %626
  %630 = add nsw i32 %tr.0, 2
  %631 = icmp sge i32 %630, %96
  br i1 %631, label %632, label %686

; <label>:632                                     ; preds = %629
  %633 = add nsw i32 %tr.0, 2
  %634 = icmp sle i32 %633, %119
  br i1 %634, label %635, label %686

; <label>:635                                     ; preds = %632
  %636 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %637 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %636, align 8
  %638 = add nsw i32 %tr.0, 2
  %639 = ashr i32 %638, 2
  %640 = mul nsw i32 %639, 32
  %641 = sub nsw i32 %tc.0, 2
  %642 = ashr i32 %641, 2
  %643 = add nsw i32 %640, %642
  %644 = sub nsw i32 %643, %232
  %645 = sext i32 %644 to i64
  %646 = getelementptr inbounds i8* %222, i64 %645
  %647 = sub nsw i32 %tc.0, 2
  %648 = and i32 %647, 3
  %649 = shl i32 %648, 1
  %650 = add nsw i32 %tr.0, 2
  %651 = and i32 %650, 3
  %652 = shl i32 %651, 1
  %653 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %654 = load i32* %653, align 4
  %655 = call i32 %637(i8* %646, i32 32, i32 %649, i32 %652, i8* %7, i32 %654, i32* %sse)
  %656 = icmp ne i32** %mvcost, null
  br i1 %656, label %657, label %676

; <label>:657                                     ; preds = %635
  %658 = add nsw i32 %tr.0, 2
  %659 = sub nsw i32 %658, %12
  %660 = sext i32 %659 to i64
  %661 = getelementptr inbounds i32** %mvcost, i64 0
  %662 = load i32** %661, align 8
  %663 = getelementptr inbounds i32* %662, i64 %660
  %664 = load i32* %663, align 4
  %665 = sub nsw i32 %tc.0, 2
  %666 = sub nsw i32 %665, %17
  %667 = sext i32 %666 to i64
  %668 = getelementptr inbounds i32** %mvcost, i64 1
  %669 = load i32** %668, align 8
  %670 = getelementptr inbounds i32* %669, i64 %667
  %671 = load i32* %670, align 4
  %672 = add nsw i32 %664, %671
  %673 = mul nsw i32 %672, %error_per_bit
  %674 = add nsw i32 %673, 128
  %675 = ashr i32 %674, 8
  br label %677

; <label>:676                                     ; preds = %635
  br label %677

; <label>:677                                     ; preds = %676, %657
  %678 = phi i32 [ %675, %657 ], [ 0, %676 ]
  %679 = add nsw i32 %678, %655
  %680 = icmp ult i32 %679, %besterr.8
  br i1 %680, label %681, label %685

; <label>:681                                     ; preds = %677
  %682 = add nsw i32 %tr.0, 2
  %683 = sub nsw i32 %tc.0, 2
  store i32 %655, i32* %distortion, align 4
  %684 = load i32* %sse, align 4
  store i32 %684, i32* %sse1, align 4
  br label %685

; <label>:685                                     ; preds = %681, %677
  %br.13 = phi i32 [ %682, %681 ], [ %br.8, %677 ]
  %bc.13 = phi i32 [ %683, %681 ], [ %bc.8, %677 ]
  %besterr.13 = phi i32 [ %679, %681 ], [ %besterr.8, %677 ]
  br label %687

; <label>:686                                     ; preds = %632, %629, %626, %623
  br label %687

; <label>:687                                     ; preds = %686, %685
  %br.14 = phi i32 [ %br.13, %685 ], [ %br.8, %686 ]
  %bc.14 = phi i32 [ %bc.13, %685 ], [ %bc.8, %686 ]
  %besterr.14 = phi i32 [ %besterr.13, %685 ], [ %besterr.8, %686 ]
  br label %753

; <label>:688                                     ; preds = %487
  %689 = add nsw i32 %tc.0, 2
  %690 = icmp sge i32 %689, %50
  br i1 %690, label %691, label %751

; <label>:691                                     ; preds = %688
  %692 = add nsw i32 %tc.0, 2
  %693 = icmp sle i32 %692, %73
  br i1 %693, label %694, label %751

; <label>:694                                     ; preds = %691
  %695 = add nsw i32 %tr.0, 2
  %696 = icmp sge i32 %695, %96
  br i1 %696, label %697, label %751

; <label>:697                                     ; preds = %694
  %698 = add nsw i32 %tr.0, 2
  %699 = icmp sle i32 %698, %119
  br i1 %699, label %700, label %751

; <label>:700                                     ; preds = %697
  %701 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %702 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %701, align 8
  %703 = add nsw i32 %tr.0, 2
  %704 = ashr i32 %703, 2
  %705 = mul nsw i32 %704, 32
  %706 = add nsw i32 %tc.0, 2
  %707 = ashr i32 %706, 2
  %708 = add nsw i32 %705, %707
  %709 = sub nsw i32 %708, %232
  %710 = sext i32 %709 to i64
  %711 = getelementptr inbounds i8* %222, i64 %710
  %712 = add nsw i32 %tc.0, 2
  %713 = and i32 %712, 3
  %714 = shl i32 %713, 1
  %715 = add nsw i32 %tr.0, 2
  %716 = and i32 %715, 3
  %717 = shl i32 %716, 1
  %718 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %719 = load i32* %718, align 4
  %720 = call i32 %702(i8* %711, i32 32, i32 %714, i32 %717, i8* %7, i32 %719, i32* %sse)
  %721 = icmp ne i32** %mvcost, null
  br i1 %721, label %722, label %741

; <label>:722                                     ; preds = %700
  %723 = add nsw i32 %tr.0, 2
  %724 = sub nsw i32 %723, %12
  %725 = sext i32 %724 to i64
  %726 = getelementptr inbounds i32** %mvcost, i64 0
  %727 = load i32** %726, align 8
  %728 = getelementptr inbounds i32* %727, i64 %725
  %729 = load i32* %728, align 4
  %730 = add nsw i32 %tc.0, 2
  %731 = sub nsw i32 %730, %17
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds i32** %mvcost, i64 1
  %734 = load i32** %733, align 8
  %735 = getelementptr inbounds i32* %734, i64 %732
  %736 = load i32* %735, align 4
  %737 = add nsw i32 %729, %736
  %738 = mul nsw i32 %737, %error_per_bit
  %739 = add nsw i32 %738, 128
  %740 = ashr i32 %739, 8
  br label %742

; <label>:741                                     ; preds = %700
  br label %742

; <label>:742                                     ; preds = %741, %722
  %743 = phi i32 [ %740, %722 ], [ 0, %741 ]
  %744 = add nsw i32 %743, %720
  %745 = icmp ult i32 %744, %besterr.8
  br i1 %745, label %746, label %750

; <label>:746                                     ; preds = %742
  %747 = add nsw i32 %tr.0, 2
  %748 = add nsw i32 %tc.0, 2
  store i32 %720, i32* %distortion, align 4
  %749 = load i32* %sse, align 4
  store i32 %749, i32* %sse1, align 4
  br label %750

; <label>:750                                     ; preds = %746, %742
  %br.15 = phi i32 [ %747, %746 ], [ %br.8, %742 ]
  %bc.15 = phi i32 [ %748, %746 ], [ %bc.8, %742 ]
  %besterr.15 = phi i32 [ %744, %746 ], [ %besterr.8, %742 ]
  br label %752

; <label>:751                                     ; preds = %697, %694, %691, %688
  br label %752

; <label>:752                                     ; preds = %751, %750
  %br.16 = phi i32 [ %br.15, %750 ], [ %br.8, %751 ]
  %bc.16 = phi i32 [ %bc.15, %750 ], [ %bc.8, %751 ]
  %besterr.16 = phi i32 [ %besterr.15, %750 ], [ %besterr.8, %751 ]
  br label %753

; <label>:753                                     ; preds = %752, %687, %622, %557, %487
  %br.17 = phi i32 [ %br.8, %487 ], [ %br.16, %752 ], [ %br.14, %687 ], [ %br.12, %622 ], [ %br.10, %557 ]
  %bc.17 = phi i32 [ %bc.8, %487 ], [ %bc.16, %752 ], [ %bc.14, %687 ], [ %bc.12, %622 ], [ %bc.10, %557 ]
  %besterr.17 = phi i32 [ %besterr.8, %487 ], [ %besterr.16, %752 ], [ %besterr.14, %687 ], [ %besterr.12, %622 ], [ %besterr.10, %557 ]
  %754 = icmp eq i32 %tr.0, %br.17
  br i1 %754, label %755, label %758

; <label>:755                                     ; preds = %753
  %756 = icmp eq i32 %tc.0, %bc.17
  br i1 %756, label %757, label %758

; <label>:757                                     ; preds = %755
  br label %759

; <label>:758                                     ; preds = %755, %753
  br label %252

; <label>:759                                     ; preds = %757, %252
  %br.18 = phi i32 [ %br.17, %757 ], [ %br.0, %252 ]
  %bc.18 = phi i32 [ %bc.17, %757 ], [ %bc.0, %252 ]
  %besterr.18 = phi i32 [ %besterr.17, %757 ], [ %besterr.0, %252 ]
  br label %760

; <label>:760                                     ; preds = %1266, %759
  %br.19 = phi i32 [ %br.18, %759 ], [ %br.36, %1266 ]
  %bc.19 = phi i32 [ %bc.18, %759 ], [ %bc.36, %1266 ]
  %tr.1 = phi i32 [ %tr.0, %759 ], [ %br.36, %1266 ]
  %tc.1 = phi i32 [ %tc.0, %759 ], [ %bc.36, %1266 ]
  %besterr.19 = phi i32 [ %besterr.18, %759 ], [ %besterr.36, %1266 ]
  %quarteriters.0 = phi i32 [ 4, %759 ], [ %761, %1266 ]
  %761 = add i32 %quarteriters.0, -1
  %762 = icmp ne i32 %761, 0
  br i1 %762, label %763, label %1267

; <label>:763                                     ; preds = %760
  %764 = sub nsw i32 %tc.1, 1
  %765 = icmp sge i32 %764, %50
  br i1 %765, label %766, label %820

; <label>:766                                     ; preds = %763
  %767 = sub nsw i32 %tc.1, 1
  %768 = icmp sle i32 %767, %73
  br i1 %768, label %769, label %820

; <label>:769                                     ; preds = %766
  %770 = icmp sge i32 %tr.1, %96
  br i1 %770, label %771, label %820

; <label>:771                                     ; preds = %769
  %772 = icmp sle i32 %tr.1, %119
  br i1 %772, label %773, label %820

; <label>:773                                     ; preds = %771
  %774 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %775 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %774, align 8
  %776 = ashr i32 %tr.1, 2
  %777 = mul nsw i32 %776, 32
  %778 = sub nsw i32 %tc.1, 1
  %779 = ashr i32 %778, 2
  %780 = add nsw i32 %777, %779
  %781 = sub nsw i32 %780, %232
  %782 = sext i32 %781 to i64
  %783 = getelementptr inbounds i8* %222, i64 %782
  %784 = sub nsw i32 %tc.1, 1
  %785 = and i32 %784, 3
  %786 = shl i32 %785, 1
  %787 = and i32 %tr.1, 3
  %788 = shl i32 %787, 1
  %789 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %790 = load i32* %789, align 4
  %791 = call i32 %775(i8* %783, i32 32, i32 %786, i32 %788, i8* %7, i32 %790, i32* %sse)
  %792 = icmp ne i32** %mvcost, null
  br i1 %792, label %793, label %811

; <label>:793                                     ; preds = %773
  %794 = sub nsw i32 %tr.1, %12
  %795 = sext i32 %794 to i64
  %796 = getelementptr inbounds i32** %mvcost, i64 0
  %797 = load i32** %796, align 8
  %798 = getelementptr inbounds i32* %797, i64 %795
  %799 = load i32* %798, align 4
  %800 = sub nsw i32 %tc.1, 1
  %801 = sub nsw i32 %800, %17
  %802 = sext i32 %801 to i64
  %803 = getelementptr inbounds i32** %mvcost, i64 1
  %804 = load i32** %803, align 8
  %805 = getelementptr inbounds i32* %804, i64 %802
  %806 = load i32* %805, align 4
  %807 = add nsw i32 %799, %806
  %808 = mul nsw i32 %807, %error_per_bit
  %809 = add nsw i32 %808, 128
  %810 = ashr i32 %809, 8
  br label %812

; <label>:811                                     ; preds = %773
  br label %812

; <label>:812                                     ; preds = %811, %793
  %813 = phi i32 [ %810, %793 ], [ 0, %811 ]
  %814 = add nsw i32 %813, %791
  %815 = icmp ult i32 %814, %besterr.19
  br i1 %815, label %816, label %819

; <label>:816                                     ; preds = %812
  %817 = sub nsw i32 %tc.1, 1
  store i32 %791, i32* %distortion, align 4
  %818 = load i32* %sse, align 4
  store i32 %818, i32* %sse1, align 4
  br label %819

; <label>:819                                     ; preds = %816, %812
  %br.20 = phi i32 [ %tr.1, %816 ], [ %br.19, %812 ]
  %bc.20 = phi i32 [ %817, %816 ], [ %bc.19, %812 ]
  %besterr.20 = phi i32 [ %814, %816 ], [ %besterr.19, %812 ]
  br label %821

; <label>:820                                     ; preds = %771, %769, %766, %763
  br label %821

; <label>:821                                     ; preds = %820, %819
  %br.21 = phi i32 [ %br.20, %819 ], [ %br.19, %820 ]
  %bc.21 = phi i32 [ %bc.20, %819 ], [ %bc.19, %820 ]
  %besterr.21 = phi i32 [ %besterr.20, %819 ], [ %besterr.19, %820 ]
  %left.1 = phi i32 [ %814, %819 ], [ -1, %820 ]
  %822 = add nsw i32 %tc.1, 1
  %823 = icmp sge i32 %822, %50
  br i1 %823, label %824, label %878

; <label>:824                                     ; preds = %821
  %825 = add nsw i32 %tc.1, 1
  %826 = icmp sle i32 %825, %73
  br i1 %826, label %827, label %878

; <label>:827                                     ; preds = %824
  %828 = icmp sge i32 %tr.1, %96
  br i1 %828, label %829, label %878

; <label>:829                                     ; preds = %827
  %830 = icmp sle i32 %tr.1, %119
  br i1 %830, label %831, label %878

; <label>:831                                     ; preds = %829
  %832 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %833 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %832, align 8
  %834 = ashr i32 %tr.1, 2
  %835 = mul nsw i32 %834, 32
  %836 = add nsw i32 %tc.1, 1
  %837 = ashr i32 %836, 2
  %838 = add nsw i32 %835, %837
  %839 = sub nsw i32 %838, %232
  %840 = sext i32 %839 to i64
  %841 = getelementptr inbounds i8* %222, i64 %840
  %842 = add nsw i32 %tc.1, 1
  %843 = and i32 %842, 3
  %844 = shl i32 %843, 1
  %845 = and i32 %tr.1, 3
  %846 = shl i32 %845, 1
  %847 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %848 = load i32* %847, align 4
  %849 = call i32 %833(i8* %841, i32 32, i32 %844, i32 %846, i8* %7, i32 %848, i32* %sse)
  %850 = icmp ne i32** %mvcost, null
  br i1 %850, label %851, label %869

; <label>:851                                     ; preds = %831
  %852 = sub nsw i32 %tr.1, %12
  %853 = sext i32 %852 to i64
  %854 = getelementptr inbounds i32** %mvcost, i64 0
  %855 = load i32** %854, align 8
  %856 = getelementptr inbounds i32* %855, i64 %853
  %857 = load i32* %856, align 4
  %858 = add nsw i32 %tc.1, 1
  %859 = sub nsw i32 %858, %17
  %860 = sext i32 %859 to i64
  %861 = getelementptr inbounds i32** %mvcost, i64 1
  %862 = load i32** %861, align 8
  %863 = getelementptr inbounds i32* %862, i64 %860
  %864 = load i32* %863, align 4
  %865 = add nsw i32 %857, %864
  %866 = mul nsw i32 %865, %error_per_bit
  %867 = add nsw i32 %866, 128
  %868 = ashr i32 %867, 8
  br label %870

; <label>:869                                     ; preds = %831
  br label %870

; <label>:870                                     ; preds = %869, %851
  %871 = phi i32 [ %868, %851 ], [ 0, %869 ]
  %872 = add nsw i32 %871, %849
  %873 = icmp ult i32 %872, %besterr.21
  br i1 %873, label %874, label %877

; <label>:874                                     ; preds = %870
  %875 = add nsw i32 %tc.1, 1
  store i32 %849, i32* %distortion, align 4
  %876 = load i32* %sse, align 4
  store i32 %876, i32* %sse1, align 4
  br label %877

; <label>:877                                     ; preds = %874, %870
  %br.22 = phi i32 [ %tr.1, %874 ], [ %br.21, %870 ]
  %bc.22 = phi i32 [ %875, %874 ], [ %bc.21, %870 ]
  %besterr.22 = phi i32 [ %872, %874 ], [ %besterr.21, %870 ]
  br label %879

; <label>:878                                     ; preds = %829, %827, %824, %821
  br label %879

; <label>:879                                     ; preds = %878, %877
  %br.23 = phi i32 [ %br.22, %877 ], [ %br.21, %878 ]
  %bc.23 = phi i32 [ %bc.22, %877 ], [ %bc.21, %878 ]
  %besterr.23 = phi i32 [ %besterr.22, %877 ], [ %besterr.21, %878 ]
  %right.1 = phi i32 [ %872, %877 ], [ -1, %878 ]
  %880 = icmp sge i32 %tc.1, %50
  br i1 %880, label %881, label %936

; <label>:881                                     ; preds = %879
  %882 = icmp sle i32 %tc.1, %73
  br i1 %882, label %883, label %936

; <label>:883                                     ; preds = %881
  %884 = sub nsw i32 %tr.1, 1
  %885 = icmp sge i32 %884, %96
  br i1 %885, label %886, label %936

; <label>:886                                     ; preds = %883
  %887 = sub nsw i32 %tr.1, 1
  %888 = icmp sle i32 %887, %119
  br i1 %888, label %889, label %936

; <label>:889                                     ; preds = %886
  %890 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %891 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %890, align 8
  %892 = sub nsw i32 %tr.1, 1
  %893 = ashr i32 %892, 2
  %894 = mul nsw i32 %893, 32
  %895 = ashr i32 %tc.1, 2
  %896 = add nsw i32 %894, %895
  %897 = sub nsw i32 %896, %232
  %898 = sext i32 %897 to i64
  %899 = getelementptr inbounds i8* %222, i64 %898
  %900 = and i32 %tc.1, 3
  %901 = shl i32 %900, 1
  %902 = sub nsw i32 %tr.1, 1
  %903 = and i32 %902, 3
  %904 = shl i32 %903, 1
  %905 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %906 = load i32* %905, align 4
  %907 = call i32 %891(i8* %899, i32 32, i32 %901, i32 %904, i8* %7, i32 %906, i32* %sse)
  %908 = icmp ne i32** %mvcost, null
  br i1 %908, label %909, label %927

; <label>:909                                     ; preds = %889
  %910 = sub nsw i32 %tr.1, 1
  %911 = sub nsw i32 %910, %12
  %912 = sext i32 %911 to i64
  %913 = getelementptr inbounds i32** %mvcost, i64 0
  %914 = load i32** %913, align 8
  %915 = getelementptr inbounds i32* %914, i64 %912
  %916 = load i32* %915, align 4
  %917 = sub nsw i32 %tc.1, %17
  %918 = sext i32 %917 to i64
  %919 = getelementptr inbounds i32** %mvcost, i64 1
  %920 = load i32** %919, align 8
  %921 = getelementptr inbounds i32* %920, i64 %918
  %922 = load i32* %921, align 4
  %923 = add nsw i32 %916, %922
  %924 = mul nsw i32 %923, %error_per_bit
  %925 = add nsw i32 %924, 128
  %926 = ashr i32 %925, 8
  br label %928

; <label>:927                                     ; preds = %889
  br label %928

; <label>:928                                     ; preds = %927, %909
  %929 = phi i32 [ %926, %909 ], [ 0, %927 ]
  %930 = add nsw i32 %929, %907
  %931 = icmp ult i32 %930, %besterr.23
  br i1 %931, label %932, label %935

; <label>:932                                     ; preds = %928
  %933 = sub nsw i32 %tr.1, 1
  store i32 %907, i32* %distortion, align 4
  %934 = load i32* %sse, align 4
  store i32 %934, i32* %sse1, align 4
  br label %935

; <label>:935                                     ; preds = %932, %928
  %br.24 = phi i32 [ %933, %932 ], [ %br.23, %928 ]
  %bc.24 = phi i32 [ %tc.1, %932 ], [ %bc.23, %928 ]
  %besterr.24 = phi i32 [ %930, %932 ], [ %besterr.23, %928 ]
  br label %937

; <label>:936                                     ; preds = %886, %883, %881, %879
  br label %937

; <label>:937                                     ; preds = %936, %935
  %br.25 = phi i32 [ %br.24, %935 ], [ %br.23, %936 ]
  %bc.25 = phi i32 [ %bc.24, %935 ], [ %bc.23, %936 ]
  %besterr.25 = phi i32 [ %besterr.24, %935 ], [ %besterr.23, %936 ]
  %up.1 = phi i32 [ %930, %935 ], [ -1, %936 ]
  %938 = icmp sge i32 %tc.1, %50
  br i1 %938, label %939, label %994

; <label>:939                                     ; preds = %937
  %940 = icmp sle i32 %tc.1, %73
  br i1 %940, label %941, label %994

; <label>:941                                     ; preds = %939
  %942 = add nsw i32 %tr.1, 1
  %943 = icmp sge i32 %942, %96
  br i1 %943, label %944, label %994

; <label>:944                                     ; preds = %941
  %945 = add nsw i32 %tr.1, 1
  %946 = icmp sle i32 %945, %119
  br i1 %946, label %947, label %994

; <label>:947                                     ; preds = %944
  %948 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %949 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %948, align 8
  %950 = add nsw i32 %tr.1, 1
  %951 = ashr i32 %950, 2
  %952 = mul nsw i32 %951, 32
  %953 = ashr i32 %tc.1, 2
  %954 = add nsw i32 %952, %953
  %955 = sub nsw i32 %954, %232
  %956 = sext i32 %955 to i64
  %957 = getelementptr inbounds i8* %222, i64 %956
  %958 = and i32 %tc.1, 3
  %959 = shl i32 %958, 1
  %960 = add nsw i32 %tr.1, 1
  %961 = and i32 %960, 3
  %962 = shl i32 %961, 1
  %963 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %964 = load i32* %963, align 4
  %965 = call i32 %949(i8* %957, i32 32, i32 %959, i32 %962, i8* %7, i32 %964, i32* %sse)
  %966 = icmp ne i32** %mvcost, null
  br i1 %966, label %967, label %985

; <label>:967                                     ; preds = %947
  %968 = add nsw i32 %tr.1, 1
  %969 = sub nsw i32 %968, %12
  %970 = sext i32 %969 to i64
  %971 = getelementptr inbounds i32** %mvcost, i64 0
  %972 = load i32** %971, align 8
  %973 = getelementptr inbounds i32* %972, i64 %970
  %974 = load i32* %973, align 4
  %975 = sub nsw i32 %tc.1, %17
  %976 = sext i32 %975 to i64
  %977 = getelementptr inbounds i32** %mvcost, i64 1
  %978 = load i32** %977, align 8
  %979 = getelementptr inbounds i32* %978, i64 %976
  %980 = load i32* %979, align 4
  %981 = add nsw i32 %974, %980
  %982 = mul nsw i32 %981, %error_per_bit
  %983 = add nsw i32 %982, 128
  %984 = ashr i32 %983, 8
  br label %986

; <label>:985                                     ; preds = %947
  br label %986

; <label>:986                                     ; preds = %985, %967
  %987 = phi i32 [ %984, %967 ], [ 0, %985 ]
  %988 = add nsw i32 %987, %965
  %989 = icmp ult i32 %988, %besterr.25
  br i1 %989, label %990, label %993

; <label>:990                                     ; preds = %986
  %991 = add nsw i32 %tr.1, 1
  store i32 %965, i32* %distortion, align 4
  %992 = load i32* %sse, align 4
  store i32 %992, i32* %sse1, align 4
  br label %993

; <label>:993                                     ; preds = %990, %986
  %br.26 = phi i32 [ %991, %990 ], [ %br.25, %986 ]
  %bc.26 = phi i32 [ %tc.1, %990 ], [ %bc.25, %986 ]
  %besterr.26 = phi i32 [ %988, %990 ], [ %besterr.25, %986 ]
  br label %995

; <label>:994                                     ; preds = %944, %941, %939, %937
  br label %995

; <label>:995                                     ; preds = %994, %993
  %br.27 = phi i32 [ %br.26, %993 ], [ %br.25, %994 ]
  %bc.27 = phi i32 [ %bc.26, %993 ], [ %bc.25, %994 ]
  %besterr.27 = phi i32 [ %besterr.26, %993 ], [ %besterr.25, %994 ]
  %down.1 = phi i32 [ %988, %993 ], [ -1, %994 ]
  %996 = icmp ult i32 %left.1, %right.1
  %997 = select i1 %996, i32 0, i32 1
  %998 = icmp ult i32 %up.1, %down.1
  %999 = select i1 %998, i32 0, i32 2
  %1000 = add nsw i32 %997, %999
  switch i32 %1000, label %1261 [
    i32 0, label %1001
    i32 1, label %1066
    i32 2, label %1131
    i32 3, label %1196
  ]

; <label>:1001                                    ; preds = %995
  %1002 = sub nsw i32 %tc.1, 1
  %1003 = icmp sge i32 %1002, %50
  br i1 %1003, label %1004, label %1064

; <label>:1004                                    ; preds = %1001
  %1005 = sub nsw i32 %tc.1, 1
  %1006 = icmp sle i32 %1005, %73
  br i1 %1006, label %1007, label %1064

; <label>:1007                                    ; preds = %1004
  %1008 = sub nsw i32 %tr.1, 1
  %1009 = icmp sge i32 %1008, %96
  br i1 %1009, label %1010, label %1064

; <label>:1010                                    ; preds = %1007
  %1011 = sub nsw i32 %tr.1, 1
  %1012 = icmp sle i32 %1011, %119
  br i1 %1012, label %1013, label %1064

; <label>:1013                                    ; preds = %1010
  %1014 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %1015 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1014, align 8
  %1016 = sub nsw i32 %tr.1, 1
  %1017 = ashr i32 %1016, 2
  %1018 = mul nsw i32 %1017, 32
  %1019 = sub nsw i32 %tc.1, 1
  %1020 = ashr i32 %1019, 2
  %1021 = add nsw i32 %1018, %1020
  %1022 = sub nsw i32 %1021, %232
  %1023 = sext i32 %1022 to i64
  %1024 = getelementptr inbounds i8* %222, i64 %1023
  %1025 = sub nsw i32 %tc.1, 1
  %1026 = and i32 %1025, 3
  %1027 = shl i32 %1026, 1
  %1028 = sub nsw i32 %tr.1, 1
  %1029 = and i32 %1028, 3
  %1030 = shl i32 %1029, 1
  %1031 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %1032 = load i32* %1031, align 4
  %1033 = call i32 %1015(i8* %1024, i32 32, i32 %1027, i32 %1030, i8* %7, i32 %1032, i32* %sse)
  %1034 = icmp ne i32** %mvcost, null
  br i1 %1034, label %1035, label %1054

; <label>:1035                                    ; preds = %1013
  %1036 = sub nsw i32 %tr.1, 1
  %1037 = sub nsw i32 %1036, %12
  %1038 = sext i32 %1037 to i64
  %1039 = getelementptr inbounds i32** %mvcost, i64 0
  %1040 = load i32** %1039, align 8
  %1041 = getelementptr inbounds i32* %1040, i64 %1038
  %1042 = load i32* %1041, align 4
  %1043 = sub nsw i32 %tc.1, 1
  %1044 = sub nsw i32 %1043, %17
  %1045 = sext i32 %1044 to i64
  %1046 = getelementptr inbounds i32** %mvcost, i64 1
  %1047 = load i32** %1046, align 8
  %1048 = getelementptr inbounds i32* %1047, i64 %1045
  %1049 = load i32* %1048, align 4
  %1050 = add nsw i32 %1042, %1049
  %1051 = mul nsw i32 %1050, %error_per_bit
  %1052 = add nsw i32 %1051, 128
  %1053 = ashr i32 %1052, 8
  br label %1055

; <label>:1054                                    ; preds = %1013
  br label %1055

; <label>:1055                                    ; preds = %1054, %1035
  %1056 = phi i32 [ %1053, %1035 ], [ 0, %1054 ]
  %1057 = add nsw i32 %1056, %1033
  %1058 = icmp ult i32 %1057, %besterr.27
  br i1 %1058, label %1059, label %1063

; <label>:1059                                    ; preds = %1055
  %1060 = sub nsw i32 %tr.1, 1
  %1061 = sub nsw i32 %tc.1, 1
  store i32 %1033, i32* %distortion, align 4
  %1062 = load i32* %sse, align 4
  store i32 %1062, i32* %sse1, align 4
  br label %1063

; <label>:1063                                    ; preds = %1059, %1055
  %br.28 = phi i32 [ %1060, %1059 ], [ %br.27, %1055 ]
  %bc.28 = phi i32 [ %1061, %1059 ], [ %bc.27, %1055 ]
  %besterr.28 = phi i32 [ %1057, %1059 ], [ %besterr.27, %1055 ]
  br label %1065

; <label>:1064                                    ; preds = %1010, %1007, %1004, %1001
  br label %1065

; <label>:1065                                    ; preds = %1064, %1063
  %br.29 = phi i32 [ %br.28, %1063 ], [ %br.27, %1064 ]
  %bc.29 = phi i32 [ %bc.28, %1063 ], [ %bc.27, %1064 ]
  %besterr.29 = phi i32 [ %besterr.28, %1063 ], [ %besterr.27, %1064 ]
  br label %1261

; <label>:1066                                    ; preds = %995
  %1067 = add nsw i32 %tc.1, 1
  %1068 = icmp sge i32 %1067, %50
  br i1 %1068, label %1069, label %1129

; <label>:1069                                    ; preds = %1066
  %1070 = add nsw i32 %tc.1, 1
  %1071 = icmp sle i32 %1070, %73
  br i1 %1071, label %1072, label %1129

; <label>:1072                                    ; preds = %1069
  %1073 = sub nsw i32 %tr.1, 1
  %1074 = icmp sge i32 %1073, %96
  br i1 %1074, label %1075, label %1129

; <label>:1075                                    ; preds = %1072
  %1076 = sub nsw i32 %tr.1, 1
  %1077 = icmp sle i32 %1076, %119
  br i1 %1077, label %1078, label %1129

; <label>:1078                                    ; preds = %1075
  %1079 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %1080 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1079, align 8
  %1081 = sub nsw i32 %tr.1, 1
  %1082 = ashr i32 %1081, 2
  %1083 = mul nsw i32 %1082, 32
  %1084 = add nsw i32 %tc.1, 1
  %1085 = ashr i32 %1084, 2
  %1086 = add nsw i32 %1083, %1085
  %1087 = sub nsw i32 %1086, %232
  %1088 = sext i32 %1087 to i64
  %1089 = getelementptr inbounds i8* %222, i64 %1088
  %1090 = add nsw i32 %tc.1, 1
  %1091 = and i32 %1090, 3
  %1092 = shl i32 %1091, 1
  %1093 = sub nsw i32 %tr.1, 1
  %1094 = and i32 %1093, 3
  %1095 = shl i32 %1094, 1
  %1096 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %1097 = load i32* %1096, align 4
  %1098 = call i32 %1080(i8* %1089, i32 32, i32 %1092, i32 %1095, i8* %7, i32 %1097, i32* %sse)
  %1099 = icmp ne i32** %mvcost, null
  br i1 %1099, label %1100, label %1119

; <label>:1100                                    ; preds = %1078
  %1101 = sub nsw i32 %tr.1, 1
  %1102 = sub nsw i32 %1101, %12
  %1103 = sext i32 %1102 to i64
  %1104 = getelementptr inbounds i32** %mvcost, i64 0
  %1105 = load i32** %1104, align 8
  %1106 = getelementptr inbounds i32* %1105, i64 %1103
  %1107 = load i32* %1106, align 4
  %1108 = add nsw i32 %tc.1, 1
  %1109 = sub nsw i32 %1108, %17
  %1110 = sext i32 %1109 to i64
  %1111 = getelementptr inbounds i32** %mvcost, i64 1
  %1112 = load i32** %1111, align 8
  %1113 = getelementptr inbounds i32* %1112, i64 %1110
  %1114 = load i32* %1113, align 4
  %1115 = add nsw i32 %1107, %1114
  %1116 = mul nsw i32 %1115, %error_per_bit
  %1117 = add nsw i32 %1116, 128
  %1118 = ashr i32 %1117, 8
  br label %1120

; <label>:1119                                    ; preds = %1078
  br label %1120

; <label>:1120                                    ; preds = %1119, %1100
  %1121 = phi i32 [ %1118, %1100 ], [ 0, %1119 ]
  %1122 = add nsw i32 %1121, %1098
  %1123 = icmp ult i32 %1122, %besterr.27
  br i1 %1123, label %1124, label %1128

; <label>:1124                                    ; preds = %1120
  %1125 = sub nsw i32 %tr.1, 1
  %1126 = add nsw i32 %tc.1, 1
  store i32 %1098, i32* %distortion, align 4
  %1127 = load i32* %sse, align 4
  store i32 %1127, i32* %sse1, align 4
  br label %1128

; <label>:1128                                    ; preds = %1124, %1120
  %br.30 = phi i32 [ %1125, %1124 ], [ %br.27, %1120 ]
  %bc.30 = phi i32 [ %1126, %1124 ], [ %bc.27, %1120 ]
  %besterr.30 = phi i32 [ %1122, %1124 ], [ %besterr.27, %1120 ]
  br label %1130

; <label>:1129                                    ; preds = %1075, %1072, %1069, %1066
  br label %1130

; <label>:1130                                    ; preds = %1129, %1128
  %br.31 = phi i32 [ %br.30, %1128 ], [ %br.27, %1129 ]
  %bc.31 = phi i32 [ %bc.30, %1128 ], [ %bc.27, %1129 ]
  %besterr.31 = phi i32 [ %besterr.30, %1128 ], [ %besterr.27, %1129 ]
  br label %1261

; <label>:1131                                    ; preds = %995
  %1132 = sub nsw i32 %tc.1, 1
  %1133 = icmp sge i32 %1132, %50
  br i1 %1133, label %1134, label %1194

; <label>:1134                                    ; preds = %1131
  %1135 = sub nsw i32 %tc.1, 1
  %1136 = icmp sle i32 %1135, %73
  br i1 %1136, label %1137, label %1194

; <label>:1137                                    ; preds = %1134
  %1138 = add nsw i32 %tr.1, 1
  %1139 = icmp sge i32 %1138, %96
  br i1 %1139, label %1140, label %1194

; <label>:1140                                    ; preds = %1137
  %1141 = add nsw i32 %tr.1, 1
  %1142 = icmp sle i32 %1141, %119
  br i1 %1142, label %1143, label %1194

; <label>:1143                                    ; preds = %1140
  %1144 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %1145 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1144, align 8
  %1146 = add nsw i32 %tr.1, 1
  %1147 = ashr i32 %1146, 2
  %1148 = mul nsw i32 %1147, 32
  %1149 = sub nsw i32 %tc.1, 1
  %1150 = ashr i32 %1149, 2
  %1151 = add nsw i32 %1148, %1150
  %1152 = sub nsw i32 %1151, %232
  %1153 = sext i32 %1152 to i64
  %1154 = getelementptr inbounds i8* %222, i64 %1153
  %1155 = sub nsw i32 %tc.1, 1
  %1156 = and i32 %1155, 3
  %1157 = shl i32 %1156, 1
  %1158 = add nsw i32 %tr.1, 1
  %1159 = and i32 %1158, 3
  %1160 = shl i32 %1159, 1
  %1161 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %1162 = load i32* %1161, align 4
  %1163 = call i32 %1145(i8* %1154, i32 32, i32 %1157, i32 %1160, i8* %7, i32 %1162, i32* %sse)
  %1164 = icmp ne i32** %mvcost, null
  br i1 %1164, label %1165, label %1184

; <label>:1165                                    ; preds = %1143
  %1166 = add nsw i32 %tr.1, 1
  %1167 = sub nsw i32 %1166, %12
  %1168 = sext i32 %1167 to i64
  %1169 = getelementptr inbounds i32** %mvcost, i64 0
  %1170 = load i32** %1169, align 8
  %1171 = getelementptr inbounds i32* %1170, i64 %1168
  %1172 = load i32* %1171, align 4
  %1173 = sub nsw i32 %tc.1, 1
  %1174 = sub nsw i32 %1173, %17
  %1175 = sext i32 %1174 to i64
  %1176 = getelementptr inbounds i32** %mvcost, i64 1
  %1177 = load i32** %1176, align 8
  %1178 = getelementptr inbounds i32* %1177, i64 %1175
  %1179 = load i32* %1178, align 4
  %1180 = add nsw i32 %1172, %1179
  %1181 = mul nsw i32 %1180, %error_per_bit
  %1182 = add nsw i32 %1181, 128
  %1183 = ashr i32 %1182, 8
  br label %1185

; <label>:1184                                    ; preds = %1143
  br label %1185

; <label>:1185                                    ; preds = %1184, %1165
  %1186 = phi i32 [ %1183, %1165 ], [ 0, %1184 ]
  %1187 = add nsw i32 %1186, %1163
  %1188 = icmp ult i32 %1187, %besterr.27
  br i1 %1188, label %1189, label %1193

; <label>:1189                                    ; preds = %1185
  %1190 = add nsw i32 %tr.1, 1
  %1191 = sub nsw i32 %tc.1, 1
  store i32 %1163, i32* %distortion, align 4
  %1192 = load i32* %sse, align 4
  store i32 %1192, i32* %sse1, align 4
  br label %1193

; <label>:1193                                    ; preds = %1189, %1185
  %br.32 = phi i32 [ %1190, %1189 ], [ %br.27, %1185 ]
  %bc.32 = phi i32 [ %1191, %1189 ], [ %bc.27, %1185 ]
  %besterr.32 = phi i32 [ %1187, %1189 ], [ %besterr.27, %1185 ]
  br label %1195

; <label>:1194                                    ; preds = %1140, %1137, %1134, %1131
  br label %1195

; <label>:1195                                    ; preds = %1194, %1193
  %br.33 = phi i32 [ %br.32, %1193 ], [ %br.27, %1194 ]
  %bc.33 = phi i32 [ %bc.32, %1193 ], [ %bc.27, %1194 ]
  %besterr.33 = phi i32 [ %besterr.32, %1193 ], [ %besterr.27, %1194 ]
  br label %1261

; <label>:1196                                    ; preds = %995
  %1197 = add nsw i32 %tc.1, 1
  %1198 = icmp sge i32 %1197, %50
  br i1 %1198, label %1199, label %1259

; <label>:1199                                    ; preds = %1196
  %1200 = add nsw i32 %tc.1, 1
  %1201 = icmp sle i32 %1200, %73
  br i1 %1201, label %1202, label %1259

; <label>:1202                                    ; preds = %1199
  %1203 = add nsw i32 %tr.1, 1
  %1204 = icmp sge i32 %1203, %96
  br i1 %1204, label %1205, label %1259

; <label>:1205                                    ; preds = %1202
  %1206 = add nsw i32 %tr.1, 1
  %1207 = icmp sle i32 %1206, %119
  br i1 %1207, label %1208, label %1259

; <label>:1208                                    ; preds = %1205
  %1209 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %1210 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1209, align 8
  %1211 = add nsw i32 %tr.1, 1
  %1212 = ashr i32 %1211, 2
  %1213 = mul nsw i32 %1212, 32
  %1214 = add nsw i32 %tc.1, 1
  %1215 = ashr i32 %1214, 2
  %1216 = add nsw i32 %1213, %1215
  %1217 = sub nsw i32 %1216, %232
  %1218 = sext i32 %1217 to i64
  %1219 = getelementptr inbounds i8* %222, i64 %1218
  %1220 = add nsw i32 %tc.1, 1
  %1221 = and i32 %1220, 3
  %1222 = shl i32 %1221, 1
  %1223 = add nsw i32 %tr.1, 1
  %1224 = and i32 %1223, 3
  %1225 = shl i32 %1224, 1
  %1226 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %1227 = load i32* %1226, align 4
  %1228 = call i32 %1210(i8* %1219, i32 32, i32 %1222, i32 %1225, i8* %7, i32 %1227, i32* %sse)
  %1229 = icmp ne i32** %mvcost, null
  br i1 %1229, label %1230, label %1249

; <label>:1230                                    ; preds = %1208
  %1231 = add nsw i32 %tr.1, 1
  %1232 = sub nsw i32 %1231, %12
  %1233 = sext i32 %1232 to i64
  %1234 = getelementptr inbounds i32** %mvcost, i64 0
  %1235 = load i32** %1234, align 8
  %1236 = getelementptr inbounds i32* %1235, i64 %1233
  %1237 = load i32* %1236, align 4
  %1238 = add nsw i32 %tc.1, 1
  %1239 = sub nsw i32 %1238, %17
  %1240 = sext i32 %1239 to i64
  %1241 = getelementptr inbounds i32** %mvcost, i64 1
  %1242 = load i32** %1241, align 8
  %1243 = getelementptr inbounds i32* %1242, i64 %1240
  %1244 = load i32* %1243, align 4
  %1245 = add nsw i32 %1237, %1244
  %1246 = mul nsw i32 %1245, %error_per_bit
  %1247 = add nsw i32 %1246, 128
  %1248 = ashr i32 %1247, 8
  br label %1250

; <label>:1249                                    ; preds = %1208
  br label %1250

; <label>:1250                                    ; preds = %1249, %1230
  %1251 = phi i32 [ %1248, %1230 ], [ 0, %1249 ]
  %1252 = add nsw i32 %1251, %1228
  %1253 = icmp ult i32 %1252, %besterr.27
  br i1 %1253, label %1254, label %1258

; <label>:1254                                    ; preds = %1250
  %1255 = add nsw i32 %tr.1, 1
  %1256 = add nsw i32 %tc.1, 1
  store i32 %1228, i32* %distortion, align 4
  %1257 = load i32* %sse, align 4
  store i32 %1257, i32* %sse1, align 4
  br label %1258

; <label>:1258                                    ; preds = %1254, %1250
  %br.34 = phi i32 [ %1255, %1254 ], [ %br.27, %1250 ]
  %bc.34 = phi i32 [ %1256, %1254 ], [ %bc.27, %1250 ]
  %besterr.34 = phi i32 [ %1252, %1254 ], [ %besterr.27, %1250 ]
  br label %1260

; <label>:1259                                    ; preds = %1205, %1202, %1199, %1196
  br label %1260

; <label>:1260                                    ; preds = %1259, %1258
  %br.35 = phi i32 [ %br.34, %1258 ], [ %br.27, %1259 ]
  %bc.35 = phi i32 [ %bc.34, %1258 ], [ %bc.27, %1259 ]
  %besterr.35 = phi i32 [ %besterr.34, %1258 ], [ %besterr.27, %1259 ]
  br label %1261

; <label>:1261                                    ; preds = %1260, %1195, %1130, %1065, %995
  %br.36 = phi i32 [ %br.27, %995 ], [ %br.35, %1260 ], [ %br.33, %1195 ], [ %br.31, %1130 ], [ %br.29, %1065 ]
  %bc.36 = phi i32 [ %bc.27, %995 ], [ %bc.35, %1260 ], [ %bc.33, %1195 ], [ %bc.31, %1130 ], [ %bc.29, %1065 ]
  %besterr.36 = phi i32 [ %besterr.27, %995 ], [ %besterr.35, %1260 ], [ %besterr.33, %1195 ], [ %besterr.31, %1130 ], [ %besterr.29, %1065 ]
  %1262 = icmp eq i32 %tr.1, %br.36
  br i1 %1262, label %1263, label %1266

; <label>:1263                                    ; preds = %1261
  %1264 = icmp eq i32 %tc.1, %bc.36
  br i1 %1264, label %1265, label %1266

; <label>:1265                                    ; preds = %1263
  br label %1267

; <label>:1266                                    ; preds = %1263, %1261
  br label %760

; <label>:1267                                    ; preds = %1265, %760
  %br.37 = phi i32 [ %br.36, %1265 ], [ %br.19, %760 ]
  %bc.37 = phi i32 [ %bc.36, %1265 ], [ %bc.19, %760 ]
  %besterr.37 = phi i32 [ %besterr.36, %1265 ], [ %besterr.19, %760 ]
  %1268 = mul nsw i32 %br.37, 2
  %1269 = trunc i32 %1268 to i16
  %1270 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %1271 = getelementptr inbounds %struct.MV* %1270, i32 0, i32 0
  store i16 %1269, i16* %1271, align 2
  %1272 = mul nsw i32 %bc.37, 2
  %1273 = trunc i32 %1272 to i16
  %1274 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %1275 = getelementptr inbounds %struct.MV* %1274, i32 0, i32 1
  store i16 %1273, i16* %1275, align 2
  %1276 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %1277 = getelementptr inbounds %struct.MV* %1276, i32 0, i32 1
  %1278 = load i16* %1277, align 2
  %1279 = sext i16 %1278 to i32
  %1280 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %1281 = getelementptr inbounds %struct.MV* %1280, i32 0, i32 1
  %1282 = load i16* %1281, align 2
  %1283 = sext i16 %1282 to i32
  %1284 = sub nsw i32 %1279, %1283
  %1285 = call i32 @abs(i32 %1284) #3
  %1286 = icmp sgt i32 %1285, 2040
  br i1 %1286, label %1299, label %1287

; <label>:1287                                    ; preds = %1267
  %1288 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %1289 = getelementptr inbounds %struct.MV* %1288, i32 0, i32 0
  %1290 = load i16* %1289, align 2
  %1291 = sext i16 %1290 to i32
  %1292 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %1293 = getelementptr inbounds %struct.MV* %1292, i32 0, i32 0
  %1294 = load i16* %1293, align 2
  %1295 = sext i16 %1294 to i32
  %1296 = sub nsw i32 %1291, %1295
  %1297 = call i32 @abs(i32 %1296) #3
  %1298 = icmp sgt i32 %1297, 2040
  br i1 %1298, label %1299, label %1300

; <label>:1299                                    ; preds = %1287, %1267
  br label %1301

; <label>:1300                                    ; preds = %1287
  br label %1301

; <label>:1301                                    ; preds = %1300, %1299
  %.0 = phi i32 [ 2147483647, %1299 ], [ %besterr.37, %1300 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define internal i32 @mv_err_cost(%union.int_mv* %mv, %union.int_mv* %ref, i32** %mvcost, i32 %error_per_bit) #0 {
  %1 = icmp ne i32** %mvcost, null
  br i1 %1, label %2, label %37

; <label>:2                                       ; preds = %0
  %3 = bitcast %union.int_mv* %mv to %struct.MV*
  %4 = getelementptr inbounds %struct.MV* %3, i32 0, i32 0
  %5 = load i16* %4, align 2
  %6 = sext i16 %5 to i32
  %7 = bitcast %union.int_mv* %ref to %struct.MV*
  %8 = getelementptr inbounds %struct.MV* %7, i32 0, i32 0
  %9 = load i16* %8, align 2
  %10 = sext i16 %9 to i32
  %11 = sub nsw i32 %6, %10
  %12 = ashr i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32** %mvcost, i64 0
  %15 = load i32** %14, align 8
  %16 = getelementptr inbounds i32* %15, i64 %13
  %17 = load i32* %16, align 4
  %18 = bitcast %union.int_mv* %mv to %struct.MV*
  %19 = getelementptr inbounds %struct.MV* %18, i32 0, i32 1
  %20 = load i16* %19, align 2
  %21 = sext i16 %20 to i32
  %22 = bitcast %union.int_mv* %ref to %struct.MV*
  %23 = getelementptr inbounds %struct.MV* %22, i32 0, i32 1
  %24 = load i16* %23, align 2
  %25 = sext i16 %24 to i32
  %26 = sub nsw i32 %21, %25
  %27 = ashr i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32** %mvcost, i64 1
  %30 = load i32** %29, align 8
  %31 = getelementptr inbounds i32* %30, i64 %28
  %32 = load i32* %31, align 4
  %33 = add nsw i32 %17, %32
  %34 = mul nsw i32 %33, %error_per_bit
  %35 = add nsw i32 %34, 128
  %36 = ashr i32 %35, 8
  br label %38

; <label>:37                                      ; preds = %0
  br label %38

; <label>:38                                      ; preds = %37, %2
  %.0 = phi i32 [ %36, %2 ], [ 0, %37 ]
  ret i32 %.0
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #1

; Function Attrs: nounwind uwtable
define i32 @vp8_find_best_sub_pixel_step(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32 %error_per_bit, %struct.variance_vtable* %vfp, i32** %mvcost, i32* %distortion, i32* %sse1) #0 {
  %startmv = alloca %union.int_mv, align 4
  %this_mv = alloca %union.int_mv, align 4
  %sse = alloca i32, align 4
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9
  %2 = load i8*** %1, align 8
  %3 = load i8** %2, align 8
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8* %3, i64 %6
  %8 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %9 = getelementptr inbounds %struct.macroblockd* %8, i32 0, i32 11
  %10 = getelementptr inbounds %struct.yv12_buffer_config* %9, i32 0, i32 4
  %11 = load i32* %10, align 4
  %12 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %13 = getelementptr inbounds %struct.macroblockd* %12, i32 0, i32 11
  %14 = getelementptr inbounds %struct.yv12_buffer_config* %13, i32 0, i32 13
  %15 = load i8** %14, align 8
  %16 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %17 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4
  %18 = load i32* %17, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8* %15, i64 %19
  %21 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %22 = getelementptr inbounds %struct.MV* %21, i32 0, i32 0
  %23 = load i16* %22, align 2
  %24 = sext i16 %23 to i32
  %25 = mul nsw i32 %24, %11
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8* %20, i64 %26
  %28 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %29 = getelementptr inbounds %struct.MV* %28, i32 0, i32 1
  %30 = load i16* %29, align 2
  %31 = sext i16 %30 to i32
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8* %27, i64 %32
  %34 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 9
  %35 = load void (i8*, i32, i8*, i32, i32)** %34, align 8
  %36 = getelementptr inbounds i8* %33, i64 -1
  %37 = sext i32 %11 to i64
  %38 = sub i64 0, %37
  %39 = getelementptr inbounds i8* %36, i64 %38
  %40 = getelementptr inbounds %struct.macroblockd* %16, i32 0, i32 46
  %41 = getelementptr inbounds [704 x i8]* %40, i32 0, i32 0
  call void %35(i8* %39, i32 %11, i8* %41, i32 32, i32 18)
  %42 = getelementptr inbounds %struct.macroblockd* %16, i32 0, i32 46
  %43 = getelementptr inbounds [704 x i8]* %42, i32 0, i32 0
  %44 = sext i32 32 to i64
  %45 = getelementptr inbounds i8* %43, i64 %44
  %46 = getelementptr inbounds i8* %45, i64 1
  %47 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %48 = getelementptr inbounds %struct.MV* %47, i32 0, i32 0
  %49 = load i16* %48, align 2
  %50 = sext i16 %49 to i32
  %51 = shl i32 %50, 3
  %52 = trunc i32 %51 to i16
  store i16 %52, i16* %48, align 2
  %53 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %54 = getelementptr inbounds %struct.MV* %53, i32 0, i32 1
  %55 = load i16* %54, align 2
  %56 = sext i16 %55 to i32
  %57 = shl i32 %56, 3
  %58 = trunc i32 %57 to i16
  store i16 %58, i16* %54, align 2
  %59 = bitcast %union.int_mv* %startmv to i8*
  %60 = bitcast %union.int_mv* %bestmv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %59, i8* %60, i64 4, i32 4, i1 false)
  %61 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 1
  %62 = load i32 (i8*, i32, i8*, i32, i32*)** %61, align 8
  %63 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %64 = load i32* %63, align 4
  %65 = call i32 %62(i8* %46, i32 32, i8* %7, i32 %64, i32* %sse1)
  store i32 %65, i32* %distortion, align 4
  %66 = call i32 @mv_err_cost(%union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %67 = add nsw i32 %65, %66
  %68 = bitcast %union.int_mv* %startmv to %struct.MV*
  %69 = getelementptr inbounds %struct.MV* %68, i32 0, i32 0
  %70 = load i16* %69, align 2
  %71 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %72 = getelementptr inbounds %struct.MV* %71, i32 0, i32 0
  store i16 %70, i16* %72, align 2
  %73 = bitcast %union.int_mv* %startmv to %struct.MV*
  %74 = getelementptr inbounds %struct.MV* %73, i32 0, i32 1
  %75 = load i16* %74, align 2
  %76 = sext i16 %75 to i32
  %77 = sub nsw i32 %76, 8
  %78 = or i32 %77, 4
  %79 = trunc i32 %78 to i16
  %80 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %81 = getelementptr inbounds %struct.MV* %80, i32 0, i32 1
  store i16 %79, i16* %81, align 2
  %82 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 3
  %83 = load i32 (i8*, i32, i8*, i32, i32*)** %82, align 8
  %84 = getelementptr inbounds i8* %46, i64 -1
  %85 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %86 = load i32* %85, align 4
  %87 = call i32 %83(i8* %84, i32 32, i8* %7, i32 %86, i32* %sse)
  %88 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %89 = add nsw i32 %87, %88
  %90 = icmp slt i32 %89, %67
  br i1 %90, label %91, label %95

; <label>:91                                      ; preds = %0
  %92 = bitcast %union.int_mv* %bestmv to i8*
  %93 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %92, i8* %93, i64 4, i32 4, i1 false)
  store i32 %87, i32* %distortion, align 4
  %94 = load i32* %sse, align 4
  store i32 %94, i32* %sse1, align 4
  br label %95

; <label>:95                                      ; preds = %91, %0
  %bestmse.0 = phi i32 [ %89, %91 ], [ %67, %0 ]
  %96 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %97 = getelementptr inbounds %struct.MV* %96, i32 0, i32 1
  %98 = load i16* %97, align 2
  %99 = sext i16 %98 to i32
  %100 = add nsw i32 %99, 8
  %101 = trunc i32 %100 to i16
  store i16 %101, i16* %97, align 2
  %102 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 3
  %103 = load i32 (i8*, i32, i8*, i32, i32*)** %102, align 8
  %104 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %105 = load i32* %104, align 4
  %106 = call i32 %103(i8* %46, i32 32, i8* %7, i32 %105, i32* %sse)
  %107 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %108 = add nsw i32 %106, %107
  %109 = icmp slt i32 %108, %bestmse.0
  br i1 %109, label %110, label %114

; <label>:110                                     ; preds = %95
  %111 = bitcast %union.int_mv* %bestmv to i8*
  %112 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %111, i8* %112, i64 4, i32 4, i1 false)
  store i32 %106, i32* %distortion, align 4
  %113 = load i32* %sse, align 4
  store i32 %113, i32* %sse1, align 4
  br label %114

; <label>:114                                     ; preds = %110, %95
  %bestmse.1 = phi i32 [ %108, %110 ], [ %bestmse.0, %95 ]
  %115 = bitcast %union.int_mv* %startmv to %struct.MV*
  %116 = getelementptr inbounds %struct.MV* %115, i32 0, i32 1
  %117 = load i16* %116, align 2
  %118 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %119 = getelementptr inbounds %struct.MV* %118, i32 0, i32 1
  store i16 %117, i16* %119, align 2
  %120 = bitcast %union.int_mv* %startmv to %struct.MV*
  %121 = getelementptr inbounds %struct.MV* %120, i32 0, i32 0
  %122 = load i16* %121, align 2
  %123 = sext i16 %122 to i32
  %124 = sub nsw i32 %123, 8
  %125 = or i32 %124, 4
  %126 = trunc i32 %125 to i16
  %127 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %128 = getelementptr inbounds %struct.MV* %127, i32 0, i32 0
  store i16 %126, i16* %128, align 2
  %129 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 4
  %130 = load i32 (i8*, i32, i8*, i32, i32*)** %129, align 8
  %131 = sext i32 32 to i64
  %132 = sub i64 0, %131
  %133 = getelementptr inbounds i8* %46, i64 %132
  %134 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %135 = load i32* %134, align 4
  %136 = call i32 %130(i8* %133, i32 32, i8* %7, i32 %135, i32* %sse)
  %137 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %138 = add nsw i32 %136, %137
  %139 = icmp slt i32 %138, %bestmse.1
  br i1 %139, label %140, label %144

; <label>:140                                     ; preds = %114
  %141 = bitcast %union.int_mv* %bestmv to i8*
  %142 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %141, i8* %142, i64 4, i32 4, i1 false)
  store i32 %136, i32* %distortion, align 4
  %143 = load i32* %sse, align 4
  store i32 %143, i32* %sse1, align 4
  br label %144

; <label>:144                                     ; preds = %140, %114
  %bestmse.2 = phi i32 [ %138, %140 ], [ %bestmse.1, %114 ]
  %145 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %146 = getelementptr inbounds %struct.MV* %145, i32 0, i32 0
  %147 = load i16* %146, align 2
  %148 = sext i16 %147 to i32
  %149 = add nsw i32 %148, 8
  %150 = trunc i32 %149 to i16
  store i16 %150, i16* %146, align 2
  %151 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 4
  %152 = load i32 (i8*, i32, i8*, i32, i32*)** %151, align 8
  %153 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %154 = load i32* %153, align 4
  %155 = call i32 %152(i8* %46, i32 32, i8* %7, i32 %154, i32* %sse)
  %156 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %157 = add nsw i32 %155, %156
  %158 = icmp slt i32 %157, %bestmse.2
  br i1 %158, label %159, label %163

; <label>:159                                     ; preds = %144
  %160 = bitcast %union.int_mv* %bestmv to i8*
  %161 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %160, i8* %161, i64 4, i32 4, i1 false)
  store i32 %155, i32* %distortion, align 4
  %162 = load i32* %sse, align 4
  store i32 %162, i32* %sse1, align 4
  br label %163

; <label>:163                                     ; preds = %159, %144
  %bestmse.3 = phi i32 [ %157, %159 ], [ %bestmse.2, %144 ]
  %164 = icmp slt i32 %89, %108
  %165 = select i1 %164, i32 0, i32 1
  %166 = icmp slt i32 %138, %157
  %167 = select i1 %166, i32 0, i32 2
  %168 = add nsw i32 %165, %167
  %169 = bitcast %union.int_mv* %this_mv to i8*
  %170 = bitcast %union.int_mv* %startmv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %169, i8* %170, i64 4, i32 4, i1 false)
  switch i32 %168, label %246 [
    i32 0, label %171
    i32 1, label %199
    i32 2, label %223
    i32 3, label %245
  ]

; <label>:171                                     ; preds = %163
  %172 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %173 = getelementptr inbounds %struct.MV* %172, i32 0, i32 1
  %174 = load i16* %173, align 2
  %175 = sext i16 %174 to i32
  %176 = sub nsw i32 %175, 8
  %177 = or i32 %176, 4
  %178 = trunc i32 %177 to i16
  %179 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %180 = getelementptr inbounds %struct.MV* %179, i32 0, i32 1
  store i16 %178, i16* %180, align 2
  %181 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %182 = getelementptr inbounds %struct.MV* %181, i32 0, i32 0
  %183 = load i16* %182, align 2
  %184 = sext i16 %183 to i32
  %185 = sub nsw i32 %184, 8
  %186 = or i32 %185, 4
  %187 = trunc i32 %186 to i16
  %188 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %189 = getelementptr inbounds %struct.MV* %188, i32 0, i32 0
  store i16 %187, i16* %189, align 2
  %190 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5
  %191 = load i32 (i8*, i32, i8*, i32, i32*)** %190, align 8
  %192 = getelementptr inbounds i8* %46, i64 -1
  %193 = sext i32 32 to i64
  %194 = sub i64 0, %193
  %195 = getelementptr inbounds i8* %192, i64 %194
  %196 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %197 = load i32* %196, align 4
  %198 = call i32 %191(i8* %195, i32 32, i8* %7, i32 %197, i32* %sse)
  br label %264

; <label>:199                                     ; preds = %163
  %200 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %201 = getelementptr inbounds %struct.MV* %200, i32 0, i32 1
  %202 = load i16* %201, align 2
  %203 = sext i16 %202 to i32
  %204 = add nsw i32 %203, 4
  %205 = trunc i32 %204 to i16
  store i16 %205, i16* %201, align 2
  %206 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %207 = getelementptr inbounds %struct.MV* %206, i32 0, i32 0
  %208 = load i16* %207, align 2
  %209 = sext i16 %208 to i32
  %210 = sub nsw i32 %209, 8
  %211 = or i32 %210, 4
  %212 = trunc i32 %211 to i16
  %213 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %214 = getelementptr inbounds %struct.MV* %213, i32 0, i32 0
  store i16 %212, i16* %214, align 2
  %215 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5
  %216 = load i32 (i8*, i32, i8*, i32, i32*)** %215, align 8
  %217 = sext i32 32 to i64
  %218 = sub i64 0, %217
  %219 = getelementptr inbounds i8* %46, i64 %218
  %220 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %221 = load i32* %220, align 4
  %222 = call i32 %216(i8* %219, i32 32, i8* %7, i32 %221, i32* %sse)
  br label %264

; <label>:223                                     ; preds = %163
  %224 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %225 = getelementptr inbounds %struct.MV* %224, i32 0, i32 1
  %226 = load i16* %225, align 2
  %227 = sext i16 %226 to i32
  %228 = sub nsw i32 %227, 8
  %229 = or i32 %228, 4
  %230 = trunc i32 %229 to i16
  %231 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %232 = getelementptr inbounds %struct.MV* %231, i32 0, i32 1
  store i16 %230, i16* %232, align 2
  %233 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %234 = getelementptr inbounds %struct.MV* %233, i32 0, i32 0
  %235 = load i16* %234, align 2
  %236 = sext i16 %235 to i32
  %237 = add nsw i32 %236, 4
  %238 = trunc i32 %237 to i16
  store i16 %238, i16* %234, align 2
  %239 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5
  %240 = load i32 (i8*, i32, i8*, i32, i32*)** %239, align 8
  %241 = getelementptr inbounds i8* %46, i64 -1
  %242 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %243 = load i32* %242, align 4
  %244 = call i32 %240(i8* %241, i32 32, i8* %7, i32 %243, i32* %sse)
  br label %264

; <label>:245                                     ; preds = %163
  br label %246

; <label>:246                                     ; preds = %245, %163
  %247 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %248 = getelementptr inbounds %struct.MV* %247, i32 0, i32 1
  %249 = load i16* %248, align 2
  %250 = sext i16 %249 to i32
  %251 = add nsw i32 %250, 4
  %252 = trunc i32 %251 to i16
  store i16 %252, i16* %248, align 2
  %253 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %254 = getelementptr inbounds %struct.MV* %253, i32 0, i32 0
  %255 = load i16* %254, align 2
  %256 = sext i16 %255 to i32
  %257 = add nsw i32 %256, 4
  %258 = trunc i32 %257 to i16
  store i16 %258, i16* %254, align 2
  %259 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5
  %260 = load i32 (i8*, i32, i8*, i32, i32*)** %259, align 8
  %261 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %262 = load i32* %261, align 4
  %263 = call i32 %260(i8* %46, i32 32, i8* %7, i32 %262, i32* %sse)
  br label %264

; <label>:264                                     ; preds = %246, %223, %199, %171
  %thismse.0 = phi i32 [ %263, %246 ], [ %244, %223 ], [ %222, %199 ], [ %198, %171 ]
  %265 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %266 = add nsw i32 %thismse.0, %265
  %267 = icmp slt i32 %266, %bestmse.3
  br i1 %267, label %268, label %272

; <label>:268                                     ; preds = %264
  %269 = bitcast %union.int_mv* %bestmv to i8*
  %270 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %269, i8* %270, i64 4, i32 4, i1 false)
  store i32 %thismse.0, i32* %distortion, align 4
  %271 = load i32* %sse, align 4
  store i32 %271, i32* %sse1, align 4
  br label %272

; <label>:272                                     ; preds = %268, %264
  %bestmse.4 = phi i32 [ %266, %268 ], [ %bestmse.3, %264 ]
  %273 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %274 = getelementptr inbounds %struct.MV* %273, i32 0, i32 0
  %275 = load i16* %274, align 2
  %276 = sext i16 %275 to i32
  %277 = bitcast %union.int_mv* %startmv to %struct.MV*
  %278 = getelementptr inbounds %struct.MV* %277, i32 0, i32 0
  %279 = load i16* %278, align 2
  %280 = sext i16 %279 to i32
  %281 = icmp slt i32 %276, %280
  br i1 %281, label %282, label %286

; <label>:282                                     ; preds = %272
  %283 = sext i32 32 to i64
  %284 = sub i64 0, %283
  %285 = getelementptr inbounds i8* %46, i64 %284
  br label %286

; <label>:286                                     ; preds = %282, %272
  %y.0 = phi i8* [ %285, %282 ], [ %46, %272 ]
  %287 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %288 = getelementptr inbounds %struct.MV* %287, i32 0, i32 1
  %289 = load i16* %288, align 2
  %290 = sext i16 %289 to i32
  %291 = bitcast %union.int_mv* %startmv to %struct.MV*
  %292 = getelementptr inbounds %struct.MV* %291, i32 0, i32 1
  %293 = load i16* %292, align 2
  %294 = sext i16 %293 to i32
  %295 = icmp slt i32 %290, %294
  br i1 %295, label %296, label %298

; <label>:296                                     ; preds = %286
  %297 = getelementptr inbounds i8* %y.0, i32 -1
  br label %298

; <label>:298                                     ; preds = %296, %286
  %y.1 = phi i8* [ %297, %296 ], [ %y.0, %286 ]
  %299 = bitcast %union.int_mv* %startmv to i8*
  %300 = bitcast %union.int_mv* %bestmv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %299, i8* %300, i64 4, i32 4, i1 false)
  %301 = bitcast %union.int_mv* %startmv to %struct.MV*
  %302 = getelementptr inbounds %struct.MV* %301, i32 0, i32 0
  %303 = load i16* %302, align 2
  %304 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %305 = getelementptr inbounds %struct.MV* %304, i32 0, i32 0
  store i16 %303, i16* %305, align 2
  %306 = bitcast %union.int_mv* %startmv to %struct.MV*
  %307 = getelementptr inbounds %struct.MV* %306, i32 0, i32 1
  %308 = load i16* %307, align 2
  %309 = sext i16 %308 to i32
  %310 = and i32 %309, 7
  %311 = icmp ne i32 %310, 0
  br i1 %311, label %312, label %336

; <label>:312                                     ; preds = %298
  %313 = bitcast %union.int_mv* %startmv to %struct.MV*
  %314 = getelementptr inbounds %struct.MV* %313, i32 0, i32 1
  %315 = load i16* %314, align 2
  %316 = sext i16 %315 to i32
  %317 = sub nsw i32 %316, 2
  %318 = trunc i32 %317 to i16
  %319 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %320 = getelementptr inbounds %struct.MV* %319, i32 0, i32 1
  store i16 %318, i16* %320, align 2
  %321 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %322 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %321, align 8
  %323 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %324 = getelementptr inbounds %struct.MV* %323, i32 0, i32 1
  %325 = load i16* %324, align 2
  %326 = sext i16 %325 to i32
  %327 = and i32 %326, 7
  %328 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %329 = getelementptr inbounds %struct.MV* %328, i32 0, i32 0
  %330 = load i16* %329, align 2
  %331 = sext i16 %330 to i32
  %332 = and i32 %331, 7
  %333 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %334 = load i32* %333, align 4
  %335 = call i32 %322(i8* %y.1, i32 32, i32 %327, i32 %332, i8* %7, i32 %334, i32* %sse)
  br label %357

; <label>:336                                     ; preds = %298
  %337 = bitcast %union.int_mv* %startmv to %struct.MV*
  %338 = getelementptr inbounds %struct.MV* %337, i32 0, i32 1
  %339 = load i16* %338, align 2
  %340 = sext i16 %339 to i32
  %341 = sub nsw i32 %340, 8
  %342 = or i32 %341, 6
  %343 = trunc i32 %342 to i16
  %344 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %345 = getelementptr inbounds %struct.MV* %344, i32 0, i32 1
  store i16 %343, i16* %345, align 2
  %346 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %347 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %346, align 8
  %348 = getelementptr inbounds i8* %y.1, i64 -1
  %349 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %350 = getelementptr inbounds %struct.MV* %349, i32 0, i32 0
  %351 = load i16* %350, align 2
  %352 = sext i16 %351 to i32
  %353 = and i32 %352, 7
  %354 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %355 = load i32* %354, align 4
  %356 = call i32 %347(i8* %348, i32 32, i32 6, i32 %353, i8* %7, i32 %355, i32* %sse)
  br label %357

; <label>:357                                     ; preds = %336, %312
  %thismse.1 = phi i32 [ %335, %312 ], [ %356, %336 ]
  %358 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %359 = add nsw i32 %thismse.1, %358
  %360 = icmp slt i32 %359, %bestmse.4
  br i1 %360, label %361, label %365

; <label>:361                                     ; preds = %357
  %362 = bitcast %union.int_mv* %bestmv to i8*
  %363 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %362, i8* %363, i64 4, i32 4, i1 false)
  store i32 %thismse.1, i32* %distortion, align 4
  %364 = load i32* %sse, align 4
  store i32 %364, i32* %sse1, align 4
  br label %365

; <label>:365                                     ; preds = %361, %357
  %bestmse.5 = phi i32 [ %359, %361 ], [ %bestmse.4, %357 ]
  %366 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %367 = getelementptr inbounds %struct.MV* %366, i32 0, i32 1
  %368 = load i16* %367, align 2
  %369 = sext i16 %368 to i32
  %370 = add nsw i32 %369, 4
  %371 = trunc i32 %370 to i16
  store i16 %371, i16* %367, align 2
  %372 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %373 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %372, align 8
  %374 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %375 = getelementptr inbounds %struct.MV* %374, i32 0, i32 1
  %376 = load i16* %375, align 2
  %377 = sext i16 %376 to i32
  %378 = and i32 %377, 7
  %379 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %380 = getelementptr inbounds %struct.MV* %379, i32 0, i32 0
  %381 = load i16* %380, align 2
  %382 = sext i16 %381 to i32
  %383 = and i32 %382, 7
  %384 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %385 = load i32* %384, align 4
  %386 = call i32 %373(i8* %y.1, i32 32, i32 %378, i32 %383, i8* %7, i32 %385, i32* %sse)
  %387 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %388 = add nsw i32 %386, %387
  %389 = icmp slt i32 %388, %bestmse.5
  br i1 %389, label %390, label %394

; <label>:390                                     ; preds = %365
  %391 = bitcast %union.int_mv* %bestmv to i8*
  %392 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %391, i8* %392, i64 4, i32 4, i1 false)
  store i32 %386, i32* %distortion, align 4
  %393 = load i32* %sse, align 4
  store i32 %393, i32* %sse1, align 4
  br label %394

; <label>:394                                     ; preds = %390, %365
  %bestmse.6 = phi i32 [ %388, %390 ], [ %bestmse.5, %365 ]
  %395 = bitcast %union.int_mv* %startmv to %struct.MV*
  %396 = getelementptr inbounds %struct.MV* %395, i32 0, i32 1
  %397 = load i16* %396, align 2
  %398 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %399 = getelementptr inbounds %struct.MV* %398, i32 0, i32 1
  store i16 %397, i16* %399, align 2
  %400 = bitcast %union.int_mv* %startmv to %struct.MV*
  %401 = getelementptr inbounds %struct.MV* %400, i32 0, i32 0
  %402 = load i16* %401, align 2
  %403 = sext i16 %402 to i32
  %404 = and i32 %403, 7
  %405 = icmp ne i32 %404, 0
  br i1 %405, label %406, label %430

; <label>:406                                     ; preds = %394
  %407 = bitcast %union.int_mv* %startmv to %struct.MV*
  %408 = getelementptr inbounds %struct.MV* %407, i32 0, i32 0
  %409 = load i16* %408, align 2
  %410 = sext i16 %409 to i32
  %411 = sub nsw i32 %410, 2
  %412 = trunc i32 %411 to i16
  %413 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %414 = getelementptr inbounds %struct.MV* %413, i32 0, i32 0
  store i16 %412, i16* %414, align 2
  %415 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %416 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %415, align 8
  %417 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %418 = getelementptr inbounds %struct.MV* %417, i32 0, i32 1
  %419 = load i16* %418, align 2
  %420 = sext i16 %419 to i32
  %421 = and i32 %420, 7
  %422 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %423 = getelementptr inbounds %struct.MV* %422, i32 0, i32 0
  %424 = load i16* %423, align 2
  %425 = sext i16 %424 to i32
  %426 = and i32 %425, 7
  %427 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %428 = load i32* %427, align 4
  %429 = call i32 %416(i8* %y.1, i32 32, i32 %421, i32 %426, i8* %7, i32 %428, i32* %sse)
  br label %453

; <label>:430                                     ; preds = %394
  %431 = bitcast %union.int_mv* %startmv to %struct.MV*
  %432 = getelementptr inbounds %struct.MV* %431, i32 0, i32 0
  %433 = load i16* %432, align 2
  %434 = sext i16 %433 to i32
  %435 = sub nsw i32 %434, 8
  %436 = or i32 %435, 6
  %437 = trunc i32 %436 to i16
  %438 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %439 = getelementptr inbounds %struct.MV* %438, i32 0, i32 0
  store i16 %437, i16* %439, align 2
  %440 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %441 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %440, align 8
  %442 = sext i32 32 to i64
  %443 = sub i64 0, %442
  %444 = getelementptr inbounds i8* %y.1, i64 %443
  %445 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %446 = getelementptr inbounds %struct.MV* %445, i32 0, i32 1
  %447 = load i16* %446, align 2
  %448 = sext i16 %447 to i32
  %449 = and i32 %448, 7
  %450 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %451 = load i32* %450, align 4
  %452 = call i32 %441(i8* %444, i32 32, i32 %449, i32 6, i8* %7, i32 %451, i32* %sse)
  br label %453

; <label>:453                                     ; preds = %430, %406
  %thismse.2 = phi i32 [ %429, %406 ], [ %452, %430 ]
  %454 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %455 = add nsw i32 %thismse.2, %454
  %456 = icmp slt i32 %455, %bestmse.6
  br i1 %456, label %457, label %461

; <label>:457                                     ; preds = %453
  %458 = bitcast %union.int_mv* %bestmv to i8*
  %459 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %458, i8* %459, i64 4, i32 4, i1 false)
  store i32 %thismse.2, i32* %distortion, align 4
  %460 = load i32* %sse, align 4
  store i32 %460, i32* %sse1, align 4
  br label %461

; <label>:461                                     ; preds = %457, %453
  %bestmse.7 = phi i32 [ %455, %457 ], [ %bestmse.6, %453 ]
  %462 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %463 = getelementptr inbounds %struct.MV* %462, i32 0, i32 0
  %464 = load i16* %463, align 2
  %465 = sext i16 %464 to i32
  %466 = add nsw i32 %465, 4
  %467 = trunc i32 %466 to i16
  store i16 %467, i16* %463, align 2
  %468 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %469 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %468, align 8
  %470 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %471 = getelementptr inbounds %struct.MV* %470, i32 0, i32 1
  %472 = load i16* %471, align 2
  %473 = sext i16 %472 to i32
  %474 = and i32 %473, 7
  %475 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %476 = getelementptr inbounds %struct.MV* %475, i32 0, i32 0
  %477 = load i16* %476, align 2
  %478 = sext i16 %477 to i32
  %479 = and i32 %478, 7
  %480 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %481 = load i32* %480, align 4
  %482 = call i32 %469(i8* %y.1, i32 32, i32 %474, i32 %479, i8* %7, i32 %481, i32* %sse)
  %483 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %484 = add nsw i32 %482, %483
  %485 = icmp slt i32 %484, %bestmse.7
  br i1 %485, label %486, label %490

; <label>:486                                     ; preds = %461
  %487 = bitcast %union.int_mv* %bestmv to i8*
  %488 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %487, i8* %488, i64 4, i32 4, i1 false)
  store i32 %482, i32* %distortion, align 4
  %489 = load i32* %sse, align 4
  store i32 %489, i32* %sse1, align 4
  br label %490

; <label>:490                                     ; preds = %486, %461
  %bestmse.8 = phi i32 [ %484, %486 ], [ %bestmse.7, %461 ]
  %491 = icmp slt i32 %359, %388
  %492 = select i1 %491, i32 0, i32 1
  %493 = icmp slt i32 %455, %484
  %494 = select i1 %493, i32 0, i32 2
  %495 = add nsw i32 %492, %494
  %496 = bitcast %union.int_mv* %this_mv to i8*
  %497 = bitcast %union.int_mv* %startmv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %496, i8* %497, i64 4, i32 4, i1 false)
  switch i32 %495, label %763 [
    i32 0, label %498
    i32 1, label %619
    i32 2, label %678
    i32 3, label %735
  ]

; <label>:498                                     ; preds = %490
  %499 = bitcast %union.int_mv* %startmv to %struct.MV*
  %500 = getelementptr inbounds %struct.MV* %499, i32 0, i32 0
  %501 = load i16* %500, align 2
  %502 = sext i16 %501 to i32
  %503 = and i32 %502, 7
  %504 = icmp ne i32 %503, 0
  br i1 %504, label %505, label %562

; <label>:505                                     ; preds = %498
  %506 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %507 = getelementptr inbounds %struct.MV* %506, i32 0, i32 0
  %508 = load i16* %507, align 2
  %509 = sext i16 %508 to i32
  %510 = sub nsw i32 %509, 2
  %511 = trunc i32 %510 to i16
  store i16 %511, i16* %507, align 2
  %512 = bitcast %union.int_mv* %startmv to %struct.MV*
  %513 = getelementptr inbounds %struct.MV* %512, i32 0, i32 1
  %514 = load i16* %513, align 2
  %515 = sext i16 %514 to i32
  %516 = and i32 %515, 7
  %517 = icmp ne i32 %516, 0
  br i1 %517, label %518, label %540

; <label>:518                                     ; preds = %505
  %519 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %520 = getelementptr inbounds %struct.MV* %519, i32 0, i32 1
  %521 = load i16* %520, align 2
  %522 = sext i16 %521 to i32
  %523 = sub nsw i32 %522, 2
  %524 = trunc i32 %523 to i16
  store i16 %524, i16* %520, align 2
  %525 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %526 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %525, align 8
  %527 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %528 = getelementptr inbounds %struct.MV* %527, i32 0, i32 1
  %529 = load i16* %528, align 2
  %530 = sext i16 %529 to i32
  %531 = and i32 %530, 7
  %532 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %533 = getelementptr inbounds %struct.MV* %532, i32 0, i32 0
  %534 = load i16* %533, align 2
  %535 = sext i16 %534 to i32
  %536 = and i32 %535, 7
  %537 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %538 = load i32* %537, align 4
  %539 = call i32 %526(i8* %y.1, i32 32, i32 %531, i32 %536, i8* %7, i32 %538, i32* %sse)
  br label %561

; <label>:540                                     ; preds = %505
  %541 = bitcast %union.int_mv* %startmv to %struct.MV*
  %542 = getelementptr inbounds %struct.MV* %541, i32 0, i32 1
  %543 = load i16* %542, align 2
  %544 = sext i16 %543 to i32
  %545 = sub nsw i32 %544, 8
  %546 = or i32 %545, 6
  %547 = trunc i32 %546 to i16
  %548 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %549 = getelementptr inbounds %struct.MV* %548, i32 0, i32 1
  store i16 %547, i16* %549, align 2
  %550 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %551 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %550, align 8
  %552 = getelementptr inbounds i8* %y.1, i64 -1
  %553 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %554 = getelementptr inbounds %struct.MV* %553, i32 0, i32 0
  %555 = load i16* %554, align 2
  %556 = sext i16 %555 to i32
  %557 = and i32 %556, 7
  %558 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %559 = load i32* %558, align 4
  %560 = call i32 %551(i8* %552, i32 32, i32 6, i32 %557, i8* %7, i32 %559, i32* %sse)
  br label %561

; <label>:561                                     ; preds = %540, %518
  %thismse.3 = phi i32 [ %539, %518 ], [ %560, %540 ]
  br label %618

; <label>:562                                     ; preds = %498
  %563 = bitcast %union.int_mv* %startmv to %struct.MV*
  %564 = getelementptr inbounds %struct.MV* %563, i32 0, i32 0
  %565 = load i16* %564, align 2
  %566 = sext i16 %565 to i32
  %567 = sub nsw i32 %566, 8
  %568 = or i32 %567, 6
  %569 = trunc i32 %568 to i16
  %570 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %571 = getelementptr inbounds %struct.MV* %570, i32 0, i32 0
  store i16 %569, i16* %571, align 2
  %572 = bitcast %union.int_mv* %startmv to %struct.MV*
  %573 = getelementptr inbounds %struct.MV* %572, i32 0, i32 1
  %574 = load i16* %573, align 2
  %575 = sext i16 %574 to i32
  %576 = and i32 %575, 7
  %577 = icmp ne i32 %576, 0
  br i1 %577, label %578, label %598

; <label>:578                                     ; preds = %562
  %579 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %580 = getelementptr inbounds %struct.MV* %579, i32 0, i32 1
  %581 = load i16* %580, align 2
  %582 = sext i16 %581 to i32
  %583 = sub nsw i32 %582, 2
  %584 = trunc i32 %583 to i16
  store i16 %584, i16* %580, align 2
  %585 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %586 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %585, align 8
  %587 = sext i32 32 to i64
  %588 = sub i64 0, %587
  %589 = getelementptr inbounds i8* %y.1, i64 %588
  %590 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %591 = getelementptr inbounds %struct.MV* %590, i32 0, i32 1
  %592 = load i16* %591, align 2
  %593 = sext i16 %592 to i32
  %594 = and i32 %593, 7
  %595 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %596 = load i32* %595, align 4
  %597 = call i32 %586(i8* %589, i32 32, i32 %594, i32 6, i8* %7, i32 %596, i32* %sse)
  br label %617

; <label>:598                                     ; preds = %562
  %599 = bitcast %union.int_mv* %startmv to %struct.MV*
  %600 = getelementptr inbounds %struct.MV* %599, i32 0, i32 1
  %601 = load i16* %600, align 2
  %602 = sext i16 %601 to i32
  %603 = sub nsw i32 %602, 8
  %604 = or i32 %603, 6
  %605 = trunc i32 %604 to i16
  %606 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %607 = getelementptr inbounds %struct.MV* %606, i32 0, i32 1
  store i16 %605, i16* %607, align 2
  %608 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %609 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %608, align 8
  %610 = sext i32 32 to i64
  %611 = sub i64 0, %610
  %612 = getelementptr inbounds i8* %y.1, i64 %611
  %613 = getelementptr inbounds i8* %612, i64 -1
  %614 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %615 = load i32* %614, align 4
  %616 = call i32 %609(i8* %613, i32 32, i32 6, i32 6, i8* %7, i32 %615, i32* %sse)
  br label %617

; <label>:617                                     ; preds = %598, %578
  %thismse.4 = phi i32 [ %597, %578 ], [ %616, %598 ]
  br label %618

; <label>:618                                     ; preds = %617, %561
  %thismse.5 = phi i32 [ %thismse.3, %561 ], [ %thismse.4, %617 ]
  br label %763

; <label>:619                                     ; preds = %490
  %620 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %621 = getelementptr inbounds %struct.MV* %620, i32 0, i32 1
  %622 = load i16* %621, align 2
  %623 = sext i16 %622 to i32
  %624 = add nsw i32 %623, 2
  %625 = trunc i32 %624 to i16
  store i16 %625, i16* %621, align 2
  %626 = bitcast %union.int_mv* %startmv to %struct.MV*
  %627 = getelementptr inbounds %struct.MV* %626, i32 0, i32 0
  %628 = load i16* %627, align 2
  %629 = sext i16 %628 to i32
  %630 = and i32 %629, 7
  %631 = icmp ne i32 %630, 0
  br i1 %631, label %632, label %654

; <label>:632                                     ; preds = %619
  %633 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %634 = getelementptr inbounds %struct.MV* %633, i32 0, i32 0
  %635 = load i16* %634, align 2
  %636 = sext i16 %635 to i32
  %637 = sub nsw i32 %636, 2
  %638 = trunc i32 %637 to i16
  store i16 %638, i16* %634, align 2
  %639 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %640 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %639, align 8
  %641 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %642 = getelementptr inbounds %struct.MV* %641, i32 0, i32 1
  %643 = load i16* %642, align 2
  %644 = sext i16 %643 to i32
  %645 = and i32 %644, 7
  %646 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %647 = getelementptr inbounds %struct.MV* %646, i32 0, i32 0
  %648 = load i16* %647, align 2
  %649 = sext i16 %648 to i32
  %650 = and i32 %649, 7
  %651 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %652 = load i32* %651, align 4
  %653 = call i32 %640(i8* %y.1, i32 32, i32 %645, i32 %650, i8* %7, i32 %652, i32* %sse)
  br label %677

; <label>:654                                     ; preds = %619
  %655 = bitcast %union.int_mv* %startmv to %struct.MV*
  %656 = getelementptr inbounds %struct.MV* %655, i32 0, i32 0
  %657 = load i16* %656, align 2
  %658 = sext i16 %657 to i32
  %659 = sub nsw i32 %658, 8
  %660 = or i32 %659, 6
  %661 = trunc i32 %660 to i16
  %662 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %663 = getelementptr inbounds %struct.MV* %662, i32 0, i32 0
  store i16 %661, i16* %663, align 2
  %664 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %665 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %664, align 8
  %666 = sext i32 32 to i64
  %667 = sub i64 0, %666
  %668 = getelementptr inbounds i8* %y.1, i64 %667
  %669 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %670 = getelementptr inbounds %struct.MV* %669, i32 0, i32 1
  %671 = load i16* %670, align 2
  %672 = sext i16 %671 to i32
  %673 = and i32 %672, 7
  %674 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %675 = load i32* %674, align 4
  %676 = call i32 %665(i8* %668, i32 32, i32 %673, i32 6, i8* %7, i32 %675, i32* %sse)
  br label %677

; <label>:677                                     ; preds = %654, %632
  %thismse.6 = phi i32 [ %653, %632 ], [ %676, %654 ]
  br label %763

; <label>:678                                     ; preds = %490
  %679 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %680 = getelementptr inbounds %struct.MV* %679, i32 0, i32 0
  %681 = load i16* %680, align 2
  %682 = sext i16 %681 to i32
  %683 = add nsw i32 %682, 2
  %684 = trunc i32 %683 to i16
  store i16 %684, i16* %680, align 2
  %685 = bitcast %union.int_mv* %startmv to %struct.MV*
  %686 = getelementptr inbounds %struct.MV* %685, i32 0, i32 1
  %687 = load i16* %686, align 2
  %688 = sext i16 %687 to i32
  %689 = and i32 %688, 7
  %690 = icmp ne i32 %689, 0
  br i1 %690, label %691, label %713

; <label>:691                                     ; preds = %678
  %692 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %693 = getelementptr inbounds %struct.MV* %692, i32 0, i32 1
  %694 = load i16* %693, align 2
  %695 = sext i16 %694 to i32
  %696 = sub nsw i32 %695, 2
  %697 = trunc i32 %696 to i16
  store i16 %697, i16* %693, align 2
  %698 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %699 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %698, align 8
  %700 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %701 = getelementptr inbounds %struct.MV* %700, i32 0, i32 1
  %702 = load i16* %701, align 2
  %703 = sext i16 %702 to i32
  %704 = and i32 %703, 7
  %705 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %706 = getelementptr inbounds %struct.MV* %705, i32 0, i32 0
  %707 = load i16* %706, align 2
  %708 = sext i16 %707 to i32
  %709 = and i32 %708, 7
  %710 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %711 = load i32* %710, align 4
  %712 = call i32 %699(i8* %y.1, i32 32, i32 %704, i32 %709, i8* %7, i32 %711, i32* %sse)
  br label %734

; <label>:713                                     ; preds = %678
  %714 = bitcast %union.int_mv* %startmv to %struct.MV*
  %715 = getelementptr inbounds %struct.MV* %714, i32 0, i32 1
  %716 = load i16* %715, align 2
  %717 = sext i16 %716 to i32
  %718 = sub nsw i32 %717, 8
  %719 = or i32 %718, 6
  %720 = trunc i32 %719 to i16
  %721 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %722 = getelementptr inbounds %struct.MV* %721, i32 0, i32 1
  store i16 %720, i16* %722, align 2
  %723 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %724 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %723, align 8
  %725 = getelementptr inbounds i8* %y.1, i64 -1
  %726 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %727 = getelementptr inbounds %struct.MV* %726, i32 0, i32 0
  %728 = load i16* %727, align 2
  %729 = sext i16 %728 to i32
  %730 = and i32 %729, 7
  %731 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %732 = load i32* %731, align 4
  %733 = call i32 %724(i8* %725, i32 32, i32 6, i32 %730, i8* %7, i32 %732, i32* %sse)
  br label %734

; <label>:734                                     ; preds = %713, %691
  %thismse.7 = phi i32 [ %712, %691 ], [ %733, %713 ]
  br label %763

; <label>:735                                     ; preds = %490
  %736 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %737 = getelementptr inbounds %struct.MV* %736, i32 0, i32 1
  %738 = load i16* %737, align 2
  %739 = sext i16 %738 to i32
  %740 = add nsw i32 %739, 2
  %741 = trunc i32 %740 to i16
  store i16 %741, i16* %737, align 2
  %742 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %743 = getelementptr inbounds %struct.MV* %742, i32 0, i32 0
  %744 = load i16* %743, align 2
  %745 = sext i16 %744 to i32
  %746 = add nsw i32 %745, 2
  %747 = trunc i32 %746 to i16
  store i16 %747, i16* %743, align 2
  %748 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2
  %749 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %748, align 8
  %750 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %751 = getelementptr inbounds %struct.MV* %750, i32 0, i32 1
  %752 = load i16* %751, align 2
  %753 = sext i16 %752 to i32
  %754 = and i32 %753, 7
  %755 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %756 = getelementptr inbounds %struct.MV* %755, i32 0, i32 0
  %757 = load i16* %756, align 2
  %758 = sext i16 %757 to i32
  %759 = and i32 %758, 7
  %760 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %761 = load i32* %760, align 4
  %762 = call i32 %749(i8* %y.1, i32 32, i32 %754, i32 %759, i8* %7, i32 %761, i32* %sse)
  br label %763

; <label>:763                                     ; preds = %735, %734, %677, %618, %490
  %thismse.8 = phi i32 [ %482, %490 ], [ %762, %735 ], [ %thismse.7, %734 ], [ %thismse.6, %677 ], [ %thismse.5, %618 ]
  %764 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %765 = add nsw i32 %thismse.8, %764
  %766 = icmp slt i32 %765, %bestmse.8
  br i1 %766, label %767, label %771

; <label>:767                                     ; preds = %763
  %768 = bitcast %union.int_mv* %bestmv to i8*
  %769 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %768, i8* %769, i64 4, i32 4, i1 false)
  store i32 %thismse.8, i32* %distortion, align 4
  %770 = load i32* %sse, align 4
  store i32 %770, i32* %sse1, align 4
  br label %771

; <label>:771                                     ; preds = %767, %763
  %bestmse.9 = phi i32 [ %765, %767 ], [ %bestmse.8, %763 ]
  ret i32 %bestmse.9
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @vp8_find_best_half_pixel_step(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32 %error_per_bit, %struct.variance_vtable* %vfp, i32** %mvcost, i32* %distortion, i32* %sse1) #0 {
  %startmv = alloca %union.int_mv, align 4
  %this_mv = alloca %union.int_mv, align 4
  %sse = alloca i32, align 4
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9
  %2 = load i8*** %1, align 8
  %3 = load i8** %2, align 8
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8* %3, i64 %6
  %8 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %9 = getelementptr inbounds %struct.macroblockd* %8, i32 0, i32 11
  %10 = getelementptr inbounds %struct.yv12_buffer_config* %9, i32 0, i32 4
  %11 = load i32* %10, align 4
  %12 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %13 = getelementptr inbounds %struct.macroblockd* %12, i32 0, i32 11
  %14 = getelementptr inbounds %struct.yv12_buffer_config* %13, i32 0, i32 13
  %15 = load i8** %14, align 8
  %16 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %17 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4
  %18 = load i32* %17, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8* %15, i64 %19
  %21 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %22 = getelementptr inbounds %struct.MV* %21, i32 0, i32 0
  %23 = load i16* %22, align 2
  %24 = sext i16 %23 to i32
  %25 = mul nsw i32 %24, %11
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8* %20, i64 %26
  %28 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %29 = getelementptr inbounds %struct.MV* %28, i32 0, i32 1
  %30 = load i16* %29, align 2
  %31 = sext i16 %30 to i32
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8* %27, i64 %32
  %34 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 9
  %35 = load void (i8*, i32, i8*, i32, i32)** %34, align 8
  %36 = getelementptr inbounds i8* %33, i64 -1
  %37 = sext i32 %11 to i64
  %38 = sub i64 0, %37
  %39 = getelementptr inbounds i8* %36, i64 %38
  %40 = getelementptr inbounds %struct.macroblockd* %16, i32 0, i32 46
  %41 = getelementptr inbounds [704 x i8]* %40, i32 0, i32 0
  call void %35(i8* %39, i32 %11, i8* %41, i32 32, i32 18)
  %42 = getelementptr inbounds %struct.macroblockd* %16, i32 0, i32 46
  %43 = getelementptr inbounds [704 x i8]* %42, i32 0, i32 0
  %44 = sext i32 32 to i64
  %45 = getelementptr inbounds i8* %43, i64 %44
  %46 = getelementptr inbounds i8* %45, i64 1
  %47 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %48 = getelementptr inbounds %struct.MV* %47, i32 0, i32 0
  %49 = load i16* %48, align 2
  %50 = sext i16 %49 to i32
  %51 = mul nsw i32 %50, 8
  %52 = trunc i32 %51 to i16
  store i16 %52, i16* %48, align 2
  %53 = bitcast %union.int_mv* %bestmv to %struct.MV*
  %54 = getelementptr inbounds %struct.MV* %53, i32 0, i32 1
  %55 = load i16* %54, align 2
  %56 = sext i16 %55 to i32
  %57 = mul nsw i32 %56, 8
  %58 = trunc i32 %57 to i16
  store i16 %58, i16* %54, align 2
  %59 = bitcast %union.int_mv* %startmv to i8*
  %60 = bitcast %union.int_mv* %bestmv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %59, i8* %60, i64 4, i32 4, i1 false)
  %61 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 1
  %62 = load i32 (i8*, i32, i8*, i32, i32*)** %61, align 8
  %63 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %64 = load i32* %63, align 4
  %65 = call i32 %62(i8* %46, i32 32, i8* %7, i32 %64, i32* %sse1)
  store i32 %65, i32* %distortion, align 4
  %66 = call i32 @mv_err_cost(%union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %67 = add nsw i32 %65, %66
  %68 = bitcast %union.int_mv* %startmv to %struct.MV*
  %69 = getelementptr inbounds %struct.MV* %68, i32 0, i32 0
  %70 = load i16* %69, align 2
  %71 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %72 = getelementptr inbounds %struct.MV* %71, i32 0, i32 0
  store i16 %70, i16* %72, align 2
  %73 = bitcast %union.int_mv* %startmv to %struct.MV*
  %74 = getelementptr inbounds %struct.MV* %73, i32 0, i32 1
  %75 = load i16* %74, align 2
  %76 = sext i16 %75 to i32
  %77 = sub nsw i32 %76, 8
  %78 = or i32 %77, 4
  %79 = trunc i32 %78 to i16
  %80 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %81 = getelementptr inbounds %struct.MV* %80, i32 0, i32 1
  store i16 %79, i16* %81, align 2
  %82 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 3
  %83 = load i32 (i8*, i32, i8*, i32, i32*)** %82, align 8
  %84 = getelementptr inbounds i8* %46, i64 -1
  %85 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %86 = load i32* %85, align 4
  %87 = call i32 %83(i8* %84, i32 32, i8* %7, i32 %86, i32* %sse)
  %88 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %89 = add nsw i32 %87, %88
  %90 = icmp slt i32 %89, %67
  br i1 %90, label %91, label %95

; <label>:91                                      ; preds = %0
  %92 = bitcast %union.int_mv* %bestmv to i8*
  %93 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %92, i8* %93, i64 4, i32 4, i1 false)
  store i32 %87, i32* %distortion, align 4
  %94 = load i32* %sse, align 4
  store i32 %94, i32* %sse1, align 4
  br label %95

; <label>:95                                      ; preds = %91, %0
  %bestmse.0 = phi i32 [ %89, %91 ], [ %67, %0 ]
  %96 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %97 = getelementptr inbounds %struct.MV* %96, i32 0, i32 1
  %98 = load i16* %97, align 2
  %99 = sext i16 %98 to i32
  %100 = add nsw i32 %99, 8
  %101 = trunc i32 %100 to i16
  store i16 %101, i16* %97, align 2
  %102 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 3
  %103 = load i32 (i8*, i32, i8*, i32, i32*)** %102, align 8
  %104 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %105 = load i32* %104, align 4
  %106 = call i32 %103(i8* %46, i32 32, i8* %7, i32 %105, i32* %sse)
  %107 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %108 = add nsw i32 %106, %107
  %109 = icmp slt i32 %108, %bestmse.0
  br i1 %109, label %110, label %114

; <label>:110                                     ; preds = %95
  %111 = bitcast %union.int_mv* %bestmv to i8*
  %112 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %111, i8* %112, i64 4, i32 4, i1 false)
  store i32 %106, i32* %distortion, align 4
  %113 = load i32* %sse, align 4
  store i32 %113, i32* %sse1, align 4
  br label %114

; <label>:114                                     ; preds = %110, %95
  %bestmse.1 = phi i32 [ %108, %110 ], [ %bestmse.0, %95 ]
  %115 = bitcast %union.int_mv* %startmv to %struct.MV*
  %116 = getelementptr inbounds %struct.MV* %115, i32 0, i32 1
  %117 = load i16* %116, align 2
  %118 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %119 = getelementptr inbounds %struct.MV* %118, i32 0, i32 1
  store i16 %117, i16* %119, align 2
  %120 = bitcast %union.int_mv* %startmv to %struct.MV*
  %121 = getelementptr inbounds %struct.MV* %120, i32 0, i32 0
  %122 = load i16* %121, align 2
  %123 = sext i16 %122 to i32
  %124 = sub nsw i32 %123, 8
  %125 = or i32 %124, 4
  %126 = trunc i32 %125 to i16
  %127 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %128 = getelementptr inbounds %struct.MV* %127, i32 0, i32 0
  store i16 %126, i16* %128, align 2
  %129 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 4
  %130 = load i32 (i8*, i32, i8*, i32, i32*)** %129, align 8
  %131 = sext i32 32 to i64
  %132 = sub i64 0, %131
  %133 = getelementptr inbounds i8* %46, i64 %132
  %134 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %135 = load i32* %134, align 4
  %136 = call i32 %130(i8* %133, i32 32, i8* %7, i32 %135, i32* %sse)
  %137 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %138 = add nsw i32 %136, %137
  %139 = icmp slt i32 %138, %bestmse.1
  br i1 %139, label %140, label %144

; <label>:140                                     ; preds = %114
  %141 = bitcast %union.int_mv* %bestmv to i8*
  %142 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %141, i8* %142, i64 4, i32 4, i1 false)
  store i32 %136, i32* %distortion, align 4
  %143 = load i32* %sse, align 4
  store i32 %143, i32* %sse1, align 4
  br label %144

; <label>:144                                     ; preds = %140, %114
  %bestmse.2 = phi i32 [ %138, %140 ], [ %bestmse.1, %114 ]
  %145 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %146 = getelementptr inbounds %struct.MV* %145, i32 0, i32 0
  %147 = load i16* %146, align 2
  %148 = sext i16 %147 to i32
  %149 = add nsw i32 %148, 8
  %150 = trunc i32 %149 to i16
  store i16 %150, i16* %146, align 2
  %151 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 4
  %152 = load i32 (i8*, i32, i8*, i32, i32*)** %151, align 8
  %153 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %154 = load i32* %153, align 4
  %155 = call i32 %152(i8* %46, i32 32, i8* %7, i32 %154, i32* %sse)
  %156 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %157 = add nsw i32 %155, %156
  %158 = icmp slt i32 %157, %bestmse.2
  br i1 %158, label %159, label %163

; <label>:159                                     ; preds = %144
  %160 = bitcast %union.int_mv* %bestmv to i8*
  %161 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %160, i8* %161, i64 4, i32 4, i1 false)
  store i32 %155, i32* %distortion, align 4
  %162 = load i32* %sse, align 4
  store i32 %162, i32* %sse1, align 4
  br label %163

; <label>:163                                     ; preds = %159, %144
  %bestmse.3 = phi i32 [ %157, %159 ], [ %bestmse.2, %144 ]
  %164 = icmp slt i32 %89, %108
  %165 = select i1 %164, i32 0, i32 1
  %166 = icmp slt i32 %138, %157
  %167 = select i1 %166, i32 0, i32 2
  %168 = add nsw i32 %165, %167
  %169 = bitcast %union.int_mv* %this_mv to i8*
  %170 = bitcast %union.int_mv* %startmv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %169, i8* %170, i64 4, i32 4, i1 false)
  switch i32 %168, label %246 [
    i32 0, label %171
    i32 1, label %199
    i32 2, label %223
    i32 3, label %245
  ]

; <label>:171                                     ; preds = %163
  %172 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %173 = getelementptr inbounds %struct.MV* %172, i32 0, i32 1
  %174 = load i16* %173, align 2
  %175 = sext i16 %174 to i32
  %176 = sub nsw i32 %175, 8
  %177 = or i32 %176, 4
  %178 = trunc i32 %177 to i16
  %179 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %180 = getelementptr inbounds %struct.MV* %179, i32 0, i32 1
  store i16 %178, i16* %180, align 2
  %181 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %182 = getelementptr inbounds %struct.MV* %181, i32 0, i32 0
  %183 = load i16* %182, align 2
  %184 = sext i16 %183 to i32
  %185 = sub nsw i32 %184, 8
  %186 = or i32 %185, 4
  %187 = trunc i32 %186 to i16
  %188 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %189 = getelementptr inbounds %struct.MV* %188, i32 0, i32 0
  store i16 %187, i16* %189, align 2
  %190 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5
  %191 = load i32 (i8*, i32, i8*, i32, i32*)** %190, align 8
  %192 = getelementptr inbounds i8* %46, i64 -1
  %193 = sext i32 32 to i64
  %194 = sub i64 0, %193
  %195 = getelementptr inbounds i8* %192, i64 %194
  %196 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %197 = load i32* %196, align 4
  %198 = call i32 %191(i8* %195, i32 32, i8* %7, i32 %197, i32* %sse)
  br label %264

; <label>:199                                     ; preds = %163
  %200 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %201 = getelementptr inbounds %struct.MV* %200, i32 0, i32 1
  %202 = load i16* %201, align 2
  %203 = sext i16 %202 to i32
  %204 = add nsw i32 %203, 4
  %205 = trunc i32 %204 to i16
  store i16 %205, i16* %201, align 2
  %206 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %207 = getelementptr inbounds %struct.MV* %206, i32 0, i32 0
  %208 = load i16* %207, align 2
  %209 = sext i16 %208 to i32
  %210 = sub nsw i32 %209, 8
  %211 = or i32 %210, 4
  %212 = trunc i32 %211 to i16
  %213 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %214 = getelementptr inbounds %struct.MV* %213, i32 0, i32 0
  store i16 %212, i16* %214, align 2
  %215 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5
  %216 = load i32 (i8*, i32, i8*, i32, i32*)** %215, align 8
  %217 = sext i32 32 to i64
  %218 = sub i64 0, %217
  %219 = getelementptr inbounds i8* %46, i64 %218
  %220 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %221 = load i32* %220, align 4
  %222 = call i32 %216(i8* %219, i32 32, i8* %7, i32 %221, i32* %sse)
  br label %264

; <label>:223                                     ; preds = %163
  %224 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %225 = getelementptr inbounds %struct.MV* %224, i32 0, i32 1
  %226 = load i16* %225, align 2
  %227 = sext i16 %226 to i32
  %228 = sub nsw i32 %227, 8
  %229 = or i32 %228, 4
  %230 = trunc i32 %229 to i16
  %231 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %232 = getelementptr inbounds %struct.MV* %231, i32 0, i32 1
  store i16 %230, i16* %232, align 2
  %233 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %234 = getelementptr inbounds %struct.MV* %233, i32 0, i32 0
  %235 = load i16* %234, align 2
  %236 = sext i16 %235 to i32
  %237 = add nsw i32 %236, 4
  %238 = trunc i32 %237 to i16
  store i16 %238, i16* %234, align 2
  %239 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5
  %240 = load i32 (i8*, i32, i8*, i32, i32*)** %239, align 8
  %241 = getelementptr inbounds i8* %46, i64 -1
  %242 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %243 = load i32* %242, align 4
  %244 = call i32 %240(i8* %241, i32 32, i8* %7, i32 %243, i32* %sse)
  br label %264

; <label>:245                                     ; preds = %163
  br label %246

; <label>:246                                     ; preds = %245, %163
  %247 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %248 = getelementptr inbounds %struct.MV* %247, i32 0, i32 1
  %249 = load i16* %248, align 2
  %250 = sext i16 %249 to i32
  %251 = add nsw i32 %250, 4
  %252 = trunc i32 %251 to i16
  store i16 %252, i16* %248, align 2
  %253 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %254 = getelementptr inbounds %struct.MV* %253, i32 0, i32 0
  %255 = load i16* %254, align 2
  %256 = sext i16 %255 to i32
  %257 = add nsw i32 %256, 4
  %258 = trunc i32 %257 to i16
  store i16 %258, i16* %254, align 2
  %259 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5
  %260 = load i32 (i8*, i32, i8*, i32, i32*)** %259, align 8
  %261 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %262 = load i32* %261, align 4
  %263 = call i32 %260(i8* %46, i32 32, i8* %7, i32 %262, i32* %sse)
  br label %264

; <label>:264                                     ; preds = %246, %223, %199, %171
  %thismse.0 = phi i32 [ %263, %246 ], [ %244, %223 ], [ %222, %199 ], [ %198, %171 ]
  %265 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit)
  %266 = add nsw i32 %thismse.0, %265
  %267 = icmp slt i32 %266, %bestmse.3
  br i1 %267, label %268, label %272

; <label>:268                                     ; preds = %264
  %269 = bitcast %union.int_mv* %bestmv to i8*
  %270 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %269, i8* %270, i64 4, i32 4, i1 false)
  store i32 %thismse.0, i32* %distortion, align 4
  %271 = load i32* %sse, align 4
  store i32 %271, i32* %sse1, align 4
  br label %272

; <label>:272                                     ; preds = %268, %264
  %bestmse.4 = phi i32 [ %266, %268 ], [ %bestmse.3, %264 ]
  ret i32 %bestmse.4
}

; Function Attrs: nounwind uwtable
define i32 @vp8_hex_search(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, %union.int_mv* %best_mv, i32 %search_param, i32 %sad_per_bit, %struct.variance_vtable* %vfp, i32** %mvsadcost, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %hex = alloca [6 x %struct.MV], align 16
  %neighbors = alloca [4 x %struct.MV], align 16
  %this_mv = alloca %union.int_mv, align 4
  %fcenter_mv = alloca %union.int_mv, align 4
  %1 = bitcast [6 x %struct.MV]* %hex to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([6 x %struct.MV]* @vp8_hex_search.hex to i8*), i64 24, i32 16, i1 false)
  %2 = bitcast [4 x %struct.MV]* %neighbors to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([4 x %struct.MV]* @vp8_hex_search.neighbors to i8*), i64 16, i32 16, i1 false)
  %3 = getelementptr inbounds %struct.block* %b, i32 0, i32 9
  %4 = load i8*** %3, align 8
  %5 = load i8** %4, align 8
  %6 = getelementptr inbounds %struct.block* %b, i32 0, i32 10
  %7 = load i32* %6, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds i8* %5, i64 %8
  %10 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %11 = load i32* %10, align 4
  %12 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %13 = getelementptr inbounds %struct.macroblockd* %12, i32 0, i32 11
  %14 = getelementptr inbounds %struct.yv12_buffer_config* %13, i32 0, i32 4
  %15 = load i32* %14, align 4
  %16 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %17 = getelementptr inbounds %struct.macroblockd* %16, i32 0, i32 11
  %18 = getelementptr inbounds %struct.yv12_buffer_config* %17, i32 0, i32 13
  %19 = load i8** %18, align 8
  %20 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %21 = getelementptr inbounds %struct.MV* %20, i32 0, i32 0
  %22 = load i16* %21, align 2
  %23 = sext i16 %22 to i32
  %24 = ashr i32 %23, 3
  %25 = trunc i32 %24 to i16
  %26 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %27 = getelementptr inbounds %struct.MV* %26, i32 0, i32 0
  store i16 %25, i16* %27, align 2
  %28 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %29 = getelementptr inbounds %struct.MV* %28, i32 0, i32 1
  %30 = load i16* %29, align 2
  %31 = sext i16 %30 to i32
  %32 = ashr i32 %31, 3
  %33 = trunc i32 %32 to i16
  %34 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %35 = getelementptr inbounds %struct.MV* %34, i32 0, i32 1
  store i16 %33, i16* %35, align 2
  %36 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %37 = load i32* %36, align 4
  %38 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %39 = load i32* %38, align 4
  %40 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %41 = load i32* %40, align 4
  %42 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %43 = load i32* %42, align 4
  call void @vp8_clamp_mv(%union.int_mv* %ref_mv, i32 %37, i32 %39, i32 %41, i32 %43)
  %44 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %45 = getelementptr inbounds %struct.MV* %44, i32 0, i32 0
  %46 = load i16* %45, align 2
  %47 = sext i16 %46 to i32
  %48 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1
  %50 = load i16* %49, align 2
  %51 = sext i16 %50 to i32
  %52 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4
  %53 = load i32* %52, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8* %19, i64 %54
  %56 = mul nsw i32 %47, %15
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8* %55, i64 %57
  %59 = sext i32 %51 to i64
  %60 = getelementptr inbounds i8* %58, i64 %59
  %61 = trunc i32 %47 to i16
  %62 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %63 = getelementptr inbounds %struct.MV* %62, i32 0, i32 0
  store i16 %61, i16* %63, align 2
  %64 = trunc i32 %51 to i16
  %65 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %66 = getelementptr inbounds %struct.MV* %65, i32 0, i32 1
  store i16 %64, i16* %66, align 2
  %67 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0
  %68 = load i32 (i8*, i32, i8*, i32, i32)** %67, align 8
  %69 = call i32 %68(i8* %9, i32 %11, i8* %60, i32 %15, i32 -1)
  %70 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit)
  %71 = add i32 %69, %70
  %72 = sub nsw i32 %47, 2
  %73 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %74 = load i32* %73, align 4
  %75 = icmp sge i32 %72, %74
  %76 = zext i1 %75 to i32
  %77 = and i32 1, %76
  %78 = add nsw i32 %47, 2
  %79 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %80 = load i32* %79, align 4
  %81 = icmp sle i32 %78, %80
  %82 = zext i1 %81 to i32
  %83 = and i32 %77, %82
  %84 = sub nsw i32 %51, 2
  %85 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %86 = load i32* %85, align 4
  %87 = icmp sge i32 %84, %86
  %88 = zext i1 %87 to i32
  %89 = and i32 %83, %88
  %90 = add nsw i32 %51, 2
  %91 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %92 = load i32* %91, align 4
  %93 = icmp sle i32 %90, %92
  %94 = zext i1 %93 to i32
  %95 = and i32 %89, %94
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %146

; <label>:97                                      ; preds = %0
  br label %98

; <label>:98                                      ; preds = %143, %97
  %i.0 = phi i32 [ 0, %97 ], [ %144, %143 ]
  %bestsad.0 = phi i32 [ %71, %97 ], [ %bestsad.2, %143 ]
  %best_site.0 = phi i32 [ -1, %97 ], [ %best_site.2, %143 ]
  %99 = icmp slt i32 %i.0, 6
  br i1 %99, label %100, label %145

; <label>:100                                     ; preds = %98
  %101 = sext i32 %i.0 to i64
  %102 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %101
  %103 = getelementptr inbounds %struct.MV* %102, i32 0, i32 0
  %104 = load i16* %103, align 2
  %105 = sext i16 %104 to i32
  %106 = add nsw i32 %47, %105
  %107 = trunc i32 %106 to i16
  %108 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %109 = getelementptr inbounds %struct.MV* %108, i32 0, i32 0
  store i16 %107, i16* %109, align 2
  %110 = sext i32 %i.0 to i64
  %111 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %110
  %112 = getelementptr inbounds %struct.MV* %111, i32 0, i32 1
  %113 = load i16* %112, align 2
  %114 = sext i16 %113 to i32
  %115 = add nsw i32 %51, %114
  %116 = trunc i32 %115 to i16
  %117 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %118 = getelementptr inbounds %struct.MV* %117, i32 0, i32 1
  store i16 %116, i16* %118, align 2
  %119 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %120 = getelementptr inbounds %struct.MV* %119, i32 0, i32 0
  %121 = load i16* %120, align 2
  %122 = sext i16 %121 to i32
  %123 = mul nsw i32 %122, %15
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i8* %55, i64 %124
  %126 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %127 = getelementptr inbounds %struct.MV* %126, i32 0, i32 1
  %128 = load i16* %127, align 2
  %129 = sext i16 %128 to i32
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8* %125, i64 %130
  %132 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0
  %133 = load i32 (i8*, i32, i8*, i32, i32)** %132, align 8
  %134 = call i32 %133(i8* %9, i32 %11, i8* %131, i32 %15, i32 %bestsad.0)
  %135 = icmp ult i32 %134, %bestsad.0
  br i1 %135, label %136, label %142

; <label>:136                                     ; preds = %100
  %137 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit)
  %138 = add i32 %134, %137
  %139 = icmp ult i32 %138, %bestsad.0
  br i1 %139, label %140, label %141

; <label>:140                                     ; preds = %136
  br label %141

; <label>:141                                     ; preds = %140, %136
  %bestsad.1 = phi i32 [ %138, %140 ], [ %bestsad.0, %136 ]
  %best_site.1 = phi i32 [ %i.0, %140 ], [ %best_site.0, %136 ]
  br label %142

; <label>:142                                     ; preds = %141, %100
  %bestsad.2 = phi i32 [ %bestsad.1, %141 ], [ %bestsad.0, %100 ]
  %best_site.2 = phi i32 [ %best_site.1, %141 ], [ %best_site.0, %100 ]
  br label %143

; <label>:143                                     ; preds = %142
  %144 = add nsw i32 %i.0, 1
  br label %98

; <label>:145                                     ; preds = %98
  br label %231

; <label>:146                                     ; preds = %0
  br label %147

; <label>:147                                     ; preds = %228, %146
  %i.1 = phi i32 [ 0, %146 ], [ %229, %228 ]
  %bestsad.3 = phi i32 [ %71, %146 ], [ %bestsad.6, %228 ]
  %best_site.3 = phi i32 [ -1, %146 ], [ %best_site.6, %228 ]
  %148 = icmp slt i32 %i.1, 6
  br i1 %148, label %149, label %230

; <label>:149                                     ; preds = %147
  %150 = sext i32 %i.1 to i64
  %151 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %150
  %152 = getelementptr inbounds %struct.MV* %151, i32 0, i32 0
  %153 = load i16* %152, align 2
  %154 = sext i16 %153 to i32
  %155 = add nsw i32 %47, %154
  %156 = trunc i32 %155 to i16
  %157 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %158 = getelementptr inbounds %struct.MV* %157, i32 0, i32 0
  store i16 %156, i16* %158, align 2
  %159 = sext i32 %i.1 to i64
  %160 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %159
  %161 = getelementptr inbounds %struct.MV* %160, i32 0, i32 1
  %162 = load i16* %161, align 2
  %163 = sext i16 %162 to i32
  %164 = add nsw i32 %51, %163
  %165 = trunc i32 %164 to i16
  %166 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %167 = getelementptr inbounds %struct.MV* %166, i32 0, i32 1
  store i16 %165, i16* %167, align 2
  %168 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %169 = getelementptr inbounds %struct.MV* %168, i32 0, i32 1
  %170 = load i16* %169, align 2
  %171 = sext i16 %170 to i32
  %172 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %173 = load i32* %172, align 4
  %174 = icmp slt i32 %171, %173
  br i1 %174, label %175, label %176

; <label>:175                                     ; preds = %149
  br label %228

; <label>:176                                     ; preds = %149
  %177 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %178 = getelementptr inbounds %struct.MV* %177, i32 0, i32 1
  %179 = load i16* %178, align 2
  %180 = sext i16 %179 to i32
  %181 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %182 = load i32* %181, align 4
  %183 = icmp sgt i32 %180, %182
  br i1 %183, label %184, label %185

; <label>:184                                     ; preds = %176
  br label %228

; <label>:185                                     ; preds = %176
  %186 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %187 = getelementptr inbounds %struct.MV* %186, i32 0, i32 0
  %188 = load i16* %187, align 2
  %189 = sext i16 %188 to i32
  %190 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %191 = load i32* %190, align 4
  %192 = icmp slt i32 %189, %191
  br i1 %192, label %193, label %194

; <label>:193                                     ; preds = %185
  br label %228

; <label>:194                                     ; preds = %185
  %195 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %196 = getelementptr inbounds %struct.MV* %195, i32 0, i32 0
  %197 = load i16* %196, align 2
  %198 = sext i16 %197 to i32
  %199 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %200 = load i32* %199, align 4
  %201 = icmp sgt i32 %198, %200
  br i1 %201, label %202, label %203

; <label>:202                                     ; preds = %194
  br label %228

; <label>:203                                     ; preds = %194
  %204 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %205 = getelementptr inbounds %struct.MV* %204, i32 0, i32 0
  %206 = load i16* %205, align 2
  %207 = sext i16 %206 to i32
  %208 = mul nsw i32 %207, %15
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds i8* %55, i64 %209
  %211 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %212 = getelementptr inbounds %struct.MV* %211, i32 0, i32 1
  %213 = load i16* %212, align 2
  %214 = sext i16 %213 to i32
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds i8* %210, i64 %215
  %217 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0
  %218 = load i32 (i8*, i32, i8*, i32, i32)** %217, align 8
  %219 = call i32 %218(i8* %9, i32 %11, i8* %216, i32 %15, i32 %bestsad.3)
  %220 = icmp ult i32 %219, %bestsad.3
  br i1 %220, label %221, label %227

; <label>:221                                     ; preds = %203
  %222 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit)
  %223 = add i32 %219, %222
  %224 = icmp ult i32 %223, %bestsad.3
  br i1 %224, label %225, label %226

; <label>:225                                     ; preds = %221
  br label %226

; <label>:226                                     ; preds = %225, %221
  %bestsad.4 = phi i32 [ %223, %225 ], [ %bestsad.3, %221 ]
  %best_site.4 = phi i32 [ %i.1, %225 ], [ %best_site.3, %221 ]
  br label %227

; <label>:227                                     ; preds = %226, %203
  %bestsad.5 = phi i32 [ %bestsad.4, %226 ], [ %bestsad.3, %203 ]
  %best_site.5 = phi i32 [ %best_site.4, %226 ], [ %best_site.3, %203 ]
  br label %228

; <label>:228                                     ; preds = %227, %202, %193, %184, %175
  %bestsad.6 = phi i32 [ %bestsad.3, %175 ], [ %bestsad.3, %184 ], [ %bestsad.3, %193 ], [ %bestsad.3, %202 ], [ %bestsad.5, %227 ]
  %best_site.6 = phi i32 [ %best_site.3, %175 ], [ %best_site.3, %184 ], [ %best_site.3, %193 ], [ %best_site.3, %202 ], [ %best_site.5, %227 ]
  %229 = add nsw i32 %i.1, 1
  br label %147

; <label>:230                                     ; preds = %147
  br label %231

; <label>:231                                     ; preds = %230, %145
  %bestsad.7 = phi i32 [ %bestsad.0, %145 ], [ %bestsad.3, %230 ]
  %best_site.7 = phi i32 [ %best_site.0, %145 ], [ %best_site.3, %230 ]
  %232 = icmp eq i32 %best_site.7, -1
  br i1 %232, label %233, label %234

; <label>:233                                     ; preds = %231
  br label %453

; <label>:234                                     ; preds = %231
  %235 = sext i32 %best_site.7 to i64
  %236 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %235
  %237 = getelementptr inbounds %struct.MV* %236, i32 0, i32 0
  %238 = load i16* %237, align 2
  %239 = sext i16 %238 to i32
  %240 = add nsw i32 %47, %239
  %241 = sext i32 %best_site.7 to i64
  %242 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %241
  %243 = getelementptr inbounds %struct.MV* %242, i32 0, i32 1
  %244 = load i16* %243, align 2
  %245 = sext i16 %244 to i32
  %246 = add nsw i32 %51, %245
  br label %247

; <label>:247                                     ; preds = %234
  br label %248

; <label>:248                                     ; preds = %450, %247
  %j.0 = phi i32 [ 1, %247 ], [ %451, %450 ]
  %br.0 = phi i32 [ %240, %247 ], [ %429, %450 ]
  %bc.0 = phi i32 [ %246, %247 ], [ %437, %450 ]
  %bestsad.8 = phi i32 [ %bestsad.7, %247 ], [ %bestsad.16, %450 ]
  %k.0 = phi i32 [ %best_site.7, %247 ], [ %k.2, %450 ]
  %249 = icmp slt i32 %j.0, 127
  br i1 %249, label %250, label %452

; <label>:250                                     ; preds = %248
  %251 = sub nsw i32 %br.0, 2
  %252 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %253 = load i32* %252, align 4
  %254 = icmp sge i32 %251, %253
  %255 = zext i1 %254 to i32
  %256 = and i32 1, %255
  %257 = add nsw i32 %br.0, 2
  %258 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %259 = load i32* %258, align 4
  %260 = icmp sle i32 %257, %259
  %261 = zext i1 %260 to i32
  %262 = and i32 %256, %261
  %263 = sub nsw i32 %bc.0, 2
  %264 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %265 = load i32* %264, align 4
  %266 = icmp sge i32 %263, %265
  %267 = zext i1 %266 to i32
  %268 = and i32 %262, %267
  %269 = add nsw i32 %bc.0, 2
  %270 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %271 = load i32* %270, align 4
  %272 = icmp sle i32 %269, %271
  %273 = zext i1 %272 to i32
  %274 = and i32 %268, %273
  %275 = icmp ne i32 %274, 0
  br i1 %275, label %276, label %329

; <label>:276                                     ; preds = %250
  br label %277

; <label>:277                                     ; preds = %326, %276
  %i.2 = phi i32 [ 0, %276 ], [ %327, %326 ]
  %bestsad.9 = phi i32 [ %bestsad.8, %276 ], [ %bestsad.11, %326 ]
  %best_site.8 = phi i32 [ -1, %276 ], [ %best_site.10, %326 ]
  %278 = icmp slt i32 %i.2, 3
  br i1 %278, label %279, label %328

; <label>:279                                     ; preds = %277
  %280 = sext i32 %i.2 to i64
  %281 = sext i32 %k.0 to i64
  %282 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %281
  %283 = getelementptr inbounds [3 x %struct.MV]* %282, i32 0, i64 %280
  %284 = getelementptr inbounds %struct.MV* %283, i32 0, i32 0
  %285 = load i16* %284, align 2
  %286 = sext i16 %285 to i32
  %287 = add nsw i32 %br.0, %286
  %288 = trunc i32 %287 to i16
  %289 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %290 = getelementptr inbounds %struct.MV* %289, i32 0, i32 0
  store i16 %288, i16* %290, align 2
  %291 = sext i32 %i.2 to i64
  %292 = sext i32 %k.0 to i64
  %293 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %292
  %294 = getelementptr inbounds [3 x %struct.MV]* %293, i32 0, i64 %291
  %295 = getelementptr inbounds %struct.MV* %294, i32 0, i32 1
  %296 = load i16* %295, align 2
  %297 = sext i16 %296 to i32
  %298 = add nsw i32 %bc.0, %297
  %299 = trunc i32 %298 to i16
  %300 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %301 = getelementptr inbounds %struct.MV* %300, i32 0, i32 1
  store i16 %299, i16* %301, align 2
  %302 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %303 = getelementptr inbounds %struct.MV* %302, i32 0, i32 0
  %304 = load i16* %303, align 2
  %305 = sext i16 %304 to i32
  %306 = mul nsw i32 %305, %15
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds i8* %55, i64 %307
  %309 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %310 = getelementptr inbounds %struct.MV* %309, i32 0, i32 1
  %311 = load i16* %310, align 2
  %312 = sext i16 %311 to i32
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds i8* %308, i64 %313
  %315 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0
  %316 = load i32 (i8*, i32, i8*, i32, i32)** %315, align 8
  %317 = call i32 %316(i8* %9, i32 %11, i8* %314, i32 %15, i32 %bestsad.9)
  %318 = icmp ult i32 %317, %bestsad.9
  br i1 %318, label %319, label %325

; <label>:319                                     ; preds = %279
  %320 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit)
  %321 = add i32 %317, %320
  %322 = icmp ult i32 %321, %bestsad.9
  br i1 %322, label %323, label %324

; <label>:323                                     ; preds = %319
  br label %324

; <label>:324                                     ; preds = %323, %319
  %bestsad.10 = phi i32 [ %321, %323 ], [ %bestsad.9, %319 ]
  %best_site.9 = phi i32 [ %i.2, %323 ], [ %best_site.8, %319 ]
  br label %325

; <label>:325                                     ; preds = %324, %279
  %bestsad.11 = phi i32 [ %bestsad.10, %324 ], [ %bestsad.9, %279 ]
  %best_site.10 = phi i32 [ %best_site.9, %324 ], [ %best_site.8, %279 ]
  br label %326

; <label>:326                                     ; preds = %325
  %327 = add nsw i32 %i.2, 1
  br label %277

; <label>:328                                     ; preds = %277
  br label %418

; <label>:329                                     ; preds = %250
  br label %330

; <label>:330                                     ; preds = %415, %329
  %i.3 = phi i32 [ 0, %329 ], [ %416, %415 ]
  %bestsad.12 = phi i32 [ %bestsad.8, %329 ], [ %bestsad.15, %415 ]
  %best_site.11 = phi i32 [ -1, %329 ], [ %best_site.14, %415 ]
  %331 = icmp slt i32 %i.3, 3
  br i1 %331, label %332, label %417

; <label>:332                                     ; preds = %330
  %333 = sext i32 %i.3 to i64
  %334 = sext i32 %k.0 to i64
  %335 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %334
  %336 = getelementptr inbounds [3 x %struct.MV]* %335, i32 0, i64 %333
  %337 = getelementptr inbounds %struct.MV* %336, i32 0, i32 0
  %338 = load i16* %337, align 2
  %339 = sext i16 %338 to i32
  %340 = add nsw i32 %br.0, %339
  %341 = trunc i32 %340 to i16
  %342 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %343 = getelementptr inbounds %struct.MV* %342, i32 0, i32 0
  store i16 %341, i16* %343, align 2
  %344 = sext i32 %i.3 to i64
  %345 = sext i32 %k.0 to i64
  %346 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %345
  %347 = getelementptr inbounds [3 x %struct.MV]* %346, i32 0, i64 %344
  %348 = getelementptr inbounds %struct.MV* %347, i32 0, i32 1
  %349 = load i16* %348, align 2
  %350 = sext i16 %349 to i32
  %351 = add nsw i32 %bc.0, %350
  %352 = trunc i32 %351 to i16
  %353 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %354 = getelementptr inbounds %struct.MV* %353, i32 0, i32 1
  store i16 %352, i16* %354, align 2
  %355 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %356 = getelementptr inbounds %struct.MV* %355, i32 0, i32 1
  %357 = load i16* %356, align 2
  %358 = sext i16 %357 to i32
  %359 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %360 = load i32* %359, align 4
  %361 = icmp slt i32 %358, %360
  br i1 %361, label %362, label %363

; <label>:362                                     ; preds = %332
  br label %415

; <label>:363                                     ; preds = %332
  %364 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %365 = getelementptr inbounds %struct.MV* %364, i32 0, i32 1
  %366 = load i16* %365, align 2
  %367 = sext i16 %366 to i32
  %368 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %369 = load i32* %368, align 4
  %370 = icmp sgt i32 %367, %369
  br i1 %370, label %371, label %372

; <label>:371                                     ; preds = %363
  br label %415

; <label>:372                                     ; preds = %363
  %373 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %374 = getelementptr inbounds %struct.MV* %373, i32 0, i32 0
  %375 = load i16* %374, align 2
  %376 = sext i16 %375 to i32
  %377 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %378 = load i32* %377, align 4
  %379 = icmp slt i32 %376, %378
  br i1 %379, label %380, label %381

; <label>:380                                     ; preds = %372
  br label %415

; <label>:381                                     ; preds = %372
  %382 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %383 = getelementptr inbounds %struct.MV* %382, i32 0, i32 0
  %384 = load i16* %383, align 2
  %385 = sext i16 %384 to i32
  %386 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %387 = load i32* %386, align 4
  %388 = icmp sgt i32 %385, %387
  br i1 %388, label %389, label %390

; <label>:389                                     ; preds = %381
  br label %415

; <label>:390                                     ; preds = %381
  %391 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %392 = getelementptr inbounds %struct.MV* %391, i32 0, i32 0
  %393 = load i16* %392, align 2
  %394 = sext i16 %393 to i32
  %395 = mul nsw i32 %394, %15
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds i8* %55, i64 %396
  %398 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %399 = getelementptr inbounds %struct.MV* %398, i32 0, i32 1
  %400 = load i16* %399, align 2
  %401 = sext i16 %400 to i32
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds i8* %397, i64 %402
  %404 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0
  %405 = load i32 (i8*, i32, i8*, i32, i32)** %404, align 8
  %406 = call i32 %405(i8* %9, i32 %11, i8* %403, i32 %15, i32 %bestsad.12)
  %407 = icmp ult i32 %406, %bestsad.12
  br i1 %407, label %408, label %414

; <label>:408                                     ; preds = %390
  %409 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit)
  %410 = add i32 %406, %409
  %411 = icmp ult i32 %410, %bestsad.12
  br i1 %411, label %412, label %413

; <label>:412                                     ; preds = %408
  br label %413

; <label>:413                                     ; preds = %412, %408
  %bestsad.13 = phi i32 [ %410, %412 ], [ %bestsad.12, %408 ]
  %best_site.12 = phi i32 [ %i.3, %412 ], [ %best_site.11, %408 ]
  br label %414

; <label>:414                                     ; preds = %413, %390
  %bestsad.14 = phi i32 [ %bestsad.13, %413 ], [ %bestsad.12, %390 ]
  %best_site.13 = phi i32 [ %best_site.12, %413 ], [ %best_site.11, %390 ]
  br label %415

; <label>:415                                     ; preds = %414, %389, %380, %371, %362
  %bestsad.15 = phi i32 [ %bestsad.12, %362 ], [ %bestsad.12, %371 ], [ %bestsad.12, %380 ], [ %bestsad.12, %389 ], [ %bestsad.14, %414 ]
  %best_site.14 = phi i32 [ %best_site.11, %362 ], [ %best_site.11, %371 ], [ %best_site.11, %380 ], [ %best_site.11, %389 ], [ %best_site.13, %414 ]
  %416 = add nsw i32 %i.3, 1
  br label %330

; <label>:417                                     ; preds = %330
  br label %418

; <label>:418                                     ; preds = %417, %328
  %bestsad.16 = phi i32 [ %bestsad.9, %328 ], [ %bestsad.12, %417 ]
  %best_site.15 = phi i32 [ %best_site.8, %328 ], [ %best_site.11, %417 ]
  %419 = icmp eq i32 %best_site.15, -1
  br i1 %419, label %420, label %421

; <label>:420                                     ; preds = %418
  br label %452

; <label>:421                                     ; preds = %418
  %422 = sext i32 %best_site.15 to i64
  %423 = sext i32 %k.0 to i64
  %424 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %423
  %425 = getelementptr inbounds [3 x %struct.MV]* %424, i32 0, i64 %422
  %426 = getelementptr inbounds %struct.MV* %425, i32 0, i32 0
  %427 = load i16* %426, align 2
  %428 = sext i16 %427 to i32
  %429 = add nsw i32 %br.0, %428
  %430 = sext i32 %best_site.15 to i64
  %431 = sext i32 %k.0 to i64
  %432 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %431
  %433 = getelementptr inbounds [3 x %struct.MV]* %432, i32 0, i64 %430
  %434 = getelementptr inbounds %struct.MV* %433, i32 0, i32 1
  %435 = load i16* %434, align 2
  %436 = sext i16 %435 to i32
  %437 = add nsw i32 %bc.0, %436
  %438 = add nsw i32 5, %best_site.15
  %439 = add nsw i32 %k.0, %438
  %440 = icmp sge i32 %439, 12
  br i1 %440, label %441, label %443

; <label>:441                                     ; preds = %421
  %442 = sub nsw i32 %439, 12
  br label %448

; <label>:443                                     ; preds = %421
  %444 = icmp sge i32 %439, 6
  br i1 %444, label %445, label %447

; <label>:445                                     ; preds = %443
  %446 = sub nsw i32 %439, 6
  br label %447

; <label>:447                                     ; preds = %445, %443
  %k.1 = phi i32 [ %446, %445 ], [ %439, %443 ]
  br label %448

; <label>:448                                     ; preds = %447, %441
  %k.2 = phi i32 [ %442, %441 ], [ %k.1, %447 ]
  br label %449

; <label>:449                                     ; preds = %448
  br label %450

; <label>:450                                     ; preds = %449
  %451 = add nsw i32 %j.0, 1
  br label %248

; <label>:452                                     ; preds = %420, %248
  %bestsad.17 = phi i32 [ %bestsad.16, %420 ], [ %bestsad.8, %248 ]
  br label %453

; <label>:453                                     ; preds = %452, %233
  %br.1 = phi i32 [ %47, %233 ], [ %br.0, %452 ]
  %bc.1 = phi i32 [ %51, %233 ], [ %bc.0, %452 ]
  %bestsad.18 = phi i32 [ %bestsad.7, %233 ], [ %bestsad.17, %452 ]
  br label %454

; <label>:454                                     ; preds = %633, %453
  %j.1 = phi i32 [ 0, %453 ], [ %634, %633 ]
  %br.2 = phi i32 [ %br.1, %453 ], [ %625, %633 ]
  %bc.2 = phi i32 [ %bc.1, %453 ], [ %631, %633 ]
  %bestsad.19 = phi i32 [ %bestsad.18, %453 ], [ %bestsad.27, %633 ]
  %455 = icmp slt i32 %j.1, 8
  br i1 %455, label %456, label %635

; <label>:456                                     ; preds = %454
  %457 = sub nsw i32 %br.2, 1
  %458 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %459 = load i32* %458, align 4
  %460 = icmp sge i32 %457, %459
  %461 = zext i1 %460 to i32
  %462 = and i32 1, %461
  %463 = add nsw i32 %br.2, 1
  %464 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %465 = load i32* %464, align 4
  %466 = icmp sle i32 %463, %465
  %467 = zext i1 %466 to i32
  %468 = and i32 %462, %467
  %469 = sub nsw i32 %bc.2, 1
  %470 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %471 = load i32* %470, align 4
  %472 = icmp sge i32 %469, %471
  %473 = zext i1 %472 to i32
  %474 = and i32 %468, %473
  %475 = add nsw i32 %bc.2, 1
  %476 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %477 = load i32* %476, align 4
  %478 = icmp sle i32 %475, %477
  %479 = zext i1 %478 to i32
  %480 = and i32 %474, %479
  %481 = icmp ne i32 %480, 0
  br i1 %481, label %482, label %531

; <label>:482                                     ; preds = %456
  br label %483

; <label>:483                                     ; preds = %528, %482
  %i.4 = phi i32 [ 0, %482 ], [ %529, %528 ]
  %bestsad.20 = phi i32 [ %bestsad.19, %482 ], [ %bestsad.22, %528 ]
  %best_site.16 = phi i32 [ -1, %482 ], [ %best_site.18, %528 ]
  %484 = icmp slt i32 %i.4, 4
  br i1 %484, label %485, label %530

; <label>:485                                     ; preds = %483
  %486 = sext i32 %i.4 to i64
  %487 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %486
  %488 = getelementptr inbounds %struct.MV* %487, i32 0, i32 0
  %489 = load i16* %488, align 2
  %490 = sext i16 %489 to i32
  %491 = add nsw i32 %br.2, %490
  %492 = trunc i32 %491 to i16
  %493 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %494 = getelementptr inbounds %struct.MV* %493, i32 0, i32 0
  store i16 %492, i16* %494, align 2
  %495 = sext i32 %i.4 to i64
  %496 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %495
  %497 = getelementptr inbounds %struct.MV* %496, i32 0, i32 1
  %498 = load i16* %497, align 2
  %499 = sext i16 %498 to i32
  %500 = add nsw i32 %bc.2, %499
  %501 = trunc i32 %500 to i16
  %502 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %503 = getelementptr inbounds %struct.MV* %502, i32 0, i32 1
  store i16 %501, i16* %503, align 2
  %504 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %505 = getelementptr inbounds %struct.MV* %504, i32 0, i32 0
  %506 = load i16* %505, align 2
  %507 = sext i16 %506 to i32
  %508 = mul nsw i32 %507, %15
  %509 = sext i32 %508 to i64
  %510 = getelementptr inbounds i8* %55, i64 %509
  %511 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %512 = getelementptr inbounds %struct.MV* %511, i32 0, i32 1
  %513 = load i16* %512, align 2
  %514 = sext i16 %513 to i32
  %515 = sext i32 %514 to i64
  %516 = getelementptr inbounds i8* %510, i64 %515
  %517 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0
  %518 = load i32 (i8*, i32, i8*, i32, i32)** %517, align 8
  %519 = call i32 %518(i8* %9, i32 %11, i8* %516, i32 %15, i32 %bestsad.20)
  %520 = icmp ult i32 %519, %bestsad.20
  br i1 %520, label %521, label %527

; <label>:521                                     ; preds = %485
  %522 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit)
  %523 = add i32 %519, %522
  %524 = icmp ult i32 %523, %bestsad.20
  br i1 %524, label %525, label %526

; <label>:525                                     ; preds = %521
  br label %526

; <label>:526                                     ; preds = %525, %521
  %bestsad.21 = phi i32 [ %523, %525 ], [ %bestsad.20, %521 ]
  %best_site.17 = phi i32 [ %i.4, %525 ], [ %best_site.16, %521 ]
  br label %527

; <label>:527                                     ; preds = %526, %485
  %bestsad.22 = phi i32 [ %bestsad.21, %526 ], [ %bestsad.20, %485 ]
  %best_site.18 = phi i32 [ %best_site.17, %526 ], [ %best_site.16, %485 ]
  br label %528

; <label>:528                                     ; preds = %527
  %529 = add nsw i32 %i.4, 1
  br label %483

; <label>:530                                     ; preds = %483
  br label %616

; <label>:531                                     ; preds = %456
  br label %532

; <label>:532                                     ; preds = %613, %531
  %i.5 = phi i32 [ 0, %531 ], [ %614, %613 ]
  %bestsad.23 = phi i32 [ %bestsad.19, %531 ], [ %bestsad.26, %613 ]
  %best_site.19 = phi i32 [ -1, %531 ], [ %best_site.22, %613 ]
  %533 = icmp slt i32 %i.5, 4
  br i1 %533, label %534, label %615

; <label>:534                                     ; preds = %532
  %535 = sext i32 %i.5 to i64
  %536 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %535
  %537 = getelementptr inbounds %struct.MV* %536, i32 0, i32 0
  %538 = load i16* %537, align 2
  %539 = sext i16 %538 to i32
  %540 = add nsw i32 %br.2, %539
  %541 = trunc i32 %540 to i16
  %542 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %543 = getelementptr inbounds %struct.MV* %542, i32 0, i32 0
  store i16 %541, i16* %543, align 2
  %544 = sext i32 %i.5 to i64
  %545 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %544
  %546 = getelementptr inbounds %struct.MV* %545, i32 0, i32 1
  %547 = load i16* %546, align 2
  %548 = sext i16 %547 to i32
  %549 = add nsw i32 %bc.2, %548
  %550 = trunc i32 %549 to i16
  %551 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %552 = getelementptr inbounds %struct.MV* %551, i32 0, i32 1
  store i16 %550, i16* %552, align 2
  %553 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %554 = getelementptr inbounds %struct.MV* %553, i32 0, i32 1
  %555 = load i16* %554, align 2
  %556 = sext i16 %555 to i32
  %557 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %558 = load i32* %557, align 4
  %559 = icmp slt i32 %556, %558
  br i1 %559, label %560, label %561

; <label>:560                                     ; preds = %534
  br label %613

; <label>:561                                     ; preds = %534
  %562 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %563 = getelementptr inbounds %struct.MV* %562, i32 0, i32 1
  %564 = load i16* %563, align 2
  %565 = sext i16 %564 to i32
  %566 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %567 = load i32* %566, align 4
  %568 = icmp sgt i32 %565, %567
  br i1 %568, label %569, label %570

; <label>:569                                     ; preds = %561
  br label %613

; <label>:570                                     ; preds = %561
  %571 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %572 = getelementptr inbounds %struct.MV* %571, i32 0, i32 0
  %573 = load i16* %572, align 2
  %574 = sext i16 %573 to i32
  %575 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %576 = load i32* %575, align 4
  %577 = icmp slt i32 %574, %576
  br i1 %577, label %578, label %579

; <label>:578                                     ; preds = %570
  br label %613

; <label>:579                                     ; preds = %570
  %580 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %581 = getelementptr inbounds %struct.MV* %580, i32 0, i32 0
  %582 = load i16* %581, align 2
  %583 = sext i16 %582 to i32
  %584 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %585 = load i32* %584, align 4
  %586 = icmp sgt i32 %583, %585
  br i1 %586, label %587, label %588

; <label>:587                                     ; preds = %579
  br label %613

; <label>:588                                     ; preds = %579
  %589 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %590 = getelementptr inbounds %struct.MV* %589, i32 0, i32 0
  %591 = load i16* %590, align 2
  %592 = sext i16 %591 to i32
  %593 = mul nsw i32 %592, %15
  %594 = sext i32 %593 to i64
  %595 = getelementptr inbounds i8* %55, i64 %594
  %596 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %597 = getelementptr inbounds %struct.MV* %596, i32 0, i32 1
  %598 = load i16* %597, align 2
  %599 = sext i16 %598 to i32
  %600 = sext i32 %599 to i64
  %601 = getelementptr inbounds i8* %595, i64 %600
  %602 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0
  %603 = load i32 (i8*, i32, i8*, i32, i32)** %602, align 8
  %604 = call i32 %603(i8* %9, i32 %11, i8* %601, i32 %15, i32 %bestsad.23)
  %605 = icmp ult i32 %604, %bestsad.23
  br i1 %605, label %606, label %612

; <label>:606                                     ; preds = %588
  %607 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit)
  %608 = add i32 %604, %607
  %609 = icmp ult i32 %608, %bestsad.23
  br i1 %609, label %610, label %611

; <label>:610                                     ; preds = %606
  br label %611

; <label>:611                                     ; preds = %610, %606
  %bestsad.24 = phi i32 [ %608, %610 ], [ %bestsad.23, %606 ]
  %best_site.20 = phi i32 [ %i.5, %610 ], [ %best_site.19, %606 ]
  br label %612

; <label>:612                                     ; preds = %611, %588
  %bestsad.25 = phi i32 [ %bestsad.24, %611 ], [ %bestsad.23, %588 ]
  %best_site.21 = phi i32 [ %best_site.20, %611 ], [ %best_site.19, %588 ]
  br label %613

; <label>:613                                     ; preds = %612, %587, %578, %569, %560
  %bestsad.26 = phi i32 [ %bestsad.23, %560 ], [ %bestsad.23, %569 ], [ %bestsad.23, %578 ], [ %bestsad.23, %587 ], [ %bestsad.25, %612 ]
  %best_site.22 = phi i32 [ %best_site.19, %560 ], [ %best_site.19, %569 ], [ %best_site.19, %578 ], [ %best_site.19, %587 ], [ %best_site.21, %612 ]
  %614 = add nsw i32 %i.5, 1
  br label %532

; <label>:615                                     ; preds = %532
  br label %616

; <label>:616                                     ; preds = %615, %530
  %bestsad.27 = phi i32 [ %bestsad.20, %530 ], [ %bestsad.23, %615 ]
  %best_site.23 = phi i32 [ %best_site.16, %530 ], [ %best_site.19, %615 ]
  %617 = icmp eq i32 %best_site.23, -1
  br i1 %617, label %618, label %619

; <label>:618                                     ; preds = %616
  br label %635

; <label>:619                                     ; preds = %616
  %620 = sext i32 %best_site.23 to i64
  %621 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %620
  %622 = getelementptr inbounds %struct.MV* %621, i32 0, i32 0
  %623 = load i16* %622, align 2
  %624 = sext i16 %623 to i32
  %625 = add nsw i32 %br.2, %624
  %626 = sext i32 %best_site.23 to i64
  %627 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %626
  %628 = getelementptr inbounds %struct.MV* %627, i32 0, i32 1
  %629 = load i16* %628, align 2
  %630 = sext i16 %629 to i32
  %631 = add nsw i32 %bc.2, %630
  br label %632

; <label>:632                                     ; preds = %619
  br label %633

; <label>:633                                     ; preds = %632
  %634 = add nsw i32 %j.1, 1
  br label %454

; <label>:635                                     ; preds = %618, %454
  %bestsad.28 = phi i32 [ %bestsad.27, %618 ], [ %bestsad.19, %454 ]
  %636 = trunc i32 %br.2 to i16
  %637 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %638 = getelementptr inbounds %struct.MV* %637, i32 0, i32 0
  store i16 %636, i16* %638, align 2
  %639 = trunc i32 %bc.2 to i16
  %640 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %641 = getelementptr inbounds %struct.MV* %640, i32 0, i32 1
  store i16 %639, i16* %641, align 2
  ret i32 %bestsad.28
}

; Function Attrs: nounwind uwtable
define internal void @vp8_clamp_mv(%union.int_mv* %mv, i32 %mb_to_left_edge, i32 %mb_to_right_edge, i32 %mb_to_top_edge, i32 %mb_to_bottom_edge) #0 {
  %1 = bitcast %union.int_mv* %mv to %struct.MV*
  %2 = getelementptr inbounds %struct.MV* %1, i32 0, i32 1
  %3 = load i16* %2, align 2
  %4 = sext i16 %3 to i32
  %5 = icmp slt i32 %4, %mb_to_left_edge
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %12

; <label>:7                                       ; preds = %0
  %8 = bitcast %union.int_mv* %mv to %struct.MV*
  %9 = getelementptr inbounds %struct.MV* %8, i32 0, i32 1
  %10 = load i16* %9, align 2
  %11 = sext i16 %10 to i32
  br label %12

; <label>:12                                      ; preds = %7, %6
  %13 = phi i32 [ %mb_to_left_edge, %6 ], [ %11, %7 ]
  %14 = trunc i32 %13 to i16
  %15 = bitcast %union.int_mv* %mv to %struct.MV*
  %16 = getelementptr inbounds %struct.MV* %15, i32 0, i32 1
  store i16 %14, i16* %16, align 2
  %17 = bitcast %union.int_mv* %mv to %struct.MV*
  %18 = getelementptr inbounds %struct.MV* %17, i32 0, i32 1
  %19 = load i16* %18, align 2
  %20 = sext i16 %19 to i32
  %21 = icmp sgt i32 %20, %mb_to_right_edge
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %12
  br label %28

; <label>:23                                      ; preds = %12
  %24 = bitcast %union.int_mv* %mv to %struct.MV*
  %25 = getelementptr inbounds %struct.MV* %24, i32 0, i32 1
  %26 = load i16* %25, align 2
  %27 = sext i16 %26 to i32
  br label %28

; <label>:28                                      ; preds = %23, %22
  %29 = phi i32 [ %mb_to_right_edge, %22 ], [ %27, %23 ]
  %30 = trunc i32 %29 to i16
  %31 = bitcast %union.int_mv* %mv to %struct.MV*
  %32 = getelementptr inbounds %struct.MV* %31, i32 0, i32 1
  store i16 %30, i16* %32, align 2
  %33 = bitcast %union.int_mv* %mv to %struct.MV*
  %34 = getelementptr inbounds %struct.MV* %33, i32 0, i32 0
  %35 = load i16* %34, align 2
  %36 = sext i16 %35 to i32
  %37 = icmp slt i32 %36, %mb_to_top_edge
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %28
  br label %44

; <label>:39                                      ; preds = %28
  %40 = bitcast %union.int_mv* %mv to %struct.MV*
  %41 = getelementptr inbounds %struct.MV* %40, i32 0, i32 0
  %42 = load i16* %41, align 2
  %43 = sext i16 %42 to i32
  br label %44

; <label>:44                                      ; preds = %39, %38
  %45 = phi i32 [ %mb_to_top_edge, %38 ], [ %43, %39 ]
  %46 = trunc i32 %45 to i16
  %47 = bitcast %union.int_mv* %mv to %struct.MV*
  %48 = getelementptr inbounds %struct.MV* %47, i32 0, i32 0
  store i16 %46, i16* %48, align 2
  %49 = bitcast %union.int_mv* %mv to %struct.MV*
  %50 = getelementptr inbounds %struct.MV* %49, i32 0, i32 0
  %51 = load i16* %50, align 2
  %52 = sext i16 %51 to i32
  %53 = icmp sgt i32 %52, %mb_to_bottom_edge
  br i1 %53, label %54, label %55

; <label>:54                                      ; preds = %44
  br label %60

; <label>:55                                      ; preds = %44
  %56 = bitcast %union.int_mv* %mv to %struct.MV*
  %57 = getelementptr inbounds %struct.MV* %56, i32 0, i32 0
  %58 = load i16* %57, align 2
  %59 = sext i16 %58 to i32
  br label %60

; <label>:60                                      ; preds = %55, %54
  %61 = phi i32 [ %mb_to_bottom_edge, %54 ], [ %59, %55 ]
  %62 = trunc i32 %61 to i16
  %63 = bitcast %union.int_mv* %mv to %struct.MV*
  %64 = getelementptr inbounds %struct.MV* %63, i32 0, i32 0
  store i16 %62, i16* %64, align 2
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @mvsad_err_cost(%union.int_mv* %mv, %union.int_mv* %ref, i32** %mvsadcost, i32 %error_per_bit) #0 {
  %1 = icmp ne i32** %mvsadcost, null
  br i1 %1, label %2, label %35

; <label>:2                                       ; preds = %0
  %3 = bitcast %union.int_mv* %mv to %struct.MV*
  %4 = getelementptr inbounds %struct.MV* %3, i32 0, i32 0
  %5 = load i16* %4, align 2
  %6 = sext i16 %5 to i32
  %7 = bitcast %union.int_mv* %ref to %struct.MV*
  %8 = getelementptr inbounds %struct.MV* %7, i32 0, i32 0
  %9 = load i16* %8, align 2
  %10 = sext i16 %9 to i32
  %11 = sub nsw i32 %6, %10
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32** %mvsadcost, i64 0
  %14 = load i32** %13, align 8
  %15 = getelementptr inbounds i32* %14, i64 %12
  %16 = load i32* %15, align 4
  %17 = bitcast %union.int_mv* %mv to %struct.MV*
  %18 = getelementptr inbounds %struct.MV* %17, i32 0, i32 1
  %19 = load i16* %18, align 2
  %20 = sext i16 %19 to i32
  %21 = bitcast %union.int_mv* %ref to %struct.MV*
  %22 = getelementptr inbounds %struct.MV* %21, i32 0, i32 1
  %23 = load i16* %22, align 2
  %24 = sext i16 %23 to i32
  %25 = sub nsw i32 %20, %24
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32** %mvsadcost, i64 1
  %28 = load i32** %27, align 8
  %29 = getelementptr inbounds i32* %28, i64 %26
  %30 = load i32* %29, align 4
  %31 = add nsw i32 %16, %30
  %32 = mul nsw i32 %31, %error_per_bit
  %33 = add nsw i32 %32, 128
  %34 = ashr i32 %33, 8
  br label %36

; <label>:35                                      ; preds = %0
  br label %36

; <label>:36                                      ; preds = %35, %2
  %.0 = phi i32 [ %34, %2 ], [ 0, %35 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @vp8_diamond_search_sad_c(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, %union.int_mv* %best_mv, i32 %search_param, i32 %sad_per_bit, i32* %num00, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9
  %2 = load i8*** %1, align 8
  %3 = load i8** %2, align 8
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8* %3, i64 %6
  %8 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %9 = load i32* %8, align 4
  %10 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %11 = getelementptr inbounds %struct.macroblockd* %10, i32 0, i32 11
  %12 = getelementptr inbounds %struct.yv12_buffer_config* %11, i32 0, i32 4
  %13 = load i32* %12, align 4
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %15 = getelementptr inbounds %struct.macroblockd* %14, i32 0, i32 11
  %16 = getelementptr inbounds %struct.yv12_buffer_config* %15, i32 0, i32 13
  %17 = load i8** %16, align 8
  %18 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %19 = getelementptr inbounds [2 x i32*]* %18, i32 0, i64 0
  %20 = load i32** %19, align 8
  %21 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %20, i32** %21, align 8
  %22 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %23 = getelementptr inbounds [2 x i32*]* %22, i32 0, i64 1
  %24 = load i32** %23, align 8
  %25 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %24, i32** %25, align 8
  %26 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %27 = getelementptr inbounds %struct.MV* %26, i32 0, i32 0
  %28 = load i16* %27, align 2
  %29 = sext i16 %28 to i32
  %30 = ashr i32 %29, 3
  %31 = trunc i32 %30 to i16
  %32 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %33 = getelementptr inbounds %struct.MV* %32, i32 0, i32 0
  store i16 %31, i16* %33, align 2
  %34 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %35 = getelementptr inbounds %struct.MV* %34, i32 0, i32 1
  %36 = load i16* %35, align 2
  %37 = sext i16 %36 to i32
  %38 = ashr i32 %37, 3
  %39 = trunc i32 %38 to i16
  %40 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %41 = getelementptr inbounds %struct.MV* %40, i32 0, i32 1
  store i16 %39, i16* %41, align 2
  %42 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %43 = load i32* %42, align 4
  %44 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %45 = load i32* %44, align 4
  %46 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %47 = load i32* %46, align 4
  %48 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %49 = load i32* %48, align 4
  call void @vp8_clamp_mv(%union.int_mv* %ref_mv, i32 %43, i32 %45, i32 %47, i32 %49)
  %50 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %51 = getelementptr inbounds %struct.MV* %50, i32 0, i32 0
  %52 = load i16* %51, align 2
  %53 = sext i16 %52 to i32
  %54 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %55 = getelementptr inbounds %struct.MV* %54, i32 0, i32 1
  %56 = load i16* %55, align 2
  %57 = sext i16 %56 to i32
  store i32 0, i32* %num00, align 4
  %58 = trunc i32 %53 to i16
  %59 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %60 = getelementptr inbounds %struct.MV* %59, i32 0, i32 0
  store i16 %58, i16* %60, align 2
  %61 = trunc i32 %57 to i16
  %62 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %63 = getelementptr inbounds %struct.MV* %62, i32 0, i32 1
  store i16 %61, i16* %63, align 2
  %64 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4
  %65 = load i32* %64, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8* %17, i64 %66
  %68 = mul nsw i32 %53, %13
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8* %67, i64 %69
  %71 = sext i32 %57 to i64
  %72 = getelementptr inbounds i8* %70, i64 %71
  %73 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %74 = load i32 (i8*, i32, i8*, i32, i32)** %73, align 8
  %75 = call i32 %74(i8* %7, i32 %9, i8* %72, i32 %13, i32 -1)
  %76 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %77 = call i32 @mvsad_err_cost(%union.int_mv* %best_mv, %union.int_mv* %fcenter_mv, i32** %76, i32 %sad_per_bit)
  %78 = add i32 %75, %77
  %79 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14
  %80 = load i32* %79, align 4
  %81 = mul nsw i32 %search_param, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %84 = load %struct.search_site** %83, align 8
  %85 = getelementptr inbounds %struct.search_site* %84, i64 %82
  %86 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 13
  %87 = load i32* %86, align 4
  %88 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14
  %89 = load i32* %88, align 4
  %90 = sdiv i32 %87, %89
  %91 = sub nsw i32 %90, %search_param
  br label %92

; <label>:92                                      ; preds = %210, %0
  %i.0 = phi i32 [ 1, %0 ], [ %i.1, %210 ]
  %step.0 = phi i32 [ 0, %0 ], [ %211, %210 ]
  %best_address.0 = phi i8* [ %72, %0 ], [ %best_address.1, %210 ]
  %bestsad.0 = phi i32 [ %78, %0 ], [ %bestsad.1, %210 ]
  %best_site.0 = phi i32 [ 0, %0 ], [ %best_site.1, %210 ]
  %last_site.0 = phi i32 [ 0, %0 ], [ %last_site.1, %210 ]
  %93 = icmp slt i32 %step.0, %91
  br i1 %93, label %94, label %212

; <label>:94                                      ; preds = %92
  br label %95

; <label>:95                                      ; preds = %168, %94
  %i.1 = phi i32 [ %i.0, %94 ], [ %167, %168 ]
  %j.0 = phi i32 [ 0, %94 ], [ %169, %168 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %94 ], [ %bestsad.4, %168 ]
  %best_site.1 = phi i32 [ %best_site.0, %94 ], [ %best_site.4, %168 ]
  %96 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14
  %97 = load i32* %96, align 4
  %98 = icmp slt i32 %j.0, %97
  br i1 %98, label %99, label %170

; <label>:99                                      ; preds = %95
  %100 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %101 = getelementptr inbounds %struct.MV* %100, i32 0, i32 0
  %102 = load i16* %101, align 2
  %103 = sext i16 %102 to i32
  %104 = sext i32 %i.1 to i64
  %105 = getelementptr inbounds %struct.search_site* %85, i64 %104
  %106 = getelementptr inbounds %struct.search_site* %105, i32 0, i32 0
  %107 = getelementptr inbounds %struct.MV* %106, i32 0, i32 0
  %108 = load i16* %107, align 2
  %109 = sext i16 %108 to i32
  %110 = add nsw i32 %103, %109
  %111 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %112 = getelementptr inbounds %struct.MV* %111, i32 0, i32 1
  %113 = load i16* %112, align 2
  %114 = sext i16 %113 to i32
  %115 = sext i32 %i.1 to i64
  %116 = getelementptr inbounds %struct.search_site* %85, i64 %115
  %117 = getelementptr inbounds %struct.search_site* %116, i32 0, i32 0
  %118 = getelementptr inbounds %struct.MV* %117, i32 0, i32 1
  %119 = load i16* %118, align 2
  %120 = sext i16 %119 to i32
  %121 = add nsw i32 %114, %120
  %122 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %123 = load i32* %122, align 4
  %124 = icmp sgt i32 %121, %123
  br i1 %124, label %125, label %166

; <label>:125                                     ; preds = %99
  %126 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %127 = load i32* %126, align 4
  %128 = icmp slt i32 %121, %127
  br i1 %128, label %129, label %166

; <label>:129                                     ; preds = %125
  %130 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %131 = load i32* %130, align 4
  %132 = icmp sgt i32 %110, %131
  br i1 %132, label %133, label %166

; <label>:133                                     ; preds = %129
  %134 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %135 = load i32* %134, align 4
  %136 = icmp slt i32 %110, %135
  br i1 %136, label %137, label %166

; <label>:137                                     ; preds = %133
  %138 = sext i32 %i.1 to i64
  %139 = getelementptr inbounds %struct.search_site* %85, i64 %138
  %140 = getelementptr inbounds %struct.search_site* %139, i32 0, i32 1
  %141 = load i32* %140, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8* %best_address.0, i64 %142
  %144 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %145 = load i32 (i8*, i32, i8*, i32, i32)** %144, align 8
  %146 = call i32 %145(i8* %7, i32 %9, i8* %143, i32 %13, i32 %bestsad.1)
  store i32 %146, i32* %thissad, align 4
  %147 = load i32* %thissad, align 4
  %148 = icmp ult i32 %147, %bestsad.1
  br i1 %148, label %149, label %165

; <label>:149                                     ; preds = %137
  %150 = trunc i32 %110 to i16
  %151 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %152 = getelementptr inbounds %struct.MV* %151, i32 0, i32 0
  store i16 %150, i16* %152, align 2
  %153 = trunc i32 %121 to i16
  %154 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %155 = getelementptr inbounds %struct.MV* %154, i32 0, i32 1
  store i16 %153, i16* %155, align 2
  %156 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %157 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %156, i32 %sad_per_bit)
  %158 = load i32* %thissad, align 4
  %159 = add i32 %158, %157
  store i32 %159, i32* %thissad, align 4
  %160 = load i32* %thissad, align 4
  %161 = icmp ult i32 %160, %bestsad.1
  br i1 %161, label %162, label %164

; <label>:162                                     ; preds = %149
  %163 = load i32* %thissad, align 4
  br label %164

; <label>:164                                     ; preds = %162, %149
  %bestsad.2 = phi i32 [ %163, %162 ], [ %bestsad.1, %149 ]
  %best_site.2 = phi i32 [ %i.1, %162 ], [ %best_site.1, %149 ]
  br label %165

; <label>:165                                     ; preds = %164, %137
  %bestsad.3 = phi i32 [ %bestsad.2, %164 ], [ %bestsad.1, %137 ]
  %best_site.3 = phi i32 [ %best_site.2, %164 ], [ %best_site.1, %137 ]
  br label %166

; <label>:166                                     ; preds = %165, %133, %129, %125, %99
  %bestsad.4 = phi i32 [ %bestsad.3, %165 ], [ %bestsad.1, %133 ], [ %bestsad.1, %129 ], [ %bestsad.1, %125 ], [ %bestsad.1, %99 ]
  %best_site.4 = phi i32 [ %best_site.3, %165 ], [ %best_site.1, %133 ], [ %best_site.1, %129 ], [ %best_site.1, %125 ], [ %best_site.1, %99 ]
  %167 = add nsw i32 %i.1, 1
  br label %168

; <label>:168                                     ; preds = %166
  %169 = add nsw i32 %j.0, 1
  br label %95

; <label>:170                                     ; preds = %95
  %171 = icmp ne i32 %best_site.1, %last_site.0
  br i1 %171, label %172, label %203

; <label>:172                                     ; preds = %170
  %173 = sext i32 %best_site.1 to i64
  %174 = getelementptr inbounds %struct.search_site* %85, i64 %173
  %175 = getelementptr inbounds %struct.search_site* %174, i32 0, i32 0
  %176 = getelementptr inbounds %struct.MV* %175, i32 0, i32 0
  %177 = load i16* %176, align 2
  %178 = sext i16 %177 to i32
  %179 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %180 = getelementptr inbounds %struct.MV* %179, i32 0, i32 0
  %181 = load i16* %180, align 2
  %182 = sext i16 %181 to i32
  %183 = add nsw i32 %182, %178
  %184 = trunc i32 %183 to i16
  store i16 %184, i16* %180, align 2
  %185 = sext i32 %best_site.1 to i64
  %186 = getelementptr inbounds %struct.search_site* %85, i64 %185
  %187 = getelementptr inbounds %struct.search_site* %186, i32 0, i32 0
  %188 = getelementptr inbounds %struct.MV* %187, i32 0, i32 1
  %189 = load i16* %188, align 2
  %190 = sext i16 %189 to i32
  %191 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %192 = getelementptr inbounds %struct.MV* %191, i32 0, i32 1
  %193 = load i16* %192, align 2
  %194 = sext i16 %193 to i32
  %195 = add nsw i32 %194, %190
  %196 = trunc i32 %195 to i16
  store i16 %196, i16* %192, align 2
  %197 = sext i32 %best_site.1 to i64
  %198 = getelementptr inbounds %struct.search_site* %85, i64 %197
  %199 = getelementptr inbounds %struct.search_site* %198, i32 0, i32 1
  %200 = load i32* %199, align 4
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds i8* %best_address.0, i64 %201
  br label %209

; <label>:203                                     ; preds = %170
  %204 = icmp eq i8* %best_address.0, %72
  br i1 %204, label %205, label %208

; <label>:205                                     ; preds = %203
  %206 = load i32* %num00, align 4
  %207 = add nsw i32 %206, 1
  store i32 %207, i32* %num00, align 4
  br label %208

; <label>:208                                     ; preds = %205, %203
  br label %209

; <label>:209                                     ; preds = %208, %172
  %best_address.1 = phi i8* [ %202, %172 ], [ %best_address.0, %208 ]
  %last_site.1 = phi i32 [ %best_site.1, %172 ], [ %last_site.0, %208 ]
  br label %210

; <label>:210                                     ; preds = %209
  %211 = add nsw i32 %step.0, 1
  br label %92

; <label>:212                                     ; preds = %92
  %213 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %214 = getelementptr inbounds %struct.MV* %213, i32 0, i32 0
  %215 = load i16* %214, align 2
  %216 = sext i16 %215 to i32
  %217 = shl i32 %216, 3
  %218 = trunc i32 %217 to i16
  %219 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %220 = getelementptr inbounds %struct.MV* %219, i32 0, i32 0
  store i16 %218, i16* %220, align 2
  %221 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %222 = getelementptr inbounds %struct.MV* %221, i32 0, i32 1
  %223 = load i16* %222, align 2
  %224 = sext i16 %223 to i32
  %225 = shl i32 %224, 3
  %226 = trunc i32 %225 to i16
  %227 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %228 = getelementptr inbounds %struct.MV* %227, i32 0, i32 1
  store i16 %226, i16* %228, align 2
  %229 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1
  %230 = load i32 (i8*, i32, i8*, i32, i32*)** %229, align 8
  %231 = call i32 %230(i8* %7, i32 %9, i8* %best_address.0, i32 %13, i32* %thissad)
  %232 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15
  %233 = load i32* %232, align 4
  %234 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %233)
  %235 = add i32 %231, %234
  ret i32 %235
}

; Function Attrs: nounwind uwtable
define i32 @vp8_diamond_search_sadx4(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, %union.int_mv* %best_mv, i32 %search_param, i32 %sad_per_bit, i32* %num00, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %sad_array = alloca [4 x i32], align 16
  %block_offset = alloca [4 x i8*], align 16
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9
  %2 = load i8*** %1, align 8
  %3 = load i8** %2, align 8
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8* %3, i64 %6
  %8 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %9 = load i32* %8, align 4
  %10 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %11 = getelementptr inbounds %struct.macroblockd* %10, i32 0, i32 11
  %12 = getelementptr inbounds %struct.yv12_buffer_config* %11, i32 0, i32 4
  %13 = load i32* %12, align 4
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %15 = getelementptr inbounds %struct.macroblockd* %14, i32 0, i32 11
  %16 = getelementptr inbounds %struct.yv12_buffer_config* %15, i32 0, i32 13
  %17 = load i8** %16, align 8
  %18 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %19 = getelementptr inbounds [2 x i32*]* %18, i32 0, i64 0
  %20 = load i32** %19, align 8
  %21 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %20, i32** %21, align 8
  %22 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %23 = getelementptr inbounds [2 x i32*]* %22, i32 0, i64 1
  %24 = load i32** %23, align 8
  %25 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %24, i32** %25, align 8
  %26 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %27 = getelementptr inbounds %struct.MV* %26, i32 0, i32 0
  %28 = load i16* %27, align 2
  %29 = sext i16 %28 to i32
  %30 = ashr i32 %29, 3
  %31 = trunc i32 %30 to i16
  %32 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %33 = getelementptr inbounds %struct.MV* %32, i32 0, i32 0
  store i16 %31, i16* %33, align 2
  %34 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %35 = getelementptr inbounds %struct.MV* %34, i32 0, i32 1
  %36 = load i16* %35, align 2
  %37 = sext i16 %36 to i32
  %38 = ashr i32 %37, 3
  %39 = trunc i32 %38 to i16
  %40 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %41 = getelementptr inbounds %struct.MV* %40, i32 0, i32 1
  store i16 %39, i16* %41, align 2
  %42 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %43 = load i32* %42, align 4
  %44 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %45 = load i32* %44, align 4
  %46 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %47 = load i32* %46, align 4
  %48 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %49 = load i32* %48, align 4
  call void @vp8_clamp_mv(%union.int_mv* %ref_mv, i32 %43, i32 %45, i32 %47, i32 %49)
  %50 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %51 = getelementptr inbounds %struct.MV* %50, i32 0, i32 0
  %52 = load i16* %51, align 2
  %53 = sext i16 %52 to i32
  %54 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %55 = getelementptr inbounds %struct.MV* %54, i32 0, i32 1
  %56 = load i16* %55, align 2
  %57 = sext i16 %56 to i32
  store i32 0, i32* %num00, align 4
  %58 = trunc i32 %53 to i16
  %59 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %60 = getelementptr inbounds %struct.MV* %59, i32 0, i32 0
  store i16 %58, i16* %60, align 2
  %61 = trunc i32 %57 to i16
  %62 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %63 = getelementptr inbounds %struct.MV* %62, i32 0, i32 1
  store i16 %61, i16* %63, align 2
  %64 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4
  %65 = load i32* %64, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8* %17, i64 %66
  %68 = mul nsw i32 %53, %13
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8* %67, i64 %69
  %71 = sext i32 %57 to i64
  %72 = getelementptr inbounds i8* %70, i64 %71
  %73 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %74 = load i32 (i8*, i32, i8*, i32, i32)** %73, align 8
  %75 = call i32 %74(i8* %7, i32 %9, i8* %72, i32 %13, i32 -1)
  %76 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %77 = call i32 @mvsad_err_cost(%union.int_mv* %best_mv, %union.int_mv* %fcenter_mv, i32** %76, i32 %sad_per_bit)
  %78 = add i32 %75, %77
  %79 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14
  %80 = load i32* %79, align 4
  %81 = mul nsw i32 %search_param, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12
  %84 = load %struct.search_site** %83, align 8
  %85 = getelementptr inbounds %struct.search_site* %84, i64 %82
  %86 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 13
  %87 = load i32* %86, align 4
  %88 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14
  %89 = load i32* %88, align 4
  %90 = sdiv i32 %87, %89
  %91 = sub nsw i32 %90, %search_param
  br label %92

; <label>:92                                      ; preds = %364, %0
  %i.0 = phi i32 [ 1, %0 ], [ %i.4, %364 ]
  %step.0 = phi i32 [ 0, %0 ], [ %365, %364 ]
  %best_address.0 = phi i8* [ %72, %0 ], [ %best_address.1, %364 ]
  %bestsad.0 = phi i32 [ %78, %0 ], [ %bestsad.9, %364 ]
  %best_site.0 = phi i32 [ 0, %0 ], [ %best_site.9, %364 ]
  %last_site.0 = phi i32 [ 0, %0 ], [ %last_site.1, %364 ]
  %93 = icmp slt i32 %step.0, %91
  br i1 %93, label %94, label %366

; <label>:94                                      ; preds = %92
  %95 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %96 = getelementptr inbounds %struct.MV* %95, i32 0, i32 0
  %97 = load i16* %96, align 2
  %98 = sext i16 %97 to i32
  %99 = sext i32 %i.0 to i64
  %100 = getelementptr inbounds %struct.search_site* %85, i64 %99
  %101 = getelementptr inbounds %struct.search_site* %100, i32 0, i32 0
  %102 = getelementptr inbounds %struct.MV* %101, i32 0, i32 0
  %103 = load i16* %102, align 2
  %104 = sext i16 %103 to i32
  %105 = add nsw i32 %98, %104
  %106 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %107 = load i32* %106, align 4
  %108 = icmp sgt i32 %105, %107
  %109 = zext i1 %108 to i32
  %110 = and i32 1, %109
  %111 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %112 = getelementptr inbounds %struct.MV* %111, i32 0, i32 0
  %113 = load i16* %112, align 2
  %114 = sext i16 %113 to i32
  %115 = add nsw i32 %i.0, 1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds %struct.search_site* %85, i64 %116
  %118 = getelementptr inbounds %struct.search_site* %117, i32 0, i32 0
  %119 = getelementptr inbounds %struct.MV* %118, i32 0, i32 0
  %120 = load i16* %119, align 2
  %121 = sext i16 %120 to i32
  %122 = add nsw i32 %114, %121
  %123 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %124 = load i32* %123, align 4
  %125 = icmp slt i32 %122, %124
  %126 = zext i1 %125 to i32
  %127 = and i32 %110, %126
  %128 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %129 = getelementptr inbounds %struct.MV* %128, i32 0, i32 1
  %130 = load i16* %129, align 2
  %131 = sext i16 %130 to i32
  %132 = add nsw i32 %i.0, 2
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds %struct.search_site* %85, i64 %133
  %135 = getelementptr inbounds %struct.search_site* %134, i32 0, i32 0
  %136 = getelementptr inbounds %struct.MV* %135, i32 0, i32 1
  %137 = load i16* %136, align 2
  %138 = sext i16 %137 to i32
  %139 = add nsw i32 %131, %138
  %140 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %141 = load i32* %140, align 4
  %142 = icmp sgt i32 %139, %141
  %143 = zext i1 %142 to i32
  %144 = and i32 %127, %143
  %145 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %146 = getelementptr inbounds %struct.MV* %145, i32 0, i32 1
  %147 = load i16* %146, align 2
  %148 = sext i16 %147 to i32
  %149 = add nsw i32 %i.0, 3
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds %struct.search_site* %85, i64 %150
  %152 = getelementptr inbounds %struct.search_site* %151, i32 0, i32 0
  %153 = getelementptr inbounds %struct.MV* %152, i32 0, i32 1
  %154 = load i16* %153, align 2
  %155 = sext i16 %154 to i32
  %156 = add nsw i32 %148, %155
  %157 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %158 = load i32* %157, align 4
  %159 = icmp slt i32 %156, %158
  %160 = zext i1 %159 to i32
  %161 = and i32 %144, %160
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %163, label %247

; <label>:163                                     ; preds = %94
  br label %164

; <label>:164                                     ; preds = %244, %163
  %i.1 = phi i32 [ %i.0, %163 ], [ %i.2, %244 ]
  %j.0 = phi i32 [ 0, %163 ], [ %245, %244 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %163 ], [ %bestsad.2, %244 ]
  %best_site.1 = phi i32 [ %best_site.0, %163 ], [ %best_site.2, %244 ]
  %165 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14
  %166 = load i32* %165, align 4
  %167 = icmp slt i32 %j.0, %166
  br i1 %167, label %168, label %246

; <label>:168                                     ; preds = %164
  br label %169

; <label>:169                                     ; preds = %181, %168
  %t.0 = phi i32 [ 0, %168 ], [ %182, %181 ]
  %170 = icmp slt i32 %t.0, 4
  br i1 %170, label %171, label %183

; <label>:171                                     ; preds = %169
  %172 = add nsw i32 %i.1, %t.0
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds %struct.search_site* %85, i64 %173
  %175 = getelementptr inbounds %struct.search_site* %174, i32 0, i32 1
  %176 = load i32* %175, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i8* %best_address.0, i64 %177
  %179 = sext i32 %t.0 to i64
  %180 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 %179
  store i8* %178, i8** %180, align 8
  br label %181

; <label>:181                                     ; preds = %171
  %182 = add nsw i32 %t.0, 1
  br label %169

; <label>:183                                     ; preds = %169
  %184 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 8
  %185 = load void (i8*, i32, i8**, i32, i32*)** %184, align 8
  %186 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i32 0
  %187 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i32 0
  call void %185(i8* %7, i32 %9, i8** %186, i32 %13, i32* %187)
  br label %188

; <label>:188                                     ; preds = %240, %183
  %i.2 = phi i32 [ %i.1, %183 ], [ %242, %240 ]
  %bestsad.2 = phi i32 [ %bestsad.1, %183 ], [ %bestsad.4, %240 ]
  %best_site.2 = phi i32 [ %best_site.1, %183 ], [ %best_site.4, %240 ]
  %t.1 = phi i32 [ 0, %183 ], [ %241, %240 ]
  %189 = icmp slt i32 %t.1, 4
  br i1 %189, label %190, label %243

; <label>:190                                     ; preds = %188
  %191 = sext i32 %t.1 to i64
  %192 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %191
  %193 = load i32* %192, align 4
  %194 = icmp ult i32 %193, %bestsad.2
  br i1 %194, label %195, label %239

; <label>:195                                     ; preds = %190
  %196 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %197 = getelementptr inbounds %struct.MV* %196, i32 0, i32 0
  %198 = load i16* %197, align 2
  %199 = sext i16 %198 to i32
  %200 = sext i32 %i.2 to i64
  %201 = getelementptr inbounds %struct.search_site* %85, i64 %200
  %202 = getelementptr inbounds %struct.search_site* %201, i32 0, i32 0
  %203 = getelementptr inbounds %struct.MV* %202, i32 0, i32 0
  %204 = load i16* %203, align 2
  %205 = sext i16 %204 to i32
  %206 = add nsw i32 %199, %205
  %207 = trunc i32 %206 to i16
  %208 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %209 = getelementptr inbounds %struct.MV* %208, i32 0, i32 0
  store i16 %207, i16* %209, align 2
  %210 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %211 = getelementptr inbounds %struct.MV* %210, i32 0, i32 1
  %212 = load i16* %211, align 2
  %213 = sext i16 %212 to i32
  %214 = sext i32 %i.2 to i64
  %215 = getelementptr inbounds %struct.search_site* %85, i64 %214
  %216 = getelementptr inbounds %struct.search_site* %215, i32 0, i32 0
  %217 = getelementptr inbounds %struct.MV* %216, i32 0, i32 1
  %218 = load i16* %217, align 2
  %219 = sext i16 %218 to i32
  %220 = add nsw i32 %213, %219
  %221 = trunc i32 %220 to i16
  %222 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %223 = getelementptr inbounds %struct.MV* %222, i32 0, i32 1
  store i16 %221, i16* %223, align 2
  %224 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %225 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %224, i32 %sad_per_bit)
  %226 = sext i32 %t.1 to i64
  %227 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %226
  %228 = load i32* %227, align 4
  %229 = add i32 %228, %225
  store i32 %229, i32* %227, align 4
  %230 = sext i32 %t.1 to i64
  %231 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %230
  %232 = load i32* %231, align 4
  %233 = icmp ult i32 %232, %bestsad.2
  br i1 %233, label %234, label %238

; <label>:234                                     ; preds = %195
  %235 = sext i32 %t.1 to i64
  %236 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %235
  %237 = load i32* %236, align 4
  br label %238

; <label>:238                                     ; preds = %234, %195
  %bestsad.3 = phi i32 [ %237, %234 ], [ %bestsad.2, %195 ]
  %best_site.3 = phi i32 [ %i.2, %234 ], [ %best_site.2, %195 ]
  br label %239

; <label>:239                                     ; preds = %238, %190
  %bestsad.4 = phi i32 [ %bestsad.3, %238 ], [ %bestsad.2, %190 ]
  %best_site.4 = phi i32 [ %best_site.3, %238 ], [ %best_site.2, %190 ]
  br label %240

; <label>:240                                     ; preds = %239
  %241 = add nsw i32 %t.1, 1
  %242 = add nsw i32 %i.2, 1
  br label %188

; <label>:243                                     ; preds = %188
  br label %244

; <label>:244                                     ; preds = %243
  %245 = add nsw i32 %j.0, 4
  br label %164

; <label>:246                                     ; preds = %164
  br label %324

; <label>:247                                     ; preds = %94
  br label %248

; <label>:248                                     ; preds = %321, %247
  %i.3 = phi i32 [ %i.0, %247 ], [ %320, %321 ]
  %j.1 = phi i32 [ 0, %247 ], [ %322, %321 ]
  %bestsad.5 = phi i32 [ %bestsad.0, %247 ], [ %bestsad.8, %321 ]
  %best_site.5 = phi i32 [ %best_site.0, %247 ], [ %best_site.8, %321 ]
  %249 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14
  %250 = load i32* %249, align 4
  %251 = icmp slt i32 %j.1, %250
  br i1 %251, label %252, label %323

; <label>:252                                     ; preds = %248
  %253 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %254 = getelementptr inbounds %struct.MV* %253, i32 0, i32 0
  %255 = load i16* %254, align 2
  %256 = sext i16 %255 to i32
  %257 = sext i32 %i.3 to i64
  %258 = getelementptr inbounds %struct.search_site* %85, i64 %257
  %259 = getelementptr inbounds %struct.search_site* %258, i32 0, i32 0
  %260 = getelementptr inbounds %struct.MV* %259, i32 0, i32 0
  %261 = load i16* %260, align 2
  %262 = sext i16 %261 to i32
  %263 = add nsw i32 %256, %262
  %264 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %265 = getelementptr inbounds %struct.MV* %264, i32 0, i32 1
  %266 = load i16* %265, align 2
  %267 = sext i16 %266 to i32
  %268 = sext i32 %i.3 to i64
  %269 = getelementptr inbounds %struct.search_site* %85, i64 %268
  %270 = getelementptr inbounds %struct.search_site* %269, i32 0, i32 0
  %271 = getelementptr inbounds %struct.MV* %270, i32 0, i32 1
  %272 = load i16* %271, align 2
  %273 = sext i16 %272 to i32
  %274 = add nsw i32 %267, %273
  %275 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %276 = load i32* %275, align 4
  %277 = icmp sgt i32 %274, %276
  br i1 %277, label %278, label %319

; <label>:278                                     ; preds = %252
  %279 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %280 = load i32* %279, align 4
  %281 = icmp slt i32 %274, %280
  br i1 %281, label %282, label %319

; <label>:282                                     ; preds = %278
  %283 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %284 = load i32* %283, align 4
  %285 = icmp sgt i32 %263, %284
  br i1 %285, label %286, label %319

; <label>:286                                     ; preds = %282
  %287 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %288 = load i32* %287, align 4
  %289 = icmp slt i32 %263, %288
  br i1 %289, label %290, label %319

; <label>:290                                     ; preds = %286
  %291 = sext i32 %i.3 to i64
  %292 = getelementptr inbounds %struct.search_site* %85, i64 %291
  %293 = getelementptr inbounds %struct.search_site* %292, i32 0, i32 1
  %294 = load i32* %293, align 4
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds i8* %best_address.0, i64 %295
  %297 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %298 = load i32 (i8*, i32, i8*, i32, i32)** %297, align 8
  %299 = call i32 %298(i8* %7, i32 %9, i8* %296, i32 %13, i32 %bestsad.5)
  store i32 %299, i32* %thissad, align 4
  %300 = load i32* %thissad, align 4
  %301 = icmp ult i32 %300, %bestsad.5
  br i1 %301, label %302, label %318

; <label>:302                                     ; preds = %290
  %303 = trunc i32 %263 to i16
  %304 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %305 = getelementptr inbounds %struct.MV* %304, i32 0, i32 0
  store i16 %303, i16* %305, align 2
  %306 = trunc i32 %274 to i16
  %307 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %308 = getelementptr inbounds %struct.MV* %307, i32 0, i32 1
  store i16 %306, i16* %308, align 2
  %309 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %310 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %309, i32 %sad_per_bit)
  %311 = load i32* %thissad, align 4
  %312 = add i32 %311, %310
  store i32 %312, i32* %thissad, align 4
  %313 = load i32* %thissad, align 4
  %314 = icmp ult i32 %313, %bestsad.5
  br i1 %314, label %315, label %317

; <label>:315                                     ; preds = %302
  %316 = load i32* %thissad, align 4
  br label %317

; <label>:317                                     ; preds = %315, %302
  %bestsad.6 = phi i32 [ %316, %315 ], [ %bestsad.5, %302 ]
  %best_site.6 = phi i32 [ %i.3, %315 ], [ %best_site.5, %302 ]
  br label %318

; <label>:318                                     ; preds = %317, %290
  %bestsad.7 = phi i32 [ %bestsad.6, %317 ], [ %bestsad.5, %290 ]
  %best_site.7 = phi i32 [ %best_site.6, %317 ], [ %best_site.5, %290 ]
  br label %319

; <label>:319                                     ; preds = %318, %286, %282, %278, %252
  %bestsad.8 = phi i32 [ %bestsad.7, %318 ], [ %bestsad.5, %286 ], [ %bestsad.5, %282 ], [ %bestsad.5, %278 ], [ %bestsad.5, %252 ]
  %best_site.8 = phi i32 [ %best_site.7, %318 ], [ %best_site.5, %286 ], [ %best_site.5, %282 ], [ %best_site.5, %278 ], [ %best_site.5, %252 ]
  %320 = add nsw i32 %i.3, 1
  br label %321

; <label>:321                                     ; preds = %319
  %322 = add nsw i32 %j.1, 1
  br label %248

; <label>:323                                     ; preds = %248
  br label %324

; <label>:324                                     ; preds = %323, %246
  %i.4 = phi i32 [ %i.1, %246 ], [ %i.3, %323 ]
  %bestsad.9 = phi i32 [ %bestsad.1, %246 ], [ %bestsad.5, %323 ]
  %best_site.9 = phi i32 [ %best_site.1, %246 ], [ %best_site.5, %323 ]
  %325 = icmp ne i32 %best_site.9, %last_site.0
  br i1 %325, label %326, label %357

; <label>:326                                     ; preds = %324
  %327 = sext i32 %best_site.9 to i64
  %328 = getelementptr inbounds %struct.search_site* %85, i64 %327
  %329 = getelementptr inbounds %struct.search_site* %328, i32 0, i32 0
  %330 = getelementptr inbounds %struct.MV* %329, i32 0, i32 0
  %331 = load i16* %330, align 2
  %332 = sext i16 %331 to i32
  %333 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %334 = getelementptr inbounds %struct.MV* %333, i32 0, i32 0
  %335 = load i16* %334, align 2
  %336 = sext i16 %335 to i32
  %337 = add nsw i32 %336, %332
  %338 = trunc i32 %337 to i16
  store i16 %338, i16* %334, align 2
  %339 = sext i32 %best_site.9 to i64
  %340 = getelementptr inbounds %struct.search_site* %85, i64 %339
  %341 = getelementptr inbounds %struct.search_site* %340, i32 0, i32 0
  %342 = getelementptr inbounds %struct.MV* %341, i32 0, i32 1
  %343 = load i16* %342, align 2
  %344 = sext i16 %343 to i32
  %345 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %346 = getelementptr inbounds %struct.MV* %345, i32 0, i32 1
  %347 = load i16* %346, align 2
  %348 = sext i16 %347 to i32
  %349 = add nsw i32 %348, %344
  %350 = trunc i32 %349 to i16
  store i16 %350, i16* %346, align 2
  %351 = sext i32 %best_site.9 to i64
  %352 = getelementptr inbounds %struct.search_site* %85, i64 %351
  %353 = getelementptr inbounds %struct.search_site* %352, i32 0, i32 1
  %354 = load i32* %353, align 4
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds i8* %best_address.0, i64 %355
  br label %363

; <label>:357                                     ; preds = %324
  %358 = icmp eq i8* %best_address.0, %72
  br i1 %358, label %359, label %362

; <label>:359                                     ; preds = %357
  %360 = load i32* %num00, align 4
  %361 = add nsw i32 %360, 1
  store i32 %361, i32* %num00, align 4
  br label %362

; <label>:362                                     ; preds = %359, %357
  br label %363

; <label>:363                                     ; preds = %362, %326
  %best_address.1 = phi i8* [ %356, %326 ], [ %best_address.0, %362 ]
  %last_site.1 = phi i32 [ %best_site.9, %326 ], [ %last_site.0, %362 ]
  br label %364

; <label>:364                                     ; preds = %363
  %365 = add nsw i32 %step.0, 1
  br label %92

; <label>:366                                     ; preds = %92
  %367 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %368 = getelementptr inbounds %struct.MV* %367, i32 0, i32 0
  %369 = load i16* %368, align 2
  %370 = sext i16 %369 to i32
  %371 = mul nsw i32 %370, 8
  %372 = trunc i32 %371 to i16
  %373 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %374 = getelementptr inbounds %struct.MV* %373, i32 0, i32 0
  store i16 %372, i16* %374, align 2
  %375 = bitcast %union.int_mv* %best_mv to %struct.MV*
  %376 = getelementptr inbounds %struct.MV* %375, i32 0, i32 1
  %377 = load i16* %376, align 2
  %378 = sext i16 %377 to i32
  %379 = mul nsw i32 %378, 8
  %380 = trunc i32 %379 to i16
  %381 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %382 = getelementptr inbounds %struct.MV* %381, i32 0, i32 1
  store i16 %380, i16* %382, align 2
  %383 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1
  %384 = load i32 (i8*, i32, i8*, i32, i32*)** %383, align 8
  %385 = call i32 %384(i8* %7, i32 %9, i8* %best_address.0, i32 %13, i32* %thissad)
  %386 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15
  %387 = load i32* %386, align 4
  %388 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %387)
  %389 = add i32 %385, %388
  ret i32 %389
}

; Function Attrs: nounwind uwtable
define i32 @vp8_full_search_sad_c(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %sad_per_bit, i32 %distance, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9
  %2 = load i8*** %1, align 8
  %3 = load i8** %2, align 8
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8* %3, i64 %6
  %8 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %9 = load i32* %8, align 4
  %10 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %11 = getelementptr inbounds %struct.macroblockd* %10, i32 0, i32 11
  %12 = getelementptr inbounds %struct.yv12_buffer_config* %11, i32 0, i32 4
  %13 = load i32* %12, align 4
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %15 = getelementptr inbounds %struct.macroblockd* %14, i32 0, i32 11
  %16 = getelementptr inbounds %struct.yv12_buffer_config* %15, i32 0, i32 13
  %17 = load i8** %16, align 8
  %18 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 6
  %19 = bitcast %union.b_mode_info* %18 to %union.int_mv*
  %20 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %21 = getelementptr inbounds %struct.MV* %20, i32 0, i32 0
  %22 = load i16* %21, align 2
  %23 = sext i16 %22 to i32
  %24 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %25 = getelementptr inbounds %struct.MV* %24, i32 0, i32 1
  %26 = load i16* %25, align 2
  %27 = sext i16 %26 to i32
  %28 = sub nsw i32 %23, %distance
  %29 = add nsw i32 %23, %distance
  %30 = sub nsw i32 %27, %distance
  %31 = add nsw i32 %27, %distance
  %32 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %33 = getelementptr inbounds [2 x i32*]* %32, i32 0, i64 0
  %34 = load i32** %33, align 8
  %35 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %34, i32** %35, align 8
  %36 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %37 = getelementptr inbounds [2 x i32*]* %36, i32 0, i64 1
  %38 = load i32** %37, align 8
  %39 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %38, i32** %39, align 8
  %40 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %41 = getelementptr inbounds %struct.MV* %40, i32 0, i32 0
  %42 = load i16* %41, align 2
  %43 = sext i16 %42 to i32
  %44 = ashr i32 %43, 3
  %45 = trunc i32 %44 to i16
  %46 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %47 = getelementptr inbounds %struct.MV* %46, i32 0, i32 0
  store i16 %45, i16* %47, align 2
  %48 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1
  %50 = load i16* %49, align 2
  %51 = sext i16 %50 to i32
  %52 = ashr i32 %51, 3
  %53 = trunc i32 %52 to i16
  %54 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %55 = getelementptr inbounds %struct.MV* %54, i32 0, i32 1
  store i16 %53, i16* %55, align 2
  %56 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4
  %57 = load i32* %56, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8* %17, i64 %58
  %60 = mul nsw i32 %23, %13
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8* %59, i64 %61
  %63 = sext i32 %27 to i64
  %64 = getelementptr inbounds i8* %62, i64 %63
  %65 = trunc i32 %23 to i16
  %66 = bitcast %union.int_mv* %19 to %struct.MV*
  %67 = getelementptr inbounds %struct.MV* %66, i32 0, i32 0
  store i16 %65, i16* %67, align 2
  %68 = trunc i32 %27 to i16
  %69 = bitcast %union.int_mv* %19 to %struct.MV*
  %70 = getelementptr inbounds %struct.MV* %69, i32 0, i32 1
  store i16 %68, i16* %70, align 2
  %71 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %72 = load i32 (i8*, i32, i8*, i32, i32)** %71, align 8
  %73 = call i32 %72(i8* %7, i32 %9, i8* %64, i32 %13, i32 -1)
  %74 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %75 = call i32 @mvsad_err_cost(%union.int_mv* %19, %union.int_mv* %fcenter_mv, i32** %74, i32 %sad_per_bit)
  %76 = add i32 %73, %75
  %77 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %78 = load i32* %77, align 4
  %79 = icmp slt i32 %30, %78
  br i1 %79, label %80, label %83

; <label>:80                                      ; preds = %0
  %81 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %82 = load i32* %81, align 4
  br label %83

; <label>:83                                      ; preds = %80, %0
  %col_min.0 = phi i32 [ %82, %80 ], [ %30, %0 ]
  %84 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %85 = load i32* %84, align 4
  %86 = icmp sgt i32 %31, %85
  br i1 %86, label %87, label %90

; <label>:87                                      ; preds = %83
  %88 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %89 = load i32* %88, align 4
  br label %90

; <label>:90                                      ; preds = %87, %83
  %col_max.0 = phi i32 [ %89, %87 ], [ %31, %83 ]
  %91 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %92 = load i32* %91, align 4
  %93 = icmp slt i32 %28, %92
  br i1 %93, label %94, label %97

; <label>:94                                      ; preds = %90
  %95 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %96 = load i32* %95, align 4
  br label %97

; <label>:97                                      ; preds = %94, %90
  %row_min.0 = phi i32 [ %96, %94 ], [ %28, %90 ]
  %98 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %99 = load i32* %98, align 4
  %100 = icmp sgt i32 %29, %99
  br i1 %100, label %101, label %104

; <label>:101                                     ; preds = %97
  %102 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %103 = load i32* %102, align 4
  br label %104

; <label>:104                                     ; preds = %101, %97
  %row_max.0 = phi i32 [ %103, %101 ], [ %29, %97 ]
  br label %105

; <label>:105                                     ; preds = %144, %104
  %bestaddress.0 = phi i8* [ %64, %104 ], [ %bestaddress.1, %144 ]
  %bestsad.0 = phi i32 [ %76, %104 ], [ %bestsad.1, %144 ]
  %r.0 = phi i32 [ %row_min.0, %104 ], [ %145, %144 ]
  %106 = icmp slt i32 %r.0, %row_max.0
  br i1 %106, label %107, label %146

; <label>:107                                     ; preds = %105
  %108 = trunc i32 %r.0 to i16
  %109 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %110 = getelementptr inbounds %struct.MV* %109, i32 0, i32 0
  store i16 %108, i16* %110, align 2
  %111 = mul nsw i32 %r.0, %13
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i8* %59, i64 %112
  %114 = sext i32 %col_min.0 to i64
  %115 = getelementptr inbounds i8* %113, i64 %114
  br label %116

; <label>:116                                     ; preds = %141, %107
  %bestaddress.1 = phi i8* [ %bestaddress.0, %107 ], [ %bestaddress.2, %141 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %107 ], [ %bestsad.2, %141 ]
  %c.0 = phi i32 [ %col_min.0, %107 ], [ %142, %141 ]
  %check_here.0 = phi i8* [ %115, %107 ], [ %140, %141 ]
  %117 = icmp slt i32 %c.0, %col_max.0
  br i1 %117, label %118, label %143

; <label>:118                                     ; preds = %116
  %119 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %120 = load i32 (i8*, i32, i8*, i32, i32)** %119, align 8
  %121 = call i32 %120(i8* %7, i32 %9, i8* %check_here.0, i32 %13, i32 %bestsad.1)
  store i32 %121, i32* %thissad, align 4
  %122 = trunc i32 %c.0 to i16
  %123 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %124 = getelementptr inbounds %struct.MV* %123, i32 0, i32 1
  store i16 %122, i16* %124, align 2
  %125 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %126 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %125, i32 %sad_per_bit)
  %127 = load i32* %thissad, align 4
  %128 = add i32 %127, %126
  store i32 %128, i32* %thissad, align 4
  %129 = load i32* %thissad, align 4
  %130 = icmp ult i32 %129, %bestsad.1
  br i1 %130, label %131, label %139

; <label>:131                                     ; preds = %118
  %132 = load i32* %thissad, align 4
  %133 = trunc i32 %r.0 to i16
  %134 = bitcast %union.int_mv* %19 to %struct.MV*
  %135 = getelementptr inbounds %struct.MV* %134, i32 0, i32 0
  store i16 %133, i16* %135, align 2
  %136 = trunc i32 %c.0 to i16
  %137 = bitcast %union.int_mv* %19 to %struct.MV*
  %138 = getelementptr inbounds %struct.MV* %137, i32 0, i32 1
  store i16 %136, i16* %138, align 2
  br label %139

; <label>:139                                     ; preds = %131, %118
  %bestaddress.2 = phi i8* [ %check_here.0, %131 ], [ %bestaddress.1, %118 ]
  %bestsad.2 = phi i32 [ %132, %131 ], [ %bestsad.1, %118 ]
  %140 = getelementptr inbounds i8* %check_here.0, i32 1
  br label %141

; <label>:141                                     ; preds = %139
  %142 = add nsw i32 %c.0, 1
  br label %116

; <label>:143                                     ; preds = %116
  br label %144

; <label>:144                                     ; preds = %143
  %145 = add nsw i32 %r.0, 1
  br label %105

; <label>:146                                     ; preds = %105
  %147 = bitcast %union.int_mv* %19 to %struct.MV*
  %148 = getelementptr inbounds %struct.MV* %147, i32 0, i32 0
  %149 = load i16* %148, align 2
  %150 = sext i16 %149 to i32
  %151 = shl i32 %150, 3
  %152 = trunc i32 %151 to i16
  %153 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %154 = getelementptr inbounds %struct.MV* %153, i32 0, i32 0
  store i16 %152, i16* %154, align 2
  %155 = bitcast %union.int_mv* %19 to %struct.MV*
  %156 = getelementptr inbounds %struct.MV* %155, i32 0, i32 1
  %157 = load i16* %156, align 2
  %158 = sext i16 %157 to i32
  %159 = shl i32 %158, 3
  %160 = trunc i32 %159 to i16
  %161 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %162 = getelementptr inbounds %struct.MV* %161, i32 0, i32 1
  store i16 %160, i16* %162, align 2
  %163 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1
  %164 = load i32 (i8*, i32, i8*, i32, i32*)** %163, align 8
  %165 = call i32 %164(i8* %7, i32 %9, i8* %bestaddress.0, i32 %13, i32* %thissad)
  %166 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15
  %167 = load i32* %166, align 4
  %168 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %167)
  %169 = add i32 %165, %168
  ret i32 %169
}

; Function Attrs: nounwind uwtable
define i32 @vp8_full_search_sadx3(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %sad_per_bit, i32 %distance, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %sad_array = alloca [3 x i32], align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9
  %2 = load i8*** %1, align 8
  %3 = load i8** %2, align 8
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8* %3, i64 %6
  %8 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %9 = load i32* %8, align 4
  %10 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %11 = getelementptr inbounds %struct.macroblockd* %10, i32 0, i32 11
  %12 = getelementptr inbounds %struct.yv12_buffer_config* %11, i32 0, i32 4
  %13 = load i32* %12, align 4
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %15 = getelementptr inbounds %struct.macroblockd* %14, i32 0, i32 11
  %16 = getelementptr inbounds %struct.yv12_buffer_config* %15, i32 0, i32 13
  %17 = load i8** %16, align 8
  %18 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 6
  %19 = bitcast %union.b_mode_info* %18 to %union.int_mv*
  %20 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %21 = getelementptr inbounds %struct.MV* %20, i32 0, i32 0
  %22 = load i16* %21, align 2
  %23 = sext i16 %22 to i32
  %24 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %25 = getelementptr inbounds %struct.MV* %24, i32 0, i32 1
  %26 = load i16* %25, align 2
  %27 = sext i16 %26 to i32
  %28 = sub nsw i32 %23, %distance
  %29 = add nsw i32 %23, %distance
  %30 = sub nsw i32 %27, %distance
  %31 = add nsw i32 %27, %distance
  %32 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %33 = getelementptr inbounds [2 x i32*]* %32, i32 0, i64 0
  %34 = load i32** %33, align 8
  %35 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %34, i32** %35, align 8
  %36 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %37 = getelementptr inbounds [2 x i32*]* %36, i32 0, i64 1
  %38 = load i32** %37, align 8
  %39 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %38, i32** %39, align 8
  %40 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %41 = getelementptr inbounds %struct.MV* %40, i32 0, i32 0
  %42 = load i16* %41, align 2
  %43 = sext i16 %42 to i32
  %44 = ashr i32 %43, 3
  %45 = trunc i32 %44 to i16
  %46 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %47 = getelementptr inbounds %struct.MV* %46, i32 0, i32 0
  store i16 %45, i16* %47, align 2
  %48 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1
  %50 = load i16* %49, align 2
  %51 = sext i16 %50 to i32
  %52 = ashr i32 %51, 3
  %53 = trunc i32 %52 to i16
  %54 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %55 = getelementptr inbounds %struct.MV* %54, i32 0, i32 1
  store i16 %53, i16* %55, align 2
  %56 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4
  %57 = load i32* %56, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8* %17, i64 %58
  %60 = mul nsw i32 %23, %13
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8* %59, i64 %61
  %63 = sext i32 %27 to i64
  %64 = getelementptr inbounds i8* %62, i64 %63
  %65 = trunc i32 %23 to i16
  %66 = bitcast %union.int_mv* %19 to %struct.MV*
  %67 = getelementptr inbounds %struct.MV* %66, i32 0, i32 0
  store i16 %65, i16* %67, align 2
  %68 = trunc i32 %27 to i16
  %69 = bitcast %union.int_mv* %19 to %struct.MV*
  %70 = getelementptr inbounds %struct.MV* %69, i32 0, i32 1
  store i16 %68, i16* %70, align 2
  %71 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %72 = load i32 (i8*, i32, i8*, i32, i32)** %71, align 8
  %73 = call i32 %72(i8* %7, i32 %9, i8* %64, i32 %13, i32 -1)
  %74 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %75 = call i32 @mvsad_err_cost(%union.int_mv* %19, %union.int_mv* %fcenter_mv, i32** %74, i32 %sad_per_bit)
  %76 = add i32 %73, %75
  %77 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %78 = load i32* %77, align 4
  %79 = icmp slt i32 %30, %78
  br i1 %79, label %80, label %83

; <label>:80                                      ; preds = %0
  %81 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %82 = load i32* %81, align 4
  br label %83

; <label>:83                                      ; preds = %80, %0
  %col_min.0 = phi i32 [ %82, %80 ], [ %30, %0 ]
  %84 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %85 = load i32* %84, align 4
  %86 = icmp sgt i32 %31, %85
  br i1 %86, label %87, label %90

; <label>:87                                      ; preds = %83
  %88 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %89 = load i32* %88, align 4
  br label %90

; <label>:90                                      ; preds = %87, %83
  %col_max.0 = phi i32 [ %89, %87 ], [ %31, %83 ]
  %91 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %92 = load i32* %91, align 4
  %93 = icmp slt i32 %28, %92
  br i1 %93, label %94, label %97

; <label>:94                                      ; preds = %90
  %95 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %96 = load i32* %95, align 4
  br label %97

; <label>:97                                      ; preds = %94, %90
  %row_min.0 = phi i32 [ %96, %94 ], [ %28, %90 ]
  %98 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %99 = load i32* %98, align 4
  %100 = icmp sgt i32 %29, %99
  br i1 %100, label %101, label %104

; <label>:101                                     ; preds = %97
  %102 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %103 = load i32* %102, align 4
  br label %104

; <label>:104                                     ; preds = %101, %97
  %row_max.0 = phi i32 [ %103, %101 ], [ %29, %97 ]
  br label %105

; <label>:105                                     ; preds = %188, %104
  %bestaddress.0 = phi i8* [ %64, %104 ], [ %bestaddress.5, %188 ]
  %bestsad.0 = phi i32 [ %76, %104 ], [ %bestsad.5, %188 ]
  %r.0 = phi i32 [ %row_min.0, %104 ], [ %189, %188 ]
  %106 = icmp slt i32 %r.0, %row_max.0
  br i1 %106, label %107, label %190

; <label>:107                                     ; preds = %105
  %108 = trunc i32 %r.0 to i16
  %109 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %110 = getelementptr inbounds %struct.MV* %109, i32 0, i32 0
  store i16 %108, i16* %110, align 2
  %111 = mul nsw i32 %r.0, %13
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i8* %59, i64 %112
  %114 = sext i32 %col_min.0 to i64
  %115 = getelementptr inbounds i8* %113, i64 %114
  br label %116

; <label>:116                                     ; preds = %155, %107
  %bestaddress.1 = phi i8* [ %bestaddress.0, %107 ], [ %bestaddress.2, %155 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %107 ], [ %bestsad.2, %155 ]
  %c.0 = phi i32 [ %col_min.0, %107 ], [ %c.1, %155 ]
  %check_here.0 = phi i8* [ %115, %107 ], [ %check_here.1, %155 ]
  %117 = add nsw i32 %c.0, 2
  %118 = icmp slt i32 %117, %col_max.0
  br i1 %118, label %119, label %156

; <label>:119                                     ; preds = %116
  %120 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 6
  %121 = load void (i8*, i32, i8*, i32, i32*)** %120, align 8
  %122 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i32 0
  call void %121(i8* %7, i32 %9, i8* %check_here.0, i32 %13, i32* %122)
  br label %123

; <label>:123                                     ; preds = %153, %119
  %bestaddress.2 = phi i8* [ %bestaddress.1, %119 ], [ %bestaddress.4, %153 ]
  %bestsad.2 = phi i32 [ %bestsad.1, %119 ], [ %bestsad.4, %153 ]
  %c.1 = phi i32 [ %c.0, %119 ], [ %152, %153 ]
  %check_here.1 = phi i8* [ %check_here.0, %119 ], [ %151, %153 ]
  %i.0 = phi i32 [ 0, %119 ], [ %154, %153 ]
  %124 = icmp slt i32 %i.0, 3
  br i1 %124, label %125, label %155

; <label>:125                                     ; preds = %123
  %126 = sext i32 %i.0 to i64
  %127 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i64 %126
  %128 = load i32* %127, align 4
  store i32 %128, i32* %thissad, align 4
  %129 = load i32* %thissad, align 4
  %130 = icmp ult i32 %129, %bestsad.2
  br i1 %130, label %131, label %150

; <label>:131                                     ; preds = %125
  %132 = trunc i32 %c.1 to i16
  %133 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %134 = getelementptr inbounds %struct.MV* %133, i32 0, i32 1
  store i16 %132, i16* %134, align 2
  %135 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %136 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %135, i32 %sad_per_bit)
  %137 = load i32* %thissad, align 4
  %138 = add i32 %137, %136
  store i32 %138, i32* %thissad, align 4
  %139 = load i32* %thissad, align 4
  %140 = icmp ult i32 %139, %bestsad.2
  br i1 %140, label %141, label %149

; <label>:141                                     ; preds = %131
  %142 = load i32* %thissad, align 4
  %143 = trunc i32 %r.0 to i16
  %144 = bitcast %union.int_mv* %19 to %struct.MV*
  %145 = getelementptr inbounds %struct.MV* %144, i32 0, i32 0
  store i16 %143, i16* %145, align 2
  %146 = trunc i32 %c.1 to i16
  %147 = bitcast %union.int_mv* %19 to %struct.MV*
  %148 = getelementptr inbounds %struct.MV* %147, i32 0, i32 1
  store i16 %146, i16* %148, align 2
  br label %149

; <label>:149                                     ; preds = %141, %131
  %bestaddress.3 = phi i8* [ %check_here.1, %141 ], [ %bestaddress.2, %131 ]
  %bestsad.3 = phi i32 [ %142, %141 ], [ %bestsad.2, %131 ]
  br label %150

; <label>:150                                     ; preds = %149, %125
  %bestaddress.4 = phi i8* [ %bestaddress.3, %149 ], [ %bestaddress.2, %125 ]
  %bestsad.4 = phi i32 [ %bestsad.3, %149 ], [ %bestsad.2, %125 ]
  %151 = getelementptr inbounds i8* %check_here.1, i32 1
  %152 = add nsw i32 %c.1, 1
  br label %153

; <label>:153                                     ; preds = %150
  %154 = add nsw i32 %i.0, 1
  br label %123

; <label>:155                                     ; preds = %123
  br label %116

; <label>:156                                     ; preds = %116
  br label %157

; <label>:157                                     ; preds = %184, %156
  %bestaddress.5 = phi i8* [ %bestaddress.1, %156 ], [ %bestaddress.7, %184 ]
  %bestsad.5 = phi i32 [ %bestsad.1, %156 ], [ %bestsad.7, %184 ]
  %c.2 = phi i32 [ %c.0, %156 ], [ %186, %184 ]
  %check_here.2 = phi i8* [ %check_here.0, %156 ], [ %185, %184 ]
  %158 = icmp slt i32 %c.2, %col_max.0
  br i1 %158, label %159, label %187

; <label>:159                                     ; preds = %157
  %160 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %161 = load i32 (i8*, i32, i8*, i32, i32)** %160, align 8
  %162 = call i32 %161(i8* %7, i32 %9, i8* %check_here.2, i32 %13, i32 %bestsad.5)
  store i32 %162, i32* %thissad, align 4
  %163 = load i32* %thissad, align 4
  %164 = icmp ult i32 %163, %bestsad.5
  br i1 %164, label %165, label %184

; <label>:165                                     ; preds = %159
  %166 = trunc i32 %c.2 to i16
  %167 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %168 = getelementptr inbounds %struct.MV* %167, i32 0, i32 1
  store i16 %166, i16* %168, align 2
  %169 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %170 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %169, i32 %sad_per_bit)
  %171 = load i32* %thissad, align 4
  %172 = add i32 %171, %170
  store i32 %172, i32* %thissad, align 4
  %173 = load i32* %thissad, align 4
  %174 = icmp ult i32 %173, %bestsad.5
  br i1 %174, label %175, label %183

; <label>:175                                     ; preds = %165
  %176 = load i32* %thissad, align 4
  %177 = trunc i32 %r.0 to i16
  %178 = bitcast %union.int_mv* %19 to %struct.MV*
  %179 = getelementptr inbounds %struct.MV* %178, i32 0, i32 0
  store i16 %177, i16* %179, align 2
  %180 = trunc i32 %c.2 to i16
  %181 = bitcast %union.int_mv* %19 to %struct.MV*
  %182 = getelementptr inbounds %struct.MV* %181, i32 0, i32 1
  store i16 %180, i16* %182, align 2
  br label %183

; <label>:183                                     ; preds = %175, %165
  %bestaddress.6 = phi i8* [ %check_here.2, %175 ], [ %bestaddress.5, %165 ]
  %bestsad.6 = phi i32 [ %176, %175 ], [ %bestsad.5, %165 ]
  br label %184

; <label>:184                                     ; preds = %183, %159
  %bestaddress.7 = phi i8* [ %bestaddress.6, %183 ], [ %bestaddress.5, %159 ]
  %bestsad.7 = phi i32 [ %bestsad.6, %183 ], [ %bestsad.5, %159 ]
  %185 = getelementptr inbounds i8* %check_here.2, i32 1
  %186 = add nsw i32 %c.2, 1
  br label %157

; <label>:187                                     ; preds = %157
  br label %188

; <label>:188                                     ; preds = %187
  %189 = add nsw i32 %r.0, 1
  br label %105

; <label>:190                                     ; preds = %105
  %191 = bitcast %union.int_mv* %19 to %struct.MV*
  %192 = getelementptr inbounds %struct.MV* %191, i32 0, i32 0
  %193 = load i16* %192, align 2
  %194 = sext i16 %193 to i32
  %195 = shl i32 %194, 3
  %196 = trunc i32 %195 to i16
  %197 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %198 = getelementptr inbounds %struct.MV* %197, i32 0, i32 0
  store i16 %196, i16* %198, align 2
  %199 = bitcast %union.int_mv* %19 to %struct.MV*
  %200 = getelementptr inbounds %struct.MV* %199, i32 0, i32 1
  %201 = load i16* %200, align 2
  %202 = sext i16 %201 to i32
  %203 = shl i32 %202, 3
  %204 = trunc i32 %203 to i16
  %205 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %206 = getelementptr inbounds %struct.MV* %205, i32 0, i32 1
  store i16 %204, i16* %206, align 2
  %207 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1
  %208 = load i32 (i8*, i32, i8*, i32, i32*)** %207, align 8
  %209 = call i32 %208(i8* %7, i32 %9, i8* %bestaddress.0, i32 %13, i32* %thissad)
  %210 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15
  %211 = load i32* %210, align 4
  %212 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %211)
  %213 = add i32 %209, %212
  ret i32 %213
}

; Function Attrs: nounwind uwtable
define i32 @vp8_full_search_sadx8(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %sad_per_bit, i32 %distance, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %sad_array8_ = alloca [17 x i16], align 16
  %sad_array = alloca [3 x i32], align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9
  %2 = load i8*** %1, align 8
  %3 = load i8** %2, align 8
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8* %3, i64 %6
  %8 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %9 = load i32* %8, align 4
  %10 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %11 = getelementptr inbounds %struct.macroblockd* %10, i32 0, i32 11
  %12 = getelementptr inbounds %struct.yv12_buffer_config* %11, i32 0, i32 4
  %13 = load i32* %12, align 4
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %15 = getelementptr inbounds %struct.macroblockd* %14, i32 0, i32 11
  %16 = getelementptr inbounds %struct.yv12_buffer_config* %15, i32 0, i32 13
  %17 = load i8** %16, align 8
  %18 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 6
  %19 = bitcast %union.b_mode_info* %18 to %union.int_mv*
  %20 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %21 = getelementptr inbounds %struct.MV* %20, i32 0, i32 0
  %22 = load i16* %21, align 2
  %23 = sext i16 %22 to i32
  %24 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %25 = getelementptr inbounds %struct.MV* %24, i32 0, i32 1
  %26 = load i16* %25, align 2
  %27 = sext i16 %26 to i32
  %28 = sub nsw i32 %23, %distance
  %29 = add nsw i32 %23, %distance
  %30 = sub nsw i32 %27, %distance
  %31 = add nsw i32 %27, %distance
  %32 = getelementptr inbounds [17 x i16]* %sad_array8_, i32 0, i32 0
  %33 = ptrtoint i16* %32 to i64
  %34 = add nsw i64 %33, 16
  %35 = sub nsw i64 %34, 1
  %36 = and i64 %35, -16
  %37 = inttoptr i64 %36 to i16*
  %38 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %39 = getelementptr inbounds [2 x i32*]* %38, i32 0, i64 0
  %40 = load i32** %39, align 8
  %41 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %40, i32** %41, align 8
  %42 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %43 = getelementptr inbounds [2 x i32*]* %42, i32 0, i64 1
  %44 = load i32** %43, align 8
  %45 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %44, i32** %45, align 8
  %46 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %47 = getelementptr inbounds %struct.MV* %46, i32 0, i32 0
  %48 = load i16* %47, align 2
  %49 = sext i16 %48 to i32
  %50 = ashr i32 %49, 3
  %51 = trunc i32 %50 to i16
  %52 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %53 = getelementptr inbounds %struct.MV* %52, i32 0, i32 0
  store i16 %51, i16* %53, align 2
  %54 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %55 = getelementptr inbounds %struct.MV* %54, i32 0, i32 1
  %56 = load i16* %55, align 2
  %57 = sext i16 %56 to i32
  %58 = ashr i32 %57, 3
  %59 = trunc i32 %58 to i16
  %60 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %61 = getelementptr inbounds %struct.MV* %60, i32 0, i32 1
  store i16 %59, i16* %61, align 2
  %62 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4
  %63 = load i32* %62, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8* %17, i64 %64
  %66 = mul nsw i32 %23, %13
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8* %65, i64 %67
  %69 = sext i32 %27 to i64
  %70 = getelementptr inbounds i8* %68, i64 %69
  %71 = trunc i32 %23 to i16
  %72 = bitcast %union.int_mv* %19 to %struct.MV*
  %73 = getelementptr inbounds %struct.MV* %72, i32 0, i32 0
  store i16 %71, i16* %73, align 2
  %74 = trunc i32 %27 to i16
  %75 = bitcast %union.int_mv* %19 to %struct.MV*
  %76 = getelementptr inbounds %struct.MV* %75, i32 0, i32 1
  store i16 %74, i16* %76, align 2
  %77 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %78 = load i32 (i8*, i32, i8*, i32, i32)** %77, align 8
  %79 = call i32 %78(i8* %7, i32 %9, i8* %70, i32 %13, i32 -1)
  %80 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %81 = call i32 @mvsad_err_cost(%union.int_mv* %19, %union.int_mv* %fcenter_mv, i32** %80, i32 %sad_per_bit)
  %82 = add i32 %79, %81
  %83 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %84 = load i32* %83, align 4
  %85 = icmp slt i32 %30, %84
  br i1 %85, label %86, label %89

; <label>:86                                      ; preds = %0
  %87 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %88 = load i32* %87, align 4
  br label %89

; <label>:89                                      ; preds = %86, %0
  %col_min.0 = phi i32 [ %88, %86 ], [ %30, %0 ]
  %90 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %91 = load i32* %90, align 4
  %92 = icmp sgt i32 %31, %91
  br i1 %92, label %93, label %96

; <label>:93                                      ; preds = %89
  %94 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %95 = load i32* %94, align 4
  br label %96

; <label>:96                                      ; preds = %93, %89
  %col_max.0 = phi i32 [ %95, %93 ], [ %31, %89 ]
  %97 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %98 = load i32* %97, align 4
  %99 = icmp slt i32 %28, %98
  br i1 %99, label %100, label %103

; <label>:100                                     ; preds = %96
  %101 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %102 = load i32* %101, align 4
  br label %103

; <label>:103                                     ; preds = %100, %96
  %row_min.0 = phi i32 [ %102, %100 ], [ %28, %96 ]
  %104 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %105 = load i32* %104, align 4
  %106 = icmp sgt i32 %29, %105
  br i1 %106, label %107, label %110

; <label>:107                                     ; preds = %103
  %108 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %109 = load i32* %108, align 4
  br label %110

; <label>:110                                     ; preds = %107, %103
  %row_max.0 = phi i32 [ %109, %107 ], [ %29, %103 ]
  br label %111

; <label>:111                                     ; preds = %235, %110
  %bestaddress.0 = phi i8* [ %70, %110 ], [ %bestaddress.9, %235 ]
  %bestsad.0 = phi i32 [ %82, %110 ], [ %bestsad.9, %235 ]
  %r.0 = phi i32 [ %row_min.0, %110 ], [ %236, %235 ]
  %112 = icmp slt i32 %r.0, %row_max.0
  br i1 %112, label %113, label %237

; <label>:113                                     ; preds = %111
  %114 = trunc i32 %r.0 to i16
  %115 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %116 = getelementptr inbounds %struct.MV* %115, i32 0, i32 0
  store i16 %114, i16* %116, align 2
  %117 = mul nsw i32 %r.0, %13
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i8* %65, i64 %118
  %120 = sext i32 %col_min.0 to i64
  %121 = getelementptr inbounds i8* %119, i64 %120
  br label %122

; <label>:122                                     ; preds = %161, %113
  %bestaddress.1 = phi i8* [ %bestaddress.0, %113 ], [ %bestaddress.2, %161 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %113 ], [ %bestsad.2, %161 ]
  %c.0 = phi i32 [ %col_min.0, %113 ], [ %c.1, %161 ]
  %check_here.0 = phi i8* [ %121, %113 ], [ %check_here.1, %161 ]
  %123 = add nsw i32 %c.0, 7
  %124 = icmp slt i32 %123, %col_max.0
  br i1 %124, label %125, label %162

; <label>:125                                     ; preds = %122
  %126 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 7
  %127 = load void (i8*, i32, i8*, i32, i16*)** %126, align 8
  call void %127(i8* %7, i32 %9, i8* %check_here.0, i32 %13, i16* %37)
  br label %128

; <label>:128                                     ; preds = %159, %125
  %bestaddress.2 = phi i8* [ %bestaddress.1, %125 ], [ %bestaddress.4, %159 ]
  %bestsad.2 = phi i32 [ %bestsad.1, %125 ], [ %bestsad.4, %159 ]
  %c.1 = phi i32 [ %c.0, %125 ], [ %158, %159 ]
  %check_here.1 = phi i8* [ %check_here.0, %125 ], [ %157, %159 ]
  %i.0 = phi i32 [ 0, %125 ], [ %160, %159 ]
  %129 = icmp slt i32 %i.0, 8
  br i1 %129, label %130, label %161

; <label>:130                                     ; preds = %128
  %131 = sext i32 %i.0 to i64
  %132 = getelementptr inbounds i16* %37, i64 %131
  %133 = load i16* %132, align 2
  %134 = zext i16 %133 to i32
  store i32 %134, i32* %thissad, align 4
  %135 = load i32* %thissad, align 4
  %136 = icmp ult i32 %135, %bestsad.2
  br i1 %136, label %137, label %156

; <label>:137                                     ; preds = %130
  %138 = trunc i32 %c.1 to i16
  %139 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %140 = getelementptr inbounds %struct.MV* %139, i32 0, i32 1
  store i16 %138, i16* %140, align 2
  %141 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %142 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %141, i32 %sad_per_bit)
  %143 = load i32* %thissad, align 4
  %144 = add i32 %143, %142
  store i32 %144, i32* %thissad, align 4
  %145 = load i32* %thissad, align 4
  %146 = icmp ult i32 %145, %bestsad.2
  br i1 %146, label %147, label %155

; <label>:147                                     ; preds = %137
  %148 = load i32* %thissad, align 4
  %149 = trunc i32 %r.0 to i16
  %150 = bitcast %union.int_mv* %19 to %struct.MV*
  %151 = getelementptr inbounds %struct.MV* %150, i32 0, i32 0
  store i16 %149, i16* %151, align 2
  %152 = trunc i32 %c.1 to i16
  %153 = bitcast %union.int_mv* %19 to %struct.MV*
  %154 = getelementptr inbounds %struct.MV* %153, i32 0, i32 1
  store i16 %152, i16* %154, align 2
  br label %155

; <label>:155                                     ; preds = %147, %137
  %bestaddress.3 = phi i8* [ %check_here.1, %147 ], [ %bestaddress.2, %137 ]
  %bestsad.3 = phi i32 [ %148, %147 ], [ %bestsad.2, %137 ]
  br label %156

; <label>:156                                     ; preds = %155, %130
  %bestaddress.4 = phi i8* [ %bestaddress.3, %155 ], [ %bestaddress.2, %130 ]
  %bestsad.4 = phi i32 [ %bestsad.3, %155 ], [ %bestsad.2, %130 ]
  %157 = getelementptr inbounds i8* %check_here.1, i32 1
  %158 = add nsw i32 %c.1, 1
  br label %159

; <label>:159                                     ; preds = %156
  %160 = add nsw i32 %i.0, 1
  br label %128

; <label>:161                                     ; preds = %128
  br label %122

; <label>:162                                     ; preds = %122
  br label %163

; <label>:163                                     ; preds = %202, %162
  %bestaddress.5 = phi i8* [ %bestaddress.1, %162 ], [ %bestaddress.6, %202 ]
  %bestsad.5 = phi i32 [ %bestsad.1, %162 ], [ %bestsad.6, %202 ]
  %c.2 = phi i32 [ %c.0, %162 ], [ %c.3, %202 ]
  %check_here.2 = phi i8* [ %check_here.0, %162 ], [ %check_here.3, %202 ]
  %164 = add nsw i32 %c.2, 2
  %165 = icmp slt i32 %164, %col_max.0
  br i1 %165, label %166, label %203

; <label>:166                                     ; preds = %163
  %167 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 6
  %168 = load void (i8*, i32, i8*, i32, i32*)** %167, align 8
  %169 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i32 0
  call void %168(i8* %7, i32 %9, i8* %check_here.2, i32 %13, i32* %169)
  br label %170

; <label>:170                                     ; preds = %200, %166
  %bestaddress.6 = phi i8* [ %bestaddress.5, %166 ], [ %bestaddress.8, %200 ]
  %bestsad.6 = phi i32 [ %bestsad.5, %166 ], [ %bestsad.8, %200 ]
  %c.3 = phi i32 [ %c.2, %166 ], [ %199, %200 ]
  %check_here.3 = phi i8* [ %check_here.2, %166 ], [ %198, %200 ]
  %i1.0 = phi i32 [ 0, %166 ], [ %201, %200 ]
  %171 = icmp slt i32 %i1.0, 3
  br i1 %171, label %172, label %202

; <label>:172                                     ; preds = %170
  %173 = sext i32 %i1.0 to i64
  %174 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i64 %173
  %175 = load i32* %174, align 4
  store i32 %175, i32* %thissad, align 4
  %176 = load i32* %thissad, align 4
  %177 = icmp ult i32 %176, %bestsad.6
  br i1 %177, label %178, label %197

; <label>:178                                     ; preds = %172
  %179 = trunc i32 %c.3 to i16
  %180 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %181 = getelementptr inbounds %struct.MV* %180, i32 0, i32 1
  store i16 %179, i16* %181, align 2
  %182 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %183 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %182, i32 %sad_per_bit)
  %184 = load i32* %thissad, align 4
  %185 = add i32 %184, %183
  store i32 %185, i32* %thissad, align 4
  %186 = load i32* %thissad, align 4
  %187 = icmp ult i32 %186, %bestsad.6
  br i1 %187, label %188, label %196

; <label>:188                                     ; preds = %178
  %189 = load i32* %thissad, align 4
  %190 = trunc i32 %r.0 to i16
  %191 = bitcast %union.int_mv* %19 to %struct.MV*
  %192 = getelementptr inbounds %struct.MV* %191, i32 0, i32 0
  store i16 %190, i16* %192, align 2
  %193 = trunc i32 %c.3 to i16
  %194 = bitcast %union.int_mv* %19 to %struct.MV*
  %195 = getelementptr inbounds %struct.MV* %194, i32 0, i32 1
  store i16 %193, i16* %195, align 2
  br label %196

; <label>:196                                     ; preds = %188, %178
  %bestaddress.7 = phi i8* [ %check_here.3, %188 ], [ %bestaddress.6, %178 ]
  %bestsad.7 = phi i32 [ %189, %188 ], [ %bestsad.6, %178 ]
  br label %197

; <label>:197                                     ; preds = %196, %172
  %bestaddress.8 = phi i8* [ %bestaddress.7, %196 ], [ %bestaddress.6, %172 ]
  %bestsad.8 = phi i32 [ %bestsad.7, %196 ], [ %bestsad.6, %172 ]
  %198 = getelementptr inbounds i8* %check_here.3, i32 1
  %199 = add nsw i32 %c.3, 1
  br label %200

; <label>:200                                     ; preds = %197
  %201 = add nsw i32 %i1.0, 1
  br label %170

; <label>:202                                     ; preds = %170
  br label %163

; <label>:203                                     ; preds = %163
  br label %204

; <label>:204                                     ; preds = %231, %203
  %bestaddress.9 = phi i8* [ %bestaddress.5, %203 ], [ %bestaddress.11, %231 ]
  %bestsad.9 = phi i32 [ %bestsad.5, %203 ], [ %bestsad.11, %231 ]
  %c.4 = phi i32 [ %c.2, %203 ], [ %233, %231 ]
  %check_here.4 = phi i8* [ %check_here.2, %203 ], [ %232, %231 ]
  %205 = icmp slt i32 %c.4, %col_max.0
  br i1 %205, label %206, label %234

; <label>:206                                     ; preds = %204
  %207 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %208 = load i32 (i8*, i32, i8*, i32, i32)** %207, align 8
  %209 = call i32 %208(i8* %7, i32 %9, i8* %check_here.4, i32 %13, i32 %bestsad.9)
  store i32 %209, i32* %thissad, align 4
  %210 = load i32* %thissad, align 4
  %211 = icmp ult i32 %210, %bestsad.9
  br i1 %211, label %212, label %231

; <label>:212                                     ; preds = %206
  %213 = trunc i32 %c.4 to i16
  %214 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %215 = getelementptr inbounds %struct.MV* %214, i32 0, i32 1
  store i16 %213, i16* %215, align 2
  %216 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %217 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %216, i32 %sad_per_bit)
  %218 = load i32* %thissad, align 4
  %219 = add i32 %218, %217
  store i32 %219, i32* %thissad, align 4
  %220 = load i32* %thissad, align 4
  %221 = icmp ult i32 %220, %bestsad.9
  br i1 %221, label %222, label %230

; <label>:222                                     ; preds = %212
  %223 = load i32* %thissad, align 4
  %224 = trunc i32 %r.0 to i16
  %225 = bitcast %union.int_mv* %19 to %struct.MV*
  %226 = getelementptr inbounds %struct.MV* %225, i32 0, i32 0
  store i16 %224, i16* %226, align 2
  %227 = trunc i32 %c.4 to i16
  %228 = bitcast %union.int_mv* %19 to %struct.MV*
  %229 = getelementptr inbounds %struct.MV* %228, i32 0, i32 1
  store i16 %227, i16* %229, align 2
  br label %230

; <label>:230                                     ; preds = %222, %212
  %bestaddress.10 = phi i8* [ %check_here.4, %222 ], [ %bestaddress.9, %212 ]
  %bestsad.10 = phi i32 [ %223, %222 ], [ %bestsad.9, %212 ]
  br label %231

; <label>:231                                     ; preds = %230, %206
  %bestaddress.11 = phi i8* [ %bestaddress.10, %230 ], [ %bestaddress.9, %206 ]
  %bestsad.11 = phi i32 [ %bestsad.10, %230 ], [ %bestsad.9, %206 ]
  %232 = getelementptr inbounds i8* %check_here.4, i32 1
  %233 = add nsw i32 %c.4, 1
  br label %204

; <label>:234                                     ; preds = %204
  br label %235

; <label>:235                                     ; preds = %234
  %236 = add nsw i32 %r.0, 1
  br label %111

; <label>:237                                     ; preds = %111
  %238 = bitcast %union.int_mv* %19 to %struct.MV*
  %239 = getelementptr inbounds %struct.MV* %238, i32 0, i32 0
  %240 = load i16* %239, align 2
  %241 = sext i16 %240 to i32
  %242 = mul nsw i32 %241, 8
  %243 = trunc i32 %242 to i16
  %244 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %245 = getelementptr inbounds %struct.MV* %244, i32 0, i32 0
  store i16 %243, i16* %245, align 2
  %246 = bitcast %union.int_mv* %19 to %struct.MV*
  %247 = getelementptr inbounds %struct.MV* %246, i32 0, i32 1
  %248 = load i16* %247, align 2
  %249 = sext i16 %248 to i32
  %250 = mul nsw i32 %249, 8
  %251 = trunc i32 %250 to i16
  %252 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %253 = getelementptr inbounds %struct.MV* %252, i32 0, i32 1
  store i16 %251, i16* %253, align 2
  %254 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1
  %255 = load i32 (i8*, i32, i8*, i32, i32*)** %254, align 8
  %256 = call i32 %255(i8* %7, i32 %9, i8* %bestaddress.0, i32 %13, i32* %thissad)
  %257 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15
  %258 = load i32* %257, align 4
  %259 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %258)
  %260 = add i32 %256, %259
  ret i32 %260
}

; Function Attrs: nounwind uwtable
define i32 @vp8_refining_search_sad_c(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %error_per_bit, i32 %search_range, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %neighbors = alloca [4 x %struct.MV], align 16
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %1 = bitcast [4 x %struct.MV]* %neighbors to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([4 x %struct.MV]* @vp8_refining_search_sad_c.neighbors to i8*), i64 16, i32 16, i1 false)
  %2 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %3 = load i32* %2, align 4
  %4 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %5 = getelementptr inbounds %struct.macroblockd* %4, i32 0, i32 11
  %6 = getelementptr inbounds %struct.yv12_buffer_config* %5, i32 0, i32 4
  %7 = load i32* %6, align 4
  %8 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %9 = getelementptr inbounds %struct.macroblockd* %8, i32 0, i32 11
  %10 = getelementptr inbounds %struct.yv12_buffer_config* %9, i32 0, i32 13
  %11 = load i8** %10, align 8
  %12 = getelementptr inbounds %struct.block* %b, i32 0, i32 9
  %13 = load i8*** %12, align 8
  %14 = load i8** %13, align 8
  %15 = getelementptr inbounds %struct.block* %b, i32 0, i32 10
  %16 = load i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8* %14, i64 %17
  %19 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4
  %20 = load i32* %19, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8* %11, i64 %21
  %23 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %24 = getelementptr inbounds %struct.MV* %23, i32 0, i32 0
  %25 = load i16* %24, align 2
  %26 = sext i16 %25 to i32
  %27 = mul nsw i32 %26, %7
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8* %22, i64 %28
  %30 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %31 = getelementptr inbounds %struct.MV* %30, i32 0, i32 1
  %32 = load i16* %31, align 2
  %33 = sext i16 %32 to i32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8* %29, i64 %34
  %36 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %37 = getelementptr inbounds [2 x i32*]* %36, i32 0, i64 0
  %38 = load i32** %37, align 8
  %39 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %38, i32** %39, align 8
  %40 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %41 = getelementptr inbounds [2 x i32*]* %40, i32 0, i64 1
  %42 = load i32** %41, align 8
  %43 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %42, i32** %43, align 8
  %44 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %45 = getelementptr inbounds %struct.MV* %44, i32 0, i32 0
  %46 = load i16* %45, align 2
  %47 = sext i16 %46 to i32
  %48 = ashr i32 %47, 3
  %49 = trunc i32 %48 to i16
  %50 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %51 = getelementptr inbounds %struct.MV* %50, i32 0, i32 0
  store i16 %49, i16* %51, align 2
  %52 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %53 = getelementptr inbounds %struct.MV* %52, i32 0, i32 1
  %54 = load i16* %53, align 2
  %55 = sext i16 %54 to i32
  %56 = ashr i32 %55, 3
  %57 = trunc i32 %56 to i16
  %58 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %59 = getelementptr inbounds %struct.MV* %58, i32 0, i32 1
  store i16 %57, i16* %59, align 2
  %60 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %61 = load i32 (i8*, i32, i8*, i32, i32)** %60, align 8
  %62 = call i32 %61(i8* %18, i32 %3, i8* %35, i32 %7, i32 -1)
  %63 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %64 = call i32 @mvsad_err_cost(%union.int_mv* %ref_mv, %union.int_mv* %fcenter_mv, i32** %63, i32 %error_per_bit)
  %65 = add i32 %62, %64
  br label %66

; <label>:66                                      ; preds = %192, %0
  %i.0 = phi i32 [ 0, %0 ], [ %193, %192 ]
  %best_address.0 = phi i8* [ %35, %0 ], [ %190, %192 ]
  %bestsad.0 = phi i32 [ %65, %0 ], [ %bestsad.1, %192 ]
  %67 = icmp slt i32 %i.0, %search_range
  br i1 %67, label %68, label %194

; <label>:68                                      ; preds = %66
  br label %69

; <label>:69                                      ; preds = %149, %68
  %j.0 = phi i32 [ 0, %68 ], [ %150, %149 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %68 ], [ %bestsad.4, %149 ]
  %best_site.0 = phi i32 [ -1, %68 ], [ %best_site.3, %149 ]
  %70 = icmp slt i32 %j.0, 4
  br i1 %70, label %71, label %151

; <label>:71                                      ; preds = %69
  %72 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %73 = getelementptr inbounds %struct.MV* %72, i32 0, i32 0
  %74 = load i16* %73, align 2
  %75 = sext i16 %74 to i32
  %76 = sext i32 %j.0 to i64
  %77 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %76
  %78 = getelementptr inbounds %struct.MV* %77, i32 0, i32 0
  %79 = load i16* %78, align 2
  %80 = sext i16 %79 to i32
  %81 = add nsw i32 %75, %80
  %82 = trunc i32 %81 to i16
  %83 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %84 = getelementptr inbounds %struct.MV* %83, i32 0, i32 1
  %85 = load i16* %84, align 2
  %86 = sext i16 %85 to i32
  %87 = sext i32 %j.0 to i64
  %88 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %87
  %89 = getelementptr inbounds %struct.MV* %88, i32 0, i32 1
  %90 = load i16* %89, align 2
  %91 = sext i16 %90 to i32
  %92 = add nsw i32 %86, %91
  %93 = trunc i32 %92 to i16
  %94 = sext i16 %93 to i32
  %95 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %96 = load i32* %95, align 4
  %97 = icmp sgt i32 %94, %96
  br i1 %97, label %98, label %148

; <label>:98                                      ; preds = %71
  %99 = sext i16 %93 to i32
  %100 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %101 = load i32* %100, align 4
  %102 = icmp slt i32 %99, %101
  br i1 %102, label %103, label %148

; <label>:103                                     ; preds = %98
  %104 = sext i16 %82 to i32
  %105 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %106 = load i32* %105, align 4
  %107 = icmp sgt i32 %104, %106
  br i1 %107, label %108, label %148

; <label>:108                                     ; preds = %103
  %109 = sext i16 %82 to i32
  %110 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %111 = load i32* %110, align 4
  %112 = icmp slt i32 %109, %111
  br i1 %112, label %113, label %148

; <label>:113                                     ; preds = %108
  %114 = sext i32 %j.0 to i64
  %115 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %114
  %116 = getelementptr inbounds %struct.MV* %115, i32 0, i32 0
  %117 = load i16* %116, align 2
  %118 = sext i16 %117 to i32
  %119 = mul nsw i32 %118, %7
  %120 = sext i32 %j.0 to i64
  %121 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %120
  %122 = getelementptr inbounds %struct.MV* %121, i32 0, i32 1
  %123 = load i16* %122, align 2
  %124 = sext i16 %123 to i32
  %125 = add nsw i32 %119, %124
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i8* %best_address.0, i64 %126
  %128 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %129 = load i32 (i8*, i32, i8*, i32, i32)** %128, align 8
  %130 = call i32 %129(i8* %18, i32 %3, i8* %127, i32 %7, i32 %bestsad.1)
  store i32 %130, i32* %thissad, align 4
  %131 = load i32* %thissad, align 4
  %132 = icmp ult i32 %131, %bestsad.1
  br i1 %132, label %133, label %147

; <label>:133                                     ; preds = %113
  %134 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %135 = getelementptr inbounds %struct.MV* %134, i32 0, i32 0
  store i16 %82, i16* %135, align 2
  %136 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %137 = getelementptr inbounds %struct.MV* %136, i32 0, i32 1
  store i16 %93, i16* %137, align 2
  %138 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %139 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %138, i32 %error_per_bit)
  %140 = load i32* %thissad, align 4
  %141 = add i32 %140, %139
  store i32 %141, i32* %thissad, align 4
  %142 = load i32* %thissad, align 4
  %143 = icmp ult i32 %142, %bestsad.1
  br i1 %143, label %144, label %146

; <label>:144                                     ; preds = %133
  %145 = load i32* %thissad, align 4
  br label %146

; <label>:146                                     ; preds = %144, %133
  %bestsad.2 = phi i32 [ %145, %144 ], [ %bestsad.1, %133 ]
  %best_site.1 = phi i32 [ %j.0, %144 ], [ %best_site.0, %133 ]
  br label %147

; <label>:147                                     ; preds = %146, %113
  %bestsad.3 = phi i32 [ %bestsad.2, %146 ], [ %bestsad.1, %113 ]
  %best_site.2 = phi i32 [ %best_site.1, %146 ], [ %best_site.0, %113 ]
  br label %148

; <label>:148                                     ; preds = %147, %108, %103, %98, %71
  %bestsad.4 = phi i32 [ %bestsad.3, %147 ], [ %bestsad.1, %108 ], [ %bestsad.1, %103 ], [ %bestsad.1, %98 ], [ %bestsad.1, %71 ]
  %best_site.3 = phi i32 [ %best_site.2, %147 ], [ %best_site.0, %108 ], [ %best_site.0, %103 ], [ %best_site.0, %98 ], [ %best_site.0, %71 ]
  br label %149

; <label>:149                                     ; preds = %148
  %150 = add nsw i32 %j.0, 1
  br label %69

; <label>:151                                     ; preds = %69
  %152 = icmp eq i32 %best_site.0, -1
  br i1 %152, label %153, label %154

; <label>:153                                     ; preds = %151
  br label %194

; <label>:154                                     ; preds = %151
  %155 = sext i32 %best_site.0 to i64
  %156 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %155
  %157 = getelementptr inbounds %struct.MV* %156, i32 0, i32 0
  %158 = load i16* %157, align 2
  %159 = sext i16 %158 to i32
  %160 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %161 = getelementptr inbounds %struct.MV* %160, i32 0, i32 0
  %162 = load i16* %161, align 2
  %163 = sext i16 %162 to i32
  %164 = add nsw i32 %163, %159
  %165 = trunc i32 %164 to i16
  store i16 %165, i16* %161, align 2
  %166 = sext i32 %best_site.0 to i64
  %167 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %166
  %168 = getelementptr inbounds %struct.MV* %167, i32 0, i32 1
  %169 = load i16* %168, align 2
  %170 = sext i16 %169 to i32
  %171 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %172 = getelementptr inbounds %struct.MV* %171, i32 0, i32 1
  %173 = load i16* %172, align 2
  %174 = sext i16 %173 to i32
  %175 = add nsw i32 %174, %170
  %176 = trunc i32 %175 to i16
  store i16 %176, i16* %172, align 2
  %177 = sext i32 %best_site.0 to i64
  %178 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %177
  %179 = getelementptr inbounds %struct.MV* %178, i32 0, i32 0
  %180 = load i16* %179, align 2
  %181 = sext i16 %180 to i32
  %182 = mul nsw i32 %181, %7
  %183 = sext i32 %best_site.0 to i64
  %184 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %183
  %185 = getelementptr inbounds %struct.MV* %184, i32 0, i32 1
  %186 = load i16* %185, align 2
  %187 = sext i16 %186 to i32
  %188 = add nsw i32 %182, %187
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i8* %best_address.0, i64 %189
  br label %191

; <label>:191                                     ; preds = %154
  br label %192

; <label>:192                                     ; preds = %191
  %193 = add nsw i32 %i.0, 1
  br label %66

; <label>:194                                     ; preds = %153, %66
  %195 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %196 = getelementptr inbounds %struct.MV* %195, i32 0, i32 0
  %197 = load i16* %196, align 2
  %198 = sext i16 %197 to i32
  %199 = shl i32 %198, 3
  %200 = trunc i32 %199 to i16
  %201 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %202 = getelementptr inbounds %struct.MV* %201, i32 0, i32 0
  store i16 %200, i16* %202, align 2
  %203 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %204 = getelementptr inbounds %struct.MV* %203, i32 0, i32 1
  %205 = load i16* %204, align 2
  %206 = sext i16 %205 to i32
  %207 = shl i32 %206, 3
  %208 = trunc i32 %207 to i16
  %209 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %210 = getelementptr inbounds %struct.MV* %209, i32 0, i32 1
  store i16 %208, i16* %210, align 2
  %211 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1
  %212 = load i32 (i8*, i32, i8*, i32, i32*)** %211, align 8
  %213 = call i32 %212(i8* %18, i32 %3, i8* %best_address.0, i32 %7, i32* %thissad)
  %214 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15
  %215 = load i32* %214, align 4
  %216 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %215)
  %217 = add i32 %213, %216
  ret i32 %217
}

; Function Attrs: nounwind uwtable
define i32 @vp8_refining_search_sadx4(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %error_per_bit, i32 %search_range, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %neighbors = alloca [4 x %struct.MV], align 16
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %sad_array = alloca [4 x i32], align 16
  %block_offset = alloca [4 x i8*], align 16
  %1 = bitcast [4 x %struct.MV]* %neighbors to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([4 x %struct.MV]* @vp8_refining_search_sadx4.neighbors to i8*), i64 16, i32 16, i1 false)
  %2 = getelementptr inbounds %struct.block* %b, i32 0, i32 11
  %3 = load i32* %2, align 4
  %4 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %5 = getelementptr inbounds %struct.macroblockd* %4, i32 0, i32 11
  %6 = getelementptr inbounds %struct.yv12_buffer_config* %5, i32 0, i32 4
  %7 = load i32* %6, align 4
  %8 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7
  %9 = getelementptr inbounds %struct.macroblockd* %8, i32 0, i32 11
  %10 = getelementptr inbounds %struct.yv12_buffer_config* %9, i32 0, i32 13
  %11 = load i8** %10, align 8
  %12 = getelementptr inbounds %struct.block* %b, i32 0, i32 9
  %13 = load i8*** %12, align 8
  %14 = load i8** %13, align 8
  %15 = getelementptr inbounds %struct.block* %b, i32 0, i32 10
  %16 = load i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8* %14, i64 %17
  %19 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4
  %20 = load i32* %19, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8* %11, i64 %21
  %23 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %24 = getelementptr inbounds %struct.MV* %23, i32 0, i32 0
  %25 = load i16* %24, align 2
  %26 = sext i16 %25 to i32
  %27 = mul nsw i32 %26, %7
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8* %22, i64 %28
  %30 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %31 = getelementptr inbounds %struct.MV* %30, i32 0, i32 1
  %32 = load i16* %31, align 2
  %33 = sext i16 %32 to i32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8* %29, i64 %34
  %36 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %37 = getelementptr inbounds [2 x i32*]* %36, i32 0, i64 0
  %38 = load i32** %37, align 8
  %39 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %38, i32** %39, align 8
  %40 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25
  %41 = getelementptr inbounds [2 x i32*]* %40, i32 0, i64 1
  %42 = load i32** %41, align 8
  %43 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %42, i32** %43, align 8
  %44 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %45 = getelementptr inbounds %struct.MV* %44, i32 0, i32 0
  %46 = load i16* %45, align 2
  %47 = sext i16 %46 to i32
  %48 = ashr i32 %47, 3
  %49 = trunc i32 %48 to i16
  %50 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %51 = getelementptr inbounds %struct.MV* %50, i32 0, i32 0
  store i16 %49, i16* %51, align 2
  %52 = bitcast %union.int_mv* %center_mv to %struct.MV*
  %53 = getelementptr inbounds %struct.MV* %52, i32 0, i32 1
  %54 = load i16* %53, align 2
  %55 = sext i16 %54 to i32
  %56 = ashr i32 %55, 3
  %57 = trunc i32 %56 to i16
  %58 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %59 = getelementptr inbounds %struct.MV* %58, i32 0, i32 1
  store i16 %57, i16* %59, align 2
  %60 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %61 = load i32 (i8*, i32, i8*, i32, i32)** %60, align 8
  %62 = call i32 %61(i8* %18, i32 %3, i8* %35, i32 %7, i32 -1)
  %63 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %64 = call i32 @mvsad_err_cost(%union.int_mv* %ref_mv, %union.int_mv* %fcenter_mv, i32** %63, i32 %error_per_bit)
  %65 = add i32 %62, %64
  br label %66

; <label>:66                                      ; preds = %304, %0
  %i.0 = phi i32 [ 0, %0 ], [ %305, %304 ]
  %best_address.0 = phi i8* [ %35, %0 ], [ %302, %304 ]
  %bestsad.0 = phi i32 [ %65, %0 ], [ %bestsad.8, %304 ]
  %67 = icmp slt i32 %i.0, %search_range
  br i1 %67, label %68, label %306

; <label>:68                                      ; preds = %66
  %69 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %70 = getelementptr inbounds %struct.MV* %69, i32 0, i32 0
  %71 = load i16* %70, align 2
  %72 = sext i16 %71 to i32
  %73 = sub nsw i32 %72, 1
  %74 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %75 = load i32* %74, align 4
  %76 = icmp sgt i32 %73, %75
  %77 = zext i1 %76 to i32
  %78 = and i32 1, %77
  %79 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %80 = getelementptr inbounds %struct.MV* %79, i32 0, i32 0
  %81 = load i16* %80, align 2
  %82 = sext i16 %81 to i32
  %83 = add nsw i32 %82, 1
  %84 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %85 = load i32* %84, align 4
  %86 = icmp slt i32 %83, %85
  %87 = zext i1 %86 to i32
  %88 = and i32 %78, %87
  %89 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %90 = getelementptr inbounds %struct.MV* %89, i32 0, i32 1
  %91 = load i16* %90, align 2
  %92 = sext i16 %91 to i32
  %93 = sub nsw i32 %92, 1
  %94 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %95 = load i32* %94, align 4
  %96 = icmp sgt i32 %93, %95
  %97 = zext i1 %96 to i32
  %98 = and i32 %88, %97
  %99 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %100 = getelementptr inbounds %struct.MV* %99, i32 0, i32 1
  %101 = load i16* %100, align 2
  %102 = sext i16 %101 to i32
  %103 = add nsw i32 %102, 1
  %104 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %105 = load i32* %104, align 4
  %106 = icmp slt i32 %103, %105
  %107 = zext i1 %106 to i32
  %108 = and i32 %98, %107
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %179

; <label>:110                                     ; preds = %68
  %111 = sext i32 %7 to i64
  %112 = sub i64 0, %111
  %113 = getelementptr inbounds i8* %best_address.0, i64 %112
  %114 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 0
  store i8* %113, i8** %114, align 8
  %115 = getelementptr inbounds i8* %best_address.0, i64 -1
  %116 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 1
  store i8* %115, i8** %116, align 8
  %117 = getelementptr inbounds i8* %best_address.0, i64 1
  %118 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 2
  store i8* %117, i8** %118, align 8
  %119 = sext i32 %7 to i64
  %120 = getelementptr inbounds i8* %best_address.0, i64 %119
  %121 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 3
  store i8* %120, i8** %121, align 8
  %122 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 8
  %123 = load void (i8*, i32, i8**, i32, i32*)** %122, align 8
  %124 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i32 0
  %125 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i32 0
  call void %123(i8* %18, i32 %3, i8** %124, i32 %7, i32* %125)
  br label %126

; <label>:126                                     ; preds = %176, %110
  %j.0 = phi i32 [ 0, %110 ], [ %177, %176 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %110 ], [ %bestsad.3, %176 ]
  %best_site.0 = phi i32 [ -1, %110 ], [ %best_site.2, %176 ]
  %127 = icmp slt i32 %j.0, 4
  br i1 %127, label %128, label %178

; <label>:128                                     ; preds = %126
  %129 = sext i32 %j.0 to i64
  %130 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %129
  %131 = load i32* %130, align 4
  %132 = icmp ult i32 %131, %bestsad.1
  br i1 %132, label %133, label %175

; <label>:133                                     ; preds = %128
  %134 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %135 = getelementptr inbounds %struct.MV* %134, i32 0, i32 0
  %136 = load i16* %135, align 2
  %137 = sext i16 %136 to i32
  %138 = sext i32 %j.0 to i64
  %139 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %138
  %140 = getelementptr inbounds %struct.MV* %139, i32 0, i32 0
  %141 = load i16* %140, align 2
  %142 = sext i16 %141 to i32
  %143 = add nsw i32 %137, %142
  %144 = trunc i32 %143 to i16
  %145 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %146 = getelementptr inbounds %struct.MV* %145, i32 0, i32 0
  store i16 %144, i16* %146, align 2
  %147 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %148 = getelementptr inbounds %struct.MV* %147, i32 0, i32 1
  %149 = load i16* %148, align 2
  %150 = sext i16 %149 to i32
  %151 = sext i32 %j.0 to i64
  %152 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %151
  %153 = getelementptr inbounds %struct.MV* %152, i32 0, i32 1
  %154 = load i16* %153, align 2
  %155 = sext i16 %154 to i32
  %156 = add nsw i32 %150, %155
  %157 = trunc i32 %156 to i16
  %158 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %159 = getelementptr inbounds %struct.MV* %158, i32 0, i32 1
  store i16 %157, i16* %159, align 2
  %160 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %161 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %160, i32 %error_per_bit)
  %162 = sext i32 %j.0 to i64
  %163 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %162
  %164 = load i32* %163, align 4
  %165 = add i32 %164, %161
  store i32 %165, i32* %163, align 4
  %166 = sext i32 %j.0 to i64
  %167 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %166
  %168 = load i32* %167, align 4
  %169 = icmp ult i32 %168, %bestsad.1
  br i1 %169, label %170, label %174

; <label>:170                                     ; preds = %133
  %171 = sext i32 %j.0 to i64
  %172 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %171
  %173 = load i32* %172, align 4
  br label %174

; <label>:174                                     ; preds = %170, %133
  %bestsad.2 = phi i32 [ %173, %170 ], [ %bestsad.1, %133 ]
  %best_site.1 = phi i32 [ %j.0, %170 ], [ %best_site.0, %133 ]
  br label %175

; <label>:175                                     ; preds = %174, %128
  %bestsad.3 = phi i32 [ %bestsad.2, %174 ], [ %bestsad.1, %128 ]
  %best_site.2 = phi i32 [ %best_site.1, %174 ], [ %best_site.0, %128 ]
  br label %176

; <label>:176                                     ; preds = %175
  %177 = add nsw i32 %j.0, 1
  br label %126

; <label>:178                                     ; preds = %126
  br label %263

; <label>:179                                     ; preds = %68
  br label %180

; <label>:180                                     ; preds = %260, %179
  %j.1 = phi i32 [ 0, %179 ], [ %261, %260 ]
  %bestsad.4 = phi i32 [ %bestsad.0, %179 ], [ %bestsad.7, %260 ]
  %best_site.3 = phi i32 [ -1, %179 ], [ %best_site.6, %260 ]
  %181 = icmp slt i32 %j.1, 4
  br i1 %181, label %182, label %262

; <label>:182                                     ; preds = %180
  %183 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %184 = getelementptr inbounds %struct.MV* %183, i32 0, i32 0
  %185 = load i16* %184, align 2
  %186 = sext i16 %185 to i32
  %187 = sext i32 %j.1 to i64
  %188 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %187
  %189 = getelementptr inbounds %struct.MV* %188, i32 0, i32 0
  %190 = load i16* %189, align 2
  %191 = sext i16 %190 to i32
  %192 = add nsw i32 %186, %191
  %193 = trunc i32 %192 to i16
  %194 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %195 = getelementptr inbounds %struct.MV* %194, i32 0, i32 1
  %196 = load i16* %195, align 2
  %197 = sext i16 %196 to i32
  %198 = sext i32 %j.1 to i64
  %199 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %198
  %200 = getelementptr inbounds %struct.MV* %199, i32 0, i32 1
  %201 = load i16* %200, align 2
  %202 = sext i16 %201 to i32
  %203 = add nsw i32 %197, %202
  %204 = trunc i32 %203 to i16
  %205 = sext i16 %204 to i32
  %206 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31
  %207 = load i32* %206, align 4
  %208 = icmp sgt i32 %205, %207
  br i1 %208, label %209, label %259

; <label>:209                                     ; preds = %182
  %210 = sext i16 %204 to i32
  %211 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32
  %212 = load i32* %211, align 4
  %213 = icmp slt i32 %210, %212
  br i1 %213, label %214, label %259

; <label>:214                                     ; preds = %209
  %215 = sext i16 %193 to i32
  %216 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33
  %217 = load i32* %216, align 4
  %218 = icmp sgt i32 %215, %217
  br i1 %218, label %219, label %259

; <label>:219                                     ; preds = %214
  %220 = sext i16 %193 to i32
  %221 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34
  %222 = load i32* %221, align 4
  %223 = icmp slt i32 %220, %222
  br i1 %223, label %224, label %259

; <label>:224                                     ; preds = %219
  %225 = sext i32 %j.1 to i64
  %226 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %225
  %227 = getelementptr inbounds %struct.MV* %226, i32 0, i32 0
  %228 = load i16* %227, align 2
  %229 = sext i16 %228 to i32
  %230 = mul nsw i32 %229, %7
  %231 = sext i32 %j.1 to i64
  %232 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %231
  %233 = getelementptr inbounds %struct.MV* %232, i32 0, i32 1
  %234 = load i16* %233, align 2
  %235 = sext i16 %234 to i32
  %236 = add nsw i32 %230, %235
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds i8* %best_address.0, i64 %237
  %239 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0
  %240 = load i32 (i8*, i32, i8*, i32, i32)** %239, align 8
  %241 = call i32 %240(i8* %18, i32 %3, i8* %238, i32 %7, i32 %bestsad.4)
  store i32 %241, i32* %thissad, align 4
  %242 = load i32* %thissad, align 4
  %243 = icmp ult i32 %242, %bestsad.4
  br i1 %243, label %244, label %258

; <label>:244                                     ; preds = %224
  %245 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %246 = getelementptr inbounds %struct.MV* %245, i32 0, i32 0
  store i16 %193, i16* %246, align 2
  %247 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %248 = getelementptr inbounds %struct.MV* %247, i32 0, i32 1
  store i16 %204, i16* %248, align 2
  %249 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %250 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %249, i32 %error_per_bit)
  %251 = load i32* %thissad, align 4
  %252 = add i32 %251, %250
  store i32 %252, i32* %thissad, align 4
  %253 = load i32* %thissad, align 4
  %254 = icmp ult i32 %253, %bestsad.4
  br i1 %254, label %255, label %257

; <label>:255                                     ; preds = %244
  %256 = load i32* %thissad, align 4
  br label %257

; <label>:257                                     ; preds = %255, %244
  %bestsad.5 = phi i32 [ %256, %255 ], [ %bestsad.4, %244 ]
  %best_site.4 = phi i32 [ %j.1, %255 ], [ %best_site.3, %244 ]
  br label %258

; <label>:258                                     ; preds = %257, %224
  %bestsad.6 = phi i32 [ %bestsad.5, %257 ], [ %bestsad.4, %224 ]
  %best_site.5 = phi i32 [ %best_site.4, %257 ], [ %best_site.3, %224 ]
  br label %259

; <label>:259                                     ; preds = %258, %219, %214, %209, %182
  %bestsad.7 = phi i32 [ %bestsad.6, %258 ], [ %bestsad.4, %219 ], [ %bestsad.4, %214 ], [ %bestsad.4, %209 ], [ %bestsad.4, %182 ]
  %best_site.6 = phi i32 [ %best_site.5, %258 ], [ %best_site.3, %219 ], [ %best_site.3, %214 ], [ %best_site.3, %209 ], [ %best_site.3, %182 ]
  br label %260

; <label>:260                                     ; preds = %259
  %261 = add nsw i32 %j.1, 1
  br label %180

; <label>:262                                     ; preds = %180
  br label %263

; <label>:263                                     ; preds = %262, %178
  %bestsad.8 = phi i32 [ %bestsad.1, %178 ], [ %bestsad.4, %262 ]
  %best_site.7 = phi i32 [ %best_site.0, %178 ], [ %best_site.3, %262 ]
  %264 = icmp eq i32 %best_site.7, -1
  br i1 %264, label %265, label %266

; <label>:265                                     ; preds = %263
  br label %306

; <label>:266                                     ; preds = %263
  %267 = sext i32 %best_site.7 to i64
  %268 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %267
  %269 = getelementptr inbounds %struct.MV* %268, i32 0, i32 0
  %270 = load i16* %269, align 2
  %271 = sext i16 %270 to i32
  %272 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %273 = getelementptr inbounds %struct.MV* %272, i32 0, i32 0
  %274 = load i16* %273, align 2
  %275 = sext i16 %274 to i32
  %276 = add nsw i32 %275, %271
  %277 = trunc i32 %276 to i16
  store i16 %277, i16* %273, align 2
  %278 = sext i32 %best_site.7 to i64
  %279 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %278
  %280 = getelementptr inbounds %struct.MV* %279, i32 0, i32 1
  %281 = load i16* %280, align 2
  %282 = sext i16 %281 to i32
  %283 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %284 = getelementptr inbounds %struct.MV* %283, i32 0, i32 1
  %285 = load i16* %284, align 2
  %286 = sext i16 %285 to i32
  %287 = add nsw i32 %286, %282
  %288 = trunc i32 %287 to i16
  store i16 %288, i16* %284, align 2
  %289 = sext i32 %best_site.7 to i64
  %290 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %289
  %291 = getelementptr inbounds %struct.MV* %290, i32 0, i32 0
  %292 = load i16* %291, align 2
  %293 = sext i16 %292 to i32
  %294 = mul nsw i32 %293, %7
  %295 = sext i32 %best_site.7 to i64
  %296 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %295
  %297 = getelementptr inbounds %struct.MV* %296, i32 0, i32 1
  %298 = load i16* %297, align 2
  %299 = sext i16 %298 to i32
  %300 = add nsw i32 %294, %299
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds i8* %best_address.0, i64 %301
  br label %303

; <label>:303                                     ; preds = %266
  br label %304

; <label>:304                                     ; preds = %303
  %305 = add nsw i32 %i.0, 1
  br label %66

; <label>:306                                     ; preds = %265, %66
  %307 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %308 = getelementptr inbounds %struct.MV* %307, i32 0, i32 0
  %309 = load i16* %308, align 2
  %310 = sext i16 %309 to i32
  %311 = mul nsw i32 %310, 8
  %312 = trunc i32 %311 to i16
  %313 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %314 = getelementptr inbounds %struct.MV* %313, i32 0, i32 0
  store i16 %312, i16* %314, align 2
  %315 = bitcast %union.int_mv* %ref_mv to %struct.MV*
  %316 = getelementptr inbounds %struct.MV* %315, i32 0, i32 1
  %317 = load i16* %316, align 2
  %318 = sext i16 %317 to i32
  %319 = mul nsw i32 %318, 8
  %320 = trunc i32 %319 to i16
  %321 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %322 = getelementptr inbounds %struct.MV* %321, i32 0, i32 1
  store i16 %320, i16* %322, align 2
  %323 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1
  %324 = load i32 (i8*, i32, i8*, i32, i32*)** %323, align 8
  %325 = call i32 %324(i8* %18, i32 %3, i8* %best_address.0, i32 %7, i32* %thissad)
  %326 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15
  %327 = load i32* %326, align 4
  %328 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %327)
  %329 = add i32 %325, %328
  ret i32 %329
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
