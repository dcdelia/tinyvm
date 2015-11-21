; ModuleID = 'lbm.ll'
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
  %1 = call noalias i8* @malloc(i64 214400000) #4
  %2 = bitcast i8* %1 to double*
  store double* %2, double** %ptr, align 8
  %3 = load double** %ptr, align 8
  %4 = icmp ne double* %3, null
  br i1 %4, label %7, label %5

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([49 x i8]* @.str, i32 0, i32 0), double 0x40698EF800000000)
  call void @exit(i32 1) #5
  unreachable

; <label>:7                                       ; preds = %0
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str1, i32 0, i32 0), double 0x40698EF800000000)
  %9 = load double** %ptr, align 8
  %10 = getelementptr inbounds double* %9, i64 400000
  store double* %10, double** %ptr, align 8
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define void @LBM_freeGrid(double** %ptr) #0 {
  %1 = load double** %ptr, align 8
  %2 = getelementptr inbounds double* %1, i64 -400000
  %3 = bitcast double* %2 to i8*
  call void @free(i8* %3) #4
  store double* null, double** %ptr, align 8
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @LBM_initializeGrid(double* %grid) #0 {
  br label %1

; <label>:1                                       ; preds = %66, %0
  %i.0 = phi i32 [ -400000, %0 ], [ %67, %66 ]
  %2 = icmp slt i32 %i.0, 26400000
  br i1 %2, label %3, label %68

; <label>:3                                       ; preds = %1
  %4 = add nsw i32 0, %i.0
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds double* %grid, i64 %5
  store double 0x3FD5555555555555, double* %6, align 8
  %7 = add nsw i32 1, %i.0
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds double* %grid, i64 %8
  store double 0x3FAC71C71C71C71C, double* %9, align 8
  %10 = add nsw i32 2, %i.0
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds double* %grid, i64 %11
  store double 0x3FAC71C71C71C71C, double* %12, align 8
  %13 = add nsw i32 3, %i.0
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds double* %grid, i64 %14
  store double 0x3FAC71C71C71C71C, double* %15, align 8
  %16 = add nsw i32 4, %i.0
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds double* %grid, i64 %17
  store double 0x3FAC71C71C71C71C, double* %18, align 8
  %19 = add nsw i32 5, %i.0
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds double* %grid, i64 %20
  store double 0x3FAC71C71C71C71C, double* %21, align 8
  %22 = add nsw i32 6, %i.0
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds double* %grid, i64 %23
  store double 0x3FAC71C71C71C71C, double* %24, align 8
  %25 = add nsw i32 7, %i.0
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double* %grid, i64 %26
  store double 0x3F9C71C71C71C71C, double* %27, align 8
  %28 = add nsw i32 8, %i.0
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double* %grid, i64 %29
  store double 0x3F9C71C71C71C71C, double* %30, align 8
  %31 = add nsw i32 9, %i.0
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double* %grid, i64 %32
  store double 0x3F9C71C71C71C71C, double* %33, align 8
  %34 = add nsw i32 10, %i.0
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double* %grid, i64 %35
  store double 0x3F9C71C71C71C71C, double* %36, align 8
  %37 = add nsw i32 11, %i.0
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double* %grid, i64 %38
  store double 0x3F9C71C71C71C71C, double* %39, align 8
  %40 = add nsw i32 12, %i.0
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double* %grid, i64 %41
  store double 0x3F9C71C71C71C71C, double* %42, align 8
  %43 = add nsw i32 13, %i.0
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double* %grid, i64 %44
  store double 0x3F9C71C71C71C71C, double* %45, align 8
  %46 = add nsw i32 14, %i.0
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double* %grid, i64 %47
  store double 0x3F9C71C71C71C71C, double* %48, align 8
  %49 = add nsw i32 15, %i.0
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double* %grid, i64 %50
  store double 0x3F9C71C71C71C71C, double* %51, align 8
  %52 = add nsw i32 16, %i.0
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double* %grid, i64 %53
  store double 0x3F9C71C71C71C71C, double* %54, align 8
  %55 = add nsw i32 17, %i.0
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double* %grid, i64 %56
  store double 0x3F9C71C71C71C71C, double* %57, align 8
  %58 = add nsw i32 18, %i.0
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double* %grid, i64 %59
  store double 0x3F9C71C71C71C71C, double* %60, align 8
  %61 = add nsw i32 19, %i.0
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double* %grid, i64 %62
  %64 = bitcast double* %63 to i8*
  %65 = bitcast i8* %64 to i32*
  store i32 0, i32* %65, align 4
  br label %66

; <label>:66                                      ; preds = %3
  %67 = add nsw i32 %i.0, 20
  br label %1

; <label>:68                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @LBM_swapGrids([26000000 x double]** %grid1, [26000000 x double]** %grid2) #0 {
  %1 = load [26000000 x double]** %grid1, align 8
  %2 = load [26000000 x double]** %grid2, align 8
  store [26000000 x double]* %2, [26000000 x double]** %grid1, align 8
  store [26000000 x double]* %1, [26000000 x double]** %grid2, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @LBM_loadObstacleFile(double* %grid, i8* %filename) #0 {
  %1 = call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0))
  br label %2

; <label>:2                                       ; preds = %36, %0
  %z.0 = phi i32 [ 0, %0 ], [ %37, %36 ]
  %3 = icmp slt i32 %z.0, 130
  br i1 %3, label %4, label %38

; <label>:4                                       ; preds = %2
  br label %5

; <label>:5                                       ; preds = %32, %4
  %y.0 = phi i32 [ 0, %4 ], [ %33, %32 ]
  %6 = icmp slt i32 %y.0, 100
  br i1 %6, label %7, label %34

; <label>:7                                       ; preds = %5
  br label %8

; <label>:8                                       ; preds = %28, %7
  %x.0 = phi i32 [ 0, %7 ], [ %29, %28 ]
  %9 = icmp slt i32 %x.0, 100
  br i1 %9, label %10, label %30

; <label>:10                                      ; preds = %8
  %11 = call i32 @fgetc(%struct._IO_FILE* %1)
  %12 = icmp ne i32 %11, 46
  br i1 %12, label %13, label %27

; <label>:13                                      ; preds = %10
  %14 = mul nsw i32 %y.0, 100
  %15 = add nsw i32 %x.0, %14
  %16 = mul nsw i32 %z.0, 100
  %17 = mul nsw i32 %16, 100
  %18 = add nsw i32 %15, %17
  %19 = mul nsw i32 20, %18
  %20 = add nsw i32 19, %19
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds double* %grid, i64 %21
  %23 = bitcast double* %22 to i8*
  %24 = bitcast i8* %23 to i32*
  %25 = load i32* %24, align 4
  %26 = or i32 %25, 1
  store i32 %26, i32* %24, align 4
  br label %27

; <label>:27                                      ; preds = %13, %10
  br label %28

; <label>:28                                      ; preds = %27
  %29 = add nsw i32 %x.0, 1
  br label %8

; <label>:30                                      ; preds = %8
  %31 = call i32 @fgetc(%struct._IO_FILE* %1)
  br label %32

; <label>:32                                      ; preds = %30
  %33 = add nsw i32 %y.0, 1
  br label %5

; <label>:34                                      ; preds = %5
  %35 = call i32 @fgetc(%struct._IO_FILE* %1)
  br label %36

; <label>:36                                      ; preds = %34
  %37 = add nsw i32 %z.0, 1
  br label %2

; <label>:38                                      ; preds = %2
  %39 = call i32 @fclose(%struct._IO_FILE* %1)
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @fgetc(%struct._IO_FILE*) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define void @LBM_initializeSpecialCellsForLDC(double* %grid) #0 {
  br label %1

; <label>:1                                       ; preds = %69, %0
  %z.0 = phi i32 [ -2, %0 ], [ %70, %69 ]
  %2 = icmp slt i32 %z.0, 132
  br i1 %2, label %3, label %71

; <label>:3                                       ; preds = %1
  br label %4

; <label>:4                                       ; preds = %66, %3
  %y.0 = phi i32 [ 0, %3 ], [ %67, %66 ]
  %5 = icmp slt i32 %y.0, 100
  br i1 %5, label %6, label %68

; <label>:6                                       ; preds = %4
  br label %7

; <label>:7                                       ; preds = %63, %6
  %x.0 = phi i32 [ 0, %6 ], [ %64, %63 ]
  %8 = icmp slt i32 %x.0, 100
  br i1 %8, label %9, label %65

; <label>:9                                       ; preds = %7
  %10 = icmp eq i32 %x.0, 0
  br i1 %10, label %21, label %11

; <label>:11                                      ; preds = %9
  %12 = icmp eq i32 %x.0, 99
  br i1 %12, label %21, label %13

; <label>:13                                      ; preds = %11
  %14 = icmp eq i32 %y.0, 0
  br i1 %14, label %21, label %15

; <label>:15                                      ; preds = %13
  %16 = icmp eq i32 %y.0, 99
  br i1 %16, label %21, label %17

; <label>:17                                      ; preds = %15
  %18 = icmp eq i32 %z.0, 0
  br i1 %18, label %21, label %19

; <label>:19                                      ; preds = %17
  %20 = icmp eq i32 %z.0, 129
  br i1 %20, label %21, label %35

; <label>:21                                      ; preds = %19, %17, %15, %13, %11, %9
  %22 = mul nsw i32 %y.0, 100
  %23 = add nsw i32 %x.0, %22
  %24 = mul nsw i32 %z.0, 100
  %25 = mul nsw i32 %24, 100
  %26 = add nsw i32 %23, %25
  %27 = mul nsw i32 20, %26
  %28 = add nsw i32 19, %27
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double* %grid, i64 %29
  %31 = bitcast double* %30 to i8*
  %32 = bitcast i8* %31 to i32*
  %33 = load i32* %32, align 4
  %34 = or i32 %33, 1
  store i32 %34, i32* %32, align 4
  br label %62

; <label>:35                                      ; preds = %19
  %36 = icmp eq i32 %z.0, 1
  br i1 %36, label %39, label %37

; <label>:37                                      ; preds = %35
  %38 = icmp eq i32 %z.0, 128
  br i1 %38, label %39, label %61

; <label>:39                                      ; preds = %37, %35
  %40 = icmp sgt i32 %x.0, 1
  br i1 %40, label %41, label %61

; <label>:41                                      ; preds = %39
  %42 = icmp slt i32 %x.0, 98
  br i1 %42, label %43, label %61

; <label>:43                                      ; preds = %41
  %44 = icmp sgt i32 %y.0, 1
  br i1 %44, label %45, label %61

; <label>:45                                      ; preds = %43
  %46 = icmp slt i32 %y.0, 98
  br i1 %46, label %47, label %61

; <label>:47                                      ; preds = %45
  %48 = mul nsw i32 %y.0, 100
  %49 = add nsw i32 %x.0, %48
  %50 = mul nsw i32 %z.0, 100
  %51 = mul nsw i32 %50, 100
  %52 = add nsw i32 %49, %51
  %53 = mul nsw i32 20, %52
  %54 = add nsw i32 19, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double* %grid, i64 %55
  %57 = bitcast double* %56 to i8*
  %58 = bitcast i8* %57 to i32*
  %59 = load i32* %58, align 4
  %60 = or i32 %59, 2
  store i32 %60, i32* %58, align 4
  br label %61

; <label>:61                                      ; preds = %47, %45, %43, %41, %39, %37
  br label %62

; <label>:62                                      ; preds = %61, %21
  br label %63

; <label>:63                                      ; preds = %62
  %64 = add nsw i32 %x.0, 1
  br label %7

; <label>:65                                      ; preds = %7
  br label %66

; <label>:66                                      ; preds = %65
  %67 = add nsw i32 %y.0, 1
  br label %4

; <label>:68                                      ; preds = %4
  br label %69

; <label>:69                                      ; preds = %68
  %70 = add nsw i32 %z.0, 1
  br label %1

; <label>:71                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @LBM_initializeSpecialCellsForChannel(double* %grid) #0 {
  br label %1

; <label>:1                                       ; preds = %71, %0
  %z.0 = phi i32 [ -2, %0 ], [ %72, %71 ]
  %2 = icmp slt i32 %z.0, 132
  br i1 %2, label %3, label %73

; <label>:3                                       ; preds = %1
  br label %4

; <label>:4                                       ; preds = %68, %3
  %y.0 = phi i32 [ 0, %3 ], [ %69, %68 ]
  %5 = icmp slt i32 %y.0, 100
  br i1 %5, label %6, label %70

; <label>:6                                       ; preds = %4
  br label %7

; <label>:7                                       ; preds = %65, %6
  %x.0 = phi i32 [ 0, %6 ], [ %66, %65 ]
  %8 = icmp slt i32 %x.0, 100
  br i1 %8, label %9, label %67

; <label>:9                                       ; preds = %7
  %10 = icmp eq i32 %x.0, 0
  br i1 %10, label %17, label %11

; <label>:11                                      ; preds = %9
  %12 = icmp eq i32 %x.0, 99
  br i1 %12, label %17, label %13

; <label>:13                                      ; preds = %11
  %14 = icmp eq i32 %y.0, 0
  br i1 %14, label %17, label %15

; <label>:15                                      ; preds = %13
  %16 = icmp eq i32 %y.0, 99
  br i1 %16, label %17, label %64

; <label>:17                                      ; preds = %15, %13, %11, %9
  %18 = mul nsw i32 %y.0, 100
  %19 = add nsw i32 %x.0, %18
  %20 = mul nsw i32 %z.0, 100
  %21 = mul nsw i32 %20, 100
  %22 = add nsw i32 %19, %21
  %23 = mul nsw i32 20, %22
  %24 = add nsw i32 19, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double* %grid, i64 %25
  %27 = bitcast double* %26 to i8*
  %28 = bitcast i8* %27 to i32*
  %29 = load i32* %28, align 4
  %30 = or i32 %29, 1
  store i32 %30, i32* %28, align 4
  %31 = icmp eq i32 %z.0, 0
  br i1 %31, label %34, label %32

; <label>:32                                      ; preds = %17
  %33 = icmp eq i32 %z.0, 129
  br i1 %33, label %34, label %63

; <label>:34                                      ; preds = %32, %17
  %35 = mul nsw i32 %y.0, 100
  %36 = add nsw i32 %x.0, %35
  %37 = mul nsw i32 %z.0, 100
  %38 = mul nsw i32 %37, 100
  %39 = add nsw i32 %36, %38
  %40 = mul nsw i32 20, %39
  %41 = add nsw i32 19, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double* %grid, i64 %42
  %44 = bitcast double* %43 to i8*
  %45 = bitcast i8* %44 to i32*
  %46 = load i32* %45, align 4
  %47 = and i32 %46, 1
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %63, label %49

; <label>:49                                      ; preds = %34
  %50 = mul nsw i32 %y.0, 100
  %51 = add nsw i32 %x.0, %50
  %52 = mul nsw i32 %z.0, 100
  %53 = mul nsw i32 %52, 100
  %54 = add nsw i32 %51, %53
  %55 = mul nsw i32 20, %54
  %56 = add nsw i32 19, %55
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double* %grid, i64 %57
  %59 = bitcast double* %58 to i8*
  %60 = bitcast i8* %59 to i32*
  %61 = load i32* %60, align 4
  %62 = or i32 %61, 4
  store i32 %62, i32* %60, align 4
  br label %63

; <label>:63                                      ; preds = %49, %34, %32
  br label %64

; <label>:64                                      ; preds = %63, %15
  br label %65

; <label>:65                                      ; preds = %64
  %66 = add nsw i32 %x.0, 1
  br label %7

; <label>:67                                      ; preds = %7
  br label %68

; <label>:68                                      ; preds = %67
  %69 = add nsw i32 %y.0, 1
  br label %4

; <label>:70                                      ; preds = %4
  br label %71

; <label>:71                                      ; preds = %70
  %72 = add nsw i32 %z.0, 1
  br label %1

; <label>:73                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @LBM_performStreamCollide(double* %srcGrid, double* %dstGrid) #0 {
  br label %1

; <label>:1                                       ; preds = %743, %0
  %i.0 = phi i32 [ 0, %0 ], [ %744, %743 ]
  %2 = icmp slt i32 %i.0, 26000000
  br i1 %2, label %3, label %745

; <label>:3                                       ; preds = %1
  %4 = add nsw i32 19, %i.0
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds double* %srcGrid, i64 %5
  %7 = bitcast double* %6 to i8*
  %8 = bitcast i8* %7 to i32*
  %9 = load i32* %8, align 4
  %10 = and i32 %9, 1
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %146

; <label>:12                                      ; preds = %3
  %13 = add nsw i32 0, %i.0
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds double* %srcGrid, i64 %14
  %16 = load double* %15, align 8
  %17 = add nsw i32 0, %i.0
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds double* %dstGrid, i64 %18
  store double %16, double* %19, align 8
  %20 = add nsw i32 1, %i.0
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds double* %srcGrid, i64 %21
  %23 = load double* %22, align 8
  %24 = add nsw i32 -1998, %i.0
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double* %dstGrid, i64 %25
  store double %23, double* %26, align 8
  %27 = add nsw i32 2, %i.0
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double* %srcGrid, i64 %28
  %30 = load double* %29, align 8
  %31 = add nsw i32 2001, %i.0
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double* %dstGrid, i64 %32
  store double %30, double* %33, align 8
  %34 = add nsw i32 3, %i.0
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double* %srcGrid, i64 %35
  %37 = load double* %36, align 8
  %38 = add nsw i32 -16, %i.0
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double* %dstGrid, i64 %39
  store double %37, double* %40, align 8
  %41 = add nsw i32 4, %i.0
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double* %srcGrid, i64 %42
  %44 = load double* %43, align 8
  %45 = add nsw i32 23, %i.0
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double* %dstGrid, i64 %46
  store double %44, double* %47, align 8
  %48 = add nsw i32 5, %i.0
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds double* %srcGrid, i64 %49
  %51 = load double* %50, align 8
  %52 = add nsw i32 -199994, %i.0
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double* %dstGrid, i64 %53
  store double %51, double* %54, align 8
  %55 = add nsw i32 6, %i.0
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double* %srcGrid, i64 %56
  %58 = load double* %57, align 8
  %59 = add nsw i32 200005, %i.0
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double* %dstGrid, i64 %60
  store double %58, double* %61, align 8
  %62 = add nsw i32 7, %i.0
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double* %srcGrid, i64 %63
  %65 = load double* %64, align 8
  %66 = add nsw i32 -2010, %i.0
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double* %dstGrid, i64 %67
  store double %65, double* %68, align 8
  %69 = add nsw i32 8, %i.0
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds double* %srcGrid, i64 %70
  %72 = load double* %71, align 8
  %73 = add nsw i32 -1971, %i.0
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double* %dstGrid, i64 %74
  store double %72, double* %75, align 8
  %76 = add nsw i32 9, %i.0
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double* %srcGrid, i64 %77
  %79 = load double* %78, align 8
  %80 = add nsw i32 1988, %i.0
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double* %dstGrid, i64 %81
  store double %79, double* %82, align 8
  %83 = add nsw i32 10, %i.0
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double* %srcGrid, i64 %84
  %86 = load double* %85, align 8
  %87 = add nsw i32 2027, %i.0
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double* %dstGrid, i64 %88
  store double %86, double* %89, align 8
  %90 = add nsw i32 11, %i.0
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double* %srcGrid, i64 %91
  %93 = load double* %92, align 8
  %94 = add nsw i32 -201986, %i.0
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double* %dstGrid, i64 %95
  store double %93, double* %96, align 8
  %97 = add nsw i32 12, %i.0
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds double* %srcGrid, i64 %98
  %100 = load double* %99, align 8
  %101 = add nsw i32 198013, %i.0
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double* %dstGrid, i64 %102
  store double %100, double* %103, align 8
  %104 = add nsw i32 13, %i.0
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds double* %srcGrid, i64 %105
  %107 = load double* %106, align 8
  %108 = add nsw i32 -197988, %i.0
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds double* %dstGrid, i64 %109
  store double %107, double* %110, align 8
  %111 = add nsw i32 14, %i.0
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds double* %srcGrid, i64 %112
  %114 = load double* %113, align 8
  %115 = add nsw i32 202011, %i.0
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds double* %dstGrid, i64 %116
  store double %114, double* %117, align 8
  %118 = add nsw i32 15, %i.0
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds double* %srcGrid, i64 %119
  %121 = load double* %120, align 8
  %122 = add nsw i32 -200002, %i.0
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double* %dstGrid, i64 %123
  store double %121, double* %124, align 8
  %125 = add nsw i32 16, %i.0
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds double* %srcGrid, i64 %126
  %128 = load double* %127, align 8
  %129 = add nsw i32 199997, %i.0
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds double* %dstGrid, i64 %130
  store double %128, double* %131, align 8
  %132 = add nsw i32 17, %i.0
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds double* %srcGrid, i64 %133
  %135 = load double* %134, align 8
  %136 = add nsw i32 -199964, %i.0
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds double* %dstGrid, i64 %137
  store double %135, double* %138, align 8
  %139 = add nsw i32 18, %i.0
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds double* %srcGrid, i64 %140
  %142 = load double* %141, align 8
  %143 = add nsw i32 200035, %i.0
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds double* %dstGrid, i64 %144
  store double %142, double* %145, align 8
  br label %743

