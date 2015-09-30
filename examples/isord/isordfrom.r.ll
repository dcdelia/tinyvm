; ModuleID = 'isord.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @isordfrom(i64* %v, i64 %n, 
         i32 (i8*, i8*)* nocapture %c) #0 {
entry:
  %t0 = icmp sgt i64 %n, 1
  br i1 %t0, label %loop.body, label %exit

loop.header: ; preds = %loop.body.cont
  %t1 = icmp slt i64 %i1, %n
  br i1 %t1, label %loop.body, label %exit

loop.body: ; preds = %loop.header, %entry
  %i = phi i64 [ %i1, %loop.header ], 
               [ 1, %entry ]
  %osr.cond = fcmp true double 0.000000e+00, 0.000000e+00
  br i1 %osr.cond, label %osr, 
                   label %loop.body.cont

loop.body.cont: ; preds = %loop.body
  %t2 = getelementptr inbounds i64* %v, i64 %i
  %t3 = add nsw i64 %i, -1
  %t4 = getelementptr inbounds i64* %v, i64 %t3
  %t5 = bitcast i64* %t4 to i8*
  %t6 = bitcast i64* %t2 to i8*
  %t7 = tail call i32 %c(i8* %t5, i8* %t6) #1
  %t8 = icmp sgt i32 %t7, 0
  %i1 = add nuw nsw i64 %i, 1
  br i1 %t8, label %exit, label %loop.header

exit: ; preds = %loop.body.cont, 
      ; %loop.header, %entry
  %res = phi i32 [ 1, %entry ], 
                 [ 0, %loop.body.cont ], 
                 [ 1, %loop.header ]
  ret i32 %res

osr: ; preds = %loop.body
  %osr.res = call i32 @isord2to(i64* %v, i64 %n, 
                 i64 %i, i32 (i8*, i8*)* %c)
  ret i32 %osr.res
}

declare i32 @isord2to(i64*, i64, i64, i32 (i8*, i8*)*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}

