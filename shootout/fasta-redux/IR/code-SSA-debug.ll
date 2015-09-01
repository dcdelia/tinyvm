; ModuleID = 'code.ll'
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
  call void @llvm.dbg.value(metadata i32* %random, i64 0, metadata !120, metadata !121), !dbg !122
  store i32 42, i32* %random, align 4, !dbg !123
  ret void, !dbg !124
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @repeat(i8* %alu, i8* %title, i32 %n) #0 {
  call void @llvm.dbg.value(metadata i8* %alu, i64 0, metadata !125, metadata !121), !dbg !126
  call void @llvm.dbg.value(metadata i8* %title, i64 0, metadata !127, metadata !121), !dbg !128
  call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !129, metadata !121), !dbg !130
  %1 = call i64 @strlen(i8* %alu) #7, !dbg !131
  %2 = trunc i64 %1 to i32, !dbg !131
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !132, metadata !121), !dbg !133
  %3 = add nsw i32 %2, 60, !dbg !134
  %4 = zext i32 %3 to i64, !dbg !135
  %5 = call i8* @llvm.stacksave(), !dbg !135
  %6 = alloca i8, i64 %4, align 16, !dbg !135
  call void @llvm.dbg.declare(metadata i8* %6, metadata !136, metadata !121), !dbg !140
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !141, metadata !121), !dbg !142
  %7 = sext i32 %2 to i64, !dbg !143
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %alu, i64 %7, i32 1, i1 false), !dbg !144
  %8 = sext i32 %2 to i64, !dbg !145
  %9 = getelementptr inbounds i8* %6, i64 %8, !dbg !145
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %alu, i64 60, i32 1, i1 false), !dbg !146
  %10 = load %struct._IO_FILE** @outStream, align 8, !dbg !147
  %11 = call i32 (i8*, %struct._IO_FILE*, ...)* bitcast (i32 (...)* @fputs_unlocked to i32 (i8*, %struct._IO_FILE*, ...)*)(i8* %title, %struct._IO_FILE* %10), !dbg !148
  br label %12, !dbg !149

; <label>:12                                      ; preds = %29, %0
  %.0 = phi i32 [ %n, %0 ], [ %32, %29 ]
  %pos.0 = phi i32 [ 0, %0 ], [ %pos.1, %29 ]
  %13 = icmp sgt i32 %.0, 0, !dbg !150
  br i1 %13, label %14, label %33, !dbg !149

; <label>:14                                      ; preds = %12
  %15 = icmp sgt i32 %.0, 60, !dbg !153
  br i1 %15, label %16, label %17, !dbg !153

; <label>:16                                      ; preds = %14
  br label %18, !dbg !155

; <label>:17                                      ; preds = %14
  br label %18, !dbg !153

; <label>:18                                      ; preds = %17, %16
  %19 = phi i32 [ 60, %16 ], [ %.0, %17 ], !dbg !153
  call void @llvm.dbg.value(metadata i32 %19, i64 0, metadata !157, metadata !121), !dbg !158
  %20 = sext i32 %pos.0 to i64, !dbg !159
  %21 = getelementptr inbounds i8* %6, i64 %20, !dbg !159
  %22 = sext i32 %19 to i64, !dbg !160
  %23 = load %struct._IO_FILE** @outStream, align 8, !dbg !161
  %24 = call i64 @fwrite_unlocked(i8* %21, i64 %22, i64 1, %struct._IO_FILE* %23), !dbg !162
  %25 = add nsw i32 %pos.0, %19, !dbg !163
  call void @llvm.dbg.value(metadata i32 %25, i64 0, metadata !141, metadata !121), !dbg !142
  %26 = icmp sgt i32 %25, %2, !dbg !164
  br i1 %26, label %27, label %29, !dbg !166

; <label>:27                                      ; preds = %18
  %28 = sub nsw i32 %25, %2, !dbg !167
  call void @llvm.dbg.value(metadata i32 %28, i64 0, metadata !141, metadata !121), !dbg !142
  br label %29, !dbg !169

; <label>:29                                      ; preds = %27, %18
  %pos.1 = phi i32 [ %28, %27 ], [ %25, %18 ]
  %30 = load %struct._IO_FILE** @outStream, align 8, !dbg !170
  %31 = call i32 @fputc_unlocked(i32 10, %struct._IO_FILE* %30), !dbg !171
  %32 = sub nsw i32 %.0, %19, !dbg !172
  call void @llvm.dbg.value(metadata i32 %32, i64 0, metadata !129, metadata !121), !dbg !130
  br label %12, !dbg !149

