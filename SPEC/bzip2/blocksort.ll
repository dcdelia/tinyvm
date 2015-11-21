; ModuleID = 'blocksort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.EState = type { %struct.bz_stream*, i32, i32, i32, i32*, i32*, i32*, i32, i32*, i8*, i16*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8], [256 x i8], i32, i32, i32, i32, i32, i32, i32, i32, [258 x i32], [18002 x i8], [18002 x i8], [6 x [258 x i8]], [6 x [258 x i32]], [6 x [258 x i32]], [258 x [4 x i32]] }
%struct.bz_stream = type { i8*, i32, i32, i32, i8*, i32, i32, i32, i8*, i8* (i8*, i32, i32)*, void (i8*, i8*)*, i8* }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [38 x i8] c"      %d work, %d block, ratio %5.2f\0A\00", align 1
@.str1 = private unnamed_addr constant [54 x i8] c"    too repetitive; using fallback sorting algorithm\0A\00", align 1
@.str2 = private unnamed_addr constant [34 x i8] c"        main sort initialise ...\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"        bucket sorting ...\0A\00", align 1
@.str4 = private unnamed_addr constant [48 x i8] c"        qsort [0x%x, 0x%x]   done %d   this %d\0A\00", align 1
@.str5 = private unnamed_addr constant [44 x i8] c"        %d pointers, %d sorted, %d scanned\0A\00", align 1
@incs = internal global [14 x i32] [i32 1, i32 4, i32 13, i32 40, i32 121, i32 364, i32 1093, i32 3280, i32 9841, i32 29524, i32 88573, i32 265720, i32 797161, i32 2391484], align 16
@.str6 = private unnamed_addr constant [23 x i8] c"        depth %6d has \00", align 1
@.str7 = private unnamed_addr constant [24 x i8] c"%6d unresolved strings\0A\00", align 1
@.str8 = private unnamed_addr constant [34 x i8] c"        reconstructing block ...\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @BZ2_blockSort(%struct.EState* %s) #0 {
  %1 = alloca %struct.EState*, align 8
  %ptr = alloca i32*, align 8
  %block = alloca i8*, align 8
  %ftab = alloca i32*, align 8
  %nblock = alloca i32, align 4
  %verb = alloca i32, align 4
  %wfact = alloca i32, align 4
  %quadrant = alloca i16*, align 8
  %budget = alloca i32, align 4
  %budgetInit = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.EState* %s, %struct.EState** %1, align 8
  %2 = load %struct.EState** %1, align 8
  %3 = getelementptr inbounds %struct.EState* %2, i32 0, i32 8
  %4 = load i32** %3, align 8
  store i32* %4, i32** %ptr, align 8
  %5 = load %struct.EState** %1, align 8
  %6 = getelementptr inbounds %struct.EState* %5, i32 0, i32 9
  %7 = load i8** %6, align 8
  store i8* %7, i8** %block, align 8
  %8 = load %struct.EState** %1, align 8
  %9 = getelementptr inbounds %struct.EState* %8, i32 0, i32 6
  %10 = load i32** %9, align 8
  store i32* %10, i32** %ftab, align 8
  %11 = load %struct.EState** %1, align 8
  %12 = getelementptr inbounds %struct.EState* %11, i32 0, i32 17
  %13 = load i32* %12, align 4
  store i32 %13, i32* %nblock, align 4
  %14 = load %struct.EState** %1, align 8
  %15 = getelementptr inbounds %struct.EState* %14, i32 0, i32 28
  %16 = load i32* %15, align 4
  store i32 %16, i32* %verb, align 4
  %17 = load %struct.EState** %1, align 8
  %18 = getelementptr inbounds %struct.EState* %17, i32 0, i32 12
  %19 = load i32* %18, align 4
  store i32 %19, i32* %wfact, align 4
  %20 = load i32* %nblock, align 4
  %21 = icmp slt i32 %20, 10000
  br i1 %21, label %22, label %32

; <label>:22                                      ; preds = %0
  %23 = load %struct.EState** %1, align 8
  %24 = getelementptr inbounds %struct.EState* %23, i32 0, i32 4
  %25 = load i32** %24, align 8
  %26 = load %struct.EState** %1, align 8
  %27 = getelementptr inbounds %struct.EState* %26, i32 0, i32 5
  %28 = load i32** %27, align 8
  %29 = load i32** %ftab, align 8
  %30 = load i32* %nblock, align 4
  %31 = load i32* %verb, align 4
  call void @fallbackSort(i32* %25, i32* %28, i32* %29, i32 %30, i32 %31)
  br label %110

; <label>:32                                      ; preds = %0
  %33 = load i32* %nblock, align 4
  %34 = add nsw i32 %33, 34
  store i32 %34, i32* %i, align 4
  %35 = load i32* %i, align 4
  %36 = and i32 %35, 1
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %41

; <label>:38                                      ; preds = %32
  %39 = load i32* %i, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %i, align 4
  br label %41

; <label>:41                                      ; preds = %38, %32
  %42 = load i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = load i8** %block, align 8
  %45 = getelementptr inbounds i8* %44, i64 %43
  %46 = bitcast i8* %45 to i16*
  store i16* %46, i16** %quadrant, align 8
  %47 = load i32* %wfact, align 4
  %48 = icmp slt i32 %47, 1
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %41
  store i32 1, i32* %wfact, align 4
  br label %50

; <label>:50                                      ; preds = %49, %41
  %51 = load i32* %wfact, align 4
  %52 = icmp sgt i32 %51, 100
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %50
  store i32 100, i32* %wfact, align 4
  br label %54

; <label>:54                                      ; preds = %53, %50
  %55 = load i32* %nblock, align 4
  %56 = load i32* %wfact, align 4
  %57 = sub nsw i32 %56, 1
  %58 = sdiv i32 %57, 3
  %59 = mul nsw i32 %55, %58
  store i32 %59, i32* %budgetInit, align 4
  %60 = load i32* %budgetInit, align 4
  store i32 %60, i32* %budget, align 4
  %61 = load i32** %ptr, align 8
  %62 = load i8** %block, align 8
  %63 = load i16** %quadrant, align 8
  %64 = load i32** %ftab, align 8
  %65 = load i32* %nblock, align 4
  %66 = load i32* %verb, align 4
  call void @mainSort(i32* %61, i8* %62, i16* %63, i32* %64, i32 %65, i32 %66, i32* %budget)
  %67 = load i32* %verb, align 4
  %68 = icmp sge i32 %67, 3
  br i1 %68, label %69, label %90

; <label>:69                                      ; preds = %54
  %70 = load %struct._IO_FILE** @stderr, align 8
  %71 = load i32* %budgetInit, align 4
  %72 = load i32* %budget, align 4
  %73 = sub nsw i32 %71, %72
  %74 = load i32* %nblock, align 4
  %75 = load i32* %budgetInit, align 4
  %76 = load i32* %budget, align 4
  %77 = sub nsw i32 %75, %76
  %78 = sitofp i32 %77 to float
  %79 = load i32* %nblock, align 4
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %82

; <label>:81                                      ; preds = %69
  br label %84

; <label>:82                                      ; preds = %69
  %83 = load i32* %nblock, align 4
  br label %84

; <label>:84                                      ; preds = %82, %81
  %85 = phi i32 [ 1, %81 ], [ %83, %82 ]
  %86 = sitofp i32 %85 to float
  %87 = fdiv float %78, %86
  %88 = fpext float %87 to double
  %89 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %70, i8* getelementptr inbounds ([38 x i8]* @.str, i32 0, i32 0), i32 %73, i32 %74, double %88)
  br label %90

; <label>:90                                      ; preds = %84, %54
  %91 = load i32* %budget, align 4
  %92 = icmp slt i32 %91, 0
  br i1 %92, label %93, label %109

; <label>:93                                      ; preds = %90
  %94 = load i32* %verb, align 4
  %95 = icmp sge i32 %94, 2
  br i1 %95, label %96, label %99

; <label>:96                                      ; preds = %93
  %97 = load %struct._IO_FILE** @stderr, align 8
  %98 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %97, i8* getelementptr inbounds ([54 x i8]* @.str1, i32 0, i32 0))
  br label %99

; <label>:99                                      ; preds = %96, %93
  %100 = load %struct.EState** %1, align 8
  %101 = getelementptr inbounds %struct.EState* %100, i32 0, i32 4
  %102 = load i32** %101, align 8
  %103 = load %struct.EState** %1, align 8
  %104 = getelementptr inbounds %struct.EState* %103, i32 0, i32 5
  %105 = load i32** %104, align 8
  %106 = load i32** %ftab, align 8
  %107 = load i32* %nblock, align 4
  %108 = load i32* %verb, align 4
  call void @fallbackSort(i32* %102, i32* %105, i32* %106, i32 %107, i32 %108)
  br label %109

; <label>:109                                     ; preds = %99, %90
  br label %110

; <label>:110                                     ; preds = %109, %22
  %111 = load %struct.EState** %1, align 8
  %112 = getelementptr inbounds %struct.EState* %111, i32 0, i32 7
  store i32 -1, i32* %112, align 4
  store i32 0, i32* %i, align 4
  br label %113

; <label>:113                                     ; preds = %131, %110
  %114 = load i32* %i, align 4
  %115 = load %struct.EState** %1, align 8
  %116 = getelementptr inbounds %struct.EState* %115, i32 0, i32 17
  %117 = load i32* %116, align 4
  %118 = icmp slt i32 %114, %117
  br i1 %118, label %119, label %134

; <label>:119                                     ; preds = %113
  %120 = load i32* %i, align 4
  %121 = sext i32 %120 to i64
  %122 = load i32** %ptr, align 8
  %123 = getelementptr inbounds i32* %122, i64 %121
  %124 = load i32* %123, align 4
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %130

; <label>:126                                     ; preds = %119
  %127 = load i32* %i, align 4
  %128 = load %struct.EState** %1, align 8
  %129 = getelementptr inbounds %struct.EState* %128, i32 0, i32 7
  store i32 %127, i32* %129, align 4
  br label %134

; <label>:130                                     ; preds = %119
  br label %131

; <label>:131                                     ; preds = %130
  %132 = load i32* %i, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %i, align 4
  br label %113

; <label>:134                                     ; preds = %126, %113
  %135 = load %struct.EState** %1, align 8
  %136 = getelementptr inbounds %struct.EState* %135, i32 0, i32 7
  %137 = load i32* %136, align 4
  %138 = icmp ne i32 %137, -1
  br i1 %138, label %140, label %139

; <label>:139                                     ; preds = %134
  call void @BZ2_bz__AssertH__fail(i32 1003)
  br label %140

; <label>:140                                     ; preds = %139, %134
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @fallbackSort(i32* %fmap, i32* %eclass, i32* %bhtab, i32 %nblock, i32 %verb) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %ftab = alloca [257 x i32], align 16
  %ftabCopy = alloca [256 x i32], align 16
  %H = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %r = alloca i32, align 4
  %cc = alloca i32, align 4
  %cc1 = alloca i32, align 4
  %nNotDone = alloca i32, align 4
  %nBhtab = alloca i32, align 4
  %eclass8 = alloca i8*, align 8
  store i32* %fmap, i32** %1, align 8
  store i32* %eclass, i32** %2, align 8
  store i32* %bhtab, i32** %3, align 8
  store i32 %nblock, i32* %4, align 4
  store i32 %verb, i32* %5, align 4
  %6 = load i32** %2, align 8
  %7 = bitcast i32* %6 to i8*
  store i8* %7, i8** %eclass8, align 8
  %8 = load i32* %5, align 4
  %9 = icmp sge i32 %8, 4
  br i1 %9, label %10, label %13

; <label>:10                                      ; preds = %0
  %11 = load %struct._IO_FILE** @stderr, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0))
  br label %13

; <label>:13                                      ; preds = %10, %0
  store i32 0, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %21, %13
  %15 = load i32* %i, align 4
  %16 = icmp slt i32 %15, 257
  br i1 %16, label %17, label %24

; <label>:17                                      ; preds = %14
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %19
  store i32 0, i32* %20, align 4
  br label %21

; <label>:21                                      ; preds = %17
  %22 = load i32* %i, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %i, align 4
  br label %14

; <label>:24                                      ; preds = %14
  store i32 0, i32* %i, align 4
  br label %25

; <label>:25                                      ; preds = %39, %24
  %26 = load i32* %i, align 4
  %27 = load i32* %4, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %42

; <label>:29                                      ; preds = %25
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = load i8** %eclass8, align 8
  %33 = getelementptr inbounds i8* %32, i64 %31
  %34 = load i8* %33, align 1
  %35 = zext i8 %34 to i64
  %36 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %35
  %37 = load i32* %36, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %36, align 4
  br label %39

; <label>:39                                      ; preds = %29
  %40 = load i32* %i, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %i, align 4
  br label %25

; <label>:42                                      ; preds = %25
  store i32 0, i32* %i, align 4
  br label %43

; <label>:43                                      ; preds = %54, %42
  %44 = load i32* %i, align 4
  %45 = icmp slt i32 %44, 256
  br i1 %45, label %46, label %57

; <label>:46                                      ; preds = %43
  %47 = load i32* %i, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %48
  %50 = load i32* %49, align 4
  %51 = load i32* %i, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [256 x i32]* %ftabCopy, i32 0, i64 %52
  store i32 %50, i32* %53, align 4
  br label %54

; <label>:54                                      ; preds = %46
  %55 = load i32* %i, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %i, align 4
  br label %43

; <label>:57                                      ; preds = %43
  store i32 1, i32* %i, align 4
  br label %58

; <label>:58                                      ; preds = %72, %57
  %59 = load i32* %i, align 4
  %60 = icmp slt i32 %59, 257
  br i1 %60, label %61, label %75

; <label>:61                                      ; preds = %58
  %62 = load i32* %i, align 4
  %63 = sub nsw i32 %62, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %64
  %66 = load i32* %65, align 4
  %67 = load i32* %i, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %68
  %70 = load i32* %69, align 4
  %71 = add nsw i32 %70, %66
  store i32 %71, i32* %69, align 4
  br label %72

; <label>:72                                      ; preds = %61
  %73 = load i32* %i, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %i, align 4
  br label %58

; <label>:75                                      ; preds = %58
  store i32 0, i32* %i, align 4
  br label %76

; <label>:76                                      ; preds = %101, %75
  %77 = load i32* %i, align 4
  %78 = load i32* %4, align 4
  %79 = icmp slt i32 %77, %78
  br i1 %79, label %80, label %104

; <label>:80                                      ; preds = %76
  %81 = load i32* %i, align 4
  %82 = sext i32 %81 to i64
  %83 = load i8** %eclass8, align 8
  %84 = getelementptr inbounds i8* %83, i64 %82
  %85 = load i8* %84, align 1
  %86 = zext i8 %85 to i32
  store i32 %86, i32* %j, align 4
  %87 = load i32* %j, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %88
  %90 = load i32* %89, align 4
  %91 = sub nsw i32 %90, 1
  store i32 %91, i32* %k, align 4
  %92 = load i32* %k, align 4
  %93 = load i32* %j, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %94
  store i32 %92, i32* %95, align 4
  %96 = load i32* %i, align 4
  %97 = load i32* %k, align 4
  %98 = sext i32 %97 to i64
  %99 = load i32** %1, align 8
  %100 = getelementptr inbounds i32* %99, i64 %98
  store i32 %96, i32* %100, align 4
  br label %101

; <label>:101                                     ; preds = %80
  %102 = load i32* %i, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %i, align 4
  br label %76

; <label>:104                                     ; preds = %76
  %105 = load i32* %4, align 4
  %106 = sdiv i32 %105, 32
  %107 = add nsw i32 2, %106
  store i32 %107, i32* %nBhtab, align 4
  store i32 0, i32* %i, align 4
  br label %108

; <label>:108                                     ; preds = %117, %104
  %109 = load i32* %i, align 4
  %110 = load i32* %nBhtab, align 4
  %111 = icmp slt i32 %109, %110
  br i1 %111, label %112, label %120

; <label>:112                                     ; preds = %108
  %113 = load i32* %i, align 4
  %114 = sext i32 %113 to i64
  %115 = load i32** %3, align 8
  %116 = getelementptr inbounds i32* %115, i64 %114
  store i32 0, i32* %116, align 4
  br label %117

; <label>:117                                     ; preds = %112
  %118 = load i32* %i, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %i, align 4
  br label %108

; <label>:120                                     ; preds = %108
  store i32 0, i32* %i, align 4
  br label %121

; <label>:121                                     ; preds = %141, %120
  %122 = load i32* %i, align 4
  %123 = icmp slt i32 %122, 256
  br i1 %123, label %124, label %144

; <label>:124                                     ; preds = %121
  %125 = load i32* %i, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %126
  %128 = load i32* %127, align 4
  %129 = and i32 %128, 31
  %130 = shl i32 1, %129
  %131 = load i32* %i, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %132
  %134 = load i32* %133, align 4
  %135 = ashr i32 %134, 5
  %136 = sext i32 %135 to i64
  %137 = load i32** %3, align 8
  %138 = getelementptr inbounds i32* %137, i64 %136
  %139 = load i32* %138, align 4
  %140 = or i32 %139, %130
  store i32 %140, i32* %138, align 4
  br label %141

; <label>:141                                     ; preds = %124
  %142 = load i32* %i, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %i, align 4
  br label %121

; <label>:144                                     ; preds = %121
  store i32 0, i32* %i, align 4
  br label %145

; <label>:145                                     ; preds = %184, %144
  %146 = load i32* %i, align 4
  %147 = icmp slt i32 %146, 32
  br i1 %147, label %148, label %187

; <label>:148                                     ; preds = %145
  %149 = load i32* %4, align 4
  %150 = load i32* %i, align 4
  %151 = mul nsw i32 2, %150
  %152 = add nsw i32 %149, %151
  %153 = and i32 %152, 31
  %154 = shl i32 1, %153
  %155 = load i32* %4, align 4
  %156 = load i32* %i, align 4
  %157 = mul nsw i32 2, %156
  %158 = add nsw i32 %155, %157
  %159 = ashr i32 %158, 5
  %160 = sext i32 %159 to i64
  %161 = load i32** %3, align 8
  %162 = getelementptr inbounds i32* %161, i64 %160
  %163 = load i32* %162, align 4
  %164 = or i32 %163, %154
  store i32 %164, i32* %162, align 4
  %165 = load i32* %4, align 4
  %166 = load i32* %i, align 4
  %167 = mul nsw i32 2, %166
  %168 = add nsw i32 %165, %167
  %169 = add nsw i32 %168, 1
  %170 = and i32 %169, 31
  %171 = shl i32 1, %170
  %172 = xor i32 %171, -1
  %173 = load i32* %4, align 4
  %174 = load i32* %i, align 4
  %175 = mul nsw i32 2, %174
  %176 = add nsw i32 %173, %175
  %177 = add nsw i32 %176, 1
  %178 = ashr i32 %177, 5
  %179 = sext i32 %178 to i64
  %180 = load i32** %3, align 8
  %181 = getelementptr inbounds i32* %180, i64 %179
  %182 = load i32* %181, align 4
  %183 = and i32 %182, %172
  store i32 %183, i32* %181, align 4
  br label %184

; <label>:184                                     ; preds = %148
  %185 = load i32* %i, align 4
  %186 = add nsw i32 %185, 1
  store i32 %186, i32* %i, align 4
  br label %145

; <label>:187                                     ; preds = %145
  store i32 1, i32* %H, align 4
  br label %188

; <label>:188                                     ; preds = %187, %449
  %189 = load i32* %5, align 4
  %190 = icmp sge i32 %189, 4
  br i1 %190, label %191, label %195

; <label>:191                                     ; preds = %188
  %192 = load %struct._IO_FILE** @stderr, align 8
  %193 = load i32* %H, align 4
  %194 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %192, i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %193)
  br label %195

; <label>:195                                     ; preds = %191, %188
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %196

; <label>:196                                     ; preds = %234, %195
  %197 = load i32* %i, align 4
  %198 = load i32* %4, align 4
  %199 = icmp slt i32 %197, %198
  br i1 %199, label %200, label %237

; <label>:200                                     ; preds = %196
  %201 = load i32* %i, align 4
  %202 = ashr i32 %201, 5
  %203 = sext i32 %202 to i64
  %204 = load i32** %3, align 8
  %205 = getelementptr inbounds i32* %204, i64 %203
  %206 = load i32* %205, align 4
  %207 = load i32* %i, align 4
  %208 = and i32 %207, 31
  %209 = shl i32 1, %208
  %210 = and i32 %206, %209
  %211 = icmp ne i32 %210, 0
  br i1 %211, label %212, label %214

; <label>:212                                     ; preds = %200
  %213 = load i32* %i, align 4
  store i32 %213, i32* %j, align 4
  br label %214

; <label>:214                                     ; preds = %212, %200
  %215 = load i32* %i, align 4
  %216 = sext i32 %215 to i64
  %217 = load i32** %1, align 8
  %218 = getelementptr inbounds i32* %217, i64 %216
  %219 = load i32* %218, align 4
  %220 = load i32* %H, align 4
  %221 = sub i32 %219, %220
  store i32 %221, i32* %k, align 4
  %222 = load i32* %k, align 4
  %223 = icmp slt i32 %222, 0
  br i1 %223, label %224, label %228

; <label>:224                                     ; preds = %214
  %225 = load i32* %4, align 4
  %226 = load i32* %k, align 4
  %227 = add nsw i32 %226, %225
  store i32 %227, i32* %k, align 4
  br label %228

; <label>:228                                     ; preds = %224, %214
  %229 = load i32* %j, align 4
  %230 = load i32* %k, align 4
  %231 = sext i32 %230 to i64
  %232 = load i32** %2, align 8
  %233 = getelementptr inbounds i32* %232, i64 %231
  store i32 %229, i32* %233, align 4
  br label %234

; <label>:234                                     ; preds = %228
  %235 = load i32* %i, align 4
  %236 = add nsw i32 %235, 1
  store i32 %236, i32* %i, align 4
  br label %196

; <label>:237                                     ; preds = %196
  store i32 0, i32* %nNotDone, align 4
  store i32 -1, i32* %r, align 4
  br label %238

; <label>:238                                     ; preds = %237, %431
  %239 = load i32* %r, align 4
  %240 = add nsw i32 %239, 1
  store i32 %240, i32* %k, align 4
  br label %241

; <label>:241                                     ; preds = %259, %238
  %242 = load i32* %k, align 4
  %243 = ashr i32 %242, 5
  %244 = sext i32 %243 to i64
  %245 = load i32** %3, align 8
  %246 = getelementptr inbounds i32* %245, i64 %244
  %247 = load i32* %246, align 4
  %248 = load i32* %k, align 4
  %249 = and i32 %248, 31
  %250 = shl i32 1, %249
  %251 = and i32 %247, %250
  %252 = icmp ne i32 %251, 0
  br i1 %252, label %253, label %257

; <label>:253                                     ; preds = %241
  %254 = load i32* %k, align 4
  %255 = and i32 %254, 31
  %256 = icmp ne i32 %255, 0
  br label %257

; <label>:257                                     ; preds = %253, %241
  %258 = phi i1 [ false, %241 ], [ %256, %253 ]
  br i1 %258, label %259, label %262

; <label>:259                                     ; preds = %257
  %260 = load i32* %k, align 4
  %261 = add nsw i32 %260, 1
  store i32 %261, i32* %k, align 4
  br label %241

; <label>:262                                     ; preds = %257
  %263 = load i32* %k, align 4
  %264 = ashr i32 %263, 5
  %265 = sext i32 %264 to i64
  %266 = load i32** %3, align 8
  %267 = getelementptr inbounds i32* %266, i64 %265
  %268 = load i32* %267, align 4
  %269 = load i32* %k, align 4
  %270 = and i32 %269, 31
  %271 = shl i32 1, %270
  %272 = and i32 %268, %271
  %273 = icmp ne i32 %272, 0
  br i1 %273, label %274, label %303

; <label>:274                                     ; preds = %262
  br label %275

; <label>:275                                     ; preds = %283, %274
  %276 = load i32* %k, align 4
  %277 = ashr i32 %276, 5
  %278 = sext i32 %277 to i64
  %279 = load i32** %3, align 8
  %280 = getelementptr inbounds i32* %279, i64 %278
  %281 = load i32* %280, align 4
  %282 = icmp eq i32 %281, -1
  br i1 %282, label %283, label %286

