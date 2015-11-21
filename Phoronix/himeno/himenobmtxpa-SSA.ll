; ModuleID = 'himenobmtxpa.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Mat = type { float*, i32, i32, i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@omega = global float 0x3FE99999A0000000, align 4
@.str = private unnamed_addr constant [15 x i8] c"For example: \0A\00", align 1
@.str1 = private unnamed_addr constant [27 x i8] c" Grid-size= XS (32x32x64)\0A\00", align 1
@.str2 = private unnamed_addr constant [21 x i8] c"\09    S  (64x64x128)\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"\09    M  (128x128x256)\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"\09    L  (256x256x512)\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"\09    XL (512x512x1024)\0A\0A\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c"Grid-size = \00", align 1
@.str7 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str9 = private unnamed_addr constant [34 x i8] c"mimax = %d mjmax = %d mkmax = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [30 x i8] c"imax = %d jmax = %d kmax =%d\0A\00", align 1
@p = common global %struct.Mat zeroinitializer, align 8
@bnd = common global %struct.Mat zeroinitializer, align 8
@wrk1 = common global %struct.Mat zeroinitializer, align 8
@wrk2 = common global %struct.Mat zeroinitializer, align 8
@a = common global %struct.Mat zeroinitializer, align 8
@b = common global %struct.Mat zeroinitializer, align 8
@c = common global %struct.Mat zeroinitializer, align 8
@.str11 = private unnamed_addr constant [39 x i8] c" Start rehearsal measurement process.\0A\00", align 1
@.str12 = private unnamed_addr constant [40 x i8] c" Measure the performance in %d times.\0A\0A\00", align 1
@.str13 = private unnamed_addr constant [29 x i8] c" MFLOPS: %f time(s): %f %e\0A\0A\00", align 1
@.str14 = private unnamed_addr constant [45 x i8] c" Now, start the actual measurement process.\0A\00", align 1
@.str15 = private unnamed_addr constant [39 x i8] c" The loop will be excuted in %d times\0A\00", align 1
@.str16 = private unnamed_addr constant [35 x i8] c" This will take about one minute.\0A\00", align 1
@.str17 = private unnamed_addr constant [20 x i8] c" Wait for a while\0A\0A\00", align 1
@.str18 = private unnamed_addr constant [29 x i8] c" Loop executed for %d times\0A\00", align 1
@.str19 = private unnamed_addr constant [13 x i8] c" Gosa : %e \0A\00", align 1
@.str20 = private unnamed_addr constant [32 x i8] c" MFLOPS measured : %f\09cpu : %f\0A\00", align 1
@.str21 = private unnamed_addr constant [57 x i8] c" Score based on Pentium III 600MHz using Fortran 77: %f\0A\00", align 1
@.str22 = private unnamed_addr constant [3 x i8] c"XS\00", align 1
@.str23 = private unnamed_addr constant [3 x i8] c"xs\00", align 1
@.str24 = private unnamed_addr constant [2 x i8] c"S\00", align 1
@.str25 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str26 = private unnamed_addr constant [2 x i8] c"M\00", align 1
@.str27 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str28 = private unnamed_addr constant [2 x i8] c"L\00", align 1
@.str29 = private unnamed_addr constant [2 x i8] c"l\00", align 1
@.str30 = private unnamed_addr constant [3 x i8] c"XL\00", align 1
@.str31 = private unnamed_addr constant [3 x i8] c"xl\00", align 1
@.str32 = private unnamed_addr constant [28 x i8] c"Invalid input character !!\0A\00", align 1
@second.base_sec = internal global i32 0, align 4
@second.base_usec = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %msize = alloca [3 x i32], align 4
  %size = alloca [10 x i8], align 1
  %1 = icmp eq i32 %argc, 2
  br i1 %1, label %2, label %7

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds [10 x i8]* %size, i32 0, i32 0
  %4 = getelementptr inbounds i8** %argv, i64 1
  %5 = load i8** %4, align 8
  %6 = call i8* @strcpy(i8* %3, i8* %5) #5
  br label %18

; <label>:7                                       ; preds = %0
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0))
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i32 0, i32 0))
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0))
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0))
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0))
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0))
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str6, i32 0, i32 0))
  %15 = getelementptr inbounds [10 x i8]* %size, i32 0, i32 0
  %16 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0), i8* %15)
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0))
  br label %18

; <label>:18                                      ; preds = %7, %2
  %19 = getelementptr inbounds [3 x i32]* %msize, i32 0, i32 0
  %20 = getelementptr inbounds [10 x i8]* %size, i32 0, i32 0
  call void @set_param(i32* %19, i8* %20)
  %21 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 0
  %22 = load i32* %21, align 4
  %23 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 1
  %24 = load i32* %23, align 4
  %25 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 2
  %26 = load i32* %25, align 4
  %27 = sub nsw i32 %22, 1
  %28 = sub nsw i32 %24, 1
  %29 = sub nsw i32 %26, 1
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str9, i32 0, i32 0), i32 %22, i32 %24, i32 %26)
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str10, i32 0, i32 0), i32 %27, i32 %28, i32 %29)
  %32 = call i32 @newMat(%struct.Mat* @p, i32 1, i32 %22, i32 %24, i32 %26)
  %33 = call i32 @newMat(%struct.Mat* @bnd, i32 1, i32 %22, i32 %24, i32 %26)
  %34 = call i32 @newMat(%struct.Mat* @wrk1, i32 1, i32 %22, i32 %24, i32 %26)
  %35 = call i32 @newMat(%struct.Mat* @wrk2, i32 1, i32 %22, i32 %24, i32 %26)
  %36 = call i32 @newMat(%struct.Mat* @a, i32 4, i32 %22, i32 %24, i32 %26)
  %37 = call i32 @newMat(%struct.Mat* @b, i32 3, i32 %22, i32 %24, i32 %26)
  %38 = call i32 @newMat(%struct.Mat* @c, i32 3, i32 %22, i32 %24, i32 %26)
  call void @mat_set_init(%struct.Mat* @p)
  call void @mat_set(%struct.Mat* @bnd, i32 0, float 1.000000e+00)
  call void @mat_set(%struct.Mat* @wrk1, i32 0, float 0.000000e+00)
  call void @mat_set(%struct.Mat* @wrk2, i32 0, float 0.000000e+00)
  call void @mat_set(%struct.Mat* @a, i32 0, float 1.000000e+00)
  call void @mat_set(%struct.Mat* @a, i32 1, float 1.000000e+00)
  call void @mat_set(%struct.Mat* @a, i32 2, float 1.000000e+00)
  call void @mat_set(%struct.Mat* @a, i32 3, float 0x3FC5555560000000)
  call void @mat_set(%struct.Mat* @b, i32 0, float 0.000000e+00)
  call void @mat_set(%struct.Mat* @b, i32 1, float 0.000000e+00)
  call void @mat_set(%struct.Mat* @b, i32 2, float 0.000000e+00)
  call void @mat_set(%struct.Mat* @c, i32 0, float 1.000000e+00)
  call void @mat_set(%struct.Mat* @c, i32 1, float 1.000000e+00)
  call void @mat_set(%struct.Mat* @c, i32 2, float 1.000000e+00)
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str11, i32 0, i32 0))
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str12, i32 0, i32 0), i32 3)
  %41 = call double @second()
  %42 = call float @jacobi(i32 3, %struct.Mat* @a, %struct.Mat* @b, %struct.Mat* @c, %struct.Mat* @p, %struct.Mat* @bnd, %struct.Mat* @wrk1, %struct.Mat* @wrk2)
  %43 = call double @second()
  %44 = fsub double %43, %41
  %45 = call double @fflop(i32 %27, i32 %28, i32 %29)
  %46 = call double @mflops(i32 3, double %44, double %45)
  %47 = fpext float %42 to double
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), double %46, double %44, double %47)
  %49 = fpext float 6.000000e+01 to double
  %50 = fdiv double %44, 3.000000e+00
  %51 = fdiv double %49, %50
  %52 = fptosi double %51 to i32
  %53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str14, i32 0, i32 0))
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str15, i32 0, i32 0), i32 %52)
  %55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str16, i32 0, i32 0))
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str17, i32 0, i32 0))
  %57 = call double @second()
  %58 = call float @jacobi(i32 %52, %struct.Mat* @a, %struct.Mat* @b, %struct.Mat* @c, %struct.Mat* @p, %struct.Mat* @bnd, %struct.Mat* @wrk1, %struct.Mat* @wrk2)
  %59 = call double @second()
  %60 = fsub double %59, %57
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str18, i32 0, i32 0), i32 %52)
  %62 = fpext float %58 to double
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str19, i32 0, i32 0), double %62)
  %64 = call double @mflops(i32 %52, double %60, double %45)
  %65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str20, i32 0, i32 0), double %64, double %60)
  %66 = call double @mflops(i32 %52, double %60, double %45)
  %67 = fdiv double %66, 8.200000e+01
  %68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([57 x i8]* @.str21, i32 0, i32 0), double %67, i32 84)
  call void @clearMat(%struct.Mat* @p)
  call void @clearMat(%struct.Mat* @bnd)
  call void @clearMat(%struct.Mat* @wrk1)
  call void @clearMat(%struct.Mat* @wrk2)
  call void @clearMat(%struct.Mat* @a)
  call void @clearMat(%struct.Mat* @b)
  call void @clearMat(%struct.Mat* @c)
  ret i32 0
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

