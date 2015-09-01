; ModuleID = 'code.ll'
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
  %1 = load i32* @max_n, align 4
  br label %2

; <label>:2                                       ; preds = %5, %0
  %y.0 = phi i32* [ getelementptr inbounds ([16 x i32]* @s, i32 0, i32 0), %0 ], [ %6, %5 ]
  %x.0 = phi i32* [ getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), %0 ], [ %8, %5 ]
  %i.0 = phi i32 [ %1, %0 ], [ %3, %5 ]
  %3 = add nsw i32 %i.0, -1
  %4 = icmp ne i32 %i.0, 0
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %2
  %6 = getelementptr inbounds i32* %y.0, i32 1
  %7 = load i32* %y.0, align 4
  %8 = getelementptr inbounds i32* %x.0, i32 1
  store i32 %7, i32* %x.0, align 4
  br label %2

; <label>:9                                       ; preds = %2
  br label %10

; <label>:10                                      ; preds = %23, %9
  %i.1 = phi i32 [ 1, %9 ], [ %22, %23 ]
  %11 = load i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i64 0), align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), i64 %12
  br label %14

; <label>:14                                      ; preds = %16, %10
  %y.1 = phi i32* [ %13, %10 ], [ %20, %16 ]
  %x.1 = phi i32* [ getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), %10 ], [ %19, %16 ]
  %15 = icmp ult i32* %x.1, %y.1
  br i1 %15, label %16, label %21

; <label>:16                                      ; preds = %14
  %17 = load i32* %x.1, align 4
  %18 = load i32* %y.1, align 4
  %19 = getelementptr inbounds i32* %x.1, i32 1
  store i32 %18, i32* %x.1, align 4
  %20 = getelementptr inbounds i32* %y.1, i32 -1
  store i32 %17, i32* %y.1, align 4
  br label %14

; <label>:21                                      ; preds = %14
  %22 = add nsw i32 %i.1, 1
  br label %23

; <label>:23                                      ; preds = %21
  %24 = load i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i64 0), align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [16 x i32]* @t, i32 0, i64 %25
  %27 = load i32* %26, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %10, label %29

; <label>:29                                      ; preds = %23
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define void @rotate(i32 %n) #0 {
  %1 = load i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i64 0), align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %i.0 = phi i32 [ 1, %0 ], [ %12, %11 ]
  %3 = icmp sle i32 %i.0, %n
  br i1 %3, label %4, label %13

; <label>:4                                       ; preds = %2
  %5 = sext i32 %i.0 to i64
  %6 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %5
  %7 = load i32* %6, align 4
  %8 = sub nsw i32 %i.0, 1
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %9
  store i32 %7, i32* %10, align 4
  br label %11

; <label>:11                                      ; preds = %4
  %12 = add nsw i32 %i.0, 1
  br label %2

; <label>:13                                      ; preds = %2
  %14 = sext i32 %n to i64
  %15 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %14
  store i32 %1, i32* %15, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @tk(i32 %n) #0 {
entry:
  %c = alloca [16 x i32], align 16
  %v1 = bitcast [16 x i32]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* %v1, i8 0, i64 64, i32 16, i1 false)
  br label %B2

B2:                                       ; preds = %B46, %B9, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %v10, %B9 ], [ 1, %B46 ]
  %v3 = icmp slt i32 %i.0, %n
  br i1 %v3, label %B4, label %B47

B4:                                       ; preds = %B2
  call void @rotate(i32 %i.0)
  %v5 = sext i32 %i.0 to i64
  %v6 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %v5
  %v7 = load i32* %v6, align 4
  %v8 = icmp sge i32 %v7, %i.0
  br i1 %v8, label %B9, label %B13

B9:                                       ; preds = %B4
  %v10 = add nsw i32 %i.0, 1
  %v11 = sext i32 %i.0 to i64
  %v12 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %v11
  store i32 0, i32* %v12, align 4
  br label %B2

B13:                                      ; preds = %B4
  %v14 = sext i32 %i.0 to i64
  %v15 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %v14
  %v16 = load i32* %v15, align 4
  %v17 = add nsw i32 %v16, 1
  store i32 %v17, i32* %v15, align 4
  %v18 = load i32* @odd, align 4
  %v19 = xor i32 %v18, -1
  store i32 %v19, i32* @odd, align 4
  %v20 = load i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i32 0), align 4
  %v21 = icmp ne i32 %v20, 0
  br i1 %v21, label %B22, label %B46

B22:                                      ; preds = %B13
  %v23 = load i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i64 0), align 4
  %v24 = sext i32 %v23 to i64
  %v25 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %v24
  %v26 = load i32* %v25, align 4
  %v27 = icmp ne i32 %v26, 0
  br i1 %v27, label %B28, label %B30

B28:                                      ; preds = %B22
  %v29 = call i32 @flip()
  br label %B31

B30:                                      ; preds = %B22
  br label %B31

B31:                                      ; preds = %B30, %B28
  %v32 = phi i32 [ %v29, %B28 ], [ 1, %B30 ]
  %v33 = load i32* @maxflips, align 4
  %v34 = icmp sgt i32 %v32, %v33
  br i1 %v34, label %B35, label %B36

B35:                                      ; preds = %B31
  store i32 %v32, i32* @maxflips, align 4
  br label %B36

B36:                                      ; preds = %B35, %B31
  %v37 = load i32* @odd, align 4
  %v38 = icmp ne i32 %v37, 0
  br i1 %v38, label %B39, label %B41

B39:                                      ; preds = %B36
  %v40 = sub nsw i32 0, %v32
  br label %B42

B41:                                      ; preds = %B36
  br label %B42

B42:                                      ; preds = %B41, %B39
  %v43 = phi i32 [ %v40, %B39 ], [ %v32, %B41 ]
  %v44 = load i32* @checksum, align 4
  %v45 = add nsw i32 %v44, %v43
  store i32 %v45, i32* @checksum, align 4
  br label %B46

B46:                                      ; preds = %B42, %B13
  br label %B2

B47:                                      ; preds = %B2
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  store i32 %inputN, i32* @max_n, align 4
  %1 = load i32* @max_n, align 4
  %2 = icmp slt i32 %1, 3
  br i1 %2, label %6, label %3

; <label>:3                                       ; preds = %0
  %4 = load i32* @max_n, align 4
  %5 = icmp sgt i32 %4, 15
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %3, %0
  %7 = load %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([29 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #4
  unreachable

; <label>:9                                       ; preds = %3
  store i32 0, i32* @maxflips, align 4
  store i32 0, i32* @odd, align 4
  store i32 0, i32* @checksum, align 4
  call void @llvm.memset.p0i8.i64(i8* bitcast ([16 x i32]* @t to i8*), i8 0, i64 64, i32 16, i1 false)
  br label %10

; <label>:10                                      ; preds = %16, %9
  %i.0 = phi i32 [ 0, %9 ], [ %17, %16 ]
  %11 = load i32* @max_n, align 4
  %12 = icmp slt i32 %i.0, %11
  br i1 %12, label %13, label %18

; <label>:13                                      ; preds = %10
  %14 = sext i32 %i.0 to i64
  %15 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %14
  store i32 %i.0, i32* %15, align 4
  br label %16

; <label>:16                                      ; preds = %13
  %17 = add nsw i32 %i.0, 1
  br label %10

; <label>:18                                      ; preds = %10
  %19 = load i32* @max_n, align 4
  call void @tk(i32 %19)
  %20 = load i32* @checksum, align 4
  %21 = load i32* @max_n, align 4
  %22 = load i32* @maxflips, align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %20, i32 %21, i32 %22)
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
