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
entry:
  %filename = alloca [64 x i8], align 16
  %v1 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %v2 = call i32 (i8*, i8*, ...)* @sprintf(i8* %v1, i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0), i32 %inputN) #3
  %v3 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0
  %v4 = call %struct._IO_FILE* @fopen(i8* %v3, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  %v5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %inputN, i32 %inputN)
  br label %B6

B6:                                       ; preds = %B74, %entry
  %y.0 = phi double [ 0.000000e+00, %entry ], [ %v75, %B74 ]
  %byte_acc.0 = phi i8 [ 0, %entry ], [ %byte_acc.1, %B74 ]
  %bit_num.0 = phi i32 [ 0, %entry ], [ %bit_num.1, %B74 ]
  %v7 = sitofp i32 %inputN to double
  %v8 = fcmp olt double %y.0, %v7
  br i1 %v8, label %B9, label %B76

B9:                                       ; preds = %B6
  br label %B10

B10:                                      ; preds = %B71, %B9
  %x.0 = phi double [ 0.000000e+00, %B9 ], [ %v72, %B71 ]
  %byte_acc.1 = phi i8 [ %byte_acc.0, %B9 ], [ %byte_acc.4, %B71 ]
  %bit_num.1 = phi i32 [ %bit_num.0, %B9 ], [ %bit_num.3, %B71 ]
  %v11 = sitofp i32 %inputN to double
  %v12 = fcmp olt double %x.0, %v11
  br i1 %v12, label %B13, label %B73

B13:                                      ; preds = %B10
  %v14 = fmul double 2.000000e+00, %x.0
  %v15 = sitofp i32 %inputN to double
  %v16 = fdiv double %v14, %v15
  %v17 = fsub double %v16, 1.500000e+00
  %v18 = fmul double 2.000000e+00, %y.0
  %v19 = sitofp i32 %inputN to double
  %v20 = fdiv double %v18, %v19
  %v21 = fsub double %v20, 1.000000e+00
  br label %B22

B22:                                      ; preds = %B38, %B13
  %Zr.0 = phi double [ 0.000000e+00, %B13 ], [ %v35, %B38 ]
  %i.0 = phi i32 [ 0, %B13 ], [ %v39, %B38 ]
  %Zi.0 = phi double [ 0.000000e+00, %B13 ], [ %v33, %B38 ]
  %Tr.0 = phi double [ 0.000000e+00, %B13 ], [ %v36, %B38 ]
  %Ti.0 = phi double [ 0.000000e+00, %B13 ], [ %v37, %B38 ]
  %v23 = icmp slt i32 %i.0, 50
  br i1 %v23, label %B24, label %B28

B24:                                      ; preds = %B22
  %v25 = fadd double %Tr.0, %Ti.0
  %v26 = fmul double 2.000000e+00, 2.000000e+00
  %v27 = fcmp ole double %v25, %v26
  br label %B28

B28:                                      ; preds = %B24, %B22
  %v29 = phi i1 [ false, %B22 ], [ %v27, %B24 ]
  br i1 %v29, label %B30, label %B40

B30:                                      ; preds = %B28
  %v31 = fmul double 2.000000e+00, %Zr.0
  %v32 = fmul double %v31, %Zi.0
  %v33 = fadd double %v32, %v21
  %v34 = fsub double %Tr.0, %Ti.0
  %v35 = fadd double %v34, %v17
  %v36 = fmul double %v35, %v35
  %v37 = fmul double %v33, %v33
  br label %B38

B38:                                      ; preds = %B30
  %v39 = add nsw i32 %i.0, 1
  br label %B22

B40:                                      ; preds = %B28
  %v41 = sext i8 %byte_acc.1 to i32
  %v42 = shl i32 %v41, 1
  %v43 = trunc i32 %v42 to i8
  %v44 = fadd double %Tr.0, %Ti.0
  %v45 = fmul double 2.000000e+00, 2.000000e+00
  %v46 = fcmp ole double %v44, %v45
  br i1 %v46, label %B47, label %B51

B47:                                      ; preds = %B40
  %v48 = sext i8 %v43 to i32
  %v49 = or i32 %v48, 1
  %v50 = trunc i32 %v49 to i8
  br label %B51

B51:                                      ; preds = %B47, %B40
  %byte_acc.2 = phi i8 [ %v50, %B47 ], [ %v43, %B40 ]
  %v52 = add nsw i32 %bit_num.1, 1
  %v53 = icmp eq i32 %v52, 8
  br i1 %v53, label %B54, label %B57

B54:                                      ; preds = %B51
  %v55 = sext i8 %byte_acc.2 to i32
  %v56 = call i32 @_IO_putc(i32 %v55, %struct._IO_FILE* %v4)
  br label %B70

B57:                                      ; preds = %B51
  %v58 = sub nsw i32 %inputN, 1
  %v59 = sitofp i32 %v58 to double
  %v60 = fcmp oeq double %x.0, %v59
  br i1 %v60, label %B61, label %B69

B61:                                      ; preds = %B57
  %v62 = srem i32 %inputN, 8
  %v63 = sub nsw i32 8, %v62
  %v64 = sext i8 %byte_acc.2 to i32
  %v65 = shl i32 %v64, %v63
  %v66 = trunc i32 %v65 to i8
  %v67 = sext i8 %v66 to i32
  %v68 = call i32 @_IO_putc(i32 %v67, %struct._IO_FILE* %v4)
  br label %B69

B69:                                      ; preds = %B61, %B57
  %byte_acc.3 = phi i8 [ 0, %B61 ], [ %byte_acc.2, %B57 ]
  %bit_num.2 = phi i32 [ 0, %B61 ], [ %v52, %B57 ]
  br label %B70

B70:                                      ; preds = %B69, %B54
  %byte_acc.4 = phi i8 [ 0, %B54 ], [ %byte_acc.3, %B69 ]
  %bit_num.3 = phi i32 [ 0, %B54 ], [ %bit_num.2, %B69 ]
  br label %B71

B71:                                      ; preds = %B70
  %v72 = fadd double %x.0, 1.000000e+00
  br label %B10

B73:                                      ; preds = %B10
  br label %B74

B74:                                      ; preds = %B73
  %v75 = fadd double %y.0, 1.000000e+00
  br label %B6

B76:                                      ; preds = %B6
  %v77 = call i32 @fclose(%struct._IO_FILE* %v4)
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
