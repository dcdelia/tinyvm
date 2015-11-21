; ModuleID = 'inline.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @cmp(i8* %a, i8* %b) #0 {
  %1 = bitcast i8* %a to i64*
  %2 = load i64* %1, align 8
  %3 = bitcast i8* %b to i64*
  %4 = load i64* %3, align 8
  %5 = sub nsw i64 %2, %4
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @isord(i64* %v, i64 %n, i32 (i8*, i8*)* %c) #0 {
  br label %1

; <label>:1                                       ; preds = %13, %0
  %i.0 = phi i64 [ 1, %0 ], [ %14, %13 ]
  %2 = icmp slt i64 %i.0, %n
  br i1 %2, label %3, label %15

; <label>:3                                       ; preds = %1
  %4 = getelementptr inbounds i64* %v, i64 %i.0
  %5 = getelementptr inbounds i64* %4, i64 -1
  %6 = bitcast i64* %5 to i8*
  %7 = getelementptr inbounds i64* %v, i64 %i.0
  %8 = bitcast i64* %7 to i8*
  %9 = call i32 %c(i8* %6, i8* %8)
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %3
  br label %16

; <label>:12                                      ; preds = %3
  br label %13

; <label>:13                                      ; preds = %12
  %14 = add nsw i64 %i.0, 1
  br label %1

; <label>:15                                      ; preds = %1
  br label %16

; <label>:16                                      ; preds = %15, %11
  %.0 = phi i32 [ 0, %11 ], [ 1, %15 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @driver(i32 %n) #0 {
  %1 = sext i32 %n to i64
  %2 = mul i64 %1, 8
  %3 = call noalias i8* @malloc(i64 %2) #2
  %4 = bitcast i8* %3 to i64*
  br label %5

; <label>:5                                       ; preds = %11, %0
  %i.0 = phi i32 [ 0, %0 ], [ %12, %11 ]
  %6 = icmp slt i32 %i.0, %n
  br i1 %6, label %7, label %13

; <label>:7                                       ; preds = %5
  %8 = sext i32 %i.0 to i64
  %9 = sext i32 %i.0 to i64
  %10 = getelementptr inbounds i64* %4, i64 %9
  store i64 %8, i64* %10, align 8
  br label %11

; <label>:11                                      ; preds = %7
  %12 = add nsw i32 %i.0, 1
  br label %5

; <label>:13                                      ; preds = %5
  %14 = sext i32 %n to i64
  %15 = call i32 @isord(i64* %4, i64 %14, i32 (i8*, i8*)* @cmp)
  %16 = bitcast i64* %4 to i8*
  call void @free(i8* %16) #2
  ret i32 %15
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
