; ModuleID = 'm_mat_na.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.su3_matrix = type { [3 x [3 x %struct.complex]] }
%struct.complex = type { double, double }

; Function Attrs: nounwind uwtable
define void @mult_su3_na(%struct.su3_matrix* %a, %struct.su3_matrix* %b, %struct.su3_matrix* %c) #0 {
  %x = alloca %struct.complex, align 8
  %y = alloca %struct.complex, align 8
  br label %1

; <label>:1                                       ; preds = %99, %0
  %i.0 = phi i32 [ 0, %0 ], [ %100, %99 ]
  %2 = icmp slt i32 %i.0, 3
  br i1 %2, label %3, label %101

; <label>:3                                       ; preds = %1
  br label %4

; <label>:4                                       ; preds = %96, %3
  %j.0 = phi i32 [ 0, %3 ], [ %97, %96 ]
  %5 = icmp slt i32 %j.0, 3
  br i1 %5, label %6, label %98

; <label>:6                                       ; preds = %4
  %7 = getelementptr inbounds %struct.complex* %x, i32 0, i32 1
  store double 0.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds %struct.complex* %x, i32 0, i32 0
  store double 0.000000e+00, double* %8, align 8
  br label %9

; <label>:9                                       ; preds = %86, %6
  %k.0 = phi i32 [ 0, %6 ], [ %87, %86 ]
  %10 = icmp slt i32 %k.0, 3
  br i1 %10, label %11, label %88

