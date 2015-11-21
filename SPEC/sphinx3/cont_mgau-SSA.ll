; ModuleID = 'cont_mgau.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.mgau_model_t = type { i32, i32, i32, %struct.mgau_t*, double, i32, i32, i32 }
%struct.mgau_t = type { i32, float**, float**, float*, i32* }

@.str = private unnamed_addr constant [12 x i8] c"cont_mgau.c\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"INFO\00", align 1
@.str2 = private unnamed_addr constant [54 x i8] c"Applying variance floor to non-zero variance vectors\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"%d variance values floored\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"meanfile != ((void*)0)\00", align 1
@__PRETTY_FUNCTION__.mgau_init = private unnamed_addr constant [81 x i8] c"mgau_model_t *mgau_init(char *, char *, float64, char *, float64, int32, char *)\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"varfile != ((void*)0)\00", align 1
@.str6 = private unnamed_addr constant [16 x i8] c"varfloor >= 0.0\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"mixwfile != ((void*)0)\00", align 1
@.str8 = private unnamed_addr constant [17 x i8] c"mixwfloor >= 0.0\00", align 1
@.str9 = private unnamed_addr constant [7 x i8] c".cont.\00", align 1
@.str10 = private unnamed_addr constant [7 x i8] c".semi.\00", align 1
@.str11 = private unnamed_addr constant [12 x i8] c"FATAL_ERROR\00", align 1
@.str12 = private unnamed_addr constant [42 x i8] c"Feature should be either .semi. or .cont.\00", align 1
@.str13 = private unnamed_addr constant [46 x i8] c"Precomputing Mahalanobis distance invariants\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"Applying variance floor\0A\00", align 1
@.str15 = private unnamed_addr constant [43 x i8] c"Removing uninitialized Gaussian densities\0A\00", align 1
@stdout = external global %struct._IO_FILE*
@.str16 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str17 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str18 = private unnamed_addr constant [53 x i8] c"%d densities removed (%d mixtures removed entirely)\0A\00", align 1
@.str19 = private unnamed_addr constant [35 x i8] c"Reading mixture weights file '%s'\0A\00", align 1
@.str20 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str21 = private unnamed_addr constant [24 x i8] c"bio_readhdr(%s) failed\0A\00", align 1
@.str22 = private unnamed_addr constant [8 x i8] c"version\00", align 1
@.str23 = private unnamed_addr constant [4 x i8] c"1.0\00", align 1
@.str24 = private unnamed_addr constant [8 x i8] c"WARNING\00", align 1
@.str25 = private unnamed_addr constant [40 x i8] c"Version mismatch(%s): %s, expecting %s\0A\00", align 1
@.str26 = private unnamed_addr constant [8 x i8] c"chksum0\00", align 1
@.str27 = private unnamed_addr constant [34 x i8] c"bio_fread(%s) (arraysize) failed\0A\00", align 1
@.str28 = private unnamed_addr constant [46 x i8] c"#Features streams(%d) != 1 in continuous HMM\0A\00", align 1
@.str29 = private unnamed_addr constant [51 x i8] c"#Features streams(%d) != 4 in semi-continuous HMM\0A\00", align 1
@.str30 = private unnamed_addr constant [116 x i8] c"How can this happen? Someone must have moved this part of the code somewhere! Not my fault! ARCHAN at 20040504 :-)\0A\00", align 1
@.str31 = private unnamed_addr constant [60 x i8] c"%s: #float32s(%d) doesn't match header dimensions: %d x %d\0A\00", align 1
@.str32 = private unnamed_addr constant [66 x i8] c"%s: #Mixture Gaussians(%d) doesn't match mean/var parameters(%d)\0A\00", align 1
@.str33 = private unnamed_addr constant [65 x i8] c"Mixture %d: #Weights(%d) doesn't match #Gaussian components(%d)\0A\00", align 1
@.str34 = private unnamed_addr constant [34 x i8] c"bio_fread(%s) (arraydata) failed\0A\00", align 1
@.str35 = private unnamed_addr constant [31 x i8] c"More data than expected in %s\0A\00", align 1
@.str36 = private unnamed_addr constant [30 x i8] c"Read %d x %d mixture weights\0A\00", align 1
@.str37 = private unnamed_addr constant [36 x i8] c"Reading mixture gaussian file '%s'\0A\00", align 1
@.str38 = private unnamed_addr constant [31 x i8] c"fread(%s) (#codebooks) failed\0A\00", align 1
@.str39 = private unnamed_addr constant [71 x i8] c"%s: #Mixture Gaussians (%d) exceeds limit(%d) enforced by MGAUID type\0A\00", align 1
@.str40 = private unnamed_addr constant [30 x i8] c"fread(%s) (#features) failed\0A\00", align 1
@.str41 = private unnamed_addr constant [51 x i8] c"#Features streams(%d) != 1 in semi-continuous HMM\0A\00", align 1
@.str42 = private unnamed_addr constant [38 x i8] c"fread(%s) (#density/codebook) failed\0A\00", align 1
@.str43 = private unnamed_addr constant [36 x i8] c"fread(%s) (feature-lengths) failed\0A\00", align 1
@.str44 = private unnamed_addr constant [34 x i8] c"fread(%s) (total #floats) failed\0A\00", align 1
@.str45 = private unnamed_addr constant [58 x i8] c"%s: #float32s(%d) doesn't match dimensions: %d x %d x %d\0A\00", align 1
@.str46 = private unnamed_addr constant [50 x i8] c"Currently S2 semi-continous HMM is not supported\0A\00", align 1
@.str47 = private unnamed_addr constant [10 x i8] c"type == 2\00", align 1
@__PRETTY_FUNCTION__.mgau_file_read = private unnamed_addr constant [52 x i8] c"int32 mgau_file_read(mgau_model_t *, char *, int32)\00", align 1
@.str48 = private unnamed_addr constant [47 x i8] c"#Mixtures(%d) doesn't match that of means(%d)\0A\00", align 1
@.str49 = private unnamed_addr constant [49 x i8] c"#Components(%d) doesn't match that of means(%d)\0A\00", align 1
@.str50 = private unnamed_addr constant [52 x i8] c"#Vector length(%d) doesn't match that of means(%d)\0A\00", align 1
@.str51 = private unnamed_addr constant [61 x i8] c"Mixture %d: #Components(%d) doesn't match that of means(%d)\0A\00", align 1
@.str52 = private unnamed_addr constant [32 x i8] c"fread(%s) (densitydata) failed\0A\00", align 1
@.str53 = private unnamed_addr constant [29 x i8] c"%s: More data than expected\0A\00", align 1
@.str54 = private unnamed_addr constant [60 x i8] c"%d mixture Gaussians, %d components, %d streams, veclen %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @mgau_var_nzvec_floor(%struct.mgau_model_t* %g, double %floor) #0 {
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 437, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0))
  %1 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 2
  %2 = load i32* %1, align 4
  br label %3

; <label>:3                                       ; preds = %50, %0
  %m.0 = phi i32 [ 0, %0 ], [ %51, %50 ]
  %n.0 = phi i32 [ 0, %0 ], [ %n.1, %50 ]
  %4 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 0
  %5 = load i32* %4, align 4
  %6 = icmp slt i32 %m.0, %5
  br i1 %6, label %7, label %52

; <label>:7                                       ; preds = %3
  br label %8

; <label>:8                                       ; preds = %47, %7
  %c.0 = phi i32 [ 0, %7 ], [ %48, %47 ]
  %n.1 = phi i32 [ %n.0, %7 ], [ %n.4, %47 ]
  %9 = sext i32 %m.0 to i64
  %10 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %11 = load %struct.mgau_t** %10, align 8
  %12 = getelementptr inbounds %struct.mgau_t* %11, i64 %9
  %13 = getelementptr inbounds %struct.mgau_t* %12, i32 0, i32 0
  %14 = load i32* %13, align 4
  %15 = icmp slt i32 %c.0, %14
  br i1 %15, label %16, label %49

; <label>:16                                      ; preds = %8
  %17 = sext i32 %c.0 to i64
  %18 = sext i32 %m.0 to i64
  %19 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %20 = load %struct.mgau_t** %19, align 8
  %21 = getelementptr inbounds %struct.mgau_t* %20, i64 %18
  %22 = getelementptr inbounds %struct.mgau_t* %21, i32 0, i32 2
  %23 = load float*** %22, align 8
  %24 = getelementptr inbounds float** %23, i64 %17
  %25 = load float** %24, align 8
  %26 = call i32 @vector_is_zero(float* %25, i32 %2)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %46, label %28

; <label>:28                                      ; preds = %16
  br label %29

; <label>:29                                      ; preds = %43, %28
  %i.0 = phi i32 [ 0, %28 ], [ %44, %43 ]
  %n.2 = phi i32 [ %n.1, %28 ], [ %n.3, %43 ]
  %30 = icmp slt i32 %i.0, %2
  br i1 %30, label %31, label %45

; <label>:31                                      ; preds = %29
  %32 = sext i32 %i.0 to i64
  %33 = getelementptr inbounds float* %25, i64 %32
  %34 = load float* %33, align 4
  %35 = fpext float %34 to double
  %36 = fcmp olt double %35, %floor
  br i1 %36, label %37, label %42

; <label>:37                                      ; preds = %31
  %38 = fptrunc double %floor to float
  %39 = sext i32 %i.0 to i64
  %40 = getelementptr inbounds float* %25, i64 %39
  store float %38, float* %40, align 4
  %41 = add nsw i32 %n.2, 1
  br label %42

; <label>:42                                      ; preds = %37, %31
  %n.3 = phi i32 [ %41, %37 ], [ %n.2, %31 ]
  br label %43

; <label>:43                                      ; preds = %42
  %44 = add nsw i32 %i.0, 1
  br label %29

; <label>:45                                      ; preds = %29
  br label %46

; <label>:46                                      ; preds = %45, %16
  %n.4 = phi i32 [ %n.1, %16 ], [ %n.2, %45 ]
  br label %47

; <label>:47                                      ; preds = %46
  %48 = add nsw i32 %c.0, 1
  br label %8

; <label>:49                                      ; preds = %8
  br label %50

; <label>:50                                      ; preds = %49
  %51 = add nsw i32 %m.0, 1
  br label %3

; <label>:52                                      ; preds = %3
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 457, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %n.0)
  ret i32 %n.0
}

declare void @_E__pr_info_header(i8*, i64, i8*) #1

declare void @_E__pr_info(i8*, ...) #1

declare i32 @vector_is_zero(float*, i32) #1

; Function Attrs: nounwind uwtable
define %struct.mgau_model_t* @mgau_init(i8* %meanfile, i8* %varfile, double %varfloor, i8* %mixwfile, double %mixwfloor, i32 %precomp, i8* %senmgau) #0 {
  %1 = icmp ne i8* %meanfile, null
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %5

