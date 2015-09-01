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
  call void @llvm.dbg.declare(metadata i8** %1, metadata !19, metadata !20), !dbg !21
  store i32 %n, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !22, metadata !20), !dbg !23
  %3 = load %struct._IO_FILE** @stderr, align 8, !dbg !24
  %4 = load i8** %1, align 8, !dbg !25
  %5 = load i32* %2, align 4, !dbg !26
  %6 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* %4, i32 %5), !dbg !27
  ret i32 1, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

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
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %inputFile, metadata !29, metadata !20), !dbg !90
  %2 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([46 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0)), !dbg !91
  store %struct._IO_FILE* %2, %struct._IO_FILE** %inputFile, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %outStream, metadata !92, metadata !20), !dbg !93
  %3 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0)), !dbg !94
  store %struct._IO_FILE* %3, %struct._IO_FILE** %outStream, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8** %pj, metadata !95, metadata !20), !dbg !96
  call void @llvm.dbg.declare(metadata i8** %pq, metadata !97, metadata !20), !dbg !98
  call void @llvm.dbg.declare(metadata i8** %pr, metadata !99, metadata !20), !dbg !100
  call void @llvm.dbg.declare(metadata i8** %jjj, metadata !101, metadata !20), !dbg !102
  %4 = call noalias i8* @malloc(i64 82) #4, !dbg !103
  store i8* %4, i8** %jjj, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i8** %qqq, metadata !104, metadata !20), !dbg !105
  %5 = call noalias i8* @malloc(i64 5200) #4, !dbg !106
  store i8* %5, i8** %qqq, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %pqstop, metadata !107, metadata !20), !dbg !108
  %6 = load i8** %qqq, align 8, !dbg !109
  %7 = getelementptr inbounds i8* %6, i64 5200, !dbg !109
  store i8* %7, i8** %pqstop, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [256 x i8]* %xtab, metadata !110, metadata !20), !dbg !114
  %8 = bitcast [256 x i8]* %xtab to i8*, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* getelementptr inbounds ([256 x i8]* @bench.xtab, i32 0, i32 0), i64 256, i32 16, i1 false), !dbg !114
  %9 = load i8** %jjj, align 8, !dbg !115
  %10 = icmp ne i8* %9, null, !dbg !117
  br i1 %10, label %11, label %14, !dbg !117

; <label>:11                                      ; preds = %0
  %12 = load i8** %qqq, align 8, !dbg !118
  %13 = icmp ne i8* %12, null, !dbg !117
  br i1 %13, label %25, label %14, !dbg !117

; <label>:14                                      ; preds = %11, %0
  %15 = load i8** %jjj, align 8, !dbg !120
  %16 = icmp ne i8* %15, null, !dbg !121
  %17 = xor i1 %16, true, !dbg !121
  %18 = zext i1 %17 to i32, !dbg !121
  %19 = load i8** %qqq, align 8, !dbg !122
  %20 = icmp ne i8* %19, null, !dbg !123
  %21 = xor i1 %20, true, !dbg !123
  %22 = zext i1 %21 to i32, !dbg !123
  %23 = add nsw i32 %18, %22, !dbg !121
  %24 = call i32 @errex(i8* getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 %23), !dbg !124
  store i32 %24, i32* %1, !dbg !125
  br label %193, !dbg !125

; <label>:25                                      ; preds = %11
  %26 = load i8** %jjj, align 8, !dbg !126
  %27 = load %struct._IO_FILE** %inputFile, align 8, !dbg !127
  %28 = call i8* @fgets(i8* %26, i32 82, %struct._IO_FILE* %27), !dbg !128
  store i8* %28, i8** %pj, align 8, !dbg !129
  %29 = load i8** %pj, align 8, !dbg !130
  %30 = icmp ne i8* %29, null, !dbg !132
  br i1 %30, label %33, label %31, !dbg !132

; <label>:31                                      ; preds = %25
  %32 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str6, i32 0, i32 0), i32 0), !dbg !133
  store i32 %32, i32* %1, !dbg !134
  br label %193, !dbg !134

; <label>:33                                      ; preds = %25
  %34 = load i8** %jjj, align 8, !dbg !135
  %35 = load i8* %34, align 1, !dbg !137
  %36 = sext i8 %35 to i32, !dbg !137
  %37 = icmp ne i32 %36, 62, !dbg !137
  br i1 %37, label %38, label %40, !dbg !138

; <label>:38                                      ; preds = %33
  %39 = call i32 @errex(i8* getelementptr inbounds ([17 x i8]* @.str7, i32 0, i32 0), i32 0), !dbg !139
  store i32 %39, i32* %1, !dbg !140
  br label %193, !dbg !140

; <label>:40                                      ; preds = %33
  br label %41, !dbg !141

; <label>:41                                      ; preds = %179, %40
  %42 = load i8** %pj, align 8, !dbg !142
  %43 = icmp ne i8* %42, null, !dbg !141
  br i1 %43, label %44, label %188, !dbg !141

