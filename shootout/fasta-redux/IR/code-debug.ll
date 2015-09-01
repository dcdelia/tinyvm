; ModuleID = 'code.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.amino_acid = type { i8, float, float }

@outStream = common global %struct._IO_FILE* null, align 8
@amino_acid_orig = global [15 x %struct.amino_acid] [%struct.amino_acid { i8 97, float 0x3FD147AE20000000, float 0.000000e+00 }, %struct.amino_acid { i8 99, float 0x3FBEB851E0000000, float 0.000000e+00 }, %struct.amino_acid { i8 103, float 0x3FBEB851E0000000, float 0.000000e+00 }, %struct.amino_acid { i8 116, float 0x3FD147AE20000000, float 0.000000e+00 }, %struct.amino_acid { i8 66, float 0x3F947AE140000000, float 0.000000e+00 }, %struct.amino_acid { i8 68, float 0x3F947AE140000000, float 0.000000e+00 }, %struct.amino_acid { i8 72, float 0x3F947AE140000000, float 0.000000e+00 }, %struct.amino_acid { i8 75, float 0x3F947AE140000000, float 0.000000e+00 }, %struct.amino_acid { i8 77, float 0x3F947AE140000000, float 0.000000e+00 }, %struct.amino_acid { i8 78, float 0x3F947AE140000000, float 0.000000e+00 }, %struct.amino_acid { i8 82, float 0x3F947AE140000000, float 0.000000e+00 }, %struct.amino_acid { i8 83, float 0x3F947AE140000000, float 0.000000e+00 }, %struct.amino_acid { i8 86, float 0x3F947AE140000000, float 0.000000e+00 }, %struct.amino_acid { i8 87, float 0x3F947AE140000000, float 0.000000e+00 }, %struct.amino_acid { i8 89, float 0x3F947AE140000000, float 0.000000e+00 }], align 16
@homo_sapiens_orig = global [4 x %struct.amino_acid] [%struct.amino_acid { i8 97, float 0x3FD3639D20000000, float 0.000000e+00 }, %struct.amino_acid { i8 99, float 0x3FC957AE40000000, float 0.000000e+00 }, %struct.amino_acid { i8 103, float 0x3FC9493AE0000000, float 0.000000e+00 }, %struct.amino_acid { i8 116, float 0x3FD34BEE40000000, float 0.000000e+00 }], align 16
@.str = private unnamed_addr constant [19 x i8] c"fasta-redux-%d.txt\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@amino_acid = common global [15 x %struct.amino_acid] zeroinitializer, align 16
@homo_sapiens = common global [4 x %struct.amino_acid] zeroinitializer, align 16
@alu = internal constant [288 x i8] c"GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGGGAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGACCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAATACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCAGCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGGAGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCCAGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA\00", align 16
@.str2 = private unnamed_addr constant [23 x i8] c">ONE Homo sapiens alu\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c">TWO IUB ambiguity codes\0A\00", align 1
@.str4 = private unnamed_addr constant [31 x i8] c">THREE Homo sapiens frequency\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @random_init(i32* %random) #0 {
  %1 = alloca i32*, align 8
  store i32* %random, i32** %1, align 8
  call void @llvm.dbg.declare(metadata i32** %1, metadata !120, metadata !121), !dbg !122
  %2 = load i32** %1, align 8, !dbg !123
  store i32 42, i32* %2, align 4, !dbg !124
  ret void, !dbg !125
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @repeat(i8* %alu, i8* %title, i32 %n) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %len = alloca i32, align 4
  %4 = alloca i8*
  %pos = alloca i32, align 4
  %bytes = alloca i32, align 4
  store i8* %alu, i8** %1, align 8
  call void @llvm.dbg.declare(metadata i8** %1, metadata !126, metadata !121), !dbg !127
  store i8* %title, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !128, metadata !121), !dbg !129
  store i32 %n, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !130, metadata !121), !dbg !131
  call void @llvm.dbg.declare(metadata i32* %len, metadata !132, metadata !121), !dbg !133
  %5 = load i8** %1, align 8, !dbg !134
  %6 = call i64 @strlen(i8* %5) #7, !dbg !135
  %7 = trunc i64 %6 to i32, !dbg !135
  store i32 %7, i32* %len, align 4, !dbg !133
  %8 = load i32* %len, align 4, !dbg !136
  %9 = add nsw i32 %8, 60, !dbg !136
  %10 = zext i32 %9 to i64, !dbg !137
  %11 = call i8* @llvm.stacksave(), !dbg !137
  store i8* %11, i8** %4, !dbg !137
  %12 = alloca i8, i64 %10, align 16, !dbg !137
  call void @llvm.dbg.declare(metadata i8* %12, metadata !138, metadata !121), !dbg !142
  call void @llvm.dbg.declare(metadata i32* %pos, metadata !143, metadata !121), !dbg !144
  store i32 0, i32* %pos, align 4, !dbg !144
  %13 = load i8** %1, align 8, !dbg !145
  %14 = load i32* %len, align 4, !dbg !146
  %15 = sext i32 %14 to i64, !dbg !146
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 %15, i32 1, i1 false), !dbg !147
  %16 = load i32* %len, align 4, !dbg !148
  %17 = sext i32 %16 to i64, !dbg !149
  %18 = getelementptr inbounds i8* %12, i64 %17, !dbg !149
  %19 = load i8** %1, align 8, !dbg !150
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 60, i32 1, i1 false), !dbg !151
  %20 = load i8** %2, align 8, !dbg !152
  %21 = load %struct._IO_FILE** @outStream, align 8, !dbg !153
  %22 = call i32 (i8*, %struct._IO_FILE*, ...)* bitcast (i32 (...)* @fputs_unlocked to i32 (i8*, %struct._IO_FILE*, ...)*)(i8* %20, %struct._IO_FILE* %21), !dbg !154
  br label %23, !dbg !155

; <label>:23                                      ; preds = %51, %0
  %24 = load i32* %3, align 4, !dbg !156
  %25 = icmp sgt i32 %24, 0, !dbg !156
  br i1 %25, label %26, label %57, !dbg !155

; <label>:26                                      ; preds = %23
  call void @llvm.dbg.declare(metadata i32* %bytes, metadata !159, metadata !121), !dbg !161
  %27 = load i32* %3, align 4, !dbg !162
  %28 = icmp sgt i32 %27, 60, !dbg !162
  br i1 %28, label %29, label %30, !dbg !162

; <label>:29                                      ; preds = %26
  br label %32, !dbg !163

; <label>:30                                      ; preds = %26
  %31 = load i32* %3, align 4, !dbg !165
  br label %32, !dbg !162

; <label>:32                                      ; preds = %30, %29
  %33 = phi i32 [ 60, %29 ], [ %31, %30 ], !dbg !162
  store i32 %33, i32* %bytes, align 4, !dbg !167
  %34 = load i32* %pos, align 4, !dbg !170
  %35 = sext i32 %34 to i64, !dbg !171
  %36 = getelementptr inbounds i8* %12, i64 %35, !dbg !171
  %37 = load i32* %bytes, align 4, !dbg !172
  %38 = sext i32 %37 to i64, !dbg !172
  %39 = load %struct._IO_FILE** @outStream, align 8, !dbg !173
  %40 = call i64 @fwrite_unlocked(i8* %36, i64 %38, i64 1, %struct._IO_FILE* %39), !dbg !174
  %41 = load i32* %bytes, align 4, !dbg !175
  %42 = load i32* %pos, align 4, !dbg !176
  %43 = add nsw i32 %42, %41, !dbg !176
  store i32 %43, i32* %pos, align 4, !dbg !176
  %44 = load i32* %pos, align 4, !dbg !177
  %45 = load i32* %len, align 4, !dbg !179
  %46 = icmp sgt i32 %44, %45, !dbg !177
  br i1 %46, label %47, label %51, !dbg !180