; <label>:3                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 503, i8* getelementptr inbounds ([81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %5

; <label>:5                                       ; preds = %4, %2
  %6 = icmp ne i8* %varfile, null
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %5
  br label %10

; <label>:8                                       ; preds = %5
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 504, i8* getelementptr inbounds ([81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %10

; <label>:10                                      ; preds = %9, %7
  %11 = fcmp oge double %varfloor, 0.000000e+00
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %10
  br label %15

; <label>:13                                      ; preds = %10
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 505, i8* getelementptr inbounds ([81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %15

; <label>:15                                      ; preds = %14, %12
  %16 = icmp ne i8* %mixwfile, null
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %15
  br label %20

; <label>:18                                      ; preds = %15
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 506, i8* getelementptr inbounds ([81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %20

; <label>:20                                      ; preds = %19, %17
  %21 = fcmp oge double %mixwfloor, 0.000000e+00
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %20
  br label %25

; <label>:23                                      ; preds = %20
  call void @__assert_fail(i8* getelementptr inbounds ([17 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 507, i8* getelementptr inbounds ([81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %25

; <label>:25                                      ; preds = %24, %22
  %26 = call i8* @__ckd_calloc__(i64 1, i64 48, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 509)
  %27 = bitcast i8* %26 to %struct.mgau_model_t*
  %28 = call i32 @strcmp(i8* %senmgau, i8* getelementptr inbounds ([7 x i8]* @.str9, i32 0, i32 0)) #7
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %32

; <label>:30                                      ; preds = %25
  %31 = getelementptr inbounds %struct.mgau_model_t* %27, i32 0, i32 7
  store i32 10001, i32* %31, align 4
  br label %39

; <label>:32                                      ; preds = %25
  %33 = call i32 @strcmp(i8* %senmgau, i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0)) #7
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35                                      ; preds = %32
  %36 = getelementptr inbounds %struct.mgau_model_t* %27, i32 0, i32 7
  store i32 10002, i32* %36, align 4
  br label %38

; <label>:37                                      ; preds = %32
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 516, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([42 x i8]* @.str12, i32 0, i32 0))
  br label %38

; <label>:38                                      ; preds = %37, %35
  br label %39

; <label>:39                                      ; preds = %38, %30
  %40 = call i32 @mgau_file_read(%struct.mgau_model_t* %27, i8* %meanfile, i32 1)
  %41 = call i32 @mgau_file_read(%struct.mgau_model_t* %27, i8* %varfile, i32 2)
  %42 = call i32 @mgau_mixw_read(%struct.mgau_model_t* %27, i8* %mixwfile, double %mixwfloor)
  call void @mgau_uninit_compact(%struct.mgau_model_t* %27)
  %43 = fcmp ogt double %varfloor, 0.000000e+00
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %39
  call void @mgau_var_floor(%struct.mgau_model_t* %27, double %varfloor)
  br label %45

; <label>:45                                      ; preds = %44, %39
  %46 = icmp ne i32 %precomp, 0
  br i1 %46, label %47, label %49

; <label>:47                                      ; preds = %45
  %48 = call i32 @mgau_precomp(%struct.mgau_model_t* %27)
  br label %49

; <label>:49                                      ; preds = %47, %45
  %50 = call double @logs3_to_log(i32 -939524096)
  %51 = getelementptr inbounds %struct.mgau_model_t* %27, i32 0, i32 4
  store double %50, double* %51, align 8
  ret %struct.mgau_model_t* %27
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

declare i8* @__ckd_calloc__(i64, i64, i8*, i32) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

declare void @_E__pr_header(i8*, i64, i8*) #1

declare void @_E__die_error(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal i32 @mgau_file_read(%struct.mgau_model_t* %g, i8* %file_name, i32 %type) #0 {
  %tmp = alloca i8, align 1
  %n = alloca i32, align 4
  %n_mgau = alloca i32, align 4
  %n_feat = alloca i32, align 4
  %n_density = alloca i32, align 4
  %byteswap = alloca i32, align 4
  %argname = alloca i8**, align 8
  %argval = alloca i8**, align 8
  %chksum = alloca i32, align 4
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 96, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([36 x i8]* @.str37, i32 0, i32 0), i8* %file_name)
  %1 = call %struct._IO_FILE* @_myfopen(i8* %file_name, i8* getelementptr inbounds ([3 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 98)
  %2 = call i32 @bio_readhdr(%struct._IO_FILE* %1, i8*** %argname, i8*** %argval, i32* %byteswap)
  %3 = icmp slt i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 102, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([24 x i8]* @.str21, i32 0, i32 0), i8* %file_name)
  br label %5

; <label>:5                                       ; preds = %4, %0
  br label %6

; <label>:6                                       ; preds = %42, %5
  %i.0 = phi i32 [ 0, %5 ], [ %43, %42 ]
  %chksum_present.0 = phi i32 [ 0, %5 ], [ %chksum_present.2, %42 ]
  %7 = sext i32 %i.0 to i64
  %8 = load i8*** %argname, align 8
  %9 = getelementptr inbounds i8** %8, i64 %7
  %10 = load i8** %9, align 8
  %11 = icmp ne i8* %10, null
  br i1 %11, label %12, label %44

; <label>:12                                      ; preds = %6
  %13 = sext i32 %i.0 to i64
  %14 = load i8*** %argname, align 8
  %15 = getelementptr inbounds i8** %14, i64 %13
  %16 = load i8** %15, align 8
  %17 = call i32 @strcmp(i8* %16, i8* getelementptr inbounds ([8 x i8]* @.str22, i32 0, i32 0)) #7
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %32

; <label>:19                                      ; preds = %12
  %20 = sext i32 %i.0 to i64
  %21 = load i8*** %argval, align 8
  %22 = getelementptr inbounds i8** %21, i64 %20
  %23 = load i8** %22, align 8
  %24 = call i32 @strcmp(i8* %23, i8* getelementptr inbounds ([4 x i8]* @.str23, i32 0, i32 0)) #7
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %31

; <label>:26                                      ; preds = %19
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 109, i8* getelementptr inbounds ([8 x i8]* @.str24, i32 0, i32 0))
  %27 = sext i32 %i.0 to i64
  %28 = load i8*** %argval, align 8
  %29 = getelementptr inbounds i8** %28, i64 %27
  %30 = load i8** %29, align 8
  call void (i8*, ...)* @_E__pr_warn(i8* getelementptr inbounds ([40 x i8]* @.str25, i32 0, i32 0), i8* %file_name, i8* %30, i8* getelementptr inbounds ([4 x i8]* @.str23, i32 0, i32 0))
  br label %31

; <label>:31                                      ; preds = %26, %19
  br label %41

; <label>:32                                      ; preds = %12
  %33 = sext i32 %i.0 to i64
  %34 = load i8*** %argname, align 8
  %35 = getelementptr inbounds i8** %34, i64 %33
  %36 = load i8** %35, align 8
  %37 = call i32 @strcmp(i8* %36, i8* getelementptr inbounds ([8 x i8]* @.str26, i32 0, i32 0)) #7
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %32
  br label %40

; <label>:40                                      ; preds = %39, %32
  %chksum_present.1 = phi i32 [ 1, %39 ], [ %chksum_present.0, %32 ]
  br label %41

; <label>:41                                      ; preds = %40, %31
  %chksum_present.2 = phi i32 [ %chksum_present.0, %31 ], [ %chksum_present.1, %40 ]
  br label %42

; <label>:42                                      ; preds = %41
  %43 = add nsw i32 %i.0, 1
  br label %6

; <label>:44                                      ; preds = %6
  %45 = load i8*** %argname, align 8
  %46 = load i8*** %argval, align 8
  call void @bio_hdrarg_free(i8** %45, i8** %46)
  store i8** null, i8*** %argval, align 8
  store i8** null, i8*** %argname, align 8
  store i32 0, i32* %chksum, align 4
  %47 = bitcast i32* %n_mgau to i8*
  %48 = load i32* %byteswap, align 4
  %49 = call i32 @bio_fread(i8* %47, i32 4, i32 1, %struct._IO_FILE* %1, i32 %48, i32* %chksum)
  %50 = icmp ne i32 %49, 1
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %44
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 122, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([31 x i8]* @.str38, i32 0, i32 0), i8* %file_name)
  br label %52

; <label>:52                                      ; preds = %51, %44
  %53 = load i32* %n_mgau, align 4
  %54 = icmp sge i32 %53, 32766
  br i1 %54, label %55, label %57

; <label>:55                                      ; preds = %52
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 124, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %56 = load i32* %n_mgau, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([71 x i8]* @.str39, i32 0, i32 0), i8* %file_name, i32 %56, i32 32766)
  br label %57

; <label>:57                                      ; preds = %55, %52
  %58 = bitcast i32* %n_feat to i8*
  %59 = load i32* %byteswap, align 4
  %60 = call i32 @bio_fread(i8* %58, i32 4, i32 1, %struct._IO_FILE* %1, i32 %59, i32* %chksum)
  %61 = icmp ne i32 %60, 1
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %57
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 130, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([30 x i8]* @.str40, i32 0, i32 0), i8* %file_name)
  br label %63

; <label>:63                                      ; preds = %62, %57
  %64 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 7
  %65 = load i32* %64, align 4
  %66 = icmp eq i32 %65, 10001
  br i1 %66, label %67, label %73

; <label>:67                                      ; preds = %63
  %68 = load i32* %n_feat, align 4
  %69 = icmp ne i32 %68, 1
  br i1 %69, label %70, label %72

; <label>:70                                      ; preds = %67
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 134, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %71 = load i32* %n_feat, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([46 x i8]* @.str28, i32 0, i32 0), i32 %71)
  br label %72

; <label>:72                                      ; preds = %70, %67
  br label %84

; <label>:73                                      ; preds = %63
  %74 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 7
  %75 = load i32* %74, align 4
  %76 = icmp eq i32 %75, 10002
  br i1 %76, label %77, label %83

; <label>:77                                      ; preds = %73
  %78 = load i32* %n_feat, align 4
  %79 = icmp ne i32 %78, 4
  br i1 %79, label %80, label %82

; <label>:80                                      ; preds = %77
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 137, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %81 = load i32* %n_feat, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([51 x i8]* @.str41, i32 0, i32 0), i32 %81)
  br label %82

; <label>:82                                      ; preds = %80, %77
  br label %83

; <label>:83                                      ; preds = %82, %73
  br label %84

; <label>:84                                      ; preds = %83, %72
  %85 = bitcast i32* %n_density to i8*
  %86 = load i32* %byteswap, align 4
  %87 = call i32 @bio_fread(i8* %85, i32 4, i32 1, %struct._IO_FILE* %1, i32 %86, i32* %chksum)
  %88 = icmp ne i32 %87, 1
  br i1 %88, label %89, label %90

; <label>:89                                      ; preds = %84
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 142, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([38 x i8]* @.str42, i32 0, i32 0), i8* %file_name)
  br label %90

; <label>:90                                      ; preds = %89, %84
  %91 = load i32* %n_feat, align 4
  %92 = sext i32 %91 to i64
  %93 = call i8* @__ckd_calloc__(i64 %92, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 146)
  %94 = bitcast i8* %93 to i32*
  %95 = bitcast i32* %94 to i8*
  %96 = load i32* %n_feat, align 4
  %97 = load i32* %byteswap, align 4
  %98 = call i32 @bio_fread(i8* %95, i32 4, i32 %96, %struct._IO_FILE* %1, i32 %97, i32* %chksum)
  %99 = load i32* %n_feat, align 4
  %100 = icmp ne i32 %98, %99
  br i1 %100, label %101, label %102

; <label>:101                                     ; preds = %90
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 149, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([36 x i8]* @.str43, i32 0, i32 0), i8* %file_name)
  br label %102

; <label>:102                                     ; preds = %101, %90
  br label %103

; <label>:103                                     ; preds = %111, %102
  %i.1 = phi i32 [ 0, %102 ], [ %112, %111 ]
  %blk.0 = phi i32 [ 0, %102 ], [ %110, %111 ]
  %104 = load i32* %n_feat, align 4
  %105 = icmp slt i32 %i.1, %104
  br i1 %105, label %106, label %113

; <label>:106                                     ; preds = %103
  %107 = sext i32 %i.1 to i64
  %108 = getelementptr inbounds i32* %94, i64 %107
  %109 = load i32* %108, align 4
  %110 = add nsw i32 %blk.0, %109
  br label %111

; <label>:111                                     ; preds = %106
  %112 = add nsw i32 %i.1, 1
  br label %103

; <label>:113                                     ; preds = %103
  %114 = bitcast i32* %n to i8*
  %115 = load i32* %byteswap, align 4
  %116 = call i32 @bio_fread(i8* %114, i32 4, i32 1, %struct._IO_FILE* %1, i32 %115, i32* %chksum)
  %117 = icmp ne i32 %116, 1
  br i1 %117, label %118, label %119

; <label>:118                                     ; preds = %113
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 159, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([34 x i8]* @.str44, i32 0, i32 0), i8* %file_name)
  br label %119

; <label>:119                                     ; preds = %118, %113
  %120 = load i32* %n, align 4
  %121 = load i32* %n_mgau, align 4
  %122 = load i32* %n_density, align 4
  %123 = mul nsw i32 %121, %122
  %124 = mul nsw i32 %123, %blk.0
  %125 = icmp ne i32 %120, %124
  br i1 %125, label %126, label %130

; <label>:126                                     ; preds = %119
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 162, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %127 = load i32* %n, align 4
  %128 = load i32* %n_mgau, align 4
  %129 = load i32* %n_density, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([58 x i8]* @.str45, i32 0, i32 0), i8* %file_name, i32 %127, i32 %128, i32 %129, i32 %blk.0)
  br label %130

; <label>:130                                     ; preds = %126, %119
  %131 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 7
  %132 = load i32* %131, align 4
  %133 = icmp eq i32 %132, 10002
  br i1 %133, label %134, label %135

; <label>:134                                     ; preds = %130
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 167, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([50 x i8]* @.str46, i32 0, i32 0))
  br label %135

; <label>:135                                     ; preds = %134, %130
  %136 = icmp eq i32 %type, 1
  br i1 %136, label %137, label %203

; <label>:137                                     ; preds = %135
  %138 = load i32* %n_mgau, align 4
  %139 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 0
  store i32 %138, i32* %139, align 4
  %140 = load i32* %n_density, align 4
  %141 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 1
  store i32 %140, i32* %141, align 4
  %142 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 2
  store i32 %blk.0, i32* %142, align 4
  %143 = load i32* %n_mgau, align 4
  %144 = sext i32 %143 to i64
  %145 = call i8* @__ckd_calloc__(i64 %144, i64 40, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 175)
  %146 = bitcast i8* %145 to %struct.mgau_t*
  %147 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  store %struct.mgau_t* %146, %struct.mgau_t** %147, align 8
  %148 = load i32* %n, align 4
  %149 = sext i32 %148 to i64
  %150 = call i8* @__ckd_calloc__(i64 %149, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 177)
  %151 = bitcast i8* %150 to float*
  %152 = load i32* %n_mgau, align 4
  %153 = load i32* %n_density, align 4
  %154 = mul nsw i32 %152, %153
  %155 = sext i32 %154 to i64
  %156 = call i8* @__ckd_calloc__(i64 %155, i64 8, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 178)
  %157 = bitcast i8* %156 to float**
  br label %158

; <label>:158                                     ; preds = %193, %137
  %i.2 = phi i32 [ 0, %137 ], [ %194, %193 ]
  %buf.0 = phi float* [ %151, %137 ], [ %buf.1, %193 ]
  %pbuf.0 = phi float** [ %157, %137 ], [ %192, %193 ]
  %159 = load i32* %n_mgau, align 4
  %160 = icmp slt i32 %i.2, %159
  br i1 %160, label %161, label %195

; <label>:161                                     ; preds = %158
  %162 = load i32* %n_density, align 4
  %163 = sext i32 %i.2 to i64
  %164 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %165 = load %struct.mgau_t** %164, align 8
  %166 = getelementptr inbounds %struct.mgau_t* %165, i64 %163
  %167 = getelementptr inbounds %struct.mgau_t* %166, i32 0, i32 0
  store i32 %162, i32* %167, align 4
  %168 = sext i32 %i.2 to i64
  %169 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %170 = load %struct.mgau_t** %169, align 8
  %171 = getelementptr inbounds %struct.mgau_t* %170, i64 %168
  %172 = getelementptr inbounds %struct.mgau_t* %171, i32 0, i32 1
  store float** %pbuf.0, float*** %172, align 8
  br label %173

; <label>:173                                     ; preds = %187, %161
  %k.0 = phi i32 [ 0, %161 ], [ %188, %187 ]
  %buf.1 = phi float* [ %buf.0, %161 ], [ %186, %187 ]
  %174 = load i32* %n_density, align 4
  %175 = icmp slt i32 %k.0, %174
  br i1 %175, label %176, label %189

; <label>:176                                     ; preds = %173
  %177 = sext i32 %k.0 to i64
  %178 = sext i32 %i.2 to i64
  %179 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %180 = load %struct.mgau_t** %179, align 8
  %181 = getelementptr inbounds %struct.mgau_t* %180, i64 %178
  %182 = getelementptr inbounds %struct.mgau_t* %181, i32 0, i32 1
  %183 = load float*** %182, align 8
  %184 = getelementptr inbounds float** %183, i64 %177
  store float* %buf.1, float** %184, align 8
  %185 = sext i32 %blk.0 to i64
  %186 = getelementptr inbounds float* %buf.1, i64 %185
  br label %187

; <label>:187                                     ; preds = %176
  %188 = add nsw i32 %k.0, 1
  br label %173

; <label>:189                                     ; preds = %173
  %190 = load i32* %n_density, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float** %pbuf.0, i64 %191
  br label %193

; <label>:193                                     ; preds = %189
  %194 = add nsw i32 %i.2, 1
  br label %158

; <label>:195                                     ; preds = %158
  %196 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %197 = load %struct.mgau_t** %196, align 8
  %198 = getelementptr inbounds %struct.mgau_t* %197, i64 0
  %199 = getelementptr inbounds %struct.mgau_t* %198, i32 0, i32 1
  %200 = load float*** %199, align 8
  %201 = getelementptr inbounds float** %200, i64 0
  %202 = load float** %201, align 8
  br label %321

; <label>:203                                     ; preds = %135
  %204 = icmp eq i32 %type, 2
  br i1 %204, label %205, label %206

; <label>:205                                     ; preds = %203
  br label %208

; <label>:206                                     ; preds = %203
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8]* @.str47, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 195, i8* getelementptr inbounds ([52 x i8]* @__PRETTY_FUNCTION__.mgau_file_read, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %208

; <label>:208                                     ; preds = %207, %205
  %209 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 0
  %210 = load i32* %209, align 4
  %211 = load i32* %n_mgau, align 4
  %212 = icmp ne i32 %210, %211
  br i1 %212, label %213, label %217

; <label>:213                                     ; preds = %208
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 198, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %214 = load i32* %n_mgau, align 4
  %215 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 0
  %216 = load i32* %215, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([47 x i8]* @.str48, i32 0, i32 0), i32 %214, i32 %216)
  br label %217

