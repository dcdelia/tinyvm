; ModuleID = 'gates.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.quantum_reg_struct = type { i32, i32, i32, %struct.quantum_reg_node_struct*, i32* }
%struct.quantum_reg_node_struct = type { { float, float }, i64 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.quantum_matrix_struct = type { i32, i32, { float, float }* }

@.str = private unnamed_addr constant [40 x i8] c"Error allocating %i-element int array!\0A\00", align 1
@.str1 = private unnamed_addr constant [29 x i8] c"Matrix is not a 2x2 matrix!\0A\00", align 1
@.str2 = private unnamed_addr constant [39 x i8] c"Not enough memory for %i-sized qubit!\0A\00", align 1
@.str3 = private unnamed_addr constant [39 x i8] c"Not enough memory for %i bytes array!\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"Matrix is not a 4x4 matrix!\0A\00", align 1
@quantum_gate_counter.counter = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @quantum_cnot(i32 %control, i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %qec = alloca i32, align 4
  call void @quantum_qec_get_status(i32* %qec, i32* null)
  %1 = load i32* %qec, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  call void @quantum_cnot_ft(i32 %control, i32 %target, %struct.quantum_reg_struct* %reg)
  br label %38

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 1, i32 %control, i32 %target)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4
  br label %38

; <label>:8                                       ; preds = %4
  br label %9

; <label>:9                                       ; preds = %35, %8
  %i.0 = phi i32 [ 0, %8 ], [ %36, %35 ]
  %10 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %11 = load i32* %10, align 4
  %12 = icmp slt i32 %i.0, %11
  br i1 %12, label %13, label %37

; <label>:13                                      ; preds = %9
  %14 = sext i32 %i.0 to i64
  %15 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %16 = load %struct.quantum_reg_node_struct** %15, align 8
  %17 = getelementptr inbounds %struct.quantum_reg_node_struct* %16, i64 %14
  %18 = getelementptr inbounds %struct.quantum_reg_node_struct* %17, i32 0, i32 1
  %19 = load i64* %18, align 8
  %20 = zext i32 %control to i64
  %21 = shl i64 1, %20
  %22 = and i64 %19, %21
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %34

; <label>:24                                      ; preds = %13
  %25 = zext i32 %target to i64
  %26 = shl i64 1, %25
  %27 = sext i32 %i.0 to i64
  %28 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %29 = load %struct.quantum_reg_node_struct** %28, align 8
  %30 = getelementptr inbounds %struct.quantum_reg_node_struct* %29, i64 %27
  %31 = getelementptr inbounds %struct.quantum_reg_node_struct* %30, i32 0, i32 1
  %32 = load i64* %31, align 8
  %33 = xor i64 %32, %26
  store i64 %33, i64* %31, align 8
  br label %34

; <label>:34                                      ; preds = %24, %13
  br label %35

; <label>:35                                      ; preds = %34
  %36 = add nsw i32 %i.0, 1
  br label %9

; <label>:37                                      ; preds = %9
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  br label %38

; <label>:38                                      ; preds = %37, %7, %3
  ret void
}

declare void @quantum_qec_get_status(i32*, i32*) #1

declare void @quantum_cnot_ft(i32, i32, %struct.quantum_reg_struct*) #1

declare i32 @quantum_objcode_put(i8 zeroext, ...) #1

declare void @quantum_decohere(%struct.quantum_reg_struct*) #1

; Function Attrs: nounwind uwtable
define void @quantum_toffoli(i32 %control1, i32 %control2, i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %qec = alloca i32, align 4
  call void @quantum_qec_get_status(i32* %qec, i32* null)
  %1 = load i32* %qec, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  call void @quantum_toffoli_ft(i32 %control1, i32 %control2, i32 %target, %struct.quantum_reg_struct* %reg)
  br label %50

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 2, i32 %control1, i32 %control2, i32 %target)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4
  br label %50

; <label>:8                                       ; preds = %4
  br label %9

; <label>:9                                       ; preds = %47, %8
  %i.0 = phi i32 [ 0, %8 ], [ %48, %47 ]
  %10 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %11 = load i32* %10, align 4
  %12 = icmp slt i32 %i.0, %11
  br i1 %12, label %13, label %49

; <label>:13                                      ; preds = %9
  %14 = sext i32 %i.0 to i64
  %15 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %16 = load %struct.quantum_reg_node_struct** %15, align 8
  %17 = getelementptr inbounds %struct.quantum_reg_node_struct* %16, i64 %14
  %18 = getelementptr inbounds %struct.quantum_reg_node_struct* %17, i32 0, i32 1
  %19 = load i64* %18, align 8
  %20 = zext i32 %control1 to i64
  %21 = shl i64 1, %20
  %22 = and i64 %19, %21
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %46

; <label>:24                                      ; preds = %13
  %25 = sext i32 %i.0 to i64
  %26 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %27 = load %struct.quantum_reg_node_struct** %26, align 8
  %28 = getelementptr inbounds %struct.quantum_reg_node_struct* %27, i64 %25
  %29 = getelementptr inbounds %struct.quantum_reg_node_struct* %28, i32 0, i32 1
  %30 = load i64* %29, align 8
  %31 = zext i32 %control2 to i64
  %32 = shl i64 1, %31
  %33 = and i64 %30, %32
  %34 = icmp ne i64 %33, 0
  br i1 %34, label %35, label %45

; <label>:35                                      ; preds = %24
  %36 = zext i32 %target to i64
  %37 = shl i64 1, %36
  %38 = sext i32 %i.0 to i64
  %39 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %40 = load %struct.quantum_reg_node_struct** %39, align 8
  %41 = getelementptr inbounds %struct.quantum_reg_node_struct* %40, i64 %38
  %42 = getelementptr inbounds %struct.quantum_reg_node_struct* %41, i32 0, i32 1
  %43 = load i64* %42, align 8
  %44 = xor i64 %43, %37
  store i64 %44, i64* %42, align 8
  br label %45

; <label>:45                                      ; preds = %35, %24
  br label %46

; <label>:46                                      ; preds = %45, %13
  br label %47

; <label>:47                                      ; preds = %46
  %48 = add nsw i32 %i.0, 1
  br label %9

; <label>:49                                      ; preds = %9
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  br label %50

; <label>:50                                      ; preds = %49, %7, %3
  ret void
}

declare void @quantum_toffoli_ft(i32, i32, i32, %struct.quantum_reg_struct*) #1

; Function Attrs: nounwind uwtable
define void @quantum_unbounded_toffoli(i32 %controlling, %struct.quantum_reg_struct* %reg, ...) #0 {
  %bits = alloca [1 x %struct.__va_list_tag], align 16
  %1 = sext i32 %controlling to i64
  %2 = mul i64 %1, 4
  %3 = call noalias i8* @malloc(i64 %2) #4
  %4 = bitcast i8* %3 to i32*
  %5 = icmp ne i32* %4, null
  br i1 %5, label %8, label %6

; <label>:6                                       ; preds = %0
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str, i32 0, i32 0), i32 %controlling)
  call void @exit(i32 1) #6
  unreachable

; <label>:8                                       ; preds = %0
  %9 = sext i32 %controlling to i64
  %10 = mul i64 %9, 4
  %11 = call i64 @quantum_memman(i64 %10)
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %bits, i32 0, i32 0
  %13 = bitcast %struct.__va_list_tag* %12 to i8*
  call void @llvm.va_start(i8* %13)
  br label %14

; <label>:14                                      ; preds = %37, %8
  %i.0 = phi i32 [ 0, %8 ], [ %38, %37 ]
  %15 = icmp slt i32 %i.0, %controlling
  br i1 %15, label %16, label %39

; <label>:16                                      ; preds = %14
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %bits, i32 0, i32 0
  %18 = getelementptr inbounds %struct.__va_list_tag* %17, i32 0, i32 0
  %19 = load i32* %18
  %20 = icmp ule i32 %19, 40
  br i1 %20, label %21, label %27

; <label>:21                                      ; preds = %16
  %22 = getelementptr inbounds %struct.__va_list_tag* %17, i32 0, i32 3
  %23 = load i8** %22
  %24 = getelementptr i8* %23, i32 %19
  %25 = bitcast i8* %24 to i32*
  %26 = add i32 %19, 8
  store i32 %26, i32* %18
  br label %32

; <label>:27                                      ; preds = %16
  %28 = getelementptr inbounds %struct.__va_list_tag* %17, i32 0, i32 2
  %29 = load i8** %28
  %30 = bitcast i8* %29 to i32*
  %31 = getelementptr i8* %29, i32 8
  store i8* %31, i8** %28
  br label %32

; <label>:32                                      ; preds = %27, %21
  %33 = phi i32* [ %25, %21 ], [ %30, %27 ]
  %34 = load i32* %33
  %35 = sext i32 %i.0 to i64
  %36 = getelementptr inbounds i32* %4, i64 %35
  store i32 %34, i32* %36, align 4
  br label %37

; <label>:37                                      ; preds = %32
  %38 = add nsw i32 %i.0, 1
  br label %14

; <label>:39                                      ; preds = %14
  %40 = getelementptr inbounds [1 x %struct.__va_list_tag]* %bits, i32 0, i32 0
  %41 = getelementptr inbounds %struct.__va_list_tag* %40, i32 0, i32 0
  %42 = load i32* %41
  %43 = icmp ule i32 %42, 40
  br i1 %43, label %44, label %50

; <label>:44                                      ; preds = %39
  %45 = getelementptr inbounds %struct.__va_list_tag* %40, i32 0, i32 3
  %46 = load i8** %45
  %47 = getelementptr i8* %46, i32 %42
  %48 = bitcast i8* %47 to i32*
  %49 = add i32 %42, 8
  store i32 %49, i32* %41
  br label %55

; <label>:50                                      ; preds = %39
  %51 = getelementptr inbounds %struct.__va_list_tag* %40, i32 0, i32 2
  %52 = load i8** %51
  %53 = bitcast i8* %52 to i32*
  %54 = getelementptr i8* %52, i32 8
  store i8* %54, i8** %51
  br label %55

; <label>:55                                      ; preds = %50, %44
  %56 = phi i32* [ %48, %44 ], [ %53, %50 ]
  %57 = load i32* %56
  %58 = getelementptr inbounds [1 x %struct.__va_list_tag]* %bits, i32 0, i32 0
  %59 = bitcast %struct.__va_list_tag* %58 to i8*
  call void @llvm.va_end(i8* %59)
  br label %60

; <label>:60                                      ; preds = %99, %55
  %i.1 = phi i32 [ 0, %55 ], [ %100, %99 ]
  %61 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %62 = load i32* %61, align 4
  %63 = icmp slt i32 %i.1, %62
  br i1 %63, label %64, label %101

; <label>:64                                      ; preds = %60
  br label %65

; <label>:65                                      ; preds = %84, %64
  %j.0 = phi i32 [ 0, %64 ], [ %85, %84 ]
  %66 = icmp slt i32 %j.0, %controlling
  br i1 %66, label %67, label %81

; <label>:67                                      ; preds = %65
  %68 = sext i32 %i.1 to i64
  %69 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %70 = load %struct.quantum_reg_node_struct** %69, align 8
  %71 = getelementptr inbounds %struct.quantum_reg_node_struct* %70, i64 %68
  %72 = getelementptr inbounds %struct.quantum_reg_node_struct* %71, i32 0, i32 1
  %73 = load i64* %72, align 8
  %74 = sext i32 %j.0 to i64
  %75 = getelementptr inbounds i32* %4, i64 %74
  %76 = load i32* %75, align 4
  %77 = zext i32 %76 to i64
  %78 = shl i64 1, %77
  %79 = and i64 %73, %78
  %80 = icmp ne i64 %79, 0
  br label %81

; <label>:81                                      ; preds = %67, %65
  %82 = phi i1 [ false, %65 ], [ %80, %67 ]
  br i1 %82, label %83, label %86

; <label>:83                                      ; preds = %81
  br label %84

; <label>:84                                      ; preds = %83
  %85 = add nsw i32 %j.0, 1
  br label %65

; <label>:86                                      ; preds = %81
  %87 = icmp eq i32 %j.0, %controlling
  br i1 %87, label %88, label %98

; <label>:88                                      ; preds = %86
  %89 = zext i32 %57 to i64
  %90 = shl i64 1, %89
  %91 = sext i32 %i.1 to i64
  %92 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %93 = load %struct.quantum_reg_node_struct** %92, align 8
  %94 = getelementptr inbounds %struct.quantum_reg_node_struct* %93, i64 %91
  %95 = getelementptr inbounds %struct.quantum_reg_node_struct* %94, i32 0, i32 1
  %96 = load i64* %95, align 8
  %97 = xor i64 %96, %90
  store i64 %97, i64* %95, align 8
  br label %98

; <label>:98                                      ; preds = %88, %86
  br label %99

; <label>:99                                      ; preds = %98
  %100 = add nsw i32 %i.1, 1
  br label %60

; <label>:101                                     ; preds = %60
  %102 = bitcast i32* %4 to i8*
  call void @free(i8* %102) #4
  %103 = sub nsw i32 0, %controlling
  %104 = sext i32 %103 to i64
  %105 = mul i64 %104, 4
  %106 = call i64 @quantum_memman(i64 %105)
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare i64 @quantum_memman(i64) #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #4

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #4

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @quantum_sigma_x(i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %qec = alloca i32, align 4
  call void @quantum_qec_get_status(i32* %qec, i32* null)
  %1 = load i32* %qec, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  call void @quantum_sigma_x_ft(i32 %target, %struct.quantum_reg_struct* %reg)
  br label %26

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 3, i32 %target)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4
  br label %26

; <label>:8                                       ; preds = %4
  br label %9

; <label>:9                                       ; preds = %23, %8
  %i.0 = phi i32 [ 0, %8 ], [ %24, %23 ]
  %10 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %11 = load i32* %10, align 4
  %12 = icmp slt i32 %i.0, %11
  br i1 %12, label %13, label %25

; <label>:13                                      ; preds = %9
  %14 = zext i32 %target to i64
  %15 = shl i64 1, %14
  %16 = sext i32 %i.0 to i64
  %17 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %18 = load %struct.quantum_reg_node_struct** %17, align 8
  %19 = getelementptr inbounds %struct.quantum_reg_node_struct* %18, i64 %16
  %20 = getelementptr inbounds %struct.quantum_reg_node_struct* %19, i32 0, i32 1
  %21 = load i64* %20, align 8
  %22 = xor i64 %21, %15
  store i64 %22, i64* %20, align 8
  br label %23

; <label>:23                                      ; preds = %13
  %24 = add nsw i32 %i.0, 1
  br label %9

; <label>:25                                      ; preds = %9
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  br label %26

; <label>:26                                      ; preds = %25, %7, %3
  ret void
}

declare void @quantum_sigma_x_ft(i32, %struct.quantum_reg_struct*) #1

; Function Attrs: nounwind uwtable
define void @quantum_sigma_y(i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca { float, float }, align 4
  %2 = alloca { float, float }, align 4
  %3 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 4, i32 %target)
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %97

; <label>:6                                       ; preds = %0
  br label %7

; <label>:7                                       ; preds = %94, %6
  %i.0 = phi i32 [ 0, %6 ], [ %95, %94 ]
  %8 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %9 = load i32* %8, align 4
  %10 = icmp slt i32 %i.0, %9
  br i1 %10, label %11, label %96

; <label>:11                                      ; preds = %7
  %12 = zext i32 %target to i64
  %13 = shl i64 1, %12
  %14 = sext i32 %i.0 to i64
  %15 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %16 = load %struct.quantum_reg_node_struct** %15, align 8
  %17 = getelementptr inbounds %struct.quantum_reg_node_struct* %16, i64 %14
  %18 = getelementptr inbounds %struct.quantum_reg_node_struct* %17, i32 0, i32 1
  %19 = load i64* %18, align 8
  %20 = xor i64 %19, %13
  store i64 %20, i64* %18, align 8
  %21 = sext i32 %i.0 to i64
  %22 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %23 = load %struct.quantum_reg_node_struct** %22, align 8
  %24 = getelementptr inbounds %struct.quantum_reg_node_struct* %23, i64 %21
  %25 = getelementptr inbounds %struct.quantum_reg_node_struct* %24, i32 0, i32 1
  %26 = load i64* %25, align 8
  %27 = zext i32 %target to i64
  %28 = shl i64 1, %27
  %29 = and i64 %26, %28
  %30 = icmp ne i64 %29, 0
  br i1 %30, label %31, label %62

; <label>:31                                      ; preds = %11
  %32 = sext i32 %i.0 to i64
  %33 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %34 = load %struct.quantum_reg_node_struct** %33, align 8
  %35 = getelementptr inbounds %struct.quantum_reg_node_struct* %34, i64 %32
  %36 = getelementptr inbounds %struct.quantum_reg_node_struct* %35, i32 0, i32 0
  %37 = getelementptr inbounds { float, float }* %36, i32 0, i32 0
  %38 = load float* %37, align 4
  %39 = getelementptr inbounds { float, float }* %36, i32 0, i32 1
  %40 = load float* %39, align 4
  %41 = fmul float %38, 0.000000e+00
  %42 = fmul float %40, 1.000000e+00
  %43 = fmul float %38, 1.000000e+00
  %44 = fmul float %40, 0.000000e+00
  %45 = fsub float %41, %42
  %46 = fadd float %43, %44
  %47 = fcmp uno float %45, %45
  br i1 %47, label %48, label %57, !prof !1

; <label>:48                                      ; preds = %31
  %49 = fcmp uno float %46, %46
  br i1 %49, label %50, label %57, !prof !1

; <label>:50                                      ; preds = %48
  %51 = call <2 x float> @__mulsc3(float %38, float %40, float 0.000000e+00, float 1.000000e+00) #4
  %52 = bitcast { float, float }* %1 to <2 x float>*
  store <2 x float> %51, <2 x float>* %52, align 1
  %53 = getelementptr inbounds { float, float }* %1, i32 0, i32 0
  %54 = load float* %53, align 4
  %55 = getelementptr inbounds { float, float }* %1, i32 0, i32 1
  %56 = load float* %55, align 4
  br label %57

; <label>:57                                      ; preds = %50, %48, %31
  %58 = phi float [ %45, %31 ], [ %45, %48 ], [ %54, %50 ]
  %59 = phi float [ %46, %31 ], [ %46, %48 ], [ %56, %50 ]
  %60 = getelementptr inbounds { float, float }* %36, i32 0, i32 0
  %61 = getelementptr inbounds { float, float }* %36, i32 0, i32 1
  store float %58, float* %60, align 4
  store float %59, float* %61, align 4
  br label %93

; <label>:62                                      ; preds = %11
  %63 = sext i32 %i.0 to i64
  %64 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %65 = load %struct.quantum_reg_node_struct** %64, align 8
  %66 = getelementptr inbounds %struct.quantum_reg_node_struct* %65, i64 %63
  %67 = getelementptr inbounds %struct.quantum_reg_node_struct* %66, i32 0, i32 0
  %68 = getelementptr inbounds { float, float }* %67, i32 0, i32 0
  %69 = load float* %68, align 4
  %70 = getelementptr inbounds { float, float }* %67, i32 0, i32 1
  %71 = load float* %70, align 4
  %72 = fmul float %69, -0.000000e+00
  %73 = fmul float %71, -1.000000e+00
  %74 = fmul float %69, -1.000000e+00
  %75 = fmul float %71, -0.000000e+00
  %76 = fsub float %72, %73
  %77 = fadd float %74, %75
  %78 = fcmp uno float %76, %76
  br i1 %78, label %79, label %88, !prof !1

; <label>:79                                      ; preds = %62
  %80 = fcmp uno float %77, %77
  br i1 %80, label %81, label %88, !prof !1

; <label>:81                                      ; preds = %79
  %82 = call <2 x float> @__mulsc3(float %69, float %71, float -0.000000e+00, float -1.000000e+00) #4
  %83 = bitcast { float, float }* %2 to <2 x float>*
  store <2 x float> %82, <2 x float>* %83, align 1
  %84 = getelementptr inbounds { float, float }* %2, i32 0, i32 0
  %85 = load float* %84, align 4
  %86 = getelementptr inbounds { float, float }* %2, i32 0, i32 1
  %87 = load float* %86, align 4
  br label %88

; <label>:88                                      ; preds = %81, %79, %62
  %89 = phi float [ %76, %62 ], [ %76, %79 ], [ %85, %81 ]
  %90 = phi float [ %77, %62 ], [ %77, %79 ], [ %87, %81 ]
  %91 = getelementptr inbounds { float, float }* %67, i32 0, i32 0
  %92 = getelementptr inbounds { float, float }* %67, i32 0, i32 1
  store float %89, float* %91, align 4
  store float %90, float* %92, align 4
  br label %93

; <label>:93                                      ; preds = %88, %57
  br label %94

; <label>:94                                      ; preds = %93
  %95 = add nsw i32 %i.0, 1
  br label %7

; <label>:96                                      ; preds = %7
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  br label %97

; <label>:97                                      ; preds = %96, %5
  ret void
}

declare <2 x float> @__mulsc3(float, float, float, float)

; Function Attrs: nounwind uwtable
define void @quantum_sigma_z(i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca { float, float }, align 4
  %2 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 5, i32 %target)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %56

; <label>:5                                       ; preds = %0
  br label %6

; <label>:6                                       ; preds = %53, %5
  %i.0 = phi i32 [ 0, %5 ], [ %54, %53 ]
  %7 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %8 = load i32* %7, align 4
  %9 = icmp slt i32 %i.0, %8
  br i1 %9, label %10, label %55

