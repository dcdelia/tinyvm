; ModuleID = 'finalAlwaysFire.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [18 x i8] c"mandelbrot-%d.txt\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"P4\0A%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @hotLoop(i32 %w, i32 %h, double %x, double %y, double* nocapture %p_Cr, double* nocapture %p_Ci, i32 %iter, double* nocapture %p_Tr, double* nocapture %p_Ti, double %limit, double* nocapture %p_Zr, double* nocapture %p_Zi, i8* nocapture %p_byte_acc, i32* nocapture %p_bit_num, %struct._IO_FILE* nocapture %outStream) #0 {
entry:
  %v1 = fmul double %x, 2.000000e+00
  %v2 = sitofp i32 %w to double
  %v3 = fdiv double %v1, %v2
  %v4 = fadd double %v3, -1.500000e+00
  store double %v4, double* %p_Cr, align 8
  %v5 = fmul double %y, 2.000000e+00
  %v6 = sitofp i32 %h to double
  %v7 = fdiv double %v5, %v6
  %v8 = fadd double %v7, -1.000000e+00
  store double %v8, double* %p_Ci, align 8
  %v102 = icmp sgt i32 %iter, 0
  br i1 %v102, label %B11.lr.ph, label %B39

B11.lr.ph:                                        ; preds = %entry
  %v15 = fmul double %limit, %limit
  br label %B11

B11:                                              ; preds = %B11.lr.ph, %B19
  %i.03 = phi i32 [ 0, %B11.lr.ph ], [ %v38, %B19 ]
  %v12 = load double* %p_Tr, align 8
  %v13 = load double* %p_Ti, align 8
  %v14 = fadd double %v12, %v13
  %v16 = fcmp ugt double %v14, %v15
  br i1 %v16, label %B39.loopexit, label %B19

B19:                                              ; preds = %B11
  %v20 = load double* %p_Zr, align 8
  %v21 = fmul double %v20, 2.000000e+00
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
  %v33 = fmul double %v30, %v30
  store double %v33, double* %p_Tr, align 8
  %v34 = load double* %p_Zi, align 8
  %v36 = fmul double %v34, %v34
  store double %v36, double* %p_Ti, align 8
  %v38 = add nuw nsw i32 %i.03, 1
  %v10 = icmp slt i32 %v38, %iter
  br i1 %v10, label %B11, label %B39.loopexit

B39.loopexit:                                     ; preds = %B11, %B19
  br label %B39

B39:                                              ; preds = %B39.loopexit, %entry
  %v40 = load i8* %p_byte_acc, align 1
  %v42 = shl i8 %v40, 1
  store i8 %v42, i8* %p_byte_acc, align 1
  %v44 = load double* %p_Tr, align 8
  %v45 = load double* %p_Ti, align 8
  %v46 = fadd double %v44, %v45
  %v47 = fmul double %limit, %limit
  %v48 = fcmp ugt double %v46, %v47
  br i1 %v48, label %B54, label %B49

B49:                                              ; preds = %B39
  %v52 = or i8 %v42, 1
  store i8 %v52, i8* %p_byte_acc, align 1
  br label %B54

B54:                                              ; preds = %B39, %B49
  %v55 = load i32* %p_bit_num, align 4
  %v56 = add nsw i32 %v55, 1
  store i32 %v56, i32* %p_bit_num, align 4
  %v58 = icmp eq i32 %v56, 8
  br i1 %v58, label %B59, label %B63

B59:                                              ; preds = %B54
  %v60 = load i8* %p_byte_acc, align 1
  %v61 = sext i8 %v60 to i32
  %v62 = tail call i32 @_IO_putc(i32 %v61, %struct._IO_FILE* %outStream) #2
  store i8 0, i8* %p_byte_acc, align 1
  store i32 0, i32* %p_bit_num, align 4
  br label %B78

B63:                                              ; preds = %B54
  %v64 = add nsw i32 %w, -1
  %v65 = sitofp i32 %v64 to double
  %v66 = fcmp oeq double %v65, %x
  br i1 %v66, label %B67, label %B78

B67:                                              ; preds = %B63
  %v68 = srem i32 %w, 8
  %v69 = sub nsw i32 8, %v68
  %v70 = load i8* %p_byte_acc, align 1
  %v71 = sext i8 %v70 to i32
  %v72 = shl i32 %v71, %v69
  %v73 = trunc i32 %v72 to i8
  store i8 %v73, i8* %p_byte_acc, align 1
  %sext = shl i32 %v72, 24
  %v75 = ashr exact i32 %sext, 24
  %v76 = tail call i32 @_IO_putc(i32 %v75, %struct._IO_FILE* %outStream) #2
  store i8 0, i8* %p_byte_acc, align 1
  store i32 0, i32* %p_bit_num, align 4
  br label %B78

B78:                                              ; preds = %B63, %B67, %B59
  ret void
}

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) #1

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
  %1 = getelementptr inbounds [64 x i8]* %filename, i64 0, i64 0
  %2 = call i32 (i8*, i8*, ...)* @sprintf(i8* %1, i8* getelementptr inbounds ([18 x i8]* @.str, i64 0, i64 0), i32 %inputN) #2
  %3 = call %struct._IO_FILE* @fopen(i8* %1, i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0)) #2
  %4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), i32 %inputN, i32 %inputN) #2
  %5 = sitofp i32 %inputN to double
  %6 = icmp sgt i32 %inputN, 0
  br i1 %6, label %.preheader.preheader, label %._crit_edge3

.preheader.preheader:                             ; preds = %0
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %y.02 = phi double [ %9, %._crit_edge ], [ 0.000000e+00, %.preheader.preheader ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %x.01 = phi double [ %7, %.lr.ph ], [ 0.000000e+00, %.preheader ]
  store double 0.000000e+00, double* %Ti, align 8
  store double 0.000000e+00, double* %Tr, align 8
  store double 0.000000e+00, double* %Zi, align 8
  store double 0.000000e+00, double* %Zr, align 8
  call void @hotLoop(i32 %inputN, i32 %inputN, double %x.01, double %y.02, double* %Cr, double* %Ci, i32 50, double* %Tr, double* %Ti, double 2.000000e+00, double* %Zr, double* %Zi, i8* %byte_acc, i32* %bit_num, %struct._IO_FILE* %3)
  %7 = fadd double %x.01, 1.000000e+00
  %8 = fcmp olt double %7, %5
  br i1 %8, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph
  %9 = fadd double %y.02, 1.000000e+00
  %10 = fcmp olt double %9, %5
  br i1 %10, label %.preheader, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %0
  %11 = tail call i32 @fclose(%struct._IO_FILE* %3) #2
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