; <label>:146                                     ; preds = %3
  %147 = add nsw i32 0, %i.0
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds double* %srcGrid, i64 %148
  %150 = load double* %149, align 8
  %151 = add nsw i32 1, %i.0
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds double* %srcGrid, i64 %152
  %154 = load double* %153, align 8
  %155 = fadd double %150, %154
  %156 = add nsw i32 2, %i.0
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds double* %srcGrid, i64 %157
  %159 = load double* %158, align 8
  %160 = fadd double %155, %159
  %161 = add nsw i32 3, %i.0
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds double* %srcGrid, i64 %162
  %164 = load double* %163, align 8
  %165 = fadd double %160, %164
  %166 = add nsw i32 4, %i.0
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds double* %srcGrid, i64 %167
  %169 = load double* %168, align 8
  %170 = fadd double %165, %169
  %171 = add nsw i32 5, %i.0
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds double* %srcGrid, i64 %172
  %174 = load double* %173, align 8
  %175 = fadd double %170, %174
  %176 = add nsw i32 6, %i.0
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds double* %srcGrid, i64 %177
  %179 = load double* %178, align 8
  %180 = fadd double %175, %179
  %181 = add nsw i32 7, %i.0
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds double* %srcGrid, i64 %182
  %184 = load double* %183, align 8
  %185 = fadd double %180, %184
  %186 = add nsw i32 8, %i.0
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds double* %srcGrid, i64 %187
  %189 = load double* %188, align 8
  %190 = fadd double %185, %189
  %191 = add nsw i32 9, %i.0
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds double* %srcGrid, i64 %192
  %194 = load double* %193, align 8
  %195 = fadd double %190, %194
  %196 = add nsw i32 10, %i.0
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds double* %srcGrid, i64 %197
  %199 = load double* %198, align 8
  %200 = fadd double %195, %199
  %201 = add nsw i32 11, %i.0
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds double* %srcGrid, i64 %202
  %204 = load double* %203, align 8
  %205 = fadd double %200, %204
  %206 = add nsw i32 12, %i.0
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds double* %srcGrid, i64 %207
  %209 = load double* %208, align 8
  %210 = fadd double %205, %209
  %211 = add nsw i32 13, %i.0
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds double* %srcGrid, i64 %212
  %214 = load double* %213, align 8
  %215 = fadd double %210, %214
  %216 = add nsw i32 14, %i.0
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds double* %srcGrid, i64 %217
  %219 = load double* %218, align 8
  %220 = fadd double %215, %219
  %221 = add nsw i32 15, %i.0
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds double* %srcGrid, i64 %222
  %224 = load double* %223, align 8
  %225 = fadd double %220, %224
  %226 = add nsw i32 16, %i.0
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds double* %srcGrid, i64 %227
  %229 = load double* %228, align 8
  %230 = fadd double %225, %229
  %231 = add nsw i32 17, %i.0
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds double* %srcGrid, i64 %232
  %234 = load double* %233, align 8
  %235 = fadd double %230, %234
  %236 = add nsw i32 18, %i.0
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds double* %srcGrid, i64 %237
  %239 = load double* %238, align 8
  %240 = fadd double %235, %239
  %241 = add nsw i32 3, %i.0
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds double* %srcGrid, i64 %242
  %244 = load double* %243, align 8
  %245 = add nsw i32 4, %i.0
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds double* %srcGrid, i64 %246
  %248 = load double* %247, align 8
  %249 = fsub double %244, %248
  %250 = add nsw i32 7, %i.0
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds double* %srcGrid, i64 %251
  %253 = load double* %252, align 8
  %254 = fadd double %249, %253
  %255 = add nsw i32 8, %i.0
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds double* %srcGrid, i64 %256
  %258 = load double* %257, align 8
  %259 = fsub double %254, %258
  %260 = add nsw i32 9, %i.0
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds double* %srcGrid, i64 %261
  %263 = load double* %262, align 8
  %264 = fadd double %259, %263
  %265 = add nsw i32 10, %i.0
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds double* %srcGrid, i64 %266
  %268 = load double* %267, align 8
  %269 = fsub double %264, %268
  %270 = add nsw i32 15, %i.0
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds double* %srcGrid, i64 %271
  %273 = load double* %272, align 8
  %274 = fadd double %269, %273
  %275 = add nsw i32 16, %i.0
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds double* %srcGrid, i64 %276
  %278 = load double* %277, align 8
  %279 = fadd double %274, %278
  %280 = add nsw i32 17, %i.0
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds double* %srcGrid, i64 %281
  %283 = load double* %282, align 8
  %284 = fsub double %279, %283
  %285 = add nsw i32 18, %i.0
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds double* %srcGrid, i64 %286
  %288 = load double* %287, align 8
  %289 = fsub double %284, %288
  %290 = add nsw i32 1, %i.0
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds double* %srcGrid, i64 %291
  %293 = load double* %292, align 8
  %294 = add nsw i32 2, %i.0
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds double* %srcGrid, i64 %295
  %297 = load double* %296, align 8
  %298 = fsub double %293, %297
  %299 = add nsw i32 7, %i.0
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds double* %srcGrid, i64 %300
  %302 = load double* %301, align 8
  %303 = fadd double %298, %302
  %304 = add nsw i32 8, %i.0
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds double* %srcGrid, i64 %305
  %307 = load double* %306, align 8
  %308 = fadd double %303, %307
  %309 = add nsw i32 9, %i.0
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds double* %srcGrid, i64 %310
  %312 = load double* %311, align 8
  %313 = fsub double %308, %312
  %314 = add nsw i32 10, %i.0
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds double* %srcGrid, i64 %315
  %317 = load double* %316, align 8
  %318 = fsub double %313, %317
  %319 = add nsw i32 11, %i.0
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds double* %srcGrid, i64 %320
  %322 = load double* %321, align 8
  %323 = fadd double %318, %322
  %324 = add nsw i32 12, %i.0
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds double* %srcGrid, i64 %325
  %327 = load double* %326, align 8
  %328 = fadd double %323, %327
  %329 = add nsw i32 13, %i.0
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds double* %srcGrid, i64 %330
  %332 = load double* %331, align 8
  %333 = fsub double %328, %332
  %334 = add nsw i32 14, %i.0
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds double* %srcGrid, i64 %335
  %337 = load double* %336, align 8
  %338 = fsub double %333, %337
  %339 = add nsw i32 5, %i.0
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds double* %srcGrid, i64 %340
  %342 = load double* %341, align 8
  %343 = add nsw i32 6, %i.0
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds double* %srcGrid, i64 %344
  %346 = load double* %345, align 8
  %347 = fsub double %342, %346
  %348 = add nsw i32 11, %i.0
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds double* %srcGrid, i64 %349
  %351 = load double* %350, align 8
  %352 = fadd double %347, %351
  %353 = add nsw i32 12, %i.0
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds double* %srcGrid, i64 %354
  %356 = load double* %355, align 8
  %357 = fsub double %352, %356
  %358 = add nsw i32 13, %i.0
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds double* %srcGrid, i64 %359
  %361 = load double* %360, align 8
  %362 = fadd double %357, %361
  %363 = add nsw i32 14, %i.0
  %364 = sext i32 %363 to i64
  %365 = getelementptr inbounds double* %srcGrid, i64 %364
  %366 = load double* %365, align 8
  %367 = fsub double %362, %366
  %368 = add nsw i32 15, %i.0
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds double* %srcGrid, i64 %369
  %371 = load double* %370, align 8
  %372 = fadd double %367, %371
  %373 = add nsw i32 16, %i.0
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds double* %srcGrid, i64 %374
  %376 = load double* %375, align 8
  %377 = fsub double %372, %376
  %378 = add nsw i32 17, %i.0
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds double* %srcGrid, i64 %379
  %381 = load double* %380, align 8
  %382 = fadd double %377, %381
  %383 = add nsw i32 18, %i.0
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds double* %srcGrid, i64 %384
  %386 = load double* %385, align 8
  %387 = fsub double %382, %386
  %388 = fdiv double %289, %240
  %389 = fdiv double %338, %240
  %390 = fdiv double %387, %240
  %391 = add nsw i32 19, %i.0
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds double* %srcGrid, i64 %392
  %394 = bitcast double* %393 to i8*
  %395 = bitcast i8* %394 to i32*
  %396 = load i32* %395, align 4
  %397 = and i32 %396, 2
  %398 = icmp ne i32 %397, 0
  br i1 %398, label %399, label %400

; <label>:399                                     ; preds = %146
  br label %400

; <label>:400                                     ; preds = %399, %146
  %ux.0 = phi double [ 5.000000e-03, %399 ], [ %388, %146 ]
  %uy.0 = phi double [ 2.000000e-03, %399 ], [ %389, %146 ]
  %uz.0 = phi double [ 0.000000e+00, %399 ], [ %390, %146 ]
  %401 = fmul double %ux.0, %ux.0
  %402 = fmul double %uy.0, %uy.0
  %403 = fadd double %401, %402
  %404 = fmul double %uz.0, %uz.0
  %405 = fadd double %403, %404
  %406 = fmul double 1.500000e+00, %405
  %407 = add nsw i32 0, %i.0
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds double* %srcGrid, i64 %408
  %410 = load double* %409, align 8
  %411 = fmul double -9.500000e-01, %410
  %412 = fmul double 0x3FE4CCCCCCCCCCCC, %240
  %413 = fsub double 1.000000e+00, %406
  %414 = fmul double %412, %413
  %415 = fadd double %411, %414
  %416 = add nsw i32 0, %i.0
  %417 = sext i32 %416 to i64
  %418 = getelementptr inbounds double* %dstGrid, i64 %417
  store double %415, double* %418, align 8
  %419 = add nsw i32 1, %i.0
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds double* %srcGrid, i64 %420
  %422 = load double* %421, align 8
  %423 = fmul double -9.500000e-01, %422
  %424 = fmul double 0x3FBBBBBBBBBBBBBB, %240
  %425 = fmul double 4.500000e+00, %uy.0
  %426 = fadd double %425, 3.000000e+00
  %427 = fmul double %uy.0, %426
  %428 = fadd double 1.000000e+00, %427
  %429 = fsub double %428, %406
  %430 = fmul double %424, %429
  %431 = fadd double %423, %430
  %432 = add nsw i32 2001, %i.0
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds double* %dstGrid, i64 %433
  store double %431, double* %434, align 8
  %435 = add nsw i32 2, %i.0
  %436 = sext i32 %435 to i64
  %437 = getelementptr inbounds double* %srcGrid, i64 %436
  %438 = load double* %437, align 8
  %439 = fmul double -9.500000e-01, %438
  %440 = fmul double 0x3FBBBBBBBBBBBBBB, %240
  %441 = fmul double 4.500000e+00, %uy.0
  %442 = fsub double %441, 3.000000e+00
  %443 = fmul double %uy.0, %442
  %444 = fadd double 1.000000e+00, %443
  %445 = fsub double %444, %406
  %446 = fmul double %440, %445
  %447 = fadd double %439, %446
  %448 = add nsw i32 -1998, %i.0
  %449 = sext i32 %448 to i64
  %450 = getelementptr inbounds double* %dstGrid, i64 %449
  store double %447, double* %450, align 8
  %451 = add nsw i32 3, %i.0
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds double* %srcGrid, i64 %452
  %454 = load double* %453, align 8
  %455 = fmul double -9.500000e-01, %454
  %456 = fmul double 0x3FBBBBBBBBBBBBBB, %240
  %457 = fmul double 4.500000e+00, %ux.0
  %458 = fadd double %457, 3.000000e+00
  %459 = fmul double %ux.0, %458
  %460 = fadd double 1.000000e+00, %459
  %461 = fsub double %460, %406
  %462 = fmul double %456, %461
  %463 = fadd double %455, %462
  %464 = add nsw i32 23, %i.0
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds double* %dstGrid, i64 %465
  store double %463, double* %466, align 8
  %467 = add nsw i32 4, %i.0
  %468 = sext i32 %467 to i64
  %469 = getelementptr inbounds double* %srcGrid, i64 %468
  %470 = load double* %469, align 8
  %471 = fmul double -9.500000e-01, %470
  %472 = fmul double 0x3FBBBBBBBBBBBBBB, %240
  %473 = fmul double 4.500000e+00, %ux.0
  %474 = fsub double %473, 3.000000e+00
  %475 = fmul double %ux.0, %474
  %476 = fadd double 1.000000e+00, %475
  %477 = fsub double %476, %406
  %478 = fmul double %472, %477
  %479 = fadd double %471, %478
  %480 = add nsw i32 -16, %i.0
  %481 = sext i32 %480 to i64
  %482 = getelementptr inbounds double* %dstGrid, i64 %481
  store double %479, double* %482, align 8
  %483 = add nsw i32 5, %i.0
  %484 = sext i32 %483 to i64
  %485 = getelementptr inbounds double* %srcGrid, i64 %484
  %486 = load double* %485, align 8
  %487 = fmul double -9.500000e-01, %486
  %488 = fmul double 0x3FBBBBBBBBBBBBBB, %240
  %489 = fmul double 4.500000e+00, %uz.0
  %490 = fadd double %489, 3.000000e+00
  %491 = fmul double %uz.0, %490
  %492 = fadd double 1.000000e+00, %491
  %493 = fsub double %492, %406
  %494 = fmul double %488, %493
  %495 = fadd double %487, %494
  %496 = add nsw i32 200005, %i.0
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds double* %dstGrid, i64 %497
  store double %495, double* %498, align 8
  %499 = add nsw i32 6, %i.0
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds double* %srcGrid, i64 %500
  %502 = load double* %501, align 8
  %503 = fmul double -9.500000e-01, %502
  %504 = fmul double 0x3FBBBBBBBBBBBBBB, %240
  %505 = fmul double 4.500000e+00, %uz.0
  %506 = fsub double %505, 3.000000e+00
  %507 = fmul double %uz.0, %506
  %508 = fadd double 1.000000e+00, %507
  %509 = fsub double %508, %406
  %510 = fmul double %504, %509
  %511 = fadd double %503, %510
  %512 = add nsw i32 -199994, %i.0
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds double* %dstGrid, i64 %513
  store double %511, double* %514, align 8
  %515 = add nsw i32 7, %i.0
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds double* %srcGrid, i64 %516
  %518 = load double* %517, align 8
  %519 = fmul double -9.500000e-01, %518
  %520 = fmul double 0x3FABBBBBBBBBBBBB, %240
  %521 = fadd double %ux.0, %uy.0
  %522 = fadd double %ux.0, %uy.0
  %523 = fmul double 4.500000e+00, %522
  %524 = fadd double %523, 3.000000e+00
  %525 = fmul double %521, %524
  %526 = fadd double 1.000000e+00, %525
  %527 = fsub double %526, %406
  %528 = fmul double %520, %527
  %529 = fadd double %519, %528
  %530 = add nsw i32 2027, %i.0
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds double* %dstGrid, i64 %531
  store double %529, double* %532, align 8
  %533 = add nsw i32 8, %i.0
  %534 = sext i32 %533 to i64
  %535 = getelementptr inbounds double* %srcGrid, i64 %534
  %536 = load double* %535, align 8
  %537 = fmul double -9.500000e-01, %536
  %538 = fmul double 0x3FABBBBBBBBBBBBB, %240
  %539 = fsub double -0.000000e+00, %ux.0
  %540 = fadd double %539, %uy.0
  %541 = fsub double -0.000000e+00, %ux.0
  %542 = fadd double %541, %uy.0
  %543 = fmul double 4.500000e+00, %542
  %544 = fadd double %543, 3.000000e+00
  %545 = fmul double %540, %544
  %546 = fadd double 1.000000e+00, %545
  %547 = fsub double %546, %406
  %548 = fmul double %538, %547
  %549 = fadd double %537, %548
  %550 = add nsw i32 1988, %i.0
  %551 = sext i32 %550 to i64
  %552 = getelementptr inbounds double* %dstGrid, i64 %551
  store double %549, double* %552, align 8
  %553 = add nsw i32 9, %i.0
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds double* %srcGrid, i64 %554
  %556 = load double* %555, align 8
  %557 = fmul double -9.500000e-01, %556
  %558 = fmul double 0x3FABBBBBBBBBBBBB, %240
  %559 = fsub double %ux.0, %uy.0
  %560 = fsub double %ux.0, %uy.0
  %561 = fmul double 4.500000e+00, %560
  %562 = fadd double %561, 3.000000e+00
  %563 = fmul double %559, %562
  %564 = fadd double 1.000000e+00, %563
  %565 = fsub double %564, %406
  %566 = fmul double %558, %565
  %567 = fadd double %557, %566
  %568 = add nsw i32 -1971, %i.0
  %569 = sext i32 %568 to i64
  %570 = getelementptr inbounds double* %dstGrid, i64 %569
  store double %567, double* %570, align 8
  %571 = add nsw i32 10, %i.0
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds double* %srcGrid, i64 %572
  %574 = load double* %573, align 8
  %575 = fmul double -9.500000e-01, %574
  %576 = fmul double 0x3FABBBBBBBBBBBBB, %240
  %577 = fsub double -0.000000e+00, %ux.0
  %578 = fsub double %577, %uy.0
  %579 = fsub double -0.000000e+00, %ux.0
  %580 = fsub double %579, %uy.0
  %581 = fmul double 4.500000e+00, %580
  %582 = fadd double %581, 3.000000e+00
  %583 = fmul double %578, %582
  %584 = fadd double 1.000000e+00, %583
  %585 = fsub double %584, %406
  %586 = fmul double %576, %585
  %587 = fadd double %575, %586
  %588 = add nsw i32 -2010, %i.0
  %589 = sext i32 %588 to i64
  %590 = getelementptr inbounds double* %dstGrid, i64 %589
  store double %587, double* %590, align 8
  %591 = add nsw i32 11, %i.0
  %592 = sext i32 %591 to i64
  %593 = getelementptr inbounds double* %srcGrid, i64 %592
  %594 = load double* %593, align 8
  %595 = fmul double -9.500000e-01, %594
  %596 = fmul double 0x3FABBBBBBBBBBBBB, %240
  %597 = fadd double %uy.0, %uz.0
  %598 = fadd double %uy.0, %uz.0
  %599 = fmul double 4.500000e+00, %598
  %600 = fadd double %599, 3.000000e+00
  %601 = fmul double %597, %600
  %602 = fadd double 1.000000e+00, %601
  %603 = fsub double %602, %406
  %604 = fmul double %596, %603
  %605 = fadd double %595, %604
  %606 = add nsw i32 202011, %i.0
  %607 = sext i32 %606 to i64
  %608 = getelementptr inbounds double* %dstGrid, i64 %607
  store double %605, double* %608, align 8
  %609 = add nsw i32 12, %i.0
  %610 = sext i32 %609 to i64
  %611 = getelementptr inbounds double* %srcGrid, i64 %610
  %612 = load double* %611, align 8
  %613 = fmul double -9.500000e-01, %612
  %614 = fmul double 0x3FABBBBBBBBBBBBB, %240
  %615 = fsub double %uy.0, %uz.0
  %616 = fsub double %uy.0, %uz.0
  %617 = fmul double 4.500000e+00, %616
  %618 = fadd double %617, 3.000000e+00
  %619 = fmul double %615, %618
  %620 = fadd double 1.000000e+00, %619
  %621 = fsub double %620, %406
  %622 = fmul double %614, %621
  %623 = fadd double %613, %622
  %624 = add nsw i32 -197988, %i.0
  %625 = sext i32 %624 to i64
  %626 = getelementptr inbounds double* %dstGrid, i64 %625
  store double %623, double* %626, align 8
  %627 = add nsw i32 13, %i.0
  %628 = sext i32 %627 to i64
  %629 = getelementptr inbounds double* %srcGrid, i64 %628
  %630 = load double* %629, align 8
  %631 = fmul double -9.500000e-01, %630
  %632 = fmul double 0x3FABBBBBBBBBBBBB, %240
  %633 = fsub double -0.000000e+00, %uy.0
  %634 = fadd double %633, %uz.0
  %635 = fsub double -0.000000e+00, %uy.0
  %636 = fadd double %635, %uz.0
  %637 = fmul double 4.500000e+00, %636
  %638 = fadd double %637, 3.000000e+00
  %639 = fmul double %634, %638
  %640 = fadd double 1.000000e+00, %639
  %641 = fsub double %640, %406
  %642 = fmul double %632, %641
  %643 = fadd double %631, %642
  %644 = add nsw i32 198013, %i.0
  %645 = sext i32 %644 to i64
  %646 = getelementptr inbounds double* %dstGrid, i64 %645
  store double %643, double* %646, align 8
  %647 = add nsw i32 14, %i.0
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds double* %srcGrid, i64 %648
  %650 = load double* %649, align 8
  %651 = fmul double -9.500000e-01, %650
  %652 = fmul double 0x3FABBBBBBBBBBBBB, %240
  %653 = fsub double -0.000000e+00, %uy.0
  %654 = fsub double %653, %uz.0
  %655 = fsub double -0.000000e+00, %uy.0
  %656 = fsub double %655, %uz.0
  %657 = fmul double 4.500000e+00, %656
  %658 = fadd double %657, 3.000000e+00
  %659 = fmul double %654, %658
  %660 = fadd double 1.000000e+00, %659
  %661 = fsub double %660, %406
  %662 = fmul double %652, %661
  %663 = fadd double %651, %662
  %664 = add nsw i32 -201986, %i.0
  %665 = sext i32 %664 to i64
  %666 = getelementptr inbounds double* %dstGrid, i64 %665
  store double %663, double* %666, align 8
  %667 = add nsw i32 15, %i.0
  %668 = sext i32 %667 to i64
  %669 = getelementptr inbounds double* %srcGrid, i64 %668
  %670 = load double* %669, align 8
  %671 = fmul double -9.500000e-01, %670
  %672 = fmul double 0x3FABBBBBBBBBBBBB, %240
  %673 = fadd double %ux.0, %uz.0
  %674 = fadd double %ux.0, %uz.0
  %675 = fmul double 4.500000e+00, %674
  %676 = fadd double %675, 3.000000e+00
  %677 = fmul double %673, %676
  %678 = fadd double 1.000000e+00, %677
  %679 = fsub double %678, %406
  %680 = fmul double %672, %679
  %681 = fadd double %671, %680
  %682 = add nsw i32 200035, %i.0
  %683 = sext i32 %682 to i64
  %684 = getelementptr inbounds double* %dstGrid, i64 %683
  store double %681, double* %684, align 8
  %685 = add nsw i32 16, %i.0
  %686 = sext i32 %685 to i64
  %687 = getelementptr inbounds double* %srcGrid, i64 %686
  %688 = load double* %687, align 8
  %689 = fmul double -9.500000e-01, %688
  %690 = fmul double 0x3FABBBBBBBBBBBBB, %240
  %691 = fsub double %ux.0, %uz.0
  %692 = fsub double %ux.0, %uz.0
  %693 = fmul double 4.500000e+00, %692
  %694 = fadd double %693, 3.000000e+00
  %695 = fmul double %691, %694
  %696 = fadd double 1.000000e+00, %695
  %697 = fsub double %696, %406
  %698 = fmul double %690, %697
  %699 = fadd double %689, %698
  %700 = add nsw i32 -199964, %i.0
  %701 = sext i32 %700 to i64
  %702 = getelementptr inbounds double* %dstGrid, i64 %701
  store double %699, double* %702, align 8
  %703 = add nsw i32 17, %i.0
  %704 = sext i32 %703 to i64
  %705 = getelementptr inbounds double* %srcGrid, i64 %704
  %706 = load double* %705, align 8
  %707 = fmul double -9.500000e-01, %706
  %708 = fmul double 0x3FABBBBBBBBBBBBB, %240
  %709 = fsub double -0.000000e+00, %ux.0
  %710 = fadd double %709, %uz.0
  %711 = fsub double -0.000000e+00, %ux.0
  %712 = fadd double %711, %uz.0
  %713 = fmul double 4.500000e+00, %712
  %714 = fadd double %713, 3.000000e+00
  %715 = fmul double %710, %714
  %716 = fadd double 1.000000e+00, %715
  %717 = fsub double %716, %406
  %718 = fmul double %708, %717
  %719 = fadd double %707, %718
  %720 = add nsw i32 199997, %i.0
  %721 = sext i32 %720 to i64
  %722 = getelementptr inbounds double* %dstGrid, i64 %721
  store double %719, double* %722, align 8
  %723 = add nsw i32 18, %i.0
  %724 = sext i32 %723 to i64
  %725 = getelementptr inbounds double* %srcGrid, i64 %724
  %726 = load double* %725, align 8
  %727 = fmul double -9.500000e-01, %726
  %728 = fmul double 0x3FABBBBBBBBBBBBB, %240
  %729 = fsub double -0.000000e+00, %ux.0
  %730 = fsub double %729, %uz.0
  %731 = fsub double -0.000000e+00, %ux.0
  %732 = fsub double %731, %uz.0
  %733 = fmul double 4.500000e+00, %732
  %734 = fadd double %733, 3.000000e+00
  %735 = fmul double %730, %734
  %736 = fadd double 1.000000e+00, %735
  %737 = fsub double %736, %406
  %738 = fmul double %728, %737
  %739 = fadd double %727, %738
  %740 = add nsw i32 -200002, %i.0
  %741 = sext i32 %740 to i64
  %742 = getelementptr inbounds double* %dstGrid, i64 %741
  store double %739, double* %742, align 8
  br label %743

