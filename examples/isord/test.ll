; ModuleID = 'test.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i32 @cmp(i8* nocapture readonly %a, i8* nocapture readonly %b) #0 {
  %1 = bitcast i8* %a to i64*
  %2 = load i64* %1, align 8, !tbaa !1
  %3 = bitcast i8* %b to i64*
  %4 = load i64* %3, align 8, !tbaa !1
  %5 = sub nsw i64 %2, %4
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @test(i32 %n, i32 %ver) #1 {
  %1 = sext i32 %n to i64
  %2 = shl nsw i64 %1, 3
  %3 = tail call noalias i8* @malloc(i64 %2) #4
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
  %9 = icmp eq i32 %ver, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %._crit_edge
  %11 = tail call i32 @isord(i64* %4, i64 %1, i32 (i8*, i8*)* @cmp) #4
  br label %14

; <label>:12                                      ; preds = %._crit_edge
  %13 = tail call i32 @isordfrom(i64* %4, i64 %1, i32 (i8*, i8*)* @cmp) #4
  br label %14

; <label>:14                                      ; preds = %12, %10
  %res.0 = phi i32 [ %11, %10 ], [ %13, %12 ]
  tail call void @free(i8* %3) #4
  ret i32 %res.0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare i32 @isord(i64*, i64, i32 (i8*, i8*)*) #3

declare i32 @isordfrom(i64*, i64, i32 (i8*, i8*)*) #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
