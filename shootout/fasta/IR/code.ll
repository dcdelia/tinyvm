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
  %2 = load double* %1, align 8
  %3 = load i64* @gen_random.last, align 8
  %4 = mul nsw i64 %3, 3877
  %5 = add nsw i64 %4, 29573
  %6 = srem i64 %5, 139968
  store i64 %6, i64* @gen_random.last, align 8
  %7 = sitofp i64 %6 to double
  %8 = fmul double %2, %7
  %9 = fdiv double %8, 1.399680e+05
  ret double %9
}

; Function Attrs: nounwind uwtable
define void @makeCumulative(%struct.aminoacids* %genelist, i32 %count) #0 {
  %1 = alloca %struct.aminoacids*, align 8
  %2 = alloca i32, align 4
  %cp = alloca double, align 8
  %i = alloca i32, align 4
  store %struct.aminoacids* %genelist, %struct.aminoacids** %1, align 8
  store i32 %count, i32* %2, align 4
  store double 0.000000e+00, double* %cp, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %22, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %25

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = load %struct.aminoacids** %1, align 8
  %11 = getelementptr inbounds %struct.aminoacids* %10, i64 %9
  %12 = getelementptr inbounds %struct.aminoacids* %11, i32 0, i32 1
  %13 = load double* %12, align 8
  %14 = load double* %cp, align 8
  %15 = fadd double %14, %13
  store double %15, double* %cp, align 8
  %16 = load double* %cp, align 8
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = load %struct.aminoacids** %1, align 8
  %20 = getelementptr inbounds %struct.aminoacids* %19, i64 %18
  %21 = getelementptr inbounds %struct.aminoacids* %20, i32 0, i32 1
  store double %16, double* %21, align 8
  br label %22

; <label>:22                                      ; preds = %7
  %23 = load i32* %i, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %i, align 4
  br label %3

; <label>:25                                      ; preds = %3
  ret void
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
  store i32 %count, i32* %3, align 4
  %4 = call double @gen_random(double 1.000000e+00)
  store double %4, double* %r, align 8
  %5 = load double* %r, align 8
  %6 = load %struct.aminoacids** %2, align 8
  %7 = getelementptr inbounds %struct.aminoacids* %6, i64 0
  %8 = getelementptr inbounds %struct.aminoacids* %7, i32 0, i32 1
  %9 = load double* %8, align 8
  %10 = fcmp olt double %5, %9
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %0
  %12 = load %struct.aminoacids** %2, align 8
  %13 = getelementptr inbounds %struct.aminoacids* %12, i64 0
  %14 = getelementptr inbounds %struct.aminoacids* %13, i32 0, i32 0
  %15 = load i8* %14, align 1
  store i8 %15, i8* %1
  br label %49

; <label>:16                                      ; preds = %0
  store i32 0, i32* %lo, align 4
  %17 = load i32* %3, align 4
  %18 = sub nsw i32 %17, 1
  store i32 %18, i32* %hi, align 4
  br label %19

; <label>:19                                      ; preds = %41, %16
  %20 = load i32* %hi, align 4
  %21 = load i32* %lo, align 4
  %22 = add nsw i32 %21, 1
  %23 = icmp sgt i32 %20, %22
  br i1 %23, label %24, label %42

; <label>:24                                      ; preds = %19
  %25 = load i32* %hi, align 4
  %26 = load i32* %lo, align 4
  %27 = add nsw i32 %25, %26
  %28 = sdiv i32 %27, 2
  store i32 %28, i32* %i, align 4
  %29 = load double* %r, align 8
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = load %struct.aminoacids** %2, align 8
  %33 = getelementptr inbounds %struct.aminoacids* %32, i64 %31
  %34 = getelementptr inbounds %struct.aminoacids* %33, i32 0, i32 1
  %35 = load double* %34, align 8
  %36 = fcmp olt double %29, %35
  br i1 %36, label %37, label %39

; <label>:37                                      ; preds = %24
  %38 = load i32* %i, align 4
  store i32 %38, i32* %hi, align 4
  br label %41

; <label>:39                                      ; preds = %24
  %40 = load i32* %i, align 4
  store i32 %40, i32* %lo, align 4
  br label %41

; <label>:41                                      ; preds = %39, %37
  br label %19

