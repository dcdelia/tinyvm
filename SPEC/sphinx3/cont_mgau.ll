; ModuleID = 'cont_mgau.c'
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
  %1 = alloca %struct.mgau_model_t*, align 8
  %2 = alloca double, align 8
  %m = alloca i32, align 4
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %l = alloca i32, align 4
  %var = alloca float*, align 8
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %1, align 8
  store double %floor, double* %2, align 8
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 437, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0))
  %3 = load %struct.mgau_model_t** %1, align 8
  %4 = getelementptr inbounds %struct.mgau_model_t* %3, i32 0, i32 2
  %5 = load i32* %4, align 4
  store i32 %5, i32* %l, align 4
  store i32 0, i32* %n, align 4
  store i32 0, i32* %m, align 4
  br label %6

; <label>:6                                       ; preds = %74, %0
  %7 = load i32* %m, align 4
  %8 = load %struct.mgau_model_t** %1, align 8
  %9 = getelementptr inbounds %struct.mgau_model_t* %8, i32 0, i32 0
  %10 = load i32* %9, align 4
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %77

; <label>:12                                      ; preds = %6
  store i32 0, i32* %c, align 4
  br label %13

; <label>:13                                      ; preds = %70, %12
  %14 = load i32* %c, align 4
  %15 = load i32* %m, align 4
  %16 = sext i32 %15 to i64
  %17 = load %struct.mgau_model_t** %1, align 8
  %18 = getelementptr inbounds %struct.mgau_model_t* %17, i32 0, i32 3
  %19 = load %struct.mgau_t** %18, align 8
  %20 = getelementptr inbounds %struct.mgau_t* %19, i64 %16
  %21 = getelementptr inbounds %struct.mgau_t* %20, i32 0, i32 0
  %22 = load i32* %21, align 4
  %23 = icmp slt i32 %14, %22
  br i1 %23, label %24, label %73

; <label>:24                                      ; preds = %13
  %25 = load i32* %c, align 4
  %26 = sext i32 %25 to i64
  %27 = load i32* %m, align 4
  %28 = sext i32 %27 to i64
  %29 = load %struct.mgau_model_t** %1, align 8
  %30 = getelementptr inbounds %struct.mgau_model_t* %29, i32 0, i32 3
  %31 = load %struct.mgau_t** %30, align 8
  %32 = getelementptr inbounds %struct.mgau_t* %31, i64 %28
  %33 = getelementptr inbounds %struct.mgau_t* %32, i32 0, i32 2
  %34 = load float*** %33, align 8
  %35 = getelementptr inbounds float** %34, i64 %26
  %36 = load float** %35, align 8
  store float* %36, float** %var, align 8
  %37 = load float** %var, align 8
  %38 = load i32* %l, align 4
  %39 = call i32 @vector_is_zero(float* %37, i32 %38)
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %69, label %41

; <label>:41                                      ; preds = %24
  store i32 0, i32* %i, align 4
  br label %42

; <label>:42                                      ; preds = %65, %41
  %43 = load i32* %i, align 4
  %44 = load i32* %l, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %68

; <label>:46                                      ; preds = %42
  %47 = load i32* %i, align 4
  %48 = sext i32 %47 to i64
  %49 = load float** %var, align 8
  %50 = getelementptr inbounds float* %49, i64 %48
  %51 = load float* %50, align 4
  %52 = fpext float %51 to double
  %53 = load double* %2, align 8
  %54 = fcmp olt double %52, %53
  br i1 %54, label %55, label %64

; <label>:55                                      ; preds = %46
  %56 = load double* %2, align 8
  %57 = fptrunc double %56 to float
  %58 = load i32* %i, align 4
  %59 = sext i32 %58 to i64
  %60 = load float** %var, align 8
  %61 = getelementptr inbounds float* %60, i64 %59
  store float %57, float* %61, align 4
  %62 = load i32* %n, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %n, align 4
  br label %64

; <label>:64                                      ; preds = %55, %46
  br label %65

; <label>:65                                      ; preds = %64
  %66 = load i32* %i, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %i, align 4
  br label %42

; <label>:68                                      ; preds = %42
  br label %69

; <label>:69                                      ; preds = %68, %24
  br label %70

; <label>:70                                      ; preds = %69
  %71 = load i32* %c, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %c, align 4
  br label %13

; <label>:73                                      ; preds = %13
  br label %74

; <label>:74                                      ; preds = %73
  %75 = load i32* %m, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %m, align 4
  br label %6

; <label>:77                                      ; preds = %6
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 457, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  %78 = load i32* %n, align 4
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %78)
  %79 = load i32* %n, align 4
  ret i32 %79
}

declare void @_E__pr_info_header(i8*, i64, i8*) #1

declare void @_E__pr_info(i8*, ...) #1

declare i32 @vector_is_zero(float*, i32) #1

; Function Attrs: nounwind uwtable
define %struct.mgau_model_t* @mgau_init(i8* %meanfile, i8* %varfile, double %varfloor, i8* %mixwfile, double %mixwfloor, i32 %precomp, i8* %senmgau) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca double, align 8
  %4 = alloca i8*, align 8
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %g = alloca %struct.mgau_model_t*, align 8
  store i8* %meanfile, i8** %1, align 8
  store i8* %varfile, i8** %2, align 8
  store double %varfloor, double* %3, align 8
  store i8* %mixwfile, i8** %4, align 8
  store double %mixwfloor, double* %5, align 8
  store i32 %precomp, i32* %6, align 4
  store i8* %senmgau, i8** %7, align 8
  %8 = load i8** %1, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  br label %13

; <label>:11                                      ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 503, i8* getelementptr inbounds ([81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %13

; <label>:13                                      ; preds = %12, %10
  %14 = load i8** %2, align 8
  %15 = icmp ne i8* %14, null
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  br label %19

; <label>:17                                      ; preds = %13
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 504, i8* getelementptr inbounds ([81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %19

; <label>:19                                      ; preds = %18, %16
  %20 = load double* %3, align 8
  %21 = fcmp oge double %20, 0.000000e+00
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %19
  br label %25

; <label>:23                                      ; preds = %19
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 505, i8* getelementptr inbounds ([81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %25

; <label>:25                                      ; preds = %24, %22
  %26 = load i8** %4, align 8
  %27 = icmp ne i8* %26, null
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  br label %31

; <label>:29                                      ; preds = %25
  call void @__assert_fail(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 506, i8* getelementptr inbounds ([81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %31

; <label>:31                                      ; preds = %30, %28
  %32 = load double* %5, align 8
  %33 = fcmp oge double %32, 0.000000e+00
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %31
  br label %37

; <label>:35                                      ; preds = %31
  call void @__assert_fail(i8* getelementptr inbounds ([17 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 507, i8* getelementptr inbounds ([81 x i8]* @__PRETTY_FUNCTION__.mgau_init, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %37

; <label>:37                                      ; preds = %36, %34
  %38 = call i8* @__ckd_calloc__(i64 1, i64 48, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 509)
  %39 = bitcast i8* %38 to %struct.mgau_model_t*
  store %struct.mgau_model_t* %39, %struct.mgau_model_t** %g, align 8
  %40 = load i8** %7, align 8
  %41 = call i32 @strcmp(i8* %40, i8* getelementptr inbounds ([7 x i8]* @.str9, i32 0, i32 0)) #7
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %46

; <label>:43                                      ; preds = %37
  %44 = load %struct.mgau_model_t** %g, align 8
  %45 = getelementptr inbounds %struct.mgau_model_t* %44, i32 0, i32 7
  store i32 10001, i32* %45, align 4
  br label %55

; <label>:46                                      ; preds = %37
  %47 = load i8** %7, align 8
  %48 = call i32 @strcmp(i8* %47, i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0)) #7
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %53

; <label>:50                                      ; preds = %46
  %51 = load %struct.mgau_model_t** %g, align 8
  %52 = getelementptr inbounds %struct.mgau_model_t* %51, i32 0, i32 7
  store i32 10002, i32* %52, align 4
  br label %54

; <label>:53                                      ; preds = %46
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 516, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([42 x i8]* @.str12, i32 0, i32 0))
  br label %54

; <label>:54                                      ; preds = %53, %50
  br label %55

; <label>:55                                      ; preds = %54, %43
  %56 = load %struct.mgau_model_t** %g, align 8
  %57 = load i8** %1, align 8
  %58 = call i32 @mgau_file_read(%struct.mgau_model_t* %56, i8* %57, i32 1)
  %59 = load %struct.mgau_model_t** %g, align 8
  %60 = load i8** %2, align 8
  %61 = call i32 @mgau_file_read(%struct.mgau_model_t* %59, i8* %60, i32 2)
  %62 = load %struct.mgau_model_t** %g, align 8
  %63 = load i8** %4, align 8
  %64 = load double* %5, align 8
  %65 = call i32 @mgau_mixw_read(%struct.mgau_model_t* %62, i8* %63, double %64)
  %66 = load %struct.mgau_model_t** %g, align 8
  call void @mgau_uninit_compact(%struct.mgau_model_t* %66)
  %67 = load double* %3, align 8
  %68 = fcmp ogt double %67, 0.000000e+00
  br i1 %68, label %69, label %72

; <label>:69                                      ; preds = %55
  %70 = load %struct.mgau_model_t** %g, align 8
  %71 = load double* %3, align 8
  call void @mgau_var_floor(%struct.mgau_model_t* %70, double %71)
  br label %72

; <label>:72                                      ; preds = %69, %55
  %73 = load i32* %6, align 4
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %78

; <label>:75                                      ; preds = %72
  %76 = load %struct.mgau_model_t** %g, align 8
  %77 = call i32 @mgau_precomp(%struct.mgau_model_t* %76)
  br label %78

; <label>:78                                      ; preds = %75, %72
  %79 = call double @logs3_to_log(i32 -939524096)
  %80 = load %struct.mgau_model_t** %g, align 8
  %81 = getelementptr inbounds %struct.mgau_model_t* %80, i32 0, i32 4
  store double %79, double* %81, align 8
  %82 = load %struct.mgau_model_t** %g, align 8
  ret %struct.mgau_model_t* %82
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
  %1 = alloca %struct.mgau_model_t*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %tmp = alloca i8, align 1
  %fp = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  %n_mgau = alloca i32, align 4
  %n_feat = alloca i32, align 4
  %n_density = alloca i32, align 4
  %veclen = alloca i32*, align 8
  %blk = alloca i32, align 4
  %byteswap = alloca i32, align 4
  %chksum_present = alloca i32, align 4
  %buf = alloca float*, align 8
  %pbuf = alloca float**, align 8
  %argname = alloca i8**, align 8
  %argval = alloca i8**, align 8
  %chksum = alloca i32, align 4
  %f = alloca double, align 8
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %1, align 8
  store i8* %file_name, i8** %2, align 8
  store i32 %type, i32* %3, align 4
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 96, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  %4 = load i8** %2, align 8
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([36 x i8]* @.str37, i32 0, i32 0), i8* %4)
  %5 = load i8** %2, align 8
  %6 = call %struct._IO_FILE* @_myfopen(i8* %5, i8* getelementptr inbounds ([3 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 98)
  store %struct._IO_FILE* %6, %struct._IO_FILE** %fp, align 8
  %7 = load %struct._IO_FILE** %fp, align 8
  %8 = call i32 @bio_readhdr(%struct._IO_FILE* %7, i8*** %argname, i8*** %argval, i32* %byteswap)
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %0
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 102, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %11 = load i8** %2, align 8
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([24 x i8]* @.str21, i32 0, i32 0), i8* %11)
  br label %12

; <label>:12                                      ; preds = %10, %0
  store i32 0, i32* %chksum_present, align 4
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %55, %12
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = load i8*** %argname, align 8
  %17 = getelementptr inbounds i8** %16, i64 %15
  %18 = load i8** %17, align 8
  %19 = icmp ne i8* %18, null
  br i1 %19, label %20, label %58

; <label>:20                                      ; preds = %13
  %21 = load i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = load i8*** %argname, align 8
  %24 = getelementptr inbounds i8** %23, i64 %22
  %25 = load i8** %24, align 8
  %26 = call i32 @strcmp(i8* %25, i8* getelementptr inbounds ([8 x i8]* @.str22, i32 0, i32 0)) #7
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %44

; <label>:28                                      ; preds = %20
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load i8*** %argval, align 8
  %32 = getelementptr inbounds i8** %31, i64 %30
  %33 = load i8** %32, align 8
  %34 = call i32 @strcmp(i8* %33, i8* getelementptr inbounds ([4 x i8]* @.str23, i32 0, i32 0)) #7
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %43

; <label>:36                                      ; preds = %28
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 109, i8* getelementptr inbounds ([8 x i8]* @.str24, i32 0, i32 0))
  %37 = load i8** %2, align 8
  %38 = load i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = load i8*** %argval, align 8
  %41 = getelementptr inbounds i8** %40, i64 %39
  %42 = load i8** %41, align 8
  call void (i8*, ...)* @_E__pr_warn(i8* getelementptr inbounds ([40 x i8]* @.str25, i32 0, i32 0), i8* %37, i8* %42, i8* getelementptr inbounds ([4 x i8]* @.str23, i32 0, i32 0))
  br label %43

; <label>:43                                      ; preds = %36, %28
  br label %54

; <label>:44                                      ; preds = %20
  %45 = load i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = load i8*** %argname, align 8
  %48 = getelementptr inbounds i8** %47, i64 %46
  %49 = load i8** %48, align 8
  %50 = call i32 @strcmp(i8* %49, i8* getelementptr inbounds ([8 x i8]* @.str26, i32 0, i32 0)) #7
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %44
  store i32 1, i32* %chksum_present, align 4
  br label %53

; <label>:53                                      ; preds = %52, %44
  br label %54

; <label>:54                                      ; preds = %53, %43
  br label %55

; <label>:55                                      ; preds = %54
  %56 = load i32* %i, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %i, align 4
  br label %13

; <label>:58                                      ; preds = %13
  %59 = load i8*** %argname, align 8
  %60 = load i8*** %argval, align 8
  call void @bio_hdrarg_free(i8** %59, i8** %60)
  store i8** null, i8*** %argval, align 8
  store i8** null, i8*** %argname, align 8
  store i32 0, i32* %chksum, align 4
  %61 = bitcast i32* %n_mgau to i8*
  %62 = load %struct._IO_FILE** %fp, align 8
  %63 = load i32* %byteswap, align 4
  %64 = call i32 @bio_fread(i8* %61, i32 4, i32 1, %struct._IO_FILE* %62, i32 %63, i32* %chksum)
  %65 = icmp ne i32 %64, 1
  br i1 %65, label %66, label %68

; <label>:66                                      ; preds = %58
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 122, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %67 = load i8** %2, align 8
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([31 x i8]* @.str38, i32 0, i32 0), i8* %67)
  br label %68

; <label>:68                                      ; preds = %66, %58
  %69 = load i32* %n_mgau, align 4
  %70 = icmp sge i32 %69, 32766
  br i1 %70, label %71, label %74

; <label>:71                                      ; preds = %68
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 124, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %72 = load i8** %2, align 8
  %73 = load i32* %n_mgau, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([71 x i8]* @.str39, i32 0, i32 0), i8* %72, i32 %73, i32 32766)
  br label %74

; <label>:74                                      ; preds = %71, %68
  %75 = bitcast i32* %n_feat to i8*
  %76 = load %struct._IO_FILE** %fp, align 8
  %77 = load i32* %byteswap, align 4
  %78 = call i32 @bio_fread(i8* %75, i32 4, i32 1, %struct._IO_FILE* %76, i32 %77, i32* %chksum)
  %79 = icmp ne i32 %78, 1
  br i1 %79, label %80, label %82

; <label>:80                                      ; preds = %74
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 130, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %81 = load i8** %2, align 8
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([30 x i8]* @.str40, i32 0, i32 0), i8* %81)
  br label %82

; <label>:82                                      ; preds = %80, %74
  %83 = load %struct.mgau_model_t** %1, align 8
  %84 = getelementptr inbounds %struct.mgau_model_t* %83, i32 0, i32 7
  %85 = load i32* %84, align 4
  %86 = icmp eq i32 %85, 10001
  br i1 %86, label %87, label %93

; <label>:87                                      ; preds = %82
  %88 = load i32* %n_feat, align 4
  %89 = icmp ne i32 %88, 1
  br i1 %89, label %90, label %92

; <label>:90                                      ; preds = %87
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 134, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %91 = load i32* %n_feat, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([46 x i8]* @.str28, i32 0, i32 0), i32 %91)
  br label %92

; <label>:92                                      ; preds = %90, %87
  br label %105

; <label>:93                                      ; preds = %82
  %94 = load %struct.mgau_model_t** %1, align 8
  %95 = getelementptr inbounds %struct.mgau_model_t* %94, i32 0, i32 7
  %96 = load i32* %95, align 4
  %97 = icmp eq i32 %96, 10002
  br i1 %97, label %98, label %104

; <label>:98                                      ; preds = %93
  %99 = load i32* %n_feat, align 4
  %100 = icmp ne i32 %99, 4
  br i1 %100, label %101, label %103

; <label>:101                                     ; preds = %98
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 137, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %102 = load i32* %n_feat, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([51 x i8]* @.str41, i32 0, i32 0), i32 %102)
  br label %103

; <label>:103                                     ; preds = %101, %98
  br label %104

; <label>:104                                     ; preds = %103, %93
  br label %105

; <label>:105                                     ; preds = %104, %92
  %106 = bitcast i32* %n_density to i8*
  %107 = load %struct._IO_FILE** %fp, align 8
  %108 = load i32* %byteswap, align 4
  %109 = call i32 @bio_fread(i8* %106, i32 4, i32 1, %struct._IO_FILE* %107, i32 %108, i32* %chksum)
  %110 = icmp ne i32 %109, 1
  br i1 %110, label %111, label %113

; <label>:111                                     ; preds = %105
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 142, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %112 = load i8** %2, align 8
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([38 x i8]* @.str42, i32 0, i32 0), i8* %112)
  br label %113

; <label>:113                                     ; preds = %111, %105
  %114 = load i32* %n_feat, align 4
  %115 = sext i32 %114 to i64
  %116 = call i8* @__ckd_calloc__(i64 %115, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 146)
  %117 = bitcast i8* %116 to i32*
  store i32* %117, i32** %veclen, align 8
  %118 = load i32** %veclen, align 8
  %119 = bitcast i32* %118 to i8*
  %120 = load i32* %n_feat, align 4
  %121 = load %struct._IO_FILE** %fp, align 8
  %122 = load i32* %byteswap, align 4
  %123 = call i32 @bio_fread(i8* %119, i32 4, i32 %120, %struct._IO_FILE* %121, i32 %122, i32* %chksum)
  %124 = load i32* %n_feat, align 4
  %125 = icmp ne i32 %123, %124
  br i1 %125, label %126, label %128

; <label>:126                                     ; preds = %113
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 149, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %127 = load i8** %2, align 8
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([36 x i8]* @.str43, i32 0, i32 0), i8* %127)
  br label %128

; <label>:128                                     ; preds = %126, %113
  store i32 0, i32* %i, align 4
  store i32 0, i32* %blk, align 4
  br label %129

; <label>:129                                     ; preds = %141, %128
  %130 = load i32* %i, align 4
  %131 = load i32* %n_feat, align 4
  %132 = icmp slt i32 %130, %131
  br i1 %132, label %133, label %144

; <label>:133                                     ; preds = %129
  %134 = load i32* %i, align 4
  %135 = sext i32 %134 to i64
  %136 = load i32** %veclen, align 8
  %137 = getelementptr inbounds i32* %136, i64 %135
  %138 = load i32* %137, align 4
  %139 = load i32* %blk, align 4
  %140 = add nsw i32 %139, %138
  store i32 %140, i32* %blk, align 4
  br label %141

; <label>:141                                     ; preds = %133
  %142 = load i32* %i, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %i, align 4
  br label %129

; <label>:144                                     ; preds = %129
  %145 = bitcast i32* %n to i8*
  %146 = load %struct._IO_FILE** %fp, align 8
  %147 = load i32* %byteswap, align 4
  %148 = call i32 @bio_fread(i8* %145, i32 4, i32 1, %struct._IO_FILE* %146, i32 %147, i32* %chksum)
  %149 = icmp ne i32 %148, 1
  br i1 %149, label %150, label %152

; <label>:150                                     ; preds = %144
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 159, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %151 = load i8** %2, align 8
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([34 x i8]* @.str44, i32 0, i32 0), i8* %151)
  br label %152

; <label>:152                                     ; preds = %150, %144
  %153 = load i32* %n, align 4
  %154 = load i32* %n_mgau, align 4
  %155 = load i32* %n_density, align 4
  %156 = mul nsw i32 %154, %155
  %157 = load i32* %blk, align 4
  %158 = mul nsw i32 %156, %157
  %159 = icmp ne i32 %153, %158
  br i1 %159, label %160, label %166

; <label>:160                                     ; preds = %152
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 162, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %161 = load i8** %2, align 8
  %162 = load i32* %n, align 4
  %163 = load i32* %n_mgau, align 4
  %164 = load i32* %n_density, align 4
  %165 = load i32* %blk, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([58 x i8]* @.str45, i32 0, i32 0), i8* %161, i32 %162, i32 %163, i32 %164, i32 %165)
  br label %166

; <label>:166                                     ; preds = %160, %152
  %167 = load %struct.mgau_model_t** %1, align 8
  %168 = getelementptr inbounds %struct.mgau_model_t* %167, i32 0, i32 7
  %169 = load i32* %168, align 4
  %170 = icmp eq i32 %169, 10002
  br i1 %170, label %171, label %172

; <label>:171                                     ; preds = %166
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 167, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([50 x i8]* @.str46, i32 0, i32 0))
  br label %172

