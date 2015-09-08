; ModuleID = 'bench.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@t = common global [16 x i32] zeroinitializer, align 16
@s = common global [16 x i32] zeroinitializer, align 16
@max_n = common global i32 0, align 4
@odd = common global i32 0, align 4
@maxflips = common global i32 0, align 4
@checksum = common global i32 0, align 4
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [29 x i8] c"range: must be 3 <= n <= 12\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"%d\0APfannkuchen(%d) = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @flip() #0 {
  %1 = load i32* @max_n, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %.preheaderthread-pre-split, label %.lr.ph7.preheader

.lr.ph7.preheader:                                ; preds = %0
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %.lr.ph7
  %i.05 = phi i32 [ %3, %.lr.ph7 ], [ %1, %.lr.ph7.preheader ]
  %x.04 = phi i32* [ %6, %.lr.ph7 ], [ getelementptr inbounds ([16 x i32]* @t, i64 0, i64 0), %.lr.ph7.preheader ]
  %y.03 = phi i32* [ %4, %.lr.ph7 ], [ getelementptr inbounds ([16 x i32]* @s, i64 0, i64 0), %.lr.ph7.preheader ]
  %3 = add nsw i32 %i.05, -1
  %4 = getelementptr inbounds i32* %y.03, i64 1
  %5 = load i32* %y.03, align 4
  %6 = getelementptr inbounds i32* %x.04, i64 1
  store i32 %5, i32* %x.04, align 4
  %7 = icmp eq i32 %3, 0
  br i1 %7, label %.preheaderthread-pre-split.loopexit, label %.lr.ph7

.preheaderthread-pre-split.loopexit:              ; preds = %.lr.ph7
  br label %.preheaderthread-pre-split

.preheaderthread-pre-split:                       ; preds = %.preheaderthread-pre-split.loopexit, %0
  %.pr = load i32* getelementptr inbounds ([16 x i32]* @t, i64 0, i64 0), align 16
  br label %.preheader

.preheader:                                       ; preds = %.preheaderthread-pre-split, %._crit_edge
  %8 = phi i32 [ %.pr, %.preheaderthread-pre-split ], [ %19, %._crit_edge ]
  %i.1 = phi i32 [ 1, %.preheaderthread-pre-split ], [ %18, %._crit_edge ]
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %10 = sext i32 %8 to i64
  %11 = getelementptr inbounds [16 x i32]* @t, i64 0, i64 %10
  br label %12

; <label>:12                                      ; preds = %.lr.ph, %12
  %x.12 = phi i32* [ getelementptr inbounds ([16 x i32]* @t, i64 0, i64 0), %.lr.ph ], [ %15, %12 ]
  %y.11 = phi i32* [ %11, %.lr.ph ], [ %16, %12 ]
  %13 = load i32* %x.12, align 4
  %14 = load i32* %y.11, align 4
  %15 = getelementptr inbounds i32* %x.12, i64 1
  store i32 %14, i32* %x.12, align 4
  %16 = getelementptr inbounds i32* %y.11, i64 -1
  store i32 %13, i32* %y.11, align 4
  %17 = icmp ult i32* %15, %16
  br i1 %17, label %12, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %12
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %18 = add nuw nsw i32 %i.1, 1
  %19 = load i32* getelementptr inbounds ([16 x i32]* @t, i64 0, i64 0), align 16
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [16 x i32]* @t, i64 0, i64 %20
  %22 = load i32* %21, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %.preheader

; <label>:24                                      ; preds = %._crit_edge
  %.lcssa = phi i32 [ %18, %._crit_edge ]
  ret i32 %.lcssa
}

