; ModuleID = 'hotLoop.c'
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
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  store i8* %s, i8** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %struct._IO_FILE** @stderr, align 8
  %4 = load i8** %1, align 8
  %5 = load i32* %2, align 4
  %6 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* %4, i32 %5)
  ret i32 1
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @hotLoop(i64* %p_hotLoopCounter, %struct._IO_FILE* %inputFile, i8* %pj, i8* %pq, i8* %pr, i8* %jjj, i8* %qqq, i8* %pqstop, i8* %xtab) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64*, align 8
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %newstop = alloca i8*, align 8
  %newptr = alloca i8*, align 8
  %x = alloca i64, align 8
  %c = alloca i8, align 1
  store i64* %p_hotLoopCounter, i64** %2, align 8
  store %struct._IO_FILE* %inputFile, %struct._IO_FILE** %3, align 8
  store i8* %pj, i8** %4, align 8
  store i8* %pq, i8** %5, align 8
  store i8* %pr, i8** %6, align 8
  store i8* %jjj, i8** %7, align 8
  store i8* %qqq, i8** %8, align 8
  store i8* %pqstop, i8** %9, align 8
  store i8* %xtab, i8** %10, align 8
  %11 = load i64** %2, align 8
  %12 = load i64* %11, align 8
  %13 = add nsw i64 %12, 1
  store i64 %13, i64* %11, align 8
  %14 = load i8** %7, align 8
  %15 = load %struct._IO_FILE** %3, align 8
  %16 = call i8* @fgets(i8* %14, i32 82, %struct._IO_FILE* %15)
  store i8* %16, i8** %4, align 8
  %17 = load i8** %4, align 8
  %18 = icmp ne i8* %17, null
  br i1 %18, label %19, label %24

; <label>:19                                      ; preds = %0
  %20 = load i8** %7, align 8
  %21 = load i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 62
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %19, %0
  store i32 1, i32* %1
  br label %106

; <label>:25                                      ; preds = %19
  %26 = load i8** %6, align 8
  %27 = load i8** %5, align 8
  %28 = getelementptr inbounds i8* %27, i64 61
  %29 = icmp ule i8* %26, %28
  br i1 %29, label %30, label %85

; <label>:30                                      ; preds = %25
  %31 = load i8** %9, align 8
  %32 = getelementptr inbounds i8* %31, i64 12777888
  store i8* %32, i8** %newstop, align 8
  %33 = load i8** %8, align 8
  %34 = load i8** %newstop, align 8
  %35 = load i8** %8, align 8
  %36 = ptrtoint i8* %34 to i64
  %37 = ptrtoint i8* %35 to i64
  %38 = sub i64 %36, %37
  %39 = call i8* @realloc(i8* %33, i64 %38) #4
  store i8* %39, i8** %newptr, align 8
  %40 = load i8** %newptr, align 8
  %41 = icmp ne i8* %40, null
  br i1 %41, label %44, label %42

; <label>:42                                      ; preds = %30
  %43 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 0)
  call void @exit(i32 %43) #5
  unreachable

; <label>:44                                      ; preds = %30
  %45 = load i8** %newptr, align 8
  %46 = load i8** %8, align 8
  %47 = icmp ne i8* %45, %46
  br i1 %47, label %48, label %69

; <label>:48                                      ; preds = %44
  %49 = load i8** %newptr, align 8
  %50 = load i8** %8, align 8
  %51 = ptrtoint i8* %49 to i64
  %52 = ptrtoint i8* %50 to i64
  %53 = sub i64 %51, %52
  store i64 %53, i64* %x, align 8
  %54 = load i64* %x, align 8
  %55 = load i8** %5, align 8
  %56 = getelementptr inbounds i8* %55, i64 %54
  store i8* %56, i8** %5, align 8
  %57 = load i64* %x, align 8
  %58 = load i8** %6, align 8
  %59 = getelementptr inbounds i8* %58, i64 %57
  store i8* %59, i8** %6, align 8
  %60 = load i64* %x, align 8
  %61 = load i8** %8, align 8
  %62 = getelementptr inbounds i8* %61, i64 %60
  store i8* %62, i8** %8, align 8
  %63 = load i64* %x, align 8
  %64 = load i8** %newstop, align 8
  %65 = getelementptr inbounds i8* %64, i64 %63
  store i8* %65, i8** %newstop, align 8
  %66 = load i64* %x, align 8
  %67 = load i8** %9, align 8
  %68 = getelementptr inbounds i8* %67, i64 %66
  store i8* %68, i8** %9, align 8
  br label %69

; <label>:69                                      ; preds = %48, %44
  %70 = load i8** %newstop, align 8
  %71 = load i8** %9, align 8
  %72 = load i8** %6, align 8
  %73 = ptrtoint i8* %71 to i64
  %74 = ptrtoint i8* %72 to i64
  %75 = sub i64 %73, %74
  %76 = sub i64 0, %75
  %77 = getelementptr inbounds i8* %70, i64 %76
  %78 = load i8** %6, align 8
  %79 = load i8** %9, align 8
  %80 = load i8** %6, align 8
  %81 = ptrtoint i8* %79 to i64
  %82 = ptrtoint i8* %80 to i64
  %83 = sub i64 %81, %82
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %77, i8* %78, i64 %83, i32 1, i1 false)
  store i8* %77, i8** %6, align 8
  %84 = load i8** %newstop, align 8
  store i8* %84, i8** %9, align 8
  br label %85