; <label>:47                                      ; preds = %32
  %48 = load i32* %len, align 4, !dbg !181
  %49 = load i32* %pos, align 4, !dbg !183
  %50 = sub nsw i32 %49, %48, !dbg !183
  store i32 %50, i32* %pos, align 4, !dbg !183
  br label %51, !dbg !184

; <label>:51                                      ; preds = %47, %32
  %52 = load %struct._IO_FILE** @outStream, align 8, !dbg !185
  %53 = call i32 @fputc_unlocked(i32 10, %struct._IO_FILE* %52), !dbg !186
  %54 = load i32* %bytes, align 4, !dbg !187
  %55 = load i32* %3, align 4, !dbg !188
  %56 = sub nsw i32 %55, %54, !dbg !188
  store i32 %56, i32* %3, align 4, !dbg !188
  br label %23, !dbg !155

; <label>:57                                      ; preds = %23
  %58 = load i8** %4, !dbg !189
  call void @llvm.stackrestore(i8* %58), !dbg !189
  ret void, !dbg !189
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

declare i32 @fputs_unlocked(...) #4

declare i64 @fwrite_unlocked(i8*, i64, i64, %struct._IO_FILE*) #4

declare i32 @fputc_unlocked(i32, %struct._IO_FILE*) #4

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

; Function Attrs: nounwind uwtable
define i8* @fill_lookup(%struct.amino_acid** %lookup, %struct.amino_acid* %amino_acid, i32 %amino_acid_size) #0 {
  %1 = alloca %struct.amino_acid**, align 8
  %2 = alloca %struct.amino_acid*, align 8
  %3 = alloca i32, align 4
  %p = alloca float, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %j = alloca i32, align 4
  store %struct.amino_acid** %lookup, %struct.amino_acid*** %1, align 8
  call void @llvm.dbg.declare(metadata %struct.amino_acid*** %1, metadata !190, metadata !121), !dbg !191
  store %struct.amino_acid* %amino_acid, %struct.amino_acid** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.amino_acid** %2, metadata !192, metadata !121), !dbg !193
  store i32 %amino_acid_size, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !194, metadata !121), !dbg !195
  call void @llvm.dbg.declare(metadata float* %p, metadata !196, metadata !121), !dbg !197
  store float 0.000000e+00, float* %p, align 4, !dbg !197
  call void @llvm.dbg.declare(metadata i32* %i, metadata !198, metadata !121), !dbg !200
  store i32 0, i32* %i, align 4, !dbg !200
  br label %4, !dbg !201

; <label>:4                                       ; preds = %24, %0
  %5 = load i32* %i, align 4, !dbg !202
  %6 = load i32* %3, align 4, !dbg !206
  %7 = icmp slt i32 %5, %6, !dbg !207
  br i1 %7, label %8, label %27, !dbg !208

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4, !dbg !209
  %10 = sext i32 %9 to i64, !dbg !211
  %11 = load %struct.amino_acid** %2, align 8, !dbg !211
  %12 = getelementptr inbounds %struct.amino_acid* %11, i64 %10, !dbg !211
  %13 = getelementptr inbounds %struct.amino_acid* %12, i32 0, i32 1, !dbg !211
  %14 = load float* %13, align 4, !dbg !211
  %15 = load float* %p, align 4, !dbg !212
  %16 = fadd float %15, %14, !dbg !212
  store float %16, float* %p, align 4, !dbg !212
  %17 = load float* %p, align 4, !dbg !213
  %18 = fmul float %17, 4.095000e+03, !dbg !213
  %19 = load i32* %i, align 4, !dbg !214
  %20 = sext i32 %19 to i64, !dbg !215
  %21 = load %struct.amino_acid** %2, align 8, !dbg !215
  %22 = getelementptr inbounds %struct.amino_acid* %21, i64 %20, !dbg !215
  %23 = getelementptr inbounds %struct.amino_acid* %22, i32 0, i32 2, !dbg !215
  store float %18, float* %23, align 4, !dbg !215
  br label %24, !dbg !216

; <label>:24                                      ; preds = %8
  %25 = load i32* %i, align 4, !dbg !217
  %26 = add nsw i32 %25, 1, !dbg !217
  store i32 %26, i32* %i, align 4, !dbg !217
  br label %4, !dbg !218

; <label>:27                                      ; preds = %4
  %28 = load i32* %3, align 4, !dbg !219
  %29 = sub nsw i32 %28, 1, !dbg !219
  %30 = sext i32 %29 to i64, !dbg !220
  %31 = load %struct.amino_acid** %2, align 8, !dbg !220
  %32 = getelementptr inbounds %struct.amino_acid* %31, i64 %30, !dbg !220
  %33 = getelementptr inbounds %struct.amino_acid* %32, i32 0, i32 2, !dbg !220
  store float 4.095000e+03, float* %33, align 4, !dbg !220
  call void @llvm.dbg.declare(metadata i32* %i1, metadata !221, metadata !121), !dbg !223
  store i32 0, i32* %i1, align 4, !dbg !223
  call void @llvm.dbg.declare(metadata i32* %j, metadata !224, metadata !121), !dbg !225
  store i32 0, i32* %j, align 4, !dbg !225
  br label %34, !dbg !226

; <label>:34                                      ; preds = %60, %27
  %35 = load i32* %i1, align 4, !dbg !227
  %36 = icmp slt i32 %35, 4096, !dbg !227
  br i1 %36, label %37, label %63, !dbg !231

; <label>:37                                      ; preds = %34
  br label %38, !dbg !232

; <label>:38                                      ; preds = %48, %37
  %39 = load i32* %j, align 4, !dbg !234
  %40 = sext i32 %39 to i64, !dbg !237
  %41 = load %struct.amino_acid** %2, align 8, !dbg !237
  %42 = getelementptr inbounds %struct.amino_acid* %41, i64 %40, !dbg !237
  %43 = getelementptr inbounds %struct.amino_acid* %42, i32 0, i32 2, !dbg !237
  %44 = load float* %43, align 4, !dbg !237
  %45 = load i32* %i1, align 4, !dbg !238
  %46 = sitofp i32 %45 to float, !dbg !238
  %47 = fcmp olt float %44, %46, !dbg !237
  br i1 %47, label %48, label %51, !dbg !232

; <label>:48                                      ; preds = %38
  %49 = load i32* %j, align 4, !dbg !239
  %50 = add nsw i32 %49, 1, !dbg !239
  store i32 %50, i32* %j, align 4, !dbg !239
  br label %38, !dbg !232

; <label>:51                                      ; preds = %38
  %52 = load i32* %j, align 4, !dbg !241
  %53 = sext i32 %52 to i64, !dbg !242
  %54 = load %struct.amino_acid** %2, align 8, !dbg !243
  %55 = getelementptr inbounds %struct.amino_acid* %54, i64 %53, !dbg !242
  %56 = load i32* %i1, align 4, !dbg !244
  %57 = sext i32 %56 to i64, !dbg !245
  %58 = load %struct.amino_acid*** %1, align 8, !dbg !245
  %59 = getelementptr inbounds %struct.amino_acid** %58, i64 %57, !dbg !245
  store %struct.amino_acid* %55, %struct.amino_acid** %59, align 8, !dbg !245
  br label %60, !dbg !246

