; ModuleID = 'code.c'
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
  %newstop = alloca i8*, align 8
  %newptr = alloca i8*, align 8
  %x = alloca i64, align 8
  %c = alloca i8, align 1
  %x1 = alloca i64, align 8
  %2 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([46 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0))
  store %struct._IO_FILE* %2, %struct._IO_FILE** %inputFile, align 8
  %3 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([47 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0))
  store %struct._IO_FILE* %3, %struct._IO_FILE** %outStream, align 8
  %4 = call noalias i8* @malloc(i64 82) #3
  store i8* %4, i8** %jjj, align 8
  %5 = call noalias i8* @malloc(i64 5200) #3
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
  %24 = call i32 @errex(i8* getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 %23)
  store i32 %24, i32* %1
  br label %193

; <label>:25                                      ; preds = %11
  %26 = load i8** %jjj, align 8
  %27 = load %struct._IO_FILE** %inputFile, align 8
  %28 = call i8* @fgets(i8* %26, i32 82, %struct._IO_FILE* %27)
  store i8* %28, i8** %pj, align 8
  %29 = load i8** %pj, align 8
  %30 = icmp ne i8* %29, null
  br i1 %30, label %33, label %31

; <label>:31                                      ; preds = %25
  %32 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str6, i32 0, i32 0), i32 0)
  store i32 %32, i32* %1
  br label %193

; <label>:33                                      ; preds = %25
  %34 = load i8** %jjj, align 8
  %35 = load i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp ne i32 %36, 62
  br i1 %37, label %38, label %40

; <label>:38                                      ; preds = %33
  %39 = call i32 @errex(i8* getelementptr inbounds ([17 x i8]* @.str7, i32 0, i32 0), i32 0)
  store i32 %39, i32* %1
  br label %193

; <label>:40                                      ; preds = %33
  br label %41

; <label>:41                                      ; preds = %179, %40
  %42 = load i8** %pj, align 8
  %43 = icmp ne i8* %42, null
  br i1 %43, label %44, label %188

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

; <label>:51                                      ; preds = %143, %44
  %52 = load i8** %jjj, align 8
  %53 = load %struct._IO_FILE** %inputFile, align 8
  %54 = call i8* @fgets(i8* %52, i32 82, %struct._IO_FILE* %53)
  store i8* %54, i8** %pj, align 8
  %55 = load i8** %pj, align 8
  %56 = icmp ne i8* %55, null
  br i1 %56, label %57, label %62

; <label>:57                                      ; preds = %51
  %58 = load i8** %jjj, align 8
  %59 = load i8* %58, align 1
  %60 = sext i8 %59 to i32
  %61 = icmp eq i32 %60, 62
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %57, %51
  br label %146

; <label>:63                                      ; preds = %57
  %64 = load i8** %pr, align 8
  %65 = load i8** %pq, align 8
  %66 = getelementptr inbounds i8* %65, i64 61
  %67 = icmp ule i8* %64, %66
  br i1 %67, label %68, label %123

; <label>:68                                      ; preds = %63
  %69 = load i8** %pqstop, align 8
  %70 = getelementptr inbounds i8* %69, i64 12777888
  store i8* %70, i8** %newstop, align 8
  %71 = load i8** %qqq, align 8
  %72 = load i8** %newstop, align 8
  %73 = load i8** %qqq, align 8
  %74 = ptrtoint i8* %72 to i64
  %75 = ptrtoint i8* %73 to i64
  %76 = sub i64 %74, %75
  %77 = call i8* @realloc(i8* %71, i64 %76) #3
  store i8* %77, i8** %newptr, align 8
  %78 = load i8** %newptr, align 8
  %79 = icmp ne i8* %78, null
  br i1 %79, label %82, label %80

; <label>:80                                      ; preds = %68
  %81 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str8, i32 0, i32 0), i32 0)
  store i32 %81, i32* %1
  br label %193

; <label>:82                                      ; preds = %68
  %83 = load i8** %newptr, align 8
  %84 = load i8** %qqq, align 8
  %85 = icmp ne i8* %83, %84
  br i1 %85, label %86, label %107

; <label>:86                                      ; preds = %82
  %87 = load i8** %newptr, align 8
  %88 = load i8** %qqq, align 8
  %89 = ptrtoint i8* %87 to i64
  %90 = ptrtoint i8* %88 to i64
  %91 = sub i64 %89, %90
  store i64 %91, i64* %x, align 8
  %92 = load i64* %x, align 8
  %93 = load i8** %pq, align 8
  %94 = getelementptr inbounds i8* %93, i64 %92
  store i8* %94, i8** %pq, align 8
  %95 = load i64* %x, align 8
  %96 = load i8** %pr, align 8
  %97 = getelementptr inbounds i8* %96, i64 %95
  store i8* %97, i8** %pr, align 8
  %98 = load i64* %x, align 8
  %99 = load i8** %qqq, align 8
  %100 = getelementptr inbounds i8* %99, i64 %98
  store i8* %100, i8** %qqq, align 8
  %101 = load i64* %x, align 8
  %102 = load i8** %newstop, align 8
  %103 = getelementptr inbounds i8* %102, i64 %101
  store i8* %103, i8** %newstop, align 8
  %104 = load i64* %x, align 8
  %105 = load i8** %pqstop, align 8
  %106 = getelementptr inbounds i8* %105, i64 %104
  store i8* %106, i8** %pqstop, align 8
  br label %107