; <label>:10                                      ; preds = %6
  %11 = sext i32 %i.0 to i64
  %12 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %13 = load %struct.quantum_reg_node_struct** %12, align 8
  %14 = getelementptr inbounds %struct.quantum_reg_node_struct* %13, i64 %11
  %15 = getelementptr inbounds %struct.quantum_reg_node_struct* %14, i32 0, i32 1
  %16 = load i64* %15, align 8
  %17 = zext i32 %target to i64
  %18 = shl i64 1, %17
  %19 = and i64 %16, %18
  %20 = icmp ne i64 %19, 0
  br i1 %20, label %21, label %52

; <label>:21                                      ; preds = %10
  %22 = sext i32 %i.0 to i64
  %23 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %24 = load %struct.quantum_reg_node_struct** %23, align 8
  %25 = getelementptr inbounds %struct.quantum_reg_node_struct* %24, i64 %22
  %26 = getelementptr inbounds %struct.quantum_reg_node_struct* %25, i32 0, i32 0
  %27 = getelementptr inbounds { float, float }* %26, i32 0, i32 0
  %28 = load float* %27, align 4
  %29 = getelementptr inbounds { float, float }* %26, i32 0, i32 1
  %30 = load float* %29, align 4
  %31 = fmul float %28, -1.000000e+00
  %32 = fmul float %30, 0.000000e+00
  %33 = fmul float %28, 0.000000e+00
  %34 = fmul float %30, -1.000000e+00
  %35 = fsub float %31, %32
  %36 = fadd float %33, %34
  %37 = fcmp uno float %35, %35
  br i1 %37, label %38, label %47, !prof !1

; <label>:38                                      ; preds = %21
  %39 = fcmp uno float %36, %36
  br i1 %39, label %40, label %47, !prof !1

; <label>:40                                      ; preds = %38
  %41 = call <2 x float> @__mulsc3(float %28, float %30, float -1.000000e+00, float 0.000000e+00) #4
  %42 = bitcast { float, float }* %1 to <2 x float>*
  store <2 x float> %41, <2 x float>* %42, align 1
  %43 = getelementptr inbounds { float, float }* %1, i32 0, i32 0
  %44 = load float* %43, align 4
  %45 = getelementptr inbounds { float, float }* %1, i32 0, i32 1
  %46 = load float* %45, align 4
  br label %47

; <label>:47                                      ; preds = %40, %38, %21
  %48 = phi float [ %35, %21 ], [ %35, %38 ], [ %44, %40 ]
  %49 = phi float [ %36, %21 ], [ %36, %38 ], [ %46, %40 ]
  %50 = getelementptr inbounds { float, float }* %26, i32 0, i32 0
  %51 = getelementptr inbounds { float, float }* %26, i32 0, i32 1
  store float %48, float* %50, align 4
  store float %49, float* %51, align 4
  br label %52

; <label>:52                                      ; preds = %47, %10
  br label %53

; <label>:53                                      ; preds = %52
  %54 = add nsw i32 %i.0, 1
  br label %6

; <label>:55                                      ; preds = %6
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  br label %56

; <label>:56                                      ; preds = %55, %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_swaptheleads(i32 %width, %struct.quantum_reg_struct* %reg) #0 {
  %qec = alloca i32, align 4
  call void @quantum_qec_get_status(i32* %qec, i32* null)
  %1 = load i32* %qec, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %13

; <label>:3                                       ; preds = %0
  br label %4

; <label>:4                                       ; preds = %10, %3
  %i.0 = phi i32 [ 0, %3 ], [ %11, %10 ]
  %5 = icmp slt i32 %i.0, %width
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %4
  %7 = add nsw i32 %width, %i.0
  call void @quantum_cnot(i32 %i.0, i32 %7, %struct.quantum_reg_struct* %reg)
  %8 = add nsw i32 %width, %i.0
  call void @quantum_cnot(i32 %8, i32 %i.0, %struct.quantum_reg_struct* %reg)
  %9 = add nsw i32 %width, %i.0
  call void @quantum_cnot(i32 %i.0, i32 %9, %struct.quantum_reg_struct* %reg)
  br label %10

; <label>:10                                      ; preds = %6
  %11 = add nsw i32 %i.0, 1
  br label %4

; <label>:12                                      ; preds = %4
  br label %75

; <label>:13                                      ; preds = %0
  br label %14

; <label>:14                                      ; preds = %72, %13
  %i.1 = phi i32 [ 0, %13 ], [ %73, %72 ]
  %15 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %16 = load i32* %15, align 4
  %17 = icmp slt i32 %i.1, %16
  br i1 %17, label %18, label %74

; <label>:18                                      ; preds = %14
  %19 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 14, i32 %width)
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  br label %75

; <label>:22                                      ; preds = %18
  %23 = sext i32 %i.1 to i64
  %24 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %25 = load %struct.quantum_reg_node_struct** %24, align 8
  %26 = getelementptr inbounds %struct.quantum_reg_node_struct* %25, i64 %23
  %27 = getelementptr inbounds %struct.quantum_reg_node_struct* %26, i32 0, i32 1
  %28 = load i64* %27, align 8
  %29 = zext i32 %width to i64
  %30 = shl i64 1, %29
  %31 = urem i64 %28, %30
  %32 = trunc i64 %31 to i32
  br label %33

; <label>:33                                      ; preds = %49, %22
  %j.0 = phi i32 [ 0, %22 ], [ %50, %49 ]
  %pat2.0 = phi i32 [ 0, %22 ], [ %48, %49 ]
  %34 = icmp slt i32 %j.0, %width
  br i1 %34, label %35, label %51

; <label>:35                                      ; preds = %33
  %36 = sext i32 %i.1 to i64
  %37 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %38 = load %struct.quantum_reg_node_struct** %37, align 8
  %39 = getelementptr inbounds %struct.quantum_reg_node_struct* %38, i64 %36
  %40 = getelementptr inbounds %struct.quantum_reg_node_struct* %39, i32 0, i32 1
  %41 = load i64* %40, align 8
  %42 = add nsw i32 %width, %j.0
  %43 = zext i32 %42 to i64
  %44 = shl i64 1, %43
  %45 = and i64 %41, %44
  %46 = sext i32 %pat2.0 to i64
  %47 = add i64 %46, %45
  %48 = trunc i64 %47 to i32
  br label %49

; <label>:49                                      ; preds = %35
  %50 = add nsw i32 %j.0, 1
  br label %33

; <label>:51                                      ; preds = %33
  %52 = sext i32 %i.1 to i64
  %53 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %54 = load %struct.quantum_reg_node_struct** %53, align 8
  %55 = getelementptr inbounds %struct.quantum_reg_node_struct* %54, i64 %52
  %56 = getelementptr inbounds %struct.quantum_reg_node_struct* %55, i32 0, i32 1
  %57 = load i64* %56, align 8
  %58 = add nsw i32 %32, %pat2.0
  %59 = sext i32 %58 to i64
  %60 = sub i64 %57, %59
  %61 = shl i32 %32, %width
  %62 = sext i32 %61 to i64
  %63 = add i64 %60, %62
  %64 = ashr i32 %pat2.0, %width
  %65 = sext i32 %64 to i64
  %66 = add i64 %63, %65
  %67 = sext i32 %i.1 to i64
  %68 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %69 = load %struct.quantum_reg_node_struct** %68, align 8
  %70 = getelementptr inbounds %struct.quantum_reg_node_struct* %69, i64 %67
  %71 = getelementptr inbounds %struct.quantum_reg_node_struct* %70, i32 0, i32 1
  store i64 %66, i64* %71, align 8
  br label %72

; <label>:72                                      ; preds = %51
  %73 = add nsw i32 %i.1, 1
  br label %14

; <label>:74                                      ; preds = %14
  br label %75

; <label>:75                                      ; preds = %74, %21, %12
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_swaptheleads_omuln_controlled(i32 %control, i32 %width, %struct.quantum_reg_struct* %reg) #0 {
  br label %1

; <label>:1                                       ; preds = %16, %0
  %i.0 = phi i32 [ 0, %0 ], [ %17, %16 ]
  %2 = icmp slt i32 %i.0, %width
  br i1 %2, label %3, label %18

; <label>:3                                       ; preds = %1
  %4 = add nsw i32 %width, %i.0
  %5 = mul nsw i32 2, %width
  %6 = add nsw i32 %5, %i.0
  %7 = add nsw i32 %6, 2
  call void @quantum_toffoli(i32 %control, i32 %4, i32 %7, %struct.quantum_reg_struct* %reg)
  %8 = mul nsw i32 2, %width
  %9 = add nsw i32 %8, %i.0
  %10 = add nsw i32 %9, 2
  %11 = add nsw i32 %width, %i.0
  call void @quantum_toffoli(i32 %control, i32 %10, i32 %11, %struct.quantum_reg_struct* %reg)
  %12 = add nsw i32 %width, %i.0
  %13 = mul nsw i32 2, %width
  %14 = add nsw i32 %13, %i.0
  %15 = add nsw i32 %14, 2
  call void @quantum_toffoli(i32 %control, i32 %12, i32 %15, %struct.quantum_reg_struct* %reg)
  br label %16

; <label>:16                                      ; preds = %3
  %17 = add nsw i32 %i.0, 1
  br label %1

; <label>:18                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_gate1(i32 %target, i64 %m.coerce0, { float, float }* %m.coerce1, %struct.quantum_reg_struct* %reg) #0 {
  %m = alloca %struct.quantum_matrix_struct, align 8
  %t = alloca { float, float }, align 4
  %tnot = alloca { float, float }, align 4
  %1 = alloca { float, float }, align 4
  %2 = alloca { float, float }, align 4
  %3 = alloca { float, float }, align 4
  %4 = alloca { float, float }, align 4
  %5 = alloca { float, float }, align 4
  %6 = alloca { float, float }, align 4
  %7 = alloca { float, float }, align 4
  %8 = alloca { float, float }, align 4
  %9 = alloca { float, float }, align 4
  %10 = alloca { float, float }, align 4
  %11 = alloca { float, float }, align 4
  %12 = alloca { float, float }, align 4
  %13 = alloca { float, float }, align 4
  %14 = alloca { float, float }, align 4
  %15 = alloca { float, float }, align 4
  %16 = bitcast %struct.quantum_matrix_struct* %m to { i64, { float, float }* }*
  %17 = getelementptr { i64, { float, float }* }* %16, i32 0, i32 0
  store i64 %m.coerce0, i64* %17
  %18 = getelementptr { i64, { float, float }* }* %16, i32 0, i32 1
  store { float, float }* %m.coerce1, { float, float }** %18
  %19 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %20 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  store float 0.000000e+00, float* %19, align 4
  store float 0.000000e+00, float* %20, align 4
  %21 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 1
  %22 = load i32* %21, align 4
  %23 = icmp ne i32 %22, 2
  br i1 %23, label %28, label %24

; <label>:24                                      ; preds = %0
  %25 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 0
  %26 = load i32* %25, align 4
  %27 = icmp ne i32 %26, 2
  br i1 %27, label %28, label %30

; <label>:28                                      ; preds = %24, %0
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:30                                      ; preds = %24
  br label %31

; <label>:31                                      ; preds = %41, %30
  %i.0 = phi i32 [ 0, %30 ], [ %42, %41 ]
  %32 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 2
  %33 = load i32* %32, align 4
  %34 = shl i32 1, %33
  %35 = icmp slt i32 %i.0, %34
  br i1 %35, label %36, label %43

; <label>:36                                      ; preds = %31
  %37 = sext i32 %i.0 to i64
  %38 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 4
  %39 = load i32** %38, align 8
  %40 = getelementptr inbounds i32* %39, i64 %37
  store i32 0, i32* %40, align 4
  br label %41

; <label>:41                                      ; preds = %36
  %42 = add nsw i32 %i.0, 1
  br label %31

; <label>:43                                      ; preds = %31
  br label %44

; <label>:44                                      ; preds = %55, %43
  %i.1 = phi i32 [ 0, %43 ], [ %56, %55 ]
  %45 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %46 = load i32* %45, align 4
  %47 = icmp slt i32 %i.1, %46
  br i1 %47, label %48, label %57

; <label>:48                                      ; preds = %44
  %49 = sext i32 %i.1 to i64
  %50 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %51 = load %struct.quantum_reg_node_struct** %50, align 8
  %52 = getelementptr inbounds %struct.quantum_reg_node_struct* %51, i64 %49
  %53 = getelementptr inbounds %struct.quantum_reg_node_struct* %52, i32 0, i32 1
  %54 = load i64* %53, align 8
  call void @quantum_add_hash(i64 %54, i32 %i.1, %struct.quantum_reg_struct* %reg)
  br label %55

; <label>:55                                      ; preds = %48
  %56 = add nsw i32 %i.1, 1
  br label %44

; <label>:57                                      ; preds = %44
  br label %58

; <label>:58                                      ; preds = %132, %57
  %i.2 = phi i32 [ 0, %57 ], [ %133, %132 ]
  %addsize.0 = phi i32 [ 0, %57 ], [ %addsize.3, %132 ]
  %59 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %60 = load i32* %59, align 4
  %61 = icmp slt i32 %i.2, %60
  br i1 %61, label %62, label %134

; <label>:62                                      ; preds = %58
  %63 = sext i32 %i.2 to i64
  %64 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %65 = load %struct.quantum_reg_node_struct** %64, align 8
  %66 = getelementptr inbounds %struct.quantum_reg_node_struct* %65, i64 %63
  %67 = getelementptr inbounds %struct.quantum_reg_node_struct* %66, i32 0, i32 1
  %68 = load i64* %67, align 8
  %69 = zext i32 %target to i64
  %70 = shl i64 1, %69
  %71 = xor i64 %68, %70
  %72 = call i32 @quantum_get_state(i64 %71, %struct.quantum_reg_struct* byval align 8 %reg)
  %73 = icmp eq i32 %72, -1
  br i1 %73, label %74, label %131

; <label>:74                                      ; preds = %62
  %75 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %76 = load { float, float }** %75, align 8
  %77 = getelementptr inbounds { float, float }* %76, i64 1
  %78 = getelementptr inbounds { float, float }* %77, i32 0, i32 0
  %79 = load float* %78, align 4
  %80 = getelementptr inbounds { float, float }* %77, i32 0, i32 1
  %81 = load float* %80, align 4
  %82 = getelementptr inbounds { float, float }* %1, i32 0, i32 0
  %83 = getelementptr inbounds { float, float }* %1, i32 0, i32 1
  store float %79, float* %82, align 4
  store float %81, float* %83, align 4
  %84 = bitcast { float, float }* %1 to <2 x float>*
  %85 = load <2 x float>* %84, align 1
  %86 = call float @quantum_prob_inline(<2 x float> %85)
  %87 = fpext float %86 to double
  %88 = fcmp ogt double %87, 1.000000e-09
  br i1 %88, label %89, label %102

; <label>:89                                      ; preds = %74
  %90 = sext i32 %i.2 to i64
  %91 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %92 = load %struct.quantum_reg_node_struct** %91, align 8
  %93 = getelementptr inbounds %struct.quantum_reg_node_struct* %92, i64 %90
  %94 = getelementptr inbounds %struct.quantum_reg_node_struct* %93, i32 0, i32 1
  %95 = load i64* %94, align 8
  %96 = zext i32 %target to i64
  %97 = shl i64 1, %96
  %98 = and i64 %95, %97
  %99 = icmp ne i64 %98, 0
  br i1 %99, label %100, label %102

; <label>:100                                     ; preds = %89
  %101 = add nsw i32 %addsize.0, 1
  br label %102

; <label>:102                                     ; preds = %100, %89, %74
  %addsize.1 = phi i32 [ %101, %100 ], [ %addsize.0, %89 ], [ %addsize.0, %74 ]
  %103 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %104 = load { float, float }** %103, align 8
  %105 = getelementptr inbounds { float, float }* %104, i64 2
  %106 = getelementptr inbounds { float, float }* %105, i32 0, i32 0
  %107 = load float* %106, align 4
  %108 = getelementptr inbounds { float, float }* %105, i32 0, i32 1
  %109 = load float* %108, align 4
  %110 = getelementptr inbounds { float, float }* %2, i32 0, i32 0
  %111 = getelementptr inbounds { float, float }* %2, i32 0, i32 1
  store float %107, float* %110, align 4
  store float %109, float* %111, align 4
  %112 = bitcast { float, float }* %2 to <2 x float>*
  %113 = load <2 x float>* %112, align 1
  %114 = call float @quantum_prob_inline(<2 x float> %113)
  %115 = fpext float %114 to double
  %116 = fcmp ogt double %115, 1.000000e-09
  br i1 %116, label %117, label %130

; <label>:117                                     ; preds = %102
  %118 = sext i32 %i.2 to i64
  %119 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %120 = load %struct.quantum_reg_node_struct** %119, align 8
  %121 = getelementptr inbounds %struct.quantum_reg_node_struct* %120, i64 %118
  %122 = getelementptr inbounds %struct.quantum_reg_node_struct* %121, i32 0, i32 1
  %123 = load i64* %122, align 8
  %124 = zext i32 %target to i64
  %125 = shl i64 1, %124
  %126 = and i64 %123, %125
  %127 = icmp ne i64 %126, 0
  br i1 %127, label %130, label %128

; <label>:128                                     ; preds = %117
  %129 = add nsw i32 %addsize.1, 1
  br label %130

; <label>:130                                     ; preds = %128, %117, %102
  %addsize.2 = phi i32 [ %addsize.1, %117 ], [ %129, %128 ], [ %addsize.1, %102 ]
  br label %131

; <label>:131                                     ; preds = %130, %62
  %addsize.3 = phi i32 [ %addsize.2, %130 ], [ %addsize.0, %62 ]
  br label %132

; <label>:132                                     ; preds = %131
  %133 = add nsw i32 %i.2, 1
  br label %58

; <label>:134                                     ; preds = %58
  %135 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %136 = load %struct.quantum_reg_node_struct** %135, align 8
  %137 = bitcast %struct.quantum_reg_node_struct* %136 to i8*
  %138 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %139 = load i32* %138, align 4
  %140 = add nsw i32 %139, %addsize.0
  %141 = sext i32 %140 to i64
  %142 = mul i64 %141, 16
  %143 = call i8* @realloc(i8* %137, i64 %142) #4
  %144 = bitcast i8* %143 to %struct.quantum_reg_node_struct*
  %145 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  store %struct.quantum_reg_node_struct* %144, %struct.quantum_reg_node_struct** %145, align 8
  %146 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %147 = load %struct.quantum_reg_node_struct** %146, align 8
  %148 = icmp ne %struct.quantum_reg_node_struct* %147, null
  br i1 %148, label %154, label %149

; <label>:149                                     ; preds = %134
  %150 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %151 = load i32* %150, align 4
  %152 = add nsw i32 %151, %addsize.0
  %153 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i32 0, i32 0), i32 %152)
  call void @exit(i32 1) #6
  unreachable

; <label>:154                                     ; preds = %134
  %155 = sext i32 %addsize.0 to i64
  %156 = mul i64 %155, 16
  %157 = call i64 @quantum_memman(i64 %156)
  br label %158

; <label>:158                                     ; preds = %179, %154
  %i.3 = phi i32 [ 0, %154 ], [ %180, %179 ]
  %159 = icmp slt i32 %i.3, %addsize.0
  br i1 %159, label %160, label %181

; <label>:160                                     ; preds = %158
  %161 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %162 = load i32* %161, align 4
  %163 = add nsw i32 %i.3, %162
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %166 = load %struct.quantum_reg_node_struct** %165, align 8
  %167 = getelementptr inbounds %struct.quantum_reg_node_struct* %166, i64 %164
  %168 = getelementptr inbounds %struct.quantum_reg_node_struct* %167, i32 0, i32 1
  store i64 0, i64* %168, align 8
  %169 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %170 = load i32* %169, align 4
  %171 = add nsw i32 %i.3, %170
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %174 = load %struct.quantum_reg_node_struct** %173, align 8
  %175 = getelementptr inbounds %struct.quantum_reg_node_struct* %174, i64 %172
  %176 = getelementptr inbounds %struct.quantum_reg_node_struct* %175, i32 0, i32 0
  %177 = getelementptr inbounds { float, float }* %176, i32 0, i32 0
  %178 = getelementptr inbounds { float, float }* %176, i32 0, i32 1
  store float 0.000000e+00, float* %177, align 4
  store float 0.000000e+00, float* %178, align 4
  br label %179

; <label>:179                                     ; preds = %160
  %180 = add nsw i32 %i.3, 1
  br label %158

; <label>:181                                     ; preds = %158
  %182 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %183 = load i32* %182, align 4
  %184 = add nsw i32 %183, %addsize.0
  %185 = sext i32 %184 to i64
  %186 = call noalias i8* @calloc(i64 %185, i64 1) #4
  %187 = icmp ne i8* %186, null
  br i1 %187, label %195, label %188

; <label>:188                                     ; preds = %181
  %189 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %190 = load i32* %189, align 4
  %191 = add nsw i32 %190, %addsize.0
  %192 = sext i32 %191 to i64
  %193 = mul i64 %192, 1
  %194 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str3, i32 0, i32 0), i64 %193)
  call void @exit(i32 1) #6
  unreachable

; <label>:195                                     ; preds = %181
  %196 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %197 = load i32* %196, align 4
  %198 = sext i32 %197 to i64
  %199 = sext i32 %addsize.0 to i64
  %200 = mul i64 %199, 1
  %201 = add i64 %198, %200
  %202 = call i64 @quantum_memman(i64 %201)
  %203 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %204 = load i32* %203, align 4
  %205 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 0
  %206 = load i32* %205, align 4
  %207 = zext i32 %206 to i64
  %208 = shl i64 1, %207
  %209 = uitofp i64 %208 to double
  %210 = fdiv double 1.000000e+00, %209
  %211 = fdiv double %210, 1.000000e+06
  %212 = fptrunc double %211 to float
  br label %213