; <label>:44                                      ; preds = %41
  %45 = load i8** %jjj, align 8, !dbg !145
  %46 = load %struct._IO_FILE** %outStream, align 8, !dbg !147
  %47 = call i32 @fputs(i8* %45, %struct._IO_FILE* %46), !dbg !148
  %48 = load i8** %qqq, align 8, !dbg !149
  %49 = getelementptr inbounds i8* %48, i64 1, !dbg !149
  store i8* %49, i8** %pq, align 8, !dbg !151
  %50 = load i8** %pqstop, align 8, !dbg !152
  store i8* %50, i8** %pr, align 8, !dbg !153
  br label %51, !dbg !151

; <label>:51                                      ; preds = %143, %44
  %52 = load i8** %jjj, align 8, !dbg !154
  %53 = load %struct._IO_FILE** %inputFile, align 8, !dbg !157
  %54 = call i8* @fgets(i8* %52, i32 82, %struct._IO_FILE* %53), !dbg !158
  store i8* %54, i8** %pj, align 8, !dbg !159
  %55 = load i8** %pj, align 8, !dbg !160
  %56 = icmp ne i8* %55, null, !dbg !162
  br i1 %56, label %57, label %62, !dbg !162

; <label>:57                                      ; preds = %51
  %58 = load i8** %jjj, align 8, !dbg !163
  %59 = load i8* %58, align 1, !dbg !165
  %60 = sext i8 %59 to i32, !dbg !165
  %61 = icmp eq i32 %60, 62, !dbg !165
  br i1 %61, label %62, label %63, !dbg !162

; <label>:62                                      ; preds = %57, %51
  br label %146, !dbg !166

; <label>:63                                      ; preds = %57
  %64 = load i8** %pr, align 8, !dbg !169
  %65 = load i8** %pq, align 8, !dbg !171
  %66 = getelementptr inbounds i8* %65, i64 61, !dbg !171
  %67 = icmp ule i8* %64, %66, !dbg !169
  br i1 %67, label %68, label %123, !dbg !172

; <label>:68                                      ; preds = %63
  call void @llvm.dbg.declare(metadata i8** %newstop, metadata !173, metadata !20), !dbg !175
  %69 = load i8** %pqstop, align 8, !dbg !176
  %70 = getelementptr inbounds i8* %69, i64 12777888, !dbg !176
  store i8* %70, i8** %newstop, align 8, !dbg !175
  call void @llvm.dbg.declare(metadata i8** %newptr, metadata !177, metadata !20), !dbg !178
  %71 = load i8** %qqq, align 8, !dbg !179
  %72 = load i8** %newstop, align 8, !dbg !180
  %73 = load i8** %qqq, align 8, !dbg !181
  %74 = ptrtoint i8* %72 to i64, !dbg !180
  %75 = ptrtoint i8* %73 to i64, !dbg !180
  %76 = sub i64 %74, %75, !dbg !180
  %77 = call i8* @realloc(i8* %71, i64 %76) #4, !dbg !182
  store i8* %77, i8** %newptr, align 8, !dbg !178
  %78 = load i8** %newptr, align 8, !dbg !183
  %79 = icmp ne i8* %78, null, !dbg !185
  br i1 %79, label %82, label %80, !dbg !185

; <label>:80                                      ; preds = %68
  %81 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str8, i32 0, i32 0), i32 0), !dbg !186
  store i32 %81, i32* %1, !dbg !187
  br label %193, !dbg !187

; <label>:82                                      ; preds = %68
  %83 = load i8** %newptr, align 8, !dbg !188
  %84 = load i8** %qqq, align 8, !dbg !190
  %85 = icmp ne i8* %83, %84, !dbg !188
  br i1 %85, label %86, label %107, !dbg !191

; <label>:86                                      ; preds = %82
  call void @llvm.dbg.declare(metadata i64* %x, metadata !192, metadata !20), !dbg !194
  %87 = load i8** %newptr, align 8, !dbg !195
  %88 = load i8** %qqq, align 8, !dbg !196
  %89 = ptrtoint i8* %87 to i64, !dbg !195
  %90 = ptrtoint i8* %88 to i64, !dbg !195
  %91 = sub i64 %89, %90, !dbg !195
  store i64 %91, i64* %x, align 8, !dbg !194
  %92 = load i64* %x, align 8, !dbg !197
  %93 = load i8** %pq, align 8, !dbg !198
  %94 = getelementptr inbounds i8* %93, i64 %92, !dbg !198
  store i8* %94, i8** %pq, align 8, !dbg !198
  %95 = load i64* %x, align 8, !dbg !199
  %96 = load i8** %pr, align 8, !dbg !200
  %97 = getelementptr inbounds i8* %96, i64 %95, !dbg !200
  store i8* %97, i8** %pr, align 8, !dbg !200
  %98 = load i64* %x, align 8, !dbg !201
  %99 = load i8** %qqq, align 8, !dbg !202
  %100 = getelementptr inbounds i8* %99, i64 %98, !dbg !202
  store i8* %100, i8** %qqq, align 8, !dbg !202
  %101 = load i64* %x, align 8, !dbg !203
  %102 = load i8** %newstop, align 8, !dbg !204
  %103 = getelementptr inbounds i8* %102, i64 %101, !dbg !204
  store i8* %103, i8** %newstop, align 8, !dbg !204
  %104 = load i64* %x, align 8, !dbg !205
  %105 = load i8** %pqstop, align 8, !dbg !206
  %106 = getelementptr inbounds i8* %105, i64 %104, !dbg !206
  store i8* %106, i8** %pqstop, align 8, !dbg !206
  br label %107, !dbg !207

