; ModuleID = 'code.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies_orig = global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @advance(i32 %nbodies, %struct.planet* %bodies, double %dt) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.planet*, align 8
  %3 = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %b = alloca %struct.planet*, align 8
  %b2 = alloca %struct.planet*, align 8
  %dx = alloca double, align 8
  %dy = alloca double, align 8
  %dz = alloca double, align 8
  %distance = alloca double, align 8
  %mag = alloca double, align 8
  %b1 = alloca %struct.planet*, align 8
  store i32 %nbodies, i32* %1, align 4
  store %struct.planet* %bodies, %struct.planet** %2, align 8
  store double %dt, double* %3, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %134, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %137

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load %struct.planet** %2, align 8
  %12 = getelementptr inbounds %struct.planet* %11, i64 %10
  store %struct.planet* %12, %struct.planet** %b, align 8
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %j, align 4
  br label %15

; <label>:15                                      ; preds = %130, %8
  %16 = load i32* %j, align 4
  %17 = load i32* %1, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %133

; <label>:19                                      ; preds = %15
  %20 = load i32* %j, align 4
  %21 = sext i32 %20 to i64
  %22 = load %struct.planet** %2, align 8
  %23 = getelementptr inbounds %struct.planet* %22, i64 %21
  store %struct.planet* %23, %struct.planet** %b2, align 8
  %24 = load %struct.planet** %b, align 8
  %25 = getelementptr inbounds %struct.planet* %24, i32 0, i32 0
  %26 = load double* %25, align 8
  %27 = load %struct.planet** %b2, align 8
  %28 = getelementptr inbounds %struct.planet* %27, i32 0, i32 0
  %29 = load double* %28, align 8
  %30 = fsub double %26, %29
  store double %30, double* %dx, align 8
  %31 = load %struct.planet** %b, align 8
  %32 = getelementptr inbounds %struct.planet* %31, i32 0, i32 1
  %33 = load double* %32, align 8
  %34 = load %struct.planet** %b2, align 8
  %35 = getelementptr inbounds %struct.planet* %34, i32 0, i32 1
  %36 = load double* %35, align 8
  %37 = fsub double %33, %36
  store double %37, double* %dy, align 8
  %38 = load %struct.planet** %b, align 8
  %39 = getelementptr inbounds %struct.planet* %38, i32 0, i32 2
  %40 = load double* %39, align 8
  %41 = load %struct.planet** %b2, align 8
  %42 = getelementptr inbounds %struct.planet* %41, i32 0, i32 2
  %43 = load double* %42, align 8
  %44 = fsub double %40, %43
  store double %44, double* %dz, align 8
  %45 = load double* %dx, align 8
  %46 = load double* %dx, align 8
  %47 = fmul double %45, %46
  %48 = load double* %dy, align 8
  %49 = load double* %dy, align 8
  %50 = fmul double %48, %49
  %51 = fadd double %47, %50
  %52 = load double* %dz, align 8
  %53 = load double* %dz, align 8
  %54 = fmul double %52, %53
  %55 = fadd double %51, %54
  %56 = call double @sqrt(double %55) #2
  store double %56, double* %distance, align 8
  %57 = load double* %3, align 8
  %58 = load double* %distance, align 8
  %59 = load double* %distance, align 8
  %60 = fmul double %58, %59
  %61 = load double* %distance, align 8
  %62 = fmul double %60, %61
  %63 = fdiv double %57, %62
  store double %63, double* %mag, align 8
  %64 = load double* %dx, align 8
  %65 = load %struct.planet** %b2, align 8
  %66 = getelementptr inbounds %struct.planet* %65, i32 0, i32 6
  %67 = load double* %66, align 8
  %68 = fmul double %64, %67
  %69 = load double* %mag, align 8
  %70 = fmul double %68, %69
  %71 = load %struct.planet** %b, align 8
  %72 = getelementptr inbounds %struct.planet* %71, i32 0, i32 3
  %73 = load double* %72, align 8
  %74 = fsub double %73, %70
  store double %74, double* %72, align 8
  %75 = load double* %dy, align 8
  %76 = load %struct.planet** %b2, align 8
  %77 = getelementptr inbounds %struct.planet* %76, i32 0, i32 6
  %78 = load double* %77, align 8
  %79 = fmul double %75, %78
  %80 = load double* %mag, align 8
  %81 = fmul double %79, %80
  %82 = load %struct.planet** %b, align 8
  %83 = getelementptr inbounds %struct.planet* %82, i32 0, i32 4
  %84 = load double* %83, align 8
  %85 = fsub double %84, %81
  store double %85, double* %83, align 8
  %86 = load double* %dz, align 8
  %87 = load %struct.planet** %b2, align 8
  %88 = getelementptr inbounds %struct.planet* %87, i32 0, i32 6
  %89 = load double* %88, align 8
  %90 = fmul double %86, %89
  %91 = load double* %mag, align 8
  %92 = fmul double %90, %91
  %93 = load %struct.planet** %b, align 8
  %94 = getelementptr inbounds %struct.planet* %93, i32 0, i32 5
  %95 = load double* %94, align 8
  %96 = fsub double %95, %92
  store double %96, double* %94, align 8
  %97 = load double* %dx, align 8
  %98 = load %struct.planet** %b, align 8
  %99 = getelementptr inbounds %struct.planet* %98, i32 0, i32 6
  %100 = load double* %99, align 8
  %101 = fmul double %97, %100
  %102 = load double* %mag, align 8
  %103 = fmul double %101, %102
  %104 = load %struct.planet** %b2, align 8
  %105 = getelementptr inbounds %struct.planet* %104, i32 0, i32 3
  %106 = load double* %105, align 8
  %107 = fadd double %106, %103
  store double %107, double* %105, align 8
  %108 = load double* %dy, align 8
  %109 = load %struct.planet** %b, align 8
  %110 = getelementptr inbounds %struct.planet* %109, i32 0, i32 6
  %111 = load double* %110, align 8
  %112 = fmul double %108, %111
  %113 = load double* %mag, align 8
  %114 = fmul double %112, %113
  %115 = load %struct.planet** %b2, align 8
  %116 = getelementptr inbounds %struct.planet* %115, i32 0, i32 4
  %117 = load double* %116, align 8
  %118 = fadd double %117, %114
  store double %118, double* %116, align 8
  %119 = load double* %dz, align 8
  %120 = load %struct.planet** %b, align 8
  %121 = getelementptr inbounds %struct.planet* %120, i32 0, i32 6
  %122 = load double* %121, align 8
  %123 = fmul double %119, %122
  %124 = load double* %mag, align 8
  %125 = fmul double %123, %124
  %126 = load %struct.planet** %b2, align 8
  %127 = getelementptr inbounds %struct.planet* %126, i32 0, i32 5
  %128 = load double* %127, align 8
  %129 = fadd double %128, %125
  store double %129, double* %127, align 8
  br label %130