; <label>:213                                     ; preds = %693, %195
  %k.0 = phi i32 [ %204, %195 ], [ %k.2, %693 ]
  %i.4 = phi i32 [ 0, %195 ], [ %694, %693 ]
  %214 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %215 = load i32* %214, align 4
  %216 = icmp slt i32 %i.4, %215
  br i1 %216, label %217, label %695

; <label>:217                                     ; preds = %213
  %218 = sext i32 %i.4 to i64
  %219 = getelementptr inbounds i8* %186, i64 %218
  %220 = load i8* %219, align 1
  %221 = icmp ne i8 %220, 0
  br i1 %221, label %692, label %222

; <label>:222                                     ; preds = %217
  %223 = sext i32 %i.4 to i64
  %224 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %225 = load %struct.quantum_reg_node_struct** %224, align 8
  %226 = getelementptr inbounds %struct.quantum_reg_node_struct* %225, i64 %223
  %227 = getelementptr inbounds %struct.quantum_reg_node_struct* %226, i32 0, i32 1
  %228 = load i64* %227, align 8
  %229 = zext i32 %target to i64
  %230 = shl i64 1, %229
  %231 = and i64 %228, %230
  %232 = trunc i64 %231 to i32
  %233 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %234 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  store float 0.000000e+00, float* %233, align 4
  store float 0.000000e+00, float* %234, align 4
  %235 = sext i32 %i.4 to i64
  %236 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %237 = load %struct.quantum_reg_node_struct** %236, align 8
  %238 = getelementptr inbounds %struct.quantum_reg_node_struct* %237, i64 %235
  %239 = getelementptr inbounds %struct.quantum_reg_node_struct* %238, i32 0, i32 1
  %240 = load i64* %239, align 8
  %241 = zext i32 %target to i64
  %242 = shl i64 1, %241
  %243 = xor i64 %240, %242
  %244 = call i32 @quantum_get_state(i64 %243, %struct.quantum_reg_struct* byval align 8 %reg)
  %245 = sext i32 %i.4 to i64
  %246 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %247 = load %struct.quantum_reg_node_struct** %246, align 8
  %248 = getelementptr inbounds %struct.quantum_reg_node_struct* %247, i64 %245
  %249 = getelementptr inbounds %struct.quantum_reg_node_struct* %248, i32 0, i32 0
  %250 = getelementptr inbounds { float, float }* %249, i32 0, i32 0
  %251 = load float* %250, align 4
  %252 = getelementptr inbounds { float, float }* %249, i32 0, i32 1
  %253 = load float* %252, align 4
  %254 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %255 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  store float %251, float* %254, align 4
  store float %253, float* %255, align 4
  %256 = icmp sge i32 %244, 0
  br i1 %256, label %257, label %269

; <label>:257                                     ; preds = %222
  %258 = sext i32 %244 to i64
  %259 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %260 = load %struct.quantum_reg_node_struct** %259, align 8
  %261 = getelementptr inbounds %struct.quantum_reg_node_struct* %260, i64 %258
  %262 = getelementptr inbounds %struct.quantum_reg_node_struct* %261, i32 0, i32 0
  %263 = getelementptr inbounds { float, float }* %262, i32 0, i32 0
  %264 = load float* %263, align 4
  %265 = getelementptr inbounds { float, float }* %262, i32 0, i32 1
  %266 = load float* %265, align 4
  %267 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %268 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  store float %264, float* %267, align 4
  store float %266, float* %268, align 4
  br label %269

; <label>:269                                     ; preds = %257, %222
  %270 = icmp ne i32 %232, 0
  br i1 %270, label %271, label %341

; <label>:271                                     ; preds = %269
  %272 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %273 = load { float, float }** %272, align 8
  %274 = getelementptr inbounds { float, float }* %273, i64 2
  %275 = getelementptr inbounds { float, float }* %274, i32 0, i32 0
  %276 = load float* %275, align 4
  %277 = getelementptr inbounds { float, float }* %274, i32 0, i32 1
  %278 = load float* %277, align 4
  %279 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %280 = load float* %279, align 4
  %281 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %282 = load float* %281, align 4
  %283 = fmul float %276, %280
  %284 = fmul float %278, %282
  %285 = fmul float %276, %282
  %286 = fmul float %278, %280
  %287 = fsub float %283, %284
  %288 = fadd float %285, %286
  %289 = fcmp uno float %287, %287
  br i1 %289, label %290, label %299, !prof !1

; <label>:290                                     ; preds = %271
  %291 = fcmp uno float %288, %288
  br i1 %291, label %292, label %299, !prof !1

; <label>:292                                     ; preds = %290
  %293 = call <2 x float> @__mulsc3(float %276, float %278, float %280, float %282) #4
  %294 = bitcast { float, float }* %3 to <2 x float>*
  store <2 x float> %293, <2 x float>* %294, align 1
  %295 = getelementptr inbounds { float, float }* %3, i32 0, i32 0
  %296 = load float* %295, align 4
  %297 = getelementptr inbounds { float, float }* %3, i32 0, i32 1
  %298 = load float* %297, align 4
  br label %299

; <label>:299                                     ; preds = %292, %290, %271
  %300 = phi float [ %287, %271 ], [ %287, %290 ], [ %296, %292 ]
  %301 = phi float [ %288, %271 ], [ %288, %290 ], [ %298, %292 ]
  %302 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %303 = load { float, float }** %302, align 8
  %304 = getelementptr inbounds { float, float }* %303, i64 3
  %305 = getelementptr inbounds { float, float }* %304, i32 0, i32 0
  %306 = load float* %305, align 4
  %307 = getelementptr inbounds { float, float }* %304, i32 0, i32 1
  %308 = load float* %307, align 4
  %309 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %310 = load float* %309, align 4
  %311 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %312 = load float* %311, align 4
  %313 = fmul float %306, %310
  %314 = fmul float %308, %312
  %315 = fmul float %306, %312
  %316 = fmul float %308, %310
  %317 = fsub float %313, %314
  %318 = fadd float %315, %316
  %319 = fcmp uno float %317, %317
  br i1 %319, label %320, label %329, !prof !1

; <label>:320                                     ; preds = %299
  %321 = fcmp uno float %318, %318
  br i1 %321, label %322, label %329, !prof !1

; <label>:322                                     ; preds = %320
  %323 = call <2 x float> @__mulsc3(float %306, float %308, float %310, float %312) #4
  %324 = bitcast { float, float }* %4 to <2 x float>*
  store <2 x float> %323, <2 x float>* %324, align 1
  %325 = getelementptr inbounds { float, float }* %4, i32 0, i32 0
  %326 = load float* %325, align 4
  %327 = getelementptr inbounds { float, float }* %4, i32 0, i32 1
  %328 = load float* %327, align 4
  br label %329

; <label>:329                                     ; preds = %322, %320, %299
  %330 = phi float [ %317, %299 ], [ %317, %320 ], [ %326, %322 ]
  %331 = phi float [ %318, %299 ], [ %318, %320 ], [ %328, %322 ]
  %332 = fadd float %300, %330
  %333 = fadd float %301, %331
  %334 = sext i32 %i.4 to i64
  %335 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %336 = load %struct.quantum_reg_node_struct** %335, align 8
  %337 = getelementptr inbounds %struct.quantum_reg_node_struct* %336, i64 %334
  %338 = getelementptr inbounds %struct.quantum_reg_node_struct* %337, i32 0, i32 0
  %339 = getelementptr inbounds { float, float }* %338, i32 0, i32 0
  %340 = getelementptr inbounds { float, float }* %338, i32 0, i32 1
  store float %332, float* %339, align 4
  store float %333, float* %340, align 4
  br label %411

; <label>:341                                     ; preds = %269
  %342 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %343 = load { float, float }** %342, align 8
  %344 = getelementptr inbounds { float, float }* %343, i64 0
  %345 = getelementptr inbounds { float, float }* %344, i32 0, i32 0
  %346 = load float* %345, align 4
  %347 = getelementptr inbounds { float, float }* %344, i32 0, i32 1
  %348 = load float* %347, align 4
  %349 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %350 = load float* %349, align 4
  %351 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %352 = load float* %351, align 4
  %353 = fmul float %346, %350
  %354 = fmul float %348, %352
  %355 = fmul float %346, %352
  %356 = fmul float %348, %350
  %357 = fsub float %353, %354
  %358 = fadd float %355, %356
  %359 = fcmp uno float %357, %357
  br i1 %359, label %360, label %369, !prof !1

; <label>:360                                     ; preds = %341
  %361 = fcmp uno float %358, %358
  br i1 %361, label %362, label %369, !prof !1

; <label>:362                                     ; preds = %360
  %363 = call <2 x float> @__mulsc3(float %346, float %348, float %350, float %352) #4
  %364 = bitcast { float, float }* %5 to <2 x float>*
  store <2 x float> %363, <2 x float>* %364, align 1
  %365 = getelementptr inbounds { float, float }* %5, i32 0, i32 0
  %366 = load float* %365, align 4
  %367 = getelementptr inbounds { float, float }* %5, i32 0, i32 1
  %368 = load float* %367, align 4
  br label %369

; <label>:369                                     ; preds = %362, %360, %341
  %370 = phi float [ %357, %341 ], [ %357, %360 ], [ %366, %362 ]
  %371 = phi float [ %358, %341 ], [ %358, %360 ], [ %368, %362 ]
  %372 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %373 = load { float, float }** %372, align 8
  %374 = getelementptr inbounds { float, float }* %373, i64 1
  %375 = getelementptr inbounds { float, float }* %374, i32 0, i32 0
  %376 = load float* %375, align 4
  %377 = getelementptr inbounds { float, float }* %374, i32 0, i32 1
  %378 = load float* %377, align 4
  %379 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %380 = load float* %379, align 4
  %381 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %382 = load float* %381, align 4
  %383 = fmul float %376, %380
  %384 = fmul float %378, %382
  %385 = fmul float %376, %382
  %386 = fmul float %378, %380
  %387 = fsub float %383, %384
  %388 = fadd float %385, %386
  %389 = fcmp uno float %387, %387
  br i1 %389, label %390, label %399, !prof !1

; <label>:390                                     ; preds = %369
  %391 = fcmp uno float %388, %388
  br i1 %391, label %392, label %399, !prof !1

; <label>:392                                     ; preds = %390
  %393 = call <2 x float> @__mulsc3(float %376, float %378, float %380, float %382) #4
  %394 = bitcast { float, float }* %6 to <2 x float>*
  store <2 x float> %393, <2 x float>* %394, align 1
  %395 = getelementptr inbounds { float, float }* %6, i32 0, i32 0
  %396 = load float* %395, align 4
  %397 = getelementptr inbounds { float, float }* %6, i32 0, i32 1
  %398 = load float* %397, align 4
  br label %399

; <label>:399                                     ; preds = %392, %390, %369
  %400 = phi float [ %387, %369 ], [ %387, %390 ], [ %396, %392 ]
  %401 = phi float [ %388, %369 ], [ %388, %390 ], [ %398, %392 ]
  %402 = fadd float %370, %400
  %403 = fadd float %371, %401
  %404 = sext i32 %i.4 to i64
  %405 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %406 = load %struct.quantum_reg_node_struct** %405, align 8
  %407 = getelementptr inbounds %struct.quantum_reg_node_struct* %406, i64 %404
  %408 = getelementptr inbounds %struct.quantum_reg_node_struct* %407, i32 0, i32 0
  %409 = getelementptr inbounds { float, float }* %408, i32 0, i32 0
  %410 = getelementptr inbounds { float, float }* %408, i32 0, i32 1
  store float %402, float* %409, align 4
  store float %403, float* %410, align 4
  br label %411

; <label>:411                                     ; preds = %399, %329
  %412 = icmp sge i32 %244, 0
  br i1 %412, label %413, label %556

; <label>:413                                     ; preds = %411
  %414 = icmp ne i32 %232, 0
  br i1 %414, label %415, label %485

; <label>:415                                     ; preds = %413
  %416 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %417 = load { float, float }** %416, align 8
  %418 = getelementptr inbounds { float, float }* %417, i64 0
  %419 = getelementptr inbounds { float, float }* %418, i32 0, i32 0
  %420 = load float* %419, align 4
  %421 = getelementptr inbounds { float, float }* %418, i32 0, i32 1
  %422 = load float* %421, align 4
  %423 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %424 = load float* %423, align 4
  %425 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %426 = load float* %425, align 4
  %427 = fmul float %420, %424
  %428 = fmul float %422, %426
  %429 = fmul float %420, %426
  %430 = fmul float %422, %424
  %431 = fsub float %427, %428
  %432 = fadd float %429, %430
  %433 = fcmp uno float %431, %431
  br i1 %433, label %434, label %443, !prof !1

; <label>:434                                     ; preds = %415
  %435 = fcmp uno float %432, %432
  br i1 %435, label %436, label %443, !prof !1

; <label>:436                                     ; preds = %434
  %437 = call <2 x float> @__mulsc3(float %420, float %422, float %424, float %426) #4
  %438 = bitcast { float, float }* %7 to <2 x float>*
  store <2 x float> %437, <2 x float>* %438, align 1
  %439 = getelementptr inbounds { float, float }* %7, i32 0, i32 0
  %440 = load float* %439, align 4
  %441 = getelementptr inbounds { float, float }* %7, i32 0, i32 1
  %442 = load float* %441, align 4
  br label %443

; <label>:443                                     ; preds = %436, %434, %415
  %444 = phi float [ %431, %415 ], [ %431, %434 ], [ %440, %436 ]
  %445 = phi float [ %432, %415 ], [ %432, %434 ], [ %442, %436 ]
  %446 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %447 = load { float, float }** %446, align 8
  %448 = getelementptr inbounds { float, float }* %447, i64 1
  %449 = getelementptr inbounds { float, float }* %448, i32 0, i32 0
  %450 = load float* %449, align 4
  %451 = getelementptr inbounds { float, float }* %448, i32 0, i32 1
  %452 = load float* %451, align 4
  %453 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %454 = load float* %453, align 4
  %455 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %456 = load float* %455, align 4
  %457 = fmul float %450, %454
  %458 = fmul float %452, %456
  %459 = fmul float %450, %456
  %460 = fmul float %452, %454
  %461 = fsub float %457, %458
  %462 = fadd float %459, %460
  %463 = fcmp uno float %461, %461
  br i1 %463, label %464, label %473, !prof !1

; <label>:464                                     ; preds = %443
  %465 = fcmp uno float %462, %462
  br i1 %465, label %466, label %473, !prof !1

; <label>:466                                     ; preds = %464
  %467 = call <2 x float> @__mulsc3(float %450, float %452, float %454, float %456) #4
  %468 = bitcast { float, float }* %8 to <2 x float>*
  store <2 x float> %467, <2 x float>* %468, align 1
  %469 = getelementptr inbounds { float, float }* %8, i32 0, i32 0
  %470 = load float* %469, align 4
  %471 = getelementptr inbounds { float, float }* %8, i32 0, i32 1
  %472 = load float* %471, align 4
  br label %473

; <label>:473                                     ; preds = %466, %464, %443
  %474 = phi float [ %461, %443 ], [ %461, %464 ], [ %470, %466 ]
  %475 = phi float [ %462, %443 ], [ %462, %464 ], [ %472, %466 ]
  %476 = fadd float %444, %474
  %477 = fadd float %445, %475
  %478 = sext i32 %244 to i64
  %479 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %480 = load %struct.quantum_reg_node_struct** %479, align 8
  %481 = getelementptr inbounds %struct.quantum_reg_node_struct* %480, i64 %478
  %482 = getelementptr inbounds %struct.quantum_reg_node_struct* %481, i32 0, i32 0
  %483 = getelementptr inbounds { float, float }* %482, i32 0, i32 0
  %484 = getelementptr inbounds { float, float }* %482, i32 0, i32 1
  store float %476, float* %483, align 4
  store float %477, float* %484, align 4
  br label %555

; <label>:485                                     ; preds = %413
  %486 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %487 = load { float, float }** %486, align 8
  %488 = getelementptr inbounds { float, float }* %487, i64 2
  %489 = getelementptr inbounds { float, float }* %488, i32 0, i32 0
  %490 = load float* %489, align 4
  %491 = getelementptr inbounds { float, float }* %488, i32 0, i32 1
  %492 = load float* %491, align 4
  %493 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %494 = load float* %493, align 4
  %495 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %496 = load float* %495, align 4
  %497 = fmul float %490, %494
  %498 = fmul float %492, %496
  %499 = fmul float %490, %496
  %500 = fmul float %492, %494
  %501 = fsub float %497, %498
  %502 = fadd float %499, %500
  %503 = fcmp uno float %501, %501
  br i1 %503, label %504, label %513, !prof !1

; <label>:504                                     ; preds = %485
  %505 = fcmp uno float %502, %502
  br i1 %505, label %506, label %513, !prof !1

; <label>:506                                     ; preds = %504
  %507 = call <2 x float> @__mulsc3(float %490, float %492, float %494, float %496) #4
  %508 = bitcast { float, float }* %9 to <2 x float>*
  store <2 x float> %507, <2 x float>* %508, align 1
  %509 = getelementptr inbounds { float, float }* %9, i32 0, i32 0
  %510 = load float* %509, align 4
  %511 = getelementptr inbounds { float, float }* %9, i32 0, i32 1
  %512 = load float* %511, align 4
  br label %513

; <label>:513                                     ; preds = %506, %504, %485
  %514 = phi float [ %501, %485 ], [ %501, %504 ], [ %510, %506 ]
  %515 = phi float [ %502, %485 ], [ %502, %504 ], [ %512, %506 ]
  %516 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %517 = load { float, float }** %516, align 8
  %518 = getelementptr inbounds { float, float }* %517, i64 3
  %519 = getelementptr inbounds { float, float }* %518, i32 0, i32 0
  %520 = load float* %519, align 4
  %521 = getelementptr inbounds { float, float }* %518, i32 0, i32 1
  %522 = load float* %521, align 4
  %523 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %524 = load float* %523, align 4
  %525 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %526 = load float* %525, align 4
  %527 = fmul float %520, %524
  %528 = fmul float %522, %526
  %529 = fmul float %520, %526
  %530 = fmul float %522, %524
  %531 = fsub float %527, %528
  %532 = fadd float %529, %530
  %533 = fcmp uno float %531, %531
  br i1 %533, label %534, label %543, !prof !1

; <label>:534                                     ; preds = %513
  %535 = fcmp uno float %532, %532
  br i1 %535, label %536, label %543, !prof !1

; <label>:536                                     ; preds = %534
  %537 = call <2 x float> @__mulsc3(float %520, float %522, float %524, float %526) #4
  %538 = bitcast { float, float }* %10 to <2 x float>*
  store <2 x float> %537, <2 x float>* %538, align 1
  %539 = getelementptr inbounds { float, float }* %10, i32 0, i32 0
  %540 = load float* %539, align 4
  %541 = getelementptr inbounds { float, float }* %10, i32 0, i32 1
  %542 = load float* %541, align 4
  br label %543

; <label>:543                                     ; preds = %536, %534, %513
  %544 = phi float [ %531, %513 ], [ %531, %534 ], [ %540, %536 ]
  %545 = phi float [ %532, %513 ], [ %532, %534 ], [ %542, %536 ]
  %546 = fadd float %514, %544
  %547 = fadd float %515, %545
  %548 = sext i32 %244 to i64
  %549 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %550 = load %struct.quantum_reg_node_struct** %549, align 8
  %551 = getelementptr inbounds %struct.quantum_reg_node_struct* %550, i64 %548
  %552 = getelementptr inbounds %struct.quantum_reg_node_struct* %551, i32 0, i32 0
  %553 = getelementptr inbounds { float, float }* %552, i32 0, i32 0
  %554 = getelementptr inbounds { float, float }* %552, i32 0, i32 1
  store float %546, float* %553, align 4
  store float %547, float* %554, align 4
  br label %555

; <label>:555                                     ; preds = %543, %473
  br label %686

; <label>:556                                     ; preds = %411
  %557 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %558 = load { float, float }** %557, align 8
  %559 = getelementptr inbounds { float, float }* %558, i64 1
  %560 = getelementptr inbounds { float, float }* %559, i32 0, i32 0
  %561 = load float* %560, align 4
  %562 = getelementptr inbounds { float, float }* %559, i32 0, i32 1
  %563 = load float* %562, align 4
  %564 = getelementptr inbounds { float, float }* %11, i32 0, i32 0
  %565 = getelementptr inbounds { float, float }* %11, i32 0, i32 1
  store float %561, float* %564, align 4
  store float %563, float* %565, align 4
  %566 = bitcast { float, float }* %11 to <2 x float>*
  %567 = load <2 x float>* %566, align 1
  %568 = call float @quantum_prob_inline(<2 x float> %567)
  %569 = fpext float %568 to double
  %570 = fcmp olt double %569, 1.000000e-09
  br i1 %570, label %571, label %574

; <label>:571                                     ; preds = %556
  %572 = icmp ne i32 %232, 0
  br i1 %572, label %573, label %574

; <label>:573                                     ; preds = %571
  br label %695

; <label>:574                                     ; preds = %571, %556
  %575 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %576 = load { float, float }** %575, align 8
  %577 = getelementptr inbounds { float, float }* %576, i64 2
  %578 = getelementptr inbounds { float, float }* %577, i32 0, i32 0
  %579 = load float* %578, align 4
  %580 = getelementptr inbounds { float, float }* %577, i32 0, i32 1
  %581 = load float* %580, align 4
  %582 = getelementptr inbounds { float, float }* %12, i32 0, i32 0
  %583 = getelementptr inbounds { float, float }* %12, i32 0, i32 1
  store float %579, float* %582, align 4
  store float %581, float* %583, align 4
  %584 = bitcast { float, float }* %12 to <2 x float>*
  %585 = load <2 x float>* %584, align 1
  %586 = call float @quantum_prob_inline(<2 x float> %585)
  %587 = fpext float %586 to double
  %588 = fcmp olt double %587, 1.000000e-09
  br i1 %588, label %589, label %592

