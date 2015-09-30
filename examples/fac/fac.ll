; ModuleID = 'tmp.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @fac(i32 %n) #0 {
  br label %1

; <label>:1                                       ; preds = %5, %0
  %i.0 = phi i32 [ 2, %0 ], [ %6, %5 ]
  %f.0 = phi i32 [ 1, %0 ], [ %4, %5 ]
  %2 = icmp sle i32 %i.0, %n
  br i1 %2, label %3, label %7

; <label>:3                                       ; preds = %1
  %4 = mul nsw i32 %f.0, %i.0
  br label %5

; <label>:5                                       ; preds = %3
  %6 = add nsw i32 %i.0, 1
  br label %1

; <label>:7                                       ; preds = %1
  ret i32 %f.0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