; <label>:60                                      ; preds = %51
  %61 = load i32* %i1, align 4, !dbg !247
  %62 = add nsw i32 %61, 1, !dbg !247
  store i32 %62, i32* %i1, align 4, !dbg !247
  br label %34, !dbg !248

; <label>:63                                      ; preds = %34
  ret i8* null, !dbg !249
}

; Function Attrs: nounwind uwtable
define void @randomize(%struct.amino_acid* %amino_acid, i32 %amino_acid_size, i8* %title, i32 %n, i32* %rand) #0 {
  %1 = alloca %struct.amino_acid*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %lookup = alloca [4096 x %struct.amino_acid*], align 16
  %line_buffer = alloca [61 x i8], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %r = alloca float, align 4
  %u = alloca %struct.amino_acid*, align 8
  store %struct.amino_acid* %amino_acid, %struct.amino_acid** %1, align 8
  call void @llvm.dbg.declare(metadata %struct.amino_acid** %1, metadata !250, metadata !121), !dbg !251
  store i32 %amino_acid_size, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !252, metadata !121), !dbg !253
  store i8* %title, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !254, metadata !121), !dbg !255
  store i32 %n, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !256, metadata !121), !dbg !257
  store i32* %rand, i32** %5, align 8
  call void @llvm.dbg.declare(metadata i32** %5, metadata !258, metadata !121), !dbg !259
  call void @llvm.dbg.declare(metadata [4096 x %struct.amino_acid*]* %lookup, metadata !260, metadata !121), !dbg !264
  call void @llvm.dbg.declare(metadata [61 x i8]* %line_buffer, metadata !265, metadata !121), !dbg !269
  call void @llvm.dbg.declare(metadata i32* %i, metadata !270, metadata !121), !dbg !271
  call void @llvm.dbg.declare(metadata i32* %j, metadata !272, metadata !121), !dbg !273
  %6 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i64 60, !dbg !274
  store i8 10, i8* %6, align 1, !dbg !274
  %7 = getelementptr inbounds [4096 x %struct.amino_acid*]* %lookup, i32 0, i32 0, !dbg !275
  %8 = load %struct.amino_acid** %1, align 8, !dbg !276
  %9 = load i32* %2, align 4, !dbg !277
  %10 = call i8* @fill_lookup(%struct.amino_acid** %7, %struct.amino_acid* %8, i32 %9), !dbg !278
  %11 = load i8** %3, align 8, !dbg !279
  %12 = load %struct._IO_FILE** @outStream, align 8, !dbg !280
  %13 = call i32 (i8*, %struct._IO_FILE*, ...)* bitcast (i32 (...)* @fputs_unlocked to i32 (i8*, %struct._IO_FILE*, ...)*)(i8* %11, %struct._IO_FILE* %12), !dbg !281
  store i32 0, i32* %i, align 4, !dbg !282
  store i32 0, i32* %j, align 4, !dbg !284
  br label %14, !dbg !282

; <label>:14                                      ; preds = %53, %0
  %15 = load i32* %i, align 4, !dbg !285
  %16 = load i32* %4, align 4, !dbg !289
  %17 = icmp slt i32 %15, %16, !dbg !290
  br i1 %17, label %18, label %58, !dbg !291

; <label>:18                                      ; preds = %14
  %19 = load i32* %j, align 4, !dbg !292
  %20 = icmp eq i32 %19, 60, !dbg !292
  br i1 %20, label %21, label %25, !dbg !295

; <label>:21                                      ; preds = %18
  %22 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i32 0, !dbg !296
  %23 = load %struct._IO_FILE** @outStream, align 8, !dbg !298
  %24 = call i64 @fwrite_unlocked(i8* %22, i64 61, i64 1, %struct._IO_FILE* %23), !dbg !299
  store i32 0, i32* %j, align 4, !dbg !300
  br label %25, !dbg !301

; <label>:25                                      ; preds = %21, %18
  call void @llvm.dbg.declare(metadata float* %r, metadata !302, metadata !121), !dbg !303
  %26 = load i32** %5, align 8, !dbg !304
  %27 = call float @random_next_lookup(i32* %26), !dbg !305
  store float %27, float* %r, align 4, !dbg !303
  call void @llvm.dbg.declare(metadata %struct.amino_acid** %u, metadata !306, metadata !121), !dbg !307
  %28 = load float* %r, align 4, !dbg !308
  %29 = fptosi float %28 to i16, !dbg !309
  %30 = sext i16 %29 to i64, !dbg !310
  %31 = getelementptr inbounds [4096 x %struct.amino_acid*]* %lookup, i32 0, i64 %30, !dbg !310
  %32 = load %struct.amino_acid** %31, align 8, !dbg !310
  store %struct.amino_acid* %32, %struct.amino_acid** %u, align 8, !dbg !307
  br label %33, !dbg !311

; <label>:33                                      ; preds = %43, %25
  %34 = load %struct.amino_acid** %u, align 8, !dbg !312
  %35 = getelementptr inbounds %struct.amino_acid* %34, i32 0, i32 2, !dbg !312
  %36 = load float* %35, align 4, !dbg !312
  %37 = load float* %r, align 4, !dbg !312
  %38 = fcmp olt float %36, %37, !dbg !312
  %39 = zext i1 %38 to i32, !dbg !312
  %40 = sext i32 %39 to i64, !dbg !312
  %41 = call i64 @llvm.expect.i64(i64 %40, i64 0), !dbg !312
  %42 = icmp ne i64 %41, 0, !dbg !311
  br i1 %42, label %43, label %46, !dbg !311

; <label>:43                                      ; preds = %33
  %44 = load %struct.amino_acid** %u, align 8, !dbg !315
  %45 = getelementptr inbounds %struct.amino_acid* %44, i32 1, !dbg !315
  store %struct.amino_acid* %45, %struct.amino_acid** %u, align 8, !dbg !315
  br label %33, !dbg !311

; <label>:46                                      ; preds = %33
  %47 = load %struct.amino_acid** %u, align 8, !dbg !317
  %48 = getelementptr inbounds %struct.amino_acid* %47, i32 0, i32 0, !dbg !317
  %49 = load i8* %48, align 1, !dbg !317
  %50 = load i32* %j, align 4, !dbg !318
  %51 = sext i32 %50 to i64, !dbg !319
  %52 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i64 %51, !dbg !319
  store i8 %49, i8* %52, align 1, !dbg !319
  br label %53, !dbg !320

; <label>:53                                      ; preds = %46
  %54 = load i32* %i, align 4, !dbg !321
  %55 = add nsw i32 %54, 1, !dbg !321
  store i32 %55, i32* %i, align 4, !dbg !321
  %56 = load i32* %j, align 4, !dbg !322
  %57 = add nsw i32 %56, 1, !dbg !322
  store i32 %57, i32* %j, align 4, !dbg !322
  br label %14, !dbg !323