; <label>:33                                      ; preds = %12
  call void @llvm.stackrestore(i8* %5), !dbg !173
  ret void, !dbg !173
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
  call void @llvm.dbg.value(metadata %struct.amino_acid** %lookup, i64 0, metadata !174, metadata !121), !dbg !175
  call void @llvm.dbg.value(metadata %struct.amino_acid* %amino_acid, i64 0, metadata !176, metadata !121), !dbg !177
  call void @llvm.dbg.value(metadata i32 %amino_acid_size, i64 0, metadata !178, metadata !121), !dbg !179
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !180, metadata !121), !dbg !181
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !182, metadata !121), !dbg !184
  br label %1, !dbg !185

; <label>:1                                       ; preds = %13, %0
  %p.0 = phi float [ 0.000000e+00, %0 ], [ %8, %13 ]
  %i.0 = phi i32 [ 0, %0 ], [ %14, %13 ]
  %2 = icmp slt i32 %i.0, %amino_acid_size, !dbg !186
  br i1 %2, label %3, label %15, !dbg !188

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64, !dbg !189
  %5 = getelementptr inbounds %struct.amino_acid* %amino_acid, i64 %4, !dbg !189
  %6 = getelementptr inbounds %struct.amino_acid* %5, i32 0, i32 1, !dbg !189
  %7 = load float* %6, align 4, !dbg !189
  %8 = fadd float %p.0, %7, !dbg !191
  call void @llvm.dbg.value(metadata float %8, i64 0, metadata !180, metadata !121), !dbg !181
  %9 = fmul float %8, 4.095000e+03, !dbg !192
  %10 = sext i32 %i.0 to i64, !dbg !193
  %11 = getelementptr inbounds %struct.amino_acid* %amino_acid, i64 %10, !dbg !193
  %12 = getelementptr inbounds %struct.amino_acid* %11, i32 0, i32 2, !dbg !193
  store float %9, float* %12, align 4, !dbg !193
  br label %13, !dbg !194

; <label>:13                                      ; preds = %3
  %14 = add nsw i32 %i.0, 1, !dbg !195
  call void @llvm.dbg.value(metadata i32 %14, i64 0, metadata !182, metadata !121), !dbg !184
  br label %1, !dbg !196

; <label>:15                                      ; preds = %1
  %16 = sub nsw i32 %amino_acid_size, 1, !dbg !197
  %17 = sext i32 %16 to i64, !dbg !198
  %18 = getelementptr inbounds %struct.amino_acid* %amino_acid, i64 %17, !dbg !198
  %19 = getelementptr inbounds %struct.amino_acid* %18, i32 0, i32 2, !dbg !198
  store float 4.095000e+03, float* %19, align 4, !dbg !198
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !199, metadata !121), !dbg !201
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !202, metadata !121), !dbg !203
  br label %20, !dbg !204

; <label>:20                                      ; preds = %37, %15
  %i1.0 = phi i32 [ 0, %15 ], [ %38, %37 ]
  %j.0 = phi i32 [ 0, %15 ], [ %j.1, %37 ]
  %21 = icmp slt i32 %i1.0, 4096, !dbg !205
  br i1 %21, label %22, label %39, !dbg !209

; <label>:22                                      ; preds = %20
  br label %23, !dbg !210

; <label>:23                                      ; preds = %30, %22
  %j.1 = phi i32 [ %j.0, %22 ], [ %31, %30 ]
  %24 = sext i32 %j.1 to i64, !dbg !212
  %25 = getelementptr inbounds %struct.amino_acid* %amino_acid, i64 %24, !dbg !212
  %26 = getelementptr inbounds %struct.amino_acid* %25, i32 0, i32 2, !dbg !212
  %27 = load float* %26, align 4, !dbg !212
  %28 = sitofp i32 %i1.0 to float, !dbg !213
  %29 = fcmp olt float %27, %28, !dbg !212
  br i1 %29, label %30, label %32, !dbg !210

; <label>:30                                      ; preds = %23
  %31 = add nsw i32 %j.1, 1, !dbg !214
  call void @llvm.dbg.value(metadata i32 %31, i64 0, metadata !202, metadata !121), !dbg !203
  br label %23, !dbg !210

; <label>:32                                      ; preds = %23
  %33 = sext i32 %j.1 to i64, !dbg !216
  %34 = getelementptr inbounds %struct.amino_acid* %amino_acid, i64 %33, !dbg !216
  %35 = sext i32 %i1.0 to i64, !dbg !217
  %36 = getelementptr inbounds %struct.amino_acid** %lookup, i64 %35, !dbg !217
  store %struct.amino_acid* %34, %struct.amino_acid** %36, align 8, !dbg !217
  br label %37, !dbg !218

