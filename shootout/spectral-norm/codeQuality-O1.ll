; ModuleID = 'codeQuality.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define double @eval_A(i32 %i, i32 %j) #0 {
  %1 = add nsw i32 %j, %i
  %2 = add nsw i32 %1, 1
  %3 = mul nsw i32 %2, %1
  %4 = sdiv i32 %3, 2
  %5 = add i32 %i, 1
  %6 = add i32 %5, %4
  %7 = sitofp i32 %6 to double
  %8 = fdiv double 1.000000e+00, %7
  ret double %8
}

; Function Attrs: nounwind uwtable
define void @eval_A_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %Au) #1 {
entry:
  %v23 = icmp sgt i32 %N, 0
  br i1 %v23, label %B3.lr.ph, label %B23

B3.lr.ph:                                         ; preds = %entry
  %0 = add i32 %N, -1
  br label %B3

B3:                                               ; preds = %B21, %B3.lr.ph
  %indvars.iv5 = phi i64 [ 0, %B3.lr.ph ], [ %indvars.iv.next6, %B21 ]
  %v5 = getelementptr inbounds double* %Au, i64 %indvars.iv5
  store double 0.000000e+00, double* %v5, align 8
  br label %B8

B8:                                               ; preds = %B3, %B8
  %indvars.iv = phi i64 [ %indvars.iv.next, %B8 ], [ 0, %B3 ]
  %1 = trunc i64 %indvars.iv to i32
  %2 = trunc i64 %indvars.iv5 to i32
  %v9 = tail call double @eval_A(i32 %2, i32 %1)
  %v11 = getelementptr inbounds double* %u, i64 %indvars.iv
  %v12 = load double* %v11, align 8
  %v13 = fmul double %v9, %v12
  %v16 = load double* %v5, align 8
  %v17 = fadd double %v16, %v13
  store double %v17, double* %v5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond, label %B21, label %B8

B21:                                              ; preds = %B8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %lftr.wideiv7 = trunc i64 %indvars.iv5 to i32
  %exitcond8 = icmp eq i32 %lftr.wideiv7, %0
  br i1 %exitcond8, label %B23.loopexit, label %B3

B23.loopexit:                                     ; preds = %B21
  br label %B23

B23:                                              ; preds = %B23.loopexit, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @eval_At_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %Au) #1 {
entry:
  %v23 = icmp sgt i32 %N, 0
  br i1 %v23, label %B3.lr.ph, label %B23

B3.lr.ph:                                         ; preds = %entry
  %0 = add i32 %N, -1
  br label %B3

B3:                                               ; preds = %B21, %B3.lr.ph
  %indvars.iv5 = phi i64 [ 0, %B3.lr.ph ], [ %indvars.iv.next6, %B21 ]
  %v5 = getelementptr inbounds double* %Au, i64 %indvars.iv5
  store double 0.000000e+00, double* %v5, align 8
  br label %B8

B8:                                               ; preds = %B3, %B8
  %indvars.iv = phi i64 [ %indvars.iv.next, %B8 ], [ 0, %B3 ]
  %1 = trunc i64 %indvars.iv to i32
  %2 = trunc i64 %indvars.iv5 to i32
  %v9 = tail call double @eval_A(i32 %1, i32 %2)
  %v11 = getelementptr inbounds double* %u, i64 %indvars.iv
  %v12 = load double* %v11, align 8
  %v13 = fmul double %v9, %v12
  %v16 = load double* %v5, align 8
  %v17 = fadd double %v16, %v13
  store double %v17, double* %v5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %0
  br i1 %exitcond, label %B21, label %B8

B21:                                              ; preds = %B8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %lftr.wideiv7 = trunc i64 %indvars.iv5 to i32
  %exitcond8 = icmp eq i32 %lftr.wideiv7, %0
  br i1 %exitcond8, label %B23.loopexit, label %B3

B23.loopexit:                                     ; preds = %B21
  br label %B23

