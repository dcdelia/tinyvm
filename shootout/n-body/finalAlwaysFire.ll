; ModuleID = 'code.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies_orig = global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @advance(i32 %nbodies, %struct.planet* %bodies, double %dt) #0 {
entry:
  br label %B1

B1:                                       ; preds = %B81, %0
  %i.0 = phi i32 [ 0, %entry ], [ %v82, %B81 ]
  %v2 = icmp slt i32 %i.0, %nbodies
  br i1 %v2, label %B3, label %B83

B3:                                       ; preds = %B1
  %v4 = sext i32 %i.0 to i64
  %v5 = getelementptr inbounds %struct.planet* %bodies, i64 %v4
  %v6 = add nsw i32 %i.0, 1
  br label %B7

B7:                                       ; preds = %B78, %B3
  %j.0 = phi i32 [ %v6, %B3 ], [ %v79, %B78 ]
  %v8 = icmp slt i32 %j.0, %nbodies
  br i1 %v8, label %B9, label %B80

B9:                                       ; preds = %B7
  %v10 = sext i32 %j.0 to i64
  %v11 = getelementptr inbounds %struct.planet* %bodies, i64 %v10
  %v12 = getelementptr inbounds %struct.planet* %v5, i32 0, i32 0
  %v13 = load double* %v12, align 8
  %v14 = getelementptr inbounds %struct.planet* %v11, i32 0, i32 0
  %v15 = load double* %v14, align 8
  %v16 = fsub double %v13, %v15
  %v17 = getelementptr inbounds %struct.planet* %v5, i32 0, i32 1
  %v18 = load double* %v17, align 8
  %v19 = getelementptr inbounds %struct.planet* %v11, i32 0, i32 1
  %v20 = load double* %v19, align 8
  %v21 = fsub double %v18, %v20
  %v22 = getelementptr inbounds %struct.planet* %v5, i32 0, i32 2
  %v23 = load double* %v22, align 8
  %v24 = getelementptr inbounds %struct.planet* %v11, i32 0, i32 2
  %v25 = load double* %v24, align 8
  %v26 = fsub double %v23, %v25
  %v27 = fmul double %v16, %v16
  %v28 = fmul double %v21, %v21
  %v29 = fadd double %v27, %v28
  %v30 = fmul double %v26, %v26
  %v31 = fadd double %v29, %v30
  %v32 = call double @sqrt(double %v31) #2
  %v33 = fmul double %v32, %v32
  %v34 = fmul double %v33, %v32
  %v35 = fdiv double %dt, %v34
  %v36 = getelementptr inbounds %struct.planet* %v11, i32 0, i32 6
  %v37 = load double* %v36, align 8
  %v38 = fmul double %v16, %v37
  %v39 = fmul double %v38, %v35
  %v40 = getelementptr inbounds %struct.planet* %v5, i32 0, i32 3
  %v41 = load double* %v40, align 8
  %v42 = fsub double %v41, %v39
  store double %v42, double* %v40, align 8
  %v43 = getelementptr inbounds %struct.planet* %v11, i32 0, i32 6
  %v44 = load double* %v43, align 8
  %v45 = fmul double %v21, %v44
  %v46 = fmul double %v45, %v35
  %v47 = getelementptr inbounds %struct.planet* %v5, i32 0, i32 4
  %v48 = load double* %v47, align 8
  %v49 = fsub double %v48, %v46
  store double %v49, double* %v47, align 8
  %v50 = getelementptr inbounds %struct.planet* %v11, i32 0, i32 6
  %v51 = load double* %v50, align 8
  %v52 = fmul double %v26, %v51
  %v53 = fmul double %v52, %v35
  %v54 = getelementptr inbounds %struct.planet* %v5, i32 0, i32 5
  %v55 = load double* %v54, align 8
  %v56 = fsub double %v55, %v53
  store double %v56, double* %v54, align 8
  %v57 = getelementptr inbounds %struct.planet* %v5, i32 0, i32 6
  %v58 = load double* %v57, align 8
  %v59 = fmul double %v16, %v58
  %v60 = fmul double %v59, %v35
  %v61 = getelementptr inbounds %struct.planet* %v11, i32 0, i32 3
  %v62 = load double* %v61, align 8
  %v63 = fadd double %v62, %v60
  store double %v63, double* %v61, align 8
  %v64 = getelementptr inbounds %struct.planet* %v5, i32 0, i32 6
  %v65 = load double* %v64, align 8
  %v66 = fmul double %v21, %v65
  %v67 = fmul double %v66, %v35
  %v68 = getelementptr inbounds %struct.planet* %v11, i32 0, i32 4
  %v69 = load double* %v68, align 8
  %v70 = fadd double %v69, %v67
  store double %v70, double* %v68, align 8
  %v71 = getelementptr inbounds %struct.planet* %v5, i32 0, i32 6
  %v72 = load double* %v71, align 8
  %v73 = fmul double %v26, %v72
  %v74 = fmul double %v73, %v35
  %v75 = getelementptr inbounds %struct.planet* %v11, i32 0, i32 5
  %v76 = load double* %v75, align 8
  %v77 = fadd double %v76, %v74
  store double %v77, double* %v75, align 8
  br label %B78

