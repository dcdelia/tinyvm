; ModuleID = 'finalAlwaysFire.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [22 x i8] c"\0A*** Error: %s [%d]!\0A\00", align 1
@.str1 = private unnamed_addr constant [14 x i8] c"Out of memory\00", align 1
@.str2 = private unnamed_addr constant [46 x i8] c"shootout/reverse-complement/revcomp-input.txt\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"r+\00", align 1
@.str4 = private unnamed_addr constant [19 x i8] c"revcomp-output.txt\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@bench.xtab = private unnamed_addr constant [256 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00TVGH\00\00CD\00\00M\00KN\00\00\00YSA\00BW\00R\00\00\00\00\00\00\00TVGH\00\00CD\00\00M\00KN\00\00\00YSA\00BW\00R\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str6 = private unnamed_addr constant [18 x i8] c"Buffer allocation\00", align 1
@.str7 = private unnamed_addr constant [14 x i8] c"No input data\00", align 1
@.str8 = private unnamed_addr constant [17 x i8] c"1st char not '>'\00", align 1
@.str9 = private unnamed_addr constant [40 x i8] c"Number of iterations for hot loop: %ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @errex(i8* %s, i32 %n) #0 {
  %1 = load %struct._IO_FILE** @stderr, align 8
  %2 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i8* %s, i32 %n) #4
  ret i32 1
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @hotLoop(%struct._IO_FILE* nocapture %inputFile, i8** nocapture %p_pj, i8** nocapture %p_pq, i8** nocapture %p_pr, i8* %jjj, i8** nocapture %p_qqq, i8** nocapture %p_pqstop, i8* nocapture readonly %xtab) #0 {
entry:
  %v1 = tail call i8* @fgets(i8* %jjj, i32 82, %struct._IO_FILE* %inputFile) #3
  store i8* %v1, i8** %p_pj, align 8
  %v3 = icmp eq i8* %v1, null
  br i1 %v3, label %B75, label %B4

B4:                                               ; preds = %entry
  %v5 = load i8* %jjj, align 1
  %v7 = icmp eq i8 %v5, 62
  br i1 %v7, label %B75, label %B9

B9:                                               ; preds = %B4
  %v10 = load i8** %p_pr, align 8
  %v11 = load i8** %p_pq, align 8
  %v12 = getelementptr inbounds i8* %v11, i64 61
  %v13 = icmp ugt i8* %v10, %v12
  br i1 %v13, label %B58.preheader, label %B14

B14:                                              ; preds = %B9
  %v15 = load i8** %p_pqstop, align 8
  %v16 = getelementptr inbounds i8* %v15, i64 12777888
  %v17 = load i8** %p_qqq, align 8
  %v19 = ptrtoint i8* %v16 to i64
  %v20 = ptrtoint i8* %v17 to i64
  %v21 = sub i64 %v19, %v20
  %v22 = tail call i8* @realloc(i8* %v17, i64 %v21) #3
  %v23 = icmp eq i8* %v22, null
  br i1 %v23, label %B24, label %B26

B24:                                              ; preds = %B14
  %v25 = tail call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str1, i64 0, i64 0), i32 0)
  tail call void @exit(i32 1) #5
  unreachable

B26:                                              ; preds = %B14
  %v27 = load i8** %p_qqq, align 8
  %v28 = icmp eq i8* %v22, %v27
  br i1 %v28, label %B43, label %B29

B29:                                              ; preds = %B26
  %v31 = ptrtoint i8* %v22 to i64
  %v32 = ptrtoint i8* %v27 to i64
  %v33 = sub i64 %v31, %v32
  %v34 = load i8** %p_pq, align 8
  %v35 = getelementptr inbounds i8* %v34, i64 %v33
  store i8* %v35, i8** %p_pq, align 8
  %v36 = load i8** %p_pr, align 8
  %v37 = getelementptr inbounds i8* %v36, i64 %v33
  store i8* %v37, i8** %p_pr, align 8
  %v38 = load i8** %p_qqq, align 8
  %v39 = getelementptr inbounds i8* %v38, i64 %v33
  store i8* %v39, i8** %p_qqq, align 8
  %v16.sum = add i64 %v33, 12777888
  %v40 = getelementptr inbounds i8* %v15, i64 %v16.sum
  %v41 = load i8** %p_pqstop, align 8
  %v42 = getelementptr inbounds i8* %v41, i64 %v33
  store i8* %v42, i8** %p_pqstop, align 8
  br label %B43

B43:                                              ; preds = %B26, %B29
  %0 = phi i64 [ %v16.sum, %B29 ], [ 12777888, %B26 ]
  %newstop.0 = phi i8* [ %v40, %B29 ], [ %v16, %B26 ]
  %v44 = load i8** %p_pqstop, align 8
  %v45 = load i8** %p_pr, align 8
  %v46 = ptrtoint i8* %v44 to i64
  %v47 = ptrtoint i8* %v45 to i64
  %v48 = sub i64 %v46, %v47
  %.sum = sub i64 %0, %v48
  %v50 = getelementptr inbounds i8* %v15, i64 %.sum
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %v50, i8* %v45, i64 %v48, i32 1, i1 false)
  store i8* %v50, i8** %p_pr, align 8
  store i8* %newstop.0, i8** %p_pqstop, align 8
  br label %B58.preheader

