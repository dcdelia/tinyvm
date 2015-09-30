; ModuleID = 'simple.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define i32 @fac(i32 %n) #0 {
L0:
  %tmp1 = icmp slt i32 %n, 2
  br i1 %tmp1, label %L2, label %L1

L1:          ; preds = %L0, %L1
  %f = phi i32 [ %f1, %L1 ], [ 1, %L0 ]
  %i = phi i32 [ %i1, %L1 ], [ 2, %L0 ]
  %f1 = mul nsw i32 %f, %i
  %i1 = add nuw nsw i32 %i, 1
  %exitcond = icmp eq i32 %i, %n
  br i1 %exitcond, label %L2, label %L1

L2:          ; preds = %L1, %L0
  %f2 = phi i32 [ 1, %L0 ], [ %f1, %L1 ]
  ret i32 %f2
}

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