; <label>:42                                      ; preds = %19
  %43 = load i32* %hi, align 4
  %44 = sext i32 %43 to i64
  %45 = load %struct.aminoacids** %2, align 8
  %46 = getelementptr inbounds %struct.aminoacids* %45, i64 %44
  %47 = getelementptr inbounds %struct.aminoacids* %46, i32 0, i32 0
  %48 = load i8* %47, align 1
  store i8 %48, i8* %1
  br label %49

; <label>:49                                      ; preds = %42, %11
  %50 = load i8* %1
  ret i8 %50
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
  store i8* %desc, i8** %2, align 8
  store %struct.aminoacids* %genelist, %struct.aminoacids** %3, align 8
  store i32 %count, i32* %4, align 4
  store i32 %n, i32* %5, align 4
  %6 = load i32* %5, align 4
  store i32 %6, i32* %todo, align 4
  %7 = load %struct._IO_FILE** @outStream, align 8
  %8 = load i8** %1, align 8
  %9 = load i8** %2, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* %8, i8* %9)
  br label %11

; <label>:11                                      ; preds = %42, %0
  %12 = load i32* %todo, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %45

; <label>:14                                      ; preds = %11
  %15 = load i32* %todo, align 4
  %16 = icmp slt i32 %15, 60
  br i1 %16, label %17, label %19

; <label>:17                                      ; preds = %14
  %18 = load i32* %todo, align 4
  store i32 %18, i32* %m, align 4
  br label %20

; <label>:19                                      ; preds = %14
  store i32 60, i32* %m, align 4
  br label %20

; <label>:20                                      ; preds = %19, %17
  store i32 0, i32* %i, align 4
  br label %21

; <label>:21                                      ; preds = %32, %20
  %22 = load i32* %i, align 4
  %23 = load i32* %m, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %35

; <label>:25                                      ; preds = %21
  %26 = load %struct.aminoacids** %3, align 8
  %27 = load i32* %4, align 4
  %28 = call signext i8 @selectRandom(%struct.aminoacids* %26, i32 %27)
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [61 x i8]* %pick, i32 0, i64 %30
  store i8 %28, i8* %31, align 1
  br label %32

; <label>:32                                      ; preds = %25
  %33 = load i32* %i, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %i, align 4
  br label %21

; <label>:35                                      ; preds = %21
  %36 = load i32* %m, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [61 x i8]* %pick, i32 0, i64 %37
  store i8 0, i8* %38, align 1
  %39 = getelementptr inbounds [61 x i8]* %pick, i32 0, i32 0
  %40 = load %struct._IO_FILE** @outStream, align 8
  %41 = call i32 @fputs(i8* %39, %struct._IO_FILE* %40)
  br label %42

; <label>:42                                      ; preds = %35
  %43 = load i32* %todo, align 4
  %44 = sub nsw i32 %43, 60
  store i32 %44, i32* %todo, align 4
  br label %11

; <label>:45                                      ; preds = %11
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

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
  store i8* %desc, i8** %2, align 8
  store i8* %s, i8** %3, align 8
  store i32 %n, i32* %4, align 4
  %5 = load i32* %4, align 4
  store i32 %5, i32* %todo, align 4
  store i32 0, i32* %k, align 4
  %6 = load i8** %3, align 8
  %7 = call i64 @strlen(i8* %6) #5
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* %kn, align 4
  %9 = load i32* %kn, align 4
  %10 = add nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = call noalias i8* @malloc(i64 %11) #4
  store i8* %12, i8** %ss, align 8
  %13 = load i8** %ss, align 8
  %14 = load i8** %3, align 8
  %15 = load i32* %kn, align 4
  %16 = add nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 %17, i32 1, i1 false)
  %18 = load %struct._IO_FILE** @outStream, align 8
  %19 = load i8** %1, align 8
  %20 = load i8** %2, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* %19, i8* %20)
  br label %22

; <label>:22                                      ; preds = %79, %0
  %23 = load i32* %todo, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %25, label %82

; <label>:25                                      ; preds = %22
  %26 = load i32* %todo, align 4
  %27 = icmp slt i32 %26, 60
  br i1 %27, label %28, label %30

; <label>:28                                      ; preds = %25
  %29 = load i32* %todo, align 4
  store i32 %29, i32* %m, align 4
  br label %31

; <label>:30                                      ; preds = %25
  store i32 60, i32* %m, align 4
  br label %31

