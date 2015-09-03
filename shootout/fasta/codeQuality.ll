; ModuleID = 'code.ll'
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
  %1 = load i64* @gen_random.last, align 8
  %2 = mul nsw i64 %1, 3877
  %3 = add nsw i64 %2, 29573
  %4 = srem i64 %3, 139968
  store i64 %4, i64* @gen_random.last, align 8
  %5 = sitofp i64 %4 to double
  %6 = fmul double %max, %5
  %7 = fdiv double %6, 1.399680e+05
  ret double %7
}

; Function Attrs: nounwind uwtable
define void @makeCumulative(%struct.aminoacids* %genelist, i32 %count) #0 {
  br label %1

; <label>:1                                       ; preds = %12, %0
  %cp.0 = phi double [ 0.000000e+00, %0 ], [ %8, %12 ]
  %i.0 = phi i32 [ 0, %0 ], [ %13, %12 ]
  %2 = icmp slt i32 %i.0, %count
  br i1 %2, label %3, label %14

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64
  %5 = getelementptr inbounds %struct.aminoacids* %genelist, i64 %4
  %6 = getelementptr inbounds %struct.aminoacids* %5, i32 0, i32 1
  %7 = load double* %6, align 8
  %8 = fadd double %cp.0, %7
  %9 = sext i32 %i.0 to i64
  %10 = getelementptr inbounds %struct.aminoacids* %genelist, i64 %9
  %11 = getelementptr inbounds %struct.aminoacids* %10, i32 0, i32 1
  store double %8, double* %11, align 8
  br label %12

; <label>:12                                      ; preds = %3
  %13 = add nsw i32 %i.0, 1
  br label %1

; <label>:14                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define signext i8 @selectRandom(%struct.aminoacids* %genelist, i32 %count) #0 {
  %1 = call double @gen_random(double 1.000000e+00)
  %2 = getelementptr inbounds %struct.aminoacids* %genelist, i64 0
  %3 = getelementptr inbounds %struct.aminoacids* %2, i32 0, i32 1
  %4 = load double* %3, align 8
  %5 = fcmp olt double %1, %4
  br i1 %5, label %6, label %10

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.aminoacids* %genelist, i64 0
  %8 = getelementptr inbounds %struct.aminoacids* %7, i32 0, i32 0
  %9 = load i8* %8, align 1
  br label %31

; <label>:10                                      ; preds = %0
  %11 = sub nsw i32 %count, 1
  br label %12

; <label>:12                                      ; preds = %25, %10
  %lo.0 = phi i32 [ 0, %10 ], [ %lo.1, %25 ]
  %hi.0 = phi i32 [ %11, %10 ], [ %hi.1, %25 ]
  %13 = add nsw i32 %lo.0, 1
  %14 = icmp sgt i32 %hi.0, %13
  br i1 %14, label %15, label %26

; <label>:15                                      ; preds = %12
  %16 = add nsw i32 %hi.0, %lo.0
  %17 = sdiv i32 %16, 2
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.aminoacids* %genelist, i64 %18
  %20 = getelementptr inbounds %struct.aminoacids* %19, i32 0, i32 1
  %21 = load double* %20, align 8
  %22 = fcmp olt double %1, %21
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %15
  br label %25

; <label>:24                                      ; preds = %15
  br label %25

; <label>:25                                      ; preds = %24, %23
  %lo.1 = phi i32 [ %lo.0, %23 ], [ %17, %24 ]
  %hi.1 = phi i32 [ %17, %23 ], [ %hi.0, %24 ]
  br label %12

; <label>:26                                      ; preds = %12
  %27 = sext i32 %hi.0 to i64
  %28 = getelementptr inbounds %struct.aminoacids* %genelist, i64 %27
  %29 = getelementptr inbounds %struct.aminoacids* %28, i32 0, i32 0
  %30 = load i8* %29, align 1
  br label %31

; <label>:31                                      ; preds = %26, %6
  %.0 = phi i8 [ %9, %6 ], [ %30, %26 ]
  ret i8 %.0
}

; Function Attrs: nounwind uwtable
define void @makeRandomFasta(i8* %id, i8* %desc, %struct.aminoacids* %genelist, i32 %count, i32 %n) #0 {
entry:
  %pick = alloca [61 x i8], align 16
  %v1 = load %struct._IO_FILE** @outStream, align 8
  %v2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %v1, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* %id, i8* %desc)
  br label %B3

B3:                                       ; preds = %B24, %entry
  %todo.0 = phi i32 [ %n, %entry ], [ %v25, %B24 ]
  %v4 = icmp sgt i32 %todo.0, 0
  br i1 %v4, label %B5, label %B26

B5:                                       ; preds = %B3
  %v6 = icmp slt i32 %todo.0, 60
  br i1 %v6, label %B7, label %B8

B7:                                       ; preds = %B5
  br label %B9

B8:                                       ; preds = %B5
  br label %B9

B9:                                       ; preds = %B8, %B7
  %m.0 = phi i32 [ %todo.0, %B7 ], [ 60, %B8 ]
  br label %B10

B10:                                      ; preds = %B16, %B9
  %i.0 = phi i32 [ 0, %B9 ], [ %v17, %B16 ]
  %v11 = icmp slt i32 %i.0, %m.0
  br i1 %v11, label %B12, label %B18

B12:                                      ; preds = %B10
  %v13 = call signext i8 @selectRandom(%struct.aminoacids* %genelist, i32 %count)
  %v14 = sext i32 %i.0 to i64
  %v15 = getelementptr inbounds [61 x i8]* %pick, i32 0, i64 %v14
  store i8 %v13, i8* %v15, align 1
  br label %B16

