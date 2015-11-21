; ModuleID = 'himenobmtxpa.c'
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
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %nn = alloca i32, align 4
  %imax = alloca i32, align 4
  %jmax = alloca i32, align 4
  %kmax = alloca i32, align 4
  %mimax = alloca i32, align 4
  %mjmax = alloca i32, align 4
  %mkmax = alloca i32, align 4
  %msize = alloca [3 x i32], align 4
  %gosa = alloca float, align 4
  %target = alloca float, align 4
  %cpu0 = alloca double, align 8
  %cpu1 = alloca double, align 8
  %cpu = alloca double, align 8
  %flop = alloca double, align 8
  %size = alloca [10 x i8], align 1
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32* %2, align 4
  %5 = icmp eq i32 %4, 2
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds [10 x i8]* %size, i32 0, i32 0
  %8 = load i8*** %3, align 8
  %9 = getelementptr inbounds i8** %8, i64 1
  %10 = load i8** %9, align 8
  %11 = call i8* @strcpy(i8* %7, i8* %10) #5
  br label %23

; <label>:12                                      ; preds = %0
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0))
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i32 0, i32 0))
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0))
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0))
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0))
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0))
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str6, i32 0, i32 0))
  %20 = getelementptr inbounds [10 x i8]* %size, i32 0, i32 0
  %21 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0), i8* %20)
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0))
  br label %23

; <label>:23                                      ; preds = %12, %6
  %24 = getelementptr inbounds [3 x i32]* %msize, i32 0, i32 0
  %25 = getelementptr inbounds [10 x i8]* %size, i32 0, i32 0
  call void @set_param(i32* %24, i8* %25)
  %26 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 0
  %27 = load i32* %26, align 4
  store i32 %27, i32* %mimax, align 4
  %28 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 1
  %29 = load i32* %28, align 4
  store i32 %29, i32* %mjmax, align 4
  %30 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 2
  %31 = load i32* %30, align 4
  store i32 %31, i32* %mkmax, align 4
  %32 = load i32* %mimax, align 4
  %33 = sub nsw i32 %32, 1
  store i32 %33, i32* %imax, align 4
  %34 = load i32* %mjmax, align 4
  %35 = sub nsw i32 %34, 1
  store i32 %35, i32* %jmax, align 4
  %36 = load i32* %mkmax, align 4
  %37 = sub nsw i32 %36, 1
  store i32 %37, i32* %kmax, align 4
  store float 6.000000e+01, float* %target, align 4
  %38 = load i32* %mimax, align 4
  %39 = load i32* %mjmax, align 4
  %40 = load i32* %mkmax, align 4
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str9, i32 0, i32 0), i32 %38, i32 %39, i32 %40)
  %42 = load i32* %imax, align 4
  %43 = load i32* %jmax, align 4
  %44 = load i32* %kmax, align 4
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str10, i32 0, i32 0), i32 %42, i32 %43, i32 %44)
  %46 = load i32* %mimax, align 4
  %47 = load i32* %mjmax, align 4
  %48 = load i32* %mkmax, align 4
  %49 = call i32 @newMat(%struct.Mat* @p, i32 1, i32 %46, i32 %47, i32 %48)
  %50 = load i32* %mimax, align 4
  %51 = load i32* %mjmax, align 4
  %52 = load i32* %mkmax, align 4
  %53 = call i32 @newMat(%struct.Mat* @bnd, i32 1, i32 %50, i32 %51, i32 %52)
  %54 = load i32* %mimax, align 4
  %55 = load i32* %mjmax, align 4
  %56 = load i32* %mkmax, align 4
  %57 = call i32 @newMat(%struct.Mat* @wrk1, i32 1, i32 %54, i32 %55, i32 %56)
  %58 = load i32* %mimax, align 4
  %59 = load i32* %mjmax, align 4
  %60 = load i32* %mkmax, align 4
  %61 = call i32 @newMat(%struct.Mat* @wrk2, i32 1, i32 %58, i32 %59, i32 %60)
  %62 = load i32* %mimax, align 4
  %63 = load i32* %mjmax, align 4
  %64 = load i32* %mkmax, align 4
  %65 = call i32 @newMat(%struct.Mat* @a, i32 4, i32 %62, i32 %63, i32 %64)
  %66 = load i32* %mimax, align 4
  %67 = load i32* %mjmax, align 4
  %68 = load i32* %mkmax, align 4
  %69 = call i32 @newMat(%struct.Mat* @b, i32 3, i32 %66, i32 %67, i32 %68)
  %70 = load i32* %mimax, align 4
  %71 = load i32* %mjmax, align 4
  %72 = load i32* %mkmax, align 4
  %73 = call i32 @newMat(%struct.Mat* @c, i32 3, i32 %70, i32 %71, i32 %72)
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
  store i32 3, i32* %nn, align 4
  %74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str11, i32 0, i32 0))
  %75 = load i32* %nn, align 4
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str12, i32 0, i32 0), i32 %75)
  %77 = call double @second()
  store double %77, double* %cpu0, align 8
  %78 = load i32* %nn, align 4
  %79 = call float @jacobi(i32 %78, %struct.Mat* @a, %struct.Mat* @b, %struct.Mat* @c, %struct.Mat* @p, %struct.Mat* @bnd, %struct.Mat* @wrk1, %struct.Mat* @wrk2)
  store float %79, float* %gosa, align 4
  %80 = call double @second()
  store double %80, double* %cpu1, align 8
  %81 = load double* %cpu1, align 8
  %82 = load double* %cpu0, align 8
  %83 = fsub double %81, %82
  store double %83, double* %cpu, align 8
  %84 = load i32* %imax, align 4
  %85 = load i32* %jmax, align 4
  %86 = load i32* %kmax, align 4
  %87 = call double @fflop(i32 %84, i32 %85, i32 %86)
  store double %87, double* %flop, align 8
  %88 = load i32* %nn, align 4
  %89 = load double* %cpu, align 8
  %90 = load double* %flop, align 8
  %91 = call double @mflops(i32 %88, double %89, double %90)
  %92 = load double* %cpu, align 8
  %93 = load float* %gosa, align 4
  %94 = fpext float %93 to double
  %95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), double %91, double %92, double %94)
  %96 = load float* %target, align 4
  %97 = fpext float %96 to double
  %98 = load double* %cpu, align 8
  %99 = fdiv double %98, 3.000000e+00
  %100 = fdiv double %97, %99
  %101 = fptosi double %100 to i32
  store i32 %101, i32* %nn, align 4
  %102 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str14, i32 0, i32 0))
  %103 = load i32* %nn, align 4
  %104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str15, i32 0, i32 0), i32 %103)
  %105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str16, i32 0, i32 0))
  %106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str17, i32 0, i32 0))
  %107 = call double @second()
  store double %107, double* %cpu0, align 8
  %108 = load i32* %nn, align 4
  %109 = call float @jacobi(i32 %108, %struct.Mat* @a, %struct.Mat* @b, %struct.Mat* @c, %struct.Mat* @p, %struct.Mat* @bnd, %struct.Mat* @wrk1, %struct.Mat* @wrk2)
  store float %109, float* %gosa, align 4
  %110 = call double @second()
  store double %110, double* %cpu1, align 8
  %111 = load double* %cpu1, align 8
  %112 = load double* %cpu0, align 8
  %113 = fsub double %111, %112
  store double %113, double* %cpu, align 8
  %114 = load i32* %nn, align 4
  %115 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str18, i32 0, i32 0), i32 %114)
  %116 = load float* %gosa, align 4
  %117 = fpext float %116 to double
  %118 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str19, i32 0, i32 0), double %117)
  %119 = load i32* %nn, align 4
  %120 = load double* %cpu, align 8
  %121 = load double* %flop, align 8
  %122 = call double @mflops(i32 %119, double %120, double %121)
  %123 = load double* %cpu, align 8
  %124 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str20, i32 0, i32 0), double %122, double %123)
  %125 = load i32* %nn, align 4
  %126 = load double* %cpu, align 8
  %127 = load double* %flop, align 8
  %128 = call double @mflops(i32 %125, double %126, double %127)
  %129 = fdiv double %128, 8.200000e+01
  %130 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([57 x i8]* @.str21, i32 0, i32 0), double %129, i32 84)
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
  %1 = alloca i32*, align 8
  %2 = alloca i8*, align 8
  store i32* %is, i32** %1, align 8
  store i8* %size, i8** %2, align 8
  %3 = load i8** %2, align 8
  %4 = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([3 x i8]* @.str22, i32 0, i32 0)) #6
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %10

; <label>:6                                       ; preds = %0
  %7 = load i8** %2, align 8
  %8 = call i32 @strcmp(i8* %7, i8* getelementptr inbounds ([3 x i8]* @.str23, i32 0, i32 0)) #6
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %17, label %10

; <label>:10                                      ; preds = %6, %0
  %11 = load i32** %1, align 8
  %12 = getelementptr inbounds i32* %11, i64 0
  store i32 32, i32* %12, align 4
  %13 = load i32** %1, align 8
  %14 = getelementptr inbounds i32* %13, i64 1
  store i32 32, i32* %14, align 4
  %15 = load i32** %1, align 8
  %16 = getelementptr inbounds i32* %15, i64 2
  store i32 64, i32* %16, align 4
  br label %79

; <label>:17                                      ; preds = %6
  %18 = load i8** %2, align 8
  %19 = call i32 @strcmp(i8* %18, i8* getelementptr inbounds ([2 x i8]* @.str24, i32 0, i32 0)) #6
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %25

; <label>:21                                      ; preds = %17
  %22 = load i8** %2, align 8
  %23 = call i32 @strcmp(i8* %22, i8* getelementptr inbounds ([2 x i8]* @.str25, i32 0, i32 0)) #6
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %32, label %25

; <label>:25                                      ; preds = %21, %17
  %26 = load i32** %1, align 8
  %27 = getelementptr inbounds i32* %26, i64 0
  store i32 64, i32* %27, align 4
  %28 = load i32** %1, align 8
  %29 = getelementptr inbounds i32* %28, i64 1
  store i32 64, i32* %29, align 4
  %30 = load i32** %1, align 8
  %31 = getelementptr inbounds i32* %30, i64 2
  store i32 128, i32* %31, align 4
  br label %79

; <label>:32                                      ; preds = %21
  %33 = load i8** %2, align 8
  %34 = call i32 @strcmp(i8* %33, i8* getelementptr inbounds ([2 x i8]* @.str26, i32 0, i32 0)) #6
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %40

; <label>:36                                      ; preds = %32
  %37 = load i8** %2, align 8
  %38 = call i32 @strcmp(i8* %37, i8* getelementptr inbounds ([2 x i8]* @.str27, i32 0, i32 0)) #6
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %47, label %40

; <label>:40                                      ; preds = %36, %32
  %41 = load i32** %1, align 8
  %42 = getelementptr inbounds i32* %41, i64 0
  store i32 128, i32* %42, align 4
  %43 = load i32** %1, align 8
  %44 = getelementptr inbounds i32* %43, i64 1
  store i32 128, i32* %44, align 4
  %45 = load i32** %1, align 8
  %46 = getelementptr inbounds i32* %45, i64 2
  store i32 256, i32* %46, align 4
  br label %79

; <label>:47                                      ; preds = %36
  %48 = load i8** %2, align 8
  %49 = call i32 @strcmp(i8* %48, i8* getelementptr inbounds ([2 x i8]* @.str28, i32 0, i32 0)) #6
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %55

; <label>:51                                      ; preds = %47
  %52 = load i8** %2, align 8
  %53 = call i32 @strcmp(i8* %52, i8* getelementptr inbounds ([2 x i8]* @.str29, i32 0, i32 0)) #6
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %62, label %55

; <label>:55                                      ; preds = %51, %47
  %56 = load i32** %1, align 8
  %57 = getelementptr inbounds i32* %56, i64 0
  store i32 256, i32* %57, align 4
  %58 = load i32** %1, align 8
  %59 = getelementptr inbounds i32* %58, i64 1
  store i32 256, i32* %59, align 4
  %60 = load i32** %1, align 8
  %61 = getelementptr inbounds i32* %60, i64 2
  store i32 512, i32* %61, align 4
  br label %79

; <label>:62                                      ; preds = %51
  %63 = load i8** %2, align 8
  %64 = call i32 @strcmp(i8* %63, i8* getelementptr inbounds ([3 x i8]* @.str30, i32 0, i32 0)) #6
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %70

; <label>:66                                      ; preds = %62
  %67 = load i8** %2, align 8
  %68 = call i32 @strcmp(i8* %67, i8* getelementptr inbounds ([3 x i8]* @.str31, i32 0, i32 0)) #6
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %77, label %70

; <label>:70                                      ; preds = %66, %62
  %71 = load i32** %1, align 8
  %72 = getelementptr inbounds i32* %71, i64 0
  store i32 512, i32* %72, align 4
  %73 = load i32** %1, align 8
  %74 = getelementptr inbounds i32* %73, i64 1
  store i32 512, i32* %74, align 4
  %75 = load i32** %1, align 8
  %76 = getelementptr inbounds i32* %75, i64 2
  store i32 1024, i32* %76, align 4
  br label %79

