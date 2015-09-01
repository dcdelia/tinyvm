; ModuleID = 'code.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [18 x i8] c"mandelbrot-%d.txt\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"P4\0A%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %filename = alloca [64 x i8], align 16
  %1 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %2 = call i32 (i8*, i8*, ...)* @sprintf(i8* %1, i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0), i32 %inputN) #3
  %3 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %4 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %inputN, i32 %inputN)
  br label %6

; <label>:6                                       ; preds = %74, %0
  %y.0 = phi double [ 0.000000e+00, %0 ], [ %75, %74 ]
  %byte_acc.0 = phi i8 [ 0, %0 ], [ %byte_acc.1, %74 ]
  %bit_num.0 = phi i32 [ 0, %0 ], [ %bit_num.1, %74 ]
  %7 = sitofp i32 %inputN to double
  %8 = fcmp olt double %y.0, %7
  br i1 %8, label %9, label %76

; <label>:9                                       ; preds = %6
  br label %10

; <label>:10                                      ; preds = %71, %9
  %x.0 = phi double [ 0.000000e+00, %9 ], [ %72, %71 ]
  %byte_acc.1 = phi i8 [ %byte_acc.0, %9 ], [ %byte_acc.4, %71 ]
  %bit_num.1 = phi i32 [ %bit_num.0, %9 ], [ %bit_num.3, %71 ]
  %11 = sitofp i32 %inputN to double
  %12 = fcmp olt double %x.0, %11
  br i1 %12, label %13, label %73

; <label>:13                                      ; preds = %10
  %14 = fmul double 2.000000e+00, %x.0
  %15 = sitofp i32 %inputN to double
  %16 = fdiv double %14, %15
  %17 = fsub double %16, 1.500000e+00
  %18 = fmul double 2.000000e+00, %y.0
  %19 = sitofp i32 %inputN to double
  %20 = fdiv double %18, %19
  %21 = fsub double %20, 1.000000e+00
  br label %22

; <label>:22                                      ; preds = %38, %13
  %Zr.0 = phi double [ 0.000000e+00, %13 ], [ %35, %38 ]
  %i.0 = phi i32 [ 0, %13 ], [ %39, %38 ]
  %Zi.0 = phi double [ 0.000000e+00, %13 ], [ %33, %38 ]
  %Tr.0 = phi double [ 0.000000e+00, %13 ], [ %36, %38 ]
  %Ti.0 = phi double [ 0.000000e+00, %13 ], [ %37, %38 ]
  %23 = icmp slt i32 %i.0, 50
  br i1 %23, label %24, label %28

; <label>:24                                      ; preds = %22
  %25 = fadd double %Tr.0, %Ti.0
  %26 = fmul double 2.000000e+00, 2.000000e+00
  %27 = fcmp ole double %25, %26
  br label %28

; <label>:28                                      ; preds = %24, %22
  %29 = phi i1 [ false, %22 ], [ %27, %24 ]
  br i1 %29, label %30, label %40

; <label>:30                                      ; preds = %28
  %31 = fmul double 2.000000e+00, %Zr.0
  %32 = fmul double %31, %Zi.0
  %33 = fadd double %32, %21
  %34 = fsub double %Tr.0, %Ti.0
  %35 = fadd double %34, %17
  %36 = fmul double %35, %35
  %37 = fmul double %33, %33
  br label %38

; <label>:38                                      ; preds = %30
  %39 = add nsw i32 %i.0, 1
  br label %22

; <label>:40                                      ; preds = %28
  %41 = sext i8 %byte_acc.1 to i32
  %42 = shl i32 %41, 1
  %43 = trunc i32 %42 to i8
  %44 = fadd double %Tr.0, %Ti.0
  %45 = fmul double 2.000000e+00, 2.000000e+00
  %46 = fcmp ole double %44, %45
  br i1 %46, label %47, label %51

; <label>:47                                      ; preds = %40
  %48 = sext i8 %43 to i32
  %49 = or i32 %48, 1
  %50 = trunc i32 %49 to i8
  br label %51

; <label>:51                                      ; preds = %47, %40
  %byte_acc.2 = phi i8 [ %50, %47 ], [ %43, %40 ]
  %52 = add nsw i32 %bit_num.1, 1
  %53 = icmp eq i32 %52, 8
  br i1 %53, label %54, label %57

; <label>:54                                      ; preds = %51
  %55 = sext i8 %byte_acc.2 to i32
  %56 = call i32 @_IO_putc(i32 %55, %struct._IO_FILE* %4)
  br label %70

; <label>:57                                      ; preds = %51
  %58 = sub nsw i32 %inputN, 1
  %59 = sitofp i32 %58 to double
  %60 = fcmp oeq double %x.0, %59
  br i1 %60, label %61, label %69

; <label>:61                                      ; preds = %57
  %62 = srem i32 %inputN, 8
  %63 = sub nsw i32 8, %62
  %64 = sext i8 %byte_acc.2 to i32
  %65 = shl i32 %64, %63
  %66 = trunc i32 %65 to i8
  %67 = sext i8 %66 to i32
  %68 = call i32 @_IO_putc(i32 %67, %struct._IO_FILE* %4)
  br label %69

; <label>:69                                      ; preds = %61, %57
  %byte_acc.3 = phi i8 [ 0, %61 ], [ %byte_acc.2, %57 ]
  %bit_num.2 = phi i32 [ 0, %61 ], [ %52, %57 ]
  br label %70

; <label>:70                                      ; preds = %69, %54
  %byte_acc.4 = phi i8 [ 0, %54 ], [ %byte_acc.3, %69 ]
  %bit_num.3 = phi i32 [ 0, %54 ], [ %bit_num.2, %69 ]
  br label %71

; <label>:71                                      ; preds = %70
  %72 = fadd double %x.0, 1.000000e+00
  br label %10

; <label>:73                                      ; preds = %10
  br label %74

; <label>:74                                      ; preds = %73
  %75 = fadd double %y.0, 1.000000e+00
  br label %6

; <label>:76                                      ; preds = %6
  %77 = call i32 @fclose(%struct._IO_FILE* %4)
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
