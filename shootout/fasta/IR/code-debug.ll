; ModuleID = 'code.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.aminoacids = type { i8, double }

@gen_random.last = internal global i64 42, align 8
@outStream = common global %struct._IO_FILE* null, align 8
@.str = private unnamed_addr constant [8 x i8] c">%s %s\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@iub_orig = global [15 x %struct.aminoacids] [%struct.aminoacids { i8 97, double 2.700000e-01 }, %struct.aminoacids { i8 99, double 1.200000e-01 }, %struct.aminoacids { i8 103, double 1.200000e-01 }, %struct.aminoacids { i8 116, double 2.700000e-01 }, %struct.aminoacids { i8 66, double 2.000000e-02 }, %struct.aminoacids { i8 68, double 2.000000e-02 }, %struct.aminoacids { i8 72, double 2.000000e-02 }, %struct.aminoacids { i8 75, double 2.000000e-02 }, %struct.aminoacids { i8 77, double 2.000000e-02 }, %struct.aminoacids { i8 78, double 2.000000e-02 }, %struct.aminoacids { i8 82, double 2.000000e-02 }, %struct.aminoacids { i8 83, double 2.000000e-02 }, %struct.aminoacids { i8 86, double 2.000000e-02 }, %struct.aminoacids { i8 87, double 2.000000e-02 }, %struct.aminoacids { i8 89, double 2.000000e-02 }], align 16
@homosapiens_orig = global [4 x %struct.aminoacids] [%struct.aminoacids { i8 97, double 0x3FD3639D20BAEB5B }, %struct.aminoacids { i8 99, double 0x3FC957AE3DCD561B }, %struct.aminoacids { i8 103, double 0x3FC9493AEAB6C2BF }, %struct.aminoacids { i8 116, double 0x3FD34BEE4B030838 }], align 16
@.str2 = private unnamed_addr constant [288 x i8] c"GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGGGAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGACCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAATACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCAGCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGGAGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCCAGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA\00", align 1
@alu = global i8* getelementptr inbounds ([288 x i8]* @.str2, i32 0, i32 0), align 8
@.str3 = private unnamed_addr constant [13 x i8] c"fasta-%d.txt\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@iub = common global [15 x %struct.aminoacids] zeroinitializer, align 16
@homosapiens = common global [4 x %struct.aminoacids] zeroinitializer, align 16
@.str5 = private unnamed_addr constant [4 x i8] c"ONE\00", align 1
@.str6 = private unnamed_addr constant [17 x i8] c"Homo sapiens alu\00", align 1
@.str7 = private unnamed_addr constant [4 x i8] c"TWO\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"IUB ambiguity codes\00", align 1
@.str9 = private unnamed_addr constant [6 x i8] c"THREE\00", align 1
@.str10 = private unnamed_addr constant [23 x i8] c"Homo sapiens frequency\00", align 1

; Function Attrs: nounwind uwtable
define double @gen_random(double %max) #0 {
  %1 = alloca double, align 8
  store double %max, double* %1, align 8
  call void @llvm.dbg.declare(metadata double* %1, metadata !114, metadata !115), !dbg !116
  %2 = load double* %1, align 8, !dbg !117
  %3 = load i64* @gen_random.last, align 8, !dbg !118
  %4 = mul nsw i64 %3, 3877, !dbg !118
  %5 = add nsw i64 %4, 29573, !dbg !118
  %6 = srem i64 %5, 139968, !dbg !119
  store i64 %6, i64* @gen_random.last, align 8, !dbg !120
  %7 = sitofp i64 %6 to double, !dbg !121
  %8 = fmul double %2, %7, !dbg !117
  %9 = fdiv double %8, 1.399680e+05, !dbg !117
  ret double %9, !dbg !122
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @makeCumulative(%struct.aminoacids* %genelist, i32 %count) #0 {
  %1 = alloca %struct.aminoacids*, align 8
  %2 = alloca i32, align 4
  %cp = alloca double, align 8
  %i = alloca i32, align 4
  store %struct.aminoacids* %genelist, %struct.aminoacids** %1, align 8
  call void @llvm.dbg.declare(metadata %struct.aminoacids** %1, metadata !123, metadata !115), !dbg !124
  store i32 %count, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !125, metadata !115), !dbg !126
  call void @llvm.dbg.declare(metadata double* %cp, metadata !127, metadata !115), !dbg !128
  store double 0.000000e+00, double* %cp, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i32* %i, metadata !129, metadata !115), !dbg !130
  store i32 0, i32* %i, align 4, !dbg !131
  br label %3, !dbg !131

; <label>:3                                       ; preds = %22, %0
  %4 = load i32* %i, align 4, !dbg !133
  %5 = load i32* %2, align 4, !dbg !137
  %6 = icmp slt i32 %4, %5, !dbg !138
  br i1 %6, label %7, label %25, !dbg !139

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4, !dbg !140
  %9 = sext i32 %8 to i64, !dbg !142
  %10 = load %struct.aminoacids** %1, align 8, !dbg !142
  %11 = getelementptr inbounds %struct.aminoacids* %10, i64 %9, !dbg !142
  %12 = getelementptr inbounds %struct.aminoacids* %11, i32 0, i32 1, !dbg !142
  %13 = load double* %12, align 8, !dbg !142
  %14 = load double* %cp, align 8, !dbg !143
  %15 = fadd double %14, %13, !dbg !143
  store double %15, double* %cp, align 8, !dbg !143
  %16 = load double* %cp, align 8, !dbg !144
  %17 = load i32* %i, align 4, !dbg !145
  %18 = sext i32 %17 to i64, !dbg !146
  %19 = load %struct.aminoacids** %1, align 8, !dbg !146
  %20 = getelementptr inbounds %struct.aminoacids* %19, i64 %18, !dbg !146
  %21 = getelementptr inbounds %struct.aminoacids* %20, i32 0, i32 1, !dbg !146
  store double %16, double* %21, align 8, !dbg !146
  br label %22, !dbg !147

; <label>:22                                      ; preds = %7
  %23 = load i32* %i, align 4, !dbg !148
  %24 = add nsw i32 %23, 1, !dbg !148
  store i32 %24, i32* %i, align 4, !dbg !148
  br label %3, !dbg !149

; <label>:25                                      ; preds = %3
  ret void, !dbg !150
}

; Function Attrs: nounwind uwtable
define signext i8 @selectRandom(%struct.aminoacids* %genelist, i32 %count) #0 {
  %1 = alloca i8, align 1
  %2 = alloca %struct.aminoacids*, align 8
  %3 = alloca i32, align 4
  %r = alloca double, align 8
  %i = alloca i32, align 4
  %lo = alloca i32, align 4
  %hi = alloca i32, align 4
  store %struct.aminoacids* %genelist, %struct.aminoacids** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.aminoacids** %2, metadata !151, metadata !115), !dbg !152
  store i32 %count, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !153, metadata !115), !dbg !154
  call void @llvm.dbg.declare(metadata double* %r, metadata !155, metadata !115), !dbg !156
  %4 = call double @gen_random(double 1.000000e+00), !dbg !157
  store double %4, double* %r, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata i32* %i, metadata !158, metadata !115), !dbg !159
  call void @llvm.dbg.declare(metadata i32* %lo, metadata !160, metadata !115), !dbg !161
  call void @llvm.dbg.declare(metadata i32* %hi, metadata !162, metadata !115), !dbg !163
  %5 = load double* %r, align 8, !dbg !164
  %6 = load %struct.aminoacids** %2, align 8, !dbg !166
  %7 = getelementptr inbounds %struct.aminoacids* %6, i64 0, !dbg !166
  %8 = getelementptr inbounds %struct.aminoacids* %7, i32 0, i32 1, !dbg !166
  %9 = load double* %8, align 8, !dbg !166
  %10 = fcmp olt double %5, %9, !dbg !164
  br i1 %10, label %11, label %16, !dbg !167