; <label>:217                                     ; preds = %213, %208
  %218 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 1
  %219 = load i32* %218, align 4
  %220 = load i32* %n_density, align 4
  %221 = icmp ne i32 %219, %220
  br i1 %221, label %222, label %226

; <label>:222                                     ; preds = %217
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 200, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %223 = load i32* %n_density, align 4
  %224 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 1
  %225 = load i32* %224, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([49 x i8]* @.str49, i32 0, i32 0), i32 %223, i32 %225)
  br label %226

; <label>:226                                     ; preds = %222, %217
  %227 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 2
  %228 = load i32* %227, align 4
  %229 = icmp ne i32 %228, %blk.0
  br i1 %229, label %230, label %233

; <label>:230                                     ; preds = %226
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 202, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %231 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 2
  %232 = load i32* %231, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([52 x i8]* @.str50, i32 0, i32 0), i32 %blk.0, i32 %232)
  br label %233

; <label>:233                                     ; preds = %230, %226
  %234 = load i32* %n, align 4
  %235 = sext i32 %234 to i64
  %236 = call i8* @__ckd_calloc__(i64 %235, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 204)
  %237 = bitcast i8* %236 to float*
  %238 = load i32* %n_mgau, align 4
  %239 = load i32* %n_density, align 4
  %240 = mul nsw i32 %238, %239
  %241 = sext i32 %240 to i64
  %242 = call i8* @__ckd_calloc__(i64 %241, i64 8, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 205)
  %243 = bitcast i8* %242 to float**
  br label %244

; <label>:244                                     ; preds = %290, %233
  %i.3 = phi i32 [ 0, %233 ], [ %291, %290 ]
  %buf.2 = phi float* [ %237, %233 ], [ %buf.3, %290 ]
  %pbuf.1 = phi float** [ %243, %233 ], [ %289, %290 ]
  %245 = load i32* %n_mgau, align 4
  %246 = icmp slt i32 %i.3, %245
  br i1 %246, label %247, label %292

; <label>:247                                     ; preds = %244
  %248 = sext i32 %i.3 to i64
  %249 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %250 = load %struct.mgau_t** %249, align 8
  %251 = getelementptr inbounds %struct.mgau_t* %250, i64 %248
  %252 = getelementptr inbounds %struct.mgau_t* %251, i32 0, i32 0
  %253 = load i32* %252, align 4
  %254 = load i32* %n_density, align 4
  %255 = icmp ne i32 %253, %254
  br i1 %255, label %256, label %264

; <label>:256                                     ; preds = %247
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 210, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %257 = load i32* %n_density, align 4
  %258 = sext i32 %i.3 to i64
  %259 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %260 = load %struct.mgau_t** %259, align 8
  %261 = getelementptr inbounds %struct.mgau_t* %260, i64 %258
  %262 = getelementptr inbounds %struct.mgau_t* %261, i32 0, i32 0
  %263 = load i32* %262, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([61 x i8]* @.str51, i32 0, i32 0), i32 %i.3, i32 %257, i32 %263)
  br label %264

; <label>:264                                     ; preds = %256, %247
  %265 = sext i32 %i.3 to i64
  %266 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %267 = load %struct.mgau_t** %266, align 8
  %268 = getelementptr inbounds %struct.mgau_t* %267, i64 %265
  %269 = getelementptr inbounds %struct.mgau_t* %268, i32 0, i32 2
  store float** %pbuf.1, float*** %269, align 8
  br label %270

; <label>:270                                     ; preds = %284, %264
  %k.1 = phi i32 [ 0, %264 ], [ %285, %284 ]
  %buf.3 = phi float* [ %buf.2, %264 ], [ %283, %284 ]
  %271 = load i32* %n_density, align 4
  %272 = icmp slt i32 %k.1, %271
  br i1 %272, label %273, label %286

; <label>:273                                     ; preds = %270
  %274 = sext i32 %k.1 to i64
  %275 = sext i32 %i.3 to i64
  %276 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %277 = load %struct.mgau_t** %276, align 8
  %278 = getelementptr inbounds %struct.mgau_t* %277, i64 %275
  %279 = getelementptr inbounds %struct.mgau_t* %278, i32 0, i32 2
  %280 = load float*** %279, align 8
  %281 = getelementptr inbounds float** %280, i64 %274
  store float* %buf.3, float** %281, align 8
  %282 = sext i32 %blk.0 to i64
  %283 = getelementptr inbounds float* %buf.3, i64 %282
  br label %284

; <label>:284                                     ; preds = %273
  %285 = add nsw i32 %k.1, 1
  br label %270

; <label>:286                                     ; preds = %270
  %287 = load i32* %n_density, align 4
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds float** %pbuf.1, i64 %288
  br label %290

; <label>:290                                     ; preds = %286
  %291 = add nsw i32 %i.3, 1
  br label %244

; <label>:292                                     ; preds = %244
  %293 = load i32* %n_mgau, align 4
  %294 = load i32* %n_density, align 4
  %295 = mul nsw i32 %293, %294
  %296 = sext i32 %295 to i64
  %297 = call i8* @__ckd_calloc__(i64 %296, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 224)
  %298 = bitcast i8* %297 to float*
  br label %299

; <label>:299                                     ; preds = %311, %292
  %i.4 = phi i32 [ 0, %292 ], [ %312, %311 ]
  %buf.4 = phi float* [ %298, %292 ], [ %310, %311 ]
  %300 = load i32* %n_mgau, align 4
  %301 = icmp slt i32 %i.4, %300
  br i1 %301, label %302, label %313