B78:                                      ; preds = %B9
  %v79 = add nsw i32 %j.0, 1
  br label %B7

B80:                                      ; preds = %B7
  br label %B81

B81:                                      ; preds = %B80
  %v82 = add nsw i32 %i.0, 1
  br label %B1

B83:                                      ; preds = %B1
  br label %B84

B84:                                      ; preds = %B107, %B83
  %i.1 = phi i32 [ 0, %B83 ], [ %v108, %B107 ]
  %v85 = icmp slt i32 %i.1, %nbodies
  br i1 %v85, label %B86, label %B109

B86:                                      ; preds = %B84
  %v87 = sext i32 %i.1 to i64
  %v88 = getelementptr inbounds %struct.planet* %bodies, i64 %v87
  %v89 = getelementptr inbounds %struct.planet* %v88, i32 0, i32 3
  %v90 = load double* %v89, align 8
  %v91 = fmul double %dt, %v90
  %v92 = getelementptr inbounds %struct.planet* %v88, i32 0, i32 0
  %v93 = load double* %v92, align 8
  %v94 = fadd double %v93, %v91
  store double %v94, double* %v92, align 8
  %v95 = getelementptr inbounds %struct.planet* %v88, i32 0, i32 4
  %v96 = load double* %v95, align 8
  %v97 = fmul double %dt, %v96
  %v98 = getelementptr inbounds %struct.planet* %v88, i32 0, i32 1
  %v99 = load double* %v98, align 8
  %v100 = fadd double %v99, %v97
  store double %v100, double* %v98, align 8
  %v101 = getelementptr inbounds %struct.planet* %v88, i32 0, i32 5
  %v102 = load double* %v101, align 8
  %v103 = fmul double %dt, %v102
  %v104 = getelementptr inbounds %struct.planet* %v88, i32 0, i32 2
  %v105 = load double* %v104, align 8
  %v106 = fadd double %v105, %v103
  store double %v106, double* %v104, align 8
  br label %B107

B107:                                     ; preds = %B86
  %v108 = add nsw i32 %i.1, 1
  br label %B84

B109:                                     ; preds = %B84
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define double @energy(i32 %nbodies, %struct.planet* %bodies) #0 {
  br label %1

