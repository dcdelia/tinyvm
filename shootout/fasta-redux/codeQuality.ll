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
  store i32 42, i32* %random, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @repeat(i8* %alu, i8* %title, i32 %n) #0 {
  %1 = call i64 @strlen(i8* %alu) #7
  %2 = trunc i64 %1 to i32
  %3 = add nsw i32 %2, 60
  %4 = zext i32 %3 to i64
  %5 = call i8* @llvm.stacksave()
  %6 = alloca i8, i64 %4, align 16
  %7 = sext i32 %2 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %alu, i64 %7, i32 1, i1 false)
  %8 = sext i32 %2 to i64
  %9 = getelementptr inbounds i8* %6, i64 %8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %alu, i64 60, i32 1, i1 false)
  %10 = load %struct._IO_FILE** @outStream, align 8
  %11 = call i32 (i8*, %struct._IO_FILE*, ...)* bitcast (i32 (...)* @fputs_unlocked to i32 (i8*, %struct._IO_FILE*, ...)*)(i8* %title, %struct._IO_FILE* %10)
  br label %12

; <label>:12                                      ; preds = %29, %0
  %.0 = phi i32 [ %n, %0 ], [ %32, %29 ]
  %pos.0 = phi i32 [ 0, %0 ], [ %pos.1, %29 ]
  %13 = icmp sgt i32 %.0, 0
  br i1 %13, label %14, label %33

; <label>:14                                      ; preds = %12
  %15 = icmp sgt i32 %.0, 60
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %14
  br label %18

; <label>:17                                      ; preds = %14
  br label %18

; <label>:18                                      ; preds = %17, %16
  %19 = phi i32 [ 60, %16 ], [ %.0, %17 ]
  %20 = sext i32 %pos.0 to i64
  %21 = getelementptr inbounds i8* %6, i64 %20
  %22 = sext i32 %19 to i64
  %23 = load %struct._IO_FILE** @outStream, align 8
  %24 = call i64 @fwrite_unlocked(i8* %21, i64 %22, i64 1, %struct._IO_FILE* %23)
  %25 = add nsw i32 %pos.0, %19
  %26 = icmp sgt i32 %25, %2
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %18
  %28 = sub nsw i32 %25, %2
  br label %29

; <label>:29                                      ; preds = %27, %18
  %pos.1 = phi i32 [ %28, %27 ], [ %25, %18 ]
  %30 = load %struct._IO_FILE** @outStream, align 8
  %31 = call i32 @fputc_unlocked(i32 10, %struct._IO_FILE* %30)
  %32 = sub nsw i32 %.0, %19
  br label %12

; <label>:33                                      ; preds = %12
  call void @llvm.stackrestore(i8* %5)
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
  br label %1

; <label>:1                                       ; preds = %13, %0
  %p.0 = phi float [ 0.000000e+00, %0 ], [ %8, %13 ]
  %i.0 = phi i32 [ 0, %0 ], [ %14, %13 ]
  %2 = icmp slt i32 %i.0, %amino_acid_size
  br i1 %2, label %3, label %15

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64
  %5 = getelementptr inbounds %struct.amino_acid* %amino_acid, i64 %4
  %6 = getelementptr inbounds %struct.amino_acid* %5, i32 0, i32 1
  %7 = load float* %6, align 4
  %8 = fadd float %p.0, %7
  %9 = fmul float %8, 4.095000e+03
  %10 = sext i32 %i.0 to i64
  %11 = getelementptr inbounds %struct.amino_acid* %amino_acid, i64 %10
  %12 = getelementptr inbounds %struct.amino_acid* %11, i32 0, i32 2
  store float %9, float* %12, align 4
  br label %13

; <label>:13                                      ; preds = %3
  %14 = add nsw i32 %i.0, 1
  br label %1

; <label>:15                                      ; preds = %1
  %16 = sub nsw i32 %amino_acid_size, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.amino_acid* %amino_acid, i64 %17
  %19 = getelementptr inbounds %struct.amino_acid* %18, i32 0, i32 2
  store float 4.095000e+03, float* %19, align 4
  br label %20

