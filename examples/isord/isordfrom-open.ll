; ModuleID = 'isord.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @isordfromopen(i64* %v, i64 %n, i32 (i8*, i8*)* nocapture %c) #0 {
entry:
  %t0 = icmp sgt i64 %n, 1
  br i1 %t0, label %loop.body, label %exit

loop.header:                                      ; preds = %splitBlockForOSRToisordfromopen_stub
  %t1 = icmp slt i64 %i1, %n
  br i1 %t1, label %loop.body, label %exit

loop.body:                                        ; preds = %loop.header, %entry
  %i = phi i64 [ %i1, %loop.header ], [ 1, %entry ]
  %0 = fcmp true double 0.000000e+00, 0.000000e+00
  br i1 %0, label %OSRBlockToisordfromopen_stub, label %splitBlockForOSRToisordfromopen_stub

splitBlockForOSRToisordfromopen_stub:             ; preds = %loop.body
  %t2 = getelementptr inbounds i64* %v, i64 %i
  %t3 = add nsw i64 %i, -1
  %t4 = getelementptr inbounds i64* %v, i64 %t3
  %t5 = bitcast i64* %t4 to i8*
  %t6 = bitcast i64* %t2 to i8*
  %t7 = tail call i32 %c(i8* %t5, i8* %t6) #1
  %t8 = icmp sgt i32 %t7, 0
  %i1 = add nuw nsw i64 %i, 1
  br i1 %t8, label %exit, label %loop.header

exit:                                             ; preds = %splitBlockForOSRToisordfromopen_stub, %loop.header, %entry
  %res = phi i32 [ 1, %entry ], [ 0, %splitBlockForOSRToisordfromopen_stub ], [ 1, %loop.header ]
  ret i32 %res

OSRBlockToisordfromopen_stub:                     ; preds = %loop.body
  %val = bitcast i32 (i8*, i8*)* %c to i8*
  %OSRCallToisordfromopen_stub = call i32 @isordstub(
	; i8* null,
	i8* %val, 
	i64* %v, i64 %n, i32 (i8*, i8*)* %c, i64 %i)
  ret i32 %OSRCallToisordfromopen_stub
}

define i32 @isordstub(
   i8* %userptr, i64* %v_osr, i64 %n_osr, 
   i32 (i8*, i8*)* nocapture %c_osr, i64 %i_osr) #2 {
entry:
  %cont.func = call ; contin. fun generator call

  ; generator returns ptr to continuation fun
  i32 (i64*, i64, i32 (i8*, i8*)*, i64 )* 
  		    (i8*, i8*, i8*, i8*)* inttoptr 
  		 
  ; continuation fun generator address is 4357824
  (i64 4357824 to 
           i32 (i64*, i64, i32 (i8*, i8*)*, i64)* 
  		                (i8*, i8*, i8*, i8*)*)

  ; built-in parameters passed to generator:
  ;   1) 46993664 = ptr to isord IR function
  ;   2) 46995056 = ptr to basic block at loop.body
  ;   3) 47005408 = ptr to LLVM context
  (i8* inttoptr (i64 46993664 to i8*),
   i8* inttoptr (i64 46995056 to i8*), 
  	i8* inttoptr (i64 47005408 to i8*),i8* %userptr) 

  %osr.res = call i32 %cont.func(i64* %v_osr, 
    i64 %n_osr, i32 (i8*, i8*)* %c_osr, i64 %i_osr)
  ret i32 %osr.res
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
