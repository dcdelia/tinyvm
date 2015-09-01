; ModuleID = 'code.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tn = type { %struct.tn*, %struct.tn*, i64 }

@.str = private unnamed_addr constant [38 x i8] c"stretch tree of depth %u\09 check: %li\0A\00", align 1
@.str1 = private unnamed_addr constant [36 x i8] c"%li\09 trees of depth %u\09 check: %li\0A\00", align 1
@.str2 = private unnamed_addr constant [41 x i8] c"long lived tree of depth %u\09 check: %li\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.tn* @NewTreeNode(%struct.tn* %left, %struct.tn* %right, i64 %item) #0 {
  %1 = alloca %struct.tn*, align 8
  %2 = alloca %struct.tn*, align 8
  %3 = alloca i64, align 8
  %new = alloca %struct.tn*, align 8
  store %struct.tn* %left, %struct.tn** %1, align 8
  store %struct.tn* %right, %struct.tn** %2, align 8
  store i64 %item, i64* %3, align 8
  %4 = call noalias i8* @malloc(i64 24) #3
  %5 = bitcast i8* %4 to %struct.tn*
  store %struct.tn* %5, %struct.tn** %new, align 8
  %6 = load %struct.tn** %1, align 8
  %7 = load %struct.tn** %new, align 8
  %8 = getelementptr inbounds %struct.tn* %7, i32 0, i32 0
  store %struct.tn* %6, %struct.tn** %8, align 8
  %9 = load %struct.tn** %2, align 8
  %10 = load %struct.tn** %new, align 8
  %11 = getelementptr inbounds %struct.tn* %10, i32 0, i32 1
  store %struct.tn* %9, %struct.tn** %11, align 8
  %12 = load i64* %3, align 8
  %13 = load %struct.tn** %new, align 8
  %14 = getelementptr inbounds %struct.tn* %13, i32 0, i32 2
  store i64 %12, i64* %14, align 8
  %15 = load %struct.tn** %new, align 8
  ret %struct.tn* %15
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i64 @ItemCheck(%struct.tn* %tree) #0 {
  %1 = alloca i64, align 8
  %2 = alloca %struct.tn*, align 8
  store %struct.tn* %tree, %struct.tn** %2, align 8
  %3 = load %struct.tn** %2, align 8
  %4 = getelementptr inbounds %struct.tn* %3, i32 0, i32 0
  %5 = load %struct.tn** %4, align 8
  %6 = icmp eq %struct.tn* %5, null
  br i1 %6, label %7, label %11

; <label>:7                                       ; preds = %0
  %8 = load %struct.tn** %2, align 8
  %9 = getelementptr inbounds %struct.tn* %8, i32 0, i32 2
  %10 = load i64* %9, align 8
  store i64 %10, i64* %1
  br label %25

; <label>:11                                      ; preds = %0
  %12 = load %struct.tn** %2, align 8
  %13 = getelementptr inbounds %struct.tn* %12, i32 0, i32 2
  %14 = load i64* %13, align 8
  %15 = load %struct.tn** %2, align 8
  %16 = getelementptr inbounds %struct.tn* %15, i32 0, i32 0
  %17 = load %struct.tn** %16, align 8
  %18 = call i64 @ItemCheck(%struct.tn* %17)
  %19 = add nsw i64 %14, %18
  %20 = load %struct.tn** %2, align 8
  %21 = getelementptr inbounds %struct.tn* %20, i32 0, i32 1
  %22 = load %struct.tn** %21, align 8
  %23 = call i64 @ItemCheck(%struct.tn* %22)
  %24 = sub nsw i64 %19, %23
  store i64 %24, i64* %1
  br label %25

; <label>:25                                      ; preds = %11, %7
  %26 = load i64* %1
  ret i64 %26
}

; Function Attrs: nounwind uwtable
define %struct.tn* @BottomUpTree(i64 %item, i32 %depth) #0 {
  %1 = alloca %struct.tn*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %item, i64* %2, align 8
  store i32 %depth, i32* %3, align 4
  %4 = load i32* %3, align 4
  %5 = icmp ugt i32 %4, 0
  br i1 %5, label %6, label %20