; <label>:302                                     ; preds = %299
  %303 = sext i32 %i.4 to i64
  %304 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %305 = load %struct.mgau_t** %304, align 8
  %306 = getelementptr inbounds %struct.mgau_t* %305, i64 %303
  %307 = getelementptr inbounds %struct.mgau_t* %306, i32 0, i32 3
  store float* %buf.4, float** %307, align 8
  %308 = load i32* %n_density, align 4
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds float* %buf.4, i64 %309
  br label %311

; <label>:311                                     ; preds = %302
  %312 = add nsw i32 %i.4, 1
  br label %299

; <label>:313                                     ; preds = %299
  %314 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %315 = load %struct.mgau_t** %314, align 8
  %316 = getelementptr inbounds %struct.mgau_t* %315, i64 0
  %317 = getelementptr inbounds %struct.mgau_t* %316, i32 0, i32 2
  %318 = load float*** %317, align 8
  %319 = getelementptr inbounds float** %318, i64 0
  %320 = load float** %319, align 8
  br label %321

; <label>:321                                     ; preds = %313, %195
  %buf.5 = phi float* [ %202, %195 ], [ %320, %313 ]
  %322 = bitcast float* %buf.5 to i8*
  %323 = load i32* %n, align 4
  %324 = load i32* %byteswap, align 4
  %325 = call i32 @bio_fread(i8* %322, i32 4, i32 %323, %struct._IO_FILE* %1, i32 %324, i32* %chksum)
  %326 = load i32* %n, align 4
  %327 = icmp ne i32 %325, %326
  br i1 %327, label %328, label %329

; <label>:328                                     ; preds = %321
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 236, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([32 x i8]* @.str52, i32 0, i32 0), i8* %file_name)
  br label %329

; <label>:329                                     ; preds = %328, %321
  %330 = call double @log_to_logs3_factor()
  %331 = icmp ne i32 %chksum_present.0, 0
  br i1 %331, label %332, label %335

; <label>:332                                     ; preds = %329
  %333 = load i32* %byteswap, align 4
  %334 = load i32* %chksum, align 4
  call void @bio_verify_chksum(%struct._IO_FILE* %1, i32 %333, i32 %334)
  br label %335

; <label>:335                                     ; preds = %332, %329
  %336 = call i64 @fread(i8* %tmp, i64 1, i64 1, %struct._IO_FILE* %1)
  %337 = icmp eq i64 %336, 1
  br i1 %337, label %338, label %339

; <label>:338                                     ; preds = %335
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 244, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([29 x i8]* @.str53, i32 0, i32 0), i8* %file_name)
  br label %339

; <label>:339                                     ; preds = %338, %335
  %340 = call i32 @fclose(%struct._IO_FILE* %1)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 248, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  %341 = load i32* %n_mgau, align 4
  %342 = load i32* %n_density, align 4
  %343 = load i32* %n_feat, align 4
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([60 x i8]* @.str54, i32 0, i32 0), i32 %341, i32 %342, i32 %343, i32 %blk.0)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @mgau_mixw_read(%struct.mgau_model_t* %g, i8* %file_name, double %mixwfloor) #0 {
  %argname = alloca i8**, align 8
  %argval = alloca i8**, align 8
  %eofchk = alloca i8, align 1
  %byteswap = alloca i32, align 4
  %chksum = alloca i32, align 4
  %n = alloca i32, align 4
  %n_mgau = alloca i32, align 4
  %n_feat = alloca i32, align 4
  %n_comp = alloca i32, align 4
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 269, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([35 x i8]* @.str19, i32 0, i32 0), i8* %file_name)
  %1 = call %struct._IO_FILE* @_myfopen(i8* %file_name, i8* getelementptr inbounds ([3 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 271)
  %2 = call i32 @bio_readhdr(%struct._IO_FILE* %1, i8*** %argname, i8*** %argval, i32* %byteswap)
  %3 = icmp slt i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 275, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([24 x i8]* @.str21, i32 0, i32 0), i8* %file_name)
  br label %5

; <label>:5                                       ; preds = %4, %0
  br label %6

; <label>:6                                       ; preds = %42, %5
  %chksum_present.0 = phi i32 [ 0, %5 ], [ %chksum_present.2, %42 ]
  %i.0 = phi i32 [ 0, %5 ], [ %43, %42 ]
  %7 = sext i32 %i.0 to i64
  %8 = load i8*** %argname, align 8
  %9 = getelementptr inbounds i8** %8, i64 %7
  %10 = load i8** %9, align 8
  %11 = icmp ne i8* %10, null
  br i1 %11, label %12, label %44

; <label>:12                                      ; preds = %6
  %13 = sext i32 %i.0 to i64
  %14 = load i8*** %argname, align 8
  %15 = getelementptr inbounds i8** %14, i64 %13
  %16 = load i8** %15, align 8
  %17 = call i32 @strcmp(i8* %16, i8* getelementptr inbounds ([8 x i8]* @.str22, i32 0, i32 0)) #7
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %32

; <label>:19                                      ; preds = %12
  %20 = sext i32 %i.0 to i64
  %21 = load i8*** %argval, align 8
  %22 = getelementptr inbounds i8** %21, i64 %20
  %23 = load i8** %22, align 8
  %24 = call i32 @strcmp(i8* %23, i8* getelementptr inbounds ([4 x i8]* @.str23, i32 0, i32 0)) #7
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %31

; <label>:26                                      ; preds = %19
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 282, i8* getelementptr inbounds ([8 x i8]* @.str24, i32 0, i32 0))
  %27 = sext i32 %i.0 to i64
  %28 = load i8*** %argval, align 8
  %29 = getelementptr inbounds i8** %28, i64 %27
  %30 = load i8** %29, align 8
  call void (i8*, ...)* @_E__pr_warn(i8* getelementptr inbounds ([40 x i8]* @.str25, i32 0, i32 0), i8* %file_name, i8* %30, i8* getelementptr inbounds ([4 x i8]* @.str23, i32 0, i32 0))
  br label %31

; <label>:31                                      ; preds = %26, %19
  br label %41

; <label>:32                                      ; preds = %12
  %33 = sext i32 %i.0 to i64
  %34 = load i8*** %argname, align 8
  %35 = getelementptr inbounds i8** %34, i64 %33
  %36 = load i8** %35, align 8
  %37 = call i32 @strcmp(i8* %36, i8* getelementptr inbounds ([8 x i8]* @.str26, i32 0, i32 0)) #7
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %32
  br label %40

; <label>:40                                      ; preds = %39, %32
  %chksum_present.1 = phi i32 [ 1, %39 ], [ %chksum_present.0, %32 ]
  br label %41

; <label>:41                                      ; preds = %40, %31
  %chksum_present.2 = phi i32 [ %chksum_present.0, %31 ], [ %chksum_present.1, %40 ]
  br label %42

; <label>:42                                      ; preds = %41
  %43 = add nsw i32 %i.0, 1
  br label %6

; <label>:44                                      ; preds = %6
  %45 = load i8*** %argname, align 8
  %46 = load i8*** %argval, align 8
  call void @bio_hdrarg_free(i8** %45, i8** %46)
  store i8** null, i8*** %argval, align 8
  store i8** null, i8*** %argname, align 8
  store i32 0, i32* %chksum, align 4
  %47 = bitcast i32* %n_mgau to i8*
  %48 = load i32* %byteswap, align 4
  %49 = call i32 @bio_fread(i8* %47, i32 4, i32 1, %struct._IO_FILE* %1, i32 %48, i32* %chksum)
  %50 = icmp ne i32 %49, 1
  br i1 %50, label %66, label %51

; <label>:51                                      ; preds = %44
  %52 = bitcast i32* %n_feat to i8*
  %53 = load i32* %byteswap, align 4
  %54 = call i32 @bio_fread(i8* %52, i32 4, i32 1, %struct._IO_FILE* %1, i32 %53, i32* %chksum)
  %55 = icmp ne i32 %54, 1
  br i1 %55, label %66, label %56

; <label>:56                                      ; preds = %51
  %57 = bitcast i32* %n_comp to i8*
  %58 = load i32* %byteswap, align 4
  %59 = call i32 @bio_fread(i8* %57, i32 4, i32 1, %struct._IO_FILE* %1, i32 %58, i32* %chksum)
  %60 = icmp ne i32 %59, 1
  br i1 %60, label %66, label %61

; <label>:61                                      ; preds = %56
  %62 = bitcast i32* %n to i8*
  %63 = load i32* %byteswap, align 4
  %64 = call i32 @bio_fread(i8* %62, i32 4, i32 1, %struct._IO_FILE* %1, i32 %63, i32* %chksum)
  %65 = icmp ne i32 %64, 1
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %61, %56, %51, %44
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 298, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([34 x i8]* @.str27, i32 0, i32 0), i8* %file_name)
  br label %67

; <label>:67                                      ; preds = %66, %61
  %68 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 7
  %69 = load i32* %68, align 4
  %70 = icmp eq i32 %69, 10001
  br i1 %70, label %71, label %77

; <label>:71                                      ; preds = %67
  %72 = load i32* %n_feat, align 4
  %73 = icmp ne i32 %72, 1
  br i1 %73, label %74, label %76

; <label>:74                                      ; preds = %71
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 302, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %75 = load i32* %n_feat, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([46 x i8]* @.str28, i32 0, i32 0), i32 %75)
  br label %76

; <label>:76                                      ; preds = %74, %71
  br label %89

; <label>:77                                      ; preds = %67
  %78 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 7
  %79 = load i32* %78, align 4
  %80 = icmp eq i32 %79, 10002
  br i1 %80, label %81, label %87

; <label>:81                                      ; preds = %77
  %82 = load i32* %n_feat, align 4
  %83 = icmp ne i32 %82, 4
  br i1 %83, label %84, label %86

; <label>:84                                      ; preds = %81
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 305, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %85 = load i32* %n_feat, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([51 x i8]* @.str29, i32 0, i32 0), i32 %85)
  br label %86

; <label>:86                                      ; preds = %84, %81
  br label %88

; <label>:87                                      ; preds = %77
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 307, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([116 x i8]* @.str30, i32 0, i32 0))
  br label %88

; <label>:88                                      ; preds = %87, %86
  br label %89

; <label>:89                                      ; preds = %88, %76
  %90 = load i32* %n, align 4
  %91 = load i32* %n_mgau, align 4
  %92 = load i32* %n_comp, align 4
  %93 = mul nsw i32 %91, %92
  %94 = icmp ne i32 %90, %93
  br i1 %94, label %95, label %98

; <label>:95                                      ; preds = %89
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 311, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %96 = load i32* %n_mgau, align 4
  %97 = load i32* %n_comp, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([60 x i8]* @.str31, i32 0, i32 0), i8* %file_name, i32 %i.0, i32 %96, i32 %97)
  br label %98

; <label>:98                                      ; preds = %95, %89
  %99 = load i32* %n_mgau, align 4
  %100 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 0
  %101 = load i32* %100, align 4
  %102 = icmp ne i32 %99, %101
  br i1 %102, label %103, label %107

; <label>:103                                     ; preds = %98
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 315, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %104 = load i32* %n_mgau, align 4
  %105 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 0
  %106 = load i32* %105, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([66 x i8]* @.str32, i32 0, i32 0), i32 %104, i32 %106)
  br label %107

; <label>:107                                     ; preds = %103, %98
  %108 = load i32* %n_mgau, align 4
  %109 = load i32* %n_comp, align 4
  %110 = mul nsw i32 %108, %109
  %111 = sext i32 %110 to i64
  %112 = call i8* @__ckd_calloc__(i64 %111, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 318)
  %113 = bitcast i8* %112 to i32*
  br label %114