B58.preheader:                                    ; preds = %B43, %B9
  %v591 = load i8** %p_pj, align 8
  %v602 = load i8* %v591, align 1
  %v613 = icmp eq i8 %v602, 0
  br i1 %v613, label %B75, label %B62.preheader

B62.preheader:                                    ; preds = %B58.preheader
  br label %B62

B62:                                              ; preds = %B62.preheader, %B58.backedge
  %v594 = phi i8* [ %v59, %B58.backedge ], [ %v591, %B62.preheader ]
  %v64 = getelementptr inbounds i8* %v594, i64 1
  store i8* %v64, i8** %p_pj, align 8
  %v65 = load i8* %v594, align 1
  %v66 = zext i8 %v65 to i64
  %v67 = getelementptr inbounds i8* %xtab, i64 %v66
  %v68 = load i8* %v67, align 1
  %v69 = icmp eq i8 %v68, 0
  br i1 %v69, label %B58.backedge, label %B70

B70:                                              ; preds = %B62
  %v71 = load i8** %p_pr, align 8
  %v72 = getelementptr inbounds i8* %v71, i64 -1
  store i8* %v72, i8** %p_pr, align 8
  store i8 %v68, i8* %v72, align 1
  br label %B58.backedge

B58.backedge:                                     ; preds = %B70, %B62
  %v59 = load i8** %p_pj, align 8
  %v60 = load i8* %v59, align 1
  %v61 = icmp eq i8 %v60, 0
  br i1 %v61, label %B75.loopexit, label %B62

B75.loopexit:                                     ; preds = %B58.backedge
  br label %B75

B75:                                              ; preds = %B75.loopexit, %B58.preheader, %entry, %B4
  %.0 = phi i32 [ 1, %B4 ], [ 1, %entry ], [ 0, %B58.preheader ], [ 0, %B75.loopexit ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i8* @fgets(i8*, i32, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @realloc(i8* nocapture, i64) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define i32 @bench() #0 {
  %pj = alloca i8*, align 8
  %pq = alloca i8*, align 8
  %pr = alloca i8*, align 8
  %qqq = alloca i8*, align 8
  %pqstop = alloca i8*, align 8
  %xtab = alloca [256 x i8], align 16
  %1 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([46 x i8]* @.str2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0)) #3
  %2 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([19 x i8]* @.str4, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i64 0, i64 0)) #3
  %3 = tail call noalias i8* @malloc(i64 82) #3
  %4 = tail call noalias i8* @malloc(i64 5200) #3
  store i8* %4, i8** %qqq, align 8
  %5 = getelementptr inbounds i8* %4, i64 5200
  store i8* %5, i8** %pqstop, align 8
  %6 = getelementptr inbounds [256 x i8]* %xtab, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* getelementptr inbounds ([256 x i8]* @bench.xtab, i64 0, i64 0), i64 256, i32 16, i1 false)
  %7 = icmp ne i8* %3, null
  %8 = load i8** %qqq, align 8
  %9 = icmp ne i8* %8, null
  %or.cond = and i1 %7, %9
  br i1 %or.cond, label %17, label %10

; <label>:10                                      ; preds = %0
  %11 = zext i1 %7 to i32
  %12 = xor i32 %11, 1
  %13 = zext i1 %9 to i32
  %14 = xor i32 %13, 1
  %15 = add nuw nsw i32 %14, %12
  %16 = tail call i32 @errex(i8* getelementptr inbounds ([18 x i8]* @.str6, i64 0, i64 0), i32 %15)
  br label %73

; <label>:17                                      ; preds = %0
  %18 = tail call i8* @fgets(i8* %3, i32 82, %struct._IO_FILE* %1) #3
  store i8* %18, i8** %pj, align 8
  %19 = icmp eq i8* %18, null
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %17
  %21 = tail call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str7, i64 0, i64 0), i32 0)
  br label %73

; <label>:22                                      ; preds = %17
  %23 = load i8* %3, align 1
  %24 = icmp eq i8 %23, 62
  br i1 %24, label %.preheader, label %27

.preheader:                                       ; preds = %22
  %25 = load i8** %pj, align 8
  %26 = icmp eq i8* %25, null
  br i1 %26, label %._crit_edge9, label %.lr.ph8.preheader

.lr.ph8.preheader:                                ; preds = %.preheader
  br label %.lr.ph8

; <label>:27                                      ; preds = %22
  %28 = tail call i32 @errex(i8* getelementptr inbounds ([17 x i8]* @.str8, i64 0, i64 0), i32 0)
  br label %73