; <label>:37                                      ; preds = %32
  %38 = add nsw i32 %i1.0, 1, !dbg !219
  call void @llvm.dbg.value(metadata i32 %38, i64 0, metadata !199, metadata !121), !dbg !201
  br label %20, !dbg !220

; <label>:39                                      ; preds = %20
  ret i8* null, !dbg !221
}

; Function Attrs: nounwind uwtable
define void @randomize(%struct.amino_acid* %amino_acid, i32 %amino_acid_size, i8* %title, i32 %n, i32* %rand) #0 {
  %lookup = alloca [4096 x %struct.amino_acid*], align 16
  %line_buffer = alloca [61 x i8], align 16
  call void @llvm.dbg.value(metadata %struct.amino_acid* %amino_acid, i64 0, metadata !222, metadata !121), !dbg !223
  call void @llvm.dbg.value(metadata i32 %amino_acid_size, i64 0, metadata !224, metadata !121), !dbg !225
  call void @llvm.dbg.value(metadata i8* %title, i64 0, metadata !226, metadata !121), !dbg !227
  call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !228, metadata !121), !dbg !229
  call void @llvm.dbg.value(metadata i32* %rand, i64 0, metadata !230, metadata !121), !dbg !231
  call void @llvm.dbg.declare(metadata [4096 x %struct.amino_acid*]* %lookup, metadata !232, metadata !121), !dbg !236
  call void @llvm.dbg.declare(metadata [61 x i8]* %line_buffer, metadata !237, metadata !121), !dbg !241
  %1 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i64 60, !dbg !242
  store i8 10, i8* %1, align 1, !dbg !242
  %2 = getelementptr inbounds [4096 x %struct.amino_acid*]* %lookup, i32 0, i32 0, !dbg !243
  %3 = call i8* @fill_lookup(%struct.amino_acid** %2, %struct.amino_acid* %amino_acid, i32 %amino_acid_size), !dbg !244
  %4 = load %struct._IO_FILE** @outStream, align 8, !dbg !245
  %5 = call i32 (i8*, %struct._IO_FILE*, ...)* bitcast (i32 (...)* @fputs_unlocked to i32 (i8*, %struct._IO_FILE*, ...)*)(i8* %title, %struct._IO_FILE* %4), !dbg !246
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !247, metadata !121), !dbg !248
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !249, metadata !121), !dbg !250
  br label %6, !dbg !251

; <label>:6                                       ; preds = %35, %0
  %i.0 = phi i32 [ 0, %0 ], [ %36, %35 ]
  %j.0 = phi i32 [ 0, %0 ], [ %37, %35 ]
  %7 = icmp slt i32 %i.0, %n, !dbg !253
  br i1 %7, label %8, label %38, !dbg !255

; <label>:8                                       ; preds = %6
  %9 = icmp eq i32 %j.0, 60, !dbg !256
  br i1 %9, label %10, label %14, !dbg !259

; <label>:10                                      ; preds = %8
  %11 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i32 0, !dbg !260
  %12 = load %struct._IO_FILE** @outStream, align 8, !dbg !262
  %13 = call i64 @fwrite_unlocked(i8* %11, i64 61, i64 1, %struct._IO_FILE* %12), !dbg !263
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !249, metadata !121), !dbg !250
  br label %14, !dbg !264

; <label>:14                                      ; preds = %10, %8
  %j.1 = phi i32 [ 0, %10 ], [ %j.0, %8 ]
  %15 = call float @random_next_lookup(i32* %rand), !dbg !265
  call void @llvm.dbg.value(metadata float %15, i64 0, metadata !266, metadata !121), !dbg !267
  %16 = fptosi float %15 to i16, !dbg !268
  %17 = sext i16 %16 to i64, !dbg !269
  %18 = getelementptr inbounds [4096 x %struct.amino_acid*]* %lookup, i32 0, i64 %17, !dbg !269
  %19 = load %struct.amino_acid** %18, align 8, !dbg !269
  call void @llvm.dbg.value(metadata %struct.amino_acid* %19, i64 0, metadata !270, metadata !121), !dbg !271
  br label %20, !dbg !272

; <label>:20                                      ; preds = %28, %14
  %u.0 = phi %struct.amino_acid* [ %19, %14 ], [ %29, %28 ]
  %21 = getelementptr inbounds %struct.amino_acid* %u.0, i32 0, i32 2, !dbg !273
  %22 = load float* %21, align 4, !dbg !273
  %23 = fcmp olt float %22, %15, !dbg !273
  %24 = zext i1 %23 to i32, !dbg !273
  %25 = sext i32 %24 to i64, !dbg !273
  %26 = call i64 @llvm.expect.i64(i64 %25, i64 0), !dbg !273
  %27 = icmp ne i64 %26, 0, !dbg !272
  br i1 %27, label %28, label %30, !dbg !272

