; ModuleID = 'lbm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [49 x i8] c"LBM_allocateGrid: could not allocate %.1f MByte\0A\00", align 1
@.str1 = private unnamed_addr constant [40 x i8] c"LBM_allocateGrid: allocated %.1f MByte\0A\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str3 = private unnamed_addr constant [138 x i8] c"LBM_showGridStatistics:\0A\09nObstacleCells: %7i nAccelCells: %7i nFluidCells: %7i\0A\09minRho: %8.4f maxRho: %8.4f mass: %e\0A\09minU: %e maxU: %e\0A\0A\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str6 = private unnamed_addr constant [10 x i8] c"%e %e %e\0A\00", align 1
@.str7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str8 = private unnamed_addr constant [10 x i8] c"%f %f %f\0A\00", align 1
@.str9 = private unnamed_addr constant [50 x i8] c"LBM_compareVelocityField: maxDiff = %e  ==>  %s\0A\0A\00", align 1
@.str10 = private unnamed_addr constant [18 x i8] c"##### ERROR #####\00", align 1
@.str11 = private unnamed_addr constant [3 x i8] c"OK\00", align 1

; Function Attrs: nounwind uwtable
define void @LBM_allocateGrid(double** %ptr) #0 {
  %1 = alloca double**, align 8
  %margin = alloca i64, align 8
  %size = alloca i64, align 8
  store double** %ptr, double*** %1, align 8
  store i64 400000, i64* %margin, align 8
  store i64 214400000, i64* %size, align 8
  %2 = call noalias i8* @malloc(i64 214400000) #4
  %3 = bitcast i8* %2 to double*
  %4 = load double*** %1, align 8
  store double* %3, double** %4, align 8
  %5 = load double*** %1, align 8
  %6 = load double** %5, align 8
  %7 = icmp ne double* %6, null
  br i1 %7, label %10, label %8

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([49 x i8]* @.str, i32 0, i32 0), double 0x40698EF800000000)
  call void @exit(i32 1) #5
  unreachable

; <label>:10                                      ; preds = %0
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str1, i32 0, i32 0), double 0x40698EF800000000)
  %12 = load double*** %1, align 8
  %13 = load double** %12, align 8
  %14 = getelementptr inbounds double* %13, i64 400000
  store double* %14, double** %12, align 8
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define void @LBM_freeGrid(double** %ptr) #0 {
  %1 = alloca double**, align 8
  %margin = alloca i64, align 8
  store double** %ptr, double*** %1, align 8
  store i64 400000, i64* %margin, align 8
  %2 = load double*** %1, align 8
  %3 = load double** %2, align 8
  %4 = getelementptr inbounds double* %3, i64 -400000
  %5 = bitcast double* %4 to i8*
  call void @free(i8* %5) #4
  %6 = load double*** %1, align 8
  store double* null, double** %6, align 8
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @LBM_initializeGrid(double* %grid) #0 {
  %1 = alloca double*, align 8
  %i = alloca i32, align 4
  %_aux_ = alloca i32*, align 8
  store double* %grid, double** %1, align 8
  store i32 -400000, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %109, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 26400000
  br i1 %4, label %5, label %112

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = add nsw i32 0, %6
  %8 = sext i32 %7 to i64
  %9 = load double** %1, align 8
  %10 = getelementptr inbounds double* %9, i64 %8
  store double 0x3FD5555555555555, double* %10, align 8
  %11 = load i32* %i, align 4
  %12 = add nsw i32 1, %11
  %13 = sext i32 %12 to i64
  %14 = load double** %1, align 8
  %15 = getelementptr inbounds double* %14, i64 %13
  store double 0x3FAC71C71C71C71C, double* %15, align 8
  %16 = load i32* %i, align 4
  %17 = add nsw i32 2, %16
  %18 = sext i32 %17 to i64
  %19 = load double** %1, align 8
  %20 = getelementptr inbounds double* %19, i64 %18
  store double 0x3FAC71C71C71C71C, double* %20, align 8
  %21 = load i32* %i, align 4
  %22 = add nsw i32 3, %21
  %23 = sext i32 %22 to i64
  %24 = load double** %1, align 8
  %25 = getelementptr inbounds double* %24, i64 %23
  store double 0x3FAC71C71C71C71C, double* %25, align 8
  %26 = load i32* %i, align 4
  %27 = add nsw i32 4, %26
  %28 = sext i32 %27 to i64
  %29 = load double** %1, align 8
  %30 = getelementptr inbounds double* %29, i64 %28
  store double 0x3FAC71C71C71C71C, double* %30, align 8
  %31 = load i32* %i, align 4
  %32 = add nsw i32 5, %31
  %33 = sext i32 %32 to i64
  %34 = load double** %1, align 8
  %35 = getelementptr inbounds double* %34, i64 %33
  store double 0x3FAC71C71C71C71C, double* %35, align 8
  %36 = load i32* %i, align 4
  %37 = add nsw i32 6, %36
  %38 = sext i32 %37 to i64
  %39 = load double** %1, align 8
  %40 = getelementptr inbounds double* %39, i64 %38
  store double 0x3FAC71C71C71C71C, double* %40, align 8
  %41 = load i32* %i, align 4
  %42 = add nsw i32 7, %41
  %43 = sext i32 %42 to i64
  %44 = load double** %1, align 8
  %45 = getelementptr inbounds double* %44, i64 %43
  store double 0x3F9C71C71C71C71C, double* %45, align 8
  %46 = load i32* %i, align 4
  %47 = add nsw i32 8, %46
  %48 = sext i32 %47 to i64
  %49 = load double** %1, align 8
  %50 = getelementptr inbounds double* %49, i64 %48
  store double 0x3F9C71C71C71C71C, double* %50, align 8
  %51 = load i32* %i, align 4
  %52 = add nsw i32 9, %51
  %53 = sext i32 %52 to i64
  %54 = load double** %1, align 8
  %55 = getelementptr inbounds double* %54, i64 %53
  store double 0x3F9C71C71C71C71C, double* %55, align 8
  %56 = load i32* %i, align 4
  %57 = add nsw i32 10, %56
  %58 = sext i32 %57 to i64
  %59 = load double** %1, align 8
  %60 = getelementptr inbounds double* %59, i64 %58
  store double 0x3F9C71C71C71C71C, double* %60, align 8
  %61 = load i32* %i, align 4
  %62 = add nsw i32 11, %61
  %63 = sext i32 %62 to i64
  %64 = load double** %1, align 8
  %65 = getelementptr inbounds double* %64, i64 %63
  store double 0x3F9C71C71C71C71C, double* %65, align 8
  %66 = load i32* %i, align 4
  %67 = add nsw i32 12, %66
  %68 = sext i32 %67 to i64
  %69 = load double** %1, align 8
  %70 = getelementptr inbounds double* %69, i64 %68
  store double 0x3F9C71C71C71C71C, double* %70, align 8
  %71 = load i32* %i, align 4
  %72 = add nsw i32 13, %71
  %73 = sext i32 %72 to i64
  %74 = load double** %1, align 8
  %75 = getelementptr inbounds double* %74, i64 %73
  store double 0x3F9C71C71C71C71C, double* %75, align 8
  %76 = load i32* %i, align 4
  %77 = add nsw i32 14, %76
  %78 = sext i32 %77 to i64
  %79 = load double** %1, align 8
  %80 = getelementptr inbounds double* %79, i64 %78
  store double 0x3F9C71C71C71C71C, double* %80, align 8
  %81 = load i32* %i, align 4
  %82 = add nsw i32 15, %81
  %83 = sext i32 %82 to i64
  %84 = load double** %1, align 8
  %85 = getelementptr inbounds double* %84, i64 %83
  store double 0x3F9C71C71C71C71C, double* %85, align 8
  %86 = load i32* %i, align 4
  %87 = add nsw i32 16, %86
  %88 = sext i32 %87 to i64
  %89 = load double** %1, align 8
  %90 = getelementptr inbounds double* %89, i64 %88
  store double 0x3F9C71C71C71C71C, double* %90, align 8
  %91 = load i32* %i, align 4
  %92 = add nsw i32 17, %91
  %93 = sext i32 %92 to i64
  %94 = load double** %1, align 8
  %95 = getelementptr inbounds double* %94, i64 %93
  store double 0x3F9C71C71C71C71C, double* %95, align 8
  %96 = load i32* %i, align 4
  %97 = add nsw i32 18, %96
  %98 = sext i32 %97 to i64
  %99 = load double** %1, align 8
  %100 = getelementptr inbounds double* %99, i64 %98
  store double 0x3F9C71C71C71C71C, double* %100, align 8
  %101 = load i32* %i, align 4
  %102 = add nsw i32 19, %101
  %103 = sext i32 %102 to i64
  %104 = load double** %1, align 8
  %105 = getelementptr inbounds double* %104, i64 %103
  %106 = bitcast double* %105 to i8*
  %107 = bitcast i8* %106 to i32*
  store i32* %107, i32** %_aux_, align 8
  %108 = load i32** %_aux_, align 8
  store i32 0, i32* %108, align 4
  br label %109

; <label>:109                                     ; preds = %5
  %110 = load i32* %i, align 4
  %111 = add nsw i32 %110, 20
  store i32 %111, i32* %i, align 4
  br label %2

; <label>:112                                     ; preds = %2
  ret void
}

; Function Attrs: nounwind uwtable
define void @LBM_swapGrids([26000000 x double]** %grid1, [26000000 x double]** %grid2) #0 {
  %1 = alloca [26000000 x double]**, align 8
  %2 = alloca [26000000 x double]**, align 8
  %aux = alloca [26000000 x double]*, align 8
  store [26000000 x double]** %grid1, [26000000 x double]*** %1, align 8
  store [26000000 x double]** %grid2, [26000000 x double]*** %2, align 8
  %3 = load [26000000 x double]*** %1, align 8
  %4 = load [26000000 x double]** %3, align 8
  store [26000000 x double]* %4, [26000000 x double]** %aux, align 8
  %5 = load [26000000 x double]*** %2, align 8
  %6 = load [26000000 x double]** %5, align 8
  %7 = load [26000000 x double]*** %1, align 8
  store [26000000 x double]* %6, [26000000 x double]** %7, align 8
  %8 = load [26000000 x double]** %aux, align 8
  %9 = load [26000000 x double]*** %2, align 8
  store [26000000 x double]* %8, [26000000 x double]** %9, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @LBM_loadObstacleFile(double* %grid, i8* %filename) #0 {
  %1 = alloca double*, align 8
  %2 = alloca i8*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %file = alloca %struct._IO_FILE*, align 8
  %_aux_ = alloca i32*, align 8
  store double* %grid, double** %1, align 8
  store i8* %filename, i8** %2, align 8
  %3 = load i8** %2, align 8
  %4 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0))
  store %struct._IO_FILE* %4, %struct._IO_FILE** %file, align 8
  store i32 0, i32* %z, align 4
  br label %5

; <label>:5                                       ; preds = %52, %0
  %6 = load i32* %z, align 4
  %7 = icmp slt i32 %6, 130
  br i1 %7, label %8, label %55

; <label>:8                                       ; preds = %5
  store i32 0, i32* %y, align 4
  br label %9

; <label>:9                                       ; preds = %46, %8
  %10 = load i32* %y, align 4
  %11 = icmp slt i32 %10, 100
  br i1 %11, label %12, label %49

; <label>:12                                      ; preds = %9
  store i32 0, i32* %x, align 4
  br label %13

; <label>:13                                      ; preds = %40, %12
  %14 = load i32* %x, align 4
  %15 = icmp slt i32 %14, 100
  br i1 %15, label %16, label %43

; <label>:16                                      ; preds = %13
  %17 = load %struct._IO_FILE** %file, align 8
  %18 = call i32 @fgetc(%struct._IO_FILE* %17)
  %19 = icmp ne i32 %18, 46
  br i1 %19, label %20, label %39

; <label>:20                                      ; preds = %16
  %21 = load i32* %x, align 4
  %22 = load i32* %y, align 4
  %23 = mul nsw i32 %22, 100
  %24 = add nsw i32 %21, %23
  %25 = load i32* %z, align 4
  %26 = mul nsw i32 %25, 100
  %27 = mul nsw i32 %26, 100
  %28 = add nsw i32 %24, %27
  %29 = mul nsw i32 20, %28
  %30 = add nsw i32 19, %29
  %31 = sext i32 %30 to i64
  %32 = load double** %1, align 8
  %33 = getelementptr inbounds double* %32, i64 %31
  %34 = bitcast double* %33 to i8*
  %35 = bitcast i8* %34 to i32*
  store i32* %35, i32** %_aux_, align 8
  %36 = load i32** %_aux_, align 8
  %37 = load i32* %36, align 4
  %38 = or i32 %37, 1
  store i32 %38, i32* %36, align 4
  br label %39

; <label>:39                                      ; preds = %20, %16
  br label %40

; <label>:40                                      ; preds = %39
  %41 = load i32* %x, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %x, align 4
  br label %13

; <label>:43                                      ; preds = %13
  %44 = load %struct._IO_FILE** %file, align 8
  %45 = call i32 @fgetc(%struct._IO_FILE* %44)
  br label %46

; <label>:46                                      ; preds = %43
  %47 = load i32* %y, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %y, align 4
  br label %9

; <label>:49                                      ; preds = %9
  %50 = load %struct._IO_FILE** %file, align 8
  %51 = call i32 @fgetc(%struct._IO_FILE* %50)
  br label %52

; <label>:52                                      ; preds = %49
  %53 = load i32* %z, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %z, align 4
  br label %5

; <label>:55                                      ; preds = %5
  %56 = load %struct._IO_FILE** %file, align 8
  %57 = call i32 @fclose(%struct._IO_FILE* %56)
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @fgetc(%struct._IO_FILE*) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define void @LBM_initializeSpecialCellsForLDC(double* %grid) #0 {
  %1 = alloca double*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %_aux_ = alloca i32*, align 8
  %_aux_1 = alloca i32*, align 8
  store double* %grid, double** %1, align 8
  store i32 -2, i32* %z, align 4
  br label %2

; <label>:2                                       ; preds = %97, %0
  %3 = load i32* %z, align 4
  %4 = icmp slt i32 %3, 132
  br i1 %4, label %5, label %100

; <label>:5                                       ; preds = %2
  store i32 0, i32* %y, align 4
  br label %6

; <label>:6                                       ; preds = %93, %5
  %7 = load i32* %y, align 4
  %8 = icmp slt i32 %7, 100
  br i1 %8, label %9, label %96

; <label>:9                                       ; preds = %6
  store i32 0, i32* %x, align 4
  br label %10

; <label>:10                                      ; preds = %89, %9
  %11 = load i32* %x, align 4
  %12 = icmp slt i32 %11, 100
  br i1 %12, label %13, label %92

; <label>:13                                      ; preds = %10
  %14 = load i32* %x, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %31, label %16

; <label>:16                                      ; preds = %13
  %17 = load i32* %x, align 4
  %18 = icmp eq i32 %17, 99
  br i1 %18, label %31, label %19

; <label>:19                                      ; preds = %16
  %20 = load i32* %y, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %31, label %22

; <label>:22                                      ; preds = %19
  %23 = load i32* %y, align 4
  %24 = icmp eq i32 %23, 99
  br i1 %24, label %31, label %25

; <label>:25                                      ; preds = %22
  %26 = load i32* %z, align 4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %31, label %28

; <label>:28                                      ; preds = %25
  %29 = load i32* %z, align 4
  %30 = icmp eq i32 %29, 129
  br i1 %30, label %31, label %50

; <label>:31                                      ; preds = %28, %25, %22, %19, %16, %13
  %32 = load i32* %x, align 4
  %33 = load i32* %y, align 4
  %34 = mul nsw i32 %33, 100
  %35 = add nsw i32 %32, %34
  %36 = load i32* %z, align 4
  %37 = mul nsw i32 %36, 100
  %38 = mul nsw i32 %37, 100
  %39 = add nsw i32 %35, %38
  %40 = mul nsw i32 20, %39
  %41 = add nsw i32 19, %40
  %42 = sext i32 %41 to i64
  %43 = load double** %1, align 8
  %44 = getelementptr inbounds double* %43, i64 %42
  %45 = bitcast double* %44 to i8*
  %46 = bitcast i8* %45 to i32*
  store i32* %46, i32** %_aux_, align 8
  %47 = load i32** %_aux_, align 8
  %48 = load i32* %47, align 4
  %49 = or i32 %48, 1
  store i32 %49, i32* %47, align 4
  br label %88

; <label>:50                                      ; preds = %28
  %51 = load i32* %z, align 4
  %52 = icmp eq i32 %51, 1
  br i1 %52, label %56, label %53

; <label>:53                                      ; preds = %50
  %54 = load i32* %z, align 4
  %55 = icmp eq i32 %54, 128
  br i1 %55, label %56, label %87

; <label>:56                                      ; preds = %53, %50
  %57 = load i32* %x, align 4
  %58 = icmp sgt i32 %57, 1
  br i1 %58, label %59, label %87

; <label>:59                                      ; preds = %56
  %60 = load i32* %x, align 4
  %61 = icmp slt i32 %60, 98
  br i1 %61, label %62, label %87

; <label>:62                                      ; preds = %59
  %63 = load i32* %y, align 4
  %64 = icmp sgt i32 %63, 1
  br i1 %64, label %65, label %87

; <label>:65                                      ; preds = %62
  %66 = load i32* %y, align 4
  %67 = icmp slt i32 %66, 98
  br i1 %67, label %68, label %87

; <label>:68                                      ; preds = %65
  %69 = load i32* %x, align 4
  %70 = load i32* %y, align 4
  %71 = mul nsw i32 %70, 100
  %72 = add nsw i32 %69, %71
  %73 = load i32* %z, align 4
  %74 = mul nsw i32 %73, 100
  %75 = mul nsw i32 %74, 100
  %76 = add nsw i32 %72, %75
  %77 = mul nsw i32 20, %76
  %78 = add nsw i32 19, %77
  %79 = sext i32 %78 to i64
  %80 = load double** %1, align 8
  %81 = getelementptr inbounds double* %80, i64 %79
  %82 = bitcast double* %81 to i8*
  %83 = bitcast i8* %82 to i32*
  store i32* %83, i32** %_aux_1, align 8
  %84 = load i32** %_aux_1, align 8
  %85 = load i32* %84, align 4
  %86 = or i32 %85, 2
  store i32 %86, i32* %84, align 4
  br label %87

; <label>:87                                      ; preds = %68, %65, %62, %59, %56, %53
  br label %88

; <label>:88                                      ; preds = %87, %31
  br label %89

; <label>:89                                      ; preds = %88
  %90 = load i32* %x, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %x, align 4
  br label %10

; <label>:92                                      ; preds = %10
  br label %93

; <label>:93                                      ; preds = %92
  %94 = load i32* %y, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %y, align 4
  br label %6

; <label>:96                                      ; preds = %6
  br label %97

; <label>:97                                      ; preds = %96
  %98 = load i32* %z, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %z, align 4
  br label %2

; <label>:100                                     ; preds = %2
  ret void
}

; Function Attrs: nounwind uwtable
define void @LBM_initializeSpecialCellsForChannel(double* %grid) #0 {
  %1 = alloca double*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %_aux_ = alloca i32*, align 8
  %_aux_1 = alloca i32*, align 8
  store double* %grid, double** %1, align 8
  store i32 -2, i32* %z, align 4
  br label %2

; <label>:2                                       ; preds = %97, %0
  %3 = load i32* %z, align 4
  %4 = icmp slt i32 %3, 132
  br i1 %4, label %5, label %100

; <label>:5                                       ; preds = %2
  store i32 0, i32* %y, align 4
  br label %6

; <label>:6                                       ; preds = %93, %5
  %7 = load i32* %y, align 4
  %8 = icmp slt i32 %7, 100
  br i1 %8, label %9, label %96

; <label>:9                                       ; preds = %6
  store i32 0, i32* %x, align 4
  br label %10

; <label>:10                                      ; preds = %89, %9
  %11 = load i32* %x, align 4
  %12 = icmp slt i32 %11, 100
  br i1 %12, label %13, label %92

; <label>:13                                      ; preds = %10
  %14 = load i32* %x, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %25, label %16

; <label>:16                                      ; preds = %13
  %17 = load i32* %x, align 4
  %18 = icmp eq i32 %17, 99
  br i1 %18, label %25, label %19

; <label>:19                                      ; preds = %16
  %20 = load i32* %y, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %25, label %22

; <label>:22                                      ; preds = %19
  %23 = load i32* %y, align 4
  %24 = icmp eq i32 %23, 99
  br i1 %24, label %25, label %88

; <label>:25                                      ; preds = %22, %19, %16, %13
  %26 = load i32* %x, align 4
  %27 = load i32* %y, align 4
  %28 = mul nsw i32 %27, 100
  %29 = add nsw i32 %26, %28
  %30 = load i32* %z, align 4
  %31 = mul nsw i32 %30, 100
  %32 = mul nsw i32 %31, 100
  %33 = add nsw i32 %29, %32
  %34 = mul nsw i32 20, %33
  %35 = add nsw i32 19, %34
  %36 = sext i32 %35 to i64
  %37 = load double** %1, align 8
  %38 = getelementptr inbounds double* %37, i64 %36
  %39 = bitcast double* %38 to i8*
  %40 = bitcast i8* %39 to i32*
  store i32* %40, i32** %_aux_, align 8
  %41 = load i32** %_aux_, align 8
  %42 = load i32* %41, align 4
  %43 = or i32 %42, 1
  store i32 %43, i32* %41, align 4
  %44 = load i32* %z, align 4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %49, label %46

; <label>:46                                      ; preds = %25
  %47 = load i32* %z, align 4
  %48 = icmp eq i32 %47, 129
  br i1 %48, label %49, label %87

; <label>:49                                      ; preds = %46, %25
  %50 = load i32* %x, align 4
  %51 = load i32* %y, align 4
  %52 = mul nsw i32 %51, 100
  %53 = add nsw i32 %50, %52
  %54 = load i32* %z, align 4
  %55 = mul nsw i32 %54, 100
  %56 = mul nsw i32 %55, 100
  %57 = add nsw i32 %53, %56
  %58 = mul nsw i32 20, %57
  %59 = add nsw i32 19, %58
  %60 = sext i32 %59 to i64
  %61 = load double** %1, align 8
  %62 = getelementptr inbounds double* %61, i64 %60
  %63 = bitcast double* %62 to i8*
  %64 = bitcast i8* %63 to i32*
  %65 = load i32* %64, align 4
  %66 = and i32 %65, 1
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %87, label %68

; <label>:68                                      ; preds = %49
  %69 = load i32* %x, align 4
  %70 = load i32* %y, align 4
  %71 = mul nsw i32 %70, 100
  %72 = add nsw i32 %69, %71
  %73 = load i32* %z, align 4
  %74 = mul nsw i32 %73, 100
  %75 = mul nsw i32 %74, 100
  %76 = add nsw i32 %72, %75
  %77 = mul nsw i32 20, %76
  %78 = add nsw i32 19, %77
  %79 = sext i32 %78 to i64
  %80 = load double** %1, align 8
  %81 = getelementptr inbounds double* %80, i64 %79
  %82 = bitcast double* %81 to i8*
  %83 = bitcast i8* %82 to i32*
  store i32* %83, i32** %_aux_1, align 8
  %84 = load i32** %_aux_1, align 8
  %85 = load i32* %84, align 4
  %86 = or i32 %85, 4
  store i32 %86, i32* %84, align 4
  br label %87

; <label>:87                                      ; preds = %68, %49, %46
  br label %88

; <label>:88                                      ; preds = %87, %22
  br label %89

; <label>:89                                      ; preds = %88
  %90 = load i32* %x, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %x, align 4
  br label %10

; <label>:92                                      ; preds = %10
  br label %93

; <label>:93                                      ; preds = %92
  %94 = load i32* %y, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %y, align 4
  br label %6

; <label>:96                                      ; preds = %6
  br label %97

; <label>:97                                      ; preds = %96
  %98 = load i32* %z, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %z, align 4
  br label %2

; <label>:100                                     ; preds = %2
  ret void
}

; Function Attrs: nounwind uwtable
define void @LBM_performStreamCollide(double* %srcGrid, double* %dstGrid) #0 {
  %1 = alloca double*, align 8
  %2 = alloca double*, align 8
  %i = alloca i32, align 4
  %ux = alloca double, align 8
  %uy = alloca double, align 8
  %uz = alloca double, align 8
  %u2 = alloca double, align 8
  %rho = alloca double, align 8
  store double* %srcGrid, double** %1, align 8
  store double* %dstGrid, double** %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %1110, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 26000000
  br i1 %5, label %6, label %1113

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = add nsw i32 19, %7
  %9 = sext i32 %8 to i64
  %10 = load double** %1, align 8
  %11 = getelementptr inbounds double* %10, i64 %9
  %12 = bitcast double* %11 to i8*
  %13 = bitcast i8* %12 to i32*
  %14 = load i32* %13, align 4
  %15 = and i32 %14, 1
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %227

; <label>:17                                      ; preds = %6
  %18 = load i32* %i, align 4
  %19 = add nsw i32 0, %18
  %20 = sext i32 %19 to i64
  %21 = load double** %1, align 8
  %22 = getelementptr inbounds double* %21, i64 %20
  %23 = load double* %22, align 8
  %24 = load i32* %i, align 4
  %25 = add nsw i32 0, %24
  %26 = sext i32 %25 to i64
  %27 = load double** %2, align 8
  %28 = getelementptr inbounds double* %27, i64 %26
  store double %23, double* %28, align 8
  %29 = load i32* %i, align 4
  %30 = add nsw i32 1, %29
  %31 = sext i32 %30 to i64
  %32 = load double** %1, align 8
  %33 = getelementptr inbounds double* %32, i64 %31
  %34 = load double* %33, align 8
  %35 = load i32* %i, align 4
  %36 = add nsw i32 -1998, %35
  %37 = sext i32 %36 to i64
  %38 = load double** %2, align 8
  %39 = getelementptr inbounds double* %38, i64 %37
  store double %34, double* %39, align 8
  %40 = load i32* %i, align 4
  %41 = add nsw i32 2, %40
  %42 = sext i32 %41 to i64
  %43 = load double** %1, align 8
  %44 = getelementptr inbounds double* %43, i64 %42
  %45 = load double* %44, align 8
  %46 = load i32* %i, align 4
  %47 = add nsw i32 2001, %46
  %48 = sext i32 %47 to i64
  %49 = load double** %2, align 8
  %50 = getelementptr inbounds double* %49, i64 %48
  store double %45, double* %50, align 8
  %51 = load i32* %i, align 4
  %52 = add nsw i32 3, %51
  %53 = sext i32 %52 to i64
  %54 = load double** %1, align 8
  %55 = getelementptr inbounds double* %54, i64 %53
  %56 = load double* %55, align 8
  %57 = load i32* %i, align 4
  %58 = add nsw i32 -16, %57
  %59 = sext i32 %58 to i64
  %60 = load double** %2, align 8
  %61 = getelementptr inbounds double* %60, i64 %59
  store double %56, double* %61, align 8
  %62 = load i32* %i, align 4
  %63 = add nsw i32 4, %62
  %64 = sext i32 %63 to i64
  %65 = load double** %1, align 8
  %66 = getelementptr inbounds double* %65, i64 %64
  %67 = load double* %66, align 8
  %68 = load i32* %i, align 4
  %69 = add nsw i32 23, %68
  %70 = sext i32 %69 to i64
  %71 = load double** %2, align 8
  %72 = getelementptr inbounds double* %71, i64 %70
  store double %67, double* %72, align 8
  %73 = load i32* %i, align 4
  %74 = add nsw i32 5, %73
  %75 = sext i32 %74 to i64
  %76 = load double** %1, align 8
  %77 = getelementptr inbounds double* %76, i64 %75
  %78 = load double* %77, align 8
  %79 = load i32* %i, align 4
  %80 = add nsw i32 -199994, %79
  %81 = sext i32 %80 to i64
  %82 = load double** %2, align 8
  %83 = getelementptr inbounds double* %82, i64 %81
  store double %78, double* %83, align 8
  %84 = load i32* %i, align 4
  %85 = add nsw i32 6, %84
  %86 = sext i32 %85 to i64
  %87 = load double** %1, align 8
  %88 = getelementptr inbounds double* %87, i64 %86
  %89 = load double* %88, align 8
  %90 = load i32* %i, align 4
  %91 = add nsw i32 200005, %90
  %92 = sext i32 %91 to i64
  %93 = load double** %2, align 8
  %94 = getelementptr inbounds double* %93, i64 %92
  store double %89, double* %94, align 8
  %95 = load i32* %i, align 4
  %96 = add nsw i32 7, %95
  %97 = sext i32 %96 to i64
  %98 = load double** %1, align 8
  %99 = getelementptr inbounds double* %98, i64 %97
  %100 = load double* %99, align 8
  %101 = load i32* %i, align 4
  %102 = add nsw i32 -2010, %101
  %103 = sext i32 %102 to i64
  %104 = load double** %2, align 8
  %105 = getelementptr inbounds double* %104, i64 %103
  store double %100, double* %105, align 8
  %106 = load i32* %i, align 4
  %107 = add nsw i32 8, %106
  %108 = sext i32 %107 to i64
  %109 = load double** %1, align 8
  %110 = getelementptr inbounds double* %109, i64 %108
  %111 = load double* %110, align 8
  %112 = load i32* %i, align 4
  %113 = add nsw i32 -1971, %112
  %114 = sext i32 %113 to i64
  %115 = load double** %2, align 8
  %116 = getelementptr inbounds double* %115, i64 %114
  store double %111, double* %116, align 8
  %117 = load i32* %i, align 4
  %118 = add nsw i32 9, %117
  %119 = sext i32 %118 to i64
  %120 = load double** %1, align 8
  %121 = getelementptr inbounds double* %120, i64 %119
  %122 = load double* %121, align 8
  %123 = load i32* %i, align 4
  %124 = add nsw i32 1988, %123
  %125 = sext i32 %124 to i64
  %126 = load double** %2, align 8
  %127 = getelementptr inbounds double* %126, i64 %125
  store double %122, double* %127, align 8
  %128 = load i32* %i, align 4
  %129 = add nsw i32 10, %128
  %130 = sext i32 %129 to i64
  %131 = load double** %1, align 8
  %132 = getelementptr inbounds double* %131, i64 %130
  %133 = load double* %132, align 8
  %134 = load i32* %i, align 4
  %135 = add nsw i32 2027, %134
  %136 = sext i32 %135 to i64
  %137 = load double** %2, align 8
  %138 = getelementptr inbounds double* %137, i64 %136
  store double %133, double* %138, align 8
  %139 = load i32* %i, align 4
  %140 = add nsw i32 11, %139
  %141 = sext i32 %140 to i64
  %142 = load double** %1, align 8
  %143 = getelementptr inbounds double* %142, i64 %141
  %144 = load double* %143, align 8
  %145 = load i32* %i, align 4
  %146 = add nsw i32 -201986, %145
  %147 = sext i32 %146 to i64
  %148 = load double** %2, align 8
  %149 = getelementptr inbounds double* %148, i64 %147
  store double %144, double* %149, align 8
  %150 = load i32* %i, align 4
  %151 = add nsw i32 12, %150
  %152 = sext i32 %151 to i64
  %153 = load double** %1, align 8
  %154 = getelementptr inbounds double* %153, i64 %152
  %155 = load double* %154, align 8
  %156 = load i32* %i, align 4
  %157 = add nsw i32 198013, %156
  %158 = sext i32 %157 to i64
  %159 = load double** %2, align 8
  %160 = getelementptr inbounds double* %159, i64 %158
  store double %155, double* %160, align 8
  %161 = load i32* %i, align 4
  %162 = add nsw i32 13, %161
  %163 = sext i32 %162 to i64
  %164 = load double** %1, align 8
  %165 = getelementptr inbounds double* %164, i64 %163
  %166 = load double* %165, align 8
  %167 = load i32* %i, align 4
  %168 = add nsw i32 -197988, %167
  %169 = sext i32 %168 to i64
  %170 = load double** %2, align 8
  %171 = getelementptr inbounds double* %170, i64 %169
  store double %166, double* %171, align 8
  %172 = load i32* %i, align 4
  %173 = add nsw i32 14, %172
  %174 = sext i32 %173 to i64
  %175 = load double** %1, align 8
  %176 = getelementptr inbounds double* %175, i64 %174
  %177 = load double* %176, align 8
  %178 = load i32* %i, align 4
  %179 = add nsw i32 202011, %178
  %180 = sext i32 %179 to i64
  %181 = load double** %2, align 8
  %182 = getelementptr inbounds double* %181, i64 %180
  store double %177, double* %182, align 8
  %183 = load i32* %i, align 4
  %184 = add nsw i32 15, %183
  %185 = sext i32 %184 to i64
  %186 = load double** %1, align 8
  %187 = getelementptr inbounds double* %186, i64 %185
  %188 = load double* %187, align 8
  %189 = load i32* %i, align 4
  %190 = add nsw i32 -200002, %189
  %191 = sext i32 %190 to i64
  %192 = load double** %2, align 8
  %193 = getelementptr inbounds double* %192, i64 %191
  store double %188, double* %193, align 8
  %194 = load i32* %i, align 4
  %195 = add nsw i32 16, %194
  %196 = sext i32 %195 to i64
  %197 = load double** %1, align 8
  %198 = getelementptr inbounds double* %197, i64 %196
  %199 = load double* %198, align 8
  %200 = load i32* %i, align 4
  %201 = add nsw i32 199997, %200
  %202 = sext i32 %201 to i64
  %203 = load double** %2, align 8
  %204 = getelementptr inbounds double* %203, i64 %202
  store double %199, double* %204, align 8
  %205 = load i32* %i, align 4
  %206 = add nsw i32 17, %205
  %207 = sext i32 %206 to i64
  %208 = load double** %1, align 8
  %209 = getelementptr inbounds double* %208, i64 %207
  %210 = load double* %209, align 8
  %211 = load i32* %i, align 4
  %212 = add nsw i32 -199964, %211
  %213 = sext i32 %212 to i64
  %214 = load double** %2, align 8
  %215 = getelementptr inbounds double* %214, i64 %213
  store double %210, double* %215, align 8
  %216 = load i32* %i, align 4
  %217 = add nsw i32 18, %216
  %218 = sext i32 %217 to i64
  %219 = load double** %1, align 8
  %220 = getelementptr inbounds double* %219, i64 %218
  %221 = load double* %220, align 8
  %222 = load i32* %i, align 4
  %223 = add nsw i32 200035, %222
  %224 = sext i32 %223 to i64
  %225 = load double** %2, align 8
  %226 = getelementptr inbounds double* %225, i64 %224
  store double %221, double* %226, align 8
  br label %1110