; <label>:114                                     ; preds = %148, %107
  %buf.0 = phi i32* [ %113, %107 ], [ %147, %148 ]
  %i.1 = phi i32 [ 0, %107 ], [ %149, %148 ]
  %115 = load i32* %n_mgau, align 4
  %116 = icmp slt i32 %i.1, %115
  br i1 %116, label %117, label %150

; <label>:117                                     ; preds = %114
  %118 = load i32* %n_comp, align 4
  %119 = sext i32 %i.1 to i64
  %120 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %121 = load %struct.mgau_t** %120, align 8
  %122 = getelementptr inbounds %struct.mgau_t* %121, i64 %119
  %123 = getelementptr inbounds %struct.mgau_t* %122, i32 0, i32 0
  %124 = load i32* %123, align 4
  %125 = icmp ne i32 %118, %124
  br i1 %125, label %126, label %134

; <label>:126                                     ; preds = %117
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 321, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %127 = load i32* %n_comp, align 4
  %128 = sext i32 %i.1 to i64
  %129 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %130 = load %struct.mgau_t** %129, align 8
  %131 = getelementptr inbounds %struct.mgau_t* %130, i64 %128
  %132 = getelementptr inbounds %struct.mgau_t* %131, i32 0, i32 0
  %133 = load i32* %132, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([65 x i8]* @.str33, i32 0, i32 0), i32 %i.1, i32 %127, i32 %133)
  br label %134

; <label>:134                                     ; preds = %126, %117
  %135 = sext i32 %i.1 to i64
  %136 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %137 = load %struct.mgau_t** %136, align 8
  %138 = getelementptr inbounds %struct.mgau_t* %137, i64 %135
  %139 = getelementptr inbounds %struct.mgau_t* %138, i32 0, i32 4
  store i32* %buf.0, i32** %139, align 8
  %140 = sext i32 %i.1 to i64
  %141 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %142 = load %struct.mgau_t** %141, align 8
  %143 = getelementptr inbounds %struct.mgau_t* %142, i64 %140
  %144 = getelementptr inbounds %struct.mgau_t* %143, i32 0, i32 0
  %145 = load i32* %144, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32* %buf.0, i64 %146
  br label %148

; <label>:148                                     ; preds = %134
  %149 = add nsw i32 %i.1, 1
  br label %114

; <label>:150                                     ; preds = %114
  %151 = load i32* %n_comp, align 4
  %152 = sext i32 %151 to i64
  %153 = call i8* @__ckd_calloc__(i64 %152, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 329)
  %154 = bitcast i8* %153 to float*
  br label %155

; <label>:155                                     ; preds = %221, %150
  %i.2 = phi i32 [ 0, %150 ], [ %222, %221 ]
  %n_err.0 = phi i32 [ 0, %150 ], [ %n_err.1, %221 ]
  %156 = load i32* %n_mgau, align 4
  %157 = icmp slt i32 %i.2, %156
  br i1 %157, label %158, label %223

; <label>:158                                     ; preds = %155
  %159 = bitcast float* %154 to i8*
  %160 = load i32* %n_comp, align 4
  %161 = load i32* %byteswap, align 4
  %162 = call i32 @bio_fread(i8* %159, i32 4, i32 %160, %struct._IO_FILE* %1, i32 %161, i32* %chksum)
  %163 = load i32* %n_comp, align 4
  %164 = icmp ne i32 %162, %163
  br i1 %164, label %165, label %166

; <label>:165                                     ; preds = %158
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 335, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([34 x i8]* @.str34, i32 0, i32 0), i8* %file_name)
  br label %166

; <label>:166                                     ; preds = %165, %158
  %167 = load i32* %n_comp, align 4
  %168 = call i32 @vector_is_zero(float* %154, i32 %167)
  %169 = icmp ne i32 %168, 0
  br i1 %169, label %170, label %187

; <label>:170                                     ; preds = %166
  %171 = add nsw i32 %n_err.0, 1
  br label %172

; <label>:172                                     ; preds = %184, %170
  %j.0 = phi i32 [ 0, %170 ], [ %185, %184 ]
  %173 = load i32* %n_comp, align 4
  %174 = icmp slt i32 %j.0, %173
  br i1 %174, label %175, label %186

; <label>:175                                     ; preds = %172
  %176 = sext i32 %j.0 to i64
  %177 = sext i32 %i.2 to i64
  %178 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %179 = load %struct.mgau_t** %178, align 8
  %180 = getelementptr inbounds %struct.mgau_t* %179, i64 %177
  %181 = getelementptr inbounds %struct.mgau_t* %180, i32 0, i32 4
  %182 = load i32** %181, align 8
  %183 = getelementptr inbounds i32* %182, i64 %176
  store i32 -939524096, i32* %183, align 4
  br label %184

; <label>:184                                     ; preds = %175
  %185 = add nsw i32 %j.0, 1
  br label %172

; <label>:186                                     ; preds = %172
  br label %220

; <label>:187                                     ; preds = %166
  %188 = load i32* %n_comp, align 4
  call void @vector_nz_floor(float* %154, i32 %188, double %mixwfloor)
  %189 = load i32* %n_comp, align 4
  %190 = call double @vector_sum_norm(float* %154, i32 %189)
  br label %191

; <label>:191                                     ; preds = %217, %187
  %j.1 = phi i32 [ 0, %187 ], [ %218, %217 ]
  %192 = load i32* %n_comp, align 4
  %193 = icmp slt i32 %j.1, %192
  br i1 %193, label %194, label %219

; <label>:194                                     ; preds = %191
  %195 = sext i32 %j.1 to i64
  %196 = getelementptr inbounds float* %154, i64 %195
  %197 = load float* %196, align 4
  %198 = fpext float %197 to double
  %199 = fcmp une double %198, 0.000000e+00
  br i1 %199, label %200, label %206

; <label>:200                                     ; preds = %194
  %201 = sext i32 %j.1 to i64
  %202 = getelementptr inbounds float* %154, i64 %201
  %203 = load float* %202, align 4
  %204 = fpext float %203 to double
  %205 = call i32 @logs3(double %204)
  br label %207

; <label>:206                                     ; preds = %194
  br label %207

; <label>:207                                     ; preds = %206, %200
  %208 = phi i32 [ %205, %200 ], [ -939524096, %206 ]
  %209 = sext i32 %j.1 to i64
  %210 = sext i32 %i.2 to i64
  %211 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %212 = load %struct.mgau_t** %211, align 8
  %213 = getelementptr inbounds %struct.mgau_t* %212, i64 %210
  %214 = getelementptr inbounds %struct.mgau_t* %213, i32 0, i32 4
  %215 = load i32** %214, align 8
  %216 = getelementptr inbounds i32* %215, i64 %209
  store i32 %208, i32* %216, align 4
  br label %217

; <label>:217                                     ; preds = %207
  %218 = add nsw i32 %j.1, 1
  br label %191

; <label>:219                                     ; preds = %191
  br label %220

; <label>:220                                     ; preds = %219, %186
  %n_err.1 = phi i32 [ %171, %186 ], [ %n_err.0, %219 ]
  br label %221

; <label>:221                                     ; preds = %220
  %222 = add nsw i32 %i.2, 1
  br label %155

; <label>:223                                     ; preds = %155
  %224 = bitcast float* %154 to i8*
  call void @ckd_free(i8* %224)
  %225 = icmp ne i32 %chksum_present.0, 0
  br i1 %225, label %226, label %229

; <label>:226                                     ; preds = %223
  %227 = load i32* %byteswap, align 4
  %228 = load i32* %chksum, align 4
  call void @bio_verify_chksum(%struct._IO_FILE* %1, i32 %227, i32 %228)
  br label %229

; <label>:229                                     ; preds = %226, %223
  %230 = call i64 @fread(i8* %eofchk, i64 1, i64 1, %struct._IO_FILE* %1)
  %231 = icmp eq i64 %230, 1
  br i1 %231, label %232, label %233

; <label>:232                                     ; preds = %229
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 358, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([31 x i8]* @.str35, i32 0, i32 0), i8* %file_name)
  br label %233

; <label>:233                                     ; preds = %232, %229
  %234 = call i32 @fclose(%struct._IO_FILE* %1)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 362, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  %235 = load i32* %n_mgau, align 4
  %236 = load i32* %n_comp, align 4
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([30 x i8]* @.str36, i32 0, i32 0), i32 %235, i32 %236)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @mgau_uninit_compact(%struct.mgau_model_t* %g) #0 {
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 378, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([43 x i8]* @.str15, i32 0, i32 0))
  br label %1

; <label>:1                                       ; preds = %115, %0
  %n.0 = phi i32 [ 0, %0 ], [ %n.1, %115 ]
  %m.0 = phi i32 [ 0, %0 ], [ %116, %115 ]
  %nm.0 = phi i32 [ 0, %0 ], [ %nm.1, %115 ]
  %2 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 0
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %m.0, %3
  br i1 %4, label %5, label %117

; <label>:5                                       ; preds = %1
  br label %6

; <label>:6                                       ; preds = %101, %5
  %n.1 = phi i32 [ %n.0, %5 ], [ %n.2, %101 ]
  %c2.0 = phi i32 [ 0, %5 ], [ %c2.1, %101 ]
  %c.0 = phi i32 [ 0, %5 ], [ %102, %101 ]
  %7 = sext i32 %m.0 to i64
  %8 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %9 = load %struct.mgau_t** %8, align 8
  %10 = getelementptr inbounds %struct.mgau_t* %9, i64 %7
  %11 = getelementptr inbounds %struct.mgau_t* %10, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = icmp slt i32 %c.0, %12
  br i1 %13, label %14, label %103

; <label>:14                                      ; preds = %6
  %15 = sext i32 %c.0 to i64
  %16 = sext i32 %m.0 to i64
  %17 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %18 = load %struct.mgau_t** %17, align 8
  %19 = getelementptr inbounds %struct.mgau_t* %18, i64 %16
  %20 = getelementptr inbounds %struct.mgau_t* %19, i32 0, i32 2
  %21 = load float*** %20, align 8
  %22 = getelementptr inbounds float** %21, i64 %15
  %23 = load float** %22, align 8
  %24 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 2
  %25 = load i32* %24, align 4
  %26 = call i32 @vector_is_zero(float* %23, i32 %25)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %98, label %28

; <label>:28                                      ; preds = %14
  %29 = icmp ne i32 %c2.0, %c.0
  br i1 %29, label %30, label %96

