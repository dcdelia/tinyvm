; ModuleID = 'bench.ll'
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
  %1 = getelementptr inbounds [64 x i8]* %filename, i64 0, i64 0
  %2 = call i32 (i8*, i8*, ...)* @sprintf(i8* %1, i8* getelementptr inbounds ([18 x i8]* @.str, i64 0, i64 0), i32 %inputN) #2
  %3 = call %struct._IO_FILE* @fopen(i8* %1, i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0)) #2
  %4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), i32 %inputN, i32 %inputN) #2
  %5 = sitofp i32 %inputN to double
  %6 = icmp sgt i32 %inputN, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %0
  %7 = add nsw i32 %inputN, -1
  %8 = sitofp i32 %7 to double
  %9 = srem i32 %inputN, 8
  %10 = sub nsw i32 8, %9
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.lr.ph
  %bit_num.013 = phi i32 [ 0, %.preheader.lr.ph ], [ %bit_num.3.lcssa, %._crit_edge ]
  %byte_acc.012 = phi i8 [ 0, %.preheader.lr.ph ], [ %byte_acc.4.lcssa, %._crit_edge ]
  %y.011 = phi double [ 0.000000e+00, %.preheader.lr.ph ], [ %48, %._crit_edge ]
  %11 = fmul double %y.011, 2.000000e+00
  %12 = fdiv double %11, %5
  %13 = fadd double %12, -1.000000e+00
  br label %14

; <label>:14                                      ; preds = %.lr.ph, %45
  %bit_num.19 = phi i32 [ %bit_num.013, %.lr.ph ], [ %bit_num.3, %45 ]
  %byte_acc.18 = phi i8 [ %byte_acc.012, %.lr.ph ], [ %byte_acc.4, %45 ]
  %x.07 = phi double [ 0.000000e+00, %.lr.ph ], [ %46, %45 ]
  %15 = fmul double %x.07, 2.000000e+00
  %16 = fdiv double %15, %5
  %17 = fadd double %16, -1.500000e+00
  br label %18

; <label>:18                                      ; preds = %14, %18
  %Ti.06 = phi double [ 0.000000e+00, %14 ], [ %25, %18 ]
  %Tr.05 = phi double [ 0.000000e+00, %14 ], [ %24, %18 ]
  %Zi.04 = phi double [ 0.000000e+00, %14 ], [ %21, %18 ]
  %i.03 = phi i32 [ 0, %14 ], [ %26, %18 ]
  %Zr.02 = phi double [ 0.000000e+00, %14 ], [ %23, %18 ]
  %19 = fmul double %Zr.02, 2.000000e+00
  %20 = fmul double %19, %Zi.04
  %21 = fadd double %13, %20
  %22 = fsub double %Tr.05, %Ti.06
  %23 = fadd double %17, %22
  %24 = fmul double %23, %23
  %25 = fmul double %21, %21
  %26 = add nuw nsw i32 %i.03, 1
  %27 = icmp sgt i32 %i.03, 48
  %28 = fadd double %24, %25
  %29 = fcmp ugt double %28, 4.000000e+00
  %or.cond = or i1 %27, %29
  br i1 %or.cond, label %.critedge, label %18

.critedge:                                        ; preds = %18
  %.lcssa = phi i1 [ %29, %18 ]
  %30 = shl i8 %byte_acc.18, 1
  %31 = zext i1 %.lcssa to i8
  %32 = or i8 %31, %30
  %byte_acc.2 = xor i8 %32, 1
  %33 = add nsw i32 %bit_num.19, 1
  %34 = icmp eq i32 %33, 8
  br i1 %34, label %35, label %38

; <label>:35                                      ; preds = %.critedge
  %36 = sext i8 %byte_acc.2 to i32
  %37 = tail call i32 @_IO_putc(i32 %36, %struct._IO_FILE* %3) #2
  br label %45

; <label>:38                                      ; preds = %.critedge
  %39 = fcmp oeq double %x.07, %8
  br i1 %39, label %40, label %45

; <label>:40                                      ; preds = %38
  %41 = sext i8 %byte_acc.2 to i32
  %42 = shl i32 %41, %10
  %sext = shl i32 %42, 24
  %43 = ashr exact i32 %sext, 24
  %44 = tail call i32 @_IO_putc(i32 %43, %struct._IO_FILE* %3) #2
  br label %45

; <label>:45                                      ; preds = %35, %40, %38
  %byte_acc.4 = phi i8 [ 0, %35 ], [ 0, %40 ], [ %byte_acc.2, %38 ]
  %bit_num.3 = phi i32 [ 0, %35 ], [ 0, %40 ], [ %33, %38 ]
  %46 = fadd double %x.07, 1.000000e+00
  %47 = fcmp olt double %46, %5
  br i1 %47, label %14, label %._crit_edge

._crit_edge:                                      ; preds = %45
  %bit_num.3.lcssa = phi i32 [ %bit_num.3, %45 ]
  %byte_acc.4.lcssa = phi i8 [ %byte_acc.4, %45 ]
  %48 = fadd double %y.011, 1.000000e+00
  %49 = fcmp olt double %48, %5
  br i1 %49, label %.lr.ph, label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %0
  %50 = tail call i32 @fclose(%struct._IO_FILE* %3) #2
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