; <label>:58                                      ; preds = %14
  %59 = load i32* %j, align 4, !dbg !324
  %60 = sext i32 %59 to i64, !dbg !325
  %61 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i64 %60, !dbg !325
  store i8 10, i8* %61, align 1, !dbg !325
  %62 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i32 0, !dbg !326
  %63 = load i32* %j, align 4, !dbg !327
  %64 = add nsw i32 %63, 1, !dbg !327
  %65 = sext i32 %64 to i64, !dbg !327
  %66 = load %struct._IO_FILE** @outStream, align 8, !dbg !328
  %67 = call i64 @fwrite_unlocked(i8* %62, i64 %65, i64 1, %struct._IO_FILE* %66), !dbg !329
  ret void, !dbg !330
}

; Function Attrs: inlinehint nounwind uwtable
define internal float @random_next_lookup(i32* %random) #5 {
  %1 = alloca i32*, align 8
  store i32* %random, i32** %1, align 8
  call void @llvm.dbg.declare(metadata i32** %1, metadata !331, metadata !121), !dbg !332
  %2 = load i32** %1, align 8, !dbg !333
  %3 = load i32* %2, align 4, !dbg !334
  %4 = mul i32 %3, 3877, !dbg !334
  %5 = add i32 %4, 29573, !dbg !334
  %6 = urem i32 %5, 139968, !dbg !335
  %7 = load i32** %1, align 8, !dbg !336
  store i32 %6, i32* %7, align 4, !dbg !337
  %8 = load i32** %1, align 8, !dbg !338
  %9 = load i32* %8, align 4, !dbg !339
  %10 = uitofp i32 %9 to float, !dbg !340
  %11 = fmul float %10, 0x3F9DF57700000000, !dbg !340
  ret float %11, !dbg !341
}

; Function Attrs: nounwind readnone
declare i64 @llvm.expect.i64(i64, i64) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %filename = alloca [64 x i8], align 16
  %rand = alloca i32, align 4
  store i32 %inputN, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !342, metadata !121), !dbg !343
  call void @llvm.dbg.declare(metadata i32* %n, metadata !344, metadata !121), !dbg !345
  store i32 512, i32* %n, align 4, !dbg !345
  %2 = load i32* %1, align 4, !dbg !346
  %3 = icmp sgt i32 %2, 1, !dbg !346
  br i1 %3, label %4, label %6, !dbg !348

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4, !dbg !349
  store i32 %5, i32* %n, align 4, !dbg !351
  br label %6, !dbg !351

