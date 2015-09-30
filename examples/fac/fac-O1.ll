; ModuleID = 'simple.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define i32 @fac(i32 %n) #0 {
  %1 = icmp slt i32 %n, 2
  br i1 %1, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %0, %.lr.ph
  %f.02 = phi i32 [ %2, %.lr.ph ], [ 1, %0 ]
  %i.01 = phi i32 [ %3, %.lr.ph ], [ 2, %0 ]
  %2 = mul nsw i32 %f.02, %i.01
  %3 = add nuw nsw i32 %i.01, 1
  %exitcond = icmp eq i32 %i.01, %n
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph, %0
  %f.0.lcssa = phi i32 [ 1, %0 ], [ %2, %.lr.ph ]
  ret i32 %f.0.lcssa
}

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