; <label>:28                                      ; preds = %20
  %29 = getelementptr inbounds %struct.amino_acid* %u.0, i32 1, !dbg !276
  call void @llvm.dbg.value(metadata %struct.amino_acid* %29, i64 0, metadata !270, metadata !121), !dbg !271
  br label %20, !dbg !272

; <label>:30                                      ; preds = %20
  %31 = getelementptr inbounds %struct.amino_acid* %u.0, i32 0, i32 0, !dbg !278
  %32 = load i8* %31, align 1, !dbg !278
  %33 = sext i32 %j.1 to i64, !dbg !279
  %34 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i64 %33, !dbg !279
  store i8 %32, i8* %34, align 1, !dbg !279
  br label %35, !dbg !280

; <label>:35                                      ; preds = %30
  %36 = add nsw i32 %i.0, 1, !dbg !281
  call void @llvm.dbg.value(metadata i32 %36, i64 0, metadata !247, metadata !121), !dbg !248
  %37 = add nsw i32 %j.1, 1, !dbg !282
  call void @llvm.dbg.value(metadata i32 %37, i64 0, metadata !249, metadata !121), !dbg !250
  br label %6, !dbg !283

; <label>:38                                      ; preds = %6
  %39 = sext i32 %j.0 to i64, !dbg !284
  %40 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i64 %39, !dbg !284
  store i8 10, i8* %40, align 1, !dbg !284
  %41 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i32 0, !dbg !285
  %42 = add nsw i32 %j.0, 1, !dbg !286
  %43 = sext i32 %42 to i64, !dbg !286
  %44 = load %struct._IO_FILE** @outStream, align 8, !dbg !287
  %45 = call i64 @fwrite_unlocked(i8* %41, i64 %43, i64 1, %struct._IO_FILE* %44), !dbg !288
  ret void, !dbg !289
}

; Function Attrs: inlinehint nounwind uwtable
define internal float @random_next_lookup(i32* %random) #5 {
  call void @llvm.dbg.value(metadata i32* %random, i64 0, metadata !290, metadata !121), !dbg !291
  %1 = load i32* %random, align 4, !dbg !292
  %2 = mul i32 %1, 3877, !dbg !292
  %3 = add i32 %2, 29573, !dbg !292
  %4 = urem i32 %3, 139968, !dbg !293
  store i32 %4, i32* %random, align 4, !dbg !294
  %5 = load i32* %random, align 4, !dbg !295
  %6 = uitofp i32 %5 to float, !dbg !296
  %7 = fmul float %6, 0x3F9DF57700000000, !dbg !296
  ret float %7, !dbg !297
}

; Function Attrs: nounwind readnone
declare i64 @llvm.expect.i64(i64, i64) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %filename = alloca [64 x i8], align 16
  %rand = alloca i32, align 4
  call void @llvm.dbg.value(metadata i32 %inputN, i64 0, metadata !298, metadata !121), !dbg !299
  call void @llvm.dbg.value(metadata i32 512, i64 0, metadata !300, metadata !121), !dbg !301
  %1 = icmp sgt i32 %inputN, 1, !dbg !302
  br i1 %1, label %2, label %3, !dbg !304

; <label>:2                                       ; preds = %0
  call void @llvm.dbg.value(metadata i32 %inputN, i64 0, metadata !300, metadata !121), !dbg !301
  br label %3, !dbg !305

