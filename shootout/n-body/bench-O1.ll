; ModuleID = 'bench.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies_orig = global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @advance(i32 %nbodies, %struct.planet* nocapture %bodies, double %dt) #0 {
  %1 = icmp sgt i32 %nbodies, 0
  br i1 %1, label %.lr.ph7, label %._crit_edge

.lr.ph7:                                          ; preds = %0
  %2 = add i32 %nbodies, -1
  %3 = sext i32 %nbodies to i64
  br label %6

.preheader:                                       ; preds = %._crit_edge4
  %4 = icmp sgt i32 %nbodies, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %5 = add i32 %nbodies, -1
  br label %71

; <label>:6                                       ; preds = %._crit_edge4, %.lr.ph7
  %indvars.iv14 = phi i64 [ 0, %.lr.ph7 ], [ %indvars.iv.next15, %._crit_edge4 ]
  %indvars.iv8 = phi i64 [ 1, %.lr.ph7 ], [ %indvars.iv.next9, %._crit_edge4 ]
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %7 = icmp slt i64 %indvars.iv.next15, %3
  br i1 %7, label %.lr.ph3, label %._crit_edge4

.lr.ph3:                                          ; preds = %6
  %8 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv14, i32 0
  %9 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv14, i32 1
  %10 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv14, i32 2
  %11 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv14, i32 3
  %12 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv14, i32 4
  %13 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv14, i32 5
  %14 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv14, i32 6
  br label %15

; <label>:15                                      ; preds = %15, %.lr.ph3
  %indvars.iv10 = phi i64 [ %indvars.iv8, %.lr.ph3 ], [ %indvars.iv.next11, %15 ]
  %16 = load double* %8, align 8
  %17 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 0
  %18 = load double* %17, align 8
  %19 = fsub double %16, %18
  %20 = load double* %9, align 8
  %21 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 1
  %22 = load double* %21, align 8
  %23 = fsub double %20, %22
  %24 = load double* %10, align 8
  %25 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 2
  %26 = load double* %25, align 8
  %27 = fsub double %24, %26
  %28 = fmul double %19, %19
  %29 = fmul double %23, %23
  %30 = fadd double %28, %29
  %31 = fmul double %27, %27
  %32 = fadd double %30, %31
  %33 = tail call double @sqrt(double %32) #2
  %34 = fmul double %33, %33
  %35 = fmul double %33, %34
  %36 = fdiv double %dt, %35
  %37 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 6
  %38 = load double* %37, align 8
  %39 = fmul double %19, %38
  %40 = fmul double %36, %39
  %41 = load double* %11, align 8
  %42 = fsub double %41, %40
  store double %42, double* %11, align 8
  %43 = load double* %37, align 8
  %44 = fmul double %23, %43
  %45 = fmul double %36, %44
  %46 = load double* %12, align 8
  %47 = fsub double %46, %45
  store double %47, double* %12, align 8
  %48 = load double* %37, align 8
  %49 = fmul double %27, %48
  %50 = fmul double %36, %49
  %51 = load double* %13, align 8
  %52 = fsub double %51, %50
  store double %52, double* %13, align 8
  %53 = load double* %14, align 8
  %54 = fmul double %19, %53
  %55 = fmul double %36, %54
  %56 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 3
  %57 = load double* %56, align 8
  %58 = fadd double %57, %55
  store double %58, double* %56, align 8
  %59 = load double* %14, align 8
  %60 = fmul double %23, %59
  %61 = fmul double %36, %60
  %62 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 4
  %63 = load double* %62, align 8
  %64 = fadd double %63, %61
  store double %64, double* %62, align 8
  %65 = load double* %14, align 8
  %66 = fmul double %27, %65
  %67 = fmul double %36, %66
  %68 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv10, i32 5
  %69 = load double* %68, align 8
  %70 = fadd double %69, %67
  store double %70, double* %68, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %lftr.wideiv12 = trunc i64 %indvars.iv10 to i32
  %exitcond13 = icmp eq i32 %lftr.wideiv12, %2
  br i1 %exitcond13, label %._crit_edge4.loopexit, label %15

._crit_edge4.loopexit:                            ; preds = %15
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %6
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %lftr.wideiv16 = trunc i64 %indvars.iv14 to i32
  %exitcond17 = icmp eq i32 %lftr.wideiv16, %2
  br i1 %exitcond17, label %.preheader, label %6

; <label>:71                                      ; preds = %71, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %71 ]
  %72 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 3
  %73 = load double* %72, align 8
  %74 = fmul double %73, %dt
  %75 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 0
  %76 = load double* %75, align 8
  %77 = fadd double %76, %74
  store double %77, double* %75, align 8
  %78 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 4
  %79 = load double* %78, align 8
  %80 = fmul double %79, %dt
  %81 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 1
  %82 = load double* %81, align 8
  %83 = fadd double %82, %80
  store double %83, double* %81, align 8
  %84 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 5
  %85 = load double* %84, align 8
  %86 = fmul double %85, %dt
  %87 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 2
  %88 = load double* %87, align 8
  %89 = fadd double %88, %86
  store double %89, double* %87, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %5
  br i1 %exitcond, label %._crit_edge.loopexit, label %71

._crit_edge.loopexit:                             ; preds = %71
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0, %.preheader
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
