; ModuleID = 'inline.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @longCmp(i8* %a, i8* %b) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %la = alloca i64, align 8
  %lb = alloca i64, align 8
  store i8* %a, i8** %1, align 8
  store i8* %b, i8** %2, align 8
  %3 = load i8** %1, align 8
  %4 = ptrtoint i8* %3 to i64
  store i64 %4, i64* %la, align 8
  %5 = load i8** %2, align 8
  %6 = ptrtoint i8* %5 to i64
  store i64 %6, i64* %lb, align 8
  %7 = load i64* %la, align 8
  %8 = load i64* %lb, align 8
  %9 = sub nsw i64 %7, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @isord(i64* %v, i64 %n, i32 (i8*, i8*)* %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32 (i8*, i8*)*, align 8
  %i = alloca i64, align 8
  store i64* %v, i64** %2, align 8
  store i64 %n, i64* %3, align 8
  store i32 (i8*, i8*)* %c, i32 (i8*, i8*)** %4, align 8
  store i64 1, i64* %i, align 8
  br label %5

; <label>:5                                       ; preds = %24, %0
  %6 = load i64* %i, align 8
  %7 = load i64* %3, align 8
  %8 = icmp slt i64 %6, %7
  br i1 %8, label %9, label %27

; <label>:9                                       ; preds = %5
  %10 = load i32 (i8*, i8*)** %4, align 8
  %11 = load i64** %2, align 8
  %12 = load i64* %i, align 8
  %13 = getelementptr inbounds i64* %11, i64 %12
  %14 = getelementptr inbounds i64* %13, i64 -1
  %15 = bitcast i64* %14 to i8*
  %16 = load i64** %2, align 8
  %17 = load i64* %i, align 8
  %18 = getelementptr inbounds i64* %16, i64 %17
  %19 = bitcast i64* %18 to i8*
  %20 = call i32 %10(i8* %15, i8* %19)
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %9
  store i32 0, i32* %1
  br label %28

; <label>:23                                      ; preds = %9
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i64* %i, align 8
  %26 = add nsw i64 %25, 1
  store i64 %26, i64* %i, align 8
  br label %5

; <label>:27                                      ; preds = %5
  store i32 1, i32* %1
  br label %28

; <label>:28                                      ; preds = %27, %22
  %29 = load i32* %1
  ret i32 %29
}

; Function Attrs: nounwind uwtable
define i32 @driver(i32 %n) #0 {
  %1 = alloca i32, align 4
  %v = alloca i64*, align 8
  %i = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = mul i64 %3, 8
  %5 = call noalias i8* @malloc(i64 %4) #2
  %6 = bitcast i8* %5 to i64*
  store i64* %6, i64** %v, align 8
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %18, %0
  %8 = load i32* %i, align 4
  %9 = load i32* %1, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %21

; <label>:11                                      ; preds = %7
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = load i64** %v, align 8
  %17 = getelementptr inbounds i64* %16, i64 %15
  store i64 %13, i64* %17, align 8
  br label %18

; <label>:18                                      ; preds = %11
  %19 = load i32* %i, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %7

; <label>:21                                      ; preds = %7
  %22 = load i64** %v, align 8
  %23 = load i32* %1, align 4
  %24 = sext i32 %23 to i64
  %25 = call i32 @isord(i64* %22, i64 %24, i32 (i8*, i8*)* @longCmp)
  store i32 %25, i32* %res, align 4
  %26 = load i64** %v, align 8
  %27 = bitcast i64* %26 to i8*
  call void @free(i8* %27) #2
  %28 = load i32* %res, align 4
  ret i32 %28
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