; <label>:227                                     ; preds = %6
  %228 = load i32* %i, align 4
  %229 = add nsw i32 0, %228
  %230 = sext i32 %229 to i64
  %231 = load double** %1, align 8
  %232 = getelementptr inbounds double* %231, i64 %230
  %233 = load double* %232, align 8
  %234 = load i32* %i, align 4
  %235 = add nsw i32 1, %234
  %236 = sext i32 %235 to i64
  %237 = load double** %1, align 8
  %238 = getelementptr inbounds double* %237, i64 %236
  %239 = load double* %238, align 8
  %240 = fadd double %233, %239
  %241 = load i32* %i, align 4
  %242 = add nsw i32 2, %241
  %243 = sext i32 %242 to i64
  %244 = load double** %1, align 8
  %245 = getelementptr inbounds double* %244, i64 %243
  %246 = load double* %245, align 8
  %247 = fadd double %240, %246
  %248 = load i32* %i, align 4
  %249 = add nsw i32 3, %248
  %250 = sext i32 %249 to i64
  %251 = load double** %1, align 8
  %252 = getelementptr inbounds double* %251, i64 %250
  %253 = load double* %252, align 8
  %254 = fadd double %247, %253
  %255 = load i32* %i, align 4
  %256 = add nsw i32 4, %255
  %257 = sext i32 %256 to i64
  %258 = load double** %1, align 8
  %259 = getelementptr inbounds double* %258, i64 %257
  %260 = load double* %259, align 8
  %261 = fadd double %254, %260
  %262 = load i32* %i, align 4
  %263 = add nsw i32 5, %262
  %264 = sext i32 %263 to i64
  %265 = load double** %1, align 8
  %266 = getelementptr inbounds double* %265, i64 %264
  %267 = load double* %266, align 8
  %268 = fadd double %261, %267
  %269 = load i32* %i, align 4
  %270 = add nsw i32 6, %269
  %271 = sext i32 %270 to i64
  %272 = load double** %1, align 8
  %273 = getelementptr inbounds double* %272, i64 %271
  %274 = load double* %273, align 8
  %275 = fadd double %268, %274
  %276 = load i32* %i, align 4
  %277 = add nsw i32 7, %276
  %278 = sext i32 %277 to i64
  %279 = load double** %1, align 8
  %280 = getelementptr inbounds double* %279, i64 %278
  %281 = load double* %280, align 8
  %282 = fadd double %275, %281
  %283 = load i32* %i, align 4
  %284 = add nsw i32 8, %283
  %285 = sext i32 %284 to i64
  %286 = load double** %1, align 8
  %287 = getelementptr inbounds double* %286, i64 %285
  %288 = load double* %287, align 8
  %289 = fadd double %282, %288
  %290 = load i32* %i, align 4
  %291 = add nsw i32 9, %290
  %292 = sext i32 %291 to i64
  %293 = load double** %1, align 8
  %294 = getelementptr inbounds double* %293, i64 %292
  %295 = load double* %294, align 8
  %296 = fadd double %289, %295
  %297 = load i32* %i, align 4
  %298 = add nsw i32 10, %297
  %299 = sext i32 %298 to i64
  %300 = load double** %1, align 8
  %301 = getelementptr inbounds double* %300, i64 %299
  %302 = load double* %301, align 8
  %303 = fadd double %296, %302
  %304 = load i32* %i, align 4
  %305 = add nsw i32 11, %304
  %306 = sext i32 %305 to i64
  %307 = load double** %1, align 8
  %308 = getelementptr inbounds double* %307, i64 %306
  %309 = load double* %308, align 8
  %310 = fadd double %303, %309
  %311 = load i32* %i, align 4
  %312 = add nsw i32 12, %311
  %313 = sext i32 %312 to i64
  %314 = load double** %1, align 8
  %315 = getelementptr inbounds double* %314, i64 %313
  %316 = load double* %315, align 8
  %317 = fadd double %310, %316
  %318 = load i32* %i, align 4
  %319 = add nsw i32 13, %318
  %320 = sext i32 %319 to i64
  %321 = load double** %1, align 8
  %322 = getelementptr inbounds double* %321, i64 %320
  %323 = load double* %322, align 8
  %324 = fadd double %317, %323
  %325 = load i32* %i, align 4
  %326 = add nsw i32 14, %325
  %327 = sext i32 %326 to i64
  %328 = load double** %1, align 8
  %329 = getelementptr inbounds double* %328, i64 %327
  %330 = load double* %329, align 8
  %331 = fadd double %324, %330
  %332 = load i32* %i, align 4
  %333 = add nsw i32 15, %332
  %334 = sext i32 %333 to i64
  %335 = load double** %1, align 8
  %336 = getelementptr inbounds double* %335, i64 %334
  %337 = load double* %336, align 8
  %338 = fadd double %331, %337
  %339 = load i32* %i, align 4
  %340 = add nsw i32 16, %339
  %341 = sext i32 %340 to i64
  %342 = load double** %1, align 8
  %343 = getelementptr inbounds double* %342, i64 %341
  %344 = load double* %343, align 8
  %345 = fadd double %338, %344
  %346 = load i32* %i, align 4
  %347 = add nsw i32 17, %346
  %348 = sext i32 %347 to i64
  %349 = load double** %1, align 8
  %350 = getelementptr inbounds double* %349, i64 %348
  %351 = load double* %350, align 8
  %352 = fadd double %345, %351
  %353 = load i32* %i, align 4
  %354 = add nsw i32 18, %353
  %355 = sext i32 %354 to i64
  %356 = load double** %1, align 8
  %357 = getelementptr inbounds double* %356, i64 %355
  %358 = load double* %357, align 8
  %359 = fadd double %352, %358
  store double %359, double* %rho, align 8
  %360 = load i32* %i, align 4
  %361 = add nsw i32 3, %360
  %362 = sext i32 %361 to i64
  %363 = load double** %1, align 8
  %364 = getelementptr inbounds double* %363, i64 %362
  %365 = load double* %364, align 8
  %366 = load i32* %i, align 4
  %367 = add nsw i32 4, %366
  %368 = sext i32 %367 to i64
  %369 = load double** %1, align 8
  %370 = getelementptr inbounds double* %369, i64 %368
  %371 = load double* %370, align 8
  %372 = fsub double %365, %371
  %373 = load i32* %i, align 4
  %374 = add nsw i32 7, %373
  %375 = sext i32 %374 to i64
  %376 = load double** %1, align 8
  %377 = getelementptr inbounds double* %376, i64 %375
  %378 = load double* %377, align 8
  %379 = fadd double %372, %378
  %380 = load i32* %i, align 4
  %381 = add nsw i32 8, %380
  %382 = sext i32 %381 to i64
  %383 = load double** %1, align 8
  %384 = getelementptr inbounds double* %383, i64 %382
  %385 = load double* %384, align 8
  %386 = fsub double %379, %385
  %387 = load i32* %i, align 4
  %388 = add nsw i32 9, %387
  %389 = sext i32 %388 to i64
  %390 = load double** %1, align 8
  %391 = getelementptr inbounds double* %390, i64 %389
  %392 = load double* %391, align 8
  %393 = fadd double %386, %392
  %394 = load i32* %i, align 4
  %395 = add nsw i32 10, %394
  %396 = sext i32 %395 to i64
  %397 = load double** %1, align 8
  %398 = getelementptr inbounds double* %397, i64 %396
  %399 = load double* %398, align 8
  %400 = fsub double %393, %399
  %401 = load i32* %i, align 4
  %402 = add nsw i32 15, %401
  %403 = sext i32 %402 to i64
  %404 = load double** %1, align 8
  %405 = getelementptr inbounds double* %404, i64 %403
  %406 = load double* %405, align 8
  %407 = fadd double %400, %406
  %408 = load i32* %i, align 4
  %409 = add nsw i32 16, %408
  %410 = sext i32 %409 to i64
  %411 = load double** %1, align 8
  %412 = getelementptr inbounds double* %411, i64 %410
  %413 = load double* %412, align 8
  %414 = fadd double %407, %413
  %415 = load i32* %i, align 4
  %416 = add nsw i32 17, %415
  %417 = sext i32 %416 to i64
  %418 = load double** %1, align 8
  %419 = getelementptr inbounds double* %418, i64 %417
  %420 = load double* %419, align 8
  %421 = fsub double %414, %420
  %422 = load i32* %i, align 4
  %423 = add nsw i32 18, %422
  %424 = sext i32 %423 to i64
  %425 = load double** %1, align 8
  %426 = getelementptr inbounds double* %425, i64 %424
  %427 = load double* %426, align 8
  %428 = fsub double %421, %427
  store double %428, double* %ux, align 8
  %429 = load i32* %i, align 4
  %430 = add nsw i32 1, %429
  %431 = sext i32 %430 to i64
  %432 = load double** %1, align 8
  %433 = getelementptr inbounds double* %432, i64 %431
  %434 = load double* %433, align 8
  %435 = load i32* %i, align 4
  %436 = add nsw i32 2, %435
  %437 = sext i32 %436 to i64
  %438 = load double** %1, align 8
  %439 = getelementptr inbounds double* %438, i64 %437
  %440 = load double* %439, align 8
  %441 = fsub double %434, %440
  %442 = load i32* %i, align 4
  %443 = add nsw i32 7, %442
  %444 = sext i32 %443 to i64
  %445 = load double** %1, align 8
  %446 = getelementptr inbounds double* %445, i64 %444
  %447 = load double* %446, align 8
  %448 = fadd double %441, %447
  %449 = load i32* %i, align 4
  %450 = add nsw i32 8, %449
  %451 = sext i32 %450 to i64
  %452 = load double** %1, align 8
  %453 = getelementptr inbounds double* %452, i64 %451
  %454 = load double* %453, align 8
  %455 = fadd double %448, %454
  %456 = load i32* %i, align 4
  %457 = add nsw i32 9, %456
  %458 = sext i32 %457 to i64
  %459 = load double** %1, align 8
  %460 = getelementptr inbounds double* %459, i64 %458
  %461 = load double* %460, align 8
  %462 = fsub double %455, %461
  %463 = load i32* %i, align 4
  %464 = add nsw i32 10, %463
  %465 = sext i32 %464 to i64
  %466 = load double** %1, align 8
  %467 = getelementptr inbounds double* %466, i64 %465
  %468 = load double* %467, align 8
  %469 = fsub double %462, %468
  %470 = load i32* %i, align 4
  %471 = add nsw i32 11, %470
  %472 = sext i32 %471 to i64
  %473 = load double** %1, align 8
  %474 = getelementptr inbounds double* %473, i64 %472
  %475 = load double* %474, align 8
  %476 = fadd double %469, %475
  %477 = load i32* %i, align 4
  %478 = add nsw i32 12, %477
  %479 = sext i32 %478 to i64
  %480 = load double** %1, align 8
  %481 = getelementptr inbounds double* %480, i64 %479
  %482 = load double* %481, align 8
  %483 = fadd double %476, %482
  %484 = load i32* %i, align 4
  %485 = add nsw i32 13, %484
  %486 = sext i32 %485 to i64
  %487 = load double** %1, align 8
  %488 = getelementptr inbounds double* %487, i64 %486
  %489 = load double* %488, align 8
  %490 = fsub double %483, %489
  %491 = load i32* %i, align 4
  %492 = add nsw i32 14, %491
  %493 = sext i32 %492 to i64
  %494 = load double** %1, align 8
  %495 = getelementptr inbounds double* %494, i64 %493
  %496 = load double* %495, align 8
  %497 = fsub double %490, %496
  store double %497, double* %uy, align 8
  %498 = load i32* %i, align 4
  %499 = add nsw i32 5, %498
  %500 = sext i32 %499 to i64
  %501 = load double** %1, align 8
  %502 = getelementptr inbounds double* %501, i64 %500
  %503 = load double* %502, align 8
  %504 = load i32* %i, align 4
  %505 = add nsw i32 6, %504
  %506 = sext i32 %505 to i64
  %507 = load double** %1, align 8
  %508 = getelementptr inbounds double* %507, i64 %506
  %509 = load double* %508, align 8
  %510 = fsub double %503, %509
  %511 = load i32* %i, align 4
  %512 = add nsw i32 11, %511
  %513 = sext i32 %512 to i64
  %514 = load double** %1, align 8
  %515 = getelementptr inbounds double* %514, i64 %513
  %516 = load double* %515, align 8
  %517 = fadd double %510, %516
  %518 = load i32* %i, align 4
  %519 = add nsw i32 12, %518
  %520 = sext i32 %519 to i64
  %521 = load double** %1, align 8
  %522 = getelementptr inbounds double* %521, i64 %520
  %523 = load double* %522, align 8
  %524 = fsub double %517, %523
  %525 = load i32* %i, align 4
  %526 = add nsw i32 13, %525
  %527 = sext i32 %526 to i64
  %528 = load double** %1, align 8
  %529 = getelementptr inbounds double* %528, i64 %527
  %530 = load double* %529, align 8
  %531 = fadd double %524, %530
  %532 = load i32* %i, align 4
  %533 = add nsw i32 14, %532
  %534 = sext i32 %533 to i64
  %535 = load double** %1, align 8
  %536 = getelementptr inbounds double* %535, i64 %534
  %537 = load double* %536, align 8
  %538 = fsub double %531, %537
  %539 = load i32* %i, align 4
  %540 = add nsw i32 15, %539
  %541 = sext i32 %540 to i64
  %542 = load double** %1, align 8
  %543 = getelementptr inbounds double* %542, i64 %541
  %544 = load double* %543, align 8
  %545 = fadd double %538, %544
  %546 = load i32* %i, align 4
  %547 = add nsw i32 16, %546
  %548 = sext i32 %547 to i64
  %549 = load double** %1, align 8
  %550 = getelementptr inbounds double* %549, i64 %548
  %551 = load double* %550, align 8
  %552 = fsub double %545, %551
  %553 = load i32* %i, align 4
  %554 = add nsw i32 17, %553
  %555 = sext i32 %554 to i64
  %556 = load double** %1, align 8
  %557 = getelementptr inbounds double* %556, i64 %555
  %558 = load double* %557, align 8
  %559 = fadd double %552, %558
  %560 = load i32* %i, align 4
  %561 = add nsw i32 18, %560
  %562 = sext i32 %561 to i64
  %563 = load double** %1, align 8
  %564 = getelementptr inbounds double* %563, i64 %562
  %565 = load double* %564, align 8
  %566 = fsub double %559, %565
  store double %566, double* %uz, align 8
  %567 = load double* %rho, align 8
  %568 = load double* %ux, align 8
  %569 = fdiv double %568, %567
  store double %569, double* %ux, align 8
  %570 = load double* %rho, align 8
  %571 = load double* %uy, align 8
  %572 = fdiv double %571, %570
  store double %572, double* %uy, align 8
  %573 = load double* %rho, align 8
  %574 = load double* %uz, align 8
  %575 = fdiv double %574, %573
  store double %575, double* %uz, align 8
  %576 = load i32* %i, align 4
  %577 = add nsw i32 19, %576
  %578 = sext i32 %577 to i64
  %579 = load double** %1, align 8
  %580 = getelementptr inbounds double* %579, i64 %578
  %581 = bitcast double* %580 to i8*
  %582 = bitcast i8* %581 to i32*
  %583 = load i32* %582, align 4
  %584 = and i32 %583, 2
  %585 = icmp ne i32 %584, 0
  br i1 %585, label %586, label %587

; <label>:586                                     ; preds = %227
  store double 5.000000e-03, double* %ux, align 8
  store double 2.000000e-03, double* %uy, align 8
  store double 0.000000e+00, double* %uz, align 8
  br label %587

; <label>:587                                     ; preds = %586, %227
  %588 = load double* %ux, align 8
  %589 = load double* %ux, align 8
  %590 = fmul double %588, %589
  %591 = load double* %uy, align 8
  %592 = load double* %uy, align 8
  %593 = fmul double %591, %592
  %594 = fadd double %590, %593
  %595 = load double* %uz, align 8
  %596 = load double* %uz, align 8
  %597 = fmul double %595, %596
  %598 = fadd double %594, %597
  %599 = fmul double 1.500000e+00, %598
  store double %599, double* %u2, align 8
  %600 = load i32* %i, align 4
  %601 = add nsw i32 0, %600
  %602 = sext i32 %601 to i64
  %603 = load double** %1, align 8
  %604 = getelementptr inbounds double* %603, i64 %602
  %605 = load double* %604, align 8
  %606 = fmul double -9.500000e-01, %605
  %607 = load double* %rho, align 8
  %608 = fmul double 0x3FE4CCCCCCCCCCCC, %607
  %609 = load double* %u2, align 8
  %610 = fsub double 1.000000e+00, %609
  %611 = fmul double %608, %610
  %612 = fadd double %606, %611
  %613 = load i32* %i, align 4
  %614 = add nsw i32 0, %613
  %615 = sext i32 %614 to i64
  %616 = load double** %2, align 8
  %617 = getelementptr inbounds double* %616, i64 %615
  store double %612, double* %617, align 8
  %618 = load i32* %i, align 4
  %619 = add nsw i32 1, %618
  %620 = sext i32 %619 to i64
  %621 = load double** %1, align 8
  %622 = getelementptr inbounds double* %621, i64 %620
  %623 = load double* %622, align 8
  %624 = fmul double -9.500000e-01, %623
  %625 = load double* %rho, align 8
  %626 = fmul double 0x3FBBBBBBBBBBBBBB, %625
  %627 = load double* %uy, align 8
  %628 = load double* %uy, align 8
  %629 = fmul double 4.500000e+00, %628
  %630 = fadd double %629, 3.000000e+00
  %631 = fmul double %627, %630
  %632 = fadd double 1.000000e+00, %631
  %633 = load double* %u2, align 8
  %634 = fsub double %632, %633
  %635 = fmul double %626, %634
  %636 = fadd double %624, %635
  %637 = load i32* %i, align 4
  %638 = add nsw i32 2001, %637
  %639 = sext i32 %638 to i64
  %640 = load double** %2, align 8
  %641 = getelementptr inbounds double* %640, i64 %639
  store double %636, double* %641, align 8
  %642 = load i32* %i, align 4
  %643 = add nsw i32 2, %642
  %644 = sext i32 %643 to i64
  %645 = load double** %1, align 8
  %646 = getelementptr inbounds double* %645, i64 %644
  %647 = load double* %646, align 8
  %648 = fmul double -9.500000e-01, %647
  %649 = load double* %rho, align 8
  %650 = fmul double 0x3FBBBBBBBBBBBBBB, %649
  %651 = load double* %uy, align 8
  %652 = load double* %uy, align 8
  %653 = fmul double 4.500000e+00, %652
  %654 = fsub double %653, 3.000000e+00
  %655 = fmul double %651, %654
  %656 = fadd double 1.000000e+00, %655
  %657 = load double* %u2, align 8
  %658 = fsub double %656, %657
  %659 = fmul double %650, %658
  %660 = fadd double %648, %659
  %661 = load i32* %i, align 4
  %662 = add nsw i32 -1998, %661
  %663 = sext i32 %662 to i64
  %664 = load double** %2, align 8
  %665 = getelementptr inbounds double* %664, i64 %663
  store double %660, double* %665, align 8
  %666 = load i32* %i, align 4
  %667 = add nsw i32 3, %666
  %668 = sext i32 %667 to i64
  %669 = load double** %1, align 8
  %670 = getelementptr inbounds double* %669, i64 %668
  %671 = load double* %670, align 8
  %672 = fmul double -9.500000e-01, %671
  %673 = load double* %rho, align 8
  %674 = fmul double 0x3FBBBBBBBBBBBBBB, %673
  %675 = load double* %ux, align 8
  %676 = load double* %ux, align 8
  %677 = fmul double 4.500000e+00, %676
  %678 = fadd double %677, 3.000000e+00
  %679 = fmul double %675, %678
  %680 = fadd double 1.000000e+00, %679
  %681 = load double* %u2, align 8
  %682 = fsub double %680, %681
  %683 = fmul double %674, %682
  %684 = fadd double %672, %683
  %685 = load i32* %i, align 4
  %686 = add nsw i32 23, %685
  %687 = sext i32 %686 to i64
  %688 = load double** %2, align 8
  %689 = getelementptr inbounds double* %688, i64 %687
  store double %684, double* %689, align 8
  %690 = load i32* %i, align 4
  %691 = add nsw i32 4, %690
  %692 = sext i32 %691 to i64
  %693 = load double** %1, align 8
  %694 = getelementptr inbounds double* %693, i64 %692
  %695 = load double* %694, align 8
  %696 = fmul double -9.500000e-01, %695
  %697 = load double* %rho, align 8
  %698 = fmul double 0x3FBBBBBBBBBBBBBB, %697
  %699 = load double* %ux, align 8
  %700 = load double* %ux, align 8
  %701 = fmul double 4.500000e+00, %700
  %702 = fsub double %701, 3.000000e+00
  %703 = fmul double %699, %702
  %704 = fadd double 1.000000e+00, %703
  %705 = load double* %u2, align 8
  %706 = fsub double %704, %705
  %707 = fmul double %698, %706
  %708 = fadd double %696, %707
  %709 = load i32* %i, align 4
  %710 = add nsw i32 -16, %709
  %711 = sext i32 %710 to i64
  %712 = load double** %2, align 8
  %713 = getelementptr inbounds double* %712, i64 %711
  store double %708, double* %713, align 8
  %714 = load i32* %i, align 4
  %715 = add nsw i32 5, %714
  %716 = sext i32 %715 to i64
  %717 = load double** %1, align 8
  %718 = getelementptr inbounds double* %717, i64 %716
  %719 = load double* %718, align 8
  %720 = fmul double -9.500000e-01, %719
  %721 = load double* %rho, align 8
  %722 = fmul double 0x3FBBBBBBBBBBBBBB, %721
  %723 = load double* %uz, align 8
  %724 = load double* %uz, align 8
  %725 = fmul double 4.500000e+00, %724
  %726 = fadd double %725, 3.000000e+00
  %727 = fmul double %723, %726
  %728 = fadd double 1.000000e+00, %727
  %729 = load double* %u2, align 8
  %730 = fsub double %728, %729
  %731 = fmul double %722, %730
  %732 = fadd double %720, %731
  %733 = load i32* %i, align 4
  %734 = add nsw i32 200005, %733
  %735 = sext i32 %734 to i64
  %736 = load double** %2, align 8
  %737 = getelementptr inbounds double* %736, i64 %735
  store double %732, double* %737, align 8
  %738 = load i32* %i, align 4
  %739 = add nsw i32 6, %738
  %740 = sext i32 %739 to i64
  %741 = load double** %1, align 8
  %742 = getelementptr inbounds double* %741, i64 %740
  %743 = load double* %742, align 8
  %744 = fmul double -9.500000e-01, %743
  %745 = load double* %rho, align 8
  %746 = fmul double 0x3FBBBBBBBBBBBBBB, %745
  %747 = load double* %uz, align 8
  %748 = load double* %uz, align 8
  %749 = fmul double 4.500000e+00, %748
  %750 = fsub double %749, 3.000000e+00
  %751 = fmul double %747, %750
  %752 = fadd double 1.000000e+00, %751
  %753 = load double* %u2, align 8
  %754 = fsub double %752, %753
  %755 = fmul double %746, %754
  %756 = fadd double %744, %755
  %757 = load i32* %i, align 4
  %758 = add nsw i32 -199994, %757
  %759 = sext i32 %758 to i64
  %760 = load double** %2, align 8
  %761 = getelementptr inbounds double* %760, i64 %759
  store double %756, double* %761, align 8
  %762 = load i32* %i, align 4
  %763 = add nsw i32 7, %762
  %764 = sext i32 %763 to i64
  %765 = load double** %1, align 8
  %766 = getelementptr inbounds double* %765, i64 %764
  %767 = load double* %766, align 8
  %768 = fmul double -9.500000e-01, %767
  %769 = load double* %rho, align 8
  %770 = fmul double 0x3FABBBBBBBBBBBBB, %769
  %771 = load double* %ux, align 8
  %772 = load double* %uy, align 8
  %773 = fadd double %771, %772
  %774 = load double* %ux, align 8
  %775 = load double* %uy, align 8
  %776 = fadd double %774, %775
  %777 = fmul double 4.500000e+00, %776
  %778 = fadd double %777, 3.000000e+00
  %779 = fmul double %773, %778
  %780 = fadd double 1.000000e+00, %779
  %781 = load double* %u2, align 8
  %782 = fsub double %780, %781
  %783 = fmul double %770, %782
  %784 = fadd double %768, %783
  %785 = load i32* %i, align 4
  %786 = add nsw i32 2027, %785
  %787 = sext i32 %786 to i64
  %788 = load double** %2, align 8
  %789 = getelementptr inbounds double* %788, i64 %787
  store double %784, double* %789, align 8
  %790 = load i32* %i, align 4
  %791 = add nsw i32 8, %790
  %792 = sext i32 %791 to i64
  %793 = load double** %1, align 8
  %794 = getelementptr inbounds double* %793, i64 %792
  %795 = load double* %794, align 8
  %796 = fmul double -9.500000e-01, %795
  %797 = load double* %rho, align 8
  %798 = fmul double 0x3FABBBBBBBBBBBBB, %797
  %799 = load double* %ux, align 8
  %800 = fsub double -0.000000e+00, %799
  %801 = load double* %uy, align 8
  %802 = fadd double %800, %801
  %803 = load double* %ux, align 8
  %804 = fsub double -0.000000e+00, %803
  %805 = load double* %uy, align 8
  %806 = fadd double %804, %805
  %807 = fmul double 4.500000e+00, %806
  %808 = fadd double %807, 3.000000e+00
  %809 = fmul double %802, %808
  %810 = fadd double 1.000000e+00, %809
  %811 = load double* %u2, align 8
  %812 = fsub double %810, %811
  %813 = fmul double %798, %812
  %814 = fadd double %796, %813
  %815 = load i32* %i, align 4
  %816 = add nsw i32 1988, %815
  %817 = sext i32 %816 to i64
  %818 = load double** %2, align 8
  %819 = getelementptr inbounds double* %818, i64 %817
  store double %814, double* %819, align 8
  %820 = load i32* %i, align 4
  %821 = add nsw i32 9, %820
  %822 = sext i32 %821 to i64
  %823 = load double** %1, align 8
  %824 = getelementptr inbounds double* %823, i64 %822
  %825 = load double* %824, align 8
  %826 = fmul double -9.500000e-01, %825
  %827 = load double* %rho, align 8
  %828 = fmul double 0x3FABBBBBBBBBBBBB, %827
  %829 = load double* %ux, align 8
  %830 = load double* %uy, align 8
  %831 = fsub double %829, %830
  %832 = load double* %ux, align 8
  %833 = load double* %uy, align 8
  %834 = fsub double %832, %833
  %835 = fmul double 4.500000e+00, %834
  %836 = fadd double %835, 3.000000e+00
  %837 = fmul double %831, %836
  %838 = fadd double 1.000000e+00, %837
  %839 = load double* %u2, align 8
  %840 = fsub double %838, %839
  %841 = fmul double %828, %840
  %842 = fadd double %826, %841
  %843 = load i32* %i, align 4
  %844 = add nsw i32 -1971, %843
  %845 = sext i32 %844 to i64
  %846 = load double** %2, align 8
  %847 = getelementptr inbounds double* %846, i64 %845
  store double %842, double* %847, align 8
  %848 = load i32* %i, align 4
  %849 = add nsw i32 10, %848
  %850 = sext i32 %849 to i64
  %851 = load double** %1, align 8
  %852 = getelementptr inbounds double* %851, i64 %850
  %853 = load double* %852, align 8
  %854 = fmul double -9.500000e-01, %853
  %855 = load double* %rho, align 8
  %856 = fmul double 0x3FABBBBBBBBBBBBB, %855
  %857 = load double* %ux, align 8
  %858 = fsub double -0.000000e+00, %857
  %859 = load double* %uy, align 8
  %860 = fsub double %858, %859
  %861 = load double* %ux, align 8
  %862 = fsub double -0.000000e+00, %861
  %863 = load double* %uy, align 8
  %864 = fsub double %862, %863
  %865 = fmul double 4.500000e+00, %864
  %866 = fadd double %865, 3.000000e+00
  %867 = fmul double %860, %866
  %868 = fadd double 1.000000e+00, %867
  %869 = load double* %u2, align 8
  %870 = fsub double %868, %869
  %871 = fmul double %856, %870
  %872 = fadd double %854, %871
  %873 = load i32* %i, align 4
  %874 = add nsw i32 -2010, %873
  %875 = sext i32 %874 to i64
  %876 = load double** %2, align 8
  %877 = getelementptr inbounds double* %876, i64 %875
  store double %872, double* %877, align 8
  %878 = load i32* %i, align 4
  %879 = add nsw i32 11, %878
  %880 = sext i32 %879 to i64
  %881 = load double** %1, align 8
  %882 = getelementptr inbounds double* %881, i64 %880
  %883 = load double* %882, align 8
  %884 = fmul double -9.500000e-01, %883
  %885 = load double* %rho, align 8
  %886 = fmul double 0x3FABBBBBBBBBBBBB, %885
  %887 = load double* %uy, align 8
  %888 = load double* %uz, align 8
  %889 = fadd double %887, %888
  %890 = load double* %uy, align 8
  %891 = load double* %uz, align 8
  %892 = fadd double %890, %891
  %893 = fmul double 4.500000e+00, %892
  %894 = fadd double %893, 3.000000e+00
  %895 = fmul double %889, %894
  %896 = fadd double 1.000000e+00, %895
  %897 = load double* %u2, align 8
  %898 = fsub double %896, %897
  %899 = fmul double %886, %898
  %900 = fadd double %884, %899
  %901 = load i32* %i, align 4
  %902 = add nsw i32 202011, %901
  %903 = sext i32 %902 to i64
  %904 = load double** %2, align 8
  %905 = getelementptr inbounds double* %904, i64 %903
  store double %900, double* %905, align 8
  %906 = load i32* %i, align 4
  %907 = add nsw i32 12, %906
  %908 = sext i32 %907 to i64
  %909 = load double** %1, align 8
  %910 = getelementptr inbounds double* %909, i64 %908
  %911 = load double* %910, align 8
  %912 = fmul double -9.500000e-01, %911
  %913 = load double* %rho, align 8
  %914 = fmul double 0x3FABBBBBBBBBBBBB, %913
  %915 = load double* %uy, align 8
  %916 = load double* %uz, align 8
  %917 = fsub double %915, %916
  %918 = load double* %uy, align 8
  %919 = load double* %uz, align 8
  %920 = fsub double %918, %919
  %921 = fmul double 4.500000e+00, %920
  %922 = fadd double %921, 3.000000e+00
  %923 = fmul double %917, %922
  %924 = fadd double 1.000000e+00, %923
  %925 = load double* %u2, align 8
  %926 = fsub double %924, %925
  %927 = fmul double %914, %926
  %928 = fadd double %912, %927
  %929 = load i32* %i, align 4
  %930 = add nsw i32 -197988, %929
  %931 = sext i32 %930 to i64
  %932 = load double** %2, align 8
  %933 = getelementptr inbounds double* %932, i64 %931
  store double %928, double* %933, align 8
  %934 = load i32* %i, align 4
  %935 = add nsw i32 13, %934
  %936 = sext i32 %935 to i64
  %937 = load double** %1, align 8
  %938 = getelementptr inbounds double* %937, i64 %936
  %939 = load double* %938, align 8
  %940 = fmul double -9.500000e-01, %939
  %941 = load double* %rho, align 8
  %942 = fmul double 0x3FABBBBBBBBBBBBB, %941
  %943 = load double* %uy, align 8
  %944 = fsub double -0.000000e+00, %943
  %945 = load double* %uz, align 8
  %946 = fadd double %944, %945
  %947 = load double* %uy, align 8
  %948 = fsub double -0.000000e+00, %947
  %949 = load double* %uz, align 8
  %950 = fadd double %948, %949
  %951 = fmul double 4.500000e+00, %950
  %952 = fadd double %951, 3.000000e+00
  %953 = fmul double %946, %952
  %954 = fadd double 1.000000e+00, %953
  %955 = load double* %u2, align 8
  %956 = fsub double %954, %955
  %957 = fmul double %942, %956
  %958 = fadd double %940, %957
  %959 = load i32* %i, align 4
  %960 = add nsw i32 198013, %959
  %961 = sext i32 %960 to i64
  %962 = load double** %2, align 8
  %963 = getelementptr inbounds double* %962, i64 %961
  store double %958, double* %963, align 8
  %964 = load i32* %i, align 4
  %965 = add nsw i32 14, %964
  %966 = sext i32 %965 to i64
  %967 = load double** %1, align 8
  %968 = getelementptr inbounds double* %967, i64 %966
  %969 = load double* %968, align 8
  %970 = fmul double -9.500000e-01, %969
  %971 = load double* %rho, align 8
  %972 = fmul double 0x3FABBBBBBBBBBBBB, %971
  %973 = load double* %uy, align 8
  %974 = fsub double -0.000000e+00, %973
  %975 = load double* %uz, align 8
  %976 = fsub double %974, %975
  %977 = load double* %uy, align 8
  %978 = fsub double -0.000000e+00, %977
  %979 = load double* %uz, align 8
  %980 = fsub double %978, %979
  %981 = fmul double 4.500000e+00, %980
  %982 = fadd double %981, 3.000000e+00
  %983 = fmul double %976, %982
  %984 = fadd double 1.000000e+00, %983
  %985 = load double* %u2, align 8
  %986 = fsub double %984, %985
  %987 = fmul double %972, %986
  %988 = fadd double %970, %987
  %989 = load i32* %i, align 4
  %990 = add nsw i32 -201986, %989
  %991 = sext i32 %990 to i64
  %992 = load double** %2, align 8
  %993 = getelementptr inbounds double* %992, i64 %991
  store double %988, double* %993, align 8
  %994 = load i32* %i, align 4
  %995 = add nsw i32 15, %994
  %996 = sext i32 %995 to i64
  %997 = load double** %1, align 8
  %998 = getelementptr inbounds double* %997, i64 %996
  %999 = load double* %998, align 8
  %1000 = fmul double -9.500000e-01, %999
  %1001 = load double* %rho, align 8
  %1002 = fmul double 0x3FABBBBBBBBBBBBB, %1001
  %1003 = load double* %ux, align 8
  %1004 = load double* %uz, align 8
  %1005 = fadd double %1003, %1004
  %1006 = load double* %ux, align 8
  %1007 = load double* %uz, align 8
  %1008 = fadd double %1006, %1007
  %1009 = fmul double 4.500000e+00, %1008
  %1010 = fadd double %1009, 3.000000e+00
  %1011 = fmul double %1005, %1010
  %1012 = fadd double 1.000000e+00, %1011
  %1013 = load double* %u2, align 8
  %1014 = fsub double %1012, %1013
  %1015 = fmul double %1002, %1014
  %1016 = fadd double %1000, %1015
  %1017 = load i32* %i, align 4
  %1018 = add nsw i32 200035, %1017
  %1019 = sext i32 %1018 to i64
  %1020 = load double** %2, align 8
  %1021 = getelementptr inbounds double* %1020, i64 %1019
  store double %1016, double* %1021, align 8
  %1022 = load i32* %i, align 4
  %1023 = add nsw i32 16, %1022
  %1024 = sext i32 %1023 to i64
  %1025 = load double** %1, align 8
  %1026 = getelementptr inbounds double* %1025, i64 %1024
  %1027 = load double* %1026, align 8
  %1028 = fmul double -9.500000e-01, %1027
  %1029 = load double* %rho, align 8
  %1030 = fmul double 0x3FABBBBBBBBBBBBB, %1029
  %1031 = load double* %ux, align 8
  %1032 = load double* %uz, align 8
  %1033 = fsub double %1031, %1032
  %1034 = load double* %ux, align 8
  %1035 = load double* %uz, align 8
  %1036 = fsub double %1034, %1035
  %1037 = fmul double 4.500000e+00, %1036
  %1038 = fadd double %1037, 3.000000e+00
  %1039 = fmul double %1033, %1038
  %1040 = fadd double 1.000000e+00, %1039
  %1041 = load double* %u2, align 8
  %1042 = fsub double %1040, %1041
  %1043 = fmul double %1030, %1042
  %1044 = fadd double %1028, %1043
  %1045 = load i32* %i, align 4
  %1046 = add nsw i32 -199964, %1045
  %1047 = sext i32 %1046 to i64
  %1048 = load double** %2, align 8
  %1049 = getelementptr inbounds double* %1048, i64 %1047
  store double %1044, double* %1049, align 8
  %1050 = load i32* %i, align 4
  %1051 = add nsw i32 17, %1050
  %1052 = sext i32 %1051 to i64
  %1053 = load double** %1, align 8
  %1054 = getelementptr inbounds double* %1053, i64 %1052
  %1055 = load double* %1054, align 8
  %1056 = fmul double -9.500000e-01, %1055
  %1057 = load double* %rho, align 8
  %1058 = fmul double 0x3FABBBBBBBBBBBBB, %1057
  %1059 = load double* %ux, align 8
  %1060 = fsub double -0.000000e+00, %1059
  %1061 = load double* %uz, align 8
  %1062 = fadd double %1060, %1061
  %1063 = load double* %ux, align 8
  %1064 = fsub double -0.000000e+00, %1063
  %1065 = load double* %uz, align 8
  %1066 = fadd double %1064, %1065
  %1067 = fmul double 4.500000e+00, %1066
  %1068 = fadd double %1067, 3.000000e+00
  %1069 = fmul double %1062, %1068
  %1070 = fadd double 1.000000e+00, %1069
  %1071 = load double* %u2, align 8
  %1072 = fsub double %1070, %1071
  %1073 = fmul double %1058, %1072
  %1074 = fadd double %1056, %1073
  %1075 = load i32* %i, align 4
  %1076 = add nsw i32 199997, %1075
  %1077 = sext i32 %1076 to i64
  %1078 = load double** %2, align 8
  %1079 = getelementptr inbounds double* %1078, i64 %1077
  store double %1074, double* %1079, align 8
  %1080 = load i32* %i, align 4
  %1081 = add nsw i32 18, %1080
  %1082 = sext i32 %1081 to i64
  %1083 = load double** %1, align 8
  %1084 = getelementptr inbounds double* %1083, i64 %1082
  %1085 = load double* %1084, align 8
  %1086 = fmul double -9.500000e-01, %1085
  %1087 = load double* %rho, align 8
  %1088 = fmul double 0x3FABBBBBBBBBBBBB, %1087
  %1089 = load double* %ux, align 8
  %1090 = fsub double -0.000000e+00, %1089
  %1091 = load double* %uz, align 8
  %1092 = fsub double %1090, %1091
  %1093 = load double* %ux, align 8
  %1094 = fsub double -0.000000e+00, %1093
  %1095 = load double* %uz, align 8
  %1096 = fsub double %1094, %1095
  %1097 = fmul double 4.500000e+00, %1096
  %1098 = fadd double %1097, 3.000000e+00
  %1099 = fmul double %1092, %1098
  %1100 = fadd double 1.000000e+00, %1099
  %1101 = load double* %u2, align 8
  %1102 = fsub double %1100, %1101
  %1103 = fmul double %1088, %1102
  %1104 = fadd double %1086, %1103
  %1105 = load i32* %i, align 4
  %1106 = add nsw i32 -200002, %1105
  %1107 = sext i32 %1106 to i64
  %1108 = load double** %2, align 8
  %1109 = getelementptr inbounds double* %1108, i64 %1107
  store double %1104, double* %1109, align 8
  br label %1110