; <label>:107                                     ; preds = %86, %82
  %108 = load i8** %newstop, align 8, !dbg !208
  %109 = load i8** %pqstop, align 8, !dbg !209
  %110 = load i8** %pr, align 8, !dbg !210
  %111 = ptrtoint i8* %109 to i64, !dbg !209
  %112 = ptrtoint i8* %110 to i64, !dbg !209
  %113 = sub i64 %111, %112, !dbg !209
  %114 = sub i64 0, %113, !dbg !208
  %115 = getelementptr inbounds i8* %108, i64 %114, !dbg !208
  %116 = load i8** %pr, align 8, !dbg !211
  %117 = load i8** %pqstop, align 8, !dbg !212
  %118 = load i8** %pr, align 8, !dbg !213
  %119 = ptrtoint i8* %117 to i64, !dbg !212
  %120 = ptrtoint i8* %118 to i64, !dbg !212
  %121 = sub i64 %119, %120, !dbg !212
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %115, i8* %116, i64 %121, i32 1, i1 false), !dbg !214
  store i8* %115, i8** %pr, align 8, !dbg !215
  %122 = load i8** %newstop, align 8, !dbg !216
  store i8* %122, i8** %pqstop, align 8, !dbg !217
  br label %123, !dbg !218

; <label>:123                                     ; preds = %107, %63
  br label %124, !dbg !219

; <label>:124                                     ; preds = %141, %123
  %125 = load i8** %pj, align 8, !dbg !220
  %126 = load i8* %125, align 1, !dbg !223
  %127 = icmp ne i8 %126, 0, !dbg !219
  br i1 %127, label %128, label %142, !dbg !219

; <label>:128                                     ; preds = %124
  call void @llvm.dbg.declare(metadata i8* %c, metadata !224, metadata !20), !dbg !226
  %129 = load i8** %pj, align 8, !dbg !227
  %130 = getelementptr inbounds i8* %129, i32 1, !dbg !227
  store i8* %130, i8** %pj, align 8, !dbg !227
  %131 = load i8* %129, align 1, !dbg !228
  %132 = zext i8 %131 to i64, !dbg !229
  %133 = getelementptr inbounds [256 x i8]* %xtab, i32 0, i64 %132, !dbg !229
  %134 = load i8* %133, align 1, !dbg !229
  store i8 %134, i8* %c, align 1, !dbg !226
  %135 = load i8* %c, align 1, !dbg !230
  %136 = icmp ne i8 %135, 0, !dbg !232
  br i1 %136, label %137, label %141, !dbg !232

; <label>:137                                     ; preds = %128
  %138 = load i8* %c, align 1, !dbg !233
  %139 = load i8** %pr, align 8, !dbg !234
  %140 = getelementptr inbounds i8* %139, i32 -1, !dbg !234
  store i8* %140, i8** %pr, align 8, !dbg !234
  store i8 %138, i8* %140, align 1, !dbg !235
  br label %141, !dbg !235

; <label>:141                                     ; preds = %137, %128
  br label %124, !dbg !219

; <label>:142                                     ; preds = %124
  br label %143, !dbg !236

; <label>:143                                     ; preds = %142
  %144 = load i8** %pq, align 8, !dbg !237
  %145 = getelementptr inbounds i8* %144, i32 1, !dbg !237
  store i8* %145, i8** %pq, align 8, !dbg !237
  br label %51, !dbg !238

; <label>:146                                     ; preds = %62
  %147 = load i8** %qqq, align 8, !dbg !239
  store i8* %147, i8** %pq, align 8, !dbg !241
  br label %148, !dbg !241

; <label>:148                                     ; preds = %166, %146
  %149 = load i8** %pr, align 8, !dbg !242
  %150 = load i8** %pqstop, align 8, !dbg !246
  %151 = icmp ult i8* %149, %150, !dbg !247
  br i1 %151, label %152, label %179, !dbg !248

; <label>:152                                     ; preds = %148
  call void @llvm.dbg.declare(metadata i64* %x1, metadata !249, metadata !20), !dbg !251
  %153 = load i8** %pqstop, align 8, !dbg !252
  %154 = load i8** %pr, align 8, !dbg !253
  %155 = ptrtoint i8* %153 to i64, !dbg !252
  %156 = ptrtoint i8* %154 to i64, !dbg !252
  %157 = sub i64 %155, %156, !dbg !252
  %158 = icmp slt i64 %157, 60, !dbg !254
  br i1 %158, label %159, label %165, !dbg !254

