; ModuleID = 'bench.ll'
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
  %1 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([46 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0)) #2
  %2 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([19 x i8]* @.str3, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i64 0, i64 0)) #2
  %3 = tail call noalias i8* @malloc(i64 82) #2
  %4 = tail call noalias i8* @malloc(i64 5200) #2
  %5 = getelementptr inbounds i8* %4, i64 5200
  %6 = icmp ne i8* %3, null
  %7 = icmp ne i8* %4, null
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %15, label %8

; <label>:8                                       ; preds = %0
  %9 = zext i1 %6 to i32
  %10 = xor i32 %9, 1
  %11 = zext i1 %7 to i32
  %12 = xor i32 %11, 1
  %13 = add nuw nsw i32 %12, %10
  %14 = tail call i32 @errex(i8* getelementptr inbounds ([18 x i8]* @.str5, i64 0, i64 0), i32 %13)
  br label %89

; <label>:15                                      ; preds = %0
  %16 = tail call i8* @fgets(i8* %3, i32 82, %struct._IO_FILE* %1) #2
  %17 = icmp eq i8* %16, null
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %15
  %19 = tail call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str6, i64 0, i64 0), i32 0)
  br label %89

; <label>:20                                      ; preds = %15
  %21 = load i8* %3, align 1
  %22 = icmp eq i8 %21, 62
  br i1 %22, label %.lr.ph30.preheader, label %23

.lr.ph30.preheader:                               ; preds = %20
  br label %.lr.ph30

; <label>:23                                      ; preds = %20
  %24 = tail call i32 @errex(i8* getelementptr inbounds ([17 x i8]* @.str7, i64 0, i64 0), i32 0)
  br label %89

.lr.ph30:                                         ; preds = %.lr.ph30.preheader, %._crit_edge
  %pqstop.029 = phi i8* [ %pqstop.1.lcssa45, %._crit_edge ], [ %5, %.lr.ph30.preheader ]
  %qqq.028 = phi i8* [ %qqq.1.lcssa46, %._crit_edge ], [ %4, %.lr.ph30.preheader ]
  %25 = tail call i32 @fputs(i8* %3, %struct._IO_FILE* %2) #2
  %26 = tail call i8* @fgets(i8* %3, i32 82, %struct._IO_FILE* %1) #2
  %27 = icmp eq i8* %26, null
  br i1 %27, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph30
  br label %.lr.ph

.loopexit:                                        ; preds = %63
  %pr.3.ph.lcssa = phi i8* [ %pr.3.ph, %63 ]
  %28 = tail call i8* @fgets(i8* %3, i32 82, %struct._IO_FILE* %1) #2
  %29 = icmp eq i8* %28, null
  br i1 %29, label %.preheader, label %.lr.ph

.preheader:                                       ; preds = %.loopexit, %.lr.ph
  %.lcssa8 = phi i8* [ %32, %.lr.ph ], [ null, %.loopexit ]
  %pqstop.1.lcssa = phi i8* [ %pqstop.114, %.lr.ph ], [ %pqstop.3, %.loopexit ]
  %pr.0.lcssa = phi i8* [ %pr.012, %.lr.ph ], [ %pr.3.ph.lcssa, %.loopexit ]
  %qqq.1.lcssa = phi i8* [ %qqq.111, %.lr.ph ], [ %qqq.3, %.loopexit ]
  %30 = icmp ult i8* %pr.0.lcssa, %pqstop.1.lcssa
  br i1 %30, label %.lr.ph26, label %._crit_edge