; <label>:743                                     ; preds = %400, %12
  %744 = add nsw i32 %i.0, 20
  br label %1

; <label>:745                                     ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @LBM_handleInOutFlow(double* %srcGrid) #0 {
  br label %1

; <label>:1                                       ; preds = %439, %0
  %i.0 = phi i32 [ 0, %0 ], [ %440, %439 ]
  %2 = icmp slt i32 %i.0, 200000
  br i1 %2, label %3, label %441

; <label>:3                                       ; preds = %1
  %4 = add nsw i32 200000, %i.0
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds double* %srcGrid, i64 %5
  %7 = load double* %6, align 8
  %8 = add nsw i32 200001, %i.0
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds double* %srcGrid, i64 %9
  %11 = load double* %10, align 8
  %12 = fadd double %7, %11
  %13 = add nsw i32 200002, %i.0
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds double* %srcGrid, i64 %14
  %16 = load double* %15, align 8
  %17 = fadd double %12, %16
  %18 = add nsw i32 200003, %i.0
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds double* %srcGrid, i64 %19
  %21 = load double* %20, align 8
  %22 = fadd double %17, %21
  %23 = add nsw i32 200004, %i.0
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double* %srcGrid, i64 %24
  %26 = load double* %25, align 8
  %27 = fadd double %22, %26
  %28 = add nsw i32 200005, %i.0
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double* %srcGrid, i64 %29
  %31 = load double* %30, align 8
  %32 = fadd double %27, %31
  %33 = add nsw i32 200006, %i.0
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double* %srcGrid, i64 %34
  %36 = load double* %35, align 8
  %37 = fadd double %32, %36
  %38 = add nsw i32 200007, %i.0
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double* %srcGrid, i64 %39
  %41 = load double* %40, align 8
  %42 = fadd double %37, %41
  %43 = add nsw i32 200008, %i.0
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double* %srcGrid, i64 %44
  %46 = load double* %45, align 8
  %47 = fadd double %42, %46
  %48 = add nsw i32 200009, %i.0
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds double* %srcGrid, i64 %49
  %51 = load double* %50, align 8
  %52 = fadd double %47, %51
  %53 = add nsw i32 200010, %i.0
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double* %srcGrid, i64 %54
  %56 = load double* %55, align 8
  %57 = fadd double %52, %56
  %58 = add nsw i32 200011, %i.0
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double* %srcGrid, i64 %59
  %61 = load double* %60, align 8
  %62 = fadd double %57, %61
  %63 = add nsw i32 200012, %i.0
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double* %srcGrid, i64 %64
  %66 = load double* %65, align 8
  %67 = fadd double %62, %66
  %68 = add nsw i32 200013, %i.0
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double* %srcGrid, i64 %69
  %71 = load double* %70, align 8
  %72 = fadd double %67, %71
  %73 = add nsw i32 200014, %i.0
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double* %srcGrid, i64 %74
  %76 = load double* %75, align 8
  %77 = fadd double %72, %76
  %78 = add nsw i32 200015, %i.0
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double* %srcGrid, i64 %79
  %81 = load double* %80, align 8
  %82 = fadd double %77, %81
  %83 = add nsw i32 200016, %i.0
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double* %srcGrid, i64 %84
  %86 = load double* %85, align 8
  %87 = fadd double %82, %86
  %88 = add nsw i32 200017, %i.0
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds double* %srcGrid, i64 %89
  %91 = load double* %90, align 8
  %92 = fadd double %87, %91
  %93 = add nsw i32 200018, %i.0
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds double* %srcGrid, i64 %94
  %96 = load double* %95, align 8
  %97 = fadd double %92, %96
  %98 = add nsw i32 400000, %i.0
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double* %srcGrid, i64 %99
  %101 = load double* %100, align 8
  %102 = add nsw i32 400001, %i.0
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds double* %srcGrid, i64 %103
  %105 = load double* %104, align 8
  %106 = fadd double %101, %105
  %107 = add nsw i32 400002, %i.0
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds double* %srcGrid, i64 %108
  %110 = load double* %109, align 8
  %111 = fadd double %106, %110
  %112 = add nsw i32 400003, %i.0
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds double* %srcGrid, i64 %113
  %115 = load double* %114, align 8
  %116 = fadd double %111, %115
  %117 = add nsw i32 400004, %i.0
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double* %srcGrid, i64 %118
  %120 = load double* %119, align 8
  %121 = fadd double %116, %120
  %122 = add nsw i32 400005, %i.0
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double* %srcGrid, i64 %123
  %125 = load double* %124, align 8
  %126 = fadd double %121, %125
  %127 = add nsw i32 400006, %i.0
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds double* %srcGrid, i64 %128
  %130 = load double* %129, align 8
  %131 = fadd double %126, %130
  %132 = add nsw i32 400007, %i.0
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds double* %srcGrid, i64 %133
  %135 = load double* %134, align 8
  %136 = fadd double %131, %135
  %137 = add nsw i32 400008, %i.0
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds double* %srcGrid, i64 %138
  %140 = load double* %139, align 8
  %141 = fadd double %136, %140
  %142 = add nsw i32 400009, %i.0
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds double* %srcGrid, i64 %143
  %145 = load double* %144, align 8
  %146 = fadd double %141, %145
  %147 = add nsw i32 400010, %i.0
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds double* %srcGrid, i64 %148
  %150 = load double* %149, align 8
  %151 = fadd double %146, %150
  %152 = add nsw i32 400011, %i.0
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds double* %srcGrid, i64 %153
  %155 = load double* %154, align 8
  %156 = fadd double %151, %155
  %157 = add nsw i32 400012, %i.0
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds double* %srcGrid, i64 %158
  %160 = load double* %159, align 8
  %161 = fadd double %156, %160
  %162 = add nsw i32 400013, %i.0
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds double* %srcGrid, i64 %163
  %165 = load double* %164, align 8
  %166 = fadd double %161, %165
  %167 = add nsw i32 400014, %i.0
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds double* %srcGrid, i64 %168
  %170 = load double* %169, align 8
  %171 = fadd double %166, %170
  %172 = add nsw i32 400015, %i.0
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds double* %srcGrid, i64 %173
  %175 = load double* %174, align 8
  %176 = fadd double %171, %175
  %177 = add nsw i32 400016, %i.0
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds double* %srcGrid, i64 %178
  %180 = load double* %179, align 8
  %181 = fadd double %176, %180
  %182 = add nsw i32 400017, %i.0
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds double* %srcGrid, i64 %183
  %185 = load double* %184, align 8
  %186 = fadd double %181, %185
  %187 = add nsw i32 400018, %i.0
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds double* %srcGrid, i64 %188
  %190 = load double* %189, align 8
  %191 = fadd double %186, %190
  %192 = fmul double 2.000000e+00, %97
  %193 = fsub double %192, %191
  %194 = sdiv i32 %i.0, 20
  %195 = srem i32 %194, 100
  %196 = sitofp i32 %195 to double
  %197 = fdiv double %196, 4.950000e+01
  %198 = fsub double %197, 1.000000e+00
  %199 = sdiv i32 %i.0, 20
  %200 = sdiv i32 %199, 100
  %201 = srem i32 %200, 100
  %202 = sitofp i32 %201 to double
  %203 = fdiv double %202, 4.950000e+01
  %204 = fsub double %203, 1.000000e+00
  %205 = fmul double %198, %198
  %206 = fsub double 1.000000e+00, %205
  %207 = fmul double 1.000000e-02, %206
  %208 = fmul double %204, %204
  %209 = fsub double 1.000000e+00, %208
  %210 = fmul double %207, %209
  %211 = fmul double 0.000000e+00, 0.000000e+00
  %212 = fmul double 0.000000e+00, 0.000000e+00
  %213 = fadd double %211, %212
  %214 = fmul double %210, %210
  %215 = fadd double %213, %214
  %216 = fmul double 1.500000e+00, %215
  %217 = fmul double 0x3FD5555555555555, %193
  %218 = fsub double 1.000000e+00, %216
  %219 = fmul double %217, %218
  %220 = add nsw i32 0, %i.0
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds double* %srcGrid, i64 %221
  store double %219, double* %222, align 8
  %223 = fmul double 0x3FAC71C71C71C71C, %193
  %224 = fmul double 4.500000e+00, 0.000000e+00
  %225 = fadd double %224, 3.000000e+00
  %226 = fmul double 0.000000e+00, %225
  %227 = fadd double 1.000000e+00, %226
  %228 = fsub double %227, %216
  %229 = fmul double %223, %228
  %230 = add nsw i32 1, %i.0
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds double* %srcGrid, i64 %231
  store double %229, double* %232, align 8
  %233 = fmul double 0x3FAC71C71C71C71C, %193
  %234 = fmul double 4.500000e+00, 0.000000e+00
  %235 = fsub double %234, 3.000000e+00
  %236 = fmul double 0.000000e+00, %235
  %237 = fadd double 1.000000e+00, %236
  %238 = fsub double %237, %216
  %239 = fmul double %233, %238
  %240 = add nsw i32 2, %i.0
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds double* %srcGrid, i64 %241
  store double %239, double* %242, align 8
  %243 = fmul double 0x3FAC71C71C71C71C, %193
  %244 = fmul double 4.500000e+00, 0.000000e+00
  %245 = fadd double %244, 3.000000e+00
  %246 = fmul double 0.000000e+00, %245
  %247 = fadd double 1.000000e+00, %246
  %248 = fsub double %247, %216
  %249 = fmul double %243, %248
  %250 = add nsw i32 3, %i.0
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds double* %srcGrid, i64 %251
  store double %249, double* %252, align 8
  %253 = fmul double 0x3FAC71C71C71C71C, %193
  %254 = fmul double 4.500000e+00, 0.000000e+00
  %255 = fsub double %254, 3.000000e+00
  %256 = fmul double 0.000000e+00, %255
  %257 = fadd double 1.000000e+00, %256
  %258 = fsub double %257, %216
  %259 = fmul double %253, %258
  %260 = add nsw i32 4, %i.0
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds double* %srcGrid, i64 %261
  store double %259, double* %262, align 8
  %263 = fmul double 0x3FAC71C71C71C71C, %193
  %264 = fmul double 4.500000e+00, %210
  %265 = fadd double %264, 3.000000e+00
  %266 = fmul double %210, %265
  %267 = fadd double 1.000000e+00, %266
  %268 = fsub double %267, %216
  %269 = fmul double %263, %268
  %270 = add nsw i32 5, %i.0
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds double* %srcGrid, i64 %271
  store double %269, double* %272, align 8
  %273 = fmul double 0x3FAC71C71C71C71C, %193
  %274 = fmul double 4.500000e+00, %210
  %275 = fsub double %274, 3.000000e+00
  %276 = fmul double %210, %275
  %277 = fadd double 1.000000e+00, %276
  %278 = fsub double %277, %216
  %279 = fmul double %273, %278
  %280 = add nsw i32 6, %i.0
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds double* %srcGrid, i64 %281
  store double %279, double* %282, align 8
  %283 = fmul double 0x3F9C71C71C71C71C, %193
  %284 = fadd double 0.000000e+00, 0.000000e+00
  %285 = fadd double 0.000000e+00, 0.000000e+00
  %286 = fmul double 4.500000e+00, %285
  %287 = fadd double %286, 3.000000e+00
  %288 = fmul double %284, %287
  %289 = fadd double 1.000000e+00, %288
  %290 = fsub double %289, %216
  %291 = fmul double %283, %290
  %292 = add nsw i32 7, %i.0
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds double* %srcGrid, i64 %293
  store double %291, double* %294, align 8
  %295 = fmul double 0x3F9C71C71C71C71C, %193
  %296 = fsub double -0.000000e+00, 0.000000e+00
  %297 = fadd double %296, 0.000000e+00
  %298 = fsub double -0.000000e+00, 0.000000e+00
  %299 = fadd double %298, 0.000000e+00
  %300 = fmul double 4.500000e+00, %299
  %301 = fadd double %300, 3.000000e+00
  %302 = fmul double %297, %301
  %303 = fadd double 1.000000e+00, %302
  %304 = fsub double %303, %216
  %305 = fmul double %295, %304
  %306 = add nsw i32 8, %i.0
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds double* %srcGrid, i64 %307
  store double %305, double* %308, align 8
  %309 = fmul double 0x3F9C71C71C71C71C, %193
  %310 = fsub double 0.000000e+00, 0.000000e+00
  %311 = fsub double 0.000000e+00, 0.000000e+00
  %312 = fmul double 4.500000e+00, %311
  %313 = fadd double %312, 3.000000e+00
  %314 = fmul double %310, %313
  %315 = fadd double 1.000000e+00, %314
  %316 = fsub double %315, %216
  %317 = fmul double %309, %316
  %318 = add nsw i32 9, %i.0
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds double* %srcGrid, i64 %319
  store double %317, double* %320, align 8
  %321 = fmul double 0x3F9C71C71C71C71C, %193
  %322 = fsub double -0.000000e+00, 0.000000e+00
  %323 = fsub double %322, 0.000000e+00
  %324 = fsub double -0.000000e+00, 0.000000e+00
  %325 = fsub double %324, 0.000000e+00
  %326 = fmul double 4.500000e+00, %325
  %327 = fadd double %326, 3.000000e+00
  %328 = fmul double %323, %327
  %329 = fadd double 1.000000e+00, %328
  %330 = fsub double %329, %216
  %331 = fmul double %321, %330
  %332 = add nsw i32 10, %i.0
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds double* %srcGrid, i64 %333
  store double %331, double* %334, align 8
  %335 = fmul double 0x3F9C71C71C71C71C, %193
  %336 = fadd double 0.000000e+00, %210
  %337 = fadd double 0.000000e+00, %210
  %338 = fmul double 4.500000e+00, %337
  %339 = fadd double %338, 3.000000e+00
  %340 = fmul double %336, %339
  %341 = fadd double 1.000000e+00, %340
  %342 = fsub double %341, %216
  %343 = fmul double %335, %342
  %344 = add nsw i32 11, %i.0
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds double* %srcGrid, i64 %345
  store double %343, double* %346, align 8
  %347 = fmul double 0x3F9C71C71C71C71C, %193
  %348 = fsub double 0.000000e+00, %210
  %349 = fsub double 0.000000e+00, %210
  %350 = fmul double 4.500000e+00, %349
  %351 = fadd double %350, 3.000000e+00
  %352 = fmul double %348, %351
  %353 = fadd double 1.000000e+00, %352
  %354 = fsub double %353, %216
  %355 = fmul double %347, %354
  %356 = add nsw i32 12, %i.0
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds double* %srcGrid, i64 %357
  store double %355, double* %358, align 8
  %359 = fmul double 0x3F9C71C71C71C71C, %193
  %360 = fsub double -0.000000e+00, 0.000000e+00
  %361 = fadd double %360, %210
  %362 = fsub double -0.000000e+00, 0.000000e+00
  %363 = fadd double %362, %210
  %364 = fmul double 4.500000e+00, %363
  %365 = fadd double %364, 3.000000e+00
  %366 = fmul double %361, %365
  %367 = fadd double 1.000000e+00, %366
  %368 = fsub double %367, %216
  %369 = fmul double %359, %368
  %370 = add nsw i32 13, %i.0
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds double* %srcGrid, i64 %371
  store double %369, double* %372, align 8
  %373 = fmul double 0x3F9C71C71C71C71C, %193
  %374 = fsub double -0.000000e+00, 0.000000e+00
  %375 = fsub double %374, %210
  %376 = fsub double -0.000000e+00, 0.000000e+00
  %377 = fsub double %376, %210
  %378 = fmul double 4.500000e+00, %377
  %379 = fadd double %378, 3.000000e+00
  %380 = fmul double %375, %379
  %381 = fadd double 1.000000e+00, %380
  %382 = fsub double %381, %216
  %383 = fmul double %373, %382
  %384 = add nsw i32 14, %i.0
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds double* %srcGrid, i64 %385
  store double %383, double* %386, align 8
  %387 = fmul double 0x3F9C71C71C71C71C, %193
  %388 = fadd double 0.000000e+00, %210
  %389 = fadd double 0.000000e+00, %210
  %390 = fmul double 4.500000e+00, %389
  %391 = fadd double %390, 3.000000e+00
  %392 = fmul double %388, %391
  %393 = fadd double 1.000000e+00, %392
  %394 = fsub double %393, %216
  %395 = fmul double %387, %394
  %396 = add nsw i32 15, %i.0
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds double* %srcGrid, i64 %397
  store double %395, double* %398, align 8
  %399 = fmul double 0x3F9C71C71C71C71C, %193
  %400 = fsub double 0.000000e+00, %210
  %401 = fsub double 0.000000e+00, %210
  %402 = fmul double 4.500000e+00, %401
  %403 = fadd double %402, 3.000000e+00
  %404 = fmul double %400, %403
  %405 = fadd double 1.000000e+00, %404
  %406 = fsub double %405, %216
  %407 = fmul double %399, %406
  %408 = add nsw i32 16, %i.0
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds double* %srcGrid, i64 %409
  store double %407, double* %410, align 8
  %411 = fmul double 0x3F9C71C71C71C71C, %193
  %412 = fsub double -0.000000e+00, 0.000000e+00
  %413 = fadd double %412, %210
  %414 = fsub double -0.000000e+00, 0.000000e+00
  %415 = fadd double %414, %210
  %416 = fmul double 4.500000e+00, %415
  %417 = fadd double %416, 3.000000e+00
  %418 = fmul double %413, %417
  %419 = fadd double 1.000000e+00, %418
  %420 = fsub double %419, %216
  %421 = fmul double %411, %420
  %422 = add nsw i32 17, %i.0
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds double* %srcGrid, i64 %423
  store double %421, double* %424, align 8
  %425 = fmul double 0x3F9C71C71C71C71C, %193
  %426 = fsub double -0.000000e+00, 0.000000e+00
  %427 = fsub double %426, %210
  %428 = fsub double -0.000000e+00, 0.000000e+00
  %429 = fsub double %428, %210
  %430 = fmul double 4.500000e+00, %429
  %431 = fadd double %430, 3.000000e+00
  %432 = fmul double %427, %431
  %433 = fadd double 1.000000e+00, %432
  %434 = fsub double %433, %216
  %435 = fmul double %425, %434
  %436 = add nsw i32 18, %i.0
  %437 = sext i32 %436 to i64
  %438 = getelementptr inbounds double* %srcGrid, i64 %437
  store double %435, double* %438, align 8
  br label %439