declare i32 @printf(i8*, ...) #2

declare i32 @__isoc99_scanf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @set_param(i32* %is, i8* %size) #0 {
  %1 = call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str22, i32 0, i32 0)) #6
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %6

; <label>:3                                       ; preds = %0
  %4 = call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str23, i32 0, i32 0)) #6
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %10, label %6

; <label>:6                                       ; preds = %3, %0
  %7 = getelementptr inbounds i32* %is, i64 0
  store i32 32, i32* %7, align 4
  %8 = getelementptr inbounds i32* %is, i64 1
  store i32 32, i32* %8, align 4
  %9 = getelementptr inbounds i32* %is, i64 2
  store i32 64, i32* %9, align 4
  br label %52

; <label>:10                                      ; preds = %3
  %11 = call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str24, i32 0, i32 0)) #6
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %16

; <label>:13                                      ; preds = %10
  %14 = call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str25, i32 0, i32 0)) #6
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %20, label %16

; <label>:16                                      ; preds = %13, %10
  %17 = getelementptr inbounds i32* %is, i64 0
  store i32 64, i32* %17, align 4
  %18 = getelementptr inbounds i32* %is, i64 1
  store i32 64, i32* %18, align 4
  %19 = getelementptr inbounds i32* %is, i64 2
  store i32 128, i32* %19, align 4
  br label %52

; <label>:20                                      ; preds = %13
  %21 = call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str26, i32 0, i32 0)) #6
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %20
  %24 = call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str27, i32 0, i32 0)) #6
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %30, label %26

; <label>:26                                      ; preds = %23, %20
  %27 = getelementptr inbounds i32* %is, i64 0
  store i32 128, i32* %27, align 4
  %28 = getelementptr inbounds i32* %is, i64 1
  store i32 128, i32* %28, align 4
  %29 = getelementptr inbounds i32* %is, i64 2
  store i32 256, i32* %29, align 4
  br label %52

; <label>:30                                      ; preds = %23
  %31 = call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str28, i32 0, i32 0)) #6
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %36

; <label>:33                                      ; preds = %30
  %34 = call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str29, i32 0, i32 0)) #6
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %40, label %36

; <label>:36                                      ; preds = %33, %30
  %37 = getelementptr inbounds i32* %is, i64 0
  store i32 256, i32* %37, align 4
  %38 = getelementptr inbounds i32* %is, i64 1
  store i32 256, i32* %38, align 4
  %39 = getelementptr inbounds i32* %is, i64 2
  store i32 512, i32* %39, align 4
  br label %52

; <label>:40                                      ; preds = %33
  %41 = call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str30, i32 0, i32 0)) #6
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %46

; <label>:43                                      ; preds = %40
  %44 = call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str31, i32 0, i32 0)) #6
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %50, label %46

; <label>:46                                      ; preds = %43, %40
  %47 = getelementptr inbounds i32* %is, i64 0
  store i32 512, i32* %47, align 4
  %48 = getelementptr inbounds i32* %is, i64 1
  store i32 512, i32* %48, align 4
  %49 = getelementptr inbounds i32* %is, i64 2
  store i32 1024, i32* %49, align 4
  br label %52

; <label>:50                                      ; preds = %43
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str32, i32 0, i32 0))
  call void @exit(i32 6) #7
  unreachable

; <label>:52                                      ; preds = %46, %36, %26, %16, %6
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @newMat(%struct.Mat* %Mat, i32 %mnums, i32 %mrows, i32 %mcols, i32 %mdeps) #0 {
  %1 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 1
  store i32 %mnums, i32* %1, align 4
  %2 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 2
  store i32 %mrows, i32* %2, align 4
  %3 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 3
  store i32 %mcols, i32* %3, align 4
  %4 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 4
  store i32 %mdeps, i32* %4, align 4
  %5 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 0
  store float* null, float** %5, align 8
  %6 = mul nsw i32 %mnums, %mrows
  %7 = mul nsw i32 %6, %mcols
  %8 = mul nsw i32 %7, %mdeps
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 4
  %11 = call noalias i8* @malloc(i64 %10) #5
  %12 = bitcast i8* %11 to float*
  %13 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 0
  store float* %12, float** %13, align 8
  %14 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 0
  %15 = load float** %14, align 8
  %16 = icmp ne float* %15, null
  %17 = select i1 %16, i32 1, i32 0
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define void @mat_set_init(%struct.Mat* %Mat) #0 {
  br label %1

; <label>:1                                       ; preds = %58, %0
  %i.0 = phi i32 [ 0, %0 ], [ %59, %58 ]
  %2 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 2
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %i.0, %3
  br i1 %4, label %5, label %60

; <label>:5                                       ; preds = %1
  br label %6

; <label>:6                                       ; preds = %55, %5
  %j.0 = phi i32 [ 0, %5 ], [ %56, %55 ]
  %7 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 3
  %8 = load i32* %7, align 4
  %9 = icmp slt i32 %j.0, %8
  br i1 %9, label %10, label %57

; <label>:10                                      ; preds = %6
  br label %11

; <label>:11                                      ; preds = %52, %10
  %k.0 = phi i32 [ 0, %10 ], [ %53, %52 ]
  %12 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 4
  %13 = load i32* %12, align 4
  %14 = icmp slt i32 %k.0, %13
  br i1 %14, label %15, label %54

; <label>:15                                      ; preds = %11
  %16 = mul nsw i32 %i.0, %i.0
  %17 = sitofp i32 %16 to float
  %18 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 2
  %19 = load i32* %18, align 4
  %20 = sub nsw i32 %19, 1
  %21 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 2
  %22 = load i32* %21, align 4
  %23 = sub nsw i32 %22, 1
  %24 = mul nsw i32 %20, %23
  %25 = sitofp i32 %24 to float
  %26 = fdiv float %17, %25
  %27 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 2
  %28 = load i32* %27, align 4
  %29 = mul nsw i32 0, %28
  %30 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 3
  %31 = load i32* %30, align 4
  %32 = mul nsw i32 %29, %31
  %33 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 4
  %34 = load i32* %33, align 4
  %35 = mul nsw i32 %32, %34
  %36 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 3
  %37 = load i32* %36, align 4
  %38 = mul nsw i32 %i.0, %37
  %39 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 4
  %40 = load i32* %39, align 4
  %41 = mul nsw i32 %38, %40
  %42 = add nsw i32 %35, %41
  %43 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 4
  %44 = load i32* %43, align 4
  %45 = mul nsw i32 %j.0, %44
  %46 = add nsw i32 %42, %45
  %47 = add nsw i32 %46, %k.0
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 0
  %50 = load float** %49, align 8
  %51 = getelementptr inbounds float* %50, i64 %48
  store float %26, float* %51, align 4
  br label %52

