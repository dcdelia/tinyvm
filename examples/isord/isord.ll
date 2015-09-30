; ModuleID = 'isord.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @isord(i64* %v, i64 %n, i32 (i8*, i8*)* nocapture %c) #0 {
  %1 = icmp sgt i64 %n, 1
  br i1 %1, label %.lr.ph, label %._crit_edge

; <label>:2                                       ; preds = %.lr.ph
  %3 = icmp slt i64 %10, %n
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0, %2
  %i.01 = phi i64 [ %10, %2 ], [ 1, %0 ]
  %4 = getelementptr inbounds i64* %v, i64 %i.01
  %.sum = add nsw i64 %i.01, -1
  %5 = getelementptr inbounds i64* %v, i64 %.sum
  %6 = bitcast i64* %5 to i8*
  %7 = bitcast i64* %4 to i8*
  %8 = tail call i32 %c(i8* %6, i8* %7) #1
  %9 = icmp sgt i32 %8, 0
  %10 = add nuw nsw i64 %i.01, 1
  br i1 %9, label %._crit_edge, label %2

._crit_edge:                                      ; preds = %.lr.ph, %2, %0
  %.0 = phi i32 [ 1, %0 ], [ 0, %.lr.ph ], [ 1, %2 ]
  ret i32 %.0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