; <label>:1                                       ; preds = %65, %0
  %e.0 = phi double [ 0.000000e+00, %0 ], [ %e.1, %65 ]
  %i.0 = phi i32 [ 0, %0 ], [ %66, %65 ]
  %2 = icmp slt i32 %i.0, %nbodies
  br i1 %2, label %3, label %67

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64
  %5 = getelementptr inbounds %struct.planet* %bodies, i64 %4
  %6 = getelementptr inbounds %struct.planet* %5, i32 0, i32 6
  %7 = load double* %6, align 8
  %8 = fmul double 5.000000e-01, %7
  %9 = getelementptr inbounds %struct.planet* %5, i32 0, i32 3
  %10 = load double* %9, align 8
  %11 = getelementptr inbounds %struct.planet* %5, i32 0, i32 3
  %12 = load double* %11, align 8
  %13 = fmul double %10, %12
  %14 = getelementptr inbounds %struct.planet* %5, i32 0, i32 4
  %15 = load double* %14, align 8
  %16 = getelementptr inbounds %struct.planet* %5, i32 0, i32 4
  %17 = load double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %13, %18
  %20 = getelementptr inbounds %struct.planet* %5, i32 0, i32 5
  %21 = load double* %20, align 8
  %22 = getelementptr inbounds %struct.planet* %5, i32 0, i32 5
  %23 = load double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %19, %24
  %26 = fmul double %8, %25
  %27 = fadd double %e.0, %26
  %28 = add nsw i32 %i.0, 1
  br label %29

; <label>:29                                      ; preds = %62, %3
  %e.1 = phi double [ %27, %3 ], [ %61, %62 ]
  %j.0 = phi i32 [ %28, %3 ], [ %63, %62 ]
  %30 = icmp slt i32 %j.0, %nbodies
  br i1 %30, label %31, label %64

; <label>:31                                      ; preds = %29
  %32 = sext i32 %j.0 to i64
  %33 = getelementptr inbounds %struct.planet* %bodies, i64 %32
  %34 = getelementptr inbounds %struct.planet* %5, i32 0, i32 0
  %35 = load double* %34, align 8
  %36 = getelementptr inbounds %struct.planet* %33, i32 0, i32 0
  %37 = load double* %36, align 8
  %38 = fsub double %35, %37
  %39 = getelementptr inbounds %struct.planet* %5, i32 0, i32 1
  %40 = load double* %39, align 8
  %41 = getelementptr inbounds %struct.planet* %33, i32 0, i32 1
  %42 = load double* %41, align 8
  %43 = fsub double %40, %42
  %44 = getelementptr inbounds %struct.planet* %5, i32 0, i32 2
  %45 = load double* %44, align 8
  %46 = getelementptr inbounds %struct.planet* %33, i32 0, i32 2
  %47 = load double* %46, align 8
  %48 = fsub double %45, %47
  %49 = fmul double %38, %38
  %50 = fmul double %43, %43
  %51 = fadd double %49, %50
  %52 = fmul double %48, %48
  %53 = fadd double %51, %52
  %54 = call double @sqrt(double %53) #2
  %55 = getelementptr inbounds %struct.planet* %5, i32 0, i32 6
  %56 = load double* %55, align 8
  %57 = getelementptr inbounds %struct.planet* %33, i32 0, i32 6
  %58 = load double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fdiv double %59, %54
  %61 = fsub double %e.1, %60
  br label %62

; <label>:62                                      ; preds = %31
  %63 = add nsw i32 %j.0, 1
  br label %29

; <label>:64                                      ; preds = %29
  br label %65

; <label>:65                                      ; preds = %64
  %66 = add nsw i32 %i.0, 1
  br label %1

; <label>:67                                      ; preds = %1
  ret double %e.0
}

; Function Attrs: nounwind uwtable
define void @offset_momentum(i32 %nbodies, %struct.planet* %bodies) #0 {
  br label %1