; <label>:589                                     ; preds = %574
  %590 = icmp ne i32 %232, 0
  br i1 %590, label %592, label %591

; <label>:591                                     ; preds = %589
  br label %695

; <label>:592                                     ; preds = %589, %574
  %593 = sext i32 %i.4 to i64
  %594 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %595 = load %struct.quantum_reg_node_struct** %594, align 8
  %596 = getelementptr inbounds %struct.quantum_reg_node_struct* %595, i64 %593
  %597 = getelementptr inbounds %struct.quantum_reg_node_struct* %596, i32 0, i32 1
  %598 = load i64* %597, align 8
  %599 = zext i32 %target to i64
  %600 = shl i64 1, %599
  %601 = xor i64 %598, %600
  %602 = sext i32 %k.0 to i64
  %603 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %604 = load %struct.quantum_reg_node_struct** %603, align 8
  %605 = getelementptr inbounds %struct.quantum_reg_node_struct* %604, i64 %602
  %606 = getelementptr inbounds %struct.quantum_reg_node_struct* %605, i32 0, i32 1
  store i64 %601, i64* %606, align 8
  %607 = icmp ne i32 %232, 0
  br i1 %607, label %608, label %646

; <label>:608                                     ; preds = %592
  %609 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %610 = load { float, float }** %609, align 8
  %611 = getelementptr inbounds { float, float }* %610, i64 1
  %612 = getelementptr inbounds { float, float }* %611, i32 0, i32 0
  %613 = load float* %612, align 4
  %614 = getelementptr inbounds { float, float }* %611, i32 0, i32 1
  %615 = load float* %614, align 4
  %616 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %617 = load float* %616, align 4
  %618 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %619 = load float* %618, align 4
  %620 = fmul float %613, %617
  %621 = fmul float %615, %619
  %622 = fmul float %613, %619
  %623 = fmul float %615, %617
  %624 = fsub float %620, %621
  %625 = fadd float %622, %623
  %626 = fcmp uno float %624, %624
  br i1 %626, label %627, label %636, !prof !1

; <label>:627                                     ; preds = %608
  %628 = fcmp uno float %625, %625
  br i1 %628, label %629, label %636, !prof !1

; <label>:629                                     ; preds = %627
  %630 = call <2 x float> @__mulsc3(float %613, float %615, float %617, float %619) #4
  %631 = bitcast { float, float }* %13 to <2 x float>*
  store <2 x float> %630, <2 x float>* %631, align 1
  %632 = getelementptr inbounds { float, float }* %13, i32 0, i32 0
  %633 = load float* %632, align 4
  %634 = getelementptr inbounds { float, float }* %13, i32 0, i32 1
  %635 = load float* %634, align 4
  br label %636

; <label>:636                                     ; preds = %629, %627, %608
  %637 = phi float [ %624, %608 ], [ %624, %627 ], [ %633, %629 ]
  %638 = phi float [ %625, %608 ], [ %625, %627 ], [ %635, %629 ]
  %639 = sext i32 %k.0 to i64
  %640 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %641 = load %struct.quantum_reg_node_struct** %640, align 8
  %642 = getelementptr inbounds %struct.quantum_reg_node_struct* %641, i64 %639
  %643 = getelementptr inbounds %struct.quantum_reg_node_struct* %642, i32 0, i32 0
  %644 = getelementptr inbounds { float, float }* %643, i32 0, i32 0
  %645 = getelementptr inbounds { float, float }* %643, i32 0, i32 1
  store float %637, float* %644, align 4
  store float %638, float* %645, align 4
  br label %684

; <label>:646                                     ; preds = %592
  %647 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %648 = load { float, float }** %647, align 8
  %649 = getelementptr inbounds { float, float }* %648, i64 2
  %650 = getelementptr inbounds { float, float }* %649, i32 0, i32 0
  %651 = load float* %650, align 4
  %652 = getelementptr inbounds { float, float }* %649, i32 0, i32 1
  %653 = load float* %652, align 4
  %654 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %655 = load float* %654, align 4
  %656 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %657 = load float* %656, align 4
  %658 = fmul float %651, %655
  %659 = fmul float %653, %657
  %660 = fmul float %651, %657
  %661 = fmul float %653, %655
  %662 = fsub float %658, %659
  %663 = fadd float %660, %661
  %664 = fcmp uno float %662, %662
  br i1 %664, label %665, label %674, !prof !1

; <label>:665                                     ; preds = %646
  %666 = fcmp uno float %663, %663
  br i1 %666, label %667, label %674, !prof !1

; <label>:667                                     ; preds = %665
  %668 = call <2 x float> @__mulsc3(float %651, float %653, float %655, float %657) #4
  %669 = bitcast { float, float }* %14 to <2 x float>*
  store <2 x float> %668, <2 x float>* %669, align 1
  %670 = getelementptr inbounds { float, float }* %14, i32 0, i32 0
  %671 = load float* %670, align 4
  %672 = getelementptr inbounds { float, float }* %14, i32 0, i32 1
  %673 = load float* %672, align 4
  br label %674

; <label>:674                                     ; preds = %667, %665, %646
  %675 = phi float [ %662, %646 ], [ %662, %665 ], [ %671, %667 ]
  %676 = phi float [ %663, %646 ], [ %663, %665 ], [ %673, %667 ]
  %677 = sext i32 %k.0 to i64
  %678 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %679 = load %struct.quantum_reg_node_struct** %678, align 8
  %680 = getelementptr inbounds %struct.quantum_reg_node_struct* %679, i64 %677
  %681 = getelementptr inbounds %struct.quantum_reg_node_struct* %680, i32 0, i32 0
  %682 = getelementptr inbounds { float, float }* %681, i32 0, i32 0
  %683 = getelementptr inbounds { float, float }* %681, i32 0, i32 1
  store float %675, float* %682, align 4
  store float %676, float* %683, align 4
  br label %684

; <label>:684                                     ; preds = %674, %636
  %685 = add nsw i32 %k.0, 1
  br label %686

; <label>:686                                     ; preds = %684, %555
  %k.1 = phi i32 [ %k.0, %555 ], [ %685, %684 ]
  %687 = icmp sge i32 %244, 0
  br i1 %687, label %688, label %691

; <label>:688                                     ; preds = %686
  %689 = sext i32 %244 to i64
  %690 = getelementptr inbounds i8* %186, i64 %689
  store i8 1, i8* %690, align 1
  br label %691

; <label>:691                                     ; preds = %688, %686
  br label %692

; <label>:692                                     ; preds = %691, %217
  %k.2 = phi i32 [ %k.0, %217 ], [ %k.1, %691 ]
  br label %693

; <label>:693                                     ; preds = %692
  %694 = add nsw i32 %i.4, 1
  br label %213

; <label>:695                                     ; preds = %591, %573, %213
  %696 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %697 = load i32* %696, align 4
  %698 = add nsw i32 %697, %addsize.0
  store i32 %698, i32* %696, align 4
  call void @free(i8* %186) #4
  %699 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %700 = load i32* %699, align 4
  %701 = sub nsw i32 0, %700
  %702 = sext i32 %701 to i64
  %703 = mul i64 %702, 1
  %704 = call i64 @quantum_memman(i64 %703)
  br label %705

; <label>:705                                     ; preds = %762, %695
  %j.0 = phi i32 [ 0, %695 ], [ %j.1, %762 ]
  %i.5 = phi i32 [ 0, %695 ], [ %763, %762 ]
  %decsize.0 = phi i32 [ 0, %695 ], [ %decsize.1, %762 ]
  %706 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %707 = load i32* %706, align 4
  %708 = icmp slt i32 %i.5, %707
  br i1 %708, label %709, label %764

; <label>:709                                     ; preds = %705
  %710 = sext i32 %i.5 to i64
  %711 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %712 = load %struct.quantum_reg_node_struct** %711, align 8
  %713 = getelementptr inbounds %struct.quantum_reg_node_struct* %712, i64 %710
  %714 = getelementptr inbounds %struct.quantum_reg_node_struct* %713, i32 0, i32 0
  %715 = getelementptr inbounds { float, float }* %714, i32 0, i32 0
  %716 = load float* %715, align 4
  %717 = getelementptr inbounds { float, float }* %714, i32 0, i32 1
  %718 = load float* %717, align 4
  %719 = getelementptr inbounds { float, float }* %15, i32 0, i32 0
  %720 = getelementptr inbounds { float, float }* %15, i32 0, i32 1
  store float %716, float* %719, align 4
  store float %718, float* %720, align 4
  %721 = bitcast { float, float }* %15 to <2 x float>*
  %722 = load <2 x float>* %721, align 1
  %723 = call float @quantum_prob_inline(<2 x float> %722)
  %724 = fcmp olt float %723, %212
  br i1 %724, label %725, label %728

; <label>:725                                     ; preds = %709
  %726 = add nsw i32 %j.0, 1
  %727 = add nsw i32 %decsize.0, 1
  br label %761

; <label>:728                                     ; preds = %709
  %729 = icmp ne i32 %j.0, 0
  br i1 %729, label %730, label %760

; <label>:730                                     ; preds = %728
  %731 = sext i32 %i.5 to i64
  %732 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %733 = load %struct.quantum_reg_node_struct** %732, align 8
  %734 = getelementptr inbounds %struct.quantum_reg_node_struct* %733, i64 %731
  %735 = getelementptr inbounds %struct.quantum_reg_node_struct* %734, i32 0, i32 1
  %736 = load i64* %735, align 8
  %737 = sub nsw i32 %i.5, %j.0
  %738 = sext i32 %737 to i64
  %739 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %740 = load %struct.quantum_reg_node_struct** %739, align 8
  %741 = getelementptr inbounds %struct.quantum_reg_node_struct* %740, i64 %738
  %742 = getelementptr inbounds %struct.quantum_reg_node_struct* %741, i32 0, i32 1
  store i64 %736, i64* %742, align 8
  %743 = sext i32 %i.5 to i64
  %744 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %745 = load %struct.quantum_reg_node_struct** %744, align 8
  %746 = getelementptr inbounds %struct.quantum_reg_node_struct* %745, i64 %743
  %747 = getelementptr inbounds %struct.quantum_reg_node_struct* %746, i32 0, i32 0
  %748 = getelementptr inbounds { float, float }* %747, i32 0, i32 0
  %749 = load float* %748, align 4
  %750 = getelementptr inbounds { float, float }* %747, i32 0, i32 1
  %751 = load float* %750, align 4
  %752 = sub nsw i32 %i.5, %j.0
  %753 = sext i32 %752 to i64
  %754 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %755 = load %struct.quantum_reg_node_struct** %754, align 8
  %756 = getelementptr inbounds %struct.quantum_reg_node_struct* %755, i64 %753
  %757 = getelementptr inbounds %struct.quantum_reg_node_struct* %756, i32 0, i32 0
  %758 = getelementptr inbounds { float, float }* %757, i32 0, i32 0
  %759 = getelementptr inbounds { float, float }* %757, i32 0, i32 1
  store float %749, float* %758, align 4
  store float %751, float* %759, align 4
  br label %760

; <label>:760                                     ; preds = %730, %728
  br label %761

; <label>:761                                     ; preds = %760, %725
  %j.1 = phi i32 [ %726, %725 ], [ %j.0, %760 ]
  %decsize.1 = phi i32 [ %727, %725 ], [ %decsize.0, %760 ]
  br label %762

; <label>:762                                     ; preds = %761
  %763 = add nsw i32 %i.5, 1
  br label %705

; <label>:764                                     ; preds = %705
  %765 = icmp ne i32 %decsize.0, 0
  br i1 %765, label %766, label %793

; <label>:766                                     ; preds = %764
  %767 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %768 = load i32* %767, align 4
  %769 = sub nsw i32 %768, %decsize.0
  store i32 %769, i32* %767, align 4
  %770 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %771 = load %struct.quantum_reg_node_struct** %770, align 8
  %772 = bitcast %struct.quantum_reg_node_struct* %771 to i8*
  %773 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %774 = load i32* %773, align 4
  %775 = sext i32 %774 to i64
  %776 = mul i64 %775, 16
  %777 = call i8* @realloc(i8* %772, i64 %776) #4
  %778 = bitcast i8* %777 to %struct.quantum_reg_node_struct*
  %779 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  store %struct.quantum_reg_node_struct* %778, %struct.quantum_reg_node_struct** %779, align 8
  %780 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %781 = load %struct.quantum_reg_node_struct** %780, align 8
  %782 = icmp ne %struct.quantum_reg_node_struct* %781, null
  br i1 %782, label %788, label %783

; <label>:783                                     ; preds = %766
  %784 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %785 = load i32* %784, align 4
  %786 = add nsw i32 %785, %addsize.0
  %787 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i32 0, i32 0), i32 %786)
  call void @exit(i32 1) #6
  unreachable

; <label>:788                                     ; preds = %766
  %789 = sub nsw i32 0, %decsize.0
  %790 = sext i32 %789 to i64
  %791 = mul i64 %790, 16
  %792 = call i64 @quantum_memman(i64 %791)
  br label %793

; <label>:793                                     ; preds = %788, %764
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal void @quantum_add_hash(i64 %a, i32 %pos, %struct.quantum_reg_struct* %reg) #5 {
  %1 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 2
  %2 = load i32* %1, align 4
  %3 = call i32 @quantum_hash64(i64 %a, i32 %2)
  br label %4

; <label>:4                                       ; preds = %18, %0
  %i.0 = phi i32 [ %3, %0 ], [ %i.1, %18 ]
  %5 = sext i32 %i.0 to i64
  %6 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 4
  %7 = load i32** %6, align 8
  %8 = getelementptr inbounds i32* %7, i64 %5
  %9 = load i32* %8, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %19

; <label>:11                                      ; preds = %4
  %12 = add nsw i32 %i.0, 1
  %13 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 2
  %14 = load i32* %13, align 4
  %15 = shl i32 1, %14
  %16 = icmp eq i32 %12, %15
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %11
  br label %18

; <label>:18                                      ; preds = %17, %11
  %i.1 = phi i32 [ 0, %17 ], [ %12, %11 ]
  br label %4

; <label>:19                                      ; preds = %4
  %20 = add nsw i32 %pos, 1
  %21 = sext i32 %i.0 to i64
  %22 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 4
  %23 = load i32** %22, align 8
  %24 = getelementptr inbounds i32* %23, i64 %21
  store i32 %20, i32* %24, align 4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @quantum_get_state(i64 %a, %struct.quantum_reg_struct* byval align 8 %reg) #5 {
  %1 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 2
  %2 = load i32* %1, align 4
  %3 = call i32 @quantum_hash64(i64 %a, i32 %2)
  br label %4

; <label>:4                                       ; preds = %39, %0
  %i.0 = phi i32 [ %3, %0 ], [ %i.1, %39 ]
  %5 = sext i32 %i.0 to i64
  %6 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 4
  %7 = load i32** %6, align 8
  %8 = getelementptr inbounds i32* %7, i64 %5
  %9 = load i32* %8, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %40

; <label>:11                                      ; preds = %4
  %12 = sext i32 %i.0 to i64
  %13 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 4
  %14 = load i32** %13, align 8
  %15 = getelementptr inbounds i32* %14, i64 %12
  %16 = load i32* %15, align 4
  %17 = sub nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %20 = load %struct.quantum_reg_node_struct** %19, align 8
  %21 = getelementptr inbounds %struct.quantum_reg_node_struct* %20, i64 %18
  %22 = getelementptr inbounds %struct.quantum_reg_node_struct* %21, i32 0, i32 1
  %23 = load i64* %22, align 8
  %24 = icmp eq i64 %23, %a
  br i1 %24, label %25, label %32

; <label>:25                                      ; preds = %11
  %26 = sext i32 %i.0 to i64
  %27 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 4
  %28 = load i32** %27, align 8
  %29 = getelementptr inbounds i32* %28, i64 %26
  %30 = load i32* %29, align 4
  %31 = sub nsw i32 %30, 1
  br label %41

; <label>:32                                      ; preds = %11
  %33 = add nsw i32 %i.0, 1
  %34 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 2
  %35 = load i32* %34, align 4
  %36 = shl i32 1, %35
  %37 = icmp eq i32 %33, %36
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %32
  br label %39

; <label>:39                                      ; preds = %38, %32
  %i.1 = phi i32 [ 0, %38 ], [ %33, %32 ]
  br label %4

; <label>:40                                      ; preds = %4
  br label %41

; <label>:41                                      ; preds = %40, %25
  %.0 = phi i32 [ %31, %25 ], [ -1, %40 ]
  ret i32 %.0
}

; Function Attrs: inlinehint nounwind uwtable
define internal float @quantum_prob_inline(<2 x float> %a.coerce) #5 {
  %a = alloca { float, float }, align 8
  %1 = alloca { float, float }, align 4
  %2 = alloca { float, float }, align 4
  %3 = bitcast { float, float }* %a to <2 x float>*
  store <2 x float> %a.coerce, <2 x float>* %3, align 1
  %4 = getelementptr inbounds { float, float }* %a, i32 0, i32 0
  %5 = load float* %4, align 4
  %6 = getelementptr inbounds { float, float }* %a, i32 0, i32 1
  %7 = load float* %6, align 4
  %8 = getelementptr inbounds { float, float }* %1, i32 0, i32 0
  %9 = getelementptr inbounds { float, float }* %1, i32 0, i32 1
  store float %5, float* %8, align 4
  store float %7, float* %9, align 4
  %10 = bitcast { float, float }* %1 to <2 x float>*
  %11 = load <2 x float>* %10, align 1
  %12 = call float @quantum_real(<2 x float> %11)
  %13 = getelementptr inbounds { float, float }* %a, i32 0, i32 0
  %14 = load float* %13, align 4
  %15 = getelementptr inbounds { float, float }* %a, i32 0, i32 1
  %16 = load float* %15, align 4
  %17 = getelementptr inbounds { float, float }* %2, i32 0, i32 0
  %18 = getelementptr inbounds { float, float }* %2, i32 0, i32 1
  store float %14, float* %17, align 4
  store float %16, float* %18, align 4
  %19 = bitcast { float, float }* %2 to <2 x float>*
  %20 = load <2 x float>* %19, align 1
  %21 = call float @quantum_imag(<2 x float> %20)
  %22 = fmul float %12, %12
  %23 = fmul float %21, %21
  %24 = fadd float %22, %23
  ret float %24
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #2

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind uwtable
define void @quantum_gate2(i32 %control, i32 %target, i64 %m.coerce0, { float, float }* %m.coerce1, %struct.quantum_reg_struct* %reg) #0 {
  %m = alloca %struct.quantum_matrix_struct, align 8
  %t = alloca { float, float }, align 4
  %tnot = alloca { float, float }, align 4
  %1 = alloca { float, float }, align 4
  %2 = alloca { float, float }, align 4
  %3 = alloca { float, float }, align 4
  %4 = alloca { float, float }, align 4
  %5 = alloca { float, float }, align 4
  %6 = alloca { float, float }, align 4
  %7 = alloca { float, float }, align 4
  %8 = alloca { float, float }, align 4
  %9 = alloca { float, float }, align 4
  %10 = alloca { float, float }, align 4
  %11 = alloca { float, float }, align 4
  %12 = bitcast %struct.quantum_matrix_struct* %m to { i64, { float, float }* }*
  %13 = getelementptr { i64, { float, float }* }* %12, i32 0, i32 0
  store i64 %m.coerce0, i64* %13
  %14 = getelementptr { i64, { float, float }* }* %12, i32 0, i32 1
  store { float, float }* %m.coerce1, { float, float }** %14
  %15 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %16 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  store float 0.000000e+00, float* %15, align 4
  store float 0.000000e+00, float* %16, align 4
  %17 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 1
  %18 = load i32* %17, align 4
  %19 = icmp ne i32 %18, 4
  br i1 %19, label %24, label %20

; <label>:20                                      ; preds = %0
  %21 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 0
  %22 = load i32* %21, align 4
  %23 = icmp ne i32 %22, 4
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %20, %0
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:26                                      ; preds = %20
  br label %27

; <label>:27                                      ; preds = %37, %26
  %i.0 = phi i32 [ 0, %26 ], [ %38, %37 ]
  %28 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 2
  %29 = load i32* %28, align 4
  %30 = shl i32 1, %29
  %31 = icmp slt i32 %i.0, %30
  br i1 %31, label %32, label %39

; <label>:32                                      ; preds = %27
  %33 = sext i32 %i.0 to i64
  %34 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 4
  %35 = load i32** %34, align 8
  %36 = getelementptr inbounds i32* %35, i64 %33
  store i32 0, i32* %36, align 4
  br label %37

; <label>:37                                      ; preds = %32
  %38 = add nsw i32 %i.0, 1
  br label %27

; <label>:39                                      ; preds = %27
  br label %40

; <label>:40                                      ; preds = %51, %39
  %i.1 = phi i32 [ 0, %39 ], [ %52, %51 ]
  %41 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %42 = load i32* %41, align 4
  %43 = icmp slt i32 %i.1, %42
  br i1 %43, label %44, label %53

; <label>:44                                      ; preds = %40
  %45 = sext i32 %i.1 to i64
  %46 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %47 = load %struct.quantum_reg_node_struct** %46, align 8
  %48 = getelementptr inbounds %struct.quantum_reg_node_struct* %47, i64 %45
  %49 = getelementptr inbounds %struct.quantum_reg_node_struct* %48, i32 0, i32 1
  %50 = load i64* %49, align 8
  call void @quantum_add_hash(i64 %50, i32 %i.1, %struct.quantum_reg_struct* %reg)
  br label %51