; <label>:85                                      ; preds = %69, %25
  br label %86

; <label>:86                                      ; preds = %104, %85
  %87 = load i8** %4, align 8
  %88 = load i8* %87, align 1
  %89 = icmp ne i8 %88, 0
  br i1 %89, label %90, label %105

; <label>:90                                      ; preds = %86
  %91 = load i8** %4, align 8
  %92 = getelementptr inbounds i8* %91, i32 1
  store i8* %92, i8** %4, align 8
  %93 = load i8* %91, align 1
  %94 = zext i8 %93 to i64
  %95 = load i8** %10, align 8
  %96 = getelementptr inbounds i8* %95, i64 %94
  %97 = load i8* %96, align 1
  store i8 %97, i8* %c, align 1
  %98 = load i8* %c, align 1
  %99 = icmp ne i8 %98, 0
  br i1 %99, label %100, label %104

; <label>:100                                     ; preds = %90
  %101 = load i8* %c, align 1
  %102 = load i8** %6, align 8
  %103 = getelementptr inbounds i8* %102, i32 -1
  store i8* %103, i8** %6, align 8
  store i8 %101, i8* %103, align 1
  br label %104

; <label>:104                                     ; preds = %100, %90
  br label %86

; <label>:105                                     ; preds = %86
  store i32 0, i32* %1
  br label %106

; <label>:106                                     ; preds = %105, %24
  %107 = load i32* %1
  ret i32 %107
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
  %1 = alloca i32, align 4
  %inputFile = alloca %struct._IO_FILE*, align 8
  %outStream = alloca %struct._IO_FILE*, align 8
  %pj = alloca i8*, align 8
  %pq = alloca i8*, align 8
  %pr = alloca i8*, align 8
  %jjj = alloca i8*, align 8
  %qqq = alloca i8*, align 8
  %pqstop = alloca i8*, align 8
  %xtab = alloca [256 x i8], align 16
  %hotLoopCounter = alloca i64, align 8
  %x = alloca i64, align 8
  %2 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([46 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0))
  store %struct._IO_FILE* %2, %struct._IO_FILE** %inputFile, align 8
  %3 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([19 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0))
  store %struct._IO_FILE* %3, %struct._IO_FILE** %outStream, align 8
  %4 = call noalias i8* @malloc(i64 82) #4
  store i8* %4, i8** %jjj, align 8
  %5 = call noalias i8* @malloc(i64 5200) #4
  store i8* %5, i8** %qqq, align 8
  %6 = load i8** %qqq, align 8
  %7 = getelementptr inbounds i8* %6, i64 5200
  store i8* %7, i8** %pqstop, align 8
  %8 = bitcast [256 x i8]* %xtab to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* getelementptr inbounds ([256 x i8]* @bench.xtab, i32 0, i32 0), i64 256, i32 16, i1 false)
  %9 = load i8** %jjj, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %0
  %12 = load i8** %qqq, align 8
  %13 = icmp ne i8* %12, null
  br i1 %13, label %25, label %14

; <label>:14                                      ; preds = %11, %0
  %15 = load i8** %jjj, align 8
  %16 = icmp ne i8* %15, null
  %17 = xor i1 %16, true
  %18 = zext i1 %17 to i32
  %19 = load i8** %qqq, align 8
  %20 = icmp ne i8* %19, null
  %21 = xor i1 %20, true
  %22 = zext i1 %21 to i32
  %23 = add nsw i32 %18, %22
  %24 = call i32 @errex(i8* getelementptr inbounds ([18 x i8]* @.str6, i32 0, i32 0), i32 %23)
  store i32 %24, i32* %1
  br label %117

; <label>:25                                      ; preds = %11
  %26 = load i8** %jjj, align 8
  %27 = load %struct._IO_FILE** %inputFile, align 8
  %28 = call i8* @fgets(i8* %26, i32 82, %struct._IO_FILE* %27)
  store i8* %28, i8** %pj, align 8
  %29 = load i8** %pj, align 8
  %30 = icmp ne i8* %29, null
  br i1 %30, label %33, label %31

; <label>:31                                      ; preds = %25
  %32 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str7, i32 0, i32 0), i32 0)
  store i32 %32, i32* %1
  br label %117

; <label>:33                                      ; preds = %25
  %34 = load i8** %jjj, align 8
  %35 = load i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp ne i32 %36, 62
  br i1 %37, label %38, label %40

; <label>:38                                      ; preds = %33
  %39 = call i32 @errex(i8* getelementptr inbounds ([17 x i8]* @.str8, i32 0, i32 0), i32 0)
  store i32 %39, i32* %1
  br label %117