; <label>:1110                                    ; preds = %587, %17
  %1111 = load i32* %i, align 4
  %1112 = add nsw i32 %1111, 20
  store i32 %1112, i32* %i, align 4
  br label %3

; <label>:1113                                    ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define void @LBM_handleInOutFlow(double* %srcGrid) #0 {
  %1 = alloca double*, align 8
  %ux = alloca double, align 8
  %uy = alloca double, align 8
  %uz = alloca double, align 8
  %rho = alloca double, align 8
  %ux1 = alloca double, align 8
  %uy1 = alloca double, align 8
  %uz1 = alloca double, align 8
  %rho1 = alloca double, align 8
  %ux2 = alloca double, align 8
  %uy2 = alloca double, align 8
  %uz2 = alloca double, align 8
  %rho2 = alloca double, align 8
  %u2 = alloca double, align 8
  %px = alloca double, align 8
  %py = alloca double, align 8
  %i = alloca i32, align 4
  store double* %srcGrid, double** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %667, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 200000
  br i1 %4, label %5, label %670

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = add nsw i32 200000, %6
  %8 = sext i32 %7 to i64
  %9 = load double** %1, align 8
  %10 = getelementptr inbounds double* %9, i64 %8
  %11 = load double* %10, align 8
  %12 = load i32* %i, align 4
  %13 = add nsw i32 200001, %12
  %14 = sext i32 %13 to i64
  %15 = load double** %1, align 8
  %16 = getelementptr inbounds double* %15, i64 %14
  %17 = load double* %16, align 8
  %18 = fadd double %11, %17
  %19 = load i32* %i, align 4
  %20 = add nsw i32 200002, %19
  %21 = sext i32 %20 to i64
  %22 = load double** %1, align 8
  %23 = getelementptr inbounds double* %22, i64 %21
  %24 = load double* %23, align 8
  %25 = fadd double %18, %24
  %26 = load i32* %i, align 4
  %27 = add nsw i32 200003, %26
  %28 = sext i32 %27 to i64
  %29 = load double** %1, align 8
  %30 = getelementptr inbounds double* %29, i64 %28
  %31 = load double* %30, align 8
  %32 = fadd double %25, %31
  %33 = load i32* %i, align 4
  %34 = add nsw i32 200004, %33
  %35 = sext i32 %34 to i64
  %36 = load double** %1, align 8
  %37 = getelementptr inbounds double* %36, i64 %35
  %38 = load double* %37, align 8
  %39 = fadd double %32, %38
  %40 = load i32* %i, align 4
  %41 = add nsw i32 200005, %40
  %42 = sext i32 %41 to i64
  %43 = load double** %1, align 8
  %44 = getelementptr inbounds double* %43, i64 %42
  %45 = load double* %44, align 8
  %46 = fadd double %39, %45
  %47 = load i32* %i, align 4
  %48 = add nsw i32 200006, %47
  %49 = sext i32 %48 to i64
  %50 = load double** %1, align 8
  %51 = getelementptr inbounds double* %50, i64 %49
  %52 = load double* %51, align 8
  %53 = fadd double %46, %52
  %54 = load i32* %i, align 4
  %55 = add nsw i32 200007, %54
  %56 = sext i32 %55 to i64
  %57 = load double** %1, align 8
  %58 = getelementptr inbounds double* %57, i64 %56
  %59 = load double* %58, align 8
  %60 = fadd double %53, %59
  %61 = load i32* %i, align 4
  %62 = add nsw i32 200008, %61
  %63 = sext i32 %62 to i64
  %64 = load double** %1, align 8
  %65 = getelementptr inbounds double* %64, i64 %63
  %66 = load double* %65, align 8
  %67 = fadd double %60, %66
  %68 = load i32* %i, align 4
  %69 = add nsw i32 200009, %68
  %70 = sext i32 %69 to i64
  %71 = load double** %1, align 8
  %72 = getelementptr inbounds double* %71, i64 %70
  %73 = load double* %72, align 8
  %74 = fadd double %67, %73
  %75 = load i32* %i, align 4
  %76 = add nsw i32 200010, %75
  %77 = sext i32 %76 to i64
  %78 = load double** %1, align 8
  %79 = getelementptr inbounds double* %78, i64 %77
  %80 = load double* %79, align 8
  %81 = fadd double %74, %80
  %82 = load i32* %i, align 4
  %83 = add nsw i32 200011, %82
  %84 = sext i32 %83 to i64
  %85 = load double** %1, align 8
  %86 = getelementptr inbounds double* %85, i64 %84
  %87 = load double* %86, align 8
  %88 = fadd double %81, %87
  %89 = load i32* %i, align 4
  %90 = add nsw i32 200012, %89
  %91 = sext i32 %90 to i64
  %92 = load double** %1, align 8
  %93 = getelementptr inbounds double* %92, i64 %91
  %94 = load double* %93, align 8
  %95 = fadd double %88, %94
  %96 = load i32* %i, align 4
  %97 = add nsw i32 200013, %96
  %98 = sext i32 %97 to i64
  %99 = load double** %1, align 8
  %100 = getelementptr inbounds double* %99, i64 %98
  %101 = load double* %100, align 8
  %102 = fadd double %95, %101
  %103 = load i32* %i, align 4
  %104 = add nsw i32 200014, %103
  %105 = sext i32 %104 to i64
  %106 = load double** %1, align 8
  %107 = getelementptr inbounds double* %106, i64 %105
  %108 = load double* %107, align 8
  %109 = fadd double %102, %108
  %110 = load i32* %i, align 4
  %111 = add nsw i32 200015, %110
  %112 = sext i32 %111 to i64
  %113 = load double** %1, align 8
  %114 = getelementptr inbounds double* %113, i64 %112
  %115 = load double* %114, align 8
  %116 = fadd double %109, %115
  %117 = load i32* %i, align 4
  %118 = add nsw i32 200016, %117
  %119 = sext i32 %118 to i64
  %120 = load double** %1, align 8
  %121 = getelementptr inbounds double* %120, i64 %119
  %122 = load double* %121, align 8
  %123 = fadd double %116, %122
  %124 = load i32* %i, align 4
  %125 = add nsw i32 200017, %124
  %126 = sext i32 %125 to i64
  %127 = load double** %1, align 8
  %128 = getelementptr inbounds double* %127, i64 %126
  %129 = load double* %128, align 8
  %130 = fadd double %123, %129
  %131 = load i32* %i, align 4
  %132 = add nsw i32 200018, %131
  %133 = sext i32 %132 to i64
  %134 = load double** %1, align 8
  %135 = getelementptr inbounds double* %134, i64 %133
  %136 = load double* %135, align 8
  %137 = fadd double %130, %136
  store double %137, double* %rho1, align 8
  %138 = load i32* %i, align 4
  %139 = add nsw i32 400000, %138
  %140 = sext i32 %139 to i64
  %141 = load double** %1, align 8
  %142 = getelementptr inbounds double* %141, i64 %140
  %143 = load double* %142, align 8
  %144 = load i32* %i, align 4
  %145 = add nsw i32 400001, %144
  %146 = sext i32 %145 to i64
  %147 = load double** %1, align 8
  %148 = getelementptr inbounds double* %147, i64 %146
  %149 = load double* %148, align 8
  %150 = fadd double %143, %149
  %151 = load i32* %i, align 4
  %152 = add nsw i32 400002, %151
  %153 = sext i32 %152 to i64
  %154 = load double** %1, align 8
  %155 = getelementptr inbounds double* %154, i64 %153
  %156 = load double* %155, align 8
  %157 = fadd double %150, %156
  %158 = load i32* %i, align 4
  %159 = add nsw i32 400003, %158
  %160 = sext i32 %159 to i64
  %161 = load double** %1, align 8
  %162 = getelementptr inbounds double* %161, i64 %160
  %163 = load double* %162, align 8
  %164 = fadd double %157, %163
  %165 = load i32* %i, align 4
  %166 = add nsw i32 400004, %165
  %167 = sext i32 %166 to i64
  %168 = load double** %1, align 8
  %169 = getelementptr inbounds double* %168, i64 %167
  %170 = load double* %169, align 8
  %171 = fadd double %164, %170
  %172 = load i32* %i, align 4
  %173 = add nsw i32 400005, %172
  %174 = sext i32 %173 to i64
  %175 = load double** %1, align 8
  %176 = getelementptr inbounds double* %175, i64 %174
  %177 = load double* %176, align 8
  %178 = fadd double %171, %177
  %179 = load i32* %i, align 4
  %180 = add nsw i32 400006, %179
  %181 = sext i32 %180 to i64
  %182 = load double** %1, align 8
  %183 = getelementptr inbounds double* %182, i64 %181
  %184 = load double* %183, align 8
  %185 = fadd double %178, %184
  %186 = load i32* %i, align 4
  %187 = add nsw i32 400007, %186
  %188 = sext i32 %187 to i64
  %189 = load double** %1, align 8
  %190 = getelementptr inbounds double* %189, i64 %188
  %191 = load double* %190, align 8
  %192 = fadd double %185, %191
  %193 = load i32* %i, align 4
  %194 = add nsw i32 400008, %193
  %195 = sext i32 %194 to i64
  %196 = load double** %1, align 8
  %197 = getelementptr inbounds double* %196, i64 %195
  %198 = load double* %197, align 8
  %199 = fadd double %192, %198
  %200 = load i32* %i, align 4
  %201 = add nsw i32 400009, %200
  %202 = sext i32 %201 to i64
  %203 = load double** %1, align 8
  %204 = getelementptr inbounds double* %203, i64 %202
  %205 = load double* %204, align 8
  %206 = fadd double %199, %205
  %207 = load i32* %i, align 4
  %208 = add nsw i32 400010, %207
  %209 = sext i32 %208 to i64
  %210 = load double** %1, align 8
  %211 = getelementptr inbounds double* %210, i64 %209
  %212 = load double* %211, align 8
  %213 = fadd double %206, %212
  %214 = load i32* %i, align 4
  %215 = add nsw i32 400011, %214
  %216 = sext i32 %215 to i64
  %217 = load double** %1, align 8
  %218 = getelementptr inbounds double* %217, i64 %216
  %219 = load double* %218, align 8
  %220 = fadd double %213, %219
  %221 = load i32* %i, align 4
  %222 = add nsw i32 400012, %221
  %223 = sext i32 %222 to i64
  %224 = load double** %1, align 8
  %225 = getelementptr inbounds double* %224, i64 %223
  %226 = load double* %225, align 8
  %227 = fadd double %220, %226
  %228 = load i32* %i, align 4
  %229 = add nsw i32 400013, %228
  %230 = sext i32 %229 to i64
  %231 = load double** %1, align 8
  %232 = getelementptr inbounds double* %231, i64 %230
  %233 = load double* %232, align 8
  %234 = fadd double %227, %233
  %235 = load i32* %i, align 4
  %236 = add nsw i32 400014, %235
  %237 = sext i32 %236 to i64
  %238 = load double** %1, align 8
  %239 = getelementptr inbounds double* %238, i64 %237
  %240 = load double* %239, align 8
  %241 = fadd double %234, %240
  %242 = load i32* %i, align 4
  %243 = add nsw i32 400015, %242
  %244 = sext i32 %243 to i64
  %245 = load double** %1, align 8
  %246 = getelementptr inbounds double* %245, i64 %244
  %247 = load double* %246, align 8
  %248 = fadd double %241, %247
  %249 = load i32* %i, align 4
  %250 = add nsw i32 400016, %249
  %251 = sext i32 %250 to i64
  %252 = load double** %1, align 8
  %253 = getelementptr inbounds double* %252, i64 %251
  %254 = load double* %253, align 8
  %255 = fadd double %248, %254
  %256 = load i32* %i, align 4
  %257 = add nsw i32 400017, %256
  %258 = sext i32 %257 to i64
  %259 = load double** %1, align 8
  %260 = getelementptr inbounds double* %259, i64 %258
  %261 = load double* %260, align 8
  %262 = fadd double %255, %261
  %263 = load i32* %i, align 4
  %264 = add nsw i32 400018, %263
  %265 = sext i32 %264 to i64
  %266 = load double** %1, align 8
  %267 = getelementptr inbounds double* %266, i64 %265
  %268 = load double* %267, align 8
  %269 = fadd double %262, %268
  store double %269, double* %rho2, align 8
  %270 = load double* %rho1, align 8
  %271 = fmul double 2.000000e+00, %270
  %272 = load double* %rho2, align 8
  %273 = fsub double %271, %272
  store double %273, double* %rho, align 8
  %274 = load i32* %i, align 4
  %275 = sdiv i32 %274, 20
  %276 = srem i32 %275, 100
  %277 = sitofp i32 %276 to double
  %278 = fdiv double %277, 4.950000e+01
  %279 = fsub double %278, 1.000000e+00
  store double %279, double* %px, align 8
  %280 = load i32* %i, align 4
  %281 = sdiv i32 %280, 20
  %282 = sdiv i32 %281, 100
  %283 = srem i32 %282, 100
  %284 = sitofp i32 %283 to double
  %285 = fdiv double %284, 4.950000e+01
  %286 = fsub double %285, 1.000000e+00
  store double %286, double* %py, align 8
  store double 0.000000e+00, double* %ux, align 8
  store double 0.000000e+00, double* %uy, align 8
  %287 = load double* %px, align 8
  %288 = load double* %px, align 8
  %289 = fmul double %287, %288
  %290 = fsub double 1.000000e+00, %289
  %291 = fmul double 1.000000e-02, %290
  %292 = load double* %py, align 8
  %293 = load double* %py, align 8
  %294 = fmul double %292, %293
  %295 = fsub double 1.000000e+00, %294
  %296 = fmul double %291, %295
  store double %296, double* %uz, align 8
  %297 = load double* %ux, align 8
  %298 = load double* %ux, align 8
  %299 = fmul double %297, %298
  %300 = load double* %uy, align 8
  %301 = load double* %uy, align 8
  %302 = fmul double %300, %301
  %303 = fadd double %299, %302
  %304 = load double* %uz, align 8
  %305 = load double* %uz, align 8
  %306 = fmul double %304, %305
  %307 = fadd double %303, %306
  %308 = fmul double 1.500000e+00, %307
  store double %308, double* %u2, align 8
  %309 = load double* %rho, align 8
  %310 = fmul double 0x3FD5555555555555, %309
  %311 = load double* %u2, align 8
  %312 = fsub double 1.000000e+00, %311
  %313 = fmul double %310, %312
  %314 = load i32* %i, align 4
  %315 = add nsw i32 0, %314
  %316 = sext i32 %315 to i64
  %317 = load double** %1, align 8
  %318 = getelementptr inbounds double* %317, i64 %316
  store double %313, double* %318, align 8
  %319 = load double* %rho, align 8
  %320 = fmul double 0x3FAC71C71C71C71C, %319
  %321 = load double* %uy, align 8
  %322 = load double* %uy, align 8
  %323 = fmul double 4.500000e+00, %322
  %324 = fadd double %323, 3.000000e+00
  %325 = fmul double %321, %324
  %326 = fadd double 1.000000e+00, %325
  %327 = load double* %u2, align 8
  %328 = fsub double %326, %327
  %329 = fmul double %320, %328
  %330 = load i32* %i, align 4
  %331 = add nsw i32 1, %330
  %332 = sext i32 %331 to i64
  %333 = load double** %1, align 8
  %334 = getelementptr inbounds double* %333, i64 %332
  store double %329, double* %334, align 8
  %335 = load double* %rho, align 8
  %336 = fmul double 0x3FAC71C71C71C71C, %335
  %337 = load double* %uy, align 8
  %338 = load double* %uy, align 8
  %339 = fmul double 4.500000e+00, %338
  %340 = fsub double %339, 3.000000e+00
  %341 = fmul double %337, %340
  %342 = fadd double 1.000000e+00, %341
  %343 = load double* %u2, align 8
  %344 = fsub double %342, %343
  %345 = fmul double %336, %344
  %346 = load i32* %i, align 4
  %347 = add nsw i32 2, %346
  %348 = sext i32 %347 to i64
  %349 = load double** %1, align 8
  %350 = getelementptr inbounds double* %349, i64 %348
  store double %345, double* %350, align 8
  %351 = load double* %rho, align 8
  %352 = fmul double 0x3FAC71C71C71C71C, %351
  %353 = load double* %ux, align 8
  %354 = load double* %ux, align 8
  %355 = fmul double 4.500000e+00, %354
  %356 = fadd double %355, 3.000000e+00
  %357 = fmul double %353, %356
  %358 = fadd double 1.000000e+00, %357
  %359 = load double* %u2, align 8
  %360 = fsub double %358, %359
  %361 = fmul double %352, %360
  %362 = load i32* %i, align 4
  %363 = add nsw i32 3, %362
  %364 = sext i32 %363 to i64
  %365 = load double** %1, align 8
  %366 = getelementptr inbounds double* %365, i64 %364
  store double %361, double* %366, align 8
  %367 = load double* %rho, align 8
  %368 = fmul double 0x3FAC71C71C71C71C, %367
  %369 = load double* %ux, align 8
  %370 = load double* %ux, align 8
  %371 = fmul double 4.500000e+00, %370
  %372 = fsub double %371, 3.000000e+00
  %373 = fmul double %369, %372
  %374 = fadd double 1.000000e+00, %373
  %375 = load double* %u2, align 8
  %376 = fsub double %374, %375
  %377 = fmul double %368, %376
  %378 = load i32* %i, align 4
  %379 = add nsw i32 4, %378
  %380 = sext i32 %379 to i64
  %381 = load double** %1, align 8
  %382 = getelementptr inbounds double* %381, i64 %380
  store double %377, double* %382, align 8
  %383 = load double* %rho, align 8
  %384 = fmul double 0x3FAC71C71C71C71C, %383
  %385 = load double* %uz, align 8
  %386 = load double* %uz, align 8
  %387 = fmul double 4.500000e+00, %386
  %388 = fadd double %387, 3.000000e+00
  %389 = fmul double %385, %388
  %390 = fadd double 1.000000e+00, %389
  %391 = load double* %u2, align 8
  %392 = fsub double %390, %391
  %393 = fmul double %384, %392
  %394 = load i32* %i, align 4
  %395 = add nsw i32 5, %394
  %396 = sext i32 %395 to i64
  %397 = load double** %1, align 8
  %398 = getelementptr inbounds double* %397, i64 %396
  store double %393, double* %398, align 8
  %399 = load double* %rho, align 8
  %400 = fmul double 0x3FAC71C71C71C71C, %399
  %401 = load double* %uz, align 8
  %402 = load double* %uz, align 8
  %403 = fmul double 4.500000e+00, %402
  %404 = fsub double %403, 3.000000e+00
  %405 = fmul double %401, %404
  %406 = fadd double 1.000000e+00, %405
  %407 = load double* %u2, align 8
  %408 = fsub double %406, %407
  %409 = fmul double %400, %408
  %410 = load i32* %i, align 4
  %411 = add nsw i32 6, %410
  %412 = sext i32 %411 to i64
  %413 = load double** %1, align 8
  %414 = getelementptr inbounds double* %413, i64 %412
  store double %409, double* %414, align 8
  %415 = load double* %rho, align 8
  %416 = fmul double 0x3F9C71C71C71C71C, %415
  %417 = load double* %ux, align 8
  %418 = load double* %uy, align 8
  %419 = fadd double %417, %418
  %420 = load double* %ux, align 8
  %421 = load double* %uy, align 8
  %422 = fadd double %420, %421
  %423 = fmul double 4.500000e+00, %422
  %424 = fadd double %423, 3.000000e+00
  %425 = fmul double %419, %424
  %426 = fadd double 1.000000e+00, %425
  %427 = load double* %u2, align 8
  %428 = fsub double %426, %427
  %429 = fmul double %416, %428
  %430 = load i32* %i, align 4
  %431 = add nsw i32 7, %430
  %432 = sext i32 %431 to i64
  %433 = load double** %1, align 8
  %434 = getelementptr inbounds double* %433, i64 %432
  store double %429, double* %434, align 8
  %435 = load double* %rho, align 8
  %436 = fmul double 0x3F9C71C71C71C71C, %435
  %437 = load double* %ux, align 8
  %438 = fsub double -0.000000e+00, %437
  %439 = load double* %uy, align 8
  %440 = fadd double %438, %439
  %441 = load double* %ux, align 8
  %442 = fsub double -0.000000e+00, %441
  %443 = load double* %uy, align 8
  %444 = fadd double %442, %443
  %445 = fmul double 4.500000e+00, %444
  %446 = fadd double %445, 3.000000e+00
  %447 = fmul double %440, %446
  %448 = fadd double 1.000000e+00, %447
  %449 = load double* %u2, align 8
  %450 = fsub double %448, %449
  %451 = fmul double %436, %450
  %452 = load i32* %i, align 4
  %453 = add nsw i32 8, %452
  %454 = sext i32 %453 to i64
  %455 = load double** %1, align 8
  %456 = getelementptr inbounds double* %455, i64 %454
  store double %451, double* %456, align 8
  %457 = load double* %rho, align 8
  %458 = fmul double 0x3F9C71C71C71C71C, %457
  %459 = load double* %ux, align 8
  %460 = load double* %uy, align 8
  %461 = fsub double %459, %460
  %462 = load double* %ux, align 8
  %463 = load double* %uy, align 8
  %464 = fsub double %462, %463
  %465 = fmul double 4.500000e+00, %464
  %466 = fadd double %465, 3.000000e+00
  %467 = fmul double %461, %466
  %468 = fadd double 1.000000e+00, %467
  %469 = load double* %u2, align 8
  %470 = fsub double %468, %469
  %471 = fmul double %458, %470
  %472 = load i32* %i, align 4
  %473 = add nsw i32 9, %472
  %474 = sext i32 %473 to i64
  %475 = load double** %1, align 8
  %476 = getelementptr inbounds double* %475, i64 %474
  store double %471, double* %476, align 8
  %477 = load double* %rho, align 8
  %478 = fmul double 0x3F9C71C71C71C71C, %477
  %479 = load double* %ux, align 8
  %480 = fsub double -0.000000e+00, %479
  %481 = load double* %uy, align 8
  %482 = fsub double %480, %481
  %483 = load double* %ux, align 8
  %484 = fsub double -0.000000e+00, %483
  %485 = load double* %uy, align 8
  %486 = fsub double %484, %485
  %487 = fmul double 4.500000e+00, %486
  %488 = fadd double %487, 3.000000e+00
  %489 = fmul double %482, %488
  %490 = fadd double 1.000000e+00, %489
  %491 = load double* %u2, align 8
  %492 = fsub double %490, %491
  %493 = fmul double %478, %492
  %494 = load i32* %i, align 4
  %495 = add nsw i32 10, %494
  %496 = sext i32 %495 to i64
  %497 = load double** %1, align 8
  %498 = getelementptr inbounds double* %497, i64 %496
  store double %493, double* %498, align 8
  %499 = load double* %rho, align 8
  %500 = fmul double 0x3F9C71C71C71C71C, %499
  %501 = load double* %uy, align 8
  %502 = load double* %uz, align 8
  %503 = fadd double %501, %502
  %504 = load double* %uy, align 8
  %505 = load double* %uz, align 8
  %506 = fadd double %504, %505
  %507 = fmul double 4.500000e+00, %506
  %508 = fadd double %507, 3.000000e+00
  %509 = fmul double %503, %508
  %510 = fadd double 1.000000e+00, %509
  %511 = load double* %u2, align 8
  %512 = fsub double %510, %511
  %513 = fmul double %500, %512
  %514 = load i32* %i, align 4
  %515 = add nsw i32 11, %514
  %516 = sext i32 %515 to i64
  %517 = load double** %1, align 8
  %518 = getelementptr inbounds double* %517, i64 %516
  store double %513, double* %518, align 8
  %519 = load double* %rho, align 8
  %520 = fmul double 0x3F9C71C71C71C71C, %519
  %521 = load double* %uy, align 8
  %522 = load double* %uz, align 8
  %523 = fsub double %521, %522
  %524 = load double* %uy, align 8
  %525 = load double* %uz, align 8
  %526 = fsub double %524, %525
  %527 = fmul double 4.500000e+00, %526
  %528 = fadd double %527, 3.000000e+00
  %529 = fmul double %523, %528
  %530 = fadd double 1.000000e+00, %529
  %531 = load double* %u2, align 8
  %532 = fsub double %530, %531
  %533 = fmul double %520, %532
  %534 = load i32* %i, align 4
  %535 = add nsw i32 12, %534
  %536 = sext i32 %535 to i64
  %537 = load double** %1, align 8
  %538 = getelementptr inbounds double* %537, i64 %536
  store double %533, double* %538, align 8
  %539 = load double* %rho, align 8
  %540 = fmul double 0x3F9C71C71C71C71C, %539
  %541 = load double* %uy, align 8
  %542 = fsub double -0.000000e+00, %541
  %543 = load double* %uz, align 8
  %544 = fadd double %542, %543
  %545 = load double* %uy, align 8
  %546 = fsub double -0.000000e+00, %545
  %547 = load double* %uz, align 8
  %548 = fadd double %546, %547
  %549 = fmul double 4.500000e+00, %548
  %550 = fadd double %549, 3.000000e+00
  %551 = fmul double %544, %550
  %552 = fadd double 1.000000e+00, %551
  %553 = load double* %u2, align 8
  %554 = fsub double %552, %553
  %555 = fmul double %540, %554
  %556 = load i32* %i, align 4
  %557 = add nsw i32 13, %556
  %558 = sext i32 %557 to i64
  %559 = load double** %1, align 8
  %560 = getelementptr inbounds double* %559, i64 %558
  store double %555, double* %560, align 8
  %561 = load double* %rho, align 8
  %562 = fmul double 0x3F9C71C71C71C71C, %561
  %563 = load double* %uy, align 8
  %564 = fsub double -0.000000e+00, %563
  %565 = load double* %uz, align 8
  %566 = fsub double %564, %565
  %567 = load double* %uy, align 8
  %568 = fsub double -0.000000e+00, %567
  %569 = load double* %uz, align 8
  %570 = fsub double %568, %569
  %571 = fmul double 4.500000e+00, %570
  %572 = fadd double %571, 3.000000e+00
  %573 = fmul double %566, %572
  %574 = fadd double 1.000000e+00, %573
  %575 = load double* %u2, align 8
  %576 = fsub double %574, %575
  %577 = fmul double %562, %576
  %578 = load i32* %i, align 4
  %579 = add nsw i32 14, %578
  %580 = sext i32 %579 to i64
  %581 = load double** %1, align 8
  %582 = getelementptr inbounds double* %581, i64 %580
  store double %577, double* %582, align 8
  %583 = load double* %rho, align 8
  %584 = fmul double 0x3F9C71C71C71C71C, %583
  %585 = load double* %ux, align 8
  %586 = load double* %uz, align 8
  %587 = fadd double %585, %586
  %588 = load double* %ux, align 8
  %589 = load double* %uz, align 8
  %590 = fadd double %588, %589
  %591 = fmul double 4.500000e+00, %590
  %592 = fadd double %591, 3.000000e+00
  %593 = fmul double %587, %592
  %594 = fadd double 1.000000e+00, %593
  %595 = load double* %u2, align 8
  %596 = fsub double %594, %595
  %597 = fmul double %584, %596
  %598 = load i32* %i, align 4
  %599 = add nsw i32 15, %598
  %600 = sext i32 %599 to i64
  %601 = load double** %1, align 8
  %602 = getelementptr inbounds double* %601, i64 %600
  store double %597, double* %602, align 8
  %603 = load double* %rho, align 8
  %604 = fmul double 0x3F9C71C71C71C71C, %603
  %605 = load double* %ux, align 8
  %606 = load double* %uz, align 8
  %607 = fsub double %605, %606
  %608 = load double* %ux, align 8
  %609 = load double* %uz, align 8
  %610 = fsub double %608, %609
  %611 = fmul double 4.500000e+00, %610
  %612 = fadd double %611, 3.000000e+00
  %613 = fmul double %607, %612
  %614 = fadd double 1.000000e+00, %613
  %615 = load double* %u2, align 8
  %616 = fsub double %614, %615
  %617 = fmul double %604, %616
  %618 = load i32* %i, align 4
  %619 = add nsw i32 16, %618
  %620 = sext i32 %619 to i64
  %621 = load double** %1, align 8
  %622 = getelementptr inbounds double* %621, i64 %620
  store double %617, double* %622, align 8
  %623 = load double* %rho, align 8
  %624 = fmul double 0x3F9C71C71C71C71C, %623
  %625 = load double* %ux, align 8
  %626 = fsub double -0.000000e+00, %625
  %627 = load double* %uz, align 8
  %628 = fadd double %626, %627
  %629 = load double* %ux, align 8
  %630 = fsub double -0.000000e+00, %629
  %631 = load double* %uz, align 8
  %632 = fadd double %630, %631
  %633 = fmul double 4.500000e+00, %632
  %634 = fadd double %633, 3.000000e+00
  %635 = fmul double %628, %634
  %636 = fadd double 1.000000e+00, %635
  %637 = load double* %u2, align 8
  %638 = fsub double %636, %637
  %639 = fmul double %624, %638
  %640 = load i32* %i, align 4
  %641 = add nsw i32 17, %640
  %642 = sext i32 %641 to i64
  %643 = load double** %1, align 8
  %644 = getelementptr inbounds double* %643, i64 %642
  store double %639, double* %644, align 8
  %645 = load double* %rho, align 8
  %646 = fmul double 0x3F9C71C71C71C71C, %645
  %647 = load double* %ux, align 8
  %648 = fsub double -0.000000e+00, %647
  %649 = load double* %uz, align 8
  %650 = fsub double %648, %649
  %651 = load double* %ux, align 8
  %652 = fsub double -0.000000e+00, %651
  %653 = load double* %uz, align 8
  %654 = fsub double %652, %653
  %655 = fmul double 4.500000e+00, %654
  %656 = fadd double %655, 3.000000e+00
  %657 = fmul double %650, %656
  %658 = fadd double 1.000000e+00, %657
  %659 = load double* %u2, align 8
  %660 = fsub double %658, %659
  %661 = fmul double %646, %660
  %662 = load i32* %i, align 4
  %663 = add nsw i32 18, %662
  %664 = sext i32 %663 to i64
  %665 = load double** %1, align 8
  %666 = getelementptr inbounds double* %665, i64 %664
  store double %661, double* %666, align 8
  br label %667