; <label>:31                                      ; preds = %30, %28
  br label %32

; <label>:32                                      ; preds = %38, %31
  %33 = load i32* %m, align 4
  %34 = load i32* %kn, align 4
  %35 = load i32* %k, align 4
  %36 = sub nsw i32 %34, %35
  %37 = icmp sge i32 %33, %36
  br i1 %37, label %38, label %50

; <label>:38                                      ; preds = %32
  %39 = load %struct._IO_FILE** @outStream, align 8
  %40 = load i8** %3, align 8
  %41 = load i32* %k, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8* %40, i64 %42
  %44 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* %43)
  %45 = load i32* %kn, align 4
  %46 = load i32* %k, align 4
  %47 = sub nsw i32 %45, %46
  %48 = load i32* %m, align 4
  %49 = sub nsw i32 %48, %47
  store i32 %49, i32* %m, align 4
  store i32 0, i32* %k, align 4
  br label %32

; <label>:50                                      ; preds = %32
  %51 = load i32* %k, align 4
  %52 = load i32* %m, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load i8** %ss, align 8
  %56 = getelementptr inbounds i8* %55, i64 %54
  store i8 0, i8* %56, align 1
  %57 = load i8** %ss, align 8
  %58 = load i32* %k, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8* %57, i64 %59
  %61 = load %struct._IO_FILE** @outStream, align 8
  %62 = call i32 @fputs(i8* %60, %struct._IO_FILE* %61)
  %63 = load i32* %m, align 4
  %64 = load i32* %k, align 4
  %65 = add nsw i32 %63, %64
  %66 = sext i32 %65 to i64
  %67 = load i8** %3, align 8
  %68 = getelementptr inbounds i8* %67, i64 %66
  %69 = load i8* %68, align 1
  %70 = load i32* %k, align 4
  %71 = load i32* %m, align 4
  %72 = add nsw i32 %70, %71
  %73 = sext i32 %72 to i64
  %74 = load i8** %ss, align 8
  %75 = getelementptr inbounds i8* %74, i64 %73
  store i8 %69, i8* %75, align 1
  %76 = load i32* %m, align 4
  %77 = load i32* %k, align 4
  %78 = add nsw i32 %77, %76
  store i32 %78, i32* %k, align 4
  br label %79

; <label>:79                                      ; preds = %50
  %80 = load i32* %todo, align 4
  %81 = sub nsw i32 %80, 60
  store i32 %81, i32* %todo, align 4
  br label %22

; <label>:82                                      ; preds = %22
  %83 = load i8** %ss, align 8
  call void @free(i8* %83) #4
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %filename = alloca [64 x i8], align 16
  store i32 %inputN, i32* %1, align 4
  store i32 1000, i32* %n, align 4
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
  %9 = call i32 (i8*, i8*, ...)* @sprintf(i8* %7, i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0), i32 %8) #4
  %10 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %11 = call %struct._IO_FILE* @fopen(i8* %10, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0))
  store %struct._IO_FILE* %11, %struct._IO_FILE** @outStream, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([15 x %struct.aminoacids]* @iub_orig, i32 0, i32 0, i32 0), i64 240, i32 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens_orig, i32 0, i32 0, i32 0), i64 64, i32 16, i1 false)
  call void @makeCumulative(%struct.aminoacids* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i32 0, i32 0), i32 15)
  call void @makeCumulative(%struct.aminoacids* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i32 0, i32 0), i32 4)
  %12 = load i8** @alu, align 8
  %13 = load i32* %n, align 4
  %14 = mul nsw i32 %13, 2
  call void @makeRepeatFasta(i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @.str6, i32 0, i32 0), i8* %12, i32 %14)
  %15 = load i32* %n, align 4
  %16 = mul nsw i32 %15, 3
  call void @makeRandomFasta(i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), %struct.aminoacids* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i32 0, i32 0), i32 15, i32 %16)
  %17 = load i32* %n, align 4
  %18 = mul nsw i32 %17, 5
  call void @makeRandomFasta(i8* getelementptr inbounds ([6 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8]* @.str10, i32 0, i32 0), %struct.aminoacids* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i32 0, i32 0), i32 4, i32 %18)
  %19 = load %struct._IO_FILE** @outStream, align 8
  %20 = call i32 @fclose(%struct._IO_FILE* %19)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #3

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