; <label>:30                                      ; preds = %28
  %31 = sext i32 %c2.0 to i64
  %32 = sext i32 %m.0 to i64
  %33 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %34 = load %struct.mgau_t** %33, align 8
  %35 = getelementptr inbounds %struct.mgau_t* %34, i64 %32
  %36 = getelementptr inbounds %struct.mgau_t* %35, i32 0, i32 1
  %37 = load float*** %36, align 8
  %38 = getelementptr inbounds float** %37, i64 %31
  %39 = load float** %38, align 8
  %40 = bitcast float* %39 to i8*
  %41 = sext i32 %c.0 to i64
  %42 = sext i32 %m.0 to i64
  %43 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %44 = load %struct.mgau_t** %43, align 8
  %45 = getelementptr inbounds %struct.mgau_t* %44, i64 %42
  %46 = getelementptr inbounds %struct.mgau_t* %45, i32 0, i32 1
  %47 = load float*** %46, align 8
  %48 = getelementptr inbounds float** %47, i64 %41
  %49 = load float** %48, align 8
  %50 = bitcast float* %49 to i8*
  %51 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 2
  %52 = load i32* %51, align 4
  %53 = sext i32 %52 to i64
  %54 = mul i64 %53, 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* %50, i64 %54, i32 4, i1 false)
  %55 = sext i32 %c2.0 to i64
  %56 = sext i32 %m.0 to i64
  %57 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %58 = load %struct.mgau_t** %57, align 8
  %59 = getelementptr inbounds %struct.mgau_t* %58, i64 %56
  %60 = getelementptr inbounds %struct.mgau_t* %59, i32 0, i32 2
  %61 = load float*** %60, align 8
  %62 = getelementptr inbounds float** %61, i64 %55
  %63 = load float** %62, align 8
  %64 = bitcast float* %63 to i8*
  %65 = sext i32 %c.0 to i64
  %66 = sext i32 %m.0 to i64
  %67 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %68 = load %struct.mgau_t** %67, align 8
  %69 = getelementptr inbounds %struct.mgau_t* %68, i64 %66
  %70 = getelementptr inbounds %struct.mgau_t* %69, i32 0, i32 2
  %71 = load float*** %70, align 8
  %72 = getelementptr inbounds float** %71, i64 %65
  %73 = load float** %72, align 8
  %74 = bitcast float* %73 to i8*
  %75 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 2
  %76 = load i32* %75, align 4
  %77 = sext i32 %76 to i64
  %78 = mul i64 %77, 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %64, i8* %74, i64 %78, i32 4, i1 false)
  %79 = sext i32 %c.0 to i64
  %80 = sext i32 %m.0 to i64
  %81 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %82 = load %struct.mgau_t** %81, align 8
  %83 = getelementptr inbounds %struct.mgau_t* %82, i64 %80
  %84 = getelementptr inbounds %struct.mgau_t* %83, i32 0, i32 4
  %85 = load i32** %84, align 8
  %86 = getelementptr inbounds i32* %85, i64 %79
  %87 = load i32* %86, align 4
  %88 = sext i32 %c2.0 to i64
  %89 = sext i32 %m.0 to i64
  %90 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %91 = load %struct.mgau_t** %90, align 8
  %92 = getelementptr inbounds %struct.mgau_t* %91, i64 %89
  %93 = getelementptr inbounds %struct.mgau_t* %92, i32 0, i32 4
  %94 = load i32** %93, align 8
  %95 = getelementptr inbounds i32* %94, i64 %88
  store i32 %87, i32* %95, align 4
  br label %96

; <label>:96                                      ; preds = %30, %28
  %97 = add nsw i32 %c2.0, 1
  br label %100

; <label>:98                                      ; preds = %14
  %99 = add nsw i32 %n.1, 1
  br label %100

; <label>:100                                     ; preds = %98, %96
  %n.2 = phi i32 [ %99, %98 ], [ %n.1, %96 ]
  %c2.1 = phi i32 [ %c2.0, %98 ], [ %97, %96 ]
  br label %101

; <label>:101                                     ; preds = %100
  %102 = add nsw i32 %c.0, 1
  br label %6

; <label>:103                                     ; preds = %6
  %104 = sext i32 %m.0 to i64
  %105 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %106 = load %struct.mgau_t** %105, align 8
  %107 = getelementptr inbounds %struct.mgau_t* %106, i64 %104
  %108 = getelementptr inbounds %struct.mgau_t* %107, i32 0, i32 0
  store i32 %c2.0, i32* %108, align 4
  %109 = icmp eq i32 %c2.0, 0
  br i1 %109, label %110, label %114

; <label>:110                                     ; preds = %103
  %111 = load %struct._IO_FILE** @stdout, align 8
  %112 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %111, i8* getelementptr inbounds ([4 x i8]* @.str16, i32 0, i32 0), i32 %m.0)
  %113 = add nsw i32 %nm.0, 1
  br label %114

; <label>:114                                     ; preds = %110, %103
  %nm.1 = phi i32 [ %113, %110 ], [ %nm.0, %103 ]
  br label %115

; <label>:115                                     ; preds = %114
  %116 = add nsw i32 %m.0, 1
  br label %1

; <label>:117                                     ; preds = %1
  %118 = icmp sgt i32 %nm.0, 0
  br i1 %118, label %119, label %122

; <label>:119                                     ; preds = %117
  %120 = load %struct._IO_FILE** @stdout, align 8
  %121 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %120, i8* getelementptr inbounds ([2 x i8]* @.str17, i32 0, i32 0))
  br label %122

; <label>:122                                     ; preds = %119, %117
  %123 = icmp sgt i32 %nm.0, 0
  br i1 %123, label %126, label %124

; <label>:124                                     ; preds = %122
  %125 = icmp sgt i32 %n.0, 0
  br i1 %125, label %126, label %127

; <label>:126                                     ; preds = %124, %122
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 408, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([53 x i8]* @.str18, i32 0, i32 0), i32 %n.0, i32 %nm.0)
  br label %127

; <label>:127                                     ; preds = %126, %124
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @mgau_var_floor(%struct.mgau_model_t* %g, double %floor) #0 {
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 416, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0))
  br label %1

; <label>:1                                       ; preds = %55, %0
  %m.0 = phi i32 [ 0, %0 ], [ %56, %55 ]
  %n.0 = phi i32 [ 0, %0 ], [ %n.1, %55 ]
  %2 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 0
  %3 = load i32* %2, align 4
  %4 = icmp slt i32 %m.0, %3
  br i1 %4, label %5, label %57

; <label>:5                                       ; preds = %1
  br label %6

; <label>:6                                       ; preds = %52, %5
  %c.0 = phi i32 [ 0, %5 ], [ %53, %52 ]
  %n.1 = phi i32 [ %n.0, %5 ], [ %n.2, %52 ]
  %7 = sext i32 %m.0 to i64
  %8 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %9 = load %struct.mgau_t** %8, align 8
  %10 = getelementptr inbounds %struct.mgau_t* %9, i64 %7
  %11 = getelementptr inbounds %struct.mgau_t* %10, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = icmp slt i32 %c.0, %12
  br i1 %13, label %14, label %54

; <label>:14                                      ; preds = %6
  br label %15

; <label>:15                                      ; preds = %49, %14
  %i.0 = phi i32 [ 0, %14 ], [ %50, %49 ]
  %n.2 = phi i32 [ %n.1, %14 ], [ %n.3, %49 ]
  %16 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 2
  %17 = load i32* %16, align 4
  %18 = icmp slt i32 %i.0, %17
  br i1 %18, label %19, label %51

; <label>:19                                      ; preds = %15
  %20 = sext i32 %i.0 to i64
  %21 = sext i32 %c.0 to i64
  %22 = sext i32 %m.0 to i64
  %23 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %24 = load %struct.mgau_t** %23, align 8
  %25 = getelementptr inbounds %struct.mgau_t* %24, i64 %22
  %26 = getelementptr inbounds %struct.mgau_t* %25, i32 0, i32 2
  %27 = load float*** %26, align 8
  %28 = getelementptr inbounds float** %27, i64 %21
  %29 = load float** %28, align 8
  %30 = getelementptr inbounds float* %29, i64 %20
  %31 = load float* %30, align 4
  %32 = fpext float %31 to double
  %33 = fcmp olt double %32, %floor
  br i1 %33, label %34, label %48

; <label>:34                                      ; preds = %19
  %35 = fptrunc double %floor to float
  %36 = sext i32 %i.0 to i64
  %37 = sext i32 %c.0 to i64
  %38 = sext i32 %m.0 to i64
  %39 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %40 = load %struct.mgau_t** %39, align 8
  %41 = getelementptr inbounds %struct.mgau_t* %40, i64 %38
  %42 = getelementptr inbounds %struct.mgau_t* %41, i32 0, i32 2
  %43 = load float*** %42, align 8
  %44 = getelementptr inbounds float** %43, i64 %37
  %45 = load float** %44, align 8
  %46 = getelementptr inbounds float* %45, i64 %36
  store float %35, float* %46, align 4
  %47 = add nsw i32 %n.2, 1
  br label %48

; <label>:48                                      ; preds = %34, %19
  %n.3 = phi i32 [ %47, %34 ], [ %n.2, %19 ]
  br label %49

; <label>:49                                      ; preds = %48
  %50 = add nsw i32 %i.0, 1
  br label %15

; <label>:51                                      ; preds = %15
  br label %52

; <label>:52                                      ; preds = %51
  %53 = add nsw i32 %c.0, 1
  br label %6

; <label>:54                                      ; preds = %6
  br label %55

; <label>:55                                      ; preds = %54
  %56 = add nsw i32 %m.0, 1
  br label %1

; <label>:57                                      ; preds = %1
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 428, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %n.0)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @mgau_precomp(%struct.mgau_model_t* %g) #0 {
  %1 = call double @log_to_logs3_factor()
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 474, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([46 x i8]* @.str13, i32 0, i32 0))
  br label %2

; <label>:2                                       ; preds = %85, %0
  %m.0 = phi i32 [ 0, %0 ], [ %86, %85 ]
  %3 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = icmp slt i32 %m.0, %4
  br i1 %5, label %6, label %87

; <label>:6                                       ; preds = %2
  br label %7

; <label>:7                                       ; preds = %82, %6
  %c.0 = phi i32 [ 0, %6 ], [ %83, %82 ]
  %8 = sext i32 %m.0 to i64
  %9 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %10 = load %struct.mgau_t** %9, align 8
  %11 = getelementptr inbounds %struct.mgau_t* %10, i64 %8
  %12 = getelementptr inbounds %struct.mgau_t* %11, i32 0, i32 0
  %13 = load i32* %12, align 4
  %14 = icmp slt i32 %c.0, %13
  br i1 %14, label %15, label %84

; <label>:15                                      ; preds = %7
  br label %16

; <label>:16                                      ; preds = %63, %15
  %i.0 = phi i32 [ 0, %15 ], [ %64, %63 ]
  %lrd.0 = phi double [ 0.000000e+00, %15 ], [ %35, %63 ]
  %17 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 2
  %18 = load i32* %17, align 4
  %19 = icmp slt i32 %i.0, %18
  br i1 %19, label %20, label %65

; <label>:20                                      ; preds = %16
  %21 = sext i32 %i.0 to i64
  %22 = sext i32 %c.0 to i64
  %23 = sext i32 %m.0 to i64
  %24 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %25 = load %struct.mgau_t** %24, align 8
  %26 = getelementptr inbounds %struct.mgau_t* %25, i64 %23
  %27 = getelementptr inbounds %struct.mgau_t* %26, i32 0, i32 2
  %28 = load float*** %27, align 8
  %29 = getelementptr inbounds float** %28, i64 %22
  %30 = load float** %29, align 8
  %31 = getelementptr inbounds float* %30, i64 %21
  %32 = load float* %31, align 4
  %33 = fpext float %32 to double
  %34 = call double @log(double %33) #5
  %35 = fadd double %lrd.0, %34
  %36 = sext i32 %i.0 to i64
  %37 = sext i32 %c.0 to i64
  %38 = sext i32 %m.0 to i64
  %39 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %40 = load %struct.mgau_t** %39, align 8
  %41 = getelementptr inbounds %struct.mgau_t* %40, i64 %38
  %42 = getelementptr inbounds %struct.mgau_t* %41, i32 0, i32 2
  %43 = load float*** %42, align 8
  %44 = getelementptr inbounds float** %43, i64 %37
  %45 = load float** %44, align 8
  %46 = getelementptr inbounds float* %45, i64 %36
  %47 = load float* %46, align 4
  %48 = fpext float %47 to double
  %49 = fmul double %48, 2.000000e+00
  %50 = fdiv double 1.000000e+00, %49
  %51 = fptrunc double %50 to float
  %52 = sext i32 %i.0 to i64
  %53 = sext i32 %c.0 to i64
  %54 = sext i32 %m.0 to i64
  %55 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %56 = load %struct.mgau_t** %55, align 8
  %57 = getelementptr inbounds %struct.mgau_t* %56, i64 %54
  %58 = getelementptr inbounds %struct.mgau_t* %57, i32 0, i32 2
  %59 = load float*** %58, align 8
  %60 = getelementptr inbounds float** %59, i64 %53
  %61 = load float** %60, align 8
  %62 = getelementptr inbounds float* %61, i64 %52
  store float %51, float* %62, align 4
  br label %63