; <label>:52                                      ; preds = %15
  %53 = add nsw i32 %k.0, 1
  br label %11

; <label>:54                                      ; preds = %11
  br label %55

; <label>:55                                      ; preds = %54
  %56 = add nsw i32 %j.0, 1
  br label %6

; <label>:57                                      ; preds = %6
  br label %58

; <label>:58                                      ; preds = %57
  %59 = add nsw i32 %i.0, 1
  br label %1

; <label>:60                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @mat_set(%struct.Mat* %Mat, i32 %l, float %val) #0 {
  br label %1

; <label>:1                                       ; preds = %47, %0
  %i.0 = phi i32 [ 0, %0 ], [ %48, %47 ]
  %2 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 2
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %i.0, %3
  br i1 %4, label %5, label %49

; <label>:5                                       ; preds = %1
  br label %6

; <label>:6                                       ; preds = %44, %5
  %j.0 = phi i32 [ 0, %5 ], [ %45, %44 ]
  %7 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 3
  %8 = load i32* %7, align 4
  %9 = icmp slt i32 %j.0, %8
  br i1 %9, label %10, label %46

; <label>:10                                      ; preds = %6
  br label %11

; <label>:11                                      ; preds = %41, %10
  %k.0 = phi i32 [ 0, %10 ], [ %42, %41 ]
  %12 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 4
  %13 = load i32* %12, align 4
  %14 = icmp slt i32 %k.0, %13
  br i1 %14, label %15, label %43

; <label>:15                                      ; preds = %11
  %16 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 2
  %17 = load i32* %16, align 4
  %18 = mul nsw i32 %l, %17
  %19 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 3
  %20 = load i32* %19, align 4
  %21 = mul nsw i32 %18, %20
  %22 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 4
  %23 = load i32* %22, align 4
  %24 = mul nsw i32 %21, %23
  %25 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 3
  %26 = load i32* %25, align 4
  %27 = mul nsw i32 %i.0, %26
  %28 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 4
  %29 = load i32* %28, align 4
  %30 = mul nsw i32 %27, %29
  %31 = add nsw i32 %24, %30
  %32 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 4
  %33 = load i32* %32, align 4
  %34 = mul nsw i32 %j.0, %33
  %35 = add nsw i32 %31, %34
  %36 = add nsw i32 %35, %k.0
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 0
  %39 = load float** %38, align 8
  %40 = getelementptr inbounds float* %39, i64 %37
  store float %val, float* %40, align 4
  br label %41

; <label>:41                                      ; preds = %15
  %42 = add nsw i32 %k.0, 1
  br label %11

; <label>:43                                      ; preds = %11
  br label %44

; <label>:44                                      ; preds = %43
  %45 = add nsw i32 %j.0, 1
  br label %6

; <label>:46                                      ; preds = %6
  br label %47

; <label>:47                                      ; preds = %46
  %48 = add nsw i32 %i.0, 1
  br label %1

; <label>:49                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define float @jacobi(i32 %nn, %struct.Mat* %a, %struct.Mat* %b, %struct.Mat* %c, %struct.Mat* %p, %struct.Mat* %bnd, %struct.Mat* %wrk1, %struct.Mat* %wrk2) #0 {
  %1 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %2 = load i32* %1, align 4
  %3 = sub nsw i32 %2, 1
  %4 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %5 = load i32* %4, align 4
  %6 = sub nsw i32 %5, 1
  %7 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %8 = load i32* %7, align 4
  %9 = sub nsw i32 %8, 1
  br label %10

; <label>:10                                      ; preds = %1022, %0
  %n.0 = phi i32 [ 0, %0 ], [ %1023, %1022 ]
  %gosa.0 = phi float [ undef, %0 ], [ %gosa.1, %1022 ]
  %11 = icmp slt i32 %n.0, %nn
  br i1 %11, label %12, label %1024

; <label>:12                                      ; preds = %10
  br label %13

; <label>:13                                      ; preds = %950, %12
  %i.0 = phi i32 [ 1, %12 ], [ %951, %950 ]
  %gosa.1 = phi float [ 0.000000e+00, %12 ], [ %gosa.2, %950 ]
  %14 = icmp slt i32 %i.0, %3
  br i1 %14, label %15, label %952

; <label>:15                                      ; preds = %13
  br label %16

; <label>:16                                      ; preds = %947, %15
  %j.0 = phi i32 [ 1, %15 ], [ %948, %947 ]
  %gosa.2 = phi float [ %gosa.1, %15 ], [ %gosa.3, %947 ]
  %17 = icmp slt i32 %j.0, %6
  br i1 %17, label %18, label %949

; <label>:18                                      ; preds = %16
  br label %19

; <label>:19                                      ; preds = %944, %18
  %k.0 = phi i32 [ 1, %18 ], [ %945, %944 ]
  %gosa.3 = phi float [ %gosa.2, %18 ], [ %889, %944 ]
  %20 = icmp slt i32 %k.0, %9
  br i1 %20, label %21, label %946