; <label>:439                                     ; preds = %3
  %440 = add nsw i32 %i.0, 20
  br label %1

; <label>:441                                     ; preds = %1
  br label %442

; <label>:442                                     ; preds = %1167, %441
  %i.1 = phi i32 [ 25800000, %441 ], [ %1168, %1167 ]
  %443 = icmp slt i32 %i.1, 26000000
  br i1 %443, label %444, label %1169

; <label>:444                                     ; preds = %442
  %445 = add nsw i32 -200000, %i.1
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds double* %srcGrid, i64 %446
  %448 = load double* %447, align 8
  %449 = add nsw i32 -199999, %i.1
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds double* %srcGrid, i64 %450
  %452 = load double* %451, align 8
  %453 = fadd double %448, %452
  %454 = add nsw i32 -199998, %i.1
  %455 = sext i32 %454 to i64
  %456 = getelementptr inbounds double* %srcGrid, i64 %455
  %457 = load double* %456, align 8
  %458 = fadd double %453, %457
  %459 = add nsw i32 -199997, %i.1
  %460 = sext i32 %459 to i64
  %461 = getelementptr inbounds double* %srcGrid, i64 %460
  %462 = load double* %461, align 8
  %463 = fadd double %458, %462
  %464 = add nsw i32 -199996, %i.1
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds double* %srcGrid, i64 %465
  %467 = load double* %466, align 8
  %468 = fadd double %463, %467
  %469 = add nsw i32 -199995, %i.1
  %470 = sext i32 %469 to i64
  %471 = getelementptr inbounds double* %srcGrid, i64 %470
  %472 = load double* %471, align 8
  %473 = fadd double %468, %472
  %474 = add nsw i32 -199994, %i.1
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds double* %srcGrid, i64 %475
  %477 = load double* %476, align 8
  %478 = fadd double %473, %477
  %479 = add nsw i32 -199993, %i.1
  %480 = sext i32 %479 to i64
  %481 = getelementptr inbounds double* %srcGrid, i64 %480
  %482 = load double* %481, align 8
  %483 = fadd double %478, %482
  %484 = add nsw i32 -199992, %i.1
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds double* %srcGrid, i64 %485
  %487 = load double* %486, align 8
  %488 = fadd double %483, %487
  %489 = add nsw i32 -199991, %i.1
  %490 = sext i32 %489 to i64
  %491 = getelementptr inbounds double* %srcGrid, i64 %490
  %492 = load double* %491, align 8
  %493 = fadd double %488, %492
  %494 = add nsw i32 -199990, %i.1
  %495 = sext i32 %494 to i64
  %496 = getelementptr inbounds double* %srcGrid, i64 %495
  %497 = load double* %496, align 8
  %498 = fadd double %493, %497
  %499 = add nsw i32 -199989, %i.1
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds double* %srcGrid, i64 %500
  %502 = load double* %501, align 8
  %503 = fadd double %498, %502
  %504 = add nsw i32 -199988, %i.1
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds double* %srcGrid, i64 %505
  %507 = load double* %506, align 8
  %508 = fadd double %503, %507
  %509 = add nsw i32 -199987, %i.1
  %510 = sext i32 %509 to i64
  %511 = getelementptr inbounds double* %srcGrid, i64 %510
  %512 = load double* %511, align 8
  %513 = fadd double %508, %512
  %514 = add nsw i32 -199986, %i.1
  %515 = sext i32 %514 to i64
  %516 = getelementptr inbounds double* %srcGrid, i64 %515
  %517 = load double* %516, align 8
  %518 = fadd double %513, %517
  %519 = add nsw i32 -199985, %i.1
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds double* %srcGrid, i64 %520
  %522 = load double* %521, align 8
  %523 = fadd double %518, %522
  %524 = add nsw i32 -199984, %i.1
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds double* %srcGrid, i64 %525
  %527 = load double* %526, align 8
  %528 = fadd double %523, %527
  %529 = add nsw i32 -199983, %i.1
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds double* %srcGrid, i64 %530
  %532 = load double* %531, align 8
  %533 = fadd double %528, %532
  %534 = add nsw i32 -199982, %i.1
  %535 = sext i32 %534 to i64
  %536 = getelementptr inbounds double* %srcGrid, i64 %535
  %537 = load double* %536, align 8
  %538 = fadd double %533, %537
  %539 = add nsw i32 -199997, %i.1
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds double* %srcGrid, i64 %540
  %542 = load double* %541, align 8
  %543 = add nsw i32 -199996, %i.1
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds double* %srcGrid, i64 %544
  %546 = load double* %545, align 8
  %547 = fsub double %542, %546
  %548 = add nsw i32 -199993, %i.1
  %549 = sext i32 %548 to i64
  %550 = getelementptr inbounds double* %srcGrid, i64 %549
  %551 = load double* %550, align 8
  %552 = fadd double %547, %551
  %553 = add nsw i32 -199992, %i.1
  %554 = sext i32 %553 to i64
  %555 = getelementptr inbounds double* %srcGrid, i64 %554
  %556 = load double* %555, align 8
  %557 = fsub double %552, %556
  %558 = add nsw i32 -199991, %i.1
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds double* %srcGrid, i64 %559
  %561 = load double* %560, align 8
  %562 = fadd double %557, %561
  %563 = add nsw i32 -199990, %i.1
  %564 = sext i32 %563 to i64
  %565 = getelementptr inbounds double* %srcGrid, i64 %564
  %566 = load double* %565, align 8
  %567 = fsub double %562, %566
  %568 = add nsw i32 -199985, %i.1
  %569 = sext i32 %568 to i64
  %570 = getelementptr inbounds double* %srcGrid, i64 %569
  %571 = load double* %570, align 8
  %572 = fadd double %567, %571
  %573 = add nsw i32 -199984, %i.1
  %574 = sext i32 %573 to i64
  %575 = getelementptr inbounds double* %srcGrid, i64 %574
  %576 = load double* %575, align 8
  %577 = fadd double %572, %576
  %578 = add nsw i32 -199983, %i.1
  %579 = sext i32 %578 to i64
  %580 = getelementptr inbounds double* %srcGrid, i64 %579
  %581 = load double* %580, align 8
  %582 = fsub double %577, %581
  %583 = add nsw i32 -199982, %i.1
  %584 = sext i32 %583 to i64
  %585 = getelementptr inbounds double* %srcGrid, i64 %584
  %586 = load double* %585, align 8
  %587 = fsub double %582, %586
  %588 = add nsw i32 -199999, %i.1
  %589 = sext i32 %588 to i64
  %590 = getelementptr inbounds double* %srcGrid, i64 %589
  %591 = load double* %590, align 8
  %592 = add nsw i32 -199998, %i.1
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds double* %srcGrid, i64 %593
  %595 = load double* %594, align 8
  %596 = fsub double %591, %595
  %597 = add nsw i32 -199993, %i.1
  %598 = sext i32 %597 to i64
  %599 = getelementptr inbounds double* %srcGrid, i64 %598
  %600 = load double* %599, align 8
  %601 = fadd double %596, %600
  %602 = add nsw i32 -199992, %i.1
  %603 = sext i32 %602 to i64
  %604 = getelementptr inbounds double* %srcGrid, i64 %603
  %605 = load double* %604, align 8
  %606 = fadd double %601, %605
  %607 = add nsw i32 -199991, %i.1
  %608 = sext i32 %607 to i64
  %609 = getelementptr inbounds double* %srcGrid, i64 %608
  %610 = load double* %609, align 8
  %611 = fsub double %606, %610
  %612 = add nsw i32 -199990, %i.1
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds double* %srcGrid, i64 %613
  %615 = load double* %614, align 8
  %616 = fsub double %611, %615
  %617 = add nsw i32 -199989, %i.1
  %618 = sext i32 %617 to i64
  %619 = getelementptr inbounds double* %srcGrid, i64 %618
  %620 = load double* %619, align 8
  %621 = fadd double %616, %620
  %622 = add nsw i32 -199988, %i.1
  %623 = sext i32 %622 to i64
  %624 = getelementptr inbounds double* %srcGrid, i64 %623
  %625 = load double* %624, align 8
  %626 = fadd double %621, %625
  %627 = add nsw i32 -199987, %i.1
  %628 = sext i32 %627 to i64
  %629 = getelementptr inbounds double* %srcGrid, i64 %628
  %630 = load double* %629, align 8
  %631 = fsub double %626, %630
  %632 = add nsw i32 -199986, %i.1
  %633 = sext i32 %632 to i64
  %634 = getelementptr inbounds double* %srcGrid, i64 %633
  %635 = load double* %634, align 8
  %636 = fsub double %631, %635
  %637 = add nsw i32 -199995, %i.1
  %638 = sext i32 %637 to i64
  %639 = getelementptr inbounds double* %srcGrid, i64 %638
  %640 = load double* %639, align 8
  %641 = add nsw i32 -199994, %i.1
  %642 = sext i32 %641 to i64
  %643 = getelementptr inbounds double* %srcGrid, i64 %642
  %644 = load double* %643, align 8
  %645 = fsub double %640, %644
  %646 = add nsw i32 -199989, %i.1
  %647 = sext i32 %646 to i64
  %648 = getelementptr inbounds double* %srcGrid, i64 %647
  %649 = load double* %648, align 8
  %650 = fadd double %645, %649
  %651 = add nsw i32 -199988, %i.1
  %652 = sext i32 %651 to i64
  %653 = getelementptr inbounds double* %srcGrid, i64 %652
  %654 = load double* %653, align 8
  %655 = fsub double %650, %654
  %656 = add nsw i32 -199987, %i.1
  %657 = sext i32 %656 to i64
  %658 = getelementptr inbounds double* %srcGrid, i64 %657
  %659 = load double* %658, align 8
  %660 = fadd double %655, %659
  %661 = add nsw i32 -199986, %i.1
  %662 = sext i32 %661 to i64
  %663 = getelementptr inbounds double* %srcGrid, i64 %662
  %664 = load double* %663, align 8
  %665 = fsub double %660, %664
  %666 = add nsw i32 -199985, %i.1
  %667 = sext i32 %666 to i64
  %668 = getelementptr inbounds double* %srcGrid, i64 %667
  %669 = load double* %668, align 8
  %670 = fadd double %665, %669
  %671 = add nsw i32 -199984, %i.1
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds double* %srcGrid, i64 %672
  %674 = load double* %673, align 8
  %675 = fsub double %670, %674
  %676 = add nsw i32 -199983, %i.1
  %677 = sext i32 %676 to i64
  %678 = getelementptr inbounds double* %srcGrid, i64 %677
  %679 = load double* %678, align 8
  %680 = fadd double %675, %679
  %681 = add nsw i32 -199982, %i.1
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds double* %srcGrid, i64 %682
  %684 = load double* %683, align 8
  %685 = fsub double %680, %684
  %686 = fdiv double %587, %538
  %687 = fdiv double %636, %538
  %688 = fdiv double %685, %538
  %689 = add nsw i32 -400000, %i.1
  %690 = sext i32 %689 to i64
  %691 = getelementptr inbounds double* %srcGrid, i64 %690
  %692 = load double* %691, align 8
  %693 = add nsw i32 -399999, %i.1
  %694 = sext i32 %693 to i64
  %695 = getelementptr inbounds double* %srcGrid, i64 %694
  %696 = load double* %695, align 8
  %697 = fadd double %692, %696
  %698 = add nsw i32 -399998, %i.1
  %699 = sext i32 %698 to i64
  %700 = getelementptr inbounds double* %srcGrid, i64 %699
  %701 = load double* %700, align 8
  %702 = fadd double %697, %701
  %703 = add nsw i32 -399997, %i.1
  %704 = sext i32 %703 to i64
  %705 = getelementptr inbounds double* %srcGrid, i64 %704
  %706 = load double* %705, align 8
  %707 = fadd double %702, %706
  %708 = add nsw i32 -399996, %i.1
  %709 = sext i32 %708 to i64
  %710 = getelementptr inbounds double* %srcGrid, i64 %709
  %711 = load double* %710, align 8
  %712 = fadd double %707, %711
  %713 = add nsw i32 -399995, %i.1
  %714 = sext i32 %713 to i64
  %715 = getelementptr inbounds double* %srcGrid, i64 %714
  %716 = load double* %715, align 8
  %717 = fadd double %712, %716
  %718 = add nsw i32 -399994, %i.1
  %719 = sext i32 %718 to i64
  %720 = getelementptr inbounds double* %srcGrid, i64 %719
  %721 = load double* %720, align 8
  %722 = fadd double %717, %721
  %723 = add nsw i32 -399993, %i.1
  %724 = sext i32 %723 to i64
  %725 = getelementptr inbounds double* %srcGrid, i64 %724
  %726 = load double* %725, align 8
  %727 = fadd double %722, %726
  %728 = add nsw i32 -399992, %i.1
  %729 = sext i32 %728 to i64
  %730 = getelementptr inbounds double* %srcGrid, i64 %729
  %731 = load double* %730, align 8
  %732 = fadd double %727, %731
  %733 = add nsw i32 -399991, %i.1
  %734 = sext i32 %733 to i64
  %735 = getelementptr inbounds double* %srcGrid, i64 %734
  %736 = load double* %735, align 8
  %737 = fadd double %732, %736
  %738 = add nsw i32 -399990, %i.1
  %739 = sext i32 %738 to i64
  %740 = getelementptr inbounds double* %srcGrid, i64 %739
  %741 = load double* %740, align 8
  %742 = fadd double %737, %741
  %743 = add nsw i32 -399989, %i.1
  %744 = sext i32 %743 to i64
  %745 = getelementptr inbounds double* %srcGrid, i64 %744
  %746 = load double* %745, align 8
  %747 = fadd double %742, %746
  %748 = add nsw i32 -399988, %i.1
  %749 = sext i32 %748 to i64
  %750 = getelementptr inbounds double* %srcGrid, i64 %749
  %751 = load double* %750, align 8
  %752 = fadd double %747, %751
  %753 = add nsw i32 -399987, %i.1
  %754 = sext i32 %753 to i64
  %755 = getelementptr inbounds double* %srcGrid, i64 %754
  %756 = load double* %755, align 8
  %757 = fadd double %752, %756
  %758 = add nsw i32 -399986, %i.1
  %759 = sext i32 %758 to i64
  %760 = getelementptr inbounds double* %srcGrid, i64 %759
  %761 = load double* %760, align 8
  %762 = fadd double %757, %761
  %763 = add nsw i32 -399985, %i.1
  %764 = sext i32 %763 to i64
  %765 = getelementptr inbounds double* %srcGrid, i64 %764
  %766 = load double* %765, align 8
  %767 = fadd double %762, %766
  %768 = add nsw i32 -399984, %i.1
  %769 = sext i32 %768 to i64
  %770 = getelementptr inbounds double* %srcGrid, i64 %769
  %771 = load double* %770, align 8
  %772 = fadd double %767, %771
  %773 = add nsw i32 -399983, %i.1
  %774 = sext i32 %773 to i64
  %775 = getelementptr inbounds double* %srcGrid, i64 %774
  %776 = load double* %775, align 8
  %777 = fadd double %772, %776
  %778 = add nsw i32 -399982, %i.1
  %779 = sext i32 %778 to i64
  %780 = getelementptr inbounds double* %srcGrid, i64 %779
  %781 = load double* %780, align 8
  %782 = fadd double %777, %781
  %783 = add nsw i32 -399997, %i.1
  %784 = sext i32 %783 to i64
  %785 = getelementptr inbounds double* %srcGrid, i64 %784
  %786 = load double* %785, align 8
  %787 = add nsw i32 -399996, %i.1
  %788 = sext i32 %787 to i64
  %789 = getelementptr inbounds double* %srcGrid, i64 %788
  %790 = load double* %789, align 8
  %791 = fsub double %786, %790
  %792 = add nsw i32 -399993, %i.1
  %793 = sext i32 %792 to i64
  %794 = getelementptr inbounds double* %srcGrid, i64 %793
  %795 = load double* %794, align 8
  %796 = fadd double %791, %795
  %797 = add nsw i32 -399992, %i.1
  %798 = sext i32 %797 to i64
  %799 = getelementptr inbounds double* %srcGrid, i64 %798
  %800 = load double* %799, align 8
  %801 = fsub double %796, %800
  %802 = add nsw i32 -399991, %i.1
  %803 = sext i32 %802 to i64
  %804 = getelementptr inbounds double* %srcGrid, i64 %803
  %805 = load double* %804, align 8
  %806 = fadd double %801, %805
  %807 = add nsw i32 -399990, %i.1
  %808 = sext i32 %807 to i64
  %809 = getelementptr inbounds double* %srcGrid, i64 %808
  %810 = load double* %809, align 8
  %811 = fsub double %806, %810
  %812 = add nsw i32 -399985, %i.1
  %813 = sext i32 %812 to i64
  %814 = getelementptr inbounds double* %srcGrid, i64 %813
  %815 = load double* %814, align 8
  %816 = fadd double %811, %815
  %817 = add nsw i32 -399984, %i.1
  %818 = sext i32 %817 to i64
  %819 = getelementptr inbounds double* %srcGrid, i64 %818
  %820 = load double* %819, align 8
  %821 = fadd double %816, %820
  %822 = add nsw i32 -399983, %i.1
  %823 = sext i32 %822 to i64
  %824 = getelementptr inbounds double* %srcGrid, i64 %823
  %825 = load double* %824, align 8
  %826 = fsub double %821, %825
  %827 = add nsw i32 -399982, %i.1
  %828 = sext i32 %827 to i64
  %829 = getelementptr inbounds double* %srcGrid, i64 %828
  %830 = load double* %829, align 8
  %831 = fsub double %826, %830
  %832 = add nsw i32 -399999, %i.1
  %833 = sext i32 %832 to i64
  %834 = getelementptr inbounds double* %srcGrid, i64 %833
  %835 = load double* %834, align 8
  %836 = add nsw i32 -399998, %i.1
  %837 = sext i32 %836 to i64
  %838 = getelementptr inbounds double* %srcGrid, i64 %837
  %839 = load double* %838, align 8
  %840 = fsub double %835, %839
  %841 = add nsw i32 -399993, %i.1
  %842 = sext i32 %841 to i64
  %843 = getelementptr inbounds double* %srcGrid, i64 %842
  %844 = load double* %843, align 8
  %845 = fadd double %840, %844
  %846 = add nsw i32 -399992, %i.1
  %847 = sext i32 %846 to i64
  %848 = getelementptr inbounds double* %srcGrid, i64 %847
  %849 = load double* %848, align 8
  %850 = fadd double %845, %849
  %851 = add nsw i32 -399991, %i.1
  %852 = sext i32 %851 to i64
  %853 = getelementptr inbounds double* %srcGrid, i64 %852
  %854 = load double* %853, align 8
  %855 = fsub double %850, %854
  %856 = add nsw i32 -399990, %i.1
  %857 = sext i32 %856 to i64
  %858 = getelementptr inbounds double* %srcGrid, i64 %857
  %859 = load double* %858, align 8
  %860 = fsub double %855, %859
  %861 = add nsw i32 -399989, %i.1
  %862 = sext i32 %861 to i64
  %863 = getelementptr inbounds double* %srcGrid, i64 %862
  %864 = load double* %863, align 8
  %865 = fadd double %860, %864
  %866 = add nsw i32 -399988, %i.1
  %867 = sext i32 %866 to i64
  %868 = getelementptr inbounds double* %srcGrid, i64 %867
  %869 = load double* %868, align 8
  %870 = fadd double %865, %869
  %871 = add nsw i32 -399987, %i.1
  %872 = sext i32 %871 to i64
  %873 = getelementptr inbounds double* %srcGrid, i64 %872
  %874 = load double* %873, align 8
  %875 = fsub double %870, %874
  %876 = add nsw i32 -399986, %i.1
  %877 = sext i32 %876 to i64
  %878 = getelementptr inbounds double* %srcGrid, i64 %877
  %879 = load double* %878, align 8
  %880 = fsub double %875, %879
  %881 = add nsw i32 -399995, %i.1
  %882 = sext i32 %881 to i64
  %883 = getelementptr inbounds double* %srcGrid, i64 %882
  %884 = load double* %883, align 8
  %885 = add nsw i32 -399994, %i.1
  %886 = sext i32 %885 to i64
  %887 = getelementptr inbounds double* %srcGrid, i64 %886
  %888 = load double* %887, align 8
  %889 = fsub double %884, %888
  %890 = add nsw i32 -399989, %i.1
  %891 = sext i32 %890 to i64
  %892 = getelementptr inbounds double* %srcGrid, i64 %891
  %893 = load double* %892, align 8
  %894 = fadd double %889, %893
  %895 = add nsw i32 -399988, %i.1
  %896 = sext i32 %895 to i64
  %897 = getelementptr inbounds double* %srcGrid, i64 %896
  %898 = load double* %897, align 8
  %899 = fsub double %894, %898
  %900 = add nsw i32 -399987, %i.1
  %901 = sext i32 %900 to i64
  %902 = getelementptr inbounds double* %srcGrid, i64 %901
  %903 = load double* %902, align 8
  %904 = fadd double %899, %903
  %905 = add nsw i32 -399986, %i.1
  %906 = sext i32 %905 to i64
  %907 = getelementptr inbounds double* %srcGrid, i64 %906
  %908 = load double* %907, align 8
  %909 = fsub double %904, %908
  %910 = add nsw i32 -399985, %i.1
  %911 = sext i32 %910 to i64
  %912 = getelementptr inbounds double* %srcGrid, i64 %911
  %913 = load double* %912, align 8
  %914 = fadd double %909, %913
  %915 = add nsw i32 -399984, %i.1
  %916 = sext i32 %915 to i64
  %917 = getelementptr inbounds double* %srcGrid, i64 %916
  %918 = load double* %917, align 8
  %919 = fsub double %914, %918
  %920 = add nsw i32 -399983, %i.1
  %921 = sext i32 %920 to i64
  %922 = getelementptr inbounds double* %srcGrid, i64 %921
  %923 = load double* %922, align 8
  %924 = fadd double %919, %923
  %925 = add nsw i32 -399982, %i.1
  %926 = sext i32 %925 to i64
  %927 = getelementptr inbounds double* %srcGrid, i64 %926
  %928 = load double* %927, align 8
  %929 = fsub double %924, %928
  %930 = fdiv double %831, %782
  %931 = fdiv double %880, %782
  %932 = fdiv double %929, %782
  %933 = fmul double 2.000000e+00, %686
  %934 = fsub double %933, %930
  %935 = fmul double 2.000000e+00, %687
  %936 = fsub double %935, %931
  %937 = fmul double 2.000000e+00, %688
  %938 = fsub double %937, %932
  %939 = fmul double %934, %934
  %940 = fmul double %936, %936
  %941 = fadd double %939, %940
  %942 = fmul double %938, %938
  %943 = fadd double %941, %942
  %944 = fmul double 1.500000e+00, %943
  %945 = fmul double 0x3FD5555555555555, 1.000000e+00
  %946 = fsub double 1.000000e+00, %944
  %947 = fmul double %945, %946
  %948 = add nsw i32 0, %i.1
  %949 = sext i32 %948 to i64
  %950 = getelementptr inbounds double* %srcGrid, i64 %949
  store double %947, double* %950, align 8
  %951 = fmul double 0x3FAC71C71C71C71C, 1.000000e+00
  %952 = fmul double 4.500000e+00, %936
  %953 = fadd double %952, 3.000000e+00
  %954 = fmul double %936, %953
  %955 = fadd double 1.000000e+00, %954
  %956 = fsub double %955, %944
  %957 = fmul double %951, %956
  %958 = add nsw i32 1, %i.1
  %959 = sext i32 %958 to i64
  %960 = getelementptr inbounds double* %srcGrid, i64 %959
  store double %957, double* %960, align 8
  %961 = fmul double 0x3FAC71C71C71C71C, 1.000000e+00
  %962 = fmul double 4.500000e+00, %936
  %963 = fsub double %962, 3.000000e+00
  %964 = fmul double %936, %963
  %965 = fadd double 1.000000e+00, %964
  %966 = fsub double %965, %944
  %967 = fmul double %961, %966
  %968 = add nsw i32 2, %i.1
  %969 = sext i32 %968 to i64
  %970 = getelementptr inbounds double* %srcGrid, i64 %969
  store double %967, double* %970, align 8
  %971 = fmul double 0x3FAC71C71C71C71C, 1.000000e+00
  %972 = fmul double 4.500000e+00, %934
  %973 = fadd double %972, 3.000000e+00
  %974 = fmul double %934, %973
  %975 = fadd double 1.000000e+00, %974
  %976 = fsub double %975, %944
  %977 = fmul double %971, %976
  %978 = add nsw i32 3, %i.1
  %979 = sext i32 %978 to i64
  %980 = getelementptr inbounds double* %srcGrid, i64 %979
  store double %977, double* %980, align 8
  %981 = fmul double 0x3FAC71C71C71C71C, 1.000000e+00
  %982 = fmul double 4.500000e+00, %934
  %983 = fsub double %982, 3.000000e+00
  %984 = fmul double %934, %983
  %985 = fadd double 1.000000e+00, %984
  %986 = fsub double %985, %944
  %987 = fmul double %981, %986
  %988 = add nsw i32 4, %i.1
  %989 = sext i32 %988 to i64
  %990 = getelementptr inbounds double* %srcGrid, i64 %989
  store double %987, double* %990, align 8
  %991 = fmul double 0x3FAC71C71C71C71C, 1.000000e+00
  %992 = fmul double 4.500000e+00, %938
  %993 = fadd double %992, 3.000000e+00
  %994 = fmul double %938, %993
  %995 = fadd double 1.000000e+00, %994
  %996 = fsub double %995, %944
  %997 = fmul double %991, %996
  %998 = add nsw i32 5, %i.1
  %999 = sext i32 %998 to i64
  %1000 = getelementptr inbounds double* %srcGrid, i64 %999
  store double %997, double* %1000, align 8
  %1001 = fmul double 0x3FAC71C71C71C71C, 1.000000e+00
  %1002 = fmul double 4.500000e+00, %938
  %1003 = fsub double %1002, 3.000000e+00
  %1004 = fmul double %938, %1003
  %1005 = fadd double 1.000000e+00, %1004
  %1006 = fsub double %1005, %944
  %1007 = fmul double %1001, %1006
  %1008 = add nsw i32 6, %i.1
  %1009 = sext i32 %1008 to i64
  %1010 = getelementptr inbounds double* %srcGrid, i64 %1009
  store double %1007, double* %1010, align 8
  %1011 = fmul double 0x3F9C71C71C71C71C, 1.000000e+00
  %1012 = fadd double %934, %936
  %1013 = fadd double %934, %936
  %1014 = fmul double 4.500000e+00, %1013
  %1015 = fadd double %1014, 3.000000e+00
  %1016 = fmul double %1012, %1015
  %1017 = fadd double 1.000000e+00, %1016
  %1018 = fsub double %1017, %944
  %1019 = fmul double %1011, %1018
  %1020 = add nsw i32 7, %i.1
  %1021 = sext i32 %1020 to i64
  %1022 = getelementptr inbounds double* %srcGrid, i64 %1021
  store double %1019, double* %1022, align 8
  %1023 = fmul double 0x3F9C71C71C71C71C, 1.000000e+00
  %1024 = fsub double -0.000000e+00, %934
  %1025 = fadd double %1024, %936
  %1026 = fsub double -0.000000e+00, %934
  %1027 = fadd double %1026, %936
  %1028 = fmul double 4.500000e+00, %1027
  %1029 = fadd double %1028, 3.000000e+00
  %1030 = fmul double %1025, %1029
  %1031 = fadd double 1.000000e+00, %1030
  %1032 = fsub double %1031, %944
  %1033 = fmul double %1023, %1032
  %1034 = add nsw i32 8, %i.1
  %1035 = sext i32 %1034 to i64
  %1036 = getelementptr inbounds double* %srcGrid, i64 %1035
  store double %1033, double* %1036, align 8
  %1037 = fmul double 0x3F9C71C71C71C71C, 1.000000e+00
  %1038 = fsub double %934, %936
  %1039 = fsub double %934, %936
  %1040 = fmul double 4.500000e+00, %1039
  %1041 = fadd double %1040, 3.000000e+00
  %1042 = fmul double %1038, %1041
  %1043 = fadd double 1.000000e+00, %1042
  %1044 = fsub double %1043, %944
  %1045 = fmul double %1037, %1044
  %1046 = add nsw i32 9, %i.1
  %1047 = sext i32 %1046 to i64
  %1048 = getelementptr inbounds double* %srcGrid, i64 %1047
  store double %1045, double* %1048, align 8
  %1049 = fmul double 0x3F9C71C71C71C71C, 1.000000e+00
  %1050 = fsub double -0.000000e+00, %934
  %1051 = fsub double %1050, %936
  %1052 = fsub double -0.000000e+00, %934
  %1053 = fsub double %1052, %936
  %1054 = fmul double 4.500000e+00, %1053
  %1055 = fadd double %1054, 3.000000e+00
  %1056 = fmul double %1051, %1055
  %1057 = fadd double 1.000000e+00, %1056
  %1058 = fsub double %1057, %944
  %1059 = fmul double %1049, %1058
  %1060 = add nsw i32 10, %i.1
  %1061 = sext i32 %1060 to i64
  %1062 = getelementptr inbounds double* %srcGrid, i64 %1061
  store double %1059, double* %1062, align 8
  %1063 = fmul double 0x3F9C71C71C71C71C, 1.000000e+00
  %1064 = fadd double %936, %938
  %1065 = fadd double %936, %938
  %1066 = fmul double 4.500000e+00, %1065
  %1067 = fadd double %1066, 3.000000e+00
  %1068 = fmul double %1064, %1067
  %1069 = fadd double 1.000000e+00, %1068
  %1070 = fsub double %1069, %944
  %1071 = fmul double %1063, %1070
  %1072 = add nsw i32 11, %i.1
  %1073 = sext i32 %1072 to i64
  %1074 = getelementptr inbounds double* %srcGrid, i64 %1073
  store double %1071, double* %1074, align 8
  %1075 = fmul double 0x3F9C71C71C71C71C, 1.000000e+00
  %1076 = fsub double %936, %938
  %1077 = fsub double %936, %938
  %1078 = fmul double 4.500000e+00, %1077
  %1079 = fadd double %1078, 3.000000e+00
  %1080 = fmul double %1076, %1079
  %1081 = fadd double 1.000000e+00, %1080
  %1082 = fsub double %1081, %944
  %1083 = fmul double %1075, %1082
  %1084 = add nsw i32 12, %i.1
  %1085 = sext i32 %1084 to i64
  %1086 = getelementptr inbounds double* %srcGrid, i64 %1085
  store double %1083, double* %1086, align 8
  %1087 = fmul double 0x3F9C71C71C71C71C, 1.000000e+00
  %1088 = fsub double -0.000000e+00, %936
  %1089 = fadd double %1088, %938
  %1090 = fsub double -0.000000e+00, %936
  %1091 = fadd double %1090, %938
  %1092 = fmul double 4.500000e+00, %1091
  %1093 = fadd double %1092, 3.000000e+00
  %1094 = fmul double %1089, %1093
  %1095 = fadd double 1.000000e+00, %1094
  %1096 = fsub double %1095, %944
  %1097 = fmul double %1087, %1096
  %1098 = add nsw i32 13, %i.1
  %1099 = sext i32 %1098 to i64
  %1100 = getelementptr inbounds double* %srcGrid, i64 %1099
  store double %1097, double* %1100, align 8
  %1101 = fmul double 0x3F9C71C71C71C71C, 1.000000e+00
  %1102 = fsub double -0.000000e+00, %936
  %1103 = fsub double %1102, %938
  %1104 = fsub double -0.000000e+00, %936
  %1105 = fsub double %1104, %938
  %1106 = fmul double 4.500000e+00, %1105
  %1107 = fadd double %1106, 3.000000e+00
  %1108 = fmul double %1103, %1107
  %1109 = fadd double 1.000000e+00, %1108
  %1110 = fsub double %1109, %944
  %1111 = fmul double %1101, %1110
  %1112 = add nsw i32 14, %i.1
  %1113 = sext i32 %1112 to i64
  %1114 = getelementptr inbounds double* %srcGrid, i64 %1113
  store double %1111, double* %1114, align 8
  %1115 = fmul double 0x3F9C71C71C71C71C, 1.000000e+00
  %1116 = fadd double %934, %938
  %1117 = fadd double %934, %938
  %1118 = fmul double 4.500000e+00, %1117
  %1119 = fadd double %1118, 3.000000e+00
  %1120 = fmul double %1116, %1119
  %1121 = fadd double 1.000000e+00, %1120
  %1122 = fsub double %1121, %944
  %1123 = fmul double %1115, %1122
  %1124 = add nsw i32 15, %i.1
  %1125 = sext i32 %1124 to i64
  %1126 = getelementptr inbounds double* %srcGrid, i64 %1125
  store double %1123, double* %1126, align 8
  %1127 = fmul double 0x3F9C71C71C71C71C, 1.000000e+00
  %1128 = fsub double %934, %938
  %1129 = fsub double %934, %938
  %1130 = fmul double 4.500000e+00, %1129
  %1131 = fadd double %1130, 3.000000e+00
  %1132 = fmul double %1128, %1131
  %1133 = fadd double 1.000000e+00, %1132
  %1134 = fsub double %1133, %944
  %1135 = fmul double %1127, %1134
  %1136 = add nsw i32 16, %i.1
  %1137 = sext i32 %1136 to i64
  %1138 = getelementptr inbounds double* %srcGrid, i64 %1137
  store double %1135, double* %1138, align 8
  %1139 = fmul double 0x3F9C71C71C71C71C, 1.000000e+00
  %1140 = fsub double -0.000000e+00, %934
  %1141 = fadd double %1140, %938
  %1142 = fsub double -0.000000e+00, %934
  %1143 = fadd double %1142, %938
  %1144 = fmul double 4.500000e+00, %1143
  %1145 = fadd double %1144, 3.000000e+00
  %1146 = fmul double %1141, %1145
  %1147 = fadd double 1.000000e+00, %1146
  %1148 = fsub double %1147, %944
  %1149 = fmul double %1139, %1148
  %1150 = add nsw i32 17, %i.1
  %1151 = sext i32 %1150 to i64
  %1152 = getelementptr inbounds double* %srcGrid, i64 %1151
  store double %1149, double* %1152, align 8
  %1153 = fmul double 0x3F9C71C71C71C71C, 1.000000e+00
  %1154 = fsub double -0.000000e+00, %934
  %1155 = fsub double %1154, %938
  %1156 = fsub double -0.000000e+00, %934
  %1157 = fsub double %1156, %938
  %1158 = fmul double 4.500000e+00, %1157
  %1159 = fadd double %1158, 3.000000e+00
  %1160 = fmul double %1155, %1159
  %1161 = fadd double 1.000000e+00, %1160
  %1162 = fsub double %1161, %944
  %1163 = fmul double %1153, %1162
  %1164 = add nsw i32 18, %i.1
  %1165 = sext i32 %1164 to i64
  %1166 = getelementptr inbounds double* %srcGrid, i64 %1165
  store double %1163, double* %1166, align 8
  br label %1167

