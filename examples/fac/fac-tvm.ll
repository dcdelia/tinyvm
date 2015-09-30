; ModuleID = 'tmp.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @fac(i32 %n) #0 {
L0:
  br label %L1

L1:                                               ; preds = %L3, %L0
  %i = phi i32 [ 2, %L0 ], [ %i1, %L3 ]
  %f = phi i32 [ 1, %L0 ], [ %f1, %L3 ]
  %tmp = icmp sle i32 %i, %n
  br i1 %tmp, label %L3, label %L7

L3:                                               ; preds = %L1
  %f1 = mul nsw i32 %f, %i
  %i1 = add nsw i32 %i, 1
  br label %L1

L7:                                               ; preds = %L1
  ret i32 %f
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-na$

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}

