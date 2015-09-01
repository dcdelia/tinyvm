; ModuleID = 'code.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @eval_A(i32 %i, i32 %j) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  store i32 %j, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = add nsw i32 %3, %4
  %6 = load i32* %1, align 4
  %7 = load i32* %2, align 4
  %8 = add nsw i32 %6, %7
  %9 = add nsw i32 %8, 1
  %10 = mul nsw i32 %5, %9
  %11 = sdiv i32 %10, 2
  %12 = load i32* %1, align 4
  %13 = add nsw i32 %11, %12
  %14 = add nsw i32 %13, 1
  %15 = sitofp i32 %14 to double
  %16 = fdiv double 1.000000e+00, %15
  ret double %16
}

; Function Attrs: nounwind uwtable
define void @eval_A_times_u(i32 %N, double* %u, double* %Au) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %N, i32* %1, align 4
  store double* %u, double** %2, align 8
  store double* %Au, double** %3, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %37, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %40

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load double** %3, align 8
  %12 = getelementptr inbounds double* %11, i64 %10
  store double 0.000000e+00, double* %12, align 8
  store i32 0, i32* %j, align 4
  br label %13

; <label>:13                                      ; preds = %33, %8
  %14 = load i32* %j, align 4
  %15 = load i32* %1, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %36

; <label>:17                                      ; preds = %13
  %18 = load i32* %i, align 4
  %19 = load i32* %j, align 4
  %20 = call double @eval_A(i32 %18, i32 %19)
  %21 = load i32* %j, align 4
  %22 = sext i32 %21 to i64
  %23 = load double** %2, align 8
  %24 = getelementptr inbounds double* %23, i64 %22
  %25 = load double* %24, align 8
  %26 = fmul double %20, %25
  %27 = load i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = load double** %3, align 8
  %30 = getelementptr inbounds double* %29, i64 %28
  %31 = load double* %30, align 8
  %32 = fadd double %31, %26
  store double %32, double* %30, align 8
  br label %33

; <label>:33                                      ; preds = %17
  %34 = load i32* %j, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %j, align 4
  br label %13

; <label>:36                                      ; preds = %13
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %i, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %i, align 4
  br label %4

; <label>:40                                      ; preds = %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @eval_At_times_u(i32 %N, double* %u, double* %Au) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %N, i32* %1, align 4
  store double* %u, double** %2, align 8
  store double* %Au, double** %3, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %37, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %40

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load double** %3, align 8
  %12 = getelementptr inbounds double* %11, i64 %10
  store double 0.000000e+00, double* %12, align 8
  store i32 0, i32* %j, align 4
  br label %13

; <label>:13                                      ; preds = %33, %8
  %14 = load i32* %j, align 4
  %15 = load i32* %1, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %36

; <label>:17                                      ; preds = %13
  %18 = load i32* %j, align 4
  %19 = load i32* %i, align 4
  %20 = call double @eval_A(i32 %18, i32 %19)
  %21 = load i32* %j, align 4
  %22 = sext i32 %21 to i64
  %23 = load double** %2, align 8
  %24 = getelementptr inbounds double* %23, i64 %22
  %25 = load double* %24, align 8
  %26 = fmul double %20, %25
  %27 = load i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = load double** %3, align 8
  %30 = getelementptr inbounds double* %29, i64 %28
  %31 = load double* %30, align 8
  %32 = fadd double %31, %26
  store double %32, double* %30, align 8
  br label %33

; <label>:33                                      ; preds = %17
  %34 = load i32* %j, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %j, align 4
  br label %13

; <label>:36                                      ; preds = %13
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %i, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %i, align 4
  br label %4