; <label>:40                                      ; preds = %33
  store i64 0, i64* %hotLoopCounter, align 8
  br label %41

; <label>:41                                      ; preds = %100, %40
  %42 = load i8** %pj, align 8
  %43 = icmp ne i8* %42, null
  br i1 %43, label %44, label %109

; <label>:44                                      ; preds = %41
  %45 = load i8** %jjj, align 8
  %46 = load %struct._IO_FILE** %outStream, align 8
  %47 = call i32 @fputs(i8* %45, %struct._IO_FILE* %46)
  %48 = load i8** %qqq, align 8
  %49 = getelementptr inbounds i8* %48, i64 1
  store i8* %49, i8** %pq, align 8
  %50 = load i8** %pqstop, align 8
  store i8* %50, i8** %pr, align 8
  br label %51

; <label>:51                                      ; preds = %64, %44
  %52 = load %struct._IO_FILE** %inputFile, align 8
  %53 = load i8** %pj, align 8
  %54 = load i8** %pq, align 8
  %55 = load i8** %pr, align 8
  %56 = load i8** %jjj, align 8
  %57 = load i8** %qqq, align 8
  %58 = load i8** %pqstop, align 8
  %59 = getelementptr inbounds [256 x i8]* %xtab, i32 0, i32 0
  %60 = call i32 @hotLoop(i64* %hotLoopCounter, %struct._IO_FILE* %52, i8* %53, i8* %54, i8* %55, i8* %56, i8* %57, i8* %58, i8* %59)
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %51
  br label %67

; <label>:63                                      ; preds = %51
  br label %64

; <label>:64                                      ; preds = %63
  %65 = load i8** %pq, align 8
  %66 = getelementptr inbounds i8* %65, i32 1
  store i8* %66, i8** %pq, align 8
  br label %51

; <label>:67                                      ; preds = %62
  %68 = load i8** %qqq, align 8
  store i8* %68, i8** %pq, align 8
  br label %69

; <label>:69                                      ; preds = %87, %67
  %70 = load i8** %pr, align 8
  %71 = load i8** %pqstop, align 8
  %72 = icmp ult i8* %70, %71
  br i1 %72, label %73, label %100

; <label>:73                                      ; preds = %69
  %74 = load i8** %pqstop, align 8
  %75 = load i8** %pr, align 8
  %76 = ptrtoint i8* %74 to i64
  %77 = ptrtoint i8* %75 to i64
  %78 = sub i64 %76, %77
  %79 = icmp slt i64 %78, 60
  br i1 %79, label %80, label %86

; <label>:80                                      ; preds = %73
  %81 = load i8** %pqstop, align 8
  %82 = load i8** %pr, align 8
  %83 = ptrtoint i8* %81 to i64
  %84 = ptrtoint i8* %82 to i64
  %85 = sub i64 %83, %84
  br label %87

; <label>:86                                      ; preds = %73
  br label %87

; <label>:87                                      ; preds = %86, %80
  %88 = phi i64 [ %85, %80 ], [ 60, %86 ]
  store i64 %88, i64* %x, align 8
  %89 = load i8** %pq, align 8
  %90 = load i8** %pr, align 8
  %91 = load i64* %x, align 8
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %89, i8* %90, i64 %91, i32 1, i1 false)
  %92 = load i64* %x, align 8
  %93 = load i8** %pr, align 8
  %94 = getelementptr inbounds i8* %93, i64 %92
  store i8* %94, i8** %pr, align 8
  %95 = load i64* %x, align 8
  %96 = load i8** %pq, align 8
  %97 = getelementptr inbounds i8* %96, i64 %95
  store i8* %97, i8** %pq, align 8
  %98 = load i8** %pq, align 8
  %99 = getelementptr inbounds i8* %98, i32 1
  store i8* %99, i8** %pq, align 8
  store i8 10, i8* %98, align 1
  br label %69

; <label>:100                                     ; preds = %69
  %101 = load i8** %qqq, align 8
  %102 = load i8** %pq, align 8
  %103 = load i8** %qqq, align 8
  %104 = ptrtoint i8* %102 to i64
  %105 = ptrtoint i8* %103 to i64
  %106 = sub i64 %104, %105
  %107 = load %struct._IO_FILE** %outStream, align 8
  %108 = call i64 @fwrite(i8* %101, i64 1, i64 %106, %struct._IO_FILE* %107)
  br label %41

; <label>:109                                     ; preds = %41
  %110 = load %struct._IO_FILE** @stderr, align 8
  %111 = load i64* %hotLoopCounter, align 8
  %112 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %110, i8* getelementptr inbounds ([40 x i8]* @.str9, i32 0, i32 0), i64 %111)
  %113 = load %struct._IO_FILE** %inputFile, align 8
  %114 = call i32 @fclose(%struct._IO_FILE* %113)
  %115 = load %struct._IO_FILE** %outStream, align 8
  %116 = call i32 @fclose(%struct._IO_FILE* %115)
  store i32 0, i32* %1
  br label %117

; <label>:117                                     ; preds = %109, %38, %31, %14
  %118 = load i32* %1
  ret i32 %118
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
