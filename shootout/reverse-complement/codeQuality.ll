; ModuleID = 'code.ll'
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
  %2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* %s, i32 %n)
  ret i32 1
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @bench() #0 {
entry:
  %xtab = alloca [256 x i8], align 16
  %v1 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([46 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0))
  %v2 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0))
  %v3 = call noalias i8* @malloc(i64 82) #3
  %v4 = call noalias i8* @malloc(i64 5200) #3
  %v5 = getelementptr inbounds i8* %v4, i64 5200
  %v6 = bitcast [256 x i8]* %xtab to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %v6, i8* getelementptr inbounds ([256 x i8]* @bench.xtab, i32 0, i32 0), i64 256, i32 16, i1 false)
  %v7 = icmp ne i8* %v3, null
  br i1 %v7, label %B8, label %B10

B8:                                       ; preds = %entry
  %v9 = icmp ne i8* %v4, null
  br i1 %v9, label %B19, label %B10

B10:                                      ; preds = %B8, %entry
  %v11 = icmp ne i8* %v3, null
  %v12 = xor i1 %v11, true
  %v13 = zext i1 %v12 to i32
  %v14 = icmp ne i8* %v4, null
  %v15 = xor i1 %v14, true
  %v16 = zext i1 %v15 to i32
  %v17 = add nsw i32 %v13, %v16
  %v18 = call i32 @errex(i8* getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 %v17)
  br label %B119

B19:                                      ; preds = %B8
  %v20 = call i8* @fgets(i8* %v3, i32 82, %struct._IO_FILE* %v1)
  %v21 = icmp ne i8* %v20, null
  br i1 %v21, label %B24, label %B22

B22:                                      ; preds = %B19
  %v23 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str6, i32 0, i32 0), i32 0)
  br label %B119

B24:                                      ; preds = %B19
  %v25 = load i8* %v3, align 1
  %v26 = sext i8 %v25 to i32
  %v27 = icmp ne i32 %v26, 62
  br i1 %v27, label %B28, label %B30

B28:                                      ; preds = %B24
  %v29 = call i32 @errex(i8* getelementptr inbounds ([17 x i8]* @.str7, i32 0, i32 0), i32 0)
  br label %B119

B30:                                      ; preds = %B24
  br label %B31

B31:                                      ; preds = %B111, %B30
  %qqq.0 = phi i8* [ %v4, %B30 ], [ %qqq.1, %B111 ]
  %pj.0 = phi i8* [ %v20, %B30 ], [ %v37, %B111 ]
  %pqstop.0 = phi i8* [ %v5, %B30 ], [ %pqstop.1, %B111 ]
  %v32 = icmp ne i8* %pj.0, null
  br i1 %v32, label %B33, label %B116

B33:                                      ; preds = %B31
  %v34 = call i32 @fputs(i8* %v3, %struct._IO_FILE* %v2)
  %v35 = getelementptr inbounds i8* %qqq.0, i64 1
  br label %B36

B36:                                      ; preds = %B91, %B33
  %qqq.1 = phi i8* [ %qqq.0, %B33 ], [ %qqq.3, %B91 ]
  %pr.0 = phi i8* [ %pqstop.0, %B33 ], [ %pr.3, %B91 ]
  %pq.0 = phi i8* [ %v35, %B33 ], [ %v92, %B91 ]
  %pqstop.1 = phi i8* [ %pqstop.0, %B33 ], [ %pqstop.3, %B91 ]
  %v37 = call i8* @fgets(i8* %v3, i32 82, %struct._IO_FILE* %v1)
  %v38 = icmp ne i8* %v37, null
  br i1 %v38, label %B39, label %B43

B39:                                      ; preds = %B36
  %v40 = load i8* %v3, align 1
  %v41 = sext i8 %v40 to i32
  %v42 = icmp eq i32 %v41, 62
  br i1 %v42, label %B43, label %B44

B43:                                      ; preds = %B39, %B36
  br label %B93

B44:                                      ; preds = %B39
  %v45 = getelementptr inbounds i8* %pq.0, i64 61
  %v46 = icmp ule i8* %pr.0, %v45
  br i1 %v46, label %B47, label %B76

B47:                                      ; preds = %B44
  %v48 = getelementptr inbounds i8* %pqstop.1, i64 12777888
  %v49 = ptrtoint i8* %v48 to i64
  %v50 = ptrtoint i8* %qqq.1 to i64
  %v51 = sub i64 %v49, %v50
  %v52 = call i8* @realloc(i8* %qqq.1, i64 %v51) #3
  %v53 = icmp ne i8* %v52, null
  br i1 %v53, label %B56, label %B54

B54:                                      ; preds = %B47
  %v55 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str8, i32 0, i32 0), i32 0)
  br label %B119

B56:                                      ; preds = %B47
  %v57 = icmp ne i8* %v52, %qqq.1
  br i1 %v57, label %B58, label %B67

B58:                                      ; preds = %B56
  %v59 = ptrtoint i8* %v52 to i64
  %v60 = ptrtoint i8* %qqq.1 to i64
  %v61 = sub i64 %v59, %v60
  %v62 = getelementptr inbounds i8* %pq.0, i64 %v61
  %v63 = getelementptr inbounds i8* %pr.0, i64 %v61
  %v64 = getelementptr inbounds i8* %qqq.1, i64 %v61
  %v65 = getelementptr inbounds i8* %v48, i64 %v61
  %v66 = getelementptr inbounds i8* %pqstop.1, i64 %v61
  br label %B67