; <label>:172                                     ; preds = %171, %166
  %173 = load i32* %3, align 4
  %174 = icmp eq i32 %173, 1
  br i1 %174, label %175, label %263

; <label>:175                                     ; preds = %172
  %176 = load i32* %n_mgau, align 4
  %177 = load %struct.mgau_model_t** %1, align 8
  %178 = getelementptr inbounds %struct.mgau_model_t* %177, i32 0, i32 0
  store i32 %176, i32* %178, align 4
  %179 = load i32* %n_density, align 4
  %180 = load %struct.mgau_model_t** %1, align 8
  %181 = getelementptr inbounds %struct.mgau_model_t* %180, i32 0, i32 1
  store i32 %179, i32* %181, align 4
  %182 = load i32* %blk, align 4
  %183 = load %struct.mgau_model_t** %1, align 8
  %184 = getelementptr inbounds %struct.mgau_model_t* %183, i32 0, i32 2
  store i32 %182, i32* %184, align 4
  %185 = load i32* %n_mgau, align 4
  %186 = sext i32 %185 to i64
  %187 = call i8* @__ckd_calloc__(i64 %186, i64 40, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 175)
  %188 = bitcast i8* %187 to %struct.mgau_t*
  %189 = load %struct.mgau_model_t** %1, align 8
  %190 = getelementptr inbounds %struct.mgau_model_t* %189, i32 0, i32 3
  store %struct.mgau_t* %188, %struct.mgau_t** %190, align 8
  %191 = load i32* %n, align 4
  %192 = sext i32 %191 to i64
  %193 = call i8* @__ckd_calloc__(i64 %192, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 177)
  %194 = bitcast i8* %193 to float*
  store float* %194, float** %buf, align 8
  %195 = load i32* %n_mgau, align 4
  %196 = load i32* %n_density, align 4
  %197 = mul nsw i32 %195, %196
  %198 = sext i32 %197 to i64
  %199 = call i8* @__ckd_calloc__(i64 %198, i64 8, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 178)
  %200 = bitcast i8* %199 to float**
  store float** %200, float*** %pbuf, align 8
  store i32 0, i32* %i, align 4
  br label %201

; <label>:201                                     ; preds = %251, %175
  %202 = load i32* %i, align 4
  %203 = load i32* %n_mgau, align 4
  %204 = icmp slt i32 %202, %203
  br i1 %204, label %205, label %254

; <label>:205                                     ; preds = %201
  %206 = load i32* %n_density, align 4
  %207 = load i32* %i, align 4
  %208 = sext i32 %207 to i64
  %209 = load %struct.mgau_model_t** %1, align 8
  %210 = getelementptr inbounds %struct.mgau_model_t* %209, i32 0, i32 3
  %211 = load %struct.mgau_t** %210, align 8
  %212 = getelementptr inbounds %struct.mgau_t* %211, i64 %208
  %213 = getelementptr inbounds %struct.mgau_t* %212, i32 0, i32 0
  store i32 %206, i32* %213, align 4
  %214 = load float*** %pbuf, align 8
  %215 = load i32* %i, align 4
  %216 = sext i32 %215 to i64
  %217 = load %struct.mgau_model_t** %1, align 8
  %218 = getelementptr inbounds %struct.mgau_model_t* %217, i32 0, i32 3
  %219 = load %struct.mgau_t** %218, align 8
  %220 = getelementptr inbounds %struct.mgau_t* %219, i64 %216
  %221 = getelementptr inbounds %struct.mgau_t* %220, i32 0, i32 1
  store float** %214, float*** %221, align 8
  store i32 0, i32* %k, align 4
  br label %222

; <label>:222                                     ; preds = %243, %205
  %223 = load i32* %k, align 4
  %224 = load i32* %n_density, align 4
  %225 = icmp slt i32 %223, %224
  br i1 %225, label %226, label %246

; <label>:226                                     ; preds = %222
  %227 = load float** %buf, align 8
  %228 = load i32* %k, align 4
  %229 = sext i32 %228 to i64
  %230 = load i32* %i, align 4
  %231 = sext i32 %230 to i64
  %232 = load %struct.mgau_model_t** %1, align 8
  %233 = getelementptr inbounds %struct.mgau_model_t* %232, i32 0, i32 3
  %234 = load %struct.mgau_t** %233, align 8
  %235 = getelementptr inbounds %struct.mgau_t* %234, i64 %231
  %236 = getelementptr inbounds %struct.mgau_t* %235, i32 0, i32 1
  %237 = load float*** %236, align 8
  %238 = getelementptr inbounds float** %237, i64 %229
  store float* %227, float** %238, align 8
  %239 = load i32* %blk, align 4
  %240 = load float** %buf, align 8
  %241 = sext i32 %239 to i64
  %242 = getelementptr inbounds float* %240, i64 %241
  store float* %242, float** %buf, align 8
  br label %243

; <label>:243                                     ; preds = %226
  %244 = load i32* %k, align 4
  %245 = add nsw i32 %244, 1
  store i32 %245, i32* %k, align 4
  br label %222

; <label>:246                                     ; preds = %222
  %247 = load i32* %n_density, align 4
  %248 = load float*** %pbuf, align 8
  %249 = sext i32 %247 to i64
  %250 = getelementptr inbounds float** %248, i64 %249
  store float** %250, float*** %pbuf, align 8
  br label %251

; <label>:251                                     ; preds = %246
  %252 = load i32* %i, align 4
  %253 = add nsw i32 %252, 1
  store i32 %253, i32* %i, align 4
  br label %201

; <label>:254                                     ; preds = %201
  %255 = load %struct.mgau_model_t** %1, align 8
  %256 = getelementptr inbounds %struct.mgau_model_t* %255, i32 0, i32 3
  %257 = load %struct.mgau_t** %256, align 8
  %258 = getelementptr inbounds %struct.mgau_t* %257, i64 0
  %259 = getelementptr inbounds %struct.mgau_t* %258, i32 0, i32 1
  %260 = load float*** %259, align 8
  %261 = getelementptr inbounds float** %260, i64 0
  %262 = load float** %261, align 8
  store float* %262, float** %buf, align 8
  br label %416

; <label>:263                                     ; preds = %172
  %264 = load i32* %3, align 4
  %265 = icmp eq i32 %264, 2
  br i1 %265, label %266, label %267

; <label>:266                                     ; preds = %263
  br label %269

; <label>:267                                     ; preds = %263
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8]* @.str47, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 195, i8* getelementptr inbounds ([52 x i8]* @__PRETTY_FUNCTION__.mgau_file_read, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %269

; <label>:269                                     ; preds = %268, %266
  %270 = load %struct.mgau_model_t** %1, align 8
  %271 = getelementptr inbounds %struct.mgau_model_t* %270, i32 0, i32 0
  %272 = load i32* %271, align 4
  %273 = load i32* %n_mgau, align 4
  %274 = icmp ne i32 %272, %273
  br i1 %274, label %275, label %280

; <label>:275                                     ; preds = %269
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 198, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %276 = load i32* %n_mgau, align 4
  %277 = load %struct.mgau_model_t** %1, align 8
  %278 = getelementptr inbounds %struct.mgau_model_t* %277, i32 0, i32 0
  %279 = load i32* %278, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([47 x i8]* @.str48, i32 0, i32 0), i32 %276, i32 %279)
  br label %280