.lr.ph26:                                         ; preds = %.preheader
  %31 = ptrtoint i8* %pqstop.1.lcssa to i64
  br label %74

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.loopexit
  %32 = phi i8* [ %28, %.loopexit ], [ %26, %.lr.ph.preheader ]
  %qqq.028.pn = phi i8* [ %pq.2, %.loopexit ], [ %qqq.028, %.lr.ph.preheader ]
  %pqstop.114 = phi i8* [ %pqstop.3, %.loopexit ], [ %pqstop.029, %.lr.ph.preheader ]
  %pr.012 = phi i8* [ %pr.3.ph.lcssa, %.loopexit ], [ %pqstop.029, %.lr.ph.preheader ]
  %qqq.111 = phi i8* [ %qqq.3, %.loopexit ], [ %qqq.028, %.lr.ph.preheader ]
  %pq.015 = getelementptr inbounds i8* %qqq.028.pn, i64 1
  %33 = load i8* %3, align 1
  %34 = icmp eq i8 %33, 62
  br i1 %34, label %.preheader, label %35

; <label>:35                                      ; preds = %.lr.ph
  %36 = getelementptr inbounds i8* %qqq.028.pn, i64 62
  %37 = icmp ugt i8* %pr.012, %36
  br i1 %37, label %62, label %38

; <label>:38                                      ; preds = %35
  %39 = getelementptr inbounds i8* %pqstop.114, i64 12777888
  %40 = ptrtoint i8* %39 to i64
  %41 = ptrtoint i8* %qqq.111 to i64
  %42 = sub i64 %40, %41
  %43 = tail call i8* @realloc(i8* %qqq.111, i64 %42) #2
  %44 = icmp eq i8* %43, null
  br i1 %44, label %45, label %47

; <label>:45                                      ; preds = %38
  %46 = tail call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str8, i64 0, i64 0), i32 0)
  br label %89

; <label>:47                                      ; preds = %38
  %48 = icmp eq i8* %43, %qqq.111
  br i1 %48, label %56, label %49

; <label>:49                                      ; preds = %47
  %50 = ptrtoint i8* %43 to i64
  %51 = sub i64 %50, %41
  %pq.0.sum = add i64 %51, 1
  %52 = getelementptr inbounds i8* %qqq.028.pn, i64 %pq.0.sum
  %53 = getelementptr inbounds i8* %pr.012, i64 %51
  %.sum1 = add i64 %51, 12777888
  %54 = getelementptr inbounds i8* %pqstop.114, i64 %.sum1
  %55 = getelementptr inbounds i8* %pqstop.114, i64 %51
  br label %56

; <label>:56                                      ; preds = %47, %49
  %qqq.2 = phi i8* [ %43, %49 ], [ %qqq.111, %47 ]
  %pr.1 = phi i8* [ %53, %49 ], [ %pr.012, %47 ]
  %pq.1 = phi i8* [ %52, %49 ], [ %pq.015, %47 ]
  %pqstop.2 = phi i8* [ %55, %49 ], [ %pqstop.114, %47 ]
  %57 = phi i64 [ %.sum1, %49 ], [ 12777888, %47 ]
  %newstop.0 = phi i8* [ %54, %49 ], [ %39, %47 ]
  %58 = ptrtoint i8* %pqstop.2 to i64
  %59 = ptrtoint i8* %pr.1 to i64
  %60 = sub i64 %58, %59
  %.sum2 = sub i64 %57, %60
  %61 = getelementptr inbounds i8* %pqstop.114, i64 %.sum2
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %61, i8* %pr.1, i64 %60, i32 1, i1 false)
  br label %62

; <label>:62                                      ; preds = %35, %56
  %qqq.3 = phi i8* [ %qqq.2, %56 ], [ %qqq.111, %35 ]
  %pr.2 = phi i8* [ %61, %56 ], [ %pr.012, %35 ]
  %pq.2 = phi i8* [ %pq.1, %56 ], [ %pq.015, %35 ]
  %pqstop.3 = phi i8* [ %newstop.0, %56 ], [ %pqstop.114, %35 ]
  br label %.outer

.outer:                                           ; preds = %72, %62
  %pr.3.ph = phi i8* [ %73, %72 ], [ %pr.2, %62 ]
  %pj.1.ph = phi i8* [ %.lcssa, %72 ], [ %32, %62 ]
  br label %63