; <label>:21                                      ; preds = %19
  %22 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 2
  %23 = load i32* %22, align 4
  %24 = mul nsw i32 0, %23
  %25 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 3
  %26 = load i32* %25, align 4
  %27 = mul nsw i32 %24, %26
  %28 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 4
  %29 = load i32* %28, align 4
  %30 = mul nsw i32 %27, %29
  %31 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 3
  %32 = load i32* %31, align 4
  %33 = mul nsw i32 %i.0, %32
  %34 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 4
  %35 = load i32* %34, align 4
  %36 = mul nsw i32 %33, %35
  %37 = add nsw i32 %30, %36
  %38 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 4
  %39 = load i32* %38, align 4
  %40 = mul nsw i32 %j.0, %39
  %41 = add nsw i32 %37, %40
  %42 = add nsw i32 %41, %k.0
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 0
  %45 = load float** %44, align 8
  %46 = getelementptr inbounds float* %45, i64 %43
  %47 = load float* %46, align 4
  %48 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %49 = load i32* %48, align 4
  %50 = mul nsw i32 0, %49
  %51 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %52 = load i32* %51, align 4
  %53 = mul nsw i32 %50, %52
  %54 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %55 = load i32* %54, align 4
  %56 = mul nsw i32 %53, %55
  %57 = add nsw i32 %i.0, 1
  %58 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %59 = load i32* %58, align 4
  %60 = mul nsw i32 %57, %59
  %61 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %62 = load i32* %61, align 4
  %63 = mul nsw i32 %60, %62
  %64 = add nsw i32 %56, %63
  %65 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %66 = load i32* %65, align 4
  %67 = mul nsw i32 %j.0, %66
  %68 = add nsw i32 %64, %67
  %69 = add nsw i32 %68, %k.0
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %72 = load float** %71, align 8
  %73 = getelementptr inbounds float* %72, i64 %70
  %74 = load float* %73, align 4
  %75 = fmul float %47, %74
  %76 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 2
  %77 = load i32* %76, align 4
  %78 = mul nsw i32 1, %77
  %79 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 3
  %80 = load i32* %79, align 4
  %81 = mul nsw i32 %78, %80
  %82 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 4
  %83 = load i32* %82, align 4
  %84 = mul nsw i32 %81, %83
  %85 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 3
  %86 = load i32* %85, align 4
  %87 = mul nsw i32 %i.0, %86
  %88 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 4
  %89 = load i32* %88, align 4
  %90 = mul nsw i32 %87, %89
  %91 = add nsw i32 %84, %90
  %92 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 4
  %93 = load i32* %92, align 4
  %94 = mul nsw i32 %j.0, %93
  %95 = add nsw i32 %91, %94
  %96 = add nsw i32 %95, %k.0
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 0
  %99 = load float** %98, align 8
  %100 = getelementptr inbounds float* %99, i64 %97
  %101 = load float* %100, align 4
  %102 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %103 = load i32* %102, align 4
  %104 = mul nsw i32 0, %103
  %105 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %106 = load i32* %105, align 4
  %107 = mul nsw i32 %104, %106
  %108 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %109 = load i32* %108, align 4
  %110 = mul nsw i32 %107, %109
  %111 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %112 = load i32* %111, align 4
  %113 = mul nsw i32 %i.0, %112
  %114 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %115 = load i32* %114, align 4
  %116 = mul nsw i32 %113, %115
  %117 = add nsw i32 %110, %116
  %118 = add nsw i32 %j.0, 1
  %119 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %120 = load i32* %119, align 4
  %121 = mul nsw i32 %118, %120
  %122 = add nsw i32 %117, %121
  %123 = add nsw i32 %122, %k.0
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %126 = load float** %125, align 8
  %127 = getelementptr inbounds float* %126, i64 %124
  %128 = load float* %127, align 4
  %129 = fmul float %101, %128
  %130 = fadd float %75, %129
  %131 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 2
  %132 = load i32* %131, align 4
  %133 = mul nsw i32 2, %132
  %134 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 3
  %135 = load i32* %134, align 4
  %136 = mul nsw i32 %133, %135
  %137 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 4
  %138 = load i32* %137, align 4
  %139 = mul nsw i32 %136, %138
  %140 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 3
  %141 = load i32* %140, align 4
  %142 = mul nsw i32 %i.0, %141
  %143 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 4
  %144 = load i32* %143, align 4
  %145 = mul nsw i32 %142, %144
  %146 = add nsw i32 %139, %145
  %147 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 4
  %148 = load i32* %147, align 4
  %149 = mul nsw i32 %j.0, %148
  %150 = add nsw i32 %146, %149
  %151 = add nsw i32 %150, %k.0
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 0
  %154 = load float** %153, align 8
  %155 = getelementptr inbounds float* %154, i64 %152
  %156 = load float* %155, align 4
  %157 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %158 = load i32* %157, align 4
  %159 = mul nsw i32 0, %158
  %160 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %161 = load i32* %160, align 4
  %162 = mul nsw i32 %159, %161
  %163 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %164 = load i32* %163, align 4
  %165 = mul nsw i32 %162, %164
  %166 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %167 = load i32* %166, align 4
  %168 = mul nsw i32 %i.0, %167
  %169 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %170 = load i32* %169, align 4
  %171 = mul nsw i32 %168, %170
  %172 = add nsw i32 %165, %171
  %173 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %174 = load i32* %173, align 4
  %175 = mul nsw i32 %j.0, %174
  %176 = add nsw i32 %172, %175
  %177 = add nsw i32 %k.0, 1
  %178 = add nsw i32 %176, %177
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %181 = load float** %180, align 8
  %182 = getelementptr inbounds float* %181, i64 %179
  %183 = load float* %182, align 4
  %184 = fmul float %156, %183
  %185 = fadd float %130, %184
  %186 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 2
  %187 = load i32* %186, align 4
  %188 = mul nsw i32 0, %187
  %189 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 3
  %190 = load i32* %189, align 4
  %191 = mul nsw i32 %188, %190
  %192 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 4
  %193 = load i32* %192, align 4
  %194 = mul nsw i32 %191, %193
  %195 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 3
  %196 = load i32* %195, align 4
  %197 = mul nsw i32 %i.0, %196
  %198 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 4
  %199 = load i32* %198, align 4
  %200 = mul nsw i32 %197, %199
  %201 = add nsw i32 %194, %200
  %202 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 4
  %203 = load i32* %202, align 4
  %204 = mul nsw i32 %j.0, %203
  %205 = add nsw i32 %201, %204
  %206 = add nsw i32 %205, %k.0
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 0
  %209 = load float** %208, align 8
  %210 = getelementptr inbounds float* %209, i64 %207
  %211 = load float* %210, align 4
  %212 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %213 = load i32* %212, align 4
  %214 = mul nsw i32 0, %213
  %215 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %216 = load i32* %215, align 4
  %217 = mul nsw i32 %214, %216
  %218 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %219 = load i32* %218, align 4
  %220 = mul nsw i32 %217, %219
  %221 = add nsw i32 %i.0, 1
  %222 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %223 = load i32* %222, align 4
  %224 = mul nsw i32 %221, %223
  %225 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %226 = load i32* %225, align 4
  %227 = mul nsw i32 %224, %226
  %228 = add nsw i32 %220, %227
  %229 = add nsw i32 %j.0, 1
  %230 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %231 = load i32* %230, align 4
  %232 = mul nsw i32 %229, %231
  %233 = add nsw i32 %228, %232
  %234 = add nsw i32 %233, %k.0
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %237 = load float** %236, align 8
  %238 = getelementptr inbounds float* %237, i64 %235
  %239 = load float* %238, align 4
  %240 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %241 = load i32* %240, align 4
  %242 = mul nsw i32 0, %241
  %243 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %244 = load i32* %243, align 4
  %245 = mul nsw i32 %242, %244
  %246 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %247 = load i32* %246, align 4
  %248 = mul nsw i32 %245, %247
  %249 = add nsw i32 %i.0, 1
  %250 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %251 = load i32* %250, align 4
  %252 = mul nsw i32 %249, %251
  %253 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %254 = load i32* %253, align 4
  %255 = mul nsw i32 %252, %254
  %256 = add nsw i32 %248, %255
  %257 = sub nsw i32 %j.0, 1
  %258 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %259 = load i32* %258, align 4
  %260 = mul nsw i32 %257, %259
  %261 = add nsw i32 %256, %260
  %262 = add nsw i32 %261, %k.0
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %265 = load float** %264, align 8
  %266 = getelementptr inbounds float* %265, i64 %263
  %267 = load float* %266, align 4
  %268 = fsub float %239, %267
  %269 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %270 = load i32* %269, align 4
  %271 = mul nsw i32 0, %270
  %272 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %273 = load i32* %272, align 4
  %274 = mul nsw i32 %271, %273
  %275 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %276 = load i32* %275, align 4
  %277 = mul nsw i32 %274, %276
  %278 = sub nsw i32 %i.0, 1
  %279 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %280 = load i32* %279, align 4
  %281 = mul nsw i32 %278, %280
  %282 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %283 = load i32* %282, align 4
  %284 = mul nsw i32 %281, %283
  %285 = add nsw i32 %277, %284
  %286 = add nsw i32 %j.0, 1
  %287 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %288 = load i32* %287, align 4
  %289 = mul nsw i32 %286, %288
  %290 = add nsw i32 %285, %289
  %291 = add nsw i32 %290, %k.0
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %294 = load float** %293, align 8
  %295 = getelementptr inbounds float* %294, i64 %292
  %296 = load float* %295, align 4
  %297 = fsub float %268, %296
  %298 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %299 = load i32* %298, align 4
  %300 = mul nsw i32 0, %299
  %301 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %302 = load i32* %301, align 4
  %303 = mul nsw i32 %300, %302
  %304 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %305 = load i32* %304, align 4
  %306 = mul nsw i32 %303, %305
  %307 = sub nsw i32 %i.0, 1
  %308 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %309 = load i32* %308, align 4
  %310 = mul nsw i32 %307, %309
  %311 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %312 = load i32* %311, align 4
  %313 = mul nsw i32 %310, %312
  %314 = add nsw i32 %306, %313
  %315 = sub nsw i32 %j.0, 1
  %316 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %317 = load i32* %316, align 4
  %318 = mul nsw i32 %315, %317
  %319 = add nsw i32 %314, %318
  %320 = add nsw i32 %319, %k.0
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %323 = load float** %322, align 8
  %324 = getelementptr inbounds float* %323, i64 %321
  %325 = load float* %324, align 4
  %326 = fadd float %297, %325
  %327 = fmul float %211, %326
  %328 = fadd float %185, %327
  %329 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 2
  %330 = load i32* %329, align 4
  %331 = mul nsw i32 1, %330
  %332 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 3
  %333 = load i32* %332, align 4
  %334 = mul nsw i32 %331, %333
  %335 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 4
  %336 = load i32* %335, align 4
  %337 = mul nsw i32 %334, %336
  %338 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 3
  %339 = load i32* %338, align 4
  %340 = mul nsw i32 %i.0, %339
  %341 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 4
  %342 = load i32* %341, align 4
  %343 = mul nsw i32 %340, %342
  %344 = add nsw i32 %337, %343
  %345 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 4
  %346 = load i32* %345, align 4
  %347 = mul nsw i32 %j.0, %346
  %348 = add nsw i32 %344, %347
  %349 = add nsw i32 %348, %k.0
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 0
  %352 = load float** %351, align 8
  %353 = getelementptr inbounds float* %352, i64 %350
  %354 = load float* %353, align 4
  %355 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %356 = load i32* %355, align 4
  %357 = mul nsw i32 0, %356
  %358 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %359 = load i32* %358, align 4
  %360 = mul nsw i32 %357, %359
  %361 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %362 = load i32* %361, align 4
  %363 = mul nsw i32 %360, %362
  %364 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %365 = load i32* %364, align 4
  %366 = mul nsw i32 %i.0, %365
  %367 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %368 = load i32* %367, align 4
  %369 = mul nsw i32 %366, %368
  %370 = add nsw i32 %363, %369
  %371 = add nsw i32 %j.0, 1
  %372 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %373 = load i32* %372, align 4
  %374 = mul nsw i32 %371, %373
  %375 = add nsw i32 %370, %374
  %376 = add nsw i32 %k.0, 1
  %377 = add nsw i32 %375, %376
  %378 = sext i32 %377 to i64
  %379 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %380 = load float** %379, align 8
  %381 = getelementptr inbounds float* %380, i64 %378
  %382 = load float* %381, align 4
  %383 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %384 = load i32* %383, align 4
  %385 = mul nsw i32 0, %384
  %386 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %387 = load i32* %386, align 4
  %388 = mul nsw i32 %385, %387
  %389 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %390 = load i32* %389, align 4
  %391 = mul nsw i32 %388, %390
  %392 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %393 = load i32* %392, align 4
  %394 = mul nsw i32 %i.0, %393
  %395 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %396 = load i32* %395, align 4
  %397 = mul nsw i32 %394, %396
  %398 = add nsw i32 %391, %397
  %399 = sub nsw i32 %j.0, 1
  %400 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %401 = load i32* %400, align 4
  %402 = mul nsw i32 %399, %401
  %403 = add nsw i32 %398, %402
  %404 = add nsw i32 %k.0, 1
  %405 = add nsw i32 %403, %404
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %408 = load float** %407, align 8
  %409 = getelementptr inbounds float* %408, i64 %406
  %410 = load float* %409, align 4
  %411 = fsub float %382, %410
  %412 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %413 = load i32* %412, align 4
  %414 = mul nsw i32 0, %413
  %415 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %416 = load i32* %415, align 4
  %417 = mul nsw i32 %414, %416
  %418 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %419 = load i32* %418, align 4
  %420 = mul nsw i32 %417, %419
  %421 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %422 = load i32* %421, align 4
  %423 = mul nsw i32 %i.0, %422
  %424 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %425 = load i32* %424, align 4
  %426 = mul nsw i32 %423, %425
  %427 = add nsw i32 %420, %426
  %428 = add nsw i32 %j.0, 1
  %429 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %430 = load i32* %429, align 4
  %431 = mul nsw i32 %428, %430
  %432 = add nsw i32 %427, %431
  %433 = sub nsw i32 %k.0, 1
  %434 = add nsw i32 %432, %433
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %437 = load float** %436, align 8
  %438 = getelementptr inbounds float* %437, i64 %435
  %439 = load float* %438, align 4
  %440 = fsub float %411, %439
  %441 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %442 = load i32* %441, align 4
  %443 = mul nsw i32 0, %442
  %444 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %445 = load i32* %444, align 4
  %446 = mul nsw i32 %443, %445
  %447 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %448 = load i32* %447, align 4
  %449 = mul nsw i32 %446, %448
  %450 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %451 = load i32* %450, align 4
  %452 = mul nsw i32 %i.0, %451
  %453 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %454 = load i32* %453, align 4
  %455 = mul nsw i32 %452, %454
  %456 = add nsw i32 %449, %455
  %457 = sub nsw i32 %j.0, 1
  %458 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %459 = load i32* %458, align 4
  %460 = mul nsw i32 %457, %459
  %461 = add nsw i32 %456, %460
  %462 = sub nsw i32 %k.0, 1
  %463 = add nsw i32 %461, %462
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %466 = load float** %465, align 8
  %467 = getelementptr inbounds float* %466, i64 %464
  %468 = load float* %467, align 4
  %469 = fadd float %440, %468
  %470 = fmul float %354, %469
  %471 = fadd float %328, %470
  %472 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 2
  %473 = load i32* %472, align 4
  %474 = mul nsw i32 2, %473
  %475 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 3
  %476 = load i32* %475, align 4
  %477 = mul nsw i32 %474, %476
  %478 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 4
  %479 = load i32* %478, align 4
  %480 = mul nsw i32 %477, %479
  %481 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 3
  %482 = load i32* %481, align 4
  %483 = mul nsw i32 %i.0, %482
  %484 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 4
  %485 = load i32* %484, align 4
  %486 = mul nsw i32 %483, %485
  %487 = add nsw i32 %480, %486
  %488 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 4
  %489 = load i32* %488, align 4
  %490 = mul nsw i32 %j.0, %489
  %491 = add nsw i32 %487, %490
  %492 = add nsw i32 %491, %k.0
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds %struct.Mat* %b, i32 0, i32 0
  %495 = load float** %494, align 8
  %496 = getelementptr inbounds float* %495, i64 %493
  %497 = load float* %496, align 4
  %498 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %499 = load i32* %498, align 4
  %500 = mul nsw i32 0, %499
  %501 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %502 = load i32* %501, align 4
  %503 = mul nsw i32 %500, %502
  %504 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %505 = load i32* %504, align 4
  %506 = mul nsw i32 %503, %505
  %507 = add nsw i32 %i.0, 1
  %508 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %509 = load i32* %508, align 4
  %510 = mul nsw i32 %507, %509
  %511 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %512 = load i32* %511, align 4
  %513 = mul nsw i32 %510, %512
  %514 = add nsw i32 %506, %513
  %515 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %516 = load i32* %515, align 4
  %517 = mul nsw i32 %j.0, %516
  %518 = add nsw i32 %514, %517
  %519 = add nsw i32 %k.0, 1
  %520 = add nsw i32 %518, %519
  %521 = sext i32 %520 to i64
  %522 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %523 = load float** %522, align 8
  %524 = getelementptr inbounds float* %523, i64 %521
  %525 = load float* %524, align 4
  %526 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %527 = load i32* %526, align 4
  %528 = mul nsw i32 0, %527
  %529 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %530 = load i32* %529, align 4
  %531 = mul nsw i32 %528, %530
  %532 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %533 = load i32* %532, align 4
  %534 = mul nsw i32 %531, %533
  %535 = sub nsw i32 %i.0, 1
  %536 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %537 = load i32* %536, align 4
  %538 = mul nsw i32 %535, %537
  %539 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %540 = load i32* %539, align 4
  %541 = mul nsw i32 %538, %540
  %542 = add nsw i32 %534, %541
  %543 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %544 = load i32* %543, align 4
  %545 = mul nsw i32 %j.0, %544
  %546 = add nsw i32 %542, %545
  %547 = add nsw i32 %k.0, 1
  %548 = add nsw i32 %546, %547
  %549 = sext i32 %548 to i64
  %550 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %551 = load float** %550, align 8
  %552 = getelementptr inbounds float* %551, i64 %549
  %553 = load float* %552, align 4
  %554 = fsub float %525, %553
  %555 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %556 = load i32* %555, align 4
  %557 = mul nsw i32 0, %556
  %558 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %559 = load i32* %558, align 4
  %560 = mul nsw i32 %557, %559
  %561 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %562 = load i32* %561, align 4
  %563 = mul nsw i32 %560, %562
  %564 = add nsw i32 %i.0, 1
  %565 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %566 = load i32* %565, align 4
  %567 = mul nsw i32 %564, %566
  %568 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %569 = load i32* %568, align 4
  %570 = mul nsw i32 %567, %569
  %571 = add nsw i32 %563, %570
  %572 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %573 = load i32* %572, align 4
  %574 = mul nsw i32 %j.0, %573
  %575 = add nsw i32 %571, %574
  %576 = sub nsw i32 %k.0, 1
  %577 = add nsw i32 %575, %576
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %580 = load float** %579, align 8
  %581 = getelementptr inbounds float* %580, i64 %578
  %582 = load float* %581, align 4
  %583 = fsub float %554, %582
  %584 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %585 = load i32* %584, align 4
  %586 = mul nsw i32 0, %585
  %587 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %588 = load i32* %587, align 4
  %589 = mul nsw i32 %586, %588
  %590 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %591 = load i32* %590, align 4
  %592 = mul nsw i32 %589, %591
  %593 = sub nsw i32 %i.0, 1
  %594 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %595 = load i32* %594, align 4
  %596 = mul nsw i32 %593, %595
  %597 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %598 = load i32* %597, align 4
  %599 = mul nsw i32 %596, %598
  %600 = add nsw i32 %592, %599
  %601 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %602 = load i32* %601, align 4
  %603 = mul nsw i32 %j.0, %602
  %604 = add nsw i32 %600, %603
  %605 = sub nsw i32 %k.0, 1
  %606 = add nsw i32 %604, %605
  %607 = sext i32 %606 to i64
  %608 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %609 = load float** %608, align 8
  %610 = getelementptr inbounds float* %609, i64 %607
  %611 = load float* %610, align 4
  %612 = fadd float %583, %611
  %613 = fmul float %497, %612
  %614 = fadd float %471, %613
  %615 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 2
  %616 = load i32* %615, align 4
  %617 = mul nsw i32 0, %616
  %618 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 3
  %619 = load i32* %618, align 4
  %620 = mul nsw i32 %617, %619
  %621 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 4
  %622 = load i32* %621, align 4
  %623 = mul nsw i32 %620, %622
  %624 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 3
  %625 = load i32* %624, align 4
  %626 = mul nsw i32 %i.0, %625
  %627 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 4
  %628 = load i32* %627, align 4
  %629 = mul nsw i32 %626, %628
  %630 = add nsw i32 %623, %629
  %631 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 4
  %632 = load i32* %631, align 4
  %633 = mul nsw i32 %j.0, %632
  %634 = add nsw i32 %630, %633
  %635 = add nsw i32 %634, %k.0
  %636 = sext i32 %635 to i64
  %637 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 0
  %638 = load float** %637, align 8
  %639 = getelementptr inbounds float* %638, i64 %636
  %640 = load float* %639, align 4
  %641 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %642 = load i32* %641, align 4
  %643 = mul nsw i32 0, %642
  %644 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %645 = load i32* %644, align 4
  %646 = mul nsw i32 %643, %645
  %647 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %648 = load i32* %647, align 4
  %649 = mul nsw i32 %646, %648
  %650 = sub nsw i32 %i.0, 1
  %651 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %652 = load i32* %651, align 4
  %653 = mul nsw i32 %650, %652
  %654 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %655 = load i32* %654, align 4
  %656 = mul nsw i32 %653, %655
  %657 = add nsw i32 %649, %656
  %658 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %659 = load i32* %658, align 4
  %660 = mul nsw i32 %j.0, %659
  %661 = add nsw i32 %657, %660
  %662 = add nsw i32 %661, %k.0
  %663 = sext i32 %662 to i64
  %664 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %665 = load float** %664, align 8
  %666 = getelementptr inbounds float* %665, i64 %663
  %667 = load float* %666, align 4
  %668 = fmul float %640, %667
  %669 = fadd float %614, %668
  %670 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 2
  %671 = load i32* %670, align 4
  %672 = mul nsw i32 1, %671
  %673 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 3
  %674 = load i32* %673, align 4
  %675 = mul nsw i32 %672, %674
  %676 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 4
  %677 = load i32* %676, align 4
  %678 = mul nsw i32 %675, %677
  %679 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 3
  %680 = load i32* %679, align 4
  %681 = mul nsw i32 %i.0, %680
  %682 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 4
  %683 = load i32* %682, align 4
  %684 = mul nsw i32 %681, %683
  %685 = add nsw i32 %678, %684
  %686 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 4
  %687 = load i32* %686, align 4
  %688 = mul nsw i32 %j.0, %687
  %689 = add nsw i32 %685, %688
  %690 = add nsw i32 %689, %k.0
  %691 = sext i32 %690 to i64
  %692 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 0
  %693 = load float** %692, align 8
  %694 = getelementptr inbounds float* %693, i64 %691
  %695 = load float* %694, align 4
  %696 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %697 = load i32* %696, align 4
  %698 = mul nsw i32 0, %697
  %699 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %700 = load i32* %699, align 4
  %701 = mul nsw i32 %698, %700
  %702 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %703 = load i32* %702, align 4
  %704 = mul nsw i32 %701, %703
  %705 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %706 = load i32* %705, align 4
  %707 = mul nsw i32 %i.0, %706
  %708 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %709 = load i32* %708, align 4
  %710 = mul nsw i32 %707, %709
  %711 = add nsw i32 %704, %710
  %712 = sub nsw i32 %j.0, 1
  %713 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %714 = load i32* %713, align 4
  %715 = mul nsw i32 %712, %714
  %716 = add nsw i32 %711, %715
  %717 = add nsw i32 %716, %k.0
  %718 = sext i32 %717 to i64
  %719 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %720 = load float** %719, align 8
  %721 = getelementptr inbounds float* %720, i64 %718
  %722 = load float* %721, align 4
  %723 = fmul float %695, %722
  %724 = fadd float %669, %723
  %725 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 2
  %726 = load i32* %725, align 4
  %727 = mul nsw i32 2, %726
  %728 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 3
  %729 = load i32* %728, align 4
  %730 = mul nsw i32 %727, %729
  %731 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 4
  %732 = load i32* %731, align 4
  %733 = mul nsw i32 %730, %732
  %734 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 3
  %735 = load i32* %734, align 4
  %736 = mul nsw i32 %i.0, %735
  %737 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 4
  %738 = load i32* %737, align 4
  %739 = mul nsw i32 %736, %738
  %740 = add nsw i32 %733, %739
  %741 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 4
  %742 = load i32* %741, align 4
  %743 = mul nsw i32 %j.0, %742
  %744 = add nsw i32 %740, %743
  %745 = add nsw i32 %744, %k.0
  %746 = sext i32 %745 to i64
  %747 = getelementptr inbounds %struct.Mat* %c, i32 0, i32 0
  %748 = load float** %747, align 8
  %749 = getelementptr inbounds float* %748, i64 %746
  %750 = load float* %749, align 4
  %751 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %752 = load i32* %751, align 4
  %753 = mul nsw i32 0, %752
  %754 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %755 = load i32* %754, align 4
  %756 = mul nsw i32 %753, %755
  %757 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %758 = load i32* %757, align 4
  %759 = mul nsw i32 %756, %758
  %760 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %761 = load i32* %760, align 4
  %762 = mul nsw i32 %i.0, %761
  %763 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %764 = load i32* %763, align 4
  %765 = mul nsw i32 %762, %764
  %766 = add nsw i32 %759, %765
  %767 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %768 = load i32* %767, align 4
  %769 = mul nsw i32 %j.0, %768
  %770 = add nsw i32 %766, %769
  %771 = sub nsw i32 %k.0, 1
  %772 = add nsw i32 %770, %771
  %773 = sext i32 %772 to i64
  %774 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %775 = load float** %774, align 8
  %776 = getelementptr inbounds float* %775, i64 %773
  %777 = load float* %776, align 4
  %778 = fmul float %750, %777
  %779 = fadd float %724, %778
  %780 = getelementptr inbounds %struct.Mat* %wrk1, i32 0, i32 2
  %781 = load i32* %780, align 4
  %782 = mul nsw i32 0, %781
  %783 = getelementptr inbounds %struct.Mat* %wrk1, i32 0, i32 3
  %784 = load i32* %783, align 4
  %785 = mul nsw i32 %782, %784
  %786 = getelementptr inbounds %struct.Mat* %wrk1, i32 0, i32 4
  %787 = load i32* %786, align 4
  %788 = mul nsw i32 %785, %787
  %789 = getelementptr inbounds %struct.Mat* %wrk1, i32 0, i32 3
  %790 = load i32* %789, align 4
  %791 = mul nsw i32 %i.0, %790
  %792 = getelementptr inbounds %struct.Mat* %wrk1, i32 0, i32 4
  %793 = load i32* %792, align 4
  %794 = mul nsw i32 %791, %793
  %795 = add nsw i32 %788, %794
  %796 = getelementptr inbounds %struct.Mat* %wrk1, i32 0, i32 4
  %797 = load i32* %796, align 4
  %798 = mul nsw i32 %j.0, %797
  %799 = add nsw i32 %795, %798
  %800 = add nsw i32 %799, %k.0
  %801 = sext i32 %800 to i64
  %802 = getelementptr inbounds %struct.Mat* %wrk1, i32 0, i32 0
  %803 = load float** %802, align 8
  %804 = getelementptr inbounds float* %803, i64 %801
  %805 = load float* %804, align 4
  %806 = fadd float %779, %805
  %807 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 2
  %808 = load i32* %807, align 4
  %809 = mul nsw i32 3, %808
  %810 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 3
  %811 = load i32* %810, align 4
  %812 = mul nsw i32 %809, %811
  %813 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 4
  %814 = load i32* %813, align 4
  %815 = mul nsw i32 %812, %814
  %816 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 3
  %817 = load i32* %816, align 4
  %818 = mul nsw i32 %i.0, %817
  %819 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 4
  %820 = load i32* %819, align 4
  %821 = mul nsw i32 %818, %820
  %822 = add nsw i32 %815, %821
  %823 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 4
  %824 = load i32* %823, align 4
  %825 = mul nsw i32 %j.0, %824
  %826 = add nsw i32 %822, %825
  %827 = add nsw i32 %826, %k.0
  %828 = sext i32 %827 to i64
  %829 = getelementptr inbounds %struct.Mat* %a, i32 0, i32 0
  %830 = load float** %829, align 8
  %831 = getelementptr inbounds float* %830, i64 %828
  %832 = load float* %831, align 4
  %833 = fmul float %806, %832
  %834 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %835 = load i32* %834, align 4
  %836 = mul nsw i32 0, %835
  %837 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %838 = load i32* %837, align 4
  %839 = mul nsw i32 %836, %838
  %840 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %841 = load i32* %840, align 4
  %842 = mul nsw i32 %839, %841
  %843 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %844 = load i32* %843, align 4
  %845 = mul nsw i32 %i.0, %844
  %846 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %847 = load i32* %846, align 4
  %848 = mul nsw i32 %845, %847
  %849 = add nsw i32 %842, %848
  %850 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %851 = load i32* %850, align 4
  %852 = mul nsw i32 %j.0, %851
  %853 = add nsw i32 %849, %852
  %854 = add nsw i32 %853, %k.0
  %855 = sext i32 %854 to i64
  %856 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %857 = load float** %856, align 8
  %858 = getelementptr inbounds float* %857, i64 %855
  %859 = load float* %858, align 4
  %860 = fsub float %833, %859
  %861 = getelementptr inbounds %struct.Mat* %bnd, i32 0, i32 2
  %862 = load i32* %861, align 4
  %863 = mul nsw i32 0, %862
  %864 = getelementptr inbounds %struct.Mat* %bnd, i32 0, i32 3
  %865 = load i32* %864, align 4
  %866 = mul nsw i32 %863, %865
  %867 = getelementptr inbounds %struct.Mat* %bnd, i32 0, i32 4
  %868 = load i32* %867, align 4
  %869 = mul nsw i32 %866, %868
  %870 = getelementptr inbounds %struct.Mat* %bnd, i32 0, i32 3
  %871 = load i32* %870, align 4
  %872 = mul nsw i32 %i.0, %871
  %873 = getelementptr inbounds %struct.Mat* %bnd, i32 0, i32 4
  %874 = load i32* %873, align 4
  %875 = mul nsw i32 %872, %874
  %876 = add nsw i32 %869, %875
  %877 = getelementptr inbounds %struct.Mat* %bnd, i32 0, i32 4
  %878 = load i32* %877, align 4
  %879 = mul nsw i32 %j.0, %878
  %880 = add nsw i32 %876, %879
  %881 = add nsw i32 %880, %k.0
  %882 = sext i32 %881 to i64
  %883 = getelementptr inbounds %struct.Mat* %bnd, i32 0, i32 0
  %884 = load float** %883, align 8
  %885 = getelementptr inbounds float* %884, i64 %882
  %886 = load float* %885, align 4
  %887 = fmul float %860, %886
  %888 = fmul float %887, %887
  %889 = fadd float %gosa.3, %888
  %890 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %891 = load i32* %890, align 4
  %892 = mul nsw i32 0, %891
  %893 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %894 = load i32* %893, align 4
  %895 = mul nsw i32 %892, %894
  %896 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %897 = load i32* %896, align 4
  %898 = mul nsw i32 %895, %897
  %899 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %900 = load i32* %899, align 4
  %901 = mul nsw i32 %i.0, %900
  %902 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %903 = load i32* %902, align 4
  %904 = mul nsw i32 %901, %903
  %905 = add nsw i32 %898, %904
  %906 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %907 = load i32* %906, align 4
  %908 = mul nsw i32 %j.0, %907
  %909 = add nsw i32 %905, %908
  %910 = add nsw i32 %909, %k.0
  %911 = sext i32 %910 to i64
  %912 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %913 = load float** %912, align 8
  %914 = getelementptr inbounds float* %913, i64 %911
  %915 = load float* %914, align 4
  %916 = load float* @omega, align 4
  %917 = fmul float %916, %887
  %918 = fadd float %915, %917
  %919 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 2
  %920 = load i32* %919, align 4
  %921 = mul nsw i32 0, %920
  %922 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 3
  %923 = load i32* %922, align 4
  %924 = mul nsw i32 %921, %923
  %925 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 4
  %926 = load i32* %925, align 4
  %927 = mul nsw i32 %924, %926
  %928 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 3
  %929 = load i32* %928, align 4
  %930 = mul nsw i32 %i.0, %929
  %931 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 4
  %932 = load i32* %931, align 4
  %933 = mul nsw i32 %930, %932
  %934 = add nsw i32 %927, %933
  %935 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 4
  %936 = load i32* %935, align 4
  %937 = mul nsw i32 %j.0, %936
  %938 = add nsw i32 %934, %937
  %939 = add nsw i32 %938, %k.0
  %940 = sext i32 %939 to i64
  %941 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 0
  %942 = load float** %941, align 8
  %943 = getelementptr inbounds float* %942, i64 %940
  store float %918, float* %943, align 4
  br label %944

