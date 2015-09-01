; ModuleID = 'code.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@t = common global [16 x i32] zeroinitializer, align 16
@s = common global [16 x i32] zeroinitializer, align 16
@max_n = common global i32 0, align 4
@odd = common global i32 0, align 4
@maxflips = common global i32 0, align 4
@checksum = common global i32 0, align 4
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [29 x i8] c"range: must be 3 <= n <= 12\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"%d\0APfannkuchen(%d) = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @flip() #0 {
  %i = alloca i32, align 4
  %x = alloca i32*, align 8
  %y = alloca i32*, align 8
  %c = alloca i32, align 4
  store i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), i32** %x, align 8
  store i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i32 0), i32** %y, align 8
  %1 = load i32* @max_n, align 4
  store i32 %1, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %i, align 4
  %4 = add nsw i32 %3, -1
  store i32 %4, i32* %i, align 4
  %5 = icmp ne i32 %3, 0
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %2
  %7 = load i32** %y, align 8
  %8 = getelementptr inbounds i32* %7, i32 1
  store i32* %8, i32** %y, align 8
  %9 = load i32* %7, align 4
  %10 = load i32** %x, align 8
  %11 = getelementptr inbounds i32* %10, i32 1
  store i32* %11, i32** %x, align 8
  store i32 %9, i32* %10, align 4
  br label %2

; <label>:12                                      ; preds = %2
  store i32 1, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %34, %12
  store i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), i32** %x, align 8
  %14 = load i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i64 0), align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), i64 %15
  store i32* %16, i32** %y, align 8
  br label %17

; <label>:17                                      ; preds = %21, %13
  %18 = load i32** %x, align 8
  %19 = load i32** %y, align 8
  %20 = icmp ult i32* %18, %19
  br i1 %20, label %21, label %31

; <label>:21                                      ; preds = %17
  %22 = load i32** %x, align 8
  %23 = load i32* %22, align 4
  store i32 %23, i32* %c, align 4
  %24 = load i32** %y, align 8
  %25 = load i32* %24, align 4
  %26 = load i32** %x, align 8
  %27 = getelementptr inbounds i32* %26, i32 1
  store i32* %27, i32** %x, align 8
  store i32 %25, i32* %26, align 4
  %28 = load i32* %c, align 4
  %29 = load i32** %y, align 8
  %30 = getelementptr inbounds i32* %29, i32 -1
  store i32* %30, i32** %y, align 8
  store i32 %28, i32* %29, align 4
  br label %17

; <label>:31                                      ; preds = %17
  %32 = load i32* %i, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %i, align 4
  br label %34

; <label>:34                                      ; preds = %31
  %35 = load i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i64 0), align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [16 x i32]* @t, i32 0, i64 %36
  %38 = load i32* %37, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %13, label %40

; <label>:40                                      ; preds = %34
  %41 = load i32* %i, align 4
  ret i32 %41
}

; Function Attrs: nounwind uwtable
define void @rotate(i32 %n) #0 {
  %1 = alloca i32, align 4
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i64 0), align 4
  store i32 %2, i32* %c, align 4
  store i32 1, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %16, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %1, align 4
  %6 = icmp sle i32 %4, %5
  br i1 %6, label %7, label %19

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %9
  %11 = load i32* %10, align 4
  %12 = load i32* %i, align 4
  %13 = sub nsw i32 %12, 1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %14
  store i32 %11, i32* %15, align 4
  br label %16

; <label>:16                                      ; preds = %7
  %17 = load i32* %i, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %i, align 4
  br label %3

; <label>:19                                      ; preds = %3
  %20 = load i32* %c, align 4
  %21 = load i32* %1, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %22
  store i32 %20, i32* %23, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @tk(i32 %n) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %f = alloca i32, align 4
  %c = alloca [16 x i32], align 16
  store i32 %n, i32* %1, align 4
  store i32 0, i32* %i, align 4
  %2 = bitcast [16 x i32]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 64, i32 16, i1 false)
  br label %3

; <label>:3                                       ; preds = %58, %15, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %1, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %59

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  call void @rotate(i32 %8)
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %10
  %12 = load i32* %11, align 4
  %13 = load i32* %i, align 4
  %14 = icmp sge i32 %12, %13
  br i1 %14, label %15, label %20

; <label>:15                                      ; preds = %7
  %16 = load i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  %18 = sext i32 %16 to i64
  %19 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %18
  store i32 0, i32* %19, align 4
  br label %3

; <label>:20                                      ; preds = %7
  %21 = load i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %22
  %24 = load i32* %23, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %23, align 4
  store i32 1, i32* %i, align 4
  %26 = load i32* @odd, align 4
  %27 = xor i32 %26, -1
  store i32 %27, i32* @odd, align 4
  %28 = load i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i32 0), align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %58

; <label>:30                                      ; preds = %20
  %31 = load i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i64 0), align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %32
  %34 = load i32* %33, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %38

; <label>:36                                      ; preds = %30
  %37 = call i32 @flip()
  br label %39

; <label>:38                                      ; preds = %30
  br label %39

; <label>:39                                      ; preds = %38, %36
  %40 = phi i32 [ %37, %36 ], [ 1, %38 ]
  store i32 %40, i32* %f, align 4
  %41 = load i32* %f, align 4
  %42 = load i32* @maxflips, align 4
  %43 = icmp sgt i32 %41, %42
  br i1 %43, label %44, label %46

; <label>:44                                      ; preds = %39
  %45 = load i32* %f, align 4
  store i32 %45, i32* @maxflips, align 4
  br label %46

; <label>:46                                      ; preds = %44, %39
  %47 = load i32* @odd, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %52

; <label>:49                                      ; preds = %46
  %50 = load i32* %f, align 4
  %51 = sub nsw i32 0, %50
  br label %54

; <label>:52                                      ; preds = %46
  %53 = load i32* %f, align 4
  br label %54

; <label>:54                                      ; preds = %52, %49
  %55 = phi i32 [ %51, %49 ], [ %53, %52 ]
  %56 = load i32* @checksum, align 4
  %57 = add nsw i32 %56, %55
  store i32 %57, i32* @checksum, align 4
  br label %58

; <label>:58                                      ; preds = %54, %20
  br label %3

; <label>:59                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %inputN, i32* %1, align 4
  %2 = load i32* %1, align 4
  store i32 %2, i32* @max_n, align 4
  %3 = load i32* @max_n, align 4
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* @max_n, align 4
  %7 = icmp sgt i32 %6, 15
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %5, %0
  %9 = load %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([29 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #4
  unreachable

; <label>:11                                      ; preds = %5
  store i32 0, i32* @maxflips, align 4
  store i32 0, i32* @odd, align 4
  store i32 0, i32* @checksum, align 4
  call void @llvm.memset.p0i8.i64(i8* bitcast ([16 x i32]* @t to i8*), i8 0, i64 64, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %21, %11
  %13 = load i32* %i, align 4
  %14 = load i32* @max_n, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %24

; <label>:16                                      ; preds = %12
  %17 = load i32* %i, align 4
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %19
  store i32 %17, i32* %20, align 4
  br label %21

; <label>:21                                      ; preds = %16
  %22 = load i32* %i, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %i, align 4
  br label %12

; <label>:24                                      ; preds = %12
  %25 = load i32* @max_n, align 4
  call void @tk(i32 %25)
  %26 = load i32* @checksum, align 4
  %27 = load i32* @max_n, align 4
  %28 = load i32* @maxflips, align 4
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %26, i32 %27, i32 %28)
  ret i32 0
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