; <label>:283                                     ; preds = %275
  %284 = load i32* %k, align 4
  %285 = add nsw i32 %284, 32
  store i32 %285, i32* %k, align 4
  br label %275

; <label>:286                                     ; preds = %275
  br label %287

; <label>:287                                     ; preds = %299, %286
  %288 = load i32* %k, align 4
  %289 = ashr i32 %288, 5
  %290 = sext i32 %289 to i64
  %291 = load i32** %3, align 8
  %292 = getelementptr inbounds i32* %291, i64 %290
  %293 = load i32* %292, align 4
  %294 = load i32* %k, align 4
  %295 = and i32 %294, 31
  %296 = shl i32 1, %295
  %297 = and i32 %293, %296
  %298 = icmp ne i32 %297, 0
  br i1 %298, label %299, label %302

; <label>:299                                     ; preds = %287
  %300 = load i32* %k, align 4
  %301 = add nsw i32 %300, 1
  store i32 %301, i32* %k, align 4
  br label %287

; <label>:302                                     ; preds = %287
  br label %303

; <label>:303                                     ; preds = %302, %262
  %304 = load i32* %k, align 4
  %305 = sub nsw i32 %304, 1
  store i32 %305, i32* %l, align 4
  %306 = load i32* %l, align 4
  %307 = load i32* %4, align 4
  %308 = icmp sge i32 %306, %307
  br i1 %308, label %309, label %310

; <label>:309                                     ; preds = %303
  br label %432

; <label>:310                                     ; preds = %303
  br label %311

; <label>:311                                     ; preds = %329, %310
  %312 = load i32* %k, align 4
  %313 = ashr i32 %312, 5
  %314 = sext i32 %313 to i64
  %315 = load i32** %3, align 8
  %316 = getelementptr inbounds i32* %315, i64 %314
  %317 = load i32* %316, align 4
  %318 = load i32* %k, align 4
  %319 = and i32 %318, 31
  %320 = shl i32 1, %319
  %321 = and i32 %317, %320
  %322 = icmp ne i32 %321, 0
  br i1 %322, label %327, label %323

; <label>:323                                     ; preds = %311
  %324 = load i32* %k, align 4
  %325 = and i32 %324, 31
  %326 = icmp ne i32 %325, 0
  br label %327

; <label>:327                                     ; preds = %323, %311
  %328 = phi i1 [ false, %311 ], [ %326, %323 ]
  br i1 %328, label %329, label %332

; <label>:329                                     ; preds = %327
  %330 = load i32* %k, align 4
  %331 = add nsw i32 %330, 1
  store i32 %331, i32* %k, align 4
  br label %311

; <label>:332                                     ; preds = %327
  %333 = load i32* %k, align 4
  %334 = ashr i32 %333, 5
  %335 = sext i32 %334 to i64
  %336 = load i32** %3, align 8
  %337 = getelementptr inbounds i32* %336, i64 %335
  %338 = load i32* %337, align 4
  %339 = load i32* %k, align 4
  %340 = and i32 %339, 31
  %341 = shl i32 1, %340
  %342 = and i32 %338, %341
  %343 = icmp ne i32 %342, 0
  br i1 %343, label %374, label %344

; <label>:344                                     ; preds = %332
  br label %345

; <label>:345                                     ; preds = %353, %344
  %346 = load i32* %k, align 4
  %347 = ashr i32 %346, 5
  %348 = sext i32 %347 to i64
  %349 = load i32** %3, align 8
  %350 = getelementptr inbounds i32* %349, i64 %348
  %351 = load i32* %350, align 4
  %352 = icmp eq i32 %351, 0
  br i1 %352, label %353, label %356

; <label>:353                                     ; preds = %345
  %354 = load i32* %k, align 4
  %355 = add nsw i32 %354, 32
  store i32 %355, i32* %k, align 4
  br label %345

; <label>:356                                     ; preds = %345
  br label %357

; <label>:357                                     ; preds = %370, %356
  %358 = load i32* %k, align 4
  %359 = ashr i32 %358, 5
  %360 = sext i32 %359 to i64
  %361 = load i32** %3, align 8
  %362 = getelementptr inbounds i32* %361, i64 %360
  %363 = load i32* %362, align 4
  %364 = load i32* %k, align 4
  %365 = and i32 %364, 31
  %366 = shl i32 1, %365
  %367 = and i32 %363, %366
  %368 = icmp ne i32 %367, 0
  %369 = xor i1 %368, true
  br i1 %369, label %370, label %373

; <label>:370                                     ; preds = %357
  %371 = load i32* %k, align 4
  %372 = add nsw i32 %371, 1
  store i32 %372, i32* %k, align 4
  br label %357

; <label>:373                                     ; preds = %357
  br label %374

; <label>:374                                     ; preds = %373, %332
  %375 = load i32* %k, align 4
  %376 = sub nsw i32 %375, 1
  store i32 %376, i32* %r, align 4
  %377 = load i32* %r, align 4
  %378 = load i32* %4, align 4
  %379 = icmp sge i32 %377, %378
  br i1 %379, label %380, label %381

; <label>:380                                     ; preds = %374
  br label %432

; <label>:381                                     ; preds = %374
  %382 = load i32* %r, align 4
  %383 = load i32* %l, align 4
  %384 = icmp sgt i32 %382, %383
  br i1 %384, label %385, label %431

; <label>:385                                     ; preds = %381
  %386 = load i32* %r, align 4
  %387 = load i32* %l, align 4
  %388 = sub nsw i32 %386, %387
  %389 = add nsw i32 %388, 1
  %390 = load i32* %nNotDone, align 4
  %391 = add nsw i32 %390, %389
  store i32 %391, i32* %nNotDone, align 4
  %392 = load i32** %1, align 8
  %393 = load i32** %2, align 8
  %394 = load i32* %l, align 4
  %395 = load i32* %r, align 4
  call void @fallbackQSort3(i32* %392, i32* %393, i32 %394, i32 %395)
  store i32 -1, i32* %cc, align 4
  %396 = load i32* %l, align 4
  store i32 %396, i32* %i, align 4
  br label %397

; <label>:397                                     ; preds = %427, %385
  %398 = load i32* %i, align 4
  %399 = load i32* %r, align 4
  %400 = icmp sle i32 %398, %399
  br i1 %400, label %401, label %430

; <label>:401                                     ; preds = %397
  %402 = load i32* %i, align 4
  %403 = sext i32 %402 to i64
  %404 = load i32** %1, align 8
  %405 = getelementptr inbounds i32* %404, i64 %403
  %406 = load i32* %405, align 4
  %407 = zext i32 %406 to i64
  %408 = load i32** %2, align 8
  %409 = getelementptr inbounds i32* %408, i64 %407
  %410 = load i32* %409, align 4
  store i32 %410, i32* %cc1, align 4
  %411 = load i32* %cc, align 4
  %412 = load i32* %cc1, align 4
  %413 = icmp ne i32 %411, %412
  br i1 %413, label %414, label %426

; <label>:414                                     ; preds = %401
  %415 = load i32* %i, align 4
  %416 = and i32 %415, 31
  %417 = shl i32 1, %416
  %418 = load i32* %i, align 4
  %419 = ashr i32 %418, 5
  %420 = sext i32 %419 to i64
  %421 = load i32** %3, align 8
  %422 = getelementptr inbounds i32* %421, i64 %420
  %423 = load i32* %422, align 4
  %424 = or i32 %423, %417
  store i32 %424, i32* %422, align 4
  %425 = load i32* %cc1, align 4
  store i32 %425, i32* %cc, align 4
  br label %426

; <label>:426                                     ; preds = %414, %401
  br label %427

; <label>:427                                     ; preds = %426
  %428 = load i32* %i, align 4
  %429 = add nsw i32 %428, 1
  store i32 %429, i32* %i, align 4
  br label %397

; <label>:430                                     ; preds = %397
  br label %431

; <label>:431                                     ; preds = %430, %381
  br label %238

; <label>:432                                     ; preds = %380, %309
  %433 = load i32* %5, align 4
  %434 = icmp sge i32 %433, 4
  br i1 %434, label %435, label %439

; <label>:435                                     ; preds = %432
  %436 = load %struct._IO_FILE** @stderr, align 8
  %437 = load i32* %nNotDone, align 4
  %438 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %436, i8* getelementptr inbounds ([24 x i8]* @.str7, i32 0, i32 0), i32 %437)
  br label %439

; <label>:439                                     ; preds = %435, %432
  %440 = load i32* %H, align 4
  %441 = mul nsw i32 %440, 2
  store i32 %441, i32* %H, align 4
  %442 = load i32* %H, align 4
  %443 = load i32* %4, align 4
  %444 = icmp sgt i32 %442, %443
  br i1 %444, label %448, label %445

; <label>:445                                     ; preds = %439
  %446 = load i32* %nNotDone, align 4
  %447 = icmp eq i32 %446, 0
  br i1 %447, label %448, label %449

; <label>:448                                     ; preds = %445, %439
  br label %450

; <label>:449                                     ; preds = %445
  br label %188

; <label>:450                                     ; preds = %448
  %451 = load i32* %5, align 4
  %452 = icmp sge i32 %451, 4
  br i1 %452, label %453, label %456

; <label>:453                                     ; preds = %450
  %454 = load %struct._IO_FILE** @stderr, align 8
  %455 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %454, i8* getelementptr inbounds ([34 x i8]* @.str8, i32 0, i32 0))
  br label %456

; <label>:456                                     ; preds = %453, %450
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %457

; <label>:457                                     ; preds = %487, %456
  %458 = load i32* %i, align 4
  %459 = load i32* %4, align 4
  %460 = icmp slt i32 %458, %459
  br i1 %460, label %461, label %490

; <label>:461                                     ; preds = %457
  br label %462

; <label>:462                                     ; preds = %468, %461
  %463 = load i32* %j, align 4
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds [256 x i32]* %ftabCopy, i32 0, i64 %464
  %466 = load i32* %465, align 4
  %467 = icmp eq i32 %466, 0
  br i1 %467, label %468, label %471

; <label>:468                                     ; preds = %462
  %469 = load i32* %j, align 4
  %470 = add nsw i32 %469, 1
  store i32 %470, i32* %j, align 4
  br label %462

; <label>:471                                     ; preds = %462
  %472 = load i32* %j, align 4
  %473 = sext i32 %472 to i64
  %474 = getelementptr inbounds [256 x i32]* %ftabCopy, i32 0, i64 %473
  %475 = load i32* %474, align 4
  %476 = add nsw i32 %475, -1
  store i32 %476, i32* %474, align 4
  %477 = load i32* %j, align 4
  %478 = trunc i32 %477 to i8
  %479 = load i32* %i, align 4
  %480 = sext i32 %479 to i64
  %481 = load i32** %1, align 8
  %482 = getelementptr inbounds i32* %481, i64 %480
  %483 = load i32* %482, align 4
  %484 = zext i32 %483 to i64
  %485 = load i8** %eclass8, align 8
  %486 = getelementptr inbounds i8* %485, i64 %484
  store i8 %478, i8* %486, align 1
  br label %487

; <label>:487                                     ; preds = %471
  %488 = load i32* %i, align 4
  %489 = add nsw i32 %488, 1
  store i32 %489, i32* %i, align 4
  br label %457

; <label>:490                                     ; preds = %457
  %491 = load i32* %j, align 4
  %492 = icmp slt i32 %491, 256
  br i1 %492, label %494, label %493

; <label>:493                                     ; preds = %490
  call void @BZ2_bz__AssertH__fail(i32 1005)
  br label %494

; <label>:494                                     ; preds = %493, %490
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @mainSort(i32* %ptr, i8* %block, i16* %quadrant, i32* %ftab, i32 %nblock, i32 %verb, i32* %budget) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i16*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %ss = alloca i32, align 4
  %sb = alloca i32, align 4
  %runningOrder = alloca [256 x i32], align 16
  %bigDone = alloca [256 x i8], align 16
  %copyStart = alloca [256 x i32], align 16
  %copyEnd = alloca [256 x i32], align 16
  %c1 = alloca i8, align 1
  %numQSorted = alloca i32, align 4
  %s = alloca i16, align 2
  %vv = alloca i32, align 4
  %h = alloca i32, align 4
  %lo = alloca i32, align 4
  %hi = alloca i32, align 4
  %bbStart = alloca i32, align 4
  %bbSize = alloca i32, align 4
  %shifts = alloca i32, align 4
  %a2update = alloca i32, align 4
  %qVal = alloca i16, align 2
  store i32* %ptr, i32** %1, align 8
  store i8* %block, i8** %2, align 8
  store i16* %quadrant, i16** %3, align 8
  store i32* %ftab, i32** %4, align 8
  store i32 %nblock, i32* %5, align 4
  store i32 %verb, i32* %6, align 4
  store i32* %budget, i32** %7, align 8
  %8 = load i32* %6, align 4
  %9 = icmp sge i32 %8, 4
  br i1 %9, label %10, label %13

; <label>:10                                      ; preds = %0
  %11 = load %struct._IO_FILE** @stderr, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([34 x i8]* @.str2, i32 0, i32 0))
  br label %13

; <label>:13                                      ; preds = %10, %0
  store i32 65536, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %22, %13
  %15 = load i32* %i, align 4
  %16 = icmp sge i32 %15, 0
  br i1 %16, label %17, label %25

; <label>:17                                      ; preds = %14
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32** %4, align 8
  %21 = getelementptr inbounds i32* %20, i64 %19
  store i32 0, i32* %21, align 4
  br label %22

; <label>:22                                      ; preds = %17
  %23 = load i32* %i, align 4
  %24 = add nsw i32 %23, -1
  store i32 %24, i32* %i, align 4
  br label %14

; <label>:25                                      ; preds = %14
  %26 = load i8** %2, align 8
  %27 = getelementptr inbounds i8* %26, i64 0
  %28 = load i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = shl i32 %29, 8
  store i32 %30, i32* %j, align 4
  %31 = load i32* %5, align 4
  %32 = sub nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %33

; <label>:33                                      ; preds = %127, %25
  %34 = load i32* %i, align 4
  %35 = icmp sge i32 %34, 3
  br i1 %35, label %36, label %130

; <label>:36                                      ; preds = %33
  %37 = load i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = load i16** %3, align 8
  %40 = getelementptr inbounds i16* %39, i64 %38
  store i16 0, i16* %40, align 2
  %41 = load i32* %j, align 4
  %42 = ashr i32 %41, 8
  %43 = load i32* %i, align 4
  %44 = sext i32 %43 to i64
  %45 = load i8** %2, align 8
  %46 = getelementptr inbounds i8* %45, i64 %44
  %47 = load i8* %46, align 1
  %48 = zext i8 %47 to i16
  %49 = zext i16 %48 to i32
  %50 = shl i32 %49, 8
  %51 = or i32 %42, %50
  store i32 %51, i32* %j, align 4
  %52 = load i32* %j, align 4
  %53 = sext i32 %52 to i64
  %54 = load i32** %4, align 8
  %55 = getelementptr inbounds i32* %54, i64 %53
  %56 = load i32* %55, align 4
  %57 = add i32 %56, 1
  store i32 %57, i32* %55, align 4
  %58 = load i32* %i, align 4
  %59 = sub nsw i32 %58, 1
  %60 = sext i32 %59 to i64
  %61 = load i16** %3, align 8
  %62 = getelementptr inbounds i16* %61, i64 %60
  store i16 0, i16* %62, align 2
  %63 = load i32* %j, align 4
  %64 = ashr i32 %63, 8
  %65 = load i32* %i, align 4
  %66 = sub nsw i32 %65, 1
  %67 = sext i32 %66 to i64
  %68 = load i8** %2, align 8
  %69 = getelementptr inbounds i8* %68, i64 %67
  %70 = load i8* %69, align 1
  %71 = zext i8 %70 to i16
  %72 = zext i16 %71 to i32
  %73 = shl i32 %72, 8
  %74 = or i32 %64, %73
  store i32 %74, i32* %j, align 4
  %75 = load i32* %j, align 4
  %76 = sext i32 %75 to i64
  %77 = load i32** %4, align 8
  %78 = getelementptr inbounds i32* %77, i64 %76
  %79 = load i32* %78, align 4
  %80 = add i32 %79, 1
  store i32 %80, i32* %78, align 4
  %81 = load i32* %i, align 4
  %82 = sub nsw i32 %81, 2
  %83 = sext i32 %82 to i64
  %84 = load i16** %3, align 8
  %85 = getelementptr inbounds i16* %84, i64 %83
  store i16 0, i16* %85, align 2
  %86 = load i32* %j, align 4
  %87 = ashr i32 %86, 8
  %88 = load i32* %i, align 4
  %89 = sub nsw i32 %88, 2
  %90 = sext i32 %89 to i64
  %91 = load i8** %2, align 8
  %92 = getelementptr inbounds i8* %91, i64 %90
  %93 = load i8* %92, align 1
  %94 = zext i8 %93 to i16
  %95 = zext i16 %94 to i32
  %96 = shl i32 %95, 8
  %97 = or i32 %87, %96
  store i32 %97, i32* %j, align 4
  %98 = load i32* %j, align 4
  %99 = sext i32 %98 to i64
  %100 = load i32** %4, align 8
  %101 = getelementptr inbounds i32* %100, i64 %99
  %102 = load i32* %101, align 4
  %103 = add i32 %102, 1
  store i32 %103, i32* %101, align 4
  %104 = load i32* %i, align 4
  %105 = sub nsw i32 %104, 3
  %106 = sext i32 %105 to i64
  %107 = load i16** %3, align 8
  %108 = getelementptr inbounds i16* %107, i64 %106
  store i16 0, i16* %108, align 2
  %109 = load i32* %j, align 4
  %110 = ashr i32 %109, 8
  %111 = load i32* %i, align 4
  %112 = sub nsw i32 %111, 3
  %113 = sext i32 %112 to i64
  %114 = load i8** %2, align 8
  %115 = getelementptr inbounds i8* %114, i64 %113
  %116 = load i8* %115, align 1
  %117 = zext i8 %116 to i16
  %118 = zext i16 %117 to i32
  %119 = shl i32 %118, 8
  %120 = or i32 %110, %119
  store i32 %120, i32* %j, align 4
  %121 = load i32* %j, align 4
  %122 = sext i32 %121 to i64
  %123 = load i32** %4, align 8
  %124 = getelementptr inbounds i32* %123, i64 %122
  %125 = load i32* %124, align 4
  %126 = add i32 %125, 1
  store i32 %126, i32* %124, align 4
  br label %127

; <label>:127                                     ; preds = %36
  %128 = load i32* %i, align 4
  %129 = sub nsw i32 %128, 4
  store i32 %129, i32* %i, align 4
  br label %33

; <label>:130                                     ; preds = %33
  br label %131

; <label>:131                                     ; preds = %156, %130
  %132 = load i32* %i, align 4
  %133 = icmp sge i32 %132, 0
  br i1 %133, label %134, label %159

; <label>:134                                     ; preds = %131
  %135 = load i32* %i, align 4
  %136 = sext i32 %135 to i64
  %137 = load i16** %3, align 8
  %138 = getelementptr inbounds i16* %137, i64 %136
  store i16 0, i16* %138, align 2
  %139 = load i32* %j, align 4
  %140 = ashr i32 %139, 8
  %141 = load i32* %i, align 4
  %142 = sext i32 %141 to i64
  %143 = load i8** %2, align 8
  %144 = getelementptr inbounds i8* %143, i64 %142
  %145 = load i8* %144, align 1
  %146 = zext i8 %145 to i16
  %147 = zext i16 %146 to i32
  %148 = shl i32 %147, 8
  %149 = or i32 %140, %148
  store i32 %149, i32* %j, align 4
  %150 = load i32* %j, align 4
  %151 = sext i32 %150 to i64
  %152 = load i32** %4, align 8
  %153 = getelementptr inbounds i32* %152, i64 %151
  %154 = load i32* %153, align 4
  %155 = add i32 %154, 1
  store i32 %155, i32* %153, align 4
  br label %156

; <label>:156                                     ; preds = %134
  %157 = load i32* %i, align 4
  %158 = add nsw i32 %157, -1
  store i32 %158, i32* %i, align 4
  br label %131

; <label>:159                                     ; preds = %131
  store i32 0, i32* %i, align 4
  br label %160

; <label>:160                                     ; preds = %181, %159
  %161 = load i32* %i, align 4
  %162 = icmp slt i32 %161, 34
  br i1 %162, label %163, label %184

; <label>:163                                     ; preds = %160
  %164 = load i32* %i, align 4
  %165 = sext i32 %164 to i64
  %166 = load i8** %2, align 8
  %167 = getelementptr inbounds i8* %166, i64 %165
  %168 = load i8* %167, align 1
  %169 = load i32* %5, align 4
  %170 = load i32* %i, align 4
  %171 = add nsw i32 %169, %170
  %172 = sext i32 %171 to i64
  %173 = load i8** %2, align 8
  %174 = getelementptr inbounds i8* %173, i64 %172
  store i8 %168, i8* %174, align 1
  %175 = load i32* %5, align 4
  %176 = load i32* %i, align 4
  %177 = add nsw i32 %175, %176
  %178 = sext i32 %177 to i64
  %179 = load i16** %3, align 8
  %180 = getelementptr inbounds i16* %179, i64 %178
  store i16 0, i16* %180, align 2
  br label %181

; <label>:181                                     ; preds = %163
  %182 = load i32* %i, align 4
  %183 = add nsw i32 %182, 1
  store i32 %183, i32* %i, align 4
  br label %160

; <label>:184                                     ; preds = %160
  %185 = load i32* %6, align 4
  %186 = icmp sge i32 %185, 4
  br i1 %186, label %187, label %190

; <label>:187                                     ; preds = %184
  %188 = load %struct._IO_FILE** @stderr, align 8
  %189 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %188, i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0))
  br label %190

; <label>:190                                     ; preds = %187, %184
  store i32 1, i32* %i, align 4
  br label %191

; <label>:191                                     ; preds = %207, %190
  %192 = load i32* %i, align 4
  %193 = icmp sle i32 %192, 65536
  br i1 %193, label %194, label %210

; <label>:194                                     ; preds = %191
  %195 = load i32* %i, align 4
  %196 = sub nsw i32 %195, 1
  %197 = sext i32 %196 to i64
  %198 = load i32** %4, align 8
  %199 = getelementptr inbounds i32* %198, i64 %197
  %200 = load i32* %199, align 4
  %201 = load i32* %i, align 4
  %202 = sext i32 %201 to i64
  %203 = load i32** %4, align 8
  %204 = getelementptr inbounds i32* %203, i64 %202
  %205 = load i32* %204, align 4
  %206 = add i32 %205, %200
  store i32 %206, i32* %204, align 4
  br label %207

; <label>:207                                     ; preds = %194
  %208 = load i32* %i, align 4
  %209 = add nsw i32 %208, 1
  store i32 %209, i32* %i, align 4
  br label %191

; <label>:210                                     ; preds = %191
  %211 = load i8** %2, align 8
  %212 = getelementptr inbounds i8* %211, i64 0
  %213 = load i8* %212, align 1
  %214 = zext i8 %213 to i32
  %215 = shl i32 %214, 8
  %216 = trunc i32 %215 to i16
  store i16 %216, i16* %s, align 2
  %217 = load i32* %5, align 4
  %218 = sub nsw i32 %217, 1
  store i32 %218, i32* %i, align 4
  br label %219

; <label>:219                                     ; preds = %341, %210
  %220 = load i32* %i, align 4
  %221 = icmp sge i32 %220, 3
  br i1 %221, label %222, label %344