; <label>:130                                     ; preds = %19
  %131 = load i32* %j, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %j, align 4
  br label %15

; <label>:133                                     ; preds = %15
  br label %134

; <label>:134                                     ; preds = %133
  %135 = load i32* %i, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, i32* %i, align 4
  br label %4

; <label>:137                                     ; preds = %4
  store i32 0, i32* %i, align 4
  br label %138

; <label>:138                                     ; preds = %174, %137
  %139 = load i32* %i, align 4
  %140 = load i32* %1, align 4
  %141 = icmp slt i32 %139, %140
  br i1 %141, label %142, label %177

; <label>:142                                     ; preds = %138
  %143 = load i32* %i, align 4
  %144 = sext i32 %143 to i64
  %145 = load %struct.planet** %2, align 8
  %146 = getelementptr inbounds %struct.planet* %145, i64 %144
  store %struct.planet* %146, %struct.planet** %b1, align 8
  %147 = load double* %3, align 8
  %148 = load %struct.planet** %b1, align 8
  %149 = getelementptr inbounds %struct.planet* %148, i32 0, i32 3
  %150 = load double* %149, align 8
  %151 = fmul double %147, %150
  %152 = load %struct.planet** %b1, align 8
  %153 = getelementptr inbounds %struct.planet* %152, i32 0, i32 0
  %154 = load double* %153, align 8
  %155 = fadd double %154, %151
  store double %155, double* %153, align 8
  %156 = load double* %3, align 8
  %157 = load %struct.planet** %b1, align 8
  %158 = getelementptr inbounds %struct.planet* %157, i32 0, i32 4
  %159 = load double* %158, align 8
  %160 = fmul double %156, %159
  %161 = load %struct.planet** %b1, align 8
  %162 = getelementptr inbounds %struct.planet* %161, i32 0, i32 1
  %163 = load double* %162, align 8
  %164 = fadd double %163, %160
  store double %164, double* %162, align 8
  %165 = load double* %3, align 8
  %166 = load %struct.planet** %b1, align 8
  %167 = getelementptr inbounds %struct.planet* %166, i32 0, i32 5
  %168 = load double* %167, align 8
  %169 = fmul double %165, %168
  %170 = load %struct.planet** %b1, align 8
  %171 = getelementptr inbounds %struct.planet* %170, i32 0, i32 2
  %172 = load double* %171, align 8
  %173 = fadd double %172, %169
  store double %173, double* %171, align 8
  br label %174

