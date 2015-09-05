; ModuleID = 'hotLoop.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [18 x i8] c"mandelbrot-%d.txt\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"P4\0A%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @hotLoop(i32 %w, i32 %h, double %x, double %y, double* %p_Cr, double* %p_Ci, i32 %iter, double* %p_Tr, double* %p_Ti, double %limit, double* %p_Zr, double* %p_Zi, i8* %p_byte_acc, i32* %p_bit_num, %struct._IO_FILE* %outStream) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double, align 8
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i32*, align 8
  %15 = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  store i32 %w, i32* %1, align 4
  store i32 %h, i32* %2, align 4
  store double %x, double* %3, align 8
  store double %y, double* %4, align 8
  store double* %p_Cr, double** %5, align 8
  store double* %p_Ci, double** %6, align 8
  store i32 %iter, i32* %7, align 4
  store double* %p_Tr, double** %8, align 8
  store double* %p_Ti, double** %9, align 8
  store double %limit, double* %10, align 8
  store double* %p_Zr, double** %11, align 8
  store double* %p_Zi, double** %12, align 8
  store i8* %p_byte_acc, i8** %13, align 8
  store i32* %p_bit_num, i32** %14, align 8
  store %struct._IO_FILE* %outStream, %struct._IO_FILE** %15, align 8
  %16 = load double* %3, align 8
  %17 = fmul double 2.000000e+00, %16
  %18 = load i32* %1, align 4
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %17, %19
  %21 = fsub double %20, 1.500000e+00
  %22 = load double** %5, align 8
  store double %21, double* %22, align 8
  %23 = load double* %4, align 8
  %24 = fmul double 2.000000e+00, %23
  %25 = load i32* %2, align 4
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %24, %26
  %28 = fsub double %27, 1.000000e+00
  %29 = load double** %6, align 8
  store double %28, double* %29, align 8
  store i32 0, i32* %i, align 4
  br label %30

; <label>:30                                      ; preds = %78, %0
  %31 = load i32* %i, align 4
  %32 = load i32* %7, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %44

; <label>:34                                      ; preds = %30
  %35 = load double** %8, align 8
  %36 = load double* %35, align 8
  %37 = load double** %9, align 8
  %38 = load double* %37, align 8
  %39 = fadd double %36, %38
  %40 = load double* %10, align 8
  %41 = load double* %10, align 8
  %42 = fmul double %40, %41
  %43 = fcmp ole double %39, %42
  br label %44

; <label>:44                                      ; preds = %34, %30
  %45 = phi i1 [ false, %30 ], [ %43, %34 ]
  br i1 %45, label %46, label %81

; <label>:46                                      ; preds = %44
  %47 = load double** %11, align 8
  %48 = load double* %47, align 8
  %49 = fmul double 2.000000e+00, %48
  %50 = load double** %12, align 8
  %51 = load double* %50, align 8
  %52 = fmul double %49, %51
  %53 = load double** %6, align 8
  %54 = load double* %53, align 8
  %55 = fadd double %52, %54
  %56 = load double** %12, align 8
  store double %55, double* %56, align 8
  %57 = load double** %8, align 8
  %58 = load double* %57, align 8
  %59 = load double** %9, align 8
  %60 = load double* %59, align 8
  %61 = fsub double %58, %60
  %62 = load double** %5, align 8
  %63 = load double* %62, align 8
  %64 = fadd double %61, %63
  %65 = load double** %11, align 8
  store double %64, double* %65, align 8
  %66 = load double** %11, align 8
  %67 = load double* %66, align 8
  %68 = load double** %11, align 8
  %69 = load double* %68, align 8
  %70 = fmul double %67, %69
  %71 = load double** %8, align 8
  store double %70, double* %71, align 8
  %72 = load double** %12, align 8
  %73 = load double* %72, align 8
  %74 = load double** %12, align 8
  %75 = load double* %74, align 8
  %76 = fmul double %73, %75
  %77 = load double** %9, align 8
  store double %76, double* %77, align 8
  br label %78

; <label>:78                                      ; preds = %46
  %79 = load i32* %i, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %i, align 4
  br label %30

; <label>:81                                      ; preds = %44
  %82 = load i8** %13, align 8
  %83 = load i8* %82, align 1
  %84 = sext i8 %83 to i32
  %85 = shl i32 %84, 1
  %86 = trunc i32 %85 to i8
  store i8 %86, i8* %82, align 1
  %87 = load double** %8, align 8
  %88 = load double* %87, align 8
  %89 = load double** %9, align 8
  %90 = load double* %89, align 8
  %91 = fadd double %88, %90
  %92 = load double* %10, align 8
  %93 = load double* %10, align 8
  %94 = fmul double %92, %93
  %95 = fcmp ole double %91, %94
  br i1 %95, label %96, label %102

; <label>:96                                      ; preds = %81
  %97 = load i8** %13, align 8
  %98 = load i8* %97, align 1
  %99 = sext i8 %98 to i32
  %100 = or i32 %99, 1
  %101 = trunc i32 %100 to i8
  store i8 %101, i8* %97, align 1
  br label %102

; <label>:102                                     ; preds = %96, %81
  %103 = load i32** %14, align 8
  %104 = load i32* %103, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %103, align 4
  %106 = load i32** %14, align 8
  %107 = load i32* %106, align 4
  %108 = icmp eq i32 %107, 8
  br i1 %108, label %109, label %117