; <label>:280                                     ; preds = %275, %269
  %281 = load %struct.mgau_model_t** %1, align 8
  %282 = getelementptr inbounds %struct.mgau_model_t* %281, i32 0, i32 1
  %283 = load i32* %282, align 4
  %284 = load i32* %n_density, align 4
  %285 = icmp ne i32 %283, %284
  br i1 %285, label %286, label %291

; <label>:286                                     ; preds = %280
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 200, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %287 = load i32* %n_density, align 4
  %288 = load %struct.mgau_model_t** %1, align 8
  %289 = getelementptr inbounds %struct.mgau_model_t* %288, i32 0, i32 1
  %290 = load i32* %289, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([49 x i8]* @.str49, i32 0, i32 0), i32 %287, i32 %290)
  br label %291

; <label>:291                                     ; preds = %286, %280
  %292 = load %struct.mgau_model_t** %1, align 8
  %293 = getelementptr inbounds %struct.mgau_model_t* %292, i32 0, i32 2
  %294 = load i32* %293, align 4
  %295 = load i32* %blk, align 4
  %296 = icmp ne i32 %294, %295
  br i1 %296, label %297, label %302

; <label>:297                                     ; preds = %291
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 202, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %298 = load i32* %blk, align 4
  %299 = load %struct.mgau_model_t** %1, align 8
  %300 = getelementptr inbounds %struct.mgau_model_t* %299, i32 0, i32 2
  %301 = load i32* %300, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([52 x i8]* @.str50, i32 0, i32 0), i32 %298, i32 %301)
  br label %302

; <label>:302                                     ; preds = %297, %291
  %303 = load i32* %n, align 4
  %304 = sext i32 %303 to i64
  %305 = call i8* @__ckd_calloc__(i64 %304, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 204)
  %306 = bitcast i8* %305 to float*
  store float* %306, float** %buf, align 8
  %307 = load i32* %n_mgau, align 4
  %308 = load i32* %n_density, align 4
  %309 = mul nsw i32 %307, %308
  %310 = sext i32 %309 to i64
  %311 = call i8* @__ckd_calloc__(i64 %310, i64 8, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 205)
  %312 = bitcast i8* %311 to float**
  store float** %312, float*** %pbuf, align 8
  store i32 0, i32* %i, align 4
  br label %313

; <label>:313                                     ; preds = %377, %302
  %314 = load i32* %i, align 4
  %315 = load i32* %n_mgau, align 4
  %316 = icmp slt i32 %314, %315
  br i1 %316, label %317, label %380

; <label>:317                                     ; preds = %313
  %318 = load i32* %i, align 4
  %319 = sext i32 %318 to i64
  %320 = load %struct.mgau_model_t** %1, align 8
  %321 = getelementptr inbounds %struct.mgau_model_t* %320, i32 0, i32 3
  %322 = load %struct.mgau_t** %321, align 8
  %323 = getelementptr inbounds %struct.mgau_t* %322, i64 %319
  %324 = getelementptr inbounds %struct.mgau_t* %323, i32 0, i32 0
  %325 = load i32* %324, align 4
  %326 = load i32* %n_density, align 4
  %327 = icmp ne i32 %325, %326
  br i1 %327, label %328, label %339

; <label>:328                                     ; preds = %317
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 210, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %329 = load i32* %i, align 4
  %330 = load i32* %n_density, align 4
  %331 = load i32* %i, align 4
  %332 = sext i32 %331 to i64
  %333 = load %struct.mgau_model_t** %1, align 8
  %334 = getelementptr inbounds %struct.mgau_model_t* %333, i32 0, i32 3
  %335 = load %struct.mgau_t** %334, align 8
  %336 = getelementptr inbounds %struct.mgau_t* %335, i64 %332
  %337 = getelementptr inbounds %struct.mgau_t* %336, i32 0, i32 0
  %338 = load i32* %337, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([61 x i8]* @.str51, i32 0, i32 0), i32 %329, i32 %330, i32 %338)
  br label %339

; <label>:339                                     ; preds = %328, %317
  %340 = load float*** %pbuf, align 8
  %341 = load i32* %i, align 4
  %342 = sext i32 %341 to i64
  %343 = load %struct.mgau_model_t** %1, align 8
  %344 = getelementptr inbounds %struct.mgau_model_t* %343, i32 0, i32 3
  %345 = load %struct.mgau_t** %344, align 8
  %346 = getelementptr inbounds %struct.mgau_t* %345, i64 %342
  %347 = getelementptr inbounds %struct.mgau_t* %346, i32 0, i32 2
  store float** %340, float*** %347, align 8
  store i32 0, i32* %k, align 4
  br label %348

; <label>:348                                     ; preds = %369, %339
  %349 = load i32* %k, align 4
  %350 = load i32* %n_density, align 4
  %351 = icmp slt i32 %349, %350
  br i1 %351, label %352, label %372

; <label>:352                                     ; preds = %348
  %353 = load float** %buf, align 8
  %354 = load i32* %k, align 4
  %355 = sext i32 %354 to i64
  %356 = load i32* %i, align 4
  %357 = sext i32 %356 to i64
  %358 = load %struct.mgau_model_t** %1, align 8
  %359 = getelementptr inbounds %struct.mgau_model_t* %358, i32 0, i32 3
  %360 = load %struct.mgau_t** %359, align 8
  %361 = getelementptr inbounds %struct.mgau_t* %360, i64 %357
  %362 = getelementptr inbounds %struct.mgau_t* %361, i32 0, i32 2
  %363 = load float*** %362, align 8
  %364 = getelementptr inbounds float** %363, i64 %355
  store float* %353, float** %364, align 8
  %365 = load i32* %blk, align 4
  %366 = load float** %buf, align 8
  %367 = sext i32 %365 to i64
  %368 = getelementptr inbounds float* %366, i64 %367
  store float* %368, float** %buf, align 8
  br label %369

; <label>:369                                     ; preds = %352
  %370 = load i32* %k, align 4
  %371 = add nsw i32 %370, 1
  store i32 %371, i32* %k, align 4
  br label %348

; <label>:372                                     ; preds = %348
  %373 = load i32* %n_density, align 4
  %374 = load float*** %pbuf, align 8
  %375 = sext i32 %373 to i64
  %376 = getelementptr inbounds float** %374, i64 %375
  store float** %376, float*** %pbuf, align 8
  br label %377

; <label>:377                                     ; preds = %372
  %378 = load i32* %i, align 4
  %379 = add nsw i32 %378, 1
  store i32 %379, i32* %i, align 4
  br label %313

; <label>:380                                     ; preds = %313
  %381 = load i32* %n_mgau, align 4
  %382 = load i32* %n_density, align 4
  %383 = mul nsw i32 %381, %382
  %384 = sext i32 %383 to i64
  %385 = call i8* @__ckd_calloc__(i64 %384, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 224)
  %386 = bitcast i8* %385 to float*
  store float* %386, float** %buf, align 8
  store i32 0, i32* %i, align 4
  br label %387

; <label>:387                                     ; preds = %404, %380
  %388 = load i32* %i, align 4
  %389 = load i32* %n_mgau, align 4
  %390 = icmp slt i32 %388, %389
  br i1 %390, label %391, label %407

; <label>:391                                     ; preds = %387
  %392 = load float** %buf, align 8
  %393 = load i32* %i, align 4
  %394 = sext i32 %393 to i64
  %395 = load %struct.mgau_model_t** %1, align 8
  %396 = getelementptr inbounds %struct.mgau_model_t* %395, i32 0, i32 3
  %397 = load %struct.mgau_t** %396, align 8
  %398 = getelementptr inbounds %struct.mgau_t* %397, i64 %394
  %399 = getelementptr inbounds %struct.mgau_t* %398, i32 0, i32 3
  store float* %392, float** %399, align 8
  %400 = load i32* %n_density, align 4
  %401 = load float** %buf, align 8
  %402 = sext i32 %400 to i64
  %403 = getelementptr inbounds float* %401, i64 %402
  store float* %403, float** %buf, align 8
  br label %404

; <label>:404                                     ; preds = %391
  %405 = load i32* %i, align 4
  %406 = add nsw i32 %405, 1
  store i32 %406, i32* %i, align 4
  br label %387

; <label>:407                                     ; preds = %387
  %408 = load %struct.mgau_model_t** %1, align 8
  %409 = getelementptr inbounds %struct.mgau_model_t* %408, i32 0, i32 3
  %410 = load %struct.mgau_t** %409, align 8
  %411 = getelementptr inbounds %struct.mgau_t* %410, i64 0
  %412 = getelementptr inbounds %struct.mgau_t* %411, i32 0, i32 2
  %413 = load float*** %412, align 8
  %414 = getelementptr inbounds float** %413, i64 0
  %415 = load float** %414, align 8
  store float* %415, float** %buf, align 8
  br label %416

; <label>:416                                     ; preds = %407, %254
  %417 = load float** %buf, align 8
  %418 = bitcast float* %417 to i8*
  %419 = load i32* %n, align 4
  %420 = load %struct._IO_FILE** %fp, align 8
  %421 = load i32* %byteswap, align 4
  %422 = call i32 @bio_fread(i8* %418, i32 4, i32 %419, %struct._IO_FILE* %420, i32 %421, i32* %chksum)
  %423 = load i32* %n, align 4
  %424 = icmp ne i32 %422, %423
  br i1 %424, label %425, label %427

; <label>:425                                     ; preds = %416
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 236, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %426 = load i8** %2, align 8
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([32 x i8]* @.str52, i32 0, i32 0), i8* %426)
  br label %427

; <label>:427                                     ; preds = %425, %416
  %428 = call double @log_to_logs3_factor()
  store double %428, double* %f, align 8
  %429 = load i32* %chksum_present, align 4
  %430 = icmp ne i32 %429, 0
  br i1 %430, label %431, label %435

; <label>:431                                     ; preds = %427
  %432 = load %struct._IO_FILE** %fp, align 8
  %433 = load i32* %byteswap, align 4
  %434 = load i32* %chksum, align 4
  call void @bio_verify_chksum(%struct._IO_FILE* %432, i32 %433, i32 %434)
  br label %435

; <label>:435                                     ; preds = %431, %427
  %436 = load %struct._IO_FILE** %fp, align 8
  %437 = call i64 @fread(i8* %tmp, i64 1, i64 1, %struct._IO_FILE* %436)
  %438 = icmp eq i64 %437, 1
  br i1 %438, label %439, label %441

; <label>:439                                     ; preds = %435
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 244, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %440 = load i8** %2, align 8
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([29 x i8]* @.str53, i32 0, i32 0), i8* %440)
  br label %441

; <label>:441                                     ; preds = %439, %435
  %442 = load %struct._IO_FILE** %fp, align 8
  %443 = call i32 @fclose(%struct._IO_FILE* %442)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 248, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  %444 = load i32* %n_mgau, align 4
  %445 = load i32* %n_density, align 4
  %446 = load i32* %n_feat, align 4
  %447 = load i32* %blk, align 4
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([60 x i8]* @.str54, i32 0, i32 0), i32 %444, i32 %445, i32 %446, i32 %447)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @mgau_mixw_read(%struct.mgau_model_t* %g, i8* %file_name, double %mixwfloor) #0 {
  %1 = alloca %struct.mgau_model_t*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca double, align 8
  %argname = alloca i8**, align 8
  %argval = alloca i8**, align 8
  %eofchk = alloca i8, align 1
  %fp = alloca %struct._IO_FILE*, align 8
  %byteswap = alloca i32, align 4
  %chksum_present = alloca i32, align 4
  %chksum = alloca i32, align 4
  %buf = alloca i32*, align 8
  %pdf = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca i32, align 4
  %n_mgau = alloca i32, align 4
  %n_feat = alloca i32, align 4
  %n_comp = alloca i32, align 4
  %n_err = alloca i32, align 4
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %1, align 8
  store i8* %file_name, i8** %2, align 8
  store double %mixwfloor, double* %3, align 8
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 269, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  %4 = load i8** %2, align 8
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([35 x i8]* @.str19, i32 0, i32 0), i8* %4)
  %5 = load i8** %2, align 8
  %6 = call %struct._IO_FILE* @_myfopen(i8* %5, i8* getelementptr inbounds ([3 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 271)
  store %struct._IO_FILE* %6, %struct._IO_FILE** %fp, align 8
  %7 = load %struct._IO_FILE** %fp, align 8
  %8 = call i32 @bio_readhdr(%struct._IO_FILE* %7, i8*** %argname, i8*** %argval, i32* %byteswap)
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %0
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 275, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %11 = load i8** %2, align 8
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([24 x i8]* @.str21, i32 0, i32 0), i8* %11)
  br label %12

; <label>:12                                      ; preds = %10, %0
  store i32 0, i32* %chksum_present, align 4
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %55, %12
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = load i8*** %argname, align 8
  %17 = getelementptr inbounds i8** %16, i64 %15
  %18 = load i8** %17, align 8
  %19 = icmp ne i8* %18, null
  br i1 %19, label %20, label %58

; <label>:20                                      ; preds = %13
  %21 = load i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = load i8*** %argname, align 8
  %24 = getelementptr inbounds i8** %23, i64 %22
  %25 = load i8** %24, align 8
  %26 = call i32 @strcmp(i8* %25, i8* getelementptr inbounds ([8 x i8]* @.str22, i32 0, i32 0)) #7
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %44

; <label>:28                                      ; preds = %20
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load i8*** %argval, align 8
  %32 = getelementptr inbounds i8** %31, i64 %30
  %33 = load i8** %32, align 8
  %34 = call i32 @strcmp(i8* %33, i8* getelementptr inbounds ([4 x i8]* @.str23, i32 0, i32 0)) #7
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %43

; <label>:36                                      ; preds = %28
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 282, i8* getelementptr inbounds ([8 x i8]* @.str24, i32 0, i32 0))
  %37 = load i8** %2, align 8
  %38 = load i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = load i8*** %argval, align 8
  %41 = getelementptr inbounds i8** %40, i64 %39
  %42 = load i8** %41, align 8
  call void (i8*, ...)* @_E__pr_warn(i8* getelementptr inbounds ([40 x i8]* @.str25, i32 0, i32 0), i8* %37, i8* %42, i8* getelementptr inbounds ([4 x i8]* @.str23, i32 0, i32 0))
  br label %43

; <label>:43                                      ; preds = %36, %28
  br label %54

; <label>:44                                      ; preds = %20
  %45 = load i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = load i8*** %argname, align 8
  %48 = getelementptr inbounds i8** %47, i64 %46
  %49 = load i8** %48, align 8
  %50 = call i32 @strcmp(i8* %49, i8* getelementptr inbounds ([8 x i8]* @.str26, i32 0, i32 0)) #7
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %44
  store i32 1, i32* %chksum_present, align 4
  br label %53

