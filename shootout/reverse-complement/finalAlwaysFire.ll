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
define i32 @hotLoop(i64* %p_hotLoopCounter, %struct._IO_FILE* %inputFile, i8* %pj, i8* %pq, i8* %pr, i8* %jjj, i8* %qqq, i8* %pqstop, i8* %xtab) #0 {
entry:
  %v1 = load i64* %p_hotLoopCounter, align 8
  %v2 = add nsw i64 %v1, 1
  store i64 %v2, i64* %p_hotLoopCounter, align 8
  %v3 = call i8* @fgets(i8* %jjj, i32 82, %struct._IO_FILE* %inputFile)
  %v4 = icmp ne i8* %v3, null
  br i1 %v4, label %B5, label %B9

B5:                                       ; preds = %0
  %v6 = load i8* %jjj, align 1
  %v7 = sext i8 %v6 to i32
  %v8 = icmp eq i32 %v7, 62
  br i1 %v8, label %B9, label %B10

B9:                                       ; preds = %B5, %0
  br label %B57

B10:                                      ; preds = %B5
  %v11 = getelementptr inbounds i8* %pq, i64 61
  %v12 = icmp ule i8* %pr, %v11
  br i1 %v12, label %B13, label %B42

B13:                                      ; preds = %B10
  %v14 = getelementptr inbounds i8* %pqstop, i64 12777888
  %v15 = ptrtoint i8* %v14 to i64
  %v16 = ptrtoint i8* %qqq to i64
  %v17 = sub i64 %v15, %v16
  %v18 = call i8* @realloc(i8* %qqq, i64 %v17) #4
  %v19 = icmp ne i8* %v18, null
  br i1 %v19, label %B22, label %B20

B20:                                      ; preds = %B13
  %v21 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 0)
  call void @exit(i32 %v21) #5
  unreachable

B22:                                      ; preds = %B13
  %v23 = icmp ne i8* %v18, %qqq
  br i1 %v23, label %B24, label %B33

B24:                                      ; preds = %B22
  %v25 = ptrtoint i8* %v18 to i64
  %v26 = ptrtoint i8* %qqq to i64
  %v27 = sub i64 %v25, %v26
  %v28 = getelementptr inbounds i8* %pq, i64 %v27
  %v29 = getelementptr inbounds i8* %pr, i64 %v27
  %v30 = getelementptr inbounds i8* %qqq, i64 %v27
  %v31 = getelementptr inbounds i8* %v14, i64 %v27
  %v32 = getelementptr inbounds i8* %pqstop, i64 %v27
  br label %B33

B33:                                      ; preds = %B24, %B22
  %.03 = phi i8* [ %v29, %B24 ], [ %pr, %B22 ]
  %.01 = phi i8* [ %v32, %B24 ], [ %pqstop, %B22 ]
  %newstop.0 = phi i8* [ %v31, %B24 ], [ %v14, %B22 ]
  %v34 = ptrtoint i8* %.01 to i64
  %v35 = ptrtoint i8* %.03 to i64
  %v36 = sub i64 %v34, %v35
  %v37 = sub i64 0, %v36
  %v38 = getelementptr inbounds i8* %newstop.0, i64 %v37
  %v39 = ptrtoint i8* %.01 to i64
  %v40 = ptrtoint i8* %.03 to i64
  %v41 = sub i64 %v39, %v40
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %v38, i8* %.03, i64 %v41, i32 1, i1 false)
  br label %B42

B42:                                      ; preds = %B33, %B10
  %.1 = phi i8* [ %v38, %B33 ], [ %pr, %B10 ]
  br label %B43

B43:                                      ; preds = %B55, %B42
  %.2 = phi i8* [ %.1, %B42 ], [ %.3, %B55 ]
  %.02 = phi i8* [ %v3, %B42 ], [ %v47, %B55 ]
  %v44 = load i8* %.02, align 1
  %v45 = icmp ne i8 %v44, 0
  br i1 %v45, label %B46, label %B56

B46:                                      ; preds = %B43
  %v47 = getelementptr inbounds i8* %.02, i32 1
  %v48 = load i8* %.02, align 1
  %v49 = zext i8 %v48 to i64
  %v50 = getelementptr inbounds i8* %xtab, i64 %v49
  %v51 = load i8* %v50, align 1
  %v52 = icmp ne i8 %v51, 0
  br i1 %v52, label %B53, label %B55

B53:                                      ; preds = %B46
  %v54 = getelementptr inbounds i8* %.2, i32 -1
  store i8 %v51, i8* %v54, align 1
  br label %B55

B55:                                      ; preds = %B53, %B46
  %.3 = phi i8* [ %v54, %B53 ], [ %.2, %B46 ]
  br label %B43

B56:                                      ; preds = %B43
  br label %B57

