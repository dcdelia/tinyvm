; ModuleID = 'm_mat_na.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.su3_matrix = type { [3 x [3 x %struct.complex]] }
%struct.complex = type { double, double }

; Function Attrs: nounwind uwtable
define void @mult_su3_na(%struct.su3_matrix* %a, %struct.su3_matrix* %b, %struct.su3_matrix* %c) #0 {
  %1 = alloca %struct.su3_matrix*, align 8
  %2 = alloca %struct.su3_matrix*, align 8
  %3 = alloca %struct.su3_matrix*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %x = alloca %struct.complex, align 8
  %y = alloca %struct.complex, align 8
  store %struct.su3_matrix* %a, %struct.su3_matrix** %1, align 8
  store %struct.su3_matrix* %b, %struct.su3_matrix** %2, align 8
  store %struct.su3_matrix* %c, %struct.su3_matrix** %3, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %134, %0
  %5 = load i32* %i, align 4
  %6 = icmp slt i32 %5, 3
  br i1 %6, label %7, label %137

; <label>:7                                       ; preds = %4
  store i32 0, i32* %j, align 4
  br label %8

; <label>:8                                       ; preds = %130, %7
  %9 = load i32* %j, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %133

; <label>:11                                      ; preds = %8
  %12 = getelementptr inbounds %struct.complex* %x, i32 0, i32 1
  store double 0.000000e+00, double* %12, align 8
  %13 = getelementptr inbounds %struct.complex* %x, i32 0, i32 0
  store double 0.000000e+00, double* %13, align 8
  store i32 0, i32* %k, align 4
  br label %14

; <label>:14                                      ; preds = %116, %11
  %15 = load i32* %k, align 4
  %16 = icmp slt i32 %15, 3
  br i1 %16, label %17, label %119