; <label>:53                                      ; preds = %52, %44
  br label %54

; <label>:54                                      ; preds = %53, %43
  br label %55

; <label>:55                                      ; preds = %54
  %56 = load i32* %i, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %i, align 4
  br label %13

; <label>:58                                      ; preds = %13
  %59 = load i8*** %argname, align 8
  %60 = load i8*** %argval, align 8
  call void @bio_hdrarg_free(i8** %59, i8** %60)
  store i8** null, i8*** %argval, align 8
  store i8** null, i8*** %argname, align 8
  store i32 0, i32* %chksum, align 4
  %61 = bitcast i32* %n_mgau to i8*
  %62 = load %struct._IO_FILE** %fp, align 8
  %63 = load i32* %byteswap, align 4
  %64 = call i32 @bio_fread(i8* %61, i32 4, i32 1, %struct._IO_FILE* %62, i32 %63, i32* %chksum)
  %65 = icmp ne i32 %64, 1
  br i1 %65, label %84, label %66

; <label>:66                                      ; preds = %58
  %67 = bitcast i32* %n_feat to i8*
  %68 = load %struct._IO_FILE** %fp, align 8
  %69 = load i32* %byteswap, align 4
  %70 = call i32 @bio_fread(i8* %67, i32 4, i32 1, %struct._IO_FILE* %68, i32 %69, i32* %chksum)
  %71 = icmp ne i32 %70, 1
  br i1 %71, label %84, label %72

; <label>:72                                      ; preds = %66
  %73 = bitcast i32* %n_comp to i8*
  %74 = load %struct._IO_FILE** %fp, align 8
  %75 = load i32* %byteswap, align 4
  %76 = call i32 @bio_fread(i8* %73, i32 4, i32 1, %struct._IO_FILE* %74, i32 %75, i32* %chksum)
  %77 = icmp ne i32 %76, 1
  br i1 %77, label %84, label %78

; <label>:78                                      ; preds = %72
  %79 = bitcast i32* %n to i8*
  %80 = load %struct._IO_FILE** %fp, align 8
  %81 = load i32* %byteswap, align 4
  %82 = call i32 @bio_fread(i8* %79, i32 4, i32 1, %struct._IO_FILE* %80, i32 %81, i32* %chksum)
  %83 = icmp ne i32 %82, 1
  br i1 %83, label %84, label %86

; <label>:84                                      ; preds = %78, %72, %66, %58
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 298, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %85 = load i8** %2, align 8
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([34 x i8]* @.str27, i32 0, i32 0), i8* %85)
  br label %86

; <label>:86                                      ; preds = %84, %78
  %87 = load %struct.mgau_model_t** %1, align 8
  %88 = getelementptr inbounds %struct.mgau_model_t* %87, i32 0, i32 7
  %89 = load i32* %88, align 4
  %90 = icmp eq i32 %89, 10001
  br i1 %90, label %91, label %97

; <label>:91                                      ; preds = %86
  %92 = load i32* %n_feat, align 4
  %93 = icmp ne i32 %92, 1
  br i1 %93, label %94, label %96

; <label>:94                                      ; preds = %91
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 302, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %95 = load i32* %n_feat, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([46 x i8]* @.str28, i32 0, i32 0), i32 %95)
  br label %96

; <label>:96                                      ; preds = %94, %91
  br label %110

; <label>:97                                      ; preds = %86
  %98 = load %struct.mgau_model_t** %1, align 8
  %99 = getelementptr inbounds %struct.mgau_model_t* %98, i32 0, i32 7
  %100 = load i32* %99, align 4
  %101 = icmp eq i32 %100, 10002
  br i1 %101, label %102, label %108

; <label>:102                                     ; preds = %97
  %103 = load i32* %n_feat, align 4
  %104 = icmp ne i32 %103, 4
  br i1 %104, label %105, label %107

; <label>:105                                     ; preds = %102
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 305, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %106 = load i32* %n_feat, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([51 x i8]* @.str29, i32 0, i32 0), i32 %106)
  br label %107

; <label>:107                                     ; preds = %105, %102
  br label %109

; <label>:108                                     ; preds = %97
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 307, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([116 x i8]* @.str30, i32 0, i32 0))
  br label %109

; <label>:109                                     ; preds = %108, %107
  br label %110

; <label>:110                                     ; preds = %109, %96
  %111 = load i32* %n, align 4
  %112 = load i32* %n_mgau, align 4
  %113 = load i32* %n_comp, align 4
  %114 = mul nsw i32 %112, %113
  %115 = icmp ne i32 %111, %114
  br i1 %115, label %116, label %121

; <label>:116                                     ; preds = %110
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 311, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %117 = load i8** %2, align 8
  %118 = load i32* %i, align 4
  %119 = load i32* %n_mgau, align 4
  %120 = load i32* %n_comp, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([60 x i8]* @.str31, i32 0, i32 0), i8* %117, i32 %118, i32 %119, i32 %120)
  br label %121

; <label>:121                                     ; preds = %116, %110
  %122 = load i32* %n_mgau, align 4
  %123 = load %struct.mgau_model_t** %1, align 8
  %124 = getelementptr inbounds %struct.mgau_model_t* %123, i32 0, i32 0
  %125 = load i32* %124, align 4
  %126 = icmp ne i32 %122, %125
  br i1 %126, label %127, label %132

; <label>:127                                     ; preds = %121
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 315, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %128 = load i32* %n_mgau, align 4
  %129 = load %struct.mgau_model_t** %1, align 8
  %130 = getelementptr inbounds %struct.mgau_model_t* %129, i32 0, i32 0
  %131 = load i32* %130, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([66 x i8]* @.str32, i32 0, i32 0), i32 %128, i32 %131)
  br label %132

; <label>:132                                     ; preds = %127, %121
  %133 = load i32* %n_mgau, align 4
  %134 = load i32* %n_comp, align 4
  %135 = mul nsw i32 %133, %134
  %136 = sext i32 %135 to i64
  %137 = call i8* @__ckd_calloc__(i64 %136, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 318)
  %138 = bitcast i8* %137 to i32*
  store i32* %138, i32** %buf, align 8
  store i32 0, i32* %i, align 4
  br label %139

; <label>:139                                     ; preds = %185, %132
  %140 = load i32* %i, align 4
  %141 = load i32* %n_mgau, align 4
  %142 = icmp slt i32 %140, %141
  br i1 %142, label %143, label %188

; <label>:143                                     ; preds = %139
  %144 = load i32* %n_comp, align 4
  %145 = load i32* %i, align 4
  %146 = sext i32 %145 to i64
  %147 = load %struct.mgau_model_t** %1, align 8
  %148 = getelementptr inbounds %struct.mgau_model_t* %147, i32 0, i32 3
  %149 = load %struct.mgau_t** %148, align 8
  %150 = getelementptr inbounds %struct.mgau_t* %149, i64 %146
  %151 = getelementptr inbounds %struct.mgau_t* %150, i32 0, i32 0
  %152 = load i32* %151, align 4
  %153 = icmp ne i32 %144, %152
  br i1 %153, label %154, label %165

; <label>:154                                     ; preds = %143
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 321, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %155 = load i32* %i, align 4
  %156 = load i32* %n_comp, align 4
  %157 = load i32* %i, align 4
  %158 = sext i32 %157 to i64
  %159 = load %struct.mgau_model_t** %1, align 8
  %160 = getelementptr inbounds %struct.mgau_model_t* %159, i32 0, i32 3
  %161 = load %struct.mgau_t** %160, align 8
  %162 = getelementptr inbounds %struct.mgau_t* %161, i64 %158
  %163 = getelementptr inbounds %struct.mgau_t* %162, i32 0, i32 0
  %164 = load i32* %163, align 4
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([65 x i8]* @.str33, i32 0, i32 0), i32 %155, i32 %156, i32 %164)
  br label %165

; <label>:165                                     ; preds = %154, %143
  %166 = load i32** %buf, align 8
  %167 = load i32* %i, align 4
  %168 = sext i32 %167 to i64
  %169 = load %struct.mgau_model_t** %1, align 8
  %170 = getelementptr inbounds %struct.mgau_model_t* %169, i32 0, i32 3
  %171 = load %struct.mgau_t** %170, align 8
  %172 = getelementptr inbounds %struct.mgau_t* %171, i64 %168
  %173 = getelementptr inbounds %struct.mgau_t* %172, i32 0, i32 4
  store i32* %166, i32** %173, align 8
  %174 = load i32* %i, align 4
  %175 = sext i32 %174 to i64
  %176 = load %struct.mgau_model_t** %1, align 8
  %177 = getelementptr inbounds %struct.mgau_model_t* %176, i32 0, i32 3
  %178 = load %struct.mgau_t** %177, align 8
  %179 = getelementptr inbounds %struct.mgau_t* %178, i64 %175
  %180 = getelementptr inbounds %struct.mgau_t* %179, i32 0, i32 0
  %181 = load i32* %180, align 4
  %182 = load i32** %buf, align 8
  %183 = sext i32 %181 to i64
  %184 = getelementptr inbounds i32* %182, i64 %183
  store i32* %184, i32** %buf, align 8
  br label %185

; <label>:185                                     ; preds = %165
  %186 = load i32* %i, align 4
  %187 = add nsw i32 %186, 1
  store i32 %187, i32* %i, align 4
  br label %139

; <label>:188                                     ; preds = %139
  %189 = load i32* %n_comp, align 4
  %190 = sext i32 %189 to i64
  %191 = call i8* @__ckd_calloc__(i64 %190, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 329)
  %192 = bitcast i8* %191 to float*
  store float* %192, float** %pdf, align 8
  store i32 0, i32* %n_err, align 4
  store i32 0, i32* %i, align 4
  br label %193

; <label>:193                                     ; preds = %282, %188
  %194 = load i32* %i, align 4
  %195 = load i32* %n_mgau, align 4
  %196 = icmp slt i32 %194, %195
  br i1 %196, label %197, label %285

; <label>:197                                     ; preds = %193
  %198 = load float** %pdf, align 8
  %199 = bitcast float* %198 to i8*
  %200 = load i32* %n_comp, align 4
  %201 = load %struct._IO_FILE** %fp, align 8
  %202 = load i32* %byteswap, align 4
  %203 = call i32 @bio_fread(i8* %199, i32 4, i32 %200, %struct._IO_FILE* %201, i32 %202, i32* %chksum)
  %204 = load i32* %n_comp, align 4
  %205 = icmp ne i32 %203, %204
  br i1 %205, label %206, label %208

; <label>:206                                     ; preds = %197
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 335, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %207 = load i8** %2, align 8
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([34 x i8]* @.str34, i32 0, i32 0), i8* %207)
  br label %208

; <label>:208                                     ; preds = %206, %197
  %209 = load float** %pdf, align 8
  %210 = load i32* %n_comp, align 4
  %211 = call i32 @vector_is_zero(float* %209, i32 %210)
  %212 = icmp ne i32 %211, 0
  br i1 %212, label %213, label %236

; <label>:213                                     ; preds = %208
  %214 = load i32* %n_err, align 4
  %215 = add nsw i32 %214, 1
  store i32 %215, i32* %n_err, align 4
  store i32 0, i32* %j, align 4
  br label %216

; <label>:216                                     ; preds = %232, %213
  %217 = load i32* %j, align 4
  %218 = load i32* %n_comp, align 4
  %219 = icmp slt i32 %217, %218
  br i1 %219, label %220, label %235

; <label>:220                                     ; preds = %216
  %221 = load i32* %j, align 4
  %222 = sext i32 %221 to i64
  %223 = load i32* %i, align 4
  %224 = sext i32 %223 to i64
  %225 = load %struct.mgau_model_t** %1, align 8
  %226 = getelementptr inbounds %struct.mgau_model_t* %225, i32 0, i32 3
  %227 = load %struct.mgau_t** %226, align 8
  %228 = getelementptr inbounds %struct.mgau_t* %227, i64 %224
  %229 = getelementptr inbounds %struct.mgau_t* %228, i32 0, i32 4
  %230 = load i32** %229, align 8
  %231 = getelementptr inbounds i32* %230, i64 %222
  store i32 -939524096, i32* %231, align 4
  br label %232

; <label>:232                                     ; preds = %220
  %233 = load i32* %j, align 4
  %234 = add nsw i32 %233, 1
  store i32 %234, i32* %j, align 4
  br label %216

; <label>:235                                     ; preds = %216
  br label %281

; <label>:236                                     ; preds = %208
  %237 = load float** %pdf, align 8
  %238 = load i32* %n_comp, align 4
  %239 = load double* %3, align 8
  call void @vector_nz_floor(float* %237, i32 %238, double %239)
  %240 = load float** %pdf, align 8
  %241 = load i32* %n_comp, align 4
  %242 = call double @vector_sum_norm(float* %240, i32 %241)
  store i32 0, i32* %j, align 4
  br label %243

; <label>:243                                     ; preds = %277, %236
  %244 = load i32* %j, align 4
  %245 = load i32* %n_comp, align 4
  %246 = icmp slt i32 %244, %245
  br i1 %246, label %247, label %280

; <label>:247                                     ; preds = %243
  %248 = load i32* %j, align 4
  %249 = sext i32 %248 to i64
  %250 = load float** %pdf, align 8
  %251 = getelementptr inbounds float* %250, i64 %249
  %252 = load float* %251, align 4
  %253 = fpext float %252 to double
  %254 = fcmp une double %253, 0.000000e+00
  br i1 %254, label %255, label %263

; <label>:255                                     ; preds = %247
  %256 = load i32* %j, align 4
  %257 = sext i32 %256 to i64
  %258 = load float** %pdf, align 8
  %259 = getelementptr inbounds float* %258, i64 %257
  %260 = load float* %259, align 4
  %261 = fpext float %260 to double
  %262 = call i32 @logs3(double %261)
  br label %264

; <label>:263                                     ; preds = %247
  br label %264

; <label>:264                                     ; preds = %263, %255
  %265 = phi i32 [ %262, %255 ], [ -939524096, %263 ]
  %266 = load i32* %j, align 4
  %267 = sext i32 %266 to i64
  %268 = load i32* %i, align 4
  %269 = sext i32 %268 to i64
  %270 = load %struct.mgau_model_t** %1, align 8
  %271 = getelementptr inbounds %struct.mgau_model_t* %270, i32 0, i32 3
  %272 = load %struct.mgau_t** %271, align 8
  %273 = getelementptr inbounds %struct.mgau_t* %272, i64 %269
  %274 = getelementptr inbounds %struct.mgau_t* %273, i32 0, i32 4
  %275 = load i32** %274, align 8
  %276 = getelementptr inbounds i32* %275, i64 %267
  store i32 %265, i32* %276, align 4
  br label %277