; <label>:667                                     ; preds = %5
  %668 = load i32* %i, align 4
  %669 = add nsw i32 %668, 20
  store i32 %669, i32* %i, align 4
  br label %2

; <label>:670                                     ; preds = %2
  store i32 25800000, i32* %i, align 4
  br label %671

; <label>:671                                     ; preds = %1753, %670
  %672 = load i32* %i, align 4
  %673 = icmp slt i32 %672, 26000000
  br i1 %673, label %674, label %1756

; <label>:674                                     ; preds = %671
  %675 = load i32* %i, align 4
  %676 = add nsw i32 -200000, %675
  %677 = sext i32 %676 to i64
  %678 = load double** %1, align 8
  %679 = getelementptr inbounds double* %678, i64 %677
  %680 = load double* %679, align 8
  %681 = load i32* %i, align 4
  %682 = add nsw i32 -199999, %681
  %683 = sext i32 %682 to i64
  %684 = load double** %1, align 8
  %685 = getelementptr inbounds double* %684, i64 %683
  %686 = load double* %685, align 8
  %687 = fadd double %680, %686
  %688 = load i32* %i, align 4
  %689 = add nsw i32 -199998, %688
  %690 = sext i32 %689 to i64
  %691 = load double** %1, align 8
  %692 = getelementptr inbounds double* %691, i64 %690
  %693 = load double* %692, align 8
  %694 = fadd double %687, %693
  %695 = load i32* %i, align 4
  %696 = add nsw i32 -199997, %695
  %697 = sext i32 %696 to i64
  %698 = load double** %1, align 8
  %699 = getelementptr inbounds double* %698, i64 %697
  %700 = load double* %699, align 8
  %701 = fadd double %694, %700
  %702 = load i32* %i, align 4
  %703 = add nsw i32 -199996, %702
  %704 = sext i32 %703 to i64
  %705 = load double** %1, align 8
  %706 = getelementptr inbounds double* %705, i64 %704
  %707 = load double* %706, align 8
  %708 = fadd double %701, %707
  %709 = load i32* %i, align 4
  %710 = add nsw i32 -199995, %709
  %711 = sext i32 %710 to i64
  %712 = load double** %1, align 8
  %713 = getelementptr inbounds double* %712, i64 %711
  %714 = load double* %713, align 8
  %715 = fadd double %708, %714
  %716 = load i32* %i, align 4
  %717 = add nsw i32 -199994, %716
  %718 = sext i32 %717 to i64
  %719 = load double** %1, align 8
  %720 = getelementptr inbounds double* %719, i64 %718
  %721 = load double* %720, align 8
  %722 = fadd double %715, %721
  %723 = load i32* %i, align 4
  %724 = add nsw i32 -199993, %723
  %725 = sext i32 %724 to i64
  %726 = load double** %1, align 8
  %727 = getelementptr inbounds double* %726, i64 %725
  %728 = load double* %727, align 8
  %729 = fadd double %722, %728
  %730 = load i32* %i, align 4
  %731 = add nsw i32 -199992, %730
  %732 = sext i32 %731 to i64
  %733 = load double** %1, align 8
  %734 = getelementptr inbounds double* %733, i64 %732
  %735 = load double* %734, align 8
  %736 = fadd double %729, %735
  %737 = load i32* %i, align 4
  %738 = add nsw i32 -199991, %737
  %739 = sext i32 %738 to i64
  %740 = load double** %1, align 8
  %741 = getelementptr inbounds double* %740, i64 %739
  %742 = load double* %741, align 8
  %743 = fadd double %736, %742
  %744 = load i32* %i, align 4
  %745 = add nsw i32 -199990, %744
  %746 = sext i32 %745 to i64
  %747 = load double** %1, align 8
  %748 = getelementptr inbounds double* %747, i64 %746
  %749 = load double* %748, align 8
  %750 = fadd double %743, %749
  %751 = load i32* %i, align 4
  %752 = add nsw i32 -199989, %751
  %753 = sext i32 %752 to i64
  %754 = load double** %1, align 8
  %755 = getelementptr inbounds double* %754, i64 %753
  %756 = load double* %755, align 8
  %757 = fadd double %750, %756
  %758 = load i32* %i, align 4
  %759 = add nsw i32 -199988, %758
  %760 = sext i32 %759 to i64
  %761 = load double** %1, align 8
  %762 = getelementptr inbounds double* %761, i64 %760
  %763 = load double* %762, align 8
  %764 = fadd double %757, %763
  %765 = load i32* %i, align 4
  %766 = add nsw i32 -199987, %765
  %767 = sext i32 %766 to i64
  %768 = load double** %1, align 8
  %769 = getelementptr inbounds double* %768, i64 %767
  %770 = load double* %769, align 8
  %771 = fadd double %764, %770
  %772 = load i32* %i, align 4
  %773 = add nsw i32 -199986, %772
  %774 = sext i32 %773 to i64
  %775 = load double** %1, align 8
  %776 = getelementptr inbounds double* %775, i64 %774
  %777 = load double* %776, align 8
  %778 = fadd double %771, %777
  %779 = load i32* %i, align 4
  %780 = add nsw i32 -199985, %779
  %781 = sext i32 %780 to i64
  %782 = load double** %1, align 8
  %783 = getelementptr inbounds double* %782, i64 %781
  %784 = load double* %783, align 8
  %785 = fadd double %778, %784
  %786 = load i32* %i, align 4
  %787 = add nsw i32 -199984, %786
  %788 = sext i32 %787 to i64
  %789 = load double** %1, align 8
  %790 = getelementptr inbounds double* %789, i64 %788
  %791 = load double* %790, align 8
  %792 = fadd double %785, %791
  %793 = load i32* %i, align 4
  %794 = add nsw i32 -199983, %793
  %795 = sext i32 %794 to i64
  %796 = load double** %1, align 8
  %797 = getelementptr inbounds double* %796, i64 %795
  %798 = load double* %797, align 8
  %799 = fadd double %792, %798
  %800 = load i32* %i, align 4
  %801 = add nsw i32 -199982, %800
  %802 = sext i32 %801 to i64
  %803 = load double** %1, align 8
  %804 = getelementptr inbounds double* %803, i64 %802
  %805 = load double* %804, align 8
  %806 = fadd double %799, %805
  store double %806, double* %rho1, align 8
  %807 = load i32* %i, align 4
  %808 = add nsw i32 -199997, %807
  %809 = sext i32 %808 to i64
  %810 = load double** %1, align 8
  %811 = getelementptr inbounds double* %810, i64 %809
  %812 = load double* %811, align 8
  %813 = load i32* %i, align 4
  %814 = add nsw i32 -199996, %813
  %815 = sext i32 %814 to i64
  %816 = load double** %1, align 8
  %817 = getelementptr inbounds double* %816, i64 %815
  %818 = load double* %817, align 8
  %819 = fsub double %812, %818
  %820 = load i32* %i, align 4
  %821 = add nsw i32 -199993, %820
  %822 = sext i32 %821 to i64
  %823 = load double** %1, align 8
  %824 = getelementptr inbounds double* %823, i64 %822
  %825 = load double* %824, align 8
  %826 = fadd double %819, %825
  %827 = load i32* %i, align 4
  %828 = add nsw i32 -199992, %827
  %829 = sext i32 %828 to i64
  %830 = load double** %1, align 8
  %831 = getelementptr inbounds double* %830, i64 %829
  %832 = load double* %831, align 8
  %833 = fsub double %826, %832
  %834 = load i32* %i, align 4
  %835 = add nsw i32 -199991, %834
  %836 = sext i32 %835 to i64
  %837 = load double** %1, align 8
  %838 = getelementptr inbounds double* %837, i64 %836
  %839 = load double* %838, align 8
  %840 = fadd double %833, %839
  %841 = load i32* %i, align 4
  %842 = add nsw i32 -199990, %841
  %843 = sext i32 %842 to i64
  %844 = load double** %1, align 8
  %845 = getelementptr inbounds double* %844, i64 %843
  %846 = load double* %845, align 8
  %847 = fsub double %840, %846
  %848 = load i32* %i, align 4
  %849 = add nsw i32 -199985, %848
  %850 = sext i32 %849 to i64
  %851 = load double** %1, align 8
  %852 = getelementptr inbounds double* %851, i64 %850
  %853 = load double* %852, align 8
  %854 = fadd double %847, %853
  %855 = load i32* %i, align 4
  %856 = add nsw i32 -199984, %855
  %857 = sext i32 %856 to i64
  %858 = load double** %1, align 8
  %859 = getelementptr inbounds double* %858, i64 %857
  %860 = load double* %859, align 8
  %861 = fadd double %854, %860
  %862 = load i32* %i, align 4
  %863 = add nsw i32 -199983, %862
  %864 = sext i32 %863 to i64
  %865 = load double** %1, align 8
  %866 = getelementptr inbounds double* %865, i64 %864
  %867 = load double* %866, align 8
  %868 = fsub double %861, %867
  %869 = load i32* %i, align 4
  %870 = add nsw i32 -199982, %869
  %871 = sext i32 %870 to i64
  %872 = load double** %1, align 8
  %873 = getelementptr inbounds double* %872, i64 %871
  %874 = load double* %873, align 8
  %875 = fsub double %868, %874
  store double %875, double* %ux1, align 8
  %876 = load i32* %i, align 4
  %877 = add nsw i32 -199999, %876
  %878 = sext i32 %877 to i64
  %879 = load double** %1, align 8
  %880 = getelementptr inbounds double* %879, i64 %878
  %881 = load double* %880, align 8
  %882 = load i32* %i, align 4
  %883 = add nsw i32 -199998, %882
  %884 = sext i32 %883 to i64
  %885 = load double** %1, align 8
  %886 = getelementptr inbounds double* %885, i64 %884
  %887 = load double* %886, align 8
  %888 = fsub double %881, %887
  %889 = load i32* %i, align 4
  %890 = add nsw i32 -199993, %889
  %891 = sext i32 %890 to i64
  %892 = load double** %1, align 8
  %893 = getelementptr inbounds double* %892, i64 %891
  %894 = load double* %893, align 8
  %895 = fadd double %888, %894
  %896 = load i32* %i, align 4
  %897 = add nsw i32 -199992, %896
  %898 = sext i32 %897 to i64
  %899 = load double** %1, align 8
  %900 = getelementptr inbounds double* %899, i64 %898
  %901 = load double* %900, align 8
  %902 = fadd double %895, %901
  %903 = load i32* %i, align 4
  %904 = add nsw i32 -199991, %903
  %905 = sext i32 %904 to i64
  %906 = load double** %1, align 8
  %907 = getelementptr inbounds double* %906, i64 %905
  %908 = load double* %907, align 8
  %909 = fsub double %902, %908
  %910 = load i32* %i, align 4
  %911 = add nsw i32 -199990, %910
  %912 = sext i32 %911 to i64
  %913 = load double** %1, align 8
  %914 = getelementptr inbounds double* %913, i64 %912
  %915 = load double* %914, align 8
  %916 = fsub double %909, %915
  %917 = load i32* %i, align 4
  %918 = add nsw i32 -199989, %917
  %919 = sext i32 %918 to i64
  %920 = load double** %1, align 8
  %921 = getelementptr inbounds double* %920, i64 %919
  %922 = load double* %921, align 8
  %923 = fadd double %916, %922
  %924 = load i32* %i, align 4
  %925 = add nsw i32 -199988, %924
  %926 = sext i32 %925 to i64
  %927 = load double** %1, align 8
  %928 = getelementptr inbounds double* %927, i64 %926
  %929 = load double* %928, align 8
  %930 = fadd double %923, %929
  %931 = load i32* %i, align 4
  %932 = add nsw i32 -199987, %931
  %933 = sext i32 %932 to i64
  %934 = load double** %1, align 8
  %935 = getelementptr inbounds double* %934, i64 %933
  %936 = load double* %935, align 8
  %937 = fsub double %930, %936
  %938 = load i32* %i, align 4
  %939 = add nsw i32 -199986, %938
  %940 = sext i32 %939 to i64
  %941 = load double** %1, align 8
  %942 = getelementptr inbounds double* %941, i64 %940
  %943 = load double* %942, align 8
  %944 = fsub double %937, %943
  store double %944, double* %uy1, align 8
  %945 = load i32* %i, align 4
  %946 = add nsw i32 -199995, %945
  %947 = sext i32 %946 to i64
  %948 = load double** %1, align 8
  %949 = getelementptr inbounds double* %948, i64 %947
  %950 = load double* %949, align 8
  %951 = load i32* %i, align 4
  %952 = add nsw i32 -199994, %951
  %953 = sext i32 %952 to i64
  %954 = load double** %1, align 8
  %955 = getelementptr inbounds double* %954, i64 %953
  %956 = load double* %955, align 8
  %957 = fsub double %950, %956
  %958 = load i32* %i, align 4
  %959 = add nsw i32 -199989, %958
  %960 = sext i32 %959 to i64
  %961 = load double** %1, align 8
  %962 = getelementptr inbounds double* %961, i64 %960
  %963 = load double* %962, align 8
  %964 = fadd double %957, %963
  %965 = load i32* %i, align 4
  %966 = add nsw i32 -199988, %965
  %967 = sext i32 %966 to i64
  %968 = load double** %1, align 8
  %969 = getelementptr inbounds double* %968, i64 %967
  %970 = load double* %969, align 8
  %971 = fsub double %964, %970
  %972 = load i32* %i, align 4
  %973 = add nsw i32 -199987, %972
  %974 = sext i32 %973 to i64
  %975 = load double** %1, align 8
  %976 = getelementptr inbounds double* %975, i64 %974
  %977 = load double* %976, align 8
  %978 = fadd double %971, %977
  %979 = load i32* %i, align 4
  %980 = add nsw i32 -199986, %979
  %981 = sext i32 %980 to i64
  %982 = load double** %1, align 8
  %983 = getelementptr inbounds double* %982, i64 %981
  %984 = load double* %983, align 8
  %985 = fsub double %978, %984
  %986 = load i32* %i, align 4
  %987 = add nsw i32 -199985, %986
  %988 = sext i32 %987 to i64
  %989 = load double** %1, align 8
  %990 = getelementptr inbounds double* %989, i64 %988
  %991 = load double* %990, align 8
  %992 = fadd double %985, %991
  %993 = load i32* %i, align 4
  %994 = add nsw i32 -199984, %993
  %995 = sext i32 %994 to i64
  %996 = load double** %1, align 8
  %997 = getelementptr inbounds double* %996, i64 %995
  %998 = load double* %997, align 8
  %999 = fsub double %992, %998
  %1000 = load i32* %i, align 4
  %1001 = add nsw i32 -199983, %1000
  %1002 = sext i32 %1001 to i64
  %1003 = load double** %1, align 8
  %1004 = getelementptr inbounds double* %1003, i64 %1002
  %1005 = load double* %1004, align 8
  %1006 = fadd double %999, %1005
  %1007 = load i32* %i, align 4
  %1008 = add nsw i32 -199982, %1007
  %1009 = sext i32 %1008 to i64
  %1010 = load double** %1, align 8
  %1011 = getelementptr inbounds double* %1010, i64 %1009
  %1012 = load double* %1011, align 8
  %1013 = fsub double %1006, %1012
  store double %1013, double* %uz1, align 8
  %1014 = load double* %rho1, align 8
  %1015 = load double* %ux1, align 8
  %1016 = fdiv double %1015, %1014
  store double %1016, double* %ux1, align 8
  %1017 = load double* %rho1, align 8
  %1018 = load double* %uy1, align 8
  %1019 = fdiv double %1018, %1017
  store double %1019, double* %uy1, align 8
  %1020 = load double* %rho1, align 8
  %1021 = load double* %uz1, align 8
  %1022 = fdiv double %1021, %1020
  store double %1022, double* %uz1, align 8
  %1023 = load i32* %i, align 4
  %1024 = add nsw i32 -400000, %1023
  %1025 = sext i32 %1024 to i64
  %1026 = load double** %1, align 8
  %1027 = getelementptr inbounds double* %1026, i64 %1025
  %1028 = load double* %1027, align 8
  %1029 = load i32* %i, align 4
  %1030 = add nsw i32 -399999, %1029
  %1031 = sext i32 %1030 to i64
  %1032 = load double** %1, align 8
  %1033 = getelementptr inbounds double* %1032, i64 %1031
  %1034 = load double* %1033, align 8
  %1035 = fadd double %1028, %1034
  %1036 = load i32* %i, align 4
  %1037 = add nsw i32 -399998, %1036
  %1038 = sext i32 %1037 to i64
  %1039 = load double** %1, align 8
  %1040 = getelementptr inbounds double* %1039, i64 %1038
  %1041 = load double* %1040, align 8
  %1042 = fadd double %1035, %1041
  %1043 = load i32* %i, align 4
  %1044 = add nsw i32 -399997, %1043
  %1045 = sext i32 %1044 to i64
  %1046 = load double** %1, align 8
  %1047 = getelementptr inbounds double* %1046, i64 %1045
  %1048 = load double* %1047, align 8
  %1049 = fadd double %1042, %1048
  %1050 = load i32* %i, align 4
  %1051 = add nsw i32 -399996, %1050
  %1052 = sext i32 %1051 to i64
  %1053 = load double** %1, align 8
  %1054 = getelementptr inbounds double* %1053, i64 %1052
  %1055 = load double* %1054, align 8
  %1056 = fadd double %1049, %1055
  %1057 = load i32* %i, align 4
  %1058 = add nsw i32 -399995, %1057
  %1059 = sext i32 %1058 to i64
  %1060 = load double** %1, align 8
  %1061 = getelementptr inbounds double* %1060, i64 %1059
  %1062 = load double* %1061, align 8
  %1063 = fadd double %1056, %1062
  %1064 = load i32* %i, align 4
  %1065 = add nsw i32 -399994, %1064
  %1066 = sext i32 %1065 to i64
  %1067 = load double** %1, align 8
  %1068 = getelementptr inbounds double* %1067, i64 %1066
  %1069 = load double* %1068, align 8
  %1070 = fadd double %1063, %1069
  %1071 = load i32* %i, align 4
  %1072 = add nsw i32 -399993, %1071
  %1073 = sext i32 %1072 to i64
  %1074 = load double** %1, align 8
  %1075 = getelementptr inbounds double* %1074, i64 %1073
  %1076 = load double* %1075, align 8
  %1077 = fadd double %1070, %1076
  %1078 = load i32* %i, align 4
  %1079 = add nsw i32 -399992, %1078
  %1080 = sext i32 %1079 to i64
  %1081 = load double** %1, align 8
  %1082 = getelementptr inbounds double* %1081, i64 %1080
  %1083 = load double* %1082, align 8
  %1084 = fadd double %1077, %1083
  %1085 = load i32* %i, align 4
  %1086 = add nsw i32 -399991, %1085
  %1087 = sext i32 %1086 to i64
  %1088 = load double** %1, align 8
  %1089 = getelementptr inbounds double* %1088, i64 %1087
  %1090 = load double* %1089, align 8
  %1091 = fadd double %1084, %1090
  %1092 = load i32* %i, align 4
  %1093 = add nsw i32 -399990, %1092
  %1094 = sext i32 %1093 to i64
  %1095 = load double** %1, align 8
  %1096 = getelementptr inbounds double* %1095, i64 %1094
  %1097 = load double* %1096, align 8
  %1098 = fadd double %1091, %1097
  %1099 = load i32* %i, align 4
  %1100 = add nsw i32 -399989, %1099
  %1101 = sext i32 %1100 to i64
  %1102 = load double** %1, align 8
  %1103 = getelementptr inbounds double* %1102, i64 %1101
  %1104 = load double* %1103, align 8
  %1105 = fadd double %1098, %1104
  %1106 = load i32* %i, align 4
  %1107 = add nsw i32 -399988, %1106
  %1108 = sext i32 %1107 to i64
  %1109 = load double** %1, align 8
  %1110 = getelementptr inbounds double* %1109, i64 %1108
  %1111 = load double* %1110, align 8
  %1112 = fadd double %1105, %1111
  %1113 = load i32* %i, align 4
  %1114 = add nsw i32 -399987, %1113
  %1115 = sext i32 %1114 to i64
  %1116 = load double** %1, align 8
  %1117 = getelementptr inbounds double* %1116, i64 %1115
  %1118 = load double* %1117, align 8
  %1119 = fadd double %1112, %1118
  %1120 = load i32* %i, align 4
  %1121 = add nsw i32 -399986, %1120
  %1122 = sext i32 %1121 to i64
  %1123 = load double** %1, align 8
  %1124 = getelementptr inbounds double* %1123, i64 %1122
  %1125 = load double* %1124, align 8
  %1126 = fadd double %1119, %1125
  %1127 = load i32* %i, align 4
  %1128 = add nsw i32 -399985, %1127
  %1129 = sext i32 %1128 to i64
  %1130 = load double** %1, align 8
  %1131 = getelementptr inbounds double* %1130, i64 %1129
  %1132 = load double* %1131, align 8
  %1133 = fadd double %1126, %1132
  %1134 = load i32* %i, align 4
  %1135 = add nsw i32 -399984, %1134
  %1136 = sext i32 %1135 to i64
  %1137 = load double** %1, align 8
  %1138 = getelementptr inbounds double* %1137, i64 %1136
  %1139 = load double* %1138, align 8
  %1140 = fadd double %1133, %1139
  %1141 = load i32* %i, align 4
  %1142 = add nsw i32 -399983, %1141
  %1143 = sext i32 %1142 to i64
  %1144 = load double** %1, align 8
  %1145 = getelementptr inbounds double* %1144, i64 %1143
  %1146 = load double* %1145, align 8
  %1147 = fadd double %1140, %1146
  %1148 = load i32* %i, align 4
  %1149 = add nsw i32 -399982, %1148
  %1150 = sext i32 %1149 to i64
  %1151 = load double** %1, align 8
  %1152 = getelementptr inbounds double* %1151, i64 %1150
  %1153 = load double* %1152, align 8
  %1154 = fadd double %1147, %1153
  store double %1154, double* %rho2, align 8
  %1155 = load i32* %i, align 4
  %1156 = add nsw i32 -399997, %1155
  %1157 = sext i32 %1156 to i64
  %1158 = load double** %1, align 8
  %1159 = getelementptr inbounds double* %1158, i64 %1157
  %1160 = load double* %1159, align 8
  %1161 = load i32* %i, align 4
  %1162 = add nsw i32 -399996, %1161
  %1163 = sext i32 %1162 to i64
  %1164 = load double** %1, align 8
  %1165 = getelementptr inbounds double* %1164, i64 %1163
  %1166 = load double* %1165, align 8
  %1167 = fsub double %1160, %1166
  %1168 = load i32* %i, align 4
  %1169 = add nsw i32 -399993, %1168
  %1170 = sext i32 %1169 to i64
  %1171 = load double** %1, align 8
  %1172 = getelementptr inbounds double* %1171, i64 %1170
  %1173 = load double* %1172, align 8
  %1174 = fadd double %1167, %1173
  %1175 = load i32* %i, align 4
  %1176 = add nsw i32 -399992, %1175
  %1177 = sext i32 %1176 to i64
  %1178 = load double** %1, align 8
  %1179 = getelementptr inbounds double* %1178, i64 %1177
  %1180 = load double* %1179, align 8
  %1181 = fsub double %1174, %1180
  %1182 = load i32* %i, align 4
  %1183 = add nsw i32 -399991, %1182
  %1184 = sext i32 %1183 to i64
  %1185 = load double** %1, align 8
  %1186 = getelementptr inbounds double* %1185, i64 %1184
  %1187 = load double* %1186, align 8
  %1188 = fadd double %1181, %1187
  %1189 = load i32* %i, align 4
  %1190 = add nsw i32 -399990, %1189
  %1191 = sext i32 %1190 to i64
  %1192 = load double** %1, align 8
  %1193 = getelementptr inbounds double* %1192, i64 %1191
  %1194 = load double* %1193, align 8
  %1195 = fsub double %1188, %1194
  %1196 = load i32* %i, align 4
  %1197 = add nsw i32 -399985, %1196
  %1198 = sext i32 %1197 to i64
  %1199 = load double** %1, align 8
  %1200 = getelementptr inbounds double* %1199, i64 %1198
  %1201 = load double* %1200, align 8
  %1202 = fadd double %1195, %1201
  %1203 = load i32* %i, align 4
  %1204 = add nsw i32 -399984, %1203
  %1205 = sext i32 %1204 to i64
  %1206 = load double** %1, align 8
  %1207 = getelementptr inbounds double* %1206, i64 %1205
  %1208 = load double* %1207, align 8
  %1209 = fadd double %1202, %1208
  %1210 = load i32* %i, align 4
  %1211 = add nsw i32 -399983, %1210
  %1212 = sext i32 %1211 to i64
  %1213 = load double** %1, align 8
  %1214 = getelementptr inbounds double* %1213, i64 %1212
  %1215 = load double* %1214, align 8
  %1216 = fsub double %1209, %1215
  %1217 = load i32* %i, align 4
  %1218 = add nsw i32 -399982, %1217
  %1219 = sext i32 %1218 to i64
  %1220 = load double** %1, align 8
  %1221 = getelementptr inbounds double* %1220, i64 %1219
  %1222 = load double* %1221, align 8
  %1223 = fsub double %1216, %1222
  store double %1223, double* %ux2, align 8
  %1224 = load i32* %i, align 4
  %1225 = add nsw i32 -399999, %1224
  %1226 = sext i32 %1225 to i64
  %1227 = load double** %1, align 8
  %1228 = getelementptr inbounds double* %1227, i64 %1226
  %1229 = load double* %1228, align 8
  %1230 = load i32* %i, align 4
  %1231 = add nsw i32 -399998, %1230
  %1232 = sext i32 %1231 to i64
  %1233 = load double** %1, align 8
  %1234 = getelementptr inbounds double* %1233, i64 %1232
  %1235 = load double* %1234, align 8
  %1236 = fsub double %1229, %1235
  %1237 = load i32* %i, align 4
  %1238 = add nsw i32 -399993, %1237
  %1239 = sext i32 %1238 to i64
  %1240 = load double** %1, align 8
  %1241 = getelementptr inbounds double* %1240, i64 %1239
  %1242 = load double* %1241, align 8
  %1243 = fadd double %1236, %1242
  %1244 = load i32* %i, align 4
  %1245 = add nsw i32 -399992, %1244
  %1246 = sext i32 %1245 to i64
  %1247 = load double** %1, align 8
  %1248 = getelementptr inbounds double* %1247, i64 %1246
  %1249 = load double* %1248, align 8
  %1250 = fadd double %1243, %1249
  %1251 = load i32* %i, align 4
  %1252 = add nsw i32 -399991, %1251
  %1253 = sext i32 %1252 to i64
  %1254 = load double** %1, align 8
  %1255 = getelementptr inbounds double* %1254, i64 %1253
  %1256 = load double* %1255, align 8
  %1257 = fsub double %1250, %1256
  %1258 = load i32* %i, align 4
  %1259 = add nsw i32 -399990, %1258
  %1260 = sext i32 %1259 to i64
  %1261 = load double** %1, align 8
  %1262 = getelementptr inbounds double* %1261, i64 %1260
  %1263 = load double* %1262, align 8
  %1264 = fsub double %1257, %1263
  %1265 = load i32* %i, align 4
  %1266 = add nsw i32 -399989, %1265
  %1267 = sext i32 %1266 to i64
  %1268 = load double** %1, align 8
  %1269 = getelementptr inbounds double* %1268, i64 %1267
  %1270 = load double* %1269, align 8
  %1271 = fadd double %1264, %1270
  %1272 = load i32* %i, align 4
  %1273 = add nsw i32 -399988, %1272
  %1274 = sext i32 %1273 to i64
  %1275 = load double** %1, align 8
  %1276 = getelementptr inbounds double* %1275, i64 %1274
  %1277 = load double* %1276, align 8
  %1278 = fadd double %1271, %1277
  %1279 = load i32* %i, align 4
  %1280 = add nsw i32 -399987, %1279
  %1281 = sext i32 %1280 to i64
  %1282 = load double** %1, align 8
  %1283 = getelementptr inbounds double* %1282, i64 %1281
  %1284 = load double* %1283, align 8
  %1285 = fsub double %1278, %1284
  %1286 = load i32* %i, align 4
  %1287 = add nsw i32 -399986, %1286
  %1288 = sext i32 %1287 to i64
  %1289 = load double** %1, align 8
  %1290 = getelementptr inbounds double* %1289, i64 %1288
  %1291 = load double* %1290, align 8
  %1292 = fsub double %1285, %1291
  store double %1292, double* %uy2, align 8
  %1293 = load i32* %i, align 4
  %1294 = add nsw i32 -399995, %1293
  %1295 = sext i32 %1294 to i64
  %1296 = load double** %1, align 8
  %1297 = getelementptr inbounds double* %1296, i64 %1295
  %1298 = load double* %1297, align 8
  %1299 = load i32* %i, align 4
  %1300 = add nsw i32 -399994, %1299
  %1301 = sext i32 %1300 to i64
  %1302 = load double** %1, align 8
  %1303 = getelementptr inbounds double* %1302, i64 %1301
  %1304 = load double* %1303, align 8
  %1305 = fsub double %1298, %1304
  %1306 = load i32* %i, align 4
  %1307 = add nsw i32 -399989, %1306
  %1308 = sext i32 %1307 to i64
  %1309 = load double** %1, align 8
  %1310 = getelementptr inbounds double* %1309, i64 %1308
  %1311 = load double* %1310, align 8
  %1312 = fadd double %1305, %1311
  %1313 = load i32* %i, align 4
  %1314 = add nsw i32 -399988, %1313
  %1315 = sext i32 %1314 to i64
  %1316 = load double** %1, align 8
  %1317 = getelementptr inbounds double* %1316, i64 %1315
  %1318 = load double* %1317, align 8
  %1319 = fsub double %1312, %1318
  %1320 = load i32* %i, align 4
  %1321 = add nsw i32 -399987, %1320
  %1322 = sext i32 %1321 to i64
  %1323 = load double** %1, align 8
  %1324 = getelementptr inbounds double* %1323, i64 %1322
  %1325 = load double* %1324, align 8
  %1326 = fadd double %1319, %1325
  %1327 = load i32* %i, align 4
  %1328 = add nsw i32 -399986, %1327
  %1329 = sext i32 %1328 to i64
  %1330 = load double** %1, align 8
  %1331 = getelementptr inbounds double* %1330, i64 %1329
  %1332 = load double* %1331, align 8
  %1333 = fsub double %1326, %1332
  %1334 = load i32* %i, align 4
  %1335 = add nsw i32 -399985, %1334
  %1336 = sext i32 %1335 to i64
  %1337 = load double** %1, align 8
  %1338 = getelementptr inbounds double* %1337, i64 %1336
  %1339 = load double* %1338, align 8
  %1340 = fadd double %1333, %1339
  %1341 = load i32* %i, align 4
  %1342 = add nsw i32 -399984, %1341
  %1343 = sext i32 %1342 to i64
  %1344 = load double** %1, align 8
  %1345 = getelementptr inbounds double* %1344, i64 %1343
  %1346 = load double* %1345, align 8
  %1347 = fsub double %1340, %1346
  %1348 = load i32* %i, align 4
  %1349 = add nsw i32 -399983, %1348
  %1350 = sext i32 %1349 to i64
  %1351 = load double** %1, align 8
  %1352 = getelementptr inbounds double* %1351, i64 %1350
  %1353 = load double* %1352, align 8
  %1354 = fadd double %1347, %1353
  %1355 = load i32* %i, align 4
  %1356 = add nsw i32 -399982, %1355
  %1357 = sext i32 %1356 to i64
  %1358 = load double** %1, align 8
  %1359 = getelementptr inbounds double* %1358, i64 %1357
  %1360 = load double* %1359, align 8
  %1361 = fsub double %1354, %1360
  store double %1361, double* %uz2, align 8
  %1362 = load double* %rho2, align 8
  %1363 = load double* %ux2, align 8
  %1364 = fdiv double %1363, %1362
  store double %1364, double* %ux2, align 8
  %1365 = load double* %rho2, align 8
  %1366 = load double* %uy2, align 8
  %1367 = fdiv double %1366, %1365
  store double %1367, double* %uy2, align 8
  %1368 = load double* %rho2, align 8
  %1369 = load double* %uz2, align 8
  %1370 = fdiv double %1369, %1368
  store double %1370, double* %uz2, align 8
  store double 1.000000e+00, double* %rho, align 8
  %1371 = load double* %ux1, align 8
  %1372 = fmul double 2.000000e+00, %1371
  %1373 = load double* %ux2, align 8
  %1374 = fsub double %1372, %1373
  store double %1374, double* %ux, align 8
  %1375 = load double* %uy1, align 8
  %1376 = fmul double 2.000000e+00, %1375
  %1377 = load double* %uy2, align 8
  %1378 = fsub double %1376, %1377
  store double %1378, double* %uy, align 8
  %1379 = load double* %uz1, align 8
  %1380 = fmul double 2.000000e+00, %1379
  %1381 = load double* %uz2, align 8
  %1382 = fsub double %1380, %1381
  store double %1382, double* %uz, align 8
  %1383 = load double* %ux, align 8
  %1384 = load double* %ux, align 8
  %1385 = fmul double %1383, %1384
  %1386 = load double* %uy, align 8
  %1387 = load double* %uy, align 8
  %1388 = fmul double %1386, %1387
  %1389 = fadd double %1385, %1388
  %1390 = load double* %uz, align 8
  %1391 = load double* %uz, align 8
  %1392 = fmul double %1390, %1391
  %1393 = fadd double %1389, %1392
  %1394 = fmul double 1.500000e+00, %1393
  store double %1394, double* %u2, align 8
  %1395 = load double* %rho, align 8
  %1396 = fmul double 0x3FD5555555555555, %1395
  %1397 = load double* %u2, align 8
  %1398 = fsub double 1.000000e+00, %1397
  %1399 = fmul double %1396, %1398
  %1400 = load i32* %i, align 4
  %1401 = add nsw i32 0, %1400
  %1402 = sext i32 %1401 to i64
  %1403 = load double** %1, align 8
  %1404 = getelementptr inbounds double* %1403, i64 %1402
  store double %1399, double* %1404, align 8
  %1405 = load double* %rho, align 8
  %1406 = fmul double 0x3FAC71C71C71C71C, %1405
  %1407 = load double* %uy, align 8
  %1408 = load double* %uy, align 8
  %1409 = fmul double 4.500000e+00, %1408
  %1410 = fadd double %1409, 3.000000e+00
  %1411 = fmul double %1407, %1410
  %1412 = fadd double 1.000000e+00, %1411
  %1413 = load double* %u2, align 8
  %1414 = fsub double %1412, %1413
  %1415 = fmul double %1406, %1414
  %1416 = load i32* %i, align 4
  %1417 = add nsw i32 1, %1416
  %1418 = sext i32 %1417 to i64
  %1419 = load double** %1, align 8
  %1420 = getelementptr inbounds double* %1419, i64 %1418
  store double %1415, double* %1420, align 8
  %1421 = load double* %rho, align 8
  %1422 = fmul double 0x3FAC71C71C71C71C, %1421
  %1423 = load double* %uy, align 8
  %1424 = load double* %uy, align 8
  %1425 = fmul double 4.500000e+00, %1424
  %1426 = fsub double %1425, 3.000000e+00
  %1427 = fmul double %1423, %1426
  %1428 = fadd double 1.000000e+00, %1427
  %1429 = load double* %u2, align 8
  %1430 = fsub double %1428, %1429
  %1431 = fmul double %1422, %1430
  %1432 = load i32* %i, align 4
  %1433 = add nsw i32 2, %1432
  %1434 = sext i32 %1433 to i64
  %1435 = load double** %1, align 8
  %1436 = getelementptr inbounds double* %1435, i64 %1434
  store double %1431, double* %1436, align 8
  %1437 = load double* %rho, align 8
  %1438 = fmul double 0x3FAC71C71C71C71C, %1437
  %1439 = load double* %ux, align 8
  %1440 = load double* %ux, align 8
  %1441 = fmul double 4.500000e+00, %1440
  %1442 = fadd double %1441, 3.000000e+00
  %1443 = fmul double %1439, %1442
  %1444 = fadd double 1.000000e+00, %1443
  %1445 = load double* %u2, align 8
  %1446 = fsub double %1444, %1445
  %1447 = fmul double %1438, %1446
  %1448 = load i32* %i, align 4
  %1449 = add nsw i32 3, %1448
  %1450 = sext i32 %1449 to i64
  %1451 = load double** %1, align 8
  %1452 = getelementptr inbounds double* %1451, i64 %1450
  store double %1447, double* %1452, align 8
  %1453 = load double* %rho, align 8
  %1454 = fmul double 0x3FAC71C71C71C71C, %1453
  %1455 = load double* %ux, align 8
  %1456 = load double* %ux, align 8
  %1457 = fmul double 4.500000e+00, %1456
  %1458 = fsub double %1457, 3.000000e+00
  %1459 = fmul double %1455, %1458
  %1460 = fadd double 1.000000e+00, %1459
  %1461 = load double* %u2, align 8
  %1462 = fsub double %1460, %1461
  %1463 = fmul double %1454, %1462
  %1464 = load i32* %i, align 4
  %1465 = add nsw i32 4, %1464
  %1466 = sext i32 %1465 to i64
  %1467 = load double** %1, align 8
  %1468 = getelementptr inbounds double* %1467, i64 %1466
  store double %1463, double* %1468, align 8
  %1469 = load double* %rho, align 8
  %1470 = fmul double 0x3FAC71C71C71C71C, %1469
  %1471 = load double* %uz, align 8
  %1472 = load double* %uz, align 8
  %1473 = fmul double 4.500000e+00, %1472
  %1474 = fadd double %1473, 3.000000e+00
  %1475 = fmul double %1471, %1474
  %1476 = fadd double 1.000000e+00, %1475
  %1477 = load double* %u2, align 8
  %1478 = fsub double %1476, %1477
  %1479 = fmul double %1470, %1478
  %1480 = load i32* %i, align 4
  %1481 = add nsw i32 5, %1480
  %1482 = sext i32 %1481 to i64
  %1483 = load double** %1, align 8
  %1484 = getelementptr inbounds double* %1483, i64 %1482
  store double %1479, double* %1484, align 8
  %1485 = load double* %rho, align 8
  %1486 = fmul double 0x3FAC71C71C71C71C, %1485
  %1487 = load double* %uz, align 8
  %1488 = load double* %uz, align 8
  %1489 = fmul double 4.500000e+00, %1488
  %1490 = fsub double %1489, 3.000000e+00
  %1491 = fmul double %1487, %1490
  %1492 = fadd double 1.000000e+00, %1491
  %1493 = load double* %u2, align 8
  %1494 = fsub double %1492, %1493
  %1495 = fmul double %1486, %1494
  %1496 = load i32* %i, align 4
  %1497 = add nsw i32 6, %1496
  %1498 = sext i32 %1497 to i64
  %1499 = load double** %1, align 8
  %1500 = getelementptr inbounds double* %1499, i64 %1498
  store double %1495, double* %1500, align 8
  %1501 = load double* %rho, align 8
  %1502 = fmul double 0x3F9C71C71C71C71C, %1501
  %1503 = load double* %ux, align 8
  %1504 = load double* %uy, align 8
  %1505 = fadd double %1503, %1504
  %1506 = load double* %ux, align 8
  %1507 = load double* %uy, align 8
  %1508 = fadd double %1506, %1507
  %1509 = fmul double 4.500000e+00, %1508
  %1510 = fadd double %1509, 3.000000e+00
  %1511 = fmul double %1505, %1510
  %1512 = fadd double 1.000000e+00, %1511
  %1513 = load double* %u2, align 8
  %1514 = fsub double %1512, %1513
  %1515 = fmul double %1502, %1514
  %1516 = load i32* %i, align 4
  %1517 = add nsw i32 7, %1516
  %1518 = sext i32 %1517 to i64
  %1519 = load double** %1, align 8
  %1520 = getelementptr inbounds double* %1519, i64 %1518
  store double %1515, double* %1520, align 8
  %1521 = load double* %rho, align 8
  %1522 = fmul double 0x3F9C71C71C71C71C, %1521
  %1523 = load double* %ux, align 8
  %1524 = fsub double -0.000000e+00, %1523
  %1525 = load double* %uy, align 8
  %1526 = fadd double %1524, %1525
  %1527 = load double* %ux, align 8
  %1528 = fsub double -0.000000e+00, %1527
  %1529 = load double* %uy, align 8
  %1530 = fadd double %1528, %1529
  %1531 = fmul double 4.500000e+00, %1530
  %1532 = fadd double %1531, 3.000000e+00
  %1533 = fmul double %1526, %1532
  %1534 = fadd double 1.000000e+00, %1533
  %1535 = load double* %u2, align 8
  %1536 = fsub double %1534, %1535
  %1537 = fmul double %1522, %1536
  %1538 = load i32* %i, align 4
  %1539 = add nsw i32 8, %1538
  %1540 = sext i32 %1539 to i64
  %1541 = load double** %1, align 8
  %1542 = getelementptr inbounds double* %1541, i64 %1540
  store double %1537, double* %1542, align 8
  %1543 = load double* %rho, align 8
  %1544 = fmul double 0x3F9C71C71C71C71C, %1543
  %1545 = load double* %ux, align 8
  %1546 = load double* %uy, align 8
  %1547 = fsub double %1545, %1546
  %1548 = load double* %ux, align 8
  %1549 = load double* %uy, align 8
  %1550 = fsub double %1548, %1549
  %1551 = fmul double 4.500000e+00, %1550
  %1552 = fadd double %1551, 3.000000e+00
  %1553 = fmul double %1547, %1552
  %1554 = fadd double 1.000000e+00, %1553
  %1555 = load double* %u2, align 8
  %1556 = fsub double %1554, %1555
  %1557 = fmul double %1544, %1556
  %1558 = load i32* %i, align 4
  %1559 = add nsw i32 9, %1558
  %1560 = sext i32 %1559 to i64
  %1561 = load double** %1, align 8
  %1562 = getelementptr inbounds double* %1561, i64 %1560
  store double %1557, double* %1562, align 8
  %1563 = load double* %rho, align 8
  %1564 = fmul double 0x3F9C71C71C71C71C, %1563
  %1565 = load double* %ux, align 8
  %1566 = fsub double -0.000000e+00, %1565
  %1567 = load double* %uy, align 8
  %1568 = fsub double %1566, %1567
  %1569 = load double* %ux, align 8
  %1570 = fsub double -0.000000e+00, %1569
  %1571 = load double* %uy, align 8
  %1572 = fsub double %1570, %1571
  %1573 = fmul double 4.500000e+00, %1572
  %1574 = fadd double %1573, 3.000000e+00
  %1575 = fmul double %1568, %1574
  %1576 = fadd double 1.000000e+00, %1575
  %1577 = load double* %u2, align 8
  %1578 = fsub double %1576, %1577
  %1579 = fmul double %1564, %1578
  %1580 = load i32* %i, align 4
  %1581 = add nsw i32 10, %1580
  %1582 = sext i32 %1581 to i64
  %1583 = load double** %1, align 8
  %1584 = getelementptr inbounds double* %1583, i64 %1582
  store double %1579, double* %1584, align 8
  %1585 = load double* %rho, align 8
  %1586 = fmul double 0x3F9C71C71C71C71C, %1585
  %1587 = load double* %uy, align 8
  %1588 = load double* %uz, align 8
  %1589 = fadd double %1587, %1588
  %1590 = load double* %uy, align 8
  %1591 = load double* %uz, align 8
  %1592 = fadd double %1590, %1591
  %1593 = fmul double 4.500000e+00, %1592
  %1594 = fadd double %1593, 3.000000e+00
  %1595 = fmul double %1589, %1594
  %1596 = fadd double 1.000000e+00, %1595
  %1597 = load double* %u2, align 8
  %1598 = fsub double %1596, %1597
  %1599 = fmul double %1586, %1598
  %1600 = load i32* %i, align 4
  %1601 = add nsw i32 11, %1600
  %1602 = sext i32 %1601 to i64
  %1603 = load double** %1, align 8
  %1604 = getelementptr inbounds double* %1603, i64 %1602
  store double %1599, double* %1604, align 8
  %1605 = load double* %rho, align 8
  %1606 = fmul double 0x3F9C71C71C71C71C, %1605
  %1607 = load double* %uy, align 8
  %1608 = load double* %uz, align 8
  %1609 = fsub double %1607, %1608
  %1610 = load double* %uy, align 8
  %1611 = load double* %uz, align 8
  %1612 = fsub double %1610, %1611
  %1613 = fmul double 4.500000e+00, %1612
  %1614 = fadd double %1613, 3.000000e+00
  %1615 = fmul double %1609, %1614
  %1616 = fadd double 1.000000e+00, %1615
  %1617 = load double* %u2, align 8
  %1618 = fsub double %1616, %1617
  %1619 = fmul double %1606, %1618
  %1620 = load i32* %i, align 4
  %1621 = add nsw i32 12, %1620
  %1622 = sext i32 %1621 to i64
  %1623 = load double** %1, align 8
  %1624 = getelementptr inbounds double* %1623, i64 %1622
  store double %1619, double* %1624, align 8
  %1625 = load double* %rho, align 8
  %1626 = fmul double 0x3F9C71C71C71C71C, %1625
  %1627 = load double* %uy, align 8
  %1628 = fsub double -0.000000e+00, %1627
  %1629 = load double* %uz, align 8
  %1630 = fadd double %1628, %1629
  %1631 = load double* %uy, align 8
  %1632 = fsub double -0.000000e+00, %1631
  %1633 = load double* %uz, align 8
  %1634 = fadd double %1632, %1633
  %1635 = fmul double 4.500000e+00, %1634
  %1636 = fadd double %1635, 3.000000e+00
  %1637 = fmul double %1630, %1636
  %1638 = fadd double 1.000000e+00, %1637
  %1639 = load double* %u2, align 8
  %1640 = fsub double %1638, %1639
  %1641 = fmul double %1626, %1640
  %1642 = load i32* %i, align 4
  %1643 = add nsw i32 13, %1642
  %1644 = sext i32 %1643 to i64
  %1645 = load double** %1, align 8
  %1646 = getelementptr inbounds double* %1645, i64 %1644
  store double %1641, double* %1646, align 8
  %1647 = load double* %rho, align 8
  %1648 = fmul double 0x3F9C71C71C71C71C, %1647
  %1649 = load double* %uy, align 8
  %1650 = fsub double -0.000000e+00, %1649
  %1651 = load double* %uz, align 8
  %1652 = fsub double %1650, %1651
  %1653 = load double* %uy, align 8
  %1654 = fsub double -0.000000e+00, %1653
  %1655 = load double* %uz, align 8
  %1656 = fsub double %1654, %1655
  %1657 = fmul double 4.500000e+00, %1656
  %1658 = fadd double %1657, 3.000000e+00
  %1659 = fmul double %1652, %1658
  %1660 = fadd double 1.000000e+00, %1659
  %1661 = load double* %u2, align 8
  %1662 = fsub double %1660, %1661
  %1663 = fmul double %1648, %1662
  %1664 = load i32* %i, align 4
  %1665 = add nsw i32 14, %1664
  %1666 = sext i32 %1665 to i64
  %1667 = load double** %1, align 8
  %1668 = getelementptr inbounds double* %1667, i64 %1666
  store double %1663, double* %1668, align 8
  %1669 = load double* %rho, align 8
  %1670 = fmul double 0x3F9C71C71C71C71C, %1669
  %1671 = load double* %ux, align 8
  %1672 = load double* %uz, align 8
  %1673 = fadd double %1671, %1672
  %1674 = load double* %ux, align 8
  %1675 = load double* %uz, align 8
  %1676 = fadd double %1674, %1675
  %1677 = fmul double 4.500000e+00, %1676
  %1678 = fadd double %1677, 3.000000e+00
  %1679 = fmul double %1673, %1678
  %1680 = fadd double 1.000000e+00, %1679
  %1681 = load double* %u2, align 8
  %1682 = fsub double %1680, %1681
  %1683 = fmul double %1670, %1682
  %1684 = load i32* %i, align 4
  %1685 = add nsw i32 15, %1684
  %1686 = sext i32 %1685 to i64
  %1687 = load double** %1, align 8
  %1688 = getelementptr inbounds double* %1687, i64 %1686
  store double %1683, double* %1688, align 8
  %1689 = load double* %rho, align 8
  %1690 = fmul double 0x3F9C71C71C71C71C, %1689
  %1691 = load double* %ux, align 8
  %1692 = load double* %uz, align 8
  %1693 = fsub double %1691, %1692
  %1694 = load double* %ux, align 8
  %1695 = load double* %uz, align 8
  %1696 = fsub double %1694, %1695
  %1697 = fmul double 4.500000e+00, %1696
  %1698 = fadd double %1697, 3.000000e+00
  %1699 = fmul double %1693, %1698
  %1700 = fadd double 1.000000e+00, %1699
  %1701 = load double* %u2, align 8
  %1702 = fsub double %1700, %1701
  %1703 = fmul double %1690, %1702
  %1704 = load i32* %i, align 4
  %1705 = add nsw i32 16, %1704
  %1706 = sext i32 %1705 to i64
  %1707 = load double** %1, align 8
  %1708 = getelementptr inbounds double* %1707, i64 %1706
  store double %1703, double* %1708, align 8
  %1709 = load double* %rho, align 8
  %1710 = fmul double 0x3F9C71C71C71C71C, %1709
  %1711 = load double* %ux, align 8
  %1712 = fsub double -0.000000e+00, %1711
  %1713 = load double* %uz, align 8
  %1714 = fadd double %1712, %1713
  %1715 = load double* %ux, align 8
  %1716 = fsub double -0.000000e+00, %1715
  %1717 = load double* %uz, align 8
  %1718 = fadd double %1716, %1717
  %1719 = fmul double 4.500000e+00, %1718
  %1720 = fadd double %1719, 3.000000e+00
  %1721 = fmul double %1714, %1720
  %1722 = fadd double 1.000000e+00, %1721
  %1723 = load double* %u2, align 8
  %1724 = fsub double %1722, %1723
  %1725 = fmul double %1710, %1724
  %1726 = load i32* %i, align 4
  %1727 = add nsw i32 17, %1726
  %1728 = sext i32 %1727 to i64
  %1729 = load double** %1, align 8
  %1730 = getelementptr inbounds double* %1729, i64 %1728
  store double %1725, double* %1730, align 8
  %1731 = load double* %rho, align 8
  %1732 = fmul double 0x3F9C71C71C71C71C, %1731
  %1733 = load double* %ux, align 8
  %1734 = fsub double -0.000000e+00, %1733
  %1735 = load double* %uz, align 8
  %1736 = fsub double %1734, %1735
  %1737 = load double* %ux, align 8
  %1738 = fsub double -0.000000e+00, %1737
  %1739 = load double* %uz, align 8
  %1740 = fsub double %1738, %1739
  %1741 = fmul double 4.500000e+00, %1740
  %1742 = fadd double %1741, 3.000000e+00
  %1743 = fmul double %1736, %1742
  %1744 = fadd double 1.000000e+00, %1743
  %1745 = load double* %u2, align 8
  %1746 = fsub double %1744, %1745
  %1747 = fmul double %1732, %1746
  %1748 = load i32* %i, align 4
  %1749 = add nsw i32 18, %1748
  %1750 = sext i32 %1749 to i64
  %1751 = load double** %1, align 8
  %1752 = getelementptr inbounds double* %1751, i64 %1750
  store double %1747, double* %1752, align 8
  br label %1753