; Function Attrs: nounwind uwtable
define void @rotate(i32 %n) #0 {
  %1 = load i32* getelementptr inbounds ([16 x i32]* @s, i64 0, i64 0), align 16
  %2 = icmp slt i32 %n, 1
  br i1 %2, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 1, %.lr.ph.preheader ]
  %3 = getelementptr inbounds [16 x i32]* @s, i64 0, i64 %indvars.iv
  %4 = load i32* %3, align 4
  %5 = add nsw i64 %indvars.iv, -1
  %6 = getelementptr inbounds [16 x i32]* @s, i64 0, i64 %5
  store i32 %4, i32* %6, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %n
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  %7 = sext i32 %n to i64
  %8 = getelementptr inbounds [16 x i32]* @s, i64 0, i64 %7
  store i32 %1, i32* %8, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @tk(i32 %n) #0 {
  %c = alloca [16 x i32], align 16
  %1 = bitcast [16 x i32]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 64, i32 16, i1 false)
  %2 = icmp sgt i32 %n, 0
  br i1 %2, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.backedge
  %i.01 = phi i32 [ %i.0.be, %.backedge ], [ 0, %.lr.ph.preheader ]
  tail call void @rotate(i32 %i.01)
  %3 = sext i32 %i.01 to i64
  %4 = getelementptr inbounds [16 x i32]* %c, i64 0, i64 %3
  %5 = load i32* %4, align 4
  %6 = icmp slt i32 %5, %i.01
  br i1 %6, label %10, label %7

; <label>:7                                       ; preds = %.lr.ph
  %8 = add nsw i32 %i.01, 1
  store i32 0, i32* %4, align 4
  br label %.backedge

.backedge:                                        ; preds = %7, %28, %10
  %i.0.be = phi i32 [ %8, %7 ], [ 1, %28 ], [ 1, %10 ]
  %9 = icmp slt i32 %i.0.be, %n
  br i1 %9, label %.lr.ph, label %._crit_edge.loopexit

; <label>:10                                      ; preds = %.lr.ph
  %11 = add nsw i32 %5, 1
  store i32 %11, i32* %4, align 4
  %12 = load i32* @odd, align 4
  %13 = xor i32 %12, -1
  store i32 %13, i32* @odd, align 4
  %14 = load i32* getelementptr inbounds ([16 x i32]* @s, i64 0, i64 0), align 16
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %.backedge, label %16

; <label>:16                                      ; preds = %10
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds [16 x i32]* @s, i64 0, i64 %17
  %19 = load i32* %18, align 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %23, label %21

; <label>:21                                      ; preds = %16
  %22 = tail call i32 @flip()
  br label %23

; <label>:23                                      ; preds = %16, %21
  %24 = phi i32 [ %22, %21 ], [ 1, %16 ]
  %25 = load i32* @maxflips, align 4
  %26 = icmp sgt i32 %24, %25
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %23
  store i32 %24, i32* @maxflips, align 4
  br label %28

; <label>:28                                      ; preds = %27, %23
  %29 = load i32* @odd, align 4
  %30 = icmp ne i32 %29, 0
  %31 = sub nsw i32 0, %24
  %32 = select i1 %30, i32 %31, i32 %24
  %33 = load i32* @checksum, align 4
  %34 = add nsw i32 %32, %33
  store i32 %34, i32* @checksum, align 4
  br label %.backedge

._crit_edge.loopexit:                             ; preds = %.backedge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  store i32 %inputN, i32* @max_n, align 4
  %inputN.off = add i32 %inputN, -3
  %1 = icmp ugt i32 %inputN.off, 12
  br i1 %1, label %2, label %5

; <label>:2                                       ; preds = %0
  %3 = load %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([29 x i8]* @.str, i64 0, i64 0), i64 28, i64 1, %struct._IO_FILE* %3) #4
  tail call void @exit(i32 1) #5
  unreachable

; <label>:5                                       ; preds = %0
  store i32 0, i32* @maxflips, align 4
  store i32 0, i32* @odd, align 4
  store i32 0, i32* @checksum, align 4
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([16 x i32]* @t to i8*), i8 0, i64 64, i32 16, i1 false)
  %6 = load i32* @max_n, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %5
  %8 = load i32* @max_n, align 4
  %9 = sext i32 %8 to i64
  br label %10

; <label>:10                                      ; preds = %.lr.ph, %10
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %10 ]
  %11 = getelementptr inbounds [16 x i32]* @s, i64 0, i64 %indvars.iv
  %12 = trunc i64 %indvars.iv to i32
  store i32 %12, i32* %11, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = icmp slt i64 %indvars.iv.next, %9
  br i1 %13, label %10, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  %.lcssa = phi i32 [ %6, %5 ], [ %8, %._crit_edge.loopexit ]
  tail call void @tk(i32 %.lcssa)
  %14 = load i32* @checksum, align 4
  %15 = load i32* @max_n, align 4
  %16 = load i32* @maxflips, align 4
  %17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %14, i32 %15, i32 %16) #1
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { cold }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