; <label>:222                                     ; preds = %219
  %223 = load i16* %s, align 2
  %224 = zext i16 %223 to i32
  %225 = ashr i32 %224, 8
  %226 = load i32* %i, align 4
  %227 = sext i32 %226 to i64
  %228 = load i8** %2, align 8
  %229 = getelementptr inbounds i8* %228, i64 %227
  %230 = load i8* %229, align 1
  %231 = zext i8 %230 to i32
  %232 = shl i32 %231, 8
  %233 = or i32 %225, %232
  %234 = trunc i32 %233 to i16
  store i16 %234, i16* %s, align 2
  %235 = load i16* %s, align 2
  %236 = zext i16 %235 to i64
  %237 = load i32** %4, align 8
  %238 = getelementptr inbounds i32* %237, i64 %236
  %239 = load i32* %238, align 4
  %240 = sub i32 %239, 1
  store i32 %240, i32* %j, align 4
  %241 = load i32* %j, align 4
  %242 = load i16* %s, align 2
  %243 = zext i16 %242 to i64
  %244 = load i32** %4, align 8
  %245 = getelementptr inbounds i32* %244, i64 %243
  store i32 %241, i32* %245, align 4
  %246 = load i32* %i, align 4
  %247 = load i32* %j, align 4
  %248 = sext i32 %247 to i64
  %249 = load i32** %1, align 8
  %250 = getelementptr inbounds i32* %249, i64 %248
  store i32 %246, i32* %250, align 4
  %251 = load i16* %s, align 2
  %252 = zext i16 %251 to i32
  %253 = ashr i32 %252, 8
  %254 = load i32* %i, align 4
  %255 = sub nsw i32 %254, 1
  %256 = sext i32 %255 to i64
  %257 = load i8** %2, align 8
  %258 = getelementptr inbounds i8* %257, i64 %256
  %259 = load i8* %258, align 1
  %260 = zext i8 %259 to i32
  %261 = shl i32 %260, 8
  %262 = or i32 %253, %261
  %263 = trunc i32 %262 to i16
  store i16 %263, i16* %s, align 2
  %264 = load i16* %s, align 2
  %265 = zext i16 %264 to i64
  %266 = load i32** %4, align 8
  %267 = getelementptr inbounds i32* %266, i64 %265
  %268 = load i32* %267, align 4
  %269 = sub i32 %268, 1
  store i32 %269, i32* %j, align 4
  %270 = load i32* %j, align 4
  %271 = load i16* %s, align 2
  %272 = zext i16 %271 to i64
  %273 = load i32** %4, align 8
  %274 = getelementptr inbounds i32* %273, i64 %272
  store i32 %270, i32* %274, align 4
  %275 = load i32* %i, align 4
  %276 = sub nsw i32 %275, 1
  %277 = load i32* %j, align 4
  %278 = sext i32 %277 to i64
  %279 = load i32** %1, align 8
  %280 = getelementptr inbounds i32* %279, i64 %278
  store i32 %276, i32* %280, align 4
  %281 = load i16* %s, align 2
  %282 = zext i16 %281 to i32
  %283 = ashr i32 %282, 8
  %284 = load i32* %i, align 4
  %285 = sub nsw i32 %284, 2
  %286 = sext i32 %285 to i64
  %287 = load i8** %2, align 8
  %288 = getelementptr inbounds i8* %287, i64 %286
  %289 = load i8* %288, align 1
  %290 = zext i8 %289 to i32
  %291 = shl i32 %290, 8
  %292 = or i32 %283, %291
  %293 = trunc i32 %292 to i16
  store i16 %293, i16* %s, align 2
  %294 = load i16* %s, align 2
  %295 = zext i16 %294 to i64
  %296 = load i32** %4, align 8
  %297 = getelementptr inbounds i32* %296, i64 %295
  %298 = load i32* %297, align 4
  %299 = sub i32 %298, 1
  store i32 %299, i32* %j, align 4
  %300 = load i32* %j, align 4
  %301 = load i16* %s, align 2
  %302 = zext i16 %301 to i64
  %303 = load i32** %4, align 8
  %304 = getelementptr inbounds i32* %303, i64 %302
  store i32 %300, i32* %304, align 4
  %305 = load i32* %i, align 4
  %306 = sub nsw i32 %305, 2
  %307 = load i32* %j, align 4
  %308 = sext i32 %307 to i64
  %309 = load i32** %1, align 8
  %310 = getelementptr inbounds i32* %309, i64 %308
  store i32 %306, i32* %310, align 4
  %311 = load i16* %s, align 2
  %312 = zext i16 %311 to i32
  %313 = ashr i32 %312, 8
  %314 = load i32* %i, align 4
  %315 = sub nsw i32 %314, 3
  %316 = sext i32 %315 to i64
  %317 = load i8** %2, align 8
  %318 = getelementptr inbounds i8* %317, i64 %316
  %319 = load i8* %318, align 1
  %320 = zext i8 %319 to i32
  %321 = shl i32 %320, 8
  %322 = or i32 %313, %321
  %323 = trunc i32 %322 to i16
  store i16 %323, i16* %s, align 2
  %324 = load i16* %s, align 2
  %325 = zext i16 %324 to i64
  %326 = load i32** %4, align 8
  %327 = getelementptr inbounds i32* %326, i64 %325
  %328 = load i32* %327, align 4
  %329 = sub i32 %328, 1
  store i32 %329, i32* %j, align 4
  %330 = load i32* %j, align 4
  %331 = load i16* %s, align 2
  %332 = zext i16 %331 to i64
  %333 = load i32** %4, align 8
  %334 = getelementptr inbounds i32* %333, i64 %332
  store i32 %330, i32* %334, align 4
  %335 = load i32* %i, align 4
  %336 = sub nsw i32 %335, 3
  %337 = load i32* %j, align 4
  %338 = sext i32 %337 to i64
  %339 = load i32** %1, align 8
  %340 = getelementptr inbounds i32* %339, i64 %338
  store i32 %336, i32* %340, align 4
  br label %341

; <label>:341                                     ; preds = %222
  %342 = load i32* %i, align 4
  %343 = sub nsw i32 %342, 4
  store i32 %343, i32* %i, align 4
  br label %219

; <label>:344                                     ; preds = %219
  br label %345

; <label>:345                                     ; preds = %377, %344
  %346 = load i32* %i, align 4
  %347 = icmp sge i32 %346, 0
  br i1 %347, label %348, label %380

; <label>:348                                     ; preds = %345
  %349 = load i16* %s, align 2
  %350 = zext i16 %349 to i32
  %351 = ashr i32 %350, 8
  %352 = load i32* %i, align 4
  %353 = sext i32 %352 to i64
  %354 = load i8** %2, align 8
  %355 = getelementptr inbounds i8* %354, i64 %353
  %356 = load i8* %355, align 1
  %357 = zext i8 %356 to i32
  %358 = shl i32 %357, 8
  %359 = or i32 %351, %358
  %360 = trunc i32 %359 to i16
  store i16 %360, i16* %s, align 2
  %361 = load i16* %s, align 2
  %362 = zext i16 %361 to i64
  %363 = load i32** %4, align 8
  %364 = getelementptr inbounds i32* %363, i64 %362
  %365 = load i32* %364, align 4
  %366 = sub i32 %365, 1
  store i32 %366, i32* %j, align 4
  %367 = load i32* %j, align 4
  %368 = load i16* %s, align 2
  %369 = zext i16 %368 to i64
  %370 = load i32** %4, align 8
  %371 = getelementptr inbounds i32* %370, i64 %369
  store i32 %367, i32* %371, align 4
  %372 = load i32* %i, align 4
  %373 = load i32* %j, align 4
  %374 = sext i32 %373 to i64
  %375 = load i32** %1, align 8
  %376 = getelementptr inbounds i32* %375, i64 %374
  store i32 %372, i32* %376, align 4
  br label %377

; <label>:377                                     ; preds = %348
  %378 = load i32* %i, align 4
  %379 = add nsw i32 %378, -1
  store i32 %379, i32* %i, align 4
  br label %345

; <label>:380                                     ; preds = %345
  store i32 0, i32* %i, align 4
  br label %381

; <label>:381                                     ; preds = %392, %380
  %382 = load i32* %i, align 4
  %383 = icmp sle i32 %382, 255
  br i1 %383, label %384, label %395

; <label>:384                                     ; preds = %381
  %385 = load i32* %i, align 4
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds [256 x i8]* %bigDone, i32 0, i64 %386
  store i8 0, i8* %387, align 1
  %388 = load i32* %i, align 4
  %389 = load i32* %i, align 4
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %390
  store i32 %388, i32* %391, align 4
  br label %392

; <label>:392                                     ; preds = %384
  %393 = load i32* %i, align 4
  %394 = add nsw i32 %393, 1
  store i32 %394, i32* %i, align 4
  br label %381

; <label>:395                                     ; preds = %381
  store i32 1, i32* %h, align 4
  br label %396

; <label>:396                                     ; preds = %400, %395
  %397 = load i32* %h, align 4
  %398 = mul nsw i32 3, %397
  %399 = add nsw i32 %398, 1
  store i32 %399, i32* %h, align 4
  br label %400

; <label>:400                                     ; preds = %396
  %401 = load i32* %h, align 4
  %402 = icmp sle i32 %401, 256
  br i1 %402, label %396, label %403

; <label>:403                                     ; preds = %400
  br label %404

; <label>:404                                     ; preds = %486, %403
  %405 = load i32* %h, align 4
  %406 = sdiv i32 %405, 3
  store i32 %406, i32* %h, align 4
  %407 = load i32* %h, align 4
  store i32 %407, i32* %i, align 4
  br label %408

; <label>:408                                     ; preds = %482, %404
  %409 = load i32* %i, align 4
  %410 = icmp sle i32 %409, 255
  br i1 %410, label %411, label %485

; <label>:411                                     ; preds = %408
  %412 = load i32* %i, align 4
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %413
  %415 = load i32* %414, align 4
  store i32 %415, i32* %vv, align 4
  %416 = load i32* %i, align 4
  store i32 %416, i32* %j, align 4
  br label %417

; <label>:417                                     ; preds = %475, %411
  %418 = load i32* %j, align 4
  %419 = load i32* %h, align 4
  %420 = sub nsw i32 %418, %419
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %421
  %423 = load i32* %422, align 4
  %424 = add nsw i32 %423, 1
  %425 = shl i32 %424, 8
  %426 = sext i32 %425 to i64
  %427 = load i32** %4, align 8
  %428 = getelementptr inbounds i32* %427, i64 %426
  %429 = load i32* %428, align 4
  %430 = load i32* %j, align 4
  %431 = load i32* %h, align 4
  %432 = sub nsw i32 %430, %431
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %433
  %435 = load i32* %434, align 4
  %436 = shl i32 %435, 8
  %437 = sext i32 %436 to i64
  %438 = load i32** %4, align 8
  %439 = getelementptr inbounds i32* %438, i64 %437
  %440 = load i32* %439, align 4
  %441 = sub i32 %429, %440
  %442 = load i32* %vv, align 4
  %443 = add nsw i32 %442, 1
  %444 = shl i32 %443, 8
  %445 = sext i32 %444 to i64
  %446 = load i32** %4, align 8
  %447 = getelementptr inbounds i32* %446, i64 %445
  %448 = load i32* %447, align 4
  %449 = load i32* %vv, align 4
  %450 = shl i32 %449, 8
  %451 = sext i32 %450 to i64
  %452 = load i32** %4, align 8
  %453 = getelementptr inbounds i32* %452, i64 %451
  %454 = load i32* %453, align 4
  %455 = sub i32 %448, %454
  %456 = icmp ugt i32 %441, %455
  br i1 %456, label %457, label %476

; <label>:457                                     ; preds = %417
  %458 = load i32* %j, align 4
  %459 = load i32* %h, align 4
  %460 = sub nsw i32 %458, %459
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %461
  %463 = load i32* %462, align 4
  %464 = load i32* %j, align 4
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %465
  store i32 %463, i32* %466, align 4
  %467 = load i32* %j, align 4
  %468 = load i32* %h, align 4
  %469 = sub nsw i32 %467, %468
  store i32 %469, i32* %j, align 4
  %470 = load i32* %j, align 4
  %471 = load i32* %h, align 4
  %472 = sub nsw i32 %471, 1
  %473 = icmp sle i32 %470, %472
  br i1 %473, label %474, label %475

; <label>:474                                     ; preds = %457
  br label %477

; <label>:475                                     ; preds = %457
  br label %417

; <label>:476                                     ; preds = %417
  br label %477

; <label>:477                                     ; preds = %476, %474
  %478 = load i32* %vv, align 4
  %479 = load i32* %j, align 4
  %480 = sext i32 %479 to i64
  %481 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %480
  store i32 %478, i32* %481, align 4
  br label %482

; <label>:482                                     ; preds = %477
  %483 = load i32* %i, align 4
  %484 = add nsw i32 %483, 1
  store i32 %484, i32* %i, align 4
  br label %408

; <label>:485                                     ; preds = %408
  br label %486

; <label>:486                                     ; preds = %485
  %487 = load i32* %h, align 4
  %488 = icmp ne i32 %487, 1
  br i1 %488, label %404, label %489

; <label>:489                                     ; preds = %486
  store i32 0, i32* %numQSorted, align 4
  store i32 0, i32* %i, align 4
  br label %490

; <label>:490                                     ; preds = %849, %489
  %491 = load i32* %i, align 4
  %492 = icmp sle i32 %491, 255
  br i1 %492, label %493, label %852

; <label>:493                                     ; preds = %490
  %494 = load i32* %i, align 4
  %495 = sext i32 %494 to i64
  %496 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %495
  %497 = load i32* %496, align 4
  store i32 %497, i32* %ss, align 4
  store i32 0, i32* %j, align 4
  br label %498

; <label>:498                                     ; preds = %576, %493
  %499 = load i32* %j, align 4
  %500 = icmp sle i32 %499, 255
  br i1 %500, label %501, label %579

; <label>:501                                     ; preds = %498
  %502 = load i32* %j, align 4
  %503 = load i32* %ss, align 4
  %504 = icmp ne i32 %502, %503
  br i1 %504, label %505, label %575

; <label>:505                                     ; preds = %501
  %506 = load i32* %ss, align 4
  %507 = shl i32 %506, 8
  %508 = load i32* %j, align 4
  %509 = add nsw i32 %507, %508
  store i32 %509, i32* %sb, align 4
  %510 = load i32* %sb, align 4
  %511 = sext i32 %510 to i64
  %512 = load i32** %4, align 8
  %513 = getelementptr inbounds i32* %512, i64 %511
  %514 = load i32* %513, align 4
  %515 = and i32 %514, 2097152
  %516 = icmp ne i32 %515, 0
  br i1 %516, label %568, label %517

; <label>:517                                     ; preds = %505
  %518 = load i32* %sb, align 4
  %519 = sext i32 %518 to i64
  %520 = load i32** %4, align 8
  %521 = getelementptr inbounds i32* %520, i64 %519
  %522 = load i32* %521, align 4
  %523 = and i32 %522, -2097153
  store i32 %523, i32* %lo, align 4
  %524 = load i32* %sb, align 4
  %525 = add nsw i32 %524, 1
  %526 = sext i32 %525 to i64
  %527 = load i32** %4, align 8
  %528 = getelementptr inbounds i32* %527, i64 %526
  %529 = load i32* %528, align 4
  %530 = and i32 %529, -2097153
  %531 = sub i32 %530, 1
  store i32 %531, i32* %hi, align 4
  %532 = load i32* %hi, align 4
  %533 = load i32* %lo, align 4
  %534 = icmp sgt i32 %532, %533
  br i1 %534, label %535, label %567

; <label>:535                                     ; preds = %517
  %536 = load i32* %6, align 4
  %537 = icmp sge i32 %536, 4
  br i1 %537, label %538, label %548

; <label>:538                                     ; preds = %535
  %539 = load %struct._IO_FILE** @stderr, align 8
  %540 = load i32* %ss, align 4
  %541 = load i32* %j, align 4
  %542 = load i32* %numQSorted, align 4
  %543 = load i32* %hi, align 4
  %544 = load i32* %lo, align 4
  %545 = sub nsw i32 %543, %544
  %546 = add nsw i32 %545, 1
  %547 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %539, i8* getelementptr inbounds ([48 x i8]* @.str4, i32 0, i32 0), i32 %540, i32 %541, i32 %542, i32 %546)
  br label %548

; <label>:548                                     ; preds = %538, %535
  %549 = load i32** %1, align 8
  %550 = load i8** %2, align 8
  %551 = load i16** %3, align 8
  %552 = load i32* %5, align 4
  %553 = load i32* %lo, align 4
  %554 = load i32* %hi, align 4
  %555 = load i32** %7, align 8
  call void @mainQSort3(i32* %549, i8* %550, i16* %551, i32 %552, i32 %553, i32 %554, i32 2, i32* %555)
  %556 = load i32* %hi, align 4
  %557 = load i32* %lo, align 4
  %558 = sub nsw i32 %556, %557
  %559 = add nsw i32 %558, 1
  %560 = load i32* %numQSorted, align 4
  %561 = add nsw i32 %560, %559
  store i32 %561, i32* %numQSorted, align 4
  %562 = load i32** %7, align 8
  %563 = load i32* %562, align 4
  %564 = icmp slt i32 %563, 0
  br i1 %564, label %565, label %566

; <label>:565                                     ; preds = %548
  br label %863

; <label>:566                                     ; preds = %548
  br label %567

; <label>:567                                     ; preds = %566, %517
  br label %568

; <label>:568                                     ; preds = %567, %505
  %569 = load i32* %sb, align 4
  %570 = sext i32 %569 to i64
  %571 = load i32** %4, align 8
  %572 = getelementptr inbounds i32* %571, i64 %570
  %573 = load i32* %572, align 4
  %574 = or i32 %573, 2097152
  store i32 %574, i32* %572, align 4
  br label %575

; <label>:575                                     ; preds = %568, %501
  br label %576

; <label>:576                                     ; preds = %575
  %577 = load i32* %j, align 4
  %578 = add nsw i32 %577, 1
  store i32 %578, i32* %j, align 4
  br label %498

; <label>:579                                     ; preds = %498
  %580 = load i32* %ss, align 4
  %581 = sext i32 %580 to i64
  %582 = getelementptr inbounds [256 x i8]* %bigDone, i32 0, i64 %581
  %583 = load i8* %582, align 1
  %584 = icmp ne i8 %583, 0
  br i1 %584, label %585, label %586

; <label>:585                                     ; preds = %579
  call void @BZ2_bz__AssertH__fail(i32 1006)
  br label %586

; <label>:586                                     ; preds = %585, %579
  store i32 0, i32* %j, align 4
  br label %587

; <label>:587                                     ; preds = %617, %586
  %588 = load i32* %j, align 4
  %589 = icmp sle i32 %588, 255
  br i1 %589, label %590, label %620

; <label>:590                                     ; preds = %587
  %591 = load i32* %j, align 4
  %592 = shl i32 %591, 8
  %593 = load i32* %ss, align 4
  %594 = add nsw i32 %592, %593
  %595 = sext i32 %594 to i64
  %596 = load i32** %4, align 8
  %597 = getelementptr inbounds i32* %596, i64 %595
  %598 = load i32* %597, align 4
  %599 = and i32 %598, -2097153
  %600 = load i32* %j, align 4
  %601 = sext i32 %600 to i64
  %602 = getelementptr inbounds [256 x i32]* %copyStart, i32 0, i64 %601
  store i32 %599, i32* %602, align 4
  %603 = load i32* %j, align 4
  %604 = shl i32 %603, 8
  %605 = load i32* %ss, align 4
  %606 = add nsw i32 %604, %605
  %607 = add nsw i32 %606, 1
  %608 = sext i32 %607 to i64
  %609 = load i32** %4, align 8
  %610 = getelementptr inbounds i32* %609, i64 %608
  %611 = load i32* %610, align 4
  %612 = and i32 %611, -2097153
  %613 = sub i32 %612, 1
  %614 = load i32* %j, align 4
  %615 = sext i32 %614 to i64
  %616 = getelementptr inbounds [256 x i32]* %copyEnd, i32 0, i64 %615
  store i32 %613, i32* %616, align 4
  br label %617

; <label>:617                                     ; preds = %590
  %618 = load i32* %j, align 4
  %619 = add nsw i32 %618, 1
  store i32 %619, i32* %j, align 4
  br label %587

; <label>:620                                     ; preds = %587
  %621 = load i32* %ss, align 4
  %622 = shl i32 %621, 8
  %623 = sext i32 %622 to i64
  %624 = load i32** %4, align 8
  %625 = getelementptr inbounds i32* %624, i64 %623
  %626 = load i32* %625, align 4
  %627 = and i32 %626, -2097153
  store i32 %627, i32* %j, align 4
  br label %628

; <label>:628                                     ; preds = %670, %620
  %629 = load i32* %j, align 4
  %630 = load i32* %ss, align 4
  %631 = sext i32 %630 to i64
  %632 = getelementptr inbounds [256 x i32]* %copyStart, i32 0, i64 %631
  %633 = load i32* %632, align 4
  %634 = icmp slt i32 %629, %633
  br i1 %634, label %635, label %673

; <label>:635                                     ; preds = %628
  %636 = load i32* %j, align 4
  %637 = sext i32 %636 to i64
  %638 = load i32** %1, align 8
  %639 = getelementptr inbounds i32* %638, i64 %637
  %640 = load i32* %639, align 4
  %641 = sub i32 %640, 1
  store i32 %641, i32* %k, align 4
  %642 = load i32* %k, align 4
  %643 = icmp slt i32 %642, 0
  br i1 %643, label %644, label %648

; <label>:644                                     ; preds = %635
  %645 = load i32* %5, align 4
  %646 = load i32* %k, align 4
  %647 = add nsw i32 %646, %645
  store i32 %647, i32* %k, align 4
  br label %648

; <label>:648                                     ; preds = %644, %635
  %649 = load i32* %k, align 4
  %650 = sext i32 %649 to i64
  %651 = load i8** %2, align 8
  %652 = getelementptr inbounds i8* %651, i64 %650
  %653 = load i8* %652, align 1
  store i8 %653, i8* %c1, align 1
  %654 = load i8* %c1, align 1
  %655 = zext i8 %654 to i64
  %656 = getelementptr inbounds [256 x i8]* %bigDone, i32 0, i64 %655
  %657 = load i8* %656, align 1
  %658 = icmp ne i8 %657, 0
  br i1 %658, label %669, label %659

; <label>:659                                     ; preds = %648
  %660 = load i32* %k, align 4
  %661 = load i8* %c1, align 1
  %662 = zext i8 %661 to i64
  %663 = getelementptr inbounds [256 x i32]* %copyStart, i32 0, i64 %662
  %664 = load i32* %663, align 4
  %665 = add nsw i32 %664, 1
  store i32 %665, i32* %663, align 4
  %666 = sext i32 %664 to i64
  %667 = load i32** %1, align 8
  %668 = getelementptr inbounds i32* %667, i64 %666
  store i32 %660, i32* %668, align 4
  br label %669

; <label>:669                                     ; preds = %659, %648
  br label %670

; <label>:670                                     ; preds = %669
  %671 = load i32* %j, align 4
  %672 = add nsw i32 %671, 1
  store i32 %672, i32* %j, align 4
  br label %628

; <label>:673                                     ; preds = %628
  %674 = load i32* %ss, align 4
  %675 = add nsw i32 %674, 1
  %676 = shl i32 %675, 8
  %677 = sext i32 %676 to i64
  %678 = load i32** %4, align 8
  %679 = getelementptr inbounds i32* %678, i64 %677
  %680 = load i32* %679, align 4
  %681 = and i32 %680, -2097153
  %682 = sub i32 %681, 1
  store i32 %682, i32* %j, align 4
  br label %683

; <label>:683                                     ; preds = %725, %673
  %684 = load i32* %j, align 4
  %685 = load i32* %ss, align 4
  %686 = sext i32 %685 to i64
  %687 = getelementptr inbounds [256 x i32]* %copyEnd, i32 0, i64 %686
  %688 = load i32* %687, align 4
  %689 = icmp sgt i32 %684, %688
  br i1 %689, label %690, label %728

; <label>:690                                     ; preds = %683
  %691 = load i32* %j, align 4
  %692 = sext i32 %691 to i64
  %693 = load i32** %1, align 8
  %694 = getelementptr inbounds i32* %693, i64 %692
  %695 = load i32* %694, align 4
  %696 = sub i32 %695, 1
  store i32 %696, i32* %k, align 4
  %697 = load i32* %k, align 4
  %698 = icmp slt i32 %697, 0
  br i1 %698, label %699, label %703

; <label>:699                                     ; preds = %690
  %700 = load i32* %5, align 4
  %701 = load i32* %k, align 4
  %702 = add nsw i32 %701, %700
  store i32 %702, i32* %k, align 4
  br label %703

; <label>:703                                     ; preds = %699, %690
  %704 = load i32* %k, align 4
  %705 = sext i32 %704 to i64
  %706 = load i8** %2, align 8
  %707 = getelementptr inbounds i8* %706, i64 %705
  %708 = load i8* %707, align 1
  store i8 %708, i8* %c1, align 1
  %709 = load i8* %c1, align 1
  %710 = zext i8 %709 to i64
  %711 = getelementptr inbounds [256 x i8]* %bigDone, i32 0, i64 %710
  %712 = load i8* %711, align 1
  %713 = icmp ne i8 %712, 0
  br i1 %713, label %724, label %714