; <label>:944                                     ; preds = %21
  %945 = add nsw i32 %k.0, 1
  br label %19

; <label>:946                                     ; preds = %19
  br label %947

; <label>:947                                     ; preds = %946
  %948 = add nsw i32 %j.0, 1
  br label %16

; <label>:949                                     ; preds = %16
  br label %950

; <label>:950                                     ; preds = %949
  %951 = add nsw i32 %i.0, 1
  br label %13

; <label>:952                                     ; preds = %13
  br label %953

; <label>:953                                     ; preds = %1019, %952
  %i.1 = phi i32 [ 1, %952 ], [ %1020, %1019 ]
  %954 = icmp slt i32 %i.1, %3
  br i1 %954, label %955, label %1021

; <label>:955                                     ; preds = %953
  br label %956

; <label>:956                                     ; preds = %1016, %955
  %j.1 = phi i32 [ 1, %955 ], [ %1017, %1016 ]
  %957 = icmp slt i32 %j.1, %6
  br i1 %957, label %958, label %1018

; <label>:958                                     ; preds = %956
  br label %959

; <label>:959                                     ; preds = %1013, %958
  %k.1 = phi i32 [ 1, %958 ], [ %1014, %1013 ]
  %960 = icmp slt i32 %k.1, %9
  br i1 %960, label %961, label %1015