; <label>:63                                      ; preds = %20
  %64 = add nsw i32 %i.0, 1
  br label %16

; <label>:65                                      ; preds = %16
  %66 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 2
  %67 = load i32* %66, align 4
  %68 = sitofp i32 %67 to double
  %69 = call double @log(double 0x401921FB54442D18) #5
  %70 = fmul double %68, %69
  %71 = fadd double %lrd.0, %70
  %72 = fmul double -5.000000e-01, %71
  %73 = fptrunc double %72 to float
  %74 = sext i32 %c.0 to i64
  %75 = sext i32 %m.0 to i64
  %76 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %77 = load %struct.mgau_t** %76, align 8
  %78 = getelementptr inbounds %struct.mgau_t* %77, i64 %75
  %79 = getelementptr inbounds %struct.mgau_t* %78, i32 0, i32 3
  %80 = load float** %79, align 8
  %81 = getelementptr inbounds float* %80, i64 %74
  store float %73, float* %81, align 4
  br label %82

; <label>:82                                      ; preds = %65
  %83 = add nsw i32 %c.0, 1
  br label %7

; <label>:84                                      ; preds = %7
  br label %85

; <label>:85                                      ; preds = %84
  %86 = add nsw i32 %m.0, 1
  br label %2

; <label>:87                                      ; preds = %2
  ret i32 0
}

declare double @logs3_to_log(i32) #1

; Function Attrs: nounwind uwtable
define i32 @mgau_comp_eval(%struct.mgau_model_t* %g, i32 %s, float* %x, i32* %score) #0 {
  %1 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 2
  %2 = load i32* %1, align 4
  %3 = sext i32 %s to i64
  %4 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %5 = load %struct.mgau_t** %4, align 8
  %6 = getelementptr inbounds %struct.mgau_t* %5, i64 %3
  %7 = call double @log_to_logs3_factor()
  br label %8

; <label>:8                                       ; preds = %70, %0
  %bs.0 = phi i32 [ -2147483648, %0 ], [ %bs.1, %70 ]
  %c.0 = phi i32 [ 0, %0 ], [ %71, %70 ]
  %9 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 0
  %10 = load i32* %9, align 4
  %11 = icmp slt i32 %c.0, %10
  br i1 %11, label %12, label %72

; <label>:12                                      ; preds = %8
  %13 = sext i32 %c.0 to i64
  %14 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 1
  %15 = load float*** %14, align 8
  %16 = getelementptr inbounds float** %15, i64 %13
  %17 = load float** %16, align 8
  %18 = sext i32 %c.0 to i64
  %19 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 2
  %20 = load float*** %19, align 8
  %21 = getelementptr inbounds float** %20, i64 %18
  %22 = load float** %21, align 8
  %23 = sext i32 %c.0 to i64
  %24 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 3
  %25 = load float** %24, align 8
  %26 = getelementptr inbounds float* %25, i64 %23
  %27 = load float* %26, align 4
  %28 = fpext float %27 to double
  br label %29

; <label>:29                                      ; preds = %47, %12
  %dval.0 = phi double [ %28, %12 ], [ %46, %47 ]
  %i.0 = phi i32 [ 0, %12 ], [ %48, %47 ]
  %30 = icmp slt i32 %i.0, %2
  br i1 %30, label %31, label %49

; <label>:31                                      ; preds = %29
  %32 = sext i32 %i.0 to i64
  %33 = getelementptr inbounds float* %x, i64 %32
  %34 = load float* %33, align 4
  %35 = sext i32 %i.0 to i64
  %36 = getelementptr inbounds float* %17, i64 %35
  %37 = load float* %36, align 4
  %38 = fsub float %34, %37
  %39 = fpext float %38 to double
  %40 = fmul double %39, %39
  %41 = sext i32 %i.0 to i64
  %42 = getelementptr inbounds float* %22, i64 %41
  %43 = load float* %42, align 4
  %44 = fpext float %43 to double
  %45 = fmul double %40, %44
  %46 = fsub double %dval.0, %45
  br label %47

; <label>:47                                      ; preds = %31
  %48 = add nsw i32 %i.0, 1
  br label %29

; <label>:49                                      ; preds = %29
  %50 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 4
  %51 = load double* %50, align 8
  %52 = fcmp olt double %dval.0, %51
  br i1 %52, label %53, label %56

; <label>:53                                      ; preds = %49
  %54 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 4
  %55 = load double* %54, align 8
  br label %56

; <label>:56                                      ; preds = %53, %49
  %dval.1 = phi double [ %55, %53 ], [ %dval.0, %49 ]
  %57 = fmul double %7, %dval.1
  %58 = fptosi double %57 to i32
  %59 = sext i32 %c.0 to i64
  %60 = getelementptr inbounds i32* %score, i64 %59
  store i32 %58, i32* %60, align 4
  %61 = sext i32 %c.0 to i64
  %62 = getelementptr inbounds i32* %score, i64 %61
  %63 = load i32* %62, align 4
  %64 = icmp sgt i32 %63, %bs.0
  br i1 %64, label %65, label %69

; <label>:65                                      ; preds = %56
  %66 = sext i32 %c.0 to i64
  %67 = getelementptr inbounds i32* %score, i64 %66
  %68 = load i32* %67, align 4
  br label %69

; <label>:69                                      ; preds = %65, %56
  %bs.1 = phi i32 [ %68, %65 ], [ %bs.0, %56 ]
  br label %70

; <label>:70                                      ; preds = %69
  %71 = add nsw i32 %c.0, 1
  br label %8

; <label>:72                                      ; preds = %8
  ret i32 %bs.0
}

declare double @log_to_logs3_factor() #1

; Function Attrs: nounwind uwtable
define i32 @mgau_eval(%struct.mgau_model_t* %g, i32 %m, i32* %active, float* %x) #0 {
  %1 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 2
  %2 = load i32* %1, align 4
  %3 = sext i32 %m to i64
  %4 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %5 = load %struct.mgau_t** %4, align 8
  %6 = getelementptr inbounds %struct.mgau_t* %5, i64 %3
  %7 = call double @log_to_logs3_factor()
  %8 = icmp ne i32* %active, null
  br i1 %8, label %181, label %9

; <label>:9                                       ; preds = %0
  br label %10

; <label>:10                                      ; preds = %120, %9
  %score.0 = phi i32 [ -939524096, %9 ], [ %119, %120 ]
  %c.0 = phi i32 [ 0, %9 ], [ %121, %120 ]
  %11 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = sub nsw i32 %12, 1
  %14 = icmp slt i32 %c.0, %13
  br i1 %14, label %15, label %122

; <label>:15                                      ; preds = %10
  %16 = sext i32 %c.0 to i64
  %17 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 1
  %18 = load float*** %17, align 8
  %19 = getelementptr inbounds float** %18, i64 %16
  %20 = load float** %19, align 8
  %21 = add nsw i32 %c.0, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 1
  %24 = load float*** %23, align 8
  %25 = getelementptr inbounds float** %24, i64 %22
  %26 = load float** %25, align 8
  %27 = sext i32 %c.0 to i64
  %28 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 2
  %29 = load float*** %28, align 8
  %30 = getelementptr inbounds float** %29, i64 %27
  %31 = load float** %30, align 8
  %32 = add nsw i32 %c.0, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 2
  %35 = load float*** %34, align 8
  %36 = getelementptr inbounds float** %35, i64 %33
  %37 = load float** %36, align 8
  %38 = sext i32 %c.0 to i64
  %39 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 3
  %40 = load float** %39, align 8
  %41 = getelementptr inbounds float* %40, i64 %38
  %42 = load float* %41, align 4
  %43 = fpext float %42 to double
  %44 = add nsw i32 %c.0, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 3
  %47 = load float** %46, align 8
  %48 = getelementptr inbounds float* %47, i64 %45
  %49 = load float* %48, align 4
  %50 = fpext float %49 to double
  br label %51

; <label>:51                                      ; preds = %84, %15
  %dval1.0 = phi double [ %43, %15 ], [ %68, %84 ]
  %dval2.0 = phi double [ %50, %15 ], [ %83, %84 ]
  %i.0 = phi i32 [ 0, %15 ], [ %85, %84 ]
  %52 = icmp slt i32 %i.0, %2
  br i1 %52, label %53, label %86

; <label>:53                                      ; preds = %51
  %54 = sext i32 %i.0 to i64
  %55 = getelementptr inbounds float* %x, i64 %54
  %56 = load float* %55, align 4
  %57 = sext i32 %i.0 to i64
  %58 = getelementptr inbounds float* %20, i64 %57
  %59 = load float* %58, align 4
  %60 = fsub float %56, %59
  %61 = fpext float %60 to double
  %62 = fmul double %61, %61
  %63 = sext i32 %i.0 to i64
  %64 = getelementptr inbounds float* %31, i64 %63
  %65 = load float* %64, align 4
  %66 = fpext float %65 to double
  %67 = fmul double %62, %66
  %68 = fsub double %dval1.0, %67
  %69 = sext i32 %i.0 to i64
  %70 = getelementptr inbounds float* %x, i64 %69
  %71 = load float* %70, align 4
  %72 = sext i32 %i.0 to i64
  %73 = getelementptr inbounds float* %26, i64 %72
  %74 = load float* %73, align 4
  %75 = fsub float %71, %74
  %76 = fpext float %75 to double
  %77 = fmul double %76, %76
  %78 = sext i32 %i.0 to i64
  %79 = getelementptr inbounds float* %37, i64 %78
  %80 = load float* %79, align 4
  %81 = fpext float %80 to double
  %82 = fmul double %77, %81
  %83 = fsub double %dval2.0, %82
  br label %84

; <label>:84                                      ; preds = %53
  %85 = add nsw i32 %i.0, 1
  br label %51

; <label>:86                                      ; preds = %51
  %87 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 4
  %88 = load double* %87, align 8
  %89 = fcmp olt double %dval1.0, %88
  br i1 %89, label %90, label %93

; <label>:90                                      ; preds = %86
  %91 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 4
  %92 = load double* %91, align 8
  br label %93

; <label>:93                                      ; preds = %90, %86
  %dval1.1 = phi double [ %92, %90 ], [ %dval1.0, %86 ]
  %94 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 4
  %95 = load double* %94, align 8
  %96 = fcmp olt double %dval2.0, %95
  br i1 %96, label %97, label %100

; <label>:97                                      ; preds = %93
  %98 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 4
  %99 = load double* %98, align 8
  br label %100

; <label>:100                                     ; preds = %97, %93
  %dval2.1 = phi double [ %99, %97 ], [ %dval2.0, %93 ]
  %101 = fmul double %7, %dval1.1
  %102 = fptosi double %101 to i32
  %103 = sext i32 %c.0 to i64
  %104 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 4
  %105 = load i32** %104, align 8
  %106 = getelementptr inbounds i32* %105, i64 %103
  %107 = load i32* %106, align 4
  %108 = add nsw i32 %102, %107
  %109 = call i32 @logs3_add(i32 %score.0, i32 %108)
  %110 = fmul double %7, %dval2.1
  %111 = fptosi double %110 to i32
  %112 = add nsw i32 %c.0, 1
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 4
  %115 = load i32** %114, align 8
  %116 = getelementptr inbounds i32* %115, i64 %113
  %117 = load i32* %116, align 4
  %118 = add nsw i32 %111, %117
  %119 = call i32 @logs3_add(i32 %109, i32 %118)
  br label %120

; <label>:120                                     ; preds = %100
  %121 = add nsw i32 %c.0, 2
  br label %10

; <label>:122                                     ; preds = %10
  %123 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 0
  %124 = load i32* %123, align 4
  %125 = icmp slt i32 %c.0, %124
  br i1 %125, label %126, label %180

