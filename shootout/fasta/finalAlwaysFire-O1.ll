; ModuleID = 'finalAlwaysFire.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.aminoacids = type { i8, double }

@gen_random.last = internal unnamed_addr global i64 42, align 8
@outStream = common global %struct._IO_FILE* null, align 8
@.str = private unnamed_addr constant [8 x i8] c">%s %s\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@iub_orig = global [15 x %struct.aminoacids] [%struct.aminoacids { i8 97, double 2.700000e-01 }, %struct.aminoacids { i8 99, double 1.200000e-01 }, %struct.aminoacids { i8 103, double 1.200000e-01 }, %struct.aminoacids { i8 116, double 2.700000e-01 }, %struct.aminoacids { i8 66, double 2.000000e-02 }, %struct.aminoacids { i8 68, double 2.000000e-02 }, %struct.aminoacids { i8 72, double 2.000000e-02 }, %struct.aminoacids { i8 75, double 2.000000e-02 }, %struct.aminoacids { i8 77, double 2.000000e-02 }, %struct.aminoacids { i8 78, double 2.000000e-02 }, %struct.aminoacids { i8 82, double 2.000000e-02 }, %struct.aminoacids { i8 83, double 2.000000e-02 }, %struct.aminoacids { i8 86, double 2.000000e-02 }, %struct.aminoacids { i8 87, double 2.000000e-02 }, %struct.aminoacids { i8 89, double 2.000000e-02 }], align 16
@homosapiens_orig = global [4 x %struct.aminoacids] [%struct.aminoacids { i8 97, double 0x3FD3639D20BAEB5B }, %struct.aminoacids { i8 99, double 0x3FC957AE3DCD561B }, %struct.aminoacids { i8 103, double 0x3FC9493AEAB6C2BF }, %struct.aminoacids { i8 116, double 0x3FD34BEE4B030838 }], align 16
@.str2 = private unnamed_addr constant [288 x i8] c"GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGGGAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGACCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAATACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCAGCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGGAGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCCAGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA\00", align 1
@alu = global i8* getelementptr inbounds ([288 x i8]* @.str2, i64 0, i64 0), align 8
@.str3 = private unnamed_addr constant [13 x i8] c"fasta-%d.txt\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@iub = common global [15 x %struct.aminoacids] zeroinitializer, align 16
@homosapiens = common global [4 x %struct.aminoacids] zeroinitializer, align 16
@.str5 = private unnamed_addr constant [4 x i8] c"ONE\00", align 1
@.str6 = private unnamed_addr constant [17 x i8] c"Homo sapiens alu\00", align 1
@.str7 = private unnamed_addr constant [4 x i8] c"TWO\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"IUB ambiguity codes\00", align 1
@.str9 = private unnamed_addr constant [6 x i8] c"THREE\00", align 1
@.str10 = private unnamed_addr constant [23 x i8] c"Homo sapiens frequency\00", align 1

; Function Attrs: nounwind uwtable
define double @gen_random(double %max) #0 {
  %1 = load i64* @gen_random.last, align 8
  %2 = mul nsw i64 %1, 3877
  %3 = add nsw i64 %2, 29573
  %4 = srem i64 %3, 139968
  store i64 %4, i64* @gen_random.last, align 8
  %5 = sitofp i64 %4 to double
  %6 = fmul double %5, %max
  %7 = fdiv double %6, 1.399680e+05
  ret double %7
}

; Function Attrs: nounwind uwtable
define void @makeCumulative(%struct.aminoacids* nocapture %genelist, i32 %count) #0 {
  %1 = icmp sgt i32 %count, 0
  br i1 %1, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %2 = add i32 %count, -1
  br label %3

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %3 ]
  %cp.01 = phi double [ 0.000000e+00, %.lr.ph ], [ %6, %3 ]
  %4 = getelementptr inbounds %struct.aminoacids* %genelist, i64 %indvars.iv, i32 1
  %5 = load double* %4, align 8
  %6 = fadd double %cp.01, %5
  store double %6, double* %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %2
  br i1 %exitcond, label %._crit_edge.loopexit, label %3

._crit_edge.loopexit:                             ; preds = %3
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

; Function Attrs: nounwind uwtable
define signext i8 @selectRandom(%struct.aminoacids* nocapture readonly %genelist, i32 %count) #0 {
entry:
  %v1 = tail call double @gen_random(double 1.000000e+00)
  %v3 = getelementptr inbounds %struct.aminoacids* %genelist, i64 0, i32 1
  %v4 = load double* %v3, align 8
  %v5 = fcmp olt double %v1, %v4
  br i1 %v5, label %B6, label %B10

B6:                                               ; preds = %entry
  %v8 = getelementptr inbounds %struct.aminoacids* %genelist, i64 0, i32 0
  br label %B31

B10:                                              ; preds = %entry
  %v11 = add nsw i32 %count, -1
  %v141 = icmp sgt i32 %v11, 1
  br i1 %v141, label %B15.preheader, label %B26