B57:                                      ; preds = %B56, %B9
  %.0 = phi i32 [ 1, %B9 ], [ 0, %B56 ]
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
  %xtab = alloca [256 x i8], align 16
  %hotLoopCounter = alloca i64, align 8
  %1 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([46 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0))
  %2 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([19 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0))
  %3 = call noalias i8* @malloc(i64 82) #4
  %4 = call noalias i8* @malloc(i64 5200) #4
  %5 = getelementptr inbounds i8* %4, i64 5200
  %6 = bitcast [256 x i8]* %xtab to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* getelementptr inbounds ([256 x i8]* @bench.xtab, i32 0, i32 0), i64 256, i32 16, i1 false)
  %7 = icmp ne i8* %3, null
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %0
  %9 = icmp ne i8* %4, null
  br i1 %9, label %19, label %10

; <label>:10                                      ; preds = %8, %0
  %11 = icmp ne i8* %3, null
  %12 = xor i1 %11, true
  %13 = zext i1 %12 to i32
  %14 = icmp ne i8* %4, null
  %15 = xor i1 %14, true
  %16 = zext i1 %15 to i32
  %17 = add nsw i32 %13, %16
  %18 = call i32 @errex(i8* getelementptr inbounds ([18 x i8]* @.str6, i32 0, i32 0), i32 %17)
  br label %73

; <label>:19                                      ; preds = %8
  %20 = call i8* @fgets(i8* %3, i32 82, %struct._IO_FILE* %1)
  %21 = icmp ne i8* %20, null
  br i1 %21, label %24, label %22

; <label>:22                                      ; preds = %19
  %23 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str7, i32 0, i32 0), i32 0)
  br label %73

; <label>:24                                      ; preds = %19
  %25 = load i8* %3, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 62
  br i1 %27, label %28, label %30

; <label>:28                                      ; preds = %24
  %29 = call i32 @errex(i8* getelementptr inbounds ([17 x i8]* @.str8, i32 0, i32 0), i32 0)
  br label %73

; <label>:30                                      ; preds = %24
  store i64 0, i64* %hotLoopCounter, align 8
  br label %31

; <label>:31                                      ; preds = %62, %30
  %32 = icmp ne i8* %20, null
  br i1 %32, label %33, label %67

; <label>:33                                      ; preds = %31
  %34 = call i32 @fputs(i8* %3, %struct._IO_FILE* %2)
  %35 = getelementptr inbounds i8* %4, i64 1
  br label %36

; <label>:36                                      ; preds = %42, %33
  %pq.0 = phi i8* [ %35, %33 ], [ %43, %42 ]
  %37 = getelementptr inbounds [256 x i8]* %xtab, i32 0, i32 0
  %38 = call i32 @hotLoop(i64* %hotLoopCounter, %struct._IO_FILE* %1, i8* %20, i8* %pq.0, i8* %5, i8* %3, i8* %4, i8* %5, i8* %37)
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %36
  br label %44

; <label>:41                                      ; preds = %36
  br label %42

; <label>:42                                      ; preds = %41
  %43 = getelementptr inbounds i8* %pq.0, i32 1
  br label %36

; <label>:44                                      ; preds = %40
  br label %45

; <label>:45                                      ; preds = %57, %44
  %pq.1 = phi i8* [ %4, %44 ], [ %61, %57 ]
  %pr.0 = phi i8* [ %5, %44 ], [ %59, %57 ]
  %46 = icmp ult i8* %pr.0, %5
  br i1 %46, label %47, label %62

; <label>:47                                      ; preds = %45
  %48 = ptrtoint i8* %5 to i64
  %49 = ptrtoint i8* %pr.0 to i64
  %50 = sub i64 %48, %49
  %51 = icmp slt i64 %50, 60
  br i1 %51, label %52, label %56

; <label>:52                                      ; preds = %47
  %53 = ptrtoint i8* %5 to i64
  %54 = ptrtoint i8* %pr.0 to i64
  %55 = sub i64 %53, %54
  br label %57

; <label>:56                                      ; preds = %47
  br label %57

; <label>:57                                      ; preds = %56, %52
  %58 = phi i64 [ %55, %52 ], [ 60, %56 ]
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %pq.1, i8* %pr.0, i64 %58, i32 1, i1 false)
  %59 = getelementptr inbounds i8* %pr.0, i64 %58
  %60 = getelementptr inbounds i8* %pq.1, i64 %58
  %61 = getelementptr inbounds i8* %60, i32 1
  store i8 10, i8* %60, align 1
  br label %45

; <label>:62                                      ; preds = %45
  %63 = ptrtoint i8* %pq.1 to i64
  %64 = ptrtoint i8* %4 to i64
  %65 = sub i64 %63, %64
  %66 = call i64 @fwrite(i8* %4, i64 1, i64 %65, %struct._IO_FILE* %2)
  br label %31

; <label>:67                                      ; preds = %31
  %68 = load %struct._IO_FILE** @stderr, align 8
  %69 = load i64* %hotLoopCounter, align 8
  %70 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([40 x i8]* @.str9, i32 0, i32 0), i64 %69)
  %71 = call i32 @fclose(%struct._IO_FILE* %1)
  %72 = call i32 @fclose(%struct._IO_FILE* %2)
  br label %73

; <label>:73                                      ; preds = %67, %28, %22, %10
  %.0 = phi i32 [ %29, %28 ], [ 0, %67 ], [ %23, %22 ], [ %18, %10 ]
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
