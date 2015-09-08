; ModuleID = 'codeQuality.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [22 x i8] c"\0A*** Error: %s [%d]!\0A\00", align 1
@.str1 = private unnamed_addr constant [46 x i8] c"shootout/reverse-complement/revcomp-input.txt\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"r+\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"revcomp-output.txt\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@bench.xtab = private unnamed_addr constant [256 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00TVGH\00\00CD\00\00M\00KN\00\00\00YSA\00BW\00R\00\00\00\00\00\00\00TVGH\00\00CD\00\00M\00KN\00\00\00YSA\00BW\00R\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str5 = private unnamed_addr constant [18 x i8] c"Buffer allocation\00", align 1
@.str6 = private unnamed_addr constant [14 x i8] c"No input data\00", align 1
@.str7 = private unnamed_addr constant [17 x i8] c"1st char not '>'\00", align 1
@.str8 = private unnamed_addr constant [14 x i8] c"Out of memory\00", align 1

; Function Attrs: nounwind uwtable
define i32 @errex(i8* %s, i32 %n) #0 {
  %1 = load %struct._IO_FILE** @stderr, align 8
  %2 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i8* %s, i32 %n) #3
  ret i32 1
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @bench() #0 {
entry:
  %v1 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([46 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0)) #2
  %v2 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([19 x i8]* @.str3, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i64 0, i64 0)) #2
  %v3 = tail call noalias i8* @malloc(i64 82) #2
  %v4 = tail call noalias i8* @malloc(i64 5200) #2
  %v5 = getelementptr inbounds i8* %v4, i64 5200
  %v7 = icmp ne i8* %v3, null
  %v9 = icmp ne i8* %v4, null
  %or.cond = and i1 %v7, %v9
  br i1 %or.cond, label %B19, label %B10

B10:                                              ; preds = %entry
  %0 = zext i1 %v7 to i32
  %v13 = xor i32 %0, 1
  %1 = zext i1 %v9 to i32
  %v16 = xor i32 %1, 1
  %v17 = add nuw nsw i32 %v16, %v13
  %v18 = tail call i32 @errex(i8* getelementptr inbounds ([18 x i8]* @.str5, i64 0, i64 0), i32 %v17)
  br label %B119

B19:                                              ; preds = %entry
  %v20 = tail call i8* @fgets(i8* %v3, i32 82, %struct._IO_FILE* %v1) #2
  %v21 = icmp eq i8* %v20, null
  br i1 %v21, label %B22, label %B24

B22:                                              ; preds = %B19
  %v23 = tail call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str6, i64 0, i64 0), i32 0)
  br label %B119

B24:                                              ; preds = %B19
  %v25 = load i8* %v3, align 1
  %v27 = icmp eq i8 %v25, 62
  br i1 %v27, label %B33.preheader, label %B28

B33.preheader:                                    ; preds = %B24
  br label %B33

B28:                                              ; preds = %B24
  %v29 = tail call i32 @errex(i8* getelementptr inbounds ([17 x i8]* @.str7, i64 0, i64 0), i32 0)
  br label %B119

B33:                                              ; preds = %B33.preheader, %B111
  %pqstop.027 = phi i8* [ %pqstop.1.lcssa39, %B111 ], [ %v5, %B33.preheader ]
  %qqq.026 = phi i8* [ %qqq.1.lcssa40, %B111 ], [ %v4, %B33.preheader ]
  %v34 = tail call i32 @fputs(i8* %v3, %struct._IO_FILE* %v2) #2
  %v376 = tail call i8* @fgets(i8* %v3, i32 82, %struct._IO_FILE* %v1) #2
  %v387 = icmp eq i8* %v376, null
  br i1 %v387, label %B111, label %B39.preheader

B39.preheader:                                    ; preds = %B33
  br label %B39

B36.loopexit:                                     ; preds = %B77
  %pr.3.ph.lcssa = phi i8* [ %pr.3.ph, %B77 ]
  %v37 = tail call i8* @fgets(i8* %v3, i32 82, %struct._IO_FILE* %v1) #2
  %v38 = icmp eq i8* %v37, null
  br i1 %v38, label %B94.preheader, label %B39

B94.preheader:                                    ; preds = %B36.loopexit, %B39
  %v37.lcssa = phi i8* [ %v3713, %B39 ], [ null, %B36.loopexit ]
  %pqstop.1.lcssa = phi i8* [ %pqstop.111, %B39 ], [ %pqstop.3, %B36.loopexit ]
  %pr.0.lcssa = phi i8* [ %pr.09, %B39 ], [ %pr.3.ph.lcssa, %B36.loopexit ]
  %qqq.1.lcssa = phi i8* [ %qqq.18, %B39 ], [ %qqq.3, %B36.loopexit ]
  %v9521 = icmp ult i8* %pr.0.lcssa, %pqstop.1.lcssa
  br i1 %v9521, label %B96.lr.ph, label %B111