; <label>:174                                     ; preds = %142
  %175 = load i32* %i, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, i32* %i, align 4
  br label %138

; <label>:177                                     ; preds = %138
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define double @energy(i32 %nbodies, %struct.planet* %bodies) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.planet*, align 8
  %e = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %b = alloca %struct.planet*, align 8
  %b2 = alloca %struct.planet*, align 8
  %dx = alloca double, align 8
  %dy = alloca double, align 8
  %dz = alloca double, align 8
  %distance = alloca double, align 8
  store i32 %nbodies, i32* %1, align 4
  store %struct.planet* %bodies, %struct.planet** %2, align 8
  store double 0.000000e+00, double* %e, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %101, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %1, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %104

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = load %struct.planet** %2, align 8
  %11 = getelementptr inbounds %struct.planet* %10, i64 %9
  store %struct.planet* %11, %struct.planet** %b, align 8
  %12 = load %struct.planet** %b, align 8
  %13 = getelementptr inbounds %struct.planet* %12, i32 0, i32 6
  %14 = load double* %13, align 8
  %15 = fmul double 5.000000e-01, %14
  %16 = load %struct.planet** %b, align 8
  %17 = getelementptr inbounds %struct.planet* %16, i32 0, i32 3
  %18 = load double* %17, align 8
  %19 = load %struct.planet** %b, align 8
  %20 = getelementptr inbounds %struct.planet* %19, i32 0, i32 3
  %21 = load double* %20, align 8
  %22 = fmul double %18, %21
  %23 = load %struct.planet** %b, align 8
  %24 = getelementptr inbounds %struct.planet* %23, i32 0, i32 4
  %25 = load double* %24, align 8
  %26 = load %struct.planet** %b, align 8
  %27 = getelementptr inbounds %struct.planet* %26, i32 0, i32 4
  %28 = load double* %27, align 8
  %29 = fmul double %25, %28
  %30 = fadd double %22, %29
  %31 = load %struct.planet** %b, align 8
  %32 = getelementptr inbounds %struct.planet* %31, i32 0, i32 5
  %33 = load double* %32, align 8
  %34 = load %struct.planet** %b, align 8
  %35 = getelementptr inbounds %struct.planet* %34, i32 0, i32 5
  %36 = load double* %35, align 8
  %37 = fmul double %33, %36
  %38 = fadd double %30, %37
  %39 = fmul double %15, %38
  %40 = load double* %e, align 8
  %41 = fadd double %40, %39
  store double %41, double* %e, align 8
  %42 = load i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %j, align 4
  br label %44

; <label>:44                                      ; preds = %97, %7
  %45 = load i32* %j, align 4
  %46 = load i32* %1, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %100

