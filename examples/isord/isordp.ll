; ModuleID = 'isordp.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @isord(i64* %v, i64 %n, i32 (i8*, i8*)* nocapture %c) #0 {
  %1 = icmp sgt i64 %n, 1
  br i1 %1, label %.lr.ph, label %._crit_edge

; <label>:2                                       ; preds = %7
  %3 = icmp slt i64 %14, %n
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0, %2
  %i.02 = phi i64 [ %14, %2 ], [ 1, %0 ]
  %p.01 = phi i64 [ %4, %2 ], [ 10000, %0 ]
  %4 = add nsw i64 %p.01, -1
  %5 = icmp eq i64 %p.01, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %.lr.ph
  tail call void (...)* @osr() #2
  br label %7

; <label>:7                                       ; preds = %.lr.ph, %6
  %8 = getelementptr inbounds i64* %v, i64 %i.02
  %.sum = add nsw i64 %i.02, -1
  %9 = getelementptr inbounds i64* %v, i64 %.sum
  %10 = bitcast i64* %9 to i8*
  %11 = bitcast i64* %8 to i8*
  %12 = tail call i32 %c(i8* %10, i8* %11) #2
  %13 = icmp sgt i32 %12, 0
  %14 = add nuw nsw i64 %i.02, 1
  br i1 %13, label %._crit_edge, label %2

._crit_edge:                                      ; preds = %7, %2, %0
  %.0 = phi i32 [ 1, %0 ], [ 0, %7 ], [ 1, %2 ]
  ret i32 %.0
}

declare void @osr(...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