; <label>:77                                      ; preds = %66
  %78 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str32, i32 0, i32 0))
  call void @exit(i32 6) #7
  unreachable

; <label>:79                                      ; preds = %70, %55, %40, %25, %10
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @newMat(%struct.Mat* %Mat, i32 %mnums, i32 %mrows, i32 %mcols, i32 %mdeps) #0 {
  %1 = alloca %struct.Mat*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.Mat* %Mat, %struct.Mat** %1, align 8
  store i32 %mnums, i32* %2, align 4
  store i32 %mrows, i32* %3, align 4
  store i32 %mcols, i32* %4, align 4
  store i32 %mdeps, i32* %5, align 4
  %6 = load i32* %2, align 4
  %7 = load %struct.Mat** %1, align 8
  %8 = getelementptr inbounds %struct.Mat* %7, i32 0, i32 1
  store i32 %6, i32* %8, align 4
  %9 = load i32* %3, align 4
  %10 = load %struct.Mat** %1, align 8
  %11 = getelementptr inbounds %struct.Mat* %10, i32 0, i32 2
  store i32 %9, i32* %11, align 4
  %12 = load i32* %4, align 4
  %13 = load %struct.Mat** %1, align 8
  %14 = getelementptr inbounds %struct.Mat* %13, i32 0, i32 3
  store i32 %12, i32* %14, align 4
  %15 = load i32* %5, align 4
  %16 = load %struct.Mat** %1, align 8
  %17 = getelementptr inbounds %struct.Mat* %16, i32 0, i32 4
  store i32 %15, i32* %17, align 4
  %18 = load %struct.Mat** %1, align 8
  %19 = getelementptr inbounds %struct.Mat* %18, i32 0, i32 0
  store float* null, float** %19, align 8
  %20 = load i32* %2, align 4
  %21 = load i32* %3, align 4
  %22 = mul nsw i32 %20, %21
  %23 = load i32* %4, align 4
  %24 = mul nsw i32 %22, %23
  %25 = load i32* %5, align 4
  %26 = mul nsw i32 %24, %25
  %27 = sext i32 %26 to i64
  %28 = mul i64 %27, 4
  %29 = call noalias i8* @malloc(i64 %28) #5
  %30 = bitcast i8* %29 to float*
  %31 = load %struct.Mat** %1, align 8
  %32 = getelementptr inbounds %struct.Mat* %31, i32 0, i32 0
  store float* %30, float** %32, align 8
  %33 = load %struct.Mat** %1, align 8
  %34 = getelementptr inbounds %struct.Mat* %33, i32 0, i32 0
  %35 = load float** %34, align 8
  %36 = icmp ne float* %35, null
  %37 = select i1 %36, i32 1, i32 0
  ret i32 %37
}

; Function Attrs: nounwind uwtable
define void @mat_set_init(%struct.Mat* %Mat) #0 {
  %1 = alloca %struct.Mat*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %tt = alloca float, align 4
  store %struct.Mat* %Mat, %struct.Mat** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %81, %0
  %3 = load i32* %i, align 4
  %4 = load %struct.Mat** %1, align 8
  %5 = getelementptr inbounds %struct.Mat* %4, i32 0, i32 2
  %6 = load i32* %5, align 4
  %7 = icmp slt i32 %3, %6
  br i1 %7, label %8, label %84

; <label>:8                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %9

; <label>:9                                       ; preds = %77, %8
  %10 = load i32* %j, align 4
  %11 = load %struct.Mat** %1, align 8
  %12 = getelementptr inbounds %struct.Mat* %11, i32 0, i32 3
  %13 = load i32* %12, align 4
  %14 = icmp slt i32 %10, %13
  br i1 %14, label %15, label %80

; <label>:15                                      ; preds = %9
  store i32 0, i32* %k, align 4
  br label %16

; <label>:16                                      ; preds = %73, %15
  %17 = load i32* %k, align 4
  %18 = load %struct.Mat** %1, align 8
  %19 = getelementptr inbounds %struct.Mat* %18, i32 0, i32 4
  %20 = load i32* %19, align 4
  %21 = icmp slt i32 %17, %20
  br i1 %21, label %22, label %76

; <label>:22                                      ; preds = %16
  %23 = load i32* %i, align 4
  %24 = load i32* %i, align 4
  %25 = mul nsw i32 %23, %24
  %26 = sitofp i32 %25 to float
  %27 = load %struct.Mat** %1, align 8
  %28 = getelementptr inbounds %struct.Mat* %27, i32 0, i32 2
  %29 = load i32* %28, align 4
  %30 = sub nsw i32 %29, 1
  %31 = load %struct.Mat** %1, align 8
  %32 = getelementptr inbounds %struct.Mat* %31, i32 0, i32 2
  %33 = load i32* %32, align 4
  %34 = sub nsw i32 %33, 1
  %35 = mul nsw i32 %30, %34
  %36 = sitofp i32 %35 to float
  %37 = fdiv float %26, %36
  %38 = load %struct.Mat** %1, align 8
  %39 = getelementptr inbounds %struct.Mat* %38, i32 0, i32 2
  %40 = load i32* %39, align 4
  %41 = mul nsw i32 0, %40
  %42 = load %struct.Mat** %1, align 8
  %43 = getelementptr inbounds %struct.Mat* %42, i32 0, i32 3
  %44 = load i32* %43, align 4
  %45 = mul nsw i32 %41, %44
  %46 = load %struct.Mat** %1, align 8
  %47 = getelementptr inbounds %struct.Mat* %46, i32 0, i32 4
  %48 = load i32* %47, align 4
  %49 = mul nsw i32 %45, %48
  %50 = load i32* %i, align 4
  %51 = load %struct.Mat** %1, align 8
  %52 = getelementptr inbounds %struct.Mat* %51, i32 0, i32 3
  %53 = load i32* %52, align 4
  %54 = mul nsw i32 %50, %53
  %55 = load %struct.Mat** %1, align 8
  %56 = getelementptr inbounds %struct.Mat* %55, i32 0, i32 4
  %57 = load i32* %56, align 4
  %58 = mul nsw i32 %54, %57
  %59 = add nsw i32 %49, %58
  %60 = load i32* %j, align 4
  %61 = load %struct.Mat** %1, align 8
  %62 = getelementptr inbounds %struct.Mat* %61, i32 0, i32 4
  %63 = load i32* %62, align 4
  %64 = mul nsw i32 %60, %63
  %65 = add nsw i32 %59, %64
  %66 = load i32* %k, align 4
  %67 = add nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = load %struct.Mat** %1, align 8
  %70 = getelementptr inbounds %struct.Mat* %69, i32 0, i32 0
  %71 = load float** %70, align 8
  %72 = getelementptr inbounds float* %71, i64 %68
  store float %37, float* %72, align 4
  br label %73

; <label>:73                                      ; preds = %22
  %74 = load i32* %k, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %k, align 4
  br label %16

; <label>:76                                      ; preds = %16
  br label %77

; <label>:77                                      ; preds = %76
  %78 = load i32* %j, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %j, align 4
  br label %9

; <label>:80                                      ; preds = %9
  br label %81

; <label>:81                                      ; preds = %80
  %82 = load i32* %i, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %i, align 4
  br label %2

; <label>:84                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind uwtable
define void @mat_set(%struct.Mat* %Mat, i32 %l, float %val) #0 {
  %1 = alloca %struct.Mat*, align 8
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store %struct.Mat* %Mat, %struct.Mat** %1, align 8
  store i32 %l, i32* %2, align 4
  store float %val, float* %3, align 4
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %70, %0
  %5 = load i32* %i, align 4
  %6 = load %struct.Mat** %1, align 8
  %7 = getelementptr inbounds %struct.Mat* %6, i32 0, i32 2
  %8 = load i32* %7, align 4
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %73

; <label>:10                                      ; preds = %4
  store i32 0, i32* %j, align 4
  br label %11

; <label>:11                                      ; preds = %66, %10
  %12 = load i32* %j, align 4
  %13 = load %struct.Mat** %1, align 8
  %14 = getelementptr inbounds %struct.Mat* %13, i32 0, i32 3
  %15 = load i32* %14, align 4
  %16 = icmp slt i32 %12, %15
  br i1 %16, label %17, label %69

; <label>:17                                      ; preds = %11
  store i32 0, i32* %k, align 4
  br label %18

; <label>:18                                      ; preds = %62, %17
  %19 = load i32* %k, align 4
  %20 = load %struct.Mat** %1, align 8
  %21 = getelementptr inbounds %struct.Mat* %20, i32 0, i32 4
  %22 = load i32* %21, align 4
  %23 = icmp slt i32 %19, %22
  br i1 %23, label %24, label %65

; <label>:24                                      ; preds = %18
  %25 = load float* %3, align 4
  %26 = load i32* %2, align 4
  %27 = load %struct.Mat** %1, align 8
  %28 = getelementptr inbounds %struct.Mat* %27, i32 0, i32 2
  %29 = load i32* %28, align 4
  %30 = mul nsw i32 %26, %29
  %31 = load %struct.Mat** %1, align 8
  %32 = getelementptr inbounds %struct.Mat* %31, i32 0, i32 3
  %33 = load i32* %32, align 4
  %34 = mul nsw i32 %30, %33
  %35 = load %struct.Mat** %1, align 8
  %36 = getelementptr inbounds %struct.Mat* %35, i32 0, i32 4
  %37 = load i32* %36, align 4
  %38 = mul nsw i32 %34, %37
  %39 = load i32* %i, align 4
  %40 = load %struct.Mat** %1, align 8
  %41 = getelementptr inbounds %struct.Mat* %40, i32 0, i32 3
  %42 = load i32* %41, align 4
  %43 = mul nsw i32 %39, %42
  %44 = load %struct.Mat** %1, align 8
  %45 = getelementptr inbounds %struct.Mat* %44, i32 0, i32 4
  %46 = load i32* %45, align 4
  %47 = mul nsw i32 %43, %46
  %48 = add nsw i32 %38, %47
  %49 = load i32* %j, align 4
  %50 = load %struct.Mat** %1, align 8
  %51 = getelementptr inbounds %struct.Mat* %50, i32 0, i32 4
  %52 = load i32* %51, align 4
  %53 = mul nsw i32 %49, %52
  %54 = add nsw i32 %48, %53
  %55 = load i32* %k, align 4
  %56 = add nsw i32 %54, %55
  %57 = sext i32 %56 to i64
  %58 = load %struct.Mat** %1, align 8
  %59 = getelementptr inbounds %struct.Mat* %58, i32 0, i32 0
  %60 = load float** %59, align 8
  %61 = getelementptr inbounds float* %60, i64 %57
  store float %25, float* %61, align 4
  br label %62

; <label>:62                                      ; preds = %24
  %63 = load i32* %k, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %k, align 4
  br label %18

; <label>:65                                      ; preds = %18
  br label %66

; <label>:66                                      ; preds = %65
  %67 = load i32* %j, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %j, align 4
  br label %11

; <label>:69                                      ; preds = %11
  br label %70

; <label>:70                                      ; preds = %69
  %71 = load i32* %i, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %i, align 4
  br label %4

; <label>:73                                      ; preds = %4
  ret void
}

