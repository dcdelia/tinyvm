; ModuleID = 'globals.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@counter = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @iterate(i32 %numIt) #0 {
  br label %1

; <label>:1                                       ; preds = %6, %0
  %i.0 = phi i32 [ 0, %0 ], [ %7, %6 ]
  %2 = icmp slt i32 %i.0, %numIt
  br i1 %2, label %3, label %8

; <label>:3                                       ; preds = %1
  %4 = load i32* @counter, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* @counter, align 4
  br label %6

; <label>:6                                       ; preds = %3
  %7 = add nsw i32 %i.0, 1
  br label %1

; <label>:8                                       ; preds = %1
  %9 = load i32* @counter, align 4
  ret i32 %9
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
