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
  call void @llvm.dbg.declare(metadata %union.int_mv** %1, metadata !505, metadata !506), !dbg !507
  store %union.int_mv* %ref, %union.int_mv** %2, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %2, metadata !508, metadata !506), !dbg !509
  store i32** %mvcost, i32*** %3, align 8
  call void @llvm.dbg.declare(metadata i32*** %3, metadata !510, metadata !506), !dbg !511
  store i32 %Weight, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !512, metadata !506), !dbg !513
  %5 = load %union.int_mv** %1, align 8, !dbg !514
  %6 = bitcast %union.int_mv* %5 to %struct.MV*, !dbg !514
  %7 = getelementptr inbounds %struct.MV* %6, i32 0, i32 0, !dbg !514
  %8 = load i16* %7, align 2, !dbg !514
  %9 = sext i16 %8 to i32, !dbg !514
  %10 = load %union.int_mv** %2, align 8, !dbg !515
  %11 = bitcast %union.int_mv* %10 to %struct.MV*, !dbg !515
  %12 = getelementptr inbounds %struct.MV* %11, i32 0, i32 0, !dbg !515
  %13 = load i16* %12, align 2, !dbg !515
  %14 = sext i16 %13 to i32, !dbg !515
  %15 = sub nsw i32 %9, %14, !dbg !514
  %16 = ashr i32 %15, 1, !dbg !516
  %17 = sext i32 %16 to i64, !dbg !517
  %18 = load i32*** %3, align 8, !dbg !517
  %19 = getelementptr inbounds i32** %18, i64 0, !dbg !517
  %20 = load i32** %19, align 8, !dbg !517
  %21 = getelementptr inbounds i32* %20, i64 %17, !dbg !517
  %22 = load i32* %21, align 4, !dbg !517
  %23 = load %union.int_mv** %1, align 8, !dbg !518
  %24 = bitcast %union.int_mv* %23 to %struct.MV*, !dbg !518
  %25 = getelementptr inbounds %struct.MV* %24, i32 0, i32 1, !dbg !518
  %26 = load i16* %25, align 2, !dbg !518
  %27 = sext i16 %26 to i32, !dbg !518
  %28 = load %union.int_mv** %2, align 8, !dbg !519
  %29 = bitcast %union.int_mv* %28 to %struct.MV*, !dbg !519
  %30 = getelementptr inbounds %struct.MV* %29, i32 0, i32 1, !dbg !519
  %31 = load i16* %30, align 2, !dbg !519
  %32 = sext i16 %31 to i32, !dbg !519
  %33 = sub nsw i32 %27, %32, !dbg !518
  %34 = ashr i32 %33, 1, !dbg !520
  %35 = sext i32 %34 to i64, !dbg !521
  %36 = load i32*** %3, align 8, !dbg !521
  %37 = getelementptr inbounds i32** %36, i64 1, !dbg !521
  %38 = load i32** %37, align 8, !dbg !521
  %39 = getelementptr inbounds i32* %38, i64 %35, !dbg !521
  %40 = load i32* %39, align 4, !dbg !521
  %41 = add nsw i32 %22, %40, !dbg !517
  %42 = load i32* %4, align 4, !dbg !522
  %43 = mul nsw i32 %41, %42, !dbg !523
  %44 = ashr i32 %43, 7, !dbg !524
  ret i32 %44, !dbg !525
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @vp8_init_dsmotion_compensation(%struct.macroblock* %x, i32 %stride) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca i32, align 4
  %Len = alloca i32, align 4
  %search_site_count = alloca i32, align 4
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  call void @llvm.dbg.declare(metadata %struct.macroblock** %1, metadata !526, metadata !506), !dbg !527
  store i32 %stride, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !528, metadata !506), !dbg !529
  call void @llvm.dbg.declare(metadata i32* %Len, metadata !530, metadata !506), !dbg !531
  call void @llvm.dbg.declare(metadata i32* %search_site_count, metadata !532, metadata !506), !dbg !533
  store i32 0, i32* %search_site_count, align 4, !dbg !533
  store i32 128, i32* %Len, align 4, !dbg !534
  %3 = load i32* %search_site_count, align 4, !dbg !535
  %4 = sext i32 %3 to i64, !dbg !536
  %5 = load %struct.macroblock** %1, align 8, !dbg !536
  %6 = getelementptr inbounds %struct.macroblock* %5, i32 0, i32 12, !dbg !536
  %7 = load %struct.search_site** %6, align 8, !dbg !536
  %8 = getelementptr inbounds %struct.search_site* %7, i64 %4, !dbg !536
  %9 = getelementptr inbounds %struct.search_site* %8, i32 0, i32 0, !dbg !536
  %10 = getelementptr inbounds %struct.MV* %9, i32 0, i32 1, !dbg !536
  store i16 0, i16* %10, align 2, !dbg !536
  %11 = load i32* %search_site_count, align 4, !dbg !537
  %12 = sext i32 %11 to i64, !dbg !538
  %13 = load %struct.macroblock** %1, align 8, !dbg !538
  %14 = getelementptr inbounds %struct.macroblock* %13, i32 0, i32 12, !dbg !538
  %15 = load %struct.search_site** %14, align 8, !dbg !538
  %16 = getelementptr inbounds %struct.search_site* %15, i64 %12, !dbg !538
  %17 = getelementptr inbounds %struct.search_site* %16, i32 0, i32 0, !dbg !538
  %18 = getelementptr inbounds %struct.MV* %17, i32 0, i32 0, !dbg !538
  store i16 0, i16* %18, align 2, !dbg !538
  %19 = load i32* %search_site_count, align 4, !dbg !539
  %20 = sext i32 %19 to i64, !dbg !540
  %21 = load %struct.macroblock** %1, align 8, !dbg !540
  %22 = getelementptr inbounds %struct.macroblock* %21, i32 0, i32 12, !dbg !540
  %23 = load %struct.search_site** %22, align 8, !dbg !540
  %24 = getelementptr inbounds %struct.search_site* %23, i64 %20, !dbg !540
  %25 = getelementptr inbounds %struct.search_site* %24, i32 0, i32 1, !dbg !540
  store i32 0, i32* %25, align 4, !dbg !540
  %26 = load i32* %search_site_count, align 4, !dbg !541
  %27 = add nsw i32 %26, 1, !dbg !541
  store i32 %27, i32* %search_site_count, align 4, !dbg !541
  br label %28, !dbg !542

; <label>:28                                      ; preds = %31, %0
  %29 = load i32* %Len, align 4, !dbg !543
  %30 = icmp sgt i32 %29, 0, !dbg !543
  br i1 %30, label %31, label %154, !dbg !542

; <label>:31                                      ; preds = %28
  %32 = load i32* %search_site_count, align 4, !dbg !546
  %33 = sext i32 %32 to i64, !dbg !548
  %34 = load %struct.macroblock** %1, align 8, !dbg !548
  %35 = getelementptr inbounds %struct.macroblock* %34, i32 0, i32 12, !dbg !548
  %36 = load %struct.search_site** %35, align 8, !dbg !548
  %37 = getelementptr inbounds %struct.search_site* %36, i64 %33, !dbg !548
  %38 = getelementptr inbounds %struct.search_site* %37, i32 0, i32 0, !dbg !548
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 1, !dbg !548
  store i16 0, i16* %39, align 2, !dbg !548
  %40 = load i32* %Len, align 4, !dbg !549
  %41 = sub nsw i32 0, %40, !dbg !550
  %42 = trunc i32 %41 to i16, !dbg !550
  %43 = load i32* %search_site_count, align 4, !dbg !551
  %44 = sext i32 %43 to i64, !dbg !552
  %45 = load %struct.macroblock** %1, align 8, !dbg !552
  %46 = getelementptr inbounds %struct.macroblock* %45, i32 0, i32 12, !dbg !552
  %47 = load %struct.search_site** %46, align 8, !dbg !552
  %48 = getelementptr inbounds %struct.search_site* %47, i64 %44, !dbg !552
  %49 = getelementptr inbounds %struct.search_site* %48, i32 0, i32 0, !dbg !552
  %50 = getelementptr inbounds %struct.MV* %49, i32 0, i32 0, !dbg !552
  store i16 %42, i16* %50, align 2, !dbg !552
  %51 = load i32* %Len, align 4, !dbg !553
  %52 = sub nsw i32 0, %51, !dbg !554
  %53 = load i32* %2, align 4, !dbg !555
  %54 = mul nsw i32 %52, %53, !dbg !554
  %55 = load i32* %search_site_count, align 4, !dbg !556
  %56 = sext i32 %55 to i64, !dbg !557
  %57 = load %struct.macroblock** %1, align 8, !dbg !557
  %58 = getelementptr inbounds %struct.macroblock* %57, i32 0, i32 12, !dbg !557
  %59 = load %struct.search_site** %58, align 8, !dbg !557
  %60 = getelementptr inbounds %struct.search_site* %59, i64 %56, !dbg !557
  %61 = getelementptr inbounds %struct.search_site* %60, i32 0, i32 1, !dbg !557
  store i32 %54, i32* %61, align 4, !dbg !557
  %62 = load i32* %search_site_count, align 4, !dbg !558
  %63 = add nsw i32 %62, 1, !dbg !558
  store i32 %63, i32* %search_site_count, align 4, !dbg !558
  %64 = load i32* %search_site_count, align 4, !dbg !559
  %65 = sext i32 %64 to i64, !dbg !560
  %66 = load %struct.macroblock** %1, align 8, !dbg !560
  %67 = getelementptr inbounds %struct.macroblock* %66, i32 0, i32 12, !dbg !560
  %68 = load %struct.search_site** %67, align 8, !dbg !560
  %69 = getelementptr inbounds %struct.search_site* %68, i64 %65, !dbg !560
  %70 = getelementptr inbounds %struct.search_site* %69, i32 0, i32 0, !dbg !560
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 1, !dbg !560
  store i16 0, i16* %71, align 2, !dbg !560
  %72 = load i32* %Len, align 4, !dbg !561
  %73 = trunc i32 %72 to i16, !dbg !561
  %74 = load i32* %search_site_count, align 4, !dbg !562
  %75 = sext i32 %74 to i64, !dbg !563
  %76 = load %struct.macroblock** %1, align 8, !dbg !563
  %77 = getelementptr inbounds %struct.macroblock* %76, i32 0, i32 12, !dbg !563
  %78 = load %struct.search_site** %77, align 8, !dbg !563
  %79 = getelementptr inbounds %struct.search_site* %78, i64 %75, !dbg !563
  %80 = getelementptr inbounds %struct.search_site* %79, i32 0, i32 0, !dbg !563
  %81 = getelementptr inbounds %struct.MV* %80, i32 0, i32 0, !dbg !563
  store i16 %73, i16* %81, align 2, !dbg !563
  %82 = load i32* %Len, align 4, !dbg !564
  %83 = load i32* %2, align 4, !dbg !565
  %84 = mul nsw i32 %82, %83, !dbg !564
  %85 = load i32* %search_site_count, align 4, !dbg !566
  %86 = sext i32 %85 to i64, !dbg !567
  %87 = load %struct.macroblock** %1, align 8, !dbg !567
  %88 = getelementptr inbounds %struct.macroblock* %87, i32 0, i32 12, !dbg !567
  %89 = load %struct.search_site** %88, align 8, !dbg !567
  %90 = getelementptr inbounds %struct.search_site* %89, i64 %86, !dbg !567
  %91 = getelementptr inbounds %struct.search_site* %90, i32 0, i32 1, !dbg !567
  store i32 %84, i32* %91, align 4, !dbg !567
  %92 = load i32* %search_site_count, align 4, !dbg !568
  %93 = add nsw i32 %92, 1, !dbg !568
  store i32 %93, i32* %search_site_count, align 4, !dbg !568
  %94 = load i32* %Len, align 4, !dbg !569
  %95 = sub nsw i32 0, %94, !dbg !570
  %96 = trunc i32 %95 to i16, !dbg !570
  %97 = load i32* %search_site_count, align 4, !dbg !571
  %98 = sext i32 %97 to i64, !dbg !572
  %99 = load %struct.macroblock** %1, align 8, !dbg !572
  %100 = getelementptr inbounds %struct.macroblock* %99, i32 0, i32 12, !dbg !572
  %101 = load %struct.search_site** %100, align 8, !dbg !572
  %102 = getelementptr inbounds %struct.search_site* %101, i64 %98, !dbg !572
  %103 = getelementptr inbounds %struct.search_site* %102, i32 0, i32 0, !dbg !572
  %104 = getelementptr inbounds %struct.MV* %103, i32 0, i32 1, !dbg !572
  store i16 %96, i16* %104, align 2, !dbg !572
  %105 = load i32* %search_site_count, align 4, !dbg !573
  %106 = sext i32 %105 to i64, !dbg !574
  %107 = load %struct.macroblock** %1, align 8, !dbg !574
  %108 = getelementptr inbounds %struct.macroblock* %107, i32 0, i32 12, !dbg !574
  %109 = load %struct.search_site** %108, align 8, !dbg !574
  %110 = getelementptr inbounds %struct.search_site* %109, i64 %106, !dbg !574
  %111 = getelementptr inbounds %struct.search_site* %110, i32 0, i32 0, !dbg !574
  %112 = getelementptr inbounds %struct.MV* %111, i32 0, i32 0, !dbg !574
  store i16 0, i16* %112, align 2, !dbg !574
  %113 = load i32* %Len, align 4, !dbg !575
  %114 = sub nsw i32 0, %113, !dbg !576
  %115 = load i32* %search_site_count, align 4, !dbg !577
  %116 = sext i32 %115 to i64, !dbg !578
  %117 = load %struct.macroblock** %1, align 8, !dbg !578
  %118 = getelementptr inbounds %struct.macroblock* %117, i32 0, i32 12, !dbg !578
  %119 = load %struct.search_site** %118, align 8, !dbg !578
  %120 = getelementptr inbounds %struct.search_site* %119, i64 %116, !dbg !578
  %121 = getelementptr inbounds %struct.search_site* %120, i32 0, i32 1, !dbg !578
  store i32 %114, i32* %121, align 4, !dbg !578
  %122 = load i32* %search_site_count, align 4, !dbg !579
  %123 = add nsw i32 %122, 1, !dbg !579
  store i32 %123, i32* %search_site_count, align 4, !dbg !579
  %124 = load i32* %Len, align 4, !dbg !580
  %125 = trunc i32 %124 to i16, !dbg !580
  %126 = load i32* %search_site_count, align 4, !dbg !581
  %127 = sext i32 %126 to i64, !dbg !582
  %128 = load %struct.macroblock** %1, align 8, !dbg !582
  %129 = getelementptr inbounds %struct.macroblock* %128, i32 0, i32 12, !dbg !582
  %130 = load %struct.search_site** %129, align 8, !dbg !582
  %131 = getelementptr inbounds %struct.search_site* %130, i64 %127, !dbg !582
  %132 = getelementptr inbounds %struct.search_site* %131, i32 0, i32 0, !dbg !582
  %133 = getelementptr inbounds %struct.MV* %132, i32 0, i32 1, !dbg !582
  store i16 %125, i16* %133, align 2, !dbg !582
  %134 = load i32* %search_site_count, align 4, !dbg !583
  %135 = sext i32 %134 to i64, !dbg !584
  %136 = load %struct.macroblock** %1, align 8, !dbg !584
  %137 = getelementptr inbounds %struct.macroblock* %136, i32 0, i32 12, !dbg !584
  %138 = load %struct.search_site** %137, align 8, !dbg !584
  %139 = getelementptr inbounds %struct.search_site* %138, i64 %135, !dbg !584
  %140 = getelementptr inbounds %struct.search_site* %139, i32 0, i32 0, !dbg !584
  %141 = getelementptr inbounds %struct.MV* %140, i32 0, i32 0, !dbg !584
  store i16 0, i16* %141, align 2, !dbg !584
  %142 = load i32* %Len, align 4, !dbg !585
  %143 = load i32* %search_site_count, align 4, !dbg !586
  %144 = sext i32 %143 to i64, !dbg !587
  %145 = load %struct.macroblock** %1, align 8, !dbg !587
  %146 = getelementptr inbounds %struct.macroblock* %145, i32 0, i32 12, !dbg !587
  %147 = load %struct.search_site** %146, align 8, !dbg !587
  %148 = getelementptr inbounds %struct.search_site* %147, i64 %144, !dbg !587
  %149 = getelementptr inbounds %struct.search_site* %148, i32 0, i32 1, !dbg !587
  store i32 %142, i32* %149, align 4, !dbg !587
  %150 = load i32* %search_site_count, align 4, !dbg !588
  %151 = add nsw i32 %150, 1, !dbg !588
  store i32 %151, i32* %search_site_count, align 4, !dbg !588
  %152 = load i32* %Len, align 4, !dbg !589
  %153 = sdiv i32 %152, 2, !dbg !589
  store i32 %153, i32* %Len, align 4, !dbg !589
  br label %28, !dbg !542

; <label>:154                                     ; preds = %28
  %155 = load i32* %search_site_count, align 4, !dbg !590
  %156 = load %struct.macroblock** %1, align 8, !dbg !591
  %157 = getelementptr inbounds %struct.macroblock* %156, i32 0, i32 13, !dbg !591
  store i32 %155, i32* %157, align 4, !dbg !591
  %158 = load %struct.macroblock** %1, align 8, !dbg !592
  %159 = getelementptr inbounds %struct.macroblock* %158, i32 0, i32 14, !dbg !592
  store i32 4, i32* %159, align 4, !dbg !592
  ret void, !dbg !593
}

; Function Attrs: nounwind uwtable
define void @vp8_init3smotion_compensation(%struct.macroblock* %x, i32 %stride) #0 {
  %1 = alloca %struct.macroblock*, align 8
  %2 = alloca i32, align 4
  %Len = alloca i32, align 4
  %search_site_count = alloca i32, align 4
  store %struct.macroblock* %x, %struct.macroblock** %1, align 8
  call void @llvm.dbg.declare(metadata %struct.macroblock** %1, metadata !594, metadata !506), !dbg !595
  store i32 %stride, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !596, metadata !506), !dbg !597
  call void @llvm.dbg.declare(metadata i32* %Len, metadata !598, metadata !506), !dbg !599
  call void @llvm.dbg.declare(metadata i32* %search_site_count, metadata !600, metadata !506), !dbg !601
  store i32 0, i32* %search_site_count, align 4, !dbg !601
  store i32 128, i32* %Len, align 4, !dbg !602
  %3 = load i32* %search_site_count, align 4, !dbg !603
  %4 = sext i32 %3 to i64, !dbg !604
  %5 = load %struct.macroblock** %1, align 8, !dbg !604
  %6 = getelementptr inbounds %struct.macroblock* %5, i32 0, i32 12, !dbg !604
  %7 = load %struct.search_site** %6, align 8, !dbg !604
  %8 = getelementptr inbounds %struct.search_site* %7, i64 %4, !dbg !604
  %9 = getelementptr inbounds %struct.search_site* %8, i32 0, i32 0, !dbg !604
  %10 = getelementptr inbounds %struct.MV* %9, i32 0, i32 1, !dbg !604
  store i16 0, i16* %10, align 2, !dbg !604
  %11 = load i32* %search_site_count, align 4, !dbg !605
  %12 = sext i32 %11 to i64, !dbg !606
  %13 = load %struct.macroblock** %1, align 8, !dbg !606
  %14 = getelementptr inbounds %struct.macroblock* %13, i32 0, i32 12, !dbg !606
  %15 = load %struct.search_site** %14, align 8, !dbg !606
  %16 = getelementptr inbounds %struct.search_site* %15, i64 %12, !dbg !606
  %17 = getelementptr inbounds %struct.search_site* %16, i32 0, i32 0, !dbg !606
  %18 = getelementptr inbounds %struct.MV* %17, i32 0, i32 0, !dbg !606
  store i16 0, i16* %18, align 2, !dbg !606
  %19 = load i32* %search_site_count, align 4, !dbg !607
  %20 = sext i32 %19 to i64, !dbg !608
  %21 = load %struct.macroblock** %1, align 8, !dbg !608
  %22 = getelementptr inbounds %struct.macroblock* %21, i32 0, i32 12, !dbg !608
  %23 = load %struct.search_site** %22, align 8, !dbg !608
  %24 = getelementptr inbounds %struct.search_site* %23, i64 %20, !dbg !608
  %25 = getelementptr inbounds %struct.search_site* %24, i32 0, i32 1, !dbg !608
  store i32 0, i32* %25, align 4, !dbg !608
  %26 = load i32* %search_site_count, align 4, !dbg !609
  %27 = add nsw i32 %26, 1, !dbg !609
  store i32 %27, i32* %search_site_count, align 4, !dbg !609
  br label %28, !dbg !610

; <label>:28                                      ; preds = %31, %0
  %29 = load i32* %Len, align 4, !dbg !611
  %30 = icmp sgt i32 %29, 0, !dbg !611
  br i1 %30, label %31, label %296, !dbg !610

; <label>:31                                      ; preds = %28
  %32 = load i32* %search_site_count, align 4, !dbg !614
  %33 = sext i32 %32 to i64, !dbg !616
  %34 = load %struct.macroblock** %1, align 8, !dbg !616
  %35 = getelementptr inbounds %struct.macroblock* %34, i32 0, i32 12, !dbg !616
  %36 = load %struct.search_site** %35, align 8, !dbg !616
  %37 = getelementptr inbounds %struct.search_site* %36, i64 %33, !dbg !616
  %38 = getelementptr inbounds %struct.search_site* %37, i32 0, i32 0, !dbg !616
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 1, !dbg !616
  store i16 0, i16* %39, align 2, !dbg !616
  %40 = load i32* %Len, align 4, !dbg !617
  %41 = sub nsw i32 0, %40, !dbg !618
  %42 = trunc i32 %41 to i16, !dbg !618
  %43 = load i32* %search_site_count, align 4, !dbg !619
  %44 = sext i32 %43 to i64, !dbg !620
  %45 = load %struct.macroblock** %1, align 8, !dbg !620
  %46 = getelementptr inbounds %struct.macroblock* %45, i32 0, i32 12, !dbg !620
  %47 = load %struct.search_site** %46, align 8, !dbg !620
  %48 = getelementptr inbounds %struct.search_site* %47, i64 %44, !dbg !620
  %49 = getelementptr inbounds %struct.search_site* %48, i32 0, i32 0, !dbg !620
  %50 = getelementptr inbounds %struct.MV* %49, i32 0, i32 0, !dbg !620
  store i16 %42, i16* %50, align 2, !dbg !620
  %51 = load i32* %Len, align 4, !dbg !621
  %52 = sub nsw i32 0, %51, !dbg !622
  %53 = load i32* %2, align 4, !dbg !623
  %54 = mul nsw i32 %52, %53, !dbg !622
  %55 = load i32* %search_site_count, align 4, !dbg !624
  %56 = sext i32 %55 to i64, !dbg !625
  %57 = load %struct.macroblock** %1, align 8, !dbg !625
  %58 = getelementptr inbounds %struct.macroblock* %57, i32 0, i32 12, !dbg !625
  %59 = load %struct.search_site** %58, align 8, !dbg !625
  %60 = getelementptr inbounds %struct.search_site* %59, i64 %56, !dbg !625
  %61 = getelementptr inbounds %struct.search_site* %60, i32 0, i32 1, !dbg !625
  store i32 %54, i32* %61, align 4, !dbg !625
  %62 = load i32* %search_site_count, align 4, !dbg !626
  %63 = add nsw i32 %62, 1, !dbg !626
  store i32 %63, i32* %search_site_count, align 4, !dbg !626
  %64 = load i32* %search_site_count, align 4, !dbg !627
  %65 = sext i32 %64 to i64, !dbg !628
  %66 = load %struct.macroblock** %1, align 8, !dbg !628
  %67 = getelementptr inbounds %struct.macroblock* %66, i32 0, i32 12, !dbg !628
  %68 = load %struct.search_site** %67, align 8, !dbg !628
  %69 = getelementptr inbounds %struct.search_site* %68, i64 %65, !dbg !628
  %70 = getelementptr inbounds %struct.search_site* %69, i32 0, i32 0, !dbg !628
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 1, !dbg !628
  store i16 0, i16* %71, align 2, !dbg !628
  %72 = load i32* %Len, align 4, !dbg !629
  %73 = trunc i32 %72 to i16, !dbg !629
  %74 = load i32* %search_site_count, align 4, !dbg !630
  %75 = sext i32 %74 to i64, !dbg !631
  %76 = load %struct.macroblock** %1, align 8, !dbg !631
  %77 = getelementptr inbounds %struct.macroblock* %76, i32 0, i32 12, !dbg !631
  %78 = load %struct.search_site** %77, align 8, !dbg !631
  %79 = getelementptr inbounds %struct.search_site* %78, i64 %75, !dbg !631
  %80 = getelementptr inbounds %struct.search_site* %79, i32 0, i32 0, !dbg !631
  %81 = getelementptr inbounds %struct.MV* %80, i32 0, i32 0, !dbg !631
  store i16 %73, i16* %81, align 2, !dbg !631
  %82 = load i32* %Len, align 4, !dbg !632
  %83 = load i32* %2, align 4, !dbg !633
  %84 = mul nsw i32 %82, %83, !dbg !632
  %85 = load i32* %search_site_count, align 4, !dbg !634
  %86 = sext i32 %85 to i64, !dbg !635
  %87 = load %struct.macroblock** %1, align 8, !dbg !635
  %88 = getelementptr inbounds %struct.macroblock* %87, i32 0, i32 12, !dbg !635
  %89 = load %struct.search_site** %88, align 8, !dbg !635
  %90 = getelementptr inbounds %struct.search_site* %89, i64 %86, !dbg !635
  %91 = getelementptr inbounds %struct.search_site* %90, i32 0, i32 1, !dbg !635
  store i32 %84, i32* %91, align 4, !dbg !635
  %92 = load i32* %search_site_count, align 4, !dbg !636
  %93 = add nsw i32 %92, 1, !dbg !636
  store i32 %93, i32* %search_site_count, align 4, !dbg !636
  %94 = load i32* %Len, align 4, !dbg !637
  %95 = sub nsw i32 0, %94, !dbg !638
  %96 = trunc i32 %95 to i16, !dbg !638
  %97 = load i32* %search_site_count, align 4, !dbg !639
  %98 = sext i32 %97 to i64, !dbg !640
  %99 = load %struct.macroblock** %1, align 8, !dbg !640
  %100 = getelementptr inbounds %struct.macroblock* %99, i32 0, i32 12, !dbg !640
  %101 = load %struct.search_site** %100, align 8, !dbg !640
  %102 = getelementptr inbounds %struct.search_site* %101, i64 %98, !dbg !640
  %103 = getelementptr inbounds %struct.search_site* %102, i32 0, i32 0, !dbg !640
  %104 = getelementptr inbounds %struct.MV* %103, i32 0, i32 1, !dbg !640
  store i16 %96, i16* %104, align 2, !dbg !640
  %105 = load i32* %search_site_count, align 4, !dbg !641
  %106 = sext i32 %105 to i64, !dbg !642
  %107 = load %struct.macroblock** %1, align 8, !dbg !642
  %108 = getelementptr inbounds %struct.macroblock* %107, i32 0, i32 12, !dbg !642
  %109 = load %struct.search_site** %108, align 8, !dbg !642
  %110 = getelementptr inbounds %struct.search_site* %109, i64 %106, !dbg !642
  %111 = getelementptr inbounds %struct.search_site* %110, i32 0, i32 0, !dbg !642
  %112 = getelementptr inbounds %struct.MV* %111, i32 0, i32 0, !dbg !642
  store i16 0, i16* %112, align 2, !dbg !642
  %113 = load i32* %Len, align 4, !dbg !643
  %114 = sub nsw i32 0, %113, !dbg !644
  %115 = load i32* %search_site_count, align 4, !dbg !645
  %116 = sext i32 %115 to i64, !dbg !646
  %117 = load %struct.macroblock** %1, align 8, !dbg !646
  %118 = getelementptr inbounds %struct.macroblock* %117, i32 0, i32 12, !dbg !646
  %119 = load %struct.search_site** %118, align 8, !dbg !646
  %120 = getelementptr inbounds %struct.search_site* %119, i64 %116, !dbg !646
  %121 = getelementptr inbounds %struct.search_site* %120, i32 0, i32 1, !dbg !646
  store i32 %114, i32* %121, align 4, !dbg !646
  %122 = load i32* %search_site_count, align 4, !dbg !647
  %123 = add nsw i32 %122, 1, !dbg !647
  store i32 %123, i32* %search_site_count, align 4, !dbg !647
  %124 = load i32* %Len, align 4, !dbg !648
  %125 = trunc i32 %124 to i16, !dbg !648
  %126 = load i32* %search_site_count, align 4, !dbg !649
  %127 = sext i32 %126 to i64, !dbg !650
  %128 = load %struct.macroblock** %1, align 8, !dbg !650
  %129 = getelementptr inbounds %struct.macroblock* %128, i32 0, i32 12, !dbg !650
  %130 = load %struct.search_site** %129, align 8, !dbg !650
  %131 = getelementptr inbounds %struct.search_site* %130, i64 %127, !dbg !650
  %132 = getelementptr inbounds %struct.search_site* %131, i32 0, i32 0, !dbg !650
  %133 = getelementptr inbounds %struct.MV* %132, i32 0, i32 1, !dbg !650
  store i16 %125, i16* %133, align 2, !dbg !650
  %134 = load i32* %search_site_count, align 4, !dbg !651
  %135 = sext i32 %134 to i64, !dbg !652
  %136 = load %struct.macroblock** %1, align 8, !dbg !652
  %137 = getelementptr inbounds %struct.macroblock* %136, i32 0, i32 12, !dbg !652
  %138 = load %struct.search_site** %137, align 8, !dbg !652
  %139 = getelementptr inbounds %struct.search_site* %138, i64 %135, !dbg !652
  %140 = getelementptr inbounds %struct.search_site* %139, i32 0, i32 0, !dbg !652
  %141 = getelementptr inbounds %struct.MV* %140, i32 0, i32 0, !dbg !652
  store i16 0, i16* %141, align 2, !dbg !652
  %142 = load i32* %Len, align 4, !dbg !653
  %143 = load i32* %search_site_count, align 4, !dbg !654
  %144 = sext i32 %143 to i64, !dbg !655
  %145 = load %struct.macroblock** %1, align 8, !dbg !655
  %146 = getelementptr inbounds %struct.macroblock* %145, i32 0, i32 12, !dbg !655
  %147 = load %struct.search_site** %146, align 8, !dbg !655
  %148 = getelementptr inbounds %struct.search_site* %147, i64 %144, !dbg !655
  %149 = getelementptr inbounds %struct.search_site* %148, i32 0, i32 1, !dbg !655
  store i32 %142, i32* %149, align 4, !dbg !655
  %150 = load i32* %search_site_count, align 4, !dbg !656
  %151 = add nsw i32 %150, 1, !dbg !656
  store i32 %151, i32* %search_site_count, align 4, !dbg !656
  %152 = load i32* %Len, align 4, !dbg !657
  %153 = sub nsw i32 0, %152, !dbg !658
  %154 = trunc i32 %153 to i16, !dbg !658
  %155 = load i32* %search_site_count, align 4, !dbg !659
  %156 = sext i32 %155 to i64, !dbg !660
  %157 = load %struct.macroblock** %1, align 8, !dbg !660
  %158 = getelementptr inbounds %struct.macroblock* %157, i32 0, i32 12, !dbg !660
  %159 = load %struct.search_site** %158, align 8, !dbg !660
  %160 = getelementptr inbounds %struct.search_site* %159, i64 %156, !dbg !660
  %161 = getelementptr inbounds %struct.search_site* %160, i32 0, i32 0, !dbg !660
  %162 = getelementptr inbounds %struct.MV* %161, i32 0, i32 1, !dbg !660
  store i16 %154, i16* %162, align 2, !dbg !660
  %163 = load i32* %Len, align 4, !dbg !661
  %164 = sub nsw i32 0, %163, !dbg !662
  %165 = trunc i32 %164 to i16, !dbg !662
  %166 = load i32* %search_site_count, align 4, !dbg !663
  %167 = sext i32 %166 to i64, !dbg !664
  %168 = load %struct.macroblock** %1, align 8, !dbg !664
  %169 = getelementptr inbounds %struct.macroblock* %168, i32 0, i32 12, !dbg !664
  %170 = load %struct.search_site** %169, align 8, !dbg !664
  %171 = getelementptr inbounds %struct.search_site* %170, i64 %167, !dbg !664
  %172 = getelementptr inbounds %struct.search_site* %171, i32 0, i32 0, !dbg !664
  %173 = getelementptr inbounds %struct.MV* %172, i32 0, i32 0, !dbg !664
  store i16 %165, i16* %173, align 2, !dbg !664
  %174 = load i32* %Len, align 4, !dbg !665
  %175 = sub nsw i32 0, %174, !dbg !666
  %176 = load i32* %2, align 4, !dbg !667
  %177 = mul nsw i32 %175, %176, !dbg !666
  %178 = load i32* %Len, align 4, !dbg !668
  %179 = sub nsw i32 %177, %178, !dbg !666
  %180 = load i32* %search_site_count, align 4, !dbg !669
  %181 = sext i32 %180 to i64, !dbg !670
  %182 = load %struct.macroblock** %1, align 8, !dbg !670
  %183 = getelementptr inbounds %struct.macroblock* %182, i32 0, i32 12, !dbg !670
  %184 = load %struct.search_site** %183, align 8, !dbg !670
  %185 = getelementptr inbounds %struct.search_site* %184, i64 %181, !dbg !670
  %186 = getelementptr inbounds %struct.search_site* %185, i32 0, i32 1, !dbg !670
  store i32 %179, i32* %186, align 4, !dbg !670
  %187 = load i32* %search_site_count, align 4, !dbg !671
  %188 = add nsw i32 %187, 1, !dbg !671
  store i32 %188, i32* %search_site_count, align 4, !dbg !671
  %189 = load i32* %Len, align 4, !dbg !672
  %190 = trunc i32 %189 to i16, !dbg !672
  %191 = load i32* %search_site_count, align 4, !dbg !673
  %192 = sext i32 %191 to i64, !dbg !674
  %193 = load %struct.macroblock** %1, align 8, !dbg !674
  %194 = getelementptr inbounds %struct.macroblock* %193, i32 0, i32 12, !dbg !674
  %195 = load %struct.search_site** %194, align 8, !dbg !674
  %196 = getelementptr inbounds %struct.search_site* %195, i64 %192, !dbg !674
  %197 = getelementptr inbounds %struct.search_site* %196, i32 0, i32 0, !dbg !674
  %198 = getelementptr inbounds %struct.MV* %197, i32 0, i32 1, !dbg !674
  store i16 %190, i16* %198, align 2, !dbg !674
  %199 = load i32* %Len, align 4, !dbg !675
  %200 = sub nsw i32 0, %199, !dbg !676
  %201 = trunc i32 %200 to i16, !dbg !676
  %202 = load i32* %search_site_count, align 4, !dbg !677
  %203 = sext i32 %202 to i64, !dbg !678
  %204 = load %struct.macroblock** %1, align 8, !dbg !678
  %205 = getelementptr inbounds %struct.macroblock* %204, i32 0, i32 12, !dbg !678
  %206 = load %struct.search_site** %205, align 8, !dbg !678
  %207 = getelementptr inbounds %struct.search_site* %206, i64 %203, !dbg !678
  %208 = getelementptr inbounds %struct.search_site* %207, i32 0, i32 0, !dbg !678
  %209 = getelementptr inbounds %struct.MV* %208, i32 0, i32 0, !dbg !678
  store i16 %201, i16* %209, align 2, !dbg !678
  %210 = load i32* %Len, align 4, !dbg !679
  %211 = sub nsw i32 0, %210, !dbg !680
  %212 = load i32* %2, align 4, !dbg !681
  %213 = mul nsw i32 %211, %212, !dbg !680
  %214 = load i32* %Len, align 4, !dbg !682
  %215 = add nsw i32 %213, %214, !dbg !680
  %216 = load i32* %search_site_count, align 4, !dbg !683
  %217 = sext i32 %216 to i64, !dbg !684
  %218 = load %struct.macroblock** %1, align 8, !dbg !684
  %219 = getelementptr inbounds %struct.macroblock* %218, i32 0, i32 12, !dbg !684
  %220 = load %struct.search_site** %219, align 8, !dbg !684
  %221 = getelementptr inbounds %struct.search_site* %220, i64 %217, !dbg !684
  %222 = getelementptr inbounds %struct.search_site* %221, i32 0, i32 1, !dbg !684
  store i32 %215, i32* %222, align 4, !dbg !684
  %223 = load i32* %search_site_count, align 4, !dbg !685
  %224 = add nsw i32 %223, 1, !dbg !685
  store i32 %224, i32* %search_site_count, align 4, !dbg !685
  %225 = load i32* %Len, align 4, !dbg !686
  %226 = sub nsw i32 0, %225, !dbg !687
  %227 = trunc i32 %226 to i16, !dbg !687
  %228 = load i32* %search_site_count, align 4, !dbg !688
  %229 = sext i32 %228 to i64, !dbg !689
  %230 = load %struct.macroblock** %1, align 8, !dbg !689
  %231 = getelementptr inbounds %struct.macroblock* %230, i32 0, i32 12, !dbg !689
  %232 = load %struct.search_site** %231, align 8, !dbg !689
  %233 = getelementptr inbounds %struct.search_site* %232, i64 %229, !dbg !689
  %234 = getelementptr inbounds %struct.search_site* %233, i32 0, i32 0, !dbg !689
  %235 = getelementptr inbounds %struct.MV* %234, i32 0, i32 1, !dbg !689
  store i16 %227, i16* %235, align 2, !dbg !689
  %236 = load i32* %Len, align 4, !dbg !690
  %237 = trunc i32 %236 to i16, !dbg !690
  %238 = load i32* %search_site_count, align 4, !dbg !691
  %239 = sext i32 %238 to i64, !dbg !692
  %240 = load %struct.macroblock** %1, align 8, !dbg !692
  %241 = getelementptr inbounds %struct.macroblock* %240, i32 0, i32 12, !dbg !692
  %242 = load %struct.search_site** %241, align 8, !dbg !692
  %243 = getelementptr inbounds %struct.search_site* %242, i64 %239, !dbg !692
  %244 = getelementptr inbounds %struct.search_site* %243, i32 0, i32 0, !dbg !692
  %245 = getelementptr inbounds %struct.MV* %244, i32 0, i32 0, !dbg !692
  store i16 %237, i16* %245, align 2, !dbg !692
  %246 = load i32* %Len, align 4, !dbg !693
  %247 = load i32* %2, align 4, !dbg !694
  %248 = mul nsw i32 %246, %247, !dbg !693
  %249 = load i32* %Len, align 4, !dbg !695
  %250 = sub nsw i32 %248, %249, !dbg !693
  %251 = load i32* %search_site_count, align 4, !dbg !696
  %252 = sext i32 %251 to i64, !dbg !697
  %253 = load %struct.macroblock** %1, align 8, !dbg !697
  %254 = getelementptr inbounds %struct.macroblock* %253, i32 0, i32 12, !dbg !697
  %255 = load %struct.search_site** %254, align 8, !dbg !697
  %256 = getelementptr inbounds %struct.search_site* %255, i64 %252, !dbg !697
  %257 = getelementptr inbounds %struct.search_site* %256, i32 0, i32 1, !dbg !697
  store i32 %250, i32* %257, align 4, !dbg !697
  %258 = load i32* %search_site_count, align 4, !dbg !698
  %259 = add nsw i32 %258, 1, !dbg !698
  store i32 %259, i32* %search_site_count, align 4, !dbg !698
  %260 = load i32* %Len, align 4, !dbg !699
  %261 = trunc i32 %260 to i16, !dbg !699
  %262 = load i32* %search_site_count, align 4, !dbg !700
  %263 = sext i32 %262 to i64, !dbg !701
  %264 = load %struct.macroblock** %1, align 8, !dbg !701
  %265 = getelementptr inbounds %struct.macroblock* %264, i32 0, i32 12, !dbg !701
  %266 = load %struct.search_site** %265, align 8, !dbg !701
  %267 = getelementptr inbounds %struct.search_site* %266, i64 %263, !dbg !701
  %268 = getelementptr inbounds %struct.search_site* %267, i32 0, i32 0, !dbg !701
  %269 = getelementptr inbounds %struct.MV* %268, i32 0, i32 1, !dbg !701
  store i16 %261, i16* %269, align 2, !dbg !701
  %270 = load i32* %Len, align 4, !dbg !702
  %271 = trunc i32 %270 to i16, !dbg !702
  %272 = load i32* %search_site_count, align 4, !dbg !703
  %273 = sext i32 %272 to i64, !dbg !704
  %274 = load %struct.macroblock** %1, align 8, !dbg !704
  %275 = getelementptr inbounds %struct.macroblock* %274, i32 0, i32 12, !dbg !704
  %276 = load %struct.search_site** %275, align 8, !dbg !704
  %277 = getelementptr inbounds %struct.search_site* %276, i64 %273, !dbg !704
  %278 = getelementptr inbounds %struct.search_site* %277, i32 0, i32 0, !dbg !704
  %279 = getelementptr inbounds %struct.MV* %278, i32 0, i32 0, !dbg !704
  store i16 %271, i16* %279, align 2, !dbg !704
  %280 = load i32* %Len, align 4, !dbg !705
  %281 = load i32* %2, align 4, !dbg !706
  %282 = mul nsw i32 %280, %281, !dbg !705
  %283 = load i32* %Len, align 4, !dbg !707
  %284 = add nsw i32 %282, %283, !dbg !705
  %285 = load i32* %search_site_count, align 4, !dbg !708
  %286 = sext i32 %285 to i64, !dbg !709
  %287 = load %struct.macroblock** %1, align 8, !dbg !709
  %288 = getelementptr inbounds %struct.macroblock* %287, i32 0, i32 12, !dbg !709
  %289 = load %struct.search_site** %288, align 8, !dbg !709
  %290 = getelementptr inbounds %struct.search_site* %289, i64 %286, !dbg !709
  %291 = getelementptr inbounds %struct.search_site* %290, i32 0, i32 1, !dbg !709
  store i32 %284, i32* %291, align 4, !dbg !709
  %292 = load i32* %search_site_count, align 4, !dbg !710
  %293 = add nsw i32 %292, 1, !dbg !710
  store i32 %293, i32* %search_site_count, align 4, !dbg !710
  %294 = load i32* %Len, align 4, !dbg !711
  %295 = sdiv i32 %294, 2, !dbg !711
  store i32 %295, i32* %Len, align 4, !dbg !711
  br label %28, !dbg !610

; <label>:296                                     ; preds = %28
  %297 = load i32* %search_site_count, align 4, !dbg !712
  %298 = load %struct.macroblock** %1, align 8, !dbg !713
  %299 = getelementptr inbounds %struct.macroblock* %298, i32 0, i32 13, !dbg !713
  store i32 %297, i32* %299, align 4, !dbg !713
  %300 = load %struct.macroblock** %1, align 8, !dbg !714
  %301 = getelementptr inbounds %struct.macroblock* %300, i32 0, i32 14, !dbg !714
  store i32 8, i32* %301, align 4, !dbg !714
  ret void, !dbg !715
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
  call void @llvm.dbg.declare(metadata %struct.macroblock** %2, metadata !716, metadata !506), !dbg !717
  store %struct.block* %b, %struct.block** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.block** %3, metadata !718, metadata !506), !dbg !719
  store %struct.blockd* %d, %struct.blockd** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.blockd** %4, metadata !720, metadata !506), !dbg !721
  store %union.int_mv* %bestmv, %union.int_mv** %5, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %5, metadata !722, metadata !506), !dbg !723
  store %union.int_mv* %ref_mv, %union.int_mv** %6, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %6, metadata !724, metadata !506), !dbg !725
  store i32 %error_per_bit, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !726, metadata !506), !dbg !727
  store %struct.variance_vtable* %vfp, %struct.variance_vtable** %8, align 8
  call void @llvm.dbg.declare(metadata %struct.variance_vtable** %8, metadata !728, metadata !506), !dbg !729
  store i32** %mvcost, i32*** %9, align 8
  call void @llvm.dbg.declare(metadata i32*** %9, metadata !730, metadata !506), !dbg !731
  store i32* %distortion, i32** %10, align 8
  call void @llvm.dbg.declare(metadata i32** %10, metadata !732, metadata !506), !dbg !733
  store i32* %sse1, i32** %11, align 8
  call void @llvm.dbg.declare(metadata i32** %11, metadata !734, metadata !506), !dbg !735
  call void @llvm.dbg.declare(metadata i8** %z, metadata !736, metadata !506), !dbg !737
  %12 = load %struct.block** %3, align 8, !dbg !738
  %13 = getelementptr inbounds %struct.block* %12, i32 0, i32 9, !dbg !738
  %14 = load i8*** %13, align 8, !dbg !738
  %15 = load i8** %14, align 8, !dbg !739
  %16 = load %struct.block** %3, align 8, !dbg !740
  %17 = getelementptr inbounds %struct.block* %16, i32 0, i32 10, !dbg !740
  %18 = load i32* %17, align 4, !dbg !740
  %19 = sext i32 %18 to i64, !dbg !739
  %20 = getelementptr inbounds i8* %15, i64 %19, !dbg !739
  store i8* %20, i8** %z, align 8, !dbg !737
  call void @llvm.dbg.declare(metadata i32* %rr, metadata !741, metadata !506), !dbg !742
  %21 = load %union.int_mv** %6, align 8, !dbg !743
  %22 = bitcast %union.int_mv* %21 to %struct.MV*, !dbg !743
  %23 = getelementptr inbounds %struct.MV* %22, i32 0, i32 0, !dbg !743
  %24 = load i16* %23, align 2, !dbg !743
  %25 = sext i16 %24 to i32, !dbg !743
  %26 = ashr i32 %25, 1, !dbg !743
  store i32 %26, i32* %rr, align 4, !dbg !742
  call void @llvm.dbg.declare(metadata i32* %rc, metadata !744, metadata !506), !dbg !745
  %27 = load %union.int_mv** %6, align 8, !dbg !746
  %28 = bitcast %union.int_mv* %27 to %struct.MV*, !dbg !746
  %29 = getelementptr inbounds %struct.MV* %28, i32 0, i32 1, !dbg !746
  %30 = load i16* %29, align 2, !dbg !746
  %31 = sext i16 %30 to i32, !dbg !746
  %32 = ashr i32 %31, 1, !dbg !746
  store i32 %32, i32* %rc, align 4, !dbg !745
  call void @llvm.dbg.declare(metadata i32* %br, metadata !747, metadata !506), !dbg !748
  %33 = load %union.int_mv** %5, align 8, !dbg !749
  %34 = bitcast %union.int_mv* %33 to %struct.MV*, !dbg !749
  %35 = getelementptr inbounds %struct.MV* %34, i32 0, i32 0, !dbg !749
  %36 = load i16* %35, align 2, !dbg !749
  %37 = sext i16 %36 to i32, !dbg !749
  %38 = mul nsw i32 %37, 4, !dbg !749
  store i32 %38, i32* %br, align 4, !dbg !748
  call void @llvm.dbg.declare(metadata i32* %bc, metadata !750, metadata !506), !dbg !751
  %39 = load %union.int_mv** %5, align 8, !dbg !752
  %40 = bitcast %union.int_mv* %39 to %struct.MV*, !dbg !752
  %41 = getelementptr inbounds %struct.MV* %40, i32 0, i32 1, !dbg !752
  %42 = load i16* %41, align 2, !dbg !752
  %43 = sext i16 %42 to i32, !dbg !752
  %44 = mul nsw i32 %43, 4, !dbg !752
  store i32 %44, i32* %bc, align 4, !dbg !751
  call void @llvm.dbg.declare(metadata i32* %tr, metadata !753, metadata !506), !dbg !754
  %45 = load i32* %br, align 4, !dbg !755
  store i32 %45, i32* %tr, align 4, !dbg !754
  call void @llvm.dbg.declare(metadata i32* %tc, metadata !756, metadata !506), !dbg !757
  %46 = load i32* %bc, align 4, !dbg !758
  store i32 %46, i32* %tc, align 4, !dbg !757
  call void @llvm.dbg.declare(metadata i32* %besterr, metadata !759, metadata !506), !dbg !760
  call void @llvm.dbg.declare(metadata i32* %left, metadata !761, metadata !506), !dbg !762
  call void @llvm.dbg.declare(metadata i32* %right, metadata !763, metadata !506), !dbg !764
  call void @llvm.dbg.declare(metadata i32* %up, metadata !765, metadata !506), !dbg !766
  call void @llvm.dbg.declare(metadata i32* %down, metadata !767, metadata !506), !dbg !768
  call void @llvm.dbg.declare(metadata i32* %diag, metadata !769, metadata !506), !dbg !770
  call void @llvm.dbg.declare(metadata i32* %sse, metadata !771, metadata !506), !dbg !772
  call void @llvm.dbg.declare(metadata i32* %whichdir, metadata !773, metadata !506), !dbg !774
  call void @llvm.dbg.declare(metadata i32* %halfiters, metadata !775, metadata !506), !dbg !776
  store i32 4, i32* %halfiters, align 4, !dbg !776
  call void @llvm.dbg.declare(metadata i32* %quarteriters, metadata !777, metadata !506), !dbg !778
  store i32 4, i32* %quarteriters, align 4, !dbg !778
  call void @llvm.dbg.declare(metadata i32* %thismse, metadata !779, metadata !506), !dbg !780
  call void @llvm.dbg.declare(metadata i32* %minc, metadata !781, metadata !506), !dbg !782
  %47 = load %struct.macroblock** %2, align 8, !dbg !783
  %48 = getelementptr inbounds %struct.macroblock* %47, i32 0, i32 31, !dbg !783
  %49 = load i32* %48, align 4, !dbg !783
  %50 = mul nsw i32 %49, 4, !dbg !783
  %51 = load %union.int_mv** %6, align 8, !dbg !783
  %52 = bitcast %union.int_mv* %51 to %struct.MV*, !dbg !783
  %53 = getelementptr inbounds %struct.MV* %52, i32 0, i32 1, !dbg !783
  %54 = load i16* %53, align 2, !dbg !783
  %55 = sext i16 %54 to i32, !dbg !783
  %56 = ashr i32 %55, 1, !dbg !783
  %57 = sub nsw i32 %56, 1023, !dbg !783
  %58 = icmp sgt i32 %50, %57, !dbg !783
  br i1 %58, label %59, label %64, !dbg !783

; <label>:59                                      ; preds = %0
  %60 = load %struct.macroblock** %2, align 8, !dbg !784
  %61 = getelementptr inbounds %struct.macroblock* %60, i32 0, i32 31, !dbg !784
  %62 = load i32* %61, align 4, !dbg !784
  %63 = mul nsw i32 %62, 4, !dbg !784
  br label %72, !dbg !784

; <label>:64                                      ; preds = %0
  %65 = load %union.int_mv** %6, align 8, !dbg !786
  %66 = bitcast %union.int_mv* %65 to %struct.MV*, !dbg !786
  %67 = getelementptr inbounds %struct.MV* %66, i32 0, i32 1, !dbg !786
  %68 = load i16* %67, align 2, !dbg !786
  %69 = sext i16 %68 to i32, !dbg !786
  %70 = ashr i32 %69, 1, !dbg !786
  %71 = sub nsw i32 %70, 1023, !dbg !786
  br label %72, !dbg !786

; <label>:72                                      ; preds = %64, %59
  %73 = phi i32 [ %63, %59 ], [ %71, %64 ], !dbg !783
  store i32 %73, i32* %minc, align 4, !dbg !788
  call void @llvm.dbg.declare(metadata i32* %maxc, metadata !791, metadata !506), !dbg !792
  %74 = load %struct.macroblock** %2, align 8, !dbg !793
  %75 = getelementptr inbounds %struct.macroblock* %74, i32 0, i32 32, !dbg !793
  %76 = load i32* %75, align 4, !dbg !793
  %77 = mul nsw i32 %76, 4, !dbg !793
  %78 = load %union.int_mv** %6, align 8, !dbg !793
  %79 = bitcast %union.int_mv* %78 to %struct.MV*, !dbg !793
  %80 = getelementptr inbounds %struct.MV* %79, i32 0, i32 1, !dbg !793
  %81 = load i16* %80, align 2, !dbg !793
  %82 = sext i16 %81 to i32, !dbg !793
  %83 = ashr i32 %82, 1, !dbg !793
  %84 = add nsw i32 %83, 1023, !dbg !793
  %85 = icmp slt i32 %77, %84, !dbg !793
  br i1 %85, label %86, label %91, !dbg !793

; <label>:86                                      ; preds = %72
  %87 = load %struct.macroblock** %2, align 8, !dbg !794
  %88 = getelementptr inbounds %struct.macroblock* %87, i32 0, i32 32, !dbg !794
  %89 = load i32* %88, align 4, !dbg !794
  %90 = mul nsw i32 %89, 4, !dbg !794
  br label %99, !dbg !794

; <label>:91                                      ; preds = %72
  %92 = load %union.int_mv** %6, align 8, !dbg !795
  %93 = bitcast %union.int_mv* %92 to %struct.MV*, !dbg !795
  %94 = getelementptr inbounds %struct.MV* %93, i32 0, i32 1, !dbg !795
  %95 = load i16* %94, align 2, !dbg !795
  %96 = sext i16 %95 to i32, !dbg !795
  %97 = ashr i32 %96, 1, !dbg !795
  %98 = add nsw i32 %97, 1023, !dbg !795
  br label %99, !dbg !795

; <label>:99                                      ; preds = %91, %86
  %100 = phi i32 [ %90, %86 ], [ %98, %91 ], !dbg !793
  store i32 %100, i32* %maxc, align 4, !dbg !796
  call void @llvm.dbg.declare(metadata i32* %minr, metadata !797, metadata !506), !dbg !798
  %101 = load %struct.macroblock** %2, align 8, !dbg !799
  %102 = getelementptr inbounds %struct.macroblock* %101, i32 0, i32 33, !dbg !799
  %103 = load i32* %102, align 4, !dbg !799
  %104 = mul nsw i32 %103, 4, !dbg !799
  %105 = load %union.int_mv** %6, align 8, !dbg !799
  %106 = bitcast %union.int_mv* %105 to %struct.MV*, !dbg !799
  %107 = getelementptr inbounds %struct.MV* %106, i32 0, i32 0, !dbg !799
  %108 = load i16* %107, align 2, !dbg !799
  %109 = sext i16 %108 to i32, !dbg !799
  %110 = ashr i32 %109, 1, !dbg !799
  %111 = sub nsw i32 %110, 1023, !dbg !799
  %112 = icmp sgt i32 %104, %111, !dbg !799
  br i1 %112, label %113, label %118, !dbg !799

; <label>:113                                     ; preds = %99
  %114 = load %struct.macroblock** %2, align 8, !dbg !800
  %115 = getelementptr inbounds %struct.macroblock* %114, i32 0, i32 33, !dbg !800
  %116 = load i32* %115, align 4, !dbg !800
  %117 = mul nsw i32 %116, 4, !dbg !800
  br label %126, !dbg !800

; <label>:118                                     ; preds = %99
  %119 = load %union.int_mv** %6, align 8, !dbg !801
  %120 = bitcast %union.int_mv* %119 to %struct.MV*, !dbg !801
  %121 = getelementptr inbounds %struct.MV* %120, i32 0, i32 0, !dbg !801
  %122 = load i16* %121, align 2, !dbg !801
  %123 = sext i16 %122 to i32, !dbg !801
  %124 = ashr i32 %123, 1, !dbg !801
  %125 = sub nsw i32 %124, 1023, !dbg !801
  br label %126, !dbg !801

; <label>:126                                     ; preds = %118, %113
  %127 = phi i32 [ %117, %113 ], [ %125, %118 ], !dbg !799
  store i32 %127, i32* %minr, align 4, !dbg !802
  call void @llvm.dbg.declare(metadata i32* %maxr, metadata !803, metadata !506), !dbg !804
  %128 = load %struct.macroblock** %2, align 8, !dbg !805
  %129 = getelementptr inbounds %struct.macroblock* %128, i32 0, i32 34, !dbg !805
  %130 = load i32* %129, align 4, !dbg !805
  %131 = mul nsw i32 %130, 4, !dbg !805
  %132 = load %union.int_mv** %6, align 8, !dbg !805
  %133 = bitcast %union.int_mv* %132 to %struct.MV*, !dbg !805
  %134 = getelementptr inbounds %struct.MV* %133, i32 0, i32 0, !dbg !805
  %135 = load i16* %134, align 2, !dbg !805
  %136 = sext i16 %135 to i32, !dbg !805
  %137 = ashr i32 %136, 1, !dbg !805
  %138 = add nsw i32 %137, 1023, !dbg !805
  %139 = icmp slt i32 %131, %138, !dbg !805
  br i1 %139, label %140, label %145, !dbg !805

; <label>:140                                     ; preds = %126
  %141 = load %struct.macroblock** %2, align 8, !dbg !806
  %142 = getelementptr inbounds %struct.macroblock* %141, i32 0, i32 34, !dbg !806
  %143 = load i32* %142, align 4, !dbg !806
  %144 = mul nsw i32 %143, 4, !dbg !806
  br label %153, !dbg !806

; <label>:145                                     ; preds = %126
  %146 = load %union.int_mv** %6, align 8, !dbg !807
  %147 = bitcast %union.int_mv* %146 to %struct.MV*, !dbg !807
  %148 = getelementptr inbounds %struct.MV* %147, i32 0, i32 0, !dbg !807
  %149 = load i16* %148, align 2, !dbg !807
  %150 = sext i16 %149 to i32, !dbg !807
  %151 = ashr i32 %150, 1, !dbg !807
  %152 = add nsw i32 %151, 1023, !dbg !807
  br label %153, !dbg !807

; <label>:153                                     ; preds = %145, %140
  %154 = phi i32 [ %144, %140 ], [ %152, %145 ], !dbg !805
  store i32 %154, i32* %maxr, align 4, !dbg !808
  call void @llvm.dbg.declare(metadata i32* %y_stride, metadata !809, metadata !506), !dbg !810
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !811, metadata !506), !dbg !812
  call void @llvm.dbg.declare(metadata i32* %pre_stride, metadata !813, metadata !506), !dbg !814
  %155 = load %struct.macroblock** %2, align 8, !dbg !815
  %156 = getelementptr inbounds %struct.macroblock* %155, i32 0, i32 7, !dbg !815
  %157 = getelementptr inbounds %struct.macroblockd* %156, i32 0, i32 11, !dbg !815
  %158 = getelementptr inbounds %struct.yv12_buffer_config* %157, i32 0, i32 4, !dbg !815
  %159 = load i32* %158, align 4, !dbg !815
  store i32 %159, i32* %pre_stride, align 4, !dbg !814
  call void @llvm.dbg.declare(metadata i8** %base_pre, metadata !816, metadata !506), !dbg !817
  %160 = load %struct.macroblock** %2, align 8, !dbg !818
  %161 = getelementptr inbounds %struct.macroblock* %160, i32 0, i32 7, !dbg !818
  %162 = getelementptr inbounds %struct.macroblockd* %161, i32 0, i32 11, !dbg !818
  %163 = getelementptr inbounds %struct.yv12_buffer_config* %162, i32 0, i32 13, !dbg !818
  %164 = load i8** %163, align 8, !dbg !818
  store i8* %164, i8** %base_pre, align 8, !dbg !817
  call void @llvm.dbg.declare(metadata %struct.macroblockd** %xd, metadata !819, metadata !506), !dbg !821
  %165 = load %struct.macroblock** %2, align 8, !dbg !822
  %166 = getelementptr inbounds %struct.macroblock* %165, i32 0, i32 7, !dbg !823
  store %struct.macroblockd* %166, %struct.macroblockd** %xd, align 8, !dbg !821
  call void @llvm.dbg.declare(metadata i8** %y_0, metadata !824, metadata !506), !dbg !825
  %167 = load i8** %base_pre, align 8, !dbg !826
  %168 = load %struct.blockd** %4, align 8, !dbg !827
  %169 = getelementptr inbounds %struct.blockd* %168, i32 0, i32 4, !dbg !827
  %170 = load i32* %169, align 4, !dbg !827
  %171 = sext i32 %170 to i64, !dbg !826
  %172 = getelementptr inbounds i8* %167, i64 %171, !dbg !826
  %173 = load %union.int_mv** %5, align 8, !dbg !828
  %174 = bitcast %union.int_mv* %173 to %struct.MV*, !dbg !828
  %175 = getelementptr inbounds %struct.MV* %174, i32 0, i32 0, !dbg !828
  %176 = load i16* %175, align 2, !dbg !828
  %177 = sext i16 %176 to i32, !dbg !829
  %178 = load i32* %pre_stride, align 4, !dbg !830
  %179 = mul nsw i32 %177, %178, !dbg !829
  %180 = sext i32 %179 to i64, !dbg !826
  %181 = getelementptr inbounds i8* %172, i64 %180, !dbg !826
  %182 = load %union.int_mv** %5, align 8, !dbg !831
  %183 = bitcast %union.int_mv* %182 to %struct.MV*, !dbg !831
  %184 = getelementptr inbounds %struct.MV* %183, i32 0, i32 1, !dbg !831
  %185 = load i16* %184, align 2, !dbg !831
  %186 = sext i16 %185 to i32, !dbg !831
  %187 = sext i32 %186 to i64, !dbg !826
  %188 = getelementptr inbounds i8* %181, i64 %187, !dbg !826
  store i8* %188, i8** %y_0, align 8, !dbg !825
  call void @llvm.dbg.declare(metadata i8** %y, metadata !832, metadata !506), !dbg !833
  call void @llvm.dbg.declare(metadata i32* %buf_r1, metadata !834, metadata !506), !dbg !835
  call void @llvm.dbg.declare(metadata i32* %buf_r2, metadata !836, metadata !506), !dbg !837
  call void @llvm.dbg.declare(metadata i32* %buf_c1, metadata !838, metadata !506), !dbg !839
  %189 = load %union.int_mv** %5, align 8, !dbg !840
  %190 = bitcast %union.int_mv* %189 to %struct.MV*, !dbg !840
  %191 = getelementptr inbounds %struct.MV* %190, i32 0, i32 0, !dbg !840
  %192 = load i16* %191, align 2, !dbg !840
  %193 = sext i16 %192 to i32, !dbg !840
  %194 = sub nsw i32 %193, 3, !dbg !840
  %195 = load %struct.macroblock** %2, align 8, !dbg !841
  %196 = getelementptr inbounds %struct.macroblock* %195, i32 0, i32 33, !dbg !841
  %197 = load i32* %196, align 4, !dbg !841
  %198 = icmp slt i32 %194, %197, !dbg !842
  br i1 %198, label %199, label %209, !dbg !843

; <label>:199                                     ; preds = %153
  %200 = load %union.int_mv** %5, align 8, !dbg !844
  %201 = bitcast %union.int_mv* %200 to %struct.MV*, !dbg !844
  %202 = getelementptr inbounds %struct.MV* %201, i32 0, i32 0, !dbg !844
  %203 = load i16* %202, align 2, !dbg !844
  %204 = sext i16 %203 to i32, !dbg !844
  %205 = load %struct.macroblock** %2, align 8, !dbg !845
  %206 = getelementptr inbounds %struct.macroblock* %205, i32 0, i32 33, !dbg !845
  %207 = load i32* %206, align 4, !dbg !845
  %208 = sub nsw i32 %204, %207, !dbg !846
  br label %210, !dbg !843

; <label>:209                                     ; preds = %153
  br label %210, !dbg !847

; <label>:210                                     ; preds = %209, %199
  %211 = phi i32 [ %208, %199 ], [ 3, %209 ], !dbg !843
  store i32 %211, i32* %buf_r1, align 4, !dbg !848
  %212 = load %union.int_mv** %5, align 8, !dbg !849
  %213 = bitcast %union.int_mv* %212 to %struct.MV*, !dbg !849
  %214 = getelementptr inbounds %struct.MV* %213, i32 0, i32 0, !dbg !849
  %215 = load i16* %214, align 2, !dbg !849
  %216 = sext i16 %215 to i32, !dbg !849
  %217 = add nsw i32 %216, 3, !dbg !849
  %218 = load %struct.macroblock** %2, align 8, !dbg !850
  %219 = getelementptr inbounds %struct.macroblock* %218, i32 0, i32 34, !dbg !850
  %220 = load i32* %219, align 4, !dbg !850
  %221 = icmp sgt i32 %217, %220, !dbg !851
  br i1 %221, label %222, label %232, !dbg !852

; <label>:222                                     ; preds = %210
  %223 = load %struct.macroblock** %2, align 8, !dbg !853
  %224 = getelementptr inbounds %struct.macroblock* %223, i32 0, i32 34, !dbg !853
  %225 = load i32* %224, align 4, !dbg !853
  %226 = load %union.int_mv** %5, align 8, !dbg !854
  %227 = bitcast %union.int_mv* %226 to %struct.MV*, !dbg !854
  %228 = getelementptr inbounds %struct.MV* %227, i32 0, i32 0, !dbg !854
  %229 = load i16* %228, align 2, !dbg !854
  %230 = sext i16 %229 to i32, !dbg !854
  %231 = sub nsw i32 %225, %230, !dbg !855
  br label %233, !dbg !852

; <label>:232                                     ; preds = %210
  br label %233, !dbg !856

; <label>:233                                     ; preds = %232, %222
  %234 = phi i32 [ %231, %222 ], [ 3, %232 ], !dbg !852
  store i32 %234, i32* %buf_r2, align 4, !dbg !857
  %235 = load %union.int_mv** %5, align 8, !dbg !858
  %236 = bitcast %union.int_mv* %235 to %struct.MV*, !dbg !858
  %237 = getelementptr inbounds %struct.MV* %236, i32 0, i32 1, !dbg !858
  %238 = load i16* %237, align 2, !dbg !858
  %239 = sext i16 %238 to i32, !dbg !858
  %240 = sub nsw i32 %239, 3, !dbg !858
  %241 = load %struct.macroblock** %2, align 8, !dbg !859
  %242 = getelementptr inbounds %struct.macroblock* %241, i32 0, i32 31, !dbg !859
  %243 = load i32* %242, align 4, !dbg !859
  %244 = icmp slt i32 %240, %243, !dbg !860
  br i1 %244, label %245, label %255, !dbg !861

; <label>:245                                     ; preds = %233
  %246 = load %union.int_mv** %5, align 8, !dbg !862
  %247 = bitcast %union.int_mv* %246 to %struct.MV*, !dbg !862
  %248 = getelementptr inbounds %struct.MV* %247, i32 0, i32 1, !dbg !862
  %249 = load i16* %248, align 2, !dbg !862
  %250 = sext i16 %249 to i32, !dbg !862
  %251 = load %struct.macroblock** %2, align 8, !dbg !863
  %252 = getelementptr inbounds %struct.macroblock* %251, i32 0, i32 31, !dbg !863
  %253 = load i32* %252, align 4, !dbg !863
  %254 = sub nsw i32 %250, %253, !dbg !864
  br label %256, !dbg !861

; <label>:255                                     ; preds = %233
  br label %256, !dbg !865

; <label>:256                                     ; preds = %255, %245
  %257 = phi i32 [ %254, %245 ], [ 3, %255 ], !dbg !861
  store i32 %257, i32* %buf_c1, align 4, !dbg !866
  store i32 32, i32* %y_stride, align 4, !dbg !867
  %258 = load %struct.variance_vtable** %8, align 8, !dbg !868
  %259 = getelementptr inbounds %struct.variance_vtable* %258, i32 0, i32 9, !dbg !868
  %260 = load void (i8*, i32, i8*, i32, i32)** %259, align 8, !dbg !868
  %261 = load i8** %y_0, align 8, !dbg !869
  %262 = load i32* %buf_c1, align 4, !dbg !870
  %263 = sext i32 %262 to i64, !dbg !869
  %264 = sub i64 0, %263, !dbg !869
  %265 = getelementptr inbounds i8* %261, i64 %264, !dbg !869
  %266 = load i32* %pre_stride, align 4, !dbg !871
  %267 = load i32* %buf_r1, align 4, !dbg !872
  %268 = mul nsw i32 %266, %267, !dbg !871
  %269 = sext i32 %268 to i64, !dbg !869
  %270 = sub i64 0, %269, !dbg !869
  %271 = getelementptr inbounds i8* %265, i64 %270, !dbg !869
  %272 = load i32* %pre_stride, align 4, !dbg !873
  %273 = load %struct.macroblockd** %xd, align 8, !dbg !874
  %274 = getelementptr inbounds %struct.macroblockd* %273, i32 0, i32 46, !dbg !874
  %275 = getelementptr inbounds [704 x i8]* %274, i32 0, i32 0, !dbg !874
  %276 = load i32* %y_stride, align 4, !dbg !875
  %277 = load i32* %buf_r1, align 4, !dbg !876
  %278 = add nsw i32 16, %277, !dbg !877
  %279 = load i32* %buf_r2, align 4, !dbg !878
  %280 = add nsw i32 %278, %279, !dbg !877
  call void %260(i8* %271, i32 %272, i8* %275, i32 %276, i32 %280), !dbg !868
  %281 = load %struct.macroblockd** %xd, align 8, !dbg !879
  %282 = getelementptr inbounds %struct.macroblockd* %281, i32 0, i32 46, !dbg !879
  %283 = getelementptr inbounds [704 x i8]* %282, i32 0, i32 0, !dbg !879
  %284 = load i32* %y_stride, align 4, !dbg !880
  %285 = load i32* %buf_r1, align 4, !dbg !881
  %286 = mul nsw i32 %284, %285, !dbg !880
  %287 = sext i32 %286 to i64, !dbg !879
  %288 = getelementptr inbounds i8* %283, i64 %287, !dbg !879
  %289 = load i32* %buf_c1, align 4, !dbg !882
  %290 = sext i32 %289 to i64, !dbg !879
  %291 = getelementptr inbounds i8* %288, i64 %290, !dbg !879
  store i8* %291, i8** %y, align 8, !dbg !883
  %292 = load %union.int_mv** %5, align 8, !dbg !884
  %293 = bitcast %union.int_mv* %292 to %struct.MV*, !dbg !884
  %294 = getelementptr inbounds %struct.MV* %293, i32 0, i32 0, !dbg !884
  %295 = load i16* %294, align 2, !dbg !884
  %296 = sext i16 %295 to i32, !dbg !885
  %297 = load i32* %y_stride, align 4, !dbg !886
  %298 = mul nsw i32 %296, %297, !dbg !885
  %299 = load %union.int_mv** %5, align 8, !dbg !887
  %300 = bitcast %union.int_mv* %299 to %struct.MV*, !dbg !887
  %301 = getelementptr inbounds %struct.MV* %300, i32 0, i32 1, !dbg !887
  %302 = load i16* %301, align 2, !dbg !887
  %303 = sext i16 %302 to i32, !dbg !887
  %304 = add nsw i32 %298, %303, !dbg !885
  store i32 %304, i32* %offset, align 4, !dbg !888
  %305 = load %union.int_mv** %5, align 8, !dbg !889
  %306 = bitcast %union.int_mv* %305 to %struct.MV*, !dbg !889
  %307 = getelementptr inbounds %struct.MV* %306, i32 0, i32 0, !dbg !889
  %308 = load i16* %307, align 2, !dbg !889
  %309 = sext i16 %308 to i32, !dbg !889
  %310 = mul nsw i32 %309, 8, !dbg !889
  %311 = trunc i32 %310 to i16, !dbg !889
  store i16 %311, i16* %307, align 2, !dbg !889
  %312 = load %union.int_mv** %5, align 8, !dbg !890
  %313 = bitcast %union.int_mv* %312 to %struct.MV*, !dbg !890
  %314 = getelementptr inbounds %struct.MV* %313, i32 0, i32 1, !dbg !890
  %315 = load i16* %314, align 2, !dbg !890
  %316 = sext i16 %315 to i32, !dbg !890
  %317 = mul nsw i32 %316, 8, !dbg !890
  %318 = trunc i32 %317 to i16, !dbg !890
  store i16 %318, i16* %314, align 2, !dbg !890
  %319 = load %struct.variance_vtable** %8, align 8, !dbg !891
  %320 = getelementptr inbounds %struct.variance_vtable* %319, i32 0, i32 1, !dbg !891
  %321 = load i32 (i8*, i32, i8*, i32, i32*)** %320, align 8, !dbg !891
  %322 = load i8** %y, align 8, !dbg !892
  %323 = load i32* %y_stride, align 4, !dbg !893
  %324 = load i8** %z, align 8, !dbg !894
  %325 = load %struct.block** %3, align 8, !dbg !895
  %326 = getelementptr inbounds %struct.block* %325, i32 0, i32 11, !dbg !895
  %327 = load i32* %326, align 4, !dbg !895
  %328 = load i32** %11, align 8, !dbg !896
  %329 = call i32 %321(i8* %322, i32 %323, i8* %324, i32 %327, i32* %328), !dbg !891
  store i32 %329, i32* %besterr, align 4, !dbg !897
  %330 = load i32* %besterr, align 4, !dbg !898
  %331 = load i32** %10, align 8, !dbg !899
  store i32 %330, i32* %331, align 4, !dbg !900
  %332 = load %union.int_mv** %5, align 8, !dbg !901
  %333 = load %union.int_mv** %6, align 8, !dbg !902
  %334 = load i32*** %9, align 8, !dbg !903
  %335 = load i32* %7, align 4, !dbg !904
  %336 = call i32 @mv_err_cost(%union.int_mv* %332, %union.int_mv* %333, i32** %334, i32 %335), !dbg !905
  %337 = load i32* %besterr, align 4, !dbg !906
  %338 = add i32 %337, %336, !dbg !906
  store i32 %338, i32* %besterr, align 4, !dbg !906
  br label %339, !dbg !907

; <label>:339                                     ; preds = %1135, %256
  %340 = load i32* %halfiters, align 4, !dbg !908
  %341 = add i32 %340, -1, !dbg !908
  store i32 %341, i32* %halfiters, align 4, !dbg !908
  %342 = icmp ne i32 %341, 0, !dbg !907
  br i1 %342, label %343, label %1138, !dbg !907

; <label>:343                                     ; preds = %339
  %344 = load i32* %tc, align 4, !dbg !910
  %345 = sub nsw i32 %344, 2, !dbg !910
  %346 = load i32* %minc, align 4, !dbg !910
  %347 = icmp sge i32 %345, %346, !dbg !910
  br i1 %347, label %348, label %435, !dbg !913

; <label>:348                                     ; preds = %343
  %349 = load i32* %tc, align 4, !dbg !914
  %350 = sub nsw i32 %349, 2, !dbg !914
  %351 = load i32* %maxc, align 4, !dbg !914
  %352 = icmp sle i32 %350, %351, !dbg !914
  br i1 %352, label %353, label %435, !dbg !913

; <label>:353                                     ; preds = %348
  %354 = load i32* %tr, align 4, !dbg !916
  %355 = load i32* %minr, align 4, !dbg !916
  %356 = icmp sge i32 %354, %355, !dbg !916
  br i1 %356, label %357, label %435, !dbg !913

; <label>:357                                     ; preds = %353
  %358 = load i32* %tr, align 4, !dbg !918
  %359 = load i32* %maxr, align 4, !dbg !918
  %360 = icmp sle i32 %358, %359, !dbg !918
  br i1 %360, label %361, label %435, !dbg !913

; <label>:361                                     ; preds = %357
  %362 = load %struct.variance_vtable** %8, align 8, !dbg !920
  %363 = getelementptr inbounds %struct.variance_vtable* %362, i32 0, i32 2, !dbg !920
  %364 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %363, align 8, !dbg !920
  %365 = load i8** %y, align 8, !dbg !920
  %366 = load i32* %tr, align 4, !dbg !920
  %367 = ashr i32 %366, 2, !dbg !920
  %368 = load i32* %y_stride, align 4, !dbg !920
  %369 = mul nsw i32 %367, %368, !dbg !920
  %370 = load i32* %tc, align 4, !dbg !920
  %371 = sub nsw i32 %370, 2, !dbg !920
  %372 = ashr i32 %371, 2, !dbg !920
  %373 = add nsw i32 %369, %372, !dbg !920
  %374 = load i32* %offset, align 4, !dbg !920
  %375 = sub nsw i32 %373, %374, !dbg !920
  %376 = sext i32 %375 to i64, !dbg !920
  %377 = getelementptr inbounds i8* %365, i64 %376, !dbg !920
  %378 = load i32* %y_stride, align 4, !dbg !920
  %379 = load i32* %tc, align 4, !dbg !920
  %380 = sub nsw i32 %379, 2, !dbg !920
  %381 = and i32 %380, 3, !dbg !920
  %382 = shl i32 %381, 1, !dbg !920
  %383 = load i32* %tr, align 4, !dbg !920
  %384 = and i32 %383, 3, !dbg !920
  %385 = shl i32 %384, 1, !dbg !920
  %386 = load i8** %z, align 8, !dbg !920
  %387 = load %struct.block** %3, align 8, !dbg !920
  %388 = getelementptr inbounds %struct.block* %387, i32 0, i32 11, !dbg !920
  %389 = load i32* %388, align 4, !dbg !920
  %390 = call i32 %364(i8* %377, i32 %378, i32 %382, i32 %385, i8* %386, i32 %389, i32* %sse), !dbg !920
  store i32 %390, i32* %thismse, align 4, !dbg !920
  %391 = load i32*** %9, align 8, !dbg !923
  %392 = icmp ne i32** %391, null, !dbg !923
  br i1 %392, label %393, label %418, !dbg !923

; <label>:393                                     ; preds = %361
  %394 = load i32* %tr, align 4, !dbg !925
  %395 = load i32* %rr, align 4, !dbg !925
  %396 = sub nsw i32 %394, %395, !dbg !925
  %397 = sext i32 %396 to i64, !dbg !925
  %398 = load i32*** %9, align 8, !dbg !925
  %399 = getelementptr inbounds i32** %398, i64 0, !dbg !925
  %400 = load i32** %399, align 8, !dbg !925
  %401 = getelementptr inbounds i32* %400, i64 %397, !dbg !925
  %402 = load i32* %401, align 4, !dbg !925
  %403 = load i32* %tc, align 4, !dbg !925
  %404 = sub nsw i32 %403, 2, !dbg !925
  %405 = load i32* %rc, align 4, !dbg !925
  %406 = sub nsw i32 %404, %405, !dbg !925
  %407 = sext i32 %406 to i64, !dbg !925
  %408 = load i32*** %9, align 8, !dbg !925
  %409 = getelementptr inbounds i32** %408, i64 1, !dbg !925
  %410 = load i32** %409, align 8, !dbg !925
  %411 = getelementptr inbounds i32* %410, i64 %407, !dbg !925
  %412 = load i32* %411, align 4, !dbg !925
  %413 = add nsw i32 %402, %412, !dbg !925
  %414 = load i32* %7, align 4, !dbg !925
  %415 = mul nsw i32 %413, %414, !dbg !925
  %416 = add nsw i32 %415, 128, !dbg !925
  %417 = ashr i32 %416, 8, !dbg !925
  br label %419, !dbg !925

; <label>:418                                     ; preds = %361
  br label %419, !dbg !927

; <label>:419                                     ; preds = %418, %393
  %420 = phi i32 [ %417, %393 ], [ 0, %418 ], !dbg !923
  %421 = load i32* %thismse, align 4, !dbg !929
  %422 = add nsw i32 %420, %421, !dbg !929
  store i32 %422, i32* %left, align 4, !dbg !929
  %423 = load i32* %besterr, align 4, !dbg !929
  %424 = icmp ult i32 %422, %423, !dbg !929
  br i1 %424, label %425, label %434, !dbg !932

; <label>:425                                     ; preds = %419
  %426 = load i32* %left, align 4, !dbg !933
  store i32 %426, i32* %besterr, align 4, !dbg !933
  %427 = load i32* %tr, align 4, !dbg !933
  store i32 %427, i32* %br, align 4, !dbg !933
  %428 = load i32* %tc, align 4, !dbg !933
  %429 = sub nsw i32 %428, 2, !dbg !933
  store i32 %429, i32* %bc, align 4, !dbg !933
  %430 = load i32* %thismse, align 4, !dbg !933
  %431 = load i32** %10, align 8, !dbg !933
  store i32 %430, i32* %431, align 4, !dbg !933
  %432 = load i32* %sse, align 4, !dbg !933
  %433 = load i32** %11, align 8, !dbg !933
  store i32 %432, i32* %433, align 4, !dbg !933
  br label %434, !dbg !933

; <label>:434                                     ; preds = %425, %419
  br label %436, !dbg !936

; <label>:435                                     ; preds = %357, %353, %348, %343
  store i32 -1, i32* %left, align 4, !dbg !939
  br label %436

; <label>:436                                     ; preds = %435, %434
  %437 = load i32* %tc, align 4, !dbg !944
  %438 = add nsw i32 %437, 2, !dbg !944
  %439 = load i32* %minc, align 4, !dbg !944
  %440 = icmp sge i32 %438, %439, !dbg !944
  br i1 %440, label %441, label %528, !dbg !946

; <label>:441                                     ; preds = %436
  %442 = load i32* %tc, align 4, !dbg !947
  %443 = add nsw i32 %442, 2, !dbg !947
  %444 = load i32* %maxc, align 4, !dbg !947
  %445 = icmp sle i32 %443, %444, !dbg !947
  br i1 %445, label %446, label %528, !dbg !946

; <label>:446                                     ; preds = %441
  %447 = load i32* %tr, align 4, !dbg !949
  %448 = load i32* %minr, align 4, !dbg !949
  %449 = icmp sge i32 %447, %448, !dbg !949
  br i1 %449, label %450, label %528, !dbg !946

; <label>:450                                     ; preds = %446
  %451 = load i32* %tr, align 4, !dbg !951
  %452 = load i32* %maxr, align 4, !dbg !951
  %453 = icmp sle i32 %451, %452, !dbg !951
  br i1 %453, label %454, label %528, !dbg !946

; <label>:454                                     ; preds = %450
  %455 = load %struct.variance_vtable** %8, align 8, !dbg !953
  %456 = getelementptr inbounds %struct.variance_vtable* %455, i32 0, i32 2, !dbg !953
  %457 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %456, align 8, !dbg !953
  %458 = load i8** %y, align 8, !dbg !953
  %459 = load i32* %tr, align 4, !dbg !953
  %460 = ashr i32 %459, 2, !dbg !953
  %461 = load i32* %y_stride, align 4, !dbg !953
  %462 = mul nsw i32 %460, %461, !dbg !953
  %463 = load i32* %tc, align 4, !dbg !953
  %464 = add nsw i32 %463, 2, !dbg !953
  %465 = ashr i32 %464, 2, !dbg !953
  %466 = add nsw i32 %462, %465, !dbg !953
  %467 = load i32* %offset, align 4, !dbg !953
  %468 = sub nsw i32 %466, %467, !dbg !953
  %469 = sext i32 %468 to i64, !dbg !953
  %470 = getelementptr inbounds i8* %458, i64 %469, !dbg !953
  %471 = load i32* %y_stride, align 4, !dbg !953
  %472 = load i32* %tc, align 4, !dbg !953
  %473 = add nsw i32 %472, 2, !dbg !953
  %474 = and i32 %473, 3, !dbg !953
  %475 = shl i32 %474, 1, !dbg !953
  %476 = load i32* %tr, align 4, !dbg !953
  %477 = and i32 %476, 3, !dbg !953
  %478 = shl i32 %477, 1, !dbg !953
  %479 = load i8** %z, align 8, !dbg !953
  %480 = load %struct.block** %3, align 8, !dbg !953
  %481 = getelementptr inbounds %struct.block* %480, i32 0, i32 11, !dbg !953
  %482 = load i32* %481, align 4, !dbg !953
  %483 = call i32 %457(i8* %470, i32 %471, i32 %475, i32 %478, i8* %479, i32 %482, i32* %sse), !dbg !953
  store i32 %483, i32* %thismse, align 4, !dbg !953
  %484 = load i32*** %9, align 8, !dbg !956
  %485 = icmp ne i32** %484, null, !dbg !956
  br i1 %485, label %486, label %511, !dbg !956

; <label>:486                                     ; preds = %454
  %487 = load i32* %tr, align 4, !dbg !958
  %488 = load i32* %rr, align 4, !dbg !958
  %489 = sub nsw i32 %487, %488, !dbg !958
  %490 = sext i32 %489 to i64, !dbg !958
  %491 = load i32*** %9, align 8, !dbg !958
  %492 = getelementptr inbounds i32** %491, i64 0, !dbg !958
  %493 = load i32** %492, align 8, !dbg !958
  %494 = getelementptr inbounds i32* %493, i64 %490, !dbg !958
  %495 = load i32* %494, align 4, !dbg !958
  %496 = load i32* %tc, align 4, !dbg !958
  %497 = add nsw i32 %496, 2, !dbg !958
  %498 = load i32* %rc, align 4, !dbg !958
  %499 = sub nsw i32 %497, %498, !dbg !958
  %500 = sext i32 %499 to i64, !dbg !958
  %501 = load i32*** %9, align 8, !dbg !958
  %502 = getelementptr inbounds i32** %501, i64 1, !dbg !958
  %503 = load i32** %502, align 8, !dbg !958
  %504 = getelementptr inbounds i32* %503, i64 %500, !dbg !958
  %505 = load i32* %504, align 4, !dbg !958
  %506 = add nsw i32 %495, %505, !dbg !958
  %507 = load i32* %7, align 4, !dbg !958
  %508 = mul nsw i32 %506, %507, !dbg !958
  %509 = add nsw i32 %508, 128, !dbg !958
  %510 = ashr i32 %509, 8, !dbg !958
  br label %512, !dbg !958

; <label>:511                                     ; preds = %454
  br label %512, !dbg !960

; <label>:512                                     ; preds = %511, %486
  %513 = phi i32 [ %510, %486 ], [ 0, %511 ], !dbg !956
  %514 = load i32* %thismse, align 4, !dbg !962
  %515 = add nsw i32 %513, %514, !dbg !962
  store i32 %515, i32* %right, align 4, !dbg !962
  %516 = load i32* %besterr, align 4, !dbg !962
  %517 = icmp ult i32 %515, %516, !dbg !962
  br i1 %517, label %518, label %527, !dbg !965

; <label>:518                                     ; preds = %512
  %519 = load i32* %right, align 4, !dbg !966
  store i32 %519, i32* %besterr, align 4, !dbg !966
  %520 = load i32* %tr, align 4, !dbg !966
  store i32 %520, i32* %br, align 4, !dbg !966
  %521 = load i32* %tc, align 4, !dbg !966
  %522 = add nsw i32 %521, 2, !dbg !966
  store i32 %522, i32* %bc, align 4, !dbg !966
  %523 = load i32* %thismse, align 4, !dbg !966
  %524 = load i32** %10, align 8, !dbg !966
  store i32 %523, i32* %524, align 4, !dbg !966
  %525 = load i32* %sse, align 4, !dbg !966
  %526 = load i32** %11, align 8, !dbg !966
  store i32 %525, i32* %526, align 4, !dbg !966
  br label %527, !dbg !966

; <label>:527                                     ; preds = %518, %512
  br label %529, !dbg !969

; <label>:528                                     ; preds = %450, %446, %441, %436
  store i32 -1, i32* %right, align 4, !dbg !972
  br label %529

; <label>:529                                     ; preds = %528, %527
  %530 = load i32* %tc, align 4, !dbg !977
  %531 = load i32* %minc, align 4, !dbg !977
  %532 = icmp sge i32 %530, %531, !dbg !977
  br i1 %532, label %533, label %621, !dbg !979

; <label>:533                                     ; preds = %529
  %534 = load i32* %tc, align 4, !dbg !980
  %535 = load i32* %maxc, align 4, !dbg !980
  %536 = icmp sle i32 %534, %535, !dbg !980
  br i1 %536, label %537, label %621, !dbg !979

; <label>:537                                     ; preds = %533
  %538 = load i32* %tr, align 4, !dbg !982
  %539 = sub nsw i32 %538, 2, !dbg !982
  %540 = load i32* %minr, align 4, !dbg !982
  %541 = icmp sge i32 %539, %540, !dbg !982
  br i1 %541, label %542, label %621, !dbg !979

; <label>:542                                     ; preds = %537
  %543 = load i32* %tr, align 4, !dbg !984
  %544 = sub nsw i32 %543, 2, !dbg !984
  %545 = load i32* %maxr, align 4, !dbg !984
  %546 = icmp sle i32 %544, %545, !dbg !984
  br i1 %546, label %547, label %621, !dbg !979

; <label>:547                                     ; preds = %542
  %548 = load %struct.variance_vtable** %8, align 8, !dbg !986
  %549 = getelementptr inbounds %struct.variance_vtable* %548, i32 0, i32 2, !dbg !986
  %550 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %549, align 8, !dbg !986
  %551 = load i8** %y, align 8, !dbg !986
  %552 = load i32* %tr, align 4, !dbg !986
  %553 = sub nsw i32 %552, 2, !dbg !986
  %554 = ashr i32 %553, 2, !dbg !986
  %555 = load i32* %y_stride, align 4, !dbg !986
  %556 = mul nsw i32 %554, %555, !dbg !986
  %557 = load i32* %tc, align 4, !dbg !986
  %558 = ashr i32 %557, 2, !dbg !986
  %559 = add nsw i32 %556, %558, !dbg !986
  %560 = load i32* %offset, align 4, !dbg !986
  %561 = sub nsw i32 %559, %560, !dbg !986
  %562 = sext i32 %561 to i64, !dbg !986
  %563 = getelementptr inbounds i8* %551, i64 %562, !dbg !986
  %564 = load i32* %y_stride, align 4, !dbg !986
  %565 = load i32* %tc, align 4, !dbg !986
  %566 = and i32 %565, 3, !dbg !986
  %567 = shl i32 %566, 1, !dbg !986
  %568 = load i32* %tr, align 4, !dbg !986
  %569 = sub nsw i32 %568, 2, !dbg !986
  %570 = and i32 %569, 3, !dbg !986
  %571 = shl i32 %570, 1, !dbg !986
  %572 = load i8** %z, align 8, !dbg !986
  %573 = load %struct.block** %3, align 8, !dbg !986
  %574 = getelementptr inbounds %struct.block* %573, i32 0, i32 11, !dbg !986
  %575 = load i32* %574, align 4, !dbg !986
  %576 = call i32 %550(i8* %563, i32 %564, i32 %567, i32 %571, i8* %572, i32 %575, i32* %sse), !dbg !986
  store i32 %576, i32* %thismse, align 4, !dbg !986
  %577 = load i32*** %9, align 8, !dbg !989
  %578 = icmp ne i32** %577, null, !dbg !989
  br i1 %578, label %579, label %604, !dbg !989

; <label>:579                                     ; preds = %547
  %580 = load i32* %tr, align 4, !dbg !991
  %581 = sub nsw i32 %580, 2, !dbg !991
  %582 = load i32* %rr, align 4, !dbg !991
  %583 = sub nsw i32 %581, %582, !dbg !991
  %584 = sext i32 %583 to i64, !dbg !991
  %585 = load i32*** %9, align 8, !dbg !991
  %586 = getelementptr inbounds i32** %585, i64 0, !dbg !991
  %587 = load i32** %586, align 8, !dbg !991
  %588 = getelementptr inbounds i32* %587, i64 %584, !dbg !991
  %589 = load i32* %588, align 4, !dbg !991
  %590 = load i32* %tc, align 4, !dbg !991
  %591 = load i32* %rc, align 4, !dbg !991
  %592 = sub nsw i32 %590, %591, !dbg !991
  %593 = sext i32 %592 to i64, !dbg !991
  %594 = load i32*** %9, align 8, !dbg !991
  %595 = getelementptr inbounds i32** %594, i64 1, !dbg !991
  %596 = load i32** %595, align 8, !dbg !991
  %597 = getelementptr inbounds i32* %596, i64 %593, !dbg !991
  %598 = load i32* %597, align 4, !dbg !991
  %599 = add nsw i32 %589, %598, !dbg !991
  %600 = load i32* %7, align 4, !dbg !991
  %601 = mul nsw i32 %599, %600, !dbg !991
  %602 = add nsw i32 %601, 128, !dbg !991
  %603 = ashr i32 %602, 8, !dbg !991
  br label %605, !dbg !991

; <label>:604                                     ; preds = %547
  br label %605, !dbg !993

; <label>:605                                     ; preds = %604, %579
  %606 = phi i32 [ %603, %579 ], [ 0, %604 ], !dbg !989
  %607 = load i32* %thismse, align 4, !dbg !995
  %608 = add nsw i32 %606, %607, !dbg !995
  store i32 %608, i32* %up, align 4, !dbg !995
  %609 = load i32* %besterr, align 4, !dbg !995
  %610 = icmp ult i32 %608, %609, !dbg !995
  br i1 %610, label %611, label %620, !dbg !998

; <label>:611                                     ; preds = %605
  %612 = load i32* %up, align 4, !dbg !999
  store i32 %612, i32* %besterr, align 4, !dbg !999
  %613 = load i32* %tr, align 4, !dbg !999
  %614 = sub nsw i32 %613, 2, !dbg !999
  store i32 %614, i32* %br, align 4, !dbg !999
  %615 = load i32* %tc, align 4, !dbg !999
  store i32 %615, i32* %bc, align 4, !dbg !999
  %616 = load i32* %thismse, align 4, !dbg !999
  %617 = load i32** %10, align 8, !dbg !999
  store i32 %616, i32* %617, align 4, !dbg !999
  %618 = load i32* %sse, align 4, !dbg !999
  %619 = load i32** %11, align 8, !dbg !999
  store i32 %618, i32* %619, align 4, !dbg !999
  br label %620, !dbg !999

; <label>:620                                     ; preds = %611, %605
  br label %622, !dbg !1002

; <label>:621                                     ; preds = %542, %537, %533, %529
  store i32 -1, i32* %up, align 4, !dbg !1005
  br label %622

; <label>:622                                     ; preds = %621, %620
  %623 = load i32* %tc, align 4, !dbg !1010
  %624 = load i32* %minc, align 4, !dbg !1010
  %625 = icmp sge i32 %623, %624, !dbg !1010
  br i1 %625, label %626, label %714, !dbg !1012

; <label>:626                                     ; preds = %622
  %627 = load i32* %tc, align 4, !dbg !1013
  %628 = load i32* %maxc, align 4, !dbg !1013
  %629 = icmp sle i32 %627, %628, !dbg !1013
  br i1 %629, label %630, label %714, !dbg !1012

; <label>:630                                     ; preds = %626
  %631 = load i32* %tr, align 4, !dbg !1015
  %632 = add nsw i32 %631, 2, !dbg !1015
  %633 = load i32* %minr, align 4, !dbg !1015
  %634 = icmp sge i32 %632, %633, !dbg !1015
  br i1 %634, label %635, label %714, !dbg !1012

; <label>:635                                     ; preds = %630
  %636 = load i32* %tr, align 4, !dbg !1017
  %637 = add nsw i32 %636, 2, !dbg !1017
  %638 = load i32* %maxr, align 4, !dbg !1017
  %639 = icmp sle i32 %637, %638, !dbg !1017
  br i1 %639, label %640, label %714, !dbg !1012

; <label>:640                                     ; preds = %635
  %641 = load %struct.variance_vtable** %8, align 8, !dbg !1019
  %642 = getelementptr inbounds %struct.variance_vtable* %641, i32 0, i32 2, !dbg !1019
  %643 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %642, align 8, !dbg !1019
  %644 = load i8** %y, align 8, !dbg !1019
  %645 = load i32* %tr, align 4, !dbg !1019
  %646 = add nsw i32 %645, 2, !dbg !1019
  %647 = ashr i32 %646, 2, !dbg !1019
  %648 = load i32* %y_stride, align 4, !dbg !1019
  %649 = mul nsw i32 %647, %648, !dbg !1019
  %650 = load i32* %tc, align 4, !dbg !1019
  %651 = ashr i32 %650, 2, !dbg !1019
  %652 = add nsw i32 %649, %651, !dbg !1019
  %653 = load i32* %offset, align 4, !dbg !1019
  %654 = sub nsw i32 %652, %653, !dbg !1019
  %655 = sext i32 %654 to i64, !dbg !1019
  %656 = getelementptr inbounds i8* %644, i64 %655, !dbg !1019
  %657 = load i32* %y_stride, align 4, !dbg !1019
  %658 = load i32* %tc, align 4, !dbg !1019
  %659 = and i32 %658, 3, !dbg !1019
  %660 = shl i32 %659, 1, !dbg !1019
  %661 = load i32* %tr, align 4, !dbg !1019
  %662 = add nsw i32 %661, 2, !dbg !1019
  %663 = and i32 %662, 3, !dbg !1019
  %664 = shl i32 %663, 1, !dbg !1019
  %665 = load i8** %z, align 8, !dbg !1019
  %666 = load %struct.block** %3, align 8, !dbg !1019
  %667 = getelementptr inbounds %struct.block* %666, i32 0, i32 11, !dbg !1019
  %668 = load i32* %667, align 4, !dbg !1019
  %669 = call i32 %643(i8* %656, i32 %657, i32 %660, i32 %664, i8* %665, i32 %668, i32* %sse), !dbg !1019
  store i32 %669, i32* %thismse, align 4, !dbg !1019
  %670 = load i32*** %9, align 8, !dbg !1022
  %671 = icmp ne i32** %670, null, !dbg !1022
  br i1 %671, label %672, label %697, !dbg !1022

; <label>:672                                     ; preds = %640
  %673 = load i32* %tr, align 4, !dbg !1024
  %674 = add nsw i32 %673, 2, !dbg !1024
  %675 = load i32* %rr, align 4, !dbg !1024
  %676 = sub nsw i32 %674, %675, !dbg !1024
  %677 = sext i32 %676 to i64, !dbg !1024
  %678 = load i32*** %9, align 8, !dbg !1024
  %679 = getelementptr inbounds i32** %678, i64 0, !dbg !1024
  %680 = load i32** %679, align 8, !dbg !1024
  %681 = getelementptr inbounds i32* %680, i64 %677, !dbg !1024
  %682 = load i32* %681, align 4, !dbg !1024
  %683 = load i32* %tc, align 4, !dbg !1024
  %684 = load i32* %rc, align 4, !dbg !1024
  %685 = sub nsw i32 %683, %684, !dbg !1024
  %686 = sext i32 %685 to i64, !dbg !1024
  %687 = load i32*** %9, align 8, !dbg !1024
  %688 = getelementptr inbounds i32** %687, i64 1, !dbg !1024
  %689 = load i32** %688, align 8, !dbg !1024
  %690 = getelementptr inbounds i32* %689, i64 %686, !dbg !1024
  %691 = load i32* %690, align 4, !dbg !1024
  %692 = add nsw i32 %682, %691, !dbg !1024
  %693 = load i32* %7, align 4, !dbg !1024
  %694 = mul nsw i32 %692, %693, !dbg !1024
  %695 = add nsw i32 %694, 128, !dbg !1024
  %696 = ashr i32 %695, 8, !dbg !1024
  br label %698, !dbg !1024

; <label>:697                                     ; preds = %640
  br label %698, !dbg !1026

; <label>:698                                     ; preds = %697, %672
  %699 = phi i32 [ %696, %672 ], [ 0, %697 ], !dbg !1022
  %700 = load i32* %thismse, align 4, !dbg !1028
  %701 = add nsw i32 %699, %700, !dbg !1028
  store i32 %701, i32* %down, align 4, !dbg !1028
  %702 = load i32* %besterr, align 4, !dbg !1028
  %703 = icmp ult i32 %701, %702, !dbg !1028
  br i1 %703, label %704, label %713, !dbg !1031

; <label>:704                                     ; preds = %698
  %705 = load i32* %down, align 4, !dbg !1032
  store i32 %705, i32* %besterr, align 4, !dbg !1032
  %706 = load i32* %tr, align 4, !dbg !1032
  %707 = add nsw i32 %706, 2, !dbg !1032
  store i32 %707, i32* %br, align 4, !dbg !1032
  %708 = load i32* %tc, align 4, !dbg !1032
  store i32 %708, i32* %bc, align 4, !dbg !1032
  %709 = load i32* %thismse, align 4, !dbg !1032
  %710 = load i32** %10, align 8, !dbg !1032
  store i32 %709, i32* %710, align 4, !dbg !1032
  %711 = load i32* %sse, align 4, !dbg !1032
  %712 = load i32** %11, align 8, !dbg !1032
  store i32 %711, i32* %712, align 4, !dbg !1032
  br label %713, !dbg !1032

; <label>:713                                     ; preds = %704, %698
  br label %715, !dbg !1035

; <label>:714                                     ; preds = %635, %630, %626, %622
  store i32 -1, i32* %down, align 4, !dbg !1038
  br label %715

; <label>:715                                     ; preds = %714, %713
  %716 = load i32* %left, align 4, !dbg !1043
  %717 = load i32* %right, align 4, !dbg !1044
  %718 = icmp ult i32 %716, %717, !dbg !1043
  %719 = select i1 %718, i32 0, i32 1, !dbg !1043
  %720 = load i32* %up, align 4, !dbg !1045
  %721 = load i32* %down, align 4, !dbg !1046
  %722 = icmp ult i32 %720, %721, !dbg !1045
  %723 = select i1 %722, i32 0, i32 2, !dbg !1045
  %724 = add nsw i32 %719, %723, !dbg !1047
  store i32 %724, i32* %whichdir, align 4, !dbg !1048
  %725 = load i32* %whichdir, align 4, !dbg !1049
  switch i32 %725, label %1126 [
    i32 0, label %726
    i32 1, label %826
    i32 2, label %926
    i32 3, label %1026
  ], !dbg !1050

; <label>:726                                     ; preds = %715
  %727 = load i32* %tc, align 4, !dbg !1051
  %728 = sub nsw i32 %727, 2, !dbg !1051
  %729 = load i32* %minc, align 4, !dbg !1051
  %730 = icmp sge i32 %728, %729, !dbg !1051
  br i1 %730, label %731, label %824, !dbg !1054

; <label>:731                                     ; preds = %726
  %732 = load i32* %tc, align 4, !dbg !1055
  %733 = sub nsw i32 %732, 2, !dbg !1055
  %734 = load i32* %maxc, align 4, !dbg !1055
  %735 = icmp sle i32 %733, %734, !dbg !1055
  br i1 %735, label %736, label %824, !dbg !1054

; <label>:736                                     ; preds = %731
  %737 = load i32* %tr, align 4, !dbg !1057
  %738 = sub nsw i32 %737, 2, !dbg !1057
  %739 = load i32* %minr, align 4, !dbg !1057
  %740 = icmp sge i32 %738, %739, !dbg !1057
  br i1 %740, label %741, label %824, !dbg !1054

; <label>:741                                     ; preds = %736
  %742 = load i32* %tr, align 4, !dbg !1059
  %743 = sub nsw i32 %742, 2, !dbg !1059
  %744 = load i32* %maxr, align 4, !dbg !1059
  %745 = icmp sle i32 %743, %744, !dbg !1059
  br i1 %745, label %746, label %824, !dbg !1054

; <label>:746                                     ; preds = %741
  %747 = load %struct.variance_vtable** %8, align 8, !dbg !1061
  %748 = getelementptr inbounds %struct.variance_vtable* %747, i32 0, i32 2, !dbg !1061
  %749 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %748, align 8, !dbg !1061
  %750 = load i8** %y, align 8, !dbg !1061
  %751 = load i32* %tr, align 4, !dbg !1061
  %752 = sub nsw i32 %751, 2, !dbg !1061
  %753 = ashr i32 %752, 2, !dbg !1061
  %754 = load i32* %y_stride, align 4, !dbg !1061
  %755 = mul nsw i32 %753, %754, !dbg !1061
  %756 = load i32* %tc, align 4, !dbg !1061
  %757 = sub nsw i32 %756, 2, !dbg !1061
  %758 = ashr i32 %757, 2, !dbg !1061
  %759 = add nsw i32 %755, %758, !dbg !1061
  %760 = load i32* %offset, align 4, !dbg !1061
  %761 = sub nsw i32 %759, %760, !dbg !1061
  %762 = sext i32 %761 to i64, !dbg !1061
  %763 = getelementptr inbounds i8* %750, i64 %762, !dbg !1061
  %764 = load i32* %y_stride, align 4, !dbg !1061
  %765 = load i32* %tc, align 4, !dbg !1061
  %766 = sub nsw i32 %765, 2, !dbg !1061
  %767 = and i32 %766, 3, !dbg !1061
  %768 = shl i32 %767, 1, !dbg !1061
  %769 = load i32* %tr, align 4, !dbg !1061
  %770 = sub nsw i32 %769, 2, !dbg !1061
  %771 = and i32 %770, 3, !dbg !1061
  %772 = shl i32 %771, 1, !dbg !1061
  %773 = load i8** %z, align 8, !dbg !1061
  %774 = load %struct.block** %3, align 8, !dbg !1061
  %775 = getelementptr inbounds %struct.block* %774, i32 0, i32 11, !dbg !1061
  %776 = load i32* %775, align 4, !dbg !1061
  %777 = call i32 %749(i8* %763, i32 %764, i32 %768, i32 %772, i8* %773, i32 %776, i32* %sse), !dbg !1061
  store i32 %777, i32* %thismse, align 4, !dbg !1061
  %778 = load i32*** %9, align 8, !dbg !1064
  %779 = icmp ne i32** %778, null, !dbg !1064
  br i1 %779, label %780, label %806, !dbg !1064

; <label>:780                                     ; preds = %746
  %781 = load i32* %tr, align 4, !dbg !1066
  %782 = sub nsw i32 %781, 2, !dbg !1066
  %783 = load i32* %rr, align 4, !dbg !1066
  %784 = sub nsw i32 %782, %783, !dbg !1066
  %785 = sext i32 %784 to i64, !dbg !1066
  %786 = load i32*** %9, align 8, !dbg !1066
  %787 = getelementptr inbounds i32** %786, i64 0, !dbg !1066
  %788 = load i32** %787, align 8, !dbg !1066
  %789 = getelementptr inbounds i32* %788, i64 %785, !dbg !1066
  %790 = load i32* %789, align 4, !dbg !1066
  %791 = load i32* %tc, align 4, !dbg !1066
  %792 = sub nsw i32 %791, 2, !dbg !1066
  %793 = load i32* %rc, align 4, !dbg !1066
  %794 = sub nsw i32 %792, %793, !dbg !1066
  %795 = sext i32 %794 to i64, !dbg !1066
  %796 = load i32*** %9, align 8, !dbg !1066
  %797 = getelementptr inbounds i32** %796, i64 1, !dbg !1066
  %798 = load i32** %797, align 8, !dbg !1066
  %799 = getelementptr inbounds i32* %798, i64 %795, !dbg !1066
  %800 = load i32* %799, align 4, !dbg !1066
  %801 = add nsw i32 %790, %800, !dbg !1066
  %802 = load i32* %7, align 4, !dbg !1066
  %803 = mul nsw i32 %801, %802, !dbg !1066
  %804 = add nsw i32 %803, 128, !dbg !1066
  %805 = ashr i32 %804, 8, !dbg !1066
  br label %807, !dbg !1066

; <label>:806                                     ; preds = %746
  br label %807, !dbg !1068

; <label>:807                                     ; preds = %806, %780
  %808 = phi i32 [ %805, %780 ], [ 0, %806 ], !dbg !1064
  %809 = load i32* %thismse, align 4, !dbg !1070
  %810 = add nsw i32 %808, %809, !dbg !1070
  store i32 %810, i32* %diag, align 4, !dbg !1070
  %811 = load i32* %besterr, align 4, !dbg !1070
  %812 = icmp ult i32 %810, %811, !dbg !1070
  br i1 %812, label %813, label %823, !dbg !1073

; <label>:813                                     ; preds = %807
  %814 = load i32* %diag, align 4, !dbg !1074
  store i32 %814, i32* %besterr, align 4, !dbg !1074
  %815 = load i32* %tr, align 4, !dbg !1074
  %816 = sub nsw i32 %815, 2, !dbg !1074
  store i32 %816, i32* %br, align 4, !dbg !1074
  %817 = load i32* %tc, align 4, !dbg !1074
  %818 = sub nsw i32 %817, 2, !dbg !1074
  store i32 %818, i32* %bc, align 4, !dbg !1074
  %819 = load i32* %thismse, align 4, !dbg !1074
  %820 = load i32** %10, align 8, !dbg !1074
  store i32 %819, i32* %820, align 4, !dbg !1074
  %821 = load i32* %sse, align 4, !dbg !1074
  %822 = load i32** %11, align 8, !dbg !1074
  store i32 %821, i32* %822, align 4, !dbg !1074
  br label %823, !dbg !1074

; <label>:823                                     ; preds = %813, %807
  br label %825, !dbg !1077

; <label>:824                                     ; preds = %741, %736, %731, %726
  store i32 -1, i32* %diag, align 4, !dbg !1080
  br label %825

; <label>:825                                     ; preds = %824, %823
  br label %1126, !dbg !1085

; <label>:826                                     ; preds = %715
  %827 = load i32* %tc, align 4, !dbg !1086
  %828 = add nsw i32 %827, 2, !dbg !1086
  %829 = load i32* %minc, align 4, !dbg !1086
  %830 = icmp sge i32 %828, %829, !dbg !1086
  br i1 %830, label %831, label %924, !dbg !1088

; <label>:831                                     ; preds = %826
  %832 = load i32* %tc, align 4, !dbg !1089
  %833 = add nsw i32 %832, 2, !dbg !1089
  %834 = load i32* %maxc, align 4, !dbg !1089
  %835 = icmp sle i32 %833, %834, !dbg !1089
  br i1 %835, label %836, label %924, !dbg !1088

; <label>:836                                     ; preds = %831
  %837 = load i32* %tr, align 4, !dbg !1091
  %838 = sub nsw i32 %837, 2, !dbg !1091
  %839 = load i32* %minr, align 4, !dbg !1091
  %840 = icmp sge i32 %838, %839, !dbg !1091
  br i1 %840, label %841, label %924, !dbg !1088

; <label>:841                                     ; preds = %836
  %842 = load i32* %tr, align 4, !dbg !1093
  %843 = sub nsw i32 %842, 2, !dbg !1093
  %844 = load i32* %maxr, align 4, !dbg !1093
  %845 = icmp sle i32 %843, %844, !dbg !1093
  br i1 %845, label %846, label %924, !dbg !1088

; <label>:846                                     ; preds = %841
  %847 = load %struct.variance_vtable** %8, align 8, !dbg !1095
  %848 = getelementptr inbounds %struct.variance_vtable* %847, i32 0, i32 2, !dbg !1095
  %849 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %848, align 8, !dbg !1095
  %850 = load i8** %y, align 8, !dbg !1095
  %851 = load i32* %tr, align 4, !dbg !1095
  %852 = sub nsw i32 %851, 2, !dbg !1095
  %853 = ashr i32 %852, 2, !dbg !1095
  %854 = load i32* %y_stride, align 4, !dbg !1095
  %855 = mul nsw i32 %853, %854, !dbg !1095
  %856 = load i32* %tc, align 4, !dbg !1095
  %857 = add nsw i32 %856, 2, !dbg !1095
  %858 = ashr i32 %857, 2, !dbg !1095
  %859 = add nsw i32 %855, %858, !dbg !1095
  %860 = load i32* %offset, align 4, !dbg !1095
  %861 = sub nsw i32 %859, %860, !dbg !1095
  %862 = sext i32 %861 to i64, !dbg !1095
  %863 = getelementptr inbounds i8* %850, i64 %862, !dbg !1095
  %864 = load i32* %y_stride, align 4, !dbg !1095
  %865 = load i32* %tc, align 4, !dbg !1095
  %866 = add nsw i32 %865, 2, !dbg !1095
  %867 = and i32 %866, 3, !dbg !1095
  %868 = shl i32 %867, 1, !dbg !1095
  %869 = load i32* %tr, align 4, !dbg !1095
  %870 = sub nsw i32 %869, 2, !dbg !1095
  %871 = and i32 %870, 3, !dbg !1095
  %872 = shl i32 %871, 1, !dbg !1095
  %873 = load i8** %z, align 8, !dbg !1095
  %874 = load %struct.block** %3, align 8, !dbg !1095
  %875 = getelementptr inbounds %struct.block* %874, i32 0, i32 11, !dbg !1095
  %876 = load i32* %875, align 4, !dbg !1095
  %877 = call i32 %849(i8* %863, i32 %864, i32 %868, i32 %872, i8* %873, i32 %876, i32* %sse), !dbg !1095
  store i32 %877, i32* %thismse, align 4, !dbg !1095
  %878 = load i32*** %9, align 8, !dbg !1098
  %879 = icmp ne i32** %878, null, !dbg !1098
  br i1 %879, label %880, label %906, !dbg !1098

; <label>:880                                     ; preds = %846
  %881 = load i32* %tr, align 4, !dbg !1100
  %882 = sub nsw i32 %881, 2, !dbg !1100
  %883 = load i32* %rr, align 4, !dbg !1100
  %884 = sub nsw i32 %882, %883, !dbg !1100
  %885 = sext i32 %884 to i64, !dbg !1100
  %886 = load i32*** %9, align 8, !dbg !1100
  %887 = getelementptr inbounds i32** %886, i64 0, !dbg !1100
  %888 = load i32** %887, align 8, !dbg !1100
  %889 = getelementptr inbounds i32* %888, i64 %885, !dbg !1100
  %890 = load i32* %889, align 4, !dbg !1100
  %891 = load i32* %tc, align 4, !dbg !1100
  %892 = add nsw i32 %891, 2, !dbg !1100
  %893 = load i32* %rc, align 4, !dbg !1100
  %894 = sub nsw i32 %892, %893, !dbg !1100
  %895 = sext i32 %894 to i64, !dbg !1100
  %896 = load i32*** %9, align 8, !dbg !1100
  %897 = getelementptr inbounds i32** %896, i64 1, !dbg !1100
  %898 = load i32** %897, align 8, !dbg !1100
  %899 = getelementptr inbounds i32* %898, i64 %895, !dbg !1100
  %900 = load i32* %899, align 4, !dbg !1100
  %901 = add nsw i32 %890, %900, !dbg !1100
  %902 = load i32* %7, align 4, !dbg !1100
  %903 = mul nsw i32 %901, %902, !dbg !1100
  %904 = add nsw i32 %903, 128, !dbg !1100
  %905 = ashr i32 %904, 8, !dbg !1100
  br label %907, !dbg !1100

; <label>:906                                     ; preds = %846
  br label %907, !dbg !1102

; <label>:907                                     ; preds = %906, %880
  %908 = phi i32 [ %905, %880 ], [ 0, %906 ], !dbg !1098
  %909 = load i32* %thismse, align 4, !dbg !1104
  %910 = add nsw i32 %908, %909, !dbg !1104
  store i32 %910, i32* %diag, align 4, !dbg !1104
  %911 = load i32* %besterr, align 4, !dbg !1104
  %912 = icmp ult i32 %910, %911, !dbg !1104
  br i1 %912, label %913, label %923, !dbg !1107

; <label>:913                                     ; preds = %907
  %914 = load i32* %diag, align 4, !dbg !1108
  store i32 %914, i32* %besterr, align 4, !dbg !1108
  %915 = load i32* %tr, align 4, !dbg !1108
  %916 = sub nsw i32 %915, 2, !dbg !1108
  store i32 %916, i32* %br, align 4, !dbg !1108
  %917 = load i32* %tc, align 4, !dbg !1108
  %918 = add nsw i32 %917, 2, !dbg !1108
  store i32 %918, i32* %bc, align 4, !dbg !1108
  %919 = load i32* %thismse, align 4, !dbg !1108
  %920 = load i32** %10, align 8, !dbg !1108
  store i32 %919, i32* %920, align 4, !dbg !1108
  %921 = load i32* %sse, align 4, !dbg !1108
  %922 = load i32** %11, align 8, !dbg !1108
  store i32 %921, i32* %922, align 4, !dbg !1108
  br label %923, !dbg !1108

; <label>:923                                     ; preds = %913, %907
  br label %925, !dbg !1111

; <label>:924                                     ; preds = %841, %836, %831, %826
  store i32 -1, i32* %diag, align 4, !dbg !1114
  br label %925

; <label>:925                                     ; preds = %924, %923
  br label %1126, !dbg !1119

; <label>:926                                     ; preds = %715
  %927 = load i32* %tc, align 4, !dbg !1120
  %928 = sub nsw i32 %927, 2, !dbg !1120
  %929 = load i32* %minc, align 4, !dbg !1120
  %930 = icmp sge i32 %928, %929, !dbg !1120
  br i1 %930, label %931, label %1024, !dbg !1122

; <label>:931                                     ; preds = %926
  %932 = load i32* %tc, align 4, !dbg !1123
  %933 = sub nsw i32 %932, 2, !dbg !1123
  %934 = load i32* %maxc, align 4, !dbg !1123
  %935 = icmp sle i32 %933, %934, !dbg !1123
  br i1 %935, label %936, label %1024, !dbg !1122

; <label>:936                                     ; preds = %931
  %937 = load i32* %tr, align 4, !dbg !1125
  %938 = add nsw i32 %937, 2, !dbg !1125
  %939 = load i32* %minr, align 4, !dbg !1125
  %940 = icmp sge i32 %938, %939, !dbg !1125
  br i1 %940, label %941, label %1024, !dbg !1122

; <label>:941                                     ; preds = %936
  %942 = load i32* %tr, align 4, !dbg !1127
  %943 = add nsw i32 %942, 2, !dbg !1127
  %944 = load i32* %maxr, align 4, !dbg !1127
  %945 = icmp sle i32 %943, %944, !dbg !1127
  br i1 %945, label %946, label %1024, !dbg !1122

; <label>:946                                     ; preds = %941
  %947 = load %struct.variance_vtable** %8, align 8, !dbg !1129
  %948 = getelementptr inbounds %struct.variance_vtable* %947, i32 0, i32 2, !dbg !1129
  %949 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %948, align 8, !dbg !1129
  %950 = load i8** %y, align 8, !dbg !1129
  %951 = load i32* %tr, align 4, !dbg !1129
  %952 = add nsw i32 %951, 2, !dbg !1129
  %953 = ashr i32 %952, 2, !dbg !1129
  %954 = load i32* %y_stride, align 4, !dbg !1129
  %955 = mul nsw i32 %953, %954, !dbg !1129
  %956 = load i32* %tc, align 4, !dbg !1129
  %957 = sub nsw i32 %956, 2, !dbg !1129
  %958 = ashr i32 %957, 2, !dbg !1129
  %959 = add nsw i32 %955, %958, !dbg !1129
  %960 = load i32* %offset, align 4, !dbg !1129
  %961 = sub nsw i32 %959, %960, !dbg !1129
  %962 = sext i32 %961 to i64, !dbg !1129
  %963 = getelementptr inbounds i8* %950, i64 %962, !dbg !1129
  %964 = load i32* %y_stride, align 4, !dbg !1129
  %965 = load i32* %tc, align 4, !dbg !1129
  %966 = sub nsw i32 %965, 2, !dbg !1129
  %967 = and i32 %966, 3, !dbg !1129
  %968 = shl i32 %967, 1, !dbg !1129
  %969 = load i32* %tr, align 4, !dbg !1129
  %970 = add nsw i32 %969, 2, !dbg !1129
  %971 = and i32 %970, 3, !dbg !1129
  %972 = shl i32 %971, 1, !dbg !1129
  %973 = load i8** %z, align 8, !dbg !1129
  %974 = load %struct.block** %3, align 8, !dbg !1129
  %975 = getelementptr inbounds %struct.block* %974, i32 0, i32 11, !dbg !1129
  %976 = load i32* %975, align 4, !dbg !1129
  %977 = call i32 %949(i8* %963, i32 %964, i32 %968, i32 %972, i8* %973, i32 %976, i32* %sse), !dbg !1129
  store i32 %977, i32* %thismse, align 4, !dbg !1129
  %978 = load i32*** %9, align 8, !dbg !1132
  %979 = icmp ne i32** %978, null, !dbg !1132
  br i1 %979, label %980, label %1006, !dbg !1132

; <label>:980                                     ; preds = %946
  %981 = load i32* %tr, align 4, !dbg !1134
  %982 = add nsw i32 %981, 2, !dbg !1134
  %983 = load i32* %rr, align 4, !dbg !1134
  %984 = sub nsw i32 %982, %983, !dbg !1134
  %985 = sext i32 %984 to i64, !dbg !1134
  %986 = load i32*** %9, align 8, !dbg !1134
  %987 = getelementptr inbounds i32** %986, i64 0, !dbg !1134
  %988 = load i32** %987, align 8, !dbg !1134
  %989 = getelementptr inbounds i32* %988, i64 %985, !dbg !1134
  %990 = load i32* %989, align 4, !dbg !1134
  %991 = load i32* %tc, align 4, !dbg !1134
  %992 = sub nsw i32 %991, 2, !dbg !1134
  %993 = load i32* %rc, align 4, !dbg !1134
  %994 = sub nsw i32 %992, %993, !dbg !1134
  %995 = sext i32 %994 to i64, !dbg !1134
  %996 = load i32*** %9, align 8, !dbg !1134
  %997 = getelementptr inbounds i32** %996, i64 1, !dbg !1134
  %998 = load i32** %997, align 8, !dbg !1134
  %999 = getelementptr inbounds i32* %998, i64 %995, !dbg !1134
  %1000 = load i32* %999, align 4, !dbg !1134
  %1001 = add nsw i32 %990, %1000, !dbg !1134
  %1002 = load i32* %7, align 4, !dbg !1134
  %1003 = mul nsw i32 %1001, %1002, !dbg !1134
  %1004 = add nsw i32 %1003, 128, !dbg !1134
  %1005 = ashr i32 %1004, 8, !dbg !1134
  br label %1007, !dbg !1134

; <label>:1006                                    ; preds = %946
  br label %1007, !dbg !1136

; <label>:1007                                    ; preds = %1006, %980
  %1008 = phi i32 [ %1005, %980 ], [ 0, %1006 ], !dbg !1132
  %1009 = load i32* %thismse, align 4, !dbg !1138
  %1010 = add nsw i32 %1008, %1009, !dbg !1138
  store i32 %1010, i32* %diag, align 4, !dbg !1138
  %1011 = load i32* %besterr, align 4, !dbg !1138
  %1012 = icmp ult i32 %1010, %1011, !dbg !1138
  br i1 %1012, label %1013, label %1023, !dbg !1141

; <label>:1013                                    ; preds = %1007
  %1014 = load i32* %diag, align 4, !dbg !1142
  store i32 %1014, i32* %besterr, align 4, !dbg !1142
  %1015 = load i32* %tr, align 4, !dbg !1142
  %1016 = add nsw i32 %1015, 2, !dbg !1142
  store i32 %1016, i32* %br, align 4, !dbg !1142
  %1017 = load i32* %tc, align 4, !dbg !1142
  %1018 = sub nsw i32 %1017, 2, !dbg !1142
  store i32 %1018, i32* %bc, align 4, !dbg !1142
  %1019 = load i32* %thismse, align 4, !dbg !1142
  %1020 = load i32** %10, align 8, !dbg !1142
  store i32 %1019, i32* %1020, align 4, !dbg !1142
  %1021 = load i32* %sse, align 4, !dbg !1142
  %1022 = load i32** %11, align 8, !dbg !1142
  store i32 %1021, i32* %1022, align 4, !dbg !1142
  br label %1023, !dbg !1142

; <label>:1023                                    ; preds = %1013, %1007
  br label %1025, !dbg !1145

; <label>:1024                                    ; preds = %941, %936, %931, %926
  store i32 -1, i32* %diag, align 4, !dbg !1148
  br label %1025

; <label>:1025                                    ; preds = %1024, %1023
  br label %1126, !dbg !1153

; <label>:1026                                    ; preds = %715
  %1027 = load i32* %tc, align 4, !dbg !1154
  %1028 = add nsw i32 %1027, 2, !dbg !1154
  %1029 = load i32* %minc, align 4, !dbg !1154
  %1030 = icmp sge i32 %1028, %1029, !dbg !1154
  br i1 %1030, label %1031, label %1124, !dbg !1156

; <label>:1031                                    ; preds = %1026
  %1032 = load i32* %tc, align 4, !dbg !1157
  %1033 = add nsw i32 %1032, 2, !dbg !1157
  %1034 = load i32* %maxc, align 4, !dbg !1157
  %1035 = icmp sle i32 %1033, %1034, !dbg !1157
  br i1 %1035, label %1036, label %1124, !dbg !1156

; <label>:1036                                    ; preds = %1031
  %1037 = load i32* %tr, align 4, !dbg !1159
  %1038 = add nsw i32 %1037, 2, !dbg !1159
  %1039 = load i32* %minr, align 4, !dbg !1159
  %1040 = icmp sge i32 %1038, %1039, !dbg !1159
  br i1 %1040, label %1041, label %1124, !dbg !1156

; <label>:1041                                    ; preds = %1036
  %1042 = load i32* %tr, align 4, !dbg !1161
  %1043 = add nsw i32 %1042, 2, !dbg !1161
  %1044 = load i32* %maxr, align 4, !dbg !1161
  %1045 = icmp sle i32 %1043, %1044, !dbg !1161
  br i1 %1045, label %1046, label %1124, !dbg !1156

; <label>:1046                                    ; preds = %1041
  %1047 = load %struct.variance_vtable** %8, align 8, !dbg !1163
  %1048 = getelementptr inbounds %struct.variance_vtable* %1047, i32 0, i32 2, !dbg !1163
  %1049 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1048, align 8, !dbg !1163
  %1050 = load i8** %y, align 8, !dbg !1163
  %1051 = load i32* %tr, align 4, !dbg !1163
  %1052 = add nsw i32 %1051, 2, !dbg !1163
  %1053 = ashr i32 %1052, 2, !dbg !1163
  %1054 = load i32* %y_stride, align 4, !dbg !1163
  %1055 = mul nsw i32 %1053, %1054, !dbg !1163
  %1056 = load i32* %tc, align 4, !dbg !1163
  %1057 = add nsw i32 %1056, 2, !dbg !1163
  %1058 = ashr i32 %1057, 2, !dbg !1163
  %1059 = add nsw i32 %1055, %1058, !dbg !1163
  %1060 = load i32* %offset, align 4, !dbg !1163
  %1061 = sub nsw i32 %1059, %1060, !dbg !1163
  %1062 = sext i32 %1061 to i64, !dbg !1163
  %1063 = getelementptr inbounds i8* %1050, i64 %1062, !dbg !1163
  %1064 = load i32* %y_stride, align 4, !dbg !1163
  %1065 = load i32* %tc, align 4, !dbg !1163
  %1066 = add nsw i32 %1065, 2, !dbg !1163
  %1067 = and i32 %1066, 3, !dbg !1163
  %1068 = shl i32 %1067, 1, !dbg !1163
  %1069 = load i32* %tr, align 4, !dbg !1163
  %1070 = add nsw i32 %1069, 2, !dbg !1163
  %1071 = and i32 %1070, 3, !dbg !1163
  %1072 = shl i32 %1071, 1, !dbg !1163
  %1073 = load i8** %z, align 8, !dbg !1163
  %1074 = load %struct.block** %3, align 8, !dbg !1163
  %1075 = getelementptr inbounds %struct.block* %1074, i32 0, i32 11, !dbg !1163
  %1076 = load i32* %1075, align 4, !dbg !1163
  %1077 = call i32 %1049(i8* %1063, i32 %1064, i32 %1068, i32 %1072, i8* %1073, i32 %1076, i32* %sse), !dbg !1163
  store i32 %1077, i32* %thismse, align 4, !dbg !1163
  %1078 = load i32*** %9, align 8, !dbg !1166
  %1079 = icmp ne i32** %1078, null, !dbg !1166
  br i1 %1079, label %1080, label %1106, !dbg !1166

; <label>:1080                                    ; preds = %1046
  %1081 = load i32* %tr, align 4, !dbg !1168
  %1082 = add nsw i32 %1081, 2, !dbg !1168
  %1083 = load i32* %rr, align 4, !dbg !1168
  %1084 = sub nsw i32 %1082, %1083, !dbg !1168
  %1085 = sext i32 %1084 to i64, !dbg !1168
  %1086 = load i32*** %9, align 8, !dbg !1168
  %1087 = getelementptr inbounds i32** %1086, i64 0, !dbg !1168
  %1088 = load i32** %1087, align 8, !dbg !1168
  %1089 = getelementptr inbounds i32* %1088, i64 %1085, !dbg !1168
  %1090 = load i32* %1089, align 4, !dbg !1168
  %1091 = load i32* %tc, align 4, !dbg !1168
  %1092 = add nsw i32 %1091, 2, !dbg !1168
  %1093 = load i32* %rc, align 4, !dbg !1168
  %1094 = sub nsw i32 %1092, %1093, !dbg !1168
  %1095 = sext i32 %1094 to i64, !dbg !1168
  %1096 = load i32*** %9, align 8, !dbg !1168
  %1097 = getelementptr inbounds i32** %1096, i64 1, !dbg !1168
  %1098 = load i32** %1097, align 8, !dbg !1168
  %1099 = getelementptr inbounds i32* %1098, i64 %1095, !dbg !1168
  %1100 = load i32* %1099, align 4, !dbg !1168
  %1101 = add nsw i32 %1090, %1100, !dbg !1168
  %1102 = load i32* %7, align 4, !dbg !1168
  %1103 = mul nsw i32 %1101, %1102, !dbg !1168
  %1104 = add nsw i32 %1103, 128, !dbg !1168
  %1105 = ashr i32 %1104, 8, !dbg !1168
  br label %1107, !dbg !1168

; <label>:1106                                    ; preds = %1046
  br label %1107, !dbg !1170

; <label>:1107                                    ; preds = %1106, %1080
  %1108 = phi i32 [ %1105, %1080 ], [ 0, %1106 ], !dbg !1166
  %1109 = load i32* %thismse, align 4, !dbg !1172
  %1110 = add nsw i32 %1108, %1109, !dbg !1172
  store i32 %1110, i32* %diag, align 4, !dbg !1172
  %1111 = load i32* %besterr, align 4, !dbg !1172
  %1112 = icmp ult i32 %1110, %1111, !dbg !1172
  br i1 %1112, label %1113, label %1123, !dbg !1175

; <label>:1113                                    ; preds = %1107
  %1114 = load i32* %diag, align 4, !dbg !1176
  store i32 %1114, i32* %besterr, align 4, !dbg !1176
  %1115 = load i32* %tr, align 4, !dbg !1176
  %1116 = add nsw i32 %1115, 2, !dbg !1176
  store i32 %1116, i32* %br, align 4, !dbg !1176
  %1117 = load i32* %tc, align 4, !dbg !1176
  %1118 = add nsw i32 %1117, 2, !dbg !1176
  store i32 %1118, i32* %bc, align 4, !dbg !1176
  %1119 = load i32* %thismse, align 4, !dbg !1176
  %1120 = load i32** %10, align 8, !dbg !1176
  store i32 %1119, i32* %1120, align 4, !dbg !1176
  %1121 = load i32* %sse, align 4, !dbg !1176
  %1122 = load i32** %11, align 8, !dbg !1176
  store i32 %1121, i32* %1122, align 4, !dbg !1176
  br label %1123, !dbg !1176

; <label>:1123                                    ; preds = %1113, %1107
  br label %1125, !dbg !1179

; <label>:1124                                    ; preds = %1041, %1036, %1031, %1026
  store i32 -1, i32* %diag, align 4, !dbg !1182
  br label %1125

; <label>:1125                                    ; preds = %1124, %1123
  br label %1126, !dbg !1187

; <label>:1126                                    ; preds = %715, %1125, %1025, %925, %825
  %1127 = load i32* %tr, align 4, !dbg !1188
  %1128 = load i32* %br, align 4, !dbg !1190
  %1129 = icmp eq i32 %1127, %1128, !dbg !1188
  br i1 %1129, label %1130, label %1135, !dbg !1191

; <label>:1130                                    ; preds = %1126
  %1131 = load i32* %tc, align 4, !dbg !1192
  %1132 = load i32* %bc, align 4, !dbg !1194
  %1133 = icmp eq i32 %1131, %1132, !dbg !1195
  br i1 %1133, label %1134, label %1135, !dbg !1191

; <label>:1134                                    ; preds = %1130
  br label %1138, !dbg !1196

; <label>:1135                                    ; preds = %1130, %1126
  %1136 = load i32* %br, align 4, !dbg !1197
  store i32 %1136, i32* %tr, align 4, !dbg !1198
  %1137 = load i32* %bc, align 4, !dbg !1199
  store i32 %1137, i32* %tc, align 4, !dbg !1200
  br label %339, !dbg !907

; <label>:1138                                    ; preds = %1134, %339
  br label %1139, !dbg !1201

; <label>:1139                                    ; preds = %1935, %1138
  %1140 = load i32* %quarteriters, align 4, !dbg !1202
  %1141 = add i32 %1140, -1, !dbg !1202
  store i32 %1141, i32* %quarteriters, align 4, !dbg !1202
  %1142 = icmp ne i32 %1141, 0, !dbg !1201
  br i1 %1142, label %1143, label %1938, !dbg !1201

; <label>:1143                                    ; preds = %1139
  %1144 = load i32* %tc, align 4, !dbg !1203
  %1145 = sub nsw i32 %1144, 1, !dbg !1203
  %1146 = load i32* %minc, align 4, !dbg !1203
  %1147 = icmp sge i32 %1145, %1146, !dbg !1203
  br i1 %1147, label %1148, label %1235, !dbg !1206

; <label>:1148                                    ; preds = %1143
  %1149 = load i32* %tc, align 4, !dbg !1207
  %1150 = sub nsw i32 %1149, 1, !dbg !1207
  %1151 = load i32* %maxc, align 4, !dbg !1207
  %1152 = icmp sle i32 %1150, %1151, !dbg !1207
  br i1 %1152, label %1153, label %1235, !dbg !1206

; <label>:1153                                    ; preds = %1148
  %1154 = load i32* %tr, align 4, !dbg !1209
  %1155 = load i32* %minr, align 4, !dbg !1209
  %1156 = icmp sge i32 %1154, %1155, !dbg !1209
  br i1 %1156, label %1157, label %1235, !dbg !1206

; <label>:1157                                    ; preds = %1153
  %1158 = load i32* %tr, align 4, !dbg !1211
  %1159 = load i32* %maxr, align 4, !dbg !1211
  %1160 = icmp sle i32 %1158, %1159, !dbg !1211
  br i1 %1160, label %1161, label %1235, !dbg !1206

; <label>:1161                                    ; preds = %1157
  %1162 = load %struct.variance_vtable** %8, align 8, !dbg !1213
  %1163 = getelementptr inbounds %struct.variance_vtable* %1162, i32 0, i32 2, !dbg !1213
  %1164 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1163, align 8, !dbg !1213
  %1165 = load i8** %y, align 8, !dbg !1213
  %1166 = load i32* %tr, align 4, !dbg !1213
  %1167 = ashr i32 %1166, 2, !dbg !1213
  %1168 = load i32* %y_stride, align 4, !dbg !1213
  %1169 = mul nsw i32 %1167, %1168, !dbg !1213
  %1170 = load i32* %tc, align 4, !dbg !1213
  %1171 = sub nsw i32 %1170, 1, !dbg !1213
  %1172 = ashr i32 %1171, 2, !dbg !1213
  %1173 = add nsw i32 %1169, %1172, !dbg !1213
  %1174 = load i32* %offset, align 4, !dbg !1213
  %1175 = sub nsw i32 %1173, %1174, !dbg !1213
  %1176 = sext i32 %1175 to i64, !dbg !1213
  %1177 = getelementptr inbounds i8* %1165, i64 %1176, !dbg !1213
  %1178 = load i32* %y_stride, align 4, !dbg !1213
  %1179 = load i32* %tc, align 4, !dbg !1213
  %1180 = sub nsw i32 %1179, 1, !dbg !1213
  %1181 = and i32 %1180, 3, !dbg !1213
  %1182 = shl i32 %1181, 1, !dbg !1213
  %1183 = load i32* %tr, align 4, !dbg !1213
  %1184 = and i32 %1183, 3, !dbg !1213
  %1185 = shl i32 %1184, 1, !dbg !1213
  %1186 = load i8** %z, align 8, !dbg !1213
  %1187 = load %struct.block** %3, align 8, !dbg !1213
  %1188 = getelementptr inbounds %struct.block* %1187, i32 0, i32 11, !dbg !1213
  %1189 = load i32* %1188, align 4, !dbg !1213
  %1190 = call i32 %1164(i8* %1177, i32 %1178, i32 %1182, i32 %1185, i8* %1186, i32 %1189, i32* %sse), !dbg !1213
  store i32 %1190, i32* %thismse, align 4, !dbg !1213
  %1191 = load i32*** %9, align 8, !dbg !1216
  %1192 = icmp ne i32** %1191, null, !dbg !1216
  br i1 %1192, label %1193, label %1218, !dbg !1216

; <label>:1193                                    ; preds = %1161
  %1194 = load i32* %tr, align 4, !dbg !1218
  %1195 = load i32* %rr, align 4, !dbg !1218
  %1196 = sub nsw i32 %1194, %1195, !dbg !1218
  %1197 = sext i32 %1196 to i64, !dbg !1218
  %1198 = load i32*** %9, align 8, !dbg !1218
  %1199 = getelementptr inbounds i32** %1198, i64 0, !dbg !1218
  %1200 = load i32** %1199, align 8, !dbg !1218
  %1201 = getelementptr inbounds i32* %1200, i64 %1197, !dbg !1218
  %1202 = load i32* %1201, align 4, !dbg !1218
  %1203 = load i32* %tc, align 4, !dbg !1218
  %1204 = sub nsw i32 %1203, 1, !dbg !1218
  %1205 = load i32* %rc, align 4, !dbg !1218
  %1206 = sub nsw i32 %1204, %1205, !dbg !1218
  %1207 = sext i32 %1206 to i64, !dbg !1218
  %1208 = load i32*** %9, align 8, !dbg !1218
  %1209 = getelementptr inbounds i32** %1208, i64 1, !dbg !1218
  %1210 = load i32** %1209, align 8, !dbg !1218
  %1211 = getelementptr inbounds i32* %1210, i64 %1207, !dbg !1218
  %1212 = load i32* %1211, align 4, !dbg !1218
  %1213 = add nsw i32 %1202, %1212, !dbg !1218
  %1214 = load i32* %7, align 4, !dbg !1218
  %1215 = mul nsw i32 %1213, %1214, !dbg !1218
  %1216 = add nsw i32 %1215, 128, !dbg !1218
  %1217 = ashr i32 %1216, 8, !dbg !1218
  br label %1219, !dbg !1218

; <label>:1218                                    ; preds = %1161
  br label %1219, !dbg !1220

; <label>:1219                                    ; preds = %1218, %1193
  %1220 = phi i32 [ %1217, %1193 ], [ 0, %1218 ], !dbg !1216
  %1221 = load i32* %thismse, align 4, !dbg !1222
  %1222 = add nsw i32 %1220, %1221, !dbg !1222
  store i32 %1222, i32* %left, align 4, !dbg !1222
  %1223 = load i32* %besterr, align 4, !dbg !1222
  %1224 = icmp ult i32 %1222, %1223, !dbg !1222
  br i1 %1224, label %1225, label %1234, !dbg !1225

; <label>:1225                                    ; preds = %1219
  %1226 = load i32* %left, align 4, !dbg !1226
  store i32 %1226, i32* %besterr, align 4, !dbg !1226
  %1227 = load i32* %tr, align 4, !dbg !1226
  store i32 %1227, i32* %br, align 4, !dbg !1226
  %1228 = load i32* %tc, align 4, !dbg !1226
  %1229 = sub nsw i32 %1228, 1, !dbg !1226
  store i32 %1229, i32* %bc, align 4, !dbg !1226
  %1230 = load i32* %thismse, align 4, !dbg !1226
  %1231 = load i32** %10, align 8, !dbg !1226
  store i32 %1230, i32* %1231, align 4, !dbg !1226
  %1232 = load i32* %sse, align 4, !dbg !1226
  %1233 = load i32** %11, align 8, !dbg !1226
  store i32 %1232, i32* %1233, align 4, !dbg !1226
  br label %1234, !dbg !1226

; <label>:1234                                    ; preds = %1225, %1219
  br label %1236, !dbg !1229

; <label>:1235                                    ; preds = %1157, %1153, %1148, %1143
  store i32 -1, i32* %left, align 4, !dbg !1232
  br label %1236

; <label>:1236                                    ; preds = %1235, %1234
  %1237 = load i32* %tc, align 4, !dbg !1237
  %1238 = add nsw i32 %1237, 1, !dbg !1237
  %1239 = load i32* %minc, align 4, !dbg !1237
  %1240 = icmp sge i32 %1238, %1239, !dbg !1237
  br i1 %1240, label %1241, label %1328, !dbg !1239

; <label>:1241                                    ; preds = %1236
  %1242 = load i32* %tc, align 4, !dbg !1240
  %1243 = add nsw i32 %1242, 1, !dbg !1240
  %1244 = load i32* %maxc, align 4, !dbg !1240
  %1245 = icmp sle i32 %1243, %1244, !dbg !1240
  br i1 %1245, label %1246, label %1328, !dbg !1239

; <label>:1246                                    ; preds = %1241
  %1247 = load i32* %tr, align 4, !dbg !1242
  %1248 = load i32* %minr, align 4, !dbg !1242
  %1249 = icmp sge i32 %1247, %1248, !dbg !1242
  br i1 %1249, label %1250, label %1328, !dbg !1239

; <label>:1250                                    ; preds = %1246
  %1251 = load i32* %tr, align 4, !dbg !1244
  %1252 = load i32* %maxr, align 4, !dbg !1244
  %1253 = icmp sle i32 %1251, %1252, !dbg !1244
  br i1 %1253, label %1254, label %1328, !dbg !1239

; <label>:1254                                    ; preds = %1250
  %1255 = load %struct.variance_vtable** %8, align 8, !dbg !1246
  %1256 = getelementptr inbounds %struct.variance_vtable* %1255, i32 0, i32 2, !dbg !1246
  %1257 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1256, align 8, !dbg !1246
  %1258 = load i8** %y, align 8, !dbg !1246
  %1259 = load i32* %tr, align 4, !dbg !1246
  %1260 = ashr i32 %1259, 2, !dbg !1246
  %1261 = load i32* %y_stride, align 4, !dbg !1246
  %1262 = mul nsw i32 %1260, %1261, !dbg !1246
  %1263 = load i32* %tc, align 4, !dbg !1246
  %1264 = add nsw i32 %1263, 1, !dbg !1246
  %1265 = ashr i32 %1264, 2, !dbg !1246
  %1266 = add nsw i32 %1262, %1265, !dbg !1246
  %1267 = load i32* %offset, align 4, !dbg !1246
  %1268 = sub nsw i32 %1266, %1267, !dbg !1246
  %1269 = sext i32 %1268 to i64, !dbg !1246
  %1270 = getelementptr inbounds i8* %1258, i64 %1269, !dbg !1246
  %1271 = load i32* %y_stride, align 4, !dbg !1246
  %1272 = load i32* %tc, align 4, !dbg !1246
  %1273 = add nsw i32 %1272, 1, !dbg !1246
  %1274 = and i32 %1273, 3, !dbg !1246
  %1275 = shl i32 %1274, 1, !dbg !1246
  %1276 = load i32* %tr, align 4, !dbg !1246
  %1277 = and i32 %1276, 3, !dbg !1246
  %1278 = shl i32 %1277, 1, !dbg !1246
  %1279 = load i8** %z, align 8, !dbg !1246
  %1280 = load %struct.block** %3, align 8, !dbg !1246
  %1281 = getelementptr inbounds %struct.block* %1280, i32 0, i32 11, !dbg !1246
  %1282 = load i32* %1281, align 4, !dbg !1246
  %1283 = call i32 %1257(i8* %1270, i32 %1271, i32 %1275, i32 %1278, i8* %1279, i32 %1282, i32* %sse), !dbg !1246
  store i32 %1283, i32* %thismse, align 4, !dbg !1246
  %1284 = load i32*** %9, align 8, !dbg !1249
  %1285 = icmp ne i32** %1284, null, !dbg !1249
  br i1 %1285, label %1286, label %1311, !dbg !1249

; <label>:1286                                    ; preds = %1254
  %1287 = load i32* %tr, align 4, !dbg !1251
  %1288 = load i32* %rr, align 4, !dbg !1251
  %1289 = sub nsw i32 %1287, %1288, !dbg !1251
  %1290 = sext i32 %1289 to i64, !dbg !1251
  %1291 = load i32*** %9, align 8, !dbg !1251
  %1292 = getelementptr inbounds i32** %1291, i64 0, !dbg !1251
  %1293 = load i32** %1292, align 8, !dbg !1251
  %1294 = getelementptr inbounds i32* %1293, i64 %1290, !dbg !1251
  %1295 = load i32* %1294, align 4, !dbg !1251
  %1296 = load i32* %tc, align 4, !dbg !1251
  %1297 = add nsw i32 %1296, 1, !dbg !1251
  %1298 = load i32* %rc, align 4, !dbg !1251
  %1299 = sub nsw i32 %1297, %1298, !dbg !1251
  %1300 = sext i32 %1299 to i64, !dbg !1251
  %1301 = load i32*** %9, align 8, !dbg !1251
  %1302 = getelementptr inbounds i32** %1301, i64 1, !dbg !1251
  %1303 = load i32** %1302, align 8, !dbg !1251
  %1304 = getelementptr inbounds i32* %1303, i64 %1300, !dbg !1251
  %1305 = load i32* %1304, align 4, !dbg !1251
  %1306 = add nsw i32 %1295, %1305, !dbg !1251
  %1307 = load i32* %7, align 4, !dbg !1251
  %1308 = mul nsw i32 %1306, %1307, !dbg !1251
  %1309 = add nsw i32 %1308, 128, !dbg !1251
  %1310 = ashr i32 %1309, 8, !dbg !1251
  br label %1312, !dbg !1251

; <label>:1311                                    ; preds = %1254
  br label %1312, !dbg !1253

; <label>:1312                                    ; preds = %1311, %1286
  %1313 = phi i32 [ %1310, %1286 ], [ 0, %1311 ], !dbg !1249
  %1314 = load i32* %thismse, align 4, !dbg !1255
  %1315 = add nsw i32 %1313, %1314, !dbg !1255
  store i32 %1315, i32* %right, align 4, !dbg !1255
  %1316 = load i32* %besterr, align 4, !dbg !1255
  %1317 = icmp ult i32 %1315, %1316, !dbg !1255
  br i1 %1317, label %1318, label %1327, !dbg !1258

; <label>:1318                                    ; preds = %1312
  %1319 = load i32* %right, align 4, !dbg !1259
  store i32 %1319, i32* %besterr, align 4, !dbg !1259
  %1320 = load i32* %tr, align 4, !dbg !1259
  store i32 %1320, i32* %br, align 4, !dbg !1259
  %1321 = load i32* %tc, align 4, !dbg !1259
  %1322 = add nsw i32 %1321, 1, !dbg !1259
  store i32 %1322, i32* %bc, align 4, !dbg !1259
  %1323 = load i32* %thismse, align 4, !dbg !1259
  %1324 = load i32** %10, align 8, !dbg !1259
  store i32 %1323, i32* %1324, align 4, !dbg !1259
  %1325 = load i32* %sse, align 4, !dbg !1259
  %1326 = load i32** %11, align 8, !dbg !1259
  store i32 %1325, i32* %1326, align 4, !dbg !1259
  br label %1327, !dbg !1259

; <label>:1327                                    ; preds = %1318, %1312
  br label %1329, !dbg !1262

; <label>:1328                                    ; preds = %1250, %1246, %1241, %1236
  store i32 -1, i32* %right, align 4, !dbg !1265
  br label %1329

; <label>:1329                                    ; preds = %1328, %1327
  %1330 = load i32* %tc, align 4, !dbg !1270
  %1331 = load i32* %minc, align 4, !dbg !1270
  %1332 = icmp sge i32 %1330, %1331, !dbg !1270
  br i1 %1332, label %1333, label %1421, !dbg !1272

; <label>:1333                                    ; preds = %1329
  %1334 = load i32* %tc, align 4, !dbg !1273
  %1335 = load i32* %maxc, align 4, !dbg !1273
  %1336 = icmp sle i32 %1334, %1335, !dbg !1273
  br i1 %1336, label %1337, label %1421, !dbg !1272

; <label>:1337                                    ; preds = %1333
  %1338 = load i32* %tr, align 4, !dbg !1275
  %1339 = sub nsw i32 %1338, 1, !dbg !1275
  %1340 = load i32* %minr, align 4, !dbg !1275
  %1341 = icmp sge i32 %1339, %1340, !dbg !1275
  br i1 %1341, label %1342, label %1421, !dbg !1272

; <label>:1342                                    ; preds = %1337
  %1343 = load i32* %tr, align 4, !dbg !1277
  %1344 = sub nsw i32 %1343, 1, !dbg !1277
  %1345 = load i32* %maxr, align 4, !dbg !1277
  %1346 = icmp sle i32 %1344, %1345, !dbg !1277
  br i1 %1346, label %1347, label %1421, !dbg !1272

; <label>:1347                                    ; preds = %1342
  %1348 = load %struct.variance_vtable** %8, align 8, !dbg !1279
  %1349 = getelementptr inbounds %struct.variance_vtable* %1348, i32 0, i32 2, !dbg !1279
  %1350 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1349, align 8, !dbg !1279
  %1351 = load i8** %y, align 8, !dbg !1279
  %1352 = load i32* %tr, align 4, !dbg !1279
  %1353 = sub nsw i32 %1352, 1, !dbg !1279
  %1354 = ashr i32 %1353, 2, !dbg !1279
  %1355 = load i32* %y_stride, align 4, !dbg !1279
  %1356 = mul nsw i32 %1354, %1355, !dbg !1279
  %1357 = load i32* %tc, align 4, !dbg !1279
  %1358 = ashr i32 %1357, 2, !dbg !1279
  %1359 = add nsw i32 %1356, %1358, !dbg !1279
  %1360 = load i32* %offset, align 4, !dbg !1279
  %1361 = sub nsw i32 %1359, %1360, !dbg !1279
  %1362 = sext i32 %1361 to i64, !dbg !1279
  %1363 = getelementptr inbounds i8* %1351, i64 %1362, !dbg !1279
  %1364 = load i32* %y_stride, align 4, !dbg !1279
  %1365 = load i32* %tc, align 4, !dbg !1279
  %1366 = and i32 %1365, 3, !dbg !1279
  %1367 = shl i32 %1366, 1, !dbg !1279
  %1368 = load i32* %tr, align 4, !dbg !1279
  %1369 = sub nsw i32 %1368, 1, !dbg !1279
  %1370 = and i32 %1369, 3, !dbg !1279
  %1371 = shl i32 %1370, 1, !dbg !1279
  %1372 = load i8** %z, align 8, !dbg !1279
  %1373 = load %struct.block** %3, align 8, !dbg !1279
  %1374 = getelementptr inbounds %struct.block* %1373, i32 0, i32 11, !dbg !1279
  %1375 = load i32* %1374, align 4, !dbg !1279
  %1376 = call i32 %1350(i8* %1363, i32 %1364, i32 %1367, i32 %1371, i8* %1372, i32 %1375, i32* %sse), !dbg !1279
  store i32 %1376, i32* %thismse, align 4, !dbg !1279
  %1377 = load i32*** %9, align 8, !dbg !1282
  %1378 = icmp ne i32** %1377, null, !dbg !1282
  br i1 %1378, label %1379, label %1404, !dbg !1282

; <label>:1379                                    ; preds = %1347
  %1380 = load i32* %tr, align 4, !dbg !1284
  %1381 = sub nsw i32 %1380, 1, !dbg !1284
  %1382 = load i32* %rr, align 4, !dbg !1284
  %1383 = sub nsw i32 %1381, %1382, !dbg !1284
  %1384 = sext i32 %1383 to i64, !dbg !1284
  %1385 = load i32*** %9, align 8, !dbg !1284
  %1386 = getelementptr inbounds i32** %1385, i64 0, !dbg !1284
  %1387 = load i32** %1386, align 8, !dbg !1284
  %1388 = getelementptr inbounds i32* %1387, i64 %1384, !dbg !1284
  %1389 = load i32* %1388, align 4, !dbg !1284
  %1390 = load i32* %tc, align 4, !dbg !1284
  %1391 = load i32* %rc, align 4, !dbg !1284
  %1392 = sub nsw i32 %1390, %1391, !dbg !1284
  %1393 = sext i32 %1392 to i64, !dbg !1284
  %1394 = load i32*** %9, align 8, !dbg !1284
  %1395 = getelementptr inbounds i32** %1394, i64 1, !dbg !1284
  %1396 = load i32** %1395, align 8, !dbg !1284
  %1397 = getelementptr inbounds i32* %1396, i64 %1393, !dbg !1284
  %1398 = load i32* %1397, align 4, !dbg !1284
  %1399 = add nsw i32 %1389, %1398, !dbg !1284
  %1400 = load i32* %7, align 4, !dbg !1284
  %1401 = mul nsw i32 %1399, %1400, !dbg !1284
  %1402 = add nsw i32 %1401, 128, !dbg !1284
  %1403 = ashr i32 %1402, 8, !dbg !1284
  br label %1405, !dbg !1284

; <label>:1404                                    ; preds = %1347
  br label %1405, !dbg !1286

; <label>:1405                                    ; preds = %1404, %1379
  %1406 = phi i32 [ %1403, %1379 ], [ 0, %1404 ], !dbg !1282
  %1407 = load i32* %thismse, align 4, !dbg !1288
  %1408 = add nsw i32 %1406, %1407, !dbg !1288
  store i32 %1408, i32* %up, align 4, !dbg !1288
  %1409 = load i32* %besterr, align 4, !dbg !1288
  %1410 = icmp ult i32 %1408, %1409, !dbg !1288
  br i1 %1410, label %1411, label %1420, !dbg !1291

; <label>:1411                                    ; preds = %1405
  %1412 = load i32* %up, align 4, !dbg !1292
  store i32 %1412, i32* %besterr, align 4, !dbg !1292
  %1413 = load i32* %tr, align 4, !dbg !1292
  %1414 = sub nsw i32 %1413, 1, !dbg !1292
  store i32 %1414, i32* %br, align 4, !dbg !1292
  %1415 = load i32* %tc, align 4, !dbg !1292
  store i32 %1415, i32* %bc, align 4, !dbg !1292
  %1416 = load i32* %thismse, align 4, !dbg !1292
  %1417 = load i32** %10, align 8, !dbg !1292
  store i32 %1416, i32* %1417, align 4, !dbg !1292
  %1418 = load i32* %sse, align 4, !dbg !1292
  %1419 = load i32** %11, align 8, !dbg !1292
  store i32 %1418, i32* %1419, align 4, !dbg !1292
  br label %1420, !dbg !1292

; <label>:1420                                    ; preds = %1411, %1405
  br label %1422, !dbg !1295

; <label>:1421                                    ; preds = %1342, %1337, %1333, %1329
  store i32 -1, i32* %up, align 4, !dbg !1298
  br label %1422

; <label>:1422                                    ; preds = %1421, %1420
  %1423 = load i32* %tc, align 4, !dbg !1303
  %1424 = load i32* %minc, align 4, !dbg !1303
  %1425 = icmp sge i32 %1423, %1424, !dbg !1303
  br i1 %1425, label %1426, label %1514, !dbg !1305

; <label>:1426                                    ; preds = %1422
  %1427 = load i32* %tc, align 4, !dbg !1306
  %1428 = load i32* %maxc, align 4, !dbg !1306
  %1429 = icmp sle i32 %1427, %1428, !dbg !1306
  br i1 %1429, label %1430, label %1514, !dbg !1305

; <label>:1430                                    ; preds = %1426
  %1431 = load i32* %tr, align 4, !dbg !1308
  %1432 = add nsw i32 %1431, 1, !dbg !1308
  %1433 = load i32* %minr, align 4, !dbg !1308
  %1434 = icmp sge i32 %1432, %1433, !dbg !1308
  br i1 %1434, label %1435, label %1514, !dbg !1305

; <label>:1435                                    ; preds = %1430
  %1436 = load i32* %tr, align 4, !dbg !1310
  %1437 = add nsw i32 %1436, 1, !dbg !1310
  %1438 = load i32* %maxr, align 4, !dbg !1310
  %1439 = icmp sle i32 %1437, %1438, !dbg !1310
  br i1 %1439, label %1440, label %1514, !dbg !1305

; <label>:1440                                    ; preds = %1435
  %1441 = load %struct.variance_vtable** %8, align 8, !dbg !1312
  %1442 = getelementptr inbounds %struct.variance_vtable* %1441, i32 0, i32 2, !dbg !1312
  %1443 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1442, align 8, !dbg !1312
  %1444 = load i8** %y, align 8, !dbg !1312
  %1445 = load i32* %tr, align 4, !dbg !1312
  %1446 = add nsw i32 %1445, 1, !dbg !1312
  %1447 = ashr i32 %1446, 2, !dbg !1312
  %1448 = load i32* %y_stride, align 4, !dbg !1312
  %1449 = mul nsw i32 %1447, %1448, !dbg !1312
  %1450 = load i32* %tc, align 4, !dbg !1312
  %1451 = ashr i32 %1450, 2, !dbg !1312
  %1452 = add nsw i32 %1449, %1451, !dbg !1312
  %1453 = load i32* %offset, align 4, !dbg !1312
  %1454 = sub nsw i32 %1452, %1453, !dbg !1312
  %1455 = sext i32 %1454 to i64, !dbg !1312
  %1456 = getelementptr inbounds i8* %1444, i64 %1455, !dbg !1312
  %1457 = load i32* %y_stride, align 4, !dbg !1312
  %1458 = load i32* %tc, align 4, !dbg !1312
  %1459 = and i32 %1458, 3, !dbg !1312
  %1460 = shl i32 %1459, 1, !dbg !1312
  %1461 = load i32* %tr, align 4, !dbg !1312
  %1462 = add nsw i32 %1461, 1, !dbg !1312
  %1463 = and i32 %1462, 3, !dbg !1312
  %1464 = shl i32 %1463, 1, !dbg !1312
  %1465 = load i8** %z, align 8, !dbg !1312
  %1466 = load %struct.block** %3, align 8, !dbg !1312
  %1467 = getelementptr inbounds %struct.block* %1466, i32 0, i32 11, !dbg !1312
  %1468 = load i32* %1467, align 4, !dbg !1312
  %1469 = call i32 %1443(i8* %1456, i32 %1457, i32 %1460, i32 %1464, i8* %1465, i32 %1468, i32* %sse), !dbg !1312
  store i32 %1469, i32* %thismse, align 4, !dbg !1312
  %1470 = load i32*** %9, align 8, !dbg !1315
  %1471 = icmp ne i32** %1470, null, !dbg !1315
  br i1 %1471, label %1472, label %1497, !dbg !1315

; <label>:1472                                    ; preds = %1440
  %1473 = load i32* %tr, align 4, !dbg !1317
  %1474 = add nsw i32 %1473, 1, !dbg !1317
  %1475 = load i32* %rr, align 4, !dbg !1317
  %1476 = sub nsw i32 %1474, %1475, !dbg !1317
  %1477 = sext i32 %1476 to i64, !dbg !1317
  %1478 = load i32*** %9, align 8, !dbg !1317
  %1479 = getelementptr inbounds i32** %1478, i64 0, !dbg !1317
  %1480 = load i32** %1479, align 8, !dbg !1317
  %1481 = getelementptr inbounds i32* %1480, i64 %1477, !dbg !1317
  %1482 = load i32* %1481, align 4, !dbg !1317
  %1483 = load i32* %tc, align 4, !dbg !1317
  %1484 = load i32* %rc, align 4, !dbg !1317
  %1485 = sub nsw i32 %1483, %1484, !dbg !1317
  %1486 = sext i32 %1485 to i64, !dbg !1317
  %1487 = load i32*** %9, align 8, !dbg !1317
  %1488 = getelementptr inbounds i32** %1487, i64 1, !dbg !1317
  %1489 = load i32** %1488, align 8, !dbg !1317
  %1490 = getelementptr inbounds i32* %1489, i64 %1486, !dbg !1317
  %1491 = load i32* %1490, align 4, !dbg !1317
  %1492 = add nsw i32 %1482, %1491, !dbg !1317
  %1493 = load i32* %7, align 4, !dbg !1317
  %1494 = mul nsw i32 %1492, %1493, !dbg !1317
  %1495 = add nsw i32 %1494, 128, !dbg !1317
  %1496 = ashr i32 %1495, 8, !dbg !1317
  br label %1498, !dbg !1317

; <label>:1497                                    ; preds = %1440
  br label %1498, !dbg !1319

; <label>:1498                                    ; preds = %1497, %1472
  %1499 = phi i32 [ %1496, %1472 ], [ 0, %1497 ], !dbg !1315
  %1500 = load i32* %thismse, align 4, !dbg !1321
  %1501 = add nsw i32 %1499, %1500, !dbg !1321
  store i32 %1501, i32* %down, align 4, !dbg !1321
  %1502 = load i32* %besterr, align 4, !dbg !1321
  %1503 = icmp ult i32 %1501, %1502, !dbg !1321
  br i1 %1503, label %1504, label %1513, !dbg !1324

; <label>:1504                                    ; preds = %1498
  %1505 = load i32* %down, align 4, !dbg !1325
  store i32 %1505, i32* %besterr, align 4, !dbg !1325
  %1506 = load i32* %tr, align 4, !dbg !1325
  %1507 = add nsw i32 %1506, 1, !dbg !1325
  store i32 %1507, i32* %br, align 4, !dbg !1325
  %1508 = load i32* %tc, align 4, !dbg !1325
  store i32 %1508, i32* %bc, align 4, !dbg !1325
  %1509 = load i32* %thismse, align 4, !dbg !1325
  %1510 = load i32** %10, align 8, !dbg !1325
  store i32 %1509, i32* %1510, align 4, !dbg !1325
  %1511 = load i32* %sse, align 4, !dbg !1325
  %1512 = load i32** %11, align 8, !dbg !1325
  store i32 %1511, i32* %1512, align 4, !dbg !1325
  br label %1513, !dbg !1325

; <label>:1513                                    ; preds = %1504, %1498
  br label %1515, !dbg !1328

; <label>:1514                                    ; preds = %1435, %1430, %1426, %1422
  store i32 -1, i32* %down, align 4, !dbg !1331
  br label %1515

; <label>:1515                                    ; preds = %1514, %1513
  %1516 = load i32* %left, align 4, !dbg !1336
  %1517 = load i32* %right, align 4, !dbg !1337
  %1518 = icmp ult i32 %1516, %1517, !dbg !1336
  %1519 = select i1 %1518, i32 0, i32 1, !dbg !1336
  %1520 = load i32* %up, align 4, !dbg !1338
  %1521 = load i32* %down, align 4, !dbg !1339
  %1522 = icmp ult i32 %1520, %1521, !dbg !1338
  %1523 = select i1 %1522, i32 0, i32 2, !dbg !1338
  %1524 = add nsw i32 %1519, %1523, !dbg !1340
  store i32 %1524, i32* %whichdir, align 4, !dbg !1341
  %1525 = load i32* %whichdir, align 4, !dbg !1342
  switch i32 %1525, label %1926 [
    i32 0, label %1526
    i32 1, label %1626
    i32 2, label %1726
    i32 3, label %1826
  ], !dbg !1343

; <label>:1526                                    ; preds = %1515
  %1527 = load i32* %tc, align 4, !dbg !1344
  %1528 = sub nsw i32 %1527, 1, !dbg !1344
  %1529 = load i32* %minc, align 4, !dbg !1344
  %1530 = icmp sge i32 %1528, %1529, !dbg !1344
  br i1 %1530, label %1531, label %1624, !dbg !1347

; <label>:1531                                    ; preds = %1526
  %1532 = load i32* %tc, align 4, !dbg !1348
  %1533 = sub nsw i32 %1532, 1, !dbg !1348
  %1534 = load i32* %maxc, align 4, !dbg !1348
  %1535 = icmp sle i32 %1533, %1534, !dbg !1348
  br i1 %1535, label %1536, label %1624, !dbg !1347

; <label>:1536                                    ; preds = %1531
  %1537 = load i32* %tr, align 4, !dbg !1350
  %1538 = sub nsw i32 %1537, 1, !dbg !1350
  %1539 = load i32* %minr, align 4, !dbg !1350
  %1540 = icmp sge i32 %1538, %1539, !dbg !1350
  br i1 %1540, label %1541, label %1624, !dbg !1347

; <label>:1541                                    ; preds = %1536
  %1542 = load i32* %tr, align 4, !dbg !1352
  %1543 = sub nsw i32 %1542, 1, !dbg !1352
  %1544 = load i32* %maxr, align 4, !dbg !1352
  %1545 = icmp sle i32 %1543, %1544, !dbg !1352
  br i1 %1545, label %1546, label %1624, !dbg !1347

; <label>:1546                                    ; preds = %1541
  %1547 = load %struct.variance_vtable** %8, align 8, !dbg !1354
  %1548 = getelementptr inbounds %struct.variance_vtable* %1547, i32 0, i32 2, !dbg !1354
  %1549 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1548, align 8, !dbg !1354
  %1550 = load i8** %y, align 8, !dbg !1354
  %1551 = load i32* %tr, align 4, !dbg !1354
  %1552 = sub nsw i32 %1551, 1, !dbg !1354
  %1553 = ashr i32 %1552, 2, !dbg !1354
  %1554 = load i32* %y_stride, align 4, !dbg !1354
  %1555 = mul nsw i32 %1553, %1554, !dbg !1354
  %1556 = load i32* %tc, align 4, !dbg !1354
  %1557 = sub nsw i32 %1556, 1, !dbg !1354
  %1558 = ashr i32 %1557, 2, !dbg !1354
  %1559 = add nsw i32 %1555, %1558, !dbg !1354
  %1560 = load i32* %offset, align 4, !dbg !1354
  %1561 = sub nsw i32 %1559, %1560, !dbg !1354
  %1562 = sext i32 %1561 to i64, !dbg !1354
  %1563 = getelementptr inbounds i8* %1550, i64 %1562, !dbg !1354
  %1564 = load i32* %y_stride, align 4, !dbg !1354
  %1565 = load i32* %tc, align 4, !dbg !1354
  %1566 = sub nsw i32 %1565, 1, !dbg !1354
  %1567 = and i32 %1566, 3, !dbg !1354
  %1568 = shl i32 %1567, 1, !dbg !1354
  %1569 = load i32* %tr, align 4, !dbg !1354
  %1570 = sub nsw i32 %1569, 1, !dbg !1354
  %1571 = and i32 %1570, 3, !dbg !1354
  %1572 = shl i32 %1571, 1, !dbg !1354
  %1573 = load i8** %z, align 8, !dbg !1354
  %1574 = load %struct.block** %3, align 8, !dbg !1354
  %1575 = getelementptr inbounds %struct.block* %1574, i32 0, i32 11, !dbg !1354
  %1576 = load i32* %1575, align 4, !dbg !1354
  %1577 = call i32 %1549(i8* %1563, i32 %1564, i32 %1568, i32 %1572, i8* %1573, i32 %1576, i32* %sse), !dbg !1354
  store i32 %1577, i32* %thismse, align 4, !dbg !1354
  %1578 = load i32*** %9, align 8, !dbg !1357
  %1579 = icmp ne i32** %1578, null, !dbg !1357
  br i1 %1579, label %1580, label %1606, !dbg !1357

; <label>:1580                                    ; preds = %1546
  %1581 = load i32* %tr, align 4, !dbg !1359
  %1582 = sub nsw i32 %1581, 1, !dbg !1359
  %1583 = load i32* %rr, align 4, !dbg !1359
  %1584 = sub nsw i32 %1582, %1583, !dbg !1359
  %1585 = sext i32 %1584 to i64, !dbg !1359
  %1586 = load i32*** %9, align 8, !dbg !1359
  %1587 = getelementptr inbounds i32** %1586, i64 0, !dbg !1359
  %1588 = load i32** %1587, align 8, !dbg !1359
  %1589 = getelementptr inbounds i32* %1588, i64 %1585, !dbg !1359
  %1590 = load i32* %1589, align 4, !dbg !1359
  %1591 = load i32* %tc, align 4, !dbg !1359
  %1592 = sub nsw i32 %1591, 1, !dbg !1359
  %1593 = load i32* %rc, align 4, !dbg !1359
  %1594 = sub nsw i32 %1592, %1593, !dbg !1359
  %1595 = sext i32 %1594 to i64, !dbg !1359
  %1596 = load i32*** %9, align 8, !dbg !1359
  %1597 = getelementptr inbounds i32** %1596, i64 1, !dbg !1359
  %1598 = load i32** %1597, align 8, !dbg !1359
  %1599 = getelementptr inbounds i32* %1598, i64 %1595, !dbg !1359
  %1600 = load i32* %1599, align 4, !dbg !1359
  %1601 = add nsw i32 %1590, %1600, !dbg !1359
  %1602 = load i32* %7, align 4, !dbg !1359
  %1603 = mul nsw i32 %1601, %1602, !dbg !1359
  %1604 = add nsw i32 %1603, 128, !dbg !1359
  %1605 = ashr i32 %1604, 8, !dbg !1359
  br label %1607, !dbg !1359

; <label>:1606                                    ; preds = %1546
  br label %1607, !dbg !1361

; <label>:1607                                    ; preds = %1606, %1580
  %1608 = phi i32 [ %1605, %1580 ], [ 0, %1606 ], !dbg !1357
  %1609 = load i32* %thismse, align 4, !dbg !1363
  %1610 = add nsw i32 %1608, %1609, !dbg !1363
  store i32 %1610, i32* %diag, align 4, !dbg !1363
  %1611 = load i32* %besterr, align 4, !dbg !1363
  %1612 = icmp ult i32 %1610, %1611, !dbg !1363
  br i1 %1612, label %1613, label %1623, !dbg !1366

; <label>:1613                                    ; preds = %1607
  %1614 = load i32* %diag, align 4, !dbg !1367
  store i32 %1614, i32* %besterr, align 4, !dbg !1367
  %1615 = load i32* %tr, align 4, !dbg !1367
  %1616 = sub nsw i32 %1615, 1, !dbg !1367
  store i32 %1616, i32* %br, align 4, !dbg !1367
  %1617 = load i32* %tc, align 4, !dbg !1367
  %1618 = sub nsw i32 %1617, 1, !dbg !1367
  store i32 %1618, i32* %bc, align 4, !dbg !1367
  %1619 = load i32* %thismse, align 4, !dbg !1367
  %1620 = load i32** %10, align 8, !dbg !1367
  store i32 %1619, i32* %1620, align 4, !dbg !1367
  %1621 = load i32* %sse, align 4, !dbg !1367
  %1622 = load i32** %11, align 8, !dbg !1367
  store i32 %1621, i32* %1622, align 4, !dbg !1367
  br label %1623, !dbg !1367

; <label>:1623                                    ; preds = %1613, %1607
  br label %1625, !dbg !1370

; <label>:1624                                    ; preds = %1541, %1536, %1531, %1526
  store i32 -1, i32* %diag, align 4, !dbg !1373
  br label %1625

; <label>:1625                                    ; preds = %1624, %1623
  br label %1926, !dbg !1378

; <label>:1626                                    ; preds = %1515
  %1627 = load i32* %tc, align 4, !dbg !1379
  %1628 = add nsw i32 %1627, 1, !dbg !1379
  %1629 = load i32* %minc, align 4, !dbg !1379
  %1630 = icmp sge i32 %1628, %1629, !dbg !1379
  br i1 %1630, label %1631, label %1724, !dbg !1381

; <label>:1631                                    ; preds = %1626
  %1632 = load i32* %tc, align 4, !dbg !1382
  %1633 = add nsw i32 %1632, 1, !dbg !1382
  %1634 = load i32* %maxc, align 4, !dbg !1382
  %1635 = icmp sle i32 %1633, %1634, !dbg !1382
  br i1 %1635, label %1636, label %1724, !dbg !1381

; <label>:1636                                    ; preds = %1631
  %1637 = load i32* %tr, align 4, !dbg !1384
  %1638 = sub nsw i32 %1637, 1, !dbg !1384
  %1639 = load i32* %minr, align 4, !dbg !1384
  %1640 = icmp sge i32 %1638, %1639, !dbg !1384
  br i1 %1640, label %1641, label %1724, !dbg !1381

; <label>:1641                                    ; preds = %1636
  %1642 = load i32* %tr, align 4, !dbg !1386
  %1643 = sub nsw i32 %1642, 1, !dbg !1386
  %1644 = load i32* %maxr, align 4, !dbg !1386
  %1645 = icmp sle i32 %1643, %1644, !dbg !1386
  br i1 %1645, label %1646, label %1724, !dbg !1381

; <label>:1646                                    ; preds = %1641
  %1647 = load %struct.variance_vtable** %8, align 8, !dbg !1388
  %1648 = getelementptr inbounds %struct.variance_vtable* %1647, i32 0, i32 2, !dbg !1388
  %1649 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1648, align 8, !dbg !1388
  %1650 = load i8** %y, align 8, !dbg !1388
  %1651 = load i32* %tr, align 4, !dbg !1388
  %1652 = sub nsw i32 %1651, 1, !dbg !1388
  %1653 = ashr i32 %1652, 2, !dbg !1388
  %1654 = load i32* %y_stride, align 4, !dbg !1388
  %1655 = mul nsw i32 %1653, %1654, !dbg !1388
  %1656 = load i32* %tc, align 4, !dbg !1388
  %1657 = add nsw i32 %1656, 1, !dbg !1388
  %1658 = ashr i32 %1657, 2, !dbg !1388
  %1659 = add nsw i32 %1655, %1658, !dbg !1388
  %1660 = load i32* %offset, align 4, !dbg !1388
  %1661 = sub nsw i32 %1659, %1660, !dbg !1388
  %1662 = sext i32 %1661 to i64, !dbg !1388
  %1663 = getelementptr inbounds i8* %1650, i64 %1662, !dbg !1388
  %1664 = load i32* %y_stride, align 4, !dbg !1388
  %1665 = load i32* %tc, align 4, !dbg !1388
  %1666 = add nsw i32 %1665, 1, !dbg !1388
  %1667 = and i32 %1666, 3, !dbg !1388
  %1668 = shl i32 %1667, 1, !dbg !1388
  %1669 = load i32* %tr, align 4, !dbg !1388
  %1670 = sub nsw i32 %1669, 1, !dbg !1388
  %1671 = and i32 %1670, 3, !dbg !1388
  %1672 = shl i32 %1671, 1, !dbg !1388
  %1673 = load i8** %z, align 8, !dbg !1388
  %1674 = load %struct.block** %3, align 8, !dbg !1388
  %1675 = getelementptr inbounds %struct.block* %1674, i32 0, i32 11, !dbg !1388
  %1676 = load i32* %1675, align 4, !dbg !1388
  %1677 = call i32 %1649(i8* %1663, i32 %1664, i32 %1668, i32 %1672, i8* %1673, i32 %1676, i32* %sse), !dbg !1388
  store i32 %1677, i32* %thismse, align 4, !dbg !1388
  %1678 = load i32*** %9, align 8, !dbg !1391
  %1679 = icmp ne i32** %1678, null, !dbg !1391
  br i1 %1679, label %1680, label %1706, !dbg !1391

; <label>:1680                                    ; preds = %1646
  %1681 = load i32* %tr, align 4, !dbg !1393
  %1682 = sub nsw i32 %1681, 1, !dbg !1393
  %1683 = load i32* %rr, align 4, !dbg !1393
  %1684 = sub nsw i32 %1682, %1683, !dbg !1393
  %1685 = sext i32 %1684 to i64, !dbg !1393
  %1686 = load i32*** %9, align 8, !dbg !1393
  %1687 = getelementptr inbounds i32** %1686, i64 0, !dbg !1393
  %1688 = load i32** %1687, align 8, !dbg !1393
  %1689 = getelementptr inbounds i32* %1688, i64 %1685, !dbg !1393
  %1690 = load i32* %1689, align 4, !dbg !1393
  %1691 = load i32* %tc, align 4, !dbg !1393
  %1692 = add nsw i32 %1691, 1, !dbg !1393
  %1693 = load i32* %rc, align 4, !dbg !1393
  %1694 = sub nsw i32 %1692, %1693, !dbg !1393
  %1695 = sext i32 %1694 to i64, !dbg !1393
  %1696 = load i32*** %9, align 8, !dbg !1393
  %1697 = getelementptr inbounds i32** %1696, i64 1, !dbg !1393
  %1698 = load i32** %1697, align 8, !dbg !1393
  %1699 = getelementptr inbounds i32* %1698, i64 %1695, !dbg !1393
  %1700 = load i32* %1699, align 4, !dbg !1393
  %1701 = add nsw i32 %1690, %1700, !dbg !1393
  %1702 = load i32* %7, align 4, !dbg !1393
  %1703 = mul nsw i32 %1701, %1702, !dbg !1393
  %1704 = add nsw i32 %1703, 128, !dbg !1393
  %1705 = ashr i32 %1704, 8, !dbg !1393
  br label %1707, !dbg !1393

; <label>:1706                                    ; preds = %1646
  br label %1707, !dbg !1395

; <label>:1707                                    ; preds = %1706, %1680
  %1708 = phi i32 [ %1705, %1680 ], [ 0, %1706 ], !dbg !1391
  %1709 = load i32* %thismse, align 4, !dbg !1397
  %1710 = add nsw i32 %1708, %1709, !dbg !1397
  store i32 %1710, i32* %diag, align 4, !dbg !1397
  %1711 = load i32* %besterr, align 4, !dbg !1397
  %1712 = icmp ult i32 %1710, %1711, !dbg !1397
  br i1 %1712, label %1713, label %1723, !dbg !1400

; <label>:1713                                    ; preds = %1707
  %1714 = load i32* %diag, align 4, !dbg !1401
  store i32 %1714, i32* %besterr, align 4, !dbg !1401
  %1715 = load i32* %tr, align 4, !dbg !1401
  %1716 = sub nsw i32 %1715, 1, !dbg !1401
  store i32 %1716, i32* %br, align 4, !dbg !1401
  %1717 = load i32* %tc, align 4, !dbg !1401
  %1718 = add nsw i32 %1717, 1, !dbg !1401
  store i32 %1718, i32* %bc, align 4, !dbg !1401
  %1719 = load i32* %thismse, align 4, !dbg !1401
  %1720 = load i32** %10, align 8, !dbg !1401
  store i32 %1719, i32* %1720, align 4, !dbg !1401
  %1721 = load i32* %sse, align 4, !dbg !1401
  %1722 = load i32** %11, align 8, !dbg !1401
  store i32 %1721, i32* %1722, align 4, !dbg !1401
  br label %1723, !dbg !1401

; <label>:1723                                    ; preds = %1713, %1707
  br label %1725, !dbg !1404

; <label>:1724                                    ; preds = %1641, %1636, %1631, %1626
  store i32 -1, i32* %diag, align 4, !dbg !1407
  br label %1725

; <label>:1725                                    ; preds = %1724, %1723
  br label %1926, !dbg !1412

; <label>:1726                                    ; preds = %1515
  %1727 = load i32* %tc, align 4, !dbg !1413
  %1728 = sub nsw i32 %1727, 1, !dbg !1413
  %1729 = load i32* %minc, align 4, !dbg !1413
  %1730 = icmp sge i32 %1728, %1729, !dbg !1413
  br i1 %1730, label %1731, label %1824, !dbg !1415

; <label>:1731                                    ; preds = %1726
  %1732 = load i32* %tc, align 4, !dbg !1416
  %1733 = sub nsw i32 %1732, 1, !dbg !1416
  %1734 = load i32* %maxc, align 4, !dbg !1416
  %1735 = icmp sle i32 %1733, %1734, !dbg !1416
  br i1 %1735, label %1736, label %1824, !dbg !1415

; <label>:1736                                    ; preds = %1731
  %1737 = load i32* %tr, align 4, !dbg !1418
  %1738 = add nsw i32 %1737, 1, !dbg !1418
  %1739 = load i32* %minr, align 4, !dbg !1418
  %1740 = icmp sge i32 %1738, %1739, !dbg !1418
  br i1 %1740, label %1741, label %1824, !dbg !1415

; <label>:1741                                    ; preds = %1736
  %1742 = load i32* %tr, align 4, !dbg !1420
  %1743 = add nsw i32 %1742, 1, !dbg !1420
  %1744 = load i32* %maxr, align 4, !dbg !1420
  %1745 = icmp sle i32 %1743, %1744, !dbg !1420
  br i1 %1745, label %1746, label %1824, !dbg !1415

; <label>:1746                                    ; preds = %1741
  %1747 = load %struct.variance_vtable** %8, align 8, !dbg !1422
  %1748 = getelementptr inbounds %struct.variance_vtable* %1747, i32 0, i32 2, !dbg !1422
  %1749 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1748, align 8, !dbg !1422
  %1750 = load i8** %y, align 8, !dbg !1422
  %1751 = load i32* %tr, align 4, !dbg !1422
  %1752 = add nsw i32 %1751, 1, !dbg !1422
  %1753 = ashr i32 %1752, 2, !dbg !1422
  %1754 = load i32* %y_stride, align 4, !dbg !1422
  %1755 = mul nsw i32 %1753, %1754, !dbg !1422
  %1756 = load i32* %tc, align 4, !dbg !1422
  %1757 = sub nsw i32 %1756, 1, !dbg !1422
  %1758 = ashr i32 %1757, 2, !dbg !1422
  %1759 = add nsw i32 %1755, %1758, !dbg !1422
  %1760 = load i32* %offset, align 4, !dbg !1422
  %1761 = sub nsw i32 %1759, %1760, !dbg !1422
  %1762 = sext i32 %1761 to i64, !dbg !1422
  %1763 = getelementptr inbounds i8* %1750, i64 %1762, !dbg !1422
  %1764 = load i32* %y_stride, align 4, !dbg !1422
  %1765 = load i32* %tc, align 4, !dbg !1422
  %1766 = sub nsw i32 %1765, 1, !dbg !1422
  %1767 = and i32 %1766, 3, !dbg !1422
  %1768 = shl i32 %1767, 1, !dbg !1422
  %1769 = load i32* %tr, align 4, !dbg !1422
  %1770 = add nsw i32 %1769, 1, !dbg !1422
  %1771 = and i32 %1770, 3, !dbg !1422
  %1772 = shl i32 %1771, 1, !dbg !1422
  %1773 = load i8** %z, align 8, !dbg !1422
  %1774 = load %struct.block** %3, align 8, !dbg !1422
  %1775 = getelementptr inbounds %struct.block* %1774, i32 0, i32 11, !dbg !1422
  %1776 = load i32* %1775, align 4, !dbg !1422
  %1777 = call i32 %1749(i8* %1763, i32 %1764, i32 %1768, i32 %1772, i8* %1773, i32 %1776, i32* %sse), !dbg !1422
  store i32 %1777, i32* %thismse, align 4, !dbg !1422
  %1778 = load i32*** %9, align 8, !dbg !1425
  %1779 = icmp ne i32** %1778, null, !dbg !1425
  br i1 %1779, label %1780, label %1806, !dbg !1425

; <label>:1780                                    ; preds = %1746
  %1781 = load i32* %tr, align 4, !dbg !1427
  %1782 = add nsw i32 %1781, 1, !dbg !1427
  %1783 = load i32* %rr, align 4, !dbg !1427
  %1784 = sub nsw i32 %1782, %1783, !dbg !1427
  %1785 = sext i32 %1784 to i64, !dbg !1427
  %1786 = load i32*** %9, align 8, !dbg !1427
  %1787 = getelementptr inbounds i32** %1786, i64 0, !dbg !1427
  %1788 = load i32** %1787, align 8, !dbg !1427
  %1789 = getelementptr inbounds i32* %1788, i64 %1785, !dbg !1427
  %1790 = load i32* %1789, align 4, !dbg !1427
  %1791 = load i32* %tc, align 4, !dbg !1427
  %1792 = sub nsw i32 %1791, 1, !dbg !1427
  %1793 = load i32* %rc, align 4, !dbg !1427
  %1794 = sub nsw i32 %1792, %1793, !dbg !1427
  %1795 = sext i32 %1794 to i64, !dbg !1427
  %1796 = load i32*** %9, align 8, !dbg !1427
  %1797 = getelementptr inbounds i32** %1796, i64 1, !dbg !1427
  %1798 = load i32** %1797, align 8, !dbg !1427
  %1799 = getelementptr inbounds i32* %1798, i64 %1795, !dbg !1427
  %1800 = load i32* %1799, align 4, !dbg !1427
  %1801 = add nsw i32 %1790, %1800, !dbg !1427
  %1802 = load i32* %7, align 4, !dbg !1427
  %1803 = mul nsw i32 %1801, %1802, !dbg !1427
  %1804 = add nsw i32 %1803, 128, !dbg !1427
  %1805 = ashr i32 %1804, 8, !dbg !1427
  br label %1807, !dbg !1427

; <label>:1806                                    ; preds = %1746
  br label %1807, !dbg !1429

; <label>:1807                                    ; preds = %1806, %1780
  %1808 = phi i32 [ %1805, %1780 ], [ 0, %1806 ], !dbg !1425
  %1809 = load i32* %thismse, align 4, !dbg !1431
  %1810 = add nsw i32 %1808, %1809, !dbg !1431
  store i32 %1810, i32* %diag, align 4, !dbg !1431
  %1811 = load i32* %besterr, align 4, !dbg !1431
  %1812 = icmp ult i32 %1810, %1811, !dbg !1431
  br i1 %1812, label %1813, label %1823, !dbg !1434

; <label>:1813                                    ; preds = %1807
  %1814 = load i32* %diag, align 4, !dbg !1435
  store i32 %1814, i32* %besterr, align 4, !dbg !1435
  %1815 = load i32* %tr, align 4, !dbg !1435
  %1816 = add nsw i32 %1815, 1, !dbg !1435
  store i32 %1816, i32* %br, align 4, !dbg !1435
  %1817 = load i32* %tc, align 4, !dbg !1435
  %1818 = sub nsw i32 %1817, 1, !dbg !1435
  store i32 %1818, i32* %bc, align 4, !dbg !1435
  %1819 = load i32* %thismse, align 4, !dbg !1435
  %1820 = load i32** %10, align 8, !dbg !1435
  store i32 %1819, i32* %1820, align 4, !dbg !1435
  %1821 = load i32* %sse, align 4, !dbg !1435
  %1822 = load i32** %11, align 8, !dbg !1435
  store i32 %1821, i32* %1822, align 4, !dbg !1435
  br label %1823, !dbg !1435

; <label>:1823                                    ; preds = %1813, %1807
  br label %1825, !dbg !1438

; <label>:1824                                    ; preds = %1741, %1736, %1731, %1726
  store i32 -1, i32* %diag, align 4, !dbg !1441
  br label %1825

; <label>:1825                                    ; preds = %1824, %1823
  br label %1926, !dbg !1446

; <label>:1826                                    ; preds = %1515
  %1827 = load i32* %tc, align 4, !dbg !1447
  %1828 = add nsw i32 %1827, 1, !dbg !1447
  %1829 = load i32* %minc, align 4, !dbg !1447
  %1830 = icmp sge i32 %1828, %1829, !dbg !1447
  br i1 %1830, label %1831, label %1924, !dbg !1449

; <label>:1831                                    ; preds = %1826
  %1832 = load i32* %tc, align 4, !dbg !1450
  %1833 = add nsw i32 %1832, 1, !dbg !1450
  %1834 = load i32* %maxc, align 4, !dbg !1450
  %1835 = icmp sle i32 %1833, %1834, !dbg !1450
  br i1 %1835, label %1836, label %1924, !dbg !1449

; <label>:1836                                    ; preds = %1831
  %1837 = load i32* %tr, align 4, !dbg !1452
  %1838 = add nsw i32 %1837, 1, !dbg !1452
  %1839 = load i32* %minr, align 4, !dbg !1452
  %1840 = icmp sge i32 %1838, %1839, !dbg !1452
  br i1 %1840, label %1841, label %1924, !dbg !1449

; <label>:1841                                    ; preds = %1836
  %1842 = load i32* %tr, align 4, !dbg !1454
  %1843 = add nsw i32 %1842, 1, !dbg !1454
  %1844 = load i32* %maxr, align 4, !dbg !1454
  %1845 = icmp sle i32 %1843, %1844, !dbg !1454
  br i1 %1845, label %1846, label %1924, !dbg !1449

; <label>:1846                                    ; preds = %1841
  %1847 = load %struct.variance_vtable** %8, align 8, !dbg !1456
  %1848 = getelementptr inbounds %struct.variance_vtable* %1847, i32 0, i32 2, !dbg !1456
  %1849 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1848, align 8, !dbg !1456
  %1850 = load i8** %y, align 8, !dbg !1456
  %1851 = load i32* %tr, align 4, !dbg !1456
  %1852 = add nsw i32 %1851, 1, !dbg !1456
  %1853 = ashr i32 %1852, 2, !dbg !1456
  %1854 = load i32* %y_stride, align 4, !dbg !1456
  %1855 = mul nsw i32 %1853, %1854, !dbg !1456
  %1856 = load i32* %tc, align 4, !dbg !1456
  %1857 = add nsw i32 %1856, 1, !dbg !1456
  %1858 = ashr i32 %1857, 2, !dbg !1456
  %1859 = add nsw i32 %1855, %1858, !dbg !1456
  %1860 = load i32* %offset, align 4, !dbg !1456
  %1861 = sub nsw i32 %1859, %1860, !dbg !1456
  %1862 = sext i32 %1861 to i64, !dbg !1456
  %1863 = getelementptr inbounds i8* %1850, i64 %1862, !dbg !1456
  %1864 = load i32* %y_stride, align 4, !dbg !1456
  %1865 = load i32* %tc, align 4, !dbg !1456
  %1866 = add nsw i32 %1865, 1, !dbg !1456
  %1867 = and i32 %1866, 3, !dbg !1456
  %1868 = shl i32 %1867, 1, !dbg !1456
  %1869 = load i32* %tr, align 4, !dbg !1456
  %1870 = add nsw i32 %1869, 1, !dbg !1456
  %1871 = and i32 %1870, 3, !dbg !1456
  %1872 = shl i32 %1871, 1, !dbg !1456
  %1873 = load i8** %z, align 8, !dbg !1456
  %1874 = load %struct.block** %3, align 8, !dbg !1456
  %1875 = getelementptr inbounds %struct.block* %1874, i32 0, i32 11, !dbg !1456
  %1876 = load i32* %1875, align 4, !dbg !1456
  %1877 = call i32 %1849(i8* %1863, i32 %1864, i32 %1868, i32 %1872, i8* %1873, i32 %1876, i32* %sse), !dbg !1456
  store i32 %1877, i32* %thismse, align 4, !dbg !1456
  %1878 = load i32*** %9, align 8, !dbg !1459
  %1879 = icmp ne i32** %1878, null, !dbg !1459
  br i1 %1879, label %1880, label %1906, !dbg !1459

; <label>:1880                                    ; preds = %1846
  %1881 = load i32* %tr, align 4, !dbg !1461
  %1882 = add nsw i32 %1881, 1, !dbg !1461
  %1883 = load i32* %rr, align 4, !dbg !1461
  %1884 = sub nsw i32 %1882, %1883, !dbg !1461
  %1885 = sext i32 %1884 to i64, !dbg !1461
  %1886 = load i32*** %9, align 8, !dbg !1461
  %1887 = getelementptr inbounds i32** %1886, i64 0, !dbg !1461
  %1888 = load i32** %1887, align 8, !dbg !1461
  %1889 = getelementptr inbounds i32* %1888, i64 %1885, !dbg !1461
  %1890 = load i32* %1889, align 4, !dbg !1461
  %1891 = load i32* %tc, align 4, !dbg !1461
  %1892 = add nsw i32 %1891, 1, !dbg !1461
  %1893 = load i32* %rc, align 4, !dbg !1461
  %1894 = sub nsw i32 %1892, %1893, !dbg !1461
  %1895 = sext i32 %1894 to i64, !dbg !1461
  %1896 = load i32*** %9, align 8, !dbg !1461
  %1897 = getelementptr inbounds i32** %1896, i64 1, !dbg !1461
  %1898 = load i32** %1897, align 8, !dbg !1461
  %1899 = getelementptr inbounds i32* %1898, i64 %1895, !dbg !1461
  %1900 = load i32* %1899, align 4, !dbg !1461
  %1901 = add nsw i32 %1890, %1900, !dbg !1461
  %1902 = load i32* %7, align 4, !dbg !1461
  %1903 = mul nsw i32 %1901, %1902, !dbg !1461
  %1904 = add nsw i32 %1903, 128, !dbg !1461
  %1905 = ashr i32 %1904, 8, !dbg !1461
  br label %1907, !dbg !1461

; <label>:1906                                    ; preds = %1846
  br label %1907, !dbg !1463

; <label>:1907                                    ; preds = %1906, %1880
  %1908 = phi i32 [ %1905, %1880 ], [ 0, %1906 ], !dbg !1459
  %1909 = load i32* %thismse, align 4, !dbg !1465
  %1910 = add nsw i32 %1908, %1909, !dbg !1465
  store i32 %1910, i32* %diag, align 4, !dbg !1465
  %1911 = load i32* %besterr, align 4, !dbg !1465
  %1912 = icmp ult i32 %1910, %1911, !dbg !1465
  br i1 %1912, label %1913, label %1923, !dbg !1468

; <label>:1913                                    ; preds = %1907
  %1914 = load i32* %diag, align 4, !dbg !1469
  store i32 %1914, i32* %besterr, align 4, !dbg !1469
  %1915 = load i32* %tr, align 4, !dbg !1469
  %1916 = add nsw i32 %1915, 1, !dbg !1469
  store i32 %1916, i32* %br, align 4, !dbg !1469
  %1917 = load i32* %tc, align 4, !dbg !1469
  %1918 = add nsw i32 %1917, 1, !dbg !1469
  store i32 %1918, i32* %bc, align 4, !dbg !1469
  %1919 = load i32* %thismse, align 4, !dbg !1469
  %1920 = load i32** %10, align 8, !dbg !1469
  store i32 %1919, i32* %1920, align 4, !dbg !1469
  %1921 = load i32* %sse, align 4, !dbg !1469
  %1922 = load i32** %11, align 8, !dbg !1469
  store i32 %1921, i32* %1922, align 4, !dbg !1469
  br label %1923, !dbg !1469

; <label>:1923                                    ; preds = %1913, %1907
  br label %1925, !dbg !1472

; <label>:1924                                    ; preds = %1841, %1836, %1831, %1826
  store i32 -1, i32* %diag, align 4, !dbg !1475
  br label %1925

; <label>:1925                                    ; preds = %1924, %1923
  br label %1926, !dbg !1480

; <label>:1926                                    ; preds = %1515, %1925, %1825, %1725, %1625
  %1927 = load i32* %tr, align 4, !dbg !1481
  %1928 = load i32* %br, align 4, !dbg !1483
  %1929 = icmp eq i32 %1927, %1928, !dbg !1481
  br i1 %1929, label %1930, label %1935, !dbg !1484

; <label>:1930                                    ; preds = %1926
  %1931 = load i32* %tc, align 4, !dbg !1485
  %1932 = load i32* %bc, align 4, !dbg !1487
  %1933 = icmp eq i32 %1931, %1932, !dbg !1488
  br i1 %1933, label %1934, label %1935, !dbg !1484

; <label>:1934                                    ; preds = %1930
  br label %1938, !dbg !1489

; <label>:1935                                    ; preds = %1930, %1926
  %1936 = load i32* %br, align 4, !dbg !1490
  store i32 %1936, i32* %tr, align 4, !dbg !1491
  %1937 = load i32* %bc, align 4, !dbg !1492
  store i32 %1937, i32* %tc, align 4, !dbg !1493
  br label %1139, !dbg !1201

; <label>:1938                                    ; preds = %1934, %1139
  %1939 = load i32* %br, align 4, !dbg !1494
  %1940 = mul nsw i32 %1939, 2, !dbg !1494
  %1941 = trunc i32 %1940 to i16, !dbg !1494
  %1942 = load %union.int_mv** %5, align 8, !dbg !1495
  %1943 = bitcast %union.int_mv* %1942 to %struct.MV*, !dbg !1495
  %1944 = getelementptr inbounds %struct.MV* %1943, i32 0, i32 0, !dbg !1495
  store i16 %1941, i16* %1944, align 2, !dbg !1495
  %1945 = load i32* %bc, align 4, !dbg !1496
  %1946 = mul nsw i32 %1945, 2, !dbg !1496
  %1947 = trunc i32 %1946 to i16, !dbg !1496
  %1948 = load %union.int_mv** %5, align 8, !dbg !1497
  %1949 = bitcast %union.int_mv* %1948 to %struct.MV*, !dbg !1497
  %1950 = getelementptr inbounds %struct.MV* %1949, i32 0, i32 1, !dbg !1497
  store i16 %1947, i16* %1950, align 2, !dbg !1497
  %1951 = load %union.int_mv** %5, align 8, !dbg !1498
  %1952 = bitcast %union.int_mv* %1951 to %struct.MV*, !dbg !1498
  %1953 = getelementptr inbounds %struct.MV* %1952, i32 0, i32 1, !dbg !1498
  %1954 = load i16* %1953, align 2, !dbg !1498
  %1955 = sext i16 %1954 to i32, !dbg !1498
  %1956 = load %union.int_mv** %6, align 8, !dbg !1500
  %1957 = bitcast %union.int_mv* %1956 to %struct.MV*, !dbg !1500
  %1958 = getelementptr inbounds %struct.MV* %1957, i32 0, i32 1, !dbg !1500
  %1959 = load i16* %1958, align 2, !dbg !1500
  %1960 = sext i16 %1959 to i32, !dbg !1500
  %1961 = sub nsw i32 %1955, %1960, !dbg !1498
  %1962 = call i32 @abs(i32 %1961) #1, !dbg !1501
  %1963 = icmp sgt i32 %1962, 2040, !dbg !1501
  br i1 %1963, label %1978, label %1964, !dbg !1502

; <label>:1964                                    ; preds = %1938
  %1965 = load %union.int_mv** %5, align 8, !dbg !1503
  %1966 = bitcast %union.int_mv* %1965 to %struct.MV*, !dbg !1503
  %1967 = getelementptr inbounds %struct.MV* %1966, i32 0, i32 0, !dbg !1503
  %1968 = load i16* %1967, align 2, !dbg !1503
  %1969 = sext i16 %1968 to i32, !dbg !1503
  %1970 = load %union.int_mv** %6, align 8, !dbg !1504
  %1971 = bitcast %union.int_mv* %1970 to %struct.MV*, !dbg !1504
  %1972 = getelementptr inbounds %struct.MV* %1971, i32 0, i32 0, !dbg !1504
  %1973 = load i16* %1972, align 2, !dbg !1504
  %1974 = sext i16 %1973 to i32, !dbg !1504
  %1975 = sub nsw i32 %1969, %1974, !dbg !1503
  %1976 = call i32 @abs(i32 %1975) #1, !dbg !1505
  %1977 = icmp sgt i32 %1976, 2040, !dbg !1505
  br i1 %1977, label %1978, label %1979, !dbg !1502

; <label>:1978                                    ; preds = %1964, %1938
  store i32 2147483647, i32* %1, !dbg !1506
  br label %1981, !dbg !1506

; <label>:1979                                    ; preds = %1964
  %1980 = load i32* %besterr, align 4, !dbg !1507
  store i32 %1980, i32* %1, !dbg !1508
  br label %1981, !dbg !1508

; <label>:1981                                    ; preds = %1979, %1978
  %1982 = load i32* %1, !dbg !1509
  ret i32 %1982, !dbg !1509
}

; Function Attrs: nounwind uwtable
define internal i32 @mv_err_cost(%union.int_mv* %mv, %union.int_mv* %ref, i32** %mvcost, i32 %error_per_bit) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %union.int_mv*, align 8
  %3 = alloca %union.int_mv*, align 8
  %4 = alloca i32**, align 8
  %5 = alloca i32, align 4
  store %union.int_mv* %mv, %union.int_mv** %2, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %2, metadata !1510, metadata !506), !dbg !1511
  store %union.int_mv* %ref, %union.int_mv** %3, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %3, metadata !1512, metadata !506), !dbg !1513
  store i32** %mvcost, i32*** %4, align 8
  call void @llvm.dbg.declare(metadata i32*** %4, metadata !1514, metadata !506), !dbg !1515
  store i32 %error_per_bit, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !1516, metadata !506), !dbg !1517
  %6 = load i32*** %4, align 8, !dbg !1518
  %7 = icmp ne i32** %6, null, !dbg !1520
  br i1 %7, label %8, label %50, !dbg !1520

; <label>:8                                       ; preds = %0
  %9 = load %union.int_mv** %2, align 8, !dbg !1521
  %10 = bitcast %union.int_mv* %9 to %struct.MV*, !dbg !1521
  %11 = getelementptr inbounds %struct.MV* %10, i32 0, i32 0, !dbg !1521
  %12 = load i16* %11, align 2, !dbg !1521
  %13 = sext i16 %12 to i32, !dbg !1521
  %14 = load %union.int_mv** %3, align 8, !dbg !1522
  %15 = bitcast %union.int_mv* %14 to %struct.MV*, !dbg !1522
  %16 = getelementptr inbounds %struct.MV* %15, i32 0, i32 0, !dbg !1522
  %17 = load i16* %16, align 2, !dbg !1522
  %18 = sext i16 %17 to i32, !dbg !1522
  %19 = sub nsw i32 %13, %18, !dbg !1521
  %20 = ashr i32 %19, 1, !dbg !1523
  %21 = sext i32 %20 to i64, !dbg !1524
  %22 = load i32*** %4, align 8, !dbg !1524
  %23 = getelementptr inbounds i32** %22, i64 0, !dbg !1524
  %24 = load i32** %23, align 8, !dbg !1524
  %25 = getelementptr inbounds i32* %24, i64 %21, !dbg !1524
  %26 = load i32* %25, align 4, !dbg !1524
  %27 = load %union.int_mv** %2, align 8, !dbg !1525
  %28 = bitcast %union.int_mv* %27 to %struct.MV*, !dbg !1525
  %29 = getelementptr inbounds %struct.MV* %28, i32 0, i32 1, !dbg !1525
  %30 = load i16* %29, align 2, !dbg !1525
  %31 = sext i16 %30 to i32, !dbg !1525
  %32 = load %union.int_mv** %3, align 8, !dbg !1526
  %33 = bitcast %union.int_mv* %32 to %struct.MV*, !dbg !1526
  %34 = getelementptr inbounds %struct.MV* %33, i32 0, i32 1, !dbg !1526
  %35 = load i16* %34, align 2, !dbg !1526
  %36 = sext i16 %35 to i32, !dbg !1526
  %37 = sub nsw i32 %31, %36, !dbg !1525
  %38 = ashr i32 %37, 1, !dbg !1527
  %39 = sext i32 %38 to i64, !dbg !1528
  %40 = load i32*** %4, align 8, !dbg !1528
  %41 = getelementptr inbounds i32** %40, i64 1, !dbg !1528
  %42 = load i32** %41, align 8, !dbg !1528
  %43 = getelementptr inbounds i32* %42, i64 %39, !dbg !1528
  %44 = load i32* %43, align 4, !dbg !1528
  %45 = add nsw i32 %26, %44, !dbg !1524
  %46 = load i32* %5, align 4, !dbg !1529
  %47 = mul nsw i32 %45, %46, !dbg !1530
  %48 = add nsw i32 %47, 128, !dbg !1530
  %49 = ashr i32 %48, 8, !dbg !1531
  store i32 %49, i32* %1, !dbg !1532
  br label %51, !dbg !1532

; <label>:50                                      ; preds = %0
  store i32 0, i32* %1, !dbg !1533
  br label %51, !dbg !1533

; <label>:51                                      ; preds = %50, %8
  %52 = load i32* %1, !dbg !1534
  ret i32 %52, !dbg !1534
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #2

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
  call void @llvm.dbg.declare(metadata %struct.macroblock** %1, metadata !1535, metadata !506), !dbg !1536
  store %struct.block* %b, %struct.block** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.block** %2, metadata !1537, metadata !506), !dbg !1538
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.blockd** %3, metadata !1539, metadata !506), !dbg !1540
  store %union.int_mv* %bestmv, %union.int_mv** %4, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %4, metadata !1541, metadata !506), !dbg !1542
  store %union.int_mv* %ref_mv, %union.int_mv** %5, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %5, metadata !1543, metadata !506), !dbg !1544
  store i32 %error_per_bit, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !1545, metadata !506), !dbg !1546
  store %struct.variance_vtable* %vfp, %struct.variance_vtable** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.variance_vtable** %7, metadata !1547, metadata !506), !dbg !1548
  store i32** %mvcost, i32*** %8, align 8
  call void @llvm.dbg.declare(metadata i32*** %8, metadata !1549, metadata !506), !dbg !1550
  store i32* %distortion, i32** %9, align 8
  call void @llvm.dbg.declare(metadata i32** %9, metadata !1551, metadata !506), !dbg !1552
  store i32* %sse1, i32** %10, align 8
  call void @llvm.dbg.declare(metadata i32** %10, metadata !1553, metadata !506), !dbg !1554
  call void @llvm.dbg.declare(metadata i32* %bestmse, metadata !1555, metadata !506), !dbg !1556
  store i32 2147483647, i32* %bestmse, align 4, !dbg !1556
  call void @llvm.dbg.declare(metadata %union.int_mv* %startmv, metadata !1557, metadata !506), !dbg !1558
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !1559, metadata !506), !dbg !1560
  call void @llvm.dbg.declare(metadata i8** %z, metadata !1561, metadata !506), !dbg !1562
  %11 = load %struct.block** %2, align 8, !dbg !1563
  %12 = getelementptr inbounds %struct.block* %11, i32 0, i32 9, !dbg !1563
  %13 = load i8*** %12, align 8, !dbg !1563
  %14 = load i8** %13, align 8, !dbg !1564
  %15 = load %struct.block** %2, align 8, !dbg !1565
  %16 = getelementptr inbounds %struct.block* %15, i32 0, i32 10, !dbg !1565
  %17 = load i32* %16, align 4, !dbg !1565
  %18 = sext i32 %17 to i64, !dbg !1564
  %19 = getelementptr inbounds i8* %14, i64 %18, !dbg !1564
  store i8* %19, i8** %z, align 8, !dbg !1562
  call void @llvm.dbg.declare(metadata i32* %left, metadata !1566, metadata !506), !dbg !1567
  call void @llvm.dbg.declare(metadata i32* %right, metadata !1568, metadata !506), !dbg !1569
  call void @llvm.dbg.declare(metadata i32* %up, metadata !1570, metadata !506), !dbg !1571
  call void @llvm.dbg.declare(metadata i32* %down, metadata !1572, metadata !506), !dbg !1573
  call void @llvm.dbg.declare(metadata i32* %diag, metadata !1574, metadata !506), !dbg !1575
  call void @llvm.dbg.declare(metadata i32* %sse, metadata !1576, metadata !506), !dbg !1577
  call void @llvm.dbg.declare(metadata i32* %whichdir, metadata !1578, metadata !506), !dbg !1579
  call void @llvm.dbg.declare(metadata i32* %thismse, metadata !1580, metadata !506), !dbg !1581
  call void @llvm.dbg.declare(metadata i32* %y_stride, metadata !1582, metadata !506), !dbg !1583
  call void @llvm.dbg.declare(metadata i32* %pre_stride, metadata !1584, metadata !506), !dbg !1585
  %20 = load %struct.macroblock** %1, align 8, !dbg !1586
  %21 = getelementptr inbounds %struct.macroblock* %20, i32 0, i32 7, !dbg !1586
  %22 = getelementptr inbounds %struct.macroblockd* %21, i32 0, i32 11, !dbg !1586
  %23 = getelementptr inbounds %struct.yv12_buffer_config* %22, i32 0, i32 4, !dbg !1586
  %24 = load i32* %23, align 4, !dbg !1586
  store i32 %24, i32* %pre_stride, align 4, !dbg !1585
  call void @llvm.dbg.declare(metadata i8** %base_pre, metadata !1587, metadata !506), !dbg !1588
  %25 = load %struct.macroblock** %1, align 8, !dbg !1589
  %26 = getelementptr inbounds %struct.macroblock* %25, i32 0, i32 7, !dbg !1589
  %27 = getelementptr inbounds %struct.macroblockd* %26, i32 0, i32 11, !dbg !1589
  %28 = getelementptr inbounds %struct.yv12_buffer_config* %27, i32 0, i32 13, !dbg !1589
  %29 = load i8** %28, align 8, !dbg !1589
  store i8* %29, i8** %base_pre, align 8, !dbg !1588
  call void @llvm.dbg.declare(metadata %struct.macroblockd** %xd, metadata !1590, metadata !506), !dbg !1591
  %30 = load %struct.macroblock** %1, align 8, !dbg !1592
  %31 = getelementptr inbounds %struct.macroblock* %30, i32 0, i32 7, !dbg !1593
  store %struct.macroblockd* %31, %struct.macroblockd** %xd, align 8, !dbg !1591
  call void @llvm.dbg.declare(metadata i8** %y_0, metadata !1594, metadata !506), !dbg !1595
  %32 = load i8** %base_pre, align 8, !dbg !1596
  %33 = load %struct.blockd** %3, align 8, !dbg !1597
  %34 = getelementptr inbounds %struct.blockd* %33, i32 0, i32 4, !dbg !1597
  %35 = load i32* %34, align 4, !dbg !1597
  %36 = sext i32 %35 to i64, !dbg !1596
  %37 = getelementptr inbounds i8* %32, i64 %36, !dbg !1596
  %38 = load %union.int_mv** %4, align 8, !dbg !1598
  %39 = bitcast %union.int_mv* %38 to %struct.MV*, !dbg !1598
  %40 = getelementptr inbounds %struct.MV* %39, i32 0, i32 0, !dbg !1598
  %41 = load i16* %40, align 2, !dbg !1598
  %42 = sext i16 %41 to i32, !dbg !1599
  %43 = load i32* %pre_stride, align 4, !dbg !1600
  %44 = mul nsw i32 %42, %43, !dbg !1599
  %45 = sext i32 %44 to i64, !dbg !1596
  %46 = getelementptr inbounds i8* %37, i64 %45, !dbg !1596
  %47 = load %union.int_mv** %4, align 8, !dbg !1601
  %48 = bitcast %union.int_mv* %47 to %struct.MV*, !dbg !1601
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1, !dbg !1601
  %50 = load i16* %49, align 2, !dbg !1601
  %51 = sext i16 %50 to i32, !dbg !1601
  %52 = sext i32 %51 to i64, !dbg !1596
  %53 = getelementptr inbounds i8* %46, i64 %52, !dbg !1596
  store i8* %53, i8** %y_0, align 8, !dbg !1595
  call void @llvm.dbg.declare(metadata i8** %y, metadata !1602, metadata !506), !dbg !1603
  store i32 32, i32* %y_stride, align 4, !dbg !1604
  %54 = load %struct.variance_vtable** %7, align 8, !dbg !1605
  %55 = getelementptr inbounds %struct.variance_vtable* %54, i32 0, i32 9, !dbg !1605
  %56 = load void (i8*, i32, i8*, i32, i32)** %55, align 8, !dbg !1605
  %57 = load i8** %y_0, align 8, !dbg !1606
  %58 = getelementptr inbounds i8* %57, i64 -1, !dbg !1606
  %59 = load i32* %pre_stride, align 4, !dbg !1607
  %60 = sext i32 %59 to i64, !dbg !1606
  %61 = sub i64 0, %60, !dbg !1606
  %62 = getelementptr inbounds i8* %58, i64 %61, !dbg !1606
  %63 = load i32* %pre_stride, align 4, !dbg !1608
  %64 = load %struct.macroblockd** %xd, align 8, !dbg !1609
  %65 = getelementptr inbounds %struct.macroblockd* %64, i32 0, i32 46, !dbg !1609
  %66 = getelementptr inbounds [704 x i8]* %65, i32 0, i32 0, !dbg !1609
  %67 = load i32* %y_stride, align 4, !dbg !1610
  call void %56(i8* %62, i32 %63, i8* %66, i32 %67, i32 18), !dbg !1605
  %68 = load %struct.macroblockd** %xd, align 8, !dbg !1611
  %69 = getelementptr inbounds %struct.macroblockd* %68, i32 0, i32 46, !dbg !1611
  %70 = getelementptr inbounds [704 x i8]* %69, i32 0, i32 0, !dbg !1611
  %71 = load i32* %y_stride, align 4, !dbg !1612
  %72 = sext i32 %71 to i64, !dbg !1611
  %73 = getelementptr inbounds i8* %70, i64 %72, !dbg !1611
  %74 = getelementptr inbounds i8* %73, i64 1, !dbg !1611
  store i8* %74, i8** %y, align 8, !dbg !1613
  %75 = load %union.int_mv** %4, align 8, !dbg !1614
  %76 = bitcast %union.int_mv* %75 to %struct.MV*, !dbg !1614
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0, !dbg !1614
  %78 = load i16* %77, align 2, !dbg !1614
  %79 = sext i16 %78 to i32, !dbg !1614
  %80 = shl i32 %79, 3, !dbg !1614
  %81 = trunc i32 %80 to i16, !dbg !1614
  store i16 %81, i16* %77, align 2, !dbg !1614
  %82 = load %union.int_mv** %4, align 8, !dbg !1615
  %83 = bitcast %union.int_mv* %82 to %struct.MV*, !dbg !1615
  %84 = getelementptr inbounds %struct.MV* %83, i32 0, i32 1, !dbg !1615
  %85 = load i16* %84, align 2, !dbg !1615
  %86 = sext i16 %85 to i32, !dbg !1615
  %87 = shl i32 %86, 3, !dbg !1615
  %88 = trunc i32 %87 to i16, !dbg !1615
  store i16 %88, i16* %84, align 2, !dbg !1615
  %89 = load %union.int_mv** %4, align 8, !dbg !1616
  %90 = bitcast %union.int_mv* %startmv to i8*, !dbg !1617
  %91 = bitcast %union.int_mv* %89 to i8*, !dbg !1617
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %90, i8* %91, i64 4, i32 4, i1 false), !dbg !1617
  %92 = load %struct.variance_vtable** %7, align 8, !dbg !1618
  %93 = getelementptr inbounds %struct.variance_vtable* %92, i32 0, i32 1, !dbg !1618
  %94 = load i32 (i8*, i32, i8*, i32, i32*)** %93, align 8, !dbg !1618
  %95 = load i8** %y, align 8, !dbg !1619
  %96 = load i32* %y_stride, align 4, !dbg !1620
  %97 = load i8** %z, align 8, !dbg !1621
  %98 = load %struct.block** %2, align 8, !dbg !1622
  %99 = getelementptr inbounds %struct.block* %98, i32 0, i32 11, !dbg !1622
  %100 = load i32* %99, align 4, !dbg !1622
  %101 = load i32** %10, align 8, !dbg !1623
  %102 = call i32 %94(i8* %95, i32 %96, i8* %97, i32 %100, i32* %101), !dbg !1618
  store i32 %102, i32* %bestmse, align 4, !dbg !1624
  %103 = load i32* %bestmse, align 4, !dbg !1625
  %104 = load i32** %9, align 8, !dbg !1626
  store i32 %103, i32* %104, align 4, !dbg !1627
  %105 = load %union.int_mv** %4, align 8, !dbg !1628
  %106 = load %union.int_mv** %5, align 8, !dbg !1629
  %107 = load i32*** %8, align 8, !dbg !1630
  %108 = load i32* %6, align 4, !dbg !1631
  %109 = call i32 @mv_err_cost(%union.int_mv* %105, %union.int_mv* %106, i32** %107, i32 %108), !dbg !1632
  %110 = load i32* %bestmse, align 4, !dbg !1633
  %111 = add nsw i32 %110, %109, !dbg !1633
  store i32 %111, i32* %bestmse, align 4, !dbg !1633
  %112 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1634
  %113 = getelementptr inbounds %struct.MV* %112, i32 0, i32 0, !dbg !1634
  %114 = load i16* %113, align 2, !dbg !1634
  %115 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1635
  %116 = getelementptr inbounds %struct.MV* %115, i32 0, i32 0, !dbg !1635
  store i16 %114, i16* %116, align 2, !dbg !1635
  %117 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1636
  %118 = getelementptr inbounds %struct.MV* %117, i32 0, i32 1, !dbg !1636
  %119 = load i16* %118, align 2, !dbg !1636
  %120 = sext i16 %119 to i32, !dbg !1636
  %121 = sub nsw i32 %120, 8, !dbg !1636
  %122 = or i32 %121, 4, !dbg !1637
  %123 = trunc i32 %122 to i16, !dbg !1638
  %124 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1639
  %125 = getelementptr inbounds %struct.MV* %124, i32 0, i32 1, !dbg !1639
  store i16 %123, i16* %125, align 2, !dbg !1639
  %126 = load %struct.variance_vtable** %7, align 8, !dbg !1640
  %127 = getelementptr inbounds %struct.variance_vtable* %126, i32 0, i32 3, !dbg !1640
  %128 = load i32 (i8*, i32, i8*, i32, i32*)** %127, align 8, !dbg !1640
  %129 = load i8** %y, align 8, !dbg !1641
  %130 = getelementptr inbounds i8* %129, i64 -1, !dbg !1641
  %131 = load i32* %y_stride, align 4, !dbg !1642
  %132 = load i8** %z, align 8, !dbg !1643
  %133 = load %struct.block** %2, align 8, !dbg !1644
  %134 = getelementptr inbounds %struct.block* %133, i32 0, i32 11, !dbg !1644
  %135 = load i32* %134, align 4, !dbg !1644
  %136 = call i32 %128(i8* %130, i32 %131, i8* %132, i32 %135, i32* %sse), !dbg !1640
  store i32 %136, i32* %thismse, align 4, !dbg !1645
  %137 = load i32* %thismse, align 4, !dbg !1646
  %138 = load %union.int_mv** %5, align 8, !dbg !1647
  %139 = load i32*** %8, align 8, !dbg !1648
  %140 = load i32* %6, align 4, !dbg !1649
  %141 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %138, i32** %139, i32 %140), !dbg !1650
  %142 = add nsw i32 %137, %141, !dbg !1646
  store i32 %142, i32* %left, align 4, !dbg !1651
  %143 = load i32* %left, align 4, !dbg !1652
  %144 = load i32* %bestmse, align 4, !dbg !1654
  %145 = icmp slt i32 %143, %144, !dbg !1652
  br i1 %145, label %146, label %155, !dbg !1655

; <label>:146                                     ; preds = %0
  %147 = load %union.int_mv** %4, align 8, !dbg !1656
  %148 = bitcast %union.int_mv* %147 to i8*, !dbg !1658
  %149 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1658
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %148, i8* %149, i64 4, i32 4, i1 false), !dbg !1658
  %150 = load i32* %left, align 4, !dbg !1659
  store i32 %150, i32* %bestmse, align 4, !dbg !1660
  %151 = load i32* %thismse, align 4, !dbg !1661
  %152 = load i32** %9, align 8, !dbg !1662
  store i32 %151, i32* %152, align 4, !dbg !1663
  %153 = load i32* %sse, align 4, !dbg !1664
  %154 = load i32** %10, align 8, !dbg !1665
  store i32 %153, i32* %154, align 4, !dbg !1666
  br label %155, !dbg !1667

; <label>:155                                     ; preds = %146, %0
  %156 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1668
  %157 = getelementptr inbounds %struct.MV* %156, i32 0, i32 1, !dbg !1668
  %158 = load i16* %157, align 2, !dbg !1668
  %159 = sext i16 %158 to i32, !dbg !1668
  %160 = add nsw i32 %159, 8, !dbg !1668
  %161 = trunc i32 %160 to i16, !dbg !1668
  store i16 %161, i16* %157, align 2, !dbg !1668
  %162 = load %struct.variance_vtable** %7, align 8, !dbg !1669
  %163 = getelementptr inbounds %struct.variance_vtable* %162, i32 0, i32 3, !dbg !1669
  %164 = load i32 (i8*, i32, i8*, i32, i32*)** %163, align 8, !dbg !1669
  %165 = load i8** %y, align 8, !dbg !1670
  %166 = load i32* %y_stride, align 4, !dbg !1671
  %167 = load i8** %z, align 8, !dbg !1672
  %168 = load %struct.block** %2, align 8, !dbg !1673
  %169 = getelementptr inbounds %struct.block* %168, i32 0, i32 11, !dbg !1673
  %170 = load i32* %169, align 4, !dbg !1673
  %171 = call i32 %164(i8* %165, i32 %166, i8* %167, i32 %170, i32* %sse), !dbg !1669
  store i32 %171, i32* %thismse, align 4, !dbg !1674
  %172 = load i32* %thismse, align 4, !dbg !1675
  %173 = load %union.int_mv** %5, align 8, !dbg !1676
  %174 = load i32*** %8, align 8, !dbg !1677
  %175 = load i32* %6, align 4, !dbg !1678
  %176 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %173, i32** %174, i32 %175), !dbg !1679
  %177 = add nsw i32 %172, %176, !dbg !1675
  store i32 %177, i32* %right, align 4, !dbg !1680
  %178 = load i32* %right, align 4, !dbg !1681
  %179 = load i32* %bestmse, align 4, !dbg !1683
  %180 = icmp slt i32 %178, %179, !dbg !1681
  br i1 %180, label %181, label %190, !dbg !1684

; <label>:181                                     ; preds = %155
  %182 = load %union.int_mv** %4, align 8, !dbg !1685
  %183 = bitcast %union.int_mv* %182 to i8*, !dbg !1687
  %184 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1687
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %183, i8* %184, i64 4, i32 4, i1 false), !dbg !1687
  %185 = load i32* %right, align 4, !dbg !1688
  store i32 %185, i32* %bestmse, align 4, !dbg !1689
  %186 = load i32* %thismse, align 4, !dbg !1690
  %187 = load i32** %9, align 8, !dbg !1691
  store i32 %186, i32* %187, align 4, !dbg !1692
  %188 = load i32* %sse, align 4, !dbg !1693
  %189 = load i32** %10, align 8, !dbg !1694
  store i32 %188, i32* %189, align 4, !dbg !1695
  br label %190, !dbg !1696

; <label>:190                                     ; preds = %181, %155
  %191 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1697
  %192 = getelementptr inbounds %struct.MV* %191, i32 0, i32 1, !dbg !1697
  %193 = load i16* %192, align 2, !dbg !1697
  %194 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1698
  %195 = getelementptr inbounds %struct.MV* %194, i32 0, i32 1, !dbg !1698
  store i16 %193, i16* %195, align 2, !dbg !1698
  %196 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1699
  %197 = getelementptr inbounds %struct.MV* %196, i32 0, i32 0, !dbg !1699
  %198 = load i16* %197, align 2, !dbg !1699
  %199 = sext i16 %198 to i32, !dbg !1699
  %200 = sub nsw i32 %199, 8, !dbg !1699
  %201 = or i32 %200, 4, !dbg !1700
  %202 = trunc i32 %201 to i16, !dbg !1701
  %203 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1702
  %204 = getelementptr inbounds %struct.MV* %203, i32 0, i32 0, !dbg !1702
  store i16 %202, i16* %204, align 2, !dbg !1702
  %205 = load %struct.variance_vtable** %7, align 8, !dbg !1703
  %206 = getelementptr inbounds %struct.variance_vtable* %205, i32 0, i32 4, !dbg !1703
  %207 = load i32 (i8*, i32, i8*, i32, i32*)** %206, align 8, !dbg !1703
  %208 = load i8** %y, align 8, !dbg !1704
  %209 = load i32* %y_stride, align 4, !dbg !1705
  %210 = sext i32 %209 to i64, !dbg !1704
  %211 = sub i64 0, %210, !dbg !1704
  %212 = getelementptr inbounds i8* %208, i64 %211, !dbg !1704
  %213 = load i32* %y_stride, align 4, !dbg !1706
  %214 = load i8** %z, align 8, !dbg !1707
  %215 = load %struct.block** %2, align 8, !dbg !1708
  %216 = getelementptr inbounds %struct.block* %215, i32 0, i32 11, !dbg !1708
  %217 = load i32* %216, align 4, !dbg !1708
  %218 = call i32 %207(i8* %212, i32 %213, i8* %214, i32 %217, i32* %sse), !dbg !1703
  store i32 %218, i32* %thismse, align 4, !dbg !1709
  %219 = load i32* %thismse, align 4, !dbg !1710
  %220 = load %union.int_mv** %5, align 8, !dbg !1711
  %221 = load i32*** %8, align 8, !dbg !1712
  %222 = load i32* %6, align 4, !dbg !1713
  %223 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %220, i32** %221, i32 %222), !dbg !1714
  %224 = add nsw i32 %219, %223, !dbg !1710
  store i32 %224, i32* %up, align 4, !dbg !1715
  %225 = load i32* %up, align 4, !dbg !1716
  %226 = load i32* %bestmse, align 4, !dbg !1718
  %227 = icmp slt i32 %225, %226, !dbg !1716
  br i1 %227, label %228, label %237, !dbg !1719

; <label>:228                                     ; preds = %190
  %229 = load %union.int_mv** %4, align 8, !dbg !1720
  %230 = bitcast %union.int_mv* %229 to i8*, !dbg !1722
  %231 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1722
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %230, i8* %231, i64 4, i32 4, i1 false), !dbg !1722
  %232 = load i32* %up, align 4, !dbg !1723
  store i32 %232, i32* %bestmse, align 4, !dbg !1724
  %233 = load i32* %thismse, align 4, !dbg !1725
  %234 = load i32** %9, align 8, !dbg !1726
  store i32 %233, i32* %234, align 4, !dbg !1727
  %235 = load i32* %sse, align 4, !dbg !1728
  %236 = load i32** %10, align 8, !dbg !1729
  store i32 %235, i32* %236, align 4, !dbg !1730
  br label %237, !dbg !1731

; <label>:237                                     ; preds = %228, %190
  %238 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1732
  %239 = getelementptr inbounds %struct.MV* %238, i32 0, i32 0, !dbg !1732
  %240 = load i16* %239, align 2, !dbg !1732
  %241 = sext i16 %240 to i32, !dbg !1732
  %242 = add nsw i32 %241, 8, !dbg !1732
  %243 = trunc i32 %242 to i16, !dbg !1732
  store i16 %243, i16* %239, align 2, !dbg !1732
  %244 = load %struct.variance_vtable** %7, align 8, !dbg !1733
  %245 = getelementptr inbounds %struct.variance_vtable* %244, i32 0, i32 4, !dbg !1733
  %246 = load i32 (i8*, i32, i8*, i32, i32*)** %245, align 8, !dbg !1733
  %247 = load i8** %y, align 8, !dbg !1734
  %248 = load i32* %y_stride, align 4, !dbg !1735
  %249 = load i8** %z, align 8, !dbg !1736
  %250 = load %struct.block** %2, align 8, !dbg !1737
  %251 = getelementptr inbounds %struct.block* %250, i32 0, i32 11, !dbg !1737
  %252 = load i32* %251, align 4, !dbg !1737
  %253 = call i32 %246(i8* %247, i32 %248, i8* %249, i32 %252, i32* %sse), !dbg !1733
  store i32 %253, i32* %thismse, align 4, !dbg !1738
  %254 = load i32* %thismse, align 4, !dbg !1739
  %255 = load %union.int_mv** %5, align 8, !dbg !1740
  %256 = load i32*** %8, align 8, !dbg !1741
  %257 = load i32* %6, align 4, !dbg !1742
  %258 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %255, i32** %256, i32 %257), !dbg !1743
  %259 = add nsw i32 %254, %258, !dbg !1739
  store i32 %259, i32* %down, align 4, !dbg !1744
  %260 = load i32* %down, align 4, !dbg !1745
  %261 = load i32* %bestmse, align 4, !dbg !1747
  %262 = icmp slt i32 %260, %261, !dbg !1745
  br i1 %262, label %263, label %272, !dbg !1748

; <label>:263                                     ; preds = %237
  %264 = load %union.int_mv** %4, align 8, !dbg !1749
  %265 = bitcast %union.int_mv* %264 to i8*, !dbg !1751
  %266 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1751
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %265, i8* %266, i64 4, i32 4, i1 false), !dbg !1751
  %267 = load i32* %down, align 4, !dbg !1752
  store i32 %267, i32* %bestmse, align 4, !dbg !1753
  %268 = load i32* %thismse, align 4, !dbg !1754
  %269 = load i32** %9, align 8, !dbg !1755
  store i32 %268, i32* %269, align 4, !dbg !1756
  %270 = load i32* %sse, align 4, !dbg !1757
  %271 = load i32** %10, align 8, !dbg !1758
  store i32 %270, i32* %271, align 4, !dbg !1759
  br label %272, !dbg !1760

; <label>:272                                     ; preds = %263, %237
  %273 = load i32* %left, align 4, !dbg !1761
  %274 = load i32* %right, align 4, !dbg !1762
  %275 = icmp slt i32 %273, %274, !dbg !1761
  %276 = select i1 %275, i32 0, i32 1, !dbg !1761
  %277 = load i32* %up, align 4, !dbg !1763
  %278 = load i32* %down, align 4, !dbg !1764
  %279 = icmp slt i32 %277, %278, !dbg !1763
  %280 = select i1 %279, i32 0, i32 2, !dbg !1763
  %281 = add nsw i32 %276, %280, !dbg !1765
  store i32 %281, i32* %whichdir, align 4, !dbg !1766
  %282 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1767
  %283 = bitcast %union.int_mv* %startmv to i8*, !dbg !1767
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %282, i8* %283, i64 4, i32 4, i1 false), !dbg !1767
  %284 = load i32* %whichdir, align 4, !dbg !1768
  switch i32 %284, label %377 [
    i32 0, label %285
    i32 1, label %319
    i32 2, label %349
    i32 3, label %376
  ], !dbg !1769

; <label>:285                                     ; preds = %272
  %286 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1770
  %287 = getelementptr inbounds %struct.MV* %286, i32 0, i32 1, !dbg !1770
  %288 = load i16* %287, align 2, !dbg !1770
  %289 = sext i16 %288 to i32, !dbg !1770
  %290 = sub nsw i32 %289, 8, !dbg !1770
  %291 = or i32 %290, 4, !dbg !1772
  %292 = trunc i32 %291 to i16, !dbg !1772
  %293 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1773
  %294 = getelementptr inbounds %struct.MV* %293, i32 0, i32 1, !dbg !1773
  store i16 %292, i16* %294, align 2, !dbg !1773
  %295 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1774
  %296 = getelementptr inbounds %struct.MV* %295, i32 0, i32 0, !dbg !1774
  %297 = load i16* %296, align 2, !dbg !1774
  %298 = sext i16 %297 to i32, !dbg !1774
  %299 = sub nsw i32 %298, 8, !dbg !1774
  %300 = or i32 %299, 4, !dbg !1775
  %301 = trunc i32 %300 to i16, !dbg !1775
  %302 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1776
  %303 = getelementptr inbounds %struct.MV* %302, i32 0, i32 0, !dbg !1776
  store i16 %301, i16* %303, align 2, !dbg !1776
  %304 = load %struct.variance_vtable** %7, align 8, !dbg !1777
  %305 = getelementptr inbounds %struct.variance_vtable* %304, i32 0, i32 5, !dbg !1777
  %306 = load i32 (i8*, i32, i8*, i32, i32*)** %305, align 8, !dbg !1777
  %307 = load i8** %y, align 8, !dbg !1778
  %308 = getelementptr inbounds i8* %307, i64 -1, !dbg !1778
  %309 = load i32* %y_stride, align 4, !dbg !1779
  %310 = sext i32 %309 to i64, !dbg !1778
  %311 = sub i64 0, %310, !dbg !1778
  %312 = getelementptr inbounds i8* %308, i64 %311, !dbg !1778
  %313 = load i32* %y_stride, align 4, !dbg !1780
  %314 = load i8** %z, align 8, !dbg !1781
  %315 = load %struct.block** %2, align 8, !dbg !1782
  %316 = getelementptr inbounds %struct.block* %315, i32 0, i32 11, !dbg !1782
  %317 = load i32* %316, align 4, !dbg !1782
  %318 = call i32 %306(i8* %312, i32 %313, i8* %314, i32 %317, i32* %sse), !dbg !1777
  store i32 %318, i32* %thismse, align 4, !dbg !1783
  br label %400, !dbg !1784

; <label>:319                                     ; preds = %272
  %320 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1785
  %321 = getelementptr inbounds %struct.MV* %320, i32 0, i32 1, !dbg !1785
  %322 = load i16* %321, align 2, !dbg !1785
  %323 = sext i16 %322 to i32, !dbg !1785
  %324 = add nsw i32 %323, 4, !dbg !1785
  %325 = trunc i32 %324 to i16, !dbg !1785
  store i16 %325, i16* %321, align 2, !dbg !1785
  %326 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1786
  %327 = getelementptr inbounds %struct.MV* %326, i32 0, i32 0, !dbg !1786
  %328 = load i16* %327, align 2, !dbg !1786
  %329 = sext i16 %328 to i32, !dbg !1786
  %330 = sub nsw i32 %329, 8, !dbg !1786
  %331 = or i32 %330, 4, !dbg !1787
  %332 = trunc i32 %331 to i16, !dbg !1787
  %333 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1788
  %334 = getelementptr inbounds %struct.MV* %333, i32 0, i32 0, !dbg !1788
  store i16 %332, i16* %334, align 2, !dbg !1788
  %335 = load %struct.variance_vtable** %7, align 8, !dbg !1789
  %336 = getelementptr inbounds %struct.variance_vtable* %335, i32 0, i32 5, !dbg !1789
  %337 = load i32 (i8*, i32, i8*, i32, i32*)** %336, align 8, !dbg !1789
  %338 = load i8** %y, align 8, !dbg !1790
  %339 = load i32* %y_stride, align 4, !dbg !1791
  %340 = sext i32 %339 to i64, !dbg !1790
  %341 = sub i64 0, %340, !dbg !1790
  %342 = getelementptr inbounds i8* %338, i64 %341, !dbg !1790
  %343 = load i32* %y_stride, align 4, !dbg !1792
  %344 = load i8** %z, align 8, !dbg !1793
  %345 = load %struct.block** %2, align 8, !dbg !1794
  %346 = getelementptr inbounds %struct.block* %345, i32 0, i32 11, !dbg !1794
  %347 = load i32* %346, align 4, !dbg !1794
  %348 = call i32 %337(i8* %342, i32 %343, i8* %344, i32 %347, i32* %sse), !dbg !1789
  store i32 %348, i32* %thismse, align 4, !dbg !1795
  br label %400, !dbg !1796

; <label>:349                                     ; preds = %272
  %350 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1797
  %351 = getelementptr inbounds %struct.MV* %350, i32 0, i32 1, !dbg !1797
  %352 = load i16* %351, align 2, !dbg !1797
  %353 = sext i16 %352 to i32, !dbg !1797
  %354 = sub nsw i32 %353, 8, !dbg !1797
  %355 = or i32 %354, 4, !dbg !1798
  %356 = trunc i32 %355 to i16, !dbg !1798
  %357 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1799
  %358 = getelementptr inbounds %struct.MV* %357, i32 0, i32 1, !dbg !1799
  store i16 %356, i16* %358, align 2, !dbg !1799
  %359 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1800
  %360 = getelementptr inbounds %struct.MV* %359, i32 0, i32 0, !dbg !1800
  %361 = load i16* %360, align 2, !dbg !1800
  %362 = sext i16 %361 to i32, !dbg !1800
  %363 = add nsw i32 %362, 4, !dbg !1800
  %364 = trunc i32 %363 to i16, !dbg !1800
  store i16 %364, i16* %360, align 2, !dbg !1800
  %365 = load %struct.variance_vtable** %7, align 8, !dbg !1801
  %366 = getelementptr inbounds %struct.variance_vtable* %365, i32 0, i32 5, !dbg !1801
  %367 = load i32 (i8*, i32, i8*, i32, i32*)** %366, align 8, !dbg !1801
  %368 = load i8** %y, align 8, !dbg !1802
  %369 = getelementptr inbounds i8* %368, i64 -1, !dbg !1802
  %370 = load i32* %y_stride, align 4, !dbg !1803
  %371 = load i8** %z, align 8, !dbg !1804
  %372 = load %struct.block** %2, align 8, !dbg !1805
  %373 = getelementptr inbounds %struct.block* %372, i32 0, i32 11, !dbg !1805
  %374 = load i32* %373, align 4, !dbg !1805
  %375 = call i32 %367(i8* %369, i32 %370, i8* %371, i32 %374, i32* %sse), !dbg !1801
  store i32 %375, i32* %thismse, align 4, !dbg !1806
  br label %400, !dbg !1807

; <label>:376                                     ; preds = %272
  br label %377, !dbg !1807

; <label>:377                                     ; preds = %272, %376
  %378 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1808
  %379 = getelementptr inbounds %struct.MV* %378, i32 0, i32 1, !dbg !1808
  %380 = load i16* %379, align 2, !dbg !1808
  %381 = sext i16 %380 to i32, !dbg !1808
  %382 = add nsw i32 %381, 4, !dbg !1808
  %383 = trunc i32 %382 to i16, !dbg !1808
  store i16 %383, i16* %379, align 2, !dbg !1808
  %384 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1809
  %385 = getelementptr inbounds %struct.MV* %384, i32 0, i32 0, !dbg !1809
  %386 = load i16* %385, align 2, !dbg !1809
  %387 = sext i16 %386 to i32, !dbg !1809
  %388 = add nsw i32 %387, 4, !dbg !1809
  %389 = trunc i32 %388 to i16, !dbg !1809
  store i16 %389, i16* %385, align 2, !dbg !1809
  %390 = load %struct.variance_vtable** %7, align 8, !dbg !1810
  %391 = getelementptr inbounds %struct.variance_vtable* %390, i32 0, i32 5, !dbg !1810
  %392 = load i32 (i8*, i32, i8*, i32, i32*)** %391, align 8, !dbg !1810
  %393 = load i8** %y, align 8, !dbg !1811
  %394 = load i32* %y_stride, align 4, !dbg !1812
  %395 = load i8** %z, align 8, !dbg !1813
  %396 = load %struct.block** %2, align 8, !dbg !1814
  %397 = getelementptr inbounds %struct.block* %396, i32 0, i32 11, !dbg !1814
  %398 = load i32* %397, align 4, !dbg !1814
  %399 = call i32 %392(i8* %393, i32 %394, i8* %395, i32 %398, i32* %sse), !dbg !1810
  store i32 %399, i32* %thismse, align 4, !dbg !1815
  br label %400, !dbg !1816

; <label>:400                                     ; preds = %377, %349, %319, %285
  %401 = load i32* %thismse, align 4, !dbg !1817
  %402 = load %union.int_mv** %5, align 8, !dbg !1818
  %403 = load i32*** %8, align 8, !dbg !1819
  %404 = load i32* %6, align 4, !dbg !1820
  %405 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %402, i32** %403, i32 %404), !dbg !1821
  %406 = add nsw i32 %401, %405, !dbg !1817
  store i32 %406, i32* %diag, align 4, !dbg !1822
  %407 = load i32* %diag, align 4, !dbg !1823
  %408 = load i32* %bestmse, align 4, !dbg !1825
  %409 = icmp slt i32 %407, %408, !dbg !1823
  br i1 %409, label %410, label %419, !dbg !1826

; <label>:410                                     ; preds = %400
  %411 = load %union.int_mv** %4, align 8, !dbg !1827
  %412 = bitcast %union.int_mv* %411 to i8*, !dbg !1829
  %413 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1829
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %412, i8* %413, i64 4, i32 4, i1 false), !dbg !1829
  %414 = load i32* %diag, align 4, !dbg !1830
  store i32 %414, i32* %bestmse, align 4, !dbg !1831
  %415 = load i32* %thismse, align 4, !dbg !1832
  %416 = load i32** %9, align 8, !dbg !1833
  store i32 %415, i32* %416, align 4, !dbg !1834
  %417 = load i32* %sse, align 4, !dbg !1835
  %418 = load i32** %10, align 8, !dbg !1836
  store i32 %417, i32* %418, align 4, !dbg !1837
  br label %419, !dbg !1838

; <label>:419                                     ; preds = %410, %400
  %420 = load %union.int_mv** %4, align 8, !dbg !1839
  %421 = bitcast %union.int_mv* %420 to %struct.MV*, !dbg !1839
  %422 = getelementptr inbounds %struct.MV* %421, i32 0, i32 0, !dbg !1839
  %423 = load i16* %422, align 2, !dbg !1839
  %424 = sext i16 %423 to i32, !dbg !1839
  %425 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1841
  %426 = getelementptr inbounds %struct.MV* %425, i32 0, i32 0, !dbg !1841
  %427 = load i16* %426, align 2, !dbg !1841
  %428 = sext i16 %427 to i32, !dbg !1841
  %429 = icmp slt i32 %424, %428, !dbg !1839
  br i1 %429, label %430, label %436, !dbg !1842

; <label>:430                                     ; preds = %419
  %431 = load i32* %y_stride, align 4, !dbg !1843
  %432 = load i8** %y, align 8, !dbg !1844
  %433 = sext i32 %431 to i64, !dbg !1844
  %434 = sub i64 0, %433, !dbg !1844
  %435 = getelementptr inbounds i8* %432, i64 %434, !dbg !1844
  store i8* %435, i8** %y, align 8, !dbg !1844
  br label %436, !dbg !1844

; <label>:436                                     ; preds = %430, %419
  %437 = load %union.int_mv** %4, align 8, !dbg !1845
  %438 = bitcast %union.int_mv* %437 to %struct.MV*, !dbg !1845
  %439 = getelementptr inbounds %struct.MV* %438, i32 0, i32 1, !dbg !1845
  %440 = load i16* %439, align 2, !dbg !1845
  %441 = sext i16 %440 to i32, !dbg !1845
  %442 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1847
  %443 = getelementptr inbounds %struct.MV* %442, i32 0, i32 1, !dbg !1847
  %444 = load i16* %443, align 2, !dbg !1847
  %445 = sext i16 %444 to i32, !dbg !1847
  %446 = icmp slt i32 %441, %445, !dbg !1845
  br i1 %446, label %447, label %450, !dbg !1848

; <label>:447                                     ; preds = %436
  %448 = load i8** %y, align 8, !dbg !1849
  %449 = getelementptr inbounds i8* %448, i32 -1, !dbg !1849
  store i8* %449, i8** %y, align 8, !dbg !1849
  br label %450, !dbg !1849

; <label>:450                                     ; preds = %447, %436
  %451 = load %union.int_mv** %4, align 8, !dbg !1850
  %452 = bitcast %union.int_mv* %startmv to i8*, !dbg !1851
  %453 = bitcast %union.int_mv* %451 to i8*, !dbg !1851
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %452, i8* %453, i64 4, i32 4, i1 false), !dbg !1851
  %454 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1852
  %455 = getelementptr inbounds %struct.MV* %454, i32 0, i32 0, !dbg !1852
  %456 = load i16* %455, align 2, !dbg !1852
  %457 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1853
  %458 = getelementptr inbounds %struct.MV* %457, i32 0, i32 0, !dbg !1853
  store i16 %456, i16* %458, align 2, !dbg !1853
  %459 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1854
  %460 = getelementptr inbounds %struct.MV* %459, i32 0, i32 1, !dbg !1854
  %461 = load i16* %460, align 2, !dbg !1854
  %462 = sext i16 %461 to i32, !dbg !1854
  %463 = and i32 %462, 7, !dbg !1854
  %464 = icmp ne i32 %463, 0, !dbg !1856
  br i1 %464, label %465, label %494, !dbg !1856

; <label>:465                                     ; preds = %450
  %466 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1857
  %467 = getelementptr inbounds %struct.MV* %466, i32 0, i32 1, !dbg !1857
  %468 = load i16* %467, align 2, !dbg !1857
  %469 = sext i16 %468 to i32, !dbg !1857
  %470 = sub nsw i32 %469, 2, !dbg !1857
  %471 = trunc i32 %470 to i16, !dbg !1857
  %472 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1859
  %473 = getelementptr inbounds %struct.MV* %472, i32 0, i32 1, !dbg !1859
  store i16 %471, i16* %473, align 2, !dbg !1859
  %474 = load %struct.variance_vtable** %7, align 8, !dbg !1860
  %475 = getelementptr inbounds %struct.variance_vtable* %474, i32 0, i32 2, !dbg !1860
  %476 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %475, align 8, !dbg !1860
  %477 = load i8** %y, align 8, !dbg !1861
  %478 = load i32* %y_stride, align 4, !dbg !1862
  %479 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1863
  %480 = getelementptr inbounds %struct.MV* %479, i32 0, i32 1, !dbg !1863
  %481 = load i16* %480, align 2, !dbg !1863
  %482 = sext i16 %481 to i32, !dbg !1863
  %483 = and i32 %482, 7, !dbg !1863
  %484 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1864
  %485 = getelementptr inbounds %struct.MV* %484, i32 0, i32 0, !dbg !1864
  %486 = load i16* %485, align 2, !dbg !1864
  %487 = sext i16 %486 to i32, !dbg !1864
  %488 = and i32 %487, 7, !dbg !1864
  %489 = load i8** %z, align 8, !dbg !1865
  %490 = load %struct.block** %2, align 8, !dbg !1866
  %491 = getelementptr inbounds %struct.block* %490, i32 0, i32 11, !dbg !1866
  %492 = load i32* %491, align 4, !dbg !1866
  %493 = call i32 %476(i8* %477, i32 %478, i32 %483, i32 %488, i8* %489, i32 %492, i32* %sse), !dbg !1860
  store i32 %493, i32* %thismse, align 4, !dbg !1867
  br label %520, !dbg !1868

; <label>:494                                     ; preds = %450
  %495 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1869
  %496 = getelementptr inbounds %struct.MV* %495, i32 0, i32 1, !dbg !1869
  %497 = load i16* %496, align 2, !dbg !1869
  %498 = sext i16 %497 to i32, !dbg !1869
  %499 = sub nsw i32 %498, 8, !dbg !1869
  %500 = or i32 %499, 6, !dbg !1871
  %501 = trunc i32 %500 to i16, !dbg !1871
  %502 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1872
  %503 = getelementptr inbounds %struct.MV* %502, i32 0, i32 1, !dbg !1872
  store i16 %501, i16* %503, align 2, !dbg !1872
  %504 = load %struct.variance_vtable** %7, align 8, !dbg !1873
  %505 = getelementptr inbounds %struct.variance_vtable* %504, i32 0, i32 2, !dbg !1873
  %506 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %505, align 8, !dbg !1873
  %507 = load i8** %y, align 8, !dbg !1874
  %508 = getelementptr inbounds i8* %507, i64 -1, !dbg !1874
  %509 = load i32* %y_stride, align 4, !dbg !1875
  %510 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1876
  %511 = getelementptr inbounds %struct.MV* %510, i32 0, i32 0, !dbg !1876
  %512 = load i16* %511, align 2, !dbg !1876
  %513 = sext i16 %512 to i32, !dbg !1876
  %514 = and i32 %513, 7, !dbg !1876
  %515 = load i8** %z, align 8, !dbg !1877
  %516 = load %struct.block** %2, align 8, !dbg !1878
  %517 = getelementptr inbounds %struct.block* %516, i32 0, i32 11, !dbg !1878
  %518 = load i32* %517, align 4, !dbg !1878
  %519 = call i32 %506(i8* %508, i32 %509, i32 6, i32 %514, i8* %515, i32 %518, i32* %sse), !dbg !1873
  store i32 %519, i32* %thismse, align 4, !dbg !1879
  br label %520

; <label>:520                                     ; preds = %494, %465
  %521 = load i32* %thismse, align 4, !dbg !1880
  %522 = load %union.int_mv** %5, align 8, !dbg !1881
  %523 = load i32*** %8, align 8, !dbg !1882
  %524 = load i32* %6, align 4, !dbg !1883
  %525 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %522, i32** %523, i32 %524), !dbg !1884
  %526 = add nsw i32 %521, %525, !dbg !1880
  store i32 %526, i32* %left, align 4, !dbg !1885
  %527 = load i32* %left, align 4, !dbg !1886
  %528 = load i32* %bestmse, align 4, !dbg !1888
  %529 = icmp slt i32 %527, %528, !dbg !1886
  br i1 %529, label %530, label %539, !dbg !1889

; <label>:530                                     ; preds = %520
  %531 = load %union.int_mv** %4, align 8, !dbg !1890
  %532 = bitcast %union.int_mv* %531 to i8*, !dbg !1892
  %533 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1892
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %532, i8* %533, i64 4, i32 4, i1 false), !dbg !1892
  %534 = load i32* %left, align 4, !dbg !1893
  store i32 %534, i32* %bestmse, align 4, !dbg !1894
  %535 = load i32* %thismse, align 4, !dbg !1895
  %536 = load i32** %9, align 8, !dbg !1896
  store i32 %535, i32* %536, align 4, !dbg !1897
  %537 = load i32* %sse, align 4, !dbg !1898
  %538 = load i32** %10, align 8, !dbg !1899
  store i32 %537, i32* %538, align 4, !dbg !1900
  br label %539, !dbg !1901

; <label>:539                                     ; preds = %530, %520
  %540 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1902
  %541 = getelementptr inbounds %struct.MV* %540, i32 0, i32 1, !dbg !1902
  %542 = load i16* %541, align 2, !dbg !1902
  %543 = sext i16 %542 to i32, !dbg !1902
  %544 = add nsw i32 %543, 4, !dbg !1902
  %545 = trunc i32 %544 to i16, !dbg !1902
  store i16 %545, i16* %541, align 2, !dbg !1902
  %546 = load %struct.variance_vtable** %7, align 8, !dbg !1903
  %547 = getelementptr inbounds %struct.variance_vtable* %546, i32 0, i32 2, !dbg !1903
  %548 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %547, align 8, !dbg !1903
  %549 = load i8** %y, align 8, !dbg !1904
  %550 = load i32* %y_stride, align 4, !dbg !1905
  %551 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1906
  %552 = getelementptr inbounds %struct.MV* %551, i32 0, i32 1, !dbg !1906
  %553 = load i16* %552, align 2, !dbg !1906
  %554 = sext i16 %553 to i32, !dbg !1906
  %555 = and i32 %554, 7, !dbg !1906
  %556 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1907
  %557 = getelementptr inbounds %struct.MV* %556, i32 0, i32 0, !dbg !1907
  %558 = load i16* %557, align 2, !dbg !1907
  %559 = sext i16 %558 to i32, !dbg !1907
  %560 = and i32 %559, 7, !dbg !1907
  %561 = load i8** %z, align 8, !dbg !1908
  %562 = load %struct.block** %2, align 8, !dbg !1909
  %563 = getelementptr inbounds %struct.block* %562, i32 0, i32 11, !dbg !1909
  %564 = load i32* %563, align 4, !dbg !1909
  %565 = call i32 %548(i8* %549, i32 %550, i32 %555, i32 %560, i8* %561, i32 %564, i32* %sse), !dbg !1903
  store i32 %565, i32* %thismse, align 4, !dbg !1910
  %566 = load i32* %thismse, align 4, !dbg !1911
  %567 = load %union.int_mv** %5, align 8, !dbg !1912
  %568 = load i32*** %8, align 8, !dbg !1913
  %569 = load i32* %6, align 4, !dbg !1914
  %570 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %567, i32** %568, i32 %569), !dbg !1915
  %571 = add nsw i32 %566, %570, !dbg !1911
  store i32 %571, i32* %right, align 4, !dbg !1916
  %572 = load i32* %right, align 4, !dbg !1917
  %573 = load i32* %bestmse, align 4, !dbg !1919
  %574 = icmp slt i32 %572, %573, !dbg !1917
  br i1 %574, label %575, label %584, !dbg !1920

; <label>:575                                     ; preds = %539
  %576 = load %union.int_mv** %4, align 8, !dbg !1921
  %577 = bitcast %union.int_mv* %576 to i8*, !dbg !1923
  %578 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1923
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %577, i8* %578, i64 4, i32 4, i1 false), !dbg !1923
  %579 = load i32* %right, align 4, !dbg !1924
  store i32 %579, i32* %bestmse, align 4, !dbg !1925
  %580 = load i32* %thismse, align 4, !dbg !1926
  %581 = load i32** %9, align 8, !dbg !1927
  store i32 %580, i32* %581, align 4, !dbg !1928
  %582 = load i32* %sse, align 4, !dbg !1929
  %583 = load i32** %10, align 8, !dbg !1930
  store i32 %582, i32* %583, align 4, !dbg !1931
  br label %584, !dbg !1932

; <label>:584                                     ; preds = %575, %539
  %585 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1933
  %586 = getelementptr inbounds %struct.MV* %585, i32 0, i32 1, !dbg !1933
  %587 = load i16* %586, align 2, !dbg !1933
  %588 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1934
  %589 = getelementptr inbounds %struct.MV* %588, i32 0, i32 1, !dbg !1934
  store i16 %587, i16* %589, align 2, !dbg !1934
  %590 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1935
  %591 = getelementptr inbounds %struct.MV* %590, i32 0, i32 0, !dbg !1935
  %592 = load i16* %591, align 2, !dbg !1935
  %593 = sext i16 %592 to i32, !dbg !1935
  %594 = and i32 %593, 7, !dbg !1935
  %595 = icmp ne i32 %594, 0, !dbg !1937
  br i1 %595, label %596, label %625, !dbg !1937

; <label>:596                                     ; preds = %584
  %597 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1938
  %598 = getelementptr inbounds %struct.MV* %597, i32 0, i32 0, !dbg !1938
  %599 = load i16* %598, align 2, !dbg !1938
  %600 = sext i16 %599 to i32, !dbg !1938
  %601 = sub nsw i32 %600, 2, !dbg !1938
  %602 = trunc i32 %601 to i16, !dbg !1938
  %603 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1940
  %604 = getelementptr inbounds %struct.MV* %603, i32 0, i32 0, !dbg !1940
  store i16 %602, i16* %604, align 2, !dbg !1940
  %605 = load %struct.variance_vtable** %7, align 8, !dbg !1941
  %606 = getelementptr inbounds %struct.variance_vtable* %605, i32 0, i32 2, !dbg !1941
  %607 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %606, align 8, !dbg !1941
  %608 = load i8** %y, align 8, !dbg !1942
  %609 = load i32* %y_stride, align 4, !dbg !1943
  %610 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1944
  %611 = getelementptr inbounds %struct.MV* %610, i32 0, i32 1, !dbg !1944
  %612 = load i16* %611, align 2, !dbg !1944
  %613 = sext i16 %612 to i32, !dbg !1944
  %614 = and i32 %613, 7, !dbg !1944
  %615 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1945
  %616 = getelementptr inbounds %struct.MV* %615, i32 0, i32 0, !dbg !1945
  %617 = load i16* %616, align 2, !dbg !1945
  %618 = sext i16 %617 to i32, !dbg !1945
  %619 = and i32 %618, 7, !dbg !1945
  %620 = load i8** %z, align 8, !dbg !1946
  %621 = load %struct.block** %2, align 8, !dbg !1947
  %622 = getelementptr inbounds %struct.block* %621, i32 0, i32 11, !dbg !1947
  %623 = load i32* %622, align 4, !dbg !1947
  %624 = call i32 %607(i8* %608, i32 %609, i32 %614, i32 %619, i8* %620, i32 %623, i32* %sse), !dbg !1941
  store i32 %624, i32* %thismse, align 4, !dbg !1948
  br label %654, !dbg !1949

; <label>:625                                     ; preds = %584
  %626 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1950
  %627 = getelementptr inbounds %struct.MV* %626, i32 0, i32 0, !dbg !1950
  %628 = load i16* %627, align 2, !dbg !1950
  %629 = sext i16 %628 to i32, !dbg !1950
  %630 = sub nsw i32 %629, 8, !dbg !1950
  %631 = or i32 %630, 6, !dbg !1952
  %632 = trunc i32 %631 to i16, !dbg !1952
  %633 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1953
  %634 = getelementptr inbounds %struct.MV* %633, i32 0, i32 0, !dbg !1953
  store i16 %632, i16* %634, align 2, !dbg !1953
  %635 = load %struct.variance_vtable** %7, align 8, !dbg !1954
  %636 = getelementptr inbounds %struct.variance_vtable* %635, i32 0, i32 2, !dbg !1954
  %637 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %636, align 8, !dbg !1954
  %638 = load i8** %y, align 8, !dbg !1955
  %639 = load i32* %y_stride, align 4, !dbg !1956
  %640 = sext i32 %639 to i64, !dbg !1955
  %641 = sub i64 0, %640, !dbg !1955
  %642 = getelementptr inbounds i8* %638, i64 %641, !dbg !1955
  %643 = load i32* %y_stride, align 4, !dbg !1957
  %644 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1958
  %645 = getelementptr inbounds %struct.MV* %644, i32 0, i32 1, !dbg !1958
  %646 = load i16* %645, align 2, !dbg !1958
  %647 = sext i16 %646 to i32, !dbg !1958
  %648 = and i32 %647, 7, !dbg !1958
  %649 = load i8** %z, align 8, !dbg !1959
  %650 = load %struct.block** %2, align 8, !dbg !1960
  %651 = getelementptr inbounds %struct.block* %650, i32 0, i32 11, !dbg !1960
  %652 = load i32* %651, align 4, !dbg !1960
  %653 = call i32 %637(i8* %642, i32 %643, i32 %648, i32 6, i8* %649, i32 %652, i32* %sse), !dbg !1954
  store i32 %653, i32* %thismse, align 4, !dbg !1961
  br label %654

; <label>:654                                     ; preds = %625, %596
  %655 = load i32* %thismse, align 4, !dbg !1962
  %656 = load %union.int_mv** %5, align 8, !dbg !1963
  %657 = load i32*** %8, align 8, !dbg !1964
  %658 = load i32* %6, align 4, !dbg !1965
  %659 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %656, i32** %657, i32 %658), !dbg !1966
  %660 = add nsw i32 %655, %659, !dbg !1962
  store i32 %660, i32* %up, align 4, !dbg !1967
  %661 = load i32* %up, align 4, !dbg !1968
  %662 = load i32* %bestmse, align 4, !dbg !1970
  %663 = icmp slt i32 %661, %662, !dbg !1968
  br i1 %663, label %664, label %673, !dbg !1971

; <label>:664                                     ; preds = %654
  %665 = load %union.int_mv** %4, align 8, !dbg !1972
  %666 = bitcast %union.int_mv* %665 to i8*, !dbg !1974
  %667 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1974
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %666, i8* %667, i64 4, i32 4, i1 false), !dbg !1974
  %668 = load i32* %up, align 4, !dbg !1975
  store i32 %668, i32* %bestmse, align 4, !dbg !1976
  %669 = load i32* %thismse, align 4, !dbg !1977
  %670 = load i32** %9, align 8, !dbg !1978
  store i32 %669, i32* %670, align 4, !dbg !1979
  %671 = load i32* %sse, align 4, !dbg !1980
  %672 = load i32** %10, align 8, !dbg !1981
  store i32 %671, i32* %672, align 4, !dbg !1982
  br label %673, !dbg !1983

; <label>:673                                     ; preds = %664, %654
  %674 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1984
  %675 = getelementptr inbounds %struct.MV* %674, i32 0, i32 0, !dbg !1984
  %676 = load i16* %675, align 2, !dbg !1984
  %677 = sext i16 %676 to i32, !dbg !1984
  %678 = add nsw i32 %677, 4, !dbg !1984
  %679 = trunc i32 %678 to i16, !dbg !1984
  store i16 %679, i16* %675, align 2, !dbg !1984
  %680 = load %struct.variance_vtable** %7, align 8, !dbg !1985
  %681 = getelementptr inbounds %struct.variance_vtable* %680, i32 0, i32 2, !dbg !1985
  %682 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %681, align 8, !dbg !1985
  %683 = load i8** %y, align 8, !dbg !1986
  %684 = load i32* %y_stride, align 4, !dbg !1987
  %685 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1988
  %686 = getelementptr inbounds %struct.MV* %685, i32 0, i32 1, !dbg !1988
  %687 = load i16* %686, align 2, !dbg !1988
  %688 = sext i16 %687 to i32, !dbg !1988
  %689 = and i32 %688, 7, !dbg !1988
  %690 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1989
  %691 = getelementptr inbounds %struct.MV* %690, i32 0, i32 0, !dbg !1989
  %692 = load i16* %691, align 2, !dbg !1989
  %693 = sext i16 %692 to i32, !dbg !1989
  %694 = and i32 %693, 7, !dbg !1989
  %695 = load i8** %z, align 8, !dbg !1990
  %696 = load %struct.block** %2, align 8, !dbg !1991
  %697 = getelementptr inbounds %struct.block* %696, i32 0, i32 11, !dbg !1991
  %698 = load i32* %697, align 4, !dbg !1991
  %699 = call i32 %682(i8* %683, i32 %684, i32 %689, i32 %694, i8* %695, i32 %698, i32* %sse), !dbg !1985
  store i32 %699, i32* %thismse, align 4, !dbg !1992
  %700 = load i32* %thismse, align 4, !dbg !1993
  %701 = load %union.int_mv** %5, align 8, !dbg !1994
  %702 = load i32*** %8, align 8, !dbg !1995
  %703 = load i32* %6, align 4, !dbg !1996
  %704 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %701, i32** %702, i32 %703), !dbg !1997
  %705 = add nsw i32 %700, %704, !dbg !1993
  store i32 %705, i32* %down, align 4, !dbg !1998
  %706 = load i32* %down, align 4, !dbg !1999
  %707 = load i32* %bestmse, align 4, !dbg !2001
  %708 = icmp slt i32 %706, %707, !dbg !1999
  br i1 %708, label %709, label %718, !dbg !2002

; <label>:709                                     ; preds = %673
  %710 = load %union.int_mv** %4, align 8, !dbg !2003
  %711 = bitcast %union.int_mv* %710 to i8*, !dbg !2005
  %712 = bitcast %union.int_mv* %this_mv to i8*, !dbg !2005
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %711, i8* %712, i64 4, i32 4, i1 false), !dbg !2005
  %713 = load i32* %down, align 4, !dbg !2006
  store i32 %713, i32* %bestmse, align 4, !dbg !2007
  %714 = load i32* %thismse, align 4, !dbg !2008
  %715 = load i32** %9, align 8, !dbg !2009
  store i32 %714, i32* %715, align 4, !dbg !2010
  %716 = load i32* %sse, align 4, !dbg !2011
  %717 = load i32** %10, align 8, !dbg !2012
  store i32 %716, i32* %717, align 4, !dbg !2013
  br label %718, !dbg !2014

; <label>:718                                     ; preds = %709, %673
  %719 = load i32* %left, align 4, !dbg !2015
  %720 = load i32* %right, align 4, !dbg !2016
  %721 = icmp slt i32 %719, %720, !dbg !2015
  %722 = select i1 %721, i32 0, i32 1, !dbg !2015
  %723 = load i32* %up, align 4, !dbg !2017
  %724 = load i32* %down, align 4, !dbg !2018
  %725 = icmp slt i32 %723, %724, !dbg !2017
  %726 = select i1 %725, i32 0, i32 2, !dbg !2017
  %727 = add nsw i32 %722, %726, !dbg !2019
  store i32 %727, i32* %whichdir, align 4, !dbg !2020
  %728 = bitcast %union.int_mv* %this_mv to i8*, !dbg !2021
  %729 = bitcast %union.int_mv* %startmv to i8*, !dbg !2021
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %728, i8* %729, i64 4, i32 4, i1 false), !dbg !2021
  %730 = load i32* %whichdir, align 4, !dbg !2022
  switch i32 %730, label %1044 [
    i32 0, label %731
    i32 1, label %874
    i32 2, label %944
    i32 3, label %1011
  ], !dbg !2023

; <label>:731                                     ; preds = %718
  %732 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2024
  %733 = getelementptr inbounds %struct.MV* %732, i32 0, i32 0, !dbg !2024
  %734 = load i16* %733, align 2, !dbg !2024
  %735 = sext i16 %734 to i32, !dbg !2024
  %736 = and i32 %735, 7, !dbg !2024
  %737 = icmp ne i32 %736, 0, !dbg !2027
  br i1 %737, label %738, label %805, !dbg !2027

; <label>:738                                     ; preds = %731
  %739 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2028
  %740 = getelementptr inbounds %struct.MV* %739, i32 0, i32 0, !dbg !2028
  %741 = load i16* %740, align 2, !dbg !2028
  %742 = sext i16 %741 to i32, !dbg !2028
  %743 = sub nsw i32 %742, 2, !dbg !2028
  %744 = trunc i32 %743 to i16, !dbg !2028
  store i16 %744, i16* %740, align 2, !dbg !2028
  %745 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2030
  %746 = getelementptr inbounds %struct.MV* %745, i32 0, i32 1, !dbg !2030
  %747 = load i16* %746, align 2, !dbg !2030
  %748 = sext i16 %747 to i32, !dbg !2030
  %749 = and i32 %748, 7, !dbg !2030
  %750 = icmp ne i32 %749, 0, !dbg !2032
  br i1 %750, label %751, label %778, !dbg !2032

; <label>:751                                     ; preds = %738
  %752 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2033
  %753 = getelementptr inbounds %struct.MV* %752, i32 0, i32 1, !dbg !2033
  %754 = load i16* %753, align 2, !dbg !2033
  %755 = sext i16 %754 to i32, !dbg !2033
  %756 = sub nsw i32 %755, 2, !dbg !2033
  %757 = trunc i32 %756 to i16, !dbg !2033
  store i16 %757, i16* %753, align 2, !dbg !2033
  %758 = load %struct.variance_vtable** %7, align 8, !dbg !2035
  %759 = getelementptr inbounds %struct.variance_vtable* %758, i32 0, i32 2, !dbg !2035
  %760 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %759, align 8, !dbg !2035
  %761 = load i8** %y, align 8, !dbg !2036
  %762 = load i32* %y_stride, align 4, !dbg !2037
  %763 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2038
  %764 = getelementptr inbounds %struct.MV* %763, i32 0, i32 1, !dbg !2038
  %765 = load i16* %764, align 2, !dbg !2038
  %766 = sext i16 %765 to i32, !dbg !2038
  %767 = and i32 %766, 7, !dbg !2038
  %768 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2039
  %769 = getelementptr inbounds %struct.MV* %768, i32 0, i32 0, !dbg !2039
  %770 = load i16* %769, align 2, !dbg !2039
  %771 = sext i16 %770 to i32, !dbg !2039
  %772 = and i32 %771, 7, !dbg !2039
  %773 = load i8** %z, align 8, !dbg !2040
  %774 = load %struct.block** %2, align 8, !dbg !2041
  %775 = getelementptr inbounds %struct.block* %774, i32 0, i32 11, !dbg !2041
  %776 = load i32* %775, align 4, !dbg !2041
  %777 = call i32 %760(i8* %761, i32 %762, i32 %767, i32 %772, i8* %773, i32 %776, i32* %sse), !dbg !2035
  store i32 %777, i32* %thismse, align 4, !dbg !2042
  br label %804, !dbg !2043

; <label>:778                                     ; preds = %738
  %779 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2044
  %780 = getelementptr inbounds %struct.MV* %779, i32 0, i32 1, !dbg !2044
  %781 = load i16* %780, align 2, !dbg !2044
  %782 = sext i16 %781 to i32, !dbg !2044
  %783 = sub nsw i32 %782, 8, !dbg !2044
  %784 = or i32 %783, 6, !dbg !2046
  %785 = trunc i32 %784 to i16, !dbg !2046
  %786 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2047
  %787 = getelementptr inbounds %struct.MV* %786, i32 0, i32 1, !dbg !2047
  store i16 %785, i16* %787, align 2, !dbg !2047
  %788 = load %struct.variance_vtable** %7, align 8, !dbg !2048
  %789 = getelementptr inbounds %struct.variance_vtable* %788, i32 0, i32 2, !dbg !2048
  %790 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %789, align 8, !dbg !2048
  %791 = load i8** %y, align 8, !dbg !2049
  %792 = getelementptr inbounds i8* %791, i64 -1, !dbg !2049
  %793 = load i32* %y_stride, align 4, !dbg !2050
  %794 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2051
  %795 = getelementptr inbounds %struct.MV* %794, i32 0, i32 0, !dbg !2051
  %796 = load i16* %795, align 2, !dbg !2051
  %797 = sext i16 %796 to i32, !dbg !2051
  %798 = and i32 %797, 7, !dbg !2051
  %799 = load i8** %z, align 8, !dbg !2052
  %800 = load %struct.block** %2, align 8, !dbg !2053
  %801 = getelementptr inbounds %struct.block* %800, i32 0, i32 11, !dbg !2053
  %802 = load i32* %801, align 4, !dbg !2053
  %803 = call i32 %790(i8* %792, i32 %793, i32 6, i32 %798, i8* %799, i32 %802, i32* %sse), !dbg !2048
  store i32 %803, i32* %thismse, align 4, !dbg !2054
  br label %804

; <label>:804                                     ; preds = %778, %751
  br label %873, !dbg !2055

; <label>:805                                     ; preds = %731
  %806 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2056
  %807 = getelementptr inbounds %struct.MV* %806, i32 0, i32 0, !dbg !2056
  %808 = load i16* %807, align 2, !dbg !2056
  %809 = sext i16 %808 to i32, !dbg !2056
  %810 = sub nsw i32 %809, 8, !dbg !2056
  %811 = or i32 %810, 6, !dbg !2058
  %812 = trunc i32 %811 to i16, !dbg !2058
  %813 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2059
  %814 = getelementptr inbounds %struct.MV* %813, i32 0, i32 0, !dbg !2059
  store i16 %812, i16* %814, align 2, !dbg !2059
  %815 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2060
  %816 = getelementptr inbounds %struct.MV* %815, i32 0, i32 1, !dbg !2060
  %817 = load i16* %816, align 2, !dbg !2060
  %818 = sext i16 %817 to i32, !dbg !2060
  %819 = and i32 %818, 7, !dbg !2060
  %820 = icmp ne i32 %819, 0, !dbg !2062
  br i1 %820, label %821, label %847, !dbg !2062

; <label>:821                                     ; preds = %805
  %822 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2063
  %823 = getelementptr inbounds %struct.MV* %822, i32 0, i32 1, !dbg !2063
  %824 = load i16* %823, align 2, !dbg !2063
  %825 = sext i16 %824 to i32, !dbg !2063
  %826 = sub nsw i32 %825, 2, !dbg !2063
  %827 = trunc i32 %826 to i16, !dbg !2063
  store i16 %827, i16* %823, align 2, !dbg !2063
  %828 = load %struct.variance_vtable** %7, align 8, !dbg !2065
  %829 = getelementptr inbounds %struct.variance_vtable* %828, i32 0, i32 2, !dbg !2065
  %830 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %829, align 8, !dbg !2065
  %831 = load i8** %y, align 8, !dbg !2066
  %832 = load i32* %y_stride, align 4, !dbg !2067
  %833 = sext i32 %832 to i64, !dbg !2066
  %834 = sub i64 0, %833, !dbg !2066
  %835 = getelementptr inbounds i8* %831, i64 %834, !dbg !2066
  %836 = load i32* %y_stride, align 4, !dbg !2068
  %837 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2069
  %838 = getelementptr inbounds %struct.MV* %837, i32 0, i32 1, !dbg !2069
  %839 = load i16* %838, align 2, !dbg !2069
  %840 = sext i16 %839 to i32, !dbg !2069
  %841 = and i32 %840, 7, !dbg !2069
  %842 = load i8** %z, align 8, !dbg !2070
  %843 = load %struct.block** %2, align 8, !dbg !2071
  %844 = getelementptr inbounds %struct.block* %843, i32 0, i32 11, !dbg !2071
  %845 = load i32* %844, align 4, !dbg !2071
  %846 = call i32 %830(i8* %835, i32 %836, i32 %841, i32 6, i8* %842, i32 %845, i32* %sse), !dbg !2065
  store i32 %846, i32* %thismse, align 4, !dbg !2072
  br label %872, !dbg !2073

; <label>:847                                     ; preds = %805
  %848 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2074
  %849 = getelementptr inbounds %struct.MV* %848, i32 0, i32 1, !dbg !2074
  %850 = load i16* %849, align 2, !dbg !2074
  %851 = sext i16 %850 to i32, !dbg !2074
  %852 = sub nsw i32 %851, 8, !dbg !2074
  %853 = or i32 %852, 6, !dbg !2076
  %854 = trunc i32 %853 to i16, !dbg !2076
  %855 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2077
  %856 = getelementptr inbounds %struct.MV* %855, i32 0, i32 1, !dbg !2077
  store i16 %854, i16* %856, align 2, !dbg !2077
  %857 = load %struct.variance_vtable** %7, align 8, !dbg !2078
  %858 = getelementptr inbounds %struct.variance_vtable* %857, i32 0, i32 2, !dbg !2078
  %859 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %858, align 8, !dbg !2078
  %860 = load i8** %y, align 8, !dbg !2079
  %861 = load i32* %y_stride, align 4, !dbg !2080
  %862 = sext i32 %861 to i64, !dbg !2079
  %863 = sub i64 0, %862, !dbg !2079
  %864 = getelementptr inbounds i8* %860, i64 %863, !dbg !2079
  %865 = getelementptr inbounds i8* %864, i64 -1, !dbg !2079
  %866 = load i32* %y_stride, align 4, !dbg !2081
  %867 = load i8** %z, align 8, !dbg !2082
  %868 = load %struct.block** %2, align 8, !dbg !2083
  %869 = getelementptr inbounds %struct.block* %868, i32 0, i32 11, !dbg !2083
  %870 = load i32* %869, align 4, !dbg !2083
  %871 = call i32 %859(i8* %865, i32 %866, i32 6, i32 6, i8* %867, i32 %870, i32* %sse), !dbg !2078
  store i32 %871, i32* %thismse, align 4, !dbg !2084
  br label %872

; <label>:872                                     ; preds = %847, %821
  br label %873

; <label>:873                                     ; preds = %872, %804
  br label %1044, !dbg !2085

; <label>:874                                     ; preds = %718
  %875 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2086
  %876 = getelementptr inbounds %struct.MV* %875, i32 0, i32 1, !dbg !2086
  %877 = load i16* %876, align 2, !dbg !2086
  %878 = sext i16 %877 to i32, !dbg !2086
  %879 = add nsw i32 %878, 2, !dbg !2086
  %880 = trunc i32 %879 to i16, !dbg !2086
  store i16 %880, i16* %876, align 2, !dbg !2086
  %881 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2087
  %882 = getelementptr inbounds %struct.MV* %881, i32 0, i32 0, !dbg !2087
  %883 = load i16* %882, align 2, !dbg !2087
  %884 = sext i16 %883 to i32, !dbg !2087
  %885 = and i32 %884, 7, !dbg !2087
  %886 = icmp ne i32 %885, 0, !dbg !2089
  br i1 %886, label %887, label %914, !dbg !2089

; <label>:887                                     ; preds = %874
  %888 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2090
  %889 = getelementptr inbounds %struct.MV* %888, i32 0, i32 0, !dbg !2090
  %890 = load i16* %889, align 2, !dbg !2090
  %891 = sext i16 %890 to i32, !dbg !2090
  %892 = sub nsw i32 %891, 2, !dbg !2090
  %893 = trunc i32 %892 to i16, !dbg !2090
  store i16 %893, i16* %889, align 2, !dbg !2090
  %894 = load %struct.variance_vtable** %7, align 8, !dbg !2092
  %895 = getelementptr inbounds %struct.variance_vtable* %894, i32 0, i32 2, !dbg !2092
  %896 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %895, align 8, !dbg !2092
  %897 = load i8** %y, align 8, !dbg !2093
  %898 = load i32* %y_stride, align 4, !dbg !2094
  %899 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2095
  %900 = getelementptr inbounds %struct.MV* %899, i32 0, i32 1, !dbg !2095
  %901 = load i16* %900, align 2, !dbg !2095
  %902 = sext i16 %901 to i32, !dbg !2095
  %903 = and i32 %902, 7, !dbg !2095
  %904 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2096
  %905 = getelementptr inbounds %struct.MV* %904, i32 0, i32 0, !dbg !2096
  %906 = load i16* %905, align 2, !dbg !2096
  %907 = sext i16 %906 to i32, !dbg !2096
  %908 = and i32 %907, 7, !dbg !2096
  %909 = load i8** %z, align 8, !dbg !2097
  %910 = load %struct.block** %2, align 8, !dbg !2098
  %911 = getelementptr inbounds %struct.block* %910, i32 0, i32 11, !dbg !2098
  %912 = load i32* %911, align 4, !dbg !2098
  %913 = call i32 %896(i8* %897, i32 %898, i32 %903, i32 %908, i8* %909, i32 %912, i32* %sse), !dbg !2092
  store i32 %913, i32* %thismse, align 4, !dbg !2099
  br label %943, !dbg !2100

; <label>:914                                     ; preds = %874
  %915 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2101
  %916 = getelementptr inbounds %struct.MV* %915, i32 0, i32 0, !dbg !2101
  %917 = load i16* %916, align 2, !dbg !2101
  %918 = sext i16 %917 to i32, !dbg !2101
  %919 = sub nsw i32 %918, 8, !dbg !2101
  %920 = or i32 %919, 6, !dbg !2103
  %921 = trunc i32 %920 to i16, !dbg !2103
  %922 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2104
  %923 = getelementptr inbounds %struct.MV* %922, i32 0, i32 0, !dbg !2104
  store i16 %921, i16* %923, align 2, !dbg !2104
  %924 = load %struct.variance_vtable** %7, align 8, !dbg !2105
  %925 = getelementptr inbounds %struct.variance_vtable* %924, i32 0, i32 2, !dbg !2105
  %926 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %925, align 8, !dbg !2105
  %927 = load i8** %y, align 8, !dbg !2106
  %928 = load i32* %y_stride, align 4, !dbg !2107
  %929 = sext i32 %928 to i64, !dbg !2106
  %930 = sub i64 0, %929, !dbg !2106
  %931 = getelementptr inbounds i8* %927, i64 %930, !dbg !2106
  %932 = load i32* %y_stride, align 4, !dbg !2108
  %933 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2109
  %934 = getelementptr inbounds %struct.MV* %933, i32 0, i32 1, !dbg !2109
  %935 = load i16* %934, align 2, !dbg !2109
  %936 = sext i16 %935 to i32, !dbg !2109
  %937 = and i32 %936, 7, !dbg !2109
  %938 = load i8** %z, align 8, !dbg !2110
  %939 = load %struct.block** %2, align 8, !dbg !2111
  %940 = getelementptr inbounds %struct.block* %939, i32 0, i32 11, !dbg !2111
  %941 = load i32* %940, align 4, !dbg !2111
  %942 = call i32 %926(i8* %931, i32 %932, i32 %937, i32 6, i8* %938, i32 %941, i32* %sse), !dbg !2105
  store i32 %942, i32* %thismse, align 4, !dbg !2112
  br label %943

; <label>:943                                     ; preds = %914, %887
  br label %1044, !dbg !2113

; <label>:944                                     ; preds = %718
  %945 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2114
  %946 = getelementptr inbounds %struct.MV* %945, i32 0, i32 0, !dbg !2114
  %947 = load i16* %946, align 2, !dbg !2114
  %948 = sext i16 %947 to i32, !dbg !2114
  %949 = add nsw i32 %948, 2, !dbg !2114
  %950 = trunc i32 %949 to i16, !dbg !2114
  store i16 %950, i16* %946, align 2, !dbg !2114
  %951 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2115
  %952 = getelementptr inbounds %struct.MV* %951, i32 0, i32 1, !dbg !2115
  %953 = load i16* %952, align 2, !dbg !2115
  %954 = sext i16 %953 to i32, !dbg !2115
  %955 = and i32 %954, 7, !dbg !2115
  %956 = icmp ne i32 %955, 0, !dbg !2117
  br i1 %956, label %957, label %984, !dbg !2117

; <label>:957                                     ; preds = %944
  %958 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2118
  %959 = getelementptr inbounds %struct.MV* %958, i32 0, i32 1, !dbg !2118
  %960 = load i16* %959, align 2, !dbg !2118
  %961 = sext i16 %960 to i32, !dbg !2118
  %962 = sub nsw i32 %961, 2, !dbg !2118
  %963 = trunc i32 %962 to i16, !dbg !2118
  store i16 %963, i16* %959, align 2, !dbg !2118
  %964 = load %struct.variance_vtable** %7, align 8, !dbg !2120
  %965 = getelementptr inbounds %struct.variance_vtable* %964, i32 0, i32 2, !dbg !2120
  %966 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %965, align 8, !dbg !2120
  %967 = load i8** %y, align 8, !dbg !2121
  %968 = load i32* %y_stride, align 4, !dbg !2122
  %969 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2123
  %970 = getelementptr inbounds %struct.MV* %969, i32 0, i32 1, !dbg !2123
  %971 = load i16* %970, align 2, !dbg !2123
  %972 = sext i16 %971 to i32, !dbg !2123
  %973 = and i32 %972, 7, !dbg !2123
  %974 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2124
  %975 = getelementptr inbounds %struct.MV* %974, i32 0, i32 0, !dbg !2124
  %976 = load i16* %975, align 2, !dbg !2124
  %977 = sext i16 %976 to i32, !dbg !2124
  %978 = and i32 %977, 7, !dbg !2124
  %979 = load i8** %z, align 8, !dbg !2125
  %980 = load %struct.block** %2, align 8, !dbg !2126
  %981 = getelementptr inbounds %struct.block* %980, i32 0, i32 11, !dbg !2126
  %982 = load i32* %981, align 4, !dbg !2126
  %983 = call i32 %966(i8* %967, i32 %968, i32 %973, i32 %978, i8* %979, i32 %982, i32* %sse), !dbg !2120
  store i32 %983, i32* %thismse, align 4, !dbg !2127
  br label %1010, !dbg !2128

; <label>:984                                     ; preds = %944
  %985 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2129
  %986 = getelementptr inbounds %struct.MV* %985, i32 0, i32 1, !dbg !2129
  %987 = load i16* %986, align 2, !dbg !2129
  %988 = sext i16 %987 to i32, !dbg !2129
  %989 = sub nsw i32 %988, 8, !dbg !2129
  %990 = or i32 %989, 6, !dbg !2131
  %991 = trunc i32 %990 to i16, !dbg !2131
  %992 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2132
  %993 = getelementptr inbounds %struct.MV* %992, i32 0, i32 1, !dbg !2132
  store i16 %991, i16* %993, align 2, !dbg !2132
  %994 = load %struct.variance_vtable** %7, align 8, !dbg !2133
  %995 = getelementptr inbounds %struct.variance_vtable* %994, i32 0, i32 2, !dbg !2133
  %996 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %995, align 8, !dbg !2133
  %997 = load i8** %y, align 8, !dbg !2134
  %998 = getelementptr inbounds i8* %997, i64 -1, !dbg !2134
  %999 = load i32* %y_stride, align 4, !dbg !2135
  %1000 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2136
  %1001 = getelementptr inbounds %struct.MV* %1000, i32 0, i32 0, !dbg !2136
  %1002 = load i16* %1001, align 2, !dbg !2136
  %1003 = sext i16 %1002 to i32, !dbg !2136
  %1004 = and i32 %1003, 7, !dbg !2136
  %1005 = load i8** %z, align 8, !dbg !2137
  %1006 = load %struct.block** %2, align 8, !dbg !2138
  %1007 = getelementptr inbounds %struct.block* %1006, i32 0, i32 11, !dbg !2138
  %1008 = load i32* %1007, align 4, !dbg !2138
  %1009 = call i32 %996(i8* %998, i32 %999, i32 6, i32 %1004, i8* %1005, i32 %1008, i32* %sse), !dbg !2133
  store i32 %1009, i32* %thismse, align 4, !dbg !2139
  br label %1010

; <label>:1010                                    ; preds = %984, %957
  br label %1044, !dbg !2140

; <label>:1011                                    ; preds = %718
  %1012 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2141
  %1013 = getelementptr inbounds %struct.MV* %1012, i32 0, i32 1, !dbg !2141
  %1014 = load i16* %1013, align 2, !dbg !2141
  %1015 = sext i16 %1014 to i32, !dbg !2141
  %1016 = add nsw i32 %1015, 2, !dbg !2141
  %1017 = trunc i32 %1016 to i16, !dbg !2141
  store i16 %1017, i16* %1013, align 2, !dbg !2141
  %1018 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2142
  %1019 = getelementptr inbounds %struct.MV* %1018, i32 0, i32 0, !dbg !2142
  %1020 = load i16* %1019, align 2, !dbg !2142
  %1021 = sext i16 %1020 to i32, !dbg !2142
  %1022 = add nsw i32 %1021, 2, !dbg !2142
  %1023 = trunc i32 %1022 to i16, !dbg !2142
  store i16 %1023, i16* %1019, align 2, !dbg !2142
  %1024 = load %struct.variance_vtable** %7, align 8, !dbg !2143
  %1025 = getelementptr inbounds %struct.variance_vtable* %1024, i32 0, i32 2, !dbg !2143
  %1026 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1025, align 8, !dbg !2143
  %1027 = load i8** %y, align 8, !dbg !2144
  %1028 = load i32* %y_stride, align 4, !dbg !2145
  %1029 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2146
  %1030 = getelementptr inbounds %struct.MV* %1029, i32 0, i32 1, !dbg !2146
  %1031 = load i16* %1030, align 2, !dbg !2146
  %1032 = sext i16 %1031 to i32, !dbg !2146
  %1033 = and i32 %1032, 7, !dbg !2146
  %1034 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2147
  %1035 = getelementptr inbounds %struct.MV* %1034, i32 0, i32 0, !dbg !2147
  %1036 = load i16* %1035, align 2, !dbg !2147
  %1037 = sext i16 %1036 to i32, !dbg !2147
  %1038 = and i32 %1037, 7, !dbg !2147
  %1039 = load i8** %z, align 8, !dbg !2148
  %1040 = load %struct.block** %2, align 8, !dbg !2149
  %1041 = getelementptr inbounds %struct.block* %1040, i32 0, i32 11, !dbg !2149
  %1042 = load i32* %1041, align 4, !dbg !2149
  %1043 = call i32 %1026(i8* %1027, i32 %1028, i32 %1033, i32 %1038, i8* %1039, i32 %1042, i32* %sse), !dbg !2143
  store i32 %1043, i32* %thismse, align 4, !dbg !2150
  br label %1044, !dbg !2151

; <label>:1044                                    ; preds = %718, %1011, %1010, %943, %873
  %1045 = load i32* %thismse, align 4, !dbg !2152
  %1046 = load %union.int_mv** %5, align 8, !dbg !2153
  %1047 = load i32*** %8, align 8, !dbg !2154
  %1048 = load i32* %6, align 4, !dbg !2155
  %1049 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %1046, i32** %1047, i32 %1048), !dbg !2156
  %1050 = add nsw i32 %1045, %1049, !dbg !2152
  store i32 %1050, i32* %diag, align 4, !dbg !2157
  %1051 = load i32* %diag, align 4, !dbg !2158
  %1052 = load i32* %bestmse, align 4, !dbg !2160
  %1053 = icmp slt i32 %1051, %1052, !dbg !2158
  br i1 %1053, label %1054, label %1063, !dbg !2161

; <label>:1054                                    ; preds = %1044
  %1055 = load %union.int_mv** %4, align 8, !dbg !2162
  %1056 = bitcast %union.int_mv* %1055 to i8*, !dbg !2164
  %1057 = bitcast %union.int_mv* %this_mv to i8*, !dbg !2164
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1056, i8* %1057, i64 4, i32 4, i1 false), !dbg !2164
  %1058 = load i32* %diag, align 4, !dbg !2165
  store i32 %1058, i32* %bestmse, align 4, !dbg !2166
  %1059 = load i32* %thismse, align 4, !dbg !2167
  %1060 = load i32** %9, align 8, !dbg !2168
  store i32 %1059, i32* %1060, align 4, !dbg !2169
  %1061 = load i32* %sse, align 4, !dbg !2170
  %1062 = load i32** %10, align 8, !dbg !2171
  store i32 %1061, i32* %1062, align 4, !dbg !2172
  br label %1063, !dbg !2173

; <label>:1063                                    ; preds = %1054, %1044
  %1064 = load i32* %bestmse, align 4, !dbg !2174
  ret i32 %1064, !dbg !2175
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

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
  call void @llvm.dbg.declare(metadata %struct.macroblock** %1, metadata !2176, metadata !506), !dbg !2177
  store %struct.block* %b, %struct.block** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.block** %2, metadata !2178, metadata !506), !dbg !2179
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.blockd** %3, metadata !2180, metadata !506), !dbg !2181
  store %union.int_mv* %bestmv, %union.int_mv** %4, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %4, metadata !2182, metadata !506), !dbg !2183
  store %union.int_mv* %ref_mv, %union.int_mv** %5, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %5, metadata !2184, metadata !506), !dbg !2185
  store i32 %error_per_bit, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !2186, metadata !506), !dbg !2187
  store %struct.variance_vtable* %vfp, %struct.variance_vtable** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.variance_vtable** %7, metadata !2188, metadata !506), !dbg !2189
  store i32** %mvcost, i32*** %8, align 8
  call void @llvm.dbg.declare(metadata i32*** %8, metadata !2190, metadata !506), !dbg !2191
  store i32* %distortion, i32** %9, align 8
  call void @llvm.dbg.declare(metadata i32** %9, metadata !2192, metadata !506), !dbg !2193
  store i32* %sse1, i32** %10, align 8
  call void @llvm.dbg.declare(metadata i32** %10, metadata !2194, metadata !506), !dbg !2195
  call void @llvm.dbg.declare(metadata i32* %bestmse, metadata !2196, metadata !506), !dbg !2197
  store i32 2147483647, i32* %bestmse, align 4, !dbg !2197
  call void @llvm.dbg.declare(metadata %union.int_mv* %startmv, metadata !2198, metadata !506), !dbg !2199
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !2200, metadata !506), !dbg !2201
  call void @llvm.dbg.declare(metadata i8** %z, metadata !2202, metadata !506), !dbg !2203
  %11 = load %struct.block** %2, align 8, !dbg !2204
  %12 = getelementptr inbounds %struct.block* %11, i32 0, i32 9, !dbg !2204
  %13 = load i8*** %12, align 8, !dbg !2204
  %14 = load i8** %13, align 8, !dbg !2205
  %15 = load %struct.block** %2, align 8, !dbg !2206
  %16 = getelementptr inbounds %struct.block* %15, i32 0, i32 10, !dbg !2206
  %17 = load i32* %16, align 4, !dbg !2206
  %18 = sext i32 %17 to i64, !dbg !2205
  %19 = getelementptr inbounds i8* %14, i64 %18, !dbg !2205
  store i8* %19, i8** %z, align 8, !dbg !2203
  call void @llvm.dbg.declare(metadata i32* %left, metadata !2207, metadata !506), !dbg !2208
  call void @llvm.dbg.declare(metadata i32* %right, metadata !2209, metadata !506), !dbg !2210
  call void @llvm.dbg.declare(metadata i32* %up, metadata !2211, metadata !506), !dbg !2212
  call void @llvm.dbg.declare(metadata i32* %down, metadata !2213, metadata !506), !dbg !2214
  call void @llvm.dbg.declare(metadata i32* %diag, metadata !2215, metadata !506), !dbg !2216
  call void @llvm.dbg.declare(metadata i32* %sse, metadata !2217, metadata !506), !dbg !2218
  call void @llvm.dbg.declare(metadata i32* %whichdir, metadata !2219, metadata !506), !dbg !2220
  call void @llvm.dbg.declare(metadata i32* %thismse, metadata !2221, metadata !506), !dbg !2222
  call void @llvm.dbg.declare(metadata i32* %y_stride, metadata !2223, metadata !506), !dbg !2224
  call void @llvm.dbg.declare(metadata i32* %pre_stride, metadata !2225, metadata !506), !dbg !2226
  %20 = load %struct.macroblock** %1, align 8, !dbg !2227
  %21 = getelementptr inbounds %struct.macroblock* %20, i32 0, i32 7, !dbg !2227
  %22 = getelementptr inbounds %struct.macroblockd* %21, i32 0, i32 11, !dbg !2227
  %23 = getelementptr inbounds %struct.yv12_buffer_config* %22, i32 0, i32 4, !dbg !2227
  %24 = load i32* %23, align 4, !dbg !2227
  store i32 %24, i32* %pre_stride, align 4, !dbg !2226
  call void @llvm.dbg.declare(metadata i8** %base_pre, metadata !2228, metadata !506), !dbg !2229
  %25 = load %struct.macroblock** %1, align 8, !dbg !2230
  %26 = getelementptr inbounds %struct.macroblock* %25, i32 0, i32 7, !dbg !2230
  %27 = getelementptr inbounds %struct.macroblockd* %26, i32 0, i32 11, !dbg !2230
  %28 = getelementptr inbounds %struct.yv12_buffer_config* %27, i32 0, i32 13, !dbg !2230
  %29 = load i8** %28, align 8, !dbg !2230
  store i8* %29, i8** %base_pre, align 8, !dbg !2229
  call void @llvm.dbg.declare(metadata %struct.macroblockd** %xd, metadata !2231, metadata !506), !dbg !2232
  %30 = load %struct.macroblock** %1, align 8, !dbg !2233
  %31 = getelementptr inbounds %struct.macroblock* %30, i32 0, i32 7, !dbg !2234
  store %struct.macroblockd* %31, %struct.macroblockd** %xd, align 8, !dbg !2232
  call void @llvm.dbg.declare(metadata i8** %y_0, metadata !2235, metadata !506), !dbg !2236
  %32 = load i8** %base_pre, align 8, !dbg !2237
  %33 = load %struct.blockd** %3, align 8, !dbg !2238
  %34 = getelementptr inbounds %struct.blockd* %33, i32 0, i32 4, !dbg !2238
  %35 = load i32* %34, align 4, !dbg !2238
  %36 = sext i32 %35 to i64, !dbg !2237
  %37 = getelementptr inbounds i8* %32, i64 %36, !dbg !2237
  %38 = load %union.int_mv** %4, align 8, !dbg !2239
  %39 = bitcast %union.int_mv* %38 to %struct.MV*, !dbg !2239
  %40 = getelementptr inbounds %struct.MV* %39, i32 0, i32 0, !dbg !2239
  %41 = load i16* %40, align 2, !dbg !2239
  %42 = sext i16 %41 to i32, !dbg !2240
  %43 = load i32* %pre_stride, align 4, !dbg !2241
  %44 = mul nsw i32 %42, %43, !dbg !2240
  %45 = sext i32 %44 to i64, !dbg !2237
  %46 = getelementptr inbounds i8* %37, i64 %45, !dbg !2237
  %47 = load %union.int_mv** %4, align 8, !dbg !2242
  %48 = bitcast %union.int_mv* %47 to %struct.MV*, !dbg !2242
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1, !dbg !2242
  %50 = load i16* %49, align 2, !dbg !2242
  %51 = sext i16 %50 to i32, !dbg !2242
  %52 = sext i32 %51 to i64, !dbg !2237
  %53 = getelementptr inbounds i8* %46, i64 %52, !dbg !2237
  store i8* %53, i8** %y_0, align 8, !dbg !2236
  call void @llvm.dbg.declare(metadata i8** %y, metadata !2243, metadata !506), !dbg !2244
  store i32 32, i32* %y_stride, align 4, !dbg !2245
  %54 = load %struct.variance_vtable** %7, align 8, !dbg !2246
  %55 = getelementptr inbounds %struct.variance_vtable* %54, i32 0, i32 9, !dbg !2246
  %56 = load void (i8*, i32, i8*, i32, i32)** %55, align 8, !dbg !2246
  %57 = load i8** %y_0, align 8, !dbg !2247
  %58 = getelementptr inbounds i8* %57, i64 -1, !dbg !2247
  %59 = load i32* %pre_stride, align 4, !dbg !2248
  %60 = sext i32 %59 to i64, !dbg !2247
  %61 = sub i64 0, %60, !dbg !2247
  %62 = getelementptr inbounds i8* %58, i64 %61, !dbg !2247
  %63 = load i32* %pre_stride, align 4, !dbg !2249
  %64 = load %struct.macroblockd** %xd, align 8, !dbg !2250
  %65 = getelementptr inbounds %struct.macroblockd* %64, i32 0, i32 46, !dbg !2250
  %66 = getelementptr inbounds [704 x i8]* %65, i32 0, i32 0, !dbg !2250
  %67 = load i32* %y_stride, align 4, !dbg !2251
  call void %56(i8* %62, i32 %63, i8* %66, i32 %67, i32 18), !dbg !2246
  %68 = load %struct.macroblockd** %xd, align 8, !dbg !2252
  %69 = getelementptr inbounds %struct.macroblockd* %68, i32 0, i32 46, !dbg !2252
  %70 = getelementptr inbounds [704 x i8]* %69, i32 0, i32 0, !dbg !2252
  %71 = load i32* %y_stride, align 4, !dbg !2253
  %72 = sext i32 %71 to i64, !dbg !2252
  %73 = getelementptr inbounds i8* %70, i64 %72, !dbg !2252
  %74 = getelementptr inbounds i8* %73, i64 1, !dbg !2252
  store i8* %74, i8** %y, align 8, !dbg !2254
  %75 = load %union.int_mv** %4, align 8, !dbg !2255
  %76 = bitcast %union.int_mv* %75 to %struct.MV*, !dbg !2255
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0, !dbg !2255
  %78 = load i16* %77, align 2, !dbg !2255
  %79 = sext i16 %78 to i32, !dbg !2255
  %80 = mul nsw i32 %79, 8, !dbg !2255
  %81 = trunc i32 %80 to i16, !dbg !2255
  store i16 %81, i16* %77, align 2, !dbg !2255
  %82 = load %union.int_mv** %4, align 8, !dbg !2256
  %83 = bitcast %union.int_mv* %82 to %struct.MV*, !dbg !2256
  %84 = getelementptr inbounds %struct.MV* %83, i32 0, i32 1, !dbg !2256
  %85 = load i16* %84, align 2, !dbg !2256
  %86 = sext i16 %85 to i32, !dbg !2256
  %87 = mul nsw i32 %86, 8, !dbg !2256
  %88 = trunc i32 %87 to i16, !dbg !2256
  store i16 %88, i16* %84, align 2, !dbg !2256
  %89 = load %union.int_mv** %4, align 8, !dbg !2257
  %90 = bitcast %union.int_mv* %startmv to i8*, !dbg !2258
  %91 = bitcast %union.int_mv* %89 to i8*, !dbg !2258
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %90, i8* %91, i64 4, i32 4, i1 false), !dbg !2258
  %92 = load %struct.variance_vtable** %7, align 8, !dbg !2259
  %93 = getelementptr inbounds %struct.variance_vtable* %92, i32 0, i32 1, !dbg !2259
  %94 = load i32 (i8*, i32, i8*, i32, i32*)** %93, align 8, !dbg !2259
  %95 = load i8** %y, align 8, !dbg !2260
  %96 = load i32* %y_stride, align 4, !dbg !2261
  %97 = load i8** %z, align 8, !dbg !2262
  %98 = load %struct.block** %2, align 8, !dbg !2263
  %99 = getelementptr inbounds %struct.block* %98, i32 0, i32 11, !dbg !2263
  %100 = load i32* %99, align 4, !dbg !2263
  %101 = load i32** %10, align 8, !dbg !2264
  %102 = call i32 %94(i8* %95, i32 %96, i8* %97, i32 %100, i32* %101), !dbg !2259
  store i32 %102, i32* %bestmse, align 4, !dbg !2265
  %103 = load i32* %bestmse, align 4, !dbg !2266
  %104 = load i32** %9, align 8, !dbg !2267
  store i32 %103, i32* %104, align 4, !dbg !2268
  %105 = load %union.int_mv** %4, align 8, !dbg !2269
  %106 = load %union.int_mv** %5, align 8, !dbg !2270
  %107 = load i32*** %8, align 8, !dbg !2271
  %108 = load i32* %6, align 4, !dbg !2272
  %109 = call i32 @mv_err_cost(%union.int_mv* %105, %union.int_mv* %106, i32** %107, i32 %108), !dbg !2273
  %110 = load i32* %bestmse, align 4, !dbg !2274
  %111 = add nsw i32 %110, %109, !dbg !2274
  store i32 %111, i32* %bestmse, align 4, !dbg !2274
  %112 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2275
  %113 = getelementptr inbounds %struct.MV* %112, i32 0, i32 0, !dbg !2275
  %114 = load i16* %113, align 2, !dbg !2275
  %115 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2276
  %116 = getelementptr inbounds %struct.MV* %115, i32 0, i32 0, !dbg !2276
  store i16 %114, i16* %116, align 2, !dbg !2276
  %117 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2277
  %118 = getelementptr inbounds %struct.MV* %117, i32 0, i32 1, !dbg !2277
  %119 = load i16* %118, align 2, !dbg !2277
  %120 = sext i16 %119 to i32, !dbg !2277
  %121 = sub nsw i32 %120, 8, !dbg !2277
  %122 = or i32 %121, 4, !dbg !2278
  %123 = trunc i32 %122 to i16, !dbg !2279
  %124 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2280
  %125 = getelementptr inbounds %struct.MV* %124, i32 0, i32 1, !dbg !2280
  store i16 %123, i16* %125, align 2, !dbg !2280
  %126 = load %struct.variance_vtable** %7, align 8, !dbg !2281
  %127 = getelementptr inbounds %struct.variance_vtable* %126, i32 0, i32 3, !dbg !2281
  %128 = load i32 (i8*, i32, i8*, i32, i32*)** %127, align 8, !dbg !2281
  %129 = load i8** %y, align 8, !dbg !2282
  %130 = getelementptr inbounds i8* %129, i64 -1, !dbg !2282
  %131 = load i32* %y_stride, align 4, !dbg !2283
  %132 = load i8** %z, align 8, !dbg !2284
  %133 = load %struct.block** %2, align 8, !dbg !2285
  %134 = getelementptr inbounds %struct.block* %133, i32 0, i32 11, !dbg !2285
  %135 = load i32* %134, align 4, !dbg !2285
  %136 = call i32 %128(i8* %130, i32 %131, i8* %132, i32 %135, i32* %sse), !dbg !2281
  store i32 %136, i32* %thismse, align 4, !dbg !2286
  %137 = load i32* %thismse, align 4, !dbg !2287
  %138 = load %union.int_mv** %5, align 8, !dbg !2288
  %139 = load i32*** %8, align 8, !dbg !2289
  %140 = load i32* %6, align 4, !dbg !2290
  %141 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %138, i32** %139, i32 %140), !dbg !2291
  %142 = add nsw i32 %137, %141, !dbg !2287
  store i32 %142, i32* %left, align 4, !dbg !2292
  %143 = load i32* %left, align 4, !dbg !2293
  %144 = load i32* %bestmse, align 4, !dbg !2295
  %145 = icmp slt i32 %143, %144, !dbg !2293
  br i1 %145, label %146, label %155, !dbg !2296

; <label>:146                                     ; preds = %0
  %147 = load %union.int_mv** %4, align 8, !dbg !2297
  %148 = bitcast %union.int_mv* %147 to i8*, !dbg !2299
  %149 = bitcast %union.int_mv* %this_mv to i8*, !dbg !2299
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %148, i8* %149, i64 4, i32 4, i1 false), !dbg !2299
  %150 = load i32* %left, align 4, !dbg !2300
  store i32 %150, i32* %bestmse, align 4, !dbg !2301
  %151 = load i32* %thismse, align 4, !dbg !2302
  %152 = load i32** %9, align 8, !dbg !2303
  store i32 %151, i32* %152, align 4, !dbg !2304
  %153 = load i32* %sse, align 4, !dbg !2305
  %154 = load i32** %10, align 8, !dbg !2306
  store i32 %153, i32* %154, align 4, !dbg !2307
  br label %155, !dbg !2308

; <label>:155                                     ; preds = %146, %0
  %156 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2309
  %157 = getelementptr inbounds %struct.MV* %156, i32 0, i32 1, !dbg !2309
  %158 = load i16* %157, align 2, !dbg !2309
  %159 = sext i16 %158 to i32, !dbg !2309
  %160 = add nsw i32 %159, 8, !dbg !2309
  %161 = trunc i32 %160 to i16, !dbg !2309
  store i16 %161, i16* %157, align 2, !dbg !2309
  %162 = load %struct.variance_vtable** %7, align 8, !dbg !2310
  %163 = getelementptr inbounds %struct.variance_vtable* %162, i32 0, i32 3, !dbg !2310
  %164 = load i32 (i8*, i32, i8*, i32, i32*)** %163, align 8, !dbg !2310
  %165 = load i8** %y, align 8, !dbg !2311
  %166 = load i32* %y_stride, align 4, !dbg !2312
  %167 = load i8** %z, align 8, !dbg !2313
  %168 = load %struct.block** %2, align 8, !dbg !2314
  %169 = getelementptr inbounds %struct.block* %168, i32 0, i32 11, !dbg !2314
  %170 = load i32* %169, align 4, !dbg !2314
  %171 = call i32 %164(i8* %165, i32 %166, i8* %167, i32 %170, i32* %sse), !dbg !2310
  store i32 %171, i32* %thismse, align 4, !dbg !2315
  %172 = load i32* %thismse, align 4, !dbg !2316
  %173 = load %union.int_mv** %5, align 8, !dbg !2317
  %174 = load i32*** %8, align 8, !dbg !2318
  %175 = load i32* %6, align 4, !dbg !2319
  %176 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %173, i32** %174, i32 %175), !dbg !2320
  %177 = add nsw i32 %172, %176, !dbg !2316
  store i32 %177, i32* %right, align 4, !dbg !2321
  %178 = load i32* %right, align 4, !dbg !2322
  %179 = load i32* %bestmse, align 4, !dbg !2324
  %180 = icmp slt i32 %178, %179, !dbg !2322
  br i1 %180, label %181, label %190, !dbg !2325

; <label>:181                                     ; preds = %155
  %182 = load %union.int_mv** %4, align 8, !dbg !2326
  %183 = bitcast %union.int_mv* %182 to i8*, !dbg !2328
  %184 = bitcast %union.int_mv* %this_mv to i8*, !dbg !2328
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %183, i8* %184, i64 4, i32 4, i1 false), !dbg !2328
  %185 = load i32* %right, align 4, !dbg !2329
  store i32 %185, i32* %bestmse, align 4, !dbg !2330
  %186 = load i32* %thismse, align 4, !dbg !2331
  %187 = load i32** %9, align 8, !dbg !2332
  store i32 %186, i32* %187, align 4, !dbg !2333
  %188 = load i32* %sse, align 4, !dbg !2334
  %189 = load i32** %10, align 8, !dbg !2335
  store i32 %188, i32* %189, align 4, !dbg !2336
  br label %190, !dbg !2337

; <label>:190                                     ; preds = %181, %155
  %191 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2338
  %192 = getelementptr inbounds %struct.MV* %191, i32 0, i32 1, !dbg !2338
  %193 = load i16* %192, align 2, !dbg !2338
  %194 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2339
  %195 = getelementptr inbounds %struct.MV* %194, i32 0, i32 1, !dbg !2339
  store i16 %193, i16* %195, align 2, !dbg !2339
  %196 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !2340
  %197 = getelementptr inbounds %struct.MV* %196, i32 0, i32 0, !dbg !2340
  %198 = load i16* %197, align 2, !dbg !2340
  %199 = sext i16 %198 to i32, !dbg !2340
  %200 = sub nsw i32 %199, 8, !dbg !2340
  %201 = or i32 %200, 4, !dbg !2341
  %202 = trunc i32 %201 to i16, !dbg !2342
  %203 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2343
  %204 = getelementptr inbounds %struct.MV* %203, i32 0, i32 0, !dbg !2343
  store i16 %202, i16* %204, align 2, !dbg !2343
  %205 = load %struct.variance_vtable** %7, align 8, !dbg !2344
  %206 = getelementptr inbounds %struct.variance_vtable* %205, i32 0, i32 4, !dbg !2344
  %207 = load i32 (i8*, i32, i8*, i32, i32*)** %206, align 8, !dbg !2344
  %208 = load i8** %y, align 8, !dbg !2345
  %209 = load i32* %y_stride, align 4, !dbg !2346
  %210 = sext i32 %209 to i64, !dbg !2345
  %211 = sub i64 0, %210, !dbg !2345
  %212 = getelementptr inbounds i8* %208, i64 %211, !dbg !2345
  %213 = load i32* %y_stride, align 4, !dbg !2347
  %214 = load i8** %z, align 8, !dbg !2348
  %215 = load %struct.block** %2, align 8, !dbg !2349
  %216 = getelementptr inbounds %struct.block* %215, i32 0, i32 11, !dbg !2349
  %217 = load i32* %216, align 4, !dbg !2349
  %218 = call i32 %207(i8* %212, i32 %213, i8* %214, i32 %217, i32* %sse), !dbg !2344
  store i32 %218, i32* %thismse, align 4, !dbg !2350
  %219 = load i32* %thismse, align 4, !dbg !2351
  %220 = load %union.int_mv** %5, align 8, !dbg !2352
  %221 = load i32*** %8, align 8, !dbg !2353
  %222 = load i32* %6, align 4, !dbg !2354
  %223 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %220, i32** %221, i32 %222), !dbg !2355
  %224 = add nsw i32 %219, %223, !dbg !2351
  store i32 %224, i32* %up, align 4, !dbg !2356
  %225 = load i32* %up, align 4, !dbg !2357
  %226 = load i32* %bestmse, align 4, !dbg !2359
  %227 = icmp slt i32 %225, %226, !dbg !2357
  br i1 %227, label %228, label %237, !dbg !2360

; <label>:228                                     ; preds = %190
  %229 = load %union.int_mv** %4, align 8, !dbg !2361
  %230 = bitcast %union.int_mv* %229 to i8*, !dbg !2363
  %231 = bitcast %union.int_mv* %this_mv to i8*, !dbg !2363
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %230, i8* %231, i64 4, i32 4, i1 false), !dbg !2363
  %232 = load i32* %up, align 4, !dbg !2364
  store i32 %232, i32* %bestmse, align 4, !dbg !2365
  %233 = load i32* %thismse, align 4, !dbg !2366
  %234 = load i32** %9, align 8, !dbg !2367
  store i32 %233, i32* %234, align 4, !dbg !2368
  %235 = load i32* %sse, align 4, !dbg !2369
  %236 = load i32** %10, align 8, !dbg !2370
  store i32 %235, i32* %236, align 4, !dbg !2371
  br label %237, !dbg !2372

; <label>:237                                     ; preds = %228, %190
  %238 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2373
  %239 = getelementptr inbounds %struct.MV* %238, i32 0, i32 0, !dbg !2373
  %240 = load i16* %239, align 2, !dbg !2373
  %241 = sext i16 %240 to i32, !dbg !2373
  %242 = add nsw i32 %241, 8, !dbg !2373
  %243 = trunc i32 %242 to i16, !dbg !2373
  store i16 %243, i16* %239, align 2, !dbg !2373
  %244 = load %struct.variance_vtable** %7, align 8, !dbg !2374
  %245 = getelementptr inbounds %struct.variance_vtable* %244, i32 0, i32 4, !dbg !2374
  %246 = load i32 (i8*, i32, i8*, i32, i32*)** %245, align 8, !dbg !2374
  %247 = load i8** %y, align 8, !dbg !2375
  %248 = load i32* %y_stride, align 4, !dbg !2376
  %249 = load i8** %z, align 8, !dbg !2377
  %250 = load %struct.block** %2, align 8, !dbg !2378
  %251 = getelementptr inbounds %struct.block* %250, i32 0, i32 11, !dbg !2378
  %252 = load i32* %251, align 4, !dbg !2378
  %253 = call i32 %246(i8* %247, i32 %248, i8* %249, i32 %252, i32* %sse), !dbg !2374
  store i32 %253, i32* %thismse, align 4, !dbg !2379
  %254 = load i32* %thismse, align 4, !dbg !2380
  %255 = load %union.int_mv** %5, align 8, !dbg !2381
  %256 = load i32*** %8, align 8, !dbg !2382
  %257 = load i32* %6, align 4, !dbg !2383
  %258 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %255, i32** %256, i32 %257), !dbg !2384
  %259 = add nsw i32 %254, %258, !dbg !2380
  store i32 %259, i32* %down, align 4, !dbg !2385
  %260 = load i32* %down, align 4, !dbg !2386
  %261 = load i32* %bestmse, align 4, !dbg !2388
  %262 = icmp slt i32 %260, %261, !dbg !2386
  br i1 %262, label %263, label %272, !dbg !2389

; <label>:263                                     ; preds = %237
  %264 = load %union.int_mv** %4, align 8, !dbg !2390
  %265 = bitcast %union.int_mv* %264 to i8*, !dbg !2392
  %266 = bitcast %union.int_mv* %this_mv to i8*, !dbg !2392
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %265, i8* %266, i64 4, i32 4, i1 false), !dbg !2392
  %267 = load i32* %down, align 4, !dbg !2393
  store i32 %267, i32* %bestmse, align 4, !dbg !2394
  %268 = load i32* %thismse, align 4, !dbg !2395
  %269 = load i32** %9, align 8, !dbg !2396
  store i32 %268, i32* %269, align 4, !dbg !2397
  %270 = load i32* %sse, align 4, !dbg !2398
  %271 = load i32** %10, align 8, !dbg !2399
  store i32 %270, i32* %271, align 4, !dbg !2400
  br label %272, !dbg !2401

; <label>:272                                     ; preds = %263, %237
  %273 = load i32* %left, align 4, !dbg !2402
  %274 = load i32* %right, align 4, !dbg !2403
  %275 = icmp slt i32 %273, %274, !dbg !2402
  %276 = select i1 %275, i32 0, i32 1, !dbg !2402
  %277 = load i32* %up, align 4, !dbg !2404
  %278 = load i32* %down, align 4, !dbg !2405
  %279 = icmp slt i32 %277, %278, !dbg !2404
  %280 = select i1 %279, i32 0, i32 2, !dbg !2404
  %281 = add nsw i32 %276, %280, !dbg !2406
  store i32 %281, i32* %whichdir, align 4, !dbg !2407
  %282 = bitcast %union.int_mv* %this_mv to i8*, !dbg !2408
  %283 = bitcast %union.int_mv* %startmv to i8*, !dbg !2408
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %282, i8* %283, i64 4, i32 4, i1 false), !dbg !2408
  %284 = load i32* %whichdir, align 4, !dbg !2409
  switch i32 %284, label %377 [
    i32 0, label %285
    i32 1, label %319
    i32 2, label %349
    i32 3, label %376
  ], !dbg !2410

; <label>:285                                     ; preds = %272
  %286 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2411
  %287 = getelementptr inbounds %struct.MV* %286, i32 0, i32 1, !dbg !2411
  %288 = load i16* %287, align 2, !dbg !2411
  %289 = sext i16 %288 to i32, !dbg !2411
  %290 = sub nsw i32 %289, 8, !dbg !2411
  %291 = or i32 %290, 4, !dbg !2413
  %292 = trunc i32 %291 to i16, !dbg !2413
  %293 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2414
  %294 = getelementptr inbounds %struct.MV* %293, i32 0, i32 1, !dbg !2414
  store i16 %292, i16* %294, align 2, !dbg !2414
  %295 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2415
  %296 = getelementptr inbounds %struct.MV* %295, i32 0, i32 0, !dbg !2415
  %297 = load i16* %296, align 2, !dbg !2415
  %298 = sext i16 %297 to i32, !dbg !2415
  %299 = sub nsw i32 %298, 8, !dbg !2415
  %300 = or i32 %299, 4, !dbg !2416
  %301 = trunc i32 %300 to i16, !dbg !2416
  %302 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2417
  %303 = getelementptr inbounds %struct.MV* %302, i32 0, i32 0, !dbg !2417
  store i16 %301, i16* %303, align 2, !dbg !2417
  %304 = load %struct.variance_vtable** %7, align 8, !dbg !2418
  %305 = getelementptr inbounds %struct.variance_vtable* %304, i32 0, i32 5, !dbg !2418
  %306 = load i32 (i8*, i32, i8*, i32, i32*)** %305, align 8, !dbg !2418
  %307 = load i8** %y, align 8, !dbg !2419
  %308 = getelementptr inbounds i8* %307, i64 -1, !dbg !2419
  %309 = load i32* %y_stride, align 4, !dbg !2420
  %310 = sext i32 %309 to i64, !dbg !2419
  %311 = sub i64 0, %310, !dbg !2419
  %312 = getelementptr inbounds i8* %308, i64 %311, !dbg !2419
  %313 = load i32* %y_stride, align 4, !dbg !2421
  %314 = load i8** %z, align 8, !dbg !2422
  %315 = load %struct.block** %2, align 8, !dbg !2423
  %316 = getelementptr inbounds %struct.block* %315, i32 0, i32 11, !dbg !2423
  %317 = load i32* %316, align 4, !dbg !2423
  %318 = call i32 %306(i8* %312, i32 %313, i8* %314, i32 %317, i32* %sse), !dbg !2418
  store i32 %318, i32* %thismse, align 4, !dbg !2424
  br label %400, !dbg !2425

; <label>:319                                     ; preds = %272
  %320 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2426
  %321 = getelementptr inbounds %struct.MV* %320, i32 0, i32 1, !dbg !2426
  %322 = load i16* %321, align 2, !dbg !2426
  %323 = sext i16 %322 to i32, !dbg !2426
  %324 = add nsw i32 %323, 4, !dbg !2426
  %325 = trunc i32 %324 to i16, !dbg !2426
  store i16 %325, i16* %321, align 2, !dbg !2426
  %326 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2427
  %327 = getelementptr inbounds %struct.MV* %326, i32 0, i32 0, !dbg !2427
  %328 = load i16* %327, align 2, !dbg !2427
  %329 = sext i16 %328 to i32, !dbg !2427
  %330 = sub nsw i32 %329, 8, !dbg !2427
  %331 = or i32 %330, 4, !dbg !2428
  %332 = trunc i32 %331 to i16, !dbg !2428
  %333 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2429
  %334 = getelementptr inbounds %struct.MV* %333, i32 0, i32 0, !dbg !2429
  store i16 %332, i16* %334, align 2, !dbg !2429
  %335 = load %struct.variance_vtable** %7, align 8, !dbg !2430
  %336 = getelementptr inbounds %struct.variance_vtable* %335, i32 0, i32 5, !dbg !2430
  %337 = load i32 (i8*, i32, i8*, i32, i32*)** %336, align 8, !dbg !2430
  %338 = load i8** %y, align 8, !dbg !2431
  %339 = load i32* %y_stride, align 4, !dbg !2432
  %340 = sext i32 %339 to i64, !dbg !2431
  %341 = sub i64 0, %340, !dbg !2431
  %342 = getelementptr inbounds i8* %338, i64 %341, !dbg !2431
  %343 = load i32* %y_stride, align 4, !dbg !2433
  %344 = load i8** %z, align 8, !dbg !2434
  %345 = load %struct.block** %2, align 8, !dbg !2435
  %346 = getelementptr inbounds %struct.block* %345, i32 0, i32 11, !dbg !2435
  %347 = load i32* %346, align 4, !dbg !2435
  %348 = call i32 %337(i8* %342, i32 %343, i8* %344, i32 %347, i32* %sse), !dbg !2430
  store i32 %348, i32* %thismse, align 4, !dbg !2436
  br label %400, !dbg !2437

; <label>:349                                     ; preds = %272
  %350 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2438
  %351 = getelementptr inbounds %struct.MV* %350, i32 0, i32 1, !dbg !2438
  %352 = load i16* %351, align 2, !dbg !2438
  %353 = sext i16 %352 to i32, !dbg !2438
  %354 = sub nsw i32 %353, 8, !dbg !2438
  %355 = or i32 %354, 4, !dbg !2439
  %356 = trunc i32 %355 to i16, !dbg !2439
  %357 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2440
  %358 = getelementptr inbounds %struct.MV* %357, i32 0, i32 1, !dbg !2440
  store i16 %356, i16* %358, align 2, !dbg !2440
  %359 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2441
  %360 = getelementptr inbounds %struct.MV* %359, i32 0, i32 0, !dbg !2441
  %361 = load i16* %360, align 2, !dbg !2441
  %362 = sext i16 %361 to i32, !dbg !2441
  %363 = add nsw i32 %362, 4, !dbg !2441
  %364 = trunc i32 %363 to i16, !dbg !2441
  store i16 %364, i16* %360, align 2, !dbg !2441
  %365 = load %struct.variance_vtable** %7, align 8, !dbg !2442
  %366 = getelementptr inbounds %struct.variance_vtable* %365, i32 0, i32 5, !dbg !2442
  %367 = load i32 (i8*, i32, i8*, i32, i32*)** %366, align 8, !dbg !2442
  %368 = load i8** %y, align 8, !dbg !2443
  %369 = getelementptr inbounds i8* %368, i64 -1, !dbg !2443
  %370 = load i32* %y_stride, align 4, !dbg !2444
  %371 = load i8** %z, align 8, !dbg !2445
  %372 = load %struct.block** %2, align 8, !dbg !2446
  %373 = getelementptr inbounds %struct.block* %372, i32 0, i32 11, !dbg !2446
  %374 = load i32* %373, align 4, !dbg !2446
  %375 = call i32 %367(i8* %369, i32 %370, i8* %371, i32 %374, i32* %sse), !dbg !2442
  store i32 %375, i32* %thismse, align 4, !dbg !2447
  br label %400, !dbg !2448

; <label>:376                                     ; preds = %272
  br label %377, !dbg !2448

; <label>:377                                     ; preds = %272, %376
  %378 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2449
  %379 = getelementptr inbounds %struct.MV* %378, i32 0, i32 1, !dbg !2449
  %380 = load i16* %379, align 2, !dbg !2449
  %381 = sext i16 %380 to i32, !dbg !2449
  %382 = add nsw i32 %381, 4, !dbg !2449
  %383 = trunc i32 %382 to i16, !dbg !2449
  store i16 %383, i16* %379, align 2, !dbg !2449
  %384 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2450
  %385 = getelementptr inbounds %struct.MV* %384, i32 0, i32 0, !dbg !2450
  %386 = load i16* %385, align 2, !dbg !2450
  %387 = sext i16 %386 to i32, !dbg !2450
  %388 = add nsw i32 %387, 4, !dbg !2450
  %389 = trunc i32 %388 to i16, !dbg !2450
  store i16 %389, i16* %385, align 2, !dbg !2450
  %390 = load %struct.variance_vtable** %7, align 8, !dbg !2451
  %391 = getelementptr inbounds %struct.variance_vtable* %390, i32 0, i32 5, !dbg !2451
  %392 = load i32 (i8*, i32, i8*, i32, i32*)** %391, align 8, !dbg !2451
  %393 = load i8** %y, align 8, !dbg !2452
  %394 = load i32* %y_stride, align 4, !dbg !2453
  %395 = load i8** %z, align 8, !dbg !2454
  %396 = load %struct.block** %2, align 8, !dbg !2455
  %397 = getelementptr inbounds %struct.block* %396, i32 0, i32 11, !dbg !2455
  %398 = load i32* %397, align 4, !dbg !2455
  %399 = call i32 %392(i8* %393, i32 %394, i8* %395, i32 %398, i32* %sse), !dbg !2451
  store i32 %399, i32* %thismse, align 4, !dbg !2456
  br label %400, !dbg !2457

; <label>:400                                     ; preds = %377, %349, %319, %285
  %401 = load i32* %thismse, align 4, !dbg !2458
  %402 = load %union.int_mv** %5, align 8, !dbg !2459
  %403 = load i32*** %8, align 8, !dbg !2460
  %404 = load i32* %6, align 4, !dbg !2461
  %405 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %402, i32** %403, i32 %404), !dbg !2462
  %406 = add nsw i32 %401, %405, !dbg !2458
  store i32 %406, i32* %diag, align 4, !dbg !2463
  %407 = load i32* %diag, align 4, !dbg !2464
  %408 = load i32* %bestmse, align 4, !dbg !2466
  %409 = icmp slt i32 %407, %408, !dbg !2464
  br i1 %409, label %410, label %419, !dbg !2467

; <label>:410                                     ; preds = %400
  %411 = load %union.int_mv** %4, align 8, !dbg !2468
  %412 = bitcast %union.int_mv* %411 to i8*, !dbg !2470
  %413 = bitcast %union.int_mv* %this_mv to i8*, !dbg !2470
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %412, i8* %413, i64 4, i32 4, i1 false), !dbg !2470
  %414 = load i32* %diag, align 4, !dbg !2471
  store i32 %414, i32* %bestmse, align 4, !dbg !2472
  %415 = load i32* %thismse, align 4, !dbg !2473
  %416 = load i32** %9, align 8, !dbg !2474
  store i32 %415, i32* %416, align 4, !dbg !2475
  %417 = load i32* %sse, align 4, !dbg !2476
  %418 = load i32** %10, align 8, !dbg !2477
  store i32 %417, i32* %418, align 4, !dbg !2478
  br label %419, !dbg !2479

; <label>:419                                     ; preds = %410, %400
  %420 = load i32* %bestmse, align 4, !dbg !2480
  ret i32 %420, !dbg !2481
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
  call void @llvm.dbg.declare(metadata %struct.macroblock** %1, metadata !2482, metadata !506), !dbg !2483
  store %struct.block* %b, %struct.block** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.block** %2, metadata !2484, metadata !506), !dbg !2485
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.blockd** %3, metadata !2486, metadata !506), !dbg !2487
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %4, metadata !2488, metadata !506), !dbg !2489
  store %union.int_mv* %best_mv, %union.int_mv** %5, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %5, metadata !2490, metadata !506), !dbg !2491
  store i32 %search_param, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !2492, metadata !506), !dbg !2493
  store i32 %sad_per_bit, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !2494, metadata !506), !dbg !2495
  store %struct.variance_vtable* %vfp, %struct.variance_vtable** %8, align 8
  call void @llvm.dbg.declare(metadata %struct.variance_vtable** %8, metadata !2496, metadata !506), !dbg !2497
  store i32** %mvsadcost, i32*** %9, align 8
  call void @llvm.dbg.declare(metadata i32*** %9, metadata !2498, metadata !506), !dbg !2499
  store i32** %mvcost, i32*** %10, align 8
  call void @llvm.dbg.declare(metadata i32*** %10, metadata !2500, metadata !506), !dbg !2501
  store %union.int_mv* %center_mv, %union.int_mv** %11, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %11, metadata !2502, metadata !506), !dbg !2503
  call void @llvm.dbg.declare(metadata [6 x %struct.MV]* %hex, metadata !2504, metadata !506), !dbg !2507
  %12 = bitcast [6 x %struct.MV]* %hex to i8*, !dbg !2507
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* bitcast ([6 x %struct.MV]* @vp8_hex_search.hex to i8*), i64 24, i32 16, i1 false), !dbg !2507
  call void @llvm.dbg.declare(metadata [4 x %struct.MV]* %neighbors, metadata !2508, metadata !506), !dbg !2510
  %13 = bitcast [4 x %struct.MV]* %neighbors to i8*, !dbg !2510
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* bitcast ([4 x %struct.MV]* @vp8_hex_search.neighbors to i8*), i64 16, i32 16, i1 false), !dbg !2510
  call void @llvm.dbg.declare(metadata i32* %i, metadata !2511, metadata !506), !dbg !2512
  call void @llvm.dbg.declare(metadata i32* %j, metadata !2513, metadata !506), !dbg !2514
  call void @llvm.dbg.declare(metadata i8** %what, metadata !2515, metadata !506), !dbg !2516
  %14 = load %struct.block** %2, align 8, !dbg !2517
  %15 = getelementptr inbounds %struct.block* %14, i32 0, i32 9, !dbg !2517
  %16 = load i8*** %15, align 8, !dbg !2517
  %17 = load i8** %16, align 8, !dbg !2518
  %18 = load %struct.block** %2, align 8, !dbg !2519
  %19 = getelementptr inbounds %struct.block* %18, i32 0, i32 10, !dbg !2519
  %20 = load i32* %19, align 4, !dbg !2519
  %21 = sext i32 %20 to i64, !dbg !2518
  %22 = getelementptr inbounds i8* %17, i64 %21, !dbg !2518
  store i8* %22, i8** %what, align 8, !dbg !2516
  call void @llvm.dbg.declare(metadata i32* %what_stride, metadata !2520, metadata !506), !dbg !2521
  %23 = load %struct.block** %2, align 8, !dbg !2522
  %24 = getelementptr inbounds %struct.block* %23, i32 0, i32 11, !dbg !2522
  %25 = load i32* %24, align 4, !dbg !2522
  store i32 %25, i32* %what_stride, align 4, !dbg !2521
  call void @llvm.dbg.declare(metadata i32* %pre_stride, metadata !2523, metadata !506), !dbg !2524
  %26 = load %struct.macroblock** %1, align 8, !dbg !2525
  %27 = getelementptr inbounds %struct.macroblock* %26, i32 0, i32 7, !dbg !2525
  %28 = getelementptr inbounds %struct.macroblockd* %27, i32 0, i32 11, !dbg !2525
  %29 = getelementptr inbounds %struct.yv12_buffer_config* %28, i32 0, i32 4, !dbg !2525
  %30 = load i32* %29, align 4, !dbg !2525
  store i32 %30, i32* %pre_stride, align 4, !dbg !2524
  call void @llvm.dbg.declare(metadata i8** %base_pre, metadata !2526, metadata !506), !dbg !2527
  %31 = load %struct.macroblock** %1, align 8, !dbg !2528
  %32 = getelementptr inbounds %struct.macroblock* %31, i32 0, i32 7, !dbg !2528
  %33 = getelementptr inbounds %struct.macroblockd* %32, i32 0, i32 11, !dbg !2528
  %34 = getelementptr inbounds %struct.yv12_buffer_config* %33, i32 0, i32 13, !dbg !2528
  %35 = load i8** %34, align 8, !dbg !2528
  store i8* %35, i8** %base_pre, align 8, !dbg !2527
  call void @llvm.dbg.declare(metadata i32* %in_what_stride, metadata !2529, metadata !506), !dbg !2530
  %36 = load i32* %pre_stride, align 4, !dbg !2531
  store i32 %36, i32* %in_what_stride, align 4, !dbg !2530
  call void @llvm.dbg.declare(metadata i32* %br, metadata !2532, metadata !506), !dbg !2533
  call void @llvm.dbg.declare(metadata i32* %bc, metadata !2534, metadata !506), !dbg !2535
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !2536, metadata !506), !dbg !2537
  call void @llvm.dbg.declare(metadata i32* %bestsad, metadata !2538, metadata !506), !dbg !2539
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !2540, metadata !506), !dbg !2541
  call void @llvm.dbg.declare(metadata i8** %base_offset, metadata !2542, metadata !506), !dbg !2543
  call void @llvm.dbg.declare(metadata i8** %this_offset, metadata !2544, metadata !506), !dbg !2545
  call void @llvm.dbg.declare(metadata i32* %k, metadata !2546, metadata !506), !dbg !2547
  store i32 -1, i32* %k, align 4, !dbg !2547
  call void @llvm.dbg.declare(metadata i32* %all_in, metadata !2548, metadata !506), !dbg !2549
  call void @llvm.dbg.declare(metadata i32* %best_site, metadata !2550, metadata !506), !dbg !2551
  store i32 -1, i32* %best_site, align 4, !dbg !2551
  call void @llvm.dbg.declare(metadata i32* %hex_range, metadata !2552, metadata !506), !dbg !2553
  store i32 127, i32* %hex_range, align 4, !dbg !2553
  call void @llvm.dbg.declare(metadata i32* %dia_range, metadata !2554, metadata !506), !dbg !2555
  store i32 8, i32* %dia_range, align 4, !dbg !2555
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !2556, metadata !506), !dbg !2557
  %37 = load %union.int_mv** %11, align 8, !dbg !2558
  %38 = bitcast %union.int_mv* %37 to %struct.MV*, !dbg !2558
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 0, !dbg !2558
  %40 = load i16* %39, align 2, !dbg !2558
  %41 = sext i16 %40 to i32, !dbg !2558
  %42 = ashr i32 %41, 3, !dbg !2558
  %43 = trunc i32 %42 to i16, !dbg !2558
  %44 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !2559
  %45 = getelementptr inbounds %struct.MV* %44, i32 0, i32 0, !dbg !2559
  store i16 %43, i16* %45, align 2, !dbg !2559
  %46 = load %union.int_mv** %11, align 8, !dbg !2560
  %47 = bitcast %union.int_mv* %46 to %struct.MV*, !dbg !2560
  %48 = getelementptr inbounds %struct.MV* %47, i32 0, i32 1, !dbg !2560
  %49 = load i16* %48, align 2, !dbg !2560
  %50 = sext i16 %49 to i32, !dbg !2560
  %51 = ashr i32 %50, 3, !dbg !2560
  %52 = trunc i32 %51 to i16, !dbg !2560
  %53 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !2561
  %54 = getelementptr inbounds %struct.MV* %53, i32 0, i32 1, !dbg !2561
  store i16 %52, i16* %54, align 2, !dbg !2561
  %55 = load %union.int_mv** %4, align 8, !dbg !2562
  %56 = load %struct.macroblock** %1, align 8, !dbg !2563
  %57 = getelementptr inbounds %struct.macroblock* %56, i32 0, i32 31, !dbg !2563
  %58 = load i32* %57, align 4, !dbg !2563
  %59 = load %struct.macroblock** %1, align 8, !dbg !2564
  %60 = getelementptr inbounds %struct.macroblock* %59, i32 0, i32 32, !dbg !2564
  %61 = load i32* %60, align 4, !dbg !2564
  %62 = load %struct.macroblock** %1, align 8, !dbg !2565
  %63 = getelementptr inbounds %struct.macroblock* %62, i32 0, i32 33, !dbg !2565
  %64 = load i32* %63, align 4, !dbg !2565
  %65 = load %struct.macroblock** %1, align 8, !dbg !2566
  %66 = getelementptr inbounds %struct.macroblock* %65, i32 0, i32 34, !dbg !2566
  %67 = load i32* %66, align 4, !dbg !2566
  call void @vp8_clamp_mv(%union.int_mv* %55, i32 %58, i32 %61, i32 %64, i32 %67), !dbg !2567
  %68 = load %union.int_mv** %4, align 8, !dbg !2568
  %69 = bitcast %union.int_mv* %68 to %struct.MV*, !dbg !2568
  %70 = getelementptr inbounds %struct.MV* %69, i32 0, i32 0, !dbg !2568
  %71 = load i16* %70, align 2, !dbg !2568
  %72 = sext i16 %71 to i32, !dbg !2568
  store i32 %72, i32* %br, align 4, !dbg !2569
  %73 = load %union.int_mv** %4, align 8, !dbg !2570
  %74 = bitcast %union.int_mv* %73 to %struct.MV*, !dbg !2570
  %75 = getelementptr inbounds %struct.MV* %74, i32 0, i32 1, !dbg !2570
  %76 = load i16* %75, align 2, !dbg !2570
  %77 = sext i16 %76 to i32, !dbg !2570
  store i32 %77, i32* %bc, align 4, !dbg !2571
  %78 = load i8** %base_pre, align 8, !dbg !2572
  %79 = load %struct.blockd** %3, align 8, !dbg !2573
  %80 = getelementptr inbounds %struct.blockd* %79, i32 0, i32 4, !dbg !2573
  %81 = load i32* %80, align 4, !dbg !2573
  %82 = sext i32 %81 to i64, !dbg !2572
  %83 = getelementptr inbounds i8* %78, i64 %82, !dbg !2572
  store i8* %83, i8** %base_offset, align 8, !dbg !2574
  %84 = load i8** %base_offset, align 8, !dbg !2575
  %85 = load i32* %br, align 4, !dbg !2576
  %86 = load i32* %pre_stride, align 4, !dbg !2577
  %87 = mul nsw i32 %85, %86, !dbg !2576
  %88 = sext i32 %87 to i64, !dbg !2575
  %89 = getelementptr inbounds i8* %84, i64 %88, !dbg !2575
  %90 = load i32* %bc, align 4, !dbg !2578
  %91 = sext i32 %90 to i64, !dbg !2575
  %92 = getelementptr inbounds i8* %89, i64 %91, !dbg !2575
  store i8* %92, i8** %this_offset, align 8, !dbg !2579
  %93 = load i32* %br, align 4, !dbg !2580
  %94 = trunc i32 %93 to i16, !dbg !2580
  %95 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2581
  %96 = getelementptr inbounds %struct.MV* %95, i32 0, i32 0, !dbg !2581
  store i16 %94, i16* %96, align 2, !dbg !2581
  %97 = load i32* %bc, align 4, !dbg !2582
  %98 = trunc i32 %97 to i16, !dbg !2582
  %99 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2583
  %100 = getelementptr inbounds %struct.MV* %99, i32 0, i32 1, !dbg !2583
  store i16 %98, i16* %100, align 2, !dbg !2583
  %101 = load %struct.variance_vtable** %8, align 8, !dbg !2584
  %102 = getelementptr inbounds %struct.variance_vtable* %101, i32 0, i32 0, !dbg !2584
  %103 = load i32 (i8*, i32, i8*, i32, i32)** %102, align 8, !dbg !2584
  %104 = load i8** %what, align 8, !dbg !2585
  %105 = load i32* %what_stride, align 4, !dbg !2586
  %106 = load i8** %this_offset, align 8, !dbg !2587
  %107 = load i32* %in_what_stride, align 4, !dbg !2588
  %108 = call i32 %103(i8* %104, i32 %105, i8* %106, i32 %107, i32 -1), !dbg !2584
  %109 = load i32*** %9, align 8, !dbg !2589
  %110 = load i32* %7, align 4, !dbg !2590
  %111 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %109, i32 %110), !dbg !2591
  %112 = add i32 %108, %111, !dbg !2584
  store i32 %112, i32* %bestsad, align 4, !dbg !2592
  store i32 1, i32* %all_in, align 4, !dbg !2593
  %113 = load i32* %br, align 4, !dbg !2593
  %114 = sub nsw i32 %113, 2, !dbg !2593
  %115 = load %struct.macroblock** %1, align 8, !dbg !2593
  %116 = getelementptr inbounds %struct.macroblock* %115, i32 0, i32 33, !dbg !2593
  %117 = load i32* %116, align 4, !dbg !2593
  %118 = icmp sge i32 %114, %117, !dbg !2593
  %119 = zext i1 %118 to i32, !dbg !2593
  %120 = load i32* %all_in, align 4, !dbg !2593
  %121 = and i32 %120, %119, !dbg !2593
  store i32 %121, i32* %all_in, align 4, !dbg !2593
  %122 = load i32* %br, align 4, !dbg !2593
  %123 = add nsw i32 %122, 2, !dbg !2593
  %124 = load %struct.macroblock** %1, align 8, !dbg !2593
  %125 = getelementptr inbounds %struct.macroblock* %124, i32 0, i32 34, !dbg !2593
  %126 = load i32* %125, align 4, !dbg !2593
  %127 = icmp sle i32 %123, %126, !dbg !2593
  %128 = zext i1 %127 to i32, !dbg !2593
  %129 = load i32* %all_in, align 4, !dbg !2593
  %130 = and i32 %129, %128, !dbg !2593
  store i32 %130, i32* %all_in, align 4, !dbg !2593
  %131 = load i32* %bc, align 4, !dbg !2593
  %132 = sub nsw i32 %131, 2, !dbg !2593
  %133 = load %struct.macroblock** %1, align 8, !dbg !2593
  %134 = getelementptr inbounds %struct.macroblock* %133, i32 0, i32 31, !dbg !2593
  %135 = load i32* %134, align 4, !dbg !2593
  %136 = icmp sge i32 %132, %135, !dbg !2593
  %137 = zext i1 %136 to i32, !dbg !2593
  %138 = load i32* %all_in, align 4, !dbg !2593
  %139 = and i32 %138, %137, !dbg !2593
  store i32 %139, i32* %all_in, align 4, !dbg !2593
  %140 = load i32* %bc, align 4, !dbg !2593
  %141 = add nsw i32 %140, 2, !dbg !2593
  %142 = load %struct.macroblock** %1, align 8, !dbg !2593
  %143 = getelementptr inbounds %struct.macroblock* %142, i32 0, i32 32, !dbg !2593
  %144 = load i32* %143, align 4, !dbg !2593
  %145 = icmp sle i32 %141, %144, !dbg !2593
  %146 = zext i1 %145 to i32, !dbg !2593
  %147 = load i32* %all_in, align 4, !dbg !2593
  %148 = and i32 %147, %146, !dbg !2593
  store i32 %148, i32* %all_in, align 4, !dbg !2593
  %149 = load i32* %all_in, align 4, !dbg !2595
  %150 = icmp ne i32 %149, 0, !dbg !2597
  br i1 %150, label %151, label %223, !dbg !2597

; <label>:151                                     ; preds = %0
  store i32 0, i32* %i, align 4, !dbg !2598
  br label %152, !dbg !2598

; <label>:152                                     ; preds = %219, %151
  %153 = load i32* %i, align 4, !dbg !2601
  %154 = icmp slt i32 %153, 6, !dbg !2601
  br i1 %154, label %155, label %222, !dbg !2605

; <label>:155                                     ; preds = %152
  %156 = load i32* %br, align 4, !dbg !2606
  %157 = load i32* %i, align 4, !dbg !2608
  %158 = sext i32 %157 to i64, !dbg !2609
  %159 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %158, !dbg !2609
  %160 = getelementptr inbounds %struct.MV* %159, i32 0, i32 0, !dbg !2609
  %161 = load i16* %160, align 2, !dbg !2609
  %162 = sext i16 %161 to i32, !dbg !2609
  %163 = add nsw i32 %156, %162, !dbg !2606
  %164 = trunc i32 %163 to i16, !dbg !2606
  %165 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2610
  %166 = getelementptr inbounds %struct.MV* %165, i32 0, i32 0, !dbg !2610
  store i16 %164, i16* %166, align 2, !dbg !2610
  %167 = load i32* %bc, align 4, !dbg !2611
  %168 = load i32* %i, align 4, !dbg !2612
  %169 = sext i32 %168 to i64, !dbg !2613
  %170 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %169, !dbg !2613
  %171 = getelementptr inbounds %struct.MV* %170, i32 0, i32 1, !dbg !2613
  %172 = load i16* %171, align 2, !dbg !2613
  %173 = sext i16 %172 to i32, !dbg !2613
  %174 = add nsw i32 %167, %173, !dbg !2611
  %175 = trunc i32 %174 to i16, !dbg !2611
  %176 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2614
  %177 = getelementptr inbounds %struct.MV* %176, i32 0, i32 1, !dbg !2614
  store i16 %175, i16* %177, align 2, !dbg !2614
  %178 = load i8** %base_offset, align 8, !dbg !2615
  %179 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2616
  %180 = getelementptr inbounds %struct.MV* %179, i32 0, i32 0, !dbg !2616
  %181 = load i16* %180, align 2, !dbg !2616
  %182 = sext i16 %181 to i32, !dbg !2616
  %183 = load i32* %in_what_stride, align 4, !dbg !2617
  %184 = mul nsw i32 %182, %183, !dbg !2616
  %185 = sext i32 %184 to i64, !dbg !2615
  %186 = getelementptr inbounds i8* %178, i64 %185, !dbg !2615
  %187 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2618
  %188 = getelementptr inbounds %struct.MV* %187, i32 0, i32 1, !dbg !2618
  %189 = load i16* %188, align 2, !dbg !2618
  %190 = sext i16 %189 to i32, !dbg !2618
  %191 = sext i32 %190 to i64, !dbg !2615
  %192 = getelementptr inbounds i8* %186, i64 %191, !dbg !2615
  store i8* %192, i8** %this_offset, align 8, !dbg !2619
  %193 = load %struct.variance_vtable** %8, align 8, !dbg !2620
  %194 = getelementptr inbounds %struct.variance_vtable* %193, i32 0, i32 0, !dbg !2620
  %195 = load i32 (i8*, i32, i8*, i32, i32)** %194, align 8, !dbg !2620
  %196 = load i8** %what, align 8, !dbg !2621
  %197 = load i32* %what_stride, align 4, !dbg !2622
  %198 = load i8** %this_offset, align 8, !dbg !2623
  %199 = load i32* %in_what_stride, align 4, !dbg !2624
  %200 = load i32* %bestsad, align 4, !dbg !2625
  %201 = call i32 %195(i8* %196, i32 %197, i8* %198, i32 %199, i32 %200), !dbg !2620
  store i32 %201, i32* %thissad, align 4, !dbg !2626
  %202 = load i32* %thissad, align 4, !dbg !2627
  %203 = load i32* %bestsad, align 4, !dbg !2627
  %204 = icmp ult i32 %202, %203, !dbg !2627
  br i1 %204, label %205, label %218, !dbg !2630

; <label>:205                                     ; preds = %155
  %206 = load i32*** %9, align 8, !dbg !2631
  %207 = load i32* %7, align 4, !dbg !2631
  %208 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %206, i32 %207), !dbg !2631
  %209 = load i32* %thissad, align 4, !dbg !2631
  %210 = add i32 %209, %208, !dbg !2631
  store i32 %210, i32* %thissad, align 4, !dbg !2631
  %211 = load i32* %thissad, align 4, !dbg !2634
  %212 = load i32* %bestsad, align 4, !dbg !2634
  %213 = icmp ult i32 %211, %212, !dbg !2634
  br i1 %213, label %214, label %217, !dbg !2636

; <label>:214                                     ; preds = %205
  %215 = load i32* %thissad, align 4, !dbg !2637
  store i32 %215, i32* %bestsad, align 4, !dbg !2637
  %216 = load i32* %i, align 4, !dbg !2637
  store i32 %216, i32* %best_site, align 4, !dbg !2637
  br label %217, !dbg !2637

; <label>:217                                     ; preds = %214, %205
  br label %218, !dbg !2640

; <label>:218                                     ; preds = %217, %155
  br label %219, !dbg !2643

; <label>:219                                     ; preds = %218
  %220 = load i32* %i, align 4, !dbg !2644
  %221 = add nsw i32 %220, 1, !dbg !2644
  store i32 %221, i32* %i, align 4, !dbg !2644
  br label %152, !dbg !2645

; <label>:222                                     ; preds = %152
  br label %335, !dbg !2646

; <label>:223                                     ; preds = %0
  store i32 0, i32* %i, align 4, !dbg !2647
  br label %224, !dbg !2647

; <label>:224                                     ; preds = %331, %223
  %225 = load i32* %i, align 4, !dbg !2650
  %226 = icmp slt i32 %225, 6, !dbg !2650
  br i1 %226, label %227, label %334, !dbg !2654

; <label>:227                                     ; preds = %224
  %228 = load i32* %br, align 4, !dbg !2655
  %229 = load i32* %i, align 4, !dbg !2657
  %230 = sext i32 %229 to i64, !dbg !2658
  %231 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %230, !dbg !2658
  %232 = getelementptr inbounds %struct.MV* %231, i32 0, i32 0, !dbg !2658
  %233 = load i16* %232, align 2, !dbg !2658
  %234 = sext i16 %233 to i32, !dbg !2658
  %235 = add nsw i32 %228, %234, !dbg !2655
  %236 = trunc i32 %235 to i16, !dbg !2655
  %237 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2659
  %238 = getelementptr inbounds %struct.MV* %237, i32 0, i32 0, !dbg !2659
  store i16 %236, i16* %238, align 2, !dbg !2659
  %239 = load i32* %bc, align 4, !dbg !2660
  %240 = load i32* %i, align 4, !dbg !2661
  %241 = sext i32 %240 to i64, !dbg !2662
  %242 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %241, !dbg !2662
  %243 = getelementptr inbounds %struct.MV* %242, i32 0, i32 1, !dbg !2662
  %244 = load i16* %243, align 2, !dbg !2662
  %245 = sext i16 %244 to i32, !dbg !2662
  %246 = add nsw i32 %239, %245, !dbg !2660
  %247 = trunc i32 %246 to i16, !dbg !2660
  %248 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2663
  %249 = getelementptr inbounds %struct.MV* %248, i32 0, i32 1, !dbg !2663
  store i16 %247, i16* %249, align 2, !dbg !2663
  %250 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2664
  %251 = getelementptr inbounds %struct.MV* %250, i32 0, i32 1, !dbg !2664
  %252 = load i16* %251, align 2, !dbg !2664
  %253 = sext i16 %252 to i32, !dbg !2664
  %254 = load %struct.macroblock** %1, align 8, !dbg !2664
  %255 = getelementptr inbounds %struct.macroblock* %254, i32 0, i32 31, !dbg !2664
  %256 = load i32* %255, align 4, !dbg !2664
  %257 = icmp slt i32 %253, %256, !dbg !2664
  br i1 %257, label %258, label %259, !dbg !2667

; <label>:258                                     ; preds = %227
  br label %331, !dbg !2668

; <label>:259                                     ; preds = %227
  %260 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2670
  %261 = getelementptr inbounds %struct.MV* %260, i32 0, i32 1, !dbg !2670
  %262 = load i16* %261, align 2, !dbg !2670
  %263 = sext i16 %262 to i32, !dbg !2670
  %264 = load %struct.macroblock** %1, align 8, !dbg !2670
  %265 = getelementptr inbounds %struct.macroblock* %264, i32 0, i32 32, !dbg !2670
  %266 = load i32* %265, align 4, !dbg !2670
  %267 = icmp sgt i32 %263, %266, !dbg !2670
  br i1 %267, label %268, label %269, !dbg !2667

; <label>:268                                     ; preds = %259
  br label %331, !dbg !2673

; <label>:269                                     ; preds = %259
  %270 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2675
  %271 = getelementptr inbounds %struct.MV* %270, i32 0, i32 0, !dbg !2675
  %272 = load i16* %271, align 2, !dbg !2675
  %273 = sext i16 %272 to i32, !dbg !2675
  %274 = load %struct.macroblock** %1, align 8, !dbg !2675
  %275 = getelementptr inbounds %struct.macroblock* %274, i32 0, i32 33, !dbg !2675
  %276 = load i32* %275, align 4, !dbg !2675
  %277 = icmp slt i32 %273, %276, !dbg !2675
  br i1 %277, label %278, label %279, !dbg !2667

; <label>:278                                     ; preds = %269
  br label %331, !dbg !2678

; <label>:279                                     ; preds = %269
  %280 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2680
  %281 = getelementptr inbounds %struct.MV* %280, i32 0, i32 0, !dbg !2680
  %282 = load i16* %281, align 2, !dbg !2680
  %283 = sext i16 %282 to i32, !dbg !2680
  %284 = load %struct.macroblock** %1, align 8, !dbg !2680
  %285 = getelementptr inbounds %struct.macroblock* %284, i32 0, i32 34, !dbg !2680
  %286 = load i32* %285, align 4, !dbg !2680
  %287 = icmp sgt i32 %283, %286, !dbg !2680
  br i1 %287, label %288, label %289, !dbg !2667

; <label>:288                                     ; preds = %279
  br label %331, !dbg !2683

; <label>:289                                     ; preds = %279
  %290 = load i8** %base_offset, align 8, !dbg !2685
  %291 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2686
  %292 = getelementptr inbounds %struct.MV* %291, i32 0, i32 0, !dbg !2686
  %293 = load i16* %292, align 2, !dbg !2686
  %294 = sext i16 %293 to i32, !dbg !2686
  %295 = load i32* %in_what_stride, align 4, !dbg !2687
  %296 = mul nsw i32 %294, %295, !dbg !2686
  %297 = sext i32 %296 to i64, !dbg !2685
  %298 = getelementptr inbounds i8* %290, i64 %297, !dbg !2685
  %299 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2688
  %300 = getelementptr inbounds %struct.MV* %299, i32 0, i32 1, !dbg !2688
  %301 = load i16* %300, align 2, !dbg !2688
  %302 = sext i16 %301 to i32, !dbg !2688
  %303 = sext i32 %302 to i64, !dbg !2685
  %304 = getelementptr inbounds i8* %298, i64 %303, !dbg !2685
  store i8* %304, i8** %this_offset, align 8, !dbg !2689
  %305 = load %struct.variance_vtable** %8, align 8, !dbg !2690
  %306 = getelementptr inbounds %struct.variance_vtable* %305, i32 0, i32 0, !dbg !2690
  %307 = load i32 (i8*, i32, i8*, i32, i32)** %306, align 8, !dbg !2690
  %308 = load i8** %what, align 8, !dbg !2691
  %309 = load i32* %what_stride, align 4, !dbg !2692
  %310 = load i8** %this_offset, align 8, !dbg !2693
  %311 = load i32* %in_what_stride, align 4, !dbg !2694
  %312 = load i32* %bestsad, align 4, !dbg !2695
  %313 = call i32 %307(i8* %308, i32 %309, i8* %310, i32 %311, i32 %312), !dbg !2690
  store i32 %313, i32* %thissad, align 4, !dbg !2696
  %314 = load i32* %thissad, align 4, !dbg !2697
  %315 = load i32* %bestsad, align 4, !dbg !2697
  %316 = icmp ult i32 %314, %315, !dbg !2697
  br i1 %316, label %317, label %330, !dbg !2700

; <label>:317                                     ; preds = %289
  %318 = load i32*** %9, align 8, !dbg !2701
  %319 = load i32* %7, align 4, !dbg !2701
  %320 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %318, i32 %319), !dbg !2701
  %321 = load i32* %thissad, align 4, !dbg !2701
  %322 = add i32 %321, %320, !dbg !2701
  store i32 %322, i32* %thissad, align 4, !dbg !2701
  %323 = load i32* %thissad, align 4, !dbg !2704
  %324 = load i32* %bestsad, align 4, !dbg !2704
  %325 = icmp ult i32 %323, %324, !dbg !2704
  br i1 %325, label %326, label %329, !dbg !2706

; <label>:326                                     ; preds = %317
  %327 = load i32* %thissad, align 4, !dbg !2707
  store i32 %327, i32* %bestsad, align 4, !dbg !2707
  %328 = load i32* %i, align 4, !dbg !2707
  store i32 %328, i32* %best_site, align 4, !dbg !2707
  br label %329, !dbg !2707

; <label>:329                                     ; preds = %326, %317
  br label %330, !dbg !2710

; <label>:330                                     ; preds = %329, %289
  br label %331, !dbg !2713

; <label>:331                                     ; preds = %330, %288, %278, %268, %258
  %332 = load i32* %i, align 4, !dbg !2714
  %333 = add nsw i32 %332, 1, !dbg !2714
  store i32 %333, i32* %i, align 4, !dbg !2714
  br label %224, !dbg !2715

; <label>:334                                     ; preds = %224
  br label %335

; <label>:335                                     ; preds = %334, %222
  %336 = load i32* %best_site, align 4, !dbg !2716
  %337 = icmp eq i32 %336, -1, !dbg !2716
  br i1 %337, label %338, label %339, !dbg !2718

; <label>:338                                     ; preds = %335
  br label %646, !dbg !2719

; <label>:339                                     ; preds = %335
  %340 = load i32* %best_site, align 4, !dbg !2720
  %341 = sext i32 %340 to i64, !dbg !2722
  %342 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %341, !dbg !2722
  %343 = getelementptr inbounds %struct.MV* %342, i32 0, i32 0, !dbg !2722
  %344 = load i16* %343, align 2, !dbg !2722
  %345 = sext i16 %344 to i32, !dbg !2722
  %346 = load i32* %br, align 4, !dbg !2723
  %347 = add nsw i32 %346, %345, !dbg !2723
  store i32 %347, i32* %br, align 4, !dbg !2723
  %348 = load i32* %best_site, align 4, !dbg !2724
  %349 = sext i32 %348 to i64, !dbg !2725
  %350 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %349, !dbg !2725
  %351 = getelementptr inbounds %struct.MV* %350, i32 0, i32 1, !dbg !2725
  %352 = load i16* %351, align 2, !dbg !2725
  %353 = sext i16 %352 to i32, !dbg !2725
  %354 = load i32* %bc, align 4, !dbg !2726
  %355 = add nsw i32 %354, %353, !dbg !2726
  store i32 %355, i32* %bc, align 4, !dbg !2726
  %356 = load i32* %best_site, align 4, !dbg !2727
  store i32 %356, i32* %k, align 4, !dbg !2728
  br label %357

; <label>:357                                     ; preds = %339
  store i32 1, i32* %j, align 4, !dbg !2729
  br label %358, !dbg !2729

; <label>:358                                     ; preds = %642, %357
  %359 = load i32* %j, align 4, !dbg !2731
  %360 = load i32* %hex_range, align 4, !dbg !2735
  %361 = icmp slt i32 %359, %360, !dbg !2736
  br i1 %361, label %362, label %645, !dbg !2737

; <label>:362                                     ; preds = %358
  store i32 -1, i32* %best_site, align 4, !dbg !2738
  store i32 1, i32* %all_in, align 4, !dbg !2740
  %363 = load i32* %br, align 4, !dbg !2740
  %364 = sub nsw i32 %363, 2, !dbg !2740
  %365 = load %struct.macroblock** %1, align 8, !dbg !2740
  %366 = getelementptr inbounds %struct.macroblock* %365, i32 0, i32 33, !dbg !2740
  %367 = load i32* %366, align 4, !dbg !2740
  %368 = icmp sge i32 %364, %367, !dbg !2740
  %369 = zext i1 %368 to i32, !dbg !2740
  %370 = load i32* %all_in, align 4, !dbg !2740
  %371 = and i32 %370, %369, !dbg !2740
  store i32 %371, i32* %all_in, align 4, !dbg !2740
  %372 = load i32* %br, align 4, !dbg !2740
  %373 = add nsw i32 %372, 2, !dbg !2740
  %374 = load %struct.macroblock** %1, align 8, !dbg !2740
  %375 = getelementptr inbounds %struct.macroblock* %374, i32 0, i32 34, !dbg !2740
  %376 = load i32* %375, align 4, !dbg !2740
  %377 = icmp sle i32 %373, %376, !dbg !2740
  %378 = zext i1 %377 to i32, !dbg !2740
  %379 = load i32* %all_in, align 4, !dbg !2740
  %380 = and i32 %379, %378, !dbg !2740
  store i32 %380, i32* %all_in, align 4, !dbg !2740
  %381 = load i32* %bc, align 4, !dbg !2740
  %382 = sub nsw i32 %381, 2, !dbg !2740
  %383 = load %struct.macroblock** %1, align 8, !dbg !2740
  %384 = getelementptr inbounds %struct.macroblock* %383, i32 0, i32 31, !dbg !2740
  %385 = load i32* %384, align 4, !dbg !2740
  %386 = icmp sge i32 %382, %385, !dbg !2740
  %387 = zext i1 %386 to i32, !dbg !2740
  %388 = load i32* %all_in, align 4, !dbg !2740
  %389 = and i32 %388, %387, !dbg !2740
  store i32 %389, i32* %all_in, align 4, !dbg !2740
  %390 = load i32* %bc, align 4, !dbg !2740
  %391 = add nsw i32 %390, 2, !dbg !2740
  %392 = load %struct.macroblock** %1, align 8, !dbg !2740
  %393 = getelementptr inbounds %struct.macroblock* %392, i32 0, i32 32, !dbg !2740
  %394 = load i32* %393, align 4, !dbg !2740
  %395 = icmp sle i32 %391, %394, !dbg !2740
  %396 = zext i1 %395 to i32, !dbg !2740
  %397 = load i32* %all_in, align 4, !dbg !2740
  %398 = and i32 %397, %396, !dbg !2740
  store i32 %398, i32* %all_in, align 4, !dbg !2740
  %399 = load i32* %all_in, align 4, !dbg !2742
  %400 = icmp ne i32 %399, 0, !dbg !2744
  br i1 %400, label %401, label %479, !dbg !2744

; <label>:401                                     ; preds = %362
  store i32 0, i32* %i, align 4, !dbg !2745
  br label %402, !dbg !2745

; <label>:402                                     ; preds = %475, %401
  %403 = load i32* %i, align 4, !dbg !2748
  %404 = icmp slt i32 %403, 3, !dbg !2748
  br i1 %404, label %405, label %478, !dbg !2752

; <label>:405                                     ; preds = %402
  %406 = load i32* %br, align 4, !dbg !2753
  %407 = load i32* %i, align 4, !dbg !2755
  %408 = sext i32 %407 to i64, !dbg !2756
  %409 = load i32* %k, align 4, !dbg !2757
  %410 = sext i32 %409 to i64, !dbg !2756
  %411 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %410, !dbg !2756
  %412 = getelementptr inbounds [3 x %struct.MV]* %411, i32 0, i64 %408, !dbg !2756
  %413 = getelementptr inbounds %struct.MV* %412, i32 0, i32 0, !dbg !2756
  %414 = load i16* %413, align 2, !dbg !2756
  %415 = sext i16 %414 to i32, !dbg !2756
  %416 = add nsw i32 %406, %415, !dbg !2753
  %417 = trunc i32 %416 to i16, !dbg !2753
  %418 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2758
  %419 = getelementptr inbounds %struct.MV* %418, i32 0, i32 0, !dbg !2758
  store i16 %417, i16* %419, align 2, !dbg !2758
  %420 = load i32* %bc, align 4, !dbg !2759
  %421 = load i32* %i, align 4, !dbg !2760
  %422 = sext i32 %421 to i64, !dbg !2761
  %423 = load i32* %k, align 4, !dbg !2762
  %424 = sext i32 %423 to i64, !dbg !2761
  %425 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %424, !dbg !2761
  %426 = getelementptr inbounds [3 x %struct.MV]* %425, i32 0, i64 %422, !dbg !2761
  %427 = getelementptr inbounds %struct.MV* %426, i32 0, i32 1, !dbg !2761
  %428 = load i16* %427, align 2, !dbg !2761
  %429 = sext i16 %428 to i32, !dbg !2761
  %430 = add nsw i32 %420, %429, !dbg !2759
  %431 = trunc i32 %430 to i16, !dbg !2759
  %432 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2763
  %433 = getelementptr inbounds %struct.MV* %432, i32 0, i32 1, !dbg !2763
  store i16 %431, i16* %433, align 2, !dbg !2763
  %434 = load i8** %base_offset, align 8, !dbg !2764
  %435 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2765
  %436 = getelementptr inbounds %struct.MV* %435, i32 0, i32 0, !dbg !2765
  %437 = load i16* %436, align 2, !dbg !2765
  %438 = sext i16 %437 to i32, !dbg !2765
  %439 = load i32* %in_what_stride, align 4, !dbg !2766
  %440 = mul nsw i32 %438, %439, !dbg !2765
  %441 = sext i32 %440 to i64, !dbg !2764
  %442 = getelementptr inbounds i8* %434, i64 %441, !dbg !2764
  %443 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2767
  %444 = getelementptr inbounds %struct.MV* %443, i32 0, i32 1, !dbg !2767
  %445 = load i16* %444, align 2, !dbg !2767
  %446 = sext i16 %445 to i32, !dbg !2767
  %447 = sext i32 %446 to i64, !dbg !2764
  %448 = getelementptr inbounds i8* %442, i64 %447, !dbg !2764
  store i8* %448, i8** %this_offset, align 8, !dbg !2768
  %449 = load %struct.variance_vtable** %8, align 8, !dbg !2769
  %450 = getelementptr inbounds %struct.variance_vtable* %449, i32 0, i32 0, !dbg !2769
  %451 = load i32 (i8*, i32, i8*, i32, i32)** %450, align 8, !dbg !2769
  %452 = load i8** %what, align 8, !dbg !2770
  %453 = load i32* %what_stride, align 4, !dbg !2771
  %454 = load i8** %this_offset, align 8, !dbg !2772
  %455 = load i32* %in_what_stride, align 4, !dbg !2773
  %456 = load i32* %bestsad, align 4, !dbg !2774
  %457 = call i32 %451(i8* %452, i32 %453, i8* %454, i32 %455, i32 %456), !dbg !2769
  store i32 %457, i32* %thissad, align 4, !dbg !2775
  %458 = load i32* %thissad, align 4, !dbg !2776
  %459 = load i32* %bestsad, align 4, !dbg !2776
  %460 = icmp ult i32 %458, %459, !dbg !2776
  br i1 %460, label %461, label %474, !dbg !2779

; <label>:461                                     ; preds = %405
  %462 = load i32*** %9, align 8, !dbg !2780
  %463 = load i32* %7, align 4, !dbg !2780
  %464 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %462, i32 %463), !dbg !2780
  %465 = load i32* %thissad, align 4, !dbg !2780
  %466 = add i32 %465, %464, !dbg !2780
  store i32 %466, i32* %thissad, align 4, !dbg !2780
  %467 = load i32* %thissad, align 4, !dbg !2783
  %468 = load i32* %bestsad, align 4, !dbg !2783
  %469 = icmp ult i32 %467, %468, !dbg !2783
  br i1 %469, label %470, label %473, !dbg !2785

; <label>:470                                     ; preds = %461
  %471 = load i32* %thissad, align 4, !dbg !2786
  store i32 %471, i32* %bestsad, align 4, !dbg !2786
  %472 = load i32* %i, align 4, !dbg !2786
  store i32 %472, i32* %best_site, align 4, !dbg !2786
  br label %473, !dbg !2786

; <label>:473                                     ; preds = %470, %461
  br label %474, !dbg !2789

; <label>:474                                     ; preds = %473, %405
  br label %475, !dbg !2792

; <label>:475                                     ; preds = %474
  %476 = load i32* %i, align 4, !dbg !2793
  %477 = add nsw i32 %476, 1, !dbg !2793
  store i32 %477, i32* %i, align 4, !dbg !2793
  br label %402, !dbg !2794

; <label>:478                                     ; preds = %402
  br label %597, !dbg !2795

; <label>:479                                     ; preds = %362
  store i32 0, i32* %i, align 4, !dbg !2796
  br label %480, !dbg !2796

; <label>:480                                     ; preds = %593, %479
  %481 = load i32* %i, align 4, !dbg !2799
  %482 = icmp slt i32 %481, 3, !dbg !2799
  br i1 %482, label %483, label %596, !dbg !2803

; <label>:483                                     ; preds = %480
  %484 = load i32* %br, align 4, !dbg !2804
  %485 = load i32* %i, align 4, !dbg !2806
  %486 = sext i32 %485 to i64, !dbg !2807
  %487 = load i32* %k, align 4, !dbg !2808
  %488 = sext i32 %487 to i64, !dbg !2807
  %489 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %488, !dbg !2807
  %490 = getelementptr inbounds [3 x %struct.MV]* %489, i32 0, i64 %486, !dbg !2807
  %491 = getelementptr inbounds %struct.MV* %490, i32 0, i32 0, !dbg !2807
  %492 = load i16* %491, align 2, !dbg !2807
  %493 = sext i16 %492 to i32, !dbg !2807
  %494 = add nsw i32 %484, %493, !dbg !2804
  %495 = trunc i32 %494 to i16, !dbg !2804
  %496 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2809
  %497 = getelementptr inbounds %struct.MV* %496, i32 0, i32 0, !dbg !2809
  store i16 %495, i16* %497, align 2, !dbg !2809
  %498 = load i32* %bc, align 4, !dbg !2810
  %499 = load i32* %i, align 4, !dbg !2811
  %500 = sext i32 %499 to i64, !dbg !2812
  %501 = load i32* %k, align 4, !dbg !2813
  %502 = sext i32 %501 to i64, !dbg !2812
  %503 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %502, !dbg !2812
  %504 = getelementptr inbounds [3 x %struct.MV]* %503, i32 0, i64 %500, !dbg !2812
  %505 = getelementptr inbounds %struct.MV* %504, i32 0, i32 1, !dbg !2812
  %506 = load i16* %505, align 2, !dbg !2812
  %507 = sext i16 %506 to i32, !dbg !2812
  %508 = add nsw i32 %498, %507, !dbg !2810
  %509 = trunc i32 %508 to i16, !dbg !2810
  %510 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2814
  %511 = getelementptr inbounds %struct.MV* %510, i32 0, i32 1, !dbg !2814
  store i16 %509, i16* %511, align 2, !dbg !2814
  %512 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2815
  %513 = getelementptr inbounds %struct.MV* %512, i32 0, i32 1, !dbg !2815
  %514 = load i16* %513, align 2, !dbg !2815
  %515 = sext i16 %514 to i32, !dbg !2815
  %516 = load %struct.macroblock** %1, align 8, !dbg !2815
  %517 = getelementptr inbounds %struct.macroblock* %516, i32 0, i32 31, !dbg !2815
  %518 = load i32* %517, align 4, !dbg !2815
  %519 = icmp slt i32 %515, %518, !dbg !2815
  br i1 %519, label %520, label %521, !dbg !2818

; <label>:520                                     ; preds = %483
  br label %593, !dbg !2819

; <label>:521                                     ; preds = %483
  %522 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2821
  %523 = getelementptr inbounds %struct.MV* %522, i32 0, i32 1, !dbg !2821
  %524 = load i16* %523, align 2, !dbg !2821
  %525 = sext i16 %524 to i32, !dbg !2821
  %526 = load %struct.macroblock** %1, align 8, !dbg !2821
  %527 = getelementptr inbounds %struct.macroblock* %526, i32 0, i32 32, !dbg !2821
  %528 = load i32* %527, align 4, !dbg !2821
  %529 = icmp sgt i32 %525, %528, !dbg !2821
  br i1 %529, label %530, label %531, !dbg !2818

; <label>:530                                     ; preds = %521
  br label %593, !dbg !2824

; <label>:531                                     ; preds = %521
  %532 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2826
  %533 = getelementptr inbounds %struct.MV* %532, i32 0, i32 0, !dbg !2826
  %534 = load i16* %533, align 2, !dbg !2826
  %535 = sext i16 %534 to i32, !dbg !2826
  %536 = load %struct.macroblock** %1, align 8, !dbg !2826
  %537 = getelementptr inbounds %struct.macroblock* %536, i32 0, i32 33, !dbg !2826
  %538 = load i32* %537, align 4, !dbg !2826
  %539 = icmp slt i32 %535, %538, !dbg !2826
  br i1 %539, label %540, label %541, !dbg !2818

; <label>:540                                     ; preds = %531
  br label %593, !dbg !2829

; <label>:541                                     ; preds = %531
  %542 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2831
  %543 = getelementptr inbounds %struct.MV* %542, i32 0, i32 0, !dbg !2831
  %544 = load i16* %543, align 2, !dbg !2831
  %545 = sext i16 %544 to i32, !dbg !2831
  %546 = load %struct.macroblock** %1, align 8, !dbg !2831
  %547 = getelementptr inbounds %struct.macroblock* %546, i32 0, i32 34, !dbg !2831
  %548 = load i32* %547, align 4, !dbg !2831
  %549 = icmp sgt i32 %545, %548, !dbg !2831
  br i1 %549, label %550, label %551, !dbg !2818

; <label>:550                                     ; preds = %541
  br label %593, !dbg !2834

; <label>:551                                     ; preds = %541
  %552 = load i8** %base_offset, align 8, !dbg !2836
  %553 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2837
  %554 = getelementptr inbounds %struct.MV* %553, i32 0, i32 0, !dbg !2837
  %555 = load i16* %554, align 2, !dbg !2837
  %556 = sext i16 %555 to i32, !dbg !2837
  %557 = load i32* %in_what_stride, align 4, !dbg !2838
  %558 = mul nsw i32 %556, %557, !dbg !2837
  %559 = sext i32 %558 to i64, !dbg !2836
  %560 = getelementptr inbounds i8* %552, i64 %559, !dbg !2836
  %561 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2839
  %562 = getelementptr inbounds %struct.MV* %561, i32 0, i32 1, !dbg !2839
  %563 = load i16* %562, align 2, !dbg !2839
  %564 = sext i16 %563 to i32, !dbg !2839
  %565 = sext i32 %564 to i64, !dbg !2836
  %566 = getelementptr inbounds i8* %560, i64 %565, !dbg !2836
  store i8* %566, i8** %this_offset, align 8, !dbg !2840
  %567 = load %struct.variance_vtable** %8, align 8, !dbg !2841
  %568 = getelementptr inbounds %struct.variance_vtable* %567, i32 0, i32 0, !dbg !2841
  %569 = load i32 (i8*, i32, i8*, i32, i32)** %568, align 8, !dbg !2841
  %570 = load i8** %what, align 8, !dbg !2842
  %571 = load i32* %what_stride, align 4, !dbg !2843
  %572 = load i8** %this_offset, align 8, !dbg !2844
  %573 = load i32* %in_what_stride, align 4, !dbg !2845
  %574 = load i32* %bestsad, align 4, !dbg !2846
  %575 = call i32 %569(i8* %570, i32 %571, i8* %572, i32 %573, i32 %574), !dbg !2841
  store i32 %575, i32* %thissad, align 4, !dbg !2847
  %576 = load i32* %thissad, align 4, !dbg !2848
  %577 = load i32* %bestsad, align 4, !dbg !2848
  %578 = icmp ult i32 %576, %577, !dbg !2848
  br i1 %578, label %579, label %592, !dbg !2851

; <label>:579                                     ; preds = %551
  %580 = load i32*** %9, align 8, !dbg !2852
  %581 = load i32* %7, align 4, !dbg !2852
  %582 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %580, i32 %581), !dbg !2852
  %583 = load i32* %thissad, align 4, !dbg !2852
  %584 = add i32 %583, %582, !dbg !2852
  store i32 %584, i32* %thissad, align 4, !dbg !2852
  %585 = load i32* %thissad, align 4, !dbg !2855
  %586 = load i32* %bestsad, align 4, !dbg !2855
  %587 = icmp ult i32 %585, %586, !dbg !2855
  br i1 %587, label %588, label %591, !dbg !2857

; <label>:588                                     ; preds = %579
  %589 = load i32* %thissad, align 4, !dbg !2858
  store i32 %589, i32* %bestsad, align 4, !dbg !2858
  %590 = load i32* %i, align 4, !dbg !2858
  store i32 %590, i32* %best_site, align 4, !dbg !2858
  br label %591, !dbg !2858

; <label>:591                                     ; preds = %588, %579
  br label %592, !dbg !2861

; <label>:592                                     ; preds = %591, %551
  br label %593, !dbg !2864

; <label>:593                                     ; preds = %592, %550, %540, %530, %520
  %594 = load i32* %i, align 4, !dbg !2865
  %595 = add nsw i32 %594, 1, !dbg !2865
  store i32 %595, i32* %i, align 4, !dbg !2865
  br label %480, !dbg !2866

; <label>:596                                     ; preds = %480
  br label %597

; <label>:597                                     ; preds = %596, %478
  %598 = load i32* %best_site, align 4, !dbg !2867
  %599 = icmp eq i32 %598, -1, !dbg !2867
  br i1 %599, label %600, label %601, !dbg !2869

; <label>:600                                     ; preds = %597
  br label %645, !dbg !2870

; <label>:601                                     ; preds = %597
  %602 = load i32* %best_site, align 4, !dbg !2871
  %603 = sext i32 %602 to i64, !dbg !2873
  %604 = load i32* %k, align 4, !dbg !2874
  %605 = sext i32 %604 to i64, !dbg !2873
  %606 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %605, !dbg !2873
  %607 = getelementptr inbounds [3 x %struct.MV]* %606, i32 0, i64 %603, !dbg !2873
  %608 = getelementptr inbounds %struct.MV* %607, i32 0, i32 0, !dbg !2873
  %609 = load i16* %608, align 2, !dbg !2873
  %610 = sext i16 %609 to i32, !dbg !2873
  %611 = load i32* %br, align 4, !dbg !2875
  %612 = add nsw i32 %611, %610, !dbg !2875
  store i32 %612, i32* %br, align 4, !dbg !2875
  %613 = load i32* %best_site, align 4, !dbg !2876
  %614 = sext i32 %613 to i64, !dbg !2877
  %615 = load i32* %k, align 4, !dbg !2878
  %616 = sext i32 %615 to i64, !dbg !2877
  %617 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %616, !dbg !2877
  %618 = getelementptr inbounds [3 x %struct.MV]* %617, i32 0, i64 %614, !dbg !2877
  %619 = getelementptr inbounds %struct.MV* %618, i32 0, i32 1, !dbg !2877
  %620 = load i16* %619, align 2, !dbg !2877
  %621 = sext i16 %620 to i32, !dbg !2877
  %622 = load i32* %bc, align 4, !dbg !2879
  %623 = add nsw i32 %622, %621, !dbg !2879
  store i32 %623, i32* %bc, align 4, !dbg !2879
  %624 = load i32* %best_site, align 4, !dbg !2880
  %625 = add nsw i32 5, %624, !dbg !2881
  %626 = load i32* %k, align 4, !dbg !2882
  %627 = add nsw i32 %626, %625, !dbg !2882
  store i32 %627, i32* %k, align 4, !dbg !2882
  %628 = load i32* %k, align 4, !dbg !2883
  %629 = icmp sge i32 %628, 12, !dbg !2883
  br i1 %629, label %630, label %633, !dbg !2885

; <label>:630                                     ; preds = %601
  %631 = load i32* %k, align 4, !dbg !2886
  %632 = sub nsw i32 %631, 12, !dbg !2886
  store i32 %632, i32* %k, align 4, !dbg !2886
  br label %640, !dbg !2886

; <label>:633                                     ; preds = %601
  %634 = load i32* %k, align 4, !dbg !2888
  %635 = icmp sge i32 %634, 6, !dbg !2888
  br i1 %635, label %636, label %639, !dbg !2890

; <label>:636                                     ; preds = %633
  %637 = load i32* %k, align 4, !dbg !2891
  %638 = sub nsw i32 %637, 6, !dbg !2891
  store i32 %638, i32* %k, align 4, !dbg !2891
  br label %639, !dbg !2891

; <label>:639                                     ; preds = %636, %633
  br label %640

; <label>:640                                     ; preds = %639, %630
  br label %641

; <label>:641                                     ; preds = %640
  br label %642, !dbg !2893

; <label>:642                                     ; preds = %641
  %643 = load i32* %j, align 4, !dbg !2894
  %644 = add nsw i32 %643, 1, !dbg !2894
  store i32 %644, i32* %j, align 4, !dbg !2894
  br label %358, !dbg !2895

; <label>:645                                     ; preds = %600, %358
  br label %646, !dbg !2896

; <label>:646                                     ; preds = %645, %338
  store i32 0, i32* %j, align 4, !dbg !2897
  br label %647, !dbg !2897

; <label>:647                                     ; preds = %896, %646
  %648 = load i32* %j, align 4, !dbg !2899
  %649 = load i32* %dia_range, align 4, !dbg !2903
  %650 = icmp slt i32 %648, %649, !dbg !2904
  br i1 %650, label %651, label %899, !dbg !2905

; <label>:651                                     ; preds = %647
  store i32 -1, i32* %best_site, align 4, !dbg !2906
  store i32 1, i32* %all_in, align 4, !dbg !2908
  %652 = load i32* %br, align 4, !dbg !2908
  %653 = sub nsw i32 %652, 1, !dbg !2908
  %654 = load %struct.macroblock** %1, align 8, !dbg !2908
  %655 = getelementptr inbounds %struct.macroblock* %654, i32 0, i32 33, !dbg !2908
  %656 = load i32* %655, align 4, !dbg !2908
  %657 = icmp sge i32 %653, %656, !dbg !2908
  %658 = zext i1 %657 to i32, !dbg !2908
  %659 = load i32* %all_in, align 4, !dbg !2908
  %660 = and i32 %659, %658, !dbg !2908
  store i32 %660, i32* %all_in, align 4, !dbg !2908
  %661 = load i32* %br, align 4, !dbg !2908
  %662 = add nsw i32 %661, 1, !dbg !2908
  %663 = load %struct.macroblock** %1, align 8, !dbg !2908
  %664 = getelementptr inbounds %struct.macroblock* %663, i32 0, i32 34, !dbg !2908
  %665 = load i32* %664, align 4, !dbg !2908
  %666 = icmp sle i32 %662, %665, !dbg !2908
  %667 = zext i1 %666 to i32, !dbg !2908
  %668 = load i32* %all_in, align 4, !dbg !2908
  %669 = and i32 %668, %667, !dbg !2908
  store i32 %669, i32* %all_in, align 4, !dbg !2908
  %670 = load i32* %bc, align 4, !dbg !2908
  %671 = sub nsw i32 %670, 1, !dbg !2908
  %672 = load %struct.macroblock** %1, align 8, !dbg !2908
  %673 = getelementptr inbounds %struct.macroblock* %672, i32 0, i32 31, !dbg !2908
  %674 = load i32* %673, align 4, !dbg !2908
  %675 = icmp sge i32 %671, %674, !dbg !2908
  %676 = zext i1 %675 to i32, !dbg !2908
  %677 = load i32* %all_in, align 4, !dbg !2908
  %678 = and i32 %677, %676, !dbg !2908
  store i32 %678, i32* %all_in, align 4, !dbg !2908
  %679 = load i32* %bc, align 4, !dbg !2908
  %680 = add nsw i32 %679, 1, !dbg !2908
  %681 = load %struct.macroblock** %1, align 8, !dbg !2908
  %682 = getelementptr inbounds %struct.macroblock* %681, i32 0, i32 32, !dbg !2908
  %683 = load i32* %682, align 4, !dbg !2908
  %684 = icmp sle i32 %680, %683, !dbg !2908
  %685 = zext i1 %684 to i32, !dbg !2908
  %686 = load i32* %all_in, align 4, !dbg !2908
  %687 = and i32 %686, %685, !dbg !2908
  store i32 %687, i32* %all_in, align 4, !dbg !2908
  %688 = load i32* %all_in, align 4, !dbg !2910
  %689 = icmp ne i32 %688, 0, !dbg !2912
  br i1 %689, label %690, label %762, !dbg !2912

; <label>:690                                     ; preds = %651
  store i32 0, i32* %i, align 4, !dbg !2913
  br label %691, !dbg !2913

; <label>:691                                     ; preds = %758, %690
  %692 = load i32* %i, align 4, !dbg !2916
  %693 = icmp slt i32 %692, 4, !dbg !2916
  br i1 %693, label %694, label %761, !dbg !2920

; <label>:694                                     ; preds = %691
  %695 = load i32* %br, align 4, !dbg !2921
  %696 = load i32* %i, align 4, !dbg !2923
  %697 = sext i32 %696 to i64, !dbg !2924
  %698 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %697, !dbg !2924
  %699 = getelementptr inbounds %struct.MV* %698, i32 0, i32 0, !dbg !2924
  %700 = load i16* %699, align 2, !dbg !2924
  %701 = sext i16 %700 to i32, !dbg !2924
  %702 = add nsw i32 %695, %701, !dbg !2921
  %703 = trunc i32 %702 to i16, !dbg !2921
  %704 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2925
  %705 = getelementptr inbounds %struct.MV* %704, i32 0, i32 0, !dbg !2925
  store i16 %703, i16* %705, align 2, !dbg !2925
  %706 = load i32* %bc, align 4, !dbg !2926
  %707 = load i32* %i, align 4, !dbg !2927
  %708 = sext i32 %707 to i64, !dbg !2928
  %709 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %708, !dbg !2928
  %710 = getelementptr inbounds %struct.MV* %709, i32 0, i32 1, !dbg !2928
  %711 = load i16* %710, align 2, !dbg !2928
  %712 = sext i16 %711 to i32, !dbg !2928
  %713 = add nsw i32 %706, %712, !dbg !2926
  %714 = trunc i32 %713 to i16, !dbg !2926
  %715 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2929
  %716 = getelementptr inbounds %struct.MV* %715, i32 0, i32 1, !dbg !2929
  store i16 %714, i16* %716, align 2, !dbg !2929
  %717 = load i8** %base_offset, align 8, !dbg !2930
  %718 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2931
  %719 = getelementptr inbounds %struct.MV* %718, i32 0, i32 0, !dbg !2931
  %720 = load i16* %719, align 2, !dbg !2931
  %721 = sext i16 %720 to i32, !dbg !2931
  %722 = load i32* %in_what_stride, align 4, !dbg !2932
  %723 = mul nsw i32 %721, %722, !dbg !2931
  %724 = sext i32 %723 to i64, !dbg !2930
  %725 = getelementptr inbounds i8* %717, i64 %724, !dbg !2930
  %726 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2933
  %727 = getelementptr inbounds %struct.MV* %726, i32 0, i32 1, !dbg !2933
  %728 = load i16* %727, align 2, !dbg !2933
  %729 = sext i16 %728 to i32, !dbg !2933
  %730 = sext i32 %729 to i64, !dbg !2930
  %731 = getelementptr inbounds i8* %725, i64 %730, !dbg !2930
  store i8* %731, i8** %this_offset, align 8, !dbg !2934
  %732 = load %struct.variance_vtable** %8, align 8, !dbg !2935
  %733 = getelementptr inbounds %struct.variance_vtable* %732, i32 0, i32 0, !dbg !2935
  %734 = load i32 (i8*, i32, i8*, i32, i32)** %733, align 8, !dbg !2935
  %735 = load i8** %what, align 8, !dbg !2936
  %736 = load i32* %what_stride, align 4, !dbg !2937
  %737 = load i8** %this_offset, align 8, !dbg !2938
  %738 = load i32* %in_what_stride, align 4, !dbg !2939
  %739 = load i32* %bestsad, align 4, !dbg !2940
  %740 = call i32 %734(i8* %735, i32 %736, i8* %737, i32 %738, i32 %739), !dbg !2935
  store i32 %740, i32* %thissad, align 4, !dbg !2941
  %741 = load i32* %thissad, align 4, !dbg !2942
  %742 = load i32* %bestsad, align 4, !dbg !2942
  %743 = icmp ult i32 %741, %742, !dbg !2942
  br i1 %743, label %744, label %757, !dbg !2945

; <label>:744                                     ; preds = %694
  %745 = load i32*** %9, align 8, !dbg !2946
  %746 = load i32* %7, align 4, !dbg !2946
  %747 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %745, i32 %746), !dbg !2946
  %748 = load i32* %thissad, align 4, !dbg !2946
  %749 = add i32 %748, %747, !dbg !2946
  store i32 %749, i32* %thissad, align 4, !dbg !2946
  %750 = load i32* %thissad, align 4, !dbg !2949
  %751 = load i32* %bestsad, align 4, !dbg !2949
  %752 = icmp ult i32 %750, %751, !dbg !2949
  br i1 %752, label %753, label %756, !dbg !2951

; <label>:753                                     ; preds = %744
  %754 = load i32* %thissad, align 4, !dbg !2952
  store i32 %754, i32* %bestsad, align 4, !dbg !2952
  %755 = load i32* %i, align 4, !dbg !2952
  store i32 %755, i32* %best_site, align 4, !dbg !2952
  br label %756, !dbg !2952

; <label>:756                                     ; preds = %753, %744
  br label %757, !dbg !2955

; <label>:757                                     ; preds = %756, %694
  br label %758, !dbg !2958

; <label>:758                                     ; preds = %757
  %759 = load i32* %i, align 4, !dbg !2959
  %760 = add nsw i32 %759, 1, !dbg !2959
  store i32 %760, i32* %i, align 4, !dbg !2959
  br label %691, !dbg !2960

; <label>:761                                     ; preds = %691
  br label %874, !dbg !2961

; <label>:762                                     ; preds = %651
  store i32 0, i32* %i, align 4, !dbg !2962
  br label %763, !dbg !2962

; <label>:763                                     ; preds = %870, %762
  %764 = load i32* %i, align 4, !dbg !2965
  %765 = icmp slt i32 %764, 4, !dbg !2965
  br i1 %765, label %766, label %873, !dbg !2969

; <label>:766                                     ; preds = %763
  %767 = load i32* %br, align 4, !dbg !2970
  %768 = load i32* %i, align 4, !dbg !2972
  %769 = sext i32 %768 to i64, !dbg !2973
  %770 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %769, !dbg !2973
  %771 = getelementptr inbounds %struct.MV* %770, i32 0, i32 0, !dbg !2973
  %772 = load i16* %771, align 2, !dbg !2973
  %773 = sext i16 %772 to i32, !dbg !2973
  %774 = add nsw i32 %767, %773, !dbg !2970
  %775 = trunc i32 %774 to i16, !dbg !2970
  %776 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2974
  %777 = getelementptr inbounds %struct.MV* %776, i32 0, i32 0, !dbg !2974
  store i16 %775, i16* %777, align 2, !dbg !2974
  %778 = load i32* %bc, align 4, !dbg !2975
  %779 = load i32* %i, align 4, !dbg !2976
  %780 = sext i32 %779 to i64, !dbg !2977
  %781 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %780, !dbg !2977
  %782 = getelementptr inbounds %struct.MV* %781, i32 0, i32 1, !dbg !2977
  %783 = load i16* %782, align 2, !dbg !2977
  %784 = sext i16 %783 to i32, !dbg !2977
  %785 = add nsw i32 %778, %784, !dbg !2975
  %786 = trunc i32 %785 to i16, !dbg !2975
  %787 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2978
  %788 = getelementptr inbounds %struct.MV* %787, i32 0, i32 1, !dbg !2978
  store i16 %786, i16* %788, align 2, !dbg !2978
  %789 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2979
  %790 = getelementptr inbounds %struct.MV* %789, i32 0, i32 1, !dbg !2979
  %791 = load i16* %790, align 2, !dbg !2979
  %792 = sext i16 %791 to i32, !dbg !2979
  %793 = load %struct.macroblock** %1, align 8, !dbg !2979
  %794 = getelementptr inbounds %struct.macroblock* %793, i32 0, i32 31, !dbg !2979
  %795 = load i32* %794, align 4, !dbg !2979
  %796 = icmp slt i32 %792, %795, !dbg !2979
  br i1 %796, label %797, label %798, !dbg !2982

; <label>:797                                     ; preds = %766
  br label %870, !dbg !2983

; <label>:798                                     ; preds = %766
  %799 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2985
  %800 = getelementptr inbounds %struct.MV* %799, i32 0, i32 1, !dbg !2985
  %801 = load i16* %800, align 2, !dbg !2985
  %802 = sext i16 %801 to i32, !dbg !2985
  %803 = load %struct.macroblock** %1, align 8, !dbg !2985
  %804 = getelementptr inbounds %struct.macroblock* %803, i32 0, i32 32, !dbg !2985
  %805 = load i32* %804, align 4, !dbg !2985
  %806 = icmp sgt i32 %802, %805, !dbg !2985
  br i1 %806, label %807, label %808, !dbg !2982

; <label>:807                                     ; preds = %798
  br label %870, !dbg !2988

; <label>:808                                     ; preds = %798
  %809 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2990
  %810 = getelementptr inbounds %struct.MV* %809, i32 0, i32 0, !dbg !2990
  %811 = load i16* %810, align 2, !dbg !2990
  %812 = sext i16 %811 to i32, !dbg !2990
  %813 = load %struct.macroblock** %1, align 8, !dbg !2990
  %814 = getelementptr inbounds %struct.macroblock* %813, i32 0, i32 33, !dbg !2990
  %815 = load i32* %814, align 4, !dbg !2990
  %816 = icmp slt i32 %812, %815, !dbg !2990
  br i1 %816, label %817, label %818, !dbg !2982

; <label>:817                                     ; preds = %808
  br label %870, !dbg !2993

; <label>:818                                     ; preds = %808
  %819 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2995
  %820 = getelementptr inbounds %struct.MV* %819, i32 0, i32 0, !dbg !2995
  %821 = load i16* %820, align 2, !dbg !2995
  %822 = sext i16 %821 to i32, !dbg !2995
  %823 = load %struct.macroblock** %1, align 8, !dbg !2995
  %824 = getelementptr inbounds %struct.macroblock* %823, i32 0, i32 34, !dbg !2995
  %825 = load i32* %824, align 4, !dbg !2995
  %826 = icmp sgt i32 %822, %825, !dbg !2995
  br i1 %826, label %827, label %828, !dbg !2982

; <label>:827                                     ; preds = %818
  br label %870, !dbg !2998

; <label>:828                                     ; preds = %818
  %829 = load i8** %base_offset, align 8, !dbg !3000
  %830 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3001
  %831 = getelementptr inbounds %struct.MV* %830, i32 0, i32 0, !dbg !3001
  %832 = load i16* %831, align 2, !dbg !3001
  %833 = sext i16 %832 to i32, !dbg !3001
  %834 = load i32* %in_what_stride, align 4, !dbg !3002
  %835 = mul nsw i32 %833, %834, !dbg !3001
  %836 = sext i32 %835 to i64, !dbg !3000
  %837 = getelementptr inbounds i8* %829, i64 %836, !dbg !3000
  %838 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3003
  %839 = getelementptr inbounds %struct.MV* %838, i32 0, i32 1, !dbg !3003
  %840 = load i16* %839, align 2, !dbg !3003
  %841 = sext i16 %840 to i32, !dbg !3003
  %842 = sext i32 %841 to i64, !dbg !3000
  %843 = getelementptr inbounds i8* %837, i64 %842, !dbg !3000
  store i8* %843, i8** %this_offset, align 8, !dbg !3004
  %844 = load %struct.variance_vtable** %8, align 8, !dbg !3005
  %845 = getelementptr inbounds %struct.variance_vtable* %844, i32 0, i32 0, !dbg !3005
  %846 = load i32 (i8*, i32, i8*, i32, i32)** %845, align 8, !dbg !3005
  %847 = load i8** %what, align 8, !dbg !3006
  %848 = load i32* %what_stride, align 4, !dbg !3007
  %849 = load i8** %this_offset, align 8, !dbg !3008
  %850 = load i32* %in_what_stride, align 4, !dbg !3009
  %851 = load i32* %bestsad, align 4, !dbg !3010
  %852 = call i32 %846(i8* %847, i32 %848, i8* %849, i32 %850, i32 %851), !dbg !3005
  store i32 %852, i32* %thissad, align 4, !dbg !3011
  %853 = load i32* %thissad, align 4, !dbg !3012
  %854 = load i32* %bestsad, align 4, !dbg !3012
  %855 = icmp ult i32 %853, %854, !dbg !3012
  br i1 %855, label %856, label %869, !dbg !3015

; <label>:856                                     ; preds = %828
  %857 = load i32*** %9, align 8, !dbg !3016
  %858 = load i32* %7, align 4, !dbg !3016
  %859 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %857, i32 %858), !dbg !3016
  %860 = load i32* %thissad, align 4, !dbg !3016
  %861 = add i32 %860, %859, !dbg !3016
  store i32 %861, i32* %thissad, align 4, !dbg !3016
  %862 = load i32* %thissad, align 4, !dbg !3019
  %863 = load i32* %bestsad, align 4, !dbg !3019
  %864 = icmp ult i32 %862, %863, !dbg !3019
  br i1 %864, label %865, label %868, !dbg !3021

; <label>:865                                     ; preds = %856
  %866 = load i32* %thissad, align 4, !dbg !3022
  store i32 %866, i32* %bestsad, align 4, !dbg !3022
  %867 = load i32* %i, align 4, !dbg !3022
  store i32 %867, i32* %best_site, align 4, !dbg !3022
  br label %868, !dbg !3022

; <label>:868                                     ; preds = %865, %856
  br label %869, !dbg !3025

; <label>:869                                     ; preds = %868, %828
  br label %870, !dbg !3028

; <label>:870                                     ; preds = %869, %827, %817, %807, %797
  %871 = load i32* %i, align 4, !dbg !3029
  %872 = add nsw i32 %871, 1, !dbg !3029
  store i32 %872, i32* %i, align 4, !dbg !3029
  br label %763, !dbg !3030

; <label>:873                                     ; preds = %763
  br label %874

; <label>:874                                     ; preds = %873, %761
  %875 = load i32* %best_site, align 4, !dbg !3031
  %876 = icmp eq i32 %875, -1, !dbg !3031
  br i1 %876, label %877, label %878, !dbg !3033

; <label>:877                                     ; preds = %874
  br label %899, !dbg !3034

; <label>:878                                     ; preds = %874
  %879 = load i32* %best_site, align 4, !dbg !3035
  %880 = sext i32 %879 to i64, !dbg !3037
  %881 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %880, !dbg !3037
  %882 = getelementptr inbounds %struct.MV* %881, i32 0, i32 0, !dbg !3037
  %883 = load i16* %882, align 2, !dbg !3037
  %884 = sext i16 %883 to i32, !dbg !3037
  %885 = load i32* %br, align 4, !dbg !3038
  %886 = add nsw i32 %885, %884, !dbg !3038
  store i32 %886, i32* %br, align 4, !dbg !3038
  %887 = load i32* %best_site, align 4, !dbg !3039
  %888 = sext i32 %887 to i64, !dbg !3040
  %889 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %888, !dbg !3040
  %890 = getelementptr inbounds %struct.MV* %889, i32 0, i32 1, !dbg !3040
  %891 = load i16* %890, align 2, !dbg !3040
  %892 = sext i16 %891 to i32, !dbg !3040
  %893 = load i32* %bc, align 4, !dbg !3041
  %894 = add nsw i32 %893, %892, !dbg !3041
  store i32 %894, i32* %bc, align 4, !dbg !3041
  br label %895

; <label>:895                                     ; preds = %878
  br label %896, !dbg !3042

; <label>:896                                     ; preds = %895
  %897 = load i32* %j, align 4, !dbg !3043
  %898 = add nsw i32 %897, 1, !dbg !3043
  store i32 %898, i32* %j, align 4, !dbg !3043
  br label %647, !dbg !3044

; <label>:899                                     ; preds = %877, %647
  %900 = load i32* %br, align 4, !dbg !3045
  %901 = trunc i32 %900 to i16, !dbg !3045
  %902 = load %union.int_mv** %5, align 8, !dbg !3046
  %903 = bitcast %union.int_mv* %902 to %struct.MV*, !dbg !3046
  %904 = getelementptr inbounds %struct.MV* %903, i32 0, i32 0, !dbg !3046
  store i16 %901, i16* %904, align 2, !dbg !3046
  %905 = load i32* %bc, align 4, !dbg !3047
  %906 = trunc i32 %905 to i16, !dbg !3047
  %907 = load %union.int_mv** %5, align 8, !dbg !3048
  %908 = bitcast %union.int_mv* %907 to %struct.MV*, !dbg !3048
  %909 = getelementptr inbounds %struct.MV* %908, i32 0, i32 1, !dbg !3048
  store i16 %906, i16* %909, align 2, !dbg !3048
  %910 = load i32* %bestsad, align 4, !dbg !3049
  ret i32 %910, !dbg !3050
}

; Function Attrs: nounwind uwtable
define internal void @vp8_clamp_mv(%union.int_mv* %mv, i32 %mb_to_left_edge, i32 %mb_to_right_edge, i32 %mb_to_top_edge, i32 %mb_to_bottom_edge) #0 {
  %1 = alloca %union.int_mv*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %union.int_mv* %mv, %union.int_mv** %1, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %1, metadata !3051, metadata !506), !dbg !3052
  store i32 %mb_to_left_edge, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !3053, metadata !506), !dbg !3054
  store i32 %mb_to_right_edge, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !3055, metadata !506), !dbg !3056
  store i32 %mb_to_top_edge, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !3057, metadata !506), !dbg !3058
  store i32 %mb_to_bottom_edge, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !3059, metadata !506), !dbg !3060
  %6 = load %union.int_mv** %1, align 8, !dbg !3061
  %7 = bitcast %union.int_mv* %6 to %struct.MV*, !dbg !3061
  %8 = getelementptr inbounds %struct.MV* %7, i32 0, i32 1, !dbg !3061
  %9 = load i16* %8, align 2, !dbg !3061
  %10 = sext i16 %9 to i32, !dbg !3061
  %11 = load i32* %2, align 4, !dbg !3062
  %12 = icmp slt i32 %10, %11, !dbg !3061
  br i1 %12, label %13, label %15, !dbg !3063

; <label>:13                                      ; preds = %0
  %14 = load i32* %2, align 4, !dbg !3064
  br label %21, !dbg !3063

; <label>:15                                      ; preds = %0
  %16 = load %union.int_mv** %1, align 8, !dbg !3065
  %17 = bitcast %union.int_mv* %16 to %struct.MV*, !dbg !3065
  %18 = getelementptr inbounds %struct.MV* %17, i32 0, i32 1, !dbg !3065
  %19 = load i16* %18, align 2, !dbg !3065
  %20 = sext i16 %19 to i32, !dbg !3065
  br label %21, !dbg !3063

; <label>:21                                      ; preds = %15, %13
  %22 = phi i32 [ %14, %13 ], [ %20, %15 ], !dbg !3063
  %23 = trunc i32 %22 to i16, !dbg !3066
  %24 = load %union.int_mv** %1, align 8, !dbg !3069
  %25 = bitcast %union.int_mv* %24 to %struct.MV*, !dbg !3069
  %26 = getelementptr inbounds %struct.MV* %25, i32 0, i32 1, !dbg !3069
  store i16 %23, i16* %26, align 2, !dbg !3069
  %27 = load %union.int_mv** %1, align 8, !dbg !3070
  %28 = bitcast %union.int_mv* %27 to %struct.MV*, !dbg !3070
  %29 = getelementptr inbounds %struct.MV* %28, i32 0, i32 1, !dbg !3070
  %30 = load i16* %29, align 2, !dbg !3070
  %31 = sext i16 %30 to i32, !dbg !3070
  %32 = load i32* %3, align 4, !dbg !3071
  %33 = icmp sgt i32 %31, %32, !dbg !3070
  br i1 %33, label %34, label %36, !dbg !3072

; <label>:34                                      ; preds = %21
  %35 = load i32* %3, align 4, !dbg !3073
  br label %42, !dbg !3072

; <label>:36                                      ; preds = %21
  %37 = load %union.int_mv** %1, align 8, !dbg !3074
  %38 = bitcast %union.int_mv* %37 to %struct.MV*, !dbg !3074
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 1, !dbg !3074
  %40 = load i16* %39, align 2, !dbg !3074
  %41 = sext i16 %40 to i32, !dbg !3074
  br label %42, !dbg !3072

; <label>:42                                      ; preds = %36, %34
  %43 = phi i32 [ %35, %34 ], [ %41, %36 ], !dbg !3072
  %44 = trunc i32 %43 to i16, !dbg !3075
  %45 = load %union.int_mv** %1, align 8, !dbg !3076
  %46 = bitcast %union.int_mv* %45 to %struct.MV*, !dbg !3076
  %47 = getelementptr inbounds %struct.MV* %46, i32 0, i32 1, !dbg !3076
  store i16 %44, i16* %47, align 2, !dbg !3076
  %48 = load %union.int_mv** %1, align 8, !dbg !3077
  %49 = bitcast %union.int_mv* %48 to %struct.MV*, !dbg !3077
  %50 = getelementptr inbounds %struct.MV* %49, i32 0, i32 0, !dbg !3077
  %51 = load i16* %50, align 2, !dbg !3077
  %52 = sext i16 %51 to i32, !dbg !3077
  %53 = load i32* %4, align 4, !dbg !3078
  %54 = icmp slt i32 %52, %53, !dbg !3077
  br i1 %54, label %55, label %57, !dbg !3079

; <label>:55                                      ; preds = %42
  %56 = load i32* %4, align 4, !dbg !3080
  br label %63, !dbg !3079

; <label>:57                                      ; preds = %42
  %58 = load %union.int_mv** %1, align 8, !dbg !3081
  %59 = bitcast %union.int_mv* %58 to %struct.MV*, !dbg !3081
  %60 = getelementptr inbounds %struct.MV* %59, i32 0, i32 0, !dbg !3081
  %61 = load i16* %60, align 2, !dbg !3081
  %62 = sext i16 %61 to i32, !dbg !3081
  br label %63, !dbg !3079

; <label>:63                                      ; preds = %57, %55
  %64 = phi i32 [ %56, %55 ], [ %62, %57 ], !dbg !3079
  %65 = trunc i32 %64 to i16, !dbg !3082
  %66 = load %union.int_mv** %1, align 8, !dbg !3083
  %67 = bitcast %union.int_mv* %66 to %struct.MV*, !dbg !3083
  %68 = getelementptr inbounds %struct.MV* %67, i32 0, i32 0, !dbg !3083
  store i16 %65, i16* %68, align 2, !dbg !3083
  %69 = load %union.int_mv** %1, align 8, !dbg !3084
  %70 = bitcast %union.int_mv* %69 to %struct.MV*, !dbg !3084
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 0, !dbg !3084
  %72 = load i16* %71, align 2, !dbg !3084
  %73 = sext i16 %72 to i32, !dbg !3084
  %74 = load i32* %5, align 4, !dbg !3085
  %75 = icmp sgt i32 %73, %74, !dbg !3084
  br i1 %75, label %76, label %78, !dbg !3086

; <label>:76                                      ; preds = %63
  %77 = load i32* %5, align 4, !dbg !3087
  br label %84, !dbg !3086

; <label>:78                                      ; preds = %63
  %79 = load %union.int_mv** %1, align 8, !dbg !3088
  %80 = bitcast %union.int_mv* %79 to %struct.MV*, !dbg !3088
  %81 = getelementptr inbounds %struct.MV* %80, i32 0, i32 0, !dbg !3088
  %82 = load i16* %81, align 2, !dbg !3088
  %83 = sext i16 %82 to i32, !dbg !3088
  br label %84, !dbg !3086

; <label>:84                                      ; preds = %78, %76
  %85 = phi i32 [ %77, %76 ], [ %83, %78 ], !dbg !3086
  %86 = trunc i32 %85 to i16, !dbg !3089
  %87 = load %union.int_mv** %1, align 8, !dbg !3090
  %88 = bitcast %union.int_mv* %87 to %struct.MV*, !dbg !3090
  %89 = getelementptr inbounds %struct.MV* %88, i32 0, i32 0, !dbg !3090
  store i16 %86, i16* %89, align 2, !dbg !3090
  ret void, !dbg !3091
}

; Function Attrs: nounwind uwtable
define internal i32 @mvsad_err_cost(%union.int_mv* %mv, %union.int_mv* %ref, i32** %mvsadcost, i32 %error_per_bit) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %union.int_mv*, align 8
  %3 = alloca %union.int_mv*, align 8
  %4 = alloca i32**, align 8
  %5 = alloca i32, align 4
  store %union.int_mv* %mv, %union.int_mv** %2, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %2, metadata !3092, metadata !506), !dbg !3093
  store %union.int_mv* %ref, %union.int_mv** %3, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %3, metadata !3094, metadata !506), !dbg !3095
  store i32** %mvsadcost, i32*** %4, align 8
  call void @llvm.dbg.declare(metadata i32*** %4, metadata !3096, metadata !506), !dbg !3097
  store i32 %error_per_bit, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !3098, metadata !506), !dbg !3099
  %6 = load i32*** %4, align 8, !dbg !3100
  %7 = icmp ne i32** %6, null, !dbg !3102
  br i1 %7, label %8, label %48, !dbg !3102

; <label>:8                                       ; preds = %0
  %9 = load %union.int_mv** %2, align 8, !dbg !3103
  %10 = bitcast %union.int_mv* %9 to %struct.MV*, !dbg !3103
  %11 = getelementptr inbounds %struct.MV* %10, i32 0, i32 0, !dbg !3103
  %12 = load i16* %11, align 2, !dbg !3103
  %13 = sext i16 %12 to i32, !dbg !3103
  %14 = load %union.int_mv** %3, align 8, !dbg !3104
  %15 = bitcast %union.int_mv* %14 to %struct.MV*, !dbg !3104
  %16 = getelementptr inbounds %struct.MV* %15, i32 0, i32 0, !dbg !3104
  %17 = load i16* %16, align 2, !dbg !3104
  %18 = sext i16 %17 to i32, !dbg !3104
  %19 = sub nsw i32 %13, %18, !dbg !3103
  %20 = sext i32 %19 to i64, !dbg !3105
  %21 = load i32*** %4, align 8, !dbg !3105
  %22 = getelementptr inbounds i32** %21, i64 0, !dbg !3105
  %23 = load i32** %22, align 8, !dbg !3105
  %24 = getelementptr inbounds i32* %23, i64 %20, !dbg !3105
  %25 = load i32* %24, align 4, !dbg !3105
  %26 = load %union.int_mv** %2, align 8, !dbg !3106
  %27 = bitcast %union.int_mv* %26 to %struct.MV*, !dbg !3106
  %28 = getelementptr inbounds %struct.MV* %27, i32 0, i32 1, !dbg !3106
  %29 = load i16* %28, align 2, !dbg !3106
  %30 = sext i16 %29 to i32, !dbg !3106
  %31 = load %union.int_mv** %3, align 8, !dbg !3107
  %32 = bitcast %union.int_mv* %31 to %struct.MV*, !dbg !3107
  %33 = getelementptr inbounds %struct.MV* %32, i32 0, i32 1, !dbg !3107
  %34 = load i16* %33, align 2, !dbg !3107
  %35 = sext i16 %34 to i32, !dbg !3107
  %36 = sub nsw i32 %30, %35, !dbg !3106
  %37 = sext i32 %36 to i64, !dbg !3108
  %38 = load i32*** %4, align 8, !dbg !3108
  %39 = getelementptr inbounds i32** %38, i64 1, !dbg !3108
  %40 = load i32** %39, align 8, !dbg !3108
  %41 = getelementptr inbounds i32* %40, i64 %37, !dbg !3108
  %42 = load i32* %41, align 4, !dbg !3108
  %43 = add nsw i32 %25, %42, !dbg !3105
  %44 = load i32* %5, align 4, !dbg !3109
  %45 = mul nsw i32 %43, %44, !dbg !3110
  %46 = add nsw i32 %45, 128, !dbg !3110
  %47 = ashr i32 %46, 8, !dbg !3111
  store i32 %47, i32* %1, !dbg !3112
  br label %49, !dbg !3112

; <label>:48                                      ; preds = %0
  store i32 0, i32* %1, !dbg !3113
  br label %49, !dbg !3113

; <label>:49                                      ; preds = %48, %8
  %50 = load i32* %1, !dbg !3114
  ret i32 %50, !dbg !3114
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
  call void @llvm.dbg.declare(metadata %struct.macroblock** %1, metadata !3115, metadata !506), !dbg !3116
  store %struct.block* %b, %struct.block** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.block** %2, metadata !3117, metadata !506), !dbg !3118
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.blockd** %3, metadata !3119, metadata !506), !dbg !3120
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %4, metadata !3121, metadata !506), !dbg !3122
  store %union.int_mv* %best_mv, %union.int_mv** %5, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %5, metadata !3123, metadata !506), !dbg !3124
  store i32 %search_param, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !3125, metadata !506), !dbg !3126
  store i32 %sad_per_bit, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !3127, metadata !506), !dbg !3128
  store i32* %num00, i32** %8, align 8
  call void @llvm.dbg.declare(metadata i32** %8, metadata !3129, metadata !506), !dbg !3130
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %9, align 8
  call void @llvm.dbg.declare(metadata %struct.variance_vtable** %9, metadata !3131, metadata !506), !dbg !3132
  store i32** %mvcost, i32*** %10, align 8
  call void @llvm.dbg.declare(metadata i32*** %10, metadata !3133, metadata !506), !dbg !3134
  store %union.int_mv* %center_mv, %union.int_mv** %11, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %11, metadata !3135, metadata !506), !dbg !3136
  call void @llvm.dbg.declare(metadata i32* %i, metadata !3137, metadata !506), !dbg !3138
  call void @llvm.dbg.declare(metadata i32* %j, metadata !3139, metadata !506), !dbg !3140
  call void @llvm.dbg.declare(metadata i32* %step, metadata !3141, metadata !506), !dbg !3142
  call void @llvm.dbg.declare(metadata i8** %what, metadata !3143, metadata !506), !dbg !3144
  %12 = load %struct.block** %2, align 8, !dbg !3145
  %13 = getelementptr inbounds %struct.block* %12, i32 0, i32 9, !dbg !3145
  %14 = load i8*** %13, align 8, !dbg !3145
  %15 = load i8** %14, align 8, !dbg !3146
  %16 = load %struct.block** %2, align 8, !dbg !3147
  %17 = getelementptr inbounds %struct.block* %16, i32 0, i32 10, !dbg !3147
  %18 = load i32* %17, align 4, !dbg !3147
  %19 = sext i32 %18 to i64, !dbg !3146
  %20 = getelementptr inbounds i8* %15, i64 %19, !dbg !3146
  store i8* %20, i8** %what, align 8, !dbg !3144
  call void @llvm.dbg.declare(metadata i32* %what_stride, metadata !3148, metadata !506), !dbg !3149
  %21 = load %struct.block** %2, align 8, !dbg !3150
  %22 = getelementptr inbounds %struct.block* %21, i32 0, i32 11, !dbg !3150
  %23 = load i32* %22, align 4, !dbg !3150
  store i32 %23, i32* %what_stride, align 4, !dbg !3149
  call void @llvm.dbg.declare(metadata i8** %in_what, metadata !3151, metadata !506), !dbg !3152
  call void @llvm.dbg.declare(metadata i32* %pre_stride, metadata !3153, metadata !506), !dbg !3154
  %24 = load %struct.macroblock** %1, align 8, !dbg !3155
  %25 = getelementptr inbounds %struct.macroblock* %24, i32 0, i32 7, !dbg !3155
  %26 = getelementptr inbounds %struct.macroblockd* %25, i32 0, i32 11, !dbg !3155
  %27 = getelementptr inbounds %struct.yv12_buffer_config* %26, i32 0, i32 4, !dbg !3155
  %28 = load i32* %27, align 4, !dbg !3155
  store i32 %28, i32* %pre_stride, align 4, !dbg !3154
  call void @llvm.dbg.declare(metadata i8** %base_pre, metadata !3156, metadata !506), !dbg !3157
  %29 = load %struct.macroblock** %1, align 8, !dbg !3158
  %30 = getelementptr inbounds %struct.macroblock* %29, i32 0, i32 7, !dbg !3158
  %31 = getelementptr inbounds %struct.macroblockd* %30, i32 0, i32 11, !dbg !3158
  %32 = getelementptr inbounds %struct.yv12_buffer_config* %31, i32 0, i32 13, !dbg !3158
  %33 = load i8** %32, align 8, !dbg !3158
  store i8* %33, i8** %base_pre, align 8, !dbg !3157
  call void @llvm.dbg.declare(metadata i32* %in_what_stride, metadata !3159, metadata !506), !dbg !3160
  %34 = load i32* %pre_stride, align 4, !dbg !3161
  store i32 %34, i32* %in_what_stride, align 4, !dbg !3160
  call void @llvm.dbg.declare(metadata i8** %best_address, metadata !3162, metadata !506), !dbg !3163
  call void @llvm.dbg.declare(metadata i32* %tot_steps, metadata !3164, metadata !506), !dbg !3165
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !3166, metadata !506), !dbg !3167
  call void @llvm.dbg.declare(metadata i32* %bestsad, metadata !3168, metadata !506), !dbg !3169
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !3170, metadata !506), !dbg !3171
  call void @llvm.dbg.declare(metadata i32* %best_site, metadata !3172, metadata !506), !dbg !3173
  store i32 0, i32* %best_site, align 4, !dbg !3173
  call void @llvm.dbg.declare(metadata i32* %last_site, metadata !3174, metadata !506), !dbg !3175
  store i32 0, i32* %last_site, align 4, !dbg !3175
  call void @llvm.dbg.declare(metadata i32* %ref_row, metadata !3176, metadata !506), !dbg !3177
  call void @llvm.dbg.declare(metadata i32* %ref_col, metadata !3178, metadata !506), !dbg !3179
  call void @llvm.dbg.declare(metadata i32* %this_row_offset, metadata !3180, metadata !506), !dbg !3181
  call void @llvm.dbg.declare(metadata i32* %this_col_offset, metadata !3182, metadata !506), !dbg !3183
  call void @llvm.dbg.declare(metadata %struct.search_site** %ss, metadata !3184, metadata !506), !dbg !3185
  call void @llvm.dbg.declare(metadata i8** %check_here, metadata !3186, metadata !506), !dbg !3187
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !3188, metadata !506), !dbg !3189
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !3190, metadata !506), !dbg !3191
  %35 = load %struct.macroblock** %1, align 8, !dbg !3192
  %36 = getelementptr inbounds %struct.macroblock* %35, i32 0, i32 25, !dbg !3192
  %37 = getelementptr inbounds [2 x i32*]* %36, i32 0, i64 0, !dbg !3192
  %38 = load i32** %37, align 8, !dbg !3192
  %39 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !3193
  store i32* %38, i32** %39, align 8, !dbg !3193
  %40 = load %struct.macroblock** %1, align 8, !dbg !3194
  %41 = getelementptr inbounds %struct.macroblock* %40, i32 0, i32 25, !dbg !3194
  %42 = getelementptr inbounds [2 x i32*]* %41, i32 0, i64 1, !dbg !3194
  %43 = load i32** %42, align 8, !dbg !3194
  %44 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !3195
  store i32* %43, i32** %44, align 8, !dbg !3195
  %45 = load %union.int_mv** %11, align 8, !dbg !3196
  %46 = bitcast %union.int_mv* %45 to %struct.MV*, !dbg !3196
  %47 = getelementptr inbounds %struct.MV* %46, i32 0, i32 0, !dbg !3196
  %48 = load i16* %47, align 2, !dbg !3196
  %49 = sext i16 %48 to i32, !dbg !3196
  %50 = ashr i32 %49, 3, !dbg !3196
  %51 = trunc i32 %50 to i16, !dbg !3196
  %52 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3197
  %53 = getelementptr inbounds %struct.MV* %52, i32 0, i32 0, !dbg !3197
  store i16 %51, i16* %53, align 2, !dbg !3197
  %54 = load %union.int_mv** %11, align 8, !dbg !3198
  %55 = bitcast %union.int_mv* %54 to %struct.MV*, !dbg !3198
  %56 = getelementptr inbounds %struct.MV* %55, i32 0, i32 1, !dbg !3198
  %57 = load i16* %56, align 2, !dbg !3198
  %58 = sext i16 %57 to i32, !dbg !3198
  %59 = ashr i32 %58, 3, !dbg !3198
  %60 = trunc i32 %59 to i16, !dbg !3198
  %61 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3199
  %62 = getelementptr inbounds %struct.MV* %61, i32 0, i32 1, !dbg !3199
  store i16 %60, i16* %62, align 2, !dbg !3199
  %63 = load %union.int_mv** %4, align 8, !dbg !3200
  %64 = load %struct.macroblock** %1, align 8, !dbg !3201
  %65 = getelementptr inbounds %struct.macroblock* %64, i32 0, i32 31, !dbg !3201
  %66 = load i32* %65, align 4, !dbg !3201
  %67 = load %struct.macroblock** %1, align 8, !dbg !3202
  %68 = getelementptr inbounds %struct.macroblock* %67, i32 0, i32 32, !dbg !3202
  %69 = load i32* %68, align 4, !dbg !3202
  %70 = load %struct.macroblock** %1, align 8, !dbg !3203
  %71 = getelementptr inbounds %struct.macroblock* %70, i32 0, i32 33, !dbg !3203
  %72 = load i32* %71, align 4, !dbg !3203
  %73 = load %struct.macroblock** %1, align 8, !dbg !3204
  %74 = getelementptr inbounds %struct.macroblock* %73, i32 0, i32 34, !dbg !3204
  %75 = load i32* %74, align 4, !dbg !3204
  call void @vp8_clamp_mv(%union.int_mv* %63, i32 %66, i32 %69, i32 %72, i32 %75), !dbg !3205
  %76 = load %union.int_mv** %4, align 8, !dbg !3206
  %77 = bitcast %union.int_mv* %76 to %struct.MV*, !dbg !3206
  %78 = getelementptr inbounds %struct.MV* %77, i32 0, i32 0, !dbg !3206
  %79 = load i16* %78, align 2, !dbg !3206
  %80 = sext i16 %79 to i32, !dbg !3206
  store i32 %80, i32* %ref_row, align 4, !dbg !3207
  %81 = load %union.int_mv** %4, align 8, !dbg !3208
  %82 = bitcast %union.int_mv* %81 to %struct.MV*, !dbg !3208
  %83 = getelementptr inbounds %struct.MV* %82, i32 0, i32 1, !dbg !3208
  %84 = load i16* %83, align 2, !dbg !3208
  %85 = sext i16 %84 to i32, !dbg !3208
  store i32 %85, i32* %ref_col, align 4, !dbg !3209
  %86 = load i32** %8, align 8, !dbg !3210
  store i32 0, i32* %86, align 4, !dbg !3211
  %87 = load i32* %ref_row, align 4, !dbg !3212
  %88 = trunc i32 %87 to i16, !dbg !3212
  %89 = load %union.int_mv** %5, align 8, !dbg !3213
  %90 = bitcast %union.int_mv* %89 to %struct.MV*, !dbg !3213
  %91 = getelementptr inbounds %struct.MV* %90, i32 0, i32 0, !dbg !3213
  store i16 %88, i16* %91, align 2, !dbg !3213
  %92 = load i32* %ref_col, align 4, !dbg !3214
  %93 = trunc i32 %92 to i16, !dbg !3214
  %94 = load %union.int_mv** %5, align 8, !dbg !3215
  %95 = bitcast %union.int_mv* %94 to %struct.MV*, !dbg !3215
  %96 = getelementptr inbounds %struct.MV* %95, i32 0, i32 1, !dbg !3215
  store i16 %93, i16* %96, align 2, !dbg !3215
  %97 = load i8** %base_pre, align 8, !dbg !3216
  %98 = load %struct.blockd** %3, align 8, !dbg !3217
  %99 = getelementptr inbounds %struct.blockd* %98, i32 0, i32 4, !dbg !3217
  %100 = load i32* %99, align 4, !dbg !3217
  %101 = sext i32 %100 to i64, !dbg !3216
  %102 = getelementptr inbounds i8* %97, i64 %101, !dbg !3216
  %103 = load i32* %ref_row, align 4, !dbg !3218
  %104 = load i32* %pre_stride, align 4, !dbg !3219
  %105 = mul nsw i32 %103, %104, !dbg !3218
  %106 = sext i32 %105 to i64, !dbg !3216
  %107 = getelementptr inbounds i8* %102, i64 %106, !dbg !3216
  %108 = load i32* %ref_col, align 4, !dbg !3220
  %109 = sext i32 %108 to i64, !dbg !3216
  %110 = getelementptr inbounds i8* %107, i64 %109, !dbg !3216
  store i8* %110, i8** %in_what, align 8, !dbg !3221
  %111 = load i8** %in_what, align 8, !dbg !3222
  store i8* %111, i8** %best_address, align 8, !dbg !3223
  %112 = load %struct.variance_vtable** %9, align 8, !dbg !3224
  %113 = getelementptr inbounds %struct.variance_vtable* %112, i32 0, i32 0, !dbg !3224
  %114 = load i32 (i8*, i32, i8*, i32, i32)** %113, align 8, !dbg !3224
  %115 = load i8** %what, align 8, !dbg !3225
  %116 = load i32* %what_stride, align 4, !dbg !3226
  %117 = load i8** %in_what, align 8, !dbg !3227
  %118 = load i32* %in_what_stride, align 4, !dbg !3228
  %119 = call i32 %114(i8* %115, i32 %116, i8* %117, i32 %118, i32 -1), !dbg !3224
  %120 = load %union.int_mv** %5, align 8, !dbg !3229
  %121 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3230
  %122 = load i32* %7, align 4, !dbg !3231
  %123 = call i32 @mvsad_err_cost(%union.int_mv* %120, %union.int_mv* %fcenter_mv, i32** %121, i32 %122), !dbg !3232
  %124 = add i32 %119, %123, !dbg !3224
  store i32 %124, i32* %bestsad, align 4, !dbg !3233
  %125 = load i32* %6, align 4, !dbg !3234
  %126 = load %struct.macroblock** %1, align 8, !dbg !3235
  %127 = getelementptr inbounds %struct.macroblock* %126, i32 0, i32 14, !dbg !3235
  %128 = load i32* %127, align 4, !dbg !3235
  %129 = mul nsw i32 %125, %128, !dbg !3234
  %130 = sext i32 %129 to i64, !dbg !3236
  %131 = load %struct.macroblock** %1, align 8, !dbg !3237
  %132 = getelementptr inbounds %struct.macroblock* %131, i32 0, i32 12, !dbg !3237
  %133 = load %struct.search_site** %132, align 8, !dbg !3237
  %134 = getelementptr inbounds %struct.search_site* %133, i64 %130, !dbg !3236
  store %struct.search_site* %134, %struct.search_site** %ss, align 8, !dbg !3238
  %135 = load %struct.macroblock** %1, align 8, !dbg !3239
  %136 = getelementptr inbounds %struct.macroblock* %135, i32 0, i32 13, !dbg !3239
  %137 = load i32* %136, align 4, !dbg !3239
  %138 = load %struct.macroblock** %1, align 8, !dbg !3240
  %139 = getelementptr inbounds %struct.macroblock* %138, i32 0, i32 14, !dbg !3240
  %140 = load i32* %139, align 4, !dbg !3240
  %141 = sdiv i32 %137, %140, !dbg !3239
  %142 = load i32* %6, align 4, !dbg !3241
  %143 = sub nsw i32 %141, %142, !dbg !3242
  store i32 %143, i32* %tot_steps, align 4, !dbg !3243
  store i32 1, i32* %i, align 4, !dbg !3244
  store i32 0, i32* %step, align 4, !dbg !3245
  br label %144, !dbg !3245

; <label>:144                                     ; preds = %312, %0
  %145 = load i32* %step, align 4, !dbg !3247
  %146 = load i32* %tot_steps, align 4, !dbg !3251
  %147 = icmp slt i32 %145, %146, !dbg !3252
  br i1 %147, label %148, label %315, !dbg !3253

; <label>:148                                     ; preds = %144
  store i32 0, i32* %j, align 4, !dbg !3254
  br label %149, !dbg !3254

; <label>:149                                     ; preds = %254, %148
  %150 = load i32* %j, align 4, !dbg !3257
  %151 = load %struct.macroblock** %1, align 8, !dbg !3261
  %152 = getelementptr inbounds %struct.macroblock* %151, i32 0, i32 14, !dbg !3261
  %153 = load i32* %152, align 4, !dbg !3261
  %154 = icmp slt i32 %150, %153, !dbg !3262
  br i1 %154, label %155, label %257, !dbg !3263

; <label>:155                                     ; preds = %149
  %156 = load %union.int_mv** %5, align 8, !dbg !3264
  %157 = bitcast %union.int_mv* %156 to %struct.MV*, !dbg !3264
  %158 = getelementptr inbounds %struct.MV* %157, i32 0, i32 0, !dbg !3264
  %159 = load i16* %158, align 2, !dbg !3264
  %160 = sext i16 %159 to i32, !dbg !3264
  %161 = load i32* %i, align 4, !dbg !3266
  %162 = sext i32 %161 to i64, !dbg !3267
  %163 = load %struct.search_site** %ss, align 8, !dbg !3267
  %164 = getelementptr inbounds %struct.search_site* %163, i64 %162, !dbg !3267
  %165 = getelementptr inbounds %struct.search_site* %164, i32 0, i32 0, !dbg !3267
  %166 = getelementptr inbounds %struct.MV* %165, i32 0, i32 0, !dbg !3267
  %167 = load i16* %166, align 2, !dbg !3267
  %168 = sext i16 %167 to i32, !dbg !3267
  %169 = add nsw i32 %160, %168, !dbg !3264
  store i32 %169, i32* %this_row_offset, align 4, !dbg !3268
  %170 = load %union.int_mv** %5, align 8, !dbg !3269
  %171 = bitcast %union.int_mv* %170 to %struct.MV*, !dbg !3269
  %172 = getelementptr inbounds %struct.MV* %171, i32 0, i32 1, !dbg !3269
  %173 = load i16* %172, align 2, !dbg !3269
  %174 = sext i16 %173 to i32, !dbg !3269
  %175 = load i32* %i, align 4, !dbg !3270
  %176 = sext i32 %175 to i64, !dbg !3271
  %177 = load %struct.search_site** %ss, align 8, !dbg !3271
  %178 = getelementptr inbounds %struct.search_site* %177, i64 %176, !dbg !3271
  %179 = getelementptr inbounds %struct.search_site* %178, i32 0, i32 0, !dbg !3271
  %180 = getelementptr inbounds %struct.MV* %179, i32 0, i32 1, !dbg !3271
  %181 = load i16* %180, align 2, !dbg !3271
  %182 = sext i16 %181 to i32, !dbg !3271
  %183 = add nsw i32 %174, %182, !dbg !3269
  store i32 %183, i32* %this_col_offset, align 4, !dbg !3272
  %184 = load i32* %this_col_offset, align 4, !dbg !3273
  %185 = load %struct.macroblock** %1, align 8, !dbg !3275
  %186 = getelementptr inbounds %struct.macroblock* %185, i32 0, i32 31, !dbg !3275
  %187 = load i32* %186, align 4, !dbg !3275
  %188 = icmp sgt i32 %184, %187, !dbg !3273
  br i1 %188, label %189, label %251, !dbg !3276

; <label>:189                                     ; preds = %155
  %190 = load i32* %this_col_offset, align 4, !dbg !3277
  %191 = load %struct.macroblock** %1, align 8, !dbg !3279
  %192 = getelementptr inbounds %struct.macroblock* %191, i32 0, i32 32, !dbg !3279
  %193 = load i32* %192, align 4, !dbg !3279
  %194 = icmp slt i32 %190, %193, !dbg !3280
  br i1 %194, label %195, label %251, !dbg !3276

; <label>:195                                     ; preds = %189
  %196 = load i32* %this_row_offset, align 4, !dbg !3281
  %197 = load %struct.macroblock** %1, align 8, !dbg !3282
  %198 = getelementptr inbounds %struct.macroblock* %197, i32 0, i32 33, !dbg !3282
  %199 = load i32* %198, align 4, !dbg !3282
  %200 = icmp sgt i32 %196, %199, !dbg !3281
  br i1 %200, label %201, label %251, !dbg !3276

; <label>:201                                     ; preds = %195
  %202 = load i32* %this_row_offset, align 4, !dbg !3283
  %203 = load %struct.macroblock** %1, align 8, !dbg !3284
  %204 = getelementptr inbounds %struct.macroblock* %203, i32 0, i32 34, !dbg !3284
  %205 = load i32* %204, align 4, !dbg !3284
  %206 = icmp slt i32 %202, %205, !dbg !3283
  br i1 %206, label %207, label %251, !dbg !3276

; <label>:207                                     ; preds = %201
  %208 = load i32* %i, align 4, !dbg !3285
  %209 = sext i32 %208 to i64, !dbg !3287
  %210 = load %struct.search_site** %ss, align 8, !dbg !3287
  %211 = getelementptr inbounds %struct.search_site* %210, i64 %209, !dbg !3287
  %212 = getelementptr inbounds %struct.search_site* %211, i32 0, i32 1, !dbg !3287
  %213 = load i32* %212, align 4, !dbg !3287
  %214 = load i8** %best_address, align 8, !dbg !3288
  %215 = sext i32 %213 to i64, !dbg !3287
  %216 = getelementptr inbounds i8* %214, i64 %215, !dbg !3287
  store i8* %216, i8** %check_here, align 8, !dbg !3289
  %217 = load %struct.variance_vtable** %9, align 8, !dbg !3290
  %218 = getelementptr inbounds %struct.variance_vtable* %217, i32 0, i32 0, !dbg !3290
  %219 = load i32 (i8*, i32, i8*, i32, i32)** %218, align 8, !dbg !3290
  %220 = load i8** %what, align 8, !dbg !3291
  %221 = load i32* %what_stride, align 4, !dbg !3292
  %222 = load i8** %check_here, align 8, !dbg !3293
  %223 = load i32* %in_what_stride, align 4, !dbg !3294
  %224 = load i32* %bestsad, align 4, !dbg !3295
  %225 = call i32 %219(i8* %220, i32 %221, i8* %222, i32 %223, i32 %224), !dbg !3290
  store i32 %225, i32* %thissad, align 4, !dbg !3296
  %226 = load i32* %thissad, align 4, !dbg !3297
  %227 = load i32* %bestsad, align 4, !dbg !3299
  %228 = icmp ult i32 %226, %227, !dbg !3297
  br i1 %228, label %229, label %250, !dbg !3300

; <label>:229                                     ; preds = %207
  %230 = load i32* %this_row_offset, align 4, !dbg !3301
  %231 = trunc i32 %230 to i16, !dbg !3301
  %232 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3303
  %233 = getelementptr inbounds %struct.MV* %232, i32 0, i32 0, !dbg !3303
  store i16 %231, i16* %233, align 2, !dbg !3303
  %234 = load i32* %this_col_offset, align 4, !dbg !3304
  %235 = trunc i32 %234 to i16, !dbg !3304
  %236 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3305
  %237 = getelementptr inbounds %struct.MV* %236, i32 0, i32 1, !dbg !3305
  store i16 %235, i16* %237, align 2, !dbg !3305
  %238 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3306
  %239 = load i32* %7, align 4, !dbg !3307
  %240 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %238, i32 %239), !dbg !3308
  %241 = load i32* %thissad, align 4, !dbg !3309
  %242 = add i32 %241, %240, !dbg !3309
  store i32 %242, i32* %thissad, align 4, !dbg !3309
  %243 = load i32* %thissad, align 4, !dbg !3310
  %244 = load i32* %bestsad, align 4, !dbg !3312
  %245 = icmp ult i32 %243, %244, !dbg !3310
  br i1 %245, label %246, label %249, !dbg !3313

; <label>:246                                     ; preds = %229
  %247 = load i32* %thissad, align 4, !dbg !3314
  store i32 %247, i32* %bestsad, align 4, !dbg !3316
  %248 = load i32* %i, align 4, !dbg !3317
  store i32 %248, i32* %best_site, align 4, !dbg !3318
  br label %249, !dbg !3319

; <label>:249                                     ; preds = %246, %229
  br label %250, !dbg !3320

; <label>:250                                     ; preds = %249, %207
  br label %251, !dbg !3321

; <label>:251                                     ; preds = %250, %201, %195, %189, %155
  %252 = load i32* %i, align 4, !dbg !3322
  %253 = add nsw i32 %252, 1, !dbg !3322
  store i32 %253, i32* %i, align 4, !dbg !3322
  br label %254, !dbg !3323

; <label>:254                                     ; preds = %251
  %255 = load i32* %j, align 4, !dbg !3324
  %256 = add nsw i32 %255, 1, !dbg !3324
  store i32 %256, i32* %j, align 4, !dbg !3324
  br label %149, !dbg !3325

; <label>:257                                     ; preds = %149
  %258 = load i32* %best_site, align 4, !dbg !3326
  %259 = load i32* %last_site, align 4, !dbg !3328
  %260 = icmp ne i32 %258, %259, !dbg !3326
  br i1 %260, label %261, label %302, !dbg !3329

; <label>:261                                     ; preds = %257
  %262 = load i32* %best_site, align 4, !dbg !3330
  %263 = sext i32 %262 to i64, !dbg !3332
  %264 = load %struct.search_site** %ss, align 8, !dbg !3332
  %265 = getelementptr inbounds %struct.search_site* %264, i64 %263, !dbg !3332
  %266 = getelementptr inbounds %struct.search_site* %265, i32 0, i32 0, !dbg !3332
  %267 = getelementptr inbounds %struct.MV* %266, i32 0, i32 0, !dbg !3332
  %268 = load i16* %267, align 2, !dbg !3332
  %269 = sext i16 %268 to i32, !dbg !3332
  %270 = load %union.int_mv** %5, align 8, !dbg !3333
  %271 = bitcast %union.int_mv* %270 to %struct.MV*, !dbg !3333
  %272 = getelementptr inbounds %struct.MV* %271, i32 0, i32 0, !dbg !3333
  %273 = load i16* %272, align 2, !dbg !3333
  %274 = sext i16 %273 to i32, !dbg !3333
  %275 = add nsw i32 %274, %269, !dbg !3333
  %276 = trunc i32 %275 to i16, !dbg !3333
  store i16 %276, i16* %272, align 2, !dbg !3333
  %277 = load i32* %best_site, align 4, !dbg !3334
  %278 = sext i32 %277 to i64, !dbg !3335
  %279 = load %struct.search_site** %ss, align 8, !dbg !3335
  %280 = getelementptr inbounds %struct.search_site* %279, i64 %278, !dbg !3335
  %281 = getelementptr inbounds %struct.search_site* %280, i32 0, i32 0, !dbg !3335
  %282 = getelementptr inbounds %struct.MV* %281, i32 0, i32 1, !dbg !3335
  %283 = load i16* %282, align 2, !dbg !3335
  %284 = sext i16 %283 to i32, !dbg !3335
  %285 = load %union.int_mv** %5, align 8, !dbg !3336
  %286 = bitcast %union.int_mv* %285 to %struct.MV*, !dbg !3336
  %287 = getelementptr inbounds %struct.MV* %286, i32 0, i32 1, !dbg !3336
  %288 = load i16* %287, align 2, !dbg !3336
  %289 = sext i16 %288 to i32, !dbg !3336
  %290 = add nsw i32 %289, %284, !dbg !3336
  %291 = trunc i32 %290 to i16, !dbg !3336
  store i16 %291, i16* %287, align 2, !dbg !3336
  %292 = load i32* %best_site, align 4, !dbg !3337
  %293 = sext i32 %292 to i64, !dbg !3338
  %294 = load %struct.search_site** %ss, align 8, !dbg !3338
  %295 = getelementptr inbounds %struct.search_site* %294, i64 %293, !dbg !3338
  %296 = getelementptr inbounds %struct.search_site* %295, i32 0, i32 1, !dbg !3338
  %297 = load i32* %296, align 4, !dbg !3338
  %298 = load i8** %best_address, align 8, !dbg !3339
  %299 = sext i32 %297 to i64, !dbg !3339
  %300 = getelementptr inbounds i8* %298, i64 %299, !dbg !3339
  store i8* %300, i8** %best_address, align 8, !dbg !3339
  %301 = load i32* %best_site, align 4, !dbg !3340
  store i32 %301, i32* %last_site, align 4, !dbg !3341
  br label %311, !dbg !3342

; <label>:302                                     ; preds = %257
  %303 = load i8** %best_address, align 8, !dbg !3343
  %304 = load i8** %in_what, align 8, !dbg !3345
  %305 = icmp eq i8* %303, %304, !dbg !3343
  br i1 %305, label %306, label %310, !dbg !3346

; <label>:306                                     ; preds = %302
  %307 = load i32** %8, align 8, !dbg !3347
  %308 = load i32* %307, align 4, !dbg !3348
  %309 = add nsw i32 %308, 1, !dbg !3348
  store i32 %309, i32* %307, align 4, !dbg !3348
  br label %310, !dbg !3348

; <label>:310                                     ; preds = %306, %302
  br label %311

; <label>:311                                     ; preds = %310, %261
  br label %312, !dbg !3349

; <label>:312                                     ; preds = %311
  %313 = load i32* %step, align 4, !dbg !3350
  %314 = add nsw i32 %313, 1, !dbg !3350
  store i32 %314, i32* %step, align 4, !dbg !3350
  br label %144, !dbg !3351

; <label>:315                                     ; preds = %144
  %316 = load %union.int_mv** %5, align 8, !dbg !3352
  %317 = bitcast %union.int_mv* %316 to %struct.MV*, !dbg !3352
  %318 = getelementptr inbounds %struct.MV* %317, i32 0, i32 0, !dbg !3352
  %319 = load i16* %318, align 2, !dbg !3352
  %320 = sext i16 %319 to i32, !dbg !3352
  %321 = shl i32 %320, 3, !dbg !3352
  %322 = trunc i32 %321 to i16, !dbg !3352
  %323 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3353
  %324 = getelementptr inbounds %struct.MV* %323, i32 0, i32 0, !dbg !3353
  store i16 %322, i16* %324, align 2, !dbg !3353
  %325 = load %union.int_mv** %5, align 8, !dbg !3354
  %326 = bitcast %union.int_mv* %325 to %struct.MV*, !dbg !3354
  %327 = getelementptr inbounds %struct.MV* %326, i32 0, i32 1, !dbg !3354
  %328 = load i16* %327, align 2, !dbg !3354
  %329 = sext i16 %328 to i32, !dbg !3354
  %330 = shl i32 %329, 3, !dbg !3354
  %331 = trunc i32 %330 to i16, !dbg !3354
  %332 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3355
  %333 = getelementptr inbounds %struct.MV* %332, i32 0, i32 1, !dbg !3355
  store i16 %331, i16* %333, align 2, !dbg !3355
  %334 = load %struct.variance_vtable** %9, align 8, !dbg !3356
  %335 = getelementptr inbounds %struct.variance_vtable* %334, i32 0, i32 1, !dbg !3356
  %336 = load i32 (i8*, i32, i8*, i32, i32*)** %335, align 8, !dbg !3356
  %337 = load i8** %what, align 8, !dbg !3357
  %338 = load i32* %what_stride, align 4, !dbg !3358
  %339 = load i8** %best_address, align 8, !dbg !3359
  %340 = load i32* %in_what_stride, align 4, !dbg !3360
  %341 = call i32 %336(i8* %337, i32 %338, i8* %339, i32 %340, i32* %thissad), !dbg !3356
  %342 = load %union.int_mv** %11, align 8, !dbg !3361
  %343 = load i32*** %10, align 8, !dbg !3362
  %344 = load %struct.macroblock** %1, align 8, !dbg !3363
  %345 = getelementptr inbounds %struct.macroblock* %344, i32 0, i32 15, !dbg !3363
  %346 = load i32* %345, align 4, !dbg !3363
  %347 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %342, i32** %343, i32 %346), !dbg !3364
  %348 = add i32 %341, %347, !dbg !3356
  ret i32 %348, !dbg !3365
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
  call void @llvm.dbg.declare(metadata %struct.macroblock** %1, metadata !3366, metadata !506), !dbg !3367
  store %struct.block* %b, %struct.block** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.block** %2, metadata !3368, metadata !506), !dbg !3369
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.blockd** %3, metadata !3370, metadata !506), !dbg !3371
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %4, metadata !3372, metadata !506), !dbg !3373
  store %union.int_mv* %best_mv, %union.int_mv** %5, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %5, metadata !3374, metadata !506), !dbg !3375
  store i32 %search_param, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !3376, metadata !506), !dbg !3377
  store i32 %sad_per_bit, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !3378, metadata !506), !dbg !3379
  store i32* %num00, i32** %8, align 8
  call void @llvm.dbg.declare(metadata i32** %8, metadata !3380, metadata !506), !dbg !3381
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %9, align 8
  call void @llvm.dbg.declare(metadata %struct.variance_vtable** %9, metadata !3382, metadata !506), !dbg !3383
  store i32** %mvcost, i32*** %10, align 8
  call void @llvm.dbg.declare(metadata i32*** %10, metadata !3384, metadata !506), !dbg !3385
  store %union.int_mv* %center_mv, %union.int_mv** %11, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %11, metadata !3386, metadata !506), !dbg !3387
  call void @llvm.dbg.declare(metadata i32* %i, metadata !3388, metadata !506), !dbg !3389
  call void @llvm.dbg.declare(metadata i32* %j, metadata !3390, metadata !506), !dbg !3391
  call void @llvm.dbg.declare(metadata i32* %step, metadata !3392, metadata !506), !dbg !3393
  call void @llvm.dbg.declare(metadata i8** %what, metadata !3394, metadata !506), !dbg !3395
  %12 = load %struct.block** %2, align 8, !dbg !3396
  %13 = getelementptr inbounds %struct.block* %12, i32 0, i32 9, !dbg !3396
  %14 = load i8*** %13, align 8, !dbg !3396
  %15 = load i8** %14, align 8, !dbg !3397
  %16 = load %struct.block** %2, align 8, !dbg !3398
  %17 = getelementptr inbounds %struct.block* %16, i32 0, i32 10, !dbg !3398
  %18 = load i32* %17, align 4, !dbg !3398
  %19 = sext i32 %18 to i64, !dbg !3397
  %20 = getelementptr inbounds i8* %15, i64 %19, !dbg !3397
  store i8* %20, i8** %what, align 8, !dbg !3395
  call void @llvm.dbg.declare(metadata i32* %what_stride, metadata !3399, metadata !506), !dbg !3400
  %21 = load %struct.block** %2, align 8, !dbg !3401
  %22 = getelementptr inbounds %struct.block* %21, i32 0, i32 11, !dbg !3401
  %23 = load i32* %22, align 4, !dbg !3401
  store i32 %23, i32* %what_stride, align 4, !dbg !3400
  call void @llvm.dbg.declare(metadata i8** %in_what, metadata !3402, metadata !506), !dbg !3403
  call void @llvm.dbg.declare(metadata i32* %pre_stride, metadata !3404, metadata !506), !dbg !3405
  %24 = load %struct.macroblock** %1, align 8, !dbg !3406
  %25 = getelementptr inbounds %struct.macroblock* %24, i32 0, i32 7, !dbg !3406
  %26 = getelementptr inbounds %struct.macroblockd* %25, i32 0, i32 11, !dbg !3406
  %27 = getelementptr inbounds %struct.yv12_buffer_config* %26, i32 0, i32 4, !dbg !3406
  %28 = load i32* %27, align 4, !dbg !3406
  store i32 %28, i32* %pre_stride, align 4, !dbg !3405
  call void @llvm.dbg.declare(metadata i8** %base_pre, metadata !3407, metadata !506), !dbg !3408
  %29 = load %struct.macroblock** %1, align 8, !dbg !3409
  %30 = getelementptr inbounds %struct.macroblock* %29, i32 0, i32 7, !dbg !3409
  %31 = getelementptr inbounds %struct.macroblockd* %30, i32 0, i32 11, !dbg !3409
  %32 = getelementptr inbounds %struct.yv12_buffer_config* %31, i32 0, i32 13, !dbg !3409
  %33 = load i8** %32, align 8, !dbg !3409
  store i8* %33, i8** %base_pre, align 8, !dbg !3408
  call void @llvm.dbg.declare(metadata i32* %in_what_stride, metadata !3410, metadata !506), !dbg !3411
  %34 = load i32* %pre_stride, align 4, !dbg !3412
  store i32 %34, i32* %in_what_stride, align 4, !dbg !3411
  call void @llvm.dbg.declare(metadata i8** %best_address, metadata !3413, metadata !506), !dbg !3414
  call void @llvm.dbg.declare(metadata i32* %tot_steps, metadata !3415, metadata !506), !dbg !3416
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !3417, metadata !506), !dbg !3418
  call void @llvm.dbg.declare(metadata i32* %bestsad, metadata !3419, metadata !506), !dbg !3420
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !3421, metadata !506), !dbg !3422
  call void @llvm.dbg.declare(metadata i32* %best_site, metadata !3423, metadata !506), !dbg !3424
  store i32 0, i32* %best_site, align 4, !dbg !3424
  call void @llvm.dbg.declare(metadata i32* %last_site, metadata !3425, metadata !506), !dbg !3426
  store i32 0, i32* %last_site, align 4, !dbg !3426
  call void @llvm.dbg.declare(metadata i32* %ref_row, metadata !3427, metadata !506), !dbg !3428
  call void @llvm.dbg.declare(metadata i32* %ref_col, metadata !3429, metadata !506), !dbg !3430
  call void @llvm.dbg.declare(metadata i32* %this_row_offset, metadata !3431, metadata !506), !dbg !3432
  call void @llvm.dbg.declare(metadata i32* %this_col_offset, metadata !3433, metadata !506), !dbg !3434
  call void @llvm.dbg.declare(metadata %struct.search_site** %ss, metadata !3435, metadata !506), !dbg !3436
  call void @llvm.dbg.declare(metadata i8** %check_here, metadata !3437, metadata !506), !dbg !3438
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !3439, metadata !506), !dbg !3440
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !3441, metadata !506), !dbg !3442
  %35 = load %struct.macroblock** %1, align 8, !dbg !3443
  %36 = getelementptr inbounds %struct.macroblock* %35, i32 0, i32 25, !dbg !3443
  %37 = getelementptr inbounds [2 x i32*]* %36, i32 0, i64 0, !dbg !3443
  %38 = load i32** %37, align 8, !dbg !3443
  %39 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !3444
  store i32* %38, i32** %39, align 8, !dbg !3444
  %40 = load %struct.macroblock** %1, align 8, !dbg !3445
  %41 = getelementptr inbounds %struct.macroblock* %40, i32 0, i32 25, !dbg !3445
  %42 = getelementptr inbounds [2 x i32*]* %41, i32 0, i64 1, !dbg !3445
  %43 = load i32** %42, align 8, !dbg !3445
  %44 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !3446
  store i32* %43, i32** %44, align 8, !dbg !3446
  %45 = load %union.int_mv** %11, align 8, !dbg !3447
  %46 = bitcast %union.int_mv* %45 to %struct.MV*, !dbg !3447
  %47 = getelementptr inbounds %struct.MV* %46, i32 0, i32 0, !dbg !3447
  %48 = load i16* %47, align 2, !dbg !3447
  %49 = sext i16 %48 to i32, !dbg !3447
  %50 = ashr i32 %49, 3, !dbg !3447
  %51 = trunc i32 %50 to i16, !dbg !3447
  %52 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3448
  %53 = getelementptr inbounds %struct.MV* %52, i32 0, i32 0, !dbg !3448
  store i16 %51, i16* %53, align 2, !dbg !3448
  %54 = load %union.int_mv** %11, align 8, !dbg !3449
  %55 = bitcast %union.int_mv* %54 to %struct.MV*, !dbg !3449
  %56 = getelementptr inbounds %struct.MV* %55, i32 0, i32 1, !dbg !3449
  %57 = load i16* %56, align 2, !dbg !3449
  %58 = sext i16 %57 to i32, !dbg !3449
  %59 = ashr i32 %58, 3, !dbg !3449
  %60 = trunc i32 %59 to i16, !dbg !3449
  %61 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3450
  %62 = getelementptr inbounds %struct.MV* %61, i32 0, i32 1, !dbg !3450
  store i16 %60, i16* %62, align 2, !dbg !3450
  %63 = load %union.int_mv** %4, align 8, !dbg !3451
  %64 = load %struct.macroblock** %1, align 8, !dbg !3452
  %65 = getelementptr inbounds %struct.macroblock* %64, i32 0, i32 31, !dbg !3452
  %66 = load i32* %65, align 4, !dbg !3452
  %67 = load %struct.macroblock** %1, align 8, !dbg !3453
  %68 = getelementptr inbounds %struct.macroblock* %67, i32 0, i32 32, !dbg !3453
  %69 = load i32* %68, align 4, !dbg !3453
  %70 = load %struct.macroblock** %1, align 8, !dbg !3454
  %71 = getelementptr inbounds %struct.macroblock* %70, i32 0, i32 33, !dbg !3454
  %72 = load i32* %71, align 4, !dbg !3454
  %73 = load %struct.macroblock** %1, align 8, !dbg !3455
  %74 = getelementptr inbounds %struct.macroblock* %73, i32 0, i32 34, !dbg !3455
  %75 = load i32* %74, align 4, !dbg !3455
  call void @vp8_clamp_mv(%union.int_mv* %63, i32 %66, i32 %69, i32 %72, i32 %75), !dbg !3456
  %76 = load %union.int_mv** %4, align 8, !dbg !3457
  %77 = bitcast %union.int_mv* %76 to %struct.MV*, !dbg !3457
  %78 = getelementptr inbounds %struct.MV* %77, i32 0, i32 0, !dbg !3457
  %79 = load i16* %78, align 2, !dbg !3457
  %80 = sext i16 %79 to i32, !dbg !3457
  store i32 %80, i32* %ref_row, align 4, !dbg !3458
  %81 = load %union.int_mv** %4, align 8, !dbg !3459
  %82 = bitcast %union.int_mv* %81 to %struct.MV*, !dbg !3459
  %83 = getelementptr inbounds %struct.MV* %82, i32 0, i32 1, !dbg !3459
  %84 = load i16* %83, align 2, !dbg !3459
  %85 = sext i16 %84 to i32, !dbg !3459
  store i32 %85, i32* %ref_col, align 4, !dbg !3460
  %86 = load i32** %8, align 8, !dbg !3461
  store i32 0, i32* %86, align 4, !dbg !3462
  %87 = load i32* %ref_row, align 4, !dbg !3463
  %88 = trunc i32 %87 to i16, !dbg !3463
  %89 = load %union.int_mv** %5, align 8, !dbg !3464
  %90 = bitcast %union.int_mv* %89 to %struct.MV*, !dbg !3464
  %91 = getelementptr inbounds %struct.MV* %90, i32 0, i32 0, !dbg !3464
  store i16 %88, i16* %91, align 2, !dbg !3464
  %92 = load i32* %ref_col, align 4, !dbg !3465
  %93 = trunc i32 %92 to i16, !dbg !3465
  %94 = load %union.int_mv** %5, align 8, !dbg !3466
  %95 = bitcast %union.int_mv* %94 to %struct.MV*, !dbg !3466
  %96 = getelementptr inbounds %struct.MV* %95, i32 0, i32 1, !dbg !3466
  store i16 %93, i16* %96, align 2, !dbg !3466
  %97 = load i8** %base_pre, align 8, !dbg !3467
  %98 = load %struct.blockd** %3, align 8, !dbg !3468
  %99 = getelementptr inbounds %struct.blockd* %98, i32 0, i32 4, !dbg !3468
  %100 = load i32* %99, align 4, !dbg !3468
  %101 = sext i32 %100 to i64, !dbg !3467
  %102 = getelementptr inbounds i8* %97, i64 %101, !dbg !3467
  %103 = load i32* %ref_row, align 4, !dbg !3469
  %104 = load i32* %pre_stride, align 4, !dbg !3470
  %105 = mul nsw i32 %103, %104, !dbg !3469
  %106 = sext i32 %105 to i64, !dbg !3467
  %107 = getelementptr inbounds i8* %102, i64 %106, !dbg !3467
  %108 = load i32* %ref_col, align 4, !dbg !3471
  %109 = sext i32 %108 to i64, !dbg !3467
  %110 = getelementptr inbounds i8* %107, i64 %109, !dbg !3467
  store i8* %110, i8** %in_what, align 8, !dbg !3472
  %111 = load i8** %in_what, align 8, !dbg !3473
  store i8* %111, i8** %best_address, align 8, !dbg !3474
  %112 = load %struct.variance_vtable** %9, align 8, !dbg !3475
  %113 = getelementptr inbounds %struct.variance_vtable* %112, i32 0, i32 0, !dbg !3475
  %114 = load i32 (i8*, i32, i8*, i32, i32)** %113, align 8, !dbg !3475
  %115 = load i8** %what, align 8, !dbg !3476
  %116 = load i32* %what_stride, align 4, !dbg !3477
  %117 = load i8** %in_what, align 8, !dbg !3478
  %118 = load i32* %in_what_stride, align 4, !dbg !3479
  %119 = call i32 %114(i8* %115, i32 %116, i8* %117, i32 %118, i32 -1), !dbg !3475
  %120 = load %union.int_mv** %5, align 8, !dbg !3480
  %121 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3481
  %122 = load i32* %7, align 4, !dbg !3482
  %123 = call i32 @mvsad_err_cost(%union.int_mv* %120, %union.int_mv* %fcenter_mv, i32** %121, i32 %122), !dbg !3483
  %124 = add i32 %119, %123, !dbg !3475
  store i32 %124, i32* %bestsad, align 4, !dbg !3484
  %125 = load i32* %6, align 4, !dbg !3485
  %126 = load %struct.macroblock** %1, align 8, !dbg !3486
  %127 = getelementptr inbounds %struct.macroblock* %126, i32 0, i32 14, !dbg !3486
  %128 = load i32* %127, align 4, !dbg !3486
  %129 = mul nsw i32 %125, %128, !dbg !3485
  %130 = sext i32 %129 to i64, !dbg !3487
  %131 = load %struct.macroblock** %1, align 8, !dbg !3488
  %132 = getelementptr inbounds %struct.macroblock* %131, i32 0, i32 12, !dbg !3488
  %133 = load %struct.search_site** %132, align 8, !dbg !3488
  %134 = getelementptr inbounds %struct.search_site* %133, i64 %130, !dbg !3487
  store %struct.search_site* %134, %struct.search_site** %ss, align 8, !dbg !3489
  %135 = load %struct.macroblock** %1, align 8, !dbg !3490
  %136 = getelementptr inbounds %struct.macroblock* %135, i32 0, i32 13, !dbg !3490
  %137 = load i32* %136, align 4, !dbg !3490
  %138 = load %struct.macroblock** %1, align 8, !dbg !3491
  %139 = getelementptr inbounds %struct.macroblock* %138, i32 0, i32 14, !dbg !3491
  %140 = load i32* %139, align 4, !dbg !3491
  %141 = sdiv i32 %137, %140, !dbg !3490
  %142 = load i32* %6, align 4, !dbg !3492
  %143 = sub nsw i32 %141, %142, !dbg !3493
  store i32 %143, i32* %tot_steps, align 4, !dbg !3494
  store i32 1, i32* %i, align 4, !dbg !3495
  store i32 0, i32* %step, align 4, !dbg !3496
  br label %144, !dbg !3496

; <label>:144                                     ; preds = %518, %0
  %145 = load i32* %step, align 4, !dbg !3498
  %146 = load i32* %tot_steps, align 4, !dbg !3502
  %147 = icmp slt i32 %145, %146, !dbg !3503
  br i1 %147, label %148, label %521, !dbg !3504

; <label>:148                                     ; preds = %144
  call void @llvm.dbg.declare(metadata i32* %all_in, metadata !3505, metadata !506), !dbg !3507
  store i32 1, i32* %all_in, align 4, !dbg !3507
  call void @llvm.dbg.declare(metadata i32* %t, metadata !3508, metadata !506), !dbg !3509
  %149 = load %union.int_mv** %5, align 8, !dbg !3510
  %150 = bitcast %union.int_mv* %149 to %struct.MV*, !dbg !3510
  %151 = getelementptr inbounds %struct.MV* %150, i32 0, i32 0, !dbg !3510
  %152 = load i16* %151, align 2, !dbg !3510
  %153 = sext i16 %152 to i32, !dbg !3510
  %154 = load i32* %i, align 4, !dbg !3511
  %155 = sext i32 %154 to i64, !dbg !3512
  %156 = load %struct.search_site** %ss, align 8, !dbg !3512
  %157 = getelementptr inbounds %struct.search_site* %156, i64 %155, !dbg !3512
  %158 = getelementptr inbounds %struct.search_site* %157, i32 0, i32 0, !dbg !3512
  %159 = getelementptr inbounds %struct.MV* %158, i32 0, i32 0, !dbg !3512
  %160 = load i16* %159, align 2, !dbg !3512
  %161 = sext i16 %160 to i32, !dbg !3512
  %162 = add nsw i32 %153, %161, !dbg !3510
  %163 = load %struct.macroblock** %1, align 8, !dbg !3513
  %164 = getelementptr inbounds %struct.macroblock* %163, i32 0, i32 33, !dbg !3513
  %165 = load i32* %164, align 4, !dbg !3513
  %166 = icmp sgt i32 %162, %165, !dbg !3514
  %167 = zext i1 %166 to i32, !dbg !3514
  %168 = load i32* %all_in, align 4, !dbg !3515
  %169 = and i32 %168, %167, !dbg !3515
  store i32 %169, i32* %all_in, align 4, !dbg !3515
  %170 = load %union.int_mv** %5, align 8, !dbg !3516
  %171 = bitcast %union.int_mv* %170 to %struct.MV*, !dbg !3516
  %172 = getelementptr inbounds %struct.MV* %171, i32 0, i32 0, !dbg !3516
  %173 = load i16* %172, align 2, !dbg !3516
  %174 = sext i16 %173 to i32, !dbg !3516
  %175 = load i32* %i, align 4, !dbg !3517
  %176 = add nsw i32 %175, 1, !dbg !3517
  %177 = sext i32 %176 to i64, !dbg !3518
  %178 = load %struct.search_site** %ss, align 8, !dbg !3518
  %179 = getelementptr inbounds %struct.search_site* %178, i64 %177, !dbg !3518
  %180 = getelementptr inbounds %struct.search_site* %179, i32 0, i32 0, !dbg !3518
  %181 = getelementptr inbounds %struct.MV* %180, i32 0, i32 0, !dbg !3518
  %182 = load i16* %181, align 2, !dbg !3518
  %183 = sext i16 %182 to i32, !dbg !3518
  %184 = add nsw i32 %174, %183, !dbg !3516
  %185 = load %struct.macroblock** %1, align 8, !dbg !3519
  %186 = getelementptr inbounds %struct.macroblock* %185, i32 0, i32 34, !dbg !3519
  %187 = load i32* %186, align 4, !dbg !3519
  %188 = icmp slt i32 %184, %187, !dbg !3520
  %189 = zext i1 %188 to i32, !dbg !3520
  %190 = load i32* %all_in, align 4, !dbg !3521
  %191 = and i32 %190, %189, !dbg !3521
  store i32 %191, i32* %all_in, align 4, !dbg !3521
  %192 = load %union.int_mv** %5, align 8, !dbg !3522
  %193 = bitcast %union.int_mv* %192 to %struct.MV*, !dbg !3522
  %194 = getelementptr inbounds %struct.MV* %193, i32 0, i32 1, !dbg !3522
  %195 = load i16* %194, align 2, !dbg !3522
  %196 = sext i16 %195 to i32, !dbg !3522
  %197 = load i32* %i, align 4, !dbg !3523
  %198 = add nsw i32 %197, 2, !dbg !3523
  %199 = sext i32 %198 to i64, !dbg !3524
  %200 = load %struct.search_site** %ss, align 8, !dbg !3524
  %201 = getelementptr inbounds %struct.search_site* %200, i64 %199, !dbg !3524
  %202 = getelementptr inbounds %struct.search_site* %201, i32 0, i32 0, !dbg !3524
  %203 = getelementptr inbounds %struct.MV* %202, i32 0, i32 1, !dbg !3524
  %204 = load i16* %203, align 2, !dbg !3524
  %205 = sext i16 %204 to i32, !dbg !3524
  %206 = add nsw i32 %196, %205, !dbg !3522
  %207 = load %struct.macroblock** %1, align 8, !dbg !3525
  %208 = getelementptr inbounds %struct.macroblock* %207, i32 0, i32 31, !dbg !3525
  %209 = load i32* %208, align 4, !dbg !3525
  %210 = icmp sgt i32 %206, %209, !dbg !3526
  %211 = zext i1 %210 to i32, !dbg !3526
  %212 = load i32* %all_in, align 4, !dbg !3527
  %213 = and i32 %212, %211, !dbg !3527
  store i32 %213, i32* %all_in, align 4, !dbg !3527
  %214 = load %union.int_mv** %5, align 8, !dbg !3528
  %215 = bitcast %union.int_mv* %214 to %struct.MV*, !dbg !3528
  %216 = getelementptr inbounds %struct.MV* %215, i32 0, i32 1, !dbg !3528
  %217 = load i16* %216, align 2, !dbg !3528
  %218 = sext i16 %217 to i32, !dbg !3528
  %219 = load i32* %i, align 4, !dbg !3529
  %220 = add nsw i32 %219, 3, !dbg !3529
  %221 = sext i32 %220 to i64, !dbg !3530
  %222 = load %struct.search_site** %ss, align 8, !dbg !3530
  %223 = getelementptr inbounds %struct.search_site* %222, i64 %221, !dbg !3530
  %224 = getelementptr inbounds %struct.search_site* %223, i32 0, i32 0, !dbg !3530
  %225 = getelementptr inbounds %struct.MV* %224, i32 0, i32 1, !dbg !3530
  %226 = load i16* %225, align 2, !dbg !3530
  %227 = sext i16 %226 to i32, !dbg !3530
  %228 = add nsw i32 %218, %227, !dbg !3528
  %229 = load %struct.macroblock** %1, align 8, !dbg !3531
  %230 = getelementptr inbounds %struct.macroblock* %229, i32 0, i32 32, !dbg !3531
  %231 = load i32* %230, align 4, !dbg !3531
  %232 = icmp slt i32 %228, %231, !dbg !3532
  %233 = zext i1 %232 to i32, !dbg !3532
  %234 = load i32* %all_in, align 4, !dbg !3533
  %235 = and i32 %234, %233, !dbg !3533
  store i32 %235, i32* %all_in, align 4, !dbg !3533
  %236 = load i32* %all_in, align 4, !dbg !3534
  %237 = icmp ne i32 %236, 0, !dbg !3536
  br i1 %237, label %238, label %353, !dbg !3536

; <label>:238                                     ; preds = %148
  call void @llvm.dbg.declare(metadata [4 x i32]* %sad_array, metadata !3537, metadata !506), !dbg !3540
  store i32 0, i32* %j, align 4, !dbg !3541
  br label %239, !dbg !3541

; <label>:239                                     ; preds = %349, %238
  %240 = load i32* %j, align 4, !dbg !3543
  %241 = load %struct.macroblock** %1, align 8, !dbg !3547
  %242 = getelementptr inbounds %struct.macroblock* %241, i32 0, i32 14, !dbg !3547
  %243 = load i32* %242, align 4, !dbg !3547
  %244 = icmp slt i32 %240, %243, !dbg !3548
  br i1 %244, label %245, label %352, !dbg !3549

; <label>:245                                     ; preds = %239
  call void @llvm.dbg.declare(metadata [4 x i8*]* %block_offset, metadata !3550, metadata !506), !dbg !3553
  store i32 0, i32* %t, align 4, !dbg !3554
  br label %246, !dbg !3554

; <label>:246                                     ; preds = %264, %245
  %247 = load i32* %t, align 4, !dbg !3556
  %248 = icmp slt i32 %247, 4, !dbg !3556
  br i1 %248, label %249, label %267, !dbg !3560

; <label>:249                                     ; preds = %246
  %250 = load i32* %i, align 4, !dbg !3561
  %251 = load i32* %t, align 4, !dbg !3562
  %252 = add nsw i32 %250, %251, !dbg !3561
  %253 = sext i32 %252 to i64, !dbg !3563
  %254 = load %struct.search_site** %ss, align 8, !dbg !3563
  %255 = getelementptr inbounds %struct.search_site* %254, i64 %253, !dbg !3563
  %256 = getelementptr inbounds %struct.search_site* %255, i32 0, i32 1, !dbg !3563
  %257 = load i32* %256, align 4, !dbg !3563
  %258 = load i8** %best_address, align 8, !dbg !3564
  %259 = sext i32 %257 to i64, !dbg !3563
  %260 = getelementptr inbounds i8* %258, i64 %259, !dbg !3563
  %261 = load i32* %t, align 4, !dbg !3565
  %262 = sext i32 %261 to i64, !dbg !3566
  %263 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 %262, !dbg !3566
  store i8* %260, i8** %263, align 8, !dbg !3566
  br label %264, !dbg !3566

; <label>:264                                     ; preds = %249
  %265 = load i32* %t, align 4, !dbg !3567
  %266 = add nsw i32 %265, 1, !dbg !3567
  store i32 %266, i32* %t, align 4, !dbg !3567
  br label %246, !dbg !3568

; <label>:267                                     ; preds = %246
  %268 = load %struct.variance_vtable** %9, align 8, !dbg !3569
  %269 = getelementptr inbounds %struct.variance_vtable* %268, i32 0, i32 8, !dbg !3569
  %270 = load void (i8*, i32, i8**, i32, i32*)** %269, align 8, !dbg !3569
  %271 = load i8** %what, align 8, !dbg !3570
  %272 = load i32* %what_stride, align 4, !dbg !3571
  %273 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i32 0, !dbg !3572
  %274 = load i32* %in_what_stride, align 4, !dbg !3573
  %275 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i32 0, !dbg !3574
  call void %270(i8* %271, i32 %272, i8** %273, i32 %274, i32* %275), !dbg !3569
  store i32 0, i32* %t, align 4, !dbg !3575
  br label %276, !dbg !3575

; <label>:276                                     ; preds = %343, %267
  %277 = load i32* %t, align 4, !dbg !3577
  %278 = icmp slt i32 %277, 4, !dbg !3577
  br i1 %278, label %279, label %348, !dbg !3581

; <label>:279                                     ; preds = %276
  %280 = load i32* %t, align 4, !dbg !3582
  %281 = sext i32 %280 to i64, !dbg !3585
  %282 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %281, !dbg !3585
  %283 = load i32* %282, align 4, !dbg !3585
  %284 = load i32* %bestsad, align 4, !dbg !3586
  %285 = icmp ult i32 %283, %284, !dbg !3585
  br i1 %285, label %286, label %342, !dbg !3587

; <label>:286                                     ; preds = %279
  %287 = load %union.int_mv** %5, align 8, !dbg !3588
  %288 = bitcast %union.int_mv* %287 to %struct.MV*, !dbg !3588
  %289 = getelementptr inbounds %struct.MV* %288, i32 0, i32 0, !dbg !3588
  %290 = load i16* %289, align 2, !dbg !3588
  %291 = sext i16 %290 to i32, !dbg !3588
  %292 = load i32* %i, align 4, !dbg !3590
  %293 = sext i32 %292 to i64, !dbg !3591
  %294 = load %struct.search_site** %ss, align 8, !dbg !3591
  %295 = getelementptr inbounds %struct.search_site* %294, i64 %293, !dbg !3591
  %296 = getelementptr inbounds %struct.search_site* %295, i32 0, i32 0, !dbg !3591
  %297 = getelementptr inbounds %struct.MV* %296, i32 0, i32 0, !dbg !3591
  %298 = load i16* %297, align 2, !dbg !3591
  %299 = sext i16 %298 to i32, !dbg !3591
  %300 = add nsw i32 %291, %299, !dbg !3588
  %301 = trunc i32 %300 to i16, !dbg !3588
  %302 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3592
  %303 = getelementptr inbounds %struct.MV* %302, i32 0, i32 0, !dbg !3592
  store i16 %301, i16* %303, align 2, !dbg !3592
  %304 = load %union.int_mv** %5, align 8, !dbg !3593
  %305 = bitcast %union.int_mv* %304 to %struct.MV*, !dbg !3593
  %306 = getelementptr inbounds %struct.MV* %305, i32 0, i32 1, !dbg !3593
  %307 = load i16* %306, align 2, !dbg !3593
  %308 = sext i16 %307 to i32, !dbg !3593
  %309 = load i32* %i, align 4, !dbg !3594
  %310 = sext i32 %309 to i64, !dbg !3595
  %311 = load %struct.search_site** %ss, align 8, !dbg !3595
  %312 = getelementptr inbounds %struct.search_site* %311, i64 %310, !dbg !3595
  %313 = getelementptr inbounds %struct.search_site* %312, i32 0, i32 0, !dbg !3595
  %314 = getelementptr inbounds %struct.MV* %313, i32 0, i32 1, !dbg !3595
  %315 = load i16* %314, align 2, !dbg !3595
  %316 = sext i16 %315 to i32, !dbg !3595
  %317 = add nsw i32 %308, %316, !dbg !3593
  %318 = trunc i32 %317 to i16, !dbg !3593
  %319 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3596
  %320 = getelementptr inbounds %struct.MV* %319, i32 0, i32 1, !dbg !3596
  store i16 %318, i16* %320, align 2, !dbg !3596
  %321 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3597
  %322 = load i32* %7, align 4, !dbg !3598
  %323 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %321, i32 %322), !dbg !3599
  %324 = load i32* %t, align 4, !dbg !3600
  %325 = sext i32 %324 to i64, !dbg !3601
  %326 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %325, !dbg !3601
  %327 = load i32* %326, align 4, !dbg !3601
  %328 = add i32 %327, %323, !dbg !3601
  store i32 %328, i32* %326, align 4, !dbg !3601
  %329 = load i32* %t, align 4, !dbg !3602
  %330 = sext i32 %329 to i64, !dbg !3604
  %331 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %330, !dbg !3604
  %332 = load i32* %331, align 4, !dbg !3604
  %333 = load i32* %bestsad, align 4, !dbg !3605
  %334 = icmp ult i32 %332, %333, !dbg !3604
  br i1 %334, label %335, label %341, !dbg !3606

; <label>:335                                     ; preds = %286
  %336 = load i32* %t, align 4, !dbg !3607
  %337 = sext i32 %336 to i64, !dbg !3609
  %338 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %337, !dbg !3609
  %339 = load i32* %338, align 4, !dbg !3609
  store i32 %339, i32* %bestsad, align 4, !dbg !3610
  %340 = load i32* %i, align 4, !dbg !3611
  store i32 %340, i32* %best_site, align 4, !dbg !3612
  br label %341, !dbg !3613

; <label>:341                                     ; preds = %335, %286
  br label %342, !dbg !3614

; <label>:342                                     ; preds = %341, %279
  br label %343, !dbg !3615

; <label>:343                                     ; preds = %342
  %344 = load i32* %t, align 4, !dbg !3616
  %345 = add nsw i32 %344, 1, !dbg !3616
  store i32 %345, i32* %t, align 4, !dbg !3616
  %346 = load i32* %i, align 4, !dbg !3617
  %347 = add nsw i32 %346, 1, !dbg !3617
  store i32 %347, i32* %i, align 4, !dbg !3617
  br label %276, !dbg !3618

; <label>:348                                     ; preds = %276
  br label %349, !dbg !3619

; <label>:349                                     ; preds = %348
  %350 = load i32* %j, align 4, !dbg !3620
  %351 = add nsw i32 %350, 4, !dbg !3620
  store i32 %351, i32* %j, align 4, !dbg !3620
  br label %239, !dbg !3621

; <label>:352                                     ; preds = %239
  br label %463, !dbg !3622

; <label>:353                                     ; preds = %148
  store i32 0, i32* %j, align 4, !dbg !3623
  br label %354, !dbg !3623

; <label>:354                                     ; preds = %459, %353
  %355 = load i32* %j, align 4, !dbg !3626
  %356 = load %struct.macroblock** %1, align 8, !dbg !3630
  %357 = getelementptr inbounds %struct.macroblock* %356, i32 0, i32 14, !dbg !3630
  %358 = load i32* %357, align 4, !dbg !3630
  %359 = icmp slt i32 %355, %358, !dbg !3631
  br i1 %359, label %360, label %462, !dbg !3632

; <label>:360                                     ; preds = %354
  %361 = load %union.int_mv** %5, align 8, !dbg !3633
  %362 = bitcast %union.int_mv* %361 to %struct.MV*, !dbg !3633
  %363 = getelementptr inbounds %struct.MV* %362, i32 0, i32 0, !dbg !3633
  %364 = load i16* %363, align 2, !dbg !3633
  %365 = sext i16 %364 to i32, !dbg !3633
  %366 = load i32* %i, align 4, !dbg !3635
  %367 = sext i32 %366 to i64, !dbg !3636
  %368 = load %struct.search_site** %ss, align 8, !dbg !3636
  %369 = getelementptr inbounds %struct.search_site* %368, i64 %367, !dbg !3636
  %370 = getelementptr inbounds %struct.search_site* %369, i32 0, i32 0, !dbg !3636
  %371 = getelementptr inbounds %struct.MV* %370, i32 0, i32 0, !dbg !3636
  %372 = load i16* %371, align 2, !dbg !3636
  %373 = sext i16 %372 to i32, !dbg !3636
  %374 = add nsw i32 %365, %373, !dbg !3633
  store i32 %374, i32* %this_row_offset, align 4, !dbg !3637
  %375 = load %union.int_mv** %5, align 8, !dbg !3638
  %376 = bitcast %union.int_mv* %375 to %struct.MV*, !dbg !3638
  %377 = getelementptr inbounds %struct.MV* %376, i32 0, i32 1, !dbg !3638
  %378 = load i16* %377, align 2, !dbg !3638
  %379 = sext i16 %378 to i32, !dbg !3638
  %380 = load i32* %i, align 4, !dbg !3639
  %381 = sext i32 %380 to i64, !dbg !3640
  %382 = load %struct.search_site** %ss, align 8, !dbg !3640
  %383 = getelementptr inbounds %struct.search_site* %382, i64 %381, !dbg !3640
  %384 = getelementptr inbounds %struct.search_site* %383, i32 0, i32 0, !dbg !3640
  %385 = getelementptr inbounds %struct.MV* %384, i32 0, i32 1, !dbg !3640
  %386 = load i16* %385, align 2, !dbg !3640
  %387 = sext i16 %386 to i32, !dbg !3640
  %388 = add nsw i32 %379, %387, !dbg !3638
  store i32 %388, i32* %this_col_offset, align 4, !dbg !3641
  %389 = load i32* %this_col_offset, align 4, !dbg !3642
  %390 = load %struct.macroblock** %1, align 8, !dbg !3644
  %391 = getelementptr inbounds %struct.macroblock* %390, i32 0, i32 31, !dbg !3644
  %392 = load i32* %391, align 4, !dbg !3644
  %393 = icmp sgt i32 %389, %392, !dbg !3642
  br i1 %393, label %394, label %456, !dbg !3645

; <label>:394                                     ; preds = %360
  %395 = load i32* %this_col_offset, align 4, !dbg !3646
  %396 = load %struct.macroblock** %1, align 8, !dbg !3648
  %397 = getelementptr inbounds %struct.macroblock* %396, i32 0, i32 32, !dbg !3648
  %398 = load i32* %397, align 4, !dbg !3648
  %399 = icmp slt i32 %395, %398, !dbg !3649
  br i1 %399, label %400, label %456, !dbg !3645

; <label>:400                                     ; preds = %394
  %401 = load i32* %this_row_offset, align 4, !dbg !3650
  %402 = load %struct.macroblock** %1, align 8, !dbg !3651
  %403 = getelementptr inbounds %struct.macroblock* %402, i32 0, i32 33, !dbg !3651
  %404 = load i32* %403, align 4, !dbg !3651
  %405 = icmp sgt i32 %401, %404, !dbg !3650
  br i1 %405, label %406, label %456, !dbg !3645

; <label>:406                                     ; preds = %400
  %407 = load i32* %this_row_offset, align 4, !dbg !3652
  %408 = load %struct.macroblock** %1, align 8, !dbg !3653
  %409 = getelementptr inbounds %struct.macroblock* %408, i32 0, i32 34, !dbg !3653
  %410 = load i32* %409, align 4, !dbg !3653
  %411 = icmp slt i32 %407, %410, !dbg !3652
  br i1 %411, label %412, label %456, !dbg !3645

; <label>:412                                     ; preds = %406
  %413 = load i32* %i, align 4, !dbg !3654
  %414 = sext i32 %413 to i64, !dbg !3656
  %415 = load %struct.search_site** %ss, align 8, !dbg !3656
  %416 = getelementptr inbounds %struct.search_site* %415, i64 %414, !dbg !3656
  %417 = getelementptr inbounds %struct.search_site* %416, i32 0, i32 1, !dbg !3656
  %418 = load i32* %417, align 4, !dbg !3656
  %419 = load i8** %best_address, align 8, !dbg !3657
  %420 = sext i32 %418 to i64, !dbg !3656
  %421 = getelementptr inbounds i8* %419, i64 %420, !dbg !3656
  store i8* %421, i8** %check_here, align 8, !dbg !3658
  %422 = load %struct.variance_vtable** %9, align 8, !dbg !3659
  %423 = getelementptr inbounds %struct.variance_vtable* %422, i32 0, i32 0, !dbg !3659
  %424 = load i32 (i8*, i32, i8*, i32, i32)** %423, align 8, !dbg !3659
  %425 = load i8** %what, align 8, !dbg !3660
  %426 = load i32* %what_stride, align 4, !dbg !3661
  %427 = load i8** %check_here, align 8, !dbg !3662
  %428 = load i32* %in_what_stride, align 4, !dbg !3663
  %429 = load i32* %bestsad, align 4, !dbg !3664
  %430 = call i32 %424(i8* %425, i32 %426, i8* %427, i32 %428, i32 %429), !dbg !3659
  store i32 %430, i32* %thissad, align 4, !dbg !3665
  %431 = load i32* %thissad, align 4, !dbg !3666
  %432 = load i32* %bestsad, align 4, !dbg !3668
  %433 = icmp ult i32 %431, %432, !dbg !3666
  br i1 %433, label %434, label %455, !dbg !3669

; <label>:434                                     ; preds = %412
  %435 = load i32* %this_row_offset, align 4, !dbg !3670
  %436 = trunc i32 %435 to i16, !dbg !3670
  %437 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3672
  %438 = getelementptr inbounds %struct.MV* %437, i32 0, i32 0, !dbg !3672
  store i16 %436, i16* %438, align 2, !dbg !3672
  %439 = load i32* %this_col_offset, align 4, !dbg !3673
  %440 = trunc i32 %439 to i16, !dbg !3673
  %441 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3674
  %442 = getelementptr inbounds %struct.MV* %441, i32 0, i32 1, !dbg !3674
  store i16 %440, i16* %442, align 2, !dbg !3674
  %443 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3675
  %444 = load i32* %7, align 4, !dbg !3676
  %445 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %443, i32 %444), !dbg !3677
  %446 = load i32* %thissad, align 4, !dbg !3678
  %447 = add i32 %446, %445, !dbg !3678
  store i32 %447, i32* %thissad, align 4, !dbg !3678
  %448 = load i32* %thissad, align 4, !dbg !3679
  %449 = load i32* %bestsad, align 4, !dbg !3681
  %450 = icmp ult i32 %448, %449, !dbg !3679
  br i1 %450, label %451, label %454, !dbg !3682

; <label>:451                                     ; preds = %434
  %452 = load i32* %thissad, align 4, !dbg !3683
  store i32 %452, i32* %bestsad, align 4, !dbg !3685
  %453 = load i32* %i, align 4, !dbg !3686
  store i32 %453, i32* %best_site, align 4, !dbg !3687
  br label %454, !dbg !3688

; <label>:454                                     ; preds = %451, %434
  br label %455, !dbg !3689

; <label>:455                                     ; preds = %454, %412
  br label %456, !dbg !3690

; <label>:456                                     ; preds = %455, %406, %400, %394, %360
  %457 = load i32* %i, align 4, !dbg !3691
  %458 = add nsw i32 %457, 1, !dbg !3691
  store i32 %458, i32* %i, align 4, !dbg !3691
  br label %459, !dbg !3692

; <label>:459                                     ; preds = %456
  %460 = load i32* %j, align 4, !dbg !3693
  %461 = add nsw i32 %460, 1, !dbg !3693
  store i32 %461, i32* %j, align 4, !dbg !3693
  br label %354, !dbg !3694

; <label>:462                                     ; preds = %354
  br label %463

; <label>:463                                     ; preds = %462, %352
  %464 = load i32* %best_site, align 4, !dbg !3695
  %465 = load i32* %last_site, align 4, !dbg !3697
  %466 = icmp ne i32 %464, %465, !dbg !3695
  br i1 %466, label %467, label %508, !dbg !3698

; <label>:467                                     ; preds = %463
  %468 = load i32* %best_site, align 4, !dbg !3699
  %469 = sext i32 %468 to i64, !dbg !3701
  %470 = load %struct.search_site** %ss, align 8, !dbg !3701
  %471 = getelementptr inbounds %struct.search_site* %470, i64 %469, !dbg !3701
  %472 = getelementptr inbounds %struct.search_site* %471, i32 0, i32 0, !dbg !3701
  %473 = getelementptr inbounds %struct.MV* %472, i32 0, i32 0, !dbg !3701
  %474 = load i16* %473, align 2, !dbg !3701
  %475 = sext i16 %474 to i32, !dbg !3701
  %476 = load %union.int_mv** %5, align 8, !dbg !3702
  %477 = bitcast %union.int_mv* %476 to %struct.MV*, !dbg !3702
  %478 = getelementptr inbounds %struct.MV* %477, i32 0, i32 0, !dbg !3702
  %479 = load i16* %478, align 2, !dbg !3702
  %480 = sext i16 %479 to i32, !dbg !3702
  %481 = add nsw i32 %480, %475, !dbg !3702
  %482 = trunc i32 %481 to i16, !dbg !3702
  store i16 %482, i16* %478, align 2, !dbg !3702
  %483 = load i32* %best_site, align 4, !dbg !3703
  %484 = sext i32 %483 to i64, !dbg !3704
  %485 = load %struct.search_site** %ss, align 8, !dbg !3704
  %486 = getelementptr inbounds %struct.search_site* %485, i64 %484, !dbg !3704
  %487 = getelementptr inbounds %struct.search_site* %486, i32 0, i32 0, !dbg !3704
  %488 = getelementptr inbounds %struct.MV* %487, i32 0, i32 1, !dbg !3704
  %489 = load i16* %488, align 2, !dbg !3704
  %490 = sext i16 %489 to i32, !dbg !3704
  %491 = load %union.int_mv** %5, align 8, !dbg !3705
  %492 = bitcast %union.int_mv* %491 to %struct.MV*, !dbg !3705
  %493 = getelementptr inbounds %struct.MV* %492, i32 0, i32 1, !dbg !3705
  %494 = load i16* %493, align 2, !dbg !3705
  %495 = sext i16 %494 to i32, !dbg !3705
  %496 = add nsw i32 %495, %490, !dbg !3705
  %497 = trunc i32 %496 to i16, !dbg !3705
  store i16 %497, i16* %493, align 2, !dbg !3705
  %498 = load i32* %best_site, align 4, !dbg !3706
  %499 = sext i32 %498 to i64, !dbg !3707
  %500 = load %struct.search_site** %ss, align 8, !dbg !3707
  %501 = getelementptr inbounds %struct.search_site* %500, i64 %499, !dbg !3707
  %502 = getelementptr inbounds %struct.search_site* %501, i32 0, i32 1, !dbg !3707
  %503 = load i32* %502, align 4, !dbg !3707
  %504 = load i8** %best_address, align 8, !dbg !3708
  %505 = sext i32 %503 to i64, !dbg !3708
  %506 = getelementptr inbounds i8* %504, i64 %505, !dbg !3708
  store i8* %506, i8** %best_address, align 8, !dbg !3708
  %507 = load i32* %best_site, align 4, !dbg !3709
  store i32 %507, i32* %last_site, align 4, !dbg !3710
  br label %517, !dbg !3711

; <label>:508                                     ; preds = %463
  %509 = load i8** %best_address, align 8, !dbg !3712
  %510 = load i8** %in_what, align 8, !dbg !3714
  %511 = icmp eq i8* %509, %510, !dbg !3712
  br i1 %511, label %512, label %516, !dbg !3715

; <label>:512                                     ; preds = %508
  %513 = load i32** %8, align 8, !dbg !3716
  %514 = load i32* %513, align 4, !dbg !3717
  %515 = add nsw i32 %514, 1, !dbg !3717
  store i32 %515, i32* %513, align 4, !dbg !3717
  br label %516, !dbg !3717

; <label>:516                                     ; preds = %512, %508
  br label %517

; <label>:517                                     ; preds = %516, %467
  br label %518, !dbg !3718

; <label>:518                                     ; preds = %517
  %519 = load i32* %step, align 4, !dbg !3719
  %520 = add nsw i32 %519, 1, !dbg !3719
  store i32 %520, i32* %step, align 4, !dbg !3719
  br label %144, !dbg !3720

; <label>:521                                     ; preds = %144
  %522 = load %union.int_mv** %5, align 8, !dbg !3721
  %523 = bitcast %union.int_mv* %522 to %struct.MV*, !dbg !3721
  %524 = getelementptr inbounds %struct.MV* %523, i32 0, i32 0, !dbg !3721
  %525 = load i16* %524, align 2, !dbg !3721
  %526 = sext i16 %525 to i32, !dbg !3721
  %527 = mul nsw i32 %526, 8, !dbg !3721
  %528 = trunc i32 %527 to i16, !dbg !3721
  %529 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3722
  %530 = getelementptr inbounds %struct.MV* %529, i32 0, i32 0, !dbg !3722
  store i16 %528, i16* %530, align 2, !dbg !3722
  %531 = load %union.int_mv** %5, align 8, !dbg !3723
  %532 = bitcast %union.int_mv* %531 to %struct.MV*, !dbg !3723
  %533 = getelementptr inbounds %struct.MV* %532, i32 0, i32 1, !dbg !3723
  %534 = load i16* %533, align 2, !dbg !3723
  %535 = sext i16 %534 to i32, !dbg !3723
  %536 = mul nsw i32 %535, 8, !dbg !3723
  %537 = trunc i32 %536 to i16, !dbg !3723
  %538 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3724
  %539 = getelementptr inbounds %struct.MV* %538, i32 0, i32 1, !dbg !3724
  store i16 %537, i16* %539, align 2, !dbg !3724
  %540 = load %struct.variance_vtable** %9, align 8, !dbg !3725
  %541 = getelementptr inbounds %struct.variance_vtable* %540, i32 0, i32 1, !dbg !3725
  %542 = load i32 (i8*, i32, i8*, i32, i32*)** %541, align 8, !dbg !3725
  %543 = load i8** %what, align 8, !dbg !3726
  %544 = load i32* %what_stride, align 4, !dbg !3727
  %545 = load i8** %best_address, align 8, !dbg !3728
  %546 = load i32* %in_what_stride, align 4, !dbg !3729
  %547 = call i32 %542(i8* %543, i32 %544, i8* %545, i32 %546, i32* %thissad), !dbg !3725
  %548 = load %union.int_mv** %11, align 8, !dbg !3730
  %549 = load i32*** %10, align 8, !dbg !3731
  %550 = load %struct.macroblock** %1, align 8, !dbg !3732
  %551 = getelementptr inbounds %struct.macroblock* %550, i32 0, i32 15, !dbg !3732
  %552 = load i32* %551, align 4, !dbg !3732
  %553 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %548, i32** %549, i32 %552), !dbg !3733
  %554 = add i32 %547, %553, !dbg !3725
  ret i32 %554, !dbg !3734
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
  call void @llvm.dbg.declare(metadata %struct.macroblock** %1, metadata !3735, metadata !506), !dbg !3736
  store %struct.block* %b, %struct.block** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.block** %2, metadata !3737, metadata !506), !dbg !3738
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.blockd** %3, metadata !3739, metadata !506), !dbg !3740
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %4, metadata !3741, metadata !506), !dbg !3742
  store i32 %sad_per_bit, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !3743, metadata !506), !dbg !3744
  store i32 %distance, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !3745, metadata !506), !dbg !3746
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.variance_vtable** %7, metadata !3747, metadata !506), !dbg !3748
  store i32** %mvcost, i32*** %8, align 8
  call void @llvm.dbg.declare(metadata i32*** %8, metadata !3749, metadata !506), !dbg !3750
  store %union.int_mv* %center_mv, %union.int_mv** %9, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %9, metadata !3751, metadata !506), !dbg !3752
  call void @llvm.dbg.declare(metadata i8** %what, metadata !3753, metadata !506), !dbg !3754
  %10 = load %struct.block** %2, align 8, !dbg !3755
  %11 = getelementptr inbounds %struct.block* %10, i32 0, i32 9, !dbg !3755
  %12 = load i8*** %11, align 8, !dbg !3755
  %13 = load i8** %12, align 8, !dbg !3756
  %14 = load %struct.block** %2, align 8, !dbg !3757
  %15 = getelementptr inbounds %struct.block* %14, i32 0, i32 10, !dbg !3757
  %16 = load i32* %15, align 4, !dbg !3757
  %17 = sext i32 %16 to i64, !dbg !3756
  %18 = getelementptr inbounds i8* %13, i64 %17, !dbg !3756
  store i8* %18, i8** %what, align 8, !dbg !3754
  call void @llvm.dbg.declare(metadata i32* %what_stride, metadata !3758, metadata !506), !dbg !3759
  %19 = load %struct.block** %2, align 8, !dbg !3760
  %20 = getelementptr inbounds %struct.block* %19, i32 0, i32 11, !dbg !3760
  %21 = load i32* %20, align 4, !dbg !3760
  store i32 %21, i32* %what_stride, align 4, !dbg !3759
  call void @llvm.dbg.declare(metadata i8** %in_what, metadata !3761, metadata !506), !dbg !3762
  call void @llvm.dbg.declare(metadata i32* %pre_stride, metadata !3763, metadata !506), !dbg !3764
  %22 = load %struct.macroblock** %1, align 8, !dbg !3765
  %23 = getelementptr inbounds %struct.macroblock* %22, i32 0, i32 7, !dbg !3765
  %24 = getelementptr inbounds %struct.macroblockd* %23, i32 0, i32 11, !dbg !3765
  %25 = getelementptr inbounds %struct.yv12_buffer_config* %24, i32 0, i32 4, !dbg !3765
  %26 = load i32* %25, align 4, !dbg !3765
  store i32 %26, i32* %pre_stride, align 4, !dbg !3764
  call void @llvm.dbg.declare(metadata i8** %base_pre, metadata !3766, metadata !506), !dbg !3767
  %27 = load %struct.macroblock** %1, align 8, !dbg !3768
  %28 = getelementptr inbounds %struct.macroblock* %27, i32 0, i32 7, !dbg !3768
  %29 = getelementptr inbounds %struct.macroblockd* %28, i32 0, i32 11, !dbg !3768
  %30 = getelementptr inbounds %struct.yv12_buffer_config* %29, i32 0, i32 13, !dbg !3768
  %31 = load i8** %30, align 8, !dbg !3768
  store i8* %31, i8** %base_pre, align 8, !dbg !3767
  call void @llvm.dbg.declare(metadata i32* %in_what_stride, metadata !3769, metadata !506), !dbg !3770
  %32 = load i32* %pre_stride, align 4, !dbg !3771
  store i32 %32, i32* %in_what_stride, align 4, !dbg !3770
  call void @llvm.dbg.declare(metadata i32* %mv_stride, metadata !3772, metadata !506), !dbg !3773
  %33 = load i32* %pre_stride, align 4, !dbg !3774
  store i32 %33, i32* %mv_stride, align 4, !dbg !3773
  call void @llvm.dbg.declare(metadata i8** %bestaddress, metadata !3775, metadata !506), !dbg !3776
  call void @llvm.dbg.declare(metadata %union.int_mv** %best_mv, metadata !3777, metadata !506), !dbg !3778
  %34 = load %struct.blockd** %3, align 8, !dbg !3779
  %35 = getelementptr inbounds %struct.blockd* %34, i32 0, i32 6, !dbg !3780
  %36 = bitcast %union.b_mode_info* %35 to %union.int_mv*, !dbg !3780
  store %union.int_mv* %36, %union.int_mv** %best_mv, align 8, !dbg !3778
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !3781, metadata !506), !dbg !3782
  call void @llvm.dbg.declare(metadata i32* %bestsad, metadata !3783, metadata !506), !dbg !3784
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !3785, metadata !506), !dbg !3786
  call void @llvm.dbg.declare(metadata i32* %r, metadata !3787, metadata !506), !dbg !3788
  call void @llvm.dbg.declare(metadata i32* %c, metadata !3789, metadata !506), !dbg !3790
  call void @llvm.dbg.declare(metadata i8** %check_here, metadata !3791, metadata !506), !dbg !3792
  call void @llvm.dbg.declare(metadata i32* %ref_row, metadata !3793, metadata !506), !dbg !3794
  %37 = load %union.int_mv** %4, align 8, !dbg !3795
  %38 = bitcast %union.int_mv* %37 to %struct.MV*, !dbg !3795
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 0, !dbg !3795
  %40 = load i16* %39, align 2, !dbg !3795
  %41 = sext i16 %40 to i32, !dbg !3795
  store i32 %41, i32* %ref_row, align 4, !dbg !3794
  call void @llvm.dbg.declare(metadata i32* %ref_col, metadata !3796, metadata !506), !dbg !3797
  %42 = load %union.int_mv** %4, align 8, !dbg !3798
  %43 = bitcast %union.int_mv* %42 to %struct.MV*, !dbg !3798
  %44 = getelementptr inbounds %struct.MV* %43, i32 0, i32 1, !dbg !3798
  %45 = load i16* %44, align 2, !dbg !3798
  %46 = sext i16 %45 to i32, !dbg !3798
  store i32 %46, i32* %ref_col, align 4, !dbg !3797
  call void @llvm.dbg.declare(metadata i32* %row_min, metadata !3799, metadata !506), !dbg !3800
  %47 = load i32* %ref_row, align 4, !dbg !3801
  %48 = load i32* %6, align 4, !dbg !3802
  %49 = sub nsw i32 %47, %48, !dbg !3801
  store i32 %49, i32* %row_min, align 4, !dbg !3800
  call void @llvm.dbg.declare(metadata i32* %row_max, metadata !3803, metadata !506), !dbg !3804
  %50 = load i32* %ref_row, align 4, !dbg !3805
  %51 = load i32* %6, align 4, !dbg !3806
  %52 = add nsw i32 %50, %51, !dbg !3805
  store i32 %52, i32* %row_max, align 4, !dbg !3804
  call void @llvm.dbg.declare(metadata i32* %col_min, metadata !3807, metadata !506), !dbg !3808
  %53 = load i32* %ref_col, align 4, !dbg !3809
  %54 = load i32* %6, align 4, !dbg !3810
  %55 = sub nsw i32 %53, %54, !dbg !3809
  store i32 %55, i32* %col_min, align 4, !dbg !3808
  call void @llvm.dbg.declare(metadata i32* %col_max, metadata !3811, metadata !506), !dbg !3812
  %56 = load i32* %ref_col, align 4, !dbg !3813
  %57 = load i32* %6, align 4, !dbg !3814
  %58 = add nsw i32 %56, %57, !dbg !3813
  store i32 %58, i32* %col_max, align 4, !dbg !3812
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !3815, metadata !506), !dbg !3816
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !3817, metadata !506), !dbg !3818
  %59 = load %struct.macroblock** %1, align 8, !dbg !3819
  %60 = getelementptr inbounds %struct.macroblock* %59, i32 0, i32 25, !dbg !3819
  %61 = getelementptr inbounds [2 x i32*]* %60, i32 0, i64 0, !dbg !3819
  %62 = load i32** %61, align 8, !dbg !3819
  %63 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !3820
  store i32* %62, i32** %63, align 8, !dbg !3820
  %64 = load %struct.macroblock** %1, align 8, !dbg !3821
  %65 = getelementptr inbounds %struct.macroblock* %64, i32 0, i32 25, !dbg !3821
  %66 = getelementptr inbounds [2 x i32*]* %65, i32 0, i64 1, !dbg !3821
  %67 = load i32** %66, align 8, !dbg !3821
  %68 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !3822
  store i32* %67, i32** %68, align 8, !dbg !3822
  %69 = load %union.int_mv** %9, align 8, !dbg !3823
  %70 = bitcast %union.int_mv* %69 to %struct.MV*, !dbg !3823
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 0, !dbg !3823
  %72 = load i16* %71, align 2, !dbg !3823
  %73 = sext i16 %72 to i32, !dbg !3823
  %74 = ashr i32 %73, 3, !dbg !3823
  %75 = trunc i32 %74 to i16, !dbg !3823
  %76 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3824
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0, !dbg !3824
  store i16 %75, i16* %77, align 2, !dbg !3824
  %78 = load %union.int_mv** %9, align 8, !dbg !3825
  %79 = bitcast %union.int_mv* %78 to %struct.MV*, !dbg !3825
  %80 = getelementptr inbounds %struct.MV* %79, i32 0, i32 1, !dbg !3825
  %81 = load i16* %80, align 2, !dbg !3825
  %82 = sext i16 %81 to i32, !dbg !3825
  %83 = ashr i32 %82, 3, !dbg !3825
  %84 = trunc i32 %83 to i16, !dbg !3825
  %85 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3826
  %86 = getelementptr inbounds %struct.MV* %85, i32 0, i32 1, !dbg !3826
  store i16 %84, i16* %86, align 2, !dbg !3826
  %87 = load i8** %base_pre, align 8, !dbg !3827
  %88 = load %struct.blockd** %3, align 8, !dbg !3828
  %89 = getelementptr inbounds %struct.blockd* %88, i32 0, i32 4, !dbg !3828
  %90 = load i32* %89, align 4, !dbg !3828
  %91 = sext i32 %90 to i64, !dbg !3827
  %92 = getelementptr inbounds i8* %87, i64 %91, !dbg !3827
  store i8* %92, i8** %in_what, align 8, !dbg !3829
  %93 = load i8** %in_what, align 8, !dbg !3830
  %94 = load i32* %ref_row, align 4, !dbg !3831
  %95 = load i32* %pre_stride, align 4, !dbg !3832
  %96 = mul nsw i32 %94, %95, !dbg !3831
  %97 = sext i32 %96 to i64, !dbg !3830
  %98 = getelementptr inbounds i8* %93, i64 %97, !dbg !3830
  %99 = load i32* %ref_col, align 4, !dbg !3833
  %100 = sext i32 %99 to i64, !dbg !3830
  %101 = getelementptr inbounds i8* %98, i64 %100, !dbg !3830
  store i8* %101, i8** %bestaddress, align 8, !dbg !3834
  %102 = load i32* %ref_row, align 4, !dbg !3835
  %103 = trunc i32 %102 to i16, !dbg !3835
  %104 = load %union.int_mv** %best_mv, align 8, !dbg !3836
  %105 = bitcast %union.int_mv* %104 to %struct.MV*, !dbg !3836
  %106 = getelementptr inbounds %struct.MV* %105, i32 0, i32 0, !dbg !3836
  store i16 %103, i16* %106, align 2, !dbg !3836
  %107 = load i32* %ref_col, align 4, !dbg !3837
  %108 = trunc i32 %107 to i16, !dbg !3837
  %109 = load %union.int_mv** %best_mv, align 8, !dbg !3838
  %110 = bitcast %union.int_mv* %109 to %struct.MV*, !dbg !3838
  %111 = getelementptr inbounds %struct.MV* %110, i32 0, i32 1, !dbg !3838
  store i16 %108, i16* %111, align 2, !dbg !3838
  %112 = load %struct.variance_vtable** %7, align 8, !dbg !3839
  %113 = getelementptr inbounds %struct.variance_vtable* %112, i32 0, i32 0, !dbg !3839
  %114 = load i32 (i8*, i32, i8*, i32, i32)** %113, align 8, !dbg !3839
  %115 = load i8** %what, align 8, !dbg !3840
  %116 = load i32* %what_stride, align 4, !dbg !3841
  %117 = load i8** %bestaddress, align 8, !dbg !3842
  %118 = load i32* %in_what_stride, align 4, !dbg !3843
  %119 = call i32 %114(i8* %115, i32 %116, i8* %117, i32 %118, i32 -1), !dbg !3839
  %120 = load %union.int_mv** %best_mv, align 8, !dbg !3844
  %121 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3845
  %122 = load i32* %5, align 4, !dbg !3846
  %123 = call i32 @mvsad_err_cost(%union.int_mv* %120, %union.int_mv* %fcenter_mv, i32** %121, i32 %122), !dbg !3847
  %124 = add i32 %119, %123, !dbg !3839
  store i32 %124, i32* %bestsad, align 4, !dbg !3848
  %125 = load i32* %col_min, align 4, !dbg !3849
  %126 = load %struct.macroblock** %1, align 8, !dbg !3851
  %127 = getelementptr inbounds %struct.macroblock* %126, i32 0, i32 31, !dbg !3851
  %128 = load i32* %127, align 4, !dbg !3851
  %129 = icmp slt i32 %125, %128, !dbg !3849
  br i1 %129, label %130, label %134, !dbg !3852

; <label>:130                                     ; preds = %0
  %131 = load %struct.macroblock** %1, align 8, !dbg !3853
  %132 = getelementptr inbounds %struct.macroblock* %131, i32 0, i32 31, !dbg !3853
  %133 = load i32* %132, align 4, !dbg !3853
  store i32 %133, i32* %col_min, align 4, !dbg !3854
  br label %134, !dbg !3854

; <label>:134                                     ; preds = %130, %0
  %135 = load i32* %col_max, align 4, !dbg !3855
  %136 = load %struct.macroblock** %1, align 8, !dbg !3857
  %137 = getelementptr inbounds %struct.macroblock* %136, i32 0, i32 32, !dbg !3857
  %138 = load i32* %137, align 4, !dbg !3857
  %139 = icmp sgt i32 %135, %138, !dbg !3855
  br i1 %139, label %140, label %144, !dbg !3858

; <label>:140                                     ; preds = %134
  %141 = load %struct.macroblock** %1, align 8, !dbg !3859
  %142 = getelementptr inbounds %struct.macroblock* %141, i32 0, i32 32, !dbg !3859
  %143 = load i32* %142, align 4, !dbg !3859
  store i32 %143, i32* %col_max, align 4, !dbg !3860
  br label %144, !dbg !3860

; <label>:144                                     ; preds = %140, %134
  %145 = load i32* %row_min, align 4, !dbg !3861
  %146 = load %struct.macroblock** %1, align 8, !dbg !3863
  %147 = getelementptr inbounds %struct.macroblock* %146, i32 0, i32 33, !dbg !3863
  %148 = load i32* %147, align 4, !dbg !3863
  %149 = icmp slt i32 %145, %148, !dbg !3861
  br i1 %149, label %150, label %154, !dbg !3864

; <label>:150                                     ; preds = %144
  %151 = load %struct.macroblock** %1, align 8, !dbg !3865
  %152 = getelementptr inbounds %struct.macroblock* %151, i32 0, i32 33, !dbg !3865
  %153 = load i32* %152, align 4, !dbg !3865
  store i32 %153, i32* %row_min, align 4, !dbg !3866
  br label %154, !dbg !3866

; <label>:154                                     ; preds = %150, %144
  %155 = load i32* %row_max, align 4, !dbg !3867
  %156 = load %struct.macroblock** %1, align 8, !dbg !3869
  %157 = getelementptr inbounds %struct.macroblock* %156, i32 0, i32 34, !dbg !3869
  %158 = load i32* %157, align 4, !dbg !3869
  %159 = icmp sgt i32 %155, %158, !dbg !3867
  br i1 %159, label %160, label %164, !dbg !3870

; <label>:160                                     ; preds = %154
  %161 = load %struct.macroblock** %1, align 8, !dbg !3871
  %162 = getelementptr inbounds %struct.macroblock* %161, i32 0, i32 34, !dbg !3871
  %163 = load i32* %162, align 4, !dbg !3871
  store i32 %163, i32* %row_max, align 4, !dbg !3872
  br label %164, !dbg !3872

; <label>:164                                     ; preds = %160, %154
  %165 = load i32* %row_min, align 4, !dbg !3873
  store i32 %165, i32* %r, align 4, !dbg !3875
  br label %166, !dbg !3875

; <label>:166                                     ; preds = %231, %164
  %167 = load i32* %r, align 4, !dbg !3876
  %168 = load i32* %row_max, align 4, !dbg !3880
  %169 = icmp slt i32 %167, %168, !dbg !3881
  br i1 %169, label %170, label %234, !dbg !3882

; <label>:170                                     ; preds = %166
  %171 = load i32* %r, align 4, !dbg !3883
  %172 = trunc i32 %171 to i16, !dbg !3883
  %173 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3885
  %174 = getelementptr inbounds %struct.MV* %173, i32 0, i32 0, !dbg !3885
  store i16 %172, i16* %174, align 2, !dbg !3885
  %175 = load i32* %r, align 4, !dbg !3886
  %176 = load i32* %mv_stride, align 4, !dbg !3887
  %177 = mul nsw i32 %175, %176, !dbg !3886
  %178 = load i8** %in_what, align 8, !dbg !3888
  %179 = sext i32 %177 to i64, !dbg !3886
  %180 = getelementptr inbounds i8* %178, i64 %179, !dbg !3886
  %181 = load i32* %col_min, align 4, !dbg !3889
  %182 = sext i32 %181 to i64, !dbg !3886
  %183 = getelementptr inbounds i8* %180, i64 %182, !dbg !3886
  store i8* %183, i8** %check_here, align 8, !dbg !3890
  %184 = load i32* %col_min, align 4, !dbg !3891
  store i32 %184, i32* %c, align 4, !dbg !3893
  br label %185, !dbg !3893

; <label>:185                                     ; preds = %227, %170
  %186 = load i32* %c, align 4, !dbg !3894
  %187 = load i32* %col_max, align 4, !dbg !3898
  %188 = icmp slt i32 %186, %187, !dbg !3899
  br i1 %188, label %189, label %230, !dbg !3900

; <label>:189                                     ; preds = %185
  %190 = load %struct.variance_vtable** %7, align 8, !dbg !3901
  %191 = getelementptr inbounds %struct.variance_vtable* %190, i32 0, i32 0, !dbg !3901
  %192 = load i32 (i8*, i32, i8*, i32, i32)** %191, align 8, !dbg !3901
  %193 = load i8** %what, align 8, !dbg !3903
  %194 = load i32* %what_stride, align 4, !dbg !3904
  %195 = load i8** %check_here, align 8, !dbg !3905
  %196 = load i32* %in_what_stride, align 4, !dbg !3906
  %197 = load i32* %bestsad, align 4, !dbg !3907
  %198 = call i32 %192(i8* %193, i32 %194, i8* %195, i32 %196, i32 %197), !dbg !3901
  store i32 %198, i32* %thissad, align 4, !dbg !3908
  %199 = load i32* %c, align 4, !dbg !3909
  %200 = trunc i32 %199 to i16, !dbg !3909
  %201 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3910
  %202 = getelementptr inbounds %struct.MV* %201, i32 0, i32 1, !dbg !3910
  store i16 %200, i16* %202, align 2, !dbg !3910
  %203 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3911
  %204 = load i32* %5, align 4, !dbg !3912
  %205 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %203, i32 %204), !dbg !3913
  %206 = load i32* %thissad, align 4, !dbg !3914
  %207 = add i32 %206, %205, !dbg !3914
  store i32 %207, i32* %thissad, align 4, !dbg !3914
  %208 = load i32* %thissad, align 4, !dbg !3915
  %209 = load i32* %bestsad, align 4, !dbg !3917
  %210 = icmp ult i32 %208, %209, !dbg !3915
  br i1 %210, label %211, label %224, !dbg !3918

; <label>:211                                     ; preds = %189
  %212 = load i32* %thissad, align 4, !dbg !3919
  store i32 %212, i32* %bestsad, align 4, !dbg !3921
  %213 = load i32* %r, align 4, !dbg !3922
  %214 = trunc i32 %213 to i16, !dbg !3922
  %215 = load %union.int_mv** %best_mv, align 8, !dbg !3923
  %216 = bitcast %union.int_mv* %215 to %struct.MV*, !dbg !3923
  %217 = getelementptr inbounds %struct.MV* %216, i32 0, i32 0, !dbg !3923
  store i16 %214, i16* %217, align 2, !dbg !3923
  %218 = load i32* %c, align 4, !dbg !3924
  %219 = trunc i32 %218 to i16, !dbg !3924
  %220 = load %union.int_mv** %best_mv, align 8, !dbg !3925
  %221 = bitcast %union.int_mv* %220 to %struct.MV*, !dbg !3925
  %222 = getelementptr inbounds %struct.MV* %221, i32 0, i32 1, !dbg !3925
  store i16 %219, i16* %222, align 2, !dbg !3925
  %223 = load i8** %check_here, align 8, !dbg !3926
  store i8* %223, i8** %bestaddress, align 8, !dbg !3927
  br label %224, !dbg !3928

; <label>:224                                     ; preds = %211, %189
  %225 = load i8** %check_here, align 8, !dbg !3929
  %226 = getelementptr inbounds i8* %225, i32 1, !dbg !3929
  store i8* %226, i8** %check_here, align 8, !dbg !3929
  br label %227, !dbg !3930

; <label>:227                                     ; preds = %224
  %228 = load i32* %c, align 4, !dbg !3931
  %229 = add nsw i32 %228, 1, !dbg !3931
  store i32 %229, i32* %c, align 4, !dbg !3931
  br label %185, !dbg !3932

; <label>:230                                     ; preds = %185
  br label %231, !dbg !3933

; <label>:231                                     ; preds = %230
  %232 = load i32* %r, align 4, !dbg !3934
  %233 = add nsw i32 %232, 1, !dbg !3934
  store i32 %233, i32* %r, align 4, !dbg !3934
  br label %166, !dbg !3935

; <label>:234                                     ; preds = %166
  %235 = load %union.int_mv** %best_mv, align 8, !dbg !3936
  %236 = bitcast %union.int_mv* %235 to %struct.MV*, !dbg !3936
  %237 = getelementptr inbounds %struct.MV* %236, i32 0, i32 0, !dbg !3936
  %238 = load i16* %237, align 2, !dbg !3936
  %239 = sext i16 %238 to i32, !dbg !3936
  %240 = shl i32 %239, 3, !dbg !3936
  %241 = trunc i32 %240 to i16, !dbg !3936
  %242 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3937
  %243 = getelementptr inbounds %struct.MV* %242, i32 0, i32 0, !dbg !3937
  store i16 %241, i16* %243, align 2, !dbg !3937
  %244 = load %union.int_mv** %best_mv, align 8, !dbg !3938
  %245 = bitcast %union.int_mv* %244 to %struct.MV*, !dbg !3938
  %246 = getelementptr inbounds %struct.MV* %245, i32 0, i32 1, !dbg !3938
  %247 = load i16* %246, align 2, !dbg !3938
  %248 = sext i16 %247 to i32, !dbg !3938
  %249 = shl i32 %248, 3, !dbg !3938
  %250 = trunc i32 %249 to i16, !dbg !3938
  %251 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3939
  %252 = getelementptr inbounds %struct.MV* %251, i32 0, i32 1, !dbg !3939
  store i16 %250, i16* %252, align 2, !dbg !3939
  %253 = load %struct.variance_vtable** %7, align 8, !dbg !3940
  %254 = getelementptr inbounds %struct.variance_vtable* %253, i32 0, i32 1, !dbg !3940
  %255 = load i32 (i8*, i32, i8*, i32, i32*)** %254, align 8, !dbg !3940
  %256 = load i8** %what, align 8, !dbg !3941
  %257 = load i32* %what_stride, align 4, !dbg !3942
  %258 = load i8** %bestaddress, align 8, !dbg !3943
  %259 = load i32* %in_what_stride, align 4, !dbg !3944
  %260 = call i32 %255(i8* %256, i32 %257, i8* %258, i32 %259, i32* %thissad), !dbg !3940
  %261 = load %union.int_mv** %9, align 8, !dbg !3945
  %262 = load i32*** %8, align 8, !dbg !3946
  %263 = load %struct.macroblock** %1, align 8, !dbg !3947
  %264 = getelementptr inbounds %struct.macroblock* %263, i32 0, i32 15, !dbg !3947
  %265 = load i32* %264, align 4, !dbg !3947
  %266 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %261, i32** %262, i32 %265), !dbg !3948
  %267 = add i32 %260, %266, !dbg !3940
  ret i32 %267, !dbg !3949
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
  call void @llvm.dbg.declare(metadata %struct.macroblock** %1, metadata !3950, metadata !506), !dbg !3951
  store %struct.block* %b, %struct.block** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.block** %2, metadata !3952, metadata !506), !dbg !3953
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.blockd** %3, metadata !3954, metadata !506), !dbg !3955
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %4, metadata !3956, metadata !506), !dbg !3957
  store i32 %sad_per_bit, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !3958, metadata !506), !dbg !3959
  store i32 %distance, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !3960, metadata !506), !dbg !3961
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.variance_vtable** %7, metadata !3962, metadata !506), !dbg !3963
  store i32** %mvcost, i32*** %8, align 8
  call void @llvm.dbg.declare(metadata i32*** %8, metadata !3964, metadata !506), !dbg !3965
  store %union.int_mv* %center_mv, %union.int_mv** %9, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %9, metadata !3966, metadata !506), !dbg !3967
  call void @llvm.dbg.declare(metadata i8** %what, metadata !3968, metadata !506), !dbg !3969
  %10 = load %struct.block** %2, align 8, !dbg !3970
  %11 = getelementptr inbounds %struct.block* %10, i32 0, i32 9, !dbg !3970
  %12 = load i8*** %11, align 8, !dbg !3970
  %13 = load i8** %12, align 8, !dbg !3971
  %14 = load %struct.block** %2, align 8, !dbg !3972
  %15 = getelementptr inbounds %struct.block* %14, i32 0, i32 10, !dbg !3972
  %16 = load i32* %15, align 4, !dbg !3972
  %17 = sext i32 %16 to i64, !dbg !3971
  %18 = getelementptr inbounds i8* %13, i64 %17, !dbg !3971
  store i8* %18, i8** %what, align 8, !dbg !3969
  call void @llvm.dbg.declare(metadata i32* %what_stride, metadata !3973, metadata !506), !dbg !3974
  %19 = load %struct.block** %2, align 8, !dbg !3975
  %20 = getelementptr inbounds %struct.block* %19, i32 0, i32 11, !dbg !3975
  %21 = load i32* %20, align 4, !dbg !3975
  store i32 %21, i32* %what_stride, align 4, !dbg !3974
  call void @llvm.dbg.declare(metadata i8** %in_what, metadata !3976, metadata !506), !dbg !3977
  call void @llvm.dbg.declare(metadata i32* %pre_stride, metadata !3978, metadata !506), !dbg !3979
  %22 = load %struct.macroblock** %1, align 8, !dbg !3980
  %23 = getelementptr inbounds %struct.macroblock* %22, i32 0, i32 7, !dbg !3980
  %24 = getelementptr inbounds %struct.macroblockd* %23, i32 0, i32 11, !dbg !3980
  %25 = getelementptr inbounds %struct.yv12_buffer_config* %24, i32 0, i32 4, !dbg !3980
  %26 = load i32* %25, align 4, !dbg !3980
  store i32 %26, i32* %pre_stride, align 4, !dbg !3979
  call void @llvm.dbg.declare(metadata i8** %base_pre, metadata !3981, metadata !506), !dbg !3982
  %27 = load %struct.macroblock** %1, align 8, !dbg !3983
  %28 = getelementptr inbounds %struct.macroblock* %27, i32 0, i32 7, !dbg !3983
  %29 = getelementptr inbounds %struct.macroblockd* %28, i32 0, i32 11, !dbg !3983
  %30 = getelementptr inbounds %struct.yv12_buffer_config* %29, i32 0, i32 13, !dbg !3983
  %31 = load i8** %30, align 8, !dbg !3983
  store i8* %31, i8** %base_pre, align 8, !dbg !3982
  call void @llvm.dbg.declare(metadata i32* %in_what_stride, metadata !3984, metadata !506), !dbg !3985
  %32 = load i32* %pre_stride, align 4, !dbg !3986
  store i32 %32, i32* %in_what_stride, align 4, !dbg !3985
  call void @llvm.dbg.declare(metadata i32* %mv_stride, metadata !3987, metadata !506), !dbg !3988
  %33 = load i32* %pre_stride, align 4, !dbg !3989
  store i32 %33, i32* %mv_stride, align 4, !dbg !3988
  call void @llvm.dbg.declare(metadata i8** %bestaddress, metadata !3990, metadata !506), !dbg !3991
  call void @llvm.dbg.declare(metadata %union.int_mv** %best_mv, metadata !3992, metadata !506), !dbg !3993
  %34 = load %struct.blockd** %3, align 8, !dbg !3994
  %35 = getelementptr inbounds %struct.blockd* %34, i32 0, i32 6, !dbg !3995
  %36 = bitcast %union.b_mode_info* %35 to %union.int_mv*, !dbg !3995
  store %union.int_mv* %36, %union.int_mv** %best_mv, align 8, !dbg !3993
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !3996, metadata !506), !dbg !3997
  call void @llvm.dbg.declare(metadata i32* %bestsad, metadata !3998, metadata !506), !dbg !3999
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !4000, metadata !506), !dbg !4001
  call void @llvm.dbg.declare(metadata i32* %r, metadata !4002, metadata !506), !dbg !4003
  call void @llvm.dbg.declare(metadata i32* %c, metadata !4004, metadata !506), !dbg !4005
  call void @llvm.dbg.declare(metadata i8** %check_here, metadata !4006, metadata !506), !dbg !4007
  call void @llvm.dbg.declare(metadata i32* %ref_row, metadata !4008, metadata !506), !dbg !4009
  %37 = load %union.int_mv** %4, align 8, !dbg !4010
  %38 = bitcast %union.int_mv* %37 to %struct.MV*, !dbg !4010
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 0, !dbg !4010
  %40 = load i16* %39, align 2, !dbg !4010
  %41 = sext i16 %40 to i32, !dbg !4010
  store i32 %41, i32* %ref_row, align 4, !dbg !4009
  call void @llvm.dbg.declare(metadata i32* %ref_col, metadata !4011, metadata !506), !dbg !4012
  %42 = load %union.int_mv** %4, align 8, !dbg !4013
  %43 = bitcast %union.int_mv* %42 to %struct.MV*, !dbg !4013
  %44 = getelementptr inbounds %struct.MV* %43, i32 0, i32 1, !dbg !4013
  %45 = load i16* %44, align 2, !dbg !4013
  %46 = sext i16 %45 to i32, !dbg !4013
  store i32 %46, i32* %ref_col, align 4, !dbg !4012
  call void @llvm.dbg.declare(metadata i32* %row_min, metadata !4014, metadata !506), !dbg !4015
  %47 = load i32* %ref_row, align 4, !dbg !4016
  %48 = load i32* %6, align 4, !dbg !4017
  %49 = sub nsw i32 %47, %48, !dbg !4016
  store i32 %49, i32* %row_min, align 4, !dbg !4015
  call void @llvm.dbg.declare(metadata i32* %row_max, metadata !4018, metadata !506), !dbg !4019
  %50 = load i32* %ref_row, align 4, !dbg !4020
  %51 = load i32* %6, align 4, !dbg !4021
  %52 = add nsw i32 %50, %51, !dbg !4020
  store i32 %52, i32* %row_max, align 4, !dbg !4019
  call void @llvm.dbg.declare(metadata i32* %col_min, metadata !4022, metadata !506), !dbg !4023
  %53 = load i32* %ref_col, align 4, !dbg !4024
  %54 = load i32* %6, align 4, !dbg !4025
  %55 = sub nsw i32 %53, %54, !dbg !4024
  store i32 %55, i32* %col_min, align 4, !dbg !4023
  call void @llvm.dbg.declare(metadata i32* %col_max, metadata !4026, metadata !506), !dbg !4027
  %56 = load i32* %ref_col, align 4, !dbg !4028
  %57 = load i32* %6, align 4, !dbg !4029
  %58 = add nsw i32 %56, %57, !dbg !4028
  store i32 %58, i32* %col_max, align 4, !dbg !4027
  call void @llvm.dbg.declare(metadata [3 x i32]* %sad_array, metadata !4030, metadata !506), !dbg !4032
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !4033, metadata !506), !dbg !4034
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !4035, metadata !506), !dbg !4036
  %59 = load %struct.macroblock** %1, align 8, !dbg !4037
  %60 = getelementptr inbounds %struct.macroblock* %59, i32 0, i32 25, !dbg !4037
  %61 = getelementptr inbounds [2 x i32*]* %60, i32 0, i64 0, !dbg !4037
  %62 = load i32** %61, align 8, !dbg !4037
  %63 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !4038
  store i32* %62, i32** %63, align 8, !dbg !4038
  %64 = load %struct.macroblock** %1, align 8, !dbg !4039
  %65 = getelementptr inbounds %struct.macroblock* %64, i32 0, i32 25, !dbg !4039
  %66 = getelementptr inbounds [2 x i32*]* %65, i32 0, i64 1, !dbg !4039
  %67 = load i32** %66, align 8, !dbg !4039
  %68 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !4040
  store i32* %67, i32** %68, align 8, !dbg !4040
  %69 = load %union.int_mv** %9, align 8, !dbg !4041
  %70 = bitcast %union.int_mv* %69 to %struct.MV*, !dbg !4041
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 0, !dbg !4041
  %72 = load i16* %71, align 2, !dbg !4041
  %73 = sext i16 %72 to i32, !dbg !4041
  %74 = ashr i32 %73, 3, !dbg !4041
  %75 = trunc i32 %74 to i16, !dbg !4041
  %76 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !4042
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0, !dbg !4042
  store i16 %75, i16* %77, align 2, !dbg !4042
  %78 = load %union.int_mv** %9, align 8, !dbg !4043
  %79 = bitcast %union.int_mv* %78 to %struct.MV*, !dbg !4043
  %80 = getelementptr inbounds %struct.MV* %79, i32 0, i32 1, !dbg !4043
  %81 = load i16* %80, align 2, !dbg !4043
  %82 = sext i16 %81 to i32, !dbg !4043
  %83 = ashr i32 %82, 3, !dbg !4043
  %84 = trunc i32 %83 to i16, !dbg !4043
  %85 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !4044
  %86 = getelementptr inbounds %struct.MV* %85, i32 0, i32 1, !dbg !4044
  store i16 %84, i16* %86, align 2, !dbg !4044
  %87 = load i8** %base_pre, align 8, !dbg !4045
  %88 = load %struct.blockd** %3, align 8, !dbg !4046
  %89 = getelementptr inbounds %struct.blockd* %88, i32 0, i32 4, !dbg !4046
  %90 = load i32* %89, align 4, !dbg !4046
  %91 = sext i32 %90 to i64, !dbg !4045
  %92 = getelementptr inbounds i8* %87, i64 %91, !dbg !4045
  store i8* %92, i8** %in_what, align 8, !dbg !4047
  %93 = load i8** %in_what, align 8, !dbg !4048
  %94 = load i32* %ref_row, align 4, !dbg !4049
  %95 = load i32* %pre_stride, align 4, !dbg !4050
  %96 = mul nsw i32 %94, %95, !dbg !4049
  %97 = sext i32 %96 to i64, !dbg !4048
  %98 = getelementptr inbounds i8* %93, i64 %97, !dbg !4048
  %99 = load i32* %ref_col, align 4, !dbg !4051
  %100 = sext i32 %99 to i64, !dbg !4048
  %101 = getelementptr inbounds i8* %98, i64 %100, !dbg !4048
  store i8* %101, i8** %bestaddress, align 8, !dbg !4052
  %102 = load i32* %ref_row, align 4, !dbg !4053
  %103 = trunc i32 %102 to i16, !dbg !4053
  %104 = load %union.int_mv** %best_mv, align 8, !dbg !4054
  %105 = bitcast %union.int_mv* %104 to %struct.MV*, !dbg !4054
  %106 = getelementptr inbounds %struct.MV* %105, i32 0, i32 0, !dbg !4054
  store i16 %103, i16* %106, align 2, !dbg !4054
  %107 = load i32* %ref_col, align 4, !dbg !4055
  %108 = trunc i32 %107 to i16, !dbg !4055
  %109 = load %union.int_mv** %best_mv, align 8, !dbg !4056
  %110 = bitcast %union.int_mv* %109 to %struct.MV*, !dbg !4056
  %111 = getelementptr inbounds %struct.MV* %110, i32 0, i32 1, !dbg !4056
  store i16 %108, i16* %111, align 2, !dbg !4056
  %112 = load %struct.variance_vtable** %7, align 8, !dbg !4057
  %113 = getelementptr inbounds %struct.variance_vtable* %112, i32 0, i32 0, !dbg !4057
  %114 = load i32 (i8*, i32, i8*, i32, i32)** %113, align 8, !dbg !4057
  %115 = load i8** %what, align 8, !dbg !4058
  %116 = load i32* %what_stride, align 4, !dbg !4059
  %117 = load i8** %bestaddress, align 8, !dbg !4060
  %118 = load i32* %in_what_stride, align 4, !dbg !4061
  %119 = call i32 %114(i8* %115, i32 %116, i8* %117, i32 %118, i32 -1), !dbg !4057
  %120 = load %union.int_mv** %best_mv, align 8, !dbg !4062
  %121 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !4063
  %122 = load i32* %5, align 4, !dbg !4064
  %123 = call i32 @mvsad_err_cost(%union.int_mv* %120, %union.int_mv* %fcenter_mv, i32** %121, i32 %122), !dbg !4065
  %124 = add i32 %119, %123, !dbg !4057
  store i32 %124, i32* %bestsad, align 4, !dbg !4066
  %125 = load i32* %col_min, align 4, !dbg !4067
  %126 = load %struct.macroblock** %1, align 8, !dbg !4069
  %127 = getelementptr inbounds %struct.macroblock* %126, i32 0, i32 31, !dbg !4069
  %128 = load i32* %127, align 4, !dbg !4069
  %129 = icmp slt i32 %125, %128, !dbg !4067
  br i1 %129, label %130, label %134, !dbg !4070

; <label>:130                                     ; preds = %0
  %131 = load %struct.macroblock** %1, align 8, !dbg !4071
  %132 = getelementptr inbounds %struct.macroblock* %131, i32 0, i32 31, !dbg !4071
  %133 = load i32* %132, align 4, !dbg !4071
  store i32 %133, i32* %col_min, align 4, !dbg !4072
  br label %134, !dbg !4072

; <label>:134                                     ; preds = %130, %0
  %135 = load i32* %col_max, align 4, !dbg !4073
  %136 = load %struct.macroblock** %1, align 8, !dbg !4075
  %137 = getelementptr inbounds %struct.macroblock* %136, i32 0, i32 32, !dbg !4075
  %138 = load i32* %137, align 4, !dbg !4075
  %139 = icmp sgt i32 %135, %138, !dbg !4073
  br i1 %139, label %140, label %144, !dbg !4076

; <label>:140                                     ; preds = %134
  %141 = load %struct.macroblock** %1, align 8, !dbg !4077
  %142 = getelementptr inbounds %struct.macroblock* %141, i32 0, i32 32, !dbg !4077
  %143 = load i32* %142, align 4, !dbg !4077
  store i32 %143, i32* %col_max, align 4, !dbg !4078
  br label %144, !dbg !4078

; <label>:144                                     ; preds = %140, %134
  %145 = load i32* %row_min, align 4, !dbg !4079
  %146 = load %struct.macroblock** %1, align 8, !dbg !4081
  %147 = getelementptr inbounds %struct.macroblock* %146, i32 0, i32 33, !dbg !4081
  %148 = load i32* %147, align 4, !dbg !4081
  %149 = icmp slt i32 %145, %148, !dbg !4079
  br i1 %149, label %150, label %154, !dbg !4082

; <label>:150                                     ; preds = %144
  %151 = load %struct.macroblock** %1, align 8, !dbg !4083
  %152 = getelementptr inbounds %struct.macroblock* %151, i32 0, i32 33, !dbg !4083
  %153 = load i32* %152, align 4, !dbg !4083
  store i32 %153, i32* %row_min, align 4, !dbg !4084
  br label %154, !dbg !4084

; <label>:154                                     ; preds = %150, %144
  %155 = load i32* %row_max, align 4, !dbg !4085
  %156 = load %struct.macroblock** %1, align 8, !dbg !4087
  %157 = getelementptr inbounds %struct.macroblock* %156, i32 0, i32 34, !dbg !4087
  %158 = load i32* %157, align 4, !dbg !4087
  %159 = icmp sgt i32 %155, %158, !dbg !4085
  br i1 %159, label %160, label %164, !dbg !4088

; <label>:160                                     ; preds = %154
  %161 = load %struct.macroblock** %1, align 8, !dbg !4089
  %162 = getelementptr inbounds %struct.macroblock* %161, i32 0, i32 34, !dbg !4089
  %163 = load i32* %162, align 4, !dbg !4089
  store i32 %163, i32* %row_max, align 4, !dbg !4090
  br label %164, !dbg !4090

; <label>:164                                     ; preds = %160, %154
  %165 = load i32* %row_min, align 4, !dbg !4091
  store i32 %165, i32* %r, align 4, !dbg !4093
  br label %166, !dbg !4093

; <label>:166                                     ; preds = %297, %164
  %167 = load i32* %r, align 4, !dbg !4094
  %168 = load i32* %row_max, align 4, !dbg !4098
  %169 = icmp slt i32 %167, %168, !dbg !4099
  br i1 %169, label %170, label %300, !dbg !4100

; <label>:170                                     ; preds = %166
  %171 = load i32* %r, align 4, !dbg !4101
  %172 = trunc i32 %171 to i16, !dbg !4101
  %173 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4103
  %174 = getelementptr inbounds %struct.MV* %173, i32 0, i32 0, !dbg !4103
  store i16 %172, i16* %174, align 2, !dbg !4103
  %175 = load i32* %r, align 4, !dbg !4104
  %176 = load i32* %mv_stride, align 4, !dbg !4105
  %177 = mul nsw i32 %175, %176, !dbg !4104
  %178 = load i8** %in_what, align 8, !dbg !4106
  %179 = sext i32 %177 to i64, !dbg !4104
  %180 = getelementptr inbounds i8* %178, i64 %179, !dbg !4104
  %181 = load i32* %col_min, align 4, !dbg !4107
  %182 = sext i32 %181 to i64, !dbg !4104
  %183 = getelementptr inbounds i8* %180, i64 %182, !dbg !4104
  store i8* %183, i8** %check_here, align 8, !dbg !4108
  %184 = load i32* %col_min, align 4, !dbg !4109
  store i32 %184, i32* %c, align 4, !dbg !4110
  br label %185, !dbg !4111

; <label>:185                                     ; preds = %245, %170
  %186 = load i32* %c, align 4, !dbg !4112
  %187 = add nsw i32 %186, 2, !dbg !4112
  %188 = load i32* %col_max, align 4, !dbg !4115
  %189 = icmp slt i32 %187, %188, !dbg !4116
  br i1 %189, label %190, label %246, !dbg !4111

; <label>:190                                     ; preds = %185
  call void @llvm.dbg.declare(metadata i32* %i, metadata !4117, metadata !506), !dbg !4119
  %191 = load %struct.variance_vtable** %7, align 8, !dbg !4120
  %192 = getelementptr inbounds %struct.variance_vtable* %191, i32 0, i32 6, !dbg !4120
  %193 = load void (i8*, i32, i8*, i32, i32*)** %192, align 8, !dbg !4120
  %194 = load i8** %what, align 8, !dbg !4121
  %195 = load i32* %what_stride, align 4, !dbg !4122
  %196 = load i8** %check_here, align 8, !dbg !4123
  %197 = load i32* %in_what_stride, align 4, !dbg !4124
  %198 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i32 0, !dbg !4125
  call void %193(i8* %194, i32 %195, i8* %196, i32 %197, i32* %198), !dbg !4120
  store i32 0, i32* %i, align 4, !dbg !4126
  br label %199, !dbg !4126

; <label>:199                                     ; preds = %242, %190
  %200 = load i32* %i, align 4, !dbg !4128
  %201 = icmp slt i32 %200, 3, !dbg !4128
  br i1 %201, label %202, label %245, !dbg !4132

; <label>:202                                     ; preds = %199
  %203 = load i32* %i, align 4, !dbg !4133
  %204 = sext i32 %203 to i64, !dbg !4135
  %205 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i64 %204, !dbg !4135
  %206 = load i32* %205, align 4, !dbg !4135
  store i32 %206, i32* %thissad, align 4, !dbg !4136
  %207 = load i32* %thissad, align 4, !dbg !4137
  %208 = load i32* %bestsad, align 4, !dbg !4139
  %209 = icmp ult i32 %207, %208, !dbg !4137
  br i1 %209, label %210, label %237, !dbg !4140

; <label>:210                                     ; preds = %202
  %211 = load i32* %c, align 4, !dbg !4141
  %212 = trunc i32 %211 to i16, !dbg !4141
  %213 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4143
  %214 = getelementptr inbounds %struct.MV* %213, i32 0, i32 1, !dbg !4143
  store i16 %212, i16* %214, align 2, !dbg !4143
  %215 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !4144
  %216 = load i32* %5, align 4, !dbg !4145
  %217 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %215, i32 %216), !dbg !4146
  %218 = load i32* %thissad, align 4, !dbg !4147
  %219 = add i32 %218, %217, !dbg !4147
  store i32 %219, i32* %thissad, align 4, !dbg !4147
  %220 = load i32* %thissad, align 4, !dbg !4148
  %221 = load i32* %bestsad, align 4, !dbg !4150
  %222 = icmp ult i32 %220, %221, !dbg !4148
  br i1 %222, label %223, label %236, !dbg !4151

; <label>:223                                     ; preds = %210
  %224 = load i32* %thissad, align 4, !dbg !4152
  store i32 %224, i32* %bestsad, align 4, !dbg !4154
  %225 = load i32* %r, align 4, !dbg !4155
  %226 = trunc i32 %225 to i16, !dbg !4155
  %227 = load %union.int_mv** %best_mv, align 8, !dbg !4156
  %228 = bitcast %union.int_mv* %227 to %struct.MV*, !dbg !4156
  %229 = getelementptr inbounds %struct.MV* %228, i32 0, i32 0, !dbg !4156
  store i16 %226, i16* %229, align 2, !dbg !4156
  %230 = load i32* %c, align 4, !dbg !4157
  %231 = trunc i32 %230 to i16, !dbg !4157
  %232 = load %union.int_mv** %best_mv, align 8, !dbg !4158
  %233 = bitcast %union.int_mv* %232 to %struct.MV*, !dbg !4158
  %234 = getelementptr inbounds %struct.MV* %233, i32 0, i32 1, !dbg !4158
  store i16 %231, i16* %234, align 2, !dbg !4158
  %235 = load i8** %check_here, align 8, !dbg !4159
  store i8* %235, i8** %bestaddress, align 8, !dbg !4160
  br label %236, !dbg !4161

; <label>:236                                     ; preds = %223, %210
  br label %237, !dbg !4162

; <label>:237                                     ; preds = %236, %202
  %238 = load i8** %check_here, align 8, !dbg !4163
  %239 = getelementptr inbounds i8* %238, i32 1, !dbg !4163
  store i8* %239, i8** %check_here, align 8, !dbg !4163
  %240 = load i32* %c, align 4, !dbg !4164
  %241 = add nsw i32 %240, 1, !dbg !4164
  store i32 %241, i32* %c, align 4, !dbg !4164
  br label %242, !dbg !4165

; <label>:242                                     ; preds = %237
  %243 = load i32* %i, align 4, !dbg !4166
  %244 = add nsw i32 %243, 1, !dbg !4166
  store i32 %244, i32* %i, align 4, !dbg !4166
  br label %199, !dbg !4167

; <label>:245                                     ; preds = %199
  br label %185, !dbg !4111

; <label>:246                                     ; preds = %185
  br label %247, !dbg !4168

; <label>:247                                     ; preds = %291, %246
  %248 = load i32* %c, align 4, !dbg !4169
  %249 = load i32* %col_max, align 4, !dbg !4170
  %250 = icmp slt i32 %248, %249, !dbg !4171
  br i1 %250, label %251, label %296, !dbg !4168

; <label>:251                                     ; preds = %247
  %252 = load %struct.variance_vtable** %7, align 8, !dbg !4172
  %253 = getelementptr inbounds %struct.variance_vtable* %252, i32 0, i32 0, !dbg !4172
  %254 = load i32 (i8*, i32, i8*, i32, i32)** %253, align 8, !dbg !4172
  %255 = load i8** %what, align 8, !dbg !4174
  %256 = load i32* %what_stride, align 4, !dbg !4175
  %257 = load i8** %check_here, align 8, !dbg !4176
  %258 = load i32* %in_what_stride, align 4, !dbg !4177
  %259 = load i32* %bestsad, align 4, !dbg !4178
  %260 = call i32 %254(i8* %255, i32 %256, i8* %257, i32 %258, i32 %259), !dbg !4172
  store i32 %260, i32* %thissad, align 4, !dbg !4179
  %261 = load i32* %thissad, align 4, !dbg !4180
  %262 = load i32* %bestsad, align 4, !dbg !4182
  %263 = icmp ult i32 %261, %262, !dbg !4180
  br i1 %263, label %264, label %291, !dbg !4183

; <label>:264                                     ; preds = %251
  %265 = load i32* %c, align 4, !dbg !4184
  %266 = trunc i32 %265 to i16, !dbg !4184
  %267 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4186
  %268 = getelementptr inbounds %struct.MV* %267, i32 0, i32 1, !dbg !4186
  store i16 %266, i16* %268, align 2, !dbg !4186
  %269 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !4187
  %270 = load i32* %5, align 4, !dbg !4188
  %271 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %269, i32 %270), !dbg !4189
  %272 = load i32* %thissad, align 4, !dbg !4190
  %273 = add i32 %272, %271, !dbg !4190
  store i32 %273, i32* %thissad, align 4, !dbg !4190
  %274 = load i32* %thissad, align 4, !dbg !4191
  %275 = load i32* %bestsad, align 4, !dbg !4193
  %276 = icmp ult i32 %274, %275, !dbg !4191
  br i1 %276, label %277, label %290, !dbg !4194

; <label>:277                                     ; preds = %264
  %278 = load i32* %thissad, align 4, !dbg !4195
  store i32 %278, i32* %bestsad, align 4, !dbg !4197
  %279 = load i32* %r, align 4, !dbg !4198
  %280 = trunc i32 %279 to i16, !dbg !4198
  %281 = load %union.int_mv** %best_mv, align 8, !dbg !4199
  %282 = bitcast %union.int_mv* %281 to %struct.MV*, !dbg !4199
  %283 = getelementptr inbounds %struct.MV* %282, i32 0, i32 0, !dbg !4199
  store i16 %280, i16* %283, align 2, !dbg !4199
  %284 = load i32* %c, align 4, !dbg !4200
  %285 = trunc i32 %284 to i16, !dbg !4200
  %286 = load %union.int_mv** %best_mv, align 8, !dbg !4201
  %287 = bitcast %union.int_mv* %286 to %struct.MV*, !dbg !4201
  %288 = getelementptr inbounds %struct.MV* %287, i32 0, i32 1, !dbg !4201
  store i16 %285, i16* %288, align 2, !dbg !4201
  %289 = load i8** %check_here, align 8, !dbg !4202
  store i8* %289, i8** %bestaddress, align 8, !dbg !4203
  br label %290, !dbg !4204

; <label>:290                                     ; preds = %277, %264
  br label %291, !dbg !4205

; <label>:291                                     ; preds = %290, %251
  %292 = load i8** %check_here, align 8, !dbg !4206
  %293 = getelementptr inbounds i8* %292, i32 1, !dbg !4206
  store i8* %293, i8** %check_here, align 8, !dbg !4206
  %294 = load i32* %c, align 4, !dbg !4207
  %295 = add nsw i32 %294, 1, !dbg !4207
  store i32 %295, i32* %c, align 4, !dbg !4207
  br label %247, !dbg !4168

; <label>:296                                     ; preds = %247
  br label %297, !dbg !4208

; <label>:297                                     ; preds = %296
  %298 = load i32* %r, align 4, !dbg !4209
  %299 = add nsw i32 %298, 1, !dbg !4209
  store i32 %299, i32* %r, align 4, !dbg !4209
  br label %166, !dbg !4210

; <label>:300                                     ; preds = %166
  %301 = load %union.int_mv** %best_mv, align 8, !dbg !4211
  %302 = bitcast %union.int_mv* %301 to %struct.MV*, !dbg !4211
  %303 = getelementptr inbounds %struct.MV* %302, i32 0, i32 0, !dbg !4211
  %304 = load i16* %303, align 2, !dbg !4211
  %305 = sext i16 %304 to i32, !dbg !4211
  %306 = shl i32 %305, 3, !dbg !4211
  %307 = trunc i32 %306 to i16, !dbg !4211
  %308 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4212
  %309 = getelementptr inbounds %struct.MV* %308, i32 0, i32 0, !dbg !4212
  store i16 %307, i16* %309, align 2, !dbg !4212
  %310 = load %union.int_mv** %best_mv, align 8, !dbg !4213
  %311 = bitcast %union.int_mv* %310 to %struct.MV*, !dbg !4213
  %312 = getelementptr inbounds %struct.MV* %311, i32 0, i32 1, !dbg !4213
  %313 = load i16* %312, align 2, !dbg !4213
  %314 = sext i16 %313 to i32, !dbg !4213
  %315 = shl i32 %314, 3, !dbg !4213
  %316 = trunc i32 %315 to i16, !dbg !4213
  %317 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4214
  %318 = getelementptr inbounds %struct.MV* %317, i32 0, i32 1, !dbg !4214
  store i16 %316, i16* %318, align 2, !dbg !4214
  %319 = load %struct.variance_vtable** %7, align 8, !dbg !4215
  %320 = getelementptr inbounds %struct.variance_vtable* %319, i32 0, i32 1, !dbg !4215
  %321 = load i32 (i8*, i32, i8*, i32, i32*)** %320, align 8, !dbg !4215
  %322 = load i8** %what, align 8, !dbg !4216
  %323 = load i32* %what_stride, align 4, !dbg !4217
  %324 = load i8** %bestaddress, align 8, !dbg !4218
  %325 = load i32* %in_what_stride, align 4, !dbg !4219
  %326 = call i32 %321(i8* %322, i32 %323, i8* %324, i32 %325, i32* %thissad), !dbg !4215
  %327 = load %union.int_mv** %9, align 8, !dbg !4220
  %328 = load i32*** %8, align 8, !dbg !4221
  %329 = load %struct.macroblock** %1, align 8, !dbg !4222
  %330 = getelementptr inbounds %struct.macroblock* %329, i32 0, i32 15, !dbg !4222
  %331 = load i32* %330, align 4, !dbg !4222
  %332 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %327, i32** %328, i32 %331), !dbg !4223
  %333 = add i32 %326, %332, !dbg !4215
  ret i32 %333, !dbg !4224
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
  call void @llvm.dbg.declare(metadata %struct.macroblock** %1, metadata !4225, metadata !506), !dbg !4226
  store %struct.block* %b, %struct.block** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.block** %2, metadata !4227, metadata !506), !dbg !4228
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.blockd** %3, metadata !4229, metadata !506), !dbg !4230
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %4, metadata !4231, metadata !506), !dbg !4232
  store i32 %sad_per_bit, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !4233, metadata !506), !dbg !4234
  store i32 %distance, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !4235, metadata !506), !dbg !4236
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.variance_vtable** %7, metadata !4237, metadata !506), !dbg !4238
  store i32** %mvcost, i32*** %8, align 8
  call void @llvm.dbg.declare(metadata i32*** %8, metadata !4239, metadata !506), !dbg !4240
  store %union.int_mv* %center_mv, %union.int_mv** %9, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %9, metadata !4241, metadata !506), !dbg !4242
  call void @llvm.dbg.declare(metadata i8** %what, metadata !4243, metadata !506), !dbg !4244
  %10 = load %struct.block** %2, align 8, !dbg !4245
  %11 = getelementptr inbounds %struct.block* %10, i32 0, i32 9, !dbg !4245
  %12 = load i8*** %11, align 8, !dbg !4245
  %13 = load i8** %12, align 8, !dbg !4246
  %14 = load %struct.block** %2, align 8, !dbg !4247
  %15 = getelementptr inbounds %struct.block* %14, i32 0, i32 10, !dbg !4247
  %16 = load i32* %15, align 4, !dbg !4247
  %17 = sext i32 %16 to i64, !dbg !4246
  %18 = getelementptr inbounds i8* %13, i64 %17, !dbg !4246
  store i8* %18, i8** %what, align 8, !dbg !4244
  call void @llvm.dbg.declare(metadata i32* %what_stride, metadata !4248, metadata !506), !dbg !4249
  %19 = load %struct.block** %2, align 8, !dbg !4250
  %20 = getelementptr inbounds %struct.block* %19, i32 0, i32 11, !dbg !4250
  %21 = load i32* %20, align 4, !dbg !4250
  store i32 %21, i32* %what_stride, align 4, !dbg !4249
  call void @llvm.dbg.declare(metadata i32* %pre_stride, metadata !4251, metadata !506), !dbg !4252
  %22 = load %struct.macroblock** %1, align 8, !dbg !4253
  %23 = getelementptr inbounds %struct.macroblock* %22, i32 0, i32 7, !dbg !4253
  %24 = getelementptr inbounds %struct.macroblockd* %23, i32 0, i32 11, !dbg !4253
  %25 = getelementptr inbounds %struct.yv12_buffer_config* %24, i32 0, i32 4, !dbg !4253
  %26 = load i32* %25, align 4, !dbg !4253
  store i32 %26, i32* %pre_stride, align 4, !dbg !4252
  call void @llvm.dbg.declare(metadata i8** %base_pre, metadata !4254, metadata !506), !dbg !4255
  %27 = load %struct.macroblock** %1, align 8, !dbg !4256
  %28 = getelementptr inbounds %struct.macroblock* %27, i32 0, i32 7, !dbg !4256
  %29 = getelementptr inbounds %struct.macroblockd* %28, i32 0, i32 11, !dbg !4256
  %30 = getelementptr inbounds %struct.yv12_buffer_config* %29, i32 0, i32 13, !dbg !4256
  %31 = load i8** %30, align 8, !dbg !4256
  store i8* %31, i8** %base_pre, align 8, !dbg !4255
  call void @llvm.dbg.declare(metadata i8** %in_what, metadata !4257, metadata !506), !dbg !4258
  call void @llvm.dbg.declare(metadata i32* %in_what_stride, metadata !4259, metadata !506), !dbg !4260
  %32 = load i32* %pre_stride, align 4, !dbg !4261
  store i32 %32, i32* %in_what_stride, align 4, !dbg !4260
  call void @llvm.dbg.declare(metadata i32* %mv_stride, metadata !4262, metadata !506), !dbg !4263
  %33 = load i32* %pre_stride, align 4, !dbg !4264
  store i32 %33, i32* %mv_stride, align 4, !dbg !4263
  call void @llvm.dbg.declare(metadata i8** %bestaddress, metadata !4265, metadata !506), !dbg !4266
  call void @llvm.dbg.declare(metadata %union.int_mv** %best_mv, metadata !4267, metadata !506), !dbg !4268
  %34 = load %struct.blockd** %3, align 8, !dbg !4269
  %35 = getelementptr inbounds %struct.blockd* %34, i32 0, i32 6, !dbg !4270
  %36 = bitcast %union.b_mode_info* %35 to %union.int_mv*, !dbg !4270
  store %union.int_mv* %36, %union.int_mv** %best_mv, align 8, !dbg !4268
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !4271, metadata !506), !dbg !4272
  call void @llvm.dbg.declare(metadata i32* %bestsad, metadata !4273, metadata !506), !dbg !4274
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !4275, metadata !506), !dbg !4276
  call void @llvm.dbg.declare(metadata i32* %r, metadata !4277, metadata !506), !dbg !4278
  call void @llvm.dbg.declare(metadata i32* %c, metadata !4279, metadata !506), !dbg !4280
  call void @llvm.dbg.declare(metadata i8** %check_here, metadata !4281, metadata !506), !dbg !4282
  call void @llvm.dbg.declare(metadata i32* %ref_row, metadata !4283, metadata !506), !dbg !4284
  %37 = load %union.int_mv** %4, align 8, !dbg !4285
  %38 = bitcast %union.int_mv* %37 to %struct.MV*, !dbg !4285
  %39 = getelementptr inbounds %struct.MV* %38, i32 0, i32 0, !dbg !4285
  %40 = load i16* %39, align 2, !dbg !4285
  %41 = sext i16 %40 to i32, !dbg !4285
  store i32 %41, i32* %ref_row, align 4, !dbg !4284
  call void @llvm.dbg.declare(metadata i32* %ref_col, metadata !4286, metadata !506), !dbg !4287
  %42 = load %union.int_mv** %4, align 8, !dbg !4288
  %43 = bitcast %union.int_mv* %42 to %struct.MV*, !dbg !4288
  %44 = getelementptr inbounds %struct.MV* %43, i32 0, i32 1, !dbg !4288
  %45 = load i16* %44, align 2, !dbg !4288
  %46 = sext i16 %45 to i32, !dbg !4288
  store i32 %46, i32* %ref_col, align 4, !dbg !4287
  call void @llvm.dbg.declare(metadata i32* %row_min, metadata !4289, metadata !506), !dbg !4290
  %47 = load i32* %ref_row, align 4, !dbg !4291
  %48 = load i32* %6, align 4, !dbg !4292
  %49 = sub nsw i32 %47, %48, !dbg !4291
  store i32 %49, i32* %row_min, align 4, !dbg !4290
  call void @llvm.dbg.declare(metadata i32* %row_max, metadata !4293, metadata !506), !dbg !4294
  %50 = load i32* %ref_row, align 4, !dbg !4295
  %51 = load i32* %6, align 4, !dbg !4296
  %52 = add nsw i32 %50, %51, !dbg !4295
  store i32 %52, i32* %row_max, align 4, !dbg !4294
  call void @llvm.dbg.declare(metadata i32* %col_min, metadata !4297, metadata !506), !dbg !4298
  %53 = load i32* %ref_col, align 4, !dbg !4299
  %54 = load i32* %6, align 4, !dbg !4300
  %55 = sub nsw i32 %53, %54, !dbg !4299
  store i32 %55, i32* %col_min, align 4, !dbg !4298
  call void @llvm.dbg.declare(metadata i32* %col_max, metadata !4301, metadata !506), !dbg !4302
  %56 = load i32* %ref_col, align 4, !dbg !4303
  %57 = load i32* %6, align 4, !dbg !4304
  %58 = add nsw i32 %56, %57, !dbg !4303
  store i32 %58, i32* %col_max, align 4, !dbg !4302
  call void @llvm.dbg.declare(metadata [17 x i16]* %sad_array8_, metadata !4305, metadata !506), !dbg !4309
  call void @llvm.dbg.declare(metadata i16** %sad_array8, metadata !4310, metadata !506), !dbg !4309
  %59 = getelementptr inbounds [17 x i16]* %sad_array8_, i32 0, i32 0, !dbg !4309
  %60 = ptrtoint i16* %59 to i64, !dbg !4309
  %61 = add nsw i64 %60, 16, !dbg !4309
  %62 = sub nsw i64 %61, 1, !dbg !4309
  %63 = and i64 %62, -16, !dbg !4309
  %64 = inttoptr i64 %63 to i16*, !dbg !4309
  store i16* %64, i16** %sad_array8, align 8, !dbg !4309
  call void @llvm.dbg.declare(metadata [3 x i32]* %sad_array, metadata !4311, metadata !506), !dbg !4312
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !4313, metadata !506), !dbg !4314
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !4315, metadata !506), !dbg !4316
  %65 = load %struct.macroblock** %1, align 8, !dbg !4317
  %66 = getelementptr inbounds %struct.macroblock* %65, i32 0, i32 25, !dbg !4317
  %67 = getelementptr inbounds [2 x i32*]* %66, i32 0, i64 0, !dbg !4317
  %68 = load i32** %67, align 8, !dbg !4317
  %69 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !4318
  store i32* %68, i32** %69, align 8, !dbg !4318
  %70 = load %struct.macroblock** %1, align 8, !dbg !4319
  %71 = getelementptr inbounds %struct.macroblock* %70, i32 0, i32 25, !dbg !4319
  %72 = getelementptr inbounds [2 x i32*]* %71, i32 0, i64 1, !dbg !4319
  %73 = load i32** %72, align 8, !dbg !4319
  %74 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !4320
  store i32* %73, i32** %74, align 8, !dbg !4320
  %75 = load %union.int_mv** %9, align 8, !dbg !4321
  %76 = bitcast %union.int_mv* %75 to %struct.MV*, !dbg !4321
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0, !dbg !4321
  %78 = load i16* %77, align 2, !dbg !4321
  %79 = sext i16 %78 to i32, !dbg !4321
  %80 = ashr i32 %79, 3, !dbg !4321
  %81 = trunc i32 %80 to i16, !dbg !4321
  %82 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !4322
  %83 = getelementptr inbounds %struct.MV* %82, i32 0, i32 0, !dbg !4322
  store i16 %81, i16* %83, align 2, !dbg !4322
  %84 = load %union.int_mv** %9, align 8, !dbg !4323
  %85 = bitcast %union.int_mv* %84 to %struct.MV*, !dbg !4323
  %86 = getelementptr inbounds %struct.MV* %85, i32 0, i32 1, !dbg !4323
  %87 = load i16* %86, align 2, !dbg !4323
  %88 = sext i16 %87 to i32, !dbg !4323
  %89 = ashr i32 %88, 3, !dbg !4323
  %90 = trunc i32 %89 to i16, !dbg !4323
  %91 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !4324
  %92 = getelementptr inbounds %struct.MV* %91, i32 0, i32 1, !dbg !4324
  store i16 %90, i16* %92, align 2, !dbg !4324
  %93 = load i8** %base_pre, align 8, !dbg !4325
  %94 = load %struct.blockd** %3, align 8, !dbg !4326
  %95 = getelementptr inbounds %struct.blockd* %94, i32 0, i32 4, !dbg !4326
  %96 = load i32* %95, align 4, !dbg !4326
  %97 = sext i32 %96 to i64, !dbg !4325
  %98 = getelementptr inbounds i8* %93, i64 %97, !dbg !4325
  store i8* %98, i8** %in_what, align 8, !dbg !4327
  %99 = load i8** %in_what, align 8, !dbg !4328
  %100 = load i32* %ref_row, align 4, !dbg !4329
  %101 = load i32* %pre_stride, align 4, !dbg !4330
  %102 = mul nsw i32 %100, %101, !dbg !4329
  %103 = sext i32 %102 to i64, !dbg !4328
  %104 = getelementptr inbounds i8* %99, i64 %103, !dbg !4328
  %105 = load i32* %ref_col, align 4, !dbg !4331
  %106 = sext i32 %105 to i64, !dbg !4328
  %107 = getelementptr inbounds i8* %104, i64 %106, !dbg !4328
  store i8* %107, i8** %bestaddress, align 8, !dbg !4332
  %108 = load i32* %ref_row, align 4, !dbg !4333
  %109 = trunc i32 %108 to i16, !dbg !4333
  %110 = load %union.int_mv** %best_mv, align 8, !dbg !4334
  %111 = bitcast %union.int_mv* %110 to %struct.MV*, !dbg !4334
  %112 = getelementptr inbounds %struct.MV* %111, i32 0, i32 0, !dbg !4334
  store i16 %109, i16* %112, align 2, !dbg !4334
  %113 = load i32* %ref_col, align 4, !dbg !4335
  %114 = trunc i32 %113 to i16, !dbg !4335
  %115 = load %union.int_mv** %best_mv, align 8, !dbg !4336
  %116 = bitcast %union.int_mv* %115 to %struct.MV*, !dbg !4336
  %117 = getelementptr inbounds %struct.MV* %116, i32 0, i32 1, !dbg !4336
  store i16 %114, i16* %117, align 2, !dbg !4336
  %118 = load %struct.variance_vtable** %7, align 8, !dbg !4337
  %119 = getelementptr inbounds %struct.variance_vtable* %118, i32 0, i32 0, !dbg !4337
  %120 = load i32 (i8*, i32, i8*, i32, i32)** %119, align 8, !dbg !4337
  %121 = load i8** %what, align 8, !dbg !4338
  %122 = load i32* %what_stride, align 4, !dbg !4339
  %123 = load i8** %bestaddress, align 8, !dbg !4340
  %124 = load i32* %in_what_stride, align 4, !dbg !4341
  %125 = call i32 %120(i8* %121, i32 %122, i8* %123, i32 %124, i32 -1), !dbg !4337
  %126 = load %union.int_mv** %best_mv, align 8, !dbg !4342
  %127 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !4343
  %128 = load i32* %5, align 4, !dbg !4344
  %129 = call i32 @mvsad_err_cost(%union.int_mv* %126, %union.int_mv* %fcenter_mv, i32** %127, i32 %128), !dbg !4345
  %130 = add i32 %125, %129, !dbg !4337
  store i32 %130, i32* %bestsad, align 4, !dbg !4346
  %131 = load i32* %col_min, align 4, !dbg !4347
  %132 = load %struct.macroblock** %1, align 8, !dbg !4349
  %133 = getelementptr inbounds %struct.macroblock* %132, i32 0, i32 31, !dbg !4349
  %134 = load i32* %133, align 4, !dbg !4349
  %135 = icmp slt i32 %131, %134, !dbg !4347
  br i1 %135, label %136, label %140, !dbg !4350

; <label>:136                                     ; preds = %0
  %137 = load %struct.macroblock** %1, align 8, !dbg !4351
  %138 = getelementptr inbounds %struct.macroblock* %137, i32 0, i32 31, !dbg !4351
  %139 = load i32* %138, align 4, !dbg !4351
  store i32 %139, i32* %col_min, align 4, !dbg !4352
  br label %140, !dbg !4352

; <label>:140                                     ; preds = %136, %0
  %141 = load i32* %col_max, align 4, !dbg !4353
  %142 = load %struct.macroblock** %1, align 8, !dbg !4355
  %143 = getelementptr inbounds %struct.macroblock* %142, i32 0, i32 32, !dbg !4355
  %144 = load i32* %143, align 4, !dbg !4355
  %145 = icmp sgt i32 %141, %144, !dbg !4353
  br i1 %145, label %146, label %150, !dbg !4356

; <label>:146                                     ; preds = %140
  %147 = load %struct.macroblock** %1, align 8, !dbg !4357
  %148 = getelementptr inbounds %struct.macroblock* %147, i32 0, i32 32, !dbg !4357
  %149 = load i32* %148, align 4, !dbg !4357
  store i32 %149, i32* %col_max, align 4, !dbg !4358
  br label %150, !dbg !4358

; <label>:150                                     ; preds = %146, %140
  %151 = load i32* %row_min, align 4, !dbg !4359
  %152 = load %struct.macroblock** %1, align 8, !dbg !4361
  %153 = getelementptr inbounds %struct.macroblock* %152, i32 0, i32 33, !dbg !4361
  %154 = load i32* %153, align 4, !dbg !4361
  %155 = icmp slt i32 %151, %154, !dbg !4359
  br i1 %155, label %156, label %160, !dbg !4362

; <label>:156                                     ; preds = %150
  %157 = load %struct.macroblock** %1, align 8, !dbg !4363
  %158 = getelementptr inbounds %struct.macroblock* %157, i32 0, i32 33, !dbg !4363
  %159 = load i32* %158, align 4, !dbg !4363
  store i32 %159, i32* %row_min, align 4, !dbg !4364
  br label %160, !dbg !4364

; <label>:160                                     ; preds = %156, %150
  %161 = load i32* %row_max, align 4, !dbg !4365
  %162 = load %struct.macroblock** %1, align 8, !dbg !4367
  %163 = getelementptr inbounds %struct.macroblock* %162, i32 0, i32 34, !dbg !4367
  %164 = load i32* %163, align 4, !dbg !4367
  %165 = icmp sgt i32 %161, %164, !dbg !4365
  br i1 %165, label %166, label %170, !dbg !4368

; <label>:166                                     ; preds = %160
  %167 = load %struct.macroblock** %1, align 8, !dbg !4369
  %168 = getelementptr inbounds %struct.macroblock* %167, i32 0, i32 34, !dbg !4369
  %169 = load i32* %168, align 4, !dbg !4369
  store i32 %169, i32* %row_max, align 4, !dbg !4370
  br label %170, !dbg !4370

; <label>:170                                     ; preds = %166, %160
  %171 = load i32* %row_min, align 4, !dbg !4371
  store i32 %171, i32* %r, align 4, !dbg !4373
  br label %172, !dbg !4373

; <label>:172                                     ; preds = %367, %170
  %173 = load i32* %r, align 4, !dbg !4374
  %174 = load i32* %row_max, align 4, !dbg !4378
  %175 = icmp slt i32 %173, %174, !dbg !4379
  br i1 %175, label %176, label %370, !dbg !4380

; <label>:176                                     ; preds = %172
  %177 = load i32* %r, align 4, !dbg !4381
  %178 = trunc i32 %177 to i16, !dbg !4381
  %179 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4383
  %180 = getelementptr inbounds %struct.MV* %179, i32 0, i32 0, !dbg !4383
  store i16 %178, i16* %180, align 2, !dbg !4383
  %181 = load i32* %r, align 4, !dbg !4384
  %182 = load i32* %mv_stride, align 4, !dbg !4385
  %183 = mul nsw i32 %181, %182, !dbg !4384
  %184 = load i8** %in_what, align 8, !dbg !4386
  %185 = sext i32 %183 to i64, !dbg !4384
  %186 = getelementptr inbounds i8* %184, i64 %185, !dbg !4384
  %187 = load i32* %col_min, align 4, !dbg !4387
  %188 = sext i32 %187 to i64, !dbg !4384
  %189 = getelementptr inbounds i8* %186, i64 %188, !dbg !4384
  store i8* %189, i8** %check_here, align 8, !dbg !4388
  %190 = load i32* %col_min, align 4, !dbg !4389
  store i32 %190, i32* %c, align 4, !dbg !4390
  br label %191, !dbg !4391

; <label>:191                                     ; preds = %253, %176
  %192 = load i32* %c, align 4, !dbg !4392
  %193 = add nsw i32 %192, 7, !dbg !4392
  %194 = load i32* %col_max, align 4, !dbg !4395
  %195 = icmp slt i32 %193, %194, !dbg !4396
  br i1 %195, label %196, label %254, !dbg !4391

; <label>:196                                     ; preds = %191
  call void @llvm.dbg.declare(metadata i32* %i, metadata !4397, metadata !506), !dbg !4399
  %197 = load %struct.variance_vtable** %7, align 8, !dbg !4400
  %198 = getelementptr inbounds %struct.variance_vtable* %197, i32 0, i32 7, !dbg !4400
  %199 = load void (i8*, i32, i8*, i32, i16*)** %198, align 8, !dbg !4400
  %200 = load i8** %what, align 8, !dbg !4401
  %201 = load i32* %what_stride, align 4, !dbg !4402
  %202 = load i8** %check_here, align 8, !dbg !4403
  %203 = load i32* %in_what_stride, align 4, !dbg !4404
  %204 = load i16** %sad_array8, align 8, !dbg !4405
  call void %199(i8* %200, i32 %201, i8* %202, i32 %203, i16* %204), !dbg !4400
  store i32 0, i32* %i, align 4, !dbg !4406
  br label %205, !dbg !4406

; <label>:205                                     ; preds = %250, %196
  %206 = load i32* %i, align 4, !dbg !4408
  %207 = icmp slt i32 %206, 8, !dbg !4408
  br i1 %207, label %208, label %253, !dbg !4412

; <label>:208                                     ; preds = %205
  %209 = load i32* %i, align 4, !dbg !4413
  %210 = sext i32 %209 to i64, !dbg !4415
  %211 = load i16** %sad_array8, align 8, !dbg !4415
  %212 = getelementptr inbounds i16* %211, i64 %210, !dbg !4415
  %213 = load i16* %212, align 2, !dbg !4415
  %214 = zext i16 %213 to i32, !dbg !4415
  store i32 %214, i32* %thissad, align 4, !dbg !4416
  %215 = load i32* %thissad, align 4, !dbg !4417
  %216 = load i32* %bestsad, align 4, !dbg !4419
  %217 = icmp ult i32 %215, %216, !dbg !4417
  br i1 %217, label %218, label %245, !dbg !4420

; <label>:218                                     ; preds = %208
  %219 = load i32* %c, align 4, !dbg !4421
  %220 = trunc i32 %219 to i16, !dbg !4421
  %221 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4423
  %222 = getelementptr inbounds %struct.MV* %221, i32 0, i32 1, !dbg !4423
  store i16 %220, i16* %222, align 2, !dbg !4423
  %223 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !4424
  %224 = load i32* %5, align 4, !dbg !4425
  %225 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %223, i32 %224), !dbg !4426
  %226 = load i32* %thissad, align 4, !dbg !4427
  %227 = add i32 %226, %225, !dbg !4427
  store i32 %227, i32* %thissad, align 4, !dbg !4427
  %228 = load i32* %thissad, align 4, !dbg !4428
  %229 = load i32* %bestsad, align 4, !dbg !4430
  %230 = icmp ult i32 %228, %229, !dbg !4428
  br i1 %230, label %231, label %244, !dbg !4431

; <label>:231                                     ; preds = %218
  %232 = load i32* %thissad, align 4, !dbg !4432
  store i32 %232, i32* %bestsad, align 4, !dbg !4434
  %233 = load i32* %r, align 4, !dbg !4435
  %234 = trunc i32 %233 to i16, !dbg !4435
  %235 = load %union.int_mv** %best_mv, align 8, !dbg !4436
  %236 = bitcast %union.int_mv* %235 to %struct.MV*, !dbg !4436
  %237 = getelementptr inbounds %struct.MV* %236, i32 0, i32 0, !dbg !4436
  store i16 %234, i16* %237, align 2, !dbg !4436
  %238 = load i32* %c, align 4, !dbg !4437
  %239 = trunc i32 %238 to i16, !dbg !4437
  %240 = load %union.int_mv** %best_mv, align 8, !dbg !4438
  %241 = bitcast %union.int_mv* %240 to %struct.MV*, !dbg !4438
  %242 = getelementptr inbounds %struct.MV* %241, i32 0, i32 1, !dbg !4438
  store i16 %239, i16* %242, align 2, !dbg !4438
  %243 = load i8** %check_here, align 8, !dbg !4439
  store i8* %243, i8** %bestaddress, align 8, !dbg !4440
  br label %244, !dbg !4441

; <label>:244                                     ; preds = %231, %218
  br label %245, !dbg !4442

; <label>:245                                     ; preds = %244, %208
  %246 = load i8** %check_here, align 8, !dbg !4443
  %247 = getelementptr inbounds i8* %246, i32 1, !dbg !4443
  store i8* %247, i8** %check_here, align 8, !dbg !4443
  %248 = load i32* %c, align 4, !dbg !4444
  %249 = add nsw i32 %248, 1, !dbg !4444
  store i32 %249, i32* %c, align 4, !dbg !4444
  br label %250, !dbg !4445

; <label>:250                                     ; preds = %245
  %251 = load i32* %i, align 4, !dbg !4446
  %252 = add nsw i32 %251, 1, !dbg !4446
  store i32 %252, i32* %i, align 4, !dbg !4446
  br label %205, !dbg !4447

; <label>:253                                     ; preds = %205
  br label %191, !dbg !4391

; <label>:254                                     ; preds = %191
  br label %255, !dbg !4448

; <label>:255                                     ; preds = %315, %254
  %256 = load i32* %c, align 4, !dbg !4449
  %257 = add nsw i32 %256, 2, !dbg !4449
  %258 = load i32* %col_max, align 4, !dbg !4450
  %259 = icmp slt i32 %257, %258, !dbg !4451
  br i1 %259, label %260, label %316, !dbg !4448

; <label>:260                                     ; preds = %255
  call void @llvm.dbg.declare(metadata i32* %i1, metadata !4452, metadata !506), !dbg !4454
  %261 = load %struct.variance_vtable** %7, align 8, !dbg !4455
  %262 = getelementptr inbounds %struct.variance_vtable* %261, i32 0, i32 6, !dbg !4455
  %263 = load void (i8*, i32, i8*, i32, i32*)** %262, align 8, !dbg !4455
  %264 = load i8** %what, align 8, !dbg !4456
  %265 = load i32* %what_stride, align 4, !dbg !4457
  %266 = load i8** %check_here, align 8, !dbg !4458
  %267 = load i32* %in_what_stride, align 4, !dbg !4459
  %268 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i32 0, !dbg !4460
  call void %263(i8* %264, i32 %265, i8* %266, i32 %267, i32* %268), !dbg !4455
  store i32 0, i32* %i1, align 4, !dbg !4461
  br label %269, !dbg !4461

; <label>:269                                     ; preds = %312, %260
  %270 = load i32* %i1, align 4, !dbg !4463
  %271 = icmp slt i32 %270, 3, !dbg !4463
  br i1 %271, label %272, label %315, !dbg !4467

; <label>:272                                     ; preds = %269
  %273 = load i32* %i1, align 4, !dbg !4468
  %274 = sext i32 %273 to i64, !dbg !4470
  %275 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i64 %274, !dbg !4470
  %276 = load i32* %275, align 4, !dbg !4470
  store i32 %276, i32* %thissad, align 4, !dbg !4471
  %277 = load i32* %thissad, align 4, !dbg !4472
  %278 = load i32* %bestsad, align 4, !dbg !4474
  %279 = icmp ult i32 %277, %278, !dbg !4472
  br i1 %279, label %280, label %307, !dbg !4475

; <label>:280                                     ; preds = %272
  %281 = load i32* %c, align 4, !dbg !4476
  %282 = trunc i32 %281 to i16, !dbg !4476
  %283 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4478
  %284 = getelementptr inbounds %struct.MV* %283, i32 0, i32 1, !dbg !4478
  store i16 %282, i16* %284, align 2, !dbg !4478
  %285 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !4479
  %286 = load i32* %5, align 4, !dbg !4480
  %287 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %285, i32 %286), !dbg !4481
  %288 = load i32* %thissad, align 4, !dbg !4482
  %289 = add i32 %288, %287, !dbg !4482
  store i32 %289, i32* %thissad, align 4, !dbg !4482
  %290 = load i32* %thissad, align 4, !dbg !4483
  %291 = load i32* %bestsad, align 4, !dbg !4485
  %292 = icmp ult i32 %290, %291, !dbg !4483
  br i1 %292, label %293, label %306, !dbg !4486

; <label>:293                                     ; preds = %280
  %294 = load i32* %thissad, align 4, !dbg !4487
  store i32 %294, i32* %bestsad, align 4, !dbg !4489
  %295 = load i32* %r, align 4, !dbg !4490
  %296 = trunc i32 %295 to i16, !dbg !4490
  %297 = load %union.int_mv** %best_mv, align 8, !dbg !4491
  %298 = bitcast %union.int_mv* %297 to %struct.MV*, !dbg !4491
  %299 = getelementptr inbounds %struct.MV* %298, i32 0, i32 0, !dbg !4491
  store i16 %296, i16* %299, align 2, !dbg !4491
  %300 = load i32* %c, align 4, !dbg !4492
  %301 = trunc i32 %300 to i16, !dbg !4492
  %302 = load %union.int_mv** %best_mv, align 8, !dbg !4493
  %303 = bitcast %union.int_mv* %302 to %struct.MV*, !dbg !4493
  %304 = getelementptr inbounds %struct.MV* %303, i32 0, i32 1, !dbg !4493
  store i16 %301, i16* %304, align 2, !dbg !4493
  %305 = load i8** %check_here, align 8, !dbg !4494
  store i8* %305, i8** %bestaddress, align 8, !dbg !4495
  br label %306, !dbg !4496

; <label>:306                                     ; preds = %293, %280
  br label %307, !dbg !4497

; <label>:307                                     ; preds = %306, %272
  %308 = load i8** %check_here, align 8, !dbg !4498
  %309 = getelementptr inbounds i8* %308, i32 1, !dbg !4498
  store i8* %309, i8** %check_here, align 8, !dbg !4498
  %310 = load i32* %c, align 4, !dbg !4499
  %311 = add nsw i32 %310, 1, !dbg !4499
  store i32 %311, i32* %c, align 4, !dbg !4499
  br label %312, !dbg !4500

; <label>:312                                     ; preds = %307
  %313 = load i32* %i1, align 4, !dbg !4501
  %314 = add nsw i32 %313, 1, !dbg !4501
  store i32 %314, i32* %i1, align 4, !dbg !4501
  br label %269, !dbg !4502

; <label>:315                                     ; preds = %269
  br label %255, !dbg !4448

; <label>:316                                     ; preds = %255
  br label %317, !dbg !4503

; <label>:317                                     ; preds = %361, %316
  %318 = load i32* %c, align 4, !dbg !4504
  %319 = load i32* %col_max, align 4, !dbg !4505
  %320 = icmp slt i32 %318, %319, !dbg !4506
  br i1 %320, label %321, label %366, !dbg !4503

; <label>:321                                     ; preds = %317
  %322 = load %struct.variance_vtable** %7, align 8, !dbg !4507
  %323 = getelementptr inbounds %struct.variance_vtable* %322, i32 0, i32 0, !dbg !4507
  %324 = load i32 (i8*, i32, i8*, i32, i32)** %323, align 8, !dbg !4507
  %325 = load i8** %what, align 8, !dbg !4509
  %326 = load i32* %what_stride, align 4, !dbg !4510
  %327 = load i8** %check_here, align 8, !dbg !4511
  %328 = load i32* %in_what_stride, align 4, !dbg !4512
  %329 = load i32* %bestsad, align 4, !dbg !4513
  %330 = call i32 %324(i8* %325, i32 %326, i8* %327, i32 %328, i32 %329), !dbg !4507
  store i32 %330, i32* %thissad, align 4, !dbg !4514
  %331 = load i32* %thissad, align 4, !dbg !4515
  %332 = load i32* %bestsad, align 4, !dbg !4517
  %333 = icmp ult i32 %331, %332, !dbg !4515
  br i1 %333, label %334, label %361, !dbg !4518

; <label>:334                                     ; preds = %321
  %335 = load i32* %c, align 4, !dbg !4519
  %336 = trunc i32 %335 to i16, !dbg !4519
  %337 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4521
  %338 = getelementptr inbounds %struct.MV* %337, i32 0, i32 1, !dbg !4521
  store i16 %336, i16* %338, align 2, !dbg !4521
  %339 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !4522
  %340 = load i32* %5, align 4, !dbg !4523
  %341 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %339, i32 %340), !dbg !4524
  %342 = load i32* %thissad, align 4, !dbg !4525
  %343 = add i32 %342, %341, !dbg !4525
  store i32 %343, i32* %thissad, align 4, !dbg !4525
  %344 = load i32* %thissad, align 4, !dbg !4526
  %345 = load i32* %bestsad, align 4, !dbg !4528
  %346 = icmp ult i32 %344, %345, !dbg !4526
  br i1 %346, label %347, label %360, !dbg !4529

; <label>:347                                     ; preds = %334
  %348 = load i32* %thissad, align 4, !dbg !4530
  store i32 %348, i32* %bestsad, align 4, !dbg !4532
  %349 = load i32* %r, align 4, !dbg !4533
  %350 = trunc i32 %349 to i16, !dbg !4533
  %351 = load %union.int_mv** %best_mv, align 8, !dbg !4534
  %352 = bitcast %union.int_mv* %351 to %struct.MV*, !dbg !4534
  %353 = getelementptr inbounds %struct.MV* %352, i32 0, i32 0, !dbg !4534
  store i16 %350, i16* %353, align 2, !dbg !4534
  %354 = load i32* %c, align 4, !dbg !4535
  %355 = trunc i32 %354 to i16, !dbg !4535
  %356 = load %union.int_mv** %best_mv, align 8, !dbg !4536
  %357 = bitcast %union.int_mv* %356 to %struct.MV*, !dbg !4536
  %358 = getelementptr inbounds %struct.MV* %357, i32 0, i32 1, !dbg !4536
  store i16 %355, i16* %358, align 2, !dbg !4536
  %359 = load i8** %check_here, align 8, !dbg !4537
  store i8* %359, i8** %bestaddress, align 8, !dbg !4538
  br label %360, !dbg !4539

; <label>:360                                     ; preds = %347, %334
  br label %361, !dbg !4540

; <label>:361                                     ; preds = %360, %321
  %362 = load i8** %check_here, align 8, !dbg !4541
  %363 = getelementptr inbounds i8* %362, i32 1, !dbg !4541
  store i8* %363, i8** %check_here, align 8, !dbg !4541
  %364 = load i32* %c, align 4, !dbg !4542
  %365 = add nsw i32 %364, 1, !dbg !4542
  store i32 %365, i32* %c, align 4, !dbg !4542
  br label %317, !dbg !4503

; <label>:366                                     ; preds = %317
  br label %367, !dbg !4543

; <label>:367                                     ; preds = %366
  %368 = load i32* %r, align 4, !dbg !4544
  %369 = add nsw i32 %368, 1, !dbg !4544
  store i32 %369, i32* %r, align 4, !dbg !4544
  br label %172, !dbg !4545

; <label>:370                                     ; preds = %172
  %371 = load %union.int_mv** %best_mv, align 8, !dbg !4546
  %372 = bitcast %union.int_mv* %371 to %struct.MV*, !dbg !4546
  %373 = getelementptr inbounds %struct.MV* %372, i32 0, i32 0, !dbg !4546
  %374 = load i16* %373, align 2, !dbg !4546
  %375 = sext i16 %374 to i32, !dbg !4546
  %376 = mul nsw i32 %375, 8, !dbg !4546
  %377 = trunc i32 %376 to i16, !dbg !4546
  %378 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4547
  %379 = getelementptr inbounds %struct.MV* %378, i32 0, i32 0, !dbg !4547
  store i16 %377, i16* %379, align 2, !dbg !4547
  %380 = load %union.int_mv** %best_mv, align 8, !dbg !4548
  %381 = bitcast %union.int_mv* %380 to %struct.MV*, !dbg !4548
  %382 = getelementptr inbounds %struct.MV* %381, i32 0, i32 1, !dbg !4548
  %383 = load i16* %382, align 2, !dbg !4548
  %384 = sext i16 %383 to i32, !dbg !4548
  %385 = mul nsw i32 %384, 8, !dbg !4548
  %386 = trunc i32 %385 to i16, !dbg !4548
  %387 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4549
  %388 = getelementptr inbounds %struct.MV* %387, i32 0, i32 1, !dbg !4549
  store i16 %386, i16* %388, align 2, !dbg !4549
  %389 = load %struct.variance_vtable** %7, align 8, !dbg !4550
  %390 = getelementptr inbounds %struct.variance_vtable* %389, i32 0, i32 1, !dbg !4550
  %391 = load i32 (i8*, i32, i8*, i32, i32*)** %390, align 8, !dbg !4550
  %392 = load i8** %what, align 8, !dbg !4551
  %393 = load i32* %what_stride, align 4, !dbg !4552
  %394 = load i8** %bestaddress, align 8, !dbg !4553
  %395 = load i32* %in_what_stride, align 4, !dbg !4554
  %396 = call i32 %391(i8* %392, i32 %393, i8* %394, i32 %395, i32* %thissad), !dbg !4550
  %397 = load %union.int_mv** %9, align 8, !dbg !4555
  %398 = load i32*** %8, align 8, !dbg !4556
  %399 = load %struct.macroblock** %1, align 8, !dbg !4557
  %400 = getelementptr inbounds %struct.macroblock* %399, i32 0, i32 15, !dbg !4557
  %401 = load i32* %400, align 4, !dbg !4557
  %402 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %397, i32** %398, i32 %401), !dbg !4558
  %403 = add i32 %396, %402, !dbg !4550
  ret i32 %403, !dbg !4559
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
  call void @llvm.dbg.declare(metadata %struct.macroblock** %1, metadata !4560, metadata !506), !dbg !4561
  store %struct.block* %b, %struct.block** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.block** %2, metadata !4562, metadata !506), !dbg !4563
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.blockd** %3, metadata !4564, metadata !506), !dbg !4565
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %4, metadata !4566, metadata !506), !dbg !4567
  store i32 %error_per_bit, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !4568, metadata !506), !dbg !4569
  store i32 %search_range, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !4570, metadata !506), !dbg !4571
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.variance_vtable** %7, metadata !4572, metadata !506), !dbg !4573
  store i32** %mvcost, i32*** %8, align 8
  call void @llvm.dbg.declare(metadata i32*** %8, metadata !4574, metadata !506), !dbg !4575
  store %union.int_mv* %center_mv, %union.int_mv** %9, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %9, metadata !4576, metadata !506), !dbg !4577
  call void @llvm.dbg.declare(metadata [4 x %struct.MV]* %neighbors, metadata !4578, metadata !506), !dbg !4579
  %10 = bitcast [4 x %struct.MV]* %neighbors to i8*, !dbg !4579
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* bitcast ([4 x %struct.MV]* @vp8_refining_search_sad_c.neighbors to i8*), i64 16, i32 16, i1 false), !dbg !4579
  call void @llvm.dbg.declare(metadata i32* %i, metadata !4580, metadata !506), !dbg !4581
  call void @llvm.dbg.declare(metadata i32* %j, metadata !4582, metadata !506), !dbg !4583
  call void @llvm.dbg.declare(metadata i16* %this_row_offset, metadata !4584, metadata !506), !dbg !4585
  call void @llvm.dbg.declare(metadata i16* %this_col_offset, metadata !4586, metadata !506), !dbg !4587
  call void @llvm.dbg.declare(metadata i32* %what_stride, metadata !4588, metadata !506), !dbg !4589
  %11 = load %struct.block** %2, align 8, !dbg !4590
  %12 = getelementptr inbounds %struct.block* %11, i32 0, i32 11, !dbg !4590
  %13 = load i32* %12, align 4, !dbg !4590
  store i32 %13, i32* %what_stride, align 4, !dbg !4589
  call void @llvm.dbg.declare(metadata i32* %pre_stride, metadata !4591, metadata !506), !dbg !4592
  %14 = load %struct.macroblock** %1, align 8, !dbg !4593
  %15 = getelementptr inbounds %struct.macroblock* %14, i32 0, i32 7, !dbg !4593
  %16 = getelementptr inbounds %struct.macroblockd* %15, i32 0, i32 11, !dbg !4593
  %17 = getelementptr inbounds %struct.yv12_buffer_config* %16, i32 0, i32 4, !dbg !4593
  %18 = load i32* %17, align 4, !dbg !4593
  store i32 %18, i32* %pre_stride, align 4, !dbg !4592
  call void @llvm.dbg.declare(metadata i8** %base_pre, metadata !4594, metadata !506), !dbg !4595
  %19 = load %struct.macroblock** %1, align 8, !dbg !4596
  %20 = getelementptr inbounds %struct.macroblock* %19, i32 0, i32 7, !dbg !4596
  %21 = getelementptr inbounds %struct.macroblockd* %20, i32 0, i32 11, !dbg !4596
  %22 = getelementptr inbounds %struct.yv12_buffer_config* %21, i32 0, i32 13, !dbg !4596
  %23 = load i8** %22, align 8, !dbg !4596
  store i8* %23, i8** %base_pre, align 8, !dbg !4595
  call void @llvm.dbg.declare(metadata i32* %in_what_stride, metadata !4597, metadata !506), !dbg !4598
  %24 = load i32* %pre_stride, align 4, !dbg !4599
  store i32 %24, i32* %in_what_stride, align 4, !dbg !4598
  call void @llvm.dbg.declare(metadata i8** %what, metadata !4600, metadata !506), !dbg !4601
  %25 = load %struct.block** %2, align 8, !dbg !4602
  %26 = getelementptr inbounds %struct.block* %25, i32 0, i32 9, !dbg !4602
  %27 = load i8*** %26, align 8, !dbg !4602
  %28 = load i8** %27, align 8, !dbg !4603
  %29 = load %struct.block** %2, align 8, !dbg !4604
  %30 = getelementptr inbounds %struct.block* %29, i32 0, i32 10, !dbg !4604
  %31 = load i32* %30, align 4, !dbg !4604
  %32 = sext i32 %31 to i64, !dbg !4603
  %33 = getelementptr inbounds i8* %28, i64 %32, !dbg !4603
  store i8* %33, i8** %what, align 8, !dbg !4601
  call void @llvm.dbg.declare(metadata i8** %best_address, metadata !4605, metadata !506), !dbg !4606
  %34 = load i8** %base_pre, align 8, !dbg !4607
  %35 = load %struct.blockd** %3, align 8, !dbg !4608
  %36 = getelementptr inbounds %struct.blockd* %35, i32 0, i32 4, !dbg !4608
  %37 = load i32* %36, align 4, !dbg !4608
  %38 = sext i32 %37 to i64, !dbg !4607
  %39 = getelementptr inbounds i8* %34, i64 %38, !dbg !4607
  %40 = load %union.int_mv** %4, align 8, !dbg !4609
  %41 = bitcast %union.int_mv* %40 to %struct.MV*, !dbg !4609
  %42 = getelementptr inbounds %struct.MV* %41, i32 0, i32 0, !dbg !4609
  %43 = load i16* %42, align 2, !dbg !4609
  %44 = sext i16 %43 to i32, !dbg !4609
  %45 = load i32* %pre_stride, align 4, !dbg !4610
  %46 = mul nsw i32 %44, %45, !dbg !4609
  %47 = sext i32 %46 to i64, !dbg !4607
  %48 = getelementptr inbounds i8* %39, i64 %47, !dbg !4607
  %49 = load %union.int_mv** %4, align 8, !dbg !4611
  %50 = bitcast %union.int_mv* %49 to %struct.MV*, !dbg !4611
  %51 = getelementptr inbounds %struct.MV* %50, i32 0, i32 1, !dbg !4611
  %52 = load i16* %51, align 2, !dbg !4611
  %53 = sext i16 %52 to i32, !dbg !4611
  %54 = sext i32 %53 to i64, !dbg !4607
  %55 = getelementptr inbounds i8* %48, i64 %54, !dbg !4607
  store i8* %55, i8** %best_address, align 8, !dbg !4606
  call void @llvm.dbg.declare(metadata i8** %check_here, metadata !4612, metadata !506), !dbg !4613
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !4614, metadata !506), !dbg !4615
  call void @llvm.dbg.declare(metadata i32* %bestsad, metadata !4616, metadata !506), !dbg !4617
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !4618, metadata !506), !dbg !4619
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !4620, metadata !506), !dbg !4621
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !4622, metadata !506), !dbg !4623
  %56 = load %struct.macroblock** %1, align 8, !dbg !4624
  %57 = getelementptr inbounds %struct.macroblock* %56, i32 0, i32 25, !dbg !4624
  %58 = getelementptr inbounds [2 x i32*]* %57, i32 0, i64 0, !dbg !4624
  %59 = load i32** %58, align 8, !dbg !4624
  %60 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !4625
  store i32* %59, i32** %60, align 8, !dbg !4625
  %61 = load %struct.macroblock** %1, align 8, !dbg !4626
  %62 = getelementptr inbounds %struct.macroblock* %61, i32 0, i32 25, !dbg !4626
  %63 = getelementptr inbounds [2 x i32*]* %62, i32 0, i64 1, !dbg !4626
  %64 = load i32** %63, align 8, !dbg !4626
  %65 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !4627
  store i32* %64, i32** %65, align 8, !dbg !4627
  %66 = load %union.int_mv** %9, align 8, !dbg !4628
  %67 = bitcast %union.int_mv* %66 to %struct.MV*, !dbg !4628
  %68 = getelementptr inbounds %struct.MV* %67, i32 0, i32 0, !dbg !4628
  %69 = load i16* %68, align 2, !dbg !4628
  %70 = sext i16 %69 to i32, !dbg !4628
  %71 = ashr i32 %70, 3, !dbg !4628
  %72 = trunc i32 %71 to i16, !dbg !4628
  %73 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !4629
  %74 = getelementptr inbounds %struct.MV* %73, i32 0, i32 0, !dbg !4629
  store i16 %72, i16* %74, align 2, !dbg !4629
  %75 = load %union.int_mv** %9, align 8, !dbg !4630
  %76 = bitcast %union.int_mv* %75 to %struct.MV*, !dbg !4630
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 1, !dbg !4630
  %78 = load i16* %77, align 2, !dbg !4630
  %79 = sext i16 %78 to i32, !dbg !4630
  %80 = ashr i32 %79, 3, !dbg !4630
  %81 = trunc i32 %80 to i16, !dbg !4630
  %82 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !4631
  %83 = getelementptr inbounds %struct.MV* %82, i32 0, i32 1, !dbg !4631
  store i16 %81, i16* %83, align 2, !dbg !4631
  %84 = load %struct.variance_vtable** %7, align 8, !dbg !4632
  %85 = getelementptr inbounds %struct.variance_vtable* %84, i32 0, i32 0, !dbg !4632
  %86 = load i32 (i8*, i32, i8*, i32, i32)** %85, align 8, !dbg !4632
  %87 = load i8** %what, align 8, !dbg !4633
  %88 = load i32* %what_stride, align 4, !dbg !4634
  %89 = load i8** %best_address, align 8, !dbg !4635
  %90 = load i32* %in_what_stride, align 4, !dbg !4636
  %91 = call i32 %86(i8* %87, i32 %88, i8* %89, i32 %90, i32 -1), !dbg !4632
  %92 = load %union.int_mv** %4, align 8, !dbg !4637
  %93 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !4638
  %94 = load i32* %5, align 4, !dbg !4639
  %95 = call i32 @mvsad_err_cost(%union.int_mv* %92, %union.int_mv* %fcenter_mv, i32** %93, i32 %94), !dbg !4640
  %96 = add i32 %91, %95, !dbg !4632
  store i32 %96, i32* %bestsad, align 4, !dbg !4641
  store i32 0, i32* %i, align 4, !dbg !4642
  br label %97, !dbg !4642

; <label>:97                                      ; preds = %264, %0
  %98 = load i32* %i, align 4, !dbg !4644
  %99 = load i32* %6, align 4, !dbg !4648
  %100 = icmp slt i32 %98, %99, !dbg !4649
  br i1 %100, label %101, label %267, !dbg !4650

; <label>:101                                     ; preds = %97
  call void @llvm.dbg.declare(metadata i32* %best_site, metadata !4651, metadata !506), !dbg !4653
  store i32 -1, i32* %best_site, align 4, !dbg !4653
  store i32 0, i32* %j, align 4, !dbg !4654
  br label %102, !dbg !4654

; <label>:102                                     ; preds = %211, %101
  %103 = load i32* %j, align 4, !dbg !4656
  %104 = icmp slt i32 %103, 4, !dbg !4656
  br i1 %104, label %105, label %214, !dbg !4660

; <label>:105                                     ; preds = %102
  %106 = load %union.int_mv** %4, align 8, !dbg !4661
  %107 = bitcast %union.int_mv* %106 to %struct.MV*, !dbg !4661
  %108 = getelementptr inbounds %struct.MV* %107, i32 0, i32 0, !dbg !4661
  %109 = load i16* %108, align 2, !dbg !4661
  %110 = sext i16 %109 to i32, !dbg !4661
  %111 = load i32* %j, align 4, !dbg !4663
  %112 = sext i32 %111 to i64, !dbg !4664
  %113 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %112, !dbg !4664
  %114 = getelementptr inbounds %struct.MV* %113, i32 0, i32 0, !dbg !4664
  %115 = load i16* %114, align 2, !dbg !4664
  %116 = sext i16 %115 to i32, !dbg !4664
  %117 = add nsw i32 %110, %116, !dbg !4661
  %118 = trunc i32 %117 to i16, !dbg !4661
  store i16 %118, i16* %this_row_offset, align 2, !dbg !4665
  %119 = load %union.int_mv** %4, align 8, !dbg !4666
  %120 = bitcast %union.int_mv* %119 to %struct.MV*, !dbg !4666
  %121 = getelementptr inbounds %struct.MV* %120, i32 0, i32 1, !dbg !4666
  %122 = load i16* %121, align 2, !dbg !4666
  %123 = sext i16 %122 to i32, !dbg !4666
  %124 = load i32* %j, align 4, !dbg !4667
  %125 = sext i32 %124 to i64, !dbg !4668
  %126 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %125, !dbg !4668
  %127 = getelementptr inbounds %struct.MV* %126, i32 0, i32 1, !dbg !4668
  %128 = load i16* %127, align 2, !dbg !4668
  %129 = sext i16 %128 to i32, !dbg !4668
  %130 = add nsw i32 %123, %129, !dbg !4666
  %131 = trunc i32 %130 to i16, !dbg !4666
  store i16 %131, i16* %this_col_offset, align 2, !dbg !4669
  %132 = load i16* %this_col_offset, align 2, !dbg !4670
  %133 = sext i16 %132 to i32, !dbg !4670
  %134 = load %struct.macroblock** %1, align 8, !dbg !4672
  %135 = getelementptr inbounds %struct.macroblock* %134, i32 0, i32 31, !dbg !4672
  %136 = load i32* %135, align 4, !dbg !4672
  %137 = icmp sgt i32 %133, %136, !dbg !4670
  br i1 %137, label %138, label %210, !dbg !4673

; <label>:138                                     ; preds = %105
  %139 = load i16* %this_col_offset, align 2, !dbg !4674
  %140 = sext i16 %139 to i32, !dbg !4674
  %141 = load %struct.macroblock** %1, align 8, !dbg !4676
  %142 = getelementptr inbounds %struct.macroblock* %141, i32 0, i32 32, !dbg !4676
  %143 = load i32* %142, align 4, !dbg !4676
  %144 = icmp slt i32 %140, %143, !dbg !4677
  br i1 %144, label %145, label %210, !dbg !4673

; <label>:145                                     ; preds = %138
  %146 = load i16* %this_row_offset, align 2, !dbg !4678
  %147 = sext i16 %146 to i32, !dbg !4678
  %148 = load %struct.macroblock** %1, align 8, !dbg !4679
  %149 = getelementptr inbounds %struct.macroblock* %148, i32 0, i32 33, !dbg !4679
  %150 = load i32* %149, align 4, !dbg !4679
  %151 = icmp sgt i32 %147, %150, !dbg !4678
  br i1 %151, label %152, label %210, !dbg !4673

; <label>:152                                     ; preds = %145
  %153 = load i16* %this_row_offset, align 2, !dbg !4680
  %154 = sext i16 %153 to i32, !dbg !4680
  %155 = load %struct.macroblock** %1, align 8, !dbg !4681
  %156 = getelementptr inbounds %struct.macroblock* %155, i32 0, i32 34, !dbg !4681
  %157 = load i32* %156, align 4, !dbg !4681
  %158 = icmp slt i32 %154, %157, !dbg !4680
  br i1 %158, label %159, label %210, !dbg !4673

; <label>:159                                     ; preds = %152
  %160 = load i32* %j, align 4, !dbg !4682
  %161 = sext i32 %160 to i64, !dbg !4684
  %162 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %161, !dbg !4684
  %163 = getelementptr inbounds %struct.MV* %162, i32 0, i32 0, !dbg !4684
  %164 = load i16* %163, align 2, !dbg !4684
  %165 = sext i16 %164 to i32, !dbg !4685
  %166 = load i32* %in_what_stride, align 4, !dbg !4686
  %167 = mul nsw i32 %165, %166, !dbg !4685
  %168 = load i32* %j, align 4, !dbg !4687
  %169 = sext i32 %168 to i64, !dbg !4688
  %170 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %169, !dbg !4688
  %171 = getelementptr inbounds %struct.MV* %170, i32 0, i32 1, !dbg !4688
  %172 = load i16* %171, align 2, !dbg !4688
  %173 = sext i16 %172 to i32, !dbg !4688
  %174 = add nsw i32 %167, %173, !dbg !4685
  %175 = load i8** %best_address, align 8, !dbg !4689
  %176 = sext i32 %174 to i64, !dbg !4685
  %177 = getelementptr inbounds i8* %175, i64 %176, !dbg !4685
  store i8* %177, i8** %check_here, align 8, !dbg !4690
  %178 = load %struct.variance_vtable** %7, align 8, !dbg !4691
  %179 = getelementptr inbounds %struct.variance_vtable* %178, i32 0, i32 0, !dbg !4691
  %180 = load i32 (i8*, i32, i8*, i32, i32)** %179, align 8, !dbg !4691
  %181 = load i8** %what, align 8, !dbg !4692
  %182 = load i32* %what_stride, align 4, !dbg !4693
  %183 = load i8** %check_here, align 8, !dbg !4694
  %184 = load i32* %in_what_stride, align 4, !dbg !4695
  %185 = load i32* %bestsad, align 4, !dbg !4696
  %186 = call i32 %180(i8* %181, i32 %182, i8* %183, i32 %184, i32 %185), !dbg !4691
  store i32 %186, i32* %thissad, align 4, !dbg !4697
  %187 = load i32* %thissad, align 4, !dbg !4698
  %188 = load i32* %bestsad, align 4, !dbg !4700
  %189 = icmp ult i32 %187, %188, !dbg !4698
  br i1 %189, label %190, label %209, !dbg !4701

; <label>:190                                     ; preds = %159
  %191 = load i16* %this_row_offset, align 2, !dbg !4702
  %192 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4704
  %193 = getelementptr inbounds %struct.MV* %192, i32 0, i32 0, !dbg !4704
  store i16 %191, i16* %193, align 2, !dbg !4704
  %194 = load i16* %this_col_offset, align 2, !dbg !4705
  %195 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4706
  %196 = getelementptr inbounds %struct.MV* %195, i32 0, i32 1, !dbg !4706
  store i16 %194, i16* %196, align 2, !dbg !4706
  %197 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !4707
  %198 = load i32* %5, align 4, !dbg !4708
  %199 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %197, i32 %198), !dbg !4709
  %200 = load i32* %thissad, align 4, !dbg !4710
  %201 = add i32 %200, %199, !dbg !4710
  store i32 %201, i32* %thissad, align 4, !dbg !4710
  %202 = load i32* %thissad, align 4, !dbg !4711
  %203 = load i32* %bestsad, align 4, !dbg !4713
  %204 = icmp ult i32 %202, %203, !dbg !4711
  br i1 %204, label %205, label %208, !dbg !4714

; <label>:205                                     ; preds = %190
  %206 = load i32* %thissad, align 4, !dbg !4715
  store i32 %206, i32* %bestsad, align 4, !dbg !4717
  %207 = load i32* %j, align 4, !dbg !4718
  store i32 %207, i32* %best_site, align 4, !dbg !4719
  br label %208, !dbg !4720

; <label>:208                                     ; preds = %205, %190
  br label %209, !dbg !4721

; <label>:209                                     ; preds = %208, %159
  br label %210, !dbg !4722

; <label>:210                                     ; preds = %209, %152, %145, %138, %105
  br label %211, !dbg !4723

; <label>:211                                     ; preds = %210
  %212 = load i32* %j, align 4, !dbg !4724
  %213 = add nsw i32 %212, 1, !dbg !4724
  store i32 %213, i32* %j, align 4, !dbg !4724
  br label %102, !dbg !4725

; <label>:214                                     ; preds = %102
  %215 = load i32* %best_site, align 4, !dbg !4726
  %216 = icmp eq i32 %215, -1, !dbg !4726
  br i1 %216, label %217, label %218, !dbg !4728

; <label>:217                                     ; preds = %214
  br label %267, !dbg !4729

; <label>:218                                     ; preds = %214
  %219 = load i32* %best_site, align 4, !dbg !4730
  %220 = sext i32 %219 to i64, !dbg !4732
  %221 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %220, !dbg !4732
  %222 = getelementptr inbounds %struct.MV* %221, i32 0, i32 0, !dbg !4732
  %223 = load i16* %222, align 2, !dbg !4732
  %224 = sext i16 %223 to i32, !dbg !4732
  %225 = load %union.int_mv** %4, align 8, !dbg !4733
  %226 = bitcast %union.int_mv* %225 to %struct.MV*, !dbg !4733
  %227 = getelementptr inbounds %struct.MV* %226, i32 0, i32 0, !dbg !4733
  %228 = load i16* %227, align 2, !dbg !4733
  %229 = sext i16 %228 to i32, !dbg !4733
  %230 = add nsw i32 %229, %224, !dbg !4733
  %231 = trunc i32 %230 to i16, !dbg !4733
  store i16 %231, i16* %227, align 2, !dbg !4733
  %232 = load i32* %best_site, align 4, !dbg !4734
  %233 = sext i32 %232 to i64, !dbg !4735
  %234 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %233, !dbg !4735
  %235 = getelementptr inbounds %struct.MV* %234, i32 0, i32 1, !dbg !4735
  %236 = load i16* %235, align 2, !dbg !4735
  %237 = sext i16 %236 to i32, !dbg !4735
  %238 = load %union.int_mv** %4, align 8, !dbg !4736
  %239 = bitcast %union.int_mv* %238 to %struct.MV*, !dbg !4736
  %240 = getelementptr inbounds %struct.MV* %239, i32 0, i32 1, !dbg !4736
  %241 = load i16* %240, align 2, !dbg !4736
  %242 = sext i16 %241 to i32, !dbg !4736
  %243 = add nsw i32 %242, %237, !dbg !4736
  %244 = trunc i32 %243 to i16, !dbg !4736
  store i16 %244, i16* %240, align 2, !dbg !4736
  %245 = load i32* %best_site, align 4, !dbg !4737
  %246 = sext i32 %245 to i64, !dbg !4738
  %247 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %246, !dbg !4738
  %248 = getelementptr inbounds %struct.MV* %247, i32 0, i32 0, !dbg !4738
  %249 = load i16* %248, align 2, !dbg !4738
  %250 = sext i16 %249 to i32, !dbg !4739
  %251 = load i32* %in_what_stride, align 4, !dbg !4740
  %252 = mul nsw i32 %250, %251, !dbg !4739
  %253 = load i32* %best_site, align 4, !dbg !4741
  %254 = sext i32 %253 to i64, !dbg !4742
  %255 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %254, !dbg !4742
  %256 = getelementptr inbounds %struct.MV* %255, i32 0, i32 1, !dbg !4742
  %257 = load i16* %256, align 2, !dbg !4742
  %258 = sext i16 %257 to i32, !dbg !4742
  %259 = add nsw i32 %252, %258, !dbg !4739
  %260 = load i8** %best_address, align 8, !dbg !4743
  %261 = sext i32 %259 to i64, !dbg !4743
  %262 = getelementptr inbounds i8* %260, i64 %261, !dbg !4743
  store i8* %262, i8** %best_address, align 8, !dbg !4743
  br label %263

; <label>:263                                     ; preds = %218
  br label %264, !dbg !4744

; <label>:264                                     ; preds = %263
  %265 = load i32* %i, align 4, !dbg !4745
  %266 = add nsw i32 %265, 1, !dbg !4745
  store i32 %266, i32* %i, align 4, !dbg !4745
  br label %97, !dbg !4746

; <label>:267                                     ; preds = %217, %97
  %268 = load %union.int_mv** %4, align 8, !dbg !4747
  %269 = bitcast %union.int_mv* %268 to %struct.MV*, !dbg !4747
  %270 = getelementptr inbounds %struct.MV* %269, i32 0, i32 0, !dbg !4747
  %271 = load i16* %270, align 2, !dbg !4747
  %272 = sext i16 %271 to i32, !dbg !4747
  %273 = shl i32 %272, 3, !dbg !4747
  %274 = trunc i32 %273 to i16, !dbg !4747
  %275 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4748
  %276 = getelementptr inbounds %struct.MV* %275, i32 0, i32 0, !dbg !4748
  store i16 %274, i16* %276, align 2, !dbg !4748
  %277 = load %union.int_mv** %4, align 8, !dbg !4749
  %278 = bitcast %union.int_mv* %277 to %struct.MV*, !dbg !4749
  %279 = getelementptr inbounds %struct.MV* %278, i32 0, i32 1, !dbg !4749
  %280 = load i16* %279, align 2, !dbg !4749
  %281 = sext i16 %280 to i32, !dbg !4749
  %282 = shl i32 %281, 3, !dbg !4749
  %283 = trunc i32 %282 to i16, !dbg !4749
  %284 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4750
  %285 = getelementptr inbounds %struct.MV* %284, i32 0, i32 1, !dbg !4750
  store i16 %283, i16* %285, align 2, !dbg !4750
  %286 = load %struct.variance_vtable** %7, align 8, !dbg !4751
  %287 = getelementptr inbounds %struct.variance_vtable* %286, i32 0, i32 1, !dbg !4751
  %288 = load i32 (i8*, i32, i8*, i32, i32*)** %287, align 8, !dbg !4751
  %289 = load i8** %what, align 8, !dbg !4752
  %290 = load i32* %what_stride, align 4, !dbg !4753
  %291 = load i8** %best_address, align 8, !dbg !4754
  %292 = load i32* %in_what_stride, align 4, !dbg !4755
  %293 = call i32 %288(i8* %289, i32 %290, i8* %291, i32 %292, i32* %thissad), !dbg !4751
  %294 = load %union.int_mv** %9, align 8, !dbg !4756
  %295 = load i32*** %8, align 8, !dbg !4757
  %296 = load %struct.macroblock** %1, align 8, !dbg !4758
  %297 = getelementptr inbounds %struct.macroblock* %296, i32 0, i32 15, !dbg !4758
  %298 = load i32* %297, align 4, !dbg !4758
  %299 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %294, i32** %295, i32 %298), !dbg !4759
  %300 = add i32 %293, %299, !dbg !4751
  ret i32 %300, !dbg !4760
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
  call void @llvm.dbg.declare(metadata %struct.macroblock** %1, metadata !4761, metadata !506), !dbg !4762
  store %struct.block* %b, %struct.block** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.block** %2, metadata !4763, metadata !506), !dbg !4764
  store %struct.blockd* %d, %struct.blockd** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.blockd** %3, metadata !4765, metadata !506), !dbg !4766
  store %union.int_mv* %ref_mv, %union.int_mv** %4, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %4, metadata !4767, metadata !506), !dbg !4768
  store i32 %error_per_bit, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !4769, metadata !506), !dbg !4770
  store i32 %search_range, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !4771, metadata !506), !dbg !4772
  store %struct.variance_vtable* %fn_ptr, %struct.variance_vtable** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.variance_vtable** %7, metadata !4773, metadata !506), !dbg !4774
  store i32** %mvcost, i32*** %8, align 8
  call void @llvm.dbg.declare(metadata i32*** %8, metadata !4775, metadata !506), !dbg !4776
  store %union.int_mv* %center_mv, %union.int_mv** %9, align 8
  call void @llvm.dbg.declare(metadata %union.int_mv** %9, metadata !4777, metadata !506), !dbg !4778
  call void @llvm.dbg.declare(metadata [4 x %struct.MV]* %neighbors, metadata !4779, metadata !506), !dbg !4780
  %10 = bitcast [4 x %struct.MV]* %neighbors to i8*, !dbg !4780
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* bitcast ([4 x %struct.MV]* @vp8_refining_search_sadx4.neighbors to i8*), i64 16, i32 16, i1 false), !dbg !4780
  call void @llvm.dbg.declare(metadata i32* %i, metadata !4781, metadata !506), !dbg !4782
  call void @llvm.dbg.declare(metadata i32* %j, metadata !4783, metadata !506), !dbg !4784
  call void @llvm.dbg.declare(metadata i16* %this_row_offset, metadata !4785, metadata !506), !dbg !4786
  call void @llvm.dbg.declare(metadata i16* %this_col_offset, metadata !4787, metadata !506), !dbg !4788
  call void @llvm.dbg.declare(metadata i32* %what_stride, metadata !4789, metadata !506), !dbg !4790
  %11 = load %struct.block** %2, align 8, !dbg !4791
  %12 = getelementptr inbounds %struct.block* %11, i32 0, i32 11, !dbg !4791
  %13 = load i32* %12, align 4, !dbg !4791
  store i32 %13, i32* %what_stride, align 4, !dbg !4790
  call void @llvm.dbg.declare(metadata i32* %pre_stride, metadata !4792, metadata !506), !dbg !4793
  %14 = load %struct.macroblock** %1, align 8, !dbg !4794
  %15 = getelementptr inbounds %struct.macroblock* %14, i32 0, i32 7, !dbg !4794
  %16 = getelementptr inbounds %struct.macroblockd* %15, i32 0, i32 11, !dbg !4794
  %17 = getelementptr inbounds %struct.yv12_buffer_config* %16, i32 0, i32 4, !dbg !4794
  %18 = load i32* %17, align 4, !dbg !4794
  store i32 %18, i32* %pre_stride, align 4, !dbg !4793
  call void @llvm.dbg.declare(metadata i8** %base_pre, metadata !4795, metadata !506), !dbg !4796
  %19 = load %struct.macroblock** %1, align 8, !dbg !4797
  %20 = getelementptr inbounds %struct.macroblock* %19, i32 0, i32 7, !dbg !4797
  %21 = getelementptr inbounds %struct.macroblockd* %20, i32 0, i32 11, !dbg !4797
  %22 = getelementptr inbounds %struct.yv12_buffer_config* %21, i32 0, i32 13, !dbg !4797
  %23 = load i8** %22, align 8, !dbg !4797
  store i8* %23, i8** %base_pre, align 8, !dbg !4796
  call void @llvm.dbg.declare(metadata i32* %in_what_stride, metadata !4798, metadata !506), !dbg !4799
  %24 = load i32* %pre_stride, align 4, !dbg !4800
  store i32 %24, i32* %in_what_stride, align 4, !dbg !4799
  call void @llvm.dbg.declare(metadata i8** %what, metadata !4801, metadata !506), !dbg !4802
  %25 = load %struct.block** %2, align 8, !dbg !4803
  %26 = getelementptr inbounds %struct.block* %25, i32 0, i32 9, !dbg !4803
  %27 = load i8*** %26, align 8, !dbg !4803
  %28 = load i8** %27, align 8, !dbg !4804
  %29 = load %struct.block** %2, align 8, !dbg !4805
  %30 = getelementptr inbounds %struct.block* %29, i32 0, i32 10, !dbg !4805
  %31 = load i32* %30, align 4, !dbg !4805
  %32 = sext i32 %31 to i64, !dbg !4804
  %33 = getelementptr inbounds i8* %28, i64 %32, !dbg !4804
  store i8* %33, i8** %what, align 8, !dbg !4802
  call void @llvm.dbg.declare(metadata i8** %best_address, metadata !4806, metadata !506), !dbg !4807
  %34 = load i8** %base_pre, align 8, !dbg !4808
  %35 = load %struct.blockd** %3, align 8, !dbg !4809
  %36 = getelementptr inbounds %struct.blockd* %35, i32 0, i32 4, !dbg !4809
  %37 = load i32* %36, align 4, !dbg !4809
  %38 = sext i32 %37 to i64, !dbg !4808
  %39 = getelementptr inbounds i8* %34, i64 %38, !dbg !4808
  %40 = load %union.int_mv** %4, align 8, !dbg !4810
  %41 = bitcast %union.int_mv* %40 to %struct.MV*, !dbg !4810
  %42 = getelementptr inbounds %struct.MV* %41, i32 0, i32 0, !dbg !4810
  %43 = load i16* %42, align 2, !dbg !4810
  %44 = sext i16 %43 to i32, !dbg !4810
  %45 = load i32* %pre_stride, align 4, !dbg !4811
  %46 = mul nsw i32 %44, %45, !dbg !4810
  %47 = sext i32 %46 to i64, !dbg !4808
  %48 = getelementptr inbounds i8* %39, i64 %47, !dbg !4808
  %49 = load %union.int_mv** %4, align 8, !dbg !4812
  %50 = bitcast %union.int_mv* %49 to %struct.MV*, !dbg !4812
  %51 = getelementptr inbounds %struct.MV* %50, i32 0, i32 1, !dbg !4812
  %52 = load i16* %51, align 2, !dbg !4812
  %53 = sext i16 %52 to i32, !dbg !4812
  %54 = sext i32 %53 to i64, !dbg !4808
  %55 = getelementptr inbounds i8* %48, i64 %54, !dbg !4808
  store i8* %55, i8** %best_address, align 8, !dbg !4807
  call void @llvm.dbg.declare(metadata i8** %check_here, metadata !4813, metadata !506), !dbg !4814
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !4815, metadata !506), !dbg !4816
  call void @llvm.dbg.declare(metadata i32* %bestsad, metadata !4817, metadata !506), !dbg !4818
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !4819, metadata !506), !dbg !4820
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !4821, metadata !506), !dbg !4822
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !4823, metadata !506), !dbg !4824
  %56 = load %struct.macroblock** %1, align 8, !dbg !4825
  %57 = getelementptr inbounds %struct.macroblock* %56, i32 0, i32 25, !dbg !4825
  %58 = getelementptr inbounds [2 x i32*]* %57, i32 0, i64 0, !dbg !4825
  %59 = load i32** %58, align 8, !dbg !4825
  %60 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !4826
  store i32* %59, i32** %60, align 8, !dbg !4826
  %61 = load %struct.macroblock** %1, align 8, !dbg !4827
  %62 = getelementptr inbounds %struct.macroblock* %61, i32 0, i32 25, !dbg !4827
  %63 = getelementptr inbounds [2 x i32*]* %62, i32 0, i64 1, !dbg !4827
  %64 = load i32** %63, align 8, !dbg !4827
  %65 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !4828
  store i32* %64, i32** %65, align 8, !dbg !4828
  %66 = load %union.int_mv** %9, align 8, !dbg !4829
  %67 = bitcast %union.int_mv* %66 to %struct.MV*, !dbg !4829
  %68 = getelementptr inbounds %struct.MV* %67, i32 0, i32 0, !dbg !4829
  %69 = load i16* %68, align 2, !dbg !4829
  %70 = sext i16 %69 to i32, !dbg !4829
  %71 = ashr i32 %70, 3, !dbg !4829
  %72 = trunc i32 %71 to i16, !dbg !4829
  %73 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !4830
  %74 = getelementptr inbounds %struct.MV* %73, i32 0, i32 0, !dbg !4830
  store i16 %72, i16* %74, align 2, !dbg !4830
  %75 = load %union.int_mv** %9, align 8, !dbg !4831
  %76 = bitcast %union.int_mv* %75 to %struct.MV*, !dbg !4831
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 1, !dbg !4831
  %78 = load i16* %77, align 2, !dbg !4831
  %79 = sext i16 %78 to i32, !dbg !4831
  %80 = ashr i32 %79, 3, !dbg !4831
  %81 = trunc i32 %80 to i16, !dbg !4831
  %82 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !4832
  %83 = getelementptr inbounds %struct.MV* %82, i32 0, i32 1, !dbg !4832
  store i16 %81, i16* %83, align 2, !dbg !4832
  %84 = load %struct.variance_vtable** %7, align 8, !dbg !4833
  %85 = getelementptr inbounds %struct.variance_vtable* %84, i32 0, i32 0, !dbg !4833
  %86 = load i32 (i8*, i32, i8*, i32, i32)** %85, align 8, !dbg !4833
  %87 = load i8** %what, align 8, !dbg !4834
  %88 = load i32* %what_stride, align 4, !dbg !4835
  %89 = load i8** %best_address, align 8, !dbg !4836
  %90 = load i32* %in_what_stride, align 4, !dbg !4837
  %91 = call i32 %86(i8* %87, i32 %88, i8* %89, i32 %90, i32 -1), !dbg !4833
  %92 = load %union.int_mv** %4, align 8, !dbg !4838
  %93 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !4839
  %94 = load i32* %5, align 4, !dbg !4840
  %95 = call i32 @mvsad_err_cost(%union.int_mv* %92, %union.int_mv* %fcenter_mv, i32** %93, i32 %94), !dbg !4841
  %96 = add i32 %91, %95, !dbg !4833
  store i32 %96, i32* %bestsad, align 4, !dbg !4842
  store i32 0, i32* %i, align 4, !dbg !4843
  br label %97, !dbg !4843

; <label>:97                                      ; preds = %413, %0
  %98 = load i32* %i, align 4, !dbg !4845
  %99 = load i32* %6, align 4, !dbg !4849
  %100 = icmp slt i32 %98, %99, !dbg !4850
  br i1 %100, label %101, label %416, !dbg !4851

; <label>:101                                     ; preds = %97
  call void @llvm.dbg.declare(metadata i32* %best_site, metadata !4852, metadata !506), !dbg !4854
  store i32 -1, i32* %best_site, align 4, !dbg !4854
  call void @llvm.dbg.declare(metadata i32* %all_in, metadata !4855, metadata !506), !dbg !4856
  store i32 1, i32* %all_in, align 4, !dbg !4856
  %102 = load %union.int_mv** %4, align 8, !dbg !4857
  %103 = bitcast %union.int_mv* %102 to %struct.MV*, !dbg !4857
  %104 = getelementptr inbounds %struct.MV* %103, i32 0, i32 0, !dbg !4857
  %105 = load i16* %104, align 2, !dbg !4857
  %106 = sext i16 %105 to i32, !dbg !4857
  %107 = sub nsw i32 %106, 1, !dbg !4857
  %108 = load %struct.macroblock** %1, align 8, !dbg !4858
  %109 = getelementptr inbounds %struct.macroblock* %108, i32 0, i32 33, !dbg !4858
  %110 = load i32* %109, align 4, !dbg !4858
  %111 = icmp sgt i32 %107, %110, !dbg !4859
  %112 = zext i1 %111 to i32, !dbg !4859
  %113 = load i32* %all_in, align 4, !dbg !4860
  %114 = and i32 %113, %112, !dbg !4860
  store i32 %114, i32* %all_in, align 4, !dbg !4860
  %115 = load %union.int_mv** %4, align 8, !dbg !4861
  %116 = bitcast %union.int_mv* %115 to %struct.MV*, !dbg !4861
  %117 = getelementptr inbounds %struct.MV* %116, i32 0, i32 0, !dbg !4861
  %118 = load i16* %117, align 2, !dbg !4861
  %119 = sext i16 %118 to i32, !dbg !4861
  %120 = add nsw i32 %119, 1, !dbg !4861
  %121 = load %struct.macroblock** %1, align 8, !dbg !4862
  %122 = getelementptr inbounds %struct.macroblock* %121, i32 0, i32 34, !dbg !4862
  %123 = load i32* %122, align 4, !dbg !4862
  %124 = icmp slt i32 %120, %123, !dbg !4863
  %125 = zext i1 %124 to i32, !dbg !4863
  %126 = load i32* %all_in, align 4, !dbg !4864
  %127 = and i32 %126, %125, !dbg !4864
  store i32 %127, i32* %all_in, align 4, !dbg !4864
  %128 = load %union.int_mv** %4, align 8, !dbg !4865
  %129 = bitcast %union.int_mv* %128 to %struct.MV*, !dbg !4865
  %130 = getelementptr inbounds %struct.MV* %129, i32 0, i32 1, !dbg !4865
  %131 = load i16* %130, align 2, !dbg !4865
  %132 = sext i16 %131 to i32, !dbg !4865
  %133 = sub nsw i32 %132, 1, !dbg !4865
  %134 = load %struct.macroblock** %1, align 8, !dbg !4866
  %135 = getelementptr inbounds %struct.macroblock* %134, i32 0, i32 31, !dbg !4866
  %136 = load i32* %135, align 4, !dbg !4866
  %137 = icmp sgt i32 %133, %136, !dbg !4867
  %138 = zext i1 %137 to i32, !dbg !4867
  %139 = load i32* %all_in, align 4, !dbg !4868
  %140 = and i32 %139, %138, !dbg !4868
  store i32 %140, i32* %all_in, align 4, !dbg !4868
  %141 = load %union.int_mv** %4, align 8, !dbg !4869
  %142 = bitcast %union.int_mv* %141 to %struct.MV*, !dbg !4869
  %143 = getelementptr inbounds %struct.MV* %142, i32 0, i32 1, !dbg !4869
  %144 = load i16* %143, align 2, !dbg !4869
  %145 = sext i16 %144 to i32, !dbg !4869
  %146 = add nsw i32 %145, 1, !dbg !4869
  %147 = load %struct.macroblock** %1, align 8, !dbg !4870
  %148 = getelementptr inbounds %struct.macroblock* %147, i32 0, i32 32, !dbg !4870
  %149 = load i32* %148, align 4, !dbg !4870
  %150 = icmp slt i32 %146, %149, !dbg !4871
  %151 = zext i1 %150 to i32, !dbg !4871
  %152 = load i32* %all_in, align 4, !dbg !4872
  %153 = and i32 %152, %151, !dbg !4872
  store i32 %153, i32* %all_in, align 4, !dbg !4872
  %154 = load i32* %all_in, align 4, !dbg !4873
  %155 = icmp ne i32 %154, 0, !dbg !4875
  br i1 %155, label %156, label %249, !dbg !4875

; <label>:156                                     ; preds = %101
  call void @llvm.dbg.declare(metadata [4 x i32]* %sad_array, metadata !4876, metadata !506), !dbg !4878
  call void @llvm.dbg.declare(metadata [4 x i8*]* %block_offset, metadata !4879, metadata !506), !dbg !4880
  %157 = load i8** %best_address, align 8, !dbg !4881
  %158 = load i32* %in_what_stride, align 4, !dbg !4882
  %159 = sext i32 %158 to i64, !dbg !4881
  %160 = sub i64 0, %159, !dbg !4881
  %161 = getelementptr inbounds i8* %157, i64 %160, !dbg !4881
  %162 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 0, !dbg !4883
  store i8* %161, i8** %162, align 8, !dbg !4883
  %163 = load i8** %best_address, align 8, !dbg !4884
  %164 = getelementptr inbounds i8* %163, i64 -1, !dbg !4884
  %165 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 1, !dbg !4885
  store i8* %164, i8** %165, align 8, !dbg !4885
  %166 = load i8** %best_address, align 8, !dbg !4886
  %167 = getelementptr inbounds i8* %166, i64 1, !dbg !4886
  %168 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 2, !dbg !4887
  store i8* %167, i8** %168, align 8, !dbg !4887
  %169 = load i8** %best_address, align 8, !dbg !4888
  %170 = load i32* %in_what_stride, align 4, !dbg !4889
  %171 = sext i32 %170 to i64, !dbg !4888
  %172 = getelementptr inbounds i8* %169, i64 %171, !dbg !4888
  %173 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 3, !dbg !4890
  store i8* %172, i8** %173, align 8, !dbg !4890
  %174 = load %struct.variance_vtable** %7, align 8, !dbg !4891
  %175 = getelementptr inbounds %struct.variance_vtable* %174, i32 0, i32 8, !dbg !4891
  %176 = load void (i8*, i32, i8**, i32, i32*)** %175, align 8, !dbg !4891
  %177 = load i8** %what, align 8, !dbg !4892
  %178 = load i32* %what_stride, align 4, !dbg !4893
  %179 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i32 0, !dbg !4894
  %180 = load i32* %in_what_stride, align 4, !dbg !4895
  %181 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i32 0, !dbg !4896
  call void %176(i8* %177, i32 %178, i8** %179, i32 %180, i32* %181), !dbg !4891
  store i32 0, i32* %j, align 4, !dbg !4897
  br label %182, !dbg !4897

; <label>:182                                     ; preds = %245, %156
  %183 = load i32* %j, align 4, !dbg !4899
  %184 = icmp slt i32 %183, 4, !dbg !4899
  br i1 %184, label %185, label %248, !dbg !4903

; <label>:185                                     ; preds = %182
  %186 = load i32* %j, align 4, !dbg !4904
  %187 = sext i32 %186 to i64, !dbg !4907
  %188 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %187, !dbg !4907
  %189 = load i32* %188, align 4, !dbg !4907
  %190 = load i32* %bestsad, align 4, !dbg !4908
  %191 = icmp ult i32 %189, %190, !dbg !4907
  br i1 %191, label %192, label %244, !dbg !4909

; <label>:192                                     ; preds = %185
  %193 = load %union.int_mv** %4, align 8, !dbg !4910
  %194 = bitcast %union.int_mv* %193 to %struct.MV*, !dbg !4910
  %195 = getelementptr inbounds %struct.MV* %194, i32 0, i32 0, !dbg !4910
  %196 = load i16* %195, align 2, !dbg !4910
  %197 = sext i16 %196 to i32, !dbg !4910
  %198 = load i32* %j, align 4, !dbg !4912
  %199 = sext i32 %198 to i64, !dbg !4913
  %200 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %199, !dbg !4913
  %201 = getelementptr inbounds %struct.MV* %200, i32 0, i32 0, !dbg !4913
  %202 = load i16* %201, align 2, !dbg !4913
  %203 = sext i16 %202 to i32, !dbg !4913
  %204 = add nsw i32 %197, %203, !dbg !4910
  %205 = trunc i32 %204 to i16, !dbg !4910
  %206 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4914
  %207 = getelementptr inbounds %struct.MV* %206, i32 0, i32 0, !dbg !4914
  store i16 %205, i16* %207, align 2, !dbg !4914
  %208 = load %union.int_mv** %4, align 8, !dbg !4915
  %209 = bitcast %union.int_mv* %208 to %struct.MV*, !dbg !4915
  %210 = getelementptr inbounds %struct.MV* %209, i32 0, i32 1, !dbg !4915
  %211 = load i16* %210, align 2, !dbg !4915
  %212 = sext i16 %211 to i32, !dbg !4915
  %213 = load i32* %j, align 4, !dbg !4916
  %214 = sext i32 %213 to i64, !dbg !4917
  %215 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %214, !dbg !4917
  %216 = getelementptr inbounds %struct.MV* %215, i32 0, i32 1, !dbg !4917
  %217 = load i16* %216, align 2, !dbg !4917
  %218 = sext i16 %217 to i32, !dbg !4917
  %219 = add nsw i32 %212, %218, !dbg !4915
  %220 = trunc i32 %219 to i16, !dbg !4915
  %221 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4918
  %222 = getelementptr inbounds %struct.MV* %221, i32 0, i32 1, !dbg !4918
  store i16 %220, i16* %222, align 2, !dbg !4918
  %223 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !4919
  %224 = load i32* %5, align 4, !dbg !4920
  %225 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %223, i32 %224), !dbg !4921
  %226 = load i32* %j, align 4, !dbg !4922
  %227 = sext i32 %226 to i64, !dbg !4923
  %228 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %227, !dbg !4923
  %229 = load i32* %228, align 4, !dbg !4923
  %230 = add i32 %229, %225, !dbg !4923
  store i32 %230, i32* %228, align 4, !dbg !4923
  %231 = load i32* %j, align 4, !dbg !4924
  %232 = sext i32 %231 to i64, !dbg !4926
  %233 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %232, !dbg !4926
  %234 = load i32* %233, align 4, !dbg !4926
  %235 = load i32* %bestsad, align 4, !dbg !4927
  %236 = icmp ult i32 %234, %235, !dbg !4926
  br i1 %236, label %237, label %243, !dbg !4928

; <label>:237                                     ; preds = %192
  %238 = load i32* %j, align 4, !dbg !4929
  %239 = sext i32 %238 to i64, !dbg !4931
  %240 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %239, !dbg !4931
  %241 = load i32* %240, align 4, !dbg !4931
  store i32 %241, i32* %bestsad, align 4, !dbg !4932
  %242 = load i32* %j, align 4, !dbg !4933
  store i32 %242, i32* %best_site, align 4, !dbg !4934
  br label %243, !dbg !4935

; <label>:243                                     ; preds = %237, %192
  br label %244, !dbg !4936

; <label>:244                                     ; preds = %243, %185
  br label %245, !dbg !4937

; <label>:245                                     ; preds = %244
  %246 = load i32* %j, align 4, !dbg !4938
  %247 = add nsw i32 %246, 1, !dbg !4938
  store i32 %247, i32* %j, align 4, !dbg !4938
  br label %182, !dbg !4939

; <label>:248                                     ; preds = %182
  br label %363, !dbg !4940

; <label>:249                                     ; preds = %101
  store i32 0, i32* %j, align 4, !dbg !4941
  br label %250, !dbg !4941

; <label>:250                                     ; preds = %359, %249
  %251 = load i32* %j, align 4, !dbg !4944
  %252 = icmp slt i32 %251, 4, !dbg !4944
  br i1 %252, label %253, label %362, !dbg !4948

; <label>:253                                     ; preds = %250
  %254 = load %union.int_mv** %4, align 8, !dbg !4949
  %255 = bitcast %union.int_mv* %254 to %struct.MV*, !dbg !4949
  %256 = getelementptr inbounds %struct.MV* %255, i32 0, i32 0, !dbg !4949
  %257 = load i16* %256, align 2, !dbg !4949
  %258 = sext i16 %257 to i32, !dbg !4949
  %259 = load i32* %j, align 4, !dbg !4951
  %260 = sext i32 %259 to i64, !dbg !4952
  %261 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %260, !dbg !4952
  %262 = getelementptr inbounds %struct.MV* %261, i32 0, i32 0, !dbg !4952
  %263 = load i16* %262, align 2, !dbg !4952
  %264 = sext i16 %263 to i32, !dbg !4952
  %265 = add nsw i32 %258, %264, !dbg !4949
  %266 = trunc i32 %265 to i16, !dbg !4949
  store i16 %266, i16* %this_row_offset, align 2, !dbg !4953
  %267 = load %union.int_mv** %4, align 8, !dbg !4954
  %268 = bitcast %union.int_mv* %267 to %struct.MV*, !dbg !4954
  %269 = getelementptr inbounds %struct.MV* %268, i32 0, i32 1, !dbg !4954
  %270 = load i16* %269, align 2, !dbg !4954
  %271 = sext i16 %270 to i32, !dbg !4954
  %272 = load i32* %j, align 4, !dbg !4955
  %273 = sext i32 %272 to i64, !dbg !4956
  %274 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %273, !dbg !4956
  %275 = getelementptr inbounds %struct.MV* %274, i32 0, i32 1, !dbg !4956
  %276 = load i16* %275, align 2, !dbg !4956
  %277 = sext i16 %276 to i32, !dbg !4956
  %278 = add nsw i32 %271, %277, !dbg !4954
  %279 = trunc i32 %278 to i16, !dbg !4954
  store i16 %279, i16* %this_col_offset, align 2, !dbg !4957
  %280 = load i16* %this_col_offset, align 2, !dbg !4958
  %281 = sext i16 %280 to i32, !dbg !4958
  %282 = load %struct.macroblock** %1, align 8, !dbg !4960
  %283 = getelementptr inbounds %struct.macroblock* %282, i32 0, i32 31, !dbg !4960
  %284 = load i32* %283, align 4, !dbg !4960
  %285 = icmp sgt i32 %281, %284, !dbg !4958
  br i1 %285, label %286, label %358, !dbg !4961

; <label>:286                                     ; preds = %253
  %287 = load i16* %this_col_offset, align 2, !dbg !4962
  %288 = sext i16 %287 to i32, !dbg !4962
  %289 = load %struct.macroblock** %1, align 8, !dbg !4964
  %290 = getelementptr inbounds %struct.macroblock* %289, i32 0, i32 32, !dbg !4964
  %291 = load i32* %290, align 4, !dbg !4964
  %292 = icmp slt i32 %288, %291, !dbg !4965
  br i1 %292, label %293, label %358, !dbg !4961

; <label>:293                                     ; preds = %286
  %294 = load i16* %this_row_offset, align 2, !dbg !4966
  %295 = sext i16 %294 to i32, !dbg !4966
  %296 = load %struct.macroblock** %1, align 8, !dbg !4967
  %297 = getelementptr inbounds %struct.macroblock* %296, i32 0, i32 33, !dbg !4967
  %298 = load i32* %297, align 4, !dbg !4967
  %299 = icmp sgt i32 %295, %298, !dbg !4966
  br i1 %299, label %300, label %358, !dbg !4961

; <label>:300                                     ; preds = %293
  %301 = load i16* %this_row_offset, align 2, !dbg !4968
  %302 = sext i16 %301 to i32, !dbg !4968
  %303 = load %struct.macroblock** %1, align 8, !dbg !4969
  %304 = getelementptr inbounds %struct.macroblock* %303, i32 0, i32 34, !dbg !4969
  %305 = load i32* %304, align 4, !dbg !4969
  %306 = icmp slt i32 %302, %305, !dbg !4968
  br i1 %306, label %307, label %358, !dbg !4961

; <label>:307                                     ; preds = %300
  %308 = load i32* %j, align 4, !dbg !4970
  %309 = sext i32 %308 to i64, !dbg !4972
  %310 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %309, !dbg !4972
  %311 = getelementptr inbounds %struct.MV* %310, i32 0, i32 0, !dbg !4972
  %312 = load i16* %311, align 2, !dbg !4972
  %313 = sext i16 %312 to i32, !dbg !4973
  %314 = load i32* %in_what_stride, align 4, !dbg !4974
  %315 = mul nsw i32 %313, %314, !dbg !4973
  %316 = load i32* %j, align 4, !dbg !4975
  %317 = sext i32 %316 to i64, !dbg !4976
  %318 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %317, !dbg !4976
  %319 = getelementptr inbounds %struct.MV* %318, i32 0, i32 1, !dbg !4976
  %320 = load i16* %319, align 2, !dbg !4976
  %321 = sext i16 %320 to i32, !dbg !4976
  %322 = add nsw i32 %315, %321, !dbg !4973
  %323 = load i8** %best_address, align 8, !dbg !4977
  %324 = sext i32 %322 to i64, !dbg !4973
  %325 = getelementptr inbounds i8* %323, i64 %324, !dbg !4973
  store i8* %325, i8** %check_here, align 8, !dbg !4978
  %326 = load %struct.variance_vtable** %7, align 8, !dbg !4979
  %327 = getelementptr inbounds %struct.variance_vtable* %326, i32 0, i32 0, !dbg !4979
  %328 = load i32 (i8*, i32, i8*, i32, i32)** %327, align 8, !dbg !4979
  %329 = load i8** %what, align 8, !dbg !4980
  %330 = load i32* %what_stride, align 4, !dbg !4981
  %331 = load i8** %check_here, align 8, !dbg !4982
  %332 = load i32* %in_what_stride, align 4, !dbg !4983
  %333 = load i32* %bestsad, align 4, !dbg !4984
  %334 = call i32 %328(i8* %329, i32 %330, i8* %331, i32 %332, i32 %333), !dbg !4979
  store i32 %334, i32* %thissad, align 4, !dbg !4985
  %335 = load i32* %thissad, align 4, !dbg !4986
  %336 = load i32* %bestsad, align 4, !dbg !4988
  %337 = icmp ult i32 %335, %336, !dbg !4986
  br i1 %337, label %338, label %357, !dbg !4989

; <label>:338                                     ; preds = %307
  %339 = load i16* %this_row_offset, align 2, !dbg !4990
  %340 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4992
  %341 = getelementptr inbounds %struct.MV* %340, i32 0, i32 0, !dbg !4992
  store i16 %339, i16* %341, align 2, !dbg !4992
  %342 = load i16* %this_col_offset, align 2, !dbg !4993
  %343 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !4994
  %344 = getelementptr inbounds %struct.MV* %343, i32 0, i32 1, !dbg !4994
  store i16 %342, i16* %344, align 2, !dbg !4994
  %345 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !4995
  %346 = load i32* %5, align 4, !dbg !4996
  %347 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %345, i32 %346), !dbg !4997
  %348 = load i32* %thissad, align 4, !dbg !4998
  %349 = add i32 %348, %347, !dbg !4998
  store i32 %349, i32* %thissad, align 4, !dbg !4998
  %350 = load i32* %thissad, align 4, !dbg !4999
  %351 = load i32* %bestsad, align 4, !dbg !5001
  %352 = icmp ult i32 %350, %351, !dbg !4999
  br i1 %352, label %353, label %356, !dbg !5002

; <label>:353                                     ; preds = %338
  %354 = load i32* %thissad, align 4, !dbg !5003
  store i32 %354, i32* %bestsad, align 4, !dbg !5005
  %355 = load i32* %j, align 4, !dbg !5006
  store i32 %355, i32* %best_site, align 4, !dbg !5007
  br label %356, !dbg !5008

; <label>:356                                     ; preds = %353, %338
  br label %357, !dbg !5009

; <label>:357                                     ; preds = %356, %307
  br label %358, !dbg !5010

; <label>:358                                     ; preds = %357, %300, %293, %286, %253
  br label %359, !dbg !5011

; <label>:359                                     ; preds = %358
  %360 = load i32* %j, align 4, !dbg !5012
  %361 = add nsw i32 %360, 1, !dbg !5012
  store i32 %361, i32* %j, align 4, !dbg !5012
  br label %250, !dbg !5013

; <label>:362                                     ; preds = %250
  br label %363

; <label>:363                                     ; preds = %362, %248
  %364 = load i32* %best_site, align 4, !dbg !5014
  %365 = icmp eq i32 %364, -1, !dbg !5014
  br i1 %365, label %366, label %367, !dbg !5016

; <label>:366                                     ; preds = %363
  br label %416, !dbg !5017

; <label>:367                                     ; preds = %363
  %368 = load i32* %best_site, align 4, !dbg !5018
  %369 = sext i32 %368 to i64, !dbg !5020
  %370 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %369, !dbg !5020
  %371 = getelementptr inbounds %struct.MV* %370, i32 0, i32 0, !dbg !5020
  %372 = load i16* %371, align 2, !dbg !5020
  %373 = sext i16 %372 to i32, !dbg !5020
  %374 = load %union.int_mv** %4, align 8, !dbg !5021
  %375 = bitcast %union.int_mv* %374 to %struct.MV*, !dbg !5021
  %376 = getelementptr inbounds %struct.MV* %375, i32 0, i32 0, !dbg !5021
  %377 = load i16* %376, align 2, !dbg !5021
  %378 = sext i16 %377 to i32, !dbg !5021
  %379 = add nsw i32 %378, %373, !dbg !5021
  %380 = trunc i32 %379 to i16, !dbg !5021
  store i16 %380, i16* %376, align 2, !dbg !5021
  %381 = load i32* %best_site, align 4, !dbg !5022
  %382 = sext i32 %381 to i64, !dbg !5023
  %383 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %382, !dbg !5023
  %384 = getelementptr inbounds %struct.MV* %383, i32 0, i32 1, !dbg !5023
  %385 = load i16* %384, align 2, !dbg !5023
  %386 = sext i16 %385 to i32, !dbg !5023
  %387 = load %union.int_mv** %4, align 8, !dbg !5024
  %388 = bitcast %union.int_mv* %387 to %struct.MV*, !dbg !5024
  %389 = getelementptr inbounds %struct.MV* %388, i32 0, i32 1, !dbg !5024
  %390 = load i16* %389, align 2, !dbg !5024
  %391 = sext i16 %390 to i32, !dbg !5024
  %392 = add nsw i32 %391, %386, !dbg !5024
  %393 = trunc i32 %392 to i16, !dbg !5024
  store i16 %393, i16* %389, align 2, !dbg !5024
  %394 = load i32* %best_site, align 4, !dbg !5025
  %395 = sext i32 %394 to i64, !dbg !5026
  %396 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %395, !dbg !5026
  %397 = getelementptr inbounds %struct.MV* %396, i32 0, i32 0, !dbg !5026
  %398 = load i16* %397, align 2, !dbg !5026
  %399 = sext i16 %398 to i32, !dbg !5027
  %400 = load i32* %in_what_stride, align 4, !dbg !5028
  %401 = mul nsw i32 %399, %400, !dbg !5027
  %402 = load i32* %best_site, align 4, !dbg !5029
  %403 = sext i32 %402 to i64, !dbg !5030
  %404 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %403, !dbg !5030
  %405 = getelementptr inbounds %struct.MV* %404, i32 0, i32 1, !dbg !5030
  %406 = load i16* %405, align 2, !dbg !5030
  %407 = sext i16 %406 to i32, !dbg !5030
  %408 = add nsw i32 %401, %407, !dbg !5027
  %409 = load i8** %best_address, align 8, !dbg !5031
  %410 = sext i32 %408 to i64, !dbg !5031
  %411 = getelementptr inbounds i8* %409, i64 %410, !dbg !5031
  store i8* %411, i8** %best_address, align 8, !dbg !5031
  br label %412

; <label>:412                                     ; preds = %367
  br label %413, !dbg !5032

; <label>:413                                     ; preds = %412
  %414 = load i32* %i, align 4, !dbg !5033
  %415 = add nsw i32 %414, 1, !dbg !5033
  store i32 %415, i32* %i, align 4, !dbg !5033
  br label %97, !dbg !5034

; <label>:416                                     ; preds = %366, %97
  %417 = load %union.int_mv** %4, align 8, !dbg !5035
  %418 = bitcast %union.int_mv* %417 to %struct.MV*, !dbg !5035
  %419 = getelementptr inbounds %struct.MV* %418, i32 0, i32 0, !dbg !5035
  %420 = load i16* %419, align 2, !dbg !5035
  %421 = sext i16 %420 to i32, !dbg !5035
  %422 = mul nsw i32 %421, 8, !dbg !5035
  %423 = trunc i32 %422 to i16, !dbg !5035
  %424 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !5036
  %425 = getelementptr inbounds %struct.MV* %424, i32 0, i32 0, !dbg !5036
  store i16 %423, i16* %425, align 2, !dbg !5036
  %426 = load %union.int_mv** %4, align 8, !dbg !5037
  %427 = bitcast %union.int_mv* %426 to %struct.MV*, !dbg !5037
  %428 = getelementptr inbounds %struct.MV* %427, i32 0, i32 1, !dbg !5037
  %429 = load i16* %428, align 2, !dbg !5037
  %430 = sext i16 %429 to i32, !dbg !5037
  %431 = mul nsw i32 %430, 8, !dbg !5037
  %432 = trunc i32 %431 to i16, !dbg !5037
  %433 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !5038
  %434 = getelementptr inbounds %struct.MV* %433, i32 0, i32 1, !dbg !5038
  store i16 %432, i16* %434, align 2, !dbg !5038
  %435 = load %struct.variance_vtable** %7, align 8, !dbg !5039
  %436 = getelementptr inbounds %struct.variance_vtable* %435, i32 0, i32 1, !dbg !5039
  %437 = load i32 (i8*, i32, i8*, i32, i32*)** %436, align 8, !dbg !5039
  %438 = load i8** %what, align 8, !dbg !5040
  %439 = load i32* %what_stride, align 4, !dbg !5041
  %440 = load i8** %best_address, align 8, !dbg !5042
  %441 = load i32* %in_what_stride, align 4, !dbg !5043
  %442 = call i32 %437(i8* %438, i32 %439, i8* %440, i32 %441, i32* %thissad), !dbg !5039
  %443 = load %union.int_mv** %9, align 8, !dbg !5044
  %444 = load i32*** %8, align 8, !dbg !5045
  %445 = load %struct.macroblock** %1, align 8, !dbg !5046
  %446 = getelementptr inbounds %struct.macroblock* %445, i32 0, i32 15, !dbg !5046
  %447 = load i32* %446, align 4, !dbg !5046
  %448 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %443, i32** %444, i32 %447), !dbg !5047
  %449 = add i32 %442, %448, !dbg !5039
  ret i32 %449, !dbg !5048
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!502, !503}
!llvm.ident = !{!504}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !59, !67, !496, !90} ; [ DW_TAG_compile_unit ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c] [DW_LANG_C99]
!1 = !{!"mcomp.c", !"/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder"}
!2 = !{!3, !21, !25, !38, !45}
!3 = !{!"0x4\00\00105\0032\0032\000\000\000", !4, null, null, !5, null, null, null} ; [ DW_TAG_enumeration_type ] [line 105, size 32, align 32, offset 0] [def] [from ]
!4 = !{!"../../vp8/common/blockd.h", !"/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder"}
!5 = !{!6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20}
!6 = !{!"0x28\00B_DC_PRED\000"}                   ; [ DW_TAG_enumerator ] [B_DC_PRED :: 0]
!7 = !{!"0x28\00B_TM_PRED\001"}                   ; [ DW_TAG_enumerator ] [B_TM_PRED :: 1]
!8 = !{!"0x28\00B_VE_PRED\002"}                   ; [ DW_TAG_enumerator ] [B_VE_PRED :: 2]
!9 = !{!"0x28\00B_HE_PRED\003"}                   ; [ DW_TAG_enumerator ] [B_HE_PRED :: 3]
!10 = !{!"0x28\00B_LD_PRED\004"}                  ; [ DW_TAG_enumerator ] [B_LD_PRED :: 4]
!11 = !{!"0x28\00B_RD_PRED\005"}                  ; [ DW_TAG_enumerator ] [B_RD_PRED :: 5]
!12 = !{!"0x28\00B_VR_PRED\006"}                  ; [ DW_TAG_enumerator ] [B_VR_PRED :: 6]
!13 = !{!"0x28\00B_VL_PRED\007"}                  ; [ DW_TAG_enumerator ] [B_VL_PRED :: 7]
!14 = !{!"0x28\00B_HD_PRED\008"}                  ; [ DW_TAG_enumerator ] [B_HD_PRED :: 8]
!15 = !{!"0x28\00B_HU_PRED\009"}                  ; [ DW_TAG_enumerator ] [B_HU_PRED :: 9]
!16 = !{!"0x28\00LEFT4X4\0010"}                   ; [ DW_TAG_enumerator ] [LEFT4X4 :: 10]
!17 = !{!"0x28\00ABOVE4X4\0011"}                  ; [ DW_TAG_enumerator ] [ABOVE4X4 :: 11]
!18 = !{!"0x28\00ZERO4X4\0012"}                   ; [ DW_TAG_enumerator ] [ZERO4X4 :: 12]
!19 = !{!"0x28\00NEW4X4\0013"}                    ; [ DW_TAG_enumerator ] [NEW4X4 :: 13]
!20 = !{!"0x28\00B_MODE_COUNT\0014"}              ; [ DW_TAG_enumerator ] [B_MODE_COUNT :: 14]
!21 = !{!"0x4\00\0064\0032\0032\000\000\000", !4, null, null, !22, null, null, null} ; [ DW_TAG_enumeration_type ] [line 64, size 32, align 32, offset 0] [def] [from ]
!22 = !{!23, !24}
!23 = !{!"0x28\00KEY_FRAME\000"}                  ; [ DW_TAG_enumerator ] [KEY_FRAME :: 0]
!24 = !{!"0x28\00INTER_FRAME\001"}                ; [ DW_TAG_enumerator ] [INTER_FRAME :: 1]
!25 = !{!"0x4\00\0070\0032\0032\000\000\000", !4, null, null, !26, null, null, null} ; [ DW_TAG_enumeration_type ] [line 70, size 32, align 32, offset 0] [def] [from ]
!26 = !{!27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37}
!27 = !{!"0x28\00DC_PRED\000"}                    ; [ DW_TAG_enumerator ] [DC_PRED :: 0]
!28 = !{!"0x28\00V_PRED\001"}                     ; [ DW_TAG_enumerator ] [V_PRED :: 1]
!29 = !{!"0x28\00H_PRED\002"}                     ; [ DW_TAG_enumerator ] [H_PRED :: 2]
!30 = !{!"0x28\00TM_PRED\003"}                    ; [ DW_TAG_enumerator ] [TM_PRED :: 3]
!31 = !{!"0x28\00B_PRED\004"}                     ; [ DW_TAG_enumerator ] [B_PRED :: 4]
!32 = !{!"0x28\00NEARESTMV\005"}                  ; [ DW_TAG_enumerator ] [NEARESTMV :: 5]
!33 = !{!"0x28\00NEARMV\006"}                     ; [ DW_TAG_enumerator ] [NEARMV :: 6]
!34 = !{!"0x28\00ZEROMV\007"}                     ; [ DW_TAG_enumerator ] [ZEROMV :: 7]
!35 = !{!"0x28\00NEWMV\008"}                      ; [ DW_TAG_enumerator ] [NEWMV :: 8]
!36 = !{!"0x28\00SPLITMV\009"}                    ; [ DW_TAG_enumerator ] [SPLITMV :: 9]
!37 = !{!"0x28\00MB_MODE_COUNT\0010"}             ; [ DW_TAG_enumerator ] [MB_MODE_COUNT :: 10]
!38 = !{!"0x4\00\00142\0032\0032\000\000\000", !4, null, null, !39, null, null, null} ; [ DW_TAG_enumeration_type ] [line 142, size 32, align 32, offset 0] [def] [from ]
!39 = !{!40, !41, !42, !43, !44}
!40 = !{!"0x28\00INTRA_FRAME\000"}                ; [ DW_TAG_enumerator ] [INTRA_FRAME :: 0]
!41 = !{!"0x28\00LAST_FRAME\001"}                 ; [ DW_TAG_enumerator ] [LAST_FRAME :: 1]
!42 = !{!"0x28\00GOLDEN_FRAME\002"}               ; [ DW_TAG_enumerator ] [GOLDEN_FRAME :: 2]
!43 = !{!"0x28\00ALTREF_FRAME\003"}               ; [ DW_TAG_enumerator ] [ALTREF_FRAME :: 3]
!44 = !{!"0x28\00MAX_REF_FRAMES\004"}             ; [ DW_TAG_enumerator ] [MAX_REF_FRAMES :: 4]
!45 = !{!"0x4\00\0017\0032\0032\000\000\000", !46, null, null, !47, null, null, null} ; [ DW_TAG_enumeration_type ] [line 17, size 32, align 32, offset 0] [def] [from ]
!46 = !{!"../../vp8/common/entropymv.h", !"/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder"}
!47 = !{!48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58}
!48 = !{!"0x28\00mv_max\001023"}                  ; [ DW_TAG_enumerator ] [mv_max :: 1023]
!49 = !{!"0x28\00MVvals\002047"}                  ; [ DW_TAG_enumerator ] [MVvals :: 2047]
!50 = !{!"0x28\00mvfp_max\00255"}                 ; [ DW_TAG_enumerator ] [mvfp_max :: 255]
!51 = !{!"0x28\00MVfpvals\00511"}                 ; [ DW_TAG_enumerator ] [MVfpvals :: 511]
!52 = !{!"0x28\00mvlong_width\0010"}              ; [ DW_TAG_enumerator ] [mvlong_width :: 10]
!53 = !{!"0x28\00mvnum_short\008"}                ; [ DW_TAG_enumerator ] [mvnum_short :: 8]
!54 = !{!"0x28\00mvpis_short\000"}                ; [ DW_TAG_enumerator ] [mvpis_short :: 0]
!55 = !{!"0x28\00MVPsign\001"}                    ; [ DW_TAG_enumerator ] [MVPsign :: 1]
!56 = !{!"0x28\00MVPshort\002"}                   ; [ DW_TAG_enumerator ] [MVPshort :: 2]
!57 = !{!"0x28\00MVPbits\009"}                    ; [ DW_TAG_enumerator ] [MVPbits :: 9]
!58 = !{!"0x28\00MVPcount\0019"}                  ; [ DW_TAG_enumerator ] [MVPcount :: 19]
!59 = !{!60, !62, !64}
!60 = !{!"0xf\00\000\0064\0064\000\000", null, null, !61} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned char]
!61 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!62 = !{!"0xf\00\000\0064\0064\000\000", null, null, !63} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned short]
!63 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!64 = !{!"0x16\00intptr_t\00119\000\000\000\000", !65, null, !66} ; [ DW_TAG_typedef ] [intptr_t] [line 119, size 0, align 0, offset 0] [from long int]
!65 = !{!"/usr/include/stdint.h", !"/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder"}
!66 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!67 = !{!68, !91, !420, !421, !472, !473, !474, !477, !481, !482, !485, !486, !487, !488, !489, !490, !495}
!68 = !{!"0x2e\00vp8_mv_bit_cost\00vp8_mv_bit_cost\00\0026\000\001\000\000\00256\000\0027", !1, !69, !70, null, i32 (%union.int_mv*, %union.int_mv*, i32**, i32)* @vp8_mv_bit_cost, null, null, !90} ; [ DW_TAG_subprogram ] [line 26] [def] [scope 27] [vp8_mv_bit_cost]
!69 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!70 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !71, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!71 = !{!72, !73, !73, !88, !72}
!72 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!73 = !{!"0xf\00\000\0064\0064\000\000", null, null, !74} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int_mv]
!74 = !{!"0x16\00int_mv\0026\000\000\000\000", !75, null, !76} ; [ DW_TAG_typedef ] [int_mv] [line 26, size 0, align 0, offset 0] [from int_mv]
!75 = !{!"../../vp8/common/mv.h", !"/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder"}
!76 = !{!"0x17\00int_mv\0022\0032\0032\000\000\000", !75, null, null, !77, null, null, null} ; [ DW_TAG_union_type ] [int_mv] [line 22, size 32, align 32, offset 0] [def] [from ]
!77 = !{!78, !81}
!78 = !{!"0xd\00as_int\0024\0032\0032\000\000", !75, !76, !79} ; [ DW_TAG_member ] [as_int] [line 24, size 32, align 32, offset 0] [from uint32_t]
!79 = !{!"0x16\00uint32_t\0051\000\000\000\000", !65, null, !80} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!80 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!81 = !{!"0xd\00as_mv\0025\0032\0016\000\000", !75, !76, !82} ; [ DW_TAG_member ] [as_mv] [line 25, size 32, align 16, offset 0] [from MV]
!82 = !{!"0x16\00MV\0020\000\000\000\000", !75, null, !83} ; [ DW_TAG_typedef ] [MV] [line 20, size 0, align 0, offset 0] [from ]
!83 = !{!"0x13\00\0016\0032\0016\000\000\000", !75, null, null, !84, null, null, null} ; [ DW_TAG_structure_type ] [line 16, size 32, align 16, offset 0] [def] [from ]
!84 = !{!85, !87}
!85 = !{!"0xd\00row\0018\0016\0016\000\000", !75, !83, !86} ; [ DW_TAG_member ] [row] [line 18, size 16, align 16, offset 0] [from short]
!86 = !{!"0x24\00short\000\0016\0016\000\000\005", null, null} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!87 = !{!"0xd\00col\0019\0016\0016\0016\000", !75, !83, !86} ; [ DW_TAG_member ] [col] [line 19, size 16, align 16, offset 16] [from short]
!88 = !{!"0xf\00\000\0064\0064\000\000", null, null, !89} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!89 = !{!"0xf\00\000\0064\0064\000\000", null, null, !72} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!90 = !{}
!91 = !{!"0x2e\00vp8_init_dsmotion_compensation\00vp8_init_dsmotion_compensation\00\0059\000\001\000\000\00256\000\0060", !1, !69, !92, null, void (%struct.macroblock*, i32)* @vp8_init_dsmotion_compensation, null, null, !90} ; [ DW_TAG_subprogram ] [line 59] [def] [scope 60] [vp8_init_dsmotion_compensation]
!92 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !93, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!93 = !{null, !94, !72}
!94 = !{!"0xf\00\000\0064\0064\000\000", null, null, !95} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from MACROBLOCK]
!95 = !{!"0x16\00MACROBLOCK\00160\000\000\000\000", !96, null, !97} ; [ DW_TAG_typedef ] [MACROBLOCK] [line 160, size 0, align 0, offset 0] [from macroblock]
!96 = !{!"./block.h", !"/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder"}
!97 = !{!"0x13\00macroblock\0063\00276992\00256\000\000\000", !96, null, null, !98, null, null, null} ; [ DW_TAG_structure_type ] [macroblock] [line 63, size 276992, align 256, offset 0] [def] [from ]
!98 = !{!99, !103, !104, !108, !109, !130, !160, !288, !300, !301, !302, !304, !311, !312, !313, !314, !315, !316, !317, !318, !320, !321, !322, !323, !325, !326, !331, !332, !336, !337, !343, !344, !345, !346, !347, !348, !349, !351, !352, !361, !362, !363, !365, !366, !368, !369, !370, !371, !374, !378, !382, !383, !385, !386, !387, !391, !392, !393, !395, !396, !397, !398, !399, !400, !404, !408, !409, !410, !416}
!99 = !{!"0xd\00src_diff\0065\006400\0016\000\000", !96, !97, !100} ; [ DW_TAG_member ] [src_diff] [line 65, size 6400, align 16, offset 0] [from ]
!100 = !{!"0x1\00\000\006400\0016\000\000\000", null, null, !86, !101, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6400, align 16, offset 0] [from short]
!101 = !{!102}
!102 = !{!"0x21\000\00400"}                       ; [ DW_TAG_subrange_type ] [0, 399]
!103 = !{!"0xd\00coeff\0066\006400\0016\006400\000", !96, !97, !100} ; [ DW_TAG_member ] [coeff] [line 66, size 6400, align 16, offset 6400] [from ]
!104 = !{!"0xd\00thismb\0067\002048\008\0012800\000", !96, !97, !105} ; [ DW_TAG_member ] [thismb] [line 67, size 2048, align 8, offset 12800] [from ]
!105 = !{!"0x1\00\000\002048\008\000\000\000", null, null, !61, !106, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from unsigned char]
!106 = !{!107}
!107 = !{!"0x21\000\00256"}                       ; [ DW_TAG_subrange_type ] [0, 255]
!108 = !{!"0xd\00thismb_ptr\0069\0064\0064\0014848\000", !96, !97, !60} ; [ DW_TAG_member ] [thismb_ptr] [line 69, size 64, align 64, offset 14848] [from ]
!109 = !{!"0xd\00block\0071\0017600\0064\0014912\000", !96, !97, !110} ; [ DW_TAG_member ] [block] [line 71, size 17600, align 64, offset 14912] [from ]
!110 = !{!"0x1\00\000\0017600\0064\000\000\000", null, null, !111, !128, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 17600, align 64, offset 0] [from BLOCK]
!111 = !{!"0x16\00BLOCK\0051\000\000\000\000", !96, null, !112} ; [ DW_TAG_typedef ] [BLOCK] [line 51, size 0, align 0, offset 0] [from block]
!112 = !{!"0x13\00block\0031\00704\0064\000\000\000", !96, null, null, !113, null, null, null} ; [ DW_TAG_structure_type ] [block] [line 31, size 704, align 64, offset 0] [def] [from ]
!113 = !{!114, !116, !117, !118, !119, !120, !121, !122, !123, !124, !126, !127}
!114 = !{!"0xd\00src_diff\0034\0064\0064\000\000", !96, !112, !115} ; [ DW_TAG_member ] [src_diff] [line 34, size 64, align 64, offset 0] [from ]
!115 = !{!"0xf\00\000\0064\0064\000\000", null, null, !86} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from short]
!116 = !{!"0xd\00coeff\0035\0064\0064\0064\000", !96, !112, !115} ; [ DW_TAG_member ] [coeff] [line 35, size 64, align 64, offset 64] [from ]
!117 = !{!"0xd\00quant\0038\0064\0064\00128\000", !96, !112, !115} ; [ DW_TAG_member ] [quant] [line 38, size 64, align 64, offset 128] [from ]
!118 = !{!"0xd\00quant_fast\0039\0064\0064\00192\000", !96, !112, !115} ; [ DW_TAG_member ] [quant_fast] [line 39, size 64, align 64, offset 192] [from ]
!119 = !{!"0xd\00quant_shift\0040\0064\0064\00256\000", !96, !112, !115} ; [ DW_TAG_member ] [quant_shift] [line 40, size 64, align 64, offset 256] [from ]
!120 = !{!"0xd\00zbin\0041\0064\0064\00320\000", !96, !112, !115} ; [ DW_TAG_member ] [zbin] [line 41, size 64, align 64, offset 320] [from ]
!121 = !{!"0xd\00zrun_zbin_boost\0042\0064\0064\00384\000", !96, !112, !115} ; [ DW_TAG_member ] [zrun_zbin_boost] [line 42, size 64, align 64, offset 384] [from ]
!122 = !{!"0xd\00round\0043\0064\0064\00448\000", !96, !112, !115} ; [ DW_TAG_member ] [round] [line 43, size 64, align 64, offset 448] [from ]
!123 = !{!"0xd\00zbin_extra\0046\0016\0016\00512\000", !96, !112, !86} ; [ DW_TAG_member ] [zbin_extra] [line 46, size 16, align 16, offset 512] [from short]
!124 = !{!"0xd\00base_src\0048\0064\0064\00576\000", !96, !112, !125} ; [ DW_TAG_member ] [base_src] [line 48, size 64, align 64, offset 576] [from ]
!125 = !{!"0xf\00\000\0064\0064\000\000", null, null, !60} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!126 = !{!"0xd\00src\0049\0032\0032\00640\000", !96, !112, !72} ; [ DW_TAG_member ] [src] [line 49, size 32, align 32, offset 640] [from int]
!127 = !{!"0xd\00src_stride\0050\0032\0032\00672\000", !96, !112, !72} ; [ DW_TAG_member ] [src_stride] [line 50, size 32, align 32, offset 672] [from int]
!128 = !{!129}
!129 = !{!"0x21\000\0025"}                        ; [ DW_TAG_subrange_type ] [0, 24]
!130 = !{!"0xd\00src\0073\00960\0064\0032512\000", !96, !97, !131} ; [ DW_TAG_member ] [src] [line 73, size 960, align 64, offset 32512] [from YV12_BUFFER_CONFIG]
!131 = !{!"0x16\00YV12_BUFFER_CONFIG\0056\000\000\000\000", !132, null, !133} ; [ DW_TAG_typedef ] [YV12_BUFFER_CONFIG] [line 56, size 0, align 0, offset 0] [from yv12_buffer_config]
!132 = !{!"../../vpx_scale/yv12config.h", !"/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder"}
!133 = !{!"0x13\00yv12_buffer_config\0025\00960\0064\000\000\000", !132, null, null, !134, null, null, null} ; [ DW_TAG_structure_type ] [yv12_buffer_config] [line 25, size 960, align 64, offset 0] [def] [from ]
!134 = !{!135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !151, !152, !153, !154, !155, !156, !157, !158, !159}
!135 = !{!"0xd\00y_width\0026\0032\0032\000\000", !132, !133, !72} ; [ DW_TAG_member ] [y_width] [line 26, size 32, align 32, offset 0] [from int]
!136 = !{!"0xd\00y_height\0027\0032\0032\0032\000", !132, !133, !72} ; [ DW_TAG_member ] [y_height] [line 27, size 32, align 32, offset 32] [from int]
!137 = !{!"0xd\00y_crop_width\0028\0032\0032\0064\000", !132, !133, !72} ; [ DW_TAG_member ] [y_crop_width] [line 28, size 32, align 32, offset 64] [from int]
!138 = !{!"0xd\00y_crop_height\0029\0032\0032\0096\000", !132, !133, !72} ; [ DW_TAG_member ] [y_crop_height] [line 29, size 32, align 32, offset 96] [from int]
!139 = !{!"0xd\00y_stride\0030\0032\0032\00128\000", !132, !133, !72} ; [ DW_TAG_member ] [y_stride] [line 30, size 32, align 32, offset 128] [from int]
!140 = !{!"0xd\00uv_width\0033\0032\0032\00160\000", !132, !133, !72} ; [ DW_TAG_member ] [uv_width] [line 33, size 32, align 32, offset 160] [from int]
!141 = !{!"0xd\00uv_height\0034\0032\0032\00192\000", !132, !133, !72} ; [ DW_TAG_member ] [uv_height] [line 34, size 32, align 32, offset 192] [from int]
!142 = !{!"0xd\00uv_crop_width\0035\0032\0032\00224\000", !132, !133, !72} ; [ DW_TAG_member ] [uv_crop_width] [line 35, size 32, align 32, offset 224] [from int]
!143 = !{!"0xd\00uv_crop_height\0036\0032\0032\00256\000", !132, !133, !72} ; [ DW_TAG_member ] [uv_crop_height] [line 36, size 32, align 32, offset 256] [from int]
!144 = !{!"0xd\00uv_stride\0037\0032\0032\00288\000", !132, !133, !72} ; [ DW_TAG_member ] [uv_stride] [line 37, size 32, align 32, offset 288] [from int]
!145 = !{!"0xd\00alpha_width\0040\0032\0032\00320\000", !132, !133, !72} ; [ DW_TAG_member ] [alpha_width] [line 40, size 32, align 32, offset 320] [from int]
!146 = !{!"0xd\00alpha_height\0041\0032\0032\00352\000", !132, !133, !72} ; [ DW_TAG_member ] [alpha_height] [line 41, size 32, align 32, offset 352] [from int]
!147 = !{!"0xd\00alpha_stride\0042\0032\0032\00384\000", !132, !133, !72} ; [ DW_TAG_member ] [alpha_stride] [line 42, size 32, align 32, offset 384] [from int]
!148 = !{!"0xd\00y_buffer\0044\0064\0064\00448\000", !132, !133, !149} ; [ DW_TAG_member ] [y_buffer] [line 44, size 64, align 64, offset 448] [from ]
!149 = !{!"0xf\00\000\0064\0064\000\000", null, null, !150} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint8_t]
!150 = !{!"0x16\00uint8_t\0048\000\000\000\000", !65, null, !61} ; [ DW_TAG_typedef ] [uint8_t] [line 48, size 0, align 0, offset 0] [from unsigned char]
!151 = !{!"0xd\00u_buffer\0045\0064\0064\00512\000", !132, !133, !149} ; [ DW_TAG_member ] [u_buffer] [line 45, size 64, align 64, offset 512] [from ]
!152 = !{!"0xd\00v_buffer\0046\0064\0064\00576\000", !132, !133, !149} ; [ DW_TAG_member ] [v_buffer] [line 46, size 64, align 64, offset 576] [from ]
!153 = !{!"0xd\00alpha_buffer\0047\0064\0064\00640\000", !132, !133, !149} ; [ DW_TAG_member ] [alpha_buffer] [line 47, size 64, align 64, offset 640] [from ]
!154 = !{!"0xd\00buffer_alloc\0049\0064\0064\00704\000", !132, !133, !149} ; [ DW_TAG_member ] [buffer_alloc] [line 49, size 64, align 64, offset 704] [from ]
!155 = !{!"0xd\00buffer_alloc_sz\0050\0032\0032\00768\000", !132, !133, !72} ; [ DW_TAG_member ] [buffer_alloc_sz] [line 50, size 32, align 32, offset 768] [from int]
!156 = !{!"0xd\00border\0051\0032\0032\00800\000", !132, !133, !72} ; [ DW_TAG_member ] [border] [line 51, size 32, align 32, offset 800] [from int]
!157 = !{!"0xd\00frame_size\0052\0032\0032\00832\000", !132, !133, !72} ; [ DW_TAG_member ] [frame_size] [line 52, size 32, align 32, offset 832] [from int]
!158 = !{!"0xd\00corrupted\0054\0032\0032\00864\000", !132, !133, !72} ; [ DW_TAG_member ] [corrupted] [line 54, size 32, align 32, offset 864] [from int]
!159 = !{!"0xd\00flags\0055\0032\0032\00896\000", !132, !133, !72} ; [ DW_TAG_member ] [flags] [line 55, size 32, align 32, offset 896] [from int]
!160 = !{!"0xd\00e_mbd\0075\0037632\00256\0033536\000", !96, !97, !161} ; [ DW_TAG_member ] [e_mbd] [line 75, size 37632, align 256, offset 33536] [from MACROBLOCKD]
!161 = !{!"0x16\00MACROBLOCKD\00294\000\000\000\000", !4, null, !162} ; [ DW_TAG_typedef ] [MACROBLOCKD] [line 294, size 0, align 0, offset 0] [from macroblockd]
!162 = !{!"0x13\00macroblockd\00207\0037632\00256\000\000\000", !4, null, null, !163, null, null, null} ; [ DW_TAG_structure_type ] [macroblockd] [line 207, size 37632, align 256, offset 0] [def] [from ]
!163 = !{!164, !168, !169, !170, !173, !177, !178, !179, !180, !198, !199, !200, !201, !221, !222, !224, !225, !226, !230, !231, !235, !249, !250, !251, !252, !253, !254, !258, !262, !263, !264, !266, !267, !268, !269, !270, !271, !272, !273, !278, !279, !280, !281, !283, !284}
!164 = !{!"0xd\00predictor\00209\003072\008\000\000", !4, !162, !165} ; [ DW_TAG_member ] [predictor] [line 209, size 3072, align 8, offset 0] [from ]
!165 = !{!"0x1\00\000\003072\008\000\000\000", null, null, !61, !166, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3072, align 8, offset 0] [from unsigned char]
!166 = !{!167}
!167 = !{!"0x21\000\00384"}                       ; [ DW_TAG_subrange_type ] [0, 383]
!168 = !{!"0xd\00qcoeff\00210\006400\0016\003072\000", !4, !162, !100} ; [ DW_TAG_member ] [qcoeff] [line 210, size 6400, align 16, offset 3072] [from ]
!169 = !{!"0xd\00dqcoeff\00211\006400\0016\009472\000", !4, !162, !100} ; [ DW_TAG_member ] [dqcoeff] [line 211, size 6400, align 16, offset 9472] [from ]
!170 = !{!"0xd\00eobs\00212\00200\008\0015872\000", !4, !162, !171} ; [ DW_TAG_member ] [eobs] [line 212, size 200, align 8, offset 15872] [from ]
!171 = !{!"0x1\00\000\00200\008\000\000\000", null, null, !172, !128, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 200, align 8, offset 0] [from char]
!172 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!173 = !{!"0xd\00dequant_y1\00214\00256\0016\0016128\000", !4, !162, !174} ; [ DW_TAG_member ] [dequant_y1] [line 214, size 256, align 16, offset 16128] [from ]
!174 = !{!"0x1\00\000\00256\0016\000\000\000", null, null, !86, !175, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 16, offset 0] [from short]
!175 = !{!176}
!176 = !{!"0x21\000\0016"}                        ; [ DW_TAG_subrange_type ] [0, 15]
!177 = !{!"0xd\00dequant_y1_dc\00215\00256\0016\0016384\000", !4, !162, !174} ; [ DW_TAG_member ] [dequant_y1_dc] [line 215, size 256, align 16, offset 16384] [from ]
!178 = !{!"0xd\00dequant_y2\00216\00256\0016\0016640\000", !4, !162, !174} ; [ DW_TAG_member ] [dequant_y2] [line 216, size 256, align 16, offset 16640] [from ]
!179 = !{!"0xd\00dequant_uv\00217\00256\0016\0016896\000", !4, !162, !174} ; [ DW_TAG_member ] [dequant_uv] [line 217, size 256, align 16, offset 16896] [from ]
!180 = !{!"0xd\00block\00220\0011200\0064\0017152\000", !4, !162, !181} ; [ DW_TAG_member ] [block] [line 220, size 11200, align 64, offset 17152] [from ]
!181 = !{!"0x1\00\000\0011200\0064\000\000\000", null, null, !182, !128, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 11200, align 64, offset 0] [from BLOCKD]
!182 = !{!"0x16\00BLOCKD\00203\000\000\000\000", !4, null, !183} ; [ DW_TAG_typedef ] [BLOCKD] [line 203, size 0, align 0, offset 0] [from blockd]
!183 = !{!"0x13\00blockd\00192\00448\0064\000\000\000", !4, null, null, !184, null, null, null} ; [ DW_TAG_structure_type ] [blockd] [line 192, size 448, align 64, offset 0] [def] [from ]
!184 = !{!185, !186, !187, !188, !189, !190, !192}
!185 = !{!"0xd\00qcoeff\00194\0064\0064\000\000", !4, !183, !115} ; [ DW_TAG_member ] [qcoeff] [line 194, size 64, align 64, offset 0] [from ]
!186 = !{!"0xd\00dqcoeff\00195\0064\0064\0064\000", !4, !183, !115} ; [ DW_TAG_member ] [dqcoeff] [line 195, size 64, align 64, offset 64] [from ]
!187 = !{!"0xd\00predictor\00196\0064\0064\00128\000", !4, !183, !60} ; [ DW_TAG_member ] [predictor] [line 196, size 64, align 64, offset 128] [from ]
!188 = !{!"0xd\00dequant\00197\0064\0064\00192\000", !4, !183, !115} ; [ DW_TAG_member ] [dequant] [line 197, size 64, align 64, offset 192] [from ]
!189 = !{!"0xd\00offset\00199\0032\0032\00256\000", !4, !183, !72} ; [ DW_TAG_member ] [offset] [line 199, size 32, align 32, offset 256] [from int]
!190 = !{!"0xd\00eob\00200\0064\0064\00320\000", !4, !183, !191} ; [ DW_TAG_member ] [eob] [line 200, size 64, align 64, offset 320] [from ]
!191 = !{!"0xf\00\000\0064\0064\000\000", null, null, !172} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!192 = !{!"0xd\00bmi\00202\0032\0032\00384\000", !4, !183, !193} ; [ DW_TAG_member ] [bmi] [line 202, size 32, align 32, offset 384] [from b_mode_info]
!193 = !{!"0x17\00b_mode_info\00136\0032\0032\000\000\000", !4, null, null, !194, null, null, null} ; [ DW_TAG_union_type ] [b_mode_info] [line 136, size 32, align 32, offset 0] [def] [from ]
!194 = !{!195, !197}
!195 = !{!"0xd\00as_mode\00138\0032\0032\000\000", !4, !193, !196} ; [ DW_TAG_member ] [as_mode] [line 138, size 32, align 32, offset 0] [from B_PREDICTION_MODE]
!196 = !{!"0x16\00B_PREDICTION_MODE\00127\000\000\000\000", !4, null, !3} ; [ DW_TAG_typedef ] [B_PREDICTION_MODE] [line 127, size 0, align 0, offset 0] [from ]
!197 = !{!"0xd\00mv\00139\0032\0032\000\000", !4, !193, !74} ; [ DW_TAG_member ] [mv] [line 139, size 32, align 32, offset 0] [from int_mv]
!198 = !{!"0xd\00fullpixel_mask\00221\0032\0032\0028352\000", !4, !162, !72} ; [ DW_TAG_member ] [fullpixel_mask] [line 221, size 32, align 32, offset 28352] [from int]
!199 = !{!"0xd\00pre\00223\00960\0064\0028416\000", !4, !162, !131} ; [ DW_TAG_member ] [pre] [line 223, size 960, align 64, offset 28416] [from YV12_BUFFER_CONFIG]
!200 = !{!"0xd\00dst\00224\00960\0064\0029376\000", !4, !162, !131} ; [ DW_TAG_member ] [dst] [line 224, size 960, align 64, offset 29376] [from YV12_BUFFER_CONFIG]
!201 = !{!"0xd\00mode_info_context\00226\0064\0064\0030336\000", !4, !162, !202} ; [ DW_TAG_member ] [mode_info_context] [line 226, size 64, align 64, offset 30336] [from ]
!202 = !{!"0xf\00\000\0064\0064\000\000", null, null, !203} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from MODE_INFO]
!203 = !{!"0x16\00MODE_INFO\00168\000\000\000\000", !4, null, !204} ; [ DW_TAG_typedef ] [MODE_INFO] [line 168, size 0, align 0, offset 0] [from modeinfo]
!204 = !{!"0x13\00modeinfo\00164\00608\0032\000\000\000", !4, null, null, !205, null, null, null} ; [ DW_TAG_structure_type ] [modeinfo] [line 164, size 608, align 32, offset 0] [def] [from ]
!205 = !{!206, !219}
!206 = !{!"0xd\00mbmi\00166\0096\0032\000\000", !4, !204, !207} ; [ DW_TAG_member ] [mbmi] [line 166, size 96, align 32, offset 0] [from MB_MODE_INFO]
!207 = !{!"0x16\00MB_MODE_INFO\00162\000\000\000\000", !4, null, !208} ; [ DW_TAG_typedef ] [MB_MODE_INFO] [line 162, size 0, align 0, offset 0] [from ]
!208 = !{!"0x13\00\00151\0096\0032\000\000\000", !4, null, null, !209, null, null, null} ; [ DW_TAG_structure_type ] [line 151, size 96, align 32, offset 0] [def] [from ]
!209 = !{!210, !211, !212, !213, !214, !215, !216, !217, !218}
!210 = !{!"0xd\00mode\00153\008\008\000\000", !4, !208, !150} ; [ DW_TAG_member ] [mode] [line 153, size 8, align 8, offset 0] [from uint8_t]
!211 = !{!"0xd\00uv_mode\00153\008\008\008\000", !4, !208, !150} ; [ DW_TAG_member ] [uv_mode] [line 153, size 8, align 8, offset 8] [from uint8_t]
!212 = !{!"0xd\00ref_frame\00154\008\008\0016\000", !4, !208, !150} ; [ DW_TAG_member ] [ref_frame] [line 154, size 8, align 8, offset 16] [from uint8_t]
!213 = !{!"0xd\00is_4x4\00155\008\008\0024\000", !4, !208, !150} ; [ DW_TAG_member ] [is_4x4] [line 155, size 8, align 8, offset 24] [from uint8_t]
!214 = !{!"0xd\00mv\00156\0032\0032\0032\000", !4, !208, !74} ; [ DW_TAG_member ] [mv] [line 156, size 32, align 32, offset 32] [from int_mv]
!215 = !{!"0xd\00partitioning\00158\008\008\0064\000", !4, !208, !150} ; [ DW_TAG_member ] [partitioning] [line 158, size 8, align 8, offset 64] [from uint8_t]
!216 = !{!"0xd\00mb_skip_coeff\00159\008\008\0072\000", !4, !208, !150} ; [ DW_TAG_member ] [mb_skip_coeff] [line 159, size 8, align 8, offset 72] [from uint8_t]
!217 = !{!"0xd\00need_to_clamp_mvs\00160\008\008\0080\000", !4, !208, !150} ; [ DW_TAG_member ] [need_to_clamp_mvs] [line 160, size 8, align 8, offset 80] [from uint8_t]
!218 = !{!"0xd\00segment_id\00161\008\008\0088\000", !4, !208, !150} ; [ DW_TAG_member ] [segment_id] [line 161, size 8, align 8, offset 88] [from uint8_t]
!219 = !{!"0xd\00bmi\00167\00512\0032\0096\000", !4, !204, !220} ; [ DW_TAG_member ] [bmi] [line 167, size 512, align 32, offset 96] [from ]
!220 = !{!"0x1\00\000\00512\0032\000\000\000", null, null, !193, !175, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 32, offset 0] [from b_mode_info]
!221 = !{!"0xd\00mode_info_stride\00227\0032\0032\0030400\000", !4, !162, !72} ; [ DW_TAG_member ] [mode_info_stride] [line 227, size 32, align 32, offset 30400] [from int]
!222 = !{!"0xd\00frame_type\00229\0032\0032\0030432\000", !4, !162, !223} ; [ DW_TAG_member ] [frame_type] [line 229, size 32, align 32, offset 30432] [from FRAME_TYPE]
!223 = !{!"0x16\00FRAME_TYPE\0068\000\000\000\000", !4, null, !21} ; [ DW_TAG_typedef ] [FRAME_TYPE] [line 68, size 0, align 0, offset 0] [from ]
!224 = !{!"0xd\00up_available\00231\0032\0032\0030464\000", !4, !162, !72} ; [ DW_TAG_member ] [up_available] [line 231, size 32, align 32, offset 30464] [from int]
!225 = !{!"0xd\00left_available\00232\0032\0032\0030496\000", !4, !162, !72} ; [ DW_TAG_member ] [left_available] [line 232, size 32, align 32, offset 30496] [from int]
!226 = !{!"0xd\00recon_above\00234\00192\0064\0030528\000", !4, !162, !227} ; [ DW_TAG_member ] [recon_above] [line 234, size 192, align 64, offset 30528] [from ]
!227 = !{!"0x1\00\000\00192\0064\000\000\000", null, null, !60, !228, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from ]
!228 = !{!229}
!229 = !{!"0x21\000\003"}                         ; [ DW_TAG_subrange_type ] [0, 2]
!230 = !{!"0xd\00recon_left\00235\00192\0064\0030720\000", !4, !162, !227} ; [ DW_TAG_member ] [recon_left] [line 235, size 192, align 64, offset 30720] [from ]
!231 = !{!"0xd\00recon_left_stride\00236\0064\0032\0030912\000", !4, !162, !232} ; [ DW_TAG_member ] [recon_left_stride] [line 236, size 64, align 32, offset 30912] [from ]
!232 = !{!"0x1\00\000\0064\0032\000\000\000", null, null, !72, !233, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!233 = !{!234}
!234 = !{!"0x21\000\002"}                         ; [ DW_TAG_subrange_type ] [0, 1]
!235 = !{!"0xd\00above_context\00239\0064\0064\0030976\000", !4, !162, !236} ; [ DW_TAG_member ] [above_context] [line 239, size 64, align 64, offset 30976] [from ]
!236 = !{!"0xf\00\000\0064\0064\000\000", null, null, !237} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ENTROPY_CONTEXT_PLANES]
!237 = !{!"0x16\00ENTROPY_CONTEXT_PLANES\0055\000\000\000\000", !4, null, !238} ; [ DW_TAG_typedef ] [ENTROPY_CONTEXT_PLANES] [line 55, size 0, align 0, offset 0] [from ]
!238 = !{!"0x13\00\0049\0072\008\000\000\000", !4, null, null, !239, null, null, null} ; [ DW_TAG_structure_type ] [line 49, size 72, align 8, offset 0] [def] [from ]
!239 = !{!240, !245, !247, !248}
!240 = !{!"0xd\00y1\0051\0032\008\000\000", !4, !238, !241} ; [ DW_TAG_member ] [y1] [line 51, size 32, align 8, offset 0] [from ]
!241 = !{!"0x1\00\000\0032\008\000\000\000", null, null, !242, !243, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from ENTROPY_CONTEXT]
!242 = !{!"0x16\00ENTROPY_CONTEXT\0048\000\000\000\000", !4, null, !172} ; [ DW_TAG_typedef ] [ENTROPY_CONTEXT] [line 48, size 0, align 0, offset 0] [from char]
!243 = !{!244}
!244 = !{!"0x21\000\004"}                         ; [ DW_TAG_subrange_type ] [0, 3]
!245 = !{!"0xd\00u\0052\0016\008\0032\000", !4, !238, !246} ; [ DW_TAG_member ] [u] [line 52, size 16, align 8, offset 32] [from ]
!246 = !{!"0x1\00\000\0016\008\000\000\000", null, null, !242, !233, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16, align 8, offset 0] [from ENTROPY_CONTEXT]
!247 = !{!"0xd\00v\0053\0016\008\0048\000", !4, !238, !246} ; [ DW_TAG_member ] [v] [line 53, size 16, align 8, offset 48] [from ]
!248 = !{!"0xd\00y2\0054\008\008\0064\000", !4, !238, !242} ; [ DW_TAG_member ] [y2] [line 54, size 8, align 8, offset 64] [from ENTROPY_CONTEXT]
!249 = !{!"0xd\00left_context\00240\0064\0064\0031040\000", !4, !162, !236} ; [ DW_TAG_member ] [left_context] [line 240, size 64, align 64, offset 31040] [from ]
!250 = !{!"0xd\00segmentation_enabled\00243\008\008\0031104\000", !4, !162, !61} ; [ DW_TAG_member ] [segmentation_enabled] [line 243, size 8, align 8, offset 31104] [from unsigned char]
!251 = !{!"0xd\00update_mb_segmentation_map\00246\008\008\0031112\000", !4, !162, !61} ; [ DW_TAG_member ] [update_mb_segmentation_map] [line 246, size 8, align 8, offset 31112] [from unsigned char]
!252 = !{!"0xd\00update_mb_segmentation_data\00249\008\008\0031120\000", !4, !162, !61} ; [ DW_TAG_member ] [update_mb_segmentation_data] [line 249, size 8, align 8, offset 31120] [from unsigned char]
!253 = !{!"0xd\00mb_segement_abs_delta\00252\008\008\0031128\000", !4, !162, !61} ; [ DW_TAG_member ] [mb_segement_abs_delta] [line 252, size 8, align 8, offset 31128] [from unsigned char]
!254 = !{!"0xd\00mb_segment_tree_probs\00256\0024\008\0031136\000", !4, !162, !255} ; [ DW_TAG_member ] [mb_segment_tree_probs] [line 256, size 24, align 8, offset 31136] [from ]
!255 = !{!"0x1\00\000\0024\008\000\000\000", null, null, !256, !228, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 24, align 8, offset 0] [from vp8_prob]
!256 = !{!"0x16\00vp8_prob\0018\000\000\000\000", !257, null, !61} ; [ DW_TAG_typedef ] [vp8_prob] [line 18, size 0, align 0, offset 0] [from unsigned char]
!257 = !{!"../../vp8/common/treecoder.h", !"/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder"}
!258 = !{!"0xd\00segment_feature_data\00258\0064\008\0031160\000", !4, !162, !259} ; [ DW_TAG_member ] [segment_feature_data] [line 258, size 64, align 8, offset 31160] [from ]
!259 = !{!"0x1\00\000\0064\008\000\000\000", null, null, !260, !261, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64, align 8, offset 0] [from signed char]
!260 = !{!"0x24\00signed char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!261 = !{!234, !244}
!262 = !{!"0xd\00mode_ref_lf_delta_enabled\00261\008\008\0031224\000", !4, !162, !61} ; [ DW_TAG_member ] [mode_ref_lf_delta_enabled] [line 261, size 8, align 8, offset 31224] [from unsigned char]
!263 = !{!"0xd\00mode_ref_lf_delta_update\00262\008\008\0031232\000", !4, !162, !61} ; [ DW_TAG_member ] [mode_ref_lf_delta_update] [line 262, size 8, align 8, offset 31232] [from unsigned char]
!264 = !{!"0xd\00last_ref_lf_deltas\00265\0032\008\0031240\000", !4, !162, !265} ; [ DW_TAG_member ] [last_ref_lf_deltas] [line 265, size 32, align 8, offset 31240] [from ]
!265 = !{!"0x1\00\000\0032\008\000\000\000", null, null, !260, !243, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from signed char]
!266 = !{!"0xd\00ref_lf_deltas\00266\0032\008\0031272\000", !4, !162, !265} ; [ DW_TAG_member ] [ref_lf_deltas] [line 266, size 32, align 8, offset 31272] [from ]
!267 = !{!"0xd\00last_mode_lf_deltas\00267\0032\008\0031304\000", !4, !162, !265} ; [ DW_TAG_member ] [last_mode_lf_deltas] [line 267, size 32, align 8, offset 31304] [from ]
!268 = !{!"0xd\00mode_lf_deltas\00268\0032\008\0031336\000", !4, !162, !265} ; [ DW_TAG_member ] [mode_lf_deltas] [line 268, size 32, align 8, offset 31336] [from ]
!269 = !{!"0xd\00mb_to_left_edge\00271\0032\0032\0031392\000", !4, !162, !72} ; [ DW_TAG_member ] [mb_to_left_edge] [line 271, size 32, align 32, offset 31392] [from int]
!270 = !{!"0xd\00mb_to_right_edge\00272\0032\0032\0031424\000", !4, !162, !72} ; [ DW_TAG_member ] [mb_to_right_edge] [line 272, size 32, align 32, offset 31424] [from int]
!271 = !{!"0xd\00mb_to_top_edge\00273\0032\0032\0031456\000", !4, !162, !72} ; [ DW_TAG_member ] [mb_to_top_edge] [line 273, size 32, align 32, offset 31456] [from int]
!272 = !{!"0xd\00mb_to_bottom_edge\00274\0032\0032\0031488\000", !4, !162, !72} ; [ DW_TAG_member ] [mb_to_bottom_edge] [line 274, size 32, align 32, offset 31488] [from int]
!273 = !{!"0xd\00subpixel_predict\00278\0064\0064\0031552\000", !4, !162, !274} ; [ DW_TAG_member ] [subpixel_predict] [line 278, size 64, align 64, offset 31552] [from vp8_subpix_fn_t]
!274 = !{!"0x16\00vp8_subpix_fn_t\00205\000\000\000\000", !4, null, !275} ; [ DW_TAG_typedef ] [vp8_subpix_fn_t] [line 205, size 0, align 0, offset 0] [from ]
!275 = !{!"0xf\00\000\0064\0064\000\000", null, null, !276} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!276 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !277, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!277 = !{null, !60, !72, !72, !72, !60, !72}
!278 = !{!"0xd\00subpixel_predict8x4\00279\0064\0064\0031616\000", !4, !162, !274} ; [ DW_TAG_member ] [subpixel_predict8x4] [line 279, size 64, align 64, offset 31616] [from vp8_subpix_fn_t]
!279 = !{!"0xd\00subpixel_predict8x8\00280\0064\0064\0031680\000", !4, !162, !274} ; [ DW_TAG_member ] [subpixel_predict8x8] [line 280, size 64, align 64, offset 31680] [from vp8_subpix_fn_t]
!280 = !{!"0xd\00subpixel_predict16x16\00281\0064\0064\0031744\000", !4, !162, !274} ; [ DW_TAG_member ] [subpixel_predict16x16] [line 281, size 64, align 64, offset 31744] [from vp8_subpix_fn_t]
!281 = !{!"0xd\00current_bc\00283\0064\0064\0031808\000", !4, !162, !282} ; [ DW_TAG_member ] [current_bc] [line 283, size 64, align 64, offset 31808] [from ]
!282 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!283 = !{!"0xd\00corrupted\00285\0032\0032\0031872\000", !4, !162, !72} ; [ DW_TAG_member ] [corrupted] [line 285, size 32, align 32, offset 31872] [from int]
!284 = !{!"0xd\00y_buf\00292\005632\008\0032000\000", !4, !162, !285} ; [ DW_TAG_member ] [y_buf] [line 292, size 5632, align 8, offset 32000] [from ]
!285 = !{!"0x1\00\000\005632\008\000\000\000", null, null, !61, !286, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 5632, align 8, offset 0] [from unsigned char]
!286 = !{!287}
!287 = !{!"0x21\000\00704"}                       ; [ DW_TAG_subrange_type ] [0, 703]
!288 = !{!"0xd\00partition_info\0076\0064\0064\0071168\000", !96, !97, !289} ; [ DW_TAG_member ] [partition_info] [line 76, size 64, align 64, offset 71168] [from ]
!289 = !{!"0xf\00\000\0064\0064\000\000", null, null, !290} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from PARTITION_INFO]
!290 = !{!"0x16\00PARTITION_INFO\0061\000\000\000\000", !96, null, !291} ; [ DW_TAG_typedef ] [PARTITION_INFO] [line 61, size 0, align 0, offset 0] [from ]
!291 = !{!"0x13\00\0053\001056\0032\000\000\000", !96, null, null, !292, null, null, null} ; [ DW_TAG_structure_type ] [line 53, size 1056, align 32, offset 0] [def] [from ]
!292 = !{!293, !294}
!293 = !{!"0xd\00count\0055\0032\0032\000\000", !96, !291, !72} ; [ DW_TAG_member ] [count] [line 55, size 32, align 32, offset 0] [from int]
!294 = !{!"0xd\00bmi\0060\001024\0032\0032\000", !96, !291, !295} ; [ DW_TAG_member ] [bmi] [line 60, size 1024, align 32, offset 32] [from ]
!295 = !{!"0x1\00\000\001024\0032\000\000\000", null, null, !296, !175, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 32, offset 0] [from ]
!296 = !{!"0x13\00\0056\0064\0032\000\000\000", !96, !291, null, !297, null, null, null} ; [ DW_TAG_structure_type ] [line 56, size 64, align 32, offset 0] [def] [from ]
!297 = !{!298, !299}
!298 = !{!"0xd\00mode\0058\0032\0032\000\000", !96, !296, !196} ; [ DW_TAG_member ] [mode] [line 58, size 32, align 32, offset 0] [from B_PREDICTION_MODE]
!299 = !{!"0xd\00mv\0059\0032\0032\0032\000", !96, !296, !74} ; [ DW_TAG_member ] [mv] [line 59, size 32, align 32, offset 32] [from int_mv]
!300 = !{!"0xd\00pi\0077\0064\0064\0071232\000", !96, !97, !289} ; [ DW_TAG_member ] [pi] [line 77, size 64, align 64, offset 71232] [from ]
!301 = !{!"0xd\00pip\0078\0064\0064\0071296\000", !96, !97, !289} ; [ DW_TAG_member ] [pip] [line 78, size 64, align 64, offset 71296] [from ]
!302 = !{!"0xd\00ref_frame_cost\0080\00128\0032\0071360\000", !96, !97, !303} ; [ DW_TAG_member ] [ref_frame_cost] [line 80, size 128, align 32, offset 71360] [from ]
!303 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !72, !243, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!304 = !{!"0xd\00ss\0082\0064\0064\0071488\000", !96, !97, !305} ; [ DW_TAG_member ] [ss] [line 82, size 64, align 64, offset 71488] [from ]
!305 = !{!"0xf\00\000\0064\0064\000\000", null, null, !306} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from search_site]
!306 = !{!"0x16\00search_site\0029\000\000\000\000", !96, null, !307} ; [ DW_TAG_typedef ] [search_site] [line 29, size 0, align 0, offset 0] [from ]
!307 = !{!"0x13\00\0025\0064\0032\000\000\000", !96, null, null, !308, null, null, null} ; [ DW_TAG_structure_type ] [line 25, size 64, align 32, offset 0] [def] [from ]
!308 = !{!309, !310}
!309 = !{!"0xd\00mv\0027\0032\0016\000\000", !96, !307, !82} ; [ DW_TAG_member ] [mv] [line 27, size 32, align 16, offset 0] [from MV]
!310 = !{!"0xd\00offset\0028\0032\0032\0032\000", !96, !307, !72} ; [ DW_TAG_member ] [offset] [line 28, size 32, align 32, offset 32] [from int]
!311 = !{!"0xd\00ss_count\0083\0032\0032\0071552\000", !96, !97, !72} ; [ DW_TAG_member ] [ss_count] [line 83, size 32, align 32, offset 71552] [from int]
!312 = !{!"0xd\00searches_per_step\0084\0032\0032\0071584\000", !96, !97, !72} ; [ DW_TAG_member ] [searches_per_step] [line 84, size 32, align 32, offset 71584] [from int]
!313 = !{!"0xd\00errorperbit\0086\0032\0032\0071616\000", !96, !97, !72} ; [ DW_TAG_member ] [errorperbit] [line 86, size 32, align 32, offset 71616] [from int]
!314 = !{!"0xd\00sadperbit16\0087\0032\0032\0071648\000", !96, !97, !72} ; [ DW_TAG_member ] [sadperbit16] [line 87, size 32, align 32, offset 71648] [from int]
!315 = !{!"0xd\00sadperbit4\0088\0032\0032\0071680\000", !96, !97, !72} ; [ DW_TAG_member ] [sadperbit4] [line 88, size 32, align 32, offset 71680] [from int]
!316 = !{!"0xd\00rddiv\0089\0032\0032\0071712\000", !96, !97, !72} ; [ DW_TAG_member ] [rddiv] [line 89, size 32, align 32, offset 71712] [from int]
!317 = !{!"0xd\00rdmult\0090\0032\0032\0071744\000", !96, !97, !72} ; [ DW_TAG_member ] [rdmult] [line 90, size 32, align 32, offset 71744] [from int]
!318 = !{!"0xd\00mb_activity_ptr\0091\0064\0064\0071808\000", !96, !97, !319} ; [ DW_TAG_member ] [mb_activity_ptr] [line 91, size 64, align 64, offset 71808] [from ]
!319 = !{!"0xf\00\000\0064\0064\000\000", null, null, !80} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!320 = !{!"0xd\00mb_norm_activity_ptr\0092\0064\0064\0071872\000", !96, !97, !89} ; [ DW_TAG_member ] [mb_norm_activity_ptr] [line 92, size 64, align 64, offset 71872] [from ]
!321 = !{!"0xd\00act_zbin_adj\0093\0032\0032\0071936\000", !96, !97, !72} ; [ DW_TAG_member ] [act_zbin_adj] [line 93, size 32, align 32, offset 71936] [from int]
!322 = !{!"0xd\00last_act_zbin_adj\0094\0032\0032\0071968\000", !96, !97, !72} ; [ DW_TAG_member ] [last_act_zbin_adj] [line 94, size 32, align 32, offset 71968] [from int]
!323 = !{!"0xd\00mvcost\0096\00128\0064\0072000\000", !96, !97, !324} ; [ DW_TAG_member ] [mvcost] [line 96, size 128, align 64, offset 72000] [from ]
!324 = !{!"0x1\00\000\00128\0064\000\000\000", null, null, !89, !233, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 64, offset 0] [from ]
!325 = !{!"0xd\00mvsadcost\0097\00128\0064\0072128\000", !96, !97, !324} ; [ DW_TAG_member ] [mvsadcost] [line 97, size 128, align 64, offset 72128] [from ]
!326 = !{!"0xd\00mbmode_cost\0098\0064\0064\0072256\000", !96, !97, !327} ; [ DW_TAG_member ] [mbmode_cost] [line 98, size 64, align 64, offset 72256] [from ]
!327 = !{!"0xf\00\000\0064\0064\000\000", null, null, !328} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!328 = !{!"0x1\00\000\00320\0032\000\000\000", null, null, !72, !329, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320, align 32, offset 0] [from int]
!329 = !{!330}
!330 = !{!"0x21\000\0010"}                        ; [ DW_TAG_subrange_type ] [0, 9]
!331 = !{!"0xd\00intra_uv_mode_cost\0099\0064\0064\0072320\000", !96, !97, !327} ; [ DW_TAG_member ] [intra_uv_mode_cost] [line 99, size 64, align 64, offset 72320] [from ]
!332 = !{!"0xd\00bmode_costs\00100\0064\0064\0072384\000", !96, !97, !333} ; [ DW_TAG_member ] [bmode_costs] [line 100, size 64, align 64, offset 72384] [from ]
!333 = !{!"0xf\00\000\0064\0064\000\000", null, null, !334} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!334 = !{!"0x1\00\000\003200\0032\000\000\000", null, null, !72, !335, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3200, align 32, offset 0] [from int]
!335 = !{!330, !330}
!336 = !{!"0xd\00inter_bmode_costs\00101\0064\0064\0072448\000", !96, !97, !89} ; [ DW_TAG_member ] [inter_bmode_costs] [line 101, size 64, align 64, offset 72448] [from ]
!337 = !{!"0xd\00token_costs\00102\0064\0064\0072512\000", !96, !97, !338} ; [ DW_TAG_member ] [token_costs] [line 102, size 64, align 64, offset 72512] [from ]
!338 = !{!"0xf\00\000\0064\0064\000\000", null, null, !339} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!339 = !{!"0x1\00\000\009216\0032\000\000\000", null, null, !72, !340, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 9216, align 32, offset 0] [from int]
!340 = !{!341, !229, !342}
!341 = !{!"0x21\000\008"}                         ; [ DW_TAG_subrange_type ] [0, 7]
!342 = !{!"0x21\000\0012"}                        ; [ DW_TAG_subrange_type ] [0, 11]
!343 = !{!"0xd\00mv_col_min\00108\0032\0032\0072576\000", !96, !97, !72} ; [ DW_TAG_member ] [mv_col_min] [line 108, size 32, align 32, offset 72576] [from int]
!344 = !{!"0xd\00mv_col_max\00109\0032\0032\0072608\000", !96, !97, !72} ; [ DW_TAG_member ] [mv_col_max] [line 109, size 32, align 32, offset 72608] [from int]
!345 = !{!"0xd\00mv_row_min\00110\0032\0032\0072640\000", !96, !97, !72} ; [ DW_TAG_member ] [mv_row_min] [line 110, size 32, align 32, offset 72640] [from int]
!346 = !{!"0xd\00mv_row_max\00111\0032\0032\0072672\000", !96, !97, !72} ; [ DW_TAG_member ] [mv_row_max] [line 111, size 32, align 32, offset 72672] [from int]
!347 = !{!"0xd\00skip\00113\0032\0032\0072704\000", !96, !97, !72} ; [ DW_TAG_member ] [skip] [line 113, size 32, align 32, offset 72704] [from int]
!348 = !{!"0xd\00encode_breakout\00115\0032\0032\0072736\000", !96, !97, !80} ; [ DW_TAG_member ] [encode_breakout] [line 115, size 32, align 32, offset 72736] [from unsigned int]
!349 = !{!"0xd\00gf_active_ptr\00117\0064\0064\0072768\000", !96, !97, !350} ; [ DW_TAG_member ] [gf_active_ptr] [line 117, size 64, align 64, offset 72768] [from ]
!350 = !{!"0xf\00\000\0064\0064\000\000", null, null, !260} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from signed char]
!351 = !{!"0xd\00active_ptr\00119\0064\0064\0072832\000", !96, !97, !60} ; [ DW_TAG_member ] [active_ptr] [line 119, size 64, align 64, offset 72832] [from ]
!352 = !{!"0xd\00mvc\00120\0064\0064\0072896\000", !96, !97, !353} ; [ DW_TAG_member ] [mvc] [line 120, size 64, align 64, offset 72896] [from ]
!353 = !{!"0xf\00\000\0064\0064\000\000", null, null, !354} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from MV_CONTEXT]
!354 = !{!"0x16\00MV_CONTEXT\0040\000\000\000\000", !46, null, !355} ; [ DW_TAG_typedef ] [MV_CONTEXT] [line 40, size 0, align 0, offset 0] [from mv_context]
!355 = !{!"0x13\00mv_context\0037\00152\008\000\000\000", !46, null, null, !356, null, null, null} ; [ DW_TAG_structure_type ] [mv_context] [line 37, size 152, align 8, offset 0] [def] [from ]
!356 = !{!357}
!357 = !{!"0xd\00prob\0039\00152\008\000\000", !46, !355, !358} ; [ DW_TAG_member ] [prob] [line 39, size 152, align 8, offset 0] [from ]
!358 = !{!"0x1\00\000\00152\008\000\000\000", null, null, !256, !359, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 152, align 8, offset 0] [from vp8_prob]
!359 = !{!360}
!360 = !{!"0x21\000\0019"}                        ; [ DW_TAG_subrange_type ] [0, 18]
!361 = !{!"0xd\00optimize\00122\0032\0032\0072960\000", !96, !97, !72} ; [ DW_TAG_member ] [optimize] [line 122, size 32, align 32, offset 72960] [from int]
!362 = !{!"0xd\00q_index\00123\0032\0032\0072992\000", !96, !97, !72} ; [ DW_TAG_member ] [q_index] [line 123, size 32, align 32, offset 72992] [from int]
!363 = !{!"0xd\00best_sse_inter_mode\00126\0032\0032\0073024\000", !96, !97, !364} ; [ DW_TAG_member ] [best_sse_inter_mode] [line 126, size 32, align 32, offset 73024] [from MB_PREDICTION_MODE]
!364 = !{!"0x16\00MB_PREDICTION_MODE\0085\000\000\000\000", !4, null, !25} ; [ DW_TAG_typedef ] [MB_PREDICTION_MODE] [line 85, size 0, align 0, offset 0] [from ]
!365 = !{!"0xd\00best_sse_mv\00127\0032\0032\0073056\000", !96, !97, !74} ; [ DW_TAG_member ] [best_sse_mv] [line 127, size 32, align 32, offset 73056] [from int_mv]
!366 = !{!"0xd\00best_reference_frame\00128\0032\0032\0073088\000", !96, !97, !367} ; [ DW_TAG_member ] [best_reference_frame] [line 128, size 32, align 32, offset 73088] [from MV_REFERENCE_FRAME]
!367 = !{!"0x16\00MV_REFERENCE_FRAME\00149\000\000\000\000", !4, null, !38} ; [ DW_TAG_typedef ] [MV_REFERENCE_FRAME] [line 149, size 0, align 0, offset 0] [from ]
!368 = !{!"0xd\00best_zeromv_reference_frame\00129\0032\0032\0073120\000", !96, !97, !367} ; [ DW_TAG_member ] [best_zeromv_reference_frame] [line 129, size 32, align 32, offset 73120] [from MV_REFERENCE_FRAME]
!369 = !{!"0xd\00need_to_clamp_best_mvs\00130\008\008\0073152\000", !96, !97, !61} ; [ DW_TAG_member ] [need_to_clamp_best_mvs] [line 130, size 8, align 8, offset 73152] [from unsigned char]
!370 = !{!"0xd\00skip_true_count\00133\0032\0032\0073184\000", !96, !97, !72} ; [ DW_TAG_member ] [skip_true_count] [line 133, size 32, align 32, offset 73184] [from int]
!371 = !{!"0xd\00coef_counts\00134\0036864\0032\0073216\000", !96, !97, !372} ; [ DW_TAG_member ] [coef_counts] [line 134, size 36864, align 32, offset 73216] [from ]
!372 = !{!"0x1\00\000\0036864\0032\000\000\000", null, null, !80, !373, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 36864, align 32, offset 0] [from unsigned int]
!373 = !{!244, !341, !229, !342}
!374 = !{!"0xd\00MVcount\00135\00131008\0032\00110080\000", !96, !97, !375} ; [ DW_TAG_member ] [MVcount] [line 135, size 131008, align 32, offset 110080] [from ]
!375 = !{!"0x1\00\000\00131008\0032\000\000\000", null, null, !80, !376, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 131008, align 32, offset 0] [from unsigned int]
!376 = !{!234, !377}
!377 = !{!"0x21\000\002047"}                      ; [ DW_TAG_subrange_type ] [0, 2046]
!378 = !{!"0xd\00ymode_count\00136\00160\0032\00241088\000", !96, !97, !379} ; [ DW_TAG_member ] [ymode_count] [line 136, size 160, align 32, offset 241088] [from ]
!379 = !{!"0x1\00\000\00160\0032\000\000\000", null, null, !72, !380, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 32, offset 0] [from int]
!380 = !{!381}
!381 = !{!"0x21\000\005"}                         ; [ DW_TAG_subrange_type ] [0, 4]
!382 = !{!"0xd\00uv_mode_count\00137\00128\0032\00241248\000", !96, !97, !303} ; [ DW_TAG_member ] [uv_mode_count] [line 137, size 128, align 32, offset 241248] [from ]
!383 = !{!"0xd\00prediction_error\00138\0064\0064\00241408\000", !96, !97, !384} ; [ DW_TAG_member ] [prediction_error] [line 138, size 64, align 64, offset 241408] [from int64_t]
!384 = !{!"0x16\00int64_t\0040\000\000\000\000", !65, null, !66} ; [ DW_TAG_typedef ] [int64_t] [line 40, size 0, align 0, offset 0] [from long int]
!385 = !{!"0xd\00intra_error\00139\0064\0064\00241472\000", !96, !97, !384} ; [ DW_TAG_member ] [intra_error] [line 139, size 64, align 64, offset 241472] [from int64_t]
!386 = !{!"0xd\00count_mb_ref_frame_usage\00140\00128\0032\00241536\000", !96, !97, !303} ; [ DW_TAG_member ] [count_mb_ref_frame_usage] [line 140, size 128, align 32, offset 241536] [from ]
!387 = !{!"0xd\00rd_thresh_mult\00142\00640\0032\00241664\000", !96, !97, !388} ; [ DW_TAG_member ] [rd_thresh_mult] [line 142, size 640, align 32, offset 241664] [from ]
!388 = !{!"0x1\00\000\00640\0032\000\000\000", null, null, !72, !389, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 32, offset 0] [from int]
!389 = !{!390}
!390 = !{!"0x21\000\0020"}                        ; [ DW_TAG_subrange_type ] [0, 19]
!391 = !{!"0xd\00rd_threshes\00143\00640\0032\00242304\000", !96, !97, !388} ; [ DW_TAG_member ] [rd_threshes] [line 143, size 640, align 32, offset 242304] [from ]
!392 = !{!"0xd\00mbs_tested_so_far\00144\0032\0032\00242944\000", !96, !97, !80} ; [ DW_TAG_member ] [mbs_tested_so_far] [line 144, size 32, align 32, offset 242944] [from unsigned int]
!393 = !{!"0xd\00mode_test_hit_counts\00145\00640\0032\00242976\000", !96, !97, !394} ; [ DW_TAG_member ] [mode_test_hit_counts] [line 145, size 640, align 32, offset 242976] [from ]
!394 = !{!"0x1\00\000\00640\0032\000\000\000", null, null, !80, !389, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 32, offset 0] [from unsigned int]
!395 = !{!"0xd\00zbin_mode_boost_enabled\00146\0032\0032\00243616\000", !96, !97, !72} ; [ DW_TAG_member ] [zbin_mode_boost_enabled] [line 146, size 32, align 32, offset 243616] [from int]
!396 = !{!"0xd\00zbin_mode_boost\00147\0032\0032\00243648\000", !96, !97, !72} ; [ DW_TAG_member ] [zbin_mode_boost] [line 147, size 32, align 32, offset 243648] [from int]
!397 = !{!"0xd\00last_zbin_mode_boost\00148\0032\0032\00243680\000", !96, !97, !72} ; [ DW_TAG_member ] [last_zbin_mode_boost] [line 148, size 32, align 32, offset 243680] [from int]
!398 = !{!"0xd\00last_zbin_over_quant\00150\0032\0032\00243712\000", !96, !97, !72} ; [ DW_TAG_member ] [last_zbin_over_quant] [line 150, size 32, align 32, offset 243712] [from int]
!399 = !{!"0xd\00zbin_over_quant\00151\0032\0032\00243744\000", !96, !97, !72} ; [ DW_TAG_member ] [zbin_over_quant] [line 151, size 32, align 32, offset 243744] [from int]
!400 = !{!"0xd\00error_bins\00152\0032768\0032\00243776\000", !96, !97, !401} ; [ DW_TAG_member ] [error_bins] [line 152, size 32768, align 32, offset 243776] [from ]
!401 = !{!"0x1\00\000\0032768\0032\000\000\000", null, null, !72, !402, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32768, align 32, offset 0] [from int]
!402 = !{!403}
!403 = !{!"0x21\000\001024"}                      ; [ DW_TAG_subrange_type ] [0, 1023]
!404 = !{!"0xd\00short_fdct4x4\00154\0064\0064\00276544\000", !96, !97, !405} ; [ DW_TAG_member ] [short_fdct4x4] [line 154, size 64, align 64, offset 276544] [from ]
!405 = !{!"0xf\00\000\0064\0064\000\000", null, null, !406} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!406 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !407, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!407 = !{null, !115, !115, !72}
!408 = !{!"0xd\00short_fdct8x4\00155\0064\0064\00276608\000", !96, !97, !405} ; [ DW_TAG_member ] [short_fdct8x4] [line 155, size 64, align 64, offset 276608] [from ]
!409 = !{!"0xd\00short_walsh4x4\00156\0064\0064\00276672\000", !96, !97, !405} ; [ DW_TAG_member ] [short_walsh4x4] [line 156, size 64, align 64, offset 276672] [from ]
!410 = !{!"0xd\00quantize_b\00157\0064\0064\00276736\000", !96, !97, !411} ; [ DW_TAG_member ] [quantize_b] [line 157, size 64, align 64, offset 276736] [from ]
!411 = !{!"0xf\00\000\0064\0064\000\000", null, null, !412} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!412 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !413, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!413 = !{null, !414, !415}
!414 = !{!"0xf\00\000\0064\0064\000\000", null, null, !111} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from BLOCK]
!415 = !{!"0xf\00\000\0064\0064\000\000", null, null, !182} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from BLOCKD]
!416 = !{!"0xd\00quantize_b_pair\00158\0064\0064\00276800\000", !96, !97, !417} ; [ DW_TAG_member ] [quantize_b_pair] [line 158, size 64, align 64, offset 276800] [from ]
!417 = !{!"0xf\00\000\0064\0064\000\000", null, null, !418} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!418 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !419, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!419 = !{null, !414, !414, !415, !415}
!420 = !{!"0x2e\00vp8_init3smotion_compensation\00vp8_init3smotion_compensation\00\00107\000\001\000\000\00256\000\00108", !1, !69, !92, null, void (%struct.macroblock*, i32)* @vp8_init3smotion_compensation, null, null, !90} ; [ DW_TAG_subprogram ] [line 107] [def] [scope 108] [vp8_init3smotion_compensation]
!421 = !{!"0x2e\00vp8_find_best_sub_pixel_step_iteratively\00vp8_find_best_sub_pixel_step_iteratively\00\00203\000\001\000\000\00256\000\00209", !1, !69, !422, null, i32 (%struct.macroblock*, %struct.block*, %struct.blockd*, %union.int_mv*, %union.int_mv*, i32, %struct.variance_vtable*, i32**, i32*, i32*)* @vp8_find_best_sub_pixel_step_iteratively, null, null, !90} ; [ DW_TAG_subprogram ] [line 203] [def] [scope 209] [vp8_find_best_sub_pixel_step_iteratively]
!422 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !423, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!423 = !{!72, !94, !414, !415, !73, !73, !72, !424, !88, !89, !319}
!424 = !{!"0xf\00\000\0064\0064\000\000", null, null, !425} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!425 = !{!"0x26\00\000\000\000\000\000", null, null, !426} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from vp8_variance_fn_ptr_t]
!426 = !{!"0x16\00vp8_variance_fn_ptr_t\00113\000\000\000\000", !427, null, !428} ; [ DW_TAG_typedef ] [vp8_variance_fn_ptr_t] [line 113, size 0, align 0, offset 0] [from variance_vtable]
!427 = !{!"../../vp8/common/variance.h", !"/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder"}
!428 = !{!"0x13\00variance_vtable\0099\00640\0064\000\000\000", !427, null, null, !429, null, null, null} ; [ DW_TAG_structure_type ] [variance_vtable] [line 99, size 640, align 64, offset 0] [def] [from ]
!429 = !{!430, !437, !442, !447, !448, !449, !450, !455, !460, !467}
!430 = !{!"0xd\00sdf\00101\0064\0064\000\000", !427, !428, !431} ; [ DW_TAG_member ] [sdf] [line 101, size 64, align 64, offset 0] [from vp8_sad_fn_t]
!431 = !{!"0x16\00vp8_sad_fn_t\0017\000\000\000\000", !427, null, !432} ; [ DW_TAG_typedef ] [vp8_sad_fn_t] [line 17, size 0, align 0, offset 0] [from ]
!432 = !{!"0xf\00\000\0064\0064\000\000", null, null, !433} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!433 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !434, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!434 = !{!80, !435, !72, !435, !72, !80}
!435 = !{!"0xf\00\000\0064\0064\000\000", null, null, !436} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!436 = !{!"0x26\00\000\000\000\000\000", null, null, !61} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!437 = !{!"0xd\00vf\00102\0064\0064\0064\000", !427, !428, !438} ; [ DW_TAG_member ] [vf] [line 102, size 64, align 64, offset 64] [from vp8_variance_fn_t]
!438 = !{!"0x16\00vp8_variance_fn_t\0056\000\000\000\000", !427, null, !439} ; [ DW_TAG_typedef ] [vp8_variance_fn_t] [line 56, size 0, align 0, offset 0] [from ]
!439 = !{!"0xf\00\000\0064\0064\000\000", null, null, !440} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!440 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !441, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!441 = !{!80, !435, !72, !435, !72, !319}
!442 = !{!"0xd\00svf\00103\0064\0064\00128\000", !427, !428, !443} ; [ DW_TAG_member ] [svf] [line 103, size 64, align 64, offset 128] [from vp8_subpixvariance_fn_t]
!443 = !{!"0x16\00vp8_subpixvariance_fn_t\0065\000\000\000\000", !427, null, !444} ; [ DW_TAG_typedef ] [vp8_subpixvariance_fn_t] [line 65, size 0, align 0, offset 0] [from ]
!444 = !{!"0xf\00\000\0064\0064\000\000", null, null, !445} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!445 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !446, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!446 = !{!80, !435, !72, !72, !72, !435, !72, !319}
!447 = !{!"0xd\00svf_halfpix_h\00104\0064\0064\00192\000", !427, !428, !438} ; [ DW_TAG_member ] [svf_halfpix_h] [line 104, size 64, align 64, offset 192] [from vp8_variance_fn_t]
!448 = !{!"0xd\00svf_halfpix_v\00105\0064\0064\00256\000", !427, !428, !438} ; [ DW_TAG_member ] [svf_halfpix_v] [line 105, size 64, align 64, offset 256] [from vp8_variance_fn_t]
!449 = !{!"0xd\00svf_halfpix_hv\00106\0064\0064\00320\000", !427, !428, !438} ; [ DW_TAG_member ] [svf_halfpix_hv] [line 106, size 64, align 64, offset 320] [from vp8_variance_fn_t]
!450 = !{!"0xd\00sdx3f\00107\0064\0064\00384\000", !427, !428, !451} ; [ DW_TAG_member ] [sdx3f] [line 107, size 64, align 64, offset 384] [from vp8_sad_multi_fn_t]
!451 = !{!"0x16\00vp8_sad_multi_fn_t\0031\000\000\000\000", !427, null, !452} ; [ DW_TAG_typedef ] [vp8_sad_multi_fn_t] [line 31, size 0, align 0, offset 0] [from ]
!452 = !{!"0xf\00\000\0064\0064\000\000", null, null, !453} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!453 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !454, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!454 = !{null, !435, !72, !435, !72, !319}
!455 = !{!"0xd\00sdx8f\00108\0064\0064\00448\000", !427, !428, !456} ; [ DW_TAG_member ] [sdx8f] [line 108, size 64, align 64, offset 448] [from vp8_sad_multi1_fn_t]
!456 = !{!"0x16\00vp8_sad_multi1_fn_t\0038\000\000\000\000", !427, null, !457} ; [ DW_TAG_typedef ] [vp8_sad_multi1_fn_t] [line 38, size 0, align 0, offset 0] [from ]
!457 = !{!"0xf\00\000\0064\0064\000\000", null, null, !458} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!458 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !459, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!459 = !{null, !435, !72, !435, !72, !62}
!460 = !{!"0xd\00sdx4df\00109\0064\0064\00512\000", !427, !428, !461} ; [ DW_TAG_member ] [sdx4df] [line 109, size 64, align 64, offset 512] [from vp8_sad_multi_d_fn_t]
!461 = !{!"0x16\00vp8_sad_multi_d_fn_t\0047\000\000\000\000", !427, null, !462} ; [ DW_TAG_typedef ] [vp8_sad_multi_d_fn_t] [line 47, size 0, align 0, offset 0] [from ]
!462 = !{!"0xf\00\000\0064\0064\000\000", null, null, !463} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!463 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !464, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!464 = !{null, !435, !72, !465, !72, !319}
!465 = !{!"0xf\00\000\0064\0064\000\000", null, null, !466} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!466 = !{!"0x26\00\000\000\000\000\000", null, null, !435} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!467 = !{!"0xd\00copymem\00111\0064\0064\00576\000", !427, !428, !468} ; [ DW_TAG_member ] [copymem] [line 111, size 64, align 64, offset 576] [from vp8_copy32xn_fn_t]
!468 = !{!"0x16\00vp8_copy32xn_fn_t\0024\000\000\000\000", !427, null, !469} ; [ DW_TAG_typedef ] [vp8_copy32xn_fn_t] [line 24, size 0, align 0, offset 0] [from ]
!469 = !{!"0xf\00\000\0064\0064\000\000", null, null, !470} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!470 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !471, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!471 = !{null, !435, !72, !435, !72, !72}
!472 = !{!"0x2e\00vp8_find_best_sub_pixel_step\00vp8_find_best_sub_pixel_step\00\00361\000\001\000\000\00256\000\00367", !1, !69, !422, null, i32 (%struct.macroblock*, %struct.block*, %struct.blockd*, %union.int_mv*, %union.int_mv*, i32, %struct.variance_vtable*, i32**, i32*, i32*)* @vp8_find_best_sub_pixel_step, null, null, !90} ; [ DW_TAG_subprogram ] [line 361] [def] [scope 367] [vp8_find_best_sub_pixel_step]
!473 = !{!"0x2e\00vp8_find_best_half_pixel_step\00vp8_find_best_half_pixel_step\00\00672\000\001\000\000\00256\000\00678", !1, !69, !422, null, i32 (%struct.macroblock*, %struct.block*, %struct.blockd*, %union.int_mv*, %union.int_mv*, i32, %struct.variance_vtable*, i32**, i32*, i32*)* @vp8_find_best_half_pixel_step, null, null, !90} ; [ DW_TAG_subprogram ] [line 672] [def] [scope 678] [vp8_find_best_half_pixel_step]
!474 = !{!"0x2e\00vp8_hex_search\00vp8_hex_search\00\00849\000\001\000\000\00256\000\00863", !1, !69, !475, null, i32 (%struct.macroblock*, %struct.block*, %struct.blockd*, %union.int_mv*, %union.int_mv*, i32, i32, %struct.variance_vtable*, i32**, i32**, %union.int_mv*)* @vp8_hex_search, null, null, !90} ; [ DW_TAG_subprogram ] [line 849] [def] [scope 863] [vp8_hex_search]
!475 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !476, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!476 = !{!72, !94, !414, !415, !73, !73, !72, !72, !424, !88, !88, !73}
!477 = !{!"0x2e\00vp8_diamond_search_sad_c\00vp8_diamond_search_sad_c\00\001038\000\001\000\000\00256\000\001052", !1, !69, !478, null, i32 (%struct.macroblock*, %struct.block*, %struct.blockd*, %union.int_mv*, %union.int_mv*, i32, i32, i32*, %struct.variance_vtable*, i32**, %union.int_mv*)* @vp8_diamond_search_sad_c, null, null, !90} ; [ DW_TAG_subprogram ] [line 1038] [def] [scope 1052] [vp8_diamond_search_sad_c]
!478 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !479, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!479 = !{!72, !94, !414, !415, !73, !73, !72, !72, !89, !480, !88, !73}
!480 = !{!"0xf\00\000\0064\0064\000\000", null, null, !426} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from vp8_variance_fn_ptr_t]
!481 = !{!"0x2e\00vp8_diamond_search_sadx4\00vp8_diamond_search_sadx4\00\001162\000\001\000\000\00256\000\001176", !1, !69, !478, null, i32 (%struct.macroblock*, %struct.block*, %struct.blockd*, %union.int_mv*, %union.int_mv*, i32, i32, i32*, %struct.variance_vtable*, i32**, %union.int_mv*)* @vp8_diamond_search_sadx4, null, null, !90} ; [ DW_TAG_subprogram ] [line 1162] [def] [scope 1176] [vp8_diamond_search_sadx4]
!482 = !{!"0x2e\00vp8_full_search_sad_c\00vp8_full_search_sad_c\00\001329\000\001\000\000\00256\000\001333", !1, !69, !483, null, i32 (%struct.macroblock*, %struct.block*, %struct.blockd*, %union.int_mv*, i32, i32, %struct.variance_vtable*, i32**, %union.int_mv*)* @vp8_full_search_sad_c, null, null, !90} ; [ DW_TAG_subprogram ] [line 1329] [def] [scope 1333] [vp8_full_search_sad_c]
!483 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !484, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!484 = !{!72, !94, !414, !415, !73, !72, !72, !480, !88, !73}
!485 = !{!"0x2e\00vp8_full_search_sadx3\00vp8_full_search_sadx3\00\001425\000\001\000\000\00256\000\001429", !1, !69, !483, null, i32 (%struct.macroblock*, %struct.block*, %struct.blockd*, %union.int_mv*, i32, i32, %struct.variance_vtable*, i32**, %union.int_mv*)* @vp8_full_search_sadx3, null, null, !90} ; [ DW_TAG_subprogram ] [line 1425] [def] [scope 1429] [vp8_full_search_sadx3]
!486 = !{!"0x2e\00vp8_full_search_sadx8\00vp8_full_search_sadx8\00\001559\000\001\000\000\00256\000\001563", !1, !69, !483, null, i32 (%struct.macroblock*, %struct.block*, %struct.blockd*, %union.int_mv*, i32, i32, %struct.variance_vtable*, i32**, %union.int_mv*)* @vp8_full_search_sadx8, null, null, !90} ; [ DW_TAG_subprogram ] [line 1559] [def] [scope 1563] [vp8_full_search_sadx8]
!487 = !{!"0x2e\00vp8_refining_search_sad_c\00vp8_refining_search_sad_c\00\001723\000\001\000\000\00256\000\001727", !1, !69, !483, null, i32 (%struct.macroblock*, %struct.block*, %struct.blockd*, %union.int_mv*, i32, i32, %struct.variance_vtable*, i32**, %union.int_mv*)* @vp8_refining_search_sad_c, null, null, !90} ; [ DW_TAG_subprogram ] [line 1723] [def] [scope 1727] [vp8_refining_search_sad_c]
!488 = !{!"0x2e\00vp8_refining_search_sadx4\00vp8_refining_search_sadx4\00\001803\000\001\000\000\00256\000\001807", !1, !69, !483, null, i32 (%struct.macroblock*, %struct.block*, %struct.blockd*, %union.int_mv*, i32, i32, %struct.variance_vtable*, i32**, %union.int_mv*)* @vp8_refining_search_sadx4, null, null, !90} ; [ DW_TAG_subprogram ] [line 1803] [def] [scope 1807] [vp8_refining_search_sadx4]
!489 = !{!"0x2e\00mvsad_err_cost\00mvsad_err_cost\00\0048\001\001\000\000\00256\000\0049", !1, !69, !70, null, i32 (%union.int_mv*, %union.int_mv*, i32**, i32)* @mvsad_err_cost, null, null, !90} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [scope 49] [mvsad_err_cost]
!490 = !{!"0x2e\00vp8_clamp_mv\00vp8_clamp_mv\00\0046\001\001\000\000\00256\000\0048", !491, !492, !493, null, void (%union.int_mv*, i32, i32, i32, i32)* @vp8_clamp_mv, null, null, !90} ; [ DW_TAG_subprogram ] [line 46] [local] [def] [scope 48] [vp8_clamp_mv]
!491 = !{!"../../vp8/common/findnearmv.h", !"/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder"}
!492 = !{!"0x29", !491}                           ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/../../vp8/common/findnearmv.h]
!493 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !494, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!494 = !{null, !73, !72, !72, !72, !72}
!495 = !{!"0x2e\00mv_err_cost\00mv_err_cost\00\0038\001\001\000\000\00256\000\0039", !1, !69, !70, null, i32 (%union.int_mv*, %union.int_mv*, i32**, i32)* @mv_err_cost, null, null, !90} ; [ DW_TAG_subprogram ] [line 38] [local] [def] [scope 39] [mv_err_cost]
!496 = !{!497}
!497 = !{!"0x34\00next_chkpts\00next_chkpts\00\00839\001\001", null, !69, !498, [6 x [3 x %struct.MV]]* @next_chkpts, null} ; [ DW_TAG_variable ] [next_chkpts] [line 839] [local] [def]
!498 = !{!"0x1\00\000\00576\0016\000\000\000", null, null, !499, !500, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 576, align 16, offset 0] [from ]
!499 = !{!"0x26\00\000\000\000\000\000", null, null, !82} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from MV]
!500 = !{!501, !229}
!501 = !{!"0x21\000\006"}                         ; [ DW_TAG_subrange_type ] [0, 5]
!502 = !{i32 2, !"Dwarf Version", i32 4}
!503 = !{i32 2, !"Debug Info Version", i32 2}
!504 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!505 = !{!"0x101\00mv\0016777242\000", !68, !69, !73} ; [ DW_TAG_arg_variable ] [mv] [line 26]
!506 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!507 = !MDLocation(line: 26, column: 29, scope: !68)
!508 = !{!"0x101\00ref\0033554458\000", !68, !69, !73} ; [ DW_TAG_arg_variable ] [ref] [line 26]
!509 = !MDLocation(line: 26, column: 41, scope: !68)
!510 = !{!"0x101\00mvcost\0050331674\000", !68, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 26]
!511 = !MDLocation(line: 26, column: 51, scope: !68)
!512 = !{!"0x101\00Weight\0067108890\000", !68, !69, !72} ; [ DW_TAG_arg_variable ] [Weight] [line 26]
!513 = !MDLocation(line: 26, column: 66, scope: !68)
!514 = !MDLocation(line: 35, column: 25, scope: !68)
!515 = !MDLocation(line: 35, column: 41, scope: !68)
!516 = !MDLocation(line: 35, column: 24, scope: !68)
!517 = !MDLocation(line: 35, column: 14, scope: !68)
!518 = !MDLocation(line: 35, column: 76, scope: !68)
!519 = !MDLocation(line: 35, column: 92, scope: !68)
!520 = !MDLocation(line: 35, column: 75, scope: !68)
!521 = !MDLocation(line: 35, column: 65, scope: !68)
!522 = !MDLocation(line: 35, column: 117, scope: !68)
!523 = !MDLocation(line: 35, column: 13, scope: !68)
!524 = !MDLocation(line: 35, column: 12, scope: !68)
!525 = !MDLocation(line: 35, column: 5, scope: !68)
!526 = !{!"0x101\00x\0016777275\000", !91, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 59]
!527 = !MDLocation(line: 59, column: 49, scope: !91)
!528 = !{!"0x101\00stride\0033554491\000", !91, !69, !72} ; [ DW_TAG_arg_variable ] [stride] [line 59]
!529 = !MDLocation(line: 59, column: 56, scope: !91)
!530 = !{!"0x100\00Len\0061\000", !91, !69, !72}  ; [ DW_TAG_auto_variable ] [Len] [line 61]
!531 = !MDLocation(line: 61, column: 9, scope: !91)
!532 = !{!"0x100\00search_site_count\0062\000", !91, !69, !72} ; [ DW_TAG_auto_variable ] [search_site_count] [line 62]
!533 = !MDLocation(line: 62, column: 9, scope: !91)
!534 = !MDLocation(line: 66, column: 5, scope: !91)
!535 = !MDLocation(line: 67, column: 11, scope: !91)
!536 = !MDLocation(line: 67, column: 5, scope: !91)
!537 = !MDLocation(line: 68, column: 11, scope: !91)
!538 = !MDLocation(line: 68, column: 5, scope: !91)
!539 = !MDLocation(line: 69, column: 11, scope: !91)
!540 = !MDLocation(line: 69, column: 5, scope: !91)
!541 = !MDLocation(line: 70, column: 5, scope: !91)
!542 = !MDLocation(line: 72, column: 5, scope: !91)
!543 = !MDLocation(line: 72, column: 12, scope: !544)
!544 = !{!"0xb\002", !1, !545}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!545 = !{!"0xb\001", !1, !91}                     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!546 = !MDLocation(line: 76, column: 15, scope: !547)
!547 = !{!"0xb\0073\005\000", !1, !91}            ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!548 = !MDLocation(line: 76, column: 9, scope: !547)
!549 = !MDLocation(line: 77, column: 44, scope: !547)
!550 = !MDLocation(line: 77, column: 43, scope: !547)
!551 = !MDLocation(line: 77, column: 15, scope: !547)
!552 = !MDLocation(line: 77, column: 9, scope: !547)
!553 = !MDLocation(line: 78, column: 44, scope: !547)
!554 = !MDLocation(line: 78, column: 43, scope: !547)
!555 = !MDLocation(line: 78, column: 50, scope: !547)
!556 = !MDLocation(line: 78, column: 15, scope: !547)
!557 = !MDLocation(line: 78, column: 9, scope: !547)
!558 = !MDLocation(line: 79, column: 9, scope: !547)
!559 = !MDLocation(line: 82, column: 15, scope: !547)
!560 = !MDLocation(line: 82, column: 9, scope: !547)
!561 = !MDLocation(line: 83, column: 43, scope: !547)
!562 = !MDLocation(line: 83, column: 15, scope: !547)
!563 = !MDLocation(line: 83, column: 9, scope: !547)
!564 = !MDLocation(line: 84, column: 43, scope: !547)
!565 = !MDLocation(line: 84, column: 49, scope: !547)
!566 = !MDLocation(line: 84, column: 15, scope: !547)
!567 = !MDLocation(line: 84, column: 9, scope: !547)
!568 = !MDLocation(line: 85, column: 9, scope: !547)
!569 = !MDLocation(line: 88, column: 44, scope: !547)
!570 = !MDLocation(line: 88, column: 43, scope: !547)
!571 = !MDLocation(line: 88, column: 15, scope: !547)
!572 = !MDLocation(line: 88, column: 9, scope: !547)
!573 = !MDLocation(line: 89, column: 15, scope: !547)
!574 = !MDLocation(line: 89, column: 9, scope: !547)
!575 = !MDLocation(line: 90, column: 44, scope: !547)
!576 = !MDLocation(line: 90, column: 43, scope: !547)
!577 = !MDLocation(line: 90, column: 15, scope: !547)
!578 = !MDLocation(line: 90, column: 9, scope: !547)
!579 = !MDLocation(line: 91, column: 9, scope: !547)
!580 = !MDLocation(line: 94, column: 43, scope: !547)
!581 = !MDLocation(line: 94, column: 15, scope: !547)
!582 = !MDLocation(line: 94, column: 9, scope: !547)
!583 = !MDLocation(line: 95, column: 15, scope: !547)
!584 = !MDLocation(line: 95, column: 9, scope: !547)
!585 = !MDLocation(line: 96, column: 43, scope: !547)
!586 = !MDLocation(line: 96, column: 15, scope: !547)
!587 = !MDLocation(line: 96, column: 9, scope: !547)
!588 = !MDLocation(line: 97, column: 9, scope: !547)
!589 = !MDLocation(line: 100, column: 9, scope: !547)
!590 = !MDLocation(line: 103, column: 19, scope: !91)
!591 = !MDLocation(line: 103, column: 5, scope: !91)
!592 = !MDLocation(line: 104, column: 5, scope: !91)
!593 = !MDLocation(line: 105, column: 1, scope: !91)
!594 = !{!"0x101\00x\0016777323\000", !420, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 107]
!595 = !MDLocation(line: 107, column: 48, scope: !420)
!596 = !{!"0x101\00stride\0033554539\000", !420, !69, !72} ; [ DW_TAG_arg_variable ] [stride] [line 107]
!597 = !MDLocation(line: 107, column: 55, scope: !420)
!598 = !{!"0x100\00Len\00109\000", !420, !69, !72} ; [ DW_TAG_auto_variable ] [Len] [line 109]
!599 = !MDLocation(line: 109, column: 9, scope: !420)
!600 = !{!"0x100\00search_site_count\00110\000", !420, !69, !72} ; [ DW_TAG_auto_variable ] [search_site_count] [line 110]
!601 = !MDLocation(line: 110, column: 9, scope: !420)
!602 = !MDLocation(line: 113, column: 5, scope: !420)
!603 = !MDLocation(line: 114, column: 11, scope: !420)
!604 = !MDLocation(line: 114, column: 5, scope: !420)
!605 = !MDLocation(line: 115, column: 11, scope: !420)
!606 = !MDLocation(line: 115, column: 5, scope: !420)
!607 = !MDLocation(line: 116, column: 11, scope: !420)
!608 = !MDLocation(line: 116, column: 5, scope: !420)
!609 = !MDLocation(line: 117, column: 5, scope: !420)
!610 = !MDLocation(line: 119, column: 5, scope: !420)
!611 = !MDLocation(line: 119, column: 12, scope: !612)
!612 = !{!"0xb\002", !1, !613}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!613 = !{!"0xb\001", !1, !420}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!614 = !MDLocation(line: 123, column: 15, scope: !615)
!615 = !{!"0xb\00120\005\001", !1, !420}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!616 = !MDLocation(line: 123, column: 9, scope: !615)
!617 = !MDLocation(line: 124, column: 44, scope: !615)
!618 = !MDLocation(line: 124, column: 43, scope: !615)
!619 = !MDLocation(line: 124, column: 15, scope: !615)
!620 = !MDLocation(line: 124, column: 9, scope: !615)
!621 = !MDLocation(line: 125, column: 44, scope: !615)
!622 = !MDLocation(line: 125, column: 43, scope: !615)
!623 = !MDLocation(line: 125, column: 50, scope: !615)
!624 = !MDLocation(line: 125, column: 15, scope: !615)
!625 = !MDLocation(line: 125, column: 9, scope: !615)
!626 = !MDLocation(line: 126, column: 9, scope: !615)
!627 = !MDLocation(line: 129, column: 15, scope: !615)
!628 = !MDLocation(line: 129, column: 9, scope: !615)
!629 = !MDLocation(line: 130, column: 43, scope: !615)
!630 = !MDLocation(line: 130, column: 15, scope: !615)
!631 = !MDLocation(line: 130, column: 9, scope: !615)
!632 = !MDLocation(line: 131, column: 43, scope: !615)
!633 = !MDLocation(line: 131, column: 49, scope: !615)
!634 = !MDLocation(line: 131, column: 15, scope: !615)
!635 = !MDLocation(line: 131, column: 9, scope: !615)
!636 = !MDLocation(line: 132, column: 9, scope: !615)
!637 = !MDLocation(line: 135, column: 44, scope: !615)
!638 = !MDLocation(line: 135, column: 43, scope: !615)
!639 = !MDLocation(line: 135, column: 15, scope: !615)
!640 = !MDLocation(line: 135, column: 9, scope: !615)
!641 = !MDLocation(line: 136, column: 15, scope: !615)
!642 = !MDLocation(line: 136, column: 9, scope: !615)
!643 = !MDLocation(line: 137, column: 44, scope: !615)
!644 = !MDLocation(line: 137, column: 43, scope: !615)
!645 = !MDLocation(line: 137, column: 15, scope: !615)
!646 = !MDLocation(line: 137, column: 9, scope: !615)
!647 = !MDLocation(line: 138, column: 9, scope: !615)
!648 = !MDLocation(line: 141, column: 43, scope: !615)
!649 = !MDLocation(line: 141, column: 15, scope: !615)
!650 = !MDLocation(line: 141, column: 9, scope: !615)
!651 = !MDLocation(line: 142, column: 15, scope: !615)
!652 = !MDLocation(line: 142, column: 9, scope: !615)
!653 = !MDLocation(line: 143, column: 43, scope: !615)
!654 = !MDLocation(line: 143, column: 15, scope: !615)
!655 = !MDLocation(line: 143, column: 9, scope: !615)
!656 = !MDLocation(line: 144, column: 9, scope: !615)
!657 = !MDLocation(line: 147, column: 44, scope: !615)
!658 = !MDLocation(line: 147, column: 43, scope: !615)
!659 = !MDLocation(line: 147, column: 15, scope: !615)
!660 = !MDLocation(line: 147, column: 9, scope: !615)
!661 = !MDLocation(line: 148, column: 44, scope: !615)
!662 = !MDLocation(line: 148, column: 43, scope: !615)
!663 = !MDLocation(line: 148, column: 15, scope: !615)
!664 = !MDLocation(line: 148, column: 9, scope: !615)
!665 = !MDLocation(line: 149, column: 44, scope: !615)
!666 = !MDLocation(line: 149, column: 43, scope: !615)
!667 = !MDLocation(line: 149, column: 50, scope: !615)
!668 = !MDLocation(line: 149, column: 59, scope: !615)
!669 = !MDLocation(line: 149, column: 15, scope: !615)
!670 = !MDLocation(line: 149, column: 9, scope: !615)
!671 = !MDLocation(line: 150, column: 9, scope: !615)
!672 = !MDLocation(line: 153, column: 43, scope: !615)
!673 = !MDLocation(line: 153, column: 15, scope: !615)
!674 = !MDLocation(line: 153, column: 9, scope: !615)
!675 = !MDLocation(line: 154, column: 44, scope: !615)
!676 = !MDLocation(line: 154, column: 43, scope: !615)
!677 = !MDLocation(line: 154, column: 15, scope: !615)
!678 = !MDLocation(line: 154, column: 9, scope: !615)
!679 = !MDLocation(line: 155, column: 44, scope: !615)
!680 = !MDLocation(line: 155, column: 43, scope: !615)
!681 = !MDLocation(line: 155, column: 50, scope: !615)
!682 = !MDLocation(line: 155, column: 59, scope: !615)
!683 = !MDLocation(line: 155, column: 15, scope: !615)
!684 = !MDLocation(line: 155, column: 9, scope: !615)
!685 = !MDLocation(line: 156, column: 9, scope: !615)
!686 = !MDLocation(line: 159, column: 44, scope: !615)
!687 = !MDLocation(line: 159, column: 43, scope: !615)
!688 = !MDLocation(line: 159, column: 15, scope: !615)
!689 = !MDLocation(line: 159, column: 9, scope: !615)
!690 = !MDLocation(line: 160, column: 43, scope: !615)
!691 = !MDLocation(line: 160, column: 15, scope: !615)
!692 = !MDLocation(line: 160, column: 9, scope: !615)
!693 = !MDLocation(line: 161, column: 43, scope: !615)
!694 = !MDLocation(line: 161, column: 49, scope: !615)
!695 = !MDLocation(line: 161, column: 58, scope: !615)
!696 = !MDLocation(line: 161, column: 15, scope: !615)
!697 = !MDLocation(line: 161, column: 9, scope: !615)
!698 = !MDLocation(line: 162, column: 9, scope: !615)
!699 = !MDLocation(line: 165, column: 43, scope: !615)
!700 = !MDLocation(line: 165, column: 15, scope: !615)
!701 = !MDLocation(line: 165, column: 9, scope: !615)
!702 = !MDLocation(line: 166, column: 43, scope: !615)
!703 = !MDLocation(line: 166, column: 15, scope: !615)
!704 = !MDLocation(line: 166, column: 9, scope: !615)
!705 = !MDLocation(line: 167, column: 43, scope: !615)
!706 = !MDLocation(line: 167, column: 49, scope: !615)
!707 = !MDLocation(line: 167, column: 58, scope: !615)
!708 = !MDLocation(line: 167, column: 15, scope: !615)
!709 = !MDLocation(line: 167, column: 9, scope: !615)
!710 = !MDLocation(line: 168, column: 9, scope: !615)
!711 = !MDLocation(line: 172, column: 9, scope: !615)
!712 = !MDLocation(line: 175, column: 19, scope: !420)
!713 = !MDLocation(line: 175, column: 5, scope: !420)
!714 = !MDLocation(line: 176, column: 5, scope: !420)
!715 = !MDLocation(line: 177, column: 1, scope: !420)
!716 = !{!"0x101\00x\0016777419\000", !421, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 203]
!717 = !MDLocation(line: 203, column: 58, scope: !421)
!718 = !{!"0x101\00b\0033554635\000", !421, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 203]
!719 = !MDLocation(line: 203, column: 68, scope: !421)
!720 = !{!"0x101\00d\0050331851\000", !421, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 203]
!721 = !MDLocation(line: 203, column: 79, scope: !421)
!722 = !{!"0x101\00bestmv\0067109068\000", !421, !69, !73} ; [ DW_TAG_arg_variable ] [bestmv] [line 204]
!723 = !MDLocation(line: 204, column: 54, scope: !421)
!724 = !{!"0x101\00ref_mv\0083886284\000", !421, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 204]
!725 = !MDLocation(line: 204, column: 70, scope: !421)
!726 = !{!"0x101\00error_per_bit\00100663501\000", !421, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 205]
!727 = !MDLocation(line: 205, column: 50, scope: !421)
!728 = !{!"0x101\00vfp\00117440718\000", !421, !69, !424} ; [ DW_TAG_arg_variable ] [vfp] [line 206]
!729 = !MDLocation(line: 206, column: 75, scope: !421)
!730 = !{!"0x101\00mvcost\00134217935\000", !421, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 207]
!731 = !MDLocation(line: 207, column: 51, scope: !421)
!732 = !{!"0x101\00distortion\00150995151\000", !421, !69, !89} ; [ DW_TAG_arg_variable ] [distortion] [line 207]
!733 = !MDLocation(line: 207, column: 67, scope: !421)
!734 = !{!"0x101\00sse1\00167772368\000", !421, !69, !319} ; [ DW_TAG_arg_variable ] [sse1] [line 208]
!735 = !MDLocation(line: 208, column: 60, scope: !421)
!736 = !{!"0x100\00z\00210\000", !421, !69, !60}  ; [ DW_TAG_auto_variable ] [z] [line 210]
!737 = !MDLocation(line: 210, column: 20, scope: !421)
!738 = !MDLocation(line: 210, column: 27, scope: !421)
!739 = !MDLocation(line: 210, column: 25, scope: !421)
!740 = !MDLocation(line: 210, column: 42, scope: !421)
!741 = !{!"0x100\00rr\00212\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [rr] [line 212]
!742 = !MDLocation(line: 212, column: 9, scope: !421)
!743 = !MDLocation(line: 212, column: 14, scope: !421)
!744 = !{!"0x100\00rc\00212\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [rc] [line 212]
!745 = !MDLocation(line: 212, column: 38, scope: !421)
!746 = !MDLocation(line: 212, column: 43, scope: !421)
!747 = !{!"0x100\00br\00213\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [br] [line 213]
!748 = !MDLocation(line: 213, column: 9, scope: !421)
!749 = !MDLocation(line: 213, column: 14, scope: !421)
!750 = !{!"0x100\00bc\00213\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [bc] [line 213]
!751 = !MDLocation(line: 213, column: 37, scope: !421)
!752 = !MDLocation(line: 213, column: 42, scope: !421)
!753 = !{!"0x100\00tr\00214\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [tr] [line 214]
!754 = !MDLocation(line: 214, column: 9, scope: !421)
!755 = !MDLocation(line: 214, column: 14, scope: !421)
!756 = !{!"0x100\00tc\00214\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [tc] [line 214]
!757 = !MDLocation(line: 214, column: 18, scope: !421)
!758 = !MDLocation(line: 214, column: 23, scope: !421)
!759 = !{!"0x100\00besterr\00215\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [besterr] [line 215]
!760 = !MDLocation(line: 215, column: 18, scope: !421)
!761 = !{!"0x100\00left\00216\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [left] [line 216]
!762 = !MDLocation(line: 216, column: 18, scope: !421)
!763 = !{!"0x100\00right\00216\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [right] [line 216]
!764 = !MDLocation(line: 216, column: 24, scope: !421)
!765 = !{!"0x100\00up\00216\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [up] [line 216]
!766 = !MDLocation(line: 216, column: 31, scope: !421)
!767 = !{!"0x100\00down\00216\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [down] [line 216]
!768 = !MDLocation(line: 216, column: 35, scope: !421)
!769 = !{!"0x100\00diag\00216\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [diag] [line 216]
!770 = !MDLocation(line: 216, column: 41, scope: !421)
!771 = !{!"0x100\00sse\00217\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [sse] [line 217]
!772 = !MDLocation(line: 217, column: 18, scope: !421)
!773 = !{!"0x100\00whichdir\00218\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [whichdir] [line 218]
!774 = !MDLocation(line: 218, column: 18, scope: !421)
!775 = !{!"0x100\00halfiters\00219\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [halfiters] [line 219]
!776 = !MDLocation(line: 219, column: 18, scope: !421)
!777 = !{!"0x100\00quarteriters\00220\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [quarteriters] [line 220]
!778 = !MDLocation(line: 220, column: 18, scope: !421)
!779 = !{!"0x100\00thismse\00221\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [thismse] [line 221]
!780 = !MDLocation(line: 221, column: 9, scope: !421)
!781 = !{!"0x100\00minc\00223\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [minc] [line 223]
!782 = !MDLocation(line: 223, column: 9, scope: !421)
!783 = !MDLocation(line: 223, column: 16, scope: !421)
!784 = !MDLocation(line: 223, column: 16, scope: !785)
!785 = !{!"0xb\001", !1, !421}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!786 = !MDLocation(line: 223, column: 16, scope: !787)
!787 = !{!"0xb\002", !1, !421}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!788 = !MDLocation(line: 223, column: 9, scope: !789)
!789 = !{!"0xb\004", !1, !790}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!790 = !{!"0xb\003", !1, !421}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!791 = !{!"0x100\00maxc\00225\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [maxc] [line 225]
!792 = !MDLocation(line: 225, column: 9, scope: !421)
!793 = !MDLocation(line: 225, column: 16, scope: !421)
!794 = !MDLocation(line: 225, column: 16, scope: !785)
!795 = !MDLocation(line: 225, column: 16, scope: !787)
!796 = !MDLocation(line: 225, column: 9, scope: !789)
!797 = !{!"0x100\00minr\00227\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [minr] [line 227]
!798 = !MDLocation(line: 227, column: 9, scope: !421)
!799 = !MDLocation(line: 227, column: 16, scope: !421)
!800 = !MDLocation(line: 227, column: 16, scope: !785)
!801 = !MDLocation(line: 227, column: 16, scope: !787)
!802 = !MDLocation(line: 227, column: 9, scope: !789)
!803 = !{!"0x100\00maxr\00229\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [maxr] [line 229]
!804 = !MDLocation(line: 229, column: 9, scope: !421)
!805 = !MDLocation(line: 229, column: 16, scope: !421)
!806 = !MDLocation(line: 229, column: 16, scope: !785)
!807 = !MDLocation(line: 229, column: 16, scope: !787)
!808 = !MDLocation(line: 229, column: 9, scope: !789)
!809 = !{!"0x100\00y_stride\00232\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [y_stride] [line 232]
!810 = !MDLocation(line: 232, column: 9, scope: !421)
!811 = !{!"0x100\00offset\00233\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [offset] [line 233]
!812 = !MDLocation(line: 233, column: 9, scope: !421)
!813 = !{!"0x100\00pre_stride\00234\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 234]
!814 = !MDLocation(line: 234, column: 9, scope: !421)
!815 = !MDLocation(line: 234, column: 22, scope: !421)
!816 = !{!"0x100\00base_pre\00235\000", !421, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 235]
!817 = !MDLocation(line: 235, column: 20, scope: !421)
!818 = !MDLocation(line: 235, column: 31, scope: !421)
!819 = !{!"0x100\00xd\00239\000", !421, !69, !820} ; [ DW_TAG_auto_variable ] [xd] [line 239]
!820 = !{!"0xf\00\000\0064\0064\000\000", null, null, !161} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from MACROBLOCKD]
!821 = !MDLocation(line: 239, column: 18, scope: !421)
!822 = !MDLocation(line: 239, column: 24, scope: !421)
!823 = !MDLocation(line: 239, column: 23, scope: !421)
!824 = !{!"0x100\00y_0\00240\000", !421, !69, !60} ; [ DW_TAG_auto_variable ] [y_0] [line 240]
!825 = !MDLocation(line: 240, column: 20, scope: !421)
!826 = !MDLocation(line: 240, column: 26, scope: !421)
!827 = !MDLocation(line: 240, column: 37, scope: !421)
!828 = !MDLocation(line: 240, column: 50, scope: !421)
!829 = !MDLocation(line: 240, column: 49, scope: !421)
!830 = !MDLocation(line: 240, column: 71, scope: !421)
!831 = !MDLocation(line: 240, column: 84, scope: !421)
!832 = !{!"0x100\00y\00241\000", !421, !69, !60}  ; [ DW_TAG_auto_variable ] [y] [line 241]
!833 = !MDLocation(line: 241, column: 20, scope: !421)
!834 = !{!"0x100\00buf_r1\00242\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [buf_r1] [line 242]
!835 = !MDLocation(line: 242, column: 9, scope: !421)
!836 = !{!"0x100\00buf_r2\00242\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [buf_r2] [line 242]
!837 = !MDLocation(line: 242, column: 17, scope: !421)
!838 = !{!"0x100\00buf_c1\00242\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [buf_c1] [line 242]
!839 = !MDLocation(line: 242, column: 25, scope: !421)
!840 = !MDLocation(line: 245, column: 16, scope: !421)
!841 = !MDLocation(line: 245, column: 41, scope: !421)
!842 = !MDLocation(line: 245, column: 15, scope: !421)
!843 = !MDLocation(line: 245, column: 14, scope: !421)
!844 = !MDLocation(line: 245, column: 57, scope: !785)
!845 = !MDLocation(line: 245, column: 77, scope: !421)
!846 = !MDLocation(line: 245, column: 57, scope: !421)
!847 = !MDLocation(line: 245, column: 14, scope: !787)
!848 = !MDLocation(line: 245, column: 5, scope: !789)
!849 = !MDLocation(line: 246, column: 16, scope: !421)
!850 = !MDLocation(line: 246, column: 41, scope: !421)
!851 = !MDLocation(line: 246, column: 15, scope: !421)
!852 = !MDLocation(line: 246, column: 14, scope: !421)
!853 = !MDLocation(line: 246, column: 57, scope: !785)
!854 = !MDLocation(line: 246, column: 73, scope: !421)
!855 = !MDLocation(line: 246, column: 57, scope: !421)
!856 = !MDLocation(line: 246, column: 14, scope: !787)
!857 = !MDLocation(line: 246, column: 5, scope: !789)
!858 = !MDLocation(line: 247, column: 16, scope: !421)
!859 = !MDLocation(line: 247, column: 41, scope: !421)
!860 = !MDLocation(line: 247, column: 15, scope: !421)
!861 = !MDLocation(line: 247, column: 14, scope: !421)
!862 = !MDLocation(line: 247, column: 57, scope: !785)
!863 = !MDLocation(line: 247, column: 77, scope: !421)
!864 = !MDLocation(line: 247, column: 57, scope: !421)
!865 = !MDLocation(line: 247, column: 14, scope: !787)
!866 = !MDLocation(line: 247, column: 5, scope: !789)
!867 = !MDLocation(line: 248, column: 5, scope: !421)
!868 = !MDLocation(line: 251, column: 5, scope: !421)
!869 = !MDLocation(line: 251, column: 18, scope: !421)
!870 = !MDLocation(line: 251, column: 24, scope: !421)
!871 = !MDLocation(line: 251, column: 33, scope: !421)
!872 = !MDLocation(line: 251, column: 44, scope: !421)
!873 = !MDLocation(line: 251, column: 52, scope: !421)
!874 = !MDLocation(line: 251, column: 64, scope: !421)
!875 = !MDLocation(line: 251, column: 75, scope: !421)
!876 = !MDLocation(line: 251, column: 88, scope: !421)
!877 = !MDLocation(line: 251, column: 85, scope: !421)
!878 = !MDLocation(line: 251, column: 95, scope: !421)
!879 = !MDLocation(line: 252, column: 9, scope: !421)
!880 = !MDLocation(line: 252, column: 21, scope: !421)
!881 = !MDLocation(line: 252, column: 30, scope: !421)
!882 = !MDLocation(line: 252, column: 38, scope: !421)
!883 = !MDLocation(line: 252, column: 5, scope: !421)
!884 = !MDLocation(line: 258, column: 15, scope: !421)
!885 = !MDLocation(line: 258, column: 14, scope: !421)
!886 = !MDLocation(line: 258, column: 36, scope: !421)
!887 = !MDLocation(line: 258, column: 47, scope: !421)
!888 = !MDLocation(line: 258, column: 5, scope: !421)
!889 = !MDLocation(line: 261, column: 5, scope: !421)
!890 = !MDLocation(line: 262, column: 5, scope: !421)
!891 = !MDLocation(line: 265, column: 15, scope: !421)
!892 = !MDLocation(line: 265, column: 23, scope: !421)
!893 = !MDLocation(line: 265, column: 26, scope: !421)
!894 = !MDLocation(line: 265, column: 36, scope: !421)
!895 = !MDLocation(line: 265, column: 39, scope: !421)
!896 = !MDLocation(line: 265, column: 54, scope: !421)
!897 = !MDLocation(line: 265, column: 5, scope: !421)
!898 = !MDLocation(line: 266, column: 19, scope: !421)
!899 = !MDLocation(line: 266, column: 6, scope: !421)
!900 = !MDLocation(line: 266, column: 5, scope: !421)
!901 = !MDLocation(line: 267, column: 28, scope: !421)
!902 = !MDLocation(line: 267, column: 36, scope: !421)
!903 = !MDLocation(line: 267, column: 44, scope: !421)
!904 = !MDLocation(line: 267, column: 52, scope: !421)
!905 = !MDLocation(line: 267, column: 16, scope: !421)
!906 = !MDLocation(line: 267, column: 5, scope: !421)
!907 = !MDLocation(line: 272, column: 5, scope: !421)
!908 = !MDLocation(line: 272, column: 12, scope: !909)
!909 = !{!"0xb\002", !1, !785}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!910 = !MDLocation(line: 275, column: 9, scope: !911)
!911 = !{!"0xb\00275\009\003", !1, !912}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!912 = !{!"0xb\00273\005\002", !1, !421}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!913 = !MDLocation(line: 275, column: 9, scope: !912)
!914 = !MDLocation(line: 275, column: 9, scope: !915)
!915 = !{!"0xb\001", !1, !911}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!916 = !MDLocation(line: 275, column: 9, scope: !917)
!917 = !{!"0xb\003", !1, !911}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!918 = !MDLocation(line: 275, column: 9, scope: !919)
!919 = !{!"0xb\005", !1, !911}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!920 = !MDLocation(line: 275, column: 9, scope: !921)
!921 = !{!"0xb\007", !1, !922}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!922 = !{!"0xb\00275\009\004", !1, !911}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!923 = !MDLocation(line: 275, column: 9, scope: !924)
!924 = !{!"0xb\00275\009\005", !1, !922}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!925 = !MDLocation(line: 275, column: 9, scope: !926)
!926 = !{!"0xb\009", !1, !924}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!927 = !MDLocation(line: 275, column: 9, scope: !928)
!928 = !{!"0xb\0010", !1, !924}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!929 = !MDLocation(line: 275, column: 9, scope: !930)
!930 = !{!"0xb\0012", !1, !931}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!931 = !{!"0xb\0011", !1, !924}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!932 = !MDLocation(line: 275, column: 9, scope: !922)
!933 = !MDLocation(line: 275, column: 9, scope: !934)
!934 = !{!"0xb\0013", !1, !935}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!935 = !{!"0xb\00275\009\006", !1, !924}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!936 = !MDLocation(line: 275, column: 9, scope: !937)
!937 = !{!"0xb\0015", !1, !938}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!938 = !{!"0xb\0014", !1, !922}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!939 = !MDLocation(line: 275, column: 9, scope: !940)
!940 = !{!"0xb\008", !1, !941}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!941 = !{!"0xb\006", !1, !942}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!942 = !{!"0xb\004", !1, !943}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!943 = !{!"0xb\002", !1, !911}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!944 = !MDLocation(line: 276, column: 9, scope: !945)
!945 = !{!"0xb\00276\009\007", !1, !912}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!946 = !MDLocation(line: 276, column: 9, scope: !912)
!947 = !MDLocation(line: 276, column: 9, scope: !948)
!948 = !{!"0xb\001", !1, !945}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!949 = !MDLocation(line: 276, column: 9, scope: !950)
!950 = !{!"0xb\003", !1, !945}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!951 = !MDLocation(line: 276, column: 9, scope: !952)
!952 = !{!"0xb\005", !1, !945}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!953 = !MDLocation(line: 276, column: 9, scope: !954)
!954 = !{!"0xb\007", !1, !955}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!955 = !{!"0xb\00276\009\008", !1, !945}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!956 = !MDLocation(line: 276, column: 9, scope: !957)
!957 = !{!"0xb\00276\009\009", !1, !955}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!958 = !MDLocation(line: 276, column: 9, scope: !959)
!959 = !{!"0xb\009", !1, !957}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!960 = !MDLocation(line: 276, column: 9, scope: !961)
!961 = !{!"0xb\0010", !1, !957}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!962 = !MDLocation(line: 276, column: 9, scope: !963)
!963 = !{!"0xb\0012", !1, !964}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!964 = !{!"0xb\0011", !1, !957}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!965 = !MDLocation(line: 276, column: 9, scope: !955)
!966 = !MDLocation(line: 276, column: 9, scope: !967)
!967 = !{!"0xb\0013", !1, !968}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!968 = !{!"0xb\00276\009\0010", !1, !957}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!969 = !MDLocation(line: 276, column: 9, scope: !970)
!970 = !{!"0xb\0015", !1, !971}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!971 = !{!"0xb\0014", !1, !955}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!972 = !MDLocation(line: 276, column: 9, scope: !973)
!973 = !{!"0xb\008", !1, !974}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!974 = !{!"0xb\006", !1, !975}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!975 = !{!"0xb\004", !1, !976}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!976 = !{!"0xb\002", !1, !945}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!977 = !MDLocation(line: 277, column: 9, scope: !978)
!978 = !{!"0xb\00277\009\0011", !1, !912}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!979 = !MDLocation(line: 277, column: 9, scope: !912)
!980 = !MDLocation(line: 277, column: 9, scope: !981)
!981 = !{!"0xb\001", !1, !978}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!982 = !MDLocation(line: 277, column: 9, scope: !983)
!983 = !{!"0xb\003", !1, !978}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!984 = !MDLocation(line: 277, column: 9, scope: !985)
!985 = !{!"0xb\005", !1, !978}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!986 = !MDLocation(line: 277, column: 9, scope: !987)
!987 = !{!"0xb\007", !1, !988}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!988 = !{!"0xb\00277\009\0012", !1, !978}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!989 = !MDLocation(line: 277, column: 9, scope: !990)
!990 = !{!"0xb\00277\009\0013", !1, !988}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!991 = !MDLocation(line: 277, column: 9, scope: !992)
!992 = !{!"0xb\009", !1, !990}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!993 = !MDLocation(line: 277, column: 9, scope: !994)
!994 = !{!"0xb\0010", !1, !990}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!995 = !MDLocation(line: 277, column: 9, scope: !996)
!996 = !{!"0xb\0012", !1, !997}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!997 = !{!"0xb\0011", !1, !990}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!998 = !MDLocation(line: 277, column: 9, scope: !988)
!999 = !MDLocation(line: 277, column: 9, scope: !1000)
!1000 = !{!"0xb\0013", !1, !1001}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1001 = !{!"0xb\00277\009\0014", !1, !990}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1002 = !MDLocation(line: 277, column: 9, scope: !1003)
!1003 = !{!"0xb\0015", !1, !1004}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1004 = !{!"0xb\0014", !1, !988}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1005 = !MDLocation(line: 277, column: 9, scope: !1006)
!1006 = !{!"0xb\008", !1, !1007}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1007 = !{!"0xb\006", !1, !1008}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1008 = !{!"0xb\004", !1, !1009}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1009 = !{!"0xb\002", !1, !978}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1010 = !MDLocation(line: 278, column: 9, scope: !1011)
!1011 = !{!"0xb\00278\009\0015", !1, !912}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1012 = !MDLocation(line: 278, column: 9, scope: !912)
!1013 = !MDLocation(line: 278, column: 9, scope: !1014)
!1014 = !{!"0xb\001", !1, !1011}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1015 = !MDLocation(line: 278, column: 9, scope: !1016)
!1016 = !{!"0xb\003", !1, !1011}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1017 = !MDLocation(line: 278, column: 9, scope: !1018)
!1018 = !{!"0xb\005", !1, !1011}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1019 = !MDLocation(line: 278, column: 9, scope: !1020)
!1020 = !{!"0xb\007", !1, !1021}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1021 = !{!"0xb\00278\009\0016", !1, !1011}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1022 = !MDLocation(line: 278, column: 9, scope: !1023)
!1023 = !{!"0xb\00278\009\0017", !1, !1021}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1024 = !MDLocation(line: 278, column: 9, scope: !1025)
!1025 = !{!"0xb\009", !1, !1023}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1026 = !MDLocation(line: 278, column: 9, scope: !1027)
!1027 = !{!"0xb\0010", !1, !1023}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1028 = !MDLocation(line: 278, column: 9, scope: !1029)
!1029 = !{!"0xb\0012", !1, !1030}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1030 = !{!"0xb\0011", !1, !1023}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1031 = !MDLocation(line: 278, column: 9, scope: !1021)
!1032 = !MDLocation(line: 278, column: 9, scope: !1033)
!1033 = !{!"0xb\0013", !1, !1034}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1034 = !{!"0xb\00278\009\0018", !1, !1023}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1035 = !MDLocation(line: 278, column: 9, scope: !1036)
!1036 = !{!"0xb\0015", !1, !1037}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1037 = !{!"0xb\0014", !1, !1021}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1038 = !MDLocation(line: 278, column: 9, scope: !1039)
!1039 = !{!"0xb\008", !1, !1040}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1040 = !{!"0xb\006", !1, !1041}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1041 = !{!"0xb\004", !1, !1042}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1042 = !{!"0xb\002", !1, !1011}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1043 = !MDLocation(line: 280, column: 21, scope: !912)
!1044 = !MDLocation(line: 280, column: 28, scope: !912)
!1045 = !MDLocation(line: 280, column: 46, scope: !912)
!1046 = !MDLocation(line: 280, column: 51, scope: !912)
!1047 = !MDLocation(line: 280, column: 20, scope: !912)
!1048 = !MDLocation(line: 280, column: 9, scope: !912)
!1049 = !MDLocation(line: 282, column: 17, scope: !912)
!1050 = !MDLocation(line: 282, column: 9, scope: !912)
!1051 = !MDLocation(line: 285, column: 13, scope: !1052)
!1052 = !{!"0xb\00285\0013\0020", !1, !1053}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1053 = !{!"0xb\00283\009\0019", !1, !912}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1054 = !MDLocation(line: 285, column: 13, scope: !1053)
!1055 = !MDLocation(line: 285, column: 13, scope: !1056)
!1056 = !{!"0xb\001", !1, !1052}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1057 = !MDLocation(line: 285, column: 13, scope: !1058)
!1058 = !{!"0xb\003", !1, !1052}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1059 = !MDLocation(line: 285, column: 13, scope: !1060)
!1060 = !{!"0xb\005", !1, !1052}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1061 = !MDLocation(line: 285, column: 13, scope: !1062)
!1062 = !{!"0xb\007", !1, !1063}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1063 = !{!"0xb\00285\0013\0021", !1, !1052}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1064 = !MDLocation(line: 285, column: 13, scope: !1065)
!1065 = !{!"0xb\00285\0013\0022", !1, !1063}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1066 = !MDLocation(line: 285, column: 13, scope: !1067)
!1067 = !{!"0xb\009", !1, !1065}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1068 = !MDLocation(line: 285, column: 13, scope: !1069)
!1069 = !{!"0xb\0010", !1, !1065}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1070 = !MDLocation(line: 285, column: 13, scope: !1071)
!1071 = !{!"0xb\0012", !1, !1072}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1072 = !{!"0xb\0011", !1, !1065}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1073 = !MDLocation(line: 285, column: 13, scope: !1063)
!1074 = !MDLocation(line: 285, column: 13, scope: !1075)
!1075 = !{!"0xb\0013", !1, !1076}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1076 = !{!"0xb\00285\0013\0023", !1, !1065}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1077 = !MDLocation(line: 285, column: 13, scope: !1078)
!1078 = !{!"0xb\0015", !1, !1079}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1079 = !{!"0xb\0014", !1, !1063}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1080 = !MDLocation(line: 285, column: 13, scope: !1081)
!1081 = !{!"0xb\008", !1, !1082}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1082 = !{!"0xb\006", !1, !1083}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1083 = !{!"0xb\004", !1, !1084}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1084 = !{!"0xb\002", !1, !1052}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1085 = !MDLocation(line: 286, column: 13, scope: !1053)
!1086 = !MDLocation(line: 288, column: 13, scope: !1087)
!1087 = !{!"0xb\00288\0013\0024", !1, !1053}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1088 = !MDLocation(line: 288, column: 13, scope: !1053)
!1089 = !MDLocation(line: 288, column: 13, scope: !1090)
!1090 = !{!"0xb\001", !1, !1087}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1091 = !MDLocation(line: 288, column: 13, scope: !1092)
!1092 = !{!"0xb\003", !1, !1087}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1093 = !MDLocation(line: 288, column: 13, scope: !1094)
!1094 = !{!"0xb\005", !1, !1087}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1095 = !MDLocation(line: 288, column: 13, scope: !1096)
!1096 = !{!"0xb\007", !1, !1097}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1097 = !{!"0xb\00288\0013\0025", !1, !1087}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1098 = !MDLocation(line: 288, column: 13, scope: !1099)
!1099 = !{!"0xb\00288\0013\0026", !1, !1097}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1100 = !MDLocation(line: 288, column: 13, scope: !1101)
!1101 = !{!"0xb\009", !1, !1099}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1102 = !MDLocation(line: 288, column: 13, scope: !1103)
!1103 = !{!"0xb\0010", !1, !1099}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1104 = !MDLocation(line: 288, column: 13, scope: !1105)
!1105 = !{!"0xb\0012", !1, !1106}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1106 = !{!"0xb\0011", !1, !1099}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1107 = !MDLocation(line: 288, column: 13, scope: !1097)
!1108 = !MDLocation(line: 288, column: 13, scope: !1109)
!1109 = !{!"0xb\0013", !1, !1110}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1110 = !{!"0xb\00288\0013\0027", !1, !1099}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1111 = !MDLocation(line: 288, column: 13, scope: !1112)
!1112 = !{!"0xb\0015", !1, !1113}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1113 = !{!"0xb\0014", !1, !1097}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1114 = !MDLocation(line: 288, column: 13, scope: !1115)
!1115 = !{!"0xb\008", !1, !1116}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1116 = !{!"0xb\006", !1, !1117}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1117 = !{!"0xb\004", !1, !1118}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1118 = !{!"0xb\002", !1, !1087}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1119 = !MDLocation(line: 289, column: 13, scope: !1053)
!1120 = !MDLocation(line: 291, column: 13, scope: !1121)
!1121 = !{!"0xb\00291\0013\0028", !1, !1053}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1122 = !MDLocation(line: 291, column: 13, scope: !1053)
!1123 = !MDLocation(line: 291, column: 13, scope: !1124)
!1124 = !{!"0xb\001", !1, !1121}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1125 = !MDLocation(line: 291, column: 13, scope: !1126)
!1126 = !{!"0xb\003", !1, !1121}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1127 = !MDLocation(line: 291, column: 13, scope: !1128)
!1128 = !{!"0xb\005", !1, !1121}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1129 = !MDLocation(line: 291, column: 13, scope: !1130)
!1130 = !{!"0xb\007", !1, !1131}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1131 = !{!"0xb\00291\0013\0029", !1, !1121}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1132 = !MDLocation(line: 291, column: 13, scope: !1133)
!1133 = !{!"0xb\00291\0013\0030", !1, !1131}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1134 = !MDLocation(line: 291, column: 13, scope: !1135)
!1135 = !{!"0xb\009", !1, !1133}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1136 = !MDLocation(line: 291, column: 13, scope: !1137)
!1137 = !{!"0xb\0010", !1, !1133}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1138 = !MDLocation(line: 291, column: 13, scope: !1139)
!1139 = !{!"0xb\0012", !1, !1140}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1140 = !{!"0xb\0011", !1, !1133}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1141 = !MDLocation(line: 291, column: 13, scope: !1131)
!1142 = !MDLocation(line: 291, column: 13, scope: !1143)
!1143 = !{!"0xb\0013", !1, !1144}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1144 = !{!"0xb\00291\0013\0031", !1, !1133}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1145 = !MDLocation(line: 291, column: 13, scope: !1146)
!1146 = !{!"0xb\0015", !1, !1147}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1147 = !{!"0xb\0014", !1, !1131}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1148 = !MDLocation(line: 291, column: 13, scope: !1149)
!1149 = !{!"0xb\008", !1, !1150}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1150 = !{!"0xb\006", !1, !1151}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1151 = !{!"0xb\004", !1, !1152}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1152 = !{!"0xb\002", !1, !1121}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1153 = !MDLocation(line: 292, column: 13, scope: !1053)
!1154 = !MDLocation(line: 294, column: 13, scope: !1155)
!1155 = !{!"0xb\00294\0013\0032", !1, !1053}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1156 = !MDLocation(line: 294, column: 13, scope: !1053)
!1157 = !MDLocation(line: 294, column: 13, scope: !1158)
!1158 = !{!"0xb\001", !1, !1155}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1159 = !MDLocation(line: 294, column: 13, scope: !1160)
!1160 = !{!"0xb\003", !1, !1155}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1161 = !MDLocation(line: 294, column: 13, scope: !1162)
!1162 = !{!"0xb\005", !1, !1155}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1163 = !MDLocation(line: 294, column: 13, scope: !1164)
!1164 = !{!"0xb\007", !1, !1165}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1165 = !{!"0xb\00294\0013\0033", !1, !1155}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1166 = !MDLocation(line: 294, column: 13, scope: !1167)
!1167 = !{!"0xb\00294\0013\0034", !1, !1165}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1168 = !MDLocation(line: 294, column: 13, scope: !1169)
!1169 = !{!"0xb\009", !1, !1167}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1170 = !MDLocation(line: 294, column: 13, scope: !1171)
!1171 = !{!"0xb\0010", !1, !1167}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1172 = !MDLocation(line: 294, column: 13, scope: !1173)
!1173 = !{!"0xb\0012", !1, !1174}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1174 = !{!"0xb\0011", !1, !1167}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1175 = !MDLocation(line: 294, column: 13, scope: !1165)
!1176 = !MDLocation(line: 294, column: 13, scope: !1177)
!1177 = !{!"0xb\0013", !1, !1178}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1178 = !{!"0xb\00294\0013\0035", !1, !1167}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1179 = !MDLocation(line: 294, column: 13, scope: !1180)
!1180 = !{!"0xb\0015", !1, !1181}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1181 = !{!"0xb\0014", !1, !1165}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1182 = !MDLocation(line: 294, column: 13, scope: !1183)
!1183 = !{!"0xb\008", !1, !1184}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1184 = !{!"0xb\006", !1, !1185}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1185 = !{!"0xb\004", !1, !1186}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1186 = !{!"0xb\002", !1, !1155}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1187 = !MDLocation(line: 295, column: 13, scope: !1053)
!1188 = !MDLocation(line: 299, column: 13, scope: !1189)
!1189 = !{!"0xb\00299\0013\0036", !1, !912}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1190 = !MDLocation(line: 299, column: 19, scope: !1189)
!1191 = !MDLocation(line: 299, column: 13, scope: !912)
!1192 = !MDLocation(line: 299, column: 25, scope: !1193)
!1193 = !{!"0xb\001", !1, !1189}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1194 = !MDLocation(line: 299, column: 31, scope: !1189)
!1195 = !MDLocation(line: 299, column: 25, scope: !1189)
!1196 = !MDLocation(line: 300, column: 13, scope: !1189)
!1197 = !MDLocation(line: 302, column: 14, scope: !912)
!1198 = !MDLocation(line: 302, column: 9, scope: !912)
!1199 = !MDLocation(line: 303, column: 14, scope: !912)
!1200 = !MDLocation(line: 303, column: 9, scope: !912)
!1201 = !MDLocation(line: 311, column: 5, scope: !421)
!1202 = !MDLocation(line: 311, column: 12, scope: !909)
!1203 = !MDLocation(line: 313, column: 9, scope: !1204)
!1204 = !{!"0xb\00313\009\0038", !1, !1205}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1205 = !{!"0xb\00312\005\0037", !1, !421}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1206 = !MDLocation(line: 313, column: 9, scope: !1205)
!1207 = !MDLocation(line: 313, column: 9, scope: !1208)
!1208 = !{!"0xb\001", !1, !1204}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1209 = !MDLocation(line: 313, column: 9, scope: !1210)
!1210 = !{!"0xb\003", !1, !1204}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1211 = !MDLocation(line: 313, column: 9, scope: !1212)
!1212 = !{!"0xb\005", !1, !1204}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1213 = !MDLocation(line: 313, column: 9, scope: !1214)
!1214 = !{!"0xb\007", !1, !1215}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1215 = !{!"0xb\00313\009\0039", !1, !1204}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1216 = !MDLocation(line: 313, column: 9, scope: !1217)
!1217 = !{!"0xb\00313\009\0040", !1, !1215}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1218 = !MDLocation(line: 313, column: 9, scope: !1219)
!1219 = !{!"0xb\009", !1, !1217}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1220 = !MDLocation(line: 313, column: 9, scope: !1221)
!1221 = !{!"0xb\0010", !1, !1217}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1222 = !MDLocation(line: 313, column: 9, scope: !1223)
!1223 = !{!"0xb\0012", !1, !1224}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1224 = !{!"0xb\0011", !1, !1217}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1225 = !MDLocation(line: 313, column: 9, scope: !1215)
!1226 = !MDLocation(line: 313, column: 9, scope: !1227)
!1227 = !{!"0xb\0013", !1, !1228}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1228 = !{!"0xb\00313\009\0041", !1, !1217}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1229 = !MDLocation(line: 313, column: 9, scope: !1230)
!1230 = !{!"0xb\0015", !1, !1231}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1231 = !{!"0xb\0014", !1, !1215}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1232 = !MDLocation(line: 313, column: 9, scope: !1233)
!1233 = !{!"0xb\008", !1, !1234}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1234 = !{!"0xb\006", !1, !1235}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1235 = !{!"0xb\004", !1, !1236}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1236 = !{!"0xb\002", !1, !1204}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1237 = !MDLocation(line: 314, column: 9, scope: !1238)
!1238 = !{!"0xb\00314\009\0042", !1, !1205}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1239 = !MDLocation(line: 314, column: 9, scope: !1205)
!1240 = !MDLocation(line: 314, column: 9, scope: !1241)
!1241 = !{!"0xb\001", !1, !1238}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1242 = !MDLocation(line: 314, column: 9, scope: !1243)
!1243 = !{!"0xb\003", !1, !1238}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1244 = !MDLocation(line: 314, column: 9, scope: !1245)
!1245 = !{!"0xb\005", !1, !1238}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1246 = !MDLocation(line: 314, column: 9, scope: !1247)
!1247 = !{!"0xb\007", !1, !1248}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1248 = !{!"0xb\00314\009\0043", !1, !1238}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1249 = !MDLocation(line: 314, column: 9, scope: !1250)
!1250 = !{!"0xb\00314\009\0044", !1, !1248}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1251 = !MDLocation(line: 314, column: 9, scope: !1252)
!1252 = !{!"0xb\009", !1, !1250}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1253 = !MDLocation(line: 314, column: 9, scope: !1254)
!1254 = !{!"0xb\0010", !1, !1250}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1255 = !MDLocation(line: 314, column: 9, scope: !1256)
!1256 = !{!"0xb\0012", !1, !1257}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1257 = !{!"0xb\0011", !1, !1250}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1258 = !MDLocation(line: 314, column: 9, scope: !1248)
!1259 = !MDLocation(line: 314, column: 9, scope: !1260)
!1260 = !{!"0xb\0013", !1, !1261}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1261 = !{!"0xb\00314\009\0045", !1, !1250}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1262 = !MDLocation(line: 314, column: 9, scope: !1263)
!1263 = !{!"0xb\0015", !1, !1264}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1264 = !{!"0xb\0014", !1, !1248}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1265 = !MDLocation(line: 314, column: 9, scope: !1266)
!1266 = !{!"0xb\008", !1, !1267}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1267 = !{!"0xb\006", !1, !1268}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1268 = !{!"0xb\004", !1, !1269}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1269 = !{!"0xb\002", !1, !1238}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1270 = !MDLocation(line: 315, column: 9, scope: !1271)
!1271 = !{!"0xb\00315\009\0046", !1, !1205}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1272 = !MDLocation(line: 315, column: 9, scope: !1205)
!1273 = !MDLocation(line: 315, column: 9, scope: !1274)
!1274 = !{!"0xb\001", !1, !1271}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1275 = !MDLocation(line: 315, column: 9, scope: !1276)
!1276 = !{!"0xb\003", !1, !1271}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1277 = !MDLocation(line: 315, column: 9, scope: !1278)
!1278 = !{!"0xb\005", !1, !1271}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1279 = !MDLocation(line: 315, column: 9, scope: !1280)
!1280 = !{!"0xb\007", !1, !1281}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1281 = !{!"0xb\00315\009\0047", !1, !1271}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1282 = !MDLocation(line: 315, column: 9, scope: !1283)
!1283 = !{!"0xb\00315\009\0048", !1, !1281}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1284 = !MDLocation(line: 315, column: 9, scope: !1285)
!1285 = !{!"0xb\009", !1, !1283}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1286 = !MDLocation(line: 315, column: 9, scope: !1287)
!1287 = !{!"0xb\0010", !1, !1283}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1288 = !MDLocation(line: 315, column: 9, scope: !1289)
!1289 = !{!"0xb\0012", !1, !1290}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1290 = !{!"0xb\0011", !1, !1283}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1291 = !MDLocation(line: 315, column: 9, scope: !1281)
!1292 = !MDLocation(line: 315, column: 9, scope: !1293)
!1293 = !{!"0xb\0013", !1, !1294}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1294 = !{!"0xb\00315\009\0049", !1, !1283}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1295 = !MDLocation(line: 315, column: 9, scope: !1296)
!1296 = !{!"0xb\0015", !1, !1297}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1297 = !{!"0xb\0014", !1, !1281}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1298 = !MDLocation(line: 315, column: 9, scope: !1299)
!1299 = !{!"0xb\008", !1, !1300}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1300 = !{!"0xb\006", !1, !1301}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1301 = !{!"0xb\004", !1, !1302}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1302 = !{!"0xb\002", !1, !1271}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1303 = !MDLocation(line: 316, column: 9, scope: !1304)
!1304 = !{!"0xb\00316\009\0050", !1, !1205}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1305 = !MDLocation(line: 316, column: 9, scope: !1205)
!1306 = !MDLocation(line: 316, column: 9, scope: !1307)
!1307 = !{!"0xb\001", !1, !1304}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1308 = !MDLocation(line: 316, column: 9, scope: !1309)
!1309 = !{!"0xb\003", !1, !1304}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1310 = !MDLocation(line: 316, column: 9, scope: !1311)
!1311 = !{!"0xb\005", !1, !1304}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1312 = !MDLocation(line: 316, column: 9, scope: !1313)
!1313 = !{!"0xb\007", !1, !1314}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1314 = !{!"0xb\00316\009\0051", !1, !1304}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1315 = !MDLocation(line: 316, column: 9, scope: !1316)
!1316 = !{!"0xb\00316\009\0052", !1, !1314}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1317 = !MDLocation(line: 316, column: 9, scope: !1318)
!1318 = !{!"0xb\009", !1, !1316}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1319 = !MDLocation(line: 316, column: 9, scope: !1320)
!1320 = !{!"0xb\0010", !1, !1316}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1321 = !MDLocation(line: 316, column: 9, scope: !1322)
!1322 = !{!"0xb\0012", !1, !1323}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1323 = !{!"0xb\0011", !1, !1316}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1324 = !MDLocation(line: 316, column: 9, scope: !1314)
!1325 = !MDLocation(line: 316, column: 9, scope: !1326)
!1326 = !{!"0xb\0013", !1, !1327}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1327 = !{!"0xb\00316\009\0053", !1, !1316}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1328 = !MDLocation(line: 316, column: 9, scope: !1329)
!1329 = !{!"0xb\0015", !1, !1330}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1330 = !{!"0xb\0014", !1, !1314}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1331 = !MDLocation(line: 316, column: 9, scope: !1332)
!1332 = !{!"0xb\008", !1, !1333}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1333 = !{!"0xb\006", !1, !1334}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1334 = !{!"0xb\004", !1, !1335}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1335 = !{!"0xb\002", !1, !1304}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1336 = !MDLocation(line: 318, column: 21, scope: !1205)
!1337 = !MDLocation(line: 318, column: 28, scope: !1205)
!1338 = !MDLocation(line: 318, column: 46, scope: !1205)
!1339 = !MDLocation(line: 318, column: 51, scope: !1205)
!1340 = !MDLocation(line: 318, column: 20, scope: !1205)
!1341 = !MDLocation(line: 318, column: 9, scope: !1205)
!1342 = !MDLocation(line: 320, column: 17, scope: !1205)
!1343 = !MDLocation(line: 320, column: 9, scope: !1205)
!1344 = !MDLocation(line: 323, column: 13, scope: !1345)
!1345 = !{!"0xb\00323\0013\0055", !1, !1346}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1346 = !{!"0xb\00321\009\0054", !1, !1205}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1347 = !MDLocation(line: 323, column: 13, scope: !1346)
!1348 = !MDLocation(line: 323, column: 13, scope: !1349)
!1349 = !{!"0xb\001", !1, !1345}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1350 = !MDLocation(line: 323, column: 13, scope: !1351)
!1351 = !{!"0xb\003", !1, !1345}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1352 = !MDLocation(line: 323, column: 13, scope: !1353)
!1353 = !{!"0xb\005", !1, !1345}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1354 = !MDLocation(line: 323, column: 13, scope: !1355)
!1355 = !{!"0xb\007", !1, !1356}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1356 = !{!"0xb\00323\0013\0056", !1, !1345}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1357 = !MDLocation(line: 323, column: 13, scope: !1358)
!1358 = !{!"0xb\00323\0013\0057", !1, !1356}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1359 = !MDLocation(line: 323, column: 13, scope: !1360)
!1360 = !{!"0xb\009", !1, !1358}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1361 = !MDLocation(line: 323, column: 13, scope: !1362)
!1362 = !{!"0xb\0010", !1, !1358}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1363 = !MDLocation(line: 323, column: 13, scope: !1364)
!1364 = !{!"0xb\0012", !1, !1365}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1365 = !{!"0xb\0011", !1, !1358}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1366 = !MDLocation(line: 323, column: 13, scope: !1356)
!1367 = !MDLocation(line: 323, column: 13, scope: !1368)
!1368 = !{!"0xb\0013", !1, !1369}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1369 = !{!"0xb\00323\0013\0058", !1, !1358}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1370 = !MDLocation(line: 323, column: 13, scope: !1371)
!1371 = !{!"0xb\0015", !1, !1372}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1372 = !{!"0xb\0014", !1, !1356}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1373 = !MDLocation(line: 323, column: 13, scope: !1374)
!1374 = !{!"0xb\008", !1, !1375}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1375 = !{!"0xb\006", !1, !1376}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1376 = !{!"0xb\004", !1, !1377}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1377 = !{!"0xb\002", !1, !1345}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1378 = !MDLocation(line: 324, column: 13, scope: !1346)
!1379 = !MDLocation(line: 326, column: 13, scope: !1380)
!1380 = !{!"0xb\00326\0013\0059", !1, !1346}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1381 = !MDLocation(line: 326, column: 13, scope: !1346)
!1382 = !MDLocation(line: 326, column: 13, scope: !1383)
!1383 = !{!"0xb\001", !1, !1380}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1384 = !MDLocation(line: 326, column: 13, scope: !1385)
!1385 = !{!"0xb\003", !1, !1380}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1386 = !MDLocation(line: 326, column: 13, scope: !1387)
!1387 = !{!"0xb\005", !1, !1380}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1388 = !MDLocation(line: 326, column: 13, scope: !1389)
!1389 = !{!"0xb\007", !1, !1390}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1390 = !{!"0xb\00326\0013\0060", !1, !1380}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1391 = !MDLocation(line: 326, column: 13, scope: !1392)
!1392 = !{!"0xb\00326\0013\0061", !1, !1390}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1393 = !MDLocation(line: 326, column: 13, scope: !1394)
!1394 = !{!"0xb\009", !1, !1392}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1395 = !MDLocation(line: 326, column: 13, scope: !1396)
!1396 = !{!"0xb\0010", !1, !1392}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1397 = !MDLocation(line: 326, column: 13, scope: !1398)
!1398 = !{!"0xb\0012", !1, !1399}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1399 = !{!"0xb\0011", !1, !1392}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1400 = !MDLocation(line: 326, column: 13, scope: !1390)
!1401 = !MDLocation(line: 326, column: 13, scope: !1402)
!1402 = !{!"0xb\0013", !1, !1403}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1403 = !{!"0xb\00326\0013\0062", !1, !1392}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1404 = !MDLocation(line: 326, column: 13, scope: !1405)
!1405 = !{!"0xb\0015", !1, !1406}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1406 = !{!"0xb\0014", !1, !1390}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1407 = !MDLocation(line: 326, column: 13, scope: !1408)
!1408 = !{!"0xb\008", !1, !1409}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1409 = !{!"0xb\006", !1, !1410}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1410 = !{!"0xb\004", !1, !1411}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1411 = !{!"0xb\002", !1, !1380}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1412 = !MDLocation(line: 327, column: 13, scope: !1346)
!1413 = !MDLocation(line: 329, column: 13, scope: !1414)
!1414 = !{!"0xb\00329\0013\0063", !1, !1346}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1415 = !MDLocation(line: 329, column: 13, scope: !1346)
!1416 = !MDLocation(line: 329, column: 13, scope: !1417)
!1417 = !{!"0xb\001", !1, !1414}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1418 = !MDLocation(line: 329, column: 13, scope: !1419)
!1419 = !{!"0xb\003", !1, !1414}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1420 = !MDLocation(line: 329, column: 13, scope: !1421)
!1421 = !{!"0xb\005", !1, !1414}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1422 = !MDLocation(line: 329, column: 13, scope: !1423)
!1423 = !{!"0xb\007", !1, !1424}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1424 = !{!"0xb\00329\0013\0064", !1, !1414}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1425 = !MDLocation(line: 329, column: 13, scope: !1426)
!1426 = !{!"0xb\00329\0013\0065", !1, !1424}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1427 = !MDLocation(line: 329, column: 13, scope: !1428)
!1428 = !{!"0xb\009", !1, !1426}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1429 = !MDLocation(line: 329, column: 13, scope: !1430)
!1430 = !{!"0xb\0010", !1, !1426}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1431 = !MDLocation(line: 329, column: 13, scope: !1432)
!1432 = !{!"0xb\0012", !1, !1433}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1433 = !{!"0xb\0011", !1, !1426}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1434 = !MDLocation(line: 329, column: 13, scope: !1424)
!1435 = !MDLocation(line: 329, column: 13, scope: !1436)
!1436 = !{!"0xb\0013", !1, !1437}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1437 = !{!"0xb\00329\0013\0066", !1, !1426}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1438 = !MDLocation(line: 329, column: 13, scope: !1439)
!1439 = !{!"0xb\0015", !1, !1440}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1440 = !{!"0xb\0014", !1, !1424}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1441 = !MDLocation(line: 329, column: 13, scope: !1442)
!1442 = !{!"0xb\008", !1, !1443}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1443 = !{!"0xb\006", !1, !1444}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1444 = !{!"0xb\004", !1, !1445}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1445 = !{!"0xb\002", !1, !1414}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1446 = !MDLocation(line: 330, column: 13, scope: !1346)
!1447 = !MDLocation(line: 332, column: 13, scope: !1448)
!1448 = !{!"0xb\00332\0013\0067", !1, !1346}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1449 = !MDLocation(line: 332, column: 13, scope: !1346)
!1450 = !MDLocation(line: 332, column: 13, scope: !1451)
!1451 = !{!"0xb\001", !1, !1448}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1452 = !MDLocation(line: 332, column: 13, scope: !1453)
!1453 = !{!"0xb\003", !1, !1448}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1454 = !MDLocation(line: 332, column: 13, scope: !1455)
!1455 = !{!"0xb\005", !1, !1448}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1456 = !MDLocation(line: 332, column: 13, scope: !1457)
!1457 = !{!"0xb\007", !1, !1458}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1458 = !{!"0xb\00332\0013\0068", !1, !1448}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1459 = !MDLocation(line: 332, column: 13, scope: !1460)
!1460 = !{!"0xb\00332\0013\0069", !1, !1458}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1461 = !MDLocation(line: 332, column: 13, scope: !1462)
!1462 = !{!"0xb\009", !1, !1460}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1463 = !MDLocation(line: 332, column: 13, scope: !1464)
!1464 = !{!"0xb\0010", !1, !1460}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1465 = !MDLocation(line: 332, column: 13, scope: !1466)
!1466 = !{!"0xb\0012", !1, !1467}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1467 = !{!"0xb\0011", !1, !1460}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1468 = !MDLocation(line: 332, column: 13, scope: !1458)
!1469 = !MDLocation(line: 332, column: 13, scope: !1470)
!1470 = !{!"0xb\0013", !1, !1471}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1471 = !{!"0xb\00332\0013\0070", !1, !1460}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1472 = !MDLocation(line: 332, column: 13, scope: !1473)
!1473 = !{!"0xb\0015", !1, !1474}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1474 = !{!"0xb\0014", !1, !1458}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1475 = !MDLocation(line: 332, column: 13, scope: !1476)
!1476 = !{!"0xb\008", !1, !1477}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1477 = !{!"0xb\006", !1, !1478}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1478 = !{!"0xb\004", !1, !1479}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1479 = !{!"0xb\002", !1, !1448}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1480 = !MDLocation(line: 333, column: 13, scope: !1346)
!1481 = !MDLocation(line: 337, column: 13, scope: !1482)
!1482 = !{!"0xb\00337\0013\0071", !1, !1205}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1483 = !MDLocation(line: 337, column: 19, scope: !1482)
!1484 = !MDLocation(line: 337, column: 13, scope: !1205)
!1485 = !MDLocation(line: 337, column: 25, scope: !1486)
!1486 = !{!"0xb\001", !1, !1482}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1487 = !MDLocation(line: 337, column: 31, scope: !1482)
!1488 = !MDLocation(line: 337, column: 25, scope: !1482)
!1489 = !MDLocation(line: 338, column: 13, scope: !1482)
!1490 = !MDLocation(line: 340, column: 14, scope: !1205)
!1491 = !MDLocation(line: 340, column: 9, scope: !1205)
!1492 = !MDLocation(line: 341, column: 14, scope: !1205)
!1493 = !MDLocation(line: 341, column: 9, scope: !1205)
!1494 = !MDLocation(line: 344, column: 25, scope: !421)
!1495 = !MDLocation(line: 344, column: 5, scope: !421)
!1496 = !MDLocation(line: 345, column: 25, scope: !421)
!1497 = !MDLocation(line: 345, column: 5, scope: !421)
!1498 = !MDLocation(line: 347, column: 14, scope: !1499)
!1499 = !{!"0xb\00347\009\0072", !1, !421}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1500 = !MDLocation(line: 347, column: 34, scope: !1499)
!1501 = !MDLocation(line: 347, column: 10, scope: !1499)
!1502 = !MDLocation(line: 347, column: 9, scope: !421)
!1503 = !MDLocation(line: 348, column: 14, scope: !1499)
!1504 = !MDLocation(line: 348, column: 34, scope: !1499)
!1505 = !MDLocation(line: 348, column: 10, scope: !1499)
!1506 = !MDLocation(line: 349, column: 9, scope: !1499)
!1507 = !MDLocation(line: 351, column: 12, scope: !421)
!1508 = !MDLocation(line: 351, column: 5, scope: !421)
!1509 = !MDLocation(line: 352, column: 1, scope: !421)
!1510 = !{!"0x101\00mv\0016777254\000", !495, !69, !73} ; [ DW_TAG_arg_variable ] [mv] [line 38]
!1511 = !MDLocation(line: 38, column: 32, scope: !495)
!1512 = !{!"0x101\00ref\0033554470\000", !495, !69, !73} ; [ DW_TAG_arg_variable ] [ref] [line 38]
!1513 = !MDLocation(line: 38, column: 44, scope: !495)
!1514 = !{!"0x101\00mvcost\0050331686\000", !495, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 38]
!1515 = !MDLocation(line: 38, column: 54, scope: !495)
!1516 = !{!"0x101\00error_per_bit\0067108902\000", !495, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 38]
!1517 = !MDLocation(line: 38, column: 69, scope: !495)
!1518 = !MDLocation(line: 41, column: 9, scope: !1519)
!1519 = !{!"0xb\0041\009\00362", !1, !495}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1520 = !MDLocation(line: 41, column: 9, scope: !495)
!1521 = !MDLocation(line: 42, column: 29, scope: !1519)
!1522 = !MDLocation(line: 42, column: 45, scope: !1519)
!1523 = !MDLocation(line: 42, column: 28, scope: !1519)
!1524 = !MDLocation(line: 42, column: 18, scope: !1519)
!1525 = !MDLocation(line: 43, column: 29, scope: !1519)
!1526 = !MDLocation(line: 43, column: 45, scope: !1519)
!1527 = !MDLocation(line: 43, column: 28, scope: !1519)
!1528 = !MDLocation(line: 43, column: 18, scope: !1519)
!1529 = !MDLocation(line: 44, column: 20, scope: !1519)
!1530 = !MDLocation(line: 42, column: 17, scope: !1519)
!1531 = !MDLocation(line: 42, column: 16, scope: !1519)
!1532 = !MDLocation(line: 42, column: 9, scope: !1519)
!1533 = !MDLocation(line: 45, column: 5, scope: !495)
!1534 = !MDLocation(line: 46, column: 1, scope: !495)
!1535 = !{!"0x101\00x\0016777577\000", !472, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 361]
!1536 = !MDLocation(line: 361, column: 46, scope: !472)
!1537 = !{!"0x101\00b\0033554793\000", !472, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 361]
!1538 = !MDLocation(line: 361, column: 56, scope: !472)
!1539 = !{!"0x101\00d\0050332009\000", !472, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 361]
!1540 = !MDLocation(line: 361, column: 67, scope: !472)
!1541 = !{!"0x101\00bestmv\0067109226\000", !472, !69, !73} ; [ DW_TAG_arg_variable ] [bestmv] [line 362]
!1542 = !MDLocation(line: 362, column: 42, scope: !472)
!1543 = !{!"0x101\00ref_mv\0083886442\000", !472, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 362]
!1544 = !MDLocation(line: 362, column: 58, scope: !472)
!1545 = !{!"0x101\00error_per_bit\00100663659\000", !472, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 363]
!1546 = !MDLocation(line: 363, column: 38, scope: !472)
!1547 = !{!"0x101\00vfp\00117440876\000", !472, !69, !424} ; [ DW_TAG_arg_variable ] [vfp] [line 364]
!1548 = !MDLocation(line: 364, column: 63, scope: !472)
!1549 = !{!"0x101\00mvcost\00134218093\000", !472, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 365]
!1550 = !MDLocation(line: 365, column: 39, scope: !472)
!1551 = !{!"0x101\00distortion\00150995309\000", !472, !69, !89} ; [ DW_TAG_arg_variable ] [distortion] [line 365]
!1552 = !MDLocation(line: 365, column: 55, scope: !472)
!1553 = !{!"0x101\00sse1\00167772526\000", !472, !69, !319} ; [ DW_TAG_arg_variable ] [sse1] [line 366]
!1554 = !MDLocation(line: 366, column: 48, scope: !472)
!1555 = !{!"0x100\00bestmse\00368\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [bestmse] [line 368]
!1556 = !MDLocation(line: 368, column: 9, scope: !472)
!1557 = !{!"0x100\00startmv\00369\000", !472, !69, !74} ; [ DW_TAG_auto_variable ] [startmv] [line 369]
!1558 = !MDLocation(line: 369, column: 12, scope: !472)
!1559 = !{!"0x100\00this_mv\00370\000", !472, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 370]
!1560 = !MDLocation(line: 370, column: 12, scope: !472)
!1561 = !{!"0x100\00z\00371\000", !472, !69, !60} ; [ DW_TAG_auto_variable ] [z] [line 371]
!1562 = !MDLocation(line: 371, column: 20, scope: !472)
!1563 = !MDLocation(line: 371, column: 27, scope: !472)
!1564 = !MDLocation(line: 371, column: 25, scope: !472)
!1565 = !MDLocation(line: 371, column: 42, scope: !472)
!1566 = !{!"0x100\00left\00372\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [left] [line 372]
!1567 = !MDLocation(line: 372, column: 9, scope: !472)
!1568 = !{!"0x100\00right\00372\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [right] [line 372]
!1569 = !MDLocation(line: 372, column: 15, scope: !472)
!1570 = !{!"0x100\00up\00372\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [up] [line 372]
!1571 = !MDLocation(line: 372, column: 22, scope: !472)
!1572 = !{!"0x100\00down\00372\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [down] [line 372]
!1573 = !MDLocation(line: 372, column: 26, scope: !472)
!1574 = !{!"0x100\00diag\00372\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [diag] [line 372]
!1575 = !MDLocation(line: 372, column: 32, scope: !472)
!1576 = !{!"0x100\00sse\00373\000", !472, !69, !80} ; [ DW_TAG_auto_variable ] [sse] [line 373]
!1577 = !MDLocation(line: 373, column: 18, scope: !472)
!1578 = !{!"0x100\00whichdir\00374\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [whichdir] [line 374]
!1579 = !MDLocation(line: 374, column: 9, scope: !472)
!1580 = !{!"0x100\00thismse\00375\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [thismse] [line 375]
!1581 = !MDLocation(line: 375, column: 9, scope: !472)
!1582 = !{!"0x100\00y_stride\00376\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [y_stride] [line 376]
!1583 = !MDLocation(line: 376, column: 9, scope: !472)
!1584 = !{!"0x100\00pre_stride\00377\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 377]
!1585 = !MDLocation(line: 377, column: 9, scope: !472)
!1586 = !MDLocation(line: 377, column: 22, scope: !472)
!1587 = !{!"0x100\00base_pre\00378\000", !472, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 378]
!1588 = !MDLocation(line: 378, column: 20, scope: !472)
!1589 = !MDLocation(line: 378, column: 31, scope: !472)
!1590 = !{!"0x100\00xd\00381\000", !472, !69, !820} ; [ DW_TAG_auto_variable ] [xd] [line 381]
!1591 = !MDLocation(line: 381, column: 18, scope: !472)
!1592 = !MDLocation(line: 381, column: 24, scope: !472)
!1593 = !MDLocation(line: 381, column: 23, scope: !472)
!1594 = !{!"0x100\00y_0\00382\000", !472, !69, !60} ; [ DW_TAG_auto_variable ] [y_0] [line 382]
!1595 = !MDLocation(line: 382, column: 20, scope: !472)
!1596 = !MDLocation(line: 382, column: 26, scope: !472)
!1597 = !MDLocation(line: 382, column: 37, scope: !472)
!1598 = !MDLocation(line: 382, column: 50, scope: !472)
!1599 = !MDLocation(line: 382, column: 49, scope: !472)
!1600 = !MDLocation(line: 382, column: 71, scope: !472)
!1601 = !MDLocation(line: 382, column: 84, scope: !472)
!1602 = !{!"0x100\00y\00383\000", !472, !69, !60} ; [ DW_TAG_auto_variable ] [y] [line 383]
!1603 = !MDLocation(line: 383, column: 20, scope: !472)
!1604 = !MDLocation(line: 385, column: 5, scope: !472)
!1605 = !MDLocation(line: 387, column: 6, scope: !472)
!1606 = !MDLocation(line: 387, column: 19, scope: !472)
!1607 = !MDLocation(line: 387, column: 29, scope: !472)
!1608 = !MDLocation(line: 387, column: 41, scope: !472)
!1609 = !MDLocation(line: 387, column: 53, scope: !472)
!1610 = !MDLocation(line: 387, column: 64, scope: !472)
!1611 = !MDLocation(line: 388, column: 10, scope: !472)
!1612 = !MDLocation(line: 388, column: 22, scope: !472)
!1613 = !MDLocation(line: 388, column: 6, scope: !472)
!1614 = !MDLocation(line: 395, column: 5, scope: !472)
!1615 = !MDLocation(line: 396, column: 5, scope: !472)
!1616 = !MDLocation(line: 397, column: 16, scope: !472)
!1617 = !MDLocation(line: 397, column: 5, scope: !472)
!1618 = !MDLocation(line: 400, column: 15, scope: !472)
!1619 = !MDLocation(line: 400, column: 23, scope: !472)
!1620 = !MDLocation(line: 400, column: 26, scope: !472)
!1621 = !MDLocation(line: 400, column: 36, scope: !472)
!1622 = !MDLocation(line: 400, column: 39, scope: !472)
!1623 = !MDLocation(line: 400, column: 54, scope: !472)
!1624 = !MDLocation(line: 400, column: 5, scope: !472)
!1625 = !MDLocation(line: 401, column: 19, scope: !472)
!1626 = !MDLocation(line: 401, column: 6, scope: !472)
!1627 = !MDLocation(line: 401, column: 5, scope: !472)
!1628 = !MDLocation(line: 402, column: 28, scope: !472)
!1629 = !MDLocation(line: 402, column: 36, scope: !472)
!1630 = !MDLocation(line: 402, column: 44, scope: !472)
!1631 = !MDLocation(line: 402, column: 52, scope: !472)
!1632 = !MDLocation(line: 402, column: 16, scope: !472)
!1633 = !MDLocation(line: 402, column: 5, scope: !472)
!1634 = !MDLocation(line: 405, column: 25, scope: !472)
!1635 = !MDLocation(line: 405, column: 5, scope: !472)
!1636 = !MDLocation(line: 406, column: 27, scope: !472)
!1637 = !MDLocation(line: 406, column: 26, scope: !472)
!1638 = !MDLocation(line: 406, column: 25, scope: !472)
!1639 = !MDLocation(line: 406, column: 5, scope: !472)
!1640 = !MDLocation(line: 407, column: 15, scope: !472)
!1641 = !MDLocation(line: 407, column: 34, scope: !472)
!1642 = !MDLocation(line: 407, column: 41, scope: !472)
!1643 = !MDLocation(line: 407, column: 51, scope: !472)
!1644 = !MDLocation(line: 407, column: 54, scope: !472)
!1645 = !MDLocation(line: 407, column: 5, scope: !472)
!1646 = !MDLocation(line: 408, column: 12, scope: !472)
!1647 = !MDLocation(line: 408, column: 44, scope: !472)
!1648 = !MDLocation(line: 408, column: 52, scope: !472)
!1649 = !MDLocation(line: 408, column: 60, scope: !472)
!1650 = !MDLocation(line: 408, column: 22, scope: !472)
!1651 = !MDLocation(line: 408, column: 5, scope: !472)
!1652 = !MDLocation(line: 410, column: 9, scope: !1653)
!1653 = !{!"0xb\00410\009\0073", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1654 = !MDLocation(line: 410, column: 16, scope: !1653)
!1655 = !MDLocation(line: 410, column: 9, scope: !472)
!1656 = !MDLocation(line: 412, column: 10, scope: !1657)
!1657 = !{!"0xb\00411\005\0074", !1, !1653}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1658 = !MDLocation(line: 412, column: 9, scope: !1657)
!1659 = !MDLocation(line: 413, column: 19, scope: !1657)
!1660 = !MDLocation(line: 413, column: 9, scope: !1657)
!1661 = !MDLocation(line: 414, column: 23, scope: !1657)
!1662 = !MDLocation(line: 414, column: 10, scope: !1657)
!1663 = !MDLocation(line: 414, column: 9, scope: !1657)
!1664 = !MDLocation(line: 415, column: 17, scope: !1657)
!1665 = !MDLocation(line: 415, column: 10, scope: !1657)
!1666 = !MDLocation(line: 415, column: 9, scope: !1657)
!1667 = !MDLocation(line: 416, column: 5, scope: !1657)
!1668 = !MDLocation(line: 418, column: 5, scope: !472)
!1669 = !MDLocation(line: 419, column: 15, scope: !472)
!1670 = !MDLocation(line: 419, column: 34, scope: !472)
!1671 = !MDLocation(line: 419, column: 37, scope: !472)
!1672 = !MDLocation(line: 419, column: 47, scope: !472)
!1673 = !MDLocation(line: 419, column: 50, scope: !472)
!1674 = !MDLocation(line: 419, column: 5, scope: !472)
!1675 = !MDLocation(line: 420, column: 13, scope: !472)
!1676 = !MDLocation(line: 420, column: 45, scope: !472)
!1677 = !MDLocation(line: 420, column: 53, scope: !472)
!1678 = !MDLocation(line: 420, column: 61, scope: !472)
!1679 = !MDLocation(line: 420, column: 23, scope: !472)
!1680 = !MDLocation(line: 420, column: 5, scope: !472)
!1681 = !MDLocation(line: 422, column: 9, scope: !1682)
!1682 = !{!"0xb\00422\009\0075", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1683 = !MDLocation(line: 422, column: 17, scope: !1682)
!1684 = !MDLocation(line: 422, column: 9, scope: !472)
!1685 = !MDLocation(line: 424, column: 10, scope: !1686)
!1686 = !{!"0xb\00423\005\0076", !1, !1682}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1687 = !MDLocation(line: 424, column: 9, scope: !1686)
!1688 = !MDLocation(line: 425, column: 19, scope: !1686)
!1689 = !MDLocation(line: 425, column: 9, scope: !1686)
!1690 = !MDLocation(line: 426, column: 23, scope: !1686)
!1691 = !MDLocation(line: 426, column: 10, scope: !1686)
!1692 = !MDLocation(line: 426, column: 9, scope: !1686)
!1693 = !MDLocation(line: 427, column: 17, scope: !1686)
!1694 = !MDLocation(line: 427, column: 10, scope: !1686)
!1695 = !MDLocation(line: 427, column: 9, scope: !1686)
!1696 = !MDLocation(line: 428, column: 5, scope: !1686)
!1697 = !MDLocation(line: 431, column: 25, scope: !472)
!1698 = !MDLocation(line: 431, column: 5, scope: !472)
!1699 = !MDLocation(line: 432, column: 27, scope: !472)
!1700 = !MDLocation(line: 432, column: 26, scope: !472)
!1701 = !MDLocation(line: 432, column: 25, scope: !472)
!1702 = !MDLocation(line: 432, column: 5, scope: !472)
!1703 = !MDLocation(line: 433, column: 16, scope: !472)
!1704 = !MDLocation(line: 433, column: 35, scope: !472)
!1705 = !MDLocation(line: 433, column: 39, scope: !472)
!1706 = !MDLocation(line: 433, column: 49, scope: !472)
!1707 = !MDLocation(line: 433, column: 59, scope: !472)
!1708 = !MDLocation(line: 433, column: 62, scope: !472)
!1709 = !MDLocation(line: 433, column: 5, scope: !472)
!1710 = !MDLocation(line: 434, column: 10, scope: !472)
!1711 = !MDLocation(line: 434, column: 42, scope: !472)
!1712 = !MDLocation(line: 434, column: 50, scope: !472)
!1713 = !MDLocation(line: 434, column: 58, scope: !472)
!1714 = !MDLocation(line: 434, column: 20, scope: !472)
!1715 = !MDLocation(line: 434, column: 5, scope: !472)
!1716 = !MDLocation(line: 436, column: 9, scope: !1717)
!1717 = !{!"0xb\00436\009\0077", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1718 = !MDLocation(line: 436, column: 14, scope: !1717)
!1719 = !MDLocation(line: 436, column: 9, scope: !472)
!1720 = !MDLocation(line: 438, column: 10, scope: !1721)
!1721 = !{!"0xb\00437\005\0078", !1, !1717}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1722 = !MDLocation(line: 438, column: 9, scope: !1721)
!1723 = !MDLocation(line: 439, column: 19, scope: !1721)
!1724 = !MDLocation(line: 439, column: 9, scope: !1721)
!1725 = !MDLocation(line: 440, column: 23, scope: !1721)
!1726 = !MDLocation(line: 440, column: 10, scope: !1721)
!1727 = !MDLocation(line: 440, column: 9, scope: !1721)
!1728 = !MDLocation(line: 441, column: 17, scope: !1721)
!1729 = !MDLocation(line: 441, column: 10, scope: !1721)
!1730 = !MDLocation(line: 441, column: 9, scope: !1721)
!1731 = !MDLocation(line: 442, column: 5, scope: !1721)
!1732 = !MDLocation(line: 444, column: 5, scope: !472)
!1733 = !MDLocation(line: 445, column: 15, scope: !472)
!1734 = !MDLocation(line: 445, column: 34, scope: !472)
!1735 = !MDLocation(line: 445, column: 37, scope: !472)
!1736 = !MDLocation(line: 445, column: 47, scope: !472)
!1737 = !MDLocation(line: 445, column: 50, scope: !472)
!1738 = !MDLocation(line: 445, column: 5, scope: !472)
!1739 = !MDLocation(line: 446, column: 12, scope: !472)
!1740 = !MDLocation(line: 446, column: 44, scope: !472)
!1741 = !MDLocation(line: 446, column: 52, scope: !472)
!1742 = !MDLocation(line: 446, column: 60, scope: !472)
!1743 = !MDLocation(line: 446, column: 22, scope: !472)
!1744 = !MDLocation(line: 446, column: 5, scope: !472)
!1745 = !MDLocation(line: 448, column: 9, scope: !1746)
!1746 = !{!"0xb\00448\009\0079", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1747 = !MDLocation(line: 448, column: 16, scope: !1746)
!1748 = !MDLocation(line: 448, column: 9, scope: !472)
!1749 = !MDLocation(line: 450, column: 10, scope: !1750)
!1750 = !{!"0xb\00449\005\0080", !1, !1746}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1751 = !MDLocation(line: 450, column: 9, scope: !1750)
!1752 = !MDLocation(line: 451, column: 19, scope: !1750)
!1753 = !MDLocation(line: 451, column: 9, scope: !1750)
!1754 = !MDLocation(line: 452, column: 23, scope: !1750)
!1755 = !MDLocation(line: 452, column: 10, scope: !1750)
!1756 = !MDLocation(line: 452, column: 9, scope: !1750)
!1757 = !MDLocation(line: 453, column: 17, scope: !1750)
!1758 = !MDLocation(line: 453, column: 10, scope: !1750)
!1759 = !MDLocation(line: 453, column: 9, scope: !1750)
!1760 = !MDLocation(line: 454, column: 5, scope: !1750)
!1761 = !MDLocation(line: 458, column: 17, scope: !472)
!1762 = !MDLocation(line: 458, column: 24, scope: !472)
!1763 = !MDLocation(line: 458, column: 42, scope: !472)
!1764 = !MDLocation(line: 458, column: 47, scope: !472)
!1765 = !MDLocation(line: 458, column: 16, scope: !472)
!1766 = !MDLocation(line: 458, column: 5, scope: !472)
!1767 = !MDLocation(line: 459, column: 5, scope: !472)
!1768 = !MDLocation(line: 461, column: 13, scope: !472)
!1769 = !MDLocation(line: 461, column: 5, scope: !472)
!1770 = !MDLocation(line: 464, column: 30, scope: !1771)
!1771 = !{!"0xb\00462\005\0081", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1772 = !MDLocation(line: 464, column: 29, scope: !1771)
!1773 = !MDLocation(line: 464, column: 9, scope: !1771)
!1774 = !MDLocation(line: 465, column: 30, scope: !1771)
!1775 = !MDLocation(line: 465, column: 29, scope: !1771)
!1776 = !MDLocation(line: 465, column: 9, scope: !1771)
!1777 = !MDLocation(line: 466, column: 19, scope: !1771)
!1778 = !MDLocation(line: 466, column: 39, scope: !1771)
!1779 = !MDLocation(line: 466, column: 47, scope: !1771)
!1780 = !MDLocation(line: 466, column: 57, scope: !1771)
!1781 = !MDLocation(line: 466, column: 67, scope: !1771)
!1782 = !MDLocation(line: 466, column: 70, scope: !1771)
!1783 = !MDLocation(line: 466, column: 9, scope: !1771)
!1784 = !MDLocation(line: 467, column: 9, scope: !1771)
!1785 = !MDLocation(line: 469, column: 9, scope: !1771)
!1786 = !MDLocation(line: 470, column: 30, scope: !1771)
!1787 = !MDLocation(line: 470, column: 29, scope: !1771)
!1788 = !MDLocation(line: 470, column: 9, scope: !1771)
!1789 = !MDLocation(line: 471, column: 19, scope: !1771)
!1790 = !MDLocation(line: 471, column: 39, scope: !1771)
!1791 = !MDLocation(line: 471, column: 43, scope: !1771)
!1792 = !MDLocation(line: 471, column: 53, scope: !1771)
!1793 = !MDLocation(line: 471, column: 63, scope: !1771)
!1794 = !MDLocation(line: 471, column: 66, scope: !1771)
!1795 = !MDLocation(line: 471, column: 9, scope: !1771)
!1796 = !MDLocation(line: 472, column: 9, scope: !1771)
!1797 = !MDLocation(line: 474, column: 30, scope: !1771)
!1798 = !MDLocation(line: 474, column: 29, scope: !1771)
!1799 = !MDLocation(line: 474, column: 9, scope: !1771)
!1800 = !MDLocation(line: 475, column: 9, scope: !1771)
!1801 = !MDLocation(line: 476, column: 19, scope: !1771)
!1802 = !MDLocation(line: 476, column: 39, scope: !1771)
!1803 = !MDLocation(line: 476, column: 46, scope: !1771)
!1804 = !MDLocation(line: 476, column: 56, scope: !1771)
!1805 = !MDLocation(line: 476, column: 59, scope: !1771)
!1806 = !MDLocation(line: 476, column: 9, scope: !1771)
!1807 = !MDLocation(line: 477, column: 9, scope: !1771)
!1808 = !MDLocation(line: 480, column: 9, scope: !1771)
!1809 = !MDLocation(line: 481, column: 9, scope: !1771)
!1810 = !MDLocation(line: 482, column: 19, scope: !1771)
!1811 = !MDLocation(line: 482, column: 39, scope: !1771)
!1812 = !MDLocation(line: 482, column: 42, scope: !1771)
!1813 = !MDLocation(line: 482, column: 52, scope: !1771)
!1814 = !MDLocation(line: 482, column: 55, scope: !1771)
!1815 = !MDLocation(line: 482, column: 9, scope: !1771)
!1816 = !MDLocation(line: 483, column: 9, scope: !1771)
!1817 = !MDLocation(line: 486, column: 12, scope: !472)
!1818 = !MDLocation(line: 486, column: 44, scope: !472)
!1819 = !MDLocation(line: 486, column: 52, scope: !472)
!1820 = !MDLocation(line: 486, column: 60, scope: !472)
!1821 = !MDLocation(line: 486, column: 22, scope: !472)
!1822 = !MDLocation(line: 486, column: 5, scope: !472)
!1823 = !MDLocation(line: 488, column: 9, scope: !1824)
!1824 = !{!"0xb\00488\009\0082", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1825 = !MDLocation(line: 488, column: 16, scope: !1824)
!1826 = !MDLocation(line: 488, column: 9, scope: !472)
!1827 = !MDLocation(line: 490, column: 10, scope: !1828)
!1828 = !{!"0xb\00489\005\0083", !1, !1824}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1829 = !MDLocation(line: 490, column: 9, scope: !1828)
!1830 = !MDLocation(line: 491, column: 19, scope: !1828)
!1831 = !MDLocation(line: 491, column: 9, scope: !1828)
!1832 = !MDLocation(line: 492, column: 23, scope: !1828)
!1833 = !MDLocation(line: 492, column: 10, scope: !1828)
!1834 = !MDLocation(line: 492, column: 9, scope: !1828)
!1835 = !MDLocation(line: 493, column: 17, scope: !1828)
!1836 = !MDLocation(line: 493, column: 10, scope: !1828)
!1837 = !MDLocation(line: 493, column: 9, scope: !1828)
!1838 = !MDLocation(line: 494, column: 5, scope: !1828)
!1839 = !MDLocation(line: 498, column: 9, scope: !1840)
!1840 = !{!"0xb\00498\009\0084", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1841 = !MDLocation(line: 498, column: 29, scope: !1840)
!1842 = !MDLocation(line: 498, column: 9, scope: !472)
!1843 = !MDLocation(line: 499, column: 14, scope: !1840)
!1844 = !MDLocation(line: 499, column: 9, scope: !1840)
!1845 = !MDLocation(line: 501, column: 9, scope: !1846)
!1846 = !{!"0xb\00501\009\0085", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1847 = !MDLocation(line: 501, column: 29, scope: !1846)
!1848 = !MDLocation(line: 501, column: 9, scope: !472)
!1849 = !MDLocation(line: 502, column: 9, scope: !1846)
!1850 = !MDLocation(line: 504, column: 16, scope: !472)
!1851 = !MDLocation(line: 504, column: 5, scope: !472)
!1852 = !MDLocation(line: 509, column: 25, scope: !472)
!1853 = !MDLocation(line: 509, column: 5, scope: !472)
!1854 = !MDLocation(line: 511, column: 9, scope: !1855)
!1855 = !{!"0xb\00511\009\0086", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1856 = !MDLocation(line: 511, column: 9, scope: !472)
!1857 = !MDLocation(line: 513, column: 29, scope: !1858)
!1858 = !{!"0xb\00512\005\0087", !1, !1855}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1859 = !MDLocation(line: 513, column: 9, scope: !1858)
!1860 = !MDLocation(line: 514, column: 19, scope: !1858)
!1861 = !MDLocation(line: 514, column: 28, scope: !1858)
!1862 = !MDLocation(line: 514, column: 31, scope: !1858)
!1863 = !MDLocation(line: 514, column: 41, scope: !1858)
!1864 = !MDLocation(line: 514, column: 64, scope: !1858)
!1865 = !MDLocation(line: 514, column: 87, scope: !1858)
!1866 = !MDLocation(line: 514, column: 90, scope: !1858)
!1867 = !MDLocation(line: 514, column: 9, scope: !1858)
!1868 = !MDLocation(line: 515, column: 5, scope: !1858)
!1869 = !MDLocation(line: 518, column: 30, scope: !1870)
!1870 = !{!"0xb\00517\005\0088", !1, !1855}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1871 = !MDLocation(line: 518, column: 29, scope: !1870)
!1872 = !MDLocation(line: 518, column: 9, scope: !1870)
!1873 = !MDLocation(line: 519, column: 19, scope: !1870)
!1874 = !MDLocation(line: 519, column: 28, scope: !1870)
!1875 = !MDLocation(line: 519, column: 35, scope: !1870)
!1876 = !MDLocation(line: 519, column: 48, scope: !1870)
!1877 = !MDLocation(line: 519, column: 71, scope: !1870)
!1878 = !MDLocation(line: 519, column: 74, scope: !1870)
!1879 = !MDLocation(line: 519, column: 9, scope: !1870)
!1880 = !MDLocation(line: 522, column: 12, scope: !472)
!1881 = !MDLocation(line: 522, column: 44, scope: !472)
!1882 = !MDLocation(line: 522, column: 52, scope: !472)
!1883 = !MDLocation(line: 522, column: 60, scope: !472)
!1884 = !MDLocation(line: 522, column: 22, scope: !472)
!1885 = !MDLocation(line: 522, column: 5, scope: !472)
!1886 = !MDLocation(line: 524, column: 9, scope: !1887)
!1887 = !{!"0xb\00524\009\0089", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1888 = !MDLocation(line: 524, column: 16, scope: !1887)
!1889 = !MDLocation(line: 524, column: 9, scope: !472)
!1890 = !MDLocation(line: 526, column: 10, scope: !1891)
!1891 = !{!"0xb\00525\005\0090", !1, !1887}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1892 = !MDLocation(line: 526, column: 9, scope: !1891)
!1893 = !MDLocation(line: 527, column: 19, scope: !1891)
!1894 = !MDLocation(line: 527, column: 9, scope: !1891)
!1895 = !MDLocation(line: 528, column: 23, scope: !1891)
!1896 = !MDLocation(line: 528, column: 10, scope: !1891)
!1897 = !MDLocation(line: 528, column: 9, scope: !1891)
!1898 = !MDLocation(line: 529, column: 17, scope: !1891)
!1899 = !MDLocation(line: 529, column: 10, scope: !1891)
!1900 = !MDLocation(line: 529, column: 9, scope: !1891)
!1901 = !MDLocation(line: 530, column: 5, scope: !1891)
!1902 = !MDLocation(line: 532, column: 5, scope: !472)
!1903 = !MDLocation(line: 533, column: 15, scope: !472)
!1904 = !MDLocation(line: 533, column: 24, scope: !472)
!1905 = !MDLocation(line: 533, column: 27, scope: !472)
!1906 = !MDLocation(line: 533, column: 37, scope: !472)
!1907 = !MDLocation(line: 533, column: 60, scope: !472)
!1908 = !MDLocation(line: 533, column: 83, scope: !472)
!1909 = !MDLocation(line: 533, column: 86, scope: !472)
!1910 = !MDLocation(line: 533, column: 5, scope: !472)
!1911 = !MDLocation(line: 534, column: 13, scope: !472)
!1912 = !MDLocation(line: 534, column: 45, scope: !472)
!1913 = !MDLocation(line: 534, column: 53, scope: !472)
!1914 = !MDLocation(line: 534, column: 61, scope: !472)
!1915 = !MDLocation(line: 534, column: 23, scope: !472)
!1916 = !MDLocation(line: 534, column: 5, scope: !472)
!1917 = !MDLocation(line: 536, column: 9, scope: !1918)
!1918 = !{!"0xb\00536\009\0091", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1919 = !MDLocation(line: 536, column: 17, scope: !1918)
!1920 = !MDLocation(line: 536, column: 9, scope: !472)
!1921 = !MDLocation(line: 538, column: 10, scope: !1922)
!1922 = !{!"0xb\00537\005\0092", !1, !1918}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1923 = !MDLocation(line: 538, column: 9, scope: !1922)
!1924 = !MDLocation(line: 539, column: 19, scope: !1922)
!1925 = !MDLocation(line: 539, column: 9, scope: !1922)
!1926 = !MDLocation(line: 540, column: 23, scope: !1922)
!1927 = !MDLocation(line: 540, column: 10, scope: !1922)
!1928 = !MDLocation(line: 540, column: 9, scope: !1922)
!1929 = !MDLocation(line: 541, column: 17, scope: !1922)
!1930 = !MDLocation(line: 541, column: 10, scope: !1922)
!1931 = !MDLocation(line: 541, column: 9, scope: !1922)
!1932 = !MDLocation(line: 542, column: 5, scope: !1922)
!1933 = !MDLocation(line: 545, column: 25, scope: !472)
!1934 = !MDLocation(line: 545, column: 5, scope: !472)
!1935 = !MDLocation(line: 547, column: 9, scope: !1936)
!1936 = !{!"0xb\00547\009\0093", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1937 = !MDLocation(line: 547, column: 9, scope: !472)
!1938 = !MDLocation(line: 549, column: 29, scope: !1939)
!1939 = !{!"0xb\00548\005\0094", !1, !1936}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1940 = !MDLocation(line: 549, column: 9, scope: !1939)
!1941 = !MDLocation(line: 550, column: 19, scope: !1939)
!1942 = !MDLocation(line: 550, column: 28, scope: !1939)
!1943 = !MDLocation(line: 550, column: 31, scope: !1939)
!1944 = !MDLocation(line: 550, column: 41, scope: !1939)
!1945 = !MDLocation(line: 550, column: 64, scope: !1939)
!1946 = !MDLocation(line: 550, column: 87, scope: !1939)
!1947 = !MDLocation(line: 550, column: 90, scope: !1939)
!1948 = !MDLocation(line: 550, column: 9, scope: !1939)
!1949 = !MDLocation(line: 551, column: 5, scope: !1939)
!1950 = !MDLocation(line: 554, column: 30, scope: !1951)
!1951 = !{!"0xb\00553\005\0095", !1, !1936}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1952 = !MDLocation(line: 554, column: 29, scope: !1951)
!1953 = !MDLocation(line: 554, column: 9, scope: !1951)
!1954 = !MDLocation(line: 555, column: 19, scope: !1951)
!1955 = !MDLocation(line: 555, column: 28, scope: !1951)
!1956 = !MDLocation(line: 555, column: 32, scope: !1951)
!1957 = !MDLocation(line: 555, column: 42, scope: !1951)
!1958 = !MDLocation(line: 555, column: 52, scope: !1951)
!1959 = !MDLocation(line: 555, column: 78, scope: !1951)
!1960 = !MDLocation(line: 555, column: 81, scope: !1951)
!1961 = !MDLocation(line: 555, column: 9, scope: !1951)
!1962 = !MDLocation(line: 558, column: 10, scope: !472)
!1963 = !MDLocation(line: 558, column: 42, scope: !472)
!1964 = !MDLocation(line: 558, column: 50, scope: !472)
!1965 = !MDLocation(line: 558, column: 58, scope: !472)
!1966 = !MDLocation(line: 558, column: 20, scope: !472)
!1967 = !MDLocation(line: 558, column: 5, scope: !472)
!1968 = !MDLocation(line: 560, column: 9, scope: !1969)
!1969 = !{!"0xb\00560\009\0096", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1970 = !MDLocation(line: 560, column: 14, scope: !1969)
!1971 = !MDLocation(line: 560, column: 9, scope: !472)
!1972 = !MDLocation(line: 562, column: 10, scope: !1973)
!1973 = !{!"0xb\00561\005\0097", !1, !1969}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1974 = !MDLocation(line: 562, column: 9, scope: !1973)
!1975 = !MDLocation(line: 563, column: 19, scope: !1973)
!1976 = !MDLocation(line: 563, column: 9, scope: !1973)
!1977 = !MDLocation(line: 564, column: 23, scope: !1973)
!1978 = !MDLocation(line: 564, column: 10, scope: !1973)
!1979 = !MDLocation(line: 564, column: 9, scope: !1973)
!1980 = !MDLocation(line: 565, column: 17, scope: !1973)
!1981 = !MDLocation(line: 565, column: 10, scope: !1973)
!1982 = !MDLocation(line: 565, column: 9, scope: !1973)
!1983 = !MDLocation(line: 566, column: 5, scope: !1973)
!1984 = !MDLocation(line: 568, column: 5, scope: !472)
!1985 = !MDLocation(line: 569, column: 15, scope: !472)
!1986 = !MDLocation(line: 569, column: 24, scope: !472)
!1987 = !MDLocation(line: 569, column: 27, scope: !472)
!1988 = !MDLocation(line: 569, column: 37, scope: !472)
!1989 = !MDLocation(line: 569, column: 60, scope: !472)
!1990 = !MDLocation(line: 569, column: 83, scope: !472)
!1991 = !MDLocation(line: 569, column: 86, scope: !472)
!1992 = !MDLocation(line: 569, column: 5, scope: !472)
!1993 = !MDLocation(line: 570, column: 12, scope: !472)
!1994 = !MDLocation(line: 570, column: 44, scope: !472)
!1995 = !MDLocation(line: 570, column: 52, scope: !472)
!1996 = !MDLocation(line: 570, column: 60, scope: !472)
!1997 = !MDLocation(line: 570, column: 22, scope: !472)
!1998 = !MDLocation(line: 570, column: 5, scope: !472)
!1999 = !MDLocation(line: 572, column: 9, scope: !2000)
!2000 = !{!"0xb\00572\009\0098", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2001 = !MDLocation(line: 572, column: 16, scope: !2000)
!2002 = !MDLocation(line: 572, column: 9, scope: !472)
!2003 = !MDLocation(line: 574, column: 10, scope: !2004)
!2004 = !{!"0xb\00573\005\0099", !1, !2000}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2005 = !MDLocation(line: 574, column: 9, scope: !2004)
!2006 = !MDLocation(line: 575, column: 19, scope: !2004)
!2007 = !MDLocation(line: 575, column: 9, scope: !2004)
!2008 = !MDLocation(line: 576, column: 23, scope: !2004)
!2009 = !MDLocation(line: 576, column: 10, scope: !2004)
!2010 = !MDLocation(line: 576, column: 9, scope: !2004)
!2011 = !MDLocation(line: 577, column: 17, scope: !2004)
!2012 = !MDLocation(line: 577, column: 10, scope: !2004)
!2013 = !MDLocation(line: 577, column: 9, scope: !2004)
!2014 = !MDLocation(line: 578, column: 5, scope: !2004)
!2015 = !MDLocation(line: 582, column: 17, scope: !472)
!2016 = !MDLocation(line: 582, column: 24, scope: !472)
!2017 = !MDLocation(line: 582, column: 42, scope: !472)
!2018 = !MDLocation(line: 582, column: 47, scope: !472)
!2019 = !MDLocation(line: 582, column: 16, scope: !472)
!2020 = !MDLocation(line: 582, column: 5, scope: !472)
!2021 = !MDLocation(line: 584, column: 5, scope: !472)
!2022 = !MDLocation(line: 586, column: 13, scope: !472)
!2023 = !MDLocation(line: 586, column: 5, scope: !472)
!2024 = !MDLocation(line: 590, column: 13, scope: !2025)
!2025 = !{!"0xb\00590\0013\00101", !1, !2026}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2026 = !{!"0xb\00587\005\00100", !1, !472}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2027 = !MDLocation(line: 590, column: 13, scope: !2026)
!2028 = !MDLocation(line: 592, column: 13, scope: !2029)
!2029 = !{!"0xb\00591\009\00102", !1, !2025}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2030 = !MDLocation(line: 594, column: 17, scope: !2031)
!2031 = !{!"0xb\00594\0017\00103", !1, !2029}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2032 = !MDLocation(line: 594, column: 17, scope: !2029)
!2033 = !MDLocation(line: 596, column: 17, scope: !2034)
!2034 = !{!"0xb\00595\0013\00104", !1, !2031}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2035 = !MDLocation(line: 597, column: 27, scope: !2034)
!2036 = !MDLocation(line: 597, column: 36, scope: !2034)
!2037 = !MDLocation(line: 597, column: 39, scope: !2034)
!2038 = !MDLocation(line: 597, column: 49, scope: !2034)
!2039 = !MDLocation(line: 597, column: 72, scope: !2034)
!2040 = !MDLocation(line: 597, column: 95, scope: !2034)
!2041 = !MDLocation(line: 597, column: 98, scope: !2034)
!2042 = !MDLocation(line: 597, column: 17, scope: !2034)
!2043 = !MDLocation(line: 598, column: 13, scope: !2034)
!2044 = !MDLocation(line: 601, column: 38, scope: !2045)
!2045 = !{!"0xb\00600\0013\00105", !1, !2031}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2046 = !MDLocation(line: 601, column: 37, scope: !2045)
!2047 = !MDLocation(line: 601, column: 17, scope: !2045)
!2048 = !MDLocation(line: 602, column: 27, scope: !2045)
!2049 = !MDLocation(line: 602, column: 36, scope: !2045)
!2050 = !MDLocation(line: 602, column: 43, scope: !2045)
!2051 = !MDLocation(line: 602, column: 56, scope: !2045)
!2052 = !MDLocation(line: 602, column: 79, scope: !2045)
!2053 = !MDLocation(line: 602, column: 82, scope: !2045)
!2054 = !MDLocation(line: 602, column: 17, scope: !2045)
!2055 = !MDLocation(line: 604, column: 9, scope: !2029)
!2056 = !MDLocation(line: 607, column: 34, scope: !2057)
!2057 = !{!"0xb\00606\009\00106", !1, !2025}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2058 = !MDLocation(line: 607, column: 33, scope: !2057)
!2059 = !MDLocation(line: 607, column: 13, scope: !2057)
!2060 = !MDLocation(line: 609, column: 17, scope: !2061)
!2061 = !{!"0xb\00609\0017\00107", !1, !2057}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2062 = !MDLocation(line: 609, column: 17, scope: !2057)
!2063 = !MDLocation(line: 611, column: 17, scope: !2064)
!2064 = !{!"0xb\00610\0013\00108", !1, !2061}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2065 = !MDLocation(line: 612, column: 27, scope: !2064)
!2066 = !MDLocation(line: 612, column: 36, scope: !2064)
!2067 = !MDLocation(line: 612, column: 40, scope: !2064)
!2068 = !MDLocation(line: 612, column: 50, scope: !2064)
!2069 = !MDLocation(line: 612, column: 60, scope: !2064)
!2070 = !MDLocation(line: 612, column: 86, scope: !2064)
!2071 = !MDLocation(line: 612, column: 89, scope: !2064)
!2072 = !MDLocation(line: 612, column: 17, scope: !2064)
!2073 = !MDLocation(line: 613, column: 13, scope: !2064)
!2074 = !MDLocation(line: 616, column: 38, scope: !2075)
!2075 = !{!"0xb\00615\0013\00109", !1, !2061}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2076 = !MDLocation(line: 616, column: 37, scope: !2075)
!2077 = !MDLocation(line: 616, column: 17, scope: !2075)
!2078 = !MDLocation(line: 617, column: 27, scope: !2075)
!2079 = !MDLocation(line: 617, column: 36, scope: !2075)
!2080 = !MDLocation(line: 617, column: 40, scope: !2075)
!2081 = !MDLocation(line: 617, column: 54, scope: !2075)
!2082 = !MDLocation(line: 617, column: 70, scope: !2075)
!2083 = !MDLocation(line: 617, column: 73, scope: !2075)
!2084 = !MDLocation(line: 617, column: 17, scope: !2075)
!2085 = !MDLocation(line: 621, column: 9, scope: !2026)
!2086 = !MDLocation(line: 623, column: 9, scope: !2026)
!2087 = !MDLocation(line: 625, column: 13, scope: !2088)
!2088 = !{!"0xb\00625\0013\00110", !1, !2026}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2089 = !MDLocation(line: 625, column: 13, scope: !2026)
!2090 = !MDLocation(line: 627, column: 13, scope: !2091)
!2091 = !{!"0xb\00626\009\00111", !1, !2088}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2092 = !MDLocation(line: 628, column: 23, scope: !2091)
!2093 = !MDLocation(line: 628, column: 32, scope: !2091)
!2094 = !MDLocation(line: 628, column: 35, scope: !2091)
!2095 = !MDLocation(line: 628, column: 45, scope: !2091)
!2096 = !MDLocation(line: 628, column: 68, scope: !2091)
!2097 = !MDLocation(line: 628, column: 91, scope: !2091)
!2098 = !MDLocation(line: 628, column: 94, scope: !2091)
!2099 = !MDLocation(line: 628, column: 13, scope: !2091)
!2100 = !MDLocation(line: 629, column: 9, scope: !2091)
!2101 = !MDLocation(line: 632, column: 34, scope: !2102)
!2102 = !{!"0xb\00631\009\00112", !1, !2088}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2103 = !MDLocation(line: 632, column: 33, scope: !2102)
!2104 = !MDLocation(line: 632, column: 13, scope: !2102)
!2105 = !MDLocation(line: 633, column: 23, scope: !2102)
!2106 = !MDLocation(line: 633, column: 32, scope: !2102)
!2107 = !MDLocation(line: 633, column: 36, scope: !2102)
!2108 = !MDLocation(line: 633, column: 46, scope: !2102)
!2109 = !MDLocation(line: 633, column: 56, scope: !2102)
!2110 = !MDLocation(line: 633, column: 82, scope: !2102)
!2111 = !MDLocation(line: 633, column: 85, scope: !2102)
!2112 = !MDLocation(line: 633, column: 13, scope: !2102)
!2113 = !MDLocation(line: 636, column: 9, scope: !2026)
!2114 = !MDLocation(line: 638, column: 9, scope: !2026)
!2115 = !MDLocation(line: 640, column: 13, scope: !2116)
!2116 = !{!"0xb\00640\0013\00113", !1, !2026}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2117 = !MDLocation(line: 640, column: 13, scope: !2026)
!2118 = !MDLocation(line: 642, column: 13, scope: !2119)
!2119 = !{!"0xb\00641\009\00114", !1, !2116}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2120 = !MDLocation(line: 643, column: 23, scope: !2119)
!2121 = !MDLocation(line: 643, column: 32, scope: !2119)
!2122 = !MDLocation(line: 643, column: 35, scope: !2119)
!2123 = !MDLocation(line: 643, column: 45, scope: !2119)
!2124 = !MDLocation(line: 643, column: 68, scope: !2119)
!2125 = !MDLocation(line: 643, column: 91, scope: !2119)
!2126 = !MDLocation(line: 643, column: 94, scope: !2119)
!2127 = !MDLocation(line: 643, column: 13, scope: !2119)
!2128 = !MDLocation(line: 644, column: 9, scope: !2119)
!2129 = !MDLocation(line: 647, column: 34, scope: !2130)
!2130 = !{!"0xb\00646\009\00115", !1, !2116}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2131 = !MDLocation(line: 647, column: 33, scope: !2130)
!2132 = !MDLocation(line: 647, column: 13, scope: !2130)
!2133 = !MDLocation(line: 648, column: 23, scope: !2130)
!2134 = !MDLocation(line: 648, column: 32, scope: !2130)
!2135 = !MDLocation(line: 648, column: 39, scope: !2130)
!2136 = !MDLocation(line: 648, column: 52, scope: !2130)
!2137 = !MDLocation(line: 648, column: 75, scope: !2130)
!2138 = !MDLocation(line: 648, column: 78, scope: !2130)
!2139 = !MDLocation(line: 648, column: 13, scope: !2130)
!2140 = !MDLocation(line: 651, column: 9, scope: !2026)
!2141 = !MDLocation(line: 653, column: 9, scope: !2026)
!2142 = !MDLocation(line: 654, column: 9, scope: !2026)
!2143 = !MDLocation(line: 655, column: 19, scope: !2026)
!2144 = !MDLocation(line: 655, column: 28, scope: !2026)
!2145 = !MDLocation(line: 655, column: 31, scope: !2026)
!2146 = !MDLocation(line: 655, column: 42, scope: !2026)
!2147 = !MDLocation(line: 655, column: 65, scope: !2026)
!2148 = !MDLocation(line: 655, column: 88, scope: !2026)
!2149 = !MDLocation(line: 655, column: 91, scope: !2026)
!2150 = !MDLocation(line: 655, column: 9, scope: !2026)
!2151 = !MDLocation(line: 656, column: 9, scope: !2026)
!2152 = !MDLocation(line: 659, column: 12, scope: !472)
!2153 = !MDLocation(line: 659, column: 44, scope: !472)
!2154 = !MDLocation(line: 659, column: 52, scope: !472)
!2155 = !MDLocation(line: 659, column: 60, scope: !472)
!2156 = !MDLocation(line: 659, column: 22, scope: !472)
!2157 = !MDLocation(line: 659, column: 5, scope: !472)
!2158 = !MDLocation(line: 661, column: 9, scope: !2159)
!2159 = !{!"0xb\00661\009\00116", !1, !472}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2160 = !MDLocation(line: 661, column: 16, scope: !2159)
!2161 = !MDLocation(line: 661, column: 9, scope: !472)
!2162 = !MDLocation(line: 663, column: 10, scope: !2163)
!2163 = !{!"0xb\00662\005\00117", !1, !2159}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2164 = !MDLocation(line: 663, column: 9, scope: !2163)
!2165 = !MDLocation(line: 664, column: 19, scope: !2163)
!2166 = !MDLocation(line: 664, column: 9, scope: !2163)
!2167 = !MDLocation(line: 665, column: 23, scope: !2163)
!2168 = !MDLocation(line: 665, column: 10, scope: !2163)
!2169 = !MDLocation(line: 665, column: 9, scope: !2163)
!2170 = !MDLocation(line: 666, column: 17, scope: !2163)
!2171 = !MDLocation(line: 666, column: 10, scope: !2163)
!2172 = !MDLocation(line: 666, column: 9, scope: !2163)
!2173 = !MDLocation(line: 667, column: 5, scope: !2163)
!2174 = !MDLocation(line: 669, column: 12, scope: !472)
!2175 = !MDLocation(line: 669, column: 5, scope: !472)
!2176 = !{!"0x101\00x\0016777888\000", !473, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 672]
!2177 = !MDLocation(line: 672, column: 47, scope: !473)
!2178 = !{!"0x101\00b\0033555104\000", !473, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 672]
!2179 = !MDLocation(line: 672, column: 57, scope: !473)
!2180 = !{!"0x101\00d\0050332320\000", !473, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 672]
!2181 = !MDLocation(line: 672, column: 68, scope: !473)
!2182 = !{!"0x101\00bestmv\0067109537\000", !473, !69, !73} ; [ DW_TAG_arg_variable ] [bestmv] [line 673]
!2183 = !MDLocation(line: 673, column: 43, scope: !473)
!2184 = !{!"0x101\00ref_mv\0083886753\000", !473, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 673]
!2185 = !MDLocation(line: 673, column: 59, scope: !473)
!2186 = !{!"0x101\00error_per_bit\00100663970\000", !473, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 674]
!2187 = !MDLocation(line: 674, column: 39, scope: !473)
!2188 = !{!"0x101\00vfp\00117441187\000", !473, !69, !424} ; [ DW_TAG_arg_variable ] [vfp] [line 675]
!2189 = !MDLocation(line: 675, column: 64, scope: !473)
!2190 = !{!"0x101\00mvcost\00134218404\000", !473, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 676]
!2191 = !MDLocation(line: 676, column: 40, scope: !473)
!2192 = !{!"0x101\00distortion\00150995620\000", !473, !69, !89} ; [ DW_TAG_arg_variable ] [distortion] [line 676]
!2193 = !MDLocation(line: 676, column: 56, scope: !473)
!2194 = !{!"0x101\00sse1\00167772837\000", !473, !69, !319} ; [ DW_TAG_arg_variable ] [sse1] [line 677]
!2195 = !MDLocation(line: 677, column: 49, scope: !473)
!2196 = !{!"0x100\00bestmse\00679\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [bestmse] [line 679]
!2197 = !MDLocation(line: 679, column: 9, scope: !473)
!2198 = !{!"0x100\00startmv\00680\000", !473, !69, !74} ; [ DW_TAG_auto_variable ] [startmv] [line 680]
!2199 = !MDLocation(line: 680, column: 12, scope: !473)
!2200 = !{!"0x100\00this_mv\00681\000", !473, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 681]
!2201 = !MDLocation(line: 681, column: 12, scope: !473)
!2202 = !{!"0x100\00z\00682\000", !473, !69, !60} ; [ DW_TAG_auto_variable ] [z] [line 682]
!2203 = !MDLocation(line: 682, column: 20, scope: !473)
!2204 = !MDLocation(line: 682, column: 27, scope: !473)
!2205 = !MDLocation(line: 682, column: 25, scope: !473)
!2206 = !MDLocation(line: 682, column: 42, scope: !473)
!2207 = !{!"0x100\00left\00683\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [left] [line 683]
!2208 = !MDLocation(line: 683, column: 9, scope: !473)
!2209 = !{!"0x100\00right\00683\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [right] [line 683]
!2210 = !MDLocation(line: 683, column: 15, scope: !473)
!2211 = !{!"0x100\00up\00683\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [up] [line 683]
!2212 = !MDLocation(line: 683, column: 22, scope: !473)
!2213 = !{!"0x100\00down\00683\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [down] [line 683]
!2214 = !MDLocation(line: 683, column: 26, scope: !473)
!2215 = !{!"0x100\00diag\00683\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [diag] [line 683]
!2216 = !MDLocation(line: 683, column: 32, scope: !473)
!2217 = !{!"0x100\00sse\00684\000", !473, !69, !80} ; [ DW_TAG_auto_variable ] [sse] [line 684]
!2218 = !MDLocation(line: 684, column: 18, scope: !473)
!2219 = !{!"0x100\00whichdir\00685\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [whichdir] [line 685]
!2220 = !MDLocation(line: 685, column: 9, scope: !473)
!2221 = !{!"0x100\00thismse\00686\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [thismse] [line 686]
!2222 = !MDLocation(line: 686, column: 9, scope: !473)
!2223 = !{!"0x100\00y_stride\00687\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [y_stride] [line 687]
!2224 = !MDLocation(line: 687, column: 9, scope: !473)
!2225 = !{!"0x100\00pre_stride\00688\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 688]
!2226 = !MDLocation(line: 688, column: 9, scope: !473)
!2227 = !MDLocation(line: 688, column: 22, scope: !473)
!2228 = !{!"0x100\00base_pre\00689\000", !473, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 689]
!2229 = !MDLocation(line: 689, column: 20, scope: !473)
!2230 = !MDLocation(line: 689, column: 31, scope: !473)
!2231 = !{!"0x100\00xd\00692\000", !473, !69, !820} ; [ DW_TAG_auto_variable ] [xd] [line 692]
!2232 = !MDLocation(line: 692, column: 18, scope: !473)
!2233 = !MDLocation(line: 692, column: 24, scope: !473)
!2234 = !MDLocation(line: 692, column: 23, scope: !473)
!2235 = !{!"0x100\00y_0\00693\000", !473, !69, !60} ; [ DW_TAG_auto_variable ] [y_0] [line 693]
!2236 = !MDLocation(line: 693, column: 20, scope: !473)
!2237 = !MDLocation(line: 693, column: 26, scope: !473)
!2238 = !MDLocation(line: 693, column: 37, scope: !473)
!2239 = !MDLocation(line: 693, column: 50, scope: !473)
!2240 = !MDLocation(line: 693, column: 49, scope: !473)
!2241 = !MDLocation(line: 693, column: 71, scope: !473)
!2242 = !MDLocation(line: 693, column: 84, scope: !473)
!2243 = !{!"0x100\00y\00694\000", !473, !69, !60} ; [ DW_TAG_auto_variable ] [y] [line 694]
!2244 = !MDLocation(line: 694, column: 20, scope: !473)
!2245 = !MDLocation(line: 696, column: 5, scope: !473)
!2246 = !MDLocation(line: 698, column: 5, scope: !473)
!2247 = !MDLocation(line: 698, column: 18, scope: !473)
!2248 = !MDLocation(line: 698, column: 28, scope: !473)
!2249 = !MDLocation(line: 698, column: 40, scope: !473)
!2250 = !MDLocation(line: 698, column: 52, scope: !473)
!2251 = !MDLocation(line: 698, column: 63, scope: !473)
!2252 = !MDLocation(line: 699, column: 9, scope: !473)
!2253 = !MDLocation(line: 699, column: 21, scope: !473)
!2254 = !MDLocation(line: 699, column: 5, scope: !473)
!2255 = !MDLocation(line: 706, column: 5, scope: !473)
!2256 = !MDLocation(line: 707, column: 5, scope: !473)
!2257 = !MDLocation(line: 708, column: 16, scope: !473)
!2258 = !MDLocation(line: 708, column: 5, scope: !473)
!2259 = !MDLocation(line: 711, column: 15, scope: !473)
!2260 = !MDLocation(line: 711, column: 23, scope: !473)
!2261 = !MDLocation(line: 711, column: 26, scope: !473)
!2262 = !MDLocation(line: 711, column: 36, scope: !473)
!2263 = !MDLocation(line: 711, column: 39, scope: !473)
!2264 = !MDLocation(line: 711, column: 54, scope: !473)
!2265 = !MDLocation(line: 711, column: 5, scope: !473)
!2266 = !MDLocation(line: 712, column: 19, scope: !473)
!2267 = !MDLocation(line: 712, column: 6, scope: !473)
!2268 = !MDLocation(line: 712, column: 5, scope: !473)
!2269 = !MDLocation(line: 713, column: 28, scope: !473)
!2270 = !MDLocation(line: 713, column: 36, scope: !473)
!2271 = !MDLocation(line: 713, column: 44, scope: !473)
!2272 = !MDLocation(line: 713, column: 52, scope: !473)
!2273 = !MDLocation(line: 713, column: 16, scope: !473)
!2274 = !MDLocation(line: 713, column: 5, scope: !473)
!2275 = !MDLocation(line: 716, column: 25, scope: !473)
!2276 = !MDLocation(line: 716, column: 5, scope: !473)
!2277 = !MDLocation(line: 717, column: 27, scope: !473)
!2278 = !MDLocation(line: 717, column: 26, scope: !473)
!2279 = !MDLocation(line: 717, column: 25, scope: !473)
!2280 = !MDLocation(line: 717, column: 5, scope: !473)
!2281 = !MDLocation(line: 718, column: 15, scope: !473)
!2282 = !MDLocation(line: 718, column: 34, scope: !473)
!2283 = !MDLocation(line: 718, column: 41, scope: !473)
!2284 = !MDLocation(line: 718, column: 51, scope: !473)
!2285 = !MDLocation(line: 718, column: 54, scope: !473)
!2286 = !MDLocation(line: 718, column: 5, scope: !473)
!2287 = !MDLocation(line: 719, column: 12, scope: !473)
!2288 = !MDLocation(line: 719, column: 44, scope: !473)
!2289 = !MDLocation(line: 719, column: 52, scope: !473)
!2290 = !MDLocation(line: 719, column: 60, scope: !473)
!2291 = !MDLocation(line: 719, column: 22, scope: !473)
!2292 = !MDLocation(line: 719, column: 5, scope: !473)
!2293 = !MDLocation(line: 721, column: 9, scope: !2294)
!2294 = !{!"0xb\00721\009\00118", !1, !473}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2295 = !MDLocation(line: 721, column: 16, scope: !2294)
!2296 = !MDLocation(line: 721, column: 9, scope: !473)
!2297 = !MDLocation(line: 723, column: 10, scope: !2298)
!2298 = !{!"0xb\00722\005\00119", !1, !2294}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2299 = !MDLocation(line: 723, column: 9, scope: !2298)
!2300 = !MDLocation(line: 724, column: 19, scope: !2298)
!2301 = !MDLocation(line: 724, column: 9, scope: !2298)
!2302 = !MDLocation(line: 725, column: 23, scope: !2298)
!2303 = !MDLocation(line: 725, column: 10, scope: !2298)
!2304 = !MDLocation(line: 725, column: 9, scope: !2298)
!2305 = !MDLocation(line: 726, column: 17, scope: !2298)
!2306 = !MDLocation(line: 726, column: 10, scope: !2298)
!2307 = !MDLocation(line: 726, column: 9, scope: !2298)
!2308 = !MDLocation(line: 727, column: 5, scope: !2298)
!2309 = !MDLocation(line: 729, column: 5, scope: !473)
!2310 = !MDLocation(line: 730, column: 15, scope: !473)
!2311 = !MDLocation(line: 730, column: 34, scope: !473)
!2312 = !MDLocation(line: 730, column: 37, scope: !473)
!2313 = !MDLocation(line: 730, column: 47, scope: !473)
!2314 = !MDLocation(line: 730, column: 50, scope: !473)
!2315 = !MDLocation(line: 730, column: 5, scope: !473)
!2316 = !MDLocation(line: 731, column: 13, scope: !473)
!2317 = !MDLocation(line: 731, column: 45, scope: !473)
!2318 = !MDLocation(line: 731, column: 53, scope: !473)
!2319 = !MDLocation(line: 731, column: 61, scope: !473)
!2320 = !MDLocation(line: 731, column: 23, scope: !473)
!2321 = !MDLocation(line: 731, column: 5, scope: !473)
!2322 = !MDLocation(line: 733, column: 9, scope: !2323)
!2323 = !{!"0xb\00733\009\00120", !1, !473}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2324 = !MDLocation(line: 733, column: 17, scope: !2323)
!2325 = !MDLocation(line: 733, column: 9, scope: !473)
!2326 = !MDLocation(line: 735, column: 10, scope: !2327)
!2327 = !{!"0xb\00734\005\00121", !1, !2323}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2328 = !MDLocation(line: 735, column: 9, scope: !2327)
!2329 = !MDLocation(line: 736, column: 19, scope: !2327)
!2330 = !MDLocation(line: 736, column: 9, scope: !2327)
!2331 = !MDLocation(line: 737, column: 23, scope: !2327)
!2332 = !MDLocation(line: 737, column: 10, scope: !2327)
!2333 = !MDLocation(line: 737, column: 9, scope: !2327)
!2334 = !MDLocation(line: 738, column: 17, scope: !2327)
!2335 = !MDLocation(line: 738, column: 10, scope: !2327)
!2336 = !MDLocation(line: 738, column: 9, scope: !2327)
!2337 = !MDLocation(line: 739, column: 5, scope: !2327)
!2338 = !MDLocation(line: 742, column: 25, scope: !473)
!2339 = !MDLocation(line: 742, column: 5, scope: !473)
!2340 = !MDLocation(line: 743, column: 27, scope: !473)
!2341 = !MDLocation(line: 743, column: 26, scope: !473)
!2342 = !MDLocation(line: 743, column: 25, scope: !473)
!2343 = !MDLocation(line: 743, column: 5, scope: !473)
!2344 = !MDLocation(line: 744, column: 15, scope: !473)
!2345 = !MDLocation(line: 744, column: 34, scope: !473)
!2346 = !MDLocation(line: 744, column: 38, scope: !473)
!2347 = !MDLocation(line: 744, column: 48, scope: !473)
!2348 = !MDLocation(line: 744, column: 58, scope: !473)
!2349 = !MDLocation(line: 744, column: 61, scope: !473)
!2350 = !MDLocation(line: 744, column: 5, scope: !473)
!2351 = !MDLocation(line: 745, column: 10, scope: !473)
!2352 = !MDLocation(line: 745, column: 42, scope: !473)
!2353 = !MDLocation(line: 745, column: 50, scope: !473)
!2354 = !MDLocation(line: 745, column: 58, scope: !473)
!2355 = !MDLocation(line: 745, column: 20, scope: !473)
!2356 = !MDLocation(line: 745, column: 5, scope: !473)
!2357 = !MDLocation(line: 747, column: 9, scope: !2358)
!2358 = !{!"0xb\00747\009\00122", !1, !473}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2359 = !MDLocation(line: 747, column: 14, scope: !2358)
!2360 = !MDLocation(line: 747, column: 9, scope: !473)
!2361 = !MDLocation(line: 749, column: 10, scope: !2362)
!2362 = !{!"0xb\00748\005\00123", !1, !2358}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2363 = !MDLocation(line: 749, column: 9, scope: !2362)
!2364 = !MDLocation(line: 750, column: 19, scope: !2362)
!2365 = !MDLocation(line: 750, column: 9, scope: !2362)
!2366 = !MDLocation(line: 751, column: 23, scope: !2362)
!2367 = !MDLocation(line: 751, column: 10, scope: !2362)
!2368 = !MDLocation(line: 751, column: 9, scope: !2362)
!2369 = !MDLocation(line: 752, column: 17, scope: !2362)
!2370 = !MDLocation(line: 752, column: 10, scope: !2362)
!2371 = !MDLocation(line: 752, column: 9, scope: !2362)
!2372 = !MDLocation(line: 753, column: 5, scope: !2362)
!2373 = !MDLocation(line: 755, column: 5, scope: !473)
!2374 = !MDLocation(line: 756, column: 15, scope: !473)
!2375 = !MDLocation(line: 756, column: 34, scope: !473)
!2376 = !MDLocation(line: 756, column: 37, scope: !473)
!2377 = !MDLocation(line: 756, column: 47, scope: !473)
!2378 = !MDLocation(line: 756, column: 50, scope: !473)
!2379 = !MDLocation(line: 756, column: 5, scope: !473)
!2380 = !MDLocation(line: 757, column: 12, scope: !473)
!2381 = !MDLocation(line: 757, column: 44, scope: !473)
!2382 = !MDLocation(line: 757, column: 52, scope: !473)
!2383 = !MDLocation(line: 757, column: 60, scope: !473)
!2384 = !MDLocation(line: 757, column: 22, scope: !473)
!2385 = !MDLocation(line: 757, column: 5, scope: !473)
!2386 = !MDLocation(line: 759, column: 9, scope: !2387)
!2387 = !{!"0xb\00759\009\00124", !1, !473}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2388 = !MDLocation(line: 759, column: 16, scope: !2387)
!2389 = !MDLocation(line: 759, column: 9, scope: !473)
!2390 = !MDLocation(line: 761, column: 10, scope: !2391)
!2391 = !{!"0xb\00760\005\00125", !1, !2387}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2392 = !MDLocation(line: 761, column: 9, scope: !2391)
!2393 = !MDLocation(line: 762, column: 19, scope: !2391)
!2394 = !MDLocation(line: 762, column: 9, scope: !2391)
!2395 = !MDLocation(line: 763, column: 23, scope: !2391)
!2396 = !MDLocation(line: 763, column: 10, scope: !2391)
!2397 = !MDLocation(line: 763, column: 9, scope: !2391)
!2398 = !MDLocation(line: 764, column: 17, scope: !2391)
!2399 = !MDLocation(line: 764, column: 10, scope: !2391)
!2400 = !MDLocation(line: 764, column: 9, scope: !2391)
!2401 = !MDLocation(line: 765, column: 5, scope: !2391)
!2402 = !MDLocation(line: 768, column: 17, scope: !473)
!2403 = !MDLocation(line: 768, column: 24, scope: !473)
!2404 = !MDLocation(line: 768, column: 42, scope: !473)
!2405 = !MDLocation(line: 768, column: 47, scope: !473)
!2406 = !MDLocation(line: 768, column: 16, scope: !473)
!2407 = !MDLocation(line: 768, column: 5, scope: !473)
!2408 = !MDLocation(line: 769, column: 5, scope: !473)
!2409 = !MDLocation(line: 771, column: 13, scope: !473)
!2410 = !MDLocation(line: 771, column: 5, scope: !473)
!2411 = !MDLocation(line: 774, column: 30, scope: !2412)
!2412 = !{!"0xb\00772\005\00126", !1, !473}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2413 = !MDLocation(line: 774, column: 29, scope: !2412)
!2414 = !MDLocation(line: 774, column: 9, scope: !2412)
!2415 = !MDLocation(line: 775, column: 30, scope: !2412)
!2416 = !MDLocation(line: 775, column: 29, scope: !2412)
!2417 = !MDLocation(line: 775, column: 9, scope: !2412)
!2418 = !MDLocation(line: 776, column: 19, scope: !2412)
!2419 = !MDLocation(line: 776, column: 39, scope: !2412)
!2420 = !MDLocation(line: 776, column: 47, scope: !2412)
!2421 = !MDLocation(line: 776, column: 57, scope: !2412)
!2422 = !MDLocation(line: 776, column: 67, scope: !2412)
!2423 = !MDLocation(line: 776, column: 70, scope: !2412)
!2424 = !MDLocation(line: 776, column: 9, scope: !2412)
!2425 = !MDLocation(line: 777, column: 9, scope: !2412)
!2426 = !MDLocation(line: 779, column: 9, scope: !2412)
!2427 = !MDLocation(line: 780, column: 30, scope: !2412)
!2428 = !MDLocation(line: 780, column: 29, scope: !2412)
!2429 = !MDLocation(line: 780, column: 9, scope: !2412)
!2430 = !MDLocation(line: 781, column: 19, scope: !2412)
!2431 = !MDLocation(line: 781, column: 39, scope: !2412)
!2432 = !MDLocation(line: 781, column: 43, scope: !2412)
!2433 = !MDLocation(line: 781, column: 53, scope: !2412)
!2434 = !MDLocation(line: 781, column: 63, scope: !2412)
!2435 = !MDLocation(line: 781, column: 66, scope: !2412)
!2436 = !MDLocation(line: 781, column: 9, scope: !2412)
!2437 = !MDLocation(line: 782, column: 9, scope: !2412)
!2438 = !MDLocation(line: 784, column: 30, scope: !2412)
!2439 = !MDLocation(line: 784, column: 29, scope: !2412)
!2440 = !MDLocation(line: 784, column: 9, scope: !2412)
!2441 = !MDLocation(line: 785, column: 9, scope: !2412)
!2442 = !MDLocation(line: 786, column: 19, scope: !2412)
!2443 = !MDLocation(line: 786, column: 39, scope: !2412)
!2444 = !MDLocation(line: 786, column: 46, scope: !2412)
!2445 = !MDLocation(line: 786, column: 56, scope: !2412)
!2446 = !MDLocation(line: 786, column: 59, scope: !2412)
!2447 = !MDLocation(line: 786, column: 9, scope: !2412)
!2448 = !MDLocation(line: 787, column: 9, scope: !2412)
!2449 = !MDLocation(line: 790, column: 9, scope: !2412)
!2450 = !MDLocation(line: 791, column: 9, scope: !2412)
!2451 = !MDLocation(line: 792, column: 19, scope: !2412)
!2452 = !MDLocation(line: 792, column: 39, scope: !2412)
!2453 = !MDLocation(line: 792, column: 42, scope: !2412)
!2454 = !MDLocation(line: 792, column: 52, scope: !2412)
!2455 = !MDLocation(line: 792, column: 55, scope: !2412)
!2456 = !MDLocation(line: 792, column: 9, scope: !2412)
!2457 = !MDLocation(line: 793, column: 9, scope: !2412)
!2458 = !MDLocation(line: 796, column: 12, scope: !473)
!2459 = !MDLocation(line: 796, column: 44, scope: !473)
!2460 = !MDLocation(line: 796, column: 52, scope: !473)
!2461 = !MDLocation(line: 796, column: 60, scope: !473)
!2462 = !MDLocation(line: 796, column: 22, scope: !473)
!2463 = !MDLocation(line: 796, column: 5, scope: !473)
!2464 = !MDLocation(line: 798, column: 9, scope: !2465)
!2465 = !{!"0xb\00798\009\00127", !1, !473}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2466 = !MDLocation(line: 798, column: 16, scope: !2465)
!2467 = !MDLocation(line: 798, column: 9, scope: !473)
!2468 = !MDLocation(line: 800, column: 10, scope: !2469)
!2469 = !{!"0xb\00799\005\00128", !1, !2465}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2470 = !MDLocation(line: 800, column: 9, scope: !2469)
!2471 = !MDLocation(line: 801, column: 19, scope: !2469)
!2472 = !MDLocation(line: 801, column: 9, scope: !2469)
!2473 = !MDLocation(line: 802, column: 23, scope: !2469)
!2474 = !MDLocation(line: 802, column: 10, scope: !2469)
!2475 = !MDLocation(line: 802, column: 9, scope: !2469)
!2476 = !MDLocation(line: 803, column: 17, scope: !2469)
!2477 = !MDLocation(line: 803, column: 10, scope: !2469)
!2478 = !MDLocation(line: 803, column: 9, scope: !2469)
!2479 = !MDLocation(line: 804, column: 5, scope: !2469)
!2480 = !MDLocation(line: 806, column: 12, scope: !473)
!2481 = !MDLocation(line: 806, column: 5, scope: !473)
!2482 = !{!"0x101\00x\0016778067\000", !474, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 851]
!2483 = !MDLocation(line: 851, column: 17, scope: !474)
!2484 = !{!"0x101\00b\0033555284\000", !474, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 852]
!2485 = !MDLocation(line: 852, column: 12, scope: !474)
!2486 = !{!"0x101\00d\0050332501\000", !474, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 853]
!2487 = !MDLocation(line: 853, column: 13, scope: !474)
!2488 = !{!"0x101\00ref_mv\0067109718\000", !474, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 854]
!2489 = !MDLocation(line: 854, column: 13, scope: !474)
!2490 = !{!"0x101\00best_mv\0083886935\000", !474, !69, !73} ; [ DW_TAG_arg_variable ] [best_mv] [line 855]
!2491 = !MDLocation(line: 855, column: 13, scope: !474)
!2492 = !{!"0x101\00search_param\00100664152\000", !474, !69, !72} ; [ DW_TAG_arg_variable ] [search_param] [line 856]
!2493 = !MDLocation(line: 856, column: 9, scope: !474)
!2494 = !{!"0x101\00sad_per_bit\00117441369\000", !474, !69, !72} ; [ DW_TAG_arg_variable ] [sad_per_bit] [line 857]
!2495 = !MDLocation(line: 857, column: 9, scope: !474)
!2496 = !{!"0x101\00vfp\00134218586\000", !474, !69, !424} ; [ DW_TAG_arg_variable ] [vfp] [line 858]
!2497 = !MDLocation(line: 858, column: 34, scope: !474)
!2498 = !{!"0x101\00mvsadcost\00150995803\000", !474, !69, !88} ; [ DW_TAG_arg_variable ] [mvsadcost] [line 859]
!2499 = !MDLocation(line: 859, column: 10, scope: !474)
!2500 = !{!"0x101\00mvcost\00167773020\000", !474, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 860]
!2501 = !MDLocation(line: 860, column: 10, scope: !474)
!2502 = !{!"0x101\00center_mv\00184550237\000", !474, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 861]
!2503 = !MDLocation(line: 861, column: 13, scope: !474)
!2504 = !{!"0x100\00hex\00864\000", !474, !69, !2505} ; [ DW_TAG_auto_variable ] [hex] [line 864]
!2505 = !{!"0x1\00\000\00192\0016\000\000\000", null, null, !82, !2506, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 16, offset 0] [from MV]
!2506 = !{!501}
!2507 = !MDLocation(line: 864, column: 8, scope: !474)
!2508 = !{!"0x100\00neighbors\00865\000", !474, !69, !2509} ; [ DW_TAG_auto_variable ] [neighbors] [line 865]
!2509 = !{!"0x1\00\000\00128\0016\000\000\000", null, null, !82, !243, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 16, offset 0] [from MV]
!2510 = !MDLocation(line: 865, column: 8, scope: !474)
!2511 = !{!"0x100\00i\00866\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 866]
!2512 = !MDLocation(line: 866, column: 9, scope: !474)
!2513 = !{!"0x100\00j\00866\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [j] [line 866]
!2514 = !MDLocation(line: 866, column: 12, scope: !474)
!2515 = !{!"0x100\00what\00868\000", !474, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 868]
!2516 = !MDLocation(line: 868, column: 20, scope: !474)
!2517 = !MDLocation(line: 868, column: 30, scope: !474)
!2518 = !MDLocation(line: 868, column: 28, scope: !474)
!2519 = !MDLocation(line: 868, column: 45, scope: !474)
!2520 = !{!"0x100\00what_stride\00869\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 869]
!2521 = !MDLocation(line: 869, column: 9, scope: !474)
!2522 = !MDLocation(line: 869, column: 23, scope: !474)
!2523 = !{!"0x100\00pre_stride\00870\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 870]
!2524 = !MDLocation(line: 870, column: 9, scope: !474)
!2525 = !MDLocation(line: 870, column: 22, scope: !474)
!2526 = !{!"0x100\00base_pre\00871\000", !474, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 871]
!2527 = !MDLocation(line: 871, column: 20, scope: !474)
!2528 = !MDLocation(line: 871, column: 31, scope: !474)
!2529 = !{!"0x100\00in_what_stride\00873\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 873]
!2530 = !MDLocation(line: 873, column: 9, scope: !474)
!2531 = !MDLocation(line: 873, column: 26, scope: !474)
!2532 = !{!"0x100\00br\00874\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [br] [line 874]
!2533 = !MDLocation(line: 874, column: 9, scope: !474)
!2534 = !{!"0x100\00bc\00874\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [bc] [line 874]
!2535 = !MDLocation(line: 874, column: 13, scope: !474)
!2536 = !{!"0x100\00this_mv\00875\000", !474, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 875]
!2537 = !MDLocation(line: 875, column: 12, scope: !474)
!2538 = !{!"0x100\00bestsad\00876\000", !474, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 876]
!2539 = !MDLocation(line: 876, column: 18, scope: !474)
!2540 = !{!"0x100\00thissad\00877\000", !474, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 877]
!2541 = !MDLocation(line: 877, column: 18, scope: !474)
!2542 = !{!"0x100\00base_offset\00878\000", !474, !69, !60} ; [ DW_TAG_auto_variable ] [base_offset] [line 878]
!2543 = !MDLocation(line: 878, column: 20, scope: !474)
!2544 = !{!"0x100\00this_offset\00879\000", !474, !69, !60} ; [ DW_TAG_auto_variable ] [this_offset] [line 879]
!2545 = !MDLocation(line: 879, column: 20, scope: !474)
!2546 = !{!"0x100\00k\00880\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [k] [line 880]
!2547 = !MDLocation(line: 880, column: 9, scope: !474)
!2548 = !{!"0x100\00all_in\00881\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [all_in] [line 881]
!2549 = !MDLocation(line: 881, column: 9, scope: !474)
!2550 = !{!"0x100\00best_site\00882\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [best_site] [line 882]
!2551 = !MDLocation(line: 882, column: 9, scope: !474)
!2552 = !{!"0x100\00hex_range\00883\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [hex_range] [line 883]
!2553 = !MDLocation(line: 883, column: 9, scope: !474)
!2554 = !{!"0x100\00dia_range\00884\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [dia_range] [line 884]
!2555 = !MDLocation(line: 884, column: 9, scope: !474)
!2556 = !{!"0x100\00fcenter_mv\00886\000", !474, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 886]
!2557 = !MDLocation(line: 886, column: 12, scope: !474)
!2558 = !MDLocation(line: 887, column: 28, scope: !474)
!2559 = !MDLocation(line: 887, column: 5, scope: !474)
!2560 = !MDLocation(line: 888, column: 28, scope: !474)
!2561 = !MDLocation(line: 888, column: 5, scope: !474)
!2562 = !MDLocation(line: 891, column: 18, scope: !474)
!2563 = !MDLocation(line: 891, column: 26, scope: !474)
!2564 = !MDLocation(line: 891, column: 41, scope: !474)
!2565 = !MDLocation(line: 891, column: 56, scope: !474)
!2566 = !MDLocation(line: 891, column: 71, scope: !474)
!2567 = !MDLocation(line: 891, column: 5, scope: !474)
!2568 = !MDLocation(line: 892, column: 10, scope: !474)
!2569 = !MDLocation(line: 892, column: 5, scope: !474)
!2570 = !MDLocation(line: 893, column: 10, scope: !474)
!2571 = !MDLocation(line: 893, column: 5, scope: !474)
!2572 = !MDLocation(line: 896, column: 37, scope: !474)
!2573 = !MDLocation(line: 896, column: 48, scope: !474)
!2574 = !MDLocation(line: 896, column: 5, scope: !474)
!2575 = !MDLocation(line: 897, column: 19, scope: !474)
!2576 = !MDLocation(line: 897, column: 34, scope: !474)
!2577 = !MDLocation(line: 897, column: 40, scope: !474)
!2578 = !MDLocation(line: 897, column: 55, scope: !474)
!2579 = !MDLocation(line: 897, column: 5, scope: !474)
!2580 = !MDLocation(line: 898, column: 25, scope: !474)
!2581 = !MDLocation(line: 898, column: 5, scope: !474)
!2582 = !MDLocation(line: 899, column: 25, scope: !474)
!2583 = !MDLocation(line: 899, column: 5, scope: !474)
!2584 = !MDLocation(line: 900, column: 15, scope: !474)
!2585 = !MDLocation(line: 900, column: 24, scope: !474)
!2586 = !MDLocation(line: 900, column: 30, scope: !474)
!2587 = !MDLocation(line: 900, column: 43, scope: !474)
!2588 = !MDLocation(line: 900, column: 56, scope: !474)
!2589 = !MDLocation(line: 901, column: 53, scope: !474)
!2590 = !MDLocation(line: 901, column: 64, scope: !474)
!2591 = !MDLocation(line: 901, column: 15, scope: !474)
!2592 = !MDLocation(line: 900, column: 5, scope: !474)
!2593 = !MDLocation(line: 916, column: 5, scope: !2594)
!2594 = !{!"0xb\00916\005\00129", !1, !474}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2595 = !MDLocation(line: 918, column: 8, scope: !2596)
!2596 = !{!"0xb\00918\008\00130", !1, !474}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2597 = !MDLocation(line: 918, column: 8, scope: !474)
!2598 = !MDLocation(line: 920, column: 14, scope: !2599)
!2599 = !{!"0xb\00920\009\00132", !1, !2600}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2600 = !{!"0xb\00919\005\00131", !1, !2596}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2601 = !MDLocation(line: 920, column: 21, scope: !2602)
!2602 = !{!"0xb\002", !1, !2603}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2603 = !{!"0xb\001", !1, !2604}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2604 = !{!"0xb\00920\009\00133", !1, !2599}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2605 = !MDLocation(line: 920, column: 9, scope: !2599)
!2606 = !MDLocation(line: 922, column: 33, scope: !2607)
!2607 = !{!"0xb\00921\009\00134", !1, !2604}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2608 = !MDLocation(line: 922, column: 42, scope: !2607)
!2609 = !MDLocation(line: 922, column: 38, scope: !2607)
!2610 = !MDLocation(line: 922, column: 13, scope: !2607)
!2611 = !MDLocation(line: 923, column: 33, scope: !2607)
!2612 = !MDLocation(line: 923, column: 42, scope: !2607)
!2613 = !MDLocation(line: 923, column: 38, scope: !2607)
!2614 = !MDLocation(line: 923, column: 13, scope: !2607)
!2615 = !MDLocation(line: 924, column: 27, scope: !2607)
!2616 = !MDLocation(line: 924, column: 42, scope: !2607)
!2617 = !MDLocation(line: 924, column: 62, scope: !2607)
!2618 = !MDLocation(line: 924, column: 80, scope: !2607)
!2619 = !MDLocation(line: 924, column: 13, scope: !2607)
!2620 = !MDLocation(line: 925, column: 23, scope: !2607)
!2621 = !MDLocation(line: 925, column: 32, scope: !2607)
!2622 = !MDLocation(line: 925, column: 38, scope: !2607)
!2623 = !MDLocation(line: 925, column: 51, scope: !2607)
!2624 = !MDLocation(line: 925, column: 64, scope: !2607)
!2625 = !MDLocation(line: 925, column: 80, scope: !2607)
!2626 = !MDLocation(line: 925, column: 13, scope: !2607)
!2627 = !MDLocation(line: 926, column: 13, scope: !2628)
!2628 = !{!"0xb\00926\0013\00136", !1, !2629}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2629 = !{!"0xb\00926\0013\00135", !1, !2607}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2630 = !MDLocation(line: 926, column: 13, scope: !2629)
!2631 = !MDLocation(line: 926, column: 13, scope: !2632)
!2632 = !{!"0xb\001", !1, !2633}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2633 = !{!"0xb\00926\0013\00137", !1, !2628}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2634 = !MDLocation(line: 926, column: 13, scope: !2635)
!2635 = !{!"0xb\00926\0013\00138", !1, !2633}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2636 = !MDLocation(line: 926, column: 13, scope: !2633)
!2637 = !MDLocation(line: 926, column: 13, scope: !2638)
!2638 = !{!"0xb\002", !1, !2639}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2639 = !{!"0xb\00926\0013\00139", !1, !2635}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2640 = !MDLocation(line: 926, column: 13, scope: !2641)
!2641 = !{!"0xb\004", !1, !2642}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2642 = !{!"0xb\003", !1, !2633}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2643 = !MDLocation(line: 927, column: 9, scope: !2607)
!2644 = !MDLocation(line: 920, column: 28, scope: !2604)
!2645 = !MDLocation(line: 920, column: 9, scope: !2604)
!2646 = !MDLocation(line: 928, column: 5, scope: !2600)
!2647 = !MDLocation(line: 930, column: 14, scope: !2648)
!2648 = !{!"0xb\00930\009\00141", !1, !2649}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2649 = !{!"0xb\00929\005\00140", !1, !2596}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2650 = !MDLocation(line: 930, column: 21, scope: !2651)
!2651 = !{!"0xb\002", !1, !2652}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2652 = !{!"0xb\001", !1, !2653}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2653 = !{!"0xb\00930\009\00142", !1, !2648}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2654 = !MDLocation(line: 930, column: 9, scope: !2648)
!2655 = !MDLocation(line: 932, column: 33, scope: !2656)
!2656 = !{!"0xb\00931\009\00143", !1, !2653}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2657 = !MDLocation(line: 932, column: 42, scope: !2656)
!2658 = !MDLocation(line: 932, column: 38, scope: !2656)
!2659 = !MDLocation(line: 932, column: 13, scope: !2656)
!2660 = !MDLocation(line: 933, column: 33, scope: !2656)
!2661 = !MDLocation(line: 933, column: 42, scope: !2656)
!2662 = !MDLocation(line: 933, column: 38, scope: !2656)
!2663 = !MDLocation(line: 933, column: 13, scope: !2656)
!2664 = !MDLocation(line: 934, column: 13, scope: !2665)
!2665 = !{!"0xb\00934\0013\00145", !1, !2666}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2666 = !{!"0xb\00934\0013\00144", !1, !2656}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2667 = !MDLocation(line: 934, column: 13, scope: !2666)
!2668 = !MDLocation(line: 934, column: 13, scope: !2669)
!2669 = !{!"0xb\001", !1, !2665}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2670 = !MDLocation(line: 934, column: 13, scope: !2671)
!2671 = !{!"0xb\002", !1, !2672}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2672 = !{!"0xb\00934\0013\00146", !1, !2666}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2673 = !MDLocation(line: 934, column: 13, scope: !2674)
!2674 = !{!"0xb\003", !1, !2672}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2675 = !MDLocation(line: 934, column: 13, scope: !2676)
!2676 = !{!"0xb\004", !1, !2677}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2677 = !{!"0xb\00934\0013\00147", !1, !2666}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2678 = !MDLocation(line: 934, column: 13, scope: !2679)
!2679 = !{!"0xb\005", !1, !2677}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2680 = !MDLocation(line: 934, column: 13, scope: !2681)
!2681 = !{!"0xb\006", !1, !2682}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2682 = !{!"0xb\00934\0013\00148", !1, !2666}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2683 = !MDLocation(line: 934, column: 13, scope: !2684)
!2684 = !{!"0xb\007", !1, !2682}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2685 = !MDLocation(line: 935, column: 27, scope: !2656)
!2686 = !MDLocation(line: 935, column: 42, scope: !2656)
!2687 = !MDLocation(line: 935, column: 62, scope: !2656)
!2688 = !MDLocation(line: 935, column: 80, scope: !2656)
!2689 = !MDLocation(line: 935, column: 13, scope: !2656)
!2690 = !MDLocation(line: 936, column: 23, scope: !2656)
!2691 = !MDLocation(line: 936, column: 32, scope: !2656)
!2692 = !MDLocation(line: 936, column: 38, scope: !2656)
!2693 = !MDLocation(line: 936, column: 51, scope: !2656)
!2694 = !MDLocation(line: 936, column: 64, scope: !2656)
!2695 = !MDLocation(line: 936, column: 80, scope: !2656)
!2696 = !MDLocation(line: 936, column: 13, scope: !2656)
!2697 = !MDLocation(line: 937, column: 13, scope: !2698)
!2698 = !{!"0xb\00937\0013\00150", !1, !2699}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2699 = !{!"0xb\00937\0013\00149", !1, !2656}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2700 = !MDLocation(line: 937, column: 13, scope: !2699)
!2701 = !MDLocation(line: 937, column: 13, scope: !2702)
!2702 = !{!"0xb\001", !1, !2703}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2703 = !{!"0xb\00937\0013\00151", !1, !2698}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2704 = !MDLocation(line: 937, column: 13, scope: !2705)
!2705 = !{!"0xb\00937\0013\00152", !1, !2703}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2706 = !MDLocation(line: 937, column: 13, scope: !2703)
!2707 = !MDLocation(line: 937, column: 13, scope: !2708)
!2708 = !{!"0xb\002", !1, !2709}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2709 = !{!"0xb\00937\0013\00153", !1, !2705}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2710 = !MDLocation(line: 937, column: 13, scope: !2711)
!2711 = !{!"0xb\004", !1, !2712}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2712 = !{!"0xb\003", !1, !2703}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2713 = !MDLocation(line: 938, column: 9, scope: !2656)
!2714 = !MDLocation(line: 930, column: 28, scope: !2653)
!2715 = !MDLocation(line: 930, column: 9, scope: !2653)
!2716 = !MDLocation(line: 941, column: 9, scope: !2717)
!2717 = !{!"0xb\00941\009\00154", !1, !474}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2718 = !MDLocation(line: 941, column: 9, scope: !474)
!2719 = !MDLocation(line: 942, column: 9, scope: !2717)
!2720 = !MDLocation(line: 945, column: 19, scope: !2721)
!2721 = !{!"0xb\00944\005\00155", !1, !2717}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2722 = !MDLocation(line: 945, column: 15, scope: !2721)
!2723 = !MDLocation(line: 945, column: 9, scope: !2721)
!2724 = !MDLocation(line: 946, column: 19, scope: !2721)
!2725 = !MDLocation(line: 946, column: 15, scope: !2721)
!2726 = !MDLocation(line: 946, column: 9, scope: !2721)
!2727 = !MDLocation(line: 947, column: 13, scope: !2721)
!2728 = !MDLocation(line: 947, column: 9, scope: !2721)
!2729 = !MDLocation(line: 950, column: 10, scope: !2730)
!2730 = !{!"0xb\00950\005\00156", !1, !474}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2731 = !MDLocation(line: 950, column: 17, scope: !2732)
!2732 = !{!"0xb\002", !1, !2733}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2733 = !{!"0xb\001", !1, !2734}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2734 = !{!"0xb\00950\005\00157", !1, !2730}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2735 = !MDLocation(line: 950, column: 21, scope: !2734)
!2736 = !MDLocation(line: 950, column: 17, scope: !2734)
!2737 = !MDLocation(line: 950, column: 5, scope: !2730)
!2738 = !MDLocation(line: 952, column: 9, scope: !2739)
!2739 = !{!"0xb\00951\005\00158", !1, !2734}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2740 = !MDLocation(line: 953, column: 9, scope: !2741)
!2741 = !{!"0xb\00953\009\00159", !1, !2739}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2742 = !MDLocation(line: 955, column: 12, scope: !2743)
!2743 = !{!"0xb\00955\0012\00160", !1, !2739}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2744 = !MDLocation(line: 955, column: 12, scope: !2739)
!2745 = !MDLocation(line: 957, column: 18, scope: !2746)
!2746 = !{!"0xb\00957\0013\00162", !1, !2747}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2747 = !{!"0xb\00956\009\00161", !1, !2743}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2748 = !MDLocation(line: 957, column: 25, scope: !2749)
!2749 = !{!"0xb\002", !1, !2750}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2750 = !{!"0xb\001", !1, !2751}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2751 = !{!"0xb\00957\0013\00163", !1, !2746}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2752 = !MDLocation(line: 957, column: 13, scope: !2746)
!2753 = !MDLocation(line: 959, column: 37, scope: !2754)
!2754 = !{!"0xb\00958\0013\00164", !1, !2751}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2755 = !MDLocation(line: 959, column: 57, scope: !2754)
!2756 = !MDLocation(line: 959, column: 42, scope: !2754)
!2757 = !MDLocation(line: 959, column: 54, scope: !2754)
!2758 = !MDLocation(line: 959, column: 17, scope: !2754)
!2759 = !MDLocation(line: 960, column: 37, scope: !2754)
!2760 = !MDLocation(line: 960, column: 57, scope: !2754)
!2761 = !MDLocation(line: 960, column: 42, scope: !2754)
!2762 = !MDLocation(line: 960, column: 54, scope: !2754)
!2763 = !MDLocation(line: 960, column: 17, scope: !2754)
!2764 = !MDLocation(line: 961, column: 31, scope: !2754)
!2765 = !MDLocation(line: 961, column: 46, scope: !2754)
!2766 = !MDLocation(line: 961, column: 67, scope: !2754)
!2767 = !MDLocation(line: 961, column: 86, scope: !2754)
!2768 = !MDLocation(line: 961, column: 17, scope: !2754)
!2769 = !MDLocation(line: 962, column: 27, scope: !2754)
!2770 = !MDLocation(line: 962, column: 36, scope: !2754)
!2771 = !MDLocation(line: 962, column: 42, scope: !2754)
!2772 = !MDLocation(line: 962, column: 55, scope: !2754)
!2773 = !MDLocation(line: 962, column: 68, scope: !2754)
!2774 = !MDLocation(line: 962, column: 84, scope: !2754)
!2775 = !MDLocation(line: 962, column: 17, scope: !2754)
!2776 = !MDLocation(line: 963, column: 17, scope: !2777)
!2777 = !{!"0xb\00963\0017\00166", !1, !2778}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2778 = !{!"0xb\00963\0017\00165", !1, !2754}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2779 = !MDLocation(line: 963, column: 17, scope: !2778)
!2780 = !MDLocation(line: 963, column: 17, scope: !2781)
!2781 = !{!"0xb\001", !1, !2782}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2782 = !{!"0xb\00963\0017\00167", !1, !2777}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2783 = !MDLocation(line: 963, column: 17, scope: !2784)
!2784 = !{!"0xb\00963\0017\00168", !1, !2782}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2785 = !MDLocation(line: 963, column: 17, scope: !2782)
!2786 = !MDLocation(line: 963, column: 17, scope: !2787)
!2787 = !{!"0xb\002", !1, !2788}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2788 = !{!"0xb\00963\0017\00169", !1, !2784}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2789 = !MDLocation(line: 963, column: 17, scope: !2790)
!2790 = !{!"0xb\004", !1, !2791}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2791 = !{!"0xb\003", !1, !2782}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2792 = !MDLocation(line: 964, column: 13, scope: !2754)
!2793 = !MDLocation(line: 957, column: 32, scope: !2751)
!2794 = !MDLocation(line: 957, column: 13, scope: !2751)
!2795 = !MDLocation(line: 965, column: 9, scope: !2747)
!2796 = !MDLocation(line: 967, column: 18, scope: !2797)
!2797 = !{!"0xb\00967\0013\00171", !1, !2798}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2798 = !{!"0xb\00966\009\00170", !1, !2743}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2799 = !MDLocation(line: 967, column: 25, scope: !2800)
!2800 = !{!"0xb\002", !1, !2801}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2801 = !{!"0xb\001", !1, !2802}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2802 = !{!"0xb\00967\0013\00172", !1, !2797}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2803 = !MDLocation(line: 967, column: 13, scope: !2797)
!2804 = !MDLocation(line: 969, column: 37, scope: !2805)
!2805 = !{!"0xb\00968\0013\00173", !1, !2802}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2806 = !MDLocation(line: 969, column: 57, scope: !2805)
!2807 = !MDLocation(line: 969, column: 42, scope: !2805)
!2808 = !MDLocation(line: 969, column: 54, scope: !2805)
!2809 = !MDLocation(line: 969, column: 17, scope: !2805)
!2810 = !MDLocation(line: 970, column: 37, scope: !2805)
!2811 = !MDLocation(line: 970, column: 57, scope: !2805)
!2812 = !MDLocation(line: 970, column: 42, scope: !2805)
!2813 = !MDLocation(line: 970, column: 54, scope: !2805)
!2814 = !MDLocation(line: 970, column: 17, scope: !2805)
!2815 = !MDLocation(line: 971, column: 17, scope: !2816)
!2816 = !{!"0xb\00971\0017\00175", !1, !2817}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2817 = !{!"0xb\00971\0017\00174", !1, !2805}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2818 = !MDLocation(line: 971, column: 17, scope: !2817)
!2819 = !MDLocation(line: 971, column: 17, scope: !2820)
!2820 = !{!"0xb\001", !1, !2816}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2821 = !MDLocation(line: 971, column: 17, scope: !2822)
!2822 = !{!"0xb\002", !1, !2823}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2823 = !{!"0xb\00971\0017\00176", !1, !2817}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2824 = !MDLocation(line: 971, column: 17, scope: !2825)
!2825 = !{!"0xb\003", !1, !2823}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2826 = !MDLocation(line: 971, column: 17, scope: !2827)
!2827 = !{!"0xb\004", !1, !2828}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2828 = !{!"0xb\00971\0017\00177", !1, !2817}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2829 = !MDLocation(line: 971, column: 17, scope: !2830)
!2830 = !{!"0xb\005", !1, !2828}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2831 = !MDLocation(line: 971, column: 17, scope: !2832)
!2832 = !{!"0xb\006", !1, !2833}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2833 = !{!"0xb\00971\0017\00178", !1, !2817}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2834 = !MDLocation(line: 971, column: 17, scope: !2835)
!2835 = !{!"0xb\007", !1, !2833}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2836 = !MDLocation(line: 972, column: 31, scope: !2805)
!2837 = !MDLocation(line: 972, column: 46, scope: !2805)
!2838 = !MDLocation(line: 972, column: 67, scope: !2805)
!2839 = !MDLocation(line: 972, column: 86, scope: !2805)
!2840 = !MDLocation(line: 972, column: 17, scope: !2805)
!2841 = !MDLocation(line: 973, column: 27, scope: !2805)
!2842 = !MDLocation(line: 973, column: 36, scope: !2805)
!2843 = !MDLocation(line: 973, column: 42, scope: !2805)
!2844 = !MDLocation(line: 973, column: 55, scope: !2805)
!2845 = !MDLocation(line: 973, column: 68, scope: !2805)
!2846 = !MDLocation(line: 973, column: 84, scope: !2805)
!2847 = !MDLocation(line: 973, column: 17, scope: !2805)
!2848 = !MDLocation(line: 974, column: 17, scope: !2849)
!2849 = !{!"0xb\00974\0017\00180", !1, !2850}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2850 = !{!"0xb\00974\0017\00179", !1, !2805}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2851 = !MDLocation(line: 974, column: 17, scope: !2850)
!2852 = !MDLocation(line: 974, column: 17, scope: !2853)
!2853 = !{!"0xb\001", !1, !2854}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2854 = !{!"0xb\00974\0017\00181", !1, !2849}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2855 = !MDLocation(line: 974, column: 17, scope: !2856)
!2856 = !{!"0xb\00974\0017\00182", !1, !2854}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2857 = !MDLocation(line: 974, column: 17, scope: !2854)
!2858 = !MDLocation(line: 974, column: 17, scope: !2859)
!2859 = !{!"0xb\002", !1, !2860}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2860 = !{!"0xb\00974\0017\00183", !1, !2856}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2861 = !MDLocation(line: 974, column: 17, scope: !2862)
!2862 = !{!"0xb\004", !1, !2863}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2863 = !{!"0xb\003", !1, !2854}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2864 = !MDLocation(line: 975, column: 13, scope: !2805)
!2865 = !MDLocation(line: 967, column: 32, scope: !2802)
!2866 = !MDLocation(line: 967, column: 13, scope: !2802)
!2867 = !MDLocation(line: 978, column: 13, scope: !2868)
!2868 = !{!"0xb\00978\0013\00184", !1, !2739}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2869 = !MDLocation(line: 978, column: 13, scope: !2739)
!2870 = !MDLocation(line: 979, column: 13, scope: !2868)
!2871 = !MDLocation(line: 982, column: 34, scope: !2872)
!2872 = !{!"0xb\00981\009\00185", !1, !2868}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2873 = !MDLocation(line: 982, column: 19, scope: !2872)
!2874 = !MDLocation(line: 982, column: 31, scope: !2872)
!2875 = !MDLocation(line: 982, column: 13, scope: !2872)
!2876 = !MDLocation(line: 983, column: 34, scope: !2872)
!2877 = !MDLocation(line: 983, column: 19, scope: !2872)
!2878 = !MDLocation(line: 983, column: 31, scope: !2872)
!2879 = !MDLocation(line: 983, column: 13, scope: !2872)
!2880 = !MDLocation(line: 984, column: 22, scope: !2872)
!2881 = !MDLocation(line: 984, column: 18, scope: !2872)
!2882 = !MDLocation(line: 984, column: 13, scope: !2872)
!2883 = !MDLocation(line: 985, column: 17, scope: !2884)
!2884 = !{!"0xb\00985\0017\00186", !1, !2872}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2885 = !MDLocation(line: 985, column: 17, scope: !2872)
!2886 = !MDLocation(line: 985, column: 26, scope: !2887)
!2887 = !{!"0xb\001", !1, !2884}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2888 = !MDLocation(line: 986, column: 22, scope: !2889)
!2889 = !{!"0xb\00986\0022\00187", !1, !2884}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2890 = !MDLocation(line: 986, column: 22, scope: !2884)
!2891 = !MDLocation(line: 986, column: 30, scope: !2892)
!2892 = !{!"0xb\001", !1, !2889}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2893 = !MDLocation(line: 988, column: 5, scope: !2739)
!2894 = !MDLocation(line: 950, column: 32, scope: !2734)
!2895 = !MDLocation(line: 950, column: 5, scope: !2734)
!2896 = !MDLocation(line: 988, column: 5, scope: !2730)
!2897 = !MDLocation(line: 992, column: 10, scope: !2898)
!2898 = !{!"0xb\00992\005\00188", !1, !474}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2899 = !MDLocation(line: 992, column: 17, scope: !2900)
!2900 = !{!"0xb\002", !1, !2901}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2901 = !{!"0xb\001", !1, !2902}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2902 = !{!"0xb\00992\005\00189", !1, !2898}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2903 = !MDLocation(line: 992, column: 21, scope: !2902)
!2904 = !MDLocation(line: 992, column: 17, scope: !2902)
!2905 = !MDLocation(line: 992, column: 5, scope: !2898)
!2906 = !MDLocation(line: 994, column: 9, scope: !2907)
!2907 = !{!"0xb\00993\005\00190", !1, !2902}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2908 = !MDLocation(line: 995, column: 9, scope: !2909)
!2909 = !{!"0xb\00995\009\00191", !1, !2907}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2910 = !MDLocation(line: 997, column: 12, scope: !2911)
!2911 = !{!"0xb\00997\0012\00192", !1, !2907}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2912 = !MDLocation(line: 997, column: 12, scope: !2907)
!2913 = !MDLocation(line: 999, column: 18, scope: !2914)
!2914 = !{!"0xb\00999\0013\00194", !1, !2915}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2915 = !{!"0xb\00998\009\00193", !1, !2911}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2916 = !MDLocation(line: 999, column: 25, scope: !2917)
!2917 = !{!"0xb\002", !1, !2918}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2918 = !{!"0xb\001", !1, !2919}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2919 = !{!"0xb\00999\0013\00195", !1, !2914}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2920 = !MDLocation(line: 999, column: 13, scope: !2914)
!2921 = !MDLocation(line: 1001, column: 37, scope: !2922)
!2922 = !{!"0xb\001000\0013\00196", !1, !2919}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2923 = !MDLocation(line: 1001, column: 52, scope: !2922)
!2924 = !MDLocation(line: 1001, column: 42, scope: !2922)
!2925 = !MDLocation(line: 1001, column: 17, scope: !2922)
!2926 = !MDLocation(line: 1002, column: 37, scope: !2922)
!2927 = !MDLocation(line: 1002, column: 52, scope: !2922)
!2928 = !MDLocation(line: 1002, column: 42, scope: !2922)
!2929 = !MDLocation(line: 1002, column: 17, scope: !2922)
!2930 = !MDLocation(line: 1003, column: 31, scope: !2922)
!2931 = !MDLocation(line: 1003, column: 46, scope: !2922)
!2932 = !MDLocation(line: 1003, column: 67, scope: !2922)
!2933 = !MDLocation(line: 1003, column: 86, scope: !2922)
!2934 = !MDLocation(line: 1003, column: 17, scope: !2922)
!2935 = !MDLocation(line: 1004, column: 27, scope: !2922)
!2936 = !MDLocation(line: 1004, column: 36, scope: !2922)
!2937 = !MDLocation(line: 1004, column: 42, scope: !2922)
!2938 = !MDLocation(line: 1004, column: 55, scope: !2922)
!2939 = !MDLocation(line: 1004, column: 68, scope: !2922)
!2940 = !MDLocation(line: 1004, column: 84, scope: !2922)
!2941 = !MDLocation(line: 1004, column: 17, scope: !2922)
!2942 = !MDLocation(line: 1005, column: 17, scope: !2943)
!2943 = !{!"0xb\001005\0017\00198", !1, !2944}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2944 = !{!"0xb\001005\0017\00197", !1, !2922}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2945 = !MDLocation(line: 1005, column: 17, scope: !2944)
!2946 = !MDLocation(line: 1005, column: 17, scope: !2947)
!2947 = !{!"0xb\001", !1, !2948}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2948 = !{!"0xb\001005\0017\00199", !1, !2943}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2949 = !MDLocation(line: 1005, column: 17, scope: !2950)
!2950 = !{!"0xb\001005\0017\00200", !1, !2948}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2951 = !MDLocation(line: 1005, column: 17, scope: !2948)
!2952 = !MDLocation(line: 1005, column: 17, scope: !2953)
!2953 = !{!"0xb\002", !1, !2954}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2954 = !{!"0xb\001005\0017\00201", !1, !2950}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2955 = !MDLocation(line: 1005, column: 17, scope: !2956)
!2956 = !{!"0xb\004", !1, !2957}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2957 = !{!"0xb\003", !1, !2948}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2958 = !MDLocation(line: 1006, column: 13, scope: !2922)
!2959 = !MDLocation(line: 999, column: 32, scope: !2919)
!2960 = !MDLocation(line: 999, column: 13, scope: !2919)
!2961 = !MDLocation(line: 1007, column: 9, scope: !2915)
!2962 = !MDLocation(line: 1009, column: 18, scope: !2963)
!2963 = !{!"0xb\001009\0013\00203", !1, !2964}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2964 = !{!"0xb\001008\009\00202", !1, !2911}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2965 = !MDLocation(line: 1009, column: 25, scope: !2966)
!2966 = !{!"0xb\002", !1, !2967}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2967 = !{!"0xb\001", !1, !2968}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2968 = !{!"0xb\001009\0013\00204", !1, !2963}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2969 = !MDLocation(line: 1009, column: 13, scope: !2963)
!2970 = !MDLocation(line: 1011, column: 37, scope: !2971)
!2971 = !{!"0xb\001010\0013\00205", !1, !2968}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2972 = !MDLocation(line: 1011, column: 52, scope: !2971)
!2973 = !MDLocation(line: 1011, column: 42, scope: !2971)
!2974 = !MDLocation(line: 1011, column: 17, scope: !2971)
!2975 = !MDLocation(line: 1012, column: 37, scope: !2971)
!2976 = !MDLocation(line: 1012, column: 52, scope: !2971)
!2977 = !MDLocation(line: 1012, column: 42, scope: !2971)
!2978 = !MDLocation(line: 1012, column: 17, scope: !2971)
!2979 = !MDLocation(line: 1013, column: 17, scope: !2980)
!2980 = !{!"0xb\001013\0017\00207", !1, !2981}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2981 = !{!"0xb\001013\0017\00206", !1, !2971}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2982 = !MDLocation(line: 1013, column: 17, scope: !2981)
!2983 = !MDLocation(line: 1013, column: 17, scope: !2984)
!2984 = !{!"0xb\001", !1, !2980}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2985 = !MDLocation(line: 1013, column: 17, scope: !2986)
!2986 = !{!"0xb\002", !1, !2987}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2987 = !{!"0xb\001013\0017\00208", !1, !2981}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2988 = !MDLocation(line: 1013, column: 17, scope: !2989)
!2989 = !{!"0xb\003", !1, !2987}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2990 = !MDLocation(line: 1013, column: 17, scope: !2991)
!2991 = !{!"0xb\004", !1, !2992}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2992 = !{!"0xb\001013\0017\00209", !1, !2981}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2993 = !MDLocation(line: 1013, column: 17, scope: !2994)
!2994 = !{!"0xb\005", !1, !2992}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2995 = !MDLocation(line: 1013, column: 17, scope: !2996)
!2996 = !{!"0xb\006", !1, !2997}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2997 = !{!"0xb\001013\0017\00210", !1, !2981}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2998 = !MDLocation(line: 1013, column: 17, scope: !2999)
!2999 = !{!"0xb\007", !1, !2997}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3000 = !MDLocation(line: 1014, column: 31, scope: !2971)
!3001 = !MDLocation(line: 1014, column: 46, scope: !2971)
!3002 = !MDLocation(line: 1014, column: 67, scope: !2971)
!3003 = !MDLocation(line: 1014, column: 86, scope: !2971)
!3004 = !MDLocation(line: 1014, column: 17, scope: !2971)
!3005 = !MDLocation(line: 1015, column: 27, scope: !2971)
!3006 = !MDLocation(line: 1015, column: 36, scope: !2971)
!3007 = !MDLocation(line: 1015, column: 42, scope: !2971)
!3008 = !MDLocation(line: 1015, column: 55, scope: !2971)
!3009 = !MDLocation(line: 1015, column: 68, scope: !2971)
!3010 = !MDLocation(line: 1015, column: 84, scope: !2971)
!3011 = !MDLocation(line: 1015, column: 17, scope: !2971)
!3012 = !MDLocation(line: 1016, column: 17, scope: !3013)
!3013 = !{!"0xb\001016\0017\00212", !1, !3014}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3014 = !{!"0xb\001016\0017\00211", !1, !2971}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3015 = !MDLocation(line: 1016, column: 17, scope: !3014)
!3016 = !MDLocation(line: 1016, column: 17, scope: !3017)
!3017 = !{!"0xb\001", !1, !3018}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3018 = !{!"0xb\001016\0017\00213", !1, !3013}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3019 = !MDLocation(line: 1016, column: 17, scope: !3020)
!3020 = !{!"0xb\001016\0017\00214", !1, !3018}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3021 = !MDLocation(line: 1016, column: 17, scope: !3018)
!3022 = !MDLocation(line: 1016, column: 17, scope: !3023)
!3023 = !{!"0xb\002", !1, !3024}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3024 = !{!"0xb\001016\0017\00215", !1, !3020}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3025 = !MDLocation(line: 1016, column: 17, scope: !3026)
!3026 = !{!"0xb\004", !1, !3027}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3027 = !{!"0xb\003", !1, !3018}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3028 = !MDLocation(line: 1017, column: 13, scope: !2971)
!3029 = !MDLocation(line: 1009, column: 32, scope: !2968)
!3030 = !MDLocation(line: 1009, column: 13, scope: !2968)
!3031 = !MDLocation(line: 1020, column: 13, scope: !3032)
!3032 = !{!"0xb\001020\0013\00216", !1, !2907}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3033 = !MDLocation(line: 1020, column: 13, scope: !2907)
!3034 = !MDLocation(line: 1021, column: 13, scope: !3032)
!3035 = !MDLocation(line: 1024, column: 29, scope: !3036)
!3036 = !{!"0xb\001023\009\00217", !1, !3032}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3037 = !MDLocation(line: 1024, column: 19, scope: !3036)
!3038 = !MDLocation(line: 1024, column: 13, scope: !3036)
!3039 = !MDLocation(line: 1025, column: 29, scope: !3036)
!3040 = !MDLocation(line: 1025, column: 19, scope: !3036)
!3041 = !MDLocation(line: 1025, column: 13, scope: !3036)
!3042 = !MDLocation(line: 1027, column: 5, scope: !2907)
!3043 = !MDLocation(line: 992, column: 32, scope: !2902)
!3044 = !MDLocation(line: 992, column: 5, scope: !2902)
!3045 = !MDLocation(line: 1029, column: 26, scope: !474)
!3046 = !MDLocation(line: 1029, column: 5, scope: !474)
!3047 = !MDLocation(line: 1030, column: 26, scope: !474)
!3048 = !MDLocation(line: 1030, column: 5, scope: !474)
!3049 = !MDLocation(line: 1032, column: 12, scope: !474)
!3050 = !MDLocation(line: 1032, column: 5, scope: !474)
!3051 = !{!"0x101\00mv\0016777262\000", !490, !492, !73} ; [ DW_TAG_arg_variable ] [mv] [line 46]
!3052 = !MDLocation(line: 46, column: 34, scope: !490)
!3053 = !{!"0x101\00mb_to_left_edge\0033554478\000", !490, !492, !72} ; [ DW_TAG_arg_variable ] [mb_to_left_edge] [line 46]
!3054 = !MDLocation(line: 46, column: 42, scope: !490)
!3055 = !{!"0x101\00mb_to_right_edge\0050331694\000", !490, !492, !72} ; [ DW_TAG_arg_variable ] [mb_to_right_edge] [line 46]
!3056 = !MDLocation(line: 46, column: 63, scope: !490)
!3057 = !{!"0x101\00mb_to_top_edge\0067108911\000", !490, !492, !72} ; [ DW_TAG_arg_variable ] [mb_to_top_edge] [line 47]
!3058 = !MDLocation(line: 47, column: 30, scope: !490)
!3059 = !{!"0x101\00mb_to_bottom_edge\0083886127\000", !490, !492, !72} ; [ DW_TAG_arg_variable ] [mb_to_bottom_edge] [line 47]
!3060 = !MDLocation(line: 47, column: 50, scope: !490)
!3061 = !MDLocation(line: 49, column: 22, scope: !490)
!3062 = !MDLocation(line: 49, column: 38, scope: !490)
!3063 = !MDLocation(line: 49, column: 21, scope: !490)
!3064 = !MDLocation(line: 50, column: 9, scope: !490)
!3065 = !MDLocation(line: 50, column: 27, scope: !490)
!3066 = !MDLocation(line: 49, column: 21, scope: !3067)
!3067 = !{!"0xb\002", !491, !3068}                ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/../../vp8/common/findnearmv.h]
!3068 = !{!"0xb\001", !491, !490}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/../../vp8/common/findnearmv.h]
!3069 = !MDLocation(line: 49, column: 5, scope: !490)
!3070 = !MDLocation(line: 51, column: 22, scope: !490)
!3071 = !MDLocation(line: 51, column: 38, scope: !490)
!3072 = !MDLocation(line: 51, column: 21, scope: !490)
!3073 = !MDLocation(line: 52, column: 9, scope: !490)
!3074 = !MDLocation(line: 52, column: 28, scope: !490)
!3075 = !MDLocation(line: 51, column: 21, scope: !3067)
!3076 = !MDLocation(line: 51, column: 5, scope: !490)
!3077 = !MDLocation(line: 53, column: 22, scope: !490)
!3078 = !MDLocation(line: 53, column: 38, scope: !490)
!3079 = !MDLocation(line: 53, column: 21, scope: !490)
!3080 = !MDLocation(line: 54, column: 9, scope: !490)
!3081 = !MDLocation(line: 54, column: 26, scope: !490)
!3082 = !MDLocation(line: 53, column: 21, scope: !3067)
!3083 = !MDLocation(line: 53, column: 5, scope: !490)
!3084 = !MDLocation(line: 55, column: 22, scope: !490)
!3085 = !MDLocation(line: 55, column: 38, scope: !490)
!3086 = !MDLocation(line: 55, column: 21, scope: !490)
!3087 = !MDLocation(line: 56, column: 9, scope: !490)
!3088 = !MDLocation(line: 56, column: 29, scope: !490)
!3089 = !MDLocation(line: 55, column: 21, scope: !3067)
!3090 = !MDLocation(line: 55, column: 5, scope: !490)
!3091 = !MDLocation(line: 57, column: 1, scope: !490)
!3092 = !{!"0x101\00mv\0016777264\000", !489, !69, !73} ; [ DW_TAG_arg_variable ] [mv] [line 48]
!3093 = !MDLocation(line: 48, column: 35, scope: !489)
!3094 = !{!"0x101\00ref\0033554480\000", !489, !69, !73} ; [ DW_TAG_arg_variable ] [ref] [line 48]
!3095 = !MDLocation(line: 48, column: 47, scope: !489)
!3096 = !{!"0x101\00mvsadcost\0050331696\000", !489, !69, !88} ; [ DW_TAG_arg_variable ] [mvsadcost] [line 48]
!3097 = !MDLocation(line: 48, column: 57, scope: !489)
!3098 = !{!"0x101\00error_per_bit\0067108912\000", !489, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 48]
!3099 = !MDLocation(line: 48, column: 75, scope: !489)
!3100 = !MDLocation(line: 52, column: 9, scope: !3101)
!3101 = !{!"0xb\0052\009\00361", !1, !489}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3102 = !MDLocation(line: 52, column: 9, scope: !489)
!3103 = !MDLocation(line: 53, column: 32, scope: !3101)
!3104 = !MDLocation(line: 53, column: 48, scope: !3101)
!3105 = !MDLocation(line: 53, column: 18, scope: !3101)
!3106 = !MDLocation(line: 54, column: 32, scope: !3101)
!3107 = !MDLocation(line: 54, column: 48, scope: !3101)
!3108 = !MDLocation(line: 54, column: 18, scope: !3101)
!3109 = !MDLocation(line: 55, column: 19, scope: !3101)
!3110 = !MDLocation(line: 53, column: 17, scope: !3101)
!3111 = !MDLocation(line: 53, column: 16, scope: !3101)
!3112 = !MDLocation(line: 53, column: 9, scope: !3101)
!3113 = !MDLocation(line: 56, column: 5, scope: !489)
!3114 = !MDLocation(line: 57, column: 1, scope: !489)
!3115 = !{!"0x101\00x\0016778256\000", !477, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1040]
!3116 = !MDLocation(line: 1040, column: 17, scope: !477)
!3117 = !{!"0x101\00b\0033555473\000", !477, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1041]
!3118 = !MDLocation(line: 1041, column: 12, scope: !477)
!3119 = !{!"0x101\00d\0050332690\000", !477, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1042]
!3120 = !MDLocation(line: 1042, column: 13, scope: !477)
!3121 = !{!"0x101\00ref_mv\0067109907\000", !477, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1043]
!3122 = !MDLocation(line: 1043, column: 13, scope: !477)
!3123 = !{!"0x101\00best_mv\0083887124\000", !477, !69, !73} ; [ DW_TAG_arg_variable ] [best_mv] [line 1044]
!3124 = !MDLocation(line: 1044, column: 13, scope: !477)
!3125 = !{!"0x101\00search_param\00100664341\000", !477, !69, !72} ; [ DW_TAG_arg_variable ] [search_param] [line 1045]
!3126 = !MDLocation(line: 1045, column: 9, scope: !477)
!3127 = !{!"0x101\00sad_per_bit\00117441558\000", !477, !69, !72} ; [ DW_TAG_arg_variable ] [sad_per_bit] [line 1046]
!3128 = !MDLocation(line: 1046, column: 9, scope: !477)
!3129 = !{!"0x101\00num00\00134218775\000", !477, !69, !89} ; [ DW_TAG_arg_variable ] [num00] [line 1047]
!3130 = !MDLocation(line: 1047, column: 10, scope: !477)
!3131 = !{!"0x101\00fn_ptr\00150995992\000", !477, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1048]
!3132 = !MDLocation(line: 1048, column: 28, scope: !477)
!3133 = !{!"0x101\00mvcost\00167773209\000", !477, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1049]
!3134 = !MDLocation(line: 1049, column: 10, scope: !477)
!3135 = !{!"0x101\00center_mv\00184550426\000", !477, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1050]
!3136 = !MDLocation(line: 1050, column: 13, scope: !477)
!3137 = !{!"0x100\00i\001053\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1053]
!3138 = !MDLocation(line: 1053, column: 9, scope: !477)
!3139 = !{!"0x100\00j\001053\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [j] [line 1053]
!3140 = !MDLocation(line: 1053, column: 12, scope: !477)
!3141 = !{!"0x100\00step\001053\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [step] [line 1053]
!3142 = !MDLocation(line: 1053, column: 15, scope: !477)
!3143 = !{!"0x100\00what\001055\000", !477, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1055]
!3144 = !MDLocation(line: 1055, column: 20, scope: !477)
!3145 = !MDLocation(line: 1055, column: 30, scope: !477)
!3146 = !MDLocation(line: 1055, column: 28, scope: !477)
!3147 = !MDLocation(line: 1055, column: 45, scope: !477)
!3148 = !{!"0x100\00what_stride\001056\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1056]
!3149 = !MDLocation(line: 1056, column: 9, scope: !477)
!3150 = !MDLocation(line: 1056, column: 23, scope: !477)
!3151 = !{!"0x100\00in_what\001057\000", !477, !69, !60} ; [ DW_TAG_auto_variable ] [in_what] [line 1057]
!3152 = !MDLocation(line: 1057, column: 20, scope: !477)
!3153 = !{!"0x100\00pre_stride\001058\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1058]
!3154 = !MDLocation(line: 1058, column: 9, scope: !477)
!3155 = !MDLocation(line: 1058, column: 22, scope: !477)
!3156 = !{!"0x100\00base_pre\001059\000", !477, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1059]
!3157 = !MDLocation(line: 1059, column: 20, scope: !477)
!3158 = !MDLocation(line: 1059, column: 31, scope: !477)
!3159 = !{!"0x100\00in_what_stride\001060\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1060]
!3160 = !MDLocation(line: 1060, column: 9, scope: !477)
!3161 = !MDLocation(line: 1060, column: 26, scope: !477)
!3162 = !{!"0x100\00best_address\001061\000", !477, !69, !60} ; [ DW_TAG_auto_variable ] [best_address] [line 1061]
!3163 = !MDLocation(line: 1061, column: 20, scope: !477)
!3164 = !{!"0x100\00tot_steps\001063\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [tot_steps] [line 1063]
!3165 = !MDLocation(line: 1063, column: 9, scope: !477)
!3166 = !{!"0x100\00this_mv\001064\000", !477, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1064]
!3167 = !MDLocation(line: 1064, column: 12, scope: !477)
!3168 = !{!"0x100\00bestsad\001066\000", !477, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1066]
!3169 = !MDLocation(line: 1066, column: 18, scope: !477)
!3170 = !{!"0x100\00thissad\001067\000", !477, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1067]
!3171 = !MDLocation(line: 1067, column: 18, scope: !477)
!3172 = !{!"0x100\00best_site\001068\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [best_site] [line 1068]
!3173 = !MDLocation(line: 1068, column: 9, scope: !477)
!3174 = !{!"0x100\00last_site\001069\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [last_site] [line 1069]
!3175 = !MDLocation(line: 1069, column: 9, scope: !477)
!3176 = !{!"0x100\00ref_row\001071\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [ref_row] [line 1071]
!3177 = !MDLocation(line: 1071, column: 9, scope: !477)
!3178 = !{!"0x100\00ref_col\001072\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [ref_col] [line 1072]
!3179 = !MDLocation(line: 1072, column: 9, scope: !477)
!3180 = !{!"0x100\00this_row_offset\001073\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [this_row_offset] [line 1073]
!3181 = !MDLocation(line: 1073, column: 9, scope: !477)
!3182 = !{!"0x100\00this_col_offset\001074\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [this_col_offset] [line 1074]
!3183 = !MDLocation(line: 1074, column: 9, scope: !477)
!3184 = !{!"0x100\00ss\001075\000", !477, !69, !305} ; [ DW_TAG_auto_variable ] [ss] [line 1075]
!3185 = !MDLocation(line: 1075, column: 18, scope: !477)
!3186 = !{!"0x100\00check_here\001077\000", !477, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1077]
!3187 = !MDLocation(line: 1077, column: 20, scope: !477)
!3188 = !{!"0x100\00mvsadcost\001079\000", !477, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1079]
!3189 = !MDLocation(line: 1079, column: 10, scope: !477)
!3190 = !{!"0x100\00fcenter_mv\001080\000", !477, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1080]
!3191 = !MDLocation(line: 1080, column: 12, scope: !477)
!3192 = !MDLocation(line: 1082, column: 20, scope: !477)
!3193 = !MDLocation(line: 1082, column: 5, scope: !477)
!3194 = !MDLocation(line: 1083, column: 20, scope: !477)
!3195 = !MDLocation(line: 1083, column: 5, scope: !477)
!3196 = !MDLocation(line: 1084, column: 28, scope: !477)
!3197 = !MDLocation(line: 1084, column: 5, scope: !477)
!3198 = !MDLocation(line: 1085, column: 28, scope: !477)
!3199 = !MDLocation(line: 1085, column: 5, scope: !477)
!3200 = !MDLocation(line: 1087, column: 18, scope: !477)
!3201 = !MDLocation(line: 1087, column: 26, scope: !477)
!3202 = !MDLocation(line: 1087, column: 41, scope: !477)
!3203 = !MDLocation(line: 1087, column: 56, scope: !477)
!3204 = !MDLocation(line: 1087, column: 71, scope: !477)
!3205 = !MDLocation(line: 1087, column: 5, scope: !477)
!3206 = !MDLocation(line: 1088, column: 15, scope: !477)
!3207 = !MDLocation(line: 1088, column: 5, scope: !477)
!3208 = !MDLocation(line: 1089, column: 15, scope: !477)
!3209 = !MDLocation(line: 1089, column: 5, scope: !477)
!3210 = !MDLocation(line: 1090, column: 6, scope: !477)
!3211 = !MDLocation(line: 1090, column: 5, scope: !477)
!3212 = !MDLocation(line: 1091, column: 26, scope: !477)
!3213 = !MDLocation(line: 1091, column: 5, scope: !477)
!3214 = !MDLocation(line: 1092, column: 26, scope: !477)
!3215 = !MDLocation(line: 1092, column: 5, scope: !477)
!3216 = !MDLocation(line: 1095, column: 33, scope: !477)
!3217 = !MDLocation(line: 1095, column: 44, scope: !477)
!3218 = !MDLocation(line: 1095, column: 57, scope: !477)
!3219 = !MDLocation(line: 1095, column: 67, scope: !477)
!3220 = !MDLocation(line: 1095, column: 81, scope: !477)
!3221 = !MDLocation(line: 1095, column: 5, scope: !477)
!3222 = !MDLocation(line: 1096, column: 20, scope: !477)
!3223 = !MDLocation(line: 1096, column: 5, scope: !477)
!3224 = !MDLocation(line: 1099, column: 15, scope: !477)
!3225 = !MDLocation(line: 1099, column: 27, scope: !477)
!3226 = !MDLocation(line: 1099, column: 33, scope: !477)
!3227 = !MDLocation(line: 1099, column: 46, scope: !477)
!3228 = !MDLocation(line: 1099, column: 55, scope: !477)
!3229 = !MDLocation(line: 1100, column: 30, scope: !477)
!3230 = !MDLocation(line: 1100, column: 52, scope: !477)
!3231 = !MDLocation(line: 1100, column: 63, scope: !477)
!3232 = !MDLocation(line: 1100, column: 15, scope: !477)
!3233 = !MDLocation(line: 1099, column: 5, scope: !477)
!3234 = !MDLocation(line: 1106, column: 17, scope: !477)
!3235 = !MDLocation(line: 1106, column: 32, scope: !477)
!3236 = !MDLocation(line: 1106, column: 10, scope: !477)
!3237 = !MDLocation(line: 1106, column: 11, scope: !477)
!3238 = !MDLocation(line: 1106, column: 5, scope: !477)
!3239 = !MDLocation(line: 1107, column: 18, scope: !477)
!3240 = !MDLocation(line: 1107, column: 32, scope: !477)
!3241 = !MDLocation(line: 1107, column: 56, scope: !477)
!3242 = !MDLocation(line: 1107, column: 17, scope: !477)
!3243 = !MDLocation(line: 1107, column: 5, scope: !477)
!3244 = !MDLocation(line: 1109, column: 5, scope: !477)
!3245 = !MDLocation(line: 1111, column: 10, scope: !3246)
!3246 = !{!"0xb\001111\005\00218", !1, !477}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3247 = !MDLocation(line: 1111, column: 20, scope: !3248)
!3248 = !{!"0xb\002", !1, !3249}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3249 = !{!"0xb\001", !1, !3250}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3250 = !{!"0xb\001111\005\00219", !1, !3246}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3251 = !MDLocation(line: 1111, column: 27, scope: !3250)
!3252 = !MDLocation(line: 1111, column: 20, scope: !3250)
!3253 = !MDLocation(line: 1111, column: 5, scope: !3246)
!3254 = !MDLocation(line: 1113, column: 14, scope: !3255)
!3255 = !{!"0xb\001113\009\00221", !1, !3256}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3256 = !{!"0xb\001112\005\00220", !1, !3250}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3257 = !MDLocation(line: 1113, column: 22, scope: !3258)
!3258 = !{!"0xb\002", !1, !3259}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3259 = !{!"0xb\001", !1, !3260}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3260 = !{!"0xb\001113\009\00222", !1, !3255}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3261 = !MDLocation(line: 1113, column: 26, scope: !3260)
!3262 = !MDLocation(line: 1113, column: 22, scope: !3260)
!3263 = !MDLocation(line: 1113, column: 9, scope: !3255)
!3264 = !MDLocation(line: 1116, column: 31, scope: !3265)
!3265 = !{!"0xb\001114\009\00223", !1, !3260}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3266 = !MDLocation(line: 1116, column: 55, scope: !3265)
!3267 = !MDLocation(line: 1116, column: 52, scope: !3265)
!3268 = !MDLocation(line: 1116, column: 13, scope: !3265)
!3269 = !MDLocation(line: 1117, column: 31, scope: !3265)
!3270 = !MDLocation(line: 1117, column: 55, scope: !3265)
!3271 = !MDLocation(line: 1117, column: 52, scope: !3265)
!3272 = !MDLocation(line: 1117, column: 13, scope: !3265)
!3273 = !MDLocation(line: 1119, column: 18, scope: !3274)
!3274 = !{!"0xb\001119\0017\00224", !1, !3265}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3275 = !MDLocation(line: 1119, column: 36, scope: !3274)
!3276 = !MDLocation(line: 1119, column: 17, scope: !3265)
!3277 = !MDLocation(line: 1119, column: 55, scope: !3278)
!3278 = !{!"0xb\001", !1, !3274}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3279 = !MDLocation(line: 1119, column: 73, scope: !3274)
!3280 = !MDLocation(line: 1119, column: 55, scope: !3274)
!3281 = !MDLocation(line: 1120, column: 14, scope: !3274)
!3282 = !MDLocation(line: 1120, column: 32, scope: !3274)
!3283 = !MDLocation(line: 1120, column: 51, scope: !3274)
!3284 = !MDLocation(line: 1120, column: 69, scope: !3274)
!3285 = !MDLocation(line: 1123, column: 33, scope: !3286)
!3286 = !{!"0xb\001122\0013\00225", !1, !3274}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3287 = !MDLocation(line: 1123, column: 30, scope: !3286)
!3288 = !MDLocation(line: 1123, column: 45, scope: !3286)
!3289 = !MDLocation(line: 1123, column: 17, scope: !3286)
!3290 = !MDLocation(line: 1124, column: 27, scope: !3286)
!3291 = !MDLocation(line: 1124, column: 39, scope: !3286)
!3292 = !MDLocation(line: 1124, column: 45, scope: !3286)
!3293 = !MDLocation(line: 1124, column: 58, scope: !3286)
!3294 = !MDLocation(line: 1124, column: 70, scope: !3286)
!3295 = !MDLocation(line: 1124, column: 86, scope: !3286)
!3296 = !MDLocation(line: 1124, column: 17, scope: !3286)
!3297 = !MDLocation(line: 1126, column: 21, scope: !3298)
!3298 = !{!"0xb\001126\0021\00226", !1, !3286}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3299 = !MDLocation(line: 1126, column: 31, scope: !3298)
!3300 = !MDLocation(line: 1126, column: 21, scope: !3286)
!3301 = !MDLocation(line: 1128, column: 41, scope: !3302)
!3302 = !{!"0xb\001127\0017\00227", !1, !3298}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3303 = !MDLocation(line: 1128, column: 21, scope: !3302)
!3304 = !MDLocation(line: 1129, column: 41, scope: !3302)
!3305 = !MDLocation(line: 1129, column: 21, scope: !3302)
!3306 = !MDLocation(line: 1131, column: 47, scope: !3302)
!3307 = !MDLocation(line: 1131, column: 58, scope: !3302)
!3308 = !MDLocation(line: 1130, column: 32, scope: !3302)
!3309 = !MDLocation(line: 1130, column: 21, scope: !3302)
!3310 = !MDLocation(line: 1133, column: 25, scope: !3311)
!3311 = !{!"0xb\001133\0025\00228", !1, !3302}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3312 = !MDLocation(line: 1133, column: 35, scope: !3311)
!3313 = !MDLocation(line: 1133, column: 25, scope: !3302)
!3314 = !MDLocation(line: 1135, column: 35, scope: !3315)
!3315 = !{!"0xb\001134\0021\00229", !1, !3311}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3316 = !MDLocation(line: 1135, column: 25, scope: !3315)
!3317 = !MDLocation(line: 1136, column: 37, scope: !3315)
!3318 = !MDLocation(line: 1136, column: 25, scope: !3315)
!3319 = !MDLocation(line: 1137, column: 21, scope: !3315)
!3320 = !MDLocation(line: 1138, column: 17, scope: !3302)
!3321 = !MDLocation(line: 1139, column: 13, scope: !3286)
!3322 = !MDLocation(line: 1141, column: 13, scope: !3265)
!3323 = !MDLocation(line: 1142, column: 9, scope: !3265)
!3324 = !MDLocation(line: 1113, column: 49, scope: !3260)
!3325 = !MDLocation(line: 1113, column: 9, scope: !3260)
!3326 = !MDLocation(line: 1144, column: 13, scope: !3327)
!3327 = !{!"0xb\001144\0013\00230", !1, !3256}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3328 = !MDLocation(line: 1144, column: 26, scope: !3327)
!3329 = !MDLocation(line: 1144, column: 13, scope: !3256)
!3330 = !MDLocation(line: 1146, column: 38, scope: !3331)
!3331 = !{!"0xb\001145\009\00231", !1, !3327}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3332 = !MDLocation(line: 1146, column: 35, scope: !3331)
!3333 = !MDLocation(line: 1146, column: 13, scope: !3331)
!3334 = !MDLocation(line: 1147, column: 38, scope: !3331)
!3335 = !MDLocation(line: 1147, column: 35, scope: !3331)
!3336 = !MDLocation(line: 1147, column: 13, scope: !3331)
!3337 = !MDLocation(line: 1148, column: 32, scope: !3331)
!3338 = !MDLocation(line: 1148, column: 29, scope: !3331)
!3339 = !MDLocation(line: 1148, column: 13, scope: !3331)
!3340 = !MDLocation(line: 1149, column: 25, scope: !3331)
!3341 = !MDLocation(line: 1149, column: 13, scope: !3331)
!3342 = !MDLocation(line: 1150, column: 9, scope: !3331)
!3343 = !MDLocation(line: 1151, column: 18, scope: !3344)
!3344 = !{!"0xb\001151\0018\00232", !1, !3327}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3345 = !MDLocation(line: 1151, column: 34, scope: !3344)
!3346 = !MDLocation(line: 1151, column: 18, scope: !3327)
!3347 = !MDLocation(line: 1152, column: 15, scope: !3344)
!3348 = !MDLocation(line: 1152, column: 13, scope: !3344)
!3349 = !MDLocation(line: 1153, column: 5, scope: !3256)
!3350 = !MDLocation(line: 1111, column: 39, scope: !3250)
!3351 = !MDLocation(line: 1111, column: 5, scope: !3250)
!3352 = !MDLocation(line: 1155, column: 25, scope: !477)
!3353 = !MDLocation(line: 1155, column: 5, scope: !477)
!3354 = !MDLocation(line: 1156, column: 25, scope: !477)
!3355 = !MDLocation(line: 1156, column: 5, scope: !477)
!3356 = !MDLocation(line: 1158, column: 12, scope: !477)
!3357 = !MDLocation(line: 1158, column: 23, scope: !477)
!3358 = !MDLocation(line: 1158, column: 29, scope: !477)
!3359 = !MDLocation(line: 1158, column: 42, scope: !477)
!3360 = !MDLocation(line: 1158, column: 56, scope: !477)
!3361 = !MDLocation(line: 1159, column: 36, scope: !477)
!3362 = !MDLocation(line: 1159, column: 47, scope: !477)
!3363 = !MDLocation(line: 1159, column: 55, scope: !477)
!3364 = !MDLocation(line: 1159, column: 14, scope: !477)
!3365 = !MDLocation(line: 1158, column: 5, scope: !477)
!3366 = !{!"0x101\00x\0016778380\000", !481, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1164]
!3367 = !MDLocation(line: 1164, column: 17, scope: !481)
!3368 = !{!"0x101\00b\0033555597\000", !481, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1165]
!3369 = !MDLocation(line: 1165, column: 12, scope: !481)
!3370 = !{!"0x101\00d\0050332814\000", !481, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1166]
!3371 = !MDLocation(line: 1166, column: 13, scope: !481)
!3372 = !{!"0x101\00ref_mv\0067110031\000", !481, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1167]
!3373 = !MDLocation(line: 1167, column: 13, scope: !481)
!3374 = !{!"0x101\00best_mv\0083887248\000", !481, !69, !73} ; [ DW_TAG_arg_variable ] [best_mv] [line 1168]
!3375 = !MDLocation(line: 1168, column: 13, scope: !481)
!3376 = !{!"0x101\00search_param\00100664465\000", !481, !69, !72} ; [ DW_TAG_arg_variable ] [search_param] [line 1169]
!3377 = !MDLocation(line: 1169, column: 9, scope: !481)
!3378 = !{!"0x101\00sad_per_bit\00117441682\000", !481, !69, !72} ; [ DW_TAG_arg_variable ] [sad_per_bit] [line 1170]
!3379 = !MDLocation(line: 1170, column: 9, scope: !481)
!3380 = !{!"0x101\00num00\00134218899\000", !481, !69, !89} ; [ DW_TAG_arg_variable ] [num00] [line 1171]
!3381 = !MDLocation(line: 1171, column: 10, scope: !481)
!3382 = !{!"0x101\00fn_ptr\00150996116\000", !481, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1172]
!3383 = !MDLocation(line: 1172, column: 28, scope: !481)
!3384 = !{!"0x101\00mvcost\00167773333\000", !481, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1173]
!3385 = !MDLocation(line: 1173, column: 10, scope: !481)
!3386 = !{!"0x101\00center_mv\00184550550\000", !481, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1174]
!3387 = !MDLocation(line: 1174, column: 13, scope: !481)
!3388 = !{!"0x100\00i\001177\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1177]
!3389 = !MDLocation(line: 1177, column: 9, scope: !481)
!3390 = !{!"0x100\00j\001177\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [j] [line 1177]
!3391 = !MDLocation(line: 1177, column: 12, scope: !481)
!3392 = !{!"0x100\00step\001177\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [step] [line 1177]
!3393 = !MDLocation(line: 1177, column: 15, scope: !481)
!3394 = !{!"0x100\00what\001179\000", !481, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1179]
!3395 = !MDLocation(line: 1179, column: 20, scope: !481)
!3396 = !MDLocation(line: 1179, column: 30, scope: !481)
!3397 = !MDLocation(line: 1179, column: 28, scope: !481)
!3398 = !MDLocation(line: 1179, column: 45, scope: !481)
!3399 = !{!"0x100\00what_stride\001180\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1180]
!3400 = !MDLocation(line: 1180, column: 9, scope: !481)
!3401 = !MDLocation(line: 1180, column: 23, scope: !481)
!3402 = !{!"0x100\00in_what\001181\000", !481, !69, !60} ; [ DW_TAG_auto_variable ] [in_what] [line 1181]
!3403 = !MDLocation(line: 1181, column: 20, scope: !481)
!3404 = !{!"0x100\00pre_stride\001182\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1182]
!3405 = !MDLocation(line: 1182, column: 9, scope: !481)
!3406 = !MDLocation(line: 1182, column: 22, scope: !481)
!3407 = !{!"0x100\00base_pre\001183\000", !481, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1183]
!3408 = !MDLocation(line: 1183, column: 20, scope: !481)
!3409 = !MDLocation(line: 1183, column: 31, scope: !481)
!3410 = !{!"0x100\00in_what_stride\001184\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1184]
!3411 = !MDLocation(line: 1184, column: 9, scope: !481)
!3412 = !MDLocation(line: 1184, column: 26, scope: !481)
!3413 = !{!"0x100\00best_address\001185\000", !481, !69, !60} ; [ DW_TAG_auto_variable ] [best_address] [line 1185]
!3414 = !MDLocation(line: 1185, column: 20, scope: !481)
!3415 = !{!"0x100\00tot_steps\001187\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [tot_steps] [line 1187]
!3416 = !MDLocation(line: 1187, column: 9, scope: !481)
!3417 = !{!"0x100\00this_mv\001188\000", !481, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1188]
!3418 = !MDLocation(line: 1188, column: 12, scope: !481)
!3419 = !{!"0x100\00bestsad\001190\000", !481, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1190]
!3420 = !MDLocation(line: 1190, column: 18, scope: !481)
!3421 = !{!"0x100\00thissad\001191\000", !481, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1191]
!3422 = !MDLocation(line: 1191, column: 18, scope: !481)
!3423 = !{!"0x100\00best_site\001192\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [best_site] [line 1192]
!3424 = !MDLocation(line: 1192, column: 9, scope: !481)
!3425 = !{!"0x100\00last_site\001193\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [last_site] [line 1193]
!3426 = !MDLocation(line: 1193, column: 9, scope: !481)
!3427 = !{!"0x100\00ref_row\001195\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [ref_row] [line 1195]
!3428 = !MDLocation(line: 1195, column: 9, scope: !481)
!3429 = !{!"0x100\00ref_col\001196\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [ref_col] [line 1196]
!3430 = !MDLocation(line: 1196, column: 9, scope: !481)
!3431 = !{!"0x100\00this_row_offset\001197\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [this_row_offset] [line 1197]
!3432 = !MDLocation(line: 1197, column: 9, scope: !481)
!3433 = !{!"0x100\00this_col_offset\001198\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [this_col_offset] [line 1198]
!3434 = !MDLocation(line: 1198, column: 9, scope: !481)
!3435 = !{!"0x100\00ss\001199\000", !481, !69, !305} ; [ DW_TAG_auto_variable ] [ss] [line 1199]
!3436 = !MDLocation(line: 1199, column: 18, scope: !481)
!3437 = !{!"0x100\00check_here\001201\000", !481, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1201]
!3438 = !MDLocation(line: 1201, column: 20, scope: !481)
!3439 = !{!"0x100\00mvsadcost\001203\000", !481, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1203]
!3440 = !MDLocation(line: 1203, column: 10, scope: !481)
!3441 = !{!"0x100\00fcenter_mv\001204\000", !481, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1204]
!3442 = !MDLocation(line: 1204, column: 12, scope: !481)
!3443 = !MDLocation(line: 1206, column: 20, scope: !481)
!3444 = !MDLocation(line: 1206, column: 5, scope: !481)
!3445 = !MDLocation(line: 1207, column: 20, scope: !481)
!3446 = !MDLocation(line: 1207, column: 5, scope: !481)
!3447 = !MDLocation(line: 1208, column: 28, scope: !481)
!3448 = !MDLocation(line: 1208, column: 5, scope: !481)
!3449 = !MDLocation(line: 1209, column: 28, scope: !481)
!3450 = !MDLocation(line: 1209, column: 5, scope: !481)
!3451 = !MDLocation(line: 1211, column: 18, scope: !481)
!3452 = !MDLocation(line: 1211, column: 26, scope: !481)
!3453 = !MDLocation(line: 1211, column: 41, scope: !481)
!3454 = !MDLocation(line: 1211, column: 56, scope: !481)
!3455 = !MDLocation(line: 1211, column: 71, scope: !481)
!3456 = !MDLocation(line: 1211, column: 5, scope: !481)
!3457 = !MDLocation(line: 1212, column: 15, scope: !481)
!3458 = !MDLocation(line: 1212, column: 5, scope: !481)
!3459 = !MDLocation(line: 1213, column: 15, scope: !481)
!3460 = !MDLocation(line: 1213, column: 5, scope: !481)
!3461 = !MDLocation(line: 1214, column: 6, scope: !481)
!3462 = !MDLocation(line: 1214, column: 5, scope: !481)
!3463 = !MDLocation(line: 1215, column: 26, scope: !481)
!3464 = !MDLocation(line: 1215, column: 5, scope: !481)
!3465 = !MDLocation(line: 1216, column: 26, scope: !481)
!3466 = !MDLocation(line: 1216, column: 5, scope: !481)
!3467 = !MDLocation(line: 1219, column: 33, scope: !481)
!3468 = !MDLocation(line: 1219, column: 44, scope: !481)
!3469 = !MDLocation(line: 1219, column: 57, scope: !481)
!3470 = !MDLocation(line: 1219, column: 67, scope: !481)
!3471 = !MDLocation(line: 1219, column: 81, scope: !481)
!3472 = !MDLocation(line: 1219, column: 5, scope: !481)
!3473 = !MDLocation(line: 1220, column: 20, scope: !481)
!3474 = !MDLocation(line: 1220, column: 5, scope: !481)
!3475 = !MDLocation(line: 1223, column: 15, scope: !481)
!3476 = !MDLocation(line: 1223, column: 27, scope: !481)
!3477 = !MDLocation(line: 1223, column: 33, scope: !481)
!3478 = !MDLocation(line: 1223, column: 46, scope: !481)
!3479 = !MDLocation(line: 1223, column: 55, scope: !481)
!3480 = !MDLocation(line: 1224, column: 30, scope: !481)
!3481 = !MDLocation(line: 1224, column: 52, scope: !481)
!3482 = !MDLocation(line: 1224, column: 63, scope: !481)
!3483 = !MDLocation(line: 1224, column: 15, scope: !481)
!3484 = !MDLocation(line: 1223, column: 5, scope: !481)
!3485 = !MDLocation(line: 1230, column: 17, scope: !481)
!3486 = !MDLocation(line: 1230, column: 32, scope: !481)
!3487 = !MDLocation(line: 1230, column: 10, scope: !481)
!3488 = !MDLocation(line: 1230, column: 11, scope: !481)
!3489 = !MDLocation(line: 1230, column: 5, scope: !481)
!3490 = !MDLocation(line: 1231, column: 18, scope: !481)
!3491 = !MDLocation(line: 1231, column: 32, scope: !481)
!3492 = !MDLocation(line: 1231, column: 56, scope: !481)
!3493 = !MDLocation(line: 1231, column: 17, scope: !481)
!3494 = !MDLocation(line: 1231, column: 5, scope: !481)
!3495 = !MDLocation(line: 1233, column: 5, scope: !481)
!3496 = !MDLocation(line: 1235, column: 10, scope: !3497)
!3497 = !{!"0xb\001235\005\00233", !1, !481}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3498 = !MDLocation(line: 1235, column: 20, scope: !3499)
!3499 = !{!"0xb\002", !1, !3500}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3500 = !{!"0xb\001", !1, !3501}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3501 = !{!"0xb\001235\005\00234", !1, !3497}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3502 = !MDLocation(line: 1235, column: 27, scope: !3501)
!3503 = !MDLocation(line: 1235, column: 20, scope: !3501)
!3504 = !MDLocation(line: 1235, column: 5, scope: !3497)
!3505 = !{!"0x100\00all_in\001237\000", !3506, !69, !72} ; [ DW_TAG_auto_variable ] [all_in] [line 1237]
!3506 = !{!"0xb\001236\005\00235", !1, !3501}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3507 = !MDLocation(line: 1237, column: 13, scope: !3506)
!3508 = !{!"0x100\00t\001237\000", !3506, !69, !72} ; [ DW_TAG_auto_variable ] [t] [line 1237]
!3509 = !MDLocation(line: 1237, column: 25, scope: !3506)
!3510 = !MDLocation(line: 1243, column: 21, scope: !3506)
!3511 = !MDLocation(line: 1243, column: 45, scope: !3506)
!3512 = !MDLocation(line: 1243, column: 42, scope: !3506)
!3513 = !MDLocation(line: 1243, column: 57, scope: !3506)
!3514 = !MDLocation(line: 1243, column: 20, scope: !3506)
!3515 = !MDLocation(line: 1243, column: 9, scope: !3506)
!3516 = !MDLocation(line: 1244, column: 21, scope: !3506)
!3517 = !MDLocation(line: 1244, column: 45, scope: !3506)
!3518 = !MDLocation(line: 1244, column: 42, scope: !3506)
!3519 = !MDLocation(line: 1244, column: 60, scope: !3506)
!3520 = !MDLocation(line: 1244, column: 20, scope: !3506)
!3521 = !MDLocation(line: 1244, column: 9, scope: !3506)
!3522 = !MDLocation(line: 1245, column: 21, scope: !3506)
!3523 = !MDLocation(line: 1245, column: 45, scope: !3506)
!3524 = !MDLocation(line: 1245, column: 42, scope: !3506)
!3525 = !MDLocation(line: 1245, column: 60, scope: !3506)
!3526 = !MDLocation(line: 1245, column: 20, scope: !3506)
!3527 = !MDLocation(line: 1245, column: 9, scope: !3506)
!3528 = !MDLocation(line: 1246, column: 21, scope: !3506)
!3529 = !MDLocation(line: 1246, column: 45, scope: !3506)
!3530 = !MDLocation(line: 1246, column: 42, scope: !3506)
!3531 = !MDLocation(line: 1246, column: 60, scope: !3506)
!3532 = !MDLocation(line: 1246, column: 20, scope: !3506)
!3533 = !MDLocation(line: 1246, column: 9, scope: !3506)
!3534 = !MDLocation(line: 1248, column: 13, scope: !3535)
!3535 = !{!"0xb\001248\0013\00236", !1, !3506}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3536 = !MDLocation(line: 1248, column: 13, scope: !3506)
!3537 = !{!"0x100\00sad_array\001250\000", !3538, !69, !3539} ; [ DW_TAG_auto_variable ] [sad_array] [line 1250]
!3538 = !{!"0xb\001249\009\00237", !1, !3535}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3539 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !80, !243, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from unsigned int]
!3540 = !MDLocation(line: 1250, column: 26, scope: !3538)
!3541 = !MDLocation(line: 1252, column: 18, scope: !3542)
!3542 = !{!"0xb\001252\0013\00238", !1, !3538}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3543 = !MDLocation(line: 1252, column: 26, scope: !3544)
!3544 = !{!"0xb\002", !1, !3545}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3545 = !{!"0xb\001", !1, !3546}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3546 = !{!"0xb\001252\0013\00239", !1, !3542}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3547 = !MDLocation(line: 1252, column: 30, scope: !3546)
!3548 = !MDLocation(line: 1252, column: 26, scope: !3546)
!3549 = !MDLocation(line: 1252, column: 13, scope: !3542)
!3550 = !{!"0x100\00block_offset\001254\000", !3551, !69, !3552} ; [ DW_TAG_auto_variable ] [block_offset] [line 1254]
!3551 = !{!"0xb\001253\0013\00240", !1, !3546}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3552 = !{!"0x1\00\000\00256\0064\000\000\000", null, null, !435, !243, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from ]
!3553 = !MDLocation(line: 1254, column: 38, scope: !3551)
!3554 = !MDLocation(line: 1256, column: 22, scope: !3555)
!3555 = !{!"0xb\001256\0017\00241", !1, !3551}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3556 = !MDLocation(line: 1256, column: 29, scope: !3557)
!3557 = !{!"0xb\002", !1, !3558}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3558 = !{!"0xb\001", !1, !3559}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3559 = !{!"0xb\001256\0017\00242", !1, !3555}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3560 = !MDLocation(line: 1256, column: 17, scope: !3555)
!3561 = !MDLocation(line: 1257, column: 42, scope: !3559)
!3562 = !MDLocation(line: 1257, column: 44, scope: !3559)
!3563 = !MDLocation(line: 1257, column: 39, scope: !3559)
!3564 = !MDLocation(line: 1257, column: 56, scope: !3559)
!3565 = !MDLocation(line: 1257, column: 34, scope: !3559)
!3566 = !MDLocation(line: 1257, column: 21, scope: !3559)
!3567 = !MDLocation(line: 1256, column: 36, scope: !3559)
!3568 = !MDLocation(line: 1256, column: 17, scope: !3559)
!3569 = !MDLocation(line: 1259, column: 17, scope: !3551)
!3570 = !MDLocation(line: 1259, column: 32, scope: !3551)
!3571 = !MDLocation(line: 1259, column: 38, scope: !3551)
!3572 = !MDLocation(line: 1259, column: 51, scope: !3551)
!3573 = !MDLocation(line: 1259, column: 65, scope: !3551)
!3574 = !MDLocation(line: 1259, column: 81, scope: !3551)
!3575 = !MDLocation(line: 1261, column: 22, scope: !3576)
!3576 = !{!"0xb\001261\0017\00243", !1, !3551}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3577 = !MDLocation(line: 1261, column: 29, scope: !3578)
!3578 = !{!"0xb\002", !1, !3579}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3579 = !{!"0xb\001", !1, !3580}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3580 = !{!"0xb\001261\0017\00244", !1, !3576}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3581 = !MDLocation(line: 1261, column: 17, scope: !3576)
!3582 = !MDLocation(line: 1263, column: 35, scope: !3583)
!3583 = !{!"0xb\001263\0025\00246", !1, !3584}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3584 = !{!"0xb\001262\0017\00245", !1, !3580}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3585 = !MDLocation(line: 1263, column: 25, scope: !3583)
!3586 = !MDLocation(line: 1263, column: 40, scope: !3583)
!3587 = !MDLocation(line: 1263, column: 25, scope: !3584)
!3588 = !MDLocation(line: 1265, column: 45, scope: !3589)
!3589 = !{!"0xb\001264\0021\00247", !1, !3583}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3590 = !MDLocation(line: 1265, column: 69, scope: !3589)
!3591 = !MDLocation(line: 1265, column: 66, scope: !3589)
!3592 = !MDLocation(line: 1265, column: 25, scope: !3589)
!3593 = !MDLocation(line: 1266, column: 45, scope: !3589)
!3594 = !MDLocation(line: 1266, column: 69, scope: !3589)
!3595 = !MDLocation(line: 1266, column: 66, scope: !3589)
!3596 = !MDLocation(line: 1266, column: 25, scope: !3589)
!3597 = !MDLocation(line: 1268, column: 56, scope: !3589)
!3598 = !MDLocation(line: 1268, column: 67, scope: !3589)
!3599 = !MDLocation(line: 1267, column: 41, scope: !3589)
!3600 = !MDLocation(line: 1267, column: 35, scope: !3589)
!3601 = !MDLocation(line: 1267, column: 25, scope: !3589)
!3602 = !MDLocation(line: 1270, column: 39, scope: !3603)
!3603 = !{!"0xb\001270\0029\00248", !1, !3589}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3604 = !MDLocation(line: 1270, column: 29, scope: !3603)
!3605 = !MDLocation(line: 1270, column: 44, scope: !3603)
!3606 = !MDLocation(line: 1270, column: 29, scope: !3589)
!3607 = !MDLocation(line: 1272, column: 49, scope: !3608)
!3608 = !{!"0xb\001271\0025\00249", !1, !3603}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3609 = !MDLocation(line: 1272, column: 39, scope: !3608)
!3610 = !MDLocation(line: 1272, column: 29, scope: !3608)
!3611 = !MDLocation(line: 1273, column: 41, scope: !3608)
!3612 = !MDLocation(line: 1273, column: 29, scope: !3608)
!3613 = !MDLocation(line: 1274, column: 25, scope: !3608)
!3614 = !MDLocation(line: 1275, column: 21, scope: !3589)
!3615 = !MDLocation(line: 1276, column: 17, scope: !3584)
!3616 = !MDLocation(line: 1261, column: 36, scope: !3580)
!3617 = !MDLocation(line: 1261, column: 41, scope: !3580)
!3618 = !MDLocation(line: 1261, column: 17, scope: !3580)
!3619 = !MDLocation(line: 1277, column: 13, scope: !3551)
!3620 = !MDLocation(line: 1252, column: 53, scope: !3546)
!3621 = !MDLocation(line: 1252, column: 13, scope: !3546)
!3622 = !MDLocation(line: 1278, column: 9, scope: !3538)
!3623 = !MDLocation(line: 1281, column: 18, scope: !3624)
!3624 = !{!"0xb\001281\0013\00251", !1, !3625}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3625 = !{!"0xb\001280\009\00250", !1, !3535}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3626 = !MDLocation(line: 1281, column: 26, scope: !3627)
!3627 = !{!"0xb\002", !1, !3628}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3628 = !{!"0xb\001", !1, !3629}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3629 = !{!"0xb\001281\0013\00252", !1, !3624}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3630 = !MDLocation(line: 1281, column: 30, scope: !3629)
!3631 = !MDLocation(line: 1281, column: 26, scope: !3629)
!3632 = !MDLocation(line: 1281, column: 13, scope: !3624)
!3633 = !MDLocation(line: 1284, column: 35, scope: !3634)
!3634 = !{!"0xb\001282\0013\00253", !1, !3629}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3635 = !MDLocation(line: 1284, column: 59, scope: !3634)
!3636 = !MDLocation(line: 1284, column: 56, scope: !3634)
!3637 = !MDLocation(line: 1284, column: 17, scope: !3634)
!3638 = !MDLocation(line: 1285, column: 35, scope: !3634)
!3639 = !MDLocation(line: 1285, column: 59, scope: !3634)
!3640 = !MDLocation(line: 1285, column: 56, scope: !3634)
!3641 = !MDLocation(line: 1285, column: 17, scope: !3634)
!3642 = !MDLocation(line: 1287, column: 22, scope: !3643)
!3643 = !{!"0xb\001287\0021\00254", !1, !3634}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3644 = !MDLocation(line: 1287, column: 40, scope: !3643)
!3645 = !MDLocation(line: 1287, column: 21, scope: !3634)
!3646 = !MDLocation(line: 1287, column: 59, scope: !3647)
!3647 = !{!"0xb\001", !1, !3643}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3648 = !MDLocation(line: 1287, column: 77, scope: !3643)
!3649 = !MDLocation(line: 1287, column: 59, scope: !3643)
!3650 = !MDLocation(line: 1288, column: 18, scope: !3643)
!3651 = !MDLocation(line: 1288, column: 36, scope: !3643)
!3652 = !MDLocation(line: 1288, column: 55, scope: !3643)
!3653 = !MDLocation(line: 1288, column: 73, scope: !3643)
!3654 = !MDLocation(line: 1290, column: 37, scope: !3655)
!3655 = !{!"0xb\001289\0017\00255", !1, !3643}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3656 = !MDLocation(line: 1290, column: 34, scope: !3655)
!3657 = !MDLocation(line: 1290, column: 49, scope: !3655)
!3658 = !MDLocation(line: 1290, column: 21, scope: !3655)
!3659 = !MDLocation(line: 1291, column: 31, scope: !3655)
!3660 = !MDLocation(line: 1291, column: 43, scope: !3655)
!3661 = !MDLocation(line: 1291, column: 49, scope: !3655)
!3662 = !MDLocation(line: 1291, column: 62, scope: !3655)
!3663 = !MDLocation(line: 1291, column: 74, scope: !3655)
!3664 = !MDLocation(line: 1291, column: 90, scope: !3655)
!3665 = !MDLocation(line: 1291, column: 21, scope: !3655)
!3666 = !MDLocation(line: 1293, column: 25, scope: !3667)
!3667 = !{!"0xb\001293\0025\00256", !1, !3655}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3668 = !MDLocation(line: 1293, column: 35, scope: !3667)
!3669 = !MDLocation(line: 1293, column: 25, scope: !3655)
!3670 = !MDLocation(line: 1295, column: 45, scope: !3671)
!3671 = !{!"0xb\001294\0021\00257", !1, !3667}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3672 = !MDLocation(line: 1295, column: 25, scope: !3671)
!3673 = !MDLocation(line: 1296, column: 45, scope: !3671)
!3674 = !MDLocation(line: 1296, column: 25, scope: !3671)
!3675 = !MDLocation(line: 1298, column: 51, scope: !3671)
!3676 = !MDLocation(line: 1298, column: 62, scope: !3671)
!3677 = !MDLocation(line: 1297, column: 36, scope: !3671)
!3678 = !MDLocation(line: 1297, column: 25, scope: !3671)
!3679 = !MDLocation(line: 1300, column: 29, scope: !3680)
!3680 = !{!"0xb\001300\0029\00258", !1, !3671}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3681 = !MDLocation(line: 1300, column: 39, scope: !3680)
!3682 = !MDLocation(line: 1300, column: 29, scope: !3671)
!3683 = !MDLocation(line: 1302, column: 39, scope: !3684)
!3684 = !{!"0xb\001301\0025\00259", !1, !3680}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3685 = !MDLocation(line: 1302, column: 29, scope: !3684)
!3686 = !MDLocation(line: 1303, column: 41, scope: !3684)
!3687 = !MDLocation(line: 1303, column: 29, scope: !3684)
!3688 = !MDLocation(line: 1304, column: 25, scope: !3684)
!3689 = !MDLocation(line: 1305, column: 21, scope: !3671)
!3690 = !MDLocation(line: 1306, column: 17, scope: !3655)
!3691 = !MDLocation(line: 1307, column: 17, scope: !3634)
!3692 = !MDLocation(line: 1308, column: 13, scope: !3634)
!3693 = !MDLocation(line: 1281, column: 53, scope: !3629)
!3694 = !MDLocation(line: 1281, column: 13, scope: !3629)
!3695 = !MDLocation(line: 1311, column: 13, scope: !3696)
!3696 = !{!"0xb\001311\0013\00260", !1, !3506}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3697 = !MDLocation(line: 1311, column: 26, scope: !3696)
!3698 = !MDLocation(line: 1311, column: 13, scope: !3506)
!3699 = !MDLocation(line: 1313, column: 38, scope: !3700)
!3700 = !{!"0xb\001312\009\00261", !1, !3696}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3701 = !MDLocation(line: 1313, column: 35, scope: !3700)
!3702 = !MDLocation(line: 1313, column: 13, scope: !3700)
!3703 = !MDLocation(line: 1314, column: 38, scope: !3700)
!3704 = !MDLocation(line: 1314, column: 35, scope: !3700)
!3705 = !MDLocation(line: 1314, column: 13, scope: !3700)
!3706 = !MDLocation(line: 1315, column: 32, scope: !3700)
!3707 = !MDLocation(line: 1315, column: 29, scope: !3700)
!3708 = !MDLocation(line: 1315, column: 13, scope: !3700)
!3709 = !MDLocation(line: 1316, column: 25, scope: !3700)
!3710 = !MDLocation(line: 1316, column: 13, scope: !3700)
!3711 = !MDLocation(line: 1317, column: 9, scope: !3700)
!3712 = !MDLocation(line: 1318, column: 18, scope: !3713)
!3713 = !{!"0xb\001318\0018\00262", !1, !3696}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3714 = !MDLocation(line: 1318, column: 34, scope: !3713)
!3715 = !MDLocation(line: 1318, column: 18, scope: !3696)
!3716 = !MDLocation(line: 1319, column: 15, scope: !3713)
!3717 = !MDLocation(line: 1319, column: 13, scope: !3713)
!3718 = !MDLocation(line: 1320, column: 5, scope: !3506)
!3719 = !MDLocation(line: 1235, column: 39, scope: !3501)
!3720 = !MDLocation(line: 1235, column: 5, scope: !3501)
!3721 = !MDLocation(line: 1322, column: 25, scope: !481)
!3722 = !MDLocation(line: 1322, column: 5, scope: !481)
!3723 = !MDLocation(line: 1323, column: 25, scope: !481)
!3724 = !MDLocation(line: 1323, column: 5, scope: !481)
!3725 = !MDLocation(line: 1325, column: 12, scope: !481)
!3726 = !MDLocation(line: 1325, column: 23, scope: !481)
!3727 = !MDLocation(line: 1325, column: 29, scope: !481)
!3728 = !MDLocation(line: 1325, column: 42, scope: !481)
!3729 = !MDLocation(line: 1325, column: 56, scope: !481)
!3730 = !MDLocation(line: 1326, column: 36, scope: !481)
!3731 = !MDLocation(line: 1326, column: 47, scope: !481)
!3732 = !MDLocation(line: 1326, column: 55, scope: !481)
!3733 = !MDLocation(line: 1326, column: 14, scope: !481)
!3734 = !MDLocation(line: 1325, column: 5, scope: !481)
!3735 = !{!"0x101\00x\0016778545\000", !482, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1329]
!3736 = !MDLocation(line: 1329, column: 39, scope: !482)
!3737 = !{!"0x101\00b\0033555761\000", !482, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1329]
!3738 = !MDLocation(line: 1329, column: 49, scope: !482)
!3739 = !{!"0x101\00d\0050332977\000", !482, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1329]
!3740 = !MDLocation(line: 1329, column: 60, scope: !482)
!3741 = !{!"0x101\00ref_mv\0067110193\000", !482, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1329]
!3742 = !MDLocation(line: 1329, column: 71, scope: !482)
!3743 = !{!"0x101\00sad_per_bit\0083887410\000", !482, !69, !72} ; [ DW_TAG_arg_variable ] [sad_per_bit] [line 1330]
!3744 = !MDLocation(line: 1330, column: 29, scope: !482)
!3745 = !{!"0x101\00distance\00100664626\000", !482, !69, !72} ; [ DW_TAG_arg_variable ] [distance] [line 1330]
!3746 = !MDLocation(line: 1330, column: 46, scope: !482)
!3747 = !{!"0x101\00fn_ptr\00117441843\000", !482, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1331]
!3748 = !MDLocation(line: 1331, column: 48, scope: !482)
!3749 = !{!"0x101\00mvcost\00134219059\000", !482, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1331]
!3750 = !MDLocation(line: 1331, column: 61, scope: !482)
!3751 = !{!"0x101\00center_mv\00150996276\000", !482, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1332]
!3752 = !MDLocation(line: 1332, column: 33, scope: !482)
!3753 = !{!"0x100\00what\001334\000", !482, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1334]
!3754 = !MDLocation(line: 1334, column: 20, scope: !482)
!3755 = !MDLocation(line: 1334, column: 30, scope: !482)
!3756 = !MDLocation(line: 1334, column: 28, scope: !482)
!3757 = !MDLocation(line: 1334, column: 45, scope: !482)
!3758 = !{!"0x100\00what_stride\001335\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1335]
!3759 = !MDLocation(line: 1335, column: 9, scope: !482)
!3760 = !MDLocation(line: 1335, column: 23, scope: !482)
!3761 = !{!"0x100\00in_what\001336\000", !482, !69, !60} ; [ DW_TAG_auto_variable ] [in_what] [line 1336]
!3762 = !MDLocation(line: 1336, column: 20, scope: !482)
!3763 = !{!"0x100\00pre_stride\001337\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1337]
!3764 = !MDLocation(line: 1337, column: 9, scope: !482)
!3765 = !MDLocation(line: 1337, column: 22, scope: !482)
!3766 = !{!"0x100\00base_pre\001338\000", !482, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1338]
!3767 = !MDLocation(line: 1338, column: 20, scope: !482)
!3768 = !MDLocation(line: 1338, column: 31, scope: !482)
!3769 = !{!"0x100\00in_what_stride\001339\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1339]
!3770 = !MDLocation(line: 1339, column: 9, scope: !482)
!3771 = !MDLocation(line: 1339, column: 26, scope: !482)
!3772 = !{!"0x100\00mv_stride\001340\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [mv_stride] [line 1340]
!3773 = !MDLocation(line: 1340, column: 9, scope: !482)
!3774 = !MDLocation(line: 1340, column: 21, scope: !482)
!3775 = !{!"0x100\00bestaddress\001341\000", !482, !69, !60} ; [ DW_TAG_auto_variable ] [bestaddress] [line 1341]
!3776 = !MDLocation(line: 1341, column: 20, scope: !482)
!3777 = !{!"0x100\00best_mv\001342\000", !482, !69, !73} ; [ DW_TAG_auto_variable ] [best_mv] [line 1342]
!3778 = !MDLocation(line: 1342, column: 13, scope: !482)
!3779 = !MDLocation(line: 1342, column: 24, scope: !482)
!3780 = !MDLocation(line: 1342, column: 23, scope: !482)
!3781 = !{!"0x100\00this_mv\001343\000", !482, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1343]
!3782 = !MDLocation(line: 1343, column: 12, scope: !482)
!3783 = !{!"0x100\00bestsad\001344\000", !482, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1344]
!3784 = !MDLocation(line: 1344, column: 18, scope: !482)
!3785 = !{!"0x100\00thissad\001345\000", !482, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1345]
!3786 = !MDLocation(line: 1345, column: 18, scope: !482)
!3787 = !{!"0x100\00r\001346\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [r] [line 1346]
!3788 = !MDLocation(line: 1346, column: 9, scope: !482)
!3789 = !{!"0x100\00c\001346\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [c] [line 1346]
!3790 = !MDLocation(line: 1346, column: 12, scope: !482)
!3791 = !{!"0x100\00check_here\001348\000", !482, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1348]
!3792 = !MDLocation(line: 1348, column: 20, scope: !482)
!3793 = !{!"0x100\00ref_row\001350\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [ref_row] [line 1350]
!3794 = !MDLocation(line: 1350, column: 9, scope: !482)
!3795 = !MDLocation(line: 1350, column: 19, scope: !482)
!3796 = !{!"0x100\00ref_col\001351\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [ref_col] [line 1351]
!3797 = !MDLocation(line: 1351, column: 9, scope: !482)
!3798 = !MDLocation(line: 1351, column: 19, scope: !482)
!3799 = !{!"0x100\00row_min\001353\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [row_min] [line 1353]
!3800 = !MDLocation(line: 1353, column: 9, scope: !482)
!3801 = !MDLocation(line: 1353, column: 19, scope: !482)
!3802 = !MDLocation(line: 1353, column: 29, scope: !482)
!3803 = !{!"0x100\00row_max\001354\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [row_max] [line 1354]
!3804 = !MDLocation(line: 1354, column: 9, scope: !482)
!3805 = !MDLocation(line: 1354, column: 19, scope: !482)
!3806 = !MDLocation(line: 1354, column: 29, scope: !482)
!3807 = !{!"0x100\00col_min\001355\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [col_min] [line 1355]
!3808 = !MDLocation(line: 1355, column: 9, scope: !482)
!3809 = !MDLocation(line: 1355, column: 19, scope: !482)
!3810 = !MDLocation(line: 1355, column: 29, scope: !482)
!3811 = !{!"0x100\00col_max\001356\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [col_max] [line 1356]
!3812 = !MDLocation(line: 1356, column: 9, scope: !482)
!3813 = !MDLocation(line: 1356, column: 19, scope: !482)
!3814 = !MDLocation(line: 1356, column: 29, scope: !482)
!3815 = !{!"0x100\00mvsadcost\001358\000", !482, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1358]
!3816 = !MDLocation(line: 1358, column: 10, scope: !482)
!3817 = !{!"0x100\00fcenter_mv\001359\000", !482, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1359]
!3818 = !MDLocation(line: 1359, column: 12, scope: !482)
!3819 = !MDLocation(line: 1361, column: 20, scope: !482)
!3820 = !MDLocation(line: 1361, column: 5, scope: !482)
!3821 = !MDLocation(line: 1362, column: 20, scope: !482)
!3822 = !MDLocation(line: 1362, column: 5, scope: !482)
!3823 = !MDLocation(line: 1363, column: 28, scope: !482)
!3824 = !MDLocation(line: 1363, column: 5, scope: !482)
!3825 = !MDLocation(line: 1364, column: 28, scope: !482)
!3826 = !MDLocation(line: 1364, column: 5, scope: !482)
!3827 = !MDLocation(line: 1367, column: 15, scope: !482)
!3828 = !MDLocation(line: 1367, column: 26, scope: !482)
!3829 = !MDLocation(line: 1367, column: 5, scope: !482)
!3830 = !MDLocation(line: 1368, column: 19, scope: !482)
!3831 = !MDLocation(line: 1368, column: 30, scope: !482)
!3832 = !MDLocation(line: 1368, column: 40, scope: !482)
!3833 = !MDLocation(line: 1368, column: 54, scope: !482)
!3834 = !MDLocation(line: 1368, column: 5, scope: !482)
!3835 = !MDLocation(line: 1370, column: 26, scope: !482)
!3836 = !MDLocation(line: 1370, column: 5, scope: !482)
!3837 = !MDLocation(line: 1371, column: 26, scope: !482)
!3838 = !MDLocation(line: 1371, column: 5, scope: !482)
!3839 = !MDLocation(line: 1374, column: 15, scope: !482)
!3840 = !MDLocation(line: 1374, column: 27, scope: !482)
!3841 = !MDLocation(line: 1374, column: 33, scope: !482)
!3842 = !MDLocation(line: 1374, column: 46, scope: !482)
!3843 = !MDLocation(line: 1375, column: 27, scope: !482)
!3844 = !MDLocation(line: 1376, column: 30, scope: !482)
!3845 = !MDLocation(line: 1376, column: 52, scope: !482)
!3846 = !MDLocation(line: 1376, column: 63, scope: !482)
!3847 = !MDLocation(line: 1376, column: 15, scope: !482)
!3848 = !MDLocation(line: 1374, column: 5, scope: !482)
!3849 = !MDLocation(line: 1381, column: 9, scope: !3850)
!3850 = !{!"0xb\001381\009\00263", !1, !482}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3851 = !MDLocation(line: 1381, column: 19, scope: !3850)
!3852 = !MDLocation(line: 1381, column: 9, scope: !482)
!3853 = !MDLocation(line: 1382, column: 19, scope: !3850)
!3854 = !MDLocation(line: 1382, column: 9, scope: !3850)
!3855 = !MDLocation(line: 1384, column: 9, scope: !3856)
!3856 = !{!"0xb\001384\009\00264", !1, !482}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3857 = !MDLocation(line: 1384, column: 19, scope: !3856)
!3858 = !MDLocation(line: 1384, column: 9, scope: !482)
!3859 = !MDLocation(line: 1385, column: 19, scope: !3856)
!3860 = !MDLocation(line: 1385, column: 9, scope: !3856)
!3861 = !MDLocation(line: 1387, column: 9, scope: !3862)
!3862 = !{!"0xb\001387\009\00265", !1, !482}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3863 = !MDLocation(line: 1387, column: 19, scope: !3862)
!3864 = !MDLocation(line: 1387, column: 9, scope: !482)
!3865 = !MDLocation(line: 1388, column: 19, scope: !3862)
!3866 = !MDLocation(line: 1388, column: 9, scope: !3862)
!3867 = !MDLocation(line: 1390, column: 9, scope: !3868)
!3868 = !{!"0xb\001390\009\00266", !1, !482}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3869 = !MDLocation(line: 1390, column: 19, scope: !3868)
!3870 = !MDLocation(line: 1390, column: 9, scope: !482)
!3871 = !MDLocation(line: 1391, column: 19, scope: !3868)
!3872 = !MDLocation(line: 1391, column: 9, scope: !3868)
!3873 = !MDLocation(line: 1393, column: 14, scope: !3874)
!3874 = !{!"0xb\001393\005\00267", !1, !482}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3875 = !MDLocation(line: 1393, column: 10, scope: !3874)
!3876 = !MDLocation(line: 1393, column: 23, scope: !3877)
!3877 = !{!"0xb\002", !1, !3878}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3878 = !{!"0xb\001", !1, !3879}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3879 = !{!"0xb\001393\005\00268", !1, !3874}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3880 = !MDLocation(line: 1393, column: 27, scope: !3879)
!3881 = !MDLocation(line: 1393, column: 23, scope: !3879)
!3882 = !MDLocation(line: 1393, column: 5, scope: !3874)
!3883 = !MDLocation(line: 1395, column: 29, scope: !3884)
!3884 = !{!"0xb\001394\005\00269", !1, !3879}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3885 = !MDLocation(line: 1395, column: 9, scope: !3884)
!3886 = !MDLocation(line: 1396, column: 22, scope: !3884)
!3887 = !MDLocation(line: 1396, column: 26, scope: !3884)
!3888 = !MDLocation(line: 1396, column: 38, scope: !3884)
!3889 = !MDLocation(line: 1396, column: 48, scope: !3884)
!3890 = !MDLocation(line: 1396, column: 9, scope: !3884)
!3891 = !MDLocation(line: 1398, column: 18, scope: !3892)
!3892 = !{!"0xb\001398\009\00270", !1, !3884}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3893 = !MDLocation(line: 1398, column: 14, scope: !3892)
!3894 = !MDLocation(line: 1398, column: 27, scope: !3895)
!3895 = !{!"0xb\002", !1, !3896}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3896 = !{!"0xb\001", !1, !3897}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3897 = !{!"0xb\001398\009\00271", !1, !3892}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3898 = !MDLocation(line: 1398, column: 31, scope: !3897)
!3899 = !MDLocation(line: 1398, column: 27, scope: !3897)
!3900 = !MDLocation(line: 1398, column: 9, scope: !3892)
!3901 = !MDLocation(line: 1400, column: 23, scope: !3902)
!3902 = !{!"0xb\001399\009\00272", !1, !3897}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3903 = !MDLocation(line: 1400, column: 35, scope: !3902)
!3904 = !MDLocation(line: 1400, column: 41, scope: !3902)
!3905 = !MDLocation(line: 1400, column: 54, scope: !3902)
!3906 = !MDLocation(line: 1400, column: 66, scope: !3902)
!3907 = !MDLocation(line: 1400, column: 82, scope: !3902)
!3908 = !MDLocation(line: 1400, column: 13, scope: !3902)
!3909 = !MDLocation(line: 1402, column: 33, scope: !3902)
!3910 = !MDLocation(line: 1402, column: 13, scope: !3902)
!3911 = !MDLocation(line: 1404, column: 39, scope: !3902)
!3912 = !MDLocation(line: 1404, column: 50, scope: !3902)
!3913 = !MDLocation(line: 1403, column: 24, scope: !3902)
!3914 = !MDLocation(line: 1403, column: 13, scope: !3902)
!3915 = !MDLocation(line: 1406, column: 17, scope: !3916)
!3916 = !{!"0xb\001406\0017\00273", !1, !3902}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3917 = !MDLocation(line: 1406, column: 27, scope: !3916)
!3918 = !MDLocation(line: 1406, column: 17, scope: !3902)
!3919 = !MDLocation(line: 1408, column: 27, scope: !3920)
!3920 = !{!"0xb\001407\0013\00274", !1, !3916}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3921 = !MDLocation(line: 1408, column: 17, scope: !3920)
!3922 = !MDLocation(line: 1409, column: 38, scope: !3920)
!3923 = !MDLocation(line: 1409, column: 17, scope: !3920)
!3924 = !MDLocation(line: 1410, column: 38, scope: !3920)
!3925 = !MDLocation(line: 1410, column: 17, scope: !3920)
!3926 = !MDLocation(line: 1411, column: 31, scope: !3920)
!3927 = !MDLocation(line: 1411, column: 17, scope: !3920)
!3928 = !MDLocation(line: 1412, column: 13, scope: !3920)
!3929 = !MDLocation(line: 1414, column: 13, scope: !3902)
!3930 = !MDLocation(line: 1415, column: 9, scope: !3902)
!3931 = !MDLocation(line: 1398, column: 40, scope: !3897)
!3932 = !MDLocation(line: 1398, column: 9, scope: !3897)
!3933 = !MDLocation(line: 1416, column: 5, scope: !3884)
!3934 = !MDLocation(line: 1393, column: 37, scope: !3879)
!3935 = !MDLocation(line: 1393, column: 5, scope: !3879)
!3936 = !MDLocation(line: 1418, column: 25, scope: !482)
!3937 = !MDLocation(line: 1418, column: 5, scope: !482)
!3938 = !MDLocation(line: 1419, column: 25, scope: !482)
!3939 = !MDLocation(line: 1419, column: 5, scope: !482)
!3940 = !MDLocation(line: 1421, column: 12, scope: !482)
!3941 = !MDLocation(line: 1421, column: 23, scope: !482)
!3942 = !MDLocation(line: 1421, column: 29, scope: !482)
!3943 = !MDLocation(line: 1421, column: 42, scope: !482)
!3944 = !MDLocation(line: 1421, column: 55, scope: !482)
!3945 = !MDLocation(line: 1422, column: 36, scope: !482)
!3946 = !MDLocation(line: 1422, column: 47, scope: !482)
!3947 = !MDLocation(line: 1422, column: 55, scope: !482)
!3948 = !MDLocation(line: 1422, column: 14, scope: !482)
!3949 = !MDLocation(line: 1421, column: 5, scope: !482)
!3950 = !{!"0x101\00x\0016778641\000", !485, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1425]
!3951 = !MDLocation(line: 1425, column: 39, scope: !485)
!3952 = !{!"0x101\00b\0033555857\000", !485, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1425]
!3953 = !MDLocation(line: 1425, column: 49, scope: !485)
!3954 = !{!"0x101\00d\0050333073\000", !485, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1425]
!3955 = !MDLocation(line: 1425, column: 60, scope: !485)
!3956 = !{!"0x101\00ref_mv\0067110289\000", !485, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1425]
!3957 = !MDLocation(line: 1425, column: 71, scope: !485)
!3958 = !{!"0x101\00sad_per_bit\0083887506\000", !485, !69, !72} ; [ DW_TAG_arg_variable ] [sad_per_bit] [line 1426]
!3959 = !MDLocation(line: 1426, column: 31, scope: !485)
!3960 = !{!"0x101\00distance\00100664722\000", !485, !69, !72} ; [ DW_TAG_arg_variable ] [distance] [line 1426]
!3961 = !MDLocation(line: 1426, column: 48, scope: !485)
!3962 = !{!"0x101\00fn_ptr\00117441939\000", !485, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1427]
!3963 = !MDLocation(line: 1427, column: 50, scope: !485)
!3964 = !{!"0x101\00mvcost\00134219155\000", !485, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1427]
!3965 = !MDLocation(line: 1427, column: 63, scope: !485)
!3966 = !{!"0x101\00center_mv\00150996372\000", !485, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1428]
!3967 = !MDLocation(line: 1428, column: 35, scope: !485)
!3968 = !{!"0x100\00what\001430\000", !485, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1430]
!3969 = !MDLocation(line: 1430, column: 20, scope: !485)
!3970 = !MDLocation(line: 1430, column: 30, scope: !485)
!3971 = !MDLocation(line: 1430, column: 28, scope: !485)
!3972 = !MDLocation(line: 1430, column: 45, scope: !485)
!3973 = !{!"0x100\00what_stride\001431\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1431]
!3974 = !MDLocation(line: 1431, column: 9, scope: !485)
!3975 = !MDLocation(line: 1431, column: 23, scope: !485)
!3976 = !{!"0x100\00in_what\001432\000", !485, !69, !60} ; [ DW_TAG_auto_variable ] [in_what] [line 1432]
!3977 = !MDLocation(line: 1432, column: 20, scope: !485)
!3978 = !{!"0x100\00pre_stride\001433\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1433]
!3979 = !MDLocation(line: 1433, column: 9, scope: !485)
!3980 = !MDLocation(line: 1433, column: 22, scope: !485)
!3981 = !{!"0x100\00base_pre\001434\000", !485, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1434]
!3982 = !MDLocation(line: 1434, column: 20, scope: !485)
!3983 = !MDLocation(line: 1434, column: 31, scope: !485)
!3984 = !{!"0x100\00in_what_stride\001435\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1435]
!3985 = !MDLocation(line: 1435, column: 9, scope: !485)
!3986 = !MDLocation(line: 1435, column: 26, scope: !485)
!3987 = !{!"0x100\00mv_stride\001436\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [mv_stride] [line 1436]
!3988 = !MDLocation(line: 1436, column: 9, scope: !485)
!3989 = !MDLocation(line: 1436, column: 21, scope: !485)
!3990 = !{!"0x100\00bestaddress\001437\000", !485, !69, !60} ; [ DW_TAG_auto_variable ] [bestaddress] [line 1437]
!3991 = !MDLocation(line: 1437, column: 20, scope: !485)
!3992 = !{!"0x100\00best_mv\001438\000", !485, !69, !73} ; [ DW_TAG_auto_variable ] [best_mv] [line 1438]
!3993 = !MDLocation(line: 1438, column: 13, scope: !485)
!3994 = !MDLocation(line: 1438, column: 24, scope: !485)
!3995 = !MDLocation(line: 1438, column: 23, scope: !485)
!3996 = !{!"0x100\00this_mv\001439\000", !485, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1439]
!3997 = !MDLocation(line: 1439, column: 12, scope: !485)
!3998 = !{!"0x100\00bestsad\001440\000", !485, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1440]
!3999 = !MDLocation(line: 1440, column: 18, scope: !485)
!4000 = !{!"0x100\00thissad\001441\000", !485, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1441]
!4001 = !MDLocation(line: 1441, column: 18, scope: !485)
!4002 = !{!"0x100\00r\001442\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [r] [line 1442]
!4003 = !MDLocation(line: 1442, column: 9, scope: !485)
!4004 = !{!"0x100\00c\001442\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [c] [line 1442]
!4005 = !MDLocation(line: 1442, column: 12, scope: !485)
!4006 = !{!"0x100\00check_here\001444\000", !485, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1444]
!4007 = !MDLocation(line: 1444, column: 20, scope: !485)
!4008 = !{!"0x100\00ref_row\001446\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [ref_row] [line 1446]
!4009 = !MDLocation(line: 1446, column: 9, scope: !485)
!4010 = !MDLocation(line: 1446, column: 19, scope: !485)
!4011 = !{!"0x100\00ref_col\001447\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [ref_col] [line 1447]
!4012 = !MDLocation(line: 1447, column: 9, scope: !485)
!4013 = !MDLocation(line: 1447, column: 19, scope: !485)
!4014 = !{!"0x100\00row_min\001449\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [row_min] [line 1449]
!4015 = !MDLocation(line: 1449, column: 9, scope: !485)
!4016 = !MDLocation(line: 1449, column: 19, scope: !485)
!4017 = !MDLocation(line: 1449, column: 29, scope: !485)
!4018 = !{!"0x100\00row_max\001450\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [row_max] [line 1450]
!4019 = !MDLocation(line: 1450, column: 9, scope: !485)
!4020 = !MDLocation(line: 1450, column: 19, scope: !485)
!4021 = !MDLocation(line: 1450, column: 29, scope: !485)
!4022 = !{!"0x100\00col_min\001451\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [col_min] [line 1451]
!4023 = !MDLocation(line: 1451, column: 9, scope: !485)
!4024 = !MDLocation(line: 1451, column: 19, scope: !485)
!4025 = !MDLocation(line: 1451, column: 29, scope: !485)
!4026 = !{!"0x100\00col_max\001452\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [col_max] [line 1452]
!4027 = !MDLocation(line: 1452, column: 9, scope: !485)
!4028 = !MDLocation(line: 1452, column: 19, scope: !485)
!4029 = !MDLocation(line: 1452, column: 29, scope: !485)
!4030 = !{!"0x100\00sad_array\001454\000", !485, !69, !4031} ; [ DW_TAG_auto_variable ] [sad_array] [line 1454]
!4031 = !{!"0x1\00\000\0096\0032\000\000\000", null, null, !80, !228, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from unsigned int]
!4032 = !MDLocation(line: 1454, column: 18, scope: !485)
!4033 = !{!"0x100\00mvsadcost\001456\000", !485, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1456]
!4034 = !MDLocation(line: 1456, column: 10, scope: !485)
!4035 = !{!"0x100\00fcenter_mv\001457\000", !485, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1457]
!4036 = !MDLocation(line: 1457, column: 12, scope: !485)
!4037 = !MDLocation(line: 1459, column: 20, scope: !485)
!4038 = !MDLocation(line: 1459, column: 5, scope: !485)
!4039 = !MDLocation(line: 1460, column: 20, scope: !485)
!4040 = !MDLocation(line: 1460, column: 5, scope: !485)
!4041 = !MDLocation(line: 1461, column: 28, scope: !485)
!4042 = !MDLocation(line: 1461, column: 5, scope: !485)
!4043 = !MDLocation(line: 1462, column: 28, scope: !485)
!4044 = !MDLocation(line: 1462, column: 5, scope: !485)
!4045 = !MDLocation(line: 1465, column: 15, scope: !485)
!4046 = !MDLocation(line: 1465, column: 26, scope: !485)
!4047 = !MDLocation(line: 1465, column: 5, scope: !485)
!4048 = !MDLocation(line: 1466, column: 19, scope: !485)
!4049 = !MDLocation(line: 1466, column: 30, scope: !485)
!4050 = !MDLocation(line: 1466, column: 40, scope: !485)
!4051 = !MDLocation(line: 1466, column: 54, scope: !485)
!4052 = !MDLocation(line: 1466, column: 5, scope: !485)
!4053 = !MDLocation(line: 1468, column: 26, scope: !485)
!4054 = !MDLocation(line: 1468, column: 5, scope: !485)
!4055 = !MDLocation(line: 1469, column: 26, scope: !485)
!4056 = !MDLocation(line: 1469, column: 5, scope: !485)
!4057 = !MDLocation(line: 1472, column: 15, scope: !485)
!4058 = !MDLocation(line: 1472, column: 27, scope: !485)
!4059 = !MDLocation(line: 1472, column: 33, scope: !485)
!4060 = !MDLocation(line: 1472, column: 46, scope: !485)
!4061 = !MDLocation(line: 1473, column: 27, scope: !485)
!4062 = !MDLocation(line: 1474, column: 30, scope: !485)
!4063 = !MDLocation(line: 1474, column: 52, scope: !485)
!4064 = !MDLocation(line: 1474, column: 63, scope: !485)
!4065 = !MDLocation(line: 1474, column: 15, scope: !485)
!4066 = !MDLocation(line: 1472, column: 5, scope: !485)
!4067 = !MDLocation(line: 1479, column: 9, scope: !4068)
!4068 = !{!"0xb\001479\009\00275", !1, !485}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4069 = !MDLocation(line: 1479, column: 19, scope: !4068)
!4070 = !MDLocation(line: 1479, column: 9, scope: !485)
!4071 = !MDLocation(line: 1480, column: 19, scope: !4068)
!4072 = !MDLocation(line: 1480, column: 9, scope: !4068)
!4073 = !MDLocation(line: 1482, column: 9, scope: !4074)
!4074 = !{!"0xb\001482\009\00276", !1, !485}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4075 = !MDLocation(line: 1482, column: 19, scope: !4074)
!4076 = !MDLocation(line: 1482, column: 9, scope: !485)
!4077 = !MDLocation(line: 1483, column: 19, scope: !4074)
!4078 = !MDLocation(line: 1483, column: 9, scope: !4074)
!4079 = !MDLocation(line: 1485, column: 9, scope: !4080)
!4080 = !{!"0xb\001485\009\00277", !1, !485}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4081 = !MDLocation(line: 1485, column: 19, scope: !4080)
!4082 = !MDLocation(line: 1485, column: 9, scope: !485)
!4083 = !MDLocation(line: 1486, column: 19, scope: !4080)
!4084 = !MDLocation(line: 1486, column: 9, scope: !4080)
!4085 = !MDLocation(line: 1488, column: 9, scope: !4086)
!4086 = !{!"0xb\001488\009\00278", !1, !485}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4087 = !MDLocation(line: 1488, column: 19, scope: !4086)
!4088 = !MDLocation(line: 1488, column: 9, scope: !485)
!4089 = !MDLocation(line: 1489, column: 19, scope: !4086)
!4090 = !MDLocation(line: 1489, column: 9, scope: !4086)
!4091 = !MDLocation(line: 1491, column: 14, scope: !4092)
!4092 = !{!"0xb\001491\005\00279", !1, !485}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4093 = !MDLocation(line: 1491, column: 10, scope: !4092)
!4094 = !MDLocation(line: 1491, column: 23, scope: !4095)
!4095 = !{!"0xb\002", !1, !4096}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4096 = !{!"0xb\001", !1, !4097}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4097 = !{!"0xb\001491\005\00280", !1, !4092}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4098 = !MDLocation(line: 1491, column: 27, scope: !4097)
!4099 = !MDLocation(line: 1491, column: 23, scope: !4097)
!4100 = !MDLocation(line: 1491, column: 5, scope: !4092)
!4101 = !MDLocation(line: 1493, column: 29, scope: !4102)
!4102 = !{!"0xb\001492\005\00281", !1, !4097}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4103 = !MDLocation(line: 1493, column: 9, scope: !4102)
!4104 = !MDLocation(line: 1494, column: 22, scope: !4102)
!4105 = !MDLocation(line: 1494, column: 26, scope: !4102)
!4106 = !MDLocation(line: 1494, column: 38, scope: !4102)
!4107 = !MDLocation(line: 1494, column: 48, scope: !4102)
!4108 = !MDLocation(line: 1494, column: 9, scope: !4102)
!4109 = !MDLocation(line: 1495, column: 13, scope: !4102)
!4110 = !MDLocation(line: 1495, column: 9, scope: !4102)
!4111 = !MDLocation(line: 1497, column: 9, scope: !4102)
!4112 = !MDLocation(line: 1497, column: 17, scope: !4113)
!4113 = !{!"0xb\002", !1, !4114}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4114 = !{!"0xb\001", !1, !4102}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4115 = !MDLocation(line: 1497, column: 26, scope: !4102)
!4116 = !MDLocation(line: 1497, column: 16, scope: !4102)
!4117 = !{!"0x100\00i\001499\000", !4118, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1499]
!4118 = !{!"0xb\001498\009\00282", !1, !4102}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4119 = !MDLocation(line: 1499, column: 17, scope: !4118)
!4120 = !MDLocation(line: 1501, column: 13, scope: !4118)
!4121 = !MDLocation(line: 1501, column: 27, scope: !4118)
!4122 = !MDLocation(line: 1501, column: 33, scope: !4118)
!4123 = !MDLocation(line: 1501, column: 46, scope: !4118)
!4124 = !MDLocation(line: 1501, column: 58, scope: !4118)
!4125 = !MDLocation(line: 1501, column: 74, scope: !4118)
!4126 = !MDLocation(line: 1503, column: 18, scope: !4127)
!4127 = !{!"0xb\001503\0013\00283", !1, !4118}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4128 = !MDLocation(line: 1503, column: 25, scope: !4129)
!4129 = !{!"0xb\002", !1, !4130}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4130 = !{!"0xb\001", !1, !4131}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4131 = !{!"0xb\001503\0013\00284", !1, !4127}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4132 = !MDLocation(line: 1503, column: 13, scope: !4127)
!4133 = !MDLocation(line: 1505, column: 37, scope: !4134)
!4134 = !{!"0xb\001504\0013\00285", !1, !4131}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4135 = !MDLocation(line: 1505, column: 27, scope: !4134)
!4136 = !MDLocation(line: 1505, column: 17, scope: !4134)
!4137 = !MDLocation(line: 1507, column: 21, scope: !4138)
!4138 = !{!"0xb\001507\0021\00286", !1, !4134}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4139 = !MDLocation(line: 1507, column: 31, scope: !4138)
!4140 = !MDLocation(line: 1507, column: 21, scope: !4134)
!4141 = !MDLocation(line: 1509, column: 41, scope: !4142)
!4142 = !{!"0xb\001508\0017\00287", !1, !4138}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4143 = !MDLocation(line: 1509, column: 21, scope: !4142)
!4144 = !MDLocation(line: 1511, column: 47, scope: !4142)
!4145 = !MDLocation(line: 1511, column: 58, scope: !4142)
!4146 = !MDLocation(line: 1510, column: 32, scope: !4142)
!4147 = !MDLocation(line: 1510, column: 21, scope: !4142)
!4148 = !MDLocation(line: 1513, column: 25, scope: !4149)
!4149 = !{!"0xb\001513\0025\00288", !1, !4142}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4150 = !MDLocation(line: 1513, column: 35, scope: !4149)
!4151 = !MDLocation(line: 1513, column: 25, scope: !4142)
!4152 = !MDLocation(line: 1515, column: 35, scope: !4153)
!4153 = !{!"0xb\001514\0021\00289", !1, !4149}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4154 = !MDLocation(line: 1515, column: 25, scope: !4153)
!4155 = !MDLocation(line: 1516, column: 46, scope: !4153)
!4156 = !MDLocation(line: 1516, column: 25, scope: !4153)
!4157 = !MDLocation(line: 1517, column: 46, scope: !4153)
!4158 = !MDLocation(line: 1517, column: 25, scope: !4153)
!4159 = !MDLocation(line: 1518, column: 39, scope: !4153)
!4160 = !MDLocation(line: 1518, column: 25, scope: !4153)
!4161 = !MDLocation(line: 1519, column: 21, scope: !4153)
!4162 = !MDLocation(line: 1520, column: 17, scope: !4142)
!4163 = !MDLocation(line: 1522, column: 17, scope: !4134)
!4164 = !MDLocation(line: 1523, column: 17, scope: !4134)
!4165 = !MDLocation(line: 1524, column: 13, scope: !4134)
!4166 = !MDLocation(line: 1503, column: 32, scope: !4131)
!4167 = !MDLocation(line: 1503, column: 13, scope: !4131)
!4168 = !MDLocation(line: 1527, column: 9, scope: !4102)
!4169 = !MDLocation(line: 1527, column: 16, scope: !4113)
!4170 = !MDLocation(line: 1527, column: 20, scope: !4102)
!4171 = !MDLocation(line: 1527, column: 16, scope: !4102)
!4172 = !MDLocation(line: 1529, column: 23, scope: !4173)
!4173 = !{!"0xb\001528\009\00290", !1, !4102}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4174 = !MDLocation(line: 1529, column: 35, scope: !4173)
!4175 = !MDLocation(line: 1529, column: 41, scope: !4173)
!4176 = !MDLocation(line: 1529, column: 54, scope: !4173)
!4177 = !MDLocation(line: 1529, column: 66, scope: !4173)
!4178 = !MDLocation(line: 1529, column: 82, scope: !4173)
!4179 = !MDLocation(line: 1529, column: 13, scope: !4173)
!4180 = !MDLocation(line: 1531, column: 17, scope: !4181)
!4181 = !{!"0xb\001531\0017\00291", !1, !4173}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4182 = !MDLocation(line: 1531, column: 27, scope: !4181)
!4183 = !MDLocation(line: 1531, column: 17, scope: !4173)
!4184 = !MDLocation(line: 1533, column: 37, scope: !4185)
!4185 = !{!"0xb\001532\0013\00292", !1, !4181}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4186 = !MDLocation(line: 1533, column: 17, scope: !4185)
!4187 = !MDLocation(line: 1535, column: 43, scope: !4185)
!4188 = !MDLocation(line: 1535, column: 54, scope: !4185)
!4189 = !MDLocation(line: 1534, column: 28, scope: !4185)
!4190 = !MDLocation(line: 1534, column: 17, scope: !4185)
!4191 = !MDLocation(line: 1537, column: 21, scope: !4192)
!4192 = !{!"0xb\001537\0021\00293", !1, !4185}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4193 = !MDLocation(line: 1537, column: 31, scope: !4192)
!4194 = !MDLocation(line: 1537, column: 21, scope: !4185)
!4195 = !MDLocation(line: 1539, column: 31, scope: !4196)
!4196 = !{!"0xb\001538\0017\00294", !1, !4192}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4197 = !MDLocation(line: 1539, column: 21, scope: !4196)
!4198 = !MDLocation(line: 1540, column: 42, scope: !4196)
!4199 = !MDLocation(line: 1540, column: 21, scope: !4196)
!4200 = !MDLocation(line: 1541, column: 42, scope: !4196)
!4201 = !MDLocation(line: 1541, column: 21, scope: !4196)
!4202 = !MDLocation(line: 1542, column: 35, scope: !4196)
!4203 = !MDLocation(line: 1542, column: 21, scope: !4196)
!4204 = !MDLocation(line: 1543, column: 17, scope: !4196)
!4205 = !MDLocation(line: 1544, column: 13, scope: !4185)
!4206 = !MDLocation(line: 1546, column: 13, scope: !4173)
!4207 = !MDLocation(line: 1547, column: 13, scope: !4173)
!4208 = !MDLocation(line: 1550, column: 5, scope: !4102)
!4209 = !MDLocation(line: 1491, column: 37, scope: !4097)
!4210 = !MDLocation(line: 1491, column: 5, scope: !4097)
!4211 = !MDLocation(line: 1552, column: 25, scope: !485)
!4212 = !MDLocation(line: 1552, column: 5, scope: !485)
!4213 = !MDLocation(line: 1553, column: 25, scope: !485)
!4214 = !MDLocation(line: 1553, column: 5, scope: !485)
!4215 = !MDLocation(line: 1555, column: 12, scope: !485)
!4216 = !MDLocation(line: 1555, column: 23, scope: !485)
!4217 = !MDLocation(line: 1555, column: 29, scope: !485)
!4218 = !MDLocation(line: 1555, column: 42, scope: !485)
!4219 = !MDLocation(line: 1555, column: 55, scope: !485)
!4220 = !MDLocation(line: 1556, column: 36, scope: !485)
!4221 = !MDLocation(line: 1556, column: 47, scope: !485)
!4222 = !MDLocation(line: 1556, column: 55, scope: !485)
!4223 = !MDLocation(line: 1556, column: 14, scope: !485)
!4224 = !MDLocation(line: 1555, column: 5, scope: !485)
!4225 = !{!"0x101\00x\0016778775\000", !486, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1559]
!4226 = !MDLocation(line: 1559, column: 39, scope: !486)
!4227 = !{!"0x101\00b\0033555991\000", !486, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1559]
!4228 = !MDLocation(line: 1559, column: 49, scope: !486)
!4229 = !{!"0x101\00d\0050333207\000", !486, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1559]
!4230 = !MDLocation(line: 1559, column: 60, scope: !486)
!4231 = !{!"0x101\00ref_mv\0067110423\000", !486, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1559]
!4232 = !MDLocation(line: 1559, column: 71, scope: !486)
!4233 = !{!"0x101\00sad_per_bit\0083887640\000", !486, !69, !72} ; [ DW_TAG_arg_variable ] [sad_per_bit] [line 1560]
!4234 = !MDLocation(line: 1560, column: 31, scope: !486)
!4235 = !{!"0x101\00distance\00100664856\000", !486, !69, !72} ; [ DW_TAG_arg_variable ] [distance] [line 1560]
!4236 = !MDLocation(line: 1560, column: 48, scope: !486)
!4237 = !{!"0x101\00fn_ptr\00117442073\000", !486, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1561]
!4238 = !MDLocation(line: 1561, column: 50, scope: !486)
!4239 = !{!"0x101\00mvcost\00134219289\000", !486, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1561]
!4240 = !MDLocation(line: 1561, column: 63, scope: !486)
!4241 = !{!"0x101\00center_mv\00150996506\000", !486, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1562]
!4242 = !MDLocation(line: 1562, column: 35, scope: !486)
!4243 = !{!"0x100\00what\001564\000", !486, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1564]
!4244 = !MDLocation(line: 1564, column: 20, scope: !486)
!4245 = !MDLocation(line: 1564, column: 30, scope: !486)
!4246 = !MDLocation(line: 1564, column: 28, scope: !486)
!4247 = !MDLocation(line: 1564, column: 45, scope: !486)
!4248 = !{!"0x100\00what_stride\001565\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1565]
!4249 = !MDLocation(line: 1565, column: 9, scope: !486)
!4250 = !MDLocation(line: 1565, column: 23, scope: !486)
!4251 = !{!"0x100\00pre_stride\001566\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1566]
!4252 = !MDLocation(line: 1566, column: 9, scope: !486)
!4253 = !MDLocation(line: 1566, column: 22, scope: !486)
!4254 = !{!"0x100\00base_pre\001567\000", !486, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1567]
!4255 = !MDLocation(line: 1567, column: 20, scope: !486)
!4256 = !MDLocation(line: 1567, column: 31, scope: !486)
!4257 = !{!"0x100\00in_what\001568\000", !486, !69, !60} ; [ DW_TAG_auto_variable ] [in_what] [line 1568]
!4258 = !MDLocation(line: 1568, column: 20, scope: !486)
!4259 = !{!"0x100\00in_what_stride\001569\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1569]
!4260 = !MDLocation(line: 1569, column: 9, scope: !486)
!4261 = !MDLocation(line: 1569, column: 26, scope: !486)
!4262 = !{!"0x100\00mv_stride\001570\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [mv_stride] [line 1570]
!4263 = !MDLocation(line: 1570, column: 9, scope: !486)
!4264 = !MDLocation(line: 1570, column: 21, scope: !486)
!4265 = !{!"0x100\00bestaddress\001571\000", !486, !69, !60} ; [ DW_TAG_auto_variable ] [bestaddress] [line 1571]
!4266 = !MDLocation(line: 1571, column: 20, scope: !486)
!4267 = !{!"0x100\00best_mv\001572\000", !486, !69, !73} ; [ DW_TAG_auto_variable ] [best_mv] [line 1572]
!4268 = !MDLocation(line: 1572, column: 13, scope: !486)
!4269 = !MDLocation(line: 1572, column: 24, scope: !486)
!4270 = !MDLocation(line: 1572, column: 23, scope: !486)
!4271 = !{!"0x100\00this_mv\001573\000", !486, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1573]
!4272 = !MDLocation(line: 1573, column: 12, scope: !486)
!4273 = !{!"0x100\00bestsad\001574\000", !486, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1574]
!4274 = !MDLocation(line: 1574, column: 18, scope: !486)
!4275 = !{!"0x100\00thissad\001575\000", !486, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1575]
!4276 = !MDLocation(line: 1575, column: 18, scope: !486)
!4277 = !{!"0x100\00r\001576\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [r] [line 1576]
!4278 = !MDLocation(line: 1576, column: 9, scope: !486)
!4279 = !{!"0x100\00c\001576\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [c] [line 1576]
!4280 = !MDLocation(line: 1576, column: 12, scope: !486)
!4281 = !{!"0x100\00check_here\001578\000", !486, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1578]
!4282 = !MDLocation(line: 1578, column: 20, scope: !486)
!4283 = !{!"0x100\00ref_row\001580\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [ref_row] [line 1580]
!4284 = !MDLocation(line: 1580, column: 9, scope: !486)
!4285 = !MDLocation(line: 1580, column: 19, scope: !486)
!4286 = !{!"0x100\00ref_col\001581\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [ref_col] [line 1581]
!4287 = !MDLocation(line: 1581, column: 9, scope: !486)
!4288 = !MDLocation(line: 1581, column: 19, scope: !486)
!4289 = !{!"0x100\00row_min\001583\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [row_min] [line 1583]
!4290 = !MDLocation(line: 1583, column: 9, scope: !486)
!4291 = !MDLocation(line: 1583, column: 19, scope: !486)
!4292 = !MDLocation(line: 1583, column: 29, scope: !486)
!4293 = !{!"0x100\00row_max\001584\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [row_max] [line 1584]
!4294 = !MDLocation(line: 1584, column: 9, scope: !486)
!4295 = !MDLocation(line: 1584, column: 19, scope: !486)
!4296 = !MDLocation(line: 1584, column: 29, scope: !486)
!4297 = !{!"0x100\00col_min\001585\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [col_min] [line 1585]
!4298 = !MDLocation(line: 1585, column: 9, scope: !486)
!4299 = !MDLocation(line: 1585, column: 19, scope: !486)
!4300 = !MDLocation(line: 1585, column: 29, scope: !486)
!4301 = !{!"0x100\00col_max\001586\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [col_max] [line 1586]
!4302 = !MDLocation(line: 1586, column: 9, scope: !486)
!4303 = !MDLocation(line: 1586, column: 19, scope: !486)
!4304 = !MDLocation(line: 1586, column: 29, scope: !486)
!4305 = !{!"0x100\00sad_array8_\001588\000", !486, !69, !4306} ; [ DW_TAG_auto_variable ] [sad_array8_] [line 1588]
!4306 = !{!"0x1\00\000\00272\0016\000\000\000", null, null, !63, !4307, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 272, align 16, offset 0] [from unsigned short]
!4307 = !{!4308}
!4308 = !{!"0x21\000\0017"}                       ; [ DW_TAG_subrange_type ] [0, 16]
!4309 = !MDLocation(line: 1588, column: 5, scope: !486)
!4310 = !{!"0x100\00sad_array8\001588\000", !486, !69, !62} ; [ DW_TAG_auto_variable ] [sad_array8] [line 1588]
!4311 = !{!"0x100\00sad_array\001589\000", !486, !69, !4031} ; [ DW_TAG_auto_variable ] [sad_array] [line 1589]
!4312 = !MDLocation(line: 1589, column: 18, scope: !486)
!4313 = !{!"0x100\00mvsadcost\001591\000", !486, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1591]
!4314 = !MDLocation(line: 1591, column: 10, scope: !486)
!4315 = !{!"0x100\00fcenter_mv\001592\000", !486, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1592]
!4316 = !MDLocation(line: 1592, column: 12, scope: !486)
!4317 = !MDLocation(line: 1594, column: 20, scope: !486)
!4318 = !MDLocation(line: 1594, column: 5, scope: !486)
!4319 = !MDLocation(line: 1595, column: 20, scope: !486)
!4320 = !MDLocation(line: 1595, column: 5, scope: !486)
!4321 = !MDLocation(line: 1596, column: 28, scope: !486)
!4322 = !MDLocation(line: 1596, column: 5, scope: !486)
!4323 = !MDLocation(line: 1597, column: 28, scope: !486)
!4324 = !MDLocation(line: 1597, column: 5, scope: !486)
!4325 = !MDLocation(line: 1600, column: 15, scope: !486)
!4326 = !MDLocation(line: 1600, column: 26, scope: !486)
!4327 = !MDLocation(line: 1600, column: 5, scope: !486)
!4328 = !MDLocation(line: 1601, column: 19, scope: !486)
!4329 = !MDLocation(line: 1601, column: 30, scope: !486)
!4330 = !MDLocation(line: 1601, column: 40, scope: !486)
!4331 = !MDLocation(line: 1601, column: 54, scope: !486)
!4332 = !MDLocation(line: 1601, column: 5, scope: !486)
!4333 = !MDLocation(line: 1603, column: 26, scope: !486)
!4334 = !MDLocation(line: 1603, column: 5, scope: !486)
!4335 = !MDLocation(line: 1604, column: 26, scope: !486)
!4336 = !MDLocation(line: 1604, column: 5, scope: !486)
!4337 = !MDLocation(line: 1607, column: 15, scope: !486)
!4338 = !MDLocation(line: 1607, column: 27, scope: !486)
!4339 = !MDLocation(line: 1607, column: 33, scope: !486)
!4340 = !MDLocation(line: 1608, column: 27, scope: !486)
!4341 = !MDLocation(line: 1608, column: 40, scope: !486)
!4342 = !MDLocation(line: 1609, column: 30, scope: !486)
!4343 = !MDLocation(line: 1609, column: 52, scope: !486)
!4344 = !MDLocation(line: 1609, column: 63, scope: !486)
!4345 = !MDLocation(line: 1609, column: 15, scope: !486)
!4346 = !MDLocation(line: 1607, column: 5, scope: !486)
!4347 = !MDLocation(line: 1614, column: 9, scope: !4348)
!4348 = !{!"0xb\001614\009\00295", !1, !486}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4349 = !MDLocation(line: 1614, column: 19, scope: !4348)
!4350 = !MDLocation(line: 1614, column: 9, scope: !486)
!4351 = !MDLocation(line: 1615, column: 19, scope: !4348)
!4352 = !MDLocation(line: 1615, column: 9, scope: !4348)
!4353 = !MDLocation(line: 1617, column: 9, scope: !4354)
!4354 = !{!"0xb\001617\009\00296", !1, !486}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4355 = !MDLocation(line: 1617, column: 19, scope: !4354)
!4356 = !MDLocation(line: 1617, column: 9, scope: !486)
!4357 = !MDLocation(line: 1618, column: 19, scope: !4354)
!4358 = !MDLocation(line: 1618, column: 9, scope: !4354)
!4359 = !MDLocation(line: 1620, column: 9, scope: !4360)
!4360 = !{!"0xb\001620\009\00297", !1, !486}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4361 = !MDLocation(line: 1620, column: 19, scope: !4360)
!4362 = !MDLocation(line: 1620, column: 9, scope: !486)
!4363 = !MDLocation(line: 1621, column: 19, scope: !4360)
!4364 = !MDLocation(line: 1621, column: 9, scope: !4360)
!4365 = !MDLocation(line: 1623, column: 9, scope: !4366)
!4366 = !{!"0xb\001623\009\00298", !1, !486}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4367 = !MDLocation(line: 1623, column: 19, scope: !4366)
!4368 = !MDLocation(line: 1623, column: 9, scope: !486)
!4369 = !MDLocation(line: 1624, column: 19, scope: !4366)
!4370 = !MDLocation(line: 1624, column: 9, scope: !4366)
!4371 = !MDLocation(line: 1626, column: 14, scope: !4372)
!4372 = !{!"0xb\001626\005\00299", !1, !486}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4373 = !MDLocation(line: 1626, column: 10, scope: !4372)
!4374 = !MDLocation(line: 1626, column: 23, scope: !4375)
!4375 = !{!"0xb\002", !1, !4376}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4376 = !{!"0xb\001", !1, !4377}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4377 = !{!"0xb\001626\005\00300", !1, !4372}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4378 = !MDLocation(line: 1626, column: 27, scope: !4377)
!4379 = !MDLocation(line: 1626, column: 23, scope: !4377)
!4380 = !MDLocation(line: 1626, column: 5, scope: !4372)
!4381 = !MDLocation(line: 1628, column: 29, scope: !4382)
!4382 = !{!"0xb\001627\005\00301", !1, !4377}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4383 = !MDLocation(line: 1628, column: 9, scope: !4382)
!4384 = !MDLocation(line: 1629, column: 22, scope: !4382)
!4385 = !MDLocation(line: 1629, column: 26, scope: !4382)
!4386 = !MDLocation(line: 1629, column: 38, scope: !4382)
!4387 = !MDLocation(line: 1629, column: 48, scope: !4382)
!4388 = !MDLocation(line: 1629, column: 9, scope: !4382)
!4389 = !MDLocation(line: 1630, column: 13, scope: !4382)
!4390 = !MDLocation(line: 1630, column: 9, scope: !4382)
!4391 = !MDLocation(line: 1632, column: 9, scope: !4382)
!4392 = !MDLocation(line: 1632, column: 17, scope: !4393)
!4393 = !{!"0xb\002", !1, !4394}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4394 = !{!"0xb\001", !1, !4382}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4395 = !MDLocation(line: 1632, column: 26, scope: !4382)
!4396 = !MDLocation(line: 1632, column: 16, scope: !4382)
!4397 = !{!"0x100\00i\001634\000", !4398, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1634]
!4398 = !{!"0xb\001633\009\00302", !1, !4382}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4399 = !MDLocation(line: 1634, column: 17, scope: !4398)
!4400 = !MDLocation(line: 1636, column: 13, scope: !4398)
!4401 = !MDLocation(line: 1636, column: 27, scope: !4398)
!4402 = !MDLocation(line: 1636, column: 33, scope: !4398)
!4403 = !MDLocation(line: 1636, column: 46, scope: !4398)
!4404 = !MDLocation(line: 1636, column: 58, scope: !4398)
!4405 = !MDLocation(line: 1636, column: 74, scope: !4398)
!4406 = !MDLocation(line: 1638, column: 18, scope: !4407)
!4407 = !{!"0xb\001638\0013\00303", !1, !4398}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4408 = !MDLocation(line: 1638, column: 25, scope: !4409)
!4409 = !{!"0xb\002", !1, !4410}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4410 = !{!"0xb\001", !1, !4411}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4411 = !{!"0xb\001638\0013\00304", !1, !4407}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4412 = !MDLocation(line: 1638, column: 13, scope: !4407)
!4413 = !MDLocation(line: 1640, column: 38, scope: !4414)
!4414 = !{!"0xb\001639\0013\00305", !1, !4411}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4415 = !MDLocation(line: 1640, column: 27, scope: !4414)
!4416 = !MDLocation(line: 1640, column: 17, scope: !4414)
!4417 = !MDLocation(line: 1642, column: 21, scope: !4418)
!4418 = !{!"0xb\001642\0021\00306", !1, !4414}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4419 = !MDLocation(line: 1642, column: 31, scope: !4418)
!4420 = !MDLocation(line: 1642, column: 21, scope: !4414)
!4421 = !MDLocation(line: 1644, column: 41, scope: !4422)
!4422 = !{!"0xb\001643\0017\00307", !1, !4418}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4423 = !MDLocation(line: 1644, column: 21, scope: !4422)
!4424 = !MDLocation(line: 1646, column: 47, scope: !4422)
!4425 = !MDLocation(line: 1646, column: 58, scope: !4422)
!4426 = !MDLocation(line: 1645, column: 32, scope: !4422)
!4427 = !MDLocation(line: 1645, column: 21, scope: !4422)
!4428 = !MDLocation(line: 1648, column: 25, scope: !4429)
!4429 = !{!"0xb\001648\0025\00308", !1, !4422}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4430 = !MDLocation(line: 1648, column: 35, scope: !4429)
!4431 = !MDLocation(line: 1648, column: 25, scope: !4422)
!4432 = !MDLocation(line: 1650, column: 35, scope: !4433)
!4433 = !{!"0xb\001649\0021\00309", !1, !4429}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4434 = !MDLocation(line: 1650, column: 25, scope: !4433)
!4435 = !MDLocation(line: 1651, column: 46, scope: !4433)
!4436 = !MDLocation(line: 1651, column: 25, scope: !4433)
!4437 = !MDLocation(line: 1652, column: 46, scope: !4433)
!4438 = !MDLocation(line: 1652, column: 25, scope: !4433)
!4439 = !MDLocation(line: 1653, column: 39, scope: !4433)
!4440 = !MDLocation(line: 1653, column: 25, scope: !4433)
!4441 = !MDLocation(line: 1654, column: 21, scope: !4433)
!4442 = !MDLocation(line: 1655, column: 17, scope: !4422)
!4443 = !MDLocation(line: 1657, column: 17, scope: !4414)
!4444 = !MDLocation(line: 1658, column: 17, scope: !4414)
!4445 = !MDLocation(line: 1659, column: 13, scope: !4414)
!4446 = !MDLocation(line: 1638, column: 32, scope: !4411)
!4447 = !MDLocation(line: 1638, column: 13, scope: !4411)
!4448 = !MDLocation(line: 1662, column: 9, scope: !4382)
!4449 = !MDLocation(line: 1662, column: 17, scope: !4393)
!4450 = !MDLocation(line: 1662, column: 26, scope: !4382)
!4451 = !MDLocation(line: 1662, column: 16, scope: !4382)
!4452 = !{!"0x100\00i\001664\000", !4453, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1664]
!4453 = !{!"0xb\001663\009\00310", !1, !4382}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4454 = !MDLocation(line: 1664, column: 17, scope: !4453)
!4455 = !MDLocation(line: 1666, column: 13, scope: !4453)
!4456 = !MDLocation(line: 1666, column: 27, scope: !4453)
!4457 = !MDLocation(line: 1666, column: 33, scope: !4453)
!4458 = !MDLocation(line: 1666, column: 46, scope: !4453)
!4459 = !MDLocation(line: 1666, column: 59, scope: !4453)
!4460 = !MDLocation(line: 1666, column: 75, scope: !4453)
!4461 = !MDLocation(line: 1668, column: 18, scope: !4462)
!4462 = !{!"0xb\001668\0013\00311", !1, !4453}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4463 = !MDLocation(line: 1668, column: 25, scope: !4464)
!4464 = !{!"0xb\002", !1, !4465}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4465 = !{!"0xb\001", !1, !4466}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4466 = !{!"0xb\001668\0013\00312", !1, !4462}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4467 = !MDLocation(line: 1668, column: 13, scope: !4462)
!4468 = !MDLocation(line: 1670, column: 37, scope: !4469)
!4469 = !{!"0xb\001669\0013\00313", !1, !4466}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4470 = !MDLocation(line: 1670, column: 27, scope: !4469)
!4471 = !MDLocation(line: 1670, column: 17, scope: !4469)
!4472 = !MDLocation(line: 1672, column: 21, scope: !4473)
!4473 = !{!"0xb\001672\0021\00314", !1, !4469}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4474 = !MDLocation(line: 1672, column: 31, scope: !4473)
!4475 = !MDLocation(line: 1672, column: 21, scope: !4469)
!4476 = !MDLocation(line: 1674, column: 41, scope: !4477)
!4477 = !{!"0xb\001673\0017\00315", !1, !4473}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4478 = !MDLocation(line: 1674, column: 21, scope: !4477)
!4479 = !MDLocation(line: 1676, column: 25, scope: !4477)
!4480 = !MDLocation(line: 1676, column: 36, scope: !4477)
!4481 = !MDLocation(line: 1675, column: 33, scope: !4477)
!4482 = !MDLocation(line: 1675, column: 21, scope: !4477)
!4483 = !MDLocation(line: 1678, column: 25, scope: !4484)
!4484 = !{!"0xb\001678\0025\00316", !1, !4477}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4485 = !MDLocation(line: 1678, column: 35, scope: !4484)
!4486 = !MDLocation(line: 1678, column: 25, scope: !4477)
!4487 = !MDLocation(line: 1680, column: 35, scope: !4488)
!4488 = !{!"0xb\001679\0021\00317", !1, !4484}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4489 = !MDLocation(line: 1680, column: 25, scope: !4488)
!4490 = !MDLocation(line: 1681, column: 46, scope: !4488)
!4491 = !MDLocation(line: 1681, column: 25, scope: !4488)
!4492 = !MDLocation(line: 1682, column: 46, scope: !4488)
!4493 = !MDLocation(line: 1682, column: 25, scope: !4488)
!4494 = !MDLocation(line: 1683, column: 39, scope: !4488)
!4495 = !MDLocation(line: 1683, column: 25, scope: !4488)
!4496 = !MDLocation(line: 1684, column: 21, scope: !4488)
!4497 = !MDLocation(line: 1685, column: 17, scope: !4477)
!4498 = !MDLocation(line: 1687, column: 17, scope: !4469)
!4499 = !MDLocation(line: 1688, column: 17, scope: !4469)
!4500 = !MDLocation(line: 1689, column: 13, scope: !4469)
!4501 = !MDLocation(line: 1668, column: 32, scope: !4466)
!4502 = !MDLocation(line: 1668, column: 13, scope: !4466)
!4503 = !MDLocation(line: 1692, column: 9, scope: !4382)
!4504 = !MDLocation(line: 1692, column: 16, scope: !4393)
!4505 = !MDLocation(line: 1692, column: 20, scope: !4382)
!4506 = !MDLocation(line: 1692, column: 16, scope: !4382)
!4507 = !MDLocation(line: 1694, column: 23, scope: !4508)
!4508 = !{!"0xb\001693\009\00318", !1, !4382}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4509 = !MDLocation(line: 1694, column: 35, scope: !4508)
!4510 = !MDLocation(line: 1694, column: 41, scope: !4508)
!4511 = !MDLocation(line: 1694, column: 54, scope: !4508)
!4512 = !MDLocation(line: 1694, column: 67, scope: !4508)
!4513 = !MDLocation(line: 1694, column: 83, scope: !4508)
!4514 = !MDLocation(line: 1694, column: 13, scope: !4508)
!4515 = !MDLocation(line: 1696, column: 17, scope: !4516)
!4516 = !{!"0xb\001696\0017\00319", !1, !4508}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4517 = !MDLocation(line: 1696, column: 27, scope: !4516)
!4518 = !MDLocation(line: 1696, column: 17, scope: !4508)
!4519 = !MDLocation(line: 1698, column: 37, scope: !4520)
!4520 = !{!"0xb\001697\0013\00320", !1, !4516}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4521 = !MDLocation(line: 1698, column: 17, scope: !4520)
!4522 = !MDLocation(line: 1700, column: 21, scope: !4520)
!4523 = !MDLocation(line: 1700, column: 32, scope: !4520)
!4524 = !MDLocation(line: 1699, column: 29, scope: !4520)
!4525 = !MDLocation(line: 1699, column: 17, scope: !4520)
!4526 = !MDLocation(line: 1702, column: 21, scope: !4527)
!4527 = !{!"0xb\001702\0021\00321", !1, !4520}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4528 = !MDLocation(line: 1702, column: 31, scope: !4527)
!4529 = !MDLocation(line: 1702, column: 21, scope: !4520)
!4530 = !MDLocation(line: 1704, column: 31, scope: !4531)
!4531 = !{!"0xb\001703\0017\00322", !1, !4527}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4532 = !MDLocation(line: 1704, column: 21, scope: !4531)
!4533 = !MDLocation(line: 1705, column: 42, scope: !4531)
!4534 = !MDLocation(line: 1705, column: 21, scope: !4531)
!4535 = !MDLocation(line: 1706, column: 42, scope: !4531)
!4536 = !MDLocation(line: 1706, column: 21, scope: !4531)
!4537 = !MDLocation(line: 1707, column: 35, scope: !4531)
!4538 = !MDLocation(line: 1707, column: 21, scope: !4531)
!4539 = !MDLocation(line: 1708, column: 17, scope: !4531)
!4540 = !MDLocation(line: 1709, column: 13, scope: !4520)
!4541 = !MDLocation(line: 1711, column: 13, scope: !4508)
!4542 = !MDLocation(line: 1712, column: 13, scope: !4508)
!4543 = !MDLocation(line: 1714, column: 5, scope: !4382)
!4544 = !MDLocation(line: 1626, column: 37, scope: !4377)
!4545 = !MDLocation(line: 1626, column: 5, scope: !4377)
!4546 = !MDLocation(line: 1716, column: 25, scope: !486)
!4547 = !MDLocation(line: 1716, column: 5, scope: !486)
!4548 = !MDLocation(line: 1717, column: 25, scope: !486)
!4549 = !MDLocation(line: 1717, column: 5, scope: !486)
!4550 = !MDLocation(line: 1719, column: 12, scope: !486)
!4551 = !MDLocation(line: 1719, column: 23, scope: !486)
!4552 = !MDLocation(line: 1719, column: 29, scope: !486)
!4553 = !MDLocation(line: 1719, column: 42, scope: !486)
!4554 = !MDLocation(line: 1719, column: 55, scope: !486)
!4555 = !MDLocation(line: 1720, column: 36, scope: !486)
!4556 = !MDLocation(line: 1720, column: 47, scope: !486)
!4557 = !MDLocation(line: 1720, column: 55, scope: !486)
!4558 = !MDLocation(line: 1720, column: 14, scope: !486)
!4559 = !MDLocation(line: 1719, column: 5, scope: !486)
!4560 = !{!"0x101\00x\0016778939\000", !487, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1723]
!4561 = !MDLocation(line: 1723, column: 43, scope: !487)
!4562 = !{!"0x101\00b\0033556155\000", !487, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1723]
!4563 = !MDLocation(line: 1723, column: 53, scope: !487)
!4564 = !{!"0x101\00d\0050333371\000", !487, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1723]
!4565 = !MDLocation(line: 1723, column: 64, scope: !487)
!4566 = !{!"0x101\00ref_mv\0067110587\000", !487, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1723]
!4567 = !MDLocation(line: 1723, column: 75, scope: !487)
!4568 = !{!"0x101\00error_per_bit\0083887804\000", !487, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 1724]
!4569 = !MDLocation(line: 1724, column: 33, scope: !487)
!4570 = !{!"0x101\00search_range\00100665020\000", !487, !69, !72} ; [ DW_TAG_arg_variable ] [search_range] [line 1724]
!4571 = !MDLocation(line: 1724, column: 52, scope: !487)
!4572 = !{!"0x101\00fn_ptr\00117442237\000", !487, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1725]
!4573 = !MDLocation(line: 1725, column: 52, scope: !487)
!4574 = !{!"0x101\00mvcost\00134219453\000", !487, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1725]
!4575 = !MDLocation(line: 1725, column: 65, scope: !487)
!4576 = !{!"0x101\00center_mv\00150996670\000", !487, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1726]
!4577 = !MDLocation(line: 1726, column: 37, scope: !487)
!4578 = !{!"0x100\00neighbors\001728\000", !487, !69, !2509} ; [ DW_TAG_auto_variable ] [neighbors] [line 1728]
!4579 = !MDLocation(line: 1728, column: 8, scope: !487)
!4580 = !{!"0x100\00i\001729\000", !487, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1729]
!4581 = !MDLocation(line: 1729, column: 9, scope: !487)
!4582 = !{!"0x100\00j\001729\000", !487, !69, !72} ; [ DW_TAG_auto_variable ] [j] [line 1729]
!4583 = !MDLocation(line: 1729, column: 12, scope: !487)
!4584 = !{!"0x100\00this_row_offset\001730\000", !487, !69, !86} ; [ DW_TAG_auto_variable ] [this_row_offset] [line 1730]
!4585 = !MDLocation(line: 1730, column: 11, scope: !487)
!4586 = !{!"0x100\00this_col_offset\001730\000", !487, !69, !86} ; [ DW_TAG_auto_variable ] [this_col_offset] [line 1730]
!4587 = !MDLocation(line: 1730, column: 28, scope: !487)
!4588 = !{!"0x100\00what_stride\001732\000", !487, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1732]
!4589 = !MDLocation(line: 1732, column: 9, scope: !487)
!4590 = !MDLocation(line: 1732, column: 23, scope: !487)
!4591 = !{!"0x100\00pre_stride\001733\000", !487, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1733]
!4592 = !MDLocation(line: 1733, column: 9, scope: !487)
!4593 = !MDLocation(line: 1733, column: 22, scope: !487)
!4594 = !{!"0x100\00base_pre\001734\000", !487, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1734]
!4595 = !MDLocation(line: 1734, column: 20, scope: !487)
!4596 = !MDLocation(line: 1734, column: 31, scope: !487)
!4597 = !{!"0x100\00in_what_stride\001735\000", !487, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1735]
!4598 = !MDLocation(line: 1735, column: 9, scope: !487)
!4599 = !MDLocation(line: 1735, column: 26, scope: !487)
!4600 = !{!"0x100\00what\001736\000", !487, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1736]
!4601 = !MDLocation(line: 1736, column: 20, scope: !487)
!4602 = !MDLocation(line: 1736, column: 30, scope: !487)
!4603 = !MDLocation(line: 1736, column: 28, scope: !487)
!4604 = !MDLocation(line: 1736, column: 45, scope: !487)
!4605 = !{!"0x100\00best_address\001737\000", !487, !69, !60} ; [ DW_TAG_auto_variable ] [best_address] [line 1737]
!4606 = !MDLocation(line: 1737, column: 20, scope: !487)
!4607 = !MDLocation(line: 1737, column: 53, scope: !487)
!4608 = !MDLocation(line: 1737, column: 64, scope: !487)
!4609 = !MDLocation(line: 1738, column: 10, scope: !487)
!4610 = !MDLocation(line: 1738, column: 30, scope: !487)
!4611 = !MDLocation(line: 1738, column: 44, scope: !487)
!4612 = !{!"0x100\00check_here\001739\000", !487, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1739]
!4613 = !MDLocation(line: 1739, column: 20, scope: !487)
!4614 = !{!"0x100\00this_mv\001740\000", !487, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1740]
!4615 = !MDLocation(line: 1740, column: 12, scope: !487)
!4616 = !{!"0x100\00bestsad\001741\000", !487, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1741]
!4617 = !MDLocation(line: 1741, column: 18, scope: !487)
!4618 = !{!"0x100\00thissad\001742\000", !487, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1742]
!4619 = !MDLocation(line: 1742, column: 18, scope: !487)
!4620 = !{!"0x100\00mvsadcost\001744\000", !487, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1744]
!4621 = !MDLocation(line: 1744, column: 10, scope: !487)
!4622 = !{!"0x100\00fcenter_mv\001745\000", !487, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1745]
!4623 = !MDLocation(line: 1745, column: 12, scope: !487)
!4624 = !MDLocation(line: 1747, column: 20, scope: !487)
!4625 = !MDLocation(line: 1747, column: 5, scope: !487)
!4626 = !MDLocation(line: 1748, column: 20, scope: !487)
!4627 = !MDLocation(line: 1748, column: 5, scope: !487)
!4628 = !MDLocation(line: 1749, column: 28, scope: !487)
!4629 = !MDLocation(line: 1749, column: 5, scope: !487)
!4630 = !MDLocation(line: 1750, column: 28, scope: !487)
!4631 = !MDLocation(line: 1750, column: 5, scope: !487)
!4632 = !MDLocation(line: 1752, column: 15, scope: !487)
!4633 = !MDLocation(line: 1752, column: 27, scope: !487)
!4634 = !MDLocation(line: 1752, column: 33, scope: !487)
!4635 = !MDLocation(line: 1752, column: 46, scope: !487)
!4636 = !MDLocation(line: 1753, column: 27, scope: !487)
!4637 = !MDLocation(line: 1754, column: 30, scope: !487)
!4638 = !MDLocation(line: 1754, column: 51, scope: !487)
!4639 = !MDLocation(line: 1754, column: 62, scope: !487)
!4640 = !MDLocation(line: 1754, column: 15, scope: !487)
!4641 = !MDLocation(line: 1752, column: 5, scope: !487)
!4642 = !MDLocation(line: 1756, column: 10, scope: !4643)
!4643 = !{!"0xb\001756\005\00323", !1, !487}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4644 = !MDLocation(line: 1756, column: 15, scope: !4645)
!4645 = !{!"0xb\002", !1, !4646}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4646 = !{!"0xb\001", !1, !4647}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4647 = !{!"0xb\001756\005\00324", !1, !4643}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4648 = !MDLocation(line: 1756, column: 17, scope: !4647)
!4649 = !MDLocation(line: 1756, column: 15, scope: !4647)
!4650 = !MDLocation(line: 1756, column: 5, scope: !4643)
!4651 = !{!"0x100\00best_site\001758\000", !4652, !69, !72} ; [ DW_TAG_auto_variable ] [best_site] [line 1758]
!4652 = !{!"0xb\001757\005\00325", !1, !4647}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4653 = !MDLocation(line: 1758, column: 13, scope: !4652)
!4654 = !MDLocation(line: 1760, column: 14, scope: !4655)
!4655 = !{!"0xb\001760\009\00326", !1, !4652}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4656 = !MDLocation(line: 1760, column: 22, scope: !4657)
!4657 = !{!"0xb\002", !1, !4658}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4658 = !{!"0xb\001", !1, !4659}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4659 = !{!"0xb\001760\009\00327", !1, !4655}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4660 = !MDLocation(line: 1760, column: 9, scope: !4655)
!4661 = !MDLocation(line: 1762, column: 31, scope: !4662)
!4662 = !{!"0xb\001761\009\00328", !1, !4659}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4663 = !MDLocation(line: 1762, column: 61, scope: !4662)
!4664 = !MDLocation(line: 1762, column: 51, scope: !4662)
!4665 = !MDLocation(line: 1762, column: 13, scope: !4662)
!4666 = !MDLocation(line: 1763, column: 31, scope: !4662)
!4667 = !MDLocation(line: 1763, column: 61, scope: !4662)
!4668 = !MDLocation(line: 1763, column: 51, scope: !4662)
!4669 = !MDLocation(line: 1763, column: 13, scope: !4662)
!4670 = !MDLocation(line: 1765, column: 18, scope: !4671)
!4671 = !{!"0xb\001765\0017\00329", !1, !4662}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4672 = !MDLocation(line: 1765, column: 36, scope: !4671)
!4673 = !MDLocation(line: 1765, column: 17, scope: !4662)
!4674 = !MDLocation(line: 1765, column: 55, scope: !4675)
!4675 = !{!"0xb\001", !1, !4671}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4676 = !MDLocation(line: 1765, column: 73, scope: !4671)
!4677 = !MDLocation(line: 1765, column: 55, scope: !4671)
!4678 = !MDLocation(line: 1766, column: 14, scope: !4671)
!4679 = !MDLocation(line: 1766, column: 32, scope: !4671)
!4680 = !MDLocation(line: 1766, column: 51, scope: !4671)
!4681 = !MDLocation(line: 1766, column: 69, scope: !4671)
!4682 = !MDLocation(line: 1768, column: 41, scope: !4683)
!4683 = !{!"0xb\001767\0013\00330", !1, !4671}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4684 = !MDLocation(line: 1768, column: 31, scope: !4683)
!4685 = !MDLocation(line: 1768, column: 30, scope: !4683)
!4686 = !MDLocation(line: 1768, column: 49, scope: !4683)
!4687 = !MDLocation(line: 1768, column: 76, scope: !4683)
!4688 = !MDLocation(line: 1768, column: 66, scope: !4683)
!4689 = !MDLocation(line: 1768, column: 85, scope: !4683)
!4690 = !MDLocation(line: 1768, column: 17, scope: !4683)
!4691 = !MDLocation(line: 1769, column: 27, scope: !4683)
!4692 = !MDLocation(line: 1769, column: 39, scope: !4683)
!4693 = !MDLocation(line: 1769, column: 45, scope: !4683)
!4694 = !MDLocation(line: 1769, column: 58, scope: !4683)
!4695 = !MDLocation(line: 1769, column: 71, scope: !4683)
!4696 = !MDLocation(line: 1769, column: 87, scope: !4683)
!4697 = !MDLocation(line: 1769, column: 17, scope: !4683)
!4698 = !MDLocation(line: 1771, column: 21, scope: !4699)
!4699 = !{!"0xb\001771\0021\00331", !1, !4683}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4700 = !MDLocation(line: 1771, column: 31, scope: !4699)
!4701 = !MDLocation(line: 1771, column: 21, scope: !4683)
!4702 = !MDLocation(line: 1773, column: 41, scope: !4703)
!4703 = !{!"0xb\001772\0017\00332", !1, !4699}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4704 = !MDLocation(line: 1773, column: 21, scope: !4703)
!4705 = !MDLocation(line: 1774, column: 41, scope: !4703)
!4706 = !MDLocation(line: 1774, column: 21, scope: !4703)
!4707 = !MDLocation(line: 1775, column: 70, scope: !4703)
!4708 = !MDLocation(line: 1775, column: 81, scope: !4703)
!4709 = !MDLocation(line: 1775, column: 32, scope: !4703)
!4710 = !MDLocation(line: 1775, column: 21, scope: !4703)
!4711 = !MDLocation(line: 1777, column: 25, scope: !4712)
!4712 = !{!"0xb\001777\0025\00333", !1, !4703}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4713 = !MDLocation(line: 1777, column: 35, scope: !4712)
!4714 = !MDLocation(line: 1777, column: 25, scope: !4703)
!4715 = !MDLocation(line: 1779, column: 35, scope: !4716)
!4716 = !{!"0xb\001778\0021\00334", !1, !4712}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4717 = !MDLocation(line: 1779, column: 25, scope: !4716)
!4718 = !MDLocation(line: 1780, column: 37, scope: !4716)
!4719 = !MDLocation(line: 1780, column: 25, scope: !4716)
!4720 = !MDLocation(line: 1781, column: 21, scope: !4716)
!4721 = !MDLocation(line: 1782, column: 17, scope: !4703)
!4722 = !MDLocation(line: 1783, column: 13, scope: !4683)
!4723 = !MDLocation(line: 1784, column: 9, scope: !4662)
!4724 = !MDLocation(line: 1760, column: 30, scope: !4659)
!4725 = !MDLocation(line: 1760, column: 9, scope: !4659)
!4726 = !MDLocation(line: 1786, column: 13, scope: !4727)
!4727 = !{!"0xb\001786\0013\00335", !1, !4652}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4728 = !MDLocation(line: 1786, column: 13, scope: !4652)
!4729 = !MDLocation(line: 1787, column: 13, scope: !4727)
!4730 = !MDLocation(line: 1790, column: 44, scope: !4731)
!4731 = !{!"0xb\001789\009\00336", !1, !4727}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4732 = !MDLocation(line: 1790, column: 34, scope: !4731)
!4733 = !MDLocation(line: 1790, column: 13, scope: !4731)
!4734 = !MDLocation(line: 1791, column: 44, scope: !4731)
!4735 = !MDLocation(line: 1791, column: 34, scope: !4731)
!4736 = !MDLocation(line: 1791, column: 13, scope: !4731)
!4737 = !MDLocation(line: 1792, column: 40, scope: !4731)
!4738 = !MDLocation(line: 1792, column: 30, scope: !4731)
!4739 = !MDLocation(line: 1792, column: 29, scope: !4731)
!4740 = !MDLocation(line: 1792, column: 56, scope: !4731)
!4741 = !MDLocation(line: 1792, column: 83, scope: !4731)
!4742 = !MDLocation(line: 1792, column: 73, scope: !4731)
!4743 = !MDLocation(line: 1792, column: 13, scope: !4731)
!4744 = !MDLocation(line: 1794, column: 5, scope: !4652)
!4745 = !MDLocation(line: 1756, column: 31, scope: !4647)
!4746 = !MDLocation(line: 1756, column: 5, scope: !4647)
!4747 = !MDLocation(line: 1796, column: 25, scope: !487)
!4748 = !MDLocation(line: 1796, column: 5, scope: !487)
!4749 = !MDLocation(line: 1797, column: 25, scope: !487)
!4750 = !MDLocation(line: 1797, column: 5, scope: !487)
!4751 = !MDLocation(line: 1799, column: 12, scope: !487)
!4752 = !MDLocation(line: 1799, column: 23, scope: !487)
!4753 = !MDLocation(line: 1799, column: 29, scope: !487)
!4754 = !MDLocation(line: 1799, column: 42, scope: !487)
!4755 = !MDLocation(line: 1799, column: 56, scope: !487)
!4756 = !MDLocation(line: 1800, column: 36, scope: !487)
!4757 = !MDLocation(line: 1800, column: 47, scope: !487)
!4758 = !MDLocation(line: 1800, column: 55, scope: !487)
!4759 = !MDLocation(line: 1800, column: 14, scope: !487)
!4760 = !MDLocation(line: 1799, column: 5, scope: !487)
!4761 = !{!"0x101\00x\0016779019\000", !488, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1803]
!4762 = !MDLocation(line: 1803, column: 43, scope: !488)
!4763 = !{!"0x101\00b\0033556235\000", !488, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1803]
!4764 = !MDLocation(line: 1803, column: 53, scope: !488)
!4765 = !{!"0x101\00d\0050333451\000", !488, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1803]
!4766 = !MDLocation(line: 1803, column: 64, scope: !488)
!4767 = !{!"0x101\00ref_mv\0067110668\000", !488, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1804]
!4768 = !MDLocation(line: 1804, column: 39, scope: !488)
!4769 = !{!"0x101\00error_per_bit\0083887884\000", !488, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 1804]
!4770 = !MDLocation(line: 1804, column: 51, scope: !488)
!4771 = !{!"0x101\00search_range\00100665101\000", !488, !69, !72} ; [ DW_TAG_arg_variable ] [search_range] [line 1805]
!4772 = !MDLocation(line: 1805, column: 35, scope: !488)
!4773 = !{!"0x101\00fn_ptr\00117442317\000", !488, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1805]
!4774 = !MDLocation(line: 1805, column: 72, scope: !488)
!4775 = !{!"0x101\00mvcost\00134219534\000", !488, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1806]
!4776 = !MDLocation(line: 1806, column: 36, scope: !488)
!4777 = !{!"0x101\00center_mv\00150996750\000", !488, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1806]
!4778 = !MDLocation(line: 1806, column: 55, scope: !488)
!4779 = !{!"0x100\00neighbors\001808\000", !488, !69, !2509} ; [ DW_TAG_auto_variable ] [neighbors] [line 1808]
!4780 = !MDLocation(line: 1808, column: 8, scope: !488)
!4781 = !{!"0x100\00i\001809\000", !488, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1809]
!4782 = !MDLocation(line: 1809, column: 9, scope: !488)
!4783 = !{!"0x100\00j\001809\000", !488, !69, !72} ; [ DW_TAG_auto_variable ] [j] [line 1809]
!4784 = !MDLocation(line: 1809, column: 12, scope: !488)
!4785 = !{!"0x100\00this_row_offset\001810\000", !488, !69, !86} ; [ DW_TAG_auto_variable ] [this_row_offset] [line 1810]
!4786 = !MDLocation(line: 1810, column: 11, scope: !488)
!4787 = !{!"0x100\00this_col_offset\001810\000", !488, !69, !86} ; [ DW_TAG_auto_variable ] [this_col_offset] [line 1810]
!4788 = !MDLocation(line: 1810, column: 28, scope: !488)
!4789 = !{!"0x100\00what_stride\001812\000", !488, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1812]
!4790 = !MDLocation(line: 1812, column: 9, scope: !488)
!4791 = !MDLocation(line: 1812, column: 23, scope: !488)
!4792 = !{!"0x100\00pre_stride\001813\000", !488, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1813]
!4793 = !MDLocation(line: 1813, column: 9, scope: !488)
!4794 = !MDLocation(line: 1813, column: 22, scope: !488)
!4795 = !{!"0x100\00base_pre\001814\000", !488, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1814]
!4796 = !MDLocation(line: 1814, column: 20, scope: !488)
!4797 = !MDLocation(line: 1814, column: 31, scope: !488)
!4798 = !{!"0x100\00in_what_stride\001815\000", !488, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1815]
!4799 = !MDLocation(line: 1815, column: 9, scope: !488)
!4800 = !MDLocation(line: 1815, column: 26, scope: !488)
!4801 = !{!"0x100\00what\001816\000", !488, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1816]
!4802 = !MDLocation(line: 1816, column: 20, scope: !488)
!4803 = !MDLocation(line: 1816, column: 30, scope: !488)
!4804 = !MDLocation(line: 1816, column: 28, scope: !488)
!4805 = !MDLocation(line: 1816, column: 45, scope: !488)
!4806 = !{!"0x100\00best_address\001817\000", !488, !69, !60} ; [ DW_TAG_auto_variable ] [best_address] [line 1817]
!4807 = !MDLocation(line: 1817, column: 20, scope: !488)
!4808 = !MDLocation(line: 1817, column: 53, scope: !488)
!4809 = !MDLocation(line: 1817, column: 64, scope: !488)
!4810 = !MDLocation(line: 1818, column: 10, scope: !488)
!4811 = !MDLocation(line: 1818, column: 30, scope: !488)
!4812 = !MDLocation(line: 1818, column: 44, scope: !488)
!4813 = !{!"0x100\00check_here\001819\000", !488, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1819]
!4814 = !MDLocation(line: 1819, column: 20, scope: !488)
!4815 = !{!"0x100\00this_mv\001820\000", !488, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1820]
!4816 = !MDLocation(line: 1820, column: 12, scope: !488)
!4817 = !{!"0x100\00bestsad\001821\000", !488, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1821]
!4818 = !MDLocation(line: 1821, column: 18, scope: !488)
!4819 = !{!"0x100\00thissad\001822\000", !488, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1822]
!4820 = !MDLocation(line: 1822, column: 18, scope: !488)
!4821 = !{!"0x100\00mvsadcost\001824\000", !488, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1824]
!4822 = !MDLocation(line: 1824, column: 10, scope: !488)
!4823 = !{!"0x100\00fcenter_mv\001825\000", !488, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1825]
!4824 = !MDLocation(line: 1825, column: 12, scope: !488)
!4825 = !MDLocation(line: 1827, column: 20, scope: !488)
!4826 = !MDLocation(line: 1827, column: 5, scope: !488)
!4827 = !MDLocation(line: 1828, column: 20, scope: !488)
!4828 = !MDLocation(line: 1828, column: 5, scope: !488)
!4829 = !MDLocation(line: 1829, column: 28, scope: !488)
!4830 = !MDLocation(line: 1829, column: 5, scope: !488)
!4831 = !MDLocation(line: 1830, column: 28, scope: !488)
!4832 = !MDLocation(line: 1830, column: 5, scope: !488)
!4833 = !MDLocation(line: 1832, column: 15, scope: !488)
!4834 = !MDLocation(line: 1832, column: 27, scope: !488)
!4835 = !MDLocation(line: 1832, column: 33, scope: !488)
!4836 = !MDLocation(line: 1832, column: 46, scope: !488)
!4837 = !MDLocation(line: 1833, column: 27, scope: !488)
!4838 = !MDLocation(line: 1834, column: 30, scope: !488)
!4839 = !MDLocation(line: 1834, column: 51, scope: !488)
!4840 = !MDLocation(line: 1834, column: 62, scope: !488)
!4841 = !MDLocation(line: 1834, column: 15, scope: !488)
!4842 = !MDLocation(line: 1832, column: 5, scope: !488)
!4843 = !MDLocation(line: 1836, column: 10, scope: !4844)
!4844 = !{!"0xb\001836\005\00337", !1, !488}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4845 = !MDLocation(line: 1836, column: 15, scope: !4846)
!4846 = !{!"0xb\002", !1, !4847}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4847 = !{!"0xb\001", !1, !4848}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4848 = !{!"0xb\001836\005\00338", !1, !4844}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4849 = !MDLocation(line: 1836, column: 17, scope: !4848)
!4850 = !MDLocation(line: 1836, column: 15, scope: !4848)
!4851 = !MDLocation(line: 1836, column: 5, scope: !4844)
!4852 = !{!"0x100\00best_site\001838\000", !4853, !69, !72} ; [ DW_TAG_auto_variable ] [best_site] [line 1838]
!4853 = !{!"0xb\001837\005\00339", !1, !4848}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4854 = !MDLocation(line: 1838, column: 13, scope: !4853)
!4855 = !{!"0x100\00all_in\001839\000", !4853, !69, !72} ; [ DW_TAG_auto_variable ] [all_in] [line 1839]
!4856 = !MDLocation(line: 1839, column: 13, scope: !4853)
!4857 = !MDLocation(line: 1841, column: 21, scope: !4853)
!4858 = !MDLocation(line: 1841, column: 46, scope: !4853)
!4859 = !MDLocation(line: 1841, column: 20, scope: !4853)
!4860 = !MDLocation(line: 1841, column: 9, scope: !4853)
!4861 = !MDLocation(line: 1842, column: 21, scope: !4853)
!4862 = !MDLocation(line: 1842, column: 46, scope: !4853)
!4863 = !MDLocation(line: 1842, column: 20, scope: !4853)
!4864 = !MDLocation(line: 1842, column: 9, scope: !4853)
!4865 = !MDLocation(line: 1843, column: 21, scope: !4853)
!4866 = !MDLocation(line: 1843, column: 46, scope: !4853)
!4867 = !MDLocation(line: 1843, column: 20, scope: !4853)
!4868 = !MDLocation(line: 1843, column: 9, scope: !4853)
!4869 = !MDLocation(line: 1844, column: 21, scope: !4853)
!4870 = !MDLocation(line: 1844, column: 46, scope: !4853)
!4871 = !MDLocation(line: 1844, column: 20, scope: !4853)
!4872 = !MDLocation(line: 1844, column: 9, scope: !4853)
!4873 = !MDLocation(line: 1846, column: 12, scope: !4874)
!4874 = !{!"0xb\001846\0012\00340", !1, !4853}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4875 = !MDLocation(line: 1846, column: 12, scope: !4853)
!4876 = !{!"0x100\00sad_array\001848\000", !4877, !69, !3539} ; [ DW_TAG_auto_variable ] [sad_array] [line 1848]
!4877 = !{!"0xb\001847\009\00341", !1, !4874}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4878 = !MDLocation(line: 1848, column: 26, scope: !4877)
!4879 = !{!"0x100\00block_offset\001849\000", !4877, !69, !3552} ; [ DW_TAG_auto_variable ] [block_offset] [line 1849]
!4880 = !MDLocation(line: 1849, column: 34, scope: !4877)
!4881 = !MDLocation(line: 1850, column: 31, scope: !4877)
!4882 = !MDLocation(line: 1850, column: 46, scope: !4877)
!4883 = !MDLocation(line: 1850, column: 13, scope: !4877)
!4884 = !MDLocation(line: 1851, column: 31, scope: !4877)
!4885 = !MDLocation(line: 1851, column: 13, scope: !4877)
!4886 = !MDLocation(line: 1852, column: 31, scope: !4877)
!4887 = !MDLocation(line: 1852, column: 13, scope: !4877)
!4888 = !MDLocation(line: 1853, column: 31, scope: !4877)
!4889 = !MDLocation(line: 1853, column: 46, scope: !4877)
!4890 = !MDLocation(line: 1853, column: 13, scope: !4877)
!4891 = !MDLocation(line: 1855, column: 13, scope: !4877)
!4892 = !MDLocation(line: 1855, column: 28, scope: !4877)
!4893 = !MDLocation(line: 1855, column: 34, scope: !4877)
!4894 = !MDLocation(line: 1855, column: 47, scope: !4877)
!4895 = !MDLocation(line: 1855, column: 61, scope: !4877)
!4896 = !MDLocation(line: 1855, column: 77, scope: !4877)
!4897 = !MDLocation(line: 1857, column: 18, scope: !4898)
!4898 = !{!"0xb\001857\0013\00342", !1, !4877}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4899 = !MDLocation(line: 1857, column: 25, scope: !4900)
!4900 = !{!"0xb\002", !1, !4901}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4901 = !{!"0xb\001", !1, !4902}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4902 = !{!"0xb\001857\0013\00343", !1, !4898}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4903 = !MDLocation(line: 1857, column: 13, scope: !4898)
!4904 = !MDLocation(line: 1859, column: 31, scope: !4905)
!4905 = !{!"0xb\001859\0021\00345", !1, !4906}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4906 = !{!"0xb\001858\0013\00344", !1, !4902}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4907 = !MDLocation(line: 1859, column: 21, scope: !4905)
!4908 = !MDLocation(line: 1859, column: 36, scope: !4905)
!4909 = !MDLocation(line: 1859, column: 21, scope: !4906)
!4910 = !MDLocation(line: 1861, column: 41, scope: !4911)
!4911 = !{!"0xb\001860\0017\00346", !1, !4905}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4912 = !MDLocation(line: 1861, column: 71, scope: !4911)
!4913 = !MDLocation(line: 1861, column: 61, scope: !4911)
!4914 = !MDLocation(line: 1861, column: 21, scope: !4911)
!4915 = !MDLocation(line: 1862, column: 41, scope: !4911)
!4916 = !MDLocation(line: 1862, column: 71, scope: !4911)
!4917 = !MDLocation(line: 1862, column: 61, scope: !4911)
!4918 = !MDLocation(line: 1862, column: 21, scope: !4911)
!4919 = !MDLocation(line: 1863, column: 75, scope: !4911)
!4920 = !MDLocation(line: 1863, column: 86, scope: !4911)
!4921 = !MDLocation(line: 1863, column: 37, scope: !4911)
!4922 = !MDLocation(line: 1863, column: 31, scope: !4911)
!4923 = !MDLocation(line: 1863, column: 21, scope: !4911)
!4924 = !MDLocation(line: 1865, column: 35, scope: !4925)
!4925 = !{!"0xb\001865\0025\00347", !1, !4911}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4926 = !MDLocation(line: 1865, column: 25, scope: !4925)
!4927 = !MDLocation(line: 1865, column: 40, scope: !4925)
!4928 = !MDLocation(line: 1865, column: 25, scope: !4911)
!4929 = !MDLocation(line: 1867, column: 45, scope: !4930)
!4930 = !{!"0xb\001866\0021\00348", !1, !4925}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4931 = !MDLocation(line: 1867, column: 35, scope: !4930)
!4932 = !MDLocation(line: 1867, column: 25, scope: !4930)
!4933 = !MDLocation(line: 1868, column: 37, scope: !4930)
!4934 = !MDLocation(line: 1868, column: 25, scope: !4930)
!4935 = !MDLocation(line: 1869, column: 21, scope: !4930)
!4936 = !MDLocation(line: 1870, column: 17, scope: !4911)
!4937 = !MDLocation(line: 1871, column: 13, scope: !4906)
!4938 = !MDLocation(line: 1857, column: 32, scope: !4902)
!4939 = !MDLocation(line: 1857, column: 13, scope: !4902)
!4940 = !MDLocation(line: 1872, column: 9, scope: !4877)
!4941 = !MDLocation(line: 1875, column: 18, scope: !4942)
!4942 = !{!"0xb\001875\0013\00350", !1, !4943}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4943 = !{!"0xb\001874\009\00349", !1, !4874}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4944 = !MDLocation(line: 1875, column: 26, scope: !4945)
!4945 = !{!"0xb\002", !1, !4946}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4946 = !{!"0xb\001", !1, !4947}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4947 = !{!"0xb\001875\0013\00351", !1, !4942}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4948 = !MDLocation(line: 1875, column: 13, scope: !4942)
!4949 = !MDLocation(line: 1877, column: 35, scope: !4950)
!4950 = !{!"0xb\001876\0013\00352", !1, !4947}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4951 = !MDLocation(line: 1877, column: 65, scope: !4950)
!4952 = !MDLocation(line: 1877, column: 55, scope: !4950)
!4953 = !MDLocation(line: 1877, column: 17, scope: !4950)
!4954 = !MDLocation(line: 1878, column: 35, scope: !4950)
!4955 = !MDLocation(line: 1878, column: 65, scope: !4950)
!4956 = !MDLocation(line: 1878, column: 55, scope: !4950)
!4957 = !MDLocation(line: 1878, column: 17, scope: !4950)
!4958 = !MDLocation(line: 1880, column: 22, scope: !4959)
!4959 = !{!"0xb\001880\0021\00353", !1, !4950}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4960 = !MDLocation(line: 1880, column: 40, scope: !4959)
!4961 = !MDLocation(line: 1880, column: 21, scope: !4950)
!4962 = !MDLocation(line: 1880, column: 59, scope: !4963)
!4963 = !{!"0xb\001", !1, !4959}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4964 = !MDLocation(line: 1880, column: 77, scope: !4959)
!4965 = !MDLocation(line: 1880, column: 59, scope: !4959)
!4966 = !MDLocation(line: 1881, column: 18, scope: !4959)
!4967 = !MDLocation(line: 1881, column: 36, scope: !4959)
!4968 = !MDLocation(line: 1881, column: 55, scope: !4959)
!4969 = !MDLocation(line: 1881, column: 73, scope: !4959)
!4970 = !MDLocation(line: 1883, column: 45, scope: !4971)
!4971 = !{!"0xb\001882\0017\00354", !1, !4959}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4972 = !MDLocation(line: 1883, column: 35, scope: !4971)
!4973 = !MDLocation(line: 1883, column: 34, scope: !4971)
!4974 = !MDLocation(line: 1883, column: 53, scope: !4971)
!4975 = !MDLocation(line: 1883, column: 80, scope: !4971)
!4976 = !MDLocation(line: 1883, column: 70, scope: !4971)
!4977 = !MDLocation(line: 1883, column: 89, scope: !4971)
!4978 = !MDLocation(line: 1883, column: 21, scope: !4971)
!4979 = !MDLocation(line: 1884, column: 31, scope: !4971)
!4980 = !MDLocation(line: 1884, column: 43, scope: !4971)
!4981 = !MDLocation(line: 1884, column: 49, scope: !4971)
!4982 = !MDLocation(line: 1884, column: 62, scope: !4971)
!4983 = !MDLocation(line: 1884, column: 75, scope: !4971)
!4984 = !MDLocation(line: 1884, column: 91, scope: !4971)
!4985 = !MDLocation(line: 1884, column: 21, scope: !4971)
!4986 = !MDLocation(line: 1886, column: 25, scope: !4987)
!4987 = !{!"0xb\001886\0025\00355", !1, !4971}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4988 = !MDLocation(line: 1886, column: 35, scope: !4987)
!4989 = !MDLocation(line: 1886, column: 25, scope: !4971)
!4990 = !MDLocation(line: 1888, column: 45, scope: !4991)
!4991 = !{!"0xb\001887\0021\00356", !1, !4987}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!4992 = !MDLocation(line: 1888, column: 25, scope: !4991)
!4993 = !MDLocation(line: 1889, column: 45, scope: !4991)
!4994 = !MDLocation(line: 1889, column: 25, scope: !4991)
!4995 = !MDLocation(line: 1890, column: 74, scope: !4991)
!4996 = !MDLocation(line: 1890, column: 85, scope: !4991)
!4997 = !MDLocation(line: 1890, column: 36, scope: !4991)
!4998 = !MDLocation(line: 1890, column: 25, scope: !4991)
!4999 = !MDLocation(line: 1892, column: 29, scope: !5000)
!5000 = !{!"0xb\001892\0029\00357", !1, !4991}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!5001 = !MDLocation(line: 1892, column: 39, scope: !5000)
!5002 = !MDLocation(line: 1892, column: 29, scope: !4991)
!5003 = !MDLocation(line: 1894, column: 39, scope: !5004)
!5004 = !{!"0xb\001893\0025\00358", !1, !5000}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!5005 = !MDLocation(line: 1894, column: 29, scope: !5004)
!5006 = !MDLocation(line: 1895, column: 41, scope: !5004)
!5007 = !MDLocation(line: 1895, column: 29, scope: !5004)
!5008 = !MDLocation(line: 1896, column: 25, scope: !5004)
!5009 = !MDLocation(line: 1897, column: 21, scope: !4991)
!5010 = !MDLocation(line: 1898, column: 17, scope: !4971)
!5011 = !MDLocation(line: 1899, column: 13, scope: !4950)
!5012 = !MDLocation(line: 1875, column: 34, scope: !4947)
!5013 = !MDLocation(line: 1875, column: 13, scope: !4947)
!5014 = !MDLocation(line: 1902, column: 13, scope: !5015)
!5015 = !{!"0xb\001902\0013\00359", !1, !4853}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!5016 = !MDLocation(line: 1902, column: 13, scope: !4853)
!5017 = !MDLocation(line: 1903, column: 13, scope: !5015)
!5018 = !MDLocation(line: 1906, column: 44, scope: !5019)
!5019 = !{!"0xb\001905\009\00360", !1, !5015}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!5020 = !MDLocation(line: 1906, column: 34, scope: !5019)
!5021 = !MDLocation(line: 1906, column: 13, scope: !5019)
!5022 = !MDLocation(line: 1907, column: 44, scope: !5019)
!5023 = !MDLocation(line: 1907, column: 34, scope: !5019)
!5024 = !MDLocation(line: 1907, column: 13, scope: !5019)
!5025 = !MDLocation(line: 1908, column: 40, scope: !5019)
!5026 = !MDLocation(line: 1908, column: 30, scope: !5019)
!5027 = !MDLocation(line: 1908, column: 29, scope: !5019)
!5028 = !MDLocation(line: 1908, column: 56, scope: !5019)
!5029 = !MDLocation(line: 1908, column: 83, scope: !5019)
!5030 = !MDLocation(line: 1908, column: 73, scope: !5019)
!5031 = !MDLocation(line: 1908, column: 13, scope: !5019)
!5032 = !MDLocation(line: 1910, column: 5, scope: !4853)
!5033 = !MDLocation(line: 1836, column: 31, scope: !4848)
!5034 = !MDLocation(line: 1836, column: 5, scope: !4848)
!5035 = !MDLocation(line: 1912, column: 25, scope: !488)
!5036 = !MDLocation(line: 1912, column: 5, scope: !488)
!5037 = !MDLocation(line: 1913, column: 25, scope: !488)
!5038 = !MDLocation(line: 1913, column: 5, scope: !488)
!5039 = !MDLocation(line: 1915, column: 12, scope: !488)
!5040 = !MDLocation(line: 1915, column: 23, scope: !488)
!5041 = !MDLocation(line: 1915, column: 29, scope: !488)
!5042 = !MDLocation(line: 1915, column: 42, scope: !488)
!5043 = !MDLocation(line: 1915, column: 56, scope: !488)
!5044 = !MDLocation(line: 1916, column: 36, scope: !488)
!5045 = !MDLocation(line: 1916, column: 47, scope: !488)
!5046 = !MDLocation(line: 1916, column: 55, scope: !488)
!5047 = !MDLocation(line: 1916, column: 14, scope: !488)
!5048 = !MDLocation(line: 1915, column: 5, scope: !488)