; <label>:11                                      ; preds = %0
  %12 = load %struct.aminoacids** %2, align 8, !dbg !168
  %13 = getelementptr inbounds %struct.aminoacids* %12, i64 0, !dbg !168
  %14 = getelementptr inbounds %struct.aminoacids* %13, i32 0, i32 0, !dbg !168
  %15 = load i8* %14, align 1, !dbg !168
  store i8 %15, i8* %1, !dbg !170
  br label %49, !dbg !170

; <label>:16                                      ; preds = %0
  store i32 0, i32* %lo, align 4, !dbg !171
  %17 = load i32* %3, align 4, !dbg !172
  %18 = sub nsw i32 %17, 1, !dbg !172
  store i32 %18, i32* %hi, align 4, !dbg !173
  br label %19, !dbg !174

; <label>:19                                      ; preds = %41, %16
  %20 = load i32* %hi, align 4, !dbg !175
  %21 = load i32* %lo, align 4, !dbg !178
  %22 = add nsw i32 %21, 1, !dbg !178
  %23 = icmp sgt i32 %20, %22, !dbg !179
  br i1 %23, label %24, label %42, !dbg !174

; <label>:24                                      ; preds = %19
  %25 = load i32* %hi, align 4, !dbg !180
  %26 = load i32* %lo, align 4, !dbg !182
  %27 = add nsw i32 %25, %26, !dbg !180
  %28 = sdiv i32 %27, 2, !dbg !183
  store i32 %28, i32* %i, align 4, !dbg !184
  %29 = load double* %r, align 8, !dbg !185
  %30 = load i32* %i, align 4, !dbg !187
  %31 = sext i32 %30 to i64, !dbg !188
  %32 = load %struct.aminoacids** %2, align 8, !dbg !188
  %33 = getelementptr inbounds %struct.aminoacids* %32, i64 %31, !dbg !188
  %34 = getelementptr inbounds %struct.aminoacids* %33, i32 0, i32 1, !dbg !188
  %35 = load double* %34, align 8, !dbg !188
  %36 = fcmp olt double %29, %35, !dbg !185
  br i1 %36, label %37, label %39, !dbg !189

; <label>:37                                      ; preds = %24
  %38 = load i32* %i, align 4, !dbg !190
  store i32 %38, i32* %hi, align 4, !dbg !192
  br label %41, !dbg !192

; <label>:39                                      ; preds = %24
  %40 = load i32* %i, align 4, !dbg !193
  store i32 %40, i32* %lo, align 4, !dbg !195
  br label %41

; <label>:41                                      ; preds = %39, %37
  br label %19, !dbg !174

; <label>:42                                      ; preds = %19
  %43 = load i32* %hi, align 4, !dbg !196
  %44 = sext i32 %43 to i64, !dbg !197
  %45 = load %struct.aminoacids** %2, align 8, !dbg !197
  %46 = getelementptr inbounds %struct.aminoacids* %45, i64 %44, !dbg !197
  %47 = getelementptr inbounds %struct.aminoacids* %46, i32 0, i32 0, !dbg !197
  %48 = load i8* %47, align 1, !dbg !197
  store i8 %48, i8* %1, !dbg !198
  br label %49, !dbg !198

; <label>:49                                      ; preds = %42, %11
  %50 = load i8* %1, !dbg !199
  ret i8 %50, !dbg !199
}

; Function Attrs: nounwind uwtable
define void @makeRandomFasta(i8* %id, i8* %desc, %struct.aminoacids* %genelist, i32 %count, i32 %n) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca %struct.aminoacids*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %todo = alloca i32, align 4
  %i = alloca i32, align 4
  %m = alloca i32, align 4
  %pick = alloca [61 x i8], align 16
  store i8* %id, i8** %1, align 8
  call void @llvm.dbg.declare(metadata i8** %1, metadata !200, metadata !115), !dbg !201
  store i8* %desc, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !202, metadata !115), !dbg !203
  store %struct.aminoacids* %genelist, %struct.aminoacids** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.aminoacids** %3, metadata !204, metadata !115), !dbg !205
  store i32 %count, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !206, metadata !115), !dbg !207
  store i32 %n, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !208, metadata !115), !dbg !209
  call void @llvm.dbg.declare(metadata i32* %todo, metadata !210, metadata !115), !dbg !211
  %6 = load i32* %5, align 4, !dbg !212
  store i32 %6, i32* %todo, align 4, !dbg !211
  call void @llvm.dbg.declare(metadata i32* %i, metadata !213, metadata !115), !dbg !214
  call void @llvm.dbg.declare(metadata i32* %m, metadata !215, metadata !115), !dbg !216
  %7 = load %struct._IO_FILE** @outStream, align 8, !dbg !217
  %8 = load i8** %1, align 8, !dbg !218
  %9 = load i8** %2, align 8, !dbg !219
  %10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* %8, i8* %9), !dbg !220
  br label %11, !dbg !221

; <label>:11                                      ; preds = %42, %0
  %12 = load i32* %todo, align 4, !dbg !222
  %13 = icmp sgt i32 %12, 0, !dbg !222
  br i1 %13, label %14, label %45, !dbg !227

; <label>:14                                      ; preds = %11
  call void @llvm.dbg.declare(metadata [61 x i8]* %pick, metadata !228, metadata !115), !dbg !233
  %15 = load i32* %todo, align 4, !dbg !234
  %16 = icmp slt i32 %15, 60, !dbg !234
  br i1 %16, label %17, label %19, !dbg !236

; <label>:17                                      ; preds = %14
  %18 = load i32* %todo, align 4, !dbg !237
  store i32 %18, i32* %m, align 4, !dbg !239
  br label %20, !dbg !239

; <label>:19                                      ; preds = %14
  store i32 60, i32* %m, align 4, !dbg !240
  br label %20

; <label>:20                                      ; preds = %19, %17
  store i32 0, i32* %i, align 4, !dbg !242
  br label %21, !dbg !242

; <label>:21                                      ; preds = %32, %20
  %22 = load i32* %i, align 4, !dbg !244
  %23 = load i32* %m, align 4, !dbg !248
  %24 = icmp slt i32 %22, %23, !dbg !249
  br i1 %24, label %25, label %35, !dbg !250

; <label>:25                                      ; preds = %21
  %26 = load %struct.aminoacids** %3, align 8, !dbg !251
  %27 = load i32* %4, align 4, !dbg !253
  %28 = call signext i8 @selectRandom(%struct.aminoacids* %26, i32 %27), !dbg !254
  %29 = load i32* %i, align 4, !dbg !255
  %30 = sext i32 %29 to i64, !dbg !256
  %31 = getelementptr inbounds [61 x i8]* %pick, i32 0, i64 %30, !dbg !256
  store i8 %28, i8* %31, align 1, !dbg !256
  br label %32, !dbg !256