; <label>:51                                      ; preds = %44
  %52 = add nsw i32 %i.1, 1
  br label %40

; <label>:53                                      ; preds = %40
  br label %54

; <label>:54                                      ; preds = %120, %53
  %i.2 = phi i32 [ 0, %53 ], [ %121, %120 ]
  %addsize.0 = phi i32 [ 0, %53 ], [ %addsize.3, %120 ]
  %55 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %56 = load i32* %55, align 4
  %57 = icmp slt i32 %i.2, %56
  br i1 %57, label %58, label %122

; <label>:58                                      ; preds = %54
  %59 = sext i32 %i.2 to i64
  %60 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %61 = load %struct.quantum_reg_node_struct** %60, align 8
  %62 = getelementptr inbounds %struct.quantum_reg_node_struct* %61, i64 %59
  %63 = getelementptr inbounds %struct.quantum_reg_node_struct* %62, i32 0, i32 1
  %64 = load i64* %63, align 8
  %65 = zext i32 %target to i64
  %66 = shl i64 1, %65
  %67 = xor i64 %64, %66
  %68 = call i32 @quantum_get_state(i64 %67, %struct.quantum_reg_struct* byval align 8 %reg)
  %69 = icmp eq i32 %68, -1
  br i1 %69, label %70, label %119

; <label>:70                                      ; preds = %58
  %71 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %72 = load { float, float }** %71, align 8
  %73 = getelementptr inbounds { float, float }* %72, i64 1
  %74 = getelementptr inbounds { float, float }* %73, i32 0, i32 0
  %75 = load float* %74, align 4
  %76 = getelementptr inbounds { float, float }* %73, i32 0, i32 1
  %77 = load float* %76, align 4
  %78 = fcmp une float %75, 0.000000e+00
  %79 = fcmp une float %77, 0.000000e+00
  %80 = or i1 %78, %79
  br i1 %80, label %81, label %94

; <label>:81                                      ; preds = %70
  %82 = sext i32 %i.2 to i64
  %83 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %84 = load %struct.quantum_reg_node_struct** %83, align 8
  %85 = getelementptr inbounds %struct.quantum_reg_node_struct* %84, i64 %82
  %86 = getelementptr inbounds %struct.quantum_reg_node_struct* %85, i32 0, i32 1
  %87 = load i64* %86, align 8
  %88 = zext i32 %target to i64
  %89 = shl i64 1, %88
  %90 = and i64 %87, %89
  %91 = icmp ne i64 %90, 0
  br i1 %91, label %92, label %94

; <label>:92                                      ; preds = %81
  %93 = add nsw i32 %addsize.0, 1
  br label %94

; <label>:94                                      ; preds = %92, %81, %70
  %addsize.1 = phi i32 [ %93, %92 ], [ %addsize.0, %81 ], [ %addsize.0, %70 ]
  %95 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %96 = load { float, float }** %95, align 8
  %97 = getelementptr inbounds { float, float }* %96, i64 2
  %98 = getelementptr inbounds { float, float }* %97, i32 0, i32 0
  %99 = load float* %98, align 4
  %100 = getelementptr inbounds { float, float }* %97, i32 0, i32 1
  %101 = load float* %100, align 4
  %102 = fcmp une float %99, 0.000000e+00
  %103 = fcmp une float %101, 0.000000e+00
  %104 = or i1 %102, %103
  br i1 %104, label %105, label %118

; <label>:105                                     ; preds = %94
  %106 = sext i32 %i.2 to i64
  %107 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %108 = load %struct.quantum_reg_node_struct** %107, align 8
  %109 = getelementptr inbounds %struct.quantum_reg_node_struct* %108, i64 %106
  %110 = getelementptr inbounds %struct.quantum_reg_node_struct* %109, i32 0, i32 1
  %111 = load i64* %110, align 8
  %112 = zext i32 %target to i64
  %113 = shl i64 1, %112
  %114 = and i64 %111, %113
  %115 = icmp ne i64 %114, 0
  br i1 %115, label %118, label %116

; <label>:116                                     ; preds = %105
  %117 = add nsw i32 %addsize.1, 1
  br label %118

; <label>:118                                     ; preds = %116, %105, %94
  %addsize.2 = phi i32 [ %addsize.1, %105 ], [ %117, %116 ], [ %addsize.1, %94 ]
  br label %119

; <label>:119                                     ; preds = %118, %58
  %addsize.3 = phi i32 [ %addsize.2, %118 ], [ %addsize.0, %58 ]
  br label %120

; <label>:120                                     ; preds = %119
  %121 = add nsw i32 %i.2, 1
  br label %54

; <label>:122                                     ; preds = %54
  %123 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %124 = load %struct.quantum_reg_node_struct** %123, align 8
  %125 = bitcast %struct.quantum_reg_node_struct* %124 to i8*
  %126 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %127 = load i32* %126, align 4
  %128 = add nsw i32 %127, %addsize.0
  %129 = sext i32 %128 to i64
  %130 = mul i64 %129, 16
  %131 = call i8* @realloc(i8* %125, i64 %130) #4
  %132 = bitcast i8* %131 to %struct.quantum_reg_node_struct*
  %133 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  store %struct.quantum_reg_node_struct* %132, %struct.quantum_reg_node_struct** %133, align 8
  %134 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %135 = load %struct.quantum_reg_node_struct** %134, align 8
  %136 = icmp ne %struct.quantum_reg_node_struct* %135, null
  br i1 %136, label %142, label %137

; <label>:137                                     ; preds = %122
  %138 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %139 = load i32* %138, align 4
  %140 = add nsw i32 %139, %addsize.0
  %141 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i32 0, i32 0), i32 %140)
  call void @exit(i32 1) #6
  unreachable

; <label>:142                                     ; preds = %122
  %143 = sext i32 %addsize.0 to i64
  %144 = mul i64 %143, 16
  %145 = call i64 @quantum_memman(i64 %144)
  br label %146

; <label>:146                                     ; preds = %167, %142
  %i.3 = phi i32 [ 0, %142 ], [ %168, %167 ]
  %147 = icmp slt i32 %i.3, %addsize.0
  br i1 %147, label %148, label %169

; <label>:148                                     ; preds = %146
  %149 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %150 = load i32* %149, align 4
  %151 = add nsw i32 %i.3, %150
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %154 = load %struct.quantum_reg_node_struct** %153, align 8
  %155 = getelementptr inbounds %struct.quantum_reg_node_struct* %154, i64 %152
  %156 = getelementptr inbounds %struct.quantum_reg_node_struct* %155, i32 0, i32 1
  store i64 0, i64* %156, align 8
  %157 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %158 = load i32* %157, align 4
  %159 = add nsw i32 %i.3, %158
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %162 = load %struct.quantum_reg_node_struct** %161, align 8
  %163 = getelementptr inbounds %struct.quantum_reg_node_struct* %162, i64 %160
  %164 = getelementptr inbounds %struct.quantum_reg_node_struct* %163, i32 0, i32 0
  %165 = getelementptr inbounds { float, float }* %164, i32 0, i32 0
  %166 = getelementptr inbounds { float, float }* %164, i32 0, i32 1
  store float 0.000000e+00, float* %165, align 4
  store float 0.000000e+00, float* %166, align 4
  br label %167

; <label>:167                                     ; preds = %148
  %168 = add nsw i32 %i.3, 1
  br label %146

; <label>:169                                     ; preds = %146
  %170 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %171 = load i32* %170, align 4
  %172 = add nsw i32 %171, %addsize.0
  %173 = sext i32 %172 to i64
  %174 = call noalias i8* @calloc(i64 %173, i64 1) #4
  %175 = icmp ne i8* %174, null
  br i1 %175, label %183, label %176

; <label>:176                                     ; preds = %169
  %177 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %178 = load i32* %177, align 4
  %179 = add nsw i32 %178, %addsize.0
  %180 = sext i32 %179 to i64
  %181 = mul i64 %180, 1
  %182 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str3, i32 0, i32 0), i64 %181)
  call void @exit(i32 1) #6
  unreachable

; <label>:183                                     ; preds = %169
  %184 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %185 = load i32* %184, align 4
  %186 = sext i32 %185 to i64
  %187 = sext i32 %addsize.0 to i64
  %188 = mul i64 %187, 1
  %189 = add i64 %186, %188
  %190 = call i64 @quantum_memman(i64 %189)
  %191 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %192 = load i32* %191, align 4
  %193 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 0
  %194 = load i32* %193, align 4
  %195 = zext i32 %194 to i64
  %196 = shl i64 1, %195
  %197 = uitofp i64 %196 to double
  %198 = fdiv double 1.000000e+00, %197
  %199 = fdiv double %198, 1.000000e+06
  %200 = fptrunc double %199 to float
  br label %201

; <label>:201                                     ; preds = %673, %183
  %i.4 = phi i32 [ 0, %183 ], [ %674, %673 ]
  %k.0 = phi i32 [ %192, %183 ], [ %k.2, %673 ]
  %202 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %203 = load i32* %202, align 4
  %204 = icmp slt i32 %i.4, %203
  br i1 %204, label %205, label %675

; <label>:205                                     ; preds = %201
  %206 = sext i32 %i.4 to i64
  %207 = getelementptr inbounds i8* %174, i64 %206
  %208 = load i8* %207, align 1
  %209 = icmp ne i8 %208, 0
  br i1 %209, label %672, label %210

; <label>:210                                     ; preds = %205
  %211 = sext i32 %i.4 to i64
  %212 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %213 = load %struct.quantum_reg_node_struct** %212, align 8
  %214 = getelementptr inbounds %struct.quantum_reg_node_struct* %213, i64 %211
  %215 = getelementptr inbounds %struct.quantum_reg_node_struct* %214, i32 0, i32 1
  %216 = load i64* %215, align 8
  %217 = zext i32 %target to i64
  %218 = shl i64 1, %217
  %219 = and i64 %216, %218
  %220 = trunc i64 %219 to i32
  %221 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %222 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  store float 0.000000e+00, float* %221, align 4
  store float 0.000000e+00, float* %222, align 4
  %223 = sext i32 %i.4 to i64
  %224 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %225 = load %struct.quantum_reg_node_struct** %224, align 8
  %226 = getelementptr inbounds %struct.quantum_reg_node_struct* %225, i64 %223
  %227 = getelementptr inbounds %struct.quantum_reg_node_struct* %226, i32 0, i32 1
  %228 = load i64* %227, align 8
  %229 = zext i32 %target to i64
  %230 = shl i64 1, %229
  %231 = xor i64 %228, %230
  %232 = call i32 @quantum_get_state(i64 %231, %struct.quantum_reg_struct* byval align 8 %reg)
  %233 = sext i32 %i.4 to i64
  %234 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %235 = load %struct.quantum_reg_node_struct** %234, align 8
  %236 = getelementptr inbounds %struct.quantum_reg_node_struct* %235, i64 %233
  %237 = getelementptr inbounds %struct.quantum_reg_node_struct* %236, i32 0, i32 0
  %238 = getelementptr inbounds { float, float }* %237, i32 0, i32 0
  %239 = load float* %238, align 4
  %240 = getelementptr inbounds { float, float }* %237, i32 0, i32 1
  %241 = load float* %240, align 4
  %242 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %243 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  store float %239, float* %242, align 4
  store float %241, float* %243, align 4
  %244 = icmp sge i32 %232, 0
  br i1 %244, label %245, label %257

; <label>:245                                     ; preds = %210
  %246 = sext i32 %232 to i64
  %247 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %248 = load %struct.quantum_reg_node_struct** %247, align 8
  %249 = getelementptr inbounds %struct.quantum_reg_node_struct* %248, i64 %246
  %250 = getelementptr inbounds %struct.quantum_reg_node_struct* %249, i32 0, i32 0
  %251 = getelementptr inbounds { float, float }* %250, i32 0, i32 0
  %252 = load float* %251, align 4
  %253 = getelementptr inbounds { float, float }* %250, i32 0, i32 1
  %254 = load float* %253, align 4
  %255 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %256 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  store float %252, float* %255, align 4
  store float %254, float* %256, align 4
  br label %257

; <label>:257                                     ; preds = %245, %210
  %258 = icmp ne i32 %220, 0
  br i1 %258, label %259, label %329

; <label>:259                                     ; preds = %257
  %260 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %261 = load { float, float }** %260, align 8
  %262 = getelementptr inbounds { float, float }* %261, i64 2
  %263 = getelementptr inbounds { float, float }* %262, i32 0, i32 0
  %264 = load float* %263, align 4
  %265 = getelementptr inbounds { float, float }* %262, i32 0, i32 1
  %266 = load float* %265, align 4
  %267 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %268 = load float* %267, align 4
  %269 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %270 = load float* %269, align 4
  %271 = fmul float %264, %268
  %272 = fmul float %266, %270
  %273 = fmul float %264, %270
  %274 = fmul float %266, %268
  %275 = fsub float %271, %272
  %276 = fadd float %273, %274
  %277 = fcmp uno float %275, %275
  br i1 %277, label %278, label %287, !prof !1

; <label>:278                                     ; preds = %259
  %279 = fcmp uno float %276, %276
  br i1 %279, label %280, label %287, !prof !1

; <label>:280                                     ; preds = %278
  %281 = call <2 x float> @__mulsc3(float %264, float %266, float %268, float %270) #4
  %282 = bitcast { float, float }* %1 to <2 x float>*
  store <2 x float> %281, <2 x float>* %282, align 1
  %283 = getelementptr inbounds { float, float }* %1, i32 0, i32 0
  %284 = load float* %283, align 4
  %285 = getelementptr inbounds { float, float }* %1, i32 0, i32 1
  %286 = load float* %285, align 4
  br label %287

; <label>:287                                     ; preds = %280, %278, %259
  %288 = phi float [ %275, %259 ], [ %275, %278 ], [ %284, %280 ]
  %289 = phi float [ %276, %259 ], [ %276, %278 ], [ %286, %280 ]
  %290 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %291 = load { float, float }** %290, align 8
  %292 = getelementptr inbounds { float, float }* %291, i64 3
  %293 = getelementptr inbounds { float, float }* %292, i32 0, i32 0
  %294 = load float* %293, align 4
  %295 = getelementptr inbounds { float, float }* %292, i32 0, i32 1
  %296 = load float* %295, align 4
  %297 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %298 = load float* %297, align 4
  %299 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %300 = load float* %299, align 4
  %301 = fmul float %294, %298
  %302 = fmul float %296, %300
  %303 = fmul float %294, %300
  %304 = fmul float %296, %298
  %305 = fsub float %301, %302
  %306 = fadd float %303, %304
  %307 = fcmp uno float %305, %305
  br i1 %307, label %308, label %317, !prof !1

; <label>:308                                     ; preds = %287
  %309 = fcmp uno float %306, %306
  br i1 %309, label %310, label %317, !prof !1

; <label>:310                                     ; preds = %308
  %311 = call <2 x float> @__mulsc3(float %294, float %296, float %298, float %300) #4
  %312 = bitcast { float, float }* %2 to <2 x float>*
  store <2 x float> %311, <2 x float>* %312, align 1
  %313 = getelementptr inbounds { float, float }* %2, i32 0, i32 0
  %314 = load float* %313, align 4
  %315 = getelementptr inbounds { float, float }* %2, i32 0, i32 1
  %316 = load float* %315, align 4
  br label %317

; <label>:317                                     ; preds = %310, %308, %287
  %318 = phi float [ %305, %287 ], [ %305, %308 ], [ %314, %310 ]
  %319 = phi float [ %306, %287 ], [ %306, %308 ], [ %316, %310 ]
  %320 = fadd float %288, %318
  %321 = fadd float %289, %319
  %322 = sext i32 %i.4 to i64
  %323 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %324 = load %struct.quantum_reg_node_struct** %323, align 8
  %325 = getelementptr inbounds %struct.quantum_reg_node_struct* %324, i64 %322
  %326 = getelementptr inbounds %struct.quantum_reg_node_struct* %325, i32 0, i32 0
  %327 = getelementptr inbounds { float, float }* %326, i32 0, i32 0
  %328 = getelementptr inbounds { float, float }* %326, i32 0, i32 1
  store float %320, float* %327, align 4
  store float %321, float* %328, align 4
  br label %399

; <label>:329                                     ; preds = %257
  %330 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %331 = load { float, float }** %330, align 8
  %332 = getelementptr inbounds { float, float }* %331, i64 0
  %333 = getelementptr inbounds { float, float }* %332, i32 0, i32 0
  %334 = load float* %333, align 4
  %335 = getelementptr inbounds { float, float }* %332, i32 0, i32 1
  %336 = load float* %335, align 4
  %337 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %338 = load float* %337, align 4
  %339 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %340 = load float* %339, align 4
  %341 = fmul float %334, %338
  %342 = fmul float %336, %340
  %343 = fmul float %334, %340
  %344 = fmul float %336, %338
  %345 = fsub float %341, %342
  %346 = fadd float %343, %344
  %347 = fcmp uno float %345, %345
  br i1 %347, label %348, label %357, !prof !1

; <label>:348                                     ; preds = %329
  %349 = fcmp uno float %346, %346
  br i1 %349, label %350, label %357, !prof !1

; <label>:350                                     ; preds = %348
  %351 = call <2 x float> @__mulsc3(float %334, float %336, float %338, float %340) #4
  %352 = bitcast { float, float }* %3 to <2 x float>*
  store <2 x float> %351, <2 x float>* %352, align 1
  %353 = getelementptr inbounds { float, float }* %3, i32 0, i32 0
  %354 = load float* %353, align 4
  %355 = getelementptr inbounds { float, float }* %3, i32 0, i32 1
  %356 = load float* %355, align 4
  br label %357

; <label>:357                                     ; preds = %350, %348, %329
  %358 = phi float [ %345, %329 ], [ %345, %348 ], [ %354, %350 ]
  %359 = phi float [ %346, %329 ], [ %346, %348 ], [ %356, %350 ]
  %360 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %361 = load { float, float }** %360, align 8
  %362 = getelementptr inbounds { float, float }* %361, i64 1
  %363 = getelementptr inbounds { float, float }* %362, i32 0, i32 0
  %364 = load float* %363, align 4
  %365 = getelementptr inbounds { float, float }* %362, i32 0, i32 1
  %366 = load float* %365, align 4
  %367 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %368 = load float* %367, align 4
  %369 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %370 = load float* %369, align 4
  %371 = fmul float %364, %368
  %372 = fmul float %366, %370
  %373 = fmul float %364, %370
  %374 = fmul float %366, %368
  %375 = fsub float %371, %372
  %376 = fadd float %373, %374
  %377 = fcmp uno float %375, %375
  br i1 %377, label %378, label %387, !prof !1

; <label>:378                                     ; preds = %357
  %379 = fcmp uno float %376, %376
  br i1 %379, label %380, label %387, !prof !1

; <label>:380                                     ; preds = %378
  %381 = call <2 x float> @__mulsc3(float %364, float %366, float %368, float %370) #4
  %382 = bitcast { float, float }* %4 to <2 x float>*
  store <2 x float> %381, <2 x float>* %382, align 1
  %383 = getelementptr inbounds { float, float }* %4, i32 0, i32 0
  %384 = load float* %383, align 4
  %385 = getelementptr inbounds { float, float }* %4, i32 0, i32 1
  %386 = load float* %385, align 4
  br label %387

; <label>:387                                     ; preds = %380, %378, %357
  %388 = phi float [ %375, %357 ], [ %375, %378 ], [ %384, %380 ]
  %389 = phi float [ %376, %357 ], [ %376, %378 ], [ %386, %380 ]
  %390 = fadd float %358, %388
  %391 = fadd float %359, %389
  %392 = sext i32 %i.4 to i64
  %393 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %394 = load %struct.quantum_reg_node_struct** %393, align 8
  %395 = getelementptr inbounds %struct.quantum_reg_node_struct* %394, i64 %392
  %396 = getelementptr inbounds %struct.quantum_reg_node_struct* %395, i32 0, i32 0
  %397 = getelementptr inbounds { float, float }* %396, i32 0, i32 0
  %398 = getelementptr inbounds { float, float }* %396, i32 0, i32 1
  store float %390, float* %397, align 4
  store float %391, float* %398, align 4
  br label %399

; <label>:399                                     ; preds = %387, %317
  %400 = icmp sge i32 %232, 0
  br i1 %400, label %401, label %544

; <label>:401                                     ; preds = %399
  %402 = icmp ne i32 %220, 0
  br i1 %402, label %403, label %473

; <label>:403                                     ; preds = %401
  %404 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %405 = load { float, float }** %404, align 8
  %406 = getelementptr inbounds { float, float }* %405, i64 0
  %407 = getelementptr inbounds { float, float }* %406, i32 0, i32 0
  %408 = load float* %407, align 4
  %409 = getelementptr inbounds { float, float }* %406, i32 0, i32 1
  %410 = load float* %409, align 4
  %411 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %412 = load float* %411, align 4
  %413 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %414 = load float* %413, align 4
  %415 = fmul float %408, %412
  %416 = fmul float %410, %414
  %417 = fmul float %408, %414
  %418 = fmul float %410, %412
  %419 = fsub float %415, %416
  %420 = fadd float %417, %418
  %421 = fcmp uno float %419, %419
  br i1 %421, label %422, label %431, !prof !1

; <label>:422                                     ; preds = %403
  %423 = fcmp uno float %420, %420
  br i1 %423, label %424, label %431, !prof !1

