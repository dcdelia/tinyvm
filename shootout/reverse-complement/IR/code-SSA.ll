; ModuleID = 'code.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [22 x i8] c"\0A*** Error: %s [%d]!\0A\00", align 1
@.str1 = private unnamed_addr constant [46 x i8] c"shootout/reverse-complement/revcomp-input.txt\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"r+\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"revcomp-output.txt\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@bench.xtab = private unnamed_addr constant [256 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00TVGH\00\00CD\00\00M\00KN\00\00\00YSA\00BW\00R\00\00\00\00\00\00\00TVGH\00\00CD\00\00M\00KN\00\00\00YSA\00BW\00R\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str5 = private unnamed_addr constant [18 x i8] c"Buffer allocation\00", align 1
@.str6 = private unnamed_addr constant [14 x i8] c"No input data\00", align 1
@.str7 = private unnamed_addr constant [17 x i8] c"1st char not '>'\00", align 1
@.str8 = private unnamed_addr constant [14 x i8] c"Out of memory\00", align 1

; Function Attrs: nounwind uwtable
define i32 @errex(i8* %s, i32 %n) #0 {
  %1 = load %struct._IO_FILE** @stderr, align 8
  %2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* %s, i32 %n)
  ret i32 1
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @bench() #0 {
  %xtab = alloca [256 x i8], align 16
  %1 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([46 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0))
  %2 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0))
  %3 = call noalias i8* @malloc(i64 82) #3
  %4 = call noalias i8* @malloc(i64 5200) #3
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
  %18 = call i32 @errex(i8* getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 %17)
  br label %119

; <label>:19                                      ; preds = %8
  %20 = call i8* @fgets(i8* %3, i32 82, %struct._IO_FILE* %1)
  %21 = icmp ne i8* %20, null
  br i1 %21, label %24, label %22

; <label>:22                                      ; preds = %19
  %23 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str6, i32 0, i32 0), i32 0)
  br label %119

; <label>:24                                      ; preds = %19
  %25 = load i8* %3, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 62
  br i1 %27, label %28, label %30

; <label>:28                                      ; preds = %24
  %29 = call i32 @errex(i8* getelementptr inbounds ([17 x i8]* @.str7, i32 0, i32 0), i32 0)
  br label %119

; <label>:30                                      ; preds = %24
  br label %31

; <label>:31                                      ; preds = %111, %30
  %qqq.0 = phi i8* [ %4, %30 ], [ %qqq.1, %111 ]
  %pj.0 = phi i8* [ %20, %30 ], [ %37, %111 ]
  %pqstop.0 = phi i8* [ %5, %30 ], [ %pqstop.1, %111 ]
  %32 = icmp ne i8* %pj.0, null
  br i1 %32, label %33, label %116

; <label>:33                                      ; preds = %31
  %34 = call i32 @fputs(i8* %3, %struct._IO_FILE* %2)
  %35 = getelementptr inbounds i8* %qqq.0, i64 1
  br label %36

; <label>:36                                      ; preds = %91, %33
  %qqq.1 = phi i8* [ %qqq.0, %33 ], [ %qqq.3, %91 ]
  %pr.0 = phi i8* [ %pqstop.0, %33 ], [ %pr.3, %91 ]
  %pq.0 = phi i8* [ %35, %33 ], [ %92, %91 ]
  %pqstop.1 = phi i8* [ %pqstop.0, %33 ], [ %pqstop.3, %91 ]
  %37 = call i8* @fgets(i8* %3, i32 82, %struct._IO_FILE* %1)
  %38 = icmp ne i8* %37, null
  br i1 %38, label %39, label %43

; <label>:39                                      ; preds = %36
  %40 = load i8* %3, align 1
  %41 = sext i8 %40 to i32
  %42 = icmp eq i32 %41, 62
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %39, %36
  br label %93

; <label>:44                                      ; preds = %39
  %45 = getelementptr inbounds i8* %pq.0, i64 61
  %46 = icmp ule i8* %pr.0, %45
  br i1 %46, label %47, label %76

; <label>:47                                      ; preds = %44
  %48 = getelementptr inbounds i8* %pqstop.1, i64 12777888
  %49 = ptrtoint i8* %48 to i64
  %50 = ptrtoint i8* %qqq.1 to i64
  %51 = sub i64 %49, %50
  %52 = call i8* @realloc(i8* %qqq.1, i64 %51) #3
  %53 = icmp ne i8* %52, null
  br i1 %53, label %56, label %54

; <label>:54                                      ; preds = %47
  %55 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str8, i32 0, i32 0), i32 0)
  br label %119

; <label>:56                                      ; preds = %47
  %57 = icmp ne i8* %52, %qqq.1
  br i1 %57, label %58, label %67

; <label>:58                                      ; preds = %56
  %59 = ptrtoint i8* %52 to i64
  %60 = ptrtoint i8* %qqq.1 to i64
  %61 = sub i64 %59, %60
  %62 = getelementptr inbounds i8* %pq.0, i64 %61
  %63 = getelementptr inbounds i8* %pr.0, i64 %61
  %64 = getelementptr inbounds i8* %qqq.1, i64 %61
  %65 = getelementptr inbounds i8* %48, i64 %61
  %66 = getelementptr inbounds i8* %pqstop.1, i64 %61
  br label %67