; <label>:961                                     ; preds = %959
  %962 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 2
  %963 = load i32* %962, align 4
  %964 = mul nsw i32 0, %963
  %965 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 3
  %966 = load i32* %965, align 4
  %967 = mul nsw i32 %964, %966
  %968 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 4
  %969 = load i32* %968, align 4
  %970 = mul nsw i32 %967, %969
  %971 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 3
  %972 = load i32* %971, align 4
  %973 = mul nsw i32 %i.1, %972
  %974 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 4
  %975 = load i32* %974, align 4
  %976 = mul nsw i32 %973, %975
  %977 = add nsw i32 %970, %976
  %978 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 4
  %979 = load i32* %978, align 4
  %980 = mul nsw i32 %j.1, %979
  %981 = add nsw i32 %977, %980
  %982 = add nsw i32 %981, %k.1
  %983 = sext i32 %982 to i64
  %984 = getelementptr inbounds %struct.Mat* %wrk2, i32 0, i32 0
  %985 = load float** %984, align 8
  %986 = getelementptr inbounds float* %985, i64 %983
  %987 = load float* %986, align 4
  %988 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 2
  %989 = load i32* %988, align 4
  %990 = mul nsw i32 0, %989
  %991 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %992 = load i32* %991, align 4
  %993 = mul nsw i32 %990, %992
  %994 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %995 = load i32* %994, align 4
  %996 = mul nsw i32 %993, %995
  %997 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 3
  %998 = load i32* %997, align 4
  %999 = mul nsw i32 %i.1, %998
  %1000 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %1001 = load i32* %1000, align 4
  %1002 = mul nsw i32 %999, %1001
  %1003 = add nsw i32 %996, %1002
  %1004 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 4
  %1005 = load i32* %1004, align 4
  %1006 = mul nsw i32 %j.1, %1005
  %1007 = add nsw i32 %1003, %1006
  %1008 = add nsw i32 %1007, %k.1
  %1009 = sext i32 %1008 to i64
  %1010 = getelementptr inbounds %struct.Mat* %p, i32 0, i32 0
  %1011 = load float** %1010, align 8
  %1012 = getelementptr inbounds float* %1011, i64 %1009
  store float %987, float* %1012, align 4
  br label %1013