; <label>:1753                                    ; preds = %674
  %1754 = load i32* %i, align 4
  %1755 = add nsw i32 %1754, 20
  store i32 %1755, i32* %i, align 4
  br label %671

; <label>:1756                                    ; preds = %671
  ret void
}

; Function Attrs: nounwind uwtable
define void @LBM_showGridStatistics(double* %grid) #0 {
  %1 = alloca double*, align 8
  %nObstacleCells = alloca i32, align 4
  %nAccelCells = alloca i32, align 4
  %nFluidCells = alloca i32, align 4
  %ux = alloca double, align 8
  %uy = alloca double, align 8
  %uz = alloca double, align 8
  %minU2 = alloca double, align 8
  %maxU2 = alloca double, align 8
  %u2 = alloca double, align 8
  %minRho = alloca double, align 8
  %maxRho = alloca double, align 8
  %rho = alloca double, align 8
  %mass = alloca double, align 8
  %i = alloca i32, align 4
  store double* %grid, double** %1, align 8
  store i32 0, i32* %nObstacleCells, align 4
  store i32 0, i32* %nAccelCells, align 4
  store i32 0, i32* %nFluidCells, align 4
  store double 1.000000e+30, double* %minU2, align 8
  store double -1.000000e+30, double* %maxU2, align 8
  store double 1.000000e+30, double* %minRho, align 8
  store double -1.000000e+30, double* %maxRho, align 8
  store double 0.000000e+00, double* %mass, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %419, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 26000000
  br i1 %4, label %5, label %422

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = add nsw i32 0, %6
  %8 = sext i32 %7 to i64
  %9 = load double** %1, align 8
  %10 = getelementptr inbounds double* %9, i64 %8
  %11 = load double* %10, align 8
  %12 = load i32* %i, align 4
  %13 = add nsw i32 1, %12
  %14 = sext i32 %13 to i64
  %15 = load double** %1, align 8
  %16 = getelementptr inbounds double* %15, i64 %14
  %17 = load double* %16, align 8
  %18 = fadd double %11, %17
  %19 = load i32* %i, align 4
  %20 = add nsw i32 2, %19
  %21 = sext i32 %20 to i64
  %22 = load double** %1, align 8
  %23 = getelementptr inbounds double* %22, i64 %21
  %24 = load double* %23, align 8
  %25 = fadd double %18, %24
  %26 = load i32* %i, align 4
  %27 = add nsw i32 3, %26
  %28 = sext i32 %27 to i64
  %29 = load double** %1, align 8
  %30 = getelementptr inbounds double* %29, i64 %28
  %31 = load double* %30, align 8
  %32 = fadd double %25, %31
  %33 = load i32* %i, align 4
  %34 = add nsw i32 4, %33
  %35 = sext i32 %34 to i64
  %36 = load double** %1, align 8
  %37 = getelementptr inbounds double* %36, i64 %35
  %38 = load double* %37, align 8
  %39 = fadd double %32, %38
  %40 = load i32* %i, align 4
  %41 = add nsw i32 5, %40
  %42 = sext i32 %41 to i64
  %43 = load double** %1, align 8
  %44 = getelementptr inbounds double* %43, i64 %42
  %45 = load double* %44, align 8
  %46 = fadd double %39, %45
  %47 = load i32* %i, align 4
  %48 = add nsw i32 6, %47
  %49 = sext i32 %48 to i64
  %50 = load double** %1, align 8
  %51 = getelementptr inbounds double* %50, i64 %49
  %52 = load double* %51, align 8
  %53 = fadd double %46, %52
  %54 = load i32* %i, align 4
  %55 = add nsw i32 7, %54
  %56 = sext i32 %55 to i64
  %57 = load double** %1, align 8
  %58 = getelementptr inbounds double* %57, i64 %56
  %59 = load double* %58, align 8
  %60 = fadd double %53, %59
  %61 = load i32* %i, align 4
  %62 = add nsw i32 8, %61
  %63 = sext i32 %62 to i64
  %64 = load double** %1, align 8
  %65 = getelementptr inbounds double* %64, i64 %63
  %66 = load double* %65, align 8
  %67 = fadd double %60, %66
  %68 = load i32* %i, align 4
  %69 = add nsw i32 9, %68
  %70 = sext i32 %69 to i64
  %71 = load double** %1, align 8
  %72 = getelementptr inbounds double* %71, i64 %70
  %73 = load double* %72, align 8
  %74 = fadd double %67, %73
  %75 = load i32* %i, align 4
  %76 = add nsw i32 10, %75
  %77 = sext i32 %76 to i64
  %78 = load double** %1, align 8
  %79 = getelementptr inbounds double* %78, i64 %77
  %80 = load double* %79, align 8
  %81 = fadd double %74, %80
  %82 = load i32* %i, align 4
  %83 = add nsw i32 11, %82
  %84 = sext i32 %83 to i64
  %85 = load double** %1, align 8
  %86 = getelementptr inbounds double* %85, i64 %84
  %87 = load double* %86, align 8
  %88 = fadd double %81, %87
  %89 = load i32* %i, align 4
  %90 = add nsw i32 12, %89
  %91 = sext i32 %90 to i64
  %92 = load double** %1, align 8
  %93 = getelementptr inbounds double* %92, i64 %91
  %94 = load double* %93, align 8
  %95 = fadd double %88, %94
  %96 = load i32* %i, align 4
  %97 = add nsw i32 13, %96
  %98 = sext i32 %97 to i64
  %99 = load double** %1, align 8
  %100 = getelementptr inbounds double* %99, i64 %98
  %101 = load double* %100, align 8
  %102 = fadd double %95, %101
  %103 = load i32* %i, align 4
  %104 = add nsw i32 14, %103
  %105 = sext i32 %104 to i64
  %106 = load double** %1, align 8
  %107 = getelementptr inbounds double* %106, i64 %105
  %108 = load double* %107, align 8
  %109 = fadd double %102, %108
  %110 = load i32* %i, align 4
  %111 = add nsw i32 15, %110
  %112 = sext i32 %111 to i64
  %113 = load double** %1, align 8
  %114 = getelementptr inbounds double* %113, i64 %112
  %115 = load double* %114, align 8
  %116 = fadd double %109, %115
  %117 = load i32* %i, align 4
  %118 = add nsw i32 16, %117
  %119 = sext i32 %118 to i64
  %120 = load double** %1, align 8
  %121 = getelementptr inbounds double* %120, i64 %119
  %122 = load double* %121, align 8
  %123 = fadd double %116, %122
  %124 = load i32* %i, align 4
  %125 = add nsw i32 17, %124
  %126 = sext i32 %125 to i64
  %127 = load double** %1, align 8
  %128 = getelementptr inbounds double* %127, i64 %126
  %129 = load double* %128, align 8
  %130 = fadd double %123, %129
  %131 = load i32* %i, align 4
  %132 = add nsw i32 18, %131
  %133 = sext i32 %132 to i64
  %134 = load double** %1, align 8
  %135 = getelementptr inbounds double* %134, i64 %133
  %136 = load double* %135, align 8
  %137 = fadd double %130, %136
  store double %137, double* %rho, align 8
  %138 = load double* %rho, align 8
  %139 = load double* %minRho, align 8
  %140 = fcmp olt double %138, %139
  br i1 %140, label %141, label %143

