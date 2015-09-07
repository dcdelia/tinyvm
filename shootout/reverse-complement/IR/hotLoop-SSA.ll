; ModuleID = 'hotLoop.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [22 x i8] c"\0A*** Error: %s [%d]!\0A\00", align 1
@.str1 = private unnamed_addr constant [14 x i8] c"Out of memory\00", align 1
@.str2 = private unnamed_addr constant [46 x i8] c"shootout/reverse-complement/revcomp-input.txt\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"r+\00", align 1
@.str4 = private unnamed_addr constant [19 x i8] c"revcomp-output.txt\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@bench.xtab = private unnamed_addr constant [256 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00TVGH\00\00CD\00\00M\00KN\00\00\00YSA\00BW\00R\00\00\00\00\00\00\00TVGH\00\00CD\00\00M\00KN\00\00\00YSA\00BW\00R\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str6 = private unnamed_addr constant [18 x i8] c"Buffer allocation\00", align 1
@.str7 = private unnamed_addr constant [14 x i8] c"No input data\00", align 1
@.str8 = private unnamed_addr constant [17 x i8] c"1st char not '>'\00", align 1
@.str9 = private unnamed_addr constant [40 x i8] c"Number of iterations for hot loop: %ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @errex(i8* %s, i32 %n) #0 {
  %1 = load %struct._IO_FILE** @stderr, align 8
  %2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* %s, i32 %n)
  ret i32 1
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @hotLoop(%struct._IO_FILE* %inputFile, i8** %p_pj, i8** %p_pq, i8** %p_pr, i8* %jjj, i8** %p_qqq, i8** %p_pqstop, i8* %xtab) #0 {
  %1 = call i8* @fgets(i8* %jjj, i32 82, %struct._IO_FILE* %inputFile)
  store i8* %1, i8** %p_pj, align 8
  %2 = load i8** %p_pj, align 8
  %3 = icmp ne i8* %2, null
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = load i8* %jjj, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, 62
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %4, %0
  br label %75

; <label>:9                                       ; preds = %4
  %10 = load i8** %p_pr, align 8
  %11 = load i8** %p_pq, align 8
  %12 = getelementptr inbounds i8* %11, i64 61
  %13 = icmp ule i8* %10, %12
  br i1 %13, label %14, label %57

; <label>:14                                      ; preds = %9
  %15 = load i8** %p_pqstop, align 8
  %16 = getelementptr inbounds i8* %15, i64 12777888
  %17 = load i8** %p_qqq, align 8
  %18 = load i8** %p_qqq, align 8
  %19 = ptrtoint i8* %16 to i64
  %20 = ptrtoint i8* %18 to i64
  %21 = sub i64 %19, %20
  %22 = call i8* @realloc(i8* %17, i64 %21) #4
  %23 = icmp ne i8* %22, null
  br i1 %23, label %26, label %24

; <label>:24                                      ; preds = %14
  %25 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 0)
  call void @exit(i32 %25) #5
  unreachable

; <label>:26                                      ; preds = %14
  %27 = load i8** %p_qqq, align 8
  %28 = icmp ne i8* %22, %27
  br i1 %28, label %29, label %43

; <label>:29                                      ; preds = %26
  %30 = load i8** %p_qqq, align 8
  %31 = ptrtoint i8* %22 to i64
  %32 = ptrtoint i8* %30 to i64
  %33 = sub i64 %31, %32
  %34 = load i8** %p_pq, align 8
  %35 = getelementptr inbounds i8* %34, i64 %33
  store i8* %35, i8** %p_pq, align 8
  %36 = load i8** %p_pr, align 8
  %37 = getelementptr inbounds i8* %36, i64 %33
  store i8* %37, i8** %p_pr, align 8
  %38 = load i8** %p_qqq, align 8
  %39 = getelementptr inbounds i8* %38, i64 %33
  store i8* %39, i8** %p_qqq, align 8
  %40 = getelementptr inbounds i8* %16, i64 %33
  %41 = load i8** %p_pqstop, align 8
  %42 = getelementptr inbounds i8* %41, i64 %33
  store i8* %42, i8** %p_pqstop, align 8
  br label %43

