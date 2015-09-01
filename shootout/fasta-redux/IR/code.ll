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
  %2 = load i32** %1, align 8
  store i32 42, i32* %2, align 4
  ret void
}

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
  store i8* %title, i8** %2, align 8
  store i32 %n, i32* %3, align 4
  %5 = load i8** %1, align 8
  %6 = call i64 @strlen(i8* %5) #7
  %7 = trunc i64 %6 to i32
  store i32 %7, i32* %len, align 4
  %8 = load i32* %len, align 4
  %9 = add nsw i32 %8, 60
  %10 = zext i32 %9 to i64
  %11 = call i8* @llvm.stacksave()
  store i8* %11, i8** %4
  %12 = alloca i8, i64 %10, align 16
  store i32 0, i32* %pos, align 4
  %13 = load i8** %1, align 8
  %14 = load i32* %len, align 4
  %15 = sext i32 %14 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 %15, i32 1, i1 false)
  %16 = load i32* %len, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8* %12, i64 %17
  %19 = load i8** %1, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 60, i32 1, i1 false)
  %20 = load i8** %2, align 8
  %21 = load %struct._IO_FILE** @outStream, align 8
  %22 = call i32 (i8*, %struct._IO_FILE*, ...)* bitcast (i32 (...)* @fputs_unlocked to i32 (i8*, %struct._IO_FILE*, ...)*)(i8* %20, %struct._IO_FILE* %21)
  br label %23

; <label>:23                                      ; preds = %51, %0
  %24 = load i32* %3, align 4
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %26, label %57

; <label>:26                                      ; preds = %23
  %27 = load i32* %3, align 4
  %28 = icmp sgt i32 %27, 60
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %26
  br label %32

; <label>:30                                      ; preds = %26
  %31 = load i32* %3, align 4
  br label %32

; <label>:32                                      ; preds = %30, %29
  %33 = phi i32 [ 60, %29 ], [ %31, %30 ]
  store i32 %33, i32* %bytes, align 4
  %34 = load i32* %pos, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8* %12, i64 %35
  %37 = load i32* %bytes, align 4
  %38 = sext i32 %37 to i64
  %39 = load %struct._IO_FILE** @outStream, align 8
  %40 = call i64 @fwrite_unlocked(i8* %36, i64 %38, i64 1, %struct._IO_FILE* %39)
  %41 = load i32* %bytes, align 4
  %42 = load i32* %pos, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, i32* %pos, align 4
  %44 = load i32* %pos, align 4
  %45 = load i32* %len, align 4
  %46 = icmp sgt i32 %44, %45
  br i1 %46, label %47, label %51

; <label>:47                                      ; preds = %32
  %48 = load i32* %len, align 4
  %49 = load i32* %pos, align 4
  %50 = sub nsw i32 %49, %48
  store i32 %50, i32* %pos, align 4
  br label %51

; <label>:51                                      ; preds = %47, %32
  %52 = load %struct._IO_FILE** @outStream, align 8
  %53 = call i32 @fputc_unlocked(i32 10, %struct._IO_FILE* %52)
  %54 = load i32* %bytes, align 4
  %55 = load i32* %3, align 4
  %56 = sub nsw i32 %55, %54
  store i32 %56, i32* %3, align 4
  br label %23

; <label>:57                                      ; preds = %23
  %58 = load i8** %4
  call void @llvm.stackrestore(i8* %58)
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #1

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

declare i32 @fputs_unlocked(...) #3

declare i64 @fwrite_unlocked(i8*, i64, i64, %struct._IO_FILE*) #3

