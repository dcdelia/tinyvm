; ModuleID = 'isord2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i32 @isord2(i64* nocapture readonly %v, i64 %n) #0 {
  %1 = icmp sgt i64 %n, 1
  br i1 %1, label %.lr.ph, label %._crit_edge

; <label>:2                                       ; preds = %.lr.ph
  %3 = icmp slt i64 %10, %n
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0, %2
  %i.01 = phi i64 [ %10, %2 ], [ 1, %0 ]
  %4 = add nsw i64 %i.01, -1
  %5 = getelementptr inbounds i64* %v, i64 %4
  %6 = load i64* %5, align 8, !tbaa !1
  %7 = getelementptr inbounds i64* %v, i64 %i.01
  %8 = load i64* %7, align 8, !tbaa !1
  %9 = icmp sgt i64 %6, %8
  %10 = add nuw nsw i64 %i.01, 1
  br i1 %9, label %._crit_edge, label %2

._crit_edge:                                      ; preds = %.lr.ph, %2, %0
  %.0 = phi i32 [ 1, %0 ], [ 0, %.lr.ph ], [ 1, %2 ]
  ret i32 %.0
}

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