; <label>:126                                     ; preds = %122
  %127 = sext i32 %c.0 to i64
  %128 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 1
  %129 = load float*** %128, align 8
  %130 = getelementptr inbounds float** %129, i64 %127
  %131 = load float** %130, align 8
  %132 = sext i32 %c.0 to i64
  %133 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 2
  %134 = load float*** %133, align 8
  %135 = getelementptr inbounds float** %134, i64 %132
  %136 = load float** %135, align 8
  %137 = sext i32 %c.0 to i64
  %138 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 3
  %139 = load float** %138, align 8
  %140 = getelementptr inbounds float* %139, i64 %137
  %141 = load float* %140, align 4
  %142 = fpext float %141 to double
  br label %143

; <label>:143                                     ; preds = %161, %126
  %dval1.2 = phi double [ %142, %126 ], [ %160, %161 ]
  %i.1 = phi i32 [ 0, %126 ], [ %162, %161 ]
  %144 = icmp slt i32 %i.1, %2
  br i1 %144, label %145, label %163

; <label>:145                                     ; preds = %143
  %146 = sext i32 %i.1 to i64
  %147 = getelementptr inbounds float* %x, i64 %146
  %148 = load float* %147, align 4
  %149 = sext i32 %i.1 to i64
  %150 = getelementptr inbounds float* %131, i64 %149
  %151 = load float* %150, align 4
  %152 = fsub float %148, %151
  %153 = fpext float %152 to double
  %154 = fmul double %153, %153
  %155 = sext i32 %i.1 to i64
  %156 = getelementptr inbounds float* %136, i64 %155
  %157 = load float* %156, align 4
  %158 = fpext float %157 to double
  %159 = fmul double %154, %158
  %160 = fsub double %dval1.2, %159
  br label %161

; <label>:161                                     ; preds = %145
  %162 = add nsw i32 %i.1, 1
  br label %143

; <label>:163                                     ; preds = %143
  %164 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 4
  %165 = load double* %164, align 8
  %166 = fcmp olt double %dval1.2, %165
  br i1 %166, label %167, label %170

; <label>:167                                     ; preds = %163
  %168 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 4
  %169 = load double* %168, align 8
  br label %170

; <label>:170                                     ; preds = %167, %163
  %dval1.3 = phi double [ %169, %167 ], [ %dval1.2, %163 ]
  %171 = fmul double %7, %dval1.3
  %172 = fptosi double %171 to i32
  %173 = sext i32 %c.0 to i64
  %174 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 4
  %175 = load i32** %174, align 8
  %176 = getelementptr inbounds i32* %175, i64 %173
  %177 = load i32* %176, align 4
  %178 = add nsw i32 %172, %177
  %179 = call i32 @logs3_add(i32 %score.0, i32 %178)
  br label %180

; <label>:180                                     ; preds = %170, %122
  %score.1 = phi i32 [ %179, %170 ], [ %score.0, %122 ]
  br label %247

; <label>:181                                     ; preds = %0
  br label %182

; <label>:182                                     ; preds = %244, %181
  %score.2 = phi i32 [ -939524096, %181 ], [ %243, %244 ]
  %j.0 = phi i32 [ 0, %181 ], [ %245, %244 ]
  %183 = sext i32 %j.0 to i64
  %184 = getelementptr inbounds i32* %active, i64 %183
  %185 = load i32* %184, align 4
  %186 = icmp sge i32 %185, 0
  br i1 %186, label %187, label %246

; <label>:187                                     ; preds = %182
  %188 = sext i32 %j.0 to i64
  %189 = getelementptr inbounds i32* %active, i64 %188
  %190 = load i32* %189, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 1
  %193 = load float*** %192, align 8
  %194 = getelementptr inbounds float** %193, i64 %191
  %195 = load float** %194, align 8
  %196 = sext i32 %190 to i64
  %197 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 2
  %198 = load float*** %197, align 8
  %199 = getelementptr inbounds float** %198, i64 %196
  %200 = load float** %199, align 8
  %201 = sext i32 %190 to i64
  %202 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 3
  %203 = load float** %202, align 8
  %204 = getelementptr inbounds float* %203, i64 %201
  %205 = load float* %204, align 4
  %206 = fpext float %205 to double
  br label %207

; <label>:207                                     ; preds = %225, %187
  %dval1.4 = phi double [ %206, %187 ], [ %224, %225 ]
  %i.2 = phi i32 [ 0, %187 ], [ %226, %225 ]
  %208 = icmp slt i32 %i.2, %2
  br i1 %208, label %209, label %227

; <label>:209                                     ; preds = %207
  %210 = sext i32 %i.2 to i64
  %211 = getelementptr inbounds float* %x, i64 %210
  %212 = load float* %211, align 4
  %213 = sext i32 %i.2 to i64
  %214 = getelementptr inbounds float* %195, i64 %213
  %215 = load float* %214, align 4
  %216 = fsub float %212, %215
  %217 = fpext float %216 to double
  %218 = fmul double %217, %217
  %219 = sext i32 %i.2 to i64
  %220 = getelementptr inbounds float* %200, i64 %219
  %221 = load float* %220, align 4
  %222 = fpext float %221 to double
  %223 = fmul double %218, %222
  %224 = fsub double %dval1.4, %223
  br label %225

; <label>:225                                     ; preds = %209
  %226 = add nsw i32 %i.2, 1
  br label %207

; <label>:227                                     ; preds = %207
  %228 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 4
  %229 = load double* %228, align 8
  %230 = fcmp olt double %dval1.4, %229
  br i1 %230, label %231, label %234

; <label>:231                                     ; preds = %227
  %232 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 4
  %233 = load double* %232, align 8
  br label %234

; <label>:234                                     ; preds = %231, %227
  %dval1.5 = phi double [ %233, %231 ], [ %dval1.4, %227 ]
  %235 = fmul double %7, %dval1.5
  %236 = fptosi double %235 to i32
  %237 = sext i32 %190 to i64
  %238 = getelementptr inbounds %struct.mgau_t* %6, i32 0, i32 4
  %239 = load i32** %238, align 8
  %240 = getelementptr inbounds i32* %239, i64 %237
  %241 = load i32* %240, align 4
  %242 = add nsw i32 %236, %241
  %243 = call i32 @logs3_add(i32 %score.2, i32 %242)
  br label %244

; <label>:244                                     ; preds = %234
  %245 = add nsw i32 %j.0, 1
  br label %182

; <label>:246                                     ; preds = %182
  br label %247

; <label>:247                                     ; preds = %246, %180
  %score.3 = phi i32 [ %score.2, %246 ], [ %score.1, %180 ]
  %248 = icmp eq i32 %score.3, -939524096
  br i1 %248, label %249, label %250

; <label>:249                                     ; preds = %247
  br label %250

; <label>:250                                     ; preds = %249, %247
  ret i32 %score.3
}

declare i32 @logs3_add(i32, i32) #1

; Function Attrs: nounwind uwtable
define void @mgau_free(%struct.mgau_model_t* %g) #0 {
  %1 = icmp ne %struct.mgau_model_t* %g, null
  br i1 %1, label %2, label %68

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %4 = load %struct.mgau_t** %3, align 8
  %5 = getelementptr inbounds %struct.mgau_t* %4, i64 0
  %6 = getelementptr inbounds %struct.mgau_t* %5, i32 0, i32 1
  %7 = load float*** %6, align 8
  %8 = icmp ne float** %7, null
  br i1 %8, label %9, label %16

; <label>:9                                       ; preds = %2
  %10 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %11 = load %struct.mgau_t** %10, align 8
  %12 = getelementptr inbounds %struct.mgau_t* %11, i64 0
  %13 = getelementptr inbounds %struct.mgau_t* %12, i32 0, i32 1
  %14 = load float*** %13, align 8
  %15 = bitcast float** %14 to i8*
  call void @ckd_free(i8* %15)
  br label %16

; <label>:16                                      ; preds = %9, %2
  %17 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %18 = load %struct.mgau_t** %17, align 8
  %19 = getelementptr inbounds %struct.mgau_t* %18, i64 0
  %20 = getelementptr inbounds %struct.mgau_t* %19, i32 0, i32 2
  %21 = load float*** %20, align 8
  %22 = icmp ne float** %21, null
  br i1 %22, label %23, label %30

; <label>:23                                      ; preds = %16
  %24 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %25 = load %struct.mgau_t** %24, align 8
  %26 = getelementptr inbounds %struct.mgau_t* %25, i64 0
  %27 = getelementptr inbounds %struct.mgau_t* %26, i32 0, i32 2
  %28 = load float*** %27, align 8
  %29 = bitcast float** %28 to i8*
  call void @ckd_free(i8* %29)
  br label %30

; <label>:30                                      ; preds = %23, %16
  %31 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %32 = load %struct.mgau_t** %31, align 8
  %33 = getelementptr inbounds %struct.mgau_t* %32, i64 0
  %34 = getelementptr inbounds %struct.mgau_t* %33, i32 0, i32 3
  %35 = load float** %34, align 8
  %36 = icmp ne float* %35, null
  br i1 %36, label %37, label %44

; <label>:37                                      ; preds = %30
  %38 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %39 = load %struct.mgau_t** %38, align 8
  %40 = getelementptr inbounds %struct.mgau_t* %39, i64 0
  %41 = getelementptr inbounds %struct.mgau_t* %40, i32 0, i32 3
  %42 = load float** %41, align 8
  %43 = bitcast float* %42 to i8*
  call void @ckd_free(i8* %43)
  br label %44

; <label>:44                                      ; preds = %37, %30
  %45 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %46 = load %struct.mgau_t** %45, align 8
  %47 = getelementptr inbounds %struct.mgau_t* %46, i64 0
  %48 = getelementptr inbounds %struct.mgau_t* %47, i32 0, i32 4
  %49 = load i32** %48, align 8
  %50 = icmp ne i32* %49, null
  br i1 %50, label %51, label %58

; <label>:51                                      ; preds = %44
  %52 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %53 = load %struct.mgau_t** %52, align 8
  %54 = getelementptr inbounds %struct.mgau_t* %53, i64 0
  %55 = getelementptr inbounds %struct.mgau_t* %54, i32 0, i32 4
  %56 = load i32** %55, align 8
  %57 = bitcast i32* %56 to i8*
  call void @ckd_free(i8* %57)
  br label %58

; <label>:58                                      ; preds = %51, %44
  %59 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %60 = load %struct.mgau_t** %59, align 8
  %61 = icmp ne %struct.mgau_t* %60, null
  br i1 %61, label %62, label %66

; <label>:62                                      ; preds = %58
  %63 = getelementptr inbounds %struct.mgau_model_t* %g, i32 0, i32 3
  %64 = load %struct.mgau_t** %63, align 8
  %65 = bitcast %struct.mgau_t* %64 to i8*
  call void @ckd_free(i8* %65)
  br label %66

; <label>:66                                      ; preds = %62, %58
  %67 = bitcast %struct.mgau_model_t* %g to i8*
  call void @ckd_free(i8* %67)
  br label %68

; <label>:68                                      ; preds = %66, %0
  ret void
}

declare void @ckd_free(i8*) #1

; Function Attrs: nounwind
declare double @log(double) #4

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare %struct._IO_FILE* @_myfopen(i8*, i8*, i8*, i32) #1

declare i32 @bio_readhdr(%struct._IO_FILE*, i8***, i8***, i32*) #1

declare void @_E__pr_warn(i8*, ...) #1

declare void @bio_hdrarg_free(i8**, i8**) #1

declare i32 @bio_fread(i8*, i32, i32, %struct._IO_FILE*, i32, i32*) #1

declare void @vector_nz_floor(float*, i32, double) #1

declare double @vector_sum_norm(float*, i32) #1

declare i32 @logs3(double) #1

declare void @bio_verify_chksum(%struct._IO_FILE*, i32, i32) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