; <label>:32                                      ; preds = %25
  %33 = load i32* %i, align 4, !dbg !257
  %34 = add nsw i32 %33, 1, !dbg !257
  store i32 %34, i32* %i, align 4, !dbg !257
  br label %21, !dbg !259

; <label>:35                                      ; preds = %21
  %36 = load i32* %m, align 4, !dbg !260
  %37 = sext i32 %36 to i64, !dbg !261
  %38 = getelementptr inbounds [61 x i8]* %pick, i32 0, i64 %37, !dbg !261
  store i8 0, i8* %38, align 1, !dbg !261
  %39 = getelementptr inbounds [61 x i8]* %pick, i32 0, i32 0, !dbg !262
  %40 = load %struct._IO_FILE** @outStream, align 8, !dbg !263
  %41 = call i32 @fputs(i8* %39, %struct._IO_FILE* %40), !dbg !264
  br label %42, !dbg !265

; <label>:42                                      ; preds = %35
  %43 = load i32* %todo, align 4, !dbg !266
  %44 = sub nsw i32 %43, 60, !dbg !266
  store i32 %44, i32* %todo, align 4, !dbg !266
  br label %11, !dbg !267

; <label>:45                                      ; preds = %11
  ret void, !dbg !268
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @fputs(i8*, %struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define void @makeRepeatFasta(i8* %id, i8* %desc, i8* %s, i32 %n) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %ss = alloca i8*, align 8
  %todo = alloca i32, align 4
  %k = alloca i32, align 4
  %kn = alloca i32, align 4
  %m = alloca i32, align 4
  store i8* %id, i8** %1, align 8
  call void @llvm.dbg.declare(metadata i8** %1, metadata !269, metadata !115), !dbg !270
  store i8* %desc, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !271, metadata !115), !dbg !272
  store i8* %s, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !273, metadata !115), !dbg !274
  store i32 %n, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !275, metadata !115), !dbg !276
  call void @llvm.dbg.declare(metadata i8** %ss, metadata !277, metadata !115), !dbg !278
  call void @llvm.dbg.declare(metadata i32* %todo, metadata !279, metadata !115), !dbg !280
  %5 = load i32* %4, align 4, !dbg !281
  store i32 %5, i32* %todo, align 4, !dbg !280
  call void @llvm.dbg.declare(metadata i32* %k, metadata !282, metadata !115), !dbg !283
  store i32 0, i32* %k, align 4, !dbg !283
  call void @llvm.dbg.declare(metadata i32* %kn, metadata !284, metadata !115), !dbg !285
  %6 = load i8** %3, align 8, !dbg !286
  %7 = call i64 @strlen(i8* %6) #6, !dbg !287
  %8 = trunc i64 %7 to i32, !dbg !287
  store i32 %8, i32* %kn, align 4, !dbg !285
  call void @llvm.dbg.declare(metadata i32* %m, metadata !288, metadata !115), !dbg !289
  %9 = load i32* %kn, align 4, !dbg !290
  %10 = add nsw i32 %9, 1, !dbg !290
  %11 = sext i32 %10 to i64, !dbg !290
  %12 = call noalias i8* @malloc(i64 %11) #5, !dbg !291
  store i8* %12, i8** %ss, align 8, !dbg !292
  %13 = load i8** %ss, align 8, !dbg !293
  %14 = load i8** %3, align 8, !dbg !294
  %15 = load i32* %kn, align 4, !dbg !295
  %16 = add nsw i32 %15, 1, !dbg !295
  %17 = sext i32 %16 to i64, !dbg !295
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 %17, i32 1, i1 false), !dbg !296
  %18 = load %struct._IO_FILE** @outStream, align 8, !dbg !297
  %19 = load i8** %1, align 8, !dbg !298
  %20 = load i8** %2, align 8, !dbg !299
  %21 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* %19, i8* %20), !dbg !300
  br label %22, !dbg !301

; <label>:22                                      ; preds = %79, %0
  %23 = load i32* %todo, align 4, !dbg !302
  %24 = icmp sgt i32 %23, 0, !dbg !302
  br i1 %24, label %25, label %82, !dbg !307

; <label>:25                                      ; preds = %22
  %26 = load i32* %todo, align 4, !dbg !308
  %27 = icmp slt i32 %26, 60, !dbg !308
  br i1 %27, label %28, label %30, !dbg !311

; <label>:28                                      ; preds = %25
  %29 = load i32* %todo, align 4, !dbg !312
  store i32 %29, i32* %m, align 4, !dbg !314
  br label %31, !dbg !314

; <label>:30                                      ; preds = %25
  store i32 60, i32* %m, align 4, !dbg !315
  br label %31

; <label>:31                                      ; preds = %30, %28
  br label %32, !dbg !317

; <label>:32                                      ; preds = %38, %31
  %33 = load i32* %m, align 4, !dbg !318
  %34 = load i32* %kn, align 4, !dbg !321
  %35 = load i32* %k, align 4, !dbg !322
  %36 = sub nsw i32 %34, %35, !dbg !321
  %37 = icmp sge i32 %33, %36, !dbg !323
  br i1 %37, label %38, label %50, !dbg !317

; <label>:38                                      ; preds = %32
  %39 = load %struct._IO_FILE** @outStream, align 8, !dbg !324
  %40 = load i8** %3, align 8, !dbg !326
  %41 = load i32* %k, align 4, !dbg !327
  %42 = sext i32 %41 to i64, !dbg !326
  %43 = getelementptr inbounds i8* %40, i64 %42, !dbg !326
  %44 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* %43), !dbg !328
  %45 = load i32* %kn, align 4, !dbg !329
  %46 = load i32* %k, align 4, !dbg !330
  %47 = sub nsw i32 %45, %46, !dbg !329
  %48 = load i32* %m, align 4, !dbg !331
  %49 = sub nsw i32 %48, %47, !dbg !331
  store i32 %49, i32* %m, align 4, !dbg !331
  store i32 0, i32* %k, align 4, !dbg !332
  br label %32, !dbg !317

; <label>:50                                      ; preds = %32
  %51 = load i32* %k, align 4, !dbg !333
  %52 = load i32* %m, align 4, !dbg !334
  %53 = add nsw i32 %51, %52, !dbg !333
  %54 = sext i32 %53 to i64, !dbg !335
  %55 = load i8** %ss, align 8, !dbg !335
  %56 = getelementptr inbounds i8* %55, i64 %54, !dbg !335
  store i8 0, i8* %56, align 1, !dbg !335
  %57 = load i8** %ss, align 8, !dbg !336
  %58 = load i32* %k, align 4, !dbg !337
  %59 = sext i32 %58 to i64, !dbg !336
  %60 = getelementptr inbounds i8* %57, i64 %59, !dbg !336
  %61 = load %struct._IO_FILE** @outStream, align 8, !dbg !338
  %62 = call i32 @fputs(i8* %60, %struct._IO_FILE* %61), !dbg !339
  %63 = load i32* %m, align 4, !dbg !340
  %64 = load i32* %k, align 4, !dbg !341
  %65 = add nsw i32 %63, %64, !dbg !340
  %66 = sext i32 %65 to i64, !dbg !342
  %67 = load i8** %3, align 8, !dbg !342
  %68 = getelementptr inbounds i8* %67, i64 %66, !dbg !342
  %69 = load i8* %68, align 1, !dbg !342
  %70 = load i32* %k, align 4, !dbg !343
  %71 = load i32* %m, align 4, !dbg !344
  %72 = add nsw i32 %70, %71, !dbg !343
  %73 = sext i32 %72 to i64, !dbg !345
  %74 = load i8** %ss, align 8, !dbg !345
  %75 = getelementptr inbounds i8* %74, i64 %73, !dbg !345
  store i8 %69, i8* %75, align 1, !dbg !345
  %76 = load i32* %m, align 4, !dbg !346
  %77 = load i32* %k, align 4, !dbg !347
  %78 = add nsw i32 %77, %76, !dbg !347
  store i32 %78, i32* %k, align 4, !dbg !347
  br label %79, !dbg !348

