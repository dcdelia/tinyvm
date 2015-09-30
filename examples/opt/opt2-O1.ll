; ModuleID = 'opt2.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i32 @f(i64* nocapture readonly %v, i64 %n) #0 {
  %1 = sdiv i64 %n, 2
  %2 = icmp sgt i64 %n, 1
  br i1 %2, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %8
  %j.02 = phi i64 [ %10, %8 ], [ 0, %.lr.ph.preheader ]
  %i.01 = phi i64 [ %9, %8 ], [ 0, %.lr.ph.preheader ]
  %3 = getelementptr inbounds i64* %v, i64 %i.01
  %4 = load i64* %3, align 8
  %5 = getelementptr inbounds i64* %v, i64 %j.02
  %6 = load i64* %5, align 8
  %7 = icmp sgt i64 %4, %6
  br i1 %7, label %._crit_edge.loopexit, label %8

; <label>:8                                       ; preds = %.lr.ph
  %9 = add nuw nsw i64 %i.01, 1
  %10 = add nuw nsw i64 %j.02, 2
  %11 = icmp slt i64 %9, %1
  br i1 %11, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph, %8
  %.0.ph = phi i32 [ 0, %.lr.ph ], [ 1, %8 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  %.0 = phi i32 [ 1, %0 ], [ %.0.ph, %._crit_edge.loopexit ]
  ret i32 %.0
}

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