B96.lr.ph:                                        ; preds = %B94.preheader
  %v97 = ptrtoint i8* %pqstop.1.lcssa to i64
  br label %B96

B39:                                              ; preds = %B39.preheader, %B36.loopexit
  %v3713 = phi i8* [ %v37, %B36.loopexit ], [ %v376, %B39.preheader ]
  %qqq.026.pn = phi i8* [ %pq.2, %B36.loopexit ], [ %qqq.026, %B39.preheader ]
  %pqstop.111 = phi i8* [ %pqstop.3, %B36.loopexit ], [ %pqstop.027, %B39.preheader ]
  %pr.09 = phi i8* [ %pr.3.ph.lcssa, %B36.loopexit ], [ %pqstop.027, %B39.preheader ]
  %qqq.18 = phi i8* [ %qqq.3, %B36.loopexit ], [ %qqq.026, %B39.preheader ]
  %pq.012 = getelementptr inbounds i8* %qqq.026.pn, i64 1
  %v40 = load i8* %v3, align 1
  %v42 = icmp eq i8 %v40, 62
  br i1 %v42, label %B94.preheader, label %B44

B44:                                              ; preds = %B39
  %v45 = getelementptr inbounds i8* %qqq.026.pn, i64 62
  %v46 = icmp ugt i8* %pr.09, %v45
  br i1 %v46, label %B76, label %B47

B47:                                              ; preds = %B44
  %v48 = getelementptr inbounds i8* %pqstop.111, i64 12777888
  %v49 = ptrtoint i8* %v48 to i64
  %v50 = ptrtoint i8* %qqq.18 to i64
  %v51 = sub i64 %v49, %v50
  %v52 = tail call i8* @realloc(i8* %qqq.18, i64 %v51) #2
  %v53 = icmp eq i8* %v52, null
  br i1 %v53, label %B54, label %B56

B54:                                              ; preds = %B47
  %v55 = tail call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str8, i64 0, i64 0), i32 0)
  br label %B119

B56:                                              ; preds = %B47
  %v57 = icmp eq i8* %v52, %qqq.18
  br i1 %v57, label %B67, label %B58

B58:                                              ; preds = %B56
  %v59 = ptrtoint i8* %v52 to i64
  %v61 = sub i64 %v59, %v50
  %pq.0.sum = add i64 %v61, 1
  %v62 = getelementptr inbounds i8* %qqq.026.pn, i64 %pq.0.sum
  %v63 = getelementptr inbounds i8* %pr.09, i64 %v61
  %v48.sum = add i64 %v61, 12777888
  %v65 = getelementptr inbounds i8* %pqstop.111, i64 %v48.sum
  %v66 = getelementptr inbounds i8* %pqstop.111, i64 %v61
  br label %B67

B67:                                              ; preds = %B56, %B58
  %qqq.2 = phi i8* [ %v52, %B58 ], [ %qqq.18, %B56 ]
  %pr.1 = phi i8* [ %v63, %B58 ], [ %pr.09, %B56 ]
  %pq.1 = phi i8* [ %v62, %B58 ], [ %pq.012, %B56 ]
  %pqstop.2 = phi i8* [ %v66, %B58 ], [ %pqstop.111, %B56 ]
  %2 = phi i64 [ %v48.sum, %B58 ], [ 12777888, %B56 ]
  %newstop.0 = phi i8* [ %v65, %B58 ], [ %v48, %B56 ]
  %v68 = ptrtoint i8* %pqstop.2 to i64
  %v69 = ptrtoint i8* %pr.1 to i64
  %v70 = sub i64 %v68, %v69
  %.sum = sub i64 %2, %v70
  %v72 = getelementptr inbounds i8* %pqstop.111, i64 %.sum
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %v72, i8* %pr.1, i64 %v70, i32 1, i1 false)
  br label %B76

B76:                                              ; preds = %B44, %B67
  %qqq.3 = phi i8* [ %qqq.2, %B67 ], [ %qqq.18, %B44 ]
  %pr.2 = phi i8* [ %v72, %B67 ], [ %pr.09, %B44 ]
  %pq.2 = phi i8* [ %pq.1, %B67 ], [ %pq.012, %B44 ]
  %pqstop.3 = phi i8* [ %newstop.0, %B67 ], [ %pqstop.111, %B44 ]
  br label %B77.outer

