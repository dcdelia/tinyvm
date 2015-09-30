; ModuleID = 'isord2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i32 @isord2to(i64* nocapture readonly %v_osr, i64 %n_osr, i64 %i.01_osr, i32 (i8*, i8*)* %c) {
OSR_entry:
;  %tmpres = trunc i64 %i.01_osr to i32
;  ret i32 %tmpres
  br label %.lr.ph

; <label>:0                                       ; preds = %.lr.ph
  %1 = icmp slt i64 %5, %n_osr
  br i1 %1, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %OSR_entry, %0
  %i.01 = phi i64 [ %5, %0 ], [ %i.01_osr, %OSR_entry ]
  %scevgep4 = getelementptr i64* %v_osr, i64 %i.01
  %scevgep5 = getelementptr i64* %scevgep4, i64 -1
  %2 = load i64* %scevgep5, align 8, !tbaa !1
  %scevgep3 = getelementptr i64* %v_osr, i64 %i.01
  %3 = load i64* %scevgep3, align 8, !tbaa !1
  %4 = icmp sgt i64 %2, %3
  %5 = add nuw nsw i64 %i.01, 1
  br i1 %4, label %._crit_edge, label %0

._crit_edge:                                      ; preds = %.lr.ph, %0
  %.0.ph = phi i32 [ 0, %.lr.ph ], [ 2, %0 ]
  ret i32 %.0.ph
}

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}