; <label>:20                                      ; preds = %37, %15
  %i1.0 = phi i32 [ 0, %15 ], [ %38, %37 ]
  %j.0 = phi i32 [ 0, %15 ], [ %j.1, %37 ]
  %21 = icmp slt i32 %i1.0, 4096
  br i1 %21, label %22, label %39

; <label>:22                                      ; preds = %20
  br label %23

; <label>:23                                      ; preds = %30, %22
  %j.1 = phi i32 [ %j.0, %22 ], [ %31, %30 ]
  %24 = sext i32 %j.1 to i64
  %25 = getelementptr inbounds %struct.amino_acid* %amino_acid, i64 %24
  %26 = getelementptr inbounds %struct.amino_acid* %25, i32 0, i32 2
  %27 = load float* %26, align 4
  %28 = sitofp i32 %i1.0 to float
  %29 = fcmp olt float %27, %28
  br i1 %29, label %30, label %32

; <label>:30                                      ; preds = %23
  %31 = add nsw i32 %j.1, 1
  br label %23

; <label>:32                                      ; preds = %23
  %33 = sext i32 %j.1 to i64
  %34 = getelementptr inbounds %struct.amino_acid* %amino_acid, i64 %33
  %35 = sext i32 %i1.0 to i64
  %36 = getelementptr inbounds %struct.amino_acid** %lookup, i64 %35
  store %struct.amino_acid* %34, %struct.amino_acid** %36, align 8
  br label %37

; <label>:37                                      ; preds = %32
  %38 = add nsw i32 %i1.0, 1
  br label %20

; <label>:39                                      ; preds = %20
  ret i8* null
}

; Function Attrs: nounwind uwtable
define void @randomize(%struct.amino_acid* %amino_acid, i32 %amino_acid_size, i8* %title, i32 %n, i32* %rand) #0 {
entry:
  %lookup = alloca [4096 x %struct.amino_acid*], align 16
  %line_buffer = alloca [61 x i8], align 16
  %v1 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i64 60
  store i8 10, i8* %v1, align 1
  %v2 = getelementptr inbounds [4096 x %struct.amino_acid*]* %lookup, i32 0, i32 0
  %v3 = call i8* @fill_lookup(%struct.amino_acid** %v2, %struct.amino_acid* %amino_acid, i32 %amino_acid_size)
  %v4 = load %struct._IO_FILE** @outStream, align 8
  %v5 = call i32 (i8*, %struct._IO_FILE*, ...)* bitcast (i32 (...)* @fputs_unlocked to i32 (i8*, %struct._IO_FILE*, ...)*)(i8* %title, %struct._IO_FILE* %v4)
  br label %B6

B6:                                       ; preds = %B35, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %v36, %B35 ]
  %j.0 = phi i32 [ 0, %entry ], [ %v37, %B35 ]
  %v7 = icmp slt i32 %i.0, %n
  br i1 %v7, label %B8, label %B38

B8:                                       ; preds = %B6
  %v9 = icmp eq i32 %j.0, 60
  br i1 %v9, label %B10, label %B14

B10:                                      ; preds = %B8
  %v11 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i32 0
  %v12 = load %struct._IO_FILE** @outStream, align 8
  %v13 = call i64 @fwrite_unlocked(i8* %v11, i64 61, i64 1, %struct._IO_FILE* %v12)
  br label %B14

B14:                                      ; preds = %B10, %B8
  %j.1 = phi i32 [ 0, %B10 ], [ %j.0, %B8 ]
  %v15 = call float @random_next_lookup(i32* %rand)
  %v16 = fptosi float %v15 to i16
  %v17 = sext i16 %v16 to i64
  %v18 = getelementptr inbounds [4096 x %struct.amino_acid*]* %lookup, i32 0, i64 %v17
  %v19 = load %struct.amino_acid** %v18, align 8
  br label %B20

