; ModuleID = 'finalAlwaysFire.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies_orig = global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @advance(i32 %nbodies, %struct.planet* nocapture %bodies, double %dt) #0 {
entry:
  %v211 = icmp sgt i32 %nbodies, 0
  br i1 %v211, label %B3.lr.ph, label %B109

B3.lr.ph:                                         ; preds = %entry
  %0 = add i32 %nbodies, -1
  %1 = sext i32 %nbodies to i64
  br label %B3

B84.preheader:                                    ; preds = %B81
  %v851 = icmp sgt i32 %nbodies, 0
  br i1 %v851, label %B86.lr.ph, label %B109

B86.lr.ph:                                        ; preds = %B84.preheader
  %2 = add i32 %nbodies, -1
  br label %B86

B3:                                               ; preds = %B81, %B3.lr.ph
  %indvars.iv20 = phi i64 [ 0, %B3.lr.ph ], [ %indvars.iv.next21, %B81 ]
  %indvars.iv13 = phi i64 [ 1, %B3.lr.ph ], [ %indvars.iv.next14, %B81 ]
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %v86 = icmp slt i64 %indvars.iv.next21, %1
  br i1 %v86, label %B9.lr.ph, label %B81

B9.lr.ph:                                         ; preds = %B3
  %v12 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv20, i32 0
  %v17 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv20, i32 1
  %v22 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv20, i32 2
  %v40 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv20, i32 3
  %v47 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv20, i32 4
  %v54 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv20, i32 5
  %v57 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv20, i32 6
  br label %B9

B9:                                               ; preds = %B9, %B9.lr.ph
  %indvars.iv15 = phi i64 [ %indvars.iv13, %B9.lr.ph ], [ %indvars.iv.next16, %B9 ]
  %v13 = load double* %v12, align 8
  %v14 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 0
  %v15 = load double* %v14, align 8
  %v16 = fsub double %v13, %v15
  %v18 = load double* %v17, align 8
  %v19 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 1
  %v20 = load double* %v19, align 8
  %v21 = fsub double %v18, %v20
  %v23 = load double* %v22, align 8
  %v24 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 2
  %v25 = load double* %v24, align 8
  %v26 = fsub double %v23, %v25
  %v27 = fmul double %v16, %v16
  %v28 = fmul double %v21, %v21
  %v29 = fadd double %v27, %v28
  %v30 = fmul double %v26, %v26
  %v31 = fadd double %v29, %v30
  %v32 = tail call double @sqrt(double %v31) #2
  %v33 = fmul double %v32, %v32
  %v34 = fmul double %v32, %v33
  %v35 = fdiv double %dt, %v34
  %v36 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 6
  %v37 = load double* %v36, align 8
  %v38 = fmul double %v16, %v37
  %v39 = fmul double %v35, %v38
  %v41 = load double* %v40, align 8
  %v42 = fsub double %v41, %v39
  store double %v42, double* %v40, align 8
  %v44 = load double* %v36, align 8
  %v45 = fmul double %v21, %v44
  %v46 = fmul double %v35, %v45
  %v48 = load double* %v47, align 8
  %v49 = fsub double %v48, %v46
  store double %v49, double* %v47, align 8
  %v51 = load double* %v36, align 8
  %v52 = fmul double %v26, %v51
  %v53 = fmul double %v35, %v52
  %v55 = load double* %v54, align 8
  %v56 = fsub double %v55, %v53
  store double %v56, double* %v54, align 8
  %v58 = load double* %v57, align 8
  %v59 = fmul double %v16, %v58
  %v60 = fmul double %v35, %v59
  %v61 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 3
  %v62 = load double* %v61, align 8
  %v63 = fadd double %v62, %v60
  store double %v63, double* %v61, align 8
  %v65 = load double* %v57, align 8
  %v66 = fmul double %v21, %v65
  %v67 = fmul double %v35, %v66
  %v68 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 4
  %v69 = load double* %v68, align 8
  %v70 = fadd double %v69, %v67
  store double %v70, double* %v68, align 8
  %v72 = load double* %v57, align 8
  %v73 = fmul double %v26, %v72
  %v74 = fmul double %v35, %v73
  %v75 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 5
  %v76 = load double* %v75, align 8
  %v77 = fadd double %v76, %v74
  store double %v77, double* %v75, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %lftr.wideiv18 = trunc i64 %indvars.iv15 to i32
  %exitcond19 = icmp eq i32 %lftr.wideiv18, %0
  br i1 %exitcond19, label %B81.loopexit, label %B9

