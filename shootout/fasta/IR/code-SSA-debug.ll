; ModuleID = 'code-debug.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.aminoacids = type { i8, double }

@gen_random.last = internal global i64 42, align 8
@outStream = common global %struct._IO_FILE* null, align 8
@.str = private unnamed_addr constant [8 x i8] c">%s %s\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@iub = global [15 x %struct.aminoacids] [%struct.aminoacids { i8 97, double 2.700000e-01 }, %struct.aminoacids { i8 99, double 1.200000e-01 }, %struct.aminoacids { i8 103, double 1.200000e-01 }, %struct.aminoacids { i8 116, double 2.700000e-01 }, %struct.aminoacids { i8 66, double 2.000000e-02 }, %struct.aminoacids { i8 68, double 2.000000e-02 }, %struct.aminoacids { i8 72, double 2.000000e-02 }, %struct.aminoacids { i8 75, double 2.000000e-02 }, %struct.aminoacids { i8 77, double 2.000000e-02 }, %struct.aminoacids { i8 78, double 2.000000e-02 }, %struct.aminoacids { i8 82, double 2.000000e-02 }, %struct.aminoacids { i8 83, double 2.000000e-02 }, %struct.aminoacids { i8 86, double 2.000000e-02 }, %struct.aminoacids { i8 87, double 2.000000e-02 }, %struct.aminoacids { i8 89, double 2.000000e-02 }], align 16
@homosapiens = global [4 x %struct.aminoacids] [%struct.aminoacids { i8 97, double 0x3FD3639D20BAEB5B }, %struct.aminoacids { i8 99, double 0x3FC957AE3DCD561B }, %struct.aminoacids { i8 103, double 0x3FC9493AEAB6C2BF }, %struct.aminoacids { i8 116, double 0x3FD34BEE4B030838 }], align 16
@.str2 = private unnamed_addr constant [288 x i8] c"GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGGGAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGACCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAATACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCAGCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGGAGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCCAGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA\00", align 1
@alu = global i8* getelementptr inbounds ([288 x i8]* @.str2, i32 0, i32 0), align 8
@.str3 = private unnamed_addr constant [13 x i8] c"fasta-%d.txt\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"ONE\00", align 1
@.str6 = private unnamed_addr constant [17 x i8] c"Homo sapiens alu\00", align 1
@.str7 = private unnamed_addr constant [4 x i8] c"TWO\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"IUB ambiguity codes\00", align 1
@.str9 = private unnamed_addr constant [6 x i8] c"THREE\00", align 1
@.str10 = private unnamed_addr constant [23 x i8] c"Homo sapiens frequency\00", align 1

; Function Attrs: nounwind uwtable
define double @gen_random(double %max) #0 {
  call void @llvm.dbg.value(metadata double %max, i64 0, metadata !112, metadata !113), !dbg !114
  %1 = load i64* @gen_random.last, align 8, !dbg !115
  %2 = mul nsw i64 %1, 3877, !dbg !115
  %3 = add nsw i64 %2, 29573, !dbg !115
  %4 = srem i64 %3, 139968, !dbg !116
  store i64 %4, i64* @gen_random.last, align 8, !dbg !117
  %5 = sitofp i64 %4 to double, !dbg !118
  %6 = fmul double %max, %5, !dbg !119
  %7 = fdiv double %6, 1.399680e+05, !dbg !119
  ret double %7, !dbg !120
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @makeCumulative(%struct.aminoacids* %genelist, i32 %count) #0 {
  call void @llvm.dbg.value(metadata %struct.aminoacids* %genelist, i64 0, metadata !121, metadata !113), !dbg !122
  call void @llvm.dbg.value(metadata i32 %count, i64 0, metadata !123, metadata !113), !dbg !124
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !125, metadata !113), !dbg !126
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !127, metadata !113), !dbg !128
  br label %1, !dbg !129

; <label>:1                                       ; preds = %12, %0
  %cp.0 = phi double [ 0.000000e+00, %0 ], [ %8, %12 ]
  %i.0 = phi i32 [ 0, %0 ], [ %13, %12 ]
  %2 = icmp slt i32 %i.0, %count, !dbg !131
  br i1 %2, label %3, label %14, !dbg !133

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64, !dbg !134
  %5 = getelementptr inbounds %struct.aminoacids* %genelist, i64 %4, !dbg !134
  %6 = getelementptr inbounds %struct.aminoacids* %5, i32 0, i32 1, !dbg !134
  %7 = load double* %6, align 8, !dbg !134
  %8 = fadd double %cp.0, %7, !dbg !136
  call void @llvm.dbg.value(metadata double %8, i64 0, metadata !125, metadata !113), !dbg !126
  %9 = sext i32 %i.0 to i64, !dbg !137
  %10 = getelementptr inbounds %struct.aminoacids* %genelist, i64 %9, !dbg !137
  %11 = getelementptr inbounds %struct.aminoacids* %10, i32 0, i32 1, !dbg !137
  store double %8, double* %11, align 8, !dbg !137
  br label %12, !dbg !138

; <label>:12                                      ; preds = %3
  %13 = add nsw i32 %i.0, 1, !dbg !139
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !127, metadata !113), !dbg !128
  br label %1, !dbg !140