; <label>:1167                                    ; preds = %444
  %1168 = add nsw i32 %i.1, 20
  br label %442

; <label>:1169                                    ; preds = %442
  ret void
}

; Function Attrs: nounwind uwtable
define void @LBM_showGridStatistics(double* %grid) #0 {
  br label %1

; <label>:1                                       ; preds = %290, %0
  %maxU2.0 = phi double [ -1.000000e+30, %0 ], [ %maxU2.2, %290 ]
  %minU2.0 = phi double [ 1.000000e+30, %0 ], [ %minU2.2, %290 ]
  %minRho.0 = phi double [ 1.000000e+30, %0 ], [ %minRho.1, %290 ]
  %maxRho.0 = phi double [ -1.000000e+30, %0 ], [ %maxRho.1, %290 ]
  %mass.0 = phi double [ 0.000000e+00, %0 ], [ %104, %290 ]
  %nFluidCells.0 = phi i32 [ 0, %0 ], [ %nFluidCells.2, %290 ]
  %nAccelCells.0 = phi i32 [ 0, %0 ], [ %nAccelCells.2, %290 ]
  %nObstacleCells.0 = phi i32 [ 0, %0 ], [ %nObstacleCells.1, %290 ]
  %i.0 = phi i32 [ 0, %0 ], [ %291, %290 ]
  %2 = icmp slt i32 %i.0, 26000000
  br i1 %2, label %3, label %292

; <label>:3                                       ; preds = %1
  %4 = add nsw i32 0, %i.0
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds double* %grid, i64 %5
  %7 = load double* %6, align 8
  %8 = add nsw i32 1, %i.0
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds double* %grid, i64 %9
  %11 = load double* %10, align 8
  %12 = fadd double %7, %11
  %13 = add nsw i32 2, %i.0
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds double* %grid, i64 %14
  %16 = load double* %15, align 8
  %17 = fadd double %12, %16
  %18 = add nsw i32 3, %i.0
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds double* %grid, i64 %19
  %21 = load double* %20, align 8
  %22 = fadd double %17, %21
  %23 = add nsw i32 4, %i.0
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double* %grid, i64 %24
  %26 = load double* %25, align 8
  %27 = fadd double %22, %26
  %28 = add nsw i32 5, %i.0
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double* %grid, i64 %29
  %31 = load double* %30, align 8
  %32 = fadd double %27, %31
  %33 = add nsw i32 6, %i.0
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double* %grid, i64 %34
  %36 = load double* %35, align 8
  %37 = fadd double %32, %36
  %38 = add nsw i32 7, %i.0
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double* %grid, i64 %39
  %41 = load double* %40, align 8
  %42 = fadd double %37, %41
  %43 = add nsw i32 8, %i.0
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double* %grid, i64 %44
  %46 = load double* %45, align 8
  %47 = fadd double %42, %46
  %48 = add nsw i32 9, %i.0
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds double* %grid, i64 %49
  %51 = load double* %50, align 8
  %52 = fadd double %47, %51
  %53 = add nsw i32 10, %i.0
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double* %grid, i64 %54
  %56 = load double* %55, align 8
  %57 = fadd double %52, %56
  %58 = add nsw i32 11, %i.0
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double* %grid, i64 %59
  %61 = load double* %60, align 8
  %62 = fadd double %57, %61
  %63 = add nsw i32 12, %i.0
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double* %grid, i64 %64
  %66 = load double* %65, align 8
  %67 = fadd double %62, %66
  %68 = add nsw i32 13, %i.0
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double* %grid, i64 %69
  %71 = load double* %70, align 8
  %72 = fadd double %67, %71
  %73 = add nsw i32 14, %i.0
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double* %grid, i64 %74
  %76 = load double* %75, align 8
  %77 = fadd double %72, %76
  %78 = add nsw i32 15, %i.0
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double* %grid, i64 %79
  %81 = load double* %80, align 8
  %82 = fadd double %77, %81
  %83 = add nsw i32 16, %i.0
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double* %grid, i64 %84
  %86 = load double* %85, align 8
  %87 = fadd double %82, %86
  %88 = add nsw i32 17, %i.0
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds double* %grid, i64 %89
  %91 = load double* %90, align 8
  %92 = fadd double %87, %91
  %93 = add nsw i32 18, %i.0
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds double* %grid, i64 %94
  %96 = load double* %95, align 8
  %97 = fadd double %92, %96
  %98 = fcmp olt double %97, %minRho.0
  br i1 %98, label %99, label %100