; <label>:277                                     ; preds = %264
  %278 = load i32* %j, align 4
  %279 = add nsw i32 %278, 1
  store i32 %279, i32* %j, align 4
  br label %243

; <label>:280                                     ; preds = %243
  br label %281

; <label>:281                                     ; preds = %280, %235
  br label %282

; <label>:282                                     ; preds = %281
  %283 = load i32* %i, align 4
  %284 = add nsw i32 %283, 1
  store i32 %284, i32* %i, align 4
  br label %193

; <label>:285                                     ; preds = %193
  %286 = load float** %pdf, align 8
  %287 = bitcast float* %286 to i8*
  call void @ckd_free(i8* %287)
  %288 = load i32* %chksum_present, align 4
  %289 = icmp ne i32 %288, 0
  br i1 %289, label %290, label %294

; <label>:290                                     ; preds = %285
  %291 = load %struct._IO_FILE** %fp, align 8
  %292 = load i32* %byteswap, align 4
  %293 = load i32* %chksum, align 4
  call void @bio_verify_chksum(%struct._IO_FILE* %291, i32 %292, i32 %293)
  br label %294

; <label>:294                                     ; preds = %290, %285
  %295 = load %struct._IO_FILE** %fp, align 8
  %296 = call i64 @fread(i8* %eofchk, i64 1, i64 1, %struct._IO_FILE* %295)
  %297 = icmp eq i64 %296, 1
  br i1 %297, label %298, label %300

; <label>:298                                     ; preds = %294
  call void @_E__pr_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 358, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0))
  %299 = load i8** %2, align 8
  call void (i8*, ...)* @_E__die_error(i8* getelementptr inbounds ([31 x i8]* @.str35, i32 0, i32 0), i8* %299)
  br label %300

; <label>:300                                     ; preds = %298, %294
  %301 = load %struct._IO_FILE** %fp, align 8
  %302 = call i32 @fclose(%struct._IO_FILE* %301)
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 362, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  %303 = load i32* %n_mgau, align 4
  %304 = load i32* %n_comp, align 4
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([30 x i8]* @.str36, i32 0, i32 0), i32 %303, i32 %304)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @mgau_uninit_compact(%struct.mgau_model_t* %g) #0 {
  %1 = alloca %struct.mgau_model_t*, align 8
  %m = alloca i32, align 4
  %c = alloca i32, align 4
  %c2 = alloca i32, align 4
  %n = alloca i32, align 4
  %nm = alloca i32, align 4
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %1, align 8
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 378, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([43 x i8]* @.str15, i32 0, i32 0))
  store i32 0, i32* %n, align 4
  store i32 0, i32* %nm, align 4
  store i32 0, i32* %m, align 4
  br label %2

; <label>:2                                       ; preds = %156, %0
  %3 = load i32* %m, align 4
  %4 = load %struct.mgau_model_t** %1, align 8
  %5 = getelementptr inbounds %struct.mgau_model_t* %4, i32 0, i32 0
  %6 = load i32* %5, align 4
  %7 = icmp slt i32 %3, %6
  br i1 %7, label %8, label %159

; <label>:8                                       ; preds = %2
  store i32 0, i32* %c, align 4
  store i32 0, i32* %c2, align 4
  br label %9

; <label>:9                                       ; preds = %135, %8
  %10 = load i32* %c, align 4
  %11 = load i32* %m, align 4
  %12 = sext i32 %11 to i64
  %13 = load %struct.mgau_model_t** %1, align 8
  %14 = getelementptr inbounds %struct.mgau_model_t* %13, i32 0, i32 3
  %15 = load %struct.mgau_t** %14, align 8
  %16 = getelementptr inbounds %struct.mgau_t* %15, i64 %12
  %17 = getelementptr inbounds %struct.mgau_t* %16, i32 0, i32 0
  %18 = load i32* %17, align 4
  %19 = icmp slt i32 %10, %18
  br i1 %19, label %20, label %138

; <label>:20                                      ; preds = %9
  %21 = load i32* %c, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32* %m, align 4
  %24 = sext i32 %23 to i64
  %25 = load %struct.mgau_model_t** %1, align 8
  %26 = getelementptr inbounds %struct.mgau_model_t* %25, i32 0, i32 3
  %27 = load %struct.mgau_t** %26, align 8
  %28 = getelementptr inbounds %struct.mgau_t* %27, i64 %24
  %29 = getelementptr inbounds %struct.mgau_t* %28, i32 0, i32 2
  %30 = load float*** %29, align 8
  %31 = getelementptr inbounds float** %30, i64 %22
  %32 = load float** %31, align 8
  %33 = load %struct.mgau_model_t** %1, align 8
  %34 = getelementptr inbounds %struct.mgau_model_t* %33, i32 0, i32 2
  %35 = load i32* %34, align 4
  %36 = call i32 @vector_is_zero(float* %32, i32 %35)
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %131, label %38

; <label>:38                                      ; preds = %20
  %39 = load i32* %c2, align 4
  %40 = load i32* %c, align 4
  %41 = icmp ne i32 %39, %40
  br i1 %41, label %42, label %128

; <label>:42                                      ; preds = %38
  %43 = load i32* %c2, align 4
  %44 = sext i32 %43 to i64
  %45 = load i32* %m, align 4
  %46 = sext i32 %45 to i64
  %47 = load %struct.mgau_model_t** %1, align 8
  %48 = getelementptr inbounds %struct.mgau_model_t* %47, i32 0, i32 3
  %49 = load %struct.mgau_t** %48, align 8
  %50 = getelementptr inbounds %struct.mgau_t* %49, i64 %46
  %51 = getelementptr inbounds %struct.mgau_t* %50, i32 0, i32 1
  %52 = load float*** %51, align 8
  %53 = getelementptr inbounds float** %52, i64 %44
  %54 = load float** %53, align 8
  %55 = bitcast float* %54 to i8*
  %56 = load i32* %c, align 4
  %57 = sext i32 %56 to i64
  %58 = load i32* %m, align 4
  %59 = sext i32 %58 to i64
  %60 = load %struct.mgau_model_t** %1, align 8
  %61 = getelementptr inbounds %struct.mgau_model_t* %60, i32 0, i32 3
  %62 = load %struct.mgau_t** %61, align 8
  %63 = getelementptr inbounds %struct.mgau_t* %62, i64 %59
  %64 = getelementptr inbounds %struct.mgau_t* %63, i32 0, i32 1
  %65 = load float*** %64, align 8
  %66 = getelementptr inbounds float** %65, i64 %57
  %67 = load float** %66, align 8
  %68 = bitcast float* %67 to i8*
  %69 = load %struct.mgau_model_t** %1, align 8
  %70 = getelementptr inbounds %struct.mgau_model_t* %69, i32 0, i32 2
  %71 = load i32* %70, align 4
  %72 = sext i32 %71 to i64
  %73 = mul i64 %72, 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %55, i8* %68, i64 %73, i32 4, i1 false)
  %74 = load i32* %c2, align 4
  %75 = sext i32 %74 to i64
  %76 = load i32* %m, align 4
  %77 = sext i32 %76 to i64
  %78 = load %struct.mgau_model_t** %1, align 8
  %79 = getelementptr inbounds %struct.mgau_model_t* %78, i32 0, i32 3
  %80 = load %struct.mgau_t** %79, align 8
  %81 = getelementptr inbounds %struct.mgau_t* %80, i64 %77
  %82 = getelementptr inbounds %struct.mgau_t* %81, i32 0, i32 2
  %83 = load float*** %82, align 8
  %84 = getelementptr inbounds float** %83, i64 %75
  %85 = load float** %84, align 8
  %86 = bitcast float* %85 to i8*
  %87 = load i32* %c, align 4
  %88 = sext i32 %87 to i64
  %89 = load i32* %m, align 4
  %90 = sext i32 %89 to i64
  %91 = load %struct.mgau_model_t** %1, align 8
  %92 = getelementptr inbounds %struct.mgau_model_t* %91, i32 0, i32 3
  %93 = load %struct.mgau_t** %92, align 8
  %94 = getelementptr inbounds %struct.mgau_t* %93, i64 %90
  %95 = getelementptr inbounds %struct.mgau_t* %94, i32 0, i32 2
  %96 = load float*** %95, align 8
  %97 = getelementptr inbounds float** %96, i64 %88
  %98 = load float** %97, align 8
  %99 = bitcast float* %98 to i8*
  %100 = load %struct.mgau_model_t** %1, align 8
  %101 = getelementptr inbounds %struct.mgau_model_t* %100, i32 0, i32 2
  %102 = load i32* %101, align 4
  %103 = sext i32 %102 to i64
  %104 = mul i64 %103, 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %86, i8* %99, i64 %104, i32 4, i1 false)
  %105 = load i32* %c, align 4
  %106 = sext i32 %105 to i64
  %107 = load i32* %m, align 4
  %108 = sext i32 %107 to i64
  %109 = load %struct.mgau_model_t** %1, align 8
  %110 = getelementptr inbounds %struct.mgau_model_t* %109, i32 0, i32 3
  %111 = load %struct.mgau_t** %110, align 8
  %112 = getelementptr inbounds %struct.mgau_t* %111, i64 %108
  %113 = getelementptr inbounds %struct.mgau_t* %112, i32 0, i32 4
  %114 = load i32** %113, align 8
  %115 = getelementptr inbounds i32* %114, i64 %106
  %116 = load i32* %115, align 4
  %117 = load i32* %c2, align 4
  %118 = sext i32 %117 to i64
  %119 = load i32* %m, align 4
  %120 = sext i32 %119 to i64
  %121 = load %struct.mgau_model_t** %1, align 8
  %122 = getelementptr inbounds %struct.mgau_model_t* %121, i32 0, i32 3
  %123 = load %struct.mgau_t** %122, align 8
  %124 = getelementptr inbounds %struct.mgau_t* %123, i64 %120
  %125 = getelementptr inbounds %struct.mgau_t* %124, i32 0, i32 4
  %126 = load i32** %125, align 8
  %127 = getelementptr inbounds i32* %126, i64 %118
  store i32 %116, i32* %127, align 4
  br label %128

; <label>:128                                     ; preds = %42, %38
  %129 = load i32* %c2, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %c2, align 4
  br label %134

; <label>:131                                     ; preds = %20
  %132 = load i32* %n, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %n, align 4
  br label %134

; <label>:134                                     ; preds = %131, %128
  br label %135

; <label>:135                                     ; preds = %134
  %136 = load i32* %c, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %c, align 4
  br label %9

; <label>:138                                     ; preds = %9
  %139 = load i32* %c2, align 4
  %140 = load i32* %m, align 4
  %141 = sext i32 %140 to i64
  %142 = load %struct.mgau_model_t** %1, align 8
  %143 = getelementptr inbounds %struct.mgau_model_t* %142, i32 0, i32 3
  %144 = load %struct.mgau_t** %143, align 8
  %145 = getelementptr inbounds %struct.mgau_t* %144, i64 %141
  %146 = getelementptr inbounds %struct.mgau_t* %145, i32 0, i32 0
  store i32 %139, i32* %146, align 4
  %147 = load i32* %c2, align 4
  %148 = icmp eq i32 %147, 0
  br i1 %148, label %149, label %155

; <label>:149                                     ; preds = %138
  %150 = load %struct._IO_FILE** @stdout, align 8
  %151 = load i32* %m, align 4
  %152 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %150, i8* getelementptr inbounds ([4 x i8]* @.str16, i32 0, i32 0), i32 %151)
  %153 = load i32* %nm, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, i32* %nm, align 4
  br label %155

; <label>:155                                     ; preds = %149, %138
  br label %156

; <label>:156                                     ; preds = %155
  %157 = load i32* %m, align 4
  %158 = add nsw i32 %157, 1
  store i32 %158, i32* %m, align 4
  br label %2

; <label>:159                                     ; preds = %2
  %160 = load i32* %nm, align 4
  %161 = icmp sgt i32 %160, 0
  br i1 %161, label %162, label %165

; <label>:162                                     ; preds = %159
  %163 = load %struct._IO_FILE** @stdout, align 8
  %164 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %163, i8* getelementptr inbounds ([2 x i8]* @.str17, i32 0, i32 0))
  br label %165

; <label>:165                                     ; preds = %162, %159
  %166 = load i32* %nm, align 4
  %167 = icmp sgt i32 %166, 0
  br i1 %167, label %171, label %168

; <label>:168                                     ; preds = %165
  %169 = load i32* %n, align 4
  %170 = icmp sgt i32 %169, 0
  br i1 %170, label %171, label %174

; <label>:171                                     ; preds = %168, %165
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 408, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  %172 = load i32* %n, align 4
  %173 = load i32* %nm, align 4
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([53 x i8]* @.str18, i32 0, i32 0), i32 %172, i32 %173)
  br label %174

; <label>:174                                     ; preds = %171, %168
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @mgau_var_floor(%struct.mgau_model_t* %g, double %floor) #0 {
  %1 = alloca %struct.mgau_model_t*, align 8
  %2 = alloca double, align 8
  %m = alloca i32, align 4
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %1, align 8
  store double %floor, double* %2, align 8
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 416, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([25 x i8]* @.str14, i32 0, i32 0))
  store i32 0, i32* %n, align 4
  store i32 0, i32* %m, align 4
  br label %3

; <label>:3                                       ; preds = %77, %0
  %4 = load i32* %m, align 4
  %5 = load %struct.mgau_model_t** %1, align 8
  %6 = getelementptr inbounds %struct.mgau_model_t* %5, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = icmp slt i32 %4, %7
  br i1 %8, label %9, label %80

; <label>:9                                       ; preds = %3
  store i32 0, i32* %c, align 4
  br label %10

; <label>:10                                      ; preds = %73, %9
  %11 = load i32* %c, align 4
  %12 = load i32* %m, align 4
  %13 = sext i32 %12 to i64
  %14 = load %struct.mgau_model_t** %1, align 8
  %15 = getelementptr inbounds %struct.mgau_model_t* %14, i32 0, i32 3
  %16 = load %struct.mgau_t** %15, align 8
  %17 = getelementptr inbounds %struct.mgau_t* %16, i64 %13
  %18 = getelementptr inbounds %struct.mgau_t* %17, i32 0, i32 0
  %19 = load i32* %18, align 4
  %20 = icmp slt i32 %11, %19
  br i1 %20, label %21, label %76

; <label>:21                                      ; preds = %10
  store i32 0, i32* %i, align 4
  br label %22

