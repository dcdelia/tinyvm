; ModuleID = '../IR/code.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tn = type { %struct.tn*, %struct.tn*, i64 }

@.str = private unnamed_addr constant [38 x i8] c"stretch tree of depth %u\09 check: %li\0A\00", align 1
@.str1 = private unnamed_addr constant [36 x i8] c"%li\09 trees of depth %u\09 check: %li\0A\00", align 1
@.str2 = private unnamed_addr constant [41 x i8] c"long lived tree of depth %u\09 check: %li\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.tn* @NewTreeNode(%struct.tn* %left, %struct.tn* %right, i64 %item) #0 {
  %1 = call noalias i8* @malloc(i64 24) #3
  %2 = bitcast i8* %1 to %struct.tn*
  %3 = getelementptr inbounds %struct.tn* %2, i32 0, i32 0
  store %struct.tn* %left, %struct.tn** %3, align 8
  %4 = getelementptr inbounds %struct.tn* %2, i32 0, i32 1
  store %struct.tn* %right, %struct.tn** %4, align 8
  %5 = getelementptr inbounds %struct.tn* %2, i32 0, i32 2
  store i64 %item, i64* %5, align 8
  ret %struct.tn* %2
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i64 @ItemCheck(%struct.tn* %tree) #0 {
  %1 = getelementptr inbounds %struct.tn* %tree, i32 0, i32 0
  %2 = load %struct.tn** %1, align 8
  %3 = icmp eq %struct.tn* %2, null
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.tn* %tree, i32 0, i32 2
  %6 = load i64* %5, align 8
  br label %18

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.tn* %tree, i32 0, i32 2
  %9 = load i64* %8, align 8
  %10 = getelementptr inbounds %struct.tn* %tree, i32 0, i32 0
  %11 = load %struct.tn** %10, align 8
  %12 = call i64 @ItemCheck(%struct.tn* %11)
  %13 = add nsw i64 %9, %12
  %14 = getelementptr inbounds %struct.tn* %tree, i32 0, i32 1
  %15 = load %struct.tn** %14, align 8
  %16 = call i64 @ItemCheck(%struct.tn* %15)
  %17 = sub nsw i64 %13, %16
  br label %18

; <label>:18                                      ; preds = %7, %4
  %.0 = phi i64 [ %6, %4 ], [ %17, %7 ]
  ret i64 %.0
}

; Function Attrs: nounwind uwtable
define %struct.tn* @BottomUpTree(i64 %item, i32 %depth) #0 {
  %1 = icmp ugt i32 %depth, 0
  br i1 %1, label %2, label %11

; <label>:2                                       ; preds = %0
  %3 = mul nsw i64 2, %item
  %4 = sub nsw i64 %3, 1
  %5 = sub i32 %depth, 1
  %6 = call %struct.tn* @BottomUpTree(i64 %4, i32 %5)
  %7 = mul nsw i64 2, %item
  %8 = sub i32 %depth, 1
  %9 = call %struct.tn* @BottomUpTree(i64 %7, i32 %8)
  %10 = call %struct.tn* @NewTreeNode(%struct.tn* %6, %struct.tn* %9, i64 %item)
  br label %13

; <label>:11                                      ; preds = %0
  %12 = call %struct.tn* @NewTreeNode(%struct.tn* null, %struct.tn* null, i64 %item)
  br label %13

; <label>:13                                      ; preds = %11, %2
  %.0 = phi %struct.tn* [ %10, %2 ], [ %12, %11 ]
  ret %struct.tn* %.0
}

; Function Attrs: nounwind uwtable
define void @DeleteTree(%struct.tn* %tree) #0 {
  %1 = getelementptr inbounds %struct.tn* %tree, i32 0, i32 0
  %2 = load %struct.tn** %1, align 8
  %3 = icmp ne %struct.tn* %2, null
  br i1 %3, label %4, label %9

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.tn* %tree, i32 0, i32 0
  %6 = load %struct.tn** %5, align 8
  call void @DeleteTree(%struct.tn* %6)
  %7 = getelementptr inbounds %struct.tn* %tree, i32 0, i32 1
  %8 = load %struct.tn** %7, align 8
  call void @DeleteTree(%struct.tn* %8)
  br label %9

; <label>:9                                       ; preds = %4, %0
  %10 = bitcast %struct.tn* %tree to i8*
  call void @free(i8* %10) #3
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = add i32 4, 2
  %2 = icmp ugt i32 %1, %inputN
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = add i32 4, 2
  br label %6

; <label>:5                                       ; preds = %0
  br label %6

; <label>:6                                       ; preds = %5, %3
  %maxDepth.0 = phi i32 [ %4, %3 ], [ %inputN, %5 ]
  %7 = add i32 %maxDepth.0, 1
  %8 = call %struct.tn* @BottomUpTree(i64 0, i32 %7)
  %9 = call i64 @ItemCheck(%struct.tn* %8)
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str, i32 0, i32 0), i32 %7, i64 %9)
  call void @DeleteTree(%struct.tn* %8)
  %11 = call %struct.tn* @BottomUpTree(i64 0, i32 %maxDepth.0)
  br label %12

; <label>:12                                      ; preds = %35, %6
  %depth.0 = phi i32 [ 4, %6 ], [ %36, %35 ]
  %13 = icmp ule i32 %depth.0, %maxDepth.0
  br i1 %13, label %14, label %37

; <label>:14                                      ; preds = %12
  %15 = sub i32 %maxDepth.0, %depth.0
  %16 = add i32 %15, 4
  %17 = uitofp i32 %16 to double
  %18 = call double @pow(double 2.000000e+00, double %17) #3
  %19 = fptosi double %18 to i64
  br label %20

; <label>:20                                      ; preds = %30, %14
  %i.0 = phi i64 [ 1, %14 ], [ %31, %30 ]
  %check.0 = phi i64 [ 0, %14 ], [ %29, %30 ]
  %21 = icmp sle i64 %i.0, %19
  br i1 %21, label %22, label %32

; <label>:22                                      ; preds = %20
  %23 = call %struct.tn* @BottomUpTree(i64 %i.0, i32 %depth.0)
  %24 = call i64 @ItemCheck(%struct.tn* %23)
  %25 = add nsw i64 %check.0, %24
  call void @DeleteTree(%struct.tn* %23)
  %26 = sub nsw i64 0, %i.0
  %27 = call %struct.tn* @BottomUpTree(i64 %26, i32 %depth.0)
  %28 = call i64 @ItemCheck(%struct.tn* %27)
  %29 = add nsw i64 %25, %28
  call void @DeleteTree(%struct.tn* %27)
  br label %30

; <label>:30                                      ; preds = %22
  %31 = add nsw i64 %i.0, 1
  br label %20

; <label>:32                                      ; preds = %20
  %33 = mul nsw i64 %19, 2
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str1, i32 0, i32 0), i64 %33, i32 %depth.0, i64 %check.0)
  br label %35

; <label>:35                                      ; preds = %32
  %36 = add i32 %depth.0, 2
  br label %12

; <label>:37                                      ; preds = %12
  %38 = call i64 @ItemCheck(%struct.tn* %11)
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str2, i32 0, i32 0), i32 %maxDepth.0, i64 %38)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare double @pow(double, double) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
