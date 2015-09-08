; ModuleID = 'codeQuality.ll'
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
  %v1 = getelementptr inbounds [64 x i8]* %filename, i64 0, i64 0
  %v2 = call i32 (i8*, i8*, ...)* @sprintf(i8* %v1, i8* getelementptr inbounds ([18 x i8]* @.str, i64 0, i64 0), i32 %inputN) #2
  %v4 = call %struct._IO_FILE* @fopen(i8* %v1, i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0)) #2
  %v5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), i32 %inputN, i32 %inputN) #2
  %v7 = sitofp i32 %inputN to double
  %v812 = icmp sgt i32 %inputN, 0
  br i1 %v812, label %B10.preheader.lr.ph, label %B76

B10.preheader.lr.ph:                              ; preds = %entry
  %v58 = add nsw i32 %inputN, -1
  %v59 = sitofp i32 %v58 to double
  %v62 = srem i32 %inputN, 8
  %v63 = sub nsw i32 8, %v62
  br label %B13.lr.ph

B13.lr.ph:                                        ; preds = %B74, %B10.preheader.lr.ph
  %bit_num.015 = phi i32 [ 0, %B10.preheader.lr.ph ], [ %bit_num.3.lcssa, %B74 ]
  %byte_acc.014 = phi i8 [ 0, %B10.preheader.lr.ph ], [ %byte_acc.4.lcssa, %B74 ]
  %y.013 = phi double [ 0.000000e+00, %B10.preheader.lr.ph ], [ %v75, %B74 ]
  %v18 = fmul double %y.013, 2.000000e+00
  %v20 = fdiv double %v18, %v7
  %v21 = fadd double %v20, -1.000000e+00
  br label %B13

B13:                                              ; preds = %B13.lr.ph, %B71
  %bit_num.110 = phi i32 [ %bit_num.015, %B13.lr.ph ], [ %bit_num.3, %B71 ]
  %byte_acc.19 = phi i8 [ %byte_acc.014, %B13.lr.ph ], [ %byte_acc.4, %B71 ]
  %x.08 = phi double [ 0.000000e+00, %B13.lr.ph ], [ %v72, %B71 ]
  %v14 = fmul double %x.08, 2.000000e+00
  %v16 = fdiv double %v14, %v7
  %v17 = fadd double %v16, -1.500000e+00
  br label %B30

B30:                                              ; preds = %B13, %B30
  %Ti.06 = phi double [ 0.000000e+00, %B13 ], [ %v37, %B30 ]
  %Tr.05 = phi double [ 0.000000e+00, %B13 ], [ %v36, %B30 ]
  %Zi.04 = phi double [ 0.000000e+00, %B13 ], [ %v33, %B30 ]
  %i.03 = phi i32 [ 0, %B13 ], [ %v39, %B30 ]
  %Zr.02 = phi double [ 0.000000e+00, %B13 ], [ %v35, %B30 ]
  %v31 = fmul double %Zr.02, 2.000000e+00
  %v32 = fmul double %v31, %Zi.04
  %v33 = fadd double %v21, %v32
  %v34 = fsub double %Tr.05, %Ti.06
  %v35 = fadd double %v17, %v34
  %v36 = fmul double %v35, %v35
  %v37 = fmul double %v33, %v33
  %v39 = add nuw nsw i32 %i.03, 1
  %v23 = icmp sgt i32 %i.03, 48
  %v25 = fadd double %v36, %v37
  %v27 = fcmp ugt double %v25, 4.000000e+00
  %or.cond = or i1 %v23, %v27
  br i1 %or.cond, label %B40, label %B30

B40:                                              ; preds = %B30
  %v27.lcssa = phi i1 [ %v27, %B30 ]
  %0 = shl i8 %byte_acc.19, 1
  %1 = zext i1 %v27.lcssa to i8
  %v42 = or i8 %1, %0
  %byte_acc.2 = xor i8 %v42, 1
  %v52 = add nsw i32 %bit_num.110, 1
  %v53 = icmp eq i32 %v52, 8
  br i1 %v53, label %B54, label %B57

B54:                                              ; preds = %B40
  %v55 = sext i8 %byte_acc.2 to i32
  %v56 = tail call i32 @_IO_putc(i32 %v55, %struct._IO_FILE* %v4) #2
  br label %B71

B57:                                              ; preds = %B40
  %v60 = fcmp oeq double %x.08, %v59
  br i1 %v60, label %B61, label %B71

B61:                                              ; preds = %B57
  %v64 = sext i8 %byte_acc.2 to i32
  %v65 = shl i32 %v64, %v63
  %sext = shl i32 %v65, 24
  %v67 = ashr exact i32 %sext, 24
  %v68 = tail call i32 @_IO_putc(i32 %v67, %struct._IO_FILE* %v4) #2
  br label %B71

B71:                                              ; preds = %B54, %B61, %B57
  %byte_acc.4 = phi i8 [ 0, %B54 ], [ 0, %B61 ], [ %byte_acc.2, %B57 ]
  %bit_num.3 = phi i32 [ 0, %B54 ], [ 0, %B61 ], [ %v52, %B57 ]
  %v72 = fadd double %x.08, 1.000000e+00
  %v12 = fcmp olt double %v72, %v7
  br i1 %v12, label %B13, label %B74

B74:                                              ; preds = %B71
  %bit_num.3.lcssa = phi i32 [ %bit_num.3, %B71 ]
  %byte_acc.4.lcssa = phi i8 [ %byte_acc.4, %B71 ]
  %v75 = fadd double %y.013, 1.000000e+00
  %v8 = fcmp olt double %v75, %v7
  br i1 %v8, label %B13.lr.ph, label %B76.loopexit

B76.loopexit:                                     ; preds = %B74
  br label %B76

B76:                                              ; preds = %B76.loopexit, %entry
  %v77 = tail call i32 @fclose(%struct._IO_FILE* %v4) #2
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