.lr.ph8:                                          ; preds = %.lr.ph8.preheader, %60
  %hotLoopCounter.07 = phi i64 [ %.lcssa, %60 ], [ 0, %.lr.ph8.preheader ]
  %29 = tail call i32 @fputs(i8* %3, %struct._IO_FILE* %2) #3
  %30 = load i8** %qqq, align 8
  %31 = getelementptr inbounds i8* %30, i64 1
  store i8* %31, i8** %pq, align 8
  %32 = load i8** %pqstop, align 8
  store i8* %32, i8** %pr, align 8
  %33 = add nsw i64 %hotLoopCounter.07, 1
  %34 = call i32 @hotLoop(%struct._IO_FILE* %1, i8** %pj, i8** %pq, i8** %pr, i8* %3, i8** %qqq, i8** %pqstop, i8* %6)
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %36 = phi i64 [ %39, %.lr.ph ], [ %33, %.lr.ph.preheader ]
  %37 = load i8** %pq, align 8
  %38 = getelementptr inbounds i8* %37, i64 1
  store i8* %38, i8** %pq, align 8
  %39 = add nsw i64 %36, 1
  %40 = call i32 @hotLoop(%struct._IO_FILE* %1, i8** %pj, i8** %pq, i8** %pr, i8* %3, i8** %qqq, i8** %pqstop, i8* %6)
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %.lcssa17 = phi i64 [ %39, %.lr.ph ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph8
  %.lcssa = phi i64 [ %33, %.lr.ph8 ], [ %.lcssa17, %._crit_edge.loopexit ]
  %42 = load i8** %qqq, align 8
  store i8* %42, i8** %pq, align 8
  %43 = load i8** %pr, align 8
  %44 = load i8** %pqstop, align 8
  %45 = icmp ult i8* %43, %44
  br i1 %45, label %.lr.ph3, label %60

.lr.ph3:                                          ; preds = %._crit_edge
  %46 = load i8** %pqstop, align 8
  %pq.promoted = load i8** %pq, align 8
  %pr.promoted = load i8** %pr, align 8
  br label %47

; <label>:47                                      ; preds = %.lr.ph3, %47
  %48 = phi i8* [ %pr.promoted, %.lr.ph3 ], [ %56, %47 ]
  %49 = phi i8* [ %pq.promoted, %.lr.ph3 ], [ %58, %47 ]
  %50 = phi i8* [ %44, %.lr.ph3 ], [ %46, %47 ]
  %51 = phi i8* [ %43, %.lr.ph3 ], [ %56, %47 ]
  %52 = ptrtoint i8* %50 to i64
  %53 = ptrtoint i8* %51 to i64
  %54 = sub i64 %52, %53
  %55 = icmp slt i64 %54, 60
  %. = select i1 %55, i64 %54, i64 60
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %49, i8* %51, i64 %., i32 1, i1 false)
  %56 = getelementptr inbounds i8* %48, i64 %.
  %57 = getelementptr inbounds i8* %49, i64 %.
  %.sum = add i64 %., 1
  %58 = getelementptr inbounds i8* %49, i64 %.sum
  store i8 10, i8* %57, align 1
  %59 = icmp ult i8* %56, %46
  br i1 %59, label %47, label %._crit_edge4

._crit_edge4:                                     ; preds = %47
  %.lcssa19 = phi i8* [ %58, %47 ]
  %.lcssa18 = phi i8* [ %56, %47 ]
  store i8* %.lcssa19, i8** %pq, align 8
  store i8* %.lcssa18, i8** %pr, align 8
  br label %60

; <label>:60                                      ; preds = %._crit_edge4, %._crit_edge
  %61 = load i8** %qqq, align 8
  %62 = load i8** %pq, align 8
  %63 = ptrtoint i8* %62 to i64
  %64 = ptrtoint i8* %61 to i64
  %65 = sub i64 %63, %64
  %66 = tail call i64 @fwrite(i8* %61, i64 1, i64 %65, %struct._IO_FILE* %2) #3
  %67 = load i8** %pj, align 8
  %68 = icmp eq i8* %67, null
  br i1 %68, label %._crit_edge9.loopexit, label %.lr.ph8

._crit_edge9.loopexit:                            ; preds = %60
  %.lcssa.lcssa = phi i64 [ %.lcssa, %60 ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader
  %hotLoopCounter.0.lcssa = phi i64 [ 0, %.preheader ], [ %.lcssa.lcssa, %._crit_edge9.loopexit ]
  %69 = load %struct._IO_FILE** @stderr, align 8
  %70 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %69, i8* getelementptr inbounds ([40 x i8]* @.str9, i64 0, i64 0), i64 %hotLoopCounter.0.lcssa) #4
  %71 = tail call i32 @fclose(%struct._IO_FILE* %1) #3
  %72 = tail call i32 @fclose(%struct._IO_FILE* %2) #3
  br label %73

; <label>:73                                      ; preds = %._crit_edge9, %27, %20, %10
  %.0 = phi i32 [ 1, %27 ], [ 0, %._crit_edge9 ], [ 1, %20 ], [ 1, %10 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind
declare i32 @fputs(i8* nocapture readonly, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