; <label>:109                                     ; preds = %102
  %110 = load i8** %13, align 8
  %111 = load i8* %110, align 1
  %112 = sext i8 %111 to i32
  %113 = load %struct._IO_FILE** %15, align 8
  %114 = call i32 @_IO_putc(i32 %112, %struct._IO_FILE* %113)
  %115 = load i8** %13, align 8
  store i8 0, i8* %115, align 1
  %116 = load i32** %14, align 8
  store i32 0, i32* %116, align 4
  br label %140

; <label>:117                                     ; preds = %102
  %118 = load double* %3, align 8
  %119 = load i32* %1, align 4
  %120 = sub nsw i32 %119, 1
  %121 = sitofp i32 %120 to double
  %122 = fcmp oeq double %118, %121
  br i1 %122, label %123, label %139

; <label>:123                                     ; preds = %117
  %124 = load i32* %1, align 4
  %125 = srem i32 %124, 8
  %126 = sub nsw i32 8, %125
  %127 = load i8** %13, align 8
  %128 = load i8* %127, align 1
  %129 = sext i8 %128 to i32
  %130 = shl i32 %129, %126
  %131 = trunc i32 %130 to i8
  store i8 %131, i8* %127, align 1
  %132 = load i8** %13, align 8
  %133 = load i8* %132, align 1
  %134 = sext i8 %133 to i32
  %135 = load %struct._IO_FILE** %15, align 8
  %136 = call i32 @_IO_putc(i32 %134, %struct._IO_FILE* %135)
  %137 = load i8** %13, align 8
  store i8 0, i8* %137, align 1
  %138 = load i32** %14, align 8
  store i32 0, i32* %138, align 4
  br label %139

; <label>:139                                     ; preds = %123, %117
  br label %140

; <label>:140                                     ; preds = %139, %109
  ret void
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %w = alloca i32, align 4
  %h = alloca i32, align 4
  %bit_num = alloca i32, align 4
  %byte_acc = alloca i8, align 1
  %iter = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  %limit = alloca double, align 8
  %Zr = alloca double, align 8
  %Zi = alloca double, align 8
  %Cr = alloca double, align 8
  %Ci = alloca double, align 8
  %Tr = alloca double, align 8
  %Ti = alloca double, align 8
  %filename = alloca [64 x i8], align 16
  %outStream = alloca %struct._IO_FILE*, align 8
  store i32 %inputN, i32* %1, align 4
  store i32 0, i32* %bit_num, align 4
  store i8 0, i8* %byte_acc, align 1
  store i32 50, i32* %iter, align 4
  store double 2.000000e+00, double* %limit, align 8
  %2 = load i32* %1, align 4
  store i32 %2, i32* %h, align 4
  store i32 %2, i32* %w, align 4
  %3 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %4 = load i32* %w, align 4
  %5 = call i32 (i8*, i8*, ...)* @sprintf(i8* %3, i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0), i32 %4) #3
  %6 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %7 = call %struct._IO_FILE* @fopen(i8* %6, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %outStream, align 8
  %8 = load i32* %w, align 4
  %9 = load i32* %h, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %8, i32 %9)
  store double 0.000000e+00, double* %y, align 8
  br label %11

; <label>:11                                      ; preds = %34, %0
  %12 = load double* %y, align 8
  %13 = load i32* %h, align 4
  %14 = sitofp i32 %13 to double
  %15 = fcmp olt double %12, %14
  br i1 %15, label %16, label %37

; <label>:16                                      ; preds = %11
  store double 0.000000e+00, double* %x, align 8
  br label %17

; <label>:17                                      ; preds = %30, %16
  %18 = load double* %x, align 8
  %19 = load i32* %w, align 4
  %20 = sitofp i32 %19 to double
  %21 = fcmp olt double %18, %20
  br i1 %21, label %22, label %33

; <label>:22                                      ; preds = %17
  store double 0.000000e+00, double* %Ti, align 8
  store double 0.000000e+00, double* %Tr, align 8
  store double 0.000000e+00, double* %Zi, align 8
  store double 0.000000e+00, double* %Zr, align 8
  %23 = load i32* %w, align 4
  %24 = load i32* %h, align 4
  %25 = load double* %x, align 8
  %26 = load double* %y, align 8
  %27 = load i32* %iter, align 4
  %28 = load double* %limit, align 8
  %29 = load %struct._IO_FILE** %outStream, align 8
  call void @hotLoop(i32 %23, i32 %24, double %25, double %26, double* %Cr, double* %Ci, i32 %27, double* %Tr, double* %Ti, double %28, double* %Zr, double* %Zi, i8* %byte_acc, i32* %bit_num, %struct._IO_FILE* %29)
  br label %30

; <label>:30                                      ; preds = %22
  %31 = load double* %x, align 8
  %32 = fadd double %31, 1.000000e+00
  store double %32, double* %x, align 8
  br label %17

; <label>:33                                      ; preds = %17
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load double* %y, align 8
  %36 = fadd double %35, 1.000000e+00
  store double %36, double* %y, align 8
  br label %11

; <label>:37                                      ; preds = %11
  %38 = load %struct._IO_FILE** %outStream, align 8
  %39 = call i32 @fclose(%struct._IO_FILE* %38)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @printf(i8*, ...) #1

declare i32 @fclose(%struct._IO_FILE*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