; Function Attrs: nounwind uwtable
define float @jacobi(i32 %nn, %struct.Mat* %a, %struct.Mat* %b, %struct.Mat* %c, %struct.Mat* %p, %struct.Mat* %bnd, %struct.Mat* %wrk1, %struct.Mat* %wrk2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Mat*, align 8
  %3 = alloca %struct.Mat*, align 8
  %4 = alloca %struct.Mat*, align 8
  %5 = alloca %struct.Mat*, align 8
  %6 = alloca %struct.Mat*, align 8
  %7 = alloca %struct.Mat*, align 8
  %8 = alloca %struct.Mat*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  %imax = alloca i32, align 4
  %jmax = alloca i32, align 4
  %kmax = alloca i32, align 4
  %gosa = alloca float, align 4
  %s0 = alloca float, align 4
  %ss = alloca float, align 4
  store i32 %nn, i32* %1, align 4
  store %struct.Mat* %a, %struct.Mat** %2, align 8
  store %struct.Mat* %b, %struct.Mat** %3, align 8
  store %struct.Mat* %c, %struct.Mat** %4, align 8
  store %struct.Mat* %p, %struct.Mat** %5, align 8
  store %struct.Mat* %bnd, %struct.Mat** %6, align 8
  store %struct.Mat* %wrk1, %struct.Mat** %7, align 8
  store %struct.Mat* %wrk2, %struct.Mat** %8, align 8
  %9 = load %struct.Mat** %5, align 8
  %10 = getelementptr inbounds %struct.Mat* %9, i32 0, i32 2
  %11 = load i32* %10, align 4
  %12 = sub nsw i32 %11, 1
  store i32 %12, i32* %imax, align 4
  %13 = load %struct.Mat** %5, align 8
  %14 = getelementptr inbounds %struct.Mat* %13, i32 0, i32 3
  %15 = load i32* %14, align 4
  %16 = sub nsw i32 %15, 1
  store i32 %16, i32* %jmax, align 4
  %17 = load %struct.Mat** %5, align 8
  %18 = getelementptr inbounds %struct.Mat* %17, i32 0, i32 4
  %19 = load i32* %18, align 4
  %20 = sub nsw i32 %19, 1
  store i32 %20, i32* %kmax, align 4
  store i32 0, i32* %n, align 4
  br label %21

; <label>:21                                      ; preds = %1408, %0
  %22 = load i32* %n, align 4
  %23 = load i32* %1, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %1411

; <label>:25                                      ; preds = %21
  store float 0.000000e+00, float* %gosa, align 4
  store i32 1, i32* %i, align 4
  br label %26

; <label>:26                                      ; preds = %1306, %25
  %27 = load i32* %i, align 4
  %28 = load i32* %imax, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %1309

; <label>:30                                      ; preds = %26
  store i32 1, i32* %j, align 4
  br label %31

; <label>:31                                      ; preds = %1302, %30
  %32 = load i32* %j, align 4
  %33 = load i32* %jmax, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %1305

; <label>:35                                      ; preds = %31
  store i32 1, i32* %k, align 4
  br label %36

; <label>:36                                      ; preds = %1298, %35
  %37 = load i32* %k, align 4
  %38 = load i32* %kmax, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %40, label %1301

; <label>:40                                      ; preds = %36
  %41 = load %struct.Mat** %2, align 8
  %42 = getelementptr inbounds %struct.Mat* %41, i32 0, i32 2
  %43 = load i32* %42, align 4
  %44 = mul nsw i32 0, %43
  %45 = load %struct.Mat** %2, align 8
  %46 = getelementptr inbounds %struct.Mat* %45, i32 0, i32 3
  %47 = load i32* %46, align 4
  %48 = mul nsw i32 %44, %47
  %49 = load %struct.Mat** %2, align 8
  %50 = getelementptr inbounds %struct.Mat* %49, i32 0, i32 4
  %51 = load i32* %50, align 4
  %52 = mul nsw i32 %48, %51
  %53 = load i32* %i, align 4
  %54 = load %struct.Mat** %2, align 8
  %55 = getelementptr inbounds %struct.Mat* %54, i32 0, i32 3
  %56 = load i32* %55, align 4
  %57 = mul nsw i32 %53, %56
  %58 = load %struct.Mat** %2, align 8
  %59 = getelementptr inbounds %struct.Mat* %58, i32 0, i32 4
  %60 = load i32* %59, align 4
  %61 = mul nsw i32 %57, %60
  %62 = add nsw i32 %52, %61
  %63 = load i32* %j, align 4
  %64 = load %struct.Mat** %2, align 8
  %65 = getelementptr inbounds %struct.Mat* %64, i32 0, i32 4
  %66 = load i32* %65, align 4
  %67 = mul nsw i32 %63, %66
  %68 = add nsw i32 %62, %67
  %69 = load i32* %k, align 4
  %70 = add nsw i32 %68, %69
  %71 = sext i32 %70 to i64
  %72 = load %struct.Mat** %2, align 8
  %73 = getelementptr inbounds %struct.Mat* %72, i32 0, i32 0
  %74 = load float** %73, align 8
  %75 = getelementptr inbounds float* %74, i64 %71
  %76 = load float* %75, align 4
  %77 = load %struct.Mat** %5, align 8
  %78 = getelementptr inbounds %struct.Mat* %77, i32 0, i32 2
  %79 = load i32* %78, align 4
  %80 = mul nsw i32 0, %79
  %81 = load %struct.Mat** %5, align 8
  %82 = getelementptr inbounds %struct.Mat* %81, i32 0, i32 3
  %83 = load i32* %82, align 4
  %84 = mul nsw i32 %80, %83
  %85 = load %struct.Mat** %5, align 8
  %86 = getelementptr inbounds %struct.Mat* %85, i32 0, i32 4
  %87 = load i32* %86, align 4
  %88 = mul nsw i32 %84, %87
  %89 = load i32* %i, align 4
  %90 = add nsw i32 %89, 1
  %91 = load %struct.Mat** %5, align 8
  %92 = getelementptr inbounds %struct.Mat* %91, i32 0, i32 3
  %93 = load i32* %92, align 4
  %94 = mul nsw i32 %90, %93
  %95 = load %struct.Mat** %5, align 8
  %96 = getelementptr inbounds %struct.Mat* %95, i32 0, i32 4
  %97 = load i32* %96, align 4
  %98 = mul nsw i32 %94, %97
  %99 = add nsw i32 %88, %98
  %100 = load i32* %j, align 4
  %101 = load %struct.Mat** %5, align 8
  %102 = getelementptr inbounds %struct.Mat* %101, i32 0, i32 4
  %103 = load i32* %102, align 4
  %104 = mul nsw i32 %100, %103
  %105 = add nsw i32 %99, %104
  %106 = load i32* %k, align 4
  %107 = add nsw i32 %105, %106
  %108 = sext i32 %107 to i64
  %109 = load %struct.Mat** %5, align 8
  %110 = getelementptr inbounds %struct.Mat* %109, i32 0, i32 0
  %111 = load float** %110, align 8
  %112 = getelementptr inbounds float* %111, i64 %108
  %113 = load float* %112, align 4
  %114 = fmul float %76, %113
  %115 = load %struct.Mat** %2, align 8
  %116 = getelementptr inbounds %struct.Mat* %115, i32 0, i32 2
  %117 = load i32* %116, align 4
  %118 = mul nsw i32 1, %117
  %119 = load %struct.Mat** %2, align 8
  %120 = getelementptr inbounds %struct.Mat* %119, i32 0, i32 3
  %121 = load i32* %120, align 4
  %122 = mul nsw i32 %118, %121
  %123 = load %struct.Mat** %2, align 8
  %124 = getelementptr inbounds %struct.Mat* %123, i32 0, i32 4
  %125 = load i32* %124, align 4
  %126 = mul nsw i32 %122, %125
  %127 = load i32* %i, align 4
  %128 = load %struct.Mat** %2, align 8
  %129 = getelementptr inbounds %struct.Mat* %128, i32 0, i32 3
  %130 = load i32* %129, align 4
  %131 = mul nsw i32 %127, %130
  %132 = load %struct.Mat** %2, align 8
  %133 = getelementptr inbounds %struct.Mat* %132, i32 0, i32 4
  %134 = load i32* %133, align 4
  %135 = mul nsw i32 %131, %134
  %136 = add nsw i32 %126, %135
  %137 = load i32* %j, align 4
  %138 = load %struct.Mat** %2, align 8
  %139 = getelementptr inbounds %struct.Mat* %138, i32 0, i32 4
  %140 = load i32* %139, align 4
  %141 = mul nsw i32 %137, %140
  %142 = add nsw i32 %136, %141
  %143 = load i32* %k, align 4
  %144 = add nsw i32 %142, %143
  %145 = sext i32 %144 to i64
  %146 = load %struct.Mat** %2, align 8
  %147 = getelementptr inbounds %struct.Mat* %146, i32 0, i32 0
  %148 = load float** %147, align 8
  %149 = getelementptr inbounds float* %148, i64 %145
  %150 = load float* %149, align 4
  %151 = load %struct.Mat** %5, align 8
  %152 = getelementptr inbounds %struct.Mat* %151, i32 0, i32 2
  %153 = load i32* %152, align 4
  %154 = mul nsw i32 0, %153
  %155 = load %struct.Mat** %5, align 8
  %156 = getelementptr inbounds %struct.Mat* %155, i32 0, i32 3
  %157 = load i32* %156, align 4
  %158 = mul nsw i32 %154, %157
  %159 = load %struct.Mat** %5, align 8
  %160 = getelementptr inbounds %struct.Mat* %159, i32 0, i32 4
  %161 = load i32* %160, align 4
  %162 = mul nsw i32 %158, %161
  %163 = load i32* %i, align 4
  %164 = load %struct.Mat** %5, align 8
  %165 = getelementptr inbounds %struct.Mat* %164, i32 0, i32 3
  %166 = load i32* %165, align 4
  %167 = mul nsw i32 %163, %166
  %168 = load %struct.Mat** %5, align 8
  %169 = getelementptr inbounds %struct.Mat* %168, i32 0, i32 4
  %170 = load i32* %169, align 4
  %171 = mul nsw i32 %167, %170
  %172 = add nsw i32 %162, %171
  %173 = load i32* %j, align 4
  %174 = add nsw i32 %173, 1
  %175 = load %struct.Mat** %5, align 8
  %176 = getelementptr inbounds %struct.Mat* %175, i32 0, i32 4
  %177 = load i32* %176, align 4
  %178 = mul nsw i32 %174, %177
  %179 = add nsw i32 %172, %178
  %180 = load i32* %k, align 4
  %181 = add nsw i32 %179, %180
  %182 = sext i32 %181 to i64
  %183 = load %struct.Mat** %5, align 8
  %184 = getelementptr inbounds %struct.Mat* %183, i32 0, i32 0
  %185 = load float** %184, align 8
  %186 = getelementptr inbounds float* %185, i64 %182
  %187 = load float* %186, align 4
  %188 = fmul float %150, %187
  %189 = fadd float %114, %188
  %190 = load %struct.Mat** %2, align 8
  %191 = getelementptr inbounds %struct.Mat* %190, i32 0, i32 2
  %192 = load i32* %191, align 4
  %193 = mul nsw i32 2, %192
  %194 = load %struct.Mat** %2, align 8
  %195 = getelementptr inbounds %struct.Mat* %194, i32 0, i32 3
  %196 = load i32* %195, align 4
  %197 = mul nsw i32 %193, %196
  %198 = load %struct.Mat** %2, align 8
  %199 = getelementptr inbounds %struct.Mat* %198, i32 0, i32 4
  %200 = load i32* %199, align 4
  %201 = mul nsw i32 %197, %200
  %202 = load i32* %i, align 4
  %203 = load %struct.Mat** %2, align 8
  %204 = getelementptr inbounds %struct.Mat* %203, i32 0, i32 3
  %205 = load i32* %204, align 4
  %206 = mul nsw i32 %202, %205
  %207 = load %struct.Mat** %2, align 8
  %208 = getelementptr inbounds %struct.Mat* %207, i32 0, i32 4
  %209 = load i32* %208, align 4
  %210 = mul nsw i32 %206, %209
  %211 = add nsw i32 %201, %210
  %212 = load i32* %j, align 4
  %213 = load %struct.Mat** %2, align 8
  %214 = getelementptr inbounds %struct.Mat* %213, i32 0, i32 4
  %215 = load i32* %214, align 4
  %216 = mul nsw i32 %212, %215
  %217 = add nsw i32 %211, %216
  %218 = load i32* %k, align 4
  %219 = add nsw i32 %217, %218
  %220 = sext i32 %219 to i64
  %221 = load %struct.Mat** %2, align 8
  %222 = getelementptr inbounds %struct.Mat* %221, i32 0, i32 0
  %223 = load float** %222, align 8
  %224 = getelementptr inbounds float* %223, i64 %220
  %225 = load float* %224, align 4
  %226 = load %struct.Mat** %5, align 8
  %227 = getelementptr inbounds %struct.Mat* %226, i32 0, i32 2
  %228 = load i32* %227, align 4
  %229 = mul nsw i32 0, %228
  %230 = load %struct.Mat** %5, align 8
  %231 = getelementptr inbounds %struct.Mat* %230, i32 0, i32 3
  %232 = load i32* %231, align 4
  %233 = mul nsw i32 %229, %232
  %234 = load %struct.Mat** %5, align 8
  %235 = getelementptr inbounds %struct.Mat* %234, i32 0, i32 4
  %236 = load i32* %235, align 4
  %237 = mul nsw i32 %233, %236
  %238 = load i32* %i, align 4
  %239 = load %struct.Mat** %5, align 8
  %240 = getelementptr inbounds %struct.Mat* %239, i32 0, i32 3
  %241 = load i32* %240, align 4
  %242 = mul nsw i32 %238, %241
  %243 = load %struct.Mat** %5, align 8
  %244 = getelementptr inbounds %struct.Mat* %243, i32 0, i32 4
  %245 = load i32* %244, align 4
  %246 = mul nsw i32 %242, %245
  %247 = add nsw i32 %237, %246
  %248 = load i32* %j, align 4
  %249 = load %struct.Mat** %5, align 8
  %250 = getelementptr inbounds %struct.Mat* %249, i32 0, i32 4
  %251 = load i32* %250, align 4
  %252 = mul nsw i32 %248, %251
  %253 = add nsw i32 %247, %252
  %254 = load i32* %k, align 4
  %255 = add nsw i32 %254, 1
  %256 = add nsw i32 %253, %255
  %257 = sext i32 %256 to i64
  %258 = load %struct.Mat** %5, align 8
  %259 = getelementptr inbounds %struct.Mat* %258, i32 0, i32 0
  %260 = load float** %259, align 8
  %261 = getelementptr inbounds float* %260, i64 %257
  %262 = load float* %261, align 4
  %263 = fmul float %225, %262
  %264 = fadd float %189, %263
  %265 = load %struct.Mat** %3, align 8
  %266 = getelementptr inbounds %struct.Mat* %265, i32 0, i32 2
  %267 = load i32* %266, align 4
  %268 = mul nsw i32 0, %267
  %269 = load %struct.Mat** %3, align 8
  %270 = getelementptr inbounds %struct.Mat* %269, i32 0, i32 3
  %271 = load i32* %270, align 4
  %272 = mul nsw i32 %268, %271
  %273 = load %struct.Mat** %3, align 8
  %274 = getelementptr inbounds %struct.Mat* %273, i32 0, i32 4
  %275 = load i32* %274, align 4
  %276 = mul nsw i32 %272, %275
  %277 = load i32* %i, align 4
  %278 = load %struct.Mat** %3, align 8
  %279 = getelementptr inbounds %struct.Mat* %278, i32 0, i32 3
  %280 = load i32* %279, align 4
  %281 = mul nsw i32 %277, %280
  %282 = load %struct.Mat** %3, align 8
  %283 = getelementptr inbounds %struct.Mat* %282, i32 0, i32 4
  %284 = load i32* %283, align 4
  %285 = mul nsw i32 %281, %284
  %286 = add nsw i32 %276, %285
  %287 = load i32* %j, align 4
  %288 = load %struct.Mat** %3, align 8
  %289 = getelementptr inbounds %struct.Mat* %288, i32 0, i32 4
  %290 = load i32* %289, align 4
  %291 = mul nsw i32 %287, %290
  %292 = add nsw i32 %286, %291
  %293 = load i32* %k, align 4
  %294 = add nsw i32 %292, %293
  %295 = sext i32 %294 to i64
  %296 = load %struct.Mat** %3, align 8
  %297 = getelementptr inbounds %struct.Mat* %296, i32 0, i32 0
  %298 = load float** %297, align 8
  %299 = getelementptr inbounds float* %298, i64 %295
  %300 = load float* %299, align 4
  %301 = load %struct.Mat** %5, align 8
  %302 = getelementptr inbounds %struct.Mat* %301, i32 0, i32 2
  %303 = load i32* %302, align 4
  %304 = mul nsw i32 0, %303
  %305 = load %struct.Mat** %5, align 8
  %306 = getelementptr inbounds %struct.Mat* %305, i32 0, i32 3
  %307 = load i32* %306, align 4
  %308 = mul nsw i32 %304, %307
  %309 = load %struct.Mat** %5, align 8
  %310 = getelementptr inbounds %struct.Mat* %309, i32 0, i32 4
  %311 = load i32* %310, align 4
  %312 = mul nsw i32 %308, %311
  %313 = load i32* %i, align 4
  %314 = add nsw i32 %313, 1
  %315 = load %struct.Mat** %5, align 8
  %316 = getelementptr inbounds %struct.Mat* %315, i32 0, i32 3
  %317 = load i32* %316, align 4
  %318 = mul nsw i32 %314, %317
  %319 = load %struct.Mat** %5, align 8
  %320 = getelementptr inbounds %struct.Mat* %319, i32 0, i32 4
  %321 = load i32* %320, align 4
  %322 = mul nsw i32 %318, %321
  %323 = add nsw i32 %312, %322
  %324 = load i32* %j, align 4
  %325 = add nsw i32 %324, 1
  %326 = load %struct.Mat** %5, align 8
  %327 = getelementptr inbounds %struct.Mat* %326, i32 0, i32 4
  %328 = load i32* %327, align 4
  %329 = mul nsw i32 %325, %328
  %330 = add nsw i32 %323, %329
  %331 = load i32* %k, align 4
  %332 = add nsw i32 %330, %331
  %333 = sext i32 %332 to i64
  %334 = load %struct.Mat** %5, align 8
  %335 = getelementptr inbounds %struct.Mat* %334, i32 0, i32 0
  %336 = load float** %335, align 8
  %337 = getelementptr inbounds float* %336, i64 %333
  %338 = load float* %337, align 4
  %339 = load %struct.Mat** %5, align 8
  %340 = getelementptr inbounds %struct.Mat* %339, i32 0, i32 2
  %341 = load i32* %340, align 4
  %342 = mul nsw i32 0, %341
  %343 = load %struct.Mat** %5, align 8
  %344 = getelementptr inbounds %struct.Mat* %343, i32 0, i32 3
  %345 = load i32* %344, align 4
  %346 = mul nsw i32 %342, %345
  %347 = load %struct.Mat** %5, align 8
  %348 = getelementptr inbounds %struct.Mat* %347, i32 0, i32 4
  %349 = load i32* %348, align 4
  %350 = mul nsw i32 %346, %349
  %351 = load i32* %i, align 4
  %352 = add nsw i32 %351, 1
  %353 = load %struct.Mat** %5, align 8
  %354 = getelementptr inbounds %struct.Mat* %353, i32 0, i32 3
  %355 = load i32* %354, align 4
  %356 = mul nsw i32 %352, %355
  %357 = load %struct.Mat** %5, align 8
  %358 = getelementptr inbounds %struct.Mat* %357, i32 0, i32 4
  %359 = load i32* %358, align 4
  %360 = mul nsw i32 %356, %359
  %361 = add nsw i32 %350, %360
  %362 = load i32* %j, align 4
  %363 = sub nsw i32 %362, 1
  %364 = load %struct.Mat** %5, align 8
  %365 = getelementptr inbounds %struct.Mat* %364, i32 0, i32 4
  %366 = load i32* %365, align 4
  %367 = mul nsw i32 %363, %366
  %368 = add nsw i32 %361, %367
  %369 = load i32* %k, align 4
  %370 = add nsw i32 %368, %369
  %371 = sext i32 %370 to i64
  %372 = load %struct.Mat** %5, align 8
  %373 = getelementptr inbounds %struct.Mat* %372, i32 0, i32 0
  %374 = load float** %373, align 8
  %375 = getelementptr inbounds float* %374, i64 %371
  %376 = load float* %375, align 4
  %377 = fsub float %338, %376
  %378 = load %struct.Mat** %5, align 8
  %379 = getelementptr inbounds %struct.Mat* %378, i32 0, i32 2
  %380 = load i32* %379, align 4
  %381 = mul nsw i32 0, %380
  %382 = load %struct.Mat** %5, align 8
  %383 = getelementptr inbounds %struct.Mat* %382, i32 0, i32 3
  %384 = load i32* %383, align 4
  %385 = mul nsw i32 %381, %384
  %386 = load %struct.Mat** %5, align 8
  %387 = getelementptr inbounds %struct.Mat* %386, i32 0, i32 4
  %388 = load i32* %387, align 4
  %389 = mul nsw i32 %385, %388
  %390 = load i32* %i, align 4
  %391 = sub nsw i32 %390, 1
  %392 = load %struct.Mat** %5, align 8
  %393 = getelementptr inbounds %struct.Mat* %392, i32 0, i32 3
  %394 = load i32* %393, align 4
  %395 = mul nsw i32 %391, %394
  %396 = load %struct.Mat** %5, align 8
  %397 = getelementptr inbounds %struct.Mat* %396, i32 0, i32 4
  %398 = load i32* %397, align 4
  %399 = mul nsw i32 %395, %398
  %400 = add nsw i32 %389, %399
  %401 = load i32* %j, align 4
  %402 = add nsw i32 %401, 1
  %403 = load %struct.Mat** %5, align 8
  %404 = getelementptr inbounds %struct.Mat* %403, i32 0, i32 4
  %405 = load i32* %404, align 4
  %406 = mul nsw i32 %402, %405
  %407 = add nsw i32 %400, %406
  %408 = load i32* %k, align 4
  %409 = add nsw i32 %407, %408
  %410 = sext i32 %409 to i64
  %411 = load %struct.Mat** %5, align 8
  %412 = getelementptr inbounds %struct.Mat* %411, i32 0, i32 0
  %413 = load float** %412, align 8
  %414 = getelementptr inbounds float* %413, i64 %410
  %415 = load float* %414, align 4
  %416 = fsub float %377, %415
  %417 = load %struct.Mat** %5, align 8
  %418 = getelementptr inbounds %struct.Mat* %417, i32 0, i32 2
  %419 = load i32* %418, align 4
  %420 = mul nsw i32 0, %419
  %421 = load %struct.Mat** %5, align 8
  %422 = getelementptr inbounds %struct.Mat* %421, i32 0, i32 3
  %423 = load i32* %422, align 4
  %424 = mul nsw i32 %420, %423
  %425 = load %struct.Mat** %5, align 8
  %426 = getelementptr inbounds %struct.Mat* %425, i32 0, i32 4
  %427 = load i32* %426, align 4
  %428 = mul nsw i32 %424, %427
  %429 = load i32* %i, align 4
  %430 = sub nsw i32 %429, 1
  %431 = load %struct.Mat** %5, align 8
  %432 = getelementptr inbounds %struct.Mat* %431, i32 0, i32 3
  %433 = load i32* %432, align 4
  %434 = mul nsw i32 %430, %433
  %435 = load %struct.Mat** %5, align 8
  %436 = getelementptr inbounds %struct.Mat* %435, i32 0, i32 4
  %437 = load i32* %436, align 4
  %438 = mul nsw i32 %434, %437
  %439 = add nsw i32 %428, %438
  %440 = load i32* %j, align 4
  %441 = sub nsw i32 %440, 1
  %442 = load %struct.Mat** %5, align 8
  %443 = getelementptr inbounds %struct.Mat* %442, i32 0, i32 4
  %444 = load i32* %443, align 4
  %445 = mul nsw i32 %441, %444
  %446 = add nsw i32 %439, %445
  %447 = load i32* %k, align 4
  %448 = add nsw i32 %446, %447
  %449 = sext i32 %448 to i64
  %450 = load %struct.Mat** %5, align 8
  %451 = getelementptr inbounds %struct.Mat* %450, i32 0, i32 0
  %452 = load float** %451, align 8
  %453 = getelementptr inbounds float* %452, i64 %449
  %454 = load float* %453, align 4
  %455 = fadd float %416, %454
  %456 = fmul float %300, %455
  %457 = fadd float %264, %456
  %458 = load %struct.Mat** %3, align 8
  %459 = getelementptr inbounds %struct.Mat* %458, i32 0, i32 2
  %460 = load i32* %459, align 4
  %461 = mul nsw i32 1, %460
  %462 = load %struct.Mat** %3, align 8
  %463 = getelementptr inbounds %struct.Mat* %462, i32 0, i32 3
  %464 = load i32* %463, align 4
  %465 = mul nsw i32 %461, %464
  %466 = load %struct.Mat** %3, align 8
  %467 = getelementptr inbounds %struct.Mat* %466, i32 0, i32 4
  %468 = load i32* %467, align 4
  %469 = mul nsw i32 %465, %468
  %470 = load i32* %i, align 4
  %471 = load %struct.Mat** %3, align 8
  %472 = getelementptr inbounds %struct.Mat* %471, i32 0, i32 3
  %473 = load i32* %472, align 4
  %474 = mul nsw i32 %470, %473
  %475 = load %struct.Mat** %3, align 8
  %476 = getelementptr inbounds %struct.Mat* %475, i32 0, i32 4
  %477 = load i32* %476, align 4
  %478 = mul nsw i32 %474, %477
  %479 = add nsw i32 %469, %478
  %480 = load i32* %j, align 4
  %481 = load %struct.Mat** %3, align 8
  %482 = getelementptr inbounds %struct.Mat* %481, i32 0, i32 4
  %483 = load i32* %482, align 4
  %484 = mul nsw i32 %480, %483
  %485 = add nsw i32 %479, %484
  %486 = load i32* %k, align 4
  %487 = add nsw i32 %485, %486
  %488 = sext i32 %487 to i64
  %489 = load %struct.Mat** %3, align 8
  %490 = getelementptr inbounds %struct.Mat* %489, i32 0, i32 0
  %491 = load float** %490, align 8
  %492 = getelementptr inbounds float* %491, i64 %488
  %493 = load float* %492, align 4
  %494 = load %struct.Mat** %5, align 8
  %495 = getelementptr inbounds %struct.Mat* %494, i32 0, i32 2
  %496 = load i32* %495, align 4
  %497 = mul nsw i32 0, %496
  %498 = load %struct.Mat** %5, align 8
  %499 = getelementptr inbounds %struct.Mat* %498, i32 0, i32 3
  %500 = load i32* %499, align 4
  %501 = mul nsw i32 %497, %500
  %502 = load %struct.Mat** %5, align 8
  %503 = getelementptr inbounds %struct.Mat* %502, i32 0, i32 4
  %504 = load i32* %503, align 4
  %505 = mul nsw i32 %501, %504
  %506 = load i32* %i, align 4
  %507 = load %struct.Mat** %5, align 8
  %508 = getelementptr inbounds %struct.Mat* %507, i32 0, i32 3
  %509 = load i32* %508, align 4
  %510 = mul nsw i32 %506, %509
  %511 = load %struct.Mat** %5, align 8
  %512 = getelementptr inbounds %struct.Mat* %511, i32 0, i32 4
  %513 = load i32* %512, align 4
  %514 = mul nsw i32 %510, %513
  %515 = add nsw i32 %505, %514
  %516 = load i32* %j, align 4
  %517 = add nsw i32 %516, 1
  %518 = load %struct.Mat** %5, align 8
  %519 = getelementptr inbounds %struct.Mat* %518, i32 0, i32 4
  %520 = load i32* %519, align 4
  %521 = mul nsw i32 %517, %520
  %522 = add nsw i32 %515, %521
  %523 = load i32* %k, align 4
  %524 = add nsw i32 %523, 1
  %525 = add nsw i32 %522, %524
  %526 = sext i32 %525 to i64
  %527 = load %struct.Mat** %5, align 8
  %528 = getelementptr inbounds %struct.Mat* %527, i32 0, i32 0
  %529 = load float** %528, align 8
  %530 = getelementptr inbounds float* %529, i64 %526
  %531 = load float* %530, align 4
  %532 = load %struct.Mat** %5, align 8
  %533 = getelementptr inbounds %struct.Mat* %532, i32 0, i32 2
  %534 = load i32* %533, align 4
  %535 = mul nsw i32 0, %534
  %536 = load %struct.Mat** %5, align 8
  %537 = getelementptr inbounds %struct.Mat* %536, i32 0, i32 3
  %538 = load i32* %537, align 4
  %539 = mul nsw i32 %535, %538
  %540 = load %struct.Mat** %5, align 8
  %541 = getelementptr inbounds %struct.Mat* %540, i32 0, i32 4
  %542 = load i32* %541, align 4
  %543 = mul nsw i32 %539, %542
  %544 = load i32* %i, align 4
  %545 = load %struct.Mat** %5, align 8
  %546 = getelementptr inbounds %struct.Mat* %545, i32 0, i32 3
  %547 = load i32* %546, align 4
  %548 = mul nsw i32 %544, %547
  %549 = load %struct.Mat** %5, align 8
  %550 = getelementptr inbounds %struct.Mat* %549, i32 0, i32 4
  %551 = load i32* %550, align 4
  %552 = mul nsw i32 %548, %551
  %553 = add nsw i32 %543, %552
  %554 = load i32* %j, align 4
  %555 = sub nsw i32 %554, 1
  %556 = load %struct.Mat** %5, align 8
  %557 = getelementptr inbounds %struct.Mat* %556, i32 0, i32 4
  %558 = load i32* %557, align 4
  %559 = mul nsw i32 %555, %558
  %560 = add nsw i32 %553, %559
  %561 = load i32* %k, align 4
  %562 = add nsw i32 %561, 1
  %563 = add nsw i32 %560, %562
  %564 = sext i32 %563 to i64
  %565 = load %struct.Mat** %5, align 8
  %566 = getelementptr inbounds %struct.Mat* %565, i32 0, i32 0
  %567 = load float** %566, align 8
  %568 = getelementptr inbounds float* %567, i64 %564
  %569 = load float* %568, align 4
  %570 = fsub float %531, %569
  %571 = load %struct.Mat** %5, align 8
  %572 = getelementptr inbounds %struct.Mat* %571, i32 0, i32 2
  %573 = load i32* %572, align 4
  %574 = mul nsw i32 0, %573
  %575 = load %struct.Mat** %5, align 8
  %576 = getelementptr inbounds %struct.Mat* %575, i32 0, i32 3
  %577 = load i32* %576, align 4
  %578 = mul nsw i32 %574, %577
  %579 = load %struct.Mat** %5, align 8
  %580 = getelementptr inbounds %struct.Mat* %579, i32 0, i32 4
  %581 = load i32* %580, align 4
  %582 = mul nsw i32 %578, %581
  %583 = load i32* %i, align 4
  %584 = load %struct.Mat** %5, align 8
  %585 = getelementptr inbounds %struct.Mat* %584, i32 0, i32 3
  %586 = load i32* %585, align 4
  %587 = mul nsw i32 %583, %586
  %588 = load %struct.Mat** %5, align 8
  %589 = getelementptr inbounds %struct.Mat* %588, i32 0, i32 4
  %590 = load i32* %589, align 4
  %591 = mul nsw i32 %587, %590
  %592 = add nsw i32 %582, %591
  %593 = load i32* %j, align 4
  %594 = add nsw i32 %593, 1
  %595 = load %struct.Mat** %5, align 8
  %596 = getelementptr inbounds %struct.Mat* %595, i32 0, i32 4
  %597 = load i32* %596, align 4
  %598 = mul nsw i32 %594, %597
  %599 = add nsw i32 %592, %598
  %600 = load i32* %k, align 4
  %601 = sub nsw i32 %600, 1
  %602 = add nsw i32 %599, %601
  %603 = sext i32 %602 to i64
  %604 = load %struct.Mat** %5, align 8
  %605 = getelementptr inbounds %struct.Mat* %604, i32 0, i32 0
  %606 = load float** %605, align 8
  %607 = getelementptr inbounds float* %606, i64 %603
  %608 = load float* %607, align 4
  %609 = fsub float %570, %608
  %610 = load %struct.Mat** %5, align 8
  %611 = getelementptr inbounds %struct.Mat* %610, i32 0, i32 2
  %612 = load i32* %611, align 4
  %613 = mul nsw i32 0, %612
  %614 = load %struct.Mat** %5, align 8
  %615 = getelementptr inbounds %struct.Mat* %614, i32 0, i32 3
  %616 = load i32* %615, align 4
  %617 = mul nsw i32 %613, %616
  %618 = load %struct.Mat** %5, align 8
  %619 = getelementptr inbounds %struct.Mat* %618, i32 0, i32 4
  %620 = load i32* %619, align 4
  %621 = mul nsw i32 %617, %620
  %622 = load i32* %i, align 4
  %623 = load %struct.Mat** %5, align 8
  %624 = getelementptr inbounds %struct.Mat* %623, i32 0, i32 3
  %625 = load i32* %624, align 4
  %626 = mul nsw i32 %622, %625
  %627 = load %struct.Mat** %5, align 8
  %628 = getelementptr inbounds %struct.Mat* %627, i32 0, i32 4
  %629 = load i32* %628, align 4
  %630 = mul nsw i32 %626, %629
  %631 = add nsw i32 %621, %630
  %632 = load i32* %j, align 4
  %633 = sub nsw i32 %632, 1
  %634 = load %struct.Mat** %5, align 8
  %635 = getelementptr inbounds %struct.Mat* %634, i32 0, i32 4
  %636 = load i32* %635, align 4
  %637 = mul nsw i32 %633, %636
  %638 = add nsw i32 %631, %637
  %639 = load i32* %k, align 4
  %640 = sub nsw i32 %639, 1
  %641 = add nsw i32 %638, %640
  %642 = sext i32 %641 to i64
  %643 = load %struct.Mat** %5, align 8
  %644 = getelementptr inbounds %struct.Mat* %643, i32 0, i32 0
  %645 = load float** %644, align 8
  %646 = getelementptr inbounds float* %645, i64 %642
  %647 = load float* %646, align 4
  %648 = fadd float %609, %647
  %649 = fmul float %493, %648
  %650 = fadd float %457, %649
  %651 = load %struct.Mat** %3, align 8
  %652 = getelementptr inbounds %struct.Mat* %651, i32 0, i32 2
  %653 = load i32* %652, align 4
  %654 = mul nsw i32 2, %653
  %655 = load %struct.Mat** %3, align 8
  %656 = getelementptr inbounds %struct.Mat* %655, i32 0, i32 3
  %657 = load i32* %656, align 4
  %658 = mul nsw i32 %654, %657
  %659 = load %struct.Mat** %3, align 8
  %660 = getelementptr inbounds %struct.Mat* %659, i32 0, i32 4
  %661 = load i32* %660, align 4
  %662 = mul nsw i32 %658, %661
  %663 = load i32* %i, align 4
  %664 = load %struct.Mat** %3, align 8
  %665 = getelementptr inbounds %struct.Mat* %664, i32 0, i32 3
  %666 = load i32* %665, align 4
  %667 = mul nsw i32 %663, %666
  %668 = load %struct.Mat** %3, align 8
  %669 = getelementptr inbounds %struct.Mat* %668, i32 0, i32 4
  %670 = load i32* %669, align 4
  %671 = mul nsw i32 %667, %670
  %672 = add nsw i32 %662, %671
  %673 = load i32* %j, align 4
  %674 = load %struct.Mat** %3, align 8
  %675 = getelementptr inbounds %struct.Mat* %674, i32 0, i32 4
  %676 = load i32* %675, align 4
  %677 = mul nsw i32 %673, %676
  %678 = add nsw i32 %672, %677
  %679 = load i32* %k, align 4
  %680 = add nsw i32 %678, %679
  %681 = sext i32 %680 to i64
  %682 = load %struct.Mat** %3, align 8
  %683 = getelementptr inbounds %struct.Mat* %682, i32 0, i32 0
  %684 = load float** %683, align 8
  %685 = getelementptr inbounds float* %684, i64 %681
  %686 = load float* %685, align 4
  %687 = load %struct.Mat** %5, align 8
  %688 = getelementptr inbounds %struct.Mat* %687, i32 0, i32 2
  %689 = load i32* %688, align 4
  %690 = mul nsw i32 0, %689
  %691 = load %struct.Mat** %5, align 8
  %692 = getelementptr inbounds %struct.Mat* %691, i32 0, i32 3
  %693 = load i32* %692, align 4
  %694 = mul nsw i32 %690, %693
  %695 = load %struct.Mat** %5, align 8
  %696 = getelementptr inbounds %struct.Mat* %695, i32 0, i32 4
  %697 = load i32* %696, align 4
  %698 = mul nsw i32 %694, %697
  %699 = load i32* %i, align 4
  %700 = add nsw i32 %699, 1
  %701 = load %struct.Mat** %5, align 8
  %702 = getelementptr inbounds %struct.Mat* %701, i32 0, i32 3
  %703 = load i32* %702, align 4
  %704 = mul nsw i32 %700, %703
  %705 = load %struct.Mat** %5, align 8
  %706 = getelementptr inbounds %struct.Mat* %705, i32 0, i32 4
  %707 = load i32* %706, align 4
  %708 = mul nsw i32 %704, %707
  %709 = add nsw i32 %698, %708
  %710 = load i32* %j, align 4
  %711 = load %struct.Mat** %5, align 8
  %712 = getelementptr inbounds %struct.Mat* %711, i32 0, i32 4
  %713 = load i32* %712, align 4
  %714 = mul nsw i32 %710, %713
  %715 = add nsw i32 %709, %714
  %716 = load i32* %k, align 4
  %717 = add nsw i32 %716, 1
  %718 = add nsw i32 %715, %717
  %719 = sext i32 %718 to i64
  %720 = load %struct.Mat** %5, align 8
  %721 = getelementptr inbounds %struct.Mat* %720, i32 0, i32 0
  %722 = load float** %721, align 8
  %723 = getelementptr inbounds float* %722, i64 %719
  %724 = load float* %723, align 4
  %725 = load %struct.Mat** %5, align 8
  %726 = getelementptr inbounds %struct.Mat* %725, i32 0, i32 2
  %727 = load i32* %726, align 4
  %728 = mul nsw i32 0, %727
  %729 = load %struct.Mat** %5, align 8
  %730 = getelementptr inbounds %struct.Mat* %729, i32 0, i32 3
  %731 = load i32* %730, align 4
  %732 = mul nsw i32 %728, %731
  %733 = load %struct.Mat** %5, align 8
  %734 = getelementptr inbounds %struct.Mat* %733, i32 0, i32 4
  %735 = load i32* %734, align 4
  %736 = mul nsw i32 %732, %735
  %737 = load i32* %i, align 4
  %738 = sub nsw i32 %737, 1
  %739 = load %struct.Mat** %5, align 8
  %740 = getelementptr inbounds %struct.Mat* %739, i32 0, i32 3
  %741 = load i32* %740, align 4
  %742 = mul nsw i32 %738, %741
  %743 = load %struct.Mat** %5, align 8
  %744 = getelementptr inbounds %struct.Mat* %743, i32 0, i32 4
  %745 = load i32* %744, align 4
  %746 = mul nsw i32 %742, %745
  %747 = add nsw i32 %736, %746
  %748 = load i32* %j, align 4
  %749 = load %struct.Mat** %5, align 8
  %750 = getelementptr inbounds %struct.Mat* %749, i32 0, i32 4
  %751 = load i32* %750, align 4
  %752 = mul nsw i32 %748, %751
  %753 = add nsw i32 %747, %752
  %754 = load i32* %k, align 4
  %755 = add nsw i32 %754, 1
  %756 = add nsw i32 %753, %755
  %757 = sext i32 %756 to i64
  %758 = load %struct.Mat** %5, align 8
  %759 = getelementptr inbounds %struct.Mat* %758, i32 0, i32 0
  %760 = load float** %759, align 8
  %761 = getelementptr inbounds float* %760, i64 %757
  %762 = load float* %761, align 4
  %763 = fsub float %724, %762
  %764 = load %struct.Mat** %5, align 8
  %765 = getelementptr inbounds %struct.Mat* %764, i32 0, i32 2
  %766 = load i32* %765, align 4
  %767 = mul nsw i32 0, %766
  %768 = load %struct.Mat** %5, align 8
  %769 = getelementptr inbounds %struct.Mat* %768, i32 0, i32 3
  %770 = load i32* %769, align 4
  %771 = mul nsw i32 %767, %770
  %772 = load %struct.Mat** %5, align 8
  %773 = getelementptr inbounds %struct.Mat* %772, i32 0, i32 4
  %774 = load i32* %773, align 4
  %775 = mul nsw i32 %771, %774
  %776 = load i32* %i, align 4
  %777 = add nsw i32 %776, 1
  %778 = load %struct.Mat** %5, align 8
  %779 = getelementptr inbounds %struct.Mat* %778, i32 0, i32 3
  %780 = load i32* %779, align 4
  %781 = mul nsw i32 %777, %780
  %782 = load %struct.Mat** %5, align 8
  %783 = getelementptr inbounds %struct.Mat* %782, i32 0, i32 4
  %784 = load i32* %783, align 4
  %785 = mul nsw i32 %781, %784
  %786 = add nsw i32 %775, %785
  %787 = load i32* %j, align 4
  %788 = load %struct.Mat** %5, align 8
  %789 = getelementptr inbounds %struct.Mat* %788, i32 0, i32 4
  %790 = load i32* %789, align 4
  %791 = mul nsw i32 %787, %790
  %792 = add nsw i32 %786, %791
  %793 = load i32* %k, align 4
  %794 = sub nsw i32 %793, 1
  %795 = add nsw i32 %792, %794
  %796 = sext i32 %795 to i64
  %797 = load %struct.Mat** %5, align 8
  %798 = getelementptr inbounds %struct.Mat* %797, i32 0, i32 0
  %799 = load float** %798, align 8
  %800 = getelementptr inbounds float* %799, i64 %796
  %801 = load float* %800, align 4
  %802 = fsub float %763, %801
  %803 = load %struct.Mat** %5, align 8
  %804 = getelementptr inbounds %struct.Mat* %803, i32 0, i32 2
  %805 = load i32* %804, align 4
  %806 = mul nsw i32 0, %805
  %807 = load %struct.Mat** %5, align 8
  %808 = getelementptr inbounds %struct.Mat* %807, i32 0, i32 3
  %809 = load i32* %808, align 4
  %810 = mul nsw i32 %806, %809
  %811 = load %struct.Mat** %5, align 8
  %812 = getelementptr inbounds %struct.Mat* %811, i32 0, i32 4
  %813 = load i32* %812, align 4
  %814 = mul nsw i32 %810, %813
  %815 = load i32* %i, align 4
  %816 = sub nsw i32 %815, 1
  %817 = load %struct.Mat** %5, align 8
  %818 = getelementptr inbounds %struct.Mat* %817, i32 0, i32 3
  %819 = load i32* %818, align 4
  %820 = mul nsw i32 %816, %819
  %821 = load %struct.Mat** %5, align 8
  %822 = getelementptr inbounds %struct.Mat* %821, i32 0, i32 4
  %823 = load i32* %822, align 4
  %824 = mul nsw i32 %820, %823
  %825 = add nsw i32 %814, %824
  %826 = load i32* %j, align 4
  %827 = load %struct.Mat** %5, align 8
  %828 = getelementptr inbounds %struct.Mat* %827, i32 0, i32 4
  %829 = load i32* %828, align 4
  %830 = mul nsw i32 %826, %829
  %831 = add nsw i32 %825, %830
  %832 = load i32* %k, align 4
  %833 = sub nsw i32 %832, 1
  %834 = add nsw i32 %831, %833
  %835 = sext i32 %834 to i64
  %836 = load %struct.Mat** %5, align 8
  %837 = getelementptr inbounds %struct.Mat* %836, i32 0, i32 0
  %838 = load float** %837, align 8
  %839 = getelementptr inbounds float* %838, i64 %835
  %840 = load float* %839, align 4
  %841 = fadd float %802, %840
  %842 = fmul float %686, %841
  %843 = fadd float %650, %842
  %844 = load %struct.Mat** %4, align 8
  %845 = getelementptr inbounds %struct.Mat* %844, i32 0, i32 2
  %846 = load i32* %845, align 4
  %847 = mul nsw i32 0, %846
  %848 = load %struct.Mat** %4, align 8
  %849 = getelementptr inbounds %struct.Mat* %848, i32 0, i32 3
  %850 = load i32* %849, align 4
  %851 = mul nsw i32 %847, %850
  %852 = load %struct.Mat** %4, align 8
  %853 = getelementptr inbounds %struct.Mat* %852, i32 0, i32 4
  %854 = load i32* %853, align 4
  %855 = mul nsw i32 %851, %854
  %856 = load i32* %i, align 4
  %857 = load %struct.Mat** %4, align 8
  %858 = getelementptr inbounds %struct.Mat* %857, i32 0, i32 3
  %859 = load i32* %858, align 4
  %860 = mul nsw i32 %856, %859
  %861 = load %struct.Mat** %4, align 8
  %862 = getelementptr inbounds %struct.Mat* %861, i32 0, i32 4
  %863 = load i32* %862, align 4
  %864 = mul nsw i32 %860, %863
  %865 = add nsw i32 %855, %864
  %866 = load i32* %j, align 4
  %867 = load %struct.Mat** %4, align 8
  %868 = getelementptr inbounds %struct.Mat* %867, i32 0, i32 4
  %869 = load i32* %868, align 4
  %870 = mul nsw i32 %866, %869
  %871 = add nsw i32 %865, %870
  %872 = load i32* %k, align 4
  %873 = add nsw i32 %871, %872
  %874 = sext i32 %873 to i64
  %875 = load %struct.Mat** %4, align 8
  %876 = getelementptr inbounds %struct.Mat* %875, i32 0, i32 0
  %877 = load float** %876, align 8
  %878 = getelementptr inbounds float* %877, i64 %874
  %879 = load float* %878, align 4
  %880 = load %struct.Mat** %5, align 8
  %881 = getelementptr inbounds %struct.Mat* %880, i32 0, i32 2
  %882 = load i32* %881, align 4
  %883 = mul nsw i32 0, %882
  %884 = load %struct.Mat** %5, align 8
  %885 = getelementptr inbounds %struct.Mat* %884, i32 0, i32 3
  %886 = load i32* %885, align 4
  %887 = mul nsw i32 %883, %886
  %888 = load %struct.Mat** %5, align 8
  %889 = getelementptr inbounds %struct.Mat* %888, i32 0, i32 4
  %890 = load i32* %889, align 4
  %891 = mul nsw i32 %887, %890
  %892 = load i32* %i, align 4
  %893 = sub nsw i32 %892, 1
  %894 = load %struct.Mat** %5, align 8
  %895 = getelementptr inbounds %struct.Mat* %894, i32 0, i32 3
  %896 = load i32* %895, align 4
  %897 = mul nsw i32 %893, %896
  %898 = load %struct.Mat** %5, align 8
  %899 = getelementptr inbounds %struct.Mat* %898, i32 0, i32 4
  %900 = load i32* %899, align 4
  %901 = mul nsw i32 %897, %900
  %902 = add nsw i32 %891, %901
  %903 = load i32* %j, align 4
  %904 = load %struct.Mat** %5, align 8
  %905 = getelementptr inbounds %struct.Mat* %904, i32 0, i32 4
  %906 = load i32* %905, align 4
  %907 = mul nsw i32 %903, %906
  %908 = add nsw i32 %902, %907
  %909 = load i32* %k, align 4
  %910 = add nsw i32 %908, %909
  %911 = sext i32 %910 to i64
  %912 = load %struct.Mat** %5, align 8
  %913 = getelementptr inbounds %struct.Mat* %912, i32 0, i32 0
  %914 = load float** %913, align 8
  %915 = getelementptr inbounds float* %914, i64 %911
  %916 = load float* %915, align 4
  %917 = fmul float %879, %916
  %918 = fadd float %843, %917
  %919 = load %struct.Mat** %4, align 8
  %920 = getelementptr inbounds %struct.Mat* %919, i32 0, i32 2
  %921 = load i32* %920, align 4
  %922 = mul nsw i32 1, %921
  %923 = load %struct.Mat** %4, align 8
  %924 = getelementptr inbounds %struct.Mat* %923, i32 0, i32 3
  %925 = load i32* %924, align 4
  %926 = mul nsw i32 %922, %925
  %927 = load %struct.Mat** %4, align 8
  %928 = getelementptr inbounds %struct.Mat* %927, i32 0, i32 4
  %929 = load i32* %928, align 4
  %930 = mul nsw i32 %926, %929
  %931 = load i32* %i, align 4
  %932 = load %struct.Mat** %4, align 8
  %933 = getelementptr inbounds %struct.Mat* %932, i32 0, i32 3
  %934 = load i32* %933, align 4
  %935 = mul nsw i32 %931, %934
  %936 = load %struct.Mat** %4, align 8
  %937 = getelementptr inbounds %struct.Mat* %936, i32 0, i32 4
  %938 = load i32* %937, align 4
  %939 = mul nsw i32 %935, %938
  %940 = add nsw i32 %930, %939
  %941 = load i32* %j, align 4
  %942 = load %struct.Mat** %4, align 8
  %943 = getelementptr inbounds %struct.Mat* %942, i32 0, i32 4
  %944 = load i32* %943, align 4
  %945 = mul nsw i32 %941, %944
  %946 = add nsw i32 %940, %945
  %947 = load i32* %k, align 4
  %948 = add nsw i32 %946, %947
  %949 = sext i32 %948 to i64
  %950 = load %struct.Mat** %4, align 8
  %951 = getelementptr inbounds %struct.Mat* %950, i32 0, i32 0
  %952 = load float** %951, align 8
  %953 = getelementptr inbounds float* %952, i64 %949
  %954 = load float* %953, align 4
  %955 = load %struct.Mat** %5, align 8
  %956 = getelementptr inbounds %struct.Mat* %955, i32 0, i32 2
  %957 = load i32* %956, align 4
  %958 = mul nsw i32 0, %957
  %959 = load %struct.Mat** %5, align 8
  %960 = getelementptr inbounds %struct.Mat* %959, i32 0, i32 3
  %961 = load i32* %960, align 4
  %962 = mul nsw i32 %958, %961
  %963 = load %struct.Mat** %5, align 8
  %964 = getelementptr inbounds %struct.Mat* %963, i32 0, i32 4
  %965 = load i32* %964, align 4
  %966 = mul nsw i32 %962, %965
  %967 = load i32* %i, align 4
  %968 = load %struct.Mat** %5, align 8
  %969 = getelementptr inbounds %struct.Mat* %968, i32 0, i32 3
  %970 = load i32* %969, align 4
  %971 = mul nsw i32 %967, %970
  %972 = load %struct.Mat** %5, align 8
  %973 = getelementptr inbounds %struct.Mat* %972, i32 0, i32 4
  %974 = load i32* %973, align 4
  %975 = mul nsw i32 %971, %974
  %976 = add nsw i32 %966, %975
  %977 = load i32* %j, align 4
  %978 = sub nsw i32 %977, 1
  %979 = load %struct.Mat** %5, align 8
  %980 = getelementptr inbounds %struct.Mat* %979, i32 0, i32 4
  %981 = load i32* %980, align 4
  %982 = mul nsw i32 %978, %981
  %983 = add nsw i32 %976, %982
  %984 = load i32* %k, align 4
  %985 = add nsw i32 %983, %984
  %986 = sext i32 %985 to i64
  %987 = load %struct.Mat** %5, align 8
  %988 = getelementptr inbounds %struct.Mat* %987, i32 0, i32 0
  %989 = load float** %988, align 8
  %990 = getelementptr inbounds float* %989, i64 %986
  %991 = load float* %990, align 4
  %992 = fmul float %954, %991
  %993 = fadd float %918, %992
  %994 = load %struct.Mat** %4, align 8
  %995 = getelementptr inbounds %struct.Mat* %994, i32 0, i32 2
  %996 = load i32* %995, align 4
  %997 = mul nsw i32 2, %996
  %998 = load %struct.Mat** %4, align 8
  %999 = getelementptr inbounds %struct.Mat* %998, i32 0, i32 3
  %1000 = load i32* %999, align 4
  %1001 = mul nsw i32 %997, %1000
  %1002 = load %struct.Mat** %4, align 8
  %1003 = getelementptr inbounds %struct.Mat* %1002, i32 0, i32 4
  %1004 = load i32* %1003, align 4
  %1005 = mul nsw i32 %1001, %1004
  %1006 = load i32* %i, align 4
  %1007 = load %struct.Mat** %4, align 8
  %1008 = getelementptr inbounds %struct.Mat* %1007, i32 0, i32 3
  %1009 = load i32* %1008, align 4
  %1010 = mul nsw i32 %1006, %1009
  %1011 = load %struct.Mat** %4, align 8
  %1012 = getelementptr inbounds %struct.Mat* %1011, i32 0, i32 4
  %1013 = load i32* %1012, align 4
  %1014 = mul nsw i32 %1010, %1013
  %1015 = add nsw i32 %1005, %1014
  %1016 = load i32* %j, align 4
  %1017 = load %struct.Mat** %4, align 8
  %1018 = getelementptr inbounds %struct.Mat* %1017, i32 0, i32 4
  %1019 = load i32* %1018, align 4
  %1020 = mul nsw i32 %1016, %1019
  %1021 = add nsw i32 %1015, %1020
  %1022 = load i32* %k, align 4
  %1023 = add nsw i32 %1021, %1022
  %1024 = sext i32 %1023 to i64
  %1025 = load %struct.Mat** %4, align 8
  %1026 = getelementptr inbounds %struct.Mat* %1025, i32 0, i32 0
  %1027 = load float** %1026, align 8
  %1028 = getelementptr inbounds float* %1027, i64 %1024
  %1029 = load float* %1028, align 4
  %1030 = load %struct.Mat** %5, align 8
  %1031 = getelementptr inbounds %struct.Mat* %1030, i32 0, i32 2
  %1032 = load i32* %1031, align 4
  %1033 = mul nsw i32 0, %1032
  %1034 = load %struct.Mat** %5, align 8
  %1035 = getelementptr inbounds %struct.Mat* %1034, i32 0, i32 3
  %1036 = load i32* %1035, align 4
  %1037 = mul nsw i32 %1033, %1036
  %1038 = load %struct.Mat** %5, align 8
  %1039 = getelementptr inbounds %struct.Mat* %1038, i32 0, i32 4
  %1040 = load i32* %1039, align 4
  %1041 = mul nsw i32 %1037, %1040
  %1042 = load i32* %i, align 4
  %1043 = load %struct.Mat** %5, align 8
  %1044 = getelementptr inbounds %struct.Mat* %1043, i32 0, i32 3
  %1045 = load i32* %1044, align 4
  %1046 = mul nsw i32 %1042, %1045
  %1047 = load %struct.Mat** %5, align 8
  %1048 = getelementptr inbounds %struct.Mat* %1047, i32 0, i32 4
  %1049 = load i32* %1048, align 4
  %1050 = mul nsw i32 %1046, %1049
  %1051 = add nsw i32 %1041, %1050
  %1052 = load i32* %j, align 4
  %1053 = load %struct.Mat** %5, align 8
  %1054 = getelementptr inbounds %struct.Mat* %1053, i32 0, i32 4
  %1055 = load i32* %1054, align 4
  %1056 = mul nsw i32 %1052, %1055
  %1057 = add nsw i32 %1051, %1056
  %1058 = load i32* %k, align 4
  %1059 = sub nsw i32 %1058, 1
  %1060 = add nsw i32 %1057, %1059
  %1061 = sext i32 %1060 to i64
  %1062 = load %struct.Mat** %5, align 8
  %1063 = getelementptr inbounds %struct.Mat* %1062, i32 0, i32 0
  %1064 = load float** %1063, align 8
  %1065 = getelementptr inbounds float* %1064, i64 %1061
  %1066 = load float* %1065, align 4
  %1067 = fmul float %1029, %1066
  %1068 = fadd float %993, %1067
  %1069 = load %struct.Mat** %7, align 8
  %1070 = getelementptr inbounds %struct.Mat* %1069, i32 0, i32 2
  %1071 = load i32* %1070, align 4
  %1072 = mul nsw i32 0, %1071
  %1073 = load %struct.Mat** %7, align 8
  %1074 = getelementptr inbounds %struct.Mat* %1073, i32 0, i32 3
  %1075 = load i32* %1074, align 4
  %1076 = mul nsw i32 %1072, %1075
  %1077 = load %struct.Mat** %7, align 8
  %1078 = getelementptr inbounds %struct.Mat* %1077, i32 0, i32 4
  %1079 = load i32* %1078, align 4
  %1080 = mul nsw i32 %1076, %1079
  %1081 = load i32* %i, align 4
  %1082 = load %struct.Mat** %7, align 8
  %1083 = getelementptr inbounds %struct.Mat* %1082, i32 0, i32 3
  %1084 = load i32* %1083, align 4
  %1085 = mul nsw i32 %1081, %1084
  %1086 = load %struct.Mat** %7, align 8
  %1087 = getelementptr inbounds %struct.Mat* %1086, i32 0, i32 4
  %1088 = load i32* %1087, align 4
  %1089 = mul nsw i32 %1085, %1088
  %1090 = add nsw i32 %1080, %1089
  %1091 = load i32* %j, align 4
  %1092 = load %struct.Mat** %7, align 8
  %1093 = getelementptr inbounds %struct.Mat* %1092, i32 0, i32 4
  %1094 = load i32* %1093, align 4
  %1095 = mul nsw i32 %1091, %1094
  %1096 = add nsw i32 %1090, %1095
  %1097 = load i32* %k, align 4
  %1098 = add nsw i32 %1096, %1097
  %1099 = sext i32 %1098 to i64
  %1100 = load %struct.Mat** %7, align 8
  %1101 = getelementptr inbounds %struct.Mat* %1100, i32 0, i32 0
  %1102 = load float** %1101, align 8
  %1103 = getelementptr inbounds float* %1102, i64 %1099
  %1104 = load float* %1103, align 4
  %1105 = fadd float %1068, %1104
  store float %1105, float* %s0, align 4
  %1106 = load float* %s0, align 4
  %1107 = load %struct.Mat** %2, align 8
  %1108 = getelementptr inbounds %struct.Mat* %1107, i32 0, i32 2
  %1109 = load i32* %1108, align 4
  %1110 = mul nsw i32 3, %1109
  %1111 = load %struct.Mat** %2, align 8
  %1112 = getelementptr inbounds %struct.Mat* %1111, i32 0, i32 3
  %1113 = load i32* %1112, align 4
  %1114 = mul nsw i32 %1110, %1113
  %1115 = load %struct.Mat** %2, align 8
  %1116 = getelementptr inbounds %struct.Mat* %1115, i32 0, i32 4
  %1117 = load i32* %1116, align 4
  %1118 = mul nsw i32 %1114, %1117
  %1119 = load i32* %i, align 4
  %1120 = load %struct.Mat** %2, align 8
  %1121 = getelementptr inbounds %struct.Mat* %1120, i32 0, i32 3
  %1122 = load i32* %1121, align 4
  %1123 = mul nsw i32 %1119, %1122
  %1124 = load %struct.Mat** %2, align 8
  %1125 = getelementptr inbounds %struct.Mat* %1124, i32 0, i32 4
  %1126 = load i32* %1125, align 4
  %1127 = mul nsw i32 %1123, %1126
  %1128 = add nsw i32 %1118, %1127
  %1129 = load i32* %j, align 4
  %1130 = load %struct.Mat** %2, align 8
  %1131 = getelementptr inbounds %struct.Mat* %1130, i32 0, i32 4
  %1132 = load i32* %1131, align 4
  %1133 = mul nsw i32 %1129, %1132
  %1134 = add nsw i32 %1128, %1133
  %1135 = load i32* %k, align 4
  %1136 = add nsw i32 %1134, %1135
  %1137 = sext i32 %1136 to i64
  %1138 = load %struct.Mat** %2, align 8
  %1139 = getelementptr inbounds %struct.Mat* %1138, i32 0, i32 0
  %1140 = load float** %1139, align 8
  %1141 = getelementptr inbounds float* %1140, i64 %1137
  %1142 = load float* %1141, align 4
  %1143 = fmul float %1106, %1142
  %1144 = load %struct.Mat** %5, align 8
  %1145 = getelementptr inbounds %struct.Mat* %1144, i32 0, i32 2
  %1146 = load i32* %1145, align 4
  %1147 = mul nsw i32 0, %1146
  %1148 = load %struct.Mat** %5, align 8
  %1149 = getelementptr inbounds %struct.Mat* %1148, i32 0, i32 3
  %1150 = load i32* %1149, align 4
  %1151 = mul nsw i32 %1147, %1150
  %1152 = load %struct.Mat** %5, align 8
  %1153 = getelementptr inbounds %struct.Mat* %1152, i32 0, i32 4
  %1154 = load i32* %1153, align 4
  %1155 = mul nsw i32 %1151, %1154
  %1156 = load i32* %i, align 4
  %1157 = load %struct.Mat** %5, align 8
  %1158 = getelementptr inbounds %struct.Mat* %1157, i32 0, i32 3
  %1159 = load i32* %1158, align 4
  %1160 = mul nsw i32 %1156, %1159
  %1161 = load %struct.Mat** %5, align 8
  %1162 = getelementptr inbounds %struct.Mat* %1161, i32 0, i32 4
  %1163 = load i32* %1162, align 4
  %1164 = mul nsw i32 %1160, %1163
  %1165 = add nsw i32 %1155, %1164
  %1166 = load i32* %j, align 4
  %1167 = load %struct.Mat** %5, align 8
  %1168 = getelementptr inbounds %struct.Mat* %1167, i32 0, i32 4
  %1169 = load i32* %1168, align 4
  %1170 = mul nsw i32 %1166, %1169
  %1171 = add nsw i32 %1165, %1170
  %1172 = load i32* %k, align 4
  %1173 = add nsw i32 %1171, %1172
  %1174 = sext i32 %1173 to i64
  %1175 = load %struct.Mat** %5, align 8
  %1176 = getelementptr inbounds %struct.Mat* %1175, i32 0, i32 0
  %1177 = load float** %1176, align 8
  %1178 = getelementptr inbounds float* %1177, i64 %1174
  %1179 = load float* %1178, align 4
  %1180 = fsub float %1143, %1179
  %1181 = load %struct.Mat** %6, align 8
  %1182 = getelementptr inbounds %struct.Mat* %1181, i32 0, i32 2
  %1183 = load i32* %1182, align 4
  %1184 = mul nsw i32 0, %1183
  %1185 = load %struct.Mat** %6, align 8
  %1186 = getelementptr inbounds %struct.Mat* %1185, i32 0, i32 3
  %1187 = load i32* %1186, align 4
  %1188 = mul nsw i32 %1184, %1187
  %1189 = load %struct.Mat** %6, align 8
  %1190 = getelementptr inbounds %struct.Mat* %1189, i32 0, i32 4
  %1191 = load i32* %1190, align 4
  %1192 = mul nsw i32 %1188, %1191
  %1193 = load i32* %i, align 4
  %1194 = load %struct.Mat** %6, align 8
  %1195 = getelementptr inbounds %struct.Mat* %1194, i32 0, i32 3
  %1196 = load i32* %1195, align 4
  %1197 = mul nsw i32 %1193, %1196
  %1198 = load %struct.Mat** %6, align 8
  %1199 = getelementptr inbounds %struct.Mat* %1198, i32 0, i32 4
  %1200 = load i32* %1199, align 4
  %1201 = mul nsw i32 %1197, %1200
  %1202 = add nsw i32 %1192, %1201
  %1203 = load i32* %j, align 4
  %1204 = load %struct.Mat** %6, align 8
  %1205 = getelementptr inbounds %struct.Mat* %1204, i32 0, i32 4
  %1206 = load i32* %1205, align 4
  %1207 = mul nsw i32 %1203, %1206
  %1208 = add nsw i32 %1202, %1207
  %1209 = load i32* %k, align 4
  %1210 = add nsw i32 %1208, %1209
  %1211 = sext i32 %1210 to i64
  %1212 = load %struct.Mat** %6, align 8
  %1213 = getelementptr inbounds %struct.Mat* %1212, i32 0, i32 0
  %1214 = load float** %1213, align 8
  %1215 = getelementptr inbounds float* %1214, i64 %1211
  %1216 = load float* %1215, align 4
  %1217 = fmul float %1180, %1216
  store float %1217, float* %ss, align 4
  %1218 = load float* %ss, align 4
  %1219 = load float* %ss, align 4
  %1220 = fmul float %1218, %1219
  %1221 = load float* %gosa, align 4
  %1222 = fadd float %1221, %1220
  store float %1222, float* %gosa, align 4
  %1223 = load %struct.Mat** %5, align 8
  %1224 = getelementptr inbounds %struct.Mat* %1223, i32 0, i32 2
  %1225 = load i32* %1224, align 4
  %1226 = mul nsw i32 0, %1225
  %1227 = load %struct.Mat** %5, align 8
  %1228 = getelementptr inbounds %struct.Mat* %1227, i32 0, i32 3
  %1229 = load i32* %1228, align 4
  %1230 = mul nsw i32 %1226, %1229
  %1231 = load %struct.Mat** %5, align 8
  %1232 = getelementptr inbounds %struct.Mat* %1231, i32 0, i32 4
  %1233 = load i32* %1232, align 4
  %1234 = mul nsw i32 %1230, %1233
  %1235 = load i32* %i, align 4
  %1236 = load %struct.Mat** %5, align 8
  %1237 = getelementptr inbounds %struct.Mat* %1236, i32 0, i32 3
  %1238 = load i32* %1237, align 4
  %1239 = mul nsw i32 %1235, %1238
  %1240 = load %struct.Mat** %5, align 8
  %1241 = getelementptr inbounds %struct.Mat* %1240, i32 0, i32 4
  %1242 = load i32* %1241, align 4
  %1243 = mul nsw i32 %1239, %1242
  %1244 = add nsw i32 %1234, %1243
  %1245 = load i32* %j, align 4
  %1246 = load %struct.Mat** %5, align 8
  %1247 = getelementptr inbounds %struct.Mat* %1246, i32 0, i32 4
  %1248 = load i32* %1247, align 4
  %1249 = mul nsw i32 %1245, %1248
  %1250 = add nsw i32 %1244, %1249
  %1251 = load i32* %k, align 4
  %1252 = add nsw i32 %1250, %1251
  %1253 = sext i32 %1252 to i64
  %1254 = load %struct.Mat** %5, align 8
  %1255 = getelementptr inbounds %struct.Mat* %1254, i32 0, i32 0
  %1256 = load float** %1255, align 8
  %1257 = getelementptr inbounds float* %1256, i64 %1253
  %1258 = load float* %1257, align 4
  %1259 = load float* @omega, align 4
  %1260 = load float* %ss, align 4
  %1261 = fmul float %1259, %1260
  %1262 = fadd float %1258, %1261
  %1263 = load %struct.Mat** %8, align 8
  %1264 = getelementptr inbounds %struct.Mat* %1263, i32 0, i32 2
  %1265 = load i32* %1264, align 4
  %1266 = mul nsw i32 0, %1265
  %1267 = load %struct.Mat** %8, align 8
  %1268 = getelementptr inbounds %struct.Mat* %1267, i32 0, i32 3
  %1269 = load i32* %1268, align 4
  %1270 = mul nsw i32 %1266, %1269
  %1271 = load %struct.Mat** %8, align 8
  %1272 = getelementptr inbounds %struct.Mat* %1271, i32 0, i32 4
  %1273 = load i32* %1272, align 4
  %1274 = mul nsw i32 %1270, %1273
  %1275 = load i32* %i, align 4
  %1276 = load %struct.Mat** %8, align 8
  %1277 = getelementptr inbounds %struct.Mat* %1276, i32 0, i32 3
  %1278 = load i32* %1277, align 4
  %1279 = mul nsw i32 %1275, %1278
  %1280 = load %struct.Mat** %8, align 8
  %1281 = getelementptr inbounds %struct.Mat* %1280, i32 0, i32 4
  %1282 = load i32* %1281, align 4
  %1283 = mul nsw i32 %1279, %1282
  %1284 = add nsw i32 %1274, %1283
  %1285 = load i32* %j, align 4
  %1286 = load %struct.Mat** %8, align 8
  %1287 = getelementptr inbounds %struct.Mat* %1286, i32 0, i32 4
  %1288 = load i32* %1287, align 4
  %1289 = mul nsw i32 %1285, %1288
  %1290 = add nsw i32 %1284, %1289
  %1291 = load i32* %k, align 4
  %1292 = add nsw i32 %1290, %1291
  %1293 = sext i32 %1292 to i64
  %1294 = load %struct.Mat** %8, align 8
  %1295 = getelementptr inbounds %struct.Mat* %1294, i32 0, i32 0
  %1296 = load float** %1295, align 8
  %1297 = getelementptr inbounds float* %1296, i64 %1293
  store float %1262, float* %1297, align 4
  br label %1298

; <label>:1298                                    ; preds = %40
  %1299 = load i32* %k, align 4
  %1300 = add nsw i32 %1299, 1
  store i32 %1300, i32* %k, align 4
  br label %36

; <label>:1301                                    ; preds = %36
  br label %1302

; <label>:1302                                    ; preds = %1301
  %1303 = load i32* %j, align 4
  %1304 = add nsw i32 %1303, 1
  store i32 %1304, i32* %j, align 4
  br label %31

; <label>:1305                                    ; preds = %31
  br label %1306

; <label>:1306                                    ; preds = %1305
  %1307 = load i32* %i, align 4
  %1308 = add nsw i32 %1307, 1
  store i32 %1308, i32* %i, align 4
  br label %26

; <label>:1309                                    ; preds = %26
  store i32 1, i32* %i, align 4
  br label %1310

; <label>:1310                                    ; preds = %1404, %1309
  %1311 = load i32* %i, align 4
  %1312 = load i32* %imax, align 4
  %1313 = icmp slt i32 %1311, %1312
  br i1 %1313, label %1314, label %1407

; <label>:1314                                    ; preds = %1310
  store i32 1, i32* %j, align 4
  br label %1315

; <label>:1315                                    ; preds = %1400, %1314
  %1316 = load i32* %j, align 4
  %1317 = load i32* %jmax, align 4
  %1318 = icmp slt i32 %1316, %1317
  br i1 %1318, label %1319, label %1403

; <label>:1319                                    ; preds = %1315
  store i32 1, i32* %k, align 4
  br label %1320

; <label>:1320                                    ; preds = %1396, %1319
  %1321 = load i32* %k, align 4
  %1322 = load i32* %kmax, align 4
  %1323 = icmp slt i32 %1321, %1322
  br i1 %1323, label %1324, label %1399

; <label>:1324                                    ; preds = %1320
  %1325 = load %struct.Mat** %8, align 8
  %1326 = getelementptr inbounds %struct.Mat* %1325, i32 0, i32 2
  %1327 = load i32* %1326, align 4
  %1328 = mul nsw i32 0, %1327
  %1329 = load %struct.Mat** %8, align 8
  %1330 = getelementptr inbounds %struct.Mat* %1329, i32 0, i32 3
  %1331 = load i32* %1330, align 4
  %1332 = mul nsw i32 %1328, %1331
  %1333 = load %struct.Mat** %8, align 8
  %1334 = getelementptr inbounds %struct.Mat* %1333, i32 0, i32 4
  %1335 = load i32* %1334, align 4
  %1336 = mul nsw i32 %1332, %1335
  %1337 = load i32* %i, align 4
  %1338 = load %struct.Mat** %8, align 8
  %1339 = getelementptr inbounds %struct.Mat* %1338, i32 0, i32 3
  %1340 = load i32* %1339, align 4
  %1341 = mul nsw i32 %1337, %1340
  %1342 = load %struct.Mat** %8, align 8
  %1343 = getelementptr inbounds %struct.Mat* %1342, i32 0, i32 4
  %1344 = load i32* %1343, align 4
  %1345 = mul nsw i32 %1341, %1344
  %1346 = add nsw i32 %1336, %1345
  %1347 = load i32* %j, align 4
  %1348 = load %struct.Mat** %8, align 8
  %1349 = getelementptr inbounds %struct.Mat* %1348, i32 0, i32 4
  %1350 = load i32* %1349, align 4
  %1351 = mul nsw i32 %1347, %1350
  %1352 = add nsw i32 %1346, %1351
  %1353 = load i32* %k, align 4
  %1354 = add nsw i32 %1352, %1353
  %1355 = sext i32 %1354 to i64
  %1356 = load %struct.Mat** %8, align 8
  %1357 = getelementptr inbounds %struct.Mat* %1356, i32 0, i32 0
  %1358 = load float** %1357, align 8
  %1359 = getelementptr inbounds float* %1358, i64 %1355
  %1360 = load float* %1359, align 4
  %1361 = load %struct.Mat** %5, align 8
  %1362 = getelementptr inbounds %struct.Mat* %1361, i32 0, i32 2
  %1363 = load i32* %1362, align 4
  %1364 = mul nsw i32 0, %1363
  %1365 = load %struct.Mat** %5, align 8
  %1366 = getelementptr inbounds %struct.Mat* %1365, i32 0, i32 3
  %1367 = load i32* %1366, align 4
  %1368 = mul nsw i32 %1364, %1367
  %1369 = load %struct.Mat** %5, align 8
  %1370 = getelementptr inbounds %struct.Mat* %1369, i32 0, i32 4
  %1371 = load i32* %1370, align 4
  %1372 = mul nsw i32 %1368, %1371
  %1373 = load i32* %i, align 4
  %1374 = load %struct.Mat** %5, align 8
  %1375 = getelementptr inbounds %struct.Mat* %1374, i32 0, i32 3
  %1376 = load i32* %1375, align 4
  %1377 = mul nsw i32 %1373, %1376
  %1378 = load %struct.Mat** %5, align 8
  %1379 = getelementptr inbounds %struct.Mat* %1378, i32 0, i32 4
  %1380 = load i32* %1379, align 4
  %1381 = mul nsw i32 %1377, %1380
  %1382 = add nsw i32 %1372, %1381
  %1383 = load i32* %j, align 4
  %1384 = load %struct.Mat** %5, align 8
  %1385 = getelementptr inbounds %struct.Mat* %1384, i32 0, i32 4
  %1386 = load i32* %1385, align 4
  %1387 = mul nsw i32 %1383, %1386
  %1388 = add nsw i32 %1382, %1387
  %1389 = load i32* %k, align 4
  %1390 = add nsw i32 %1388, %1389
  %1391 = sext i32 %1390 to i64
  %1392 = load %struct.Mat** %5, align 8
  %1393 = getelementptr inbounds %struct.Mat* %1392, i32 0, i32 0
  %1394 = load float** %1393, align 8
  %1395 = getelementptr inbounds float* %1394, i64 %1391
  store float %1360, float* %1395, align 4
  br label %1396

; <label>:1396                                    ; preds = %1324
  %1397 = load i32* %k, align 4
  %1398 = add nsw i32 %1397, 1
  store i32 %1398, i32* %k, align 4
  br label %1320

; <label>:1399                                    ; preds = %1320
  br label %1400

; <label>:1400                                    ; preds = %1399
  %1401 = load i32* %j, align 4
  %1402 = add nsw i32 %1401, 1
  store i32 %1402, i32* %j, align 4
  br label %1315

; <label>:1403                                    ; preds = %1315
  br label %1404

; <label>:1404                                    ; preds = %1403
  %1405 = load i32* %i, align 4
  %1406 = add nsw i32 %1405, 1
  store i32 %1406, i32* %i, align 4
  br label %1310

; <label>:1407                                    ; preds = %1310
  br label %1408

; <label>:1408                                    ; preds = %1407
  %1409 = load i32* %n, align 4
  %1410 = add nsw i32 %1409, 1
  store i32 %1410, i32* %n, align 4
  br label %21

; <label>:1411                                    ; preds = %21
  %1412 = load float* %gosa, align 4
  ret float %1412
}

