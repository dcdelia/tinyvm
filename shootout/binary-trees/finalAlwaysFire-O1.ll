; ModuleID = 'finalAlwaysFire.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tn = type { %struct.tn*, %struct.tn*, i64 }

@.str = private unnamed_addr constant [38 x i8] c"stretch tree of depth %u\09 check: %li\0A\00", align 1
@.str1 = private unnamed_addr constant [36 x i8] c"%li\09 trees of depth %u\09 check: %li\0A\00", align 1
@.str2 = private unnamed_addr constant [41 x i8] c"long lived tree of depth %u\09 check: %li\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.tn* @NewTreeNode(%struct.tn* %left, %struct.tn* %right, i64 %item) #0 {
  %1 = tail call noalias i8* @malloc(i64 24) #3
  %2 = bitcast i8* %1 to %struct.tn*
  %3 = bitcast i8* %1 to %struct.tn**
  store %struct.tn* %left, %struct.tn** %3, align 8
  %4 = getelementptr inbounds i8* %1, i64 8
  %5 = bitcast i8* %4 to %struct.tn**
  store %struct.tn* %right, %struct.tn** %5, align 8
  %6 = getelementptr inbounds i8* %1, i64 16
  %7 = bitcast i8* %6 to i64*
  store i64 %item, i64* %7, align 8
  ret %struct.tn* %2
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readonly uwtable
define i64 @ItemCheck(%struct.tn* nocapture readonly %tree) #2 {
  %1 = getelementptr inbounds %struct.tn* %tree, i64 0, i32 0
  %2 = load %struct.tn** %1, align 8
  %3 = icmp eq %struct.tn* %2, null
  %4 = getelementptr inbounds %struct.tn* %tree, i64 0, i32 2
  %5 = load i64* %4, align 8
  br i1 %3, label %13, label %6

; <label>:6                                       ; preds = %0
  %7 = tail call i64 @ItemCheck(%struct.tn* %2)
  %8 = add nsw i64 %7, %5
  %9 = getelementptr inbounds %struct.tn* %tree, i64 0, i32 1
  %10 = load %struct.tn** %9, align 8
  %11 = tail call i64 @ItemCheck(%struct.tn* %10)
  %12 = sub i64 %8, %11
  ret i64 %12

; <label>:13                                      ; preds = %0
  ret i64 %5
}

; Function Attrs: nounwind uwtable
define noalias %struct.tn* @BottomUpTree(i64 %item, i32 %depth) #0 {
  %1 = icmp eq i32 %depth, 0
  br i1 %1, label %9, label %2

; <label>:2                                       ; preds = %0
  %3 = shl nsw i64 %item, 1
  %4 = add nsw i64 %3, -1
  %5 = add i32 %depth, -1
  %6 = tail call %struct.tn* @BottomUpTree(i64 %4, i32 %5)
  %7 = tail call %struct.tn* @BottomUpTree(i64 %3, i32 %5)
  %8 = tail call %struct.tn* @NewTreeNode(%struct.tn* %6, %struct.tn* %7, i64 %item)
  ret %struct.tn* %8

; <label>:9                                       ; preds = %0
  %10 = tail call %struct.tn* @NewTreeNode(%struct.tn* null, %struct.tn* null, i64 %item)
  ret %struct.tn* %10
}

; Function Attrs: nounwind uwtable
define void @DeleteTree(%struct.tn* nocapture %tree) #0 {
entry:
  %v1 = getelementptr inbounds %struct.tn* %tree, i64 0, i32 0
  %v2 = load %struct.tn** %v1, align 8
  %v3 = icmp eq %struct.tn* %v2, null
  br label %INSTR0

INSTR0:
  br i1 %v3, label %B7, label %B4

B4:                                       ; preds = %entry
  tail call void @DeleteTree(%struct.tn* %v2)
  %v5 = getelementptr inbounds %struct.tn* %tree, i64 0, i32 1
  %v6 = load %struct.tn** %v5, align 8
  tail call void @DeleteTree(%struct.tn* %v6)
  br label %B7

B7:                                       ; preds = %B0, %B4
  %v8 = bitcast %struct.tn* %tree to i8*
  tail call void @free(i8* %v8) #3
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = icmp ult i32 %inputN, 6
  %maxDepth.0 = select i1 %1, i32 6, i32 %inputN
  %2 = add i32 %maxDepth.0, 1
  %3 = tail call %struct.tn* @BottomUpTree(i64 0, i32 %2)
  %4 = tail call i64 @ItemCheck(%struct.tn* %3)
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str, i64 0, i64 0), i32 %2, i64 %4) #3
  tail call void @DeleteTree(%struct.tn* %3)
  %6 = tail call %struct.tn* @BottomUpTree(i64 0, i32 %maxDepth.0)
  %7 = icmp ult i32 %maxDepth.0, 4
  br i1 %7, label %._crit_edge6, label %.lr.ph5

.lr.ph5:                                          ; preds = %0
  %8 = add i32 %maxDepth.0, 4
  br label %9

; <label>:9                                       ; preds = %.lr.ph5, %._crit_edge
  %depth.03 = phi i32 [ 4, %.lr.ph5 ], [ %24, %._crit_edge ]
  %10 = sub i32 %8, %depth.03
  %11 = uitofp i32 %10 to double
  %exp2 = tail call double @exp2(double %11) #1
  %12 = fptosi double %exp2 to i64
  %13 = icmp slt i64 %12, 1
  br i1 %13, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %9
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %check.02 = phi i64 [ %20, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %i.01 = phi i64 [ %21, %.lr.ph ], [ 1, %.lr.ph.preheader ]
  %14 = tail call %struct.tn* @BottomUpTree(i64 %i.01, i32 %depth.03)
  %15 = tail call i64 @ItemCheck(%struct.tn* %14)
  %16 = add nsw i64 %15, %check.02
  tail call void @DeleteTree(%struct.tn* %14)
  %17 = sub nsw i64 0, %i.01
  %18 = tail call %struct.tn* @BottomUpTree(i64 %17, i32 %depth.03)
  %19 = tail call i64 @ItemCheck(%struct.tn* %18)
  %20 = add nsw i64 %16, %19
  tail call void @DeleteTree(%struct.tn* %18)
  %21 = add nuw nsw i64 %i.01, 1
  %exitcond = icmp eq i64 %i.01, %12
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %.lcssa = phi i64 [ %20, %.lr.ph ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %9
  %check.0.lcssa = phi i64 [ 0, %9 ], [ %.lcssa, %._crit_edge.loopexit ]
  %22 = shl nsw i64 %12, 1
  %23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str1, i64 0, i64 0), i64 %22, i32 %depth.03, i64 %check.0.lcssa) #3
  %24 = add i32 %depth.03, 2
  %25 = icmp ult i32 %maxDepth.0, %24
  br i1 %25, label %._crit_edge6.loopexit, label %9

._crit_edge6.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %0
  %26 = tail call i64 @ItemCheck(%struct.tn* %6)
  %27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str2, i64 0, i64 0), i32 %maxDepth.0, i64 %26) #3
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

declare double @exp2(double)

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