; <label>:79                                      ; preds = %50
  %80 = load i32* %todo, align 4, !dbg !349
  %81 = sub nsw i32 %80, 60, !dbg !349
  store i32 %81, i32* %todo, align 4, !dbg !349
  br label %22, !dbg !350

; <label>:82                                      ; preds = %22
  %83 = load i8** %ss, align 8, !dbg !351
  call void @free(i8* %83) #5, !dbg !352
  ret void, !dbg !353
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: nounwind
declare void @free(i8*) #4

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %filename = alloca [64 x i8], align 16
  store i32 %inputN, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !354, metadata !115), !dbg !355
  call void @llvm.dbg.declare(metadata i32* %n, metadata !356, metadata !115), !dbg !357
  store i32 1000, i32* %n, align 4, !dbg !357
  %2 = load i32* %1, align 4, !dbg !358
  %3 = icmp sgt i32 %2, 1, !dbg !358
  br i1 %3, label %4, label %6, !dbg !360

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4, !dbg !361
  store i32 %5, i32* %n, align 4, !dbg !363
  br label %6, !dbg !363

; <label>:6                                       ; preds = %4, %0
  call void @llvm.dbg.declare(metadata [64 x i8]* %filename, metadata !364, metadata !115), !dbg !368
  %7 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0, !dbg !369
  %8 = load i32* %n, align 4, !dbg !370
  %9 = call i32 (i8*, i8*, ...)* @sprintf(i8* %7, i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0), i32 %8) #5, !dbg !371
  %10 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0, !dbg !372
  %11 = call %struct._IO_FILE* @fopen(i8* %10, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0)), !dbg !373
  store %struct._IO_FILE* %11, %struct._IO_FILE** @outStream, align 8, !dbg !374
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([15 x %struct.aminoacids]* @iub_orig, i32 0, i32 0, i32 0), i64 240, i32 16, i1 false), !dbg !375
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens_orig, i32 0, i32 0, i32 0), i64 64, i32 16, i1 false), !dbg !376
  call void @makeCumulative(%struct.aminoacids* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i32 0, i32 0), i32 15), !dbg !377
  call void @makeCumulative(%struct.aminoacids* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i32 0, i32 0), i32 4), !dbg !378
  %12 = load i8** @alu, align 8, !dbg !379
  %13 = load i32* %n, align 4, !dbg !380
  %14 = mul nsw i32 %13, 2, !dbg !380
  call void @makeRepeatFasta(i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @.str6, i32 0, i32 0), i8* %12, i32 %14), !dbg !381
  %15 = load i32* %n, align 4, !dbg !382
  %16 = mul nsw i32 %15, 3, !dbg !382
  call void @makeRandomFasta(i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), %struct.aminoacids* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i32 0, i32 0), i32 15, i32 %16), !dbg !383
  %17 = load i32* %n, align 4, !dbg !384
  %18 = mul nsw i32 %17, 5, !dbg !384
  call void @makeRandomFasta(i8* getelementptr inbounds ([6 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8]* @.str10, i32 0, i32 0), %struct.aminoacids* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i32 0, i32 0), i32 4, i32 %18), !dbg !385
  %19 = load %struct._IO_FILE** @outStream, align 8, !dbg !386
  %20 = call i32 @fclose(%struct._IO_FILE* %19), !dbg !387
  ret i32 0, !dbg !388
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #4

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @fclose(%struct._IO_FILE*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!111, !112}
!llvm.ident = !{!113}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !3, !6, !37, !2} ; [ DW_TAG_compile_unit ] [/media/llvm/OSR/shootout/fasta/C/code.c] [DW_LANG_C99]
!1 = !{!"code.c", !"/media/llvm/OSR/shootout/fasta/C"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!5 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!6 = !{!7, !12, !21, !26, !31, !34}
!7 = !{!"0x2e\00gen_random\00gen_random\00\0017\000\001\000\000\00256\000\0017", !1, !8, !9, null, double (double)* @gen_random, null, null, !2} ; [ DW_TAG_subprogram ] [line 17] [def] [gen_random]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{!11, !11}
!11 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!12 = !{!"0x2e\00makeCumulative\00makeCumulative\00\0029\000\001\000\000\00256\000\0029", !1, !8, !13, null, void (%struct.aminoacids*, i32)* @makeCumulative, null, null, !2} ; [ DW_TAG_subprogram ] [line 29] [def] [makeCumulative]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null, !15, !20}
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from aminoacids]
!16 = !{!"0x13\00aminoacids\0022\00128\0064\000\000\000", !1, null, null, !17, null, null, null} ; [ DW_TAG_structure_type ] [aminoacids] [line 22, size 128, align 64, offset 0] [def] [from ]
!17 = !{!18, !19}
!18 = !{!"0xd\00c\0023\008\008\000\000", !1, !16, !5} ; [ DW_TAG_member ] [c] [line 23, size 8, align 8, offset 0] [from char]
!19 = !{!"0xd\00p\0024\0064\0064\0064\000", !1, !16, !11} ; [ DW_TAG_member ] [p] [line 24, size 64, align 64, offset 64] [from double]
!20 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!21 = !{!"0x2e\00selectRandom\00selectRandom\00\0039\000\001\000\000\00256\000\0039", !1, !8, !22, null, i8 (%struct.aminoacids*, i32)* @selectRandom, null, null, !2} ; [ DW_TAG_subprogram ] [line 39] [def] [selectRandom]
!22 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !23, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = !{!5, !24, !20}
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!25 = !{!"0x26\00\000\000\000\000\000", null, null, !16} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from aminoacids]
!26 = !{!"0x2e\00makeRandomFasta\00makeRandomFasta\00\0059\000\001\000\000\00256\000\0060", !1, !8, !27, null, void (i8*, i8*, %struct.aminoacids*, i32, i32)* @makeRandomFasta, null, null, !2} ; [ DW_TAG_subprogram ] [line 59] [def] [scope 60] [makeRandomFasta]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{null, !29, !29, !24, !20, !20}
!29 = !{!"0xf\00\000\0064\0064\000\000", null, null, !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!30 = !{!"0x26\00\000\000\000\000\000", null, null, !5} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!31 = !{!"0x2e\00makeRepeatFasta\00makeRepeatFasta\00\0075\000\001\000\000\00256\000\0076", !1, !8, !32, null, void (i8*, i8*, i8*, i32)* @makeRepeatFasta, null, null, !2} ; [ DW_TAG_subprogram ] [line 75] [def] [scope 76] [makeRepeatFasta]
!32 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !33, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = !{null, !29, !29, !29, !20}
!34 = !{!"0x2e\00bench\00bench\00\00149\000\001\000\000\00256\000\00149", !1, !8, !35, null, i32 (i32)* @bench, null, null, !2} ; [ DW_TAG_subprogram ] [line 149] [def] [bench]
!35 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !36, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = !{!20, !20}
!37 = !{!38, !40, !44, !48, !49, !109, !110}
!38 = !{!"0x34\00last\00last\00\0018\001\001", !7, !8, !39, i64* @gen_random.last, null} ; [ DW_TAG_variable ] [last] [line 18] [local] [def]
!39 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!40 = !{!"0x34\00iub_orig\00iub_orig\00\00106\000\001", null, !8, !41, [15 x %struct.aminoacids]* @iub_orig, null} ; [ DW_TAG_variable ] [iub_orig] [line 106] [def]
!41 = !{!"0x1\00\000\001920\0064\000\000\000", null, null, !16, !42, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1920, align 64, offset 0] [from aminoacids]
!42 = !{!43}
!43 = !{!"0x21\000\0015"}                         ; [ DW_TAG_subrange_type ] [0, 14]
!44 = !{!"0x34\00homosapiens_orig\00homosapiens_orig\00\00129\000\001", null, !8, !45, [4 x %struct.aminoacids]* @homosapiens_orig, null} ; [ DW_TAG_variable ] [homosapiens_orig] [line 129] [def]
!45 = !{!"0x1\00\000\00512\0064\000\000\000", null, null, !16, !46, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 64, offset 0] [from aminoacids]
!46 = !{!47}
!47 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!48 = !{!"0x34\00alu\00alu\00\00140\000\001", null, !8, !4, i8** @alu, null} ; [ DW_TAG_variable ] [alu] [line 140] [def]
!49 = !{!"0x34\00outStream\00outStream\00\0015\000\001", null, !8, !50, %struct._IO_FILE** @outStream, null} ; [ DW_TAG_variable ] [outStream] [line 15] [def]
!50 = !{!"0xf\00\000\0064\0064\000\000", null, null, !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!51 = !{!"0x16\00FILE\0048\000\000\000\000", !52, null, !53} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!52 = !{!"/usr/include/stdio.h", !"/media/llvm/OSR/shootout/fasta/C"}
!53 = !{!"0x13\00_IO_FILE\00245\001728\0064\000\000\000", !54, null, null, !55, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!54 = !{!"/usr/include/libio.h", !"/media/llvm/OSR/shootout/fasta/C"}
!55 = !{!56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !76, !77, !78, !79, !82, !84, !86, !90, !93, !95, !97, !98, !99, !100, !104, !105}
!56 = !{!"0xd\00_flags\00246\0032\0032\000\000", !54, !53, !20} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!57 = !{!"0xd\00_IO_read_ptr\00251\0064\0064\0064\000", !54, !53, !4} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!58 = !{!"0xd\00_IO_read_end\00252\0064\0064\00128\000", !54, !53, !4} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!59 = !{!"0xd\00_IO_read_base\00253\0064\0064\00192\000", !54, !53, !4} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!60 = !{!"0xd\00_IO_write_base\00254\0064\0064\00256\000", !54, !53, !4} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!61 = !{!"0xd\00_IO_write_ptr\00255\0064\0064\00320\000", !54, !53, !4} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!62 = !{!"0xd\00_IO_write_end\00256\0064\0064\00384\000", !54, !53, !4} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!63 = !{!"0xd\00_IO_buf_base\00257\0064\0064\00448\000", !54, !53, !4} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!64 = !{!"0xd\00_IO_buf_end\00258\0064\0064\00512\000", !54, !53, !4} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!65 = !{!"0xd\00_IO_save_base\00260\0064\0064\00576\000", !54, !53, !4} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!66 = !{!"0xd\00_IO_backup_base\00261\0064\0064\00640\000", !54, !53, !4} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!67 = !{!"0xd\00_IO_save_end\00262\0064\0064\00704\000", !54, !53, !4} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!68 = !{!"0xd\00_markers\00264\0064\0064\00768\000", !54, !53, !69} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!69 = !{!"0xf\00\000\0064\0064\000\000", null, null, !70} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!70 = !{!"0x13\00_IO_marker\00160\00192\0064\000\000\000", !54, null, null, !71, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!71 = !{!72, !73, !75}
!72 = !{!"0xd\00_next\00161\0064\0064\000\000", !54, !70, !69} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!73 = !{!"0xd\00_sbuf\00162\0064\0064\0064\000", !54, !70, !74} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!74 = !{!"0xf\00\000\0064\0064\000\000", null, null, !53} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!75 = !{!"0xd\00_pos\00166\0032\0032\00128\000", !54, !70, !20} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!76 = !{!"0xd\00_chain\00266\0064\0064\00832\000", !54, !53, !74} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!77 = !{!"0xd\00_fileno\00268\0032\0032\00896\000", !54, !53, !20} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!78 = !{!"0xd\00_flags2\00272\0032\0032\00928\000", !54, !53, !20} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!79 = !{!"0xd\00_old_offset\00274\0064\0064\00960\000", !54, !53, !80} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!80 = !{!"0x16\00__off_t\00131\000\000\000\000", !81, null, !39} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!81 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/media/llvm/OSR/shootout/fasta/C"}
!82 = !{!"0xd\00_cur_column\00278\0016\0016\001024\000", !54, !53, !83} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!83 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!84 = !{!"0xd\00_vtable_offset\00279\008\008\001040\000", !54, !53, !85} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!85 = !{!"0x24\00signed char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!86 = !{!"0xd\00_shortbuf\00280\008\008\001048\000", !54, !53, !87} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!87 = !{!"0x1\00\000\008\008\000\000\000", null, null, !5, !88, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!88 = !{!89}
!89 = !{!"0x21\000\001"}                          ; [ DW_TAG_subrange_type ] [0, 0]
!90 = !{!"0xd\00_lock\00284\0064\0064\001088\000", !54, !53, !91} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!91 = !{!"0xf\00\000\0064\0064\000\000", null, null, !92} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_lock_t]
!92 = !{!"0x16\00_IO_lock_t\00154\000\000\000\000", !54, null, null} ; [ DW_TAG_typedef ] [_IO_lock_t] [line 154, size 0, align 0, offset 0] [from ]
!93 = !{!"0xd\00_offset\00293\0064\0064\001152\000", !54, !53, !94} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!94 = !{!"0x16\00__off64_t\00132\000\000\000\000", !81, null, !39} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!95 = !{!"0xd\00__pad1\00302\0064\0064\001216\000", !54, !53, !96} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!96 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!97 = !{!"0xd\00__pad2\00303\0064\0064\001280\000", !54, !53, !96} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!98 = !{!"0xd\00__pad3\00304\0064\0064\001344\000", !54, !53, !96} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!99 = !{!"0xd\00__pad4\00305\0064\0064\001408\000", !54, !53, !96} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!100 = !{!"0xd\00__pad5\00306\0064\0064\001472\000", !54, !53, !101} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!101 = !{!"0x16\00size_t\0062\000\000\000\000", !102, null, !103} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!102 = !{!"/usr/local/bin/../lib/clang/3.6.2/include/stddef.h", !"/media/llvm/OSR/shootout/fasta/C"}
!103 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!104 = !{!"0xd\00_mode\00308\0032\0032\001536\000", !54, !53, !20} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!105 = !{!"0xd\00_unused2\00310\00160\008\001568\000", !54, !53, !106} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!106 = !{!"0x1\00\000\00160\008\000\000\000", null, null, !5, !107, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!107 = !{!108}
!108 = !{!"0x21\000\0020"}                        ; [ DW_TAG_subrange_type ] [0, 19]
!109 = !{!"0x34\00iub\00iub\00\00125\000\001", null, !8, !41, [15 x %struct.aminoacids]* @iub, null} ; [ DW_TAG_variable ] [iub] [line 125] [def]
!110 = !{!"0x34\00homosapiens\00homosapiens\00\00136\000\001", null, !8, !45, [4 x %struct.aminoacids]* @homosapiens, null} ; [ DW_TAG_variable ] [homosapiens] [line 136] [def]
!111 = !{i32 2, !"Dwarf Version", i32 4}
!112 = !{i32 2, !"Debug Info Version", i32 2}
!113 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!114 = !{!"0x101\00max\0016777233\000", !7, !8, !11} ; [ DW_TAG_arg_variable ] [max] [line 17]
!115 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!116 = !MDLocation(line: 17, column: 27, scope: !7)
!117 = !MDLocation(line: 19, column: 12, scope: !7)
!118 = !MDLocation(line: 19, column: 27, scope: !7)
!119 = !MDLocation(line: 19, column: 26, scope: !7)
!120 = !MDLocation(line: 19, column: 19, scope: !7)
!121 = !MDLocation(line: 19, column: 18, scope: !7)
!122 = !MDLocation(line: 19, column: 5, scope: !7)
!123 = !{!"0x101\00genelist\0016777245\000", !12, !8, !15} ; [ DW_TAG_arg_variable ] [genelist] [line 29]
!124 = !MDLocation(line: 29, column: 42, scope: !12)
!125 = !{!"0x101\00count\0033554461\000", !12, !8, !20} ; [ DW_TAG_arg_variable ] [count] [line 29]
!126 = !MDLocation(line: 29, column: 56, scope: !12)
!127 = !{!"0x100\00cp\0030\000", !12, !8, !11}    ; [ DW_TAG_auto_variable ] [cp] [line 30]
!128 = !MDLocation(line: 30, column: 12, scope: !12)
!129 = !{!"0x100\00i\0031\000", !12, !8, !20}     ; [ DW_TAG_auto_variable ] [i] [line 31]
!130 = !MDLocation(line: 31, column: 9, scope: !12)
!131 = !MDLocation(line: 33, column: 10, scope: !132)
!132 = !{!"0xb\0033\005\000", !1, !12}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!133 = !MDLocation(line: 33, column: 15, scope: !134)
!134 = !{!"0xb\002", !1, !135}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!135 = !{!"0xb\001", !1, !136}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!136 = !{!"0xb\0033\005\001", !1, !132}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!137 = !MDLocation(line: 33, column: 19, scope: !136)
!138 = !MDLocation(line: 33, column: 15, scope: !136)
!139 = !MDLocation(line: 33, column: 5, scope: !132)
!140 = !MDLocation(line: 34, column: 24, scope: !141)
!141 = !{!"0xb\0033\0031\002", !1, !136}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!142 = !MDLocation(line: 34, column: 15, scope: !141)
!143 = !MDLocation(line: 34, column: 9, scope: !141)
!144 = !MDLocation(line: 35, column: 25, scope: !141)
!145 = !MDLocation(line: 35, column: 18, scope: !141)
!146 = !MDLocation(line: 35, column: 9, scope: !141)
!147 = !MDLocation(line: 36, column: 5, scope: !141)
!148 = !MDLocation(line: 33, column: 26, scope: !136)
!149 = !MDLocation(line: 33, column: 5, scope: !136)
!150 = !MDLocation(line: 37, column: 1, scope: !12)
!151 = !{!"0x101\00genelist\0016777255\000", !21, !8, !24} ; [ DW_TAG_arg_variable ] [genelist] [line 39]
!152 = !MDLocation(line: 39, column: 46, scope: !21)
!153 = !{!"0x101\00count\0033554471\000", !21, !8, !20} ; [ DW_TAG_arg_variable ] [count] [line 39]
!154 = !MDLocation(line: 39, column: 60, scope: !21)
!155 = !{!"0x100\00r\0040\000", !21, !8, !11}     ; [ DW_TAG_auto_variable ] [r] [line 40]
!156 = !MDLocation(line: 40, column: 12, scope: !21)
!157 = !MDLocation(line: 40, column: 16, scope: !21)
!158 = !{!"0x100\00i\0041\000", !21, !8, !20}     ; [ DW_TAG_auto_variable ] [i] [line 41]
!159 = !MDLocation(line: 41, column: 9, scope: !21)
!160 = !{!"0x100\00lo\0041\000", !21, !8, !20}    ; [ DW_TAG_auto_variable ] [lo] [line 41]
!161 = !MDLocation(line: 41, column: 12, scope: !21)
!162 = !{!"0x100\00hi\0041\000", !21, !8, !20}    ; [ DW_TAG_auto_variable ] [hi] [line 41]
!163 = !MDLocation(line: 41, column: 16, scope: !21)
!164 = !MDLocation(line: 43, column: 9, scope: !165)
!165 = !{!"0xb\0043\009\003", !1, !21}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!166 = !MDLocation(line: 43, column: 13, scope: !165)
!167 = !MDLocation(line: 43, column: 9, scope: !21)
!168 = !MDLocation(line: 43, column: 35, scope: !169)
!169 = !{!"0xb\001", !1, !165}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!170 = !MDLocation(line: 43, column: 28, scope: !165)
!171 = !MDLocation(line: 45, column: 5, scope: !21)
!172 = !MDLocation(line: 46, column: 10, scope: !21)
!173 = !MDLocation(line: 46, column: 5, scope: !21)
!174 = !MDLocation(line: 48, column: 5, scope: !21)
!175 = !MDLocation(line: 48, column: 12, scope: !176)
!176 = !{!"0xb\002", !1, !177}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!177 = !{!"0xb\001", !1, !21}                     ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!178 = !MDLocation(line: 48, column: 17, scope: !21)
!179 = !MDLocation(line: 48, column: 12, scope: !21)
!180 = !MDLocation(line: 49, column: 14, scope: !181)
!181 = !{!"0xb\0048\0023\004", !1, !21}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!182 = !MDLocation(line: 49, column: 19, scope: !181)
!183 = !MDLocation(line: 49, column: 13, scope: !181)
!184 = !MDLocation(line: 49, column: 9, scope: !181)
!185 = !MDLocation(line: 50, column: 13, scope: !186)
!186 = !{!"0xb\0050\0013\005", !1, !181}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!187 = !MDLocation(line: 50, column: 26, scope: !186)
!188 = !MDLocation(line: 50, column: 17, scope: !186)
!189 = !MDLocation(line: 50, column: 13, scope: !181)
!190 = !MDLocation(line: 50, column: 37, scope: !191)
!191 = !{!"0xb\001", !1, !186}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!192 = !MDLocation(line: 50, column: 32, scope: !186)
!193 = !MDLocation(line: 50, column: 50, scope: !194)
!194 = !{!"0xb\002", !1, !186}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!195 = !MDLocation(line: 50, column: 45, scope: !186)
!196 = !MDLocation(line: 52, column: 21, scope: !21)
!197 = !MDLocation(line: 52, column: 12, scope: !21)
!198 = !MDLocation(line: 52, column: 5, scope: !21)
!199 = !MDLocation(line: 53, column: 1, scope: !21)
!200 = !{!"0x101\00id\0016777275\000", !26, !8, !29} ; [ DW_TAG_arg_variable ] [id] [line 59]
!201 = !MDLocation(line: 59, column: 36, scope: !26)
!202 = !{!"0x101\00desc\0033554491\000", !26, !8, !29} ; [ DW_TAG_arg_variable ] [desc] [line 59]
!203 = !MDLocation(line: 59, column: 53, scope: !26)
!204 = !{!"0x101\00genelist\0050331708\000", !26, !8, !24} ; [ DW_TAG_arg_variable ] [genelist] [line 60]
!205 = !MDLocation(line: 60, column: 14, scope: !26)
!206 = !{!"0x101\00count\0067108924\000", !26, !8, !20} ; [ DW_TAG_arg_variable ] [count] [line 60]
!207 = !MDLocation(line: 60, column: 28, scope: !26)
!208 = !{!"0x101\00n\0083886140\000", !26, !8, !20} ; [ DW_TAG_arg_variable ] [n] [line 60]
!209 = !MDLocation(line: 60, column: 39, scope: !26)
!210 = !{!"0x100\00todo\0061\000", !26, !8, !20}  ; [ DW_TAG_auto_variable ] [todo] [line 61]
!211 = !MDLocation(line: 61, column: 8, scope: !26)
!212 = !MDLocation(line: 61, column: 15, scope: !26)
!213 = !{!"0x100\00i\0062\000", !26, !8, !20}     ; [ DW_TAG_auto_variable ] [i] [line 62]
!214 = !MDLocation(line: 62, column: 8, scope: !26)
!215 = !{!"0x100\00m\0062\000", !26, !8, !20}     ; [ DW_TAG_auto_variable ] [m] [line 62]
!216 = !MDLocation(line: 62, column: 11, scope: !26)
!217 = !MDLocation(line: 64, column: 13, scope: !26)
!218 = !MDLocation(line: 64, column: 36, scope: !26)
!219 = !MDLocation(line: 64, column: 40, scope: !26)
!220 = !MDLocation(line: 64, column: 4, scope: !26)
!221 = !MDLocation(line: 66, column: 4, scope: !26)
!222 = !MDLocation(line: 66, column: 11, scope: !223)
!223 = !{!"0xb\002", !1, !224}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!224 = !{!"0xb\001", !1, !225}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!225 = !{!"0xb\0066\004\007", !1, !226}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!226 = !{!"0xb\0066\004\006", !1, !26}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!227 = !MDLocation(line: 66, column: 4, scope: !226)
!228 = !{!"0x100\00pick\0067\000", !229, !8, !230} ; [ DW_TAG_auto_variable ] [pick] [line 67]
!229 = !{!"0xb\0066\0042\008", !1, !225}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!230 = !{!"0x1\00\000\00488\008\000\000\000", null, null, !5, !231, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 488, align 8, offset 0] [from char]
!231 = !{!232}
!232 = !{!"0x21\000\0061"}                        ; [ DW_TAG_subrange_type ] [0, 60]
!233 = !MDLocation(line: 67, column: 13, scope: !229)
!234 = !MDLocation(line: 68, column: 12, scope: !235)
!235 = !{!"0xb\0068\0012\009", !1, !229}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!236 = !MDLocation(line: 68, column: 12, scope: !229)
!237 = !MDLocation(line: 68, column: 36, scope: !238)
!238 = !{!"0xb\001", !1, !235}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!239 = !MDLocation(line: 68, column: 32, scope: !235)
!240 = !MDLocation(line: 68, column: 47, scope: !241)
!241 = !{!"0xb\002", !1, !235}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!242 = !MDLocation(line: 69, column: 13, scope: !243)
!243 = !{!"0xb\0069\008\0010", !1, !229}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!244 = !MDLocation(line: 69, column: 18, scope: !245)
!245 = !{!"0xb\004", !1, !246}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!246 = !{!"0xb\001", !1, !247}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!247 = !{!"0xb\0069\008\0011", !1, !243}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!248 = !MDLocation(line: 69, column: 22, scope: !247)
!249 = !MDLocation(line: 69, column: 18, scope: !247)
!250 = !MDLocation(line: 69, column: 8, scope: !243)
!251 = !MDLocation(line: 69, column: 54, scope: !252)
!252 = !{!"0xb\002", !1, !247}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!253 = !MDLocation(line: 69, column: 64, scope: !247)
!254 = !MDLocation(line: 69, column: 40, scope: !247)
!255 = !MDLocation(line: 69, column: 35, scope: !247)
!256 = !MDLocation(line: 69, column: 30, scope: !247)
!257 = !MDLocation(line: 69, column: 25, scope: !258)
!258 = !{!"0xb\003", !1, !247}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!259 = !MDLocation(line: 69, column: 8, scope: !247)
!260 = !MDLocation(line: 70, column: 13, scope: !229)
!261 = !MDLocation(line: 70, column: 8, scope: !229)
!262 = !MDLocation(line: 71, column: 15, scope: !229)
!263 = !MDLocation(line: 71, column: 21, scope: !229)
!264 = !MDLocation(line: 71, column: 8, scope: !229)
!265 = !MDLocation(line: 72, column: 4, scope: !229)
!266 = !MDLocation(line: 66, column: 21, scope: !225)
!267 = !MDLocation(line: 66, column: 4, scope: !225)
!268 = !MDLocation(line: 73, column: 1, scope: !26)
!269 = !{!"0x101\00id\0016777291\000", !31, !8, !29} ; [ DW_TAG_arg_variable ] [id] [line 75]
!270 = !MDLocation(line: 75, column: 36, scope: !31)
!271 = !{!"0x101\00desc\0033554507\000", !31, !8, !29} ; [ DW_TAG_arg_variable ] [desc] [line 75]
!272 = !MDLocation(line: 75, column: 53, scope: !31)
!273 = !{!"0x101\00s\0050331724\000", !31, !8, !29} ; [ DW_TAG_arg_variable ] [s] [line 76]
!274 = !MDLocation(line: 76, column: 1, scope: !31)
!275 = !{!"0x101\00n\0067108940\000", !31, !8, !20} ; [ DW_TAG_arg_variable ] [n] [line 76]
!276 = !MDLocation(line: 76, column: 8, scope: !31)
!277 = !{!"0x100\00ss\0077\000", !31, !8, !4}     ; [ DW_TAG_auto_variable ] [ss] [line 77]
!278 = !MDLocation(line: 77, column: 11, scope: !31)
!279 = !{!"0x100\00todo\0078\000", !31, !8, !20}  ; [ DW_TAG_auto_variable ] [todo] [line 78]
!280 = !MDLocation(line: 78, column: 8, scope: !31)
!281 = !MDLocation(line: 78, column: 15, scope: !31)
!282 = !{!"0x100\00k\0078\000", !31, !8, !20}     ; [ DW_TAG_auto_variable ] [k] [line 78]
!283 = !MDLocation(line: 78, column: 18, scope: !31)
!284 = !{!"0x100\00kn\0078\000", !31, !8, !20}    ; [ DW_TAG_auto_variable ] [kn] [line 78]
!285 = !MDLocation(line: 78, column: 25, scope: !31)
!286 = !MDLocation(line: 78, column: 38, scope: !31)
!287 = !MDLocation(line: 78, column: 30, scope: !31)
!288 = !{!"0x100\00m\0079\000", !31, !8, !20}     ; [ DW_TAG_auto_variable ] [m] [line 79]
!289 = !MDLocation(line: 79, column: 8, scope: !31)
!290 = !MDLocation(line: 81, column: 26, scope: !31)
!291 = !MDLocation(line: 81, column: 18, scope: !31)
!292 = !MDLocation(line: 81, column: 4, scope: !31)
!293 = !MDLocation(line: 82, column: 12, scope: !31)
!294 = !MDLocation(line: 82, column: 16, scope: !31)
!295 = !MDLocation(line: 82, column: 19, scope: !31)
!296 = !MDLocation(line: 82, column: 4, scope: !31)
!297 = !MDLocation(line: 84, column: 13, scope: !31)
!298 = !MDLocation(line: 84, column: 36, scope: !31)
!299 = !MDLocation(line: 84, column: 40, scope: !31)
!300 = !MDLocation(line: 84, column: 4, scope: !31)
!301 = !MDLocation(line: 86, column: 4, scope: !31)
!302 = !MDLocation(line: 86, column: 11, scope: !303)
!303 = !{!"0xb\002", !1, !304}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!304 = !{!"0xb\001", !1, !305}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!305 = !{!"0xb\0086\004\0013", !1, !306}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!306 = !{!"0xb\0086\004\0012", !1, !31}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!307 = !MDLocation(line: 86, column: 4, scope: !306)
!308 = !MDLocation(line: 87, column: 12, scope: !309)
!309 = !{!"0xb\0087\0012\0015", !1, !310}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!310 = !{!"0xb\0086\0042\0014", !1, !305}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!311 = !MDLocation(line: 87, column: 12, scope: !310)
!312 = !MDLocation(line: 87, column: 36, scope: !313)
!313 = !{!"0xb\001", !1, !309}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!314 = !MDLocation(line: 87, column: 32, scope: !309)
!315 = !MDLocation(line: 87, column: 47, scope: !316)
!316 = !{!"0xb\002", !1, !309}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!317 = !MDLocation(line: 89, column: 8, scope: !310)
!318 = !MDLocation(line: 89, column: 15, scope: !319)
!319 = !{!"0xb\002", !1, !320}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!320 = !{!"0xb\001", !1, !310}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!321 = !MDLocation(line: 89, column: 20, scope: !310)
!322 = !MDLocation(line: 89, column: 25, scope: !310)
!323 = !MDLocation(line: 89, column: 15, scope: !310)
!324 = !MDLocation(line: 90, column: 21, scope: !325)
!325 = !{!"0xb\0089\0028\0016", !1, !310}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!326 = !MDLocation(line: 90, column: 38, scope: !325)
!327 = !MDLocation(line: 90, column: 40, scope: !325)
!328 = !MDLocation(line: 90, column: 12, scope: !325)
!329 = !MDLocation(line: 91, column: 17, scope: !325)
!330 = !MDLocation(line: 91, column: 22, scope: !325)
!331 = !MDLocation(line: 91, column: 12, scope: !325)
!332 = !MDLocation(line: 92, column: 12, scope: !325)
!333 = !MDLocation(line: 95, column: 11, scope: !310)
!334 = !MDLocation(line: 95, column: 15, scope: !310)
!335 = !MDLocation(line: 95, column: 8, scope: !310)
!336 = !MDLocation(line: 96, column: 15, scope: !310)
!337 = !MDLocation(line: 96, column: 18, scope: !310)
!338 = !MDLocation(line: 96, column: 21, scope: !310)
!339 = !MDLocation(line: 96, column: 8, scope: !310)
!340 = !MDLocation(line: 97, column: 22, scope: !310)
!341 = !MDLocation(line: 97, column: 24, scope: !310)
!342 = !MDLocation(line: 97, column: 20, scope: !310)
!343 = !MDLocation(line: 97, column: 11, scope: !310)
!344 = !MDLocation(line: 97, column: 15, scope: !310)
!345 = !MDLocation(line: 97, column: 8, scope: !310)
!346 = !MDLocation(line: 98, column: 13, scope: !310)
!347 = !MDLocation(line: 98, column: 8, scope: !310)
!348 = !MDLocation(line: 99, column: 4, scope: !310)
!349 = !MDLocation(line: 86, column: 21, scope: !305)
!350 = !MDLocation(line: 86, column: 4, scope: !305)
!351 = !MDLocation(line: 101, column: 10, scope: !31)
!352 = !MDLocation(line: 101, column: 4, scope: !31)
!353 = !MDLocation(line: 102, column: 1, scope: !31)
!354 = !{!"0x101\00inputN\0016777365\000", !34, !8, !20} ; [ DW_TAG_arg_variable ] [inputN] [line 149]
!355 = !MDLocation(line: 149, column: 15, scope: !34)
!356 = !{!"0x100\00n\00150\000", !34, !8, !20}    ; [ DW_TAG_auto_variable ] [n] [line 150]
!357 = !MDLocation(line: 150, column: 9, scope: !34)
!358 = !MDLocation(line: 152, column: 9, scope: !359)
!359 = !{!"0xb\00152\009\0017", !1, !34}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!360 = !MDLocation(line: 152, column: 9, scope: !34)
!361 = !MDLocation(line: 152, column: 25, scope: !362)
!362 = !{!"0xb\001", !1, !359}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/C/code.c]
!363 = !MDLocation(line: 152, column: 21, scope: !359)
!364 = !{!"0x100\00filename\00154\000", !34, !8, !365} ; [ DW_TAG_auto_variable ] [filename] [line 154]
!365 = !{!"0x1\00\000\00512\008\000\000\000", null, null, !5, !366, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!366 = !{!367}
!367 = !{!"0x21\000\0064"}                        ; [ DW_TAG_subrange_type ] [0, 63]
!368 = !MDLocation(line: 154, column: 10, scope: !34)
!369 = !MDLocation(line: 155, column: 13, scope: !34)
!370 = !MDLocation(line: 155, column: 39, scope: !34)
!371 = !MDLocation(line: 155, column: 5, scope: !34)
!372 = !MDLocation(line: 156, column: 23, scope: !34)
!373 = !MDLocation(line: 156, column: 17, scope: !34)
!374 = !MDLocation(line: 156, column: 5, scope: !34)
!375 = !MDLocation(line: 159, column: 5, scope: !34)
!376 = !MDLocation(line: 160, column: 5, scope: !34)
!377 = !MDLocation(line: 162, column: 5, scope: !34)
!378 = !MDLocation(line: 163, column: 5, scope: !34)
!379 = !MDLocation(line: 165, column: 49, scope: !34)
!380 = !MDLocation(line: 165, column: 54, scope: !34)
!381 = !MDLocation(line: 165, column: 5, scope: !34)
!382 = !MDLocation(line: 166, column: 66, scope: !34)
!383 = !MDLocation(line: 166, column: 5, scope: !34)
!384 = !MDLocation(line: 168, column: 18, scope: !34)
!385 = !MDLocation(line: 167, column: 5, scope: !34)
!386 = !MDLocation(line: 170, column: 12, scope: !34)
!387 = !MDLocation(line: 170, column: 5, scope: !34)
!388 = !MDLocation(line: 172, column: 5, scope: !34)