; <label>:6                                       ; preds = %4, %0
  call void @llvm.dbg.declare(metadata [64 x i8]* %filename, metadata !352, metadata !121), !dbg !356
  %7 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0, !dbg !357
  %8 = load i32* %n, align 4, !dbg !358
  %9 = call i32 (i8*, i8*, ...)* @sprintf(i8* %7, i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %8) #3, !dbg !359
  %10 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0, !dbg !360
  %11 = call %struct._IO_FILE* @fopen(i8* %10, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0)), !dbg !361
  store %struct._IO_FILE* %11, %struct._IO_FILE** @outStream, align 8, !dbg !362
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([15 x %struct.amino_acid]* @amino_acid, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([15 x %struct.amino_acid]* @amino_acid_orig, i32 0, i32 0, i32 0), i64 180, i32 16, i1 false), !dbg !363
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([4 x %struct.amino_acid]* @homo_sapiens, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([4 x %struct.amino_acid]* @homo_sapiens_orig, i32 0, i32 0, i32 0), i64 48, i32 16, i1 false), !dbg !364
  call void @llvm.dbg.declare(metadata i32* %rand, metadata !365, metadata !121), !dbg !366
  call void @random_init(i32* %rand), !dbg !367
  %12 = load i32* %n, align 4, !dbg !368
  %13 = mul nsw i32 %12, 2, !dbg !368
  call void @repeat(i8* getelementptr inbounds ([288 x i8]* @alu, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %13), !dbg !369
  %14 = load i32* %n, align 4, !dbg !370
  %15 = mul nsw i32 %14, 3, !dbg !370
  call void @randomize(%struct.amino_acid* getelementptr inbounds ([15 x %struct.amino_acid]* @amino_acid, i32 0, i32 0), i32 15, i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %15, i32* %rand), !dbg !371
  %16 = load i32* %n, align 4, !dbg !372
  %17 = mul nsw i32 %16, 5, !dbg !372
  call void @randomize(%struct.amino_acid* getelementptr inbounds ([4 x %struct.amino_acid]* @homo_sapiens, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([31 x i8]* @.str4, i32 0, i32 0), i32 %17, i32* %rand), !dbg !373
  %18 = load %struct._IO_FILE** @outStream, align 8, !dbg !374
  %19 = call i32 @fclose(%struct._IO_FILE* %18), !dbg !375
  ret i32 0, !dbg !376
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #6

declare %struct._IO_FILE* @fopen(i8*, i8*) #4

declare i32 @fclose(%struct._IO_FILE*) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!117, !118}
!llvm.ident = !{!119}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !3, !6, !41, !2} ; [ DW_TAG_compile_unit ] [/media/llvm/OSR/shootout/fasta-redux/code.c] [DW_LANG_C99]
!1 = !{!"code.c", !"/media/llvm/OSR/shootout/fasta-redux"}
!2 = !{}
!3 = !{!4, !5}
!4 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!5 = !{!"0x24\00short\000\0016\0016\000\000\005", null, null} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!6 = !{!7, !14, !21, !32, !35, !38}
!7 = !{!"0x2e\00random_init\00random_init\00\0027\000\001\000\000\00256\000\0027", !1, !8, !9, null, void (i32*)* @random_init, null, null, !2} ; [ DW_TAG_subprogram ] [line 27] [def] [random_init]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{null, !11}
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from random_t]
!12 = !{!"0x16\00random_t\0024\000\000\000\000", !1, null, !13} ; [ DW_TAG_typedef ] [random_t] [line 24, size 0, align 0, offset 0] [from unsigned int]
!13 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!14 = !{!"0x2e\00repeat\00repeat\00\0047\000\001\000\000\00256\000\0047", !1, !8, !15, null, void (i8*, i8*, i32)* @repeat, null, null, !2} ; [ DW_TAG_subprogram ] [line 47] [def] [repeat]
!15 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !16, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = !{null, !17, !17, !20}
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = !{!"0x26\00\000\000\000\000\000", null, null, !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!19 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!21 = !{!"0x2e\00fill_lookup\00fill_lookup\00\0080\000\001\000\000\00256\000\0080", !1, !8, !22, null, i8* (%struct.amino_acid**, %struct.amino_acid*, i32)* @fill_lookup, null, null, !2} ; [ DW_TAG_subprogram ] [line 80] [def] [fill_lookup]
!22 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !23, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = !{!24, !25, !26, !20}
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!25 = !{!"0xf\00\000\0064\0064\000\000", null, null, !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!26 = !{!"0xf\00\000\0064\0064\000\000", null, null, !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from amino_acid]
!27 = !{!"0x13\00amino_acid\0040\0096\0032\000\000\000", !1, null, null, !28, null, null, null} ; [ DW_TAG_structure_type ] [amino_acid] [line 40, size 96, align 32, offset 0] [def] [from ]
!28 = !{!29, !30, !31}
!29 = !{!"0xd\00sym\0041\008\008\000\000", !1, !27, !19} ; [ DW_TAG_member ] [sym] [line 41, size 8, align 8, offset 0] [from char]
!30 = !{!"0xd\00prob\0042\0032\0032\0032\000", !1, !27, !4} ; [ DW_TAG_member ] [prob] [line 42, size 32, align 32, offset 32] [from float]
!31 = !{!"0xd\00cprob_lookup\0043\0032\0032\0064\000", !1, !27, !4} ; [ DW_TAG_member ] [cprob_lookup] [line 43, size 32, align 32, offset 64] [from float]
!32 = !{!"0x2e\00randomize\00randomize\00\00101\000\001\000\000\00256\000\00102", !1, !8, !33, null, void (%struct.amino_acid*, i32, i8*, i32, i32*)* @randomize, null, null, !2} ; [ DW_TAG_subprogram ] [line 101] [def] [scope 102] [randomize]
!33 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !34, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = !{null, !26, !20, !17, !20, !11}
!35 = !{!"0x2e\00bench\00bench\00\00168\000\001\000\000\00256\000\00168", !1, !8, !36, null, i32 (i32)* @bench, null, null, !2} ; [ DW_TAG_subprogram ] [line 168] [def] [bench]
!36 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !37, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = !{!20, !20}
!38 = !{!"0x2e\00random_next_lookup\00random_next_lookup\00\0034\001\001\000\000\00256\000\0034", !1, !8, !39, null, float (i32*)* @random_next_lookup, null, null, !2} ; [ DW_TAG_subprogram ] [line 34] [local] [def] [random_next_lookup]
!39 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !40, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = !{!4, !11}
!41 = !{!42, !46, !50, !111, !112, !113}
!42 = !{!"0x34\00amino_acid_orig\00amino_acid_orig\00\00133\000\001", null, !8, !43, [15 x %struct.amino_acid]* @amino_acid_orig, null} ; [ DW_TAG_variable ] [amino_acid_orig] [line 133] [def]
!43 = !{!"0x1\00\000\001440\0032\000\000\000", null, null, !27, !44, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1440, align 32, offset 0] [from amino_acid]
!44 = !{!45}
!45 = !{!"0x21\000\0015"}                         ; [ DW_TAG_subrange_type ] [0, 14]
!46 = !{!"0x34\00homo_sapiens_orig\00homo_sapiens_orig\00\00152\000\001", null, !8, !47, [4 x %struct.amino_acid]* @homo_sapiens_orig, null} ; [ DW_TAG_variable ] [homo_sapiens_orig] [line 152] [def]
!47 = !{!"0x1\00\000\00384\0032\000\000\000", null, null, !27, !48, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 384, align 32, offset 0] [from amino_acid]
!48 = !{!49}
!49 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!50 = !{!"0x34\00outStream\00outStream\00\0022\000\001", null, !8, !51, %struct._IO_FILE** @outStream, null} ; [ DW_TAG_variable ] [outStream] [line 22] [def]
!51 = !{!"0xf\00\000\0064\0064\000\000", null, null, !52} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!52 = !{!"0x16\00FILE\0048\000\000\000\000", !53, null, !54} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!53 = !{!"/usr/include/stdio.h", !"/media/llvm/OSR/shootout/fasta-redux"}
!54 = !{!"0x13\00_IO_FILE\00245\001728\0064\000\000\000", !55, null, null, !56, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!55 = !{!"/usr/include/libio.h", !"/media/llvm/OSR/shootout/fasta-redux"}
!56 = !{!57, !58, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !78, !79, !80, !81, !85, !87, !89, !93, !96, !98, !99, !100, !101, !102, !106, !107}
!57 = !{!"0xd\00_flags\00246\0032\0032\000\000", !55, !54, !20} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!58 = !{!"0xd\00_IO_read_ptr\00251\0064\0064\0064\000", !55, !54, !59} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!59 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!60 = !{!"0xd\00_IO_read_end\00252\0064\0064\00128\000", !55, !54, !59} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!61 = !{!"0xd\00_IO_read_base\00253\0064\0064\00192\000", !55, !54, !59} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!62 = !{!"0xd\00_IO_write_base\00254\0064\0064\00256\000", !55, !54, !59} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!63 = !{!"0xd\00_IO_write_ptr\00255\0064\0064\00320\000", !55, !54, !59} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!64 = !{!"0xd\00_IO_write_end\00256\0064\0064\00384\000", !55, !54, !59} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!65 = !{!"0xd\00_IO_buf_base\00257\0064\0064\00448\000", !55, !54, !59} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!66 = !{!"0xd\00_IO_buf_end\00258\0064\0064\00512\000", !55, !54, !59} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!67 = !{!"0xd\00_IO_save_base\00260\0064\0064\00576\000", !55, !54, !59} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!68 = !{!"0xd\00_IO_backup_base\00261\0064\0064\00640\000", !55, !54, !59} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!69 = !{!"0xd\00_IO_save_end\00262\0064\0064\00704\000", !55, !54, !59} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!70 = !{!"0xd\00_markers\00264\0064\0064\00768\000", !55, !54, !71} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!71 = !{!"0xf\00\000\0064\0064\000\000", null, null, !72} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!72 = !{!"0x13\00_IO_marker\00160\00192\0064\000\000\000", !55, null, null, !73, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!73 = !{!74, !75, !77}
!74 = !{!"0xd\00_next\00161\0064\0064\000\000", !55, !72, !71} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!75 = !{!"0xd\00_sbuf\00162\0064\0064\0064\000", !55, !72, !76} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!76 = !{!"0xf\00\000\0064\0064\000\000", null, null, !54} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!77 = !{!"0xd\00_pos\00166\0032\0032\00128\000", !55, !72, !20} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!78 = !{!"0xd\00_chain\00266\0064\0064\00832\000", !55, !54, !76} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!79 = !{!"0xd\00_fileno\00268\0032\0032\00896\000", !55, !54, !20} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!80 = !{!"0xd\00_flags2\00272\0032\0032\00928\000", !55, !54, !20} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!81 = !{!"0xd\00_old_offset\00274\0064\0064\00960\000", !55, !54, !82} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!82 = !{!"0x16\00__off_t\00131\000\000\000\000", !83, null, !84} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!83 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/media/llvm/OSR/shootout/fasta-redux"}
!84 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!85 = !{!"0xd\00_cur_column\00278\0016\0016\001024\000", !55, !54, !86} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!86 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!87 = !{!"0xd\00_vtable_offset\00279\008\008\001040\000", !55, !54, !88} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!88 = !{!"0x24\00signed char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!89 = !{!"0xd\00_shortbuf\00280\008\008\001048\000", !55, !54, !90} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!90 = !{!"0x1\00\000\008\008\000\000\000", null, null, !19, !91, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!91 = !{!92}
!92 = !{!"0x21\000\001"}                          ; [ DW_TAG_subrange_type ] [0, 0]
!93 = !{!"0xd\00_lock\00284\0064\0064\001088\000", !55, !54, !94} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!94 = !{!"0xf\00\000\0064\0064\000\000", null, null, !95} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_lock_t]
!95 = !{!"0x16\00_IO_lock_t\00154\000\000\000\000", !55, null, null} ; [ DW_TAG_typedef ] [_IO_lock_t] [line 154, size 0, align 0, offset 0] [from ]
!96 = !{!"0xd\00_offset\00293\0064\0064\001152\000", !55, !54, !97} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!97 = !{!"0x16\00__off64_t\00132\000\000\000\000", !83, null, !84} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!98 = !{!"0xd\00__pad1\00302\0064\0064\001216\000", !55, !54, !24} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!99 = !{!"0xd\00__pad2\00303\0064\0064\001280\000", !55, !54, !24} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!100 = !{!"0xd\00__pad3\00304\0064\0064\001344\000", !55, !54, !24} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!101 = !{!"0xd\00__pad4\00305\0064\0064\001408\000", !55, !54, !24} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!102 = !{!"0xd\00__pad5\00306\0064\0064\001472\000", !55, !54, !103} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!103 = !{!"0x16\00size_t\0062\000\000\000\000", !104, null, !105} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!104 = !{!"/usr/local/bin/../lib/clang/3.6.2/include/stddef.h", !"/media/llvm/OSR/shootout/fasta-redux"}
!105 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!106 = !{!"0xd\00_mode\00308\0032\0032\001536\000", !55, !54, !20} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!107 = !{!"0xd\00_unused2\00310\00160\008\001568\000", !55, !54, !108} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!108 = !{!"0x1\00\000\00160\008\000\000\000", null, null, !19, !109, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!109 = !{!110}
!110 = !{!"0x21\000\0020"}                        ; [ DW_TAG_subrange_type ] [0, 19]
!111 = !{!"0x34\00amino_acid\00amino_acid\00\00130\000\001", null, !8, !43, [15 x %struct.amino_acid]* @amino_acid, null} ; [ DW_TAG_variable ] [amino_acid] [line 130] [def]
!112 = !{!"0x34\00homo_sapiens\00homo_sapiens\00\00131\000\001", null, !8, !47, [4 x %struct.amino_acid]* @homo_sapiens, null} ; [ DW_TAG_variable ] [homo_sapiens] [line 131] [def]
!113 = !{!"0x34\00alu\00alu\00\00159\001\001", null, !8, !114, [288 x i8]* @alu, null} ; [ DW_TAG_variable ] [alu] [line 159] [local] [def]
!114 = !{!"0x1\00\000\002304\008\000\000\000", null, null, !18, !115, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2304, align 8, offset 0] [from ]
!115 = !{!116}
!116 = !{!"0x21\000\00288"}                       ; [ DW_TAG_subrange_type ] [0, 287]
!117 = !{i32 2, !"Dwarf Version", i32 4}
!118 = !{i32 2, !"Debug Info Version", i32 2}
!119 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!120 = !{!"0x101\00random\0016777243\000", !7, !8, !11} ; [ DW_TAG_arg_variable ] [random] [line 27]
!121 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!122 = !MDLocation(line: 27, column: 23, scope: !7)
!123 = !MDLocation(line: 28, column: 6, scope: !7)
!124 = !MDLocation(line: 28, column: 5, scope: !7)
!125 = !MDLocation(line: 29, column: 1, scope: !7)
!126 = !{!"0x101\00alu\0016777263\000", !14, !8, !17} ; [ DW_TAG_arg_variable ] [alu] [line 47]
!127 = !MDLocation(line: 47, column: 20, scope: !14)
!128 = !{!"0x101\00title\0033554479\000", !14, !8, !17} ; [ DW_TAG_arg_variable ] [title] [line 47]
!129 = !MDLocation(line: 47, column: 37, scope: !14)
!130 = !{!"0x101\00n\0050331695\000", !14, !8, !20} ; [ DW_TAG_arg_variable ] [n] [line 47]
!131 = !MDLocation(line: 47, column: 48, scope: !14)
!132 = !{!"0x100\00len\0048\000", !14, !8, !20}   ; [ DW_TAG_auto_variable ] [len] [line 48]
!133 = !MDLocation(line: 48, column: 9, scope: !14)
!134 = !MDLocation(line: 48, column: 22, scope: !14)
!135 = !MDLocation(line: 48, column: 15, scope: !14)
!136 = !MDLocation(line: 49, column: 17, scope: !14)
!137 = !MDLocation(line: 49, column: 5, scope: !14)
!138 = !{!"0x100\00buffer\0049\008192", !14, !8, !139} ; [ DW_TAG_auto_variable ] [buffer] [line 49]
!139 = !{!"0x1\00\000\000\008\000\000\000", null, null, !19, !140, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 8, offset 0] [from char]
!140 = !{!141}
!141 = !{!"0x21\000\00-1"}                        ; [ DW_TAG_subrange_type ] [unbounded]
!142 = !MDLocation(line: 49, column: 10, scope: !14)
!143 = !{!"0x100\00pos\0050\000", !14, !8, !20}   ; [ DW_TAG_auto_variable ] [pos] [line 50]
!144 = !MDLocation(line: 50, column: 9, scope: !14)
!145 = !MDLocation(line: 52, column: 20, scope: !14)
!146 = !MDLocation(line: 52, column: 25, scope: !14)
!147 = !MDLocation(line: 52, column: 5, scope: !14)
!148 = !MDLocation(line: 53, column: 21, scope: !14)
!149 = !MDLocation(line: 53, column: 12, scope: !14)
!150 = !MDLocation(line: 53, column: 26, scope: !14)
!151 = !MDLocation(line: 53, column: 5, scope: !14)
!152 = !MDLocation(line: 55, column: 20, scope: !14)
!153 = !MDLocation(line: 55, column: 27, scope: !14)
!154 = !MDLocation(line: 55, column: 5, scope: !14)
!155 = !MDLocation(line: 56, column: 5, scope: !14)
!156 = !MDLocation(line: 56, column: 12, scope: !157)
!157 = !{!"0xb\002", !1, !158}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!158 = !{!"0xb\001", !1, !14}                     ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!159 = !{!"0x100\00bytes\0057\000", !160, !8, !20} ; [ DW_TAG_auto_variable ] [bytes] [line 57]
!160 = !{!"0xb\0056\0019\000", !1, !14}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!161 = !MDLocation(line: 57, column: 13, scope: !160)
!162 = !MDLocation(line: 57, column: 21, scope: !160)
!163 = !MDLocation(line: 57, column: 21, scope: !164)
!164 = !{!"0xb\001", !1, !160}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!165 = !MDLocation(line: 57, column: 47, scope: !166)
!166 = !{!"0xb\002", !1, !160}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!167 = !MDLocation(line: 57, column: 13, scope: !168)
!168 = !{!"0xb\004", !1, !169}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!169 = !{!"0xb\003", !1, !160}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!170 = !MDLocation(line: 59, column: 34, scope: !160)
!171 = !MDLocation(line: 59, column: 25, scope: !160)
!172 = !MDLocation(line: 59, column: 39, scope: !160)
!173 = !MDLocation(line: 59, column: 49, scope: !160)
!174 = !MDLocation(line: 59, column: 9, scope: !160)
!175 = !MDLocation(line: 60, column: 16, scope: !160)
!176 = !MDLocation(line: 60, column: 9, scope: !160)
!177 = !MDLocation(line: 61, column: 13, scope: !178)
!178 = !{!"0xb\0061\0013\001", !1, !160}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!179 = !MDLocation(line: 61, column: 19, scope: !178)
!180 = !MDLocation(line: 61, column: 13, scope: !160)
!181 = !MDLocation(line: 62, column: 20, scope: !182)
!182 = !{!"0xb\0061\0024\002", !1, !178}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!183 = !MDLocation(line: 62, column: 13, scope: !182)
!184 = !MDLocation(line: 63, column: 9, scope: !182)
!185 = !MDLocation(line: 64, column: 30, scope: !160)
!186 = !MDLocation(line: 64, column: 9, scope: !160)
!187 = !MDLocation(line: 65, column: 14, scope: !160)
!188 = !MDLocation(line: 65, column: 9, scope: !160)
!189 = !MDLocation(line: 67, column: 1, scope: !14)
!190 = !{!"0x101\00lookup\0016777296\000", !21, !8, !25} ; [ DW_TAG_arg_variable ] [lookup] [line 80]
!191 = !MDLocation(line: 80, column: 33, scope: !21)
!192 = !{!"0x101\00amino_acid\0033554512\000", !21, !8, !26} ; [ DW_TAG_arg_variable ] [amino_acid] [line 80]
!193 = !MDLocation(line: 80, column: 60, scope: !21)
!194 = !{!"0x101\00amino_acid_size\0050331728\000", !21, !8, !20} ; [ DW_TAG_arg_variable ] [amino_acid_size] [line 80]
!195 = !MDLocation(line: 80, column: 76, scope: !21)
!196 = !{!"0x100\00p\0081\000", !21, !8, !4}      ; [ DW_TAG_auto_variable ] [p] [line 81]
!197 = !MDLocation(line: 81, column: 11, scope: !21)
!198 = !{!"0x100\00i\0082\000", !199, !8, !20}    ; [ DW_TAG_auto_variable ] [i] [line 82]
!199 = !{!"0xb\0082\005\003", !1, !21}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!200 = !MDLocation(line: 82, column: 14, scope: !199)
!201 = !MDLocation(line: 82, column: 10, scope: !199)
!202 = !MDLocation(line: 82, column: 21, scope: !203)
!203 = !{!"0xb\002", !1, !204}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!204 = !{!"0xb\001", !1, !205}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!205 = !{!"0xb\0082\005\004", !1, !199}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!206 = !MDLocation(line: 82, column: 25, scope: !205)
!207 = !MDLocation(line: 82, column: 21, scope: !205)
!208 = !MDLocation(line: 82, column: 5, scope: !199)
!209 = !MDLocation(line: 83, column: 25, scope: !210)
!210 = !{!"0xb\0082\0047\005", !1, !205}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!211 = !MDLocation(line: 83, column: 14, scope: !210)
!212 = !MDLocation(line: 83, column: 9, scope: !210)
!213 = !MDLocation(line: 84, column: 38, scope: !210)
!214 = !MDLocation(line: 84, column: 20, scope: !210)
!215 = !MDLocation(line: 84, column: 9, scope: !210)
!216 = !MDLocation(line: 85, column: 5, scope: !210)
!217 = !MDLocation(line: 82, column: 42, scope: !205)
!218 = !MDLocation(line: 82, column: 5, scope: !205)
!219 = !MDLocation(line: 88, column: 16, scope: !21)
!220 = !MDLocation(line: 88, column: 5, scope: !21)
!221 = !{!"0x100\00i\0090\000", !222, !8, !20}    ; [ DW_TAG_auto_variable ] [i] [line 90]
!222 = !{!"0xb\0090\005\006", !1, !21}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!223 = !MDLocation(line: 90, column: 14, scope: !222)
!224 = !{!"0x100\00j\0090\000", !222, !8, !20}    ; [ DW_TAG_auto_variable ] [j] [line 90]
!225 = !MDLocation(line: 90, column: 21, scope: !222)
!226 = !MDLocation(line: 90, column: 10, scope: !222)
!227 = !MDLocation(line: 90, column: 28, scope: !228)
!228 = !{!"0xb\002", !1, !229}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!229 = !{!"0xb\001", !1, !230}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!230 = !{!"0xb\0090\005\007", !1, !222}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!231 = !MDLocation(line: 90, column: 5, scope: !222)
!232 = !MDLocation(line: 91, column: 9, scope: !233)
!233 = !{!"0xb\0090\0050\008", !1, !230}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!234 = !MDLocation(line: 91, column: 27, scope: !235)
!235 = !{!"0xb\002", !1, !236}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!236 = !{!"0xb\001", !1, !233}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!237 = !MDLocation(line: 91, column: 16, scope: !233)
!238 = !MDLocation(line: 91, column: 45, scope: !233)
!239 = !MDLocation(line: 92, column: 13, scope: !240)
!240 = !{!"0xb\0091\0048\009", !1, !233}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!241 = !MDLocation(line: 94, column: 33, scope: !233)
!242 = !MDLocation(line: 94, column: 21, scope: !233)
!243 = !MDLocation(line: 94, column: 22, scope: !233)
!244 = !MDLocation(line: 94, column: 16, scope: !233)
!245 = !MDLocation(line: 94, column: 9, scope: !233)
!246 = !MDLocation(line: 95, column: 5, scope: !233)
!247 = !MDLocation(line: 90, column: 45, scope: !230)
!248 = !MDLocation(line: 90, column: 5, scope: !230)
!249 = !MDLocation(line: 97, column: 5, scope: !21)
!250 = !{!"0x101\00amino_acid\0016777317\000", !32, !8, !26} ; [ DW_TAG_arg_variable ] [amino_acid] [line 101]
!251 = !MDLocation(line: 101, column: 30, scope: !32)
!252 = !{!"0x101\00amino_acid_size\0033554533\000", !32, !8, !20} ; [ DW_TAG_arg_variable ] [amino_acid_size] [line 101]
!253 = !MDLocation(line: 101, column: 46, scope: !32)
!254 = !{!"0x101\00title\0050331750\000", !32, !8, !17} ; [ DW_TAG_arg_variable ] [title] [line 102]
!255 = !MDLocation(line: 102, column: 21, scope: !32)
!256 = !{!"0x101\00n\0067108966\000", !32, !8, !20} ; [ DW_TAG_arg_variable ] [n] [line 102]
!257 = !MDLocation(line: 102, column: 32, scope: !32)
!258 = !{!"0x101\00rand\0083886182\000", !32, !8, !11} ; [ DW_TAG_arg_variable ] [rand] [line 102]
!259 = !MDLocation(line: 102, column: 45, scope: !32)
!260 = !{!"0x100\00lookup\00103\000", !32, !8, !261} ; [ DW_TAG_auto_variable ] [lookup] [line 103]
!261 = !{!"0x1\00\000\00262144\0064\000\000\000", null, null, !26, !262, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 262144, align 64, offset 0] [from ]
!262 = !{!263}
!263 = !{!"0x21\000\004096"}                      ; [ DW_TAG_subrange_type ] [0, 4095]
!264 = !MDLocation(line: 103, column: 24, scope: !32)
!265 = !{!"0x100\00line_buffer\00104\000", !32, !8, !266} ; [ DW_TAG_auto_variable ] [line_buffer] [line 104]
!266 = !{!"0x1\00\000\00488\008\000\000\000", null, null, !19, !267, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 488, align 8, offset 0] [from char]
!267 = !{!268}
!268 = !{!"0x21\000\0061"}                        ; [ DW_TAG_subrange_type ] [0, 60]
!269 = !MDLocation(line: 104, column: 10, scope: !32)
!270 = !{!"0x100\00i\00105\000", !32, !8, !20}    ; [ DW_TAG_auto_variable ] [i] [line 105]
!271 = !MDLocation(line: 105, column: 9, scope: !32)
!272 = !{!"0x100\00j\00105\000", !32, !8, !20}    ; [ DW_TAG_auto_variable ] [j] [line 105]
!273 = !MDLocation(line: 105, column: 12, scope: !32)
!274 = !MDLocation(line: 107, column: 5, scope: !32)
!275 = !MDLocation(line: 109, column: 17, scope: !32)
!276 = !MDLocation(line: 109, column: 25, scope: !32)
!277 = !MDLocation(line: 109, column: 37, scope: !32)
!278 = !MDLocation(line: 109, column: 5, scope: !32)
!279 = !MDLocation(line: 111, column: 20, scope: !32)
!280 = !MDLocation(line: 111, column: 27, scope: !32)
!281 = !MDLocation(line: 111, column: 5, scope: !32)
!282 = !MDLocation(line: 113, column: 10, scope: !283)
!283 = !{!"0xb\00113\005\0010", !1, !32}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!284 = !MDLocation(line: 113, column: 17, scope: !283)
!285 = !MDLocation(line: 113, column: 24, scope: !286)
!286 = !{!"0xb\002", !1, !287}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!287 = !{!"0xb\001", !1, !288}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!288 = !{!"0xb\00113\005\0011", !1, !283}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!289 = !MDLocation(line: 113, column: 28, scope: !288)
!290 = !MDLocation(line: 113, column: 24, scope: !288)
!291 = !MDLocation(line: 113, column: 5, scope: !283)
!292 = !MDLocation(line: 114, column: 13, scope: !293)
!293 = !{!"0xb\00114\0013\0013", !1, !294}        ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!294 = !{!"0xb\00113\0041\0012", !1, !288}        ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!295 = !MDLocation(line: 114, column: 13, scope: !294)
!296 = !MDLocation(line: 115, column: 29, scope: !297)
!297 = !{!"0xb\00114\0028\0014", !1, !293}        ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!298 = !MDLocation(line: 115, column: 59, scope: !297)
!299 = !MDLocation(line: 115, column: 13, scope: !297)
!300 = !MDLocation(line: 116, column: 13, scope: !297)
!301 = !MDLocation(line: 117, column: 9, scope: !297)
!302 = !{!"0x100\00r\00119\000", !294, !8, !4}    ; [ DW_TAG_auto_variable ] [r] [line 119]
!303 = !MDLocation(line: 119, column: 15, scope: !294)
!304 = !MDLocation(line: 119, column: 38, scope: !294)
!305 = !MDLocation(line: 119, column: 19, scope: !294)
!306 = !{!"0x100\00u\00120\000", !294, !8, !26}   ; [ DW_TAG_auto_variable ] [u] [line 120]
!307 = !MDLocation(line: 120, column: 28, scope: !294)
!308 = !MDLocation(line: 120, column: 46, scope: !294)
!309 = !MDLocation(line: 120, column: 39, scope: !294)
!310 = !MDLocation(line: 120, column: 32, scope: !294)
!311 = !MDLocation(line: 121, column: 9, scope: !294)
!312 = !MDLocation(line: 121, column: 16, scope: !313)
!313 = !{!"0xb\002", !1, !314}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!314 = !{!"0xb\001", !1, !294}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!315 = !MDLocation(line: 122, column: 13, scope: !316)
!316 = !{!"0xb\00121\0047\0015", !1, !294}        ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!317 = !MDLocation(line: 124, column: 26, scope: !294)
!318 = !MDLocation(line: 124, column: 21, scope: !294)
!319 = !MDLocation(line: 124, column: 9, scope: !294)
!320 = !MDLocation(line: 125, column: 5, scope: !294)
!321 = !MDLocation(line: 113, column: 31, scope: !288)
!322 = !MDLocation(line: 113, column: 36, scope: !288)
!323 = !MDLocation(line: 113, column: 5, scope: !288)
!324 = !MDLocation(line: 126, column: 17, scope: !32)
!325 = !MDLocation(line: 126, column: 5, scope: !32)
!326 = !MDLocation(line: 127, column: 21, scope: !32)
!327 = !MDLocation(line: 127, column: 34, scope: !32)
!328 = !MDLocation(line: 127, column: 44, scope: !32)
!329 = !MDLocation(line: 127, column: 5, scope: !32)
!330 = !MDLocation(line: 128, column: 1, scope: !32)
!331 = !{!"0x101\00random\0016777250\000", !38, !8, !11} ; [ DW_TAG_arg_variable ] [random] [line 34]
!332 = !MDLocation(line: 34, column: 30, scope: !38)
!333 = !MDLocation(line: 35, column: 17, scope: !38)
!334 = !MDLocation(line: 35, column: 16, scope: !38)
!335 = !MDLocation(line: 35, column: 15, scope: !38)
!336 = !MDLocation(line: 35, column: 6, scope: !38)
!337 = !MDLocation(line: 35, column: 5, scope: !38)
!338 = !MDLocation(line: 37, column: 14, scope: !38)
!339 = !MDLocation(line: 37, column: 13, scope: !38)
!340 = !MDLocation(line: 37, column: 12, scope: !38)
!341 = !MDLocation(line: 37, column: 5, scope: !38)
!342 = !{!"0x101\00inputN\0016777384\000", !35, !8, !20} ; [ DW_TAG_arg_variable ] [inputN] [line 168]
!343 = !MDLocation(line: 168, column: 15, scope: !35)
!344 = !{!"0x100\00n\00169\000", !35, !8, !20}    ; [ DW_TAG_auto_variable ] [n] [line 169]
!345 = !MDLocation(line: 169, column: 9, scope: !35)
!346 = !MDLocation(line: 171, column: 9, scope: !347)
!347 = !{!"0xb\00171\009\0016", !1, !35}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!348 = !MDLocation(line: 171, column: 9, scope: !35)
!349 = !MDLocation(line: 171, column: 25, scope: !350)
!350 = !{!"0xb\001", !1, !347}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!351 = !MDLocation(line: 171, column: 21, scope: !347)
!352 = !{!"0x100\00filename\00173\000", !35, !8, !353} ; [ DW_TAG_auto_variable ] [filename] [line 173]
!353 = !{!"0x1\00\000\00512\008\000\000\000", null, null, !19, !354, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!354 = !{!355}
!355 = !{!"0x21\000\0064"}                        ; [ DW_TAG_subrange_type ] [0, 63]
!356 = !MDLocation(line: 173, column: 10, scope: !35)
!357 = !MDLocation(line: 174, column: 13, scope: !35)
!358 = !MDLocation(line: 174, column: 45, scope: !35)
!359 = !MDLocation(line: 174, column: 5, scope: !35)
!360 = !MDLocation(line: 175, column: 23, scope: !35)
!361 = !MDLocation(line: 175, column: 17, scope: !35)
!362 = !MDLocation(line: 175, column: 5, scope: !35)
!363 = !MDLocation(line: 178, column: 5, scope: !35)
!364 = !MDLocation(line: 179, column: 5, scope: !35)
!365 = !{!"0x100\00rand\00181\000", !35, !8, !12} ; [ DW_TAG_auto_variable ] [rand] [line 181]
!366 = !MDLocation(line: 181, column: 14, scope: !35)
!367 = !MDLocation(line: 183, column: 5, scope: !35)
!368 = !MDLocation(line: 185, column: 44, scope: !35)
!369 = !MDLocation(line: 185, column: 5, scope: !35)
!370 = !MDLocation(line: 187, column: 43, scope: !35)
!371 = !MDLocation(line: 186, column: 5, scope: !35)
!372 = !MDLocation(line: 189, column: 48, scope: !35)
!373 = !MDLocation(line: 188, column: 5, scope: !35)
!374 = !MDLocation(line: 191, column: 12, scope: !35)
!375 = !MDLocation(line: 191, column: 5, scope: !35)
!376 = !MDLocation(line: 193, column: 5, scope: !35)