; <label>:14                                      ; preds = %1
  ret void, !dbg !141
}

; Function Attrs: nounwind uwtable
define signext i8 @selectRandom(%struct.aminoacids* %genelist, i32 %count) #0 {
  call void @llvm.dbg.value(metadata %struct.aminoacids* %genelist, i64 0, metadata !142, metadata !113), !dbg !143
  call void @llvm.dbg.value(metadata i32 %count, i64 0, metadata !144, metadata !113), !dbg !145
  %1 = call double @gen_random(double 1.000000e+00), !dbg !146
  call void @llvm.dbg.value(metadata double %1, i64 0, metadata !147, metadata !113), !dbg !148
  %2 = getelementptr inbounds %struct.aminoacids* %genelist, i64 0, !dbg !149
  %3 = getelementptr inbounds %struct.aminoacids* %2, i32 0, i32 1, !dbg !149
  %4 = load double* %3, align 8, !dbg !149
  %5 = fcmp olt double %1, %4, !dbg !151
  br i1 %5, label %6, label %10, !dbg !152

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.aminoacids* %genelist, i64 0, !dbg !153
  %8 = getelementptr inbounds %struct.aminoacids* %7, i32 0, i32 0, !dbg !153
  %9 = load i8* %8, align 1, !dbg !153
  br label %31, !dbg !155

; <label>:10                                      ; preds = %0
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !156, metadata !113), !dbg !157
  %11 = sub nsw i32 %count, 1, !dbg !158
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !159, metadata !113), !dbg !160
  br label %12, !dbg !161

; <label>:12                                      ; preds = %25, %10
  %lo.0 = phi i32 [ 0, %10 ], [ %lo.1, %25 ]
  %hi.0 = phi i32 [ %11, %10 ], [ %hi.1, %25 ]
  %13 = add nsw i32 %lo.0, 1, !dbg !162
  %14 = icmp sgt i32 %hi.0, %13, !dbg !163
  br i1 %14, label %15, label %26, !dbg !161

; <label>:15                                      ; preds = %12
  %16 = add nsw i32 %hi.0, %lo.0, !dbg !164
  %17 = sdiv i32 %16, 2, !dbg !166
  call void @llvm.dbg.value(metadata i32 %17, i64 0, metadata !167, metadata !113), !dbg !168
  %18 = sext i32 %17 to i64, !dbg !169
  %19 = getelementptr inbounds %struct.aminoacids* %genelist, i64 %18, !dbg !169
  %20 = getelementptr inbounds %struct.aminoacids* %19, i32 0, i32 1, !dbg !169
  %21 = load double* %20, align 8, !dbg !169
  %22 = fcmp olt double %1, %21, !dbg !171
  br i1 %22, label %23, label %24, !dbg !172

; <label>:23                                      ; preds = %15
  call void @llvm.dbg.value(metadata i32 %17, i64 0, metadata !159, metadata !113), !dbg !160
  br label %25, !dbg !173

; <label>:24                                      ; preds = %15
  call void @llvm.dbg.value(metadata i32 %17, i64 0, metadata !156, metadata !113), !dbg !157
  br label %25

; <label>:25                                      ; preds = %24, %23
  %lo.1 = phi i32 [ %lo.0, %23 ], [ %17, %24 ]
  %hi.1 = phi i32 [ %17, %23 ], [ %hi.0, %24 ]
  br label %12, !dbg !161

; <label>:26                                      ; preds = %12
  %27 = sext i32 %hi.0 to i64, !dbg !174
  %28 = getelementptr inbounds %struct.aminoacids* %genelist, i64 %27, !dbg !174
  %29 = getelementptr inbounds %struct.aminoacids* %28, i32 0, i32 0, !dbg !174
  %30 = load i8* %29, align 1, !dbg !174
  br label %31, !dbg !175

; <label>:31                                      ; preds = %26, %6
  %.0 = phi i8 [ %9, %6 ], [ %30, %26 ]
  ret i8 %.0, !dbg !176
}

; Function Attrs: nounwind uwtable
define void @makeRandomFasta(i8* %id, i8* %desc, %struct.aminoacids* %genelist, i32 %count, i32 %n) #0 {
  %pick = alloca [61 x i8], align 16
  call void @llvm.dbg.value(metadata i8* %id, i64 0, metadata !177, metadata !113), !dbg !178
  call void @llvm.dbg.value(metadata i8* %desc, i64 0, metadata !179, metadata !113), !dbg !180
  call void @llvm.dbg.value(metadata %struct.aminoacids* %genelist, i64 0, metadata !181, metadata !113), !dbg !182
  call void @llvm.dbg.value(metadata i32 %count, i64 0, metadata !183, metadata !113), !dbg !184
  call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !185, metadata !113), !dbg !186
  call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !187, metadata !113), !dbg !188
  %1 = load %struct._IO_FILE** @outStream, align 8, !dbg !189
  %2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* %id, i8* %desc), !dbg !190
  br label %3, !dbg !191

; <label>:3                                       ; preds = %24, %0
  %todo.0 = phi i32 [ %n, %0 ], [ %25, %24 ]
  %4 = icmp sgt i32 %todo.0, 0, !dbg !192
  br i1 %4, label %5, label %26, !dbg !197