; <label>:48                                      ; preds = %44
  %49 = load i32* %j, align 4
  %50 = sext i32 %49 to i64
  %51 = load %struct.planet** %2, align 8
  %52 = getelementptr inbounds %struct.planet* %51, i64 %50
  store %struct.planet* %52, %struct.planet** %b2, align 8
  %53 = load %struct.planet** %b, align 8
  %54 = getelementptr inbounds %struct.planet* %53, i32 0, i32 0
  %55 = load double* %54, align 8
  %56 = load %struct.planet** %b2, align 8
  %57 = getelementptr inbounds %struct.planet* %56, i32 0, i32 0
  %58 = load double* %57, align 8
  %59 = fsub double %55, %58
  store double %59, double* %dx, align 8
  %60 = load %struct.planet** %b, align 8
  %61 = getelementptr inbounds %struct.planet* %60, i32 0, i32 1
  %62 = load double* %61, align 8
  %63 = load %struct.planet** %b2, align 8
  %64 = getelementptr inbounds %struct.planet* %63, i32 0, i32 1
  %65 = load double* %64, align 8
  %66 = fsub double %62, %65
  store double %66, double* %dy, align 8
  %67 = load %struct.planet** %b, align 8
  %68 = getelementptr inbounds %struct.planet* %67, i32 0, i32 2
  %69 = load double* %68, align 8
  %70 = load %struct.planet** %b2, align 8
  %71 = getelementptr inbounds %struct.planet* %70, i32 0, i32 2
  %72 = load double* %71, align 8
  %73 = fsub double %69, %72
  store double %73, double* %dz, align 8
  %74 = load double* %dx, align 8
  %75 = load double* %dx, align 8
  %76 = fmul double %74, %75
  %77 = load double* %dy, align 8
  %78 = load double* %dy, align 8
  %79 = fmul double %77, %78
  %80 = fadd double %76, %79
  %81 = load double* %dz, align 8
  %82 = load double* %dz, align 8
  %83 = fmul double %81, %82
  %84 = fadd double %80, %83
  %85 = call double @sqrt(double %84) #2
  store double %85, double* %distance, align 8
  %86 = load %struct.planet** %b, align 8
  %87 = getelementptr inbounds %struct.planet* %86, i32 0, i32 6
  %88 = load double* %87, align 8
  %89 = load %struct.planet** %b2, align 8
  %90 = getelementptr inbounds %struct.planet* %89, i32 0, i32 6
  %91 = load double* %90, align 8
  %92 = fmul double %88, %91
  %93 = load double* %distance, align 8
  %94 = fdiv double %92, %93
  %95 = load double* %e, align 8
  %96 = fsub double %95, %94
  store double %96, double* %e, align 8
  br label %97

; <label>:97                                      ; preds = %48
  %98 = load i32* %j, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %j, align 4
  br label %44

; <label>:100                                     ; preds = %44
  br label %101

; <label>:101                                     ; preds = %100
  %102 = load i32* %i, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %i, align 4
  br label %3

; <label>:104                                     ; preds = %3
  %105 = load double* %e, align 8
  ret double %105
}