; <label>:6                                       ; preds = %0
  %7 = load i64* %2, align 8
  %8 = mul nsw i64 2, %7
  %9 = sub nsw i64 %8, 1
  %10 = load i32* %3, align 4
  %11 = sub i32 %10, 1
  %12 = call %struct.tn* @BottomUpTree(i64 %9, i32 %11)
  %13 = load i64* %2, align 8
  %14 = mul nsw i64 2, %13
  %15 = load i32* %3, align 4
  %16 = sub i32 %15, 1
  %17 = call %struct.tn* @BottomUpTree(i64 %14, i32 %16)
  %18 = load i64* %2, align 8
  %19 = call %struct.tn* @NewTreeNode(%struct.tn* %12, %struct.tn* %17, i64 %18)
  store %struct.tn* %19, %struct.tn** %1
  br label %23

; <label>:20                                      ; preds = %0
  %21 = load i64* %2, align 8
  %22 = call %struct.tn* @NewTreeNode(%struct.tn* null, %struct.tn* null, i64 %21)
  store %struct.tn* %22, %struct.tn** %1
  br label %23

; <label>:23                                      ; preds = %20, %6
  %24 = load %struct.tn** %1
  ret %struct.tn* %24
}

; Function Attrs: nounwind uwtable
define void @DeleteTree(%struct.tn* %tree) #0 {
  %1 = alloca %struct.tn*, align 8
  store %struct.tn* %tree, %struct.tn** %1, align 8
  %2 = load %struct.tn** %1, align 8
  %3 = getelementptr inbounds %struct.tn* %2, i32 0, i32 0
  %4 = load %struct.tn** %3, align 8
  %5 = icmp ne %struct.tn* %4, null
  br i1 %5, label %6, label %13

; <label>:6                                       ; preds = %0
  %7 = load %struct.tn** %1, align 8
  %8 = getelementptr inbounds %struct.tn* %7, i32 0, i32 0
  %9 = load %struct.tn** %8, align 8
  call void @DeleteTree(%struct.tn* %9)
  %10 = load %struct.tn** %1, align 8
  %11 = getelementptr inbounds %struct.tn* %10, i32 0, i32 1
  %12 = load %struct.tn** %11, align 8
  call void @DeleteTree(%struct.tn* %12)
  br label %13

; <label>:13                                      ; preds = %6, %0
  %14 = load %struct.tn** %1, align 8
  %15 = bitcast %struct.tn* %14 to i8*
  call void @free(i8* %15) #3
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %N = alloca i32, align 4
  %depth = alloca i32, align 4
  %minDepth = alloca i32, align 4
  %maxDepth = alloca i32, align 4
  %stretchDepth = alloca i32, align 4
  %stretchTree = alloca %struct.tn*, align 8
  %longLivedTree = alloca %struct.tn*, align 8
  %tempTree = alloca %struct.tn*, align 8
  %i = alloca i64, align 8
  %iterations = alloca i64, align 8
  %check = alloca i64, align 8
  store i32 %inputN, i32* %1, align 4
  %2 = load i32* %1, align 4
  store i32 %2, i32* %N, align 4
  store i32 4, i32* %minDepth, align 4
  %3 = load i32* %minDepth, align 4
  %4 = add i32 %3, 2
  %5 = load i32* %N, align 4
  %6 = icmp ugt i32 %4, %5
  br i1 %6, label %7, label %10

; <label>:7                                       ; preds = %0
  %8 = load i32* %minDepth, align 4
  %9 = add i32 %8, 2
  store i32 %9, i32* %maxDepth, align 4
  br label %12

; <label>:10                                      ; preds = %0
  %11 = load i32* %N, align 4
  store i32 %11, i32* %maxDepth, align 4
  br label %12