B15.preheader:                                    ; preds = %B10
  br label %B15

B15:                                              ; preds = %B15.preheader, %B15
  %hi.03 = phi i32 [ %v17.hi.0, %B15 ], [ %v11, %B15.preheader ]
  %lo.02 = phi i32 [ %lo.0.v17, %B15 ], [ 0, %B15.preheader ]
  %v16 = add nsw i32 %hi.03, %lo.02
  %v17 = sdiv i32 %v16, 2
  %v18 = sext i32 %v17 to i64
  %v20 = getelementptr inbounds %struct.aminoacids* %genelist, i64 %v18, i32 1
  %v21 = load double* %v20, align 8
  %v22 = fcmp olt double %v1, %v21
  %lo.0.v17 = select i1 %v22, i32 %lo.02, i32 %v17
  %v17.hi.0 = select i1 %v22, i32 %v17, i32 %hi.03
  %v13 = add nsw i32 %lo.0.v17, 1
  %v14 = icmp sgt i32 %v17.hi.0, %v13
  br i1 %v14, label %B15, label %B26.loopexit

B26.loopexit:                                     ; preds = %B15
  %v17.hi.0.lcssa = phi i32 [ %v17.hi.0, %B15 ]
  br label %B26

B26:                                              ; preds = %B26.loopexit, %B10
  %hi.0.lcssa = phi i32 [ %v11, %B10 ], [ %v17.hi.0.lcssa, %B26.loopexit ]
  %v27 = sext i32 %hi.0.lcssa to i64
  %v29 = getelementptr inbounds %struct.aminoacids* %genelist, i64 %v27, i32 0
  br label %B31

B31:                                              ; preds = %B26, %B6
  %.0.in = phi i8* [ %v8, %B6 ], [ %v29, %B26 ]
  %.0 = load i8* %.0.in, align 1
  ret i8 %.0
}

; Function Attrs: nounwind uwtable
define void @makeRandomFasta(i8* %id, i8* %desc, %struct.aminoacids* nocapture readonly %genelist, i32 %count, i32 %n) #0 {
  %pick = alloca [61 x i8], align 16
  %1 = load %struct._IO_FILE** @outStream, align 8
  %2 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i8* %id, i8* %desc) #3
  %3 = icmp sgt i32 %n, 0
  br i1 %3, label %.lr.ph4, label %._crit_edge5

.lr.ph4:                                          ; preds = %0
  %4 = getelementptr inbounds [61 x i8]* %pick, i64 0, i64 0
  %5 = xor i32 %n, -1
  br label %6

; <label>:6                                       ; preds = %.lr.ph4, %._crit_edge
  %indvars.iv6 = phi i32 [ %5, %.lr.ph4 ], [ %indvars.iv.next7, %._crit_edge ]
  %todo.02 = phi i32 [ %n, %.lr.ph4 ], [ %17, %._crit_edge ]
  %7 = icmp sgt i32 %indvars.iv6, -61
  %indvars.iv6.op = sub i32 -2, %indvars.iv6
  %8 = select i1 %7, i32 %indvars.iv6.op, i32 59
  %9 = icmp slt i32 %todo.02, 60
  %todo.0. = select i1 %9, i32 %todo.02, i32 60
  %10 = icmp sgt i32 %todo.0., 0
  br i1 %10, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %11 = tail call signext i8 @selectRandom(%struct.aminoacids* %genelist, i32 %count)
  %12 = getelementptr inbounds [61 x i8]* %pick, i64 0, i64 %indvars.iv
  store i8 %11, i8* %12, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %8
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  %13 = sext i32 %todo.0. to i64
  %14 = getelementptr inbounds [61 x i8]* %pick, i64 0, i64 %13
  store i8 0, i8* %14, align 1
  %15 = load %struct._IO_FILE** @outStream, align 8
  %16 = call i32 @fputs(i8* %4, %struct._IO_FILE* %15) #3
  %17 = add nsw i32 %todo.02, -60
  %18 = icmp sgt i32 %todo.02, 60
  %indvars.iv.next7 = add i32 %indvars.iv6, 60
  br i1 %18, label %6, label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %0
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i32 @fputs(i8* nocapture readonly, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind uwtable
define void @makeRepeatFasta(i8* %id, i8* %desc, i8* nocapture readonly %s, i32 %n) #0 {
  %1 = tail call i64 @strlen(i8* %s) #4
  %2 = trunc i64 %1 to i32
  %3 = shl i64 %1, 32
  %sext = add i64 %3, 4294967296
  %4 = ashr exact i64 %sext, 32
  %5 = tail call noalias i8* @malloc(i64 %4) #3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %s, i64 %4, i32 1, i1 false)
  %6 = load %struct._IO_FILE** @outStream, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i8* %id, i8* %desc) #3
  %8 = icmp sgt i32 %n, 0
  br i1 %8, label %.lr.ph7.preheader, label %._crit_edge8

