; ModuleID = 'inline.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define i32 @longCmp(i8* %a, i8* %b) #0 {
  %1 = ptrtoint i8* %a to i64
  %2 = ptrtoint i8* %b to i64
  %3 = sub nsw i64 %1, %2
  %4 = trunc i64 %3 to i32
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @isord(i64* %v, i64 %n, i32 (i8*, i8*)* nocapture %c) #1 {
  %1 = add nsw i64 %n, -1
  %2 = icmp sgt i64 %n, 1
  br i1 %2, label %.lr.ph, label %._crit_edge

; <label>:3                                       ; preds = %.lr.ph
  %4 = icmp slt i64 %11, %1
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0, %3
  %i.01 = phi i64 [ %11, %3 ], [ 0, %0 ]
  %5 = getelementptr inbounds i64* %v, i64 %i.01
  %6 = bitcast i64* %5 to i8*
  %.sum = add nuw nsw i64 %i.01, 1
  %7 = getelementptr inbounds i64* %v, i64 %.sum
  %8 = bitcast i64* %7 to i8*
  %9 = tail call i32 %c(i8* %6, i8* %8) #3
  %10 = icmp sgt i32 %9, 0
  %11 = add nuw nsw i64 %i.01, 1
  br i1 %10, label %._crit_edge, label %3

._crit_edge:                                      ; preds = %.lr.ph, %3, %0
  %.0 = phi i32 [ 1, %0 ], [ 0, %.lr.ph ], [ 1, %3 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @driver(i32 %n) #1 {
  %1 = sext i32 %n to i64
  %2 = shl nsw i64 %1, 3
  %3 = tail call noalias i8* @malloc(i64 %2) #3
  %4 = bitcast i8* %3 to i64*
  %5 = icmp sgt i32 %n, 0
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %6 = add i32 %n, -1
  br label %7

; <label>:7                                       ; preds = %7, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %7 ]
  %8 = getelementptr inbounds i64* %4, i64 %indvars.iv
  store i64 %indvars.iv, i64* %8, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %6
  br i1 %exitcond, label %._crit_edge, label %7

._crit_edge:                                      ; preds = %7, %0
  %9 = tail call i32 @isord(i64* %4, i64 %1, i32 (i8*, i8*)* @longCmp)
  tail call void @free(i8* %3) #3
  ret i32 %9
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}