; ModuleID = 'code.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @eval_A(i32 %i, i32 %j) #0 {
  %1 = add nsw i32 %i, %j
  %2 = add nsw i32 %i, %j
  %3 = add nsw i32 %2, 1
  %4 = mul nsw i32 %1, %3
  %5 = sdiv i32 %4, 2
  %6 = add nsw i32 %5, %i
  %7 = add nsw i32 %6, 1
  %8 = sitofp i32 %7 to double
  %9 = fdiv double 1.000000e+00, %8
  ret double %9
}

; Function Attrs: nounwind uwtable
define void @eval_A_times_u(i32 %N, double* %u, double* %Au) #0 {
  br label %1

; <label>:1                                       ; preds = %21, %0
  %i.0 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %2 = icmp slt i32 %i.0, %N
  br i1 %2, label %3, label %23

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64
  %5 = getelementptr inbounds double* %Au, i64 %4
  store double 0.000000e+00, double* %5, align 8
  br label %6

; <label>:6                                       ; preds = %18, %3
  %j.0 = phi i32 [ 0, %3 ], [ %19, %18 ]
  %7 = icmp slt i32 %j.0, %N
  br i1 %7, label %8, label %20

; <label>:8                                       ; preds = %6
  %9 = call double @eval_A(i32 %i.0, i32 %j.0)
  %10 = sext i32 %j.0 to i64
  %11 = getelementptr inbounds double* %u, i64 %10
  %12 = load double* %11, align 8
  %13 = fmul double %9, %12
  %14 = sext i32 %i.0 to i64
  %15 = getelementptr inbounds double* %Au, i64 %14
  %16 = load double* %15, align 8
  %17 = fadd double %16, %13
  store double %17, double* %15, align 8
  br label %18

; <label>:18                                      ; preds = %8
  %19 = add nsw i32 %j.0, 1
  br label %6

; <label>:20                                      ; preds = %6
  br label %21

; <label>:21                                      ; preds = %20
  %22 = add nsw i32 %i.0, 1
  br label %1

; <label>:23                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @eval_At_times_u(i32 %N, double* %u, double* %Au) #0 {
  br label %1

; <label>:1                                       ; preds = %21, %0
  %i.0 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %2 = icmp slt i32 %i.0, %N
  br i1 %2, label %3, label %23

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64
  %5 = getelementptr inbounds double* %Au, i64 %4
  store double 0.000000e+00, double* %5, align 8
  br label %6

; <label>:6                                       ; preds = %18, %3
  %j.0 = phi i32 [ 0, %3 ], [ %19, %18 ]
  %7 = icmp slt i32 %j.0, %N
  br i1 %7, label %8, label %20

; <label>:8                                       ; preds = %6
  %9 = call double @eval_A(i32 %j.0, i32 %i.0)
  %10 = sext i32 %j.0 to i64
  %11 = getelementptr inbounds double* %u, i64 %10
  %12 = load double* %11, align 8
  %13 = fmul double %9, %12
  %14 = sext i32 %i.0 to i64
  %15 = getelementptr inbounds double* %Au, i64 %14
  %16 = load double* %15, align 8
  %17 = fadd double %16, %13
  store double %17, double* %15, align 8
  br label %18

; <label>:18                                      ; preds = %8
  %19 = add nsw i32 %j.0, 1
  br label %6

; <label>:20                                      ; preds = %6
  br label %21

; <label>:21                                      ; preds = %20
  %22 = add nsw i32 %i.0, 1
  br label %1

; <label>:23                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @eval_AtA_times_u(i32 %N, double* %u, double* %AtAu) #0 {
  %1 = zext i32 %N to i64
  %2 = call i8* @llvm.stacksave()
  %3 = alloca double, i64 %1, align 16
  call void @eval_A_times_u(i32 %N, double* %u, double* %3)
  call void @eval_At_times_u(i32 %N, double* %3, double* %AtAu)
  call void @llvm.stackrestore(i8* %2)
  ret void
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = icmp sgt i32 %inputN, 0
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %4

; <label>:3                                       ; preds = %0
  br label %4

; <label>:4                                       ; preds = %3, %2
  %5 = phi i32 [ %inputN, %2 ], [ 2000, %3 ]
  %6 = zext i32 %5 to i64
  %7 = call i8* @llvm.stacksave()
  %8 = alloca double, i64 %6, align 16
  %9 = zext i32 %5 to i64
  %10 = alloca double, i64 %9, align 16
  br label %11

; <label>:11                                      ; preds = %16, %4
  %i.0 = phi i32 [ 0, %4 ], [ %17, %16 ]
  %12 = icmp slt i32 %i.0, %5
  br i1 %12, label %13, label %18

; <label>:13                                      ; preds = %11
  %14 = sext i32 %i.0 to i64
  %15 = getelementptr inbounds double* %8, i64 %14
  store double 1.000000e+00, double* %15, align 8
  br label %16

; <label>:16                                      ; preds = %13
  %17 = add nsw i32 %i.0, 1
  br label %11

; <label>:18                                      ; preds = %11
  br label %19

; <label>:19                                      ; preds = %22, %18
  %i.1 = phi i32 [ 0, %18 ], [ %23, %22 ]
  %20 = icmp slt i32 %i.1, 10
  br i1 %20, label %21, label %24

; <label>:21                                      ; preds = %19
  call void @eval_AtA_times_u(i32 %5, double* %8, double* %10)
  call void @eval_AtA_times_u(i32 %5, double* %10, double* %8)
  br label %22

; <label>:22                                      ; preds = %21
  %23 = add nsw i32 %i.1, 1
  br label %19

; <label>:24                                      ; preds = %19
  br label %25

; <label>:25                                      ; preds = %44, %24
  %vBv.0 = phi double [ 0.000000e+00, %24 ], [ %35, %44 ]
  %i.2 = phi i32 [ 0, %24 ], [ %45, %44 ]
  %vv.0 = phi double [ 0.000000e+00, %24 ], [ %43, %44 ]
  %26 = icmp slt i32 %i.2, %5
  br i1 %26, label %27, label %46

; <label>:27                                      ; preds = %25
  %28 = sext i32 %i.2 to i64
  %29 = getelementptr inbounds double* %8, i64 %28
  %30 = load double* %29, align 8
  %31 = sext i32 %i.2 to i64
  %32 = getelementptr inbounds double* %10, i64 %31
  %33 = load double* %32, align 8
  %34 = fmul double %30, %33
  %35 = fadd double %vBv.0, %34
  %36 = sext i32 %i.2 to i64
  %37 = getelementptr inbounds double* %10, i64 %36
  %38 = load double* %37, align 8
  %39 = sext i32 %i.2 to i64
  %40 = getelementptr inbounds double* %10, i64 %39
  %41 = load double* %40, align 8
  %42 = fmul double %38, %41
  %43 = fadd double %vv.0, %42
  br label %44

; <label>:44                                      ; preds = %27
  %45 = add nsw i32 %i.2, 1
  br label %25

; <label>:46                                      ; preds = %25
  %47 = fdiv double %vBv.0, %vv.0
  %48 = call double @sqrt(double %47) #1
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), double %48)
  call void @llvm.stackrestore(i8* %7)
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
