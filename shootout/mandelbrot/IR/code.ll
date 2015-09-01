; ModuleID = 'code.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [18 x i8] c"mandelbrot-%d.txt\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"P4\0A%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %w = alloca i32, align 4
  %h = alloca i32, align 4
  %bit_num = alloca i32, align 4
  %byte_acc = alloca i8, align 1
  %i = alloca i32, align 4
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

; <label>:11                                      ; preds = %121, %0
  %12 = load double* %y, align 8
  %13 = load i32* %h, align 4
  %14 = sitofp i32 %13 to double
  %15 = fcmp olt double %12, %14
  br i1 %15, label %16, label %124

; <label>:16                                      ; preds = %11
  store double 0.000000e+00, double* %x, align 8
  br label %17

; <label>:17                                      ; preds = %117, %16
  %18 = load double* %x, align 8
  %19 = load i32* %w, align 4
  %20 = sitofp i32 %19 to double
  %21 = fcmp olt double %18, %20
  br i1 %21, label %22, label %120

; <label>:22                                      ; preds = %17
  store double 0.000000e+00, double* %Ti, align 8
  store double 0.000000e+00, double* %Tr, align 8
  store double 0.000000e+00, double* %Zi, align 8
  store double 0.000000e+00, double* %Zr, align 8
  %23 = load double* %x, align 8
  %24 = fmul double 2.000000e+00, %23
  %25 = load i32* %w, align 4
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %24, %26
  %28 = fsub double %27, 1.500000e+00
  store double %28, double* %Cr, align 8
  %29 = load double* %y, align 8
  %30 = fmul double 2.000000e+00, %29
  %31 = load i32* %h, align 4
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %30, %32
  %34 = fsub double %33, 1.000000e+00
  store double %34, double* %Ci, align 8
  store i32 0, i32* %i, align 4
  br label %35

; <label>:35                                      ; preds = %67, %22
  %36 = load i32* %i, align 4
  %37 = load i32* %iter, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %47

; <label>:39                                      ; preds = %35
  %40 = load double* %Tr, align 8
  %41 = load double* %Ti, align 8
  %42 = fadd double %40, %41
  %43 = load double* %limit, align 8
  %44 = load double* %limit, align 8
  %45 = fmul double %43, %44
  %46 = fcmp ole double %42, %45
  br label %47

; <label>:47                                      ; preds = %39, %35
  %48 = phi i1 [ false, %35 ], [ %46, %39 ]
  br i1 %48, label %49, label %70

; <label>:49                                      ; preds = %47
  %50 = load double* %Zr, align 8
  %51 = fmul double 2.000000e+00, %50
  %52 = load double* %Zi, align 8
  %53 = fmul double %51, %52
  %54 = load double* %Ci, align 8
  %55 = fadd double %53, %54
  store double %55, double* %Zi, align 8
  %56 = load double* %Tr, align 8
  %57 = load double* %Ti, align 8
  %58 = fsub double %56, %57
  %59 = load double* %Cr, align 8
  %60 = fadd double %58, %59
  store double %60, double* %Zr, align 8
  %61 = load double* %Zr, align 8
  %62 = load double* %Zr, align 8
  %63 = fmul double %61, %62
  store double %63, double* %Tr, align 8
  %64 = load double* %Zi, align 8
  %65 = load double* %Zi, align 8
  %66 = fmul double %64, %65
  store double %66, double* %Ti, align 8
  br label %67

; <label>:67                                      ; preds = %49
  %68 = load i32* %i, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %i, align 4
  br label %35

; <label>:70                                      ; preds = %47
  %71 = load i8* %byte_acc, align 1
  %72 = sext i8 %71 to i32
  %73 = shl i32 %72, 1
  %74 = trunc i32 %73 to i8
  store i8 %74, i8* %byte_acc, align 1
  %75 = load double* %Tr, align 8
  %76 = load double* %Ti, align 8
  %77 = fadd double %75, %76
  %78 = load double* %limit, align 8
  %79 = load double* %limit, align 8
  %80 = fmul double %78, %79
  %81 = fcmp ole double %77, %80
  br i1 %81, label %82, label %87

; <label>:82                                      ; preds = %70
  %83 = load i8* %byte_acc, align 1
  %84 = sext i8 %83 to i32
  %85 = or i32 %84, 1
  %86 = trunc i32 %85 to i8
  store i8 %86, i8* %byte_acc, align 1
  br label %87

; <label>:87                                      ; preds = %82, %70
  %88 = load i32* %bit_num, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %bit_num, align 4
  %90 = load i32* %bit_num, align 4
  %91 = icmp eq i32 %90, 8
  br i1 %91, label %92, label %97

; <label>:92                                      ; preds = %87
  %93 = load i8* %byte_acc, align 1
  %94 = sext i8 %93 to i32
  %95 = load %struct._IO_FILE** %outStream, align 8
  %96 = call i32 @_IO_putc(i32 %94, %struct._IO_FILE* %95)
  store i8 0, i8* %byte_acc, align 1
  store i32 0, i32* %bit_num, align 4
  br label %116

; <label>:97                                      ; preds = %87
  %98 = load double* %x, align 8
  %99 = load i32* %w, align 4
  %100 = sub nsw i32 %99, 1
  %101 = sitofp i32 %100 to double
  %102 = fcmp oeq double %98, %101
  br i1 %102, label %103, label %115

; <label>:103                                     ; preds = %97
  %104 = load i32* %w, align 4
  %105 = srem i32 %104, 8
  %106 = sub nsw i32 8, %105
  %107 = load i8* %byte_acc, align 1
  %108 = sext i8 %107 to i32
  %109 = shl i32 %108, %106
  %110 = trunc i32 %109 to i8
  store i8 %110, i8* %byte_acc, align 1
  %111 = load i8* %byte_acc, align 1
  %112 = sext i8 %111 to i32
  %113 = load %struct._IO_FILE** %outStream, align 8
  %114 = call i32 @_IO_putc(i32 %112, %struct._IO_FILE* %113)
  store i8 0, i8* %byte_acc, align 1
  store i32 0, i32* %bit_num, align 4
  br label %115

; <label>:115                                     ; preds = %103, %97
  br label %116

; <label>:116                                     ; preds = %115, %92
  br label %117

; <label>:117                                     ; preds = %116
  %118 = load double* %x, align 8
  %119 = fadd double %118, 1.000000e+00
  store double %119, double* %x, align 8
  br label %17

; <label>:120                                     ; preds = %17
  br label %121

; <label>:121                                     ; preds = %120
  %122 = load double* %y, align 8
  %123 = fadd double %122, 1.000000e+00
  store double %123, double* %y, align 8
  br label %11

; <label>:124                                     ; preds = %11
  %125 = load %struct._IO_FILE** %outStream, align 8
  %126 = call i32 @fclose(%struct._IO_FILE* %125)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #1

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @printf(i8*, ...) #2

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #2

declare i32 @fclose(%struct._IO_FILE*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