; <label>:1013                                    ; preds = %961
  %1014 = add nsw i32 %k.1, 1
  br label %959

; <label>:1015                                    ; preds = %959
  br label %1016

; <label>:1016                                    ; preds = %1015
  %1017 = add nsw i32 %j.1, 1
  br label %956

; <label>:1018                                    ; preds = %956
  br label %1019

; <label>:1019                                    ; preds = %1018
  %1020 = add nsw i32 %i.1, 1
  br label %953

; <label>:1021                                    ; preds = %953
  br label %1022

; <label>:1022                                    ; preds = %1021
  %1023 = add nsw i32 %n.0, 1
  br label %10

; <label>:1024                                    ; preds = %10
  ret float %gosa.0
}

; Function Attrs: nounwind uwtable
define double @fflop(i32 %mx, i32 %my, i32 %mz) #0 {
  %1 = sub nsw i32 %mz, 2
  %2 = sitofp i32 %1 to double
  %3 = sub nsw i32 %my, 2
  %4 = sitofp i32 %3 to double
  %5 = fmul double %2, %4
  %6 = sub nsw i32 %mx, 2
  %7 = sitofp i32 %6 to double
  %8 = fmul double %5, %7
  %9 = fmul double %8, 3.400000e+01
  ret double %9
}

; Function Attrs: nounwind uwtable
define double @mflops(i32 %nn, double %cpu, double %flop) #0 {
  %1 = fdiv double %flop, %cpu
  %2 = fmul double %1, 1.000000e-06
  %3 = sitofp i32 %nn to double
  %4 = fmul double %2, %3
  ret double %4
}