B16:                                      ; preds = %B12
  %v17 = add nsw i32 %i.0, 1
  br label %B10

B18:                                      ; preds = %B10
  %v19 = sext i32 %m.0 to i64
  %v20 = getelementptr inbounds [61 x i8]* %pick, i32 0, i64 %v19
  store i8 0, i8* %v20, align 1
  %v21 = getelementptr inbounds [61 x i8]* %pick, i32 0, i32 0
  %v22 = load %struct._IO_FILE** @outStream, align 8
  %v23 = call i32 @fputs(i8* %v21, %struct._IO_FILE* %v22)
  br label %B24

B24:                                      ; preds = %B18
  %v25 = sub nsw i32 %todo.0, 60
  br label %B3

B26:                                      ; preds = %B3
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @makeRepeatFasta(i8* %id, i8* %desc, i8* %s, i32 %n) #0 {
  %1 = call i64 @strlen(i8* %s) #5
  %2 = trunc i64 %1 to i32
  %3 = add nsw i32 %2, 1
  %4 = sext i32 %3 to i64
  %5 = call noalias i8* @malloc(i64 %4) #4
  %6 = add nsw i32 %2, 1
  %7 = sext i32 %6 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %s, i64 %7, i32 1, i1 false)
  %8 = load %struct._IO_FILE** @outStream, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* %id, i8* %desc)
  br label %10

; <label>:10                                      ; preds = %43, %0
  %todo.0 = phi i32 [ %n, %0 ], [ %44, %43 ]
  %k.0 = phi i32 [ 0, %0 ], [ %42, %43 ]
  %11 = icmp sgt i32 %todo.0, 0
  br i1 %11, label %12, label %45

; <label>:12                                      ; preds = %10
  %13 = icmp slt i32 %todo.0, 60
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %12
  br label %16

; <label>:15                                      ; preds = %12
  br label %16

; <label>:16                                      ; preds = %15, %14
  %m.0 = phi i32 [ %todo.0, %14 ], [ 60, %15 ]
  br label %17

; <label>:17                                      ; preds = %20, %16
  %k.1 = phi i32 [ %k.0, %16 ], [ 0, %20 ]
  %m.1 = phi i32 [ %m.0, %16 ], [ %26, %20 ]
  %18 = sub nsw i32 %2, %k.1
  %19 = icmp sge i32 %m.1, %18
  br i1 %19, label %20, label %27

; <label>:20                                      ; preds = %17
  %21 = load %struct._IO_FILE** @outStream, align 8
  %22 = sext i32 %k.1 to i64
  %23 = getelementptr inbounds i8* %s, i64 %22
  %24 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* %23)
  %25 = sub nsw i32 %2, %k.1
  %26 = sub nsw i32 %m.1, %25
  br label %17

; <label>:27                                      ; preds = %17
  %28 = add nsw i32 %k.1, %m.1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8* %5, i64 %29
  store i8 0, i8* %30, align 1
  %31 = sext i32 %k.1 to i64
  %32 = getelementptr inbounds i8* %5, i64 %31
  %33 = load %struct._IO_FILE** @outStream, align 8
  %34 = call i32 @fputs(i8* %32, %struct._IO_FILE* %33)
  %35 = add nsw i32 %m.1, %k.1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8* %s, i64 %36
  %38 = load i8* %37, align 1
  %39 = add nsw i32 %k.1, %m.1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8* %5, i64 %40
  store i8 %38, i8* %41, align 1
  %42 = add nsw i32 %k.1, %m.1
  br label %43

; <label>:43                                      ; preds = %27
  %44 = sub nsw i32 %todo.0, 60
  br label %10

; <label>:45                                      ; preds = %10
  call void @free(i8* %5) #4
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
  %filename = alloca [64 x i8], align 16
  %1 = icmp sgt i32 %inputN, 1
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %3

; <label>:3                                       ; preds = %2, %0
  %n.0 = phi i32 [ %inputN, %2 ], [ 1000, %0 ]
  %4 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %5 = call i32 (i8*, i8*, ...)* @sprintf(i8* %4, i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0), i32 %n.0) #4
  %6 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %7 = call %struct._IO_FILE* @fopen(i8* %6, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** @outStream, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([15 x %struct.aminoacids]* @iub_orig, i32 0, i32 0, i32 0), i64 240, i32 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens_orig, i32 0, i32 0, i32 0), i64 64, i32 16, i1 false)
  call void @makeCumulative(%struct.aminoacids* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i32 0, i32 0), i32 15)
  call void @makeCumulative(%struct.aminoacids* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i32 0, i32 0), i32 4)
  %8 = load i8** @alu, align 8
  %9 = mul nsw i32 %n.0, 2
  call void @makeRepeatFasta(i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @.str6, i32 0, i32 0), i8* %8, i32 %9)
  %10 = mul nsw i32 %n.0, 3
  call void @makeRandomFasta(i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), %struct.aminoacids* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i32 0, i32 0), i32 15, i32 %10)
  %11 = mul nsw i32 %n.0, 5
  call void @makeRandomFasta(i8* getelementptr inbounds ([6 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8]* @.str10, i32 0, i32 0), %struct.aminoacids* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i32 0, i32 0), i32 4, i32 %11)
  %12 = load %struct._IO_FILE** @outStream, align 8
  %13 = call i32 @fclose(%struct._IO_FILE* %12)
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