.lr.ph7.preheader:                                ; preds = %0
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7.preheader, %._crit_edge
  %k.05 = phi i32 [ %18, %._crit_edge ], [ 0, %.lr.ph7.preheader ]
  %todo.04 = phi i32 [ %27, %._crit_edge ], [ %n, %.lr.ph7.preheader ]
  %9 = icmp slt i32 %todo.04, 60
  %todo.0. = select i1 %9, i32 %todo.04, i32 60
  %10 = sub nsw i32 %2, %k.05
  %11 = icmp slt i32 %todo.0., %10
  br i1 %11, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph7
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %12 = phi i32 [ %2, %.lr.ph ], [ %10, %.lr.ph.preheader ]
  %m.12 = phi i32 [ %16, %.lr.ph ], [ %todo.0., %.lr.ph.preheader ]
  %k.11 = phi i32 [ 0, %.lr.ph ], [ %k.05, %.lr.ph.preheader ]
  %13 = load %struct._IO_FILE** @outStream, align 8
  %14 = sext i32 %k.11 to i64
  %15 = getelementptr inbounds i8* %s, i64 %14
  %fputs = tail call i32 @fputs(i8* %15, %struct._IO_FILE* %13) #3
  %16 = sub nsw i32 %m.12, %12
  %17 = icmp slt i32 %16, %2
  br i1 %17, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %.lcssa = phi i32 [ %16, %.lr.ph ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph7
  %m.1.lcssa = phi i32 [ %todo.0., %.lr.ph7 ], [ %.lcssa, %._crit_edge.loopexit ]
  %k.1.lcssa = phi i32 [ %k.05, %.lr.ph7 ], [ 0, %._crit_edge.loopexit ]
  %18 = add nsw i32 %m.1.lcssa, %k.1.lcssa
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8* %5, i64 %19
  store i8 0, i8* %20, align 1
  %21 = sext i32 %k.1.lcssa to i64
  %22 = getelementptr inbounds i8* %5, i64 %21
  %23 = load %struct._IO_FILE** @outStream, align 8
  %24 = tail call i32 @fputs(i8* %22, %struct._IO_FILE* %23) #3
  %25 = getelementptr inbounds i8* %s, i64 %19
  %26 = load i8* %25, align 1
  store i8 %26, i8* %20, align 1
  %27 = add nsw i32 %todo.04, -60
  %28 = icmp sgt i32 %todo.04, 60
  br i1 %28, label %.lr.ph7, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %0
  tail call void @free(i8* %5) #3
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %filename = alloca [64 x i8], align 16
  %1 = icmp sgt i32 %inputN, 1
  %inputN. = select i1 %1, i32 %inputN, i32 1000
  %2 = getelementptr inbounds [64 x i8]* %filename, i64 0, i64 0
  %3 = call i32 (i8*, i8*, ...)* @sprintf(i8* %2, i8* getelementptr inbounds ([13 x i8]* @.str3, i64 0, i64 0), i32 %inputN.) #3
  %4 = call %struct._IO_FILE* @fopen(i8* %2, i8* getelementptr inbounds ([3 x i8]* @.str4, i64 0, i64 0)) #3
  store %struct._IO_FILE* %4, %struct._IO_FILE** @outStream, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i64 0, i64 0, i32 0), i8* getelementptr inbounds ([15 x %struct.aminoacids]* @iub_orig, i64 0, i64 0, i32 0), i64 240, i32 16, i1 false)
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i64 0, i64 0, i32 0), i8* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens_orig, i64 0, i64 0, i32 0), i64 64, i32 16, i1 false)
  tail call void @makeCumulative(%struct.aminoacids* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i64 0, i64 0), i32 15)
  tail call void @makeCumulative(%struct.aminoacids* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i64 0, i64 0), i32 4)
  %5 = load i8** @alu, align 8
  %6 = shl nsw i32 %inputN., 1
  tail call void @makeRepeatFasta(i8* getelementptr inbounds ([4 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8]* @.str6, i64 0, i64 0), i8* %5, i32 %6)
  %7 = mul nsw i32 %inputN., 3
  tail call void @makeRandomFasta(i8* getelementptr inbounds ([4 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @.str8, i64 0, i64 0), %struct.aminoacids* getelementptr inbounds ([15 x %struct.aminoacids]* @iub, i64 0, i64 0), i32 15, i32 %7)
  %8 = mul nsw i32 %inputN., 5
  tail call void @makeRandomFasta(i8* getelementptr inbounds ([6 x i8]* @.str9, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8]* @.str10, i64 0, i64 0), %struct.aminoacids* getelementptr inbounds ([4 x %struct.aminoacids]* @homosapiens, i64 0, i64 0), i32 4, i32 %8)
  %9 = load %struct._IO_FILE** @outStream, align 8
  %10 = tail call i32 @fclose(%struct._IO_FILE* %9) #3
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