; <label>:159                                     ; preds = %152
  %160 = load i8** %pqstop, align 8, !dbg !255
  %161 = load i8** %pr, align 8, !dbg !257
  %162 = ptrtoint i8* %160 to i64, !dbg !258
  %163 = ptrtoint i8* %161 to i64, !dbg !258
  %164 = sub i64 %162, %163, !dbg !258
  br label %166, !dbg !254

; <label>:165                                     ; preds = %152
  br label %166, !dbg !259

; <label>:166                                     ; preds = %165, %159
  %167 = phi i64 [ %164, %159 ], [ 60, %165 ], !dbg !254
  store i64 %167, i64* %x1, align 8, !dbg !261
  %168 = load i8** %pq, align 8, !dbg !264
  %169 = load i8** %pr, align 8, !dbg !265
  %170 = load i64* %x1, align 8, !dbg !266
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %168, i8* %169, i64 %170, i32 1, i1 false), !dbg !267
  %171 = load i64* %x1, align 8, !dbg !268
  %172 = load i8** %pr, align 8, !dbg !269
  %173 = getelementptr inbounds i8* %172, i64 %171, !dbg !269
  store i8* %173, i8** %pr, align 8, !dbg !269
  %174 = load i64* %x1, align 8, !dbg !270
  %175 = load i8** %pq, align 8, !dbg !271
  %176 = getelementptr inbounds i8* %175, i64 %174, !dbg !271
  store i8* %176, i8** %pq, align 8, !dbg !271
  %177 = load i8** %pq, align 8, !dbg !272
  %178 = getelementptr inbounds i8* %177, i32 1, !dbg !272
  store i8* %178, i8** %pq, align 8, !dbg !272
  store i8 10, i8* %177, align 1, !dbg !273
  br label %148, !dbg !274

; <label>:179                                     ; preds = %148
  %180 = load i8** %qqq, align 8, !dbg !275
  %181 = load i8** %pq, align 8, !dbg !276
  %182 = load i8** %qqq, align 8, !dbg !277
  %183 = ptrtoint i8* %181 to i64, !dbg !276
  %184 = ptrtoint i8* %182 to i64, !dbg !276
  %185 = sub i64 %183, %184, !dbg !276
  %186 = load %struct._IO_FILE** %outStream, align 8, !dbg !278
  %187 = call i64 @fwrite(i8* %180, i64 1, i64 %185, %struct._IO_FILE* %186), !dbg !279
  br label %41, !dbg !141

; <label>:188                                     ; preds = %41
  %189 = load %struct._IO_FILE** %inputFile, align 8, !dbg !280
  %190 = call i32 @fclose(%struct._IO_FILE* %189), !dbg !281
  %191 = load %struct._IO_FILE** %outStream, align 8, !dbg !282
  %192 = call i32 @fclose(%struct._IO_FILE* %191), !dbg !283
  store i32 0, i32* %1, !dbg !284
  br label %193, !dbg !284

; <label>:193                                     ; preds = %188, %80, %38, %31, %14
  %194 = load i32* %1, !dbg !285
  ret i32 %194, !dbg !285
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

declare i32 @fputs(i8*, %struct._IO_FILE*) #2

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #3

; Function Attrs: nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