B20:                                      ; preds = %B28, %B14
  %u.0 = phi %struct.amino_acid* [ %v19, %B14 ], [ %v29, %B28 ]
  %v21 = getelementptr inbounds %struct.amino_acid* %u.0, i32 0, i32 2
  %v22 = load float* %v21, align 4
  %v23 = fcmp olt float %v22, %v15
  %v24 = zext i1 %v23 to i32
  %v25 = sext i32 %v24 to i64
  %v26 = call i64 @llvm.expect.i64(i64 %v25, i64 0)
  %v27 = icmp ne i64 %v26, 0
  br i1 %v27, label %B28, label %B30

B28:                                      ; preds = %B20
  %v29 = getelementptr inbounds %struct.amino_acid* %u.0, i32 1
  br label %B20

B30:                                      ; preds = %B20
  %v31 = getelementptr inbounds %struct.amino_acid* %u.0, i32 0, i32 0
  %v32 = load i8* %v31, align 1
  %v33 = sext i32 %j.1 to i64
  %v34 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i64 %v33
  store i8 %v32, i8* %v34, align 1
  br label %B35

B35:                                      ; preds = %B30
  %v36 = add nsw i32 %i.0, 1
  %v37 = add nsw i32 %j.1, 1
  br label %B6

B38:                                      ; preds = %B6
  %v39 = sext i32 %j.0 to i64
  %v40 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i64 %v39
  store i8 10, i8* %v40, align 1
  %v41 = getelementptr inbounds [61 x i8]* %line_buffer, i32 0, i32 0
  %v42 = add nsw i32 %j.0, 1
  %v43 = sext i32 %v42 to i64
  %v44 = load %struct._IO_FILE** @outStream, align 8
  %v45 = call i64 @fwrite_unlocked(i8* %v41, i64 %v43, i64 1, %struct._IO_FILE* %v44)
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal float @random_next_lookup(i32* %random) #4 {
  %1 = load i32* %random, align 4
  %2 = mul i32 %1, 3877
  %3 = add i32 %2, 29573
  %4 = urem i32 %3, 139968
  store i32 %4, i32* %random, align 4
  %5 = load i32* %random, align 4
  %6 = uitofp i32 %5 to float
  %7 = fmul float %6, 0x3F9DF57700000000
  ret float %7
}

; Function Attrs: nounwind readnone
declare i64 @llvm.expect.i64(i64, i64) #5

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %filename = alloca [64 x i8], align 16
  %rand = alloca i32, align 4
  %1 = icmp sgt i32 %inputN, 1
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %3

; <label>:3                                       ; preds = %2, %0
  %n.0 = phi i32 [ %inputN, %2 ], [ 512, %0 ]
  %4 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %5 = call i32 (i8*, i8*, ...)* @sprintf(i8* %4, i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %n.0) #2
  %6 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %7 = call %struct._IO_FILE* @fopen(i8* %6, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** @outStream, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([15 x %struct.amino_acid]* @amino_acid, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([15 x %struct.amino_acid]* @amino_acid_orig, i32 0, i32 0, i32 0), i64 180, i32 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([4 x %struct.amino_acid]* @homo_sapiens, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([4 x %struct.amino_acid]* @homo_sapiens_orig, i32 0, i32 0, i32 0), i64 48, i32 16, i1 false)
  call void @random_init(i32* %rand)
  %8 = mul nsw i32 %n.0, 2
  call void @repeat(i8* getelementptr inbounds ([288 x i8]* @alu, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %8)
  %9 = mul nsw i32 %n.0, 3
  call void @randomize(%struct.amino_acid* getelementptr inbounds ([15 x %struct.amino_acid]* @amino_acid, i32 0, i32 0), i32 15, i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0), i32 %9, i32* %rand)
  %10 = mul nsw i32 %n.0, 5
  call void @randomize(%struct.amino_acid* getelementptr inbounds ([4 x %struct.amino_acid]* @homo_sapiens, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([31 x i8]* @.str4, i32 0, i32 0), i32 %10, i32* %rand)
  %11 = load %struct._IO_FILE** @outStream, align 8
  %12 = call i32 @fclose(%struct._IO_FILE* %11)
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
