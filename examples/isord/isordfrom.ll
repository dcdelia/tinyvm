; ModuleID = 'isord.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @isordfrom(i64* %v, i64 %n, i32 (i8*, i8*)* nocapture %c) #0 {
  %1 = icmp sgt i64 %n, 1
  br i1 %1, label %.lr.ph, label %._crit_edge

; <label>:2                                       ; preds = %splitBlockForOSRToisordto
  %scevgep = getelementptr i64* %lsr.iv, i64 1
  %3 = icmp slt i64 %8, %n
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0, %2
  %lsr.iv = phi i64* [ %scevgep, %2 ], [ %v, %0 ]
  %i.01 = phi i64 [ %8, %2 ], [ 1, %0 ]
  %4 = fcmp false double 0.000000e+00, 0.000000e+00
  br i1 %4, label %OSRBlockToisordto, label %splitBlockForOSRToisordto

splitBlockForOSRToisordto:                        ; preds = %.lr.ph
  %5 = bitcast i64* %lsr.iv to i8*
  %scevgep1 = getelementptr i8* %5, i64 8
  %6 = tail call i32 %c(i8* %5, i8* %scevgep1) #1
  %7 = icmp sgt i32 %6, 0
  %8 = add nuw nsw i64 %i.01, 1
  br i1 %7, label %._crit_edge, label %2

._crit_edge:                                      ; preds = %splitBlockForOSRToisordto, %2, %0
  %.0 = phi i32 [ 1, %0 ], [ 0, %splitBlockForOSRToisordto ], [ 1, %2 ]
  ret i32 %.0

OSRBlockToisordto:                                ; preds = %.lr.ph
  %OSRCallToisordto = call i32 @isord2to(i64* %lsr.iv, i64 %n, i64 %i.01, i32 (i8*, i8*)* %c)
  ret i32 %OSRCallToisordto
}

declare i32 @isord2to(i64*, i64, i64, i32 (i8*, i8*)*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
