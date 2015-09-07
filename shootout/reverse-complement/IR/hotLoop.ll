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
define i32 @hotLoop(%struct._IO_FILE* %inputFile, i8** %p_pj, i8** %p_pq, i8** %p_pr, i8* %jjj, i8** %p_qqq, i8** %p_pqstop, i8* %xtab) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i8**, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i8**, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8**, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i8*, align 8
  %newstop = alloca i8*, align 8
  %newptr = alloca i8*, align 8
  %x = alloca i64, align 8
  %c = alloca i8, align 1
  store %struct._IO_FILE* %inputFile, %struct._IO_FILE** %2, align 8
  store i8** %p_pj, i8*** %3, align 8
  store i8** %p_pq, i8*** %4, align 8
  store i8** %p_pr, i8*** %5, align 8
  store i8* %jjj, i8** %6, align 8
  store i8** %p_qqq, i8*** %7, align 8
  store i8** %p_pqstop, i8*** %8, align 8
  store i8* %xtab, i8** %9, align 8
  %10 = load i8** %6, align 8
  %11 = load %struct._IO_FILE** %2, align 8
  %12 = call i8* @fgets(i8* %10, i32 82, %struct._IO_FILE* %11)
  %13 = load i8*** %3, align 8
  store i8* %12, i8** %13, align 8
  %14 = load i8*** %3, align 8
  %15 = load i8** %14, align 8
  %16 = icmp ne i8* %15, null
  br i1 %16, label %17, label %22

; <label>:17                                      ; preds = %0
  %18 = load i8** %6, align 8
  %19 = load i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = icmp eq i32 %20, 62
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %17, %0
  store i32 1, i32* %1
  br label %125

; <label>:23                                      ; preds = %17
  %24 = load i8*** %5, align 8
  %25 = load i8** %24, align 8
  %26 = load i8*** %4, align 8
  %27 = load i8** %26, align 8
  %28 = getelementptr inbounds i8* %27, i64 61
  %29 = icmp ule i8* %25, %28
  br i1 %29, label %30, label %101

; <label>:30                                      ; preds = %23
  %31 = load i8*** %8, align 8
  %32 = load i8** %31, align 8
  %33 = getelementptr inbounds i8* %32, i64 12777888
  store i8* %33, i8** %newstop, align 8
  %34 = load i8*** %7, align 8
  %35 = load i8** %34, align 8
  %36 = load i8** %newstop, align 8
  %37 = load i8*** %7, align 8
  %38 = load i8** %37, align 8
  %39 = ptrtoint i8* %36 to i64
  %40 = ptrtoint i8* %38 to i64
  %41 = sub i64 %39, %40
  %42 = call i8* @realloc(i8* %35, i64 %41) #4
  store i8* %42, i8** %newptr, align 8
  %43 = load i8** %newptr, align 8
  %44 = icmp ne i8* %43, null
  br i1 %44, label %47, label %45

; <label>:45                                      ; preds = %30
  %46 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 0)
  call void @exit(i32 %46) #5
  unreachable

; <label>:47                                      ; preds = %30
  %48 = load i8** %newptr, align 8
  %49 = load i8*** %7, align 8
  %50 = load i8** %49, align 8
  %51 = icmp ne i8* %48, %50
  br i1 %51, label %52, label %78

; <label>:52                                      ; preds = %47
  %53 = load i8** %newptr, align 8
  %54 = load i8*** %7, align 8
  %55 = load i8** %54, align 8
  %56 = ptrtoint i8* %53 to i64
  %57 = ptrtoint i8* %55 to i64
  %58 = sub i64 %56, %57
  store i64 %58, i64* %x, align 8
  %59 = load i64* %x, align 8
  %60 = load i8*** %4, align 8
  %61 = load i8** %60, align 8
  %62 = getelementptr inbounds i8* %61, i64 %59
  store i8* %62, i8** %60, align 8
  %63 = load i64* %x, align 8
  %64 = load i8*** %5, align 8
  %65 = load i8** %64, align 8
  %66 = getelementptr inbounds i8* %65, i64 %63
  store i8* %66, i8** %64, align 8
  %67 = load i64* %x, align 8
  %68 = load i8*** %7, align 8
  %69 = load i8** %68, align 8
  %70 = getelementptr inbounds i8* %69, i64 %67
  store i8* %70, i8** %68, align 8
  %71 = load i64* %x, align 8
  %72 = load i8** %newstop, align 8
  %73 = getelementptr inbounds i8* %72, i64 %71
  store i8* %73, i8** %newstop, align 8
  %74 = load i64* %x, align 8
  %75 = load i8*** %8, align 8
  %76 = load i8** %75, align 8
  %77 = getelementptr inbounds i8* %76, i64 %74
  store i8* %77, i8** %75, align 8
  br label %78

