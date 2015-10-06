; ModuleID = 'fun_calls.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [35 x i8] c"Current value after %d rounds: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @sumInt(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = add nsw i32 %3, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @fun_calls(i32 %rounds) #0 {
  %1 = alloca i32, align 4
  %ret = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %rounds, i32* %1, align 4
  store i32 1, i32* %ret, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %18, %0
  %3 = load i32* %i, align 4
  %4 = load i32* %1, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %21

; <label>:6                                       ; preds = %2
  %7 = load i32* %i, align 4
  %8 = srem i32 %7, 10
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %14

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = load i32* %ret, align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str, i32 0, i32 0), i32 %11, i32 %12)
  br label %14

; <label>:14                                      ; preds = %10, %6
  %15 = load i32* %i, align 4
  %16 = load i32* %ret, align 4
  %17 = call i32 @sumInt(i32 %15, i32 %16)
  store i32 %17, i32* %ret, align 4
  br label %18

; <label>:18                                      ; preds = %14
  %19 = load i32* %i, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %2

; <label>:21                                      ; preds = %2
  %22 = load i32* %ret, align 4
  ret i32 %22
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