; <label>:22                                      ; preds = %69, %21
  %23 = load i32* %i, align 4
  %24 = load %struct.mgau_model_t** %1, align 8
  %25 = getelementptr inbounds %struct.mgau_model_t* %24, i32 0, i32 2
  %26 = load i32* %25, align 4
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %72

; <label>:28                                      ; preds = %22
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load i32* %c, align 4
  %32 = sext i32 %31 to i64
  %33 = load i32* %m, align 4
  %34 = sext i32 %33 to i64
  %35 = load %struct.mgau_model_t** %1, align 8
  %36 = getelementptr inbounds %struct.mgau_model_t* %35, i32 0, i32 3
  %37 = load %struct.mgau_t** %36, align 8
  %38 = getelementptr inbounds %struct.mgau_t* %37, i64 %34
  %39 = getelementptr inbounds %struct.mgau_t* %38, i32 0, i32 2
  %40 = load float*** %39, align 8
  %41 = getelementptr inbounds float** %40, i64 %32
  %42 = load float** %41, align 8
  %43 = getelementptr inbounds float* %42, i64 %30
  %44 = load float* %43, align 4
  %45 = fpext float %44 to double
  %46 = load double* %2, align 8
  %47 = fcmp olt double %45, %46
  br i1 %47, label %48, label %68

; <label>:48                                      ; preds = %28
  %49 = load double* %2, align 8
  %50 = fptrunc double %49 to float
  %51 = load i32* %i, align 4
  %52 = sext i32 %51 to i64
  %53 = load i32* %c, align 4
  %54 = sext i32 %53 to i64
  %55 = load i32* %m, align 4
  %56 = sext i32 %55 to i64
  %57 = load %struct.mgau_model_t** %1, align 8
  %58 = getelementptr inbounds %struct.mgau_model_t* %57, i32 0, i32 3
  %59 = load %struct.mgau_t** %58, align 8
  %60 = getelementptr inbounds %struct.mgau_t* %59, i64 %56
  %61 = getelementptr inbounds %struct.mgau_t* %60, i32 0, i32 2
  %62 = load float*** %61, align 8
  %63 = getelementptr inbounds float** %62, i64 %54
  %64 = load float** %63, align 8
  %65 = getelementptr inbounds float* %64, i64 %52
  store float %50, float* %65, align 4
  %66 = load i32* %n, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %n, align 4
  br label %68

; <label>:68                                      ; preds = %48, %28
  br label %69

; <label>:69                                      ; preds = %68
  %70 = load i32* %i, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %i, align 4
  br label %22

; <label>:72                                      ; preds = %22
  br label %73

; <label>:73                                      ; preds = %72
  %74 = load i32* %c, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %c, align 4
  br label %10

; <label>:76                                      ; preds = %10
  br label %77

; <label>:77                                      ; preds = %76
  %78 = load i32* %m, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %m, align 4
  br label %3

; <label>:80                                      ; preds = %3
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 428, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  %81 = load i32* %n, align 4
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %81)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @mgau_precomp(%struct.mgau_model_t* %g) #0 {
  %1 = alloca %struct.mgau_model_t*, align 8
  %m = alloca i32, align 4
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  %lrd = alloca double, align 8
  %f = alloca double, align 8
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %1, align 8
  %2 = call double @log_to_logs3_factor()
  store double %2, double* %f, align 8
  call void @_E__pr_info_header(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i64 474, i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  call void (i8*, ...)* @_E__pr_info(i8* getelementptr inbounds ([46 x i8]* @.str13, i32 0, i32 0))
  store i32 0, i32* %m, align 4
  br label %3

; <label>:3                                       ; preds = %114, %0
  %4 = load i32* %m, align 4
  %5 = load %struct.mgau_model_t** %1, align 8
  %6 = getelementptr inbounds %struct.mgau_model_t* %5, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = icmp slt i32 %4, %7
  br i1 %8, label %9, label %117

; <label>:9                                       ; preds = %3
  store i32 0, i32* %c, align 4
  br label %10

; <label>:10                                      ; preds = %110, %9
  %11 = load i32* %c, align 4
  %12 = load i32* %m, align 4
  %13 = sext i32 %12 to i64
  %14 = load %struct.mgau_model_t** %1, align 8
  %15 = getelementptr inbounds %struct.mgau_model_t* %14, i32 0, i32 3
  %16 = load %struct.mgau_t** %15, align 8
  %17 = getelementptr inbounds %struct.mgau_t* %16, i64 %13
  %18 = getelementptr inbounds %struct.mgau_t* %17, i32 0, i32 0
  %19 = load i32* %18, align 4
  %20 = icmp slt i32 %11, %19
  br i1 %20, label %21, label %113

; <label>:21                                      ; preds = %10
  store double 0.000000e+00, double* %lrd, align 8
  store i32 0, i32* %i, align 4
  br label %22

; <label>:22                                      ; preds = %84, %21
  %23 = load i32* %i, align 4
  %24 = load %struct.mgau_model_t** %1, align 8
  %25 = getelementptr inbounds %struct.mgau_model_t* %24, i32 0, i32 2
  %26 = load i32* %25, align 4
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %87

; <label>:28                                      ; preds = %22
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load i32* %c, align 4
  %32 = sext i32 %31 to i64
  %33 = load i32* %m, align 4
  %34 = sext i32 %33 to i64
  %35 = load %struct.mgau_model_t** %1, align 8
  %36 = getelementptr inbounds %struct.mgau_model_t* %35, i32 0, i32 3
  %37 = load %struct.mgau_t** %36, align 8
  %38 = getelementptr inbounds %struct.mgau_t* %37, i64 %34
  %39 = getelementptr inbounds %struct.mgau_t* %38, i32 0, i32 2
  %40 = load float*** %39, align 8
  %41 = getelementptr inbounds float** %40, i64 %32
  %42 = load float** %41, align 8
  %43 = getelementptr inbounds float* %42, i64 %30
  %44 = load float* %43, align 4
  %45 = fpext float %44 to double
  %46 = call double @log(double %45) #5
  %47 = load double* %lrd, align 8
  %48 = fadd double %47, %46
  store double %48, double* %lrd, align 8
  %49 = load i32* %i, align 4
  %50 = sext i32 %49 to i64
  %51 = load i32* %c, align 4
  %52 = sext i32 %51 to i64
  %53 = load i32* %m, align 4
  %54 = sext i32 %53 to i64
  %55 = load %struct.mgau_model_t** %1, align 8
  %56 = getelementptr inbounds %struct.mgau_model_t* %55, i32 0, i32 3
  %57 = load %struct.mgau_t** %56, align 8
  %58 = getelementptr inbounds %struct.mgau_t* %57, i64 %54
  %59 = getelementptr inbounds %struct.mgau_t* %58, i32 0, i32 2
  %60 = load float*** %59, align 8
  %61 = getelementptr inbounds float** %60, i64 %52
  %62 = load float** %61, align 8
  %63 = getelementptr inbounds float* %62, i64 %50
  %64 = load float* %63, align 4
  %65 = fpext float %64 to double
  %66 = fmul double %65, 2.000000e+00
  %67 = fdiv double 1.000000e+00, %66
  %68 = fptrunc double %67 to float
  %69 = load i32* %i, align 4
  %70 = sext i32 %69 to i64
  %71 = load i32* %c, align 4
  %72 = sext i32 %71 to i64
  %73 = load i32* %m, align 4
  %74 = sext i32 %73 to i64
  %75 = load %struct.mgau_model_t** %1, align 8
  %76 = getelementptr inbounds %struct.mgau_model_t* %75, i32 0, i32 3
  %77 = load %struct.mgau_t** %76, align 8
  %78 = getelementptr inbounds %struct.mgau_t* %77, i64 %74
  %79 = getelementptr inbounds %struct.mgau_t* %78, i32 0, i32 2
  %80 = load float*** %79, align 8
  %81 = getelementptr inbounds float** %80, i64 %72
  %82 = load float** %81, align 8
  %83 = getelementptr inbounds float* %82, i64 %70
  store float %68, float* %83, align 4
  br label %84

; <label>:84                                      ; preds = %28
  %85 = load i32* %i, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %i, align 4
  br label %22

; <label>:87                                      ; preds = %22
  %88 = load %struct.mgau_model_t** %1, align 8
  %89 = getelementptr inbounds %struct.mgau_model_t* %88, i32 0, i32 2
  %90 = load i32* %89, align 4
  %91 = sitofp i32 %90 to double
  %92 = call double @log(double 0x401921FB54442D18) #5
  %93 = fmul double %91, %92
  %94 = load double* %lrd, align 8
  %95 = fadd double %94, %93
  store double %95, double* %lrd, align 8
  %96 = load double* %lrd, align 8
  %97 = fmul double -5.000000e-01, %96
  %98 = fptrunc double %97 to float
  %99 = load i32* %c, align 4
  %100 = sext i32 %99 to i64
  %101 = load i32* %m, align 4
  %102 = sext i32 %101 to i64
  %103 = load %struct.mgau_model_t** %1, align 8
  %104 = getelementptr inbounds %struct.mgau_model_t* %103, i32 0, i32 3
  %105 = load %struct.mgau_t** %104, align 8
  %106 = getelementptr inbounds %struct.mgau_t* %105, i64 %102
  %107 = getelementptr inbounds %struct.mgau_t* %106, i32 0, i32 3
  %108 = load float** %107, align 8
  %109 = getelementptr inbounds float* %108, i64 %100
  store float %98, float* %109, align 4
  br label %110

; <label>:110                                     ; preds = %87
  %111 = load i32* %c, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %c, align 4
  br label %10

; <label>:113                                     ; preds = %10
  br label %114

; <label>:114                                     ; preds = %113
  %115 = load i32* %m, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %m, align 4
  br label %3

; <label>:117                                     ; preds = %3
  ret i32 0
}

declare double @logs3_to_log(i32) #1

; Function Attrs: nounwind uwtable
define i32 @mgau_comp_eval(%struct.mgau_model_t* %g, i32 %s, float* %x, i32* %score) #0 {
  %1 = alloca %struct.mgau_model_t*, align 8
  %2 = alloca i32, align 4
  %3 = alloca float*, align 8
  %4 = alloca i32*, align 8
  %mgau = alloca %struct.mgau_t*, align 8
  %veclen = alloca i32, align 4
  %m = alloca float*, align 8
  %v = alloca float*, align 8
  %dval = alloca double, align 8
  %diff = alloca double, align 8
  %f = alloca double, align 8
  %bs = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %1, align 8
  store i32 %s, i32* %2, align 4
  store float* %x, float** %3, align 8
  store i32* %score, i32** %4, align 8
  %5 = load %struct.mgau_model_t** %1, align 8
  %6 = getelementptr inbounds %struct.mgau_model_t* %5, i32 0, i32 2
  %7 = load i32* %6, align 4
  store i32 %7, i32* %veclen, align 4
  %8 = load i32* %2, align 4
  %9 = sext i32 %8 to i64
  %10 = load %struct.mgau_model_t** %1, align 8
  %11 = getelementptr inbounds %struct.mgau_model_t* %10, i32 0, i32 3
  %12 = load %struct.mgau_t** %11, align 8
  %13 = getelementptr inbounds %struct.mgau_t* %12, i64 %9
  store %struct.mgau_t* %13, %struct.mgau_t** %mgau, align 8
  %14 = call double @log_to_logs3_factor()
  store double %14, double* %f, align 8
  store i32 -2147483648, i32* %bs, align 4
  store i32 0, i32* %c, align 4
  br label %15

; <label>:15                                      ; preds = %109, %0
  %16 = load i32* %c, align 4
  %17 = load %struct.mgau_t** %mgau, align 8
  %18 = getelementptr inbounds %struct.mgau_t* %17, i32 0, i32 0
  %19 = load i32* %18, align 4
  %20 = icmp slt i32 %16, %19
  br i1 %20, label %21, label %112

; <label>:21                                      ; preds = %15
  %22 = load i32* %c, align 4
  %23 = sext i32 %22 to i64
  %24 = load %struct.mgau_t** %mgau, align 8
  %25 = getelementptr inbounds %struct.mgau_t* %24, i32 0, i32 1
  %26 = load float*** %25, align 8
  %27 = getelementptr inbounds float** %26, i64 %23
  %28 = load float** %27, align 8
  store float* %28, float** %m, align 8
  %29 = load i32* %c, align 4
  %30 = sext i32 %29 to i64
  %31 = load %struct.mgau_t** %mgau, align 8
  %32 = getelementptr inbounds %struct.mgau_t* %31, i32 0, i32 2
  %33 = load float*** %32, align 8
  %34 = getelementptr inbounds float** %33, i64 %30
  %35 = load float** %34, align 8
  store float* %35, float** %v, align 8
  %36 = load i32* %c, align 4
  %37 = sext i32 %36 to i64
  %38 = load %struct.mgau_t** %mgau, align 8
  %39 = getelementptr inbounds %struct.mgau_t* %38, i32 0, i32 3
  %40 = load float** %39, align 8
  %41 = getelementptr inbounds float* %40, i64 %37
  %42 = load float* %41, align 4
  %43 = fpext float %42 to double
  store double %43, double* %dval, align 8
  store i32 0, i32* %i, align 4
  br label %44

; <label>:44                                      ; preds = %73, %21
  %45 = load i32* %i, align 4
  %46 = load i32* %veclen, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %76

; <label>:48                                      ; preds = %44
  %49 = load i32* %i, align 4
  %50 = sext i32 %49 to i64
  %51 = load float** %3, align 8
  %52 = getelementptr inbounds float* %51, i64 %50
  %53 = load float* %52, align 4
  %54 = load i32* %i, align 4
  %55 = sext i32 %54 to i64
  %56 = load float** %m, align 8
  %57 = getelementptr inbounds float* %56, i64 %55
  %58 = load float* %57, align 4
  %59 = fsub float %53, %58
  %60 = fpext float %59 to double
  store double %60, double* %diff, align 8
  %61 = load double* %diff, align 8
  %62 = load double* %diff, align 8
  %63 = fmul double %61, %62
  %64 = load i32* %i, align 4
  %65 = sext i32 %64 to i64
  %66 = load float** %v, align 8
  %67 = getelementptr inbounds float* %66, i64 %65
  %68 = load float* %67, align 4
  %69 = fpext float %68 to double
  %70 = fmul double %63, %69
  %71 = load double* %dval, align 8
  %72 = fsub double %71, %70
  store double %72, double* %dval, align 8
  br label %73

; <label>:73                                      ; preds = %48
  %74 = load i32* %i, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %i, align 4
  br label %44