; <label>:67                                      ; preds = %58, %56
  %qqq.2 = phi i8* [ %64, %58 ], [ %qqq.1, %56 ]
  %pr.1 = phi i8* [ %63, %58 ], [ %pr.0, %56 ]
  %pq.1 = phi i8* [ %62, %58 ], [ %pq.0, %56 ]
  %pqstop.2 = phi i8* [ %66, %58 ], [ %pqstop.1, %56 ]
  %newstop.0 = phi i8* [ %65, %58 ], [ %48, %56 ]
  %68 = ptrtoint i8* %pqstop.2 to i64
  %69 = ptrtoint i8* %pr.1 to i64
  %70 = sub i64 %68, %69
  %71 = sub i64 0, %70
  %72 = getelementptr inbounds i8* %newstop.0, i64 %71
  %73 = ptrtoint i8* %pqstop.2 to i64
  %74 = ptrtoint i8* %pr.1 to i64
  %75 = sub i64 %73, %74
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %72, i8* %pr.1, i64 %75, i32 1, i1 false)
  br label %76

; <label>:76                                      ; preds = %67, %44
  %qqq.3 = phi i8* [ %qqq.2, %67 ], [ %qqq.1, %44 ]
  %pr.2 = phi i8* [ %72, %67 ], [ %pr.0, %44 ]
  %pq.2 = phi i8* [ %pq.1, %67 ], [ %pq.0, %44 ]
  %pqstop.3 = phi i8* [ %newstop.0, %67 ], [ %pqstop.1, %44 ]
  br label %77

; <label>:77                                      ; preds = %89, %76
  %pr.3 = phi i8* [ %pr.2, %76 ], [ %pr.4, %89 ]
  %pj.1 = phi i8* [ %37, %76 ], [ %81, %89 ]
  %78 = load i8* %pj.1, align 1
  %79 = icmp ne i8 %78, 0
  br i1 %79, label %80, label %90

; <label>:80                                      ; preds = %77
  %81 = getelementptr inbounds i8* %pj.1, i32 1
  %82 = load i8* %pj.1, align 1
  %83 = zext i8 %82 to i64
  %84 = getelementptr inbounds [256 x i8]* %xtab, i32 0, i64 %83
  %85 = load i8* %84, align 1
  %86 = icmp ne i8 %85, 0
  br i1 %86, label %87, label %89

; <label>:87                                      ; preds = %80
  %88 = getelementptr inbounds i8* %pr.3, i32 -1
  store i8 %85, i8* %88, align 1
  br label %89

; <label>:89                                      ; preds = %87, %80
  %pr.4 = phi i8* [ %88, %87 ], [ %pr.3, %80 ]
  br label %77

; <label>:90                                      ; preds = %77
  br label %91

; <label>:91                                      ; preds = %90
  %92 = getelementptr inbounds i8* %pq.2, i32 1
  br label %36

; <label>:93                                      ; preds = %43
  br label %94

; <label>:94                                      ; preds = %106, %93
  %pr.5 = phi i8* [ %pr.0, %93 ], [ %108, %106 ]
  %pq.3 = phi i8* [ %qqq.1, %93 ], [ %110, %106 ]
  %95 = icmp ult i8* %pr.5, %pqstop.1
  br i1 %95, label %96, label %111

; <label>:96                                      ; preds = %94
  %97 = ptrtoint i8* %pqstop.1 to i64
  %98 = ptrtoint i8* %pr.5 to i64
  %99 = sub i64 %97, %98
  %100 = icmp slt i64 %99, 60
  br i1 %100, label %101, label %105

; <label>:101                                     ; preds = %96
  %102 = ptrtoint i8* %pqstop.1 to i64
  %103 = ptrtoint i8* %pr.5 to i64
  %104 = sub i64 %102, %103
  br label %106

; <label>:105                                     ; preds = %96
  br label %106

; <label>:106                                     ; preds = %105, %101
  %107 = phi i64 [ %104, %101 ], [ 60, %105 ]
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %pq.3, i8* %pr.5, i64 %107, i32 1, i1 false)
  %108 = getelementptr inbounds i8* %pr.5, i64 %107
  %109 = getelementptr inbounds i8* %pq.3, i64 %107
  %110 = getelementptr inbounds i8* %109, i32 1
  store i8 10, i8* %109, align 1
  br label %94

; <label>:111                                     ; preds = %94
  %112 = ptrtoint i8* %pq.3 to i64
  %113 = ptrtoint i8* %qqq.1 to i64
  %114 = sub i64 %112, %113
  %115 = call i64 @fwrite(i8* %qqq.1, i64 1, i64 %114, %struct._IO_FILE* %2)
  br label %31

; <label>:116                                     ; preds = %31
  %117 = call i32 @fclose(%struct._IO_FILE* %1)
  %118 = call i32 @fclose(%struct._IO_FILE* %2)
  br label %119

; <label>:119                                     ; preds = %116, %54, %28, %22, %10
  %.0 = phi i32 [ %29, %28 ], [ %55, %54 ], [ 0, %116 ], [ %23, %22 ], [ %18, %10 ]
  ret i32 %.0
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #2

; Function Attrs: nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