; <label>:714                                     ; preds = %703
  %715 = load i32* %k, align 4
  %716 = load i8* %c1, align 1
  %717 = zext i8 %716 to i64
  %718 = getelementptr inbounds [256 x i32]* %copyEnd, i32 0, i64 %717
  %719 = load i32* %718, align 4
  %720 = add nsw i32 %719, -1
  store i32 %720, i32* %718, align 4
  %721 = sext i32 %719 to i64
  %722 = load i32** %1, align 8
  %723 = getelementptr inbounds i32* %722, i64 %721
  store i32 %715, i32* %723, align 4
  br label %724

; <label>:724                                     ; preds = %714, %703
  br label %725

; <label>:725                                     ; preds = %724
  %726 = load i32* %j, align 4
  %727 = add nsw i32 %726, -1
  store i32 %727, i32* %j, align 4
  br label %683

; <label>:728                                     ; preds = %683
  %729 = load i32* %ss, align 4
  %730 = sext i32 %729 to i64
  %731 = getelementptr inbounds [256 x i32]* %copyStart, i32 0, i64 %730
  %732 = load i32* %731, align 4
  %733 = sub nsw i32 %732, 1
  %734 = load i32* %ss, align 4
  %735 = sext i32 %734 to i64
  %736 = getelementptr inbounds [256 x i32]* %copyEnd, i32 0, i64 %735
  %737 = load i32* %736, align 4
  %738 = icmp eq i32 %733, %737
  br i1 %738, label %754, label %739

; <label>:739                                     ; preds = %728
  %740 = load i32* %ss, align 4
  %741 = sext i32 %740 to i64
  %742 = getelementptr inbounds [256 x i32]* %copyStart, i32 0, i64 %741
  %743 = load i32* %742, align 4
  %744 = icmp eq i32 %743, 0
  br i1 %744, label %745, label %753

; <label>:745                                     ; preds = %739
  %746 = load i32* %ss, align 4
  %747 = sext i32 %746 to i64
  %748 = getelementptr inbounds [256 x i32]* %copyEnd, i32 0, i64 %747
  %749 = load i32* %748, align 4
  %750 = load i32* %5, align 4
  %751 = sub nsw i32 %750, 1
  %752 = icmp eq i32 %749, %751
  br i1 %752, label %754, label %753

; <label>:753                                     ; preds = %745, %739
  call void @BZ2_bz__AssertH__fail(i32 1007)
  br label %754

; <label>:754                                     ; preds = %753, %745, %728
  store i32 0, i32* %j, align 4
  br label %755

; <label>:755                                     ; preds = %768, %754
  %756 = load i32* %j, align 4
  %757 = icmp sle i32 %756, 255
  br i1 %757, label %758, label %771

; <label>:758                                     ; preds = %755
  %759 = load i32* %j, align 4
  %760 = shl i32 %759, 8
  %761 = load i32* %ss, align 4
  %762 = add nsw i32 %760, %761
  %763 = sext i32 %762 to i64
  %764 = load i32** %4, align 8
  %765 = getelementptr inbounds i32* %764, i64 %763
  %766 = load i32* %765, align 4
  %767 = or i32 %766, 2097152
  store i32 %767, i32* %765, align 4
  br label %768

; <label>:768                                     ; preds = %758
  %769 = load i32* %j, align 4
  %770 = add nsw i32 %769, 1
  store i32 %770, i32* %j, align 4
  br label %755

; <label>:771                                     ; preds = %755
  %772 = load i32* %ss, align 4
  %773 = sext i32 %772 to i64
  %774 = getelementptr inbounds [256 x i8]* %bigDone, i32 0, i64 %773
  store i8 1, i8* %774, align 1
  %775 = load i32* %i, align 4
  %776 = icmp slt i32 %775, 255
  br i1 %776, label %777, label %848

; <label>:777                                     ; preds = %771
  %778 = load i32* %ss, align 4
  %779 = shl i32 %778, 8
  %780 = sext i32 %779 to i64
  %781 = load i32** %4, align 8
  %782 = getelementptr inbounds i32* %781, i64 %780
  %783 = load i32* %782, align 4
  %784 = and i32 %783, -2097153
  store i32 %784, i32* %bbStart, align 4
  %785 = load i32* %ss, align 4
  %786 = add nsw i32 %785, 1
  %787 = shl i32 %786, 8
  %788 = sext i32 %787 to i64
  %789 = load i32** %4, align 8
  %790 = getelementptr inbounds i32* %789, i64 %788
  %791 = load i32* %790, align 4
  %792 = and i32 %791, -2097153
  %793 = load i32* %bbStart, align 4
  %794 = sub i32 %792, %793
  store i32 %794, i32* %bbSize, align 4
  store i32 0, i32* %shifts, align 4
  br label %795

; <label>:795                                     ; preds = %800, %777
  %796 = load i32* %bbSize, align 4
  %797 = load i32* %shifts, align 4
  %798 = ashr i32 %796, %797
  %799 = icmp sgt i32 %798, 65534
  br i1 %799, label %800, label %803

; <label>:800                                     ; preds = %795
  %801 = load i32* %shifts, align 4
  %802 = add nsw i32 %801, 1
  store i32 %802, i32* %shifts, align 4
  br label %795

; <label>:803                                     ; preds = %795
  %804 = load i32* %bbSize, align 4
  %805 = sub nsw i32 %804, 1
  store i32 %805, i32* %j, align 4
  br label %806

; <label>:806                                     ; preds = %837, %803
  %807 = load i32* %j, align 4
  %808 = icmp sge i32 %807, 0
  br i1 %808, label %809, label %840

; <label>:809                                     ; preds = %806
  %810 = load i32* %bbStart, align 4
  %811 = load i32* %j, align 4
  %812 = add nsw i32 %810, %811
  %813 = sext i32 %812 to i64
  %814 = load i32** %1, align 8
  %815 = getelementptr inbounds i32* %814, i64 %813
  %816 = load i32* %815, align 4
  store i32 %816, i32* %a2update, align 4
  %817 = load i32* %j, align 4
  %818 = load i32* %shifts, align 4
  %819 = ashr i32 %817, %818
  %820 = trunc i32 %819 to i16
  store i16 %820, i16* %qVal, align 2
  %821 = load i16* %qVal, align 2
  %822 = load i32* %a2update, align 4
  %823 = sext i32 %822 to i64
  %824 = load i16** %3, align 8
  %825 = getelementptr inbounds i16* %824, i64 %823
  store i16 %821, i16* %825, align 2
  %826 = load i32* %a2update, align 4
  %827 = icmp slt i32 %826, 34
  br i1 %827, label %828, label %836

; <label>:828                                     ; preds = %809
  %829 = load i16* %qVal, align 2
  %830 = load i32* %a2update, align 4
  %831 = load i32* %5, align 4
  %832 = add nsw i32 %830, %831
  %833 = sext i32 %832 to i64
  %834 = load i16** %3, align 8
  %835 = getelementptr inbounds i16* %834, i64 %833
  store i16 %829, i16* %835, align 2
  br label %836

; <label>:836                                     ; preds = %828, %809
  br label %837

; <label>:837                                     ; preds = %836
  %838 = load i32* %j, align 4
  %839 = add nsw i32 %838, -1
  store i32 %839, i32* %j, align 4
  br label %806

; <label>:840                                     ; preds = %806
  %841 = load i32* %bbSize, align 4
  %842 = sub nsw i32 %841, 1
  %843 = load i32* %shifts, align 4
  %844 = ashr i32 %842, %843
  %845 = icmp sle i32 %844, 65535
  br i1 %845, label %847, label %846

; <label>:846                                     ; preds = %840
  call void @BZ2_bz__AssertH__fail(i32 1002)
  br label %847

; <label>:847                                     ; preds = %846, %840
  br label %848

; <label>:848                                     ; preds = %847, %771
  br label %849

; <label>:849                                     ; preds = %848
  %850 = load i32* %i, align 4
  %851 = add nsw i32 %850, 1
  store i32 %851, i32* %i, align 4
  br label %490

; <label>:852                                     ; preds = %490
  %853 = load i32* %6, align 4
  %854 = icmp sge i32 %853, 4
  br i1 %854, label %855, label %863

; <label>:855                                     ; preds = %852
  %856 = load %struct._IO_FILE** @stderr, align 8
  %857 = load i32* %5, align 4
  %858 = load i32* %numQSorted, align 4
  %859 = load i32* %5, align 4
  %860 = load i32* %numQSorted, align 4
  %861 = sub nsw i32 %859, %860
  %862 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %856, i8* getelementptr inbounds ([44 x i8]* @.str5, i32 0, i32 0), i32 %857, i32 %858, i32 %861)
  br label %863

; <label>:863                                     ; preds = %565, %855, %852
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare void @BZ2_bz__AssertH__fail(i32) #1

; Function Attrs: nounwind uwtable
define internal void @mainQSort3(i32* %ptr, i8* %block, i16* %quadrant, i32 %nblock, i32 %loSt, i32 %hiSt, i32 %dSt, i32* %budget) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i16*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %unLo = alloca i32, align 4
  %unHi = alloca i32, align 4
  %ltLo = alloca i32, align 4
  %gtHi = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %med = alloca i32, align 4
  %sp = alloca i32, align 4
  %lo = alloca i32, align 4
  %hi = alloca i32, align 4
  %d = alloca i32, align 4
  %stackLo = alloca [100 x i32], align 16
  %stackHi = alloca [100 x i32], align 16
  %stackD = alloca [100 x i32], align 16
  %nextLo = alloca [3 x i32], align 4
  %nextHi = alloca [3 x i32], align 4
  %nextD = alloca [3 x i32], align 4
  %zztmp = alloca i32, align 4
  %zztmp1 = alloca i32, align 4
  %zztmp2 = alloca i32, align 4
  %yyp1 = alloca i32, align 4
  %yyp2 = alloca i32, align 4
  %yyn = alloca i32, align 4
  %zztmp3 = alloca i32, align 4
  %yyp14 = alloca i32, align 4
  %yyp25 = alloca i32, align 4
  %yyn6 = alloca i32, align 4
  %zztmp7 = alloca i32, align 4
  %tz = alloca i32, align 4
  %tz8 = alloca i32, align 4
  %tz9 = alloca i32, align 4
  store i32* %ptr, i32** %1, align 8
  store i8* %block, i8** %2, align 8
  store i16* %quadrant, i16** %3, align 8
  store i32 %nblock, i32* %4, align 4
  store i32 %loSt, i32* %5, align 4
  store i32 %hiSt, i32* %6, align 4
  store i32 %dSt, i32* %7, align 4
  store i32* %budget, i32** %8, align 8
  store i32 0, i32* %sp, align 4
  %9 = load i32* %5, align 4
  %10 = load i32* %sp, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %11
  store i32 %9, i32* %12, align 4
  %13 = load i32* %6, align 4
  %14 = load i32* %sp, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %15
  store i32 %13, i32* %16, align 4
  %17 = load i32* %7, align 4
  %18 = load i32* %sp, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [100 x i32]* %stackD, i32 0, i64 %19
  store i32 %17, i32* %20, align 4
  %21 = load i32* %sp, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %sp, align 4
  br label %23

; <label>:23                                      ; preds = %504, %248, %65, %0
  %24 = load i32* %sp, align 4
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %26, label %556

; <label>:26                                      ; preds = %23
  %27 = load i32* %sp, align 4
  %28 = icmp slt i32 %27, 100
  br i1 %28, label %30, label %29

; <label>:29                                      ; preds = %26
  call void @BZ2_bz__AssertH__fail(i32 1001)
  br label %30

; <label>:30                                      ; preds = %29, %26
  %31 = load i32* %sp, align 4
  %32 = add nsw i32 %31, -1
  store i32 %32, i32* %sp, align 4
  %33 = load i32* %sp, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %34
  %36 = load i32* %35, align 4
  store i32 %36, i32* %lo, align 4
  %37 = load i32* %sp, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %38
  %40 = load i32* %39, align 4
  store i32 %40, i32* %hi, align 4
  %41 = load i32* %sp, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [100 x i32]* %stackD, i32 0, i64 %42
  %44 = load i32* %43, align 4
  store i32 %44, i32* %d, align 4
  %45 = load i32* %hi, align 4
  %46 = load i32* %lo, align 4
  %47 = sub nsw i32 %45, %46
  %48 = icmp slt i32 %47, 20
  br i1 %48, label %52, label %49

; <label>:49                                      ; preds = %30
  %50 = load i32* %d, align 4
  %51 = icmp sgt i32 %50, 14
  br i1 %51, label %52, label %66

; <label>:52                                      ; preds = %49, %30
  %53 = load i32** %1, align 8
  %54 = load i8** %2, align 8
  %55 = load i16** %3, align 8
  %56 = load i32* %4, align 4
  %57 = load i32* %lo, align 4
  %58 = load i32* %hi, align 4
  %59 = load i32* %d, align 4
  %60 = load i32** %8, align 8
  call void @mainSimpleSort(i32* %53, i8* %54, i16* %55, i32 %56, i32 %57, i32 %58, i32 %59, i32* %60)
  %61 = load i32** %8, align 8
  %62 = load i32* %61, align 4
  %63 = icmp slt i32 %62, 0
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %52
  br label %556

; <label>:65                                      ; preds = %52
  br label %23

; <label>:66                                      ; preds = %49
  %67 = load i32* %lo, align 4
  %68 = sext i32 %67 to i64
  %69 = load i32** %1, align 8
  %70 = getelementptr inbounds i32* %69, i64 %68
  %71 = load i32* %70, align 4
  %72 = load i32* %d, align 4
  %73 = add i32 %71, %72
  %74 = zext i32 %73 to i64
  %75 = load i8** %2, align 8
  %76 = getelementptr inbounds i8* %75, i64 %74
  %77 = load i8* %76, align 1
  %78 = load i32* %hi, align 4
  %79 = sext i32 %78 to i64
  %80 = load i32** %1, align 8
  %81 = getelementptr inbounds i32* %80, i64 %79
  %82 = load i32* %81, align 4
  %83 = load i32* %d, align 4
  %84 = add i32 %82, %83
  %85 = zext i32 %84 to i64
  %86 = load i8** %2, align 8
  %87 = getelementptr inbounds i8* %86, i64 %85
  %88 = load i8* %87, align 1
  %89 = load i32* %lo, align 4
  %90 = load i32* %hi, align 4
  %91 = add nsw i32 %89, %90
  %92 = ashr i32 %91, 1
  %93 = sext i32 %92 to i64
  %94 = load i32** %1, align 8
  %95 = getelementptr inbounds i32* %94, i64 %93
  %96 = load i32* %95, align 4
  %97 = load i32* %d, align 4
  %98 = add i32 %96, %97
  %99 = zext i32 %98 to i64
  %100 = load i8** %2, align 8
  %101 = getelementptr inbounds i8* %100, i64 %99
  %102 = load i8* %101, align 1
  %103 = call zeroext i8 @mmed3(i8 zeroext %77, i8 zeroext %88, i8 zeroext %102)
  %104 = zext i8 %103 to i32
  store i32 %104, i32* %med, align 4
  %105 = load i32* %lo, align 4
  store i32 %105, i32* %ltLo, align 4
  store i32 %105, i32* %unLo, align 4
  %106 = load i32* %hi, align 4
  store i32 %106, i32* %gtHi, align 4
  store i32 %106, i32* %unHi, align 4
  br label %107

; <label>:107                                     ; preds = %66, %220
  br label %108

; <label>:108                                     ; preds = %107, %130, %158
  %109 = load i32* %unLo, align 4
  %110 = load i32* %unHi, align 4
  %111 = icmp sgt i32 %109, %110
  br i1 %111, label %112, label %113

; <label>:112                                     ; preds = %108
  br label %161

; <label>:113                                     ; preds = %108
  %114 = load i32* %unLo, align 4
  %115 = sext i32 %114 to i64
  %116 = load i32** %1, align 8
  %117 = getelementptr inbounds i32* %116, i64 %115
  %118 = load i32* %117, align 4
  %119 = load i32* %d, align 4
  %120 = add i32 %118, %119
  %121 = zext i32 %120 to i64
  %122 = load i8** %2, align 8
  %123 = getelementptr inbounds i8* %122, i64 %121
  %124 = load i8* %123, align 1
  %125 = zext i8 %124 to i32
  %126 = load i32* %med, align 4
  %127 = sub nsw i32 %125, %126
  store i32 %127, i32* %n, align 4
  %128 = load i32* %n, align 4
  %129 = icmp eq i32 %128, 0
  br i1 %129, label %130, label %154

; <label>:130                                     ; preds = %113
  %131 = load i32* %unLo, align 4
  %132 = sext i32 %131 to i64
  %133 = load i32** %1, align 8
  %134 = getelementptr inbounds i32* %133, i64 %132
  %135 = load i32* %134, align 4
  store i32 %135, i32* %zztmp, align 4
  %136 = load i32* %ltLo, align 4
  %137 = sext i32 %136 to i64
  %138 = load i32** %1, align 8
  %139 = getelementptr inbounds i32* %138, i64 %137
  %140 = load i32* %139, align 4
  %141 = load i32* %unLo, align 4
  %142 = sext i32 %141 to i64
  %143 = load i32** %1, align 8
  %144 = getelementptr inbounds i32* %143, i64 %142
  store i32 %140, i32* %144, align 4
  %145 = load i32* %zztmp, align 4
  %146 = load i32* %ltLo, align 4
  %147 = sext i32 %146 to i64
  %148 = load i32** %1, align 8
  %149 = getelementptr inbounds i32* %148, i64 %147
  store i32 %145, i32* %149, align 4
  %150 = load i32* %ltLo, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %ltLo, align 4
  %152 = load i32* %unLo, align 4
  %153 = add nsw i32 %152, 1
  store i32 %153, i32* %unLo, align 4
  br label %108

; <label>:154                                     ; preds = %113
  %155 = load i32* %n, align 4
  %156 = icmp sgt i32 %155, 0
  br i1 %156, label %157, label %158

; <label>:157                                     ; preds = %154
  br label %161

; <label>:158                                     ; preds = %154
  %159 = load i32* %unLo, align 4
  %160 = add nsw i32 %159, 1
  store i32 %160, i32* %unLo, align 4
  br label %108

; <label>:161                                     ; preds = %157, %112
  br label %162

; <label>:162                                     ; preds = %161, %184, %212
  %163 = load i32* %unLo, align 4
  %164 = load i32* %unHi, align 4
  %165 = icmp sgt i32 %163, %164
  br i1 %165, label %166, label %167

; <label>:166                                     ; preds = %162
  br label %215

; <label>:167                                     ; preds = %162
  %168 = load i32* %unHi, align 4
  %169 = sext i32 %168 to i64
  %170 = load i32** %1, align 8
  %171 = getelementptr inbounds i32* %170, i64 %169
  %172 = load i32* %171, align 4
  %173 = load i32* %d, align 4
  %174 = add i32 %172, %173
  %175 = zext i32 %174 to i64
  %176 = load i8** %2, align 8
  %177 = getelementptr inbounds i8* %176, i64 %175
  %178 = load i8* %177, align 1
  %179 = zext i8 %178 to i32
  %180 = load i32* %med, align 4
  %181 = sub nsw i32 %179, %180
  store i32 %181, i32* %n, align 4
  %182 = load i32* %n, align 4
  %183 = icmp eq i32 %182, 0
  br i1 %183, label %184, label %208

; <label>:184                                     ; preds = %167
  %185 = load i32* %unHi, align 4
  %186 = sext i32 %185 to i64
  %187 = load i32** %1, align 8
  %188 = getelementptr inbounds i32* %187, i64 %186
  %189 = load i32* %188, align 4
  store i32 %189, i32* %zztmp1, align 4
  %190 = load i32* %gtHi, align 4
  %191 = sext i32 %190 to i64
  %192 = load i32** %1, align 8
  %193 = getelementptr inbounds i32* %192, i64 %191
  %194 = load i32* %193, align 4
  %195 = load i32* %unHi, align 4
  %196 = sext i32 %195 to i64
  %197 = load i32** %1, align 8
  %198 = getelementptr inbounds i32* %197, i64 %196
  store i32 %194, i32* %198, align 4
  %199 = load i32* %zztmp1, align 4
  %200 = load i32* %gtHi, align 4
  %201 = sext i32 %200 to i64
  %202 = load i32** %1, align 8
  %203 = getelementptr inbounds i32* %202, i64 %201
  store i32 %199, i32* %203, align 4
  %204 = load i32* %gtHi, align 4
  %205 = add nsw i32 %204, -1
  store i32 %205, i32* %gtHi, align 4
  %206 = load i32* %unHi, align 4
  %207 = add nsw i32 %206, -1
  store i32 %207, i32* %unHi, align 4
  br label %162

; <label>:208                                     ; preds = %167
  %209 = load i32* %n, align 4
  %210 = icmp slt i32 %209, 0
  br i1 %210, label %211, label %212

; <label>:211                                     ; preds = %208
  br label %215

; <label>:212                                     ; preds = %208
  %213 = load i32* %unHi, align 4
  %214 = add nsw i32 %213, -1
  store i32 %214, i32* %unHi, align 4
  br label %162

; <label>:215                                     ; preds = %211, %166
  %216 = load i32* %unLo, align 4
  %217 = load i32* %unHi, align 4
  %218 = icmp sgt i32 %216, %217
  br i1 %218, label %219, label %220

; <label>:219                                     ; preds = %215
  br label %244

; <label>:220                                     ; preds = %215
  %221 = load i32* %unLo, align 4
  %222 = sext i32 %221 to i64
  %223 = load i32** %1, align 8
  %224 = getelementptr inbounds i32* %223, i64 %222
  %225 = load i32* %224, align 4
  store i32 %225, i32* %zztmp2, align 4
  %226 = load i32* %unHi, align 4
  %227 = sext i32 %226 to i64
  %228 = load i32** %1, align 8
  %229 = getelementptr inbounds i32* %228, i64 %227
  %230 = load i32* %229, align 4
  %231 = load i32* %unLo, align 4
  %232 = sext i32 %231 to i64
  %233 = load i32** %1, align 8
  %234 = getelementptr inbounds i32* %233, i64 %232
  store i32 %230, i32* %234, align 4
  %235 = load i32* %zztmp2, align 4
  %236 = load i32* %unHi, align 4
  %237 = sext i32 %236 to i64
  %238 = load i32** %1, align 8
  %239 = getelementptr inbounds i32* %238, i64 %237
  store i32 %235, i32* %239, align 4
  %240 = load i32* %unLo, align 4
  %241 = add nsw i32 %240, 1
  store i32 %241, i32* %unLo, align 4
  %242 = load i32* %unHi, align 4
  %243 = add nsw i32 %242, -1
  store i32 %243, i32* %unHi, align 4
  br label %107

; <label>:244                                     ; preds = %219
  %245 = load i32* %gtHi, align 4
  %246 = load i32* %ltLo, align 4
  %247 = icmp slt i32 %245, %246
  br i1 %247, label %248, label %264

; <label>:248                                     ; preds = %244
  %249 = load i32* %lo, align 4
  %250 = load i32* %sp, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %251
  store i32 %249, i32* %252, align 4
  %253 = load i32* %hi, align 4
  %254 = load i32* %sp, align 4
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %255
  store i32 %253, i32* %256, align 4
  %257 = load i32* %d, align 4
  %258 = add nsw i32 %257, 1
  %259 = load i32* %sp, align 4
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds [100 x i32]* %stackD, i32 0, i64 %260
  store i32 %258, i32* %261, align 4
  %262 = load i32* %sp, align 4
  %263 = add nsw i32 %262, 1
  store i32 %263, i32* %sp, align 4
  br label %23

; <label>:264                                     ; preds = %244
  %265 = load i32* %ltLo, align 4
  %266 = load i32* %lo, align 4
  %267 = sub nsw i32 %265, %266
  %268 = load i32* %unLo, align 4
  %269 = load i32* %ltLo, align 4
  %270 = sub nsw i32 %268, %269
  %271 = icmp slt i32 %267, %270
  br i1 %271, label %272, label %276

; <label>:272                                     ; preds = %264
  %273 = load i32* %ltLo, align 4
  %274 = load i32* %lo, align 4
  %275 = sub nsw i32 %273, %274
  br label %280