; <label>:76                                      ; preds = %44
  %77 = load double* %dval, align 8
  %78 = load %struct.mgau_model_t** %1, align 8
  %79 = getelementptr inbounds %struct.mgau_model_t* %78, i32 0, i32 4
  %80 = load double* %79, align 8
  %81 = fcmp olt double %77, %80
  br i1 %81, label %82, label %86

; <label>:82                                      ; preds = %76
  %83 = load %struct.mgau_model_t** %1, align 8
  %84 = getelementptr inbounds %struct.mgau_model_t* %83, i32 0, i32 4
  %85 = load double* %84, align 8
  store double %85, double* %dval, align 8
  br label %86

; <label>:86                                      ; preds = %82, %76
  %87 = load double* %f, align 8
  %88 = load double* %dval, align 8
  %89 = fmul double %87, %88
  %90 = fptosi double %89 to i32
  %91 = load i32* %c, align 4
  %92 = sext i32 %91 to i64
  %93 = load i32** %4, align 8
  %94 = getelementptr inbounds i32* %93, i64 %92
  store i32 %90, i32* %94, align 4
  %95 = load i32* %c, align 4
  %96 = sext i32 %95 to i64
  %97 = load i32** %4, align 8
  %98 = getelementptr inbounds i32* %97, i64 %96
  %99 = load i32* %98, align 4
  %100 = load i32* %bs, align 4
  %101 = icmp sgt i32 %99, %100
  br i1 %101, label %102, label %108

; <label>:102                                     ; preds = %86
  %103 = load i32* %c, align 4
  %104 = sext i32 %103 to i64
  %105 = load i32** %4, align 8
  %106 = getelementptr inbounds i32* %105, i64 %104
  %107 = load i32* %106, align 4
  store i32 %107, i32* %bs, align 4
  br label %108

; <label>:108                                     ; preds = %102, %86
  br label %109

; <label>:109                                     ; preds = %108
  %110 = load i32* %c, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %c, align 4
  br label %15

; <label>:112                                     ; preds = %15
  %113 = load i32* %bs, align 4
  ret i32 %113
}

declare double @log_to_logs3_factor() #1

; Function Attrs: nounwind uwtable
define i32 @mgau_eval(%struct.mgau_model_t* %g, i32 %m, i32* %active, float* %x) #0 {
  %1 = alloca %struct.mgau_model_t*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %4 = alloca float*, align 8
  %mgau = alloca %struct.mgau_t*, align 8
  %veclen = alloca i32, align 4
  %score = alloca i32, align 4
  %m1 = alloca float*, align 8
  %m2 = alloca float*, align 8
  %v1 = alloca float*, align 8
  %v2 = alloca float*, align 8
  %dval1 = alloca double, align 8
  %dval2 = alloca double, align 8
  %diff1 = alloca double, align 8
  %diff2 = alloca double, align 8
  %f = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %c = alloca i32, align 4
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %1, align 8
  store i32 %m, i32* %2, align 4
  store i32* %active, i32** %3, align 8
  store float* %x, float** %4, align 8
  %5 = load %struct.mgau_model_t** %1, align 8
  %6 = getelementptr inbounds %struct.mgau_model_t* %5, i32 0, i32 2
  %7 = load i32* %6, align 4
  store i32 %7, i32* %veclen, align 4
  %8 = load i32* %2, align 4
  %9 = sext i32 %8 to i64
  %10 = load %struct.mgau_model_t** %1, align 8
  %11 = getelementptr inbounds %struct.mgau_model_t* %10, i32 0, i32 3
  %12 = load %struct.mgau_t** %11, align 8
  %13 = getelementptr inbounds %struct.mgau_t* %12, i64 %9
  store %struct.mgau_t* %13, %struct.mgau_t** %mgau, align 8
  %14 = call double @log_to_logs3_factor()
  store double %14, double* %f, align 8
  store i32 -939524096, i32* %score, align 4
  %15 = load i32** %3, align 8
  %16 = icmp ne i32* %15, null
  br i1 %16, label %269, label %17

; <label>:17                                      ; preds = %0
  store i32 0, i32* %c, align 4
  br label %18

; <label>:18                                      ; preds = %179, %17
  %19 = load i32* %c, align 4
  %20 = load %struct.mgau_t** %mgau, align 8
  %21 = getelementptr inbounds %struct.mgau_t* %20, i32 0, i32 0
  %22 = load i32* %21, align 4
  %23 = sub nsw i32 %22, 1
  %24 = icmp slt i32 %19, %23
  br i1 %24, label %25, label %182

; <label>:25                                      ; preds = %18
  %26 = load i32* %c, align 4
  %27 = sext i32 %26 to i64
  %28 = load %struct.mgau_t** %mgau, align 8
  %29 = getelementptr inbounds %struct.mgau_t* %28, i32 0, i32 1
  %30 = load float*** %29, align 8
  %31 = getelementptr inbounds float** %30, i64 %27
  %32 = load float** %31, align 8
  store float* %32, float** %m1, align 8
  %33 = load i32* %c, align 4
  %34 = add nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = load %struct.mgau_t** %mgau, align 8
  %37 = getelementptr inbounds %struct.mgau_t* %36, i32 0, i32 1
  %38 = load float*** %37, align 8
  %39 = getelementptr inbounds float** %38, i64 %35
  %40 = load float** %39, align 8
  store float* %40, float** %m2, align 8
  %41 = load i32* %c, align 4
  %42 = sext i32 %41 to i64
  %43 = load %struct.mgau_t** %mgau, align 8
  %44 = getelementptr inbounds %struct.mgau_t* %43, i32 0, i32 2
  %45 = load float*** %44, align 8
  %46 = getelementptr inbounds float** %45, i64 %42
  %47 = load float** %46, align 8
  store float* %47, float** %v1, align 8
  %48 = load i32* %c, align 4
  %49 = add nsw i32 %48, 1
  %50 = sext i32 %49 to i64
  %51 = load %struct.mgau_t** %mgau, align 8
  %52 = getelementptr inbounds %struct.mgau_t* %51, i32 0, i32 2
  %53 = load float*** %52, align 8
  %54 = getelementptr inbounds float** %53, i64 %50
  %55 = load float** %54, align 8
  store float* %55, float** %v2, align 8
  %56 = load i32* %c, align 4
  %57 = sext i32 %56 to i64
  %58 = load %struct.mgau_t** %mgau, align 8
  %59 = getelementptr inbounds %struct.mgau_t* %58, i32 0, i32 3
  %60 = load float** %59, align 8
  %61 = getelementptr inbounds float* %60, i64 %57
  %62 = load float* %61, align 4
  %63 = fpext float %62 to double
  store double %63, double* %dval1, align 8
  %64 = load i32* %c, align 4
  %65 = add nsw i32 %64, 1
  %66 = sext i32 %65 to i64
  %67 = load %struct.mgau_t** %mgau, align 8
  %68 = getelementptr inbounds %struct.mgau_t* %67, i32 0, i32 3
  %69 = load float** %68, align 8
  %70 = getelementptr inbounds float* %69, i64 %66
  %71 = load float* %70, align 4
  %72 = fpext float %71 to double
  store double %72, double* %dval2, align 8
  store i32 0, i32* %i, align 4
  br label %73

; <label>:73                                      ; preds = %126, %25
  %74 = load i32* %i, align 4
  %75 = load i32* %veclen, align 4
  %76 = icmp slt i32 %74, %75
  br i1 %76, label %77, label %129

; <label>:77                                      ; preds = %73
  %78 = load i32* %i, align 4
  %79 = sext i32 %78 to i64
  %80 = load float** %4, align 8
  %81 = getelementptr inbounds float* %80, i64 %79
  %82 = load float* %81, align 4
  %83 = load i32* %i, align 4
  %84 = sext i32 %83 to i64
  %85 = load float** %m1, align 8
  %86 = getelementptr inbounds float* %85, i64 %84
  %87 = load float* %86, align 4
  %88 = fsub float %82, %87
  %89 = fpext float %88 to double
  store double %89, double* %diff1, align 8
  %90 = load double* %diff1, align 8
  %91 = load double* %diff1, align 8
  %92 = fmul double %90, %91
  %93 = load i32* %i, align 4
  %94 = sext i32 %93 to i64
  %95 = load float** %v1, align 8
  %96 = getelementptr inbounds float* %95, i64 %94
  %97 = load float* %96, align 4
  %98 = fpext float %97 to double
  %99 = fmul double %92, %98
  %100 = load double* %dval1, align 8
  %101 = fsub double %100, %99
  store double %101, double* %dval1, align 8
  %102 = load i32* %i, align 4
  %103 = sext i32 %102 to i64
  %104 = load float** %4, align 8
  %105 = getelementptr inbounds float* %104, i64 %103
  %106 = load float* %105, align 4
  %107 = load i32* %i, align 4
  %108 = sext i32 %107 to i64
  %109 = load float** %m2, align 8
  %110 = getelementptr inbounds float* %109, i64 %108
  %111 = load float* %110, align 4
  %112 = fsub float %106, %111
  %113 = fpext float %112 to double
  store double %113, double* %diff2, align 8
  %114 = load double* %diff2, align 8
  %115 = load double* %diff2, align 8
  %116 = fmul double %114, %115
  %117 = load i32* %i, align 4
  %118 = sext i32 %117 to i64
  %119 = load float** %v2, align 8
  %120 = getelementptr inbounds float* %119, i64 %118
  %121 = load float* %120, align 4
  %122 = fpext float %121 to double
  %123 = fmul double %116, %122
  %124 = load double* %dval2, align 8
  %125 = fsub double %124, %123
  store double %125, double* %dval2, align 8
  br label %126

; <label>:126                                     ; preds = %77
  %127 = load i32* %i, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %i, align 4
  br label %73

; <label>:129                                     ; preds = %73
  %130 = load double* %dval1, align 8
  %131 = load %struct.mgau_model_t** %1, align 8
  %132 = getelementptr inbounds %struct.mgau_model_t* %131, i32 0, i32 4
  %133 = load double* %132, align 8
  %134 = fcmp olt double %130, %133
  br i1 %134, label %135, label %139

; <label>:135                                     ; preds = %129
  %136 = load %struct.mgau_model_t** %1, align 8
  %137 = getelementptr inbounds %struct.mgau_model_t* %136, i32 0, i32 4
  %138 = load double* %137, align 8
  store double %138, double* %dval1, align 8
  br label %139

; <label>:139                                     ; preds = %135, %129
  %140 = load double* %dval2, align 8
  %141 = load %struct.mgau_model_t** %1, align 8
  %142 = getelementptr inbounds %struct.mgau_model_t* %141, i32 0, i32 4
  %143 = load double* %142, align 8
  %144 = fcmp olt double %140, %143
  br i1 %144, label %145, label %149

; <label>:145                                     ; preds = %139
  %146 = load %struct.mgau_model_t** %1, align 8
  %147 = getelementptr inbounds %struct.mgau_model_t* %146, i32 0, i32 4
  %148 = load double* %147, align 8
  store double %148, double* %dval2, align 8
  br label %149

; <label>:149                                     ; preds = %145, %139
  %150 = load i32* %score, align 4
  %151 = load double* %f, align 8
  %152 = load double* %dval1, align 8
  %153 = fmul double %151, %152
  %154 = fptosi double %153 to i32
  %155 = load i32* %c, align 4
  %156 = sext i32 %155 to i64
  %157 = load %struct.mgau_t** %mgau, align 8
  %158 = getelementptr inbounds %struct.mgau_t* %157, i32 0, i32 4
  %159 = load i32** %158, align 8
  %160 = getelementptr inbounds i32* %159, i64 %156
  %161 = load i32* %160, align 4
  %162 = add nsw i32 %154, %161
  %163 = call i32 @logs3_add(i32 %150, i32 %162)
  store i32 %163, i32* %score, align 4
  %164 = load i32* %score, align 4
  %165 = load double* %f, align 8
  %166 = load double* %dval2, align 8
  %167 = fmul double %165, %166
  %168 = fptosi double %167 to i32
  %169 = load i32* %c, align 4
  %170 = add nsw i32 %169, 1
  %171 = sext i32 %170 to i64
  %172 = load %struct.mgau_t** %mgau, align 8
  %173 = getelementptr inbounds %struct.mgau_t* %172, i32 0, i32 4
  %174 = load i32** %173, align 8
  %175 = getelementptr inbounds i32* %174, i64 %171
  %176 = load i32* %175, align 4
  %177 = add nsw i32 %168, %176
  %178 = call i32 @logs3_add(i32 %164, i32 %177)
  store i32 %178, i32* %score, align 4
  br label %179

; <label>:179                                     ; preds = %149
  %180 = load i32* %c, align 4
  %181 = add nsw i32 %180, 2
  store i32 %181, i32* %c, align 4
  br label %18

; <label>:182                                     ; preds = %18
  %183 = load i32* %c, align 4
  %184 = load %struct.mgau_t** %mgau, align 8
  %185 = getelementptr inbounds %struct.mgau_t* %184, i32 0, i32 0
  %186 = load i32* %185, align 4
  %187 = icmp slt i32 %183, %186
  br i1 %187, label %188, label %268

; <label>:188                                     ; preds = %182
  %189 = load i32* %c, align 4
  %190 = sext i32 %189 to i64
  %191 = load %struct.mgau_t** %mgau, align 8
  %192 = getelementptr inbounds %struct.mgau_t* %191, i32 0, i32 1
  %193 = load float*** %192, align 8
  %194 = getelementptr inbounds float** %193, i64 %190
  %195 = load float** %194, align 8
  store float* %195, float** %m1, align 8
  %196 = load i32* %c, align 4
  %197 = sext i32 %196 to i64
  %198 = load %struct.mgau_t** %mgau, align 8
  %199 = getelementptr inbounds %struct.mgau_t* %198, i32 0, i32 2
  %200 = load float*** %199, align 8
  %201 = getelementptr inbounds float** %200, i64 %197
  %202 = load float** %201, align 8
  store float* %202, float** %v1, align 8
  %203 = load i32* %c, align 4
  %204 = sext i32 %203 to i64
  %205 = load %struct.mgau_t** %mgau, align 8
  %206 = getelementptr inbounds %struct.mgau_t* %205, i32 0, i32 3
  %207 = load float** %206, align 8
  %208 = getelementptr inbounds float* %207, i64 %204
  %209 = load float* %208, align 4
  %210 = fpext float %209 to double
  store double %210, double* %dval1, align 8
  store i32 0, i32* %i, align 4
  br label %211

; <label>:211                                     ; preds = %240, %188
  %212 = load i32* %i, align 4
  %213 = load i32* %veclen, align 4
  %214 = icmp slt i32 %212, %213
  br i1 %214, label %215, label %243