; <label>:43                                      ; preds = %29, %26
  %newstop.0 = phi i8* [ %40, %29 ], [ %16, %26 ]
  %44 = load i8** %p_pqstop, align 8
  %45 = load i8** %p_pr, align 8
  %46 = ptrtoint i8* %44 to i64
  %47 = ptrtoint i8* %45 to i64
  %48 = sub i64 %46, %47
  %49 = sub i64 0, %48
  %50 = getelementptr inbounds i8* %newstop.0, i64 %49
  %51 = load i8** %p_pr, align 8
  %52 = load i8** %p_pqstop, align 8
  %53 = load i8** %p_pr, align 8
  %54 = ptrtoint i8* %52 to i64
  %55 = ptrtoint i8* %53 to i64
  %56 = sub i64 %54, %55
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %50, i8* %51, i64 %56, i32 1, i1 false)
  store i8* %50, i8** %p_pr, align 8
  store i8* %newstop.0, i8** %p_pqstop, align 8
  br label %57

; <label>:57                                      ; preds = %43, %9
  br label %58

; <label>:58                                      ; preds = %73, %57
  %.01 = phi i8** [ %p_pj, %57 ], [ %63, %73 ]
  %59 = load i8** %.01, align 8
  %60 = load i8* %59, align 1
  %61 = icmp ne i8 %60, 0
  br i1 %61, label %62, label %74

; <label>:62                                      ; preds = %58
  %63 = getelementptr inbounds i8** %.01, i32 1
  %64 = load i8** %.01, align 8
  %65 = load i8* %64, align 1
  %66 = zext i8 %65 to i64
  %67 = getelementptr inbounds i8* %xtab, i64 %66
  %68 = load i8* %67, align 1
  %69 = icmp ne i8 %68, 0
  br i1 %69, label %70, label %73

; <label>:70                                      ; preds = %62
  %71 = load i8** %p_pr, align 8
  %72 = getelementptr inbounds i8* %71, i32 -1
  store i8* %72, i8** %p_pr, align 8
  store i8 %68, i8* %72, align 1
  br label %73

; <label>:73                                      ; preds = %70, %62
  br label %58

; <label>:74                                      ; preds = %58
  br label %75

; <label>:75                                      ; preds = %74, %8
  %.0 = phi i32 [ 1, %8 ], [ 0, %74 ]
  ret i32 %.0
}

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define i32 @bench() #0 {
  %pj = alloca i8*, align 8
  %pq = alloca i8*, align 8
  %pr = alloca i8*, align 8
  %qqq = alloca i8*, align 8
  %pqstop = alloca i8*, align 8
  %xtab = alloca [256 x i8], align 16
  %1 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([46 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0))
  %2 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([19 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0))
  %3 = call noalias i8* @malloc(i64 82) #4
  %4 = call noalias i8* @malloc(i64 5200) #4
  store i8* %4, i8** %qqq, align 8
  %5 = load i8** %qqq, align 8
  %6 = getelementptr inbounds i8* %5, i64 5200
  store i8* %6, i8** %pqstop, align 8
  %7 = bitcast [256 x i8]* %xtab to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* getelementptr inbounds ([256 x i8]* @bench.xtab, i32 0, i32 0), i64 256, i32 16, i1 false)
  %8 = icmp ne i8* %3, null
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %0
  %10 = load i8** %qqq, align 8
  %11 = icmp ne i8* %10, null
  br i1 %11, label %22, label %12

; <label>:12                                      ; preds = %9, %0
  %13 = icmp ne i8* %3, null
  %14 = xor i1 %13, true
  %15 = zext i1 %14 to i32
  %16 = load i8** %qqq, align 8
  %17 = icmp ne i8* %16, null
  %18 = xor i1 %17, true
  %19 = zext i1 %18 to i32
  %20 = add nsw i32 %15, %19
  %21 = call i32 @errex(i8* getelementptr inbounds ([18 x i8]* @.str6, i32 0, i32 0), i32 %20)
  br label %96

; <label>:22                                      ; preds = %9
  %23 = call i8* @fgets(i8* %3, i32 82, %struct._IO_FILE* %1)
  store i8* %23, i8** %pj, align 8
  %24 = load i8** %pj, align 8
  %25 = icmp ne i8* %24, null
  br i1 %25, label %28, label %26

; <label>:26                                      ; preds = %22
  %27 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str7, i32 0, i32 0), i32 0)
  br label %96

; <label>:28                                      ; preds = %22
  %29 = load i8* %3, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp ne i32 %30, 62
  br i1 %31, label %32, label %34

; <label>:32                                      ; preds = %28
  %33 = call i32 @errex(i8* getelementptr inbounds ([17 x i8]* @.str8, i32 0, i32 0), i32 0)
  br label %96

; <label>:34                                      ; preds = %28
  br label %35