; <label>:1                                       ; preds = %34, %0
  %py.0 = phi double [ 0.000000e+00, %0 ], [ %23, %34 ]
  %px.0 = phi double [ 0.000000e+00, %0 ], [ %13, %34 ]
  %pz.0 = phi double [ 0.000000e+00, %0 ], [ %33, %34 ]
  %i.0 = phi i32 [ 0, %0 ], [ %35, %34 ]
  %2 = icmp slt i32 %i.0, %nbodies
  br i1 %2, label %3, label %36

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64
  %5 = getelementptr inbounds %struct.planet* %bodies, i64 %4
  %6 = getelementptr inbounds %struct.planet* %5, i32 0, i32 3
  %7 = load double* %6, align 8
  %8 = sext i32 %i.0 to i64
  %9 = getelementptr inbounds %struct.planet* %bodies, i64 %8
  %10 = getelementptr inbounds %struct.planet* %9, i32 0, i32 6
  %11 = load double* %10, align 8
  %12 = fmul double %7, %11
  %13 = fadd double %px.0, %12
  %14 = sext i32 %i.0 to i64
  %15 = getelementptr inbounds %struct.planet* %bodies, i64 %14
  %16 = getelementptr inbounds %struct.planet* %15, i32 0, i32 4
  %17 = load double* %16, align 8
  %18 = sext i32 %i.0 to i64
  %19 = getelementptr inbounds %struct.planet* %bodies, i64 %18
  %20 = getelementptr inbounds %struct.planet* %19, i32 0, i32 6
  %21 = load double* %20, align 8
  %22 = fmul double %17, %21
  %23 = fadd double %py.0, %22
  %24 = sext i32 %i.0 to i64
  %25 = getelementptr inbounds %struct.planet* %bodies, i64 %24
  %26 = getelementptr inbounds %struct.planet* %25, i32 0, i32 5
  %27 = load double* %26, align 8
  %28 = sext i32 %i.0 to i64
  %29 = getelementptr inbounds %struct.planet* %bodies, i64 %28
  %30 = getelementptr inbounds %struct.planet* %29, i32 0, i32 6
  %31 = load double* %30, align 8
  %32 = fmul double %27, %31
  %33 = fadd double %pz.0, %32
  br label %34

; <label>:34                                      ; preds = %3
  %35 = add nsw i32 %i.0, 1
  br label %1

; <label>:36                                      ; preds = %1
  %37 = fsub double -0.000000e+00, %px.0
  %38 = fdiv double %37, 0x4043BD3CC9BE45DE
  %39 = getelementptr inbounds %struct.planet* %bodies, i64 0
  %40 = getelementptr inbounds %struct.planet* %39, i32 0, i32 3
  store double %38, double* %40, align 8
  %41 = fsub double -0.000000e+00, %py.0
  %42 = fdiv double %41, 0x4043BD3CC9BE45DE
  %43 = getelementptr inbounds %struct.planet* %bodies, i64 0
  %44 = getelementptr inbounds %struct.planet* %43, i32 0, i32 4
  store double %42, double* %44, align 8
  %45 = fsub double -0.000000e+00, %pz.0
  %46 = fdiv double %45, 0x4043BD3CC9BE45DE
  %47 = getelementptr inbounds %struct.planet* %bodies, i64 0
  %48 = getelementptr inbounds %struct.planet* %47, i32 0, i32 5
  store double %46, double* %48, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %bodies = alloca [5 x %struct.planet], align 16
  %1 = bitcast [5 x %struct.planet]* %bodies to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([5 x %struct.planet]* @bodies_orig to i8*), i64 280, i32 16, i1 false)
  %2 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0
  call void @offset_momentum(i32 5, %struct.planet* %2)
  %3 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0
  %4 = call double @energy(i32 5, %struct.planet* %3)
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %4)
  br label %6

; <label>:6                                       ; preds = %10, %0
  %i.0 = phi i32 [ 1, %0 ], [ %11, %10 ]
  %7 = icmp sle i32 %i.0, %inputN
  br i1 %7, label %8, label %12

; <label>:8                                       ; preds = %6
  %9 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0
  call void @advance(i32 5, %struct.planet* %9, double 1.000000e-02)
  br label %10

; <label>:10                                      ; preds = %8
  %11 = add nsw i32 %i.0, 1
  br label %6

; <label>:12                                      ; preds = %6
  %13 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0
  %14 = call double @energy(i32 5, %struct.planet* %13)
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %14)
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