; <label>:99                                      ; preds = %3
  br label %100

; <label>:100                                     ; preds = %99, %3
  %minRho.1 = phi double [ %97, %99 ], [ %minRho.0, %3 ]
  %101 = fcmp ogt double %97, %maxRho.0
  br i1 %101, label %102, label %103

; <label>:102                                     ; preds = %100
  br label %103

; <label>:103                                     ; preds = %102, %100
  %maxRho.1 = phi double [ %97, %102 ], [ %maxRho.0, %100 ]
  %104 = fadd double %mass.0, %97
  %105 = add nsw i32 19, %i.0
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds double* %grid, i64 %106
  %108 = bitcast double* %107 to i8*
  %109 = bitcast i8* %108 to i32*
  %110 = load i32* %109, align 4
  %111 = and i32 %110, 1
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %115

; <label>:113                                     ; preds = %103
  %114 = add nsw i32 %nObstacleCells.0, 1
  br label %289

; <label>:115                                     ; preds = %103
  %116 = add nsw i32 19, %i.0
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds double* %grid, i64 %117
  %119 = bitcast double* %118 to i8*
  %120 = bitcast i8* %119 to i32*
  %121 = load i32* %120, align 4
  %122 = and i32 %121, 2
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %126

; <label>:124                                     ; preds = %115
  %125 = add nsw i32 %nAccelCells.0, 1
  br label %128

; <label>:126                                     ; preds = %115
  %127 = add nsw i32 %nFluidCells.0, 1
  br label %128

; <label>:128                                     ; preds = %126, %124
  %nFluidCells.1 = phi i32 [ %nFluidCells.0, %124 ], [ %127, %126 ]
  %nAccelCells.1 = phi i32 [ %125, %124 ], [ %nAccelCells.0, %126 ]
  %129 = add nsw i32 3, %i.0
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds double* %grid, i64 %130
  %132 = load double* %131, align 8
  %133 = add nsw i32 4, %i.0
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds double* %grid, i64 %134
  %136 = load double* %135, align 8
  %137 = fsub double %132, %136
  %138 = add nsw i32 7, %i.0
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds double* %grid, i64 %139
  %141 = load double* %140, align 8
  %142 = fadd double %137, %141
  %143 = add nsw i32 8, %i.0
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds double* %grid, i64 %144
  %146 = load double* %145, align 8
  %147 = fsub double %142, %146
  %148 = add nsw i32 9, %i.0
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds double* %grid, i64 %149
  %151 = load double* %150, align 8
  %152 = fadd double %147, %151
  %153 = add nsw i32 10, %i.0
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds double* %grid, i64 %154
  %156 = load double* %155, align 8
  %157 = fsub double %152, %156
  %158 = add nsw i32 15, %i.0
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds double* %grid, i64 %159
  %161 = load double* %160, align 8
  %162 = fadd double %157, %161
  %163 = add nsw i32 16, %i.0
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds double* %grid, i64 %164
  %166 = load double* %165, align 8
  %167 = fadd double %162, %166
  %168 = add nsw i32 17, %i.0
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds double* %grid, i64 %169
  %171 = load double* %170, align 8
  %172 = fsub double %167, %171
  %173 = add nsw i32 18, %i.0
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds double* %grid, i64 %174
  %176 = load double* %175, align 8
  %177 = fsub double %172, %176
  %178 = add nsw i32 1, %i.0
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds double* %grid, i64 %179
  %181 = load double* %180, align 8
  %182 = add nsw i32 2, %i.0
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds double* %grid, i64 %183
  %185 = load double* %184, align 8
  %186 = fsub double %181, %185
  %187 = add nsw i32 7, %i.0
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds double* %grid, i64 %188
  %190 = load double* %189, align 8
  %191 = fadd double %186, %190
  %192 = add nsw i32 8, %i.0
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds double* %grid, i64 %193
  %195 = load double* %194, align 8
  %196 = fadd double %191, %195
  %197 = add nsw i32 9, %i.0
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds double* %grid, i64 %198
  %200 = load double* %199, align 8
  %201 = fsub double %196, %200
  %202 = add nsw i32 10, %i.0
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds double* %grid, i64 %203
  %205 = load double* %204, align 8
  %206 = fsub double %201, %205
  %207 = add nsw i32 11, %i.0
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds double* %grid, i64 %208
  %210 = load double* %209, align 8
  %211 = fadd double %206, %210
  %212 = add nsw i32 12, %i.0
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds double* %grid, i64 %213
  %215 = load double* %214, align 8
  %216 = fadd double %211, %215
  %217 = add nsw i32 13, %i.0
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds double* %grid, i64 %218
  %220 = load double* %219, align 8
  %221 = fsub double %216, %220
  %222 = add nsw i32 14, %i.0
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds double* %grid, i64 %223
  %225 = load double* %224, align 8
  %226 = fsub double %221, %225
  %227 = add nsw i32 5, %i.0
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds double* %grid, i64 %228
  %230 = load double* %229, align 8
  %231 = add nsw i32 6, %i.0
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds double* %grid, i64 %232
  %234 = load double* %233, align 8
  %235 = fsub double %230, %234
  %236 = add nsw i32 11, %i.0
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds double* %grid, i64 %237
  %239 = load double* %238, align 8
  %240 = fadd double %235, %239
  %241 = add nsw i32 12, %i.0
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds double* %grid, i64 %242
  %244 = load double* %243, align 8
  %245 = fsub double %240, %244
  %246 = add nsw i32 13, %i.0
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds double* %grid, i64 %247
  %249 = load double* %248, align 8
  %250 = fadd double %245, %249
  %251 = add nsw i32 14, %i.0
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds double* %grid, i64 %252
  %254 = load double* %253, align 8
  %255 = fsub double %250, %254
  %256 = add nsw i32 15, %i.0
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds double* %grid, i64 %257
  %259 = load double* %258, align 8
  %260 = fadd double %255, %259
  %261 = add nsw i32 16, %i.0
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds double* %grid, i64 %262
  %264 = load double* %263, align 8
  %265 = fsub double %260, %264
  %266 = add nsw i32 17, %i.0
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds double* %grid, i64 %267
  %269 = load double* %268, align 8
  %270 = fadd double %265, %269
  %271 = add nsw i32 18, %i.0
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds double* %grid, i64 %272
  %274 = load double* %273, align 8
  %275 = fsub double %270, %274
  %276 = fmul double %177, %177
  %277 = fmul double %226, %226
  %278 = fadd double %276, %277
  %279 = fmul double %275, %275
  %280 = fadd double %278, %279
  %281 = fmul double %97, %97
  %282 = fdiv double %280, %281
  %283 = fcmp olt double %282, %minU2.0
  br i1 %283, label %284, label %285

; <label>:284                                     ; preds = %128
  br label %285

; <label>:285                                     ; preds = %284, %128
  %minU2.1 = phi double [ %282, %284 ], [ %minU2.0, %128 ]
  %286 = fcmp ogt double %282, %maxU2.0
  br i1 %286, label %287, label %288

; <label>:287                                     ; preds = %285
  br label %288

; <label>:288                                     ; preds = %287, %285
  %maxU2.1 = phi double [ %282, %287 ], [ %maxU2.0, %285 ]
  br label %289

; <label>:289                                     ; preds = %288, %113
  %maxU2.2 = phi double [ %maxU2.0, %113 ], [ %maxU2.1, %288 ]
  %minU2.2 = phi double [ %minU2.0, %113 ], [ %minU2.1, %288 ]
  %nFluidCells.2 = phi i32 [ %nFluidCells.0, %113 ], [ %nFluidCells.1, %288 ]
  %nAccelCells.2 = phi i32 [ %nAccelCells.0, %113 ], [ %nAccelCells.1, %288 ]
  %nObstacleCells.1 = phi i32 [ %114, %113 ], [ %nObstacleCells.0, %288 ]
  br label %290

; <label>:290                                     ; preds = %289
  %291 = add nsw i32 %i.0, 20
  br label %1

; <label>:292                                     ; preds = %1
  %293 = call double @sqrt(double %minU2.0) #4
  %294 = call double @sqrt(double %maxU2.0) #4
  %295 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([138 x i8]* @.str3, i32 0, i32 0), i32 %nObstacleCells.0, i32 %nAccelCells.0, i32 %nFluidCells.0, double %minRho.0, double %maxRho.0, double %mass.0, double %293, double %294)
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define void @LBM_storeVelocityField(double* %grid, i8* %filename, i32 %binary) #0 {
  %ux = alloca float, align 4
  %uy = alloca float, align 4
  %uz = alloca float, align 4
  %1 = icmp ne i32 %binary, 0
  %2 = select i1 %1, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0)
  %3 = call %struct._IO_FILE* @fopen(i8* %filename, i8* %2)
  br label %4

; <label>:4                                       ; preds = %575, %0
  %z.0 = phi i32 [ 0, %0 ], [ %576, %575 ]
  %5 = icmp slt i32 %z.0, 130
  br i1 %5, label %6, label %577

; <label>:6                                       ; preds = %4
  br label %7

; <label>:7                                       ; preds = %572, %6
  %y.0 = phi i32 [ 0, %6 ], [ %573, %572 ]
  %8 = icmp slt i32 %y.0, 100
  br i1 %8, label %9, label %574

; <label>:9                                       ; preds = %7
  br label %10

; <label>:10                                      ; preds = %569, %9
  %x.0 = phi i32 [ 0, %9 ], [ %570, %569 ]
  %11 = icmp slt i32 %x.0, 100
  br i1 %11, label %12, label %571