B81.loopexit:                                     ; preds = %B9
  br label %B81

B81:                                              ; preds = %B81.loopexit, %B3
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %lftr.wideiv22 = trunc i64 %indvars.iv20 to i32
  %exitcond23 = icmp eq i32 %lftr.wideiv22, %0
  br i1 %exitcond23, label %B84.preheader, label %B3

B86:                                              ; preds = %B86, %B86.lr.ph
  %indvars.iv = phi i64 [ 0, %B86.lr.ph ], [ %indvars.iv.next, %B86 ]
  %v89 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 3
  %v90 = load double* %v89, align 8
  %v91 = fmul double %v90, %dt
  %v92 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 0
  %v93 = load double* %v92, align 8
  %v94 = fadd double %v93, %v91
  store double %v94, double* %v92, align 8
  %v95 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 4
  %v96 = load double* %v95, align 8
  %v97 = fmul double %v96, %dt
  %v98 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 1
  %v99 = load double* %v98, align 8
  %v100 = fadd double %v99, %v97
  store double %v100, double* %v98, align 8
  %v101 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 5
  %v102 = load double* %v101, align 8
  %v103 = fmul double %v102, %dt
  %v104 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 2
  %v105 = load double* %v104, align 8
  %v106 = fadd double %v105, %v103
  store double %v106, double* %v104, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %2
  br i1 %exitcond, label %B109.loopexit, label %B86

B109.loopexit:                                    ; preds = %B86
  br label %B109

B109:                                             ; preds = %B109.loopexit, %entry, %B84.preheader
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define double @energy(i32 %nbodies, %struct.planet* nocapture readonly %bodies) #0 {
  %1 = icmp sgt i32 %nbodies, 0
  br i1 %1, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %0
  %2 = add i32 %nbodies, -1
  %3 = sext i32 %nbodies to i64
  br label %4

; <label>:4                                       ; preds = %._crit_edge, %.lr.ph5
  %indvars.iv10 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next11, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %.lr.ph5 ], [ %indvars.iv.next, %._crit_edge ]
  %e.02 = phi double [ 0.000000e+00, %.lr.ph5 ], [ %e.1.lcssa, %._crit_edge ]
  %5 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 6
  %6 = load double* %5, align 8
  %7 = fmul double %6, 5.000000e-01
  %8 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 3
  %9 = load double* %8, align 8
  %10 = fmul double %9, %9
  %11 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 4
  %12 = load double* %11, align 8
  %13 = fmul double %12, %12
  %14 = fadd double %10, %13
  %15 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 5
  %16 = load double* %15, align 8
  %17 = fmul double %16, %16
  %18 = fadd double %14, %17
  %19 = fmul double %7, %18
  %20 = fadd double %e.02, %19
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %21 = icmp slt i64 %indvars.iv.next11, %3
  br i1 %21, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %22 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 0
  %23 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 1
  %24 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 2
  br label %25

; <label>:25                                      ; preds = %25, %.lr.ph
  %indvars.iv8 = phi i64 [ %indvars.iv, %.lr.ph ], [ %indvars.iv.next9, %25 ]
  %e.11 = phi double [ %20, %.lr.ph ], [ %49, %25 ]
  %26 = load double* %22, align 8
  %27 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv8, i32 0
  %28 = load double* %27, align 8
  %29 = fsub double %26, %28
  %30 = load double* %23, align 8
  %31 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv8, i32 1
  %32 = load double* %31, align 8
  %33 = fsub double %30, %32
  %34 = load double* %24, align 8
  %35 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv8, i32 2
  %36 = load double* %35, align 8
  %37 = fsub double %34, %36
  %38 = fmul double %29, %29
  %39 = fmul double %33, %33
  %40 = fadd double %38, %39
  %41 = fmul double %37, %37
  %42 = fadd double %40, %41
  %43 = tail call double @sqrt(double %42) #2
  %44 = load double* %5, align 8
  %45 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv8, i32 6
  %46 = load double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fdiv double %47, %43
  %49 = fsub double %e.11, %48
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %lftr.wideiv = trunc i64 %indvars.iv8 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %2
  br i1 %exitcond, label %._crit_edge.loopexit, label %25