; Function Attrs: nounwind uwtable
define double @fflop(i32 %mx, i32 %my, i32 %mz) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %mx, i32* %1, align 4
  store i32 %my, i32* %2, align 4
  store i32 %mz, i32* %3, align 4
  %4 = load i32* %3, align 4
  %5 = sub nsw i32 %4, 2
  %6 = sitofp i32 %5 to double
  %7 = load i32* %2, align 4
  %8 = sub nsw i32 %7, 2
  %9 = sitofp i32 %8 to double
  %10 = fmul double %6, %9
  %11 = load i32* %1, align 4
  %12 = sub nsw i32 %11, 2
  %13 = sitofp i32 %12 to double
  %14 = fmul double %10, %13
  %15 = fmul double %14, 3.400000e+01
  ret double %15
}

; Function Attrs: nounwind uwtable
define double @mflops(i32 %nn, double %cpu, double %flop) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store i32 %nn, i32* %1, align 4
  store double %cpu, double* %2, align 8
  store double %flop, double* %3, align 8
  %4 = load double* %3, align 8
  %5 = load double* %2, align 8
  %6 = fdiv double %4, %5
  %7 = fmul double %6, 1.000000e-06
  %8 = load i32* %1, align 4
  %9 = sitofp i32 %8 to double
  %10 = fmul double %7, %9
  ret double %10
}

