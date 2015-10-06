; ModuleID = 'fun_calls.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [35 x i8] c"Current value after %d rounds: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @sumInt(i32 %a, i32 %b) #0 {
  %1 = add nsw i32 %a, %b
  ret i32 %1
}

; Function Attrs: nounwind uwtable
define i32 @fun_calls(i32 %rounds) #0 {
  br label %1

; <label>:1                                       ; preds = %10, %0
  %ret.0 = phi i32 [ 1, %0 ], [ %9, %10 ]
  %i.0 = phi i32 [ 0, %0 ], [ %11, %10 ]
  %2 = icmp slt i32 %i.0, %rounds
  br i1 %2, label %3, label %12

; <label>:3                                       ; preds = %1
  %4 = srem i32 %i.0, 10
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %3
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str, i32 0, i32 0), i32 %i.0, i32 %ret.0)
  br label %8

; <label>:8                                       ; preds = %6, %3
  %9 = call i32 @sumInt(i32 %i.0, i32 %ret.0)
  br label %10

; <label>:10                                      ; preds = %8
  %11 = add nsw i32 %i.0, 1
  br label %1

; <label>:12                                      ; preds = %1
  ret i32 %ret.0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