; <label>:11                                      ; preds = %9
  %12 = sext i32 %k.0 to i64
  %13 = sext i32 %i.0 to i64
  %14 = getelementptr inbounds %struct.su3_matrix* %a, i32 0, i32 0
  %15 = getelementptr inbounds [3 x [3 x %struct.complex]]* %14, i32 0, i64 %13
  %16 = getelementptr inbounds [3 x %struct.complex]* %15, i32 0, i64 %12
  %17 = getelementptr inbounds %struct.complex* %16, i32 0, i32 0
  %18 = load double* %17, align 8
  %19 = sext i32 %k.0 to i64
  %20 = sext i32 %j.0 to i64
  %21 = getelementptr inbounds %struct.su3_matrix* %b, i32 0, i32 0
  %22 = getelementptr inbounds [3 x [3 x %struct.complex]]* %21, i32 0, i64 %20
  %23 = getelementptr inbounds [3 x %struct.complex]* %22, i32 0, i64 %19
  %24 = getelementptr inbounds %struct.complex* %23, i32 0, i32 0
  %25 = load double* %24, align 8
  %26 = fmul double %18, %25
  %27 = sext i32 %k.0 to i64
  %28 = sext i32 %i.0 to i64
  %29 = getelementptr inbounds %struct.su3_matrix* %a, i32 0, i32 0
  %30 = getelementptr inbounds [3 x [3 x %struct.complex]]* %29, i32 0, i64 %28
  %31 = getelementptr inbounds [3 x %struct.complex]* %30, i32 0, i64 %27
  %32 = getelementptr inbounds %struct.complex* %31, i32 0, i32 1
  %33 = load double* %32, align 8
  %34 = sext i32 %k.0 to i64
  %35 = sext i32 %j.0 to i64
  %36 = getelementptr inbounds %struct.su3_matrix* %b, i32 0, i32 0
  %37 = getelementptr inbounds [3 x [3 x %struct.complex]]* %36, i32 0, i64 %35
  %38 = getelementptr inbounds [3 x %struct.complex]* %37, i32 0, i64 %34
  %39 = getelementptr inbounds %struct.complex* %38, i32 0, i32 1
  %40 = load double* %39, align 8
  %41 = fmul double %33, %40
  %42 = fadd double %26, %41
  %43 = getelementptr inbounds %struct.complex* %y, i32 0, i32 0
  store double %42, double* %43, align 8
  %44 = sext i32 %k.0 to i64
  %45 = sext i32 %i.0 to i64
  %46 = getelementptr inbounds %struct.su3_matrix* %a, i32 0, i32 0
  %47 = getelementptr inbounds [3 x [3 x %struct.complex]]* %46, i32 0, i64 %45
  %48 = getelementptr inbounds [3 x %struct.complex]* %47, i32 0, i64 %44
  %49 = getelementptr inbounds %struct.complex* %48, i32 0, i32 1
  %50 = load double* %49, align 8
  %51 = sext i32 %k.0 to i64
  %52 = sext i32 %j.0 to i64
  %53 = getelementptr inbounds %struct.su3_matrix* %b, i32 0, i32 0
  %54 = getelementptr inbounds [3 x [3 x %struct.complex]]* %53, i32 0, i64 %52
  %55 = getelementptr inbounds [3 x %struct.complex]* %54, i32 0, i64 %51
  %56 = getelementptr inbounds %struct.complex* %55, i32 0, i32 0
  %57 = load double* %56, align 8
  %58 = fmul double %50, %57
  %59 = sext i32 %k.0 to i64
  %60 = sext i32 %i.0 to i64
  %61 = getelementptr inbounds %struct.su3_matrix* %a, i32 0, i32 0
  %62 = getelementptr inbounds [3 x [3 x %struct.complex]]* %61, i32 0, i64 %60
  %63 = getelementptr inbounds [3 x %struct.complex]* %62, i32 0, i64 %59
  %64 = getelementptr inbounds %struct.complex* %63, i32 0, i32 0
  %65 = load double* %64, align 8
  %66 = sext i32 %k.0 to i64
  %67 = sext i32 %j.0 to i64
  %68 = getelementptr inbounds %struct.su3_matrix* %b, i32 0, i32 0
  %69 = getelementptr inbounds [3 x [3 x %struct.complex]]* %68, i32 0, i64 %67
  %70 = getelementptr inbounds [3 x %struct.complex]* %69, i32 0, i64 %66
  %71 = getelementptr inbounds %struct.complex* %70, i32 0, i32 1
  %72 = load double* %71, align 8
  %73 = fmul double %65, %72
  %74 = fsub double %58, %73
  %75 = getelementptr inbounds %struct.complex* %y, i32 0, i32 1
  store double %74, double* %75, align 8
  %76 = getelementptr inbounds %struct.complex* %y, i32 0, i32 0
  %77 = load double* %76, align 8
  %78 = getelementptr inbounds %struct.complex* %x, i32 0, i32 0
  %79 = load double* %78, align 8
  %80 = fadd double %79, %77
  store double %80, double* %78, align 8
  %81 = getelementptr inbounds %struct.complex* %y, i32 0, i32 1
  %82 = load double* %81, align 8
  %83 = getelementptr inbounds %struct.complex* %x, i32 0, i32 1
  %84 = load double* %83, align 8
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8
  br label %86

; <label>:86                                      ; preds = %11
  %87 = add nsw i32 %k.0, 1
  br label %9

; <label>:88                                      ; preds = %9
  %89 = sext i32 %j.0 to i64
  %90 = sext i32 %i.0 to i64
  %91 = getelementptr inbounds %struct.su3_matrix* %c, i32 0, i32 0
  %92 = getelementptr inbounds [3 x [3 x %struct.complex]]* %91, i32 0, i64 %90
  %93 = getelementptr inbounds [3 x %struct.complex]* %92, i32 0, i64 %89
  %94 = bitcast %struct.complex* %93 to i8*
  %95 = bitcast %struct.complex* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %94, i8* %95, i64 16, i32 8, i1 false)
  br label %96

; <label>:96                                      ; preds = %88
  %97 = add nsw i32 %j.0, 1
  br label %4

; <label>:98                                      ; preds = %4
  br label %99

; <label>:99                                      ; preds = %98
  %100 = add nsw i32 %i.0, 1
  br label %1

; <label>:101                                     ; preds = %1
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
