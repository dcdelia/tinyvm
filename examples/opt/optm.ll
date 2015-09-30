; ModuleID = 'opt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i64* %v, i64 %n) #0 {
L0:
  br label %L1

L1: ; preds = %L3, %L0
  %i = phi i64 [ 0, %L0 ], [ %i1, %L3 ]
  %0 = sdiv i64 %n, 2
  %1 = icmp slt i64 %i, %0
  br i1 %1, label %L2, label %L4

L2: ; preds = %L1
  %2 = getelementptr inbounds i64* %v, i64 %i
  %3 = load i64* %2, align 8
  %4 = mul nsw i64 2, %i
  %5 = getelementptr inbounds i64* %v, i64 %4
  %6 = load i64* %5, align 8
  %7 = icmp sgt i64 %3, %6
  br i1 %7, label %L4, label %L3

L3: ; preds = %L2
  %i1 = add nsw i64 %i, 1
  br label %L1

L4: ; preds = %L1, %L2
  %res = phi i32 [ 0, %L2 ], [ 1, %L1 ]
  ret i32 %res
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}