; <label>:215                                     ; preds = %211
  %216 = load i32* %i, align 4
  %217 = sext i32 %216 to i64
  %218 = load float** %4, align 8
  %219 = getelementptr inbounds float* %218, i64 %217
  %220 = load float* %219, align 4
  %221 = load i32* %i, align 4
  %222 = sext i32 %221 to i64
  %223 = load float** %m1, align 8
  %224 = getelementptr inbounds float* %223, i64 %222
  %225 = load float* %224, align 4
  %226 = fsub float %220, %225
  %227 = fpext float %226 to double
  store double %227, double* %diff1, align 8
  %228 = load double* %diff1, align 8
  %229 = load double* %diff1, align 8
  %230 = fmul double %228, %229
  %231 = load i32* %i, align 4
  %232 = sext i32 %231 to i64
  %233 = load float** %v1, align 8
  %234 = getelementptr inbounds float* %233, i64 %232
  %235 = load float* %234, align 4
  %236 = fpext float %235 to double
  %237 = fmul double %230, %236
  %238 = load double* %dval1, align 8
  %239 = fsub double %238, %237
  store double %239, double* %dval1, align 8
  br label %240

; <label>:240                                     ; preds = %215
  %241 = load i32* %i, align 4
  %242 = add nsw i32 %241, 1
  store i32 %242, i32* %i, align 4
  br label %211

; <label>:243                                     ; preds = %211
  %244 = load double* %dval1, align 8
  %245 = load %struct.mgau_model_t** %1, align 8
  %246 = getelementptr inbounds %struct.mgau_model_t* %245, i32 0, i32 4
  %247 = load double* %246, align 8
  %248 = fcmp olt double %244, %247
  br i1 %248, label %249, label %253

; <label>:249                                     ; preds = %243
  %250 = load %struct.mgau_model_t** %1, align 8
  %251 = getelementptr inbounds %struct.mgau_model_t* %250, i32 0, i32 4
  %252 = load double* %251, align 8
  store double %252, double* %dval1, align 8
  br label %253

; <label>:253                                     ; preds = %249, %243
  %254 = load i32* %score, align 4
  %255 = load double* %f, align 8
  %256 = load double* %dval1, align 8
  %257 = fmul double %255, %256
  %258 = fptosi double %257 to i32
  %259 = load i32* %c, align 4
  %260 = sext i32 %259 to i64
  %261 = load %struct.mgau_t** %mgau, align 8
  %262 = getelementptr inbounds %struct.mgau_t* %261, i32 0, i32 4
  %263 = load i32** %262, align 8
  %264 = getelementptr inbounds i32* %263, i64 %260
  %265 = load i32* %264, align 4
  %266 = add nsw i32 %258, %265
  %267 = call i32 @logs3_add(i32 %254, i32 %266)
  store i32 %267, i32* %score, align 4
  br label %268

; <label>:268                                     ; preds = %253, %182
  br label %366

; <label>:269                                     ; preds = %0
  store i32 0, i32* %j, align 4
  br label %270

; <label>:270                                     ; preds = %362, %269
  %271 = load i32* %j, align 4
  %272 = sext i32 %271 to i64
  %273 = load i32** %3, align 8
  %274 = getelementptr inbounds i32* %273, i64 %272
  %275 = load i32* %274, align 4
  %276 = icmp sge i32 %275, 0
  br i1 %276, label %277, label %365

; <label>:277                                     ; preds = %270
  %278 = load i32* %j, align 4
  %279 = sext i32 %278 to i64
  %280 = load i32** %3, align 8
  %281 = getelementptr inbounds i32* %280, i64 %279
  %282 = load i32* %281, align 4
  store i32 %282, i32* %c, align 4
  %283 = load i32* %c, align 4
  %284 = sext i32 %283 to i64
  %285 = load %struct.mgau_t** %mgau, align 8
  %286 = getelementptr inbounds %struct.mgau_t* %285, i32 0, i32 1
  %287 = load float*** %286, align 8
  %288 = getelementptr inbounds float** %287, i64 %284
  %289 = load float** %288, align 8
  store float* %289, float** %m1, align 8
  %290 = load i32* %c, align 4
  %291 = sext i32 %290 to i64
  %292 = load %struct.mgau_t** %mgau, align 8
  %293 = getelementptr inbounds %struct.mgau_t* %292, i32 0, i32 2
  %294 = load float*** %293, align 8
  %295 = getelementptr inbounds float** %294, i64 %291
  %296 = load float** %295, align 8
  store float* %296, float** %v1, align 8
  %297 = load i32* %c, align 4
  %298 = sext i32 %297 to i64
  %299 = load %struct.mgau_t** %mgau, align 8
  %300 = getelementptr inbounds %struct.mgau_t* %299, i32 0, i32 3
  %301 = load float** %300, align 8
  %302 = getelementptr inbounds float* %301, i64 %298
  %303 = load float* %302, align 4
  %304 = fpext float %303 to double
  store double %304, double* %dval1, align 8
  store i32 0, i32* %i, align 4
  br label %305

; <label>:305                                     ; preds = %334, %277
  %306 = load i32* %i, align 4
  %307 = load i32* %veclen, align 4
  %308 = icmp slt i32 %306, %307
  br i1 %308, label %309, label %337

; <label>:309                                     ; preds = %305
  %310 = load i32* %i, align 4
  %311 = sext i32 %310 to i64
  %312 = load float** %4, align 8
  %313 = getelementptr inbounds float* %312, i64 %311
  %314 = load float* %313, align 4
  %315 = load i32* %i, align 4
  %316 = sext i32 %315 to i64
  %317 = load float** %m1, align 8
  %318 = getelementptr inbounds float* %317, i64 %316
  %319 = load float* %318, align 4
  %320 = fsub float %314, %319
  %321 = fpext float %320 to double
  store double %321, double* %diff1, align 8
  %322 = load double* %diff1, align 8
  %323 = load double* %diff1, align 8
  %324 = fmul double %322, %323
  %325 = load i32* %i, align 4
  %326 = sext i32 %325 to i64
  %327 = load float** %v1, align 8
  %328 = getelementptr inbounds float* %327, i64 %326
  %329 = load float* %328, align 4
  %330 = fpext float %329 to double
  %331 = fmul double %324, %330
  %332 = load double* %dval1, align 8
  %333 = fsub double %332, %331
  store double %333, double* %dval1, align 8
  br label %334

; <label>:334                                     ; preds = %309
  %335 = load i32* %i, align 4
  %336 = add nsw i32 %335, 1
  store i32 %336, i32* %i, align 4
  br label %305

; <label>:337                                     ; preds = %305
  %338 = load double* %dval1, align 8
  %339 = load %struct.mgau_model_t** %1, align 8
  %340 = getelementptr inbounds %struct.mgau_model_t* %339, i32 0, i32 4
  %341 = load double* %340, align 8
  %342 = fcmp olt double %338, %341
  br i1 %342, label %343, label %347

; <label>:343                                     ; preds = %337
  %344 = load %struct.mgau_model_t** %1, align 8
  %345 = getelementptr inbounds %struct.mgau_model_t* %344, i32 0, i32 4
  %346 = load double* %345, align 8
  store double %346, double* %dval1, align 8
  br label %347

; <label>:347                                     ; preds = %343, %337
  %348 = load i32* %score, align 4
  %349 = load double* %f, align 8
  %350 = load double* %dval1, align 8
  %351 = fmul double %349, %350
  %352 = fptosi double %351 to i32
  %353 = load i32* %c, align 4
  %354 = sext i32 %353 to i64
  %355 = load %struct.mgau_t** %mgau, align 8
  %356 = getelementptr inbounds %struct.mgau_t* %355, i32 0, i32 4
  %357 = load i32** %356, align 8
  %358 = getelementptr inbounds i32* %357, i64 %354
  %359 = load i32* %358, align 4
  %360 = add nsw i32 %352, %359
  %361 = call i32 @logs3_add(i32 %348, i32 %360)
  store i32 %361, i32* %score, align 4
  br label %362

; <label>:362                                     ; preds = %347
  %363 = load i32* %j, align 4
  %364 = add nsw i32 %363, 1
  store i32 %364, i32* %j, align 4
  br label %270

; <label>:365                                     ; preds = %270
  br label %366

; <label>:366                                     ; preds = %365, %268
  %367 = load i32* %score, align 4
  %368 = icmp eq i32 %367, -939524096
  br i1 %368, label %369, label %370

; <label>:369                                     ; preds = %366
  br label %370

; <label>:370                                     ; preds = %369, %366
  %371 = load i32* %score, align 4
  ret i32 %371
}

declare i32 @logs3_add(i32, i32) #1

; Function Attrs: nounwind uwtable
define void @mgau_free(%struct.mgau_model_t* %g) #0 {
  %1 = alloca %struct.mgau_model_t*, align 8
  store %struct.mgau_model_t* %g, %struct.mgau_model_t** %1, align 8
  %2 = load %struct.mgau_model_t** %1, align 8
  %3 = icmp ne %struct.mgau_model_t* %2, null
  br i1 %3, label %4, label %81

; <label>:4                                       ; preds = %0
  %5 = load %struct.mgau_model_t** %1, align 8
  %6 = getelementptr inbounds %struct.mgau_model_t* %5, i32 0, i32 3
  %7 = load %struct.mgau_t** %6, align 8
  %8 = getelementptr inbounds %struct.mgau_t* %7, i64 0
  %9 = getelementptr inbounds %struct.mgau_t* %8, i32 0, i32 1
  %10 = load float*** %9, align 8
  %11 = icmp ne float** %10, null
  br i1 %11, label %12, label %20

; <label>:12                                      ; preds = %4
  %13 = load %struct.mgau_model_t** %1, align 8
  %14 = getelementptr inbounds %struct.mgau_model_t* %13, i32 0, i32 3
  %15 = load %struct.mgau_t** %14, align 8
  %16 = getelementptr inbounds %struct.mgau_t* %15, i64 0
  %17 = getelementptr inbounds %struct.mgau_t* %16, i32 0, i32 1
  %18 = load float*** %17, align 8
  %19 = bitcast float** %18 to i8*
  call void @ckd_free(i8* %19)
  br label %20

; <label>:20                                      ; preds = %12, %4
  %21 = load %struct.mgau_model_t** %1, align 8
  %22 = getelementptr inbounds %struct.mgau_model_t* %21, i32 0, i32 3
  %23 = load %struct.mgau_t** %22, align 8
  %24 = getelementptr inbounds %struct.mgau_t* %23, i64 0
  %25 = getelementptr inbounds %struct.mgau_t* %24, i32 0, i32 2
  %26 = load float*** %25, align 8
  %27 = icmp ne float** %26, null
  br i1 %27, label %28, label %36

; <label>:28                                      ; preds = %20
  %29 = load %struct.mgau_model_t** %1, align 8
  %30 = getelementptr inbounds %struct.mgau_model_t* %29, i32 0, i32 3
  %31 = load %struct.mgau_t** %30, align 8
  %32 = getelementptr inbounds %struct.mgau_t* %31, i64 0
  %33 = getelementptr inbounds %struct.mgau_t* %32, i32 0, i32 2
  %34 = load float*** %33, align 8
  %35 = bitcast float** %34 to i8*
  call void @ckd_free(i8* %35)
  br label %36

; <label>:36                                      ; preds = %28, %20
  %37 = load %struct.mgau_model_t** %1, align 8
  %38 = getelementptr inbounds %struct.mgau_model_t* %37, i32 0, i32 3
  %39 = load %struct.mgau_t** %38, align 8
  %40 = getelementptr inbounds %struct.mgau_t* %39, i64 0
  %41 = getelementptr inbounds %struct.mgau_t* %40, i32 0, i32 3
  %42 = load float** %41, align 8
  %43 = icmp ne float* %42, null
  br i1 %43, label %44, label %52

; <label>:44                                      ; preds = %36
  %45 = load %struct.mgau_model_t** %1, align 8
  %46 = getelementptr inbounds %struct.mgau_model_t* %45, i32 0, i32 3
  %47 = load %struct.mgau_t** %46, align 8
  %48 = getelementptr inbounds %struct.mgau_t* %47, i64 0
  %49 = getelementptr inbounds %struct.mgau_t* %48, i32 0, i32 3
  %50 = load float** %49, align 8
  %51 = bitcast float* %50 to i8*
  call void @ckd_free(i8* %51)
  br label %52

; <label>:52                                      ; preds = %44, %36
  %53 = load %struct.mgau_model_t** %1, align 8
  %54 = getelementptr inbounds %struct.mgau_model_t* %53, i32 0, i32 3
  %55 = load %struct.mgau_t** %54, align 8
  %56 = getelementptr inbounds %struct.mgau_t* %55, i64 0
  %57 = getelementptr inbounds %struct.mgau_t* %56, i32 0, i32 4
  %58 = load i32** %57, align 8
  %59 = icmp ne i32* %58, null
  br i1 %59, label %60, label %68

; <label>:60                                      ; preds = %52
  %61 = load %struct.mgau_model_t** %1, align 8
  %62 = getelementptr inbounds %struct.mgau_model_t* %61, i32 0, i32 3
  %63 = load %struct.mgau_t** %62, align 8
  %64 = getelementptr inbounds %struct.mgau_t* %63, i64 0
  %65 = getelementptr inbounds %struct.mgau_t* %64, i32 0, i32 4
  %66 = load i32** %65, align 8
  %67 = bitcast i32* %66 to i8*
  call void @ckd_free(i8* %67)
  br label %68

; <label>:68                                      ; preds = %60, %52
  %69 = load %struct.mgau_model_t** %1, align 8
  %70 = getelementptr inbounds %struct.mgau_model_t* %69, i32 0, i32 3
  %71 = load %struct.mgau_t** %70, align 8
  %72 = icmp ne %struct.mgau_t* %71, null
  br i1 %72, label %73, label %78

; <label>:73                                      ; preds = %68
  %74 = load %struct.mgau_model_t** %1, align 8
  %75 = getelementptr inbounds %struct.mgau_model_t* %74, i32 0, i32 3
  %76 = load %struct.mgau_t** %75, align 8
  %77 = bitcast %struct.mgau_t* %76 to i8*
  call void @ckd_free(i8* %77)
  br label %78

; <label>:78                                      ; preds = %73, %68
  %79 = load %struct.mgau_model_t** %1, align 8
  %80 = bitcast %struct.mgau_model_t* %79 to i8*
  call void @ckd_free(i8* %80)
  br label %81

; <label>:81                                      ; preds = %78, %0
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