; <label>:107                                     ; preds = %86, %82
  %108 = load i8** %newstop, align 8
  %109 = load i8** %pqstop, align 8
  %110 = load i8** %pr, align 8
  %111 = ptrtoint i8* %109 to i64
  %112 = ptrtoint i8* %110 to i64
  %113 = sub i64 %111, %112
  %114 = sub i64 0, %113
  %115 = getelementptr inbounds i8* %108, i64 %114
  %116 = load i8** %pr, align 8
  %117 = load i8** %pqstop, align 8
  %118 = load i8** %pr, align 8
  %119 = ptrtoint i8* %117 to i64
  %120 = ptrtoint i8* %118 to i64
  %121 = sub i64 %119, %120
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %115, i8* %116, i64 %121, i32 1, i1 false)
  store i8* %115, i8** %pr, align 8
  %122 = load i8** %newstop, align 8
  store i8* %122, i8** %pqstop, align 8
  br label %123

; <label>:123                                     ; preds = %107, %63
  br label %124

; <label>:124                                     ; preds = %141, %123
  %125 = load i8** %pj, align 8
  %126 = load i8* %125, align 1
  %127 = icmp ne i8 %126, 0
  br i1 %127, label %128, label %142

; <label>:128                                     ; preds = %124
  %129 = load i8** %pj, align 8
  %130 = getelementptr inbounds i8* %129, i32 1
  store i8* %130, i8** %pj, align 8
  %131 = load i8* %129, align 1
  %132 = zext i8 %131 to i64
  %133 = getelementptr inbounds [256 x i8]* %xtab, i32 0, i64 %132
  %134 = load i8* %133, align 1
  store i8 %134, i8* %c, align 1
  %135 = load i8* %c, align 1
  %136 = icmp ne i8 %135, 0
  br i1 %136, label %137, label %141

; <label>:137                                     ; preds = %128
  %138 = load i8* %c, align 1
  %139 = load i8** %pr, align 8
  %140 = getelementptr inbounds i8* %139, i32 -1
  store i8* %140, i8** %pr, align 8
  store i8 %138, i8* %140, align 1
  br label %141

; <label>:141                                     ; preds = %137, %128
  br label %124

; <label>:142                                     ; preds = %124
  br label %143

; <label>:143                                     ; preds = %142
  %144 = load i8** %pq, align 8
  %145 = getelementptr inbounds i8* %144, i32 1
  store i8* %145, i8** %pq, align 8
  br label %51

; <label>:146                                     ; preds = %62
  %147 = load i8** %qqq, align 8
  store i8* %147, i8** %pq, align 8
  br label %148

; <label>:148                                     ; preds = %166, %146
  %149 = load i8** %pr, align 8
  %150 = load i8** %pqstop, align 8
  %151 = icmp ult i8* %149, %150
  br i1 %151, label %152, label %179

; <label>:152                                     ; preds = %148
  %153 = load i8** %pqstop, align 8
  %154 = load i8** %pr, align 8
  %155 = ptrtoint i8* %153 to i64
  %156 = ptrtoint i8* %154 to i64
  %157 = sub i64 %155, %156
  %158 = icmp slt i64 %157, 60
  br i1 %158, label %159, label %165

; <label>:159                                     ; preds = %152
  %160 = load i8** %pqstop, align 8
  %161 = load i8** %pr, align 8
  %162 = ptrtoint i8* %160 to i64
  %163 = ptrtoint i8* %161 to i64
  %164 = sub i64 %162, %163
  br label %166

; <label>:165                                     ; preds = %152
  br label %166

; <label>:166                                     ; preds = %165, %159
  %167 = phi i64 [ %164, %159 ], [ 60, %165 ]
  store i64 %167, i64* %x1, align 8
  %168 = load i8** %pq, align 8
  %169 = load i8** %pr, align 8
  %170 = load i64* %x1, align 8
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %168, i8* %169, i64 %170, i32 1, i1 false)
  %171 = load i64* %x1, align 8
  %172 = load i8** %pr, align 8
  %173 = getelementptr inbounds i8* %172, i64 %171
  store i8* %173, i8** %pr, align 8
  %174 = load i64* %x1, align 8
  %175 = load i8** %pq, align 8
  %176 = getelementptr inbounds i8* %175, i64 %174
  store i8* %176, i8** %pq, align 8
  %177 = load i8** %pq, align 8
  %178 = getelementptr inbounds i8* %177, i32 1
  store i8* %178, i8** %pq, align 8
  store i8 10, i8* %177, align 1
  br label %148

; <label>:179                                     ; preds = %148
  %180 = load i8** %qqq, align 8
  %181 = load i8** %pq, align 8
  %182 = load i8** %qqq, align 8
  %183 = ptrtoint i8* %181 to i64
  %184 = ptrtoint i8* %182 to i64
  %185 = sub i64 %183, %184
  %186 = load %struct._IO_FILE** %outStream, align 8
  %187 = call i64 @fwrite(i8* %180, i64 1, i64 %185, %struct._IO_FILE* %186)
  br label %41

; <label>:188                                     ; preds = %41
  %189 = load %struct._IO_FILE** %inputFile, align 8
  %190 = call i32 @fclose(%struct._IO_FILE* %189)
  %191 = load %struct._IO_FILE** %outStream, align 8
  %192 = call i32 @fclose(%struct._IO_FILE* %191)
  store i32 0, i32* %1
  br label %193

; <label>:193                                     ; preds = %188, %80, %38, %31, %14
  %194 = load i32* %1
  ret i32 %194
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