; Function Attrs: nounwind uwtable
define void @clearMat(%struct.Mat* %Mat) #0 {
  %1 = alloca %struct.Mat*, align 8
  store %struct.Mat* %Mat, %struct.Mat** %1, align 8
  %2 = load %struct.Mat** %1, align 8
  %3 = getelementptr inbounds %struct.Mat* %2, i32 0, i32 0
  %4 = load float** %3, align 8
  %5 = icmp ne float* %4, null
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load %struct.Mat** %1, align 8
  %8 = getelementptr inbounds %struct.Mat* %7, i32 0, i32 0
  %9 = load float** %8, align 8
  %10 = bitcast float* %9 to i8*
  call void @free(i8* %10) #5
  br label %11

; <label>:11                                      ; preds = %6, %0
  %12 = load %struct.Mat** %1, align 8
  %13 = getelementptr inbounds %struct.Mat* %12, i32 0, i32 0
  store float* null, float** %13, align 8
  %14 = load %struct.Mat** %1, align 8
  %15 = getelementptr inbounds %struct.Mat* %14, i32 0, i32 1
  store i32 0, i32* %15, align 4
  %16 = load %struct.Mat** %1, align 8
  %17 = getelementptr inbounds %struct.Mat* %16, i32 0, i32 3
  store i32 0, i32* %17, align 4
  %18 = load %struct.Mat** %1, align 8
  %19 = getelementptr inbounds %struct.Mat* %18, i32 0, i32 2
  store i32 0, i32* %19, align 4
  %20 = load %struct.Mat** %1, align 8
  %21 = getelementptr inbounds %struct.Mat* %20, i32 0, i32 4
  store i32 0, i32* %21, align 4
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
  %t = alloca double, align 8
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
  store double 0.000000e+00, double* %t, align 8
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
  store double %28, double* %t, align 8
  br label %29

; <label>:29                                      ; preds = %14, %7
  %30 = load double* %t, align 8
  ret double %30
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