; <label>:63                                      ; preds = %.outer, %66
  %pj.1 = phi i8* [ %67, %66 ], [ %pj.1.ph, %.outer ]
  %64 = load i8* %pj.1, align 1
  %65 = icmp eq i8 %64, 0
  br i1 %65, label %.loopexit, label %66

; <label>:66                                      ; preds = %63
  %67 = getelementptr inbounds i8* %pj.1, i64 1
  %68 = zext i8 %64 to i64
  %69 = getelementptr inbounds [256 x i8]* @bench.xtab, i64 0, i64 %68
  %70 = load i8* %69, align 1
  %71 = icmp eq i8 %70, 0
  br i1 %71, label %63, label %72

; <label>:72                                      ; preds = %66
  %.lcssa49 = phi i8 [ %70, %66 ]
  %.lcssa = phi i8* [ %67, %66 ]
  %73 = getelementptr inbounds i8* %pr.3.ph, i64 -1
  store i8 %.lcssa49, i8* %73, align 1
  br label %.outer

; <label>:74                                      ; preds = %.lr.ph26, %74
  %pq.325 = phi i8* [ %qqq.1.lcssa, %.lr.ph26 ], [ %80, %74 ]
  %pr.524 = phi i8* [ %pr.0.lcssa, %.lr.ph26 ], [ %78, %74 ]
  %75 = ptrtoint i8* %pr.524 to i64
  %76 = sub i64 %31, %75
  %77 = icmp slt i64 %76, 60
  %. = select i1 %77, i64 %76, i64 60
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %pq.325, i8* %pr.524, i64 %., i32 1, i1 false)
  %78 = getelementptr inbounds i8* %pr.524, i64 %.
  %79 = getelementptr inbounds i8* %pq.325, i64 %.
  %.sum = add i64 %., 1
  %80 = getelementptr inbounds i8* %pq.325, i64 %.sum
  store i8 10, i8* %79, align 1
  %81 = icmp ult i8* %78, %pqstop.1.lcssa
  br i1 %81, label %74, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %74
  %.lcssa50 = phi i8* [ %80, %74 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph30, %.preheader
  %qqq.1.lcssa46 = phi i8* [ %qqq.1.lcssa, %.preheader ], [ %qqq.028, %.lr.ph30 ], [ %qqq.1.lcssa, %._crit_edge.loopexit ]
  %pqstop.1.lcssa45 = phi i8* [ %pqstop.1.lcssa, %.preheader ], [ %pqstop.029, %.lr.ph30 ], [ %pqstop.1.lcssa, %._crit_edge.loopexit ]
  %.lcssa844 = phi i8* [ %.lcssa8, %.preheader ], [ null, %.lr.ph30 ], [ %.lcssa8, %._crit_edge.loopexit ]
  %pq.3.lcssa = phi i8* [ %qqq.1.lcssa, %.preheader ], [ %qqq.028, %.lr.ph30 ], [ %.lcssa50, %._crit_edge.loopexit ]
  %82 = ptrtoint i8* %pq.3.lcssa to i64
  %83 = ptrtoint i8* %qqq.1.lcssa46 to i64
  %84 = sub i64 %82, %83
  %85 = tail call i64 @fwrite(i8* %qqq.1.lcssa46, i64 1, i64 %84, %struct._IO_FILE* %2) #2
  %86 = icmp eq i8* %.lcssa844, null
  br i1 %86, label %._crit_edge31, label %.lr.ph30

._crit_edge31:                                    ; preds = %._crit_edge
  %87 = tail call i32 @fclose(%struct._IO_FILE* %1) #2
  %88 = tail call i32 @fclose(%struct._IO_FILE* %2) #2
  br label %89

; <label>:89                                      ; preds = %._crit_edge31, %45, %23, %18, %8
  %.0 = phi i32 [ 1, %23 ], [ 1, %45 ], [ 0, %._crit_edge31 ], [ 1, %18 ], [ 1, %8 ]
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