; <label>:78                                      ; preds = %52, %47
  %79 = load i8** %newstop, align 8
  %80 = load i8*** %8, align 8
  %81 = load i8** %80, align 8
  %82 = load i8*** %5, align 8
  %83 = load i8** %82, align 8
  %84 = ptrtoint i8* %81 to i64
  %85 = ptrtoint i8* %83 to i64
  %86 = sub i64 %84, %85
  %87 = sub i64 0, %86
  %88 = getelementptr inbounds i8* %79, i64 %87
  %89 = load i8*** %5, align 8
  %90 = load i8** %89, align 8
  %91 = load i8*** %8, align 8
  %92 = load i8** %91, align 8
  %93 = load i8*** %5, align 8
  %94 = load i8** %93, align 8
  %95 = ptrtoint i8* %92 to i64
  %96 = ptrtoint i8* %94 to i64
  %97 = sub i64 %95, %96
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %88, i8* %90, i64 %97, i32 1, i1 false)
  %98 = load i8*** %5, align 8
  store i8* %88, i8** %98, align 8
  %99 = load i8** %newstop, align 8
  %100 = load i8*** %8, align 8
  store i8* %99, i8** %100, align 8
  br label %101

; <label>:101                                     ; preds = %78, %23
  br label %102

; <label>:102                                     ; preds = %123, %101
  %103 = load i8*** %3, align 8
  %104 = load i8** %103, align 8
  %105 = load i8* %104, align 1
  %106 = icmp ne i8 %105, 0
  br i1 %106, label %107, label %124

; <label>:107                                     ; preds = %102
  %108 = load i8*** %3, align 8
  %109 = getelementptr inbounds i8** %108, i32 1
  store i8** %109, i8*** %3, align 8
  %110 = load i8** %108, align 8
  %111 = load i8* %110, align 1
  %112 = zext i8 %111 to i64
  %113 = load i8** %9, align 8
  %114 = getelementptr inbounds i8* %113, i64 %112
  %115 = load i8* %114, align 1
  store i8 %115, i8* %c, align 1
  %116 = load i8* %c, align 1
  %117 = icmp ne i8 %116, 0
  br i1 %117, label %118, label %123

; <label>:118                                     ; preds = %107
  %119 = load i8* %c, align 1
  %120 = load i8*** %5, align 8
  %121 = load i8** %120, align 8
  %122 = getelementptr inbounds i8* %121, i32 -1
  store i8* %122, i8** %120, align 8
  store i8 %119, i8* %122, align 1
  br label %123

; <label>:123                                     ; preds = %118, %107
  br label %102

; <label>:124                                     ; preds = %102
  store i32 0, i32* %1
  br label %125

; <label>:125                                     ; preds = %124, %22
  %126 = load i32* %1
  ret i32 %126
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
  br label %114

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
  br label %114

; <label>:33                                      ; preds = %25
  %34 = load i8** %jjj, align 8
  %35 = load i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp ne i32 %36, 62
  br i1 %37, label %38, label %40

; <label>:38                                      ; preds = %33
  %39 = call i32 @errex(i8* getelementptr inbounds ([17 x i8]* @.str8, i32 0, i32 0), i32 0)
  store i32 %39, i32* %1
  br label %114

; <label>:40                                      ; preds = %33
  store i64 0, i64* %hotLoopCounter, align 8
  br label %41

; <label>:41                                      ; preds = %97, %40
  %42 = load i8** %pj, align 8
  %43 = icmp ne i8* %42, null
  br i1 %43, label %44, label %106

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