; <label>:424                                     ; preds = %422
  %425 = call <2 x float> @__mulsc3(float %408, float %410, float %412, float %414) #4
  %426 = bitcast { float, float }* %5 to <2 x float>*
  store <2 x float> %425, <2 x float>* %426, align 1
  %427 = getelementptr inbounds { float, float }* %5, i32 0, i32 0
  %428 = load float* %427, align 4
  %429 = getelementptr inbounds { float, float }* %5, i32 0, i32 1
  %430 = load float* %429, align 4
  br label %431

; <label>:431                                     ; preds = %424, %422, %403
  %432 = phi float [ %419, %403 ], [ %419, %422 ], [ %428, %424 ]
  %433 = phi float [ %420, %403 ], [ %420, %422 ], [ %430, %424 ]
  %434 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %435 = load { float, float }** %434, align 8
  %436 = getelementptr inbounds { float, float }* %435, i64 1
  %437 = getelementptr inbounds { float, float }* %436, i32 0, i32 0
  %438 = load float* %437, align 4
  %439 = getelementptr inbounds { float, float }* %436, i32 0, i32 1
  %440 = load float* %439, align 4
  %441 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %442 = load float* %441, align 4
  %443 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %444 = load float* %443, align 4
  %445 = fmul float %438, %442
  %446 = fmul float %440, %444
  %447 = fmul float %438, %444
  %448 = fmul float %440, %442
  %449 = fsub float %445, %446
  %450 = fadd float %447, %448
  %451 = fcmp uno float %449, %449
  br i1 %451, label %452, label %461, !prof !1

; <label>:452                                     ; preds = %431
  %453 = fcmp uno float %450, %450
  br i1 %453, label %454, label %461, !prof !1

; <label>:454                                     ; preds = %452
  %455 = call <2 x float> @__mulsc3(float %438, float %440, float %442, float %444) #4
  %456 = bitcast { float, float }* %6 to <2 x float>*
  store <2 x float> %455, <2 x float>* %456, align 1
  %457 = getelementptr inbounds { float, float }* %6, i32 0, i32 0
  %458 = load float* %457, align 4
  %459 = getelementptr inbounds { float, float }* %6, i32 0, i32 1
  %460 = load float* %459, align 4
  br label %461

; <label>:461                                     ; preds = %454, %452, %431
  %462 = phi float [ %449, %431 ], [ %449, %452 ], [ %458, %454 ]
  %463 = phi float [ %450, %431 ], [ %450, %452 ], [ %460, %454 ]
  %464 = fadd float %432, %462
  %465 = fadd float %433, %463
  %466 = sext i32 %232 to i64
  %467 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %468 = load %struct.quantum_reg_node_struct** %467, align 8
  %469 = getelementptr inbounds %struct.quantum_reg_node_struct* %468, i64 %466
  %470 = getelementptr inbounds %struct.quantum_reg_node_struct* %469, i32 0, i32 0
  %471 = getelementptr inbounds { float, float }* %470, i32 0, i32 0
  %472 = getelementptr inbounds { float, float }* %470, i32 0, i32 1
  store float %464, float* %471, align 4
  store float %465, float* %472, align 4
  br label %543

; <label>:473                                     ; preds = %401
  %474 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %475 = load { float, float }** %474, align 8
  %476 = getelementptr inbounds { float, float }* %475, i64 2
  %477 = getelementptr inbounds { float, float }* %476, i32 0, i32 0
  %478 = load float* %477, align 4
  %479 = getelementptr inbounds { float, float }* %476, i32 0, i32 1
  %480 = load float* %479, align 4
  %481 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %482 = load float* %481, align 4
  %483 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %484 = load float* %483, align 4
  %485 = fmul float %478, %482
  %486 = fmul float %480, %484
  %487 = fmul float %478, %484
  %488 = fmul float %480, %482
  %489 = fsub float %485, %486
  %490 = fadd float %487, %488
  %491 = fcmp uno float %489, %489
  br i1 %491, label %492, label %501, !prof !1

; <label>:492                                     ; preds = %473
  %493 = fcmp uno float %490, %490
  br i1 %493, label %494, label %501, !prof !1

; <label>:494                                     ; preds = %492
  %495 = call <2 x float> @__mulsc3(float %478, float %480, float %482, float %484) #4
  %496 = bitcast { float, float }* %7 to <2 x float>*
  store <2 x float> %495, <2 x float>* %496, align 1
  %497 = getelementptr inbounds { float, float }* %7, i32 0, i32 0
  %498 = load float* %497, align 4
  %499 = getelementptr inbounds { float, float }* %7, i32 0, i32 1
  %500 = load float* %499, align 4
  br label %501

; <label>:501                                     ; preds = %494, %492, %473
  %502 = phi float [ %489, %473 ], [ %489, %492 ], [ %498, %494 ]
  %503 = phi float [ %490, %473 ], [ %490, %492 ], [ %500, %494 ]
  %504 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %505 = load { float, float }** %504, align 8
  %506 = getelementptr inbounds { float, float }* %505, i64 3
  %507 = getelementptr inbounds { float, float }* %506, i32 0, i32 0
  %508 = load float* %507, align 4
  %509 = getelementptr inbounds { float, float }* %506, i32 0, i32 1
  %510 = load float* %509, align 4
  %511 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %512 = load float* %511, align 4
  %513 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %514 = load float* %513, align 4
  %515 = fmul float %508, %512
  %516 = fmul float %510, %514
  %517 = fmul float %508, %514
  %518 = fmul float %510, %512
  %519 = fsub float %515, %516
  %520 = fadd float %517, %518
  %521 = fcmp uno float %519, %519
  br i1 %521, label %522, label %531, !prof !1

; <label>:522                                     ; preds = %501
  %523 = fcmp uno float %520, %520
  br i1 %523, label %524, label %531, !prof !1

; <label>:524                                     ; preds = %522
  %525 = call <2 x float> @__mulsc3(float %508, float %510, float %512, float %514) #4
  %526 = bitcast { float, float }* %8 to <2 x float>*
  store <2 x float> %525, <2 x float>* %526, align 1
  %527 = getelementptr inbounds { float, float }* %8, i32 0, i32 0
  %528 = load float* %527, align 4
  %529 = getelementptr inbounds { float, float }* %8, i32 0, i32 1
  %530 = load float* %529, align 4
  br label %531

; <label>:531                                     ; preds = %524, %522, %501
  %532 = phi float [ %519, %501 ], [ %519, %522 ], [ %528, %524 ]
  %533 = phi float [ %520, %501 ], [ %520, %522 ], [ %530, %524 ]
  %534 = fadd float %502, %532
  %535 = fadd float %503, %533
  %536 = sext i32 %232 to i64
  %537 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %538 = load %struct.quantum_reg_node_struct** %537, align 8
  %539 = getelementptr inbounds %struct.quantum_reg_node_struct* %538, i64 %536
  %540 = getelementptr inbounds %struct.quantum_reg_node_struct* %539, i32 0, i32 0
  %541 = getelementptr inbounds { float, float }* %540, i32 0, i32 0
  %542 = getelementptr inbounds { float, float }* %540, i32 0, i32 1
  store float %534, float* %541, align 4
  store float %535, float* %542, align 4
  br label %543

; <label>:543                                     ; preds = %531, %461
  br label %666

; <label>:544                                     ; preds = %399
  %545 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %546 = load { float, float }** %545, align 8
  %547 = getelementptr inbounds { float, float }* %546, i64 1
  %548 = getelementptr inbounds { float, float }* %547, i32 0, i32 0
  %549 = load float* %548, align 4
  %550 = getelementptr inbounds { float, float }* %547, i32 0, i32 1
  %551 = load float* %550, align 4
  %552 = fcmp oeq float %549, 0.000000e+00
  %553 = fcmp oeq float %551, 0.000000e+00
  %554 = and i1 %552, %553
  br i1 %554, label %555, label %558

; <label>:555                                     ; preds = %544
  %556 = icmp ne i32 %220, 0
  br i1 %556, label %557, label %558

; <label>:557                                     ; preds = %555
  br label %675

; <label>:558                                     ; preds = %555, %544
  %559 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %560 = load { float, float }** %559, align 8
  %561 = getelementptr inbounds { float, float }* %560, i64 2
  %562 = getelementptr inbounds { float, float }* %561, i32 0, i32 0
  %563 = load float* %562, align 4
  %564 = getelementptr inbounds { float, float }* %561, i32 0, i32 1
  %565 = load float* %564, align 4
  %566 = fcmp oeq float %563, 0.000000e+00
  %567 = fcmp oeq float %565, 0.000000e+00
  %568 = and i1 %566, %567
  br i1 %568, label %569, label %572

; <label>:569                                     ; preds = %558
  %570 = icmp ne i32 %220, 0
  br i1 %570, label %572, label %571

; <label>:571                                     ; preds = %569
  br label %675

; <label>:572                                     ; preds = %569, %558
  %573 = sext i32 %i.4 to i64
  %574 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %575 = load %struct.quantum_reg_node_struct** %574, align 8
  %576 = getelementptr inbounds %struct.quantum_reg_node_struct* %575, i64 %573
  %577 = getelementptr inbounds %struct.quantum_reg_node_struct* %576, i32 0, i32 1
  %578 = load i64* %577, align 8
  %579 = zext i32 %target to i64
  %580 = shl i64 1, %579
  %581 = xor i64 %578, %580
  %582 = sext i32 %k.0 to i64
  %583 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %584 = load %struct.quantum_reg_node_struct** %583, align 8
  %585 = getelementptr inbounds %struct.quantum_reg_node_struct* %584, i64 %582
  %586 = getelementptr inbounds %struct.quantum_reg_node_struct* %585, i32 0, i32 1
  store i64 %581, i64* %586, align 8
  %587 = icmp ne i32 %220, 0
  br i1 %587, label %588, label %626

; <label>:588                                     ; preds = %572
  %589 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %590 = load { float, float }** %589, align 8
  %591 = getelementptr inbounds { float, float }* %590, i64 1
  %592 = getelementptr inbounds { float, float }* %591, i32 0, i32 0
  %593 = load float* %592, align 4
  %594 = getelementptr inbounds { float, float }* %591, i32 0, i32 1
  %595 = load float* %594, align 4
  %596 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %597 = load float* %596, align 4
  %598 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %599 = load float* %598, align 4
  %600 = fmul float %593, %597
  %601 = fmul float %595, %599
  %602 = fmul float %593, %599
  %603 = fmul float %595, %597
  %604 = fsub float %600, %601
  %605 = fadd float %602, %603
  %606 = fcmp uno float %604, %604
  br i1 %606, label %607, label %616, !prof !1

; <label>:607                                     ; preds = %588
  %608 = fcmp uno float %605, %605
  br i1 %608, label %609, label %616, !prof !1

; <label>:609                                     ; preds = %607
  %610 = call <2 x float> @__mulsc3(float %593, float %595, float %597, float %599) #4
  %611 = bitcast { float, float }* %9 to <2 x float>*
  store <2 x float> %610, <2 x float>* %611, align 1
  %612 = getelementptr inbounds { float, float }* %9, i32 0, i32 0
  %613 = load float* %612, align 4
  %614 = getelementptr inbounds { float, float }* %9, i32 0, i32 1
  %615 = load float* %614, align 4
  br label %616

; <label>:616                                     ; preds = %609, %607, %588
  %617 = phi float [ %604, %588 ], [ %604, %607 ], [ %613, %609 ]
  %618 = phi float [ %605, %588 ], [ %605, %607 ], [ %615, %609 ]
  %619 = sext i32 %k.0 to i64
  %620 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %621 = load %struct.quantum_reg_node_struct** %620, align 8
  %622 = getelementptr inbounds %struct.quantum_reg_node_struct* %621, i64 %619
  %623 = getelementptr inbounds %struct.quantum_reg_node_struct* %622, i32 0, i32 0
  %624 = getelementptr inbounds { float, float }* %623, i32 0, i32 0
  %625 = getelementptr inbounds { float, float }* %623, i32 0, i32 1
  store float %617, float* %624, align 4
  store float %618, float* %625, align 4
  br label %664

; <label>:626                                     ; preds = %572
  %627 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %628 = load { float, float }** %627, align 8
  %629 = getelementptr inbounds { float, float }* %628, i64 2
  %630 = getelementptr inbounds { float, float }* %629, i32 0, i32 0
  %631 = load float* %630, align 4
  %632 = getelementptr inbounds { float, float }* %629, i32 0, i32 1
  %633 = load float* %632, align 4
  %634 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %635 = load float* %634, align 4
  %636 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %637 = load float* %636, align 4
  %638 = fmul float %631, %635
  %639 = fmul float %633, %637
  %640 = fmul float %631, %637
  %641 = fmul float %633, %635
  %642 = fsub float %638, %639
  %643 = fadd float %640, %641
  %644 = fcmp uno float %642, %642
  br i1 %644, label %645, label %654, !prof !1

; <label>:645                                     ; preds = %626
  %646 = fcmp uno float %643, %643
  br i1 %646, label %647, label %654, !prof !1

; <label>:647                                     ; preds = %645
  %648 = call <2 x float> @__mulsc3(float %631, float %633, float %635, float %637) #4
  %649 = bitcast { float, float }* %10 to <2 x float>*
  store <2 x float> %648, <2 x float>* %649, align 1
  %650 = getelementptr inbounds { float, float }* %10, i32 0, i32 0
  %651 = load float* %650, align 4
  %652 = getelementptr inbounds { float, float }* %10, i32 0, i32 1
  %653 = load float* %652, align 4
  br label %654

; <label>:654                                     ; preds = %647, %645, %626
  %655 = phi float [ %642, %626 ], [ %642, %645 ], [ %651, %647 ]
  %656 = phi float [ %643, %626 ], [ %643, %645 ], [ %653, %647 ]
  %657 = sext i32 %k.0 to i64
  %658 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %659 = load %struct.quantum_reg_node_struct** %658, align 8
  %660 = getelementptr inbounds %struct.quantum_reg_node_struct* %659, i64 %657
  %661 = getelementptr inbounds %struct.quantum_reg_node_struct* %660, i32 0, i32 0
  %662 = getelementptr inbounds { float, float }* %661, i32 0, i32 0
  %663 = getelementptr inbounds { float, float }* %661, i32 0, i32 1
  store float %655, float* %662, align 4
  store float %656, float* %663, align 4
  br label %664

; <label>:664                                     ; preds = %654, %616
  %665 = add nsw i32 %k.0, 1
  br label %666

; <label>:666                                     ; preds = %664, %543
  %k.1 = phi i32 [ %k.0, %543 ], [ %665, %664 ]
  %667 = icmp sge i32 %232, 0
  br i1 %667, label %668, label %671

; <label>:668                                     ; preds = %666
  %669 = sext i32 %232 to i64
  %670 = getelementptr inbounds i8* %174, i64 %669
  store i8 1, i8* %670, align 1
  br label %671

; <label>:671                                     ; preds = %668, %666
  br label %672

; <label>:672                                     ; preds = %671, %205
  %k.2 = phi i32 [ %k.0, %205 ], [ %k.1, %671 ]
  br label %673

; <label>:673                                     ; preds = %672
  %674 = add nsw i32 %i.4, 1
  br label %201

; <label>:675                                     ; preds = %571, %557, %201
  %676 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %677 = load i32* %676, align 4
  %678 = add nsw i32 %677, %addsize.0
  store i32 %678, i32* %676, align 4
  call void @free(i8* %174) #4
  %679 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %680 = load i32* %679, align 4
  %681 = sub nsw i32 0, %680
  %682 = sext i32 %681 to i64
  %683 = mul i64 %682, 1
  %684 = call i64 @quantum_memman(i64 %683)
  br label %685

; <label>:685                                     ; preds = %742, %675
  %j.0 = phi i32 [ 0, %675 ], [ %j.1, %742 ]
  %i.5 = phi i32 [ 0, %675 ], [ %743, %742 ]
  %decsize.0 = phi i32 [ 0, %675 ], [ %decsize.1, %742 ]
  %686 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %687 = load i32* %686, align 4
  %688 = icmp slt i32 %i.5, %687
  br i1 %688, label %689, label %744

; <label>:689                                     ; preds = %685
  %690 = sext i32 %i.5 to i64
  %691 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %692 = load %struct.quantum_reg_node_struct** %691, align 8
  %693 = getelementptr inbounds %struct.quantum_reg_node_struct* %692, i64 %690
  %694 = getelementptr inbounds %struct.quantum_reg_node_struct* %693, i32 0, i32 0
  %695 = getelementptr inbounds { float, float }* %694, i32 0, i32 0
  %696 = load float* %695, align 4
  %697 = getelementptr inbounds { float, float }* %694, i32 0, i32 1
  %698 = load float* %697, align 4
  %699 = getelementptr inbounds { float, float }* %11, i32 0, i32 0
  %700 = getelementptr inbounds { float, float }* %11, i32 0, i32 1
  store float %696, float* %699, align 4
  store float %698, float* %700, align 4
  %701 = bitcast { float, float }* %11 to <2 x float>*
  %702 = load <2 x float>* %701, align 1
  %703 = call float @quantum_prob_inline(<2 x float> %702)
  %704 = fcmp olt float %703, %200
  br i1 %704, label %705, label %708

; <label>:705                                     ; preds = %689
  %706 = add nsw i32 %j.0, 1
  %707 = add nsw i32 %decsize.0, 1
  br label %741

; <label>:708                                     ; preds = %689
  %709 = icmp ne i32 %j.0, 0
  br i1 %709, label %710, label %740

; <label>:710                                     ; preds = %708
  %711 = sext i32 %i.5 to i64
  %712 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %713 = load %struct.quantum_reg_node_struct** %712, align 8
  %714 = getelementptr inbounds %struct.quantum_reg_node_struct* %713, i64 %711
  %715 = getelementptr inbounds %struct.quantum_reg_node_struct* %714, i32 0, i32 1
  %716 = load i64* %715, align 8
  %717 = sub nsw i32 %i.5, %j.0
  %718 = sext i32 %717 to i64
  %719 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %720 = load %struct.quantum_reg_node_struct** %719, align 8
  %721 = getelementptr inbounds %struct.quantum_reg_node_struct* %720, i64 %718
  %722 = getelementptr inbounds %struct.quantum_reg_node_struct* %721, i32 0, i32 1
  store i64 %716, i64* %722, align 8
  %723 = sext i32 %i.5 to i64
  %724 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %725 = load %struct.quantum_reg_node_struct** %724, align 8
  %726 = getelementptr inbounds %struct.quantum_reg_node_struct* %725, i64 %723
  %727 = getelementptr inbounds %struct.quantum_reg_node_struct* %726, i32 0, i32 0
  %728 = getelementptr inbounds { float, float }* %727, i32 0, i32 0
  %729 = load float* %728, align 4
  %730 = getelementptr inbounds { float, float }* %727, i32 0, i32 1
  %731 = load float* %730, align 4
  %732 = sub nsw i32 %i.5, %j.0
  %733 = sext i32 %732 to i64
  %734 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %735 = load %struct.quantum_reg_node_struct** %734, align 8
  %736 = getelementptr inbounds %struct.quantum_reg_node_struct* %735, i64 %733
  %737 = getelementptr inbounds %struct.quantum_reg_node_struct* %736, i32 0, i32 0
  %738 = getelementptr inbounds { float, float }* %737, i32 0, i32 0
  %739 = getelementptr inbounds { float, float }* %737, i32 0, i32 1
  store float %729, float* %738, align 4
  store float %731, float* %739, align 4
  br label %740

; <label>:740                                     ; preds = %710, %708
  br label %741

; <label>:741                                     ; preds = %740, %705
  %j.1 = phi i32 [ %706, %705 ], [ %j.0, %740 ]
  %decsize.1 = phi i32 [ %707, %705 ], [ %decsize.0, %740 ]
  br label %742

; <label>:742                                     ; preds = %741
  %743 = add nsw i32 %i.5, 1
  br label %685

; <label>:744                                     ; preds = %685
  %745 = icmp ne i32 %decsize.0, 0
  br i1 %745, label %746, label %773

; <label>:746                                     ; preds = %744
  %747 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %748 = load i32* %747, align 4
  %749 = sub nsw i32 %748, %decsize.0
  store i32 %749, i32* %747, align 4
  %750 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %751 = load %struct.quantum_reg_node_struct** %750, align 8
  %752 = bitcast %struct.quantum_reg_node_struct* %751 to i8*
  %753 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %754 = load i32* %753, align 4
  %755 = sext i32 %754 to i64
  %756 = mul i64 %755, 16
  %757 = call i8* @realloc(i8* %752, i64 %756) #4
  %758 = bitcast i8* %757 to %struct.quantum_reg_node_struct*
  %759 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  store %struct.quantum_reg_node_struct* %758, %struct.quantum_reg_node_struct** %759, align 8
  %760 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %761 = load %struct.quantum_reg_node_struct** %760, align 8
  %762 = icmp ne %struct.quantum_reg_node_struct* %761, null
  br i1 %762, label %768, label %763

; <label>:763                                     ; preds = %746
  %764 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %765 = load i32* %764, align 4
  %766 = add nsw i32 %765, %addsize.0
  %767 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i32 0, i32 0), i32 %766)
  call void @exit(i32 1) #6
  unreachable

; <label>:768                                     ; preds = %746
  %769 = sub nsw i32 0, %decsize.0
  %770 = sext i32 %769 to i64
  %771 = mul i64 %770, 16
  %772 = call i64 @quantum_memman(i64 %771)
  br label %773

; <label>:773                                     ; preds = %768, %744
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_hadamard(i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %m = alloca %struct.quantum_matrix_struct, align 8
  %1 = alloca %struct.quantum_matrix_struct, align 8
  %2 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 6, i32 %target)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %48