._crit_edge.loopexit:                             ; preds = %25
  %.lcssa = phi double [ %49, %25 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  %e.1.lcssa = phi double [ %20, %4 ], [ %.lcssa, %._crit_edge.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv12 = trunc i64 %indvars.iv10 to i32
  %exitcond13 = icmp eq i32 %lftr.wideiv12, %2
  br i1 %exitcond13, label %._crit_edge6.loopexit, label %4

._crit_edge6.loopexit:                            ; preds = %._crit_edge
  %e.1.lcssa.lcssa = phi double [ %e.1.lcssa, %._crit_edge ]
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %0
  %e.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %e.1.lcssa.lcssa, %._crit_edge6.loopexit ]
  ret double %e.0.lcssa
}

; Function Attrs: nounwind uwtable
define void @offset_momentum(i32 %nbodies, %struct.planet* nocapture %bodies) #0 {
  %1 = icmp sgt i32 %nbodies, 0
  br i1 %1, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %2 = add i32 %nbodies, -1
  br label %3

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %3 ]
  %pz.03 = phi double [ 0.000000e+00, %.lr.ph ], [ %17, %3 ]
  %px.02 = phi double [ 0.000000e+00, %.lr.ph ], [ %9, %3 ]
  %py.01 = phi double [ 0.000000e+00, %.lr.ph ], [ %13, %3 ]
  %4 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 3
  %5 = load double* %4, align 8
  %6 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 6
  %7 = load double* %6, align 8
  %8 = fmul double %5, %7
  %9 = fadd double %px.02, %8
  %10 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 4
  %11 = load double* %10, align 8
  %12 = fmul double %7, %11
  %13 = fadd double %py.01, %12
  %14 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 5
  %15 = load double* %14, align 8
  %16 = fmul double %7, %15
  %17 = fadd double %pz.03, %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %2
  br i1 %exitcond, label %._crit_edge.loopexit, label %3

._crit_edge.loopexit:                             ; preds = %3
  %.lcssa12 = phi double [ %17, %3 ]
  %.lcssa11 = phi double [ %13, %3 ]
  %.lcssa = phi double [ %9, %3 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  %pz.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %.lcssa12, %._crit_edge.loopexit ]
  %px.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %.lcssa, %._crit_edge.loopexit ]
  %py.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %.lcssa11, %._crit_edge.loopexit ]
  %18 = fsub double -0.000000e+00, %px.0.lcssa
  %19 = fdiv double %18, 0x4043BD3CC9BE45DE
  %20 = getelementptr inbounds %struct.planet* %bodies, i64 0, i32 3
  store double %19, double* %20, align 8
  %21 = fsub double -0.000000e+00, %py.0.lcssa
  %22 = fdiv double %21, 0x4043BD3CC9BE45DE
  %23 = getelementptr inbounds %struct.planet* %bodies, i64 0, i32 4
  store double %22, double* %23, align 8
  %24 = fsub double -0.000000e+00, %pz.0.lcssa
  %25 = fdiv double %24, 0x4043BD3CC9BE45DE
  %26 = getelementptr inbounds %struct.planet* %bodies, i64 0, i32 5
  store double %25, double* %26, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %bodies = alloca [5 x %struct.planet], align 16
  %1 = bitcast [5 x %struct.planet]* %bodies to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([5 x %struct.planet]* @bodies_orig to i8*), i64 280, i32 16, i1 false)
  %2 = getelementptr inbounds [5 x %struct.planet]* %bodies, i64 0, i64 0
  call void @offset_momentum(i32 5, %struct.planet* %2)
  %3 = call double @energy(i32 5, %struct.planet* %2)
  %4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %3) #2
  %5 = icmp slt i32 %inputN, 1
  br i1 %5, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %i.01 = phi i32 [ %6, %.lr.ph ], [ 1, %.lr.ph.preheader ]
  call void @advance(i32 5, %struct.planet* %2, double 1.000000e-02)
  %6 = add nuw nsw i32 %i.01, 1
  %exitcond = icmp eq i32 %i.01, %inputN
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  %7 = call double @energy(i32 5, %struct.planet* %2)
  %8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %7) #2
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