; <label>:141                                     ; preds = %5
  %142 = load double* %rho, align 8
  store double %142, double* %minRho, align 8
  br label %143

; <label>:143                                     ; preds = %141, %5
  %144 = load double* %rho, align 8
  %145 = load double* %maxRho, align 8
  %146 = fcmp ogt double %144, %145
  br i1 %146, label %147, label %149

; <label>:147                                     ; preds = %143
  %148 = load double* %rho, align 8
  store double %148, double* %maxRho, align 8
  br label %149

; <label>:149                                     ; preds = %147, %143
  %150 = load double* %rho, align 8
  %151 = load double* %mass, align 8
  %152 = fadd double %151, %150
  store double %152, double* %mass, align 8
  %153 = load i32* %i, align 4
  %154 = add nsw i32 19, %153
  %155 = sext i32 %154 to i64
  %156 = load double** %1, align 8
  %157 = getelementptr inbounds double* %156, i64 %155
  %158 = bitcast double* %157 to i8*
  %159 = bitcast i8* %158 to i32*
  %160 = load i32* %159, align 4
  %161 = and i32 %160, 1
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %163, label %166

; <label>:163                                     ; preds = %149
  %164 = load i32* %nObstacleCells, align 4
  %165 = add nsw i32 %164, 1
  store i32 %165, i32* %nObstacleCells, align 4
  br label %418

; <label>:166                                     ; preds = %149
  %167 = load i32* %i, align 4
  %168 = add nsw i32 19, %167
  %169 = sext i32 %168 to i64
  %170 = load double** %1, align 8
  %171 = getelementptr inbounds double* %170, i64 %169
  %172 = bitcast double* %171 to i8*
  %173 = bitcast i8* %172 to i32*
  %174 = load i32* %173, align 4
  %175 = and i32 %174, 2
  %176 = icmp ne i32 %175, 0
  br i1 %176, label %177, label %180

; <label>:177                                     ; preds = %166
  %178 = load i32* %nAccelCells, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, i32* %nAccelCells, align 4
  br label %183

; <label>:180                                     ; preds = %166
  %181 = load i32* %nFluidCells, align 4
  %182 = add nsw i32 %181, 1
  store i32 %182, i32* %nFluidCells, align 4
  br label %183

; <label>:183                                     ; preds = %180, %177
  %184 = load i32* %i, align 4
  %185 = add nsw i32 3, %184
  %186 = sext i32 %185 to i64
  %187 = load double** %1, align 8
  %188 = getelementptr inbounds double* %187, i64 %186
  %189 = load double* %188, align 8
  %190 = load i32* %i, align 4
  %191 = add nsw i32 4, %190
  %192 = sext i32 %191 to i64
  %193 = load double** %1, align 8
  %194 = getelementptr inbounds double* %193, i64 %192
  %195 = load double* %194, align 8
  %196 = fsub double %189, %195
  %197 = load i32* %i, align 4
  %198 = add nsw i32 7, %197
  %199 = sext i32 %198 to i64
  %200 = load double** %1, align 8
  %201 = getelementptr inbounds double* %200, i64 %199
  %202 = load double* %201, align 8
  %203 = fadd double %196, %202
  %204 = load i32* %i, align 4
  %205 = add nsw i32 8, %204
  %206 = sext i32 %205 to i64
  %207 = load double** %1, align 8
  %208 = getelementptr inbounds double* %207, i64 %206
  %209 = load double* %208, align 8
  %210 = fsub double %203, %209
  %211 = load i32* %i, align 4
  %212 = add nsw i32 9, %211
  %213 = sext i32 %212 to i64
  %214 = load double** %1, align 8
  %215 = getelementptr inbounds double* %214, i64 %213
  %216 = load double* %215, align 8
  %217 = fadd double %210, %216
  %218 = load i32* %i, align 4
  %219 = add nsw i32 10, %218
  %220 = sext i32 %219 to i64
  %221 = load double** %1, align 8
  %222 = getelementptr inbounds double* %221, i64 %220
  %223 = load double* %222, align 8
  %224 = fsub double %217, %223
  %225 = load i32* %i, align 4
  %226 = add nsw i32 15, %225
  %227 = sext i32 %226 to i64
  %228 = load double** %1, align 8
  %229 = getelementptr inbounds double* %228, i64 %227
  %230 = load double* %229, align 8
  %231 = fadd double %224, %230
  %232 = load i32* %i, align 4
  %233 = add nsw i32 16, %232
  %234 = sext i32 %233 to i64
  %235 = load double** %1, align 8
  %236 = getelementptr inbounds double* %235, i64 %234
  %237 = load double* %236, align 8
  %238 = fadd double %231, %237
  %239 = load i32* %i, align 4
  %240 = add nsw i32 17, %239
  %241 = sext i32 %240 to i64
  %242 = load double** %1, align 8
  %243 = getelementptr inbounds double* %242, i64 %241
  %244 = load double* %243, align 8
  %245 = fsub double %238, %244
  %246 = load i32* %i, align 4
  %247 = add nsw i32 18, %246
  %248 = sext i32 %247 to i64
  %249 = load double** %1, align 8
  %250 = getelementptr inbounds double* %249, i64 %248
  %251 = load double* %250, align 8
  %252 = fsub double %245, %251
  store double %252, double* %ux, align 8
  %253 = load i32* %i, align 4
  %254 = add nsw i32 1, %253
  %255 = sext i32 %254 to i64
  %256 = load double** %1, align 8
  %257 = getelementptr inbounds double* %256, i64 %255
  %258 = load double* %257, align 8
  %259 = load i32* %i, align 4
  %260 = add nsw i32 2, %259
  %261 = sext i32 %260 to i64
  %262 = load double** %1, align 8
  %263 = getelementptr inbounds double* %262, i64 %261
  %264 = load double* %263, align 8
  %265 = fsub double %258, %264
  %266 = load i32* %i, align 4
  %267 = add nsw i32 7, %266
  %268 = sext i32 %267 to i64
  %269 = load double** %1, align 8
  %270 = getelementptr inbounds double* %269, i64 %268
  %271 = load double* %270, align 8
  %272 = fadd double %265, %271
  %273 = load i32* %i, align 4
  %274 = add nsw i32 8, %273
  %275 = sext i32 %274 to i64
  %276 = load double** %1, align 8
  %277 = getelementptr inbounds double* %276, i64 %275
  %278 = load double* %277, align 8
  %279 = fadd double %272, %278
  %280 = load i32* %i, align 4
  %281 = add nsw i32 9, %280
  %282 = sext i32 %281 to i64
  %283 = load double** %1, align 8
  %284 = getelementptr inbounds double* %283, i64 %282
  %285 = load double* %284, align 8
  %286 = fsub double %279, %285
  %287 = load i32* %i, align 4
  %288 = add nsw i32 10, %287
  %289 = sext i32 %288 to i64
  %290 = load double** %1, align 8
  %291 = getelementptr inbounds double* %290, i64 %289
  %292 = load double* %291, align 8
  %293 = fsub double %286, %292
  %294 = load i32* %i, align 4
  %295 = add nsw i32 11, %294
  %296 = sext i32 %295 to i64
  %297 = load double** %1, align 8
  %298 = getelementptr inbounds double* %297, i64 %296
  %299 = load double* %298, align 8
  %300 = fadd double %293, %299
  %301 = load i32* %i, align 4
  %302 = add nsw i32 12, %301
  %303 = sext i32 %302 to i64
  %304 = load double** %1, align 8
  %305 = getelementptr inbounds double* %304, i64 %303
  %306 = load double* %305, align 8
  %307 = fadd double %300, %306
  %308 = load i32* %i, align 4
  %309 = add nsw i32 13, %308
  %310 = sext i32 %309 to i64
  %311 = load double** %1, align 8
  %312 = getelementptr inbounds double* %311, i64 %310
  %313 = load double* %312, align 8
  %314 = fsub double %307, %313
  %315 = load i32* %i, align 4
  %316 = add nsw i32 14, %315
  %317 = sext i32 %316 to i64
  %318 = load double** %1, align 8
  %319 = getelementptr inbounds double* %318, i64 %317
  %320 = load double* %319, align 8
  %321 = fsub double %314, %320
  store double %321, double* %uy, align 8
  %322 = load i32* %i, align 4
  %323 = add nsw i32 5, %322
  %324 = sext i32 %323 to i64
  %325 = load double** %1, align 8
  %326 = getelementptr inbounds double* %325, i64 %324
  %327 = load double* %326, align 8
  %328 = load i32* %i, align 4
  %329 = add nsw i32 6, %328
  %330 = sext i32 %329 to i64
  %331 = load double** %1, align 8
  %332 = getelementptr inbounds double* %331, i64 %330
  %333 = load double* %332, align 8
  %334 = fsub double %327, %333
  %335 = load i32* %i, align 4
  %336 = add nsw i32 11, %335
  %337 = sext i32 %336 to i64
  %338 = load double** %1, align 8
  %339 = getelementptr inbounds double* %338, i64 %337
  %340 = load double* %339, align 8
  %341 = fadd double %334, %340
  %342 = load i32* %i, align 4
  %343 = add nsw i32 12, %342
  %344 = sext i32 %343 to i64
  %345 = load double** %1, align 8
  %346 = getelementptr inbounds double* %345, i64 %344
  %347 = load double* %346, align 8
  %348 = fsub double %341, %347
  %349 = load i32* %i, align 4
  %350 = add nsw i32 13, %349
  %351 = sext i32 %350 to i64
  %352 = load double** %1, align 8
  %353 = getelementptr inbounds double* %352, i64 %351
  %354 = load double* %353, align 8
  %355 = fadd double %348, %354
  %356 = load i32* %i, align 4
  %357 = add nsw i32 14, %356
  %358 = sext i32 %357 to i64
  %359 = load double** %1, align 8
  %360 = getelementptr inbounds double* %359, i64 %358
  %361 = load double* %360, align 8
  %362 = fsub double %355, %361
  %363 = load i32* %i, align 4
  %364 = add nsw i32 15, %363
  %365 = sext i32 %364 to i64
  %366 = load double** %1, align 8
  %367 = getelementptr inbounds double* %366, i64 %365
  %368 = load double* %367, align 8
  %369 = fadd double %362, %368
  %370 = load i32* %i, align 4
  %371 = add nsw i32 16, %370
  %372 = sext i32 %371 to i64
  %373 = load double** %1, align 8
  %374 = getelementptr inbounds double* %373, i64 %372
  %375 = load double* %374, align 8
  %376 = fsub double %369, %375
  %377 = load i32* %i, align 4
  %378 = add nsw i32 17, %377
  %379 = sext i32 %378 to i64
  %380 = load double** %1, align 8
  %381 = getelementptr inbounds double* %380, i64 %379
  %382 = load double* %381, align 8
  %383 = fadd double %376, %382
  %384 = load i32* %i, align 4
  %385 = add nsw i32 18, %384
  %386 = sext i32 %385 to i64
  %387 = load double** %1, align 8
  %388 = getelementptr inbounds double* %387, i64 %386
  %389 = load double* %388, align 8
  %390 = fsub double %383, %389
  store double %390, double* %uz, align 8
  %391 = load double* %ux, align 8
  %392 = load double* %ux, align 8
  %393 = fmul double %391, %392
  %394 = load double* %uy, align 8
  %395 = load double* %uy, align 8
  %396 = fmul double %394, %395
  %397 = fadd double %393, %396
  %398 = load double* %uz, align 8
  %399 = load double* %uz, align 8
  %400 = fmul double %398, %399
  %401 = fadd double %397, %400
  %402 = load double* %rho, align 8
  %403 = load double* %rho, align 8
  %404 = fmul double %402, %403
  %405 = fdiv double %401, %404
  store double %405, double* %u2, align 8
  %406 = load double* %u2, align 8
  %407 = load double* %minU2, align 8
  %408 = fcmp olt double %406, %407
  br i1 %408, label %409, label %411

; <label>:409                                     ; preds = %183
  %410 = load double* %u2, align 8
  store double %410, double* %minU2, align 8
  br label %411

; <label>:411                                     ; preds = %409, %183
  %412 = load double* %u2, align 8
  %413 = load double* %maxU2, align 8
  %414 = fcmp ogt double %412, %413
  br i1 %414, label %415, label %417

; <label>:415                                     ; preds = %411
  %416 = load double* %u2, align 8
  store double %416, double* %maxU2, align 8
  br label %417

; <label>:417                                     ; preds = %415, %411
  br label %418

; <label>:418                                     ; preds = %417, %163
  br label %419

; <label>:419                                     ; preds = %418
  %420 = load i32* %i, align 4
  %421 = add nsw i32 %420, 20
  store i32 %421, i32* %i, align 4
  br label %2

; <label>:422                                     ; preds = %2
  %423 = load i32* %nObstacleCells, align 4
  %424 = load i32* %nAccelCells, align 4
  %425 = load i32* %nFluidCells, align 4
  %426 = load double* %minRho, align 8
  %427 = load double* %maxRho, align 8
  %428 = load double* %mass, align 8
  %429 = load double* %minU2, align 8
  %430 = call double @sqrt(double %429) #4
  %431 = load double* %maxU2, align 8
  %432 = call double @sqrt(double %431) #4
  %433 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([138 x i8]* @.str3, i32 0, i32 0), i32 %423, i32 %424, i32 %425, double %426, double %427, double %428, double %430, double %432)
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define void @LBM_storeVelocityField(double* %grid, i8* %filename, i32 %binary) #0 {
  %1 = alloca double*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %rho = alloca float, align 4
  %ux = alloca float, align 4
  %uy = alloca float, align 4
  %uz = alloca float, align 4
  %file = alloca %struct._IO_FILE*, align 8
  store double* %grid, double** %1, align 8
  store i8* %filename, i8** %2, align 8
  store i32 %binary, i32* %3, align 4
  %4 = load i8** %2, align 8
  %5 = load i32* %3, align 4
  %6 = icmp ne i32 %5, 0
  %7 = select i1 %6, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0)
  %8 = call %struct._IO_FILE* @fopen(i8* %4, i8* %7)
  store %struct._IO_FILE* %8, %struct._IO_FILE** %file, align 8
  store i32 0, i32* %z, align 4
  br label %9

; <label>:9                                       ; preds = %789, %0
  %10 = load i32* %z, align 4
  %11 = icmp slt i32 %10, 130
  br i1 %11, label %12, label %792

; <label>:12                                      ; preds = %9
  store i32 0, i32* %y, align 4
  br label %13

; <label>:13                                      ; preds = %785, %12
  %14 = load i32* %y, align 4
  %15 = icmp slt i32 %14, 100
  br i1 %15, label %16, label %788

; <label>:16                                      ; preds = %13
  store i32 0, i32* %x, align 4
  br label %17

; <label>:17                                      ; preds = %781, %16
  %18 = load i32* %x, align 4
  %19 = icmp slt i32 %18, 100
  br i1 %19, label %20, label %784