; <label>:51                                      ; preds = %61, %44
  %52 = load i64* %hotLoopCounter, align 8
  %53 = add nsw i64 %52, 1
  store i64 %53, i64* %hotLoopCounter, align 8
  %54 = load %struct._IO_FILE** %inputFile, align 8
  %55 = load i8** %jjj, align 8
  %56 = getelementptr inbounds [256 x i8]* %xtab, i32 0, i32 0
  %57 = call i32 @hotLoop(%struct._IO_FILE* %54, i8** %pj, i8** %pq, i8** %pr, i8* %55, i8** %qqq, i8** %pqstop, i8* %56)
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %60

; <label>:59                                      ; preds = %51
  br label %64

; <label>:60                                      ; preds = %51
  br label %61

; <label>:61                                      ; preds = %60
  %62 = load i8** %pq, align 8
  %63 = getelementptr inbounds i8* %62, i32 1
  store i8* %63, i8** %pq, align 8
  br label %51

; <label>:64                                      ; preds = %59
  %65 = load i8** %qqq, align 8
  store i8* %65, i8** %pq, align 8
  br label %66

; <label>:66                                      ; preds = %84, %64
  %67 = load i8** %pr, align 8
  %68 = load i8** %pqstop, align 8
  %69 = icmp ult i8* %67, %68
  br i1 %69, label %70, label %97

; <label>:70                                      ; preds = %66
  %71 = load i8** %pqstop, align 8
  %72 = load i8** %pr, align 8
  %73 = ptrtoint i8* %71 to i64
  %74 = ptrtoint i8* %72 to i64
  %75 = sub i64 %73, %74
  %76 = icmp slt i64 %75, 60
  br i1 %76, label %77, label %83

; <label>:77                                      ; preds = %70
  %78 = load i8** %pqstop, align 8
  %79 = load i8** %pr, align 8
  %80 = ptrtoint i8* %78 to i64
  %81 = ptrtoint i8* %79 to i64
  %82 = sub i64 %80, %81
  br label %84

; <label>:83                                      ; preds = %70
  br label %84

; <label>:84                                      ; preds = %83, %77
  %85 = phi i64 [ %82, %77 ], [ 60, %83 ]
  store i64 %85, i64* %x, align 8
  %86 = load i8** %pq, align 8
  %87 = load i8** %pr, align 8
  %88 = load i64* %x, align 8
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %86, i8* %87, i64 %88, i32 1, i1 false)
  %89 = load i64* %x, align 8
  %90 = load i8** %pr, align 8
  %91 = getelementptr inbounds i8* %90, i64 %89
  store i8* %91, i8** %pr, align 8
  %92 = load i64* %x, align 8
  %93 = load i8** %pq, align 8
  %94 = getelementptr inbounds i8* %93, i64 %92
  store i8* %94, i8** %pq, align 8
  %95 = load i8** %pq, align 8
  %96 = getelementptr inbounds i8* %95, i32 1
  store i8* %96, i8** %pq, align 8
  store i8 10, i8* %95, align 1
  br label %66

; <label>:97                                      ; preds = %66
  %98 = load i8** %qqq, align 8
  %99 = load i8** %pq, align 8
  %100 = load i8** %qqq, align 8
  %101 = ptrtoint i8* %99 to i64
  %102 = ptrtoint i8* %100 to i64
  %103 = sub i64 %101, %102
  %104 = load %struct._IO_FILE** %outStream, align 8
  %105 = call i64 @fwrite(i8* %98, i64 1, i64 %103, %struct._IO_FILE* %104)
  br label %41

; <label>:106                                     ; preds = %41
  %107 = load %struct._IO_FILE** @stderr, align 8
  %108 = load i64* %hotLoopCounter, align 8
  %109 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %107, i8* getelementptr inbounds ([40 x i8]* @.str9, i32 0, i32 0), i64 %108)
  %110 = load %struct._IO_FILE** %inputFile, align 8
  %111 = call i32 @fclose(%struct._IO_FILE* %110)
  %112 = load %struct._IO_FILE** %outStream, align 8
  %113 = call i32 @fclose(%struct._IO_FILE* %112)
  store i32 0, i32* %1
  br label %114

; <label>:114                                     ; preds = %106, %38, %31, %14
  %115 = load i32* %1
  ret i32 %115
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