; <label>:276                                     ; preds = %264
  %277 = load i32* %unLo, align 4
  %278 = load i32* %ltLo, align 4
  %279 = sub nsw i32 %277, %278
  br label %280

; <label>:280                                     ; preds = %276, %272
  %281 = phi i32 [ %275, %272 ], [ %279, %276 ]
  store i32 %281, i32* %n, align 4
  %282 = load i32* %lo, align 4
  store i32 %282, i32* %yyp1, align 4
  %283 = load i32* %unLo, align 4
  %284 = load i32* %n, align 4
  %285 = sub nsw i32 %283, %284
  store i32 %285, i32* %yyp2, align 4
  %286 = load i32* %n, align 4
  store i32 %286, i32* %yyn, align 4
  br label %287

; <label>:287                                     ; preds = %290, %280
  %288 = load i32* %yyn, align 4
  %289 = icmp sgt i32 %288, 0
  br i1 %289, label %290, label %316

; <label>:290                                     ; preds = %287
  %291 = load i32* %yyp1, align 4
  %292 = sext i32 %291 to i64
  %293 = load i32** %1, align 8
  %294 = getelementptr inbounds i32* %293, i64 %292
  %295 = load i32* %294, align 4
  store i32 %295, i32* %zztmp3, align 4
  %296 = load i32* %yyp2, align 4
  %297 = sext i32 %296 to i64
  %298 = load i32** %1, align 8
  %299 = getelementptr inbounds i32* %298, i64 %297
  %300 = load i32* %299, align 4
  %301 = load i32* %yyp1, align 4
  %302 = sext i32 %301 to i64
  %303 = load i32** %1, align 8
  %304 = getelementptr inbounds i32* %303, i64 %302
  store i32 %300, i32* %304, align 4
  %305 = load i32* %zztmp3, align 4
  %306 = load i32* %yyp2, align 4
  %307 = sext i32 %306 to i64
  %308 = load i32** %1, align 8
  %309 = getelementptr inbounds i32* %308, i64 %307
  store i32 %305, i32* %309, align 4
  %310 = load i32* %yyp1, align 4
  %311 = add nsw i32 %310, 1
  store i32 %311, i32* %yyp1, align 4
  %312 = load i32* %yyp2, align 4
  %313 = add nsw i32 %312, 1
  store i32 %313, i32* %yyp2, align 4
  %314 = load i32* %yyn, align 4
  %315 = add nsw i32 %314, -1
  store i32 %315, i32* %yyn, align 4
  br label %287

; <label>:316                                     ; preds = %287
  %317 = load i32* %hi, align 4
  %318 = load i32* %gtHi, align 4
  %319 = sub nsw i32 %317, %318
  %320 = load i32* %gtHi, align 4
  %321 = load i32* %unHi, align 4
  %322 = sub nsw i32 %320, %321
  %323 = icmp slt i32 %319, %322
  br i1 %323, label %324, label %328

; <label>:324                                     ; preds = %316
  %325 = load i32* %hi, align 4
  %326 = load i32* %gtHi, align 4
  %327 = sub nsw i32 %325, %326
  br label %332

; <label>:328                                     ; preds = %316
  %329 = load i32* %gtHi, align 4
  %330 = load i32* %unHi, align 4
  %331 = sub nsw i32 %329, %330
  br label %332

; <label>:332                                     ; preds = %328, %324
  %333 = phi i32 [ %327, %324 ], [ %331, %328 ]
  store i32 %333, i32* %m, align 4
  %334 = load i32* %unLo, align 4
  store i32 %334, i32* %yyp14, align 4
  %335 = load i32* %hi, align 4
  %336 = load i32* %m, align 4
  %337 = sub nsw i32 %335, %336
  %338 = add nsw i32 %337, 1
  store i32 %338, i32* %yyp25, align 4
  %339 = load i32* %m, align 4
  store i32 %339, i32* %yyn6, align 4
  br label %340

; <label>:340                                     ; preds = %343, %332
  %341 = load i32* %yyn6, align 4
  %342 = icmp sgt i32 %341, 0
  br i1 %342, label %343, label %369

; <label>:343                                     ; preds = %340
  %344 = load i32* %yyp14, align 4
  %345 = sext i32 %344 to i64
  %346 = load i32** %1, align 8
  %347 = getelementptr inbounds i32* %346, i64 %345
  %348 = load i32* %347, align 4
  store i32 %348, i32* %zztmp7, align 4
  %349 = load i32* %yyp25, align 4
  %350 = sext i32 %349 to i64
  %351 = load i32** %1, align 8
  %352 = getelementptr inbounds i32* %351, i64 %350
  %353 = load i32* %352, align 4
  %354 = load i32* %yyp14, align 4
  %355 = sext i32 %354 to i64
  %356 = load i32** %1, align 8
  %357 = getelementptr inbounds i32* %356, i64 %355
  store i32 %353, i32* %357, align 4
  %358 = load i32* %zztmp7, align 4
  %359 = load i32* %yyp25, align 4
  %360 = sext i32 %359 to i64
  %361 = load i32** %1, align 8
  %362 = getelementptr inbounds i32* %361, i64 %360
  store i32 %358, i32* %362, align 4
  %363 = load i32* %yyp14, align 4
  %364 = add nsw i32 %363, 1
  store i32 %364, i32* %yyp14, align 4
  %365 = load i32* %yyp25, align 4
  %366 = add nsw i32 %365, 1
  store i32 %366, i32* %yyp25, align 4
  %367 = load i32* %yyn6, align 4
  %368 = add nsw i32 %367, -1
  store i32 %368, i32* %yyn6, align 4
  br label %340

; <label>:369                                     ; preds = %340
  %370 = load i32* %lo, align 4
  %371 = load i32* %unLo, align 4
  %372 = add nsw i32 %370, %371
  %373 = load i32* %ltLo, align 4
  %374 = sub nsw i32 %372, %373
  %375 = sub nsw i32 %374, 1
  store i32 %375, i32* %n, align 4
  %376 = load i32* %hi, align 4
  %377 = load i32* %gtHi, align 4
  %378 = load i32* %unHi, align 4
  %379 = sub nsw i32 %377, %378
  %380 = sub nsw i32 %376, %379
  %381 = add nsw i32 %380, 1
  store i32 %381, i32* %m, align 4
  %382 = load i32* %lo, align 4
  %383 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  store i32 %382, i32* %383, align 4
  %384 = load i32* %n, align 4
  %385 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  store i32 %384, i32* %385, align 4
  %386 = load i32* %d, align 4
  %387 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 0
  store i32 %386, i32* %387, align 4
  %388 = load i32* %m, align 4
  %389 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  store i32 %388, i32* %389, align 4
  %390 = load i32* %hi, align 4
  %391 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  store i32 %390, i32* %391, align 4
  %392 = load i32* %d, align 4
  %393 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  store i32 %392, i32* %393, align 4
  %394 = load i32* %n, align 4
  %395 = add nsw i32 %394, 1
  %396 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 2
  store i32 %395, i32* %396, align 4
  %397 = load i32* %m, align 4
  %398 = sub nsw i32 %397, 1
  %399 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 2
  store i32 %398, i32* %399, align 4
  %400 = load i32* %d, align 4
  %401 = add nsw i32 %400, 1
  %402 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 2
  store i32 %401, i32* %402, align 4
  %403 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  %404 = load i32* %403, align 4
  %405 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  %406 = load i32* %405, align 4
  %407 = sub nsw i32 %404, %406
  %408 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %409 = load i32* %408, align 4
  %410 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %411 = load i32* %410, align 4
  %412 = sub nsw i32 %409, %411
  %413 = icmp slt i32 %407, %412
  br i1 %413, label %414, label %436

; <label>:414                                     ; preds = %369
  %415 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  %416 = load i32* %415, align 4
  store i32 %416, i32* %tz, align 4
  %417 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %418 = load i32* %417, align 4
  %419 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  store i32 %418, i32* %419, align 4
  %420 = load i32* %tz, align 4
  %421 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  store i32 %420, i32* %421, align 4
  %422 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  %423 = load i32* %422, align 4
  store i32 %423, i32* %tz, align 4
  %424 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %425 = load i32* %424, align 4
  %426 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  store i32 %425, i32* %426, align 4
  %427 = load i32* %tz, align 4
  %428 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  store i32 %427, i32* %428, align 4
  %429 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 0
  %430 = load i32* %429, align 4
  store i32 %430, i32* %tz, align 4
  %431 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  %432 = load i32* %431, align 4
  %433 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 0
  store i32 %432, i32* %433, align 4
  %434 = load i32* %tz, align 4
  %435 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  store i32 %434, i32* %435, align 4
  br label %436

; <label>:436                                     ; preds = %414, %369
  %437 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %438 = load i32* %437, align 4
  %439 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %440 = load i32* %439, align 4
  %441 = sub nsw i32 %438, %440
  %442 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 2
  %443 = load i32* %442, align 4
  %444 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 2
  %445 = load i32* %444, align 4
  %446 = sub nsw i32 %443, %445
  %447 = icmp slt i32 %441, %446
  br i1 %447, label %448, label %470

; <label>:448                                     ; preds = %436
  %449 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %450 = load i32* %449, align 4
  store i32 %450, i32* %tz8, align 4
  %451 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 2
  %452 = load i32* %451, align 4
  %453 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  store i32 %452, i32* %453, align 4
  %454 = load i32* %tz8, align 4
  %455 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 2
  store i32 %454, i32* %455, align 4
  %456 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %457 = load i32* %456, align 4
  store i32 %457, i32* %tz8, align 4
  %458 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 2
  %459 = load i32* %458, align 4
  %460 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  store i32 %459, i32* %460, align 4
  %461 = load i32* %tz8, align 4
  %462 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 2
  store i32 %461, i32* %462, align 4
  %463 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  %464 = load i32* %463, align 4
  store i32 %464, i32* %tz8, align 4
  %465 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 2
  %466 = load i32* %465, align 4
  %467 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  store i32 %466, i32* %467, align 4
  %468 = load i32* %tz8, align 4
  %469 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 2
  store i32 %468, i32* %469, align 4
  br label %470

; <label>:470                                     ; preds = %448, %436
  %471 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  %472 = load i32* %471, align 4
  %473 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  %474 = load i32* %473, align 4
  %475 = sub nsw i32 %472, %474
  %476 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %477 = load i32* %476, align 4
  %478 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %479 = load i32* %478, align 4
  %480 = sub nsw i32 %477, %479
  %481 = icmp slt i32 %475, %480
  br i1 %481, label %482, label %504

; <label>:482                                     ; preds = %470
  %483 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  %484 = load i32* %483, align 4
  store i32 %484, i32* %tz9, align 4
  %485 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %486 = load i32* %485, align 4
  %487 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  store i32 %486, i32* %487, align 4
  %488 = load i32* %tz9, align 4
  %489 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  store i32 %488, i32* %489, align 4
  %490 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  %491 = load i32* %490, align 4
  store i32 %491, i32* %tz9, align 4
  %492 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %493 = load i32* %492, align 4
  %494 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  store i32 %493, i32* %494, align 4
  %495 = load i32* %tz9, align 4
  %496 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  store i32 %495, i32* %496, align 4
  %497 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 0
  %498 = load i32* %497, align 4
  store i32 %498, i32* %tz9, align 4
  %499 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  %500 = load i32* %499, align 4
  %501 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 0
  store i32 %500, i32* %501, align 4
  %502 = load i32* %tz9, align 4
  %503 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  store i32 %502, i32* %503, align 4
  br label %504

; <label>:504                                     ; preds = %482, %470
  %505 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  %506 = load i32* %505, align 4
  %507 = load i32* %sp, align 4
  %508 = sext i32 %507 to i64
  %509 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %508
  store i32 %506, i32* %509, align 4
  %510 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  %511 = load i32* %510, align 4
  %512 = load i32* %sp, align 4
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %513
  store i32 %511, i32* %514, align 4
  %515 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 0
  %516 = load i32* %515, align 4
  %517 = load i32* %sp, align 4
  %518 = sext i32 %517 to i64
  %519 = getelementptr inbounds [100 x i32]* %stackD, i32 0, i64 %518
  store i32 %516, i32* %519, align 4
  %520 = load i32* %sp, align 4
  %521 = add nsw i32 %520, 1
  store i32 %521, i32* %sp, align 4
  %522 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %523 = load i32* %522, align 4
  %524 = load i32* %sp, align 4
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %525
  store i32 %523, i32* %526, align 4
  %527 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %528 = load i32* %527, align 4
  %529 = load i32* %sp, align 4
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %530
  store i32 %528, i32* %531, align 4
  %532 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  %533 = load i32* %532, align 4
  %534 = load i32* %sp, align 4
  %535 = sext i32 %534 to i64
  %536 = getelementptr inbounds [100 x i32]* %stackD, i32 0, i64 %535
  store i32 %533, i32* %536, align 4
  %537 = load i32* %sp, align 4
  %538 = add nsw i32 %537, 1
  store i32 %538, i32* %sp, align 4
  %539 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 2
  %540 = load i32* %539, align 4
  %541 = load i32* %sp, align 4
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %542
  store i32 %540, i32* %543, align 4
  %544 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 2
  %545 = load i32* %544, align 4
  %546 = load i32* %sp, align 4
  %547 = sext i32 %546 to i64
  %548 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %547
  store i32 %545, i32* %548, align 4
  %549 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 2
  %550 = load i32* %549, align 4
  %551 = load i32* %sp, align 4
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds [100 x i32]* %stackD, i32 0, i64 %552
  store i32 %550, i32* %553, align 4
  %554 = load i32* %sp, align 4
  %555 = add nsw i32 %554, 1
  store i32 %555, i32* %sp, align 4
  br label %23

; <label>:556                                     ; preds = %64, %23
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @mainSimpleSort(i32* %ptr, i8* %block, i16* %quadrant, i32 %nblock, i32 %lo, i32 %hi, i32 %d, i32* %budget) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i16*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %h = alloca i32, align 4
  %bigN = alloca i32, align 4
  %hp = alloca i32, align 4
  %v = alloca i32, align 4
  store i32* %ptr, i32** %1, align 8
  store i8* %block, i8** %2, align 8
  store i16* %quadrant, i16** %3, align 8
  store i32 %nblock, i32* %4, align 4
  store i32 %lo, i32* %5, align 4
  store i32 %hi, i32* %6, align 4
  store i32 %d, i32* %7, align 4
  store i32* %budget, i32** %8, align 8
  %9 = load i32* %6, align 4
  %10 = load i32* %5, align 4
  %11 = sub nsw i32 %9, %10
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %bigN, align 4
  %13 = load i32* %bigN, align 4
  %14 = icmp slt i32 %13, 2
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %0
  br label %234

; <label>:16                                      ; preds = %0
  store i32 0, i32* %hp, align 4
  br label %17

; <label>:17                                      ; preds = %24, %16
  %18 = load i32* %hp, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [14 x i32]* @incs, i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = load i32* %bigN, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %27

; <label>:24                                      ; preds = %17
  %25 = load i32* %hp, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %hp, align 4
  br label %17

; <label>:27                                      ; preds = %17
  %28 = load i32* %hp, align 4
  %29 = add nsw i32 %28, -1
  store i32 %29, i32* %hp, align 4
  br label %30

; <label>:30                                      ; preds = %231, %27
  %31 = load i32* %hp, align 4
  %32 = icmp sge i32 %31, 0
  br i1 %32, label %33, label %234

; <label>:33                                      ; preds = %30
  %34 = load i32* %hp, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [14 x i32]* @incs, i32 0, i64 %35
  %37 = load i32* %36, align 4
  store i32 %37, i32* %h, align 4
  %38 = load i32* %5, align 4
  %39 = load i32* %h, align 4
  %40 = add nsw i32 %38, %39
  store i32 %40, i32* %i, align 4
  br label %41

; <label>:41                                      ; preds = %33, %229
  %42 = load i32* %i, align 4
  %43 = load i32* %6, align 4
  %44 = icmp sgt i32 %42, %43
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %41
  br label %230

; <label>:46                                      ; preds = %41
  %47 = load i32* %i, align 4
  %48 = sext i32 %47 to i64
  %49 = load i32** %1, align 8
  %50 = getelementptr inbounds i32* %49, i64 %48
  %51 = load i32* %50, align 4
  store i32 %51, i32* %v, align 4
  %52 = load i32* %i, align 4
  store i32 %52, i32* %j, align 4
  br label %53

; <label>:53                                      ; preds = %94, %46
  %54 = load i32* %j, align 4
  %55 = load i32* %h, align 4
  %56 = sub nsw i32 %54, %55
  %57 = sext i32 %56 to i64
  %58 = load i32** %1, align 8
  %59 = getelementptr inbounds i32* %58, i64 %57
  %60 = load i32* %59, align 4
  %61 = load i32* %7, align 4
  %62 = add i32 %60, %61
  %63 = load i32* %v, align 4
  %64 = load i32* %7, align 4
  %65 = add i32 %63, %64
  %66 = load i8** %2, align 8
  %67 = load i16** %3, align 8
  %68 = load i32* %4, align 4
  %69 = load i32** %8, align 8
  %70 = call zeroext i8 @mainGtU(i32 %62, i32 %65, i8* %66, i16* %67, i32 %68, i32* %69)
  %71 = icmp ne i8 %70, 0
  br i1 %71, label %72, label %95

; <label>:72                                      ; preds = %53
  %73 = load i32* %j, align 4
  %74 = load i32* %h, align 4
  %75 = sub nsw i32 %73, %74
  %76 = sext i32 %75 to i64
  %77 = load i32** %1, align 8
  %78 = getelementptr inbounds i32* %77, i64 %76
  %79 = load i32* %78, align 4
  %80 = load i32* %j, align 4
  %81 = sext i32 %80 to i64
  %82 = load i32** %1, align 8
  %83 = getelementptr inbounds i32* %82, i64 %81
  store i32 %79, i32* %83, align 4
  %84 = load i32* %j, align 4
  %85 = load i32* %h, align 4
  %86 = sub nsw i32 %84, %85
  store i32 %86, i32* %j, align 4
  %87 = load i32* %j, align 4
  %88 = load i32* %5, align 4
  %89 = load i32* %h, align 4
  %90 = add nsw i32 %88, %89
  %91 = sub nsw i32 %90, 1
  %92 = icmp sle i32 %87, %91
  br i1 %92, label %93, label %94

; <label>:93                                      ; preds = %72
  br label %95

; <label>:94                                      ; preds = %72
  br label %53

; <label>:95                                      ; preds = %93, %53
  %96 = load i32* %v, align 4
  %97 = load i32* %j, align 4
  %98 = sext i32 %97 to i64
  %99 = load i32** %1, align 8
  %100 = getelementptr inbounds i32* %99, i64 %98
  store i32 %96, i32* %100, align 4
  %101 = load i32* %i, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %i, align 4
  %103 = load i32* %i, align 4
  %104 = load i32* %6, align 4
  %105 = icmp sgt i32 %103, %104
  br i1 %105, label %106, label %107

; <label>:106                                     ; preds = %95
  br label %230

; <label>:107                                     ; preds = %95
  %108 = load i32* %i, align 4
  %109 = sext i32 %108 to i64
  %110 = load i32** %1, align 8
  %111 = getelementptr inbounds i32* %110, i64 %109
  %112 = load i32* %111, align 4
  store i32 %112, i32* %v, align 4
  %113 = load i32* %i, align 4
  store i32 %113, i32* %j, align 4
  br label %114

; <label>:114                                     ; preds = %155, %107
  %115 = load i32* %j, align 4
  %116 = load i32* %h, align 4
  %117 = sub nsw i32 %115, %116
  %118 = sext i32 %117 to i64
  %119 = load i32** %1, align 8
  %120 = getelementptr inbounds i32* %119, i64 %118
  %121 = load i32* %120, align 4
  %122 = load i32* %7, align 4
  %123 = add i32 %121, %122
  %124 = load i32* %v, align 4
  %125 = load i32* %7, align 4
  %126 = add i32 %124, %125
  %127 = load i8** %2, align 8
  %128 = load i16** %3, align 8
  %129 = load i32* %4, align 4
  %130 = load i32** %8, align 8
  %131 = call zeroext i8 @mainGtU(i32 %123, i32 %126, i8* %127, i16* %128, i32 %129, i32* %130)
  %132 = icmp ne i8 %131, 0
  br i1 %132, label %133, label %156

; <label>:133                                     ; preds = %114
  %134 = load i32* %j, align 4
  %135 = load i32* %h, align 4
  %136 = sub nsw i32 %134, %135
  %137 = sext i32 %136 to i64
  %138 = load i32** %1, align 8
  %139 = getelementptr inbounds i32* %138, i64 %137
  %140 = load i32* %139, align 4
  %141 = load i32* %j, align 4
  %142 = sext i32 %141 to i64
  %143 = load i32** %1, align 8
  %144 = getelementptr inbounds i32* %143, i64 %142
  store i32 %140, i32* %144, align 4
  %145 = load i32* %j, align 4
  %146 = load i32* %h, align 4
  %147 = sub nsw i32 %145, %146
  store i32 %147, i32* %j, align 4
  %148 = load i32* %j, align 4
  %149 = load i32* %5, align 4
  %150 = load i32* %h, align 4
  %151 = add nsw i32 %149, %150
  %152 = sub nsw i32 %151, 1
  %153 = icmp sle i32 %148, %152
  br i1 %153, label %154, label %155

; <label>:154                                     ; preds = %133
  br label %156

; <label>:155                                     ; preds = %133
  br label %114

; <label>:156                                     ; preds = %154, %114
  %157 = load i32* %v, align 4
  %158 = load i32* %j, align 4
  %159 = sext i32 %158 to i64
  %160 = load i32** %1, align 8
  %161 = getelementptr inbounds i32* %160, i64 %159
  store i32 %157, i32* %161, align 4
  %162 = load i32* %i, align 4
  %163 = add nsw i32 %162, 1
  store i32 %163, i32* %i, align 4
  %164 = load i32* %i, align 4
  %165 = load i32* %6, align 4
  %166 = icmp sgt i32 %164, %165
  br i1 %166, label %167, label %168

; <label>:167                                     ; preds = %156
  br label %230

; <label>:168                                     ; preds = %156
  %169 = load i32* %i, align 4
  %170 = sext i32 %169 to i64
  %171 = load i32** %1, align 8
  %172 = getelementptr inbounds i32* %171, i64 %170
  %173 = load i32* %172, align 4
  store i32 %173, i32* %v, align 4
  %174 = load i32* %i, align 4
  store i32 %174, i32* %j, align 4
  br label %175

; <label>:175                                     ; preds = %216, %168
  %176 = load i32* %j, align 4
  %177 = load i32* %h, align 4
  %178 = sub nsw i32 %176, %177
  %179 = sext i32 %178 to i64
  %180 = load i32** %1, align 8
  %181 = getelementptr inbounds i32* %180, i64 %179
  %182 = load i32* %181, align 4
  %183 = load i32* %7, align 4
  %184 = add i32 %182, %183
  %185 = load i32* %v, align 4
  %186 = load i32* %7, align 4
  %187 = add i32 %185, %186
  %188 = load i8** %2, align 8
  %189 = load i16** %3, align 8
  %190 = load i32* %4, align 4
  %191 = load i32** %8, align 8
  %192 = call zeroext i8 @mainGtU(i32 %184, i32 %187, i8* %188, i16* %189, i32 %190, i32* %191)
  %193 = icmp ne i8 %192, 0
  br i1 %193, label %194, label %217

; <label>:194                                     ; preds = %175
  %195 = load i32* %j, align 4
  %196 = load i32* %h, align 4
  %197 = sub nsw i32 %195, %196
  %198 = sext i32 %197 to i64
  %199 = load i32** %1, align 8
  %200 = getelementptr inbounds i32* %199, i64 %198
  %201 = load i32* %200, align 4
  %202 = load i32* %j, align 4
  %203 = sext i32 %202 to i64
  %204 = load i32** %1, align 8
  %205 = getelementptr inbounds i32* %204, i64 %203
  store i32 %201, i32* %205, align 4
  %206 = load i32* %j, align 4
  %207 = load i32* %h, align 4
  %208 = sub nsw i32 %206, %207
  store i32 %208, i32* %j, align 4
  %209 = load i32* %j, align 4
  %210 = load i32* %5, align 4
  %211 = load i32* %h, align 4
  %212 = add nsw i32 %210, %211
  %213 = sub nsw i32 %212, 1
  %214 = icmp sle i32 %209, %213
  br i1 %214, label %215, label %216

; <label>:215                                     ; preds = %194
  br label %217