; Function Attrs: nounwind uwtable
define void @offset_momentum(i32 %nbodies, %struct.planet* %bodies) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.planet*, align 8
  %px = alloca double, align 8
  %py = alloca double, align 8
  %pz = alloca double, align 8
  %i = alloca i32, align 4
  store i32 %nbodies, i32* %1, align 4
  store %struct.planet* %bodies, %struct.planet** %2, align 8
  store double 0.000000e+00, double* %px, align 8
  store double 0.000000e+00, double* %py, align 8
  store double 0.000000e+00, double* %pz, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %53, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %1, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %56

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = load %struct.planet** %2, align 8
  %11 = getelementptr inbounds %struct.planet* %10, i64 %9
  %12 = getelementptr inbounds %struct.planet* %11, i32 0, i32 3
  %13 = load double* %12, align 8
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = load %struct.planet** %2, align 8
  %17 = getelementptr inbounds %struct.planet* %16, i64 %15
  %18 = getelementptr inbounds %struct.planet* %17, i32 0, i32 6
  %19 = load double* %18, align 8
  %20 = fmul double %13, %19
  %21 = load double* %px, align 8
  %22 = fadd double %21, %20
  store double %22, double* %px, align 8
  %23 = load i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = load %struct.planet** %2, align 8
  %26 = getelementptr inbounds %struct.planet* %25, i64 %24
  %27 = getelementptr inbounds %struct.planet* %26, i32 0, i32 4
  %28 = load double* %27, align 8
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load %struct.planet** %2, align 8
  %32 = getelementptr inbounds %struct.planet* %31, i64 %30
  %33 = getelementptr inbounds %struct.planet* %32, i32 0, i32 6
  %34 = load double* %33, align 8
  %35 = fmul double %28, %34
  %36 = load double* %py, align 8
  %37 = fadd double %36, %35
  store double %37, double* %py, align 8
  %38 = load i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = load %struct.planet** %2, align 8
  %41 = getelementptr inbounds %struct.planet* %40, i64 %39
  %42 = getelementptr inbounds %struct.planet* %41, i32 0, i32 5
  %43 = load double* %42, align 8
  %44 = load i32* %i, align 4
  %45 = sext i32 %44 to i64
  %46 = load %struct.planet** %2, align 8
  %47 = getelementptr inbounds %struct.planet* %46, i64 %45
  %48 = getelementptr inbounds %struct.planet* %47, i32 0, i32 6
  %49 = load double* %48, align 8
  %50 = fmul double %43, %49
  %51 = load double* %pz, align 8
  %52 = fadd double %51, %50
  store double %52, double* %pz, align 8
  br label %53

; <label>:53                                      ; preds = %7
  %54 = load i32* %i, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %i, align 4
  br label %3

; <label>:56                                      ; preds = %3
  %57 = load double* %px, align 8
  %58 = fsub double -0.000000e+00, %57
  %59 = fdiv double %58, 0x4043BD3CC9BE45DE
  %60 = load %struct.planet** %2, align 8
  %61 = getelementptr inbounds %struct.planet* %60, i64 0
  %62 = getelementptr inbounds %struct.planet* %61, i32 0, i32 3
  store double %59, double* %62, align 8
  %63 = load double* %py, align 8
  %64 = fsub double -0.000000e+00, %63
  %65 = fdiv double %64, 0x4043BD3CC9BE45DE
  %66 = load %struct.planet** %2, align 8
  %67 = getelementptr inbounds %struct.planet* %66, i64 0
  %68 = getelementptr inbounds %struct.planet* %67, i32 0, i32 4
  store double %65, double* %68, align 8
  %69 = load double* %pz, align 8
  %70 = fsub double -0.000000e+00, %69
  %71 = fdiv double %70, 0x4043BD3CC9BE45DE
  %72 = load %struct.planet** %2, align 8
  %73 = getelementptr inbounds %struct.planet* %72, i64 0
  %74 = getelementptr inbounds %struct.planet* %73, i32 0, i32 5
  store double %71, double* %74, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %bodies = alloca [5 x %struct.planet], align 16
  store i32 %inputN, i32* %1, align 4
  %2 = load i32* %1, align 4
  store i32 %2, i32* %n, align 4
  %3 = bitcast [5 x %struct.planet]* %bodies to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([5 x %struct.planet]* @bodies_orig to i8*), i64 280, i32 16, i1 false)
  %4 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0
  call void @offset_momentum(i32 5, %struct.planet* %4)
  %5 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0
  %6 = call double @energy(i32 5, %struct.planet* %5)
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %6)
  store i32 1, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %14, %0
  %9 = load i32* %i, align 4
  %10 = load i32* %n, align 4
  %11 = icmp sle i32 %9, %10
  br i1 %11, label %12, label %17

; <label>:12                                      ; preds = %8
  %13 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0
  call void @advance(i32 5, %struct.planet* %13, double 1.000000e-02)
  br label %14

; <label>:14                                      ; preds = %12
  %15 = load i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %8

; <label>:17                                      ; preds = %8
  %18 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0
  %19 = call double @energy(i32 5, %struct.planet* %18)
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %19)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