; Function Attrs: nounwind uwtable
define void @clearMat(%struct.Mat* %Mat) #0 {
  %1 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 0
  %2 = load float** %1, align 8
  %3 = icmp ne float* %2, null
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 0
  %6 = load float** %5, align 8
  %7 = bitcast float* %6 to i8*
  call void @free(i8* %7) #5
  br label %8

; <label>:8                                       ; preds = %4, %0
  %9 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 0
  store float* null, float** %9, align 8
  %10 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 1
  store i32 0, i32* %10, align 4
  %11 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 3
  store i32 0, i32* %11, align 4
  %12 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 2
  store i32 0, i32* %12, align 4
  %13 = getelementptr inbounds %struct.Mat* %Mat, i32 0, i32 4
  store i32 0, i32* %13, align 4
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define double @second() #0 {
  %tm = alloca %struct.timeval, align 8
  %1 = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #5
  %2 = load i32* @second.base_sec, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %14

; <label>:4                                       ; preds = %0
  %5 = load i32* @second.base_usec, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %4
  %8 = getelementptr inbounds %struct.timeval* %tm, i32 0, i32 0
  %9 = load i64* %8, align 8
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* @second.base_sec, align 4
  %11 = getelementptr inbounds %struct.timeval* %tm, i32 0, i32 1
  %12 = load i64* %11, align 8
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* @second.base_usec, align 4
  br label %29

; <label>:14                                      ; preds = %4, %0
  %15 = getelementptr inbounds %struct.timeval* %tm, i32 0, i32 0
  %16 = load i64* %15, align 8
  %17 = load i32* @second.base_sec, align 4
  %18 = sext i32 %17 to i64
  %19 = sub nsw i64 %16, %18
  %20 = sitofp i64 %19 to double
  %21 = getelementptr inbounds %struct.timeval* %tm, i32 0, i32 1
  %22 = load i64* %21, align 8
  %23 = load i32* @second.base_usec, align 4
  %24 = sext i32 %23 to i64
  %25 = sub nsw i64 %22, %24
  %26 = sitofp i64 %25 to double
  %27 = fdiv double %26, 1.000000e+06
  %28 = fadd double %20, %27
  br label %29

; <label>:29                                      ; preds = %14, %7
  %t.0 = phi double [ 0.000000e+00, %7 ], [ %28, %14 ]
  ret double %t.0
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