; <label>:216                                     ; preds = %194
  br label %175

; <label>:217                                     ; preds = %215, %175
  %218 = load i32* %v, align 4
  %219 = load i32* %j, align 4
  %220 = sext i32 %219 to i64
  %221 = load i32** %1, align 8
  %222 = getelementptr inbounds i32* %221, i64 %220
  store i32 %218, i32* %222, align 4
  %223 = load i32* %i, align 4
  %224 = add nsw i32 %223, 1
  store i32 %224, i32* %i, align 4
  %225 = load i32** %8, align 8
  %226 = load i32* %225, align 4
  %227 = icmp slt i32 %226, 0
  br i1 %227, label %228, label %229

; <label>:228                                     ; preds = %217
  br label %234

; <label>:229                                     ; preds = %217
  br label %41

; <label>:230                                     ; preds = %167, %106, %45
  br label %231

; <label>:231                                     ; preds = %230
  %232 = load i32* %hp, align 4
  %233 = add nsw i32 %232, -1
  store i32 %233, i32* %hp, align 4
  br label %30

; <label>:234                                     ; preds = %15, %228, %30
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal zeroext i8 @mmed3(i8 zeroext %a, i8 zeroext %b, i8 zeroext %c) #2 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %t = alloca i8, align 1
  store i8 %a, i8* %1, align 1
  store i8 %b, i8* %2, align 1
  store i8 %c, i8* %3, align 1
  %4 = load i8* %1, align 1
  %5 = zext i8 %4 to i32
  %6 = load i8* %2, align 1
  %7 = zext i8 %6 to i32
  %8 = icmp sgt i32 %5, %7
  br i1 %8, label %9, label %13

; <label>:9                                       ; preds = %0
  %10 = load i8* %1, align 1
  store i8 %10, i8* %t, align 1
  %11 = load i8* %2, align 1
  store i8 %11, i8* %1, align 1
  %12 = load i8* %t, align 1
  store i8 %12, i8* %2, align 1
  br label %13

; <label>:13                                      ; preds = %9, %0
  %14 = load i8* %2, align 1
  %15 = zext i8 %14 to i32
  %16 = load i8* %3, align 1
  %17 = zext i8 %16 to i32
  %18 = icmp sgt i32 %15, %17
  br i1 %18, label %19, label %29

; <label>:19                                      ; preds = %13
  %20 = load i8* %3, align 1
  store i8 %20, i8* %2, align 1
  %21 = load i8* %1, align 1
  %22 = zext i8 %21 to i32
  %23 = load i8* %2, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp sgt i32 %22, %24
  br i1 %25, label %26, label %28

; <label>:26                                      ; preds = %19
  %27 = load i8* %1, align 1
  store i8 %27, i8* %2, align 1
  br label %28

; <label>:28                                      ; preds = %26, %19
  br label %29

; <label>:29                                      ; preds = %28, %13
  %30 = load i8* %2, align 1
  ret i8 %30
}

; Function Attrs: inlinehint nounwind uwtable
define internal zeroext i8 @mainGtU(i32 %i1, i32 %i2, i8* %block, i16* %quadrant, i32 %nblock, i32* %budget) #2 {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %k = alloca i32, align 4
  %c1 = alloca i8, align 1
  %c2 = alloca i8, align 1
  %s1 = alloca i16, align 2
  %s2 = alloca i16, align 2
  store i32 %i1, i32* %2, align 4
  store i32 %i2, i32* %3, align 4
  store i8* %block, i8** %4, align 8
  store i16* %quadrant, i16** %5, align 8
  store i32 %nblock, i32* %6, align 4
  store i32* %budget, i32** %7, align 8
  %8 = load i32* %2, align 4
  %9 = zext i32 %8 to i64
  %10 = load i8** %4, align 8
  %11 = getelementptr inbounds i8* %10, i64 %9
  %12 = load i8* %11, align 1
  store i8 %12, i8* %c1, align 1
  %13 = load i32* %3, align 4
  %14 = zext i32 %13 to i64
  %15 = load i8** %4, align 8
  %16 = getelementptr inbounds i8* %15, i64 %14
  %17 = load i8* %16, align 1
  store i8 %17, i8* %c2, align 1
  %18 = load i8* %c1, align 1
  %19 = zext i8 %18 to i32
  %20 = load i8* %c2, align 1
  %21 = zext i8 %20 to i32
  %22 = icmp ne i32 %19, %21
  br i1 %22, label %23, label %31

; <label>:23                                      ; preds = %0
  %24 = load i8* %c1, align 1
  %25 = zext i8 %24 to i32
  %26 = load i8* %c2, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp sgt i32 %25, %27
  %29 = zext i1 %28 to i32
  %30 = trunc i32 %29 to i8
  store i8 %30, i8* %1
  br label %788

; <label>:31                                      ; preds = %0
  %32 = load i32* %2, align 4
  %33 = add i32 %32, 1
  store i32 %33, i32* %2, align 4
  %34 = load i32* %3, align 4
  %35 = add i32 %34, 1
  store i32 %35, i32* %3, align 4
  %36 = load i32* %2, align 4
  %37 = zext i32 %36 to i64
  %38 = load i8** %4, align 8
  %39 = getelementptr inbounds i8* %38, i64 %37
  %40 = load i8* %39, align 1
  store i8 %40, i8* %c1, align 1
  %41 = load i32* %3, align 4
  %42 = zext i32 %41 to i64
  %43 = load i8** %4, align 8
  %44 = getelementptr inbounds i8* %43, i64 %42
  %45 = load i8* %44, align 1
  store i8 %45, i8* %c2, align 1
  %46 = load i8* %c1, align 1
  %47 = zext i8 %46 to i32
  %48 = load i8* %c2, align 1
  %49 = zext i8 %48 to i32
  %50 = icmp ne i32 %47, %49
  br i1 %50, label %51, label %59

; <label>:51                                      ; preds = %31
  %52 = load i8* %c1, align 1
  %53 = zext i8 %52 to i32
  %54 = load i8* %c2, align 1
  %55 = zext i8 %54 to i32
  %56 = icmp sgt i32 %53, %55
  %57 = zext i1 %56 to i32
  %58 = trunc i32 %57 to i8
  store i8 %58, i8* %1
  br label %788

; <label>:59                                      ; preds = %31
  %60 = load i32* %2, align 4
  %61 = add i32 %60, 1
  store i32 %61, i32* %2, align 4
  %62 = load i32* %3, align 4
  %63 = add i32 %62, 1
  store i32 %63, i32* %3, align 4
  %64 = load i32* %2, align 4
  %65 = zext i32 %64 to i64
  %66 = load i8** %4, align 8
  %67 = getelementptr inbounds i8* %66, i64 %65
  %68 = load i8* %67, align 1
  store i8 %68, i8* %c1, align 1
  %69 = load i32* %3, align 4
  %70 = zext i32 %69 to i64
  %71 = load i8** %4, align 8
  %72 = getelementptr inbounds i8* %71, i64 %70
  %73 = load i8* %72, align 1
  store i8 %73, i8* %c2, align 1
  %74 = load i8* %c1, align 1
  %75 = zext i8 %74 to i32
  %76 = load i8* %c2, align 1
  %77 = zext i8 %76 to i32
  %78 = icmp ne i32 %75, %77
  br i1 %78, label %79, label %87

; <label>:79                                      ; preds = %59
  %80 = load i8* %c1, align 1
  %81 = zext i8 %80 to i32
  %82 = load i8* %c2, align 1
  %83 = zext i8 %82 to i32
  %84 = icmp sgt i32 %81, %83
  %85 = zext i1 %84 to i32
  %86 = trunc i32 %85 to i8
  store i8 %86, i8* %1
  br label %788

; <label>:87                                      ; preds = %59
  %88 = load i32* %2, align 4
  %89 = add i32 %88, 1
  store i32 %89, i32* %2, align 4
  %90 = load i32* %3, align 4
  %91 = add i32 %90, 1
  store i32 %91, i32* %3, align 4
  %92 = load i32* %2, align 4
  %93 = zext i32 %92 to i64
  %94 = load i8** %4, align 8
  %95 = getelementptr inbounds i8* %94, i64 %93
  %96 = load i8* %95, align 1
  store i8 %96, i8* %c1, align 1
  %97 = load i32* %3, align 4
  %98 = zext i32 %97 to i64
  %99 = load i8** %4, align 8
  %100 = getelementptr inbounds i8* %99, i64 %98
  %101 = load i8* %100, align 1
  store i8 %101, i8* %c2, align 1
  %102 = load i8* %c1, align 1
  %103 = zext i8 %102 to i32
  %104 = load i8* %c2, align 1
  %105 = zext i8 %104 to i32
  %106 = icmp ne i32 %103, %105
  br i1 %106, label %107, label %115

; <label>:107                                     ; preds = %87
  %108 = load i8* %c1, align 1
  %109 = zext i8 %108 to i32
  %110 = load i8* %c2, align 1
  %111 = zext i8 %110 to i32
  %112 = icmp sgt i32 %109, %111
  %113 = zext i1 %112 to i32
  %114 = trunc i32 %113 to i8
  store i8 %114, i8* %1
  br label %788

; <label>:115                                     ; preds = %87
  %116 = load i32* %2, align 4
  %117 = add i32 %116, 1
  store i32 %117, i32* %2, align 4
  %118 = load i32* %3, align 4
  %119 = add i32 %118, 1
  store i32 %119, i32* %3, align 4
  %120 = load i32* %2, align 4
  %121 = zext i32 %120 to i64
  %122 = load i8** %4, align 8
  %123 = getelementptr inbounds i8* %122, i64 %121
  %124 = load i8* %123, align 1
  store i8 %124, i8* %c1, align 1
  %125 = load i32* %3, align 4
  %126 = zext i32 %125 to i64
  %127 = load i8** %4, align 8
  %128 = getelementptr inbounds i8* %127, i64 %126
  %129 = load i8* %128, align 1
  store i8 %129, i8* %c2, align 1
  %130 = load i8* %c1, align 1
  %131 = zext i8 %130 to i32
  %132 = load i8* %c2, align 1
  %133 = zext i8 %132 to i32
  %134 = icmp ne i32 %131, %133
  br i1 %134, label %135, label %143

; <label>:135                                     ; preds = %115
  %136 = load i8* %c1, align 1
  %137 = zext i8 %136 to i32
  %138 = load i8* %c2, align 1
  %139 = zext i8 %138 to i32
  %140 = icmp sgt i32 %137, %139
  %141 = zext i1 %140 to i32
  %142 = trunc i32 %141 to i8
  store i8 %142, i8* %1
  br label %788

; <label>:143                                     ; preds = %115
  %144 = load i32* %2, align 4
  %145 = add i32 %144, 1
  store i32 %145, i32* %2, align 4
  %146 = load i32* %3, align 4
  %147 = add i32 %146, 1
  store i32 %147, i32* %3, align 4
  %148 = load i32* %2, align 4
  %149 = zext i32 %148 to i64
  %150 = load i8** %4, align 8
  %151 = getelementptr inbounds i8* %150, i64 %149
  %152 = load i8* %151, align 1
  store i8 %152, i8* %c1, align 1
  %153 = load i32* %3, align 4
  %154 = zext i32 %153 to i64
  %155 = load i8** %4, align 8
  %156 = getelementptr inbounds i8* %155, i64 %154
  %157 = load i8* %156, align 1
  store i8 %157, i8* %c2, align 1
  %158 = load i8* %c1, align 1
  %159 = zext i8 %158 to i32
  %160 = load i8* %c2, align 1
  %161 = zext i8 %160 to i32
  %162 = icmp ne i32 %159, %161
  br i1 %162, label %163, label %171

; <label>:163                                     ; preds = %143
  %164 = load i8* %c1, align 1
  %165 = zext i8 %164 to i32
  %166 = load i8* %c2, align 1
  %167 = zext i8 %166 to i32
  %168 = icmp sgt i32 %165, %167
  %169 = zext i1 %168 to i32
  %170 = trunc i32 %169 to i8
  store i8 %170, i8* %1
  br label %788

; <label>:171                                     ; preds = %143
  %172 = load i32* %2, align 4
  %173 = add i32 %172, 1
  store i32 %173, i32* %2, align 4
  %174 = load i32* %3, align 4
  %175 = add i32 %174, 1
  store i32 %175, i32* %3, align 4
  %176 = load i32* %2, align 4
  %177 = zext i32 %176 to i64
  %178 = load i8** %4, align 8
  %179 = getelementptr inbounds i8* %178, i64 %177
  %180 = load i8* %179, align 1
  store i8 %180, i8* %c1, align 1
  %181 = load i32* %3, align 4
  %182 = zext i32 %181 to i64
  %183 = load i8** %4, align 8
  %184 = getelementptr inbounds i8* %183, i64 %182
  %185 = load i8* %184, align 1
  store i8 %185, i8* %c2, align 1
  %186 = load i8* %c1, align 1
  %187 = zext i8 %186 to i32
  %188 = load i8* %c2, align 1
  %189 = zext i8 %188 to i32
  %190 = icmp ne i32 %187, %189
  br i1 %190, label %191, label %199

; <label>:191                                     ; preds = %171
  %192 = load i8* %c1, align 1
  %193 = zext i8 %192 to i32
  %194 = load i8* %c2, align 1
  %195 = zext i8 %194 to i32
  %196 = icmp sgt i32 %193, %195
  %197 = zext i1 %196 to i32
  %198 = trunc i32 %197 to i8
  store i8 %198, i8* %1
  br label %788

; <label>:199                                     ; preds = %171
  %200 = load i32* %2, align 4
  %201 = add i32 %200, 1
  store i32 %201, i32* %2, align 4
  %202 = load i32* %3, align 4
  %203 = add i32 %202, 1
  store i32 %203, i32* %3, align 4
  %204 = load i32* %2, align 4
  %205 = zext i32 %204 to i64
  %206 = load i8** %4, align 8
  %207 = getelementptr inbounds i8* %206, i64 %205
  %208 = load i8* %207, align 1
  store i8 %208, i8* %c1, align 1
  %209 = load i32* %3, align 4
  %210 = zext i32 %209 to i64
  %211 = load i8** %4, align 8
  %212 = getelementptr inbounds i8* %211, i64 %210
  %213 = load i8* %212, align 1
  store i8 %213, i8* %c2, align 1
  %214 = load i8* %c1, align 1
  %215 = zext i8 %214 to i32
  %216 = load i8* %c2, align 1
  %217 = zext i8 %216 to i32
  %218 = icmp ne i32 %215, %217
  br i1 %218, label %219, label %227

; <label>:219                                     ; preds = %199
  %220 = load i8* %c1, align 1
  %221 = zext i8 %220 to i32
  %222 = load i8* %c2, align 1
  %223 = zext i8 %222 to i32
  %224 = icmp sgt i32 %221, %223
  %225 = zext i1 %224 to i32
  %226 = trunc i32 %225 to i8
  store i8 %226, i8* %1
  br label %788

; <label>:227                                     ; preds = %199
  %228 = load i32* %2, align 4
  %229 = add i32 %228, 1
  store i32 %229, i32* %2, align 4
  %230 = load i32* %3, align 4
  %231 = add i32 %230, 1
  store i32 %231, i32* %3, align 4
  %232 = load i32* %2, align 4
  %233 = zext i32 %232 to i64
  %234 = load i8** %4, align 8
  %235 = getelementptr inbounds i8* %234, i64 %233
  %236 = load i8* %235, align 1
  store i8 %236, i8* %c1, align 1
  %237 = load i32* %3, align 4
  %238 = zext i32 %237 to i64
  %239 = load i8** %4, align 8
  %240 = getelementptr inbounds i8* %239, i64 %238
  %241 = load i8* %240, align 1
  store i8 %241, i8* %c2, align 1
  %242 = load i8* %c1, align 1
  %243 = zext i8 %242 to i32
  %244 = load i8* %c2, align 1
  %245 = zext i8 %244 to i32
  %246 = icmp ne i32 %243, %245
  br i1 %246, label %247, label %255

; <label>:247                                     ; preds = %227
  %248 = load i8* %c1, align 1
  %249 = zext i8 %248 to i32
  %250 = load i8* %c2, align 1
  %251 = zext i8 %250 to i32
  %252 = icmp sgt i32 %249, %251
  %253 = zext i1 %252 to i32
  %254 = trunc i32 %253 to i8
  store i8 %254, i8* %1
  br label %788

; <label>:255                                     ; preds = %227
  %256 = load i32* %2, align 4
  %257 = add i32 %256, 1
  store i32 %257, i32* %2, align 4
  %258 = load i32* %3, align 4
  %259 = add i32 %258, 1
  store i32 %259, i32* %3, align 4
  %260 = load i32* %2, align 4
  %261 = zext i32 %260 to i64
  %262 = load i8** %4, align 8
  %263 = getelementptr inbounds i8* %262, i64 %261
  %264 = load i8* %263, align 1
  store i8 %264, i8* %c1, align 1
  %265 = load i32* %3, align 4
  %266 = zext i32 %265 to i64
  %267 = load i8** %4, align 8
  %268 = getelementptr inbounds i8* %267, i64 %266
  %269 = load i8* %268, align 1
  store i8 %269, i8* %c2, align 1
  %270 = load i8* %c1, align 1
  %271 = zext i8 %270 to i32
  %272 = load i8* %c2, align 1
  %273 = zext i8 %272 to i32
  %274 = icmp ne i32 %271, %273
  br i1 %274, label %275, label %283

; <label>:275                                     ; preds = %255
  %276 = load i8* %c1, align 1
  %277 = zext i8 %276 to i32
  %278 = load i8* %c2, align 1
  %279 = zext i8 %278 to i32
  %280 = icmp sgt i32 %277, %279
  %281 = zext i1 %280 to i32
  %282 = trunc i32 %281 to i8
  store i8 %282, i8* %1
  br label %788

; <label>:283                                     ; preds = %255
  %284 = load i32* %2, align 4
  %285 = add i32 %284, 1
  store i32 %285, i32* %2, align 4
  %286 = load i32* %3, align 4
  %287 = add i32 %286, 1
  store i32 %287, i32* %3, align 4
  %288 = load i32* %2, align 4
  %289 = zext i32 %288 to i64
  %290 = load i8** %4, align 8
  %291 = getelementptr inbounds i8* %290, i64 %289
  %292 = load i8* %291, align 1
  store i8 %292, i8* %c1, align 1
  %293 = load i32* %3, align 4
  %294 = zext i32 %293 to i64
  %295 = load i8** %4, align 8
  %296 = getelementptr inbounds i8* %295, i64 %294
  %297 = load i8* %296, align 1
  store i8 %297, i8* %c2, align 1
  %298 = load i8* %c1, align 1
  %299 = zext i8 %298 to i32
  %300 = load i8* %c2, align 1
  %301 = zext i8 %300 to i32
  %302 = icmp ne i32 %299, %301
  br i1 %302, label %303, label %311

; <label>:303                                     ; preds = %283
  %304 = load i8* %c1, align 1
  %305 = zext i8 %304 to i32
  %306 = load i8* %c2, align 1
  %307 = zext i8 %306 to i32
  %308 = icmp sgt i32 %305, %307
  %309 = zext i1 %308 to i32
  %310 = trunc i32 %309 to i8
  store i8 %310, i8* %1
  br label %788

; <label>:311                                     ; preds = %283
  %312 = load i32* %2, align 4
  %313 = add i32 %312, 1
  store i32 %313, i32* %2, align 4
  %314 = load i32* %3, align 4
  %315 = add i32 %314, 1
  store i32 %315, i32* %3, align 4
  %316 = load i32* %2, align 4
  %317 = zext i32 %316 to i64
  %318 = load i8** %4, align 8
  %319 = getelementptr inbounds i8* %318, i64 %317
  %320 = load i8* %319, align 1
  store i8 %320, i8* %c1, align 1
  %321 = load i32* %3, align 4
  %322 = zext i32 %321 to i64
  %323 = load i8** %4, align 8
  %324 = getelementptr inbounds i8* %323, i64 %322
  %325 = load i8* %324, align 1
  store i8 %325, i8* %c2, align 1
  %326 = load i8* %c1, align 1
  %327 = zext i8 %326 to i32
  %328 = load i8* %c2, align 1
  %329 = zext i8 %328 to i32
  %330 = icmp ne i32 %327, %329
  br i1 %330, label %331, label %339

; <label>:331                                     ; preds = %311
  %332 = load i8* %c1, align 1
  %333 = zext i8 %332 to i32
  %334 = load i8* %c2, align 1
  %335 = zext i8 %334 to i32
  %336 = icmp sgt i32 %333, %335
  %337 = zext i1 %336 to i32
  %338 = trunc i32 %337 to i8
  store i8 %338, i8* %1
  br label %788

; <label>:339                                     ; preds = %311
  %340 = load i32* %2, align 4
  %341 = add i32 %340, 1
  store i32 %341, i32* %2, align 4
  %342 = load i32* %3, align 4
  %343 = add i32 %342, 1
  store i32 %343, i32* %3, align 4
  %344 = load i32* %6, align 4
  %345 = add i32 %344, 8
  store i32 %345, i32* %k, align 4
  br label %346

; <label>:346                                     ; preds = %784, %339
  %347 = load i32* %2, align 4
  %348 = zext i32 %347 to i64
  %349 = load i8** %4, align 8
  %350 = getelementptr inbounds i8* %349, i64 %348
  %351 = load i8* %350, align 1
  store i8 %351, i8* %c1, align 1
  %352 = load i32* %3, align 4
  %353 = zext i32 %352 to i64
  %354 = load i8** %4, align 8
  %355 = getelementptr inbounds i8* %354, i64 %353
  %356 = load i8* %355, align 1
  store i8 %356, i8* %c2, align 1
  %357 = load i8* %c1, align 1
  %358 = zext i8 %357 to i32
  %359 = load i8* %c2, align 1
  %360 = zext i8 %359 to i32
  %361 = icmp ne i32 %358, %360
  br i1 %361, label %362, label %370

; <label>:362                                     ; preds = %346
  %363 = load i8* %c1, align 1
  %364 = zext i8 %363 to i32
  %365 = load i8* %c2, align 1
  %366 = zext i8 %365 to i32
  %367 = icmp sgt i32 %364, %366
  %368 = zext i1 %367 to i32
  %369 = trunc i32 %368 to i8
  store i8 %369, i8* %1
  br label %788

; <label>:370                                     ; preds = %346
  %371 = load i32* %2, align 4
  %372 = zext i32 %371 to i64
  %373 = load i16** %5, align 8
  %374 = getelementptr inbounds i16* %373, i64 %372
  %375 = load i16* %374, align 2
  store i16 %375, i16* %s1, align 2
  %376 = load i32* %3, align 4
  %377 = zext i32 %376 to i64
  %378 = load i16** %5, align 8
  %379 = getelementptr inbounds i16* %378, i64 %377
  %380 = load i16* %379, align 2
  store i16 %380, i16* %s2, align 2
  %381 = load i16* %s1, align 2
  %382 = zext i16 %381 to i32
  %383 = load i16* %s2, align 2
  %384 = zext i16 %383 to i32
  %385 = icmp ne i32 %382, %384
  br i1 %385, label %386, label %394

; <label>:386                                     ; preds = %370
  %387 = load i16* %s1, align 2
  %388 = zext i16 %387 to i32
  %389 = load i16* %s2, align 2
  %390 = zext i16 %389 to i32
  %391 = icmp sgt i32 %388, %390
  %392 = zext i1 %391 to i32
  %393 = trunc i32 %392 to i8
  store i8 %393, i8* %1
  br label %788

; <label>:394                                     ; preds = %370
  %395 = load i32* %2, align 4
  %396 = add i32 %395, 1
  store i32 %396, i32* %2, align 4
  %397 = load i32* %3, align 4
  %398 = add i32 %397, 1
  store i32 %398, i32* %3, align 4
  %399 = load i32* %2, align 4
  %400 = zext i32 %399 to i64
  %401 = load i8** %4, align 8
  %402 = getelementptr inbounds i8* %401, i64 %400
  %403 = load i8* %402, align 1
  store i8 %403, i8* %c1, align 1
  %404 = load i32* %3, align 4
  %405 = zext i32 %404 to i64
  %406 = load i8** %4, align 8
  %407 = getelementptr inbounds i8* %406, i64 %405
  %408 = load i8* %407, align 1
  store i8 %408, i8* %c2, align 1
  %409 = load i8* %c1, align 1
  %410 = zext i8 %409 to i32
  %411 = load i8* %c2, align 1
  %412 = zext i8 %411 to i32
  %413 = icmp ne i32 %410, %412
  br i1 %413, label %414, label %422