; <label>:40                                      ; preds = %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @eval_AtA_times_u(i32 %N, double* %u, double* %AtAu) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  %4 = alloca i8*
  store i32 %N, i32* %1, align 4
  store double* %u, double** %2, align 8
  store double* %AtAu, double** %3, align 8
  %5 = load i32* %1, align 4
  %6 = zext i32 %5 to i64
  %7 = call i8* @llvm.stacksave()
  store i8* %7, i8** %4
  %8 = alloca double, i64 %6, align 16
  %9 = load i32* %1, align 4
  %10 = load double** %2, align 8
  call void @eval_A_times_u(i32 %9, double* %10, double* %8)
  %11 = load i32* %1, align 4
  %12 = load double** %3, align 8
  call void @eval_At_times_u(i32 %11, double* %8, double* %12)
  %13 = load i8** %4
  call void @llvm.stackrestore(i8* %13)
  ret void
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %N = alloca i32, align 4
  %2 = alloca i8*
  %vBv = alloca double, align 8
  %vv = alloca double, align 8
  %3 = alloca i32
  store i32 %inputN, i32* %1, align 4
  %4 = load i32* %1, align 4
  %5 = icmp sgt i32 %4, 0
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4
  br label %9

; <label>:8                                       ; preds = %0
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = phi i32 [ %7, %6 ], [ 2000, %8 ]
  store i32 %10, i32* %N, align 4
  %11 = load i32* %N, align 4
  %12 = zext i32 %11 to i64
  %13 = call i8* @llvm.stacksave()
  store i8* %13, i8** %2
  %14 = alloca double, i64 %12, align 16
  %15 = load i32* %N, align 4
  %16 = zext i32 %15 to i64
  %17 = alloca double, i64 %16, align 16
  store i32 0, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %26, %9
  %19 = load i32* %i, align 4
  %20 = load i32* %N, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %29

; <label>:22                                      ; preds = %18
  %23 = load i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double* %14, i64 %24
  store double 1.000000e+00, double* %25, align 8
  br label %26

; <label>:26                                      ; preds = %22
  %27 = load i32* %i, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %i, align 4
  br label %18

; <label>:29                                      ; preds = %18
  store i32 0, i32* %i, align 4
  br label %30

; <label>:30                                      ; preds = %36, %29
  %31 = load i32* %i, align 4
  %32 = icmp slt i32 %31, 10
  br i1 %32, label %33, label %39

; <label>:33                                      ; preds = %30
  %34 = load i32* %N, align 4
  call void @eval_AtA_times_u(i32 %34, double* %14, double* %17)
  %35 = load i32* %N, align 4
  call void @eval_AtA_times_u(i32 %35, double* %17, double* %14)
  br label %36

; <label>:36                                      ; preds = %33
  %37 = load i32* %i, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %i, align 4
  br label %30

; <label>:39                                      ; preds = %30
  store double 0.000000e+00, double* %vv, align 8
  store double 0.000000e+00, double* %vBv, align 8
  store i32 0, i32* %i, align 4
  br label %40

; <label>:40                                      ; preds = %67, %39
  %41 = load i32* %i, align 4
  %42 = load i32* %N, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %70

; <label>:44                                      ; preds = %40
  %45 = load i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double* %14, i64 %46
  %48 = load double* %47, align 8
  %49 = load i32* %i, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double* %17, i64 %50
  %52 = load double* %51, align 8
  %53 = fmul double %48, %52
  %54 = load double* %vBv, align 8
  %55 = fadd double %54, %53
  store double %55, double* %vBv, align 8
  %56 = load i32* %i, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double* %17, i64 %57
  %59 = load double* %58, align 8
  %60 = load i32* %i, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double* %17, i64 %61
  %63 = load double* %62, align 8
  %64 = fmul double %59, %63
  %65 = load double* %vv, align 8
  %66 = fadd double %65, %64
  store double %66, double* %vv, align 8
  br label %67

; <label>:67                                      ; preds = %44
  %68 = load i32* %i, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %i, align 4
  br label %40

; <label>:70                                      ; preds = %40
  %71 = load double* %vBv, align 8
  %72 = load double* %vv, align 8
  %73 = fdiv double %71, %72
  %74 = call double @sqrt(double %73) #1
  %75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), double %74)
  store i32 1, i32* %3
  %76 = load i8** %2
  call void @llvm.stackrestore(i8* %76)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare double @sqrt(double) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