; <label>:35                                      ; preds = %83, %34
  %hotLoopCounter.0 = phi i64 [ 0, %34 ], [ %44, %83 ]
  %36 = load i8** %pj, align 8
  %37 = icmp ne i8* %36, null
  br i1 %37, label %38, label %91

; <label>:38                                      ; preds = %35
  %39 = call i32 @fputs(i8* %3, %struct._IO_FILE* %2)
  %40 = load i8** %qqq, align 8
  %41 = getelementptr inbounds i8* %40, i64 1
  store i8* %41, i8** %pq, align 8
  %42 = load i8** %pqstop, align 8
  store i8* %42, i8** %pr, align 8
  br label %43

; <label>:43                                      ; preds = %50, %38
  %hotLoopCounter.1 = phi i64 [ %hotLoopCounter.0, %38 ], [ %44, %50 ]
  %44 = add nsw i64 %hotLoopCounter.1, 1
  %45 = getelementptr inbounds [256 x i8]* %xtab, i32 0, i32 0
  %46 = call i32 @hotLoop(%struct._IO_FILE* %1, i8** %pj, i8** %pq, i8** %pr, i8* %3, i8** %qqq, i8** %pqstop, i8* %45)
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %43
  br label %53

; <label>:49                                      ; preds = %43
  br label %50

; <label>:50                                      ; preds = %49
  %51 = load i8** %pq, align 8
  %52 = getelementptr inbounds i8* %51, i32 1
  store i8* %52, i8** %pq, align 8
  br label %43

; <label>:53                                      ; preds = %48
  %54 = load i8** %qqq, align 8
  store i8* %54, i8** %pq, align 8
  br label %55

; <label>:55                                      ; preds = %73, %53
  %56 = load i8** %pr, align 8
  %57 = load i8** %pqstop, align 8
  %58 = icmp ult i8* %56, %57
  br i1 %58, label %59, label %83

; <label>:59                                      ; preds = %55
  %60 = load i8** %pqstop, align 8
  %61 = load i8** %pr, align 8
  %62 = ptrtoint i8* %60 to i64
  %63 = ptrtoint i8* %61 to i64
  %64 = sub i64 %62, %63
  %65 = icmp slt i64 %64, 60
  br i1 %65, label %66, label %72

; <label>:66                                      ; preds = %59
  %67 = load i8** %pqstop, align 8
  %68 = load i8** %pr, align 8
  %69 = ptrtoint i8* %67 to i64
  %70 = ptrtoint i8* %68 to i64
  %71 = sub i64 %69, %70
  br label %73

; <label>:72                                      ; preds = %59
  br label %73

; <label>:73                                      ; preds = %72, %66
  %74 = phi i64 [ %71, %66 ], [ 60, %72 ]
  %75 = load i8** %pq, align 8
  %76 = load i8** %pr, align 8
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %75, i8* %76, i64 %74, i32 1, i1 false)
  %77 = load i8** %pr, align 8
  %78 = getelementptr inbounds i8* %77, i64 %74
  store i8* %78, i8** %pr, align 8
  %79 = load i8** %pq, align 8
  %80 = getelementptr inbounds i8* %79, i64 %74
  store i8* %80, i8** %pq, align 8
  %81 = load i8** %pq, align 8
  %82 = getelementptr inbounds i8* %81, i32 1
  store i8* %82, i8** %pq, align 8
  store i8 10, i8* %81, align 1
  br label %55

; <label>:83                                      ; preds = %55
  %84 = load i8** %qqq, align 8
  %85 = load i8** %pq, align 8
  %86 = load i8** %qqq, align 8
  %87 = ptrtoint i8* %85 to i64
  %88 = ptrtoint i8* %86 to i64
  %89 = sub i64 %87, %88
  %90 = call i64 @fwrite(i8* %84, i64 1, i64 %89, %struct._IO_FILE* %2)
  br label %35

; <label>:91                                      ; preds = %35
  %92 = load %struct._IO_FILE** @stderr, align 8
  %93 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %92, i8* getelementptr inbounds ([40 x i8]* @.str9, i32 0, i32 0), i64 %hotLoopCounter.0)
  %94 = call i32 @fclose(%struct._IO_FILE* %1)
  %95 = call i32 @fclose(%struct._IO_FILE* %2)
  br label %96

; <label>:96                                      ; preds = %91, %32, %26, %12
  %.0 = phi i32 [ %33, %32 ], [ 0, %91 ], [ %27, %26 ], [ %21, %12 ]
  ret i32 %.0
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
