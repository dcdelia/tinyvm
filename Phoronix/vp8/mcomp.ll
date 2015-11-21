; ModuleID = 'mcomp.c'
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
  %1 = alloca %union.int_mv*, align 8
  %2 = alloca %union.int_mv*, align 8
  %3 = alloca i32**, align 8
  %4 = alloca i32, align 4
  store %union.int_mv* %mv, %union.int_mv** %1, align 8
  store %union.int_mv* %ref, %union.int_mv** %2, align 8
  store i32** %mvcost, i32*** %3, align 8
  store i32 %Weight, i32* %4, align 4
  %5 = load %union.int_mv** %1, align 8
  %6 = bitcast %union.int_mv* %5 to %struct.MV*
  %7 = getelementptr inbounds %struct.MV* %6, i32 0, i32 0
  %8 = load i16* %7, align 2
  %9 = sext i16 %8 to i32
  %10 = load %union.int_mv** %2, align 8
  %11 = bitcast %union.int_mv* %10 to %struct.MV*
  %12 = getelementptr inbounds %struct.MV* %11, i32 0, i32 0
  %13 = load i16* %12, align 2
  %14 = sext i16 %13 to i32
  %15 = sub nsw i32 %9, %14
  %16 = ashr i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = load i32*** %3, align 8
  %19 = getelementptr inbounds i32** %18, i64 0
  %20 = load i32** %19, align 8
  %21 = getelementptr inbounds i32* %20, i64 %17
  %22 = load i32* %21, align 4
  %23 = load %union.int_mv** %1, align 8
  %24 = bitcast %union.int_mv* %23 to %struct.MV*
  %25 = getelementptr inbounds %struct.MV* %24, i32 0, i32 1
  %26 = load i16* %25, align 2
  %27 = sext i16 %26 to i32
  %28 = load %union.int_mv** %2, align 8
  %29 = bitcast %union.int_mv* %28 to %struct.MV*
  %30 = getelementptr inbounds %struct.MV* %29, i32 0, i32 1
  %31 = load i16* %30, align 2
  %32 = sext i16 %31 to i32
  %33 = sub nsw i32 %27, %32
  %34 = ashr i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = load i32*** %3, align 8
  %37 = getelementptr inbounds i32** %36, i64 1
  %38 = load i32** %37, align 8
  %39 = getelementptr inbounds i32* %38, i64 %35
  %40 = load i32* %39, align 4
  %41 = add nsw i32 %22, %40
  %42 = load i32* %4, align 4
  %43 = mul nsw i32 %41, %42
  %44 = ashr i32 %43, 7
  ret i32 %44
}

; Function Attrs: nounwind uwtable
define void @vp8_init_dsmotion_compensation(%struct.macroblock* %x, i32 %stride) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca i32, align 4
  %Len = alloca i32, align 4
  %search_site_count = alloca i32, align 4
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  store i32 %stride, i32* %2, align 4
  store i32 0, i32* %search_site_count, align 4
  store i32 128, i32* %Len, align 4
  %3 = load i32* %search_site_count, align 4
  %4 = sext i32 %3 to i64
  %5 = load %struct.macroblock** %1, align 8
  %6 = getelementptr inbounds %struct.macroblock* %5, i32 0, i32 12
  %7 = load %struct.search_site** %6, align 8
  %8 = getelementptr inbounds %struct.search_site* %7, i64 %4
  %9 = getelementptr inbounds %struct.search_site* %8, i32 0, i32 0
  %10 = getelementptr inbounds %struct.MV* %9, i32 0, i32 1
  store i16 0, i16* %10, align 2
  %11 = load i32* %search_site_count, align 4
  %12 = sext i32 %11 to i64
  %13 = load %struct.macroblock** %1, align 8
  %14 = getelementptr inbounds %struct.macroblock* %13, i32 0, i32 12
  %15 = load %struct.search_site** %14, align 8
  %16 = getelementptr inbounds %struct.search_site* %15, i64 %12
  %17 = getelementptr inbounds %struct.search_site* %16, i32 0, i32 0
  %18 = getelementptr inbounds %struct.MV* %17, i32 0, i32 0
  store i16 0, i16* %18, align 2
  %19 = load i32* %search_site_count, align 4
  %20 = sext i32 %19 to i64
  %21 = load %struct.macroblock** %1, align 8
  %22 = getelementptr inbounds %struct.macroblock* %21, i32 0, i32 12
  %23 = load %struct.search_site** %22, align 8
  %24 = getelementptr inbounds %struct.search_site* %23, i64 %20
  %25 = getelementptr inbounds %struct.search_site* %24, i32 0, i32 1
  store i32 0, i32* %25, align 4
  %26 = load i32* %search_site_count, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %search_site_count, align 4
  br label %28

; <label>:28                                      ; preds = %31, %0
  %29 = load i32* %Len, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %154

; <label>:31                                      ; preds = %28
  %32 = load i32* %search_site_count, align 4
  %33 = sext i32 %32 to i64
  %34 = load %struct.macroblock** %1, align 8
  %35 = getelementptr inbounds %struct.macroblock* %34, i32 0, i32 12
  %36 = load %struct.search_site** %35, align 8
  %37 = getelementptr inbounds %struct.search_site* %36, i64 %33
  %38 = getelementptr inbounds %struct.search_site* %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 1
  store i16 0, i16* %39, align 2
  %40 = load i32* %Len, align 4
  %41 = sub nsw i32 0, %40
  %42 = trunc i32 %41 to i16
  %43 = load i32* %search_site_count, align 4
  %44 = sext i32 %43 to i64
  %45 = load %struct.macroblock** %1, align 8
  %46 = getelementptr inbounds %struct.macroblock* %45, i32 0, i32 12
  %47 = load %struct.search_site** %46, align 8
  %48 = getelementptr inbounds %struct.search_site* %47, i64 %44
  %49 = getelementptr inbounds %struct.search_site* %48, i32 0, i32 0
  %50 = getelementptr inbounds %struct.MV* %49, i32 0, i32 0
  store i16 %42, i16* %50, align 2
  %51 = load i32* %Len, align 4
  %52 = sub nsw i32 0, %51
  %53 = load i32* %2, align 4
  %54 = mul nsw i32 %52, %53
  %55 = load i32* %search_site_count, align 4
  %56 = sext i32 %55 to i64
  %57 = load %struct.macroblock** %1, align 8
  %58 = getelementptr inbounds %struct.macroblock* %57, i32 0, i32 12
  %59 = load %struct.search_site** %58, align 8
  %60 = getelementptr inbounds %struct.search_site* %59, i64 %56
  %61 = getelementptr inbounds %struct.search_site* %60, i32 0, i32 1
  store i32 %54, i32* %61, align 4
  %62 = load i32* %search_site_count, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %search_site_count, align 4
  %64 = load i32* %search_site_count, align 4
  %65 = sext i32 %64 to i64
  %66 = load %struct.macroblock** %1, align 8
  %67 = getelementptr inbounds %struct.macroblock* %66, i32 0, i32 12
  %68 = load %struct.search_site** %67, align 8
  %69 = getelementptr inbounds %struct.search_site* %68, i64 %65
  %70 = getelementptr inbounds %struct.search_site* %69, i32 0, i32 0
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 1
  store i16 0, i16* %71, align 2
  %72 = load i32* %Len, align 4
  %73 = trunc i32 %72 to i16
  %74 = load i32* %search_site_count, align 4
  %75 = sext i32 %74 to i64
  %76 = load %struct.macroblock** %1, align 8
  %77 = getelementptr inbounds %struct.macroblock* %76, i32 0, i32 12
  %78 = load %struct.search_site** %77, align 8
  %79 = getelementptr inbounds %struct.search_site* %78, i64 %75
  %80 = getelementptr inbounds %struct.search_site* %79, i32 0, i32 0
  %81 = getelementptr inbounds %struct.MV* %80, i32 0, i32 0
  store i16 %73, i16* %81, align 2
  %82 = load i32* %Len, align 4
  %83 = load i32* %2, align 4
  %84 = mul nsw i32 %82, %83
  %85 = load i32* %search_site_count, align 4
  %86 = sext i32 %85 to i64
  %87 = load %struct.macroblock** %1, align 8
  %88 = getelementptr inbounds %struct.macroblock* %87, i32 0, i32 12
  %89 = load %struct.search_site** %88, align 8
  %90 = getelementptr inbounds %struct.search_site* %89, i64 %86
  %91 = getelementptr inbounds %struct.search_site* %90, i32 0, i32 1
  store i32 %84, i32* %91, align 4
  %92 = load i32* %search_site_count, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %search_site_count, align 4
  %94 = load i32* %Len, align 4
  %95 = sub nsw i32 0, %94
  %96 = trunc i32 %95 to i16
  %97 = load i32* %search_site_count, align 4
  %98 = sext i32 %97 to i64
  %99 = load %struct.macroblock** %1, align 8
  %100 = getelementptr inbounds %struct.macroblock* %99, i32 0, i32 12
  %101 = load %struct.search_site** %100, align 8
  %102 = getelementptr inbounds %struct.search_site* %101, i64 %98
  %103 = getelementptr inbounds %struct.search_site* %102, i32 0, i32 0
  %104 = getelementptr inbounds %struct.MV* %103, i32 0, i32 1
  store i16 %96, i16* %104, align 2
  %105 = load i32* %search_site_count, align 4
  %106 = sext i32 %105 to i64
  %107 = load %struct.macroblock** %1, align 8
  %108 = getelementptr inbounds %struct.macroblock* %107, i32 0, i32 12
  %109 = load %struct.search_site** %108, align 8
  %110 = getelementptr inbounds %struct.search_site* %109, i64 %106
  %111 = getelementptr inbounds %struct.search_site* %110, i32 0, i32 0
  %112 = getelementptr inbounds %struct.MV* %111, i32 0, i32 0
  store i16 0, i16* %112, align 2
  %113 = load i32* %Len, align 4
  %114 = sub nsw i32 0, %113
  %115 = load i32* %search_site_count, align 4
  %116 = sext i32 %115 to i64
  %117 = load %struct.macroblock** %1, align 8
  %118 = getelementptr inbounds %struct.macroblock* %117, i32 0, i32 12
  %119 = load %struct.search_site** %118, align 8
  %120 = getelementptr inbounds %struct.search_site* %119, i64 %116
  %121 = getelementptr inbounds %struct.search_site* %120, i32 0, i32 1
  store i32 %114, i32* %121, align 4
  %122 = load i32* %search_site_count, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %search_site_count, align 4
  %124 = load i32* %Len, align 4
  %125 = trunc i32 %124 to i16
  %126 = load i32* %search_site_count, align 4
  %127 = sext i32 %126 to i64
  %128 = load %struct.macroblock** %1, align 8
  %129 = getelementptr inbounds %struct.macroblock* %128, i32 0, i32 12
  %130 = load %struct.search_site** %129, align 8
  %131 = getelementptr inbounds %struct.search_site* %130, i64 %127
  %132 = getelementptr inbounds %struct.search_site* %131, i32 0, i32 0
  %133 = getelementptr inbounds %struct.MV* %132, i32 0, i32 1
  store i16 %125, i16* %133, align 2
  %134 = load i32* %search_site_count, align 4
  %135 = sext i32 %134 to i64
  %136 = load %struct.macroblock** %1, align 8
  %137 = getelementptr inbounds %struct.macroblock* %136, i32 0, i32 12
  %138 = load %struct.search_site** %137, align 8
  %139 = getelementptr inbounds %struct.search_site* %138, i64 %135
  %140 = getelementptr inbounds %struct.search_site* %139, i32 0, i32 0
  %141 = getelementptr inbounds %struct.MV* %140, i32 0, i32 0
  store i16 0, i16* %141, align 2
  %142 = load i32* %Len, align 4
  %143 = load i32* %search_site_count, align 4
  %144 = sext i32 %143 to i64
  %145 = load %struct.macroblock** %1, align 8
  %146 = getelementptr inbounds %struct.macroblock* %145, i32 0, i32 12
  %147 = load %struct.search_site** %146, align 8
  %148 = getelementptr inbounds %struct.search_site* %147, i64 %144
  %149 = getelementptr inbounds %struct.search_site* %148, i32 0, i32 1
  store i32 %142, i32* %149, align 4
  %150 = load i32* %search_site_count, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %search_site_count, align 4
  %152 = load i32* %Len, align 4
  %153 = sdiv i32 %152, 2
  store i32 %153, i32* %Len, align 4
  br label %28

; <label>:154                                     ; preds = %28
  %155 = load i32* %search_site_count, align 4
  %156 = load %struct.macroblock** %1, align 8
  %157 = getelementptr inbounds %struct.macroblock* %156, i32 0, i32 13
  store i32 %155, i32* %157, align 4
  %158 = load %struct.macroblock** %1, align 8
  %159 = getelementptr inbounds %struct.macroblock* %158, i32 0, i32 14
  store i32 4, i32* %159, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @vp8_init3smotion_compensation(%struct.macroblock* %x, i32 %stride) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca i32, align 4
  %Len = alloca i32, align 4
  %search_site_count = alloca i32, align 4
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  store i32 %stride, i32* %2, align 4
  store i32 0, i32* %search_site_count, align 4
  store i32 128, i32* %Len, align 4
  %3 = load i32* %search_site_count, align 4
  %4 = sext i32 %3 to i64
  %5 = load %struct.macroblock** %1, align 8
  %6 = getelementptr inbounds %struct.macroblock* %5, i32 0, i32 12
  %7 = load %struct.search_site** %6, align 8
  %8 = getelementptr inbounds %struct.search_site* %7, i64 %4
  %9 = getelementptr inbounds %struct.search_site* %8, i32 0, i32 0
  %10 = getelementptr inbounds %struct.MV* %9, i32 0, i32 1
  store i16 0, i16* %10, align 2
  %11 = load i32* %search_site_count, align 4
  %12 = sext i32 %11 to i64
  %13 = load %struct.macroblock** %1, align 8
  %14 = getelementptr inbounds %struct.macroblock* %13, i32 0, i32 12
  %15 = load %struct.search_site** %14, align 8
  %16 = getelementptr inbounds %struct.search_site* %15, i64 %12
  %17 = getelementptr inbounds %struct.search_site* %16, i32 0, i32 0
  %18 = getelementptr inbounds %struct.MV* %17, i32 0, i32 0
  store i16 0, i16* %18, align 2
  %19 = load i32* %search_site_count, align 4
  %20 = sext i32 %19 to i64
  %21 = load %struct.macroblock** %1, align 8
  %22 = getelementptr inbounds %struct.macroblock* %21, i32 0, i32 12
  %23 = load %struct.search_site** %22, align 8
  %24 = getelementptr inbounds %struct.search_site* %23, i64 %20
  %25 = getelementptr inbounds %struct.search_site* %24, i32 0, i32 1
  store i32 0, i32* %25, align 4
  %26 = load i32* %search_site_count, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %search_site_count, align 4
  br label %28

; <label>:28                                      ; preds = %31, %0
  %29 = load i32* %Len, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %296

; <label>:31                                      ; preds = %28
  %32 = load i32* %search_site_count, align 4
  %33 = sext i32 %32 to i64
  %34 = load %struct.macroblock** %1, align 8
  %35 = getelementptr inbounds %struct.macroblock* %34, i32 0, i32 12
  %36 = load %struct.search_site** %35, align 8
  %37 = getelementptr inbounds %struct.search_site* %36, i64 %33
  %38 = getelementptr inbounds %struct.search_site* %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 1
  store i16 0, i16* %39, align 2
  %40 = load i32* %Len, align 4
  %41 = sub nsw i32 0, %40
  %42 = trunc i32 %41 to i16
  %43 = load i32* %search_site_count, align 4
  %44 = sext i32 %43 to i64
  %45 = load %struct.macroblock** %1, align 8
  %46 = getelementptr inbounds %struct.macroblock* %45, i32 0, i32 12
  %47 = load %struct.search_site** %46, align 8
  %48 = getelementptr inbounds %struct.search_site* %47, i64 %44
  %49 = getelementptr inbounds %struct.search_site* %48, i32 0, i32 0
  %50 = getelementptr inbounds %struct.MV* %49, i32 0, i32 0
  store i16 %42, i16* %50, align 2
  %51 = load i32* %Len, align 4
  %52 = sub nsw i32 0, %51
  %53 = load i32* %2, align 4
  %54 = mul nsw i32 %52, %53
  %55 = load i32* %search_site_count, align 4
  %56 = sext i32 %55 to i64
  %57 = load %struct.macroblock** %1, align 8
  %58 = getelementptr inbounds %struct.macroblock* %57, i32 0, i32 12
  %59 = load %struct.search_site** %58, align 8
  %60 = getelementptr inbounds %struct.search_site* %59, i64 %56
  %61 = getelementptr inbounds %struct.search_site* %60, i32 0, i32 1
  store i32 %54, i32* %61, align 4
  %62 = load i32* %search_site_count, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %search_site_count, align 4
  %64 = load i32* %search_site_count, align 4
  %65 = sext i32 %64 to i64
  %66 = load %struct.macroblock** %1, align 8
  %67 = getelementptr inbounds %struct.macroblock* %66, i32 0, i32 12
  %68 = load %struct.search_site** %67, align 8
  %69 = getelementptr inbounds %struct.search_site* %68, i64 %65
  %70 = getelementptr inbounds %struct.search_site* %69, i32 0, i32 0
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 1
  store i16 0, i16* %71, align 2
  %72 = load i32* %Len, align 4
  %73 = trunc i32 %72 to i16
  %74 = load i32* %search_site_count, align 4
  %75 = sext i32 %74 to i64
  %76 = load %struct.macroblock** %1, align 8
  %77 = getelementptr inbounds %struct.macroblock* %76, i32 0, i32 12
  %78 = load %struct.search_site** %77, align 8
  %79 = getelementptr inbounds %struct.search_site* %78, i64 %75
  %80 = getelementptr inbounds %struct.search_site* %79, i32 0, i32 0
  %81 = getelementptr inbounds %struct.MV* %80, i32 0, i32 0
  store i16 %73, i16* %81, align 2
  %82 = load i32* %Len, align 4
  %83 = load i32* %2, align 4
  %84 = mul nsw i32 %82, %83
  %85 = load i32* %search_site_count, align 4
  %86 = sext i32 %85 to i64
  %87 = load %struct.macroblock** %1, align 8
  %88 = getelementptr inbounds %struct.macroblock* %87, i32 0, i32 12
  %89 = load %struct.search_site** %88, align 8
  %90 = getelementptr inbounds %struct.search_site* %89, i64 %86
  %91 = getelementptr inbounds %struct.search_site* %90, i32 0, i32 1
  store i32 %84, i32* %91, align 4
  %92 = load i32* %search_site_count, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %search_site_count, align 4
  %94 = load i32* %Len, align 4
  %95 = sub nsw i32 0, %94
  %96 = trunc i32 %95 to i16
  %97 = load i32* %search_site_count, align 4
  %98 = sext i32 %97 to i64
  %99 = load %struct.macroblock** %1, align 8
  %100 = getelementptr inbounds %struct.macroblock* %99, i32 0, i32 12
  %101 = load %struct.search_site** %100, align 8
  %102 = getelementptr inbounds %struct.search_site* %101, i64 %98
  %103 = getelementptr inbounds %struct.search_site* %102, i32 0, i32 0
  %104 = getelementptr inbounds %struct.MV* %103, i32 0, i32 1
  store i16 %96, i16* %104, align 2
  %105 = load i32* %search_site_count, align 4
  %106 = sext i32 %105 to i64
  %107 = load %struct.macroblock** %1, align 8
  %108 = getelementptr inbounds %struct.macroblock* %107, i32 0, i32 12
  %109 = load %struct.search_site** %108, align 8
  %110 = getelementptr inbounds %struct.search_site* %109, i64 %106
  %111 = getelementptr inbounds %struct.search_site* %110, i32 0, i32 0
  %112 = getelementptr inbounds %struct.MV* %111, i32 0, i32 0
  store i16 0, i16* %112, align 2
  %113 = load i32* %Len, align 4
  %114 = sub nsw i32 0, %113
  %115 = load i32* %search_site_count, align 4
  %116 = sext i32 %115 to i64
  %117 = load %struct.macroblock** %1, align 8
  %118 = getelementptr inbounds %struct.macroblock* %117, i32 0, i32 12
  %119 = load %struct.search_site** %118, align 8
  %120 = getelementptr inbounds %struct.search_site* %119, i64 %116
  %121 = getelementptr inbounds %struct.search_site* %120, i32 0, i32 1
  store i32 %114, i32* %121, align 4
  %122 = load i32* %search_site_count, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %search_site_count, align 4
  %124 = load i32* %Len, align 4
  %125 = trunc i32 %124 to i16
  %126 = load i32* %search_site_count, align 4
  %127 = sext i32 %126 to i64
  %128 = load %struct.macroblock** %1, align 8
  %129 = getelementptr inbounds %struct.macroblock* %128, i32 0, i32 12
  %130 = load %struct.search_site** %129, align 8
  %131 = getelementptr inbounds %struct.search_site* %130, i64 %127
  %132 = getelementptr inbounds %struct.search_site* %131, i32 0, i32 0
  %133 = getelementptr inbounds %struct.MV* %132, i32 0, i32 1
  store i16 %125, i16* %133, align 2
  %134 = load i32* %search_site_count, align 4
  %135 = sext i32 %134 to i64
  %136 = load %struct.macroblock** %1, align 8
  %137 = getelementptr inbounds %struct.macroblock* %136, i32 0, i32 12
  %138 = load %struct.search_site** %137, align 8
  %139 = getelementptr inbounds %struct.search_site* %138, i64 %135
  %140 = getelementptr inbounds %struct.search_site* %139, i32 0, i32 0
  %141 = getelementptr inbounds %struct.MV* %140, i32 0, i32 0
  store i16 0, i16* %141, align 2
  %142 = load i32* %Len, align 4
  %143 = load i32* %search_site_count, align 4
  %144 = sext i32 %143 to i64
  %145 = load %struct.macroblock** %1, align 8
  %146 = getelementptr inbounds %struct.macroblock* %145, i32 0, i32 12
  %147 = load %struct.search_site** %146, align 8
  %148 = getelementptr inbounds %struct.search_site* %147, i64 %144
  %149 = getelementptr inbounds %struct.search_site* %148, i32 0, i32 1
  store i32 %142, i32* %149, align 4
  %150 = load i32* %search_site_count, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %search_site_count, align 4
  %152 = load i32* %Len, align 4
  %153 = sub nsw i32 0, %152
  %154 = trunc i32 %153 to i16
  %155 = load i32* %search_site_count, align 4
  %156 = sext i32 %155 to i64
  %157 = load %struct.macroblock** %1, align 8
  %158 = getelementptr inbounds %struct.macroblock* %157, i32 0, i32 12
  %159 = load %struct.search_site** %158, align 8
  %160 = getelementptr inbounds %struct.search_site* %159, i64 %156
  %161 = getelementptr inbounds %struct.search_site* %160, i32 0, i32 0
  %162 = getelementptr inbounds %struct.MV* %161, i32 0, i32 1
  store i16 %154, i16* %162, align 2
  %163 = load i32* %Len, align 4
  %164 = sub nsw i32 0, %163
  %165 = trunc i32 %164 to i16
  %166 = load i32* %search_site_count, align 4
  %167 = sext i32 %166 to i64
  %168 = load %struct.macroblock** %1, align 8
  %169 = getelementptr inbounds %struct.macroblock* %168, i32 0, i32 12
  %170 = load %struct.search_site** %169, align 8
  %171 = getelementptr inbounds %struct.search_site* %170, i64 %167
  %172 = getelementptr inbounds %struct.search_site* %171, i32 0, i32 0
  %173 = getelementptr inbounds %struct.MV* %172, i32 0, i32 0
  store i16 %165, i16* %173, align 2
  %174 = load i32* %Len, align 4
  %175 = sub nsw i32 0, %174
  %176 = load i32* %2, align 4
  %177 = mul nsw i32 %175, %176
  %178 = load i32* %Len, align 4
  %179 = sub nsw i32 %177, %178
  %180 = load i32* %search_site_count, align 4
  %181 = sext i32 %180 to i64
  %182 = load %struct.macroblock** %1, align 8
  %183 = getelementptr inbounds %struct.macroblock* %182, i32 0, i32 12
  %184 = load %struct.search_site** %183, align 8
  %185 = getelementptr inbounds %struct.search_site* %184, i64 %181
  %186 = getelementptr inbounds %struct.search_site* %185, i32 0, i32 1
  store i32 %179, i32* %186, align 4
  %187 = load i32* %search_site_count, align 4
  %188 = add nsw i32 %187, 1
  store i32 %188, i32* %search_site_count, align 4
  %189 = load i32* %Len, align 4
  %190 = trunc i32 %189 to i16
  %191 = load i32* %search_site_count, align 4
  %192 = sext i32 %191 to i64
  %193 = load %struct.macroblock** %1, align 8
  %194 = getelementptr inbounds %struct.macroblock* %193, i32 0, i32 12
  %195 = load %struct.search_site** %194, align 8
  %196 = getelementptr inbounds %struct.search_site* %195, i64 %192
  %197 = getelementptr inbounds %struct.search_site* %196, i32 0, i32 0
  %198 = getelementptr inbounds %struct.MV* %197, i32 0, i32 1
  store i16 %190, i16* %198, align 2
  %199 = load i32* %Len, align 4
  %200 = sub nsw i32 0, %199
  %201 = trunc i32 %200 to i16
  %202 = load i32* %search_site_count, align 4
  %203 = sext i32 %202 to i64
  %204 = load %struct.macroblock** %1, align 8
  %205 = getelementptr inbounds %struct.macroblock* %204, i32 0, i32 12
  %206 = load %struct.search_site** %205, align 8
  %207 = getelementptr inbounds %struct.search_site* %206, i64 %203
  %208 = getelementptr inbounds %struct.search_site* %207, i32 0, i32 0
  %209 = getelementptr inbounds %struct.MV* %208, i32 0, i32 0
  store i16 %201, i16* %209, align 2
  %210 = load i32* %Len, align 4
  %211 = sub nsw i32 0, %210
  %212 = load i32* %2, align 4
  %213 = mul nsw i32 %211, %212
  %214 = load i32* %Len, align 4
  %215 = add nsw i32 %213, %214
  %216 = load i32* %search_site_count, align 4
  %217 = sext i32 %216 to i64
  %218 = load %struct.macroblock** %1, align 8
  %219 = getelementptr inbounds %struct.macroblock* %218, i32 0, i32 12
  %220 = load %struct.search_site** %219, align 8
  %221 = getelementptr inbounds %struct.search_site* %220, i64 %217
  %222 = getelementptr inbounds %struct.search_site* %221, i32 0, i32 1
  store i32 %215, i32* %222, align 4
  %223 = load i32* %search_site_count, align 4
  %224 = add nsw i32 %223, 1
  store i32 %224, i32* %search_site_count, align 4
  %225 = load i32* %Len, align 4
  %226 = sub nsw i32 0, %225
  %227 = trunc i32 %226 to i16
  %228 = load i32* %search_site_count, align 4
  %229 = sext i32 %228 to i64
  %230 = load %struct.macroblock** %1, align 8
  %231 = getelementptr inbounds %struct.macroblock* %230, i32 0, i32 12
  %232 = load %struct.search_site** %231, align 8
  %233 = getelementptr inbounds %struct.search_site* %232, i64 %229
  %234 = getelementptr inbounds %struct.search_site* %233, i32 0, i32 0
  %235 = getelementptr inbounds %struct.MV* %234, i32 0, i32 1
  store i16 %227, i16* %235, align 2
  %236 = load i32* %Len, align 4
  %237 = trunc i32 %236 to i16
  %238 = load i32* %search_site_count, align 4
  %239 = sext i32 %238 to i64
  %240 = load %struct.macroblock** %1, align 8
  %241 = getelementptr inbounds %struct.macroblock* %240, i32 0, i32 12
  %242 = load %struct.search_site** %241, align 8
  %243 = getelementptr inbounds %struct.search_site* %242, i64 %239
  %244 = getelementptr inbounds %struct.search_site* %243, i32 0, i32 0
  %245 = getelementptr inbounds %struct.MV* %244, i32 0, i32 0
  store i16 %237, i16* %245, align 2
  %246 = load i32* %Len, align 4
  %247 = load i32* %2, align 4
  %248 = mul nsw i32 %246, %247
  %249 = load i32* %Len, align 4
  %250 = sub nsw i32 %248, %249
  %251 = load i32* %search_site_count, align 4
  %252 = sext i32 %251 to i64
  %253 = load %struct.macroblock** %1, align 8
  %254 = getelementptr inbounds %struct.macroblock* %253, i32 0, i32 12
  %255 = load %struct.search_site** %254, align 8
  %256 = getelementptr inbounds %struct.search_site* %255, i64 %252
  %257 = getelementptr inbounds %struct.search_site* %256, i32 0, i32 1
  store i32 %250, i32* %257, align 4
  %258 = load i32* %search_site_count, align 4
  %259 = add nsw i32 %258, 1
  store i32 %259, i32* %search_site_count, align 4
  %260 = load i32* %Len, align 4
  %261 = trunc i32 %260 to i16
  %262 = load i32* %search_site_count, align 4
  %263 = sext i32 %262 to i64
  %264 = load %struct.macroblock** %1, align 8
  %265 = getelementptr inbounds %struct.macroblock* %264, i32 0, i32 12
  %266 = load %struct.search_site** %265, align 8
  %267 = getelementptr inbounds %struct.search_site* %266, i64 %263
  %268 = getelementptr inbounds %struct.search_site* %267, i32 0, i32 0
  %269 = getelementptr inbounds %struct.MV* %268, i32 0, i32 1
  store i16 %261, i16* %269, align 2
  %270 = load i32* %Len, align 4
  %271 = trunc i32 %270 to i16
  %272 = load i32* %search_site_count, align 4
  %273 = sext i32 %272 to i64
  %274 = load %struct.macroblock** %1, align 8
  %275 = getelementptr inbounds %struct.macroblock* %274, i32 0, i32 12
  %276 = load %struct.search_site** %275, align 8
  %277 = getelementptr inbounds %struct.search_site* %276, i64 %273
  %278 = getelementptr inbounds %struct.search_site* %277, i32 0, i32 0
  %279 = getelementptr inbounds %struct.MV* %278, i32 0, i32 0
  store i16 %271, i16* %279, align 2
  %280 = load i32* %Len, align 4
  %281 = load i32* %2, align 4
  %282 = mul nsw i32 %280, %281
  %283 = load i32* %Len, align 4
  %284 = add nsw i32 %282, %283
  %285 = load i32* %search_site_count, align 4
  %286 = sext i32 %285 to i64
  %287 = load %struct.macroblock** %1, align 8
  %288 = getelementptr inbounds %struct.macroblock* %287, i32 0, i32 12
  %289 = load %struct.search_site** %288, align 8
  %290 = getelementptr inbounds %struct.search_site* %289, i64 %286
  %291 = getelementptr inbounds %struct.search_site* %290, i32 0, i32 1
  store i32 %284, i32* %291, align 4
  %292 = load i32* %search_site_count, align 4
  %293 = add nsw i32 %292, 1
  store i32 %293, i32* %search_site_count, align 4
  %294 = load i32* %Len, align 4
  %295 = sdiv i32 %294, 2
  store i32 %295, i32* %Len, align 4
  br label %28

; <label>:296                                     ; preds = %28
  %297 = load i32* %search_site_count, align 4
  %298 = load %struct.macroblock** %1, align 8
  %299 = getelementptr inbounds %struct.macroblock* %298, i32 0, i32 13
  store i32 %297, i32* %299, align 4
  %300 = load %struct.macroblock** %1, align 8
  %301 = getelementptr inbounds %struct.macroblock* %300, i32 0, i32 14
  store i32 8, i32* %301, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @vp8_find_best_sub_pixel_step_iteratively(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32 %error_per_bit, %struct.variance_vtable* %vfp, i32** %mvcost, i32* %distortion, i32* %sse1) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.macroblock*, align 8
  %3 = alloca %struct.block*, align 8
  %4 = alloca %struct.blockd*, align 8
  %5 = alloca %union.int_mv*, align 8
  %6 = alloca %union.int_mv*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.variance_vtable*, align 8
  %9 = alloca i32**, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %z = alloca i8*, align 8
  %rr = alloca i32, align 4
  %rc = alloca i32, align 4
  %br = alloca i32, align 4
  %bc = alloca i32, align 4
  %tr = alloca i32, align 4
  %tc = alloca i32, align 4
  %besterr = alloca i32, align 4
  %left = alloca i32, align 4
  %right = alloca i32, align 4
  %up = alloca i32, align 4
  %down = alloca i32, align 4
  %diag = alloca i32, align 4
  %sse = alloca i32, align 4
  %whichdir = alloca i32, align 4
  %halfiters = alloca i32, align 4
  %quarteriters = alloca i32, align 4
  %thismse = alloca i32, align 4
  %minc = alloca i32, align 4
  %maxc = alloca i32, align 4
  %minr = alloca i32, align 4
  %maxr = alloca i32, align 4
  %y_stride = alloca i32, align 4
  %offset = alloca i32, align 4
  %pre_stride = alloca i32, align 4
  %base_pre = alloca i8*, align 8
  %xd = alloca %struct.macroblockd*, align 8
  %y_0 = alloca i8*, align 8
  %y = alloca i8*, align 8
  %buf_r1 = alloca i32, align 4
  %buf_r2 = alloca i32, align 4
  %buf_c1 = alloca i32, align 4
  store %struct.macroblock* %x, %struct.macroblock** %2, align 8
  store %struct.block* %b, %struct.block** %3, align 8
  store %struct.blockd* %d, %struct.blockd** %4, align 8
  store %union.int_mv* %bestmv, %union.int_mv** %5, align 8
  store %union.int_mv* %ref_mv, %union.int_mv** %6, align 8
  store i32 %error_per_bit, i32* %7, align 4
  store %struct.variance_vtable* %vfp, %struct.variance_vtable** %8, align 8
  store i32** %mvcost, i32*** %9, align 8
  store i32* %distortion, i32** %10, align 8
  store i32* %sse1, i32** %11, align 8
  %12 = load %struct.block** %3, align 8
  %13 = getelementptr inbounds %struct.block* %12, i32 0, i32 9
  %14 = load i8*** %13, align 8
  %15 = load i8** %14, align 8
  %16 = load %struct.block** %3, align 8
  %17 = getelementptr inbounds %struct.block* %16, i32 0, i32 10
  %18 = load i32* %17, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8* %15, i64 %19
  store i8* %20, i8** %z, align 8
  %21 = load %union.int_mv** %6, align 8
  %22 = bitcast %union.int_mv* %21 to %struct.MV*
  %23 = getelementptr inbounds %struct.MV* %22, i32 0, i32 0
  %24 = load i16* %23, align 2
  %25 = sext i16 %24 to i32
  %26 = ashr i32 %25, 1
  store i32 %26, i32* %rr, align 4
  %27 = load %union.int_mv** %6, align 8
  %28 = bitcast %union.int_mv* %27 to %struct.MV*
  %29 = getelementptr inbounds %struct.MV* %28, i32 0, i32 1
  %30 = load i16* %29, align 2
  %31 = sext i16 %30 to i32
  %32 = ashr i32 %31, 1
  store i32 %32, i32* %rc, align 4
  %33 = load %union.int_mv** %5, align 8
  %34 = bitcast %union.int_mv* %33 to %struct.MV*
  %35 = getelementptr inbounds %struct.MV* %34, i32 0, i32 0
  %36 = load i16* %35, align 2
  %37 = sext i16 %36 to i32
  %38 = mul nsw i32 %37, 4
  store i32 %38, i32* %br, align 4
  %39 = load %union.int_mv** %5, align 8
  %40 = bitcast %union.int_mv* %39 to %struct.MV*
  %41 = getelementptr inbounds %struct.MV* %40, i32 0, i32 1
  %42 = load i16* %41, align 2
  %43 = sext i16 %42 to i32
  %44 = mul nsw i32 %43, 4
  store i32 %44, i32* %bc, align 4
  %45 = load i32* %br, align 4
  store i32 %45, i32* %tr, align 4
  %46 = load i32* %bc, align 4
  store i32 %46, i32* %tc, align 4
  store i32 4, i32* %halfiters, align 4
  store i32 4, i32* %quarteriters, align 4
  %47 = load %struct.macroblock** %2, align 8
  %48 = getelementptr inbounds %struct.macroblock* %47, i32 0, i32 31
  %49 = load i32* %48, align 4
  %50 = mul nsw i32 %49, 4
  %51 = load %union.int_mv** %6, align 8
  %52 = bitcast %union.int_mv* %51 to %struct.MV*
  %53 = getelementptr inbounds %struct.MV* %52, i32 0, i32 1
  %54 = load i16* %53, align 2
  %55 = sext i16 %54 to i32
  %56 = ashr i32 %55, 1
  %57 = sub nsw i32 %56, 1023
  %58 = icmp sgt i32 %50, %57
  br i1 %58, label %59, label %64

; <label>:59                                      ; preds = %0
  %60 = load %struct.macroblock** %2, align 8
  %61 = getelementptr inbounds %struct.macroblock* %60, i32 0, i32 31
  %62 = load i32* %61, align 4
  %63 = mul nsw i32 %62, 4
  br label %72

; <label>:64                                      ; preds = %0
  %65 = load %union.int_mv** %6, align 8
  %66 = bitcast %union.int_mv* %65 to %struct.MV*
  %67 = getelementptr inbounds %struct.MV* %66, i32 0, i32 1
  %68 = load i16* %67, align 2
  %69 = sext i16 %68 to i32
  %70 = ashr i32 %69, 1
  %71 = sub nsw i32 %70, 1023
  br label %72

; <label>:72                                      ; preds = %64, %59
  %73 = phi i32 [ %63, %59 ], [ %71, %64 ]
  store i32 %73, i32* %minc, align 4
  %74 = load %struct.macroblock** %2, align 8
  %75 = getelementptr inbounds %struct.macroblock* %74, i32 0, i32 32
  %76 = load i32* %75, align 4
  %77 = mul nsw i32 %76, 4
  %78 = load %union.int_mv** %6, align 8
  %79 = bitcast %union.int_mv* %78 to %struct.MV*
  %80 = getelementptr inbounds %struct.MV* %79, i32 0, i32 1
  %81 = load i16* %80, align 2
  %82 = sext i16 %81 to i32
  %83 = ashr i32 %82, 1
  %84 = add nsw i32 %83, 1023
  %85 = icmp slt i32 %77, %84
  br i1 %85, label %86, label %91

; <label>:86                                      ; preds = %72
  %87 = load %struct.macroblock** %2, align 8
  %88 = getelementptr inbounds %struct.macroblock* %87, i32 0, i32 32
  %89 = load i32* %88, align 4
  %90 = mul nsw i32 %89, 4
  br label %99

; <label>:91                                      ; preds = %72
  %92 = load %union.int_mv** %6, align 8
  %93 = bitcast %union.int_mv* %92 to %struct.MV*
  %94 = getelementptr inbounds %struct.MV* %93, i32 0, i32 1
  %95 = load i16* %94, align 2
  %96 = sext i16 %95 to i32
  %97 = ashr i32 %96, 1
  %98 = add nsw i32 %97, 1023
  br label %99

; <label>:99                                      ; preds = %91, %86
  %100 = phi i32 [ %90, %86 ], [ %98, %91 ]
  store i32 %100, i32* %maxc, align 4
  %101 = load %struct.macroblock** %2, align 8
  %102 = getelementptr inbounds %struct.macroblock* %101, i32 0, i32 33
  %103 = load i32* %102, align 4
  %104 = mul nsw i32 %103, 4
  %105 = load %union.int_mv** %6, align 8
  %106 = bitcast %union.int_mv* %105 to %struct.MV*
  %107 = getelementptr inbounds %struct.MV* %106, i32 0, i32 0
  %108 = load i16* %107, align 2
  %109 = sext i16 %108 to i32
  %110 = ashr i32 %109, 1
  %111 = sub nsw i32 %110, 1023
  %112 = icmp sgt i32 %104, %111
  br i1 %112, label %113, label %118

; <label>:113                                     ; preds = %99
  %114 = load %struct.macroblock** %2, align 8
  %115 = getelementptr inbounds %struct.macroblock* %114, i32 0, i32 33
  %116 = load i32* %115, align 4
  %117 = mul nsw i32 %116, 4
  br label %126

; <label>:118                                     ; preds = %99
  %119 = load %union.int_mv** %6, align 8
  %120 = bitcast %union.int_mv* %119 to %struct.MV*
  %121 = getelementptr inbounds %struct.MV* %120, i32 0, i32 0
  %122 = load i16* %121, align 2
  %123 = sext i16 %122 to i32
  %124 = ashr i32 %123, 1
  %125 = sub nsw i32 %124, 1023
  br label %126

; <label>:126                                     ; preds = %118, %113
  %127 = phi i32 [ %117, %113 ], [ %125, %118 ]
  store i32 %127, i32* %minr, align 4
  %128 = load %struct.macroblock** %2, align 8
  %129 = getelementptr inbounds %struct.macroblock* %128, i32 0, i32 34
  %130 = load i32* %129, align 4
  %131 = mul nsw i32 %130, 4
  %132 = load %union.int_mv** %6, align 8
  %133 = bitcast %union.int_mv* %132 to %struct.MV*
  %134 = getelementptr inbounds %struct.MV* %133, i32 0, i32 0
  %135 = load i16* %134, align 2
  %136 = sext i16 %135 to i32
  %137 = ashr i32 %136, 1
  %138 = add nsw i32 %137, 1023
  %139 = icmp slt i32 %131, %138
  br i1 %139, label %140, label %145

; <label>:140                                     ; preds = %126
  %141 = load %struct.macroblock** %2, align 8
  %142 = getelementptr inbounds %struct.macroblock* %141, i32 0, i32 34
  %143 = load i32* %142, align 4
  %144 = mul nsw i32 %143, 4
  br label %153

; <label>:145                                     ; preds = %126
  %146 = load %union.int_mv** %6, align 8
  %147 = bitcast %union.int_mv* %146 to %struct.MV*
  %148 = getelementptr inbounds %struct.MV* %147, i32 0, i32 0
  %149 = load i16* %148, align 2
  %150 = sext i16 %149 to i32
  %151 = ashr i32 %150, 1
  %152 = add nsw i32 %151, 1023
  br label %153

; <label>:153                                     ; preds = %145, %140
  %154 = phi i32 [ %144, %140 ], [ %152, %145 ]
  store i32 %154, i32* %maxr, align 4
  %155 = load %struct.macroblock** %2, align 8
  %156 = getelementptr inbounds %struct.macroblock* %155, i32 0, i32 7
  %157 = getelementptr inbounds %struct.macroblockd* %156, i32 0, i32 11
  %158 = getelementptr inbounds %struct.yv12_buffer_config* %157, i32 0, i32 4
  %159 = load i32* %158, align 4
  store i32 %159, i32* %pre_stride, align 4
  %160 = load %struct.macroblock** %2, align 8
  %161 = getelementptr inbounds %struct.macroblock* %160, i32 0, i32 7
  %162 = getelementptr inbounds %struct.macroblockd* %161, i32 0, i32 11
  %163 = getelementptr inbounds %struct.yv12_buffer_config* %162, i32 0, i32 13
  %164 = load i8** %163, align 8
  store i8* %164, i8** %base_pre, align 8
  %165 = load %struct.macroblock** %2, align 8
  %166 = getelementptr inbounds %struct.macroblock* %165, i32 0, i32 7
  store %struct.macroblockd* %166, %struct.macroblockd** %xd, align 8
  %167 = load i8** %base_pre, align 8
  %168 = load %struct.blockd** %4, align 8
  %169 = getelementptr inbounds %struct.blockd* %168, i32 0, i32 4
  %170 = load i32* %169, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds i8* %167, i64 %171
  %173 = load %union.int_mv** %5, align 8
  %174 = bitcast %union.int_mv* %173 to %struct.MV*
  %175 = getelementptr inbounds %struct.MV* %174, i32 0, i32 0
  %176 = load i16* %175, align 2
  %177 = sext i16 %176 to i32
  %178 = load i32* %pre_stride, align 4
  %179 = mul nsw i32 %177, %178
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds i8* %172, i64 %180
  %182 = load %union.int_mv** %5, align 8
  %183 = bitcast %union.int_mv* %182 to %struct.MV*
  %184 = getelementptr inbounds %struct.MV* %183, i32 0, i32 1
  %185 = load i16* %184, align 2
  %186 = sext i16 %185 to i32
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i8* %181, i64 %187
  store i8* %188, i8** %y_0, align 8
  %189 = load %union.int_mv** %5, align 8
  %190 = bitcast %union.int_mv* %189 to %struct.MV*
  %191 = getelementptr inbounds %struct.MV* %190, i32 0, i32 0
  %192 = load i16* %191, align 2
  %193 = sext i16 %192 to i32
  %194 = sub nsw i32 %193, 3
  %195 = load %struct.macroblock** %2, align 8
  %196 = getelementptr inbounds %struct.macroblock* %195, i32 0, i32 33
  %197 = load i32* %196, align 4
  %198 = icmp slt i32 %194, %197
  br i1 %198, label %199, label %209

; <label>:199                                     ; preds = %153
  %200 = load %union.int_mv** %5, align 8
  %201 = bitcast %union.int_mv* %200 to %struct.MV*
  %202 = getelementptr inbounds %struct.MV* %201, i32 0, i32 0
  %203 = load i16* %202, align 2
  %204 = sext i16 %203 to i32
  %205 = load %struct.macroblock** %2, align 8
  %206 = getelementptr inbounds %struct.macroblock* %205, i32 0, i32 33
  %207 = load i32* %206, align 4
  %208 = sub nsw i32 %204, %207
  br label %210

; <label>:209                                     ; preds = %153
  br label %210

; <label>:210                                     ; preds = %209, %199
  %211 = phi i32 [ %208, %199 ], [ 3, %209 ]
  store i32 %211, i32* %buf_r1, align 4
  %212 = load %union.int_mv** %5, align 8
  %213 = bitcast %union.int_mv* %212 to %struct.MV*
  %214 = getelementptr inbounds %struct.MV* %213, i32 0, i32 0
  %215 = load i16* %214, align 2
  %216 = sext i16 %215 to i32
  %217 = add nsw i32 %216, 3
  %218 = load %struct.macroblock** %2, align 8
  %219 = getelementptr inbounds %struct.macroblock* %218, i32 0, i32 34
  %220 = load i32* %219, align 4
  %221 = icmp sgt i32 %217, %220
  br i1 %221, label %222, label %232

; <label>:222                                     ; preds = %210
  %223 = load %struct.macroblock** %2, align 8
  %224 = getelementptr inbounds %struct.macroblock* %223, i32 0, i32 34
  %225 = load i32* %224, align 4
  %226 = load %union.int_mv** %5, align 8
  %227 = bitcast %union.int_mv* %226 to %struct.MV*
  %228 = getelementptr inbounds %struct.MV* %227, i32 0, i32 0
  %229 = load i16* %228, align 2
  %230 = sext i16 %229 to i32
  %231 = sub nsw i32 %225, %230
  br label %233

; <label>:232                                     ; preds = %210
  br label %233

; <label>:233                                     ; preds = %232, %222
  %234 = phi i32 [ %231, %222 ], [ 3, %232 ]
  store i32 %234, i32* %buf_r2, align 4
  %235 = load %union.int_mv** %5, align 8
  %236 = bitcast %union.int_mv* %235 to %struct.MV*
  %237 = getelementptr inbounds %struct.MV* %236, i32 0, i32 1
  %238 = load i16* %237, align 2
  %239 = sext i16 %238 to i32
  %240 = sub nsw i32 %239, 3
  %241 = load %struct.macroblock** %2, align 8
  %242 = getelementptr inbounds %struct.macroblock* %241, i32 0, i32 31
  %243 = load i32* %242, align 4
  %244 = icmp slt i32 %240, %243
  br i1 %244, label %245, label %255

; <label>:245                                     ; preds = %233
  %246 = load %union.int_mv** %5, align 8
  %247 = bitcast %union.int_mv* %246 to %struct.MV*
  %248 = getelementptr inbounds %struct.MV* %247, i32 0, i32 1
  %249 = load i16* %248, align 2
  %250 = sext i16 %249 to i32
  %251 = load %struct.macroblock** %2, align 8
  %252 = getelementptr inbounds %struct.macroblock* %251, i32 0, i32 31
  %253 = load i32* %252, align 4
  %254 = sub nsw i32 %250, %253
  br label %256

; <label>:255                                     ; preds = %233
  br label %256

; <label>:256                                     ; preds = %255, %245
  %257 = phi i32 [ %254, %245 ], [ 3, %255 ]
  store i32 %257, i32* %buf_c1, align 4
  store i32 32, i32* %y_stride, align 4
  %258 = load %struct.variance_vtable** %8, align 8
  %259 = getelementptr inbounds %struct.variance_vtable* %258, i32 0, i32 9
  %260 = load void (i8*, i32, i8*, i32, i32)** %259, align 8
  %261 = load i8** %y_0, align 8
  %262 = load i32* %buf_c1, align 4
  %263 = sext i32 %262 to i64
  %264 = sub i64 0, %263
  %265 = getelementptr inbounds i8* %261, i64 %264
  %266 = load i32* %pre_stride, align 4
  %267 = load i32* %buf_r1, align 4
  %268 = mul nsw i32 %266, %267
  %269 = sext i32 %268 to i64
  %270 = sub i64 0, %269
  %271 = getelementptr inbounds i8* %265, i64 %270
  %272 = load i32* %pre_stride, align 4
  %273 = load %struct.macroblockd** %xd, align 8
  %274 = getelementptr inbounds %struct.macroblockd* %273, i32 0, i32 46
  %275 = getelementptr inbounds [704 x i8]* %274, i32 0, i32 0
  %276 = load i32* %y_stride, align 4
  %277 = load i32* %buf_r1, align 4
  %278 = add nsw i32 16, %277
  %279 = load i32* %buf_r2, align 4
  %280 = add nsw i32 %278, %279
  call void %260(i8* %271, i32 %272, i8* %275, i32 %276, i32 %280)
  %281 = load %struct.macroblockd** %xd, align 8
  %282 = getelementptr inbounds %struct.macroblockd* %281, i32 0, i32 46
  %283 = getelementptr inbounds [704 x i8]* %282, i32 0, i32 0
  %284 = load i32* %y_stride, align 4
  %285 = load i32* %buf_r1, align 4
  %286 = mul nsw i32 %284, %285
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds i8* %283, i64 %287
  %289 = load i32* %buf_c1, align 4
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i8* %288, i64 %290
  store i8* %291, i8** %y, align 8
  %292 = load %union.int_mv** %5, align 8
  %293 = bitcast %union.int_mv* %292 to %struct.MV*
  %294 = getelementptr inbounds %struct.MV* %293, i32 0, i32 0
  %295 = load i16* %294, align 2
  %296 = sext i16 %295 to i32
  %297 = load i32* %y_stride, align 4
  %298 = mul nsw i32 %296, %297
  %299 = load %union.int_mv** %5, align 8
  %300 = bitcast %union.int_mv* %299 to %struct.MV*
  %301 = getelementptr inbounds %struct.MV* %300, i32 0, i32 1
  %302 = load i16* %301, align 2
  %303 = sext i16 %302 to i32
  %304 = add nsw i32 %298, %303
  store i32 %304, i32* %offset, align 4
  %305 = load %union.int_mv** %5, align 8
  %306 = bitcast %union.int_mv* %305 to %struct.MV*
  %307 = getelementptr inbounds %struct.MV* %306, i32 0, i32 0
  %308 = load i16* %307, align 2
  %309 = sext i16 %308 to i32
  %310 = mul nsw i32 %309, 8
  %311 = trunc i32 %310 to i16
  store i16 %311, i16* %307, align 2
  %312 = load %union.int_mv** %5, align 8
  %313 = bitcast %union.int_mv* %312 to %struct.MV*
  %314 = getelementptr inbounds %struct.MV* %313, i32 0, i32 1
  %315 = load i16* %314, align 2
  %316 = sext i16 %315 to i32
  %317 = mul nsw i32 %316, 8
  %318 = trunc i32 %317 to i16
  store i16 %318, i16* %314, align 2
  %319 = load %struct.variance_vtable** %8, align 8
  %320 = getelementptr inbounds %struct.variance_vtable* %319, i32 0, i32 1
  %321 = load i32 (i8*, i32, i8*, i32, i32*)** %320, align 8
  %322 = load i8** %y, align 8
  %323 = load i32* %y_stride, align 4
  %324 = load i8** %z, align 8
  %325 = load %struct.block** %3, align 8
  %326 = getelementptr inbounds %struct.block* %325, i32 0, i32 11
  %327 = load i32* %326, align 4
  %328 = load i32** %11, align 8
  %329 = call i32 %321(i8* %322, i32 %323, i8* %324, i32 %327, i32* %328)
  store i32 %329, i32* %besterr, align 4
  %330 = load i32* %besterr, align 4
  %331 = load i32** %10, align 8
  store i32 %330, i32* %331, align 4
  %332 = load %union.int_mv** %5, align 8
  %333 = load %union.int_mv** %6, align 8
  %334 = load i32*** %9, align 8
  %335 = load i32* %7, align 4
  %336 = call i32 @mv_err_cost(%union.int_mv* %332, %union.int_mv* %333, i32** %334, i32 %335)
  %337 = load i32* %besterr, align 4
  %338 = add i32 %337, %336
  store i32 %338, i32* %besterr, align 4
  br label %339

; <label>:339                                     ; preds = %1135, %256
  %340 = load i32* %halfiters, align 4
  %341 = add i32 %340, -1
  store i32 %341, i32* %halfiters, align 4
  %342 = icmp ne i32 %341, 0
  br i1 %342, label %343, label %1138

; <label>:343                                     ; preds = %339
  %344 = load i32* %tc, align 4
  %345 = sub nsw i32 %344, 2
  %346 = load i32* %minc, align 4
  %347 = icmp sge i32 %345, %346
  br i1 %347, label %348, label %435

; <label>:348                                     ; preds = %343
  %349 = load i32* %tc, align 4
  %350 = sub nsw i32 %349, 2
  %351 = load i32* %maxc, align 4
  %352 = icmp sle i32 %350, %351
  br i1 %352, label %353, label %435

; <label>:353                                     ; preds = %348
  %354 = load i32* %tr, align 4
  %355 = load i32* %minr, align 4
  %356 = icmp sge i32 %354, %355
  br i1 %356, label %357, label %435

; <label>:357                                     ; preds = %353
  %358 = load i32* %tr, align 4
  %359 = load i32* %maxr, align 4
  %360 = icmp sle i32 %358, %359
  br i1 %360, label %361, label %435

; <label>:361                                     ; preds = %357
  %362 = load %struct.variance_vtable** %8, align 8
  %363 = getelementptr inbounds %struct.variance_vtable* %362, i32 0, i32 2
  %364 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %363, align 8
  %365 = load i8** %y, align 8
  %366 = load i32* %tr, align 4
  %367 = ashr i32 %366, 2
  %368 = load i32* %y_stride, align 4
  %369 = mul nsw i32 %367, %368
  %370 = load i32* %tc, align 4
  %371 = sub nsw i32 %370, 2
  %372 = ashr i32 %371, 2
  %373 = add nsw i32 %369, %372
  %374 = load i32* %offset, align 4
  %375 = sub nsw i32 %373, %374
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds i8* %365, i64 %376
  %378 = load i32* %y_stride, align 4
  %379 = load i32* %tc, align 4
  %380 = sub nsw i32 %379, 2
  %381 = and i32 %380, 3
  %382 = shl i32 %381, 1
  %383 = load i32* %tr, align 4
  %384 = and i32 %383, 3
  %385 = shl i32 %384, 1
  %386 = load i8** %z, align 8
  %387 = load %struct.block** %3, align 8
  %388 = getelementptr inbounds %struct.block* %387, i32 0, i32 11
  %389 = load i32* %388, align 4
  %390 = call i32 %364(i8* %377, i32 %378, i32 %382, i32 %385, i8* %386, i32 %389, i32* %sse)
  store i32 %390, i32* %thismse, align 4
  %391 = load i32*** %9, align 8
  %392 = icmp ne i32** %391, null
  br i1 %392, label %393, label %418

; <label>:393                                     ; preds = %361
  %394 = load i32* %tr, align 4
  %395 = load i32* %rr, align 4
  %396 = sub nsw i32 %394, %395
  %397 = sext i32 %396 to i64
  %398 = load i32*** %9, align 8
  %399 = getelementptr inbounds i32** %398, i64 0
  %400 = load i32** %399, align 8
  %401 = getelementptr inbounds i32* %400, i64 %397
  %402 = load i32* %401, align 4
  %403 = load i32* %tc, align 4
  %404 = sub nsw i32 %403, 2
  %405 = load i32* %rc, align 4
  %406 = sub nsw i32 %404, %405
  %407 = sext i32 %406 to i64
  %408 = load i32*** %9, align 8
  %409 = getelementptr inbounds i32** %408, i64 1
  %410 = load i32** %409, align 8
  %411 = getelementptr inbounds i32* %410, i64 %407
  %412 = load i32* %411, align 4
  %413 = add nsw i32 %402, %412
  %414 = load i32* %7, align 4
  %415 = mul nsw i32 %413, %414
  %416 = add nsw i32 %415, 128
  %417 = ashr i32 %416, 8
  br label %419

; <label>:418                                     ; preds = %361
  br label %419

; <label>:419                                     ; preds = %418, %393
  %420 = phi i32 [ %417, %393 ], [ 0, %418 ]
  %421 = load i32* %thismse, align 4
  %422 = add nsw i32 %420, %421
  store i32 %422, i32* %left, align 4
  %423 = load i32* %besterr, align 4
  %424 = icmp ult i32 %422, %423
  br i1 %424, label %425, label %434

; <label>:425                                     ; preds = %419
  %426 = load i32* %left, align 4
  store i32 %426, i32* %besterr, align 4
  %427 = load i32* %tr, align 4
  store i32 %427, i32* %br, align 4
  %428 = load i32* %tc, align 4
  %429 = sub nsw i32 %428, 2
  store i32 %429, i32* %bc, align 4
  %430 = load i32* %thismse, align 4
  %431 = load i32** %10, align 8
  store i32 %430, i32* %431, align 4
  %432 = load i32* %sse, align 4
  %433 = load i32** %11, align 8
  store i32 %432, i32* %433, align 4
  br label %434

; <label>:434                                     ; preds = %425, %419
  br label %436

; <label>:435                                     ; preds = %357, %353, %348, %343
  store i32 -1, i32* %left, align 4
  br label %436

; <label>:436                                     ; preds = %435, %434
  %437 = load i32* %tc, align 4
  %438 = add nsw i32 %437, 2
  %439 = load i32* %minc, align 4
  %440 = icmp sge i32 %438, %439
  br i1 %440, label %441, label %528

; <label>:441                                     ; preds = %436
  %442 = load i32* %tc, align 4
  %443 = add nsw i32 %442, 2
  %444 = load i32* %maxc, align 4
  %445 = icmp sle i32 %443, %444
  br i1 %445, label %446, label %528

; <label>:446                                     ; preds = %441
  %447 = load i32* %tr, align 4
  %448 = load i32* %minr, align 4
  %449 = icmp sge i32 %447, %448
  br i1 %449, label %450, label %528

; <label>:450                                     ; preds = %446
  %451 = load i32* %tr, align 4
  %452 = load i32* %maxr, align 4
  %453 = icmp sle i32 %451, %452
  br i1 %453, label %454, label %528

; <label>:454                                     ; preds = %450
  %455 = load %struct.variance_vtable** %8, align 8
  %456 = getelementptr inbounds %struct.variance_vtable* %455, i32 0, i32 2
  %457 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %456, align 8
  %458 = load i8** %y, align 8
  %459 = load i32* %tr, align 4
  %460 = ashr i32 %459, 2
  %461 = load i32* %y_stride, align 4
  %462 = mul nsw i32 %460, %461
  %463 = load i32* %tc, align 4
  %464 = add nsw i32 %463, 2
  %465 = ashr i32 %464, 2
  %466 = add nsw i32 %462, %465
  %467 = load i32* %offset, align 4
  %468 = sub nsw i32 %466, %467
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds i8* %458, i64 %469
  %471 = load i32* %y_stride, align 4
  %472 = load i32* %tc, align 4
  %473 = add nsw i32 %472, 2
  %474 = and i32 %473, 3
  %475 = shl i32 %474, 1
  %476 = load i32* %tr, align 4
  %477 = and i32 %476, 3
  %478 = shl i32 %477, 1
  %479 = load i8** %z, align 8
  %480 = load %struct.block** %3, align 8
  %481 = getelementptr inbounds %struct.block* %480, i32 0, i32 11
  %482 = load i32* %481, align 4
  %483 = call i32 %457(i8* %470, i32 %471, i32 %475, i32 %478, i8* %479, i32 %482, i32* %sse)
  store i32 %483, i32* %thismse, align 4
  %484 = load i32*** %9, align 8
  %485 = icmp ne i32** %484, null
  br i1 %485, label %486, label %511

; <label>:486                                     ; preds = %454
  %487 = load i32* %tr, align 4
  %488 = load i32* %rr, align 4
  %489 = sub nsw i32 %487, %488
  %490 = sext i32 %489 to i64
  %491 = load i32*** %9, align 8
  %492 = getelementptr inbounds i32** %491, i64 0
  %493 = load i32** %492, align 8
  %494 = getelementptr inbounds i32* %493, i64 %490
  %495 = load i32* %494, align 4
  %496 = load i32* %tc, align 4
  %497 = add nsw i32 %496, 2
  %498 = load i32* %rc, align 4
  %499 = sub nsw i32 %497, %498
  %500 = sext i32 %499 to i64
  %501 = load i32*** %9, align 8
  %502 = getelementptr inbounds i32** %501, i64 1
  %503 = load i32** %502, align 8
  %504 = getelementptr inbounds i32* %503, i64 %500
  %505 = load i32* %504, align 4
  %506 = add nsw i32 %495, %505
  %507 = load i32* %7, align 4
  %508 = mul nsw i32 %506, %507
  %509 = add nsw i32 %508, 128
  %510 = ashr i32 %509, 8
  br label %512

; <label>:511                                     ; preds = %454
  br label %512

; <label>:512                                     ; preds = %511, %486
  %513 = phi i32 [ %510, %486 ], [ 0, %511 ]
  %514 = load i32* %thismse, align 4
  %515 = add nsw i32 %513, %514
  store i32 %515, i32* %right, align 4
  %516 = load i32* %besterr, align 4
  %517 = icmp ult i32 %515, %516
  br i1 %517, label %518, label %527

; <label>:518                                     ; preds = %512
  %519 = load i32* %right, align 4
  store i32 %519, i32* %besterr, align 4
  %520 = load i32* %tr, align 4
  store i32 %520, i32* %br, align 4
  %521 = load i32* %tc, align 4
  %522 = add nsw i32 %521, 2
  store i32 %522, i32* %bc, align 4
  %523 = load i32* %thismse, align 4
  %524 = load i32** %10, align 8
  store i32 %523, i32* %524, align 4
  %525 = load i32* %sse, align 4
  %526 = load i32** %11, align 8
  store i32 %525, i32* %526, align 4
  br label %527

; <label>:527                                     ; preds = %518, %512
  br label %529

; <label>:528                                     ; preds = %450, %446, %441, %436
  store i32 -1, i32* %right, align 4
  br label %529

; <label>:529                                     ; preds = %528, %527
  %530 = load i32* %tc, align 4
  %531 = load i32* %minc, align 4
  %532 = icmp sge i32 %530, %531
  br i1 %532, label %533, label %621

; <label>:533                                     ; preds = %529
  %534 = load i32* %tc, align 4
  %535 = load i32* %maxc, align 4
  %536 = icmp sle i32 %534, %535
  br i1 %536, label %537, label %621

; <label>:537                                     ; preds = %533
  %538 = load i32* %tr, align 4
  %539 = sub nsw i32 %538, 2
  %540 = load i32* %minr, align 4
  %541 = icmp sge i32 %539, %540
  br i1 %541, label %542, label %621

; <label>:542                                     ; preds = %537
  %543 = load i32* %tr, align 4
  %544 = sub nsw i32 %543, 2
  %545 = load i32* %maxr, align 4
  %546 = icmp sle i32 %544, %545
  br i1 %546, label %547, label %621

; <label>:547                                     ; preds = %542
  %548 = load %struct.variance_vtable** %8, align 8
  %549 = getelementptr inbounds %struct.variance_vtable* %548, i32 0, i32 2
  %550 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %549, align 8
  %551 = load i8** %y, align 8
  %552 = load i32* %tr, align 4
  %553 = sub nsw i32 %552, 2
  %554 = ashr i32 %553, 2
  %555 = load i32* %y_stride, align 4
  %556 = mul nsw i32 %554, %555
  %557 = load i32* %tc, align 4
  %558 = ashr i32 %557, 2
  %559 = add nsw i32 %556, %558
  %560 = load i32* %offset, align 4
  %561 = sub nsw i32 %559, %560
  %562 = sext i32 %561 to i64
  %563 = getelementptr inbounds i8* %551, i64 %562
  %564 = load i32* %y_stride, align 4
  %565 = load i32* %tc, align 4
  %566 = and i32 %565, 3
  %567 = shl i32 %566, 1
  %568 = load i32* %tr, align 4
  %569 = sub nsw i32 %568, 2
  %570 = and i32 %569, 3
  %571 = shl i32 %570, 1
  %572 = load i8** %z, align 8
  %573 = load %struct.block** %3, align 8
  %574 = getelementptr inbounds %struct.block* %573, i32 0, i32 11
  %575 = load i32* %574, align 4
  %576 = call i32 %550(i8* %563, i32 %564, i32 %567, i32 %571, i8* %572, i32 %575, i32* %sse)
  store i32 %576, i32* %thismse, align 4
  %577 = load i32*** %9, align 8
  %578 = icmp ne i32** %577, null
  br i1 %578, label %579, label %604

; <label>:579                                     ; preds = %547
  %580 = load i32* %tr, align 4
  %581 = sub nsw i32 %580, 2
  %582 = load i32* %rr, align 4
  %583 = sub nsw i32 %581, %582
  %584 = sext i32 %583 to i64
  %585 = load i32*** %9, align 8
  %586 = getelementptr inbounds i32** %585, i64 0
  %587 = load i32** %586, align 8
  %588 = getelementptr inbounds i32* %587, i64 %584
  %589 = load i32* %588, align 4
  %590 = load i32* %tc, align 4
  %591 = load i32* %rc, align 4
  %592 = sub nsw i32 %590, %591
  %593 = sext i32 %592 to i64
  %594 = load i32*** %9, align 8
  %595 = getelementptr inbounds i32** %594, i64 1
  %596 = load i32** %595, align 8
  %597 = getelementptr inbounds i32* %596, i64 %593
  %598 = load i32* %597, align 4
  %599 = add nsw i32 %589, %598
  %600 = load i32* %7, align 4
  %601 = mul nsw i32 %599, %600
  %602 = add nsw i32 %601, 128
  %603 = ashr i32 %602, 8
  br label %605

; <label>:604                                     ; preds = %547
  br label %605

; <label>:605                                     ; preds = %604, %579
  %606 = phi i32 [ %603, %579 ], [ 0, %604 ]
  %607 = load i32* %thismse, align 4
  %608 = add nsw i32 %606, %607
  store i32 %608, i32* %up, align 4
  %609 = load i32* %besterr, align 4
  %610 = icmp ult i32 %608, %609
  br i1 %610, label %611, label %620

; <label>:611                                     ; preds = %605
  %612 = load i32* %up, align 4
  store i32 %612, i32* %besterr, align 4
  %613 = load i32* %tr, align 4
  %614 = sub nsw i32 %613, 2
  store i32 %614, i32* %br, align 4
  %615 = load i32* %tc, align 4
  store i32 %615, i32* %bc, align 4
  %616 = load i32* %thismse, align 4
  %617 = load i32** %10, align 8
  store i32 %616, i32* %617, align 4
  %618 = load i32* %sse, align 4
  %619 = load i32** %11, align 8
  store i32 %618, i32* %619, align 4
  br label %620

; <label>:620                                     ; preds = %611, %605
  br label %622

; <label>:621                                     ; preds = %542, %537, %533, %529
  store i32 -1, i32* %up, align 4
  br label %622

; <label>:622                                     ; preds = %621, %620
  %623 = load i32* %tc, align 4
  %624 = load i32* %minc, align 4
  %625 = icmp sge i32 %623, %624
  br i1 %625, label %626, label %714

; <label>:626                                     ; preds = %622
  %627 = load i32* %tc, align 4
  %628 = load i32* %maxc, align 4
  %629 = icmp sle i32 %627, %628
  br i1 %629, label %630, label %714

; <label>:630                                     ; preds = %626
  %631 = load i32* %tr, align 4
  %632 = add nsw i32 %631, 2
  %633 = load i32* %minr, align 4
  %634 = icmp sge i32 %632, %633
  br i1 %634, label %635, label %714

; <label>:635                                     ; preds = %630
  %636 = load i32* %tr, align 4
  %637 = add nsw i32 %636, 2
  %638 = load i32* %maxr, align 4
  %639 = icmp sle i32 %637, %638
  br i1 %639, label %640, label %714

; <label>:640                                     ; preds = %635
  %641 = load %struct.variance_vtable** %8, align 8
  %642 = getelementptr inbounds %struct.variance_vtable* %641, i32 0, i32 2
  %643 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %642, align 8
  %644 = load i8** %y, align 8
  %645 = load i32* %tr, align 4
  %646 = add nsw i32 %645, 2
  %647 = ashr i32 %646, 2
  %648 = load i32* %y_stride, align 4
  %649 = mul nsw i32 %647, %648
  %650 = load i32* %tc, align 4
  %651 = ashr i32 %650, 2
  %652 = add nsw i32 %649, %651
  %653 = load i32* %offset, align 4
  %654 = sub nsw i32 %652, %653
  %655 = sext i32 %654 to i64
  %656 = getelementptr inbounds i8* %644, i64 %655
  %657 = load i32* %y_stride, align 4
  %658 = load i32* %tc, align 4
  %659 = and i32 %658, 3
  %660 = shl i32 %659, 1
  %661 = load i32* %tr, align 4
  %662 = add nsw i32 %661, 2
  %663 = and i32 %662, 3
  %664 = shl i32 %663, 1
  %665 = load i8** %z, align 8
  %666 = load %struct.block** %3, align 8
  %667 = getelementptr inbounds %struct.block* %666, i32 0, i32 11
  %668 = load i32* %667, align 4
  %669 = call i32 %643(i8* %656, i32 %657, i32 %660, i32 %664, i8* %665, i32 %668, i32* %sse)
  store i32 %669, i32* %thismse, align 4
  %670 = load i32*** %9, align 8
  %671 = icmp ne i32** %670, null
  br i1 %671, label %672, label %697

; <label>:672                                     ; preds = %640
  %673 = load i32* %tr, align 4
  %674 = add nsw i32 %673, 2
  %675 = load i32* %rr, align 4
  %676 = sub nsw i32 %674, %675
  %677 = sext i32 %676 to i64
  %678 = load i32*** %9, align 8
  %679 = getelementptr inbounds i32** %678, i64 0
  %680 = load i32** %679, align 8
  %681 = getelementptr inbounds i32* %680, i64 %677
  %682 = load i32* %681, align 4
  %683 = load i32* %tc, align 4
  %684 = load i32* %rc, align 4
  %685 = sub nsw i32 %683, %684
  %686 = sext i32 %685 to i64
  %687 = load i32*** %9, align 8
  %688 = getelementptr inbounds i32** %687, i64 1
  %689 = load i32** %688, align 8
  %690 = getelementptr inbounds i32* %689, i64 %686
  %691 = load i32* %690, align 4
  %692 = add nsw i32 %682, %691
  %693 = load i32* %7, align 4
  %694 = mul nsw i32 %692, %693
  %695 = add nsw i32 %694, 128
  %696 = ashr i32 %695, 8
  br label %698

; <label>:697                                     ; preds = %640
  br label %698

; <label>:698                                     ; preds = %697, %672
  %699 = phi i32 [ %696, %672 ], [ 0, %697 ]
  %700 = load i32* %thismse, align 4
  %701 = add nsw i32 %699, %700
  store i32 %701, i32* %down, align 4
  %702 = load i32* %besterr, align 4
  %703 = icmp ult i32 %701, %702
  br i1 %703, label %704, label %713

; <label>:704                                     ; preds = %698
  %705 = load i32* %down, align 4
  store i32 %705, i32* %besterr, align 4
  %706 = load i32* %tr, align 4
  %707 = add nsw i32 %706, 2
  store i32 %707, i32* %br, align 4
  %708 = load i32* %tc, align 4
  store i32 %708, i32* %bc, align 4
  %709 = load i32* %thismse, align 4
  %710 = load i32** %10, align 8
  store i32 %709, i32* %710, align 4
  %711 = load i32* %sse, align 4
  %712 = load i32** %11, align 8
  store i32 %711, i32* %712, align 4
  br label %713

; <label>:713                                     ; preds = %704, %698
  br label %715

; <label>:714                                     ; preds = %635, %630, %626, %622
  store i32 -1, i32* %down, align 4
  br label %715

; <label>:715                                     ; preds = %714, %713
  %716 = load i32* %left, align 4
  %717 = load i32* %right, align 4
  %718 = icmp ult i32 %716, %717
  %719 = select i1 %718, i32 0, i32 1
  %720 = load i32* %up, align 4
  %721 = load i32* %down, align 4
  %722 = icmp ult i32 %720, %721
  %723 = select i1 %722, i32 0, i32 2
  %724 = add nsw i32 %719, %723
  store i32 %724, i32* %whichdir, align 4
  %725 = load i32* %whichdir, align 4
  switch i32 %725, label %1126 [
    i32 0, label %726
    i32 1, label %826
    i32 2, label %926
    i32 3, label %1026
  ]

; <label>:726                                     ; preds = %715
  %727 = load i32* %tc, align 4
  %728 = sub nsw i32 %727, 2
  %729 = load i32* %minc, align 4
  %730 = icmp sge i32 %728, %729
  br i1 %730, label %731, label %824

; <label>:731                                     ; preds = %726
  %732 = load i32* %tc, align 4
  %733 = sub nsw i32 %732, 2
  %734 = load i32* %maxc, align 4
  %735 = icmp sle i32 %733, %734
  br i1 %735, label %736, label %824

; <label>:736                                     ; preds = %731
  %737 = load i32* %tr, align 4
  %738 = sub nsw i32 %737, 2
  %739 = load i32* %minr, align 4
  %740 = icmp sge i32 %738, %739
  br i1 %740, label %741, label %824

; <label>:741                                     ; preds = %736
  %742 = load i32* %tr, align 4
  %743 = sub nsw i32 %742, 2
  %744 = load i32* %maxr, align 4
  %745 = icmp sle i32 %743, %744
  br i1 %745, label %746, label %824

; <label>:746                                     ; preds = %741
  %747 = load %struct.variance_vtable** %8, align 8
  %748 = getelementptr inbounds %struct.variance_vtable* %747, i32 0, i32 2
  %749 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %748, align 8
  %750 = load i8** %y, align 8
  %751 = load i32* %tr, align 4
  %752 = sub nsw i32 %751, 2
  %753 = ashr i32 %752, 2
  %754 = load i32* %y_stride, align 4
  %755 = mul nsw i32 %753, %754
  %756 = load i32* %tc, align 4
  %757 = sub nsw i32 %756, 2
  %758 = ashr i32 %757, 2
  %759 = add nsw i32 %755, %758
  %760 = load i32* %offset, align 4
  %761 = sub nsw i32 %759, %760
  %762 = sext i32 %761 to i64
  %763 = getelementptr inbounds i8* %750, i64 %762
  %764 = load i32* %y_stride, align 4
  %765 = load i32* %tc, align 4
  %766 = sub nsw i32 %765, 2
  %767 = and i32 %766, 3
  %768 = shl i32 %767, 1
  %769 = load i32* %tr, align 4
  %770 = sub nsw i32 %769, 2
  %771 = and i32 %770, 3
  %772 = shl i32 %771, 1
  %773 = load i8** %z, align 8
  %774 = load %struct.block** %3, align 8
  %775 = getelementptr inbounds %struct.block* %774, i32 0, i32 11
  %776 = load i32* %775, align 4
  %777 = call i32 %749(i8* %763, i32 %764, i32 %768, i32 %772, i8* %773, i32 %776, i32* %sse)
  store i32 %777, i32* %thismse, align 4
  %778 = load i32*** %9, align 8
  %779 = icmp ne i32** %778, null
  br i1 %779, label %780, label %806

; <label>:780                                     ; preds = %746
  %781 = load i32* %tr, align 4
  %782 = sub nsw i32 %781, 2
  %783 = load i32* %rr, align 4
  %784 = sub nsw i32 %782, %783
  %785 = sext i32 %784 to i64
  %786 = load i32*** %9, align 8
  %787 = getelementptr inbounds i32** %786, i64 0
  %788 = load i32** %787, align 8
  %789 = getelementptr inbounds i32* %788, i64 %785
  %790 = load i32* %789, align 4
  %791 = load i32* %tc, align 4
  %792 = sub nsw i32 %791, 2
  %793 = load i32* %rc, align 4
  %794 = sub nsw i32 %792, %793
  %795 = sext i32 %794 to i64
  %796 = load i32*** %9, align 8
  %797 = getelementptr inbounds i32** %796, i64 1
  %798 = load i32** %797, align 8
  %799 = getelementptr inbounds i32* %798, i64 %795
  %800 = load i32* %799, align 4
  %801 = add nsw i32 %790, %800
  %802 = load i32* %7, align 4
  %803 = mul nsw i32 %801, %802
  %804 = add nsw i32 %803, 128
  %805 = ashr i32 %804, 8
  br label %807

; <label>:806                                     ; preds = %746
  br label %807

; <label>:807                                     ; preds = %806, %780
  %808 = phi i32 [ %805, %780 ], [ 0, %806 ]
  %809 = load i32* %thismse, align 4
  %810 = add nsw i32 %808, %809
  store i32 %810, i32* %diag, align 4
  %811 = load i32* %besterr, align 4
  %812 = icmp ult i32 %810, %811
  br i1 %812, label %813, label %823

; <label>:813                                     ; preds = %807
  %814 = load i32* %diag, align 4
  store i32 %814, i32* %besterr, align 4
  %815 = load i32* %tr, align 4
  %816 = sub nsw i32 %815, 2
  store i32 %816, i32* %br, align 4
  %817 = load i32* %tc, align 4
  %818 = sub nsw i32 %817, 2
  store i32 %818, i32* %bc, align 4
  %819 = load i32* %thismse, align 4
  %820 = load i32** %10, align 8
  store i32 %819, i32* %820, align 4
  %821 = load i32* %sse, align 4
  %822 = load i32** %11, align 8
  store i32 %821, i32* %822, align 4
  br label %823

; <label>:823                                     ; preds = %813, %807
  br label %825

; <label>:824                                     ; preds = %741, %736, %731, %726
  store i32 -1, i32* %diag, align 4
  br label %825

; <label>:825                                     ; preds = %824, %823
  br label %1126

; <label>:826                                     ; preds = %715
  %827 = load i32* %tc, align 4
  %828 = add nsw i32 %827, 2
  %829 = load i32* %minc, align 4
  %830 = icmp sge i32 %828, %829
  br i1 %830, label %831, label %924

; <label>:831                                     ; preds = %826
  %832 = load i32* %tc, align 4
  %833 = add nsw i32 %832, 2
  %834 = load i32* %maxc, align 4
  %835 = icmp sle i32 %833, %834
  br i1 %835, label %836, label %924

; <label>:836                                     ; preds = %831
  %837 = load i32* %tr, align 4
  %838 = sub nsw i32 %837, 2
  %839 = load i32* %minr, align 4
  %840 = icmp sge i32 %838, %839
  br i1 %840, label %841, label %924

; <label>:841                                     ; preds = %836
  %842 = load i32* %tr, align 4
  %843 = sub nsw i32 %842, 2
  %844 = load i32* %maxr, align 4
  %845 = icmp sle i32 %843, %844
  br i1 %845, label %846, label %924

; <label>:846                                     ; preds = %841
  %847 = load %struct.variance_vtable** %8, align 8
  %848 = getelementptr inbounds %struct.variance_vtable* %847, i32 0, i32 2
  %849 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %848, align 8
  %850 = load i8** %y, align 8
  %851 = load i32* %tr, align 4
  %852 = sub nsw i32 %851, 2
  %853 = ashr i32 %852, 2
  %854 = load i32* %y_stride, align 4
  %855 = mul nsw i32 %853, %854
  %856 = load i32* %tc, align 4
  %857 = add nsw i32 %856, 2
  %858 = ashr i32 %857, 2
  %859 = add nsw i32 %855, %858
  %860 = load i32* %offset, align 4
  %861 = sub nsw i32 %859, %860
  %862 = sext i32 %861 to i64
  %863 = getelementptr inbounds i8* %850, i64 %862
  %864 = load i32* %y_stride, align 4
  %865 = load i32* %tc, align 4
  %866 = add nsw i32 %865, 2
  %867 = and i32 %866, 3
  %868 = shl i32 %867, 1
  %869 = load i32* %tr, align 4
  %870 = sub nsw i32 %869, 2
  %871 = and i32 %870, 3
  %872 = shl i32 %871, 1
  %873 = load i8** %z, align 8
  %874 = load %struct.block** %3, align 8
  %875 = getelementptr inbounds %struct.block* %874, i32 0, i32 11
  %876 = load i32* %875, align 4
  %877 = call i32 %849(i8* %863, i32 %864, i32 %868, i32 %872, i8* %873, i32 %876, i32* %sse)
  store i32 %877, i32* %thismse, align 4
  %878 = load i32*** %9, align 8
  %879 = icmp ne i32** %878, null
  br i1 %879, label %880, label %906

; <label>:880                                     ; preds = %846
  %881 = load i32* %tr, align 4
  %882 = sub nsw i32 %881, 2
  %883 = load i32* %rr, align 4
  %884 = sub nsw i32 %882, %883
  %885 = sext i32 %884 to i64
  %886 = load i32*** %9, align 8
  %887 = getelementptr inbounds i32** %886, i64 0
  %888 = load i32** %887, align 8
  %889 = getelementptr inbounds i32* %888, i64 %885
  %890 = load i32* %889, align 4
  %891 = load i32* %tc, align 4
  %892 = add nsw i32 %891, 2
  %893 = load i32* %rc, align 4
  %894 = sub nsw i32 %892, %893
  %895 = sext i32 %894 to i64
  %896 = load i32*** %9, align 8
  %897 = getelementptr inbounds i32** %896, i64 1
  %898 = load i32** %897, align 8
  %899 = getelementptr inbounds i32* %898, i64 %895
  %900 = load i32* %899, align 4
  %901 = add nsw i32 %890, %900
  %902 = load i32* %7, align 4
  %903 = mul nsw i32 %901, %902
  %904 = add nsw i32 %903, 128
  %905 = ashr i32 %904, 8
  br label %907

; <label>:906                                     ; preds = %846
  br label %907

; <label>:907                                     ; preds = %906, %880
  %908 = phi i32 [ %905, %880 ], [ 0, %906 ]
  %909 = load i32* %thismse, align 4
  %910 = add nsw i32 %908, %909
  store i32 %910, i32* %diag, align 4
  %911 = load i32* %besterr, align 4
  %912 = icmp ult i32 %910, %911
  br i1 %912, label %913, label %923

; <label>:913                                     ; preds = %907
  %914 = load i32* %diag, align 4
  store i32 %914, i32* %besterr, align 4
  %915 = load i32* %tr, align 4
  %916 = sub nsw i32 %915, 2
  store i32 %916, i32* %br, align 4
  %917 = load i32* %tc, align 4
  %918 = add nsw i32 %917, 2
  store i32 %918, i32* %bc, align 4
  %919 = load i32* %thismse, align 4
  %920 = load i32** %10, align 8
  store i32 %919, i32* %920, align 4
  %921 = load i32* %sse, align 4
  %922 = load i32** %11, align 8
  store i32 %921, i32* %922, align 4
  br label %923

; <label>:923                                     ; preds = %913, %907
  br label %925

; <label>:924                                     ; preds = %841, %836, %831, %826
  store i32 -1, i32* %diag, align 4
  br label %925

; <label>:925                                     ; preds = %924, %923
  br label %1126

; <label>:926                                     ; preds = %715
  %927 = load i32* %tc, align 4
  %928 = sub nsw i32 %927, 2
  %929 = load i32* %minc, align 4
  %930 = icmp sge i32 %928, %929
  br i1 %930, label %931, label %1024

; <label>:931                                     ; preds = %926
  %932 = load i32* %tc, align 4
  %933 = sub nsw i32 %932, 2
  %934 = load i32* %maxc, align 4
  %935 = icmp sle i32 %933, %934
  br i1 %935, label %936, label %1024

; <label>:936                                     ; preds = %931
  %937 = load i32* %tr, align 4
  %938 = add nsw i32 %937, 2
  %939 = load i32* %minr, align 4
  %940 = icmp sge i32 %938, %939
  br i1 %940, label %941, label %1024

; <label>:941                                     ; preds = %936
  %942 = load i32* %tr, align 4
  %943 = add nsw i32 %942, 2
  %944 = load i32* %maxr, align 4
  %945 = icmp sle i32 %943, %944
  br i1 %945, label %946, label %1024

; <label>:946                                     ; preds = %941
  %947 = load %struct.variance_vtable** %8, align 8
  %948 = getelementptr inbounds %struct.variance_vtable* %947, i32 0, i32 2
  %949 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %948, align 8
  %950 = load i8** %y, align 8
  %951 = load i32* %tr, align 4
  %952 = add nsw i32 %951, 2
  %953 = ashr i32 %952, 2
  %954 = load i32* %y_stride, align 4
  %955 = mul nsw i32 %953, %954
  %956 = load i32* %tc, align 4
  %957 = sub nsw i32 %956, 2
  %958 = ashr i32 %957, 2
  %959 = add nsw i32 %955, %958
  %960 = load i32* %offset, align 4
  %961 = sub nsw i32 %959, %960
  %962 = sext i32 %961 to i64
  %963 = getelementptr inbounds i8* %950, i64 %962
  %964 = load i32* %y_stride, align 4
  %965 = load i32* %tc, align 4
  %966 = sub nsw i32 %965, 2
  %967 = and i32 %966, 3
  %968 = shl i32 %967, 1
  %969 = load i32* %tr, align 4
  %970 = add nsw i32 %969, 2
  %971 = and i32 %970, 3
  %972 = shl i32 %971, 1
  %973 = load i8** %z, align 8
  %974 = load %struct.block** %3, align 8
  %975 = getelementptr inbounds %struct.block* %974, i32 0, i32 11
  %976 = load i32* %975, align 4
  %977 = call i32 %949(i8* %963, i32 %964, i32 %968, i32 %972, i8* %973, i32 %976, i32* %sse)
  store i32 %977, i32* %thismse, align 4
  %978 = load i32*** %9, align 8
  %979 = icmp ne i32** %978, null
  br i1 %979, label %980, label %1006

; <label>:980                                     ; preds = %946
  %981 = load i32* %tr, align 4
  %982 = add nsw i32 %981, 2
  %983 = load i32* %rr, align 4
  %984 = sub nsw i32 %982, %983
  %985 = sext i32 %984 to i64
  %986 = load i32*** %9, align 8
  %987 = getelementptr inbounds i32** %986, i64 0
  %988 = load i32** %987, align 8
  %989 = getelementptr inbounds i32* %988, i64 %985
  %990 = load i32* %989, align 4
  %991 = load i32* %tc, align 4
  %992 = sub nsw i32 %991, 2
  %993 = load i32* %rc, align 4
  %994 = sub nsw i32 %992, %993
  %995 = sext i32 %994 to i64
  %996 = load i32*** %9, align 8
  %997 = getelementptr inbounds i32** %996, i64 1
  %998 = load i32** %997, align 8
  %999 = getelementptr inbounds i32* %998, i64 %995
  %1000 = load i32* %999, align 4
  %1001 = add nsw i32 %990, %1000
  %1002 = load i32* %7, align 4
  %1003 = mul nsw i32 %1001, %1002
  %1004 = add nsw i32 %1003, 128
  %1005 = ashr i32 %1004, 8
  br label %1007

; <label>:1006                                    ; preds = %946
  br label %1007

; <label>:1007                                    ; preds = %1006, %980
  %1008 = phi i32 [ %1005, %980 ], [ 0, %1006 ]
  %1009 = load i32* %thismse, align 4
  %1010 = add nsw i32 %1008, %1009
  store i32 %1010, i32* %diag, align 4
  %1011 = load i32* %besterr, align 4
  %1012 = icmp ult i32 %1010, %1011
  br i1 %1012, label %1013, label %1023

; <label>:1013                                    ; preds = %1007
  %1014 = load i32* %diag, align 4
  store i32 %1014, i32* %besterr, align 4
  %1015 = load i32* %tr, align 4
  %1016 = add nsw i32 %1015, 2
  store i32 %1016, i32* %br, align 4
  %1017 = load i32* %tc, align 4
  %1018 = sub nsw i32 %1017, 2
  store i32 %1018, i32* %bc, align 4
  %1019 = load i32* %thismse, align 4
  %1020 = load i32** %10, align 8
  store i32 %1019, i32* %1020, align 4
  %1021 = load i32* %sse, align 4
  %1022 = load i32** %11, align 8
  store i32 %1021, i32* %1022, align 4
  br label %1023

; <label>:1023                                    ; preds = %1013, %1007
  br label %1025

; <label>:1024                                    ; preds = %941, %936, %931, %926
  store i32 -1, i32* %diag, align 4
  br label %1025

; <label>:1025                                    ; preds = %1024, %1023
  br label %1126

; <label>:1026                                    ; preds = %715
  %1027 = load i32* %tc, align 4
  %1028 = add nsw i32 %1027, 2
  %1029 = load i32* %minc, align 4
  %1030 = icmp sge i32 %1028, %1029
  br i1 %1030, label %1031, label %1124

; <label>:1031                                    ; preds = %1026
  %1032 = load i32* %tc, align 4
  %1033 = add nsw i32 %1032, 2
  %1034 = load i32* %maxc, align 4
  %1035 = icmp sle i32 %1033, %1034
  br i1 %1035, label %1036, label %1124

; <label>:1036                                    ; preds = %1031
  %1037 = load i32* %tr, align 4
  %1038 = add nsw i32 %1037, 2
  %1039 = load i32* %minr, align 4
  %1040 = icmp sge i32 %1038, %1039
  br i1 %1040, label %1041, label %1124

; <label>:1041                                    ; preds = %1036
  %1042 = load i32* %tr, align 4
  %1043 = add nsw i32 %1042, 2
  %1044 = load i32* %maxr, align 4
  %1045 = icmp sle i32 %1043, %1044
  br i1 %1045, label %1046, label %1124

; <label>:1046                                    ; preds = %1041
  %1047 = load %struct.variance_vtable** %8, align 8
  %1048 = getelementptr inbounds %struct.variance_vtable* %1047, i32 0, i32 2
  %1049 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1048, align 8
  %1050 = load i8** %y, align 8
  %1051 = load i32* %tr, align 4
  %1052 = add nsw i32 %1051, 2
  %1053 = ashr i32 %1052, 2
  %1054 = load i32* %y_stride, align 4
  %1055 = mul nsw i32 %1053, %1054
  %1056 = load i32* %tc, align 4
  %1057 = add nsw i32 %1056, 2
  %1058 = ashr i32 %1057, 2
  %1059 = add nsw i32 %1055, %1058
  %1060 = load i32* %offset, align 4
  %1061 = sub nsw i32 %1059, %1060
  %1062 = sext i32 %1061 to i64
  %1063 = getelementptr inbounds i8* %1050, i64 %1062
  %1064 = load i32* %y_stride, align 4
  %1065 = load i32* %tc, align 4
  %1066 = add nsw i32 %1065, 2
  %1067 = and i32 %1066, 3
  %1068 = shl i32 %1067, 1
  %1069 = load i32* %tr, align 4
  %1070 = add nsw i32 %1069, 2
  %1071 = and i32 %1070, 3
  %1072 = shl i32 %1071, 1
  %1073 = load i8** %z, align 8
  %1074 = load %struct.block** %3, align 8
  %1075 = getelementptr inbounds %struct.block* %1074, i32 0, i32 11
  %1076 = load i32* %1075, align 4
  %1077 = call i32 %1049(i8* %1063, i32 %1064, i32 %1068, i32 %1072, i8* %1073, i32 %1076, i32* %sse)
  store i32 %1077, i32* %thismse, align 4
  %1078 = load i32*** %9, align 8
  %1079 = icmp ne i32** %1078, null
  br i1 %1079, label %1080, label %1106

; <label>:1080                                    ; preds = %1046
  %1081 = load i32* %tr, align 4
  %1082 = add nsw i32 %1081, 2
  %1083 = load i32* %rr, align 4
  %1084 = sub nsw i32 %1082, %1083
  %1085 = sext i32 %1084 to i64
  %1086 = load i32*** %9, align 8
  %1087 = getelementptr inbounds i32** %1086, i64 0
  %1088 = load i32** %1087, align 8
  %1089 = getelementptr inbounds i32* %1088, i64 %1085
  %1090 = load i32* %1089, align 4
  %1091 = load i32* %tc, align 4
  %1092 = add nsw i32 %1091, 2
  %1093 = load i32* %rc, align 4
  %1094 = sub nsw i32 %1092, %1093
  %1095 = sext i32 %1094 to i64
  %1096 = load i32*** %9, align 8
  %1097 = getelementptr inbounds i32** %1096, i64 1
  %1098 = load i32** %1097, align 8
  %1099 = getelementptr inbounds i32* %1098, i64 %1095
  %1100 = load i32* %1099, align 4
  %1101 = add nsw i32 %1090, %1100
  %1102 = load i32* %7, align 4
  %1103 = mul nsw i32 %1101, %1102
  %1104 = add nsw i32 %1103, 128
  %1105 = ashr i32 %1104, 8
  br label %1107

; <label>:1106                                    ; preds = %1046
  br label %1107

; <label>:1107                                    ; preds = %1106, %1080
  %1108 = phi i32 [ %1105, %1080 ], [ 0, %1106 ]
  %1109 = load i32* %thismse, align 4
  %1110 = add nsw i32 %1108, %1109
  store i32 %1110, i32* %diag, align 4
  %1111 = load i32* %besterr, align 4
  %1112 = icmp ult i32 %1110, %1111
  br i1 %1112, label %1113, label %1123

; <label>:1113                                    ; preds = %1107
  %1114 = load i32* %diag, align 4
  store i32 %1114, i32* %besterr, align 4
  %1115 = load i32* %tr, align 4
  %1116 = add nsw i32 %1115, 2
  store i32 %1116, i32* %br, align 4
  %1117 = load i32* %tc, align 4
  %1118 = add nsw i32 %1117, 2
  store i32 %1118, i32* %bc, align 4
  %1119 = load i32* %thismse, align 4
  %1120 = load i32** %10, align 8
  store i32 %1119, i32* %1120, align 4
  %1121 = load i32* %sse, align 4
  %1122 = load i32** %11, align 8
  store i32 %1121, i32* %1122, align 4
  br label %1123

; <label>:1123                                    ; preds = %1113, %1107
  br label %1125

; <label>:1124                                    ; preds = %1041, %1036, %1031, %1026
  store i32 -1, i32* %diag, align 4
  br label %1125

; <label>:1125                                    ; preds = %1124, %1123
  br label %1126

; <label>:1126                                    ; preds = %715, %1125, %1025, %925, %825
  %1127 = load i32* %tr, align 4
  %1128 = load i32* %br, align 4
  %1129 = icmp eq i32 %1127, %1128
  br i1 %1129, label %1130, label %1135

; <label>:1130                                    ; preds = %1126
  %1131 = load i32* %tc, align 4
  %1132 = load i32* %bc, align 4
  %1133 = icmp eq i32 %1131, %1132
  br i1 %1133, label %1134, label %1135

; <label>:1134                                    ; preds = %1130
  br label %1138

; <label>:1135                                    ; preds = %1130, %1126
  %1136 = load i32* %br, align 4
  store i32 %1136, i32* %tr, align 4
  %1137 = load i32* %bc, align 4
  store i32 %1137, i32* %tc, align 4
  br label %339

; <label>:1138                                    ; preds = %1134, %339
  br label %1139

; <label>:1139                                    ; preds = %1935, %1138
  %1140 = load i32* %quarteriters, align 4
  %1141 = add i32 %1140, -1
  store i32 %1141, i32* %quarteriters, align 4
  %1142 = icmp ne i32 %1141, 0
  br i1 %1142, label %1143, label %1938

; <label>:1143                                    ; preds = %1139
  %1144 = load i32* %tc, align 4
  %1145 = sub nsw i32 %1144, 1
  %1146 = load i32* %minc, align 4
  %1147 = icmp sge i32 %1145, %1146
  br i1 %1147, label %1148, label %1235

; <label>:1148                                    ; preds = %1143
  %1149 = load i32* %tc, align 4
  %1150 = sub nsw i32 %1149, 1
  %1151 = load i32* %maxc, align 4
  %1152 = icmp sle i32 %1150, %1151
  br i1 %1152, label %1153, label %1235

; <label>:1153                                    ; preds = %1148
  %1154 = load i32* %tr, align 4
  %1155 = load i32* %minr, align 4
  %1156 = icmp sge i32 %1154, %1155
  br i1 %1156, label %1157, label %1235

; <label>:1157                                    ; preds = %1153
  %1158 = load i32* %tr, align 4
  %1159 = load i32* %maxr, align 4
  %1160 = icmp sle i32 %1158, %1159
  br i1 %1160, label %1161, label %1235

; <label>:1161                                    ; preds = %1157
  %1162 = load %struct.variance_vtable** %8, align 8
  %1163 = getelementptr inbounds %struct.variance_vtable* %1162, i32 0, i32 2
  %1164 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1163, align 8
  %1165 = load i8** %y, align 8
  %1166 = load i32* %tr, align 4
  %1167 = ashr i32 %1166, 2
  %1168 = load i32* %y_stride, align 4
  %1169 = mul nsw i32 %1167, %1168
  %1170 = load i32* %tc, align 4
  %1171 = sub nsw i32 %1170, 1
  %1172 = ashr i32 %1171, 2
  %1173 = add nsw i32 %1169, %1172
  %1174 = load i32* %offset, align 4
  %1175 = sub nsw i32 %1173, %1174
  %1176 = sext i32 %1175 to i64
  %1177 = getelementptr inbounds i8* %1165, i64 %1176
  %1178 = load i32* %y_stride, align 4
  %1179 = load i32* %tc, align 4
  %1180 = sub nsw i32 %1179, 1
  %1181 = and i32 %1180, 3
  %1182 = shl i32 %1181, 1
  %1183 = load i32* %tr, align 4
  %1184 = and i32 %1183, 3
  %1185 = shl i32 %1184, 1
  %1186 = load i8** %z, align 8
  %1187 = load %struct.block** %3, align 8
  %1188 = getelementptr inbounds %struct.block* %1187, i32 0, i32 11
  %1189 = load i32* %1188, align 4
  %1190 = call i32 %1164(i8* %1177, i32 %1178, i32 %1182, i32 %1185, i8* %1186, i32 %1189, i32* %sse)
  store i32 %1190, i32* %thismse, align 4
  %1191 = load i32*** %9, align 8
  %1192 = icmp ne i32** %1191, null
  br i1 %1192, label %1193, label %1218

; <label>:1193                                    ; preds = %1161
  %1194 = load i32* %tr, align 4
  %1195 = load i32* %rr, align 4
  %1196 = sub nsw i32 %1194, %1195
  %1197 = sext i32 %1196 to i64
  %1198 = load i32*** %9, align 8
  %1199 = getelementptr inbounds i32** %1198, i64 0
  %1200 = load i32** %1199, align 8
  %1201 = getelementptr inbounds i32* %1200, i64 %1197
  %1202 = load i32* %1201, align 4
  %1203 = load i32* %tc, align 4
  %1204 = sub nsw i32 %1203, 1
  %1205 = load i32* %rc, align 4
  %1206 = sub nsw i32 %1204, %1205
  %1207 = sext i32 %1206 to i64
  %1208 = load i32*** %9, align 8
  %1209 = getelementptr inbounds i32** %1208, i64 1
  %1210 = load i32** %1209, align 8
  %1211 = getelementptr inbounds i32* %1210, i64 %1207
  %1212 = load i32* %1211, align 4
  %1213 = add nsw i32 %1202, %1212
  %1214 = load i32* %7, align 4
  %1215 = mul nsw i32 %1213, %1214
  %1216 = add nsw i32 %1215, 128
  %1217 = ashr i32 %1216, 8
  br label %1219

; <label>:1218                                    ; preds = %1161
  br label %1219

; <label>:1219                                    ; preds = %1218, %1193
  %1220 = phi i32 [ %1217, %1193 ], [ 0, %1218 ]
  %1221 = load i32* %thismse, align 4
  %1222 = add nsw i32 %1220, %1221
  store i32 %1222, i32* %left, align 4
  %1223 = load i32* %besterr, align 4
  %1224 = icmp ult i32 %1222, %1223
  br i1 %1224, label %1225, label %1234

; <label>:1225                                    ; preds = %1219
  %1226 = load i32* %left, align 4
  store i32 %1226, i32* %besterr, align 4
  %1227 = load i32* %tr, align 4
  store i32 %1227, i32* %br, align 4
  %1228 = load i32* %tc, align 4
  %1229 = sub nsw i32 %1228, 1
  store i32 %1229, i32* %bc, align 4
  %1230 = load i32* %thismse, align 4
  %1231 = load i32** %10, align 8
  store i32 %1230, i32* %1231, align 4
  %1232 = load i32* %sse, align 4
  %1233 = load i32** %11, align 8
  store i32 %1232, i32* %1233, align 4
  br label %1234

; <label>:1234                                    ; preds = %1225, %1219
  br label %1236

; <label>:1235                                    ; preds = %1157, %1153, %1148, %1143
  store i32 -1, i32* %left, align 4
  br label %1236

; <label>:1236                                    ; preds = %1235, %1234
  %1237 = load i32* %tc, align 4
  %1238 = add nsw i32 %1237, 1
  %1239 = load i32* %minc, align 4
  %1240 = icmp sge i32 %1238, %1239
  br i1 %1240, label %1241, label %1328

; <label>:1241                                    ; preds = %1236
  %1242 = load i32* %tc, align 4
  %1243 = add nsw i32 %1242, 1
  %1244 = load i32* %maxc, align 4
  %1245 = icmp sle i32 %1243, %1244
  br i1 %1245, label %1246, label %1328

; <label>:1246                                    ; preds = %1241
  %1247 = load i32* %tr, align 4
  %1248 = load i32* %minr, align 4
  %1249 = icmp sge i32 %1247, %1248
  br i1 %1249, label %1250, label %1328

; <label>:1250                                    ; preds = %1246
  %1251 = load i32* %tr, align 4
  %1252 = load i32* %maxr, align 4
  %1253 = icmp sle i32 %1251, %1252
  br i1 %1253, label %1254, label %1328

; <label>:1254                                    ; preds = %1250
  %1255 = load %struct.variance_vtable** %8, align 8
  %1256 = getelementptr inbounds %struct.variance_vtable* %1255, i32 0, i32 2
  %1257 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1256, align 8
  %1258 = load i8** %y, align 8
  %1259 = load i32* %tr, align 4
  %1260 = ashr i32 %1259, 2
  %1261 = load i32* %y_stride, align 4
  %1262 = mul nsw i32 %1260, %1261
  %1263 = load i32* %tc, align 4
  %1264 = add nsw i32 %1263, 1
  %1265 = ashr i32 %1264, 2
  %1266 = add nsw i32 %1262, %1265
  %1267 = load i32* %offset, align 4
  %1268 = sub nsw i32 %1266, %1267
  %1269 = sext i32 %1268 to i64
  %1270 = getelementptr inbounds i8* %1258, i64 %1269
  %1271 = load i32* %y_stride, align 4
  %1272 = load i32* %tc, align 4
  %1273 = add nsw i32 %1272, 1
  %1274 = and i32 %1273, 3
  %1275 = shl i32 %1274, 1
  %1276 = load i32* %tr, align 4
  %1277 = and i32 %1276, 3
  %1278 = shl i32 %1277, 1
  %1279 = load i8** %z, align 8
  %1280 = load %struct.block** %3, align 8
  %1281 = getelementptr inbounds %struct.block* %1280, i32 0, i32 11
  %1282 = load i32* %1281, align 4
  %1283 = call i32 %1257(i8* %1270, i32 %1271, i32 %1275, i32 %1278, i8* %1279, i32 %1282, i32* %sse)
  store i32 %1283, i32* %thismse, align 4
  %1284 = load i32*** %9, align 8
  %1285 = icmp ne i32** %1284, null
  br i1 %1285, label %1286, label %1311

; <label>:1286                                    ; preds = %1254
  %1287 = load i32* %tr, align 4
  %1288 = load i32* %rr, align 4
  %1289 = sub nsw i32 %1287, %1288
  %1290 = sext i32 %1289 to i64
  %1291 = load i32*** %9, align 8
  %1292 = getelementptr inbounds i32** %1291, i64 0
  %1293 = load i32** %1292, align 8
  %1294 = getelementptr inbounds i32* %1293, i64 %1290
  %1295 = load i32* %1294, align 4
  %1296 = load i32* %tc, align 4
  %1297 = add nsw i32 %1296, 1
  %1298 = load i32* %rc, align 4
  %1299 = sub nsw i32 %1297, %1298
  %1300 = sext i32 %1299 to i64
  %1301 = load i32*** %9, align 8
  %1302 = getelementptr inbounds i32** %1301, i64 1
  %1303 = load i32** %1302, align 8
  %1304 = getelementptr inbounds i32* %1303, i64 %1300
  %1305 = load i32* %1304, align 4
  %1306 = add nsw i32 %1295, %1305
  %1307 = load i32* %7, align 4
  %1308 = mul nsw i32 %1306, %1307
  %1309 = add nsw i32 %1308, 128
  %1310 = ashr i32 %1309, 8
  br label %1312

; <label>:1311                                    ; preds = %1254
  br label %1312

; <label>:1312                                    ; preds = %1311, %1286
  %1313 = phi i32 [ %1310, %1286 ], [ 0, %1311 ]
  %1314 = load i32* %thismse, align 4
  %1315 = add nsw i32 %1313, %1314
  store i32 %1315, i32* %right, align 4
  %1316 = load i32* %besterr, align 4
  %1317 = icmp ult i32 %1315, %1316
  br i1 %1317, label %1318, label %1327

; <label>:1318                                    ; preds = %1312
  %1319 = load i32* %right, align 4
  store i32 %1319, i32* %besterr, align 4
  %1320 = load i32* %tr, align 4
  store i32 %1320, i32* %br, align 4
  %1321 = load i32* %tc, align 4
  %1322 = add nsw i32 %1321, 1
  store i32 %1322, i32* %bc, align 4
  %1323 = load i32* %thismse, align 4
  %1324 = load i32** %10, align 8
  store i32 %1323, i32* %1324, align 4
  %1325 = load i32* %sse, align 4
  %1326 = load i32** %11, align 8
  store i32 %1325, i32* %1326, align 4
  br label %1327

; <label>:1327                                    ; preds = %1318, %1312
  br label %1329

; <label>:1328                                    ; preds = %1250, %1246, %1241, %1236
  store i32 -1, i32* %right, align 4
  br label %1329

; <label>:1329                                    ; preds = %1328, %1327
  %1330 = load i32* %tc, align 4
  %1331 = load i32* %minc, align 4
  %1332 = icmp sge i32 %1330, %1331
  br i1 %1332, label %1333, label %1421

; <label>:1333                                    ; preds = %1329
  %1334 = load i32* %tc, align 4
  %1335 = load i32* %maxc, align 4
  %1336 = icmp sle i32 %1334, %1335
  br i1 %1336, label %1337, label %1421

; <label>:1337                                    ; preds = %1333
  %1338 = load i32* %tr, align 4
  %1339 = sub nsw i32 %1338, 1
  %1340 = load i32* %minr, align 4
  %1341 = icmp sge i32 %1339, %1340
  br i1 %1341, label %1342, label %1421

; <label>:1342                                    ; preds = %1337
  %1343 = load i32* %tr, align 4
  %1344 = sub nsw i32 %1343, 1
  %1345 = load i32* %maxr, align 4
  %1346 = icmp sle i32 %1344, %1345
  br i1 %1346, label %1347, label %1421

; <label>:1347                                    ; preds = %1342
  %1348 = load %struct.variance_vtable** %8, align 8
  %1349 = getelementptr inbounds %struct.variance_vtable* %1348, i32 0, i32 2
  %1350 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1349, align 8
  %1351 = load i8** %y, align 8
  %1352 = load i32* %tr, align 4
  %1353 = sub nsw i32 %1352, 1
  %1354 = ashr i32 %1353, 2
  %1355 = load i32* %y_stride, align 4
  %1356 = mul nsw i32 %1354, %1355
  %1357 = load i32* %tc, align 4
  %1358 = ashr i32 %1357, 2
  %1359 = add nsw i32 %1356, %1358
  %1360 = load i32* %offset, align 4
  %1361 = sub nsw i32 %1359, %1360
  %1362 = sext i32 %1361 to i64
  %1363 = getelementptr inbounds i8* %1351, i64 %1362
  %1364 = load i32* %y_stride, align 4
  %1365 = load i32* %tc, align 4
  %1366 = and i32 %1365, 3
  %1367 = shl i32 %1366, 1
  %1368 = load i32* %tr, align 4
  %1369 = sub nsw i32 %1368, 1
  %1370 = and i32 %1369, 3
  %1371 = shl i32 %1370, 1
  %1372 = load i8** %z, align 8
  %1373 = load %struct.block** %3, align 8
  %1374 = getelementptr inbounds %struct.block* %1373, i32 0, i32 11
  %1375 = load i32* %1374, align 4
  %1376 = call i32 %1350(i8* %1363, i32 %1364, i32 %1367, i32 %1371, i8* %1372, i32 %1375, i32* %sse)
  store i32 %1376, i32* %thismse, align 4
  %1377 = load i32*** %9, align 8
  %1378 = icmp ne i32** %1377, null
  br i1 %1378, label %1379, label %1404

; <label>:1379                                    ; preds = %1347
  %1380 = load i32* %tr, align 4
  %1381 = sub nsw i32 %1380, 1
  %1382 = load i32* %rr, align 4
  %1383 = sub nsw i32 %1381, %1382
  %1384 = sext i32 %1383 to i64
  %1385 = load i32*** %9, align 8
  %1386 = getelementptr inbounds i32** %1385, i64 0
  %1387 = load i32** %1386, align 8
  %1388 = getelementptr inbounds i32* %1387, i64 %1384
  %1389 = load i32* %1388, align 4
  %1390 = load i32* %tc, align 4
  %1391 = load i32* %rc, align 4
  %1392 = sub nsw i32 %1390, %1391
  %1393 = sext i32 %1392 to i64
  %1394 = load i32*** %9, align 8
  %1395 = getelementptr inbounds i32** %1394, i64 1
  %1396 = load i32** %1395, align 8
  %1397 = getelementptr inbounds i32* %1396, i64 %1393
  %1398 = load i32* %1397, align 4
  %1399 = add nsw i32 %1389, %1398
  %1400 = load i32* %7, align 4
  %1401 = mul nsw i32 %1399, %1400
  %1402 = add nsw i32 %1401, 128
  %1403 = ashr i32 %1402, 8
  br label %1405

; <label>:1404                                    ; preds = %1347
  br label %1405

; <label>:1405                                    ; preds = %1404, %1379
  %1406 = phi i32 [ %1403, %1379 ], [ 0, %1404 ]
  %1407 = load i32* %thismse, align 4
  %1408 = add nsw i32 %1406, %1407
  store i32 %1408, i32* %up, align 4
  %1409 = load i32* %besterr, align 4
  %1410 = icmp ult i32 %1408, %1409
  br i1 %1410, label %1411, label %1420

; <label>:1411                                    ; preds = %1405
  %1412 = load i32* %up, align 4
  store i32 %1412, i32* %besterr, align 4
  %1413 = load i32* %tr, align 4
  %1414 = sub nsw i32 %1413, 1
  store i32 %1414, i32* %br, align 4
  %1415 = load i32* %tc, align 4
  store i32 %1415, i32* %bc, align 4
  %1416 = load i32* %thismse, align 4
  %1417 = load i32** %10, align 8
  store i32 %1416, i32* %1417, align 4
  %1418 = load i32* %sse, align 4
  %1419 = load i32** %11, align 8
  store i32 %1418, i32* %1419, align 4
  br label %1420

; <label>:1420                                    ; preds = %1411, %1405
  br label %1422

; <label>:1421                                    ; preds = %1342, %1337, %1333, %1329
  store i32 -1, i32* %up, align 4
  br label %1422

; <label>:1422                                    ; preds = %1421, %1420
  %1423 = load i32* %tc, align 4
  %1424 = load i32* %minc, align 4
  %1425 = icmp sge i32 %1423, %1424
  br i1 %1425, label %1426, label %1514

; <label>:1426                                    ; preds = %1422
  %1427 = load i32* %tc, align 4
  %1428 = load i32* %maxc, align 4
  %1429 = icmp sle i32 %1427, %1428
  br i1 %1429, label %1430, label %1514

; <label>:1430                                    ; preds = %1426
  %1431 = load i32* %tr, align 4
  %1432 = add nsw i32 %1431, 1
  %1433 = load i32* %minr, align 4
  %1434 = icmp sge i32 %1432, %1433
  br i1 %1434, label %1435, label %1514

; <label>:1435                                    ; preds = %1430
  %1436 = load i32* %tr, align 4
  %1437 = add nsw i32 %1436, 1
  %1438 = load i32* %maxr, align 4
  %1439 = icmp sle i32 %1437, %1438
  br i1 %1439, label %1440, label %1514

; <label>:1440                                    ; preds = %1435
  %1441 = load %struct.variance_vtable** %8, align 8
  %1442 = getelementptr inbounds %struct.variance_vtable* %1441, i32 0, i32 2
  %1443 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1442, align 8
  %1444 = load i8** %y, align 8
  %1445 = load i32* %tr, align 4
  %1446 = add nsw i32 %1445, 1
  %1447 = ashr i32 %1446, 2
  %1448 = load i32* %y_stride, align 4
  %1449 = mul nsw i32 %1447, %1448
  %1450 = load i32* %tc, align 4
  %1451 = ashr i32 %1450, 2
  %1452 = add nsw i32 %1449, %1451
  %1453 = load i32* %offset, align 4
  %1454 = sub nsw i32 %1452, %1453
  %1455 = sext i32 %1454 to i64
  %1456 = getelementptr inbounds i8* %1444, i64 %1455
  %1457 = load i32* %y_stride, align 4
  %1458 = load i32* %tc, align 4
  %1459 = and i32 %1458, 3
  %1460 = shl i32 %1459, 1
  %1461 = load i32* %tr, align 4
  %1462 = add nsw i32 %1461, 1
  %1463 = and i32 %1462, 3
  %1464 = shl i32 %1463, 1
  %1465 = load i8** %z, align 8
  %1466 = load %struct.block** %3, align 8
  %1467 = getelementptr inbounds %struct.block* %1466, i32 0, i32 11
  %1468 = load i32* %1467, align 4
  %1469 = call i32 %1443(i8* %1456, i32 %1457, i32 %1460, i32 %1464, i8* %1465, i32 %1468, i32* %sse)
  store i32 %1469, i32* %thismse, align 4
  %1470 = load i32*** %9, align 8
  %1471 = icmp ne i32** %1470, null
  br i1 %1471, label %1472, label %1497

; <label>:1472                                    ; preds = %1440
  %1473 = load i32* %tr, align 4
  %1474 = add nsw i32 %1473, 1
  %1475 = load i32* %rr, align 4
  %1476 = sub nsw i32 %1474, %1475
  %1477 = sext i32 %1476 to i64
  %1478 = load i32*** %9, align 8
  %1479 = getelementptr inbounds i32** %1478, i64 0
  %1480 = load i32** %1479, align 8
  %1481 = getelementptr inbounds i32* %1480, i64 %1477
  %1482 = load i32* %1481, align 4
  %1483 = load i32* %tc, align 4
  %1484 = load i32* %rc, align 4
  %1485 = sub nsw i32 %1483, %1484
  %1486 = sext i32 %1485 to i64
  %1487 = load i32*** %9, align 8
  %1488 = getelementptr inbounds i32** %1487, i64 1
  %1489 = load i32** %1488, align 8
  %1490 = getelementptr inbounds i32* %1489, i64 %1486
  %1491 = load i32* %1490, align 4
  %1492 = add nsw i32 %1482, %1491
  %1493 = load i32* %7, align 4
  %1494 = mul nsw i32 %1492, %1493
  %1495 = add nsw i32 %1494, 128
  %1496 = ashr i32 %1495, 8
  br label %1498

; <label>:1497                                    ; preds = %1440
  br label %1498

; <label>:1498                                    ; preds = %1497, %1472
  %1499 = phi i32 [ %1496, %1472 ], [ 0, %1497 ]
  %1500 = load i32* %thismse, align 4
  %1501 = add nsw i32 %1499, %1500
  store i32 %1501, i32* %down, align 4
  %1502 = load i32* %besterr, align 4
  %1503 = icmp ult i32 %1501, %1502
  br i1 %1503, label %1504, label %1513

; <label>:1504                                    ; preds = %1498
  %1505 = load i32* %down, align 4
  store i32 %1505, i32* %besterr, align 4
  %1506 = load i32* %tr, align 4
  %1507 = add nsw i32 %1506, 1
  store i32 %1507, i32* %br, align 4
  %1508 = load i32* %tc, align 4
  store i32 %1508, i32* %bc, align 4
  %1509 = load i32* %thismse, align 4
  %1510 = load i32** %10, align 8
  store i32 %1509, i32* %1510, align 4
  %1511 = load i32* %sse, align 4
  %1512 = load i32** %11, align 8
  store i32 %1511, i32* %1512, align 4
  br label %1513

; <label>:1513                                    ; preds = %1504, %1498
  br label %1515

; <label>:1514                                    ; preds = %1435, %1430, %1426, %1422
  store i32 -1, i32* %down, align 4
  br label %1515

; <label>:1515                                    ; preds = %1514, %1513
  %1516 = load i32* %left, align 4
  %1517 = load i32* %right, align 4
  %1518 = icmp ult i32 %1516, %1517
  %1519 = select i1 %1518, i32 0, i32 1
  %1520 = load i32* %up, align 4
  %1521 = load i32* %down, align 4
  %1522 = icmp ult i32 %1520, %1521
  %1523 = select i1 %1522, i32 0, i32 2
  %1524 = add nsw i32 %1519, %1523
  store i32 %1524, i32* %whichdir, align 4
  %1525 = load i32* %whichdir, align 4
  switch i32 %1525, label %1926 [
    i32 0, label %1526
    i32 1, label %1626
    i32 2, label %1726
    i32 3, label %1826
  ]

; <label>:1526                                    ; preds = %1515
  %1527 = load i32* %tc, align 4
  %1528 = sub nsw i32 %1527, 1
  %1529 = load i32* %minc, align 4
  %1530 = icmp sge i32 %1528, %1529
  br i1 %1530, label %1531, label %1624

; <label>:1531                                    ; preds = %1526
  %1532 = load i32* %tc, align 4
  %1533 = sub nsw i32 %1532, 1
  %1534 = load i32* %maxc, align 4
  %1535 = icmp sle i32 %1533, %1534
  br i1 %1535, label %1536, label %1624

; <label>:1536                                    ; preds = %1531
  %1537 = load i32* %tr, align 4
  %1538 = sub nsw i32 %1537, 1
  %1539 = load i32* %minr, align 4
  %1540 = icmp sge i32 %1538, %1539
  br i1 %1540, label %1541, label %1624

; <label>:1541                                    ; preds = %1536
  %1542 = load i32* %tr, align 4
  %1543 = sub nsw i32 %1542, 1
  %1544 = load i32* %maxr, align 4
  %1545 = icmp sle i32 %1543, %1544
  br i1 %1545, label %1546, label %1624

; <label>:1546                                    ; preds = %1541
  %1547 = load %struct.variance_vtable** %8, align 8
  %1548 = getelementptr inbounds %struct.variance_vtable* %1547, i32 0, i32 2
  %1549 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1548, align 8
  %1550 = load i8** %y, align 8
  %1551 = load i32* %tr, align 4
  %1552 = sub nsw i32 %1551, 1
  %1553 = ashr i32 %1552, 2
  %1554 = load i32* %y_stride, align 4
  %1555 = mul nsw i32 %1553, %1554
  %1556 = load i32* %tc, align 4
  %1557 = sub nsw i32 %1556, 1
  %1558 = ashr i32 %1557, 2
  %1559 = add nsw i32 %1555, %1558
  %1560 = load i32* %offset, align 4
  %1561 = sub nsw i32 %1559, %1560
  %1562 = sext i32 %1561 to i64
  %1563 = getelementptr inbounds i8* %1550, i64 %1562
  %1564 = load i32* %y_stride, align 4
  %1565 = load i32* %tc, align 4
  %1566 = sub nsw i32 %1565, 1
  %1567 = and i32 %1566, 3
  %1568 = shl i32 %1567, 1
  %1569 = load i32* %tr, align 4
  %1570 = sub nsw i32 %1569, 1
  %1571 = and i32 %1570, 3
  %1572 = shl i32 %1571, 1
  %1573 = load i8** %z, align 8
  %1574 = load %struct.block** %3, align 8
  %1575 = getelementptr inbounds %struct.block* %1574, i32 0, i32 11
  %1576 = load i32* %1575, align 4
  %1577 = call i32 %1549(i8* %1563, i32 %1564, i32 %1568, i32 %1572, i8* %1573, i32 %1576, i32* %sse)
  store i32 %1577, i32* %thismse, align 4
  %1578 = load i32*** %9, align 8
  %1579 = icmp ne i32** %1578, null
  br i1 %1579, label %1580, label %1606

; <label>:1580                                    ; preds = %1546
  %1581 = load i32* %tr, align 4
  %1582 = sub nsw i32 %1581, 1
  %1583 = load i32* %rr, align 4
  %1584 = sub nsw i32 %1582, %1583
  %1585 = sext i32 %1584 to i64
  %1586 = load i32*** %9, align 8
  %1587 = getelementptr inbounds i32** %1586, i64 0
  %1588 = load i32** %1587, align 8
  %1589 = getelementptr inbounds i32* %1588, i64 %1585
  %1590 = load i32* %1589, align 4
  %1591 = load i32* %tc, align 4
  %1592 = sub nsw i32 %1591, 1
  %1593 = load i32* %rc, align 4
  %1594 = sub nsw i32 %1592, %1593
  %1595 = sext i32 %1594 to i64
  %1596 = load i32*** %9, align 8
  %1597 = getelementptr inbounds i32** %1596, i64 1
  %1598 = load i32** %1597, align 8
  %1599 = getelementptr inbounds i32* %1598, i64 %1595
  %1600 = load i32* %1599, align 4
  %1601 = add nsw i32 %1590, %1600
  %1602 = load i32* %7, align 4
  %1603 = mul nsw i32 %1601, %1602
  %1604 = add nsw i32 %1603, 128
  %1605 = ashr i32 %1604, 8
  br label %1607

; <label>:1606                                    ; preds = %1546
  br label %1607

; <label>:1607                                    ; preds = %1606, %1580
  %1608 = phi i32 [ %1605, %1580 ], [ 0, %1606 ]
  %1609 = load i32* %thismse, align 4
  %1610 = add nsw i32 %1608, %1609
  store i32 %1610, i32* %diag, align 4
  %1611 = load i32* %besterr, align 4
  %1612 = icmp ult i32 %1610, %1611
  br i1 %1612, label %1613, label %1623

; <label>:1613                                    ; preds = %1607
  %1614 = load i32* %diag, align 4
  store i32 %1614, i32* %besterr, align 4
  %1615 = load i32* %tr, align 4
  %1616 = sub nsw i32 %1615, 1
  store i32 %1616, i32* %br, align 4
  %1617 = load i32* %tc, align 4
  %1618 = sub nsw i32 %1617, 1
  store i32 %1618, i32* %bc, align 4
  %1619 = load i32* %thismse, align 4
  %1620 = load i32** %10, align 8
  store i32 %1619, i32* %1620, align 4
  %1621 = load i32* %sse, align 4
  %1622 = load i32** %11, align 8
  store i32 %1621, i32* %1622, align 4
  br label %1623

; <label>:1623                                    ; preds = %1613, %1607
  br label %1625

; <label>:1624                                    ; preds = %1541, %1536, %1531, %1526
  store i32 -1, i32* %diag, align 4
  br label %1625

; <label>:1625                                    ; preds = %1624, %1623
  br label %1926

; <label>:1626                                    ; preds = %1515
  %1627 = load i32* %tc, align 4
  %1628 = add nsw i32 %1627, 1
  %1629 = load i32* %minc, align 4
  %1630 = icmp sge i32 %1628, %1629
  br i1 %1630, label %1631, label %1724

; <label>:1631                                    ; preds = %1626
  %1632 = load i32* %tc, align 4
  %1633 = add nsw i32 %1632, 1
  %1634 = load i32* %maxc, align 4
  %1635 = icmp sle i32 %1633, %1634
  br i1 %1635, label %1636, label %1724

; <label>:1636                                    ; preds = %1631
  %1637 = load i32* %tr, align 4
  %1638 = sub nsw i32 %1637, 1
  %1639 = load i32* %minr, align 4
  %1640 = icmp sge i32 %1638, %1639
  br i1 %1640, label %1641, label %1724

; <label>:1641                                    ; preds = %1636
  %1642 = load i32* %tr, align 4
  %1643 = sub nsw i32 %1642, 1
  %1644 = load i32* %maxr, align 4
  %1645 = icmp sle i32 %1643, %1644
  br i1 %1645, label %1646, label %1724

; <label>:1646                                    ; preds = %1641
  %1647 = load %struct.variance_vtable** %8, align 8
  %1648 = getelementptr inbounds %struct.variance_vtable* %1647, i32 0, i32 2
  %1649 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1648, align 8
  %1650 = load i8** %y, align 8
  %1651 = load i32* %tr, align 4
  %1652 = sub nsw i32 %1651, 1
  %1653 = ashr i32 %1652, 2
  %1654 = load i32* %y_stride, align 4
  %1655 = mul nsw i32 %1653, %1654
  %1656 = load i32* %tc, align 4
  %1657 = add nsw i32 %1656, 1
  %1658 = ashr i32 %1657, 2
  %1659 = add nsw i32 %1655, %1658
  %1660 = load i32* %offset, align 4
  %1661 = sub nsw i32 %1659, %1660
  %1662 = sext i32 %1661 to i64
  %1663 = getelementptr inbounds i8* %1650, i64 %1662
  %1664 = load i32* %y_stride, align 4
  %1665 = load i32* %tc, align 4
  %1666 = add nsw i32 %1665, 1
  %1667 = and i32 %1666, 3
  %1668 = shl i32 %1667, 1
  %1669 = load i32* %tr, align 4
  %1670 = sub nsw i32 %1669, 1
  %1671 = and i32 %1670, 3
  %1672 = shl i32 %1671, 1
  %1673 = load i8** %z, align 8
  %1674 = load %struct.block** %3, align 8
  %1675 = getelementptr inbounds %struct.block* %1674, i32 0, i32 11
  %1676 = load i32* %1675, align 4
  %1677 = call i32 %1649(i8* %1663, i32 %1664, i32 %1668, i32 %1672, i8* %1673, i32 %1676, i32* %sse)
  store i32 %1677, i32* %thismse, align 4
  %1678 = load i32*** %9, align 8
  %1679 = icmp ne i32** %1678, null
  br i1 %1679, label %1680, label %1706

; <label>:1680                                    ; preds = %1646
  %1681 = load i32* %tr, align 4
  %1682 = sub nsw i32 %1681, 1
  %1683 = load i32* %rr, align 4
  %1684 = sub nsw i32 %1682, %1683
  %1685 = sext i32 %1684 to i64
  %1686 = load i32*** %9, align 8
  %1687 = getelementptr inbounds i32** %1686, i64 0
  %1688 = load i32** %1687, align 8
  %1689 = getelementptr inbounds i32* %1688, i64 %1685
  %1690 = load i32* %1689, align 4
  %1691 = load i32* %tc, align 4
  %1692 = add nsw i32 %1691, 1
  %1693 = load i32* %rc, align 4
  %1694 = sub nsw i32 %1692, %1693
  %1695 = sext i32 %1694 to i64
  %1696 = load i32*** %9, align 8
  %1697 = getelementptr inbounds i32** %1696, i64 1
  %1698 = load i32** %1697, align 8
  %1699 = getelementptr inbounds i32* %1698, i64 %1695
  %1700 = load i32* %1699, align 4
  %1701 = add nsw i32 %1690, %1700
  %1702 = load i32* %7, align 4
  %1703 = mul nsw i32 %1701, %1702
  %1704 = add nsw i32 %1703, 128
  %1705 = ashr i32 %1704, 8
  br label %1707

; <label>:1706                                    ; preds = %1646
  br label %1707

; <label>:1707                                    ; preds = %1706, %1680
  %1708 = phi i32 [ %1705, %1680 ], [ 0, %1706 ]
  %1709 = load i32* %thismse, align 4
  %1710 = add nsw i32 %1708, %1709
  store i32 %1710, i32* %diag, align 4
  %1711 = load i32* %besterr, align 4
  %1712 = icmp ult i32 %1710, %1711
  br i1 %1712, label %1713, label %1723

; <label>:1713                                    ; preds = %1707
  %1714 = load i32* %diag, align 4
  store i32 %1714, i32* %besterr, align 4
  %1715 = load i32* %tr, align 4
  %1716 = sub nsw i32 %1715, 1
  store i32 %1716, i32* %br, align 4
  %1717 = load i32* %tc, align 4
  %1718 = add nsw i32 %1717, 1
  store i32 %1718, i32* %bc, align 4
  %1719 = load i32* %thismse, align 4
  %1720 = load i32** %10, align 8
  store i32 %1719, i32* %1720, align 4
  %1721 = load i32* %sse, align 4
  %1722 = load i32** %11, align 8
  store i32 %1721, i32* %1722, align 4
  br label %1723

; <label>:1723                                    ; preds = %1713, %1707
  br label %1725

; <label>:1724                                    ; preds = %1641, %1636, %1631, %1626
  store i32 -1, i32* %diag, align 4
  br label %1725

; <label>:1725                                    ; preds = %1724, %1723
  br label %1926

; <label>:1726                                    ; preds = %1515
  %1727 = load i32* %tc, align 4
  %1728 = sub nsw i32 %1727, 1
  %1729 = load i32* %minc, align 4
  %1730 = icmp sge i32 %1728, %1729
  br i1 %1730, label %1731, label %1824

; <label>:1731                                    ; preds = %1726
  %1732 = load i32* %tc, align 4
  %1733 = sub nsw i32 %1732, 1
  %1734 = load i32* %maxc, align 4
  %1735 = icmp sle i32 %1733, %1734
  br i1 %1735, label %1736, label %1824

; <label>:1736                                    ; preds = %1731
  %1737 = load i32* %tr, align 4
  %1738 = add nsw i32 %1737, 1
  %1739 = load i32* %minr, align 4
  %1740 = icmp sge i32 %1738, %1739
  br i1 %1740, label %1741, label %1824

; <label>:1741                                    ; preds = %1736
  %1742 = load i32* %tr, align 4
  %1743 = add nsw i32 %1742, 1
  %1744 = load i32* %maxr, align 4
  %1745 = icmp sle i32 %1743, %1744
  br i1 %1745, label %1746, label %1824

; <label>:1746                                    ; preds = %1741
  %1747 = load %struct.variance_vtable** %8, align 8
  %1748 = getelementptr inbounds %struct.variance_vtable* %1747, i32 0, i32 2
  %1749 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1748, align 8
  %1750 = load i8** %y, align 8
  %1751 = load i32* %tr, align 4
  %1752 = add nsw i32 %1751, 1
  %1753 = ashr i32 %1752, 2
  %1754 = load i32* %y_stride, align 4
  %1755 = mul nsw i32 %1753, %1754
  %1756 = load i32* %tc, align 4
  %1757 = sub nsw i32 %1756, 1
  %1758 = ashr i32 %1757, 2
  %1759 = add nsw i32 %1755, %1758
  %1760 = load i32* %offset, align 4
  %1761 = sub nsw i32 %1759, %1760
  %1762 = sext i32 %1761 to i64
  %1763 = getelementptr inbounds i8* %1750, i64 %1762
  %1764 = load i32* %y_stride, align 4
  %1765 = load i32* %tc, align 4
  %1766 = sub nsw i32 %1765, 1
  %1767 = and i32 %1766, 3
  %1768 = shl i32 %1767, 1
  %1769 = load i32* %tr, align 4
  %1770 = add nsw i32 %1769, 1
  %1771 = and i32 %1770, 3
  %1772 = shl i32 %1771, 1
  %1773 = load i8** %z, align 8
  %1774 = load %struct.block** %3, align 8
  %1775 = getelementptr inbounds %struct.block* %1774, i32 0, i32 11
  %1776 = load i32* %1775, align 4
  %1777 = call i32 %1749(i8* %1763, i32 %1764, i32 %1768, i32 %1772, i8* %1773, i32 %1776, i32* %sse)
  store i32 %1777, i32* %thismse, align 4
  %1778 = load i32*** %9, align 8
  %1779 = icmp ne i32** %1778, null
  br i1 %1779, label %1780, label %1806

; <label>:1780                                    ; preds = %1746
  %1781 = load i32* %tr, align 4
  %1782 = add nsw i32 %1781, 1
  %1783 = load i32* %rr, align 4
  %1784 = sub nsw i32 %1782, %1783
  %1785 = sext i32 %1784 to i64
  %1786 = load i32*** %9, align 8
  %1787 = getelementptr inbounds i32** %1786, i64 0
  %1788 = load i32** %1787, align 8
  %1789 = getelementptr inbounds i32* %1788, i64 %1785
  %1790 = load i32* %1789, align 4
  %1791 = load i32* %tc, align 4
  %1792 = sub nsw i32 %1791, 1
  %1793 = load i32* %rc, align 4
  %1794 = sub nsw i32 %1792, %1793
  %1795 = sext i32 %1794 to i64
  %1796 = load i32*** %9, align 8
  %1797 = getelementptr inbounds i32** %1796, i64 1
  %1798 = load i32** %1797, align 8
  %1799 = getelementptr inbounds i32* %1798, i64 %1795
  %1800 = load i32* %1799, align 4
  %1801 = add nsw i32 %1790, %1800
  %1802 = load i32* %7, align 4
  %1803 = mul nsw i32 %1801, %1802
  %1804 = add nsw i32 %1803, 128
  %1805 = ashr i32 %1804, 8
  br label %1807

; <label>:1806                                    ; preds = %1746
  br label %1807

; <label>:1807                                    ; preds = %1806, %1780
  %1808 = phi i32 [ %1805, %1780 ], [ 0, %1806 ]
  %1809 = load i32* %thismse, align 4
  %1810 = add nsw i32 %1808, %1809
  store i32 %1810, i32* %diag, align 4
  %1811 = load i32* %besterr, align 4
  %1812 = icmp ult i32 %1810, %1811
  br i1 %1812, label %1813, label %1823

; <label>:1813                                    ; preds = %1807
  %1814 = load i32* %diag, align 4
  store i32 %1814, i32* %besterr, align 4
  %1815 = load i32* %tr, align 4
  %1816 = add nsw i32 %1815, 1
  store i32 %1816, i32* %br, align 4
  %1817 = load i32* %tc, align 4
  %1818 = sub nsw i32 %1817, 1
  store i32 %1818, i32* %bc, align 4
  %1819 = load i32* %thismse, align 4
  %1820 = load i32** %10, align 8
  store i32 %1819, i32* %1820, align 4
  %1821 = load i32* %sse, align 4
  %1822 = load i32** %11, align 8
  store i32 %1821, i32* %1822, align 4
  br label %1823

; <label>:1823                                    ; preds = %1813, %1807
  br label %1825

; <label>:1824                                    ; preds = %1741, %1736, %1731, %1726
  store i32 -1, i32* %diag, align 4
  br label %1825

; <label>:1825                                    ; preds = %1824, %1823
  br label %1926

; <label>:1826                                    ; preds = %1515
  %1827 = load i32* %tc, align 4
  %1828 = add nsw i32 %1827, 1
  %1829 = load i32* %minc, align 4
  %1830 = icmp sge i32 %1828, %1829
  br i1 %1830, label %1831, label %1924

; <label>:1831                                    ; preds = %1826
  %1832 = load i32* %tc, align 4
  %1833 = add nsw i32 %1832, 1
  %1834 = load i32* %maxc, align 4
  %1835 = icmp sle i32 %1833, %1834
  br i1 %1835, label %1836, label %1924

; <label>:1836                                    ; preds = %1831
  %1837 = load i32* %tr, align 4
  %1838 = add nsw i32 %1837, 1
  %1839 = load i32* %minr, align 4
  %1840 = icmp sge i32 %1838, %1839
  br i1 %1840, label %1841, label %1924

; <label>:1841                                    ; preds = %1836
  %1842 = load i32* %tr, align 4
  %1843 = add nsw i32 %1842, 1
  %1844 = load i32* %maxr, align 4
  %1845 = icmp sle i32 %1843, %1844
  br i1 %1845, label %1846, label %1924

; <label>:1846                                    ; preds = %1841
  %1847 = load %struct.variance_vtable** %8, align 8
  %1848 = getelementptr inbounds %struct.variance_vtable* %1847, i32 0, i32 2
  %1849 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1848, align 8
  %1850 = load i8** %y, align 8
  %1851 = load i32* %tr, align 4
  %1852 = add nsw i32 %1851, 1
  %1853 = ashr i32 %1852, 2
  %1854 = load i32* %y_stride, align 4
  %1855 = mul nsw i32 %1853, %1854
  %1856 = load i32* %tc, align 4
  %1857 = add nsw i32 %1856, 1
  %1858 = ashr i32 %1857, 2
  %1859 = add nsw i32 %1855, %1858
  %1860 = load i32* %offset, align 4
  %1861 = sub nsw i32 %1859, %1860
  %1862 = sext i32 %1861 to i64
  %1863 = getelementptr inbounds i8* %1850, i64 %1862
  %1864 = load i32* %y_stride, align 4
  %1865 = load i32* %tc, align 4
  %1866 = add nsw i32 %1865, 1
  %1867 = and i32 %1866, 3
  %1868 = shl i32 %1867, 1
  %1869 = load i32* %tr, align 4
  %1870 = add nsw i32 %1869, 1
  %1871 = and i32 %1870, 3
  %1872 = shl i32 %1871, 1
  %1873 = load i8** %z, align 8
  %1874 = load %struct.block** %3, align 8
  %1875 = getelementptr inbounds %struct.block* %1874, i32 0, i32 11
  %1876 = load i32* %1875, align 4
  %1877 = call i32 %1849(i8* %1863, i32 %1864, i32 %1868, i32 %1872, i8* %1873, i32 %1876, i32* %sse)
  store i32 %1877, i32* %thismse, align 4
  %1878 = load i32*** %9, align 8
  %1879 = icmp ne i32** %1878, null
  br i1 %1879, label %1880, label %1906

; <label>:1880                                    ; preds = %1846
  %1881 = load i32* %tr, align 4
  %1882 = add nsw i32 %1881, 1
  %1883 = load i32* %rr, align 4
  %1884 = sub nsw i32 %1882, %1883
  %1885 = sext i32 %1884 to i64
  %1886 = load i32*** %9, align 8
  %1887 = getelementptr inbounds i32** %1886, i64 0
  %1888 = load i32** %1887, align 8
  %1889 = getelementptr inbounds i32* %1888, i64 %1885
  %1890 = load i32* %1889, align 4
  %1891 = load i32* %tc, align 4
  %1892 = add nsw i32 %1891, 1
  %1893 = load i32* %rc, align 4
  %1894 = sub nsw i32 %1892, %1893
  %1895 = sext i32 %1894 to i64
  %1896 = load i32*** %9, align 8
  %1897 = getelementptr inbounds i32** %1896, i64 1
  %1898 = load i32** %1897, align 8
  %1899 = getelementptr inbounds i32* %1898, i64 %1895
  %1900 = load i32* %1899, align 4
  %1901 = add nsw i32 %1890, %1900
  %1902 = load i32* %7, align 4
  %1903 = mul nsw i32 %1901, %1902
  %1904 = add nsw i32 %1903, 128
  %1905 = ashr i32 %1904, 8
  br label %1907

; <label>:1906                                    ; preds = %1846
  br label %1907

; <label>:1907                                    ; preds = %1906, %1880
  %1908 = phi i32 [ %1905, %1880 ], [ 0, %1906 ]
  %1909 = load i32* %thismse, align 4
  %1910 = add nsw i32 %1908, %1909
  store i32 %1910, i32* %diag, align 4
  %1911 = load i32* %besterr, align 4
  %1912 = icmp ult i32 %1910, %1911
  br i1 %1912, label %1913, label %1923

; <label>:1913                                    ; preds = %1907
  %1914 = load i32* %diag, align 4
  store i32 %1914, i32* %besterr, align 4
  %1915 = load i32* %tr, align 4
  %1916 = add nsw i32 %1915, 1
  store i32 %1916, i32* %br, align 4
  %1917 = load i32* %tc, align 4
  %1918 = add nsw i32 %1917, 1
  store i32 %1918, i32* %bc, align 4
  %1919 = load i32* %thismse, align 4
  %1920 = load i32** %10, align 8
  store i32 %1919, i32* %1920, align 4
  %1921 = load i32* %sse, align 4
  %1922 = load i32** %11, align 8
  store i32 %1921, i32* %1922, align 4
  br label %1923

; <label>:1923                                    ; preds = %1913, %1907
  br label %1925

; <label>:1924                                    ; preds = %1841, %1836, %1831, %1826
  store i32 -1, i32* %diag, align 4
  br label %1925

; <label>:1925                                    ; preds = %1924, %1923
  br label %1926

; <label>:1926                                    ; preds = %1515, %1925, %1825, %1725, %1625
  %1927 = load i32* %tr, align 4
  %1928 = load i32* %br, align 4
  %1929 = icmp eq i32 %1927, %1928
  br i1 %1929, label %1930, label %1935

; <label>:1930                                    ; preds = %1926
  %1931 = load i32* %tc, align 4
  %1932 = load i32* %bc, align 4
  %1933 = icmp eq i32 %1931, %1932
  br i1 %1933, label %1934, label %1935

; <label>:1934                                    ; preds = %1930
  br label %1938

; <label>:1935                                    ; preds = %1930, %1926
  %1936 = load i32* %br, align 4
  store i32 %1936, i32* %tr, align 4
  %1937 = load i32* %bc, align 4
  store i32 %1937, i32* %tc, align 4
  br label %1139

; <label>:1938                                    ; preds = %1934, %1139
  %1939 = load i32* %br, align 4
  %1940 = mul nsw i32 %1939, 2
  %1941 = trunc i32 %1940 to i16
  %1942 = load %union.int_mv** %5, align 8
  %1943 = bitcast %union.int_mv* %1942 to %struct.MV*
  %1944 = getelementptr inbounds %struct.MV* %1943, i32 0, i32 0
  store i16 %1941, i16* %1944, align 2
  %1945 = load i32* %bc, align 4
  %1946 = mul nsw i32 %1945, 2
  %1947 = trunc i32 %1946 to i16
  %1948 = load %union.int_mv** %5, align 8
  %1949 = bitcast %union.int_mv* %1948 to %struct.MV*
  %1950 = getelementptr inbounds %struct.MV* %1949, i32 0, i32 1
  store i16 %1947, i16* %1950, align 2
  %1951 = load %union.int_mv** %5, align 8
  %1952 = bitcast %union.int_mv* %1951 to %struct.MV*
  %1953 = getelementptr inbounds %struct.MV* %1952, i32 0, i32 1
  %1954 = load i16* %1953, align 2
  %1955 = sext i16 %1954 to i32
  %1956 = load %union.int_mv** %6, align 8
  %1957 = bitcast %union.int_mv* %1956 to %struct.MV*
  %1958 = getelementptr inbounds %struct.MV* %1957, i32 0, i32 1
  %1959 = load i16* %1958, align 2
  %1960 = sext i16 %1959 to i32
  %1961 = sub nsw i32 %1955, %1960
  %1962 = call i32 @abs(i32 %1961) #3
  %1963 = icmp sgt i32 %1962, 2040
  br i1 %1963, label %1978, label %1964

; <label>:1964                                    ; preds = %1938
  %1965 = load %union.int_mv** %5, align 8
  %1966 = bitcast %union.int_mv* %1965 to %struct.MV*
  %1967 = getelementptr inbounds %struct.MV* %1966, i32 0, i32 0
  %1968 = load i16* %1967, align 2
  %1969 = sext i16 %1968 to i32
  %1970 = load %union.int_mv** %6, align 8
  %1971 = bitcast %union.int_mv* %1970 to %struct.MV*
  %1972 = getelementptr inbounds %struct.MV* %1971, i32 0, i32 0
  %1973 = load i16* %1972, align 2
  %1974 = sext i16 %1973 to i32
  %1975 = sub nsw i32 %1969, %1974
  %1976 = call i32 @abs(i32 %1975) #3
  %1977 = icmp sgt i32 %1976, 2040
  br i1 %1977, label %1978, label %1979

; <label>:1978                                    ; preds = %1964, %1938
  store i32 2147483647, i32* %1
  br label %1981

; <label>:1979                                    ; preds = %1964
  %1980 = load i32* %besterr, align 4
  store i32 %1980, i32* %1
  br label %1981

; <label>:1981                                    ; preds = %1979, %1978
  %1982 = load i32* %1
  ret i32 %1982
}

; Function Attrs: nounwind uwtable
define internal i32 @mv_err_cost(%union.int_mv* %mv, %union.int_mv* %ref, i32** %mvcost, i32 %error_per_bit) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %union.int_mv*, align 8
  %3 = alloca %union.int_mv*, align 8
  %4 = alloca i32**, align 8
  %5 = alloca i32, align 4
  store %union.int_mv* %mv, %union.int_mv** %2, align 8
  store %union.int_mv* %ref, %union.int_mv** %3, align 8
  store i32** %mvcost, i32*** %4, align 8
  store i32 %error_per_bit, i32* %5, align 4
  %6 = load i32*** %4, align 8
  %7 = icmp ne i32** %6, null
  br i1 %7, label %8, label %50

; <label>:8                                       ; preds = %0
  %9 = load %union.int_mv** %2, align 8
  %10 = bitcast %union.int_mv* %9 to %struct.MV*
  %11 = getelementptr inbounds %struct.MV* %10, i32 0, i32 0
  %12 = load i16* %11, align 2
  %13 = sext i16 %12 to i32
  %14 = load %union.int_mv** %3, align 8
  %15 = bitcast %union.int_mv* %14 to %struct.MV*
  %16 = getelementptr inbounds %struct.MV* %15, i32 0, i32 0
  %17 = load i16* %16, align 2
  %18 = sext i16 %17 to i32
  %19 = sub nsw i32 %13, %18
  %20 = ashr i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = load i32*** %4, align 8
  %23 = getelementptr inbounds i32** %22, i64 0
  %24 = load i32** %23, align 8
  %25 = getelementptr inbounds i32* %24, i64 %21
  %26 = load i32* %25, align 4
  %27 = load %union.int_mv** %2, align 8
  %28 = bitcast %union.int_mv* %27 to %struct.MV*
  %29 = getelementptr inbounds %struct.MV* %28, i32 0, i32 1
  %30 = load i16* %29, align 2
  %31 = sext i16 %30 to i32
  %32 = load %union.int_mv** %3, align 8
  %33 = bitcast %union.int_mv* %32 to %struct.MV*
  %34 = getelementptr inbounds %struct.MV* %33, i32 0, i32 1
  %35 = load i16* %34, align 2
  %36 = sext i16 %35 to i32
  %37 = sub nsw i32 %31, %36
  %38 = ashr i32 %37, 1
  %39 = sext i32 %38 to i64
  %40 = load i32*** %4, align 8
  %41 = getelementptr inbounds i32** %40, i64 1
  %42 = load i32** %41, align 8
  %43 = getelementptr inbounds i32* %42, i64 %39
  %44 = load i32* %43, align 4
  %45 = add nsw i32 %26, %44
  %46 = load i32* %5, align 4
  %47 = mul nsw i32 %45, %46
  %48 = add nsw i32 %47, 128
  %49 = ashr i32 %48, 8
  store i32 %49, i32* %1
  br label %51

; <label>:50                                      ; preds = %0
  store i32 0, i32* %1
  br label %51

; <label>:51                                      ; preds = %50, %8
  %52 = load i32* %1
  ret i32 %52
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #1

; Function Attrs: nounwind uwtable
define i32 @vp8_find_best_sub_pixel_step(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32 %error_per_bit, %struct.variance_vtable* %vfp, i32** %mvcost, i32* %distortion, i32* %sse1) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca %struct.block*, align 8
  %3 = alloca %struct.blockd*, align 8
  %4 = alloca %union.int_mv*, align 8
  %5 = alloca %union.int_mv*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.variance_vtable*, align 8
  %8 = alloca i32**, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32*, align 8
  %bestmse = alloca i32, align 4
  %startmv = alloca %union.int_mv, align 4
  %this_mv = alloca %union.int_mv, align 4
  %z = alloca i8*, align 8
  %left = alloca i32, align 4
  %right = alloca i32, align 4
  %up = alloca i32, align 4
  %down = alloca i32, align 4
  %diag = alloca i32, align 4
  %sse = alloca i32, align 4
  %whichdir = alloca i32, align 4
  %thismse = alloca i32, align 4
  %y_stride = alloca i32, align 4
  %pre_stride = alloca i32, align 4
  %base_pre = alloca i8*, align 8
  %xd = alloca %struct.macroblockd*, align 8
  %y_0 = alloca i8*, align 8
  %y = alloca i8*, align 8
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  store %struct.block* %b, %struct.block** %2, align 8
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  store %union.int_mv* %bestmv, %union.int_mv** %4, align 8
  store %union.int_mv* %ref_mv, %union.int_mv** %5, align 8
  store i32 %error_per_bit, i32* %6, align 4
  store %struct.variance_vtable* %vfp, %struct.variance_vtable** %7, align 8
  store i32** %mvcost, i32*** %8, align 8
  store i32* %distortion, i32** %9, align 8
  store i32* %sse1, i32** %10, align 8
  store i32 2147483647, i32* %bestmse, align 4
  %11 = load %struct.block** %2, align 8
  %12 = getelementptr inbounds %struct.block* %11, i32 0, i32 9
  %13 = load i8*** %12, align 8
  %14 = load i8** %13, align 8
  %15 = load %struct.block** %2, align 8
  %16 = getelementptr inbounds %struct.block* %15, i32 0, i32 10
  %17 = load i32* %16, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8* %14, i64 %18
  store i8* %19, i8** %z, align 8
  %20 = load %struct.macroblock** %1, align 8
  %21 = getelementptr inbounds %struct.macroblock* %20, i32 0, i32 7
  %22 = getelementptr inbounds %struct.macroblockd* %21, i32 0, i32 11
  %23 = getelementptr inbounds %struct.yv12_buffer_config* %22, i32 0, i32 4
  %24 = load i32* %23, align 4
  store i32 %24, i32* %pre_stride, align 4
  %25 = load %struct.macroblock** %1, align 8
  %26 = getelementptr inbounds %struct.macroblock* %25, i32 0, i32 7
  %27 = getelementptr inbounds %struct.macroblockd* %26, i32 0, i32 11
  %28 = getelementptr inbounds %struct.yv12_buffer_config* %27, i32 0, i32 13
  %29 = load i8** %28, align 8
  store i8* %29, i8** %base_pre, align 8
  %30 = load %struct.macroblock** %1, align 8
  %31 = getelementptr inbounds %struct.macroblock* %30, i32 0, i32 7
  store %struct.macroblockd* %31, %struct.macroblockd** %xd, align 8
  %32 = load i8** %base_pre, align 8
  %33 = load %struct.blockd** %3, align 8
  %34 = getelementptr inbounds %struct.blockd* %33, i32 0, i32 4
  %35 = load i32* %34, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8* %32, i64 %36
  %38 = load %union.int_mv** %4, align 8
  %39 = bitcast %union.int_mv* %38 to %struct.MV*
  %40 = getelementptr inbounds %struct.MV* %39, i32 0, i32 0
  %41 = load i16* %40, align 2
  %42 = sext i16 %41 to i32
  %43 = load i32* %pre_stride, align 4
  %44 = mul nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8* %37, i64 %45
  %47 = load %union.int_mv** %4, align 8
  %48 = bitcast %union.int_mv* %47 to %struct.MV*
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1
  %50 = load i16* %49, align 2
  %51 = sext i16 %50 to i32
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8* %46, i64 %52
  store i8* %53, i8** %y_0, align 8
  store i32 32, i32* %y_stride, align 4
  %54 = load %struct.variance_vtable** %7, align 8
  %55 = getelementptr inbounds %struct.variance_vtable* %54, i32 0, i32 9
  %56 = load void (i8*, i32, i8*, i32, i32)** %55, align 8
  %57 = load i8** %y_0, align 8
  %58 = getelementptr inbounds i8* %57, i64 -1
  %59 = load i32* %pre_stride, align 4
  %60 = sext i32 %59 to i64
  %61 = sub i64 0, %60
  %62 = getelementptr inbounds i8* %58, i64 %61
  %63 = load i32* %pre_stride, align 4
  %64 = load %struct.macroblockd** %xd, align 8
  %65 = getelementptr inbounds %struct.macroblockd* %64, i32 0, i32 46
  %66 = getelementptr inbounds [704 x i8]* %65, i32 0, i32 0
  %67 = load i32* %y_stride, align 4
  call void %56(i8* %62, i32 %63, i8* %66, i32 %67, i32 18)
  %68 = load %struct.macroblockd** %xd, align 8
  %69 = getelementptr inbounds %struct.macroblockd* %68, i32 0, i32 46
  %70 = getelementptr inbounds [704 x i8]* %69, i32 0, i32 0
  %71 = load i32* %y_stride, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8* %70, i64 %72
  %74 = getelementptr inbounds i8* %73, i64 1
  store i8* %74, i8** %y, align 8
  %75 = load %union.int_mv** %4, align 8
  %76 = bitcast %union.int_mv* %75 to %struct.MV*
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0
  %78 = load i16* %77, align 2
  %79 = sext i16 %78 to i32
  %80 = shl i32 %79, 3
  %81 = trunc i32 %80 to i16
  store i16 %81, i16* %77, align 2
  %82 = load %union.int_mv** %4, align 8
  %83 = bitcast %union.int_mv* %82 to %struct.MV*
  %84 = getelementptr inbounds %struct.MV* %83, i32 0, i32 1
  %85 = load i16* %84, align 2
  %86 = sext i16 %85 to i32
  %87 = shl i32 %86, 3
  %88 = trunc i32 %87 to i16
  store i16 %88, i16* %84, align 2
  %89 = load %union.int_mv** %4, align 8
  %90 = bitcast %union.int_mv* %startmv to i8*
  %91 = bitcast %union.int_mv* %89 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %90, i8* %91, i64 4, i32 4, i1 false)
  %92 = load %struct.variance_vtable** %7, align 8
  %93 = getelementptr inbounds %struct.variance_vtable* %92, i32 0, i32 1
  %94 = load i32 (i8*, i32, i8*, i32, i32*)** %93, align 8
  %95 = load i8** %y, align 8
  %96 = load i32* %y_stride, align 4
  %97 = load i8** %z, align 8
  %98 = load %struct.block** %2, align 8
  %99 = getelementptr inbounds %struct.block* %98, i32 0, i32 11
  %100 = load i32* %99, align 4
  %101 = load i32** %10, align 8
  %102 = call i32 %94(i8* %95, i32 %96, i8* %97, i32 %100, i32* %101)
  store i32 %102, i32* %bestmse, align 4
  %103 = load i32* %bestmse, align 4
  %104 = load i32** %9, align 8
  store i32 %103, i32* %104, align 4
  %105 = load %union.int_mv** %4, align 8
  %106 = load %union.int_mv** %5, align 8
  %107 = load i32*** %8, align 8
  %108 = load i32* %6, align 4
  %109 = call i32 @mv_err_cost(%union.int_mv* %105, %union.int_mv* %106, i32** %107, i32 %108)
  %110 = load i32* %bestmse, align 4
  %111 = add nsw i32 %110, %109
  store i32 %111, i32* %bestmse, align 4
  %112 = bitcast %union.int_mv* %startmv to %struct.MV*
  %113 = getelementptr inbounds %struct.MV* %112, i32 0, i32 0
  %114 = load i16* %113, align 2
  %115 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %116 = getelementptr inbounds %struct.MV* %115, i32 0, i32 0
  store i16 %114, i16* %116, align 2
  %117 = bitcast %union.int_mv* %startmv to %struct.MV*
  %118 = getelementptr inbounds %struct.MV* %117, i32 0, i32 1
  %119 = load i16* %118, align 2
  %120 = sext i16 %119 to i32
  %121 = sub nsw i32 %120, 8
  %122 = or i32 %121, 4
  %123 = trunc i32 %122 to i16
  %124 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %125 = getelementptr inbounds %struct.MV* %124, i32 0, i32 1
  store i16 %123, i16* %125, align 2
  %126 = load %struct.variance_vtable** %7, align 8
  %127 = getelementptr inbounds %struct.variance_vtable* %126, i32 0, i32 3
  %128 = load i32 (i8*, i32, i8*, i32, i32*)** %127, align 8
  %129 = load i8** %y, align 8
  %130 = getelementptr inbounds i8* %129, i64 -1
  %131 = load i32* %y_stride, align 4
  %132 = load i8** %z, align 8
  %133 = load %struct.block** %2, align 8
  %134 = getelementptr inbounds %struct.block* %133, i32 0, i32 11
  %135 = load i32* %134, align 4
  %136 = call i32 %128(i8* %130, i32 %131, i8* %132, i32 %135, i32* %sse)
  store i32 %136, i32* %thismse, align 4
  %137 = load i32* %thismse, align 4
  %138 = load %union.int_mv** %5, align 8
  %139 = load i32*** %8, align 8
  %140 = load i32* %6, align 4
  %141 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %138, i32** %139, i32 %140)
  %142 = add nsw i32 %137, %141
  store i32 %142, i32* %left, align 4
  %143 = load i32* %left, align 4
  %144 = load i32* %bestmse, align 4
  %145 = icmp slt i32 %143, %144
  br i1 %145, label %146, label %155

; <label>:146                                     ; preds = %0
  %147 = load %union.int_mv** %4, align 8
  %148 = bitcast %union.int_mv* %147 to i8*
  %149 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %148, i8* %149, i64 4, i32 4, i1 false)
  %150 = load i32* %left, align 4
  store i32 %150, i32* %bestmse, align 4
  %151 = load i32* %thismse, align 4
  %152 = load i32** %9, align 8
  store i32 %151, i32* %152, align 4
  %153 = load i32* %sse, align 4
  %154 = load i32** %10, align 8
  store i32 %153, i32* %154, align 4
  br label %155

; <label>:155                                     ; preds = %146, %0
  %156 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %157 = getelementptr inbounds %struct.MV* %156, i32 0, i32 1
  %158 = load i16* %157, align 2
  %159 = sext i16 %158 to i32
  %160 = add nsw i32 %159, 8
  %161 = trunc i32 %160 to i16
  store i16 %161, i16* %157, align 2
  %162 = load %struct.variance_vtable** %7, align 8
  %163 = getelementptr inbounds %struct.variance_vtable* %162, i32 0, i32 3
  %164 = load i32 (i8*, i32, i8*, i32, i32*)** %163, align 8
  %165 = load i8** %y, align 8
  %166 = load i32* %y_stride, align 4
  %167 = load i8** %z, align 8
  %168 = load %struct.block** %2, align 8
  %169 = getelementptr inbounds %struct.block* %168, i32 0, i32 11
  %170 = load i32* %169, align 4
  %171 = call i32 %164(i8* %165, i32 %166, i8* %167, i32 %170, i32* %sse)
  store i32 %171, i32* %thismse, align 4
  %172 = load i32* %thismse, align 4
  %173 = load %union.int_mv** %5, align 8
  %174 = load i32*** %8, align 8
  %175 = load i32* %6, align 4
  %176 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %173, i32** %174, i32 %175)
  %177 = add nsw i32 %172, %176
  store i32 %177, i32* %right, align 4
  %178 = load i32* %right, align 4
  %179 = load i32* %bestmse, align 4
  %180 = icmp slt i32 %178, %179
  br i1 %180, label %181, label %190

; <label>:181                                     ; preds = %155
  %182 = load %union.int_mv** %4, align 8
  %183 = bitcast %union.int_mv* %182 to i8*
  %184 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %183, i8* %184, i64 4, i32 4, i1 false)
  %185 = load i32* %right, align 4
  store i32 %185, i32* %bestmse, align 4
  %186 = load i32* %thismse, align 4
  %187 = load i32** %9, align 8
  store i32 %186, i32* %187, align 4
  %188 = load i32* %sse, align 4
  %189 = load i32** %10, align 8
  store i32 %188, i32* %189, align 4
  br label %190

; <label>:190                                     ; preds = %181, %155
  %191 = bitcast %union.int_mv* %startmv to %struct.MV*
  %192 = getelementptr inbounds %struct.MV* %191, i32 0, i32 1
  %193 = load i16* %192, align 2
  %194 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %195 = getelementptr inbounds %struct.MV* %194, i32 0, i32 1
  store i16 %193, i16* %195, align 2
  %196 = bitcast %union.int_mv* %startmv to %struct.MV*
  %197 = getelementptr inbounds %struct.MV* %196, i32 0, i32 0
  %198 = load i16* %197, align 2
  %199 = sext i16 %198 to i32
  %200 = sub nsw i32 %199, 8
  %201 = or i32 %200, 4
  %202 = trunc i32 %201 to i16
  %203 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %204 = getelementptr inbounds %struct.MV* %203, i32 0, i32 0
  store i16 %202, i16* %204, align 2
  %205 = load %struct.variance_vtable** %7, align 8
  %206 = getelementptr inbounds %struct.variance_vtable* %205, i32 0, i32 4
  %207 = load i32 (i8*, i32, i8*, i32, i32*)** %206, align 8
  %208 = load i8** %y, align 8
  %209 = load i32* %y_stride, align 4
  %210 = sext i32 %209 to i64
  %211 = sub i64 0, %210
  %212 = getelementptr inbounds i8* %208, i64 %211
  %213 = load i32* %y_stride, align 4
  %214 = load i8** %z, align 8
  %215 = load %struct.block** %2, align 8
  %216 = getelementptr inbounds %struct.block* %215, i32 0, i32 11
  %217 = load i32* %216, align 4
  %218 = call i32 %207(i8* %212, i32 %213, i8* %214, i32 %217, i32* %sse)
  store i32 %218, i32* %thismse, align 4
  %219 = load i32* %thismse, align 4
  %220 = load %union.int_mv** %5, align 8
  %221 = load i32*** %8, align 8
  %222 = load i32* %6, align 4
  %223 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %220, i32** %221, i32 %222)
  %224 = add nsw i32 %219, %223
  store i32 %224, i32* %up, align 4
  %225 = load i32* %up, align 4
  %226 = load i32* %bestmse, align 4
  %227 = icmp slt i32 %225, %226
  br i1 %227, label %228, label %237

; <label>:228                                     ; preds = %190
  %229 = load %union.int_mv** %4, align 8
  %230 = bitcast %union.int_mv* %229 to i8*
  %231 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %230, i8* %231, i64 4, i32 4, i1 false)
  %232 = load i32* %up, align 4
  store i32 %232, i32* %bestmse, align 4
  %233 = load i32* %thismse, align 4
  %234 = load i32** %9, align 8
  store i32 %233, i32* %234, align 4
  %235 = load i32* %sse, align 4
  %236 = load i32** %10, align 8
  store i32 %235, i32* %236, align 4
  br label %237

; <label>:237                                     ; preds = %228, %190
  %238 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %239 = getelementptr inbounds %struct.MV* %238, i32 0, i32 0
  %240 = load i16* %239, align 2
  %241 = sext i16 %240 to i32
  %242 = add nsw i32 %241, 8
  %243 = trunc i32 %242 to i16
  store i16 %243, i16* %239, align 2
  %244 = load %struct.variance_vtable** %7, align 8
  %245 = getelementptr inbounds %struct.variance_vtable* %244, i32 0, i32 4
  %246 = load i32 (i8*, i32, i8*, i32, i32*)** %245, align 8
  %247 = load i8** %y, align 8
  %248 = load i32* %y_stride, align 4
  %249 = load i8** %z, align 8
  %250 = load %struct.block** %2, align 8
  %251 = getelementptr inbounds %struct.block* %250, i32 0, i32 11
  %252 = load i32* %251, align 4
  %253 = call i32 %246(i8* %247, i32 %248, i8* %249, i32 %252, i32* %sse)
  store i32 %253, i32* %thismse, align 4
  %254 = load i32* %thismse, align 4
  %255 = load %union.int_mv** %5, align 8
  %256 = load i32*** %8, align 8
  %257 = load i32* %6, align 4
  %258 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %255, i32** %256, i32 %257)
  %259 = add nsw i32 %254, %258
  store i32 %259, i32* %down, align 4
  %260 = load i32* %down, align 4
  %261 = load i32* %bestmse, align 4
  %262 = icmp slt i32 %260, %261
  br i1 %262, label %263, label %272

; <label>:263                                     ; preds = %237
  %264 = load %union.int_mv** %4, align 8
  %265 = bitcast %union.int_mv* %264 to i8*
  %266 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %265, i8* %266, i64 4, i32 4, i1 false)
  %267 = load i32* %down, align 4
  store i32 %267, i32* %bestmse, align 4
  %268 = load i32* %thismse, align 4
  %269 = load i32** %9, align 8
  store i32 %268, i32* %269, align 4
  %270 = load i32* %sse, align 4
  %271 = load i32** %10, align 8
  store i32 %270, i32* %271, align 4
  br label %272

; <label>:272                                     ; preds = %263, %237
  %273 = load i32* %left, align 4
  %274 = load i32* %right, align 4
  %275 = icmp slt i32 %273, %274
  %276 = select i1 %275, i32 0, i32 1
  %277 = load i32* %up, align 4
  %278 = load i32* %down, align 4
  %279 = icmp slt i32 %277, %278
  %280 = select i1 %279, i32 0, i32 2
  %281 = add nsw i32 %276, %280
  store i32 %281, i32* %whichdir, align 4
  %282 = bitcast %union.int_mv* %this_mv to i8*
  %283 = bitcast %union.int_mv* %startmv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %282, i8* %283, i64 4, i32 4, i1 false)
  %284 = load i32* %whichdir, align 4
  switch i32 %284, label %377 [
    i32 0, label %285
    i32 1, label %319
    i32 2, label %349
    i32 3, label %376
  ]

; <label>:285                                     ; preds = %272
  %286 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %287 = getelementptr inbounds %struct.MV* %286, i32 0, i32 1
  %288 = load i16* %287, align 2
  %289 = sext i16 %288 to i32
  %290 = sub nsw i32 %289, 8
  %291 = or i32 %290, 4
  %292 = trunc i32 %291 to i16
  %293 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %294 = getelementptr inbounds %struct.MV* %293, i32 0, i32 1
  store i16 %292, i16* %294, align 2
  %295 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %296 = getelementptr inbounds %struct.MV* %295, i32 0, i32 0
  %297 = load i16* %296, align 2
  %298 = sext i16 %297 to i32
  %299 = sub nsw i32 %298, 8
  %300 = or i32 %299, 4
  %301 = trunc i32 %300 to i16
  %302 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %303 = getelementptr inbounds %struct.MV* %302, i32 0, i32 0
  store i16 %301, i16* %303, align 2
  %304 = load %struct.variance_vtable** %7, align 8
  %305 = getelementptr inbounds %struct.variance_vtable* %304, i32 0, i32 5
  %306 = load i32 (i8*, i32, i8*, i32, i32*)** %305, align 8
  %307 = load i8** %y, align 8
  %308 = getelementptr inbounds i8* %307, i64 -1
  %309 = load i32* %y_stride, align 4
  %310 = sext i32 %309 to i64
  %311 = sub i64 0, %310
  %312 = getelementptr inbounds i8* %308, i64 %311
  %313 = load i32* %y_stride, align 4
  %314 = load i8** %z, align 8
  %315 = load %struct.block** %2, align 8
  %316 = getelementptr inbounds %struct.block* %315, i32 0, i32 11
  %317 = load i32* %316, align 4
  %318 = call i32 %306(i8* %312, i32 %313, i8* %314, i32 %317, i32* %sse)
  store i32 %318, i32* %thismse, align 4
  br label %400

; <label>:319                                     ; preds = %272
  %320 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %321 = getelementptr inbounds %struct.MV* %320, i32 0, i32 1
  %322 = load i16* %321, align 2
  %323 = sext i16 %322 to i32
  %324 = add nsw i32 %323, 4
  %325 = trunc i32 %324 to i16
  store i16 %325, i16* %321, align 2
  %326 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %327 = getelementptr inbounds %struct.MV* %326, i32 0, i32 0
  %328 = load i16* %327, align 2
  %329 = sext i16 %328 to i32
  %330 = sub nsw i32 %329, 8
  %331 = or i32 %330, 4
  %332 = trunc i32 %331 to i16
  %333 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %334 = getelementptr inbounds %struct.MV* %333, i32 0, i32 0
  store i16 %332, i16* %334, align 2
  %335 = load %struct.variance_vtable** %7, align 8
  %336 = getelementptr inbounds %struct.variance_vtable* %335, i32 0, i32 5
  %337 = load i32 (i8*, i32, i8*, i32, i32*)** %336, align 8
  %338 = load i8** %y, align 8
  %339 = load i32* %y_stride, align 4
  %340 = sext i32 %339 to i64
  %341 = sub i64 0, %340
  %342 = getelementptr inbounds i8* %338, i64 %341
  %343 = load i32* %y_stride, align 4
  %344 = load i8** %z, align 8
  %345 = load %struct.block** %2, align 8
  %346 = getelementptr inbounds %struct.block* %345, i32 0, i32 11
  %347 = load i32* %346, align 4
  %348 = call i32 %337(i8* %342, i32 %343, i8* %344, i32 %347, i32* %sse)
  store i32 %348, i32* %thismse, align 4
  br label %400

; <label>:349                                     ; preds = %272
  %350 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %351 = getelementptr inbounds %struct.MV* %350, i32 0, i32 1
  %352 = load i16* %351, align 2
  %353 = sext i16 %352 to i32
  %354 = sub nsw i32 %353, 8
  %355 = or i32 %354, 4
  %356 = trunc i32 %355 to i16
  %357 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %358 = getelementptr inbounds %struct.MV* %357, i32 0, i32 1
  store i16 %356, i16* %358, align 2
  %359 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %360 = getelementptr inbounds %struct.MV* %359, i32 0, i32 0
  %361 = load i16* %360, align 2
  %362 = sext i16 %361 to i32
  %363 = add nsw i32 %362, 4
  %364 = trunc i32 %363 to i16
  store i16 %364, i16* %360, align 2
  %365 = load %struct.variance_vtable** %7, align 8
  %366 = getelementptr inbounds %struct.variance_vtable* %365, i32 0, i32 5
  %367 = load i32 (i8*, i32, i8*, i32, i32*)** %366, align 8
  %368 = load i8** %y, align 8
  %369 = getelementptr inbounds i8* %368, i64 -1
  %370 = load i32* %y_stride, align 4
  %371 = load i8** %z, align 8
  %372 = load %struct.block** %2, align 8
  %373 = getelementptr inbounds %struct.block* %372, i32 0, i32 11
  %374 = load i32* %373, align 4
  %375 = call i32 %367(i8* %369, i32 %370, i8* %371, i32 %374, i32* %sse)
  store i32 %375, i32* %thismse, align 4
  br label %400

; <label>:376                                     ; preds = %272
  br label %377

; <label>:377                                     ; preds = %272, %376
  %378 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %379 = getelementptr inbounds %struct.MV* %378, i32 0, i32 1
  %380 = load i16* %379, align 2
  %381 = sext i16 %380 to i32
  %382 = add nsw i32 %381, 4
  %383 = trunc i32 %382 to i16
  store i16 %383, i16* %379, align 2
  %384 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %385 = getelementptr inbounds %struct.MV* %384, i32 0, i32 0
  %386 = load i16* %385, align 2
  %387 = sext i16 %386 to i32
  %388 = add nsw i32 %387, 4
  %389 = trunc i32 %388 to i16
  store i16 %389, i16* %385, align 2
  %390 = load %struct.variance_vtable** %7, align 8
  %391 = getelementptr inbounds %struct.variance_vtable* %390, i32 0, i32 5
  %392 = load i32 (i8*, i32, i8*, i32, i32*)** %391, align 8
  %393 = load i8** %y, align 8
  %394 = load i32* %y_stride, align 4
  %395 = load i8** %z, align 8
  %396 = load %struct.block** %2, align 8
  %397 = getelementptr inbounds %struct.block* %396, i32 0, i32 11
  %398 = load i32* %397, align 4
  %399 = call i32 %392(i8* %393, i32 %394, i8* %395, i32 %398, i32* %sse)
  store i32 %399, i32* %thismse, align 4
  br label %400

; <label>:400                                     ; preds = %377, %349, %319, %285
  %401 = load i32* %thismse, align 4
  %402 = load %union.int_mv** %5, align 8
  %403 = load i32*** %8, align 8
  %404 = load i32* %6, align 4
  %405 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %402, i32** %403, i32 %404)
  %406 = add nsw i32 %401, %405
  store i32 %406, i32* %diag, align 4
  %407 = load i32* %diag, align 4
  %408 = load i32* %bestmse, align 4
  %409 = icmp slt i32 %407, %408
  br i1 %409, label %410, label %419

; <label>:410                                     ; preds = %400
  %411 = load %union.int_mv** %4, align 8
  %412 = bitcast %union.int_mv* %411 to i8*
  %413 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %412, i8* %413, i64 4, i32 4, i1 false)
  %414 = load i32* %diag, align 4
  store i32 %414, i32* %bestmse, align 4
  %415 = load i32* %thismse, align 4
  %416 = load i32** %9, align 8
  store i32 %415, i32* %416, align 4
  %417 = load i32* %sse, align 4
  %418 = load i32** %10, align 8
  store i32 %417, i32* %418, align 4
  br label %419

; <label>:419                                     ; preds = %410, %400
  %420 = load %union.int_mv** %4, align 8
  %421 = bitcast %union.int_mv* %420 to %struct.MV*
  %422 = getelementptr inbounds %struct.MV* %421, i32 0, i32 0
  %423 = load i16* %422, align 2
  %424 = sext i16 %423 to i32
  %425 = bitcast %union.int_mv* %startmv to %struct.MV*
  %426 = getelementptr inbounds %struct.MV* %425, i32 0, i32 0
  %427 = load i16* %426, align 2
  %428 = sext i16 %427 to i32
  %429 = icmp slt i32 %424, %428
  br i1 %429, label %430, label %436

; <label>:430                                     ; preds = %419
  %431 = load i32* %y_stride, align 4
  %432 = load i8** %y, align 8
  %433 = sext i32 %431 to i64
  %434 = sub i64 0, %433
  %435 = getelementptr inbounds i8* %432, i64 %434
  store i8* %435, i8** %y, align 8
  br label %436

; <label>:436                                     ; preds = %430, %419
  %437 = load %union.int_mv** %4, align 8
  %438 = bitcast %union.int_mv* %437 to %struct.MV*
  %439 = getelementptr inbounds %struct.MV* %438, i32 0, i32 1
  %440 = load i16* %439, align 2
  %441 = sext i16 %440 to i32
  %442 = bitcast %union.int_mv* %startmv to %struct.MV*
  %443 = getelementptr inbounds %struct.MV* %442, i32 0, i32 1
  %444 = load i16* %443, align 2
  %445 = sext i16 %444 to i32
  %446 = icmp slt i32 %441, %445
  br i1 %446, label %447, label %450

; <label>:447                                     ; preds = %436
  %448 = load i8** %y, align 8
  %449 = getelementptr inbounds i8* %448, i32 -1
  store i8* %449, i8** %y, align 8
  br label %450

; <label>:450                                     ; preds = %447, %436
  %451 = load %union.int_mv** %4, align 8
  %452 = bitcast %union.int_mv* %startmv to i8*
  %453 = bitcast %union.int_mv* %451 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %452, i8* %453, i64 4, i32 4, i1 false)
  %454 = bitcast %union.int_mv* %startmv to %struct.MV*
  %455 = getelementptr inbounds %struct.MV* %454, i32 0, i32 0
  %456 = load i16* %455, align 2
  %457 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %458 = getelementptr inbounds %struct.MV* %457, i32 0, i32 0
  store i16 %456, i16* %458, align 2
  %459 = bitcast %union.int_mv* %startmv to %struct.MV*
  %460 = getelementptr inbounds %struct.MV* %459, i32 0, i32 1
  %461 = load i16* %460, align 2
  %462 = sext i16 %461 to i32
  %463 = and i32 %462, 7
  %464 = icmp ne i32 %463, 0
  br i1 %464, label %465, label %494

; <label>:465                                     ; preds = %450
  %466 = bitcast %union.int_mv* %startmv to %struct.MV*
  %467 = getelementptr inbounds %struct.MV* %466, i32 0, i32 1
  %468 = load i16* %467, align 2
  %469 = sext i16 %468 to i32
  %470 = sub nsw i32 %469, 2
  %471 = trunc i32 %470 to i16
  %472 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %473 = getelementptr inbounds %struct.MV* %472, i32 0, i32 1
  store i16 %471, i16* %473, align 2
  %474 = load %struct.variance_vtable** %7, align 8
  %475 = getelementptr inbounds %struct.variance_vtable* %474, i32 0, i32 2
  %476 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %475, align 8
  %477 = load i8** %y, align 8
  %478 = load i32* %y_stride, align 4
  %479 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %480 = getelementptr inbounds %struct.MV* %479, i32 0, i32 1
  %481 = load i16* %480, align 2
  %482 = sext i16 %481 to i32
  %483 = and i32 %482, 7
  %484 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %485 = getelementptr inbounds %struct.MV* %484, i32 0, i32 0
  %486 = load i16* %485, align 2
  %487 = sext i16 %486 to i32
  %488 = and i32 %487, 7
  %489 = load i8** %z, align 8
  %490 = load %struct.block** %2, align 8
  %491 = getelementptr inbounds %struct.block* %490, i32 0, i32 11
  %492 = load i32* %491, align 4
  %493 = call i32 %476(i8* %477, i32 %478, i32 %483, i32 %488, i8* %489, i32 %492, i32* %sse)
  store i32 %493, i32* %thismse, align 4
  br label %520

; <label>:494                                     ; preds = %450
  %495 = bitcast %union.int_mv* %startmv to %struct.MV*
  %496 = getelementptr inbounds %struct.MV* %495, i32 0, i32 1
  %497 = load i16* %496, align 2
  %498 = sext i16 %497 to i32
  %499 = sub nsw i32 %498, 8
  %500 = or i32 %499, 6
  %501 = trunc i32 %500 to i16
  %502 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %503 = getelementptr inbounds %struct.MV* %502, i32 0, i32 1
  store i16 %501, i16* %503, align 2
  %504 = load %struct.variance_vtable** %7, align 8
  %505 = getelementptr inbounds %struct.variance_vtable* %504, i32 0, i32 2
  %506 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %505, align 8
  %507 = load i8** %y, align 8
  %508 = getelementptr inbounds i8* %507, i64 -1
  %509 = load i32* %y_stride, align 4
  %510 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %511 = getelementptr inbounds %struct.MV* %510, i32 0, i32 0
  %512 = load i16* %511, align 2
  %513 = sext i16 %512 to i32
  %514 = and i32 %513, 7
  %515 = load i8** %z, align 8
  %516 = load %struct.block** %2, align 8
  %517 = getelementptr inbounds %struct.block* %516, i32 0, i32 11
  %518 = load i32* %517, align 4
  %519 = call i32 %506(i8* %508, i32 %509, i32 6, i32 %514, i8* %515, i32 %518, i32* %sse)
  store i32 %519, i32* %thismse, align 4
  br label %520

; <label>:520                                     ; preds = %494, %465
  %521 = load i32* %thismse, align 4
  %522 = load %union.int_mv** %5, align 8
  %523 = load i32*** %8, align 8
  %524 = load i32* %6, align 4
  %525 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %522, i32** %523, i32 %524)
  %526 = add nsw i32 %521, %525
  store i32 %526, i32* %left, align 4
  %527 = load i32* %left, align 4
  %528 = load i32* %bestmse, align 4
  %529 = icmp slt i32 %527, %528
  br i1 %529, label %530, label %539

; <label>:530                                     ; preds = %520
  %531 = load %union.int_mv** %4, align 8
  %532 = bitcast %union.int_mv* %531 to i8*
  %533 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %532, i8* %533, i64 4, i32 4, i1 false)
  %534 = load i32* %left, align 4
  store i32 %534, i32* %bestmse, align 4
  %535 = load i32* %thismse, align 4
  %536 = load i32** %9, align 8
  store i32 %535, i32* %536, align 4
  %537 = load i32* %sse, align 4
  %538 = load i32** %10, align 8
  store i32 %537, i32* %538, align 4
  br label %539

; <label>:539                                     ; preds = %530, %520
  %540 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %541 = getelementptr inbounds %struct.MV* %540, i32 0, i32 1
  %542 = load i16* %541, align 2
  %543 = sext i16 %542 to i32
  %544 = add nsw i32 %543, 4
  %545 = trunc i32 %544 to i16
  store i16 %545, i16* %541, align 2
  %546 = load %struct.variance_vtable** %7, align 8
  %547 = getelementptr inbounds %struct.variance_vtable* %546, i32 0, i32 2
  %548 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %547, align 8
  %549 = load i8** %y, align 8
  %550 = load i32* %y_stride, align 4
  %551 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %552 = getelementptr inbounds %struct.MV* %551, i32 0, i32 1
  %553 = load i16* %552, align 2
  %554 = sext i16 %553 to i32
  %555 = and i32 %554, 7
  %556 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %557 = getelementptr inbounds %struct.MV* %556, i32 0, i32 0
  %558 = load i16* %557, align 2
  %559 = sext i16 %558 to i32
  %560 = and i32 %559, 7
  %561 = load i8** %z, align 8
  %562 = load %struct.block** %2, align 8
  %563 = getelementptr inbounds %struct.block* %562, i32 0, i32 11
  %564 = load i32* %563, align 4
  %565 = call i32 %548(i8* %549, i32 %550, i32 %555, i32 %560, i8* %561, i32 %564, i32* %sse)
  store i32 %565, i32* %thismse, align 4
  %566 = load i32* %thismse, align 4
  %567 = load %union.int_mv** %5, align 8
  %568 = load i32*** %8, align 8
  %569 = load i32* %6, align 4
  %570 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %567, i32** %568, i32 %569)
  %571 = add nsw i32 %566, %570
  store i32 %571, i32* %right, align 4
  %572 = load i32* %right, align 4
  %573 = load i32* %bestmse, align 4
  %574 = icmp slt i32 %572, %573
  br i1 %574, label %575, label %584

; <label>:575                                     ; preds = %539
  %576 = load %union.int_mv** %4, align 8
  %577 = bitcast %union.int_mv* %576 to i8*
  %578 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %577, i8* %578, i64 4, i32 4, i1 false)
  %579 = load i32* %right, align 4
  store i32 %579, i32* %bestmse, align 4
  %580 = load i32* %thismse, align 4
  %581 = load i32** %9, align 8
  store i32 %580, i32* %581, align 4
  %582 = load i32* %sse, align 4
  %583 = load i32** %10, align 8
  store i32 %582, i32* %583, align 4
  br label %584

; <label>:584                                     ; preds = %575, %539
  %585 = bitcast %union.int_mv* %startmv to %struct.MV*
  %586 = getelementptr inbounds %struct.MV* %585, i32 0, i32 1
  %587 = load i16* %586, align 2
  %588 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %589 = getelementptr inbounds %struct.MV* %588, i32 0, i32 1
  store i16 %587, i16* %589, align 2
  %590 = bitcast %union.int_mv* %startmv to %struct.MV*
  %591 = getelementptr inbounds %struct.MV* %590, i32 0, i32 0
  %592 = load i16* %591, align 2
  %593 = sext i16 %592 to i32
  %594 = and i32 %593, 7
  %595 = icmp ne i32 %594, 0
  br i1 %595, label %596, label %625

; <label>:596                                     ; preds = %584
  %597 = bitcast %union.int_mv* %startmv to %struct.MV*
  %598 = getelementptr inbounds %struct.MV* %597, i32 0, i32 0
  %599 = load i16* %598, align 2
  %600 = sext i16 %599 to i32
  %601 = sub nsw i32 %600, 2
  %602 = trunc i32 %601 to i16
  %603 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %604 = getelementptr inbounds %struct.MV* %603, i32 0, i32 0
  store i16 %602, i16* %604, align 2
  %605 = load %struct.variance_vtable** %7, align 8
  %606 = getelementptr inbounds %struct.variance_vtable* %605, i32 0, i32 2
  %607 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %606, align 8
  %608 = load i8** %y, align 8
  %609 = load i32* %y_stride, align 4
  %610 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %611 = getelementptr inbounds %struct.MV* %610, i32 0, i32 1
  %612 = load i16* %611, align 2
  %613 = sext i16 %612 to i32
  %614 = and i32 %613, 7
  %615 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %616 = getelementptr inbounds %struct.MV* %615, i32 0, i32 0
  %617 = load i16* %616, align 2
  %618 = sext i16 %617 to i32
  %619 = and i32 %618, 7
  %620 = load i8** %z, align 8
  %621 = load %struct.block** %2, align 8
  %622 = getelementptr inbounds %struct.block* %621, i32 0, i32 11
  %623 = load i32* %622, align 4
  %624 = call i32 %607(i8* %608, i32 %609, i32 %614, i32 %619, i8* %620, i32 %623, i32* %sse)
  store i32 %624, i32* %thismse, align 4
  br label %654

; <label>:625                                     ; preds = %584
  %626 = bitcast %union.int_mv* %startmv to %struct.MV*
  %627 = getelementptr inbounds %struct.MV* %626, i32 0, i32 0
  %628 = load i16* %627, align 2
  %629 = sext i16 %628 to i32
  %630 = sub nsw i32 %629, 8
  %631 = or i32 %630, 6
  %632 = trunc i32 %631 to i16
  %633 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %634 = getelementptr inbounds %struct.MV* %633, i32 0, i32 0
  store i16 %632, i16* %634, align 2
  %635 = load %struct.variance_vtable** %7, align 8
  %636 = getelementptr inbounds %struct.variance_vtable* %635, i32 0, i32 2
  %637 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %636, align 8
  %638 = load i8** %y, align 8
  %639 = load i32* %y_stride, align 4
  %640 = sext i32 %639 to i64
  %641 = sub i64 0, %640
  %642 = getelementptr inbounds i8* %638, i64 %641
  %643 = load i32* %y_stride, align 4
  %644 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %645 = getelementptr inbounds %struct.MV* %644, i32 0, i32 1
  %646 = load i16* %645, align 2
  %647 = sext i16 %646 to i32
  %648 = and i32 %647, 7
  %649 = load i8** %z, align 8
  %650 = load %struct.block** %2, align 8
  %651 = getelementptr inbounds %struct.block* %650, i32 0, i32 11
  %652 = load i32* %651, align 4
  %653 = call i32 %637(i8* %642, i32 %643, i32 %648, i32 6, i8* %649, i32 %652, i32* %sse)
  store i32 %653, i32* %thismse, align 4
  br label %654

; <label>:654                                     ; preds = %625, %596
  %655 = load i32* %thismse, align 4
  %656 = load %union.int_mv** %5, align 8
  %657 = load i32*** %8, align 8
  %658 = load i32* %6, align 4
  %659 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %656, i32** %657, i32 %658)
  %660 = add nsw i32 %655, %659
  store i32 %660, i32* %up, align 4
  %661 = load i32* %up, align 4
  %662 = load i32* %bestmse, align 4
  %663 = icmp slt i32 %661, %662
  br i1 %663, label %664, label %673

; <label>:664                                     ; preds = %654
  %665 = load %union.int_mv** %4, align 8
  %666 = bitcast %union.int_mv* %665 to i8*
  %667 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %666, i8* %667, i64 4, i32 4, i1 false)
  %668 = load i32* %up, align 4
  store i32 %668, i32* %bestmse, align 4
  %669 = load i32* %thismse, align 4
  %670 = load i32** %9, align 8
  store i32 %669, i32* %670, align 4
  %671 = load i32* %sse, align 4
  %672 = load i32** %10, align 8
  store i32 %671, i32* %672, align 4
  br label %673

; <label>:673                                     ; preds = %664, %654
  %674 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %675 = getelementptr inbounds %struct.MV* %674, i32 0, i32 0
  %676 = load i16* %675, align 2
  %677 = sext i16 %676 to i32
  %678 = add nsw i32 %677, 4
  %679 = trunc i32 %678 to i16
  store i16 %679, i16* %675, align 2
  %680 = load %struct.variance_vtable** %7, align 8
  %681 = getelementptr inbounds %struct.variance_vtable* %680, i32 0, i32 2
  %682 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %681, align 8
  %683 = load i8** %y, align 8
  %684 = load i32* %y_stride, align 4
  %685 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %686 = getelementptr inbounds %struct.MV* %685, i32 0, i32 1
  %687 = load i16* %686, align 2
  %688 = sext i16 %687 to i32
  %689 = and i32 %688, 7
  %690 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %691 = getelementptr inbounds %struct.MV* %690, i32 0, i32 0
  %692 = load i16* %691, align 2
  %693 = sext i16 %692 to i32
  %694 = and i32 %693, 7
  %695 = load i8** %z, align 8
  %696 = load %struct.block** %2, align 8
  %697 = getelementptr inbounds %struct.block* %696, i32 0, i32 11
  %698 = load i32* %697, align 4
  %699 = call i32 %682(i8* %683, i32 %684, i32 %689, i32 %694, i8* %695, i32 %698, i32* %sse)
  store i32 %699, i32* %thismse, align 4
  %700 = load i32* %thismse, align 4
  %701 = load %union.int_mv** %5, align 8
  %702 = load i32*** %8, align 8
  %703 = load i32* %6, align 4
  %704 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %701, i32** %702, i32 %703)
  %705 = add nsw i32 %700, %704
  store i32 %705, i32* %down, align 4
  %706 = load i32* %down, align 4
  %707 = load i32* %bestmse, align 4
  %708 = icmp slt i32 %706, %707
  br i1 %708, label %709, label %718

; <label>:709                                     ; preds = %673
  %710 = load %union.int_mv** %4, align 8
  %711 = bitcast %union.int_mv* %710 to i8*
  %712 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %711, i8* %712, i64 4, i32 4, i1 false)
  %713 = load i32* %down, align 4
  store i32 %713, i32* %bestmse, align 4
  %714 = load i32* %thismse, align 4
  %715 = load i32** %9, align 8
  store i32 %714, i32* %715, align 4
  %716 = load i32* %sse, align 4
  %717 = load i32** %10, align 8
  store i32 %716, i32* %717, align 4
  br label %718

; <label>:718                                     ; preds = %709, %673
  %719 = load i32* %left, align 4
  %720 = load i32* %right, align 4
  %721 = icmp slt i32 %719, %720
  %722 = select i1 %721, i32 0, i32 1
  %723 = load i32* %up, align 4
  %724 = load i32* %down, align 4
  %725 = icmp slt i32 %723, %724
  %726 = select i1 %725, i32 0, i32 2
  %727 = add nsw i32 %722, %726
  store i32 %727, i32* %whichdir, align 4
  %728 = bitcast %union.int_mv* %this_mv to i8*
  %729 = bitcast %union.int_mv* %startmv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %728, i8* %729, i64 4, i32 4, i1 false)
  %730 = load i32* %whichdir, align 4
  switch i32 %730, label %1044 [
    i32 0, label %731
    i32 1, label %874
    i32 2, label %944
    i32 3, label %1011
  ]

; <label>:731                                     ; preds = %718
  %732 = bitcast %union.int_mv* %startmv to %struct.MV*
  %733 = getelementptr inbounds %struct.MV* %732, i32 0, i32 0
  %734 = load i16* %733, align 2
  %735 = sext i16 %734 to i32
  %736 = and i32 %735, 7
  %737 = icmp ne i32 %736, 0
  br i1 %737, label %738, label %805

; <label>:738                                     ; preds = %731
  %739 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %740 = getelementptr inbounds %struct.MV* %739, i32 0, i32 0
  %741 = load i16* %740, align 2
  %742 = sext i16 %741 to i32
  %743 = sub nsw i32 %742, 2
  %744 = trunc i32 %743 to i16
  store i16 %744, i16* %740, align 2
  %745 = bitcast %union.int_mv* %startmv to %struct.MV*
  %746 = getelementptr inbounds %struct.MV* %745, i32 0, i32 1
  %747 = load i16* %746, align 2
  %748 = sext i16 %747 to i32
  %749 = and i32 %748, 7
  %750 = icmp ne i32 %749, 0
  br i1 %750, label %751, label %778

; <label>:751                                     ; preds = %738
  %752 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %753 = getelementptr inbounds %struct.MV* %752, i32 0, i32 1
  %754 = load i16* %753, align 2
  %755 = sext i16 %754 to i32
  %756 = sub nsw i32 %755, 2
  %757 = trunc i32 %756 to i16
  store i16 %757, i16* %753, align 2
  %758 = load %struct.variance_vtable** %7, align 8
  %759 = getelementptr inbounds %struct.variance_vtable* %758, i32 0, i32 2
  %760 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %759, align 8
  %761 = load i8** %y, align 8
  %762 = load i32* %y_stride, align 4
  %763 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %764 = getelementptr inbounds %struct.MV* %763, i32 0, i32 1
  %765 = load i16* %764, align 2
  %766 = sext i16 %765 to i32
  %767 = and i32 %766, 7
  %768 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %769 = getelementptr inbounds %struct.MV* %768, i32 0, i32 0
  %770 = load i16* %769, align 2
  %771 = sext i16 %770 to i32
  %772 = and i32 %771, 7
  %773 = load i8** %z, align 8
  %774 = load %struct.block** %2, align 8
  %775 = getelementptr inbounds %struct.block* %774, i32 0, i32 11
  %776 = load i32* %775, align 4
  %777 = call i32 %760(i8* %761, i32 %762, i32 %767, i32 %772, i8* %773, i32 %776, i32* %sse)
  store i32 %777, i32* %thismse, align 4
  br label %804

; <label>:778                                     ; preds = %738
  %779 = bitcast %union.int_mv* %startmv to %struct.MV*
  %780 = getelementptr inbounds %struct.MV* %779, i32 0, i32 1
  %781 = load i16* %780, align 2
  %782 = sext i16 %781 to i32
  %783 = sub nsw i32 %782, 8
  %784 = or i32 %783, 6
  %785 = trunc i32 %784 to i16
  %786 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %787 = getelementptr inbounds %struct.MV* %786, i32 0, i32 1
  store i16 %785, i16* %787, align 2
  %788 = load %struct.variance_vtable** %7, align 8
  %789 = getelementptr inbounds %struct.variance_vtable* %788, i32 0, i32 2
  %790 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %789, align 8
  %791 = load i8** %y, align 8
  %792 = getelementptr inbounds i8* %791, i64 -1
  %793 = load i32* %y_stride, align 4
  %794 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %795 = getelementptr inbounds %struct.MV* %794, i32 0, i32 0
  %796 = load i16* %795, align 2
  %797 = sext i16 %796 to i32
  %798 = and i32 %797, 7
  %799 = load i8** %z, align 8
  %800 = load %struct.block** %2, align 8
  %801 = getelementptr inbounds %struct.block* %800, i32 0, i32 11
  %802 = load i32* %801, align 4
  %803 = call i32 %790(i8* %792, i32 %793, i32 6, i32 %798, i8* %799, i32 %802, i32* %sse)
  store i32 %803, i32* %thismse, align 4
  br label %804

; <label>:804                                     ; preds = %778, %751
  br label %873

; <label>:805                                     ; preds = %731
  %806 = bitcast %union.int_mv* %startmv to %struct.MV*
  %807 = getelementptr inbounds %struct.MV* %806, i32 0, i32 0
  %808 = load i16* %807, align 2
  %809 = sext i16 %808 to i32
  %810 = sub nsw i32 %809, 8
  %811 = or i32 %810, 6
  %812 = trunc i32 %811 to i16
  %813 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %814 = getelementptr inbounds %struct.MV* %813, i32 0, i32 0
  store i16 %812, i16* %814, align 2
  %815 = bitcast %union.int_mv* %startmv to %struct.MV*
  %816 = getelementptr inbounds %struct.MV* %815, i32 0, i32 1
  %817 = load i16* %816, align 2
  %818 = sext i16 %817 to i32
  %819 = and i32 %818, 7
  %820 = icmp ne i32 %819, 0
  br i1 %820, label %821, label %847

; <label>:821                                     ; preds = %805
  %822 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %823 = getelementptr inbounds %struct.MV* %822, i32 0, i32 1
  %824 = load i16* %823, align 2
  %825 = sext i16 %824 to i32
  %826 = sub nsw i32 %825, 2
  %827 = trunc i32 %826 to i16
  store i16 %827, i16* %823, align 2
  %828 = load %struct.variance_vtable** %7, align 8
  %829 = getelementptr inbounds %struct.variance_vtable* %828, i32 0, i32 2
  %830 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %829, align 8
  %831 = load i8** %y, align 8
  %832 = load i32* %y_stride, align 4
  %833 = sext i32 %832 to i64
  %834 = sub i64 0, %833
  %835 = getelementptr inbounds i8* %831, i64 %834
  %836 = load i32* %y_stride, align 4
  %837 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %838 = getelementptr inbounds %struct.MV* %837, i32 0, i32 1
  %839 = load i16* %838, align 2
  %840 = sext i16 %839 to i32
  %841 = and i32 %840, 7
  %842 = load i8** %z, align 8
  %843 = load %struct.block** %2, align 8
  %844 = getelementptr inbounds %struct.block* %843, i32 0, i32 11
  %845 = load i32* %844, align 4
  %846 = call i32 %830(i8* %835, i32 %836, i32 %841, i32 6, i8* %842, i32 %845, i32* %sse)
  store i32 %846, i32* %thismse, align 4
  br label %872

; <label>:847                                     ; preds = %805
  %848 = bitcast %union.int_mv* %startmv to %struct.MV*
  %849 = getelementptr inbounds %struct.MV* %848, i32 0, i32 1
  %850 = load i16* %849, align 2
  %851 = sext i16 %850 to i32
  %852 = sub nsw i32 %851, 8
  %853 = or i32 %852, 6
  %854 = trunc i32 %853 to i16
  %855 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %856 = getelementptr inbounds %struct.MV* %855, i32 0, i32 1
  store i16 %854, i16* %856, align 2
  %857 = load %struct.variance_vtable** %7, align 8
  %858 = getelementptr inbounds %struct.variance_vtable* %857, i32 0, i32 2
  %859 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %858, align 8
  %860 = load i8** %y, align 8
  %861 = load i32* %y_stride, align 4
  %862 = sext i32 %861 to i64
  %863 = sub i64 0, %862
  %864 = getelementptr inbounds i8* %860, i64 %863
  %865 = getelementptr inbounds i8* %864, i64 -1
  %866 = load i32* %y_stride, align 4
  %867 = load i8** %z, align 8
  %868 = load %struct.block** %2, align 8
  %869 = getelementptr inbounds %struct.block* %868, i32 0, i32 11
  %870 = load i32* %869, align 4
  %871 = call i32 %859(i8* %865, i32 %866, i32 6, i32 6, i8* %867, i32 %870, i32* %sse)
  store i32 %871, i32* %thismse, align 4
  br label %872

; <label>:872                                     ; preds = %847, %821
  br label %873

; <label>:873                                     ; preds = %872, %804
  br label %1044

; <label>:874                                     ; preds = %718
  %875 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %876 = getelementptr inbounds %struct.MV* %875, i32 0, i32 1
  %877 = load i16* %876, align 2
  %878 = sext i16 %877 to i32
  %879 = add nsw i32 %878, 2
  %880 = trunc i32 %879 to i16
  store i16 %880, i16* %876, align 2
  %881 = bitcast %union.int_mv* %startmv to %struct.MV*
  %882 = getelementptr inbounds %struct.MV* %881, i32 0, i32 0
  %883 = load i16* %882, align 2
  %884 = sext i16 %883 to i32
  %885 = and i32 %884, 7
  %886 = icmp ne i32 %885, 0
  br i1 %886, label %887, label %914

; <label>:887                                     ; preds = %874
  %888 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %889 = getelementptr inbounds %struct.MV* %888, i32 0, i32 0
  %890 = load i16* %889, align 2
  %891 = sext i16 %890 to i32
  %892 = sub nsw i32 %891, 2
  %893 = trunc i32 %892 to i16
  store i16 %893, i16* %889, align 2
  %894 = load %struct.variance_vtable** %7, align 8
  %895 = getelementptr inbounds %struct.variance_vtable* %894, i32 0, i32 2
  %896 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %895, align 8
  %897 = load i8** %y, align 8
  %898 = load i32* %y_stride, align 4
  %899 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %900 = getelementptr inbounds %struct.MV* %899, i32 0, i32 1
  %901 = load i16* %900, align 2
  %902 = sext i16 %901 to i32
  %903 = and i32 %902, 7
  %904 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %905 = getelementptr inbounds %struct.MV* %904, i32 0, i32 0
  %906 = load i16* %905, align 2
  %907 = sext i16 %906 to i32
  %908 = and i32 %907, 7
  %909 = load i8** %z, align 8
  %910 = load %struct.block** %2, align 8
  %911 = getelementptr inbounds %struct.block* %910, i32 0, i32 11
  %912 = load i32* %911, align 4
  %913 = call i32 %896(i8* %897, i32 %898, i32 %903, i32 %908, i8* %909, i32 %912, i32* %sse)
  store i32 %913, i32* %thismse, align 4
  br label %943

; <label>:914                                     ; preds = %874
  %915 = bitcast %union.int_mv* %startmv to %struct.MV*
  %916 = getelementptr inbounds %struct.MV* %915, i32 0, i32 0
  %917 = load i16* %916, align 2
  %918 = sext i16 %917 to i32
  %919 = sub nsw i32 %918, 8
  %920 = or i32 %919, 6
  %921 = trunc i32 %920 to i16
  %922 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %923 = getelementptr inbounds %struct.MV* %922, i32 0, i32 0
  store i16 %921, i16* %923, align 2
  %924 = load %struct.variance_vtable** %7, align 8
  %925 = getelementptr inbounds %struct.variance_vtable* %924, i32 0, i32 2
  %926 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %925, align 8
  %927 = load i8** %y, align 8
  %928 = load i32* %y_stride, align 4
  %929 = sext i32 %928 to i64
  %930 = sub i64 0, %929
  %931 = getelementptr inbounds i8* %927, i64 %930
  %932 = load i32* %y_stride, align 4
  %933 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %934 = getelementptr inbounds %struct.MV* %933, i32 0, i32 1
  %935 = load i16* %934, align 2
  %936 = sext i16 %935 to i32
  %937 = and i32 %936, 7
  %938 = load i8** %z, align 8
  %939 = load %struct.block** %2, align 8
  %940 = getelementptr inbounds %struct.block* %939, i32 0, i32 11
  %941 = load i32* %940, align 4
  %942 = call i32 %926(i8* %931, i32 %932, i32 %937, i32 6, i8* %938, i32 %941, i32* %sse)
  store i32 %942, i32* %thismse, align 4
  br label %943

; <label>:943                                     ; preds = %914, %887
  br label %1044

; <label>:944                                     ; preds = %718
  %945 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %946 = getelementptr inbounds %struct.MV* %945, i32 0, i32 0
  %947 = load i16* %946, align 2
  %948 = sext i16 %947 to i32
  %949 = add nsw i32 %948, 2
  %950 = trunc i32 %949 to i16
  store i16 %950, i16* %946, align 2
  %951 = bitcast %union.int_mv* %startmv to %struct.MV*
  %952 = getelementptr inbounds %struct.MV* %951, i32 0, i32 1
  %953 = load i16* %952, align 2
  %954 = sext i16 %953 to i32
  %955 = and i32 %954, 7
  %956 = icmp ne i32 %955, 0
  br i1 %956, label %957, label %984

; <label>:957                                     ; preds = %944
  %958 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %959 = getelementptr inbounds %struct.MV* %958, i32 0, i32 1
  %960 = load i16* %959, align 2
  %961 = sext i16 %960 to i32
  %962 = sub nsw i32 %961, 2
  %963 = trunc i32 %962 to i16
  store i16 %963, i16* %959, align 2
  %964 = load %struct.variance_vtable** %7, align 8
  %965 = getelementptr inbounds %struct.variance_vtable* %964, i32 0, i32 2
  %966 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %965, align 8
  %967 = load i8** %y, align 8
  %968 = load i32* %y_stride, align 4
  %969 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %970 = getelementptr inbounds %struct.MV* %969, i32 0, i32 1
  %971 = load i16* %970, align 2
  %972 = sext i16 %971 to i32
  %973 = and i32 %972, 7
  %974 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %975 = getelementptr inbounds %struct.MV* %974, i32 0, i32 0
  %976 = load i16* %975, align 2
  %977 = sext i16 %976 to i32
  %978 = and i32 %977, 7
  %979 = load i8** %z, align 8
  %980 = load %struct.block** %2, align 8
  %981 = getelementptr inbounds %struct.block* %980, i32 0, i32 11
  %982 = load i32* %981, align 4
  %983 = call i32 %966(i8* %967, i32 %968, i32 %973, i32 %978, i8* %979, i32 %982, i32* %sse)
  store i32 %983, i32* %thismse, align 4
  br label %1010

; <label>:984                                     ; preds = %944
  %985 = bitcast %union.int_mv* %startmv to %struct.MV*
  %986 = getelementptr inbounds %struct.MV* %985, i32 0, i32 1
  %987 = load i16* %986, align 2
  %988 = sext i16 %987 to i32
  %989 = sub nsw i32 %988, 8
  %990 = or i32 %989, 6
  %991 = trunc i32 %990 to i16
  %992 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %993 = getelementptr inbounds %struct.MV* %992, i32 0, i32 1
  store i16 %991, i16* %993, align 2
  %994 = load %struct.variance_vtable** %7, align 8
  %995 = getelementptr inbounds %struct.variance_vtable* %994, i32 0, i32 2
  %996 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %995, align 8
  %997 = load i8** %y, align 8
  %998 = getelementptr inbounds i8* %997, i64 -1
  %999 = load i32* %y_stride, align 4
  %1000 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %1001 = getelementptr inbounds %struct.MV* %1000, i32 0, i32 0
  %1002 = load i16* %1001, align 2
  %1003 = sext i16 %1002 to i32
  %1004 = and i32 %1003, 7
  %1005 = load i8** %z, align 8
  %1006 = load %struct.block** %2, align 8
  %1007 = getelementptr inbounds %struct.block* %1006, i32 0, i32 11
  %1008 = load i32* %1007, align 4
  %1009 = call i32 %996(i8* %998, i32 %999, i32 6, i32 %1004, i8* %1005, i32 %1008, i32* %sse)
  store i32 %1009, i32* %thismse, align 4
  br label %1010

; <label>:1010                                    ; preds = %984, %957
  br label %1044

; <label>:1011                                    ; preds = %718
  %1012 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %1013 = getelementptr inbounds %struct.MV* %1012, i32 0, i32 1
  %1014 = load i16* %1013, align 2
  %1015 = sext i16 %1014 to i32
  %1016 = add nsw i32 %1015, 2
  %1017 = trunc i32 %1016 to i16
  store i16 %1017, i16* %1013, align 2
  %1018 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %1019 = getelementptr inbounds %struct.MV* %1018, i32 0, i32 0
  %1020 = load i16* %1019, align 2
  %1021 = sext i16 %1020 to i32
  %1022 = add nsw i32 %1021, 2
  %1023 = trunc i32 %1022 to i16
  store i16 %1023, i16* %1019, align 2
  %1024 = load %struct.variance_vtable** %7, align 8
  %1025 = getelementptr inbounds %struct.variance_vtable* %1024, i32 0, i32 2
  %1026 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1025, align 8
  %1027 = load i8** %y, align 8
  %1028 = load i32* %y_stride, align 4
  %1029 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %1030 = getelementptr inbounds %struct.MV* %1029, i32 0, i32 1
  %1031 = load i16* %1030, align 2
  %1032 = sext i16 %1031 to i32
  %1033 = and i32 %1032, 7
  %1034 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %1035 = getelementptr inbounds %struct.MV* %1034, i32 0, i32 0
  %1036 = load i16* %1035, align 2
  %1037 = sext i16 %1036 to i32
  %1038 = and i32 %1037, 7
  %1039 = load i8** %z, align 8
  %1040 = load %struct.block** %2, align 8
  %1041 = getelementptr inbounds %struct.block* %1040, i32 0, i32 11
  %1042 = load i32* %1041, align 4
  %1043 = call i32 %1026(i8* %1027, i32 %1028, i32 %1033, i32 %1038, i8* %1039, i32 %1042, i32* %sse)
  store i32 %1043, i32* %thismse, align 4
  br label %1044

; <label>:1044                                    ; preds = %718, %1011, %1010, %943, %873
  %1045 = load i32* %thismse, align 4
  %1046 = load %union.int_mv** %5, align 8
  %1047 = load i32*** %8, align 8
  %1048 = load i32* %6, align 4
  %1049 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %1046, i32** %1047, i32 %1048)
  %1050 = add nsw i32 %1045, %1049
  store i32 %1050, i32* %diag, align 4
  %1051 = load i32* %diag, align 4
  %1052 = load i32* %bestmse, align 4
  %1053 = icmp slt i32 %1051, %1052
  br i1 %1053, label %1054, label %1063

; <label>:1054                                    ; preds = %1044
  %1055 = load %union.int_mv** %4, align 8
  %1056 = bitcast %union.int_mv* %1055 to i8*
  %1057 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1056, i8* %1057, i64 4, i32 4, i1 false)
  %1058 = load i32* %diag, align 4
  store i32 %1058, i32* %bestmse, align 4
  %1059 = load i32* %thismse, align 4
  %1060 = load i32** %9, align 8
  store i32 %1059, i32* %1060, align 4
  %1061 = load i32* %sse, align 4
  %1062 = load i32** %10, align 8
  store i32 %1061, i32* %1062, align 4
  br label %1063

; <label>:1063                                    ; preds = %1054, %1044
  %1064 = load i32* %bestmse, align 4
  ret i32 %1064
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @vp8_find_best_half_pixel_step(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32 %error_per_bit, %struct.variance_vtable* %vfp, i32** %mvcost, i32* %distortion, i32* %sse1) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca %struct.block*, align 8
  %3 = alloca %struct.blockd*, align 8
  %4 = alloca %union.int_mv*, align 8
  %5 = alloca %union.int_mv*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.variance_vtable*, align 8
  %8 = alloca i32**, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32*, align 8
  %bestmse = alloca i32, align 4
  %startmv = alloca %union.int_mv, align 4
  %this_mv = alloca %union.int_mv, align 4
  %z = alloca i8*, align 8
  %left = alloca i32, align 4
  %right = alloca i32, align 4
  %up = alloca i32, align 4
  %down = alloca i32, align 4
  %diag = alloca i32, align 4
  %sse = alloca i32, align 4
  %whichdir = alloca i32, align 4
  %thismse = alloca i32, align 4
  %y_stride = alloca i32, align 4
  %pre_stride = alloca i32, align 4
  %base_pre = alloca i8*, align 8
  %xd = alloca %struct.macroblockd*, align 8
  %y_0 = alloca i8*, align 8
  %y = alloca i8*, align 8
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  store %struct.block* %b, %struct.block** %2, align 8
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  store %union.int_mv* %bestmv, %union.int_mv** %4, align 8
  store %union.int_mv* %ref_mv, %union.int_mv** %5, align 8
  store i32 %error_per_bit, i32* %6, align 4
  store %struct.variance_vtable* %vfp, %struct.variance_vtable** %7, align 8
  store i32** %mvcost, i32*** %8, align 8
  store i32* %distortion, i32** %9, align 8
  store i32* %sse1, i32** %10, align 8
  store i32 2147483647, i32* %bestmse, align 4
  %11 = load %struct.block** %2, align 8
  %12 = getelementptr inbounds %struct.block* %11, i32 0, i32 9
  %13 = load i8*** %12, align 8
  %14 = load i8** %13, align 8
  %15 = load %struct.block** %2, align 8
  %16 = getelementptr inbounds %struct.block* %15, i32 0, i32 10
  %17 = load i32* %16, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8* %14, i64 %18
  store i8* %19, i8** %z, align 8
  %20 = load %struct.macroblock** %1, align 8
  %21 = getelementptr inbounds %struct.macroblock* %20, i32 0, i32 7
  %22 = getelementptr inbounds %struct.macroblockd* %21, i32 0, i32 11
  %23 = getelementptr inbounds %struct.yv12_buffer_config* %22, i32 0, i32 4
  %24 = load i32* %23, align 4
  store i32 %24, i32* %pre_stride, align 4
  %25 = load %struct.macroblock** %1, align 8
  %26 = getelementptr inbounds %struct.macroblock* %25, i32 0, i32 7
  %27 = getelementptr inbounds %struct.macroblockd* %26, i32 0, i32 11
  %28 = getelementptr inbounds %struct.yv12_buffer_config* %27, i32 0, i32 13
  %29 = load i8** %28, align 8
  store i8* %29, i8** %base_pre, align 8
  %30 = load %struct.macroblock** %1, align 8
  %31 = getelementptr inbounds %struct.macroblock* %30, i32 0, i32 7
  store %struct.macroblockd* %31, %struct.macroblockd** %xd, align 8
  %32 = load i8** %base_pre, align 8
  %33 = load %struct.blockd** %3, align 8
  %34 = getelementptr inbounds %struct.blockd* %33, i32 0, i32 4
  %35 = load i32* %34, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8* %32, i64 %36
  %38 = load %union.int_mv** %4, align 8
  %39 = bitcast %union.int_mv* %38 to %struct.MV*
  %40 = getelementptr inbounds %struct.MV* %39, i32 0, i32 0
  %41 = load i16* %40, align 2
  %42 = sext i16 %41 to i32
  %43 = load i32* %pre_stride, align 4
  %44 = mul nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8* %37, i64 %45
  %47 = load %union.int_mv** %4, align 8
  %48 = bitcast %union.int_mv* %47 to %struct.MV*
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1
  %50 = load i16* %49, align 2
  %51 = sext i16 %50 to i32
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8* %46, i64 %52
  store i8* %53, i8** %y_0, align 8
  store i32 32, i32* %y_stride, align 4
  %54 = load %struct.variance_vtable** %7, align 8
  %55 = getelementptr inbounds %struct.variance_vtable* %54, i32 0, i32 9
  %56 = load void (i8*, i32, i8*, i32, i32)** %55, align 8
  %57 = load i8** %y_0, align 8
  %58 = getelementptr inbounds i8* %57, i64 -1
  %59 = load i32* %pre_stride, align 4
  %60 = sext i32 %59 to i64
  %61 = sub i64 0, %60
  %62 = getelementptr inbounds i8* %58, i64 %61
  %63 = load i32* %pre_stride, align 4
  %64 = load %struct.macroblockd** %xd, align 8
  %65 = getelementptr inbounds %struct.macroblockd* %64, i32 0, i32 46
  %66 = getelementptr inbounds [704 x i8]* %65, i32 0, i32 0
  %67 = load i32* %y_stride, align 4
  call void %56(i8* %62, i32 %63, i8* %66, i32 %67, i32 18)
  %68 = load %struct.macroblockd** %xd, align 8
  %69 = getelementptr inbounds %struct.macroblockd* %68, i32 0, i32 46
  %70 = getelementptr inbounds [704 x i8]* %69, i32 0, i32 0
  %71 = load i32* %y_stride, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8* %70, i64 %72
  %74 = getelementptr inbounds i8* %73, i64 1
  store i8* %74, i8** %y, align 8
  %75 = load %union.int_mv** %4, align 8
  %76 = bitcast %union.int_mv* %75 to %struct.MV*
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0
  %78 = load i16* %77, align 2
  %79 = sext i16 %78 to i32
  %80 = mul nsw i32 %79, 8
  %81 = trunc i32 %80 to i16
  store i16 %81, i16* %77, align 2
  %82 = load %union.int_mv** %4, align 8
  %83 = bitcast %union.int_mv* %82 to %struct.MV*
  %84 = getelementptr inbounds %struct.MV* %83, i32 0, i32 1
  %85 = load i16* %84, align 2
  %86 = sext i16 %85 to i32
  %87 = mul nsw i32 %86, 8
  %88 = trunc i32 %87 to i16
  store i16 %88, i16* %84, align 2
  %89 = load %union.int_mv** %4, align 8
  %90 = bitcast %union.int_mv* %startmv to i8*
  %91 = bitcast %union.int_mv* %89 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %90, i8* %91, i64 4, i32 4, i1 false)
  %92 = load %struct.variance_vtable** %7, align 8
  %93 = getelementptr inbounds %struct.variance_vtable* %92, i32 0, i32 1
  %94 = load i32 (i8*, i32, i8*, i32, i32*)** %93, align 8
  %95 = load i8** %y, align 8
  %96 = load i32* %y_stride, align 4
  %97 = load i8** %z, align 8
  %98 = load %struct.block** %2, align 8
  %99 = getelementptr inbounds %struct.block* %98, i32 0, i32 11
  %100 = load i32* %99, align 4
  %101 = load i32** %10, align 8
  %102 = call i32 %94(i8* %95, i32 %96, i8* %97, i32 %100, i32* %101)
  store i32 %102, i32* %bestmse, align 4
  %103 = load i32* %bestmse, align 4
  %104 = load i32** %9, align 8
  store i32 %103, i32* %104, align 4
  %105 = load %union.int_mv** %4, align 8
  %106 = load %union.int_mv** %5, align 8
  %107 = load i32*** %8, align 8
  %108 = load i32* %6, align 4
  %109 = call i32 @mv_err_cost(%union.int_mv* %105, %union.int_mv* %106, i32** %107, i32 %108)
  %110 = load i32* %bestmse, align 4
  %111 = add nsw i32 %110, %109
  store i32 %111, i32* %bestmse, align 4
  %112 = bitcast %union.int_mv* %startmv to %struct.MV*
  %113 = getelementptr inbounds %struct.MV* %112, i32 0, i32 0
  %114 = load i16* %113, align 2
  %115 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %116 = getelementptr inbounds %struct.MV* %115, i32 0, i32 0
  store i16 %114, i16* %116, align 2
  %117 = bitcast %union.int_mv* %startmv to %struct.MV*
  %118 = getelementptr inbounds %struct.MV* %117, i32 0, i32 1
  %119 = load i16* %118, align 2
  %120 = sext i16 %119 to i32
  %121 = sub nsw i32 %120, 8
  %122 = or i32 %121, 4
  %123 = trunc i32 %122 to i16
  %124 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %125 = getelementptr inbounds %struct.MV* %124, i32 0, i32 1
  store i16 %123, i16* %125, align 2
  %126 = load %struct.variance_vtable** %7, align 8
  %127 = getelementptr inbounds %struct.variance_vtable* %126, i32 0, i32 3
  %128 = load i32 (i8*, i32, i8*, i32, i32*)** %127, align 8
  %129 = load i8** %y, align 8
  %130 = getelementptr inbounds i8* %129, i64 -1
  %131 = load i32* %y_stride, align 4
  %132 = load i8** %z, align 8
  %133 = load %struct.block** %2, align 8
  %134 = getelementptr inbounds %struct.block* %133, i32 0, i32 11
  %135 = load i32* %134, align 4
  %136 = call i32 %128(i8* %130, i32 %131, i8* %132, i32 %135, i32* %sse)
  store i32 %136, i32* %thismse, align 4
  %137 = load i32* %thismse, align 4
  %138 = load %union.int_mv** %5, align 8
  %139 = load i32*** %8, align 8
  %140 = load i32* %6, align 4
  %141 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %138, i32** %139, i32 %140)
  %142 = add nsw i32 %137, %141
  store i32 %142, i32* %left, align 4
  %143 = load i32* %left, align 4
  %144 = load i32* %bestmse, align 4
  %145 = icmp slt i32 %143, %144
  br i1 %145, label %146, label %155

; <label>:146                                     ; preds = %0
  %147 = load %union.int_mv** %4, align 8
  %148 = bitcast %union.int_mv* %147 to i8*
  %149 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %148, i8* %149, i64 4, i32 4, i1 false)
  %150 = load i32* %left, align 4
  store i32 %150, i32* %bestmse, align 4
  %151 = load i32* %thismse, align 4
  %152 = load i32** %9, align 8
  store i32 %151, i32* %152, align 4
  %153 = load i32* %sse, align 4
  %154 = load i32** %10, align 8
  store i32 %153, i32* %154, align 4
  br label %155

; <label>:155                                     ; preds = %146, %0
  %156 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %157 = getelementptr inbounds %struct.MV* %156, i32 0, i32 1
  %158 = load i16* %157, align 2
  %159 = sext i16 %158 to i32
  %160 = add nsw i32 %159, 8
  %161 = trunc i32 %160 to i16
  store i16 %161, i16* %157, align 2
  %162 = load %struct.variance_vtable** %7, align 8
  %163 = getelementptr inbounds %struct.variance_vtable* %162, i32 0, i32 3
  %164 = load i32 (i8*, i32, i8*, i32, i32*)** %163, align 8
  %165 = load i8** %y, align 8
  %166 = load i32* %y_stride, align 4
  %167 = load i8** %z, align 8
  %168 = load %struct.block** %2, align 8
  %169 = getelementptr inbounds %struct.block* %168, i32 0, i32 11
  %170 = load i32* %169, align 4
  %171 = call i32 %164(i8* %165, i32 %166, i8* %167, i32 %170, i32* %sse)
  store i32 %171, i32* %thismse, align 4
  %172 = load i32* %thismse, align 4
  %173 = load %union.int_mv** %5, align 8
  %174 = load i32*** %8, align 8
  %175 = load i32* %6, align 4
  %176 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %173, i32** %174, i32 %175)
  %177 = add nsw i32 %172, %176
  store i32 %177, i32* %right, align 4
  %178 = load i32* %right, align 4
  %179 = load i32* %bestmse, align 4
  %180 = icmp slt i32 %178, %179
  br i1 %180, label %181, label %190

; <label>:181                                     ; preds = %155
  %182 = load %union.int_mv** %4, align 8
  %183 = bitcast %union.int_mv* %182 to i8*
  %184 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %183, i8* %184, i64 4, i32 4, i1 false)
  %185 = load i32* %right, align 4
  store i32 %185, i32* %bestmse, align 4
  %186 = load i32* %thismse, align 4
  %187 = load i32** %9, align 8
  store i32 %186, i32* %187, align 4
  %188 = load i32* %sse, align 4
  %189 = load i32** %10, align 8
  store i32 %188, i32* %189, align 4
  br label %190

; <label>:190                                     ; preds = %181, %155
  %191 = bitcast %union.int_mv* %startmv to %struct.MV*
  %192 = getelementptr inbounds %struct.MV* %191, i32 0, i32 1
  %193 = load i16* %192, align 2
  %194 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %195 = getelementptr inbounds %struct.MV* %194, i32 0, i32 1
  store i16 %193, i16* %195, align 2
  %196 = bitcast %union.int_mv* %startmv to %struct.MV*
  %197 = getelementptr inbounds %struct.MV* %196, i32 0, i32 0
  %198 = load i16* %197, align 2
  %199 = sext i16 %198 to i32
  %200 = sub nsw i32 %199, 8
  %201 = or i32 %200, 4
  %202 = trunc i32 %201 to i16
  %203 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %204 = getelementptr inbounds %struct.MV* %203, i32 0, i32 0
  store i16 %202, i16* %204, align 2
  %205 = load %struct.variance_vtable** %7, align 8
  %206 = getelementptr inbounds %struct.variance_vtable* %205, i32 0, i32 4
  %207 = load i32 (i8*, i32, i8*, i32, i32*)** %206, align 8
  %208 = load i8** %y, align 8
  %209 = load i32* %y_stride, align 4
  %210 = sext i32 %209 to i64
  %211 = sub i64 0, %210
  %212 = getelementptr inbounds i8* %208, i64 %211
  %213 = load i32* %y_stride, align 4
  %214 = load i8** %z, align 8
  %215 = load %struct.block** %2, align 8
  %216 = getelementptr inbounds %struct.block* %215, i32 0, i32 11
  %217 = load i32* %216, align 4
  %218 = call i32 %207(i8* %212, i32 %213, i8* %214, i32 %217, i32* %sse)
  store i32 %218, i32* %thismse, align 4
  %219 = load i32* %thismse, align 4
  %220 = load %union.int_mv** %5, align 8
  %221 = load i32*** %8, align 8
  %222 = load i32* %6, align 4
  %223 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %220, i32** %221, i32 %222)
  %224 = add nsw i32 %219, %223
  store i32 %224, i32* %up, align 4
  %225 = load i32* %up, align 4
  %226 = load i32* %bestmse, align 4
  %227 = icmp slt i32 %225, %226
  br i1 %227, label %228, label %237

; <label>:228                                     ; preds = %190
  %229 = load %union.int_mv** %4, align 8
  %230 = bitcast %union.int_mv* %229 to i8*
  %231 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %230, i8* %231, i64 4, i32 4, i1 false)
  %232 = load i32* %up, align 4
  store i32 %232, i32* %bestmse, align 4
  %233 = load i32* %thismse, align 4
  %234 = load i32** %9, align 8
  store i32 %233, i32* %234, align 4
  %235 = load i32* %sse, align 4
  %236 = load i32** %10, align 8
  store i32 %235, i32* %236, align 4
  br label %237

; <label>:237                                     ; preds = %228, %190
  %238 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %239 = getelementptr inbounds %struct.MV* %238, i32 0, i32 0
  %240 = load i16* %239, align 2
  %241 = sext i16 %240 to i32
  %242 = add nsw i32 %241, 8
  %243 = trunc i32 %242 to i16
  store i16 %243, i16* %239, align 2
  %244 = load %struct.variance_vtable** %7, align 8
  %245 = getelementptr inbounds %struct.variance_vtable* %244, i32 0, i32 4
  %246 = load i32 (i8*, i32, i8*, i32, i32*)** %245, align 8
  %247 = load i8** %y, align 8
  %248 = load i32* %y_stride, align 4
  %249 = load i8** %z, align 8
  %250 = load %struct.block** %2, align 8
  %251 = getelementptr inbounds %struct.block* %250, i32 0, i32 11
  %252 = load i32* %251, align 4
  %253 = call i32 %246(i8* %247, i32 %248, i8* %249, i32 %252, i32* %sse)
  store i32 %253, i32* %thismse, align 4
  %254 = load i32* %thismse, align 4
  %255 = load %union.int_mv** %5, align 8
  %256 = load i32*** %8, align 8
  %257 = load i32* %6, align 4
  %258 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %255, i32** %256, i32 %257)
  %259 = add nsw i32 %254, %258
  store i32 %259, i32* %down, align 4
  %260 = load i32* %down, align 4
  %261 = load i32* %bestmse, align 4
  %262 = icmp slt i32 %260, %261
  br i1 %262, label %263, label %272

; <label>:263                                     ; preds = %237
  %264 = load %union.int_mv** %4, align 8
  %265 = bitcast %union.int_mv* %264 to i8*
  %266 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %265, i8* %266, i64 4, i32 4, i1 false)
  %267 = load i32* %down, align 4
  store i32 %267, i32* %bestmse, align 4
  %268 = load i32* %thismse, align 4
  %269 = load i32** %9, align 8
  store i32 %268, i32* %269, align 4
  %270 = load i32* %sse, align 4
  %271 = load i32** %10, align 8
  store i32 %270, i32* %271, align 4
  br label %272

; <label>:272                                     ; preds = %263, %237
  %273 = load i32* %left, align 4
  %274 = load i32* %right, align 4
  %275 = icmp slt i32 %273, %274
  %276 = select i1 %275, i32 0, i32 1
  %277 = load i32* %up, align 4
  %278 = load i32* %down, align 4
  %279 = icmp slt i32 %277, %278
  %280 = select i1 %279, i32 0, i32 2
  %281 = add nsw i32 %276, %280
  store i32 %281, i32* %whichdir, align 4
  %282 = bitcast %union.int_mv* %this_mv to i8*
  %283 = bitcast %union.int_mv* %startmv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %282, i8* %283, i64 4, i32 4, i1 false)
  %284 = load i32* %whichdir, align 4
  switch i32 %284, label %377 [
    i32 0, label %285
    i32 1, label %319
    i32 2, label %349
    i32 3, label %376
  ]

; <label>:285                                     ; preds = %272
  %286 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %287 = getelementptr inbounds %struct.MV* %286, i32 0, i32 1
  %288 = load i16* %287, align 2
  %289 = sext i16 %288 to i32
  %290 = sub nsw i32 %289, 8
  %291 = or i32 %290, 4
  %292 = trunc i32 %291 to i16
  %293 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %294 = getelementptr inbounds %struct.MV* %293, i32 0, i32 1
  store i16 %292, i16* %294, align 2
  %295 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %296 = getelementptr inbounds %struct.MV* %295, i32 0, i32 0
  %297 = load i16* %296, align 2
  %298 = sext i16 %297 to i32
  %299 = sub nsw i32 %298, 8
  %300 = or i32 %299, 4
  %301 = trunc i32 %300 to i16
  %302 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %303 = getelementptr inbounds %struct.MV* %302, i32 0, i32 0
  store i16 %301, i16* %303, align 2
  %304 = load %struct.variance_vtable** %7, align 8
  %305 = getelementptr inbounds %struct.variance_vtable* %304, i32 0, i32 5
  %306 = load i32 (i8*, i32, i8*, i32, i32*)** %305, align 8
  %307 = load i8** %y, align 8
  %308 = getelementptr inbounds i8* %307, i64 -1
  %309 = load i32* %y_stride, align 4
  %310 = sext i32 %309 to i64
  %311 = sub i64 0, %310
  %312 = getelementptr inbounds i8* %308, i64 %311
  %313 = load i32* %y_stride, align 4
  %314 = load i8** %z, align 8
  %315 = load %struct.block** %2, align 8
  %316 = getelementptr inbounds %struct.block* %315, i32 0, i32 11
  %317 = load i32* %316, align 4
  %318 = call i32 %306(i8* %312, i32 %313, i8* %314, i32 %317, i32* %sse)
  store i32 %318, i32* %thismse, align 4
  br label %400

; <label>:319                                     ; preds = %272
  %320 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %321 = getelementptr inbounds %struct.MV* %320, i32 0, i32 1
  %322 = load i16* %321, align 2
  %323 = sext i16 %322 to i32
  %324 = add nsw i32 %323, 4
  %325 = trunc i32 %324 to i16
  store i16 %325, i16* %321, align 2
  %326 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %327 = getelementptr inbounds %struct.MV* %326, i32 0, i32 0
  %328 = load i16* %327, align 2
  %329 = sext i16 %328 to i32
  %330 = sub nsw i32 %329, 8
  %331 = or i32 %330, 4
  %332 = trunc i32 %331 to i16
  %333 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %334 = getelementptr inbounds %struct.MV* %333, i32 0, i32 0
  store i16 %332, i16* %334, align 2
  %335 = load %struct.variance_vtable** %7, align 8
  %336 = getelementptr inbounds %struct.variance_vtable* %335, i32 0, i32 5
  %337 = load i32 (i8*, i32, i8*, i32, i32*)** %336, align 8
  %338 = load i8** %y, align 8
  %339 = load i32* %y_stride, align 4
  %340 = sext i32 %339 to i64
  %341 = sub i64 0, %340
  %342 = getelementptr inbounds i8* %338, i64 %341
  %343 = load i32* %y_stride, align 4
  %344 = load i8** %z, align 8
  %345 = load %struct.block** %2, align 8
  %346 = getelementptr inbounds %struct.block* %345, i32 0, i32 11
  %347 = load i32* %346, align 4
  %348 = call i32 %337(i8* %342, i32 %343, i8* %344, i32 %347, i32* %sse)
  store i32 %348, i32* %thismse, align 4
  br label %400

; <label>:349                                     ; preds = %272
  %350 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %351 = getelementptr inbounds %struct.MV* %350, i32 0, i32 1
  %352 = load i16* %351, align 2
  %353 = sext i16 %352 to i32
  %354 = sub nsw i32 %353, 8
  %355 = or i32 %354, 4
  %356 = trunc i32 %355 to i16
  %357 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %358 = getelementptr inbounds %struct.MV* %357, i32 0, i32 1
  store i16 %356, i16* %358, align 2
  %359 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %360 = getelementptr inbounds %struct.MV* %359, i32 0, i32 0
  %361 = load i16* %360, align 2
  %362 = sext i16 %361 to i32
  %363 = add nsw i32 %362, 4
  %364 = trunc i32 %363 to i16
  store i16 %364, i16* %360, align 2
  %365 = load %struct.variance_vtable** %7, align 8
  %366 = getelementptr inbounds %struct.variance_vtable* %365, i32 0, i32 5
  %367 = load i32 (i8*, i32, i8*, i32, i32*)** %366, align 8
  %368 = load i8** %y, align 8
  %369 = getelementptr inbounds i8* %368, i64 -1
  %370 = load i32* %y_stride, align 4
  %371 = load i8** %z, align 8
  %372 = load %struct.block** %2, align 8
  %373 = getelementptr inbounds %struct.block* %372, i32 0, i32 11
  %374 = load i32* %373, align 4
  %375 = call i32 %367(i8* %369, i32 %370, i8* %371, i32 %374, i32* %sse)
  store i32 %375, i32* %thismse, align 4
  br label %400

; <label>:376                                     ; preds = %272
  br label %377

; <label>:377                                     ; preds = %272, %376
  %378 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %379 = getelementptr inbounds %struct.MV* %378, i32 0, i32 1
  %380 = load i16* %379, align 2
  %381 = sext i16 %380 to i32
  %382 = add nsw i32 %381, 4
  %383 = trunc i32 %382 to i16
  store i16 %383, i16* %379, align 2
  %384 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %385 = getelementptr inbounds %struct.MV* %384, i32 0, i32 0
  %386 = load i16* %385, align 2
  %387 = sext i16 %386 to i32
  %388 = add nsw i32 %387, 4
  %389 = trunc i32 %388 to i16
  store i16 %389, i16* %385, align 2
  %390 = load %struct.variance_vtable** %7, align 8
  %391 = getelementptr inbounds %struct.variance_vtable* %390, i32 0, i32 5
  %392 = load i32 (i8*, i32, i8*, i32, i32*)** %391, align 8
  %393 = load i8** %y, align 8
  %394 = load i32* %y_stride, align 4
  %395 = load i8** %z, align 8
  %396 = load %struct.block** %2, align 8
  %397 = getelementptr inbounds %struct.block* %396, i32 0, i32 11
  %398 = load i32* %397, align 4
  %399 = call i32 %392(i8* %393, i32 %394, i8* %395, i32 %398, i32* %sse)
  store i32 %399, i32* %thismse, align 4
  br label %400

; <label>:400                                     ; preds = %377, %349, %319, %285
  %401 = load i32* %thismse, align 4
  %402 = load %union.int_mv** %5, align 8
  %403 = load i32*** %8, align 8
  %404 = load i32* %6, align 4
  %405 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %402, i32** %403, i32 %404)
  %406 = add nsw i32 %401, %405
  store i32 %406, i32* %diag, align 4
  %407 = load i32* %diag, align 4
  %408 = load i32* %bestmse, align 4
  %409 = icmp slt i32 %407, %408
  br i1 %409, label %410, label %419

; <label>:410                                     ; preds = %400
  %411 = load %union.int_mv** %4, align 8
  %412 = bitcast %union.int_mv* %411 to i8*
  %413 = bitcast %union.int_mv* %this_mv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %412, i8* %413, i64 4, i32 4, i1 false)
  %414 = load i32* %diag, align 4
  store i32 %414, i32* %bestmse, align 4
  %415 = load i32* %thismse, align 4
  %416 = load i32** %9, align 8
  store i32 %415, i32* %416, align 4
  %417 = load i32* %sse, align 4
  %418 = load i32** %10, align 8
  store i32 %417, i32* %418, align 4
  br label %419

; <label>:419                                     ; preds = %410, %400
  %420 = load i32* %bestmse, align 4
  ret i32 %420
}

; Function Attrs: nounwind uwtable
define i32 @vp8_hex_search(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, %union.int_mv* %best_mv, i32 %search_param, i32 %sad_per_bit, %struct.variance_vtable* %vfp, i32** %mvsadcost, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca %struct.block*, align 8
  %3 = alloca %struct.blockd*, align 8
  %4 = alloca %union.int_mv*, align 8
  %5 = alloca %union.int_mv*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.variance_vtable*, align 8
  %9 = alloca i32**, align 8
  %10 = alloca i32**, align 8
  %11 = alloca %union.int_mv*, align 8
  %hex = alloca [6 x %struct.MV], align 16
  %neighbors = alloca [4 x %struct.MV], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %what = alloca i8*, align 8
  %what_stride = alloca i32, align 4
  %pre_stride = alloca i32, align 4
  %base_pre = alloca i8*, align 8
  %in_what_stride = alloca i32, align 4
  %br = alloca i32, align 4
  %bc = alloca i32, align 4
  %this_mv = alloca %union.int_mv, align 4
  %bestsad = alloca i32, align 4
  %thissad = alloca i32, align 4
  %base_offset = alloca i8*, align 8
  %this_offset = alloca i8*, align 8
  %k = alloca i32, align 4
  %all_in = alloca i32, align 4
  %best_site = alloca i32, align 4
  %hex_range = alloca i32, align 4
  %dia_range = alloca i32, align 4
  %fcenter_mv = alloca %union.int_mv, align 4
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  store %struct.block* %b, %struct.block** %2, align 8
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  store %union.int_mv* %best_mv, %union.int_mv** %5, align 8
  store i32 %search_param, i32* %6, align 4
  store i32 %sad_per_bit, i32* %7, align 4
  store %struct.variance_vtable* %vfp, %struct.variance_vtable** %8, align 8
  store i32** %mvsadcost, i32*** %9, align 8
  store i32** %mvcost, i32*** %10, align 8
  store %union.int_mv* %center_mv, %union.int_mv** %11, align 8
  %12 = bitcast [6 x %struct.MV]* %hex to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* bitcast ([6 x %struct.MV]* @vp8_hex_search.hex to i8*), i64 24, i32 16, i1 false)
  %13 = bitcast [4 x %struct.MV]* %neighbors to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* bitcast ([4 x %struct.MV]* @vp8_hex_search.neighbors to i8*), i64 16, i32 16, i1 false)
  %14 = load %struct.block** %2, align 8
  %15 = getelementptr inbounds %struct.block* %14, i32 0, i32 9
  %16 = load i8*** %15, align 8
  %17 = load i8** %16, align 8
  %18 = load %struct.block** %2, align 8
  %19 = getelementptr inbounds %struct.block* %18, i32 0, i32 10
  %20 = load i32* %19, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8* %17, i64 %21
  store i8* %22, i8** %what, align 8
  %23 = load %struct.block** %2, align 8
  %24 = getelementptr inbounds %struct.block* %23, i32 0, i32 11
  %25 = load i32* %24, align 4
  store i32 %25, i32* %what_stride, align 4
  %26 = load %struct.macroblock** %1, align 8
  %27 = getelementptr inbounds %struct.macroblock* %26, i32 0, i32 7
  %28 = getelementptr inbounds %struct.macroblockd* %27, i32 0, i32 11
  %29 = getelementptr inbounds %struct.yv12_buffer_config* %28, i32 0, i32 4
  %30 = load i32* %29, align 4
  store i32 %30, i32* %pre_stride, align 4
  %31 = load %struct.macroblock** %1, align 8
  %32 = getelementptr inbounds %struct.macroblock* %31, i32 0, i32 7
  %33 = getelementptr inbounds %struct.macroblockd* %32, i32 0, i32 11
  %34 = getelementptr inbounds %struct.yv12_buffer_config* %33, i32 0, i32 13
  %35 = load i8** %34, align 8
  store i8* %35, i8** %base_pre, align 8
  %36 = load i32* %pre_stride, align 4
  store i32 %36, i32* %in_what_stride, align 4
  store i32 -1, i32* %k, align 4
  store i32 -1, i32* %best_site, align 4
  store i32 127, i32* %hex_range, align 4
  store i32 8, i32* %dia_range, align 4
  %37 = load %union.int_mv** %11, align 8
  %38 = bitcast %union.int_mv* %37 to %struct.MV*
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 0
  %40 = load i16* %39, align 2
  %41 = sext i16 %40 to i32
  %42 = ashr i32 %41, 3
  %43 = trunc i32 %42 to i16
  %44 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %45 = getelementptr inbounds %struct.MV* %44, i32 0, i32 0
  store i16 %43, i16* %45, align 2
  %46 = load %union.int_mv** %11, align 8
  %47 = bitcast %union.int_mv* %46 to %struct.MV*
  %48 = getelementptr inbounds %struct.MV* %47, i32 0, i32 1
  %49 = load i16* %48, align 2
  %50 = sext i16 %49 to i32
  %51 = ashr i32 %50, 3
  %52 = trunc i32 %51 to i16
  %53 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %54 = getelementptr inbounds %struct.MV* %53, i32 0, i32 1
  store i16 %52, i16* %54, align 2
  %55 = load %union.int_mv** %4, align 8
  %56 = load %struct.macroblock** %1, align 8
  %57 = getelementptr inbounds %struct.macroblock* %56, i32 0, i32 31
  %58 = load i32* %57, align 4
  %59 = load %struct.macroblock** %1, align 8
  %60 = getelementptr inbounds %struct.macroblock* %59, i32 0, i32 32
  %61 = load i32* %60, align 4
  %62 = load %struct.macroblock** %1, align 8
  %63 = getelementptr inbounds %struct.macroblock* %62, i32 0, i32 33
  %64 = load i32* %63, align 4
  %65 = load %struct.macroblock** %1, align 8
  %66 = getelementptr inbounds %struct.macroblock* %65, i32 0, i32 34
  %67 = load i32* %66, align 4
  call void @vp8_clamp_mv(%union.int_mv* %55, i32 %58, i32 %61, i32 %64, i32 %67)
  %68 = load %union.int_mv** %4, align 8
  %69 = bitcast %union.int_mv* %68 to %struct.MV*
  %70 = getelementptr inbounds %struct.MV* %69, i32 0, i32 0
  %71 = load i16* %70, align 2
  %72 = sext i16 %71 to i32
  store i32 %72, i32* %br, align 4
  %73 = load %union.int_mv** %4, align 8
  %74 = bitcast %union.int_mv* %73 to %struct.MV*
  %75 = getelementptr inbounds %struct.MV* %74, i32 0, i32 1
  %76 = load i16* %75, align 2
  %77 = sext i16 %76 to i32
  store i32 %77, i32* %bc, align 4
  %78 = load i8** %base_pre, align 8
  %79 = load %struct.blockd** %3, align 8
  %80 = getelementptr inbounds %struct.blockd* %79, i32 0, i32 4
  %81 = load i32* %80, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8* %78, i64 %82
  store i8* %83, i8** %base_offset, align 8
  %84 = load i8** %base_offset, align 8
  %85 = load i32* %br, align 4
  %86 = load i32* %pre_stride, align 4
  %87 = mul nsw i32 %85, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i8* %84, i64 %88
  %90 = load i32* %bc, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8* %89, i64 %91
  store i8* %92, i8** %this_offset, align 8
  %93 = load i32* %br, align 4
  %94 = trunc i32 %93 to i16
  %95 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %96 = getelementptr inbounds %struct.MV* %95, i32 0, i32 0
  store i16 %94, i16* %96, align 2
  %97 = load i32* %bc, align 4
  %98 = trunc i32 %97 to i16
  %99 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %100 = getelementptr inbounds %struct.MV* %99, i32 0, i32 1
  store i16 %98, i16* %100, align 2
  %101 = load %struct.variance_vtable** %8, align 8
  %102 = getelementptr inbounds %struct.variance_vtable* %101, i32 0, i32 0
  %103 = load i32 (i8*, i32, i8*, i32, i32)** %102, align 8
  %104 = load i8** %what, align 8
  %105 = load i32* %what_stride, align 4
  %106 = load i8** %this_offset, align 8
  %107 = load i32* %in_what_stride, align 4
  %108 = call i32 %103(i8* %104, i32 %105, i8* %106, i32 %107, i32 -1)
  %109 = load i32*** %9, align 8
  %110 = load i32* %7, align 4
  %111 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %109, i32 %110)
  %112 = add i32 %108, %111
  store i32 %112, i32* %bestsad, align 4
  store i32 1, i32* %all_in, align 4
  %113 = load i32* %br, align 4
  %114 = sub nsw i32 %113, 2
  %115 = load %struct.macroblock** %1, align 8
  %116 = getelementptr inbounds %struct.macroblock* %115, i32 0, i32 33
  %117 = load i32* %116, align 4
  %118 = icmp sge i32 %114, %117
  %119 = zext i1 %118 to i32
  %120 = load i32* %all_in, align 4
  %121 = and i32 %120, %119
  store i32 %121, i32* %all_in, align 4
  %122 = load i32* %br, align 4
  %123 = add nsw i32 %122, 2
  %124 = load %struct.macroblock** %1, align 8
  %125 = getelementptr inbounds %struct.macroblock* %124, i32 0, i32 34
  %126 = load i32* %125, align 4
  %127 = icmp sle i32 %123, %126
  %128 = zext i1 %127 to i32
  %129 = load i32* %all_in, align 4
  %130 = and i32 %129, %128
  store i32 %130, i32* %all_in, align 4
  %131 = load i32* %bc, align 4
  %132 = sub nsw i32 %131, 2
  %133 = load %struct.macroblock** %1, align 8
  %134 = getelementptr inbounds %struct.macroblock* %133, i32 0, i32 31
  %135 = load i32* %134, align 4
  %136 = icmp sge i32 %132, %135
  %137 = zext i1 %136 to i32
  %138 = load i32* %all_in, align 4
  %139 = and i32 %138, %137
  store i32 %139, i32* %all_in, align 4
  %140 = load i32* %bc, align 4
  %141 = add nsw i32 %140, 2
  %142 = load %struct.macroblock** %1, align 8
  %143 = getelementptr inbounds %struct.macroblock* %142, i32 0, i32 32
  %144 = load i32* %143, align 4
  %145 = icmp sle i32 %141, %144
  %146 = zext i1 %145 to i32
  %147 = load i32* %all_in, align 4
  %148 = and i32 %147, %146
  store i32 %148, i32* %all_in, align 4
  %149 = load i32* %all_in, align 4
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %151, label %223

; <label>:151                                     ; preds = %0
  store i32 0, i32* %i, align 4
  br label %152

; <label>:152                                     ; preds = %219, %151
  %153 = load i32* %i, align 4
  %154 = icmp slt i32 %153, 6
  br i1 %154, label %155, label %222

; <label>:155                                     ; preds = %152
  %156 = load i32* %br, align 4
  %157 = load i32* %i, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %158
  %160 = getelementptr inbounds %struct.MV* %159, i32 0, i32 0
  %161 = load i16* %160, align 2
  %162 = sext i16 %161 to i32
  %163 = add nsw i32 %156, %162
  %164 = trunc i32 %163 to i16
  %165 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %166 = getelementptr inbounds %struct.MV* %165, i32 0, i32 0
  store i16 %164, i16* %166, align 2
  %167 = load i32* %bc, align 4
  %168 = load i32* %i, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %169
  %171 = getelementptr inbounds %struct.MV* %170, i32 0, i32 1
  %172 = load i16* %171, align 2
  %173 = sext i16 %172 to i32
  %174 = add nsw i32 %167, %173
  %175 = trunc i32 %174 to i16
  %176 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %177 = getelementptr inbounds %struct.MV* %176, i32 0, i32 1
  store i16 %175, i16* %177, align 2
  %178 = load i8** %base_offset, align 8
  %179 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %180 = getelementptr inbounds %struct.MV* %179, i32 0, i32 0
  %181 = load i16* %180, align 2
  %182 = sext i16 %181 to i32
  %183 = load i32* %in_what_stride, align 4
  %184 = mul nsw i32 %182, %183
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i8* %178, i64 %185
  %187 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %188 = getelementptr inbounds %struct.MV* %187, i32 0, i32 1
  %189 = load i16* %188, align 2
  %190 = sext i16 %189 to i32
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds i8* %186, i64 %191
  store i8* %192, i8** %this_offset, align 8
  %193 = load %struct.variance_vtable** %8, align 8
  %194 = getelementptr inbounds %struct.variance_vtable* %193, i32 0, i32 0
  %195 = load i32 (i8*, i32, i8*, i32, i32)** %194, align 8
  %196 = load i8** %what, align 8
  %197 = load i32* %what_stride, align 4
  %198 = load i8** %this_offset, align 8
  %199 = load i32* %in_what_stride, align 4
  %200 = load i32* %bestsad, align 4
  %201 = call i32 %195(i8* %196, i32 %197, i8* %198, i32 %199, i32 %200)
  store i32 %201, i32* %thissad, align 4
  %202 = load i32* %thissad, align 4
  %203 = load i32* %bestsad, align 4
  %204 = icmp ult i32 %202, %203
  br i1 %204, label %205, label %218

; <label>:205                                     ; preds = %155
  %206 = load i32*** %9, align 8
  %207 = load i32* %7, align 4
  %208 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %206, i32 %207)
  %209 = load i32* %thissad, align 4
  %210 = add i32 %209, %208
  store i32 %210, i32* %thissad, align 4
  %211 = load i32* %thissad, align 4
  %212 = load i32* %bestsad, align 4
  %213 = icmp ult i32 %211, %212
  br i1 %213, label %214, label %217

; <label>:214                                     ; preds = %205
  %215 = load i32* %thissad, align 4
  store i32 %215, i32* %bestsad, align 4
  %216 = load i32* %i, align 4
  store i32 %216, i32* %best_site, align 4
  br label %217

; <label>:217                                     ; preds = %214, %205
  br label %218

; <label>:218                                     ; preds = %217, %155
  br label %219

; <label>:219                                     ; preds = %218
  %220 = load i32* %i, align 4
  %221 = add nsw i32 %220, 1
  store i32 %221, i32* %i, align 4
  br label %152

; <label>:222                                     ; preds = %152
  br label %335

; <label>:223                                     ; preds = %0
  store i32 0, i32* %i, align 4
  br label %224

; <label>:224                                     ; preds = %331, %223
  %225 = load i32* %i, align 4
  %226 = icmp slt i32 %225, 6
  br i1 %226, label %227, label %334

; <label>:227                                     ; preds = %224
  %228 = load i32* %br, align 4
  %229 = load i32* %i, align 4
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %230
  %232 = getelementptr inbounds %struct.MV* %231, i32 0, i32 0
  %233 = load i16* %232, align 2
  %234 = sext i16 %233 to i32
  %235 = add nsw i32 %228, %234
  %236 = trunc i32 %235 to i16
  %237 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %238 = getelementptr inbounds %struct.MV* %237, i32 0, i32 0
  store i16 %236, i16* %238, align 2
  %239 = load i32* %bc, align 4
  %240 = load i32* %i, align 4
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %241
  %243 = getelementptr inbounds %struct.MV* %242, i32 0, i32 1
  %244 = load i16* %243, align 2
  %245 = sext i16 %244 to i32
  %246 = add nsw i32 %239, %245
  %247 = trunc i32 %246 to i16
  %248 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %249 = getelementptr inbounds %struct.MV* %248, i32 0, i32 1
  store i16 %247, i16* %249, align 2
  %250 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %251 = getelementptr inbounds %struct.MV* %250, i32 0, i32 1
  %252 = load i16* %251, align 2
  %253 = sext i16 %252 to i32
  %254 = load %struct.macroblock** %1, align 8
  %255 = getelementptr inbounds %struct.macroblock* %254, i32 0, i32 31
  %256 = load i32* %255, align 4
  %257 = icmp slt i32 %253, %256
  br i1 %257, label %258, label %259

; <label>:258                                     ; preds = %227
  br label %331

; <label>:259                                     ; preds = %227
  %260 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %261 = getelementptr inbounds %struct.MV* %260, i32 0, i32 1
  %262 = load i16* %261, align 2
  %263 = sext i16 %262 to i32
  %264 = load %struct.macroblock** %1, align 8
  %265 = getelementptr inbounds %struct.macroblock* %264, i32 0, i32 32
  %266 = load i32* %265, align 4
  %267 = icmp sgt i32 %263, %266
  br i1 %267, label %268, label %269

; <label>:268                                     ; preds = %259
  br label %331

; <label>:269                                     ; preds = %259
  %270 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %271 = getelementptr inbounds %struct.MV* %270, i32 0, i32 0
  %272 = load i16* %271, align 2
  %273 = sext i16 %272 to i32
  %274 = load %struct.macroblock** %1, align 8
  %275 = getelementptr inbounds %struct.macroblock* %274, i32 0, i32 33
  %276 = load i32* %275, align 4
  %277 = icmp slt i32 %273, %276
  br i1 %277, label %278, label %279

; <label>:278                                     ; preds = %269
  br label %331

; <label>:279                                     ; preds = %269
  %280 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %281 = getelementptr inbounds %struct.MV* %280, i32 0, i32 0
  %282 = load i16* %281, align 2
  %283 = sext i16 %282 to i32
  %284 = load %struct.macroblock** %1, align 8
  %285 = getelementptr inbounds %struct.macroblock* %284, i32 0, i32 34
  %286 = load i32* %285, align 4
  %287 = icmp sgt i32 %283, %286
  br i1 %287, label %288, label %289

; <label>:288                                     ; preds = %279
  br label %331

; <label>:289                                     ; preds = %279
  %290 = load i8** %base_offset, align 8
  %291 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %292 = getelementptr inbounds %struct.MV* %291, i32 0, i32 0
  %293 = load i16* %292, align 2
  %294 = sext i16 %293 to i32
  %295 = load i32* %in_what_stride, align 4
  %296 = mul nsw i32 %294, %295
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds i8* %290, i64 %297
  %299 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %300 = getelementptr inbounds %struct.MV* %299, i32 0, i32 1
  %301 = load i16* %300, align 2
  %302 = sext i16 %301 to i32
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds i8* %298, i64 %303
  store i8* %304, i8** %this_offset, align 8
  %305 = load %struct.variance_vtable** %8, align 8
  %306 = getelementptr inbounds %struct.variance_vtable* %305, i32 0, i32 0
  %307 = load i32 (i8*, i32, i8*, i32, i32)** %306, align 8
  %308 = load i8** %what, align 8
  %309 = load i32* %what_stride, align 4
  %310 = load i8** %this_offset, align 8
  %311 = load i32* %in_what_stride, align 4
  %312 = load i32* %bestsad, align 4
  %313 = call i32 %307(i8* %308, i32 %309, i8* %310, i32 %311, i32 %312)
  store i32 %313, i32* %thissad, align 4
  %314 = load i32* %thissad, align 4
  %315 = load i32* %bestsad, align 4
  %316 = icmp ult i32 %314, %315
  br i1 %316, label %317, label %330

; <label>:317                                     ; preds = %289
  %318 = load i32*** %9, align 8
  %319 = load i32* %7, align 4
  %320 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %318, i32 %319)
  %321 = load i32* %thissad, align 4
  %322 = add i32 %321, %320
  store i32 %322, i32* %thissad, align 4
  %323 = load i32* %thissad, align 4
  %324 = load i32* %bestsad, align 4
  %325 = icmp ult i32 %323, %324
  br i1 %325, label %326, label %329

; <label>:326                                     ; preds = %317
  %327 = load i32* %thissad, align 4
  store i32 %327, i32* %bestsad, align 4
  %328 = load i32* %i, align 4
  store i32 %328, i32* %best_site, align 4
  br label %329

; <label>:329                                     ; preds = %326, %317
  br label %330

; <label>:330                                     ; preds = %329, %289
  br label %331

; <label>:331                                     ; preds = %330, %288, %278, %268, %258
  %332 = load i32* %i, align 4
  %333 = add nsw i32 %332, 1
  store i32 %333, i32* %i, align 4
  br label %224

; <label>:334                                     ; preds = %224
  br label %335

; <label>:335                                     ; preds = %334, %222
  %336 = load i32* %best_site, align 4
  %337 = icmp eq i32 %336, -1
  br i1 %337, label %338, label %339

; <label>:338                                     ; preds = %335
  br label %646

; <label>:339                                     ; preds = %335
  %340 = load i32* %best_site, align 4
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %341
  %343 = getelementptr inbounds %struct.MV* %342, i32 0, i32 0
  %344 = load i16* %343, align 2
  %345 = sext i16 %344 to i32
  %346 = load i32* %br, align 4
  %347 = add nsw i32 %346, %345
  store i32 %347, i32* %br, align 4
  %348 = load i32* %best_site, align 4
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %349
  %351 = getelementptr inbounds %struct.MV* %350, i32 0, i32 1
  %352 = load i16* %351, align 2
  %353 = sext i16 %352 to i32
  %354 = load i32* %bc, align 4
  %355 = add nsw i32 %354, %353
  store i32 %355, i32* %bc, align 4
  %356 = load i32* %best_site, align 4
  store i32 %356, i32* %k, align 4
  br label %357

; <label>:357                                     ; preds = %339
  store i32 1, i32* %j, align 4
  br label %358

; <label>:358                                     ; preds = %642, %357
  %359 = load i32* %j, align 4
  %360 = load i32* %hex_range, align 4
  %361 = icmp slt i32 %359, %360
  br i1 %361, label %362, label %645

; <label>:362                                     ; preds = %358
  store i32 -1, i32* %best_site, align 4
  store i32 1, i32* %all_in, align 4
  %363 = load i32* %br, align 4
  %364 = sub nsw i32 %363, 2
  %365 = load %struct.macroblock** %1, align 8
  %366 = getelementptr inbounds %struct.macroblock* %365, i32 0, i32 33
  %367 = load i32* %366, align 4
  %368 = icmp sge i32 %364, %367
  %369 = zext i1 %368 to i32
  %370 = load i32* %all_in, align 4
  %371 = and i32 %370, %369
  store i32 %371, i32* %all_in, align 4
  %372 = load i32* %br, align 4
  %373 = add nsw i32 %372, 2
  %374 = load %struct.macroblock** %1, align 8
  %375 = getelementptr inbounds %struct.macroblock* %374, i32 0, i32 34
  %376 = load i32* %375, align 4
  %377 = icmp sle i32 %373, %376
  %378 = zext i1 %377 to i32
  %379 = load i32* %all_in, align 4
  %380 = and i32 %379, %378
  store i32 %380, i32* %all_in, align 4
  %381 = load i32* %bc, align 4
  %382 = sub nsw i32 %381, 2
  %383 = load %struct.macroblock** %1, align 8
  %384 = getelementptr inbounds %struct.macroblock* %383, i32 0, i32 31
  %385 = load i32* %384, align 4
  %386 = icmp sge i32 %382, %385
  %387 = zext i1 %386 to i32
  %388 = load i32* %all_in, align 4
  %389 = and i32 %388, %387
  store i32 %389, i32* %all_in, align 4
  %390 = load i32* %bc, align 4
  %391 = add nsw i32 %390, 2
  %392 = load %struct.macroblock** %1, align 8
  %393 = getelementptr inbounds %struct.macroblock* %392, i32 0, i32 32
  %394 = load i32* %393, align 4
  %395 = icmp sle i32 %391, %394
  %396 = zext i1 %395 to i32
  %397 = load i32* %all_in, align 4
  %398 = and i32 %397, %396
  store i32 %398, i32* %all_in, align 4
  %399 = load i32* %all_in, align 4
  %400 = icmp ne i32 %399, 0
  br i1 %400, label %401, label %479

; <label>:401                                     ; preds = %362
  store i32 0, i32* %i, align 4
  br label %402

; <label>:402                                     ; preds = %475, %401
  %403 = load i32* %i, align 4
  %404 = icmp slt i32 %403, 3
  br i1 %404, label %405, label %478

; <label>:405                                     ; preds = %402
  %406 = load i32* %br, align 4
  %407 = load i32* %i, align 4
  %408 = sext i32 %407 to i64
  %409 = load i32* %k, align 4
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %410
  %412 = getelementptr inbounds [3 x %struct.MV]* %411, i32 0, i64 %408
  %413 = getelementptr inbounds %struct.MV* %412, i32 0, i32 0
  %414 = load i16* %413, align 2
  %415 = sext i16 %414 to i32
  %416 = add nsw i32 %406, %415
  %417 = trunc i32 %416 to i16
  %418 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %419 = getelementptr inbounds %struct.MV* %418, i32 0, i32 0
  store i16 %417, i16* %419, align 2
  %420 = load i32* %bc, align 4
  %421 = load i32* %i, align 4
  %422 = sext i32 %421 to i64
  %423 = load i32* %k, align 4
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %424
  %426 = getelementptr inbounds [3 x %struct.MV]* %425, i32 0, i64 %422
  %427 = getelementptr inbounds %struct.MV* %426, i32 0, i32 1
  %428 = load i16* %427, align 2
  %429 = sext i16 %428 to i32
  %430 = add nsw i32 %420, %429
  %431 = trunc i32 %430 to i16
  %432 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %433 = getelementptr inbounds %struct.MV* %432, i32 0, i32 1
  store i16 %431, i16* %433, align 2
  %434 = load i8** %base_offset, align 8
  %435 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %436 = getelementptr inbounds %struct.MV* %435, i32 0, i32 0
  %437 = load i16* %436, align 2
  %438 = sext i16 %437 to i32
  %439 = load i32* %in_what_stride, align 4
  %440 = mul nsw i32 %438, %439
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds i8* %434, i64 %441
  %443 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %444 = getelementptr inbounds %struct.MV* %443, i32 0, i32 1
  %445 = load i16* %444, align 2
  %446 = sext i16 %445 to i32
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds i8* %442, i64 %447
  store i8* %448, i8** %this_offset, align 8
  %449 = load %struct.variance_vtable** %8, align 8
  %450 = getelementptr inbounds %struct.variance_vtable* %449, i32 0, i32 0
  %451 = load i32 (i8*, i32, i8*, i32, i32)** %450, align 8
  %452 = load i8** %what, align 8
  %453 = load i32* %what_stride, align 4
  %454 = load i8** %this_offset, align 8
  %455 = load i32* %in_what_stride, align 4
  %456 = load i32* %bestsad, align 4
  %457 = call i32 %451(i8* %452, i32 %453, i8* %454, i32 %455, i32 %456)
  store i32 %457, i32* %thissad, align 4
  %458 = load i32* %thissad, align 4
  %459 = load i32* %bestsad, align 4
  %460 = icmp ult i32 %458, %459
  br i1 %460, label %461, label %474

; <label>:461                                     ; preds = %405
  %462 = load i32*** %9, align 8
  %463 = load i32* %7, align 4
  %464 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %462, i32 %463)
  %465 = load i32* %thissad, align 4
  %466 = add i32 %465, %464
  store i32 %466, i32* %thissad, align 4
  %467 = load i32* %thissad, align 4
  %468 = load i32* %bestsad, align 4
  %469 = icmp ult i32 %467, %468
  br i1 %469, label %470, label %473

; <label>:470                                     ; preds = %461
  %471 = load i32* %thissad, align 4
  store i32 %471, i32* %bestsad, align 4
  %472 = load i32* %i, align 4
  store i32 %472, i32* %best_site, align 4
  br label %473

; <label>:473                                     ; preds = %470, %461
  br label %474

; <label>:474                                     ; preds = %473, %405
  br label %475

; <label>:475                                     ; preds = %474
  %476 = load i32* %i, align 4
  %477 = add nsw i32 %476, 1
  store i32 %477, i32* %i, align 4
  br label %402

; <label>:478                                     ; preds = %402
  br label %597

; <label>:479                                     ; preds = %362
  store i32 0, i32* %i, align 4
  br label %480

; <label>:480                                     ; preds = %593, %479
  %481 = load i32* %i, align 4
  %482 = icmp slt i32 %481, 3
  br i1 %482, label %483, label %596

; <label>:483                                     ; preds = %480
  %484 = load i32* %br, align 4
  %485 = load i32* %i, align 4
  %486 = sext i32 %485 to i64
  %487 = load i32* %k, align 4
  %488 = sext i32 %487 to i64
  %489 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %488
  %490 = getelementptr inbounds [3 x %struct.MV]* %489, i32 0, i64 %486
  %491 = getelementptr inbounds %struct.MV* %490, i32 0, i32 0
  %492 = load i16* %491, align 2
  %493 = sext i16 %492 to i32
  %494 = add nsw i32 %484, %493
  %495 = trunc i32 %494 to i16
  %496 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %497 = getelementptr inbounds %struct.MV* %496, i32 0, i32 0
  store i16 %495, i16* %497, align 2
  %498 = load i32* %bc, align 4
  %499 = load i32* %i, align 4
  %500 = sext i32 %499 to i64
  %501 = load i32* %k, align 4
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %502
  %504 = getelementptr inbounds [3 x %struct.MV]* %503, i32 0, i64 %500
  %505 = getelementptr inbounds %struct.MV* %504, i32 0, i32 1
  %506 = load i16* %505, align 2
  %507 = sext i16 %506 to i32
  %508 = add nsw i32 %498, %507
  %509 = trunc i32 %508 to i16
  %510 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %511 = getelementptr inbounds %struct.MV* %510, i32 0, i32 1
  store i16 %509, i16* %511, align 2
  %512 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %513 = getelementptr inbounds %struct.MV* %512, i32 0, i32 1
  %514 = load i16* %513, align 2
  %515 = sext i16 %514 to i32
  %516 = load %struct.macroblock** %1, align 8
  %517 = getelementptr inbounds %struct.macroblock* %516, i32 0, i32 31
  %518 = load i32* %517, align 4
  %519 = icmp slt i32 %515, %518
  br i1 %519, label %520, label %521

; <label>:520                                     ; preds = %483
  br label %593

; <label>:521                                     ; preds = %483
  %522 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %523 = getelementptr inbounds %struct.MV* %522, i32 0, i32 1
  %524 = load i16* %523, align 2
  %525 = sext i16 %524 to i32
  %526 = load %struct.macroblock** %1, align 8
  %527 = getelementptr inbounds %struct.macroblock* %526, i32 0, i32 32
  %528 = load i32* %527, align 4
  %529 = icmp sgt i32 %525, %528
  br i1 %529, label %530, label %531

; <label>:530                                     ; preds = %521
  br label %593

; <label>:531                                     ; preds = %521
  %532 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %533 = getelementptr inbounds %struct.MV* %532, i32 0, i32 0
  %534 = load i16* %533, align 2
  %535 = sext i16 %534 to i32
  %536 = load %struct.macroblock** %1, align 8
  %537 = getelementptr inbounds %struct.macroblock* %536, i32 0, i32 33
  %538 = load i32* %537, align 4
  %539 = icmp slt i32 %535, %538
  br i1 %539, label %540, label %541

; <label>:540                                     ; preds = %531
  br label %593

; <label>:541                                     ; preds = %531
  %542 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %543 = getelementptr inbounds %struct.MV* %542, i32 0, i32 0
  %544 = load i16* %543, align 2
  %545 = sext i16 %544 to i32
  %546 = load %struct.macroblock** %1, align 8
  %547 = getelementptr inbounds %struct.macroblock* %546, i32 0, i32 34
  %548 = load i32* %547, align 4
  %549 = icmp sgt i32 %545, %548
  br i1 %549, label %550, label %551

; <label>:550                                     ; preds = %541
  br label %593

; <label>:551                                     ; preds = %541
  %552 = load i8** %base_offset, align 8
  %553 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %554 = getelementptr inbounds %struct.MV* %553, i32 0, i32 0
  %555 = load i16* %554, align 2
  %556 = sext i16 %555 to i32
  %557 = load i32* %in_what_stride, align 4
  %558 = mul nsw i32 %556, %557
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds i8* %552, i64 %559
  %561 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %562 = getelementptr inbounds %struct.MV* %561, i32 0, i32 1
  %563 = load i16* %562, align 2
  %564 = sext i16 %563 to i32
  %565 = sext i32 %564 to i64
  %566 = getelementptr inbounds i8* %560, i64 %565
  store i8* %566, i8** %this_offset, align 8
  %567 = load %struct.variance_vtable** %8, align 8
  %568 = getelementptr inbounds %struct.variance_vtable* %567, i32 0, i32 0
  %569 = load i32 (i8*, i32, i8*, i32, i32)** %568, align 8
  %570 = load i8** %what, align 8
  %571 = load i32* %what_stride, align 4
  %572 = load i8** %this_offset, align 8
  %573 = load i32* %in_what_stride, align 4
  %574 = load i32* %bestsad, align 4
  %575 = call i32 %569(i8* %570, i32 %571, i8* %572, i32 %573, i32 %574)
  store i32 %575, i32* %thissad, align 4
  %576 = load i32* %thissad, align 4
  %577 = load i32* %bestsad, align 4
  %578 = icmp ult i32 %576, %577
  br i1 %578, label %579, label %592

; <label>:579                                     ; preds = %551
  %580 = load i32*** %9, align 8
  %581 = load i32* %7, align 4
  %582 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %580, i32 %581)
  %583 = load i32* %thissad, align 4
  %584 = add i32 %583, %582
  store i32 %584, i32* %thissad, align 4
  %585 = load i32* %thissad, align 4
  %586 = load i32* %bestsad, align 4
  %587 = icmp ult i32 %585, %586
  br i1 %587, label %588, label %591

; <label>:588                                     ; preds = %579
  %589 = load i32* %thissad, align 4
  store i32 %589, i32* %bestsad, align 4
  %590 = load i32* %i, align 4
  store i32 %590, i32* %best_site, align 4
  br label %591

; <label>:591                                     ; preds = %588, %579
  br label %592

; <label>:592                                     ; preds = %591, %551
  br label %593

; <label>:593                                     ; preds = %592, %550, %540, %530, %520
  %594 = load i32* %i, align 4
  %595 = add nsw i32 %594, 1
  store i32 %595, i32* %i, align 4
  br label %480

; <label>:596                                     ; preds = %480
  br label %597

; <label>:597                                     ; preds = %596, %478
  %598 = load i32* %best_site, align 4
  %599 = icmp eq i32 %598, -1
  br i1 %599, label %600, label %601

; <label>:600                                     ; preds = %597
  br label %645

; <label>:601                                     ; preds = %597
  %602 = load i32* %best_site, align 4
  %603 = sext i32 %602 to i64
  %604 = load i32* %k, align 4
  %605 = sext i32 %604 to i64
  %606 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %605
  %607 = getelementptr inbounds [3 x %struct.MV]* %606, i32 0, i64 %603
  %608 = getelementptr inbounds %struct.MV* %607, i32 0, i32 0
  %609 = load i16* %608, align 2
  %610 = sext i16 %609 to i32
  %611 = load i32* %br, align 4
  %612 = add nsw i32 %611, %610
  store i32 %612, i32* %br, align 4
  %613 = load i32* %best_site, align 4
  %614 = sext i32 %613 to i64
  %615 = load i32* %k, align 4
  %616 = sext i32 %615 to i64
  %617 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %616
  %618 = getelementptr inbounds [3 x %struct.MV]* %617, i32 0, i64 %614
  %619 = getelementptr inbounds %struct.MV* %618, i32 0, i32 1
  %620 = load i16* %619, align 2
  %621 = sext i16 %620 to i32
  %622 = load i32* %bc, align 4
  %623 = add nsw i32 %622, %621
  store i32 %623, i32* %bc, align 4
  %624 = load i32* %best_site, align 4
  %625 = add nsw i32 5, %624
  %626 = load i32* %k, align 4
  %627 = add nsw i32 %626, %625
  store i32 %627, i32* %k, align 4
  %628 = load i32* %k, align 4
  %629 = icmp sge i32 %628, 12
  br i1 %629, label %630, label %633

; <label>:630                                     ; preds = %601
  %631 = load i32* %k, align 4
  %632 = sub nsw i32 %631, 12
  store i32 %632, i32* %k, align 4
  br label %640

; <label>:633                                     ; preds = %601
  %634 = load i32* %k, align 4
  %635 = icmp sge i32 %634, 6
  br i1 %635, label %636, label %639

; <label>:636                                     ; preds = %633
  %637 = load i32* %k, align 4
  %638 = sub nsw i32 %637, 6
  store i32 %638, i32* %k, align 4
  br label %639

; <label>:639                                     ; preds = %636, %633
  br label %640

; <label>:640                                     ; preds = %639, %630
  br label %641

; <label>:641                                     ; preds = %640
  br label %642

; <label>:642                                     ; preds = %641
  %643 = load i32* %j, align 4
  %644 = add nsw i32 %643, 1
  store i32 %644, i32* %j, align 4
  br label %358

; <label>:645                                     ; preds = %600, %358
  br label %646

; <label>:646                                     ; preds = %645, %338
  store i32 0, i32* %j, align 4
  br label %647

; <label>:647                                     ; preds = %896, %646
  %648 = load i32* %j, align 4
  %649 = load i32* %dia_range, align 4
  %650 = icmp slt i32 %648, %649
  br i1 %650, label %651, label %899

; <label>:651                                     ; preds = %647
  store i32 -1, i32* %best_site, align 4
  store i32 1, i32* %all_in, align 4
  %652 = load i32* %br, align 4
  %653 = sub nsw i32 %652, 1
  %654 = load %struct.macroblock** %1, align 8
  %655 = getelementptr inbounds %struct.macroblock* %654, i32 0, i32 33
  %656 = load i32* %655, align 4
  %657 = icmp sge i32 %653, %656
  %658 = zext i1 %657 to i32
  %659 = load i32* %all_in, align 4
  %660 = and i32 %659, %658
  store i32 %660, i32* %all_in, align 4
  %661 = load i32* %br, align 4
  %662 = add nsw i32 %661, 1
  %663 = load %struct.macroblock** %1, align 8
  %664 = getelementptr inbounds %struct.macroblock* %663, i32 0, i32 34
  %665 = load i32* %664, align 4
  %666 = icmp sle i32 %662, %665
  %667 = zext i1 %666 to i32
  %668 = load i32* %all_in, align 4
  %669 = and i32 %668, %667
  store i32 %669, i32* %all_in, align 4
  %670 = load i32* %bc, align 4
  %671 = sub nsw i32 %670, 1
  %672 = load %struct.macroblock** %1, align 8
  %673 = getelementptr inbounds %struct.macroblock* %672, i32 0, i32 31
  %674 = load i32* %673, align 4
  %675 = icmp sge i32 %671, %674
  %676 = zext i1 %675 to i32
  %677 = load i32* %all_in, align 4
  %678 = and i32 %677, %676
  store i32 %678, i32* %all_in, align 4
  %679 = load i32* %bc, align 4
  %680 = add nsw i32 %679, 1
  %681 = load %struct.macroblock** %1, align 8
  %682 = getelementptr inbounds %struct.macroblock* %681, i32 0, i32 32
  %683 = load i32* %682, align 4
  %684 = icmp sle i32 %680, %683
  %685 = zext i1 %684 to i32
  %686 = load i32* %all_in, align 4
  %687 = and i32 %686, %685
  store i32 %687, i32* %all_in, align 4
  %688 = load i32* %all_in, align 4
  %689 = icmp ne i32 %688, 0
  br i1 %689, label %690, label %762

; <label>:690                                     ; preds = %651
  store i32 0, i32* %i, align 4
  br label %691

; <label>:691                                     ; preds = %758, %690
  %692 = load i32* %i, align 4
  %693 = icmp slt i32 %692, 4
  br i1 %693, label %694, label %761

; <label>:694                                     ; preds = %691
  %695 = load i32* %br, align 4
  %696 = load i32* %i, align 4
  %697 = sext i32 %696 to i64
  %698 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %697
  %699 = getelementptr inbounds %struct.MV* %698, i32 0, i32 0
  %700 = load i16* %699, align 2
  %701 = sext i16 %700 to i32
  %702 = add nsw i32 %695, %701
  %703 = trunc i32 %702 to i16
  %704 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %705 = getelementptr inbounds %struct.MV* %704, i32 0, i32 0
  store i16 %703, i16* %705, align 2
  %706 = load i32* %bc, align 4
  %707 = load i32* %i, align 4
  %708 = sext i32 %707 to i64
  %709 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %708
  %710 = getelementptr inbounds %struct.MV* %709, i32 0, i32 1
  %711 = load i16* %710, align 2
  %712 = sext i16 %711 to i32
  %713 = add nsw i32 %706, %712
  %714 = trunc i32 %713 to i16
  %715 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %716 = getelementptr inbounds %struct.MV* %715, i32 0, i32 1
  store i16 %714, i16* %716, align 2
  %717 = load i8** %base_offset, align 8
  %718 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %719 = getelementptr inbounds %struct.MV* %718, i32 0, i32 0
  %720 = load i16* %719, align 2
  %721 = sext i16 %720 to i32
  %722 = load i32* %in_what_stride, align 4
  %723 = mul nsw i32 %721, %722
  %724 = sext i32 %723 to i64
  %725 = getelementptr inbounds i8* %717, i64 %724
  %726 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %727 = getelementptr inbounds %struct.MV* %726, i32 0, i32 1
  %728 = load i16* %727, align 2
  %729 = sext i16 %728 to i32
  %730 = sext i32 %729 to i64
  %731 = getelementptr inbounds i8* %725, i64 %730
  store i8* %731, i8** %this_offset, align 8
  %732 = load %struct.variance_vtable** %8, align 8
  %733 = getelementptr inbounds %struct.variance_vtable* %732, i32 0, i32 0
  %734 = load i32 (i8*, i32, i8*, i32, i32)** %733, align 8
  %735 = load i8** %what, align 8
  %736 = load i32* %what_stride, align 4
  %737 = load i8** %this_offset, align 8
  %738 = load i32* %in_what_stride, align 4
  %739 = load i32* %bestsad, align 4
  %740 = call i32 %734(i8* %735, i32 %736, i8* %737, i32 %738, i32 %739)
  store i32 %740, i32* %thissad, align 4
  %741 = load i32* %thissad, align 4
  %742 = load i32* %bestsad, align 4
  %743 = icmp ult i32 %741, %742
  br i1 %743, label %744, label %757

; <label>:744                                     ; preds = %694
  %745 = load i32*** %9, align 8
  %746 = load i32* %7, align 4
  %747 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %745, i32 %746)
  %748 = load i32* %thissad, align 4
  %749 = add i32 %748, %747
  store i32 %749, i32* %thissad, align 4
  %750 = load i32* %thissad, align 4
  %751 = load i32* %bestsad, align 4
  %752 = icmp ult i32 %750, %751
  br i1 %752, label %753, label %756

; <label>:753                                     ; preds = %744
  %754 = load i32* %thissad, align 4
  store i32 %754, i32* %bestsad, align 4
  %755 = load i32* %i, align 4
  store i32 %755, i32* %best_site, align 4
  br label %756

; <label>:756                                     ; preds = %753, %744
  br label %757

; <label>:757                                     ; preds = %756, %694
  br label %758

; <label>:758                                     ; preds = %757
  %759 = load i32* %i, align 4
  %760 = add nsw i32 %759, 1
  store i32 %760, i32* %i, align 4
  br label %691

; <label>:761                                     ; preds = %691
  br label %874

; <label>:762                                     ; preds = %651
  store i32 0, i32* %i, align 4
  br label %763

; <label>:763                                     ; preds = %870, %762
  %764 = load i32* %i, align 4
  %765 = icmp slt i32 %764, 4
  br i1 %765, label %766, label %873

; <label>:766                                     ; preds = %763
  %767 = load i32* %br, align 4
  %768 = load i32* %i, align 4
  %769 = sext i32 %768 to i64
  %770 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %769
  %771 = getelementptr inbounds %struct.MV* %770, i32 0, i32 0
  %772 = load i16* %771, align 2
  %773 = sext i16 %772 to i32
  %774 = add nsw i32 %767, %773
  %775 = trunc i32 %774 to i16
  %776 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %777 = getelementptr inbounds %struct.MV* %776, i32 0, i32 0
  store i16 %775, i16* %777, align 2
  %778 = load i32* %bc, align 4
  %779 = load i32* %i, align 4
  %780 = sext i32 %779 to i64
  %781 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %780
  %782 = getelementptr inbounds %struct.MV* %781, i32 0, i32 1
  %783 = load i16* %782, align 2
  %784 = sext i16 %783 to i32
  %785 = add nsw i32 %778, %784
  %786 = trunc i32 %785 to i16
  %787 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %788 = getelementptr inbounds %struct.MV* %787, i32 0, i32 1
  store i16 %786, i16* %788, align 2
  %789 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %790 = getelementptr inbounds %struct.MV* %789, i32 0, i32 1
  %791 = load i16* %790, align 2
  %792 = sext i16 %791 to i32
  %793 = load %struct.macroblock** %1, align 8
  %794 = getelementptr inbounds %struct.macroblock* %793, i32 0, i32 31
  %795 = load i32* %794, align 4
  %796 = icmp slt i32 %792, %795
  br i1 %796, label %797, label %798

; <label>:797                                     ; preds = %766
  br label %870

; <label>:798                                     ; preds = %766
  %799 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %800 = getelementptr inbounds %struct.MV* %799, i32 0, i32 1
  %801 = load i16* %800, align 2
  %802 = sext i16 %801 to i32
  %803 = load %struct.macroblock** %1, align 8
  %804 = getelementptr inbounds %struct.macroblock* %803, i32 0, i32 32
  %805 = load i32* %804, align 4
  %806 = icmp sgt i32 %802, %805
  br i1 %806, label %807, label %808

; <label>:807                                     ; preds = %798
  br label %870

; <label>:808                                     ; preds = %798
  %809 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %810 = getelementptr inbounds %struct.MV* %809, i32 0, i32 0
  %811 = load i16* %810, align 2
  %812 = sext i16 %811 to i32
  %813 = load %struct.macroblock** %1, align 8
  %814 = getelementptr inbounds %struct.macroblock* %813, i32 0, i32 33
  %815 = load i32* %814, align 4
  %816 = icmp slt i32 %812, %815
  br i1 %816, label %817, label %818

; <label>:817                                     ; preds = %808
  br label %870

; <label>:818                                     ; preds = %808
  %819 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %820 = getelementptr inbounds %struct.MV* %819, i32 0, i32 0
  %821 = load i16* %820, align 2
  %822 = sext i16 %821 to i32
  %823 = load %struct.macroblock** %1, align 8
  %824 = getelementptr inbounds %struct.macroblock* %823, i32 0, i32 34
  %825 = load i32* %824, align 4
  %826 = icmp sgt i32 %822, %825
  br i1 %826, label %827, label %828

; <label>:827                                     ; preds = %818
  br label %870

; <label>:828                                     ; preds = %818
  %829 = load i8** %base_offset, align 8
  %830 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %831 = getelementptr inbounds %struct.MV* %830, i32 0, i32 0
  %832 = load i16* %831, align 2
  %833 = sext i16 %832 to i32
  %834 = load i32* %in_what_stride, align 4
  %835 = mul nsw i32 %833, %834
  %836 = sext i32 %835 to i64
  %837 = getelementptr inbounds i8* %829, i64 %836
  %838 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %839 = getelementptr inbounds %struct.MV* %838, i32 0, i32 1
  %840 = load i16* %839, align 2
  %841 = sext i16 %840 to i32
  %842 = sext i32 %841 to i64
  %843 = getelementptr inbounds i8* %837, i64 %842
  store i8* %843, i8** %this_offset, align 8
  %844 = load %struct.variance_vtable** %8, align 8
  %845 = getelementptr inbounds %struct.variance_vtable* %844, i32 0, i32 0
  %846 = load i32 (i8*, i32, i8*, i32, i32)** %845, align 8
  %847 = load i8** %what, align 8
  %848 = load i32* %what_stride, align 4
  %849 = load i8** %this_offset, align 8
  %850 = load i32* %in_what_stride, align 4
  %851 = load i32* %bestsad, align 4
  %852 = call i32 %846(i8* %847, i32 %848, i8* %849, i32 %850, i32 %851)
  store i32 %852, i32* %thissad, align 4
  %853 = load i32* %thissad, align 4
  %854 = load i32* %bestsad, align 4
  %855 = icmp ult i32 %853, %854
  br i1 %855, label %856, label %869

; <label>:856                                     ; preds = %828
  %857 = load i32*** %9, align 8
  %858 = load i32* %7, align 4
  %859 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %857, i32 %858)
  %860 = load i32* %thissad, align 4
  %861 = add i32 %860, %859
  store i32 %861, i32* %thissad, align 4
  %862 = load i32* %thissad, align 4
  %863 = load i32* %bestsad, align 4
  %864 = icmp ult i32 %862, %863
  br i1 %864, label %865, label %868

; <label>:865                                     ; preds = %856
  %866 = load i32* %thissad, align 4
  store i32 %866, i32* %bestsad, align 4
  %867 = load i32* %i, align 4
  store i32 %867, i32* %best_site, align 4
  br label %868

; <label>:868                                     ; preds = %865, %856
  br label %869

; <label>:869                                     ; preds = %868, %828
  br label %870

; <label>:870                                     ; preds = %869, %827, %817, %807, %797
  %871 = load i32* %i, align 4
  %872 = add nsw i32 %871, 1
  store i32 %872, i32* %i, align 4
  br label %763

; <label>:873                                     ; preds = %763
  br label %874

; <label>:874                                     ; preds = %873, %761
  %875 = load i32* %best_site, align 4
  %876 = icmp eq i32 %875, -1
  br i1 %876, label %877, label %878

; <label>:877                                     ; preds = %874
  br label %899

; <label>:878                                     ; preds = %874
  %879 = load i32* %best_site, align 4
  %880 = sext i32 %879 to i64
  %881 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %880
  %882 = getelementptr inbounds %struct.MV* %881, i32 0, i32 0
  %883 = load i16* %882, align 2
  %884 = sext i16 %883 to i32
  %885 = load i32* %br, align 4
  %886 = add nsw i32 %885, %884
  store i32 %886, i32* %br, align 4
  %887 = load i32* %best_site, align 4
  %888 = sext i32 %887 to i64
  %889 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %888
  %890 = getelementptr inbounds %struct.MV* %889, i32 0, i32 1
  %891 = load i16* %890, align 2
  %892 = sext i16 %891 to i32
  %893 = load i32* %bc, align 4
  %894 = add nsw i32 %893, %892
  store i32 %894, i32* %bc, align 4
  br label %895

; <label>:895                                     ; preds = %878
  br label %896

; <label>:896                                     ; preds = %895
  %897 = load i32* %j, align 4
  %898 = add nsw i32 %897, 1
  store i32 %898, i32* %j, align 4
  br label %647

; <label>:899                                     ; preds = %877, %647
  %900 = load i32* %br, align 4
  %901 = trunc i32 %900 to i16
  %902 = load %union.int_mv** %5, align 8
  %903 = bitcast %union.int_mv* %902 to %struct.MV*
  %904 = getelementptr inbounds %struct.MV* %903, i32 0, i32 0
  store i16 %901, i16* %904, align 2
  %905 = load i32* %bc, align 4
  %906 = trunc i32 %905 to i16
  %907 = load %union.int_mv** %5, align 8
  %908 = bitcast %union.int_mv* %907 to %struct.MV*
  %909 = getelementptr inbounds %struct.MV* %908, i32 0, i32 1
  store i16 %906, i16* %909, align 2
  %910 = load i32* %bestsad, align 4
  ret i32 %910
}

; Function Attrs: nounwind uwtable
define internal void @vp8_clamp_mv(%union.int_mv* %mv, i32 %mb_to_left_edge, i32 %mb_to_right_edge, i32 %mb_to_top_edge, i32 %mb_to_bottom_edge) #0 {
  %1 = alloca %union.int_mv*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %union.int_mv* %mv, %union.int_mv** %1, align 8
  store i32 %mb_to_left_edge, i32* %2, align 4
  store i32 %mb_to_right_edge, i32* %3, align 4
  store i32 %mb_to_top_edge, i32* %4, align 4
  store i32 %mb_to_bottom_edge, i32* %5, align 4
  %6 = load %union.int_mv** %1, align 8
  %7 = bitcast %union.int_mv* %6 to %struct.MV*
  %8 = getelementptr inbounds %struct.MV* %7, i32 0, i32 1
  %9 = load i16* %8, align 2
  %10 = sext i16 %9 to i32
  %11 = load i32* %2, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %15

; <label>:13                                      ; preds = %0
  %14 = load i32* %2, align 4
  br label %21

; <label>:15                                      ; preds = %0
  %16 = load %union.int_mv** %1, align 8
  %17 = bitcast %union.int_mv* %16 to %struct.MV*
  %18 = getelementptr inbounds %struct.MV* %17, i32 0, i32 1
  %19 = load i16* %18, align 2
  %20 = sext i16 %19 to i32
  br label %21

; <label>:21                                      ; preds = %15, %13
  %22 = phi i32 [ %14, %13 ], [ %20, %15 ]
  %23 = trunc i32 %22 to i16
  %24 = load %union.int_mv** %1, align 8
  %25 = bitcast %union.int_mv* %24 to %struct.MV*
  %26 = getelementptr inbounds %struct.MV* %25, i32 0, i32 1
  store i16 %23, i16* %26, align 2
  %27 = load %union.int_mv** %1, align 8
  %28 = bitcast %union.int_mv* %27 to %struct.MV*
  %29 = getelementptr inbounds %struct.MV* %28, i32 0, i32 1
  %30 = load i16* %29, align 2
  %31 = sext i16 %30 to i32
  %32 = load i32* %3, align 4
  %33 = icmp sgt i32 %31, %32
  br i1 %33, label %34, label %36

; <label>:34                                      ; preds = %21
  %35 = load i32* %3, align 4
  br label %42

; <label>:36                                      ; preds = %21
  %37 = load %union.int_mv** %1, align 8
  %38 = bitcast %union.int_mv* %37 to %struct.MV*
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 1
  %40 = load i16* %39, align 2
  %41 = sext i16 %40 to i32
  br label %42

; <label>:42                                      ; preds = %36, %34
  %43 = phi i32 [ %35, %34 ], [ %41, %36 ]
  %44 = trunc i32 %43 to i16
  %45 = load %union.int_mv** %1, align 8
  %46 = bitcast %union.int_mv* %45 to %struct.MV*
  %47 = getelementptr inbounds %struct.MV* %46, i32 0, i32 1
  store i16 %44, i16* %47, align 2
  %48 = load %union.int_mv** %1, align 8
  %49 = bitcast %union.int_mv* %48 to %struct.MV*
  %50 = getelementptr inbounds %struct.MV* %49, i32 0, i32 0
  %51 = load i16* %50, align 2
  %52 = sext i16 %51 to i32
  %53 = load i32* %4, align 4
  %54 = icmp slt i32 %52, %53
  br i1 %54, label %55, label %57

; <label>:55                                      ; preds = %42
  %56 = load i32* %4, align 4
  br label %63

; <label>:57                                      ; preds = %42
  %58 = load %union.int_mv** %1, align 8
  %59 = bitcast %union.int_mv* %58 to %struct.MV*
  %60 = getelementptr inbounds %struct.MV* %59, i32 0, i32 0
  %61 = load i16* %60, align 2
  %62 = sext i16 %61 to i32
  br label %63

; <label>:63                                      ; preds = %57, %55
  %64 = phi i32 [ %56, %55 ], [ %62, %57 ]
  %65 = trunc i32 %64 to i16
  %66 = load %union.int_mv** %1, align 8
  %67 = bitcast %union.int_mv* %66 to %struct.MV*
  %68 = getelementptr inbounds %struct.MV* %67, i32 0, i32 0
  store i16 %65, i16* %68, align 2
  %69 = load %union.int_mv** %1, align 8
  %70 = bitcast %union.int_mv* %69 to %struct.MV*
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 0
  %72 = load i16* %71, align 2
  %73 = sext i16 %72 to i32
  %74 = load i32* %5, align 4
  %75 = icmp sgt i32 %73, %74
  br i1 %75, label %76, label %78

; <label>:76                                      ; preds = %63
  %77 = load i32* %5, align 4
  br label %84

; <label>:78                                      ; preds = %63
  %79 = load %union.int_mv** %1, align 8
  %80 = bitcast %union.int_mv* %79 to %struct.MV*
  %81 = getelementptr inbounds %struct.MV* %80, i32 0, i32 0
  %82 = load i16* %81, align 2
  %83 = sext i16 %82 to i32
  br label %84

; <label>:84                                      ; preds = %78, %76
  %85 = phi i32 [ %77, %76 ], [ %83, %78 ]
  %86 = trunc i32 %85 to i16
  %87 = load %union.int_mv** %1, align 8
  %88 = bitcast %union.int_mv* %87 to %struct.MV*
  %89 = getelementptr inbounds %struct.MV* %88, i32 0, i32 0
  store i16 %86, i16* %89, align 2
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @mvsad_err_cost(%union.int_mv* %mv, %union.int_mv* %ref, i32** %mvsadcost, i32 %error_per_bit) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %union.int_mv*, align 8
  %3 = alloca %union.int_mv*, align 8
  %4 = alloca i32**, align 8
  %5 = alloca i32, align 4
  store %union.int_mv* %mv, %union.int_mv** %2, align 8
  store %union.int_mv* %ref, %union.int_mv** %3, align 8
  store i32** %mvsadcost, i32*** %4, align 8
  store i32 %error_per_bit, i32* %5, align 4
  %6 = load i32*** %4, align 8
  %7 = icmp ne i32** %6, null
  br i1 %7, label %8, label %48

; <label>:8                                       ; preds = %0
  %9 = load %union.int_mv** %2, align 8
  %10 = bitcast %union.int_mv* %9 to %struct.MV*
  %11 = getelementptr inbounds %struct.MV* %10, i32 0, i32 0
  %12 = load i16* %11, align 2
  %13 = sext i16 %12 to i32
  %14 = load %union.int_mv** %3, align 8
  %15 = bitcast %union.int_mv* %14 to %struct.MV*
  %16 = getelementptr inbounds %struct.MV* %15, i32 0, i32 0
  %17 = load i16* %16, align 2
  %18 = sext i16 %17 to i32
  %19 = sub nsw i32 %13, %18
  %20 = sext i32 %19 to i64
  %21 = load i32*** %4, align 8
  %22 = getelementptr inbounds i32** %21, i64 0
  %23 = load i32** %22, align 8
  %24 = getelementptr inbounds i32* %23, i64 %20
  %25 = load i32* %24, align 4
  %26 = load %union.int_mv** %2, align 8
  %27 = bitcast %union.int_mv* %26 to %struct.MV*
  %28 = getelementptr inbounds %struct.MV* %27, i32 0, i32 1
  %29 = load i16* %28, align 2
  %30 = sext i16 %29 to i32
  %31 = load %union.int_mv** %3, align 8
  %32 = bitcast %union.int_mv* %31 to %struct.MV*
  %33 = getelementptr inbounds %struct.MV* %32, i32 0, i32 1
  %34 = load i16* %33, align 2
  %35 = sext i16 %34 to i32
  %36 = sub nsw i32 %30, %35
  %37 = sext i32 %36 to i64
  %38 = load i32*** %4, align 8
  %39 = getelementptr inbounds i32** %38, i64 1
  %40 = load i32** %39, align 8
  %41 = getelementptr inbounds i32* %40, i64 %37
  %42 = load i32* %41, align 4
  %43 = add nsw i32 %25, %42
  %44 = load i32* %5, align 4
  %45 = mul nsw i32 %43, %44
  %46 = add nsw i32 %45, 128
  %47 = ashr i32 %46, 8
  store i32 %47, i32* %1
  br label %49

; <label>:48                                      ; preds = %0
  store i32 0, i32* %1
  br label %49

; <label>:49                                      ; preds = %48, %8
  %50 = load i32* %1
  ret i32 %50
}

; Function Attrs: nounwind uwtable
define i32 @vp8_diamond_search_sad_c(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, %union.int_mv* %best_mv, i32 %search_param, i32 %sad_per_bit, i32* %num00, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca %struct.block*, align 8
  %3 = alloca %struct.blockd*, align 8
  %4 = alloca %union.int_mv*, align 8
  %5 = alloca %union.int_mv*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca %struct.variance_vtable*, align 8
  %10 = alloca i32**, align 8
  %11 = alloca %union.int_mv*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %step = alloca i32, align 4
  %what = alloca i8*, align 8
  %what_stride = alloca i32, align 4
  %in_what = alloca i8*, align 8
  %pre_stride = alloca i32, align 4
  %base_pre = alloca i8*, align 8
  %in_what_stride = alloca i32, align 4
  %best_address = alloca i8*, align 8
  %tot_steps = alloca i32, align 4
  %this_mv = alloca %union.int_mv, align 4
  %bestsad = alloca i32, align 4
  %thissad = alloca i32, align 4
  %best_site = alloca i32, align 4
  %last_site = alloca i32, align 4
  %ref_row = alloca i32, align 4
  %ref_col = alloca i32, align 4
  %this_row_offset = alloca i32, align 4
  %this_col_offset = alloca i32, align 4
  %ss = alloca %struct.search_site*, align 8
  %check_here = alloca i8*, align 8
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  store %struct.block* %b, %struct.block** %2, align 8
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  store %union.int_mv* %best_mv, %union.int_mv** %5, align 8
  store i32 %search_param, i32* %6, align 4
  store i32 %sad_per_bit, i32* %7, align 4
  store i32* %num00, i32** %8, align 8
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %9, align 8
  store i32** %mvcost, i32*** %10, align 8
  store %union.int_mv* %center_mv, %union.int_mv** %11, align 8
  %12 = load %struct.block** %2, align 8
  %13 = getelementptr inbounds %struct.block* %12, i32 0, i32 9
  %14 = load i8*** %13, align 8
  %15 = load i8** %14, align 8
  %16 = load %struct.block** %2, align 8
  %17 = getelementptr inbounds %struct.block* %16, i32 0, i32 10
  %18 = load i32* %17, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8* %15, i64 %19
  store i8* %20, i8** %what, align 8
  %21 = load %struct.block** %2, align 8
  %22 = getelementptr inbounds %struct.block* %21, i32 0, i32 11
  %23 = load i32* %22, align 4
  store i32 %23, i32* %what_stride, align 4
  %24 = load %struct.macroblock** %1, align 8
  %25 = getelementptr inbounds %struct.macroblock* %24, i32 0, i32 7
  %26 = getelementptr inbounds %struct.macroblockd* %25, i32 0, i32 11
  %27 = getelementptr inbounds %struct.yv12_buffer_config* %26, i32 0, i32 4
  %28 = load i32* %27, align 4
  store i32 %28, i32* %pre_stride, align 4
  %29 = load %struct.macroblock** %1, align 8
  %30 = getelementptr inbounds %struct.macroblock* %29, i32 0, i32 7
  %31 = getelementptr inbounds %struct.macroblockd* %30, i32 0, i32 11
  %32 = getelementptr inbounds %struct.yv12_buffer_config* %31, i32 0, i32 13
  %33 = load i8** %32, align 8
  store i8* %33, i8** %base_pre, align 8
  %34 = load i32* %pre_stride, align 4
  store i32 %34, i32* %in_what_stride, align 4
  store i32 0, i32* %best_site, align 4
  store i32 0, i32* %last_site, align 4
  %35 = load %struct.macroblock** %1, align 8
  %36 = getelementptr inbounds %struct.macroblock* %35, i32 0, i32 25
  %37 = getelementptr inbounds [2 x i32*]* %36, i32 0, i64 0
  %38 = load i32** %37, align 8
  %39 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %38, i32** %39, align 8
  %40 = load %struct.macroblock** %1, align 8
  %41 = getelementptr inbounds %struct.macroblock* %40, i32 0, i32 25
  %42 = getelementptr inbounds [2 x i32*]* %41, i32 0, i64 1
  %43 = load i32** %42, align 8
  %44 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %43, i32** %44, align 8
  %45 = load %union.int_mv** %11, align 8
  %46 = bitcast %union.int_mv* %45 to %struct.MV*
  %47 = getelementptr inbounds %struct.MV* %46, i32 0, i32 0
  %48 = load i16* %47, align 2
  %49 = sext i16 %48 to i32
  %50 = ashr i32 %49, 3
  %51 = trunc i32 %50 to i16
  %52 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %53 = getelementptr inbounds %struct.MV* %52, i32 0, i32 0
  store i16 %51, i16* %53, align 2
  %54 = load %union.int_mv** %11, align 8
  %55 = bitcast %union.int_mv* %54 to %struct.MV*
  %56 = getelementptr inbounds %struct.MV* %55, i32 0, i32 1
  %57 = load i16* %56, align 2
  %58 = sext i16 %57 to i32
  %59 = ashr i32 %58, 3
  %60 = trunc i32 %59 to i16
  %61 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %62 = getelementptr inbounds %struct.MV* %61, i32 0, i32 1
  store i16 %60, i16* %62, align 2
  %63 = load %union.int_mv** %4, align 8
  %64 = load %struct.macroblock** %1, align 8
  %65 = getelementptr inbounds %struct.macroblock* %64, i32 0, i32 31
  %66 = load i32* %65, align 4
  %67 = load %struct.macroblock** %1, align 8
  %68 = getelementptr inbounds %struct.macroblock* %67, i32 0, i32 32
  %69 = load i32* %68, align 4
  %70 = load %struct.macroblock** %1, align 8
  %71 = getelementptr inbounds %struct.macroblock* %70, i32 0, i32 33
  %72 = load i32* %71, align 4
  %73 = load %struct.macroblock** %1, align 8
  %74 = getelementptr inbounds %struct.macroblock* %73, i32 0, i32 34
  %75 = load i32* %74, align 4
  call void @vp8_clamp_mv(%union.int_mv* %63, i32 %66, i32 %69, i32 %72, i32 %75)
  %76 = load %union.int_mv** %4, align 8
  %77 = bitcast %union.int_mv* %76 to %struct.MV*
  %78 = getelementptr inbounds %struct.MV* %77, i32 0, i32 0
  %79 = load i16* %78, align 2
  %80 = sext i16 %79 to i32
  store i32 %80, i32* %ref_row, align 4
  %81 = load %union.int_mv** %4, align 8
  %82 = bitcast %union.int_mv* %81 to %struct.MV*
  %83 = getelementptr inbounds %struct.MV* %82, i32 0, i32 1
  %84 = load i16* %83, align 2
  %85 = sext i16 %84 to i32
  store i32 %85, i32* %ref_col, align 4
  %86 = load i32** %8, align 8
  store i32 0, i32* %86, align 4
  %87 = load i32* %ref_row, align 4
  %88 = trunc i32 %87 to i16
  %89 = load %union.int_mv** %5, align 8
  %90 = bitcast %union.int_mv* %89 to %struct.MV*
  %91 = getelementptr inbounds %struct.MV* %90, i32 0, i32 0
  store i16 %88, i16* %91, align 2
  %92 = load i32* %ref_col, align 4
  %93 = trunc i32 %92 to i16
  %94 = load %union.int_mv** %5, align 8
  %95 = bitcast %union.int_mv* %94 to %struct.MV*
  %96 = getelementptr inbounds %struct.MV* %95, i32 0, i32 1
  store i16 %93, i16* %96, align 2
  %97 = load i8** %base_pre, align 8
  %98 = load %struct.blockd** %3, align 8
  %99 = getelementptr inbounds %struct.blockd* %98, i32 0, i32 4
  %100 = load i32* %99, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8* %97, i64 %101
  %103 = load i32* %ref_row, align 4
  %104 = load i32* %pre_stride, align 4
  %105 = mul nsw i32 %103, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i8* %102, i64 %106
  %108 = load i32* %ref_col, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i8* %107, i64 %109
  store i8* %110, i8** %in_what, align 8
  %111 = load i8** %in_what, align 8
  store i8* %111, i8** %best_address, align 8
  %112 = load %struct.variance_vtable** %9, align 8
  %113 = getelementptr inbounds %struct.variance_vtable* %112, i32 0, i32 0
  %114 = load i32 (i8*, i32, i8*, i32, i32)** %113, align 8
  %115 = load i8** %what, align 8
  %116 = load i32* %what_stride, align 4
  %117 = load i8** %in_what, align 8
  %118 = load i32* %in_what_stride, align 4
  %119 = call i32 %114(i8* %115, i32 %116, i8* %117, i32 %118, i32 -1)
  %120 = load %union.int_mv** %5, align 8
  %121 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %122 = load i32* %7, align 4
  %123 = call i32 @mvsad_err_cost(%union.int_mv* %120, %union.int_mv* %fcenter_mv, i32** %121, i32 %122)
  %124 = add i32 %119, %123
  store i32 %124, i32* %bestsad, align 4
  %125 = load i32* %6, align 4
  %126 = load %struct.macroblock** %1, align 8
  %127 = getelementptr inbounds %struct.macroblock* %126, i32 0, i32 14
  %128 = load i32* %127, align 4
  %129 = mul nsw i32 %125, %128
  %130 = sext i32 %129 to i64
  %131 = load %struct.macroblock** %1, align 8
  %132 = getelementptr inbounds %struct.macroblock* %131, i32 0, i32 12
  %133 = load %struct.search_site** %132, align 8
  %134 = getelementptr inbounds %struct.search_site* %133, i64 %130
  store %struct.search_site* %134, %struct.search_site** %ss, align 8
  %135 = load %struct.macroblock** %1, align 8
  %136 = getelementptr inbounds %struct.macroblock* %135, i32 0, i32 13
  %137 = load i32* %136, align 4
  %138 = load %struct.macroblock** %1, align 8
  %139 = getelementptr inbounds %struct.macroblock* %138, i32 0, i32 14
  %140 = load i32* %139, align 4
  %141 = sdiv i32 %137, %140
  %142 = load i32* %6, align 4
  %143 = sub nsw i32 %141, %142
  store i32 %143, i32* %tot_steps, align 4
  store i32 1, i32* %i, align 4
  store i32 0, i32* %step, align 4
  br label %144

; <label>:144                                     ; preds = %312, %0
  %145 = load i32* %step, align 4
  %146 = load i32* %tot_steps, align 4
  %147 = icmp slt i32 %145, %146
  br i1 %147, label %148, label %315

; <label>:148                                     ; preds = %144
  store i32 0, i32* %j, align 4
  br label %149

; <label>:149                                     ; preds = %254, %148
  %150 = load i32* %j, align 4
  %151 = load %struct.macroblock** %1, align 8
  %152 = getelementptr inbounds %struct.macroblock* %151, i32 0, i32 14
  %153 = load i32* %152, align 4
  %154 = icmp slt i32 %150, %153
  br i1 %154, label %155, label %257

; <label>:155                                     ; preds = %149
  %156 = load %union.int_mv** %5, align 8
  %157 = bitcast %union.int_mv* %156 to %struct.MV*
  %158 = getelementptr inbounds %struct.MV* %157, i32 0, i32 0
  %159 = load i16* %158, align 2
  %160 = sext i16 %159 to i32
  %161 = load i32* %i, align 4
  %162 = sext i32 %161 to i64
  %163 = load %struct.search_site** %ss, align 8
  %164 = getelementptr inbounds %struct.search_site* %163, i64 %162
  %165 = getelementptr inbounds %struct.search_site* %164, i32 0, i32 0
  %166 = getelementptr inbounds %struct.MV* %165, i32 0, i32 0
  %167 = load i16* %166, align 2
  %168 = sext i16 %167 to i32
  %169 = add nsw i32 %160, %168
  store i32 %169, i32* %this_row_offset, align 4
  %170 = load %union.int_mv** %5, align 8
  %171 = bitcast %union.int_mv* %170 to %struct.MV*
  %172 = getelementptr inbounds %struct.MV* %171, i32 0, i32 1
  %173 = load i16* %172, align 2
  %174 = sext i16 %173 to i32
  %175 = load i32* %i, align 4
  %176 = sext i32 %175 to i64
  %177 = load %struct.search_site** %ss, align 8
  %178 = getelementptr inbounds %struct.search_site* %177, i64 %176
  %179 = getelementptr inbounds %struct.search_site* %178, i32 0, i32 0
  %180 = getelementptr inbounds %struct.MV* %179, i32 0, i32 1
  %181 = load i16* %180, align 2
  %182 = sext i16 %181 to i32
  %183 = add nsw i32 %174, %182
  store i32 %183, i32* %this_col_offset, align 4
  %184 = load i32* %this_col_offset, align 4
  %185 = load %struct.macroblock** %1, align 8
  %186 = getelementptr inbounds %struct.macroblock* %185, i32 0, i32 31
  %187 = load i32* %186, align 4
  %188 = icmp sgt i32 %184, %187
  br i1 %188, label %189, label %251

; <label>:189                                     ; preds = %155
  %190 = load i32* %this_col_offset, align 4
  %191 = load %struct.macroblock** %1, align 8
  %192 = getelementptr inbounds %struct.macroblock* %191, i32 0, i32 32
  %193 = load i32* %192, align 4
  %194 = icmp slt i32 %190, %193
  br i1 %194, label %195, label %251

; <label>:195                                     ; preds = %189
  %196 = load i32* %this_row_offset, align 4
  %197 = load %struct.macroblock** %1, align 8
  %198 = getelementptr inbounds %struct.macroblock* %197, i32 0, i32 33
  %199 = load i32* %198, align 4
  %200 = icmp sgt i32 %196, %199
  br i1 %200, label %201, label %251

; <label>:201                                     ; preds = %195
  %202 = load i32* %this_row_offset, align 4
  %203 = load %struct.macroblock** %1, align 8
  %204 = getelementptr inbounds %struct.macroblock* %203, i32 0, i32 34
  %205 = load i32* %204, align 4
  %206 = icmp slt i32 %202, %205
  br i1 %206, label %207, label %251

; <label>:207                                     ; preds = %201
  %208 = load i32* %i, align 4
  %209 = sext i32 %208 to i64
  %210 = load %struct.search_site** %ss, align 8
  %211 = getelementptr inbounds %struct.search_site* %210, i64 %209
  %212 = getelementptr inbounds %struct.search_site* %211, i32 0, i32 1
  %213 = load i32* %212, align 4
  %214 = load i8** %best_address, align 8
  %215 = sext i32 %213 to i64
  %216 = getelementptr inbounds i8* %214, i64 %215
  store i8* %216, i8** %check_here, align 8
  %217 = load %struct.variance_vtable** %9, align 8
  %218 = getelementptr inbounds %struct.variance_vtable* %217, i32 0, i32 0
  %219 = load i32 (i8*, i32, i8*, i32, i32)** %218, align 8
  %220 = load i8** %what, align 8
  %221 = load i32* %what_stride, align 4
  %222 = load i8** %check_here, align 8
  %223 = load i32* %in_what_stride, align 4
  %224 = load i32* %bestsad, align 4
  %225 = call i32 %219(i8* %220, i32 %221, i8* %222, i32 %223, i32 %224)
  store i32 %225, i32* %thissad, align 4
  %226 = load i32* %thissad, align 4
  %227 = load i32* %bestsad, align 4
  %228 = icmp ult i32 %226, %227
  br i1 %228, label %229, label %250

; <label>:229                                     ; preds = %207
  %230 = load i32* %this_row_offset, align 4
  %231 = trunc i32 %230 to i16
  %232 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %233 = getelementptr inbounds %struct.MV* %232, i32 0, i32 0
  store i16 %231, i16* %233, align 2
  %234 = load i32* %this_col_offset, align 4
  %235 = trunc i32 %234 to i16
  %236 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %237 = getelementptr inbounds %struct.MV* %236, i32 0, i32 1
  store i16 %235, i16* %237, align 2
  %238 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %239 = load i32* %7, align 4
  %240 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %238, i32 %239)
  %241 = load i32* %thissad, align 4
  %242 = add i32 %241, %240
  store i32 %242, i32* %thissad, align 4
  %243 = load i32* %thissad, align 4
  %244 = load i32* %bestsad, align 4
  %245 = icmp ult i32 %243, %244
  br i1 %245, label %246, label %249

; <label>:246                                     ; preds = %229
  %247 = load i32* %thissad, align 4
  store i32 %247, i32* %bestsad, align 4
  %248 = load i32* %i, align 4
  store i32 %248, i32* %best_site, align 4
  br label %249

; <label>:249                                     ; preds = %246, %229
  br label %250

; <label>:250                                     ; preds = %249, %207
  br label %251

; <label>:251                                     ; preds = %250, %201, %195, %189, %155
  %252 = load i32* %i, align 4
  %253 = add nsw i32 %252, 1
  store i32 %253, i32* %i, align 4
  br label %254

; <label>:254                                     ; preds = %251
  %255 = load i32* %j, align 4
  %256 = add nsw i32 %255, 1
  store i32 %256, i32* %j, align 4
  br label %149

; <label>:257                                     ; preds = %149
  %258 = load i32* %best_site, align 4
  %259 = load i32* %last_site, align 4
  %260 = icmp ne i32 %258, %259
  br i1 %260, label %261, label %302

; <label>:261                                     ; preds = %257
  %262 = load i32* %best_site, align 4
  %263 = sext i32 %262 to i64
  %264 = load %struct.search_site** %ss, align 8
  %265 = getelementptr inbounds %struct.search_site* %264, i64 %263
  %266 = getelementptr inbounds %struct.search_site* %265, i32 0, i32 0
  %267 = getelementptr inbounds %struct.MV* %266, i32 0, i32 0
  %268 = load i16* %267, align 2
  %269 = sext i16 %268 to i32
  %270 = load %union.int_mv** %5, align 8
  %271 = bitcast %union.int_mv* %270 to %struct.MV*
  %272 = getelementptr inbounds %struct.MV* %271, i32 0, i32 0
  %273 = load i16* %272, align 2
  %274 = sext i16 %273 to i32
  %275 = add nsw i32 %274, %269
  %276 = trunc i32 %275 to i16
  store i16 %276, i16* %272, align 2
  %277 = load i32* %best_site, align 4
  %278 = sext i32 %277 to i64
  %279 = load %struct.search_site** %ss, align 8
  %280 = getelementptr inbounds %struct.search_site* %279, i64 %278
  %281 = getelementptr inbounds %struct.search_site* %280, i32 0, i32 0
  %282 = getelementptr inbounds %struct.MV* %281, i32 0, i32 1
  %283 = load i16* %282, align 2
  %284 = sext i16 %283 to i32
  %285 = load %union.int_mv** %5, align 8
  %286 = bitcast %union.int_mv* %285 to %struct.MV*
  %287 = getelementptr inbounds %struct.MV* %286, i32 0, i32 1
  %288 = load i16* %287, align 2
  %289 = sext i16 %288 to i32
  %290 = add nsw i32 %289, %284
  %291 = trunc i32 %290 to i16
  store i16 %291, i16* %287, align 2
  %292 = load i32* %best_site, align 4
  %293 = sext i32 %292 to i64
  %294 = load %struct.search_site** %ss, align 8
  %295 = getelementptr inbounds %struct.search_site* %294, i64 %293
  %296 = getelementptr inbounds %struct.search_site* %295, i32 0, i32 1
  %297 = load i32* %296, align 4
  %298 = load i8** %best_address, align 8
  %299 = sext i32 %297 to i64
  %300 = getelementptr inbounds i8* %298, i64 %299
  store i8* %300, i8** %best_address, align 8
  %301 = load i32* %best_site, align 4
  store i32 %301, i32* %last_site, align 4
  br label %311

; <label>:302                                     ; preds = %257
  %303 = load i8** %best_address, align 8
  %304 = load i8** %in_what, align 8
  %305 = icmp eq i8* %303, %304
  br i1 %305, label %306, label %310

; <label>:306                                     ; preds = %302
  %307 = load i32** %8, align 8
  %308 = load i32* %307, align 4
  %309 = add nsw i32 %308, 1
  store i32 %309, i32* %307, align 4
  br label %310

; <label>:310                                     ; preds = %306, %302
  br label %311

; <label>:311                                     ; preds = %310, %261
  br label %312

; <label>:312                                     ; preds = %311
  %313 = load i32* %step, align 4
  %314 = add nsw i32 %313, 1
  store i32 %314, i32* %step, align 4
  br label %144

; <label>:315                                     ; preds = %144
  %316 = load %union.int_mv** %5, align 8
  %317 = bitcast %union.int_mv* %316 to %struct.MV*
  %318 = getelementptr inbounds %struct.MV* %317, i32 0, i32 0
  %319 = load i16* %318, align 2
  %320 = sext i16 %319 to i32
  %321 = shl i32 %320, 3
  %322 = trunc i32 %321 to i16
  %323 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %324 = getelementptr inbounds %struct.MV* %323, i32 0, i32 0
  store i16 %322, i16* %324, align 2
  %325 = load %union.int_mv** %5, align 8
  %326 = bitcast %union.int_mv* %325 to %struct.MV*
  %327 = getelementptr inbounds %struct.MV* %326, i32 0, i32 1
  %328 = load i16* %327, align 2
  %329 = sext i16 %328 to i32
  %330 = shl i32 %329, 3
  %331 = trunc i32 %330 to i16
  %332 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %333 = getelementptr inbounds %struct.MV* %332, i32 0, i32 1
  store i16 %331, i16* %333, align 2
  %334 = load %struct.variance_vtable** %9, align 8
  %335 = getelementptr inbounds %struct.variance_vtable* %334, i32 0, i32 1
  %336 = load i32 (i8*, i32, i8*, i32, i32*)** %335, align 8
  %337 = load i8** %what, align 8
  %338 = load i32* %what_stride, align 4
  %339 = load i8** %best_address, align 8
  %340 = load i32* %in_what_stride, align 4
  %341 = call i32 %336(i8* %337, i32 %338, i8* %339, i32 %340, i32* %thissad)
  %342 = load %union.int_mv** %11, align 8
  %343 = load i32*** %10, align 8
  %344 = load %struct.macroblock** %1, align 8
  %345 = getelementptr inbounds %struct.macroblock* %344, i32 0, i32 15
  %346 = load i32* %345, align 4
  %347 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %342, i32** %343, i32 %346)
  %348 = add i32 %341, %347
  ret i32 %348
}

; Function Attrs: nounwind uwtable
define i32 @vp8_diamond_search_sadx4(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, %union.int_mv* %best_mv, i32 %search_param, i32 %sad_per_bit, i32* %num00, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca %struct.block*, align 8
  %3 = alloca %struct.blockd*, align 8
  %4 = alloca %union.int_mv*, align 8
  %5 = alloca %union.int_mv*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca %struct.variance_vtable*, align 8
  %10 = alloca i32**, align 8
  %11 = alloca %union.int_mv*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %step = alloca i32, align 4
  %what = alloca i8*, align 8
  %what_stride = alloca i32, align 4
  %in_what = alloca i8*, align 8
  %pre_stride = alloca i32, align 4
  %base_pre = alloca i8*, align 8
  %in_what_stride = alloca i32, align 4
  %best_address = alloca i8*, align 8
  %tot_steps = alloca i32, align 4
  %this_mv = alloca %union.int_mv, align 4
  %bestsad = alloca i32, align 4
  %thissad = alloca i32, align 4
  %best_site = alloca i32, align 4
  %last_site = alloca i32, align 4
  %ref_row = alloca i32, align 4
  %ref_col = alloca i32, align 4
  %this_row_offset = alloca i32, align 4
  %this_col_offset = alloca i32, align 4
  %ss = alloca %struct.search_site*, align 8
  %check_here = alloca i8*, align 8
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %all_in = alloca i32, align 4
  %t = alloca i32, align 4
  %sad_array = alloca [4 x i32], align 16
  %block_offset = alloca [4 x i8*], align 16
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  store %struct.block* %b, %struct.block** %2, align 8
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  store %union.int_mv* %best_mv, %union.int_mv** %5, align 8
  store i32 %search_param, i32* %6, align 4
  store i32 %sad_per_bit, i32* %7, align 4
  store i32* %num00, i32** %8, align 8
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %9, align 8
  store i32** %mvcost, i32*** %10, align 8
  store %union.int_mv* %center_mv, %union.int_mv** %11, align 8
  %12 = load %struct.block** %2, align 8
  %13 = getelementptr inbounds %struct.block* %12, i32 0, i32 9
  %14 = load i8*** %13, align 8
  %15 = load i8** %14, align 8
  %16 = load %struct.block** %2, align 8
  %17 = getelementptr inbounds %struct.block* %16, i32 0, i32 10
  %18 = load i32* %17, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8* %15, i64 %19
  store i8* %20, i8** %what, align 8
  %21 = load %struct.block** %2, align 8
  %22 = getelementptr inbounds %struct.block* %21, i32 0, i32 11
  %23 = load i32* %22, align 4
  store i32 %23, i32* %what_stride, align 4
  %24 = load %struct.macroblock** %1, align 8
  %25 = getelementptr inbounds %struct.macroblock* %24, i32 0, i32 7
  %26 = getelementptr inbounds %struct.macroblockd* %25, i32 0, i32 11
  %27 = getelementptr inbounds %struct.yv12_buffer_config* %26, i32 0, i32 4
  %28 = load i32* %27, align 4
  store i32 %28, i32* %pre_stride, align 4
  %29 = load %struct.macroblock** %1, align 8
  %30 = getelementptr inbounds %struct.macroblock* %29, i32 0, i32 7
  %31 = getelementptr inbounds %struct.macroblockd* %30, i32 0, i32 11
  %32 = getelementptr inbounds %struct.yv12_buffer_config* %31, i32 0, i32 13
  %33 = load i8** %32, align 8
  store i8* %33, i8** %base_pre, align 8
  %34 = load i32* %pre_stride, align 4
  store i32 %34, i32* %in_what_stride, align 4
  store i32 0, i32* %best_site, align 4
  store i32 0, i32* %last_site, align 4
  %35 = load %struct.macroblock** %1, align 8
  %36 = getelementptr inbounds %struct.macroblock* %35, i32 0, i32 25
  %37 = getelementptr inbounds [2 x i32*]* %36, i32 0, i64 0
  %38 = load i32** %37, align 8
  %39 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %38, i32** %39, align 8
  %40 = load %struct.macroblock** %1, align 8
  %41 = getelementptr inbounds %struct.macroblock* %40, i32 0, i32 25
  %42 = getelementptr inbounds [2 x i32*]* %41, i32 0, i64 1
  %43 = load i32** %42, align 8
  %44 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %43, i32** %44, align 8
  %45 = load %union.int_mv** %11, align 8
  %46 = bitcast %union.int_mv* %45 to %struct.MV*
  %47 = getelementptr inbounds %struct.MV* %46, i32 0, i32 0
  %48 = load i16* %47, align 2
  %49 = sext i16 %48 to i32
  %50 = ashr i32 %49, 3
  %51 = trunc i32 %50 to i16
  %52 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %53 = getelementptr inbounds %struct.MV* %52, i32 0, i32 0
  store i16 %51, i16* %53, align 2
  %54 = load %union.int_mv** %11, align 8
  %55 = bitcast %union.int_mv* %54 to %struct.MV*
  %56 = getelementptr inbounds %struct.MV* %55, i32 0, i32 1
  %57 = load i16* %56, align 2
  %58 = sext i16 %57 to i32
  %59 = ashr i32 %58, 3
  %60 = trunc i32 %59 to i16
  %61 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %62 = getelementptr inbounds %struct.MV* %61, i32 0, i32 1
  store i16 %60, i16* %62, align 2
  %63 = load %union.int_mv** %4, align 8
  %64 = load %struct.macroblock** %1, align 8
  %65 = getelementptr inbounds %struct.macroblock* %64, i32 0, i32 31
  %66 = load i32* %65, align 4
  %67 = load %struct.macroblock** %1, align 8
  %68 = getelementptr inbounds %struct.macroblock* %67, i32 0, i32 32
  %69 = load i32* %68, align 4
  %70 = load %struct.macroblock** %1, align 8
  %71 = getelementptr inbounds %struct.macroblock* %70, i32 0, i32 33
  %72 = load i32* %71, align 4
  %73 = load %struct.macroblock** %1, align 8
  %74 = getelementptr inbounds %struct.macroblock* %73, i32 0, i32 34
  %75 = load i32* %74, align 4
  call void @vp8_clamp_mv(%union.int_mv* %63, i32 %66, i32 %69, i32 %72, i32 %75)
  %76 = load %union.int_mv** %4, align 8
  %77 = bitcast %union.int_mv* %76 to %struct.MV*
  %78 = getelementptr inbounds %struct.MV* %77, i32 0, i32 0
  %79 = load i16* %78, align 2
  %80 = sext i16 %79 to i32
  store i32 %80, i32* %ref_row, align 4
  %81 = load %union.int_mv** %4, align 8
  %82 = bitcast %union.int_mv* %81 to %struct.MV*
  %83 = getelementptr inbounds %struct.MV* %82, i32 0, i32 1
  %84 = load i16* %83, align 2
  %85 = sext i16 %84 to i32
  store i32 %85, i32* %ref_col, align 4
  %86 = load i32** %8, align 8
  store i32 0, i32* %86, align 4
  %87 = load i32* %ref_row, align 4
  %88 = trunc i32 %87 to i16
  %89 = load %union.int_mv** %5, align 8
  %90 = bitcast %union.int_mv* %89 to %struct.MV*
  %91 = getelementptr inbounds %struct.MV* %90, i32 0, i32 0
  store i16 %88, i16* %91, align 2
  %92 = load i32* %ref_col, align 4
  %93 = trunc i32 %92 to i16
  %94 = load %union.int_mv** %5, align 8
  %95 = bitcast %union.int_mv* %94 to %struct.MV*
  %96 = getelementptr inbounds %struct.MV* %95, i32 0, i32 1
  store i16 %93, i16* %96, align 2
  %97 = load i8** %base_pre, align 8
  %98 = load %struct.blockd** %3, align 8
  %99 = getelementptr inbounds %struct.blockd* %98, i32 0, i32 4
  %100 = load i32* %99, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8* %97, i64 %101
  %103 = load i32* %ref_row, align 4
  %104 = load i32* %pre_stride, align 4
  %105 = mul nsw i32 %103, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i8* %102, i64 %106
  %108 = load i32* %ref_col, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i8* %107, i64 %109
  store i8* %110, i8** %in_what, align 8
  %111 = load i8** %in_what, align 8
  store i8* %111, i8** %best_address, align 8
  %112 = load %struct.variance_vtable** %9, align 8
  %113 = getelementptr inbounds %struct.variance_vtable* %112, i32 0, i32 0
  %114 = load i32 (i8*, i32, i8*, i32, i32)** %113, align 8
  %115 = load i8** %what, align 8
  %116 = load i32* %what_stride, align 4
  %117 = load i8** %in_what, align 8
  %118 = load i32* %in_what_stride, align 4
  %119 = call i32 %114(i8* %115, i32 %116, i8* %117, i32 %118, i32 -1)
  %120 = load %union.int_mv** %5, align 8
  %121 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %122 = load i32* %7, align 4
  %123 = call i32 @mvsad_err_cost(%union.int_mv* %120, %union.int_mv* %fcenter_mv, i32** %121, i32 %122)
  %124 = add i32 %119, %123
  store i32 %124, i32* %bestsad, align 4
  %125 = load i32* %6, align 4
  %126 = load %struct.macroblock** %1, align 8
  %127 = getelementptr inbounds %struct.macroblock* %126, i32 0, i32 14
  %128 = load i32* %127, align 4
  %129 = mul nsw i32 %125, %128
  %130 = sext i32 %129 to i64
  %131 = load %struct.macroblock** %1, align 8
  %132 = getelementptr inbounds %struct.macroblock* %131, i32 0, i32 12
  %133 = load %struct.search_site** %132, align 8
  %134 = getelementptr inbounds %struct.search_site* %133, i64 %130
  store %struct.search_site* %134, %struct.search_site** %ss, align 8
  %135 = load %struct.macroblock** %1, align 8
  %136 = getelementptr inbounds %struct.macroblock* %135, i32 0, i32 13
  %137 = load i32* %136, align 4
  %138 = load %struct.macroblock** %1, align 8
  %139 = getelementptr inbounds %struct.macroblock* %138, i32 0, i32 14
  %140 = load i32* %139, align 4
  %141 = sdiv i32 %137, %140
  %142 = load i32* %6, align 4
  %143 = sub nsw i32 %141, %142
  store i32 %143, i32* %tot_steps, align 4
  store i32 1, i32* %i, align 4
  store i32 0, i32* %step, align 4
  br label %144

; <label>:144                                     ; preds = %518, %0
  %145 = load i32* %step, align 4
  %146 = load i32* %tot_steps, align 4
  %147 = icmp slt i32 %145, %146
  br i1 %147, label %148, label %521

; <label>:148                                     ; preds = %144
  store i32 1, i32* %all_in, align 4
  %149 = load %union.int_mv** %5, align 8
  %150 = bitcast %union.int_mv* %149 to %struct.MV*
  %151 = getelementptr inbounds %struct.MV* %150, i32 0, i32 0
  %152 = load i16* %151, align 2
  %153 = sext i16 %152 to i32
  %154 = load i32* %i, align 4
  %155 = sext i32 %154 to i64
  %156 = load %struct.search_site** %ss, align 8
  %157 = getelementptr inbounds %struct.search_site* %156, i64 %155
  %158 = getelementptr inbounds %struct.search_site* %157, i32 0, i32 0
  %159 = getelementptr inbounds %struct.MV* %158, i32 0, i32 0
  %160 = load i16* %159, align 2
  %161 = sext i16 %160 to i32
  %162 = add nsw i32 %153, %161
  %163 = load %struct.macroblock** %1, align 8
  %164 = getelementptr inbounds %struct.macroblock* %163, i32 0, i32 33
  %165 = load i32* %164, align 4
  %166 = icmp sgt i32 %162, %165
  %167 = zext i1 %166 to i32
  %168 = load i32* %all_in, align 4
  %169 = and i32 %168, %167
  store i32 %169, i32* %all_in, align 4
  %170 = load %union.int_mv** %5, align 8
  %171 = bitcast %union.int_mv* %170 to %struct.MV*
  %172 = getelementptr inbounds %struct.MV* %171, i32 0, i32 0
  %173 = load i16* %172, align 2
  %174 = sext i16 %173 to i32
  %175 = load i32* %i, align 4
  %176 = add nsw i32 %175, 1
  %177 = sext i32 %176 to i64
  %178 = load %struct.search_site** %ss, align 8
  %179 = getelementptr inbounds %struct.search_site* %178, i64 %177
  %180 = getelementptr inbounds %struct.search_site* %179, i32 0, i32 0
  %181 = getelementptr inbounds %struct.MV* %180, i32 0, i32 0
  %182 = load i16* %181, align 2
  %183 = sext i16 %182 to i32
  %184 = add nsw i32 %174, %183
  %185 = load %struct.macroblock** %1, align 8
  %186 = getelementptr inbounds %struct.macroblock* %185, i32 0, i32 34
  %187 = load i32* %186, align 4
  %188 = icmp slt i32 %184, %187
  %189 = zext i1 %188 to i32
  %190 = load i32* %all_in, align 4
  %191 = and i32 %190, %189
  store i32 %191, i32* %all_in, align 4
  %192 = load %union.int_mv** %5, align 8
  %193 = bitcast %union.int_mv* %192 to %struct.MV*
  %194 = getelementptr inbounds %struct.MV* %193, i32 0, i32 1
  %195 = load i16* %194, align 2
  %196 = sext i16 %195 to i32
  %197 = load i32* %i, align 4
  %198 = add nsw i32 %197, 2
  %199 = sext i32 %198 to i64
  %200 = load %struct.search_site** %ss, align 8
  %201 = getelementptr inbounds %struct.search_site* %200, i64 %199
  %202 = getelementptr inbounds %struct.search_site* %201, i32 0, i32 0
  %203 = getelementptr inbounds %struct.MV* %202, i32 0, i32 1
  %204 = load i16* %203, align 2
  %205 = sext i16 %204 to i32
  %206 = add nsw i32 %196, %205
  %207 = load %struct.macroblock** %1, align 8
  %208 = getelementptr inbounds %struct.macroblock* %207, i32 0, i32 31
  %209 = load i32* %208, align 4
  %210 = icmp sgt i32 %206, %209
  %211 = zext i1 %210 to i32
  %212 = load i32* %all_in, align 4
  %213 = and i32 %212, %211
  store i32 %213, i32* %all_in, align 4
  %214 = load %union.int_mv** %5, align 8
  %215 = bitcast %union.int_mv* %214 to %struct.MV*
  %216 = getelementptr inbounds %struct.MV* %215, i32 0, i32 1
  %217 = load i16* %216, align 2
  %218 = sext i16 %217 to i32
  %219 = load i32* %i, align 4
  %220 = add nsw i32 %219, 3
  %221 = sext i32 %220 to i64
  %222 = load %struct.search_site** %ss, align 8
  %223 = getelementptr inbounds %struct.search_site* %222, i64 %221
  %224 = getelementptr inbounds %struct.search_site* %223, i32 0, i32 0
  %225 = getelementptr inbounds %struct.MV* %224, i32 0, i32 1
  %226 = load i16* %225, align 2
  %227 = sext i16 %226 to i32
  %228 = add nsw i32 %218, %227
  %229 = load %struct.macroblock** %1, align 8
  %230 = getelementptr inbounds %struct.macroblock* %229, i32 0, i32 32
  %231 = load i32* %230, align 4
  %232 = icmp slt i32 %228, %231
  %233 = zext i1 %232 to i32
  %234 = load i32* %all_in, align 4
  %235 = and i32 %234, %233
  store i32 %235, i32* %all_in, align 4
  %236 = load i32* %all_in, align 4
  %237 = icmp ne i32 %236, 0
  br i1 %237, label %238, label %353

; <label>:238                                     ; preds = %148
  store i32 0, i32* %j, align 4
  br label %239

; <label>:239                                     ; preds = %349, %238
  %240 = load i32* %j, align 4
  %241 = load %struct.macroblock** %1, align 8
  %242 = getelementptr inbounds %struct.macroblock* %241, i32 0, i32 14
  %243 = load i32* %242, align 4
  %244 = icmp slt i32 %240, %243
  br i1 %244, label %245, label %352

; <label>:245                                     ; preds = %239
  store i32 0, i32* %t, align 4
  br label %246

; <label>:246                                     ; preds = %264, %245
  %247 = load i32* %t, align 4
  %248 = icmp slt i32 %247, 4
  br i1 %248, label %249, label %267

; <label>:249                                     ; preds = %246
  %250 = load i32* %i, align 4
  %251 = load i32* %t, align 4
  %252 = add nsw i32 %250, %251
  %253 = sext i32 %252 to i64
  %254 = load %struct.search_site** %ss, align 8
  %255 = getelementptr inbounds %struct.search_site* %254, i64 %253
  %256 = getelementptr inbounds %struct.search_site* %255, i32 0, i32 1
  %257 = load i32* %256, align 4
  %258 = load i8** %best_address, align 8
  %259 = sext i32 %257 to i64
  %260 = getelementptr inbounds i8* %258, i64 %259
  %261 = load i32* %t, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 %262
  store i8* %260, i8** %263, align 8
  br label %264

; <label>:264                                     ; preds = %249
  %265 = load i32* %t, align 4
  %266 = add nsw i32 %265, 1
  store i32 %266, i32* %t, align 4
  br label %246

; <label>:267                                     ; preds = %246
  %268 = load %struct.variance_vtable** %9, align 8
  %269 = getelementptr inbounds %struct.variance_vtable* %268, i32 0, i32 8
  %270 = load void (i8*, i32, i8**, i32, i32*)** %269, align 8
  %271 = load i8** %what, align 8
  %272 = load i32* %what_stride, align 4
  %273 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i32 0
  %274 = load i32* %in_what_stride, align 4
  %275 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i32 0
  call void %270(i8* %271, i32 %272, i8** %273, i32 %274, i32* %275)
  store i32 0, i32* %t, align 4
  br label %276

; <label>:276                                     ; preds = %343, %267
  %277 = load i32* %t, align 4
  %278 = icmp slt i32 %277, 4
  br i1 %278, label %279, label %348

; <label>:279                                     ; preds = %276
  %280 = load i32* %t, align 4
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %281
  %283 = load i32* %282, align 4
  %284 = load i32* %bestsad, align 4
  %285 = icmp ult i32 %283, %284
  br i1 %285, label %286, label %342

; <label>:286                                     ; preds = %279
  %287 = load %union.int_mv** %5, align 8
  %288 = bitcast %union.int_mv* %287 to %struct.MV*
  %289 = getelementptr inbounds %struct.MV* %288, i32 0, i32 0
  %290 = load i16* %289, align 2
  %291 = sext i16 %290 to i32
  %292 = load i32* %i, align 4
  %293 = sext i32 %292 to i64
  %294 = load %struct.search_site** %ss, align 8
  %295 = getelementptr inbounds %struct.search_site* %294, i64 %293
  %296 = getelementptr inbounds %struct.search_site* %295, i32 0, i32 0
  %297 = getelementptr inbounds %struct.MV* %296, i32 0, i32 0
  %298 = load i16* %297, align 2
  %299 = sext i16 %298 to i32
  %300 = add nsw i32 %291, %299
  %301 = trunc i32 %300 to i16
  %302 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %303 = getelementptr inbounds %struct.MV* %302, i32 0, i32 0
  store i16 %301, i16* %303, align 2
  %304 = load %union.int_mv** %5, align 8
  %305 = bitcast %union.int_mv* %304 to %struct.MV*
  %306 = getelementptr inbounds %struct.MV* %305, i32 0, i32 1
  %307 = load i16* %306, align 2
  %308 = sext i16 %307 to i32
  %309 = load i32* %i, align 4
  %310 = sext i32 %309 to i64
  %311 = load %struct.search_site** %ss, align 8
  %312 = getelementptr inbounds %struct.search_site* %311, i64 %310
  %313 = getelementptr inbounds %struct.search_site* %312, i32 0, i32 0
  %314 = getelementptr inbounds %struct.MV* %313, i32 0, i32 1
  %315 = load i16* %314, align 2
  %316 = sext i16 %315 to i32
  %317 = add nsw i32 %308, %316
  %318 = trunc i32 %317 to i16
  %319 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %320 = getelementptr inbounds %struct.MV* %319, i32 0, i32 1
  store i16 %318, i16* %320, align 2
  %321 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %322 = load i32* %7, align 4
  %323 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %321, i32 %322)
  %324 = load i32* %t, align 4
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %325
  %327 = load i32* %326, align 4
  %328 = add i32 %327, %323
  store i32 %328, i32* %326, align 4
  %329 = load i32* %t, align 4
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %330
  %332 = load i32* %331, align 4
  %333 = load i32* %bestsad, align 4
  %334 = icmp ult i32 %332, %333
  br i1 %334, label %335, label %341

; <label>:335                                     ; preds = %286
  %336 = load i32* %t, align 4
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %337
  %339 = load i32* %338, align 4
  store i32 %339, i32* %bestsad, align 4
  %340 = load i32* %i, align 4
  store i32 %340, i32* %best_site, align 4
  br label %341

; <label>:341                                     ; preds = %335, %286
  br label %342

; <label>:342                                     ; preds = %341, %279
  br label %343

; <label>:343                                     ; preds = %342
  %344 = load i32* %t, align 4
  %345 = add nsw i32 %344, 1
  store i32 %345, i32* %t, align 4
  %346 = load i32* %i, align 4
  %347 = add nsw i32 %346, 1
  store i32 %347, i32* %i, align 4
  br label %276

; <label>:348                                     ; preds = %276
  br label %349

; <label>:349                                     ; preds = %348
  %350 = load i32* %j, align 4
  %351 = add nsw i32 %350, 4
  store i32 %351, i32* %j, align 4
  br label %239

; <label>:352                                     ; preds = %239
  br label %463

; <label>:353                                     ; preds = %148
  store i32 0, i32* %j, align 4
  br label %354

; <label>:354                                     ; preds = %459, %353
  %355 = load i32* %j, align 4
  %356 = load %struct.macroblock** %1, align 8
  %357 = getelementptr inbounds %struct.macroblock* %356, i32 0, i32 14
  %358 = load i32* %357, align 4
  %359 = icmp slt i32 %355, %358
  br i1 %359, label %360, label %462

; <label>:360                                     ; preds = %354
  %361 = load %union.int_mv** %5, align 8
  %362 = bitcast %union.int_mv* %361 to %struct.MV*
  %363 = getelementptr inbounds %struct.MV* %362, i32 0, i32 0
  %364 = load i16* %363, align 2
  %365 = sext i16 %364 to i32
  %366 = load i32* %i, align 4
  %367 = sext i32 %366 to i64
  %368 = load %struct.search_site** %ss, align 8
  %369 = getelementptr inbounds %struct.search_site* %368, i64 %367
  %370 = getelementptr inbounds %struct.search_site* %369, i32 0, i32 0
  %371 = getelementptr inbounds %struct.MV* %370, i32 0, i32 0
  %372 = load i16* %371, align 2
  %373 = sext i16 %372 to i32
  %374 = add nsw i32 %365, %373
  store i32 %374, i32* %this_row_offset, align 4
  %375 = load %union.int_mv** %5, align 8
  %376 = bitcast %union.int_mv* %375 to %struct.MV*
  %377 = getelementptr inbounds %struct.MV* %376, i32 0, i32 1
  %378 = load i16* %377, align 2
  %379 = sext i16 %378 to i32
  %380 = load i32* %i, align 4
  %381 = sext i32 %380 to i64
  %382 = load %struct.search_site** %ss, align 8
  %383 = getelementptr inbounds %struct.search_site* %382, i64 %381
  %384 = getelementptr inbounds %struct.search_site* %383, i32 0, i32 0
  %385 = getelementptr inbounds %struct.MV* %384, i32 0, i32 1
  %386 = load i16* %385, align 2
  %387 = sext i16 %386 to i32
  %388 = add nsw i32 %379, %387
  store i32 %388, i32* %this_col_offset, align 4
  %389 = load i32* %this_col_offset, align 4
  %390 = load %struct.macroblock** %1, align 8
  %391 = getelementptr inbounds %struct.macroblock* %390, i32 0, i32 31
  %392 = load i32* %391, align 4
  %393 = icmp sgt i32 %389, %392
  br i1 %393, label %394, label %456

; <label>:394                                     ; preds = %360
  %395 = load i32* %this_col_offset, align 4
  %396 = load %struct.macroblock** %1, align 8
  %397 = getelementptr inbounds %struct.macroblock* %396, i32 0, i32 32
  %398 = load i32* %397, align 4
  %399 = icmp slt i32 %395, %398
  br i1 %399, label %400, label %456

; <label>:400                                     ; preds = %394
  %401 = load i32* %this_row_offset, align 4
  %402 = load %struct.macroblock** %1, align 8
  %403 = getelementptr inbounds %struct.macroblock* %402, i32 0, i32 33
  %404 = load i32* %403, align 4
  %405 = icmp sgt i32 %401, %404
  br i1 %405, label %406, label %456

; <label>:406                                     ; preds = %400
  %407 = load i32* %this_row_offset, align 4
  %408 = load %struct.macroblock** %1, align 8
  %409 = getelementptr inbounds %struct.macroblock* %408, i32 0, i32 34
  %410 = load i32* %409, align 4
  %411 = icmp slt i32 %407, %410
  br i1 %411, label %412, label %456

; <label>:412                                     ; preds = %406
  %413 = load i32* %i, align 4
  %414 = sext i32 %413 to i64
  %415 = load %struct.search_site** %ss, align 8
  %416 = getelementptr inbounds %struct.search_site* %415, i64 %414
  %417 = getelementptr inbounds %struct.search_site* %416, i32 0, i32 1
  %418 = load i32* %417, align 4
  %419 = load i8** %best_address, align 8
  %420 = sext i32 %418 to i64
  %421 = getelementptr inbounds i8* %419, i64 %420
  store i8* %421, i8** %check_here, align 8
  %422 = load %struct.variance_vtable** %9, align 8
  %423 = getelementptr inbounds %struct.variance_vtable* %422, i32 0, i32 0
  %424 = load i32 (i8*, i32, i8*, i32, i32)** %423, align 8
  %425 = load i8** %what, align 8
  %426 = load i32* %what_stride, align 4
  %427 = load i8** %check_here, align 8
  %428 = load i32* %in_what_stride, align 4
  %429 = load i32* %bestsad, align 4
  %430 = call i32 %424(i8* %425, i32 %426, i8* %427, i32 %428, i32 %429)
  store i32 %430, i32* %thissad, align 4
  %431 = load i32* %thissad, align 4
  %432 = load i32* %bestsad, align 4
  %433 = icmp ult i32 %431, %432
  br i1 %433, label %434, label %455

; <label>:434                                     ; preds = %412
  %435 = load i32* %this_row_offset, align 4
  %436 = trunc i32 %435 to i16
  %437 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %438 = getelementptr inbounds %struct.MV* %437, i32 0, i32 0
  store i16 %436, i16* %438, align 2
  %439 = load i32* %this_col_offset, align 4
  %440 = trunc i32 %439 to i16
  %441 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %442 = getelementptr inbounds %struct.MV* %441, i32 0, i32 1
  store i16 %440, i16* %442, align 2
  %443 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %444 = load i32* %7, align 4
  %445 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %443, i32 %444)
  %446 = load i32* %thissad, align 4
  %447 = add i32 %446, %445
  store i32 %447, i32* %thissad, align 4
  %448 = load i32* %thissad, align 4
  %449 = load i32* %bestsad, align 4
  %450 = icmp ult i32 %448, %449
  br i1 %450, label %451, label %454

; <label>:451                                     ; preds = %434
  %452 = load i32* %thissad, align 4
  store i32 %452, i32* %bestsad, align 4
  %453 = load i32* %i, align 4
  store i32 %453, i32* %best_site, align 4
  br label %454

; <label>:454                                     ; preds = %451, %434
  br label %455

; <label>:455                                     ; preds = %454, %412
  br label %456

; <label>:456                                     ; preds = %455, %406, %400, %394, %360
  %457 = load i32* %i, align 4
  %458 = add nsw i32 %457, 1
  store i32 %458, i32* %i, align 4
  br label %459

; <label>:459                                     ; preds = %456
  %460 = load i32* %j, align 4
  %461 = add nsw i32 %460, 1
  store i32 %461, i32* %j, align 4
  br label %354

; <label>:462                                     ; preds = %354
  br label %463

; <label>:463                                     ; preds = %462, %352
  %464 = load i32* %best_site, align 4
  %465 = load i32* %last_site, align 4
  %466 = icmp ne i32 %464, %465
  br i1 %466, label %467, label %508

; <label>:467                                     ; preds = %463
  %468 = load i32* %best_site, align 4
  %469 = sext i32 %468 to i64
  %470 = load %struct.search_site** %ss, align 8
  %471 = getelementptr inbounds %struct.search_site* %470, i64 %469
  %472 = getelementptr inbounds %struct.search_site* %471, i32 0, i32 0
  %473 = getelementptr inbounds %struct.MV* %472, i32 0, i32 0
  %474 = load i16* %473, align 2
  %475 = sext i16 %474 to i32
  %476 = load %union.int_mv** %5, align 8
  %477 = bitcast %union.int_mv* %476 to %struct.MV*
  %478 = getelementptr inbounds %struct.MV* %477, i32 0, i32 0
  %479 = load i16* %478, align 2
  %480 = sext i16 %479 to i32
  %481 = add nsw i32 %480, %475
  %482 = trunc i32 %481 to i16
  store i16 %482, i16* %478, align 2
  %483 = load i32* %best_site, align 4
  %484 = sext i32 %483 to i64
  %485 = load %struct.search_site** %ss, align 8
  %486 = getelementptr inbounds %struct.search_site* %485, i64 %484
  %487 = getelementptr inbounds %struct.search_site* %486, i32 0, i32 0
  %488 = getelementptr inbounds %struct.MV* %487, i32 0, i32 1
  %489 = load i16* %488, align 2
  %490 = sext i16 %489 to i32
  %491 = load %union.int_mv** %5, align 8
  %492 = bitcast %union.int_mv* %491 to %struct.MV*
  %493 = getelementptr inbounds %struct.MV* %492, i32 0, i32 1
  %494 = load i16* %493, align 2
  %495 = sext i16 %494 to i32
  %496 = add nsw i32 %495, %490
  %497 = trunc i32 %496 to i16
  store i16 %497, i16* %493, align 2
  %498 = load i32* %best_site, align 4
  %499 = sext i32 %498 to i64
  %500 = load %struct.search_site** %ss, align 8
  %501 = getelementptr inbounds %struct.search_site* %500, i64 %499
  %502 = getelementptr inbounds %struct.search_site* %501, i32 0, i32 1
  %503 = load i32* %502, align 4
  %504 = load i8** %best_address, align 8
  %505 = sext i32 %503 to i64
  %506 = getelementptr inbounds i8* %504, i64 %505
  store i8* %506, i8** %best_address, align 8
  %507 = load i32* %best_site, align 4
  store i32 %507, i32* %last_site, align 4
  br label %517

; <label>:508                                     ; preds = %463
  %509 = load i8** %best_address, align 8
  %510 = load i8** %in_what, align 8
  %511 = icmp eq i8* %509, %510
  br i1 %511, label %512, label %516

; <label>:512                                     ; preds = %508
  %513 = load i32** %8, align 8
  %514 = load i32* %513, align 4
  %515 = add nsw i32 %514, 1
  store i32 %515, i32* %513, align 4
  br label %516

; <label>:516                                     ; preds = %512, %508
  br label %517

; <label>:517                                     ; preds = %516, %467
  br label %518

; <label>:518                                     ; preds = %517
  %519 = load i32* %step, align 4
  %520 = add nsw i32 %519, 1
  store i32 %520, i32* %step, align 4
  br label %144

; <label>:521                                     ; preds = %144
  %522 = load %union.int_mv** %5, align 8
  %523 = bitcast %union.int_mv* %522 to %struct.MV*
  %524 = getelementptr inbounds %struct.MV* %523, i32 0, i32 0
  %525 = load i16* %524, align 2
  %526 = sext i16 %525 to i32
  %527 = mul nsw i32 %526, 8
  %528 = trunc i32 %527 to i16
  %529 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %530 = getelementptr inbounds %struct.MV* %529, i32 0, i32 0
  store i16 %528, i16* %530, align 2
  %531 = load %union.int_mv** %5, align 8
  %532 = bitcast %union.int_mv* %531 to %struct.MV*
  %533 = getelementptr inbounds %struct.MV* %532, i32 0, i32 1
  %534 = load i16* %533, align 2
  %535 = sext i16 %534 to i32
  %536 = mul nsw i32 %535, 8
  %537 = trunc i32 %536 to i16
  %538 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %539 = getelementptr inbounds %struct.MV* %538, i32 0, i32 1
  store i16 %537, i16* %539, align 2
  %540 = load %struct.variance_vtable** %9, align 8
  %541 = getelementptr inbounds %struct.variance_vtable* %540, i32 0, i32 1
  %542 = load i32 (i8*, i32, i8*, i32, i32*)** %541, align 8
  %543 = load i8** %what, align 8
  %544 = load i32* %what_stride, align 4
  %545 = load i8** %best_address, align 8
  %546 = load i32* %in_what_stride, align 4
  %547 = call i32 %542(i8* %543, i32 %544, i8* %545, i32 %546, i32* %thissad)
  %548 = load %union.int_mv** %11, align 8
  %549 = load i32*** %10, align 8
  %550 = load %struct.macroblock** %1, align 8
  %551 = getelementptr inbounds %struct.macroblock* %550, i32 0, i32 15
  %552 = load i32* %551, align 4
  %553 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %548, i32** %549, i32 %552)
  %554 = add i32 %547, %553
  ret i32 %554
}

; Function Attrs: nounwind uwtable
define i32 @vp8_full_search_sad_c(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %sad_per_bit, i32 %distance, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca %struct.block*, align 8
  %3 = alloca %struct.blockd*, align 8
  %4 = alloca %union.int_mv*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.variance_vtable*, align 8
  %8 = alloca i32**, align 8
  %9 = alloca %union.int_mv*, align 8
  %what = alloca i8*, align 8
  %what_stride = alloca i32, align 4
  %in_what = alloca i8*, align 8
  %pre_stride = alloca i32, align 4
  %base_pre = alloca i8*, align 8
  %in_what_stride = alloca i32, align 4
  %mv_stride = alloca i32, align 4
  %bestaddress = alloca i8*, align 8
  %best_mv = alloca %union.int_mv*, align 8
  %this_mv = alloca %union.int_mv, align 4
  %bestsad = alloca i32, align 4
  %thissad = alloca i32, align 4
  %r = alloca i32, align 4
  %c = alloca i32, align 4
  %check_here = alloca i8*, align 8
  %ref_row = alloca i32, align 4
  %ref_col = alloca i32, align 4
  %row_min = alloca i32, align 4
  %row_max = alloca i32, align 4
  %col_min = alloca i32, align 4
  %col_max = alloca i32, align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  store %struct.block* %b, %struct.block** %2, align 8
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  store i32 %sad_per_bit, i32* %5, align 4
  store i32 %distance, i32* %6, align 4
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %7, align 8
  store i32** %mvcost, i32*** %8, align 8
  store %union.int_mv* %center_mv, %union.int_mv** %9, align 8
  %10 = load %struct.block** %2, align 8
  %11 = getelementptr inbounds %struct.block* %10, i32 0, i32 9
  %12 = load i8*** %11, align 8
  %13 = load i8** %12, align 8
  %14 = load %struct.block** %2, align 8
  %15 = getelementptr inbounds %struct.block* %14, i32 0, i32 10
  %16 = load i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8* %13, i64 %17
  store i8* %18, i8** %what, align 8
  %19 = load %struct.block** %2, align 8
  %20 = getelementptr inbounds %struct.block* %19, i32 0, i32 11
  %21 = load i32* %20, align 4
  store i32 %21, i32* %what_stride, align 4
  %22 = load %struct.macroblock** %1, align 8
  %23 = getelementptr inbounds %struct.macroblock* %22, i32 0, i32 7
  %24 = getelementptr inbounds %struct.macroblockd* %23, i32 0, i32 11
  %25 = getelementptr inbounds %struct.yv12_buffer_config* %24, i32 0, i32 4
  %26 = load i32* %25, align 4
  store i32 %26, i32* %pre_stride, align 4
  %27 = load %struct.macroblock** %1, align 8
  %28 = getelementptr inbounds %struct.macroblock* %27, i32 0, i32 7
  %29 = getelementptr inbounds %struct.macroblockd* %28, i32 0, i32 11
  %30 = getelementptr inbounds %struct.yv12_buffer_config* %29, i32 0, i32 13
  %31 = load i8** %30, align 8
  store i8* %31, i8** %base_pre, align 8
  %32 = load i32* %pre_stride, align 4
  store i32 %32, i32* %in_what_stride, align 4
  %33 = load i32* %pre_stride, align 4
  store i32 %33, i32* %mv_stride, align 4
  %34 = load %struct.blockd** %3, align 8
  %35 = getelementptr inbounds %struct.blockd* %34, i32 0, i32 6
  %36 = bitcast %union.b_mode_info* %35 to %union.int_mv*
  store %union.int_mv* %36, %union.int_mv** %best_mv, align 8
  %37 = load %union.int_mv** %4, align 8
  %38 = bitcast %union.int_mv* %37 to %struct.MV*
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 0
  %40 = load i16* %39, align 2
  %41 = sext i16 %40 to i32
  store i32 %41, i32* %ref_row, align 4
  %42 = load %union.int_mv** %4, align 8
  %43 = bitcast %union.int_mv* %42 to %struct.MV*
  %44 = getelementptr inbounds %struct.MV* %43, i32 0, i32 1
  %45 = load i16* %44, align 2
  %46 = sext i16 %45 to i32
  store i32 %46, i32* %ref_col, align 4
  %47 = load i32* %ref_row, align 4
  %48 = load i32* %6, align 4
  %49 = sub nsw i32 %47, %48
  store i32 %49, i32* %row_min, align 4
  %50 = load i32* %ref_row, align 4
  %51 = load i32* %6, align 4
  %52 = add nsw i32 %50, %51
  store i32 %52, i32* %row_max, align 4
  %53 = load i32* %ref_col, align 4
  %54 = load i32* %6, align 4
  %55 = sub nsw i32 %53, %54
  store i32 %55, i32* %col_min, align 4
  %56 = load i32* %ref_col, align 4
  %57 = load i32* %6, align 4
  %58 = add nsw i32 %56, %57
  store i32 %58, i32* %col_max, align 4
  %59 = load %struct.macroblock** %1, align 8
  %60 = getelementptr inbounds %struct.macroblock* %59, i32 0, i32 25
  %61 = getelementptr inbounds [2 x i32*]* %60, i32 0, i64 0
  %62 = load i32** %61, align 8
  %63 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %62, i32** %63, align 8
  %64 = load %struct.macroblock** %1, align 8
  %65 = getelementptr inbounds %struct.macroblock* %64, i32 0, i32 25
  %66 = getelementptr inbounds [2 x i32*]* %65, i32 0, i64 1
  %67 = load i32** %66, align 8
  %68 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %67, i32** %68, align 8
  %69 = load %union.int_mv** %9, align 8
  %70 = bitcast %union.int_mv* %69 to %struct.MV*
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 0
  %72 = load i16* %71, align 2
  %73 = sext i16 %72 to i32
  %74 = ashr i32 %73, 3
  %75 = trunc i32 %74 to i16
  %76 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0
  store i16 %75, i16* %77, align 2
  %78 = load %union.int_mv** %9, align 8
  %79 = bitcast %union.int_mv* %78 to %struct.MV*
  %80 = getelementptr inbounds %struct.MV* %79, i32 0, i32 1
  %81 = load i16* %80, align 2
  %82 = sext i16 %81 to i32
  %83 = ashr i32 %82, 3
  %84 = trunc i32 %83 to i16
  %85 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %86 = getelementptr inbounds %struct.MV* %85, i32 0, i32 1
  store i16 %84, i16* %86, align 2
  %87 = load i8** %base_pre, align 8
  %88 = load %struct.blockd** %3, align 8
  %89 = getelementptr inbounds %struct.blockd* %88, i32 0, i32 4
  %90 = load i32* %89, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8* %87, i64 %91
  store i8* %92, i8** %in_what, align 8
  %93 = load i8** %in_what, align 8
  %94 = load i32* %ref_row, align 4
  %95 = load i32* %pre_stride, align 4
  %96 = mul nsw i32 %94, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8* %93, i64 %97
  %99 = load i32* %ref_col, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8* %98, i64 %100
  store i8* %101, i8** %bestaddress, align 8
  %102 = load i32* %ref_row, align 4
  %103 = trunc i32 %102 to i16
  %104 = load %union.int_mv** %best_mv, align 8
  %105 = bitcast %union.int_mv* %104 to %struct.MV*
  %106 = getelementptr inbounds %struct.MV* %105, i32 0, i32 0
  store i16 %103, i16* %106, align 2
  %107 = load i32* %ref_col, align 4
  %108 = trunc i32 %107 to i16
  %109 = load %union.int_mv** %best_mv, align 8
  %110 = bitcast %union.int_mv* %109 to %struct.MV*
  %111 = getelementptr inbounds %struct.MV* %110, i32 0, i32 1
  store i16 %108, i16* %111, align 2
  %112 = load %struct.variance_vtable** %7, align 8
  %113 = getelementptr inbounds %struct.variance_vtable* %112, i32 0, i32 0
  %114 = load i32 (i8*, i32, i8*, i32, i32)** %113, align 8
  %115 = load i8** %what, align 8
  %116 = load i32* %what_stride, align 4
  %117 = load i8** %bestaddress, align 8
  %118 = load i32* %in_what_stride, align 4
  %119 = call i32 %114(i8* %115, i32 %116, i8* %117, i32 %118, i32 -1)
  %120 = load %union.int_mv** %best_mv, align 8
  %121 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %122 = load i32* %5, align 4
  %123 = call i32 @mvsad_err_cost(%union.int_mv* %120, %union.int_mv* %fcenter_mv, i32** %121, i32 %122)
  %124 = add i32 %119, %123
  store i32 %124, i32* %bestsad, align 4
  %125 = load i32* %col_min, align 4
  %126 = load %struct.macroblock** %1, align 8
  %127 = getelementptr inbounds %struct.macroblock* %126, i32 0, i32 31
  %128 = load i32* %127, align 4
  %129 = icmp slt i32 %125, %128
  br i1 %129, label %130, label %134

; <label>:130                                     ; preds = %0
  %131 = load %struct.macroblock** %1, align 8
  %132 = getelementptr inbounds %struct.macroblock* %131, i32 0, i32 31
  %133 = load i32* %132, align 4
  store i32 %133, i32* %col_min, align 4
  br label %134

; <label>:134                                     ; preds = %130, %0
  %135 = load i32* %col_max, align 4
  %136 = load %struct.macroblock** %1, align 8
  %137 = getelementptr inbounds %struct.macroblock* %136, i32 0, i32 32
  %138 = load i32* %137, align 4
  %139 = icmp sgt i32 %135, %138
  br i1 %139, label %140, label %144

; <label>:140                                     ; preds = %134
  %141 = load %struct.macroblock** %1, align 8
  %142 = getelementptr inbounds %struct.macroblock* %141, i32 0, i32 32
  %143 = load i32* %142, align 4
  store i32 %143, i32* %col_max, align 4
  br label %144

; <label>:144                                     ; preds = %140, %134
  %145 = load i32* %row_min, align 4
  %146 = load %struct.macroblock** %1, align 8
  %147 = getelementptr inbounds %struct.macroblock* %146, i32 0, i32 33
  %148 = load i32* %147, align 4
  %149 = icmp slt i32 %145, %148
  br i1 %149, label %150, label %154

; <label>:150                                     ; preds = %144
  %151 = load %struct.macroblock** %1, align 8
  %152 = getelementptr inbounds %struct.macroblock* %151, i32 0, i32 33
  %153 = load i32* %152, align 4
  store i32 %153, i32* %row_min, align 4
  br label %154

; <label>:154                                     ; preds = %150, %144
  %155 = load i32* %row_max, align 4
  %156 = load %struct.macroblock** %1, align 8
  %157 = getelementptr inbounds %struct.macroblock* %156, i32 0, i32 34
  %158 = load i32* %157, align 4
  %159 = icmp sgt i32 %155, %158
  br i1 %159, label %160, label %164

; <label>:160                                     ; preds = %154
  %161 = load %struct.macroblock** %1, align 8
  %162 = getelementptr inbounds %struct.macroblock* %161, i32 0, i32 34
  %163 = load i32* %162, align 4
  store i32 %163, i32* %row_max, align 4
  br label %164

; <label>:164                                     ; preds = %160, %154
  %165 = load i32* %row_min, align 4
  store i32 %165, i32* %r, align 4
  br label %166

; <label>:166                                     ; preds = %231, %164
  %167 = load i32* %r, align 4
  %168 = load i32* %row_max, align 4
  %169 = icmp slt i32 %167, %168
  br i1 %169, label %170, label %234

; <label>:170                                     ; preds = %166
  %171 = load i32* %r, align 4
  %172 = trunc i32 %171 to i16
  %173 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %174 = getelementptr inbounds %struct.MV* %173, i32 0, i32 0
  store i16 %172, i16* %174, align 2
  %175 = load i32* %r, align 4
  %176 = load i32* %mv_stride, align 4
  %177 = mul nsw i32 %175, %176
  %178 = load i8** %in_what, align 8
  %179 = sext i32 %177 to i64
  %180 = getelementptr inbounds i8* %178, i64 %179
  %181 = load i32* %col_min, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i8* %180, i64 %182
  store i8* %183, i8** %check_here, align 8
  %184 = load i32* %col_min, align 4
  store i32 %184, i32* %c, align 4
  br label %185

; <label>:185                                     ; preds = %227, %170
  %186 = load i32* %c, align 4
  %187 = load i32* %col_max, align 4
  %188 = icmp slt i32 %186, %187
  br i1 %188, label %189, label %230

; <label>:189                                     ; preds = %185
  %190 = load %struct.variance_vtable** %7, align 8
  %191 = getelementptr inbounds %struct.variance_vtable* %190, i32 0, i32 0
  %192 = load i32 (i8*, i32, i8*, i32, i32)** %191, align 8
  %193 = load i8** %what, align 8
  %194 = load i32* %what_stride, align 4
  %195 = load i8** %check_here, align 8
  %196 = load i32* %in_what_stride, align 4
  %197 = load i32* %bestsad, align 4
  %198 = call i32 %192(i8* %193, i32 %194, i8* %195, i32 %196, i32 %197)
  store i32 %198, i32* %thissad, align 4
  %199 = load i32* %c, align 4
  %200 = trunc i32 %199 to i16
  %201 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %202 = getelementptr inbounds %struct.MV* %201, i32 0, i32 1
  store i16 %200, i16* %202, align 2
  %203 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %204 = load i32* %5, align 4
  %205 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %203, i32 %204)
  %206 = load i32* %thissad, align 4
  %207 = add i32 %206, %205
  store i32 %207, i32* %thissad, align 4
  %208 = load i32* %thissad, align 4
  %209 = load i32* %bestsad, align 4
  %210 = icmp ult i32 %208, %209
  br i1 %210, label %211, label %224

; <label>:211                                     ; preds = %189
  %212 = load i32* %thissad, align 4
  store i32 %212, i32* %bestsad, align 4
  %213 = load i32* %r, align 4
  %214 = trunc i32 %213 to i16
  %215 = load %union.int_mv** %best_mv, align 8
  %216 = bitcast %union.int_mv* %215 to %struct.MV*
  %217 = getelementptr inbounds %struct.MV* %216, i32 0, i32 0
  store i16 %214, i16* %217, align 2
  %218 = load i32* %c, align 4
  %219 = trunc i32 %218 to i16
  %220 = load %union.int_mv** %best_mv, align 8
  %221 = bitcast %union.int_mv* %220 to %struct.MV*
  %222 = getelementptr inbounds %struct.MV* %221, i32 0, i32 1
  store i16 %219, i16* %222, align 2
  %223 = load i8** %check_here, align 8
  store i8* %223, i8** %bestaddress, align 8
  br label %224

; <label>:224                                     ; preds = %211, %189
  %225 = load i8** %check_here, align 8
  %226 = getelementptr inbounds i8* %225, i32 1
  store i8* %226, i8** %check_here, align 8
  br label %227

; <label>:227                                     ; preds = %224
  %228 = load i32* %c, align 4
  %229 = add nsw i32 %228, 1
  store i32 %229, i32* %c, align 4
  br label %185

; <label>:230                                     ; preds = %185
  br label %231

; <label>:231                                     ; preds = %230
  %232 = load i32* %r, align 4
  %233 = add nsw i32 %232, 1
  store i32 %233, i32* %r, align 4
  br label %166

; <label>:234                                     ; preds = %166
  %235 = load %union.int_mv** %best_mv, align 8
  %236 = bitcast %union.int_mv* %235 to %struct.MV*
  %237 = getelementptr inbounds %struct.MV* %236, i32 0, i32 0
  %238 = load i16* %237, align 2
  %239 = sext i16 %238 to i32
  %240 = shl i32 %239, 3
  %241 = trunc i32 %240 to i16
  %242 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %243 = getelementptr inbounds %struct.MV* %242, i32 0, i32 0
  store i16 %241, i16* %243, align 2
  %244 = load %union.int_mv** %best_mv, align 8
  %245 = bitcast %union.int_mv* %244 to %struct.MV*
  %246 = getelementptr inbounds %struct.MV* %245, i32 0, i32 1
  %247 = load i16* %246, align 2
  %248 = sext i16 %247 to i32
  %249 = shl i32 %248, 3
  %250 = trunc i32 %249 to i16
  %251 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %252 = getelementptr inbounds %struct.MV* %251, i32 0, i32 1
  store i16 %250, i16* %252, align 2
  %253 = load %struct.variance_vtable** %7, align 8
  %254 = getelementptr inbounds %struct.variance_vtable* %253, i32 0, i32 1
  %255 = load i32 (i8*, i32, i8*, i32, i32*)** %254, align 8
  %256 = load i8** %what, align 8
  %257 = load i32* %what_stride, align 4
  %258 = load i8** %bestaddress, align 8
  %259 = load i32* %in_what_stride, align 4
  %260 = call i32 %255(i8* %256, i32 %257, i8* %258, i32 %259, i32* %thissad)
  %261 = load %union.int_mv** %9, align 8
  %262 = load i32*** %8, align 8
  %263 = load %struct.macroblock** %1, align 8
  %264 = getelementptr inbounds %struct.macroblock* %263, i32 0, i32 15
  %265 = load i32* %264, align 4
  %266 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %261, i32** %262, i32 %265)
  %267 = add i32 %260, %266
  ret i32 %267
}

; Function Attrs: nounwind uwtable
define i32 @vp8_full_search_sadx3(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %sad_per_bit, i32 %distance, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca %struct.block*, align 8
  %3 = alloca %struct.blockd*, align 8
  %4 = alloca %union.int_mv*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.variance_vtable*, align 8
  %8 = alloca i32**, align 8
  %9 = alloca %union.int_mv*, align 8
  %what = alloca i8*, align 8
  %what_stride = alloca i32, align 4
  %in_what = alloca i8*, align 8
  %pre_stride = alloca i32, align 4
  %base_pre = alloca i8*, align 8
  %in_what_stride = alloca i32, align 4
  %mv_stride = alloca i32, align 4
  %bestaddress = alloca i8*, align 8
  %best_mv = alloca %union.int_mv*, align 8
  %this_mv = alloca %union.int_mv, align 4
  %bestsad = alloca i32, align 4
  %thissad = alloca i32, align 4
  %r = alloca i32, align 4
  %c = alloca i32, align 4
  %check_here = alloca i8*, align 8
  %ref_row = alloca i32, align 4
  %ref_col = alloca i32, align 4
  %row_min = alloca i32, align 4
  %row_max = alloca i32, align 4
  %col_min = alloca i32, align 4
  %col_max = alloca i32, align 4
  %sad_array = alloca [3 x i32], align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %i = alloca i32, align 4
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  store %struct.block* %b, %struct.block** %2, align 8
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  store i32 %sad_per_bit, i32* %5, align 4
  store i32 %distance, i32* %6, align 4
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %7, align 8
  store i32** %mvcost, i32*** %8, align 8
  store %union.int_mv* %center_mv, %union.int_mv** %9, align 8
  %10 = load %struct.block** %2, align 8
  %11 = getelementptr inbounds %struct.block* %10, i32 0, i32 9
  %12 = load i8*** %11, align 8
  %13 = load i8** %12, align 8
  %14 = load %struct.block** %2, align 8
  %15 = getelementptr inbounds %struct.block* %14, i32 0, i32 10
  %16 = load i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8* %13, i64 %17
  store i8* %18, i8** %what, align 8
  %19 = load %struct.block** %2, align 8
  %20 = getelementptr inbounds %struct.block* %19, i32 0, i32 11
  %21 = load i32* %20, align 4
  store i32 %21, i32* %what_stride, align 4
  %22 = load %struct.macroblock** %1, align 8
  %23 = getelementptr inbounds %struct.macroblock* %22, i32 0, i32 7
  %24 = getelementptr inbounds %struct.macroblockd* %23, i32 0, i32 11
  %25 = getelementptr inbounds %struct.yv12_buffer_config* %24, i32 0, i32 4
  %26 = load i32* %25, align 4
  store i32 %26, i32* %pre_stride, align 4
  %27 = load %struct.macroblock** %1, align 8
  %28 = getelementptr inbounds %struct.macroblock* %27, i32 0, i32 7
  %29 = getelementptr inbounds %struct.macroblockd* %28, i32 0, i32 11
  %30 = getelementptr inbounds %struct.yv12_buffer_config* %29, i32 0, i32 13
  %31 = load i8** %30, align 8
  store i8* %31, i8** %base_pre, align 8
  %32 = load i32* %pre_stride, align 4
  store i32 %32, i32* %in_what_stride, align 4
  %33 = load i32* %pre_stride, align 4
  store i32 %33, i32* %mv_stride, align 4
  %34 = load %struct.blockd** %3, align 8
  %35 = getelementptr inbounds %struct.blockd* %34, i32 0, i32 6
  %36 = bitcast %union.b_mode_info* %35 to %union.int_mv*
  store %union.int_mv* %36, %union.int_mv** %best_mv, align 8
  %37 = load %union.int_mv** %4, align 8
  %38 = bitcast %union.int_mv* %37 to %struct.MV*
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 0
  %40 = load i16* %39, align 2
  %41 = sext i16 %40 to i32
  store i32 %41, i32* %ref_row, align 4
  %42 = load %union.int_mv** %4, align 8
  %43 = bitcast %union.int_mv* %42 to %struct.MV*
  %44 = getelementptr inbounds %struct.MV* %43, i32 0, i32 1
  %45 = load i16* %44, align 2
  %46 = sext i16 %45 to i32
  store i32 %46, i32* %ref_col, align 4
  %47 = load i32* %ref_row, align 4
  %48 = load i32* %6, align 4
  %49 = sub nsw i32 %47, %48
  store i32 %49, i32* %row_min, align 4
  %50 = load i32* %ref_row, align 4
  %51 = load i32* %6, align 4
  %52 = add nsw i32 %50, %51
  store i32 %52, i32* %row_max, align 4
  %53 = load i32* %ref_col, align 4
  %54 = load i32* %6, align 4
  %55 = sub nsw i32 %53, %54
  store i32 %55, i32* %col_min, align 4
  %56 = load i32* %ref_col, align 4
  %57 = load i32* %6, align 4
  %58 = add nsw i32 %56, %57
  store i32 %58, i32* %col_max, align 4
  %59 = load %struct.macroblock** %1, align 8
  %60 = getelementptr inbounds %struct.macroblock* %59, i32 0, i32 25
  %61 = getelementptr inbounds [2 x i32*]* %60, i32 0, i64 0
  %62 = load i32** %61, align 8
  %63 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %62, i32** %63, align 8
  %64 = load %struct.macroblock** %1, align 8
  %65 = getelementptr inbounds %struct.macroblock* %64, i32 0, i32 25
  %66 = getelementptr inbounds [2 x i32*]* %65, i32 0, i64 1
  %67 = load i32** %66, align 8
  %68 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %67, i32** %68, align 8
  %69 = load %union.int_mv** %9, align 8
  %70 = bitcast %union.int_mv* %69 to %struct.MV*
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 0
  %72 = load i16* %71, align 2
  %73 = sext i16 %72 to i32
  %74 = ashr i32 %73, 3
  %75 = trunc i32 %74 to i16
  %76 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0
  store i16 %75, i16* %77, align 2
  %78 = load %union.int_mv** %9, align 8
  %79 = bitcast %union.int_mv* %78 to %struct.MV*
  %80 = getelementptr inbounds %struct.MV* %79, i32 0, i32 1
  %81 = load i16* %80, align 2
  %82 = sext i16 %81 to i32
  %83 = ashr i32 %82, 3
  %84 = trunc i32 %83 to i16
  %85 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %86 = getelementptr inbounds %struct.MV* %85, i32 0, i32 1
  store i16 %84, i16* %86, align 2
  %87 = load i8** %base_pre, align 8
  %88 = load %struct.blockd** %3, align 8
  %89 = getelementptr inbounds %struct.blockd* %88, i32 0, i32 4
  %90 = load i32* %89, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8* %87, i64 %91
  store i8* %92, i8** %in_what, align 8
  %93 = load i8** %in_what, align 8
  %94 = load i32* %ref_row, align 4
  %95 = load i32* %pre_stride, align 4
  %96 = mul nsw i32 %94, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8* %93, i64 %97
  %99 = load i32* %ref_col, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8* %98, i64 %100
  store i8* %101, i8** %bestaddress, align 8
  %102 = load i32* %ref_row, align 4
  %103 = trunc i32 %102 to i16
  %104 = load %union.int_mv** %best_mv, align 8
  %105 = bitcast %union.int_mv* %104 to %struct.MV*
  %106 = getelementptr inbounds %struct.MV* %105, i32 0, i32 0
  store i16 %103, i16* %106, align 2
  %107 = load i32* %ref_col, align 4
  %108 = trunc i32 %107 to i16
  %109 = load %union.int_mv** %best_mv, align 8
  %110 = bitcast %union.int_mv* %109 to %struct.MV*
  %111 = getelementptr inbounds %struct.MV* %110, i32 0, i32 1
  store i16 %108, i16* %111, align 2
  %112 = load %struct.variance_vtable** %7, align 8
  %113 = getelementptr inbounds %struct.variance_vtable* %112, i32 0, i32 0
  %114 = load i32 (i8*, i32, i8*, i32, i32)** %113, align 8
  %115 = load i8** %what, align 8
  %116 = load i32* %what_stride, align 4
  %117 = load i8** %bestaddress, align 8
  %118 = load i32* %in_what_stride, align 4
  %119 = call i32 %114(i8* %115, i32 %116, i8* %117, i32 %118, i32 -1)
  %120 = load %union.int_mv** %best_mv, align 8
  %121 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %122 = load i32* %5, align 4
  %123 = call i32 @mvsad_err_cost(%union.int_mv* %120, %union.int_mv* %fcenter_mv, i32** %121, i32 %122)
  %124 = add i32 %119, %123
  store i32 %124, i32* %bestsad, align 4
  %125 = load i32* %col_min, align 4
  %126 = load %struct.macroblock** %1, align 8
  %127 = getelementptr inbounds %struct.macroblock* %126, i32 0, i32 31
  %128 = load i32* %127, align 4
  %129 = icmp slt i32 %125, %128
  br i1 %129, label %130, label %134

; <label>:130                                     ; preds = %0
  %131 = load %struct.macroblock** %1, align 8
  %132 = getelementptr inbounds %struct.macroblock* %131, i32 0, i32 31
  %133 = load i32* %132, align 4
  store i32 %133, i32* %col_min, align 4
  br label %134

; <label>:134                                     ; preds = %130, %0
  %135 = load i32* %col_max, align 4
  %136 = load %struct.macroblock** %1, align 8
  %137 = getelementptr inbounds %struct.macroblock* %136, i32 0, i32 32
  %138 = load i32* %137, align 4
  %139 = icmp sgt i32 %135, %138
  br i1 %139, label %140, label %144

; <label>:140                                     ; preds = %134
  %141 = load %struct.macroblock** %1, align 8
  %142 = getelementptr inbounds %struct.macroblock* %141, i32 0, i32 32
  %143 = load i32* %142, align 4
  store i32 %143, i32* %col_max, align 4
  br label %144

; <label>:144                                     ; preds = %140, %134
  %145 = load i32* %row_min, align 4
  %146 = load %struct.macroblock** %1, align 8
  %147 = getelementptr inbounds %struct.macroblock* %146, i32 0, i32 33
  %148 = load i32* %147, align 4
  %149 = icmp slt i32 %145, %148
  br i1 %149, label %150, label %154

; <label>:150                                     ; preds = %144
  %151 = load %struct.macroblock** %1, align 8
  %152 = getelementptr inbounds %struct.macroblock* %151, i32 0, i32 33
  %153 = load i32* %152, align 4
  store i32 %153, i32* %row_min, align 4
  br label %154

; <label>:154                                     ; preds = %150, %144
  %155 = load i32* %row_max, align 4
  %156 = load %struct.macroblock** %1, align 8
  %157 = getelementptr inbounds %struct.macroblock* %156, i32 0, i32 34
  %158 = load i32* %157, align 4
  %159 = icmp sgt i32 %155, %158
  br i1 %159, label %160, label %164

; <label>:160                                     ; preds = %154
  %161 = load %struct.macroblock** %1, align 8
  %162 = getelementptr inbounds %struct.macroblock* %161, i32 0, i32 34
  %163 = load i32* %162, align 4
  store i32 %163, i32* %row_max, align 4
  br label %164

; <label>:164                                     ; preds = %160, %154
  %165 = load i32* %row_min, align 4
  store i32 %165, i32* %r, align 4
  br label %166

; <label>:166                                     ; preds = %297, %164
  %167 = load i32* %r, align 4
  %168 = load i32* %row_max, align 4
  %169 = icmp slt i32 %167, %168
  br i1 %169, label %170, label %300

; <label>:170                                     ; preds = %166
  %171 = load i32* %r, align 4
  %172 = trunc i32 %171 to i16
  %173 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %174 = getelementptr inbounds %struct.MV* %173, i32 0, i32 0
  store i16 %172, i16* %174, align 2
  %175 = load i32* %r, align 4
  %176 = load i32* %mv_stride, align 4
  %177 = mul nsw i32 %175, %176
  %178 = load i8** %in_what, align 8
  %179 = sext i32 %177 to i64
  %180 = getelementptr inbounds i8* %178, i64 %179
  %181 = load i32* %col_min, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i8* %180, i64 %182
  store i8* %183, i8** %check_here, align 8
  %184 = load i32* %col_min, align 4
  store i32 %184, i32* %c, align 4
  br label %185

; <label>:185                                     ; preds = %245, %170
  %186 = load i32* %c, align 4
  %187 = add nsw i32 %186, 2
  %188 = load i32* %col_max, align 4
  %189 = icmp slt i32 %187, %188
  br i1 %189, label %190, label %246

; <label>:190                                     ; preds = %185
  %191 = load %struct.variance_vtable** %7, align 8
  %192 = getelementptr inbounds %struct.variance_vtable* %191, i32 0, i32 6
  %193 = load void (i8*, i32, i8*, i32, i32*)** %192, align 8
  %194 = load i8** %what, align 8
  %195 = load i32* %what_stride, align 4
  %196 = load i8** %check_here, align 8
  %197 = load i32* %in_what_stride, align 4
  %198 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i32 0
  call void %193(i8* %194, i32 %195, i8* %196, i32 %197, i32* %198)
  store i32 0, i32* %i, align 4
  br label %199

; <label>:199                                     ; preds = %242, %190
  %200 = load i32* %i, align 4
  %201 = icmp slt i32 %200, 3
  br i1 %201, label %202, label %245

; <label>:202                                     ; preds = %199
  %203 = load i32* %i, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i64 %204
  %206 = load i32* %205, align 4
  store i32 %206, i32* %thissad, align 4
  %207 = load i32* %thissad, align 4
  %208 = load i32* %bestsad, align 4
  %209 = icmp ult i32 %207, %208
  br i1 %209, label %210, label %237

; <label>:210                                     ; preds = %202
  %211 = load i32* %c, align 4
  %212 = trunc i32 %211 to i16
  %213 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %214 = getelementptr inbounds %struct.MV* %213, i32 0, i32 1
  store i16 %212, i16* %214, align 2
  %215 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %216 = load i32* %5, align 4
  %217 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %215, i32 %216)
  %218 = load i32* %thissad, align 4
  %219 = add i32 %218, %217
  store i32 %219, i32* %thissad, align 4
  %220 = load i32* %thissad, align 4
  %221 = load i32* %bestsad, align 4
  %222 = icmp ult i32 %220, %221
  br i1 %222, label %223, label %236

; <label>:223                                     ; preds = %210
  %224 = load i32* %thissad, align 4
  store i32 %224, i32* %bestsad, align 4
  %225 = load i32* %r, align 4
  %226 = trunc i32 %225 to i16
  %227 = load %union.int_mv** %best_mv, align 8
  %228 = bitcast %union.int_mv* %227 to %struct.MV*
  %229 = getelementptr inbounds %struct.MV* %228, i32 0, i32 0
  store i16 %226, i16* %229, align 2
  %230 = load i32* %c, align 4
  %231 = trunc i32 %230 to i16
  %232 = load %union.int_mv** %best_mv, align 8
  %233 = bitcast %union.int_mv* %232 to %struct.MV*
  %234 = getelementptr inbounds %struct.MV* %233, i32 0, i32 1
  store i16 %231, i16* %234, align 2
  %235 = load i8** %check_here, align 8
  store i8* %235, i8** %bestaddress, align 8
  br label %236

; <label>:236                                     ; preds = %223, %210
  br label %237

; <label>:237                                     ; preds = %236, %202
  %238 = load i8** %check_here, align 8
  %239 = getelementptr inbounds i8* %238, i32 1
  store i8* %239, i8** %check_here, align 8
  %240 = load i32* %c, align 4
  %241 = add nsw i32 %240, 1
  store i32 %241, i32* %c, align 4
  br label %242

; <label>:242                                     ; preds = %237
  %243 = load i32* %i, align 4
  %244 = add nsw i32 %243, 1
  store i32 %244, i32* %i, align 4
  br label %199

; <label>:245                                     ; preds = %199
  br label %185

; <label>:246                                     ; preds = %185
  br label %247

; <label>:247                                     ; preds = %291, %246
  %248 = load i32* %c, align 4
  %249 = load i32* %col_max, align 4
  %250 = icmp slt i32 %248, %249
  br i1 %250, label %251, label %296

; <label>:251                                     ; preds = %247
  %252 = load %struct.variance_vtable** %7, align 8
  %253 = getelementptr inbounds %struct.variance_vtable* %252, i32 0, i32 0
  %254 = load i32 (i8*, i32, i8*, i32, i32)** %253, align 8
  %255 = load i8** %what, align 8
  %256 = load i32* %what_stride, align 4
  %257 = load i8** %check_here, align 8
  %258 = load i32* %in_what_stride, align 4
  %259 = load i32* %bestsad, align 4
  %260 = call i32 %254(i8* %255, i32 %256, i8* %257, i32 %258, i32 %259)
  store i32 %260, i32* %thissad, align 4
  %261 = load i32* %thissad, align 4
  %262 = load i32* %bestsad, align 4
  %263 = icmp ult i32 %261, %262
  br i1 %263, label %264, label %291

; <label>:264                                     ; preds = %251
  %265 = load i32* %c, align 4
  %266 = trunc i32 %265 to i16
  %267 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %268 = getelementptr inbounds %struct.MV* %267, i32 0, i32 1
  store i16 %266, i16* %268, align 2
  %269 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %270 = load i32* %5, align 4
  %271 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %269, i32 %270)
  %272 = load i32* %thissad, align 4
  %273 = add i32 %272, %271
  store i32 %273, i32* %thissad, align 4
  %274 = load i32* %thissad, align 4
  %275 = load i32* %bestsad, align 4
  %276 = icmp ult i32 %274, %275
  br i1 %276, label %277, label %290

; <label>:277                                     ; preds = %264
  %278 = load i32* %thissad, align 4
  store i32 %278, i32* %bestsad, align 4
  %279 = load i32* %r, align 4
  %280 = trunc i32 %279 to i16
  %281 = load %union.int_mv** %best_mv, align 8
  %282 = bitcast %union.int_mv* %281 to %struct.MV*
  %283 = getelementptr inbounds %struct.MV* %282, i32 0, i32 0
  store i16 %280, i16* %283, align 2
  %284 = load i32* %c, align 4
  %285 = trunc i32 %284 to i16
  %286 = load %union.int_mv** %best_mv, align 8
  %287 = bitcast %union.int_mv* %286 to %struct.MV*
  %288 = getelementptr inbounds %struct.MV* %287, i32 0, i32 1
  store i16 %285, i16* %288, align 2
  %289 = load i8** %check_here, align 8
  store i8* %289, i8** %bestaddress, align 8
  br label %290

; <label>:290                                     ; preds = %277, %264
  br label %291

; <label>:291                                     ; preds = %290, %251
  %292 = load i8** %check_here, align 8
  %293 = getelementptr inbounds i8* %292, i32 1
  store i8* %293, i8** %check_here, align 8
  %294 = load i32* %c, align 4
  %295 = add nsw i32 %294, 1
  store i32 %295, i32* %c, align 4
  br label %247

; <label>:296                                     ; preds = %247
  br label %297

; <label>:297                                     ; preds = %296
  %298 = load i32* %r, align 4
  %299 = add nsw i32 %298, 1
  store i32 %299, i32* %r, align 4
  br label %166

; <label>:300                                     ; preds = %166
  %301 = load %union.int_mv** %best_mv, align 8
  %302 = bitcast %union.int_mv* %301 to %struct.MV*
  %303 = getelementptr inbounds %struct.MV* %302, i32 0, i32 0
  %304 = load i16* %303, align 2
  %305 = sext i16 %304 to i32
  %306 = shl i32 %305, 3
  %307 = trunc i32 %306 to i16
  %308 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %309 = getelementptr inbounds %struct.MV* %308, i32 0, i32 0
  store i16 %307, i16* %309, align 2
  %310 = load %union.int_mv** %best_mv, align 8
  %311 = bitcast %union.int_mv* %310 to %struct.MV*
  %312 = getelementptr inbounds %struct.MV* %311, i32 0, i32 1
  %313 = load i16* %312, align 2
  %314 = sext i16 %313 to i32
  %315 = shl i32 %314, 3
  %316 = trunc i32 %315 to i16
  %317 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %318 = getelementptr inbounds %struct.MV* %317, i32 0, i32 1
  store i16 %316, i16* %318, align 2
  %319 = load %struct.variance_vtable** %7, align 8
  %320 = getelementptr inbounds %struct.variance_vtable* %319, i32 0, i32 1
  %321 = load i32 (i8*, i32, i8*, i32, i32*)** %320, align 8
  %322 = load i8** %what, align 8
  %323 = load i32* %what_stride, align 4
  %324 = load i8** %bestaddress, align 8
  %325 = load i32* %in_what_stride, align 4
  %326 = call i32 %321(i8* %322, i32 %323, i8* %324, i32 %325, i32* %thissad)
  %327 = load %union.int_mv** %9, align 8
  %328 = load i32*** %8, align 8
  %329 = load %struct.macroblock** %1, align 8
  %330 = getelementptr inbounds %struct.macroblock* %329, i32 0, i32 15
  %331 = load i32* %330, align 4
  %332 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %327, i32** %328, i32 %331)
  %333 = add i32 %326, %332
  ret i32 %333
}

; Function Attrs: nounwind uwtable
define i32 @vp8_full_search_sadx8(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %sad_per_bit, i32 %distance, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca %struct.block*, align 8
  %3 = alloca %struct.blockd*, align 8
  %4 = alloca %union.int_mv*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.variance_vtable*, align 8
  %8 = alloca i32**, align 8
  %9 = alloca %union.int_mv*, align 8
  %what = alloca i8*, align 8
  %what_stride = alloca i32, align 4
  %pre_stride = alloca i32, align 4
  %base_pre = alloca i8*, align 8
  %in_what = alloca i8*, align 8
  %in_what_stride = alloca i32, align 4
  %mv_stride = alloca i32, align 4
  %bestaddress = alloca i8*, align 8
  %best_mv = alloca %union.int_mv*, align 8
  %this_mv = alloca %union.int_mv, align 4
  %bestsad = alloca i32, align 4
  %thissad = alloca i32, align 4
  %r = alloca i32, align 4
  %c = alloca i32, align 4
  %check_here = alloca i8*, align 8
  %ref_row = alloca i32, align 4
  %ref_col = alloca i32, align 4
  %row_min = alloca i32, align 4
  %row_max = alloca i32, align 4
  %col_min = alloca i32, align 4
  %col_max = alloca i32, align 4
  %sad_array8_ = alloca [17 x i16], align 16
  %sad_array8 = alloca i16*, align 8
  %sad_array = alloca [3 x i32], align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  store %struct.block* %b, %struct.block** %2, align 8
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  store i32 %sad_per_bit, i32* %5, align 4
  store i32 %distance, i32* %6, align 4
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %7, align 8
  store i32** %mvcost, i32*** %8, align 8
  store %union.int_mv* %center_mv, %union.int_mv** %9, align 8
  %10 = load %struct.block** %2, align 8
  %11 = getelementptr inbounds %struct.block* %10, i32 0, i32 9
  %12 = load i8*** %11, align 8
  %13 = load i8** %12, align 8
  %14 = load %struct.block** %2, align 8
  %15 = getelementptr inbounds %struct.block* %14, i32 0, i32 10
  %16 = load i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8* %13, i64 %17
  store i8* %18, i8** %what, align 8
  %19 = load %struct.block** %2, align 8
  %20 = getelementptr inbounds %struct.block* %19, i32 0, i32 11
  %21 = load i32* %20, align 4
  store i32 %21, i32* %what_stride, align 4
  %22 = load %struct.macroblock** %1, align 8
  %23 = getelementptr inbounds %struct.macroblock* %22, i32 0, i32 7
  %24 = getelementptr inbounds %struct.macroblockd* %23, i32 0, i32 11
  %25 = getelementptr inbounds %struct.yv12_buffer_config* %24, i32 0, i32 4
  %26 = load i32* %25, align 4
  store i32 %26, i32* %pre_stride, align 4
  %27 = load %struct.macroblock** %1, align 8
  %28 = getelementptr inbounds %struct.macroblock* %27, i32 0, i32 7
  %29 = getelementptr inbounds %struct.macroblockd* %28, i32 0, i32 11
  %30 = getelementptr inbounds %struct.yv12_buffer_config* %29, i32 0, i32 13
  %31 = load i8** %30, align 8
  store i8* %31, i8** %base_pre, align 8
  %32 = load i32* %pre_stride, align 4
  store i32 %32, i32* %in_what_stride, align 4
  %33 = load i32* %pre_stride, align 4
  store i32 %33, i32* %mv_stride, align 4
  %34 = load %struct.blockd** %3, align 8
  %35 = getelementptr inbounds %struct.blockd* %34, i32 0, i32 6
  %36 = bitcast %union.b_mode_info* %35 to %union.int_mv*
  store %union.int_mv* %36, %union.int_mv** %best_mv, align 8
  %37 = load %union.int_mv** %4, align 8
  %38 = bitcast %union.int_mv* %37 to %struct.MV*
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 0
  %40 = load i16* %39, align 2
  %41 = sext i16 %40 to i32
  store i32 %41, i32* %ref_row, align 4
  %42 = load %union.int_mv** %4, align 8
  %43 = bitcast %union.int_mv* %42 to %struct.MV*
  %44 = getelementptr inbounds %struct.MV* %43, i32 0, i32 1
  %45 = load i16* %44, align 2
  %46 = sext i16 %45 to i32
  store i32 %46, i32* %ref_col, align 4
  %47 = load i32* %ref_row, align 4
  %48 = load i32* %6, align 4
  %49 = sub nsw i32 %47, %48
  store i32 %49, i32* %row_min, align 4
  %50 = load i32* %ref_row, align 4
  %51 = load i32* %6, align 4
  %52 = add nsw i32 %50, %51
  store i32 %52, i32* %row_max, align 4
  %53 = load i32* %ref_col, align 4
  %54 = load i32* %6, align 4
  %55 = sub nsw i32 %53, %54
  store i32 %55, i32* %col_min, align 4
  %56 = load i32* %ref_col, align 4
  %57 = load i32* %6, align 4
  %58 = add nsw i32 %56, %57
  store i32 %58, i32* %col_max, align 4
  %59 = getelementptr inbounds [17 x i16]* %sad_array8_, i32 0, i32 0
  %60 = ptrtoint i16* %59 to i64
  %61 = add nsw i64 %60, 16
  %62 = sub nsw i64 %61, 1
  %63 = and i64 %62, -16
  %64 = inttoptr i64 %63 to i16*
  store i16* %64, i16** %sad_array8, align 8
  %65 = load %struct.macroblock** %1, align 8
  %66 = getelementptr inbounds %struct.macroblock* %65, i32 0, i32 25
  %67 = getelementptr inbounds [2 x i32*]* %66, i32 0, i64 0
  %68 = load i32** %67, align 8
  %69 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %68, i32** %69, align 8
  %70 = load %struct.macroblock** %1, align 8
  %71 = getelementptr inbounds %struct.macroblock* %70, i32 0, i32 25
  %72 = getelementptr inbounds [2 x i32*]* %71, i32 0, i64 1
  %73 = load i32** %72, align 8
  %74 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %73, i32** %74, align 8
  %75 = load %union.int_mv** %9, align 8
  %76 = bitcast %union.int_mv* %75 to %struct.MV*
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0
  %78 = load i16* %77, align 2
  %79 = sext i16 %78 to i32
  %80 = ashr i32 %79, 3
  %81 = trunc i32 %80 to i16
  %82 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %83 = getelementptr inbounds %struct.MV* %82, i32 0, i32 0
  store i16 %81, i16* %83, align 2
  %84 = load %union.int_mv** %9, align 8
  %85 = bitcast %union.int_mv* %84 to %struct.MV*
  %86 = getelementptr inbounds %struct.MV* %85, i32 0, i32 1
  %87 = load i16* %86, align 2
  %88 = sext i16 %87 to i32
  %89 = ashr i32 %88, 3
  %90 = trunc i32 %89 to i16
  %91 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %92 = getelementptr inbounds %struct.MV* %91, i32 0, i32 1
  store i16 %90, i16* %92, align 2
  %93 = load i8** %base_pre, align 8
  %94 = load %struct.blockd** %3, align 8
  %95 = getelementptr inbounds %struct.blockd* %94, i32 0, i32 4
  %96 = load i32* %95, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8* %93, i64 %97
  store i8* %98, i8** %in_what, align 8
  %99 = load i8** %in_what, align 8
  %100 = load i32* %ref_row, align 4
  %101 = load i32* %pre_stride, align 4
  %102 = mul nsw i32 %100, %101
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i8* %99, i64 %103
  %105 = load i32* %ref_col, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i8* %104, i64 %106
  store i8* %107, i8** %bestaddress, align 8
  %108 = load i32* %ref_row, align 4
  %109 = trunc i32 %108 to i16
  %110 = load %union.int_mv** %best_mv, align 8
  %111 = bitcast %union.int_mv* %110 to %struct.MV*
  %112 = getelementptr inbounds %struct.MV* %111, i32 0, i32 0
  store i16 %109, i16* %112, align 2
  %113 = load i32* %ref_col, align 4
  %114 = trunc i32 %113 to i16
  %115 = load %union.int_mv** %best_mv, align 8
  %116 = bitcast %union.int_mv* %115 to %struct.MV*
  %117 = getelementptr inbounds %struct.MV* %116, i32 0, i32 1
  store i16 %114, i16* %117, align 2
  %118 = load %struct.variance_vtable** %7, align 8
  %119 = getelementptr inbounds %struct.variance_vtable* %118, i32 0, i32 0
  %120 = load i32 (i8*, i32, i8*, i32, i32)** %119, align 8
  %121 = load i8** %what, align 8
  %122 = load i32* %what_stride, align 4
  %123 = load i8** %bestaddress, align 8
  %124 = load i32* %in_what_stride, align 4
  %125 = call i32 %120(i8* %121, i32 %122, i8* %123, i32 %124, i32 -1)
  %126 = load %union.int_mv** %best_mv, align 8
  %127 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %128 = load i32* %5, align 4
  %129 = call i32 @mvsad_err_cost(%union.int_mv* %126, %union.int_mv* %fcenter_mv, i32** %127, i32 %128)
  %130 = add i32 %125, %129
  store i32 %130, i32* %bestsad, align 4
  %131 = load i32* %col_min, align 4
  %132 = load %struct.macroblock** %1, align 8
  %133 = getelementptr inbounds %struct.macroblock* %132, i32 0, i32 31
  %134 = load i32* %133, align 4
  %135 = icmp slt i32 %131, %134
  br i1 %135, label %136, label %140

; <label>:136                                     ; preds = %0
  %137 = load %struct.macroblock** %1, align 8
  %138 = getelementptr inbounds %struct.macroblock* %137, i32 0, i32 31
  %139 = load i32* %138, align 4
  store i32 %139, i32* %col_min, align 4
  br label %140

; <label>:140                                     ; preds = %136, %0
  %141 = load i32* %col_max, align 4
  %142 = load %struct.macroblock** %1, align 8
  %143 = getelementptr inbounds %struct.macroblock* %142, i32 0, i32 32
  %144 = load i32* %143, align 4
  %145 = icmp sgt i32 %141, %144
  br i1 %145, label %146, label %150

; <label>:146                                     ; preds = %140
  %147 = load %struct.macroblock** %1, align 8
  %148 = getelementptr inbounds %struct.macroblock* %147, i32 0, i32 32
  %149 = load i32* %148, align 4
  store i32 %149, i32* %col_max, align 4
  br label %150

; <label>:150                                     ; preds = %146, %140
  %151 = load i32* %row_min, align 4
  %152 = load %struct.macroblock** %1, align 8
  %153 = getelementptr inbounds %struct.macroblock* %152, i32 0, i32 33
  %154 = load i32* %153, align 4
  %155 = icmp slt i32 %151, %154
  br i1 %155, label %156, label %160

; <label>:156                                     ; preds = %150
  %157 = load %struct.macroblock** %1, align 8
  %158 = getelementptr inbounds %struct.macroblock* %157, i32 0, i32 33
  %159 = load i32* %158, align 4
  store i32 %159, i32* %row_min, align 4
  br label %160

; <label>:160                                     ; preds = %156, %150
  %161 = load i32* %row_max, align 4
  %162 = load %struct.macroblock** %1, align 8
  %163 = getelementptr inbounds %struct.macroblock* %162, i32 0, i32 34
  %164 = load i32* %163, align 4
  %165 = icmp sgt i32 %161, %164
  br i1 %165, label %166, label %170

; <label>:166                                     ; preds = %160
  %167 = load %struct.macroblock** %1, align 8
  %168 = getelementptr inbounds %struct.macroblock* %167, i32 0, i32 34
  %169 = load i32* %168, align 4
  store i32 %169, i32* %row_max, align 4
  br label %170

; <label>:170                                     ; preds = %166, %160
  %171 = load i32* %row_min, align 4
  store i32 %171, i32* %r, align 4
  br label %172

; <label>:172                                     ; preds = %367, %170
  %173 = load i32* %r, align 4
  %174 = load i32* %row_max, align 4
  %175 = icmp slt i32 %173, %174
  br i1 %175, label %176, label %370

; <label>:176                                     ; preds = %172
  %177 = load i32* %r, align 4
  %178 = trunc i32 %177 to i16
  %179 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %180 = getelementptr inbounds %struct.MV* %179, i32 0, i32 0
  store i16 %178, i16* %180, align 2
  %181 = load i32* %r, align 4
  %182 = load i32* %mv_stride, align 4
  %183 = mul nsw i32 %181, %182
  %184 = load i8** %in_what, align 8
  %185 = sext i32 %183 to i64
  %186 = getelementptr inbounds i8* %184, i64 %185
  %187 = load i32* %col_min, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i8* %186, i64 %188
  store i8* %189, i8** %check_here, align 8
  %190 = load i32* %col_min, align 4
  store i32 %190, i32* %c, align 4
  br label %191

; <label>:191                                     ; preds = %253, %176
  %192 = load i32* %c, align 4
  %193 = add nsw i32 %192, 7
  %194 = load i32* %col_max, align 4
  %195 = icmp slt i32 %193, %194
  br i1 %195, label %196, label %254

; <label>:196                                     ; preds = %191
  %197 = load %struct.variance_vtable** %7, align 8
  %198 = getelementptr inbounds %struct.variance_vtable* %197, i32 0, i32 7
  %199 = load void (i8*, i32, i8*, i32, i16*)** %198, align 8
  %200 = load i8** %what, align 8
  %201 = load i32* %what_stride, align 4
  %202 = load i8** %check_here, align 8
  %203 = load i32* %in_what_stride, align 4
  %204 = load i16** %sad_array8, align 8
  call void %199(i8* %200, i32 %201, i8* %202, i32 %203, i16* %204)
  store i32 0, i32* %i, align 4
  br label %205

; <label>:205                                     ; preds = %250, %196
  %206 = load i32* %i, align 4
  %207 = icmp slt i32 %206, 8
  br i1 %207, label %208, label %253

; <label>:208                                     ; preds = %205
  %209 = load i32* %i, align 4
  %210 = sext i32 %209 to i64
  %211 = load i16** %sad_array8, align 8
  %212 = getelementptr inbounds i16* %211, i64 %210
  %213 = load i16* %212, align 2
  %214 = zext i16 %213 to i32
  store i32 %214, i32* %thissad, align 4
  %215 = load i32* %thissad, align 4
  %216 = load i32* %bestsad, align 4
  %217 = icmp ult i32 %215, %216
  br i1 %217, label %218, label %245

; <label>:218                                     ; preds = %208
  %219 = load i32* %c, align 4
  %220 = trunc i32 %219 to i16
  %221 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %222 = getelementptr inbounds %struct.MV* %221, i32 0, i32 1
  store i16 %220, i16* %222, align 2
  %223 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %224 = load i32* %5, align 4
  %225 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %223, i32 %224)
  %226 = load i32* %thissad, align 4
  %227 = add i32 %226, %225
  store i32 %227, i32* %thissad, align 4
  %228 = load i32* %thissad, align 4
  %229 = load i32* %bestsad, align 4
  %230 = icmp ult i32 %228, %229
  br i1 %230, label %231, label %244

; <label>:231                                     ; preds = %218
  %232 = load i32* %thissad, align 4
  store i32 %232, i32* %bestsad, align 4
  %233 = load i32* %r, align 4
  %234 = trunc i32 %233 to i16
  %235 = load %union.int_mv** %best_mv, align 8
  %236 = bitcast %union.int_mv* %235 to %struct.MV*
  %237 = getelementptr inbounds %struct.MV* %236, i32 0, i32 0
  store i16 %234, i16* %237, align 2
  %238 = load i32* %c, align 4
  %239 = trunc i32 %238 to i16
  %240 = load %union.int_mv** %best_mv, align 8
  %241 = bitcast %union.int_mv* %240 to %struct.MV*
  %242 = getelementptr inbounds %struct.MV* %241, i32 0, i32 1
  store i16 %239, i16* %242, align 2
  %243 = load i8** %check_here, align 8
  store i8* %243, i8** %bestaddress, align 8
  br label %244

; <label>:244                                     ; preds = %231, %218
  br label %245

; <label>:245                                     ; preds = %244, %208
  %246 = load i8** %check_here, align 8
  %247 = getelementptr inbounds i8* %246, i32 1
  store i8* %247, i8** %check_here, align 8
  %248 = load i32* %c, align 4
  %249 = add nsw i32 %248, 1
  store i32 %249, i32* %c, align 4
  br label %250

; <label>:250                                     ; preds = %245
  %251 = load i32* %i, align 4
  %252 = add nsw i32 %251, 1
  store i32 %252, i32* %i, align 4
  br label %205

; <label>:253                                     ; preds = %205
  br label %191

; <label>:254                                     ; preds = %191
  br label %255

; <label>:255                                     ; preds = %315, %254
  %256 = load i32* %c, align 4
  %257 = add nsw i32 %256, 2
  %258 = load i32* %col_max, align 4
  %259 = icmp slt i32 %257, %258
  br i1 %259, label %260, label %316

; <label>:260                                     ; preds = %255
  %261 = load %struct.variance_vtable** %7, align 8
  %262 = getelementptr inbounds %struct.variance_vtable* %261, i32 0, i32 6
  %263 = load void (i8*, i32, i8*, i32, i32*)** %262, align 8
  %264 = load i8** %what, align 8
  %265 = load i32* %what_stride, align 4
  %266 = load i8** %check_here, align 8
  %267 = load i32* %in_what_stride, align 4
  %268 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i32 0
  call void %263(i8* %264, i32 %265, i8* %266, i32 %267, i32* %268)
  store i32 0, i32* %i1, align 4
  br label %269

; <label>:269                                     ; preds = %312, %260
  %270 = load i32* %i1, align 4
  %271 = icmp slt i32 %270, 3
  br i1 %271, label %272, label %315

; <label>:272                                     ; preds = %269
  %273 = load i32* %i1, align 4
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i64 %274
  %276 = load i32* %275, align 4
  store i32 %276, i32* %thissad, align 4
  %277 = load i32* %thissad, align 4
  %278 = load i32* %bestsad, align 4
  %279 = icmp ult i32 %277, %278
  br i1 %279, label %280, label %307

; <label>:280                                     ; preds = %272
  %281 = load i32* %c, align 4
  %282 = trunc i32 %281 to i16
  %283 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %284 = getelementptr inbounds %struct.MV* %283, i32 0, i32 1
  store i16 %282, i16* %284, align 2
  %285 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %286 = load i32* %5, align 4
  %287 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %285, i32 %286)
  %288 = load i32* %thissad, align 4
  %289 = add i32 %288, %287
  store i32 %289, i32* %thissad, align 4
  %290 = load i32* %thissad, align 4
  %291 = load i32* %bestsad, align 4
  %292 = icmp ult i32 %290, %291
  br i1 %292, label %293, label %306

; <label>:293                                     ; preds = %280
  %294 = load i32* %thissad, align 4
  store i32 %294, i32* %bestsad, align 4
  %295 = load i32* %r, align 4
  %296 = trunc i32 %295 to i16
  %297 = load %union.int_mv** %best_mv, align 8
  %298 = bitcast %union.int_mv* %297 to %struct.MV*
  %299 = getelementptr inbounds %struct.MV* %298, i32 0, i32 0
  store i16 %296, i16* %299, align 2
  %300 = load i32* %c, align 4
  %301 = trunc i32 %300 to i16
  %302 = load %union.int_mv** %best_mv, align 8
  %303 = bitcast %union.int_mv* %302 to %struct.MV*
  %304 = getelementptr inbounds %struct.MV* %303, i32 0, i32 1
  store i16 %301, i16* %304, align 2
  %305 = load i8** %check_here, align 8
  store i8* %305, i8** %bestaddress, align 8
  br label %306

; <label>:306                                     ; preds = %293, %280
  br label %307

; <label>:307                                     ; preds = %306, %272
  %308 = load i8** %check_here, align 8
  %309 = getelementptr inbounds i8* %308, i32 1
  store i8* %309, i8** %check_here, align 8
  %310 = load i32* %c, align 4
  %311 = add nsw i32 %310, 1
  store i32 %311, i32* %c, align 4
  br label %312

; <label>:312                                     ; preds = %307
  %313 = load i32* %i1, align 4
  %314 = add nsw i32 %313, 1
  store i32 %314, i32* %i1, align 4
  br label %269

; <label>:315                                     ; preds = %269
  br label %255

; <label>:316                                     ; preds = %255
  br label %317

; <label>:317                                     ; preds = %361, %316
  %318 = load i32* %c, align 4
  %319 = load i32* %col_max, align 4
  %320 = icmp slt i32 %318, %319
  br i1 %320, label %321, label %366

; <label>:321                                     ; preds = %317
  %322 = load %struct.variance_vtable** %7, align 8
  %323 = getelementptr inbounds %struct.variance_vtable* %322, i32 0, i32 0
  %324 = load i32 (i8*, i32, i8*, i32, i32)** %323, align 8
  %325 = load i8** %what, align 8
  %326 = load i32* %what_stride, align 4
  %327 = load i8** %check_here, align 8
  %328 = load i32* %in_what_stride, align 4
  %329 = load i32* %bestsad, align 4
  %330 = call i32 %324(i8* %325, i32 %326, i8* %327, i32 %328, i32 %329)
  store i32 %330, i32* %thissad, align 4
  %331 = load i32* %thissad, align 4
  %332 = load i32* %bestsad, align 4
  %333 = icmp ult i32 %331, %332
  br i1 %333, label %334, label %361

; <label>:334                                     ; preds = %321
  %335 = load i32* %c, align 4
  %336 = trunc i32 %335 to i16
  %337 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %338 = getelementptr inbounds %struct.MV* %337, i32 0, i32 1
  store i16 %336, i16* %338, align 2
  %339 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %340 = load i32* %5, align 4
  %341 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %339, i32 %340)
  %342 = load i32* %thissad, align 4
  %343 = add i32 %342, %341
  store i32 %343, i32* %thissad, align 4
  %344 = load i32* %thissad, align 4
  %345 = load i32* %bestsad, align 4
  %346 = icmp ult i32 %344, %345
  br i1 %346, label %347, label %360

; <label>:347                                     ; preds = %334
  %348 = load i32* %thissad, align 4
  store i32 %348, i32* %bestsad, align 4
  %349 = load i32* %r, align 4
  %350 = trunc i32 %349 to i16
  %351 = load %union.int_mv** %best_mv, align 8
  %352 = bitcast %union.int_mv* %351 to %struct.MV*
  %353 = getelementptr inbounds %struct.MV* %352, i32 0, i32 0
  store i16 %350, i16* %353, align 2
  %354 = load i32* %c, align 4
  %355 = trunc i32 %354 to i16
  %356 = load %union.int_mv** %best_mv, align 8
  %357 = bitcast %union.int_mv* %356 to %struct.MV*
  %358 = getelementptr inbounds %struct.MV* %357, i32 0, i32 1
  store i16 %355, i16* %358, align 2
  %359 = load i8** %check_here, align 8
  store i8* %359, i8** %bestaddress, align 8
  br label %360

; <label>:360                                     ; preds = %347, %334
  br label %361

; <label>:361                                     ; preds = %360, %321
  %362 = load i8** %check_here, align 8
  %363 = getelementptr inbounds i8* %362, i32 1
  store i8* %363, i8** %check_here, align 8
  %364 = load i32* %c, align 4
  %365 = add nsw i32 %364, 1
  store i32 %365, i32* %c, align 4
  br label %317

; <label>:366                                     ; preds = %317
  br label %367

; <label>:367                                     ; preds = %366
  %368 = load i32* %r, align 4
  %369 = add nsw i32 %368, 1
  store i32 %369, i32* %r, align 4
  br label %172

; <label>:370                                     ; preds = %172
  %371 = load %union.int_mv** %best_mv, align 8
  %372 = bitcast %union.int_mv* %371 to %struct.MV*
  %373 = getelementptr inbounds %struct.MV* %372, i32 0, i32 0
  %374 = load i16* %373, align 2
  %375 = sext i16 %374 to i32
  %376 = mul nsw i32 %375, 8
  %377 = trunc i32 %376 to i16
  %378 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %379 = getelementptr inbounds %struct.MV* %378, i32 0, i32 0
  store i16 %377, i16* %379, align 2
  %380 = load %union.int_mv** %best_mv, align 8
  %381 = bitcast %union.int_mv* %380 to %struct.MV*
  %382 = getelementptr inbounds %struct.MV* %381, i32 0, i32 1
  %383 = load i16* %382, align 2
  %384 = sext i16 %383 to i32
  %385 = mul nsw i32 %384, 8
  %386 = trunc i32 %385 to i16
  %387 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %388 = getelementptr inbounds %struct.MV* %387, i32 0, i32 1
  store i16 %386, i16* %388, align 2
  %389 = load %struct.variance_vtable** %7, align 8
  %390 = getelementptr inbounds %struct.variance_vtable* %389, i32 0, i32 1
  %391 = load i32 (i8*, i32, i8*, i32, i32*)** %390, align 8
  %392 = load i8** %what, align 8
  %393 = load i32* %what_stride, align 4
  %394 = load i8** %bestaddress, align 8
  %395 = load i32* %in_what_stride, align 4
  %396 = call i32 %391(i8* %392, i32 %393, i8* %394, i32 %395, i32* %thissad)
  %397 = load %union.int_mv** %9, align 8
  %398 = load i32*** %8, align 8
  %399 = load %struct.macroblock** %1, align 8
  %400 = getelementptr inbounds %struct.macroblock* %399, i32 0, i32 15
  %401 = load i32* %400, align 4
  %402 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %397, i32** %398, i32 %401)
  %403 = add i32 %396, %402
  ret i32 %403
}

; Function Attrs: nounwind uwtable
define i32 @vp8_refining_search_sad_c(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %error_per_bit, i32 %search_range, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca %struct.block*, align 8
  %3 = alloca %struct.blockd*, align 8
  %4 = alloca %union.int_mv*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.variance_vtable*, align 8
  %8 = alloca i32**, align 8
  %9 = alloca %union.int_mv*, align 8
  %neighbors = alloca [4 x %struct.MV], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %this_row_offset = alloca i16, align 2
  %this_col_offset = alloca i16, align 2
  %what_stride = alloca i32, align 4
  %pre_stride = alloca i32, align 4
  %base_pre = alloca i8*, align 8
  %in_what_stride = alloca i32, align 4
  %what = alloca i8*, align 8
  %best_address = alloca i8*, align 8
  %check_here = alloca i8*, align 8
  %this_mv = alloca %union.int_mv, align 4
  %bestsad = alloca i32, align 4
  %thissad = alloca i32, align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %best_site = alloca i32, align 4
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  store %struct.block* %b, %struct.block** %2, align 8
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  store i32 %error_per_bit, i32* %5, align 4
  store i32 %search_range, i32* %6, align 4
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %7, align 8
  store i32** %mvcost, i32*** %8, align 8
  store %union.int_mv* %center_mv, %union.int_mv** %9, align 8
  %10 = bitcast [4 x %struct.MV]* %neighbors to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* bitcast ([4 x %struct.MV]* @vp8_refining_search_sad_c.neighbors to i8*), i64 16, i32 16, i1 false)
  %11 = load %struct.block** %2, align 8
  %12 = getelementptr inbounds %struct.block* %11, i32 0, i32 11
  %13 = load i32* %12, align 4
  store i32 %13, i32* %what_stride, align 4
  %14 = load %struct.macroblock** %1, align 8
  %15 = getelementptr inbounds %struct.macroblock* %14, i32 0, i32 7
  %16 = getelementptr inbounds %struct.macroblockd* %15, i32 0, i32 11
  %17 = getelementptr inbounds %struct.yv12_buffer_config* %16, i32 0, i32 4
  %18 = load i32* %17, align 4
  store i32 %18, i32* %pre_stride, align 4
  %19 = load %struct.macroblock** %1, align 8
  %20 = getelementptr inbounds %struct.macroblock* %19, i32 0, i32 7
  %21 = getelementptr inbounds %struct.macroblockd* %20, i32 0, i32 11
  %22 = getelementptr inbounds %struct.yv12_buffer_config* %21, i32 0, i32 13
  %23 = load i8** %22, align 8
  store i8* %23, i8** %base_pre, align 8
  %24 = load i32* %pre_stride, align 4
  store i32 %24, i32* %in_what_stride, align 4
  %25 = load %struct.block** %2, align 8
  %26 = getelementptr inbounds %struct.block* %25, i32 0, i32 9
  %27 = load i8*** %26, align 8
  %28 = load i8** %27, align 8
  %29 = load %struct.block** %2, align 8
  %30 = getelementptr inbounds %struct.block* %29, i32 0, i32 10
  %31 = load i32* %30, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8* %28, i64 %32
  store i8* %33, i8** %what, align 8
  %34 = load i8** %base_pre, align 8
  %35 = load %struct.blockd** %3, align 8
  %36 = getelementptr inbounds %struct.blockd* %35, i32 0, i32 4
  %37 = load i32* %36, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8* %34, i64 %38
  %40 = load %union.int_mv** %4, align 8
  %41 = bitcast %union.int_mv* %40 to %struct.MV*
  %42 = getelementptr inbounds %struct.MV* %41, i32 0, i32 0
  %43 = load i16* %42, align 2
  %44 = sext i16 %43 to i32
  %45 = load i32* %pre_stride, align 4
  %46 = mul nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8* %39, i64 %47
  %49 = load %union.int_mv** %4, align 8
  %50 = bitcast %union.int_mv* %49 to %struct.MV*
  %51 = getelementptr inbounds %struct.MV* %50, i32 0, i32 1
  %52 = load i16* %51, align 2
  %53 = sext i16 %52 to i32
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8* %48, i64 %54
  store i8* %55, i8** %best_address, align 8
  %56 = load %struct.macroblock** %1, align 8
  %57 = getelementptr inbounds %struct.macroblock* %56, i32 0, i32 25
  %58 = getelementptr inbounds [2 x i32*]* %57, i32 0, i64 0
  %59 = load i32** %58, align 8
  %60 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %59, i32** %60, align 8
  %61 = load %struct.macroblock** %1, align 8
  %62 = getelementptr inbounds %struct.macroblock* %61, i32 0, i32 25
  %63 = getelementptr inbounds [2 x i32*]* %62, i32 0, i64 1
  %64 = load i32** %63, align 8
  %65 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %64, i32** %65, align 8
  %66 = load %union.int_mv** %9, align 8
  %67 = bitcast %union.int_mv* %66 to %struct.MV*
  %68 = getelementptr inbounds %struct.MV* %67, i32 0, i32 0
  %69 = load i16* %68, align 2
  %70 = sext i16 %69 to i32
  %71 = ashr i32 %70, 3
  %72 = trunc i32 %71 to i16
  %73 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %74 = getelementptr inbounds %struct.MV* %73, i32 0, i32 0
  store i16 %72, i16* %74, align 2
  %75 = load %union.int_mv** %9, align 8
  %76 = bitcast %union.int_mv* %75 to %struct.MV*
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 1
  %78 = load i16* %77, align 2
  %79 = sext i16 %78 to i32
  %80 = ashr i32 %79, 3
  %81 = trunc i32 %80 to i16
  %82 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %83 = getelementptr inbounds %struct.MV* %82, i32 0, i32 1
  store i16 %81, i16* %83, align 2
  %84 = load %struct.variance_vtable** %7, align 8
  %85 = getelementptr inbounds %struct.variance_vtable* %84, i32 0, i32 0
  %86 = load i32 (i8*, i32, i8*, i32, i32)** %85, align 8
  %87 = load i8** %what, align 8
  %88 = load i32* %what_stride, align 4
  %89 = load i8** %best_address, align 8
  %90 = load i32* %in_what_stride, align 4
  %91 = call i32 %86(i8* %87, i32 %88, i8* %89, i32 %90, i32 -1)
  %92 = load %union.int_mv** %4, align 8
  %93 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %94 = load i32* %5, align 4
  %95 = call i32 @mvsad_err_cost(%union.int_mv* %92, %union.int_mv* %fcenter_mv, i32** %93, i32 %94)
  %96 = add i32 %91, %95
  store i32 %96, i32* %bestsad, align 4
  store i32 0, i32* %i, align 4
  br label %97

; <label>:97                                      ; preds = %264, %0
  %98 = load i32* %i, align 4
  %99 = load i32* %6, align 4
  %100 = icmp slt i32 %98, %99
  br i1 %100, label %101, label %267

; <label>:101                                     ; preds = %97
  store i32 -1, i32* %best_site, align 4
  store i32 0, i32* %j, align 4
  br label %102

; <label>:102                                     ; preds = %211, %101
  %103 = load i32* %j, align 4
  %104 = icmp slt i32 %103, 4
  br i1 %104, label %105, label %214

; <label>:105                                     ; preds = %102
  %106 = load %union.int_mv** %4, align 8
  %107 = bitcast %union.int_mv* %106 to %struct.MV*
  %108 = getelementptr inbounds %struct.MV* %107, i32 0, i32 0
  %109 = load i16* %108, align 2
  %110 = sext i16 %109 to i32
  %111 = load i32* %j, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %112
  %114 = getelementptr inbounds %struct.MV* %113, i32 0, i32 0
  %115 = load i16* %114, align 2
  %116 = sext i16 %115 to i32
  %117 = add nsw i32 %110, %116
  %118 = trunc i32 %117 to i16
  store i16 %118, i16* %this_row_offset, align 2
  %119 = load %union.int_mv** %4, align 8
  %120 = bitcast %union.int_mv* %119 to %struct.MV*
  %121 = getelementptr inbounds %struct.MV* %120, i32 0, i32 1
  %122 = load i16* %121, align 2
  %123 = sext i16 %122 to i32
  %124 = load i32* %j, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %125
  %127 = getelementptr inbounds %struct.MV* %126, i32 0, i32 1
  %128 = load i16* %127, align 2
  %129 = sext i16 %128 to i32
  %130 = add nsw i32 %123, %129
  %131 = trunc i32 %130 to i16
  store i16 %131, i16* %this_col_offset, align 2
  %132 = load i16* %this_col_offset, align 2
  %133 = sext i16 %132 to i32
  %134 = load %struct.macroblock** %1, align 8
  %135 = getelementptr inbounds %struct.macroblock* %134, i32 0, i32 31
  %136 = load i32* %135, align 4
  %137 = icmp sgt i32 %133, %136
  br i1 %137, label %138, label %210

; <label>:138                                     ; preds = %105
  %139 = load i16* %this_col_offset, align 2
  %140 = sext i16 %139 to i32
  %141 = load %struct.macroblock** %1, align 8
  %142 = getelementptr inbounds %struct.macroblock* %141, i32 0, i32 32
  %143 = load i32* %142, align 4
  %144 = icmp slt i32 %140, %143
  br i1 %144, label %145, label %210

; <label>:145                                     ; preds = %138
  %146 = load i16* %this_row_offset, align 2
  %147 = sext i16 %146 to i32
  %148 = load %struct.macroblock** %1, align 8
  %149 = getelementptr inbounds %struct.macroblock* %148, i32 0, i32 33
  %150 = load i32* %149, align 4
  %151 = icmp sgt i32 %147, %150
  br i1 %151, label %152, label %210

; <label>:152                                     ; preds = %145
  %153 = load i16* %this_row_offset, align 2
  %154 = sext i16 %153 to i32
  %155 = load %struct.macroblock** %1, align 8
  %156 = getelementptr inbounds %struct.macroblock* %155, i32 0, i32 34
  %157 = load i32* %156, align 4
  %158 = icmp slt i32 %154, %157
  br i1 %158, label %159, label %210

; <label>:159                                     ; preds = %152
  %160 = load i32* %j, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %161
  %163 = getelementptr inbounds %struct.MV* %162, i32 0, i32 0
  %164 = load i16* %163, align 2
  %165 = sext i16 %164 to i32
  %166 = load i32* %in_what_stride, align 4
  %167 = mul nsw i32 %165, %166
  %168 = load i32* %j, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %169
  %171 = getelementptr inbounds %struct.MV* %170, i32 0, i32 1
  %172 = load i16* %171, align 2
  %173 = sext i16 %172 to i32
  %174 = add nsw i32 %167, %173
  %175 = load i8** %best_address, align 8
  %176 = sext i32 %174 to i64
  %177 = getelementptr inbounds i8* %175, i64 %176
  store i8* %177, i8** %check_here, align 8
  %178 = load %struct.variance_vtable** %7, align 8
  %179 = getelementptr inbounds %struct.variance_vtable* %178, i32 0, i32 0
  %180 = load i32 (i8*, i32, i8*, i32, i32)** %179, align 8
  %181 = load i8** %what, align 8
  %182 = load i32* %what_stride, align 4
  %183 = load i8** %check_here, align 8
  %184 = load i32* %in_what_stride, align 4
  %185 = load i32* %bestsad, align 4
  %186 = call i32 %180(i8* %181, i32 %182, i8* %183, i32 %184, i32 %185)
  store i32 %186, i32* %thissad, align 4
  %187 = load i32* %thissad, align 4
  %188 = load i32* %bestsad, align 4
  %189 = icmp ult i32 %187, %188
  br i1 %189, label %190, label %209

; <label>:190                                     ; preds = %159
  %191 = load i16* %this_row_offset, align 2
  %192 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %193 = getelementptr inbounds %struct.MV* %192, i32 0, i32 0
  store i16 %191, i16* %193, align 2
  %194 = load i16* %this_col_offset, align 2
  %195 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %196 = getelementptr inbounds %struct.MV* %195, i32 0, i32 1
  store i16 %194, i16* %196, align 2
  %197 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %198 = load i32* %5, align 4
  %199 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %197, i32 %198)
  %200 = load i32* %thissad, align 4
  %201 = add i32 %200, %199
  store i32 %201, i32* %thissad, align 4
  %202 = load i32* %thissad, align 4
  %203 = load i32* %bestsad, align 4
  %204 = icmp ult i32 %202, %203
  br i1 %204, label %205, label %208

; <label>:205                                     ; preds = %190
  %206 = load i32* %thissad, align 4
  store i32 %206, i32* %bestsad, align 4
  %207 = load i32* %j, align 4
  store i32 %207, i32* %best_site, align 4
  br label %208

; <label>:208                                     ; preds = %205, %190
  br label %209

; <label>:209                                     ; preds = %208, %159
  br label %210

; <label>:210                                     ; preds = %209, %152, %145, %138, %105
  br label %211

; <label>:211                                     ; preds = %210
  %212 = load i32* %j, align 4
  %213 = add nsw i32 %212, 1
  store i32 %213, i32* %j, align 4
  br label %102

; <label>:214                                     ; preds = %102
  %215 = load i32* %best_site, align 4
  %216 = icmp eq i32 %215, -1
  br i1 %216, label %217, label %218

; <label>:217                                     ; preds = %214
  br label %267

; <label>:218                                     ; preds = %214
  %219 = load i32* %best_site, align 4
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %220
  %222 = getelementptr inbounds %struct.MV* %221, i32 0, i32 0
  %223 = load i16* %222, align 2
  %224 = sext i16 %223 to i32
  %225 = load %union.int_mv** %4, align 8
  %226 = bitcast %union.int_mv* %225 to %struct.MV*
  %227 = getelementptr inbounds %struct.MV* %226, i32 0, i32 0
  %228 = load i16* %227, align 2
  %229 = sext i16 %228 to i32
  %230 = add nsw i32 %229, %224
  %231 = trunc i32 %230 to i16
  store i16 %231, i16* %227, align 2
  %232 = load i32* %best_site, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %233
  %235 = getelementptr inbounds %struct.MV* %234, i32 0, i32 1
  %236 = load i16* %235, align 2
  %237 = sext i16 %236 to i32
  %238 = load %union.int_mv** %4, align 8
  %239 = bitcast %union.int_mv* %238 to %struct.MV*
  %240 = getelementptr inbounds %struct.MV* %239, i32 0, i32 1
  %241 = load i16* %240, align 2
  %242 = sext i16 %241 to i32
  %243 = add nsw i32 %242, %237
  %244 = trunc i32 %243 to i16
  store i16 %244, i16* %240, align 2
  %245 = load i32* %best_site, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %246
  %248 = getelementptr inbounds %struct.MV* %247, i32 0, i32 0
  %249 = load i16* %248, align 2
  %250 = sext i16 %249 to i32
  %251 = load i32* %in_what_stride, align 4
  %252 = mul nsw i32 %250, %251
  %253 = load i32* %best_site, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %254
  %256 = getelementptr inbounds %struct.MV* %255, i32 0, i32 1
  %257 = load i16* %256, align 2
  %258 = sext i16 %257 to i32
  %259 = add nsw i32 %252, %258
  %260 = load i8** %best_address, align 8
  %261 = sext i32 %259 to i64
  %262 = getelementptr inbounds i8* %260, i64 %261
  store i8* %262, i8** %best_address, align 8
  br label %263

; <label>:263                                     ; preds = %218
  br label %264

; <label>:264                                     ; preds = %263
  %265 = load i32* %i, align 4
  %266 = add nsw i32 %265, 1
  store i32 %266, i32* %i, align 4
  br label %97

; <label>:267                                     ; preds = %217, %97
  %268 = load %union.int_mv** %4, align 8
  %269 = bitcast %union.int_mv* %268 to %struct.MV*
  %270 = getelementptr inbounds %struct.MV* %269, i32 0, i32 0
  %271 = load i16* %270, align 2
  %272 = sext i16 %271 to i32
  %273 = shl i32 %272, 3
  %274 = trunc i32 %273 to i16
  %275 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %276 = getelementptr inbounds %struct.MV* %275, i32 0, i32 0
  store i16 %274, i16* %276, align 2
  %277 = load %union.int_mv** %4, align 8
  %278 = bitcast %union.int_mv* %277 to %struct.MV*
  %279 = getelementptr inbounds %struct.MV* %278, i32 0, i32 1
  %280 = load i16* %279, align 2
  %281 = sext i16 %280 to i32
  %282 = shl i32 %281, 3
  %283 = trunc i32 %282 to i16
  %284 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %285 = getelementptr inbounds %struct.MV* %284, i32 0, i32 1
  store i16 %283, i16* %285, align 2
  %286 = load %struct.variance_vtable** %7, align 8
  %287 = getelementptr inbounds %struct.variance_vtable* %286, i32 0, i32 1
  %288 = load i32 (i8*, i32, i8*, i32, i32*)** %287, align 8
  %289 = load i8** %what, align 8
  %290 = load i32* %what_stride, align 4
  %291 = load i8** %best_address, align 8
  %292 = load i32* %in_what_stride, align 4
  %293 = call i32 %288(i8* %289, i32 %290, i8* %291, i32 %292, i32* %thissad)
  %294 = load %union.int_mv** %9, align 8
  %295 = load i32*** %8, align 8
  %296 = load %struct.macroblock** %1, align 8
  %297 = getelementptr inbounds %struct.macroblock* %296, i32 0, i32 15
  %298 = load i32* %297, align 4
  %299 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %294, i32** %295, i32 %298)
  %300 = add i32 %293, %299
  ret i32 %300
}

; Function Attrs: nounwind uwtable
define i32 @vp8_refining_search_sadx4(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %error_per_bit, i32 %search_range, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca %struct.block*, align 8
  %3 = alloca %struct.blockd*, align 8
  %4 = alloca %union.int_mv*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.variance_vtable*, align 8
  %8 = alloca i32**, align 8
  %9 = alloca %union.int_mv*, align 8
  %neighbors = alloca [4 x %struct.MV], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %this_row_offset = alloca i16, align 2
  %this_col_offset = alloca i16, align 2
  %what_stride = alloca i32, align 4
  %pre_stride = alloca i32, align 4
  %base_pre = alloca i8*, align 8
  %in_what_stride = alloca i32, align 4
  %what = alloca i8*, align 8
  %best_address = alloca i8*, align 8
  %check_here = alloca i8*, align 8
  %this_mv = alloca %union.int_mv, align 4
  %bestsad = alloca i32, align 4
  %thissad = alloca i32, align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %best_site = alloca i32, align 4
  %all_in = alloca i32, align 4
  %sad_array = alloca [4 x i32], align 16
  %block_offset = alloca [4 x i8*], align 16
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  store %struct.block* %b, %struct.block** %2, align 8
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  store i32 %error_per_bit, i32* %5, align 4
  store i32 %search_range, i32* %6, align 4
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %7, align 8
  store i32** %mvcost, i32*** %8, align 8
  store %union.int_mv* %center_mv, %union.int_mv** %9, align 8
  %10 = bitcast [4 x %struct.MV]* %neighbors to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* bitcast ([4 x %struct.MV]* @vp8_refining_search_sadx4.neighbors to i8*), i64 16, i32 16, i1 false)
  %11 = load %struct.block** %2, align 8
  %12 = getelementptr inbounds %struct.block* %11, i32 0, i32 11
  %13 = load i32* %12, align 4
  store i32 %13, i32* %what_stride, align 4
  %14 = load %struct.macroblock** %1, align 8
  %15 = getelementptr inbounds %struct.macroblock* %14, i32 0, i32 7
  %16 = getelementptr inbounds %struct.macroblockd* %15, i32 0, i32 11
  %17 = getelementptr inbounds %struct.yv12_buffer_config* %16, i32 0, i32 4
  %18 = load i32* %17, align 4
  store i32 %18, i32* %pre_stride, align 4
  %19 = load %struct.macroblock** %1, align 8
  %20 = getelementptr inbounds %struct.macroblock* %19, i32 0, i32 7
  %21 = getelementptr inbounds %struct.macroblockd* %20, i32 0, i32 11
  %22 = getelementptr inbounds %struct.yv12_buffer_config* %21, i32 0, i32 13
  %23 = load i8** %22, align 8
  store i8* %23, i8** %base_pre, align 8
  %24 = load i32* %pre_stride, align 4
  store i32 %24, i32* %in_what_stride, align 4
  %25 = load %struct.block** %2, align 8
  %26 = getelementptr inbounds %struct.block* %25, i32 0, i32 9
  %27 = load i8*** %26, align 8
  %28 = load i8** %27, align 8
  %29 = load %struct.block** %2, align 8
  %30 = getelementptr inbounds %struct.block* %29, i32 0, i32 10
  %31 = load i32* %30, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8* %28, i64 %32
  store i8* %33, i8** %what, align 8
  %34 = load i8** %base_pre, align 8
  %35 = load %struct.blockd** %3, align 8
  %36 = getelementptr inbounds %struct.blockd* %35, i32 0, i32 4
  %37 = load i32* %36, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8* %34, i64 %38
  %40 = load %union.int_mv** %4, align 8
  %41 = bitcast %union.int_mv* %40 to %struct.MV*
  %42 = getelementptr inbounds %struct.MV* %41, i32 0, i32 0
  %43 = load i16* %42, align 2
  %44 = sext i16 %43 to i32
  %45 = load i32* %pre_stride, align 4
  %46 = mul nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8* %39, i64 %47
  %49 = load %union.int_mv** %4, align 8
  %50 = bitcast %union.int_mv* %49 to %struct.MV*
  %51 = getelementptr inbounds %struct.MV* %50, i32 0, i32 1
  %52 = load i16* %51, align 2
  %53 = sext i16 %52 to i32
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8* %48, i64 %54
  store i8* %55, i8** %best_address, align 8
  %56 = load %struct.macroblock** %1, align 8
  %57 = getelementptr inbounds %struct.macroblock* %56, i32 0, i32 25
  %58 = getelementptr inbounds [2 x i32*]* %57, i32 0, i64 0
  %59 = load i32** %58, align 8
  %60 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0
  store i32* %59, i32** %60, align 8
  %61 = load %struct.macroblock** %1, align 8
  %62 = getelementptr inbounds %struct.macroblock* %61, i32 0, i32 25
  %63 = getelementptr inbounds [2 x i32*]* %62, i32 0, i64 1
  %64 = load i32** %63, align 8
  %65 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1
  store i32* %64, i32** %65, align 8
  %66 = load %union.int_mv** %9, align 8
  %67 = bitcast %union.int_mv* %66 to %struct.MV*
  %68 = getelementptr inbounds %struct.MV* %67, i32 0, i32 0
  %69 = load i16* %68, align 2
  %70 = sext i16 %69 to i32
  %71 = ashr i32 %70, 3
  %72 = trunc i32 %71 to i16
  %73 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %74 = getelementptr inbounds %struct.MV* %73, i32 0, i32 0
  store i16 %72, i16* %74, align 2
  %75 = load %union.int_mv** %9, align 8
  %76 = bitcast %union.int_mv* %75 to %struct.MV*
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 1
  %78 = load i16* %77, align 2
  %79 = sext i16 %78 to i32
  %80 = ashr i32 %79, 3
  %81 = trunc i32 %80 to i16
  %82 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*
  %83 = getelementptr inbounds %struct.MV* %82, i32 0, i32 1
  store i16 %81, i16* %83, align 2
  %84 = load %struct.variance_vtable** %7, align 8
  %85 = getelementptr inbounds %struct.variance_vtable* %84, i32 0, i32 0
  %86 = load i32 (i8*, i32, i8*, i32, i32)** %85, align 8
  %87 = load i8** %what, align 8
  %88 = load i32* %what_stride, align 4
  %89 = load i8** %best_address, align 8
  %90 = load i32* %in_what_stride, align 4
  %91 = call i32 %86(i8* %87, i32 %88, i8* %89, i32 %90, i32 -1)
  %92 = load %union.int_mv** %4, align 8
  %93 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %94 = load i32* %5, align 4
  %95 = call i32 @mvsad_err_cost(%union.int_mv* %92, %union.int_mv* %fcenter_mv, i32** %93, i32 %94)
  %96 = add i32 %91, %95
  store i32 %96, i32* %bestsad, align 4
  store i32 0, i32* %i, align 4
  br label %97

; <label>:97                                      ; preds = %413, %0
  %98 = load i32* %i, align 4
  %99 = load i32* %6, align 4
  %100 = icmp slt i32 %98, %99
  br i1 %100, label %101, label %416

; <label>:101                                     ; preds = %97
  store i32 -1, i32* %best_site, align 4
  store i32 1, i32* %all_in, align 4
  %102 = load %union.int_mv** %4, align 8
  %103 = bitcast %union.int_mv* %102 to %struct.MV*
  %104 = getelementptr inbounds %struct.MV* %103, i32 0, i32 0
  %105 = load i16* %104, align 2
  %106 = sext i16 %105 to i32
  %107 = sub nsw i32 %106, 1
  %108 = load %struct.macroblock** %1, align 8
  %109 = getelementptr inbounds %struct.macroblock* %108, i32 0, i32 33
  %110 = load i32* %109, align 4
  %111 = icmp sgt i32 %107, %110
  %112 = zext i1 %111 to i32
  %113 = load i32* %all_in, align 4
  %114 = and i32 %113, %112
  store i32 %114, i32* %all_in, align 4
  %115 = load %union.int_mv** %4, align 8
  %116 = bitcast %union.int_mv* %115 to %struct.MV*
  %117 = getelementptr inbounds %struct.MV* %116, i32 0, i32 0
  %118 = load i16* %117, align 2
  %119 = sext i16 %118 to i32
  %120 = add nsw i32 %119, 1
  %121 = load %struct.macroblock** %1, align 8
  %122 = getelementptr inbounds %struct.macroblock* %121, i32 0, i32 34
  %123 = load i32* %122, align 4
  %124 = icmp slt i32 %120, %123
  %125 = zext i1 %124 to i32
  %126 = load i32* %all_in, align 4
  %127 = and i32 %126, %125
  store i32 %127, i32* %all_in, align 4
  %128 = load %union.int_mv** %4, align 8
  %129 = bitcast %union.int_mv* %128 to %struct.MV*
  %130 = getelementptr inbounds %struct.MV* %129, i32 0, i32 1
  %131 = load i16* %130, align 2
  %132 = sext i16 %131 to i32
  %133 = sub nsw i32 %132, 1
  %134 = load %struct.macroblock** %1, align 8
  %135 = getelementptr inbounds %struct.macroblock* %134, i32 0, i32 31
  %136 = load i32* %135, align 4
  %137 = icmp sgt i32 %133, %136
  %138 = zext i1 %137 to i32
  %139 = load i32* %all_in, align 4
  %140 = and i32 %139, %138
  store i32 %140, i32* %all_in, align 4
  %141 = load %union.int_mv** %4, align 8
  %142 = bitcast %union.int_mv* %141 to %struct.MV*
  %143 = getelementptr inbounds %struct.MV* %142, i32 0, i32 1
  %144 = load i16* %143, align 2
  %145 = sext i16 %144 to i32
  %146 = add nsw i32 %145, 1
  %147 = load %struct.macroblock** %1, align 8
  %148 = getelementptr inbounds %struct.macroblock* %147, i32 0, i32 32
  %149 = load i32* %148, align 4
  %150 = icmp slt i32 %146, %149
  %151 = zext i1 %150 to i32
  %152 = load i32* %all_in, align 4
  %153 = and i32 %152, %151
  store i32 %153, i32* %all_in, align 4
  %154 = load i32* %all_in, align 4
  %155 = icmp ne i32 %154, 0
  br i1 %155, label %156, label %249

; <label>:156                                     ; preds = %101
  %157 = load i8** %best_address, align 8
  %158 = load i32* %in_what_stride, align 4
  %159 = sext i32 %158 to i64
  %160 = sub i64 0, %159
  %161 = getelementptr inbounds i8* %157, i64 %160
  %162 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 0
  store i8* %161, i8** %162, align 8
  %163 = load i8** %best_address, align 8
  %164 = getelementptr inbounds i8* %163, i64 -1
  %165 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 1
  store i8* %164, i8** %165, align 8
  %166 = load i8** %best_address, align 8
  %167 = getelementptr inbounds i8* %166, i64 1
  %168 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 2
  store i8* %167, i8** %168, align 8
  %169 = load i8** %best_address, align 8
  %170 = load i32* %in_what_stride, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds i8* %169, i64 %171
  %173 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 3
  store i8* %172, i8** %173, align 8
  %174 = load %struct.variance_vtable** %7, align 8
  %175 = getelementptr inbounds %struct.variance_vtable* %174, i32 0, i32 8
  %176 = load void (i8*, i32, i8**, i32, i32*)** %175, align 8
  %177 = load i8** %what, align 8
  %178 = load i32* %what_stride, align 4
  %179 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i32 0
  %180 = load i32* %in_what_stride, align 4
  %181 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i32 0
  call void %176(i8* %177, i32 %178, i8** %179, i32 %180, i32* %181)
  store i32 0, i32* %j, align 4
  br label %182

; <label>:182                                     ; preds = %245, %156
  %183 = load i32* %j, align 4
  %184 = icmp slt i32 %183, 4
  br i1 %184, label %185, label %248

; <label>:185                                     ; preds = %182
  %186 = load i32* %j, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %187
  %189 = load i32* %188, align 4
  %190 = load i32* %bestsad, align 4
  %191 = icmp ult i32 %189, %190
  br i1 %191, label %192, label %244

; <label>:192                                     ; preds = %185
  %193 = load %union.int_mv** %4, align 8
  %194 = bitcast %union.int_mv* %193 to %struct.MV*
  %195 = getelementptr inbounds %struct.MV* %194, i32 0, i32 0
  %196 = load i16* %195, align 2
  %197 = sext i16 %196 to i32
  %198 = load i32* %j, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %199
  %201 = getelementptr inbounds %struct.MV* %200, i32 0, i32 0
  %202 = load i16* %201, align 2
  %203 = sext i16 %202 to i32
  %204 = add nsw i32 %197, %203
  %205 = trunc i32 %204 to i16
  %206 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %207 = getelementptr inbounds %struct.MV* %206, i32 0, i32 0
  store i16 %205, i16* %207, align 2
  %208 = load %union.int_mv** %4, align 8
  %209 = bitcast %union.int_mv* %208 to %struct.MV*
  %210 = getelementptr inbounds %struct.MV* %209, i32 0, i32 1
  %211 = load i16* %210, align 2
  %212 = sext i16 %211 to i32
  %213 = load i32* %j, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %214
  %216 = getelementptr inbounds %struct.MV* %215, i32 0, i32 1
  %217 = load i16* %216, align 2
  %218 = sext i16 %217 to i32
  %219 = add nsw i32 %212, %218
  %220 = trunc i32 %219 to i16
  %221 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %222 = getelementptr inbounds %struct.MV* %221, i32 0, i32 1
  store i16 %220, i16* %222, align 2
  %223 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %224 = load i32* %5, align 4
  %225 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %223, i32 %224)
  %226 = load i32* %j, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %227
  %229 = load i32* %228, align 4
  %230 = add i32 %229, %225
  store i32 %230, i32* %228, align 4
  %231 = load i32* %j, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %232
  %234 = load i32* %233, align 4
  %235 = load i32* %bestsad, align 4
  %236 = icmp ult i32 %234, %235
  br i1 %236, label %237, label %243

; <label>:237                                     ; preds = %192
  %238 = load i32* %j, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %239
  %241 = load i32* %240, align 4
  store i32 %241, i32* %bestsad, align 4
  %242 = load i32* %j, align 4
  store i32 %242, i32* %best_site, align 4
  br label %243

; <label>:243                                     ; preds = %237, %192
  br label %244

; <label>:244                                     ; preds = %243, %185
  br label %245

; <label>:245                                     ; preds = %244
  %246 = load i32* %j, align 4
  %247 = add nsw i32 %246, 1
  store i32 %247, i32* %j, align 4
  br label %182

; <label>:248                                     ; preds = %182
  br label %363

; <label>:249                                     ; preds = %101
  store i32 0, i32* %j, align 4
  br label %250

; <label>:250                                     ; preds = %359, %249
  %251 = load i32* %j, align 4
  %252 = icmp slt i32 %251, 4
  br i1 %252, label %253, label %362

; <label>:253                                     ; preds = %250
  %254 = load %union.int_mv** %4, align 8
  %255 = bitcast %union.int_mv* %254 to %struct.MV*
  %256 = getelementptr inbounds %struct.MV* %255, i32 0, i32 0
  %257 = load i16* %256, align 2
  %258 = sext i16 %257 to i32
  %259 = load i32* %j, align 4
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %260
  %262 = getelementptr inbounds %struct.MV* %261, i32 0, i32 0
  %263 = load i16* %262, align 2
  %264 = sext i16 %263 to i32
  %265 = add nsw i32 %258, %264
  %266 = trunc i32 %265 to i16
  store i16 %266, i16* %this_row_offset, align 2
  %267 = load %union.int_mv** %4, align 8
  %268 = bitcast %union.int_mv* %267 to %struct.MV*
  %269 = getelementptr inbounds %struct.MV* %268, i32 0, i32 1
  %270 = load i16* %269, align 2
  %271 = sext i16 %270 to i32
  %272 = load i32* %j, align 4
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %273
  %275 = getelementptr inbounds %struct.MV* %274, i32 0, i32 1
  %276 = load i16* %275, align 2
  %277 = sext i16 %276 to i32
  %278 = add nsw i32 %271, %277
  %279 = trunc i32 %278 to i16
  store i16 %279, i16* %this_col_offset, align 2
  %280 = load i16* %this_col_offset, align 2
  %281 = sext i16 %280 to i32
  %282 = load %struct.macroblock** %1, align 8
  %283 = getelementptr inbounds %struct.macroblock* %282, i32 0, i32 31
  %284 = load i32* %283, align 4
  %285 = icmp sgt i32 %281, %284
  br i1 %285, label %286, label %358

; <label>:286                                     ; preds = %253
  %287 = load i16* %this_col_offset, align 2
  %288 = sext i16 %287 to i32
  %289 = load %struct.macroblock** %1, align 8
  %290 = getelementptr inbounds %struct.macroblock* %289, i32 0, i32 32
  %291 = load i32* %290, align 4
  %292 = icmp slt i32 %288, %291
  br i1 %292, label %293, label %358

; <label>:293                                     ; preds = %286
  %294 = load i16* %this_row_offset, align 2
  %295 = sext i16 %294 to i32
  %296 = load %struct.macroblock** %1, align 8
  %297 = getelementptr inbounds %struct.macroblock* %296, i32 0, i32 33
  %298 = load i32* %297, align 4
  %299 = icmp sgt i32 %295, %298
  br i1 %299, label %300, label %358

; <label>:300                                     ; preds = %293
  %301 = load i16* %this_row_offset, align 2
  %302 = sext i16 %301 to i32
  %303 = load %struct.macroblock** %1, align 8
  %304 = getelementptr inbounds %struct.macroblock* %303, i32 0, i32 34
  %305 = load i32* %304, align 4
  %306 = icmp slt i32 %302, %305
  br i1 %306, label %307, label %358

; <label>:307                                     ; preds = %300
  %308 = load i32* %j, align 4
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %309
  %311 = getelementptr inbounds %struct.MV* %310, i32 0, i32 0
  %312 = load i16* %311, align 2
  %313 = sext i16 %312 to i32
  %314 = load i32* %in_what_stride, align 4
  %315 = mul nsw i32 %313, %314
  %316 = load i32* %j, align 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %317
  %319 = getelementptr inbounds %struct.MV* %318, i32 0, i32 1
  %320 = load i16* %319, align 2
  %321 = sext i16 %320 to i32
  %322 = add nsw i32 %315, %321
  %323 = load i8** %best_address, align 8
  %324 = sext i32 %322 to i64
  %325 = getelementptr inbounds i8* %323, i64 %324
  store i8* %325, i8** %check_here, align 8
  %326 = load %struct.variance_vtable** %7, align 8
  %327 = getelementptr inbounds %struct.variance_vtable* %326, i32 0, i32 0
  %328 = load i32 (i8*, i32, i8*, i32, i32)** %327, align 8
  %329 = load i8** %what, align 8
  %330 = load i32* %what_stride, align 4
  %331 = load i8** %check_here, align 8
  %332 = load i32* %in_what_stride, align 4
  %333 = load i32* %bestsad, align 4
  %334 = call i32 %328(i8* %329, i32 %330, i8* %331, i32 %332, i32 %333)
  store i32 %334, i32* %thissad, align 4
  %335 = load i32* %thissad, align 4
  %336 = load i32* %bestsad, align 4
  %337 = icmp ult i32 %335, %336
  br i1 %337, label %338, label %357

; <label>:338                                     ; preds = %307
  %339 = load i16* %this_row_offset, align 2
  %340 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %341 = getelementptr inbounds %struct.MV* %340, i32 0, i32 0
  store i16 %339, i16* %341, align 2
  %342 = load i16* %this_col_offset, align 2
  %343 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %344 = getelementptr inbounds %struct.MV* %343, i32 0, i32 1
  store i16 %342, i16* %344, align 2
  %345 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0
  %346 = load i32* %5, align 4
  %347 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %345, i32 %346)
  %348 = load i32* %thissad, align 4
  %349 = add i32 %348, %347
  store i32 %349, i32* %thissad, align 4
  %350 = load i32* %thissad, align 4
  %351 = load i32* %bestsad, align 4
  %352 = icmp ult i32 %350, %351
  br i1 %352, label %353, label %356

; <label>:353                                     ; preds = %338
  %354 = load i32* %thissad, align 4
  store i32 %354, i32* %bestsad, align 4
  %355 = load i32* %j, align 4
  store i32 %355, i32* %best_site, align 4
  br label %356

; <label>:356                                     ; preds = %353, %338
  br label %357

; <label>:357                                     ; preds = %356, %307
  br label %358

; <label>:358                                     ; preds = %357, %300, %293, %286, %253
  br label %359

; <label>:359                                     ; preds = %358
  %360 = load i32* %j, align 4
  %361 = add nsw i32 %360, 1
  store i32 %361, i32* %j, align 4
  br label %250

; <label>:362                                     ; preds = %250
  br label %363

; <label>:363                                     ; preds = %362, %248
  %364 = load i32* %best_site, align 4
  %365 = icmp eq i32 %364, -1
  br i1 %365, label %366, label %367

; <label>:366                                     ; preds = %363
  br label %416

; <label>:367                                     ; preds = %363
  %368 = load i32* %best_site, align 4
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %369
  %371 = getelementptr inbounds %struct.MV* %370, i32 0, i32 0
  %372 = load i16* %371, align 2
  %373 = sext i16 %372 to i32
  %374 = load %union.int_mv** %4, align 8
  %375 = bitcast %union.int_mv* %374 to %struct.MV*
  %376 = getelementptr inbounds %struct.MV* %375, i32 0, i32 0
  %377 = load i16* %376, align 2
  %378 = sext i16 %377 to i32
  %379 = add nsw i32 %378, %373
  %380 = trunc i32 %379 to i16
  store i16 %380, i16* %376, align 2
  %381 = load i32* %best_site, align 4
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %382
  %384 = getelementptr inbounds %struct.MV* %383, i32 0, i32 1
  %385 = load i16* %384, align 2
  %386 = sext i16 %385 to i32
  %387 = load %union.int_mv** %4, align 8
  %388 = bitcast %union.int_mv* %387 to %struct.MV*
  %389 = getelementptr inbounds %struct.MV* %388, i32 0, i32 1
  %390 = load i16* %389, align 2
  %391 = sext i16 %390 to i32
  %392 = add nsw i32 %391, %386
  %393 = trunc i32 %392 to i16
  store i16 %393, i16* %389, align 2
  %394 = load i32* %best_site, align 4
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %395
  %397 = getelementptr inbounds %struct.MV* %396, i32 0, i32 0
  %398 = load i16* %397, align 2
  %399 = sext i16 %398 to i32
  %400 = load i32* %in_what_stride, align 4
  %401 = mul nsw i32 %399, %400
  %402 = load i32* %best_site, align 4
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %403
  %405 = getelementptr inbounds %struct.MV* %404, i32 0, i32 1
  %406 = load i16* %405, align 2
  %407 = sext i16 %406 to i32
  %408 = add nsw i32 %401, %407
  %409 = load i8** %best_address, align 8
  %410 = sext i32 %408 to i64
  %411 = getelementptr inbounds i8* %409, i64 %410
  store i8* %411, i8** %best_address, align 8
  br label %412

; <label>:412                                     ; preds = %367
  br label %413

; <label>:413                                     ; preds = %412
  %414 = load i32* %i, align 4
  %415 = add nsw i32 %414, 1
  store i32 %415, i32* %i, align 4
  br label %97

; <label>:416                                     ; preds = %366, %97
  %417 = load %union.int_mv** %4, align 8
  %418 = bitcast %union.int_mv* %417 to %struct.MV*
  %419 = getelementptr inbounds %struct.MV* %418, i32 0, i32 0
  %420 = load i16* %419, align 2
  %421 = sext i16 %420 to i32
  %422 = mul nsw i32 %421, 8
  %423 = trunc i32 %422 to i16
  %424 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %425 = getelementptr inbounds %struct.MV* %424, i32 0, i32 0
  store i16 %423, i16* %425, align 2
  %426 = load %union.int_mv** %4, align 8
  %427 = bitcast %union.int_mv* %426 to %struct.MV*
  %428 = getelementptr inbounds %struct.MV* %427, i32 0, i32 1
  %429 = load i16* %428, align 2
  %430 = sext i16 %429 to i32
  %431 = mul nsw i32 %430, 8
  %432 = trunc i32 %431 to i16
  %433 = bitcast %union.int_mv* %this_mv to %struct.MV*
  %434 = getelementptr inbounds %struct.MV* %433, i32 0, i32 1
  store i16 %432, i16* %434, align 2
  %435 = load %struct.variance_vtable** %7, align 8
  %436 = getelementptr inbounds %struct.variance_vtable* %435, i32 0, i32 1
  %437 = load i32 (i8*, i32, i8*, i32, i32*)** %436, align 8
  %438 = load i8** %what, align 8
  %439 = load i32* %what_stride, align 4
  %440 = load i8** %best_address, align 8
  %441 = load i32* %in_what_stride, align 4
  %442 = call i32 %437(i8* %438, i32 %439, i8* %440, i32 %441, i32* %thissad)
  %443 = load %union.int_mv** %9, align 8
  %444 = load i32*** %8, align 8
  %445 = load %struct.macroblock** %1, align 8
  %446 = getelementptr inbounds %struct.macroblock* %445, i32 0, i32 15
  %447 = load i32* %446, align 4
  %448 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %443, i32** %444, i32 %447)
  %449 = add i32 %442, %448
  ret i32 %449
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