declare i32 @fclose(%struct._IO_FILE*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c] [DW_LANG_C99]
!1 = !{!"code.c", !"/media/llvm/OSR/shootout/reverse-complement/C"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!5 = !{!6, !13}
!6 = !{!"0x2e\00errex\00errex\00\0016\000\001\000\000\00256\000\0016", !1, !7, !8, null, i32 (i8*, i32)* @errex, null, null, !2} ; [ DW_TAG_subprogram ] [line 16] [def] [errex]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!10, !11, !10}
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = !{!"0x2e\00bench\00bench\00\0021\000\001\000\000\000\000\0021", !1, !7, !14, null, i32 ()* @bench, null, null, !2} ; [ DW_TAG_subprogram ] [line 21] [def] [bench]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{!10}
!16 = !{i32 2, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 2}
!18 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!19 = !{!"0x101\00s\0016777232\000", !6, !7, !11} ; [ DW_TAG_arg_variable ] [s] [line 16]
!20 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!21 = !MDLocation(line: 16, column: 17, scope: !6)
!22 = !{!"0x101\00n\0033554448\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 16]
!23 = !MDLocation(line: 16, column: 24, scope: !6)
!24 = !MDLocation(line: 17, column: 11, scope: !6)
!25 = !MDLocation(line: 17, column: 45, scope: !6)
!26 = !MDLocation(line: 17, column: 48, scope: !6)
!27 = !MDLocation(line: 17, column: 3, scope: !6)
!28 = !MDLocation(line: 18, column: 3, scope: !6)
!29 = !{!"0x100\00inputFile\0022\000", !13, !7, !30} ; [ DW_TAG_auto_variable ] [inputFile] [line 22]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!31 = !{!"0x16\00FILE\0048\000\000\000\000", !32, null, !33} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!32 = !{!"/usr/include/stdio.h", !"/media/llvm/OSR/shootout/reverse-complement/C"}
!33 = !{!"0x13\00_IO_FILE\00245\001728\0064\000\000\000", !34, null, null, !35, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!34 = !{!"/usr/include/libio.h", !"/media/llvm/OSR/shootout/reverse-complement/C"}
!35 = !{!36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !56, !57, !58, !59, !63, !65, !67, !71, !74, !76, !78, !79, !80, !81, !85, !86}
!36 = !{!"0xd\00_flags\00246\0032\0032\000\000", !34, !33, !10} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!37 = !{!"0xd\00_IO_read_ptr\00251\0064\0064\0064\000", !34, !33, !11} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!38 = !{!"0xd\00_IO_read_end\00252\0064\0064\00128\000", !34, !33, !11} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!39 = !{!"0xd\00_IO_read_base\00253\0064\0064\00192\000", !34, !33, !11} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!40 = !{!"0xd\00_IO_write_base\00254\0064\0064\00256\000", !34, !33, !11} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!41 = !{!"0xd\00_IO_write_ptr\00255\0064\0064\00320\000", !34, !33, !11} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!42 = !{!"0xd\00_IO_write_end\00256\0064\0064\00384\000", !34, !33, !11} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!43 = !{!"0xd\00_IO_buf_base\00257\0064\0064\00448\000", !34, !33, !11} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!44 = !{!"0xd\00_IO_buf_end\00258\0064\0064\00512\000", !34, !33, !11} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!45 = !{!"0xd\00_IO_save_base\00260\0064\0064\00576\000", !34, !33, !11} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!46 = !{!"0xd\00_IO_backup_base\00261\0064\0064\00640\000", !34, !33, !11} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!47 = !{!"0xd\00_IO_save_end\00262\0064\0064\00704\000", !34, !33, !11} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!48 = !{!"0xd\00_markers\00264\0064\0064\00768\000", !34, !33, !49} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!49 = !{!"0xf\00\000\0064\0064\000\000", null, null, !50} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!50 = !{!"0x13\00_IO_marker\00160\00192\0064\000\000\000", !34, null, null, !51, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!51 = !{!52, !53, !55}
!52 = !{!"0xd\00_next\00161\0064\0064\000\000", !34, !50, !49} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!53 = !{!"0xd\00_sbuf\00162\0064\0064\0064\000", !34, !50, !54} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!54 = !{!"0xf\00\000\0064\0064\000\000", null, null, !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!55 = !{!"0xd\00_pos\00166\0032\0032\00128\000", !34, !50, !10} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!56 = !{!"0xd\00_chain\00266\0064\0064\00832\000", !34, !33, !54} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!57 = !{!"0xd\00_fileno\00268\0032\0032\00896\000", !34, !33, !10} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!58 = !{!"0xd\00_flags2\00272\0032\0032\00928\000", !34, !33, !10} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!59 = !{!"0xd\00_old_offset\00274\0064\0064\00960\000", !34, !33, !60} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!60 = !{!"0x16\00__off_t\00131\000\000\000\000", !61, null, !62} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!61 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/media/llvm/OSR/shootout/reverse-complement/C"}
!62 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!63 = !{!"0xd\00_cur_column\00278\0016\0016\001024\000", !34, !33, !64} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!64 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!65 = !{!"0xd\00_vtable_offset\00279\008\008\001040\000", !34, !33, !66} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!66 = !{!"0x24\00signed char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!67 = !{!"0xd\00_shortbuf\00280\008\008\001048\000", !34, !33, !68} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!68 = !{!"0x1\00\000\008\008\000\000\000", null, null, !12, !69, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!69 = !{!70}
!70 = !{!"0x21\000\001"}                          ; [ DW_TAG_subrange_type ] [0, 0]
!71 = !{!"0xd\00_lock\00284\0064\0064\001088\000", !34, !33, !72} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!72 = !{!"0xf\00\000\0064\0064\000\000", null, null, !73} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_lock_t]
!73 = !{!"0x16\00_IO_lock_t\00154\000\000\000\000", !34, null, null} ; [ DW_TAG_typedef ] [_IO_lock_t] [line 154, size 0, align 0, offset 0] [from ]
!74 = !{!"0xd\00_offset\00293\0064\0064\001152\000", !34, !33, !75} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!75 = !{!"0x16\00__off64_t\00132\000\000\000\000", !61, null, !62} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!76 = !{!"0xd\00__pad1\00302\0064\0064\001216\000", !34, !33, !77} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!77 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!78 = !{!"0xd\00__pad2\00303\0064\0064\001280\000", !34, !33, !77} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!79 = !{!"0xd\00__pad3\00304\0064\0064\001344\000", !34, !33, !77} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!80 = !{!"0xd\00__pad4\00305\0064\0064\001408\000", !34, !33, !77} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!81 = !{!"0xd\00__pad5\00306\0064\0064\001472\000", !34, !33, !82} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!82 = !{!"0x16\00size_t\0062\000\000\000\000", !83, null, !84} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!83 = !{!"/usr/local/bin/../lib/clang/3.6.2/include/stddef.h", !"/media/llvm/OSR/shootout/reverse-complement/C"}
!84 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!85 = !{!"0xd\00_mode\00308\0032\0032\001536\000", !34, !33, !10} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!86 = !{!"0xd\00_unused2\00310\00160\008\001568\000", !34, !33, !87} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!87 = !{!"0x1\00\000\00160\008\000\000\000", null, null, !12, !88, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!88 = !{!89}
!89 = !{!"0x21\000\0020"}                         ; [ DW_TAG_subrange_type ] [0, 19]
!90 = !MDLocation(line: 22, column: 9, scope: !13)
!91 = !MDLocation(line: 22, column: 21, scope: !13)
!92 = !{!"0x100\00outStream\0023\000", !13, !7, !30} ; [ DW_TAG_auto_variable ] [outStream] [line 23]
!93 = !MDLocation(line: 23, column: 9, scope: !13)
!94 = !MDLocation(line: 23, column: 21, scope: !13)
!95 = !{!"0x100\00pj\0024\000", !13, !7, !11}     ; [ DW_TAG_auto_variable ] [pj] [line 24]
!96 = !MDLocation(line: 24, column: 9, scope: !13)
!97 = !{!"0x100\00pq\0024\000", !13, !7, !11}     ; [ DW_TAG_auto_variable ] [pq] [line 24]
!98 = !MDLocation(line: 24, column: 14, scope: !13)
!99 = !{!"0x100\00pr\0024\000", !13, !7, !11}     ; [ DW_TAG_auto_variable ] [pr] [line 24]
!100 = !MDLocation(line: 24, column: 19, scope: !13)
!101 = !{!"0x100\00jjj\0025\000", !13, !7, !11}   ; [ DW_TAG_auto_variable ] [jjj] [line 25]
!102 = !MDLocation(line: 25, column: 9, scope: !13)
!103 = !MDLocation(line: 25, column: 15, scope: !13)
!104 = !{!"0x100\00qqq\0026\000", !13, !7, !11}   ; [ DW_TAG_auto_variable ] [qqq] [line 26]
!105 = !MDLocation(line: 26, column: 9, scope: !13)
!106 = !MDLocation(line: 26, column: 15, scope: !13)
!107 = !{!"0x100\00pqstop\0027\000", !13, !7, !11} ; [ DW_TAG_auto_variable ] [pqstop] [line 27]
!108 = !MDLocation(line: 27, column: 9, scope: !13)
!109 = !MDLocation(line: 27, column: 18, scope: !13)
!110 = !{!"0x100\00xtab\0028\000", !13, !7, !111} ; [ DW_TAG_auto_variable ] [xtab] [line 28]
!111 = !{!"0x1\00\000\002048\008\000\000\000", null, null, !12, !112, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!112 = !{!113}
!113 = !{!"0x21\000\00256"}                       ; [ DW_TAG_subrange_type ] [0, 255]
!114 = !MDLocation(line: 28, column: 8, scope: !13)
!115 = !MDLocation(line: 30, column: 8, scope: !116)
!116 = !{!"0xb\0030\007\000", !1, !13}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!117 = !MDLocation(line: 30, column: 7, scope: !13)
!118 = !MDLocation(line: 30, column: 16, scope: !119)
!119 = !{!"0xb\001", !1, !116}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!120 = !MDLocation(line: 31, column: 40, scope: !116)
!121 = !MDLocation(line: 31, column: 39, scope: !116)
!122 = !MDLocation(line: 31, column: 47, scope: !116)
!123 = !MDLocation(line: 31, column: 46, scope: !116)
!124 = !MDLocation(line: 31, column: 12, scope: !116)
!125 = !MDLocation(line: 31, column: 5, scope: !116)
!126 = !MDLocation(line: 32, column: 14, scope: !13)
!127 = !MDLocation(line: 32, column: 26, scope: !13)
!128 = !MDLocation(line: 32, column: 8, scope: !13)
!129 = !MDLocation(line: 32, column: 3, scope: !13)
!130 = !MDLocation(line: 33, column: 8, scope: !131)
!131 = !{!"0xb\0033\007\001", !1, !13}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!132 = !MDLocation(line: 33, column: 7, scope: !13)
!133 = !MDLocation(line: 34, column: 12, scope: !131)
!134 = !MDLocation(line: 34, column: 5, scope: !131)
!135 = !MDLocation(line: 35, column: 8, scope: !136)
!136 = !{!"0xb\0035\007\002", !1, !13}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!137 = !MDLocation(line: 35, column: 7, scope: !136)
!138 = !MDLocation(line: 35, column: 7, scope: !13)
!139 = !MDLocation(line: 36, column: 12, scope: !136)
!140 = !MDLocation(line: 36, column: 5, scope: !136)
!141 = !MDLocation(line: 38, column: 3, scope: !13)
!142 = !MDLocation(line: 38, column: 10, scope: !143)
!143 = !{!"0xb\002", !1, !144}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!144 = !{!"0xb\001", !1, !13}                     ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!145 = !MDLocation(line: 39, column: 11, scope: !146)
!146 = !{!"0xb\0038\0014\003", !1, !13}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!147 = !MDLocation(line: 39, column: 16, scope: !146)
!148 = !MDLocation(line: 39, column: 5, scope: !146)
!149 = !MDLocation(line: 41, column: 13, scope: !150)
!150 = !{!"0xb\0041\005\004", !1, !146}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!151 = !MDLocation(line: 41, column: 10, scope: !150)
!152 = !MDLocation(line: 41, column: 23, scope: !150)
!153 = !MDLocation(line: 41, column: 20, scope: !150)
!154 = !MDLocation(line: 42, column: 18, scope: !155)
!155 = !{!"0xb\0041\0039\006", !1, !156}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!156 = !{!"0xb\0041\005\005", !1, !150}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!157 = !MDLocation(line: 42, column: 32, scope: !155)
!158 = !MDLocation(line: 42, column: 12, scope: !155)
!159 = !MDLocation(line: 42, column: 7, scope: !155)
!160 = !MDLocation(line: 43, column: 12, scope: !161)
!161 = !{!"0xb\0043\0011\007", !1, !155}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!162 = !MDLocation(line: 43, column: 11, scope: !155)
!163 = !MDLocation(line: 43, column: 20, scope: !164)
!164 = !{!"0xb\001", !1, !161}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!165 = !MDLocation(line: 43, column: 19, scope: !161)
!166 = !MDLocation(line: 43, column: 32, scope: !167)
!167 = !{!"0xb\003", !1, !168}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!168 = !{!"0xb\002", !1, !161}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!169 = !MDLocation(line: 44, column: 11, scope: !170)
!170 = !{!"0xb\0044\0011\008", !1, !155}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!171 = !MDLocation(line: 44, column: 18, scope: !170)
!172 = !MDLocation(line: 44, column: 11, scope: !155)
!173 = !{!"0x100\00newstop\0045\000", !174, !7, !11} ; [ DW_TAG_auto_variable ] [newstop] [line 45]
!174 = !{!"0xb\0044\0026\009", !1, !170}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!175 = !MDLocation(line: 45, column: 15, scope: !174)
!176 = !MDLocation(line: 45, column: 25, scope: !174)
!177 = !{!"0x100\00newptr\0046\000", !174, !7, !11} ; [ DW_TAG_auto_variable ] [newptr] [line 46]
!178 = !MDLocation(line: 46, column: 15, scope: !174)
!179 = !MDLocation(line: 46, column: 33, scope: !174)
!180 = !MDLocation(line: 46, column: 38, scope: !174)
!181 = !MDLocation(line: 46, column: 46, scope: !174)
!182 = !MDLocation(line: 46, column: 25, scope: !174)
!183 = !MDLocation(line: 47, column: 14, scope: !184)
!184 = !{!"0xb\0047\0013\0010", !1, !174}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!185 = !MDLocation(line: 47, column: 13, scope: !174)
!186 = !MDLocation(line: 48, column: 18, scope: !184)
!187 = !MDLocation(line: 48, column: 11, scope: !184)
!188 = !MDLocation(line: 49, column: 13, scope: !189)
!189 = !{!"0xb\0049\0013\0011", !1, !174}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!190 = !MDLocation(line: 49, column: 23, scope: !189)
!191 = !MDLocation(line: 49, column: 13, scope: !174)
!192 = !{!"0x100\00x\0050\000", !193, !7, !82}    ; [ DW_TAG_auto_variable ] [x] [line 50]
!193 = !{!"0xb\0049\0028\0012", !1, !189}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!194 = !MDLocation(line: 50, column: 18, scope: !193)
!195 = !MDLocation(line: 50, column: 22, scope: !193)
!196 = !MDLocation(line: 50, column: 29, scope: !193)
!197 = !MDLocation(line: 51, column: 15, scope: !193)
!198 = !MDLocation(line: 51, column: 11, scope: !193)
!199 = !MDLocation(line: 51, column: 23, scope: !193)
!200 = !MDLocation(line: 51, column: 19, scope: !193)
!201 = !MDLocation(line: 51, column: 32, scope: !193)
!202 = !MDLocation(line: 51, column: 27, scope: !193)
!203 = !MDLocation(line: 52, column: 20, scope: !193)
!204 = !MDLocation(line: 52, column: 11, scope: !193)
!205 = !MDLocation(line: 52, column: 32, scope: !193)
!206 = !MDLocation(line: 52, column: 24, scope: !193)
!207 = !MDLocation(line: 53, column: 9, scope: !193)
!208 = !MDLocation(line: 54, column: 32, scope: !174)
!209 = !MDLocation(line: 54, column: 41, scope: !174)
!210 = !MDLocation(line: 54, column: 48, scope: !174)
!211 = !MDLocation(line: 54, column: 53, scope: !174)
!212 = !MDLocation(line: 54, column: 57, scope: !174)
!213 = !MDLocation(line: 54, column: 64, scope: !174)
!214 = !MDLocation(line: 54, column: 14, scope: !174)
!215 = !MDLocation(line: 54, column: 9, scope: !174)
!216 = !MDLocation(line: 55, column: 18, scope: !174)
!217 = !MDLocation(line: 55, column: 9, scope: !174)
!218 = !MDLocation(line: 56, column: 7, scope: !174)
!219 = !MDLocation(line: 57, column: 7, scope: !155)
!220 = !MDLocation(line: 57, column: 15, scope: !221)
!221 = !{!"0xb\002", !1, !222}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!222 = !{!"0xb\001", !1, !155}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!223 = !MDLocation(line: 57, column: 14, scope: !155)
!224 = !{!"0x100\00c\0058\000", !225, !7, !12}    ; [ DW_TAG_auto_variable ] [c] [line 58]
!225 = !{!"0xb\0057\0019\0013", !1, !155}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!226 = !MDLocation(line: 58, column: 14, scope: !225)
!227 = !MDLocation(line: 58, column: 40, scope: !225)
!228 = !MDLocation(line: 58, column: 39, scope: !225)
!229 = !MDLocation(line: 58, column: 18, scope: !225)
!230 = !MDLocation(line: 59, column: 13, scope: !231)
!231 = !{!"0xb\0059\0013\0014", !1, !225}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!232 = !MDLocation(line: 59, column: 13, scope: !225)
!233 = !MDLocation(line: 60, column: 21, scope: !231)
!234 = !MDLocation(line: 60, column: 13, scope: !231)
!235 = !MDLocation(line: 60, column: 11, scope: !231)
!236 = !MDLocation(line: 62, column: 5, scope: !155)
!237 = !MDLocation(line: 41, column: 33, scope: !156)
!238 = !MDLocation(line: 41, column: 5, scope: !156)
!239 = !MDLocation(line: 64, column: 15, scope: !240)
!240 = !{!"0xb\0064\005\0015", !1, !146}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!241 = !MDLocation(line: 64, column: 10, scope: !240)
!242 = !MDLocation(line: 64, column: 20, scope: !243)
!243 = !{!"0xb\002", !1, !244}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!244 = !{!"0xb\001", !1, !245}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!245 = !{!"0xb\0064\005\0016", !1, !240}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!246 = !MDLocation(line: 64, column: 23, scope: !245)
!247 = !MDLocation(line: 64, column: 20, scope: !245)
!248 = !MDLocation(line: 64, column: 5, scope: !240)
!249 = !{!"0x100\00x\0065\000", !250, !7, !82}    ; [ DW_TAG_auto_variable ] [x] [line 65]
!250 = !{!"0xb\0064\0033\0017", !1, !245}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!251 = !MDLocation(line: 65, column: 14, scope: !250)
!252 = !MDLocation(line: 65, column: 19, scope: !250)
!253 = !MDLocation(line: 65, column: 26, scope: !250)
!254 = !MDLocation(line: 65, column: 18, scope: !250)
!255 = !MDLocation(line: 65, column: 35, scope: !256)
!256 = !{!"0xb\001", !1, !250}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!257 = !MDLocation(line: 65, column: 42, scope: !250)
!258 = !MDLocation(line: 65, column: 35, scope: !250)
!259 = !MDLocation(line: 65, column: 18, scope: !260)
!260 = !{!"0xb\002", !1, !250}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!261 = !MDLocation(line: 65, column: 14, scope: !262)
!262 = !{!"0xb\004", !1, !263}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!263 = !{!"0xb\003", !1, !250}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!264 = !MDLocation(line: 66, column: 25, scope: !250)
!265 = !MDLocation(line: 66, column: 28, scope: !250)
!266 = !MDLocation(line: 66, column: 31, scope: !250)
!267 = !MDLocation(line: 66, column: 7, scope: !250)
!268 = !MDLocation(line: 67, column: 11, scope: !250)
!269 = !MDLocation(line: 67, column: 7, scope: !250)
!270 = !MDLocation(line: 67, column: 19, scope: !250)
!271 = !MDLocation(line: 67, column: 15, scope: !250)
!272 = !MDLocation(line: 67, column: 25, scope: !250)
!273 = !MDLocation(line: 67, column: 23, scope: !250)
!274 = !MDLocation(line: 64, column: 5, scope: !245)
!275 = !MDLocation(line: 69, column: 12, scope: !146)
!276 = !MDLocation(line: 69, column: 20, scope: !146)
!277 = !MDLocation(line: 69, column: 23, scope: !146)
!278 = !MDLocation(line: 69, column: 28, scope: !146)
!279 = !MDLocation(line: 69, column: 5, scope: !146)
!280 = !MDLocation(line: 72, column: 10, scope: !13)
!281 = !MDLocation(line: 72, column: 3, scope: !13)
!282 = !MDLocation(line: 73, column: 10, scope: !13)
!283 = !MDLocation(line: 73, column: 3, scope: !13)
!284 = !MDLocation(line: 74, column: 3, scope: !13)
!285 = !MDLocation(line: 75, column: 1, scope: !13)
