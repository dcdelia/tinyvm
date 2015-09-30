; ModuleID = 'isord2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i32 @isord2(i64* nocapture readonly %v, i64 %n) #0 {

entry:
  %t1 = icmp sgt i64 %n, 1
  br i1 %t1, label %loop.body, label %exit

loop.header: ; preds = %loop.body
  %t2 = icmp slt i64 %i1, %n
  br i1 %t2, label %loop.body, label %exit

loop.body: ; preds = %entry, %loop.header
  %i = phi i64 [ %i1, %loop.header ], 
               [ 1, %entry ]
  %t3 = add nsw i64 %i, -1
  %t4 = getelementptr inbounds i64* %v, i64 %t3
  %t5 = load i64* %t4, align 8, !tbaa !1
  %t6 = getelementptr inbounds i64* %v, i64 %i
  %t7 = load i64* %t6, align 8, !tbaa !1
  %t8 = icmp sgt i64 %t5, %t7
  %i1 = add nuw nsw i64 %i, 1
  br i1 %t8, label %exit, 
             label %loop.header

exit: ; preds = %loop.body,
      ;         %loop.header, %entry
  %res = phi i32 [ 1, %entry ], 
                 [ 0, %loop.body ], 
                 [ 1, %loop.header ]
  ret i32 %res
}

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}