; <label>:5                                       ; preds = %0
  %6 = call { i64, { float, float }* } @quantum_new_matrix(i32 2, i32 2)
  %7 = bitcast %struct.quantum_matrix_struct* %1 to { i64, { float, float }* }*
  %8 = getelementptr { i64, { float, float }* }* %7, i32 0, i32 0
  %9 = extractvalue { i64, { float, float }* } %6, 0
  store i64 %9, i64* %8, align 1
  %10 = getelementptr { i64, { float, float }* }* %7, i32 0, i32 1
  %11 = extractvalue { i64, { float, float }* } %6, 1
  store { float, float }* %11, { float, float }** %10, align 1
  %12 = bitcast %struct.quantum_matrix_struct* %m to i8*
  %13 = bitcast %struct.quantum_matrix_struct* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 16, i32 8, i1 false)
  %14 = call double @sqrt(double 5.000000e-01) #4
  %15 = fptrunc double %14 to float
  %16 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %17 = load { float, float }** %16, align 8
  %18 = getelementptr inbounds { float, float }* %17, i64 0
  %19 = getelementptr inbounds { float, float }* %18, i32 0, i32 0
  %20 = getelementptr inbounds { float, float }* %18, i32 0, i32 1
  store float %15, float* %19, align 4
  store float 0.000000e+00, float* %20, align 4
  %21 = call double @sqrt(double 5.000000e-01) #4
  %22 = fptrunc double %21 to float
  %23 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %24 = load { float, float }** %23, align 8
  %25 = getelementptr inbounds { float, float }* %24, i64 1
  %26 = getelementptr inbounds { float, float }* %25, i32 0, i32 0
  %27 = getelementptr inbounds { float, float }* %25, i32 0, i32 1
  store float %22, float* %26, align 4
  store float 0.000000e+00, float* %27, align 4
  %28 = call double @sqrt(double 5.000000e-01) #4
  %29 = fptrunc double %28 to float
  %30 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %31 = load { float, float }** %30, align 8
  %32 = getelementptr inbounds { float, float }* %31, i64 2
  %33 = getelementptr inbounds { float, float }* %32, i32 0, i32 0
  %34 = getelementptr inbounds { float, float }* %32, i32 0, i32 1
  store float %29, float* %33, align 4
  store float 0.000000e+00, float* %34, align 4
  %35 = call double @sqrt(double 5.000000e-01) #4
  %36 = fsub double -0.000000e+00, %35
  %37 = fptrunc double %36 to float
  %38 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %39 = load { float, float }** %38, align 8
  %40 = getelementptr inbounds { float, float }* %39, i64 3
  %41 = getelementptr inbounds { float, float }* %40, i32 0, i32 0
  %42 = getelementptr inbounds { float, float }* %40, i32 0, i32 1
  store float %37, float* %41, align 4
  store float 0.000000e+00, float* %42, align 4
  %43 = bitcast %struct.quantum_matrix_struct* %m to { i64, { float, float }* }*
  %44 = getelementptr { i64, { float, float }* }* %43, i32 0, i32 0
  %45 = load i64* %44, align 1
  %46 = getelementptr { i64, { float, float }* }* %43, i32 0, i32 1
  %47 = load { float, float }** %46, align 1
  call void @quantum_gate1(i32 %target, i64 %45, { float, float }* %47, %struct.quantum_reg_struct* %reg)
  call void @quantum_delete_matrix(%struct.quantum_matrix_struct* %m)
  br label %48

; <label>:48                                      ; preds = %5, %4
  ret void
}

declare { i64, { float, float }* } @quantum_new_matrix(i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind
declare double @sqrt(double) #2

declare void @quantum_delete_matrix(%struct.quantum_matrix_struct*) #1

; Function Attrs: nounwind uwtable
define void @quantum_walsh(i32 %width, %struct.quantum_reg_struct* %reg) #0 {
  br label %1

; <label>:1                                       ; preds = %4, %0
  %i.0 = phi i32 [ 0, %0 ], [ %5, %4 ]
  %2 = icmp slt i32 %i.0, %width
  br i1 %2, label %3, label %6

; <label>:3                                       ; preds = %1
  call void @quantum_hadamard(i32 %i.0, %struct.quantum_reg_struct* %reg)
  br label %4

; <label>:4                                       ; preds = %3
  %5 = add nsw i32 %i.0, 1
  br label %1

; <label>:6                                       ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_r_x(i32 %target, float %gamma, %struct.quantum_reg_struct* %reg) #0 {
  %m = alloca %struct.quantum_matrix_struct, align 8
  %1 = alloca %struct.quantum_matrix_struct, align 8
  %2 = fpext float %gamma to double
  %3 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 7, i32 %target, double %2)
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %62

; <label>:6                                       ; preds = %0
  %7 = call { i64, { float, float }* } @quantum_new_matrix(i32 2, i32 2)
  %8 = bitcast %struct.quantum_matrix_struct* %1 to { i64, { float, float }* }*
  %9 = getelementptr { i64, { float, float }* }* %8, i32 0, i32 0
  %10 = extractvalue { i64, { float, float }* } %7, 0
  store i64 %10, i64* %9, align 1
  %11 = getelementptr { i64, { float, float }* }* %8, i32 0, i32 1
  %12 = extractvalue { i64, { float, float }* } %7, 1
  store { float, float }* %12, { float, float }** %11, align 1
  %13 = bitcast %struct.quantum_matrix_struct* %m to i8*
  %14 = bitcast %struct.quantum_matrix_struct* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 16, i32 8, i1 false)
  %15 = fdiv float %gamma, 2.000000e+00
  %16 = fpext float %15 to double
  %17 = call double @cos(double %16) #4
  %18 = fptrunc double %17 to float
  %19 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %20 = load { float, float }** %19, align 8
  %21 = getelementptr inbounds { float, float }* %20, i64 0
  %22 = getelementptr inbounds { float, float }* %21, i32 0, i32 0
  %23 = getelementptr inbounds { float, float }* %21, i32 0, i32 1
  store float %18, float* %22, align 4
  store float 0.000000e+00, float* %23, align 4
  %24 = fdiv float %gamma, 2.000000e+00
  %25 = fpext float %24 to double
  %26 = call double @sin(double %25) #4
  %27 = fmul double -0.000000e+00, %26
  %28 = fmul double -1.000000e+00, %26
  %29 = fptrunc double %27 to float
  %30 = fptrunc double %28 to float
  %31 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %32 = load { float, float }** %31, align 8
  %33 = getelementptr inbounds { float, float }* %32, i64 1
  %34 = getelementptr inbounds { float, float }* %33, i32 0, i32 0
  %35 = getelementptr inbounds { float, float }* %33, i32 0, i32 1
  store float %29, float* %34, align 4
  store float %30, float* %35, align 4
  %36 = fdiv float %gamma, 2.000000e+00
  %37 = fpext float %36 to double
  %38 = call double @sin(double %37) #4
  %39 = fmul double -0.000000e+00, %38
  %40 = fmul double -1.000000e+00, %38
  %41 = fptrunc double %39 to float
  %42 = fptrunc double %40 to float
  %43 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %44 = load { float, float }** %43, align 8
  %45 = getelementptr inbounds { float, float }* %44, i64 2
  %46 = getelementptr inbounds { float, float }* %45, i32 0, i32 0
  %47 = getelementptr inbounds { float, float }* %45, i32 0, i32 1
  store float %41, float* %46, align 4
  store float %42, float* %47, align 4
  %48 = fdiv float %gamma, 2.000000e+00
  %49 = fpext float %48 to double
  %50 = call double @cos(double %49) #4
  %51 = fptrunc double %50 to float
  %52 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %53 = load { float, float }** %52, align 8
  %54 = getelementptr inbounds { float, float }* %53, i64 3
  %55 = getelementptr inbounds { float, float }* %54, i32 0, i32 0
  %56 = getelementptr inbounds { float, float }* %54, i32 0, i32 1
  store float %51, float* %55, align 4
  store float 0.000000e+00, float* %56, align 4
  %57 = bitcast %struct.quantum_matrix_struct* %m to { i64, { float, float }* }*
  %58 = getelementptr { i64, { float, float }* }* %57, i32 0, i32 0
  %59 = load i64* %58, align 1
  %60 = getelementptr { i64, { float, float }* }* %57, i32 0, i32 1
  %61 = load { float, float }** %60, align 1
  call void @quantum_gate1(i32 %target, i64 %59, { float, float }* %61, %struct.quantum_reg_struct* %reg)
  call void @quantum_delete_matrix(%struct.quantum_matrix_struct* %m)
  br label %62

; <label>:62                                      ; preds = %6, %5
  ret void
}

; Function Attrs: nounwind
declare double @cos(double) #2

; Function Attrs: nounwind
declare double @sin(double) #2

; Function Attrs: nounwind uwtable
define void @quantum_r_y(i32 %target, float %gamma, %struct.quantum_reg_struct* %reg) #0 {
  %m = alloca %struct.quantum_matrix_struct, align 8
  %1 = alloca %struct.quantum_matrix_struct, align 8
  %2 = fpext float %gamma to double
  %3 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 8, i32 %target, double %2)
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %57

; <label>:6                                       ; preds = %0
  %7 = call { i64, { float, float }* } @quantum_new_matrix(i32 2, i32 2)
  %8 = bitcast %struct.quantum_matrix_struct* %1 to { i64, { float, float }* }*
  %9 = getelementptr { i64, { float, float }* }* %8, i32 0, i32 0
  %10 = extractvalue { i64, { float, float }* } %7, 0
  store i64 %10, i64* %9, align 1
  %11 = getelementptr { i64, { float, float }* }* %8, i32 0, i32 1
  %12 = extractvalue { i64, { float, float }* } %7, 1
  store { float, float }* %12, { float, float }** %11, align 1
  %13 = bitcast %struct.quantum_matrix_struct* %m to i8*
  %14 = bitcast %struct.quantum_matrix_struct* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 16, i32 8, i1 false)
  %15 = fdiv float %gamma, 2.000000e+00
  %16 = fpext float %15 to double
  %17 = call double @cos(double %16) #4
  %18 = fptrunc double %17 to float
  %19 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %20 = load { float, float }** %19, align 8
  %21 = getelementptr inbounds { float, float }* %20, i64 0
  %22 = getelementptr inbounds { float, float }* %21, i32 0, i32 0
  %23 = getelementptr inbounds { float, float }* %21, i32 0, i32 1
  store float %18, float* %22, align 4
  store float 0.000000e+00, float* %23, align 4
  %24 = fdiv float %gamma, 2.000000e+00
  %25 = fpext float %24 to double
  %26 = call double @sin(double %25) #4
  %27 = fsub double -0.000000e+00, %26
  %28 = fptrunc double %27 to float
  %29 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %30 = load { float, float }** %29, align 8
  %31 = getelementptr inbounds { float, float }* %30, i64 1
  %32 = getelementptr inbounds { float, float }* %31, i32 0, i32 0
  %33 = getelementptr inbounds { float, float }* %31, i32 0, i32 1
  store float %28, float* %32, align 4
  store float 0.000000e+00, float* %33, align 4
  %34 = fdiv float %gamma, 2.000000e+00
  %35 = fpext float %34 to double
  %36 = call double @sin(double %35) #4
  %37 = fptrunc double %36 to float
  %38 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %39 = load { float, float }** %38, align 8
  %40 = getelementptr inbounds { float, float }* %39, i64 2
  %41 = getelementptr inbounds { float, float }* %40, i32 0, i32 0
  %42 = getelementptr inbounds { float, float }* %40, i32 0, i32 1
  store float %37, float* %41, align 4
  store float 0.000000e+00, float* %42, align 4
  %43 = fdiv float %gamma, 2.000000e+00
  %44 = fpext float %43 to double
  %45 = call double @cos(double %44) #4
  %46 = fptrunc double %45 to float
  %47 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %48 = load { float, float }** %47, align 8
  %49 = getelementptr inbounds { float, float }* %48, i64 3
  %50 = getelementptr inbounds { float, float }* %49, i32 0, i32 0
  %51 = getelementptr inbounds { float, float }* %49, i32 0, i32 1
  store float %46, float* %50, align 4
  store float 0.000000e+00, float* %51, align 4
  %52 = bitcast %struct.quantum_matrix_struct* %m to { i64, { float, float }* }*
  %53 = getelementptr { i64, { float, float }* }* %52, i32 0, i32 0
  %54 = load i64* %53, align 1
  %55 = getelementptr { i64, { float, float }* }* %52, i32 0, i32 1
  %56 = load { float, float }** %55, align 1
  call void @quantum_gate1(i32 %target, i64 %54, { float, float }* %56, %struct.quantum_reg_struct* %reg)
  call void @quantum_delete_matrix(%struct.quantum_matrix_struct* %m)
  br label %57

; <label>:57                                      ; preds = %6, %5
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_r_z(i32 %target, float %gamma, %struct.quantum_reg_struct* %reg) #0 {
  %z = alloca { float, float }, align 4
  %1 = alloca { float, float }, align 4
  %2 = alloca { float, float }, align 4
  %3 = alloca { float, float }, align 4
  %4 = fpext float %gamma to double
  %5 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 9, i32 %target, double %4)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %94

; <label>:8                                       ; preds = %0
  %9 = fdiv float %gamma, 2.000000e+00
  %10 = call <2 x float> @quantum_cexp(float %9)
  %11 = bitcast { float, float }* %1 to <2 x float>*
  store <2 x float> %10, <2 x float>* %11, align 1
  %12 = getelementptr inbounds { float, float }* %1, i32 0, i32 0
  %13 = load float* %12, align 4
  %14 = getelementptr inbounds { float, float }* %1, i32 0, i32 1
  %15 = load float* %14, align 4
  %16 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %17 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  store float %13, float* %16, align 4
  store float %15, float* %17, align 4
  br label %18

; <label>:18                                      ; preds = %91, %8
  %i.0 = phi i32 [ 0, %8 ], [ %92, %91 ]
  %19 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %20 = load i32* %19, align 4
  %21 = icmp slt i32 %i.0, %20
  br i1 %21, label %22, label %93

; <label>:22                                      ; preds = %18
  %23 = sext i32 %i.0 to i64
  %24 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %25 = load %struct.quantum_reg_node_struct** %24, align 8
  %26 = getelementptr inbounds %struct.quantum_reg_node_struct* %25, i64 %23
  %27 = getelementptr inbounds %struct.quantum_reg_node_struct* %26, i32 0, i32 1
  %28 = load i64* %27, align 8
  %29 = zext i32 %target to i64
  %30 = shl i64 1, %29
  %31 = and i64 %28, %30
  %32 = icmp ne i64 %31, 0
  br i1 %32, label %33, label %68

; <label>:33                                      ; preds = %22
  %34 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %35 = load float* %34, align 4
  %36 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %37 = load float* %36, align 4
  %38 = sext i32 %i.0 to i64
  %39 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %40 = load %struct.quantum_reg_node_struct** %39, align 8
  %41 = getelementptr inbounds %struct.quantum_reg_node_struct* %40, i64 %38
  %42 = getelementptr inbounds %struct.quantum_reg_node_struct* %41, i32 0, i32 0
  %43 = getelementptr inbounds { float, float }* %42, i32 0, i32 0
  %44 = load float* %43, align 4
  %45 = getelementptr inbounds { float, float }* %42, i32 0, i32 1
  %46 = load float* %45, align 4
  %47 = fmul float %44, %35
  %48 = fmul float %46, %37
  %49 = fmul float %44, %37
  %50 = fmul float %46, %35
  %51 = fsub float %47, %48
  %52 = fadd float %49, %50
  %53 = fcmp uno float %51, %51
  br i1 %53, label %54, label %63, !prof !1

; <label>:54                                      ; preds = %33
  %55 = fcmp uno float %52, %52
  br i1 %55, label %56, label %63, !prof !1

; <label>:56                                      ; preds = %54
  %57 = call <2 x float> @__mulsc3(float %44, float %46, float %35, float %37) #4
  %58 = bitcast { float, float }* %2 to <2 x float>*
  store <2 x float> %57, <2 x float>* %58, align 1
  %59 = getelementptr inbounds { float, float }* %2, i32 0, i32 0
  %60 = load float* %59, align 4
  %61 = getelementptr inbounds { float, float }* %2, i32 0, i32 1
  %62 = load float* %61, align 4
  br label %63

; <label>:63                                      ; preds = %56, %54, %33
  %64 = phi float [ %51, %33 ], [ %51, %54 ], [ %60, %56 ]
  %65 = phi float [ %52, %33 ], [ %52, %54 ], [ %62, %56 ]
  %66 = getelementptr inbounds { float, float }* %42, i32 0, i32 0
  %67 = getelementptr inbounds { float, float }* %42, i32 0, i32 1
  store float %64, float* %66, align 4
  store float %65, float* %67, align 4
  br label %90

; <label>:68                                      ; preds = %22
  %69 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %70 = load float* %69, align 4
  %71 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %72 = load float* %71, align 4
  %73 = sext i32 %i.0 to i64
  %74 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %75 = load %struct.quantum_reg_node_struct** %74, align 8
  %76 = getelementptr inbounds %struct.quantum_reg_node_struct* %75, i64 %73
  %77 = getelementptr inbounds %struct.quantum_reg_node_struct* %76, i32 0, i32 0
  %78 = getelementptr inbounds { float, float }* %77, i32 0, i32 0
  %79 = load float* %78, align 4
  %80 = getelementptr inbounds { float, float }* %77, i32 0, i32 1
  %81 = load float* %80, align 4
  %82 = call <2 x float> @__divsc3(float %79, float %81, float %70, float %72) #4
  %83 = bitcast { float, float }* %3 to <2 x float>*
  store <2 x float> %82, <2 x float>* %83, align 1
  %84 = getelementptr inbounds { float, float }* %3, i32 0, i32 0
  %85 = load float* %84, align 4
  %86 = getelementptr inbounds { float, float }* %3, i32 0, i32 1
  %87 = load float* %86, align 4
  %88 = getelementptr inbounds { float, float }* %77, i32 0, i32 0
  %89 = getelementptr inbounds { float, float }* %77, i32 0, i32 1
  store float %85, float* %88, align 4
  store float %87, float* %89, align 4
  br label %90

; <label>:90                                      ; preds = %68, %63
  br label %91

; <label>:91                                      ; preds = %90
  %92 = add nsw i32 %i.0, 1
  br label %18

; <label>:93                                      ; preds = %18
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  br label %94

; <label>:94                                      ; preds = %93, %7
  ret void
}

declare <2 x float> @quantum_cexp(float) #1

declare <2 x float> @__divsc3(float, float, float, float)

; Function Attrs: nounwind uwtable
define void @quantum_phase_scale(i32 %target, float %gamma, %struct.quantum_reg_struct* %reg) #0 {
  %z = alloca { float, float }, align 4
  %1 = alloca { float, float }, align 4
  %2 = alloca { float, float }, align 4
  %3 = fpext float %gamma to double
  %4 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 11, i32 %target, double %3)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %58

; <label>:7                                       ; preds = %0
  %8 = call <2 x float> @quantum_cexp(float %gamma)
  %9 = bitcast { float, float }* %1 to <2 x float>*
  store <2 x float> %8, <2 x float>* %9, align 1
  %10 = getelementptr inbounds { float, float }* %1, i32 0, i32 0
  %11 = load float* %10, align 4
  %12 = getelementptr inbounds { float, float }* %1, i32 0, i32 1
  %13 = load float* %12, align 4
  %14 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %15 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  store float %11, float* %14, align 4
  store float %13, float* %15, align 4
  br label %16

; <label>:16                                      ; preds = %55, %7
  %i.0 = phi i32 [ 0, %7 ], [ %56, %55 ]
  %17 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %18 = load i32* %17, align 4
  %19 = icmp slt i32 %i.0, %18
  br i1 %19, label %20, label %57

; <label>:20                                      ; preds = %16
  %21 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %22 = load float* %21, align 4
  %23 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %24 = load float* %23, align 4
  %25 = sext i32 %i.0 to i64
  %26 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %27 = load %struct.quantum_reg_node_struct** %26, align 8
  %28 = getelementptr inbounds %struct.quantum_reg_node_struct* %27, i64 %25
  %29 = getelementptr inbounds %struct.quantum_reg_node_struct* %28, i32 0, i32 0
  %30 = getelementptr inbounds { float, float }* %29, i32 0, i32 0
  %31 = load float* %30, align 4
  %32 = getelementptr inbounds { float, float }* %29, i32 0, i32 1
  %33 = load float* %32, align 4
  %34 = fmul float %31, %22
  %35 = fmul float %33, %24
  %36 = fmul float %31, %24
  %37 = fmul float %33, %22
  %38 = fsub float %34, %35
  %39 = fadd float %36, %37
  %40 = fcmp uno float %38, %38
  br i1 %40, label %41, label %50, !prof !1

; <label>:41                                      ; preds = %20
  %42 = fcmp uno float %39, %39
  br i1 %42, label %43, label %50, !prof !1

; <label>:43                                      ; preds = %41
  %44 = call <2 x float> @__mulsc3(float %31, float %33, float %22, float %24) #4
  %45 = bitcast { float, float }* %2 to <2 x float>*
  store <2 x float> %44, <2 x float>* %45, align 1
  %46 = getelementptr inbounds { float, float }* %2, i32 0, i32 0
  %47 = load float* %46, align 4
  %48 = getelementptr inbounds { float, float }* %2, i32 0, i32 1
  %49 = load float* %48, align 4
  br label %50

; <label>:50                                      ; preds = %43, %41, %20
  %51 = phi float [ %38, %20 ], [ %38, %41 ], [ %47, %43 ]
  %52 = phi float [ %39, %20 ], [ %39, %41 ], [ %49, %43 ]
  %53 = getelementptr inbounds { float, float }* %29, i32 0, i32 0
  %54 = getelementptr inbounds { float, float }* %29, i32 0, i32 1
  store float %51, float* %53, align 4
  store float %52, float* %54, align 4
  br label %55

