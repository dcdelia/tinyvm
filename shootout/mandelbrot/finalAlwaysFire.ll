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
entry:
  %v1 = fmul double 2.000000e+00, %x
  %v2 = sitofp i32 %w to double
  %v3 = fdiv double %v1, %v2
  %v4 = fsub double %v3, 1.500000e+00
  store double %v4, double* %p_Cr, align 8
  %v5 = fmul double 2.000000e+00, %y
  %v6 = sitofp i32 %h to double
  %v7 = fdiv double %v5, %v6
  %v8 = fsub double %v7, 1.000000e+00
  store double %v8, double* %p_Ci, align 8
  br label %B9

B9:                                       ; preds = %B37, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %v38, %B37 ]
  %v10 = icmp slt i32 %i.0, %iter
  br i1 %v10, label %B11, label %B17

B11:                                      ; preds = %B9
  %v12 = load double* %p_Tr, align 8
  %v13 = load double* %p_Ti, align 8
  %v14 = fadd double %v12, %v13
  %v15 = fmul double %limit, %limit
  %v16 = fcmp ole double %v14, %v15
  br label %B17

B17:                                      ; preds = %B11, %B9
  %v18 = phi i1 [ false, %B9 ], [ %v16, %B11 ]
  br i1 %v18, label %B19, label %B39

B19:                                      ; preds = %B17
  %v20 = load double* %p_Zr, align 8
  %v21 = fmul double 2.000000e+00, %v20
  %v22 = load double* %p_Zi, align 8
  %v23 = fmul double %v21, %v22
  %v24 = load double* %p_Ci, align 8
  %v25 = fadd double %v23, %v24
  store double %v25, double* %p_Zi, align 8
  %v26 = load double* %p_Tr, align 8
  %v27 = load double* %p_Ti, align 8
  %v28 = fsub double %v26, %v27
  %v29 = load double* %p_Cr, align 8
  %v30 = fadd double %v28, %v29
  store double %v30, double* %p_Zr, align 8
  %v31 = load double* %p_Zr, align 8
  %v32 = load double* %p_Zr, align 8
  %v33 = fmul double %v31, %v32
  store double %v33, double* %p_Tr, align 8
  %v34 = load double* %p_Zi, align 8
  %v35 = load double* %p_Zi, align 8
  %v36 = fmul double %v34, %v35
  store double %v36, double* %p_Ti, align 8
  br label %B37

B37:                                      ; preds = %B19
  %v38 = add nsw i32 %i.0, 1
  br label %B9

B39:                                      ; preds = %B17
  %v40 = load i8* %p_byte_acc, align 1
  %v41 = sext i8 %v40 to i32
  %v42 = shl i32 %v41, 1
  %v43 = trunc i32 %v42 to i8
  store i8 %v43, i8* %p_byte_acc, align 1
  %v44 = load double* %p_Tr, align 8
  %v45 = load double* %p_Ti, align 8
  %v46 = fadd double %v44, %v45
  %v47 = fmul double %limit, %limit
  %v48 = fcmp ole double %v46, %v47
  br i1 %v48, label %B49, label %B54

B49:                                      ; preds = %B39
  %v50 = load i8* %p_byte_acc, align 1
  %v51 = sext i8 %v50 to i32
  %v52 = or i32 %v51, 1
  %v53 = trunc i32 %v52 to i8
  store i8 %v53, i8* %p_byte_acc, align 1
  br label %B54

B54:                                      ; preds = %B49, %B39
  %v55 = load i32* %p_bit_num, align 4
  %v56 = add nsw i32 %v55, 1
  store i32 %v56, i32* %p_bit_num, align 4
  %v57 = load i32* %p_bit_num, align 4
  %v58 = icmp eq i32 %v57, 8
  br i1 %v58, label %B59, label %B63

B59:                                      ; preds = %B54
  %v60 = load i8* %p_byte_acc, align 1
  %v61 = sext i8 %v60 to i32
  %v62 = call i32 @_IO_putc(i32 %v61, %struct._IO_FILE* %outStream)
  store i8 0, i8* %p_byte_acc, align 1
  store i32 0, i32* %p_bit_num, align 4
  br label %B78

B63:                                      ; preds = %B54
  %v64 = sub nsw i32 %w, 1
  %v65 = sitofp i32 %v64 to double
  %v66 = fcmp oeq double %x, %v65
  br i1 %v66, label %B67, label %B77

B67:                                      ; preds = %B63
  %v68 = srem i32 %w, 8
  %v69 = sub nsw i32 8, %v68
  %v70 = load i8* %p_byte_acc, align 1
  %v71 = sext i8 %v70 to i32
  %v72 = shl i32 %v71, %v69
  %v73 = trunc i32 %v72 to i8
  store i8 %v73, i8* %p_byte_acc, align 1
  %v74 = load i8* %p_byte_acc, align 1
  %v75 = sext i8 %v74 to i32
  %v76 = call i32 @_IO_putc(i32 %v75, %struct._IO_FILE* %outStream)
  store i8 0, i8* %p_byte_acc, align 1
  store i32 0, i32* %p_bit_num, align 4
  br label %B77

B77:                                      ; preds = %B67, %B63
  br label %B78

B78:                                      ; preds = %B77, %B59
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