declare i32 @fputc_unlocked(i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #2

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
  store %struct.amino_acid* %amino_acid, %struct.amino_acid** %2, align 8
  store i32 %amino_acid_size, i32* %3, align 4
  store float 0.000000e+00, float* %p, align 4
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %24, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %3, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %27

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load %struct.amino_acid** %2, align 8
  %12 = getelementptr inbounds %struct.amino_acid* %11, i64 %10
  %13 = getelementptr inbounds %struct.amino_acid* %12, i32 0, i32 1
  %14 = load float* %13, align 4
  %15 = load float* %p, align 4
  %16 = fadd float %15, %14
  store float %16, float* %p, align 4
  %17 = load float* %p, align 4
  %18 = fmul float %17, 4.095000e+03
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = load %struct.amino_acid** %2, align 8
  %22 = getelementptr inbounds %struct.amino_acid* %21, i64 %20
  %23 = getelementptr inbounds %struct.amino_acid* %22, i32 0, i32 2
  store float %18, float* %23, align 4
  br label %24

; <label>:24                                      ; preds = %8
  %25 = load i32* %i, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %i, align 4
  br label %4

; <label>:27                                      ; preds = %4
  %28 = load i32* %3, align 4
  %29 = sub nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = load %struct.amino_acid** %2, align 8
  %32 = getelementptr inbounds %struct.amino_acid* %31, i64 %30
  %33 = getelementptr inbounds %struct.amino_acid* %32, i32 0, i32 2
  store float 4.095000e+03, float* %33, align 4
  store i32 0, i32* %i1, align 4
  store i32 0, i32* %j, align 4
  br label %34

; <label>:34                                      ; preds = %60, %27
  %35 = load i32* %i1, align 4
  %36 = icmp slt i32 %35, 4096
  br i1 %36, label %37, label %63

; <label>:37                                      ; preds = %34
  br label %38

; <label>:38                                      ; preds = %48, %37
  %39 = load i32* %j, align 4
  %40 = sext i32 %39 to i64
  %41 = load %struct.amino_acid** %2, align 8
  %42 = getelementptr inbounds %struct.amino_acid* %41, i64 %40
  %43 = getelementptr inbounds %struct.amino_acid* %42, i32 0, i32 2
  %44 = load float* %43, align 4
  %45 = load i32* %i1, align 4
  %46 = sitofp i32 %45 to float
  %47 = fcmp olt float %44, %46
  br i1 %47, label %48, label %51

; <label>:48                                      ; preds = %38
  %49 = load i32* %j, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %j, align 4
  br label %38

; <label>:51                                      ; preds = %38
  %52 = load i32* %j, align 4
  %53 = sext i32 %52 to i64
  %54 = load %struct.amino_acid** %2, align 8
  %55 = getelementptr inbounds %struct.amino_acid* %54, i64 %53
  %56 = load i32* %i1, align 4
  %57 = sext i32 %56 to i64
  %58 = load %struct.amino_acid*** %1, align 8
  %59 = getelementptr inbounds %struct.amino_acid** %58, i64 %57
  store %struct.amino_acid* %55, %struct.amino_acid** %59, align 8
  br label %60

; <label>:60                                      ; preds = %51
  %61 = load i32* %i1, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %i1, align 4
  br label %34

; <label>:63                                      ; preds = %34
  ret i8* null
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
  store i32 %amino_acid_size, i32* %2, align 4
  store i8* %title, i8** %3, align 8
  store i32 %n, i32* %4, align 4
  store i32* %rand, i32** %5, align 8
  %6 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i64 60
  store i8 10, i8* %6, align 1
  %7 = getelementptr inbounds [4096 x %struct.amino_acid*]* %lookup, i32 0, i32 0
  %8 = load %struct.amino_acid** %1, align 8
  %9 = load i32* %2, align 4
  %10 = call i8* @fill_lookup(%struct.amino_acid** %7, %struct.amino_acid* %8, i32 %9)
  %11 = load i8** %3, align 8
  %12 = load %struct._IO_FILE** @outStream, align 8
  %13 = call i32 (i8*, %struct._IO_FILE*, ...)* bitcast (i32 (...)* @fputs_unlocked to i32 (i8*, %struct._IO_FILE*, ...)*)(i8* %11, %struct._IO_FILE* %12)
  store i32 0, i32* %i, align 4
  store i32 0, i32* %j, align 4
  br label %14

; <label>:14                                      ; preds = %53, %0
  %15 = load i32* %i, align 4
  %16 = load i32* %4, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %58

; <label>:18                                      ; preds = %14
  %19 = load i32* %j, align 4
  %20 = icmp eq i32 %19, 60
  br i1 %20, label %21, label %25

; <label>:21                                      ; preds = %18
  %22 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i32 0
  %23 = load %struct._IO_FILE** @outStream, align 8
  %24 = call i64 @fwrite_unlocked(i8* %22, i64 61, i64 1, %struct._IO_FILE* %23)
  store i32 0, i32* %j, align 4
  br label %25

; <label>:25                                      ; preds = %21, %18
  %26 = load i32** %5, align 8
  %27 = call float @random_next_lookup(i32* %26)
  store float %27, float* %r, align 4
  %28 = load float* %r, align 4
  %29 = fptosi float %28 to i16
  %30 = sext i16 %29 to i64
  %31 = getelementptr inbounds [4096 x %struct.amino_acid*]* %lookup, i32 0, i64 %30
  %32 = load %struct.amino_acid** %31, align 8
  store %struct.amino_acid* %32, %struct.amino_acid** %u, align 8
  br label %33

; <label>:33                                      ; preds = %43, %25
  %34 = load %struct.amino_acid** %u, align 8
  %35 = getelementptr inbounds %struct.amino_acid* %34, i32 0, i32 2
  %36 = load float* %35, align 4
  %37 = load float* %r, align 4
  %38 = fcmp olt float %36, %37
  %39 = zext i1 %38 to i32
  %40 = sext i32 %39 to i64
  %41 = call i64 @llvm.expect.i64(i64 %40, i64 0)
  %42 = icmp ne i64 %41, 0
  br i1 %42, label %43, label %46

; <label>:43                                      ; preds = %33
  %44 = load %struct.amino_acid** %u, align 8
  %45 = getelementptr inbounds %struct.amino_acid* %44, i32 1
  store %struct.amino_acid* %45, %struct.amino_acid** %u, align 8
  br label %33

; <label>:46                                      ; preds = %33
  %47 = load %struct.amino_acid** %u, align 8
  %48 = getelementptr inbounds %struct.amino_acid* %47, i32 0, i32 0
  %49 = load i8* %48, align 1
  %50 = load i32* %j, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i64 %51
  store i8 %49, i8* %52, align 1
  br label %53

; <label>:53                                      ; preds = %46
  %54 = load i32* %i, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %i, align 4
  %56 = load i32* %j, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %j, align 4
  br label %14

; <label>:58                                      ; preds = %14
  %59 = load i32* %j, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i64 %60
  store i8 10, i8* %61, align 1
  %62 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i32 0
  %63 = load i32* %j, align 4
  %64 = add nsw i32 %63, 1
  %65 = sext i32 %64 to i64
  %66 = load %struct._IO_FILE** @outStream, align 8
  %67 = call i64 @fwrite_unlocked(i8* %62, i64 %65, i64 1, %struct._IO_FILE* %66)
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal float @random_next_lookup(i32* %random) #4 {
  %1 = alloca i32*, align 8
  store i32* %random, i32** %1, align 8
  %2 = load i32** %1, align 8
  %3 = load i32* %2, align 4
  %4 = mul i32 %3, 3877
  %5 = add i32 %4, 29573
  %6 = urem i32 %5, 139968
  %7 = load i32** %1, align 8
  store i32 %6, i32* %7, align 4
  %8 = load i32** %1, align 8
  %9 = load i32* %8, align 4
  %10 = uitofp i32 %9 to float
  %11 = fmul float %10, 0x3F9DF57700000000
  ret float %11
}