; <label>:414                                     ; preds = %394
  %415 = load i8* %c1, align 1
  %416 = zext i8 %415 to i32
  %417 = load i8* %c2, align 1
  %418 = zext i8 %417 to i32
  %419 = icmp sgt i32 %416, %418
  %420 = zext i1 %419 to i32
  %421 = trunc i32 %420 to i8
  store i8 %421, i8* %1
  br label %788

; <label>:422                                     ; preds = %394
  %423 = load i32* %2, align 4
  %424 = zext i32 %423 to i64
  %425 = load i16** %5, align 8
  %426 = getelementptr inbounds i16* %425, i64 %424
  %427 = load i16* %426, align 2
  store i16 %427, i16* %s1, align 2
  %428 = load i32* %3, align 4
  %429 = zext i32 %428 to i64
  %430 = load i16** %5, align 8
  %431 = getelementptr inbounds i16* %430, i64 %429
  %432 = load i16* %431, align 2
  store i16 %432, i16* %s2, align 2
  %433 = load i16* %s1, align 2
  %434 = zext i16 %433 to i32
  %435 = load i16* %s2, align 2
  %436 = zext i16 %435 to i32
  %437 = icmp ne i32 %434, %436
  br i1 %437, label %438, label %446

; <label>:438                                     ; preds = %422
  %439 = load i16* %s1, align 2
  %440 = zext i16 %439 to i32
  %441 = load i16* %s2, align 2
  %442 = zext i16 %441 to i32
  %443 = icmp sgt i32 %440, %442
  %444 = zext i1 %443 to i32
  %445 = trunc i32 %444 to i8
  store i8 %445, i8* %1
  br label %788

; <label>:446                                     ; preds = %422
  %447 = load i32* %2, align 4
  %448 = add i32 %447, 1
  store i32 %448, i32* %2, align 4
  %449 = load i32* %3, align 4
  %450 = add i32 %449, 1
  store i32 %450, i32* %3, align 4
  %451 = load i32* %2, align 4
  %452 = zext i32 %451 to i64
  %453 = load i8** %4, align 8
  %454 = getelementptr inbounds i8* %453, i64 %452
  %455 = load i8* %454, align 1
  store i8 %455, i8* %c1, align 1
  %456 = load i32* %3, align 4
  %457 = zext i32 %456 to i64
  %458 = load i8** %4, align 8
  %459 = getelementptr inbounds i8* %458, i64 %457
  %460 = load i8* %459, align 1
  store i8 %460, i8* %c2, align 1
  %461 = load i8* %c1, align 1
  %462 = zext i8 %461 to i32
  %463 = load i8* %c2, align 1
  %464 = zext i8 %463 to i32
  %465 = icmp ne i32 %462, %464
  br i1 %465, label %466, label %474

; <label>:466                                     ; preds = %446
  %467 = load i8* %c1, align 1
  %468 = zext i8 %467 to i32
  %469 = load i8* %c2, align 1
  %470 = zext i8 %469 to i32
  %471 = icmp sgt i32 %468, %470
  %472 = zext i1 %471 to i32
  %473 = trunc i32 %472 to i8
  store i8 %473, i8* %1
  br label %788

; <label>:474                                     ; preds = %446
  %475 = load i32* %2, align 4
  %476 = zext i32 %475 to i64
  %477 = load i16** %5, align 8
  %478 = getelementptr inbounds i16* %477, i64 %476
  %479 = load i16* %478, align 2
  store i16 %479, i16* %s1, align 2
  %480 = load i32* %3, align 4
  %481 = zext i32 %480 to i64
  %482 = load i16** %5, align 8
  %483 = getelementptr inbounds i16* %482, i64 %481
  %484 = load i16* %483, align 2
  store i16 %484, i16* %s2, align 2
  %485 = load i16* %s1, align 2
  %486 = zext i16 %485 to i32
  %487 = load i16* %s2, align 2
  %488 = zext i16 %487 to i32
  %489 = icmp ne i32 %486, %488
  br i1 %489, label %490, label %498

; <label>:490                                     ; preds = %474
  %491 = load i16* %s1, align 2
  %492 = zext i16 %491 to i32
  %493 = load i16* %s2, align 2
  %494 = zext i16 %493 to i32
  %495 = icmp sgt i32 %492, %494
  %496 = zext i1 %495 to i32
  %497 = trunc i32 %496 to i8
  store i8 %497, i8* %1
  br label %788

; <label>:498                                     ; preds = %474
  %499 = load i32* %2, align 4
  %500 = add i32 %499, 1
  store i32 %500, i32* %2, align 4
  %501 = load i32* %3, align 4
  %502 = add i32 %501, 1
  store i32 %502, i32* %3, align 4
  %503 = load i32* %2, align 4
  %504 = zext i32 %503 to i64
  %505 = load i8** %4, align 8
  %506 = getelementptr inbounds i8* %505, i64 %504
  %507 = load i8* %506, align 1
  store i8 %507, i8* %c1, align 1
  %508 = load i32* %3, align 4
  %509 = zext i32 %508 to i64
  %510 = load i8** %4, align 8
  %511 = getelementptr inbounds i8* %510, i64 %509
  %512 = load i8* %511, align 1
  store i8 %512, i8* %c2, align 1
  %513 = load i8* %c1, align 1
  %514 = zext i8 %513 to i32
  %515 = load i8* %c2, align 1
  %516 = zext i8 %515 to i32
  %517 = icmp ne i32 %514, %516
  br i1 %517, label %518, label %526

; <label>:518                                     ; preds = %498
  %519 = load i8* %c1, align 1
  %520 = zext i8 %519 to i32
  %521 = load i8* %c2, align 1
  %522 = zext i8 %521 to i32
  %523 = icmp sgt i32 %520, %522
  %524 = zext i1 %523 to i32
  %525 = trunc i32 %524 to i8
  store i8 %525, i8* %1
  br label %788

; <label>:526                                     ; preds = %498
  %527 = load i32* %2, align 4
  %528 = zext i32 %527 to i64
  %529 = load i16** %5, align 8
  %530 = getelementptr inbounds i16* %529, i64 %528
  %531 = load i16* %530, align 2
  store i16 %531, i16* %s1, align 2
  %532 = load i32* %3, align 4
  %533 = zext i32 %532 to i64
  %534 = load i16** %5, align 8
  %535 = getelementptr inbounds i16* %534, i64 %533
  %536 = load i16* %535, align 2
  store i16 %536, i16* %s2, align 2
  %537 = load i16* %s1, align 2
  %538 = zext i16 %537 to i32
  %539 = load i16* %s2, align 2
  %540 = zext i16 %539 to i32
  %541 = icmp ne i32 %538, %540
  br i1 %541, label %542, label %550

; <label>:542                                     ; preds = %526
  %543 = load i16* %s1, align 2
  %544 = zext i16 %543 to i32
  %545 = load i16* %s2, align 2
  %546 = zext i16 %545 to i32
  %547 = icmp sgt i32 %544, %546
  %548 = zext i1 %547 to i32
  %549 = trunc i32 %548 to i8
  store i8 %549, i8* %1
  br label %788

; <label>:550                                     ; preds = %526
  %551 = load i32* %2, align 4
  %552 = add i32 %551, 1
  store i32 %552, i32* %2, align 4
  %553 = load i32* %3, align 4
  %554 = add i32 %553, 1
  store i32 %554, i32* %3, align 4
  %555 = load i32* %2, align 4
  %556 = zext i32 %555 to i64
  %557 = load i8** %4, align 8
  %558 = getelementptr inbounds i8* %557, i64 %556
  %559 = load i8* %558, align 1
  store i8 %559, i8* %c1, align 1
  %560 = load i32* %3, align 4
  %561 = zext i32 %560 to i64
  %562 = load i8** %4, align 8
  %563 = getelementptr inbounds i8* %562, i64 %561
  %564 = load i8* %563, align 1
  store i8 %564, i8* %c2, align 1
  %565 = load i8* %c1, align 1
  %566 = zext i8 %565 to i32
  %567 = load i8* %c2, align 1
  %568 = zext i8 %567 to i32
  %569 = icmp ne i32 %566, %568
  br i1 %569, label %570, label %578

; <label>:570                                     ; preds = %550
  %571 = load i8* %c1, align 1
  %572 = zext i8 %571 to i32
  %573 = load i8* %c2, align 1
  %574 = zext i8 %573 to i32
  %575 = icmp sgt i32 %572, %574
  %576 = zext i1 %575 to i32
  %577 = trunc i32 %576 to i8
  store i8 %577, i8* %1
  br label %788

; <label>:578                                     ; preds = %550
  %579 = load i32* %2, align 4
  %580 = zext i32 %579 to i64
  %581 = load i16** %5, align 8
  %582 = getelementptr inbounds i16* %581, i64 %580
  %583 = load i16* %582, align 2
  store i16 %583, i16* %s1, align 2
  %584 = load i32* %3, align 4
  %585 = zext i32 %584 to i64
  %586 = load i16** %5, align 8
  %587 = getelementptr inbounds i16* %586, i64 %585
  %588 = load i16* %587, align 2
  store i16 %588, i16* %s2, align 2
  %589 = load i16* %s1, align 2
  %590 = zext i16 %589 to i32
  %591 = load i16* %s2, align 2
  %592 = zext i16 %591 to i32
  %593 = icmp ne i32 %590, %592
  br i1 %593, label %594, label %602

; <label>:594                                     ; preds = %578
  %595 = load i16* %s1, align 2
  %596 = zext i16 %595 to i32
  %597 = load i16* %s2, align 2
  %598 = zext i16 %597 to i32
  %599 = icmp sgt i32 %596, %598
  %600 = zext i1 %599 to i32
  %601 = trunc i32 %600 to i8
  store i8 %601, i8* %1
  br label %788

; <label>:602                                     ; preds = %578
  %603 = load i32* %2, align 4
  %604 = add i32 %603, 1
  store i32 %604, i32* %2, align 4
  %605 = load i32* %3, align 4
  %606 = add i32 %605, 1
  store i32 %606, i32* %3, align 4
  %607 = load i32* %2, align 4
  %608 = zext i32 %607 to i64
  %609 = load i8** %4, align 8
  %610 = getelementptr inbounds i8* %609, i64 %608
  %611 = load i8* %610, align 1
  store i8 %611, i8* %c1, align 1
  %612 = load i32* %3, align 4
  %613 = zext i32 %612 to i64
  %614 = load i8** %4, align 8
  %615 = getelementptr inbounds i8* %614, i64 %613
  %616 = load i8* %615, align 1
  store i8 %616, i8* %c2, align 1
  %617 = load i8* %c1, align 1
  %618 = zext i8 %617 to i32
  %619 = load i8* %c2, align 1
  %620 = zext i8 %619 to i32
  %621 = icmp ne i32 %618, %620
  br i1 %621, label %622, label %630

; <label>:622                                     ; preds = %602
  %623 = load i8* %c1, align 1
  %624 = zext i8 %623 to i32
  %625 = load i8* %c2, align 1
  %626 = zext i8 %625 to i32
  %627 = icmp sgt i32 %624, %626
  %628 = zext i1 %627 to i32
  %629 = trunc i32 %628 to i8
  store i8 %629, i8* %1
  br label %788

; <label>:630                                     ; preds = %602
  %631 = load i32* %2, align 4
  %632 = zext i32 %631 to i64
  %633 = load i16** %5, align 8
  %634 = getelementptr inbounds i16* %633, i64 %632
  %635 = load i16* %634, align 2
  store i16 %635, i16* %s1, align 2
  %636 = load i32* %3, align 4
  %637 = zext i32 %636 to i64
  %638 = load i16** %5, align 8
  %639 = getelementptr inbounds i16* %638, i64 %637
  %640 = load i16* %639, align 2
  store i16 %640, i16* %s2, align 2
  %641 = load i16* %s1, align 2
  %642 = zext i16 %641 to i32
  %643 = load i16* %s2, align 2
  %644 = zext i16 %643 to i32
  %645 = icmp ne i32 %642, %644
  br i1 %645, label %646, label %654

; <label>:646                                     ; preds = %630
  %647 = load i16* %s1, align 2
  %648 = zext i16 %647 to i32
  %649 = load i16* %s2, align 2
  %650 = zext i16 %649 to i32
  %651 = icmp sgt i32 %648, %650
  %652 = zext i1 %651 to i32
  %653 = trunc i32 %652 to i8
  store i8 %653, i8* %1
  br label %788

; <label>:654                                     ; preds = %630
  %655 = load i32* %2, align 4
  %656 = add i32 %655, 1
  store i32 %656, i32* %2, align 4
  %657 = load i32* %3, align 4
  %658 = add i32 %657, 1
  store i32 %658, i32* %3, align 4
  %659 = load i32* %2, align 4
  %660 = zext i32 %659 to i64
  %661 = load i8** %4, align 8
  %662 = getelementptr inbounds i8* %661, i64 %660
  %663 = load i8* %662, align 1
  store i8 %663, i8* %c1, align 1
  %664 = load i32* %3, align 4
  %665 = zext i32 %664 to i64
  %666 = load i8** %4, align 8
  %667 = getelementptr inbounds i8* %666, i64 %665
  %668 = load i8* %667, align 1
  store i8 %668, i8* %c2, align 1
  %669 = load i8* %c1, align 1
  %670 = zext i8 %669 to i32
  %671 = load i8* %c2, align 1
  %672 = zext i8 %671 to i32
  %673 = icmp ne i32 %670, %672
  br i1 %673, label %674, label %682

; <label>:674                                     ; preds = %654
  %675 = load i8* %c1, align 1
  %676 = zext i8 %675 to i32
  %677 = load i8* %c2, align 1
  %678 = zext i8 %677 to i32
  %679 = icmp sgt i32 %676, %678
  %680 = zext i1 %679 to i32
  %681 = trunc i32 %680 to i8
  store i8 %681, i8* %1
  br label %788

; <label>:682                                     ; preds = %654
  %683 = load i32* %2, align 4
  %684 = zext i32 %683 to i64
  %685 = load i16** %5, align 8
  %686 = getelementptr inbounds i16* %685, i64 %684
  %687 = load i16* %686, align 2
  store i16 %687, i16* %s1, align 2
  %688 = load i32* %3, align 4
  %689 = zext i32 %688 to i64
  %690 = load i16** %5, align 8
  %691 = getelementptr inbounds i16* %690, i64 %689
  %692 = load i16* %691, align 2
  store i16 %692, i16* %s2, align 2
  %693 = load i16* %s1, align 2
  %694 = zext i16 %693 to i32
  %695 = load i16* %s2, align 2
  %696 = zext i16 %695 to i32
  %697 = icmp ne i32 %694, %696
  br i1 %697, label %698, label %706

; <label>:698                                     ; preds = %682
  %699 = load i16* %s1, align 2
  %700 = zext i16 %699 to i32
  %701 = load i16* %s2, align 2
  %702 = zext i16 %701 to i32
  %703 = icmp sgt i32 %700, %702
  %704 = zext i1 %703 to i32
  %705 = trunc i32 %704 to i8
  store i8 %705, i8* %1
  br label %788

; <label>:706                                     ; preds = %682
  %707 = load i32* %2, align 4
  %708 = add i32 %707, 1
  store i32 %708, i32* %2, align 4
  %709 = load i32* %3, align 4
  %710 = add i32 %709, 1
  store i32 %710, i32* %3, align 4
  %711 = load i32* %2, align 4
  %712 = zext i32 %711 to i64
  %713 = load i8** %4, align 8
  %714 = getelementptr inbounds i8* %713, i64 %712
  %715 = load i8* %714, align 1
  store i8 %715, i8* %c1, align 1
  %716 = load i32* %3, align 4
  %717 = zext i32 %716 to i64
  %718 = load i8** %4, align 8
  %719 = getelementptr inbounds i8* %718, i64 %717
  %720 = load i8* %719, align 1
  store i8 %720, i8* %c2, align 1
  %721 = load i8* %c1, align 1
  %722 = zext i8 %721 to i32
  %723 = load i8* %c2, align 1
  %724 = zext i8 %723 to i32
  %725 = icmp ne i32 %722, %724
  br i1 %725, label %726, label %734

; <label>:726                                     ; preds = %706
  %727 = load i8* %c1, align 1
  %728 = zext i8 %727 to i32
  %729 = load i8* %c2, align 1
  %730 = zext i8 %729 to i32
  %731 = icmp sgt i32 %728, %730
  %732 = zext i1 %731 to i32
  %733 = trunc i32 %732 to i8
  store i8 %733, i8* %1
  br label %788

; <label>:734                                     ; preds = %706
  %735 = load i32* %2, align 4
  %736 = zext i32 %735 to i64
  %737 = load i16** %5, align 8
  %738 = getelementptr inbounds i16* %737, i64 %736
  %739 = load i16* %738, align 2
  store i16 %739, i16* %s1, align 2
  %740 = load i32* %3, align 4
  %741 = zext i32 %740 to i64
  %742 = load i16** %5, align 8
  %743 = getelementptr inbounds i16* %742, i64 %741
  %744 = load i16* %743, align 2
  store i16 %744, i16* %s2, align 2
  %745 = load i16* %s1, align 2
  %746 = zext i16 %745 to i32
  %747 = load i16* %s2, align 2
  %748 = zext i16 %747 to i32
  %749 = icmp ne i32 %746, %748
  br i1 %749, label %750, label %758

; <label>:750                                     ; preds = %734
  %751 = load i16* %s1, align 2
  %752 = zext i16 %751 to i32
  %753 = load i16* %s2, align 2
  %754 = zext i16 %753 to i32
  %755 = icmp sgt i32 %752, %754
  %756 = zext i1 %755 to i32
  %757 = trunc i32 %756 to i8
  store i8 %757, i8* %1
  br label %788

; <label>:758                                     ; preds = %734
  %759 = load i32* %2, align 4
  %760 = add i32 %759, 1
  store i32 %760, i32* %2, align 4
  %761 = load i32* %3, align 4
  %762 = add i32 %761, 1
  store i32 %762, i32* %3, align 4
  %763 = load i32* %2, align 4
  %764 = load i32* %6, align 4
  %765 = icmp uge i32 %763, %764
  br i1 %765, label %766, label %770

; <label>:766                                     ; preds = %758
  %767 = load i32* %6, align 4
  %768 = load i32* %2, align 4
  %769 = sub i32 %768, %767
  store i32 %769, i32* %2, align 4
  br label %770

; <label>:770                                     ; preds = %766, %758
  %771 = load i32* %3, align 4
  %772 = load i32* %6, align 4
  %773 = icmp uge i32 %771, %772
  br i1 %773, label %774, label %778

; <label>:774                                     ; preds = %770
  %775 = load i32* %6, align 4
  %776 = load i32* %3, align 4
  %777 = sub i32 %776, %775
  store i32 %777, i32* %3, align 4
  br label %778

; <label>:778                                     ; preds = %774, %770
  %779 = load i32* %k, align 4
  %780 = sub nsw i32 %779, 8
  store i32 %780, i32* %k, align 4
  %781 = load i32** %7, align 8
  %782 = load i32* %781, align 4
  %783 = add nsw i32 %782, -1
  store i32 %783, i32* %781, align 4
  br label %784

; <label>:784                                     ; preds = %778
  %785 = load i32* %k, align 4
  %786 = icmp sge i32 %785, 0
  br i1 %786, label %346, label %787

; <label>:787                                     ; preds = %784
  store i8 0, i8* %1
  br label %788

; <label>:788                                     ; preds = %787, %750, %726, %698, %674, %646, %622, %594, %570, %542, %518, %490, %466, %438, %414, %386, %362, %331, %303, %275, %247, %219, %191, %163, %135, %107, %79, %51, %23
  %789 = load i8* %1
  ret i8 %789
}

; Function Attrs: nounwind uwtable
define internal void @fallbackQSort3(i32* %fmap, i32* %eclass, i32 %loSt, i32 %hiSt) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %unLo = alloca i32, align 4
  %unHi = alloca i32, align 4
  %ltLo = alloca i32, align 4
  %gtHi = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %sp = alloca i32, align 4
  %lo = alloca i32, align 4
  %hi = alloca i32, align 4
  %med = alloca i32, align 4
  %r = alloca i32, align 4
  %r3 = alloca i32, align 4
  %stackLo = alloca [100 x i32], align 16
  %stackHi = alloca [100 x i32], align 16
  %zztmp = alloca i32, align 4
  %zztmp1 = alloca i32, align 4
  %zztmp2 = alloca i32, align 4
  %yyp1 = alloca i32, align 4
  %yyp2 = alloca i32, align 4
  %yyn = alloca i32, align 4
  %zztmp3 = alloca i32, align 4
  %yyp14 = alloca i32, align 4
  %yyp25 = alloca i32, align 4
  %yyn6 = alloca i32, align 4
  %zztmp7 = alloca i32, align 4
  store i32* %fmap, i32** %1, align 8
  store i32* %eclass, i32** %2, align 8
  store i32 %loSt, i32* %3, align 4
  store i32 %hiSt, i32* %4, align 4
  store i32 0, i32* %r, align 4
  store i32 0, i32* %sp, align 4
  %5 = load i32* %3, align 4
  %6 = load i32* %sp, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %7
  store i32 %5, i32* %8, align 4
  %9 = load i32* %4, align 4
  %10 = load i32* %sp, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %11
  store i32 %9, i32* %12, align 4
  %13 = load i32* %sp, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %sp, align 4
  br label %15

; <label>:15                                      ; preds = %394, %226, %37, %0
  %16 = load i32* %sp, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %395

; <label>:18                                      ; preds = %15
  %19 = load i32* %sp, align 4
  %20 = icmp slt i32 %19, 100
  br i1 %20, label %22, label %21

; <label>:21                                      ; preds = %18
  call void @BZ2_bz__AssertH__fail(i32 1004)
  br label %22

; <label>:22                                      ; preds = %21, %18
  %23 = load i32* %sp, align 4
  %24 = add nsw i32 %23, -1
  store i32 %24, i32* %sp, align 4
  %25 = load i32* %sp, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %26
  %28 = load i32* %27, align 4
  store i32 %28, i32* %lo, align 4
  %29 = load i32* %sp, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %30
  %32 = load i32* %31, align 4
  store i32 %32, i32* %hi, align 4
  %33 = load i32* %hi, align 4
  %34 = load i32* %lo, align 4
  %35 = sub nsw i32 %33, %34
  %36 = icmp slt i32 %35, 10
  br i1 %36, label %37, label %42

; <label>:37                                      ; preds = %22
  %38 = load i32** %1, align 8
  %39 = load i32** %2, align 8
  %40 = load i32* %lo, align 4
  %41 = load i32* %hi, align 4
  call void @fallbackSimpleSort(i32* %38, i32* %39, i32 %40, i32 %41)
  br label %15

; <label>:42                                      ; preds = %22
  %43 = load i32* %r, align 4
  %44 = mul i32 %43, 7621
  %45 = add i32 %44, 1
  %46 = urem i32 %45, 32768
  store i32 %46, i32* %r, align 4
  %47 = load i32* %r, align 4
  %48 = urem i32 %47, 3
  store i32 %48, i32* %r3, align 4
  %49 = load i32* %r3, align 4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %61

; <label>:51                                      ; preds = %42
  %52 = load i32* %lo, align 4
  %53 = sext i32 %52 to i64
  %54 = load i32** %1, align 8
  %55 = getelementptr inbounds i32* %54, i64 %53
  %56 = load i32* %55, align 4
  %57 = zext i32 %56 to i64
  %58 = load i32** %2, align 8
  %59 = getelementptr inbounds i32* %58, i64 %57
  %60 = load i32* %59, align 4
  store i32 %60, i32* %med, align 4
  br label %88

; <label>:61                                      ; preds = %42
  %62 = load i32* %r3, align 4
  %63 = icmp eq i32 %62, 1
  br i1 %63, label %64, label %77

; <label>:64                                      ; preds = %61
  %65 = load i32* %lo, align 4
  %66 = load i32* %hi, align 4
  %67 = add nsw i32 %65, %66
  %68 = ashr i32 %67, 1
  %69 = sext i32 %68 to i64
  %70 = load i32** %1, align 8
  %71 = getelementptr inbounds i32* %70, i64 %69
  %72 = load i32* %71, align 4
  %73 = zext i32 %72 to i64
  %74 = load i32** %2, align 8
  %75 = getelementptr inbounds i32* %74, i64 %73
  %76 = load i32* %75, align 4
  store i32 %76, i32* %med, align 4
  br label %87

