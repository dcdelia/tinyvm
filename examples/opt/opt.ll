; ModuleID = 'tmp.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i64* %v, i64 %n) #0 {
  br label %1

; <label>:1                                       ; preds = %11, %0
  %i.0 = phi i64 [ 0, %0 ], [ %12, %11 ]
  %2 = sdiv i64 %n, 2
  %3 = icmp slt i64 %i.0, %2
  br i1 %3, label %4, label %13

; <label>:4                                       ; preds = %1
  %5 = getelementptr inbounds i64* %v, i64 %i.0
  %6 = load i64* %5, align 8
  %7 = mul nsw i64 2, %i.0
  %8 = getelementptr inbounds i64* %v, i64 %7
  %9 = load i64* %8, align 8
  %10 = icmp sgt i64 %6, %9
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %4
  %12 = add nsw i64 %i.0, 1
  br label %1

; <label>:13                                      ; preds = %1, %4
  %.0 = phi i32 [ 0, %4 ], [ 1, %1 ]
  ret i32 %.0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