; <label>:12                                      ; preds = %10
  %13 = mul nsw i32 %y.0, 100
  %14 = add nsw i32 %x.0, %13
  %15 = mul nsw i32 %z.0, 100
  %16 = mul nsw i32 %15, 100
  %17 = add nsw i32 %14, %16
  %18 = mul nsw i32 20, %17
  %19 = add nsw i32 0, %18
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds double* %grid, i64 %20
  %22 = load double* %21, align 8
  %23 = mul nsw i32 %y.0, 100
  %24 = add nsw i32 %x.0, %23
  %25 = mul nsw i32 %z.0, 100
  %26 = mul nsw i32 %25, 100
  %27 = add nsw i32 %24, %26
  %28 = mul nsw i32 20, %27
  %29 = add nsw i32 1, %28
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double* %grid, i64 %30
  %32 = load double* %31, align 8
  %33 = fadd double %22, %32
  %34 = mul nsw i32 %y.0, 100
  %35 = add nsw i32 %x.0, %34
  %36 = mul nsw i32 %z.0, 100
  %37 = mul nsw i32 %36, 100
  %38 = add nsw i32 %35, %37
  %39 = mul nsw i32 20, %38
  %40 = add nsw i32 2, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double* %grid, i64 %41
  %43 = load double* %42, align 8
  %44 = fadd double %33, %43
  %45 = mul nsw i32 %y.0, 100
  %46 = add nsw i32 %x.0, %45
  %47 = mul nsw i32 %z.0, 100
  %48 = mul nsw i32 %47, 100
  %49 = add nsw i32 %46, %48
  %50 = mul nsw i32 20, %49
  %51 = add nsw i32 3, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double* %grid, i64 %52
  %54 = load double* %53, align 8
  %55 = fadd double %44, %54
  %56 = mul nsw i32 %y.0, 100
  %57 = add nsw i32 %x.0, %56
  %58 = mul nsw i32 %z.0, 100
  %59 = mul nsw i32 %58, 100
  %60 = add nsw i32 %57, %59
  %61 = mul nsw i32 20, %60
  %62 = add nsw i32 4, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double* %grid, i64 %63
  %65 = load double* %64, align 8
  %66 = fadd double %55, %65
  %67 = mul nsw i32 %y.0, 100
  %68 = add nsw i32 %x.0, %67
  %69 = mul nsw i32 %z.0, 100
  %70 = mul nsw i32 %69, 100
  %71 = add nsw i32 %68, %70
  %72 = mul nsw i32 20, %71
  %73 = add nsw i32 5, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double* %grid, i64 %74
  %76 = load double* %75, align 8
  %77 = fadd double %66, %76
  %78 = mul nsw i32 %y.0, 100
  %79 = add nsw i32 %x.0, %78
  %80 = mul nsw i32 %z.0, 100
  %81 = mul nsw i32 %80, 100
  %82 = add nsw i32 %79, %81
  %83 = mul nsw i32 20, %82
  %84 = add nsw i32 6, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds double* %grid, i64 %85
  %87 = load double* %86, align 8
  %88 = fadd double %77, %87
  %89 = mul nsw i32 %y.0, 100
  %90 = add nsw i32 %x.0, %89
  %91 = mul nsw i32 %z.0, 100
  %92 = mul nsw i32 %91, 100
  %93 = add nsw i32 %90, %92
  %94 = mul nsw i32 20, %93
  %95 = add nsw i32 7, %94
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds double* %grid, i64 %96
  %98 = load double* %97, align 8
  %99 = fadd double %88, %98
  %100 = mul nsw i32 %y.0, 100
  %101 = add nsw i32 %x.0, %100
  %102 = mul nsw i32 %z.0, 100
  %103 = mul nsw i32 %102, 100
  %104 = add nsw i32 %101, %103
  %105 = mul nsw i32 20, %104
  %106 = add nsw i32 8, %105
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double* %grid, i64 %107
  %109 = load double* %108, align 8
  %110 = fadd double %99, %109
  %111 = mul nsw i32 %y.0, 100
  %112 = add nsw i32 %x.0, %111
  %113 = mul nsw i32 %z.0, 100
  %114 = mul nsw i32 %113, 100
  %115 = add nsw i32 %112, %114
  %116 = mul nsw i32 20, %115
  %117 = add nsw i32 9, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double* %grid, i64 %118
  %120 = load double* %119, align 8
  %121 = fadd double %110, %120
  %122 = mul nsw i32 %y.0, 100
  %123 = add nsw i32 %x.0, %122
  %124 = mul nsw i32 %z.0, 100
  %125 = mul nsw i32 %124, 100
  %126 = add nsw i32 %123, %125
  %127 = mul nsw i32 20, %126
  %128 = add nsw i32 10, %127
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds double* %grid, i64 %129
  %131 = load double* %130, align 8
  %132 = fadd double %121, %131
  %133 = mul nsw i32 %y.0, 100
  %134 = add nsw i32 %x.0, %133
  %135 = mul nsw i32 %z.0, 100
  %136 = mul nsw i32 %135, 100
  %137 = add nsw i32 %134, %136
  %138 = mul nsw i32 20, %137
  %139 = add nsw i32 11, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds double* %grid, i64 %140
  %142 = load double* %141, align 8
  %143 = fadd double %132, %142
  %144 = mul nsw i32 %y.0, 100
  %145 = add nsw i32 %x.0, %144
  %146 = mul nsw i32 %z.0, 100
  %147 = mul nsw i32 %146, 100
  %148 = add nsw i32 %145, %147
  %149 = mul nsw i32 20, %148
  %150 = add nsw i32 12, %149
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds double* %grid, i64 %151
  %153 = load double* %152, align 8
  %154 = fadd double %143, %153
  %155 = mul nsw i32 %y.0, 100
  %156 = add nsw i32 %x.0, %155
  %157 = mul nsw i32 %z.0, 100
  %158 = mul nsw i32 %157, 100
  %159 = add nsw i32 %156, %158
  %160 = mul nsw i32 20, %159
  %161 = add nsw i32 13, %160
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds double* %grid, i64 %162
  %164 = load double* %163, align 8
  %165 = fadd double %154, %164
  %166 = mul nsw i32 %y.0, 100
  %167 = add nsw i32 %x.0, %166
  %168 = mul nsw i32 %z.0, 100
  %169 = mul nsw i32 %168, 100
  %170 = add nsw i32 %167, %169
  %171 = mul nsw i32 20, %170
  %172 = add nsw i32 14, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds double* %grid, i64 %173
  %175 = load double* %174, align 8
  %176 = fadd double %165, %175
  %177 = mul nsw i32 %y.0, 100
  %178 = add nsw i32 %x.0, %177
  %179 = mul nsw i32 %z.0, 100
  %180 = mul nsw i32 %179, 100
  %181 = add nsw i32 %178, %180
  %182 = mul nsw i32 20, %181
  %183 = add nsw i32 15, %182
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds double* %grid, i64 %184
  %186 = load double* %185, align 8
  %187 = fadd double %176, %186
  %188 = mul nsw i32 %y.0, 100
  %189 = add nsw i32 %x.0, %188
  %190 = mul nsw i32 %z.0, 100
  %191 = mul nsw i32 %190, 100
  %192 = add nsw i32 %189, %191
  %193 = mul nsw i32 20, %192
  %194 = add nsw i32 16, %193
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds double* %grid, i64 %195
  %197 = load double* %196, align 8
  %198 = fadd double %187, %197
  %199 = mul nsw i32 %y.0, 100
  %200 = add nsw i32 %x.0, %199
  %201 = mul nsw i32 %z.0, 100
  %202 = mul nsw i32 %201, 100
  %203 = add nsw i32 %200, %202
  %204 = mul nsw i32 20, %203
  %205 = add nsw i32 17, %204
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds double* %grid, i64 %206
  %208 = load double* %207, align 8
  %209 = fadd double %198, %208
  %210 = mul nsw i32 %y.0, 100
  %211 = add nsw i32 %x.0, %210
  %212 = mul nsw i32 %z.0, 100
  %213 = mul nsw i32 %212, 100
  %214 = add nsw i32 %211, %213
  %215 = mul nsw i32 20, %214
  %216 = add nsw i32 18, %215
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds double* %grid, i64 %217
  %219 = load double* %218, align 8
  %220 = fadd double %209, %219
  %221 = fptrunc double %220 to float
  %222 = mul nsw i32 %y.0, 100
  %223 = add nsw i32 %x.0, %222
  %224 = mul nsw i32 %z.0, 100
  %225 = mul nsw i32 %224, 100
  %226 = add nsw i32 %223, %225
  %227 = mul nsw i32 20, %226
  %228 = add nsw i32 3, %227
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds double* %grid, i64 %229
  %231 = load double* %230, align 8
  %232 = mul nsw i32 %y.0, 100
  %233 = add nsw i32 %x.0, %232
  %234 = mul nsw i32 %z.0, 100
  %235 = mul nsw i32 %234, 100
  %236 = add nsw i32 %233, %235
  %237 = mul nsw i32 20, %236
  %238 = add nsw i32 4, %237
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds double* %grid, i64 %239
  %241 = load double* %240, align 8
  %242 = fsub double %231, %241
  %243 = mul nsw i32 %y.0, 100
  %244 = add nsw i32 %x.0, %243
  %245 = mul nsw i32 %z.0, 100
  %246 = mul nsw i32 %245, 100
  %247 = add nsw i32 %244, %246
  %248 = mul nsw i32 20, %247
  %249 = add nsw i32 7, %248
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds double* %grid, i64 %250
  %252 = load double* %251, align 8
  %253 = fadd double %242, %252
  %254 = mul nsw i32 %y.0, 100
  %255 = add nsw i32 %x.0, %254
  %256 = mul nsw i32 %z.0, 100
  %257 = mul nsw i32 %256, 100
  %258 = add nsw i32 %255, %257
  %259 = mul nsw i32 20, %258
  %260 = add nsw i32 8, %259
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds double* %grid, i64 %261
  %263 = load double* %262, align 8
  %264 = fsub double %253, %263
  %265 = mul nsw i32 %y.0, 100
  %266 = add nsw i32 %x.0, %265
  %267 = mul nsw i32 %z.0, 100
  %268 = mul nsw i32 %267, 100
  %269 = add nsw i32 %266, %268
  %270 = mul nsw i32 20, %269
  %271 = add nsw i32 9, %270
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds double* %grid, i64 %272
  %274 = load double* %273, align 8
  %275 = fadd double %264, %274
  %276 = mul nsw i32 %y.0, 100
  %277 = add nsw i32 %x.0, %276
  %278 = mul nsw i32 %z.0, 100
  %279 = mul nsw i32 %278, 100
  %280 = add nsw i32 %277, %279
  %281 = mul nsw i32 20, %280
  %282 = add nsw i32 10, %281
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds double* %grid, i64 %283
  %285 = load double* %284, align 8
  %286 = fsub double %275, %285
  %287 = mul nsw i32 %y.0, 100
  %288 = add nsw i32 %x.0, %287
  %289 = mul nsw i32 %z.0, 100
  %290 = mul nsw i32 %289, 100
  %291 = add nsw i32 %288, %290
  %292 = mul nsw i32 20, %291
  %293 = add nsw i32 15, %292
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds double* %grid, i64 %294
  %296 = load double* %295, align 8
  %297 = fadd double %286, %296
  %298 = mul nsw i32 %y.0, 100
  %299 = add nsw i32 %x.0, %298
  %300 = mul nsw i32 %z.0, 100
  %301 = mul nsw i32 %300, 100
  %302 = add nsw i32 %299, %301
  %303 = mul nsw i32 20, %302
  %304 = add nsw i32 16, %303
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds double* %grid, i64 %305
  %307 = load double* %306, align 8
  %308 = fadd double %297, %307
  %309 = mul nsw i32 %y.0, 100
  %310 = add nsw i32 %x.0, %309
  %311 = mul nsw i32 %z.0, 100
  %312 = mul nsw i32 %311, 100
  %313 = add nsw i32 %310, %312
  %314 = mul nsw i32 20, %313
  %315 = add nsw i32 17, %314
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds double* %grid, i64 %316
  %318 = load double* %317, align 8
  %319 = fsub double %308, %318
  %320 = mul nsw i32 %y.0, 100
  %321 = add nsw i32 %x.0, %320
  %322 = mul nsw i32 %z.0, 100
  %323 = mul nsw i32 %322, 100
  %324 = add nsw i32 %321, %323
  %325 = mul nsw i32 20, %324
  %326 = add nsw i32 18, %325
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds double* %grid, i64 %327
  %329 = load double* %328, align 8
  %330 = fsub double %319, %329
  %331 = fptrunc double %330 to float
  store float %331, float* %ux, align 4
  %332 = mul nsw i32 %y.0, 100
  %333 = add nsw i32 %x.0, %332
  %334 = mul nsw i32 %z.0, 100
  %335 = mul nsw i32 %334, 100
  %336 = add nsw i32 %333, %335
  %337 = mul nsw i32 20, %336
  %338 = add nsw i32 1, %337
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds double* %grid, i64 %339
  %341 = load double* %340, align 8
  %342 = mul nsw i32 %y.0, 100
  %343 = add nsw i32 %x.0, %342
  %344 = mul nsw i32 %z.0, 100
  %345 = mul nsw i32 %344, 100
  %346 = add nsw i32 %343, %345
  %347 = mul nsw i32 20, %346
  %348 = add nsw i32 2, %347
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds double* %grid, i64 %349
  %351 = load double* %350, align 8
  %352 = fsub double %341, %351
  %353 = mul nsw i32 %y.0, 100
  %354 = add nsw i32 %x.0, %353
  %355 = mul nsw i32 %z.0, 100
  %356 = mul nsw i32 %355, 100
  %357 = add nsw i32 %354, %356
  %358 = mul nsw i32 20, %357
  %359 = add nsw i32 7, %358
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds double* %grid, i64 %360
  %362 = load double* %361, align 8
  %363 = fadd double %352, %362
  %364 = mul nsw i32 %y.0, 100
  %365 = add nsw i32 %x.0, %364
  %366 = mul nsw i32 %z.0, 100
  %367 = mul nsw i32 %366, 100
  %368 = add nsw i32 %365, %367
  %369 = mul nsw i32 20, %368
  %370 = add nsw i32 8, %369
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds double* %grid, i64 %371
  %373 = load double* %372, align 8
  %374 = fadd double %363, %373
  %375 = mul nsw i32 %y.0, 100
  %376 = add nsw i32 %x.0, %375
  %377 = mul nsw i32 %z.0, 100
  %378 = mul nsw i32 %377, 100
  %379 = add nsw i32 %376, %378
  %380 = mul nsw i32 20, %379
  %381 = add nsw i32 9, %380
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds double* %grid, i64 %382
  %384 = load double* %383, align 8
  %385 = fsub double %374, %384
  %386 = mul nsw i32 %y.0, 100
  %387 = add nsw i32 %x.0, %386
  %388 = mul nsw i32 %z.0, 100
  %389 = mul nsw i32 %388, 100
  %390 = add nsw i32 %387, %389
  %391 = mul nsw i32 20, %390
  %392 = add nsw i32 10, %391
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds double* %grid, i64 %393
  %395 = load double* %394, align 8
  %396 = fsub double %385, %395
  %397 = mul nsw i32 %y.0, 100
  %398 = add nsw i32 %x.0, %397
  %399 = mul nsw i32 %z.0, 100
  %400 = mul nsw i32 %399, 100
  %401 = add nsw i32 %398, %400
  %402 = mul nsw i32 20, %401
  %403 = add nsw i32 11, %402
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds double* %grid, i64 %404
  %406 = load double* %405, align 8
  %407 = fadd double %396, %406
  %408 = mul nsw i32 %y.0, 100
  %409 = add nsw i32 %x.0, %408
  %410 = mul nsw i32 %z.0, 100
  %411 = mul nsw i32 %410, 100
  %412 = add nsw i32 %409, %411
  %413 = mul nsw i32 20, %412
  %414 = add nsw i32 12, %413
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds double* %grid, i64 %415
  %417 = load double* %416, align 8
  %418 = fadd double %407, %417
  %419 = mul nsw i32 %y.0, 100
  %420 = add nsw i32 %x.0, %419
  %421 = mul nsw i32 %z.0, 100
  %422 = mul nsw i32 %421, 100
  %423 = add nsw i32 %420, %422
  %424 = mul nsw i32 20, %423
  %425 = add nsw i32 13, %424
  %426 = sext i32 %425 to i64
  %427 = getelementptr inbounds double* %grid, i64 %426
  %428 = load double* %427, align 8
  %429 = fsub double %418, %428
  %430 = mul nsw i32 %y.0, 100
  %431 = add nsw i32 %x.0, %430
  %432 = mul nsw i32 %z.0, 100
  %433 = mul nsw i32 %432, 100
  %434 = add nsw i32 %431, %433
  %435 = mul nsw i32 20, %434
  %436 = add nsw i32 14, %435
  %437 = sext i32 %436 to i64
  %438 = getelementptr inbounds double* %grid, i64 %437
  %439 = load double* %438, align 8
  %440 = fsub double %429, %439
  %441 = fptrunc double %440 to float
  store float %441, float* %uy, align 4
  %442 = mul nsw i32 %y.0, 100
  %443 = add nsw i32 %x.0, %442
  %444 = mul nsw i32 %z.0, 100
  %445 = mul nsw i32 %444, 100
  %446 = add nsw i32 %443, %445
  %447 = mul nsw i32 20, %446
  %448 = add nsw i32 5, %447
  %449 = sext i32 %448 to i64
  %450 = getelementptr inbounds double* %grid, i64 %449
  %451 = load double* %450, align 8
  %452 = mul nsw i32 %y.0, 100
  %453 = add nsw i32 %x.0, %452
  %454 = mul nsw i32 %z.0, 100
  %455 = mul nsw i32 %454, 100
  %456 = add nsw i32 %453, %455
  %457 = mul nsw i32 20, %456
  %458 = add nsw i32 6, %457
  %459 = sext i32 %458 to i64
  %460 = getelementptr inbounds double* %grid, i64 %459
  %461 = load double* %460, align 8
  %462 = fsub double %451, %461
  %463 = mul nsw i32 %y.0, 100
  %464 = add nsw i32 %x.0, %463
  %465 = mul nsw i32 %z.0, 100
  %466 = mul nsw i32 %465, 100
  %467 = add nsw i32 %464, %466
  %468 = mul nsw i32 20, %467
  %469 = add nsw i32 11, %468
  %470 = sext i32 %469 to i64
  %471 = getelementptr inbounds double* %grid, i64 %470
  %472 = load double* %471, align 8
  %473 = fadd double %462, %472
  %474 = mul nsw i32 %y.0, 100
  %475 = add nsw i32 %x.0, %474
  %476 = mul nsw i32 %z.0, 100
  %477 = mul nsw i32 %476, 100
  %478 = add nsw i32 %475, %477
  %479 = mul nsw i32 20, %478
  %480 = add nsw i32 12, %479
  %481 = sext i32 %480 to i64
  %482 = getelementptr inbounds double* %grid, i64 %481
  %483 = load double* %482, align 8
  %484 = fsub double %473, %483
  %485 = mul nsw i32 %y.0, 100
  %486 = add nsw i32 %x.0, %485
  %487 = mul nsw i32 %z.0, 100
  %488 = mul nsw i32 %487, 100
  %489 = add nsw i32 %486, %488
  %490 = mul nsw i32 20, %489
  %491 = add nsw i32 13, %490
  %492 = sext i32 %491 to i64
  %493 = getelementptr inbounds double* %grid, i64 %492
  %494 = load double* %493, align 8
  %495 = fadd double %484, %494
  %496 = mul nsw i32 %y.0, 100
  %497 = add nsw i32 %x.0, %496
  %498 = mul nsw i32 %z.0, 100
  %499 = mul nsw i32 %498, 100
  %500 = add nsw i32 %497, %499
  %501 = mul nsw i32 20, %500
  %502 = add nsw i32 14, %501
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds double* %grid, i64 %503
  %505 = load double* %504, align 8
  %506 = fsub double %495, %505
  %507 = mul nsw i32 %y.0, 100
  %508 = add nsw i32 %x.0, %507
  %509 = mul nsw i32 %z.0, 100
  %510 = mul nsw i32 %509, 100
  %511 = add nsw i32 %508, %510
  %512 = mul nsw i32 20, %511
  %513 = add nsw i32 15, %512
  %514 = sext i32 %513 to i64
  %515 = getelementptr inbounds double* %grid, i64 %514
  %516 = load double* %515, align 8
  %517 = fadd double %506, %516
  %518 = mul nsw i32 %y.0, 100
  %519 = add nsw i32 %x.0, %518
  %520 = mul nsw i32 %z.0, 100
  %521 = mul nsw i32 %520, 100
  %522 = add nsw i32 %519, %521
  %523 = mul nsw i32 20, %522
  %524 = add nsw i32 16, %523
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds double* %grid, i64 %525
  %527 = load double* %526, align 8
  %528 = fsub double %517, %527
  %529 = mul nsw i32 %y.0, 100
  %530 = add nsw i32 %x.0, %529
  %531 = mul nsw i32 %z.0, 100
  %532 = mul nsw i32 %531, 100
  %533 = add nsw i32 %530, %532
  %534 = mul nsw i32 20, %533
  %535 = add nsw i32 17, %534
  %536 = sext i32 %535 to i64
  %537 = getelementptr inbounds double* %grid, i64 %536
  %538 = load double* %537, align 8
  %539 = fadd double %528, %538
  %540 = mul nsw i32 %y.0, 100
  %541 = add nsw i32 %x.0, %540
  %542 = mul nsw i32 %z.0, 100
  %543 = mul nsw i32 %542, 100
  %544 = add nsw i32 %541, %543
  %545 = mul nsw i32 20, %544
  %546 = add nsw i32 18, %545
  %547 = sext i32 %546 to i64
  %548 = getelementptr inbounds double* %grid, i64 %547
  %549 = load double* %548, align 8
  %550 = fsub double %539, %549
  %551 = fptrunc double %550 to float
  store float %551, float* %uz, align 4
  %552 = load float* %ux, align 4
  %553 = fdiv float %552, %221
  store float %553, float* %ux, align 4
  %554 = load float* %uy, align 4
  %555 = fdiv float %554, %221
  store float %555, float* %uy, align 4
  %556 = load float* %uz, align 4
  %557 = fdiv float %556, %221
  store float %557, float* %uz, align 4
  %558 = icmp ne i32 %binary, 0
  br i1 %558, label %559, label %560

; <label>:559                                     ; preds = %12
  call void @storeValue(%struct._IO_FILE* %3, float* %ux)
  call void @storeValue(%struct._IO_FILE* %3, float* %uy)
  call void @storeValue(%struct._IO_FILE* %3, float* %uz)
  br label %568

; <label>:560                                     ; preds = %12
  %561 = load float* %ux, align 4
  %562 = fpext float %561 to double
  %563 = load float* %uy, align 4
  %564 = fpext float %563 to double
  %565 = load float* %uz, align 4
  %566 = fpext float %565 to double
  %567 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([10 x i8]* @.str6, i32 0, i32 0), double %562, double %564, double %566)
  br label %568

; <label>:568                                     ; preds = %560, %559
  br label %569

; <label>:569                                     ; preds = %568
  %570 = add nsw i32 %x.0, 1
  br label %10

; <label>:571                                     ; preds = %10
  br label %572

; <label>:572                                     ; preds = %571
  %573 = add nsw i32 %y.0, 1
  br label %7

; <label>:574                                     ; preds = %7
  br label %575

; <label>:575                                     ; preds = %574
  %576 = add nsw i32 %z.0, 1
  br label %4

; <label>:577                                     ; preds = %4
  %578 = call i32 @fclose(%struct._IO_FILE* %3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @storeValue(%struct._IO_FILE* %file, float* %v) #0 {
  %litteBigEndianTest = alloca i32, align 4
  %buffer = alloca [4 x i8], align 1
  store i32 1, i32* %litteBigEndianTest, align 4
  %1 = bitcast i32* %litteBigEndianTest to i8*
  %2 = load i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %0
  %6 = bitcast float* %v to i8*
  br label %7

; <label>:7                                       ; preds = %18, %5
  %i.0 = phi i32 [ 0, %5 ], [ %19, %18 ]
  %8 = sext i32 %i.0 to i64
  %9 = icmp ult i64 %8, 4
  br i1 %9, label %10, label %20

; <label>:10                                      ; preds = %7
  %11 = sext i32 %i.0 to i64
  %12 = sub i64 4, %11
  %13 = sub i64 %12, 1
  %14 = getelementptr inbounds i8* %6, i64 %13
  %15 = load i8* %14, align 1
  %16 = sext i32 %i.0 to i64
  %17 = getelementptr inbounds [4 x i8]* %buffer, i32 0, i64 %16
  store i8 %15, i8* %17, align 1
  br label %18

; <label>:18                                      ; preds = %10
  %19 = add nsw i32 %i.0, 1
  br label %7

; <label>:20                                      ; preds = %7
  %21 = getelementptr inbounds [4 x i8]* %buffer, i32 0, i32 0
  %22 = call i64 @fwrite(i8* %21, i64 4, i64 1, %struct._IO_FILE* %file)
  br label %26

; <label>:23                                      ; preds = %0
  %24 = bitcast float* %v to i8*
  %25 = call i64 @fwrite(i8* %24, i64 4, i64 1, %struct._IO_FILE* %file)
  br label %26

; <label>:26                                      ; preds = %23, %20
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @LBM_compareVelocityField(double* %grid, i8* %filename, i32 %binary) #0 {
  %fileUx = alloca float, align 4
  %fileUy = alloca float, align 4
  %fileUz = alloca float, align 4
  %1 = icmp ne i32 %binary, 0
  %2 = select i1 %1, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0)
  %3 = call %struct._IO_FILE* @fopen(i8* %filename, i8* %2)
  br label %4

; <label>:4                                       ; preds = %582, %0
  %z.0 = phi i32 [ 0, %0 ], [ %583, %582 ]
  %maxDiff2.0 = phi float [ 0xC6293E5940000000, %0 ], [ %maxDiff2.1, %582 ]
  %5 = icmp slt i32 %z.0, 130
  br i1 %5, label %6, label %584

; <label>:6                                       ; preds = %4
  br label %7

; <label>:7                                       ; preds = %579, %6
  %y.0 = phi i32 [ 0, %6 ], [ %580, %579 ]
  %maxDiff2.1 = phi float [ %maxDiff2.0, %6 ], [ %maxDiff2.2, %579 ]
  %8 = icmp slt i32 %y.0, 100
  br i1 %8, label %9, label %581

; <label>:9                                       ; preds = %7
  br label %10

; <label>:10                                      ; preds = %576, %9
  %x.0 = phi i32 [ 0, %9 ], [ %577, %576 ]
  %maxDiff2.2 = phi float [ %maxDiff2.1, %9 ], [ %maxDiff2.3, %576 ]
  %11 = icmp slt i32 %x.0, 100
  br i1 %11, label %12, label %578