; Function Attrs: nounwind readnone
declare i64 @llvm.expect.i64(i64, i64) #5

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %filename = alloca [64 x i8], align 16
  %rand = alloca i32, align 4
  store i32 %inputN, i32* %1, align 4
  store i32 512, i32* %n, align 4
  %2 = load i32* %1, align 4
  %3 = icmp sgt i32 %2, 1
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4
  store i32 %5, i32* %n, align 4
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %8 = load i32* %n, align 4
  %9 = call i32 (i8*, i8*, ...)* @sprintf(i8* %7, i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %8) #2
  %10 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %11 = call %struct._IO_FILE* @fopen(i8* %10, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  store %struct._IO_FILE* %11, %struct._IO_FILE** @outStream, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([15 x %struct.amino_acid]* @amino_acid, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([15 x %struct.amino_acid]* @amino_acid_orig, i32 0, i32 0, i32 0), i64 180, i32 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([4 x %struct.amino_acid]* @homo_sapiens, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([4 x %struct.amino_acid]* @homo_sapiens_orig, i32 0, i32 0, i32 0), i64 48, i32 16, i1 false)
  call void @random_init(i32* %rand)
  %12 = load i32* %n, align 4
  %13 = mul nsw i32 %12, 2
  call void @repeat(i8* getelementptr inbounds ([288 x i8]* @alu, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %13)
  %14 = load i32* %n, align 4
  %15 = mul nsw i32 %14, 3
  call void @randomize(%struct.amino_acid* getelementptr inbounds ([15 x %struct.amino_acid]* @amino_acid, i32 0, i32 0), i32 15, i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %15, i32* %rand)
  %16 = load i32* %n, align 4
  %17 = mul nsw i32 %16, 5
  call void @randomize(%struct.amino_acid* getelementptr inbounds ([4 x %struct.amino_acid]* @homo_sapiens, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([31 x i8]* @.str4, i32 0, i32 0), i32 %17, i32* %rand)
  %18 = load %struct._IO_FILE** @outStream, align 8
  %19 = call i32 @fclose(%struct._IO_FILE* %18)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #6

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

declare i32 @fclose(%struct._IO_FILE*) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
