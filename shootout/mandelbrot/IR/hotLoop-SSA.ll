; ModuleID = 'hotLoop.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [18 x i8] c"mandelbrot-%d.txt\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"P4\0A%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @hotLoop(i32 %w, i32 %h, double %x, double %y, double* %p_Cr, double* %p_Ci, i32 %iter, double* %p_Tr, double* %p_Ti, double %limit, double* %p_Zr, double* %p_Zi, i8* %p_byte_acc, i32* %p_bit_num, %struct._IO_FILE* %outStream) #0 {
  %1 = fmul double 2.000000e+00, %x
  %2 = sitofp i32 %w to double
  %3 = fdiv double %1, %2
  %4 = fsub double %3, 1.500000e+00
  store double %4, double* %p_Cr, align 8
  %5 = fmul double 2.000000e+00, %y
  %6 = sitofp i32 %h to double
  %7 = fdiv double %5, %6
  %8 = fsub double %7, 1.000000e+00
  store double %8, double* %p_Ci, align 8
  br label %9

; <label>:9                                       ; preds = %37, %0
  %i.0 = phi i32 [ 0, %0 ], [ %38, %37 ]
  %10 = icmp slt i32 %i.0, %iter
  br i1 %10, label %11, label %17

; <label>:11                                      ; preds = %9
  %12 = load double* %p_Tr, align 8
  %13 = load double* %p_Ti, align 8
  %14 = fadd double %12, %13
  %15 = fmul double %limit, %limit
  %16 = fcmp ole double %14, %15
  br label %17

; <label>:17                                      ; preds = %11, %9
  %18 = phi i1 [ false, %9 ], [ %16, %11 ]
  br i1 %18, label %19, label %39

; <label>:19                                      ; preds = %17
  %20 = load double* %p_Zr, align 8
  %21 = fmul double 2.000000e+00, %20
  %22 = load double* %p_Zi, align 8
  %23 = fmul double %21, %22
  %24 = load double* %p_Ci, align 8
  %25 = fadd double %23, %24
  store double %25, double* %p_Zi, align 8
  %26 = load double* %p_Tr, align 8
  %27 = load double* %p_Ti, align 8
  %28 = fsub double %26, %27
  %29 = load double* %p_Cr, align 8
  %30 = fadd double %28, %29
  store double %30, double* %p_Zr, align 8
  %31 = load double* %p_Zr, align 8
  %32 = load double* %p_Zr, align 8
  %33 = fmul double %31, %32
  store double %33, double* %p_Tr, align 8
  %34 = load double* %p_Zi, align 8
  %35 = load double* %p_Zi, align 8
  %36 = fmul double %34, %35
  store double %36, double* %p_Ti, align 8
  br label %37

; <label>:37                                      ; preds = %19
  %38 = add nsw i32 %i.0, 1
  br label %9

; <label>:39                                      ; preds = %17
  %40 = load i8* %p_byte_acc, align 1
  %41 = sext i8 %40 to i32
  %42 = shl i32 %41, 1
  %43 = trunc i32 %42 to i8
  store i8 %43, i8* %p_byte_acc, align 1
  %44 = load double* %p_Tr, align 8
  %45 = load double* %p_Ti, align 8
  %46 = fadd double %44, %45
  %47 = fmul double %limit, %limit
  %48 = fcmp ole double %46, %47
  br i1 %48, label %49, label %54

; <label>:49                                      ; preds = %39
  %50 = load i8* %p_byte_acc, align 1
  %51 = sext i8 %50 to i32
  %52 = or i32 %51, 1
  %53 = trunc i32 %52 to i8
  store i8 %53, i8* %p_byte_acc, align 1
  br label %54

; <label>:54                                      ; preds = %49, %39
  %55 = load i32* %p_bit_num, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %p_bit_num, align 4
  %57 = load i32* %p_bit_num, align 4
  %58 = icmp eq i32 %57, 8
  br i1 %58, label %59, label %63

; <label>:59                                      ; preds = %54
  %60 = load i8* %p_byte_acc, align 1
  %61 = sext i8 %60 to i32
  %62 = call i32 @_IO_putc(i32 %61, %struct._IO_FILE* %outStream)
  store i8 0, i8* %p_byte_acc, align 1
  store i32 0, i32* %p_bit_num, align 4
  br label %78

; <label>:63                                      ; preds = %54
  %64 = sub nsw i32 %w, 1
  %65 = sitofp i32 %64 to double
  %66 = fcmp oeq double %x, %65
  br i1 %66, label %67, label %77

; <label>:67                                      ; preds = %63
  %68 = srem i32 %w, 8
  %69 = sub nsw i32 8, %68
  %70 = load i8* %p_byte_acc, align 1
  %71 = sext i8 %70 to i32
  %72 = shl i32 %71, %69
  %73 = trunc i32 %72 to i8
  store i8 %73, i8* %p_byte_acc, align 1
  %74 = load i8* %p_byte_acc, align 1
  %75 = sext i8 %74 to i32
  %76 = call i32 @_IO_putc(i32 %75, %struct._IO_FILE* %outStream)
  store i8 0, i8* %p_byte_acc, align 1
  store i32 0, i32* %p_bit_num, align 4
  br label %77

; <label>:77                                      ; preds = %67, %63
  br label %78

; <label>:78                                      ; preds = %77, %59
  ret void
}

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %bit_num = alloca i32, align 4
  %byte_acc = alloca i8, align 1
  %Zr = alloca double, align 8
  %Zi = alloca double, align 8
  %Cr = alloca double, align 8
  %Ci = alloca double, align 8
  %Tr = alloca double, align 8
  %Ti = alloca double, align 8
  %filename = alloca [64 x i8], align 16
  store i32 0, i32* %bit_num, align 4
  store i8 0, i8* %byte_acc, align 1
  %1 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %2 = call i32 (i8*, i8*, ...)* @sprintf(i8* %1, i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0), i32 %inputN) #3
  %3 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %4 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %inputN, i32 %inputN)
  br label %6

; <label>:6                                       ; preds = %17, %0
  %y.0 = phi double [ 0.000000e+00, %0 ], [ %18, %17 ]
  %7 = sitofp i32 %inputN to double
  %8 = fcmp olt double %y.0, %7
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %6
  br label %10

; <label>:10                                      ; preds = %14, %9
  %x.0 = phi double [ 0.000000e+00, %9 ], [ %15, %14 ]
  %11 = sitofp i32 %inputN to double
  %12 = fcmp olt double %x.0, %11
  br i1 %12, label %13, label %16

; <label>:13                                      ; preds = %10
  store double 0.000000e+00, double* %Ti, align 8
  store double 0.000000e+00, double* %Tr, align 8
  store double 0.000000e+00, double* %Zi, align 8
  store double 0.000000e+00, double* %Zr, align 8
  call void @hotLoop(i32 %inputN, i32 %inputN, double %x.0, double %y.0, double* %Cr, double* %Ci, i32 50, double* %Tr, double* %Ti, double 2.000000e+00, double* %Zr, double* %Zi, i8* %byte_acc, i32* %bit_num, %struct._IO_FILE* %4)
  br label %14

; <label>:14                                      ; preds = %13
  %15 = fadd double %x.0, 1.000000e+00
  br label %10

; <label>:16                                      ; preds = %10
  br label %17

; <label>:17                                      ; preds = %16
  %18 = fadd double %y.0, 1.000000e+00
  br label %6

; <label>:19                                      ; preds = %6
  %20 = call i32 @fclose(%struct._IO_FILE* %4)
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