; <label>:12                                      ; preds = %10
  %13 = mul nsw i32 %y.0, 100
  %14 = add nsw i32 %x.0, %13
  %15 = mul nsw i32 %z.0, 100
  %16 = mul nsw i32 %15, 100
  %17 = add nsw i32 %14, %16
  %18 = mul nsw i32 20, %17
  %19 = add nsw i32 0, %18
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds double* %grid, i64 %20
  %22 = load double* %21, align 8
  %23 = mul nsw i32 %y.0, 100
  %24 = add nsw i32 %x.0, %23
  %25 = mul nsw i32 %z.0, 100
  %26 = mul nsw i32 %25, 100
  %27 = add nsw i32 %24, %26
  %28 = mul nsw i32 20, %27
  %29 = add nsw i32 1, %28
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double* %grid, i64 %30
  %32 = load double* %31, align 8
  %33 = fadd double %22, %32
  %34 = mul nsw i32 %y.0, 100
  %35 = add nsw i32 %x.0, %34
  %36 = mul nsw i32 %z.0, 100
  %37 = mul nsw i32 %36, 100
  %38 = add nsw i32 %35, %37
  %39 = mul nsw i32 20, %38
  %40 = add nsw i32 2, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double* %grid, i64 %41
  %43 = load double* %42, align 8
  %44 = fadd double %33, %43
  %45 = mul nsw i32 %y.0, 100
  %46 = add nsw i32 %x.0, %45
  %47 = mul nsw i32 %z.0, 100
  %48 = mul nsw i32 %47, 100
  %49 = add nsw i32 %46, %48
  %50 = mul nsw i32 20, %49
  %51 = add nsw i32 3, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double* %grid, i64 %52
  %54 = load double* %53, align 8
  %55 = fadd double %44, %54
  %56 = mul nsw i32 %y.0, 100
  %57 = add nsw i32 %x.0, %56
  %58 = mul nsw i32 %z.0, 100
  %59 = mul nsw i32 %58, 100
  %60 = add nsw i32 %57, %59
  %61 = mul nsw i32 20, %60
  %62 = add nsw i32 4, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double* %grid, i64 %63
  %65 = load double* %64, align 8
  %66 = fadd double %55, %65
  %67 = mul nsw i32 %y.0, 100
  %68 = add nsw i32 %x.0, %67
  %69 = mul nsw i32 %z.0, 100
  %70 = mul nsw i32 %69, 100
  %71 = add nsw i32 %68, %70
  %72 = mul nsw i32 20, %71
  %73 = add nsw i32 5, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double* %grid, i64 %74
  %76 = load double* %75, align 8
  %77 = fadd double %66, %76
  %78 = mul nsw i32 %y.0, 100
  %79 = add nsw i32 %x.0, %78
  %80 = mul nsw i32 %z.0, 100
  %81 = mul nsw i32 %80, 100
  %82 = add nsw i32 %79, %81
  %83 = mul nsw i32 20, %82
  %84 = add nsw i32 6, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds double* %grid, i64 %85
  %87 = load double* %86, align 8
  %88 = fadd double %77, %87
  %89 = mul nsw i32 %y.0, 100
  %90 = add nsw i32 %x.0, %89
  %91 = mul nsw i32 %z.0, 100
  %92 = mul nsw i32 %91, 100
  %93 = add nsw i32 %90, %92
  %94 = mul nsw i32 20, %93
  %95 = add nsw i32 7, %94
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds double* %grid, i64 %96
  %98 = load double* %97, align 8
  %99 = fadd double %88, %98
  %100 = mul nsw i32 %y.0, 100
  %101 = add nsw i32 %x.0, %100
  %102 = mul nsw i32 %z.0, 100
  %103 = mul nsw i32 %102, 100
  %104 = add nsw i32 %101, %103
  %105 = mul nsw i32 20, %104
  %106 = add nsw i32 8, %105
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double* %grid, i64 %107
  %109 = load double* %108, align 8
  %110 = fadd double %99, %109
  %111 = mul nsw i32 %y.0, 100
  %112 = add nsw i32 %x.0, %111
  %113 = mul nsw i32 %z.0, 100
  %114 = mul nsw i32 %113, 100
  %115 = add nsw i32 %112, %114
  %116 = mul nsw i32 20, %115
  %117 = add nsw i32 9, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double* %grid, i64 %118
  %120 = load double* %119, align 8
  %121 = fadd double %110, %120
  %122 = mul nsw i32 %y.0, 100
  %123 = add nsw i32 %x.0, %122
  %124 = mul nsw i32 %z.0, 100
  %125 = mul nsw i32 %124, 100
  %126 = add nsw i32 %123, %125
  %127 = mul nsw i32 20, %126
  %128 = add nsw i32 10, %127
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds double* %grid, i64 %129
  %131 = load double* %130, align 8
  %132 = fadd double %121, %131
  %133 = mul nsw i32 %y.0, 100
  %134 = add nsw i32 %x.0, %133
  %135 = mul nsw i32 %z.0, 100
  %136 = mul nsw i32 %135, 100
  %137 = add nsw i32 %134, %136
  %138 = mul nsw i32 20, %137
  %139 = add nsw i32 11, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds double* %grid, i64 %140
  %142 = load double* %141, align 8
  %143 = fadd double %132, %142
  %144 = mul nsw i32 %y.0, 100
  %145 = add nsw i32 %x.0, %144
  %146 = mul nsw i32 %z.0, 100
  %147 = mul nsw i32 %146, 100
  %148 = add nsw i32 %145, %147
  %149 = mul nsw i32 20, %148
  %150 = add nsw i32 12, %149
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds double* %grid, i64 %151
  %153 = load double* %152, align 8
  %154 = fadd double %143, %153
  %155 = mul nsw i32 %y.0, 100
  %156 = add nsw i32 %x.0, %155
  %157 = mul nsw i32 %z.0, 100
  %158 = mul nsw i32 %157, 100
  %159 = add nsw i32 %156, %158
  %160 = mul nsw i32 20, %159
  %161 = add nsw i32 13, %160
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds double* %grid, i64 %162
  %164 = load double* %163, align 8
  %165 = fadd double %154, %164
  %166 = mul nsw i32 %y.0, 100
  %167 = add nsw i32 %x.0, %166
  %168 = mul nsw i32 %z.0, 100
  %169 = mul nsw i32 %168, 100
  %170 = add nsw i32 %167, %169
  %171 = mul nsw i32 20, %170
  %172 = add nsw i32 14, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds double* %grid, i64 %173
  %175 = load double* %174, align 8
  %176 = fadd double %165, %175
  %177 = mul nsw i32 %y.0, 100
  %178 = add nsw i32 %x.0, %177
  %179 = mul nsw i32 %z.0, 100
  %180 = mul nsw i32 %179, 100
  %181 = add nsw i32 %178, %180
  %182 = mul nsw i32 20, %181
  %183 = add nsw i32 15, %182
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds double* %grid, i64 %184
  %186 = load double* %185, align 8
  %187 = fadd double %176, %186
  %188 = mul nsw i32 %y.0, 100
  %189 = add nsw i32 %x.0, %188
  %190 = mul nsw i32 %z.0, 100
  %191 = mul nsw i32 %190, 100
  %192 = add nsw i32 %189, %191
  %193 = mul nsw i32 20, %192
  %194 = add nsw i32 16, %193
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds double* %grid, i64 %195
  %197 = load double* %196, align 8
  %198 = fadd double %187, %197
  %199 = mul nsw i32 %y.0, 100
  %200 = add nsw i32 %x.0, %199
  %201 = mul nsw i32 %z.0, 100
  %202 = mul nsw i32 %201, 100
  %203 = add nsw i32 %200, %202
  %204 = mul nsw i32 20, %203
  %205 = add nsw i32 17, %204
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds double* %grid, i64 %206
  %208 = load double* %207, align 8
  %209 = fadd double %198, %208
  %210 = mul nsw i32 %y.0, 100
  %211 = add nsw i32 %x.0, %210
  %212 = mul nsw i32 %z.0, 100
  %213 = mul nsw i32 %212, 100
  %214 = add nsw i32 %211, %213
  %215 = mul nsw i32 20, %214
  %216 = add nsw i32 18, %215
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds double* %grid, i64 %217
  %219 = load double* %218, align 8
  %220 = fadd double %209, %219
  %221 = mul nsw i32 %y.0, 100
  %222 = add nsw i32 %x.0, %221
  %223 = mul nsw i32 %z.0, 100
  %224 = mul nsw i32 %223, 100
  %225 = add nsw i32 %222, %224
  %226 = mul nsw i32 20, %225
  %227 = add nsw i32 3, %226
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds double* %grid, i64 %228
  %230 = load double* %229, align 8
  %231 = mul nsw i32 %y.0, 100
  %232 = add nsw i32 %x.0, %231
  %233 = mul nsw i32 %z.0, 100
  %234 = mul nsw i32 %233, 100
  %235 = add nsw i32 %232, %234
  %236 = mul nsw i32 20, %235
  %237 = add nsw i32 4, %236
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds double* %grid, i64 %238
  %240 = load double* %239, align 8
  %241 = fsub double %230, %240
  %242 = mul nsw i32 %y.0, 100
  %243 = add nsw i32 %x.0, %242
  %244 = mul nsw i32 %z.0, 100
  %245 = mul nsw i32 %244, 100
  %246 = add nsw i32 %243, %245
  %247 = mul nsw i32 20, %246
  %248 = add nsw i32 7, %247
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds double* %grid, i64 %249
  %251 = load double* %250, align 8
  %252 = fadd double %241, %251
  %253 = mul nsw i32 %y.0, 100
  %254 = add nsw i32 %x.0, %253
  %255 = mul nsw i32 %z.0, 100
  %256 = mul nsw i32 %255, 100
  %257 = add nsw i32 %254, %256
  %258 = mul nsw i32 20, %257
  %259 = add nsw i32 8, %258
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds double* %grid, i64 %260
  %262 = load double* %261, align 8
  %263 = fsub double %252, %262
  %264 = mul nsw i32 %y.0, 100
  %265 = add nsw i32 %x.0, %264
  %266 = mul nsw i32 %z.0, 100
  %267 = mul nsw i32 %266, 100
  %268 = add nsw i32 %265, %267
  %269 = mul nsw i32 20, %268
  %270 = add nsw i32 9, %269
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds double* %grid, i64 %271
  %273 = load double* %272, align 8
  %274 = fadd double %263, %273
  %275 = mul nsw i32 %y.0, 100
  %276 = add nsw i32 %x.0, %275
  %277 = mul nsw i32 %z.0, 100
  %278 = mul nsw i32 %277, 100
  %279 = add nsw i32 %276, %278
  %280 = mul nsw i32 20, %279
  %281 = add nsw i32 10, %280
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds double* %grid, i64 %282
  %284 = load double* %283, align 8
  %285 = fsub double %274, %284
  %286 = mul nsw i32 %y.0, 100
  %287 = add nsw i32 %x.0, %286
  %288 = mul nsw i32 %z.0, 100
  %289 = mul nsw i32 %288, 100
  %290 = add nsw i32 %287, %289
  %291 = mul nsw i32 20, %290
  %292 = add nsw i32 15, %291
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds double* %grid, i64 %293
  %295 = load double* %294, align 8
  %296 = fadd double %285, %295
  %297 = mul nsw i32 %y.0, 100
  %298 = add nsw i32 %x.0, %297
  %299 = mul nsw i32 %z.0, 100
  %300 = mul nsw i32 %299, 100
  %301 = add nsw i32 %298, %300
  %302 = mul nsw i32 20, %301
  %303 = add nsw i32 16, %302
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds double* %grid, i64 %304
  %306 = load double* %305, align 8
  %307 = fadd double %296, %306
  %308 = mul nsw i32 %y.0, 100
  %309 = add nsw i32 %x.0, %308
  %310 = mul nsw i32 %z.0, 100
  %311 = mul nsw i32 %310, 100
  %312 = add nsw i32 %309, %311
  %313 = mul nsw i32 20, %312
  %314 = add nsw i32 17, %313
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds double* %grid, i64 %315
  %317 = load double* %316, align 8
  %318 = fsub double %307, %317
  %319 = mul nsw i32 %y.0, 100
  %320 = add nsw i32 %x.0, %319
  %321 = mul nsw i32 %z.0, 100
  %322 = mul nsw i32 %321, 100
  %323 = add nsw i32 %320, %322
  %324 = mul nsw i32 20, %323
  %325 = add nsw i32 18, %324
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds double* %grid, i64 %326
  %328 = load double* %327, align 8
  %329 = fsub double %318, %328
  %330 = mul nsw i32 %y.0, 100
  %331 = add nsw i32 %x.0, %330
  %332 = mul nsw i32 %z.0, 100
  %333 = mul nsw i32 %332, 100
  %334 = add nsw i32 %331, %333
  %335 = mul nsw i32 20, %334
  %336 = add nsw i32 1, %335
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds double* %grid, i64 %337
  %339 = load double* %338, align 8
  %340 = mul nsw i32 %y.0, 100
  %341 = add nsw i32 %x.0, %340
  %342 = mul nsw i32 %z.0, 100
  %343 = mul nsw i32 %342, 100
  %344 = add nsw i32 %341, %343
  %345 = mul nsw i32 20, %344
  %346 = add nsw i32 2, %345
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds double* %grid, i64 %347
  %349 = load double* %348, align 8
  %350 = fsub double %339, %349
  %351 = mul nsw i32 %y.0, 100
  %352 = add nsw i32 %x.0, %351
  %353 = mul nsw i32 %z.0, 100
  %354 = mul nsw i32 %353, 100
  %355 = add nsw i32 %352, %354
  %356 = mul nsw i32 20, %355
  %357 = add nsw i32 7, %356
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds double* %grid, i64 %358
  %360 = load double* %359, align 8
  %361 = fadd double %350, %360
  %362 = mul nsw i32 %y.0, 100
  %363 = add nsw i32 %x.0, %362
  %364 = mul nsw i32 %z.0, 100
  %365 = mul nsw i32 %364, 100
  %366 = add nsw i32 %363, %365
  %367 = mul nsw i32 20, %366
  %368 = add nsw i32 8, %367
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds double* %grid, i64 %369
  %371 = load double* %370, align 8
  %372 = fadd double %361, %371
  %373 = mul nsw i32 %y.0, 100
  %374 = add nsw i32 %x.0, %373
  %375 = mul nsw i32 %z.0, 100
  %376 = mul nsw i32 %375, 100
  %377 = add nsw i32 %374, %376
  %378 = mul nsw i32 20, %377
  %379 = add nsw i32 9, %378
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds double* %grid, i64 %380
  %382 = load double* %381, align 8
  %383 = fsub double %372, %382
  %384 = mul nsw i32 %y.0, 100
  %385 = add nsw i32 %x.0, %384
  %386 = mul nsw i32 %z.0, 100
  %387 = mul nsw i32 %386, 100
  %388 = add nsw i32 %385, %387
  %389 = mul nsw i32 20, %388
  %390 = add nsw i32 10, %389
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds double* %grid, i64 %391
  %393 = load double* %392, align 8
  %394 = fsub double %383, %393
  %395 = mul nsw i32 %y.0, 100
  %396 = add nsw i32 %x.0, %395
  %397 = mul nsw i32 %z.0, 100
  %398 = mul nsw i32 %397, 100
  %399 = add nsw i32 %396, %398
  %400 = mul nsw i32 20, %399
  %401 = add nsw i32 11, %400
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds double* %grid, i64 %402
  %404 = load double* %403, align 8
  %405 = fadd double %394, %404
  %406 = mul nsw i32 %y.0, 100
  %407 = add nsw i32 %x.0, %406
  %408 = mul nsw i32 %z.0, 100
  %409 = mul nsw i32 %408, 100
  %410 = add nsw i32 %407, %409
  %411 = mul nsw i32 20, %410
  %412 = add nsw i32 12, %411
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds double* %grid, i64 %413
  %415 = load double* %414, align 8
  %416 = fadd double %405, %415
  %417 = mul nsw i32 %y.0, 100
  %418 = add nsw i32 %x.0, %417
  %419 = mul nsw i32 %z.0, 100
  %420 = mul nsw i32 %419, 100
  %421 = add nsw i32 %418, %420
  %422 = mul nsw i32 20, %421
  %423 = add nsw i32 13, %422
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds double* %grid, i64 %424
  %426 = load double* %425, align 8
  %427 = fsub double %416, %426
  %428 = mul nsw i32 %y.0, 100
  %429 = add nsw i32 %x.0, %428
  %430 = mul nsw i32 %z.0, 100
  %431 = mul nsw i32 %430, 100
  %432 = add nsw i32 %429, %431
  %433 = mul nsw i32 20, %432
  %434 = add nsw i32 14, %433
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds double* %grid, i64 %435
  %437 = load double* %436, align 8
  %438 = fsub double %427, %437
  %439 = mul nsw i32 %y.0, 100
  %440 = add nsw i32 %x.0, %439
  %441 = mul nsw i32 %z.0, 100
  %442 = mul nsw i32 %441, 100
  %443 = add nsw i32 %440, %442
  %444 = mul nsw i32 20, %443
  %445 = add nsw i32 5, %444
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds double* %grid, i64 %446
  %448 = load double* %447, align 8
  %449 = mul nsw i32 %y.0, 100
  %450 = add nsw i32 %x.0, %449
  %451 = mul nsw i32 %z.0, 100
  %452 = mul nsw i32 %451, 100
  %453 = add nsw i32 %450, %452
  %454 = mul nsw i32 20, %453
  %455 = add nsw i32 6, %454
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds double* %grid, i64 %456
  %458 = load double* %457, align 8
  %459 = fsub double %448, %458
  %460 = mul nsw i32 %y.0, 100
  %461 = add nsw i32 %x.0, %460
  %462 = mul nsw i32 %z.0, 100
  %463 = mul nsw i32 %462, 100
  %464 = add nsw i32 %461, %463
  %465 = mul nsw i32 20, %464
  %466 = add nsw i32 11, %465
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds double* %grid, i64 %467
  %469 = load double* %468, align 8
  %470 = fadd double %459, %469
  %471 = mul nsw i32 %y.0, 100
  %472 = add nsw i32 %x.0, %471
  %473 = mul nsw i32 %z.0, 100
  %474 = mul nsw i32 %473, 100
  %475 = add nsw i32 %472, %474
  %476 = mul nsw i32 20, %475
  %477 = add nsw i32 12, %476
  %478 = sext i32 %477 to i64
  %479 = getelementptr inbounds double* %grid, i64 %478
  %480 = load double* %479, align 8
  %481 = fsub double %470, %480
  %482 = mul nsw i32 %y.0, 100
  %483 = add nsw i32 %x.0, %482
  %484 = mul nsw i32 %z.0, 100
  %485 = mul nsw i32 %484, 100
  %486 = add nsw i32 %483, %485
  %487 = mul nsw i32 20, %486
  %488 = add nsw i32 13, %487
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds double* %grid, i64 %489
  %491 = load double* %490, align 8
  %492 = fadd double %481, %491
  %493 = mul nsw i32 %y.0, 100
  %494 = add nsw i32 %x.0, %493
  %495 = mul nsw i32 %z.0, 100
  %496 = mul nsw i32 %495, 100
  %497 = add nsw i32 %494, %496
  %498 = mul nsw i32 20, %497
  %499 = add nsw i32 14, %498
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds double* %grid, i64 %500
  %502 = load double* %501, align 8
  %503 = fsub double %492, %502
  %504 = mul nsw i32 %y.0, 100
  %505 = add nsw i32 %x.0, %504
  %506 = mul nsw i32 %z.0, 100
  %507 = mul nsw i32 %506, 100
  %508 = add nsw i32 %505, %507
  %509 = mul nsw i32 20, %508
  %510 = add nsw i32 15, %509
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds double* %grid, i64 %511
  %513 = load double* %512, align 8
  %514 = fadd double %503, %513
  %515 = mul nsw i32 %y.0, 100
  %516 = add nsw i32 %x.0, %515
  %517 = mul nsw i32 %z.0, 100
  %518 = mul nsw i32 %517, 100
  %519 = add nsw i32 %516, %518
  %520 = mul nsw i32 20, %519
  %521 = add nsw i32 16, %520
  %522 = sext i32 %521 to i64
  %523 = getelementptr inbounds double* %grid, i64 %522
  %524 = load double* %523, align 8
  %525 = fsub double %514, %524
  %526 = mul nsw i32 %y.0, 100
  %527 = add nsw i32 %x.0, %526
  %528 = mul nsw i32 %z.0, 100
  %529 = mul nsw i32 %528, 100
  %530 = add nsw i32 %527, %529
  %531 = mul nsw i32 20, %530
  %532 = add nsw i32 17, %531
  %533 = sext i32 %532 to i64
  %534 = getelementptr inbounds double* %grid, i64 %533
  %535 = load double* %534, align 8
  %536 = fadd double %525, %535
  %537 = mul nsw i32 %y.0, 100
  %538 = add nsw i32 %x.0, %537
  %539 = mul nsw i32 %z.0, 100
  %540 = mul nsw i32 %539, 100
  %541 = add nsw i32 %538, %540
  %542 = mul nsw i32 20, %541
  %543 = add nsw i32 18, %542
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds double* %grid, i64 %544
  %546 = load double* %545, align 8
  %547 = fsub double %536, %546
  %548 = fdiv double %329, %220
  %549 = fdiv double %438, %220
  %550 = fdiv double %547, %220
  %551 = icmp ne i32 %binary, 0
  br i1 %551, label %552, label %553

; <label>:552                                     ; preds = %12
  call void @loadValue(%struct._IO_FILE* %3, float* %fileUx)
  call void @loadValue(%struct._IO_FILE* %3, float* %fileUy)
  call void @loadValue(%struct._IO_FILE* %3, float* %fileUz)
  br label %555

; <label>:553                                     ; preds = %12
  %554 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([10 x i8]* @.str8, i32 0, i32 0), float* %fileUx, float* %fileUy, float* %fileUz)
  br label %555

; <label>:555                                     ; preds = %553, %552
  %556 = load float* %fileUx, align 4
  %557 = fpext float %556 to double
  %558 = fsub double %548, %557
  %559 = fptrunc double %558 to float
  %560 = load float* %fileUy, align 4
  %561 = fpext float %560 to double
  %562 = fsub double %549, %561
  %563 = fptrunc double %562 to float
  %564 = load float* %fileUz, align 4
  %565 = fpext float %564 to double
  %566 = fsub double %550, %565
  %567 = fptrunc double %566 to float
  %568 = fmul float %559, %559
  %569 = fmul float %563, %563
  %570 = fadd float %568, %569
  %571 = fmul float %567, %567
  %572 = fadd float %570, %571
  %573 = fcmp ogt float %572, %maxDiff2.2
  br i1 %573, label %574, label %575

; <label>:574                                     ; preds = %555
  br label %575

; <label>:575                                     ; preds = %574, %555
  %maxDiff2.3 = phi float [ %572, %574 ], [ %maxDiff2.2, %555 ]
  br label %576

; <label>:576                                     ; preds = %575
  %577 = add nsw i32 %x.0, 1
  br label %10

; <label>:578                                     ; preds = %10
  br label %579

; <label>:579                                     ; preds = %578
  %580 = add nsw i32 %y.0, 1
  br label %7

; <label>:581                                     ; preds = %7
  br label %582

; <label>:582                                     ; preds = %581
  %583 = add nsw i32 %z.0, 1
  br label %4

; <label>:584                                     ; preds = %4
  %585 = fpext float %maxDiff2.0 to double
  %586 = call double @sqrt(double %585) #4
  %587 = fpext float %maxDiff2.0 to double
  %588 = call double @sqrt(double %587) #4
  %589 = fcmp ogt double %588, 1.000000e-05
  %590 = select i1 %589, i8* getelementptr inbounds ([18 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0)
  %591 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([50 x i8]* @.str9, i32 0, i32 0), double %586, i8* %590)
  %592 = call i32 @fclose(%struct._IO_FILE* %3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @loadValue(%struct._IO_FILE* %file, float* %v) #0 {
  %litteBigEndianTest = alloca i32, align 4
  %buffer = alloca [4 x i8], align 1
  store i32 1, i32* %litteBigEndianTest, align 4
  %1 = bitcast i32* %litteBigEndianTest to i8*
  %2 = load i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %0
  %6 = bitcast float* %v to i8*
  %7 = getelementptr inbounds [4 x i8]* %buffer, i32 0, i32 0
  %8 = call i64 @fread(i8* %7, i64 4, i64 1, %struct._IO_FILE* %file)
  br label %9

; <label>:9                                       ; preds = %20, %5
  %i.0 = phi i32 [ 0, %5 ], [ %21, %20 ]
  %10 = sext i32 %i.0 to i64
  %11 = icmp ult i64 %10, 4
  br i1 %11, label %12, label %22

; <label>:12                                      ; preds = %9
  %13 = sext i32 %i.0 to i64
  %14 = sub i64 4, %13
  %15 = sub i64 %14, 1
  %16 = getelementptr inbounds [4 x i8]* %buffer, i32 0, i64 %15
  %17 = load i8* %16, align 1
  %18 = sext i32 %i.0 to i64
  %19 = getelementptr inbounds i8* %6, i64 %18
  store i8 %17, i8* %19, align 1
  br label %20

; <label>:20                                      ; preds = %12
  %21 = add nsw i32 %i.0, 1
  br label %9

; <label>:22                                      ; preds = %9
  br label %26

; <label>:23                                      ; preds = %0
  %24 = bitcast float* %v to i8*
  %25 = call i64 @fread(i8* %24, i64 4, i64 1, %struct._IO_FILE* %file)
  br label %26

; <label>:26                                      ; preds = %23, %22
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