; <label>:5                                       ; preds = %3
  call void @llvm.dbg.declare(metadata [61 x i8]* %pick, metadata !198, metadata !113), !dbg !203
  %6 = icmp slt i32 %todo.0, 60, !dbg !204
  br i1 %6, label %7, label %8, !dbg !206

; <label>:7                                       ; preds = %5
  call void @llvm.dbg.value(metadata i32 %todo.0, i64 0, metadata !207, metadata !113), !dbg !208
  br label %9, !dbg !209

; <label>:8                                       ; preds = %5
  call void @llvm.dbg.value(metadata i32 60, i64 0, metadata !207, metadata !113), !dbg !208
  br label %9

; <label>:9                                       ; preds = %8, %7
  %m.0 = phi i32 [ %todo.0, %7 ], [ 60, %8 ]
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !210, metadata !113), !dbg !211
  br label %10, !dbg !212

; <label>:10                                      ; preds = %16, %9
  %i.0 = phi i32 [ 0, %9 ], [ %17, %16 ]
  %11 = icmp slt i32 %i.0, %m.0, !dbg !214
  br i1 %11, label %12, label %18, !dbg !216

; <label>:12                                      ; preds = %10
  %13 = call signext i8 @selectRandom(%struct.aminoacids* %genelist, i32 %count), !dbg !217
  %14 = sext i32 %i.0 to i64, !dbg !218
  %15 = getelementptr inbounds [61 x i8]* %pick, i32 0, i64 %14, !dbg !218
  store i8 %13, i8* %15, align 1, !dbg !218
  br label %16, !dbg !218

; <label>:16                                      ; preds = %12
  %17 = add nsw i32 %i.0, 1, !dbg !219
  call void @llvm.dbg.value(metadata i32 %17, i64 0, metadata !210, metadata !113), !dbg !211
  br label %10, !dbg !221

; <label>:18                                      ; preds = %10
  %19 = sext i32 %m.0 to i64, !dbg !222
  %20 = getelementptr inbounds [61 x i8]* %pick, i32 0, i64 %19, !dbg !222
  store i8 0, i8* %20, align 1, !dbg !222
  %21 = getelementptr inbounds [61 x i8]* %pick, i32 0, i32 0, !dbg !223
  %22 = load %struct._IO_FILE** @outStream, align 8, !dbg !224
  %23 = call i32 @fputs(i8* %21, %struct._IO_FILE* %22), !dbg !225
  br label %24, !dbg !226

; <label>:24                                      ; preds = %18
  %25 = sub nsw i32 %todo.0, 60, !dbg !227
  call void @llvm.dbg.value(metadata i32 %25, i64 0, metadata !187, metadata !113), !dbg !188
  br label %3, !dbg !228

; <label>:26                                      ; preds = %3
  ret void, !dbg !229
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @fputs(i8*, %struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define void @makeRepeatFasta(i8* %id, i8* %desc, i8* %s, i32 %n) #0 {
  call void @llvm.dbg.value(metadata i8* %id, i64 0, metadata !230, metadata !113), !dbg !231
  call void @llvm.dbg.value(metadata i8* %desc, i64 0, metadata !232, metadata !113), !dbg !233
  call void @llvm.dbg.value(metadata i8* %s, i64 0, metadata !234, metadata !113), !dbg !235
  call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !236, metadata !113), !dbg !237
  call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !238, metadata !113), !dbg !239
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !240, metadata !113), !dbg !241
  %1 = call i64 @strlen(i8* %s) #6, !dbg !242
  %2 = trunc i64 %1 to i32, !dbg !242
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !243, metadata !113), !dbg !244
  %3 = add nsw i32 %2, 1, !dbg !245
  %4 = sext i32 %3 to i64, !dbg !245
  %5 = call noalias i8* @malloc(i64 %4) #5, !dbg !246
  call void @llvm.dbg.value(metadata i8* %5, i64 0, metadata !247, metadata !113), !dbg !248
  %6 = add nsw i32 %2, 1, !dbg !249
  %7 = sext i32 %6 to i64, !dbg !249
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %s, i64 %7, i32 1, i1 false), !dbg !250
  %8 = load %struct._IO_FILE** @outStream, align 8, !dbg !251
  %9 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* %id, i8* %desc), !dbg !252
  br label %10, !dbg !253

; <label>:10                                      ; preds = %43, %0
  %todo.0 = phi i32 [ %n, %0 ], [ %44, %43 ]
  %k.0 = phi i32 [ 0, %0 ], [ %42, %43 ]
  %11 = icmp sgt i32 %todo.0, 0, !dbg !254
  br i1 %11, label %12, label %45, !dbg !259

; <label>:12                                      ; preds = %10
  %13 = icmp slt i32 %todo.0, 60, !dbg !260
  br i1 %13, label %14, label %15, !dbg !263

; <label>:14                                      ; preds = %12
  call void @llvm.dbg.value(metadata i32 %todo.0, i64 0, metadata !264, metadata !113), !dbg !265
  br label %16, !dbg !266

; <label>:15                                      ; preds = %12
  call void @llvm.dbg.value(metadata i32 60, i64 0, metadata !264, metadata !113), !dbg !265
  br label %16

; <label>:16                                      ; preds = %15, %14
  %m.0 = phi i32 [ %todo.0, %14 ], [ 60, %15 ]
  br label %17, !dbg !267

