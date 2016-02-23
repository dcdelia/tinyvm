; ModuleID = 'mcomp-dbg.ll'
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
  call void @llvm.dbg.value(metadata %union.int_mv* %mv, i64 0, metadata !505, metadata !506), !dbg !507
  call void @llvm.dbg.value(metadata %union.int_mv* %ref, i64 0, metadata !508, metadata !506), !dbg !509
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !510, metadata !506), !dbg !511
  call void @llvm.dbg.value(metadata i32 %Weight, i64 0, metadata !512, metadata !506), !dbg !513
  %1 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !514
  %2 = getelementptr inbounds %struct.MV* %1, i32 0, i32 0, !dbg !514
  %3 = load i16* %2, align 2, !dbg !514
  %4 = sext i16 %3 to i32, !dbg !514
  %5 = bitcast %union.int_mv* %ref to %struct.MV*, !dbg !515
  %6 = getelementptr inbounds %struct.MV* %5, i32 0, i32 0, !dbg !515
  %7 = load i16* %6, align 2, !dbg !515
  %8 = sext i16 %7 to i32, !dbg !515
  %9 = sub nsw i32 %4, %8, !dbg !514
  %10 = ashr i32 %9, 1, !dbg !516
  %11 = sext i32 %10 to i64, !dbg !517
  %12 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !517
  %13 = load i32** %12, align 8, !dbg !517
  %14 = getelementptr inbounds i32* %13, i64 %11, !dbg !517
  %15 = load i32* %14, align 4, !dbg !517
  %16 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !518
  %17 = getelementptr inbounds %struct.MV* %16, i32 0, i32 1, !dbg !518
  %18 = load i16* %17, align 2, !dbg !518
  %19 = sext i16 %18 to i32, !dbg !518
  %20 = bitcast %union.int_mv* %ref to %struct.MV*, !dbg !519
  %21 = getelementptr inbounds %struct.MV* %20, i32 0, i32 1, !dbg !519
  %22 = load i16* %21, align 2, !dbg !519
  %23 = sext i16 %22 to i32, !dbg !519
  %24 = sub nsw i32 %19, %23, !dbg !518
  %25 = ashr i32 %24, 1, !dbg !520
  %26 = sext i32 %25 to i64, !dbg !521
  %27 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !521
  %28 = load i32** %27, align 8, !dbg !521
  %29 = getelementptr inbounds i32* %28, i64 %26, !dbg !521
  %30 = load i32* %29, align 4, !dbg !521
  %31 = add nsw i32 %15, %30, !dbg !517
  %32 = mul nsw i32 %31, %Weight, !dbg !522
  %33 = ashr i32 %32, 7, !dbg !523
  ret i32 %33, !dbg !524
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @vp8_init_dsmotion_compensation(%struct.macroblock* %x, i32 %stride) #0 {
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !525, metadata !506), !dbg !526
  call void @llvm.dbg.value(metadata i32 %stride, i64 0, metadata !527, metadata !506), !dbg !528
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !529, metadata !506), !dbg !530
  call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !531, metadata !506), !dbg !532
  %1 = sext i32 0 to i64, !dbg !533
  %2 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !533
  %3 = load %struct.search_site** %2, align 8, !dbg !533
  %4 = getelementptr inbounds %struct.search_site* %3, i64 %1, !dbg !533
  %5 = getelementptr inbounds %struct.search_site* %4, i32 0, i32 0, !dbg !533
  %6 = getelementptr inbounds %struct.MV* %5, i32 0, i32 1, !dbg !533
  store i16 0, i16* %6, align 2, !dbg !533
  %7 = sext i32 0 to i64, !dbg !534
  %8 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !534
  %9 = load %struct.search_site** %8, align 8, !dbg !534
  %10 = getelementptr inbounds %struct.search_site* %9, i64 %7, !dbg !534
  %11 = getelementptr inbounds %struct.search_site* %10, i32 0, i32 0, !dbg !534
  %12 = getelementptr inbounds %struct.MV* %11, i32 0, i32 0, !dbg !534
  store i16 0, i16* %12, align 2, !dbg !534
  %13 = sext i32 0 to i64, !dbg !535
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !535
  %15 = load %struct.search_site** %14, align 8, !dbg !535
  %16 = getelementptr inbounds %struct.search_site* %15, i64 %13, !dbg !535
  %17 = getelementptr inbounds %struct.search_site* %16, i32 0, i32 1, !dbg !535
  store i32 0, i32* %17, align 4, !dbg !535
  %18 = add nsw i32 0, 1, !dbg !536
  call void @llvm.dbg.value(metadata i32 %18, i64 0, metadata !529, metadata !506), !dbg !530
  br label %19, !dbg !537

; <label>:19                                      ; preds = %21, %0
  %Len.0 = phi i32 [ 128, %0 ], [ %104, %21 ]
  %search_site_count.0 = phi i32 [ %18, %0 ], [ %103, %21 ]
  %20 = icmp sgt i32 %Len.0, 0, !dbg !538
  br i1 %20, label %21, label %105, !dbg !537

; <label>:21                                      ; preds = %19
  %22 = sext i32 %search_site_count.0 to i64, !dbg !541
  %23 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !541
  %24 = load %struct.search_site** %23, align 8, !dbg !541
  %25 = getelementptr inbounds %struct.search_site* %24, i64 %22, !dbg !541
  %26 = getelementptr inbounds %struct.search_site* %25, i32 0, i32 0, !dbg !541
  %27 = getelementptr inbounds %struct.MV* %26, i32 0, i32 1, !dbg !541
  store i16 0, i16* %27, align 2, !dbg !541
  %28 = sub nsw i32 0, %Len.0, !dbg !543
  %29 = trunc i32 %28 to i16, !dbg !543
  %30 = sext i32 %search_site_count.0 to i64, !dbg !544
  %31 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !544
  %32 = load %struct.search_site** %31, align 8, !dbg !544
  %33 = getelementptr inbounds %struct.search_site* %32, i64 %30, !dbg !544
  %34 = getelementptr inbounds %struct.search_site* %33, i32 0, i32 0, !dbg !544
  %35 = getelementptr inbounds %struct.MV* %34, i32 0, i32 0, !dbg !544
  store i16 %29, i16* %35, align 2, !dbg !544
  %36 = sub nsw i32 0, %Len.0, !dbg !545
  %37 = mul nsw i32 %36, %stride, !dbg !545
  %38 = sext i32 %search_site_count.0 to i64, !dbg !546
  %39 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !546
  %40 = load %struct.search_site** %39, align 8, !dbg !546
  %41 = getelementptr inbounds %struct.search_site* %40, i64 %38, !dbg !546
  %42 = getelementptr inbounds %struct.search_site* %41, i32 0, i32 1, !dbg !546
  store i32 %37, i32* %42, align 4, !dbg !546
  %43 = add nsw i32 %search_site_count.0, 1, !dbg !547
  call void @llvm.dbg.value(metadata i32 %43, i64 0, metadata !529, metadata !506), !dbg !530
  %44 = sext i32 %43 to i64, !dbg !548
  %45 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !548
  %46 = load %struct.search_site** %45, align 8, !dbg !548
  %47 = getelementptr inbounds %struct.search_site* %46, i64 %44, !dbg !548
  %48 = getelementptr inbounds %struct.search_site* %47, i32 0, i32 0, !dbg !548
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1, !dbg !548
  store i16 0, i16* %49, align 2, !dbg !548
  %50 = trunc i32 %Len.0 to i16, !dbg !549
  %51 = sext i32 %43 to i64, !dbg !550
  %52 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !550
  %53 = load %struct.search_site** %52, align 8, !dbg !550
  %54 = getelementptr inbounds %struct.search_site* %53, i64 %51, !dbg !550
  %55 = getelementptr inbounds %struct.search_site* %54, i32 0, i32 0, !dbg !550
  %56 = getelementptr inbounds %struct.MV* %55, i32 0, i32 0, !dbg !550
  store i16 %50, i16* %56, align 2, !dbg !550
  %57 = mul nsw i32 %Len.0, %stride, !dbg !551
  %58 = sext i32 %43 to i64, !dbg !552
  %59 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !552
  %60 = load %struct.search_site** %59, align 8, !dbg !552
  %61 = getelementptr inbounds %struct.search_site* %60, i64 %58, !dbg !552
  %62 = getelementptr inbounds %struct.search_site* %61, i32 0, i32 1, !dbg !552
  store i32 %57, i32* %62, align 4, !dbg !552
  %63 = add nsw i32 %43, 1, !dbg !553
  call void @llvm.dbg.value(metadata i32 %63, i64 0, metadata !529, metadata !506), !dbg !530
  %64 = sub nsw i32 0, %Len.0, !dbg !554
  %65 = trunc i32 %64 to i16, !dbg !554
  %66 = sext i32 %63 to i64, !dbg !555
  %67 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !555
  %68 = load %struct.search_site** %67, align 8, !dbg !555
  %69 = getelementptr inbounds %struct.search_site* %68, i64 %66, !dbg !555
  %70 = getelementptr inbounds %struct.search_site* %69, i32 0, i32 0, !dbg !555
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 1, !dbg !555
  store i16 %65, i16* %71, align 2, !dbg !555
  %72 = sext i32 %63 to i64, !dbg !556
  %73 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !556
  %74 = load %struct.search_site** %73, align 8, !dbg !556
  %75 = getelementptr inbounds %struct.search_site* %74, i64 %72, !dbg !556
  %76 = getelementptr inbounds %struct.search_site* %75, i32 0, i32 0, !dbg !556
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0, !dbg !556
  store i16 0, i16* %77, align 2, !dbg !556
  %78 = sub nsw i32 0, %Len.0, !dbg !557
  %79 = sext i32 %63 to i64, !dbg !558
  %80 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !558
  %81 = load %struct.search_site** %80, align 8, !dbg !558
  %82 = getelementptr inbounds %struct.search_site* %81, i64 %79, !dbg !558
  %83 = getelementptr inbounds %struct.search_site* %82, i32 0, i32 1, !dbg !558
  store i32 %78, i32* %83, align 4, !dbg !558
  %84 = add nsw i32 %63, 1, !dbg !559
  call void @llvm.dbg.value(metadata i32 %84, i64 0, metadata !529, metadata !506), !dbg !530
  %85 = trunc i32 %Len.0 to i16, !dbg !560
  %86 = sext i32 %84 to i64, !dbg !561
  %87 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !561
  %88 = load %struct.search_site** %87, align 8, !dbg !561
  %89 = getelementptr inbounds %struct.search_site* %88, i64 %86, !dbg !561
  %90 = getelementptr inbounds %struct.search_site* %89, i32 0, i32 0, !dbg !561
  %91 = getelementptr inbounds %struct.MV* %90, i32 0, i32 1, !dbg !561
  store i16 %85, i16* %91, align 2, !dbg !561
  %92 = sext i32 %84 to i64, !dbg !562
  %93 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !562
  %94 = load %struct.search_site** %93, align 8, !dbg !562
  %95 = getelementptr inbounds %struct.search_site* %94, i64 %92, !dbg !562
  %96 = getelementptr inbounds %struct.search_site* %95, i32 0, i32 0, !dbg !562
  %97 = getelementptr inbounds %struct.MV* %96, i32 0, i32 0, !dbg !562
  store i16 0, i16* %97, align 2, !dbg !562
  %98 = sext i32 %84 to i64, !dbg !563
  %99 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !563
  %100 = load %struct.search_site** %99, align 8, !dbg !563
  %101 = getelementptr inbounds %struct.search_site* %100, i64 %98, !dbg !563
  %102 = getelementptr inbounds %struct.search_site* %101, i32 0, i32 1, !dbg !563
  store i32 %Len.0, i32* %102, align 4, !dbg !563
  %103 = add nsw i32 %84, 1, !dbg !564
  call void @llvm.dbg.value(metadata i32 %103, i64 0, metadata !529, metadata !506), !dbg !530
  %104 = sdiv i32 %Len.0, 2, !dbg !565
  call void @llvm.dbg.value(metadata i32 %104, i64 0, metadata !531, metadata !506), !dbg !532
  br label %19, !dbg !537

; <label>:105                                     ; preds = %19
  %106 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 13, !dbg !566
  store i32 %search_site_count.0, i32* %106, align 4, !dbg !566
  %107 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14, !dbg !567
  store i32 4, i32* %107, align 4, !dbg !567
  ret void, !dbg !568
}

; Function Attrs: nounwind uwtable
define void @vp8_init3smotion_compensation(%struct.macroblock* %x, i32 %stride) #0 {
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !569, metadata !506), !dbg !570
  call void @llvm.dbg.value(metadata i32 %stride, i64 0, metadata !571, metadata !506), !dbg !572
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !573, metadata !506), !dbg !574
  call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !575, metadata !506), !dbg !576
  %1 = sext i32 0 to i64, !dbg !577
  %2 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !577
  %3 = load %struct.search_site** %2, align 8, !dbg !577
  %4 = getelementptr inbounds %struct.search_site* %3, i64 %1, !dbg !577
  %5 = getelementptr inbounds %struct.search_site* %4, i32 0, i32 0, !dbg !577
  %6 = getelementptr inbounds %struct.MV* %5, i32 0, i32 1, !dbg !577
  store i16 0, i16* %6, align 2, !dbg !577
  %7 = sext i32 0 to i64, !dbg !578
  %8 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !578
  %9 = load %struct.search_site** %8, align 8, !dbg !578
  %10 = getelementptr inbounds %struct.search_site* %9, i64 %7, !dbg !578
  %11 = getelementptr inbounds %struct.search_site* %10, i32 0, i32 0, !dbg !578
  %12 = getelementptr inbounds %struct.MV* %11, i32 0, i32 0, !dbg !578
  store i16 0, i16* %12, align 2, !dbg !578
  %13 = sext i32 0 to i64, !dbg !579
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !579
  %15 = load %struct.search_site** %14, align 8, !dbg !579
  %16 = getelementptr inbounds %struct.search_site* %15, i64 %13, !dbg !579
  %17 = getelementptr inbounds %struct.search_site* %16, i32 0, i32 1, !dbg !579
  store i32 0, i32* %17, align 4, !dbg !579
  %18 = add nsw i32 0, 1, !dbg !580
  call void @llvm.dbg.value(metadata i32 %18, i64 0, metadata !573, metadata !506), !dbg !574
  br label %19, !dbg !581

; <label>:19                                      ; preds = %21, %0
  %Len.0 = phi i32 [ 128, %0 ], [ %198, %21 ]
  %search_site_count.0 = phi i32 [ %18, %0 ], [ %197, %21 ]
  %20 = icmp sgt i32 %Len.0, 0, !dbg !582
  br i1 %20, label %21, label %199, !dbg !581

; <label>:21                                      ; preds = %19
  %22 = sext i32 %search_site_count.0 to i64, !dbg !585
  %23 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !585
  %24 = load %struct.search_site** %23, align 8, !dbg !585
  %25 = getelementptr inbounds %struct.search_site* %24, i64 %22, !dbg !585
  %26 = getelementptr inbounds %struct.search_site* %25, i32 0, i32 0, !dbg !585
  %27 = getelementptr inbounds %struct.MV* %26, i32 0, i32 1, !dbg !585
  store i16 0, i16* %27, align 2, !dbg !585
  %28 = sub nsw i32 0, %Len.0, !dbg !587
  %29 = trunc i32 %28 to i16, !dbg !587
  %30 = sext i32 %search_site_count.0 to i64, !dbg !588
  %31 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !588
  %32 = load %struct.search_site** %31, align 8, !dbg !588
  %33 = getelementptr inbounds %struct.search_site* %32, i64 %30, !dbg !588
  %34 = getelementptr inbounds %struct.search_site* %33, i32 0, i32 0, !dbg !588
  %35 = getelementptr inbounds %struct.MV* %34, i32 0, i32 0, !dbg !588
  store i16 %29, i16* %35, align 2, !dbg !588
  %36 = sub nsw i32 0, %Len.0, !dbg !589
  %37 = mul nsw i32 %36, %stride, !dbg !589
  %38 = sext i32 %search_site_count.0 to i64, !dbg !590
  %39 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !590
  %40 = load %struct.search_site** %39, align 8, !dbg !590
  %41 = getelementptr inbounds %struct.search_site* %40, i64 %38, !dbg !590
  %42 = getelementptr inbounds %struct.search_site* %41, i32 0, i32 1, !dbg !590
  store i32 %37, i32* %42, align 4, !dbg !590
  %43 = add nsw i32 %search_site_count.0, 1, !dbg !591
  call void @llvm.dbg.value(metadata i32 %43, i64 0, metadata !573, metadata !506), !dbg !574
  %44 = sext i32 %43 to i64, !dbg !592
  %45 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !592
  %46 = load %struct.search_site** %45, align 8, !dbg !592
  %47 = getelementptr inbounds %struct.search_site* %46, i64 %44, !dbg !592
  %48 = getelementptr inbounds %struct.search_site* %47, i32 0, i32 0, !dbg !592
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1, !dbg !592
  store i16 0, i16* %49, align 2, !dbg !592
  %50 = trunc i32 %Len.0 to i16, !dbg !593
  %51 = sext i32 %43 to i64, !dbg !594
  %52 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !594
  %53 = load %struct.search_site** %52, align 8, !dbg !594
  %54 = getelementptr inbounds %struct.search_site* %53, i64 %51, !dbg !594
  %55 = getelementptr inbounds %struct.search_site* %54, i32 0, i32 0, !dbg !594
  %56 = getelementptr inbounds %struct.MV* %55, i32 0, i32 0, !dbg !594
  store i16 %50, i16* %56, align 2, !dbg !594
  %57 = mul nsw i32 %Len.0, %stride, !dbg !595
  %58 = sext i32 %43 to i64, !dbg !596
  %59 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !596
  %60 = load %struct.search_site** %59, align 8, !dbg !596
  %61 = getelementptr inbounds %struct.search_site* %60, i64 %58, !dbg !596
  %62 = getelementptr inbounds %struct.search_site* %61, i32 0, i32 1, !dbg !596
  store i32 %57, i32* %62, align 4, !dbg !596
  %63 = add nsw i32 %43, 1, !dbg !597
  call void @llvm.dbg.value(metadata i32 %63, i64 0, metadata !573, metadata !506), !dbg !574
  %64 = sub nsw i32 0, %Len.0, !dbg !598
  %65 = trunc i32 %64 to i16, !dbg !598
  %66 = sext i32 %63 to i64, !dbg !599
  %67 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !599
  %68 = load %struct.search_site** %67, align 8, !dbg !599
  %69 = getelementptr inbounds %struct.search_site* %68, i64 %66, !dbg !599
  %70 = getelementptr inbounds %struct.search_site* %69, i32 0, i32 0, !dbg !599
  %71 = getelementptr inbounds %struct.MV* %70, i32 0, i32 1, !dbg !599
  store i16 %65, i16* %71, align 2, !dbg !599
  %72 = sext i32 %63 to i64, !dbg !600
  %73 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !600
  %74 = load %struct.search_site** %73, align 8, !dbg !600
  %75 = getelementptr inbounds %struct.search_site* %74, i64 %72, !dbg !600
  %76 = getelementptr inbounds %struct.search_site* %75, i32 0, i32 0, !dbg !600
  %77 = getelementptr inbounds %struct.MV* %76, i32 0, i32 0, !dbg !600
  store i16 0, i16* %77, align 2, !dbg !600
  %78 = sub nsw i32 0, %Len.0, !dbg !601
  %79 = sext i32 %63 to i64, !dbg !602
  %80 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !602
  %81 = load %struct.search_site** %80, align 8, !dbg !602
  %82 = getelementptr inbounds %struct.search_site* %81, i64 %79, !dbg !602
  %83 = getelementptr inbounds %struct.search_site* %82, i32 0, i32 1, !dbg !602
  store i32 %78, i32* %83, align 4, !dbg !602
  %84 = add nsw i32 %63, 1, !dbg !603
  call void @llvm.dbg.value(metadata i32 %84, i64 0, metadata !573, metadata !506), !dbg !574
  %85 = trunc i32 %Len.0 to i16, !dbg !604
  %86 = sext i32 %84 to i64, !dbg !605
  %87 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !605
  %88 = load %struct.search_site** %87, align 8, !dbg !605
  %89 = getelementptr inbounds %struct.search_site* %88, i64 %86, !dbg !605
  %90 = getelementptr inbounds %struct.search_site* %89, i32 0, i32 0, !dbg !605
  %91 = getelementptr inbounds %struct.MV* %90, i32 0, i32 1, !dbg !605
  store i16 %85, i16* %91, align 2, !dbg !605
  %92 = sext i32 %84 to i64, !dbg !606
  %93 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !606
  %94 = load %struct.search_site** %93, align 8, !dbg !606
  %95 = getelementptr inbounds %struct.search_site* %94, i64 %92, !dbg !606
  %96 = getelementptr inbounds %struct.search_site* %95, i32 0, i32 0, !dbg !606
  %97 = getelementptr inbounds %struct.MV* %96, i32 0, i32 0, !dbg !606
  store i16 0, i16* %97, align 2, !dbg !606
  %98 = sext i32 %84 to i64, !dbg !607
  %99 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !607
  %100 = load %struct.search_site** %99, align 8, !dbg !607
  %101 = getelementptr inbounds %struct.search_site* %100, i64 %98, !dbg !607
  %102 = getelementptr inbounds %struct.search_site* %101, i32 0, i32 1, !dbg !607
  store i32 %Len.0, i32* %102, align 4, !dbg !607
  %103 = add nsw i32 %84, 1, !dbg !608
  call void @llvm.dbg.value(metadata i32 %103, i64 0, metadata !573, metadata !506), !dbg !574
  %104 = sub nsw i32 0, %Len.0, !dbg !609
  %105 = trunc i32 %104 to i16, !dbg !609
  %106 = sext i32 %103 to i64, !dbg !610
  %107 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !610
  %108 = load %struct.search_site** %107, align 8, !dbg !610
  %109 = getelementptr inbounds %struct.search_site* %108, i64 %106, !dbg !610
  %110 = getelementptr inbounds %struct.search_site* %109, i32 0, i32 0, !dbg !610
  %111 = getelementptr inbounds %struct.MV* %110, i32 0, i32 1, !dbg !610
  store i16 %105, i16* %111, align 2, !dbg !610
  %112 = sub nsw i32 0, %Len.0, !dbg !611
  %113 = trunc i32 %112 to i16, !dbg !611
  %114 = sext i32 %103 to i64, !dbg !612
  %115 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !612
  %116 = load %struct.search_site** %115, align 8, !dbg !612
  %117 = getelementptr inbounds %struct.search_site* %116, i64 %114, !dbg !612
  %118 = getelementptr inbounds %struct.search_site* %117, i32 0, i32 0, !dbg !612
  %119 = getelementptr inbounds %struct.MV* %118, i32 0, i32 0, !dbg !612
  store i16 %113, i16* %119, align 2, !dbg !612
  %120 = sub nsw i32 0, %Len.0, !dbg !613
  %121 = mul nsw i32 %120, %stride, !dbg !613
  %122 = sub nsw i32 %121, %Len.0, !dbg !613
  %123 = sext i32 %103 to i64, !dbg !614
  %124 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !614
  %125 = load %struct.search_site** %124, align 8, !dbg !614
  %126 = getelementptr inbounds %struct.search_site* %125, i64 %123, !dbg !614
  %127 = getelementptr inbounds %struct.search_site* %126, i32 0, i32 1, !dbg !614
  store i32 %122, i32* %127, align 4, !dbg !614
  %128 = add nsw i32 %103, 1, !dbg !615
  call void @llvm.dbg.value(metadata i32 %128, i64 0, metadata !573, metadata !506), !dbg !574
  %129 = trunc i32 %Len.0 to i16, !dbg !616
  %130 = sext i32 %128 to i64, !dbg !617
  %131 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !617
  %132 = load %struct.search_site** %131, align 8, !dbg !617
  %133 = getelementptr inbounds %struct.search_site* %132, i64 %130, !dbg !617
  %134 = getelementptr inbounds %struct.search_site* %133, i32 0, i32 0, !dbg !617
  %135 = getelementptr inbounds %struct.MV* %134, i32 0, i32 1, !dbg !617
  store i16 %129, i16* %135, align 2, !dbg !617
  %136 = sub nsw i32 0, %Len.0, !dbg !618
  %137 = trunc i32 %136 to i16, !dbg !618
  %138 = sext i32 %128 to i64, !dbg !619
  %139 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !619
  %140 = load %struct.search_site** %139, align 8, !dbg !619
  %141 = getelementptr inbounds %struct.search_site* %140, i64 %138, !dbg !619
  %142 = getelementptr inbounds %struct.search_site* %141, i32 0, i32 0, !dbg !619
  %143 = getelementptr inbounds %struct.MV* %142, i32 0, i32 0, !dbg !619
  store i16 %137, i16* %143, align 2, !dbg !619
  %144 = sub nsw i32 0, %Len.0, !dbg !620
  %145 = mul nsw i32 %144, %stride, !dbg !620
  %146 = add nsw i32 %145, %Len.0, !dbg !620
  %147 = sext i32 %128 to i64, !dbg !621
  %148 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !621
  %149 = load %struct.search_site** %148, align 8, !dbg !621
  %150 = getelementptr inbounds %struct.search_site* %149, i64 %147, !dbg !621
  %151 = getelementptr inbounds %struct.search_site* %150, i32 0, i32 1, !dbg !621
  store i32 %146, i32* %151, align 4, !dbg !621
  %152 = add nsw i32 %128, 1, !dbg !622
  call void @llvm.dbg.value(metadata i32 %152, i64 0, metadata !573, metadata !506), !dbg !574
  %153 = sub nsw i32 0, %Len.0, !dbg !623
  %154 = trunc i32 %153 to i16, !dbg !623
  %155 = sext i32 %152 to i64, !dbg !624
  %156 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !624
  %157 = load %struct.search_site** %156, align 8, !dbg !624
  %158 = getelementptr inbounds %struct.search_site* %157, i64 %155, !dbg !624
  %159 = getelementptr inbounds %struct.search_site* %158, i32 0, i32 0, !dbg !624
  %160 = getelementptr inbounds %struct.MV* %159, i32 0, i32 1, !dbg !624
  store i16 %154, i16* %160, align 2, !dbg !624
  %161 = trunc i32 %Len.0 to i16, !dbg !625
  %162 = sext i32 %152 to i64, !dbg !626
  %163 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !626
  %164 = load %struct.search_site** %163, align 8, !dbg !626
  %165 = getelementptr inbounds %struct.search_site* %164, i64 %162, !dbg !626
  %166 = getelementptr inbounds %struct.search_site* %165, i32 0, i32 0, !dbg !626
  %167 = getelementptr inbounds %struct.MV* %166, i32 0, i32 0, !dbg !626
  store i16 %161, i16* %167, align 2, !dbg !626
  %168 = mul nsw i32 %Len.0, %stride, !dbg !627
  %169 = sub nsw i32 %168, %Len.0, !dbg !627
  %170 = sext i32 %152 to i64, !dbg !628
  %171 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !628
  %172 = load %struct.search_site** %171, align 8, !dbg !628
  %173 = getelementptr inbounds %struct.search_site* %172, i64 %170, !dbg !628
  %174 = getelementptr inbounds %struct.search_site* %173, i32 0, i32 1, !dbg !628
  store i32 %169, i32* %174, align 4, !dbg !628
  %175 = add nsw i32 %152, 1, !dbg !629
  call void @llvm.dbg.value(metadata i32 %175, i64 0, metadata !573, metadata !506), !dbg !574
  %176 = trunc i32 %Len.0 to i16, !dbg !630
  %177 = sext i32 %175 to i64, !dbg !631
  %178 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !631
  %179 = load %struct.search_site** %178, align 8, !dbg !631
  %180 = getelementptr inbounds %struct.search_site* %179, i64 %177, !dbg !631
  %181 = getelementptr inbounds %struct.search_site* %180, i32 0, i32 0, !dbg !631
  %182 = getelementptr inbounds %struct.MV* %181, i32 0, i32 1, !dbg !631
  store i16 %176, i16* %182, align 2, !dbg !631
  %183 = trunc i32 %Len.0 to i16, !dbg !632
  %184 = sext i32 %175 to i64, !dbg !633
  %185 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !633
  %186 = load %struct.search_site** %185, align 8, !dbg !633
  %187 = getelementptr inbounds %struct.search_site* %186, i64 %184, !dbg !633
  %188 = getelementptr inbounds %struct.search_site* %187, i32 0, i32 0, !dbg !633
  %189 = getelementptr inbounds %struct.MV* %188, i32 0, i32 0, !dbg !633
  store i16 %183, i16* %189, align 2, !dbg !633
  %190 = mul nsw i32 %Len.0, %stride, !dbg !634
  %191 = add nsw i32 %190, %Len.0, !dbg !634
  %192 = sext i32 %175 to i64, !dbg !635
  %193 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !635
  %194 = load %struct.search_site** %193, align 8, !dbg !635
  %195 = getelementptr inbounds %struct.search_site* %194, i64 %192, !dbg !635
  %196 = getelementptr inbounds %struct.search_site* %195, i32 0, i32 1, !dbg !635
  store i32 %191, i32* %196, align 4, !dbg !635
  %197 = add nsw i32 %175, 1, !dbg !636
  call void @llvm.dbg.value(metadata i32 %197, i64 0, metadata !573, metadata !506), !dbg !574
  %198 = sdiv i32 %Len.0, 2, !dbg !637
  call void @llvm.dbg.value(metadata i32 %198, i64 0, metadata !575, metadata !506), !dbg !576
  br label %19, !dbg !581

; <label>:199                                     ; preds = %19
  %200 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 13, !dbg !638
  store i32 %search_site_count.0, i32* %200, align 4, !dbg !638
  %201 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14, !dbg !639
  store i32 8, i32* %201, align 4, !dbg !639
  ret void, !dbg !640
}

; Function Attrs: nounwind uwtable
define i32 @vp8_find_best_sub_pixel_step_iteratively(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32 %error_per_bit, %struct.variance_vtable* %vfp, i32** %mvcost, i32* %distortion, i32* %sse1) #0 {
  %sse = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !641, metadata !506), !dbg !642
  call void @llvm.dbg.value(metadata %struct.block* %b, i64 0, metadata !643, metadata !506), !dbg !644
  call void @llvm.dbg.value(metadata %struct.blockd* %d, i64 0, metadata !645, metadata !506), !dbg !646
  call void @llvm.dbg.value(metadata %union.int_mv* %bestmv, i64 0, metadata !647, metadata !506), !dbg !648
  call void @llvm.dbg.value(metadata %union.int_mv* %ref_mv, i64 0, metadata !649, metadata !506), !dbg !650
  call void @llvm.dbg.value(metadata i32 %error_per_bit, i64 0, metadata !651, metadata !506), !dbg !652
  call void @llvm.dbg.value(metadata %struct.variance_vtable* %vfp, i64 0, metadata !653, metadata !506), !dbg !654
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !655, metadata !506), !dbg !656
  call void @llvm.dbg.value(metadata i32* %distortion, i64 0, metadata !657, metadata !506), !dbg !658
  call void @llvm.dbg.value(metadata i32* %sse1, i64 0, metadata !659, metadata !506), !dbg !660
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9, !dbg !661
  %2 = load i8*** %1, align 8, !dbg !661
  %3 = load i8** %2, align 8, !dbg !662
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10, !dbg !663
  %5 = load i32* %4, align 4, !dbg !663
  %6 = sext i32 %5 to i64, !dbg !662
  %7 = getelementptr inbounds i8* %3, i64 %6, !dbg !662
  call void @llvm.dbg.value(metadata i8* %7, i64 0, metadata !664, metadata !506), !dbg !665
  %8 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !666
  %9 = getelementptr inbounds %struct.MV* %8, i32 0, i32 0, !dbg !666
  %10 = load i16* %9, align 2, !dbg !666
  %11 = sext i16 %10 to i32, !dbg !666
  %12 = ashr i32 %11, 1, !dbg !666
  call void @llvm.dbg.value(metadata i32 %12, i64 0, metadata !667, metadata !506), !dbg !668
  %13 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !669
  %14 = getelementptr inbounds %struct.MV* %13, i32 0, i32 1, !dbg !669
  %15 = load i16* %14, align 2, !dbg !669
  %16 = sext i16 %15 to i32, !dbg !669
  %17 = ashr i32 %16, 1, !dbg !669
  call void @llvm.dbg.value(metadata i32 %17, i64 0, metadata !670, metadata !506), !dbg !671
  %18 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !672
  %19 = getelementptr inbounds %struct.MV* %18, i32 0, i32 0, !dbg !672
  %20 = load i16* %19, align 2, !dbg !672
  %21 = sext i16 %20 to i32, !dbg !672
  %22 = mul nsw i32 %21, 4, !dbg !672
  call void @llvm.dbg.value(metadata i32 %22, i64 0, metadata !673, metadata !506), !dbg !674
  %23 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !675
  %24 = getelementptr inbounds %struct.MV* %23, i32 0, i32 1, !dbg !675
  %25 = load i16* %24, align 2, !dbg !675
  %26 = sext i16 %25 to i32, !dbg !675
  %27 = mul nsw i32 %26, 4, !dbg !675
  call void @llvm.dbg.value(metadata i32 %27, i64 0, metadata !676, metadata !506), !dbg !677
  call void @llvm.dbg.value(metadata i32 %22, i64 0, metadata !678, metadata !506), !dbg !679
  call void @llvm.dbg.value(metadata i32 %27, i64 0, metadata !680, metadata !506), !dbg !681
  call void @llvm.dbg.declare(metadata i32* %sse, metadata !682, metadata !506), !dbg !683
  call void @llvm.dbg.value(metadata i32 4, i64 0, metadata !684, metadata !506), !dbg !685
  call void @llvm.dbg.value(metadata i32 4, i64 0, metadata !686, metadata !506), !dbg !687
  %28 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !688
  %29 = load i32* %28, align 4, !dbg !688
  %30 = mul nsw i32 %29, 4, !dbg !688
  %31 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !688
  %32 = getelementptr inbounds %struct.MV* %31, i32 0, i32 1, !dbg !688
  %33 = load i16* %32, align 2, !dbg !688
  %34 = sext i16 %33 to i32, !dbg !688
  %35 = ashr i32 %34, 1, !dbg !688
  %36 = sub nsw i32 %35, 1023, !dbg !688
  %37 = icmp sgt i32 %30, %36, !dbg !688
  br i1 %37, label %38, label %42, !dbg !688

; <label>:38                                      ; preds = %0
  %39 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !689
  %40 = load i32* %39, align 4, !dbg !689
  %41 = mul nsw i32 %40, 4, !dbg !689
  br label %49, !dbg !689

; <label>:42                                      ; preds = %0
  %43 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !691
  %44 = getelementptr inbounds %struct.MV* %43, i32 0, i32 1, !dbg !691
  %45 = load i16* %44, align 2, !dbg !691
  %46 = sext i16 %45 to i32, !dbg !691
  %47 = ashr i32 %46, 1, !dbg !691
  %48 = sub nsw i32 %47, 1023, !dbg !691
  br label %49, !dbg !691

; <label>:49                                      ; preds = %42, %38
  %50 = phi i32 [ %41, %38 ], [ %48, %42 ], !dbg !688
  call void @llvm.dbg.value(metadata i32 %50, i64 0, metadata !693, metadata !506), !dbg !694
  %51 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !695
  %52 = load i32* %51, align 4, !dbg !695
  %53 = mul nsw i32 %52, 4, !dbg !695
  %54 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !695
  %55 = getelementptr inbounds %struct.MV* %54, i32 0, i32 1, !dbg !695
  %56 = load i16* %55, align 2, !dbg !695
  %57 = sext i16 %56 to i32, !dbg !695
  %58 = ashr i32 %57, 1, !dbg !695
  %59 = add nsw i32 %58, 1023, !dbg !695
  %60 = icmp slt i32 %53, %59, !dbg !695
  br i1 %60, label %61, label %65, !dbg !695

; <label>:61                                      ; preds = %49
  %62 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !696
  %63 = load i32* %62, align 4, !dbg !696
  %64 = mul nsw i32 %63, 4, !dbg !696
  br label %72, !dbg !696

; <label>:65                                      ; preds = %49
  %66 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !697
  %67 = getelementptr inbounds %struct.MV* %66, i32 0, i32 1, !dbg !697
  %68 = load i16* %67, align 2, !dbg !697
  %69 = sext i16 %68 to i32, !dbg !697
  %70 = ashr i32 %69, 1, !dbg !697
  %71 = add nsw i32 %70, 1023, !dbg !697
  br label %72, !dbg !697

; <label>:72                                      ; preds = %65, %61
  %73 = phi i32 [ %64, %61 ], [ %71, %65 ], !dbg !695
  call void @llvm.dbg.value(metadata i32 %73, i64 0, metadata !698, metadata !506), !dbg !699
  %74 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !700
  %75 = load i32* %74, align 4, !dbg !700
  %76 = mul nsw i32 %75, 4, !dbg !700
  %77 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !700
  %78 = getelementptr inbounds %struct.MV* %77, i32 0, i32 0, !dbg !700
  %79 = load i16* %78, align 2, !dbg !700
  %80 = sext i16 %79 to i32, !dbg !700
  %81 = ashr i32 %80, 1, !dbg !700
  %82 = sub nsw i32 %81, 1023, !dbg !700
  %83 = icmp sgt i32 %76, %82, !dbg !700
  br i1 %83, label %84, label %88, !dbg !700

; <label>:84                                      ; preds = %72
  %85 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !701
  %86 = load i32* %85, align 4, !dbg !701
  %87 = mul nsw i32 %86, 4, !dbg !701
  br label %95, !dbg !701

; <label>:88                                      ; preds = %72
  %89 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !702
  %90 = getelementptr inbounds %struct.MV* %89, i32 0, i32 0, !dbg !702
  %91 = load i16* %90, align 2, !dbg !702
  %92 = sext i16 %91 to i32, !dbg !702
  %93 = ashr i32 %92, 1, !dbg !702
  %94 = sub nsw i32 %93, 1023, !dbg !702
  br label %95, !dbg !702

; <label>:95                                      ; preds = %88, %84
  %96 = phi i32 [ %87, %84 ], [ %94, %88 ], !dbg !700
  call void @llvm.dbg.value(metadata i32 %96, i64 0, metadata !703, metadata !506), !dbg !704
  %97 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !705
  %98 = load i32* %97, align 4, !dbg !705
  %99 = mul nsw i32 %98, 4, !dbg !705
  %100 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !705
  %101 = getelementptr inbounds %struct.MV* %100, i32 0, i32 0, !dbg !705
  %102 = load i16* %101, align 2, !dbg !705
  %103 = sext i16 %102 to i32, !dbg !705
  %104 = ashr i32 %103, 1, !dbg !705
  %105 = add nsw i32 %104, 1023, !dbg !705
  %106 = icmp slt i32 %99, %105, !dbg !705
  br i1 %106, label %107, label %111, !dbg !705

; <label>:107                                     ; preds = %95
  %108 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !706
  %109 = load i32* %108, align 4, !dbg !706
  %110 = mul nsw i32 %109, 4, !dbg !706
  br label %118, !dbg !706

; <label>:111                                     ; preds = %95
  %112 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !707
  %113 = getelementptr inbounds %struct.MV* %112, i32 0, i32 0, !dbg !707
  %114 = load i16* %113, align 2, !dbg !707
  %115 = sext i16 %114 to i32, !dbg !707
  %116 = ashr i32 %115, 1, !dbg !707
  %117 = add nsw i32 %116, 1023, !dbg !707
  br label %118, !dbg !707

; <label>:118                                     ; preds = %111, %107
  %119 = phi i32 [ %110, %107 ], [ %117, %111 ], !dbg !705
  call void @llvm.dbg.value(metadata i32 %119, i64 0, metadata !708, metadata !506), !dbg !709
  %120 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !710
  %121 = getelementptr inbounds %struct.macroblockd* %120, i32 0, i32 11, !dbg !710
  %122 = getelementptr inbounds %struct.yv12_buffer_config* %121, i32 0, i32 4, !dbg !710
  %123 = load i32* %122, align 4, !dbg !710
  call void @llvm.dbg.value(metadata i32 %123, i64 0, metadata !711, metadata !506), !dbg !712
  %124 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !713
  %125 = getelementptr inbounds %struct.macroblockd* %124, i32 0, i32 11, !dbg !713
  %126 = getelementptr inbounds %struct.yv12_buffer_config* %125, i32 0, i32 13, !dbg !713
  %127 = load i8** %126, align 8, !dbg !713
  call void @llvm.dbg.value(metadata i8* %127, i64 0, metadata !714, metadata !506), !dbg !715
  %128 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !716
  call void @llvm.dbg.value(metadata %struct.macroblockd* %128, i64 0, metadata !717, metadata !506), !dbg !719
  %129 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4, !dbg !720
  %130 = load i32* %129, align 4, !dbg !720
  %131 = sext i32 %130 to i64, !dbg !721
  %132 = getelementptr inbounds i8* %127, i64 %131, !dbg !721
  %133 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !722
  %134 = getelementptr inbounds %struct.MV* %133, i32 0, i32 0, !dbg !722
  %135 = load i16* %134, align 2, !dbg !722
  %136 = sext i16 %135 to i32, !dbg !723
  %137 = mul nsw i32 %136, %123, !dbg !723
  %138 = sext i32 %137 to i64, !dbg !721
  %139 = getelementptr inbounds i8* %132, i64 %138, !dbg !721
  %140 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !724
  %141 = getelementptr inbounds %struct.MV* %140, i32 0, i32 1, !dbg !724
  %142 = load i16* %141, align 2, !dbg !724
  %143 = sext i16 %142 to i32, !dbg !724
  %144 = sext i32 %143 to i64, !dbg !721
  %145 = getelementptr inbounds i8* %139, i64 %144, !dbg !721
  call void @llvm.dbg.value(metadata i8* %145, i64 0, metadata !725, metadata !506), !dbg !726
  %146 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !727
  %147 = getelementptr inbounds %struct.MV* %146, i32 0, i32 0, !dbg !727
  %148 = load i16* %147, align 2, !dbg !727
  %149 = sext i16 %148 to i32, !dbg !727
  %150 = sub nsw i32 %149, 3, !dbg !727
  %151 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !728
  %152 = load i32* %151, align 4, !dbg !728
  %153 = icmp slt i32 %150, %152, !dbg !729
  br i1 %153, label %154, label %162, !dbg !730

; <label>:154                                     ; preds = %118
  %155 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !731
  %156 = getelementptr inbounds %struct.MV* %155, i32 0, i32 0, !dbg !731
  %157 = load i16* %156, align 2, !dbg !731
  %158 = sext i16 %157 to i32, !dbg !731
  %159 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !732
  %160 = load i32* %159, align 4, !dbg !732
  %161 = sub nsw i32 %158, %160, !dbg !733
  br label %163, !dbg !730

; <label>:162                                     ; preds = %118
  br label %163, !dbg !734

; <label>:163                                     ; preds = %162, %154
  %164 = phi i32 [ %161, %154 ], [ 3, %162 ], !dbg !730
  call void @llvm.dbg.value(metadata i32 %164, i64 0, metadata !735, metadata !506), !dbg !736
  %165 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !737
  %166 = getelementptr inbounds %struct.MV* %165, i32 0, i32 0, !dbg !737
  %167 = load i16* %166, align 2, !dbg !737
  %168 = sext i16 %167 to i32, !dbg !737
  %169 = add nsw i32 %168, 3, !dbg !737
  %170 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !738
  %171 = load i32* %170, align 4, !dbg !738
  %172 = icmp sgt i32 %169, %171, !dbg !739
  br i1 %172, label %173, label %181, !dbg !740

; <label>:173                                     ; preds = %163
  %174 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !741
  %175 = load i32* %174, align 4, !dbg !741
  %176 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !742
  %177 = getelementptr inbounds %struct.MV* %176, i32 0, i32 0, !dbg !742
  %178 = load i16* %177, align 2, !dbg !742
  %179 = sext i16 %178 to i32, !dbg !742
  %180 = sub nsw i32 %175, %179, !dbg !743
  br label %182, !dbg !740

; <label>:181                                     ; preds = %163
  br label %182, !dbg !744

; <label>:182                                     ; preds = %181, %173
  %183 = phi i32 [ %180, %173 ], [ 3, %181 ], !dbg !740
  call void @llvm.dbg.value(metadata i32 %183, i64 0, metadata !745, metadata !506), !dbg !746
  %184 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !747
  %185 = getelementptr inbounds %struct.MV* %184, i32 0, i32 1, !dbg !747
  %186 = load i16* %185, align 2, !dbg !747
  %187 = sext i16 %186 to i32, !dbg !747
  %188 = sub nsw i32 %187, 3, !dbg !747
  %189 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !748
  %190 = load i32* %189, align 4, !dbg !748
  %191 = icmp slt i32 %188, %190, !dbg !749
  br i1 %191, label %192, label %200, !dbg !750

; <label>:192                                     ; preds = %182
  %193 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !751
  %194 = getelementptr inbounds %struct.MV* %193, i32 0, i32 1, !dbg !751
  %195 = load i16* %194, align 2, !dbg !751
  %196 = sext i16 %195 to i32, !dbg !751
  %197 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !752
  %198 = load i32* %197, align 4, !dbg !752
  %199 = sub nsw i32 %196, %198, !dbg !753
  br label %201, !dbg !750

; <label>:200                                     ; preds = %182
  br label %201, !dbg !754

; <label>:201                                     ; preds = %200, %192
  %202 = phi i32 [ %199, %192 ], [ 3, %200 ], !dbg !750
  call void @llvm.dbg.value(metadata i32 %202, i64 0, metadata !755, metadata !506), !dbg !756
  call void @llvm.dbg.value(metadata i32 32, i64 0, metadata !757, metadata !506), !dbg !758
  %203 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 9, !dbg !759
  %204 = load void (i8*, i32, i8*, i32, i32)** %203, align 8, !dbg !759
  %205 = sext i32 %202 to i64, !dbg !760
  %206 = sub i64 0, %205, !dbg !760
  %207 = getelementptr inbounds i8* %145, i64 %206, !dbg !760
  %208 = mul nsw i32 %123, %164, !dbg !761
  %209 = sext i32 %208 to i64, !dbg !760
  %210 = sub i64 0, %209, !dbg !760
  %211 = getelementptr inbounds i8* %207, i64 %210, !dbg !760
  %212 = getelementptr inbounds %struct.macroblockd* %128, i32 0, i32 46, !dbg !762
  %213 = getelementptr inbounds [704 x i8]* %212, i32 0, i32 0, !dbg !762
  %214 = add nsw i32 16, %164, !dbg !763
  %215 = add nsw i32 %214, %183, !dbg !763
  call void %204(i8* %211, i32 %123, i8* %213, i32 32, i32 %215), !dbg !759
  %216 = getelementptr inbounds %struct.macroblockd* %128, i32 0, i32 46, !dbg !764
  %217 = getelementptr inbounds [704 x i8]* %216, i32 0, i32 0, !dbg !764
  %218 = mul nsw i32 32, %164, !dbg !765
  %219 = sext i32 %218 to i64, !dbg !764
  %220 = getelementptr inbounds i8* %217, i64 %219, !dbg !764
  %221 = sext i32 %202 to i64, !dbg !764
  %222 = getelementptr inbounds i8* %220, i64 %221, !dbg !764
  call void @llvm.dbg.value(metadata i8* %222, i64 0, metadata !766, metadata !506), !dbg !767
  %223 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !768
  %224 = getelementptr inbounds %struct.MV* %223, i32 0, i32 0, !dbg !768
  %225 = load i16* %224, align 2, !dbg !768
  %226 = sext i16 %225 to i32, !dbg !769
  %227 = mul nsw i32 %226, 32, !dbg !769
  %228 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !770
  %229 = getelementptr inbounds %struct.MV* %228, i32 0, i32 1, !dbg !770
  %230 = load i16* %229, align 2, !dbg !770
  %231 = sext i16 %230 to i32, !dbg !770
  %232 = add nsw i32 %227, %231, !dbg !769
  call void @llvm.dbg.value(metadata i32 %232, i64 0, metadata !771, metadata !506), !dbg !772
  %233 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !773
  %234 = getelementptr inbounds %struct.MV* %233, i32 0, i32 0, !dbg !773
  %235 = load i16* %234, align 2, !dbg !773
  %236 = sext i16 %235 to i32, !dbg !773
  %237 = mul nsw i32 %236, 8, !dbg !773
  %238 = trunc i32 %237 to i16, !dbg !773
  store i16 %238, i16* %234, align 2, !dbg !773
  %239 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !774
  %240 = getelementptr inbounds %struct.MV* %239, i32 0, i32 1, !dbg !774
  %241 = load i16* %240, align 2, !dbg !774
  %242 = sext i16 %241 to i32, !dbg !774
  %243 = mul nsw i32 %242, 8, !dbg !774
  %244 = trunc i32 %243 to i16, !dbg !774
  store i16 %244, i16* %240, align 2, !dbg !774
  %245 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 1, !dbg !775
  %246 = load i32 (i8*, i32, i8*, i32, i32*)** %245, align 8, !dbg !775
  %247 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !776
  %248 = load i32* %247, align 4, !dbg !776
  %249 = call i32 %246(i8* %222, i32 32, i8* %7, i32 %248, i32* %sse1), !dbg !775
  call void @llvm.dbg.value(metadata i32 %249, i64 0, metadata !777, metadata !506), !dbg !778
  store i32 %249, i32* %distortion, align 4, !dbg !779
  %250 = call i32 @mv_err_cost(%union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !780
  %251 = add i32 %249, %250, !dbg !781
  call void @llvm.dbg.value(metadata i32 %251, i64 0, metadata !777, metadata !506), !dbg !778
  br label %252, !dbg !782

; <label>:252                                     ; preds = %758, %201
  %br.0 = phi i32 [ %22, %201 ], [ %br.17, %758 ]
  %bc.0 = phi i32 [ %27, %201 ], [ %bc.17, %758 ]
  %tr.0 = phi i32 [ %22, %201 ], [ %br.17, %758 ]
  %tc.0 = phi i32 [ %27, %201 ], [ %bc.17, %758 ]
  %besterr.0 = phi i32 [ %251, %201 ], [ %besterr.17, %758 ]
  %halfiters.0 = phi i32 [ 4, %201 ], [ %253, %758 ]
  %253 = add i32 %halfiters.0, -1, !dbg !783
  call void @llvm.dbg.value(metadata i32 %253, i64 0, metadata !684, metadata !506), !dbg !685
  %254 = icmp ne i32 %253, 0, !dbg !782
  br i1 %254, label %255, label %759, !dbg !782

; <label>:255                                     ; preds = %252
  %256 = sub nsw i32 %tc.0, 2, !dbg !785
  %257 = icmp sge i32 %256, %50, !dbg !785
  br i1 %257, label %258, label %312, !dbg !788

; <label>:258                                     ; preds = %255
  %259 = sub nsw i32 %tc.0, 2, !dbg !789
  %260 = icmp sle i32 %259, %73, !dbg !789
  br i1 %260, label %261, label %312, !dbg !788

; <label>:261                                     ; preds = %258
  %262 = icmp sge i32 %tr.0, %96, !dbg !791
  br i1 %262, label %263, label %312, !dbg !788

; <label>:263                                     ; preds = %261
  %264 = icmp sle i32 %tr.0, %119, !dbg !793
  br i1 %264, label %265, label %312, !dbg !788

; <label>:265                                     ; preds = %263
  %266 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !795
  %267 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %266, align 8, !dbg !795
  %268 = ashr i32 %tr.0, 2, !dbg !795
  %269 = mul nsw i32 %268, 32, !dbg !795
  %270 = sub nsw i32 %tc.0, 2, !dbg !795
  %271 = ashr i32 %270, 2, !dbg !795
  %272 = add nsw i32 %269, %271, !dbg !795
  %273 = sub nsw i32 %272, %232, !dbg !795
  %274 = sext i32 %273 to i64, !dbg !795
  %275 = getelementptr inbounds i8* %222, i64 %274, !dbg !795
  %276 = sub nsw i32 %tc.0, 2, !dbg !795
  %277 = and i32 %276, 3, !dbg !795
  %278 = shl i32 %277, 1, !dbg !795
  %279 = and i32 %tr.0, 3, !dbg !795
  %280 = shl i32 %279, 1, !dbg !795
  %281 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !795
  %282 = load i32* %281, align 4, !dbg !795
  %283 = call i32 %267(i8* %275, i32 32, i32 %278, i32 %280, i8* %7, i32 %282, i32* %sse), !dbg !795
  call void @llvm.dbg.value(metadata i32 %283, i64 0, metadata !798, metadata !506), !dbg !799
  %284 = icmp ne i32** %mvcost, null, !dbg !800
  br i1 %284, label %285, label %303, !dbg !800

; <label>:285                                     ; preds = %265
  %286 = sub nsw i32 %tr.0, %12, !dbg !802
  %287 = sext i32 %286 to i64, !dbg !802
  %288 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !802
  %289 = load i32** %288, align 8, !dbg !802
  %290 = getelementptr inbounds i32* %289, i64 %287, !dbg !802
  %291 = load i32* %290, align 4, !dbg !802
  %292 = sub nsw i32 %tc.0, 2, !dbg !802
  %293 = sub nsw i32 %292, %17, !dbg !802
  %294 = sext i32 %293 to i64, !dbg !802
  %295 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !802
  %296 = load i32** %295, align 8, !dbg !802
  %297 = getelementptr inbounds i32* %296, i64 %294, !dbg !802
  %298 = load i32* %297, align 4, !dbg !802
  %299 = add nsw i32 %291, %298, !dbg !802
  %300 = mul nsw i32 %299, %error_per_bit, !dbg !802
  %301 = add nsw i32 %300, 128, !dbg !802
  %302 = ashr i32 %301, 8, !dbg !802
  br label %304, !dbg !802

; <label>:303                                     ; preds = %265
  br label %304, !dbg !804

; <label>:304                                     ; preds = %303, %285
  %305 = phi i32 [ %302, %285 ], [ 0, %303 ], !dbg !800
  %306 = add nsw i32 %305, %283, !dbg !806
  call void @llvm.dbg.value(metadata i32 %306, i64 0, metadata !809, metadata !506), !dbg !810
  %307 = icmp ult i32 %306, %besterr.0, !dbg !806
  br i1 %307, label %308, label %311, !dbg !811

; <label>:308                                     ; preds = %304
  call void @llvm.dbg.value(metadata i32 %306, i64 0, metadata !777, metadata !506), !dbg !778
  call void @llvm.dbg.value(metadata i32 %tr.0, i64 0, metadata !673, metadata !506), !dbg !674
  %309 = sub nsw i32 %tc.0, 2, !dbg !812
  call void @llvm.dbg.value(metadata i32 %309, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %283, i32* %distortion, align 4, !dbg !812
  %310 = load i32* %sse, align 4, !dbg !812
  store i32 %310, i32* %sse1, align 4, !dbg !812
  br label %311, !dbg !812

; <label>:311                                     ; preds = %308, %304
  %br.1 = phi i32 [ %tr.0, %308 ], [ %br.0, %304 ]
  %bc.1 = phi i32 [ %309, %308 ], [ %bc.0, %304 ]
  %besterr.1 = phi i32 [ %306, %308 ], [ %besterr.0, %304 ]
  br label %313, !dbg !815

; <label>:312                                     ; preds = %263, %261, %258, %255
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !809, metadata !506), !dbg !810
  br label %313

; <label>:313                                     ; preds = %312, %311
  %br.2 = phi i32 [ %br.1, %311 ], [ %br.0, %312 ]
  %bc.2 = phi i32 [ %bc.1, %311 ], [ %bc.0, %312 ]
  %besterr.2 = phi i32 [ %besterr.1, %311 ], [ %besterr.0, %312 ]
  %left.0 = phi i32 [ %306, %311 ], [ -1, %312 ]
  %314 = add nsw i32 %tc.0, 2, !dbg !818
  %315 = icmp sge i32 %314, %50, !dbg !818
  br i1 %315, label %316, label %370, !dbg !820

; <label>:316                                     ; preds = %313
  %317 = add nsw i32 %tc.0, 2, !dbg !821
  %318 = icmp sle i32 %317, %73, !dbg !821
  br i1 %318, label %319, label %370, !dbg !820

; <label>:319                                     ; preds = %316
  %320 = icmp sge i32 %tr.0, %96, !dbg !823
  br i1 %320, label %321, label %370, !dbg !820

; <label>:321                                     ; preds = %319
  %322 = icmp sle i32 %tr.0, %119, !dbg !825
  br i1 %322, label %323, label %370, !dbg !820

; <label>:323                                     ; preds = %321
  %324 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !827
  %325 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %324, align 8, !dbg !827
  %326 = ashr i32 %tr.0, 2, !dbg !827
  %327 = mul nsw i32 %326, 32, !dbg !827
  %328 = add nsw i32 %tc.0, 2, !dbg !827
  %329 = ashr i32 %328, 2, !dbg !827
  %330 = add nsw i32 %327, %329, !dbg !827
  %331 = sub nsw i32 %330, %232, !dbg !827
  %332 = sext i32 %331 to i64, !dbg !827
  %333 = getelementptr inbounds i8* %222, i64 %332, !dbg !827
  %334 = add nsw i32 %tc.0, 2, !dbg !827
  %335 = and i32 %334, 3, !dbg !827
  %336 = shl i32 %335, 1, !dbg !827
  %337 = and i32 %tr.0, 3, !dbg !827
  %338 = shl i32 %337, 1, !dbg !827
  %339 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !827
  %340 = load i32* %339, align 4, !dbg !827
  %341 = call i32 %325(i8* %333, i32 32, i32 %336, i32 %338, i8* %7, i32 %340, i32* %sse), !dbg !827
  call void @llvm.dbg.value(metadata i32 %341, i64 0, metadata !798, metadata !506), !dbg !799
  %342 = icmp ne i32** %mvcost, null, !dbg !830
  br i1 %342, label %343, label %361, !dbg !830

; <label>:343                                     ; preds = %323
  %344 = sub nsw i32 %tr.0, %12, !dbg !832
  %345 = sext i32 %344 to i64, !dbg !832
  %346 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !832
  %347 = load i32** %346, align 8, !dbg !832
  %348 = getelementptr inbounds i32* %347, i64 %345, !dbg !832
  %349 = load i32* %348, align 4, !dbg !832
  %350 = add nsw i32 %tc.0, 2, !dbg !832
  %351 = sub nsw i32 %350, %17, !dbg !832
  %352 = sext i32 %351 to i64, !dbg !832
  %353 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !832
  %354 = load i32** %353, align 8, !dbg !832
  %355 = getelementptr inbounds i32* %354, i64 %352, !dbg !832
  %356 = load i32* %355, align 4, !dbg !832
  %357 = add nsw i32 %349, %356, !dbg !832
  %358 = mul nsw i32 %357, %error_per_bit, !dbg !832
  %359 = add nsw i32 %358, 128, !dbg !832
  %360 = ashr i32 %359, 8, !dbg !832
  br label %362, !dbg !832

; <label>:361                                     ; preds = %323
  br label %362, !dbg !834

; <label>:362                                     ; preds = %361, %343
  %363 = phi i32 [ %360, %343 ], [ 0, %361 ], !dbg !830
  %364 = add nsw i32 %363, %341, !dbg !836
  call void @llvm.dbg.value(metadata i32 %364, i64 0, metadata !839, metadata !506), !dbg !840
  %365 = icmp ult i32 %364, %besterr.2, !dbg !836
  br i1 %365, label %366, label %369, !dbg !841

; <label>:366                                     ; preds = %362
  call void @llvm.dbg.value(metadata i32 %364, i64 0, metadata !777, metadata !506), !dbg !778
  call void @llvm.dbg.value(metadata i32 %tr.0, i64 0, metadata !673, metadata !506), !dbg !674
  %367 = add nsw i32 %tc.0, 2, !dbg !842
  call void @llvm.dbg.value(metadata i32 %367, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %341, i32* %distortion, align 4, !dbg !842
  %368 = load i32* %sse, align 4, !dbg !842
  store i32 %368, i32* %sse1, align 4, !dbg !842
  br label %369, !dbg !842

; <label>:369                                     ; preds = %366, %362
  %br.3 = phi i32 [ %tr.0, %366 ], [ %br.2, %362 ]
  %bc.3 = phi i32 [ %367, %366 ], [ %bc.2, %362 ]
  %besterr.3 = phi i32 [ %364, %366 ], [ %besterr.2, %362 ]
  br label %371, !dbg !845

; <label>:370                                     ; preds = %321, %319, %316, %313
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !839, metadata !506), !dbg !840
  br label %371

; <label>:371                                     ; preds = %370, %369
  %br.4 = phi i32 [ %br.3, %369 ], [ %br.2, %370 ]
  %bc.4 = phi i32 [ %bc.3, %369 ], [ %bc.2, %370 ]
  %besterr.4 = phi i32 [ %besterr.3, %369 ], [ %besterr.2, %370 ]
  %right.0 = phi i32 [ %364, %369 ], [ -1, %370 ]
  %372 = icmp sge i32 %tc.0, %50, !dbg !848
  br i1 %372, label %373, label %428, !dbg !850

; <label>:373                                     ; preds = %371
  %374 = icmp sle i32 %tc.0, %73, !dbg !851
  br i1 %374, label %375, label %428, !dbg !850

; <label>:375                                     ; preds = %373
  %376 = sub nsw i32 %tr.0, 2, !dbg !853
  %377 = icmp sge i32 %376, %96, !dbg !853
  br i1 %377, label %378, label %428, !dbg !850

; <label>:378                                     ; preds = %375
  %379 = sub nsw i32 %tr.0, 2, !dbg !855
  %380 = icmp sle i32 %379, %119, !dbg !855
  br i1 %380, label %381, label %428, !dbg !850

; <label>:381                                     ; preds = %378
  %382 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !857
  %383 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %382, align 8, !dbg !857
  %384 = sub nsw i32 %tr.0, 2, !dbg !857
  %385 = ashr i32 %384, 2, !dbg !857
  %386 = mul nsw i32 %385, 32, !dbg !857
  %387 = ashr i32 %tc.0, 2, !dbg !857
  %388 = add nsw i32 %386, %387, !dbg !857
  %389 = sub nsw i32 %388, %232, !dbg !857
  %390 = sext i32 %389 to i64, !dbg !857
  %391 = getelementptr inbounds i8* %222, i64 %390, !dbg !857
  %392 = and i32 %tc.0, 3, !dbg !857
  %393 = shl i32 %392, 1, !dbg !857
  %394 = sub nsw i32 %tr.0, 2, !dbg !857
  %395 = and i32 %394, 3, !dbg !857
  %396 = shl i32 %395, 1, !dbg !857
  %397 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !857
  %398 = load i32* %397, align 4, !dbg !857
  %399 = call i32 %383(i8* %391, i32 32, i32 %393, i32 %396, i8* %7, i32 %398, i32* %sse), !dbg !857
  call void @llvm.dbg.value(metadata i32 %399, i64 0, metadata !798, metadata !506), !dbg !799
  %400 = icmp ne i32** %mvcost, null, !dbg !860
  br i1 %400, label %401, label %419, !dbg !860

; <label>:401                                     ; preds = %381
  %402 = sub nsw i32 %tr.0, 2, !dbg !862
  %403 = sub nsw i32 %402, %12, !dbg !862
  %404 = sext i32 %403 to i64, !dbg !862
  %405 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !862
  %406 = load i32** %405, align 8, !dbg !862
  %407 = getelementptr inbounds i32* %406, i64 %404, !dbg !862
  %408 = load i32* %407, align 4, !dbg !862
  %409 = sub nsw i32 %tc.0, %17, !dbg !862
  %410 = sext i32 %409 to i64, !dbg !862
  %411 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !862
  %412 = load i32** %411, align 8, !dbg !862
  %413 = getelementptr inbounds i32* %412, i64 %410, !dbg !862
  %414 = load i32* %413, align 4, !dbg !862
  %415 = add nsw i32 %408, %414, !dbg !862
  %416 = mul nsw i32 %415, %error_per_bit, !dbg !862
  %417 = add nsw i32 %416, 128, !dbg !862
  %418 = ashr i32 %417, 8, !dbg !862
  br label %420, !dbg !862

; <label>:419                                     ; preds = %381
  br label %420, !dbg !864

; <label>:420                                     ; preds = %419, %401
  %421 = phi i32 [ %418, %401 ], [ 0, %419 ], !dbg !860
  %422 = add nsw i32 %421, %399, !dbg !866
  call void @llvm.dbg.value(metadata i32 %422, i64 0, metadata !869, metadata !506), !dbg !870
  %423 = icmp ult i32 %422, %besterr.4, !dbg !866
  br i1 %423, label %424, label %427, !dbg !871

; <label>:424                                     ; preds = %420
  call void @llvm.dbg.value(metadata i32 %422, i64 0, metadata !777, metadata !506), !dbg !778
  %425 = sub nsw i32 %tr.0, 2, !dbg !872
  call void @llvm.dbg.value(metadata i32 %425, i64 0, metadata !673, metadata !506), !dbg !674
  call void @llvm.dbg.value(metadata i32 %tc.0, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %399, i32* %distortion, align 4, !dbg !872
  %426 = load i32* %sse, align 4, !dbg !872
  store i32 %426, i32* %sse1, align 4, !dbg !872
  br label %427, !dbg !872

; <label>:427                                     ; preds = %424, %420
  %br.5 = phi i32 [ %425, %424 ], [ %br.4, %420 ]
  %bc.5 = phi i32 [ %tc.0, %424 ], [ %bc.4, %420 ]
  %besterr.5 = phi i32 [ %422, %424 ], [ %besterr.4, %420 ]
  br label %429, !dbg !875

; <label>:428                                     ; preds = %378, %375, %373, %371
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !869, metadata !506), !dbg !870
  br label %429

; <label>:429                                     ; preds = %428, %427
  %br.6 = phi i32 [ %br.5, %427 ], [ %br.4, %428 ]
  %bc.6 = phi i32 [ %bc.5, %427 ], [ %bc.4, %428 ]
  %besterr.6 = phi i32 [ %besterr.5, %427 ], [ %besterr.4, %428 ]
  %up.0 = phi i32 [ %422, %427 ], [ -1, %428 ]
  %430 = icmp sge i32 %tc.0, %50, !dbg !878
  br i1 %430, label %431, label %486, !dbg !880

; <label>:431                                     ; preds = %429
  %432 = icmp sle i32 %tc.0, %73, !dbg !881
  br i1 %432, label %433, label %486, !dbg !880

; <label>:433                                     ; preds = %431
  %434 = add nsw i32 %tr.0, 2, !dbg !883
  %435 = icmp sge i32 %434, %96, !dbg !883
  br i1 %435, label %436, label %486, !dbg !880

; <label>:436                                     ; preds = %433
  %437 = add nsw i32 %tr.0, 2, !dbg !885
  %438 = icmp sle i32 %437, %119, !dbg !885
  br i1 %438, label %439, label %486, !dbg !880

; <label>:439                                     ; preds = %436
  %440 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !887
  %441 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %440, align 8, !dbg !887
  %442 = add nsw i32 %tr.0, 2, !dbg !887
  %443 = ashr i32 %442, 2, !dbg !887
  %444 = mul nsw i32 %443, 32, !dbg !887
  %445 = ashr i32 %tc.0, 2, !dbg !887
  %446 = add nsw i32 %444, %445, !dbg !887
  %447 = sub nsw i32 %446, %232, !dbg !887
  %448 = sext i32 %447 to i64, !dbg !887
  %449 = getelementptr inbounds i8* %222, i64 %448, !dbg !887
  %450 = and i32 %tc.0, 3, !dbg !887
  %451 = shl i32 %450, 1, !dbg !887
  %452 = add nsw i32 %tr.0, 2, !dbg !887
  %453 = and i32 %452, 3, !dbg !887
  %454 = shl i32 %453, 1, !dbg !887
  %455 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !887
  %456 = load i32* %455, align 4, !dbg !887
  %457 = call i32 %441(i8* %449, i32 32, i32 %451, i32 %454, i8* %7, i32 %456, i32* %sse), !dbg !887
  call void @llvm.dbg.value(metadata i32 %457, i64 0, metadata !798, metadata !506), !dbg !799
  %458 = icmp ne i32** %mvcost, null, !dbg !890
  br i1 %458, label %459, label %477, !dbg !890

; <label>:459                                     ; preds = %439
  %460 = add nsw i32 %tr.0, 2, !dbg !892
  %461 = sub nsw i32 %460, %12, !dbg !892
  %462 = sext i32 %461 to i64, !dbg !892
  %463 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !892
  %464 = load i32** %463, align 8, !dbg !892
  %465 = getelementptr inbounds i32* %464, i64 %462, !dbg !892
  %466 = load i32* %465, align 4, !dbg !892
  %467 = sub nsw i32 %tc.0, %17, !dbg !892
  %468 = sext i32 %467 to i64, !dbg !892
  %469 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !892
  %470 = load i32** %469, align 8, !dbg !892
  %471 = getelementptr inbounds i32* %470, i64 %468, !dbg !892
  %472 = load i32* %471, align 4, !dbg !892
  %473 = add nsw i32 %466, %472, !dbg !892
  %474 = mul nsw i32 %473, %error_per_bit, !dbg !892
  %475 = add nsw i32 %474, 128, !dbg !892
  %476 = ashr i32 %475, 8, !dbg !892
  br label %478, !dbg !892

; <label>:477                                     ; preds = %439
  br label %478, !dbg !894

; <label>:478                                     ; preds = %477, %459
  %479 = phi i32 [ %476, %459 ], [ 0, %477 ], !dbg !890
  %480 = add nsw i32 %479, %457, !dbg !896
  call void @llvm.dbg.value(metadata i32 %480, i64 0, metadata !899, metadata !506), !dbg !900
  %481 = icmp ult i32 %480, %besterr.6, !dbg !896
  br i1 %481, label %482, label %485, !dbg !901

; <label>:482                                     ; preds = %478
  call void @llvm.dbg.value(metadata i32 %480, i64 0, metadata !777, metadata !506), !dbg !778
  %483 = add nsw i32 %tr.0, 2, !dbg !902
  call void @llvm.dbg.value(metadata i32 %483, i64 0, metadata !673, metadata !506), !dbg !674
  call void @llvm.dbg.value(metadata i32 %tc.0, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %457, i32* %distortion, align 4, !dbg !902
  %484 = load i32* %sse, align 4, !dbg !902
  store i32 %484, i32* %sse1, align 4, !dbg !902
  br label %485, !dbg !902

; <label>:485                                     ; preds = %482, %478
  %br.7 = phi i32 [ %483, %482 ], [ %br.6, %478 ]
  %bc.7 = phi i32 [ %tc.0, %482 ], [ %bc.6, %478 ]
  %besterr.7 = phi i32 [ %480, %482 ], [ %besterr.6, %478 ]
  br label %487, !dbg !905

; <label>:486                                     ; preds = %436, %433, %431, %429
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !899, metadata !506), !dbg !900
  br label %487

; <label>:487                                     ; preds = %486, %485
  %br.8 = phi i32 [ %br.7, %485 ], [ %br.6, %486 ]
  %bc.8 = phi i32 [ %bc.7, %485 ], [ %bc.6, %486 ]
  %besterr.8 = phi i32 [ %besterr.7, %485 ], [ %besterr.6, %486 ]
  %down.0 = phi i32 [ %480, %485 ], [ -1, %486 ]
  %488 = icmp ult i32 %left.0, %right.0, !dbg !908
  %489 = select i1 %488, i32 0, i32 1, !dbg !908
  %490 = icmp ult i32 %up.0, %down.0, !dbg !909
  %491 = select i1 %490, i32 0, i32 2, !dbg !909
  %492 = add nsw i32 %489, %491, !dbg !910
  call void @llvm.dbg.value(metadata i32 %492, i64 0, metadata !911, metadata !506), !dbg !912
  switch i32 %492, label %753 [
    i32 0, label %493
    i32 1, label %558
    i32 2, label %623
    i32 3, label %688
  ], !dbg !913

; <label>:493                                     ; preds = %487
  %494 = sub nsw i32 %tc.0, 2, !dbg !914
  %495 = icmp sge i32 %494, %50, !dbg !914
  br i1 %495, label %496, label %556, !dbg !917

; <label>:496                                     ; preds = %493
  %497 = sub nsw i32 %tc.0, 2, !dbg !918
  %498 = icmp sle i32 %497, %73, !dbg !918
  br i1 %498, label %499, label %556, !dbg !917

; <label>:499                                     ; preds = %496
  %500 = sub nsw i32 %tr.0, 2, !dbg !920
  %501 = icmp sge i32 %500, %96, !dbg !920
  br i1 %501, label %502, label %556, !dbg !917

; <label>:502                                     ; preds = %499
  %503 = sub nsw i32 %tr.0, 2, !dbg !922
  %504 = icmp sle i32 %503, %119, !dbg !922
  br i1 %504, label %505, label %556, !dbg !917

; <label>:505                                     ; preds = %502
  %506 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !924
  %507 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %506, align 8, !dbg !924
  %508 = sub nsw i32 %tr.0, 2, !dbg !924
  %509 = ashr i32 %508, 2, !dbg !924
  %510 = mul nsw i32 %509, 32, !dbg !924
  %511 = sub nsw i32 %tc.0, 2, !dbg !924
  %512 = ashr i32 %511, 2, !dbg !924
  %513 = add nsw i32 %510, %512, !dbg !924
  %514 = sub nsw i32 %513, %232, !dbg !924
  %515 = sext i32 %514 to i64, !dbg !924
  %516 = getelementptr inbounds i8* %222, i64 %515, !dbg !924
  %517 = sub nsw i32 %tc.0, 2, !dbg !924
  %518 = and i32 %517, 3, !dbg !924
  %519 = shl i32 %518, 1, !dbg !924
  %520 = sub nsw i32 %tr.0, 2, !dbg !924
  %521 = and i32 %520, 3, !dbg !924
  %522 = shl i32 %521, 1, !dbg !924
  %523 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !924
  %524 = load i32* %523, align 4, !dbg !924
  %525 = call i32 %507(i8* %516, i32 32, i32 %519, i32 %522, i8* %7, i32 %524, i32* %sse), !dbg !924
  call void @llvm.dbg.value(metadata i32 %525, i64 0, metadata !798, metadata !506), !dbg !799
  %526 = icmp ne i32** %mvcost, null, !dbg !927
  br i1 %526, label %527, label %546, !dbg !927

; <label>:527                                     ; preds = %505
  %528 = sub nsw i32 %tr.0, 2, !dbg !929
  %529 = sub nsw i32 %528, %12, !dbg !929
  %530 = sext i32 %529 to i64, !dbg !929
  %531 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !929
  %532 = load i32** %531, align 8, !dbg !929
  %533 = getelementptr inbounds i32* %532, i64 %530, !dbg !929
  %534 = load i32* %533, align 4, !dbg !929
  %535 = sub nsw i32 %tc.0, 2, !dbg !929
  %536 = sub nsw i32 %535, %17, !dbg !929
  %537 = sext i32 %536 to i64, !dbg !929
  %538 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !929
  %539 = load i32** %538, align 8, !dbg !929
  %540 = getelementptr inbounds i32* %539, i64 %537, !dbg !929
  %541 = load i32* %540, align 4, !dbg !929
  %542 = add nsw i32 %534, %541, !dbg !929
  %543 = mul nsw i32 %542, %error_per_bit, !dbg !929
  %544 = add nsw i32 %543, 128, !dbg !929
  %545 = ashr i32 %544, 8, !dbg !929
  br label %547, !dbg !929

; <label>:546                                     ; preds = %505
  br label %547, !dbg !931

; <label>:547                                     ; preds = %546, %527
  %548 = phi i32 [ %545, %527 ], [ 0, %546 ], !dbg !927
  %549 = add nsw i32 %548, %525, !dbg !933
  call void @llvm.dbg.value(metadata i32 %549, i64 0, metadata !936, metadata !506), !dbg !937
  %550 = icmp ult i32 %549, %besterr.8, !dbg !933
  br i1 %550, label %551, label %555, !dbg !938

; <label>:551                                     ; preds = %547
  call void @llvm.dbg.value(metadata i32 %549, i64 0, metadata !777, metadata !506), !dbg !778
  %552 = sub nsw i32 %tr.0, 2, !dbg !939
  call void @llvm.dbg.value(metadata i32 %552, i64 0, metadata !673, metadata !506), !dbg !674
  %553 = sub nsw i32 %tc.0, 2, !dbg !939
  call void @llvm.dbg.value(metadata i32 %553, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %525, i32* %distortion, align 4, !dbg !939
  %554 = load i32* %sse, align 4, !dbg !939
  store i32 %554, i32* %sse1, align 4, !dbg !939
  br label %555, !dbg !939

; <label>:555                                     ; preds = %551, %547
  %br.9 = phi i32 [ %552, %551 ], [ %br.8, %547 ]
  %bc.9 = phi i32 [ %553, %551 ], [ %bc.8, %547 ]
  %besterr.9 = phi i32 [ %549, %551 ], [ %besterr.8, %547 ]
  br label %557, !dbg !942

; <label>:556                                     ; preds = %502, %499, %496, %493
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !936, metadata !506), !dbg !937
  br label %557

; <label>:557                                     ; preds = %556, %555
  %br.10 = phi i32 [ %br.9, %555 ], [ %br.8, %556 ]
  %bc.10 = phi i32 [ %bc.9, %555 ], [ %bc.8, %556 ]
  %besterr.10 = phi i32 [ %besterr.9, %555 ], [ %besterr.8, %556 ]
  br label %753, !dbg !945

; <label>:558                                     ; preds = %487
  %559 = add nsw i32 %tc.0, 2, !dbg !946
  %560 = icmp sge i32 %559, %50, !dbg !946
  br i1 %560, label %561, label %621, !dbg !948

; <label>:561                                     ; preds = %558
  %562 = add nsw i32 %tc.0, 2, !dbg !949
  %563 = icmp sle i32 %562, %73, !dbg !949
  br i1 %563, label %564, label %621, !dbg !948

; <label>:564                                     ; preds = %561
  %565 = sub nsw i32 %tr.0, 2, !dbg !951
  %566 = icmp sge i32 %565, %96, !dbg !951
  br i1 %566, label %567, label %621, !dbg !948

; <label>:567                                     ; preds = %564
  %568 = sub nsw i32 %tr.0, 2, !dbg !953
  %569 = icmp sle i32 %568, %119, !dbg !953
  br i1 %569, label %570, label %621, !dbg !948

; <label>:570                                     ; preds = %567
  %571 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !955
  %572 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %571, align 8, !dbg !955
  %573 = sub nsw i32 %tr.0, 2, !dbg !955
  %574 = ashr i32 %573, 2, !dbg !955
  %575 = mul nsw i32 %574, 32, !dbg !955
  %576 = add nsw i32 %tc.0, 2, !dbg !955
  %577 = ashr i32 %576, 2, !dbg !955
  %578 = add nsw i32 %575, %577, !dbg !955
  %579 = sub nsw i32 %578, %232, !dbg !955
  %580 = sext i32 %579 to i64, !dbg !955
  %581 = getelementptr inbounds i8* %222, i64 %580, !dbg !955
  %582 = add nsw i32 %tc.0, 2, !dbg !955
  %583 = and i32 %582, 3, !dbg !955
  %584 = shl i32 %583, 1, !dbg !955
  %585 = sub nsw i32 %tr.0, 2, !dbg !955
  %586 = and i32 %585, 3, !dbg !955
  %587 = shl i32 %586, 1, !dbg !955
  %588 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !955
  %589 = load i32* %588, align 4, !dbg !955
  %590 = call i32 %572(i8* %581, i32 32, i32 %584, i32 %587, i8* %7, i32 %589, i32* %sse), !dbg !955
  call void @llvm.dbg.value(metadata i32 %590, i64 0, metadata !798, metadata !506), !dbg !799
  %591 = icmp ne i32** %mvcost, null, !dbg !958
  br i1 %591, label %592, label %611, !dbg !958

; <label>:592                                     ; preds = %570
  %593 = sub nsw i32 %tr.0, 2, !dbg !960
  %594 = sub nsw i32 %593, %12, !dbg !960
  %595 = sext i32 %594 to i64, !dbg !960
  %596 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !960
  %597 = load i32** %596, align 8, !dbg !960
  %598 = getelementptr inbounds i32* %597, i64 %595, !dbg !960
  %599 = load i32* %598, align 4, !dbg !960
  %600 = add nsw i32 %tc.0, 2, !dbg !960
  %601 = sub nsw i32 %600, %17, !dbg !960
  %602 = sext i32 %601 to i64, !dbg !960
  %603 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !960
  %604 = load i32** %603, align 8, !dbg !960
  %605 = getelementptr inbounds i32* %604, i64 %602, !dbg !960
  %606 = load i32* %605, align 4, !dbg !960
  %607 = add nsw i32 %599, %606, !dbg !960
  %608 = mul nsw i32 %607, %error_per_bit, !dbg !960
  %609 = add nsw i32 %608, 128, !dbg !960
  %610 = ashr i32 %609, 8, !dbg !960
  br label %612, !dbg !960

; <label>:611                                     ; preds = %570
  br label %612, !dbg !962

; <label>:612                                     ; preds = %611, %592
  %613 = phi i32 [ %610, %592 ], [ 0, %611 ], !dbg !958
  %614 = add nsw i32 %613, %590, !dbg !964
  call void @llvm.dbg.value(metadata i32 %614, i64 0, metadata !936, metadata !506), !dbg !937
  %615 = icmp ult i32 %614, %besterr.8, !dbg !964
  br i1 %615, label %616, label %620, !dbg !967

; <label>:616                                     ; preds = %612
  call void @llvm.dbg.value(metadata i32 %614, i64 0, metadata !777, metadata !506), !dbg !778
  %617 = sub nsw i32 %tr.0, 2, !dbg !968
  call void @llvm.dbg.value(metadata i32 %617, i64 0, metadata !673, metadata !506), !dbg !674
  %618 = add nsw i32 %tc.0, 2, !dbg !968
  call void @llvm.dbg.value(metadata i32 %618, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %590, i32* %distortion, align 4, !dbg !968
  %619 = load i32* %sse, align 4, !dbg !968
  store i32 %619, i32* %sse1, align 4, !dbg !968
  br label %620, !dbg !968

; <label>:620                                     ; preds = %616, %612
  %br.11 = phi i32 [ %617, %616 ], [ %br.8, %612 ]
  %bc.11 = phi i32 [ %618, %616 ], [ %bc.8, %612 ]
  %besterr.11 = phi i32 [ %614, %616 ], [ %besterr.8, %612 ]
  br label %622, !dbg !971

; <label>:621                                     ; preds = %567, %564, %561, %558
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !936, metadata !506), !dbg !937
  br label %622

; <label>:622                                     ; preds = %621, %620
  %br.12 = phi i32 [ %br.11, %620 ], [ %br.8, %621 ]
  %bc.12 = phi i32 [ %bc.11, %620 ], [ %bc.8, %621 ]
  %besterr.12 = phi i32 [ %besterr.11, %620 ], [ %besterr.8, %621 ]
  br label %753, !dbg !974

; <label>:623                                     ; preds = %487
  %624 = sub nsw i32 %tc.0, 2, !dbg !975
  %625 = icmp sge i32 %624, %50, !dbg !975
  br i1 %625, label %626, label %686, !dbg !977

; <label>:626                                     ; preds = %623
  %627 = sub nsw i32 %tc.0, 2, !dbg !978
  %628 = icmp sle i32 %627, %73, !dbg !978
  br i1 %628, label %629, label %686, !dbg !977

; <label>:629                                     ; preds = %626
  %630 = add nsw i32 %tr.0, 2, !dbg !980
  %631 = icmp sge i32 %630, %96, !dbg !980
  br i1 %631, label %632, label %686, !dbg !977

; <label>:632                                     ; preds = %629
  %633 = add nsw i32 %tr.0, 2, !dbg !982
  %634 = icmp sle i32 %633, %119, !dbg !982
  br i1 %634, label %635, label %686, !dbg !977

; <label>:635                                     ; preds = %632
  %636 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !984
  %637 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %636, align 8, !dbg !984
  %638 = add nsw i32 %tr.0, 2, !dbg !984
  %639 = ashr i32 %638, 2, !dbg !984
  %640 = mul nsw i32 %639, 32, !dbg !984
  %641 = sub nsw i32 %tc.0, 2, !dbg !984
  %642 = ashr i32 %641, 2, !dbg !984
  %643 = add nsw i32 %640, %642, !dbg !984
  %644 = sub nsw i32 %643, %232, !dbg !984
  %645 = sext i32 %644 to i64, !dbg !984
  %646 = getelementptr inbounds i8* %222, i64 %645, !dbg !984
  %647 = sub nsw i32 %tc.0, 2, !dbg !984
  %648 = and i32 %647, 3, !dbg !984
  %649 = shl i32 %648, 1, !dbg !984
  %650 = add nsw i32 %tr.0, 2, !dbg !984
  %651 = and i32 %650, 3, !dbg !984
  %652 = shl i32 %651, 1, !dbg !984
  %653 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !984
  %654 = load i32* %653, align 4, !dbg !984
  %655 = call i32 %637(i8* %646, i32 32, i32 %649, i32 %652, i8* %7, i32 %654, i32* %sse), !dbg !984
  call void @llvm.dbg.value(metadata i32 %655, i64 0, metadata !798, metadata !506), !dbg !799
  %656 = icmp ne i32** %mvcost, null, !dbg !987
  br i1 %656, label %657, label %676, !dbg !987

; <label>:657                                     ; preds = %635
  %658 = add nsw i32 %tr.0, 2, !dbg !989
  %659 = sub nsw i32 %658, %12, !dbg !989
  %660 = sext i32 %659 to i64, !dbg !989
  %661 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !989
  %662 = load i32** %661, align 8, !dbg !989
  %663 = getelementptr inbounds i32* %662, i64 %660, !dbg !989
  %664 = load i32* %663, align 4, !dbg !989
  %665 = sub nsw i32 %tc.0, 2, !dbg !989
  %666 = sub nsw i32 %665, %17, !dbg !989
  %667 = sext i32 %666 to i64, !dbg !989
  %668 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !989
  %669 = load i32** %668, align 8, !dbg !989
  %670 = getelementptr inbounds i32* %669, i64 %667, !dbg !989
  %671 = load i32* %670, align 4, !dbg !989
  %672 = add nsw i32 %664, %671, !dbg !989
  %673 = mul nsw i32 %672, %error_per_bit, !dbg !989
  %674 = add nsw i32 %673, 128, !dbg !989
  %675 = ashr i32 %674, 8, !dbg !989
  br label %677, !dbg !989

; <label>:676                                     ; preds = %635
  br label %677, !dbg !991

; <label>:677                                     ; preds = %676, %657
  %678 = phi i32 [ %675, %657 ], [ 0, %676 ], !dbg !987
  %679 = add nsw i32 %678, %655, !dbg !993
  call void @llvm.dbg.value(metadata i32 %679, i64 0, metadata !936, metadata !506), !dbg !937
  %680 = icmp ult i32 %679, %besterr.8, !dbg !993
  br i1 %680, label %681, label %685, !dbg !996

; <label>:681                                     ; preds = %677
  call void @llvm.dbg.value(metadata i32 %679, i64 0, metadata !777, metadata !506), !dbg !778
  %682 = add nsw i32 %tr.0, 2, !dbg !997
  call void @llvm.dbg.value(metadata i32 %682, i64 0, metadata !673, metadata !506), !dbg !674
  %683 = sub nsw i32 %tc.0, 2, !dbg !997
  call void @llvm.dbg.value(metadata i32 %683, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %655, i32* %distortion, align 4, !dbg !997
  %684 = load i32* %sse, align 4, !dbg !997
  store i32 %684, i32* %sse1, align 4, !dbg !997
  br label %685, !dbg !997

; <label>:685                                     ; preds = %681, %677
  %br.13 = phi i32 [ %682, %681 ], [ %br.8, %677 ]
  %bc.13 = phi i32 [ %683, %681 ], [ %bc.8, %677 ]
  %besterr.13 = phi i32 [ %679, %681 ], [ %besterr.8, %677 ]
  br label %687, !dbg !1000

; <label>:686                                     ; preds = %632, %629, %626, %623
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !936, metadata !506), !dbg !937
  br label %687

; <label>:687                                     ; preds = %686, %685
  %br.14 = phi i32 [ %br.13, %685 ], [ %br.8, %686 ]
  %bc.14 = phi i32 [ %bc.13, %685 ], [ %bc.8, %686 ]
  %besterr.14 = phi i32 [ %besterr.13, %685 ], [ %besterr.8, %686 ]
  br label %753, !dbg !1003

; <label>:688                                     ; preds = %487
  %689 = add nsw i32 %tc.0, 2, !dbg !1004
  %690 = icmp sge i32 %689, %50, !dbg !1004
  br i1 %690, label %691, label %751, !dbg !1006

; <label>:691                                     ; preds = %688
  %692 = add nsw i32 %tc.0, 2, !dbg !1007
  %693 = icmp sle i32 %692, %73, !dbg !1007
  br i1 %693, label %694, label %751, !dbg !1006

; <label>:694                                     ; preds = %691
  %695 = add nsw i32 %tr.0, 2, !dbg !1009
  %696 = icmp sge i32 %695, %96, !dbg !1009
  br i1 %696, label %697, label %751, !dbg !1006

; <label>:697                                     ; preds = %694
  %698 = add nsw i32 %tr.0, 2, !dbg !1011
  %699 = icmp sle i32 %698, %119, !dbg !1011
  br i1 %699, label %700, label %751, !dbg !1006

; <label>:700                                     ; preds = %697
  %701 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1013
  %702 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %701, align 8, !dbg !1013
  %703 = add nsw i32 %tr.0, 2, !dbg !1013
  %704 = ashr i32 %703, 2, !dbg !1013
  %705 = mul nsw i32 %704, 32, !dbg !1013
  %706 = add nsw i32 %tc.0, 2, !dbg !1013
  %707 = ashr i32 %706, 2, !dbg !1013
  %708 = add nsw i32 %705, %707, !dbg !1013
  %709 = sub nsw i32 %708, %232, !dbg !1013
  %710 = sext i32 %709 to i64, !dbg !1013
  %711 = getelementptr inbounds i8* %222, i64 %710, !dbg !1013
  %712 = add nsw i32 %tc.0, 2, !dbg !1013
  %713 = and i32 %712, 3, !dbg !1013
  %714 = shl i32 %713, 1, !dbg !1013
  %715 = add nsw i32 %tr.0, 2, !dbg !1013
  %716 = and i32 %715, 3, !dbg !1013
  %717 = shl i32 %716, 1, !dbg !1013
  %718 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1013
  %719 = load i32* %718, align 4, !dbg !1013
  %720 = call i32 %702(i8* %711, i32 32, i32 %714, i32 %717, i8* %7, i32 %719, i32* %sse), !dbg !1013
  call void @llvm.dbg.value(metadata i32 %720, i64 0, metadata !798, metadata !506), !dbg !799
  %721 = icmp ne i32** %mvcost, null, !dbg !1016
  br i1 %721, label %722, label %741, !dbg !1016

; <label>:722                                     ; preds = %700
  %723 = add nsw i32 %tr.0, 2, !dbg !1018
  %724 = sub nsw i32 %723, %12, !dbg !1018
  %725 = sext i32 %724 to i64, !dbg !1018
  %726 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !1018
  %727 = load i32** %726, align 8, !dbg !1018
  %728 = getelementptr inbounds i32* %727, i64 %725, !dbg !1018
  %729 = load i32* %728, align 4, !dbg !1018
  %730 = add nsw i32 %tc.0, 2, !dbg !1018
  %731 = sub nsw i32 %730, %17, !dbg !1018
  %732 = sext i32 %731 to i64, !dbg !1018
  %733 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !1018
  %734 = load i32** %733, align 8, !dbg !1018
  %735 = getelementptr inbounds i32* %734, i64 %732, !dbg !1018
  %736 = load i32* %735, align 4, !dbg !1018
  %737 = add nsw i32 %729, %736, !dbg !1018
  %738 = mul nsw i32 %737, %error_per_bit, !dbg !1018
  %739 = add nsw i32 %738, 128, !dbg !1018
  %740 = ashr i32 %739, 8, !dbg !1018
  br label %742, !dbg !1018

; <label>:741                                     ; preds = %700
  br label %742, !dbg !1020

; <label>:742                                     ; preds = %741, %722
  %743 = phi i32 [ %740, %722 ], [ 0, %741 ], !dbg !1016
  %744 = add nsw i32 %743, %720, !dbg !1022
  call void @llvm.dbg.value(metadata i32 %744, i64 0, metadata !936, metadata !506), !dbg !937
  %745 = icmp ult i32 %744, %besterr.8, !dbg !1022
  br i1 %745, label %746, label %750, !dbg !1025

; <label>:746                                     ; preds = %742
  call void @llvm.dbg.value(metadata i32 %744, i64 0, metadata !777, metadata !506), !dbg !778
  %747 = add nsw i32 %tr.0, 2, !dbg !1026
  call void @llvm.dbg.value(metadata i32 %747, i64 0, metadata !673, metadata !506), !dbg !674
  %748 = add nsw i32 %tc.0, 2, !dbg !1026
  call void @llvm.dbg.value(metadata i32 %748, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %720, i32* %distortion, align 4, !dbg !1026
  %749 = load i32* %sse, align 4, !dbg !1026
  store i32 %749, i32* %sse1, align 4, !dbg !1026
  br label %750, !dbg !1026

; <label>:750                                     ; preds = %746, %742
  %br.15 = phi i32 [ %747, %746 ], [ %br.8, %742 ]
  %bc.15 = phi i32 [ %748, %746 ], [ %bc.8, %742 ]
  %besterr.15 = phi i32 [ %744, %746 ], [ %besterr.8, %742 ]
  br label %752, !dbg !1029

; <label>:751                                     ; preds = %697, %694, %691, %688
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !936, metadata !506), !dbg !937
  br label %752

; <label>:752                                     ; preds = %751, %750
  %br.16 = phi i32 [ %br.15, %750 ], [ %br.8, %751 ]
  %bc.16 = phi i32 [ %bc.15, %750 ], [ %bc.8, %751 ]
  %besterr.16 = phi i32 [ %besterr.15, %750 ], [ %besterr.8, %751 ]
  br label %753, !dbg !1032

; <label>:753                                     ; preds = %752, %687, %622, %557, %487
  %br.17 = phi i32 [ %br.8, %487 ], [ %br.16, %752 ], [ %br.14, %687 ], [ %br.12, %622 ], [ %br.10, %557 ]
  %bc.17 = phi i32 [ %bc.8, %487 ], [ %bc.16, %752 ], [ %bc.14, %687 ], [ %bc.12, %622 ], [ %bc.10, %557 ]
  %besterr.17 = phi i32 [ %besterr.8, %487 ], [ %besterr.16, %752 ], [ %besterr.14, %687 ], [ %besterr.12, %622 ], [ %besterr.10, %557 ]
  %754 = icmp eq i32 %tr.0, %br.17, !dbg !1033
  br i1 %754, label %755, label %758, !dbg !1035

; <label>:755                                     ; preds = %753
  %756 = icmp eq i32 %tc.0, %bc.17, !dbg !1036
  br i1 %756, label %757, label %758, !dbg !1035

; <label>:757                                     ; preds = %755
  br label %759, !dbg !1037

; <label>:758                                     ; preds = %755, %753
  call void @llvm.dbg.value(metadata i32 %br.17, i64 0, metadata !678, metadata !506), !dbg !679
  call void @llvm.dbg.value(metadata i32 %bc.17, i64 0, metadata !680, metadata !506), !dbg !681
  br label %252, !dbg !782

; <label>:759                                     ; preds = %757, %252
  %br.18 = phi i32 [ %br.17, %757 ], [ %br.0, %252 ]
  %bc.18 = phi i32 [ %bc.17, %757 ], [ %bc.0, %252 ]
  %besterr.18 = phi i32 [ %besterr.17, %757 ], [ %besterr.0, %252 ]
  br label %760, !dbg !1038

; <label>:760                                     ; preds = %1266, %759
  %br.19 = phi i32 [ %br.18, %759 ], [ %br.36, %1266 ]
  %bc.19 = phi i32 [ %bc.18, %759 ], [ %bc.36, %1266 ]
  %tr.1 = phi i32 [ %tr.0, %759 ], [ %br.36, %1266 ]
  %tc.1 = phi i32 [ %tc.0, %759 ], [ %bc.36, %1266 ]
  %besterr.19 = phi i32 [ %besterr.18, %759 ], [ %besterr.36, %1266 ]
  %quarteriters.0 = phi i32 [ 4, %759 ], [ %761, %1266 ]
  %761 = add i32 %quarteriters.0, -1, !dbg !1039
  call void @llvm.dbg.value(metadata i32 %761, i64 0, metadata !686, metadata !506), !dbg !687
  %762 = icmp ne i32 %761, 0, !dbg !1038
  br i1 %762, label %763, label %1267, !dbg !1038

; <label>:763                                     ; preds = %760
  %764 = sub nsw i32 %tc.1, 1, !dbg !1040
  %765 = icmp sge i32 %764, %50, !dbg !1040
  br i1 %765, label %766, label %820, !dbg !1043

; <label>:766                                     ; preds = %763
  %767 = sub nsw i32 %tc.1, 1, !dbg !1044
  %768 = icmp sle i32 %767, %73, !dbg !1044
  br i1 %768, label %769, label %820, !dbg !1043

; <label>:769                                     ; preds = %766
  %770 = icmp sge i32 %tr.1, %96, !dbg !1046
  br i1 %770, label %771, label %820, !dbg !1043

; <label>:771                                     ; preds = %769
  %772 = icmp sle i32 %tr.1, %119, !dbg !1048
  br i1 %772, label %773, label %820, !dbg !1043

; <label>:773                                     ; preds = %771
  %774 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1050
  %775 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %774, align 8, !dbg !1050
  %776 = ashr i32 %tr.1, 2, !dbg !1050
  %777 = mul nsw i32 %776, 32, !dbg !1050
  %778 = sub nsw i32 %tc.1, 1, !dbg !1050
  %779 = ashr i32 %778, 2, !dbg !1050
  %780 = add nsw i32 %777, %779, !dbg !1050
  %781 = sub nsw i32 %780, %232, !dbg !1050
  %782 = sext i32 %781 to i64, !dbg !1050
  %783 = getelementptr inbounds i8* %222, i64 %782, !dbg !1050
  %784 = sub nsw i32 %tc.1, 1, !dbg !1050
  %785 = and i32 %784, 3, !dbg !1050
  %786 = shl i32 %785, 1, !dbg !1050
  %787 = and i32 %tr.1, 3, !dbg !1050
  %788 = shl i32 %787, 1, !dbg !1050
  %789 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1050
  %790 = load i32* %789, align 4, !dbg !1050
  %791 = call i32 %775(i8* %783, i32 32, i32 %786, i32 %788, i8* %7, i32 %790, i32* %sse), !dbg !1050
  call void @llvm.dbg.value(metadata i32 %791, i64 0, metadata !798, metadata !506), !dbg !799
  %792 = icmp ne i32** %mvcost, null, !dbg !1053
  br i1 %792, label %793, label %811, !dbg !1053

; <label>:793                                     ; preds = %773
  %794 = sub nsw i32 %tr.1, %12, !dbg !1055
  %795 = sext i32 %794 to i64, !dbg !1055
  %796 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !1055
  %797 = load i32** %796, align 8, !dbg !1055
  %798 = getelementptr inbounds i32* %797, i64 %795, !dbg !1055
  %799 = load i32* %798, align 4, !dbg !1055
  %800 = sub nsw i32 %tc.1, 1, !dbg !1055
  %801 = sub nsw i32 %800, %17, !dbg !1055
  %802 = sext i32 %801 to i64, !dbg !1055
  %803 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !1055
  %804 = load i32** %803, align 8, !dbg !1055
  %805 = getelementptr inbounds i32* %804, i64 %802, !dbg !1055
  %806 = load i32* %805, align 4, !dbg !1055
  %807 = add nsw i32 %799, %806, !dbg !1055
  %808 = mul nsw i32 %807, %error_per_bit, !dbg !1055
  %809 = add nsw i32 %808, 128, !dbg !1055
  %810 = ashr i32 %809, 8, !dbg !1055
  br label %812, !dbg !1055

; <label>:811                                     ; preds = %773
  br label %812, !dbg !1057

; <label>:812                                     ; preds = %811, %793
  %813 = phi i32 [ %810, %793 ], [ 0, %811 ], !dbg !1053
  %814 = add nsw i32 %813, %791, !dbg !1059
  call void @llvm.dbg.value(metadata i32 %814, i64 0, metadata !809, metadata !506), !dbg !810
  %815 = icmp ult i32 %814, %besterr.19, !dbg !1059
  br i1 %815, label %816, label %819, !dbg !1062

; <label>:816                                     ; preds = %812
  call void @llvm.dbg.value(metadata i32 %814, i64 0, metadata !777, metadata !506), !dbg !778
  call void @llvm.dbg.value(metadata i32 %tr.1, i64 0, metadata !673, metadata !506), !dbg !674
  %817 = sub nsw i32 %tc.1, 1, !dbg !1063
  call void @llvm.dbg.value(metadata i32 %817, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %791, i32* %distortion, align 4, !dbg !1063
  %818 = load i32* %sse, align 4, !dbg !1063
  store i32 %818, i32* %sse1, align 4, !dbg !1063
  br label %819, !dbg !1063

; <label>:819                                     ; preds = %816, %812
  %br.20 = phi i32 [ %tr.1, %816 ], [ %br.19, %812 ]
  %bc.20 = phi i32 [ %817, %816 ], [ %bc.19, %812 ]
  %besterr.20 = phi i32 [ %814, %816 ], [ %besterr.19, %812 ]
  br label %821, !dbg !1066

; <label>:820                                     ; preds = %771, %769, %766, %763
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !809, metadata !506), !dbg !810
  br label %821

; <label>:821                                     ; preds = %820, %819
  %br.21 = phi i32 [ %br.20, %819 ], [ %br.19, %820 ]
  %bc.21 = phi i32 [ %bc.20, %819 ], [ %bc.19, %820 ]
  %besterr.21 = phi i32 [ %besterr.20, %819 ], [ %besterr.19, %820 ]
  %left.1 = phi i32 [ %814, %819 ], [ -1, %820 ]
  %822 = add nsw i32 %tc.1, 1, !dbg !1069
  %823 = icmp sge i32 %822, %50, !dbg !1069
  br i1 %823, label %824, label %878, !dbg !1071

; <label>:824                                     ; preds = %821
  %825 = add nsw i32 %tc.1, 1, !dbg !1072
  %826 = icmp sle i32 %825, %73, !dbg !1072
  br i1 %826, label %827, label %878, !dbg !1071

; <label>:827                                     ; preds = %824
  %828 = icmp sge i32 %tr.1, %96, !dbg !1074
  br i1 %828, label %829, label %878, !dbg !1071

; <label>:829                                     ; preds = %827
  %830 = icmp sle i32 %tr.1, %119, !dbg !1076
  br i1 %830, label %831, label %878, !dbg !1071

; <label>:831                                     ; preds = %829
  %832 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1078
  %833 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %832, align 8, !dbg !1078
  %834 = ashr i32 %tr.1, 2, !dbg !1078
  %835 = mul nsw i32 %834, 32, !dbg !1078
  %836 = add nsw i32 %tc.1, 1, !dbg !1078
  %837 = ashr i32 %836, 2, !dbg !1078
  %838 = add nsw i32 %835, %837, !dbg !1078
  %839 = sub nsw i32 %838, %232, !dbg !1078
  %840 = sext i32 %839 to i64, !dbg !1078
  %841 = getelementptr inbounds i8* %222, i64 %840, !dbg !1078
  %842 = add nsw i32 %tc.1, 1, !dbg !1078
  %843 = and i32 %842, 3, !dbg !1078
  %844 = shl i32 %843, 1, !dbg !1078
  %845 = and i32 %tr.1, 3, !dbg !1078
  %846 = shl i32 %845, 1, !dbg !1078
  %847 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1078
  %848 = load i32* %847, align 4, !dbg !1078
  %849 = call i32 %833(i8* %841, i32 32, i32 %844, i32 %846, i8* %7, i32 %848, i32* %sse), !dbg !1078
  call void @llvm.dbg.value(metadata i32 %849, i64 0, metadata !798, metadata !506), !dbg !799
  %850 = icmp ne i32** %mvcost, null, !dbg !1081
  br i1 %850, label %851, label %869, !dbg !1081

; <label>:851                                     ; preds = %831
  %852 = sub nsw i32 %tr.1, %12, !dbg !1083
  %853 = sext i32 %852 to i64, !dbg !1083
  %854 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !1083
  %855 = load i32** %854, align 8, !dbg !1083
  %856 = getelementptr inbounds i32* %855, i64 %853, !dbg !1083
  %857 = load i32* %856, align 4, !dbg !1083
  %858 = add nsw i32 %tc.1, 1, !dbg !1083
  %859 = sub nsw i32 %858, %17, !dbg !1083
  %860 = sext i32 %859 to i64, !dbg !1083
  %861 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !1083
  %862 = load i32** %861, align 8, !dbg !1083
  %863 = getelementptr inbounds i32* %862, i64 %860, !dbg !1083
  %864 = load i32* %863, align 4, !dbg !1083
  %865 = add nsw i32 %857, %864, !dbg !1083
  %866 = mul nsw i32 %865, %error_per_bit, !dbg !1083
  %867 = add nsw i32 %866, 128, !dbg !1083
  %868 = ashr i32 %867, 8, !dbg !1083
  br label %870, !dbg !1083

; <label>:869                                     ; preds = %831
  br label %870, !dbg !1085

; <label>:870                                     ; preds = %869, %851
  %871 = phi i32 [ %868, %851 ], [ 0, %869 ], !dbg !1081
  %872 = add nsw i32 %871, %849, !dbg !1087
  call void @llvm.dbg.value(metadata i32 %872, i64 0, metadata !839, metadata !506), !dbg !840
  %873 = icmp ult i32 %872, %besterr.21, !dbg !1087
  br i1 %873, label %874, label %877, !dbg !1090

; <label>:874                                     ; preds = %870
  call void @llvm.dbg.value(metadata i32 %872, i64 0, metadata !777, metadata !506), !dbg !778
  call void @llvm.dbg.value(metadata i32 %tr.1, i64 0, metadata !673, metadata !506), !dbg !674
  %875 = add nsw i32 %tc.1, 1, !dbg !1091
  call void @llvm.dbg.value(metadata i32 %875, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %849, i32* %distortion, align 4, !dbg !1091
  %876 = load i32* %sse, align 4, !dbg !1091
  store i32 %876, i32* %sse1, align 4, !dbg !1091
  br label %877, !dbg !1091

; <label>:877                                     ; preds = %874, %870
  %br.22 = phi i32 [ %tr.1, %874 ], [ %br.21, %870 ]
  %bc.22 = phi i32 [ %875, %874 ], [ %bc.21, %870 ]
  %besterr.22 = phi i32 [ %872, %874 ], [ %besterr.21, %870 ]
  br label %879, !dbg !1094

; <label>:878                                     ; preds = %829, %827, %824, %821
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !839, metadata !506), !dbg !840
  br label %879

; <label>:879                                     ; preds = %878, %877
  %br.23 = phi i32 [ %br.22, %877 ], [ %br.21, %878 ]
  %bc.23 = phi i32 [ %bc.22, %877 ], [ %bc.21, %878 ]
  %besterr.23 = phi i32 [ %besterr.22, %877 ], [ %besterr.21, %878 ]
  %right.1 = phi i32 [ %872, %877 ], [ -1, %878 ]
  %880 = icmp sge i32 %tc.1, %50, !dbg !1097
  br i1 %880, label %881, label %936, !dbg !1099

; <label>:881                                     ; preds = %879
  %882 = icmp sle i32 %tc.1, %73, !dbg !1100
  br i1 %882, label %883, label %936, !dbg !1099

; <label>:883                                     ; preds = %881
  %884 = sub nsw i32 %tr.1, 1, !dbg !1102
  %885 = icmp sge i32 %884, %96, !dbg !1102
  br i1 %885, label %886, label %936, !dbg !1099

; <label>:886                                     ; preds = %883
  %887 = sub nsw i32 %tr.1, 1, !dbg !1104
  %888 = icmp sle i32 %887, %119, !dbg !1104
  br i1 %888, label %889, label %936, !dbg !1099

; <label>:889                                     ; preds = %886
  %890 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1106
  %891 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %890, align 8, !dbg !1106
  %892 = sub nsw i32 %tr.1, 1, !dbg !1106
  %893 = ashr i32 %892, 2, !dbg !1106
  %894 = mul nsw i32 %893, 32, !dbg !1106
  %895 = ashr i32 %tc.1, 2, !dbg !1106
  %896 = add nsw i32 %894, %895, !dbg !1106
  %897 = sub nsw i32 %896, %232, !dbg !1106
  %898 = sext i32 %897 to i64, !dbg !1106
  %899 = getelementptr inbounds i8* %222, i64 %898, !dbg !1106
  %900 = and i32 %tc.1, 3, !dbg !1106
  %901 = shl i32 %900, 1, !dbg !1106
  %902 = sub nsw i32 %tr.1, 1, !dbg !1106
  %903 = and i32 %902, 3, !dbg !1106
  %904 = shl i32 %903, 1, !dbg !1106
  %905 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1106
  %906 = load i32* %905, align 4, !dbg !1106
  %907 = call i32 %891(i8* %899, i32 32, i32 %901, i32 %904, i8* %7, i32 %906, i32* %sse), !dbg !1106
  call void @llvm.dbg.value(metadata i32 %907, i64 0, metadata !798, metadata !506), !dbg !799
  %908 = icmp ne i32** %mvcost, null, !dbg !1109
  br i1 %908, label %909, label %927, !dbg !1109

; <label>:909                                     ; preds = %889
  %910 = sub nsw i32 %tr.1, 1, !dbg !1111
  %911 = sub nsw i32 %910, %12, !dbg !1111
  %912 = sext i32 %911 to i64, !dbg !1111
  %913 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !1111
  %914 = load i32** %913, align 8, !dbg !1111
  %915 = getelementptr inbounds i32* %914, i64 %912, !dbg !1111
  %916 = load i32* %915, align 4, !dbg !1111
  %917 = sub nsw i32 %tc.1, %17, !dbg !1111
  %918 = sext i32 %917 to i64, !dbg !1111
  %919 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !1111
  %920 = load i32** %919, align 8, !dbg !1111
  %921 = getelementptr inbounds i32* %920, i64 %918, !dbg !1111
  %922 = load i32* %921, align 4, !dbg !1111
  %923 = add nsw i32 %916, %922, !dbg !1111
  %924 = mul nsw i32 %923, %error_per_bit, !dbg !1111
  %925 = add nsw i32 %924, 128, !dbg !1111
  %926 = ashr i32 %925, 8, !dbg !1111
  br label %928, !dbg !1111

; <label>:927                                     ; preds = %889
  br label %928, !dbg !1113

; <label>:928                                     ; preds = %927, %909
  %929 = phi i32 [ %926, %909 ], [ 0, %927 ], !dbg !1109
  %930 = add nsw i32 %929, %907, !dbg !1115
  call void @llvm.dbg.value(metadata i32 %930, i64 0, metadata !869, metadata !506), !dbg !870
  %931 = icmp ult i32 %930, %besterr.23, !dbg !1115
  br i1 %931, label %932, label %935, !dbg !1118

; <label>:932                                     ; preds = %928
  call void @llvm.dbg.value(metadata i32 %930, i64 0, metadata !777, metadata !506), !dbg !778
  %933 = sub nsw i32 %tr.1, 1, !dbg !1119
  call void @llvm.dbg.value(metadata i32 %933, i64 0, metadata !673, metadata !506), !dbg !674
  call void @llvm.dbg.value(metadata i32 %tc.1, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %907, i32* %distortion, align 4, !dbg !1119
  %934 = load i32* %sse, align 4, !dbg !1119
  store i32 %934, i32* %sse1, align 4, !dbg !1119
  br label %935, !dbg !1119

; <label>:935                                     ; preds = %932, %928
  %br.24 = phi i32 [ %933, %932 ], [ %br.23, %928 ]
  %bc.24 = phi i32 [ %tc.1, %932 ], [ %bc.23, %928 ]
  %besterr.24 = phi i32 [ %930, %932 ], [ %besterr.23, %928 ]
  br label %937, !dbg !1122

; <label>:936                                     ; preds = %886, %883, %881, %879
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !869, metadata !506), !dbg !870
  br label %937

; <label>:937                                     ; preds = %936, %935
  %br.25 = phi i32 [ %br.24, %935 ], [ %br.23, %936 ]
  %bc.25 = phi i32 [ %bc.24, %935 ], [ %bc.23, %936 ]
  %besterr.25 = phi i32 [ %besterr.24, %935 ], [ %besterr.23, %936 ]
  %up.1 = phi i32 [ %930, %935 ], [ -1, %936 ]
  %938 = icmp sge i32 %tc.1, %50, !dbg !1125
  br i1 %938, label %939, label %994, !dbg !1127

; <label>:939                                     ; preds = %937
  %940 = icmp sle i32 %tc.1, %73, !dbg !1128
  br i1 %940, label %941, label %994, !dbg !1127

; <label>:941                                     ; preds = %939
  %942 = add nsw i32 %tr.1, 1, !dbg !1130
  %943 = icmp sge i32 %942, %96, !dbg !1130
  br i1 %943, label %944, label %994, !dbg !1127

; <label>:944                                     ; preds = %941
  %945 = add nsw i32 %tr.1, 1, !dbg !1132
  %946 = icmp sle i32 %945, %119, !dbg !1132
  br i1 %946, label %947, label %994, !dbg !1127

; <label>:947                                     ; preds = %944
  %948 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1134
  %949 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %948, align 8, !dbg !1134
  %950 = add nsw i32 %tr.1, 1, !dbg !1134
  %951 = ashr i32 %950, 2, !dbg !1134
  %952 = mul nsw i32 %951, 32, !dbg !1134
  %953 = ashr i32 %tc.1, 2, !dbg !1134
  %954 = add nsw i32 %952, %953, !dbg !1134
  %955 = sub nsw i32 %954, %232, !dbg !1134
  %956 = sext i32 %955 to i64, !dbg !1134
  %957 = getelementptr inbounds i8* %222, i64 %956, !dbg !1134
  %958 = and i32 %tc.1, 3, !dbg !1134
  %959 = shl i32 %958, 1, !dbg !1134
  %960 = add nsw i32 %tr.1, 1, !dbg !1134
  %961 = and i32 %960, 3, !dbg !1134
  %962 = shl i32 %961, 1, !dbg !1134
  %963 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1134
  %964 = load i32* %963, align 4, !dbg !1134
  %965 = call i32 %949(i8* %957, i32 32, i32 %959, i32 %962, i8* %7, i32 %964, i32* %sse), !dbg !1134
  call void @llvm.dbg.value(metadata i32 %965, i64 0, metadata !798, metadata !506), !dbg !799
  %966 = icmp ne i32** %mvcost, null, !dbg !1137
  br i1 %966, label %967, label %985, !dbg !1137

; <label>:967                                     ; preds = %947
  %968 = add nsw i32 %tr.1, 1, !dbg !1139
  %969 = sub nsw i32 %968, %12, !dbg !1139
  %970 = sext i32 %969 to i64, !dbg !1139
  %971 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !1139
  %972 = load i32** %971, align 8, !dbg !1139
  %973 = getelementptr inbounds i32* %972, i64 %970, !dbg !1139
  %974 = load i32* %973, align 4, !dbg !1139
  %975 = sub nsw i32 %tc.1, %17, !dbg !1139
  %976 = sext i32 %975 to i64, !dbg !1139
  %977 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !1139
  %978 = load i32** %977, align 8, !dbg !1139
  %979 = getelementptr inbounds i32* %978, i64 %976, !dbg !1139
  %980 = load i32* %979, align 4, !dbg !1139
  %981 = add nsw i32 %974, %980, !dbg !1139
  %982 = mul nsw i32 %981, %error_per_bit, !dbg !1139
  %983 = add nsw i32 %982, 128, !dbg !1139
  %984 = ashr i32 %983, 8, !dbg !1139
  br label %986, !dbg !1139

; <label>:985                                     ; preds = %947
  br label %986, !dbg !1141

; <label>:986                                     ; preds = %985, %967
  %987 = phi i32 [ %984, %967 ], [ 0, %985 ], !dbg !1137
  %988 = add nsw i32 %987, %965, !dbg !1143
  call void @llvm.dbg.value(metadata i32 %988, i64 0, metadata !899, metadata !506), !dbg !900
  %989 = icmp ult i32 %988, %besterr.25, !dbg !1143
  br i1 %989, label %990, label %993, !dbg !1146

; <label>:990                                     ; preds = %986
  call void @llvm.dbg.value(metadata i32 %988, i64 0, metadata !777, metadata !506), !dbg !778
  %991 = add nsw i32 %tr.1, 1, !dbg !1147
  call void @llvm.dbg.value(metadata i32 %991, i64 0, metadata !673, metadata !506), !dbg !674
  call void @llvm.dbg.value(metadata i32 %tc.1, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %965, i32* %distortion, align 4, !dbg !1147
  %992 = load i32* %sse, align 4, !dbg !1147
  store i32 %992, i32* %sse1, align 4, !dbg !1147
  br label %993, !dbg !1147

; <label>:993                                     ; preds = %990, %986
  %br.26 = phi i32 [ %991, %990 ], [ %br.25, %986 ]
  %bc.26 = phi i32 [ %tc.1, %990 ], [ %bc.25, %986 ]
  %besterr.26 = phi i32 [ %988, %990 ], [ %besterr.25, %986 ]
  br label %995, !dbg !1150

; <label>:994                                     ; preds = %944, %941, %939, %937
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !899, metadata !506), !dbg !900
  br label %995

; <label>:995                                     ; preds = %994, %993
  %br.27 = phi i32 [ %br.26, %993 ], [ %br.25, %994 ]
  %bc.27 = phi i32 [ %bc.26, %993 ], [ %bc.25, %994 ]
  %besterr.27 = phi i32 [ %besterr.26, %993 ], [ %besterr.25, %994 ]
  %down.1 = phi i32 [ %988, %993 ], [ -1, %994 ]
  %996 = icmp ult i32 %left.1, %right.1, !dbg !1153
  %997 = select i1 %996, i32 0, i32 1, !dbg !1153
  %998 = icmp ult i32 %up.1, %down.1, !dbg !1154
  %999 = select i1 %998, i32 0, i32 2, !dbg !1154
  %1000 = add nsw i32 %997, %999, !dbg !1155
  call void @llvm.dbg.value(metadata i32 %1000, i64 0, metadata !911, metadata !506), !dbg !912
  switch i32 %1000, label %1261 [
    i32 0, label %1001
    i32 1, label %1066
    i32 2, label %1131
    i32 3, label %1196
  ], !dbg !1156

; <label>:1001                                    ; preds = %995
  %1002 = sub nsw i32 %tc.1, 1, !dbg !1157
  %1003 = icmp sge i32 %1002, %50, !dbg !1157
  br i1 %1003, label %1004, label %1064, !dbg !1160

; <label>:1004                                    ; preds = %1001
  %1005 = sub nsw i32 %tc.1, 1, !dbg !1161
  %1006 = icmp sle i32 %1005, %73, !dbg !1161
  br i1 %1006, label %1007, label %1064, !dbg !1160

; <label>:1007                                    ; preds = %1004
  %1008 = sub nsw i32 %tr.1, 1, !dbg !1163
  %1009 = icmp sge i32 %1008, %96, !dbg !1163
  br i1 %1009, label %1010, label %1064, !dbg !1160

; <label>:1010                                    ; preds = %1007
  %1011 = sub nsw i32 %tr.1, 1, !dbg !1165
  %1012 = icmp sle i32 %1011, %119, !dbg !1165
  br i1 %1012, label %1013, label %1064, !dbg !1160

; <label>:1013                                    ; preds = %1010
  %1014 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1167
  %1015 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1014, align 8, !dbg !1167
  %1016 = sub nsw i32 %tr.1, 1, !dbg !1167
  %1017 = ashr i32 %1016, 2, !dbg !1167
  %1018 = mul nsw i32 %1017, 32, !dbg !1167
  %1019 = sub nsw i32 %tc.1, 1, !dbg !1167
  %1020 = ashr i32 %1019, 2, !dbg !1167
  %1021 = add nsw i32 %1018, %1020, !dbg !1167
  %1022 = sub nsw i32 %1021, %232, !dbg !1167
  %1023 = sext i32 %1022 to i64, !dbg !1167
  %1024 = getelementptr inbounds i8* %222, i64 %1023, !dbg !1167
  %1025 = sub nsw i32 %tc.1, 1, !dbg !1167
  %1026 = and i32 %1025, 3, !dbg !1167
  %1027 = shl i32 %1026, 1, !dbg !1167
  %1028 = sub nsw i32 %tr.1, 1, !dbg !1167
  %1029 = and i32 %1028, 3, !dbg !1167
  %1030 = shl i32 %1029, 1, !dbg !1167
  %1031 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1167
  %1032 = load i32* %1031, align 4, !dbg !1167
  %1033 = call i32 %1015(i8* %1024, i32 32, i32 %1027, i32 %1030, i8* %7, i32 %1032, i32* %sse), !dbg !1167
  call void @llvm.dbg.value(metadata i32 %1033, i64 0, metadata !798, metadata !506), !dbg !799
  %1034 = icmp ne i32** %mvcost, null, !dbg !1170
  br i1 %1034, label %1035, label %1054, !dbg !1170

; <label>:1035                                    ; preds = %1013
  %1036 = sub nsw i32 %tr.1, 1, !dbg !1172
  %1037 = sub nsw i32 %1036, %12, !dbg !1172
  %1038 = sext i32 %1037 to i64, !dbg !1172
  %1039 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !1172
  %1040 = load i32** %1039, align 8, !dbg !1172
  %1041 = getelementptr inbounds i32* %1040, i64 %1038, !dbg !1172
  %1042 = load i32* %1041, align 4, !dbg !1172
  %1043 = sub nsw i32 %tc.1, 1, !dbg !1172
  %1044 = sub nsw i32 %1043, %17, !dbg !1172
  %1045 = sext i32 %1044 to i64, !dbg !1172
  %1046 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !1172
  %1047 = load i32** %1046, align 8, !dbg !1172
  %1048 = getelementptr inbounds i32* %1047, i64 %1045, !dbg !1172
  %1049 = load i32* %1048, align 4, !dbg !1172
  %1050 = add nsw i32 %1042, %1049, !dbg !1172
  %1051 = mul nsw i32 %1050, %error_per_bit, !dbg !1172
  %1052 = add nsw i32 %1051, 128, !dbg !1172
  %1053 = ashr i32 %1052, 8, !dbg !1172
  br label %1055, !dbg !1172

; <label>:1054                                    ; preds = %1013
  br label %1055, !dbg !1174

; <label>:1055                                    ; preds = %1054, %1035
  %1056 = phi i32 [ %1053, %1035 ], [ 0, %1054 ], !dbg !1170
  %1057 = add nsw i32 %1056, %1033, !dbg !1176
  call void @llvm.dbg.value(metadata i32 %1057, i64 0, metadata !936, metadata !506), !dbg !937
  %1058 = icmp ult i32 %1057, %besterr.27, !dbg !1176
  br i1 %1058, label %1059, label %1063, !dbg !1179

; <label>:1059                                    ; preds = %1055
  call void @llvm.dbg.value(metadata i32 %1057, i64 0, metadata !777, metadata !506), !dbg !778
  %1060 = sub nsw i32 %tr.1, 1, !dbg !1180
  call void @llvm.dbg.value(metadata i32 %1060, i64 0, metadata !673, metadata !506), !dbg !674
  %1061 = sub nsw i32 %tc.1, 1, !dbg !1180
  call void @llvm.dbg.value(metadata i32 %1061, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %1033, i32* %distortion, align 4, !dbg !1180
  %1062 = load i32* %sse, align 4, !dbg !1180
  store i32 %1062, i32* %sse1, align 4, !dbg !1180
  br label %1063, !dbg !1180

; <label>:1063                                    ; preds = %1059, %1055
  %br.28 = phi i32 [ %1060, %1059 ], [ %br.27, %1055 ]
  %bc.28 = phi i32 [ %1061, %1059 ], [ %bc.27, %1055 ]
  %besterr.28 = phi i32 [ %1057, %1059 ], [ %besterr.27, %1055 ]
  br label %1065, !dbg !1183

; <label>:1064                                    ; preds = %1010, %1007, %1004, %1001
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !936, metadata !506), !dbg !937
  br label %1065

; <label>:1065                                    ; preds = %1064, %1063
  %br.29 = phi i32 [ %br.28, %1063 ], [ %br.27, %1064 ]
  %bc.29 = phi i32 [ %bc.28, %1063 ], [ %bc.27, %1064 ]
  %besterr.29 = phi i32 [ %besterr.28, %1063 ], [ %besterr.27, %1064 ]
  br label %1261, !dbg !1186

; <label>:1066                                    ; preds = %995
  %1067 = add nsw i32 %tc.1, 1, !dbg !1187
  %1068 = icmp sge i32 %1067, %50, !dbg !1187
  br i1 %1068, label %1069, label %1129, !dbg !1189

; <label>:1069                                    ; preds = %1066
  %1070 = add nsw i32 %tc.1, 1, !dbg !1190
  %1071 = icmp sle i32 %1070, %73, !dbg !1190
  br i1 %1071, label %1072, label %1129, !dbg !1189

; <label>:1072                                    ; preds = %1069
  %1073 = sub nsw i32 %tr.1, 1, !dbg !1192
  %1074 = icmp sge i32 %1073, %96, !dbg !1192
  br i1 %1074, label %1075, label %1129, !dbg !1189

; <label>:1075                                    ; preds = %1072
  %1076 = sub nsw i32 %tr.1, 1, !dbg !1194
  %1077 = icmp sle i32 %1076, %119, !dbg !1194
  br i1 %1077, label %1078, label %1129, !dbg !1189

; <label>:1078                                    ; preds = %1075
  %1079 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1196
  %1080 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1079, align 8, !dbg !1196
  %1081 = sub nsw i32 %tr.1, 1, !dbg !1196
  %1082 = ashr i32 %1081, 2, !dbg !1196
  %1083 = mul nsw i32 %1082, 32, !dbg !1196
  %1084 = add nsw i32 %tc.1, 1, !dbg !1196
  %1085 = ashr i32 %1084, 2, !dbg !1196
  %1086 = add nsw i32 %1083, %1085, !dbg !1196
  %1087 = sub nsw i32 %1086, %232, !dbg !1196
  %1088 = sext i32 %1087 to i64, !dbg !1196
  %1089 = getelementptr inbounds i8* %222, i64 %1088, !dbg !1196
  %1090 = add nsw i32 %tc.1, 1, !dbg !1196
  %1091 = and i32 %1090, 3, !dbg !1196
  %1092 = shl i32 %1091, 1, !dbg !1196
  %1093 = sub nsw i32 %tr.1, 1, !dbg !1196
  %1094 = and i32 %1093, 3, !dbg !1196
  %1095 = shl i32 %1094, 1, !dbg !1196
  %1096 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1196
  %1097 = load i32* %1096, align 4, !dbg !1196
  %1098 = call i32 %1080(i8* %1089, i32 32, i32 %1092, i32 %1095, i8* %7, i32 %1097, i32* %sse), !dbg !1196
  call void @llvm.dbg.value(metadata i32 %1098, i64 0, metadata !798, metadata !506), !dbg !799
  %1099 = icmp ne i32** %mvcost, null, !dbg !1199
  br i1 %1099, label %1100, label %1119, !dbg !1199

; <label>:1100                                    ; preds = %1078
  %1101 = sub nsw i32 %tr.1, 1, !dbg !1201
  %1102 = sub nsw i32 %1101, %12, !dbg !1201
  %1103 = sext i32 %1102 to i64, !dbg !1201
  %1104 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !1201
  %1105 = load i32** %1104, align 8, !dbg !1201
  %1106 = getelementptr inbounds i32* %1105, i64 %1103, !dbg !1201
  %1107 = load i32* %1106, align 4, !dbg !1201
  %1108 = add nsw i32 %tc.1, 1, !dbg !1201
  %1109 = sub nsw i32 %1108, %17, !dbg !1201
  %1110 = sext i32 %1109 to i64, !dbg !1201
  %1111 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !1201
  %1112 = load i32** %1111, align 8, !dbg !1201
  %1113 = getelementptr inbounds i32* %1112, i64 %1110, !dbg !1201
  %1114 = load i32* %1113, align 4, !dbg !1201
  %1115 = add nsw i32 %1107, %1114, !dbg !1201
  %1116 = mul nsw i32 %1115, %error_per_bit, !dbg !1201
  %1117 = add nsw i32 %1116, 128, !dbg !1201
  %1118 = ashr i32 %1117, 8, !dbg !1201
  br label %1120, !dbg !1201

; <label>:1119                                    ; preds = %1078
  br label %1120, !dbg !1203

; <label>:1120                                    ; preds = %1119, %1100
  %1121 = phi i32 [ %1118, %1100 ], [ 0, %1119 ], !dbg !1199
  %1122 = add nsw i32 %1121, %1098, !dbg !1205
  call void @llvm.dbg.value(metadata i32 %1122, i64 0, metadata !936, metadata !506), !dbg !937
  %1123 = icmp ult i32 %1122, %besterr.27, !dbg !1205
  br i1 %1123, label %1124, label %1128, !dbg !1208

; <label>:1124                                    ; preds = %1120
  call void @llvm.dbg.value(metadata i32 %1122, i64 0, metadata !777, metadata !506), !dbg !778
  %1125 = sub nsw i32 %tr.1, 1, !dbg !1209
  call void @llvm.dbg.value(metadata i32 %1125, i64 0, metadata !673, metadata !506), !dbg !674
  %1126 = add nsw i32 %tc.1, 1, !dbg !1209
  call void @llvm.dbg.value(metadata i32 %1126, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %1098, i32* %distortion, align 4, !dbg !1209
  %1127 = load i32* %sse, align 4, !dbg !1209
  store i32 %1127, i32* %sse1, align 4, !dbg !1209
  br label %1128, !dbg !1209

; <label>:1128                                    ; preds = %1124, %1120
  %br.30 = phi i32 [ %1125, %1124 ], [ %br.27, %1120 ]
  %bc.30 = phi i32 [ %1126, %1124 ], [ %bc.27, %1120 ]
  %besterr.30 = phi i32 [ %1122, %1124 ], [ %besterr.27, %1120 ]
  br label %1130, !dbg !1212

; <label>:1129                                    ; preds = %1075, %1072, %1069, %1066
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !936, metadata !506), !dbg !937
  br label %1130

; <label>:1130                                    ; preds = %1129, %1128
  %br.31 = phi i32 [ %br.30, %1128 ], [ %br.27, %1129 ]
  %bc.31 = phi i32 [ %bc.30, %1128 ], [ %bc.27, %1129 ]
  %besterr.31 = phi i32 [ %besterr.30, %1128 ], [ %besterr.27, %1129 ]
  br label %1261, !dbg !1215

; <label>:1131                                    ; preds = %995
  %1132 = sub nsw i32 %tc.1, 1, !dbg !1216
  %1133 = icmp sge i32 %1132, %50, !dbg !1216
  br i1 %1133, label %1134, label %1194, !dbg !1218

; <label>:1134                                    ; preds = %1131
  %1135 = sub nsw i32 %tc.1, 1, !dbg !1219
  %1136 = icmp sle i32 %1135, %73, !dbg !1219
  br i1 %1136, label %1137, label %1194, !dbg !1218

; <label>:1137                                    ; preds = %1134
  %1138 = add nsw i32 %tr.1, 1, !dbg !1221
  %1139 = icmp sge i32 %1138, %96, !dbg !1221
  br i1 %1139, label %1140, label %1194, !dbg !1218

; <label>:1140                                    ; preds = %1137
  %1141 = add nsw i32 %tr.1, 1, !dbg !1223
  %1142 = icmp sle i32 %1141, %119, !dbg !1223
  br i1 %1142, label %1143, label %1194, !dbg !1218

; <label>:1143                                    ; preds = %1140
  %1144 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1225
  %1145 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1144, align 8, !dbg !1225
  %1146 = add nsw i32 %tr.1, 1, !dbg !1225
  %1147 = ashr i32 %1146, 2, !dbg !1225
  %1148 = mul nsw i32 %1147, 32, !dbg !1225
  %1149 = sub nsw i32 %tc.1, 1, !dbg !1225
  %1150 = ashr i32 %1149, 2, !dbg !1225
  %1151 = add nsw i32 %1148, %1150, !dbg !1225
  %1152 = sub nsw i32 %1151, %232, !dbg !1225
  %1153 = sext i32 %1152 to i64, !dbg !1225
  %1154 = getelementptr inbounds i8* %222, i64 %1153, !dbg !1225
  %1155 = sub nsw i32 %tc.1, 1, !dbg !1225
  %1156 = and i32 %1155, 3, !dbg !1225
  %1157 = shl i32 %1156, 1, !dbg !1225
  %1158 = add nsw i32 %tr.1, 1, !dbg !1225
  %1159 = and i32 %1158, 3, !dbg !1225
  %1160 = shl i32 %1159, 1, !dbg !1225
  %1161 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1225
  %1162 = load i32* %1161, align 4, !dbg !1225
  %1163 = call i32 %1145(i8* %1154, i32 32, i32 %1157, i32 %1160, i8* %7, i32 %1162, i32* %sse), !dbg !1225
  call void @llvm.dbg.value(metadata i32 %1163, i64 0, metadata !798, metadata !506), !dbg !799
  %1164 = icmp ne i32** %mvcost, null, !dbg !1228
  br i1 %1164, label %1165, label %1184, !dbg !1228

; <label>:1165                                    ; preds = %1143
  %1166 = add nsw i32 %tr.1, 1, !dbg !1230
  %1167 = sub nsw i32 %1166, %12, !dbg !1230
  %1168 = sext i32 %1167 to i64, !dbg !1230
  %1169 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !1230
  %1170 = load i32** %1169, align 8, !dbg !1230
  %1171 = getelementptr inbounds i32* %1170, i64 %1168, !dbg !1230
  %1172 = load i32* %1171, align 4, !dbg !1230
  %1173 = sub nsw i32 %tc.1, 1, !dbg !1230
  %1174 = sub nsw i32 %1173, %17, !dbg !1230
  %1175 = sext i32 %1174 to i64, !dbg !1230
  %1176 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !1230
  %1177 = load i32** %1176, align 8, !dbg !1230
  %1178 = getelementptr inbounds i32* %1177, i64 %1175, !dbg !1230
  %1179 = load i32* %1178, align 4, !dbg !1230
  %1180 = add nsw i32 %1172, %1179, !dbg !1230
  %1181 = mul nsw i32 %1180, %error_per_bit, !dbg !1230
  %1182 = add nsw i32 %1181, 128, !dbg !1230
  %1183 = ashr i32 %1182, 8, !dbg !1230
  br label %1185, !dbg !1230

; <label>:1184                                    ; preds = %1143
  br label %1185, !dbg !1232

; <label>:1185                                    ; preds = %1184, %1165
  %1186 = phi i32 [ %1183, %1165 ], [ 0, %1184 ], !dbg !1228
  %1187 = add nsw i32 %1186, %1163, !dbg !1234
  call void @llvm.dbg.value(metadata i32 %1187, i64 0, metadata !936, metadata !506), !dbg !937
  %1188 = icmp ult i32 %1187, %besterr.27, !dbg !1234
  br i1 %1188, label %1189, label %1193, !dbg !1237

; <label>:1189                                    ; preds = %1185
  call void @llvm.dbg.value(metadata i32 %1187, i64 0, metadata !777, metadata !506), !dbg !778
  %1190 = add nsw i32 %tr.1, 1, !dbg !1238
  call void @llvm.dbg.value(metadata i32 %1190, i64 0, metadata !673, metadata !506), !dbg !674
  %1191 = sub nsw i32 %tc.1, 1, !dbg !1238
  call void @llvm.dbg.value(metadata i32 %1191, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %1163, i32* %distortion, align 4, !dbg !1238
  %1192 = load i32* %sse, align 4, !dbg !1238
  store i32 %1192, i32* %sse1, align 4, !dbg !1238
  br label %1193, !dbg !1238

; <label>:1193                                    ; preds = %1189, %1185
  %br.32 = phi i32 [ %1190, %1189 ], [ %br.27, %1185 ]
  %bc.32 = phi i32 [ %1191, %1189 ], [ %bc.27, %1185 ]
  %besterr.32 = phi i32 [ %1187, %1189 ], [ %besterr.27, %1185 ]
  br label %1195, !dbg !1241

; <label>:1194                                    ; preds = %1140, %1137, %1134, %1131
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !936, metadata !506), !dbg !937
  br label %1195

; <label>:1195                                    ; preds = %1194, %1193
  %br.33 = phi i32 [ %br.32, %1193 ], [ %br.27, %1194 ]
  %bc.33 = phi i32 [ %bc.32, %1193 ], [ %bc.27, %1194 ]
  %besterr.33 = phi i32 [ %besterr.32, %1193 ], [ %besterr.27, %1194 ]
  br label %1261, !dbg !1244

; <label>:1196                                    ; preds = %995
  %1197 = add nsw i32 %tc.1, 1, !dbg !1245
  %1198 = icmp sge i32 %1197, %50, !dbg !1245
  br i1 %1198, label %1199, label %1259, !dbg !1247

; <label>:1199                                    ; preds = %1196
  %1200 = add nsw i32 %tc.1, 1, !dbg !1248
  %1201 = icmp sle i32 %1200, %73, !dbg !1248
  br i1 %1201, label %1202, label %1259, !dbg !1247

; <label>:1202                                    ; preds = %1199
  %1203 = add nsw i32 %tr.1, 1, !dbg !1250
  %1204 = icmp sge i32 %1203, %96, !dbg !1250
  br i1 %1204, label %1205, label %1259, !dbg !1247

; <label>:1205                                    ; preds = %1202
  %1206 = add nsw i32 %tr.1, 1, !dbg !1252
  %1207 = icmp sle i32 %1206, %119, !dbg !1252
  br i1 %1207, label %1208, label %1259, !dbg !1247

; <label>:1208                                    ; preds = %1205
  %1209 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1254
  %1210 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %1209, align 8, !dbg !1254
  %1211 = add nsw i32 %tr.1, 1, !dbg !1254
  %1212 = ashr i32 %1211, 2, !dbg !1254
  %1213 = mul nsw i32 %1212, 32, !dbg !1254
  %1214 = add nsw i32 %tc.1, 1, !dbg !1254
  %1215 = ashr i32 %1214, 2, !dbg !1254
  %1216 = add nsw i32 %1213, %1215, !dbg !1254
  %1217 = sub nsw i32 %1216, %232, !dbg !1254
  %1218 = sext i32 %1217 to i64, !dbg !1254
  %1219 = getelementptr inbounds i8* %222, i64 %1218, !dbg !1254
  %1220 = add nsw i32 %tc.1, 1, !dbg !1254
  %1221 = and i32 %1220, 3, !dbg !1254
  %1222 = shl i32 %1221, 1, !dbg !1254
  %1223 = add nsw i32 %tr.1, 1, !dbg !1254
  %1224 = and i32 %1223, 3, !dbg !1254
  %1225 = shl i32 %1224, 1, !dbg !1254
  %1226 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1254
  %1227 = load i32* %1226, align 4, !dbg !1254
  %1228 = call i32 %1210(i8* %1219, i32 32, i32 %1222, i32 %1225, i8* %7, i32 %1227, i32* %sse), !dbg !1254
  call void @llvm.dbg.value(metadata i32 %1228, i64 0, metadata !798, metadata !506), !dbg !799
  %1229 = icmp ne i32** %mvcost, null, !dbg !1257
  br i1 %1229, label %1230, label %1249, !dbg !1257

; <label>:1230                                    ; preds = %1208
  %1231 = add nsw i32 %tr.1, 1, !dbg !1259
  %1232 = sub nsw i32 %1231, %12, !dbg !1259
  %1233 = sext i32 %1232 to i64, !dbg !1259
  %1234 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !1259
  %1235 = load i32** %1234, align 8, !dbg !1259
  %1236 = getelementptr inbounds i32* %1235, i64 %1233, !dbg !1259
  %1237 = load i32* %1236, align 4, !dbg !1259
  %1238 = add nsw i32 %tc.1, 1, !dbg !1259
  %1239 = sub nsw i32 %1238, %17, !dbg !1259
  %1240 = sext i32 %1239 to i64, !dbg !1259
  %1241 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !1259
  %1242 = load i32** %1241, align 8, !dbg !1259
  %1243 = getelementptr inbounds i32* %1242, i64 %1240, !dbg !1259
  %1244 = load i32* %1243, align 4, !dbg !1259
  %1245 = add nsw i32 %1237, %1244, !dbg !1259
  %1246 = mul nsw i32 %1245, %error_per_bit, !dbg !1259
  %1247 = add nsw i32 %1246, 128, !dbg !1259
  %1248 = ashr i32 %1247, 8, !dbg !1259
  br label %1250, !dbg !1259

; <label>:1249                                    ; preds = %1208
  br label %1250, !dbg !1261

; <label>:1250                                    ; preds = %1249, %1230
  %1251 = phi i32 [ %1248, %1230 ], [ 0, %1249 ], !dbg !1257
  %1252 = add nsw i32 %1251, %1228, !dbg !1263
  call void @llvm.dbg.value(metadata i32 %1252, i64 0, metadata !936, metadata !506), !dbg !937
  %1253 = icmp ult i32 %1252, %besterr.27, !dbg !1263
  br i1 %1253, label %1254, label %1258, !dbg !1266

; <label>:1254                                    ; preds = %1250
  call void @llvm.dbg.value(metadata i32 %1252, i64 0, metadata !777, metadata !506), !dbg !778
  %1255 = add nsw i32 %tr.1, 1, !dbg !1267
  call void @llvm.dbg.value(metadata i32 %1255, i64 0, metadata !673, metadata !506), !dbg !674
  %1256 = add nsw i32 %tc.1, 1, !dbg !1267
  call void @llvm.dbg.value(metadata i32 %1256, i64 0, metadata !676, metadata !506), !dbg !677
  store i32 %1228, i32* %distortion, align 4, !dbg !1267
  %1257 = load i32* %sse, align 4, !dbg !1267
  store i32 %1257, i32* %sse1, align 4, !dbg !1267
  br label %1258, !dbg !1267

; <label>:1258                                    ; preds = %1254, %1250
  %br.34 = phi i32 [ %1255, %1254 ], [ %br.27, %1250 ]
  %bc.34 = phi i32 [ %1256, %1254 ], [ %bc.27, %1250 ]
  %besterr.34 = phi i32 [ %1252, %1254 ], [ %besterr.27, %1250 ]
  br label %1260, !dbg !1270

; <label>:1259                                    ; preds = %1205, %1202, %1199, %1196
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !936, metadata !506), !dbg !937
  br label %1260

; <label>:1260                                    ; preds = %1259, %1258
  %br.35 = phi i32 [ %br.34, %1258 ], [ %br.27, %1259 ]
  %bc.35 = phi i32 [ %bc.34, %1258 ], [ %bc.27, %1259 ]
  %besterr.35 = phi i32 [ %besterr.34, %1258 ], [ %besterr.27, %1259 ]
  br label %1261, !dbg !1273

; <label>:1261                                    ; preds = %1260, %1195, %1130, %1065, %995
  %br.36 = phi i32 [ %br.27, %995 ], [ %br.35, %1260 ], [ %br.33, %1195 ], [ %br.31, %1130 ], [ %br.29, %1065 ]
  %bc.36 = phi i32 [ %bc.27, %995 ], [ %bc.35, %1260 ], [ %bc.33, %1195 ], [ %bc.31, %1130 ], [ %bc.29, %1065 ]
  %besterr.36 = phi i32 [ %besterr.27, %995 ], [ %besterr.35, %1260 ], [ %besterr.33, %1195 ], [ %besterr.31, %1130 ], [ %besterr.29, %1065 ]
  %1262 = icmp eq i32 %tr.1, %br.36, !dbg !1274
  br i1 %1262, label %1263, label %1266, !dbg !1276

; <label>:1263                                    ; preds = %1261
  %1264 = icmp eq i32 %tc.1, %bc.36, !dbg !1277
  br i1 %1264, label %1265, label %1266, !dbg !1276

; <label>:1265                                    ; preds = %1263
  br label %1267, !dbg !1278

; <label>:1266                                    ; preds = %1263, %1261
  call void @llvm.dbg.value(metadata i32 %br.36, i64 0, metadata !678, metadata !506), !dbg !679
  call void @llvm.dbg.value(metadata i32 %bc.36, i64 0, metadata !680, metadata !506), !dbg !681
  br label %760, !dbg !1038

; <label>:1267                                    ; preds = %1265, %760
  %br.37 = phi i32 [ %br.36, %1265 ], [ %br.19, %760 ]
  %bc.37 = phi i32 [ %bc.36, %1265 ], [ %bc.19, %760 ]
  %besterr.37 = phi i32 [ %besterr.36, %1265 ], [ %besterr.19, %760 ]
  %1268 = mul nsw i32 %br.37, 2, !dbg !1279
  %1269 = trunc i32 %1268 to i16, !dbg !1279
  %1270 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1280
  %1271 = getelementptr inbounds %struct.MV* %1270, i32 0, i32 0, !dbg !1280
  store i16 %1269, i16* %1271, align 2, !dbg !1280
  %1272 = mul nsw i32 %bc.37, 2, !dbg !1281
  %1273 = trunc i32 %1272 to i16, !dbg !1281
  %1274 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1282
  %1275 = getelementptr inbounds %struct.MV* %1274, i32 0, i32 1, !dbg !1282
  store i16 %1273, i16* %1275, align 2, !dbg !1282
  %1276 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1283
  %1277 = getelementptr inbounds %struct.MV* %1276, i32 0, i32 1, !dbg !1283
  %1278 = load i16* %1277, align 2, !dbg !1283
  %1279 = sext i16 %1278 to i32, !dbg !1283
  %1280 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !1285
  %1281 = getelementptr inbounds %struct.MV* %1280, i32 0, i32 1, !dbg !1285
  %1282 = load i16* %1281, align 2, !dbg !1285
  %1283 = sext i16 %1282 to i32, !dbg !1285
  %1284 = sub nsw i32 %1279, %1283, !dbg !1283
  %1285 = call i32 @abs(i32 %1284) #1, !dbg !1286
  %1286 = icmp sgt i32 %1285, 2040, !dbg !1286
  br i1 %1286, label %1299, label %1287, !dbg !1287

; <label>:1287                                    ; preds = %1267
  %1288 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1288
  %1289 = getelementptr inbounds %struct.MV* %1288, i32 0, i32 0, !dbg !1288
  %1290 = load i16* %1289, align 2, !dbg !1288
  %1291 = sext i16 %1290 to i32, !dbg !1288
  %1292 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !1289
  %1293 = getelementptr inbounds %struct.MV* %1292, i32 0, i32 0, !dbg !1289
  %1294 = load i16* %1293, align 2, !dbg !1289
  %1295 = sext i16 %1294 to i32, !dbg !1289
  %1296 = sub nsw i32 %1291, %1295, !dbg !1288
  %1297 = call i32 @abs(i32 %1296) #1, !dbg !1290
  %1298 = icmp sgt i32 %1297, 2040, !dbg !1290
  br i1 %1298, label %1299, label %1300, !dbg !1287

; <label>:1299                                    ; preds = %1287, %1267
  br label %1301, !dbg !1291

; <label>:1300                                    ; preds = %1287
  br label %1301, !dbg !1292

; <label>:1301                                    ; preds = %1300, %1299
  %.0 = phi i32 [ 2147483647, %1299 ], [ %besterr.37, %1300 ]
  ret i32 %.0, !dbg !1293
}

; Function Attrs: nounwind uwtable
define internal i32 @mv_err_cost(%union.int_mv* %mv, %union.int_mv* %ref, i32** %mvcost, i32 %error_per_bit) #0 {
  call void @llvm.dbg.value(metadata %union.int_mv* %mv, i64 0, metadata !1294, metadata !506), !dbg !1295
  call void @llvm.dbg.value(metadata %union.int_mv* %ref, i64 0, metadata !1296, metadata !506), !dbg !1297
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !1298, metadata !506), !dbg !1299
  call void @llvm.dbg.value(metadata i32 %error_per_bit, i64 0, metadata !1300, metadata !506), !dbg !1301
  %1 = icmp ne i32** %mvcost, null, !dbg !1302
  br i1 %1, label %2, label %37, !dbg !1302

; <label>:2                                       ; preds = %0
  %3 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !1303
  %4 = getelementptr inbounds %struct.MV* %3, i32 0, i32 0, !dbg !1303
  %5 = load i16* %4, align 2, !dbg !1303
  %6 = sext i16 %5 to i32, !dbg !1303
  %7 = bitcast %union.int_mv* %ref to %struct.MV*, !dbg !1305
  %8 = getelementptr inbounds %struct.MV* %7, i32 0, i32 0, !dbg !1305
  %9 = load i16* %8, align 2, !dbg !1305
  %10 = sext i16 %9 to i32, !dbg !1305
  %11 = sub nsw i32 %6, %10, !dbg !1303
  %12 = ashr i32 %11, 1, !dbg !1306
  %13 = sext i32 %12 to i64, !dbg !1307
  %14 = getelementptr inbounds i32** %mvcost, i64 0, !dbg !1307
  %15 = load i32** %14, align 8, !dbg !1307
  %16 = getelementptr inbounds i32* %15, i64 %13, !dbg !1307
  %17 = load i32* %16, align 4, !dbg !1307
  %18 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !1308
  %19 = getelementptr inbounds %struct.MV* %18, i32 0, i32 1, !dbg !1308
  %20 = load i16* %19, align 2, !dbg !1308
  %21 = sext i16 %20 to i32, !dbg !1308
  %22 = bitcast %union.int_mv* %ref to %struct.MV*, !dbg !1309
  %23 = getelementptr inbounds %struct.MV* %22, i32 0, i32 1, !dbg !1309
  %24 = load i16* %23, align 2, !dbg !1309
  %25 = sext i16 %24 to i32, !dbg !1309
  %26 = sub nsw i32 %21, %25, !dbg !1308
  %27 = ashr i32 %26, 1, !dbg !1310
  %28 = sext i32 %27 to i64, !dbg !1311
  %29 = getelementptr inbounds i32** %mvcost, i64 1, !dbg !1311
  %30 = load i32** %29, align 8, !dbg !1311
  %31 = getelementptr inbounds i32* %30, i64 %28, !dbg !1311
  %32 = load i32* %31, align 4, !dbg !1311
  %33 = add nsw i32 %17, %32, !dbg !1307
  %34 = mul nsw i32 %33, %error_per_bit, !dbg !1312
  %35 = add nsw i32 %34, 128, !dbg !1312
  %36 = ashr i32 %35, 8, !dbg !1313
  br label %38, !dbg !1314

; <label>:37                                      ; preds = %0
  br label %38, !dbg !1315

; <label>:38                                      ; preds = %37, %2
  %.0 = phi i32 [ %36, %2 ], [ 0, %37 ]
  ret i32 %.0, !dbg !1316
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #2

; Function Attrs: nounwind uwtable
define i32 @vp8_find_best_sub_pixel_step(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32 %error_per_bit, %struct.variance_vtable* %vfp, i32** %mvcost, i32* %distortion, i32* %sse1) #0 {
  %startmv = alloca %union.int_mv, align 4
  %this_mv = alloca %union.int_mv, align 4
  %sse = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !1317, metadata !506), !dbg !1318
  call void @llvm.dbg.value(metadata %struct.block* %b, i64 0, metadata !1319, metadata !506), !dbg !1320
  call void @llvm.dbg.value(metadata %struct.blockd* %d, i64 0, metadata !1321, metadata !506), !dbg !1322
  call void @llvm.dbg.value(metadata %union.int_mv* %bestmv, i64 0, metadata !1323, metadata !506), !dbg !1324
  call void @llvm.dbg.value(metadata %union.int_mv* %ref_mv, i64 0, metadata !1325, metadata !506), !dbg !1326
  call void @llvm.dbg.value(metadata i32 %error_per_bit, i64 0, metadata !1327, metadata !506), !dbg !1328
  call void @llvm.dbg.value(metadata %struct.variance_vtable* %vfp, i64 0, metadata !1329, metadata !506), !dbg !1330
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !1331, metadata !506), !dbg !1332
  call void @llvm.dbg.value(metadata i32* %distortion, i64 0, metadata !1333, metadata !506), !dbg !1334
  call void @llvm.dbg.value(metadata i32* %sse1, i64 0, metadata !1335, metadata !506), !dbg !1336
  call void @llvm.dbg.value(metadata i32 2147483647, i64 0, metadata !1337, metadata !506), !dbg !1338
  call void @llvm.dbg.declare(metadata %union.int_mv* %startmv, metadata !1339, metadata !506), !dbg !1340
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !1341, metadata !506), !dbg !1342
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9, !dbg !1343
  %2 = load i8*** %1, align 8, !dbg !1343
  %3 = load i8** %2, align 8, !dbg !1344
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10, !dbg !1345
  %5 = load i32* %4, align 4, !dbg !1345
  %6 = sext i32 %5 to i64, !dbg !1344
  %7 = getelementptr inbounds i8* %3, i64 %6, !dbg !1344
  call void @llvm.dbg.value(metadata i8* %7, i64 0, metadata !1346, metadata !506), !dbg !1347
  call void @llvm.dbg.declare(metadata i32* %sse, metadata !1348, metadata !506), !dbg !1349
  %8 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !1350
  %9 = getelementptr inbounds %struct.macroblockd* %8, i32 0, i32 11, !dbg !1350
  %10 = getelementptr inbounds %struct.yv12_buffer_config* %9, i32 0, i32 4, !dbg !1350
  %11 = load i32* %10, align 4, !dbg !1350
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !1351, metadata !506), !dbg !1352
  %12 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !1353
  %13 = getelementptr inbounds %struct.macroblockd* %12, i32 0, i32 11, !dbg !1353
  %14 = getelementptr inbounds %struct.yv12_buffer_config* %13, i32 0, i32 13, !dbg !1353
  %15 = load i8** %14, align 8, !dbg !1353
  call void @llvm.dbg.value(metadata i8* %15, i64 0, metadata !1354, metadata !506), !dbg !1355
  %16 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !1356
  call void @llvm.dbg.value(metadata %struct.macroblockd* %16, i64 0, metadata !1357, metadata !506), !dbg !1358
  %17 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4, !dbg !1359
  %18 = load i32* %17, align 4, !dbg !1359
  %19 = sext i32 %18 to i64, !dbg !1360
  %20 = getelementptr inbounds i8* %15, i64 %19, !dbg !1360
  %21 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1361
  %22 = getelementptr inbounds %struct.MV* %21, i32 0, i32 0, !dbg !1361
  %23 = load i16* %22, align 2, !dbg !1361
  %24 = sext i16 %23 to i32, !dbg !1362
  %25 = mul nsw i32 %24, %11, !dbg !1362
  %26 = sext i32 %25 to i64, !dbg !1360
  %27 = getelementptr inbounds i8* %20, i64 %26, !dbg !1360
  %28 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1363
  %29 = getelementptr inbounds %struct.MV* %28, i32 0, i32 1, !dbg !1363
  %30 = load i16* %29, align 2, !dbg !1363
  %31 = sext i16 %30 to i32, !dbg !1363
  %32 = sext i32 %31 to i64, !dbg !1360
  %33 = getelementptr inbounds i8* %27, i64 %32, !dbg !1360
  call void @llvm.dbg.value(metadata i8* %33, i64 0, metadata !1364, metadata !506), !dbg !1365
  call void @llvm.dbg.value(metadata i32 32, i64 0, metadata !1366, metadata !506), !dbg !1367
  %34 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 9, !dbg !1368
  %35 = load void (i8*, i32, i8*, i32, i32)** %34, align 8, !dbg !1368
  %36 = getelementptr inbounds i8* %33, i64 -1, !dbg !1369
  %37 = sext i32 %11 to i64, !dbg !1369
  %38 = sub i64 0, %37, !dbg !1369
  %39 = getelementptr inbounds i8* %36, i64 %38, !dbg !1369
  %40 = getelementptr inbounds %struct.macroblockd* %16, i32 0, i32 46, !dbg !1370
  %41 = getelementptr inbounds [704 x i8]* %40, i32 0, i32 0, !dbg !1370
  call void %35(i8* %39, i32 %11, i8* %41, i32 32, i32 18), !dbg !1368
  %42 = getelementptr inbounds %struct.macroblockd* %16, i32 0, i32 46, !dbg !1371
  %43 = getelementptr inbounds [704 x i8]* %42, i32 0, i32 0, !dbg !1371
  %44 = sext i32 32 to i64, !dbg !1371
  %45 = getelementptr inbounds i8* %43, i64 %44, !dbg !1371
  %46 = getelementptr inbounds i8* %45, i64 1, !dbg !1371
  call void @llvm.dbg.value(metadata i8* %46, i64 0, metadata !1372, metadata !506), !dbg !1373
  %47 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1374
  %48 = getelementptr inbounds %struct.MV* %47, i32 0, i32 0, !dbg !1374
  %49 = load i16* %48, align 2, !dbg !1374
  %50 = sext i16 %49 to i32, !dbg !1374
  %51 = shl i32 %50, 3, !dbg !1374
  %52 = trunc i32 %51 to i16, !dbg !1374
  store i16 %52, i16* %48, align 2, !dbg !1374
  %53 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1375
  %54 = getelementptr inbounds %struct.MV* %53, i32 0, i32 1, !dbg !1375
  %55 = load i16* %54, align 2, !dbg !1375
  %56 = sext i16 %55 to i32, !dbg !1375
  %57 = shl i32 %56, 3, !dbg !1375
  %58 = trunc i32 %57 to i16, !dbg !1375
  store i16 %58, i16* %54, align 2, !dbg !1375
  %59 = bitcast %union.int_mv* %startmv to i8*, !dbg !1376
  %60 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1376
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %59, i8* %60, i64 4, i32 4, i1 false), !dbg !1376
  %61 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 1, !dbg !1377
  %62 = load i32 (i8*, i32, i8*, i32, i32*)** %61, align 8, !dbg !1377
  %63 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1378
  %64 = load i32* %63, align 4, !dbg !1378
  %65 = call i32 %62(i8* %46, i32 32, i8* %7, i32 %64, i32* %sse1), !dbg !1377
  call void @llvm.dbg.value(metadata i32 %65, i64 0, metadata !1337, metadata !506), !dbg !1338
  store i32 %65, i32* %distortion, align 4, !dbg !1379
  %66 = call i32 @mv_err_cost(%union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1380
  %67 = add nsw i32 %65, %66, !dbg !1381
  call void @llvm.dbg.value(metadata i32 %67, i64 0, metadata !1337, metadata !506), !dbg !1338
  %68 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1382
  %69 = getelementptr inbounds %struct.MV* %68, i32 0, i32 0, !dbg !1382
  %70 = load i16* %69, align 2, !dbg !1382
  %71 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1383
  %72 = getelementptr inbounds %struct.MV* %71, i32 0, i32 0, !dbg !1383
  store i16 %70, i16* %72, align 2, !dbg !1383
  %73 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1384
  %74 = getelementptr inbounds %struct.MV* %73, i32 0, i32 1, !dbg !1384
  %75 = load i16* %74, align 2, !dbg !1384
  %76 = sext i16 %75 to i32, !dbg !1384
  %77 = sub nsw i32 %76, 8, !dbg !1384
  %78 = or i32 %77, 4, !dbg !1385
  %79 = trunc i32 %78 to i16, !dbg !1386
  %80 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1387
  %81 = getelementptr inbounds %struct.MV* %80, i32 0, i32 1, !dbg !1387
  store i16 %79, i16* %81, align 2, !dbg !1387
  %82 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 3, !dbg !1388
  %83 = load i32 (i8*, i32, i8*, i32, i32*)** %82, align 8, !dbg !1388
  %84 = getelementptr inbounds i8* %46, i64 -1, !dbg !1389
  %85 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1390
  %86 = load i32* %85, align 4, !dbg !1390
  %87 = call i32 %83(i8* %84, i32 32, i8* %7, i32 %86, i32* %sse), !dbg !1388
  call void @llvm.dbg.value(metadata i32 %87, i64 0, metadata !1391, metadata !506), !dbg !1392
  %88 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1393
  %89 = add nsw i32 %87, %88, !dbg !1394
  call void @llvm.dbg.value(metadata i32 %89, i64 0, metadata !1395, metadata !506), !dbg !1396
  %90 = icmp slt i32 %89, %67, !dbg !1397
  br i1 %90, label %91, label %95, !dbg !1399

; <label>:91                                      ; preds = %0
  %92 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1400
  %93 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1400
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %92, i8* %93, i64 4, i32 4, i1 false), !dbg !1400
  call void @llvm.dbg.value(metadata i32 %89, i64 0, metadata !1337, metadata !506), !dbg !1338
  store i32 %87, i32* %distortion, align 4, !dbg !1402
  %94 = load i32* %sse, align 4, !dbg !1403
  store i32 %94, i32* %sse1, align 4, !dbg !1404
  br label %95, !dbg !1405

; <label>:95                                      ; preds = %91, %0
  %bestmse.0 = phi i32 [ %89, %91 ], [ %67, %0 ]
  %96 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1406
  %97 = getelementptr inbounds %struct.MV* %96, i32 0, i32 1, !dbg !1406
  %98 = load i16* %97, align 2, !dbg !1406
  %99 = sext i16 %98 to i32, !dbg !1406
  %100 = add nsw i32 %99, 8, !dbg !1406
  %101 = trunc i32 %100 to i16, !dbg !1406
  store i16 %101, i16* %97, align 2, !dbg !1406
  %102 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 3, !dbg !1407
  %103 = load i32 (i8*, i32, i8*, i32, i32*)** %102, align 8, !dbg !1407
  %104 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1408
  %105 = load i32* %104, align 4, !dbg !1408
  %106 = call i32 %103(i8* %46, i32 32, i8* %7, i32 %105, i32* %sse), !dbg !1407
  call void @llvm.dbg.value(metadata i32 %106, i64 0, metadata !1391, metadata !506), !dbg !1392
  %107 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1409
  %108 = add nsw i32 %106, %107, !dbg !1410
  call void @llvm.dbg.value(metadata i32 %108, i64 0, metadata !1411, metadata !506), !dbg !1412
  %109 = icmp slt i32 %108, %bestmse.0, !dbg !1413
  br i1 %109, label %110, label %114, !dbg !1415

; <label>:110                                     ; preds = %95
  %111 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1416
  %112 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1416
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %111, i8* %112, i64 4, i32 4, i1 false), !dbg !1416
  call void @llvm.dbg.value(metadata i32 %108, i64 0, metadata !1337, metadata !506), !dbg !1338
  store i32 %106, i32* %distortion, align 4, !dbg !1418
  %113 = load i32* %sse, align 4, !dbg !1419
  store i32 %113, i32* %sse1, align 4, !dbg !1420
  br label %114, !dbg !1421

; <label>:114                                     ; preds = %110, %95
  %bestmse.1 = phi i32 [ %108, %110 ], [ %bestmse.0, %95 ]
  %115 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1422
  %116 = getelementptr inbounds %struct.MV* %115, i32 0, i32 1, !dbg !1422
  %117 = load i16* %116, align 2, !dbg !1422
  %118 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1423
  %119 = getelementptr inbounds %struct.MV* %118, i32 0, i32 1, !dbg !1423
  store i16 %117, i16* %119, align 2, !dbg !1423
  %120 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1424
  %121 = getelementptr inbounds %struct.MV* %120, i32 0, i32 0, !dbg !1424
  %122 = load i16* %121, align 2, !dbg !1424
  %123 = sext i16 %122 to i32, !dbg !1424
  %124 = sub nsw i32 %123, 8, !dbg !1424
  %125 = or i32 %124, 4, !dbg !1425
  %126 = trunc i32 %125 to i16, !dbg !1426
  %127 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1427
  %128 = getelementptr inbounds %struct.MV* %127, i32 0, i32 0, !dbg !1427
  store i16 %126, i16* %128, align 2, !dbg !1427
  %129 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 4, !dbg !1428
  %130 = load i32 (i8*, i32, i8*, i32, i32*)** %129, align 8, !dbg !1428
  %131 = sext i32 32 to i64, !dbg !1429
  %132 = sub i64 0, %131, !dbg !1429
  %133 = getelementptr inbounds i8* %46, i64 %132, !dbg !1429
  %134 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1430
  %135 = load i32* %134, align 4, !dbg !1430
  %136 = call i32 %130(i8* %133, i32 32, i8* %7, i32 %135, i32* %sse), !dbg !1428
  call void @llvm.dbg.value(metadata i32 %136, i64 0, metadata !1391, metadata !506), !dbg !1392
  %137 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1431
  %138 = add nsw i32 %136, %137, !dbg !1432
  call void @llvm.dbg.value(metadata i32 %138, i64 0, metadata !1433, metadata !506), !dbg !1434
  %139 = icmp slt i32 %138, %bestmse.1, !dbg !1435
  br i1 %139, label %140, label %144, !dbg !1437

; <label>:140                                     ; preds = %114
  %141 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1438
  %142 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1438
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %141, i8* %142, i64 4, i32 4, i1 false), !dbg !1438
  call void @llvm.dbg.value(metadata i32 %138, i64 0, metadata !1337, metadata !506), !dbg !1338
  store i32 %136, i32* %distortion, align 4, !dbg !1440
  %143 = load i32* %sse, align 4, !dbg !1441
  store i32 %143, i32* %sse1, align 4, !dbg !1442
  br label %144, !dbg !1443

; <label>:144                                     ; preds = %140, %114
  %bestmse.2 = phi i32 [ %138, %140 ], [ %bestmse.1, %114 ]
  %145 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1444
  %146 = getelementptr inbounds %struct.MV* %145, i32 0, i32 0, !dbg !1444
  %147 = load i16* %146, align 2, !dbg !1444
  %148 = sext i16 %147 to i32, !dbg !1444
  %149 = add nsw i32 %148, 8, !dbg !1444
  %150 = trunc i32 %149 to i16, !dbg !1444
  store i16 %150, i16* %146, align 2, !dbg !1444
  %151 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 4, !dbg !1445
  %152 = load i32 (i8*, i32, i8*, i32, i32*)** %151, align 8, !dbg !1445
  %153 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1446
  %154 = load i32* %153, align 4, !dbg !1446
  %155 = call i32 %152(i8* %46, i32 32, i8* %7, i32 %154, i32* %sse), !dbg !1445
  call void @llvm.dbg.value(metadata i32 %155, i64 0, metadata !1391, metadata !506), !dbg !1392
  %156 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1447
  %157 = add nsw i32 %155, %156, !dbg !1448
  call void @llvm.dbg.value(metadata i32 %157, i64 0, metadata !1449, metadata !506), !dbg !1450
  %158 = icmp slt i32 %157, %bestmse.2, !dbg !1451
  br i1 %158, label %159, label %163, !dbg !1453

; <label>:159                                     ; preds = %144
  %160 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1454
  %161 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1454
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %160, i8* %161, i64 4, i32 4, i1 false), !dbg !1454
  call void @llvm.dbg.value(metadata i32 %157, i64 0, metadata !1337, metadata !506), !dbg !1338
  store i32 %155, i32* %distortion, align 4, !dbg !1456
  %162 = load i32* %sse, align 4, !dbg !1457
  store i32 %162, i32* %sse1, align 4, !dbg !1458
  br label %163, !dbg !1459

; <label>:163                                     ; preds = %159, %144
  %bestmse.3 = phi i32 [ %157, %159 ], [ %bestmse.2, %144 ]
  %164 = icmp slt i32 %89, %108, !dbg !1460
  %165 = select i1 %164, i32 0, i32 1, !dbg !1460
  %166 = icmp slt i32 %138, %157, !dbg !1461
  %167 = select i1 %166, i32 0, i32 2, !dbg !1461
  %168 = add nsw i32 %165, %167, !dbg !1462
  call void @llvm.dbg.value(metadata i32 %168, i64 0, metadata !1463, metadata !506), !dbg !1464
  %169 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1465
  %170 = bitcast %union.int_mv* %startmv to i8*, !dbg !1465
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %169, i8* %170, i64 4, i32 4, i1 false), !dbg !1465
  switch i32 %168, label %246 [
    i32 0, label %171
    i32 1, label %199
    i32 2, label %223
    i32 3, label %245
  ], !dbg !1466

; <label>:171                                     ; preds = %163
  %172 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1467
  %173 = getelementptr inbounds %struct.MV* %172, i32 0, i32 1, !dbg !1467
  %174 = load i16* %173, align 2, !dbg !1467
  %175 = sext i16 %174 to i32, !dbg !1467
  %176 = sub nsw i32 %175, 8, !dbg !1467
  %177 = or i32 %176, 4, !dbg !1469
  %178 = trunc i32 %177 to i16, !dbg !1469
  %179 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1470
  %180 = getelementptr inbounds %struct.MV* %179, i32 0, i32 1, !dbg !1470
  store i16 %178, i16* %180, align 2, !dbg !1470
  %181 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1471
  %182 = getelementptr inbounds %struct.MV* %181, i32 0, i32 0, !dbg !1471
  %183 = load i16* %182, align 2, !dbg !1471
  %184 = sext i16 %183 to i32, !dbg !1471
  %185 = sub nsw i32 %184, 8, !dbg !1471
  %186 = or i32 %185, 4, !dbg !1472
  %187 = trunc i32 %186 to i16, !dbg !1472
  %188 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1473
  %189 = getelementptr inbounds %struct.MV* %188, i32 0, i32 0, !dbg !1473
  store i16 %187, i16* %189, align 2, !dbg !1473
  %190 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5, !dbg !1474
  %191 = load i32 (i8*, i32, i8*, i32, i32*)** %190, align 8, !dbg !1474
  %192 = getelementptr inbounds i8* %46, i64 -1, !dbg !1475
  %193 = sext i32 32 to i64, !dbg !1475
  %194 = sub i64 0, %193, !dbg !1475
  %195 = getelementptr inbounds i8* %192, i64 %194, !dbg !1475
  %196 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1476
  %197 = load i32* %196, align 4, !dbg !1476
  %198 = call i32 %191(i8* %195, i32 32, i8* %7, i32 %197, i32* %sse), !dbg !1474
  call void @llvm.dbg.value(metadata i32 %198, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %264, !dbg !1477

; <label>:199                                     ; preds = %163
  %200 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1478
  %201 = getelementptr inbounds %struct.MV* %200, i32 0, i32 1, !dbg !1478
  %202 = load i16* %201, align 2, !dbg !1478
  %203 = sext i16 %202 to i32, !dbg !1478
  %204 = add nsw i32 %203, 4, !dbg !1478
  %205 = trunc i32 %204 to i16, !dbg !1478
  store i16 %205, i16* %201, align 2, !dbg !1478
  %206 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1479
  %207 = getelementptr inbounds %struct.MV* %206, i32 0, i32 0, !dbg !1479
  %208 = load i16* %207, align 2, !dbg !1479
  %209 = sext i16 %208 to i32, !dbg !1479
  %210 = sub nsw i32 %209, 8, !dbg !1479
  %211 = or i32 %210, 4, !dbg !1480
  %212 = trunc i32 %211 to i16, !dbg !1480
  %213 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1481
  %214 = getelementptr inbounds %struct.MV* %213, i32 0, i32 0, !dbg !1481
  store i16 %212, i16* %214, align 2, !dbg !1481
  %215 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5, !dbg !1482
  %216 = load i32 (i8*, i32, i8*, i32, i32*)** %215, align 8, !dbg !1482
  %217 = sext i32 32 to i64, !dbg !1483
  %218 = sub i64 0, %217, !dbg !1483
  %219 = getelementptr inbounds i8* %46, i64 %218, !dbg !1483
  %220 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1484
  %221 = load i32* %220, align 4, !dbg !1484
  %222 = call i32 %216(i8* %219, i32 32, i8* %7, i32 %221, i32* %sse), !dbg !1482
  call void @llvm.dbg.value(metadata i32 %222, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %264, !dbg !1485

; <label>:223                                     ; preds = %163
  %224 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1486
  %225 = getelementptr inbounds %struct.MV* %224, i32 0, i32 1, !dbg !1486
  %226 = load i16* %225, align 2, !dbg !1486
  %227 = sext i16 %226 to i32, !dbg !1486
  %228 = sub nsw i32 %227, 8, !dbg !1486
  %229 = or i32 %228, 4, !dbg !1487
  %230 = trunc i32 %229 to i16, !dbg !1487
  %231 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1488
  %232 = getelementptr inbounds %struct.MV* %231, i32 0, i32 1, !dbg !1488
  store i16 %230, i16* %232, align 2, !dbg !1488
  %233 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1489
  %234 = getelementptr inbounds %struct.MV* %233, i32 0, i32 0, !dbg !1489
  %235 = load i16* %234, align 2, !dbg !1489
  %236 = sext i16 %235 to i32, !dbg !1489
  %237 = add nsw i32 %236, 4, !dbg !1489
  %238 = trunc i32 %237 to i16, !dbg !1489
  store i16 %238, i16* %234, align 2, !dbg !1489
  %239 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5, !dbg !1490
  %240 = load i32 (i8*, i32, i8*, i32, i32*)** %239, align 8, !dbg !1490
  %241 = getelementptr inbounds i8* %46, i64 -1, !dbg !1491
  %242 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1492
  %243 = load i32* %242, align 4, !dbg !1492
  %244 = call i32 %240(i8* %241, i32 32, i8* %7, i32 %243, i32* %sse), !dbg !1490
  call void @llvm.dbg.value(metadata i32 %244, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %264, !dbg !1493

; <label>:245                                     ; preds = %163
  br label %246, !dbg !1493

; <label>:246                                     ; preds = %245, %163
  %247 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1494
  %248 = getelementptr inbounds %struct.MV* %247, i32 0, i32 1, !dbg !1494
  %249 = load i16* %248, align 2, !dbg !1494
  %250 = sext i16 %249 to i32, !dbg !1494
  %251 = add nsw i32 %250, 4, !dbg !1494
  %252 = trunc i32 %251 to i16, !dbg !1494
  store i16 %252, i16* %248, align 2, !dbg !1494
  %253 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1495
  %254 = getelementptr inbounds %struct.MV* %253, i32 0, i32 0, !dbg !1495
  %255 = load i16* %254, align 2, !dbg !1495
  %256 = sext i16 %255 to i32, !dbg !1495
  %257 = add nsw i32 %256, 4, !dbg !1495
  %258 = trunc i32 %257 to i16, !dbg !1495
  store i16 %258, i16* %254, align 2, !dbg !1495
  %259 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5, !dbg !1496
  %260 = load i32 (i8*, i32, i8*, i32, i32*)** %259, align 8, !dbg !1496
  %261 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1497
  %262 = load i32* %261, align 4, !dbg !1497
  %263 = call i32 %260(i8* %46, i32 32, i8* %7, i32 %262, i32* %sse), !dbg !1496
  call void @llvm.dbg.value(metadata i32 %263, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %264, !dbg !1498

; <label>:264                                     ; preds = %246, %223, %199, %171
  %thismse.0 = phi i32 [ %263, %246 ], [ %244, %223 ], [ %222, %199 ], [ %198, %171 ]
  %265 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1499
  %266 = add nsw i32 %thismse.0, %265, !dbg !1500
  call void @llvm.dbg.value(metadata i32 %266, i64 0, metadata !1501, metadata !506), !dbg !1502
  %267 = icmp slt i32 %266, %bestmse.3, !dbg !1503
  br i1 %267, label %268, label %272, !dbg !1505

; <label>:268                                     ; preds = %264
  %269 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1506
  %270 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1506
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %269, i8* %270, i64 4, i32 4, i1 false), !dbg !1506
  call void @llvm.dbg.value(metadata i32 %266, i64 0, metadata !1337, metadata !506), !dbg !1338
  store i32 %thismse.0, i32* %distortion, align 4, !dbg !1508
  %271 = load i32* %sse, align 4, !dbg !1509
  store i32 %271, i32* %sse1, align 4, !dbg !1510
  br label %272, !dbg !1511

; <label>:272                                     ; preds = %268, %264
  %bestmse.4 = phi i32 [ %266, %268 ], [ %bestmse.3, %264 ]
  %273 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1512
  %274 = getelementptr inbounds %struct.MV* %273, i32 0, i32 0, !dbg !1512
  %275 = load i16* %274, align 2, !dbg !1512
  %276 = sext i16 %275 to i32, !dbg !1512
  %277 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1514
  %278 = getelementptr inbounds %struct.MV* %277, i32 0, i32 0, !dbg !1514
  %279 = load i16* %278, align 2, !dbg !1514
  %280 = sext i16 %279 to i32, !dbg !1514
  %281 = icmp slt i32 %276, %280, !dbg !1512
  br i1 %281, label %282, label %286, !dbg !1515

; <label>:282                                     ; preds = %272
  %283 = sext i32 32 to i64, !dbg !1516
  %284 = sub i64 0, %283, !dbg !1516
  %285 = getelementptr inbounds i8* %46, i64 %284, !dbg !1516
  call void @llvm.dbg.value(metadata i8* %285, i64 0, metadata !1372, metadata !506), !dbg !1373
  br label %286, !dbg !1516

; <label>:286                                     ; preds = %282, %272
  %y.0 = phi i8* [ %285, %282 ], [ %46, %272 ]
  %287 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1517
  %288 = getelementptr inbounds %struct.MV* %287, i32 0, i32 1, !dbg !1517
  %289 = load i16* %288, align 2, !dbg !1517
  %290 = sext i16 %289 to i32, !dbg !1517
  %291 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1519
  %292 = getelementptr inbounds %struct.MV* %291, i32 0, i32 1, !dbg !1519
  %293 = load i16* %292, align 2, !dbg !1519
  %294 = sext i16 %293 to i32, !dbg !1519
  %295 = icmp slt i32 %290, %294, !dbg !1517
  br i1 %295, label %296, label %298, !dbg !1520

; <label>:296                                     ; preds = %286
  %297 = getelementptr inbounds i8* %y.0, i32 -1, !dbg !1521
  call void @llvm.dbg.value(metadata i8* %297, i64 0, metadata !1372, metadata !506), !dbg !1373
  br label %298, !dbg !1521

; <label>:298                                     ; preds = %296, %286
  %y.1 = phi i8* [ %297, %296 ], [ %y.0, %286 ]
  %299 = bitcast %union.int_mv* %startmv to i8*, !dbg !1522
  %300 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1522
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %299, i8* %300, i64 4, i32 4, i1 false), !dbg !1522
  %301 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1523
  %302 = getelementptr inbounds %struct.MV* %301, i32 0, i32 0, !dbg !1523
  %303 = load i16* %302, align 2, !dbg !1523
  %304 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1524
  %305 = getelementptr inbounds %struct.MV* %304, i32 0, i32 0, !dbg !1524
  store i16 %303, i16* %305, align 2, !dbg !1524
  %306 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1525
  %307 = getelementptr inbounds %struct.MV* %306, i32 0, i32 1, !dbg !1525
  %308 = load i16* %307, align 2, !dbg !1525
  %309 = sext i16 %308 to i32, !dbg !1525
  %310 = and i32 %309, 7, !dbg !1525
  %311 = icmp ne i32 %310, 0, !dbg !1527
  br i1 %311, label %312, label %336, !dbg !1527

; <label>:312                                     ; preds = %298
  %313 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1528
  %314 = getelementptr inbounds %struct.MV* %313, i32 0, i32 1, !dbg !1528
  %315 = load i16* %314, align 2, !dbg !1528
  %316 = sext i16 %315 to i32, !dbg !1528
  %317 = sub nsw i32 %316, 2, !dbg !1528
  %318 = trunc i32 %317 to i16, !dbg !1528
  %319 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1530
  %320 = getelementptr inbounds %struct.MV* %319, i32 0, i32 1, !dbg !1530
  store i16 %318, i16* %320, align 2, !dbg !1530
  %321 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1531
  %322 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %321, align 8, !dbg !1531
  %323 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1532
  %324 = getelementptr inbounds %struct.MV* %323, i32 0, i32 1, !dbg !1532
  %325 = load i16* %324, align 2, !dbg !1532
  %326 = sext i16 %325 to i32, !dbg !1532
  %327 = and i32 %326, 7, !dbg !1532
  %328 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1533
  %329 = getelementptr inbounds %struct.MV* %328, i32 0, i32 0, !dbg !1533
  %330 = load i16* %329, align 2, !dbg !1533
  %331 = sext i16 %330 to i32, !dbg !1533
  %332 = and i32 %331, 7, !dbg !1533
  %333 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1534
  %334 = load i32* %333, align 4, !dbg !1534
  %335 = call i32 %322(i8* %y.1, i32 32, i32 %327, i32 %332, i8* %7, i32 %334, i32* %sse), !dbg !1531
  call void @llvm.dbg.value(metadata i32 %335, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %357, !dbg !1535

; <label>:336                                     ; preds = %298
  %337 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1536
  %338 = getelementptr inbounds %struct.MV* %337, i32 0, i32 1, !dbg !1536
  %339 = load i16* %338, align 2, !dbg !1536
  %340 = sext i16 %339 to i32, !dbg !1536
  %341 = sub nsw i32 %340, 8, !dbg !1536
  %342 = or i32 %341, 6, !dbg !1538
  %343 = trunc i32 %342 to i16, !dbg !1538
  %344 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1539
  %345 = getelementptr inbounds %struct.MV* %344, i32 0, i32 1, !dbg !1539
  store i16 %343, i16* %345, align 2, !dbg !1539
  %346 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1540
  %347 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %346, align 8, !dbg !1540
  %348 = getelementptr inbounds i8* %y.1, i64 -1, !dbg !1541
  %349 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1542
  %350 = getelementptr inbounds %struct.MV* %349, i32 0, i32 0, !dbg !1542
  %351 = load i16* %350, align 2, !dbg !1542
  %352 = sext i16 %351 to i32, !dbg !1542
  %353 = and i32 %352, 7, !dbg !1542
  %354 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1543
  %355 = load i32* %354, align 4, !dbg !1543
  %356 = call i32 %347(i8* %348, i32 32, i32 6, i32 %353, i8* %7, i32 %355, i32* %sse), !dbg !1540
  call void @llvm.dbg.value(metadata i32 %356, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %357

; <label>:357                                     ; preds = %336, %312
  %thismse.1 = phi i32 [ %335, %312 ], [ %356, %336 ]
  %358 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1544
  %359 = add nsw i32 %thismse.1, %358, !dbg !1545
  call void @llvm.dbg.value(metadata i32 %359, i64 0, metadata !1395, metadata !506), !dbg !1396
  %360 = icmp slt i32 %359, %bestmse.4, !dbg !1546
  br i1 %360, label %361, label %365, !dbg !1548

; <label>:361                                     ; preds = %357
  %362 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1549
  %363 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1549
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %362, i8* %363, i64 4, i32 4, i1 false), !dbg !1549
  call void @llvm.dbg.value(metadata i32 %359, i64 0, metadata !1337, metadata !506), !dbg !1338
  store i32 %thismse.1, i32* %distortion, align 4, !dbg !1551
  %364 = load i32* %sse, align 4, !dbg !1552
  store i32 %364, i32* %sse1, align 4, !dbg !1553
  br label %365, !dbg !1554

; <label>:365                                     ; preds = %361, %357
  %bestmse.5 = phi i32 [ %359, %361 ], [ %bestmse.4, %357 ]
  %366 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1555
  %367 = getelementptr inbounds %struct.MV* %366, i32 0, i32 1, !dbg !1555
  %368 = load i16* %367, align 2, !dbg !1555
  %369 = sext i16 %368 to i32, !dbg !1555
  %370 = add nsw i32 %369, 4, !dbg !1555
  %371 = trunc i32 %370 to i16, !dbg !1555
  store i16 %371, i16* %367, align 2, !dbg !1555
  %372 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1556
  %373 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %372, align 8, !dbg !1556
  %374 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1557
  %375 = getelementptr inbounds %struct.MV* %374, i32 0, i32 1, !dbg !1557
  %376 = load i16* %375, align 2, !dbg !1557
  %377 = sext i16 %376 to i32, !dbg !1557
  %378 = and i32 %377, 7, !dbg !1557
  %379 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1558
  %380 = getelementptr inbounds %struct.MV* %379, i32 0, i32 0, !dbg !1558
  %381 = load i16* %380, align 2, !dbg !1558
  %382 = sext i16 %381 to i32, !dbg !1558
  %383 = and i32 %382, 7, !dbg !1558
  %384 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1559
  %385 = load i32* %384, align 4, !dbg !1559
  %386 = call i32 %373(i8* %y.1, i32 32, i32 %378, i32 %383, i8* %7, i32 %385, i32* %sse), !dbg !1556
  call void @llvm.dbg.value(metadata i32 %386, i64 0, metadata !1391, metadata !506), !dbg !1392
  %387 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1560
  %388 = add nsw i32 %386, %387, !dbg !1561
  call void @llvm.dbg.value(metadata i32 %388, i64 0, metadata !1411, metadata !506), !dbg !1412
  %389 = icmp slt i32 %388, %bestmse.5, !dbg !1562
  br i1 %389, label %390, label %394, !dbg !1564

; <label>:390                                     ; preds = %365
  %391 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1565
  %392 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1565
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %391, i8* %392, i64 4, i32 4, i1 false), !dbg !1565
  call void @llvm.dbg.value(metadata i32 %388, i64 0, metadata !1337, metadata !506), !dbg !1338
  store i32 %386, i32* %distortion, align 4, !dbg !1567
  %393 = load i32* %sse, align 4, !dbg !1568
  store i32 %393, i32* %sse1, align 4, !dbg !1569
  br label %394, !dbg !1570

; <label>:394                                     ; preds = %390, %365
  %bestmse.6 = phi i32 [ %388, %390 ], [ %bestmse.5, %365 ]
  %395 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1571
  %396 = getelementptr inbounds %struct.MV* %395, i32 0, i32 1, !dbg !1571
  %397 = load i16* %396, align 2, !dbg !1571
  %398 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1572
  %399 = getelementptr inbounds %struct.MV* %398, i32 0, i32 1, !dbg !1572
  store i16 %397, i16* %399, align 2, !dbg !1572
  %400 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1573
  %401 = getelementptr inbounds %struct.MV* %400, i32 0, i32 0, !dbg !1573
  %402 = load i16* %401, align 2, !dbg !1573
  %403 = sext i16 %402 to i32, !dbg !1573
  %404 = and i32 %403, 7, !dbg !1573
  %405 = icmp ne i32 %404, 0, !dbg !1575
  br i1 %405, label %406, label %430, !dbg !1575

; <label>:406                                     ; preds = %394
  %407 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1576
  %408 = getelementptr inbounds %struct.MV* %407, i32 0, i32 0, !dbg !1576
  %409 = load i16* %408, align 2, !dbg !1576
  %410 = sext i16 %409 to i32, !dbg !1576
  %411 = sub nsw i32 %410, 2, !dbg !1576
  %412 = trunc i32 %411 to i16, !dbg !1576
  %413 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1578
  %414 = getelementptr inbounds %struct.MV* %413, i32 0, i32 0, !dbg !1578
  store i16 %412, i16* %414, align 2, !dbg !1578
  %415 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1579
  %416 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %415, align 8, !dbg !1579
  %417 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1580
  %418 = getelementptr inbounds %struct.MV* %417, i32 0, i32 1, !dbg !1580
  %419 = load i16* %418, align 2, !dbg !1580
  %420 = sext i16 %419 to i32, !dbg !1580
  %421 = and i32 %420, 7, !dbg !1580
  %422 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1581
  %423 = getelementptr inbounds %struct.MV* %422, i32 0, i32 0, !dbg !1581
  %424 = load i16* %423, align 2, !dbg !1581
  %425 = sext i16 %424 to i32, !dbg !1581
  %426 = and i32 %425, 7, !dbg !1581
  %427 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1582
  %428 = load i32* %427, align 4, !dbg !1582
  %429 = call i32 %416(i8* %y.1, i32 32, i32 %421, i32 %426, i8* %7, i32 %428, i32* %sse), !dbg !1579
  call void @llvm.dbg.value(metadata i32 %429, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %453, !dbg !1583

; <label>:430                                     ; preds = %394
  %431 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1584
  %432 = getelementptr inbounds %struct.MV* %431, i32 0, i32 0, !dbg !1584
  %433 = load i16* %432, align 2, !dbg !1584
  %434 = sext i16 %433 to i32, !dbg !1584
  %435 = sub nsw i32 %434, 8, !dbg !1584
  %436 = or i32 %435, 6, !dbg !1586
  %437 = trunc i32 %436 to i16, !dbg !1586
  %438 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1587
  %439 = getelementptr inbounds %struct.MV* %438, i32 0, i32 0, !dbg !1587
  store i16 %437, i16* %439, align 2, !dbg !1587
  %440 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1588
  %441 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %440, align 8, !dbg !1588
  %442 = sext i32 32 to i64, !dbg !1589
  %443 = sub i64 0, %442, !dbg !1589
  %444 = getelementptr inbounds i8* %y.1, i64 %443, !dbg !1589
  %445 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1590
  %446 = getelementptr inbounds %struct.MV* %445, i32 0, i32 1, !dbg !1590
  %447 = load i16* %446, align 2, !dbg !1590
  %448 = sext i16 %447 to i32, !dbg !1590
  %449 = and i32 %448, 7, !dbg !1590
  %450 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1591
  %451 = load i32* %450, align 4, !dbg !1591
  %452 = call i32 %441(i8* %444, i32 32, i32 %449, i32 6, i8* %7, i32 %451, i32* %sse), !dbg !1588
  call void @llvm.dbg.value(metadata i32 %452, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %453

; <label>:453                                     ; preds = %430, %406
  %thismse.2 = phi i32 [ %429, %406 ], [ %452, %430 ]
  %454 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1592
  %455 = add nsw i32 %thismse.2, %454, !dbg !1593
  call void @llvm.dbg.value(metadata i32 %455, i64 0, metadata !1433, metadata !506), !dbg !1434
  %456 = icmp slt i32 %455, %bestmse.6, !dbg !1594
  br i1 %456, label %457, label %461, !dbg !1596

; <label>:457                                     ; preds = %453
  %458 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1597
  %459 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1597
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %458, i8* %459, i64 4, i32 4, i1 false), !dbg !1597
  call void @llvm.dbg.value(metadata i32 %455, i64 0, metadata !1337, metadata !506), !dbg !1338
  store i32 %thismse.2, i32* %distortion, align 4, !dbg !1599
  %460 = load i32* %sse, align 4, !dbg !1600
  store i32 %460, i32* %sse1, align 4, !dbg !1601
  br label %461, !dbg !1602

; <label>:461                                     ; preds = %457, %453
  %bestmse.7 = phi i32 [ %455, %457 ], [ %bestmse.6, %453 ]
  %462 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1603
  %463 = getelementptr inbounds %struct.MV* %462, i32 0, i32 0, !dbg !1603
  %464 = load i16* %463, align 2, !dbg !1603
  %465 = sext i16 %464 to i32, !dbg !1603
  %466 = add nsw i32 %465, 4, !dbg !1603
  %467 = trunc i32 %466 to i16, !dbg !1603
  store i16 %467, i16* %463, align 2, !dbg !1603
  %468 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1604
  %469 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %468, align 8, !dbg !1604
  %470 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1605
  %471 = getelementptr inbounds %struct.MV* %470, i32 0, i32 1, !dbg !1605
  %472 = load i16* %471, align 2, !dbg !1605
  %473 = sext i16 %472 to i32, !dbg !1605
  %474 = and i32 %473, 7, !dbg !1605
  %475 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1606
  %476 = getelementptr inbounds %struct.MV* %475, i32 0, i32 0, !dbg !1606
  %477 = load i16* %476, align 2, !dbg !1606
  %478 = sext i16 %477 to i32, !dbg !1606
  %479 = and i32 %478, 7, !dbg !1606
  %480 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1607
  %481 = load i32* %480, align 4, !dbg !1607
  %482 = call i32 %469(i8* %y.1, i32 32, i32 %474, i32 %479, i8* %7, i32 %481, i32* %sse), !dbg !1604
  call void @llvm.dbg.value(metadata i32 %482, i64 0, metadata !1391, metadata !506), !dbg !1392
  %483 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1608
  %484 = add nsw i32 %482, %483, !dbg !1609
  call void @llvm.dbg.value(metadata i32 %484, i64 0, metadata !1449, metadata !506), !dbg !1450
  %485 = icmp slt i32 %484, %bestmse.7, !dbg !1610
  br i1 %485, label %486, label %490, !dbg !1612

; <label>:486                                     ; preds = %461
  %487 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1613
  %488 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1613
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %487, i8* %488, i64 4, i32 4, i1 false), !dbg !1613
  call void @llvm.dbg.value(metadata i32 %484, i64 0, metadata !1337, metadata !506), !dbg !1338
  store i32 %482, i32* %distortion, align 4, !dbg !1615
  %489 = load i32* %sse, align 4, !dbg !1616
  store i32 %489, i32* %sse1, align 4, !dbg !1617
  br label %490, !dbg !1618

; <label>:490                                     ; preds = %486, %461
  %bestmse.8 = phi i32 [ %484, %486 ], [ %bestmse.7, %461 ]
  %491 = icmp slt i32 %359, %388, !dbg !1619
  %492 = select i1 %491, i32 0, i32 1, !dbg !1619
  %493 = icmp slt i32 %455, %484, !dbg !1620
  %494 = select i1 %493, i32 0, i32 2, !dbg !1620
  %495 = add nsw i32 %492, %494, !dbg !1621
  call void @llvm.dbg.value(metadata i32 %495, i64 0, metadata !1463, metadata !506), !dbg !1464
  %496 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1622
  %497 = bitcast %union.int_mv* %startmv to i8*, !dbg !1622
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %496, i8* %497, i64 4, i32 4, i1 false), !dbg !1622
  switch i32 %495, label %763 [
    i32 0, label %498
    i32 1, label %619
    i32 2, label %678
    i32 3, label %735
  ], !dbg !1623

; <label>:498                                     ; preds = %490
  %499 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1624
  %500 = getelementptr inbounds %struct.MV* %499, i32 0, i32 0, !dbg !1624
  %501 = load i16* %500, align 2, !dbg !1624
  %502 = sext i16 %501 to i32, !dbg !1624
  %503 = and i32 %502, 7, !dbg !1624
  %504 = icmp ne i32 %503, 0, !dbg !1627
  br i1 %504, label %505, label %562, !dbg !1627

; <label>:505                                     ; preds = %498
  %506 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1628
  %507 = getelementptr inbounds %struct.MV* %506, i32 0, i32 0, !dbg !1628
  %508 = load i16* %507, align 2, !dbg !1628
  %509 = sext i16 %508 to i32, !dbg !1628
  %510 = sub nsw i32 %509, 2, !dbg !1628
  %511 = trunc i32 %510 to i16, !dbg !1628
  store i16 %511, i16* %507, align 2, !dbg !1628
  %512 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1630
  %513 = getelementptr inbounds %struct.MV* %512, i32 0, i32 1, !dbg !1630
  %514 = load i16* %513, align 2, !dbg !1630
  %515 = sext i16 %514 to i32, !dbg !1630
  %516 = and i32 %515, 7, !dbg !1630
  %517 = icmp ne i32 %516, 0, !dbg !1632
  br i1 %517, label %518, label %540, !dbg !1632

; <label>:518                                     ; preds = %505
  %519 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1633
  %520 = getelementptr inbounds %struct.MV* %519, i32 0, i32 1, !dbg !1633
  %521 = load i16* %520, align 2, !dbg !1633
  %522 = sext i16 %521 to i32, !dbg !1633
  %523 = sub nsw i32 %522, 2, !dbg !1633
  %524 = trunc i32 %523 to i16, !dbg !1633
  store i16 %524, i16* %520, align 2, !dbg !1633
  %525 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1635
  %526 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %525, align 8, !dbg !1635
  %527 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1636
  %528 = getelementptr inbounds %struct.MV* %527, i32 0, i32 1, !dbg !1636
  %529 = load i16* %528, align 2, !dbg !1636
  %530 = sext i16 %529 to i32, !dbg !1636
  %531 = and i32 %530, 7, !dbg !1636
  %532 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1637
  %533 = getelementptr inbounds %struct.MV* %532, i32 0, i32 0, !dbg !1637
  %534 = load i16* %533, align 2, !dbg !1637
  %535 = sext i16 %534 to i32, !dbg !1637
  %536 = and i32 %535, 7, !dbg !1637
  %537 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1638
  %538 = load i32* %537, align 4, !dbg !1638
  %539 = call i32 %526(i8* %y.1, i32 32, i32 %531, i32 %536, i8* %7, i32 %538, i32* %sse), !dbg !1635
  call void @llvm.dbg.value(metadata i32 %539, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %561, !dbg !1639

; <label>:540                                     ; preds = %505
  %541 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1640
  %542 = getelementptr inbounds %struct.MV* %541, i32 0, i32 1, !dbg !1640
  %543 = load i16* %542, align 2, !dbg !1640
  %544 = sext i16 %543 to i32, !dbg !1640
  %545 = sub nsw i32 %544, 8, !dbg !1640
  %546 = or i32 %545, 6, !dbg !1642
  %547 = trunc i32 %546 to i16, !dbg !1642
  %548 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1643
  %549 = getelementptr inbounds %struct.MV* %548, i32 0, i32 1, !dbg !1643
  store i16 %547, i16* %549, align 2, !dbg !1643
  %550 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1644
  %551 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %550, align 8, !dbg !1644
  %552 = getelementptr inbounds i8* %y.1, i64 -1, !dbg !1645
  %553 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1646
  %554 = getelementptr inbounds %struct.MV* %553, i32 0, i32 0, !dbg !1646
  %555 = load i16* %554, align 2, !dbg !1646
  %556 = sext i16 %555 to i32, !dbg !1646
  %557 = and i32 %556, 7, !dbg !1646
  %558 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1647
  %559 = load i32* %558, align 4, !dbg !1647
  %560 = call i32 %551(i8* %552, i32 32, i32 6, i32 %557, i8* %7, i32 %559, i32* %sse), !dbg !1644
  call void @llvm.dbg.value(metadata i32 %560, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %561

; <label>:561                                     ; preds = %540, %518
  %thismse.3 = phi i32 [ %539, %518 ], [ %560, %540 ]
  br label %618, !dbg !1648

; <label>:562                                     ; preds = %498
  %563 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1649
  %564 = getelementptr inbounds %struct.MV* %563, i32 0, i32 0, !dbg !1649
  %565 = load i16* %564, align 2, !dbg !1649
  %566 = sext i16 %565 to i32, !dbg !1649
  %567 = sub nsw i32 %566, 8, !dbg !1649
  %568 = or i32 %567, 6, !dbg !1651
  %569 = trunc i32 %568 to i16, !dbg !1651
  %570 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1652
  %571 = getelementptr inbounds %struct.MV* %570, i32 0, i32 0, !dbg !1652
  store i16 %569, i16* %571, align 2, !dbg !1652
  %572 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1653
  %573 = getelementptr inbounds %struct.MV* %572, i32 0, i32 1, !dbg !1653
  %574 = load i16* %573, align 2, !dbg !1653
  %575 = sext i16 %574 to i32, !dbg !1653
  %576 = and i32 %575, 7, !dbg !1653
  %577 = icmp ne i32 %576, 0, !dbg !1655
  br i1 %577, label %578, label %598, !dbg !1655

; <label>:578                                     ; preds = %562
  %579 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1656
  %580 = getelementptr inbounds %struct.MV* %579, i32 0, i32 1, !dbg !1656
  %581 = load i16* %580, align 2, !dbg !1656
  %582 = sext i16 %581 to i32, !dbg !1656
  %583 = sub nsw i32 %582, 2, !dbg !1656
  %584 = trunc i32 %583 to i16, !dbg !1656
  store i16 %584, i16* %580, align 2, !dbg !1656
  %585 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1658
  %586 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %585, align 8, !dbg !1658
  %587 = sext i32 32 to i64, !dbg !1659
  %588 = sub i64 0, %587, !dbg !1659
  %589 = getelementptr inbounds i8* %y.1, i64 %588, !dbg !1659
  %590 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1660
  %591 = getelementptr inbounds %struct.MV* %590, i32 0, i32 1, !dbg !1660
  %592 = load i16* %591, align 2, !dbg !1660
  %593 = sext i16 %592 to i32, !dbg !1660
  %594 = and i32 %593, 7, !dbg !1660
  %595 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1661
  %596 = load i32* %595, align 4, !dbg !1661
  %597 = call i32 %586(i8* %589, i32 32, i32 %594, i32 6, i8* %7, i32 %596, i32* %sse), !dbg !1658
  call void @llvm.dbg.value(metadata i32 %597, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %617, !dbg !1662

; <label>:598                                     ; preds = %562
  %599 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1663
  %600 = getelementptr inbounds %struct.MV* %599, i32 0, i32 1, !dbg !1663
  %601 = load i16* %600, align 2, !dbg !1663
  %602 = sext i16 %601 to i32, !dbg !1663
  %603 = sub nsw i32 %602, 8, !dbg !1663
  %604 = or i32 %603, 6, !dbg !1665
  %605 = trunc i32 %604 to i16, !dbg !1665
  %606 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1666
  %607 = getelementptr inbounds %struct.MV* %606, i32 0, i32 1, !dbg !1666
  store i16 %605, i16* %607, align 2, !dbg !1666
  %608 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1667
  %609 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %608, align 8, !dbg !1667
  %610 = sext i32 32 to i64, !dbg !1668
  %611 = sub i64 0, %610, !dbg !1668
  %612 = getelementptr inbounds i8* %y.1, i64 %611, !dbg !1668
  %613 = getelementptr inbounds i8* %612, i64 -1, !dbg !1668
  %614 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1669
  %615 = load i32* %614, align 4, !dbg !1669
  %616 = call i32 %609(i8* %613, i32 32, i32 6, i32 6, i8* %7, i32 %615, i32* %sse), !dbg !1667
  call void @llvm.dbg.value(metadata i32 %616, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %617

; <label>:617                                     ; preds = %598, %578
  %thismse.4 = phi i32 [ %597, %578 ], [ %616, %598 ]
  br label %618

; <label>:618                                     ; preds = %617, %561
  %thismse.5 = phi i32 [ %thismse.3, %561 ], [ %thismse.4, %617 ]
  br label %763, !dbg !1670

; <label>:619                                     ; preds = %490
  %620 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1671
  %621 = getelementptr inbounds %struct.MV* %620, i32 0, i32 1, !dbg !1671
  %622 = load i16* %621, align 2, !dbg !1671
  %623 = sext i16 %622 to i32, !dbg !1671
  %624 = add nsw i32 %623, 2, !dbg !1671
  %625 = trunc i32 %624 to i16, !dbg !1671
  store i16 %625, i16* %621, align 2, !dbg !1671
  %626 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1672
  %627 = getelementptr inbounds %struct.MV* %626, i32 0, i32 0, !dbg !1672
  %628 = load i16* %627, align 2, !dbg !1672
  %629 = sext i16 %628 to i32, !dbg !1672
  %630 = and i32 %629, 7, !dbg !1672
  %631 = icmp ne i32 %630, 0, !dbg !1674
  br i1 %631, label %632, label %654, !dbg !1674

; <label>:632                                     ; preds = %619
  %633 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1675
  %634 = getelementptr inbounds %struct.MV* %633, i32 0, i32 0, !dbg !1675
  %635 = load i16* %634, align 2, !dbg !1675
  %636 = sext i16 %635 to i32, !dbg !1675
  %637 = sub nsw i32 %636, 2, !dbg !1675
  %638 = trunc i32 %637 to i16, !dbg !1675
  store i16 %638, i16* %634, align 2, !dbg !1675
  %639 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1677
  %640 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %639, align 8, !dbg !1677
  %641 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1678
  %642 = getelementptr inbounds %struct.MV* %641, i32 0, i32 1, !dbg !1678
  %643 = load i16* %642, align 2, !dbg !1678
  %644 = sext i16 %643 to i32, !dbg !1678
  %645 = and i32 %644, 7, !dbg !1678
  %646 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1679
  %647 = getelementptr inbounds %struct.MV* %646, i32 0, i32 0, !dbg !1679
  %648 = load i16* %647, align 2, !dbg !1679
  %649 = sext i16 %648 to i32, !dbg !1679
  %650 = and i32 %649, 7, !dbg !1679
  %651 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1680
  %652 = load i32* %651, align 4, !dbg !1680
  %653 = call i32 %640(i8* %y.1, i32 32, i32 %645, i32 %650, i8* %7, i32 %652, i32* %sse), !dbg !1677
  call void @llvm.dbg.value(metadata i32 %653, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %677, !dbg !1681

; <label>:654                                     ; preds = %619
  %655 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1682
  %656 = getelementptr inbounds %struct.MV* %655, i32 0, i32 0, !dbg !1682
  %657 = load i16* %656, align 2, !dbg !1682
  %658 = sext i16 %657 to i32, !dbg !1682
  %659 = sub nsw i32 %658, 8, !dbg !1682
  %660 = or i32 %659, 6, !dbg !1684
  %661 = trunc i32 %660 to i16, !dbg !1684
  %662 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1685
  %663 = getelementptr inbounds %struct.MV* %662, i32 0, i32 0, !dbg !1685
  store i16 %661, i16* %663, align 2, !dbg !1685
  %664 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1686
  %665 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %664, align 8, !dbg !1686
  %666 = sext i32 32 to i64, !dbg !1687
  %667 = sub i64 0, %666, !dbg !1687
  %668 = getelementptr inbounds i8* %y.1, i64 %667, !dbg !1687
  %669 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1688
  %670 = getelementptr inbounds %struct.MV* %669, i32 0, i32 1, !dbg !1688
  %671 = load i16* %670, align 2, !dbg !1688
  %672 = sext i16 %671 to i32, !dbg !1688
  %673 = and i32 %672, 7, !dbg !1688
  %674 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1689
  %675 = load i32* %674, align 4, !dbg !1689
  %676 = call i32 %665(i8* %668, i32 32, i32 %673, i32 6, i8* %7, i32 %675, i32* %sse), !dbg !1686
  call void @llvm.dbg.value(metadata i32 %676, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %677

; <label>:677                                     ; preds = %654, %632
  %thismse.6 = phi i32 [ %653, %632 ], [ %676, %654 ]
  br label %763, !dbg !1690

; <label>:678                                     ; preds = %490
  %679 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1691
  %680 = getelementptr inbounds %struct.MV* %679, i32 0, i32 0, !dbg !1691
  %681 = load i16* %680, align 2, !dbg !1691
  %682 = sext i16 %681 to i32, !dbg !1691
  %683 = add nsw i32 %682, 2, !dbg !1691
  %684 = trunc i32 %683 to i16, !dbg !1691
  store i16 %684, i16* %680, align 2, !dbg !1691
  %685 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1692
  %686 = getelementptr inbounds %struct.MV* %685, i32 0, i32 1, !dbg !1692
  %687 = load i16* %686, align 2, !dbg !1692
  %688 = sext i16 %687 to i32, !dbg !1692
  %689 = and i32 %688, 7, !dbg !1692
  %690 = icmp ne i32 %689, 0, !dbg !1694
  br i1 %690, label %691, label %713, !dbg !1694

; <label>:691                                     ; preds = %678
  %692 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1695
  %693 = getelementptr inbounds %struct.MV* %692, i32 0, i32 1, !dbg !1695
  %694 = load i16* %693, align 2, !dbg !1695
  %695 = sext i16 %694 to i32, !dbg !1695
  %696 = sub nsw i32 %695, 2, !dbg !1695
  %697 = trunc i32 %696 to i16, !dbg !1695
  store i16 %697, i16* %693, align 2, !dbg !1695
  %698 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1697
  %699 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %698, align 8, !dbg !1697
  %700 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1698
  %701 = getelementptr inbounds %struct.MV* %700, i32 0, i32 1, !dbg !1698
  %702 = load i16* %701, align 2, !dbg !1698
  %703 = sext i16 %702 to i32, !dbg !1698
  %704 = and i32 %703, 7, !dbg !1698
  %705 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1699
  %706 = getelementptr inbounds %struct.MV* %705, i32 0, i32 0, !dbg !1699
  %707 = load i16* %706, align 2, !dbg !1699
  %708 = sext i16 %707 to i32, !dbg !1699
  %709 = and i32 %708, 7, !dbg !1699
  %710 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1700
  %711 = load i32* %710, align 4, !dbg !1700
  %712 = call i32 %699(i8* %y.1, i32 32, i32 %704, i32 %709, i8* %7, i32 %711, i32* %sse), !dbg !1697
  call void @llvm.dbg.value(metadata i32 %712, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %734, !dbg !1701

; <label>:713                                     ; preds = %678
  %714 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1702
  %715 = getelementptr inbounds %struct.MV* %714, i32 0, i32 1, !dbg !1702
  %716 = load i16* %715, align 2, !dbg !1702
  %717 = sext i16 %716 to i32, !dbg !1702
  %718 = sub nsw i32 %717, 8, !dbg !1702
  %719 = or i32 %718, 6, !dbg !1704
  %720 = trunc i32 %719 to i16, !dbg !1704
  %721 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1705
  %722 = getelementptr inbounds %struct.MV* %721, i32 0, i32 1, !dbg !1705
  store i16 %720, i16* %722, align 2, !dbg !1705
  %723 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1706
  %724 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %723, align 8, !dbg !1706
  %725 = getelementptr inbounds i8* %y.1, i64 -1, !dbg !1707
  %726 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1708
  %727 = getelementptr inbounds %struct.MV* %726, i32 0, i32 0, !dbg !1708
  %728 = load i16* %727, align 2, !dbg !1708
  %729 = sext i16 %728 to i32, !dbg !1708
  %730 = and i32 %729, 7, !dbg !1708
  %731 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1709
  %732 = load i32* %731, align 4, !dbg !1709
  %733 = call i32 %724(i8* %725, i32 32, i32 6, i32 %730, i8* %7, i32 %732, i32* %sse), !dbg !1706
  call void @llvm.dbg.value(metadata i32 %733, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %734

; <label>:734                                     ; preds = %713, %691
  %thismse.7 = phi i32 [ %712, %691 ], [ %733, %713 ]
  br label %763, !dbg !1710

; <label>:735                                     ; preds = %490
  %736 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1711
  %737 = getelementptr inbounds %struct.MV* %736, i32 0, i32 1, !dbg !1711
  %738 = load i16* %737, align 2, !dbg !1711
  %739 = sext i16 %738 to i32, !dbg !1711
  %740 = add nsw i32 %739, 2, !dbg !1711
  %741 = trunc i32 %740 to i16, !dbg !1711
  store i16 %741, i16* %737, align 2, !dbg !1711
  %742 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1712
  %743 = getelementptr inbounds %struct.MV* %742, i32 0, i32 0, !dbg !1712
  %744 = load i16* %743, align 2, !dbg !1712
  %745 = sext i16 %744 to i32, !dbg !1712
  %746 = add nsw i32 %745, 2, !dbg !1712
  %747 = trunc i32 %746 to i16, !dbg !1712
  store i16 %747, i16* %743, align 2, !dbg !1712
  %748 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 2, !dbg !1713
  %749 = load i32 (i8*, i32, i32, i32, i8*, i32, i32*)** %748, align 8, !dbg !1713
  %750 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1714
  %751 = getelementptr inbounds %struct.MV* %750, i32 0, i32 1, !dbg !1714
  %752 = load i16* %751, align 2, !dbg !1714
  %753 = sext i16 %752 to i32, !dbg !1714
  %754 = and i32 %753, 7, !dbg !1714
  %755 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1715
  %756 = getelementptr inbounds %struct.MV* %755, i32 0, i32 0, !dbg !1715
  %757 = load i16* %756, align 2, !dbg !1715
  %758 = sext i16 %757 to i32, !dbg !1715
  %759 = and i32 %758, 7, !dbg !1715
  %760 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1716
  %761 = load i32* %760, align 4, !dbg !1716
  %762 = call i32 %749(i8* %y.1, i32 32, i32 %754, i32 %759, i8* %7, i32 %761, i32* %sse), !dbg !1713
  call void @llvm.dbg.value(metadata i32 %762, i64 0, metadata !1391, metadata !506), !dbg !1392
  br label %763, !dbg !1717

; <label>:763                                     ; preds = %735, %734, %677, %618, %490
  %thismse.8 = phi i32 [ %482, %490 ], [ %762, %735 ], [ %thismse.7, %734 ], [ %thismse.6, %677 ], [ %thismse.5, %618 ]
  %764 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1718
  %765 = add nsw i32 %thismse.8, %764, !dbg !1719
  call void @llvm.dbg.value(metadata i32 %765, i64 0, metadata !1501, metadata !506), !dbg !1502
  %766 = icmp slt i32 %765, %bestmse.8, !dbg !1720
  br i1 %766, label %767, label %771, !dbg !1722

; <label>:767                                     ; preds = %763
  %768 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1723
  %769 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1723
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %768, i8* %769, i64 4, i32 4, i1 false), !dbg !1723
  call void @llvm.dbg.value(metadata i32 %765, i64 0, metadata !1337, metadata !506), !dbg !1338
  store i32 %thismse.8, i32* %distortion, align 4, !dbg !1725
  %770 = load i32* %sse, align 4, !dbg !1726
  store i32 %770, i32* %sse1, align 4, !dbg !1727
  br label %771, !dbg !1728

; <label>:771                                     ; preds = %767, %763
  %bestmse.9 = phi i32 [ %765, %767 ], [ %bestmse.8, %763 ]
  ret i32 %bestmse.9, !dbg !1729
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define i32 @vp8_find_best_half_pixel_step(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32 %error_per_bit, %struct.variance_vtable* %vfp, i32** %mvcost, i32* %distortion, i32* %sse1) #0 {
  %startmv = alloca %union.int_mv, align 4
  %this_mv = alloca %union.int_mv, align 4
  %sse = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !1730, metadata !506), !dbg !1731
  call void @llvm.dbg.value(metadata %struct.block* %b, i64 0, metadata !1732, metadata !506), !dbg !1733
  call void @llvm.dbg.value(metadata %struct.blockd* %d, i64 0, metadata !1734, metadata !506), !dbg !1735
  call void @llvm.dbg.value(metadata %union.int_mv* %bestmv, i64 0, metadata !1736, metadata !506), !dbg !1737
  call void @llvm.dbg.value(metadata %union.int_mv* %ref_mv, i64 0, metadata !1738, metadata !506), !dbg !1739
  call void @llvm.dbg.value(metadata i32 %error_per_bit, i64 0, metadata !1740, metadata !506), !dbg !1741
  call void @llvm.dbg.value(metadata %struct.variance_vtable* %vfp, i64 0, metadata !1742, metadata !506), !dbg !1743
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !1744, metadata !506), !dbg !1745
  call void @llvm.dbg.value(metadata i32* %distortion, i64 0, metadata !1746, metadata !506), !dbg !1747
  call void @llvm.dbg.value(metadata i32* %sse1, i64 0, metadata !1748, metadata !506), !dbg !1749
  call void @llvm.dbg.value(metadata i32 2147483647, i64 0, metadata !1750, metadata !506), !dbg !1751
  call void @llvm.dbg.declare(metadata %union.int_mv* %startmv, metadata !1752, metadata !506), !dbg !1753
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !1754, metadata !506), !dbg !1755
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9, !dbg !1756
  %2 = load i8*** %1, align 8, !dbg !1756
  %3 = load i8** %2, align 8, !dbg !1757
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10, !dbg !1758
  %5 = load i32* %4, align 4, !dbg !1758
  %6 = sext i32 %5 to i64, !dbg !1757
  %7 = getelementptr inbounds i8* %3, i64 %6, !dbg !1757
  call void @llvm.dbg.value(metadata i8* %7, i64 0, metadata !1759, metadata !506), !dbg !1760
  call void @llvm.dbg.declare(metadata i32* %sse, metadata !1761, metadata !506), !dbg !1762
  %8 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !1763
  %9 = getelementptr inbounds %struct.macroblockd* %8, i32 0, i32 11, !dbg !1763
  %10 = getelementptr inbounds %struct.yv12_buffer_config* %9, i32 0, i32 4, !dbg !1763
  %11 = load i32* %10, align 4, !dbg !1763
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !1764, metadata !506), !dbg !1765
  %12 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !1766
  %13 = getelementptr inbounds %struct.macroblockd* %12, i32 0, i32 11, !dbg !1766
  %14 = getelementptr inbounds %struct.yv12_buffer_config* %13, i32 0, i32 13, !dbg !1766
  %15 = load i8** %14, align 8, !dbg !1766
  call void @llvm.dbg.value(metadata i8* %15, i64 0, metadata !1767, metadata !506), !dbg !1768
  %16 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !1769
  call void @llvm.dbg.value(metadata %struct.macroblockd* %16, i64 0, metadata !1770, metadata !506), !dbg !1771
  %17 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4, !dbg !1772
  %18 = load i32* %17, align 4, !dbg !1772
  %19 = sext i32 %18 to i64, !dbg !1773
  %20 = getelementptr inbounds i8* %15, i64 %19, !dbg !1773
  %21 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1774
  %22 = getelementptr inbounds %struct.MV* %21, i32 0, i32 0, !dbg !1774
  %23 = load i16* %22, align 2, !dbg !1774
  %24 = sext i16 %23 to i32, !dbg !1775
  %25 = mul nsw i32 %24, %11, !dbg !1775
  %26 = sext i32 %25 to i64, !dbg !1773
  %27 = getelementptr inbounds i8* %20, i64 %26, !dbg !1773
  %28 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1776
  %29 = getelementptr inbounds %struct.MV* %28, i32 0, i32 1, !dbg !1776
  %30 = load i16* %29, align 2, !dbg !1776
  %31 = sext i16 %30 to i32, !dbg !1776
  %32 = sext i32 %31 to i64, !dbg !1773
  %33 = getelementptr inbounds i8* %27, i64 %32, !dbg !1773
  call void @llvm.dbg.value(metadata i8* %33, i64 0, metadata !1777, metadata !506), !dbg !1778
  call void @llvm.dbg.value(metadata i32 32, i64 0, metadata !1779, metadata !506), !dbg !1780
  %34 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 9, !dbg !1781
  %35 = load void (i8*, i32, i8*, i32, i32)** %34, align 8, !dbg !1781
  %36 = getelementptr inbounds i8* %33, i64 -1, !dbg !1782
  %37 = sext i32 %11 to i64, !dbg !1782
  %38 = sub i64 0, %37, !dbg !1782
  %39 = getelementptr inbounds i8* %36, i64 %38, !dbg !1782
  %40 = getelementptr inbounds %struct.macroblockd* %16, i32 0, i32 46, !dbg !1783
  %41 = getelementptr inbounds [704 x i8]* %40, i32 0, i32 0, !dbg !1783
  call void %35(i8* %39, i32 %11, i8* %41, i32 32, i32 18), !dbg !1781
  %42 = getelementptr inbounds %struct.macroblockd* %16, i32 0, i32 46, !dbg !1784
  %43 = getelementptr inbounds [704 x i8]* %42, i32 0, i32 0, !dbg !1784
  %44 = sext i32 32 to i64, !dbg !1784
  %45 = getelementptr inbounds i8* %43, i64 %44, !dbg !1784
  %46 = getelementptr inbounds i8* %45, i64 1, !dbg !1784
  call void @llvm.dbg.value(metadata i8* %46, i64 0, metadata !1785, metadata !506), !dbg !1786
  %47 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1787
  %48 = getelementptr inbounds %struct.MV* %47, i32 0, i32 0, !dbg !1787
  %49 = load i16* %48, align 2, !dbg !1787
  %50 = sext i16 %49 to i32, !dbg !1787
  %51 = mul nsw i32 %50, 8, !dbg !1787
  %52 = trunc i32 %51 to i16, !dbg !1787
  store i16 %52, i16* %48, align 2, !dbg !1787
  %53 = bitcast %union.int_mv* %bestmv to %struct.MV*, !dbg !1788
  %54 = getelementptr inbounds %struct.MV* %53, i32 0, i32 1, !dbg !1788
  %55 = load i16* %54, align 2, !dbg !1788
  %56 = sext i16 %55 to i32, !dbg !1788
  %57 = mul nsw i32 %56, 8, !dbg !1788
  %58 = trunc i32 %57 to i16, !dbg !1788
  store i16 %58, i16* %54, align 2, !dbg !1788
  %59 = bitcast %union.int_mv* %startmv to i8*, !dbg !1789
  %60 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1789
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %59, i8* %60, i64 4, i32 4, i1 false), !dbg !1789
  %61 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 1, !dbg !1790
  %62 = load i32 (i8*, i32, i8*, i32, i32*)** %61, align 8, !dbg !1790
  %63 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1791
  %64 = load i32* %63, align 4, !dbg !1791
  %65 = call i32 %62(i8* %46, i32 32, i8* %7, i32 %64, i32* %sse1), !dbg !1790
  call void @llvm.dbg.value(metadata i32 %65, i64 0, metadata !1750, metadata !506), !dbg !1751
  store i32 %65, i32* %distortion, align 4, !dbg !1792
  %66 = call i32 @mv_err_cost(%union.int_mv* %bestmv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1793
  %67 = add nsw i32 %65, %66, !dbg !1794
  call void @llvm.dbg.value(metadata i32 %67, i64 0, metadata !1750, metadata !506), !dbg !1751
  %68 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1795
  %69 = getelementptr inbounds %struct.MV* %68, i32 0, i32 0, !dbg !1795
  %70 = load i16* %69, align 2, !dbg !1795
  %71 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1796
  %72 = getelementptr inbounds %struct.MV* %71, i32 0, i32 0, !dbg !1796
  store i16 %70, i16* %72, align 2, !dbg !1796
  %73 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1797
  %74 = getelementptr inbounds %struct.MV* %73, i32 0, i32 1, !dbg !1797
  %75 = load i16* %74, align 2, !dbg !1797
  %76 = sext i16 %75 to i32, !dbg !1797
  %77 = sub nsw i32 %76, 8, !dbg !1797
  %78 = or i32 %77, 4, !dbg !1798
  %79 = trunc i32 %78 to i16, !dbg !1799
  %80 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1800
  %81 = getelementptr inbounds %struct.MV* %80, i32 0, i32 1, !dbg !1800
  store i16 %79, i16* %81, align 2, !dbg !1800
  %82 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 3, !dbg !1801
  %83 = load i32 (i8*, i32, i8*, i32, i32*)** %82, align 8, !dbg !1801
  %84 = getelementptr inbounds i8* %46, i64 -1, !dbg !1802
  %85 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1803
  %86 = load i32* %85, align 4, !dbg !1803
  %87 = call i32 %83(i8* %84, i32 32, i8* %7, i32 %86, i32* %sse), !dbg !1801
  call void @llvm.dbg.value(metadata i32 %87, i64 0, metadata !1804, metadata !506), !dbg !1805
  %88 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1806
  %89 = add nsw i32 %87, %88, !dbg !1807
  call void @llvm.dbg.value(metadata i32 %89, i64 0, metadata !1808, metadata !506), !dbg !1809
  %90 = icmp slt i32 %89, %67, !dbg !1810
  br i1 %90, label %91, label %95, !dbg !1812

; <label>:91                                      ; preds = %0
  %92 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1813
  %93 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1813
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %92, i8* %93, i64 4, i32 4, i1 false), !dbg !1813
  call void @llvm.dbg.value(metadata i32 %89, i64 0, metadata !1750, metadata !506), !dbg !1751
  store i32 %87, i32* %distortion, align 4, !dbg !1815
  %94 = load i32* %sse, align 4, !dbg !1816
  store i32 %94, i32* %sse1, align 4, !dbg !1817
  br label %95, !dbg !1818

; <label>:95                                      ; preds = %91, %0
  %bestmse.0 = phi i32 [ %89, %91 ], [ %67, %0 ]
  %96 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1819
  %97 = getelementptr inbounds %struct.MV* %96, i32 0, i32 1, !dbg !1819
  %98 = load i16* %97, align 2, !dbg !1819
  %99 = sext i16 %98 to i32, !dbg !1819
  %100 = add nsw i32 %99, 8, !dbg !1819
  %101 = trunc i32 %100 to i16, !dbg !1819
  store i16 %101, i16* %97, align 2, !dbg !1819
  %102 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 3, !dbg !1820
  %103 = load i32 (i8*, i32, i8*, i32, i32*)** %102, align 8, !dbg !1820
  %104 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1821
  %105 = load i32* %104, align 4, !dbg !1821
  %106 = call i32 %103(i8* %46, i32 32, i8* %7, i32 %105, i32* %sse), !dbg !1820
  call void @llvm.dbg.value(metadata i32 %106, i64 0, metadata !1804, metadata !506), !dbg !1805
  %107 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1822
  %108 = add nsw i32 %106, %107, !dbg !1823
  call void @llvm.dbg.value(metadata i32 %108, i64 0, metadata !1824, metadata !506), !dbg !1825
  %109 = icmp slt i32 %108, %bestmse.0, !dbg !1826
  br i1 %109, label %110, label %114, !dbg !1828

; <label>:110                                     ; preds = %95
  %111 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1829
  %112 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1829
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %111, i8* %112, i64 4, i32 4, i1 false), !dbg !1829
  call void @llvm.dbg.value(metadata i32 %108, i64 0, metadata !1750, metadata !506), !dbg !1751
  store i32 %106, i32* %distortion, align 4, !dbg !1831
  %113 = load i32* %sse, align 4, !dbg !1832
  store i32 %113, i32* %sse1, align 4, !dbg !1833
  br label %114, !dbg !1834

; <label>:114                                     ; preds = %110, %95
  %bestmse.1 = phi i32 [ %108, %110 ], [ %bestmse.0, %95 ]
  %115 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1835
  %116 = getelementptr inbounds %struct.MV* %115, i32 0, i32 1, !dbg !1835
  %117 = load i16* %116, align 2, !dbg !1835
  %118 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1836
  %119 = getelementptr inbounds %struct.MV* %118, i32 0, i32 1, !dbg !1836
  store i16 %117, i16* %119, align 2, !dbg !1836
  %120 = bitcast %union.int_mv* %startmv to %struct.MV*, !dbg !1837
  %121 = getelementptr inbounds %struct.MV* %120, i32 0, i32 0, !dbg !1837
  %122 = load i16* %121, align 2, !dbg !1837
  %123 = sext i16 %122 to i32, !dbg !1837
  %124 = sub nsw i32 %123, 8, !dbg !1837
  %125 = or i32 %124, 4, !dbg !1838
  %126 = trunc i32 %125 to i16, !dbg !1839
  %127 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1840
  %128 = getelementptr inbounds %struct.MV* %127, i32 0, i32 0, !dbg !1840
  store i16 %126, i16* %128, align 2, !dbg !1840
  %129 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 4, !dbg !1841
  %130 = load i32 (i8*, i32, i8*, i32, i32*)** %129, align 8, !dbg !1841
  %131 = sext i32 32 to i64, !dbg !1842
  %132 = sub i64 0, %131, !dbg !1842
  %133 = getelementptr inbounds i8* %46, i64 %132, !dbg !1842
  %134 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1843
  %135 = load i32* %134, align 4, !dbg !1843
  %136 = call i32 %130(i8* %133, i32 32, i8* %7, i32 %135, i32* %sse), !dbg !1841
  call void @llvm.dbg.value(metadata i32 %136, i64 0, metadata !1804, metadata !506), !dbg !1805
  %137 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1844
  %138 = add nsw i32 %136, %137, !dbg !1845
  call void @llvm.dbg.value(metadata i32 %138, i64 0, metadata !1846, metadata !506), !dbg !1847
  %139 = icmp slt i32 %138, %bestmse.1, !dbg !1848
  br i1 %139, label %140, label %144, !dbg !1850

; <label>:140                                     ; preds = %114
  %141 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1851
  %142 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1851
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %141, i8* %142, i64 4, i32 4, i1 false), !dbg !1851
  call void @llvm.dbg.value(metadata i32 %138, i64 0, metadata !1750, metadata !506), !dbg !1751
  store i32 %136, i32* %distortion, align 4, !dbg !1853
  %143 = load i32* %sse, align 4, !dbg !1854
  store i32 %143, i32* %sse1, align 4, !dbg !1855
  br label %144, !dbg !1856

; <label>:144                                     ; preds = %140, %114
  %bestmse.2 = phi i32 [ %138, %140 ], [ %bestmse.1, %114 ]
  %145 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1857
  %146 = getelementptr inbounds %struct.MV* %145, i32 0, i32 0, !dbg !1857
  %147 = load i16* %146, align 2, !dbg !1857
  %148 = sext i16 %147 to i32, !dbg !1857
  %149 = add nsw i32 %148, 8, !dbg !1857
  %150 = trunc i32 %149 to i16, !dbg !1857
  store i16 %150, i16* %146, align 2, !dbg !1857
  %151 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 4, !dbg !1858
  %152 = load i32 (i8*, i32, i8*, i32, i32*)** %151, align 8, !dbg !1858
  %153 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1859
  %154 = load i32* %153, align 4, !dbg !1859
  %155 = call i32 %152(i8* %46, i32 32, i8* %7, i32 %154, i32* %sse), !dbg !1858
  call void @llvm.dbg.value(metadata i32 %155, i64 0, metadata !1804, metadata !506), !dbg !1805
  %156 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1860
  %157 = add nsw i32 %155, %156, !dbg !1861
  call void @llvm.dbg.value(metadata i32 %157, i64 0, metadata !1862, metadata !506), !dbg !1863
  %158 = icmp slt i32 %157, %bestmse.2, !dbg !1864
  br i1 %158, label %159, label %163, !dbg !1866

; <label>:159                                     ; preds = %144
  %160 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1867
  %161 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1867
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %160, i8* %161, i64 4, i32 4, i1 false), !dbg !1867
  call void @llvm.dbg.value(metadata i32 %157, i64 0, metadata !1750, metadata !506), !dbg !1751
  store i32 %155, i32* %distortion, align 4, !dbg !1869
  %162 = load i32* %sse, align 4, !dbg !1870
  store i32 %162, i32* %sse1, align 4, !dbg !1871
  br label %163, !dbg !1872

; <label>:163                                     ; preds = %159, %144
  %bestmse.3 = phi i32 [ %157, %159 ], [ %bestmse.2, %144 ]
  %164 = icmp slt i32 %89, %108, !dbg !1873
  %165 = select i1 %164, i32 0, i32 1, !dbg !1873
  %166 = icmp slt i32 %138, %157, !dbg !1874
  %167 = select i1 %166, i32 0, i32 2, !dbg !1874
  %168 = add nsw i32 %165, %167, !dbg !1875
  call void @llvm.dbg.value(metadata i32 %168, i64 0, metadata !1876, metadata !506), !dbg !1877
  %169 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1878
  %170 = bitcast %union.int_mv* %startmv to i8*, !dbg !1878
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %169, i8* %170, i64 4, i32 4, i1 false), !dbg !1878
  switch i32 %168, label %246 [
    i32 0, label %171
    i32 1, label %199
    i32 2, label %223
    i32 3, label %245
  ], !dbg !1879

; <label>:171                                     ; preds = %163
  %172 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1880
  %173 = getelementptr inbounds %struct.MV* %172, i32 0, i32 1, !dbg !1880
  %174 = load i16* %173, align 2, !dbg !1880
  %175 = sext i16 %174 to i32, !dbg !1880
  %176 = sub nsw i32 %175, 8, !dbg !1880
  %177 = or i32 %176, 4, !dbg !1882
  %178 = trunc i32 %177 to i16, !dbg !1882
  %179 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1883
  %180 = getelementptr inbounds %struct.MV* %179, i32 0, i32 1, !dbg !1883
  store i16 %178, i16* %180, align 2, !dbg !1883
  %181 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1884
  %182 = getelementptr inbounds %struct.MV* %181, i32 0, i32 0, !dbg !1884
  %183 = load i16* %182, align 2, !dbg !1884
  %184 = sext i16 %183 to i32, !dbg !1884
  %185 = sub nsw i32 %184, 8, !dbg !1884
  %186 = or i32 %185, 4, !dbg !1885
  %187 = trunc i32 %186 to i16, !dbg !1885
  %188 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1886
  %189 = getelementptr inbounds %struct.MV* %188, i32 0, i32 0, !dbg !1886
  store i16 %187, i16* %189, align 2, !dbg !1886
  %190 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5, !dbg !1887
  %191 = load i32 (i8*, i32, i8*, i32, i32*)** %190, align 8, !dbg !1887
  %192 = getelementptr inbounds i8* %46, i64 -1, !dbg !1888
  %193 = sext i32 32 to i64, !dbg !1888
  %194 = sub i64 0, %193, !dbg !1888
  %195 = getelementptr inbounds i8* %192, i64 %194, !dbg !1888
  %196 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1889
  %197 = load i32* %196, align 4, !dbg !1889
  %198 = call i32 %191(i8* %195, i32 32, i8* %7, i32 %197, i32* %sse), !dbg !1887
  call void @llvm.dbg.value(metadata i32 %198, i64 0, metadata !1804, metadata !506), !dbg !1805
  br label %264, !dbg !1890

; <label>:199                                     ; preds = %163
  %200 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1891
  %201 = getelementptr inbounds %struct.MV* %200, i32 0, i32 1, !dbg !1891
  %202 = load i16* %201, align 2, !dbg !1891
  %203 = sext i16 %202 to i32, !dbg !1891
  %204 = add nsw i32 %203, 4, !dbg !1891
  %205 = trunc i32 %204 to i16, !dbg !1891
  store i16 %205, i16* %201, align 2, !dbg !1891
  %206 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1892
  %207 = getelementptr inbounds %struct.MV* %206, i32 0, i32 0, !dbg !1892
  %208 = load i16* %207, align 2, !dbg !1892
  %209 = sext i16 %208 to i32, !dbg !1892
  %210 = sub nsw i32 %209, 8, !dbg !1892
  %211 = or i32 %210, 4, !dbg !1893
  %212 = trunc i32 %211 to i16, !dbg !1893
  %213 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1894
  %214 = getelementptr inbounds %struct.MV* %213, i32 0, i32 0, !dbg !1894
  store i16 %212, i16* %214, align 2, !dbg !1894
  %215 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5, !dbg !1895
  %216 = load i32 (i8*, i32, i8*, i32, i32*)** %215, align 8, !dbg !1895
  %217 = sext i32 32 to i64, !dbg !1896
  %218 = sub i64 0, %217, !dbg !1896
  %219 = getelementptr inbounds i8* %46, i64 %218, !dbg !1896
  %220 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1897
  %221 = load i32* %220, align 4, !dbg !1897
  %222 = call i32 %216(i8* %219, i32 32, i8* %7, i32 %221, i32* %sse), !dbg !1895
  call void @llvm.dbg.value(metadata i32 %222, i64 0, metadata !1804, metadata !506), !dbg !1805
  br label %264, !dbg !1898

; <label>:223                                     ; preds = %163
  %224 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1899
  %225 = getelementptr inbounds %struct.MV* %224, i32 0, i32 1, !dbg !1899
  %226 = load i16* %225, align 2, !dbg !1899
  %227 = sext i16 %226 to i32, !dbg !1899
  %228 = sub nsw i32 %227, 8, !dbg !1899
  %229 = or i32 %228, 4, !dbg !1900
  %230 = trunc i32 %229 to i16, !dbg !1900
  %231 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1901
  %232 = getelementptr inbounds %struct.MV* %231, i32 0, i32 1, !dbg !1901
  store i16 %230, i16* %232, align 2, !dbg !1901
  %233 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1902
  %234 = getelementptr inbounds %struct.MV* %233, i32 0, i32 0, !dbg !1902
  %235 = load i16* %234, align 2, !dbg !1902
  %236 = sext i16 %235 to i32, !dbg !1902
  %237 = add nsw i32 %236, 4, !dbg !1902
  %238 = trunc i32 %237 to i16, !dbg !1902
  store i16 %238, i16* %234, align 2, !dbg !1902
  %239 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5, !dbg !1903
  %240 = load i32 (i8*, i32, i8*, i32, i32*)** %239, align 8, !dbg !1903
  %241 = getelementptr inbounds i8* %46, i64 -1, !dbg !1904
  %242 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1905
  %243 = load i32* %242, align 4, !dbg !1905
  %244 = call i32 %240(i8* %241, i32 32, i8* %7, i32 %243, i32* %sse), !dbg !1903
  call void @llvm.dbg.value(metadata i32 %244, i64 0, metadata !1804, metadata !506), !dbg !1805
  br label %264, !dbg !1906

; <label>:245                                     ; preds = %163
  br label %246, !dbg !1906

; <label>:246                                     ; preds = %245, %163
  %247 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1907
  %248 = getelementptr inbounds %struct.MV* %247, i32 0, i32 1, !dbg !1907
  %249 = load i16* %248, align 2, !dbg !1907
  %250 = sext i16 %249 to i32, !dbg !1907
  %251 = add nsw i32 %250, 4, !dbg !1907
  %252 = trunc i32 %251 to i16, !dbg !1907
  store i16 %252, i16* %248, align 2, !dbg !1907
  %253 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !1908
  %254 = getelementptr inbounds %struct.MV* %253, i32 0, i32 0, !dbg !1908
  %255 = load i16* %254, align 2, !dbg !1908
  %256 = sext i16 %255 to i32, !dbg !1908
  %257 = add nsw i32 %256, 4, !dbg !1908
  %258 = trunc i32 %257 to i16, !dbg !1908
  store i16 %258, i16* %254, align 2, !dbg !1908
  %259 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 5, !dbg !1909
  %260 = load i32 (i8*, i32, i8*, i32, i32*)** %259, align 8, !dbg !1909
  %261 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1910
  %262 = load i32* %261, align 4, !dbg !1910
  %263 = call i32 %260(i8* %46, i32 32, i8* %7, i32 %262, i32* %sse), !dbg !1909
  call void @llvm.dbg.value(metadata i32 %263, i64 0, metadata !1804, metadata !506), !dbg !1805
  br label %264, !dbg !1911

; <label>:264                                     ; preds = %246, %223, %199, %171
  %thismse.0 = phi i32 [ %263, %246 ], [ %244, %223 ], [ %222, %199 ], [ %198, %171 ]
  %265 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %ref_mv, i32** %mvcost, i32 %error_per_bit), !dbg !1912
  %266 = add nsw i32 %thismse.0, %265, !dbg !1913
  call void @llvm.dbg.value(metadata i32 %266, i64 0, metadata !1914, metadata !506), !dbg !1915
  %267 = icmp slt i32 %266, %bestmse.3, !dbg !1916
  br i1 %267, label %268, label %272, !dbg !1918

; <label>:268                                     ; preds = %264
  %269 = bitcast %union.int_mv* %bestmv to i8*, !dbg !1919
  %270 = bitcast %union.int_mv* %this_mv to i8*, !dbg !1919
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %269, i8* %270, i64 4, i32 4, i1 false), !dbg !1919
  call void @llvm.dbg.value(metadata i32 %266, i64 0, metadata !1750, metadata !506), !dbg !1751
  store i32 %thismse.0, i32* %distortion, align 4, !dbg !1921
  %271 = load i32* %sse, align 4, !dbg !1922
  store i32 %271, i32* %sse1, align 4, !dbg !1923
  br label %272, !dbg !1924

; <label>:272                                     ; preds = %268, %264
  %bestmse.4 = phi i32 [ %266, %268 ], [ %bestmse.3, %264 ]
  ret i32 %bestmse.4, !dbg !1925
}

; Function Attrs: nounwind uwtable
define i32 @vp8_hex_search(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, %union.int_mv* %best_mv, i32 %search_param, i32 %sad_per_bit, %struct.variance_vtable* %vfp, i32** %mvsadcost, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %hex = alloca [6 x %struct.MV], align 16
  %neighbors = alloca [4 x %struct.MV], align 16
  %this_mv = alloca %union.int_mv, align 4
  %fcenter_mv = alloca %union.int_mv, align 4
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !1926, metadata !506), !dbg !1927
  call void @llvm.dbg.value(metadata %struct.block* %b, i64 0, metadata !1928, metadata !506), !dbg !1929
  call void @llvm.dbg.value(metadata %struct.blockd* %d, i64 0, metadata !1930, metadata !506), !dbg !1931
  call void @llvm.dbg.value(metadata %union.int_mv* %ref_mv, i64 0, metadata !1932, metadata !506), !dbg !1933
  call void @llvm.dbg.value(metadata %union.int_mv* %best_mv, i64 0, metadata !1934, metadata !506), !dbg !1935
  call void @llvm.dbg.value(metadata i32 %search_param, i64 0, metadata !1936, metadata !506), !dbg !1937
  call void @llvm.dbg.value(metadata i32 %sad_per_bit, i64 0, metadata !1938, metadata !506), !dbg !1939
  call void @llvm.dbg.value(metadata %struct.variance_vtable* %vfp, i64 0, metadata !1940, metadata !506), !dbg !1941
  call void @llvm.dbg.value(metadata i32** %mvsadcost, i64 0, metadata !1942, metadata !506), !dbg !1943
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !1944, metadata !506), !dbg !1945
  call void @llvm.dbg.value(metadata %union.int_mv* %center_mv, i64 0, metadata !1946, metadata !506), !dbg !1947
  call void @llvm.dbg.declare(metadata [6 x %struct.MV]* %hex, metadata !1948, metadata !506), !dbg !1951
  %1 = bitcast [6 x %struct.MV]* %hex to i8*, !dbg !1951
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([6 x %struct.MV]* @vp8_hex_search.hex to i8*), i64 24, i32 16, i1 false), !dbg !1951
  call void @llvm.dbg.declare(metadata [4 x %struct.MV]* %neighbors, metadata !1952, metadata !506), !dbg !1954
  %2 = bitcast [4 x %struct.MV]* %neighbors to i8*, !dbg !1954
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([4 x %struct.MV]* @vp8_hex_search.neighbors to i8*), i64 16, i32 16, i1 false), !dbg !1954
  %3 = getelementptr inbounds %struct.block* %b, i32 0, i32 9, !dbg !1955
  %4 = load i8*** %3, align 8, !dbg !1955
  %5 = load i8** %4, align 8, !dbg !1956
  %6 = getelementptr inbounds %struct.block* %b, i32 0, i32 10, !dbg !1957
  %7 = load i32* %6, align 4, !dbg !1957
  %8 = sext i32 %7 to i64, !dbg !1956
  %9 = getelementptr inbounds i8* %5, i64 %8, !dbg !1956
  call void @llvm.dbg.value(metadata i8* %9, i64 0, metadata !1958, metadata !506), !dbg !1959
  %10 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !1960
  %11 = load i32* %10, align 4, !dbg !1960
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !1961, metadata !506), !dbg !1962
  %12 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !1963
  %13 = getelementptr inbounds %struct.macroblockd* %12, i32 0, i32 11, !dbg !1963
  %14 = getelementptr inbounds %struct.yv12_buffer_config* %13, i32 0, i32 4, !dbg !1963
  %15 = load i32* %14, align 4, !dbg !1963
  call void @llvm.dbg.value(metadata i32 %15, i64 0, metadata !1964, metadata !506), !dbg !1965
  %16 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !1966
  %17 = getelementptr inbounds %struct.macroblockd* %16, i32 0, i32 11, !dbg !1966
  %18 = getelementptr inbounds %struct.yv12_buffer_config* %17, i32 0, i32 13, !dbg !1966
  %19 = load i8** %18, align 8, !dbg !1966
  call void @llvm.dbg.value(metadata i8* %19, i64 0, metadata !1967, metadata !506), !dbg !1968
  call void @llvm.dbg.value(metadata i32 %15, i64 0, metadata !1969, metadata !506), !dbg !1970
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !1971, metadata !506), !dbg !1972
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !1973, metadata !506), !dbg !1974
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !1975, metadata !506), !dbg !1976
  call void @llvm.dbg.value(metadata i32 127, i64 0, metadata !1977, metadata !506), !dbg !1978
  call void @llvm.dbg.value(metadata i32 8, i64 0, metadata !1979, metadata !506), !dbg !1980
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !1981, metadata !506), !dbg !1982
  %20 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !1983
  %21 = getelementptr inbounds %struct.MV* %20, i32 0, i32 0, !dbg !1983
  %22 = load i16* %21, align 2, !dbg !1983
  %23 = sext i16 %22 to i32, !dbg !1983
  %24 = ashr i32 %23, 3, !dbg !1983
  %25 = trunc i32 %24 to i16, !dbg !1983
  %26 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !1984
  %27 = getelementptr inbounds %struct.MV* %26, i32 0, i32 0, !dbg !1984
  store i16 %25, i16* %27, align 2, !dbg !1984
  %28 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !1985
  %29 = getelementptr inbounds %struct.MV* %28, i32 0, i32 1, !dbg !1985
  %30 = load i16* %29, align 2, !dbg !1985
  %31 = sext i16 %30 to i32, !dbg !1985
  %32 = ashr i32 %31, 3, !dbg !1985
  %33 = trunc i32 %32 to i16, !dbg !1985
  %34 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !1986
  %35 = getelementptr inbounds %struct.MV* %34, i32 0, i32 1, !dbg !1986
  store i16 %33, i16* %35, align 2, !dbg !1986
  %36 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !1987
  %37 = load i32* %36, align 4, !dbg !1987
  %38 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !1988
  %39 = load i32* %38, align 4, !dbg !1988
  %40 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !1989
  %41 = load i32* %40, align 4, !dbg !1989
  %42 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !1990
  %43 = load i32* %42, align 4, !dbg !1990
  call void @vp8_clamp_mv(%union.int_mv* %ref_mv, i32 %37, i32 %39, i32 %41, i32 %43), !dbg !1991
  %44 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !1992
  %45 = getelementptr inbounds %struct.MV* %44, i32 0, i32 0, !dbg !1992
  %46 = load i16* %45, align 2, !dbg !1992
  %47 = sext i16 %46 to i32, !dbg !1992
  call void @llvm.dbg.value(metadata i32 %47, i64 0, metadata !1993, metadata !506), !dbg !1994
  %48 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !1995
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1, !dbg !1995
  %50 = load i16* %49, align 2, !dbg !1995
  %51 = sext i16 %50 to i32, !dbg !1995
  call void @llvm.dbg.value(metadata i32 %51, i64 0, metadata !1996, metadata !506), !dbg !1997
  %52 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4, !dbg !1998
  %53 = load i32* %52, align 4, !dbg !1998
  %54 = sext i32 %53 to i64, !dbg !1999
  %55 = getelementptr inbounds i8* %19, i64 %54, !dbg !1999
  call void @llvm.dbg.value(metadata i8* %55, i64 0, metadata !2000, metadata !506), !dbg !2001
  %56 = mul nsw i32 %47, %15, !dbg !2002
  %57 = sext i32 %56 to i64, !dbg !2003
  %58 = getelementptr inbounds i8* %55, i64 %57, !dbg !2003
  %59 = sext i32 %51 to i64, !dbg !2003
  %60 = getelementptr inbounds i8* %58, i64 %59, !dbg !2003
  call void @llvm.dbg.value(metadata i8* %60, i64 0, metadata !2004, metadata !506), !dbg !2005
  %61 = trunc i32 %47 to i16, !dbg !2006
  %62 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2007
  %63 = getelementptr inbounds %struct.MV* %62, i32 0, i32 0, !dbg !2007
  store i16 %61, i16* %63, align 2, !dbg !2007
  %64 = trunc i32 %51 to i16, !dbg !2008
  %65 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2009
  %66 = getelementptr inbounds %struct.MV* %65, i32 0, i32 1, !dbg !2009
  store i16 %64, i16* %66, align 2, !dbg !2009
  %67 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0, !dbg !2010
  %68 = load i32 (i8*, i32, i8*, i32, i32)** %67, align 8, !dbg !2010
  %69 = call i32 %68(i8* %9, i32 %11, i8* %60, i32 %15, i32 -1), !dbg !2010
  %70 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit), !dbg !2011
  %71 = add i32 %69, %70, !dbg !2010
  call void @llvm.dbg.value(metadata i32 %71, i64 0, metadata !2012, metadata !506), !dbg !2013
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !2014, metadata !506), !dbg !2015
  %72 = sub nsw i32 %47, 2, !dbg !2016
  %73 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !2016
  %74 = load i32* %73, align 4, !dbg !2016
  %75 = icmp sge i32 %72, %74, !dbg !2016
  %76 = zext i1 %75 to i32, !dbg !2016
  %77 = and i32 1, %76, !dbg !2016
  call void @llvm.dbg.value(metadata i32 %77, i64 0, metadata !2014, metadata !506), !dbg !2015
  %78 = add nsw i32 %47, 2, !dbg !2016
  %79 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !2016
  %80 = load i32* %79, align 4, !dbg !2016
  %81 = icmp sle i32 %78, %80, !dbg !2016
  %82 = zext i1 %81 to i32, !dbg !2016
  %83 = and i32 %77, %82, !dbg !2016
  call void @llvm.dbg.value(metadata i32 %83, i64 0, metadata !2014, metadata !506), !dbg !2015
  %84 = sub nsw i32 %51, 2, !dbg !2016
  %85 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !2016
  %86 = load i32* %85, align 4, !dbg !2016
  %87 = icmp sge i32 %84, %86, !dbg !2016
  %88 = zext i1 %87 to i32, !dbg !2016
  %89 = and i32 %83, %88, !dbg !2016
  call void @llvm.dbg.value(metadata i32 %89, i64 0, metadata !2014, metadata !506), !dbg !2015
  %90 = add nsw i32 %51, 2, !dbg !2016
  %91 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !2016
  %92 = load i32* %91, align 4, !dbg !2016
  %93 = icmp sle i32 %90, %92, !dbg !2016
  %94 = zext i1 %93 to i32, !dbg !2016
  %95 = and i32 %89, %94, !dbg !2016
  call void @llvm.dbg.value(metadata i32 %95, i64 0, metadata !2014, metadata !506), !dbg !2015
  %96 = icmp ne i32 %95, 0, !dbg !2018
  br i1 %96, label %97, label %146, !dbg !2018

; <label>:97                                      ; preds = %0
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2019, metadata !506), !dbg !2020
  br label %98, !dbg !2021

; <label>:98                                      ; preds = %143, %97
  %i.0 = phi i32 [ 0, %97 ], [ %144, %143 ]
  %bestsad.0 = phi i32 [ %71, %97 ], [ %bestsad.2, %143 ]
  %best_site.0 = phi i32 [ -1, %97 ], [ %best_site.2, %143 ]
  %99 = icmp slt i32 %i.0, 6, !dbg !2025
  br i1 %99, label %100, label %145, !dbg !2029

; <label>:100                                     ; preds = %98
  %101 = sext i32 %i.0 to i64, !dbg !2030
  %102 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %101, !dbg !2030
  %103 = getelementptr inbounds %struct.MV* %102, i32 0, i32 0, !dbg !2030
  %104 = load i16* %103, align 2, !dbg !2030
  %105 = sext i16 %104 to i32, !dbg !2030
  %106 = add nsw i32 %47, %105, !dbg !2032
  %107 = trunc i32 %106 to i16, !dbg !2032
  %108 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2033
  %109 = getelementptr inbounds %struct.MV* %108, i32 0, i32 0, !dbg !2033
  store i16 %107, i16* %109, align 2, !dbg !2033
  %110 = sext i32 %i.0 to i64, !dbg !2034
  %111 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %110, !dbg !2034
  %112 = getelementptr inbounds %struct.MV* %111, i32 0, i32 1, !dbg !2034
  %113 = load i16* %112, align 2, !dbg !2034
  %114 = sext i16 %113 to i32, !dbg !2034
  %115 = add nsw i32 %51, %114, !dbg !2035
  %116 = trunc i32 %115 to i16, !dbg !2035
  %117 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2036
  %118 = getelementptr inbounds %struct.MV* %117, i32 0, i32 1, !dbg !2036
  store i16 %116, i16* %118, align 2, !dbg !2036
  %119 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2037
  %120 = getelementptr inbounds %struct.MV* %119, i32 0, i32 0, !dbg !2037
  %121 = load i16* %120, align 2, !dbg !2037
  %122 = sext i16 %121 to i32, !dbg !2037
  %123 = mul nsw i32 %122, %15, !dbg !2037
  %124 = sext i32 %123 to i64, !dbg !2038
  %125 = getelementptr inbounds i8* %55, i64 %124, !dbg !2038
  %126 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2039
  %127 = getelementptr inbounds %struct.MV* %126, i32 0, i32 1, !dbg !2039
  %128 = load i16* %127, align 2, !dbg !2039
  %129 = sext i16 %128 to i32, !dbg !2039
  %130 = sext i32 %129 to i64, !dbg !2038
  %131 = getelementptr inbounds i8* %125, i64 %130, !dbg !2038
  call void @llvm.dbg.value(metadata i8* %131, i64 0, metadata !2004, metadata !506), !dbg !2005
  %132 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0, !dbg !2040
  %133 = load i32 (i8*, i32, i8*, i32, i32)** %132, align 8, !dbg !2040
  %134 = call i32 %133(i8* %9, i32 %11, i8* %131, i32 %15, i32 %bestsad.0), !dbg !2040
  call void @llvm.dbg.value(metadata i32 %134, i64 0, metadata !2041, metadata !506), !dbg !2042
  %135 = icmp ult i32 %134, %bestsad.0, !dbg !2043
  br i1 %135, label %136, label %142, !dbg !2046

; <label>:136                                     ; preds = %100
  %137 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit), !dbg !2047
  %138 = add i32 %134, %137, !dbg !2047
  call void @llvm.dbg.value(metadata i32 %138, i64 0, metadata !2041, metadata !506), !dbg !2042
  %139 = icmp ult i32 %138, %bestsad.0, !dbg !2050
  br i1 %139, label %140, label %141, !dbg !2052

; <label>:140                                     ; preds = %136
  call void @llvm.dbg.value(metadata i32 %138, i64 0, metadata !2012, metadata !506), !dbg !2013
  call void @llvm.dbg.value(metadata i32 %i.0, i64 0, metadata !1975, metadata !506), !dbg !1976
  br label %141, !dbg !2053

; <label>:141                                     ; preds = %140, %136
  %bestsad.1 = phi i32 [ %138, %140 ], [ %bestsad.0, %136 ]
  %best_site.1 = phi i32 [ %i.0, %140 ], [ %best_site.0, %136 ]
  br label %142, !dbg !2056

; <label>:142                                     ; preds = %141, %100
  %bestsad.2 = phi i32 [ %bestsad.1, %141 ], [ %bestsad.0, %100 ]
  %best_site.2 = phi i32 [ %best_site.1, %141 ], [ %best_site.0, %100 ]
  br label %143, !dbg !2059

; <label>:143                                     ; preds = %142
  %144 = add nsw i32 %i.0, 1, !dbg !2060
  call void @llvm.dbg.value(metadata i32 %144, i64 0, metadata !2019, metadata !506), !dbg !2020
  br label %98, !dbg !2061

; <label>:145                                     ; preds = %98
  br label %231, !dbg !2062

; <label>:146                                     ; preds = %0
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2019, metadata !506), !dbg !2020
  br label %147, !dbg !2063

; <label>:147                                     ; preds = %228, %146
  %i.1 = phi i32 [ 0, %146 ], [ %229, %228 ]
  %bestsad.3 = phi i32 [ %71, %146 ], [ %bestsad.6, %228 ]
  %best_site.3 = phi i32 [ -1, %146 ], [ %best_site.6, %228 ]
  %148 = icmp slt i32 %i.1, 6, !dbg !2066
  br i1 %148, label %149, label %230, !dbg !2070

; <label>:149                                     ; preds = %147
  %150 = sext i32 %i.1 to i64, !dbg !2071
  %151 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %150, !dbg !2071
  %152 = getelementptr inbounds %struct.MV* %151, i32 0, i32 0, !dbg !2071
  %153 = load i16* %152, align 2, !dbg !2071
  %154 = sext i16 %153 to i32, !dbg !2071
  %155 = add nsw i32 %47, %154, !dbg !2073
  %156 = trunc i32 %155 to i16, !dbg !2073
  %157 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2074
  %158 = getelementptr inbounds %struct.MV* %157, i32 0, i32 0, !dbg !2074
  store i16 %156, i16* %158, align 2, !dbg !2074
  %159 = sext i32 %i.1 to i64, !dbg !2075
  %160 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %159, !dbg !2075
  %161 = getelementptr inbounds %struct.MV* %160, i32 0, i32 1, !dbg !2075
  %162 = load i16* %161, align 2, !dbg !2075
  %163 = sext i16 %162 to i32, !dbg !2075
  %164 = add nsw i32 %51, %163, !dbg !2076
  %165 = trunc i32 %164 to i16, !dbg !2076
  %166 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2077
  %167 = getelementptr inbounds %struct.MV* %166, i32 0, i32 1, !dbg !2077
  store i16 %165, i16* %167, align 2, !dbg !2077
  %168 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2078
  %169 = getelementptr inbounds %struct.MV* %168, i32 0, i32 1, !dbg !2078
  %170 = load i16* %169, align 2, !dbg !2078
  %171 = sext i16 %170 to i32, !dbg !2078
  %172 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !2078
  %173 = load i32* %172, align 4, !dbg !2078
  %174 = icmp slt i32 %171, %173, !dbg !2078
  br i1 %174, label %175, label %176, !dbg !2081

; <label>:175                                     ; preds = %149
  br label %228, !dbg !2082

; <label>:176                                     ; preds = %149
  %177 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2084
  %178 = getelementptr inbounds %struct.MV* %177, i32 0, i32 1, !dbg !2084
  %179 = load i16* %178, align 2, !dbg !2084
  %180 = sext i16 %179 to i32, !dbg !2084
  %181 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !2084
  %182 = load i32* %181, align 4, !dbg !2084
  %183 = icmp sgt i32 %180, %182, !dbg !2084
  br i1 %183, label %184, label %185, !dbg !2081

; <label>:184                                     ; preds = %176
  br label %228, !dbg !2087

; <label>:185                                     ; preds = %176
  %186 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2089
  %187 = getelementptr inbounds %struct.MV* %186, i32 0, i32 0, !dbg !2089
  %188 = load i16* %187, align 2, !dbg !2089
  %189 = sext i16 %188 to i32, !dbg !2089
  %190 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !2089
  %191 = load i32* %190, align 4, !dbg !2089
  %192 = icmp slt i32 %189, %191, !dbg !2089
  br i1 %192, label %193, label %194, !dbg !2081

; <label>:193                                     ; preds = %185
  br label %228, !dbg !2092

; <label>:194                                     ; preds = %185
  %195 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2094
  %196 = getelementptr inbounds %struct.MV* %195, i32 0, i32 0, !dbg !2094
  %197 = load i16* %196, align 2, !dbg !2094
  %198 = sext i16 %197 to i32, !dbg !2094
  %199 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !2094
  %200 = load i32* %199, align 4, !dbg !2094
  %201 = icmp sgt i32 %198, %200, !dbg !2094
  br i1 %201, label %202, label %203, !dbg !2081

; <label>:202                                     ; preds = %194
  br label %228, !dbg !2097

; <label>:203                                     ; preds = %194
  %204 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2099
  %205 = getelementptr inbounds %struct.MV* %204, i32 0, i32 0, !dbg !2099
  %206 = load i16* %205, align 2, !dbg !2099
  %207 = sext i16 %206 to i32, !dbg !2099
  %208 = mul nsw i32 %207, %15, !dbg !2099
  %209 = sext i32 %208 to i64, !dbg !2100
  %210 = getelementptr inbounds i8* %55, i64 %209, !dbg !2100
  %211 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2101
  %212 = getelementptr inbounds %struct.MV* %211, i32 0, i32 1, !dbg !2101
  %213 = load i16* %212, align 2, !dbg !2101
  %214 = sext i16 %213 to i32, !dbg !2101
  %215 = sext i32 %214 to i64, !dbg !2100
  %216 = getelementptr inbounds i8* %210, i64 %215, !dbg !2100
  call void @llvm.dbg.value(metadata i8* %216, i64 0, metadata !2004, metadata !506), !dbg !2005
  %217 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0, !dbg !2102
  %218 = load i32 (i8*, i32, i8*, i32, i32)** %217, align 8, !dbg !2102
  %219 = call i32 %218(i8* %9, i32 %11, i8* %216, i32 %15, i32 %bestsad.3), !dbg !2102
  call void @llvm.dbg.value(metadata i32 %219, i64 0, metadata !2041, metadata !506), !dbg !2042
  %220 = icmp ult i32 %219, %bestsad.3, !dbg !2103
  br i1 %220, label %221, label %227, !dbg !2106

; <label>:221                                     ; preds = %203
  %222 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit), !dbg !2107
  %223 = add i32 %219, %222, !dbg !2107
  call void @llvm.dbg.value(metadata i32 %223, i64 0, metadata !2041, metadata !506), !dbg !2042
  %224 = icmp ult i32 %223, %bestsad.3, !dbg !2110
  br i1 %224, label %225, label %226, !dbg !2112

; <label>:225                                     ; preds = %221
  call void @llvm.dbg.value(metadata i32 %223, i64 0, metadata !2012, metadata !506), !dbg !2013
  call void @llvm.dbg.value(metadata i32 %i.1, i64 0, metadata !1975, metadata !506), !dbg !1976
  br label %226, !dbg !2113

; <label>:226                                     ; preds = %225, %221
  %bestsad.4 = phi i32 [ %223, %225 ], [ %bestsad.3, %221 ]
  %best_site.4 = phi i32 [ %i.1, %225 ], [ %best_site.3, %221 ]
  br label %227, !dbg !2116

; <label>:227                                     ; preds = %226, %203
  %bestsad.5 = phi i32 [ %bestsad.4, %226 ], [ %bestsad.3, %203 ]
  %best_site.5 = phi i32 [ %best_site.4, %226 ], [ %best_site.3, %203 ]
  br label %228, !dbg !2119

; <label>:228                                     ; preds = %227, %202, %193, %184, %175
  %bestsad.6 = phi i32 [ %bestsad.3, %175 ], [ %bestsad.3, %184 ], [ %bestsad.3, %193 ], [ %bestsad.3, %202 ], [ %bestsad.5, %227 ]
  %best_site.6 = phi i32 [ %best_site.3, %175 ], [ %best_site.3, %184 ], [ %best_site.3, %193 ], [ %best_site.3, %202 ], [ %best_site.5, %227 ]
  %229 = add nsw i32 %i.1, 1, !dbg !2120
  call void @llvm.dbg.value(metadata i32 %229, i64 0, metadata !2019, metadata !506), !dbg !2020
  br label %147, !dbg !2121

; <label>:230                                     ; preds = %147
  br label %231

; <label>:231                                     ; preds = %230, %145
  %bestsad.7 = phi i32 [ %bestsad.0, %145 ], [ %bestsad.3, %230 ]
  %best_site.7 = phi i32 [ %best_site.0, %145 ], [ %best_site.3, %230 ]
  %232 = icmp eq i32 %best_site.7, -1, !dbg !2122
  br i1 %232, label %233, label %234, !dbg !2124

; <label>:233                                     ; preds = %231
  br label %453, !dbg !2125

; <label>:234                                     ; preds = %231
  %235 = sext i32 %best_site.7 to i64, !dbg !2126
  %236 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %235, !dbg !2126
  %237 = getelementptr inbounds %struct.MV* %236, i32 0, i32 0, !dbg !2126
  %238 = load i16* %237, align 2, !dbg !2126
  %239 = sext i16 %238 to i32, !dbg !2126
  %240 = add nsw i32 %47, %239, !dbg !2128
  call void @llvm.dbg.value(metadata i32 %240, i64 0, metadata !1993, metadata !506), !dbg !1994
  %241 = sext i32 %best_site.7 to i64, !dbg !2129
  %242 = getelementptr inbounds [6 x %struct.MV]* %hex, i32 0, i64 %241, !dbg !2129
  %243 = getelementptr inbounds %struct.MV* %242, i32 0, i32 1, !dbg !2129
  %244 = load i16* %243, align 2, !dbg !2129
  %245 = sext i16 %244 to i32, !dbg !2129
  %246 = add nsw i32 %51, %245, !dbg !2130
  call void @llvm.dbg.value(metadata i32 %246, i64 0, metadata !1996, metadata !506), !dbg !1997
  call void @llvm.dbg.value(metadata i32 %best_site.7, i64 0, metadata !1973, metadata !506), !dbg !1974
  br label %247

; <label>:247                                     ; preds = %234
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !2131, metadata !506), !dbg !2132
  br label %248, !dbg !2133

; <label>:248                                     ; preds = %450, %247
  %j.0 = phi i32 [ 1, %247 ], [ %451, %450 ]
  %br.0 = phi i32 [ %240, %247 ], [ %429, %450 ]
  %bc.0 = phi i32 [ %246, %247 ], [ %437, %450 ]
  %bestsad.8 = phi i32 [ %bestsad.7, %247 ], [ %bestsad.16, %450 ]
  %k.0 = phi i32 [ %best_site.7, %247 ], [ %k.2, %450 ]
  %249 = icmp slt i32 %j.0, 127, !dbg !2135
  br i1 %249, label %250, label %452, !dbg !2137

; <label>:250                                     ; preds = %248
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !1975, metadata !506), !dbg !1976
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !2014, metadata !506), !dbg !2015
  %251 = sub nsw i32 %br.0, 2, !dbg !2138
  %252 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !2138
  %253 = load i32* %252, align 4, !dbg !2138
  %254 = icmp sge i32 %251, %253, !dbg !2138
  %255 = zext i1 %254 to i32, !dbg !2138
  %256 = and i32 1, %255, !dbg !2138
  call void @llvm.dbg.value(metadata i32 %256, i64 0, metadata !2014, metadata !506), !dbg !2015
  %257 = add nsw i32 %br.0, 2, !dbg !2138
  %258 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !2138
  %259 = load i32* %258, align 4, !dbg !2138
  %260 = icmp sle i32 %257, %259, !dbg !2138
  %261 = zext i1 %260 to i32, !dbg !2138
  %262 = and i32 %256, %261, !dbg !2138
  call void @llvm.dbg.value(metadata i32 %262, i64 0, metadata !2014, metadata !506), !dbg !2015
  %263 = sub nsw i32 %bc.0, 2, !dbg !2138
  %264 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !2138
  %265 = load i32* %264, align 4, !dbg !2138
  %266 = icmp sge i32 %263, %265, !dbg !2138
  %267 = zext i1 %266 to i32, !dbg !2138
  %268 = and i32 %262, %267, !dbg !2138
  call void @llvm.dbg.value(metadata i32 %268, i64 0, metadata !2014, metadata !506), !dbg !2015
  %269 = add nsw i32 %bc.0, 2, !dbg !2138
  %270 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !2138
  %271 = load i32* %270, align 4, !dbg !2138
  %272 = icmp sle i32 %269, %271, !dbg !2138
  %273 = zext i1 %272 to i32, !dbg !2138
  %274 = and i32 %268, %273, !dbg !2138
  call void @llvm.dbg.value(metadata i32 %274, i64 0, metadata !2014, metadata !506), !dbg !2015
  %275 = icmp ne i32 %274, 0, !dbg !2141
  br i1 %275, label %276, label %329, !dbg !2141

; <label>:276                                     ; preds = %250
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2019, metadata !506), !dbg !2020
  br label %277, !dbg !2142

; <label>:277                                     ; preds = %326, %276
  %i.2 = phi i32 [ 0, %276 ], [ %327, %326 ]
  %bestsad.9 = phi i32 [ %bestsad.8, %276 ], [ %bestsad.11, %326 ]
  %best_site.8 = phi i32 [ -1, %276 ], [ %best_site.10, %326 ]
  %278 = icmp slt i32 %i.2, 3, !dbg !2146
  br i1 %278, label %279, label %328, !dbg !2150

; <label>:279                                     ; preds = %277
  %280 = sext i32 %i.2 to i64, !dbg !2151
  %281 = sext i32 %k.0 to i64, !dbg !2151
  %282 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %281, !dbg !2151
  %283 = getelementptr inbounds [3 x %struct.MV]* %282, i32 0, i64 %280, !dbg !2151
  %284 = getelementptr inbounds %struct.MV* %283, i32 0, i32 0, !dbg !2151
  %285 = load i16* %284, align 2, !dbg !2151
  %286 = sext i16 %285 to i32, !dbg !2151
  %287 = add nsw i32 %br.0, %286, !dbg !2153
  %288 = trunc i32 %287 to i16, !dbg !2153
  %289 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2154
  %290 = getelementptr inbounds %struct.MV* %289, i32 0, i32 0, !dbg !2154
  store i16 %288, i16* %290, align 2, !dbg !2154
  %291 = sext i32 %i.2 to i64, !dbg !2155
  %292 = sext i32 %k.0 to i64, !dbg !2155
  %293 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %292, !dbg !2155
  %294 = getelementptr inbounds [3 x %struct.MV]* %293, i32 0, i64 %291, !dbg !2155
  %295 = getelementptr inbounds %struct.MV* %294, i32 0, i32 1, !dbg !2155
  %296 = load i16* %295, align 2, !dbg !2155
  %297 = sext i16 %296 to i32, !dbg !2155
  %298 = add nsw i32 %bc.0, %297, !dbg !2156
  %299 = trunc i32 %298 to i16, !dbg !2156
  %300 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2157
  %301 = getelementptr inbounds %struct.MV* %300, i32 0, i32 1, !dbg !2157
  store i16 %299, i16* %301, align 2, !dbg !2157
  %302 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2158
  %303 = getelementptr inbounds %struct.MV* %302, i32 0, i32 0, !dbg !2158
  %304 = load i16* %303, align 2, !dbg !2158
  %305 = sext i16 %304 to i32, !dbg !2158
  %306 = mul nsw i32 %305, %15, !dbg !2158
  %307 = sext i32 %306 to i64, !dbg !2159
  %308 = getelementptr inbounds i8* %55, i64 %307, !dbg !2159
  %309 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2160
  %310 = getelementptr inbounds %struct.MV* %309, i32 0, i32 1, !dbg !2160
  %311 = load i16* %310, align 2, !dbg !2160
  %312 = sext i16 %311 to i32, !dbg !2160
  %313 = sext i32 %312 to i64, !dbg !2159
  %314 = getelementptr inbounds i8* %308, i64 %313, !dbg !2159
  call void @llvm.dbg.value(metadata i8* %314, i64 0, metadata !2004, metadata !506), !dbg !2005
  %315 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0, !dbg !2161
  %316 = load i32 (i8*, i32, i8*, i32, i32)** %315, align 8, !dbg !2161
  %317 = call i32 %316(i8* %9, i32 %11, i8* %314, i32 %15, i32 %bestsad.9), !dbg !2161
  call void @llvm.dbg.value(metadata i32 %317, i64 0, metadata !2041, metadata !506), !dbg !2042
  %318 = icmp ult i32 %317, %bestsad.9, !dbg !2162
  br i1 %318, label %319, label %325, !dbg !2165

; <label>:319                                     ; preds = %279
  %320 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit), !dbg !2166
  %321 = add i32 %317, %320, !dbg !2166
  call void @llvm.dbg.value(metadata i32 %321, i64 0, metadata !2041, metadata !506), !dbg !2042
  %322 = icmp ult i32 %321, %bestsad.9, !dbg !2169
  br i1 %322, label %323, label %324, !dbg !2171

; <label>:323                                     ; preds = %319
  call void @llvm.dbg.value(metadata i32 %321, i64 0, metadata !2012, metadata !506), !dbg !2013
  call void @llvm.dbg.value(metadata i32 %i.2, i64 0, metadata !1975, metadata !506), !dbg !1976
  br label %324, !dbg !2172

; <label>:324                                     ; preds = %323, %319
  %bestsad.10 = phi i32 [ %321, %323 ], [ %bestsad.9, %319 ]
  %best_site.9 = phi i32 [ %i.2, %323 ], [ %best_site.8, %319 ]
  br label %325, !dbg !2175

; <label>:325                                     ; preds = %324, %279
  %bestsad.11 = phi i32 [ %bestsad.10, %324 ], [ %bestsad.9, %279 ]
  %best_site.10 = phi i32 [ %best_site.9, %324 ], [ %best_site.8, %279 ]
  br label %326, !dbg !2178

; <label>:326                                     ; preds = %325
  %327 = add nsw i32 %i.2, 1, !dbg !2179
  call void @llvm.dbg.value(metadata i32 %327, i64 0, metadata !2019, metadata !506), !dbg !2020
  br label %277, !dbg !2180

; <label>:328                                     ; preds = %277
  br label %418, !dbg !2181

; <label>:329                                     ; preds = %250
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2019, metadata !506), !dbg !2020
  br label %330, !dbg !2182

; <label>:330                                     ; preds = %415, %329
  %i.3 = phi i32 [ 0, %329 ], [ %416, %415 ]
  %bestsad.12 = phi i32 [ %bestsad.8, %329 ], [ %bestsad.15, %415 ]
  %best_site.11 = phi i32 [ -1, %329 ], [ %best_site.14, %415 ]
  %331 = icmp slt i32 %i.3, 3, !dbg !2185
  br i1 %331, label %332, label %417, !dbg !2189

; <label>:332                                     ; preds = %330
  %333 = sext i32 %i.3 to i64, !dbg !2190
  %334 = sext i32 %k.0 to i64, !dbg !2190
  %335 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %334, !dbg !2190
  %336 = getelementptr inbounds [3 x %struct.MV]* %335, i32 0, i64 %333, !dbg !2190
  %337 = getelementptr inbounds %struct.MV* %336, i32 0, i32 0, !dbg !2190
  %338 = load i16* %337, align 2, !dbg !2190
  %339 = sext i16 %338 to i32, !dbg !2190
  %340 = add nsw i32 %br.0, %339, !dbg !2192
  %341 = trunc i32 %340 to i16, !dbg !2192
  %342 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2193
  %343 = getelementptr inbounds %struct.MV* %342, i32 0, i32 0, !dbg !2193
  store i16 %341, i16* %343, align 2, !dbg !2193
  %344 = sext i32 %i.3 to i64, !dbg !2194
  %345 = sext i32 %k.0 to i64, !dbg !2194
  %346 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %345, !dbg !2194
  %347 = getelementptr inbounds [3 x %struct.MV]* %346, i32 0, i64 %344, !dbg !2194
  %348 = getelementptr inbounds %struct.MV* %347, i32 0, i32 1, !dbg !2194
  %349 = load i16* %348, align 2, !dbg !2194
  %350 = sext i16 %349 to i32, !dbg !2194
  %351 = add nsw i32 %bc.0, %350, !dbg !2195
  %352 = trunc i32 %351 to i16, !dbg !2195
  %353 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2196
  %354 = getelementptr inbounds %struct.MV* %353, i32 0, i32 1, !dbg !2196
  store i16 %352, i16* %354, align 2, !dbg !2196
  %355 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2197
  %356 = getelementptr inbounds %struct.MV* %355, i32 0, i32 1, !dbg !2197
  %357 = load i16* %356, align 2, !dbg !2197
  %358 = sext i16 %357 to i32, !dbg !2197
  %359 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !2197
  %360 = load i32* %359, align 4, !dbg !2197
  %361 = icmp slt i32 %358, %360, !dbg !2197
  br i1 %361, label %362, label %363, !dbg !2200

; <label>:362                                     ; preds = %332
  br label %415, !dbg !2201

; <label>:363                                     ; preds = %332
  %364 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2203
  %365 = getelementptr inbounds %struct.MV* %364, i32 0, i32 1, !dbg !2203
  %366 = load i16* %365, align 2, !dbg !2203
  %367 = sext i16 %366 to i32, !dbg !2203
  %368 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !2203
  %369 = load i32* %368, align 4, !dbg !2203
  %370 = icmp sgt i32 %367, %369, !dbg !2203
  br i1 %370, label %371, label %372, !dbg !2200

; <label>:371                                     ; preds = %363
  br label %415, !dbg !2206

; <label>:372                                     ; preds = %363
  %373 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2208
  %374 = getelementptr inbounds %struct.MV* %373, i32 0, i32 0, !dbg !2208
  %375 = load i16* %374, align 2, !dbg !2208
  %376 = sext i16 %375 to i32, !dbg !2208
  %377 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !2208
  %378 = load i32* %377, align 4, !dbg !2208
  %379 = icmp slt i32 %376, %378, !dbg !2208
  br i1 %379, label %380, label %381, !dbg !2200

; <label>:380                                     ; preds = %372
  br label %415, !dbg !2211

; <label>:381                                     ; preds = %372
  %382 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2213
  %383 = getelementptr inbounds %struct.MV* %382, i32 0, i32 0, !dbg !2213
  %384 = load i16* %383, align 2, !dbg !2213
  %385 = sext i16 %384 to i32, !dbg !2213
  %386 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !2213
  %387 = load i32* %386, align 4, !dbg !2213
  %388 = icmp sgt i32 %385, %387, !dbg !2213
  br i1 %388, label %389, label %390, !dbg !2200

; <label>:389                                     ; preds = %381
  br label %415, !dbg !2216

; <label>:390                                     ; preds = %381
  %391 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2218
  %392 = getelementptr inbounds %struct.MV* %391, i32 0, i32 0, !dbg !2218
  %393 = load i16* %392, align 2, !dbg !2218
  %394 = sext i16 %393 to i32, !dbg !2218
  %395 = mul nsw i32 %394, %15, !dbg !2218
  %396 = sext i32 %395 to i64, !dbg !2219
  %397 = getelementptr inbounds i8* %55, i64 %396, !dbg !2219
  %398 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2220
  %399 = getelementptr inbounds %struct.MV* %398, i32 0, i32 1, !dbg !2220
  %400 = load i16* %399, align 2, !dbg !2220
  %401 = sext i16 %400 to i32, !dbg !2220
  %402 = sext i32 %401 to i64, !dbg !2219
  %403 = getelementptr inbounds i8* %397, i64 %402, !dbg !2219
  call void @llvm.dbg.value(metadata i8* %403, i64 0, metadata !2004, metadata !506), !dbg !2005
  %404 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0, !dbg !2221
  %405 = load i32 (i8*, i32, i8*, i32, i32)** %404, align 8, !dbg !2221
  %406 = call i32 %405(i8* %9, i32 %11, i8* %403, i32 %15, i32 %bestsad.12), !dbg !2221
  call void @llvm.dbg.value(metadata i32 %406, i64 0, metadata !2041, metadata !506), !dbg !2042
  %407 = icmp ult i32 %406, %bestsad.12, !dbg !2222
  br i1 %407, label %408, label %414, !dbg !2225

; <label>:408                                     ; preds = %390
  %409 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit), !dbg !2226
  %410 = add i32 %406, %409, !dbg !2226
  call void @llvm.dbg.value(metadata i32 %410, i64 0, metadata !2041, metadata !506), !dbg !2042
  %411 = icmp ult i32 %410, %bestsad.12, !dbg !2229
  br i1 %411, label %412, label %413, !dbg !2231

; <label>:412                                     ; preds = %408
  call void @llvm.dbg.value(metadata i32 %410, i64 0, metadata !2012, metadata !506), !dbg !2013
  call void @llvm.dbg.value(metadata i32 %i.3, i64 0, metadata !1975, metadata !506), !dbg !1976
  br label %413, !dbg !2232

; <label>:413                                     ; preds = %412, %408
  %bestsad.13 = phi i32 [ %410, %412 ], [ %bestsad.12, %408 ]
  %best_site.12 = phi i32 [ %i.3, %412 ], [ %best_site.11, %408 ]
  br label %414, !dbg !2235

; <label>:414                                     ; preds = %413, %390
  %bestsad.14 = phi i32 [ %bestsad.13, %413 ], [ %bestsad.12, %390 ]
  %best_site.13 = phi i32 [ %best_site.12, %413 ], [ %best_site.11, %390 ]
  br label %415, !dbg !2238

; <label>:415                                     ; preds = %414, %389, %380, %371, %362
  %bestsad.15 = phi i32 [ %bestsad.12, %362 ], [ %bestsad.12, %371 ], [ %bestsad.12, %380 ], [ %bestsad.12, %389 ], [ %bestsad.14, %414 ]
  %best_site.14 = phi i32 [ %best_site.11, %362 ], [ %best_site.11, %371 ], [ %best_site.11, %380 ], [ %best_site.11, %389 ], [ %best_site.13, %414 ]
  %416 = add nsw i32 %i.3, 1, !dbg !2239
  call void @llvm.dbg.value(metadata i32 %416, i64 0, metadata !2019, metadata !506), !dbg !2020
  br label %330, !dbg !2240

; <label>:417                                     ; preds = %330
  br label %418

; <label>:418                                     ; preds = %417, %328
  %bestsad.16 = phi i32 [ %bestsad.9, %328 ], [ %bestsad.12, %417 ]
  %best_site.15 = phi i32 [ %best_site.8, %328 ], [ %best_site.11, %417 ]
  %419 = icmp eq i32 %best_site.15, -1, !dbg !2241
  br i1 %419, label %420, label %421, !dbg !2243

; <label>:420                                     ; preds = %418
  br label %452, !dbg !2244

; <label>:421                                     ; preds = %418
  %422 = sext i32 %best_site.15 to i64, !dbg !2245
  %423 = sext i32 %k.0 to i64, !dbg !2245
  %424 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %423, !dbg !2245
  %425 = getelementptr inbounds [3 x %struct.MV]* %424, i32 0, i64 %422, !dbg !2245
  %426 = getelementptr inbounds %struct.MV* %425, i32 0, i32 0, !dbg !2245
  %427 = load i16* %426, align 2, !dbg !2245
  %428 = sext i16 %427 to i32, !dbg !2245
  %429 = add nsw i32 %br.0, %428, !dbg !2247
  call void @llvm.dbg.value(metadata i32 %429, i64 0, metadata !1993, metadata !506), !dbg !1994
  %430 = sext i32 %best_site.15 to i64, !dbg !2248
  %431 = sext i32 %k.0 to i64, !dbg !2248
  %432 = getelementptr inbounds [6 x [3 x %struct.MV]]* @next_chkpts, i32 0, i64 %431, !dbg !2248
  %433 = getelementptr inbounds [3 x %struct.MV]* %432, i32 0, i64 %430, !dbg !2248
  %434 = getelementptr inbounds %struct.MV* %433, i32 0, i32 1, !dbg !2248
  %435 = load i16* %434, align 2, !dbg !2248
  %436 = sext i16 %435 to i32, !dbg !2248
  %437 = add nsw i32 %bc.0, %436, !dbg !2249
  call void @llvm.dbg.value(metadata i32 %437, i64 0, metadata !1996, metadata !506), !dbg !1997
  %438 = add nsw i32 5, %best_site.15, !dbg !2250
  %439 = add nsw i32 %k.0, %438, !dbg !2251
  call void @llvm.dbg.value(metadata i32 %439, i64 0, metadata !1973, metadata !506), !dbg !1974
  %440 = icmp sge i32 %439, 12, !dbg !2252
  br i1 %440, label %441, label %443, !dbg !2254

; <label>:441                                     ; preds = %421
  %442 = sub nsw i32 %439, 12, !dbg !2255
  call void @llvm.dbg.value(metadata i32 %442, i64 0, metadata !1973, metadata !506), !dbg !1974
  br label %448, !dbg !2255

; <label>:443                                     ; preds = %421
  %444 = icmp sge i32 %439, 6, !dbg !2257
  br i1 %444, label %445, label %447, !dbg !2259

; <label>:445                                     ; preds = %443
  %446 = sub nsw i32 %439, 6, !dbg !2260
  call void @llvm.dbg.value(metadata i32 %446, i64 0, metadata !1973, metadata !506), !dbg !1974
  br label %447, !dbg !2260

; <label>:447                                     ; preds = %445, %443
  %k.1 = phi i32 [ %446, %445 ], [ %439, %443 ]
  br label %448

; <label>:448                                     ; preds = %447, %441
  %k.2 = phi i32 [ %442, %441 ], [ %k.1, %447 ]
  br label %449

; <label>:449                                     ; preds = %448
  br label %450, !dbg !2262

; <label>:450                                     ; preds = %449
  %451 = add nsw i32 %j.0, 1, !dbg !2263
  call void @llvm.dbg.value(metadata i32 %451, i64 0, metadata !2131, metadata !506), !dbg !2132
  br label %248, !dbg !2264

; <label>:452                                     ; preds = %420, %248
  %bestsad.17 = phi i32 [ %bestsad.16, %420 ], [ %bestsad.8, %248 ]
  br label %453, !dbg !2265

; <label>:453                                     ; preds = %452, %233
  %br.1 = phi i32 [ %47, %233 ], [ %br.0, %452 ]
  %bc.1 = phi i32 [ %51, %233 ], [ %bc.0, %452 ]
  %bestsad.18 = phi i32 [ %bestsad.7, %233 ], [ %bestsad.17, %452 ]
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2131, metadata !506), !dbg !2132
  br label %454, !dbg !2266

; <label>:454                                     ; preds = %633, %453
  %j.1 = phi i32 [ 0, %453 ], [ %634, %633 ]
  %br.2 = phi i32 [ %br.1, %453 ], [ %625, %633 ]
  %bc.2 = phi i32 [ %bc.1, %453 ], [ %631, %633 ]
  %bestsad.19 = phi i32 [ %bestsad.18, %453 ], [ %bestsad.27, %633 ]
  %455 = icmp slt i32 %j.1, 8, !dbg !2268
  br i1 %455, label %456, label %635, !dbg !2270

; <label>:456                                     ; preds = %454
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !1975, metadata !506), !dbg !1976
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !2014, metadata !506), !dbg !2015
  %457 = sub nsw i32 %br.2, 1, !dbg !2271
  %458 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !2271
  %459 = load i32* %458, align 4, !dbg !2271
  %460 = icmp sge i32 %457, %459, !dbg !2271
  %461 = zext i1 %460 to i32, !dbg !2271
  %462 = and i32 1, %461, !dbg !2271
  call void @llvm.dbg.value(metadata i32 %462, i64 0, metadata !2014, metadata !506), !dbg !2015
  %463 = add nsw i32 %br.2, 1, !dbg !2271
  %464 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !2271
  %465 = load i32* %464, align 4, !dbg !2271
  %466 = icmp sle i32 %463, %465, !dbg !2271
  %467 = zext i1 %466 to i32, !dbg !2271
  %468 = and i32 %462, %467, !dbg !2271
  call void @llvm.dbg.value(metadata i32 %468, i64 0, metadata !2014, metadata !506), !dbg !2015
  %469 = sub nsw i32 %bc.2, 1, !dbg !2271
  %470 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !2271
  %471 = load i32* %470, align 4, !dbg !2271
  %472 = icmp sge i32 %469, %471, !dbg !2271
  %473 = zext i1 %472 to i32, !dbg !2271
  %474 = and i32 %468, %473, !dbg !2271
  call void @llvm.dbg.value(metadata i32 %474, i64 0, metadata !2014, metadata !506), !dbg !2015
  %475 = add nsw i32 %bc.2, 1, !dbg !2271
  %476 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !2271
  %477 = load i32* %476, align 4, !dbg !2271
  %478 = icmp sle i32 %475, %477, !dbg !2271
  %479 = zext i1 %478 to i32, !dbg !2271
  %480 = and i32 %474, %479, !dbg !2271
  call void @llvm.dbg.value(metadata i32 %480, i64 0, metadata !2014, metadata !506), !dbg !2015
  %481 = icmp ne i32 %480, 0, !dbg !2274
  br i1 %481, label %482, label %531, !dbg !2274

; <label>:482                                     ; preds = %456
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2019, metadata !506), !dbg !2020
  br label %483, !dbg !2275

; <label>:483                                     ; preds = %528, %482
  %i.4 = phi i32 [ 0, %482 ], [ %529, %528 ]
  %bestsad.20 = phi i32 [ %bestsad.19, %482 ], [ %bestsad.22, %528 ]
  %best_site.16 = phi i32 [ -1, %482 ], [ %best_site.18, %528 ]
  %484 = icmp slt i32 %i.4, 4, !dbg !2279
  br i1 %484, label %485, label %530, !dbg !2283

; <label>:485                                     ; preds = %483
  %486 = sext i32 %i.4 to i64, !dbg !2284
  %487 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %486, !dbg !2284
  %488 = getelementptr inbounds %struct.MV* %487, i32 0, i32 0, !dbg !2284
  %489 = load i16* %488, align 2, !dbg !2284
  %490 = sext i16 %489 to i32, !dbg !2284
  %491 = add nsw i32 %br.2, %490, !dbg !2286
  %492 = trunc i32 %491 to i16, !dbg !2286
  %493 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2287
  %494 = getelementptr inbounds %struct.MV* %493, i32 0, i32 0, !dbg !2287
  store i16 %492, i16* %494, align 2, !dbg !2287
  %495 = sext i32 %i.4 to i64, !dbg !2288
  %496 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %495, !dbg !2288
  %497 = getelementptr inbounds %struct.MV* %496, i32 0, i32 1, !dbg !2288
  %498 = load i16* %497, align 2, !dbg !2288
  %499 = sext i16 %498 to i32, !dbg !2288
  %500 = add nsw i32 %bc.2, %499, !dbg !2289
  %501 = trunc i32 %500 to i16, !dbg !2289
  %502 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2290
  %503 = getelementptr inbounds %struct.MV* %502, i32 0, i32 1, !dbg !2290
  store i16 %501, i16* %503, align 2, !dbg !2290
  %504 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2291
  %505 = getelementptr inbounds %struct.MV* %504, i32 0, i32 0, !dbg !2291
  %506 = load i16* %505, align 2, !dbg !2291
  %507 = sext i16 %506 to i32, !dbg !2291
  %508 = mul nsw i32 %507, %15, !dbg !2291
  %509 = sext i32 %508 to i64, !dbg !2292
  %510 = getelementptr inbounds i8* %55, i64 %509, !dbg !2292
  %511 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2293
  %512 = getelementptr inbounds %struct.MV* %511, i32 0, i32 1, !dbg !2293
  %513 = load i16* %512, align 2, !dbg !2293
  %514 = sext i16 %513 to i32, !dbg !2293
  %515 = sext i32 %514 to i64, !dbg !2292
  %516 = getelementptr inbounds i8* %510, i64 %515, !dbg !2292
  call void @llvm.dbg.value(metadata i8* %516, i64 0, metadata !2004, metadata !506), !dbg !2005
  %517 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0, !dbg !2294
  %518 = load i32 (i8*, i32, i8*, i32, i32)** %517, align 8, !dbg !2294
  %519 = call i32 %518(i8* %9, i32 %11, i8* %516, i32 %15, i32 %bestsad.20), !dbg !2294
  call void @llvm.dbg.value(metadata i32 %519, i64 0, metadata !2041, metadata !506), !dbg !2042
  %520 = icmp ult i32 %519, %bestsad.20, !dbg !2295
  br i1 %520, label %521, label %527, !dbg !2298

; <label>:521                                     ; preds = %485
  %522 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit), !dbg !2299
  %523 = add i32 %519, %522, !dbg !2299
  call void @llvm.dbg.value(metadata i32 %523, i64 0, metadata !2041, metadata !506), !dbg !2042
  %524 = icmp ult i32 %523, %bestsad.20, !dbg !2302
  br i1 %524, label %525, label %526, !dbg !2304

; <label>:525                                     ; preds = %521
  call void @llvm.dbg.value(metadata i32 %523, i64 0, metadata !2012, metadata !506), !dbg !2013
  call void @llvm.dbg.value(metadata i32 %i.4, i64 0, metadata !1975, metadata !506), !dbg !1976
  br label %526, !dbg !2305

; <label>:526                                     ; preds = %525, %521
  %bestsad.21 = phi i32 [ %523, %525 ], [ %bestsad.20, %521 ]
  %best_site.17 = phi i32 [ %i.4, %525 ], [ %best_site.16, %521 ]
  br label %527, !dbg !2308

; <label>:527                                     ; preds = %526, %485
  %bestsad.22 = phi i32 [ %bestsad.21, %526 ], [ %bestsad.20, %485 ]
  %best_site.18 = phi i32 [ %best_site.17, %526 ], [ %best_site.16, %485 ]
  br label %528, !dbg !2311

; <label>:528                                     ; preds = %527
  %529 = add nsw i32 %i.4, 1, !dbg !2312
  call void @llvm.dbg.value(metadata i32 %529, i64 0, metadata !2019, metadata !506), !dbg !2020
  br label %483, !dbg !2313

; <label>:530                                     ; preds = %483
  br label %616, !dbg !2314

; <label>:531                                     ; preds = %456
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2019, metadata !506), !dbg !2020
  br label %532, !dbg !2315

; <label>:532                                     ; preds = %613, %531
  %i.5 = phi i32 [ 0, %531 ], [ %614, %613 ]
  %bestsad.23 = phi i32 [ %bestsad.19, %531 ], [ %bestsad.26, %613 ]
  %best_site.19 = phi i32 [ -1, %531 ], [ %best_site.22, %613 ]
  %533 = icmp slt i32 %i.5, 4, !dbg !2318
  br i1 %533, label %534, label %615, !dbg !2322

; <label>:534                                     ; preds = %532
  %535 = sext i32 %i.5 to i64, !dbg !2323
  %536 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %535, !dbg !2323
  %537 = getelementptr inbounds %struct.MV* %536, i32 0, i32 0, !dbg !2323
  %538 = load i16* %537, align 2, !dbg !2323
  %539 = sext i16 %538 to i32, !dbg !2323
  %540 = add nsw i32 %br.2, %539, !dbg !2325
  %541 = trunc i32 %540 to i16, !dbg !2325
  %542 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2326
  %543 = getelementptr inbounds %struct.MV* %542, i32 0, i32 0, !dbg !2326
  store i16 %541, i16* %543, align 2, !dbg !2326
  %544 = sext i32 %i.5 to i64, !dbg !2327
  %545 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %544, !dbg !2327
  %546 = getelementptr inbounds %struct.MV* %545, i32 0, i32 1, !dbg !2327
  %547 = load i16* %546, align 2, !dbg !2327
  %548 = sext i16 %547 to i32, !dbg !2327
  %549 = add nsw i32 %bc.2, %548, !dbg !2328
  %550 = trunc i32 %549 to i16, !dbg !2328
  %551 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2329
  %552 = getelementptr inbounds %struct.MV* %551, i32 0, i32 1, !dbg !2329
  store i16 %550, i16* %552, align 2, !dbg !2329
  %553 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2330
  %554 = getelementptr inbounds %struct.MV* %553, i32 0, i32 1, !dbg !2330
  %555 = load i16* %554, align 2, !dbg !2330
  %556 = sext i16 %555 to i32, !dbg !2330
  %557 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !2330
  %558 = load i32* %557, align 4, !dbg !2330
  %559 = icmp slt i32 %556, %558, !dbg !2330
  br i1 %559, label %560, label %561, !dbg !2333

; <label>:560                                     ; preds = %534
  br label %613, !dbg !2334

; <label>:561                                     ; preds = %534
  %562 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2336
  %563 = getelementptr inbounds %struct.MV* %562, i32 0, i32 1, !dbg !2336
  %564 = load i16* %563, align 2, !dbg !2336
  %565 = sext i16 %564 to i32, !dbg !2336
  %566 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !2336
  %567 = load i32* %566, align 4, !dbg !2336
  %568 = icmp sgt i32 %565, %567, !dbg !2336
  br i1 %568, label %569, label %570, !dbg !2333

; <label>:569                                     ; preds = %561
  br label %613, !dbg !2339

; <label>:570                                     ; preds = %561
  %571 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2341
  %572 = getelementptr inbounds %struct.MV* %571, i32 0, i32 0, !dbg !2341
  %573 = load i16* %572, align 2, !dbg !2341
  %574 = sext i16 %573 to i32, !dbg !2341
  %575 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !2341
  %576 = load i32* %575, align 4, !dbg !2341
  %577 = icmp slt i32 %574, %576, !dbg !2341
  br i1 %577, label %578, label %579, !dbg !2333

; <label>:578                                     ; preds = %570
  br label %613, !dbg !2344

; <label>:579                                     ; preds = %570
  %580 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2346
  %581 = getelementptr inbounds %struct.MV* %580, i32 0, i32 0, !dbg !2346
  %582 = load i16* %581, align 2, !dbg !2346
  %583 = sext i16 %582 to i32, !dbg !2346
  %584 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !2346
  %585 = load i32* %584, align 4, !dbg !2346
  %586 = icmp sgt i32 %583, %585, !dbg !2346
  br i1 %586, label %587, label %588, !dbg !2333

; <label>:587                                     ; preds = %579
  br label %613, !dbg !2349

; <label>:588                                     ; preds = %579
  %589 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2351
  %590 = getelementptr inbounds %struct.MV* %589, i32 0, i32 0, !dbg !2351
  %591 = load i16* %590, align 2, !dbg !2351
  %592 = sext i16 %591 to i32, !dbg !2351
  %593 = mul nsw i32 %592, %15, !dbg !2351
  %594 = sext i32 %593 to i64, !dbg !2352
  %595 = getelementptr inbounds i8* %55, i64 %594, !dbg !2352
  %596 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2353
  %597 = getelementptr inbounds %struct.MV* %596, i32 0, i32 1, !dbg !2353
  %598 = load i16* %597, align 2, !dbg !2353
  %599 = sext i16 %598 to i32, !dbg !2353
  %600 = sext i32 %599 to i64, !dbg !2352
  %601 = getelementptr inbounds i8* %595, i64 %600, !dbg !2352
  call void @llvm.dbg.value(metadata i8* %601, i64 0, metadata !2004, metadata !506), !dbg !2005
  %602 = getelementptr inbounds %struct.variance_vtable* %vfp, i32 0, i32 0, !dbg !2354
  %603 = load i32 (i8*, i32, i8*, i32, i32)** %602, align 8, !dbg !2354
  %604 = call i32 %603(i8* %9, i32 %11, i8* %601, i32 %15, i32 %bestsad.23), !dbg !2354
  call void @llvm.dbg.value(metadata i32 %604, i64 0, metadata !2041, metadata !506), !dbg !2042
  %605 = icmp ult i32 %604, %bestsad.23, !dbg !2355
  br i1 %605, label %606, label %612, !dbg !2358

; <label>:606                                     ; preds = %588
  %607 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %mvsadcost, i32 %sad_per_bit), !dbg !2359
  %608 = add i32 %604, %607, !dbg !2359
  call void @llvm.dbg.value(metadata i32 %608, i64 0, metadata !2041, metadata !506), !dbg !2042
  %609 = icmp ult i32 %608, %bestsad.23, !dbg !2362
  br i1 %609, label %610, label %611, !dbg !2364

; <label>:610                                     ; preds = %606
  call void @llvm.dbg.value(metadata i32 %608, i64 0, metadata !2012, metadata !506), !dbg !2013
  call void @llvm.dbg.value(metadata i32 %i.5, i64 0, metadata !1975, metadata !506), !dbg !1976
  br label %611, !dbg !2365

; <label>:611                                     ; preds = %610, %606
  %bestsad.24 = phi i32 [ %608, %610 ], [ %bestsad.23, %606 ]
  %best_site.20 = phi i32 [ %i.5, %610 ], [ %best_site.19, %606 ]
  br label %612, !dbg !2368

; <label>:612                                     ; preds = %611, %588
  %bestsad.25 = phi i32 [ %bestsad.24, %611 ], [ %bestsad.23, %588 ]
  %best_site.21 = phi i32 [ %best_site.20, %611 ], [ %best_site.19, %588 ]
  br label %613, !dbg !2371

; <label>:613                                     ; preds = %612, %587, %578, %569, %560
  %bestsad.26 = phi i32 [ %bestsad.23, %560 ], [ %bestsad.23, %569 ], [ %bestsad.23, %578 ], [ %bestsad.23, %587 ], [ %bestsad.25, %612 ]
  %best_site.22 = phi i32 [ %best_site.19, %560 ], [ %best_site.19, %569 ], [ %best_site.19, %578 ], [ %best_site.19, %587 ], [ %best_site.21, %612 ]
  %614 = add nsw i32 %i.5, 1, !dbg !2372
  call void @llvm.dbg.value(metadata i32 %614, i64 0, metadata !2019, metadata !506), !dbg !2020
  br label %532, !dbg !2373

; <label>:615                                     ; preds = %532
  br label %616

; <label>:616                                     ; preds = %615, %530
  %bestsad.27 = phi i32 [ %bestsad.20, %530 ], [ %bestsad.23, %615 ]
  %best_site.23 = phi i32 [ %best_site.16, %530 ], [ %best_site.19, %615 ]
  %617 = icmp eq i32 %best_site.23, -1, !dbg !2374
  br i1 %617, label %618, label %619, !dbg !2376

; <label>:618                                     ; preds = %616
  br label %635, !dbg !2377

; <label>:619                                     ; preds = %616
  %620 = sext i32 %best_site.23 to i64, !dbg !2378
  %621 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %620, !dbg !2378
  %622 = getelementptr inbounds %struct.MV* %621, i32 0, i32 0, !dbg !2378
  %623 = load i16* %622, align 2, !dbg !2378
  %624 = sext i16 %623 to i32, !dbg !2378
  %625 = add nsw i32 %br.2, %624, !dbg !2380
  call void @llvm.dbg.value(metadata i32 %625, i64 0, metadata !1993, metadata !506), !dbg !1994
  %626 = sext i32 %best_site.23 to i64, !dbg !2381
  %627 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %626, !dbg !2381
  %628 = getelementptr inbounds %struct.MV* %627, i32 0, i32 1, !dbg !2381
  %629 = load i16* %628, align 2, !dbg !2381
  %630 = sext i16 %629 to i32, !dbg !2381
  %631 = add nsw i32 %bc.2, %630, !dbg !2382
  call void @llvm.dbg.value(metadata i32 %631, i64 0, metadata !1996, metadata !506), !dbg !1997
  br label %632

; <label>:632                                     ; preds = %619
  br label %633, !dbg !2383

; <label>:633                                     ; preds = %632
  %634 = add nsw i32 %j.1, 1, !dbg !2384
  call void @llvm.dbg.value(metadata i32 %634, i64 0, metadata !2131, metadata !506), !dbg !2132
  br label %454, !dbg !2385

; <label>:635                                     ; preds = %618, %454
  %bestsad.28 = phi i32 [ %bestsad.27, %618 ], [ %bestsad.19, %454 ]
  %636 = trunc i32 %br.2 to i16, !dbg !2386
  %637 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2387
  %638 = getelementptr inbounds %struct.MV* %637, i32 0, i32 0, !dbg !2387
  store i16 %636, i16* %638, align 2, !dbg !2387
  %639 = trunc i32 %bc.2 to i16, !dbg !2388
  %640 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2389
  %641 = getelementptr inbounds %struct.MV* %640, i32 0, i32 1, !dbg !2389
  store i16 %639, i16* %641, align 2, !dbg !2389
  ret i32 %bestsad.28, !dbg !2390
}

; Function Attrs: nounwind uwtable
define internal void @vp8_clamp_mv(%union.int_mv* %mv, i32 %mb_to_left_edge, i32 %mb_to_right_edge, i32 %mb_to_top_edge, i32 %mb_to_bottom_edge) #0 {
  call void @llvm.dbg.value(metadata %union.int_mv* %mv, i64 0, metadata !2391, metadata !506), !dbg !2392
  call void @llvm.dbg.value(metadata i32 %mb_to_left_edge, i64 0, metadata !2393, metadata !506), !dbg !2394
  call void @llvm.dbg.value(metadata i32 %mb_to_right_edge, i64 0, metadata !2395, metadata !506), !dbg !2396
  call void @llvm.dbg.value(metadata i32 %mb_to_top_edge, i64 0, metadata !2397, metadata !506), !dbg !2398
  call void @llvm.dbg.value(metadata i32 %mb_to_bottom_edge, i64 0, metadata !2399, metadata !506), !dbg !2400
  %1 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2401
  %2 = getelementptr inbounds %struct.MV* %1, i32 0, i32 1, !dbg !2401
  %3 = load i16* %2, align 2, !dbg !2401
  %4 = sext i16 %3 to i32, !dbg !2401
  %5 = icmp slt i32 %4, %mb_to_left_edge, !dbg !2401
  br i1 %5, label %6, label %7, !dbg !2402

; <label>:6                                       ; preds = %0
  br label %12, !dbg !2402

; <label>:7                                       ; preds = %0
  %8 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2403
  %9 = getelementptr inbounds %struct.MV* %8, i32 0, i32 1, !dbg !2403
  %10 = load i16* %9, align 2, !dbg !2403
  %11 = sext i16 %10 to i32, !dbg !2403
  br label %12, !dbg !2402

; <label>:12                                      ; preds = %7, %6
  %13 = phi i32 [ %mb_to_left_edge, %6 ], [ %11, %7 ], !dbg !2402
  %14 = trunc i32 %13 to i16, !dbg !2404
  %15 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2407
  %16 = getelementptr inbounds %struct.MV* %15, i32 0, i32 1, !dbg !2407
  store i16 %14, i16* %16, align 2, !dbg !2407
  %17 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2408
  %18 = getelementptr inbounds %struct.MV* %17, i32 0, i32 1, !dbg !2408
  %19 = load i16* %18, align 2, !dbg !2408
  %20 = sext i16 %19 to i32, !dbg !2408
  %21 = icmp sgt i32 %20, %mb_to_right_edge, !dbg !2408
  br i1 %21, label %22, label %23, !dbg !2409

; <label>:22                                      ; preds = %12
  br label %28, !dbg !2409

; <label>:23                                      ; preds = %12
  %24 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2410
  %25 = getelementptr inbounds %struct.MV* %24, i32 0, i32 1, !dbg !2410
  %26 = load i16* %25, align 2, !dbg !2410
  %27 = sext i16 %26 to i32, !dbg !2410
  br label %28, !dbg !2409

; <label>:28                                      ; preds = %23, %22
  %29 = phi i32 [ %mb_to_right_edge, %22 ], [ %27, %23 ], !dbg !2409
  %30 = trunc i32 %29 to i16, !dbg !2411
  %31 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2412
  %32 = getelementptr inbounds %struct.MV* %31, i32 0, i32 1, !dbg !2412
  store i16 %30, i16* %32, align 2, !dbg !2412
  %33 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2413
  %34 = getelementptr inbounds %struct.MV* %33, i32 0, i32 0, !dbg !2413
  %35 = load i16* %34, align 2, !dbg !2413
  %36 = sext i16 %35 to i32, !dbg !2413
  %37 = icmp slt i32 %36, %mb_to_top_edge, !dbg !2413
  br i1 %37, label %38, label %39, !dbg !2414

; <label>:38                                      ; preds = %28
  br label %44, !dbg !2414

; <label>:39                                      ; preds = %28
  %40 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2415
  %41 = getelementptr inbounds %struct.MV* %40, i32 0, i32 0, !dbg !2415
  %42 = load i16* %41, align 2, !dbg !2415
  %43 = sext i16 %42 to i32, !dbg !2415
  br label %44, !dbg !2414

; <label>:44                                      ; preds = %39, %38
  %45 = phi i32 [ %mb_to_top_edge, %38 ], [ %43, %39 ], !dbg !2414
  %46 = trunc i32 %45 to i16, !dbg !2416
  %47 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2417
  %48 = getelementptr inbounds %struct.MV* %47, i32 0, i32 0, !dbg !2417
  store i16 %46, i16* %48, align 2, !dbg !2417
  %49 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2418
  %50 = getelementptr inbounds %struct.MV* %49, i32 0, i32 0, !dbg !2418
  %51 = load i16* %50, align 2, !dbg !2418
  %52 = sext i16 %51 to i32, !dbg !2418
  %53 = icmp sgt i32 %52, %mb_to_bottom_edge, !dbg !2418
  br i1 %53, label %54, label %55, !dbg !2419

; <label>:54                                      ; preds = %44
  br label %60, !dbg !2419

; <label>:55                                      ; preds = %44
  %56 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2420
  %57 = getelementptr inbounds %struct.MV* %56, i32 0, i32 0, !dbg !2420
  %58 = load i16* %57, align 2, !dbg !2420
  %59 = sext i16 %58 to i32, !dbg !2420
  br label %60, !dbg !2419

; <label>:60                                      ; preds = %55, %54
  %61 = phi i32 [ %mb_to_bottom_edge, %54 ], [ %59, %55 ], !dbg !2419
  %62 = trunc i32 %61 to i16, !dbg !2421
  %63 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2422
  %64 = getelementptr inbounds %struct.MV* %63, i32 0, i32 0, !dbg !2422
  store i16 %62, i16* %64, align 2, !dbg !2422
  ret void, !dbg !2423
}

; Function Attrs: nounwind uwtable
define internal i32 @mvsad_err_cost(%union.int_mv* %mv, %union.int_mv* %ref, i32** %mvsadcost, i32 %error_per_bit) #0 {
  call void @llvm.dbg.value(metadata %union.int_mv* %mv, i64 0, metadata !2424, metadata !506), !dbg !2425
  call void @llvm.dbg.value(metadata %union.int_mv* %ref, i64 0, metadata !2426, metadata !506), !dbg !2427
  call void @llvm.dbg.value(metadata i32** %mvsadcost, i64 0, metadata !2428, metadata !506), !dbg !2429
  call void @llvm.dbg.value(metadata i32 %error_per_bit, i64 0, metadata !2430, metadata !506), !dbg !2431
  %1 = icmp ne i32** %mvsadcost, null, !dbg !2432
  br i1 %1, label %2, label %35, !dbg !2432

; <label>:2                                       ; preds = %0
  %3 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2433
  %4 = getelementptr inbounds %struct.MV* %3, i32 0, i32 0, !dbg !2433
  %5 = load i16* %4, align 2, !dbg !2433
  %6 = sext i16 %5 to i32, !dbg !2433
  %7 = bitcast %union.int_mv* %ref to %struct.MV*, !dbg !2435
  %8 = getelementptr inbounds %struct.MV* %7, i32 0, i32 0, !dbg !2435
  %9 = load i16* %8, align 2, !dbg !2435
  %10 = sext i16 %9 to i32, !dbg !2435
  %11 = sub nsw i32 %6, %10, !dbg !2433
  %12 = sext i32 %11 to i64, !dbg !2436
  %13 = getelementptr inbounds i32** %mvsadcost, i64 0, !dbg !2436
  %14 = load i32** %13, align 8, !dbg !2436
  %15 = getelementptr inbounds i32* %14, i64 %12, !dbg !2436
  %16 = load i32* %15, align 4, !dbg !2436
  %17 = bitcast %union.int_mv* %mv to %struct.MV*, !dbg !2437
  %18 = getelementptr inbounds %struct.MV* %17, i32 0, i32 1, !dbg !2437
  %19 = load i16* %18, align 2, !dbg !2437
  %20 = sext i16 %19 to i32, !dbg !2437
  %21 = bitcast %union.int_mv* %ref to %struct.MV*, !dbg !2438
  %22 = getelementptr inbounds %struct.MV* %21, i32 0, i32 1, !dbg !2438
  %23 = load i16* %22, align 2, !dbg !2438
  %24 = sext i16 %23 to i32, !dbg !2438
  %25 = sub nsw i32 %20, %24, !dbg !2437
  %26 = sext i32 %25 to i64, !dbg !2439
  %27 = getelementptr inbounds i32** %mvsadcost, i64 1, !dbg !2439
  %28 = load i32** %27, align 8, !dbg !2439
  %29 = getelementptr inbounds i32* %28, i64 %26, !dbg !2439
  %30 = load i32* %29, align 4, !dbg !2439
  %31 = add nsw i32 %16, %30, !dbg !2436
  %32 = mul nsw i32 %31, %error_per_bit, !dbg !2440
  %33 = add nsw i32 %32, 128, !dbg !2440
  %34 = ashr i32 %33, 8, !dbg !2441
  br label %36, !dbg !2442

; <label>:35                                      ; preds = %0
  br label %36, !dbg !2443

; <label>:36                                      ; preds = %35, %2
  %.0 = phi i32 [ %34, %2 ], [ 0, %35 ]
  ret i32 %.0, !dbg !2444
}

; Function Attrs: nounwind uwtable
define i32 @vp8_diamond_search_sad_c(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, %union.int_mv* %best_mv, i32 %search_param, i32 %sad_per_bit, i32* %num00, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !2445, metadata !506), !dbg !2446
  call void @llvm.dbg.value(metadata %struct.block* %b, i64 0, metadata !2447, metadata !506), !dbg !2448
  call void @llvm.dbg.value(metadata %struct.blockd* %d, i64 0, metadata !2449, metadata !506), !dbg !2450
  call void @llvm.dbg.value(metadata %union.int_mv* %ref_mv, i64 0, metadata !2451, metadata !506), !dbg !2452
  call void @llvm.dbg.value(metadata %union.int_mv* %best_mv, i64 0, metadata !2453, metadata !506), !dbg !2454
  call void @llvm.dbg.value(metadata i32 %search_param, i64 0, metadata !2455, metadata !506), !dbg !2456
  call void @llvm.dbg.value(metadata i32 %sad_per_bit, i64 0, metadata !2457, metadata !506), !dbg !2458
  call void @llvm.dbg.value(metadata i32* %num00, i64 0, metadata !2459, metadata !506), !dbg !2460
  call void @llvm.dbg.value(metadata %struct.variance_vtable* %fn_ptr, i64 0, metadata !2461, metadata !506), !dbg !2462
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !2463, metadata !506), !dbg !2464
  call void @llvm.dbg.value(metadata %union.int_mv* %center_mv, i64 0, metadata !2465, metadata !506), !dbg !2466
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9, !dbg !2467
  %2 = load i8*** %1, align 8, !dbg !2467
  %3 = load i8** %2, align 8, !dbg !2468
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10, !dbg !2469
  %5 = load i32* %4, align 4, !dbg !2469
  %6 = sext i32 %5 to i64, !dbg !2468
  %7 = getelementptr inbounds i8* %3, i64 %6, !dbg !2468
  call void @llvm.dbg.value(metadata i8* %7, i64 0, metadata !2470, metadata !506), !dbg !2471
  %8 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !2472
  %9 = load i32* %8, align 4, !dbg !2472
  call void @llvm.dbg.value(metadata i32 %9, i64 0, metadata !2473, metadata !506), !dbg !2474
  %10 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !2475
  %11 = getelementptr inbounds %struct.macroblockd* %10, i32 0, i32 11, !dbg !2475
  %12 = getelementptr inbounds %struct.yv12_buffer_config* %11, i32 0, i32 4, !dbg !2475
  %13 = load i32* %12, align 4, !dbg !2475
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !2476, metadata !506), !dbg !2477
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !2478
  %15 = getelementptr inbounds %struct.macroblockd* %14, i32 0, i32 11, !dbg !2478
  %16 = getelementptr inbounds %struct.yv12_buffer_config* %15, i32 0, i32 13, !dbg !2478
  %17 = load i8** %16, align 8, !dbg !2478
  call void @llvm.dbg.value(metadata i8* %17, i64 0, metadata !2479, metadata !506), !dbg !2480
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !2481, metadata !506), !dbg !2482
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !2483, metadata !506), !dbg !2484
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !2485, metadata !506), !dbg !2486
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2487, metadata !506), !dbg !2488
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2489, metadata !506), !dbg !2490
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !2491, metadata !506), !dbg !2492
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !2493, metadata !506), !dbg !2494
  %18 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !2495
  %19 = getelementptr inbounds [2 x i32*]* %18, i32 0, i64 0, !dbg !2495
  %20 = load i32** %19, align 8, !dbg !2495
  %21 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !2496
  store i32* %20, i32** %21, align 8, !dbg !2496
  %22 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !2497
  %23 = getelementptr inbounds [2 x i32*]* %22, i32 0, i64 1, !dbg !2497
  %24 = load i32** %23, align 8, !dbg !2497
  %25 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !2498
  store i32* %24, i32** %25, align 8, !dbg !2498
  %26 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !2499
  %27 = getelementptr inbounds %struct.MV* %26, i32 0, i32 0, !dbg !2499
  %28 = load i16* %27, align 2, !dbg !2499
  %29 = sext i16 %28 to i32, !dbg !2499
  %30 = ashr i32 %29, 3, !dbg !2499
  %31 = trunc i32 %30 to i16, !dbg !2499
  %32 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !2500
  %33 = getelementptr inbounds %struct.MV* %32, i32 0, i32 0, !dbg !2500
  store i16 %31, i16* %33, align 2, !dbg !2500
  %34 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !2501
  %35 = getelementptr inbounds %struct.MV* %34, i32 0, i32 1, !dbg !2501
  %36 = load i16* %35, align 2, !dbg !2501
  %37 = sext i16 %36 to i32, !dbg !2501
  %38 = ashr i32 %37, 3, !dbg !2501
  %39 = trunc i32 %38 to i16, !dbg !2501
  %40 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !2502
  %41 = getelementptr inbounds %struct.MV* %40, i32 0, i32 1, !dbg !2502
  store i16 %39, i16* %41, align 2, !dbg !2502
  %42 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !2503
  %43 = load i32* %42, align 4, !dbg !2503
  %44 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !2504
  %45 = load i32* %44, align 4, !dbg !2504
  %46 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !2505
  %47 = load i32* %46, align 4, !dbg !2505
  %48 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !2506
  %49 = load i32* %48, align 4, !dbg !2506
  call void @vp8_clamp_mv(%union.int_mv* %ref_mv, i32 %43, i32 %45, i32 %47, i32 %49), !dbg !2507
  %50 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !2508
  %51 = getelementptr inbounds %struct.MV* %50, i32 0, i32 0, !dbg !2508
  %52 = load i16* %51, align 2, !dbg !2508
  %53 = sext i16 %52 to i32, !dbg !2508
  call void @llvm.dbg.value(metadata i32 %53, i64 0, metadata !2509, metadata !506), !dbg !2510
  %54 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !2511
  %55 = getelementptr inbounds %struct.MV* %54, i32 0, i32 1, !dbg !2511
  %56 = load i16* %55, align 2, !dbg !2511
  %57 = sext i16 %56 to i32, !dbg !2511
  call void @llvm.dbg.value(metadata i32 %57, i64 0, metadata !2512, metadata !506), !dbg !2513
  store i32 0, i32* %num00, align 4, !dbg !2514
  %58 = trunc i32 %53 to i16, !dbg !2515
  %59 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2516
  %60 = getelementptr inbounds %struct.MV* %59, i32 0, i32 0, !dbg !2516
  store i16 %58, i16* %60, align 2, !dbg !2516
  %61 = trunc i32 %57 to i16, !dbg !2517
  %62 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2518
  %63 = getelementptr inbounds %struct.MV* %62, i32 0, i32 1, !dbg !2518
  store i16 %61, i16* %63, align 2, !dbg !2518
  %64 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4, !dbg !2519
  %65 = load i32* %64, align 4, !dbg !2519
  %66 = sext i32 %65 to i64, !dbg !2520
  %67 = getelementptr inbounds i8* %17, i64 %66, !dbg !2520
  %68 = mul nsw i32 %53, %13, !dbg !2521
  %69 = sext i32 %68 to i64, !dbg !2520
  %70 = getelementptr inbounds i8* %67, i64 %69, !dbg !2520
  %71 = sext i32 %57 to i64, !dbg !2520
  %72 = getelementptr inbounds i8* %70, i64 %71, !dbg !2520
  call void @llvm.dbg.value(metadata i8* %72, i64 0, metadata !2522, metadata !506), !dbg !2523
  call void @llvm.dbg.value(metadata i8* %72, i64 0, metadata !2524, metadata !506), !dbg !2525
  %73 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !2526
  %74 = load i32 (i8*, i32, i8*, i32, i32)** %73, align 8, !dbg !2526
  %75 = call i32 %74(i8* %7, i32 %9, i8* %72, i32 %13, i32 -1), !dbg !2526
  %76 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !2527
  %77 = call i32 @mvsad_err_cost(%union.int_mv* %best_mv, %union.int_mv* %fcenter_mv, i32** %76, i32 %sad_per_bit), !dbg !2528
  %78 = add i32 %75, %77, !dbg !2526
  call void @llvm.dbg.value(metadata i32 %78, i64 0, metadata !2529, metadata !506), !dbg !2530
  %79 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14, !dbg !2531
  %80 = load i32* %79, align 4, !dbg !2531
  %81 = mul nsw i32 %search_param, %80, !dbg !2532
  %82 = sext i32 %81 to i64, !dbg !2533
  %83 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !2534
  %84 = load %struct.search_site** %83, align 8, !dbg !2534
  %85 = getelementptr inbounds %struct.search_site* %84, i64 %82, !dbg !2533
  call void @llvm.dbg.value(metadata %struct.search_site* %85, i64 0, metadata !2535, metadata !506), !dbg !2536
  %86 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 13, !dbg !2537
  %87 = load i32* %86, align 4, !dbg !2537
  %88 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14, !dbg !2538
  %89 = load i32* %88, align 4, !dbg !2538
  %90 = sdiv i32 %87, %89, !dbg !2537
  %91 = sub nsw i32 %90, %search_param, !dbg !2539
  call void @llvm.dbg.value(metadata i32 %91, i64 0, metadata !2540, metadata !506), !dbg !2541
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !2542, metadata !506), !dbg !2543
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2544, metadata !506), !dbg !2545
  br label %92, !dbg !2546

; <label>:92                                      ; preds = %210, %0
  %i.0 = phi i32 [ 1, %0 ], [ %i.1, %210 ]
  %step.0 = phi i32 [ 0, %0 ], [ %211, %210 ]
  %best_address.0 = phi i8* [ %72, %0 ], [ %best_address.1, %210 ]
  %bestsad.0 = phi i32 [ %78, %0 ], [ %bestsad.1, %210 ]
  %best_site.0 = phi i32 [ 0, %0 ], [ %best_site.1, %210 ]
  %last_site.0 = phi i32 [ 0, %0 ], [ %last_site.1, %210 ]
  %93 = icmp slt i32 %step.0, %91, !dbg !2548
  br i1 %93, label %94, label %212, !dbg !2550

; <label>:94                                      ; preds = %92
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2551, metadata !506), !dbg !2552
  br label %95, !dbg !2553

; <label>:95                                      ; preds = %168, %94
  %i.1 = phi i32 [ %i.0, %94 ], [ %167, %168 ]
  %j.0 = phi i32 [ 0, %94 ], [ %169, %168 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %94 ], [ %bestsad.4, %168 ]
  %best_site.1 = phi i32 [ %best_site.0, %94 ], [ %best_site.4, %168 ]
  %96 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14, !dbg !2556
  %97 = load i32* %96, align 4, !dbg !2556
  %98 = icmp slt i32 %j.0, %97, !dbg !2558
  br i1 %98, label %99, label %170, !dbg !2559

; <label>:99                                      ; preds = %95
  %100 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2560
  %101 = getelementptr inbounds %struct.MV* %100, i32 0, i32 0, !dbg !2560
  %102 = load i16* %101, align 2, !dbg !2560
  %103 = sext i16 %102 to i32, !dbg !2560
  %104 = sext i32 %i.1 to i64, !dbg !2562
  %105 = getelementptr inbounds %struct.search_site* %85, i64 %104, !dbg !2562
  %106 = getelementptr inbounds %struct.search_site* %105, i32 0, i32 0, !dbg !2562
  %107 = getelementptr inbounds %struct.MV* %106, i32 0, i32 0, !dbg !2562
  %108 = load i16* %107, align 2, !dbg !2562
  %109 = sext i16 %108 to i32, !dbg !2562
  %110 = add nsw i32 %103, %109, !dbg !2560
  call void @llvm.dbg.value(metadata i32 %110, i64 0, metadata !2563, metadata !506), !dbg !2564
  %111 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2565
  %112 = getelementptr inbounds %struct.MV* %111, i32 0, i32 1, !dbg !2565
  %113 = load i16* %112, align 2, !dbg !2565
  %114 = sext i16 %113 to i32, !dbg !2565
  %115 = sext i32 %i.1 to i64, !dbg !2566
  %116 = getelementptr inbounds %struct.search_site* %85, i64 %115, !dbg !2566
  %117 = getelementptr inbounds %struct.search_site* %116, i32 0, i32 0, !dbg !2566
  %118 = getelementptr inbounds %struct.MV* %117, i32 0, i32 1, !dbg !2566
  %119 = load i16* %118, align 2, !dbg !2566
  %120 = sext i16 %119 to i32, !dbg !2566
  %121 = add nsw i32 %114, %120, !dbg !2565
  call void @llvm.dbg.value(metadata i32 %121, i64 0, metadata !2567, metadata !506), !dbg !2568
  %122 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !2569
  %123 = load i32* %122, align 4, !dbg !2569
  %124 = icmp sgt i32 %121, %123, !dbg !2571
  br i1 %124, label %125, label %166, !dbg !2572

; <label>:125                                     ; preds = %99
  %126 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !2573
  %127 = load i32* %126, align 4, !dbg !2573
  %128 = icmp slt i32 %121, %127, !dbg !2574
  br i1 %128, label %129, label %166, !dbg !2572

; <label>:129                                     ; preds = %125
  %130 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !2575
  %131 = load i32* %130, align 4, !dbg !2575
  %132 = icmp sgt i32 %110, %131, !dbg !2576
  br i1 %132, label %133, label %166, !dbg !2572

; <label>:133                                     ; preds = %129
  %134 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !2577
  %135 = load i32* %134, align 4, !dbg !2577
  %136 = icmp slt i32 %110, %135, !dbg !2578
  br i1 %136, label %137, label %166, !dbg !2572

; <label>:137                                     ; preds = %133
  %138 = sext i32 %i.1 to i64, !dbg !2579
  %139 = getelementptr inbounds %struct.search_site* %85, i64 %138, !dbg !2579
  %140 = getelementptr inbounds %struct.search_site* %139, i32 0, i32 1, !dbg !2579
  %141 = load i32* %140, align 4, !dbg !2579
  %142 = sext i32 %141 to i64, !dbg !2579
  %143 = getelementptr inbounds i8* %best_address.0, i64 %142, !dbg !2579
  call void @llvm.dbg.value(metadata i8* %143, i64 0, metadata !2581, metadata !506), !dbg !2582
  %144 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !2583
  %145 = load i32 (i8*, i32, i8*, i32, i32)** %144, align 8, !dbg !2583
  %146 = call i32 %145(i8* %7, i32 %9, i8* %143, i32 %13, i32 %bestsad.1), !dbg !2583
  store i32 %146, i32* %thissad, align 4, !dbg !2584
  %147 = load i32* %thissad, align 4, !dbg !2585
  %148 = icmp ult i32 %147, %bestsad.1, !dbg !2585
  br i1 %148, label %149, label %165, !dbg !2587

; <label>:149                                     ; preds = %137
  %150 = trunc i32 %110 to i16, !dbg !2588
  %151 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2590
  %152 = getelementptr inbounds %struct.MV* %151, i32 0, i32 0, !dbg !2590
  store i16 %150, i16* %152, align 2, !dbg !2590
  %153 = trunc i32 %121 to i16, !dbg !2591
  %154 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2592
  %155 = getelementptr inbounds %struct.MV* %154, i32 0, i32 1, !dbg !2592
  store i16 %153, i16* %155, align 2, !dbg !2592
  %156 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !2593
  %157 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %156, i32 %sad_per_bit), !dbg !2594
  %158 = load i32* %thissad, align 4, !dbg !2595
  %159 = add i32 %158, %157, !dbg !2595
  store i32 %159, i32* %thissad, align 4, !dbg !2595
  %160 = load i32* %thissad, align 4, !dbg !2596
  %161 = icmp ult i32 %160, %bestsad.1, !dbg !2596
  br i1 %161, label %162, label %164, !dbg !2598

; <label>:162                                     ; preds = %149
  %163 = load i32* %thissad, align 4, !dbg !2599
  call void @llvm.dbg.value(metadata i32 %163, i64 0, metadata !2529, metadata !506), !dbg !2530
  call void @llvm.dbg.value(metadata i32 %i.1, i64 0, metadata !2487, metadata !506), !dbg !2488
  br label %164, !dbg !2601

; <label>:164                                     ; preds = %162, %149
  %bestsad.2 = phi i32 [ %163, %162 ], [ %bestsad.1, %149 ]
  %best_site.2 = phi i32 [ %i.1, %162 ], [ %best_site.1, %149 ]
  br label %165, !dbg !2602

; <label>:165                                     ; preds = %164, %137
  %bestsad.3 = phi i32 [ %bestsad.2, %164 ], [ %bestsad.1, %137 ]
  %best_site.3 = phi i32 [ %best_site.2, %164 ], [ %best_site.1, %137 ]
  br label %166, !dbg !2603

; <label>:166                                     ; preds = %165, %133, %129, %125, %99
  %bestsad.4 = phi i32 [ %bestsad.3, %165 ], [ %bestsad.1, %133 ], [ %bestsad.1, %129 ], [ %bestsad.1, %125 ], [ %bestsad.1, %99 ]
  %best_site.4 = phi i32 [ %best_site.3, %165 ], [ %best_site.1, %133 ], [ %best_site.1, %129 ], [ %best_site.1, %125 ], [ %best_site.1, %99 ]
  %167 = add nsw i32 %i.1, 1, !dbg !2604
  call void @llvm.dbg.value(metadata i32 %167, i64 0, metadata !2542, metadata !506), !dbg !2543
  br label %168, !dbg !2605

; <label>:168                                     ; preds = %166
  %169 = add nsw i32 %j.0, 1, !dbg !2606
  call void @llvm.dbg.value(metadata i32 %169, i64 0, metadata !2551, metadata !506), !dbg !2552
  br label %95, !dbg !2607

; <label>:170                                     ; preds = %95
  %171 = icmp ne i32 %best_site.1, %last_site.0, !dbg !2608
  br i1 %171, label %172, label %203, !dbg !2610

; <label>:172                                     ; preds = %170
  %173 = sext i32 %best_site.1 to i64, !dbg !2611
  %174 = getelementptr inbounds %struct.search_site* %85, i64 %173, !dbg !2611
  %175 = getelementptr inbounds %struct.search_site* %174, i32 0, i32 0, !dbg !2611
  %176 = getelementptr inbounds %struct.MV* %175, i32 0, i32 0, !dbg !2611
  %177 = load i16* %176, align 2, !dbg !2611
  %178 = sext i16 %177 to i32, !dbg !2611
  %179 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2613
  %180 = getelementptr inbounds %struct.MV* %179, i32 0, i32 0, !dbg !2613
  %181 = load i16* %180, align 2, !dbg !2613
  %182 = sext i16 %181 to i32, !dbg !2613
  %183 = add nsw i32 %182, %178, !dbg !2613
  %184 = trunc i32 %183 to i16, !dbg !2613
  store i16 %184, i16* %180, align 2, !dbg !2613
  %185 = sext i32 %best_site.1 to i64, !dbg !2614
  %186 = getelementptr inbounds %struct.search_site* %85, i64 %185, !dbg !2614
  %187 = getelementptr inbounds %struct.search_site* %186, i32 0, i32 0, !dbg !2614
  %188 = getelementptr inbounds %struct.MV* %187, i32 0, i32 1, !dbg !2614
  %189 = load i16* %188, align 2, !dbg !2614
  %190 = sext i16 %189 to i32, !dbg !2614
  %191 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2615
  %192 = getelementptr inbounds %struct.MV* %191, i32 0, i32 1, !dbg !2615
  %193 = load i16* %192, align 2, !dbg !2615
  %194 = sext i16 %193 to i32, !dbg !2615
  %195 = add nsw i32 %194, %190, !dbg !2615
  %196 = trunc i32 %195 to i16, !dbg !2615
  store i16 %196, i16* %192, align 2, !dbg !2615
  %197 = sext i32 %best_site.1 to i64, !dbg !2616
  %198 = getelementptr inbounds %struct.search_site* %85, i64 %197, !dbg !2616
  %199 = getelementptr inbounds %struct.search_site* %198, i32 0, i32 1, !dbg !2616
  %200 = load i32* %199, align 4, !dbg !2616
  %201 = sext i32 %200 to i64, !dbg !2617
  %202 = getelementptr inbounds i8* %best_address.0, i64 %201, !dbg !2617
  call void @llvm.dbg.value(metadata i8* %202, i64 0, metadata !2524, metadata !506), !dbg !2525
  call void @llvm.dbg.value(metadata i32 %best_site.1, i64 0, metadata !2489, metadata !506), !dbg !2490
  br label %209, !dbg !2618

; <label>:203                                     ; preds = %170
  %204 = icmp eq i8* %best_address.0, %72, !dbg !2619
  br i1 %204, label %205, label %208, !dbg !2621

; <label>:205                                     ; preds = %203
  %206 = load i32* %num00, align 4, !dbg !2622
  %207 = add nsw i32 %206, 1, !dbg !2622
  store i32 %207, i32* %num00, align 4, !dbg !2622
  br label %208, !dbg !2622

; <label>:208                                     ; preds = %205, %203
  br label %209

; <label>:209                                     ; preds = %208, %172
  %best_address.1 = phi i8* [ %202, %172 ], [ %best_address.0, %208 ]
  %last_site.1 = phi i32 [ %best_site.1, %172 ], [ %last_site.0, %208 ]
  br label %210, !dbg !2623

; <label>:210                                     ; preds = %209
  %211 = add nsw i32 %step.0, 1, !dbg !2624
  call void @llvm.dbg.value(metadata i32 %211, i64 0, metadata !2544, metadata !506), !dbg !2545
  br label %92, !dbg !2625

; <label>:212                                     ; preds = %92
  %213 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2626
  %214 = getelementptr inbounds %struct.MV* %213, i32 0, i32 0, !dbg !2626
  %215 = load i16* %214, align 2, !dbg !2626
  %216 = sext i16 %215 to i32, !dbg !2626
  %217 = shl i32 %216, 3, !dbg !2626
  %218 = trunc i32 %217 to i16, !dbg !2626
  %219 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2627
  %220 = getelementptr inbounds %struct.MV* %219, i32 0, i32 0, !dbg !2627
  store i16 %218, i16* %220, align 2, !dbg !2627
  %221 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2628
  %222 = getelementptr inbounds %struct.MV* %221, i32 0, i32 1, !dbg !2628
  %223 = load i16* %222, align 2, !dbg !2628
  %224 = sext i16 %223 to i32, !dbg !2628
  %225 = shl i32 %224, 3, !dbg !2628
  %226 = trunc i32 %225 to i16, !dbg !2628
  %227 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2629
  %228 = getelementptr inbounds %struct.MV* %227, i32 0, i32 1, !dbg !2629
  store i16 %226, i16* %228, align 2, !dbg !2629
  %229 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1, !dbg !2630
  %230 = load i32 (i8*, i32, i8*, i32, i32*)** %229, align 8, !dbg !2630
  %231 = call i32 %230(i8* %7, i32 %9, i8* %best_address.0, i32 %13, i32* %thissad), !dbg !2630
  %232 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15, !dbg !2631
  %233 = load i32* %232, align 4, !dbg !2631
  %234 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %233), !dbg !2632
  %235 = add i32 %231, %234, !dbg !2630
  ret i32 %235, !dbg !2633
}

; Function Attrs: nounwind uwtable
define i32 @vp8_diamond_search_sadx4(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, %union.int_mv* %best_mv, i32 %search_param, i32 %sad_per_bit, i32* %num00, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  %sad_array = alloca [4 x i32], align 16
  %block_offset = alloca [4 x i8*], align 16
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !2634, metadata !506), !dbg !2635
  call void @llvm.dbg.value(metadata %struct.block* %b, i64 0, metadata !2636, metadata !506), !dbg !2637
  call void @llvm.dbg.value(metadata %struct.blockd* %d, i64 0, metadata !2638, metadata !506), !dbg !2639
  call void @llvm.dbg.value(metadata %union.int_mv* %ref_mv, i64 0, metadata !2640, metadata !506), !dbg !2641
  call void @llvm.dbg.value(metadata %union.int_mv* %best_mv, i64 0, metadata !2642, metadata !506), !dbg !2643
  call void @llvm.dbg.value(metadata i32 %search_param, i64 0, metadata !2644, metadata !506), !dbg !2645
  call void @llvm.dbg.value(metadata i32 %sad_per_bit, i64 0, metadata !2646, metadata !506), !dbg !2647
  call void @llvm.dbg.value(metadata i32* %num00, i64 0, metadata !2648, metadata !506), !dbg !2649
  call void @llvm.dbg.value(metadata %struct.variance_vtable* %fn_ptr, i64 0, metadata !2650, metadata !506), !dbg !2651
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !2652, metadata !506), !dbg !2653
  call void @llvm.dbg.value(metadata %union.int_mv* %center_mv, i64 0, metadata !2654, metadata !506), !dbg !2655
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9, !dbg !2656
  %2 = load i8*** %1, align 8, !dbg !2656
  %3 = load i8** %2, align 8, !dbg !2657
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10, !dbg !2658
  %5 = load i32* %4, align 4, !dbg !2658
  %6 = sext i32 %5 to i64, !dbg !2657
  %7 = getelementptr inbounds i8* %3, i64 %6, !dbg !2657
  call void @llvm.dbg.value(metadata i8* %7, i64 0, metadata !2659, metadata !506), !dbg !2660
  %8 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !2661
  %9 = load i32* %8, align 4, !dbg !2661
  call void @llvm.dbg.value(metadata i32 %9, i64 0, metadata !2662, metadata !506), !dbg !2663
  %10 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !2664
  %11 = getelementptr inbounds %struct.macroblockd* %10, i32 0, i32 11, !dbg !2664
  %12 = getelementptr inbounds %struct.yv12_buffer_config* %11, i32 0, i32 4, !dbg !2664
  %13 = load i32* %12, align 4, !dbg !2664
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !2665, metadata !506), !dbg !2666
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !2667
  %15 = getelementptr inbounds %struct.macroblockd* %14, i32 0, i32 11, !dbg !2667
  %16 = getelementptr inbounds %struct.yv12_buffer_config* %15, i32 0, i32 13, !dbg !2667
  %17 = load i8** %16, align 8, !dbg !2667
  call void @llvm.dbg.value(metadata i8* %17, i64 0, metadata !2668, metadata !506), !dbg !2669
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !2670, metadata !506), !dbg !2671
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !2672, metadata !506), !dbg !2673
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !2674, metadata !506), !dbg !2675
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2676, metadata !506), !dbg !2677
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2678, metadata !506), !dbg !2679
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !2680, metadata !506), !dbg !2681
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !2682, metadata !506), !dbg !2683
  %18 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !2684
  %19 = getelementptr inbounds [2 x i32*]* %18, i32 0, i64 0, !dbg !2684
  %20 = load i32** %19, align 8, !dbg !2684
  %21 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !2685
  store i32* %20, i32** %21, align 8, !dbg !2685
  %22 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !2686
  %23 = getelementptr inbounds [2 x i32*]* %22, i32 0, i64 1, !dbg !2686
  %24 = load i32** %23, align 8, !dbg !2686
  %25 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !2687
  store i32* %24, i32** %25, align 8, !dbg !2687
  %26 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !2688
  %27 = getelementptr inbounds %struct.MV* %26, i32 0, i32 0, !dbg !2688
  %28 = load i16* %27, align 2, !dbg !2688
  %29 = sext i16 %28 to i32, !dbg !2688
  %30 = ashr i32 %29, 3, !dbg !2688
  %31 = trunc i32 %30 to i16, !dbg !2688
  %32 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !2689
  %33 = getelementptr inbounds %struct.MV* %32, i32 0, i32 0, !dbg !2689
  store i16 %31, i16* %33, align 2, !dbg !2689
  %34 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !2690
  %35 = getelementptr inbounds %struct.MV* %34, i32 0, i32 1, !dbg !2690
  %36 = load i16* %35, align 2, !dbg !2690
  %37 = sext i16 %36 to i32, !dbg !2690
  %38 = ashr i32 %37, 3, !dbg !2690
  %39 = trunc i32 %38 to i16, !dbg !2690
  %40 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !2691
  %41 = getelementptr inbounds %struct.MV* %40, i32 0, i32 1, !dbg !2691
  store i16 %39, i16* %41, align 2, !dbg !2691
  %42 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !2692
  %43 = load i32* %42, align 4, !dbg !2692
  %44 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !2693
  %45 = load i32* %44, align 4, !dbg !2693
  %46 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !2694
  %47 = load i32* %46, align 4, !dbg !2694
  %48 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !2695
  %49 = load i32* %48, align 4, !dbg !2695
  call void @vp8_clamp_mv(%union.int_mv* %ref_mv, i32 %43, i32 %45, i32 %47, i32 %49), !dbg !2696
  %50 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !2697
  %51 = getelementptr inbounds %struct.MV* %50, i32 0, i32 0, !dbg !2697
  %52 = load i16* %51, align 2, !dbg !2697
  %53 = sext i16 %52 to i32, !dbg !2697
  call void @llvm.dbg.value(metadata i32 %53, i64 0, metadata !2698, metadata !506), !dbg !2699
  %54 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !2700
  %55 = getelementptr inbounds %struct.MV* %54, i32 0, i32 1, !dbg !2700
  %56 = load i16* %55, align 2, !dbg !2700
  %57 = sext i16 %56 to i32, !dbg !2700
  call void @llvm.dbg.value(metadata i32 %57, i64 0, metadata !2701, metadata !506), !dbg !2702
  store i32 0, i32* %num00, align 4, !dbg !2703
  %58 = trunc i32 %53 to i16, !dbg !2704
  %59 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2705
  %60 = getelementptr inbounds %struct.MV* %59, i32 0, i32 0, !dbg !2705
  store i16 %58, i16* %60, align 2, !dbg !2705
  %61 = trunc i32 %57 to i16, !dbg !2706
  %62 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2707
  %63 = getelementptr inbounds %struct.MV* %62, i32 0, i32 1, !dbg !2707
  store i16 %61, i16* %63, align 2, !dbg !2707
  %64 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4, !dbg !2708
  %65 = load i32* %64, align 4, !dbg !2708
  %66 = sext i32 %65 to i64, !dbg !2709
  %67 = getelementptr inbounds i8* %17, i64 %66, !dbg !2709
  %68 = mul nsw i32 %53, %13, !dbg !2710
  %69 = sext i32 %68 to i64, !dbg !2709
  %70 = getelementptr inbounds i8* %67, i64 %69, !dbg !2709
  %71 = sext i32 %57 to i64, !dbg !2709
  %72 = getelementptr inbounds i8* %70, i64 %71, !dbg !2709
  call void @llvm.dbg.value(metadata i8* %72, i64 0, metadata !2711, metadata !506), !dbg !2712
  call void @llvm.dbg.value(metadata i8* %72, i64 0, metadata !2713, metadata !506), !dbg !2714
  %73 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !2715
  %74 = load i32 (i8*, i32, i8*, i32, i32)** %73, align 8, !dbg !2715
  %75 = call i32 %74(i8* %7, i32 %9, i8* %72, i32 %13, i32 -1), !dbg !2715
  %76 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !2716
  %77 = call i32 @mvsad_err_cost(%union.int_mv* %best_mv, %union.int_mv* %fcenter_mv, i32** %76, i32 %sad_per_bit), !dbg !2717
  %78 = add i32 %75, %77, !dbg !2715
  call void @llvm.dbg.value(metadata i32 %78, i64 0, metadata !2718, metadata !506), !dbg !2719
  %79 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14, !dbg !2720
  %80 = load i32* %79, align 4, !dbg !2720
  %81 = mul nsw i32 %search_param, %80, !dbg !2721
  %82 = sext i32 %81 to i64, !dbg !2722
  %83 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 12, !dbg !2723
  %84 = load %struct.search_site** %83, align 8, !dbg !2723
  %85 = getelementptr inbounds %struct.search_site* %84, i64 %82, !dbg !2722
  call void @llvm.dbg.value(metadata %struct.search_site* %85, i64 0, metadata !2724, metadata !506), !dbg !2725
  %86 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 13, !dbg !2726
  %87 = load i32* %86, align 4, !dbg !2726
  %88 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14, !dbg !2727
  %89 = load i32* %88, align 4, !dbg !2727
  %90 = sdiv i32 %87, %89, !dbg !2726
  %91 = sub nsw i32 %90, %search_param, !dbg !2728
  call void @llvm.dbg.value(metadata i32 %91, i64 0, metadata !2729, metadata !506), !dbg !2730
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !2731, metadata !506), !dbg !2732
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2733, metadata !506), !dbg !2734
  br label %92, !dbg !2735

; <label>:92                                      ; preds = %364, %0
  %i.0 = phi i32 [ 1, %0 ], [ %i.4, %364 ]
  %step.0 = phi i32 [ 0, %0 ], [ %365, %364 ]
  %best_address.0 = phi i8* [ %72, %0 ], [ %best_address.1, %364 ]
  %bestsad.0 = phi i32 [ %78, %0 ], [ %bestsad.9, %364 ]
  %best_site.0 = phi i32 [ 0, %0 ], [ %best_site.9, %364 ]
  %last_site.0 = phi i32 [ 0, %0 ], [ %last_site.1, %364 ]
  %93 = icmp slt i32 %step.0, %91, !dbg !2737
  br i1 %93, label %94, label %366, !dbg !2739

; <label>:94                                      ; preds = %92
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !2740, metadata !506), !dbg !2742
  %95 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2743
  %96 = getelementptr inbounds %struct.MV* %95, i32 0, i32 0, !dbg !2743
  %97 = load i16* %96, align 2, !dbg !2743
  %98 = sext i16 %97 to i32, !dbg !2743
  %99 = sext i32 %i.0 to i64, !dbg !2744
  %100 = getelementptr inbounds %struct.search_site* %85, i64 %99, !dbg !2744
  %101 = getelementptr inbounds %struct.search_site* %100, i32 0, i32 0, !dbg !2744
  %102 = getelementptr inbounds %struct.MV* %101, i32 0, i32 0, !dbg !2744
  %103 = load i16* %102, align 2, !dbg !2744
  %104 = sext i16 %103 to i32, !dbg !2744
  %105 = add nsw i32 %98, %104, !dbg !2743
  %106 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !2745
  %107 = load i32* %106, align 4, !dbg !2745
  %108 = icmp sgt i32 %105, %107, !dbg !2746
  %109 = zext i1 %108 to i32, !dbg !2746
  %110 = and i32 1, %109, !dbg !2747
  call void @llvm.dbg.value(metadata i32 %110, i64 0, metadata !2740, metadata !506), !dbg !2742
  %111 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2748
  %112 = getelementptr inbounds %struct.MV* %111, i32 0, i32 0, !dbg !2748
  %113 = load i16* %112, align 2, !dbg !2748
  %114 = sext i16 %113 to i32, !dbg !2748
  %115 = add nsw i32 %i.0, 1, !dbg !2749
  %116 = sext i32 %115 to i64, !dbg !2750
  %117 = getelementptr inbounds %struct.search_site* %85, i64 %116, !dbg !2750
  %118 = getelementptr inbounds %struct.search_site* %117, i32 0, i32 0, !dbg !2750
  %119 = getelementptr inbounds %struct.MV* %118, i32 0, i32 0, !dbg !2750
  %120 = load i16* %119, align 2, !dbg !2750
  %121 = sext i16 %120 to i32, !dbg !2750
  %122 = add nsw i32 %114, %121, !dbg !2748
  %123 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !2751
  %124 = load i32* %123, align 4, !dbg !2751
  %125 = icmp slt i32 %122, %124, !dbg !2752
  %126 = zext i1 %125 to i32, !dbg !2752
  %127 = and i32 %110, %126, !dbg !2753
  call void @llvm.dbg.value(metadata i32 %127, i64 0, metadata !2740, metadata !506), !dbg !2742
  %128 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2754
  %129 = getelementptr inbounds %struct.MV* %128, i32 0, i32 1, !dbg !2754
  %130 = load i16* %129, align 2, !dbg !2754
  %131 = sext i16 %130 to i32, !dbg !2754
  %132 = add nsw i32 %i.0, 2, !dbg !2755
  %133 = sext i32 %132 to i64, !dbg !2756
  %134 = getelementptr inbounds %struct.search_site* %85, i64 %133, !dbg !2756
  %135 = getelementptr inbounds %struct.search_site* %134, i32 0, i32 0, !dbg !2756
  %136 = getelementptr inbounds %struct.MV* %135, i32 0, i32 1, !dbg !2756
  %137 = load i16* %136, align 2, !dbg !2756
  %138 = sext i16 %137 to i32, !dbg !2756
  %139 = add nsw i32 %131, %138, !dbg !2754
  %140 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !2757
  %141 = load i32* %140, align 4, !dbg !2757
  %142 = icmp sgt i32 %139, %141, !dbg !2758
  %143 = zext i1 %142 to i32, !dbg !2758
  %144 = and i32 %127, %143, !dbg !2759
  call void @llvm.dbg.value(metadata i32 %144, i64 0, metadata !2740, metadata !506), !dbg !2742
  %145 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2760
  %146 = getelementptr inbounds %struct.MV* %145, i32 0, i32 1, !dbg !2760
  %147 = load i16* %146, align 2, !dbg !2760
  %148 = sext i16 %147 to i32, !dbg !2760
  %149 = add nsw i32 %i.0, 3, !dbg !2761
  %150 = sext i32 %149 to i64, !dbg !2762
  %151 = getelementptr inbounds %struct.search_site* %85, i64 %150, !dbg !2762
  %152 = getelementptr inbounds %struct.search_site* %151, i32 0, i32 0, !dbg !2762
  %153 = getelementptr inbounds %struct.MV* %152, i32 0, i32 1, !dbg !2762
  %154 = load i16* %153, align 2, !dbg !2762
  %155 = sext i16 %154 to i32, !dbg !2762
  %156 = add nsw i32 %148, %155, !dbg !2760
  %157 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !2763
  %158 = load i32* %157, align 4, !dbg !2763
  %159 = icmp slt i32 %156, %158, !dbg !2764
  %160 = zext i1 %159 to i32, !dbg !2764
  %161 = and i32 %144, %160, !dbg !2765
  call void @llvm.dbg.value(metadata i32 %161, i64 0, metadata !2740, metadata !506), !dbg !2742
  %162 = icmp ne i32 %161, 0, !dbg !2766
  br i1 %162, label %163, label %247, !dbg !2766

; <label>:163                                     ; preds = %94
  call void @llvm.dbg.declare(metadata [4 x i32]* %sad_array, metadata !2767, metadata !506), !dbg !2771
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2772, metadata !506), !dbg !2773
  br label %164, !dbg !2774

; <label>:164                                     ; preds = %244, %163
  %i.1 = phi i32 [ %i.0, %163 ], [ %i.2, %244 ]
  %j.0 = phi i32 [ 0, %163 ], [ %245, %244 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %163 ], [ %bestsad.2, %244 ]
  %best_site.1 = phi i32 [ %best_site.0, %163 ], [ %best_site.2, %244 ]
  %165 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14, !dbg !2776
  %166 = load i32* %165, align 4, !dbg !2776
  %167 = icmp slt i32 %j.0, %166, !dbg !2778
  br i1 %167, label %168, label %246, !dbg !2779

; <label>:168                                     ; preds = %164
  call void @llvm.dbg.declare(metadata [4 x i8*]* %block_offset, metadata !2780, metadata !506), !dbg !2783
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2784, metadata !506), !dbg !2785
  br label %169, !dbg !2786

; <label>:169                                     ; preds = %181, %168
  %t.0 = phi i32 [ 0, %168 ], [ %182, %181 ]
  %170 = icmp slt i32 %t.0, 4, !dbg !2788
  br i1 %170, label %171, label %183, !dbg !2792

; <label>:171                                     ; preds = %169
  %172 = add nsw i32 %i.1, %t.0, !dbg !2793
  %173 = sext i32 %172 to i64, !dbg !2794
  %174 = getelementptr inbounds %struct.search_site* %85, i64 %173, !dbg !2794
  %175 = getelementptr inbounds %struct.search_site* %174, i32 0, i32 1, !dbg !2794
  %176 = load i32* %175, align 4, !dbg !2794
  %177 = sext i32 %176 to i64, !dbg !2794
  %178 = getelementptr inbounds i8* %best_address.0, i64 %177, !dbg !2794
  %179 = sext i32 %t.0 to i64, !dbg !2795
  %180 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 %179, !dbg !2795
  store i8* %178, i8** %180, align 8, !dbg !2795
  br label %181, !dbg !2795

; <label>:181                                     ; preds = %171
  %182 = add nsw i32 %t.0, 1, !dbg !2796
  call void @llvm.dbg.value(metadata i32 %182, i64 0, metadata !2784, metadata !506), !dbg !2785
  br label %169, !dbg !2797

; <label>:183                                     ; preds = %169
  %184 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 8, !dbg !2798
  %185 = load void (i8*, i32, i8**, i32, i32*)** %184, align 8, !dbg !2798
  %186 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i32 0, !dbg !2799
  %187 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i32 0, !dbg !2800
  call void %185(i8* %7, i32 %9, i8** %186, i32 %13, i32* %187), !dbg !2798
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2784, metadata !506), !dbg !2785
  br label %188, !dbg !2801

; <label>:188                                     ; preds = %240, %183
  %i.2 = phi i32 [ %i.1, %183 ], [ %242, %240 ]
  %bestsad.2 = phi i32 [ %bestsad.1, %183 ], [ %bestsad.4, %240 ]
  %best_site.2 = phi i32 [ %best_site.1, %183 ], [ %best_site.4, %240 ]
  %t.1 = phi i32 [ 0, %183 ], [ %241, %240 ]
  %189 = icmp slt i32 %t.1, 4, !dbg !2803
  br i1 %189, label %190, label %243, !dbg !2807

; <label>:190                                     ; preds = %188
  %191 = sext i32 %t.1 to i64, !dbg !2808
  %192 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %191, !dbg !2808
  %193 = load i32* %192, align 4, !dbg !2808
  %194 = icmp ult i32 %193, %bestsad.2, !dbg !2808
  br i1 %194, label %195, label %239, !dbg !2811

; <label>:195                                     ; preds = %190
  %196 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2812
  %197 = getelementptr inbounds %struct.MV* %196, i32 0, i32 0, !dbg !2812
  %198 = load i16* %197, align 2, !dbg !2812
  %199 = sext i16 %198 to i32, !dbg !2812
  %200 = sext i32 %i.2 to i64, !dbg !2814
  %201 = getelementptr inbounds %struct.search_site* %85, i64 %200, !dbg !2814
  %202 = getelementptr inbounds %struct.search_site* %201, i32 0, i32 0, !dbg !2814
  %203 = getelementptr inbounds %struct.MV* %202, i32 0, i32 0, !dbg !2814
  %204 = load i16* %203, align 2, !dbg !2814
  %205 = sext i16 %204 to i32, !dbg !2814
  %206 = add nsw i32 %199, %205, !dbg !2812
  %207 = trunc i32 %206 to i16, !dbg !2812
  %208 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2815
  %209 = getelementptr inbounds %struct.MV* %208, i32 0, i32 0, !dbg !2815
  store i16 %207, i16* %209, align 2, !dbg !2815
  %210 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2816
  %211 = getelementptr inbounds %struct.MV* %210, i32 0, i32 1, !dbg !2816
  %212 = load i16* %211, align 2, !dbg !2816
  %213 = sext i16 %212 to i32, !dbg !2816
  %214 = sext i32 %i.2 to i64, !dbg !2817
  %215 = getelementptr inbounds %struct.search_site* %85, i64 %214, !dbg !2817
  %216 = getelementptr inbounds %struct.search_site* %215, i32 0, i32 0, !dbg !2817
  %217 = getelementptr inbounds %struct.MV* %216, i32 0, i32 1, !dbg !2817
  %218 = load i16* %217, align 2, !dbg !2817
  %219 = sext i16 %218 to i32, !dbg !2817
  %220 = add nsw i32 %213, %219, !dbg !2816
  %221 = trunc i32 %220 to i16, !dbg !2816
  %222 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2818
  %223 = getelementptr inbounds %struct.MV* %222, i32 0, i32 1, !dbg !2818
  store i16 %221, i16* %223, align 2, !dbg !2818
  %224 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !2819
  %225 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %224, i32 %sad_per_bit), !dbg !2820
  %226 = sext i32 %t.1 to i64, !dbg !2821
  %227 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %226, !dbg !2821
  %228 = load i32* %227, align 4, !dbg !2821
  %229 = add i32 %228, %225, !dbg !2821
  store i32 %229, i32* %227, align 4, !dbg !2821
  %230 = sext i32 %t.1 to i64, !dbg !2822
  %231 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %230, !dbg !2822
  %232 = load i32* %231, align 4, !dbg !2822
  %233 = icmp ult i32 %232, %bestsad.2, !dbg !2822
  br i1 %233, label %234, label %238, !dbg !2824

; <label>:234                                     ; preds = %195
  %235 = sext i32 %t.1 to i64, !dbg !2825
  %236 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %235, !dbg !2825
  %237 = load i32* %236, align 4, !dbg !2825
  call void @llvm.dbg.value(metadata i32 %237, i64 0, metadata !2718, metadata !506), !dbg !2719
  call void @llvm.dbg.value(metadata i32 %i.2, i64 0, metadata !2676, metadata !506), !dbg !2677
  br label %238, !dbg !2827

; <label>:238                                     ; preds = %234, %195
  %bestsad.3 = phi i32 [ %237, %234 ], [ %bestsad.2, %195 ]
  %best_site.3 = phi i32 [ %i.2, %234 ], [ %best_site.2, %195 ]
  br label %239, !dbg !2828

; <label>:239                                     ; preds = %238, %190
  %bestsad.4 = phi i32 [ %bestsad.3, %238 ], [ %bestsad.2, %190 ]
  %best_site.4 = phi i32 [ %best_site.3, %238 ], [ %best_site.2, %190 ]
  br label %240, !dbg !2829

; <label>:240                                     ; preds = %239
  %241 = add nsw i32 %t.1, 1, !dbg !2830
  call void @llvm.dbg.value(metadata i32 %241, i64 0, metadata !2784, metadata !506), !dbg !2785
  %242 = add nsw i32 %i.2, 1, !dbg !2831
  call void @llvm.dbg.value(metadata i32 %242, i64 0, metadata !2731, metadata !506), !dbg !2732
  br label %188, !dbg !2832

; <label>:243                                     ; preds = %188
  br label %244, !dbg !2833

; <label>:244                                     ; preds = %243
  %245 = add nsw i32 %j.0, 4, !dbg !2834
  call void @llvm.dbg.value(metadata i32 %245, i64 0, metadata !2772, metadata !506), !dbg !2773
  br label %164, !dbg !2835

; <label>:246                                     ; preds = %164
  br label %324, !dbg !2836

; <label>:247                                     ; preds = %94
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2772, metadata !506), !dbg !2773
  br label %248, !dbg !2837

; <label>:248                                     ; preds = %321, %247
  %i.3 = phi i32 [ %i.0, %247 ], [ %320, %321 ]
  %j.1 = phi i32 [ 0, %247 ], [ %322, %321 ]
  %bestsad.5 = phi i32 [ %bestsad.0, %247 ], [ %bestsad.8, %321 ]
  %best_site.5 = phi i32 [ %best_site.0, %247 ], [ %best_site.8, %321 ]
  %249 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 14, !dbg !2840
  %250 = load i32* %249, align 4, !dbg !2840
  %251 = icmp slt i32 %j.1, %250, !dbg !2842
  br i1 %251, label %252, label %323, !dbg !2843

; <label>:252                                     ; preds = %248
  %253 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2844
  %254 = getelementptr inbounds %struct.MV* %253, i32 0, i32 0, !dbg !2844
  %255 = load i16* %254, align 2, !dbg !2844
  %256 = sext i16 %255 to i32, !dbg !2844
  %257 = sext i32 %i.3 to i64, !dbg !2846
  %258 = getelementptr inbounds %struct.search_site* %85, i64 %257, !dbg !2846
  %259 = getelementptr inbounds %struct.search_site* %258, i32 0, i32 0, !dbg !2846
  %260 = getelementptr inbounds %struct.MV* %259, i32 0, i32 0, !dbg !2846
  %261 = load i16* %260, align 2, !dbg !2846
  %262 = sext i16 %261 to i32, !dbg !2846
  %263 = add nsw i32 %256, %262, !dbg !2844
  call void @llvm.dbg.value(metadata i32 %263, i64 0, metadata !2847, metadata !506), !dbg !2848
  %264 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2849
  %265 = getelementptr inbounds %struct.MV* %264, i32 0, i32 1, !dbg !2849
  %266 = load i16* %265, align 2, !dbg !2849
  %267 = sext i16 %266 to i32, !dbg !2849
  %268 = sext i32 %i.3 to i64, !dbg !2850
  %269 = getelementptr inbounds %struct.search_site* %85, i64 %268, !dbg !2850
  %270 = getelementptr inbounds %struct.search_site* %269, i32 0, i32 0, !dbg !2850
  %271 = getelementptr inbounds %struct.MV* %270, i32 0, i32 1, !dbg !2850
  %272 = load i16* %271, align 2, !dbg !2850
  %273 = sext i16 %272 to i32, !dbg !2850
  %274 = add nsw i32 %267, %273, !dbg !2849
  call void @llvm.dbg.value(metadata i32 %274, i64 0, metadata !2851, metadata !506), !dbg !2852
  %275 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !2853
  %276 = load i32* %275, align 4, !dbg !2853
  %277 = icmp sgt i32 %274, %276, !dbg !2855
  br i1 %277, label %278, label %319, !dbg !2856

; <label>:278                                     ; preds = %252
  %279 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !2857
  %280 = load i32* %279, align 4, !dbg !2857
  %281 = icmp slt i32 %274, %280, !dbg !2858
  br i1 %281, label %282, label %319, !dbg !2856

; <label>:282                                     ; preds = %278
  %283 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !2859
  %284 = load i32* %283, align 4, !dbg !2859
  %285 = icmp sgt i32 %263, %284, !dbg !2860
  br i1 %285, label %286, label %319, !dbg !2856

; <label>:286                                     ; preds = %282
  %287 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !2861
  %288 = load i32* %287, align 4, !dbg !2861
  %289 = icmp slt i32 %263, %288, !dbg !2862
  br i1 %289, label %290, label %319, !dbg !2856

; <label>:290                                     ; preds = %286
  %291 = sext i32 %i.3 to i64, !dbg !2863
  %292 = getelementptr inbounds %struct.search_site* %85, i64 %291, !dbg !2863
  %293 = getelementptr inbounds %struct.search_site* %292, i32 0, i32 1, !dbg !2863
  %294 = load i32* %293, align 4, !dbg !2863
  %295 = sext i32 %294 to i64, !dbg !2863
  %296 = getelementptr inbounds i8* %best_address.0, i64 %295, !dbg !2863
  call void @llvm.dbg.value(metadata i8* %296, i64 0, metadata !2865, metadata !506), !dbg !2866
  %297 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !2867
  %298 = load i32 (i8*, i32, i8*, i32, i32)** %297, align 8, !dbg !2867
  %299 = call i32 %298(i8* %7, i32 %9, i8* %296, i32 %13, i32 %bestsad.5), !dbg !2867
  store i32 %299, i32* %thissad, align 4, !dbg !2868
  %300 = load i32* %thissad, align 4, !dbg !2869
  %301 = icmp ult i32 %300, %bestsad.5, !dbg !2869
  br i1 %301, label %302, label %318, !dbg !2871

; <label>:302                                     ; preds = %290
  %303 = trunc i32 %263 to i16, !dbg !2872
  %304 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2874
  %305 = getelementptr inbounds %struct.MV* %304, i32 0, i32 0, !dbg !2874
  store i16 %303, i16* %305, align 2, !dbg !2874
  %306 = trunc i32 %274 to i16, !dbg !2875
  %307 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2876
  %308 = getelementptr inbounds %struct.MV* %307, i32 0, i32 1, !dbg !2876
  store i16 %306, i16* %308, align 2, !dbg !2876
  %309 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !2877
  %310 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %309, i32 %sad_per_bit), !dbg !2878
  %311 = load i32* %thissad, align 4, !dbg !2879
  %312 = add i32 %311, %310, !dbg !2879
  store i32 %312, i32* %thissad, align 4, !dbg !2879
  %313 = load i32* %thissad, align 4, !dbg !2880
  %314 = icmp ult i32 %313, %bestsad.5, !dbg !2880
  br i1 %314, label %315, label %317, !dbg !2882

; <label>:315                                     ; preds = %302
  %316 = load i32* %thissad, align 4, !dbg !2883
  call void @llvm.dbg.value(metadata i32 %316, i64 0, metadata !2718, metadata !506), !dbg !2719
  call void @llvm.dbg.value(metadata i32 %i.3, i64 0, metadata !2676, metadata !506), !dbg !2677
  br label %317, !dbg !2885

; <label>:317                                     ; preds = %315, %302
  %bestsad.6 = phi i32 [ %316, %315 ], [ %bestsad.5, %302 ]
  %best_site.6 = phi i32 [ %i.3, %315 ], [ %best_site.5, %302 ]
  br label %318, !dbg !2886

; <label>:318                                     ; preds = %317, %290
  %bestsad.7 = phi i32 [ %bestsad.6, %317 ], [ %bestsad.5, %290 ]
  %best_site.7 = phi i32 [ %best_site.6, %317 ], [ %best_site.5, %290 ]
  br label %319, !dbg !2887

; <label>:319                                     ; preds = %318, %286, %282, %278, %252
  %bestsad.8 = phi i32 [ %bestsad.7, %318 ], [ %bestsad.5, %286 ], [ %bestsad.5, %282 ], [ %bestsad.5, %278 ], [ %bestsad.5, %252 ]
  %best_site.8 = phi i32 [ %best_site.7, %318 ], [ %best_site.5, %286 ], [ %best_site.5, %282 ], [ %best_site.5, %278 ], [ %best_site.5, %252 ]
  %320 = add nsw i32 %i.3, 1, !dbg !2888
  call void @llvm.dbg.value(metadata i32 %320, i64 0, metadata !2731, metadata !506), !dbg !2732
  br label %321, !dbg !2889

; <label>:321                                     ; preds = %319
  %322 = add nsw i32 %j.1, 1, !dbg !2890
  call void @llvm.dbg.value(metadata i32 %322, i64 0, metadata !2772, metadata !506), !dbg !2773
  br label %248, !dbg !2891

; <label>:323                                     ; preds = %248
  br label %324

; <label>:324                                     ; preds = %323, %246
  %i.4 = phi i32 [ %i.1, %246 ], [ %i.3, %323 ]
  %bestsad.9 = phi i32 [ %bestsad.1, %246 ], [ %bestsad.5, %323 ]
  %best_site.9 = phi i32 [ %best_site.1, %246 ], [ %best_site.5, %323 ]
  %325 = icmp ne i32 %best_site.9, %last_site.0, !dbg !2892
  br i1 %325, label %326, label %357, !dbg !2894

; <label>:326                                     ; preds = %324
  %327 = sext i32 %best_site.9 to i64, !dbg !2895
  %328 = getelementptr inbounds %struct.search_site* %85, i64 %327, !dbg !2895
  %329 = getelementptr inbounds %struct.search_site* %328, i32 0, i32 0, !dbg !2895
  %330 = getelementptr inbounds %struct.MV* %329, i32 0, i32 0, !dbg !2895
  %331 = load i16* %330, align 2, !dbg !2895
  %332 = sext i16 %331 to i32, !dbg !2895
  %333 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2897
  %334 = getelementptr inbounds %struct.MV* %333, i32 0, i32 0, !dbg !2897
  %335 = load i16* %334, align 2, !dbg !2897
  %336 = sext i16 %335 to i32, !dbg !2897
  %337 = add nsw i32 %336, %332, !dbg !2897
  %338 = trunc i32 %337 to i16, !dbg !2897
  store i16 %338, i16* %334, align 2, !dbg !2897
  %339 = sext i32 %best_site.9 to i64, !dbg !2898
  %340 = getelementptr inbounds %struct.search_site* %85, i64 %339, !dbg !2898
  %341 = getelementptr inbounds %struct.search_site* %340, i32 0, i32 0, !dbg !2898
  %342 = getelementptr inbounds %struct.MV* %341, i32 0, i32 1, !dbg !2898
  %343 = load i16* %342, align 2, !dbg !2898
  %344 = sext i16 %343 to i32, !dbg !2898
  %345 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2899
  %346 = getelementptr inbounds %struct.MV* %345, i32 0, i32 1, !dbg !2899
  %347 = load i16* %346, align 2, !dbg !2899
  %348 = sext i16 %347 to i32, !dbg !2899
  %349 = add nsw i32 %348, %344, !dbg !2899
  %350 = trunc i32 %349 to i16, !dbg !2899
  store i16 %350, i16* %346, align 2, !dbg !2899
  %351 = sext i32 %best_site.9 to i64, !dbg !2900
  %352 = getelementptr inbounds %struct.search_site* %85, i64 %351, !dbg !2900
  %353 = getelementptr inbounds %struct.search_site* %352, i32 0, i32 1, !dbg !2900
  %354 = load i32* %353, align 4, !dbg !2900
  %355 = sext i32 %354 to i64, !dbg !2901
  %356 = getelementptr inbounds i8* %best_address.0, i64 %355, !dbg !2901
  call void @llvm.dbg.value(metadata i8* %356, i64 0, metadata !2713, metadata !506), !dbg !2714
  call void @llvm.dbg.value(metadata i32 %best_site.9, i64 0, metadata !2678, metadata !506), !dbg !2679
  br label %363, !dbg !2902

; <label>:357                                     ; preds = %324
  %358 = icmp eq i8* %best_address.0, %72, !dbg !2903
  br i1 %358, label %359, label %362, !dbg !2905

; <label>:359                                     ; preds = %357
  %360 = load i32* %num00, align 4, !dbg !2906
  %361 = add nsw i32 %360, 1, !dbg !2906
  store i32 %361, i32* %num00, align 4, !dbg !2906
  br label %362, !dbg !2906

; <label>:362                                     ; preds = %359, %357
  br label %363

; <label>:363                                     ; preds = %362, %326
  %best_address.1 = phi i8* [ %356, %326 ], [ %best_address.0, %362 ]
  %last_site.1 = phi i32 [ %best_site.9, %326 ], [ %last_site.0, %362 ]
  br label %364, !dbg !2907

; <label>:364                                     ; preds = %363
  %365 = add nsw i32 %step.0, 1, !dbg !2908
  call void @llvm.dbg.value(metadata i32 %365, i64 0, metadata !2733, metadata !506), !dbg !2734
  br label %92, !dbg !2909

; <label>:366                                     ; preds = %92
  %367 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2910
  %368 = getelementptr inbounds %struct.MV* %367, i32 0, i32 0, !dbg !2910
  %369 = load i16* %368, align 2, !dbg !2910
  %370 = sext i16 %369 to i32, !dbg !2910
  %371 = mul nsw i32 %370, 8, !dbg !2910
  %372 = trunc i32 %371 to i16, !dbg !2910
  %373 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2911
  %374 = getelementptr inbounds %struct.MV* %373, i32 0, i32 0, !dbg !2911
  store i16 %372, i16* %374, align 2, !dbg !2911
  %375 = bitcast %union.int_mv* %best_mv to %struct.MV*, !dbg !2912
  %376 = getelementptr inbounds %struct.MV* %375, i32 0, i32 1, !dbg !2912
  %377 = load i16* %376, align 2, !dbg !2912
  %378 = sext i16 %377 to i32, !dbg !2912
  %379 = mul nsw i32 %378, 8, !dbg !2912
  %380 = trunc i32 %379 to i16, !dbg !2912
  %381 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !2913
  %382 = getelementptr inbounds %struct.MV* %381, i32 0, i32 1, !dbg !2913
  store i16 %380, i16* %382, align 2, !dbg !2913
  %383 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1, !dbg !2914
  %384 = load i32 (i8*, i32, i8*, i32, i32*)** %383, align 8, !dbg !2914
  %385 = call i32 %384(i8* %7, i32 %9, i8* %best_address.0, i32 %13, i32* %thissad), !dbg !2914
  %386 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15, !dbg !2915
  %387 = load i32* %386, align 4, !dbg !2915
  %388 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %387), !dbg !2916
  %389 = add i32 %385, %388, !dbg !2914
  ret i32 %389, !dbg !2917
}

; Function Attrs: nounwind uwtable
define i32 @vp8_full_search_sad_c(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %sad_per_bit, i32 %distance, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !2918, metadata !506), !dbg !2919
  call void @llvm.dbg.value(metadata %struct.block* %b, i64 0, metadata !2920, metadata !506), !dbg !2921
  call void @llvm.dbg.value(metadata %struct.blockd* %d, i64 0, metadata !2922, metadata !506), !dbg !2923
  call void @llvm.dbg.value(metadata %union.int_mv* %ref_mv, i64 0, metadata !2924, metadata !506), !dbg !2925
  call void @llvm.dbg.value(metadata i32 %sad_per_bit, i64 0, metadata !2926, metadata !506), !dbg !2927
  call void @llvm.dbg.value(metadata i32 %distance, i64 0, metadata !2928, metadata !506), !dbg !2929
  call void @llvm.dbg.value(metadata %struct.variance_vtable* %fn_ptr, i64 0, metadata !2930, metadata !506), !dbg !2931
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !2932, metadata !506), !dbg !2933
  call void @llvm.dbg.value(metadata %union.int_mv* %center_mv, i64 0, metadata !2934, metadata !506), !dbg !2935
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9, !dbg !2936
  %2 = load i8*** %1, align 8, !dbg !2936
  %3 = load i8** %2, align 8, !dbg !2937
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10, !dbg !2938
  %5 = load i32* %4, align 4, !dbg !2938
  %6 = sext i32 %5 to i64, !dbg !2937
  %7 = getelementptr inbounds i8* %3, i64 %6, !dbg !2937
  call void @llvm.dbg.value(metadata i8* %7, i64 0, metadata !2939, metadata !506), !dbg !2940
  %8 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !2941
  %9 = load i32* %8, align 4, !dbg !2941
  call void @llvm.dbg.value(metadata i32 %9, i64 0, metadata !2942, metadata !506), !dbg !2943
  %10 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !2944
  %11 = getelementptr inbounds %struct.macroblockd* %10, i32 0, i32 11, !dbg !2944
  %12 = getelementptr inbounds %struct.yv12_buffer_config* %11, i32 0, i32 4, !dbg !2944
  %13 = load i32* %12, align 4, !dbg !2944
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !2945, metadata !506), !dbg !2946
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !2947
  %15 = getelementptr inbounds %struct.macroblockd* %14, i32 0, i32 11, !dbg !2947
  %16 = getelementptr inbounds %struct.yv12_buffer_config* %15, i32 0, i32 13, !dbg !2947
  %17 = load i8** %16, align 8, !dbg !2947
  call void @llvm.dbg.value(metadata i8* %17, i64 0, metadata !2948, metadata !506), !dbg !2949
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !2950, metadata !506), !dbg !2951
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !2952, metadata !506), !dbg !2953
  %18 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 6, !dbg !2954
  %19 = bitcast %union.b_mode_info* %18 to %union.int_mv*, !dbg !2954
  call void @llvm.dbg.value(metadata %union.int_mv* %19, i64 0, metadata !2955, metadata !506), !dbg !2956
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !2957, metadata !506), !dbg !2958
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !2959, metadata !506), !dbg !2960
  %20 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !2961
  %21 = getelementptr inbounds %struct.MV* %20, i32 0, i32 0, !dbg !2961
  %22 = load i16* %21, align 2, !dbg !2961
  %23 = sext i16 %22 to i32, !dbg !2961
  call void @llvm.dbg.value(metadata i32 %23, i64 0, metadata !2962, metadata !506), !dbg !2963
  %24 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !2964
  %25 = getelementptr inbounds %struct.MV* %24, i32 0, i32 1, !dbg !2964
  %26 = load i16* %25, align 2, !dbg !2964
  %27 = sext i16 %26 to i32, !dbg !2964
  call void @llvm.dbg.value(metadata i32 %27, i64 0, metadata !2965, metadata !506), !dbg !2966
  %28 = sub nsw i32 %23, %distance, !dbg !2967
  call void @llvm.dbg.value(metadata i32 %28, i64 0, metadata !2968, metadata !506), !dbg !2969
  %29 = add nsw i32 %23, %distance, !dbg !2970
  call void @llvm.dbg.value(metadata i32 %29, i64 0, metadata !2971, metadata !506), !dbg !2972
  %30 = sub nsw i32 %27, %distance, !dbg !2973
  call void @llvm.dbg.value(metadata i32 %30, i64 0, metadata !2974, metadata !506), !dbg !2975
  %31 = add nsw i32 %27, %distance, !dbg !2976
  call void @llvm.dbg.value(metadata i32 %31, i64 0, metadata !2977, metadata !506), !dbg !2978
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !2979, metadata !506), !dbg !2980
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !2981, metadata !506), !dbg !2982
  %32 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !2983
  %33 = getelementptr inbounds [2 x i32*]* %32, i32 0, i64 0, !dbg !2983
  %34 = load i32** %33, align 8, !dbg !2983
  %35 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !2984
  store i32* %34, i32** %35, align 8, !dbg !2984
  %36 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !2985
  %37 = getelementptr inbounds [2 x i32*]* %36, i32 0, i64 1, !dbg !2985
  %38 = load i32** %37, align 8, !dbg !2985
  %39 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !2986
  store i32* %38, i32** %39, align 8, !dbg !2986
  %40 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !2987
  %41 = getelementptr inbounds %struct.MV* %40, i32 0, i32 0, !dbg !2987
  %42 = load i16* %41, align 2, !dbg !2987
  %43 = sext i16 %42 to i32, !dbg !2987
  %44 = ashr i32 %43, 3, !dbg !2987
  %45 = trunc i32 %44 to i16, !dbg !2987
  %46 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !2988
  %47 = getelementptr inbounds %struct.MV* %46, i32 0, i32 0, !dbg !2988
  store i16 %45, i16* %47, align 2, !dbg !2988
  %48 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !2989
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1, !dbg !2989
  %50 = load i16* %49, align 2, !dbg !2989
  %51 = sext i16 %50 to i32, !dbg !2989
  %52 = ashr i32 %51, 3, !dbg !2989
  %53 = trunc i32 %52 to i16, !dbg !2989
  %54 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !2990
  %55 = getelementptr inbounds %struct.MV* %54, i32 0, i32 1, !dbg !2990
  store i16 %53, i16* %55, align 2, !dbg !2990
  %56 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4, !dbg !2991
  %57 = load i32* %56, align 4, !dbg !2991
  %58 = sext i32 %57 to i64, !dbg !2992
  %59 = getelementptr inbounds i8* %17, i64 %58, !dbg !2992
  call void @llvm.dbg.value(metadata i8* %59, i64 0, metadata !2993, metadata !506), !dbg !2994
  %60 = mul nsw i32 %23, %13, !dbg !2995
  %61 = sext i32 %60 to i64, !dbg !2996
  %62 = getelementptr inbounds i8* %59, i64 %61, !dbg !2996
  %63 = sext i32 %27 to i64, !dbg !2996
  %64 = getelementptr inbounds i8* %62, i64 %63, !dbg !2996
  call void @llvm.dbg.value(metadata i8* %64, i64 0, metadata !2997, metadata !506), !dbg !2998
  %65 = trunc i32 %23 to i16, !dbg !2999
  %66 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3000
  %67 = getelementptr inbounds %struct.MV* %66, i32 0, i32 0, !dbg !3000
  store i16 %65, i16* %67, align 2, !dbg !3000
  %68 = trunc i32 %27 to i16, !dbg !3001
  %69 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3002
  %70 = getelementptr inbounds %struct.MV* %69, i32 0, i32 1, !dbg !3002
  store i16 %68, i16* %70, align 2, !dbg !3002
  %71 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !3003
  %72 = load i32 (i8*, i32, i8*, i32, i32)** %71, align 8, !dbg !3003
  %73 = call i32 %72(i8* %7, i32 %9, i8* %64, i32 %13, i32 -1), !dbg !3003
  %74 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3004
  %75 = call i32 @mvsad_err_cost(%union.int_mv* %19, %union.int_mv* %fcenter_mv, i32** %74, i32 %sad_per_bit), !dbg !3005
  %76 = add i32 %73, %75, !dbg !3003
  call void @llvm.dbg.value(metadata i32 %76, i64 0, metadata !3006, metadata !506), !dbg !3007
  %77 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !3008
  %78 = load i32* %77, align 4, !dbg !3008
  %79 = icmp slt i32 %30, %78, !dbg !3010
  br i1 %79, label %80, label %83, !dbg !3011

; <label>:80                                      ; preds = %0
  %81 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !3012
  %82 = load i32* %81, align 4, !dbg !3012
  call void @llvm.dbg.value(metadata i32 %82, i64 0, metadata !2974, metadata !506), !dbg !2975
  br label %83, !dbg !3013

; <label>:83                                      ; preds = %80, %0
  %col_min.0 = phi i32 [ %82, %80 ], [ %30, %0 ]
  %84 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !3014
  %85 = load i32* %84, align 4, !dbg !3014
  %86 = icmp sgt i32 %31, %85, !dbg !3016
  br i1 %86, label %87, label %90, !dbg !3017

; <label>:87                                      ; preds = %83
  %88 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !3018
  %89 = load i32* %88, align 4, !dbg !3018
  call void @llvm.dbg.value(metadata i32 %89, i64 0, metadata !2977, metadata !506), !dbg !2978
  br label %90, !dbg !3019

; <label>:90                                      ; preds = %87, %83
  %col_max.0 = phi i32 [ %89, %87 ], [ %31, %83 ]
  %91 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !3020
  %92 = load i32* %91, align 4, !dbg !3020
  %93 = icmp slt i32 %28, %92, !dbg !3022
  br i1 %93, label %94, label %97, !dbg !3023

; <label>:94                                      ; preds = %90
  %95 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !3024
  %96 = load i32* %95, align 4, !dbg !3024
  call void @llvm.dbg.value(metadata i32 %96, i64 0, metadata !2968, metadata !506), !dbg !2969
  br label %97, !dbg !3025

; <label>:97                                      ; preds = %94, %90
  %row_min.0 = phi i32 [ %96, %94 ], [ %28, %90 ]
  %98 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !3026
  %99 = load i32* %98, align 4, !dbg !3026
  %100 = icmp sgt i32 %29, %99, !dbg !3028
  br i1 %100, label %101, label %104, !dbg !3029

; <label>:101                                     ; preds = %97
  %102 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !3030
  %103 = load i32* %102, align 4, !dbg !3030
  call void @llvm.dbg.value(metadata i32 %103, i64 0, metadata !2971, metadata !506), !dbg !2972
  br label %104, !dbg !3031

; <label>:104                                     ; preds = %101, %97
  %row_max.0 = phi i32 [ %103, %101 ], [ %29, %97 ]
  call void @llvm.dbg.value(metadata i32 %row_min.0, i64 0, metadata !3032, metadata !506), !dbg !3033
  br label %105, !dbg !3034

; <label>:105                                     ; preds = %144, %104
  %bestaddress.0 = phi i8* [ %64, %104 ], [ %bestaddress.1, %144 ]
  %bestsad.0 = phi i32 [ %76, %104 ], [ %bestsad.1, %144 ]
  %r.0 = phi i32 [ %row_min.0, %104 ], [ %145, %144 ]
  %106 = icmp slt i32 %r.0, %row_max.0, !dbg !3036
  br i1 %106, label %107, label %146, !dbg !3038

; <label>:107                                     ; preds = %105
  %108 = trunc i32 %r.0 to i16, !dbg !3039
  %109 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3041
  %110 = getelementptr inbounds %struct.MV* %109, i32 0, i32 0, !dbg !3041
  store i16 %108, i16* %110, align 2, !dbg !3041
  %111 = mul nsw i32 %r.0, %13, !dbg !3042
  %112 = sext i32 %111 to i64, !dbg !3042
  %113 = getelementptr inbounds i8* %59, i64 %112, !dbg !3042
  %114 = sext i32 %col_min.0 to i64, !dbg !3042
  %115 = getelementptr inbounds i8* %113, i64 %114, !dbg !3042
  call void @llvm.dbg.value(metadata i8* %115, i64 0, metadata !3043, metadata !506), !dbg !3044
  call void @llvm.dbg.value(metadata i32 %col_min.0, i64 0, metadata !3045, metadata !506), !dbg !3046
  br label %116, !dbg !3047

; <label>:116                                     ; preds = %141, %107
  %bestaddress.1 = phi i8* [ %bestaddress.0, %107 ], [ %bestaddress.2, %141 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %107 ], [ %bestsad.2, %141 ]
  %c.0 = phi i32 [ %col_min.0, %107 ], [ %142, %141 ]
  %check_here.0 = phi i8* [ %115, %107 ], [ %140, %141 ]
  %117 = icmp slt i32 %c.0, %col_max.0, !dbg !3049
  br i1 %117, label %118, label %143, !dbg !3051

; <label>:118                                     ; preds = %116
  %119 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !3052
  %120 = load i32 (i8*, i32, i8*, i32, i32)** %119, align 8, !dbg !3052
  %121 = call i32 %120(i8* %7, i32 %9, i8* %check_here.0, i32 %13, i32 %bestsad.1), !dbg !3052
  store i32 %121, i32* %thissad, align 4, !dbg !3054
  %122 = trunc i32 %c.0 to i16, !dbg !3055
  %123 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3056
  %124 = getelementptr inbounds %struct.MV* %123, i32 0, i32 1, !dbg !3056
  store i16 %122, i16* %124, align 2, !dbg !3056
  %125 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3057
  %126 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %125, i32 %sad_per_bit), !dbg !3058
  %127 = load i32* %thissad, align 4, !dbg !3059
  %128 = add i32 %127, %126, !dbg !3059
  store i32 %128, i32* %thissad, align 4, !dbg !3059
  %129 = load i32* %thissad, align 4, !dbg !3060
  %130 = icmp ult i32 %129, %bestsad.1, !dbg !3060
  br i1 %130, label %131, label %139, !dbg !3062

; <label>:131                                     ; preds = %118
  %132 = load i32* %thissad, align 4, !dbg !3063
  call void @llvm.dbg.value(metadata i32 %132, i64 0, metadata !3006, metadata !506), !dbg !3007
  %133 = trunc i32 %r.0 to i16, !dbg !3065
  %134 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3066
  %135 = getelementptr inbounds %struct.MV* %134, i32 0, i32 0, !dbg !3066
  store i16 %133, i16* %135, align 2, !dbg !3066
  %136 = trunc i32 %c.0 to i16, !dbg !3067
  %137 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3068
  %138 = getelementptr inbounds %struct.MV* %137, i32 0, i32 1, !dbg !3068
  store i16 %136, i16* %138, align 2, !dbg !3068
  call void @llvm.dbg.value(metadata i8* %check_here.0, i64 0, metadata !2997, metadata !506), !dbg !2998
  br label %139, !dbg !3069

; <label>:139                                     ; preds = %131, %118
  %bestaddress.2 = phi i8* [ %check_here.0, %131 ], [ %bestaddress.1, %118 ]
  %bestsad.2 = phi i32 [ %132, %131 ], [ %bestsad.1, %118 ]
  %140 = getelementptr inbounds i8* %check_here.0, i32 1, !dbg !3070
  call void @llvm.dbg.value(metadata i8* %140, i64 0, metadata !3043, metadata !506), !dbg !3044
  br label %141, !dbg !3071

; <label>:141                                     ; preds = %139
  %142 = add nsw i32 %c.0, 1, !dbg !3072
  call void @llvm.dbg.value(metadata i32 %142, i64 0, metadata !3045, metadata !506), !dbg !3046
  br label %116, !dbg !3073

; <label>:143                                     ; preds = %116
  br label %144, !dbg !3074

; <label>:144                                     ; preds = %143
  %145 = add nsw i32 %r.0, 1, !dbg !3075
  call void @llvm.dbg.value(metadata i32 %145, i64 0, metadata !3032, metadata !506), !dbg !3033
  br label %105, !dbg !3076

; <label>:146                                     ; preds = %105
  %147 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3077
  %148 = getelementptr inbounds %struct.MV* %147, i32 0, i32 0, !dbg !3077
  %149 = load i16* %148, align 2, !dbg !3077
  %150 = sext i16 %149 to i32, !dbg !3077
  %151 = shl i32 %150, 3, !dbg !3077
  %152 = trunc i32 %151 to i16, !dbg !3077
  %153 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3078
  %154 = getelementptr inbounds %struct.MV* %153, i32 0, i32 0, !dbg !3078
  store i16 %152, i16* %154, align 2, !dbg !3078
  %155 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3079
  %156 = getelementptr inbounds %struct.MV* %155, i32 0, i32 1, !dbg !3079
  %157 = load i16* %156, align 2, !dbg !3079
  %158 = sext i16 %157 to i32, !dbg !3079
  %159 = shl i32 %158, 3, !dbg !3079
  %160 = trunc i32 %159 to i16, !dbg !3079
  %161 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3080
  %162 = getelementptr inbounds %struct.MV* %161, i32 0, i32 1, !dbg !3080
  store i16 %160, i16* %162, align 2, !dbg !3080
  %163 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1, !dbg !3081
  %164 = load i32 (i8*, i32, i8*, i32, i32*)** %163, align 8, !dbg !3081
  %165 = call i32 %164(i8* %7, i32 %9, i8* %bestaddress.0, i32 %13, i32* %thissad), !dbg !3081
  %166 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15, !dbg !3082
  %167 = load i32* %166, align 4, !dbg !3082
  %168 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %167), !dbg !3083
  %169 = add i32 %165, %168, !dbg !3081
  ret i32 %169, !dbg !3084
}

; Function Attrs: nounwind uwtable
define i32 @vp8_full_search_sadx3(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %sad_per_bit, i32 %distance, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %sad_array = alloca [3 x i32], align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !3085, metadata !506), !dbg !3086
  call void @llvm.dbg.value(metadata %struct.block* %b, i64 0, metadata !3087, metadata !506), !dbg !3088
  call void @llvm.dbg.value(metadata %struct.blockd* %d, i64 0, metadata !3089, metadata !506), !dbg !3090
  call void @llvm.dbg.value(metadata %union.int_mv* %ref_mv, i64 0, metadata !3091, metadata !506), !dbg !3092
  call void @llvm.dbg.value(metadata i32 %sad_per_bit, i64 0, metadata !3093, metadata !506), !dbg !3094
  call void @llvm.dbg.value(metadata i32 %distance, i64 0, metadata !3095, metadata !506), !dbg !3096
  call void @llvm.dbg.value(metadata %struct.variance_vtable* %fn_ptr, i64 0, metadata !3097, metadata !506), !dbg !3098
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !3099, metadata !506), !dbg !3100
  call void @llvm.dbg.value(metadata %union.int_mv* %center_mv, i64 0, metadata !3101, metadata !506), !dbg !3102
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9, !dbg !3103
  %2 = load i8*** %1, align 8, !dbg !3103
  %3 = load i8** %2, align 8, !dbg !3104
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10, !dbg !3105
  %5 = load i32* %4, align 4, !dbg !3105
  %6 = sext i32 %5 to i64, !dbg !3104
  %7 = getelementptr inbounds i8* %3, i64 %6, !dbg !3104
  call void @llvm.dbg.value(metadata i8* %7, i64 0, metadata !3106, metadata !506), !dbg !3107
  %8 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !3108
  %9 = load i32* %8, align 4, !dbg !3108
  call void @llvm.dbg.value(metadata i32 %9, i64 0, metadata !3109, metadata !506), !dbg !3110
  %10 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !3111
  %11 = getelementptr inbounds %struct.macroblockd* %10, i32 0, i32 11, !dbg !3111
  %12 = getelementptr inbounds %struct.yv12_buffer_config* %11, i32 0, i32 4, !dbg !3111
  %13 = load i32* %12, align 4, !dbg !3111
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !3112, metadata !506), !dbg !3113
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !3114
  %15 = getelementptr inbounds %struct.macroblockd* %14, i32 0, i32 11, !dbg !3114
  %16 = getelementptr inbounds %struct.yv12_buffer_config* %15, i32 0, i32 13, !dbg !3114
  %17 = load i8** %16, align 8, !dbg !3114
  call void @llvm.dbg.value(metadata i8* %17, i64 0, metadata !3115, metadata !506), !dbg !3116
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !3117, metadata !506), !dbg !3118
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !3119, metadata !506), !dbg !3120
  %18 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 6, !dbg !3121
  %19 = bitcast %union.b_mode_info* %18 to %union.int_mv*, !dbg !3121
  call void @llvm.dbg.value(metadata %union.int_mv* %19, i64 0, metadata !3122, metadata !506), !dbg !3123
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !3124, metadata !506), !dbg !3125
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !3126, metadata !506), !dbg !3127
  %20 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3128
  %21 = getelementptr inbounds %struct.MV* %20, i32 0, i32 0, !dbg !3128
  %22 = load i16* %21, align 2, !dbg !3128
  %23 = sext i16 %22 to i32, !dbg !3128
  call void @llvm.dbg.value(metadata i32 %23, i64 0, metadata !3129, metadata !506), !dbg !3130
  %24 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3131
  %25 = getelementptr inbounds %struct.MV* %24, i32 0, i32 1, !dbg !3131
  %26 = load i16* %25, align 2, !dbg !3131
  %27 = sext i16 %26 to i32, !dbg !3131
  call void @llvm.dbg.value(metadata i32 %27, i64 0, metadata !3132, metadata !506), !dbg !3133
  %28 = sub nsw i32 %23, %distance, !dbg !3134
  call void @llvm.dbg.value(metadata i32 %28, i64 0, metadata !3135, metadata !506), !dbg !3136
  %29 = add nsw i32 %23, %distance, !dbg !3137
  call void @llvm.dbg.value(metadata i32 %29, i64 0, metadata !3138, metadata !506), !dbg !3139
  %30 = sub nsw i32 %27, %distance, !dbg !3140
  call void @llvm.dbg.value(metadata i32 %30, i64 0, metadata !3141, metadata !506), !dbg !3142
  %31 = add nsw i32 %27, %distance, !dbg !3143
  call void @llvm.dbg.value(metadata i32 %31, i64 0, metadata !3144, metadata !506), !dbg !3145
  call void @llvm.dbg.declare(metadata [3 x i32]* %sad_array, metadata !3146, metadata !506), !dbg !3148
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !3149, metadata !506), !dbg !3150
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !3151, metadata !506), !dbg !3152
  %32 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !3153
  %33 = getelementptr inbounds [2 x i32*]* %32, i32 0, i64 0, !dbg !3153
  %34 = load i32** %33, align 8, !dbg !3153
  %35 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !3154
  store i32* %34, i32** %35, align 8, !dbg !3154
  %36 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !3155
  %37 = getelementptr inbounds [2 x i32*]* %36, i32 0, i64 1, !dbg !3155
  %38 = load i32** %37, align 8, !dbg !3155
  %39 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !3156
  store i32* %38, i32** %39, align 8, !dbg !3156
  %40 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !3157
  %41 = getelementptr inbounds %struct.MV* %40, i32 0, i32 0, !dbg !3157
  %42 = load i16* %41, align 2, !dbg !3157
  %43 = sext i16 %42 to i32, !dbg !3157
  %44 = ashr i32 %43, 3, !dbg !3157
  %45 = trunc i32 %44 to i16, !dbg !3157
  %46 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3158
  %47 = getelementptr inbounds %struct.MV* %46, i32 0, i32 0, !dbg !3158
  store i16 %45, i16* %47, align 2, !dbg !3158
  %48 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !3159
  %49 = getelementptr inbounds %struct.MV* %48, i32 0, i32 1, !dbg !3159
  %50 = load i16* %49, align 2, !dbg !3159
  %51 = sext i16 %50 to i32, !dbg !3159
  %52 = ashr i32 %51, 3, !dbg !3159
  %53 = trunc i32 %52 to i16, !dbg !3159
  %54 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3160
  %55 = getelementptr inbounds %struct.MV* %54, i32 0, i32 1, !dbg !3160
  store i16 %53, i16* %55, align 2, !dbg !3160
  %56 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4, !dbg !3161
  %57 = load i32* %56, align 4, !dbg !3161
  %58 = sext i32 %57 to i64, !dbg !3162
  %59 = getelementptr inbounds i8* %17, i64 %58, !dbg !3162
  call void @llvm.dbg.value(metadata i8* %59, i64 0, metadata !3163, metadata !506), !dbg !3164
  %60 = mul nsw i32 %23, %13, !dbg !3165
  %61 = sext i32 %60 to i64, !dbg !3166
  %62 = getelementptr inbounds i8* %59, i64 %61, !dbg !3166
  %63 = sext i32 %27 to i64, !dbg !3166
  %64 = getelementptr inbounds i8* %62, i64 %63, !dbg !3166
  call void @llvm.dbg.value(metadata i8* %64, i64 0, metadata !3167, metadata !506), !dbg !3168
  %65 = trunc i32 %23 to i16, !dbg !3169
  %66 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3170
  %67 = getelementptr inbounds %struct.MV* %66, i32 0, i32 0, !dbg !3170
  store i16 %65, i16* %67, align 2, !dbg !3170
  %68 = trunc i32 %27 to i16, !dbg !3171
  %69 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3172
  %70 = getelementptr inbounds %struct.MV* %69, i32 0, i32 1, !dbg !3172
  store i16 %68, i16* %70, align 2, !dbg !3172
  %71 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !3173
  %72 = load i32 (i8*, i32, i8*, i32, i32)** %71, align 8, !dbg !3173
  %73 = call i32 %72(i8* %7, i32 %9, i8* %64, i32 %13, i32 -1), !dbg !3173
  %74 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3174
  %75 = call i32 @mvsad_err_cost(%union.int_mv* %19, %union.int_mv* %fcenter_mv, i32** %74, i32 %sad_per_bit), !dbg !3175
  %76 = add i32 %73, %75, !dbg !3173
  call void @llvm.dbg.value(metadata i32 %76, i64 0, metadata !3176, metadata !506), !dbg !3177
  %77 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !3178
  %78 = load i32* %77, align 4, !dbg !3178
  %79 = icmp slt i32 %30, %78, !dbg !3180
  br i1 %79, label %80, label %83, !dbg !3181

; <label>:80                                      ; preds = %0
  %81 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !3182
  %82 = load i32* %81, align 4, !dbg !3182
  call void @llvm.dbg.value(metadata i32 %82, i64 0, metadata !3141, metadata !506), !dbg !3142
  br label %83, !dbg !3183

; <label>:83                                      ; preds = %80, %0
  %col_min.0 = phi i32 [ %82, %80 ], [ %30, %0 ]
  %84 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !3184
  %85 = load i32* %84, align 4, !dbg !3184
  %86 = icmp sgt i32 %31, %85, !dbg !3186
  br i1 %86, label %87, label %90, !dbg !3187

; <label>:87                                      ; preds = %83
  %88 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !3188
  %89 = load i32* %88, align 4, !dbg !3188
  call void @llvm.dbg.value(metadata i32 %89, i64 0, metadata !3144, metadata !506), !dbg !3145
  br label %90, !dbg !3189

; <label>:90                                      ; preds = %87, %83
  %col_max.0 = phi i32 [ %89, %87 ], [ %31, %83 ]
  %91 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !3190
  %92 = load i32* %91, align 4, !dbg !3190
  %93 = icmp slt i32 %28, %92, !dbg !3192
  br i1 %93, label %94, label %97, !dbg !3193

; <label>:94                                      ; preds = %90
  %95 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !3194
  %96 = load i32* %95, align 4, !dbg !3194
  call void @llvm.dbg.value(metadata i32 %96, i64 0, metadata !3135, metadata !506), !dbg !3136
  br label %97, !dbg !3195

; <label>:97                                      ; preds = %94, %90
  %row_min.0 = phi i32 [ %96, %94 ], [ %28, %90 ]
  %98 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !3196
  %99 = load i32* %98, align 4, !dbg !3196
  %100 = icmp sgt i32 %29, %99, !dbg !3198
  br i1 %100, label %101, label %104, !dbg !3199

; <label>:101                                     ; preds = %97
  %102 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !3200
  %103 = load i32* %102, align 4, !dbg !3200
  call void @llvm.dbg.value(metadata i32 %103, i64 0, metadata !3138, metadata !506), !dbg !3139
  br label %104, !dbg !3201

; <label>:104                                     ; preds = %101, %97
  %row_max.0 = phi i32 [ %103, %101 ], [ %29, %97 ]
  call void @llvm.dbg.value(metadata i32 %row_min.0, i64 0, metadata !3202, metadata !506), !dbg !3203
  br label %105, !dbg !3204

; <label>:105                                     ; preds = %188, %104
  %bestaddress.0 = phi i8* [ %64, %104 ], [ %bestaddress.5, %188 ]
  %bestsad.0 = phi i32 [ %76, %104 ], [ %bestsad.5, %188 ]
  %r.0 = phi i32 [ %row_min.0, %104 ], [ %189, %188 ]
  %106 = icmp slt i32 %r.0, %row_max.0, !dbg !3206
  br i1 %106, label %107, label %190, !dbg !3208

; <label>:107                                     ; preds = %105
  %108 = trunc i32 %r.0 to i16, !dbg !3209
  %109 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3211
  %110 = getelementptr inbounds %struct.MV* %109, i32 0, i32 0, !dbg !3211
  store i16 %108, i16* %110, align 2, !dbg !3211
  %111 = mul nsw i32 %r.0, %13, !dbg !3212
  %112 = sext i32 %111 to i64, !dbg !3212
  %113 = getelementptr inbounds i8* %59, i64 %112, !dbg !3212
  %114 = sext i32 %col_min.0 to i64, !dbg !3212
  %115 = getelementptr inbounds i8* %113, i64 %114, !dbg !3212
  call void @llvm.dbg.value(metadata i8* %115, i64 0, metadata !3213, metadata !506), !dbg !3214
  call void @llvm.dbg.value(metadata i32 %col_min.0, i64 0, metadata !3215, metadata !506), !dbg !3216
  br label %116, !dbg !3217

; <label>:116                                     ; preds = %155, %107
  %bestaddress.1 = phi i8* [ %bestaddress.0, %107 ], [ %bestaddress.2, %155 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %107 ], [ %bestsad.2, %155 ]
  %c.0 = phi i32 [ %col_min.0, %107 ], [ %c.1, %155 ]
  %check_here.0 = phi i8* [ %115, %107 ], [ %check_here.1, %155 ]
  %117 = add nsw i32 %c.0, 2, !dbg !3218
  %118 = icmp slt i32 %117, %col_max.0, !dbg !3221
  br i1 %118, label %119, label %156, !dbg !3217

; <label>:119                                     ; preds = %116
  %120 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 6, !dbg !3222
  %121 = load void (i8*, i32, i8*, i32, i32*)** %120, align 8, !dbg !3222
  %122 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i32 0, !dbg !3224
  call void %121(i8* %7, i32 %9, i8* %check_here.0, i32 %13, i32* %122), !dbg !3222
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !3225, metadata !506), !dbg !3226
  br label %123, !dbg !3227

; <label>:123                                     ; preds = %153, %119
  %bestaddress.2 = phi i8* [ %bestaddress.1, %119 ], [ %bestaddress.4, %153 ]
  %bestsad.2 = phi i32 [ %bestsad.1, %119 ], [ %bestsad.4, %153 ]
  %c.1 = phi i32 [ %c.0, %119 ], [ %152, %153 ]
  %check_here.1 = phi i8* [ %check_here.0, %119 ], [ %151, %153 ]
  %i.0 = phi i32 [ 0, %119 ], [ %154, %153 ]
  %124 = icmp slt i32 %i.0, 3, !dbg !3229
  br i1 %124, label %125, label %155, !dbg !3233

; <label>:125                                     ; preds = %123
  %126 = sext i32 %i.0 to i64, !dbg !3234
  %127 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i64 %126, !dbg !3234
  %128 = load i32* %127, align 4, !dbg !3234
  store i32 %128, i32* %thissad, align 4, !dbg !3236
  %129 = load i32* %thissad, align 4, !dbg !3237
  %130 = icmp ult i32 %129, %bestsad.2, !dbg !3237
  br i1 %130, label %131, label %150, !dbg !3239

; <label>:131                                     ; preds = %125
  %132 = trunc i32 %c.1 to i16, !dbg !3240
  %133 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3242
  %134 = getelementptr inbounds %struct.MV* %133, i32 0, i32 1, !dbg !3242
  store i16 %132, i16* %134, align 2, !dbg !3242
  %135 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3243
  %136 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %135, i32 %sad_per_bit), !dbg !3244
  %137 = load i32* %thissad, align 4, !dbg !3245
  %138 = add i32 %137, %136, !dbg !3245
  store i32 %138, i32* %thissad, align 4, !dbg !3245
  %139 = load i32* %thissad, align 4, !dbg !3246
  %140 = icmp ult i32 %139, %bestsad.2, !dbg !3246
  br i1 %140, label %141, label %149, !dbg !3248

; <label>:141                                     ; preds = %131
  %142 = load i32* %thissad, align 4, !dbg !3249
  call void @llvm.dbg.value(metadata i32 %142, i64 0, metadata !3176, metadata !506), !dbg !3177
  %143 = trunc i32 %r.0 to i16, !dbg !3251
  %144 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3252
  %145 = getelementptr inbounds %struct.MV* %144, i32 0, i32 0, !dbg !3252
  store i16 %143, i16* %145, align 2, !dbg !3252
  %146 = trunc i32 %c.1 to i16, !dbg !3253
  %147 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3254
  %148 = getelementptr inbounds %struct.MV* %147, i32 0, i32 1, !dbg !3254
  store i16 %146, i16* %148, align 2, !dbg !3254
  call void @llvm.dbg.value(metadata i8* %check_here.1, i64 0, metadata !3167, metadata !506), !dbg !3168
  br label %149, !dbg !3255

; <label>:149                                     ; preds = %141, %131
  %bestaddress.3 = phi i8* [ %check_here.1, %141 ], [ %bestaddress.2, %131 ]
  %bestsad.3 = phi i32 [ %142, %141 ], [ %bestsad.2, %131 ]
  br label %150, !dbg !3256

; <label>:150                                     ; preds = %149, %125
  %bestaddress.4 = phi i8* [ %bestaddress.3, %149 ], [ %bestaddress.2, %125 ]
  %bestsad.4 = phi i32 [ %bestsad.3, %149 ], [ %bestsad.2, %125 ]
  %151 = getelementptr inbounds i8* %check_here.1, i32 1, !dbg !3257
  call void @llvm.dbg.value(metadata i8* %151, i64 0, metadata !3213, metadata !506), !dbg !3214
  %152 = add nsw i32 %c.1, 1, !dbg !3258
  call void @llvm.dbg.value(metadata i32 %152, i64 0, metadata !3215, metadata !506), !dbg !3216
  br label %153, !dbg !3259

; <label>:153                                     ; preds = %150
  %154 = add nsw i32 %i.0, 1, !dbg !3260
  call void @llvm.dbg.value(metadata i32 %154, i64 0, metadata !3225, metadata !506), !dbg !3226
  br label %123, !dbg !3261

; <label>:155                                     ; preds = %123
  br label %116, !dbg !3217

; <label>:156                                     ; preds = %116
  br label %157, !dbg !3262

; <label>:157                                     ; preds = %184, %156
  %bestaddress.5 = phi i8* [ %bestaddress.1, %156 ], [ %bestaddress.7, %184 ]
  %bestsad.5 = phi i32 [ %bestsad.1, %156 ], [ %bestsad.7, %184 ]
  %c.2 = phi i32 [ %c.0, %156 ], [ %186, %184 ]
  %check_here.2 = phi i8* [ %check_here.0, %156 ], [ %185, %184 ]
  %158 = icmp slt i32 %c.2, %col_max.0, !dbg !3263
  br i1 %158, label %159, label %187, !dbg !3262

; <label>:159                                     ; preds = %157
  %160 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !3264
  %161 = load i32 (i8*, i32, i8*, i32, i32)** %160, align 8, !dbg !3264
  %162 = call i32 %161(i8* %7, i32 %9, i8* %check_here.2, i32 %13, i32 %bestsad.5), !dbg !3264
  store i32 %162, i32* %thissad, align 4, !dbg !3266
  %163 = load i32* %thissad, align 4, !dbg !3267
  %164 = icmp ult i32 %163, %bestsad.5, !dbg !3267
  br i1 %164, label %165, label %184, !dbg !3269

; <label>:165                                     ; preds = %159
  %166 = trunc i32 %c.2 to i16, !dbg !3270
  %167 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3272
  %168 = getelementptr inbounds %struct.MV* %167, i32 0, i32 1, !dbg !3272
  store i16 %166, i16* %168, align 2, !dbg !3272
  %169 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3273
  %170 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %169, i32 %sad_per_bit), !dbg !3274
  %171 = load i32* %thissad, align 4, !dbg !3275
  %172 = add i32 %171, %170, !dbg !3275
  store i32 %172, i32* %thissad, align 4, !dbg !3275
  %173 = load i32* %thissad, align 4, !dbg !3276
  %174 = icmp ult i32 %173, %bestsad.5, !dbg !3276
  br i1 %174, label %175, label %183, !dbg !3278

; <label>:175                                     ; preds = %165
  %176 = load i32* %thissad, align 4, !dbg !3279
  call void @llvm.dbg.value(metadata i32 %176, i64 0, metadata !3176, metadata !506), !dbg !3177
  %177 = trunc i32 %r.0 to i16, !dbg !3281
  %178 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3282
  %179 = getelementptr inbounds %struct.MV* %178, i32 0, i32 0, !dbg !3282
  store i16 %177, i16* %179, align 2, !dbg !3282
  %180 = trunc i32 %c.2 to i16, !dbg !3283
  %181 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3284
  %182 = getelementptr inbounds %struct.MV* %181, i32 0, i32 1, !dbg !3284
  store i16 %180, i16* %182, align 2, !dbg !3284
  call void @llvm.dbg.value(metadata i8* %check_here.2, i64 0, metadata !3167, metadata !506), !dbg !3168
  br label %183, !dbg !3285

; <label>:183                                     ; preds = %175, %165
  %bestaddress.6 = phi i8* [ %check_here.2, %175 ], [ %bestaddress.5, %165 ]
  %bestsad.6 = phi i32 [ %176, %175 ], [ %bestsad.5, %165 ]
  br label %184, !dbg !3286

; <label>:184                                     ; preds = %183, %159
  %bestaddress.7 = phi i8* [ %bestaddress.6, %183 ], [ %bestaddress.5, %159 ]
  %bestsad.7 = phi i32 [ %bestsad.6, %183 ], [ %bestsad.5, %159 ]
  %185 = getelementptr inbounds i8* %check_here.2, i32 1, !dbg !3287
  call void @llvm.dbg.value(metadata i8* %185, i64 0, metadata !3213, metadata !506), !dbg !3214
  %186 = add nsw i32 %c.2, 1, !dbg !3288
  call void @llvm.dbg.value(metadata i32 %186, i64 0, metadata !3215, metadata !506), !dbg !3216
  br label %157, !dbg !3262

; <label>:187                                     ; preds = %157
  br label %188, !dbg !3289

; <label>:188                                     ; preds = %187
  %189 = add nsw i32 %r.0, 1, !dbg !3290
  call void @llvm.dbg.value(metadata i32 %189, i64 0, metadata !3202, metadata !506), !dbg !3203
  br label %105, !dbg !3291

; <label>:190                                     ; preds = %105
  %191 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3292
  %192 = getelementptr inbounds %struct.MV* %191, i32 0, i32 0, !dbg !3292
  %193 = load i16* %192, align 2, !dbg !3292
  %194 = sext i16 %193 to i32, !dbg !3292
  %195 = shl i32 %194, 3, !dbg !3292
  %196 = trunc i32 %195 to i16, !dbg !3292
  %197 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3293
  %198 = getelementptr inbounds %struct.MV* %197, i32 0, i32 0, !dbg !3293
  store i16 %196, i16* %198, align 2, !dbg !3293
  %199 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3294
  %200 = getelementptr inbounds %struct.MV* %199, i32 0, i32 1, !dbg !3294
  %201 = load i16* %200, align 2, !dbg !3294
  %202 = sext i16 %201 to i32, !dbg !3294
  %203 = shl i32 %202, 3, !dbg !3294
  %204 = trunc i32 %203 to i16, !dbg !3294
  %205 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3295
  %206 = getelementptr inbounds %struct.MV* %205, i32 0, i32 1, !dbg !3295
  store i16 %204, i16* %206, align 2, !dbg !3295
  %207 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1, !dbg !3296
  %208 = load i32 (i8*, i32, i8*, i32, i32*)** %207, align 8, !dbg !3296
  %209 = call i32 %208(i8* %7, i32 %9, i8* %bestaddress.0, i32 %13, i32* %thissad), !dbg !3296
  %210 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15, !dbg !3297
  %211 = load i32* %210, align 4, !dbg !3297
  %212 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %211), !dbg !3298
  %213 = add i32 %209, %212, !dbg !3296
  ret i32 %213, !dbg !3299
}

; Function Attrs: nounwind uwtable
define i32 @vp8_full_search_sadx8(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %sad_per_bit, i32 %distance, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %sad_array8_ = alloca [17 x i16], align 16
  %sad_array = alloca [3 x i32], align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !3300, metadata !506), !dbg !3301
  call void @llvm.dbg.value(metadata %struct.block* %b, i64 0, metadata !3302, metadata !506), !dbg !3303
  call void @llvm.dbg.value(metadata %struct.blockd* %d, i64 0, metadata !3304, metadata !506), !dbg !3305
  call void @llvm.dbg.value(metadata %union.int_mv* %ref_mv, i64 0, metadata !3306, metadata !506), !dbg !3307
  call void @llvm.dbg.value(metadata i32 %sad_per_bit, i64 0, metadata !3308, metadata !506), !dbg !3309
  call void @llvm.dbg.value(metadata i32 %distance, i64 0, metadata !3310, metadata !506), !dbg !3311
  call void @llvm.dbg.value(metadata %struct.variance_vtable* %fn_ptr, i64 0, metadata !3312, metadata !506), !dbg !3313
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !3314, metadata !506), !dbg !3315
  call void @llvm.dbg.value(metadata %union.int_mv* %center_mv, i64 0, metadata !3316, metadata !506), !dbg !3317
  %1 = getelementptr inbounds %struct.block* %b, i32 0, i32 9, !dbg !3318
  %2 = load i8*** %1, align 8, !dbg !3318
  %3 = load i8** %2, align 8, !dbg !3319
  %4 = getelementptr inbounds %struct.block* %b, i32 0, i32 10, !dbg !3320
  %5 = load i32* %4, align 4, !dbg !3320
  %6 = sext i32 %5 to i64, !dbg !3319
  %7 = getelementptr inbounds i8* %3, i64 %6, !dbg !3319
  call void @llvm.dbg.value(metadata i8* %7, i64 0, metadata !3321, metadata !506), !dbg !3322
  %8 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !3323
  %9 = load i32* %8, align 4, !dbg !3323
  call void @llvm.dbg.value(metadata i32 %9, i64 0, metadata !3324, metadata !506), !dbg !3325
  %10 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !3326
  %11 = getelementptr inbounds %struct.macroblockd* %10, i32 0, i32 11, !dbg !3326
  %12 = getelementptr inbounds %struct.yv12_buffer_config* %11, i32 0, i32 4, !dbg !3326
  %13 = load i32* %12, align 4, !dbg !3326
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !3327, metadata !506), !dbg !3328
  %14 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !3329
  %15 = getelementptr inbounds %struct.macroblockd* %14, i32 0, i32 11, !dbg !3329
  %16 = getelementptr inbounds %struct.yv12_buffer_config* %15, i32 0, i32 13, !dbg !3329
  %17 = load i8** %16, align 8, !dbg !3329
  call void @llvm.dbg.value(metadata i8* %17, i64 0, metadata !3330, metadata !506), !dbg !3331
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !3332, metadata !506), !dbg !3333
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !3334, metadata !506), !dbg !3335
  %18 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 6, !dbg !3336
  %19 = bitcast %union.b_mode_info* %18 to %union.int_mv*, !dbg !3336
  call void @llvm.dbg.value(metadata %union.int_mv* %19, i64 0, metadata !3337, metadata !506), !dbg !3338
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !3339, metadata !506), !dbg !3340
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !3341, metadata !506), !dbg !3342
  %20 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3343
  %21 = getelementptr inbounds %struct.MV* %20, i32 0, i32 0, !dbg !3343
  %22 = load i16* %21, align 2, !dbg !3343
  %23 = sext i16 %22 to i32, !dbg !3343
  call void @llvm.dbg.value(metadata i32 %23, i64 0, metadata !3344, metadata !506), !dbg !3345
  %24 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3346
  %25 = getelementptr inbounds %struct.MV* %24, i32 0, i32 1, !dbg !3346
  %26 = load i16* %25, align 2, !dbg !3346
  %27 = sext i16 %26 to i32, !dbg !3346
  call void @llvm.dbg.value(metadata i32 %27, i64 0, metadata !3347, metadata !506), !dbg !3348
  %28 = sub nsw i32 %23, %distance, !dbg !3349
  call void @llvm.dbg.value(metadata i32 %28, i64 0, metadata !3350, metadata !506), !dbg !3351
  %29 = add nsw i32 %23, %distance, !dbg !3352
  call void @llvm.dbg.value(metadata i32 %29, i64 0, metadata !3353, metadata !506), !dbg !3354
  %30 = sub nsw i32 %27, %distance, !dbg !3355
  call void @llvm.dbg.value(metadata i32 %30, i64 0, metadata !3356, metadata !506), !dbg !3357
  %31 = add nsw i32 %27, %distance, !dbg !3358
  call void @llvm.dbg.value(metadata i32 %31, i64 0, metadata !3359, metadata !506), !dbg !3360
  call void @llvm.dbg.declare(metadata [17 x i16]* %sad_array8_, metadata !3361, metadata !506), !dbg !3365
  %32 = getelementptr inbounds [17 x i16]* %sad_array8_, i32 0, i32 0, !dbg !3365
  %33 = ptrtoint i16* %32 to i64, !dbg !3365
  %34 = add nsw i64 %33, 16, !dbg !3365
  %35 = sub nsw i64 %34, 1, !dbg !3365
  %36 = and i64 %35, -16, !dbg !3365
  %37 = inttoptr i64 %36 to i16*, !dbg !3365
  call void @llvm.dbg.value(metadata i16* %37, i64 0, metadata !3366, metadata !506), !dbg !3365
  call void @llvm.dbg.declare(metadata [3 x i32]* %sad_array, metadata !3367, metadata !506), !dbg !3368
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !3369, metadata !506), !dbg !3370
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !3371, metadata !506), !dbg !3372
  %38 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !3373
  %39 = getelementptr inbounds [2 x i32*]* %38, i32 0, i64 0, !dbg !3373
  %40 = load i32** %39, align 8, !dbg !3373
  %41 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !3374
  store i32* %40, i32** %41, align 8, !dbg !3374
  %42 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !3375
  %43 = getelementptr inbounds [2 x i32*]* %42, i32 0, i64 1, !dbg !3375
  %44 = load i32** %43, align 8, !dbg !3375
  %45 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !3376
  store i32* %44, i32** %45, align 8, !dbg !3376
  %46 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !3377
  %47 = getelementptr inbounds %struct.MV* %46, i32 0, i32 0, !dbg !3377
  %48 = load i16* %47, align 2, !dbg !3377
  %49 = sext i16 %48 to i32, !dbg !3377
  %50 = ashr i32 %49, 3, !dbg !3377
  %51 = trunc i32 %50 to i16, !dbg !3377
  %52 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3378
  %53 = getelementptr inbounds %struct.MV* %52, i32 0, i32 0, !dbg !3378
  store i16 %51, i16* %53, align 2, !dbg !3378
  %54 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !3379
  %55 = getelementptr inbounds %struct.MV* %54, i32 0, i32 1, !dbg !3379
  %56 = load i16* %55, align 2, !dbg !3379
  %57 = sext i16 %56 to i32, !dbg !3379
  %58 = ashr i32 %57, 3, !dbg !3379
  %59 = trunc i32 %58 to i16, !dbg !3379
  %60 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3380
  %61 = getelementptr inbounds %struct.MV* %60, i32 0, i32 1, !dbg !3380
  store i16 %59, i16* %61, align 2, !dbg !3380
  %62 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4, !dbg !3381
  %63 = load i32* %62, align 4, !dbg !3381
  %64 = sext i32 %63 to i64, !dbg !3382
  %65 = getelementptr inbounds i8* %17, i64 %64, !dbg !3382
  call void @llvm.dbg.value(metadata i8* %65, i64 0, metadata !3383, metadata !506), !dbg !3384
  %66 = mul nsw i32 %23, %13, !dbg !3385
  %67 = sext i32 %66 to i64, !dbg !3386
  %68 = getelementptr inbounds i8* %65, i64 %67, !dbg !3386
  %69 = sext i32 %27 to i64, !dbg !3386
  %70 = getelementptr inbounds i8* %68, i64 %69, !dbg !3386
  call void @llvm.dbg.value(metadata i8* %70, i64 0, metadata !3387, metadata !506), !dbg !3388
  %71 = trunc i32 %23 to i16, !dbg !3389
  %72 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3390
  %73 = getelementptr inbounds %struct.MV* %72, i32 0, i32 0, !dbg !3390
  store i16 %71, i16* %73, align 2, !dbg !3390
  %74 = trunc i32 %27 to i16, !dbg !3391
  %75 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3392
  %76 = getelementptr inbounds %struct.MV* %75, i32 0, i32 1, !dbg !3392
  store i16 %74, i16* %76, align 2, !dbg !3392
  %77 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !3393
  %78 = load i32 (i8*, i32, i8*, i32, i32)** %77, align 8, !dbg !3393
  %79 = call i32 %78(i8* %7, i32 %9, i8* %70, i32 %13, i32 -1), !dbg !3393
  %80 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3394
  %81 = call i32 @mvsad_err_cost(%union.int_mv* %19, %union.int_mv* %fcenter_mv, i32** %80, i32 %sad_per_bit), !dbg !3395
  %82 = add i32 %79, %81, !dbg !3393
  call void @llvm.dbg.value(metadata i32 %82, i64 0, metadata !3396, metadata !506), !dbg !3397
  %83 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !3398
  %84 = load i32* %83, align 4, !dbg !3398
  %85 = icmp slt i32 %30, %84, !dbg !3400
  br i1 %85, label %86, label %89, !dbg !3401

; <label>:86                                      ; preds = %0
  %87 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !3402
  %88 = load i32* %87, align 4, !dbg !3402
  call void @llvm.dbg.value(metadata i32 %88, i64 0, metadata !3356, metadata !506), !dbg !3357
  br label %89, !dbg !3403

; <label>:89                                      ; preds = %86, %0
  %col_min.0 = phi i32 [ %88, %86 ], [ %30, %0 ]
  %90 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !3404
  %91 = load i32* %90, align 4, !dbg !3404
  %92 = icmp sgt i32 %31, %91, !dbg !3406
  br i1 %92, label %93, label %96, !dbg !3407

; <label>:93                                      ; preds = %89
  %94 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !3408
  %95 = load i32* %94, align 4, !dbg !3408
  call void @llvm.dbg.value(metadata i32 %95, i64 0, metadata !3359, metadata !506), !dbg !3360
  br label %96, !dbg !3409

; <label>:96                                      ; preds = %93, %89
  %col_max.0 = phi i32 [ %95, %93 ], [ %31, %89 ]
  %97 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !3410
  %98 = load i32* %97, align 4, !dbg !3410
  %99 = icmp slt i32 %28, %98, !dbg !3412
  br i1 %99, label %100, label %103, !dbg !3413

; <label>:100                                     ; preds = %96
  %101 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !3414
  %102 = load i32* %101, align 4, !dbg !3414
  call void @llvm.dbg.value(metadata i32 %102, i64 0, metadata !3350, metadata !506), !dbg !3351
  br label %103, !dbg !3415

; <label>:103                                     ; preds = %100, %96
  %row_min.0 = phi i32 [ %102, %100 ], [ %28, %96 ]
  %104 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !3416
  %105 = load i32* %104, align 4, !dbg !3416
  %106 = icmp sgt i32 %29, %105, !dbg !3418
  br i1 %106, label %107, label %110, !dbg !3419

; <label>:107                                     ; preds = %103
  %108 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !3420
  %109 = load i32* %108, align 4, !dbg !3420
  call void @llvm.dbg.value(metadata i32 %109, i64 0, metadata !3353, metadata !506), !dbg !3354
  br label %110, !dbg !3421

; <label>:110                                     ; preds = %107, %103
  %row_max.0 = phi i32 [ %109, %107 ], [ %29, %103 ]
  call void @llvm.dbg.value(metadata i32 %row_min.0, i64 0, metadata !3422, metadata !506), !dbg !3423
  br label %111, !dbg !3424

; <label>:111                                     ; preds = %235, %110
  %bestaddress.0 = phi i8* [ %70, %110 ], [ %bestaddress.9, %235 ]
  %bestsad.0 = phi i32 [ %82, %110 ], [ %bestsad.9, %235 ]
  %r.0 = phi i32 [ %row_min.0, %110 ], [ %236, %235 ]
  %112 = icmp slt i32 %r.0, %row_max.0, !dbg !3426
  br i1 %112, label %113, label %237, !dbg !3428

; <label>:113                                     ; preds = %111
  %114 = trunc i32 %r.0 to i16, !dbg !3429
  %115 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3431
  %116 = getelementptr inbounds %struct.MV* %115, i32 0, i32 0, !dbg !3431
  store i16 %114, i16* %116, align 2, !dbg !3431
  %117 = mul nsw i32 %r.0, %13, !dbg !3432
  %118 = sext i32 %117 to i64, !dbg !3432
  %119 = getelementptr inbounds i8* %65, i64 %118, !dbg !3432
  %120 = sext i32 %col_min.0 to i64, !dbg !3432
  %121 = getelementptr inbounds i8* %119, i64 %120, !dbg !3432
  call void @llvm.dbg.value(metadata i8* %121, i64 0, metadata !3433, metadata !506), !dbg !3434
  call void @llvm.dbg.value(metadata i32 %col_min.0, i64 0, metadata !3435, metadata !506), !dbg !3436
  br label %122, !dbg !3437

; <label>:122                                     ; preds = %161, %113
  %bestaddress.1 = phi i8* [ %bestaddress.0, %113 ], [ %bestaddress.2, %161 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %113 ], [ %bestsad.2, %161 ]
  %c.0 = phi i32 [ %col_min.0, %113 ], [ %c.1, %161 ]
  %check_here.0 = phi i8* [ %121, %113 ], [ %check_here.1, %161 ]
  %123 = add nsw i32 %c.0, 7, !dbg !3438
  %124 = icmp slt i32 %123, %col_max.0, !dbg !3441
  br i1 %124, label %125, label %162, !dbg !3437

; <label>:125                                     ; preds = %122
  %126 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 7, !dbg !3442
  %127 = load void (i8*, i32, i8*, i32, i16*)** %126, align 8, !dbg !3442
  call void %127(i8* %7, i32 %9, i8* %check_here.0, i32 %13, i16* %37), !dbg !3442
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !3444, metadata !506), !dbg !3445
  br label %128, !dbg !3446

; <label>:128                                     ; preds = %159, %125
  %bestaddress.2 = phi i8* [ %bestaddress.1, %125 ], [ %bestaddress.4, %159 ]
  %bestsad.2 = phi i32 [ %bestsad.1, %125 ], [ %bestsad.4, %159 ]
  %c.1 = phi i32 [ %c.0, %125 ], [ %158, %159 ]
  %check_here.1 = phi i8* [ %check_here.0, %125 ], [ %157, %159 ]
  %i.0 = phi i32 [ 0, %125 ], [ %160, %159 ]
  %129 = icmp slt i32 %i.0, 8, !dbg !3448
  br i1 %129, label %130, label %161, !dbg !3452

; <label>:130                                     ; preds = %128
  %131 = sext i32 %i.0 to i64, !dbg !3453
  %132 = getelementptr inbounds i16* %37, i64 %131, !dbg !3453
  %133 = load i16* %132, align 2, !dbg !3453
  %134 = zext i16 %133 to i32, !dbg !3453
  store i32 %134, i32* %thissad, align 4, !dbg !3455
  %135 = load i32* %thissad, align 4, !dbg !3456
  %136 = icmp ult i32 %135, %bestsad.2, !dbg !3456
  br i1 %136, label %137, label %156, !dbg !3458

; <label>:137                                     ; preds = %130
  %138 = trunc i32 %c.1 to i16, !dbg !3459
  %139 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3461
  %140 = getelementptr inbounds %struct.MV* %139, i32 0, i32 1, !dbg !3461
  store i16 %138, i16* %140, align 2, !dbg !3461
  %141 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3462
  %142 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %141, i32 %sad_per_bit), !dbg !3463
  %143 = load i32* %thissad, align 4, !dbg !3464
  %144 = add i32 %143, %142, !dbg !3464
  store i32 %144, i32* %thissad, align 4, !dbg !3464
  %145 = load i32* %thissad, align 4, !dbg !3465
  %146 = icmp ult i32 %145, %bestsad.2, !dbg !3465
  br i1 %146, label %147, label %155, !dbg !3467

; <label>:147                                     ; preds = %137
  %148 = load i32* %thissad, align 4, !dbg !3468
  call void @llvm.dbg.value(metadata i32 %148, i64 0, metadata !3396, metadata !506), !dbg !3397
  %149 = trunc i32 %r.0 to i16, !dbg !3470
  %150 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3471
  %151 = getelementptr inbounds %struct.MV* %150, i32 0, i32 0, !dbg !3471
  store i16 %149, i16* %151, align 2, !dbg !3471
  %152 = trunc i32 %c.1 to i16, !dbg !3472
  %153 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3473
  %154 = getelementptr inbounds %struct.MV* %153, i32 0, i32 1, !dbg !3473
  store i16 %152, i16* %154, align 2, !dbg !3473
  call void @llvm.dbg.value(metadata i8* %check_here.1, i64 0, metadata !3387, metadata !506), !dbg !3388
  br label %155, !dbg !3474

; <label>:155                                     ; preds = %147, %137
  %bestaddress.3 = phi i8* [ %check_here.1, %147 ], [ %bestaddress.2, %137 ]
  %bestsad.3 = phi i32 [ %148, %147 ], [ %bestsad.2, %137 ]
  br label %156, !dbg !3475

; <label>:156                                     ; preds = %155, %130
  %bestaddress.4 = phi i8* [ %bestaddress.3, %155 ], [ %bestaddress.2, %130 ]
  %bestsad.4 = phi i32 [ %bestsad.3, %155 ], [ %bestsad.2, %130 ]
  %157 = getelementptr inbounds i8* %check_here.1, i32 1, !dbg !3476
  call void @llvm.dbg.value(metadata i8* %157, i64 0, metadata !3433, metadata !506), !dbg !3434
  %158 = add nsw i32 %c.1, 1, !dbg !3477
  call void @llvm.dbg.value(metadata i32 %158, i64 0, metadata !3435, metadata !506), !dbg !3436
  br label %159, !dbg !3478

; <label>:159                                     ; preds = %156
  %160 = add nsw i32 %i.0, 1, !dbg !3479
  call void @llvm.dbg.value(metadata i32 %160, i64 0, metadata !3444, metadata !506), !dbg !3445
  br label %128, !dbg !3480

; <label>:161                                     ; preds = %128
  br label %122, !dbg !3437

; <label>:162                                     ; preds = %122
  br label %163, !dbg !3481

; <label>:163                                     ; preds = %202, %162
  %bestaddress.5 = phi i8* [ %bestaddress.1, %162 ], [ %bestaddress.6, %202 ]
  %bestsad.5 = phi i32 [ %bestsad.1, %162 ], [ %bestsad.6, %202 ]
  %c.2 = phi i32 [ %c.0, %162 ], [ %c.3, %202 ]
  %check_here.2 = phi i8* [ %check_here.0, %162 ], [ %check_here.3, %202 ]
  %164 = add nsw i32 %c.2, 2, !dbg !3482
  %165 = icmp slt i32 %164, %col_max.0, !dbg !3483
  br i1 %165, label %166, label %203, !dbg !3481

; <label>:166                                     ; preds = %163
  %167 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 6, !dbg !3484
  %168 = load void (i8*, i32, i8*, i32, i32*)** %167, align 8, !dbg !3484
  %169 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i32 0, !dbg !3486
  call void %168(i8* %7, i32 %9, i8* %check_here.2, i32 %13, i32* %169), !dbg !3484
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !3487, metadata !506), !dbg !3488
  br label %170, !dbg !3489

; <label>:170                                     ; preds = %200, %166
  %bestaddress.6 = phi i8* [ %bestaddress.5, %166 ], [ %bestaddress.8, %200 ]
  %bestsad.6 = phi i32 [ %bestsad.5, %166 ], [ %bestsad.8, %200 ]
  %c.3 = phi i32 [ %c.2, %166 ], [ %199, %200 ]
  %check_here.3 = phi i8* [ %check_here.2, %166 ], [ %198, %200 ]
  %i1.0 = phi i32 [ 0, %166 ], [ %201, %200 ]
  %171 = icmp slt i32 %i1.0, 3, !dbg !3491
  br i1 %171, label %172, label %202, !dbg !3495

; <label>:172                                     ; preds = %170
  %173 = sext i32 %i1.0 to i64, !dbg !3496
  %174 = getelementptr inbounds [3 x i32]* %sad_array, i32 0, i64 %173, !dbg !3496
  %175 = load i32* %174, align 4, !dbg !3496
  store i32 %175, i32* %thissad, align 4, !dbg !3498
  %176 = load i32* %thissad, align 4, !dbg !3499
  %177 = icmp ult i32 %176, %bestsad.6, !dbg !3499
  br i1 %177, label %178, label %197, !dbg !3501

; <label>:178                                     ; preds = %172
  %179 = trunc i32 %c.3 to i16, !dbg !3502
  %180 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3504
  %181 = getelementptr inbounds %struct.MV* %180, i32 0, i32 1, !dbg !3504
  store i16 %179, i16* %181, align 2, !dbg !3504
  %182 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3505
  %183 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %182, i32 %sad_per_bit), !dbg !3506
  %184 = load i32* %thissad, align 4, !dbg !3507
  %185 = add i32 %184, %183, !dbg !3507
  store i32 %185, i32* %thissad, align 4, !dbg !3507
  %186 = load i32* %thissad, align 4, !dbg !3508
  %187 = icmp ult i32 %186, %bestsad.6, !dbg !3508
  br i1 %187, label %188, label %196, !dbg !3510

; <label>:188                                     ; preds = %178
  %189 = load i32* %thissad, align 4, !dbg !3511
  call void @llvm.dbg.value(metadata i32 %189, i64 0, metadata !3396, metadata !506), !dbg !3397
  %190 = trunc i32 %r.0 to i16, !dbg !3513
  %191 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3514
  %192 = getelementptr inbounds %struct.MV* %191, i32 0, i32 0, !dbg !3514
  store i16 %190, i16* %192, align 2, !dbg !3514
  %193 = trunc i32 %c.3 to i16, !dbg !3515
  %194 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3516
  %195 = getelementptr inbounds %struct.MV* %194, i32 0, i32 1, !dbg !3516
  store i16 %193, i16* %195, align 2, !dbg !3516
  call void @llvm.dbg.value(metadata i8* %check_here.3, i64 0, metadata !3387, metadata !506), !dbg !3388
  br label %196, !dbg !3517

; <label>:196                                     ; preds = %188, %178
  %bestaddress.7 = phi i8* [ %check_here.3, %188 ], [ %bestaddress.6, %178 ]
  %bestsad.7 = phi i32 [ %189, %188 ], [ %bestsad.6, %178 ]
  br label %197, !dbg !3518

; <label>:197                                     ; preds = %196, %172
  %bestaddress.8 = phi i8* [ %bestaddress.7, %196 ], [ %bestaddress.6, %172 ]
  %bestsad.8 = phi i32 [ %bestsad.7, %196 ], [ %bestsad.6, %172 ]
  %198 = getelementptr inbounds i8* %check_here.3, i32 1, !dbg !3519
  call void @llvm.dbg.value(metadata i8* %198, i64 0, metadata !3433, metadata !506), !dbg !3434
  %199 = add nsw i32 %c.3, 1, !dbg !3520
  call void @llvm.dbg.value(metadata i32 %199, i64 0, metadata !3435, metadata !506), !dbg !3436
  br label %200, !dbg !3521

; <label>:200                                     ; preds = %197
  %201 = add nsw i32 %i1.0, 1, !dbg !3522
  call void @llvm.dbg.value(metadata i32 %201, i64 0, metadata !3487, metadata !506), !dbg !3488
  br label %170, !dbg !3523

; <label>:202                                     ; preds = %170
  br label %163, !dbg !3481

; <label>:203                                     ; preds = %163
  br label %204, !dbg !3524

; <label>:204                                     ; preds = %231, %203
  %bestaddress.9 = phi i8* [ %bestaddress.5, %203 ], [ %bestaddress.11, %231 ]
  %bestsad.9 = phi i32 [ %bestsad.5, %203 ], [ %bestsad.11, %231 ]
  %c.4 = phi i32 [ %c.2, %203 ], [ %233, %231 ]
  %check_here.4 = phi i8* [ %check_here.2, %203 ], [ %232, %231 ]
  %205 = icmp slt i32 %c.4, %col_max.0, !dbg !3525
  br i1 %205, label %206, label %234, !dbg !3524

; <label>:206                                     ; preds = %204
  %207 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !3526
  %208 = load i32 (i8*, i32, i8*, i32, i32)** %207, align 8, !dbg !3526
  %209 = call i32 %208(i8* %7, i32 %9, i8* %check_here.4, i32 %13, i32 %bestsad.9), !dbg !3526
  store i32 %209, i32* %thissad, align 4, !dbg !3528
  %210 = load i32* %thissad, align 4, !dbg !3529
  %211 = icmp ult i32 %210, %bestsad.9, !dbg !3529
  br i1 %211, label %212, label %231, !dbg !3531

; <label>:212                                     ; preds = %206
  %213 = trunc i32 %c.4 to i16, !dbg !3532
  %214 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3534
  %215 = getelementptr inbounds %struct.MV* %214, i32 0, i32 1, !dbg !3534
  store i16 %213, i16* %215, align 2, !dbg !3534
  %216 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3535
  %217 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %216, i32 %sad_per_bit), !dbg !3536
  %218 = load i32* %thissad, align 4, !dbg !3537
  %219 = add i32 %218, %217, !dbg !3537
  store i32 %219, i32* %thissad, align 4, !dbg !3537
  %220 = load i32* %thissad, align 4, !dbg !3538
  %221 = icmp ult i32 %220, %bestsad.9, !dbg !3538
  br i1 %221, label %222, label %230, !dbg !3540

; <label>:222                                     ; preds = %212
  %223 = load i32* %thissad, align 4, !dbg !3541
  call void @llvm.dbg.value(metadata i32 %223, i64 0, metadata !3396, metadata !506), !dbg !3397
  %224 = trunc i32 %r.0 to i16, !dbg !3543
  %225 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3544
  %226 = getelementptr inbounds %struct.MV* %225, i32 0, i32 0, !dbg !3544
  store i16 %224, i16* %226, align 2, !dbg !3544
  %227 = trunc i32 %c.4 to i16, !dbg !3545
  %228 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3546
  %229 = getelementptr inbounds %struct.MV* %228, i32 0, i32 1, !dbg !3546
  store i16 %227, i16* %229, align 2, !dbg !3546
  call void @llvm.dbg.value(metadata i8* %check_here.4, i64 0, metadata !3387, metadata !506), !dbg !3388
  br label %230, !dbg !3547

; <label>:230                                     ; preds = %222, %212
  %bestaddress.10 = phi i8* [ %check_here.4, %222 ], [ %bestaddress.9, %212 ]
  %bestsad.10 = phi i32 [ %223, %222 ], [ %bestsad.9, %212 ]
  br label %231, !dbg !3548

; <label>:231                                     ; preds = %230, %206
  %bestaddress.11 = phi i8* [ %bestaddress.10, %230 ], [ %bestaddress.9, %206 ]
  %bestsad.11 = phi i32 [ %bestsad.10, %230 ], [ %bestsad.9, %206 ]
  %232 = getelementptr inbounds i8* %check_here.4, i32 1, !dbg !3549
  call void @llvm.dbg.value(metadata i8* %232, i64 0, metadata !3433, metadata !506), !dbg !3434
  %233 = add nsw i32 %c.4, 1, !dbg !3550
  call void @llvm.dbg.value(metadata i32 %233, i64 0, metadata !3435, metadata !506), !dbg !3436
  br label %204, !dbg !3524

; <label>:234                                     ; preds = %204
  br label %235, !dbg !3551

; <label>:235                                     ; preds = %234
  %236 = add nsw i32 %r.0, 1, !dbg !3552
  call void @llvm.dbg.value(metadata i32 %236, i64 0, metadata !3422, metadata !506), !dbg !3423
  br label %111, !dbg !3553

; <label>:237                                     ; preds = %111
  %238 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3554
  %239 = getelementptr inbounds %struct.MV* %238, i32 0, i32 0, !dbg !3554
  %240 = load i16* %239, align 2, !dbg !3554
  %241 = sext i16 %240 to i32, !dbg !3554
  %242 = mul nsw i32 %241, 8, !dbg !3554
  %243 = trunc i32 %242 to i16, !dbg !3554
  %244 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3555
  %245 = getelementptr inbounds %struct.MV* %244, i32 0, i32 0, !dbg !3555
  store i16 %243, i16* %245, align 2, !dbg !3555
  %246 = bitcast %union.int_mv* %19 to %struct.MV*, !dbg !3556
  %247 = getelementptr inbounds %struct.MV* %246, i32 0, i32 1, !dbg !3556
  %248 = load i16* %247, align 2, !dbg !3556
  %249 = sext i16 %248 to i32, !dbg !3556
  %250 = mul nsw i32 %249, 8, !dbg !3556
  %251 = trunc i32 %250 to i16, !dbg !3556
  %252 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3557
  %253 = getelementptr inbounds %struct.MV* %252, i32 0, i32 1, !dbg !3557
  store i16 %251, i16* %253, align 2, !dbg !3557
  %254 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1, !dbg !3558
  %255 = load i32 (i8*, i32, i8*, i32, i32*)** %254, align 8, !dbg !3558
  %256 = call i32 %255(i8* %7, i32 %9, i8* %bestaddress.0, i32 %13, i32* %thissad), !dbg !3558
  %257 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15, !dbg !3559
  %258 = load i32* %257, align 4, !dbg !3559
  %259 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %258), !dbg !3560
  %260 = add i32 %256, %259, !dbg !3558
  ret i32 %260, !dbg !3561
}

; Function Attrs: nounwind uwtable
define i32 @vp8_refining_search_sad_c(%struct.macroblock* %x, %struct.block* %b, %struct.blockd* %d, %union.int_mv* %ref_mv, i32 %error_per_bit, i32 %search_range, %struct.variance_vtable* %fn_ptr, i32** %mvcost, %union.int_mv* %center_mv) #0 {
  %neighbors = alloca [4 x %struct.MV], align 16
  %this_mv = alloca %union.int_mv, align 4
  %thissad = alloca i32, align 4
  %mvsadcost = alloca [2 x i32*], align 16
  %fcenter_mv = alloca %union.int_mv, align 4
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !3562, metadata !506), !dbg !3563
  call void @llvm.dbg.value(metadata %struct.block* %b, i64 0, metadata !3564, metadata !506), !dbg !3565
  call void @llvm.dbg.value(metadata %struct.blockd* %d, i64 0, metadata !3566, metadata !506), !dbg !3567
  call void @llvm.dbg.value(metadata %union.int_mv* %ref_mv, i64 0, metadata !3568, metadata !506), !dbg !3569
  call void @llvm.dbg.value(metadata i32 %error_per_bit, i64 0, metadata !3570, metadata !506), !dbg !3571
  call void @llvm.dbg.value(metadata i32 %search_range, i64 0, metadata !3572, metadata !506), !dbg !3573
  call void @llvm.dbg.value(metadata %struct.variance_vtable* %fn_ptr, i64 0, metadata !3574, metadata !506), !dbg !3575
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !3576, metadata !506), !dbg !3577
  call void @llvm.dbg.value(metadata %union.int_mv* %center_mv, i64 0, metadata !3578, metadata !506), !dbg !3579
  call void @llvm.dbg.declare(metadata [4 x %struct.MV]* %neighbors, metadata !3580, metadata !506), !dbg !3581
  %1 = bitcast [4 x %struct.MV]* %neighbors to i8*, !dbg !3581
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([4 x %struct.MV]* @vp8_refining_search_sad_c.neighbors to i8*), i64 16, i32 16, i1 false), !dbg !3581
  %2 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !3582
  %3 = load i32* %2, align 4, !dbg !3582
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !3583, metadata !506), !dbg !3584
  %4 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !3585
  %5 = getelementptr inbounds %struct.macroblockd* %4, i32 0, i32 11, !dbg !3585
  %6 = getelementptr inbounds %struct.yv12_buffer_config* %5, i32 0, i32 4, !dbg !3585
  %7 = load i32* %6, align 4, !dbg !3585
  call void @llvm.dbg.value(metadata i32 %7, i64 0, metadata !3586, metadata !506), !dbg !3587
  %8 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !3588
  %9 = getelementptr inbounds %struct.macroblockd* %8, i32 0, i32 11, !dbg !3588
  %10 = getelementptr inbounds %struct.yv12_buffer_config* %9, i32 0, i32 13, !dbg !3588
  %11 = load i8** %10, align 8, !dbg !3588
  call void @llvm.dbg.value(metadata i8* %11, i64 0, metadata !3589, metadata !506), !dbg !3590
  call void @llvm.dbg.value(metadata i32 %7, i64 0, metadata !3591, metadata !506), !dbg !3592
  %12 = getelementptr inbounds %struct.block* %b, i32 0, i32 9, !dbg !3593
  %13 = load i8*** %12, align 8, !dbg !3593
  %14 = load i8** %13, align 8, !dbg !3594
  %15 = getelementptr inbounds %struct.block* %b, i32 0, i32 10, !dbg !3595
  %16 = load i32* %15, align 4, !dbg !3595
  %17 = sext i32 %16 to i64, !dbg !3594
  %18 = getelementptr inbounds i8* %14, i64 %17, !dbg !3594
  call void @llvm.dbg.value(metadata i8* %18, i64 0, metadata !3596, metadata !506), !dbg !3597
  %19 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4, !dbg !3598
  %20 = load i32* %19, align 4, !dbg !3598
  %21 = sext i32 %20 to i64, !dbg !3599
  %22 = getelementptr inbounds i8* %11, i64 %21, !dbg !3599
  %23 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3600
  %24 = getelementptr inbounds %struct.MV* %23, i32 0, i32 0, !dbg !3600
  %25 = load i16* %24, align 2, !dbg !3600
  %26 = sext i16 %25 to i32, !dbg !3600
  %27 = mul nsw i32 %26, %7, !dbg !3600
  %28 = sext i32 %27 to i64, !dbg !3599
  %29 = getelementptr inbounds i8* %22, i64 %28, !dbg !3599
  %30 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3601
  %31 = getelementptr inbounds %struct.MV* %30, i32 0, i32 1, !dbg !3601
  %32 = load i16* %31, align 2, !dbg !3601
  %33 = sext i16 %32 to i32, !dbg !3601
  %34 = sext i32 %33 to i64, !dbg !3599
  %35 = getelementptr inbounds i8* %29, i64 %34, !dbg !3599
  call void @llvm.dbg.value(metadata i8* %35, i64 0, metadata !3602, metadata !506), !dbg !3603
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !3604, metadata !506), !dbg !3605
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !3606, metadata !506), !dbg !3607
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !3608, metadata !506), !dbg !3609
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !3610, metadata !506), !dbg !3611
  %36 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !3612
  %37 = getelementptr inbounds [2 x i32*]* %36, i32 0, i64 0, !dbg !3612
  %38 = load i32** %37, align 8, !dbg !3612
  %39 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !3613
  store i32* %38, i32** %39, align 8, !dbg !3613
  %40 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !3614
  %41 = getelementptr inbounds [2 x i32*]* %40, i32 0, i64 1, !dbg !3614
  %42 = load i32** %41, align 8, !dbg !3614
  %43 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !3615
  store i32* %42, i32** %43, align 8, !dbg !3615
  %44 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !3616
  %45 = getelementptr inbounds %struct.MV* %44, i32 0, i32 0, !dbg !3616
  %46 = load i16* %45, align 2, !dbg !3616
  %47 = sext i16 %46 to i32, !dbg !3616
  %48 = ashr i32 %47, 3, !dbg !3616
  %49 = trunc i32 %48 to i16, !dbg !3616
  %50 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3617
  %51 = getelementptr inbounds %struct.MV* %50, i32 0, i32 0, !dbg !3617
  store i16 %49, i16* %51, align 2, !dbg !3617
  %52 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !3618
  %53 = getelementptr inbounds %struct.MV* %52, i32 0, i32 1, !dbg !3618
  %54 = load i16* %53, align 2, !dbg !3618
  %55 = sext i16 %54 to i32, !dbg !3618
  %56 = ashr i32 %55, 3, !dbg !3618
  %57 = trunc i32 %56 to i16, !dbg !3618
  %58 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3619
  %59 = getelementptr inbounds %struct.MV* %58, i32 0, i32 1, !dbg !3619
  store i16 %57, i16* %59, align 2, !dbg !3619
  %60 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !3620
  %61 = load i32 (i8*, i32, i8*, i32, i32)** %60, align 8, !dbg !3620
  %62 = call i32 %61(i8* %18, i32 %3, i8* %35, i32 %7, i32 -1), !dbg !3620
  %63 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3621
  %64 = call i32 @mvsad_err_cost(%union.int_mv* %ref_mv, %union.int_mv* %fcenter_mv, i32** %63, i32 %error_per_bit), !dbg !3622
  %65 = add i32 %62, %64, !dbg !3620
  call void @llvm.dbg.value(metadata i32 %65, i64 0, metadata !3623, metadata !506), !dbg !3624
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !3625, metadata !506), !dbg !3626
  br label %66, !dbg !3627

; <label>:66                                      ; preds = %192, %0
  %i.0 = phi i32 [ 0, %0 ], [ %193, %192 ]
  %best_address.0 = phi i8* [ %35, %0 ], [ %190, %192 ]
  %bestsad.0 = phi i32 [ %65, %0 ], [ %bestsad.1, %192 ]
  %67 = icmp slt i32 %i.0, %search_range, !dbg !3629
  br i1 %67, label %68, label %194, !dbg !3631

; <label>:68                                      ; preds = %66
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !3632, metadata !506), !dbg !3634
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !3635, metadata !506), !dbg !3636
  br label %69, !dbg !3637

; <label>:69                                      ; preds = %149, %68
  %j.0 = phi i32 [ 0, %68 ], [ %150, %149 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %68 ], [ %bestsad.4, %149 ]
  %best_site.0 = phi i32 [ -1, %68 ], [ %best_site.3, %149 ]
  %70 = icmp slt i32 %j.0, 4, !dbg !3639
  br i1 %70, label %71, label %151, !dbg !3643

; <label>:71                                      ; preds = %69
  %72 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3644
  %73 = getelementptr inbounds %struct.MV* %72, i32 0, i32 0, !dbg !3644
  %74 = load i16* %73, align 2, !dbg !3644
  %75 = sext i16 %74 to i32, !dbg !3644
  %76 = sext i32 %j.0 to i64, !dbg !3646
  %77 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %76, !dbg !3646
  %78 = getelementptr inbounds %struct.MV* %77, i32 0, i32 0, !dbg !3646
  %79 = load i16* %78, align 2, !dbg !3646
  %80 = sext i16 %79 to i32, !dbg !3646
  %81 = add nsw i32 %75, %80, !dbg !3644
  %82 = trunc i32 %81 to i16, !dbg !3644
  call void @llvm.dbg.value(metadata i16 %82, i64 0, metadata !3647, metadata !506), !dbg !3648
  %83 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3649
  %84 = getelementptr inbounds %struct.MV* %83, i32 0, i32 1, !dbg !3649
  %85 = load i16* %84, align 2, !dbg !3649
  %86 = sext i16 %85 to i32, !dbg !3649
  %87 = sext i32 %j.0 to i64, !dbg !3650
  %88 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %87, !dbg !3650
  %89 = getelementptr inbounds %struct.MV* %88, i32 0, i32 1, !dbg !3650
  %90 = load i16* %89, align 2, !dbg !3650
  %91 = sext i16 %90 to i32, !dbg !3650
  %92 = add nsw i32 %86, %91, !dbg !3649
  %93 = trunc i32 %92 to i16, !dbg !3649
  call void @llvm.dbg.value(metadata i16 %93, i64 0, metadata !3651, metadata !506), !dbg !3652
  %94 = sext i16 %93 to i32, !dbg !3653
  %95 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !3655
  %96 = load i32* %95, align 4, !dbg !3655
  %97 = icmp sgt i32 %94, %96, !dbg !3653
  br i1 %97, label %98, label %148, !dbg !3656

; <label>:98                                      ; preds = %71
  %99 = sext i16 %93 to i32, !dbg !3657
  %100 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !3659
  %101 = load i32* %100, align 4, !dbg !3659
  %102 = icmp slt i32 %99, %101, !dbg !3660
  br i1 %102, label %103, label %148, !dbg !3656

; <label>:103                                     ; preds = %98
  %104 = sext i16 %82 to i32, !dbg !3661
  %105 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !3662
  %106 = load i32* %105, align 4, !dbg !3662
  %107 = icmp sgt i32 %104, %106, !dbg !3661
  br i1 %107, label %108, label %148, !dbg !3656

; <label>:108                                     ; preds = %103
  %109 = sext i16 %82 to i32, !dbg !3663
  %110 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !3664
  %111 = load i32* %110, align 4, !dbg !3664
  %112 = icmp slt i32 %109, %111, !dbg !3663
  br i1 %112, label %113, label %148, !dbg !3656

; <label>:113                                     ; preds = %108
  %114 = sext i32 %j.0 to i64, !dbg !3665
  %115 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %114, !dbg !3665
  %116 = getelementptr inbounds %struct.MV* %115, i32 0, i32 0, !dbg !3665
  %117 = load i16* %116, align 2, !dbg !3665
  %118 = sext i16 %117 to i32, !dbg !3667
  %119 = mul nsw i32 %118, %7, !dbg !3667
  %120 = sext i32 %j.0 to i64, !dbg !3668
  %121 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %120, !dbg !3668
  %122 = getelementptr inbounds %struct.MV* %121, i32 0, i32 1, !dbg !3668
  %123 = load i16* %122, align 2, !dbg !3668
  %124 = sext i16 %123 to i32, !dbg !3668
  %125 = add nsw i32 %119, %124, !dbg !3667
  %126 = sext i32 %125 to i64, !dbg !3667
  %127 = getelementptr inbounds i8* %best_address.0, i64 %126, !dbg !3667
  call void @llvm.dbg.value(metadata i8* %127, i64 0, metadata !3669, metadata !506), !dbg !3670
  %128 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !3671
  %129 = load i32 (i8*, i32, i8*, i32, i32)** %128, align 8, !dbg !3671
  %130 = call i32 %129(i8* %18, i32 %3, i8* %127, i32 %7, i32 %bestsad.1), !dbg !3671
  store i32 %130, i32* %thissad, align 4, !dbg !3672
  %131 = load i32* %thissad, align 4, !dbg !3673
  %132 = icmp ult i32 %131, %bestsad.1, !dbg !3673
  br i1 %132, label %133, label %147, !dbg !3675

; <label>:133                                     ; preds = %113
  %134 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3676
  %135 = getelementptr inbounds %struct.MV* %134, i32 0, i32 0, !dbg !3676
  store i16 %82, i16* %135, align 2, !dbg !3676
  %136 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3678
  %137 = getelementptr inbounds %struct.MV* %136, i32 0, i32 1, !dbg !3678
  store i16 %93, i16* %137, align 2, !dbg !3678
  %138 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3679
  %139 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %138, i32 %error_per_bit), !dbg !3680
  %140 = load i32* %thissad, align 4, !dbg !3681
  %141 = add i32 %140, %139, !dbg !3681
  store i32 %141, i32* %thissad, align 4, !dbg !3681
  %142 = load i32* %thissad, align 4, !dbg !3682
  %143 = icmp ult i32 %142, %bestsad.1, !dbg !3682
  br i1 %143, label %144, label %146, !dbg !3684

; <label>:144                                     ; preds = %133
  %145 = load i32* %thissad, align 4, !dbg !3685
  call void @llvm.dbg.value(metadata i32 %145, i64 0, metadata !3623, metadata !506), !dbg !3624
  call void @llvm.dbg.value(metadata i32 %j.0, i64 0, metadata !3632, metadata !506), !dbg !3634
  br label %146, !dbg !3687

; <label>:146                                     ; preds = %144, %133
  %bestsad.2 = phi i32 [ %145, %144 ], [ %bestsad.1, %133 ]
  %best_site.1 = phi i32 [ %j.0, %144 ], [ %best_site.0, %133 ]
  br label %147, !dbg !3688

; <label>:147                                     ; preds = %146, %113
  %bestsad.3 = phi i32 [ %bestsad.2, %146 ], [ %bestsad.1, %113 ]
  %best_site.2 = phi i32 [ %best_site.1, %146 ], [ %best_site.0, %113 ]
  br label %148, !dbg !3689

; <label>:148                                     ; preds = %147, %108, %103, %98, %71
  %bestsad.4 = phi i32 [ %bestsad.3, %147 ], [ %bestsad.1, %108 ], [ %bestsad.1, %103 ], [ %bestsad.1, %98 ], [ %bestsad.1, %71 ]
  %best_site.3 = phi i32 [ %best_site.2, %147 ], [ %best_site.0, %108 ], [ %best_site.0, %103 ], [ %best_site.0, %98 ], [ %best_site.0, %71 ]
  br label %149, !dbg !3690

; <label>:149                                     ; preds = %148
  %150 = add nsw i32 %j.0, 1, !dbg !3691
  call void @llvm.dbg.value(metadata i32 %150, i64 0, metadata !3635, metadata !506), !dbg !3636
  br label %69, !dbg !3692

; <label>:151                                     ; preds = %69
  %152 = icmp eq i32 %best_site.0, -1, !dbg !3693
  br i1 %152, label %153, label %154, !dbg !3695

; <label>:153                                     ; preds = %151
  br label %194, !dbg !3696

; <label>:154                                     ; preds = %151
  %155 = sext i32 %best_site.0 to i64, !dbg !3697
  %156 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %155, !dbg !3697
  %157 = getelementptr inbounds %struct.MV* %156, i32 0, i32 0, !dbg !3697
  %158 = load i16* %157, align 2, !dbg !3697
  %159 = sext i16 %158 to i32, !dbg !3697
  %160 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3699
  %161 = getelementptr inbounds %struct.MV* %160, i32 0, i32 0, !dbg !3699
  %162 = load i16* %161, align 2, !dbg !3699
  %163 = sext i16 %162 to i32, !dbg !3699
  %164 = add nsw i32 %163, %159, !dbg !3699
  %165 = trunc i32 %164 to i16, !dbg !3699
  store i16 %165, i16* %161, align 2, !dbg !3699
  %166 = sext i32 %best_site.0 to i64, !dbg !3700
  %167 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %166, !dbg !3700
  %168 = getelementptr inbounds %struct.MV* %167, i32 0, i32 1, !dbg !3700
  %169 = load i16* %168, align 2, !dbg !3700
  %170 = sext i16 %169 to i32, !dbg !3700
  %171 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3701
  %172 = getelementptr inbounds %struct.MV* %171, i32 0, i32 1, !dbg !3701
  %173 = load i16* %172, align 2, !dbg !3701
  %174 = sext i16 %173 to i32, !dbg !3701
  %175 = add nsw i32 %174, %170, !dbg !3701
  %176 = trunc i32 %175 to i16, !dbg !3701
  store i16 %176, i16* %172, align 2, !dbg !3701
  %177 = sext i32 %best_site.0 to i64, !dbg !3702
  %178 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %177, !dbg !3702
  %179 = getelementptr inbounds %struct.MV* %178, i32 0, i32 0, !dbg !3702
  %180 = load i16* %179, align 2, !dbg !3702
  %181 = sext i16 %180 to i32, !dbg !3703
  %182 = mul nsw i32 %181, %7, !dbg !3703
  %183 = sext i32 %best_site.0 to i64, !dbg !3704
  %184 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %183, !dbg !3704
  %185 = getelementptr inbounds %struct.MV* %184, i32 0, i32 1, !dbg !3704
  %186 = load i16* %185, align 2, !dbg !3704
  %187 = sext i16 %186 to i32, !dbg !3704
  %188 = add nsw i32 %182, %187, !dbg !3703
  %189 = sext i32 %188 to i64, !dbg !3705
  %190 = getelementptr inbounds i8* %best_address.0, i64 %189, !dbg !3705
  call void @llvm.dbg.value(metadata i8* %190, i64 0, metadata !3602, metadata !506), !dbg !3603
  br label %191

; <label>:191                                     ; preds = %154
  br label %192, !dbg !3706

; <label>:192                                     ; preds = %191
  %193 = add nsw i32 %i.0, 1, !dbg !3707
  call void @llvm.dbg.value(metadata i32 %193, i64 0, metadata !3625, metadata !506), !dbg !3626
  br label %66, !dbg !3708

; <label>:194                                     ; preds = %153, %66
  %195 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3709
  %196 = getelementptr inbounds %struct.MV* %195, i32 0, i32 0, !dbg !3709
  %197 = load i16* %196, align 2, !dbg !3709
  %198 = sext i16 %197 to i32, !dbg !3709
  %199 = shl i32 %198, 3, !dbg !3709
  %200 = trunc i32 %199 to i16, !dbg !3709
  %201 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3710
  %202 = getelementptr inbounds %struct.MV* %201, i32 0, i32 0, !dbg !3710
  store i16 %200, i16* %202, align 2, !dbg !3710
  %203 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3711
  %204 = getelementptr inbounds %struct.MV* %203, i32 0, i32 1, !dbg !3711
  %205 = load i16* %204, align 2, !dbg !3711
  %206 = sext i16 %205 to i32, !dbg !3711
  %207 = shl i32 %206, 3, !dbg !3711
  %208 = trunc i32 %207 to i16, !dbg !3711
  %209 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3712
  %210 = getelementptr inbounds %struct.MV* %209, i32 0, i32 1, !dbg !3712
  store i16 %208, i16* %210, align 2, !dbg !3712
  %211 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1, !dbg !3713
  %212 = load i32 (i8*, i32, i8*, i32, i32*)** %211, align 8, !dbg !3713
  %213 = call i32 %212(i8* %18, i32 %3, i8* %best_address.0, i32 %7, i32* %thissad), !dbg !3713
  %214 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15, !dbg !3714
  %215 = load i32* %214, align 4, !dbg !3714
  %216 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %215), !dbg !3715
  %217 = add i32 %213, %216, !dbg !3713
  ret i32 %217, !dbg !3716
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
  call void @llvm.dbg.value(metadata %struct.macroblock* %x, i64 0, metadata !3717, metadata !506), !dbg !3718
  call void @llvm.dbg.value(metadata %struct.block* %b, i64 0, metadata !3719, metadata !506), !dbg !3720
  call void @llvm.dbg.value(metadata %struct.blockd* %d, i64 0, metadata !3721, metadata !506), !dbg !3722
  call void @llvm.dbg.value(metadata %union.int_mv* %ref_mv, i64 0, metadata !3723, metadata !506), !dbg !3724
  call void @llvm.dbg.value(metadata i32 %error_per_bit, i64 0, metadata !3725, metadata !506), !dbg !3726
  call void @llvm.dbg.value(metadata i32 %search_range, i64 0, metadata !3727, metadata !506), !dbg !3728
  call void @llvm.dbg.value(metadata %struct.variance_vtable* %fn_ptr, i64 0, metadata !3729, metadata !506), !dbg !3730
  call void @llvm.dbg.value(metadata i32** %mvcost, i64 0, metadata !3731, metadata !506), !dbg !3732
  call void @llvm.dbg.value(metadata %union.int_mv* %center_mv, i64 0, metadata !3733, metadata !506), !dbg !3734
  call void @llvm.dbg.declare(metadata [4 x %struct.MV]* %neighbors, metadata !3735, metadata !506), !dbg !3736
  %1 = bitcast [4 x %struct.MV]* %neighbors to i8*, !dbg !3736
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([4 x %struct.MV]* @vp8_refining_search_sadx4.neighbors to i8*), i64 16, i32 16, i1 false), !dbg !3736
  %2 = getelementptr inbounds %struct.block* %b, i32 0, i32 11, !dbg !3737
  %3 = load i32* %2, align 4, !dbg !3737
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !3738, metadata !506), !dbg !3739
  %4 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !3740
  %5 = getelementptr inbounds %struct.macroblockd* %4, i32 0, i32 11, !dbg !3740
  %6 = getelementptr inbounds %struct.yv12_buffer_config* %5, i32 0, i32 4, !dbg !3740
  %7 = load i32* %6, align 4, !dbg !3740
  call void @llvm.dbg.value(metadata i32 %7, i64 0, metadata !3741, metadata !506), !dbg !3742
  %8 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 7, !dbg !3743
  %9 = getelementptr inbounds %struct.macroblockd* %8, i32 0, i32 11, !dbg !3743
  %10 = getelementptr inbounds %struct.yv12_buffer_config* %9, i32 0, i32 13, !dbg !3743
  %11 = load i8** %10, align 8, !dbg !3743
  call void @llvm.dbg.value(metadata i8* %11, i64 0, metadata !3744, metadata !506), !dbg !3745
  call void @llvm.dbg.value(metadata i32 %7, i64 0, metadata !3746, metadata !506), !dbg !3747
  %12 = getelementptr inbounds %struct.block* %b, i32 0, i32 9, !dbg !3748
  %13 = load i8*** %12, align 8, !dbg !3748
  %14 = load i8** %13, align 8, !dbg !3749
  %15 = getelementptr inbounds %struct.block* %b, i32 0, i32 10, !dbg !3750
  %16 = load i32* %15, align 4, !dbg !3750
  %17 = sext i32 %16 to i64, !dbg !3749
  %18 = getelementptr inbounds i8* %14, i64 %17, !dbg !3749
  call void @llvm.dbg.value(metadata i8* %18, i64 0, metadata !3751, metadata !506), !dbg !3752
  %19 = getelementptr inbounds %struct.blockd* %d, i32 0, i32 4, !dbg !3753
  %20 = load i32* %19, align 4, !dbg !3753
  %21 = sext i32 %20 to i64, !dbg !3754
  %22 = getelementptr inbounds i8* %11, i64 %21, !dbg !3754
  %23 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3755
  %24 = getelementptr inbounds %struct.MV* %23, i32 0, i32 0, !dbg !3755
  %25 = load i16* %24, align 2, !dbg !3755
  %26 = sext i16 %25 to i32, !dbg !3755
  %27 = mul nsw i32 %26, %7, !dbg !3755
  %28 = sext i32 %27 to i64, !dbg !3754
  %29 = getelementptr inbounds i8* %22, i64 %28, !dbg !3754
  %30 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3756
  %31 = getelementptr inbounds %struct.MV* %30, i32 0, i32 1, !dbg !3756
  %32 = load i16* %31, align 2, !dbg !3756
  %33 = sext i16 %32 to i32, !dbg !3756
  %34 = sext i32 %33 to i64, !dbg !3754
  %35 = getelementptr inbounds i8* %29, i64 %34, !dbg !3754
  call void @llvm.dbg.value(metadata i8* %35, i64 0, metadata !3757, metadata !506), !dbg !3758
  call void @llvm.dbg.declare(metadata %union.int_mv* %this_mv, metadata !3759, metadata !506), !dbg !3760
  call void @llvm.dbg.declare(metadata i32* %thissad, metadata !3761, metadata !506), !dbg !3762
  call void @llvm.dbg.declare(metadata [2 x i32*]* %mvsadcost, metadata !3763, metadata !506), !dbg !3764
  call void @llvm.dbg.declare(metadata %union.int_mv* %fcenter_mv, metadata !3765, metadata !506), !dbg !3766
  %36 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !3767
  %37 = getelementptr inbounds [2 x i32*]* %36, i32 0, i64 0, !dbg !3767
  %38 = load i32** %37, align 8, !dbg !3767
  %39 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 0, !dbg !3768
  store i32* %38, i32** %39, align 8, !dbg !3768
  %40 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 25, !dbg !3769
  %41 = getelementptr inbounds [2 x i32*]* %40, i32 0, i64 1, !dbg !3769
  %42 = load i32** %41, align 8, !dbg !3769
  %43 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i64 1, !dbg !3770
  store i32* %42, i32** %43, align 8, !dbg !3770
  %44 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !3771
  %45 = getelementptr inbounds %struct.MV* %44, i32 0, i32 0, !dbg !3771
  %46 = load i16* %45, align 2, !dbg !3771
  %47 = sext i16 %46 to i32, !dbg !3771
  %48 = ashr i32 %47, 3, !dbg !3771
  %49 = trunc i32 %48 to i16, !dbg !3771
  %50 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3772
  %51 = getelementptr inbounds %struct.MV* %50, i32 0, i32 0, !dbg !3772
  store i16 %49, i16* %51, align 2, !dbg !3772
  %52 = bitcast %union.int_mv* %center_mv to %struct.MV*, !dbg !3773
  %53 = getelementptr inbounds %struct.MV* %52, i32 0, i32 1, !dbg !3773
  %54 = load i16* %53, align 2, !dbg !3773
  %55 = sext i16 %54 to i32, !dbg !3773
  %56 = ashr i32 %55, 3, !dbg !3773
  %57 = trunc i32 %56 to i16, !dbg !3773
  %58 = bitcast %union.int_mv* %fcenter_mv to %struct.MV*, !dbg !3774
  %59 = getelementptr inbounds %struct.MV* %58, i32 0, i32 1, !dbg !3774
  store i16 %57, i16* %59, align 2, !dbg !3774
  %60 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !3775
  %61 = load i32 (i8*, i32, i8*, i32, i32)** %60, align 8, !dbg !3775
  %62 = call i32 %61(i8* %18, i32 %3, i8* %35, i32 %7, i32 -1), !dbg !3775
  %63 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3776
  %64 = call i32 @mvsad_err_cost(%union.int_mv* %ref_mv, %union.int_mv* %fcenter_mv, i32** %63, i32 %error_per_bit), !dbg !3777
  %65 = add i32 %62, %64, !dbg !3775
  call void @llvm.dbg.value(metadata i32 %65, i64 0, metadata !3778, metadata !506), !dbg !3779
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !3780, metadata !506), !dbg !3781
  br label %66, !dbg !3782

; <label>:66                                      ; preds = %304, %0
  %i.0 = phi i32 [ 0, %0 ], [ %305, %304 ]
  %best_address.0 = phi i8* [ %35, %0 ], [ %302, %304 ]
  %bestsad.0 = phi i32 [ %65, %0 ], [ %bestsad.8, %304 ]
  %67 = icmp slt i32 %i.0, %search_range, !dbg !3784
  br i1 %67, label %68, label %306, !dbg !3786

; <label>:68                                      ; preds = %66
  call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !3787, metadata !506), !dbg !3789
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !3790, metadata !506), !dbg !3791
  %69 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3792
  %70 = getelementptr inbounds %struct.MV* %69, i32 0, i32 0, !dbg !3792
  %71 = load i16* %70, align 2, !dbg !3792
  %72 = sext i16 %71 to i32, !dbg !3792
  %73 = sub nsw i32 %72, 1, !dbg !3792
  %74 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !3793
  %75 = load i32* %74, align 4, !dbg !3793
  %76 = icmp sgt i32 %73, %75, !dbg !3794
  %77 = zext i1 %76 to i32, !dbg !3794
  %78 = and i32 1, %77, !dbg !3795
  call void @llvm.dbg.value(metadata i32 %78, i64 0, metadata !3790, metadata !506), !dbg !3791
  %79 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3796
  %80 = getelementptr inbounds %struct.MV* %79, i32 0, i32 0, !dbg !3796
  %81 = load i16* %80, align 2, !dbg !3796
  %82 = sext i16 %81 to i32, !dbg !3796
  %83 = add nsw i32 %82, 1, !dbg !3796
  %84 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !3797
  %85 = load i32* %84, align 4, !dbg !3797
  %86 = icmp slt i32 %83, %85, !dbg !3798
  %87 = zext i1 %86 to i32, !dbg !3798
  %88 = and i32 %78, %87, !dbg !3799
  call void @llvm.dbg.value(metadata i32 %88, i64 0, metadata !3790, metadata !506), !dbg !3791
  %89 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3800
  %90 = getelementptr inbounds %struct.MV* %89, i32 0, i32 1, !dbg !3800
  %91 = load i16* %90, align 2, !dbg !3800
  %92 = sext i16 %91 to i32, !dbg !3800
  %93 = sub nsw i32 %92, 1, !dbg !3800
  %94 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !3801
  %95 = load i32* %94, align 4, !dbg !3801
  %96 = icmp sgt i32 %93, %95, !dbg !3802
  %97 = zext i1 %96 to i32, !dbg !3802
  %98 = and i32 %88, %97, !dbg !3803
  call void @llvm.dbg.value(metadata i32 %98, i64 0, metadata !3790, metadata !506), !dbg !3791
  %99 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3804
  %100 = getelementptr inbounds %struct.MV* %99, i32 0, i32 1, !dbg !3804
  %101 = load i16* %100, align 2, !dbg !3804
  %102 = sext i16 %101 to i32, !dbg !3804
  %103 = add nsw i32 %102, 1, !dbg !3804
  %104 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !3805
  %105 = load i32* %104, align 4, !dbg !3805
  %106 = icmp slt i32 %103, %105, !dbg !3806
  %107 = zext i1 %106 to i32, !dbg !3806
  %108 = and i32 %98, %107, !dbg !3807
  call void @llvm.dbg.value(metadata i32 %108, i64 0, metadata !3790, metadata !506), !dbg !3791
  %109 = icmp ne i32 %108, 0, !dbg !3808
  br i1 %109, label %110, label %179, !dbg !3808

; <label>:110                                     ; preds = %68
  call void @llvm.dbg.declare(metadata [4 x i32]* %sad_array, metadata !3809, metadata !506), !dbg !3812
  call void @llvm.dbg.declare(metadata [4 x i8*]* %block_offset, metadata !3813, metadata !506), !dbg !3814
  %111 = sext i32 %7 to i64, !dbg !3815
  %112 = sub i64 0, %111, !dbg !3815
  %113 = getelementptr inbounds i8* %best_address.0, i64 %112, !dbg !3815
  %114 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 0, !dbg !3816
  store i8* %113, i8** %114, align 8, !dbg !3816
  %115 = getelementptr inbounds i8* %best_address.0, i64 -1, !dbg !3817
  %116 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 1, !dbg !3818
  store i8* %115, i8** %116, align 8, !dbg !3818
  %117 = getelementptr inbounds i8* %best_address.0, i64 1, !dbg !3819
  %118 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 2, !dbg !3820
  store i8* %117, i8** %118, align 8, !dbg !3820
  %119 = sext i32 %7 to i64, !dbg !3821
  %120 = getelementptr inbounds i8* %best_address.0, i64 %119, !dbg !3821
  %121 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i64 3, !dbg !3822
  store i8* %120, i8** %121, align 8, !dbg !3822
  %122 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 8, !dbg !3823
  %123 = load void (i8*, i32, i8**, i32, i32*)** %122, align 8, !dbg !3823
  %124 = getelementptr inbounds [4 x i8*]* %block_offset, i32 0, i32 0, !dbg !3824
  %125 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i32 0, !dbg !3825
  call void %123(i8* %18, i32 %3, i8** %124, i32 %7, i32* %125), !dbg !3823
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !3826, metadata !506), !dbg !3827
  br label %126, !dbg !3828

; <label>:126                                     ; preds = %176, %110
  %j.0 = phi i32 [ 0, %110 ], [ %177, %176 ]
  %bestsad.1 = phi i32 [ %bestsad.0, %110 ], [ %bestsad.3, %176 ]
  %best_site.0 = phi i32 [ -1, %110 ], [ %best_site.2, %176 ]
  %127 = icmp slt i32 %j.0, 4, !dbg !3830
  br i1 %127, label %128, label %178, !dbg !3834

; <label>:128                                     ; preds = %126
  %129 = sext i32 %j.0 to i64, !dbg !3835
  %130 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %129, !dbg !3835
  %131 = load i32* %130, align 4, !dbg !3835
  %132 = icmp ult i32 %131, %bestsad.1, !dbg !3835
  br i1 %132, label %133, label %175, !dbg !3838

; <label>:133                                     ; preds = %128
  %134 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3839
  %135 = getelementptr inbounds %struct.MV* %134, i32 0, i32 0, !dbg !3839
  %136 = load i16* %135, align 2, !dbg !3839
  %137 = sext i16 %136 to i32, !dbg !3839
  %138 = sext i32 %j.0 to i64, !dbg !3841
  %139 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %138, !dbg !3841
  %140 = getelementptr inbounds %struct.MV* %139, i32 0, i32 0, !dbg !3841
  %141 = load i16* %140, align 2, !dbg !3841
  %142 = sext i16 %141 to i32, !dbg !3841
  %143 = add nsw i32 %137, %142, !dbg !3839
  %144 = trunc i32 %143 to i16, !dbg !3839
  %145 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3842
  %146 = getelementptr inbounds %struct.MV* %145, i32 0, i32 0, !dbg !3842
  store i16 %144, i16* %146, align 2, !dbg !3842
  %147 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3843
  %148 = getelementptr inbounds %struct.MV* %147, i32 0, i32 1, !dbg !3843
  %149 = load i16* %148, align 2, !dbg !3843
  %150 = sext i16 %149 to i32, !dbg !3843
  %151 = sext i32 %j.0 to i64, !dbg !3844
  %152 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %151, !dbg !3844
  %153 = getelementptr inbounds %struct.MV* %152, i32 0, i32 1, !dbg !3844
  %154 = load i16* %153, align 2, !dbg !3844
  %155 = sext i16 %154 to i32, !dbg !3844
  %156 = add nsw i32 %150, %155, !dbg !3843
  %157 = trunc i32 %156 to i16, !dbg !3843
  %158 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3845
  %159 = getelementptr inbounds %struct.MV* %158, i32 0, i32 1, !dbg !3845
  store i16 %157, i16* %159, align 2, !dbg !3845
  %160 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3846
  %161 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %160, i32 %error_per_bit), !dbg !3847
  %162 = sext i32 %j.0 to i64, !dbg !3848
  %163 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %162, !dbg !3848
  %164 = load i32* %163, align 4, !dbg !3848
  %165 = add i32 %164, %161, !dbg !3848
  store i32 %165, i32* %163, align 4, !dbg !3848
  %166 = sext i32 %j.0 to i64, !dbg !3849
  %167 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %166, !dbg !3849
  %168 = load i32* %167, align 4, !dbg !3849
  %169 = icmp ult i32 %168, %bestsad.1, !dbg !3849
  br i1 %169, label %170, label %174, !dbg !3851

; <label>:170                                     ; preds = %133
  %171 = sext i32 %j.0 to i64, !dbg !3852
  %172 = getelementptr inbounds [4 x i32]* %sad_array, i32 0, i64 %171, !dbg !3852
  %173 = load i32* %172, align 4, !dbg !3852
  call void @llvm.dbg.value(metadata i32 %173, i64 0, metadata !3778, metadata !506), !dbg !3779
  call void @llvm.dbg.value(metadata i32 %j.0, i64 0, metadata !3787, metadata !506), !dbg !3789
  br label %174, !dbg !3854

; <label>:174                                     ; preds = %170, %133
  %bestsad.2 = phi i32 [ %173, %170 ], [ %bestsad.1, %133 ]
  %best_site.1 = phi i32 [ %j.0, %170 ], [ %best_site.0, %133 ]
  br label %175, !dbg !3855

; <label>:175                                     ; preds = %174, %128
  %bestsad.3 = phi i32 [ %bestsad.2, %174 ], [ %bestsad.1, %128 ]
  %best_site.2 = phi i32 [ %best_site.1, %174 ], [ %best_site.0, %128 ]
  br label %176, !dbg !3856

; <label>:176                                     ; preds = %175
  %177 = add nsw i32 %j.0, 1, !dbg !3857
  call void @llvm.dbg.value(metadata i32 %177, i64 0, metadata !3826, metadata !506), !dbg !3827
  br label %126, !dbg !3858

; <label>:178                                     ; preds = %126
  br label %263, !dbg !3859

; <label>:179                                     ; preds = %68
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !3826, metadata !506), !dbg !3827
  br label %180, !dbg !3860

; <label>:180                                     ; preds = %260, %179
  %j.1 = phi i32 [ 0, %179 ], [ %261, %260 ]
  %bestsad.4 = phi i32 [ %bestsad.0, %179 ], [ %bestsad.7, %260 ]
  %best_site.3 = phi i32 [ -1, %179 ], [ %best_site.6, %260 ]
  %181 = icmp slt i32 %j.1, 4, !dbg !3863
  br i1 %181, label %182, label %262, !dbg !3867

; <label>:182                                     ; preds = %180
  %183 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3868
  %184 = getelementptr inbounds %struct.MV* %183, i32 0, i32 0, !dbg !3868
  %185 = load i16* %184, align 2, !dbg !3868
  %186 = sext i16 %185 to i32, !dbg !3868
  %187 = sext i32 %j.1 to i64, !dbg !3870
  %188 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %187, !dbg !3870
  %189 = getelementptr inbounds %struct.MV* %188, i32 0, i32 0, !dbg !3870
  %190 = load i16* %189, align 2, !dbg !3870
  %191 = sext i16 %190 to i32, !dbg !3870
  %192 = add nsw i32 %186, %191, !dbg !3868
  %193 = trunc i32 %192 to i16, !dbg !3868
  call void @llvm.dbg.value(metadata i16 %193, i64 0, metadata !3871, metadata !506), !dbg !3872
  %194 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3873
  %195 = getelementptr inbounds %struct.MV* %194, i32 0, i32 1, !dbg !3873
  %196 = load i16* %195, align 2, !dbg !3873
  %197 = sext i16 %196 to i32, !dbg !3873
  %198 = sext i32 %j.1 to i64, !dbg !3874
  %199 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %198, !dbg !3874
  %200 = getelementptr inbounds %struct.MV* %199, i32 0, i32 1, !dbg !3874
  %201 = load i16* %200, align 2, !dbg !3874
  %202 = sext i16 %201 to i32, !dbg !3874
  %203 = add nsw i32 %197, %202, !dbg !3873
  %204 = trunc i32 %203 to i16, !dbg !3873
  call void @llvm.dbg.value(metadata i16 %204, i64 0, metadata !3875, metadata !506), !dbg !3876
  %205 = sext i16 %204 to i32, !dbg !3877
  %206 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 31, !dbg !3879
  %207 = load i32* %206, align 4, !dbg !3879
  %208 = icmp sgt i32 %205, %207, !dbg !3877
  br i1 %208, label %209, label %259, !dbg !3880

; <label>:209                                     ; preds = %182
  %210 = sext i16 %204 to i32, !dbg !3881
  %211 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 32, !dbg !3883
  %212 = load i32* %211, align 4, !dbg !3883
  %213 = icmp slt i32 %210, %212, !dbg !3884
  br i1 %213, label %214, label %259, !dbg !3880

; <label>:214                                     ; preds = %209
  %215 = sext i16 %193 to i32, !dbg !3885
  %216 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 33, !dbg !3886
  %217 = load i32* %216, align 4, !dbg !3886
  %218 = icmp sgt i32 %215, %217, !dbg !3885
  br i1 %218, label %219, label %259, !dbg !3880

; <label>:219                                     ; preds = %214
  %220 = sext i16 %193 to i32, !dbg !3887
  %221 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 34, !dbg !3888
  %222 = load i32* %221, align 4, !dbg !3888
  %223 = icmp slt i32 %220, %222, !dbg !3887
  br i1 %223, label %224, label %259, !dbg !3880

; <label>:224                                     ; preds = %219
  %225 = sext i32 %j.1 to i64, !dbg !3889
  %226 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %225, !dbg !3889
  %227 = getelementptr inbounds %struct.MV* %226, i32 0, i32 0, !dbg !3889
  %228 = load i16* %227, align 2, !dbg !3889
  %229 = sext i16 %228 to i32, !dbg !3891
  %230 = mul nsw i32 %229, %7, !dbg !3891
  %231 = sext i32 %j.1 to i64, !dbg !3892
  %232 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %231, !dbg !3892
  %233 = getelementptr inbounds %struct.MV* %232, i32 0, i32 1, !dbg !3892
  %234 = load i16* %233, align 2, !dbg !3892
  %235 = sext i16 %234 to i32, !dbg !3892
  %236 = add nsw i32 %230, %235, !dbg !3891
  %237 = sext i32 %236 to i64, !dbg !3891
  %238 = getelementptr inbounds i8* %best_address.0, i64 %237, !dbg !3891
  call void @llvm.dbg.value(metadata i8* %238, i64 0, metadata !3893, metadata !506), !dbg !3894
  %239 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 0, !dbg !3895
  %240 = load i32 (i8*, i32, i8*, i32, i32)** %239, align 8, !dbg !3895
  %241 = call i32 %240(i8* %18, i32 %3, i8* %238, i32 %7, i32 %bestsad.4), !dbg !3895
  store i32 %241, i32* %thissad, align 4, !dbg !3896
  %242 = load i32* %thissad, align 4, !dbg !3897
  %243 = icmp ult i32 %242, %bestsad.4, !dbg !3897
  br i1 %243, label %244, label %258, !dbg !3899

; <label>:244                                     ; preds = %224
  %245 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3900
  %246 = getelementptr inbounds %struct.MV* %245, i32 0, i32 0, !dbg !3900
  store i16 %193, i16* %246, align 2, !dbg !3900
  %247 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3902
  %248 = getelementptr inbounds %struct.MV* %247, i32 0, i32 1, !dbg !3902
  store i16 %204, i16* %248, align 2, !dbg !3902
  %249 = getelementptr inbounds [2 x i32*]* %mvsadcost, i32 0, i32 0, !dbg !3903
  %250 = call i32 @mvsad_err_cost(%union.int_mv* %this_mv, %union.int_mv* %fcenter_mv, i32** %249, i32 %error_per_bit), !dbg !3904
  %251 = load i32* %thissad, align 4, !dbg !3905
  %252 = add i32 %251, %250, !dbg !3905
  store i32 %252, i32* %thissad, align 4, !dbg !3905
  %253 = load i32* %thissad, align 4, !dbg !3906
  %254 = icmp ult i32 %253, %bestsad.4, !dbg !3906
  br i1 %254, label %255, label %257, !dbg !3908

; <label>:255                                     ; preds = %244
  %256 = load i32* %thissad, align 4, !dbg !3909
  call void @llvm.dbg.value(metadata i32 %256, i64 0, metadata !3778, metadata !506), !dbg !3779
  call void @llvm.dbg.value(metadata i32 %j.1, i64 0, metadata !3787, metadata !506), !dbg !3789
  br label %257, !dbg !3911

; <label>:257                                     ; preds = %255, %244
  %bestsad.5 = phi i32 [ %256, %255 ], [ %bestsad.4, %244 ]
  %best_site.4 = phi i32 [ %j.1, %255 ], [ %best_site.3, %244 ]
  br label %258, !dbg !3912

; <label>:258                                     ; preds = %257, %224
  %bestsad.6 = phi i32 [ %bestsad.5, %257 ], [ %bestsad.4, %224 ]
  %best_site.5 = phi i32 [ %best_site.4, %257 ], [ %best_site.3, %224 ]
  br label %259, !dbg !3913

; <label>:259                                     ; preds = %258, %219, %214, %209, %182
  %bestsad.7 = phi i32 [ %bestsad.6, %258 ], [ %bestsad.4, %219 ], [ %bestsad.4, %214 ], [ %bestsad.4, %209 ], [ %bestsad.4, %182 ]
  %best_site.6 = phi i32 [ %best_site.5, %258 ], [ %best_site.3, %219 ], [ %best_site.3, %214 ], [ %best_site.3, %209 ], [ %best_site.3, %182 ]
  br label %260, !dbg !3914

; <label>:260                                     ; preds = %259
  %261 = add nsw i32 %j.1, 1, !dbg !3915
  call void @llvm.dbg.value(metadata i32 %261, i64 0, metadata !3826, metadata !506), !dbg !3827
  br label %180, !dbg !3916

; <label>:262                                     ; preds = %180
  br label %263

; <label>:263                                     ; preds = %262, %178
  %bestsad.8 = phi i32 [ %bestsad.1, %178 ], [ %bestsad.4, %262 ]
  %best_site.7 = phi i32 [ %best_site.0, %178 ], [ %best_site.3, %262 ]
  %264 = icmp eq i32 %best_site.7, -1, !dbg !3917
  br i1 %264, label %265, label %266, !dbg !3919

; <label>:265                                     ; preds = %263
  br label %306, !dbg !3920

; <label>:266                                     ; preds = %263
  %267 = sext i32 %best_site.7 to i64, !dbg !3921
  %268 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %267, !dbg !3921
  %269 = getelementptr inbounds %struct.MV* %268, i32 0, i32 0, !dbg !3921
  %270 = load i16* %269, align 2, !dbg !3921
  %271 = sext i16 %270 to i32, !dbg !3921
  %272 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3923
  %273 = getelementptr inbounds %struct.MV* %272, i32 0, i32 0, !dbg !3923
  %274 = load i16* %273, align 2, !dbg !3923
  %275 = sext i16 %274 to i32, !dbg !3923
  %276 = add nsw i32 %275, %271, !dbg !3923
  %277 = trunc i32 %276 to i16, !dbg !3923
  store i16 %277, i16* %273, align 2, !dbg !3923
  %278 = sext i32 %best_site.7 to i64, !dbg !3924
  %279 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %278, !dbg !3924
  %280 = getelementptr inbounds %struct.MV* %279, i32 0, i32 1, !dbg !3924
  %281 = load i16* %280, align 2, !dbg !3924
  %282 = sext i16 %281 to i32, !dbg !3924
  %283 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3925
  %284 = getelementptr inbounds %struct.MV* %283, i32 0, i32 1, !dbg !3925
  %285 = load i16* %284, align 2, !dbg !3925
  %286 = sext i16 %285 to i32, !dbg !3925
  %287 = add nsw i32 %286, %282, !dbg !3925
  %288 = trunc i32 %287 to i16, !dbg !3925
  store i16 %288, i16* %284, align 2, !dbg !3925
  %289 = sext i32 %best_site.7 to i64, !dbg !3926
  %290 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %289, !dbg !3926
  %291 = getelementptr inbounds %struct.MV* %290, i32 0, i32 0, !dbg !3926
  %292 = load i16* %291, align 2, !dbg !3926
  %293 = sext i16 %292 to i32, !dbg !3927
  %294 = mul nsw i32 %293, %7, !dbg !3927
  %295 = sext i32 %best_site.7 to i64, !dbg !3928
  %296 = getelementptr inbounds [4 x %struct.MV]* %neighbors, i32 0, i64 %295, !dbg !3928
  %297 = getelementptr inbounds %struct.MV* %296, i32 0, i32 1, !dbg !3928
  %298 = load i16* %297, align 2, !dbg !3928
  %299 = sext i16 %298 to i32, !dbg !3928
  %300 = add nsw i32 %294, %299, !dbg !3927
  %301 = sext i32 %300 to i64, !dbg !3929
  %302 = getelementptr inbounds i8* %best_address.0, i64 %301, !dbg !3929
  call void @llvm.dbg.value(metadata i8* %302, i64 0, metadata !3757, metadata !506), !dbg !3758
  br label %303

; <label>:303                                     ; preds = %266
  br label %304, !dbg !3930

; <label>:304                                     ; preds = %303
  %305 = add nsw i32 %i.0, 1, !dbg !3931
  call void @llvm.dbg.value(metadata i32 %305, i64 0, metadata !3780, metadata !506), !dbg !3781
  br label %66, !dbg !3932

; <label>:306                                     ; preds = %265, %66
  %307 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3933
  %308 = getelementptr inbounds %struct.MV* %307, i32 0, i32 0, !dbg !3933
  %309 = load i16* %308, align 2, !dbg !3933
  %310 = sext i16 %309 to i32, !dbg !3933
  %311 = mul nsw i32 %310, 8, !dbg !3933
  %312 = trunc i32 %311 to i16, !dbg !3933
  %313 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3934
  %314 = getelementptr inbounds %struct.MV* %313, i32 0, i32 0, !dbg !3934
  store i16 %312, i16* %314, align 2, !dbg !3934
  %315 = bitcast %union.int_mv* %ref_mv to %struct.MV*, !dbg !3935
  %316 = getelementptr inbounds %struct.MV* %315, i32 0, i32 1, !dbg !3935
  %317 = load i16* %316, align 2, !dbg !3935
  %318 = sext i16 %317 to i32, !dbg !3935
  %319 = mul nsw i32 %318, 8, !dbg !3935
  %320 = trunc i32 %319 to i16, !dbg !3935
  %321 = bitcast %union.int_mv* %this_mv to %struct.MV*, !dbg !3936
  %322 = getelementptr inbounds %struct.MV* %321, i32 0, i32 1, !dbg !3936
  store i16 %320, i16* %322, align 2, !dbg !3936
  %323 = getelementptr inbounds %struct.variance_vtable* %fn_ptr, i32 0, i32 1, !dbg !3937
  %324 = load i32 (i8*, i32, i8*, i32, i32*)** %323, align 8, !dbg !3937
  %325 = call i32 %324(i8* %18, i32 %3, i8* %best_address.0, i32 %7, i32* %thissad), !dbg !3937
  %326 = getelementptr inbounds %struct.macroblock* %x, i32 0, i32 15, !dbg !3938
  %327 = load i32* %326, align 4, !dbg !3938
  %328 = call i32 @mv_err_cost(%union.int_mv* %this_mv, %union.int_mv* %center_mv, i32** %mvcost, i32 %327), !dbg !3939
  %329 = add i32 %325, %328, !dbg !3937
  ret i32 %329, !dbg !3940
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

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
!522 = !MDLocation(line: 35, column: 13, scope: !68)
!523 = !MDLocation(line: 35, column: 12, scope: !68)
!524 = !MDLocation(line: 35, column: 5, scope: !68)
!525 = !{!"0x101\00x\0016777275\000", !91, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 59]
!526 = !MDLocation(line: 59, column: 49, scope: !91)
!527 = !{!"0x101\00stride\0033554491\000", !91, !69, !72} ; [ DW_TAG_arg_variable ] [stride] [line 59]
!528 = !MDLocation(line: 59, column: 56, scope: !91)
!529 = !{!"0x100\00search_site_count\0062\000", !91, !69, !72} ; [ DW_TAG_auto_variable ] [search_site_count] [line 62]
!530 = !MDLocation(line: 62, column: 9, scope: !91)
!531 = !{!"0x100\00Len\0061\000", !91, !69, !72}  ; [ DW_TAG_auto_variable ] [Len] [line 61]
!532 = !MDLocation(line: 61, column: 9, scope: !91)
!533 = !MDLocation(line: 67, column: 5, scope: !91)
!534 = !MDLocation(line: 68, column: 5, scope: !91)
!535 = !MDLocation(line: 69, column: 5, scope: !91)
!536 = !MDLocation(line: 70, column: 5, scope: !91)
!537 = !MDLocation(line: 72, column: 5, scope: !91)
!538 = !MDLocation(line: 72, column: 12, scope: !539)
!539 = !{!"0xb\002", !1, !540}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!540 = !{!"0xb\001", !1, !91}                     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!541 = !MDLocation(line: 76, column: 9, scope: !542)
!542 = !{!"0xb\0073\005\000", !1, !91}            ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!543 = !MDLocation(line: 77, column: 43, scope: !542)
!544 = !MDLocation(line: 77, column: 9, scope: !542)
!545 = !MDLocation(line: 78, column: 43, scope: !542)
!546 = !MDLocation(line: 78, column: 9, scope: !542)
!547 = !MDLocation(line: 79, column: 9, scope: !542)
!548 = !MDLocation(line: 82, column: 9, scope: !542)
!549 = !MDLocation(line: 83, column: 43, scope: !542)
!550 = !MDLocation(line: 83, column: 9, scope: !542)
!551 = !MDLocation(line: 84, column: 43, scope: !542)
!552 = !MDLocation(line: 84, column: 9, scope: !542)
!553 = !MDLocation(line: 85, column: 9, scope: !542)
!554 = !MDLocation(line: 88, column: 43, scope: !542)
!555 = !MDLocation(line: 88, column: 9, scope: !542)
!556 = !MDLocation(line: 89, column: 9, scope: !542)
!557 = !MDLocation(line: 90, column: 43, scope: !542)
!558 = !MDLocation(line: 90, column: 9, scope: !542)
!559 = !MDLocation(line: 91, column: 9, scope: !542)
!560 = !MDLocation(line: 94, column: 43, scope: !542)
!561 = !MDLocation(line: 94, column: 9, scope: !542)
!562 = !MDLocation(line: 95, column: 9, scope: !542)
!563 = !MDLocation(line: 96, column: 9, scope: !542)
!564 = !MDLocation(line: 97, column: 9, scope: !542)
!565 = !MDLocation(line: 100, column: 9, scope: !542)
!566 = !MDLocation(line: 103, column: 5, scope: !91)
!567 = !MDLocation(line: 104, column: 5, scope: !91)
!568 = !MDLocation(line: 105, column: 1, scope: !91)
!569 = !{!"0x101\00x\0016777323\000", !420, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 107]
!570 = !MDLocation(line: 107, column: 48, scope: !420)
!571 = !{!"0x101\00stride\0033554539\000", !420, !69, !72} ; [ DW_TAG_arg_variable ] [stride] [line 107]
!572 = !MDLocation(line: 107, column: 55, scope: !420)
!573 = !{!"0x100\00search_site_count\00110\000", !420, !69, !72} ; [ DW_TAG_auto_variable ] [search_site_count] [line 110]
!574 = !MDLocation(line: 110, column: 9, scope: !420)
!575 = !{!"0x100\00Len\00109\000", !420, !69, !72} ; [ DW_TAG_auto_variable ] [Len] [line 109]
!576 = !MDLocation(line: 109, column: 9, scope: !420)
!577 = !MDLocation(line: 114, column: 5, scope: !420)
!578 = !MDLocation(line: 115, column: 5, scope: !420)
!579 = !MDLocation(line: 116, column: 5, scope: !420)
!580 = !MDLocation(line: 117, column: 5, scope: !420)
!581 = !MDLocation(line: 119, column: 5, scope: !420)
!582 = !MDLocation(line: 119, column: 12, scope: !583)
!583 = !{!"0xb\002", !1, !584}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!584 = !{!"0xb\001", !1, !420}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!585 = !MDLocation(line: 123, column: 9, scope: !586)
!586 = !{!"0xb\00120\005\001", !1, !420}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!587 = !MDLocation(line: 124, column: 43, scope: !586)
!588 = !MDLocation(line: 124, column: 9, scope: !586)
!589 = !MDLocation(line: 125, column: 43, scope: !586)
!590 = !MDLocation(line: 125, column: 9, scope: !586)
!591 = !MDLocation(line: 126, column: 9, scope: !586)
!592 = !MDLocation(line: 129, column: 9, scope: !586)
!593 = !MDLocation(line: 130, column: 43, scope: !586)
!594 = !MDLocation(line: 130, column: 9, scope: !586)
!595 = !MDLocation(line: 131, column: 43, scope: !586)
!596 = !MDLocation(line: 131, column: 9, scope: !586)
!597 = !MDLocation(line: 132, column: 9, scope: !586)
!598 = !MDLocation(line: 135, column: 43, scope: !586)
!599 = !MDLocation(line: 135, column: 9, scope: !586)
!600 = !MDLocation(line: 136, column: 9, scope: !586)
!601 = !MDLocation(line: 137, column: 43, scope: !586)
!602 = !MDLocation(line: 137, column: 9, scope: !586)
!603 = !MDLocation(line: 138, column: 9, scope: !586)
!604 = !MDLocation(line: 141, column: 43, scope: !586)
!605 = !MDLocation(line: 141, column: 9, scope: !586)
!606 = !MDLocation(line: 142, column: 9, scope: !586)
!607 = !MDLocation(line: 143, column: 9, scope: !586)
!608 = !MDLocation(line: 144, column: 9, scope: !586)
!609 = !MDLocation(line: 147, column: 43, scope: !586)
!610 = !MDLocation(line: 147, column: 9, scope: !586)
!611 = !MDLocation(line: 148, column: 43, scope: !586)
!612 = !MDLocation(line: 148, column: 9, scope: !586)
!613 = !MDLocation(line: 149, column: 43, scope: !586)
!614 = !MDLocation(line: 149, column: 9, scope: !586)
!615 = !MDLocation(line: 150, column: 9, scope: !586)
!616 = !MDLocation(line: 153, column: 43, scope: !586)
!617 = !MDLocation(line: 153, column: 9, scope: !586)
!618 = !MDLocation(line: 154, column: 43, scope: !586)
!619 = !MDLocation(line: 154, column: 9, scope: !586)
!620 = !MDLocation(line: 155, column: 43, scope: !586)
!621 = !MDLocation(line: 155, column: 9, scope: !586)
!622 = !MDLocation(line: 156, column: 9, scope: !586)
!623 = !MDLocation(line: 159, column: 43, scope: !586)
!624 = !MDLocation(line: 159, column: 9, scope: !586)
!625 = !MDLocation(line: 160, column: 43, scope: !586)
!626 = !MDLocation(line: 160, column: 9, scope: !586)
!627 = !MDLocation(line: 161, column: 43, scope: !586)
!628 = !MDLocation(line: 161, column: 9, scope: !586)
!629 = !MDLocation(line: 162, column: 9, scope: !586)
!630 = !MDLocation(line: 165, column: 43, scope: !586)
!631 = !MDLocation(line: 165, column: 9, scope: !586)
!632 = !MDLocation(line: 166, column: 43, scope: !586)
!633 = !MDLocation(line: 166, column: 9, scope: !586)
!634 = !MDLocation(line: 167, column: 43, scope: !586)
!635 = !MDLocation(line: 167, column: 9, scope: !586)
!636 = !MDLocation(line: 168, column: 9, scope: !586)
!637 = !MDLocation(line: 172, column: 9, scope: !586)
!638 = !MDLocation(line: 175, column: 5, scope: !420)
!639 = !MDLocation(line: 176, column: 5, scope: !420)
!640 = !MDLocation(line: 177, column: 1, scope: !420)
!641 = !{!"0x101\00x\0016777419\000", !421, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 203]
!642 = !MDLocation(line: 203, column: 58, scope: !421)
!643 = !{!"0x101\00b\0033554635\000", !421, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 203]
!644 = !MDLocation(line: 203, column: 68, scope: !421)
!645 = !{!"0x101\00d\0050331851\000", !421, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 203]
!646 = !MDLocation(line: 203, column: 79, scope: !421)
!647 = !{!"0x101\00bestmv\0067109068\000", !421, !69, !73} ; [ DW_TAG_arg_variable ] [bestmv] [line 204]
!648 = !MDLocation(line: 204, column: 54, scope: !421)
!649 = !{!"0x101\00ref_mv\0083886284\000", !421, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 204]
!650 = !MDLocation(line: 204, column: 70, scope: !421)
!651 = !{!"0x101\00error_per_bit\00100663501\000", !421, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 205]
!652 = !MDLocation(line: 205, column: 50, scope: !421)
!653 = !{!"0x101\00vfp\00117440718\000", !421, !69, !424} ; [ DW_TAG_arg_variable ] [vfp] [line 206]
!654 = !MDLocation(line: 206, column: 75, scope: !421)
!655 = !{!"0x101\00mvcost\00134217935\000", !421, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 207]
!656 = !MDLocation(line: 207, column: 51, scope: !421)
!657 = !{!"0x101\00distortion\00150995151\000", !421, !69, !89} ; [ DW_TAG_arg_variable ] [distortion] [line 207]
!658 = !MDLocation(line: 207, column: 67, scope: !421)
!659 = !{!"0x101\00sse1\00167772368\000", !421, !69, !319} ; [ DW_TAG_arg_variable ] [sse1] [line 208]
!660 = !MDLocation(line: 208, column: 60, scope: !421)
!661 = !MDLocation(line: 210, column: 27, scope: !421)
!662 = !MDLocation(line: 210, column: 25, scope: !421)
!663 = !MDLocation(line: 210, column: 42, scope: !421)
!664 = !{!"0x100\00z\00210\000", !421, !69, !60}  ; [ DW_TAG_auto_variable ] [z] [line 210]
!665 = !MDLocation(line: 210, column: 20, scope: !421)
!666 = !MDLocation(line: 212, column: 14, scope: !421)
!667 = !{!"0x100\00rr\00212\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [rr] [line 212]
!668 = !MDLocation(line: 212, column: 9, scope: !421)
!669 = !MDLocation(line: 212, column: 43, scope: !421)
!670 = !{!"0x100\00rc\00212\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [rc] [line 212]
!671 = !MDLocation(line: 212, column: 38, scope: !421)
!672 = !MDLocation(line: 213, column: 14, scope: !421)
!673 = !{!"0x100\00br\00213\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [br] [line 213]
!674 = !MDLocation(line: 213, column: 9, scope: !421)
!675 = !MDLocation(line: 213, column: 42, scope: !421)
!676 = !{!"0x100\00bc\00213\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [bc] [line 213]
!677 = !MDLocation(line: 213, column: 37, scope: !421)
!678 = !{!"0x100\00tr\00214\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [tr] [line 214]
!679 = !MDLocation(line: 214, column: 9, scope: !421)
!680 = !{!"0x100\00tc\00214\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [tc] [line 214]
!681 = !MDLocation(line: 214, column: 18, scope: !421)
!682 = !{!"0x100\00sse\00217\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [sse] [line 217]
!683 = !MDLocation(line: 217, column: 18, scope: !421)
!684 = !{!"0x100\00halfiters\00219\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [halfiters] [line 219]
!685 = !MDLocation(line: 219, column: 18, scope: !421)
!686 = !{!"0x100\00quarteriters\00220\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [quarteriters] [line 220]
!687 = !MDLocation(line: 220, column: 18, scope: !421)
!688 = !MDLocation(line: 223, column: 16, scope: !421)
!689 = !MDLocation(line: 223, column: 16, scope: !690)
!690 = !{!"0xb\001", !1, !421}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!691 = !MDLocation(line: 223, column: 16, scope: !692)
!692 = !{!"0xb\002", !1, !421}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!693 = !{!"0x100\00minc\00223\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [minc] [line 223]
!694 = !MDLocation(line: 223, column: 9, scope: !421)
!695 = !MDLocation(line: 225, column: 16, scope: !421)
!696 = !MDLocation(line: 225, column: 16, scope: !690)
!697 = !MDLocation(line: 225, column: 16, scope: !692)
!698 = !{!"0x100\00maxc\00225\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [maxc] [line 225]
!699 = !MDLocation(line: 225, column: 9, scope: !421)
!700 = !MDLocation(line: 227, column: 16, scope: !421)
!701 = !MDLocation(line: 227, column: 16, scope: !690)
!702 = !MDLocation(line: 227, column: 16, scope: !692)
!703 = !{!"0x100\00minr\00227\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [minr] [line 227]
!704 = !MDLocation(line: 227, column: 9, scope: !421)
!705 = !MDLocation(line: 229, column: 16, scope: !421)
!706 = !MDLocation(line: 229, column: 16, scope: !690)
!707 = !MDLocation(line: 229, column: 16, scope: !692)
!708 = !{!"0x100\00maxr\00229\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [maxr] [line 229]
!709 = !MDLocation(line: 229, column: 9, scope: !421)
!710 = !MDLocation(line: 234, column: 22, scope: !421)
!711 = !{!"0x100\00pre_stride\00234\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 234]
!712 = !MDLocation(line: 234, column: 9, scope: !421)
!713 = !MDLocation(line: 235, column: 31, scope: !421)
!714 = !{!"0x100\00base_pre\00235\000", !421, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 235]
!715 = !MDLocation(line: 235, column: 20, scope: !421)
!716 = !MDLocation(line: 239, column: 23, scope: !421)
!717 = !{!"0x100\00xd\00239\000", !421, !69, !718} ; [ DW_TAG_auto_variable ] [xd] [line 239]
!718 = !{!"0xf\00\000\0064\0064\000\000", null, null, !161} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from MACROBLOCKD]
!719 = !MDLocation(line: 239, column: 18, scope: !421)
!720 = !MDLocation(line: 240, column: 37, scope: !421)
!721 = !MDLocation(line: 240, column: 26, scope: !421)
!722 = !MDLocation(line: 240, column: 50, scope: !421)
!723 = !MDLocation(line: 240, column: 49, scope: !421)
!724 = !MDLocation(line: 240, column: 84, scope: !421)
!725 = !{!"0x100\00y_0\00240\000", !421, !69, !60} ; [ DW_TAG_auto_variable ] [y_0] [line 240]
!726 = !MDLocation(line: 240, column: 20, scope: !421)
!727 = !MDLocation(line: 245, column: 16, scope: !421)
!728 = !MDLocation(line: 245, column: 41, scope: !421)
!729 = !MDLocation(line: 245, column: 15, scope: !421)
!730 = !MDLocation(line: 245, column: 14, scope: !421)
!731 = !MDLocation(line: 245, column: 57, scope: !690)
!732 = !MDLocation(line: 245, column: 77, scope: !421)
!733 = !MDLocation(line: 245, column: 57, scope: !421)
!734 = !MDLocation(line: 245, column: 14, scope: !692)
!735 = !{!"0x100\00buf_r1\00242\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [buf_r1] [line 242]
!736 = !MDLocation(line: 242, column: 9, scope: !421)
!737 = !MDLocation(line: 246, column: 16, scope: !421)
!738 = !MDLocation(line: 246, column: 41, scope: !421)
!739 = !MDLocation(line: 246, column: 15, scope: !421)
!740 = !MDLocation(line: 246, column: 14, scope: !421)
!741 = !MDLocation(line: 246, column: 57, scope: !690)
!742 = !MDLocation(line: 246, column: 73, scope: !421)
!743 = !MDLocation(line: 246, column: 57, scope: !421)
!744 = !MDLocation(line: 246, column: 14, scope: !692)
!745 = !{!"0x100\00buf_r2\00242\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [buf_r2] [line 242]
!746 = !MDLocation(line: 242, column: 17, scope: !421)
!747 = !MDLocation(line: 247, column: 16, scope: !421)
!748 = !MDLocation(line: 247, column: 41, scope: !421)
!749 = !MDLocation(line: 247, column: 15, scope: !421)
!750 = !MDLocation(line: 247, column: 14, scope: !421)
!751 = !MDLocation(line: 247, column: 57, scope: !690)
!752 = !MDLocation(line: 247, column: 77, scope: !421)
!753 = !MDLocation(line: 247, column: 57, scope: !421)
!754 = !MDLocation(line: 247, column: 14, scope: !692)
!755 = !{!"0x100\00buf_c1\00242\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [buf_c1] [line 242]
!756 = !MDLocation(line: 242, column: 25, scope: !421)
!757 = !{!"0x100\00y_stride\00232\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [y_stride] [line 232]
!758 = !MDLocation(line: 232, column: 9, scope: !421)
!759 = !MDLocation(line: 251, column: 5, scope: !421)
!760 = !MDLocation(line: 251, column: 18, scope: !421)
!761 = !MDLocation(line: 251, column: 33, scope: !421)
!762 = !MDLocation(line: 251, column: 64, scope: !421)
!763 = !MDLocation(line: 251, column: 85, scope: !421)
!764 = !MDLocation(line: 252, column: 9, scope: !421)
!765 = !MDLocation(line: 252, column: 21, scope: !421)
!766 = !{!"0x100\00y\00241\000", !421, !69, !60}  ; [ DW_TAG_auto_variable ] [y] [line 241]
!767 = !MDLocation(line: 241, column: 20, scope: !421)
!768 = !MDLocation(line: 258, column: 15, scope: !421)
!769 = !MDLocation(line: 258, column: 14, scope: !421)
!770 = !MDLocation(line: 258, column: 47, scope: !421)
!771 = !{!"0x100\00offset\00233\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [offset] [line 233]
!772 = !MDLocation(line: 233, column: 9, scope: !421)
!773 = !MDLocation(line: 261, column: 5, scope: !421)
!774 = !MDLocation(line: 262, column: 5, scope: !421)
!775 = !MDLocation(line: 265, column: 15, scope: !421)
!776 = !MDLocation(line: 265, column: 39, scope: !421)
!777 = !{!"0x100\00besterr\00215\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [besterr] [line 215]
!778 = !MDLocation(line: 215, column: 18, scope: !421)
!779 = !MDLocation(line: 266, column: 5, scope: !421)
!780 = !MDLocation(line: 267, column: 16, scope: !421)
!781 = !MDLocation(line: 267, column: 5, scope: !421)
!782 = !MDLocation(line: 272, column: 5, scope: !421)
!783 = !MDLocation(line: 272, column: 12, scope: !784)
!784 = !{!"0xb\002", !1, !690}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!785 = !MDLocation(line: 275, column: 9, scope: !786)
!786 = !{!"0xb\00275\009\003", !1, !787}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!787 = !{!"0xb\00273\005\002", !1, !421}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!788 = !MDLocation(line: 275, column: 9, scope: !787)
!789 = !MDLocation(line: 275, column: 9, scope: !790)
!790 = !{!"0xb\001", !1, !786}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!791 = !MDLocation(line: 275, column: 9, scope: !792)
!792 = !{!"0xb\003", !1, !786}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!793 = !MDLocation(line: 275, column: 9, scope: !794)
!794 = !{!"0xb\005", !1, !786}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!795 = !MDLocation(line: 275, column: 9, scope: !796)
!796 = !{!"0xb\007", !1, !797}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!797 = !{!"0xb\00275\009\004", !1, !786}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!798 = !{!"0x100\00thismse\00221\000", !421, !69, !72} ; [ DW_TAG_auto_variable ] [thismse] [line 221]
!799 = !MDLocation(line: 221, column: 9, scope: !421)
!800 = !MDLocation(line: 275, column: 9, scope: !801)
!801 = !{!"0xb\00275\009\005", !1, !797}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!802 = !MDLocation(line: 275, column: 9, scope: !803)
!803 = !{!"0xb\009", !1, !801}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!804 = !MDLocation(line: 275, column: 9, scope: !805)
!805 = !{!"0xb\0010", !1, !801}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!806 = !MDLocation(line: 275, column: 9, scope: !807)
!807 = !{!"0xb\0012", !1, !808}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!808 = !{!"0xb\0011", !1, !801}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!809 = !{!"0x100\00left\00216\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [left] [line 216]
!810 = !MDLocation(line: 216, column: 18, scope: !421)
!811 = !MDLocation(line: 275, column: 9, scope: !797)
!812 = !MDLocation(line: 275, column: 9, scope: !813)
!813 = !{!"0xb\0013", !1, !814}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!814 = !{!"0xb\00275\009\006", !1, !801}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!815 = !MDLocation(line: 275, column: 9, scope: !816)
!816 = !{!"0xb\0015", !1, !817}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!817 = !{!"0xb\0014", !1, !797}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!818 = !MDLocation(line: 276, column: 9, scope: !819)
!819 = !{!"0xb\00276\009\007", !1, !787}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!820 = !MDLocation(line: 276, column: 9, scope: !787)
!821 = !MDLocation(line: 276, column: 9, scope: !822)
!822 = !{!"0xb\001", !1, !819}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!823 = !MDLocation(line: 276, column: 9, scope: !824)
!824 = !{!"0xb\003", !1, !819}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!825 = !MDLocation(line: 276, column: 9, scope: !826)
!826 = !{!"0xb\005", !1, !819}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!827 = !MDLocation(line: 276, column: 9, scope: !828)
!828 = !{!"0xb\007", !1, !829}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!829 = !{!"0xb\00276\009\008", !1, !819}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!830 = !MDLocation(line: 276, column: 9, scope: !831)
!831 = !{!"0xb\00276\009\009", !1, !829}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!832 = !MDLocation(line: 276, column: 9, scope: !833)
!833 = !{!"0xb\009", !1, !831}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!834 = !MDLocation(line: 276, column: 9, scope: !835)
!835 = !{!"0xb\0010", !1, !831}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!836 = !MDLocation(line: 276, column: 9, scope: !837)
!837 = !{!"0xb\0012", !1, !838}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!838 = !{!"0xb\0011", !1, !831}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!839 = !{!"0x100\00right\00216\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [right] [line 216]
!840 = !MDLocation(line: 216, column: 24, scope: !421)
!841 = !MDLocation(line: 276, column: 9, scope: !829)
!842 = !MDLocation(line: 276, column: 9, scope: !843)
!843 = !{!"0xb\0013", !1, !844}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!844 = !{!"0xb\00276\009\0010", !1, !831}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!845 = !MDLocation(line: 276, column: 9, scope: !846)
!846 = !{!"0xb\0015", !1, !847}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!847 = !{!"0xb\0014", !1, !829}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!848 = !MDLocation(line: 277, column: 9, scope: !849)
!849 = !{!"0xb\00277\009\0011", !1, !787}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!850 = !MDLocation(line: 277, column: 9, scope: !787)
!851 = !MDLocation(line: 277, column: 9, scope: !852)
!852 = !{!"0xb\001", !1, !849}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!853 = !MDLocation(line: 277, column: 9, scope: !854)
!854 = !{!"0xb\003", !1, !849}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!855 = !MDLocation(line: 277, column: 9, scope: !856)
!856 = !{!"0xb\005", !1, !849}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!857 = !MDLocation(line: 277, column: 9, scope: !858)
!858 = !{!"0xb\007", !1, !859}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!859 = !{!"0xb\00277\009\0012", !1, !849}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!860 = !MDLocation(line: 277, column: 9, scope: !861)
!861 = !{!"0xb\00277\009\0013", !1, !859}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!862 = !MDLocation(line: 277, column: 9, scope: !863)
!863 = !{!"0xb\009", !1, !861}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!864 = !MDLocation(line: 277, column: 9, scope: !865)
!865 = !{!"0xb\0010", !1, !861}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!866 = !MDLocation(line: 277, column: 9, scope: !867)
!867 = !{!"0xb\0012", !1, !868}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!868 = !{!"0xb\0011", !1, !861}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!869 = !{!"0x100\00up\00216\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [up] [line 216]
!870 = !MDLocation(line: 216, column: 31, scope: !421)
!871 = !MDLocation(line: 277, column: 9, scope: !859)
!872 = !MDLocation(line: 277, column: 9, scope: !873)
!873 = !{!"0xb\0013", !1, !874}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!874 = !{!"0xb\00277\009\0014", !1, !861}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!875 = !MDLocation(line: 277, column: 9, scope: !876)
!876 = !{!"0xb\0015", !1, !877}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!877 = !{!"0xb\0014", !1, !859}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!878 = !MDLocation(line: 278, column: 9, scope: !879)
!879 = !{!"0xb\00278\009\0015", !1, !787}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!880 = !MDLocation(line: 278, column: 9, scope: !787)
!881 = !MDLocation(line: 278, column: 9, scope: !882)
!882 = !{!"0xb\001", !1, !879}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!883 = !MDLocation(line: 278, column: 9, scope: !884)
!884 = !{!"0xb\003", !1, !879}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!885 = !MDLocation(line: 278, column: 9, scope: !886)
!886 = !{!"0xb\005", !1, !879}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!887 = !MDLocation(line: 278, column: 9, scope: !888)
!888 = !{!"0xb\007", !1, !889}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!889 = !{!"0xb\00278\009\0016", !1, !879}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!890 = !MDLocation(line: 278, column: 9, scope: !891)
!891 = !{!"0xb\00278\009\0017", !1, !889}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!892 = !MDLocation(line: 278, column: 9, scope: !893)
!893 = !{!"0xb\009", !1, !891}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!894 = !MDLocation(line: 278, column: 9, scope: !895)
!895 = !{!"0xb\0010", !1, !891}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!896 = !MDLocation(line: 278, column: 9, scope: !897)
!897 = !{!"0xb\0012", !1, !898}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!898 = !{!"0xb\0011", !1, !891}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!899 = !{!"0x100\00down\00216\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [down] [line 216]
!900 = !MDLocation(line: 216, column: 35, scope: !421)
!901 = !MDLocation(line: 278, column: 9, scope: !889)
!902 = !MDLocation(line: 278, column: 9, scope: !903)
!903 = !{!"0xb\0013", !1, !904}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!904 = !{!"0xb\00278\009\0018", !1, !891}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!905 = !MDLocation(line: 278, column: 9, scope: !906)
!906 = !{!"0xb\0015", !1, !907}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!907 = !{!"0xb\0014", !1, !889}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!908 = !MDLocation(line: 280, column: 21, scope: !787)
!909 = !MDLocation(line: 280, column: 46, scope: !787)
!910 = !MDLocation(line: 280, column: 20, scope: !787)
!911 = !{!"0x100\00whichdir\00218\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [whichdir] [line 218]
!912 = !MDLocation(line: 218, column: 18, scope: !421)
!913 = !MDLocation(line: 282, column: 9, scope: !787)
!914 = !MDLocation(line: 285, column: 13, scope: !915)
!915 = !{!"0xb\00285\0013\0020", !1, !916}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!916 = !{!"0xb\00283\009\0019", !1, !787}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!917 = !MDLocation(line: 285, column: 13, scope: !916)
!918 = !MDLocation(line: 285, column: 13, scope: !919)
!919 = !{!"0xb\001", !1, !915}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!920 = !MDLocation(line: 285, column: 13, scope: !921)
!921 = !{!"0xb\003", !1, !915}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!922 = !MDLocation(line: 285, column: 13, scope: !923)
!923 = !{!"0xb\005", !1, !915}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!924 = !MDLocation(line: 285, column: 13, scope: !925)
!925 = !{!"0xb\007", !1, !926}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!926 = !{!"0xb\00285\0013\0021", !1, !915}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!927 = !MDLocation(line: 285, column: 13, scope: !928)
!928 = !{!"0xb\00285\0013\0022", !1, !926}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!929 = !MDLocation(line: 285, column: 13, scope: !930)
!930 = !{!"0xb\009", !1, !928}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!931 = !MDLocation(line: 285, column: 13, scope: !932)
!932 = !{!"0xb\0010", !1, !928}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!933 = !MDLocation(line: 285, column: 13, scope: !934)
!934 = !{!"0xb\0012", !1, !935}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!935 = !{!"0xb\0011", !1, !928}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!936 = !{!"0x100\00diag\00216\000", !421, !69, !80} ; [ DW_TAG_auto_variable ] [diag] [line 216]
!937 = !MDLocation(line: 216, column: 41, scope: !421)
!938 = !MDLocation(line: 285, column: 13, scope: !926)
!939 = !MDLocation(line: 285, column: 13, scope: !940)
!940 = !{!"0xb\0013", !1, !941}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!941 = !{!"0xb\00285\0013\0023", !1, !928}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!942 = !MDLocation(line: 285, column: 13, scope: !943)
!943 = !{!"0xb\0015", !1, !944}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!944 = !{!"0xb\0014", !1, !926}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!945 = !MDLocation(line: 286, column: 13, scope: !916)
!946 = !MDLocation(line: 288, column: 13, scope: !947)
!947 = !{!"0xb\00288\0013\0024", !1, !916}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!948 = !MDLocation(line: 288, column: 13, scope: !916)
!949 = !MDLocation(line: 288, column: 13, scope: !950)
!950 = !{!"0xb\001", !1, !947}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!951 = !MDLocation(line: 288, column: 13, scope: !952)
!952 = !{!"0xb\003", !1, !947}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!953 = !MDLocation(line: 288, column: 13, scope: !954)
!954 = !{!"0xb\005", !1, !947}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!955 = !MDLocation(line: 288, column: 13, scope: !956)
!956 = !{!"0xb\007", !1, !957}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!957 = !{!"0xb\00288\0013\0025", !1, !947}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!958 = !MDLocation(line: 288, column: 13, scope: !959)
!959 = !{!"0xb\00288\0013\0026", !1, !957}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!960 = !MDLocation(line: 288, column: 13, scope: !961)
!961 = !{!"0xb\009", !1, !959}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!962 = !MDLocation(line: 288, column: 13, scope: !963)
!963 = !{!"0xb\0010", !1, !959}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!964 = !MDLocation(line: 288, column: 13, scope: !965)
!965 = !{!"0xb\0012", !1, !966}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!966 = !{!"0xb\0011", !1, !959}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!967 = !MDLocation(line: 288, column: 13, scope: !957)
!968 = !MDLocation(line: 288, column: 13, scope: !969)
!969 = !{!"0xb\0013", !1, !970}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!970 = !{!"0xb\00288\0013\0027", !1, !959}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!971 = !MDLocation(line: 288, column: 13, scope: !972)
!972 = !{!"0xb\0015", !1, !973}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!973 = !{!"0xb\0014", !1, !957}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!974 = !MDLocation(line: 289, column: 13, scope: !916)
!975 = !MDLocation(line: 291, column: 13, scope: !976)
!976 = !{!"0xb\00291\0013\0028", !1, !916}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!977 = !MDLocation(line: 291, column: 13, scope: !916)
!978 = !MDLocation(line: 291, column: 13, scope: !979)
!979 = !{!"0xb\001", !1, !976}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!980 = !MDLocation(line: 291, column: 13, scope: !981)
!981 = !{!"0xb\003", !1, !976}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!982 = !MDLocation(line: 291, column: 13, scope: !983)
!983 = !{!"0xb\005", !1, !976}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!984 = !MDLocation(line: 291, column: 13, scope: !985)
!985 = !{!"0xb\007", !1, !986}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!986 = !{!"0xb\00291\0013\0029", !1, !976}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!987 = !MDLocation(line: 291, column: 13, scope: !988)
!988 = !{!"0xb\00291\0013\0030", !1, !986}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!989 = !MDLocation(line: 291, column: 13, scope: !990)
!990 = !{!"0xb\009", !1, !988}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!991 = !MDLocation(line: 291, column: 13, scope: !992)
!992 = !{!"0xb\0010", !1, !988}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!993 = !MDLocation(line: 291, column: 13, scope: !994)
!994 = !{!"0xb\0012", !1, !995}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!995 = !{!"0xb\0011", !1, !988}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!996 = !MDLocation(line: 291, column: 13, scope: !986)
!997 = !MDLocation(line: 291, column: 13, scope: !998)
!998 = !{!"0xb\0013", !1, !999}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!999 = !{!"0xb\00291\0013\0031", !1, !988}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1000 = !MDLocation(line: 291, column: 13, scope: !1001)
!1001 = !{!"0xb\0015", !1, !1002}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1002 = !{!"0xb\0014", !1, !986}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1003 = !MDLocation(line: 292, column: 13, scope: !916)
!1004 = !MDLocation(line: 294, column: 13, scope: !1005)
!1005 = !{!"0xb\00294\0013\0032", !1, !916}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1006 = !MDLocation(line: 294, column: 13, scope: !916)
!1007 = !MDLocation(line: 294, column: 13, scope: !1008)
!1008 = !{!"0xb\001", !1, !1005}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1009 = !MDLocation(line: 294, column: 13, scope: !1010)
!1010 = !{!"0xb\003", !1, !1005}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1011 = !MDLocation(line: 294, column: 13, scope: !1012)
!1012 = !{!"0xb\005", !1, !1005}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1013 = !MDLocation(line: 294, column: 13, scope: !1014)
!1014 = !{!"0xb\007", !1, !1015}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1015 = !{!"0xb\00294\0013\0033", !1, !1005}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1016 = !MDLocation(line: 294, column: 13, scope: !1017)
!1017 = !{!"0xb\00294\0013\0034", !1, !1015}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1018 = !MDLocation(line: 294, column: 13, scope: !1019)
!1019 = !{!"0xb\009", !1, !1017}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1020 = !MDLocation(line: 294, column: 13, scope: !1021)
!1021 = !{!"0xb\0010", !1, !1017}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1022 = !MDLocation(line: 294, column: 13, scope: !1023)
!1023 = !{!"0xb\0012", !1, !1024}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1024 = !{!"0xb\0011", !1, !1017}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1025 = !MDLocation(line: 294, column: 13, scope: !1015)
!1026 = !MDLocation(line: 294, column: 13, scope: !1027)
!1027 = !{!"0xb\0013", !1, !1028}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1028 = !{!"0xb\00294\0013\0035", !1, !1017}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1029 = !MDLocation(line: 294, column: 13, scope: !1030)
!1030 = !{!"0xb\0015", !1, !1031}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1031 = !{!"0xb\0014", !1, !1015}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1032 = !MDLocation(line: 295, column: 13, scope: !916)
!1033 = !MDLocation(line: 299, column: 13, scope: !1034)
!1034 = !{!"0xb\00299\0013\0036", !1, !787}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1035 = !MDLocation(line: 299, column: 13, scope: !787)
!1036 = !MDLocation(line: 299, column: 25, scope: !1034)
!1037 = !MDLocation(line: 300, column: 13, scope: !1034)
!1038 = !MDLocation(line: 311, column: 5, scope: !421)
!1039 = !MDLocation(line: 311, column: 12, scope: !784)
!1040 = !MDLocation(line: 313, column: 9, scope: !1041)
!1041 = !{!"0xb\00313\009\0038", !1, !1042}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1042 = !{!"0xb\00312\005\0037", !1, !421}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1043 = !MDLocation(line: 313, column: 9, scope: !1042)
!1044 = !MDLocation(line: 313, column: 9, scope: !1045)
!1045 = !{!"0xb\001", !1, !1041}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1046 = !MDLocation(line: 313, column: 9, scope: !1047)
!1047 = !{!"0xb\003", !1, !1041}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1048 = !MDLocation(line: 313, column: 9, scope: !1049)
!1049 = !{!"0xb\005", !1, !1041}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1050 = !MDLocation(line: 313, column: 9, scope: !1051)
!1051 = !{!"0xb\007", !1, !1052}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1052 = !{!"0xb\00313\009\0039", !1, !1041}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1053 = !MDLocation(line: 313, column: 9, scope: !1054)
!1054 = !{!"0xb\00313\009\0040", !1, !1052}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1055 = !MDLocation(line: 313, column: 9, scope: !1056)
!1056 = !{!"0xb\009", !1, !1054}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1057 = !MDLocation(line: 313, column: 9, scope: !1058)
!1058 = !{!"0xb\0010", !1, !1054}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1059 = !MDLocation(line: 313, column: 9, scope: !1060)
!1060 = !{!"0xb\0012", !1, !1061}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1061 = !{!"0xb\0011", !1, !1054}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1062 = !MDLocation(line: 313, column: 9, scope: !1052)
!1063 = !MDLocation(line: 313, column: 9, scope: !1064)
!1064 = !{!"0xb\0013", !1, !1065}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1065 = !{!"0xb\00313\009\0041", !1, !1054}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1066 = !MDLocation(line: 313, column: 9, scope: !1067)
!1067 = !{!"0xb\0015", !1, !1068}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1068 = !{!"0xb\0014", !1, !1052}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1069 = !MDLocation(line: 314, column: 9, scope: !1070)
!1070 = !{!"0xb\00314\009\0042", !1, !1042}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1071 = !MDLocation(line: 314, column: 9, scope: !1042)
!1072 = !MDLocation(line: 314, column: 9, scope: !1073)
!1073 = !{!"0xb\001", !1, !1070}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1074 = !MDLocation(line: 314, column: 9, scope: !1075)
!1075 = !{!"0xb\003", !1, !1070}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1076 = !MDLocation(line: 314, column: 9, scope: !1077)
!1077 = !{!"0xb\005", !1, !1070}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1078 = !MDLocation(line: 314, column: 9, scope: !1079)
!1079 = !{!"0xb\007", !1, !1080}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1080 = !{!"0xb\00314\009\0043", !1, !1070}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1081 = !MDLocation(line: 314, column: 9, scope: !1082)
!1082 = !{!"0xb\00314\009\0044", !1, !1080}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1083 = !MDLocation(line: 314, column: 9, scope: !1084)
!1084 = !{!"0xb\009", !1, !1082}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1085 = !MDLocation(line: 314, column: 9, scope: !1086)
!1086 = !{!"0xb\0010", !1, !1082}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1087 = !MDLocation(line: 314, column: 9, scope: !1088)
!1088 = !{!"0xb\0012", !1, !1089}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1089 = !{!"0xb\0011", !1, !1082}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1090 = !MDLocation(line: 314, column: 9, scope: !1080)
!1091 = !MDLocation(line: 314, column: 9, scope: !1092)
!1092 = !{!"0xb\0013", !1, !1093}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1093 = !{!"0xb\00314\009\0045", !1, !1082}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1094 = !MDLocation(line: 314, column: 9, scope: !1095)
!1095 = !{!"0xb\0015", !1, !1096}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1096 = !{!"0xb\0014", !1, !1080}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1097 = !MDLocation(line: 315, column: 9, scope: !1098)
!1098 = !{!"0xb\00315\009\0046", !1, !1042}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1099 = !MDLocation(line: 315, column: 9, scope: !1042)
!1100 = !MDLocation(line: 315, column: 9, scope: !1101)
!1101 = !{!"0xb\001", !1, !1098}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1102 = !MDLocation(line: 315, column: 9, scope: !1103)
!1103 = !{!"0xb\003", !1, !1098}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1104 = !MDLocation(line: 315, column: 9, scope: !1105)
!1105 = !{!"0xb\005", !1, !1098}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1106 = !MDLocation(line: 315, column: 9, scope: !1107)
!1107 = !{!"0xb\007", !1, !1108}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1108 = !{!"0xb\00315\009\0047", !1, !1098}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1109 = !MDLocation(line: 315, column: 9, scope: !1110)
!1110 = !{!"0xb\00315\009\0048", !1, !1108}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1111 = !MDLocation(line: 315, column: 9, scope: !1112)
!1112 = !{!"0xb\009", !1, !1110}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1113 = !MDLocation(line: 315, column: 9, scope: !1114)
!1114 = !{!"0xb\0010", !1, !1110}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1115 = !MDLocation(line: 315, column: 9, scope: !1116)
!1116 = !{!"0xb\0012", !1, !1117}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1117 = !{!"0xb\0011", !1, !1110}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1118 = !MDLocation(line: 315, column: 9, scope: !1108)
!1119 = !MDLocation(line: 315, column: 9, scope: !1120)
!1120 = !{!"0xb\0013", !1, !1121}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1121 = !{!"0xb\00315\009\0049", !1, !1110}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1122 = !MDLocation(line: 315, column: 9, scope: !1123)
!1123 = !{!"0xb\0015", !1, !1124}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1124 = !{!"0xb\0014", !1, !1108}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1125 = !MDLocation(line: 316, column: 9, scope: !1126)
!1126 = !{!"0xb\00316\009\0050", !1, !1042}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1127 = !MDLocation(line: 316, column: 9, scope: !1042)
!1128 = !MDLocation(line: 316, column: 9, scope: !1129)
!1129 = !{!"0xb\001", !1, !1126}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1130 = !MDLocation(line: 316, column: 9, scope: !1131)
!1131 = !{!"0xb\003", !1, !1126}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1132 = !MDLocation(line: 316, column: 9, scope: !1133)
!1133 = !{!"0xb\005", !1, !1126}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1134 = !MDLocation(line: 316, column: 9, scope: !1135)
!1135 = !{!"0xb\007", !1, !1136}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1136 = !{!"0xb\00316\009\0051", !1, !1126}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1137 = !MDLocation(line: 316, column: 9, scope: !1138)
!1138 = !{!"0xb\00316\009\0052", !1, !1136}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1139 = !MDLocation(line: 316, column: 9, scope: !1140)
!1140 = !{!"0xb\009", !1, !1138}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1141 = !MDLocation(line: 316, column: 9, scope: !1142)
!1142 = !{!"0xb\0010", !1, !1138}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1143 = !MDLocation(line: 316, column: 9, scope: !1144)
!1144 = !{!"0xb\0012", !1, !1145}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1145 = !{!"0xb\0011", !1, !1138}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1146 = !MDLocation(line: 316, column: 9, scope: !1136)
!1147 = !MDLocation(line: 316, column: 9, scope: !1148)
!1148 = !{!"0xb\0013", !1, !1149}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1149 = !{!"0xb\00316\009\0053", !1, !1138}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1150 = !MDLocation(line: 316, column: 9, scope: !1151)
!1151 = !{!"0xb\0015", !1, !1152}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1152 = !{!"0xb\0014", !1, !1136}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1153 = !MDLocation(line: 318, column: 21, scope: !1042)
!1154 = !MDLocation(line: 318, column: 46, scope: !1042)
!1155 = !MDLocation(line: 318, column: 20, scope: !1042)
!1156 = !MDLocation(line: 320, column: 9, scope: !1042)
!1157 = !MDLocation(line: 323, column: 13, scope: !1158)
!1158 = !{!"0xb\00323\0013\0055", !1, !1159}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1159 = !{!"0xb\00321\009\0054", !1, !1042}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1160 = !MDLocation(line: 323, column: 13, scope: !1159)
!1161 = !MDLocation(line: 323, column: 13, scope: !1162)
!1162 = !{!"0xb\001", !1, !1158}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1163 = !MDLocation(line: 323, column: 13, scope: !1164)
!1164 = !{!"0xb\003", !1, !1158}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1165 = !MDLocation(line: 323, column: 13, scope: !1166)
!1166 = !{!"0xb\005", !1, !1158}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1167 = !MDLocation(line: 323, column: 13, scope: !1168)
!1168 = !{!"0xb\007", !1, !1169}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1169 = !{!"0xb\00323\0013\0056", !1, !1158}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1170 = !MDLocation(line: 323, column: 13, scope: !1171)
!1171 = !{!"0xb\00323\0013\0057", !1, !1169}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1172 = !MDLocation(line: 323, column: 13, scope: !1173)
!1173 = !{!"0xb\009", !1, !1171}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1174 = !MDLocation(line: 323, column: 13, scope: !1175)
!1175 = !{!"0xb\0010", !1, !1171}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1176 = !MDLocation(line: 323, column: 13, scope: !1177)
!1177 = !{!"0xb\0012", !1, !1178}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1178 = !{!"0xb\0011", !1, !1171}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1179 = !MDLocation(line: 323, column: 13, scope: !1169)
!1180 = !MDLocation(line: 323, column: 13, scope: !1181)
!1181 = !{!"0xb\0013", !1, !1182}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1182 = !{!"0xb\00323\0013\0058", !1, !1171}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1183 = !MDLocation(line: 323, column: 13, scope: !1184)
!1184 = !{!"0xb\0015", !1, !1185}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1185 = !{!"0xb\0014", !1, !1169}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1186 = !MDLocation(line: 324, column: 13, scope: !1159)
!1187 = !MDLocation(line: 326, column: 13, scope: !1188)
!1188 = !{!"0xb\00326\0013\0059", !1, !1159}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1189 = !MDLocation(line: 326, column: 13, scope: !1159)
!1190 = !MDLocation(line: 326, column: 13, scope: !1191)
!1191 = !{!"0xb\001", !1, !1188}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1192 = !MDLocation(line: 326, column: 13, scope: !1193)
!1193 = !{!"0xb\003", !1, !1188}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1194 = !MDLocation(line: 326, column: 13, scope: !1195)
!1195 = !{!"0xb\005", !1, !1188}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1196 = !MDLocation(line: 326, column: 13, scope: !1197)
!1197 = !{!"0xb\007", !1, !1198}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1198 = !{!"0xb\00326\0013\0060", !1, !1188}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1199 = !MDLocation(line: 326, column: 13, scope: !1200)
!1200 = !{!"0xb\00326\0013\0061", !1, !1198}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1201 = !MDLocation(line: 326, column: 13, scope: !1202)
!1202 = !{!"0xb\009", !1, !1200}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1203 = !MDLocation(line: 326, column: 13, scope: !1204)
!1204 = !{!"0xb\0010", !1, !1200}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1205 = !MDLocation(line: 326, column: 13, scope: !1206)
!1206 = !{!"0xb\0012", !1, !1207}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1207 = !{!"0xb\0011", !1, !1200}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1208 = !MDLocation(line: 326, column: 13, scope: !1198)
!1209 = !MDLocation(line: 326, column: 13, scope: !1210)
!1210 = !{!"0xb\0013", !1, !1211}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1211 = !{!"0xb\00326\0013\0062", !1, !1200}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1212 = !MDLocation(line: 326, column: 13, scope: !1213)
!1213 = !{!"0xb\0015", !1, !1214}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1214 = !{!"0xb\0014", !1, !1198}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1215 = !MDLocation(line: 327, column: 13, scope: !1159)
!1216 = !MDLocation(line: 329, column: 13, scope: !1217)
!1217 = !{!"0xb\00329\0013\0063", !1, !1159}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1218 = !MDLocation(line: 329, column: 13, scope: !1159)
!1219 = !MDLocation(line: 329, column: 13, scope: !1220)
!1220 = !{!"0xb\001", !1, !1217}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1221 = !MDLocation(line: 329, column: 13, scope: !1222)
!1222 = !{!"0xb\003", !1, !1217}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1223 = !MDLocation(line: 329, column: 13, scope: !1224)
!1224 = !{!"0xb\005", !1, !1217}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1225 = !MDLocation(line: 329, column: 13, scope: !1226)
!1226 = !{!"0xb\007", !1, !1227}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1227 = !{!"0xb\00329\0013\0064", !1, !1217}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1228 = !MDLocation(line: 329, column: 13, scope: !1229)
!1229 = !{!"0xb\00329\0013\0065", !1, !1227}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1230 = !MDLocation(line: 329, column: 13, scope: !1231)
!1231 = !{!"0xb\009", !1, !1229}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1232 = !MDLocation(line: 329, column: 13, scope: !1233)
!1233 = !{!"0xb\0010", !1, !1229}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1234 = !MDLocation(line: 329, column: 13, scope: !1235)
!1235 = !{!"0xb\0012", !1, !1236}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1236 = !{!"0xb\0011", !1, !1229}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1237 = !MDLocation(line: 329, column: 13, scope: !1227)
!1238 = !MDLocation(line: 329, column: 13, scope: !1239)
!1239 = !{!"0xb\0013", !1, !1240}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1240 = !{!"0xb\00329\0013\0066", !1, !1229}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1241 = !MDLocation(line: 329, column: 13, scope: !1242)
!1242 = !{!"0xb\0015", !1, !1243}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1243 = !{!"0xb\0014", !1, !1227}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1244 = !MDLocation(line: 330, column: 13, scope: !1159)
!1245 = !MDLocation(line: 332, column: 13, scope: !1246)
!1246 = !{!"0xb\00332\0013\0067", !1, !1159}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1247 = !MDLocation(line: 332, column: 13, scope: !1159)
!1248 = !MDLocation(line: 332, column: 13, scope: !1249)
!1249 = !{!"0xb\001", !1, !1246}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1250 = !MDLocation(line: 332, column: 13, scope: !1251)
!1251 = !{!"0xb\003", !1, !1246}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1252 = !MDLocation(line: 332, column: 13, scope: !1253)
!1253 = !{!"0xb\005", !1, !1246}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1254 = !MDLocation(line: 332, column: 13, scope: !1255)
!1255 = !{!"0xb\007", !1, !1256}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1256 = !{!"0xb\00332\0013\0068", !1, !1246}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1257 = !MDLocation(line: 332, column: 13, scope: !1258)
!1258 = !{!"0xb\00332\0013\0069", !1, !1256}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1259 = !MDLocation(line: 332, column: 13, scope: !1260)
!1260 = !{!"0xb\009", !1, !1258}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1261 = !MDLocation(line: 332, column: 13, scope: !1262)
!1262 = !{!"0xb\0010", !1, !1258}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1263 = !MDLocation(line: 332, column: 13, scope: !1264)
!1264 = !{!"0xb\0012", !1, !1265}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1265 = !{!"0xb\0011", !1, !1258}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1266 = !MDLocation(line: 332, column: 13, scope: !1256)
!1267 = !MDLocation(line: 332, column: 13, scope: !1268)
!1268 = !{!"0xb\0013", !1, !1269}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1269 = !{!"0xb\00332\0013\0070", !1, !1258}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1270 = !MDLocation(line: 332, column: 13, scope: !1271)
!1271 = !{!"0xb\0015", !1, !1272}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1272 = !{!"0xb\0014", !1, !1256}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1273 = !MDLocation(line: 333, column: 13, scope: !1159)
!1274 = !MDLocation(line: 337, column: 13, scope: !1275)
!1275 = !{!"0xb\00337\0013\0071", !1, !1042}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1276 = !MDLocation(line: 337, column: 13, scope: !1042)
!1277 = !MDLocation(line: 337, column: 25, scope: !1275)
!1278 = !MDLocation(line: 338, column: 13, scope: !1275)
!1279 = !MDLocation(line: 344, column: 25, scope: !421)
!1280 = !MDLocation(line: 344, column: 5, scope: !421)
!1281 = !MDLocation(line: 345, column: 25, scope: !421)
!1282 = !MDLocation(line: 345, column: 5, scope: !421)
!1283 = !MDLocation(line: 347, column: 14, scope: !1284)
!1284 = !{!"0xb\00347\009\0072", !1, !421}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1285 = !MDLocation(line: 347, column: 34, scope: !1284)
!1286 = !MDLocation(line: 347, column: 10, scope: !1284)
!1287 = !MDLocation(line: 347, column: 9, scope: !421)
!1288 = !MDLocation(line: 348, column: 14, scope: !1284)
!1289 = !MDLocation(line: 348, column: 34, scope: !1284)
!1290 = !MDLocation(line: 348, column: 10, scope: !1284)
!1291 = !MDLocation(line: 349, column: 9, scope: !1284)
!1292 = !MDLocation(line: 351, column: 5, scope: !421)
!1293 = !MDLocation(line: 352, column: 1, scope: !421)
!1294 = !{!"0x101\00mv\0016777254\000", !495, !69, !73} ; [ DW_TAG_arg_variable ] [mv] [line 38]
!1295 = !MDLocation(line: 38, column: 32, scope: !495)
!1296 = !{!"0x101\00ref\0033554470\000", !495, !69, !73} ; [ DW_TAG_arg_variable ] [ref] [line 38]
!1297 = !MDLocation(line: 38, column: 44, scope: !495)
!1298 = !{!"0x101\00mvcost\0050331686\000", !495, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 38]
!1299 = !MDLocation(line: 38, column: 54, scope: !495)
!1300 = !{!"0x101\00error_per_bit\0067108902\000", !495, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 38]
!1301 = !MDLocation(line: 38, column: 69, scope: !495)
!1302 = !MDLocation(line: 41, column: 9, scope: !495)
!1303 = !MDLocation(line: 42, column: 29, scope: !1304)
!1304 = !{!"0xb\0041\009\00362", !1, !495}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1305 = !MDLocation(line: 42, column: 45, scope: !1304)
!1306 = !MDLocation(line: 42, column: 28, scope: !1304)
!1307 = !MDLocation(line: 42, column: 18, scope: !1304)
!1308 = !MDLocation(line: 43, column: 29, scope: !1304)
!1309 = !MDLocation(line: 43, column: 45, scope: !1304)
!1310 = !MDLocation(line: 43, column: 28, scope: !1304)
!1311 = !MDLocation(line: 43, column: 18, scope: !1304)
!1312 = !MDLocation(line: 42, column: 17, scope: !1304)
!1313 = !MDLocation(line: 42, column: 16, scope: !1304)
!1314 = !MDLocation(line: 42, column: 9, scope: !1304)
!1315 = !MDLocation(line: 45, column: 5, scope: !495)
!1316 = !MDLocation(line: 46, column: 1, scope: !495)
!1317 = !{!"0x101\00x\0016777577\000", !472, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 361]
!1318 = !MDLocation(line: 361, column: 46, scope: !472)
!1319 = !{!"0x101\00b\0033554793\000", !472, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 361]
!1320 = !MDLocation(line: 361, column: 56, scope: !472)
!1321 = !{!"0x101\00d\0050332009\000", !472, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 361]
!1322 = !MDLocation(line: 361, column: 67, scope: !472)
!1323 = !{!"0x101\00bestmv\0067109226\000", !472, !69, !73} ; [ DW_TAG_arg_variable ] [bestmv] [line 362]
!1324 = !MDLocation(line: 362, column: 42, scope: !472)
!1325 = !{!"0x101\00ref_mv\0083886442\000", !472, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 362]
!1326 = !MDLocation(line: 362, column: 58, scope: !472)
!1327 = !{!"0x101\00error_per_bit\00100663659\000", !472, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 363]
!1328 = !MDLocation(line: 363, column: 38, scope: !472)
!1329 = !{!"0x101\00vfp\00117440876\000", !472, !69, !424} ; [ DW_TAG_arg_variable ] [vfp] [line 364]
!1330 = !MDLocation(line: 364, column: 63, scope: !472)
!1331 = !{!"0x101\00mvcost\00134218093\000", !472, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 365]
!1332 = !MDLocation(line: 365, column: 39, scope: !472)
!1333 = !{!"0x101\00distortion\00150995309\000", !472, !69, !89} ; [ DW_TAG_arg_variable ] [distortion] [line 365]
!1334 = !MDLocation(line: 365, column: 55, scope: !472)
!1335 = !{!"0x101\00sse1\00167772526\000", !472, !69, !319} ; [ DW_TAG_arg_variable ] [sse1] [line 366]
!1336 = !MDLocation(line: 366, column: 48, scope: !472)
!1337 = !{!"0x100\00bestmse\00368\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [bestmse] [line 368]
!1338 = !MDLocation(line: 368, column: 9, scope: !472)
!1339 = !{!"0x100\00startmv\00369\000", !472, !69, !74} ; [ DW_TAG_auto_variable ] [startmv] [line 369]
!1340 = !MDLocation(line: 369, column: 12, scope: !472)
!1341 = !{!"0x100\00this_mv\00370\000", !472, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 370]
!1342 = !MDLocation(line: 370, column: 12, scope: !472)
!1343 = !MDLocation(line: 371, column: 27, scope: !472)
!1344 = !MDLocation(line: 371, column: 25, scope: !472)
!1345 = !MDLocation(line: 371, column: 42, scope: !472)
!1346 = !{!"0x100\00z\00371\000", !472, !69, !60} ; [ DW_TAG_auto_variable ] [z] [line 371]
!1347 = !MDLocation(line: 371, column: 20, scope: !472)
!1348 = !{!"0x100\00sse\00373\000", !472, !69, !80} ; [ DW_TAG_auto_variable ] [sse] [line 373]
!1349 = !MDLocation(line: 373, column: 18, scope: !472)
!1350 = !MDLocation(line: 377, column: 22, scope: !472)
!1351 = !{!"0x100\00pre_stride\00377\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 377]
!1352 = !MDLocation(line: 377, column: 9, scope: !472)
!1353 = !MDLocation(line: 378, column: 31, scope: !472)
!1354 = !{!"0x100\00base_pre\00378\000", !472, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 378]
!1355 = !MDLocation(line: 378, column: 20, scope: !472)
!1356 = !MDLocation(line: 381, column: 23, scope: !472)
!1357 = !{!"0x100\00xd\00381\000", !472, !69, !718} ; [ DW_TAG_auto_variable ] [xd] [line 381]
!1358 = !MDLocation(line: 381, column: 18, scope: !472)
!1359 = !MDLocation(line: 382, column: 37, scope: !472)
!1360 = !MDLocation(line: 382, column: 26, scope: !472)
!1361 = !MDLocation(line: 382, column: 50, scope: !472)
!1362 = !MDLocation(line: 382, column: 49, scope: !472)
!1363 = !MDLocation(line: 382, column: 84, scope: !472)
!1364 = !{!"0x100\00y_0\00382\000", !472, !69, !60} ; [ DW_TAG_auto_variable ] [y_0] [line 382]
!1365 = !MDLocation(line: 382, column: 20, scope: !472)
!1366 = !{!"0x100\00y_stride\00376\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [y_stride] [line 376]
!1367 = !MDLocation(line: 376, column: 9, scope: !472)
!1368 = !MDLocation(line: 387, column: 6, scope: !472)
!1369 = !MDLocation(line: 387, column: 19, scope: !472)
!1370 = !MDLocation(line: 387, column: 53, scope: !472)
!1371 = !MDLocation(line: 388, column: 10, scope: !472)
!1372 = !{!"0x100\00y\00383\000", !472, !69, !60} ; [ DW_TAG_auto_variable ] [y] [line 383]
!1373 = !MDLocation(line: 383, column: 20, scope: !472)
!1374 = !MDLocation(line: 395, column: 5, scope: !472)
!1375 = !MDLocation(line: 396, column: 5, scope: !472)
!1376 = !MDLocation(line: 397, column: 5, scope: !472)
!1377 = !MDLocation(line: 400, column: 15, scope: !472)
!1378 = !MDLocation(line: 400, column: 39, scope: !472)
!1379 = !MDLocation(line: 401, column: 5, scope: !472)
!1380 = !MDLocation(line: 402, column: 16, scope: !472)
!1381 = !MDLocation(line: 402, column: 5, scope: !472)
!1382 = !MDLocation(line: 405, column: 25, scope: !472)
!1383 = !MDLocation(line: 405, column: 5, scope: !472)
!1384 = !MDLocation(line: 406, column: 27, scope: !472)
!1385 = !MDLocation(line: 406, column: 26, scope: !472)
!1386 = !MDLocation(line: 406, column: 25, scope: !472)
!1387 = !MDLocation(line: 406, column: 5, scope: !472)
!1388 = !MDLocation(line: 407, column: 15, scope: !472)
!1389 = !MDLocation(line: 407, column: 34, scope: !472)
!1390 = !MDLocation(line: 407, column: 54, scope: !472)
!1391 = !{!"0x100\00thismse\00375\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [thismse] [line 375]
!1392 = !MDLocation(line: 375, column: 9, scope: !472)
!1393 = !MDLocation(line: 408, column: 22, scope: !472)
!1394 = !MDLocation(line: 408, column: 12, scope: !472)
!1395 = !{!"0x100\00left\00372\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [left] [line 372]
!1396 = !MDLocation(line: 372, column: 9, scope: !472)
!1397 = !MDLocation(line: 410, column: 9, scope: !1398)
!1398 = !{!"0xb\00410\009\0073", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1399 = !MDLocation(line: 410, column: 9, scope: !472)
!1400 = !MDLocation(line: 412, column: 9, scope: !1401)
!1401 = !{!"0xb\00411\005\0074", !1, !1398}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1402 = !MDLocation(line: 414, column: 9, scope: !1401)
!1403 = !MDLocation(line: 415, column: 17, scope: !1401)
!1404 = !MDLocation(line: 415, column: 9, scope: !1401)
!1405 = !MDLocation(line: 416, column: 5, scope: !1401)
!1406 = !MDLocation(line: 418, column: 5, scope: !472)
!1407 = !MDLocation(line: 419, column: 15, scope: !472)
!1408 = !MDLocation(line: 419, column: 50, scope: !472)
!1409 = !MDLocation(line: 420, column: 23, scope: !472)
!1410 = !MDLocation(line: 420, column: 13, scope: !472)
!1411 = !{!"0x100\00right\00372\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [right] [line 372]
!1412 = !MDLocation(line: 372, column: 15, scope: !472)
!1413 = !MDLocation(line: 422, column: 9, scope: !1414)
!1414 = !{!"0xb\00422\009\0075", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1415 = !MDLocation(line: 422, column: 9, scope: !472)
!1416 = !MDLocation(line: 424, column: 9, scope: !1417)
!1417 = !{!"0xb\00423\005\0076", !1, !1414}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1418 = !MDLocation(line: 426, column: 9, scope: !1417)
!1419 = !MDLocation(line: 427, column: 17, scope: !1417)
!1420 = !MDLocation(line: 427, column: 9, scope: !1417)
!1421 = !MDLocation(line: 428, column: 5, scope: !1417)
!1422 = !MDLocation(line: 431, column: 25, scope: !472)
!1423 = !MDLocation(line: 431, column: 5, scope: !472)
!1424 = !MDLocation(line: 432, column: 27, scope: !472)
!1425 = !MDLocation(line: 432, column: 26, scope: !472)
!1426 = !MDLocation(line: 432, column: 25, scope: !472)
!1427 = !MDLocation(line: 432, column: 5, scope: !472)
!1428 = !MDLocation(line: 433, column: 16, scope: !472)
!1429 = !MDLocation(line: 433, column: 35, scope: !472)
!1430 = !MDLocation(line: 433, column: 62, scope: !472)
!1431 = !MDLocation(line: 434, column: 20, scope: !472)
!1432 = !MDLocation(line: 434, column: 10, scope: !472)
!1433 = !{!"0x100\00up\00372\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [up] [line 372]
!1434 = !MDLocation(line: 372, column: 22, scope: !472)
!1435 = !MDLocation(line: 436, column: 9, scope: !1436)
!1436 = !{!"0xb\00436\009\0077", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1437 = !MDLocation(line: 436, column: 9, scope: !472)
!1438 = !MDLocation(line: 438, column: 9, scope: !1439)
!1439 = !{!"0xb\00437\005\0078", !1, !1436}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1440 = !MDLocation(line: 440, column: 9, scope: !1439)
!1441 = !MDLocation(line: 441, column: 17, scope: !1439)
!1442 = !MDLocation(line: 441, column: 9, scope: !1439)
!1443 = !MDLocation(line: 442, column: 5, scope: !1439)
!1444 = !MDLocation(line: 444, column: 5, scope: !472)
!1445 = !MDLocation(line: 445, column: 15, scope: !472)
!1446 = !MDLocation(line: 445, column: 50, scope: !472)
!1447 = !MDLocation(line: 446, column: 22, scope: !472)
!1448 = !MDLocation(line: 446, column: 12, scope: !472)
!1449 = !{!"0x100\00down\00372\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [down] [line 372]
!1450 = !MDLocation(line: 372, column: 26, scope: !472)
!1451 = !MDLocation(line: 448, column: 9, scope: !1452)
!1452 = !{!"0xb\00448\009\0079", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1453 = !MDLocation(line: 448, column: 9, scope: !472)
!1454 = !MDLocation(line: 450, column: 9, scope: !1455)
!1455 = !{!"0xb\00449\005\0080", !1, !1452}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1456 = !MDLocation(line: 452, column: 9, scope: !1455)
!1457 = !MDLocation(line: 453, column: 17, scope: !1455)
!1458 = !MDLocation(line: 453, column: 9, scope: !1455)
!1459 = !MDLocation(line: 454, column: 5, scope: !1455)
!1460 = !MDLocation(line: 458, column: 17, scope: !472)
!1461 = !MDLocation(line: 458, column: 42, scope: !472)
!1462 = !MDLocation(line: 458, column: 16, scope: !472)
!1463 = !{!"0x100\00whichdir\00374\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [whichdir] [line 374]
!1464 = !MDLocation(line: 374, column: 9, scope: !472)
!1465 = !MDLocation(line: 459, column: 5, scope: !472)
!1466 = !MDLocation(line: 461, column: 5, scope: !472)
!1467 = !MDLocation(line: 464, column: 30, scope: !1468)
!1468 = !{!"0xb\00462\005\0081", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1469 = !MDLocation(line: 464, column: 29, scope: !1468)
!1470 = !MDLocation(line: 464, column: 9, scope: !1468)
!1471 = !MDLocation(line: 465, column: 30, scope: !1468)
!1472 = !MDLocation(line: 465, column: 29, scope: !1468)
!1473 = !MDLocation(line: 465, column: 9, scope: !1468)
!1474 = !MDLocation(line: 466, column: 19, scope: !1468)
!1475 = !MDLocation(line: 466, column: 39, scope: !1468)
!1476 = !MDLocation(line: 466, column: 70, scope: !1468)
!1477 = !MDLocation(line: 467, column: 9, scope: !1468)
!1478 = !MDLocation(line: 469, column: 9, scope: !1468)
!1479 = !MDLocation(line: 470, column: 30, scope: !1468)
!1480 = !MDLocation(line: 470, column: 29, scope: !1468)
!1481 = !MDLocation(line: 470, column: 9, scope: !1468)
!1482 = !MDLocation(line: 471, column: 19, scope: !1468)
!1483 = !MDLocation(line: 471, column: 39, scope: !1468)
!1484 = !MDLocation(line: 471, column: 66, scope: !1468)
!1485 = !MDLocation(line: 472, column: 9, scope: !1468)
!1486 = !MDLocation(line: 474, column: 30, scope: !1468)
!1487 = !MDLocation(line: 474, column: 29, scope: !1468)
!1488 = !MDLocation(line: 474, column: 9, scope: !1468)
!1489 = !MDLocation(line: 475, column: 9, scope: !1468)
!1490 = !MDLocation(line: 476, column: 19, scope: !1468)
!1491 = !MDLocation(line: 476, column: 39, scope: !1468)
!1492 = !MDLocation(line: 476, column: 59, scope: !1468)
!1493 = !MDLocation(line: 477, column: 9, scope: !1468)
!1494 = !MDLocation(line: 480, column: 9, scope: !1468)
!1495 = !MDLocation(line: 481, column: 9, scope: !1468)
!1496 = !MDLocation(line: 482, column: 19, scope: !1468)
!1497 = !MDLocation(line: 482, column: 55, scope: !1468)
!1498 = !MDLocation(line: 483, column: 9, scope: !1468)
!1499 = !MDLocation(line: 486, column: 22, scope: !472)
!1500 = !MDLocation(line: 486, column: 12, scope: !472)
!1501 = !{!"0x100\00diag\00372\000", !472, !69, !72} ; [ DW_TAG_auto_variable ] [diag] [line 372]
!1502 = !MDLocation(line: 372, column: 32, scope: !472)
!1503 = !MDLocation(line: 488, column: 9, scope: !1504)
!1504 = !{!"0xb\00488\009\0082", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1505 = !MDLocation(line: 488, column: 9, scope: !472)
!1506 = !MDLocation(line: 490, column: 9, scope: !1507)
!1507 = !{!"0xb\00489\005\0083", !1, !1504}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1508 = !MDLocation(line: 492, column: 9, scope: !1507)
!1509 = !MDLocation(line: 493, column: 17, scope: !1507)
!1510 = !MDLocation(line: 493, column: 9, scope: !1507)
!1511 = !MDLocation(line: 494, column: 5, scope: !1507)
!1512 = !MDLocation(line: 498, column: 9, scope: !1513)
!1513 = !{!"0xb\00498\009\0084", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1514 = !MDLocation(line: 498, column: 29, scope: !1513)
!1515 = !MDLocation(line: 498, column: 9, scope: !472)
!1516 = !MDLocation(line: 499, column: 9, scope: !1513)
!1517 = !MDLocation(line: 501, column: 9, scope: !1518)
!1518 = !{!"0xb\00501\009\0085", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1519 = !MDLocation(line: 501, column: 29, scope: !1518)
!1520 = !MDLocation(line: 501, column: 9, scope: !472)
!1521 = !MDLocation(line: 502, column: 9, scope: !1518)
!1522 = !MDLocation(line: 504, column: 5, scope: !472)
!1523 = !MDLocation(line: 509, column: 25, scope: !472)
!1524 = !MDLocation(line: 509, column: 5, scope: !472)
!1525 = !MDLocation(line: 511, column: 9, scope: !1526)
!1526 = !{!"0xb\00511\009\0086", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1527 = !MDLocation(line: 511, column: 9, scope: !472)
!1528 = !MDLocation(line: 513, column: 29, scope: !1529)
!1529 = !{!"0xb\00512\005\0087", !1, !1526}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1530 = !MDLocation(line: 513, column: 9, scope: !1529)
!1531 = !MDLocation(line: 514, column: 19, scope: !1529)
!1532 = !MDLocation(line: 514, column: 41, scope: !1529)
!1533 = !MDLocation(line: 514, column: 64, scope: !1529)
!1534 = !MDLocation(line: 514, column: 90, scope: !1529)
!1535 = !MDLocation(line: 515, column: 5, scope: !1529)
!1536 = !MDLocation(line: 518, column: 30, scope: !1537)
!1537 = !{!"0xb\00517\005\0088", !1, !1526}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1538 = !MDLocation(line: 518, column: 29, scope: !1537)
!1539 = !MDLocation(line: 518, column: 9, scope: !1537)
!1540 = !MDLocation(line: 519, column: 19, scope: !1537)
!1541 = !MDLocation(line: 519, column: 28, scope: !1537)
!1542 = !MDLocation(line: 519, column: 48, scope: !1537)
!1543 = !MDLocation(line: 519, column: 74, scope: !1537)
!1544 = !MDLocation(line: 522, column: 22, scope: !472)
!1545 = !MDLocation(line: 522, column: 12, scope: !472)
!1546 = !MDLocation(line: 524, column: 9, scope: !1547)
!1547 = !{!"0xb\00524\009\0089", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1548 = !MDLocation(line: 524, column: 9, scope: !472)
!1549 = !MDLocation(line: 526, column: 9, scope: !1550)
!1550 = !{!"0xb\00525\005\0090", !1, !1547}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1551 = !MDLocation(line: 528, column: 9, scope: !1550)
!1552 = !MDLocation(line: 529, column: 17, scope: !1550)
!1553 = !MDLocation(line: 529, column: 9, scope: !1550)
!1554 = !MDLocation(line: 530, column: 5, scope: !1550)
!1555 = !MDLocation(line: 532, column: 5, scope: !472)
!1556 = !MDLocation(line: 533, column: 15, scope: !472)
!1557 = !MDLocation(line: 533, column: 37, scope: !472)
!1558 = !MDLocation(line: 533, column: 60, scope: !472)
!1559 = !MDLocation(line: 533, column: 86, scope: !472)
!1560 = !MDLocation(line: 534, column: 23, scope: !472)
!1561 = !MDLocation(line: 534, column: 13, scope: !472)
!1562 = !MDLocation(line: 536, column: 9, scope: !1563)
!1563 = !{!"0xb\00536\009\0091", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1564 = !MDLocation(line: 536, column: 9, scope: !472)
!1565 = !MDLocation(line: 538, column: 9, scope: !1566)
!1566 = !{!"0xb\00537\005\0092", !1, !1563}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1567 = !MDLocation(line: 540, column: 9, scope: !1566)
!1568 = !MDLocation(line: 541, column: 17, scope: !1566)
!1569 = !MDLocation(line: 541, column: 9, scope: !1566)
!1570 = !MDLocation(line: 542, column: 5, scope: !1566)
!1571 = !MDLocation(line: 545, column: 25, scope: !472)
!1572 = !MDLocation(line: 545, column: 5, scope: !472)
!1573 = !MDLocation(line: 547, column: 9, scope: !1574)
!1574 = !{!"0xb\00547\009\0093", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1575 = !MDLocation(line: 547, column: 9, scope: !472)
!1576 = !MDLocation(line: 549, column: 29, scope: !1577)
!1577 = !{!"0xb\00548\005\0094", !1, !1574}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1578 = !MDLocation(line: 549, column: 9, scope: !1577)
!1579 = !MDLocation(line: 550, column: 19, scope: !1577)
!1580 = !MDLocation(line: 550, column: 41, scope: !1577)
!1581 = !MDLocation(line: 550, column: 64, scope: !1577)
!1582 = !MDLocation(line: 550, column: 90, scope: !1577)
!1583 = !MDLocation(line: 551, column: 5, scope: !1577)
!1584 = !MDLocation(line: 554, column: 30, scope: !1585)
!1585 = !{!"0xb\00553\005\0095", !1, !1574}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1586 = !MDLocation(line: 554, column: 29, scope: !1585)
!1587 = !MDLocation(line: 554, column: 9, scope: !1585)
!1588 = !MDLocation(line: 555, column: 19, scope: !1585)
!1589 = !MDLocation(line: 555, column: 28, scope: !1585)
!1590 = !MDLocation(line: 555, column: 52, scope: !1585)
!1591 = !MDLocation(line: 555, column: 81, scope: !1585)
!1592 = !MDLocation(line: 558, column: 20, scope: !472)
!1593 = !MDLocation(line: 558, column: 10, scope: !472)
!1594 = !MDLocation(line: 560, column: 9, scope: !1595)
!1595 = !{!"0xb\00560\009\0096", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1596 = !MDLocation(line: 560, column: 9, scope: !472)
!1597 = !MDLocation(line: 562, column: 9, scope: !1598)
!1598 = !{!"0xb\00561\005\0097", !1, !1595}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1599 = !MDLocation(line: 564, column: 9, scope: !1598)
!1600 = !MDLocation(line: 565, column: 17, scope: !1598)
!1601 = !MDLocation(line: 565, column: 9, scope: !1598)
!1602 = !MDLocation(line: 566, column: 5, scope: !1598)
!1603 = !MDLocation(line: 568, column: 5, scope: !472)
!1604 = !MDLocation(line: 569, column: 15, scope: !472)
!1605 = !MDLocation(line: 569, column: 37, scope: !472)
!1606 = !MDLocation(line: 569, column: 60, scope: !472)
!1607 = !MDLocation(line: 569, column: 86, scope: !472)
!1608 = !MDLocation(line: 570, column: 22, scope: !472)
!1609 = !MDLocation(line: 570, column: 12, scope: !472)
!1610 = !MDLocation(line: 572, column: 9, scope: !1611)
!1611 = !{!"0xb\00572\009\0098", !1, !472}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1612 = !MDLocation(line: 572, column: 9, scope: !472)
!1613 = !MDLocation(line: 574, column: 9, scope: !1614)
!1614 = !{!"0xb\00573\005\0099", !1, !1611}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1615 = !MDLocation(line: 576, column: 9, scope: !1614)
!1616 = !MDLocation(line: 577, column: 17, scope: !1614)
!1617 = !MDLocation(line: 577, column: 9, scope: !1614)
!1618 = !MDLocation(line: 578, column: 5, scope: !1614)
!1619 = !MDLocation(line: 582, column: 17, scope: !472)
!1620 = !MDLocation(line: 582, column: 42, scope: !472)
!1621 = !MDLocation(line: 582, column: 16, scope: !472)
!1622 = !MDLocation(line: 584, column: 5, scope: !472)
!1623 = !MDLocation(line: 586, column: 5, scope: !472)
!1624 = !MDLocation(line: 590, column: 13, scope: !1625)
!1625 = !{!"0xb\00590\0013\00101", !1, !1626}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1626 = !{!"0xb\00587\005\00100", !1, !472}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1627 = !MDLocation(line: 590, column: 13, scope: !1626)
!1628 = !MDLocation(line: 592, column: 13, scope: !1629)
!1629 = !{!"0xb\00591\009\00102", !1, !1625}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1630 = !MDLocation(line: 594, column: 17, scope: !1631)
!1631 = !{!"0xb\00594\0017\00103", !1, !1629}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1632 = !MDLocation(line: 594, column: 17, scope: !1629)
!1633 = !MDLocation(line: 596, column: 17, scope: !1634)
!1634 = !{!"0xb\00595\0013\00104", !1, !1631}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1635 = !MDLocation(line: 597, column: 27, scope: !1634)
!1636 = !MDLocation(line: 597, column: 49, scope: !1634)
!1637 = !MDLocation(line: 597, column: 72, scope: !1634)
!1638 = !MDLocation(line: 597, column: 98, scope: !1634)
!1639 = !MDLocation(line: 598, column: 13, scope: !1634)
!1640 = !MDLocation(line: 601, column: 38, scope: !1641)
!1641 = !{!"0xb\00600\0013\00105", !1, !1631}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1642 = !MDLocation(line: 601, column: 37, scope: !1641)
!1643 = !MDLocation(line: 601, column: 17, scope: !1641)
!1644 = !MDLocation(line: 602, column: 27, scope: !1641)
!1645 = !MDLocation(line: 602, column: 36, scope: !1641)
!1646 = !MDLocation(line: 602, column: 56, scope: !1641)
!1647 = !MDLocation(line: 602, column: 82, scope: !1641)
!1648 = !MDLocation(line: 604, column: 9, scope: !1629)
!1649 = !MDLocation(line: 607, column: 34, scope: !1650)
!1650 = !{!"0xb\00606\009\00106", !1, !1625}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1651 = !MDLocation(line: 607, column: 33, scope: !1650)
!1652 = !MDLocation(line: 607, column: 13, scope: !1650)
!1653 = !MDLocation(line: 609, column: 17, scope: !1654)
!1654 = !{!"0xb\00609\0017\00107", !1, !1650}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1655 = !MDLocation(line: 609, column: 17, scope: !1650)
!1656 = !MDLocation(line: 611, column: 17, scope: !1657)
!1657 = !{!"0xb\00610\0013\00108", !1, !1654}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1658 = !MDLocation(line: 612, column: 27, scope: !1657)
!1659 = !MDLocation(line: 612, column: 36, scope: !1657)
!1660 = !MDLocation(line: 612, column: 60, scope: !1657)
!1661 = !MDLocation(line: 612, column: 89, scope: !1657)
!1662 = !MDLocation(line: 613, column: 13, scope: !1657)
!1663 = !MDLocation(line: 616, column: 38, scope: !1664)
!1664 = !{!"0xb\00615\0013\00109", !1, !1654}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1665 = !MDLocation(line: 616, column: 37, scope: !1664)
!1666 = !MDLocation(line: 616, column: 17, scope: !1664)
!1667 = !MDLocation(line: 617, column: 27, scope: !1664)
!1668 = !MDLocation(line: 617, column: 36, scope: !1664)
!1669 = !MDLocation(line: 617, column: 73, scope: !1664)
!1670 = !MDLocation(line: 621, column: 9, scope: !1626)
!1671 = !MDLocation(line: 623, column: 9, scope: !1626)
!1672 = !MDLocation(line: 625, column: 13, scope: !1673)
!1673 = !{!"0xb\00625\0013\00110", !1, !1626}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1674 = !MDLocation(line: 625, column: 13, scope: !1626)
!1675 = !MDLocation(line: 627, column: 13, scope: !1676)
!1676 = !{!"0xb\00626\009\00111", !1, !1673}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1677 = !MDLocation(line: 628, column: 23, scope: !1676)
!1678 = !MDLocation(line: 628, column: 45, scope: !1676)
!1679 = !MDLocation(line: 628, column: 68, scope: !1676)
!1680 = !MDLocation(line: 628, column: 94, scope: !1676)
!1681 = !MDLocation(line: 629, column: 9, scope: !1676)
!1682 = !MDLocation(line: 632, column: 34, scope: !1683)
!1683 = !{!"0xb\00631\009\00112", !1, !1673}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1684 = !MDLocation(line: 632, column: 33, scope: !1683)
!1685 = !MDLocation(line: 632, column: 13, scope: !1683)
!1686 = !MDLocation(line: 633, column: 23, scope: !1683)
!1687 = !MDLocation(line: 633, column: 32, scope: !1683)
!1688 = !MDLocation(line: 633, column: 56, scope: !1683)
!1689 = !MDLocation(line: 633, column: 85, scope: !1683)
!1690 = !MDLocation(line: 636, column: 9, scope: !1626)
!1691 = !MDLocation(line: 638, column: 9, scope: !1626)
!1692 = !MDLocation(line: 640, column: 13, scope: !1693)
!1693 = !{!"0xb\00640\0013\00113", !1, !1626}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1694 = !MDLocation(line: 640, column: 13, scope: !1626)
!1695 = !MDLocation(line: 642, column: 13, scope: !1696)
!1696 = !{!"0xb\00641\009\00114", !1, !1693}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1697 = !MDLocation(line: 643, column: 23, scope: !1696)
!1698 = !MDLocation(line: 643, column: 45, scope: !1696)
!1699 = !MDLocation(line: 643, column: 68, scope: !1696)
!1700 = !MDLocation(line: 643, column: 94, scope: !1696)
!1701 = !MDLocation(line: 644, column: 9, scope: !1696)
!1702 = !MDLocation(line: 647, column: 34, scope: !1703)
!1703 = !{!"0xb\00646\009\00115", !1, !1693}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1704 = !MDLocation(line: 647, column: 33, scope: !1703)
!1705 = !MDLocation(line: 647, column: 13, scope: !1703)
!1706 = !MDLocation(line: 648, column: 23, scope: !1703)
!1707 = !MDLocation(line: 648, column: 32, scope: !1703)
!1708 = !MDLocation(line: 648, column: 52, scope: !1703)
!1709 = !MDLocation(line: 648, column: 78, scope: !1703)
!1710 = !MDLocation(line: 651, column: 9, scope: !1626)
!1711 = !MDLocation(line: 653, column: 9, scope: !1626)
!1712 = !MDLocation(line: 654, column: 9, scope: !1626)
!1713 = !MDLocation(line: 655, column: 19, scope: !1626)
!1714 = !MDLocation(line: 655, column: 42, scope: !1626)
!1715 = !MDLocation(line: 655, column: 65, scope: !1626)
!1716 = !MDLocation(line: 655, column: 91, scope: !1626)
!1717 = !MDLocation(line: 656, column: 9, scope: !1626)
!1718 = !MDLocation(line: 659, column: 22, scope: !472)
!1719 = !MDLocation(line: 659, column: 12, scope: !472)
!1720 = !MDLocation(line: 661, column: 9, scope: !1721)
!1721 = !{!"0xb\00661\009\00116", !1, !472}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1722 = !MDLocation(line: 661, column: 9, scope: !472)
!1723 = !MDLocation(line: 663, column: 9, scope: !1724)
!1724 = !{!"0xb\00662\005\00117", !1, !1721}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1725 = !MDLocation(line: 665, column: 9, scope: !1724)
!1726 = !MDLocation(line: 666, column: 17, scope: !1724)
!1727 = !MDLocation(line: 666, column: 9, scope: !1724)
!1728 = !MDLocation(line: 667, column: 5, scope: !1724)
!1729 = !MDLocation(line: 669, column: 5, scope: !472)
!1730 = !{!"0x101\00x\0016777888\000", !473, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 672]
!1731 = !MDLocation(line: 672, column: 47, scope: !473)
!1732 = !{!"0x101\00b\0033555104\000", !473, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 672]
!1733 = !MDLocation(line: 672, column: 57, scope: !473)
!1734 = !{!"0x101\00d\0050332320\000", !473, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 672]
!1735 = !MDLocation(line: 672, column: 68, scope: !473)
!1736 = !{!"0x101\00bestmv\0067109537\000", !473, !69, !73} ; [ DW_TAG_arg_variable ] [bestmv] [line 673]
!1737 = !MDLocation(line: 673, column: 43, scope: !473)
!1738 = !{!"0x101\00ref_mv\0083886753\000", !473, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 673]
!1739 = !MDLocation(line: 673, column: 59, scope: !473)
!1740 = !{!"0x101\00error_per_bit\00100663970\000", !473, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 674]
!1741 = !MDLocation(line: 674, column: 39, scope: !473)
!1742 = !{!"0x101\00vfp\00117441187\000", !473, !69, !424} ; [ DW_TAG_arg_variable ] [vfp] [line 675]
!1743 = !MDLocation(line: 675, column: 64, scope: !473)
!1744 = !{!"0x101\00mvcost\00134218404\000", !473, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 676]
!1745 = !MDLocation(line: 676, column: 40, scope: !473)
!1746 = !{!"0x101\00distortion\00150995620\000", !473, !69, !89} ; [ DW_TAG_arg_variable ] [distortion] [line 676]
!1747 = !MDLocation(line: 676, column: 56, scope: !473)
!1748 = !{!"0x101\00sse1\00167772837\000", !473, !69, !319} ; [ DW_TAG_arg_variable ] [sse1] [line 677]
!1749 = !MDLocation(line: 677, column: 49, scope: !473)
!1750 = !{!"0x100\00bestmse\00679\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [bestmse] [line 679]
!1751 = !MDLocation(line: 679, column: 9, scope: !473)
!1752 = !{!"0x100\00startmv\00680\000", !473, !69, !74} ; [ DW_TAG_auto_variable ] [startmv] [line 680]
!1753 = !MDLocation(line: 680, column: 12, scope: !473)
!1754 = !{!"0x100\00this_mv\00681\000", !473, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 681]
!1755 = !MDLocation(line: 681, column: 12, scope: !473)
!1756 = !MDLocation(line: 682, column: 27, scope: !473)
!1757 = !MDLocation(line: 682, column: 25, scope: !473)
!1758 = !MDLocation(line: 682, column: 42, scope: !473)
!1759 = !{!"0x100\00z\00682\000", !473, !69, !60} ; [ DW_TAG_auto_variable ] [z] [line 682]
!1760 = !MDLocation(line: 682, column: 20, scope: !473)
!1761 = !{!"0x100\00sse\00684\000", !473, !69, !80} ; [ DW_TAG_auto_variable ] [sse] [line 684]
!1762 = !MDLocation(line: 684, column: 18, scope: !473)
!1763 = !MDLocation(line: 688, column: 22, scope: !473)
!1764 = !{!"0x100\00pre_stride\00688\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 688]
!1765 = !MDLocation(line: 688, column: 9, scope: !473)
!1766 = !MDLocation(line: 689, column: 31, scope: !473)
!1767 = !{!"0x100\00base_pre\00689\000", !473, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 689]
!1768 = !MDLocation(line: 689, column: 20, scope: !473)
!1769 = !MDLocation(line: 692, column: 23, scope: !473)
!1770 = !{!"0x100\00xd\00692\000", !473, !69, !718} ; [ DW_TAG_auto_variable ] [xd] [line 692]
!1771 = !MDLocation(line: 692, column: 18, scope: !473)
!1772 = !MDLocation(line: 693, column: 37, scope: !473)
!1773 = !MDLocation(line: 693, column: 26, scope: !473)
!1774 = !MDLocation(line: 693, column: 50, scope: !473)
!1775 = !MDLocation(line: 693, column: 49, scope: !473)
!1776 = !MDLocation(line: 693, column: 84, scope: !473)
!1777 = !{!"0x100\00y_0\00693\000", !473, !69, !60} ; [ DW_TAG_auto_variable ] [y_0] [line 693]
!1778 = !MDLocation(line: 693, column: 20, scope: !473)
!1779 = !{!"0x100\00y_stride\00687\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [y_stride] [line 687]
!1780 = !MDLocation(line: 687, column: 9, scope: !473)
!1781 = !MDLocation(line: 698, column: 5, scope: !473)
!1782 = !MDLocation(line: 698, column: 18, scope: !473)
!1783 = !MDLocation(line: 698, column: 52, scope: !473)
!1784 = !MDLocation(line: 699, column: 9, scope: !473)
!1785 = !{!"0x100\00y\00694\000", !473, !69, !60} ; [ DW_TAG_auto_variable ] [y] [line 694]
!1786 = !MDLocation(line: 694, column: 20, scope: !473)
!1787 = !MDLocation(line: 706, column: 5, scope: !473)
!1788 = !MDLocation(line: 707, column: 5, scope: !473)
!1789 = !MDLocation(line: 708, column: 5, scope: !473)
!1790 = !MDLocation(line: 711, column: 15, scope: !473)
!1791 = !MDLocation(line: 711, column: 39, scope: !473)
!1792 = !MDLocation(line: 712, column: 5, scope: !473)
!1793 = !MDLocation(line: 713, column: 16, scope: !473)
!1794 = !MDLocation(line: 713, column: 5, scope: !473)
!1795 = !MDLocation(line: 716, column: 25, scope: !473)
!1796 = !MDLocation(line: 716, column: 5, scope: !473)
!1797 = !MDLocation(line: 717, column: 27, scope: !473)
!1798 = !MDLocation(line: 717, column: 26, scope: !473)
!1799 = !MDLocation(line: 717, column: 25, scope: !473)
!1800 = !MDLocation(line: 717, column: 5, scope: !473)
!1801 = !MDLocation(line: 718, column: 15, scope: !473)
!1802 = !MDLocation(line: 718, column: 34, scope: !473)
!1803 = !MDLocation(line: 718, column: 54, scope: !473)
!1804 = !{!"0x100\00thismse\00686\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [thismse] [line 686]
!1805 = !MDLocation(line: 686, column: 9, scope: !473)
!1806 = !MDLocation(line: 719, column: 22, scope: !473)
!1807 = !MDLocation(line: 719, column: 12, scope: !473)
!1808 = !{!"0x100\00left\00683\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [left] [line 683]
!1809 = !MDLocation(line: 683, column: 9, scope: !473)
!1810 = !MDLocation(line: 721, column: 9, scope: !1811)
!1811 = !{!"0xb\00721\009\00118", !1, !473}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1812 = !MDLocation(line: 721, column: 9, scope: !473)
!1813 = !MDLocation(line: 723, column: 9, scope: !1814)
!1814 = !{!"0xb\00722\005\00119", !1, !1811}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1815 = !MDLocation(line: 725, column: 9, scope: !1814)
!1816 = !MDLocation(line: 726, column: 17, scope: !1814)
!1817 = !MDLocation(line: 726, column: 9, scope: !1814)
!1818 = !MDLocation(line: 727, column: 5, scope: !1814)
!1819 = !MDLocation(line: 729, column: 5, scope: !473)
!1820 = !MDLocation(line: 730, column: 15, scope: !473)
!1821 = !MDLocation(line: 730, column: 50, scope: !473)
!1822 = !MDLocation(line: 731, column: 23, scope: !473)
!1823 = !MDLocation(line: 731, column: 13, scope: !473)
!1824 = !{!"0x100\00right\00683\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [right] [line 683]
!1825 = !MDLocation(line: 683, column: 15, scope: !473)
!1826 = !MDLocation(line: 733, column: 9, scope: !1827)
!1827 = !{!"0xb\00733\009\00120", !1, !473}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1828 = !MDLocation(line: 733, column: 9, scope: !473)
!1829 = !MDLocation(line: 735, column: 9, scope: !1830)
!1830 = !{!"0xb\00734\005\00121", !1, !1827}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1831 = !MDLocation(line: 737, column: 9, scope: !1830)
!1832 = !MDLocation(line: 738, column: 17, scope: !1830)
!1833 = !MDLocation(line: 738, column: 9, scope: !1830)
!1834 = !MDLocation(line: 739, column: 5, scope: !1830)
!1835 = !MDLocation(line: 742, column: 25, scope: !473)
!1836 = !MDLocation(line: 742, column: 5, scope: !473)
!1837 = !MDLocation(line: 743, column: 27, scope: !473)
!1838 = !MDLocation(line: 743, column: 26, scope: !473)
!1839 = !MDLocation(line: 743, column: 25, scope: !473)
!1840 = !MDLocation(line: 743, column: 5, scope: !473)
!1841 = !MDLocation(line: 744, column: 15, scope: !473)
!1842 = !MDLocation(line: 744, column: 34, scope: !473)
!1843 = !MDLocation(line: 744, column: 61, scope: !473)
!1844 = !MDLocation(line: 745, column: 20, scope: !473)
!1845 = !MDLocation(line: 745, column: 10, scope: !473)
!1846 = !{!"0x100\00up\00683\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [up] [line 683]
!1847 = !MDLocation(line: 683, column: 22, scope: !473)
!1848 = !MDLocation(line: 747, column: 9, scope: !1849)
!1849 = !{!"0xb\00747\009\00122", !1, !473}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1850 = !MDLocation(line: 747, column: 9, scope: !473)
!1851 = !MDLocation(line: 749, column: 9, scope: !1852)
!1852 = !{!"0xb\00748\005\00123", !1, !1849}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1853 = !MDLocation(line: 751, column: 9, scope: !1852)
!1854 = !MDLocation(line: 752, column: 17, scope: !1852)
!1855 = !MDLocation(line: 752, column: 9, scope: !1852)
!1856 = !MDLocation(line: 753, column: 5, scope: !1852)
!1857 = !MDLocation(line: 755, column: 5, scope: !473)
!1858 = !MDLocation(line: 756, column: 15, scope: !473)
!1859 = !MDLocation(line: 756, column: 50, scope: !473)
!1860 = !MDLocation(line: 757, column: 22, scope: !473)
!1861 = !MDLocation(line: 757, column: 12, scope: !473)
!1862 = !{!"0x100\00down\00683\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [down] [line 683]
!1863 = !MDLocation(line: 683, column: 26, scope: !473)
!1864 = !MDLocation(line: 759, column: 9, scope: !1865)
!1865 = !{!"0xb\00759\009\00124", !1, !473}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1866 = !MDLocation(line: 759, column: 9, scope: !473)
!1867 = !MDLocation(line: 761, column: 9, scope: !1868)
!1868 = !{!"0xb\00760\005\00125", !1, !1865}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1869 = !MDLocation(line: 763, column: 9, scope: !1868)
!1870 = !MDLocation(line: 764, column: 17, scope: !1868)
!1871 = !MDLocation(line: 764, column: 9, scope: !1868)
!1872 = !MDLocation(line: 765, column: 5, scope: !1868)
!1873 = !MDLocation(line: 768, column: 17, scope: !473)
!1874 = !MDLocation(line: 768, column: 42, scope: !473)
!1875 = !MDLocation(line: 768, column: 16, scope: !473)
!1876 = !{!"0x100\00whichdir\00685\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [whichdir] [line 685]
!1877 = !MDLocation(line: 685, column: 9, scope: !473)
!1878 = !MDLocation(line: 769, column: 5, scope: !473)
!1879 = !MDLocation(line: 771, column: 5, scope: !473)
!1880 = !MDLocation(line: 774, column: 30, scope: !1881)
!1881 = !{!"0xb\00772\005\00126", !1, !473}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1882 = !MDLocation(line: 774, column: 29, scope: !1881)
!1883 = !MDLocation(line: 774, column: 9, scope: !1881)
!1884 = !MDLocation(line: 775, column: 30, scope: !1881)
!1885 = !MDLocation(line: 775, column: 29, scope: !1881)
!1886 = !MDLocation(line: 775, column: 9, scope: !1881)
!1887 = !MDLocation(line: 776, column: 19, scope: !1881)
!1888 = !MDLocation(line: 776, column: 39, scope: !1881)
!1889 = !MDLocation(line: 776, column: 70, scope: !1881)
!1890 = !MDLocation(line: 777, column: 9, scope: !1881)
!1891 = !MDLocation(line: 779, column: 9, scope: !1881)
!1892 = !MDLocation(line: 780, column: 30, scope: !1881)
!1893 = !MDLocation(line: 780, column: 29, scope: !1881)
!1894 = !MDLocation(line: 780, column: 9, scope: !1881)
!1895 = !MDLocation(line: 781, column: 19, scope: !1881)
!1896 = !MDLocation(line: 781, column: 39, scope: !1881)
!1897 = !MDLocation(line: 781, column: 66, scope: !1881)
!1898 = !MDLocation(line: 782, column: 9, scope: !1881)
!1899 = !MDLocation(line: 784, column: 30, scope: !1881)
!1900 = !MDLocation(line: 784, column: 29, scope: !1881)
!1901 = !MDLocation(line: 784, column: 9, scope: !1881)
!1902 = !MDLocation(line: 785, column: 9, scope: !1881)
!1903 = !MDLocation(line: 786, column: 19, scope: !1881)
!1904 = !MDLocation(line: 786, column: 39, scope: !1881)
!1905 = !MDLocation(line: 786, column: 59, scope: !1881)
!1906 = !MDLocation(line: 787, column: 9, scope: !1881)
!1907 = !MDLocation(line: 790, column: 9, scope: !1881)
!1908 = !MDLocation(line: 791, column: 9, scope: !1881)
!1909 = !MDLocation(line: 792, column: 19, scope: !1881)
!1910 = !MDLocation(line: 792, column: 55, scope: !1881)
!1911 = !MDLocation(line: 793, column: 9, scope: !1881)
!1912 = !MDLocation(line: 796, column: 22, scope: !473)
!1913 = !MDLocation(line: 796, column: 12, scope: !473)
!1914 = !{!"0x100\00diag\00683\000", !473, !69, !72} ; [ DW_TAG_auto_variable ] [diag] [line 683]
!1915 = !MDLocation(line: 683, column: 32, scope: !473)
!1916 = !MDLocation(line: 798, column: 9, scope: !1917)
!1917 = !{!"0xb\00798\009\00127", !1, !473}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1918 = !MDLocation(line: 798, column: 9, scope: !473)
!1919 = !MDLocation(line: 800, column: 9, scope: !1920)
!1920 = !{!"0xb\00799\005\00128", !1, !1917}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!1921 = !MDLocation(line: 802, column: 9, scope: !1920)
!1922 = !MDLocation(line: 803, column: 17, scope: !1920)
!1923 = !MDLocation(line: 803, column: 9, scope: !1920)
!1924 = !MDLocation(line: 804, column: 5, scope: !1920)
!1925 = !MDLocation(line: 806, column: 5, scope: !473)
!1926 = !{!"0x101\00x\0016778067\000", !474, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 851]
!1927 = !MDLocation(line: 851, column: 17, scope: !474)
!1928 = !{!"0x101\00b\0033555284\000", !474, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 852]
!1929 = !MDLocation(line: 852, column: 12, scope: !474)
!1930 = !{!"0x101\00d\0050332501\000", !474, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 853]
!1931 = !MDLocation(line: 853, column: 13, scope: !474)
!1932 = !{!"0x101\00ref_mv\0067109718\000", !474, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 854]
!1933 = !MDLocation(line: 854, column: 13, scope: !474)
!1934 = !{!"0x101\00best_mv\0083886935\000", !474, !69, !73} ; [ DW_TAG_arg_variable ] [best_mv] [line 855]
!1935 = !MDLocation(line: 855, column: 13, scope: !474)
!1936 = !{!"0x101\00search_param\00100664152\000", !474, !69, !72} ; [ DW_TAG_arg_variable ] [search_param] [line 856]
!1937 = !MDLocation(line: 856, column: 9, scope: !474)
!1938 = !{!"0x101\00sad_per_bit\00117441369\000", !474, !69, !72} ; [ DW_TAG_arg_variable ] [sad_per_bit] [line 857]
!1939 = !MDLocation(line: 857, column: 9, scope: !474)
!1940 = !{!"0x101\00vfp\00134218586\000", !474, !69, !424} ; [ DW_TAG_arg_variable ] [vfp] [line 858]
!1941 = !MDLocation(line: 858, column: 34, scope: !474)
!1942 = !{!"0x101\00mvsadcost\00150995803\000", !474, !69, !88} ; [ DW_TAG_arg_variable ] [mvsadcost] [line 859]
!1943 = !MDLocation(line: 859, column: 10, scope: !474)
!1944 = !{!"0x101\00mvcost\00167773020\000", !474, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 860]
!1945 = !MDLocation(line: 860, column: 10, scope: !474)
!1946 = !{!"0x101\00center_mv\00184550237\000", !474, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 861]
!1947 = !MDLocation(line: 861, column: 13, scope: !474)
!1948 = !{!"0x100\00hex\00864\000", !474, !69, !1949} ; [ DW_TAG_auto_variable ] [hex] [line 864]
!1949 = !{!"0x1\00\000\00192\0016\000\000\000", null, null, !82, !1950, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 16, offset 0] [from MV]
!1950 = !{!501}
!1951 = !MDLocation(line: 864, column: 8, scope: !474)
!1952 = !{!"0x100\00neighbors\00865\000", !474, !69, !1953} ; [ DW_TAG_auto_variable ] [neighbors] [line 865]
!1953 = !{!"0x1\00\000\00128\0016\000\000\000", null, null, !82, !243, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 16, offset 0] [from MV]
!1954 = !MDLocation(line: 865, column: 8, scope: !474)
!1955 = !MDLocation(line: 868, column: 30, scope: !474)
!1956 = !MDLocation(line: 868, column: 28, scope: !474)
!1957 = !MDLocation(line: 868, column: 45, scope: !474)
!1958 = !{!"0x100\00what\00868\000", !474, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 868]
!1959 = !MDLocation(line: 868, column: 20, scope: !474)
!1960 = !MDLocation(line: 869, column: 23, scope: !474)
!1961 = !{!"0x100\00what_stride\00869\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 869]
!1962 = !MDLocation(line: 869, column: 9, scope: !474)
!1963 = !MDLocation(line: 870, column: 22, scope: !474)
!1964 = !{!"0x100\00pre_stride\00870\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 870]
!1965 = !MDLocation(line: 870, column: 9, scope: !474)
!1966 = !MDLocation(line: 871, column: 31, scope: !474)
!1967 = !{!"0x100\00base_pre\00871\000", !474, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 871]
!1968 = !MDLocation(line: 871, column: 20, scope: !474)
!1969 = !{!"0x100\00in_what_stride\00873\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 873]
!1970 = !MDLocation(line: 873, column: 9, scope: !474)
!1971 = !{!"0x100\00this_mv\00875\000", !474, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 875]
!1972 = !MDLocation(line: 875, column: 12, scope: !474)
!1973 = !{!"0x100\00k\00880\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [k] [line 880]
!1974 = !MDLocation(line: 880, column: 9, scope: !474)
!1975 = !{!"0x100\00best_site\00882\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [best_site] [line 882]
!1976 = !MDLocation(line: 882, column: 9, scope: !474)
!1977 = !{!"0x100\00hex_range\00883\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [hex_range] [line 883]
!1978 = !MDLocation(line: 883, column: 9, scope: !474)
!1979 = !{!"0x100\00dia_range\00884\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [dia_range] [line 884]
!1980 = !MDLocation(line: 884, column: 9, scope: !474)
!1981 = !{!"0x100\00fcenter_mv\00886\000", !474, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 886]
!1982 = !MDLocation(line: 886, column: 12, scope: !474)
!1983 = !MDLocation(line: 887, column: 28, scope: !474)
!1984 = !MDLocation(line: 887, column: 5, scope: !474)
!1985 = !MDLocation(line: 888, column: 28, scope: !474)
!1986 = !MDLocation(line: 888, column: 5, scope: !474)
!1987 = !MDLocation(line: 891, column: 26, scope: !474)
!1988 = !MDLocation(line: 891, column: 41, scope: !474)
!1989 = !MDLocation(line: 891, column: 56, scope: !474)
!1990 = !MDLocation(line: 891, column: 71, scope: !474)
!1991 = !MDLocation(line: 891, column: 5, scope: !474)
!1992 = !MDLocation(line: 892, column: 10, scope: !474)
!1993 = !{!"0x100\00br\00874\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [br] [line 874]
!1994 = !MDLocation(line: 874, column: 9, scope: !474)
!1995 = !MDLocation(line: 893, column: 10, scope: !474)
!1996 = !{!"0x100\00bc\00874\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [bc] [line 874]
!1997 = !MDLocation(line: 874, column: 13, scope: !474)
!1998 = !MDLocation(line: 896, column: 48, scope: !474)
!1999 = !MDLocation(line: 896, column: 37, scope: !474)
!2000 = !{!"0x100\00base_offset\00878\000", !474, !69, !60} ; [ DW_TAG_auto_variable ] [base_offset] [line 878]
!2001 = !MDLocation(line: 878, column: 20, scope: !474)
!2002 = !MDLocation(line: 897, column: 34, scope: !474)
!2003 = !MDLocation(line: 897, column: 19, scope: !474)
!2004 = !{!"0x100\00this_offset\00879\000", !474, !69, !60} ; [ DW_TAG_auto_variable ] [this_offset] [line 879]
!2005 = !MDLocation(line: 879, column: 20, scope: !474)
!2006 = !MDLocation(line: 898, column: 25, scope: !474)
!2007 = !MDLocation(line: 898, column: 5, scope: !474)
!2008 = !MDLocation(line: 899, column: 25, scope: !474)
!2009 = !MDLocation(line: 899, column: 5, scope: !474)
!2010 = !MDLocation(line: 900, column: 15, scope: !474)
!2011 = !MDLocation(line: 901, column: 15, scope: !474)
!2012 = !{!"0x100\00bestsad\00876\000", !474, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 876]
!2013 = !MDLocation(line: 876, column: 18, scope: !474)
!2014 = !{!"0x100\00all_in\00881\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [all_in] [line 881]
!2015 = !MDLocation(line: 881, column: 9, scope: !474)
!2016 = !MDLocation(line: 916, column: 5, scope: !2017)
!2017 = !{!"0xb\00916\005\00129", !1, !474}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2018 = !MDLocation(line: 918, column: 8, scope: !474)
!2019 = !{!"0x100\00i\00866\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 866]
!2020 = !MDLocation(line: 866, column: 9, scope: !474)
!2021 = !MDLocation(line: 920, column: 14, scope: !2022)
!2022 = !{!"0xb\00920\009\00132", !1, !2023}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2023 = !{!"0xb\00919\005\00131", !1, !2024}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2024 = !{!"0xb\00918\008\00130", !1, !474}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2025 = !MDLocation(line: 920, column: 21, scope: !2026)
!2026 = !{!"0xb\002", !1, !2027}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2027 = !{!"0xb\001", !1, !2028}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2028 = !{!"0xb\00920\009\00133", !1, !2022}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2029 = !MDLocation(line: 920, column: 9, scope: !2022)
!2030 = !MDLocation(line: 922, column: 38, scope: !2031)
!2031 = !{!"0xb\00921\009\00134", !1, !2028}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2032 = !MDLocation(line: 922, column: 33, scope: !2031)
!2033 = !MDLocation(line: 922, column: 13, scope: !2031)
!2034 = !MDLocation(line: 923, column: 38, scope: !2031)
!2035 = !MDLocation(line: 923, column: 33, scope: !2031)
!2036 = !MDLocation(line: 923, column: 13, scope: !2031)
!2037 = !MDLocation(line: 924, column: 42, scope: !2031)
!2038 = !MDLocation(line: 924, column: 27, scope: !2031)
!2039 = !MDLocation(line: 924, column: 80, scope: !2031)
!2040 = !MDLocation(line: 925, column: 23, scope: !2031)
!2041 = !{!"0x100\00thissad\00877\000", !474, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 877]
!2042 = !MDLocation(line: 877, column: 18, scope: !474)
!2043 = !MDLocation(line: 926, column: 13, scope: !2044)
!2044 = !{!"0xb\00926\0013\00136", !1, !2045}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2045 = !{!"0xb\00926\0013\00135", !1, !2031}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2046 = !MDLocation(line: 926, column: 13, scope: !2045)
!2047 = !MDLocation(line: 926, column: 13, scope: !2048)
!2048 = !{!"0xb\001", !1, !2049}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2049 = !{!"0xb\00926\0013\00137", !1, !2044}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2050 = !MDLocation(line: 926, column: 13, scope: !2051)
!2051 = !{!"0xb\00926\0013\00138", !1, !2049}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2052 = !MDLocation(line: 926, column: 13, scope: !2049)
!2053 = !MDLocation(line: 926, column: 13, scope: !2054)
!2054 = !{!"0xb\002", !1, !2055}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2055 = !{!"0xb\00926\0013\00139", !1, !2051}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2056 = !MDLocation(line: 926, column: 13, scope: !2057)
!2057 = !{!"0xb\004", !1, !2058}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2058 = !{!"0xb\003", !1, !2049}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2059 = !MDLocation(line: 927, column: 9, scope: !2031)
!2060 = !MDLocation(line: 920, column: 28, scope: !2028)
!2061 = !MDLocation(line: 920, column: 9, scope: !2028)
!2062 = !MDLocation(line: 928, column: 5, scope: !2023)
!2063 = !MDLocation(line: 930, column: 14, scope: !2064)
!2064 = !{!"0xb\00930\009\00141", !1, !2065}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2065 = !{!"0xb\00929\005\00140", !1, !2024}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2066 = !MDLocation(line: 930, column: 21, scope: !2067)
!2067 = !{!"0xb\002", !1, !2068}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2068 = !{!"0xb\001", !1, !2069}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2069 = !{!"0xb\00930\009\00142", !1, !2064}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2070 = !MDLocation(line: 930, column: 9, scope: !2064)
!2071 = !MDLocation(line: 932, column: 38, scope: !2072)
!2072 = !{!"0xb\00931\009\00143", !1, !2069}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2073 = !MDLocation(line: 932, column: 33, scope: !2072)
!2074 = !MDLocation(line: 932, column: 13, scope: !2072)
!2075 = !MDLocation(line: 933, column: 38, scope: !2072)
!2076 = !MDLocation(line: 933, column: 33, scope: !2072)
!2077 = !MDLocation(line: 933, column: 13, scope: !2072)
!2078 = !MDLocation(line: 934, column: 13, scope: !2079)
!2079 = !{!"0xb\00934\0013\00145", !1, !2080}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2080 = !{!"0xb\00934\0013\00144", !1, !2072}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2081 = !MDLocation(line: 934, column: 13, scope: !2080)
!2082 = !MDLocation(line: 934, column: 13, scope: !2083)
!2083 = !{!"0xb\001", !1, !2079}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2084 = !MDLocation(line: 934, column: 13, scope: !2085)
!2085 = !{!"0xb\002", !1, !2086}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2086 = !{!"0xb\00934\0013\00146", !1, !2080}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2087 = !MDLocation(line: 934, column: 13, scope: !2088)
!2088 = !{!"0xb\003", !1, !2086}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2089 = !MDLocation(line: 934, column: 13, scope: !2090)
!2090 = !{!"0xb\004", !1, !2091}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2091 = !{!"0xb\00934\0013\00147", !1, !2080}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2092 = !MDLocation(line: 934, column: 13, scope: !2093)
!2093 = !{!"0xb\005", !1, !2091}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2094 = !MDLocation(line: 934, column: 13, scope: !2095)
!2095 = !{!"0xb\006", !1, !2096}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2096 = !{!"0xb\00934\0013\00148", !1, !2080}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2097 = !MDLocation(line: 934, column: 13, scope: !2098)
!2098 = !{!"0xb\007", !1, !2096}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2099 = !MDLocation(line: 935, column: 42, scope: !2072)
!2100 = !MDLocation(line: 935, column: 27, scope: !2072)
!2101 = !MDLocation(line: 935, column: 80, scope: !2072)
!2102 = !MDLocation(line: 936, column: 23, scope: !2072)
!2103 = !MDLocation(line: 937, column: 13, scope: !2104)
!2104 = !{!"0xb\00937\0013\00150", !1, !2105}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2105 = !{!"0xb\00937\0013\00149", !1, !2072}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2106 = !MDLocation(line: 937, column: 13, scope: !2105)
!2107 = !MDLocation(line: 937, column: 13, scope: !2108)
!2108 = !{!"0xb\001", !1, !2109}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2109 = !{!"0xb\00937\0013\00151", !1, !2104}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2110 = !MDLocation(line: 937, column: 13, scope: !2111)
!2111 = !{!"0xb\00937\0013\00152", !1, !2109}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2112 = !MDLocation(line: 937, column: 13, scope: !2109)
!2113 = !MDLocation(line: 937, column: 13, scope: !2114)
!2114 = !{!"0xb\002", !1, !2115}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2115 = !{!"0xb\00937\0013\00153", !1, !2111}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2116 = !MDLocation(line: 937, column: 13, scope: !2117)
!2117 = !{!"0xb\004", !1, !2118}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2118 = !{!"0xb\003", !1, !2109}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2119 = !MDLocation(line: 938, column: 9, scope: !2072)
!2120 = !MDLocation(line: 930, column: 28, scope: !2069)
!2121 = !MDLocation(line: 930, column: 9, scope: !2069)
!2122 = !MDLocation(line: 941, column: 9, scope: !2123)
!2123 = !{!"0xb\00941\009\00154", !1, !474}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2124 = !MDLocation(line: 941, column: 9, scope: !474)
!2125 = !MDLocation(line: 942, column: 9, scope: !2123)
!2126 = !MDLocation(line: 945, column: 15, scope: !2127)
!2127 = !{!"0xb\00944\005\00155", !1, !2123}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2128 = !MDLocation(line: 945, column: 9, scope: !2127)
!2129 = !MDLocation(line: 946, column: 15, scope: !2127)
!2130 = !MDLocation(line: 946, column: 9, scope: !2127)
!2131 = !{!"0x100\00j\00866\000", !474, !69, !72} ; [ DW_TAG_auto_variable ] [j] [line 866]
!2132 = !MDLocation(line: 866, column: 12, scope: !474)
!2133 = !MDLocation(line: 950, column: 10, scope: !2134)
!2134 = !{!"0xb\00950\005\00156", !1, !474}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2135 = !MDLocation(line: 950, column: 17, scope: !2136)
!2136 = !{!"0xb\00950\005\00157", !1, !2134}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2137 = !MDLocation(line: 950, column: 5, scope: !2134)
!2138 = !MDLocation(line: 953, column: 9, scope: !2139)
!2139 = !{!"0xb\00953\009\00159", !1, !2140}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2140 = !{!"0xb\00951\005\00158", !1, !2136}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2141 = !MDLocation(line: 955, column: 12, scope: !2140)
!2142 = !MDLocation(line: 957, column: 18, scope: !2143)
!2143 = !{!"0xb\00957\0013\00162", !1, !2144}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2144 = !{!"0xb\00956\009\00161", !1, !2145}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2145 = !{!"0xb\00955\0012\00160", !1, !2140}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2146 = !MDLocation(line: 957, column: 25, scope: !2147)
!2147 = !{!"0xb\002", !1, !2148}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2148 = !{!"0xb\001", !1, !2149}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2149 = !{!"0xb\00957\0013\00163", !1, !2143}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2150 = !MDLocation(line: 957, column: 13, scope: !2143)
!2151 = !MDLocation(line: 959, column: 42, scope: !2152)
!2152 = !{!"0xb\00958\0013\00164", !1, !2149}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2153 = !MDLocation(line: 959, column: 37, scope: !2152)
!2154 = !MDLocation(line: 959, column: 17, scope: !2152)
!2155 = !MDLocation(line: 960, column: 42, scope: !2152)
!2156 = !MDLocation(line: 960, column: 37, scope: !2152)
!2157 = !MDLocation(line: 960, column: 17, scope: !2152)
!2158 = !MDLocation(line: 961, column: 46, scope: !2152)
!2159 = !MDLocation(line: 961, column: 31, scope: !2152)
!2160 = !MDLocation(line: 961, column: 86, scope: !2152)
!2161 = !MDLocation(line: 962, column: 27, scope: !2152)
!2162 = !MDLocation(line: 963, column: 17, scope: !2163)
!2163 = !{!"0xb\00963\0017\00166", !1, !2164}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2164 = !{!"0xb\00963\0017\00165", !1, !2152}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2165 = !MDLocation(line: 963, column: 17, scope: !2164)
!2166 = !MDLocation(line: 963, column: 17, scope: !2167)
!2167 = !{!"0xb\001", !1, !2168}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2168 = !{!"0xb\00963\0017\00167", !1, !2163}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2169 = !MDLocation(line: 963, column: 17, scope: !2170)
!2170 = !{!"0xb\00963\0017\00168", !1, !2168}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2171 = !MDLocation(line: 963, column: 17, scope: !2168)
!2172 = !MDLocation(line: 963, column: 17, scope: !2173)
!2173 = !{!"0xb\002", !1, !2174}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2174 = !{!"0xb\00963\0017\00169", !1, !2170}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2175 = !MDLocation(line: 963, column: 17, scope: !2176)
!2176 = !{!"0xb\004", !1, !2177}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2177 = !{!"0xb\003", !1, !2168}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2178 = !MDLocation(line: 964, column: 13, scope: !2152)
!2179 = !MDLocation(line: 957, column: 32, scope: !2149)
!2180 = !MDLocation(line: 957, column: 13, scope: !2149)
!2181 = !MDLocation(line: 965, column: 9, scope: !2144)
!2182 = !MDLocation(line: 967, column: 18, scope: !2183)
!2183 = !{!"0xb\00967\0013\00171", !1, !2184}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2184 = !{!"0xb\00966\009\00170", !1, !2145}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2185 = !MDLocation(line: 967, column: 25, scope: !2186)
!2186 = !{!"0xb\002", !1, !2187}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2187 = !{!"0xb\001", !1, !2188}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2188 = !{!"0xb\00967\0013\00172", !1, !2183}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2189 = !MDLocation(line: 967, column: 13, scope: !2183)
!2190 = !MDLocation(line: 969, column: 42, scope: !2191)
!2191 = !{!"0xb\00968\0013\00173", !1, !2188}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2192 = !MDLocation(line: 969, column: 37, scope: !2191)
!2193 = !MDLocation(line: 969, column: 17, scope: !2191)
!2194 = !MDLocation(line: 970, column: 42, scope: !2191)
!2195 = !MDLocation(line: 970, column: 37, scope: !2191)
!2196 = !MDLocation(line: 970, column: 17, scope: !2191)
!2197 = !MDLocation(line: 971, column: 17, scope: !2198)
!2198 = !{!"0xb\00971\0017\00175", !1, !2199}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2199 = !{!"0xb\00971\0017\00174", !1, !2191}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2200 = !MDLocation(line: 971, column: 17, scope: !2199)
!2201 = !MDLocation(line: 971, column: 17, scope: !2202)
!2202 = !{!"0xb\001", !1, !2198}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2203 = !MDLocation(line: 971, column: 17, scope: !2204)
!2204 = !{!"0xb\002", !1, !2205}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2205 = !{!"0xb\00971\0017\00176", !1, !2199}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2206 = !MDLocation(line: 971, column: 17, scope: !2207)
!2207 = !{!"0xb\003", !1, !2205}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2208 = !MDLocation(line: 971, column: 17, scope: !2209)
!2209 = !{!"0xb\004", !1, !2210}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2210 = !{!"0xb\00971\0017\00177", !1, !2199}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2211 = !MDLocation(line: 971, column: 17, scope: !2212)
!2212 = !{!"0xb\005", !1, !2210}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2213 = !MDLocation(line: 971, column: 17, scope: !2214)
!2214 = !{!"0xb\006", !1, !2215}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2215 = !{!"0xb\00971\0017\00178", !1, !2199}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2216 = !MDLocation(line: 971, column: 17, scope: !2217)
!2217 = !{!"0xb\007", !1, !2215}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2218 = !MDLocation(line: 972, column: 46, scope: !2191)
!2219 = !MDLocation(line: 972, column: 31, scope: !2191)
!2220 = !MDLocation(line: 972, column: 86, scope: !2191)
!2221 = !MDLocation(line: 973, column: 27, scope: !2191)
!2222 = !MDLocation(line: 974, column: 17, scope: !2223)
!2223 = !{!"0xb\00974\0017\00180", !1, !2224}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2224 = !{!"0xb\00974\0017\00179", !1, !2191}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2225 = !MDLocation(line: 974, column: 17, scope: !2224)
!2226 = !MDLocation(line: 974, column: 17, scope: !2227)
!2227 = !{!"0xb\001", !1, !2228}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2228 = !{!"0xb\00974\0017\00181", !1, !2223}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2229 = !MDLocation(line: 974, column: 17, scope: !2230)
!2230 = !{!"0xb\00974\0017\00182", !1, !2228}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2231 = !MDLocation(line: 974, column: 17, scope: !2228)
!2232 = !MDLocation(line: 974, column: 17, scope: !2233)
!2233 = !{!"0xb\002", !1, !2234}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2234 = !{!"0xb\00974\0017\00183", !1, !2230}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2235 = !MDLocation(line: 974, column: 17, scope: !2236)
!2236 = !{!"0xb\004", !1, !2237}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2237 = !{!"0xb\003", !1, !2228}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2238 = !MDLocation(line: 975, column: 13, scope: !2191)
!2239 = !MDLocation(line: 967, column: 32, scope: !2188)
!2240 = !MDLocation(line: 967, column: 13, scope: !2188)
!2241 = !MDLocation(line: 978, column: 13, scope: !2242)
!2242 = !{!"0xb\00978\0013\00184", !1, !2140}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2243 = !MDLocation(line: 978, column: 13, scope: !2140)
!2244 = !MDLocation(line: 979, column: 13, scope: !2242)
!2245 = !MDLocation(line: 982, column: 19, scope: !2246)
!2246 = !{!"0xb\00981\009\00185", !1, !2242}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2247 = !MDLocation(line: 982, column: 13, scope: !2246)
!2248 = !MDLocation(line: 983, column: 19, scope: !2246)
!2249 = !MDLocation(line: 983, column: 13, scope: !2246)
!2250 = !MDLocation(line: 984, column: 18, scope: !2246)
!2251 = !MDLocation(line: 984, column: 13, scope: !2246)
!2252 = !MDLocation(line: 985, column: 17, scope: !2253)
!2253 = !{!"0xb\00985\0017\00186", !1, !2246}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2254 = !MDLocation(line: 985, column: 17, scope: !2246)
!2255 = !MDLocation(line: 985, column: 26, scope: !2256)
!2256 = !{!"0xb\001", !1, !2253}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2257 = !MDLocation(line: 986, column: 22, scope: !2258)
!2258 = !{!"0xb\00986\0022\00187", !1, !2253}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2259 = !MDLocation(line: 986, column: 22, scope: !2253)
!2260 = !MDLocation(line: 986, column: 30, scope: !2261)
!2261 = !{!"0xb\001", !1, !2258}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2262 = !MDLocation(line: 988, column: 5, scope: !2140)
!2263 = !MDLocation(line: 950, column: 32, scope: !2136)
!2264 = !MDLocation(line: 950, column: 5, scope: !2136)
!2265 = !MDLocation(line: 988, column: 5, scope: !2134)
!2266 = !MDLocation(line: 992, column: 10, scope: !2267)
!2267 = !{!"0xb\00992\005\00188", !1, !474}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2268 = !MDLocation(line: 992, column: 17, scope: !2269)
!2269 = !{!"0xb\00992\005\00189", !1, !2267}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2270 = !MDLocation(line: 992, column: 5, scope: !2267)
!2271 = !MDLocation(line: 995, column: 9, scope: !2272)
!2272 = !{!"0xb\00995\009\00191", !1, !2273}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2273 = !{!"0xb\00993\005\00190", !1, !2269}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2274 = !MDLocation(line: 997, column: 12, scope: !2273)
!2275 = !MDLocation(line: 999, column: 18, scope: !2276)
!2276 = !{!"0xb\00999\0013\00194", !1, !2277}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2277 = !{!"0xb\00998\009\00193", !1, !2278}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2278 = !{!"0xb\00997\0012\00192", !1, !2273}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2279 = !MDLocation(line: 999, column: 25, scope: !2280)
!2280 = !{!"0xb\002", !1, !2281}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2281 = !{!"0xb\001", !1, !2282}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2282 = !{!"0xb\00999\0013\00195", !1, !2276}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2283 = !MDLocation(line: 999, column: 13, scope: !2276)
!2284 = !MDLocation(line: 1001, column: 42, scope: !2285)
!2285 = !{!"0xb\001000\0013\00196", !1, !2282}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2286 = !MDLocation(line: 1001, column: 37, scope: !2285)
!2287 = !MDLocation(line: 1001, column: 17, scope: !2285)
!2288 = !MDLocation(line: 1002, column: 42, scope: !2285)
!2289 = !MDLocation(line: 1002, column: 37, scope: !2285)
!2290 = !MDLocation(line: 1002, column: 17, scope: !2285)
!2291 = !MDLocation(line: 1003, column: 46, scope: !2285)
!2292 = !MDLocation(line: 1003, column: 31, scope: !2285)
!2293 = !MDLocation(line: 1003, column: 86, scope: !2285)
!2294 = !MDLocation(line: 1004, column: 27, scope: !2285)
!2295 = !MDLocation(line: 1005, column: 17, scope: !2296)
!2296 = !{!"0xb\001005\0017\00198", !1, !2297}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2297 = !{!"0xb\001005\0017\00197", !1, !2285}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2298 = !MDLocation(line: 1005, column: 17, scope: !2297)
!2299 = !MDLocation(line: 1005, column: 17, scope: !2300)
!2300 = !{!"0xb\001", !1, !2301}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2301 = !{!"0xb\001005\0017\00199", !1, !2296}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2302 = !MDLocation(line: 1005, column: 17, scope: !2303)
!2303 = !{!"0xb\001005\0017\00200", !1, !2301}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2304 = !MDLocation(line: 1005, column: 17, scope: !2301)
!2305 = !MDLocation(line: 1005, column: 17, scope: !2306)
!2306 = !{!"0xb\002", !1, !2307}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2307 = !{!"0xb\001005\0017\00201", !1, !2303}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2308 = !MDLocation(line: 1005, column: 17, scope: !2309)
!2309 = !{!"0xb\004", !1, !2310}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2310 = !{!"0xb\003", !1, !2301}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2311 = !MDLocation(line: 1006, column: 13, scope: !2285)
!2312 = !MDLocation(line: 999, column: 32, scope: !2282)
!2313 = !MDLocation(line: 999, column: 13, scope: !2282)
!2314 = !MDLocation(line: 1007, column: 9, scope: !2277)
!2315 = !MDLocation(line: 1009, column: 18, scope: !2316)
!2316 = !{!"0xb\001009\0013\00203", !1, !2317}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2317 = !{!"0xb\001008\009\00202", !1, !2278}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2318 = !MDLocation(line: 1009, column: 25, scope: !2319)
!2319 = !{!"0xb\002", !1, !2320}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2320 = !{!"0xb\001", !1, !2321}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2321 = !{!"0xb\001009\0013\00204", !1, !2316}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2322 = !MDLocation(line: 1009, column: 13, scope: !2316)
!2323 = !MDLocation(line: 1011, column: 42, scope: !2324)
!2324 = !{!"0xb\001010\0013\00205", !1, !2321}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2325 = !MDLocation(line: 1011, column: 37, scope: !2324)
!2326 = !MDLocation(line: 1011, column: 17, scope: !2324)
!2327 = !MDLocation(line: 1012, column: 42, scope: !2324)
!2328 = !MDLocation(line: 1012, column: 37, scope: !2324)
!2329 = !MDLocation(line: 1012, column: 17, scope: !2324)
!2330 = !MDLocation(line: 1013, column: 17, scope: !2331)
!2331 = !{!"0xb\001013\0017\00207", !1, !2332}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2332 = !{!"0xb\001013\0017\00206", !1, !2324}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2333 = !MDLocation(line: 1013, column: 17, scope: !2332)
!2334 = !MDLocation(line: 1013, column: 17, scope: !2335)
!2335 = !{!"0xb\001", !1, !2331}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2336 = !MDLocation(line: 1013, column: 17, scope: !2337)
!2337 = !{!"0xb\002", !1, !2338}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2338 = !{!"0xb\001013\0017\00208", !1, !2332}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2339 = !MDLocation(line: 1013, column: 17, scope: !2340)
!2340 = !{!"0xb\003", !1, !2338}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2341 = !MDLocation(line: 1013, column: 17, scope: !2342)
!2342 = !{!"0xb\004", !1, !2343}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2343 = !{!"0xb\001013\0017\00209", !1, !2332}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2344 = !MDLocation(line: 1013, column: 17, scope: !2345)
!2345 = !{!"0xb\005", !1, !2343}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2346 = !MDLocation(line: 1013, column: 17, scope: !2347)
!2347 = !{!"0xb\006", !1, !2348}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2348 = !{!"0xb\001013\0017\00210", !1, !2332}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2349 = !MDLocation(line: 1013, column: 17, scope: !2350)
!2350 = !{!"0xb\007", !1, !2348}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2351 = !MDLocation(line: 1014, column: 46, scope: !2324)
!2352 = !MDLocation(line: 1014, column: 31, scope: !2324)
!2353 = !MDLocation(line: 1014, column: 86, scope: !2324)
!2354 = !MDLocation(line: 1015, column: 27, scope: !2324)
!2355 = !MDLocation(line: 1016, column: 17, scope: !2356)
!2356 = !{!"0xb\001016\0017\00212", !1, !2357}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2357 = !{!"0xb\001016\0017\00211", !1, !2324}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2358 = !MDLocation(line: 1016, column: 17, scope: !2357)
!2359 = !MDLocation(line: 1016, column: 17, scope: !2360)
!2360 = !{!"0xb\001", !1, !2361}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2361 = !{!"0xb\001016\0017\00213", !1, !2356}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2362 = !MDLocation(line: 1016, column: 17, scope: !2363)
!2363 = !{!"0xb\001016\0017\00214", !1, !2361}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2364 = !MDLocation(line: 1016, column: 17, scope: !2361)
!2365 = !MDLocation(line: 1016, column: 17, scope: !2366)
!2366 = !{!"0xb\002", !1, !2367}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2367 = !{!"0xb\001016\0017\00215", !1, !2363}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2368 = !MDLocation(line: 1016, column: 17, scope: !2369)
!2369 = !{!"0xb\004", !1, !2370}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2370 = !{!"0xb\003", !1, !2361}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2371 = !MDLocation(line: 1017, column: 13, scope: !2324)
!2372 = !MDLocation(line: 1009, column: 32, scope: !2321)
!2373 = !MDLocation(line: 1009, column: 13, scope: !2321)
!2374 = !MDLocation(line: 1020, column: 13, scope: !2375)
!2375 = !{!"0xb\001020\0013\00216", !1, !2273}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2376 = !MDLocation(line: 1020, column: 13, scope: !2273)
!2377 = !MDLocation(line: 1021, column: 13, scope: !2375)
!2378 = !MDLocation(line: 1024, column: 19, scope: !2379)
!2379 = !{!"0xb\001023\009\00217", !1, !2375}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2380 = !MDLocation(line: 1024, column: 13, scope: !2379)
!2381 = !MDLocation(line: 1025, column: 19, scope: !2379)
!2382 = !MDLocation(line: 1025, column: 13, scope: !2379)
!2383 = !MDLocation(line: 1027, column: 5, scope: !2273)
!2384 = !MDLocation(line: 992, column: 32, scope: !2269)
!2385 = !MDLocation(line: 992, column: 5, scope: !2269)
!2386 = !MDLocation(line: 1029, column: 26, scope: !474)
!2387 = !MDLocation(line: 1029, column: 5, scope: !474)
!2388 = !MDLocation(line: 1030, column: 26, scope: !474)
!2389 = !MDLocation(line: 1030, column: 5, scope: !474)
!2390 = !MDLocation(line: 1032, column: 5, scope: !474)
!2391 = !{!"0x101\00mv\0016777262\000", !490, !492, !73} ; [ DW_TAG_arg_variable ] [mv] [line 46]
!2392 = !MDLocation(line: 46, column: 34, scope: !490)
!2393 = !{!"0x101\00mb_to_left_edge\0033554478\000", !490, !492, !72} ; [ DW_TAG_arg_variable ] [mb_to_left_edge] [line 46]
!2394 = !MDLocation(line: 46, column: 42, scope: !490)
!2395 = !{!"0x101\00mb_to_right_edge\0050331694\000", !490, !492, !72} ; [ DW_TAG_arg_variable ] [mb_to_right_edge] [line 46]
!2396 = !MDLocation(line: 46, column: 63, scope: !490)
!2397 = !{!"0x101\00mb_to_top_edge\0067108911\000", !490, !492, !72} ; [ DW_TAG_arg_variable ] [mb_to_top_edge] [line 47]
!2398 = !MDLocation(line: 47, column: 30, scope: !490)
!2399 = !{!"0x101\00mb_to_bottom_edge\0083886127\000", !490, !492, !72} ; [ DW_TAG_arg_variable ] [mb_to_bottom_edge] [line 47]
!2400 = !MDLocation(line: 47, column: 50, scope: !490)
!2401 = !MDLocation(line: 49, column: 22, scope: !490)
!2402 = !MDLocation(line: 49, column: 21, scope: !490)
!2403 = !MDLocation(line: 50, column: 27, scope: !490)
!2404 = !MDLocation(line: 49, column: 21, scope: !2405)
!2405 = !{!"0xb\002", !491, !2406}                ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/../../vp8/common/findnearmv.h]
!2406 = !{!"0xb\001", !491, !490}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/../../vp8/common/findnearmv.h]
!2407 = !MDLocation(line: 49, column: 5, scope: !490)
!2408 = !MDLocation(line: 51, column: 22, scope: !490)
!2409 = !MDLocation(line: 51, column: 21, scope: !490)
!2410 = !MDLocation(line: 52, column: 28, scope: !490)
!2411 = !MDLocation(line: 51, column: 21, scope: !2405)
!2412 = !MDLocation(line: 51, column: 5, scope: !490)
!2413 = !MDLocation(line: 53, column: 22, scope: !490)
!2414 = !MDLocation(line: 53, column: 21, scope: !490)
!2415 = !MDLocation(line: 54, column: 26, scope: !490)
!2416 = !MDLocation(line: 53, column: 21, scope: !2405)
!2417 = !MDLocation(line: 53, column: 5, scope: !490)
!2418 = !MDLocation(line: 55, column: 22, scope: !490)
!2419 = !MDLocation(line: 55, column: 21, scope: !490)
!2420 = !MDLocation(line: 56, column: 29, scope: !490)
!2421 = !MDLocation(line: 55, column: 21, scope: !2405)
!2422 = !MDLocation(line: 55, column: 5, scope: !490)
!2423 = !MDLocation(line: 57, column: 1, scope: !490)
!2424 = !{!"0x101\00mv\0016777264\000", !489, !69, !73} ; [ DW_TAG_arg_variable ] [mv] [line 48]
!2425 = !MDLocation(line: 48, column: 35, scope: !489)
!2426 = !{!"0x101\00ref\0033554480\000", !489, !69, !73} ; [ DW_TAG_arg_variable ] [ref] [line 48]
!2427 = !MDLocation(line: 48, column: 47, scope: !489)
!2428 = !{!"0x101\00mvsadcost\0050331696\000", !489, !69, !88} ; [ DW_TAG_arg_variable ] [mvsadcost] [line 48]
!2429 = !MDLocation(line: 48, column: 57, scope: !489)
!2430 = !{!"0x101\00error_per_bit\0067108912\000", !489, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 48]
!2431 = !MDLocation(line: 48, column: 75, scope: !489)
!2432 = !MDLocation(line: 52, column: 9, scope: !489)
!2433 = !MDLocation(line: 53, column: 32, scope: !2434)
!2434 = !{!"0xb\0052\009\00361", !1, !489}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2435 = !MDLocation(line: 53, column: 48, scope: !2434)
!2436 = !MDLocation(line: 53, column: 18, scope: !2434)
!2437 = !MDLocation(line: 54, column: 32, scope: !2434)
!2438 = !MDLocation(line: 54, column: 48, scope: !2434)
!2439 = !MDLocation(line: 54, column: 18, scope: !2434)
!2440 = !MDLocation(line: 53, column: 17, scope: !2434)
!2441 = !MDLocation(line: 53, column: 16, scope: !2434)
!2442 = !MDLocation(line: 53, column: 9, scope: !2434)
!2443 = !MDLocation(line: 56, column: 5, scope: !489)
!2444 = !MDLocation(line: 57, column: 1, scope: !489)
!2445 = !{!"0x101\00x\0016778256\000", !477, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1040]
!2446 = !MDLocation(line: 1040, column: 17, scope: !477)
!2447 = !{!"0x101\00b\0033555473\000", !477, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1041]
!2448 = !MDLocation(line: 1041, column: 12, scope: !477)
!2449 = !{!"0x101\00d\0050332690\000", !477, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1042]
!2450 = !MDLocation(line: 1042, column: 13, scope: !477)
!2451 = !{!"0x101\00ref_mv\0067109907\000", !477, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1043]
!2452 = !MDLocation(line: 1043, column: 13, scope: !477)
!2453 = !{!"0x101\00best_mv\0083887124\000", !477, !69, !73} ; [ DW_TAG_arg_variable ] [best_mv] [line 1044]
!2454 = !MDLocation(line: 1044, column: 13, scope: !477)
!2455 = !{!"0x101\00search_param\00100664341\000", !477, !69, !72} ; [ DW_TAG_arg_variable ] [search_param] [line 1045]
!2456 = !MDLocation(line: 1045, column: 9, scope: !477)
!2457 = !{!"0x101\00sad_per_bit\00117441558\000", !477, !69, !72} ; [ DW_TAG_arg_variable ] [sad_per_bit] [line 1046]
!2458 = !MDLocation(line: 1046, column: 9, scope: !477)
!2459 = !{!"0x101\00num00\00134218775\000", !477, !69, !89} ; [ DW_TAG_arg_variable ] [num00] [line 1047]
!2460 = !MDLocation(line: 1047, column: 10, scope: !477)
!2461 = !{!"0x101\00fn_ptr\00150995992\000", !477, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1048]
!2462 = !MDLocation(line: 1048, column: 28, scope: !477)
!2463 = !{!"0x101\00mvcost\00167773209\000", !477, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1049]
!2464 = !MDLocation(line: 1049, column: 10, scope: !477)
!2465 = !{!"0x101\00center_mv\00184550426\000", !477, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1050]
!2466 = !MDLocation(line: 1050, column: 13, scope: !477)
!2467 = !MDLocation(line: 1055, column: 30, scope: !477)
!2468 = !MDLocation(line: 1055, column: 28, scope: !477)
!2469 = !MDLocation(line: 1055, column: 45, scope: !477)
!2470 = !{!"0x100\00what\001055\000", !477, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1055]
!2471 = !MDLocation(line: 1055, column: 20, scope: !477)
!2472 = !MDLocation(line: 1056, column: 23, scope: !477)
!2473 = !{!"0x100\00what_stride\001056\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1056]
!2474 = !MDLocation(line: 1056, column: 9, scope: !477)
!2475 = !MDLocation(line: 1058, column: 22, scope: !477)
!2476 = !{!"0x100\00pre_stride\001058\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1058]
!2477 = !MDLocation(line: 1058, column: 9, scope: !477)
!2478 = !MDLocation(line: 1059, column: 31, scope: !477)
!2479 = !{!"0x100\00base_pre\001059\000", !477, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1059]
!2480 = !MDLocation(line: 1059, column: 20, scope: !477)
!2481 = !{!"0x100\00in_what_stride\001060\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1060]
!2482 = !MDLocation(line: 1060, column: 9, scope: !477)
!2483 = !{!"0x100\00this_mv\001064\000", !477, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1064]
!2484 = !MDLocation(line: 1064, column: 12, scope: !477)
!2485 = !{!"0x100\00thissad\001067\000", !477, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1067]
!2486 = !MDLocation(line: 1067, column: 18, scope: !477)
!2487 = !{!"0x100\00best_site\001068\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [best_site] [line 1068]
!2488 = !MDLocation(line: 1068, column: 9, scope: !477)
!2489 = !{!"0x100\00last_site\001069\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [last_site] [line 1069]
!2490 = !MDLocation(line: 1069, column: 9, scope: !477)
!2491 = !{!"0x100\00mvsadcost\001079\000", !477, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1079]
!2492 = !MDLocation(line: 1079, column: 10, scope: !477)
!2493 = !{!"0x100\00fcenter_mv\001080\000", !477, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1080]
!2494 = !MDLocation(line: 1080, column: 12, scope: !477)
!2495 = !MDLocation(line: 1082, column: 20, scope: !477)
!2496 = !MDLocation(line: 1082, column: 5, scope: !477)
!2497 = !MDLocation(line: 1083, column: 20, scope: !477)
!2498 = !MDLocation(line: 1083, column: 5, scope: !477)
!2499 = !MDLocation(line: 1084, column: 28, scope: !477)
!2500 = !MDLocation(line: 1084, column: 5, scope: !477)
!2501 = !MDLocation(line: 1085, column: 28, scope: !477)
!2502 = !MDLocation(line: 1085, column: 5, scope: !477)
!2503 = !MDLocation(line: 1087, column: 26, scope: !477)
!2504 = !MDLocation(line: 1087, column: 41, scope: !477)
!2505 = !MDLocation(line: 1087, column: 56, scope: !477)
!2506 = !MDLocation(line: 1087, column: 71, scope: !477)
!2507 = !MDLocation(line: 1087, column: 5, scope: !477)
!2508 = !MDLocation(line: 1088, column: 15, scope: !477)
!2509 = !{!"0x100\00ref_row\001071\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [ref_row] [line 1071]
!2510 = !MDLocation(line: 1071, column: 9, scope: !477)
!2511 = !MDLocation(line: 1089, column: 15, scope: !477)
!2512 = !{!"0x100\00ref_col\001072\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [ref_col] [line 1072]
!2513 = !MDLocation(line: 1072, column: 9, scope: !477)
!2514 = !MDLocation(line: 1090, column: 5, scope: !477)
!2515 = !MDLocation(line: 1091, column: 26, scope: !477)
!2516 = !MDLocation(line: 1091, column: 5, scope: !477)
!2517 = !MDLocation(line: 1092, column: 26, scope: !477)
!2518 = !MDLocation(line: 1092, column: 5, scope: !477)
!2519 = !MDLocation(line: 1095, column: 44, scope: !477)
!2520 = !MDLocation(line: 1095, column: 33, scope: !477)
!2521 = !MDLocation(line: 1095, column: 57, scope: !477)
!2522 = !{!"0x100\00in_what\001057\000", !477, !69, !60} ; [ DW_TAG_auto_variable ] [in_what] [line 1057]
!2523 = !MDLocation(line: 1057, column: 20, scope: !477)
!2524 = !{!"0x100\00best_address\001061\000", !477, !69, !60} ; [ DW_TAG_auto_variable ] [best_address] [line 1061]
!2525 = !MDLocation(line: 1061, column: 20, scope: !477)
!2526 = !MDLocation(line: 1099, column: 15, scope: !477)
!2527 = !MDLocation(line: 1100, column: 52, scope: !477)
!2528 = !MDLocation(line: 1100, column: 15, scope: !477)
!2529 = !{!"0x100\00bestsad\001066\000", !477, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1066]
!2530 = !MDLocation(line: 1066, column: 18, scope: !477)
!2531 = !MDLocation(line: 1106, column: 32, scope: !477)
!2532 = !MDLocation(line: 1106, column: 17, scope: !477)
!2533 = !MDLocation(line: 1106, column: 10, scope: !477)
!2534 = !MDLocation(line: 1106, column: 11, scope: !477)
!2535 = !{!"0x100\00ss\001075\000", !477, !69, !305} ; [ DW_TAG_auto_variable ] [ss] [line 1075]
!2536 = !MDLocation(line: 1075, column: 18, scope: !477)
!2537 = !MDLocation(line: 1107, column: 18, scope: !477)
!2538 = !MDLocation(line: 1107, column: 32, scope: !477)
!2539 = !MDLocation(line: 1107, column: 17, scope: !477)
!2540 = !{!"0x100\00tot_steps\001063\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [tot_steps] [line 1063]
!2541 = !MDLocation(line: 1063, column: 9, scope: !477)
!2542 = !{!"0x100\00i\001053\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1053]
!2543 = !MDLocation(line: 1053, column: 9, scope: !477)
!2544 = !{!"0x100\00step\001053\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [step] [line 1053]
!2545 = !MDLocation(line: 1053, column: 15, scope: !477)
!2546 = !MDLocation(line: 1111, column: 10, scope: !2547)
!2547 = !{!"0xb\001111\005\00218", !1, !477}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2548 = !MDLocation(line: 1111, column: 20, scope: !2549)
!2549 = !{!"0xb\001111\005\00219", !1, !2547}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2550 = !MDLocation(line: 1111, column: 5, scope: !2547)
!2551 = !{!"0x100\00j\001053\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [j] [line 1053]
!2552 = !MDLocation(line: 1053, column: 12, scope: !477)
!2553 = !MDLocation(line: 1113, column: 14, scope: !2554)
!2554 = !{!"0xb\001113\009\00221", !1, !2555}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2555 = !{!"0xb\001112\005\00220", !1, !2549}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2556 = !MDLocation(line: 1113, column: 26, scope: !2557)
!2557 = !{!"0xb\001113\009\00222", !1, !2554}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2558 = !MDLocation(line: 1113, column: 22, scope: !2557)
!2559 = !MDLocation(line: 1113, column: 9, scope: !2554)
!2560 = !MDLocation(line: 1116, column: 31, scope: !2561)
!2561 = !{!"0xb\001114\009\00223", !1, !2557}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2562 = !MDLocation(line: 1116, column: 52, scope: !2561)
!2563 = !{!"0x100\00this_row_offset\001073\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [this_row_offset] [line 1073]
!2564 = !MDLocation(line: 1073, column: 9, scope: !477)
!2565 = !MDLocation(line: 1117, column: 31, scope: !2561)
!2566 = !MDLocation(line: 1117, column: 52, scope: !2561)
!2567 = !{!"0x100\00this_col_offset\001074\000", !477, !69, !72} ; [ DW_TAG_auto_variable ] [this_col_offset] [line 1074]
!2568 = !MDLocation(line: 1074, column: 9, scope: !477)
!2569 = !MDLocation(line: 1119, column: 36, scope: !2570)
!2570 = !{!"0xb\001119\0017\00224", !1, !2561}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2571 = !MDLocation(line: 1119, column: 18, scope: !2570)
!2572 = !MDLocation(line: 1119, column: 17, scope: !2561)
!2573 = !MDLocation(line: 1119, column: 73, scope: !2570)
!2574 = !MDLocation(line: 1119, column: 55, scope: !2570)
!2575 = !MDLocation(line: 1120, column: 32, scope: !2570)
!2576 = !MDLocation(line: 1120, column: 14, scope: !2570)
!2577 = !MDLocation(line: 1120, column: 69, scope: !2570)
!2578 = !MDLocation(line: 1120, column: 51, scope: !2570)
!2579 = !MDLocation(line: 1123, column: 30, scope: !2580)
!2580 = !{!"0xb\001122\0013\00225", !1, !2570}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2581 = !{!"0x100\00check_here\001077\000", !477, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1077]
!2582 = !MDLocation(line: 1077, column: 20, scope: !477)
!2583 = !MDLocation(line: 1124, column: 27, scope: !2580)
!2584 = !MDLocation(line: 1124, column: 17, scope: !2580)
!2585 = !MDLocation(line: 1126, column: 21, scope: !2586)
!2586 = !{!"0xb\001126\0021\00226", !1, !2580}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2587 = !MDLocation(line: 1126, column: 21, scope: !2580)
!2588 = !MDLocation(line: 1128, column: 41, scope: !2589)
!2589 = !{!"0xb\001127\0017\00227", !1, !2586}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2590 = !MDLocation(line: 1128, column: 21, scope: !2589)
!2591 = !MDLocation(line: 1129, column: 41, scope: !2589)
!2592 = !MDLocation(line: 1129, column: 21, scope: !2589)
!2593 = !MDLocation(line: 1131, column: 47, scope: !2589)
!2594 = !MDLocation(line: 1130, column: 32, scope: !2589)
!2595 = !MDLocation(line: 1130, column: 21, scope: !2589)
!2596 = !MDLocation(line: 1133, column: 25, scope: !2597)
!2597 = !{!"0xb\001133\0025\00228", !1, !2589}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2598 = !MDLocation(line: 1133, column: 25, scope: !2589)
!2599 = !MDLocation(line: 1135, column: 35, scope: !2600)
!2600 = !{!"0xb\001134\0021\00229", !1, !2597}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2601 = !MDLocation(line: 1137, column: 21, scope: !2600)
!2602 = !MDLocation(line: 1138, column: 17, scope: !2589)
!2603 = !MDLocation(line: 1139, column: 13, scope: !2580)
!2604 = !MDLocation(line: 1141, column: 13, scope: !2561)
!2605 = !MDLocation(line: 1142, column: 9, scope: !2561)
!2606 = !MDLocation(line: 1113, column: 49, scope: !2557)
!2607 = !MDLocation(line: 1113, column: 9, scope: !2557)
!2608 = !MDLocation(line: 1144, column: 13, scope: !2609)
!2609 = !{!"0xb\001144\0013\00230", !1, !2555}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2610 = !MDLocation(line: 1144, column: 13, scope: !2555)
!2611 = !MDLocation(line: 1146, column: 35, scope: !2612)
!2612 = !{!"0xb\001145\009\00231", !1, !2609}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2613 = !MDLocation(line: 1146, column: 13, scope: !2612)
!2614 = !MDLocation(line: 1147, column: 35, scope: !2612)
!2615 = !MDLocation(line: 1147, column: 13, scope: !2612)
!2616 = !MDLocation(line: 1148, column: 29, scope: !2612)
!2617 = !MDLocation(line: 1148, column: 13, scope: !2612)
!2618 = !MDLocation(line: 1150, column: 9, scope: !2612)
!2619 = !MDLocation(line: 1151, column: 18, scope: !2620)
!2620 = !{!"0xb\001151\0018\00232", !1, !2609}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2621 = !MDLocation(line: 1151, column: 18, scope: !2609)
!2622 = !MDLocation(line: 1152, column: 13, scope: !2620)
!2623 = !MDLocation(line: 1153, column: 5, scope: !2555)
!2624 = !MDLocation(line: 1111, column: 39, scope: !2549)
!2625 = !MDLocation(line: 1111, column: 5, scope: !2549)
!2626 = !MDLocation(line: 1155, column: 25, scope: !477)
!2627 = !MDLocation(line: 1155, column: 5, scope: !477)
!2628 = !MDLocation(line: 1156, column: 25, scope: !477)
!2629 = !MDLocation(line: 1156, column: 5, scope: !477)
!2630 = !MDLocation(line: 1158, column: 12, scope: !477)
!2631 = !MDLocation(line: 1159, column: 55, scope: !477)
!2632 = !MDLocation(line: 1159, column: 14, scope: !477)
!2633 = !MDLocation(line: 1158, column: 5, scope: !477)
!2634 = !{!"0x101\00x\0016778380\000", !481, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1164]
!2635 = !MDLocation(line: 1164, column: 17, scope: !481)
!2636 = !{!"0x101\00b\0033555597\000", !481, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1165]
!2637 = !MDLocation(line: 1165, column: 12, scope: !481)
!2638 = !{!"0x101\00d\0050332814\000", !481, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1166]
!2639 = !MDLocation(line: 1166, column: 13, scope: !481)
!2640 = !{!"0x101\00ref_mv\0067110031\000", !481, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1167]
!2641 = !MDLocation(line: 1167, column: 13, scope: !481)
!2642 = !{!"0x101\00best_mv\0083887248\000", !481, !69, !73} ; [ DW_TAG_arg_variable ] [best_mv] [line 1168]
!2643 = !MDLocation(line: 1168, column: 13, scope: !481)
!2644 = !{!"0x101\00search_param\00100664465\000", !481, !69, !72} ; [ DW_TAG_arg_variable ] [search_param] [line 1169]
!2645 = !MDLocation(line: 1169, column: 9, scope: !481)
!2646 = !{!"0x101\00sad_per_bit\00117441682\000", !481, !69, !72} ; [ DW_TAG_arg_variable ] [sad_per_bit] [line 1170]
!2647 = !MDLocation(line: 1170, column: 9, scope: !481)
!2648 = !{!"0x101\00num00\00134218899\000", !481, !69, !89} ; [ DW_TAG_arg_variable ] [num00] [line 1171]
!2649 = !MDLocation(line: 1171, column: 10, scope: !481)
!2650 = !{!"0x101\00fn_ptr\00150996116\000", !481, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1172]
!2651 = !MDLocation(line: 1172, column: 28, scope: !481)
!2652 = !{!"0x101\00mvcost\00167773333\000", !481, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1173]
!2653 = !MDLocation(line: 1173, column: 10, scope: !481)
!2654 = !{!"0x101\00center_mv\00184550550\000", !481, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1174]
!2655 = !MDLocation(line: 1174, column: 13, scope: !481)
!2656 = !MDLocation(line: 1179, column: 30, scope: !481)
!2657 = !MDLocation(line: 1179, column: 28, scope: !481)
!2658 = !MDLocation(line: 1179, column: 45, scope: !481)
!2659 = !{!"0x100\00what\001179\000", !481, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1179]
!2660 = !MDLocation(line: 1179, column: 20, scope: !481)
!2661 = !MDLocation(line: 1180, column: 23, scope: !481)
!2662 = !{!"0x100\00what_stride\001180\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1180]
!2663 = !MDLocation(line: 1180, column: 9, scope: !481)
!2664 = !MDLocation(line: 1182, column: 22, scope: !481)
!2665 = !{!"0x100\00pre_stride\001182\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1182]
!2666 = !MDLocation(line: 1182, column: 9, scope: !481)
!2667 = !MDLocation(line: 1183, column: 31, scope: !481)
!2668 = !{!"0x100\00base_pre\001183\000", !481, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1183]
!2669 = !MDLocation(line: 1183, column: 20, scope: !481)
!2670 = !{!"0x100\00in_what_stride\001184\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1184]
!2671 = !MDLocation(line: 1184, column: 9, scope: !481)
!2672 = !{!"0x100\00this_mv\001188\000", !481, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1188]
!2673 = !MDLocation(line: 1188, column: 12, scope: !481)
!2674 = !{!"0x100\00thissad\001191\000", !481, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1191]
!2675 = !MDLocation(line: 1191, column: 18, scope: !481)
!2676 = !{!"0x100\00best_site\001192\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [best_site] [line 1192]
!2677 = !MDLocation(line: 1192, column: 9, scope: !481)
!2678 = !{!"0x100\00last_site\001193\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [last_site] [line 1193]
!2679 = !MDLocation(line: 1193, column: 9, scope: !481)
!2680 = !{!"0x100\00mvsadcost\001203\000", !481, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1203]
!2681 = !MDLocation(line: 1203, column: 10, scope: !481)
!2682 = !{!"0x100\00fcenter_mv\001204\000", !481, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1204]
!2683 = !MDLocation(line: 1204, column: 12, scope: !481)
!2684 = !MDLocation(line: 1206, column: 20, scope: !481)
!2685 = !MDLocation(line: 1206, column: 5, scope: !481)
!2686 = !MDLocation(line: 1207, column: 20, scope: !481)
!2687 = !MDLocation(line: 1207, column: 5, scope: !481)
!2688 = !MDLocation(line: 1208, column: 28, scope: !481)
!2689 = !MDLocation(line: 1208, column: 5, scope: !481)
!2690 = !MDLocation(line: 1209, column: 28, scope: !481)
!2691 = !MDLocation(line: 1209, column: 5, scope: !481)
!2692 = !MDLocation(line: 1211, column: 26, scope: !481)
!2693 = !MDLocation(line: 1211, column: 41, scope: !481)
!2694 = !MDLocation(line: 1211, column: 56, scope: !481)
!2695 = !MDLocation(line: 1211, column: 71, scope: !481)
!2696 = !MDLocation(line: 1211, column: 5, scope: !481)
!2697 = !MDLocation(line: 1212, column: 15, scope: !481)
!2698 = !{!"0x100\00ref_row\001195\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [ref_row] [line 1195]
!2699 = !MDLocation(line: 1195, column: 9, scope: !481)
!2700 = !MDLocation(line: 1213, column: 15, scope: !481)
!2701 = !{!"0x100\00ref_col\001196\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [ref_col] [line 1196]
!2702 = !MDLocation(line: 1196, column: 9, scope: !481)
!2703 = !MDLocation(line: 1214, column: 5, scope: !481)
!2704 = !MDLocation(line: 1215, column: 26, scope: !481)
!2705 = !MDLocation(line: 1215, column: 5, scope: !481)
!2706 = !MDLocation(line: 1216, column: 26, scope: !481)
!2707 = !MDLocation(line: 1216, column: 5, scope: !481)
!2708 = !MDLocation(line: 1219, column: 44, scope: !481)
!2709 = !MDLocation(line: 1219, column: 33, scope: !481)
!2710 = !MDLocation(line: 1219, column: 57, scope: !481)
!2711 = !{!"0x100\00in_what\001181\000", !481, !69, !60} ; [ DW_TAG_auto_variable ] [in_what] [line 1181]
!2712 = !MDLocation(line: 1181, column: 20, scope: !481)
!2713 = !{!"0x100\00best_address\001185\000", !481, !69, !60} ; [ DW_TAG_auto_variable ] [best_address] [line 1185]
!2714 = !MDLocation(line: 1185, column: 20, scope: !481)
!2715 = !MDLocation(line: 1223, column: 15, scope: !481)
!2716 = !MDLocation(line: 1224, column: 52, scope: !481)
!2717 = !MDLocation(line: 1224, column: 15, scope: !481)
!2718 = !{!"0x100\00bestsad\001190\000", !481, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1190]
!2719 = !MDLocation(line: 1190, column: 18, scope: !481)
!2720 = !MDLocation(line: 1230, column: 32, scope: !481)
!2721 = !MDLocation(line: 1230, column: 17, scope: !481)
!2722 = !MDLocation(line: 1230, column: 10, scope: !481)
!2723 = !MDLocation(line: 1230, column: 11, scope: !481)
!2724 = !{!"0x100\00ss\001199\000", !481, !69, !305} ; [ DW_TAG_auto_variable ] [ss] [line 1199]
!2725 = !MDLocation(line: 1199, column: 18, scope: !481)
!2726 = !MDLocation(line: 1231, column: 18, scope: !481)
!2727 = !MDLocation(line: 1231, column: 32, scope: !481)
!2728 = !MDLocation(line: 1231, column: 17, scope: !481)
!2729 = !{!"0x100\00tot_steps\001187\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [tot_steps] [line 1187]
!2730 = !MDLocation(line: 1187, column: 9, scope: !481)
!2731 = !{!"0x100\00i\001177\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1177]
!2732 = !MDLocation(line: 1177, column: 9, scope: !481)
!2733 = !{!"0x100\00step\001177\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [step] [line 1177]
!2734 = !MDLocation(line: 1177, column: 15, scope: !481)
!2735 = !MDLocation(line: 1235, column: 10, scope: !2736)
!2736 = !{!"0xb\001235\005\00233", !1, !481}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2737 = !MDLocation(line: 1235, column: 20, scope: !2738)
!2738 = !{!"0xb\001235\005\00234", !1, !2736}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2739 = !MDLocation(line: 1235, column: 5, scope: !2736)
!2740 = !{!"0x100\00all_in\001237\000", !2741, !69, !72} ; [ DW_TAG_auto_variable ] [all_in] [line 1237]
!2741 = !{!"0xb\001236\005\00235", !1, !2738}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2742 = !MDLocation(line: 1237, column: 13, scope: !2741)
!2743 = !MDLocation(line: 1243, column: 21, scope: !2741)
!2744 = !MDLocation(line: 1243, column: 42, scope: !2741)
!2745 = !MDLocation(line: 1243, column: 57, scope: !2741)
!2746 = !MDLocation(line: 1243, column: 20, scope: !2741)
!2747 = !MDLocation(line: 1243, column: 9, scope: !2741)
!2748 = !MDLocation(line: 1244, column: 21, scope: !2741)
!2749 = !MDLocation(line: 1244, column: 45, scope: !2741)
!2750 = !MDLocation(line: 1244, column: 42, scope: !2741)
!2751 = !MDLocation(line: 1244, column: 60, scope: !2741)
!2752 = !MDLocation(line: 1244, column: 20, scope: !2741)
!2753 = !MDLocation(line: 1244, column: 9, scope: !2741)
!2754 = !MDLocation(line: 1245, column: 21, scope: !2741)
!2755 = !MDLocation(line: 1245, column: 45, scope: !2741)
!2756 = !MDLocation(line: 1245, column: 42, scope: !2741)
!2757 = !MDLocation(line: 1245, column: 60, scope: !2741)
!2758 = !MDLocation(line: 1245, column: 20, scope: !2741)
!2759 = !MDLocation(line: 1245, column: 9, scope: !2741)
!2760 = !MDLocation(line: 1246, column: 21, scope: !2741)
!2761 = !MDLocation(line: 1246, column: 45, scope: !2741)
!2762 = !MDLocation(line: 1246, column: 42, scope: !2741)
!2763 = !MDLocation(line: 1246, column: 60, scope: !2741)
!2764 = !MDLocation(line: 1246, column: 20, scope: !2741)
!2765 = !MDLocation(line: 1246, column: 9, scope: !2741)
!2766 = !MDLocation(line: 1248, column: 13, scope: !2741)
!2767 = !{!"0x100\00sad_array\001250\000", !2768, !69, !2770} ; [ DW_TAG_auto_variable ] [sad_array] [line 1250]
!2768 = !{!"0xb\001249\009\00237", !1, !2769}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2769 = !{!"0xb\001248\0013\00236", !1, !2741}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2770 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !80, !243, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from unsigned int]
!2771 = !MDLocation(line: 1250, column: 26, scope: !2768)
!2772 = !{!"0x100\00j\001177\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [j] [line 1177]
!2773 = !MDLocation(line: 1177, column: 12, scope: !481)
!2774 = !MDLocation(line: 1252, column: 18, scope: !2775)
!2775 = !{!"0xb\001252\0013\00238", !1, !2768}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2776 = !MDLocation(line: 1252, column: 30, scope: !2777)
!2777 = !{!"0xb\001252\0013\00239", !1, !2775}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2778 = !MDLocation(line: 1252, column: 26, scope: !2777)
!2779 = !MDLocation(line: 1252, column: 13, scope: !2775)
!2780 = !{!"0x100\00block_offset\001254\000", !2781, !69, !2782} ; [ DW_TAG_auto_variable ] [block_offset] [line 1254]
!2781 = !{!"0xb\001253\0013\00240", !1, !2777}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2782 = !{!"0x1\00\000\00256\0064\000\000\000", null, null, !435, !243, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from ]
!2783 = !MDLocation(line: 1254, column: 38, scope: !2781)
!2784 = !{!"0x100\00t\001237\000", !2741, !69, !72} ; [ DW_TAG_auto_variable ] [t] [line 1237]
!2785 = !MDLocation(line: 1237, column: 25, scope: !2741)
!2786 = !MDLocation(line: 1256, column: 22, scope: !2787)
!2787 = !{!"0xb\001256\0017\00241", !1, !2781}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2788 = !MDLocation(line: 1256, column: 29, scope: !2789)
!2789 = !{!"0xb\002", !1, !2790}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2790 = !{!"0xb\001", !1, !2791}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2791 = !{!"0xb\001256\0017\00242", !1, !2787}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2792 = !MDLocation(line: 1256, column: 17, scope: !2787)
!2793 = !MDLocation(line: 1257, column: 42, scope: !2791)
!2794 = !MDLocation(line: 1257, column: 39, scope: !2791)
!2795 = !MDLocation(line: 1257, column: 21, scope: !2791)
!2796 = !MDLocation(line: 1256, column: 36, scope: !2791)
!2797 = !MDLocation(line: 1256, column: 17, scope: !2791)
!2798 = !MDLocation(line: 1259, column: 17, scope: !2781)
!2799 = !MDLocation(line: 1259, column: 51, scope: !2781)
!2800 = !MDLocation(line: 1259, column: 81, scope: !2781)
!2801 = !MDLocation(line: 1261, column: 22, scope: !2802)
!2802 = !{!"0xb\001261\0017\00243", !1, !2781}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2803 = !MDLocation(line: 1261, column: 29, scope: !2804)
!2804 = !{!"0xb\002", !1, !2805}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2805 = !{!"0xb\001", !1, !2806}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2806 = !{!"0xb\001261\0017\00244", !1, !2802}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2807 = !MDLocation(line: 1261, column: 17, scope: !2802)
!2808 = !MDLocation(line: 1263, column: 25, scope: !2809)
!2809 = !{!"0xb\001263\0025\00246", !1, !2810}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2810 = !{!"0xb\001262\0017\00245", !1, !2806}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2811 = !MDLocation(line: 1263, column: 25, scope: !2810)
!2812 = !MDLocation(line: 1265, column: 45, scope: !2813)
!2813 = !{!"0xb\001264\0021\00247", !1, !2809}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2814 = !MDLocation(line: 1265, column: 66, scope: !2813)
!2815 = !MDLocation(line: 1265, column: 25, scope: !2813)
!2816 = !MDLocation(line: 1266, column: 45, scope: !2813)
!2817 = !MDLocation(line: 1266, column: 66, scope: !2813)
!2818 = !MDLocation(line: 1266, column: 25, scope: !2813)
!2819 = !MDLocation(line: 1268, column: 56, scope: !2813)
!2820 = !MDLocation(line: 1267, column: 41, scope: !2813)
!2821 = !MDLocation(line: 1267, column: 25, scope: !2813)
!2822 = !MDLocation(line: 1270, column: 29, scope: !2823)
!2823 = !{!"0xb\001270\0029\00248", !1, !2813}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2824 = !MDLocation(line: 1270, column: 29, scope: !2813)
!2825 = !MDLocation(line: 1272, column: 39, scope: !2826)
!2826 = !{!"0xb\001271\0025\00249", !1, !2823}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2827 = !MDLocation(line: 1274, column: 25, scope: !2826)
!2828 = !MDLocation(line: 1275, column: 21, scope: !2813)
!2829 = !MDLocation(line: 1276, column: 17, scope: !2810)
!2830 = !MDLocation(line: 1261, column: 36, scope: !2806)
!2831 = !MDLocation(line: 1261, column: 41, scope: !2806)
!2832 = !MDLocation(line: 1261, column: 17, scope: !2806)
!2833 = !MDLocation(line: 1277, column: 13, scope: !2781)
!2834 = !MDLocation(line: 1252, column: 53, scope: !2777)
!2835 = !MDLocation(line: 1252, column: 13, scope: !2777)
!2836 = !MDLocation(line: 1278, column: 9, scope: !2768)
!2837 = !MDLocation(line: 1281, column: 18, scope: !2838)
!2838 = !{!"0xb\001281\0013\00251", !1, !2839}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2839 = !{!"0xb\001280\009\00250", !1, !2769}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2840 = !MDLocation(line: 1281, column: 30, scope: !2841)
!2841 = !{!"0xb\001281\0013\00252", !1, !2838}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2842 = !MDLocation(line: 1281, column: 26, scope: !2841)
!2843 = !MDLocation(line: 1281, column: 13, scope: !2838)
!2844 = !MDLocation(line: 1284, column: 35, scope: !2845)
!2845 = !{!"0xb\001282\0013\00253", !1, !2841}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2846 = !MDLocation(line: 1284, column: 56, scope: !2845)
!2847 = !{!"0x100\00this_row_offset\001197\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [this_row_offset] [line 1197]
!2848 = !MDLocation(line: 1197, column: 9, scope: !481)
!2849 = !MDLocation(line: 1285, column: 35, scope: !2845)
!2850 = !MDLocation(line: 1285, column: 56, scope: !2845)
!2851 = !{!"0x100\00this_col_offset\001198\000", !481, !69, !72} ; [ DW_TAG_auto_variable ] [this_col_offset] [line 1198]
!2852 = !MDLocation(line: 1198, column: 9, scope: !481)
!2853 = !MDLocation(line: 1287, column: 40, scope: !2854)
!2854 = !{!"0xb\001287\0021\00254", !1, !2845}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2855 = !MDLocation(line: 1287, column: 22, scope: !2854)
!2856 = !MDLocation(line: 1287, column: 21, scope: !2845)
!2857 = !MDLocation(line: 1287, column: 77, scope: !2854)
!2858 = !MDLocation(line: 1287, column: 59, scope: !2854)
!2859 = !MDLocation(line: 1288, column: 36, scope: !2854)
!2860 = !MDLocation(line: 1288, column: 18, scope: !2854)
!2861 = !MDLocation(line: 1288, column: 73, scope: !2854)
!2862 = !MDLocation(line: 1288, column: 55, scope: !2854)
!2863 = !MDLocation(line: 1290, column: 34, scope: !2864)
!2864 = !{!"0xb\001289\0017\00255", !1, !2854}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2865 = !{!"0x100\00check_here\001201\000", !481, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1201]
!2866 = !MDLocation(line: 1201, column: 20, scope: !481)
!2867 = !MDLocation(line: 1291, column: 31, scope: !2864)
!2868 = !MDLocation(line: 1291, column: 21, scope: !2864)
!2869 = !MDLocation(line: 1293, column: 25, scope: !2870)
!2870 = !{!"0xb\001293\0025\00256", !1, !2864}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2871 = !MDLocation(line: 1293, column: 25, scope: !2864)
!2872 = !MDLocation(line: 1295, column: 45, scope: !2873)
!2873 = !{!"0xb\001294\0021\00257", !1, !2870}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2874 = !MDLocation(line: 1295, column: 25, scope: !2873)
!2875 = !MDLocation(line: 1296, column: 45, scope: !2873)
!2876 = !MDLocation(line: 1296, column: 25, scope: !2873)
!2877 = !MDLocation(line: 1298, column: 51, scope: !2873)
!2878 = !MDLocation(line: 1297, column: 36, scope: !2873)
!2879 = !MDLocation(line: 1297, column: 25, scope: !2873)
!2880 = !MDLocation(line: 1300, column: 29, scope: !2881)
!2881 = !{!"0xb\001300\0029\00258", !1, !2873}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2882 = !MDLocation(line: 1300, column: 29, scope: !2873)
!2883 = !MDLocation(line: 1302, column: 39, scope: !2884)
!2884 = !{!"0xb\001301\0025\00259", !1, !2881}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2885 = !MDLocation(line: 1304, column: 25, scope: !2884)
!2886 = !MDLocation(line: 1305, column: 21, scope: !2873)
!2887 = !MDLocation(line: 1306, column: 17, scope: !2864)
!2888 = !MDLocation(line: 1307, column: 17, scope: !2845)
!2889 = !MDLocation(line: 1308, column: 13, scope: !2845)
!2890 = !MDLocation(line: 1281, column: 53, scope: !2841)
!2891 = !MDLocation(line: 1281, column: 13, scope: !2841)
!2892 = !MDLocation(line: 1311, column: 13, scope: !2893)
!2893 = !{!"0xb\001311\0013\00260", !1, !2741}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2894 = !MDLocation(line: 1311, column: 13, scope: !2741)
!2895 = !MDLocation(line: 1313, column: 35, scope: !2896)
!2896 = !{!"0xb\001312\009\00261", !1, !2893}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2897 = !MDLocation(line: 1313, column: 13, scope: !2896)
!2898 = !MDLocation(line: 1314, column: 35, scope: !2896)
!2899 = !MDLocation(line: 1314, column: 13, scope: !2896)
!2900 = !MDLocation(line: 1315, column: 29, scope: !2896)
!2901 = !MDLocation(line: 1315, column: 13, scope: !2896)
!2902 = !MDLocation(line: 1317, column: 9, scope: !2896)
!2903 = !MDLocation(line: 1318, column: 18, scope: !2904)
!2904 = !{!"0xb\001318\0018\00262", !1, !2893}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!2905 = !MDLocation(line: 1318, column: 18, scope: !2893)
!2906 = !MDLocation(line: 1319, column: 13, scope: !2904)
!2907 = !MDLocation(line: 1320, column: 5, scope: !2741)
!2908 = !MDLocation(line: 1235, column: 39, scope: !2738)
!2909 = !MDLocation(line: 1235, column: 5, scope: !2738)
!2910 = !MDLocation(line: 1322, column: 25, scope: !481)
!2911 = !MDLocation(line: 1322, column: 5, scope: !481)
!2912 = !MDLocation(line: 1323, column: 25, scope: !481)
!2913 = !MDLocation(line: 1323, column: 5, scope: !481)
!2914 = !MDLocation(line: 1325, column: 12, scope: !481)
!2915 = !MDLocation(line: 1326, column: 55, scope: !481)
!2916 = !MDLocation(line: 1326, column: 14, scope: !481)
!2917 = !MDLocation(line: 1325, column: 5, scope: !481)
!2918 = !{!"0x101\00x\0016778545\000", !482, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1329]
!2919 = !MDLocation(line: 1329, column: 39, scope: !482)
!2920 = !{!"0x101\00b\0033555761\000", !482, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1329]
!2921 = !MDLocation(line: 1329, column: 49, scope: !482)
!2922 = !{!"0x101\00d\0050332977\000", !482, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1329]
!2923 = !MDLocation(line: 1329, column: 60, scope: !482)
!2924 = !{!"0x101\00ref_mv\0067110193\000", !482, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1329]
!2925 = !MDLocation(line: 1329, column: 71, scope: !482)
!2926 = !{!"0x101\00sad_per_bit\0083887410\000", !482, !69, !72} ; [ DW_TAG_arg_variable ] [sad_per_bit] [line 1330]
!2927 = !MDLocation(line: 1330, column: 29, scope: !482)
!2928 = !{!"0x101\00distance\00100664626\000", !482, !69, !72} ; [ DW_TAG_arg_variable ] [distance] [line 1330]
!2929 = !MDLocation(line: 1330, column: 46, scope: !482)
!2930 = !{!"0x101\00fn_ptr\00117441843\000", !482, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1331]
!2931 = !MDLocation(line: 1331, column: 48, scope: !482)
!2932 = !{!"0x101\00mvcost\00134219059\000", !482, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1331]
!2933 = !MDLocation(line: 1331, column: 61, scope: !482)
!2934 = !{!"0x101\00center_mv\00150996276\000", !482, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1332]
!2935 = !MDLocation(line: 1332, column: 33, scope: !482)
!2936 = !MDLocation(line: 1334, column: 30, scope: !482)
!2937 = !MDLocation(line: 1334, column: 28, scope: !482)
!2938 = !MDLocation(line: 1334, column: 45, scope: !482)
!2939 = !{!"0x100\00what\001334\000", !482, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1334]
!2940 = !MDLocation(line: 1334, column: 20, scope: !482)
!2941 = !MDLocation(line: 1335, column: 23, scope: !482)
!2942 = !{!"0x100\00what_stride\001335\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1335]
!2943 = !MDLocation(line: 1335, column: 9, scope: !482)
!2944 = !MDLocation(line: 1337, column: 22, scope: !482)
!2945 = !{!"0x100\00pre_stride\001337\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1337]
!2946 = !MDLocation(line: 1337, column: 9, scope: !482)
!2947 = !MDLocation(line: 1338, column: 31, scope: !482)
!2948 = !{!"0x100\00base_pre\001338\000", !482, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1338]
!2949 = !MDLocation(line: 1338, column: 20, scope: !482)
!2950 = !{!"0x100\00in_what_stride\001339\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1339]
!2951 = !MDLocation(line: 1339, column: 9, scope: !482)
!2952 = !{!"0x100\00mv_stride\001340\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [mv_stride] [line 1340]
!2953 = !MDLocation(line: 1340, column: 9, scope: !482)
!2954 = !MDLocation(line: 1342, column: 23, scope: !482)
!2955 = !{!"0x100\00best_mv\001342\000", !482, !69, !73} ; [ DW_TAG_auto_variable ] [best_mv] [line 1342]
!2956 = !MDLocation(line: 1342, column: 13, scope: !482)
!2957 = !{!"0x100\00this_mv\001343\000", !482, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1343]
!2958 = !MDLocation(line: 1343, column: 12, scope: !482)
!2959 = !{!"0x100\00thissad\001345\000", !482, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1345]
!2960 = !MDLocation(line: 1345, column: 18, scope: !482)
!2961 = !MDLocation(line: 1350, column: 19, scope: !482)
!2962 = !{!"0x100\00ref_row\001350\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [ref_row] [line 1350]
!2963 = !MDLocation(line: 1350, column: 9, scope: !482)
!2964 = !MDLocation(line: 1351, column: 19, scope: !482)
!2965 = !{!"0x100\00ref_col\001351\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [ref_col] [line 1351]
!2966 = !MDLocation(line: 1351, column: 9, scope: !482)
!2967 = !MDLocation(line: 1353, column: 19, scope: !482)
!2968 = !{!"0x100\00row_min\001353\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [row_min] [line 1353]
!2969 = !MDLocation(line: 1353, column: 9, scope: !482)
!2970 = !MDLocation(line: 1354, column: 19, scope: !482)
!2971 = !{!"0x100\00row_max\001354\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [row_max] [line 1354]
!2972 = !MDLocation(line: 1354, column: 9, scope: !482)
!2973 = !MDLocation(line: 1355, column: 19, scope: !482)
!2974 = !{!"0x100\00col_min\001355\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [col_min] [line 1355]
!2975 = !MDLocation(line: 1355, column: 9, scope: !482)
!2976 = !MDLocation(line: 1356, column: 19, scope: !482)
!2977 = !{!"0x100\00col_max\001356\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [col_max] [line 1356]
!2978 = !MDLocation(line: 1356, column: 9, scope: !482)
!2979 = !{!"0x100\00mvsadcost\001358\000", !482, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1358]
!2980 = !MDLocation(line: 1358, column: 10, scope: !482)
!2981 = !{!"0x100\00fcenter_mv\001359\000", !482, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1359]
!2982 = !MDLocation(line: 1359, column: 12, scope: !482)
!2983 = !MDLocation(line: 1361, column: 20, scope: !482)
!2984 = !MDLocation(line: 1361, column: 5, scope: !482)
!2985 = !MDLocation(line: 1362, column: 20, scope: !482)
!2986 = !MDLocation(line: 1362, column: 5, scope: !482)
!2987 = !MDLocation(line: 1363, column: 28, scope: !482)
!2988 = !MDLocation(line: 1363, column: 5, scope: !482)
!2989 = !MDLocation(line: 1364, column: 28, scope: !482)
!2990 = !MDLocation(line: 1364, column: 5, scope: !482)
!2991 = !MDLocation(line: 1367, column: 26, scope: !482)
!2992 = !MDLocation(line: 1367, column: 15, scope: !482)
!2993 = !{!"0x100\00in_what\001336\000", !482, !69, !60} ; [ DW_TAG_auto_variable ] [in_what] [line 1336]
!2994 = !MDLocation(line: 1336, column: 20, scope: !482)
!2995 = !MDLocation(line: 1368, column: 30, scope: !482)
!2996 = !MDLocation(line: 1368, column: 19, scope: !482)
!2997 = !{!"0x100\00bestaddress\001341\000", !482, !69, !60} ; [ DW_TAG_auto_variable ] [bestaddress] [line 1341]
!2998 = !MDLocation(line: 1341, column: 20, scope: !482)
!2999 = !MDLocation(line: 1370, column: 26, scope: !482)
!3000 = !MDLocation(line: 1370, column: 5, scope: !482)
!3001 = !MDLocation(line: 1371, column: 26, scope: !482)
!3002 = !MDLocation(line: 1371, column: 5, scope: !482)
!3003 = !MDLocation(line: 1374, column: 15, scope: !482)
!3004 = !MDLocation(line: 1376, column: 52, scope: !482)
!3005 = !MDLocation(line: 1376, column: 15, scope: !482)
!3006 = !{!"0x100\00bestsad\001344\000", !482, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1344]
!3007 = !MDLocation(line: 1344, column: 18, scope: !482)
!3008 = !MDLocation(line: 1381, column: 19, scope: !3009)
!3009 = !{!"0xb\001381\009\00263", !1, !482}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3010 = !MDLocation(line: 1381, column: 9, scope: !3009)
!3011 = !MDLocation(line: 1381, column: 9, scope: !482)
!3012 = !MDLocation(line: 1382, column: 19, scope: !3009)
!3013 = !MDLocation(line: 1382, column: 9, scope: !3009)
!3014 = !MDLocation(line: 1384, column: 19, scope: !3015)
!3015 = !{!"0xb\001384\009\00264", !1, !482}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3016 = !MDLocation(line: 1384, column: 9, scope: !3015)
!3017 = !MDLocation(line: 1384, column: 9, scope: !482)
!3018 = !MDLocation(line: 1385, column: 19, scope: !3015)
!3019 = !MDLocation(line: 1385, column: 9, scope: !3015)
!3020 = !MDLocation(line: 1387, column: 19, scope: !3021)
!3021 = !{!"0xb\001387\009\00265", !1, !482}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3022 = !MDLocation(line: 1387, column: 9, scope: !3021)
!3023 = !MDLocation(line: 1387, column: 9, scope: !482)
!3024 = !MDLocation(line: 1388, column: 19, scope: !3021)
!3025 = !MDLocation(line: 1388, column: 9, scope: !3021)
!3026 = !MDLocation(line: 1390, column: 19, scope: !3027)
!3027 = !{!"0xb\001390\009\00266", !1, !482}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3028 = !MDLocation(line: 1390, column: 9, scope: !3027)
!3029 = !MDLocation(line: 1390, column: 9, scope: !482)
!3030 = !MDLocation(line: 1391, column: 19, scope: !3027)
!3031 = !MDLocation(line: 1391, column: 9, scope: !3027)
!3032 = !{!"0x100\00r\001346\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [r] [line 1346]
!3033 = !MDLocation(line: 1346, column: 9, scope: !482)
!3034 = !MDLocation(line: 1393, column: 10, scope: !3035)
!3035 = !{!"0xb\001393\005\00267", !1, !482}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3036 = !MDLocation(line: 1393, column: 23, scope: !3037)
!3037 = !{!"0xb\001393\005\00268", !1, !3035}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3038 = !MDLocation(line: 1393, column: 5, scope: !3035)
!3039 = !MDLocation(line: 1395, column: 29, scope: !3040)
!3040 = !{!"0xb\001394\005\00269", !1, !3037}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3041 = !MDLocation(line: 1395, column: 9, scope: !3040)
!3042 = !MDLocation(line: 1396, column: 22, scope: !3040)
!3043 = !{!"0x100\00check_here\001348\000", !482, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1348]
!3044 = !MDLocation(line: 1348, column: 20, scope: !482)
!3045 = !{!"0x100\00c\001346\000", !482, !69, !72} ; [ DW_TAG_auto_variable ] [c] [line 1346]
!3046 = !MDLocation(line: 1346, column: 12, scope: !482)
!3047 = !MDLocation(line: 1398, column: 14, scope: !3048)
!3048 = !{!"0xb\001398\009\00270", !1, !3040}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3049 = !MDLocation(line: 1398, column: 27, scope: !3050)
!3050 = !{!"0xb\001398\009\00271", !1, !3048}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3051 = !MDLocation(line: 1398, column: 9, scope: !3048)
!3052 = !MDLocation(line: 1400, column: 23, scope: !3053)
!3053 = !{!"0xb\001399\009\00272", !1, !3050}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3054 = !MDLocation(line: 1400, column: 13, scope: !3053)
!3055 = !MDLocation(line: 1402, column: 33, scope: !3053)
!3056 = !MDLocation(line: 1402, column: 13, scope: !3053)
!3057 = !MDLocation(line: 1404, column: 39, scope: !3053)
!3058 = !MDLocation(line: 1403, column: 24, scope: !3053)
!3059 = !MDLocation(line: 1403, column: 13, scope: !3053)
!3060 = !MDLocation(line: 1406, column: 17, scope: !3061)
!3061 = !{!"0xb\001406\0017\00273", !1, !3053}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3062 = !MDLocation(line: 1406, column: 17, scope: !3053)
!3063 = !MDLocation(line: 1408, column: 27, scope: !3064)
!3064 = !{!"0xb\001407\0013\00274", !1, !3061}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3065 = !MDLocation(line: 1409, column: 38, scope: !3064)
!3066 = !MDLocation(line: 1409, column: 17, scope: !3064)
!3067 = !MDLocation(line: 1410, column: 38, scope: !3064)
!3068 = !MDLocation(line: 1410, column: 17, scope: !3064)
!3069 = !MDLocation(line: 1412, column: 13, scope: !3064)
!3070 = !MDLocation(line: 1414, column: 13, scope: !3053)
!3071 = !MDLocation(line: 1415, column: 9, scope: !3053)
!3072 = !MDLocation(line: 1398, column: 40, scope: !3050)
!3073 = !MDLocation(line: 1398, column: 9, scope: !3050)
!3074 = !MDLocation(line: 1416, column: 5, scope: !3040)
!3075 = !MDLocation(line: 1393, column: 37, scope: !3037)
!3076 = !MDLocation(line: 1393, column: 5, scope: !3037)
!3077 = !MDLocation(line: 1418, column: 25, scope: !482)
!3078 = !MDLocation(line: 1418, column: 5, scope: !482)
!3079 = !MDLocation(line: 1419, column: 25, scope: !482)
!3080 = !MDLocation(line: 1419, column: 5, scope: !482)
!3081 = !MDLocation(line: 1421, column: 12, scope: !482)
!3082 = !MDLocation(line: 1422, column: 55, scope: !482)
!3083 = !MDLocation(line: 1422, column: 14, scope: !482)
!3084 = !MDLocation(line: 1421, column: 5, scope: !482)
!3085 = !{!"0x101\00x\0016778641\000", !485, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1425]
!3086 = !MDLocation(line: 1425, column: 39, scope: !485)
!3087 = !{!"0x101\00b\0033555857\000", !485, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1425]
!3088 = !MDLocation(line: 1425, column: 49, scope: !485)
!3089 = !{!"0x101\00d\0050333073\000", !485, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1425]
!3090 = !MDLocation(line: 1425, column: 60, scope: !485)
!3091 = !{!"0x101\00ref_mv\0067110289\000", !485, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1425]
!3092 = !MDLocation(line: 1425, column: 71, scope: !485)
!3093 = !{!"0x101\00sad_per_bit\0083887506\000", !485, !69, !72} ; [ DW_TAG_arg_variable ] [sad_per_bit] [line 1426]
!3094 = !MDLocation(line: 1426, column: 31, scope: !485)
!3095 = !{!"0x101\00distance\00100664722\000", !485, !69, !72} ; [ DW_TAG_arg_variable ] [distance] [line 1426]
!3096 = !MDLocation(line: 1426, column: 48, scope: !485)
!3097 = !{!"0x101\00fn_ptr\00117441939\000", !485, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1427]
!3098 = !MDLocation(line: 1427, column: 50, scope: !485)
!3099 = !{!"0x101\00mvcost\00134219155\000", !485, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1427]
!3100 = !MDLocation(line: 1427, column: 63, scope: !485)
!3101 = !{!"0x101\00center_mv\00150996372\000", !485, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1428]
!3102 = !MDLocation(line: 1428, column: 35, scope: !485)
!3103 = !MDLocation(line: 1430, column: 30, scope: !485)
!3104 = !MDLocation(line: 1430, column: 28, scope: !485)
!3105 = !MDLocation(line: 1430, column: 45, scope: !485)
!3106 = !{!"0x100\00what\001430\000", !485, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1430]
!3107 = !MDLocation(line: 1430, column: 20, scope: !485)
!3108 = !MDLocation(line: 1431, column: 23, scope: !485)
!3109 = !{!"0x100\00what_stride\001431\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1431]
!3110 = !MDLocation(line: 1431, column: 9, scope: !485)
!3111 = !MDLocation(line: 1433, column: 22, scope: !485)
!3112 = !{!"0x100\00pre_stride\001433\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1433]
!3113 = !MDLocation(line: 1433, column: 9, scope: !485)
!3114 = !MDLocation(line: 1434, column: 31, scope: !485)
!3115 = !{!"0x100\00base_pre\001434\000", !485, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1434]
!3116 = !MDLocation(line: 1434, column: 20, scope: !485)
!3117 = !{!"0x100\00in_what_stride\001435\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1435]
!3118 = !MDLocation(line: 1435, column: 9, scope: !485)
!3119 = !{!"0x100\00mv_stride\001436\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [mv_stride] [line 1436]
!3120 = !MDLocation(line: 1436, column: 9, scope: !485)
!3121 = !MDLocation(line: 1438, column: 23, scope: !485)
!3122 = !{!"0x100\00best_mv\001438\000", !485, !69, !73} ; [ DW_TAG_auto_variable ] [best_mv] [line 1438]
!3123 = !MDLocation(line: 1438, column: 13, scope: !485)
!3124 = !{!"0x100\00this_mv\001439\000", !485, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1439]
!3125 = !MDLocation(line: 1439, column: 12, scope: !485)
!3126 = !{!"0x100\00thissad\001441\000", !485, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1441]
!3127 = !MDLocation(line: 1441, column: 18, scope: !485)
!3128 = !MDLocation(line: 1446, column: 19, scope: !485)
!3129 = !{!"0x100\00ref_row\001446\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [ref_row] [line 1446]
!3130 = !MDLocation(line: 1446, column: 9, scope: !485)
!3131 = !MDLocation(line: 1447, column: 19, scope: !485)
!3132 = !{!"0x100\00ref_col\001447\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [ref_col] [line 1447]
!3133 = !MDLocation(line: 1447, column: 9, scope: !485)
!3134 = !MDLocation(line: 1449, column: 19, scope: !485)
!3135 = !{!"0x100\00row_min\001449\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [row_min] [line 1449]
!3136 = !MDLocation(line: 1449, column: 9, scope: !485)
!3137 = !MDLocation(line: 1450, column: 19, scope: !485)
!3138 = !{!"0x100\00row_max\001450\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [row_max] [line 1450]
!3139 = !MDLocation(line: 1450, column: 9, scope: !485)
!3140 = !MDLocation(line: 1451, column: 19, scope: !485)
!3141 = !{!"0x100\00col_min\001451\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [col_min] [line 1451]
!3142 = !MDLocation(line: 1451, column: 9, scope: !485)
!3143 = !MDLocation(line: 1452, column: 19, scope: !485)
!3144 = !{!"0x100\00col_max\001452\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [col_max] [line 1452]
!3145 = !MDLocation(line: 1452, column: 9, scope: !485)
!3146 = !{!"0x100\00sad_array\001454\000", !485, !69, !3147} ; [ DW_TAG_auto_variable ] [sad_array] [line 1454]
!3147 = !{!"0x1\00\000\0096\0032\000\000\000", null, null, !80, !228, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from unsigned int]
!3148 = !MDLocation(line: 1454, column: 18, scope: !485)
!3149 = !{!"0x100\00mvsadcost\001456\000", !485, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1456]
!3150 = !MDLocation(line: 1456, column: 10, scope: !485)
!3151 = !{!"0x100\00fcenter_mv\001457\000", !485, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1457]
!3152 = !MDLocation(line: 1457, column: 12, scope: !485)
!3153 = !MDLocation(line: 1459, column: 20, scope: !485)
!3154 = !MDLocation(line: 1459, column: 5, scope: !485)
!3155 = !MDLocation(line: 1460, column: 20, scope: !485)
!3156 = !MDLocation(line: 1460, column: 5, scope: !485)
!3157 = !MDLocation(line: 1461, column: 28, scope: !485)
!3158 = !MDLocation(line: 1461, column: 5, scope: !485)
!3159 = !MDLocation(line: 1462, column: 28, scope: !485)
!3160 = !MDLocation(line: 1462, column: 5, scope: !485)
!3161 = !MDLocation(line: 1465, column: 26, scope: !485)
!3162 = !MDLocation(line: 1465, column: 15, scope: !485)
!3163 = !{!"0x100\00in_what\001432\000", !485, !69, !60} ; [ DW_TAG_auto_variable ] [in_what] [line 1432]
!3164 = !MDLocation(line: 1432, column: 20, scope: !485)
!3165 = !MDLocation(line: 1466, column: 30, scope: !485)
!3166 = !MDLocation(line: 1466, column: 19, scope: !485)
!3167 = !{!"0x100\00bestaddress\001437\000", !485, !69, !60} ; [ DW_TAG_auto_variable ] [bestaddress] [line 1437]
!3168 = !MDLocation(line: 1437, column: 20, scope: !485)
!3169 = !MDLocation(line: 1468, column: 26, scope: !485)
!3170 = !MDLocation(line: 1468, column: 5, scope: !485)
!3171 = !MDLocation(line: 1469, column: 26, scope: !485)
!3172 = !MDLocation(line: 1469, column: 5, scope: !485)
!3173 = !MDLocation(line: 1472, column: 15, scope: !485)
!3174 = !MDLocation(line: 1474, column: 52, scope: !485)
!3175 = !MDLocation(line: 1474, column: 15, scope: !485)
!3176 = !{!"0x100\00bestsad\001440\000", !485, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1440]
!3177 = !MDLocation(line: 1440, column: 18, scope: !485)
!3178 = !MDLocation(line: 1479, column: 19, scope: !3179)
!3179 = !{!"0xb\001479\009\00275", !1, !485}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3180 = !MDLocation(line: 1479, column: 9, scope: !3179)
!3181 = !MDLocation(line: 1479, column: 9, scope: !485)
!3182 = !MDLocation(line: 1480, column: 19, scope: !3179)
!3183 = !MDLocation(line: 1480, column: 9, scope: !3179)
!3184 = !MDLocation(line: 1482, column: 19, scope: !3185)
!3185 = !{!"0xb\001482\009\00276", !1, !485}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3186 = !MDLocation(line: 1482, column: 9, scope: !3185)
!3187 = !MDLocation(line: 1482, column: 9, scope: !485)
!3188 = !MDLocation(line: 1483, column: 19, scope: !3185)
!3189 = !MDLocation(line: 1483, column: 9, scope: !3185)
!3190 = !MDLocation(line: 1485, column: 19, scope: !3191)
!3191 = !{!"0xb\001485\009\00277", !1, !485}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3192 = !MDLocation(line: 1485, column: 9, scope: !3191)
!3193 = !MDLocation(line: 1485, column: 9, scope: !485)
!3194 = !MDLocation(line: 1486, column: 19, scope: !3191)
!3195 = !MDLocation(line: 1486, column: 9, scope: !3191)
!3196 = !MDLocation(line: 1488, column: 19, scope: !3197)
!3197 = !{!"0xb\001488\009\00278", !1, !485}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3198 = !MDLocation(line: 1488, column: 9, scope: !3197)
!3199 = !MDLocation(line: 1488, column: 9, scope: !485)
!3200 = !MDLocation(line: 1489, column: 19, scope: !3197)
!3201 = !MDLocation(line: 1489, column: 9, scope: !3197)
!3202 = !{!"0x100\00r\001442\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [r] [line 1442]
!3203 = !MDLocation(line: 1442, column: 9, scope: !485)
!3204 = !MDLocation(line: 1491, column: 10, scope: !3205)
!3205 = !{!"0xb\001491\005\00279", !1, !485}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3206 = !MDLocation(line: 1491, column: 23, scope: !3207)
!3207 = !{!"0xb\001491\005\00280", !1, !3205}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3208 = !MDLocation(line: 1491, column: 5, scope: !3205)
!3209 = !MDLocation(line: 1493, column: 29, scope: !3210)
!3210 = !{!"0xb\001492\005\00281", !1, !3207}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3211 = !MDLocation(line: 1493, column: 9, scope: !3210)
!3212 = !MDLocation(line: 1494, column: 22, scope: !3210)
!3213 = !{!"0x100\00check_here\001444\000", !485, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1444]
!3214 = !MDLocation(line: 1444, column: 20, scope: !485)
!3215 = !{!"0x100\00c\001442\000", !485, !69, !72} ; [ DW_TAG_auto_variable ] [c] [line 1442]
!3216 = !MDLocation(line: 1442, column: 12, scope: !485)
!3217 = !MDLocation(line: 1497, column: 9, scope: !3210)
!3218 = !MDLocation(line: 1497, column: 17, scope: !3219)
!3219 = !{!"0xb\002", !1, !3220}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3220 = !{!"0xb\001", !1, !3210}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3221 = !MDLocation(line: 1497, column: 16, scope: !3210)
!3222 = !MDLocation(line: 1501, column: 13, scope: !3223)
!3223 = !{!"0xb\001498\009\00282", !1, !3210}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3224 = !MDLocation(line: 1501, column: 74, scope: !3223)
!3225 = !{!"0x100\00i\001499\000", !3223, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1499]
!3226 = !MDLocation(line: 1499, column: 17, scope: !3223)
!3227 = !MDLocation(line: 1503, column: 18, scope: !3228)
!3228 = !{!"0xb\001503\0013\00283", !1, !3223}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3229 = !MDLocation(line: 1503, column: 25, scope: !3230)
!3230 = !{!"0xb\002", !1, !3231}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3231 = !{!"0xb\001", !1, !3232}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3232 = !{!"0xb\001503\0013\00284", !1, !3228}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3233 = !MDLocation(line: 1503, column: 13, scope: !3228)
!3234 = !MDLocation(line: 1505, column: 27, scope: !3235)
!3235 = !{!"0xb\001504\0013\00285", !1, !3232}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3236 = !MDLocation(line: 1505, column: 17, scope: !3235)
!3237 = !MDLocation(line: 1507, column: 21, scope: !3238)
!3238 = !{!"0xb\001507\0021\00286", !1, !3235}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3239 = !MDLocation(line: 1507, column: 21, scope: !3235)
!3240 = !MDLocation(line: 1509, column: 41, scope: !3241)
!3241 = !{!"0xb\001508\0017\00287", !1, !3238}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3242 = !MDLocation(line: 1509, column: 21, scope: !3241)
!3243 = !MDLocation(line: 1511, column: 47, scope: !3241)
!3244 = !MDLocation(line: 1510, column: 32, scope: !3241)
!3245 = !MDLocation(line: 1510, column: 21, scope: !3241)
!3246 = !MDLocation(line: 1513, column: 25, scope: !3247)
!3247 = !{!"0xb\001513\0025\00288", !1, !3241}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3248 = !MDLocation(line: 1513, column: 25, scope: !3241)
!3249 = !MDLocation(line: 1515, column: 35, scope: !3250)
!3250 = !{!"0xb\001514\0021\00289", !1, !3247}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3251 = !MDLocation(line: 1516, column: 46, scope: !3250)
!3252 = !MDLocation(line: 1516, column: 25, scope: !3250)
!3253 = !MDLocation(line: 1517, column: 46, scope: !3250)
!3254 = !MDLocation(line: 1517, column: 25, scope: !3250)
!3255 = !MDLocation(line: 1519, column: 21, scope: !3250)
!3256 = !MDLocation(line: 1520, column: 17, scope: !3241)
!3257 = !MDLocation(line: 1522, column: 17, scope: !3235)
!3258 = !MDLocation(line: 1523, column: 17, scope: !3235)
!3259 = !MDLocation(line: 1524, column: 13, scope: !3235)
!3260 = !MDLocation(line: 1503, column: 32, scope: !3232)
!3261 = !MDLocation(line: 1503, column: 13, scope: !3232)
!3262 = !MDLocation(line: 1527, column: 9, scope: !3210)
!3263 = !MDLocation(line: 1527, column: 16, scope: !3210)
!3264 = !MDLocation(line: 1529, column: 23, scope: !3265)
!3265 = !{!"0xb\001528\009\00290", !1, !3210}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3266 = !MDLocation(line: 1529, column: 13, scope: !3265)
!3267 = !MDLocation(line: 1531, column: 17, scope: !3268)
!3268 = !{!"0xb\001531\0017\00291", !1, !3265}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3269 = !MDLocation(line: 1531, column: 17, scope: !3265)
!3270 = !MDLocation(line: 1533, column: 37, scope: !3271)
!3271 = !{!"0xb\001532\0013\00292", !1, !3268}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3272 = !MDLocation(line: 1533, column: 17, scope: !3271)
!3273 = !MDLocation(line: 1535, column: 43, scope: !3271)
!3274 = !MDLocation(line: 1534, column: 28, scope: !3271)
!3275 = !MDLocation(line: 1534, column: 17, scope: !3271)
!3276 = !MDLocation(line: 1537, column: 21, scope: !3277)
!3277 = !{!"0xb\001537\0021\00293", !1, !3271}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3278 = !MDLocation(line: 1537, column: 21, scope: !3271)
!3279 = !MDLocation(line: 1539, column: 31, scope: !3280)
!3280 = !{!"0xb\001538\0017\00294", !1, !3277}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3281 = !MDLocation(line: 1540, column: 42, scope: !3280)
!3282 = !MDLocation(line: 1540, column: 21, scope: !3280)
!3283 = !MDLocation(line: 1541, column: 42, scope: !3280)
!3284 = !MDLocation(line: 1541, column: 21, scope: !3280)
!3285 = !MDLocation(line: 1543, column: 17, scope: !3280)
!3286 = !MDLocation(line: 1544, column: 13, scope: !3271)
!3287 = !MDLocation(line: 1546, column: 13, scope: !3265)
!3288 = !MDLocation(line: 1547, column: 13, scope: !3265)
!3289 = !MDLocation(line: 1550, column: 5, scope: !3210)
!3290 = !MDLocation(line: 1491, column: 37, scope: !3207)
!3291 = !MDLocation(line: 1491, column: 5, scope: !3207)
!3292 = !MDLocation(line: 1552, column: 25, scope: !485)
!3293 = !MDLocation(line: 1552, column: 5, scope: !485)
!3294 = !MDLocation(line: 1553, column: 25, scope: !485)
!3295 = !MDLocation(line: 1553, column: 5, scope: !485)
!3296 = !MDLocation(line: 1555, column: 12, scope: !485)
!3297 = !MDLocation(line: 1556, column: 55, scope: !485)
!3298 = !MDLocation(line: 1556, column: 14, scope: !485)
!3299 = !MDLocation(line: 1555, column: 5, scope: !485)
!3300 = !{!"0x101\00x\0016778775\000", !486, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1559]
!3301 = !MDLocation(line: 1559, column: 39, scope: !486)
!3302 = !{!"0x101\00b\0033555991\000", !486, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1559]
!3303 = !MDLocation(line: 1559, column: 49, scope: !486)
!3304 = !{!"0x101\00d\0050333207\000", !486, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1559]
!3305 = !MDLocation(line: 1559, column: 60, scope: !486)
!3306 = !{!"0x101\00ref_mv\0067110423\000", !486, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1559]
!3307 = !MDLocation(line: 1559, column: 71, scope: !486)
!3308 = !{!"0x101\00sad_per_bit\0083887640\000", !486, !69, !72} ; [ DW_TAG_arg_variable ] [sad_per_bit] [line 1560]
!3309 = !MDLocation(line: 1560, column: 31, scope: !486)
!3310 = !{!"0x101\00distance\00100664856\000", !486, !69, !72} ; [ DW_TAG_arg_variable ] [distance] [line 1560]
!3311 = !MDLocation(line: 1560, column: 48, scope: !486)
!3312 = !{!"0x101\00fn_ptr\00117442073\000", !486, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1561]
!3313 = !MDLocation(line: 1561, column: 50, scope: !486)
!3314 = !{!"0x101\00mvcost\00134219289\000", !486, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1561]
!3315 = !MDLocation(line: 1561, column: 63, scope: !486)
!3316 = !{!"0x101\00center_mv\00150996506\000", !486, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1562]
!3317 = !MDLocation(line: 1562, column: 35, scope: !486)
!3318 = !MDLocation(line: 1564, column: 30, scope: !486)
!3319 = !MDLocation(line: 1564, column: 28, scope: !486)
!3320 = !MDLocation(line: 1564, column: 45, scope: !486)
!3321 = !{!"0x100\00what\001564\000", !486, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1564]
!3322 = !MDLocation(line: 1564, column: 20, scope: !486)
!3323 = !MDLocation(line: 1565, column: 23, scope: !486)
!3324 = !{!"0x100\00what_stride\001565\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1565]
!3325 = !MDLocation(line: 1565, column: 9, scope: !486)
!3326 = !MDLocation(line: 1566, column: 22, scope: !486)
!3327 = !{!"0x100\00pre_stride\001566\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1566]
!3328 = !MDLocation(line: 1566, column: 9, scope: !486)
!3329 = !MDLocation(line: 1567, column: 31, scope: !486)
!3330 = !{!"0x100\00base_pre\001567\000", !486, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1567]
!3331 = !MDLocation(line: 1567, column: 20, scope: !486)
!3332 = !{!"0x100\00in_what_stride\001569\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1569]
!3333 = !MDLocation(line: 1569, column: 9, scope: !486)
!3334 = !{!"0x100\00mv_stride\001570\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [mv_stride] [line 1570]
!3335 = !MDLocation(line: 1570, column: 9, scope: !486)
!3336 = !MDLocation(line: 1572, column: 23, scope: !486)
!3337 = !{!"0x100\00best_mv\001572\000", !486, !69, !73} ; [ DW_TAG_auto_variable ] [best_mv] [line 1572]
!3338 = !MDLocation(line: 1572, column: 13, scope: !486)
!3339 = !{!"0x100\00this_mv\001573\000", !486, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1573]
!3340 = !MDLocation(line: 1573, column: 12, scope: !486)
!3341 = !{!"0x100\00thissad\001575\000", !486, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1575]
!3342 = !MDLocation(line: 1575, column: 18, scope: !486)
!3343 = !MDLocation(line: 1580, column: 19, scope: !486)
!3344 = !{!"0x100\00ref_row\001580\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [ref_row] [line 1580]
!3345 = !MDLocation(line: 1580, column: 9, scope: !486)
!3346 = !MDLocation(line: 1581, column: 19, scope: !486)
!3347 = !{!"0x100\00ref_col\001581\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [ref_col] [line 1581]
!3348 = !MDLocation(line: 1581, column: 9, scope: !486)
!3349 = !MDLocation(line: 1583, column: 19, scope: !486)
!3350 = !{!"0x100\00row_min\001583\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [row_min] [line 1583]
!3351 = !MDLocation(line: 1583, column: 9, scope: !486)
!3352 = !MDLocation(line: 1584, column: 19, scope: !486)
!3353 = !{!"0x100\00row_max\001584\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [row_max] [line 1584]
!3354 = !MDLocation(line: 1584, column: 9, scope: !486)
!3355 = !MDLocation(line: 1585, column: 19, scope: !486)
!3356 = !{!"0x100\00col_min\001585\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [col_min] [line 1585]
!3357 = !MDLocation(line: 1585, column: 9, scope: !486)
!3358 = !MDLocation(line: 1586, column: 19, scope: !486)
!3359 = !{!"0x100\00col_max\001586\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [col_max] [line 1586]
!3360 = !MDLocation(line: 1586, column: 9, scope: !486)
!3361 = !{!"0x100\00sad_array8_\001588\000", !486, !69, !3362} ; [ DW_TAG_auto_variable ] [sad_array8_] [line 1588]
!3362 = !{!"0x1\00\000\00272\0016\000\000\000", null, null, !63, !3363, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 272, align 16, offset 0] [from unsigned short]
!3363 = !{!3364}
!3364 = !{!"0x21\000\0017"}                       ; [ DW_TAG_subrange_type ] [0, 16]
!3365 = !MDLocation(line: 1588, column: 5, scope: !486)
!3366 = !{!"0x100\00sad_array8\001588\000", !486, !69, !62} ; [ DW_TAG_auto_variable ] [sad_array8] [line 1588]
!3367 = !{!"0x100\00sad_array\001589\000", !486, !69, !3147} ; [ DW_TAG_auto_variable ] [sad_array] [line 1589]
!3368 = !MDLocation(line: 1589, column: 18, scope: !486)
!3369 = !{!"0x100\00mvsadcost\001591\000", !486, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1591]
!3370 = !MDLocation(line: 1591, column: 10, scope: !486)
!3371 = !{!"0x100\00fcenter_mv\001592\000", !486, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1592]
!3372 = !MDLocation(line: 1592, column: 12, scope: !486)
!3373 = !MDLocation(line: 1594, column: 20, scope: !486)
!3374 = !MDLocation(line: 1594, column: 5, scope: !486)
!3375 = !MDLocation(line: 1595, column: 20, scope: !486)
!3376 = !MDLocation(line: 1595, column: 5, scope: !486)
!3377 = !MDLocation(line: 1596, column: 28, scope: !486)
!3378 = !MDLocation(line: 1596, column: 5, scope: !486)
!3379 = !MDLocation(line: 1597, column: 28, scope: !486)
!3380 = !MDLocation(line: 1597, column: 5, scope: !486)
!3381 = !MDLocation(line: 1600, column: 26, scope: !486)
!3382 = !MDLocation(line: 1600, column: 15, scope: !486)
!3383 = !{!"0x100\00in_what\001568\000", !486, !69, !60} ; [ DW_TAG_auto_variable ] [in_what] [line 1568]
!3384 = !MDLocation(line: 1568, column: 20, scope: !486)
!3385 = !MDLocation(line: 1601, column: 30, scope: !486)
!3386 = !MDLocation(line: 1601, column: 19, scope: !486)
!3387 = !{!"0x100\00bestaddress\001571\000", !486, !69, !60} ; [ DW_TAG_auto_variable ] [bestaddress] [line 1571]
!3388 = !MDLocation(line: 1571, column: 20, scope: !486)
!3389 = !MDLocation(line: 1603, column: 26, scope: !486)
!3390 = !MDLocation(line: 1603, column: 5, scope: !486)
!3391 = !MDLocation(line: 1604, column: 26, scope: !486)
!3392 = !MDLocation(line: 1604, column: 5, scope: !486)
!3393 = !MDLocation(line: 1607, column: 15, scope: !486)
!3394 = !MDLocation(line: 1609, column: 52, scope: !486)
!3395 = !MDLocation(line: 1609, column: 15, scope: !486)
!3396 = !{!"0x100\00bestsad\001574\000", !486, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1574]
!3397 = !MDLocation(line: 1574, column: 18, scope: !486)
!3398 = !MDLocation(line: 1614, column: 19, scope: !3399)
!3399 = !{!"0xb\001614\009\00295", !1, !486}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3400 = !MDLocation(line: 1614, column: 9, scope: !3399)
!3401 = !MDLocation(line: 1614, column: 9, scope: !486)
!3402 = !MDLocation(line: 1615, column: 19, scope: !3399)
!3403 = !MDLocation(line: 1615, column: 9, scope: !3399)
!3404 = !MDLocation(line: 1617, column: 19, scope: !3405)
!3405 = !{!"0xb\001617\009\00296", !1, !486}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3406 = !MDLocation(line: 1617, column: 9, scope: !3405)
!3407 = !MDLocation(line: 1617, column: 9, scope: !486)
!3408 = !MDLocation(line: 1618, column: 19, scope: !3405)
!3409 = !MDLocation(line: 1618, column: 9, scope: !3405)
!3410 = !MDLocation(line: 1620, column: 19, scope: !3411)
!3411 = !{!"0xb\001620\009\00297", !1, !486}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3412 = !MDLocation(line: 1620, column: 9, scope: !3411)
!3413 = !MDLocation(line: 1620, column: 9, scope: !486)
!3414 = !MDLocation(line: 1621, column: 19, scope: !3411)
!3415 = !MDLocation(line: 1621, column: 9, scope: !3411)
!3416 = !MDLocation(line: 1623, column: 19, scope: !3417)
!3417 = !{!"0xb\001623\009\00298", !1, !486}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3418 = !MDLocation(line: 1623, column: 9, scope: !3417)
!3419 = !MDLocation(line: 1623, column: 9, scope: !486)
!3420 = !MDLocation(line: 1624, column: 19, scope: !3417)
!3421 = !MDLocation(line: 1624, column: 9, scope: !3417)
!3422 = !{!"0x100\00r\001576\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [r] [line 1576]
!3423 = !MDLocation(line: 1576, column: 9, scope: !486)
!3424 = !MDLocation(line: 1626, column: 10, scope: !3425)
!3425 = !{!"0xb\001626\005\00299", !1, !486}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3426 = !MDLocation(line: 1626, column: 23, scope: !3427)
!3427 = !{!"0xb\001626\005\00300", !1, !3425}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3428 = !MDLocation(line: 1626, column: 5, scope: !3425)
!3429 = !MDLocation(line: 1628, column: 29, scope: !3430)
!3430 = !{!"0xb\001627\005\00301", !1, !3427}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3431 = !MDLocation(line: 1628, column: 9, scope: !3430)
!3432 = !MDLocation(line: 1629, column: 22, scope: !3430)
!3433 = !{!"0x100\00check_here\001578\000", !486, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1578]
!3434 = !MDLocation(line: 1578, column: 20, scope: !486)
!3435 = !{!"0x100\00c\001576\000", !486, !69, !72} ; [ DW_TAG_auto_variable ] [c] [line 1576]
!3436 = !MDLocation(line: 1576, column: 12, scope: !486)
!3437 = !MDLocation(line: 1632, column: 9, scope: !3430)
!3438 = !MDLocation(line: 1632, column: 17, scope: !3439)
!3439 = !{!"0xb\002", !1, !3440}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3440 = !{!"0xb\001", !1, !3430}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3441 = !MDLocation(line: 1632, column: 16, scope: !3430)
!3442 = !MDLocation(line: 1636, column: 13, scope: !3443)
!3443 = !{!"0xb\001633\009\00302", !1, !3430}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3444 = !{!"0x100\00i\001634\000", !3443, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1634]
!3445 = !MDLocation(line: 1634, column: 17, scope: !3443)
!3446 = !MDLocation(line: 1638, column: 18, scope: !3447)
!3447 = !{!"0xb\001638\0013\00303", !1, !3443}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3448 = !MDLocation(line: 1638, column: 25, scope: !3449)
!3449 = !{!"0xb\002", !1, !3450}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3450 = !{!"0xb\001", !1, !3451}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3451 = !{!"0xb\001638\0013\00304", !1, !3447}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3452 = !MDLocation(line: 1638, column: 13, scope: !3447)
!3453 = !MDLocation(line: 1640, column: 27, scope: !3454)
!3454 = !{!"0xb\001639\0013\00305", !1, !3451}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3455 = !MDLocation(line: 1640, column: 17, scope: !3454)
!3456 = !MDLocation(line: 1642, column: 21, scope: !3457)
!3457 = !{!"0xb\001642\0021\00306", !1, !3454}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3458 = !MDLocation(line: 1642, column: 21, scope: !3454)
!3459 = !MDLocation(line: 1644, column: 41, scope: !3460)
!3460 = !{!"0xb\001643\0017\00307", !1, !3457}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3461 = !MDLocation(line: 1644, column: 21, scope: !3460)
!3462 = !MDLocation(line: 1646, column: 47, scope: !3460)
!3463 = !MDLocation(line: 1645, column: 32, scope: !3460)
!3464 = !MDLocation(line: 1645, column: 21, scope: !3460)
!3465 = !MDLocation(line: 1648, column: 25, scope: !3466)
!3466 = !{!"0xb\001648\0025\00308", !1, !3460}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3467 = !MDLocation(line: 1648, column: 25, scope: !3460)
!3468 = !MDLocation(line: 1650, column: 35, scope: !3469)
!3469 = !{!"0xb\001649\0021\00309", !1, !3466}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3470 = !MDLocation(line: 1651, column: 46, scope: !3469)
!3471 = !MDLocation(line: 1651, column: 25, scope: !3469)
!3472 = !MDLocation(line: 1652, column: 46, scope: !3469)
!3473 = !MDLocation(line: 1652, column: 25, scope: !3469)
!3474 = !MDLocation(line: 1654, column: 21, scope: !3469)
!3475 = !MDLocation(line: 1655, column: 17, scope: !3460)
!3476 = !MDLocation(line: 1657, column: 17, scope: !3454)
!3477 = !MDLocation(line: 1658, column: 17, scope: !3454)
!3478 = !MDLocation(line: 1659, column: 13, scope: !3454)
!3479 = !MDLocation(line: 1638, column: 32, scope: !3451)
!3480 = !MDLocation(line: 1638, column: 13, scope: !3451)
!3481 = !MDLocation(line: 1662, column: 9, scope: !3430)
!3482 = !MDLocation(line: 1662, column: 17, scope: !3439)
!3483 = !MDLocation(line: 1662, column: 16, scope: !3430)
!3484 = !MDLocation(line: 1666, column: 13, scope: !3485)
!3485 = !{!"0xb\001663\009\00310", !1, !3430}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3486 = !MDLocation(line: 1666, column: 75, scope: !3485)
!3487 = !{!"0x100\00i\001664\000", !3485, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1664]
!3488 = !MDLocation(line: 1664, column: 17, scope: !3485)
!3489 = !MDLocation(line: 1668, column: 18, scope: !3490)
!3490 = !{!"0xb\001668\0013\00311", !1, !3485}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3491 = !MDLocation(line: 1668, column: 25, scope: !3492)
!3492 = !{!"0xb\002", !1, !3493}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3493 = !{!"0xb\001", !1, !3494}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3494 = !{!"0xb\001668\0013\00312", !1, !3490}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3495 = !MDLocation(line: 1668, column: 13, scope: !3490)
!3496 = !MDLocation(line: 1670, column: 27, scope: !3497)
!3497 = !{!"0xb\001669\0013\00313", !1, !3494}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3498 = !MDLocation(line: 1670, column: 17, scope: !3497)
!3499 = !MDLocation(line: 1672, column: 21, scope: !3500)
!3500 = !{!"0xb\001672\0021\00314", !1, !3497}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3501 = !MDLocation(line: 1672, column: 21, scope: !3497)
!3502 = !MDLocation(line: 1674, column: 41, scope: !3503)
!3503 = !{!"0xb\001673\0017\00315", !1, !3500}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3504 = !MDLocation(line: 1674, column: 21, scope: !3503)
!3505 = !MDLocation(line: 1676, column: 25, scope: !3503)
!3506 = !MDLocation(line: 1675, column: 33, scope: !3503)
!3507 = !MDLocation(line: 1675, column: 21, scope: !3503)
!3508 = !MDLocation(line: 1678, column: 25, scope: !3509)
!3509 = !{!"0xb\001678\0025\00316", !1, !3503}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3510 = !MDLocation(line: 1678, column: 25, scope: !3503)
!3511 = !MDLocation(line: 1680, column: 35, scope: !3512)
!3512 = !{!"0xb\001679\0021\00317", !1, !3509}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3513 = !MDLocation(line: 1681, column: 46, scope: !3512)
!3514 = !MDLocation(line: 1681, column: 25, scope: !3512)
!3515 = !MDLocation(line: 1682, column: 46, scope: !3512)
!3516 = !MDLocation(line: 1682, column: 25, scope: !3512)
!3517 = !MDLocation(line: 1684, column: 21, scope: !3512)
!3518 = !MDLocation(line: 1685, column: 17, scope: !3503)
!3519 = !MDLocation(line: 1687, column: 17, scope: !3497)
!3520 = !MDLocation(line: 1688, column: 17, scope: !3497)
!3521 = !MDLocation(line: 1689, column: 13, scope: !3497)
!3522 = !MDLocation(line: 1668, column: 32, scope: !3494)
!3523 = !MDLocation(line: 1668, column: 13, scope: !3494)
!3524 = !MDLocation(line: 1692, column: 9, scope: !3430)
!3525 = !MDLocation(line: 1692, column: 16, scope: !3430)
!3526 = !MDLocation(line: 1694, column: 23, scope: !3527)
!3527 = !{!"0xb\001693\009\00318", !1, !3430}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3528 = !MDLocation(line: 1694, column: 13, scope: !3527)
!3529 = !MDLocation(line: 1696, column: 17, scope: !3530)
!3530 = !{!"0xb\001696\0017\00319", !1, !3527}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3531 = !MDLocation(line: 1696, column: 17, scope: !3527)
!3532 = !MDLocation(line: 1698, column: 37, scope: !3533)
!3533 = !{!"0xb\001697\0013\00320", !1, !3530}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3534 = !MDLocation(line: 1698, column: 17, scope: !3533)
!3535 = !MDLocation(line: 1700, column: 21, scope: !3533)
!3536 = !MDLocation(line: 1699, column: 29, scope: !3533)
!3537 = !MDLocation(line: 1699, column: 17, scope: !3533)
!3538 = !MDLocation(line: 1702, column: 21, scope: !3539)
!3539 = !{!"0xb\001702\0021\00321", !1, !3533}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3540 = !MDLocation(line: 1702, column: 21, scope: !3533)
!3541 = !MDLocation(line: 1704, column: 31, scope: !3542)
!3542 = !{!"0xb\001703\0017\00322", !1, !3539}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3543 = !MDLocation(line: 1705, column: 42, scope: !3542)
!3544 = !MDLocation(line: 1705, column: 21, scope: !3542)
!3545 = !MDLocation(line: 1706, column: 42, scope: !3542)
!3546 = !MDLocation(line: 1706, column: 21, scope: !3542)
!3547 = !MDLocation(line: 1708, column: 17, scope: !3542)
!3548 = !MDLocation(line: 1709, column: 13, scope: !3533)
!3549 = !MDLocation(line: 1711, column: 13, scope: !3527)
!3550 = !MDLocation(line: 1712, column: 13, scope: !3527)
!3551 = !MDLocation(line: 1714, column: 5, scope: !3430)
!3552 = !MDLocation(line: 1626, column: 37, scope: !3427)
!3553 = !MDLocation(line: 1626, column: 5, scope: !3427)
!3554 = !MDLocation(line: 1716, column: 25, scope: !486)
!3555 = !MDLocation(line: 1716, column: 5, scope: !486)
!3556 = !MDLocation(line: 1717, column: 25, scope: !486)
!3557 = !MDLocation(line: 1717, column: 5, scope: !486)
!3558 = !MDLocation(line: 1719, column: 12, scope: !486)
!3559 = !MDLocation(line: 1720, column: 55, scope: !486)
!3560 = !MDLocation(line: 1720, column: 14, scope: !486)
!3561 = !MDLocation(line: 1719, column: 5, scope: !486)
!3562 = !{!"0x101\00x\0016778939\000", !487, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1723]
!3563 = !MDLocation(line: 1723, column: 43, scope: !487)
!3564 = !{!"0x101\00b\0033556155\000", !487, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1723]
!3565 = !MDLocation(line: 1723, column: 53, scope: !487)
!3566 = !{!"0x101\00d\0050333371\000", !487, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1723]
!3567 = !MDLocation(line: 1723, column: 64, scope: !487)
!3568 = !{!"0x101\00ref_mv\0067110587\000", !487, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1723]
!3569 = !MDLocation(line: 1723, column: 75, scope: !487)
!3570 = !{!"0x101\00error_per_bit\0083887804\000", !487, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 1724]
!3571 = !MDLocation(line: 1724, column: 33, scope: !487)
!3572 = !{!"0x101\00search_range\00100665020\000", !487, !69, !72} ; [ DW_TAG_arg_variable ] [search_range] [line 1724]
!3573 = !MDLocation(line: 1724, column: 52, scope: !487)
!3574 = !{!"0x101\00fn_ptr\00117442237\000", !487, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1725]
!3575 = !MDLocation(line: 1725, column: 52, scope: !487)
!3576 = !{!"0x101\00mvcost\00134219453\000", !487, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1725]
!3577 = !MDLocation(line: 1725, column: 65, scope: !487)
!3578 = !{!"0x101\00center_mv\00150996670\000", !487, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1726]
!3579 = !MDLocation(line: 1726, column: 37, scope: !487)
!3580 = !{!"0x100\00neighbors\001728\000", !487, !69, !1953} ; [ DW_TAG_auto_variable ] [neighbors] [line 1728]
!3581 = !MDLocation(line: 1728, column: 8, scope: !487)
!3582 = !MDLocation(line: 1732, column: 23, scope: !487)
!3583 = !{!"0x100\00what_stride\001732\000", !487, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1732]
!3584 = !MDLocation(line: 1732, column: 9, scope: !487)
!3585 = !MDLocation(line: 1733, column: 22, scope: !487)
!3586 = !{!"0x100\00pre_stride\001733\000", !487, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1733]
!3587 = !MDLocation(line: 1733, column: 9, scope: !487)
!3588 = !MDLocation(line: 1734, column: 31, scope: !487)
!3589 = !{!"0x100\00base_pre\001734\000", !487, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1734]
!3590 = !MDLocation(line: 1734, column: 20, scope: !487)
!3591 = !{!"0x100\00in_what_stride\001735\000", !487, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1735]
!3592 = !MDLocation(line: 1735, column: 9, scope: !487)
!3593 = !MDLocation(line: 1736, column: 30, scope: !487)
!3594 = !MDLocation(line: 1736, column: 28, scope: !487)
!3595 = !MDLocation(line: 1736, column: 45, scope: !487)
!3596 = !{!"0x100\00what\001736\000", !487, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1736]
!3597 = !MDLocation(line: 1736, column: 20, scope: !487)
!3598 = !MDLocation(line: 1737, column: 64, scope: !487)
!3599 = !MDLocation(line: 1737, column: 53, scope: !487)
!3600 = !MDLocation(line: 1738, column: 10, scope: !487)
!3601 = !MDLocation(line: 1738, column: 44, scope: !487)
!3602 = !{!"0x100\00best_address\001737\000", !487, !69, !60} ; [ DW_TAG_auto_variable ] [best_address] [line 1737]
!3603 = !MDLocation(line: 1737, column: 20, scope: !487)
!3604 = !{!"0x100\00this_mv\001740\000", !487, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1740]
!3605 = !MDLocation(line: 1740, column: 12, scope: !487)
!3606 = !{!"0x100\00thissad\001742\000", !487, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1742]
!3607 = !MDLocation(line: 1742, column: 18, scope: !487)
!3608 = !{!"0x100\00mvsadcost\001744\000", !487, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1744]
!3609 = !MDLocation(line: 1744, column: 10, scope: !487)
!3610 = !{!"0x100\00fcenter_mv\001745\000", !487, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1745]
!3611 = !MDLocation(line: 1745, column: 12, scope: !487)
!3612 = !MDLocation(line: 1747, column: 20, scope: !487)
!3613 = !MDLocation(line: 1747, column: 5, scope: !487)
!3614 = !MDLocation(line: 1748, column: 20, scope: !487)
!3615 = !MDLocation(line: 1748, column: 5, scope: !487)
!3616 = !MDLocation(line: 1749, column: 28, scope: !487)
!3617 = !MDLocation(line: 1749, column: 5, scope: !487)
!3618 = !MDLocation(line: 1750, column: 28, scope: !487)
!3619 = !MDLocation(line: 1750, column: 5, scope: !487)
!3620 = !MDLocation(line: 1752, column: 15, scope: !487)
!3621 = !MDLocation(line: 1754, column: 51, scope: !487)
!3622 = !MDLocation(line: 1754, column: 15, scope: !487)
!3623 = !{!"0x100\00bestsad\001741\000", !487, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1741]
!3624 = !MDLocation(line: 1741, column: 18, scope: !487)
!3625 = !{!"0x100\00i\001729\000", !487, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1729]
!3626 = !MDLocation(line: 1729, column: 9, scope: !487)
!3627 = !MDLocation(line: 1756, column: 10, scope: !3628)
!3628 = !{!"0xb\001756\005\00323", !1, !487}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3629 = !MDLocation(line: 1756, column: 15, scope: !3630)
!3630 = !{!"0xb\001756\005\00324", !1, !3628}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3631 = !MDLocation(line: 1756, column: 5, scope: !3628)
!3632 = !{!"0x100\00best_site\001758\000", !3633, !69, !72} ; [ DW_TAG_auto_variable ] [best_site] [line 1758]
!3633 = !{!"0xb\001757\005\00325", !1, !3630}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3634 = !MDLocation(line: 1758, column: 13, scope: !3633)
!3635 = !{!"0x100\00j\001729\000", !487, !69, !72} ; [ DW_TAG_auto_variable ] [j] [line 1729]
!3636 = !MDLocation(line: 1729, column: 12, scope: !487)
!3637 = !MDLocation(line: 1760, column: 14, scope: !3638)
!3638 = !{!"0xb\001760\009\00326", !1, !3633}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3639 = !MDLocation(line: 1760, column: 22, scope: !3640)
!3640 = !{!"0xb\002", !1, !3641}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3641 = !{!"0xb\001", !1, !3642}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3642 = !{!"0xb\001760\009\00327", !1, !3638}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3643 = !MDLocation(line: 1760, column: 9, scope: !3638)
!3644 = !MDLocation(line: 1762, column: 31, scope: !3645)
!3645 = !{!"0xb\001761\009\00328", !1, !3642}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3646 = !MDLocation(line: 1762, column: 51, scope: !3645)
!3647 = !{!"0x100\00this_row_offset\001730\000", !487, !69, !86} ; [ DW_TAG_auto_variable ] [this_row_offset] [line 1730]
!3648 = !MDLocation(line: 1730, column: 11, scope: !487)
!3649 = !MDLocation(line: 1763, column: 31, scope: !3645)
!3650 = !MDLocation(line: 1763, column: 51, scope: !3645)
!3651 = !{!"0x100\00this_col_offset\001730\000", !487, !69, !86} ; [ DW_TAG_auto_variable ] [this_col_offset] [line 1730]
!3652 = !MDLocation(line: 1730, column: 28, scope: !487)
!3653 = !MDLocation(line: 1765, column: 18, scope: !3654)
!3654 = !{!"0xb\001765\0017\00329", !1, !3645}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3655 = !MDLocation(line: 1765, column: 36, scope: !3654)
!3656 = !MDLocation(line: 1765, column: 17, scope: !3645)
!3657 = !MDLocation(line: 1765, column: 55, scope: !3658)
!3658 = !{!"0xb\001", !1, !3654}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3659 = !MDLocation(line: 1765, column: 73, scope: !3654)
!3660 = !MDLocation(line: 1765, column: 55, scope: !3654)
!3661 = !MDLocation(line: 1766, column: 14, scope: !3654)
!3662 = !MDLocation(line: 1766, column: 32, scope: !3654)
!3663 = !MDLocation(line: 1766, column: 51, scope: !3654)
!3664 = !MDLocation(line: 1766, column: 69, scope: !3654)
!3665 = !MDLocation(line: 1768, column: 31, scope: !3666)
!3666 = !{!"0xb\001767\0013\00330", !1, !3654}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3667 = !MDLocation(line: 1768, column: 30, scope: !3666)
!3668 = !MDLocation(line: 1768, column: 66, scope: !3666)
!3669 = !{!"0x100\00check_here\001739\000", !487, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1739]
!3670 = !MDLocation(line: 1739, column: 20, scope: !487)
!3671 = !MDLocation(line: 1769, column: 27, scope: !3666)
!3672 = !MDLocation(line: 1769, column: 17, scope: !3666)
!3673 = !MDLocation(line: 1771, column: 21, scope: !3674)
!3674 = !{!"0xb\001771\0021\00331", !1, !3666}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3675 = !MDLocation(line: 1771, column: 21, scope: !3666)
!3676 = !MDLocation(line: 1773, column: 21, scope: !3677)
!3677 = !{!"0xb\001772\0017\00332", !1, !3674}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3678 = !MDLocation(line: 1774, column: 21, scope: !3677)
!3679 = !MDLocation(line: 1775, column: 70, scope: !3677)
!3680 = !MDLocation(line: 1775, column: 32, scope: !3677)
!3681 = !MDLocation(line: 1775, column: 21, scope: !3677)
!3682 = !MDLocation(line: 1777, column: 25, scope: !3683)
!3683 = !{!"0xb\001777\0025\00333", !1, !3677}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3684 = !MDLocation(line: 1777, column: 25, scope: !3677)
!3685 = !MDLocation(line: 1779, column: 35, scope: !3686)
!3686 = !{!"0xb\001778\0021\00334", !1, !3683}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3687 = !MDLocation(line: 1781, column: 21, scope: !3686)
!3688 = !MDLocation(line: 1782, column: 17, scope: !3677)
!3689 = !MDLocation(line: 1783, column: 13, scope: !3666)
!3690 = !MDLocation(line: 1784, column: 9, scope: !3645)
!3691 = !MDLocation(line: 1760, column: 30, scope: !3642)
!3692 = !MDLocation(line: 1760, column: 9, scope: !3642)
!3693 = !MDLocation(line: 1786, column: 13, scope: !3694)
!3694 = !{!"0xb\001786\0013\00335", !1, !3633}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3695 = !MDLocation(line: 1786, column: 13, scope: !3633)
!3696 = !MDLocation(line: 1787, column: 13, scope: !3694)
!3697 = !MDLocation(line: 1790, column: 34, scope: !3698)
!3698 = !{!"0xb\001789\009\00336", !1, !3694}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3699 = !MDLocation(line: 1790, column: 13, scope: !3698)
!3700 = !MDLocation(line: 1791, column: 34, scope: !3698)
!3701 = !MDLocation(line: 1791, column: 13, scope: !3698)
!3702 = !MDLocation(line: 1792, column: 30, scope: !3698)
!3703 = !MDLocation(line: 1792, column: 29, scope: !3698)
!3704 = !MDLocation(line: 1792, column: 73, scope: !3698)
!3705 = !MDLocation(line: 1792, column: 13, scope: !3698)
!3706 = !MDLocation(line: 1794, column: 5, scope: !3633)
!3707 = !MDLocation(line: 1756, column: 31, scope: !3630)
!3708 = !MDLocation(line: 1756, column: 5, scope: !3630)
!3709 = !MDLocation(line: 1796, column: 25, scope: !487)
!3710 = !MDLocation(line: 1796, column: 5, scope: !487)
!3711 = !MDLocation(line: 1797, column: 25, scope: !487)
!3712 = !MDLocation(line: 1797, column: 5, scope: !487)
!3713 = !MDLocation(line: 1799, column: 12, scope: !487)
!3714 = !MDLocation(line: 1800, column: 55, scope: !487)
!3715 = !MDLocation(line: 1800, column: 14, scope: !487)
!3716 = !MDLocation(line: 1799, column: 5, scope: !487)
!3717 = !{!"0x101\00x\0016779019\000", !488, !69, !94} ; [ DW_TAG_arg_variable ] [x] [line 1803]
!3718 = !MDLocation(line: 1803, column: 43, scope: !488)
!3719 = !{!"0x101\00b\0033556235\000", !488, !69, !414} ; [ DW_TAG_arg_variable ] [b] [line 1803]
!3720 = !MDLocation(line: 1803, column: 53, scope: !488)
!3721 = !{!"0x101\00d\0050333451\000", !488, !69, !415} ; [ DW_TAG_arg_variable ] [d] [line 1803]
!3722 = !MDLocation(line: 1803, column: 64, scope: !488)
!3723 = !{!"0x101\00ref_mv\0067110668\000", !488, !69, !73} ; [ DW_TAG_arg_variable ] [ref_mv] [line 1804]
!3724 = !MDLocation(line: 1804, column: 39, scope: !488)
!3725 = !{!"0x101\00error_per_bit\0083887884\000", !488, !69, !72} ; [ DW_TAG_arg_variable ] [error_per_bit] [line 1804]
!3726 = !MDLocation(line: 1804, column: 51, scope: !488)
!3727 = !{!"0x101\00search_range\00100665101\000", !488, !69, !72} ; [ DW_TAG_arg_variable ] [search_range] [line 1805]
!3728 = !MDLocation(line: 1805, column: 35, scope: !488)
!3729 = !{!"0x101\00fn_ptr\00117442317\000", !488, !69, !480} ; [ DW_TAG_arg_variable ] [fn_ptr] [line 1805]
!3730 = !MDLocation(line: 1805, column: 72, scope: !488)
!3731 = !{!"0x101\00mvcost\00134219534\000", !488, !69, !88} ; [ DW_TAG_arg_variable ] [mvcost] [line 1806]
!3732 = !MDLocation(line: 1806, column: 36, scope: !488)
!3733 = !{!"0x101\00center_mv\00150996750\000", !488, !69, !73} ; [ DW_TAG_arg_variable ] [center_mv] [line 1806]
!3734 = !MDLocation(line: 1806, column: 55, scope: !488)
!3735 = !{!"0x100\00neighbors\001808\000", !488, !69, !1953} ; [ DW_TAG_auto_variable ] [neighbors] [line 1808]
!3736 = !MDLocation(line: 1808, column: 8, scope: !488)
!3737 = !MDLocation(line: 1812, column: 23, scope: !488)
!3738 = !{!"0x100\00what_stride\001812\000", !488, !69, !72} ; [ DW_TAG_auto_variable ] [what_stride] [line 1812]
!3739 = !MDLocation(line: 1812, column: 9, scope: !488)
!3740 = !MDLocation(line: 1813, column: 22, scope: !488)
!3741 = !{!"0x100\00pre_stride\001813\000", !488, !69, !72} ; [ DW_TAG_auto_variable ] [pre_stride] [line 1813]
!3742 = !MDLocation(line: 1813, column: 9, scope: !488)
!3743 = !MDLocation(line: 1814, column: 31, scope: !488)
!3744 = !{!"0x100\00base_pre\001814\000", !488, !69, !60} ; [ DW_TAG_auto_variable ] [base_pre] [line 1814]
!3745 = !MDLocation(line: 1814, column: 20, scope: !488)
!3746 = !{!"0x100\00in_what_stride\001815\000", !488, !69, !72} ; [ DW_TAG_auto_variable ] [in_what_stride] [line 1815]
!3747 = !MDLocation(line: 1815, column: 9, scope: !488)
!3748 = !MDLocation(line: 1816, column: 30, scope: !488)
!3749 = !MDLocation(line: 1816, column: 28, scope: !488)
!3750 = !MDLocation(line: 1816, column: 45, scope: !488)
!3751 = !{!"0x100\00what\001816\000", !488, !69, !60} ; [ DW_TAG_auto_variable ] [what] [line 1816]
!3752 = !MDLocation(line: 1816, column: 20, scope: !488)
!3753 = !MDLocation(line: 1817, column: 64, scope: !488)
!3754 = !MDLocation(line: 1817, column: 53, scope: !488)
!3755 = !MDLocation(line: 1818, column: 10, scope: !488)
!3756 = !MDLocation(line: 1818, column: 44, scope: !488)
!3757 = !{!"0x100\00best_address\001817\000", !488, !69, !60} ; [ DW_TAG_auto_variable ] [best_address] [line 1817]
!3758 = !MDLocation(line: 1817, column: 20, scope: !488)
!3759 = !{!"0x100\00this_mv\001820\000", !488, !69, !74} ; [ DW_TAG_auto_variable ] [this_mv] [line 1820]
!3760 = !MDLocation(line: 1820, column: 12, scope: !488)
!3761 = !{!"0x100\00thissad\001822\000", !488, !69, !80} ; [ DW_TAG_auto_variable ] [thissad] [line 1822]
!3762 = !MDLocation(line: 1822, column: 18, scope: !488)
!3763 = !{!"0x100\00mvsadcost\001824\000", !488, !69, !324} ; [ DW_TAG_auto_variable ] [mvsadcost] [line 1824]
!3764 = !MDLocation(line: 1824, column: 10, scope: !488)
!3765 = !{!"0x100\00fcenter_mv\001825\000", !488, !69, !74} ; [ DW_TAG_auto_variable ] [fcenter_mv] [line 1825]
!3766 = !MDLocation(line: 1825, column: 12, scope: !488)
!3767 = !MDLocation(line: 1827, column: 20, scope: !488)
!3768 = !MDLocation(line: 1827, column: 5, scope: !488)
!3769 = !MDLocation(line: 1828, column: 20, scope: !488)
!3770 = !MDLocation(line: 1828, column: 5, scope: !488)
!3771 = !MDLocation(line: 1829, column: 28, scope: !488)
!3772 = !MDLocation(line: 1829, column: 5, scope: !488)
!3773 = !MDLocation(line: 1830, column: 28, scope: !488)
!3774 = !MDLocation(line: 1830, column: 5, scope: !488)
!3775 = !MDLocation(line: 1832, column: 15, scope: !488)
!3776 = !MDLocation(line: 1834, column: 51, scope: !488)
!3777 = !MDLocation(line: 1834, column: 15, scope: !488)
!3778 = !{!"0x100\00bestsad\001821\000", !488, !69, !80} ; [ DW_TAG_auto_variable ] [bestsad] [line 1821]
!3779 = !MDLocation(line: 1821, column: 18, scope: !488)
!3780 = !{!"0x100\00i\001809\000", !488, !69, !72} ; [ DW_TAG_auto_variable ] [i] [line 1809]
!3781 = !MDLocation(line: 1809, column: 9, scope: !488)
!3782 = !MDLocation(line: 1836, column: 10, scope: !3783)
!3783 = !{!"0xb\001836\005\00337", !1, !488}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3784 = !MDLocation(line: 1836, column: 15, scope: !3785)
!3785 = !{!"0xb\001836\005\00338", !1, !3783}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3786 = !MDLocation(line: 1836, column: 5, scope: !3783)
!3787 = !{!"0x100\00best_site\001838\000", !3788, !69, !72} ; [ DW_TAG_auto_variable ] [best_site] [line 1838]
!3788 = !{!"0xb\001837\005\00339", !1, !3785}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3789 = !MDLocation(line: 1838, column: 13, scope: !3788)
!3790 = !{!"0x100\00all_in\001839\000", !3788, !69, !72} ; [ DW_TAG_auto_variable ] [all_in] [line 1839]
!3791 = !MDLocation(line: 1839, column: 13, scope: !3788)
!3792 = !MDLocation(line: 1841, column: 21, scope: !3788)
!3793 = !MDLocation(line: 1841, column: 46, scope: !3788)
!3794 = !MDLocation(line: 1841, column: 20, scope: !3788)
!3795 = !MDLocation(line: 1841, column: 9, scope: !3788)
!3796 = !MDLocation(line: 1842, column: 21, scope: !3788)
!3797 = !MDLocation(line: 1842, column: 46, scope: !3788)
!3798 = !MDLocation(line: 1842, column: 20, scope: !3788)
!3799 = !MDLocation(line: 1842, column: 9, scope: !3788)
!3800 = !MDLocation(line: 1843, column: 21, scope: !3788)
!3801 = !MDLocation(line: 1843, column: 46, scope: !3788)
!3802 = !MDLocation(line: 1843, column: 20, scope: !3788)
!3803 = !MDLocation(line: 1843, column: 9, scope: !3788)
!3804 = !MDLocation(line: 1844, column: 21, scope: !3788)
!3805 = !MDLocation(line: 1844, column: 46, scope: !3788)
!3806 = !MDLocation(line: 1844, column: 20, scope: !3788)
!3807 = !MDLocation(line: 1844, column: 9, scope: !3788)
!3808 = !MDLocation(line: 1846, column: 12, scope: !3788)
!3809 = !{!"0x100\00sad_array\001848\000", !3810, !69, !2770} ; [ DW_TAG_auto_variable ] [sad_array] [line 1848]
!3810 = !{!"0xb\001847\009\00341", !1, !3811}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3811 = !{!"0xb\001846\0012\00340", !1, !3788}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3812 = !MDLocation(line: 1848, column: 26, scope: !3810)
!3813 = !{!"0x100\00block_offset\001849\000", !3810, !69, !2782} ; [ DW_TAG_auto_variable ] [block_offset] [line 1849]
!3814 = !MDLocation(line: 1849, column: 34, scope: !3810)
!3815 = !MDLocation(line: 1850, column: 31, scope: !3810)
!3816 = !MDLocation(line: 1850, column: 13, scope: !3810)
!3817 = !MDLocation(line: 1851, column: 31, scope: !3810)
!3818 = !MDLocation(line: 1851, column: 13, scope: !3810)
!3819 = !MDLocation(line: 1852, column: 31, scope: !3810)
!3820 = !MDLocation(line: 1852, column: 13, scope: !3810)
!3821 = !MDLocation(line: 1853, column: 31, scope: !3810)
!3822 = !MDLocation(line: 1853, column: 13, scope: !3810)
!3823 = !MDLocation(line: 1855, column: 13, scope: !3810)
!3824 = !MDLocation(line: 1855, column: 47, scope: !3810)
!3825 = !MDLocation(line: 1855, column: 77, scope: !3810)
!3826 = !{!"0x100\00j\001809\000", !488, !69, !72} ; [ DW_TAG_auto_variable ] [j] [line 1809]
!3827 = !MDLocation(line: 1809, column: 12, scope: !488)
!3828 = !MDLocation(line: 1857, column: 18, scope: !3829)
!3829 = !{!"0xb\001857\0013\00342", !1, !3810}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3830 = !MDLocation(line: 1857, column: 25, scope: !3831)
!3831 = !{!"0xb\002", !1, !3832}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3832 = !{!"0xb\001", !1, !3833}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3833 = !{!"0xb\001857\0013\00343", !1, !3829}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3834 = !MDLocation(line: 1857, column: 13, scope: !3829)
!3835 = !MDLocation(line: 1859, column: 21, scope: !3836)
!3836 = !{!"0xb\001859\0021\00345", !1, !3837}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3837 = !{!"0xb\001858\0013\00344", !1, !3833}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3838 = !MDLocation(line: 1859, column: 21, scope: !3837)
!3839 = !MDLocation(line: 1861, column: 41, scope: !3840)
!3840 = !{!"0xb\001860\0017\00346", !1, !3836}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3841 = !MDLocation(line: 1861, column: 61, scope: !3840)
!3842 = !MDLocation(line: 1861, column: 21, scope: !3840)
!3843 = !MDLocation(line: 1862, column: 41, scope: !3840)
!3844 = !MDLocation(line: 1862, column: 61, scope: !3840)
!3845 = !MDLocation(line: 1862, column: 21, scope: !3840)
!3846 = !MDLocation(line: 1863, column: 75, scope: !3840)
!3847 = !MDLocation(line: 1863, column: 37, scope: !3840)
!3848 = !MDLocation(line: 1863, column: 21, scope: !3840)
!3849 = !MDLocation(line: 1865, column: 25, scope: !3850)
!3850 = !{!"0xb\001865\0025\00347", !1, !3840}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3851 = !MDLocation(line: 1865, column: 25, scope: !3840)
!3852 = !MDLocation(line: 1867, column: 35, scope: !3853)
!3853 = !{!"0xb\001866\0021\00348", !1, !3850}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3854 = !MDLocation(line: 1869, column: 21, scope: !3853)
!3855 = !MDLocation(line: 1870, column: 17, scope: !3840)
!3856 = !MDLocation(line: 1871, column: 13, scope: !3837)
!3857 = !MDLocation(line: 1857, column: 32, scope: !3833)
!3858 = !MDLocation(line: 1857, column: 13, scope: !3833)
!3859 = !MDLocation(line: 1872, column: 9, scope: !3810)
!3860 = !MDLocation(line: 1875, column: 18, scope: !3861)
!3861 = !{!"0xb\001875\0013\00350", !1, !3862}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3862 = !{!"0xb\001874\009\00349", !1, !3811}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3863 = !MDLocation(line: 1875, column: 26, scope: !3864)
!3864 = !{!"0xb\002", !1, !3865}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3865 = !{!"0xb\001", !1, !3866}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3866 = !{!"0xb\001875\0013\00351", !1, !3861}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3867 = !MDLocation(line: 1875, column: 13, scope: !3861)
!3868 = !MDLocation(line: 1877, column: 35, scope: !3869)
!3869 = !{!"0xb\001876\0013\00352", !1, !3866}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3870 = !MDLocation(line: 1877, column: 55, scope: !3869)
!3871 = !{!"0x100\00this_row_offset\001810\000", !488, !69, !86} ; [ DW_TAG_auto_variable ] [this_row_offset] [line 1810]
!3872 = !MDLocation(line: 1810, column: 11, scope: !488)
!3873 = !MDLocation(line: 1878, column: 35, scope: !3869)
!3874 = !MDLocation(line: 1878, column: 55, scope: !3869)
!3875 = !{!"0x100\00this_col_offset\001810\000", !488, !69, !86} ; [ DW_TAG_auto_variable ] [this_col_offset] [line 1810]
!3876 = !MDLocation(line: 1810, column: 28, scope: !488)
!3877 = !MDLocation(line: 1880, column: 22, scope: !3878)
!3878 = !{!"0xb\001880\0021\00353", !1, !3869}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3879 = !MDLocation(line: 1880, column: 40, scope: !3878)
!3880 = !MDLocation(line: 1880, column: 21, scope: !3869)
!3881 = !MDLocation(line: 1880, column: 59, scope: !3882)
!3882 = !{!"0xb\001", !1, !3878}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3883 = !MDLocation(line: 1880, column: 77, scope: !3878)
!3884 = !MDLocation(line: 1880, column: 59, scope: !3878)
!3885 = !MDLocation(line: 1881, column: 18, scope: !3878)
!3886 = !MDLocation(line: 1881, column: 36, scope: !3878)
!3887 = !MDLocation(line: 1881, column: 55, scope: !3878)
!3888 = !MDLocation(line: 1881, column: 73, scope: !3878)
!3889 = !MDLocation(line: 1883, column: 35, scope: !3890)
!3890 = !{!"0xb\001882\0017\00354", !1, !3878}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3891 = !MDLocation(line: 1883, column: 34, scope: !3890)
!3892 = !MDLocation(line: 1883, column: 70, scope: !3890)
!3893 = !{!"0x100\00check_here\001819\000", !488, !69, !60} ; [ DW_TAG_auto_variable ] [check_here] [line 1819]
!3894 = !MDLocation(line: 1819, column: 20, scope: !488)
!3895 = !MDLocation(line: 1884, column: 31, scope: !3890)
!3896 = !MDLocation(line: 1884, column: 21, scope: !3890)
!3897 = !MDLocation(line: 1886, column: 25, scope: !3898)
!3898 = !{!"0xb\001886\0025\00355", !1, !3890}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3899 = !MDLocation(line: 1886, column: 25, scope: !3890)
!3900 = !MDLocation(line: 1888, column: 25, scope: !3901)
!3901 = !{!"0xb\001887\0021\00356", !1, !3898}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3902 = !MDLocation(line: 1889, column: 25, scope: !3901)
!3903 = !MDLocation(line: 1890, column: 74, scope: !3901)
!3904 = !MDLocation(line: 1890, column: 36, scope: !3901)
!3905 = !MDLocation(line: 1890, column: 25, scope: !3901)
!3906 = !MDLocation(line: 1892, column: 29, scope: !3907)
!3907 = !{!"0xb\001892\0029\00357", !1, !3901}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3908 = !MDLocation(line: 1892, column: 29, scope: !3901)
!3909 = !MDLocation(line: 1894, column: 39, scope: !3910)
!3910 = !{!"0xb\001893\0025\00358", !1, !3907}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3911 = !MDLocation(line: 1896, column: 25, scope: !3910)
!3912 = !MDLocation(line: 1897, column: 21, scope: !3901)
!3913 = !MDLocation(line: 1898, column: 17, scope: !3890)
!3914 = !MDLocation(line: 1899, column: 13, scope: !3869)
!3915 = !MDLocation(line: 1875, column: 34, scope: !3866)
!3916 = !MDLocation(line: 1875, column: 13, scope: !3866)
!3917 = !MDLocation(line: 1902, column: 13, scope: !3918)
!3918 = !{!"0xb\001902\0013\00359", !1, !3788}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3919 = !MDLocation(line: 1902, column: 13, scope: !3788)
!3920 = !MDLocation(line: 1903, column: 13, scope: !3918)
!3921 = !MDLocation(line: 1906, column: 34, scope: !3922)
!3922 = !{!"0xb\001905\009\00360", !1, !3918}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/libvpx-v1.3.0/vp8/encoder/mcomp.c]
!3923 = !MDLocation(line: 1906, column: 13, scope: !3922)
!3924 = !MDLocation(line: 1907, column: 34, scope: !3922)
!3925 = !MDLocation(line: 1907, column: 13, scope: !3922)
!3926 = !MDLocation(line: 1908, column: 30, scope: !3922)
!3927 = !MDLocation(line: 1908, column: 29, scope: !3922)
!3928 = !MDLocation(line: 1908, column: 73, scope: !3922)
!3929 = !MDLocation(line: 1908, column: 13, scope: !3922)
!3930 = !MDLocation(line: 1910, column: 5, scope: !3788)
!3931 = !MDLocation(line: 1836, column: 31, scope: !3785)
!3932 = !MDLocation(line: 1836, column: 5, scope: !3785)
!3933 = !MDLocation(line: 1912, column: 25, scope: !488)
!3934 = !MDLocation(line: 1912, column: 5, scope: !488)
!3935 = !MDLocation(line: 1913, column: 25, scope: !488)
!3936 = !MDLocation(line: 1913, column: 5, scope: !488)
!3937 = !MDLocation(line: 1915, column: 12, scope: !488)
!3938 = !MDLocation(line: 1916, column: 55, scope: !488)
!3939 = !MDLocation(line: 1916, column: 14, scope: !488)
!3940 = !MDLocation(line: 1915, column: 5, scope: !488)