; <label>:77                                      ; preds = %61
  %78 = load i32* %hi, align 4
  %79 = sext i32 %78 to i64
  %80 = load i32** %1, align 8
  %81 = getelementptr inbounds i32* %80, i64 %79
  %82 = load i32* %81, align 4
  %83 = zext i32 %82 to i64
  %84 = load i32** %2, align 8
  %85 = getelementptr inbounds i32* %84, i64 %83
  %86 = load i32* %85, align 4
  store i32 %86, i32* %med, align 4
  br label %87

; <label>:87                                      ; preds = %77, %64
  br label %88

; <label>:88                                      ; preds = %87, %51
  %89 = load i32* %lo, align 4
  store i32 %89, i32* %ltLo, align 4
  store i32 %89, i32* %unLo, align 4
  %90 = load i32* %hi, align 4
  store i32 %90, i32* %gtHi, align 4
  store i32 %90, i32* %unHi, align 4
  br label %91

; <label>:91                                      ; preds = %88, %198
  br label %92

; <label>:92                                      ; preds = %91, %111, %139
  %93 = load i32* %unLo, align 4
  %94 = load i32* %unHi, align 4
  %95 = icmp sgt i32 %93, %94
  br i1 %95, label %96, label %97

; <label>:96                                      ; preds = %92
  br label %142

; <label>:97                                      ; preds = %92
  %98 = load i32* %unLo, align 4
  %99 = sext i32 %98 to i64
  %100 = load i32** %1, align 8
  %101 = getelementptr inbounds i32* %100, i64 %99
  %102 = load i32* %101, align 4
  %103 = zext i32 %102 to i64
  %104 = load i32** %2, align 8
  %105 = getelementptr inbounds i32* %104, i64 %103
  %106 = load i32* %105, align 4
  %107 = load i32* %med, align 4
  %108 = sub nsw i32 %106, %107
  store i32 %108, i32* %n, align 4
  %109 = load i32* %n, align 4
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %135

; <label>:111                                     ; preds = %97
  %112 = load i32* %unLo, align 4
  %113 = sext i32 %112 to i64
  %114 = load i32** %1, align 8
  %115 = getelementptr inbounds i32* %114, i64 %113
  %116 = load i32* %115, align 4
  store i32 %116, i32* %zztmp, align 4
  %117 = load i32* %ltLo, align 4
  %118 = sext i32 %117 to i64
  %119 = load i32** %1, align 8
  %120 = getelementptr inbounds i32* %119, i64 %118
  %121 = load i32* %120, align 4
  %122 = load i32* %unLo, align 4
  %123 = sext i32 %122 to i64
  %124 = load i32** %1, align 8
  %125 = getelementptr inbounds i32* %124, i64 %123
  store i32 %121, i32* %125, align 4
  %126 = load i32* %zztmp, align 4
  %127 = load i32* %ltLo, align 4
  %128 = sext i32 %127 to i64
  %129 = load i32** %1, align 8
  %130 = getelementptr inbounds i32* %129, i64 %128
  store i32 %126, i32* %130, align 4
  %131 = load i32* %ltLo, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %ltLo, align 4
  %133 = load i32* %unLo, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %unLo, align 4
  br label %92

; <label>:135                                     ; preds = %97
  %136 = load i32* %n, align 4
  %137 = icmp sgt i32 %136, 0
  br i1 %137, label %138, label %139

; <label>:138                                     ; preds = %135
  br label %142

; <label>:139                                     ; preds = %135
  %140 = load i32* %unLo, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, i32* %unLo, align 4
  br label %92

; <label>:142                                     ; preds = %138, %96
  br label %143

; <label>:143                                     ; preds = %142, %162, %190
  %144 = load i32* %unLo, align 4
  %145 = load i32* %unHi, align 4
  %146 = icmp sgt i32 %144, %145
  br i1 %146, label %147, label %148

; <label>:147                                     ; preds = %143
  br label %193

; <label>:148                                     ; preds = %143
  %149 = load i32* %unHi, align 4
  %150 = sext i32 %149 to i64
  %151 = load i32** %1, align 8
  %152 = getelementptr inbounds i32* %151, i64 %150
  %153 = load i32* %152, align 4
  %154 = zext i32 %153 to i64
  %155 = load i32** %2, align 8
  %156 = getelementptr inbounds i32* %155, i64 %154
  %157 = load i32* %156, align 4
  %158 = load i32* %med, align 4
  %159 = sub nsw i32 %157, %158
  store i32 %159, i32* %n, align 4
  %160 = load i32* %n, align 4
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %162, label %186

; <label>:162                                     ; preds = %148
  %163 = load i32* %unHi, align 4
  %164 = sext i32 %163 to i64
  %165 = load i32** %1, align 8
  %166 = getelementptr inbounds i32* %165, i64 %164
  %167 = load i32* %166, align 4
  store i32 %167, i32* %zztmp1, align 4
  %168 = load i32* %gtHi, align 4
  %169 = sext i32 %168 to i64
  %170 = load i32** %1, align 8
  %171 = getelementptr inbounds i32* %170, i64 %169
  %172 = load i32* %171, align 4
  %173 = load i32* %unHi, align 4
  %174 = sext i32 %173 to i64
  %175 = load i32** %1, align 8
  %176 = getelementptr inbounds i32* %175, i64 %174
  store i32 %172, i32* %176, align 4
  %177 = load i32* %zztmp1, align 4
  %178 = load i32* %gtHi, align 4
  %179 = sext i32 %178 to i64
  %180 = load i32** %1, align 8
  %181 = getelementptr inbounds i32* %180, i64 %179
  store i32 %177, i32* %181, align 4
  %182 = load i32* %gtHi, align 4
  %183 = add nsw i32 %182, -1
  store i32 %183, i32* %gtHi, align 4
  %184 = load i32* %unHi, align 4
  %185 = add nsw i32 %184, -1
  store i32 %185, i32* %unHi, align 4
  br label %143

; <label>:186                                     ; preds = %148
  %187 = load i32* %n, align 4
  %188 = icmp slt i32 %187, 0
  br i1 %188, label %189, label %190

; <label>:189                                     ; preds = %186
  br label %193

; <label>:190                                     ; preds = %186
  %191 = load i32* %unHi, align 4
  %192 = add nsw i32 %191, -1
  store i32 %192, i32* %unHi, align 4
  br label %143

; <label>:193                                     ; preds = %189, %147
  %194 = load i32* %unLo, align 4
  %195 = load i32* %unHi, align 4
  %196 = icmp sgt i32 %194, %195
  br i1 %196, label %197, label %198

; <label>:197                                     ; preds = %193
  br label %222

; <label>:198                                     ; preds = %193
  %199 = load i32* %unLo, align 4
  %200 = sext i32 %199 to i64
  %201 = load i32** %1, align 8
  %202 = getelementptr inbounds i32* %201, i64 %200
  %203 = load i32* %202, align 4
  store i32 %203, i32* %zztmp2, align 4
  %204 = load i32* %unHi, align 4
  %205 = sext i32 %204 to i64
  %206 = load i32** %1, align 8
  %207 = getelementptr inbounds i32* %206, i64 %205
  %208 = load i32* %207, align 4
  %209 = load i32* %unLo, align 4
  %210 = sext i32 %209 to i64
  %211 = load i32** %1, align 8
  %212 = getelementptr inbounds i32* %211, i64 %210
  store i32 %208, i32* %212, align 4
  %213 = load i32* %zztmp2, align 4
  %214 = load i32* %unHi, align 4
  %215 = sext i32 %214 to i64
  %216 = load i32** %1, align 8
  %217 = getelementptr inbounds i32* %216, i64 %215
  store i32 %213, i32* %217, align 4
  %218 = load i32* %unLo, align 4
  %219 = add nsw i32 %218, 1
  store i32 %219, i32* %unLo, align 4
  %220 = load i32* %unHi, align 4
  %221 = add nsw i32 %220, -1
  store i32 %221, i32* %unHi, align 4
  br label %91

; <label>:222                                     ; preds = %197
  %223 = load i32* %gtHi, align 4
  %224 = load i32* %ltLo, align 4
  %225 = icmp slt i32 %223, %224
  br i1 %225, label %226, label %227

; <label>:226                                     ; preds = %222
  br label %15

; <label>:227                                     ; preds = %222
  %228 = load i32* %ltLo, align 4
  %229 = load i32* %lo, align 4
  %230 = sub nsw i32 %228, %229
  %231 = load i32* %unLo, align 4
  %232 = load i32* %ltLo, align 4
  %233 = sub nsw i32 %231, %232
  %234 = icmp slt i32 %230, %233
  br i1 %234, label %235, label %239

; <label>:235                                     ; preds = %227
  %236 = load i32* %ltLo, align 4
  %237 = load i32* %lo, align 4
  %238 = sub nsw i32 %236, %237
  br label %243

; <label>:239                                     ; preds = %227
  %240 = load i32* %unLo, align 4
  %241 = load i32* %ltLo, align 4
  %242 = sub nsw i32 %240, %241
  br label %243

; <label>:243                                     ; preds = %239, %235
  %244 = phi i32 [ %238, %235 ], [ %242, %239 ]
  store i32 %244, i32* %n, align 4
  %245 = load i32* %lo, align 4
  store i32 %245, i32* %yyp1, align 4
  %246 = load i32* %unLo, align 4
  %247 = load i32* %n, align 4
  %248 = sub nsw i32 %246, %247
  store i32 %248, i32* %yyp2, align 4
  %249 = load i32* %n, align 4
  store i32 %249, i32* %yyn, align 4
  br label %250

; <label>:250                                     ; preds = %253, %243
  %251 = load i32* %yyn, align 4
  %252 = icmp sgt i32 %251, 0
  br i1 %252, label %253, label %279

; <label>:253                                     ; preds = %250
  %254 = load i32* %yyp1, align 4
  %255 = sext i32 %254 to i64
  %256 = load i32** %1, align 8
  %257 = getelementptr inbounds i32* %256, i64 %255
  %258 = load i32* %257, align 4
  store i32 %258, i32* %zztmp3, align 4
  %259 = load i32* %yyp2, align 4
  %260 = sext i32 %259 to i64
  %261 = load i32** %1, align 8
  %262 = getelementptr inbounds i32* %261, i64 %260
  %263 = load i32* %262, align 4
  %264 = load i32* %yyp1, align 4
  %265 = sext i32 %264 to i64
  %266 = load i32** %1, align 8
  %267 = getelementptr inbounds i32* %266, i64 %265
  store i32 %263, i32* %267, align 4
  %268 = load i32* %zztmp3, align 4
  %269 = load i32* %yyp2, align 4
  %270 = sext i32 %269 to i64
  %271 = load i32** %1, align 8
  %272 = getelementptr inbounds i32* %271, i64 %270
  store i32 %268, i32* %272, align 4
  %273 = load i32* %yyp1, align 4
  %274 = add nsw i32 %273, 1
  store i32 %274, i32* %yyp1, align 4
  %275 = load i32* %yyp2, align 4
  %276 = add nsw i32 %275, 1
  store i32 %276, i32* %yyp2, align 4
  %277 = load i32* %yyn, align 4
  %278 = add nsw i32 %277, -1
  store i32 %278, i32* %yyn, align 4
  br label %250

; <label>:279                                     ; preds = %250
  %280 = load i32* %hi, align 4
  %281 = load i32* %gtHi, align 4
  %282 = sub nsw i32 %280, %281
  %283 = load i32* %gtHi, align 4
  %284 = load i32* %unHi, align 4
  %285 = sub nsw i32 %283, %284
  %286 = icmp slt i32 %282, %285
  br i1 %286, label %287, label %291

; <label>:287                                     ; preds = %279
  %288 = load i32* %hi, align 4
  %289 = load i32* %gtHi, align 4
  %290 = sub nsw i32 %288, %289
  br label %295

; <label>:291                                     ; preds = %279
  %292 = load i32* %gtHi, align 4
  %293 = load i32* %unHi, align 4
  %294 = sub nsw i32 %292, %293
  br label %295

; <label>:295                                     ; preds = %291, %287
  %296 = phi i32 [ %290, %287 ], [ %294, %291 ]
  store i32 %296, i32* %m, align 4
  %297 = load i32* %unLo, align 4
  store i32 %297, i32* %yyp14, align 4
  %298 = load i32* %hi, align 4
  %299 = load i32* %m, align 4
  %300 = sub nsw i32 %298, %299
  %301 = add nsw i32 %300, 1
  store i32 %301, i32* %yyp25, align 4
  %302 = load i32* %m, align 4
  store i32 %302, i32* %yyn6, align 4
  br label %303

; <label>:303                                     ; preds = %306, %295
  %304 = load i32* %yyn6, align 4
  %305 = icmp sgt i32 %304, 0
  br i1 %305, label %306, label %332

; <label>:306                                     ; preds = %303
  %307 = load i32* %yyp14, align 4
  %308 = sext i32 %307 to i64
  %309 = load i32** %1, align 8
  %310 = getelementptr inbounds i32* %309, i64 %308
  %311 = load i32* %310, align 4
  store i32 %311, i32* %zztmp7, align 4
  %312 = load i32* %yyp25, align 4
  %313 = sext i32 %312 to i64
  %314 = load i32** %1, align 8
  %315 = getelementptr inbounds i32* %314, i64 %313
  %316 = load i32* %315, align 4
  %317 = load i32* %yyp14, align 4
  %318 = sext i32 %317 to i64
  %319 = load i32** %1, align 8
  %320 = getelementptr inbounds i32* %319, i64 %318
  store i32 %316, i32* %320, align 4
  %321 = load i32* %zztmp7, align 4
  %322 = load i32* %yyp25, align 4
  %323 = sext i32 %322 to i64
  %324 = load i32** %1, align 8
  %325 = getelementptr inbounds i32* %324, i64 %323
  store i32 %321, i32* %325, align 4
  %326 = load i32* %yyp14, align 4
  %327 = add nsw i32 %326, 1
  store i32 %327, i32* %yyp14, align 4
  %328 = load i32* %yyp25, align 4
  %329 = add nsw i32 %328, 1
  store i32 %329, i32* %yyp25, align 4
  %330 = load i32* %yyn6, align 4
  %331 = add nsw i32 %330, -1
  store i32 %331, i32* %yyn6, align 4
  br label %303

; <label>:332                                     ; preds = %303
  %333 = load i32* %lo, align 4
  %334 = load i32* %unLo, align 4
  %335 = add nsw i32 %333, %334
  %336 = load i32* %ltLo, align 4
  %337 = sub nsw i32 %335, %336
  %338 = sub nsw i32 %337, 1
  store i32 %338, i32* %n, align 4
  %339 = load i32* %hi, align 4
  %340 = load i32* %gtHi, align 4
  %341 = load i32* %unHi, align 4
  %342 = sub nsw i32 %340, %341
  %343 = sub nsw i32 %339, %342
  %344 = add nsw i32 %343, 1
  store i32 %344, i32* %m, align 4
  %345 = load i32* %n, align 4
  %346 = load i32* %lo, align 4
  %347 = sub nsw i32 %345, %346
  %348 = load i32* %hi, align 4
  %349 = load i32* %m, align 4
  %350 = sub nsw i32 %348, %349
  %351 = icmp sgt i32 %347, %350
  br i1 %351, label %352, label %373

; <label>:352                                     ; preds = %332
  %353 = load i32* %lo, align 4
  %354 = load i32* %sp, align 4
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %355
  store i32 %353, i32* %356, align 4
  %357 = load i32* %n, align 4
  %358 = load i32* %sp, align 4
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %359
  store i32 %357, i32* %360, align 4
  %361 = load i32* %sp, align 4
  %362 = add nsw i32 %361, 1
  store i32 %362, i32* %sp, align 4
  %363 = load i32* %m, align 4
  %364 = load i32* %sp, align 4
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %365
  store i32 %363, i32* %366, align 4
  %367 = load i32* %hi, align 4
  %368 = load i32* %sp, align 4
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %369
  store i32 %367, i32* %370, align 4
  %371 = load i32* %sp, align 4
  %372 = add nsw i32 %371, 1
  store i32 %372, i32* %sp, align 4
  br label %394

; <label>:373                                     ; preds = %332
  %374 = load i32* %m, align 4
  %375 = load i32* %sp, align 4
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %376
  store i32 %374, i32* %377, align 4
  %378 = load i32* %hi, align 4
  %379 = load i32* %sp, align 4
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %380
  store i32 %378, i32* %381, align 4
  %382 = load i32* %sp, align 4
  %383 = add nsw i32 %382, 1
  store i32 %383, i32* %sp, align 4
  %384 = load i32* %lo, align 4
  %385 = load i32* %sp, align 4
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %386
  store i32 %384, i32* %387, align 4
  %388 = load i32* %n, align 4
  %389 = load i32* %sp, align 4
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %390
  store i32 %388, i32* %391, align 4
  %392 = load i32* %sp, align 4
  %393 = add nsw i32 %392, 1
  store i32 %393, i32* %sp, align 4
  br label %394

; <label>:394                                     ; preds = %373, %352
  br label %15

; <label>:395                                     ; preds = %15
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal void @fallbackSimpleSort(i32* %fmap, i32* %eclass, i32 %lo, i32 %hi) #2 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %tmp = alloca i32, align 4
  %ec_tmp = alloca i32, align 4
  store i32* %fmap, i32** %1, align 8
  store i32* %eclass, i32** %2, align 8
  store i32 %lo, i32* %3, align 4
  store i32 %hi, i32* %4, align 4
  %5 = load i32* %3, align 4
  %6 = load i32* %4, align 4
  %7 = icmp eq i32 %5, %6
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %139

; <label>:9                                       ; preds = %0
  %10 = load i32* %4, align 4
  %11 = load i32* %3, align 4
  %12 = sub nsw i32 %10, %11
  %13 = icmp sgt i32 %12, 3
  br i1 %13, label %14, label %77

; <label>:14                                      ; preds = %9
  %15 = load i32* %4, align 4
  %16 = sub nsw i32 %15, 4
  store i32 %16, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %73, %14
  %18 = load i32* %i, align 4
  %19 = load i32* %3, align 4
  %20 = icmp sge i32 %18, %19
  br i1 %20, label %21, label %76

; <label>:21                                      ; preds = %17
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = load i32** %1, align 8
  %25 = getelementptr inbounds i32* %24, i64 %23
  %26 = load i32* %25, align 4
  store i32 %26, i32* %tmp, align 4
  %27 = load i32* %tmp, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32** %2, align 8
  %30 = getelementptr inbounds i32* %29, i64 %28
  %31 = load i32* %30, align 4
  store i32 %31, i32* %ec_tmp, align 4
  %32 = load i32* %i, align 4
  %33 = add nsw i32 %32, 4
  store i32 %33, i32* %j, align 4
  br label %34

; <label>:34                                      ; preds = %63, %21
  %35 = load i32* %j, align 4
  %36 = load i32* %4, align 4
  %37 = icmp sle i32 %35, %36
  br i1 %37, label %38, label %50

; <label>:38                                      ; preds = %34
  %39 = load i32* %ec_tmp, align 4
  %40 = load i32* %j, align 4
  %41 = sext i32 %40 to i64
  %42 = load i32** %1, align 8
  %43 = getelementptr inbounds i32* %42, i64 %41
  %44 = load i32* %43, align 4
  %45 = zext i32 %44 to i64
  %46 = load i32** %2, align 8
  %47 = getelementptr inbounds i32* %46, i64 %45
  %48 = load i32* %47, align 4
  %49 = icmp ugt i32 %39, %48
  br label %50

; <label>:50                                      ; preds = %38, %34
  %51 = phi i1 [ false, %34 ], [ %49, %38 ]
  br i1 %51, label %52, label %66

; <label>:52                                      ; preds = %50
  %53 = load i32* %j, align 4
  %54 = sext i32 %53 to i64
  %55 = load i32** %1, align 8
  %56 = getelementptr inbounds i32* %55, i64 %54
  %57 = load i32* %56, align 4
  %58 = load i32* %j, align 4
  %59 = sub nsw i32 %58, 4
  %60 = sext i32 %59 to i64
  %61 = load i32** %1, align 8
  %62 = getelementptr inbounds i32* %61, i64 %60
  store i32 %57, i32* %62, align 4
  br label %63

; <label>:63                                      ; preds = %52
  %64 = load i32* %j, align 4
  %65 = add nsw i32 %64, 4
  store i32 %65, i32* %j, align 4
  br label %34

; <label>:66                                      ; preds = %50
  %67 = load i32* %tmp, align 4
  %68 = load i32* %j, align 4
  %69 = sub nsw i32 %68, 4
  %70 = sext i32 %69 to i64
  %71 = load i32** %1, align 8
  %72 = getelementptr inbounds i32* %71, i64 %70
  store i32 %67, i32* %72, align 4
  br label %73

; <label>:73                                      ; preds = %66
  %74 = load i32* %i, align 4
  %75 = add nsw i32 %74, -1
  store i32 %75, i32* %i, align 4
  br label %17

; <label>:76                                      ; preds = %17
  br label %77

; <label>:77                                      ; preds = %76, %9
  %78 = load i32* %4, align 4
  %79 = sub nsw i32 %78, 1
  store i32 %79, i32* %i, align 4
  br label %80

; <label>:80                                      ; preds = %136, %77
  %81 = load i32* %i, align 4
  %82 = load i32* %3, align 4
  %83 = icmp sge i32 %81, %82
  br i1 %83, label %84, label %139

; <label>:84                                      ; preds = %80
  %85 = load i32* %i, align 4
  %86 = sext i32 %85 to i64
  %87 = load i32** %1, align 8
  %88 = getelementptr inbounds i32* %87, i64 %86
  %89 = load i32* %88, align 4
  store i32 %89, i32* %tmp, align 4
  %90 = load i32* %tmp, align 4
  %91 = sext i32 %90 to i64
  %92 = load i32** %2, align 8
  %93 = getelementptr inbounds i32* %92, i64 %91
  %94 = load i32* %93, align 4
  store i32 %94, i32* %ec_tmp, align 4
  %95 = load i32* %i, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %j, align 4
  br label %97

; <label>:97                                      ; preds = %126, %84
  %98 = load i32* %j, align 4
  %99 = load i32* %4, align 4
  %100 = icmp sle i32 %98, %99
  br i1 %100, label %101, label %113

; <label>:101                                     ; preds = %97
  %102 = load i32* %ec_tmp, align 4
  %103 = load i32* %j, align 4
  %104 = sext i32 %103 to i64
  %105 = load i32** %1, align 8
  %106 = getelementptr inbounds i32* %105, i64 %104
  %107 = load i32* %106, align 4
  %108 = zext i32 %107 to i64
  %109 = load i32** %2, align 8
  %110 = getelementptr inbounds i32* %109, i64 %108
  %111 = load i32* %110, align 4
  %112 = icmp ugt i32 %102, %111
  br label %113

; <label>:113                                     ; preds = %101, %97
  %114 = phi i1 [ false, %97 ], [ %112, %101 ]
  br i1 %114, label %115, label %129

; <label>:115                                     ; preds = %113
  %116 = load i32* %j, align 4
  %117 = sext i32 %116 to i64
  %118 = load i32** %1, align 8
  %119 = getelementptr inbounds i32* %118, i64 %117
  %120 = load i32* %119, align 4
  %121 = load i32* %j, align 4
  %122 = sub nsw i32 %121, 1
  %123 = sext i32 %122 to i64
  %124 = load i32** %1, align 8
  %125 = getelementptr inbounds i32* %124, i64 %123
  store i32 %120, i32* %125, align 4
  br label %126

; <label>:126                                     ; preds = %115
  %127 = load i32* %j, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %j, align 4
  br label %97

; <label>:129                                     ; preds = %113
  %130 = load i32* %tmp, align 4
  %131 = load i32* %j, align 4
  %132 = sub nsw i32 %131, 1
  %133 = sext i32 %132 to i64
  %134 = load i32** %1, align 8
  %135 = getelementptr inbounds i32* %134, i64 %133
  store i32 %130, i32* %135, align 4
  br label %136

; <label>:136                                     ; preds = %129
  %137 = load i32* %i, align 4
  %138 = add nsw i32 %137, -1
  store i32 %138, i32* %i, align 4
  br label %80

; <label>:139                                     ; preds = %8, %80
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