; <label>:3                                       ; preds = %2, %0
  %n.0 = phi i32 [ %inputN, %2 ], [ 512, %0 ]
  call void @llvm.dbg.declare(metadata [64 x i8]* %filename, metadata !306, metadata !121), !dbg !310
  %4 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0, !dbg !311
  %5 = call i32 (i8*, i8*, ...)* @sprintf(i8* %4, i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %n.0) #3, !dbg !312
  %6 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0, !dbg !313
  %7 = call %struct._IO_FILE* @fopen(i8* %6, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0)), !dbg !314
  store %struct._IO_FILE* %7, %struct._IO_FILE** @outStream, align 8, !dbg !315
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([15 x %struct.amino_acid]* @amino_acid, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([15 x %struct.amino_acid]* @amino_acid_orig, i32 0, i32 0, i32 0), i64 180, i32 16, i1 false), !dbg !316
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([4 x %struct.amino_acid]* @homo_sapiens, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([4 x %struct.amino_acid]* @homo_sapiens_orig, i32 0, i32 0, i32 0), i64 48, i32 16, i1 false), !dbg !317
  call void @llvm.dbg.declare(metadata i32* %rand, metadata !318, metadata !121), !dbg !319
  call void @random_init(i32* %rand), !dbg !320
  %8 = mul nsw i32 %n.0, 2, !dbg !321
  call void @repeat(i8* getelementptr inbounds ([288 x i8]* @alu, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %8), !dbg !322
  %9 = mul nsw i32 %n.0, 3, !dbg !323
  call void @randomize(%struct.amino_acid* getelementptr inbounds ([15 x %struct.amino_acid]* @amino_acid, i32 0, i32 0), i32 15, i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %9, i32* %rand), !dbg !324
  %10 = mul nsw i32 %n.0, 5, !dbg !325
  call void @randomize(%struct.amino_acid* getelementptr inbounds ([4 x %struct.amino_acid]* @homo_sapiens, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([31 x i8]* @.str4, i32 0, i32 0), i32 %10, i32* %rand), !dbg !326
  %11 = load %struct._IO_FILE** @outStream, align 8, !dbg !327
  %12 = call i32 @fclose(%struct._IO_FILE* %11), !dbg !328
  ret i32 0, !dbg !329
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #6

declare %struct._IO_FILE* @fopen(i8*, i8*) #4

declare i32 @fclose(%struct._IO_FILE*) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

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
!123 = !MDLocation(line: 28, column: 5, scope: !7)
!124 = !MDLocation(line: 29, column: 1, scope: !7)
!125 = !{!"0x101\00alu\0016777263\000", !14, !8, !17} ; [ DW_TAG_arg_variable ] [alu] [line 47]
!126 = !MDLocation(line: 47, column: 20, scope: !14)
!127 = !{!"0x101\00title\0033554479\000", !14, !8, !17} ; [ DW_TAG_arg_variable ] [title] [line 47]
!128 = !MDLocation(line: 47, column: 37, scope: !14)
!129 = !{!"0x101\00n\0050331695\000", !14, !8, !20} ; [ DW_TAG_arg_variable ] [n] [line 47]
!130 = !MDLocation(line: 47, column: 48, scope: !14)
!131 = !MDLocation(line: 48, column: 15, scope: !14)
!132 = !{!"0x100\00len\0048\000", !14, !8, !20}   ; [ DW_TAG_auto_variable ] [len] [line 48]
!133 = !MDLocation(line: 48, column: 9, scope: !14)
!134 = !MDLocation(line: 49, column: 17, scope: !14)
!135 = !MDLocation(line: 49, column: 5, scope: !14)
!136 = !{!"0x100\00buffer\0049\008192", !14, !8, !137} ; [ DW_TAG_auto_variable ] [buffer] [line 49]
!137 = !{!"0x1\00\000\000\008\000\000\000", null, null, !19, !138, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 8, offset 0] [from char]
!138 = !{!139}
!139 = !{!"0x21\000\00-1"}                        ; [ DW_TAG_subrange_type ] [unbounded]
!140 = !MDLocation(line: 49, column: 10, scope: !14)
!141 = !{!"0x100\00pos\0050\000", !14, !8, !20}   ; [ DW_TAG_auto_variable ] [pos] [line 50]
!142 = !MDLocation(line: 50, column: 9, scope: !14)
!143 = !MDLocation(line: 52, column: 25, scope: !14)
!144 = !MDLocation(line: 52, column: 5, scope: !14)
!145 = !MDLocation(line: 53, column: 12, scope: !14)
!146 = !MDLocation(line: 53, column: 5, scope: !14)
!147 = !MDLocation(line: 55, column: 27, scope: !14)
!148 = !MDLocation(line: 55, column: 5, scope: !14)
!149 = !MDLocation(line: 56, column: 5, scope: !14)
!150 = !MDLocation(line: 56, column: 12, scope: !151)
!151 = !{!"0xb\002", !1, !152}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!152 = !{!"0xb\001", !1, !14}                     ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!153 = !MDLocation(line: 57, column: 21, scope: !154)
!154 = !{!"0xb\0056\0019\000", !1, !14}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!155 = !MDLocation(line: 57, column: 21, scope: !156)
!156 = !{!"0xb\001", !1, !154}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!157 = !{!"0x100\00bytes\0057\000", !154, !8, !20} ; [ DW_TAG_auto_variable ] [bytes] [line 57]
!158 = !MDLocation(line: 57, column: 13, scope: !154)
!159 = !MDLocation(line: 59, column: 25, scope: !154)
!160 = !MDLocation(line: 59, column: 39, scope: !154)
!161 = !MDLocation(line: 59, column: 49, scope: !154)
!162 = !MDLocation(line: 59, column: 9, scope: !154)
!163 = !MDLocation(line: 60, column: 9, scope: !154)
!164 = !MDLocation(line: 61, column: 13, scope: !165)
!165 = !{!"0xb\0061\0013\001", !1, !154}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!166 = !MDLocation(line: 61, column: 13, scope: !154)
!167 = !MDLocation(line: 62, column: 13, scope: !168)
!168 = !{!"0xb\0061\0024\002", !1, !165}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!169 = !MDLocation(line: 63, column: 9, scope: !168)
!170 = !MDLocation(line: 64, column: 30, scope: !154)
!171 = !MDLocation(line: 64, column: 9, scope: !154)
!172 = !MDLocation(line: 65, column: 9, scope: !154)
!173 = !MDLocation(line: 67, column: 1, scope: !14)
!174 = !{!"0x101\00lookup\0016777296\000", !21, !8, !25} ; [ DW_TAG_arg_variable ] [lookup] [line 80]
!175 = !MDLocation(line: 80, column: 33, scope: !21)
!176 = !{!"0x101\00amino_acid\0033554512\000", !21, !8, !26} ; [ DW_TAG_arg_variable ] [amino_acid] [line 80]
!177 = !MDLocation(line: 80, column: 60, scope: !21)
!178 = !{!"0x101\00amino_acid_size\0050331728\000", !21, !8, !20} ; [ DW_TAG_arg_variable ] [amino_acid_size] [line 80]
!179 = !MDLocation(line: 80, column: 76, scope: !21)
!180 = !{!"0x100\00p\0081\000", !21, !8, !4}      ; [ DW_TAG_auto_variable ] [p] [line 81]
!181 = !MDLocation(line: 81, column: 11, scope: !21)
!182 = !{!"0x100\00i\0082\000", !183, !8, !20}    ; [ DW_TAG_auto_variable ] [i] [line 82]
!183 = !{!"0xb\0082\005\003", !1, !21}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!184 = !MDLocation(line: 82, column: 14, scope: !183)
!185 = !MDLocation(line: 82, column: 10, scope: !183)
!186 = !MDLocation(line: 82, column: 21, scope: !187)
!187 = !{!"0xb\0082\005\004", !1, !183}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!188 = !MDLocation(line: 82, column: 5, scope: !183)
!189 = !MDLocation(line: 83, column: 14, scope: !190)
!190 = !{!"0xb\0082\0047\005", !1, !187}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!191 = !MDLocation(line: 83, column: 9, scope: !190)
!192 = !MDLocation(line: 84, column: 38, scope: !190)
!193 = !MDLocation(line: 84, column: 9, scope: !190)
!194 = !MDLocation(line: 85, column: 5, scope: !190)
!195 = !MDLocation(line: 82, column: 42, scope: !187)
!196 = !MDLocation(line: 82, column: 5, scope: !187)
!197 = !MDLocation(line: 88, column: 16, scope: !21)
!198 = !MDLocation(line: 88, column: 5, scope: !21)
!199 = !{!"0x100\00i\0090\000", !200, !8, !20}    ; [ DW_TAG_auto_variable ] [i] [line 90]
!200 = !{!"0xb\0090\005\006", !1, !21}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!201 = !MDLocation(line: 90, column: 14, scope: !200)
!202 = !{!"0x100\00j\0090\000", !200, !8, !20}    ; [ DW_TAG_auto_variable ] [j] [line 90]
!203 = !MDLocation(line: 90, column: 21, scope: !200)
!204 = !MDLocation(line: 90, column: 10, scope: !200)
!205 = !MDLocation(line: 90, column: 28, scope: !206)
!206 = !{!"0xb\002", !1, !207}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!207 = !{!"0xb\001", !1, !208}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!208 = !{!"0xb\0090\005\007", !1, !200}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!209 = !MDLocation(line: 90, column: 5, scope: !200)
!210 = !MDLocation(line: 91, column: 9, scope: !211)
!211 = !{!"0xb\0090\0050\008", !1, !208}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!212 = !MDLocation(line: 91, column: 16, scope: !211)
!213 = !MDLocation(line: 91, column: 45, scope: !211)
!214 = !MDLocation(line: 92, column: 13, scope: !215)
!215 = !{!"0xb\0091\0048\009", !1, !211}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!216 = !MDLocation(line: 94, column: 21, scope: !211)
!217 = !MDLocation(line: 94, column: 9, scope: !211)
!218 = !MDLocation(line: 95, column: 5, scope: !211)
!219 = !MDLocation(line: 90, column: 45, scope: !208)
!220 = !MDLocation(line: 90, column: 5, scope: !208)
!221 = !MDLocation(line: 97, column: 5, scope: !21)
!222 = !{!"0x101\00amino_acid\0016777317\000", !32, !8, !26} ; [ DW_TAG_arg_variable ] [amino_acid] [line 101]
!223 = !MDLocation(line: 101, column: 30, scope: !32)
!224 = !{!"0x101\00amino_acid_size\0033554533\000", !32, !8, !20} ; [ DW_TAG_arg_variable ] [amino_acid_size] [line 101]
!225 = !MDLocation(line: 101, column: 46, scope: !32)
!226 = !{!"0x101\00title\0050331750\000", !32, !8, !17} ; [ DW_TAG_arg_variable ] [title] [line 102]
!227 = !MDLocation(line: 102, column: 21, scope: !32)
!228 = !{!"0x101\00n\0067108966\000", !32, !8, !20} ; [ DW_TAG_arg_variable ] [n] [line 102]
!229 = !MDLocation(line: 102, column: 32, scope: !32)
!230 = !{!"0x101\00rand\0083886182\000", !32, !8, !11} ; [ DW_TAG_arg_variable ] [rand] [line 102]
!231 = !MDLocation(line: 102, column: 45, scope: !32)
!232 = !{!"0x100\00lookup\00103\000", !32, !8, !233} ; [ DW_TAG_auto_variable ] [lookup] [line 103]
!233 = !{!"0x1\00\000\00262144\0064\000\000\000", null, null, !26, !234, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 262144, align 64, offset 0] [from ]
!234 = !{!235}
!235 = !{!"0x21\000\004096"}                      ; [ DW_TAG_subrange_type ] [0, 4095]
!236 = !MDLocation(line: 103, column: 24, scope: !32)
!237 = !{!"0x100\00line_buffer\00104\000", !32, !8, !238} ; [ DW_TAG_auto_variable ] [line_buffer] [line 104]
!238 = !{!"0x1\00\000\00488\008\000\000\000", null, null, !19, !239, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 488, align 8, offset 0] [from char]
!239 = !{!240}
!240 = !{!"0x21\000\0061"}                        ; [ DW_TAG_subrange_type ] [0, 60]
!241 = !MDLocation(line: 104, column: 10, scope: !32)
!242 = !MDLocation(line: 107, column: 5, scope: !32)
!243 = !MDLocation(line: 109, column: 17, scope: !32)
!244 = !MDLocation(line: 109, column: 5, scope: !32)
!245 = !MDLocation(line: 111, column: 27, scope: !32)
!246 = !MDLocation(line: 111, column: 5, scope: !32)
!247 = !{!"0x100\00i\00105\000", !32, !8, !20}    ; [ DW_TAG_auto_variable ] [i] [line 105]
!248 = !MDLocation(line: 105, column: 9, scope: !32)
!249 = !{!"0x100\00j\00105\000", !32, !8, !20}    ; [ DW_TAG_auto_variable ] [j] [line 105]
!250 = !MDLocation(line: 105, column: 12, scope: !32)
!251 = !MDLocation(line: 113, column: 10, scope: !252)
!252 = !{!"0xb\00113\005\0010", !1, !32}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!253 = !MDLocation(line: 113, column: 24, scope: !254)
!254 = !{!"0xb\00113\005\0011", !1, !252}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!255 = !MDLocation(line: 113, column: 5, scope: !252)
!256 = !MDLocation(line: 114, column: 13, scope: !257)
!257 = !{!"0xb\00114\0013\0013", !1, !258}        ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!258 = !{!"0xb\00113\0041\0012", !1, !254}        ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!259 = !MDLocation(line: 114, column: 13, scope: !258)
!260 = !MDLocation(line: 115, column: 29, scope: !261)
!261 = !{!"0xb\00114\0028\0014", !1, !257}        ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!262 = !MDLocation(line: 115, column: 59, scope: !261)
!263 = !MDLocation(line: 115, column: 13, scope: !261)
!264 = !MDLocation(line: 117, column: 9, scope: !261)
!265 = !MDLocation(line: 119, column: 19, scope: !258)
!266 = !{!"0x100\00r\00119\000", !258, !8, !4}    ; [ DW_TAG_auto_variable ] [r] [line 119]
!267 = !MDLocation(line: 119, column: 15, scope: !258)
!268 = !MDLocation(line: 120, column: 39, scope: !258)
!269 = !MDLocation(line: 120, column: 32, scope: !258)
!270 = !{!"0x100\00u\00120\000", !258, !8, !26}   ; [ DW_TAG_auto_variable ] [u] [line 120]
!271 = !MDLocation(line: 120, column: 28, scope: !258)
!272 = !MDLocation(line: 121, column: 9, scope: !258)
!273 = !MDLocation(line: 121, column: 16, scope: !274)
!274 = !{!"0xb\002", !1, !275}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!275 = !{!"0xb\001", !1, !258}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!276 = !MDLocation(line: 122, column: 13, scope: !277)
!277 = !{!"0xb\00121\0047\0015", !1, !258}        ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!278 = !MDLocation(line: 124, column: 26, scope: !258)
!279 = !MDLocation(line: 124, column: 9, scope: !258)
!280 = !MDLocation(line: 125, column: 5, scope: !258)
!281 = !MDLocation(line: 113, column: 31, scope: !254)
!282 = !MDLocation(line: 113, column: 36, scope: !254)
!283 = !MDLocation(line: 113, column: 5, scope: !254)
!284 = !MDLocation(line: 126, column: 5, scope: !32)
!285 = !MDLocation(line: 127, column: 21, scope: !32)
!286 = !MDLocation(line: 127, column: 34, scope: !32)
!287 = !MDLocation(line: 127, column: 44, scope: !32)
!288 = !MDLocation(line: 127, column: 5, scope: !32)
!289 = !MDLocation(line: 128, column: 1, scope: !32)
!290 = !{!"0x101\00random\0016777250\000", !38, !8, !11} ; [ DW_TAG_arg_variable ] [random] [line 34]
!291 = !MDLocation(line: 34, column: 30, scope: !38)
!292 = !MDLocation(line: 35, column: 16, scope: !38)
!293 = !MDLocation(line: 35, column: 15, scope: !38)
!294 = !MDLocation(line: 35, column: 5, scope: !38)
!295 = !MDLocation(line: 37, column: 13, scope: !38)
!296 = !MDLocation(line: 37, column: 12, scope: !38)
!297 = !MDLocation(line: 37, column: 5, scope: !38)
!298 = !{!"0x101\00inputN\0016777384\000", !35, !8, !20} ; [ DW_TAG_arg_variable ] [inputN] [line 168]
!299 = !MDLocation(line: 168, column: 15, scope: !35)
!300 = !{!"0x100\00n\00169\000", !35, !8, !20}    ; [ DW_TAG_auto_variable ] [n] [line 169]
!301 = !MDLocation(line: 169, column: 9, scope: !35)
!302 = !MDLocation(line: 171, column: 9, scope: !303)
!303 = !{!"0xb\00171\009\0016", !1, !35}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta-redux/code.c]
!304 = !MDLocation(line: 171, column: 9, scope: !35)
!305 = !MDLocation(line: 171, column: 21, scope: !303)
!306 = !{!"0x100\00filename\00173\000", !35, !8, !307} ; [ DW_TAG_auto_variable ] [filename] [line 173]
!307 = !{!"0x1\00\000\00512\008\000\000\000", null, null, !19, !308, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!308 = !{!309}
!309 = !{!"0x21\000\0064"}                        ; [ DW_TAG_subrange_type ] [0, 63]
!310 = !MDLocation(line: 173, column: 10, scope: !35)
!311 = !MDLocation(line: 174, column: 13, scope: !35)
!312 = !MDLocation(line: 174, column: 5, scope: !35)
!313 = !MDLocation(line: 175, column: 23, scope: !35)
!314 = !MDLocation(line: 175, column: 17, scope: !35)
!315 = !MDLocation(line: 175, column: 5, scope: !35)
!316 = !MDLocation(line: 178, column: 5, scope: !35)
!317 = !MDLocation(line: 179, column: 5, scope: !35)
!318 = !{!"0x100\00rand\00181\000", !35, !8, !12} ; [ DW_TAG_auto_variable ] [rand] [line 181]
!319 = !MDLocation(line: 181, column: 14, scope: !35)
!320 = !MDLocation(line: 183, column: 5, scope: !35)
!321 = !MDLocation(line: 185, column: 44, scope: !35)
!322 = !MDLocation(line: 185, column: 5, scope: !35)
!323 = !MDLocation(line: 187, column: 43, scope: !35)
!324 = !MDLocation(line: 186, column: 5, scope: !35)
!325 = !MDLocation(line: 189, column: 48, scope: !35)
!326 = !MDLocation(line: 188, column: 5, scope: !35)
!327 = !MDLocation(line: 191, column: 12, scope: !35)
!328 = !MDLocation(line: 191, column: 5, scope: !35)
!329 = !MDLocation(line: 193, column: 5, scope: !35)