; <label>:17                                      ; preds = %14
  %18 = load i32* %k, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load %struct.su3_matrix** %1, align 8
  %23 = getelementptr inbounds %struct.su3_matrix* %22, i32 0, i32 0
  %24 = getelementptr inbounds [3 x [3 x %struct.complex]]* %23, i32 0, i64 %21
  %25 = getelementptr inbounds [3 x %struct.complex]* %24, i32 0, i64 %19
  %26 = getelementptr inbounds %struct.complex* %25, i32 0, i32 0
  %27 = load double* %26, align 8
  %28 = load i32* %k, align 4
  %29 = sext i32 %28 to i64
  %30 = load i32* %j, align 4
  %31 = sext i32 %30 to i64
  %32 = load %struct.su3_matrix** %2, align 8
  %33 = getelementptr inbounds %struct.su3_matrix* %32, i32 0, i32 0
  %34 = getelementptr inbounds [3 x [3 x %struct.complex]]* %33, i32 0, i64 %31
  %35 = getelementptr inbounds [3 x %struct.complex]* %34, i32 0, i64 %29
  %36 = getelementptr inbounds %struct.complex* %35, i32 0, i32 0
  %37 = load double* %36, align 8
  %38 = fmul double %27, %37
  %39 = load i32* %k, align 4
  %40 = sext i32 %39 to i64
  %41 = load i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = load %struct.su3_matrix** %1, align 8
  %44 = getelementptr inbounds %struct.su3_matrix* %43, i32 0, i32 0
  %45 = getelementptr inbounds [3 x [3 x %struct.complex]]* %44, i32 0, i64 %42
  %46 = getelementptr inbounds [3 x %struct.complex]* %45, i32 0, i64 %40
  %47 = getelementptr inbounds %struct.complex* %46, i32 0, i32 1
  %48 = load double* %47, align 8
  %49 = load i32* %k, align 4
  %50 = sext i32 %49 to i64
  %51 = load i32* %j, align 4
  %52 = sext i32 %51 to i64
  %53 = load %struct.su3_matrix** %2, align 8
  %54 = getelementptr inbounds %struct.su3_matrix* %53, i32 0, i32 0
  %55 = getelementptr inbounds [3 x [3 x %struct.complex]]* %54, i32 0, i64 %52
  %56 = getelementptr inbounds [3 x %struct.complex]* %55, i32 0, i64 %50
  %57 = getelementptr inbounds %struct.complex* %56, i32 0, i32 1
  %58 = load double* %57, align 8
  %59 = fmul double %48, %58
  %60 = fadd double %38, %59
  %61 = getelementptr inbounds %struct.complex* %y, i32 0, i32 0
  store double %60, double* %61, align 8
  %62 = load i32* %k, align 4
  %63 = sext i32 %62 to i64
  %64 = load i32* %i, align 4
  %65 = sext i32 %64 to i64
  %66 = load %struct.su3_matrix** %1, align 8
  %67 = getelementptr inbounds %struct.su3_matrix* %66, i32 0, i32 0
  %68 = getelementptr inbounds [3 x [3 x %struct.complex]]* %67, i32 0, i64 %65
  %69 = getelementptr inbounds [3 x %struct.complex]* %68, i32 0, i64 %63
  %70 = getelementptr inbounds %struct.complex* %69, i32 0, i32 1
  %71 = load double* %70, align 8
  %72 = load i32* %k, align 4
  %73 = sext i32 %72 to i64
  %74 = load i32* %j, align 4
  %75 = sext i32 %74 to i64
  %76 = load %struct.su3_matrix** %2, align 8
  %77 = getelementptr inbounds %struct.su3_matrix* %76, i32 0, i32 0
  %78 = getelementptr inbounds [3 x [3 x %struct.complex]]* %77, i32 0, i64 %75
  %79 = getelementptr inbounds [3 x %struct.complex]* %78, i32 0, i64 %73
  %80 = getelementptr inbounds %struct.complex* %79, i32 0, i32 0
  %81 = load double* %80, align 8
  %82 = fmul double %71, %81
  %83 = load i32* %k, align 4
  %84 = sext i32 %83 to i64
  %85 = load i32* %i, align 4
  %86 = sext i32 %85 to i64
  %87 = load %struct.su3_matrix** %1, align 8
  %88 = getelementptr inbounds %struct.su3_matrix* %87, i32 0, i32 0
  %89 = getelementptr inbounds [3 x [3 x %struct.complex]]* %88, i32 0, i64 %86
  %90 = getelementptr inbounds [3 x %struct.complex]* %89, i32 0, i64 %84
  %91 = getelementptr inbounds %struct.complex* %90, i32 0, i32 0
  %92 = load double* %91, align 8
  %93 = load i32* %k, align 4
  %94 = sext i32 %93 to i64
  %95 = load i32* %j, align 4
  %96 = sext i32 %95 to i64
  %97 = load %struct.su3_matrix** %2, align 8
  %98 = getelementptr inbounds %struct.su3_matrix* %97, i32 0, i32 0
  %99 = getelementptr inbounds [3 x [3 x %struct.complex]]* %98, i32 0, i64 %96
  %100 = getelementptr inbounds [3 x %struct.complex]* %99, i32 0, i64 %94
  %101 = getelementptr inbounds %struct.complex* %100, i32 0, i32 1
  %102 = load double* %101, align 8
  %103 = fmul double %92, %102
  %104 = fsub double %82, %103
  %105 = getelementptr inbounds %struct.complex* %y, i32 0, i32 1
  store double %104, double* %105, align 8
  %106 = getelementptr inbounds %struct.complex* %y, i32 0, i32 0
  %107 = load double* %106, align 8
  %108 = getelementptr inbounds %struct.complex* %x, i32 0, i32 0
  %109 = load double* %108, align 8
  %110 = fadd double %109, %107
  store double %110, double* %108, align 8
  %111 = getelementptr inbounds %struct.complex* %y, i32 0, i32 1
  %112 = load double* %111, align 8
  %113 = getelementptr inbounds %struct.complex* %x, i32 0, i32 1
  %114 = load double* %113, align 8
  %115 = fadd double %114, %112
  store double %115, double* %113, align 8
  br label %116

; <label>:116                                     ; preds = %17
  %117 = load i32* %k, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %k, align 4
  br label %14

; <label>:119                                     ; preds = %14
  %120 = load i32* %j, align 4
  %121 = sext i32 %120 to i64
  %122 = load i32* %i, align 4
  %123 = sext i32 %122 to i64
  %124 = load %struct.su3_matrix** %3, align 8
  %125 = getelementptr inbounds %struct.su3_matrix* %124, i32 0, i32 0
  %126 = getelementptr inbounds [3 x [3 x %struct.complex]]* %125, i32 0, i64 %123
  %127 = getelementptr inbounds [3 x %struct.complex]* %126, i32 0, i64 %121
  %128 = bitcast %struct.complex* %127 to i8*
  %129 = bitcast %struct.complex* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %128, i8* %129, i64 16, i32 8, i1 false)
  br label %130

; <label>:130                                     ; preds = %119
  %131 = load i32* %j, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %j, align 4
  br label %8

; <label>:133                                     ; preds = %8
  br label %134

; <label>:134                                     ; preds = %133
  %135 = load i32* %i, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, i32* %i, align 4
  br label %4

; <label>:137                                     ; preds = %4
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