; <label>:17                                      ; preds = %20, %16
  %k.1 = phi i32 [ %k.0, %16 ], [ 0, %20 ]
  %m.1 = phi i32 [ %m.0, %16 ], [ %26, %20 ]
  %18 = sub nsw i32 %2, %k.1, !dbg !268
  %19 = icmp sge i32 %m.1, %18, !dbg !269
  br i1 %19, label %20, label %27, !dbg !267

; <label>:20                                      ; preds = %17
  %21 = load %struct._IO_FILE** @outStream, align 8, !dbg !270
  %22 = sext i32 %k.1 to i64, !dbg !272
  %23 = getelementptr inbounds i8* %s, i64 %22, !dbg !272
  %24 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* %23), !dbg !273
  %25 = sub nsw i32 %2, %k.1, !dbg !274
  %26 = sub nsw i32 %m.1, %25, !dbg !275
  call void @llvm.dbg.value(metadata i32 %26, i64 0, metadata !264, metadata !113), !dbg !265
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !240, metadata !113), !dbg !241
  br label %17, !dbg !267

; <label>:27                                      ; preds = %17
  %28 = add nsw i32 %k.1, %m.1, !dbg !276
  %29 = sext i32 %28 to i64, !dbg !277
  %30 = getelementptr inbounds i8* %5, i64 %29, !dbg !277
  store i8 0, i8* %30, align 1, !dbg !277
  %31 = sext i32 %k.1 to i64, !dbg !278
  %32 = getelementptr inbounds i8* %5, i64 %31, !dbg !278
  %33 = load %struct._IO_FILE** @outStream, align 8, !dbg !279
  %34 = call i32 @fputs(i8* %32, %struct._IO_FILE* %33), !dbg !280
  %35 = add nsw i32 %m.1, %k.1, !dbg !281
  %36 = sext i32 %35 to i64, !dbg !282
  %37 = getelementptr inbounds i8* %s, i64 %36, !dbg !282
  %38 = load i8* %37, align 1, !dbg !282
  %39 = add nsw i32 %k.1, %m.1, !dbg !283
  %40 = sext i32 %39 to i64, !dbg !284
  %41 = getelementptr inbounds i8* %5, i64 %40, !dbg !284
  store i8 %38, i8* %41, align 1, !dbg !284
  %42 = add nsw i32 %k.1, %m.1, !dbg !285
  call void @llvm.dbg.value(metadata i32 %42, i64 0, metadata !240, metadata !113), !dbg !241
  br label %43, !dbg !286

; <label>:43                                      ; preds = %27
  %44 = sub nsw i32 %todo.0, 60, !dbg !287
  call void @llvm.dbg.value(metadata i32 %44, i64 0, metadata !238, metadata !113), !dbg !239
  br label %10, !dbg !288

; <label>:45                                      ; preds = %10
  call void @free(i8* %5) #5, !dbg !289
  ret void, !dbg !290
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
  %filename = alloca [64 x i8], align 16
  call void @llvm.dbg.value(metadata i32 %inputN, i64 0, metadata !291, metadata !113), !dbg !292
  call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !293, metadata !113), !dbg !294
  %1 = icmp sgt i32 %inputN, 1, !dbg !295
  br i1 %1, label %2, label %3, !dbg !297

; <label>:2                                       ; preds = %0
  call void @llvm.dbg.value(metadata i32 %inputN, i64 0, metadata !293, metadata !113), !dbg !294
  br label %3, !dbg !298