; <label>:55                                      ; preds = %50
  %56 = add nsw i32 %i.0, 1
  br label %16

; <label>:57                                      ; preds = %16
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  br label %58

; <label>:58                                      ; preds = %57, %6
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_phase_kick(i32 %target, float %gamma, %struct.quantum_reg_struct* %reg) #0 {
  %z = alloca { float, float }, align 4
  %1 = alloca { float, float }, align 4
  %2 = alloca { float, float }, align 4
  %3 = fpext float %gamma to double
  %4 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 10, i32 %target, double %3)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %70

; <label>:7                                       ; preds = %0
  %8 = call <2 x float> @quantum_cexp(float %gamma)
  %9 = bitcast { float, float }* %1 to <2 x float>*
  store <2 x float> %8, <2 x float>* %9, align 1
  %10 = getelementptr inbounds { float, float }* %1, i32 0, i32 0
  %11 = load float* %10, align 4
  %12 = getelementptr inbounds { float, float }* %1, i32 0, i32 1
  %13 = load float* %12, align 4
  %14 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %15 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  store float %11, float* %14, align 4
  store float %13, float* %15, align 4
  br label %16

; <label>:16                                      ; preds = %67, %7
  %i.0 = phi i32 [ 0, %7 ], [ %68, %67 ]
  %17 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %18 = load i32* %17, align 4
  %19 = icmp slt i32 %i.0, %18
  br i1 %19, label %20, label %69

; <label>:20                                      ; preds = %16
  %21 = sext i32 %i.0 to i64
  %22 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %23 = load %struct.quantum_reg_node_struct** %22, align 8
  %24 = getelementptr inbounds %struct.quantum_reg_node_struct* %23, i64 %21
  %25 = getelementptr inbounds %struct.quantum_reg_node_struct* %24, i32 0, i32 1
  %26 = load i64* %25, align 8
  %27 = zext i32 %target to i64
  %28 = shl i64 1, %27
  %29 = and i64 %26, %28
  %30 = icmp ne i64 %29, 0
  br i1 %30, label %31, label %66

; <label>:31                                      ; preds = %20
  %32 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %33 = load float* %32, align 4
  %34 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %35 = load float* %34, align 4
  %36 = sext i32 %i.0 to i64
  %37 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %38 = load %struct.quantum_reg_node_struct** %37, align 8
  %39 = getelementptr inbounds %struct.quantum_reg_node_struct* %38, i64 %36
  %40 = getelementptr inbounds %struct.quantum_reg_node_struct* %39, i32 0, i32 0
  %41 = getelementptr inbounds { float, float }* %40, i32 0, i32 0
  %42 = load float* %41, align 4
  %43 = getelementptr inbounds { float, float }* %40, i32 0, i32 1
  %44 = load float* %43, align 4
  %45 = fmul float %42, %33
  %46 = fmul float %44, %35
  %47 = fmul float %42, %35
  %48 = fmul float %44, %33
  %49 = fsub float %45, %46
  %50 = fadd float %47, %48
  %51 = fcmp uno float %49, %49
  br i1 %51, label %52, label %61, !prof !1

; <label>:52                                      ; preds = %31
  %53 = fcmp uno float %50, %50
  br i1 %53, label %54, label %61, !prof !1

; <label>:54                                      ; preds = %52
  %55 = call <2 x float> @__mulsc3(float %42, float %44, float %33, float %35) #4
  %56 = bitcast { float, float }* %2 to <2 x float>*
  store <2 x float> %55, <2 x float>* %56, align 1
  %57 = getelementptr inbounds { float, float }* %2, i32 0, i32 0
  %58 = load float* %57, align 4
  %59 = getelementptr inbounds { float, float }* %2, i32 0, i32 1
  %60 = load float* %59, align 4
  br label %61

; <label>:61                                      ; preds = %54, %52, %31
  %62 = phi float [ %49, %31 ], [ %49, %52 ], [ %58, %54 ]
  %63 = phi float [ %50, %31 ], [ %50, %52 ], [ %60, %54 ]
  %64 = getelementptr inbounds { float, float }* %40, i32 0, i32 0
  %65 = getelementptr inbounds { float, float }* %40, i32 0, i32 1
  store float %62, float* %64, align 4
  store float %63, float* %65, align 4
  br label %66

; <label>:66                                      ; preds = %61, %20
  br label %67

; <label>:67                                      ; preds = %66
  %68 = add nsw i32 %i.0, 1
  br label %16

; <label>:69                                      ; preds = %16
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  br label %70

; <label>:70                                      ; preds = %69, %6
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_cond_phase(i32 %control, i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %z = alloca { float, float }, align 4
  %1 = alloca { float, float }, align 4
  %2 = alloca { float, float }, align 4
  %3 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 12, i32 %control, i32 %target)
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %87

; <label>:6                                       ; preds = %0
  %7 = sub nsw i32 %control, %target
  %8 = zext i32 %7 to i64
  %9 = shl i64 1, %8
  %10 = uitofp i64 %9 to double
  %11 = fdiv double 0x400921FB54524550, %10
  %12 = fptrunc double %11 to float
  %13 = call <2 x float> @quantum_cexp(float %12)
  %14 = bitcast { float, float }* %1 to <2 x float>*
  store <2 x float> %13, <2 x float>* %14, align 1
  %15 = getelementptr inbounds { float, float }* %1, i32 0, i32 0
  %16 = load float* %15, align 4
  %17 = getelementptr inbounds { float, float }* %1, i32 0, i32 1
  %18 = load float* %17, align 4
  %19 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %20 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  store float %16, float* %19, align 4
  store float %18, float* %20, align 4
  br label %21

; <label>:21                                      ; preds = %84, %6
  %i.0 = phi i32 [ 0, %6 ], [ %85, %84 ]
  %22 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %23 = load i32* %22, align 4
  %24 = icmp slt i32 %i.0, %23
  br i1 %24, label %25, label %86

; <label>:25                                      ; preds = %21
  %26 = sext i32 %i.0 to i64
  %27 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %28 = load %struct.quantum_reg_node_struct** %27, align 8
  %29 = getelementptr inbounds %struct.quantum_reg_node_struct* %28, i64 %26
  %30 = getelementptr inbounds %struct.quantum_reg_node_struct* %29, i32 0, i32 1
  %31 = load i64* %30, align 8
  %32 = zext i32 %control to i64
  %33 = shl i64 1, %32
  %34 = and i64 %31, %33
  %35 = icmp ne i64 %34, 0
  br i1 %35, label %36, label %83

; <label>:36                                      ; preds = %25
  %37 = sext i32 %i.0 to i64
  %38 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %39 = load %struct.quantum_reg_node_struct** %38, align 8
  %40 = getelementptr inbounds %struct.quantum_reg_node_struct* %39, i64 %37
  %41 = getelementptr inbounds %struct.quantum_reg_node_struct* %40, i32 0, i32 1
  %42 = load i64* %41, align 8
  %43 = zext i32 %target to i64
  %44 = shl i64 1, %43
  %45 = and i64 %42, %44
  %46 = icmp ne i64 %45, 0
  br i1 %46, label %47, label %82

; <label>:47                                      ; preds = %36
  %48 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %49 = load float* %48, align 4
  %50 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %51 = load float* %50, align 4
  %52 = sext i32 %i.0 to i64
  %53 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %54 = load %struct.quantum_reg_node_struct** %53, align 8
  %55 = getelementptr inbounds %struct.quantum_reg_node_struct* %54, i64 %52
  %56 = getelementptr inbounds %struct.quantum_reg_node_struct* %55, i32 0, i32 0
  %57 = getelementptr inbounds { float, float }* %56, i32 0, i32 0
  %58 = load float* %57, align 4
  %59 = getelementptr inbounds { float, float }* %56, i32 0, i32 1
  %60 = load float* %59, align 4
  %61 = fmul float %58, %49
  %62 = fmul float %60, %51
  %63 = fmul float %58, %51
  %64 = fmul float %60, %49
  %65 = fsub float %61, %62
  %66 = fadd float %63, %64
  %67 = fcmp uno float %65, %65
  br i1 %67, label %68, label %77, !prof !1

; <label>:68                                      ; preds = %47
  %69 = fcmp uno float %66, %66
  br i1 %69, label %70, label %77, !prof !1

; <label>:70                                      ; preds = %68
  %71 = call <2 x float> @__mulsc3(float %58, float %60, float %49, float %51) #4
  %72 = bitcast { float, float }* %2 to <2 x float>*
  store <2 x float> %71, <2 x float>* %72, align 1
  %73 = getelementptr inbounds { float, float }* %2, i32 0, i32 0
  %74 = load float* %73, align 4
  %75 = getelementptr inbounds { float, float }* %2, i32 0, i32 1
  %76 = load float* %75, align 4
  br label %77

; <label>:77                                      ; preds = %70, %68, %47
  %78 = phi float [ %65, %47 ], [ %65, %68 ], [ %74, %70 ]
  %79 = phi float [ %66, %47 ], [ %66, %68 ], [ %76, %70 ]
  %80 = getelementptr inbounds { float, float }* %56, i32 0, i32 0
  %81 = getelementptr inbounds { float, float }* %56, i32 0, i32 1
  store float %78, float* %80, align 4
  store float %79, float* %81, align 4
  br label %82

; <label>:82                                      ; preds = %77, %36
  br label %83

; <label>:83                                      ; preds = %82, %25
  br label %84

; <label>:84                                      ; preds = %83
  %85 = add nsw i32 %i.0, 1
  br label %21

; <label>:86                                      ; preds = %21
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  br label %87

; <label>:87                                      ; preds = %86, %5
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_cond_phase_inv(i32 %control, i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %z = alloca { float, float }, align 4
  %1 = alloca { float, float }, align 4
  %2 = alloca { float, float }, align 4
  %3 = sub nsw i32 %control, %target
  %4 = zext i32 %3 to i64
  %5 = shl i64 1, %4
  %6 = uitofp i64 %5 to double
  %7 = fdiv double 0xC00921FB54524550, %6
  %8 = fptrunc double %7 to float
  %9 = call <2 x float> @quantum_cexp(float %8)
  %10 = bitcast { float, float }* %1 to <2 x float>*
  store <2 x float> %9, <2 x float>* %10, align 1
  %11 = getelementptr inbounds { float, float }* %1, i32 0, i32 0
  %12 = load float* %11, align 4
  %13 = getelementptr inbounds { float, float }* %1, i32 0, i32 1
  %14 = load float* %13, align 4
  %15 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %16 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  store float %12, float* %15, align 4
  store float %14, float* %16, align 4
  br label %17

; <label>:17                                      ; preds = %80, %0
  %i.0 = phi i32 [ 0, %0 ], [ %81, %80 ]
  %18 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %19 = load i32* %18, align 4
  %20 = icmp slt i32 %i.0, %19
  br i1 %20, label %21, label %82

; <label>:21                                      ; preds = %17
  %22 = sext i32 %i.0 to i64
  %23 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %24 = load %struct.quantum_reg_node_struct** %23, align 8
  %25 = getelementptr inbounds %struct.quantum_reg_node_struct* %24, i64 %22
  %26 = getelementptr inbounds %struct.quantum_reg_node_struct* %25, i32 0, i32 1
  %27 = load i64* %26, align 8
  %28 = zext i32 %control to i64
  %29 = shl i64 1, %28
  %30 = and i64 %27, %29
  %31 = icmp ne i64 %30, 0
  br i1 %31, label %32, label %79

; <label>:32                                      ; preds = %21
  %33 = sext i32 %i.0 to i64
  %34 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %35 = load %struct.quantum_reg_node_struct** %34, align 8
  %36 = getelementptr inbounds %struct.quantum_reg_node_struct* %35, i64 %33
  %37 = getelementptr inbounds %struct.quantum_reg_node_struct* %36, i32 0, i32 1
  %38 = load i64* %37, align 8
  %39 = zext i32 %target to i64
  %40 = shl i64 1, %39
  %41 = and i64 %38, %40
  %42 = icmp ne i64 %41, 0
  br i1 %42, label %43, label %78

; <label>:43                                      ; preds = %32
  %44 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %45 = load float* %44, align 4
  %46 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %47 = load float* %46, align 4
  %48 = sext i32 %i.0 to i64
  %49 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %50 = load %struct.quantum_reg_node_struct** %49, align 8
  %51 = getelementptr inbounds %struct.quantum_reg_node_struct* %50, i64 %48
  %52 = getelementptr inbounds %struct.quantum_reg_node_struct* %51, i32 0, i32 0
  %53 = getelementptr inbounds { float, float }* %52, i32 0, i32 0
  %54 = load float* %53, align 4
  %55 = getelementptr inbounds { float, float }* %52, i32 0, i32 1
  %56 = load float* %55, align 4
  %57 = fmul float %54, %45
  %58 = fmul float %56, %47
  %59 = fmul float %54, %47
  %60 = fmul float %56, %45
  %61 = fsub float %57, %58
  %62 = fadd float %59, %60
  %63 = fcmp uno float %61, %61
  br i1 %63, label %64, label %73, !prof !1

; <label>:64                                      ; preds = %43
  %65 = fcmp uno float %62, %62
  br i1 %65, label %66, label %73, !prof !1

; <label>:66                                      ; preds = %64
  %67 = call <2 x float> @__mulsc3(float %54, float %56, float %45, float %47) #4
  %68 = bitcast { float, float }* %2 to <2 x float>*
  store <2 x float> %67, <2 x float>* %68, align 1
  %69 = getelementptr inbounds { float, float }* %2, i32 0, i32 0
  %70 = load float* %69, align 4
  %71 = getelementptr inbounds { float, float }* %2, i32 0, i32 1
  %72 = load float* %71, align 4
  br label %73

; <label>:73                                      ; preds = %66, %64, %43
  %74 = phi float [ %61, %43 ], [ %61, %64 ], [ %70, %66 ]
  %75 = phi float [ %62, %43 ], [ %62, %64 ], [ %72, %66 ]
  %76 = getelementptr inbounds { float, float }* %52, i32 0, i32 0
  %77 = getelementptr inbounds { float, float }* %52, i32 0, i32 1
  store float %74, float* %76, align 4
  store float %75, float* %77, align 4
  br label %78

; <label>:78                                      ; preds = %73, %32
  br label %79

; <label>:79                                      ; preds = %78, %21
  br label %80

; <label>:80                                      ; preds = %79
  %81 = add nsw i32 %i.0, 1
  br label %17

; <label>:82                                      ; preds = %17
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_cond_phase_kick(i32 %control, i32 %target, float %gamma, %struct.quantum_reg_struct* %reg) #0 {
  %z = alloca { float, float }, align 4
  %1 = alloca { float, float }, align 4
  %2 = alloca { float, float }, align 4
  %3 = fpext float %gamma to double
  %4 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 12, i32 %control, i32 %target, double %3)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %82

; <label>:7                                       ; preds = %0
  %8 = call <2 x float> @quantum_cexp(float %gamma)
  %9 = bitcast { float, float }* %1 to <2 x float>*
  store <2 x float> %8, <2 x float>* %9, align 1
  %10 = getelementptr inbounds { float, float }* %1, i32 0, i32 0
  %11 = load float* %10, align 4
  %12 = getelementptr inbounds { float, float }* %1, i32 0, i32 1
  %13 = load float* %12, align 4
  %14 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %15 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  store float %11, float* %14, align 4
  store float %13, float* %15, align 4
  br label %16

; <label>:16                                      ; preds = %79, %7
  %i.0 = phi i32 [ 0, %7 ], [ %80, %79 ]
  %17 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 1
  %18 = load i32* %17, align 4
  %19 = icmp slt i32 %i.0, %18
  br i1 %19, label %20, label %81

; <label>:20                                      ; preds = %16
  %21 = sext i32 %i.0 to i64
  %22 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %23 = load %struct.quantum_reg_node_struct** %22, align 8
  %24 = getelementptr inbounds %struct.quantum_reg_node_struct* %23, i64 %21
  %25 = getelementptr inbounds %struct.quantum_reg_node_struct* %24, i32 0, i32 1
  %26 = load i64* %25, align 8
  %27 = zext i32 %control to i64
  %28 = shl i64 1, %27
  %29 = and i64 %26, %28
  %30 = icmp ne i64 %29, 0
  br i1 %30, label %31, label %78

; <label>:31                                      ; preds = %20
  %32 = sext i32 %i.0 to i64
  %33 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %34 = load %struct.quantum_reg_node_struct** %33, align 8
  %35 = getelementptr inbounds %struct.quantum_reg_node_struct* %34, i64 %32
  %36 = getelementptr inbounds %struct.quantum_reg_node_struct* %35, i32 0, i32 1
  %37 = load i64* %36, align 8
  %38 = zext i32 %target to i64
  %39 = shl i64 1, %38
  %40 = and i64 %37, %39
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %77

; <label>:42                                      ; preds = %31
  %43 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %44 = load float* %43, align 4
  %45 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %46 = load float* %45, align 4
  %47 = sext i32 %i.0 to i64
  %48 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %49 = load %struct.quantum_reg_node_struct** %48, align 8
  %50 = getelementptr inbounds %struct.quantum_reg_node_struct* %49, i64 %47
  %51 = getelementptr inbounds %struct.quantum_reg_node_struct* %50, i32 0, i32 0
  %52 = getelementptr inbounds { float, float }* %51, i32 0, i32 0
  %53 = load float* %52, align 4
  %54 = getelementptr inbounds { float, float }* %51, i32 0, i32 1
  %55 = load float* %54, align 4
  %56 = fmul float %53, %44
  %57 = fmul float %55, %46
  %58 = fmul float %53, %46
  %59 = fmul float %55, %44
  %60 = fsub float %56, %57
  %61 = fadd float %58, %59
  %62 = fcmp uno float %60, %60
  br i1 %62, label %63, label %72, !prof !1

; <label>:63                                      ; preds = %42
  %64 = fcmp uno float %61, %61
  br i1 %64, label %65, label %72, !prof !1

; <label>:65                                      ; preds = %63
  %66 = call <2 x float> @__mulsc3(float %53, float %55, float %44, float %46) #4
  %67 = bitcast { float, float }* %2 to <2 x float>*
  store <2 x float> %66, <2 x float>* %67, align 1
  %68 = getelementptr inbounds { float, float }* %2, i32 0, i32 0
  %69 = load float* %68, align 4
  %70 = getelementptr inbounds { float, float }* %2, i32 0, i32 1
  %71 = load float* %70, align 4
  br label %72

; <label>:72                                      ; preds = %65, %63, %42
  %73 = phi float [ %60, %42 ], [ %60, %63 ], [ %69, %65 ]
  %74 = phi float [ %61, %42 ], [ %61, %63 ], [ %71, %65 ]
  %75 = getelementptr inbounds { float, float }* %51, i32 0, i32 0
  %76 = getelementptr inbounds { float, float }* %51, i32 0, i32 1
  store float %73, float* %75, align 4
  store float %74, float* %76, align 4
  br label %77

; <label>:77                                      ; preds = %72, %31
  br label %78

; <label>:78                                      ; preds = %77, %20
  br label %79

; <label>:79                                      ; preds = %78
  %80 = add nsw i32 %i.0, 1
  br label %16

; <label>:81                                      ; preds = %16
  call void @quantum_decohere(%struct.quantum_reg_struct* %reg)
  br label %82

; <label>:82                                      ; preds = %81, %6
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @quantum_gate_counter(i32 %inc) #0 {
  %1 = icmp sgt i32 %inc, 0
  br i1 %1, label %2, label %5

; <label>:2                                       ; preds = %0
  %3 = load i32* @quantum_gate_counter.counter, align 4
  %4 = add nsw i32 %3, %inc
  store i32 %4, i32* @quantum_gate_counter.counter, align 4
  br label %9

; <label>:5                                       ; preds = %0
  %6 = icmp slt i32 %inc, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %5
  store i32 0, i32* @quantum_gate_counter.counter, align 4
  br label %8

; <label>:8                                       ; preds = %7, %5
  br label %9

; <label>:9                                       ; preds = %8, %2
  %10 = load i32* @quantum_gate_counter.counter, align 4
  ret i32 %10
}

; Function Attrs: inlinehint nounwind uwtable
define internal float @quantum_real(<2 x float> %a.coerce) #5 {
  %a = alloca { float, float }, align 8
  %1 = bitcast { float, float }* %a to <2 x float>*
  store <2 x float> %a.coerce, <2 x float>* %1, align 1
  %2 = bitcast { float, float }* %a to float*
  %3 = getelementptr inbounds float* %2, i64 0
  %4 = load float* %3, align 4
  ret float %4
}

; Function Attrs: inlinehint nounwind uwtable
define internal float @quantum_imag(<2 x float> %a.coerce) #5 {
  %a = alloca { float, float }, align 8
  %1 = bitcast { float, float }* %a to <2 x float>*
  store <2 x float> %a.coerce, <2 x float>* %1, align 1
  %2 = bitcast { float, float }* %a to float*
  %3 = getelementptr inbounds float* %2, i64 1
  %4 = load float* %3, align 4
  ret float %4
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @quantum_hash64(i64 %key, i32 %width) #5 {
  %1 = and i64 %key, 4294967295
  %2 = lshr i64 %key, 32
  %3 = xor i64 %1, %2
  %4 = trunc i64 %3 to i32
  %5 = zext i32 %4 to i64
  %6 = mul i64 %5, 2654404609
  %7 = trunc i64 %6 to i32
  %8 = sub nsw i32 32, %width
  %9 = lshr i32 %7, %8
  ret i32 %9
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!1 = !{!"branch_weights", i32 1, i32 1048575}