B23:                                              ; preds = %B23.loopexit, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define void @eval_AtA_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %AtAu) #1 {
  %1 = zext i32 %N to i64
  %2 = alloca double, i64 %1, align 16
  call void @eval_A_times_u(i32 %N, double* %u, double* %2)
  call void @eval_At_times_u(i32 %N, double* %2, double* %AtAu)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #1 {
  %1 = icmp sgt i32 %inputN, 0
  %inputN. = select i1 %1, i32 %inputN, i32 2000
  %2 = zext i32 %inputN. to i64
  %3 = alloca double, i64 %2, align 16
  %4 = alloca double, i64 %2, align 16
  %5 = sext i32 %inputN. to i64
  br label %6

; <label>:6                                       ; preds = %0, %6
  %indvars.iv8 = phi i64 [ 0, %0 ], [ %indvars.iv.next9, %6 ]
  %7 = getelementptr inbounds double* %3, i64 %indvars.iv8
  store double 1.000000e+00, double* %7, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %8 = icmp slt i64 %indvars.iv.next9, %5
  br i1 %8, label %6, label %.preheader10

.preheader10:                                     ; preds = %6
  call void @eval_AtA_times_u(i32 %inputN., double* %3, double* %4)
  call void @eval_AtA_times_u(i32 %inputN., double* %4, double* %3)
  call void @eval_AtA_times_u(i32 %inputN., double* %3, double* %4)
  call void @eval_AtA_times_u(i32 %inputN., double* %4, double* %3)
  call void @eval_AtA_times_u(i32 %inputN., double* %3, double* %4)
  call void @eval_AtA_times_u(i32 %inputN., double* %4, double* %3)
  call void @eval_AtA_times_u(i32 %inputN., double* %3, double* %4)
  call void @eval_AtA_times_u(i32 %inputN., double* %4, double* %3)
  call void @eval_AtA_times_u(i32 %inputN., double* %3, double* %4)
  call void @eval_AtA_times_u(i32 %inputN., double* %4, double* %3)
  call void @eval_AtA_times_u(i32 %inputN., double* %3, double* %4)
  call void @eval_AtA_times_u(i32 %inputN., double* %4, double* %3)
  call void @eval_AtA_times_u(i32 %inputN., double* %3, double* %4)
  call void @eval_AtA_times_u(i32 %inputN., double* %4, double* %3)
  call void @eval_AtA_times_u(i32 %inputN., double* %3, double* %4)
  call void @eval_AtA_times_u(i32 %inputN., double* %4, double* %3)
  call void @eval_AtA_times_u(i32 %inputN., double* %3, double* %4)
  call void @eval_AtA_times_u(i32 %inputN., double* %4, double* %3)
  call void @eval_AtA_times_u(i32 %inputN., double* %3, double* %4)
  call void @eval_AtA_times_u(i32 %inputN., double* %4, double* %3)
  %9 = sext i32 %inputN. to i64
  br label %10

; <label>:10                                      ; preds = %.preheader10, %10
  %indvars.iv = phi i64 [ 0, %.preheader10 ], [ %indvars.iv.next, %10 ]
  %vv.04 = phi double [ 0.000000e+00, %.preheader10 ], [ %18, %10 ]
  %vBv.02 = phi double [ 0.000000e+00, %.preheader10 ], [ %16, %10 ]
  %11 = getelementptr inbounds double* %3, i64 %indvars.iv
  %12 = load double* %11, align 8
  %13 = getelementptr inbounds double* %4, i64 %indvars.iv
  %14 = load double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fadd double %vBv.02, %15
  %17 = fmul double %14, %14
  %18 = fadd double %vv.04, %17
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = icmp slt i64 %indvars.iv.next, %9
  br i1 %19, label %10, label %20

; <label>:20                                      ; preds = %10
  %.lcssa12 = phi double [ %18, %10 ]
  %.lcssa = phi double [ %16, %10 ]
  %21 = fdiv double %.lcssa, %.lcssa12
  %22 = tail call double @sqrt(double %21) #3
  %23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), double %22) #3
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