B77.outer:                                        ; preds = %B87, %B76
  %pr.3.ph = phi i8* [ %v88, %B87 ], [ %pr.2, %B76 ]
  %pj.1.ph = phi i8* [ %v81.lcssa, %B87 ], [ %v3713, %B76 ]
  br label %B77

B77:                                              ; preds = %B77.outer, %B80
  %pj.1 = phi i8* [ %v81, %B80 ], [ %pj.1.ph, %B77.outer ]
  %v78 = load i8* %pj.1, align 1
  %v79 = icmp eq i8 %v78, 0
  br i1 %v79, label %B36.loopexit, label %B80

B80:                                              ; preds = %B77
  %v81 = getelementptr inbounds i8* %pj.1, i64 1
  %v83 = zext i8 %v78 to i64
  %v84 = getelementptr inbounds [256 x i8]* @bench.xtab, i64 0, i64 %v83
  %v85 = load i8* %v84, align 1
  %v86 = icmp eq i8 %v85, 0
  br i1 %v86, label %B77, label %B87

B87:                                              ; preds = %B80
  %v85.lcssa = phi i8 [ %v85, %B80 ]
  %v81.lcssa = phi i8* [ %v81, %B80 ]
  %v88 = getelementptr inbounds i8* %pr.3.ph, i64 -1
  store i8 %v85.lcssa, i8* %v88, align 1
  br label %B77.outer

B96:                                              ; preds = %B96.lr.ph, %B96
  %pq.323 = phi i8* [ %qqq.1.lcssa, %B96.lr.ph ], [ %v110, %B96 ]
  %pr.522 = phi i8* [ %pr.0.lcssa, %B96.lr.ph ], [ %v108, %B96 ]
  %v98 = ptrtoint i8* %pr.522 to i64
  %v99 = sub i64 %v97, %v98
  %v100 = icmp slt i64 %v99, 60
  %v99. = select i1 %v100, i64 %v99, i64 60
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %pq.323, i8* %pr.522, i64 %v99., i32 1, i1 false)
  %v108 = getelementptr inbounds i8* %pr.522, i64 %v99.
  %v109 = getelementptr inbounds i8* %pq.323, i64 %v99.
  %v109.sum = add i64 %v99., 1
  %v110 = getelementptr inbounds i8* %pq.323, i64 %v109.sum
  store i8 10, i8* %v109, align 1
  %v95 = icmp ult i8* %v108, %pqstop.1.lcssa
  br i1 %v95, label %B96, label %B111.loopexit

B111.loopexit:                                    ; preds = %B96
  %v110.lcssa = phi i8* [ %v110, %B96 ]
  br label %B111

B111:                                             ; preds = %B111.loopexit, %B33, %B94.preheader
  %qqq.1.lcssa40 = phi i8* [ %qqq.1.lcssa, %B94.preheader ], [ %qqq.026, %B33 ], [ %qqq.1.lcssa, %B111.loopexit ]
  %pqstop.1.lcssa39 = phi i8* [ %pqstop.1.lcssa, %B94.preheader ], [ %pqstop.027, %B33 ], [ %pqstop.1.lcssa, %B111.loopexit ]
  %v37.lcssa38 = phi i8* [ %v37.lcssa, %B94.preheader ], [ null, %B33 ], [ %v37.lcssa, %B111.loopexit ]
  %pq.3.lcssa = phi i8* [ %qqq.1.lcssa, %B94.preheader ], [ %qqq.026, %B33 ], [ %v110.lcssa, %B111.loopexit ]
  %v112 = ptrtoint i8* %pq.3.lcssa to i64
  %v113 = ptrtoint i8* %qqq.1.lcssa40 to i64
  %v114 = sub i64 %v112, %v113
  %v115 = tail call i64 @fwrite(i8* %qqq.1.lcssa40, i64 1, i64 %v114, %struct._IO_FILE* %v2) #2
  %v32 = icmp eq i8* %v37.lcssa38, null
  br i1 %v32, label %B116, label %B33

B116:                                             ; preds = %B111
  %v117 = tail call i32 @fclose(%struct._IO_FILE* %v1) #2
  %v118 = tail call i32 @fclose(%struct._IO_FILE* %v2) #2
  br label %B119

B119:                                             ; preds = %B116, %B54, %B28, %B22, %B10
  %.0 = phi i32 [ 1, %B28 ], [ 1, %B54 ], [ 0, %B116 ], [ 1, %B22 ], [ 1, %B10 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i8* @fgets(i8*, i32, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare i32 @fputs(i8* nocapture readonly, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @realloc(i8* nocapture, i64) #1

; Function Attrs: nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