; <label>:3                                       ; preds = %2, %0
  %n.0 = phi i32 [ %inputN, %2 ], [ 1000, %0 ]
  call void @llvm.dbg.declare(metadata [64 x i8]* %filename, metadata !299, metadata !113), !dbg !303
  %4 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0, !dbg !304
  %5 = call i32 (i8*, i8*, ...)* @sprintf(i8* %4, i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0), i32 %n.0) #5, !dbg !305
  %6 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0, !dbg !306
  %7 = call %struct._IO_FILE* @fopen(i8* %6, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0)), !dbg !307
  store %struct._IO_FILE* %7, %struct._IO_FILE** @outStream, align 8, !dbg !308
  call void @makeCumulative(%struct.aminoacids* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i32 0, i32 0), i32 15), !dbg !309
  call void @makeCumulative(%struct.aminoacids* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i32 0, i32 0), i32 4), !dbg !310
  %8 = load i8** @alu, align 8, !dbg !311
  %9 = mul nsw i32 %n.0, 2, !dbg !312
  call void @makeRepeatFasta(i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @.str6, i32 0, i32 0), i8* %8, i32 %9), !dbg !313
  %10 = mul nsw i32 %n.0, 3, !dbg !314
  call void @makeRandomFasta(i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), %struct.aminoacids* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i32 0, i32 0), i32 15, i32 %10), !dbg !315
  %11 = mul nsw i32 %n.0, 5, !dbg !316
  call void @makeRandomFasta(i8* getelementptr inbounds ([6 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8]* @.str10, i32 0, i32 0), %struct.aminoacids* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i32 0, i32 0), i32 4, i32 %11), !dbg !317
  %12 = load %struct._IO_FILE** @outStream, align 8, !dbg !318
  %13 = call i32 @fclose(%struct._IO_FILE* %12), !dbg !319
  ret i32 0, !dbg !320
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #4

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!109, !110}
!llvm.ident = !{!111}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !3, !6, !37, !2} ; [ DW_TAG_compile_unit ] [/media/llvm/OSR/shootout/fasta/code.c] [DW_LANG_C99]
!1 = !{!"code.c", !"/media/llvm/OSR/shootout/fasta"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!5 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!6 = !{!7, !12, !21, !26, !31, !34}
!7 = !{!"0x2e\00gen_random\00gen_random\00\0017\000\001\000\000\00256\000\0017", !1, !8, !9, null, double (double)* @gen_random, null, null, !2} ; [ DW_TAG_subprogram ] [line 17] [def] [gen_random]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/media/llvm/OSR/shootout/fasta/code.c]
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
!34 = !{!"0x2e\00bench\00bench\00\00145\000\001\000\000\00256\000\00145", !1, !8, !35, null, i32 (i32)* @bench, null, null, !2} ; [ DW_TAG_subprogram ] [line 145] [def] [bench]
!35 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !36, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = !{!20, !20}
!37 = !{!38, !40, !44, !48, !49}
!38 = !{!"0x34\00last\00last\00\0018\001\001", !7, !8, !39, i64* @gen_random.last, null} ; [ DW_TAG_variable ] [last] [line 18] [local] [def]
!39 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!40 = !{!"0x34\00iub\00iub\00\00106\000\001", null, !8, !41, [15 x %struct.aminoacids]* @iub, null} ; [ DW_TAG_variable ] [iub] [line 106] [def]
!41 = !{!"0x1\00\000\001920\0064\000\000\000", null, null, !16, !42, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1920, align 64, offset 0] [from aminoacids]
!42 = !{!43}
!43 = !{!"0x21\000\0015"}                         ; [ DW_TAG_subrange_type ] [0, 14]
!44 = !{!"0x34\00homosapiens\00homosapiens\00\00127\000\001", null, !8, !45, [4 x %struct.aminoacids]* @homosapiens, null} ; [ DW_TAG_variable ] [homosapiens] [line 127] [def]
!45 = !{!"0x1\00\000\00512\0064\000\000\000", null, null, !16, !46, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 64, offset 0] [from aminoacids]
!46 = !{!47}
!47 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!48 = !{!"0x34\00alu\00alu\00\00136\000\001", null, !8, !4, i8** @alu, null} ; [ DW_TAG_variable ] [alu] [line 136] [def]
!49 = !{!"0x34\00outStream\00outStream\00\0015\000\001", null, !8, !50, %struct._IO_FILE** @outStream, null} ; [ DW_TAG_variable ] [outStream] [line 15] [def]
!50 = !{!"0xf\00\000\0064\0064\000\000", null, null, !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!51 = !{!"0x16\00FILE\0048\000\000\000\000", !52, null, !53} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!52 = !{!"/usr/include/stdio.h", !"/media/llvm/OSR/shootout/fasta"}
!53 = !{!"0x13\00_IO_FILE\00245\001728\0064\000\000\000", !54, null, null, !55, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!54 = !{!"/usr/include/libio.h", !"/media/llvm/OSR/shootout/fasta"}
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
!81 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/media/llvm/OSR/shootout/fasta"}
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
!102 = !{!"/usr/local/bin/../lib/clang/3.6.2/include/stddef.h", !"/media/llvm/OSR/shootout/fasta"}
!103 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!104 = !{!"0xd\00_mode\00308\0032\0032\001536\000", !54, !53, !20} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!105 = !{!"0xd\00_unused2\00310\00160\008\001568\000", !54, !53, !106} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!106 = !{!"0x1\00\000\00160\008\000\000\000", null, null, !5, !107, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!107 = !{!108}
!108 = !{!"0x21\000\0020"}                        ; [ DW_TAG_subrange_type ] [0, 19]
!109 = !{i32 2, !"Dwarf Version", i32 4}
!110 = !{i32 2, !"Debug Info Version", i32 2}
!111 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!112 = !{!"0x101\00max\0016777233\000", !7, !8, !11} ; [ DW_TAG_arg_variable ] [max] [line 17]
!113 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!114 = !MDLocation(line: 17, column: 27, scope: !7)
!115 = !MDLocation(line: 19, column: 27, scope: !7)
!116 = !MDLocation(line: 19, column: 26, scope: !7)
!117 = !MDLocation(line: 19, column: 19, scope: !7)
!118 = !MDLocation(line: 19, column: 18, scope: !7)
!119 = !MDLocation(line: 19, column: 12, scope: !7)
!120 = !MDLocation(line: 19, column: 5, scope: !7)
!121 = !{!"0x101\00genelist\0016777245\000", !12, !8, !15} ; [ DW_TAG_arg_variable ] [genelist] [line 29]
!122 = !MDLocation(line: 29, column: 42, scope: !12)
!123 = !{!"0x101\00count\0033554461\000", !12, !8, !20} ; [ DW_TAG_arg_variable ] [count] [line 29]
!124 = !MDLocation(line: 29, column: 56, scope: !12)
!125 = !{!"0x100\00cp\0030\000", !12, !8, !11}    ; [ DW_TAG_auto_variable ] [cp] [line 30]
!126 = !MDLocation(line: 30, column: 12, scope: !12)
!127 = !{!"0x100\00i\0031\000", !12, !8, !20}     ; [ DW_TAG_auto_variable ] [i] [line 31]
!128 = !MDLocation(line: 31, column: 9, scope: !12)
!129 = !MDLocation(line: 33, column: 10, scope: !130)
!130 = !{!"0xb\0033\005\000", !1, !12}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!131 = !MDLocation(line: 33, column: 15, scope: !132)
!132 = !{!"0xb\0033\005\001", !1, !130}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!133 = !MDLocation(line: 33, column: 5, scope: !130)
!134 = !MDLocation(line: 34, column: 15, scope: !135)
!135 = !{!"0xb\0033\0031\002", !1, !132}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!136 = !MDLocation(line: 34, column: 9, scope: !135)
!137 = !MDLocation(line: 35, column: 9, scope: !135)
!138 = !MDLocation(line: 36, column: 5, scope: !135)
!139 = !MDLocation(line: 33, column: 26, scope: !132)
!140 = !MDLocation(line: 33, column: 5, scope: !132)
!141 = !MDLocation(line: 37, column: 1, scope: !12)
!142 = !{!"0x101\00genelist\0016777255\000", !21, !8, !24} ; [ DW_TAG_arg_variable ] [genelist] [line 39]
!143 = !MDLocation(line: 39, column: 46, scope: !21)
!144 = !{!"0x101\00count\0033554471\000", !21, !8, !20} ; [ DW_TAG_arg_variable ] [count] [line 39]
!145 = !MDLocation(line: 39, column: 60, scope: !21)
!146 = !MDLocation(line: 40, column: 16, scope: !21)
!147 = !{!"0x100\00r\0040\000", !21, !8, !11}     ; [ DW_TAG_auto_variable ] [r] [line 40]
!148 = !MDLocation(line: 40, column: 12, scope: !21)
!149 = !MDLocation(line: 43, column: 13, scope: !150)
!150 = !{!"0xb\0043\009\003", !1, !21}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!151 = !MDLocation(line: 43, column: 9, scope: !150)
!152 = !MDLocation(line: 43, column: 9, scope: !21)
!153 = !MDLocation(line: 43, column: 35, scope: !154)
!154 = !{!"0xb\001", !1, !150}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!155 = !MDLocation(line: 43, column: 28, scope: !150)
!156 = !{!"0x100\00lo\0041\000", !21, !8, !20}    ; [ DW_TAG_auto_variable ] [lo] [line 41]
!157 = !MDLocation(line: 41, column: 12, scope: !21)
!158 = !MDLocation(line: 46, column: 10, scope: !21)
!159 = !{!"0x100\00hi\0041\000", !21, !8, !20}    ; [ DW_TAG_auto_variable ] [hi] [line 41]
!160 = !MDLocation(line: 41, column: 16, scope: !21)
!161 = !MDLocation(line: 48, column: 5, scope: !21)
!162 = !MDLocation(line: 48, column: 17, scope: !21)
!163 = !MDLocation(line: 48, column: 12, scope: !21)
!164 = !MDLocation(line: 49, column: 14, scope: !165)
!165 = !{!"0xb\0048\0023\004", !1, !21}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!166 = !MDLocation(line: 49, column: 13, scope: !165)
!167 = !{!"0x100\00i\0041\000", !21, !8, !20}     ; [ DW_TAG_auto_variable ] [i] [line 41]
!168 = !MDLocation(line: 41, column: 9, scope: !21)
!169 = !MDLocation(line: 50, column: 17, scope: !170)
!170 = !{!"0xb\0050\0013\005", !1, !165}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!171 = !MDLocation(line: 50, column: 13, scope: !170)
!172 = !MDLocation(line: 50, column: 13, scope: !165)
!173 = !MDLocation(line: 50, column: 32, scope: !170)
!174 = !MDLocation(line: 52, column: 12, scope: !21)
!175 = !MDLocation(line: 52, column: 5, scope: !21)
!176 = !MDLocation(line: 53, column: 1, scope: !21)
!177 = !{!"0x101\00id\0016777275\000", !26, !8, !29} ; [ DW_TAG_arg_variable ] [id] [line 59]
!178 = !MDLocation(line: 59, column: 36, scope: !26)
!179 = !{!"0x101\00desc\0033554491\000", !26, !8, !29} ; [ DW_TAG_arg_variable ] [desc] [line 59]
!180 = !MDLocation(line: 59, column: 53, scope: !26)
!181 = !{!"0x101\00genelist\0050331708\000", !26, !8, !24} ; [ DW_TAG_arg_variable ] [genelist] [line 60]
!182 = !MDLocation(line: 60, column: 14, scope: !26)
!183 = !{!"0x101\00count\0067108924\000", !26, !8, !20} ; [ DW_TAG_arg_variable ] [count] [line 60]
!184 = !MDLocation(line: 60, column: 28, scope: !26)
!185 = !{!"0x101\00n\0083886140\000", !26, !8, !20} ; [ DW_TAG_arg_variable ] [n] [line 60]
!186 = !MDLocation(line: 60, column: 39, scope: !26)
!187 = !{!"0x100\00todo\0061\000", !26, !8, !20}  ; [ DW_TAG_auto_variable ] [todo] [line 61]
!188 = !MDLocation(line: 61, column: 8, scope: !26)
!189 = !MDLocation(line: 64, column: 13, scope: !26)
!190 = !MDLocation(line: 64, column: 4, scope: !26)
!191 = !MDLocation(line: 66, column: 4, scope: !26)
!192 = !MDLocation(line: 66, column: 11, scope: !193)
!193 = !{!"0xb\002", !1, !194}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!194 = !{!"0xb\001", !1, !195}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!195 = !{!"0xb\0066\004\007", !1, !196}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!196 = !{!"0xb\0066\004\006", !1, !26}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!197 = !MDLocation(line: 66, column: 4, scope: !196)
!198 = !{!"0x100\00pick\0067\000", !199, !8, !200} ; [ DW_TAG_auto_variable ] [pick] [line 67]
!199 = !{!"0xb\0066\0042\008", !1, !195}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!200 = !{!"0x1\00\000\00488\008\000\000\000", null, null, !5, !201, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 488, align 8, offset 0] [from char]
!201 = !{!202}
!202 = !{!"0x21\000\0061"}                        ; [ DW_TAG_subrange_type ] [0, 60]
!203 = !MDLocation(line: 67, column: 13, scope: !199)
!204 = !MDLocation(line: 68, column: 12, scope: !205)
!205 = !{!"0xb\0068\0012\009", !1, !199}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!206 = !MDLocation(line: 68, column: 12, scope: !199)
!207 = !{!"0x100\00m\0062\000", !26, !8, !20}     ; [ DW_TAG_auto_variable ] [m] [line 62]
!208 = !MDLocation(line: 62, column: 11, scope: !26)
!209 = !MDLocation(line: 68, column: 32, scope: !205)
!210 = !{!"0x100\00i\0062\000", !26, !8, !20}     ; [ DW_TAG_auto_variable ] [i] [line 62]
!211 = !MDLocation(line: 62, column: 8, scope: !26)
!212 = !MDLocation(line: 69, column: 13, scope: !213)
!213 = !{!"0xb\0069\008\0010", !1, !199}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!214 = !MDLocation(line: 69, column: 18, scope: !215)
!215 = !{!"0xb\0069\008\0011", !1, !213}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!216 = !MDLocation(line: 69, column: 8, scope: !213)
!217 = !MDLocation(line: 69, column: 40, scope: !215)
!218 = !MDLocation(line: 69, column: 30, scope: !215)
!219 = !MDLocation(line: 69, column: 25, scope: !220)
!220 = !{!"0xb\003", !1, !215}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!221 = !MDLocation(line: 69, column: 8, scope: !215)
!222 = !MDLocation(line: 70, column: 8, scope: !199)
!223 = !MDLocation(line: 71, column: 15, scope: !199)
!224 = !MDLocation(line: 71, column: 21, scope: !199)
!225 = !MDLocation(line: 71, column: 8, scope: !199)
!226 = !MDLocation(line: 72, column: 4, scope: !199)
!227 = !MDLocation(line: 66, column: 21, scope: !195)
!228 = !MDLocation(line: 66, column: 4, scope: !195)
!229 = !MDLocation(line: 73, column: 1, scope: !26)
!230 = !{!"0x101\00id\0016777291\000", !31, !8, !29} ; [ DW_TAG_arg_variable ] [id] [line 75]
!231 = !MDLocation(line: 75, column: 36, scope: !31)
!232 = !{!"0x101\00desc\0033554507\000", !31, !8, !29} ; [ DW_TAG_arg_variable ] [desc] [line 75]
!233 = !MDLocation(line: 75, column: 53, scope: !31)
!234 = !{!"0x101\00s\0050331724\000", !31, !8, !29} ; [ DW_TAG_arg_variable ] [s] [line 76]
!235 = !MDLocation(line: 76, column: 1, scope: !31)
!236 = !{!"0x101\00n\0067108940\000", !31, !8, !20} ; [ DW_TAG_arg_variable ] [n] [line 76]
!237 = !MDLocation(line: 76, column: 8, scope: !31)
!238 = !{!"0x100\00todo\0078\000", !31, !8, !20}  ; [ DW_TAG_auto_variable ] [todo] [line 78]
!239 = !MDLocation(line: 78, column: 8, scope: !31)
!240 = !{!"0x100\00k\0078\000", !31, !8, !20}     ; [ DW_TAG_auto_variable ] [k] [line 78]
!241 = !MDLocation(line: 78, column: 18, scope: !31)
!242 = !MDLocation(line: 78, column: 30, scope: !31)
!243 = !{!"0x100\00kn\0078\000", !31, !8, !20}    ; [ DW_TAG_auto_variable ] [kn] [line 78]
!244 = !MDLocation(line: 78, column: 25, scope: !31)
!245 = !MDLocation(line: 81, column: 26, scope: !31)
!246 = !MDLocation(line: 81, column: 18, scope: !31)
!247 = !{!"0x100\00ss\0077\000", !31, !8, !4}     ; [ DW_TAG_auto_variable ] [ss] [line 77]
!248 = !MDLocation(line: 77, column: 11, scope: !31)
!249 = !MDLocation(line: 82, column: 19, scope: !31)
!250 = !MDLocation(line: 82, column: 4, scope: !31)
!251 = !MDLocation(line: 84, column: 13, scope: !31)
!252 = !MDLocation(line: 84, column: 4, scope: !31)
!253 = !MDLocation(line: 86, column: 4, scope: !31)
!254 = !MDLocation(line: 86, column: 11, scope: !255)
!255 = !{!"0xb\002", !1, !256}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!256 = !{!"0xb\001", !1, !257}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!257 = !{!"0xb\0086\004\0013", !1, !258}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!258 = !{!"0xb\0086\004\0012", !1, !31}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!259 = !MDLocation(line: 86, column: 4, scope: !258)
!260 = !MDLocation(line: 87, column: 12, scope: !261)
!261 = !{!"0xb\0087\0012\0015", !1, !262}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!262 = !{!"0xb\0086\0042\0014", !1, !257}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!263 = !MDLocation(line: 87, column: 12, scope: !262)
!264 = !{!"0x100\00m\0079\000", !31, !8, !20}     ; [ DW_TAG_auto_variable ] [m] [line 79]
!265 = !MDLocation(line: 79, column: 8, scope: !31)
!266 = !MDLocation(line: 87, column: 32, scope: !261)
!267 = !MDLocation(line: 89, column: 8, scope: !262)
!268 = !MDLocation(line: 89, column: 20, scope: !262)
!269 = !MDLocation(line: 89, column: 15, scope: !262)
!270 = !MDLocation(line: 90, column: 21, scope: !271)
!271 = !{!"0xb\0089\0028\0016", !1, !262}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!272 = !MDLocation(line: 90, column: 38, scope: !271)
!273 = !MDLocation(line: 90, column: 12, scope: !271)
!274 = !MDLocation(line: 91, column: 17, scope: !271)
!275 = !MDLocation(line: 91, column: 12, scope: !271)
!276 = !MDLocation(line: 95, column: 11, scope: !262)
!277 = !MDLocation(line: 95, column: 8, scope: !262)
!278 = !MDLocation(line: 96, column: 15, scope: !262)
!279 = !MDLocation(line: 96, column: 21, scope: !262)
!280 = !MDLocation(line: 96, column: 8, scope: !262)
!281 = !MDLocation(line: 97, column: 22, scope: !262)
!282 = !MDLocation(line: 97, column: 20, scope: !262)
!283 = !MDLocation(line: 97, column: 11, scope: !262)
!284 = !MDLocation(line: 97, column: 8, scope: !262)
!285 = !MDLocation(line: 98, column: 8, scope: !262)
!286 = !MDLocation(line: 99, column: 4, scope: !262)
!287 = !MDLocation(line: 86, column: 21, scope: !257)
!288 = !MDLocation(line: 86, column: 4, scope: !257)
!289 = !MDLocation(line: 101, column: 4, scope: !31)
!290 = !MDLocation(line: 102, column: 1, scope: !31)
!291 = !{!"0x101\00inputN\0016777361\000", !34, !8, !20} ; [ DW_TAG_arg_variable ] [inputN] [line 145]
!292 = !MDLocation(line: 145, column: 15, scope: !34)
!293 = !{!"0x100\00n\00146\000", !34, !8, !20}    ; [ DW_TAG_auto_variable ] [n] [line 146]
!294 = !MDLocation(line: 146, column: 9, scope: !34)
!295 = !MDLocation(line: 148, column: 9, scope: !296)
!296 = !{!"0xb\00148\009\0017", !1, !34}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fasta/code.c]
!297 = !MDLocation(line: 148, column: 9, scope: !34)
!298 = !MDLocation(line: 148, column: 21, scope: !296)
!299 = !{!"0x100\00filename\00150\000", !34, !8, !300} ; [ DW_TAG_auto_variable ] [filename] [line 150]
!300 = !{!"0x1\00\000\00512\008\000\000\000", null, null, !5, !301, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!301 = !{!302}
!302 = !{!"0x21\000\0064"}                        ; [ DW_TAG_subrange_type ] [0, 63]
!303 = !MDLocation(line: 150, column: 10, scope: !34)
!304 = !MDLocation(line: 151, column: 13, scope: !34)
!305 = !MDLocation(line: 151, column: 5, scope: !34)
!306 = !MDLocation(line: 152, column: 23, scope: !34)
!307 = !MDLocation(line: 152, column: 17, scope: !34)
!308 = !MDLocation(line: 152, column: 5, scope: !34)
!309 = !MDLocation(line: 154, column: 5, scope: !34)
!310 = !MDLocation(line: 155, column: 5, scope: !34)
!311 = !MDLocation(line: 157, column: 49, scope: !34)
!312 = !MDLocation(line: 157, column: 54, scope: !34)
!313 = !MDLocation(line: 157, column: 5, scope: !34)
!314 = !MDLocation(line: 158, column: 66, scope: !34)
!315 = !MDLocation(line: 158, column: 5, scope: !34)
!316 = !MDLocation(line: 160, column: 18, scope: !34)
!317 = !MDLocation(line: 159, column: 5, scope: !34)
!318 = !MDLocation(line: 162, column: 12, scope: !34)
!319 = !MDLocation(line: 162, column: 5, scope: !34)
!320 = !MDLocation(line: 164, column: 5, scope: !34)