; <label>:20                                      ; preds = %17
  %21 = load i32* %x, align 4
  %22 = load i32* %y, align 4
  %23 = mul nsw i32 %22, 100
  %24 = add nsw i32 %21, %23
  %25 = load i32* %z, align 4
  %26 = mul nsw i32 %25, 100
  %27 = mul nsw i32 %26, 100
  %28 = add nsw i32 %24, %27
  %29 = mul nsw i32 20, %28
  %30 = add nsw i32 0, %29
  %31 = sext i32 %30 to i64
  %32 = load double** %1, align 8
  %33 = getelementptr inbounds double* %32, i64 %31
  %34 = load double* %33, align 8
  %35 = load i32* %x, align 4
  %36 = load i32* %y, align 4
  %37 = mul nsw i32 %36, 100
  %38 = add nsw i32 %35, %37
  %39 = load i32* %z, align 4
  %40 = mul nsw i32 %39, 100
  %41 = mul nsw i32 %40, 100
  %42 = add nsw i32 %38, %41
  %43 = mul nsw i32 20, %42
  %44 = add nsw i32 1, %43
  %45 = sext i32 %44 to i64
  %46 = load double** %1, align 8
  %47 = getelementptr inbounds double* %46, i64 %45
  %48 = load double* %47, align 8
  %49 = fadd double %34, %48
  %50 = load i32* %x, align 4
  %51 = load i32* %y, align 4
  %52 = mul nsw i32 %51, 100
  %53 = add nsw i32 %50, %52
  %54 = load i32* %z, align 4
  %55 = mul nsw i32 %54, 100
  %56 = mul nsw i32 %55, 100
  %57 = add nsw i32 %53, %56
  %58 = mul nsw i32 20, %57
  %59 = add nsw i32 2, %58
  %60 = sext i32 %59 to i64
  %61 = load double** %1, align 8
  %62 = getelementptr inbounds double* %61, i64 %60
  %63 = load double* %62, align 8
  %64 = fadd double %49, %63
  %65 = load i32* %x, align 4
  %66 = load i32* %y, align 4
  %67 = mul nsw i32 %66, 100
  %68 = add nsw i32 %65, %67
  %69 = load i32* %z, align 4
  %70 = mul nsw i32 %69, 100
  %71 = mul nsw i32 %70, 100
  %72 = add nsw i32 %68, %71
  %73 = mul nsw i32 20, %72
  %74 = add nsw i32 3, %73
  %75 = sext i32 %74 to i64
  %76 = load double** %1, align 8
  %77 = getelementptr inbounds double* %76, i64 %75
  %78 = load double* %77, align 8
  %79 = fadd double %64, %78
  %80 = load i32* %x, align 4
  %81 = load i32* %y, align 4
  %82 = mul nsw i32 %81, 100
  %83 = add nsw i32 %80, %82
  %84 = load i32* %z, align 4
  %85 = mul nsw i32 %84, 100
  %86 = mul nsw i32 %85, 100
  %87 = add nsw i32 %83, %86
  %88 = mul nsw i32 20, %87
  %89 = add nsw i32 4, %88
  %90 = sext i32 %89 to i64
  %91 = load double** %1, align 8
  %92 = getelementptr inbounds double* %91, i64 %90
  %93 = load double* %92, align 8
  %94 = fadd double %79, %93
  %95 = load i32* %x, align 4
  %96 = load i32* %y, align 4
  %97 = mul nsw i32 %96, 100
  %98 = add nsw i32 %95, %97
  %99 = load i32* %z, align 4
  %100 = mul nsw i32 %99, 100
  %101 = mul nsw i32 %100, 100
  %102 = add nsw i32 %98, %101
  %103 = mul nsw i32 20, %102
  %104 = add nsw i32 5, %103
  %105 = sext i32 %104 to i64
  %106 = load double** %1, align 8
  %107 = getelementptr inbounds double* %106, i64 %105
  %108 = load double* %107, align 8
  %109 = fadd double %94, %108
  %110 = load i32* %x, align 4
  %111 = load i32* %y, align 4
  %112 = mul nsw i32 %111, 100
  %113 = add nsw i32 %110, %112
  %114 = load i32* %z, align 4
  %115 = mul nsw i32 %114, 100
  %116 = mul nsw i32 %115, 100
  %117 = add nsw i32 %113, %116
  %118 = mul nsw i32 20, %117
  %119 = add nsw i32 6, %118
  %120 = sext i32 %119 to i64
  %121 = load double** %1, align 8
  %122 = getelementptr inbounds double* %121, i64 %120
  %123 = load double* %122, align 8
  %124 = fadd double %109, %123
  %125 = load i32* %x, align 4
  %126 = load i32* %y, align 4
  %127 = mul nsw i32 %126, 100
  %128 = add nsw i32 %125, %127
  %129 = load i32* %z, align 4
  %130 = mul nsw i32 %129, 100
  %131 = mul nsw i32 %130, 100
  %132 = add nsw i32 %128, %131
  %133 = mul nsw i32 20, %132
  %134 = add nsw i32 7, %133
  %135 = sext i32 %134 to i64
  %136 = load double** %1, align 8
  %137 = getelementptr inbounds double* %136, i64 %135
  %138 = load double* %137, align 8
  %139 = fadd double %124, %138
  %140 = load i32* %x, align 4
  %141 = load i32* %y, align 4
  %142 = mul nsw i32 %141, 100
  %143 = add nsw i32 %140, %142
  %144 = load i32* %z, align 4
  %145 = mul nsw i32 %144, 100
  %146 = mul nsw i32 %145, 100
  %147 = add nsw i32 %143, %146
  %148 = mul nsw i32 20, %147
  %149 = add nsw i32 8, %148
  %150 = sext i32 %149 to i64
  %151 = load double** %1, align 8
  %152 = getelementptr inbounds double* %151, i64 %150
  %153 = load double* %152, align 8
  %154 = fadd double %139, %153
  %155 = load i32* %x, align 4
  %156 = load i32* %y, align 4
  %157 = mul nsw i32 %156, 100
  %158 = add nsw i32 %155, %157
  %159 = load i32* %z, align 4
  %160 = mul nsw i32 %159, 100
  %161 = mul nsw i32 %160, 100
  %162 = add nsw i32 %158, %161
  %163 = mul nsw i32 20, %162
  %164 = add nsw i32 9, %163
  %165 = sext i32 %164 to i64
  %166 = load double** %1, align 8
  %167 = getelementptr inbounds double* %166, i64 %165
  %168 = load double* %167, align 8
  %169 = fadd double %154, %168
  %170 = load i32* %x, align 4
  %171 = load i32* %y, align 4
  %172 = mul nsw i32 %171, 100
  %173 = add nsw i32 %170, %172
  %174 = load i32* %z, align 4
  %175 = mul nsw i32 %174, 100
  %176 = mul nsw i32 %175, 100
  %177 = add nsw i32 %173, %176
  %178 = mul nsw i32 20, %177
  %179 = add nsw i32 10, %178
  %180 = sext i32 %179 to i64
  %181 = load double** %1, align 8
  %182 = getelementptr inbounds double* %181, i64 %180
  %183 = load double* %182, align 8
  %184 = fadd double %169, %183
  %185 = load i32* %x, align 4
  %186 = load i32* %y, align 4
  %187 = mul nsw i32 %186, 100
  %188 = add nsw i32 %185, %187
  %189 = load i32* %z, align 4
  %190 = mul nsw i32 %189, 100
  %191 = mul nsw i32 %190, 100
  %192 = add nsw i32 %188, %191
  %193 = mul nsw i32 20, %192
  %194 = add nsw i32 11, %193
  %195 = sext i32 %194 to i64
  %196 = load double** %1, align 8
  %197 = getelementptr inbounds double* %196, i64 %195
  %198 = load double* %197, align 8
  %199 = fadd double %184, %198
  %200 = load i32* %x, align 4
  %201 = load i32* %y, align 4
  %202 = mul nsw i32 %201, 100
  %203 = add nsw i32 %200, %202
  %204 = load i32* %z, align 4
  %205 = mul nsw i32 %204, 100
  %206 = mul nsw i32 %205, 100
  %207 = add nsw i32 %203, %206
  %208 = mul nsw i32 20, %207
  %209 = add nsw i32 12, %208
  %210 = sext i32 %209 to i64
  %211 = load double** %1, align 8
  %212 = getelementptr inbounds double* %211, i64 %210
  %213 = load double* %212, align 8
  %214 = fadd double %199, %213
  %215 = load i32* %x, align 4
  %216 = load i32* %y, align 4
  %217 = mul nsw i32 %216, 100
  %218 = add nsw i32 %215, %217
  %219 = load i32* %z, align 4
  %220 = mul nsw i32 %219, 100
  %221 = mul nsw i32 %220, 100
  %222 = add nsw i32 %218, %221
  %223 = mul nsw i32 20, %222
  %224 = add nsw i32 13, %223
  %225 = sext i32 %224 to i64
  %226 = load double** %1, align 8
  %227 = getelementptr inbounds double* %226, i64 %225
  %228 = load double* %227, align 8
  %229 = fadd double %214, %228
  %230 = load i32* %x, align 4
  %231 = load i32* %y, align 4
  %232 = mul nsw i32 %231, 100
  %233 = add nsw i32 %230, %232
  %234 = load i32* %z, align 4
  %235 = mul nsw i32 %234, 100
  %236 = mul nsw i32 %235, 100
  %237 = add nsw i32 %233, %236
  %238 = mul nsw i32 20, %237
  %239 = add nsw i32 14, %238
  %240 = sext i32 %239 to i64
  %241 = load double** %1, align 8
  %242 = getelementptr inbounds double* %241, i64 %240
  %243 = load double* %242, align 8
  %244 = fadd double %229, %243
  %245 = load i32* %x, align 4
  %246 = load i32* %y, align 4
  %247 = mul nsw i32 %246, 100
  %248 = add nsw i32 %245, %247
  %249 = load i32* %z, align 4
  %250 = mul nsw i32 %249, 100
  %251 = mul nsw i32 %250, 100
  %252 = add nsw i32 %248, %251
  %253 = mul nsw i32 20, %252
  %254 = add nsw i32 15, %253
  %255 = sext i32 %254 to i64
  %256 = load double** %1, align 8
  %257 = getelementptr inbounds double* %256, i64 %255
  %258 = load double* %257, align 8
  %259 = fadd double %244, %258
  %260 = load i32* %x, align 4
  %261 = load i32* %y, align 4
  %262 = mul nsw i32 %261, 100
  %263 = add nsw i32 %260, %262
  %264 = load i32* %z, align 4
  %265 = mul nsw i32 %264, 100
  %266 = mul nsw i32 %265, 100
  %267 = add nsw i32 %263, %266
  %268 = mul nsw i32 20, %267
  %269 = add nsw i32 16, %268
  %270 = sext i32 %269 to i64
  %271 = load double** %1, align 8
  %272 = getelementptr inbounds double* %271, i64 %270
  %273 = load double* %272, align 8
  %274 = fadd double %259, %273
  %275 = load i32* %x, align 4
  %276 = load i32* %y, align 4
  %277 = mul nsw i32 %276, 100
  %278 = add nsw i32 %275, %277
  %279 = load i32* %z, align 4
  %280 = mul nsw i32 %279, 100
  %281 = mul nsw i32 %280, 100
  %282 = add nsw i32 %278, %281
  %283 = mul nsw i32 20, %282
  %284 = add nsw i32 17, %283
  %285 = sext i32 %284 to i64
  %286 = load double** %1, align 8
  %287 = getelementptr inbounds double* %286, i64 %285
  %288 = load double* %287, align 8
  %289 = fadd double %274, %288
  %290 = load i32* %x, align 4
  %291 = load i32* %y, align 4
  %292 = mul nsw i32 %291, 100
  %293 = add nsw i32 %290, %292
  %294 = load i32* %z, align 4
  %295 = mul nsw i32 %294, 100
  %296 = mul nsw i32 %295, 100
  %297 = add nsw i32 %293, %296
  %298 = mul nsw i32 20, %297
  %299 = add nsw i32 18, %298
  %300 = sext i32 %299 to i64
  %301 = load double** %1, align 8
  %302 = getelementptr inbounds double* %301, i64 %300
  %303 = load double* %302, align 8
  %304 = fadd double %289, %303
  %305 = fptrunc double %304 to float
  store float %305, float* %rho, align 4
  %306 = load i32* %x, align 4
  %307 = load i32* %y, align 4
  %308 = mul nsw i32 %307, 100
  %309 = add nsw i32 %306, %308
  %310 = load i32* %z, align 4
  %311 = mul nsw i32 %310, 100
  %312 = mul nsw i32 %311, 100
  %313 = add nsw i32 %309, %312
  %314 = mul nsw i32 20, %313
  %315 = add nsw i32 3, %314
  %316 = sext i32 %315 to i64
  %317 = load double** %1, align 8
  %318 = getelementptr inbounds double* %317, i64 %316
  %319 = load double* %318, align 8
  %320 = load i32* %x, align 4
  %321 = load i32* %y, align 4
  %322 = mul nsw i32 %321, 100
  %323 = add nsw i32 %320, %322
  %324 = load i32* %z, align 4
  %325 = mul nsw i32 %324, 100
  %326 = mul nsw i32 %325, 100
  %327 = add nsw i32 %323, %326
  %328 = mul nsw i32 20, %327
  %329 = add nsw i32 4, %328
  %330 = sext i32 %329 to i64
  %331 = load double** %1, align 8
  %332 = getelementptr inbounds double* %331, i64 %330
  %333 = load double* %332, align 8
  %334 = fsub double %319, %333
  %335 = load i32* %x, align 4
  %336 = load i32* %y, align 4
  %337 = mul nsw i32 %336, 100
  %338 = add nsw i32 %335, %337
  %339 = load i32* %z, align 4
  %340 = mul nsw i32 %339, 100
  %341 = mul nsw i32 %340, 100
  %342 = add nsw i32 %338, %341
  %343 = mul nsw i32 20, %342
  %344 = add nsw i32 7, %343
  %345 = sext i32 %344 to i64
  %346 = load double** %1, align 8
  %347 = getelementptr inbounds double* %346, i64 %345
  %348 = load double* %347, align 8
  %349 = fadd double %334, %348
  %350 = load i32* %x, align 4
  %351 = load i32* %y, align 4
  %352 = mul nsw i32 %351, 100
  %353 = add nsw i32 %350, %352
  %354 = load i32* %z, align 4
  %355 = mul nsw i32 %354, 100
  %356 = mul nsw i32 %355, 100
  %357 = add nsw i32 %353, %356
  %358 = mul nsw i32 20, %357
  %359 = add nsw i32 8, %358
  %360 = sext i32 %359 to i64
  %361 = load double** %1, align 8
  %362 = getelementptr inbounds double* %361, i64 %360
  %363 = load double* %362, align 8
  %364 = fsub double %349, %363
  %365 = load i32* %x, align 4
  %366 = load i32* %y, align 4
  %367 = mul nsw i32 %366, 100
  %368 = add nsw i32 %365, %367
  %369 = load i32* %z, align 4
  %370 = mul nsw i32 %369, 100
  %371 = mul nsw i32 %370, 100
  %372 = add nsw i32 %368, %371
  %373 = mul nsw i32 20, %372
  %374 = add nsw i32 9, %373
  %375 = sext i32 %374 to i64
  %376 = load double** %1, align 8
  %377 = getelementptr inbounds double* %376, i64 %375
  %378 = load double* %377, align 8
  %379 = fadd double %364, %378
  %380 = load i32* %x, align 4
  %381 = load i32* %y, align 4
  %382 = mul nsw i32 %381, 100
  %383 = add nsw i32 %380, %382
  %384 = load i32* %z, align 4
  %385 = mul nsw i32 %384, 100
  %386 = mul nsw i32 %385, 100
  %387 = add nsw i32 %383, %386
  %388 = mul nsw i32 20, %387
  %389 = add nsw i32 10, %388
  %390 = sext i32 %389 to i64
  %391 = load double** %1, align 8
  %392 = getelementptr inbounds double* %391, i64 %390
  %393 = load double* %392, align 8
  %394 = fsub double %379, %393
  %395 = load i32* %x, align 4
  %396 = load i32* %y, align 4
  %397 = mul nsw i32 %396, 100
  %398 = add nsw i32 %395, %397
  %399 = load i32* %z, align 4
  %400 = mul nsw i32 %399, 100
  %401 = mul nsw i32 %400, 100
  %402 = add nsw i32 %398, %401
  %403 = mul nsw i32 20, %402
  %404 = add nsw i32 15, %403
  %405 = sext i32 %404 to i64
  %406 = load double** %1, align 8
  %407 = getelementptr inbounds double* %406, i64 %405
  %408 = load double* %407, align 8
  %409 = fadd double %394, %408
  %410 = load i32* %x, align 4
  %411 = load i32* %y, align 4
  %412 = mul nsw i32 %411, 100
  %413 = add nsw i32 %410, %412
  %414 = load i32* %z, align 4
  %415 = mul nsw i32 %414, 100
  %416 = mul nsw i32 %415, 100
  %417 = add nsw i32 %413, %416
  %418 = mul nsw i32 20, %417
  %419 = add nsw i32 16, %418
  %420 = sext i32 %419 to i64
  %421 = load double** %1, align 8
  %422 = getelementptr inbounds double* %421, i64 %420
  %423 = load double* %422, align 8
  %424 = fadd double %409, %423
  %425 = load i32* %x, align 4
  %426 = load i32* %y, align 4
  %427 = mul nsw i32 %426, 100
  %428 = add nsw i32 %425, %427
  %429 = load i32* %z, align 4
  %430 = mul nsw i32 %429, 100
  %431 = mul nsw i32 %430, 100
  %432 = add nsw i32 %428, %431
  %433 = mul nsw i32 20, %432
  %434 = add nsw i32 17, %433
  %435 = sext i32 %434 to i64
  %436 = load double** %1, align 8
  %437 = getelementptr inbounds double* %436, i64 %435
  %438 = load double* %437, align 8
  %439 = fsub double %424, %438
  %440 = load i32* %x, align 4
  %441 = load i32* %y, align 4
  %442 = mul nsw i32 %441, 100
  %443 = add nsw i32 %440, %442
  %444 = load i32* %z, align 4
  %445 = mul nsw i32 %444, 100
  %446 = mul nsw i32 %445, 100
  %447 = add nsw i32 %443, %446
  %448 = mul nsw i32 20, %447
  %449 = add nsw i32 18, %448
  %450 = sext i32 %449 to i64
  %451 = load double** %1, align 8
  %452 = getelementptr inbounds double* %451, i64 %450
  %453 = load double* %452, align 8
  %454 = fsub double %439, %453
  %455 = fptrunc double %454 to float
  store float %455, float* %ux, align 4
  %456 = load i32* %x, align 4
  %457 = load i32* %y, align 4
  %458 = mul nsw i32 %457, 100
  %459 = add nsw i32 %456, %458
  %460 = load i32* %z, align 4
  %461 = mul nsw i32 %460, 100
  %462 = mul nsw i32 %461, 100
  %463 = add nsw i32 %459, %462
  %464 = mul nsw i32 20, %463
  %465 = add nsw i32 1, %464
  %466 = sext i32 %465 to i64
  %467 = load double** %1, align 8
  %468 = getelementptr inbounds double* %467, i64 %466
  %469 = load double* %468, align 8
  %470 = load i32* %x, align 4
  %471 = load i32* %y, align 4
  %472 = mul nsw i32 %471, 100
  %473 = add nsw i32 %470, %472
  %474 = load i32* %z, align 4
  %475 = mul nsw i32 %474, 100
  %476 = mul nsw i32 %475, 100
  %477 = add nsw i32 %473, %476
  %478 = mul nsw i32 20, %477
  %479 = add nsw i32 2, %478
  %480 = sext i32 %479 to i64
  %481 = load double** %1, align 8
  %482 = getelementptr inbounds double* %481, i64 %480
  %483 = load double* %482, align 8
  %484 = fsub double %469, %483
  %485 = load i32* %x, align 4
  %486 = load i32* %y, align 4
  %487 = mul nsw i32 %486, 100
  %488 = add nsw i32 %485, %487
  %489 = load i32* %z, align 4
  %490 = mul nsw i32 %489, 100
  %491 = mul nsw i32 %490, 100
  %492 = add nsw i32 %488, %491
  %493 = mul nsw i32 20, %492
  %494 = add nsw i32 7, %493
  %495 = sext i32 %494 to i64
  %496 = load double** %1, align 8
  %497 = getelementptr inbounds double* %496, i64 %495
  %498 = load double* %497, align 8
  %499 = fadd double %484, %498
  %500 = load i32* %x, align 4
  %501 = load i32* %y, align 4
  %502 = mul nsw i32 %501, 100
  %503 = add nsw i32 %500, %502
  %504 = load i32* %z, align 4
  %505 = mul nsw i32 %504, 100
  %506 = mul nsw i32 %505, 100
  %507 = add nsw i32 %503, %506
  %508 = mul nsw i32 20, %507
  %509 = add nsw i32 8, %508
  %510 = sext i32 %509 to i64
  %511 = load double** %1, align 8
  %512 = getelementptr inbounds double* %511, i64 %510
  %513 = load double* %512, align 8
  %514 = fadd double %499, %513
  %515 = load i32* %x, align 4
  %516 = load i32* %y, align 4
  %517 = mul nsw i32 %516, 100
  %518 = add nsw i32 %515, %517
  %519 = load i32* %z, align 4
  %520 = mul nsw i32 %519, 100
  %521 = mul nsw i32 %520, 100
  %522 = add nsw i32 %518, %521
  %523 = mul nsw i32 20, %522
  %524 = add nsw i32 9, %523
  %525 = sext i32 %524 to i64
  %526 = load double** %1, align 8
  %527 = getelementptr inbounds double* %526, i64 %525
  %528 = load double* %527, align 8
  %529 = fsub double %514, %528
  %530 = load i32* %x, align 4
  %531 = load i32* %y, align 4
  %532 = mul nsw i32 %531, 100
  %533 = add nsw i32 %530, %532
  %534 = load i32* %z, align 4
  %535 = mul nsw i32 %534, 100
  %536 = mul nsw i32 %535, 100
  %537 = add nsw i32 %533, %536
  %538 = mul nsw i32 20, %537
  %539 = add nsw i32 10, %538
  %540 = sext i32 %539 to i64
  %541 = load double** %1, align 8
  %542 = getelementptr inbounds double* %541, i64 %540
  %543 = load double* %542, align 8
  %544 = fsub double %529, %543
  %545 = load i32* %x, align 4
  %546 = load i32* %y, align 4
  %547 = mul nsw i32 %546, 100
  %548 = add nsw i32 %545, %547
  %549 = load i32* %z, align 4
  %550 = mul nsw i32 %549, 100
  %551 = mul nsw i32 %550, 100
  %552 = add nsw i32 %548, %551
  %553 = mul nsw i32 20, %552
  %554 = add nsw i32 11, %553
  %555 = sext i32 %554 to i64
  %556 = load double** %1, align 8
  %557 = getelementptr inbounds double* %556, i64 %555
  %558 = load double* %557, align 8
  %559 = fadd double %544, %558
  %560 = load i32* %x, align 4
  %561 = load i32* %y, align 4
  %562 = mul nsw i32 %561, 100
  %563 = add nsw i32 %560, %562
  %564 = load i32* %z, align 4
  %565 = mul nsw i32 %564, 100
  %566 = mul nsw i32 %565, 100
  %567 = add nsw i32 %563, %566
  %568 = mul nsw i32 20, %567
  %569 = add nsw i32 12, %568
  %570 = sext i32 %569 to i64
  %571 = load double** %1, align 8
  %572 = getelementptr inbounds double* %571, i64 %570
  %573 = load double* %572, align 8
  %574 = fadd double %559, %573
  %575 = load i32* %x, align 4
  %576 = load i32* %y, align 4
  %577 = mul nsw i32 %576, 100
  %578 = add nsw i32 %575, %577
  %579 = load i32* %z, align 4
  %580 = mul nsw i32 %579, 100
  %581 = mul nsw i32 %580, 100
  %582 = add nsw i32 %578, %581
  %583 = mul nsw i32 20, %582
  %584 = add nsw i32 13, %583
  %585 = sext i32 %584 to i64
  %586 = load double** %1, align 8
  %587 = getelementptr inbounds double* %586, i64 %585
  %588 = load double* %587, align 8
  %589 = fsub double %574, %588
  %590 = load i32* %x, align 4
  %591 = load i32* %y, align 4
  %592 = mul nsw i32 %591, 100
  %593 = add nsw i32 %590, %592
  %594 = load i32* %z, align 4
  %595 = mul nsw i32 %594, 100
  %596 = mul nsw i32 %595, 100
  %597 = add nsw i32 %593, %596
  %598 = mul nsw i32 20, %597
  %599 = add nsw i32 14, %598
  %600 = sext i32 %599 to i64
  %601 = load double** %1, align 8
  %602 = getelementptr inbounds double* %601, i64 %600
  %603 = load double* %602, align 8
  %604 = fsub double %589, %603
  %605 = fptrunc double %604 to float
  store float %605, float* %uy, align 4
  %606 = load i32* %x, align 4
  %607 = load i32* %y, align 4
  %608 = mul nsw i32 %607, 100
  %609 = add nsw i32 %606, %608
  %610 = load i32* %z, align 4
  %611 = mul nsw i32 %610, 100
  %612 = mul nsw i32 %611, 100
  %613 = add nsw i32 %609, %612
  %614 = mul nsw i32 20, %613
  %615 = add nsw i32 5, %614
  %616 = sext i32 %615 to i64
  %617 = load double** %1, align 8
  %618 = getelementptr inbounds double* %617, i64 %616
  %619 = load double* %618, align 8
  %620 = load i32* %x, align 4
  %621 = load i32* %y, align 4
  %622 = mul nsw i32 %621, 100
  %623 = add nsw i32 %620, %622
  %624 = load i32* %z, align 4
  %625 = mul nsw i32 %624, 100
  %626 = mul nsw i32 %625, 100
  %627 = add nsw i32 %623, %626
  %628 = mul nsw i32 20, %627
  %629 = add nsw i32 6, %628
  %630 = sext i32 %629 to i64
  %631 = load double** %1, align 8
  %632 = getelementptr inbounds double* %631, i64 %630
  %633 = load double* %632, align 8
  %634 = fsub double %619, %633
  %635 = load i32* %x, align 4
  %636 = load i32* %y, align 4
  %637 = mul nsw i32 %636, 100
  %638 = add nsw i32 %635, %637
  %639 = load i32* %z, align 4
  %640 = mul nsw i32 %639, 100
  %641 = mul nsw i32 %640, 100
  %642 = add nsw i32 %638, %641
  %643 = mul nsw i32 20, %642
  %644 = add nsw i32 11, %643
  %645 = sext i32 %644 to i64
  %646 = load double** %1, align 8
  %647 = getelementptr inbounds double* %646, i64 %645
  %648 = load double* %647, align 8
  %649 = fadd double %634, %648
  %650 = load i32* %x, align 4
  %651 = load i32* %y, align 4
  %652 = mul nsw i32 %651, 100
  %653 = add nsw i32 %650, %652
  %654 = load i32* %z, align 4
  %655 = mul nsw i32 %654, 100
  %656 = mul nsw i32 %655, 100
  %657 = add nsw i32 %653, %656
  %658 = mul nsw i32 20, %657
  %659 = add nsw i32 12, %658
  %660 = sext i32 %659 to i64
  %661 = load double** %1, align 8
  %662 = getelementptr inbounds double* %661, i64 %660
  %663 = load double* %662, align 8
  %664 = fsub double %649, %663
  %665 = load i32* %x, align 4
  %666 = load i32* %y, align 4
  %667 = mul nsw i32 %666, 100
  %668 = add nsw i32 %665, %667
  %669 = load i32* %z, align 4
  %670 = mul nsw i32 %669, 100
  %671 = mul nsw i32 %670, 100
  %672 = add nsw i32 %668, %671
  %673 = mul nsw i32 20, %672
  %674 = add nsw i32 13, %673
  %675 = sext i32 %674 to i64
  %676 = load double** %1, align 8
  %677 = getelementptr inbounds double* %676, i64 %675
  %678 = load double* %677, align 8
  %679 = fadd double %664, %678
  %680 = load i32* %x, align 4
  %681 = load i32* %y, align 4
  %682 = mul nsw i32 %681, 100
  %683 = add nsw i32 %680, %682
  %684 = load i32* %z, align 4
  %685 = mul nsw i32 %684, 100
  %686 = mul nsw i32 %685, 100
  %687 = add nsw i32 %683, %686
  %688 = mul nsw i32 20, %687
  %689 = add nsw i32 14, %688
  %690 = sext i32 %689 to i64
  %691 = load double** %1, align 8
  %692 = getelementptr inbounds double* %691, i64 %690
  %693 = load double* %692, align 8
  %694 = fsub double %679, %693
  %695 = load i32* %x, align 4
  %696 = load i32* %y, align 4
  %697 = mul nsw i32 %696, 100
  %698 = add nsw i32 %695, %697
  %699 = load i32* %z, align 4
  %700 = mul nsw i32 %699, 100
  %701 = mul nsw i32 %700, 100
  %702 = add nsw i32 %698, %701
  %703 = mul nsw i32 20, %702
  %704 = add nsw i32 15, %703
  %705 = sext i32 %704 to i64
  %706 = load double** %1, align 8
  %707 = getelementptr inbounds double* %706, i64 %705
  %708 = load double* %707, align 8
  %709 = fadd double %694, %708
  %710 = load i32* %x, align 4
  %711 = load i32* %y, align 4
  %712 = mul nsw i32 %711, 100
  %713 = add nsw i32 %710, %712
  %714 = load i32* %z, align 4
  %715 = mul nsw i32 %714, 100
  %716 = mul nsw i32 %715, 100
  %717 = add nsw i32 %713, %716
  %718 = mul nsw i32 20, %717
  %719 = add nsw i32 16, %718
  %720 = sext i32 %719 to i64
  %721 = load double** %1, align 8
  %722 = getelementptr inbounds double* %721, i64 %720
  %723 = load double* %722, align 8
  %724 = fsub double %709, %723
  %725 = load i32* %x, align 4
  %726 = load i32* %y, align 4
  %727 = mul nsw i32 %726, 100
  %728 = add nsw i32 %725, %727
  %729 = load i32* %z, align 4
  %730 = mul nsw i32 %729, 100
  %731 = mul nsw i32 %730, 100
  %732 = add nsw i32 %728, %731
  %733 = mul nsw i32 20, %732
  %734 = add nsw i32 17, %733
  %735 = sext i32 %734 to i64
  %736 = load double** %1, align 8
  %737 = getelementptr inbounds double* %736, i64 %735
  %738 = load double* %737, align 8
  %739 = fadd double %724, %738
  %740 = load i32* %x, align 4
  %741 = load i32* %y, align 4
  %742 = mul nsw i32 %741, 100
  %743 = add nsw i32 %740, %742
  %744 = load i32* %z, align 4
  %745 = mul nsw i32 %744, 100
  %746 = mul nsw i32 %745, 100
  %747 = add nsw i32 %743, %746
  %748 = mul nsw i32 20, %747
  %749 = add nsw i32 18, %748
  %750 = sext i32 %749 to i64
  %751 = load double** %1, align 8
  %752 = getelementptr inbounds double* %751, i64 %750
  %753 = load double* %752, align 8
  %754 = fsub double %739, %753
  %755 = fptrunc double %754 to float
  store float %755, float* %uz, align 4
  %756 = load float* %rho, align 4
  %757 = load float* %ux, align 4
  %758 = fdiv float %757, %756
  store float %758, float* %ux, align 4
  %759 = load float* %rho, align 4
  %760 = load float* %uy, align 4
  %761 = fdiv float %760, %759
  store float %761, float* %uy, align 4
  %762 = load float* %rho, align 4
  %763 = load float* %uz, align 4
  %764 = fdiv float %763, %762
  store float %764, float* %uz, align 4
  %765 = load i32* %3, align 4
  %766 = icmp ne i32 %765, 0
  br i1 %766, label %767, label %771

; <label>:767                                     ; preds = %20
  %768 = load %struct._IO_FILE** %file, align 8
  call void @storeValue(%struct._IO_FILE* %768, float* %ux)
  %769 = load %struct._IO_FILE** %file, align 8
  call void @storeValue(%struct._IO_FILE* %769, float* %uy)
  %770 = load %struct._IO_FILE** %file, align 8
  call void @storeValue(%struct._IO_FILE* %770, float* %uz)
  br label %780

; <label>:771                                     ; preds = %20
  %772 = load %struct._IO_FILE** %file, align 8
  %773 = load float* %ux, align 4
  %774 = fpext float %773 to double
  %775 = load float* %uy, align 4
  %776 = fpext float %775 to double
  %777 = load float* %uz, align 4
  %778 = fpext float %777 to double
  %779 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %772, i8* getelementptr inbounds ([10 x i8]* @.str6, i32 0, i32 0), double %774, double %776, double %778)
  br label %780

; <label>:780                                     ; preds = %771, %767
  br label %781

; <label>:781                                     ; preds = %780
  %782 = load i32* %x, align 4
  %783 = add nsw i32 %782, 1
  store i32 %783, i32* %x, align 4
  br label %17

; <label>:784                                     ; preds = %17
  br label %785

; <label>:785                                     ; preds = %784
  %786 = load i32* %y, align 4
  %787 = add nsw i32 %786, 1
  store i32 %787, i32* %y, align 4
  br label %13

; <label>:788                                     ; preds = %13
  br label %789

; <label>:789                                     ; preds = %788
  %790 = load i32* %z, align 4
  %791 = add nsw i32 %790, 1
  store i32 %791, i32* %z, align 4
  br label %9

; <label>:792                                     ; preds = %9
  %793 = load %struct._IO_FILE** %file, align 8
  %794 = call i32 @fclose(%struct._IO_FILE* %793)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @storeValue(%struct._IO_FILE* %file, float* %v) #0 {
  %1 = alloca %struct._IO_FILE*, align 8
  %2 = alloca float*, align 8
  %litteBigEndianTest = alloca i32, align 4
  %vPtr = alloca i8*, align 8
  %buffer = alloca [4 x i8], align 1
  %i = alloca i32, align 4
  store %struct._IO_FILE* %file, %struct._IO_FILE** %1, align 8
  store float* %v, float** %2, align 8
  store i32 1, i32* %litteBigEndianTest, align 4
  %3 = bitcast i32* %litteBigEndianTest to i8*
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %32

; <label>:7                                       ; preds = %0
  %8 = load float** %2, align 8
  %9 = bitcast float* %8 to i8*
  store i8* %9, i8** %vPtr, align 8
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %25, %7
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = icmp ult i64 %12, 4
  br i1 %13, label %14, label %28

; <label>:14                                      ; preds = %10
  %15 = load i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = sub i64 4, %16
  %18 = sub i64 %17, 1
  %19 = load i8** %vPtr, align 8
  %20 = getelementptr inbounds i8* %19, i64 %18
  %21 = load i8* %20, align 1
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [4 x i8]* %buffer, i32 0, i64 %23
  store i8 %21, i8* %24, align 1
  br label %25

; <label>:25                                      ; preds = %14
  %26 = load i32* %i, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %i, align 4
  br label %10

; <label>:28                                      ; preds = %10
  %29 = getelementptr inbounds [4 x i8]* %buffer, i32 0, i32 0
  %30 = load %struct._IO_FILE** %1, align 8
  %31 = call i64 @fwrite(i8* %29, i64 4, i64 1, %struct._IO_FILE* %30)
  br label %37

; <label>:32                                      ; preds = %0
  %33 = load float** %2, align 8
  %34 = bitcast float* %33 to i8*
  %35 = load %struct._IO_FILE** %1, align 8
  %36 = call i64 @fwrite(i8* %34, i64 4, i64 1, %struct._IO_FILE* %35)
  br label %37

; <label>:37                                      ; preds = %32, %28
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @LBM_compareVelocityField(double* %grid, i8* %filename, i32 %binary) #0 {
  %1 = alloca double*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %rho = alloca double, align 8
  %ux = alloca double, align 8
  %uy = alloca double, align 8
  %uz = alloca double, align 8
  %fileUx = alloca float, align 4
  %fileUy = alloca float, align 4
  %fileUz = alloca float, align 4
  %dUx = alloca float, align 4
  %dUy = alloca float, align 4
  %dUz = alloca float, align 4
  %diff2 = alloca float, align 4
  %maxDiff2 = alloca float, align 4
  %file = alloca %struct._IO_FILE*, align 8
  store double* %grid, double** %1, align 8
  store i8* %filename, i8** %2, align 8
  store i32 %binary, i32* %3, align 4
  store float 0xC6293E5940000000, float* %maxDiff2, align 4
  %4 = load i8** %2, align 8
  %5 = load i32* %3, align 4
  %6 = icmp ne i32 %5, 0
  %7 = select i1 %6, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0)
  %8 = call %struct._IO_FILE* @fopen(i8* %4, i8* %7)
  store %struct._IO_FILE* %8, %struct._IO_FILE** %file, align 8
  store i32 0, i32* %z, align 4
  br label %9

; <label>:9                                       ; preds = %811, %0
  %10 = load i32* %z, align 4
  %11 = icmp slt i32 %10, 130
  br i1 %11, label %12, label %814

; <label>:12                                      ; preds = %9
  store i32 0, i32* %y, align 4
  br label %13

; <label>:13                                      ; preds = %807, %12
  %14 = load i32* %y, align 4
  %15 = icmp slt i32 %14, 100
  br i1 %15, label %16, label %810

; <label>:16                                      ; preds = %13
  store i32 0, i32* %x, align 4
  br label %17

; <label>:17                                      ; preds = %803, %16
  %18 = load i32* %x, align 4
  %19 = icmp slt i32 %18, 100
  br i1 %19, label %20, label %806