B67:                                      ; preds = %B58, %B56
  %qqq.2 = phi i8* [ %v64, %B58 ], [ %qqq.1, %B56 ]
  %pr.1 = phi i8* [ %v63, %B58 ], [ %pr.0, %B56 ]
  %pq.1 = phi i8* [ %v62, %B58 ], [ %pq.0, %B56 ]
  %pqstop.2 = phi i8* [ %v66, %B58 ], [ %pqstop.1, %B56 ]
  %newstop.0 = phi i8* [ %v65, %B58 ], [ %v48, %B56 ]
  %v68 = ptrtoint i8* %pqstop.2 to i64
  %v69 = ptrtoint i8* %pr.1 to i64
  %v70 = sub i64 %v68, %v69
  %v71 = sub i64 0, %v70
  %v72 = getelementptr inbounds i8* %newstop.0, i64 %v71
  %v73 = ptrtoint i8* %pqstop.2 to i64
  %v74 = ptrtoint i8* %pr.1 to i64
  %v75 = sub i64 %v73, %v74
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %v72, i8* %pr.1, i64 %v75, i32 1, i1 false)
  br label %B76

B76:                                      ; preds = %B67, %B44
  %qqq.3 = phi i8* [ %qqq.2, %B67 ], [ %qqq.1, %B44 ]
  %pr.2 = phi i8* [ %v72, %B67 ], [ %pr.0, %B44 ]
  %pq.2 = phi i8* [ %pq.1, %B67 ], [ %pq.0, %B44 ]
  %pqstop.3 = phi i8* [ %newstop.0, %B67 ], [ %pqstop.1, %B44 ]
  br label %B77

B77:                                      ; preds = %B89, %B76
  %pr.3 = phi i8* [ %pr.2, %B76 ], [ %pr.4, %B89 ]
  %pj.1 = phi i8* [ %v37, %B76 ], [ %v81, %B89 ]
  %v78 = load i8* %pj.1, align 1
  %v79 = icmp ne i8 %v78, 0
  br i1 %v79, label %B80, label %B90

B80:                                      ; preds = %B77
  %v81 = getelementptr inbounds i8* %pj.1, i32 1
  %v82 = load i8* %pj.1, align 1
  %v83 = zext i8 %v82 to i64
  %v84 = getelementptr inbounds [256 x i8]* %xtab, i32 0, i64 %v83
  %v85 = load i8* %v84, align 1
  %v86 = icmp ne i8 %v85, 0
  br i1 %v86, label %B87, label %B89

B87:                                      ; preds = %B80
  %v88 = getelementptr inbounds i8* %pr.3, i32 -1
  store i8 %v85, i8* %v88, align 1
  br label %B89

B89:                                      ; preds = %B87, %B80
  %pr.4 = phi i8* [ %v88, %B87 ], [ %pr.3, %B80 ]
  br label %B77

B90:                                      ; preds = %B77
  br label %B91

B91:                                      ; preds = %B90
  %v92 = getelementptr inbounds i8* %pq.2, i32 1
  br label %B36

B93:                                      ; preds = %B43
  br label %B94

B94:                                      ; preds = %B106, %B93
  %pr.5 = phi i8* [ %pr.0, %B93 ], [ %v108, %B106 ]
  %pq.3 = phi i8* [ %qqq.1, %B93 ], [ %v110, %B106 ]
  %v95 = icmp ult i8* %pr.5, %pqstop.1
  br i1 %v95, label %B96, label %B111

B96:                                      ; preds = %B94
  %v97 = ptrtoint i8* %pqstop.1 to i64
  %v98 = ptrtoint i8* %pr.5 to i64
  %v99 = sub i64 %v97, %v98
  %v100 = icmp slt i64 %v99, 60
  br i1 %v100, label %B101, label %B105

B101:                                     ; preds = %B96
  %v102 = ptrtoint i8* %pqstop.1 to i64
  %v103 = ptrtoint i8* %pr.5 to i64
  %v104 = sub i64 %v102, %v103
  br label %B106

B105:                                     ; preds = %B96
  br label %B106

B106:                                     ; preds = %B105, %B101
  %v107 = phi i64 [ %v104, %B101 ], [ 60, %B105 ]
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %pq.3, i8* %pr.5, i64 %v107, i32 1, i1 false)
  %v108 = getelementptr inbounds i8* %pr.5, i64 %v107
  %v109 = getelementptr inbounds i8* %pq.3, i64 %v107
  %v110 = getelementptr inbounds i8* %v109, i32 1
  store i8 10, i8* %v109, align 1
  br label %B94

B111:                                     ; preds = %B94
  %v112 = ptrtoint i8* %pq.3 to i64
  %v113 = ptrtoint i8* %qqq.1 to i64
  %v114 = sub i64 %v112, %v113
  %v115 = call i64 @fwrite(i8* %qqq.1, i64 1, i64 %v114, %struct._IO_FILE* %v2)
  br label %B31

B116:                                     ; preds = %B31
  %v117 = call i32 @fclose(%struct._IO_FILE* %v1)
  %v118 = call i32 @fclose(%struct._IO_FILE* %v2)
  br label %B119

B119:                                     ; preds = %B116, %B54, %B28, %B22, %B10
  %.0 = phi i32 [ %v29, %B28 ], [ %v55, %B54 ], [ 0, %B116 ], [ %v23, %B22 ], [ %v18, %B10 ]
  ret i32 %.0
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #2

; Function Attrs: nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