; <label>:12                                      ; preds = %10, %7
  %13 = load i32* %maxDepth, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %stretchDepth, align 4
  %15 = load i32* %stretchDepth, align 4
  %16 = call %struct.tn* @BottomUpTree(i64 0, i32 %15)
  store %struct.tn* %16, %struct.tn** %stretchTree, align 8
  %17 = load i32* %stretchDepth, align 4
  %18 = load %struct.tn** %stretchTree, align 8
  %19 = call i64 @ItemCheck(%struct.tn* %18)
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str, i32 0, i32 0), i32 %17, i64 %19)
  %21 = load %struct.tn** %stretchTree, align 8
  call void @DeleteTree(%struct.tn* %21)
  %22 = load i32* %maxDepth, align 4
  %23 = call %struct.tn* @BottomUpTree(i64 0, i32 %22)
  store %struct.tn* %23, %struct.tn** %longLivedTree, align 8
  %24 = load i32* %minDepth, align 4
  store i32 %24, i32* %depth, align 4
  br label %25

; <label>:25                                      ; preds = %69, %12
  %26 = load i32* %depth, align 4
  %27 = load i32* %maxDepth, align 4
  %28 = icmp ule i32 %26, %27
  br i1 %28, label %29, label %72

; <label>:29                                      ; preds = %25
  %30 = load i32* %maxDepth, align 4
  %31 = load i32* %depth, align 4
  %32 = sub i32 %30, %31
  %33 = load i32* %minDepth, align 4
  %34 = add i32 %32, %33
  %35 = uitofp i32 %34 to double
  %36 = call double @pow(double 2.000000e+00, double %35) #3
  %37 = fptosi double %36 to i64
  store i64 %37, i64* %iterations, align 8
  store i64 0, i64* %check, align 8
  store i64 1, i64* %i, align 8
  br label %38

; <label>:38                                      ; preds = %60, %29
  %39 = load i64* %i, align 8
  %40 = load i64* %iterations, align 8
  %41 = icmp sle i64 %39, %40
  br i1 %41, label %42, label %63

; <label>:42                                      ; preds = %38
  %43 = load i64* %i, align 8
  %44 = load i32* %depth, align 4
  %45 = call %struct.tn* @BottomUpTree(i64 %43, i32 %44)
  store %struct.tn* %45, %struct.tn** %tempTree, align 8
  %46 = load %struct.tn** %tempTree, align 8
  %47 = call i64 @ItemCheck(%struct.tn* %46)
  %48 = load i64* %check, align 8
  %49 = add nsw i64 %48, %47
  store i64 %49, i64* %check, align 8
  %50 = load %struct.tn** %tempTree, align 8
  call void @DeleteTree(%struct.tn* %50)
  %51 = load i64* %i, align 8
  %52 = sub nsw i64 0, %51
  %53 = load i32* %depth, align 4
  %54 = call %struct.tn* @BottomUpTree(i64 %52, i32 %53)
  store %struct.tn* %54, %struct.tn** %tempTree, align 8
  %55 = load %struct.tn** %tempTree, align 8
  %56 = call i64 @ItemCheck(%struct.tn* %55)
  %57 = load i64* %check, align 8
  %58 = add nsw i64 %57, %56
  store i64 %58, i64* %check, align 8
  %59 = load %struct.tn** %tempTree, align 8
  call void @DeleteTree(%struct.tn* %59)
  br label %60

; <label>:60                                      ; preds = %42
  %61 = load i64* %i, align 8
  %62 = add nsw i64 %61, 1
  store i64 %62, i64* %i, align 8
  br label %38

; <label>:63                                      ; preds = %38
  %64 = load i64* %iterations, align 8
  %65 = mul nsw i64 %64, 2
  %66 = load i32* %depth, align 4
  %67 = load i64* %check, align 8
  %68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str1, i32 0, i32 0), i64 %65, i32 %66, i64 %67)
  br label %69

; <label>:69                                      ; preds = %63
  %70 = load i32* %depth, align 4
  %71 = add i32 %70, 2
  store i32 %71, i32* %depth, align 4
  br label %25

; <label>:72                                      ; preds = %25
  %73 = load i32* %maxDepth, align 4
  %74 = load %struct.tn** %longLivedTree, align 8
  %75 = call i64 @ItemCheck(%struct.tn* %74)
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str2, i32 0, i32 0), i32 %73, i64 %75)
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