; <label>:20                                      ; preds = %17
  %21 = load i32* %x, align 4
  %22 = load i32* %y, align 4
  %23 = mul nsw i32 %22, 100
  %24 = add nsw i32 %21, %23
  %25 = load i32* %z, align 4
  %26 = mul nsw i32 %25, 100
  %27 = mul nsw i32 %26, 100
  %28 = add nsw i32 %24, %27
  %29 = mul nsw i32 20, %28
  %30 = add nsw i32 0, %29
  %31 = sext i32 %30 to i64
  %32 = load double** %1, align 8
  %33 = getelementptr inbounds double* %32, i64 %31
  %34 = load double* %33, align 8
  %35 = load i32* %x, align 4
  %36 = load i32* %y, align 4
  %37 = mul nsw i32 %36, 100
  %38 = add nsw i32 %35, %37
  %39 = load i32* %z, align 4
  %40 = mul nsw i32 %39, 100
  %41 = mul nsw i32 %40, 100
  %42 = add nsw i32 %38, %41
  %43 = mul nsw i32 20, %42
  %44 = add nsw i32 1, %43
  %45 = sext i32 %44 to i64
  %46 = load double** %1, align 8
  %47 = getelementptr inbounds double* %46, i64 %45
  %48 = load double* %47, align 8
  %49 = fadd double %34, %48
  %50 = load i32* %x, align 4
  %51 = load i32* %y, align 4
  %52 = mul nsw i32 %51, 100
  %53 = add nsw i32 %50, %52
  %54 = load i32* %z, align 4
  %55 = mul nsw i32 %54, 100
  %56 = mul nsw i32 %55, 100
  %57 = add nsw i32 %53, %56
  %58 = mul nsw i32 20, %57
  %59 = add nsw i32 2, %58
  %60 = sext i32 %59 to i64
  %61 = load double** %1, align 8
  %62 = getelementptr inbounds double* %61, i64 %60
  %63 = load double* %62, align 8
  %64 = fadd double %49, %63
  %65 = load i32* %x, align 4
  %66 = load i32* %y, align 4
  %67 = mul nsw i32 %66, 100
  %68 = add nsw i32 %65, %67
  %69 = load i32* %z, align 4
  %70 = mul nsw i32 %69, 100
  %71 = mul nsw i32 %70, 100
  %72 = add nsw i32 %68, %71
  %73 = mul nsw i32 20, %72
  %74 = add nsw i32 3, %73
  %75 = sext i32 %74 to i64
  %76 = load double** %1, align 8
  %77 = getelementptr inbounds double* %76, i64 %75
  %78 = load double* %77, align 8
  %79 = fadd double %64, %78
  %80 = load i32* %x, align 4
  %81 = load i32* %y, align 4
  %82 = mul nsw i32 %81, 100
  %83 = add nsw i32 %80, %82
  %84 = load i32* %z, align 4
  %85 = mul nsw i32 %84, 100
  %86 = mul nsw i32 %85, 100
  %87 = add nsw i32 %83, %86
  %88 = mul nsw i32 20, %87
  %89 = add nsw i32 4, %88
  %90 = sext i32 %89 to i64
  %91 = load double** %1, align 8
  %92 = getelementptr inbounds double* %91, i64 %90
  %93 = load double* %92, align 8
  %94 = fadd double %79, %93
  %95 = load i32* %x, align 4
  %96 = load i32* %y, align 4
  %97 = mul nsw i32 %96, 100
  %98 = add nsw i32 %95, %97
  %99 = load i32* %z, align 4
  %100 = mul nsw i32 %99, 100
  %101 = mul nsw i32 %100, 100
  %102 = add nsw i32 %98, %101
  %103 = mul nsw i32 20, %102
  %104 = add nsw i32 5, %103
  %105 = sext i32 %104 to i64
  %106 = load double** %1, align 8
  %107 = getelementptr inbounds double* %106, i64 %105
  %108 = load double* %107, align 8
  %109 = fadd double %94, %108
  %110 = load i32* %x, align 4
  %111 = load i32* %y, align 4
  %112 = mul nsw i32 %111, 100
  %113 = add nsw i32 %110, %112
  %114 = load i32* %z, align 4
  %115 = mul nsw i32 %114, 100
  %116 = mul nsw i32 %115, 100
  %117 = add nsw i32 %113, %116
  %118 = mul nsw i32 20, %117
  %119 = add nsw i32 6, %118
  %120 = sext i32 %119 to i64
  %121 = load double** %1, align 8
  %122 = getelementptr inbounds double* %121, i64 %120
  %123 = load double* %122, align 8
  %124 = fadd double %109, %123
  %125 = load i32* %x, align 4
  %126 = load i32* %y, align 4
  %127 = mul nsw i32 %126, 100
  %128 = add nsw i32 %125, %127
  %129 = load i32* %z, align 4
  %130 = mul nsw i32 %129, 100
  %131 = mul nsw i32 %130, 100
  %132 = add nsw i32 %128, %131
  %133 = mul nsw i32 20, %132
  %134 = add nsw i32 7, %133
  %135 = sext i32 %134 to i64
  %136 = load double** %1, align 8
  %137 = getelementptr inbounds double* %136, i64 %135
  %138 = load double* %137, align 8
  %139 = fadd double %124, %138
  %140 = load i32* %x, align 4
  %141 = load i32* %y, align 4
  %142 = mul nsw i32 %141, 100
  %143 = add nsw i32 %140, %142
  %144 = load i32* %z, align 4
  %145 = mul nsw i32 %144, 100
  %146 = mul nsw i32 %145, 100
  %147 = add nsw i32 %143, %146
  %148 = mul nsw i32 20, %147
  %149 = add nsw i32 8, %148
  %150 = sext i32 %149 to i64
  %151 = load double** %1, align 8
  %152 = getelementptr inbounds double* %151, i64 %150
  %153 = load double* %152, align 8
  %154 = fadd double %139, %153
  %155 = load i32* %x, align 4
  %156 = load i32* %y, align 4
  %157 = mul nsw i32 %156, 100
  %158 = add nsw i32 %155, %157
  %159 = load i32* %z, align 4
  %160 = mul nsw i32 %159, 100
  %161 = mul nsw i32 %160, 100
  %162 = add nsw i32 %158, %161
  %163 = mul nsw i32 20, %162
  %164 = add nsw i32 9, %163
  %165 = sext i32 %164 to i64
  %166 = load double** %1, align 8
  %167 = getelementptr inbounds double* %166, i64 %165
  %168 = load double* %167, align 8
  %169 = fadd double %154, %168
  %170 = load i32* %x, align 4
  %171 = load i32* %y, align 4
  %172 = mul nsw i32 %171, 100
  %173 = add nsw i32 %170, %172
  %174 = load i32* %z, align 4
  %175 = mul nsw i32 %174, 100
  %176 = mul nsw i32 %175, 100
  %177 = add nsw i32 %173, %176
  %178 = mul nsw i32 20, %177
  %179 = add nsw i32 10, %178
  %180 = sext i32 %179 to i64
  %181 = load double** %1, align 8
  %182 = getelementptr inbounds double* %181, i64 %180
  %183 = load double* %182, align 8
  %184 = fadd double %169, %183
  %185 = load i32* %x, align 4
  %186 = load i32* %y, align 4
  %187 = mul nsw i32 %186, 100
  %188 = add nsw i32 %185, %187
  %189 = load i32* %z, align 4
  %190 = mul nsw i32 %189, 100
  %191 = mul nsw i32 %190, 100
  %192 = add nsw i32 %188, %191
  %193 = mul nsw i32 20, %192
  %194 = add nsw i32 11, %193
  %195 = sext i32 %194 to i64
  %196 = load double** %1, align 8
  %197 = getelementptr inbounds double* %196, i64 %195
  %198 = load double* %197, align 8
  %199 = fadd double %184, %198
  %200 = load i32* %x, align 4
  %201 = load i32* %y, align 4
  %202 = mul nsw i32 %201, 100
  %203 = add nsw i32 %200, %202
  %204 = load i32* %z, align 4
  %205 = mul nsw i32 %204, 100
  %206 = mul nsw i32 %205, 100
  %207 = add nsw i32 %203, %206
  %208 = mul nsw i32 20, %207
  %209 = add nsw i32 12, %208
  %210 = sext i32 %209 to i64
  %211 = load double** %1, align 8
  %212 = getelementptr inbounds double* %211, i64 %210
  %213 = load double* %212, align 8
  %214 = fadd double %199, %213
  %215 = load i32* %x, align 4
  %216 = load i32* %y, align 4
  %217 = mul nsw i32 %216, 100
  %218 = add nsw i32 %215, %217
  %219 = load i32* %z, align 4
  %220 = mul nsw i32 %219, 100
  %221 = mul nsw i32 %220, 100
  %222 = add nsw i32 %218, %221
  %223 = mul nsw i32 20, %222
  %224 = add nsw i32 13, %223
  %225 = sext i32 %224 to i64
  %226 = load double** %1, align 8
  %227 = getelementptr inbounds double* %226, i64 %225
  %228 = load double* %227, align 8
  %229 = fadd double %214, %228
  %230 = load i32* %x, align 4
  %231 = load i32* %y, align 4
  %232 = mul nsw i32 %231, 100
  %233 = add nsw i32 %230, %232
  %234 = load i32* %z, align 4
  %235 = mul nsw i32 %234, 100
  %236 = mul nsw i32 %235, 100
  %237 = add nsw i32 %233, %236
  %238 = mul nsw i32 20, %237
  %239 = add nsw i32 14, %238
  %240 = sext i32 %239 to i64
  %241 = load double** %1, align 8
  %242 = getelementptr inbounds double* %241, i64 %240
  %243 = load double* %242, align 8
  %244 = fadd double %229, %243
  %245 = load i32* %x, align 4
  %246 = load i32* %y, align 4
  %247 = mul nsw i32 %246, 100
  %248 = add nsw i32 %245, %247
  %249 = load i32* %z, align 4
  %250 = mul nsw i32 %249, 100
  %251 = mul nsw i32 %250, 100
  %252 = add nsw i32 %248, %251
  %253 = mul nsw i32 20, %252
  %254 = add nsw i32 15, %253
  %255 = sext i32 %254 to i64
  %256 = load double** %1, align 8
  %257 = getelementptr inbounds double* %256, i64 %255
  %258 = load double* %257, align 8
  %259 = fadd double %244, %258
  %260 = load i32* %x, align 4
  %261 = load i32* %y, align 4
  %262 = mul nsw i32 %261, 100
  %263 = add nsw i32 %260, %262
  %264 = load i32* %z, align 4
  %265 = mul nsw i32 %264, 100
  %266 = mul nsw i32 %265, 100
  %267 = add nsw i32 %263, %266
  %268 = mul nsw i32 20, %267
  %269 = add nsw i32 16, %268
  %270 = sext i32 %269 to i64
  %271 = load double** %1, align 8
  %272 = getelementptr inbounds double* %271, i64 %270
  %273 = load double* %272, align 8
  %274 = fadd double %259, %273
  %275 = load i32* %x, align 4
  %276 = load i32* %y, align 4
  %277 = mul nsw i32 %276, 100
  %278 = add nsw i32 %275, %277
  %279 = load i32* %z, align 4
  %280 = mul nsw i32 %279, 100
  %281 = mul nsw i32 %280, 100
  %282 = add nsw i32 %278, %281
  %283 = mul nsw i32 20, %282
  %284 = add nsw i32 17, %283
  %285 = sext i32 %284 to i64
  %286 = load double** %1, align 8
  %287 = getelementptr inbounds double* %286, i64 %285
  %288 = load double* %287, align 8
  %289 = fadd double %274, %288
  %290 = load i32* %x, align 4
  %291 = load i32* %y, align 4
  %292 = mul nsw i32 %291, 100
  %293 = add nsw i32 %290, %292
  %294 = load i32* %z, align 4
  %295 = mul nsw i32 %294, 100
  %296 = mul nsw i32 %295, 100
  %297 = add nsw i32 %293, %296
  %298 = mul nsw i32 20, %297
  %299 = add nsw i32 18, %298
  %300 = sext i32 %299 to i64
  %301 = load double** %1, align 8
  %302 = getelementptr inbounds double* %301, i64 %300
  %303 = load double* %302, align 8
  %304 = fadd double %289, %303
  store double %304, double* %rho, align 8
  %305 = load i32* %x, align 4
  %306 = load i32* %y, align 4
  %307 = mul nsw i32 %306, 100
  %308 = add nsw i32 %305, %307
  %309 = load i32* %z, align 4
  %310 = mul nsw i32 %309, 100
  %311 = mul nsw i32 %310, 100
  %312 = add nsw i32 %308, %311
  %313 = mul nsw i32 20, %312
  %314 = add nsw i32 3, %313
  %315 = sext i32 %314 to i64
  %316 = load double** %1, align 8
  %317 = getelementptr inbounds double* %316, i64 %315
  %318 = load double* %317, align 8
  %319 = load i32* %x, align 4
  %320 = load i32* %y, align 4
  %321 = mul nsw i32 %320, 100
  %322 = add nsw i32 %319, %321
  %323 = load i32* %z, align 4
  %324 = mul nsw i32 %323, 100
  %325 = mul nsw i32 %324, 100
  %326 = add nsw i32 %322, %325
  %327 = mul nsw i32 20, %326
  %328 = add nsw i32 4, %327
  %329 = sext i32 %328 to i64
  %330 = load double** %1, align 8
  %331 = getelementptr inbounds double* %330, i64 %329
  %332 = load double* %331, align 8
  %333 = fsub double %318, %332
  %334 = load i32* %x, align 4
  %335 = load i32* %y, align 4
  %336 = mul nsw i32 %335, 100
  %337 = add nsw i32 %334, %336
  %338 = load i32* %z, align 4
  %339 = mul nsw i32 %338, 100
  %340 = mul nsw i32 %339, 100
  %341 = add nsw i32 %337, %340
  %342 = mul nsw i32 20, %341
  %343 = add nsw i32 7, %342
  %344 = sext i32 %343 to i64
  %345 = load double** %1, align 8
  %346 = getelementptr inbounds double* %345, i64 %344
  %347 = load double* %346, align 8
  %348 = fadd double %333, %347
  %349 = load i32* %x, align 4
  %350 = load i32* %y, align 4
  %351 = mul nsw i32 %350, 100
  %352 = add nsw i32 %349, %351
  %353 = load i32* %z, align 4
  %354 = mul nsw i32 %353, 100
  %355 = mul nsw i32 %354, 100
  %356 = add nsw i32 %352, %355
  %357 = mul nsw i32 20, %356
  %358 = add nsw i32 8, %357
  %359 = sext i32 %358 to i64
  %360 = load double** %1, align 8
  %361 = getelementptr inbounds double* %360, i64 %359
  %362 = load double* %361, align 8
  %363 = fsub double %348, %362
  %364 = load i32* %x, align 4
  %365 = load i32* %y, align 4
  %366 = mul nsw i32 %365, 100
  %367 = add nsw i32 %364, %366
  %368 = load i32* %z, align 4
  %369 = mul nsw i32 %368, 100
  %370 = mul nsw i32 %369, 100
  %371 = add nsw i32 %367, %370
  %372 = mul nsw i32 20, %371
  %373 = add nsw i32 9, %372
  %374 = sext i32 %373 to i64
  %375 = load double** %1, align 8
  %376 = getelementptr inbounds double* %375, i64 %374
  %377 = load double* %376, align 8
  %378 = fadd double %363, %377
  %379 = load i32* %x, align 4
  %380 = load i32* %y, align 4
  %381 = mul nsw i32 %380, 100
  %382 = add nsw i32 %379, %381
  %383 = load i32* %z, align 4
  %384 = mul nsw i32 %383, 100
  %385 = mul nsw i32 %384, 100
  %386 = add nsw i32 %382, %385
  %387 = mul nsw i32 20, %386
  %388 = add nsw i32 10, %387
  %389 = sext i32 %388 to i64
  %390 = load double** %1, align 8
  %391 = getelementptr inbounds double* %390, i64 %389
  %392 = load double* %391, align 8
  %393 = fsub double %378, %392
  %394 = load i32* %x, align 4
  %395 = load i32* %y, align 4
  %396 = mul nsw i32 %395, 100
  %397 = add nsw i32 %394, %396
  %398 = load i32* %z, align 4
  %399 = mul nsw i32 %398, 100
  %400 = mul nsw i32 %399, 100
  %401 = add nsw i32 %397, %400
  %402 = mul nsw i32 20, %401
  %403 = add nsw i32 15, %402
  %404 = sext i32 %403 to i64
  %405 = load double** %1, align 8
  %406 = getelementptr inbounds double* %405, i64 %404
  %407 = load double* %406, align 8
  %408 = fadd double %393, %407
  %409 = load i32* %x, align 4
  %410 = load i32* %y, align 4
  %411 = mul nsw i32 %410, 100
  %412 = add nsw i32 %409, %411
  %413 = load i32* %z, align 4
  %414 = mul nsw i32 %413, 100
  %415 = mul nsw i32 %414, 100
  %416 = add nsw i32 %412, %415
  %417 = mul nsw i32 20, %416
  %418 = add nsw i32 16, %417
  %419 = sext i32 %418 to i64
  %420 = load double** %1, align 8
  %421 = getelementptr inbounds double* %420, i64 %419
  %422 = load double* %421, align 8
  %423 = fadd double %408, %422
  %424 = load i32* %x, align 4
  %425 = load i32* %y, align 4
  %426 = mul nsw i32 %425, 100
  %427 = add nsw i32 %424, %426
  %428 = load i32* %z, align 4
  %429 = mul nsw i32 %428, 100
  %430 = mul nsw i32 %429, 100
  %431 = add nsw i32 %427, %430
  %432 = mul nsw i32 20, %431
  %433 = add nsw i32 17, %432
  %434 = sext i32 %433 to i64
  %435 = load double** %1, align 8
  %436 = getelementptr inbounds double* %435, i64 %434
  %437 = load double* %436, align 8
  %438 = fsub double %423, %437
  %439 = load i32* %x, align 4
  %440 = load i32* %y, align 4
  %441 = mul nsw i32 %440, 100
  %442 = add nsw i32 %439, %441
  %443 = load i32* %z, align 4
  %444 = mul nsw i32 %443, 100
  %445 = mul nsw i32 %444, 100
  %446 = add nsw i32 %442, %445
  %447 = mul nsw i32 20, %446
  %448 = add nsw i32 18, %447
  %449 = sext i32 %448 to i64
  %450 = load double** %1, align 8
  %451 = getelementptr inbounds double* %450, i64 %449
  %452 = load double* %451, align 8
  %453 = fsub double %438, %452
  store double %453, double* %ux, align 8
  %454 = load i32* %x, align 4
  %455 = load i32* %y, align 4
  %456 = mul nsw i32 %455, 100
  %457 = add nsw i32 %454, %456
  %458 = load i32* %z, align 4
  %459 = mul nsw i32 %458, 100
  %460 = mul nsw i32 %459, 100
  %461 = add nsw i32 %457, %460
  %462 = mul nsw i32 20, %461
  %463 = add nsw i32 1, %462
  %464 = sext i32 %463 to i64
  %465 = load double** %1, align 8
  %466 = getelementptr inbounds double* %465, i64 %464
  %467 = load double* %466, align 8
  %468 = load i32* %x, align 4
  %469 = load i32* %y, align 4
  %470 = mul nsw i32 %469, 100
  %471 = add nsw i32 %468, %470
  %472 = load i32* %z, align 4
  %473 = mul nsw i32 %472, 100
  %474 = mul nsw i32 %473, 100
  %475 = add nsw i32 %471, %474
  %476 = mul nsw i32 20, %475
  %477 = add nsw i32 2, %476
  %478 = sext i32 %477 to i64
  %479 = load double** %1, align 8
  %480 = getelementptr inbounds double* %479, i64 %478
  %481 = load double* %480, align 8
  %482 = fsub double %467, %481
  %483 = load i32* %x, align 4
  %484 = load i32* %y, align 4
  %485 = mul nsw i32 %484, 100
  %486 = add nsw i32 %483, %485
  %487 = load i32* %z, align 4
  %488 = mul nsw i32 %487, 100
  %489 = mul nsw i32 %488, 100
  %490 = add nsw i32 %486, %489
  %491 = mul nsw i32 20, %490
  %492 = add nsw i32 7, %491
  %493 = sext i32 %492 to i64
  %494 = load double** %1, align 8
  %495 = getelementptr inbounds double* %494, i64 %493
  %496 = load double* %495, align 8
  %497 = fadd double %482, %496
  %498 = load i32* %x, align 4
  %499 = load i32* %y, align 4
  %500 = mul nsw i32 %499, 100
  %501 = add nsw i32 %498, %500
  %502 = load i32* %z, align 4
  %503 = mul nsw i32 %502, 100
  %504 = mul nsw i32 %503, 100
  %505 = add nsw i32 %501, %504
  %506 = mul nsw i32 20, %505
  %507 = add nsw i32 8, %506
  %508 = sext i32 %507 to i64
  %509 = load double** %1, align 8
  %510 = getelementptr inbounds double* %509, i64 %508
  %511 = load double* %510, align 8
  %512 = fadd double %497, %511
  %513 = load i32* %x, align 4
  %514 = load i32* %y, align 4
  %515 = mul nsw i32 %514, 100
  %516 = add nsw i32 %513, %515
  %517 = load i32* %z, align 4
  %518 = mul nsw i32 %517, 100
  %519 = mul nsw i32 %518, 100
  %520 = add nsw i32 %516, %519
  %521 = mul nsw i32 20, %520
  %522 = add nsw i32 9, %521
  %523 = sext i32 %522 to i64
  %524 = load double** %1, align 8
  %525 = getelementptr inbounds double* %524, i64 %523
  %526 = load double* %525, align 8
  %527 = fsub double %512, %526
  %528 = load i32* %x, align 4
  %529 = load i32* %y, align 4
  %530 = mul nsw i32 %529, 100
  %531 = add nsw i32 %528, %530
  %532 = load i32* %z, align 4
  %533 = mul nsw i32 %532, 100
  %534 = mul nsw i32 %533, 100
  %535 = add nsw i32 %531, %534
  %536 = mul nsw i32 20, %535
  %537 = add nsw i32 10, %536
  %538 = sext i32 %537 to i64
  %539 = load double** %1, align 8
  %540 = getelementptr inbounds double* %539, i64 %538
  %541 = load double* %540, align 8
  %542 = fsub double %527, %541
  %543 = load i32* %x, align 4
  %544 = load i32* %y, align 4
  %545 = mul nsw i32 %544, 100
  %546 = add nsw i32 %543, %545
  %547 = load i32* %z, align 4
  %548 = mul nsw i32 %547, 100
  %549 = mul nsw i32 %548, 100
  %550 = add nsw i32 %546, %549
  %551 = mul nsw i32 20, %550
  %552 = add nsw i32 11, %551
  %553 = sext i32 %552 to i64
  %554 = load double** %1, align 8
  %555 = getelementptr inbounds double* %554, i64 %553
  %556 = load double* %555, align 8
  %557 = fadd double %542, %556
  %558 = load i32* %x, align 4
  %559 = load i32* %y, align 4
  %560 = mul nsw i32 %559, 100
  %561 = add nsw i32 %558, %560
  %562 = load i32* %z, align 4
  %563 = mul nsw i32 %562, 100
  %564 = mul nsw i32 %563, 100
  %565 = add nsw i32 %561, %564
  %566 = mul nsw i32 20, %565
  %567 = add nsw i32 12, %566
  %568 = sext i32 %567 to i64
  %569 = load double** %1, align 8
  %570 = getelementptr inbounds double* %569, i64 %568
  %571 = load double* %570, align 8
  %572 = fadd double %557, %571
  %573 = load i32* %x, align 4
  %574 = load i32* %y, align 4
  %575 = mul nsw i32 %574, 100
  %576 = add nsw i32 %573, %575
  %577 = load i32* %z, align 4
  %578 = mul nsw i32 %577, 100
  %579 = mul nsw i32 %578, 100
  %580 = add nsw i32 %576, %579
  %581 = mul nsw i32 20, %580
  %582 = add nsw i32 13, %581
  %583 = sext i32 %582 to i64
  %584 = load double** %1, align 8
  %585 = getelementptr inbounds double* %584, i64 %583
  %586 = load double* %585, align 8
  %587 = fsub double %572, %586
  %588 = load i32* %x, align 4
  %589 = load i32* %y, align 4
  %590 = mul nsw i32 %589, 100
  %591 = add nsw i32 %588, %590
  %592 = load i32* %z, align 4
  %593 = mul nsw i32 %592, 100
  %594 = mul nsw i32 %593, 100
  %595 = add nsw i32 %591, %594
  %596 = mul nsw i32 20, %595
  %597 = add nsw i32 14, %596
  %598 = sext i32 %597 to i64
  %599 = load double** %1, align 8
  %600 = getelementptr inbounds double* %599, i64 %598
  %601 = load double* %600, align 8
  %602 = fsub double %587, %601
  store double %602, double* %uy, align 8
  %603 = load i32* %x, align 4
  %604 = load i32* %y, align 4
  %605 = mul nsw i32 %604, 100
  %606 = add nsw i32 %603, %605
  %607 = load i32* %z, align 4
  %608 = mul nsw i32 %607, 100
  %609 = mul nsw i32 %608, 100
  %610 = add nsw i32 %606, %609
  %611 = mul nsw i32 20, %610
  %612 = add nsw i32 5, %611
  %613 = sext i32 %612 to i64
  %614 = load double** %1, align 8
  %615 = getelementptr inbounds double* %614, i64 %613
  %616 = load double* %615, align 8
  %617 = load i32* %x, align 4
  %618 = load i32* %y, align 4
  %619 = mul nsw i32 %618, 100
  %620 = add nsw i32 %617, %619
  %621 = load i32* %z, align 4
  %622 = mul nsw i32 %621, 100
  %623 = mul nsw i32 %622, 100
  %624 = add nsw i32 %620, %623
  %625 = mul nsw i32 20, %624
  %626 = add nsw i32 6, %625
  %627 = sext i32 %626 to i64
  %628 = load double** %1, align 8
  %629 = getelementptr inbounds double* %628, i64 %627
  %630 = load double* %629, align 8
  %631 = fsub double %616, %630
  %632 = load i32* %x, align 4
  %633 = load i32* %y, align 4
  %634 = mul nsw i32 %633, 100
  %635 = add nsw i32 %632, %634
  %636 = load i32* %z, align 4
  %637 = mul nsw i32 %636, 100
  %638 = mul nsw i32 %637, 100
  %639 = add nsw i32 %635, %638
  %640 = mul nsw i32 20, %639
  %641 = add nsw i32 11, %640
  %642 = sext i32 %641 to i64
  %643 = load double** %1, align 8
  %644 = getelementptr inbounds double* %643, i64 %642
  %645 = load double* %644, align 8
  %646 = fadd double %631, %645
  %647 = load i32* %x, align 4
  %648 = load i32* %y, align 4
  %649 = mul nsw i32 %648, 100
  %650 = add nsw i32 %647, %649
  %651 = load i32* %z, align 4
  %652 = mul nsw i32 %651, 100
  %653 = mul nsw i32 %652, 100
  %654 = add nsw i32 %650, %653
  %655 = mul nsw i32 20, %654
  %656 = add nsw i32 12, %655
  %657 = sext i32 %656 to i64
  %658 = load double** %1, align 8
  %659 = getelementptr inbounds double* %658, i64 %657
  %660 = load double* %659, align 8
  %661 = fsub double %646, %660
  %662 = load i32* %x, align 4
  %663 = load i32* %y, align 4
  %664 = mul nsw i32 %663, 100
  %665 = add nsw i32 %662, %664
  %666 = load i32* %z, align 4
  %667 = mul nsw i32 %666, 100
  %668 = mul nsw i32 %667, 100
  %669 = add nsw i32 %665, %668
  %670 = mul nsw i32 20, %669
  %671 = add nsw i32 13, %670
  %672 = sext i32 %671 to i64
  %673 = load double** %1, align 8
  %674 = getelementptr inbounds double* %673, i64 %672
  %675 = load double* %674, align 8
  %676 = fadd double %661, %675
  %677 = load i32* %x, align 4
  %678 = load i32* %y, align 4
  %679 = mul nsw i32 %678, 100
  %680 = add nsw i32 %677, %679
  %681 = load i32* %z, align 4
  %682 = mul nsw i32 %681, 100
  %683 = mul nsw i32 %682, 100
  %684 = add nsw i32 %680, %683
  %685 = mul nsw i32 20, %684
  %686 = add nsw i32 14, %685
  %687 = sext i32 %686 to i64
  %688 = load double** %1, align 8
  %689 = getelementptr inbounds double* %688, i64 %687
  %690 = load double* %689, align 8
  %691 = fsub double %676, %690
  %692 = load i32* %x, align 4
  %693 = load i32* %y, align 4
  %694 = mul nsw i32 %693, 100
  %695 = add nsw i32 %692, %694
  %696 = load i32* %z, align 4
  %697 = mul nsw i32 %696, 100
  %698 = mul nsw i32 %697, 100
  %699 = add nsw i32 %695, %698
  %700 = mul nsw i32 20, %699
  %701 = add nsw i32 15, %700
  %702 = sext i32 %701 to i64
  %703 = load double** %1, align 8
  %704 = getelementptr inbounds double* %703, i64 %702
  %705 = load double* %704, align 8
  %706 = fadd double %691, %705
  %707 = load i32* %x, align 4
  %708 = load i32* %y, align 4
  %709 = mul nsw i32 %708, 100
  %710 = add nsw i32 %707, %709
  %711 = load i32* %z, align 4
  %712 = mul nsw i32 %711, 100
  %713 = mul nsw i32 %712, 100
  %714 = add nsw i32 %710, %713
  %715 = mul nsw i32 20, %714
  %716 = add nsw i32 16, %715
  %717 = sext i32 %716 to i64
  %718 = load double** %1, align 8
  %719 = getelementptr inbounds double* %718, i64 %717
  %720 = load double* %719, align 8
  %721 = fsub double %706, %720
  %722 = load i32* %x, align 4
  %723 = load i32* %y, align 4
  %724 = mul nsw i32 %723, 100
  %725 = add nsw i32 %722, %724
  %726 = load i32* %z, align 4
  %727 = mul nsw i32 %726, 100
  %728 = mul nsw i32 %727, 100
  %729 = add nsw i32 %725, %728
  %730 = mul nsw i32 20, %729
  %731 = add nsw i32 17, %730
  %732 = sext i32 %731 to i64
  %733 = load double** %1, align 8
  %734 = getelementptr inbounds double* %733, i64 %732
  %735 = load double* %734, align 8
  %736 = fadd double %721, %735
  %737 = load i32* %x, align 4
  %738 = load i32* %y, align 4
  %739 = mul nsw i32 %738, 100
  %740 = add nsw i32 %737, %739
  %741 = load i32* %z, align 4
  %742 = mul nsw i32 %741, 100
  %743 = mul nsw i32 %742, 100
  %744 = add nsw i32 %740, %743
  %745 = mul nsw i32 20, %744
  %746 = add nsw i32 18, %745
  %747 = sext i32 %746 to i64
  %748 = load double** %1, align 8
  %749 = getelementptr inbounds double* %748, i64 %747
  %750 = load double* %749, align 8
  %751 = fsub double %736, %750
  store double %751, double* %uz, align 8
  %752 = load double* %rho, align 8
  %753 = load double* %ux, align 8
  %754 = fdiv double %753, %752
  store double %754, double* %ux, align 8
  %755 = load double* %rho, align 8
  %756 = load double* %uy, align 8
  %757 = fdiv double %756, %755
  store double %757, double* %uy, align 8
  %758 = load double* %rho, align 8
  %759 = load double* %uz, align 8
  %760 = fdiv double %759, %758
  store double %760, double* %uz, align 8
  %761 = load i32* %3, align 4
  %762 = icmp ne i32 %761, 0
  br i1 %762, label %763, label %767

; <label>:763                                     ; preds = %20
  %764 = load %struct._IO_FILE** %file, align 8
  call void @loadValue(%struct._IO_FILE* %764, float* %fileUx)
  %765 = load %struct._IO_FILE** %file, align 8
  call void @loadValue(%struct._IO_FILE* %765, float* %fileUy)
  %766 = load %struct._IO_FILE** %file, align 8
  call void @loadValue(%struct._IO_FILE* %766, float* %fileUz)
  br label %770

; <label>:767                                     ; preds = %20
  %768 = load %struct._IO_FILE** %file, align 8
  %769 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %768, i8* getelementptr inbounds ([10 x i8]* @.str8, i32 0, i32 0), float* %fileUx, float* %fileUy, float* %fileUz)
  br label %770

; <label>:770                                     ; preds = %767, %763
  %771 = load double* %ux, align 8
  %772 = load float* %fileUx, align 4
  %773 = fpext float %772 to double
  %774 = fsub double %771, %773
  %775 = fptrunc double %774 to float
  store float %775, float* %dUx, align 4
  %776 = load double* %uy, align 8
  %777 = load float* %fileUy, align 4
  %778 = fpext float %777 to double
  %779 = fsub double %776, %778
  %780 = fptrunc double %779 to float
  store float %780, float* %dUy, align 4
  %781 = load double* %uz, align 8
  %782 = load float* %fileUz, align 4
  %783 = fpext float %782 to double
  %784 = fsub double %781, %783
  %785 = fptrunc double %784 to float
  store float %785, float* %dUz, align 4
  %786 = load float* %dUx, align 4
  %787 = load float* %dUx, align 4
  %788 = fmul float %786, %787
  %789 = load float* %dUy, align 4
  %790 = load float* %dUy, align 4
  %791 = fmul float %789, %790
  %792 = fadd float %788, %791
  %793 = load float* %dUz, align 4
  %794 = load float* %dUz, align 4
  %795 = fmul float %793, %794
  %796 = fadd float %792, %795
  store float %796, float* %diff2, align 4
  %797 = load float* %diff2, align 4
  %798 = load float* %maxDiff2, align 4
  %799 = fcmp ogt float %797, %798
  br i1 %799, label %800, label %802

; <label>:800                                     ; preds = %770
  %801 = load float* %diff2, align 4
  store float %801, float* %maxDiff2, align 4
  br label %802

; <label>:802                                     ; preds = %800, %770
  br label %803

; <label>:803                                     ; preds = %802
  %804 = load i32* %x, align 4
  %805 = add nsw i32 %804, 1
  store i32 %805, i32* %x, align 4
  br label %17

; <label>:806                                     ; preds = %17
  br label %807

; <label>:807                                     ; preds = %806
  %808 = load i32* %y, align 4
  %809 = add nsw i32 %808, 1
  store i32 %809, i32* %y, align 4
  br label %13

; <label>:810                                     ; preds = %13
  br label %811

; <label>:811                                     ; preds = %810
  %812 = load i32* %z, align 4
  %813 = add nsw i32 %812, 1
  store i32 %813, i32* %z, align 4
  br label %9

; <label>:814                                     ; preds = %9
  %815 = load float* %maxDiff2, align 4
  %816 = fpext float %815 to double
  %817 = call double @sqrt(double %816) #4
  %818 = load float* %maxDiff2, align 4
  %819 = fpext float %818 to double
  %820 = call double @sqrt(double %819) #4
  %821 = fcmp ogt double %820, 1.000000e-05
  %822 = select i1 %821, i8* getelementptr inbounds ([18 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0)
  %823 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([50 x i8]* @.str9, i32 0, i32 0), double %817, i8* %822)
  %824 = load %struct._IO_FILE** %file, align 8
  %825 = call i32 @fclose(%struct._IO_FILE* %824)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @loadValue(%struct._IO_FILE* %file, float* %v) #0 {
  %1 = alloca %struct._IO_FILE*, align 8
  %2 = alloca float*, align 8
  %litteBigEndianTest = alloca i32, align 4
  %vPtr = alloca i8*, align 8
  %buffer = alloca [4 x i8], align 1
  %i = alloca i32, align 4
  store %struct._IO_FILE* %file, %struct._IO_FILE** %1, align 8
  store float* %v, float** %2, align 8
  store i32 1, i32* %litteBigEndianTest, align 4
  %3 = bitcast i32* %litteBigEndianTest to i8*
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %32

; <label>:7                                       ; preds = %0
  %8 = load float** %2, align 8
  %9 = bitcast float* %8 to i8*
  store i8* %9, i8** %vPtr, align 8
  %10 = getelementptr inbounds [4 x i8]* %buffer, i32 0, i32 0
  %11 = load %struct._IO_FILE** %1, align 8
  %12 = call i64 @fread(i8* %10, i64 4, i64 1, %struct._IO_FILE* %11)
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %28, %7
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = icmp ult i64 %15, 4
  br i1 %16, label %17, label %31

; <label>:17                                      ; preds = %13
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = sub i64 4, %19
  %21 = sub i64 %20, 1
  %22 = getelementptr inbounds [4 x i8]* %buffer, i32 0, i64 %21
  %23 = load i8* %22, align 1
  %24 = load i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = load i8** %vPtr, align 8
  %27 = getelementptr inbounds i8* %26, i64 %25
  store i8 %23, i8* %27, align 1
  br label %28

; <label>:28                                      ; preds = %17
  %29 = load i32* %i, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %i, align 4
  br label %13

; <label>:31                                      ; preds = %13
  br label %37

; <label>:32                                      ; preds = %0
  %33 = load float** %2, align 8
  %34 = bitcast float* %33 to i8*
  %35 = load %struct._IO_FILE** %1, align 8
  %36 = call i64 @fread(i8* %34, i64 4, i64 1, %struct._IO_FILE* %35)
  br label %37

; <label>:37                                      ; preds = %32, %31
  ret void
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #2

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
