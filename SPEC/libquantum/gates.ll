; ModuleID = 'gates.c'
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
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %qec = alloca i32, align 4
  store i32 %control, i32* %1, align 4
  store i32 %target, i32* %2, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %3, align 8
  call void @quantum_qec_get_status(i32* %qec, i32* null)
  %4 = load i32* %qec, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %10

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4
  %8 = load i32* %2, align 4
  %9 = load %struct.quantum_reg_struct** %3, align 8
  call void @quantum_cnot_ft(i32 %7, i32 %8, %struct.quantum_reg_struct* %9)
  br label %56

; <label>:10                                      ; preds = %0
  %11 = load i32* %1, align 4
  %12 = load i32* %2, align 4
  %13 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 1, i32 %11, i32 %12)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %10
  br label %56

; <label>:16                                      ; preds = %10
  store i32 0, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %51, %16
  %18 = load i32* %i, align 4
  %19 = load %struct.quantum_reg_struct** %3, align 8
  %20 = getelementptr inbounds %struct.quantum_reg_struct* %19, i32 0, i32 1
  %21 = load i32* %20, align 4
  %22 = icmp slt i32 %18, %21
  br i1 %22, label %23, label %54

; <label>:23                                      ; preds = %17
  %24 = load i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = load %struct.quantum_reg_struct** %3, align 8
  %27 = getelementptr inbounds %struct.quantum_reg_struct* %26, i32 0, i32 3
  %28 = load %struct.quantum_reg_node_struct** %27, align 8
  %29 = getelementptr inbounds %struct.quantum_reg_node_struct* %28, i64 %25
  %30 = getelementptr inbounds %struct.quantum_reg_node_struct* %29, i32 0, i32 1
  %31 = load i64* %30, align 8
  %32 = load i32* %1, align 4
  %33 = zext i32 %32 to i64
  %34 = shl i64 1, %33
  %35 = and i64 %31, %34
  %36 = icmp ne i64 %35, 0
  br i1 %36, label %37, label %50

; <label>:37                                      ; preds = %23
  %38 = load i32* %2, align 4
  %39 = zext i32 %38 to i64
  %40 = shl i64 1, %39
  %41 = load i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = load %struct.quantum_reg_struct** %3, align 8
  %44 = getelementptr inbounds %struct.quantum_reg_struct* %43, i32 0, i32 3
  %45 = load %struct.quantum_reg_node_struct** %44, align 8
  %46 = getelementptr inbounds %struct.quantum_reg_node_struct* %45, i64 %42
  %47 = getelementptr inbounds %struct.quantum_reg_node_struct* %46, i32 0, i32 1
  %48 = load i64* %47, align 8
  %49 = xor i64 %48, %40
  store i64 %49, i64* %47, align 8
  br label %50

; <label>:50                                      ; preds = %37, %23
  br label %51

; <label>:51                                      ; preds = %50
  %52 = load i32* %i, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %i, align 4
  br label %17

; <label>:54                                      ; preds = %17
  %55 = load %struct.quantum_reg_struct** %3, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %55)
  br label %56

; <label>:56                                      ; preds = %15, %54, %6
  ret void
}

declare void @quantum_qec_get_status(i32*, i32*) #1

declare void @quantum_cnot_ft(i32, i32, %struct.quantum_reg_struct*) #1

declare i32 @quantum_objcode_put(i8 zeroext, ...) #1

declare void @quantum_decohere(%struct.quantum_reg_struct*) #1

; Function Attrs: nounwind uwtable
define void @quantum_toffoli(i32 %control1, i32 %control2, i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %qec = alloca i32, align 4
  store i32 %control1, i32* %1, align 4
  store i32 %control2, i32* %2, align 4
  store i32 %target, i32* %3, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %4, align 8
  call void @quantum_qec_get_status(i32* %qec, i32* null)
  %5 = load i32* %qec, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %12

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  %9 = load i32* %2, align 4
  %10 = load i32* %3, align 4
  %11 = load %struct.quantum_reg_struct** %4, align 8
  call void @quantum_toffoli_ft(i32 %8, i32 %9, i32 %10, %struct.quantum_reg_struct* %11)
  br label %74

; <label>:12                                      ; preds = %0
  %13 = load i32* %1, align 4
  %14 = load i32* %2, align 4
  %15 = load i32* %3, align 4
  %16 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 2, i32 %13, i32 %14, i32 %15)
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %12
  br label %74

; <label>:19                                      ; preds = %12
  store i32 0, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %69, %19
  %21 = load i32* %i, align 4
  %22 = load %struct.quantum_reg_struct** %4, align 8
  %23 = getelementptr inbounds %struct.quantum_reg_struct* %22, i32 0, i32 1
  %24 = load i32* %23, align 4
  %25 = icmp slt i32 %21, %24
  br i1 %25, label %26, label %72

; <label>:26                                      ; preds = %20
  %27 = load i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = load %struct.quantum_reg_struct** %4, align 8
  %30 = getelementptr inbounds %struct.quantum_reg_struct* %29, i32 0, i32 3
  %31 = load %struct.quantum_reg_node_struct** %30, align 8
  %32 = getelementptr inbounds %struct.quantum_reg_node_struct* %31, i64 %28
  %33 = getelementptr inbounds %struct.quantum_reg_node_struct* %32, i32 0, i32 1
  %34 = load i64* %33, align 8
  %35 = load i32* %1, align 4
  %36 = zext i32 %35 to i64
  %37 = shl i64 1, %36
  %38 = and i64 %34, %37
  %39 = icmp ne i64 %38, 0
  br i1 %39, label %40, label %68

; <label>:40                                      ; preds = %26
  %41 = load i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = load %struct.quantum_reg_struct** %4, align 8
  %44 = getelementptr inbounds %struct.quantum_reg_struct* %43, i32 0, i32 3
  %45 = load %struct.quantum_reg_node_struct** %44, align 8
  %46 = getelementptr inbounds %struct.quantum_reg_node_struct* %45, i64 %42
  %47 = getelementptr inbounds %struct.quantum_reg_node_struct* %46, i32 0, i32 1
  %48 = load i64* %47, align 8
  %49 = load i32* %2, align 4
  %50 = zext i32 %49 to i64
  %51 = shl i64 1, %50
  %52 = and i64 %48, %51
  %53 = icmp ne i64 %52, 0
  br i1 %53, label %54, label %67

; <label>:54                                      ; preds = %40
  %55 = load i32* %3, align 4
  %56 = zext i32 %55 to i64
  %57 = shl i64 1, %56
  %58 = load i32* %i, align 4
  %59 = sext i32 %58 to i64
  %60 = load %struct.quantum_reg_struct** %4, align 8
  %61 = getelementptr inbounds %struct.quantum_reg_struct* %60, i32 0, i32 3
  %62 = load %struct.quantum_reg_node_struct** %61, align 8
  %63 = getelementptr inbounds %struct.quantum_reg_node_struct* %62, i64 %59
  %64 = getelementptr inbounds %struct.quantum_reg_node_struct* %63, i32 0, i32 1
  %65 = load i64* %64, align 8
  %66 = xor i64 %65, %57
  store i64 %66, i64* %64, align 8
  br label %67

; <label>:67                                      ; preds = %54, %40
  br label %68

; <label>:68                                      ; preds = %67, %26
  br label %69

; <label>:69                                      ; preds = %68
  %70 = load i32* %i, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %i, align 4
  br label %20

; <label>:72                                      ; preds = %20
  %73 = load %struct.quantum_reg_struct** %4, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %73)
  br label %74

; <label>:74                                      ; preds = %18, %72, %7
  ret void
}

declare void @quantum_toffoli_ft(i32, i32, i32, %struct.quantum_reg_struct*) #1

; Function Attrs: nounwind uwtable
define void @quantum_unbounded_toffoli(i32 %controlling, %struct.quantum_reg_struct* %reg, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.quantum_reg_struct*, align 8
  %bits = alloca [1 x %struct.__va_list_tag], align 16
  %target = alloca i32, align 4
  %controls = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %controlling, i32* %1, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %2, align 8
  %3 = load i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = mul i64 %4, 4
  %6 = call noalias i8* @malloc(i64 %5) #4
  %7 = bitcast i8* %6 to i32*
  store i32* %7, i32** %controls, align 8
  %8 = load i32** %controls, align 8
  %9 = icmp ne i32* %8, null
  br i1 %9, label %13, label %10

; <label>:10                                      ; preds = %0
  %11 = load i32* %1, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str, i32 0, i32 0), i32 %11)
  call void @exit(i32 1) #6
  unreachable

; <label>:13                                      ; preds = %0
  %14 = load i32* %1, align 4
  %15 = sext i32 %14 to i64
  %16 = mul i64 %15, 4
  %17 = call i64 @quantum_memman(i64 %16)
  %18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %bits, i32 0, i32 0
  %19 = bitcast %struct.__va_list_tag* %18 to i8*
  call void @llvm.va_start(i8* %19)
  store i32 0, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %47, %13
  %21 = load i32* %i, align 4
  %22 = load i32* %1, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %50

; <label>:24                                      ; preds = %20
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %bits, i32 0, i32 0
  %26 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 0
  %27 = load i32* %26
  %28 = icmp ule i32 %27, 40
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %24
  %30 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 3
  %31 = load i8** %30
  %32 = getelementptr i8* %31, i32 %27
  %33 = bitcast i8* %32 to i32*
  %34 = add i32 %27, 8
  store i32 %34, i32* %26
  br label %40

; <label>:35                                      ; preds = %24
  %36 = getelementptr inbounds %struct.__va_list_tag* %25, i32 0, i32 2
  %37 = load i8** %36
  %38 = bitcast i8* %37 to i32*
  %39 = getelementptr i8* %37, i32 8
  store i8* %39, i8** %36
  br label %40

; <label>:40                                      ; preds = %35, %29
  %41 = phi i32* [ %33, %29 ], [ %38, %35 ]
  %42 = load i32* %41
  %43 = load i32* %i, align 4
  %44 = sext i32 %43 to i64
  %45 = load i32** %controls, align 8
  %46 = getelementptr inbounds i32* %45, i64 %44
  store i32 %42, i32* %46, align 4
  br label %47

; <label>:47                                      ; preds = %40
  %48 = load i32* %i, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %i, align 4
  br label %20

; <label>:50                                      ; preds = %20
  %51 = getelementptr inbounds [1 x %struct.__va_list_tag]* %bits, i32 0, i32 0
  %52 = getelementptr inbounds %struct.__va_list_tag* %51, i32 0, i32 0
  %53 = load i32* %52
  %54 = icmp ule i32 %53, 40
  br i1 %54, label %55, label %61

; <label>:55                                      ; preds = %50
  %56 = getelementptr inbounds %struct.__va_list_tag* %51, i32 0, i32 3
  %57 = load i8** %56
  %58 = getelementptr i8* %57, i32 %53
  %59 = bitcast i8* %58 to i32*
  %60 = add i32 %53, 8
  store i32 %60, i32* %52
  br label %66

; <label>:61                                      ; preds = %50
  %62 = getelementptr inbounds %struct.__va_list_tag* %51, i32 0, i32 2
  %63 = load i8** %62
  %64 = bitcast i8* %63 to i32*
  %65 = getelementptr i8* %63, i32 8
  store i8* %65, i8** %62
  br label %66

; <label>:66                                      ; preds = %61, %55
  %67 = phi i32* [ %59, %55 ], [ %64, %61 ]
  %68 = load i32* %67
  store i32 %68, i32* %target, align 4
  %69 = getelementptr inbounds [1 x %struct.__va_list_tag]* %bits, i32 0, i32 0
  %70 = bitcast %struct.__va_list_tag* %69 to i8*
  call void @llvm.va_end(i8* %70)
  store i32 0, i32* %i, align 4
  br label %71

; <label>:71                                      ; preds = %124, %66
  %72 = load i32* %i, align 4
  %73 = load %struct.quantum_reg_struct** %2, align 8
  %74 = getelementptr inbounds %struct.quantum_reg_struct* %73, i32 0, i32 1
  %75 = load i32* %74, align 4
  %76 = icmp slt i32 %72, %75
  br i1 %76, label %77, label %127

; <label>:77                                      ; preds = %71
  store i32 0, i32* %j, align 4
  br label %78

; <label>:78                                      ; preds = %103, %77
  %79 = load i32* %j, align 4
  %80 = load i32* %1, align 4
  %81 = icmp slt i32 %79, %80
  br i1 %81, label %82, label %100

; <label>:82                                      ; preds = %78
  %83 = load i32* %i, align 4
  %84 = sext i32 %83 to i64
  %85 = load %struct.quantum_reg_struct** %2, align 8
  %86 = getelementptr inbounds %struct.quantum_reg_struct* %85, i32 0, i32 3
  %87 = load %struct.quantum_reg_node_struct** %86, align 8
  %88 = getelementptr inbounds %struct.quantum_reg_node_struct* %87, i64 %84
  %89 = getelementptr inbounds %struct.quantum_reg_node_struct* %88, i32 0, i32 1
  %90 = load i64* %89, align 8
  %91 = load i32* %j, align 4
  %92 = sext i32 %91 to i64
  %93 = load i32** %controls, align 8
  %94 = getelementptr inbounds i32* %93, i64 %92
  %95 = load i32* %94, align 4
  %96 = zext i32 %95 to i64
  %97 = shl i64 1, %96
  %98 = and i64 %90, %97
  %99 = icmp ne i64 %98, 0
  br label %100

; <label>:100                                     ; preds = %82, %78
  %101 = phi i1 [ false, %78 ], [ %99, %82 ]
  br i1 %101, label %102, label %106

; <label>:102                                     ; preds = %100
  br label %103

; <label>:103                                     ; preds = %102
  %104 = load i32* %j, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %j, align 4
  br label %78

; <label>:106                                     ; preds = %100
  %107 = load i32* %j, align 4
  %108 = load i32* %1, align 4
  %109 = icmp eq i32 %107, %108
  br i1 %109, label %110, label %123

; <label>:110                                     ; preds = %106
  %111 = load i32* %target, align 4
  %112 = zext i32 %111 to i64
  %113 = shl i64 1, %112
  %114 = load i32* %i, align 4
  %115 = sext i32 %114 to i64
  %116 = load %struct.quantum_reg_struct** %2, align 8
  %117 = getelementptr inbounds %struct.quantum_reg_struct* %116, i32 0, i32 3
  %118 = load %struct.quantum_reg_node_struct** %117, align 8
  %119 = getelementptr inbounds %struct.quantum_reg_node_struct* %118, i64 %115
  %120 = getelementptr inbounds %struct.quantum_reg_node_struct* %119, i32 0, i32 1
  %121 = load i64* %120, align 8
  %122 = xor i64 %121, %113
  store i64 %122, i64* %120, align 8
  br label %123

; <label>:123                                     ; preds = %110, %106
  br label %124

; <label>:124                                     ; preds = %123
  %125 = load i32* %i, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %i, align 4
  br label %71

; <label>:127                                     ; preds = %71
  %128 = load i32** %controls, align 8
  %129 = bitcast i32* %128 to i8*
  call void @free(i8* %129) #4
  %130 = load i32* %1, align 4
  %131 = sub nsw i32 0, %130
  %132 = sext i32 %131 to i64
  %133 = mul i64 %132, 4
  %134 = call i64 @quantum_memman(i64 %133)
  %135 = load %struct.quantum_reg_struct** %2, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %135)
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
  %1 = alloca i32, align 4
  %2 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %qec = alloca i32, align 4
  store i32 %target, i32* %1, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %2, align 8
  call void @quantum_qec_get_status(i32* %qec, i32* null)
  %3 = load i32* %qec, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = load %struct.quantum_reg_struct** %2, align 8
  call void @quantum_sigma_x_ft(i32 %6, %struct.quantum_reg_struct* %7)
  br label %38

; <label>:8                                       ; preds = %0
  %9 = load i32* %1, align 4
  %10 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 3, i32 %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %8
  br label %38

; <label>:13                                      ; preds = %8
  store i32 0, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %33, %13
  %15 = load i32* %i, align 4
  %16 = load %struct.quantum_reg_struct** %2, align 8
  %17 = getelementptr inbounds %struct.quantum_reg_struct* %16, i32 0, i32 1
  %18 = load i32* %17, align 4
  %19 = icmp slt i32 %15, %18
  br i1 %19, label %20, label %36

; <label>:20                                      ; preds = %14
  %21 = load i32* %1, align 4
  %22 = zext i32 %21 to i64
  %23 = shl i64 1, %22
  %24 = load i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = load %struct.quantum_reg_struct** %2, align 8
  %27 = getelementptr inbounds %struct.quantum_reg_struct* %26, i32 0, i32 3
  %28 = load %struct.quantum_reg_node_struct** %27, align 8
  %29 = getelementptr inbounds %struct.quantum_reg_node_struct* %28, i64 %25
  %30 = getelementptr inbounds %struct.quantum_reg_node_struct* %29, i32 0, i32 1
  %31 = load i64* %30, align 8
  %32 = xor i64 %31, %23
  store i64 %32, i64* %30, align 8
  br label %33

; <label>:33                                      ; preds = %20
  %34 = load i32* %i, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %i, align 4
  br label %14

; <label>:36                                      ; preds = %14
  %37 = load %struct.quantum_reg_struct** %2, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %37)
  br label %38

; <label>:38                                      ; preds = %12, %36, %5
  ret void
}

declare void @quantum_sigma_x_ft(i32, %struct.quantum_reg_struct*) #1

; Function Attrs: nounwind uwtable
define void @quantum_sigma_y(i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %3 = alloca { float, float }, align 4
  %4 = alloca { float, float }, align 4
  store i32 %target, i32* %1, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %2, align 8
  %5 = load i32* %1, align 4
  %6 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 4, i32 %5)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %114

; <label>:9                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %109, %9
  %11 = load i32* %i, align 4
  %12 = load %struct.quantum_reg_struct** %2, align 8
  %13 = getelementptr inbounds %struct.quantum_reg_struct* %12, i32 0, i32 1
  %14 = load i32* %13, align 4
  %15 = icmp slt i32 %11, %14
  br i1 %15, label %16, label %112

; <label>:16                                      ; preds = %10
  %17 = load i32* %1, align 4
  %18 = zext i32 %17 to i64
  %19 = shl i64 1, %18
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load %struct.quantum_reg_struct** %2, align 8
  %23 = getelementptr inbounds %struct.quantum_reg_struct* %22, i32 0, i32 3
  %24 = load %struct.quantum_reg_node_struct** %23, align 8
  %25 = getelementptr inbounds %struct.quantum_reg_node_struct* %24, i64 %21
  %26 = getelementptr inbounds %struct.quantum_reg_node_struct* %25, i32 0, i32 1
  %27 = load i64* %26, align 8
  %28 = xor i64 %27, %19
  store i64 %28, i64* %26, align 8
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load %struct.quantum_reg_struct** %2, align 8
  %32 = getelementptr inbounds %struct.quantum_reg_struct* %31, i32 0, i32 3
  %33 = load %struct.quantum_reg_node_struct** %32, align 8
  %34 = getelementptr inbounds %struct.quantum_reg_node_struct* %33, i64 %30
  %35 = getelementptr inbounds %struct.quantum_reg_node_struct* %34, i32 0, i32 1
  %36 = load i64* %35, align 8
  %37 = load i32* %1, align 4
  %38 = zext i32 %37 to i64
  %39 = shl i64 1, %38
  %40 = and i64 %36, %39
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %75

; <label>:42                                      ; preds = %16
  %43 = load i32* %i, align 4
  %44 = sext i32 %43 to i64
  %45 = load %struct.quantum_reg_struct** %2, align 8
  %46 = getelementptr inbounds %struct.quantum_reg_struct* %45, i32 0, i32 3
  %47 = load %struct.quantum_reg_node_struct** %46, align 8
  %48 = getelementptr inbounds %struct.quantum_reg_node_struct* %47, i64 %44
  %49 = getelementptr inbounds %struct.quantum_reg_node_struct* %48, i32 0, i32 0
  %50 = getelementptr inbounds { float, float }* %49, i32 0, i32 0
  %51 = load float* %50, align 4
  %52 = getelementptr inbounds { float, float }* %49, i32 0, i32 1
  %53 = load float* %52, align 4
  %54 = fmul float %51, 0.000000e+00
  %55 = fmul float %53, 1.000000e+00
  %56 = fmul float %51, 1.000000e+00
  %57 = fmul float %53, 0.000000e+00
  %58 = fsub float %54, %55
  %59 = fadd float %56, %57
  %60 = fcmp uno float %58, %58
  br i1 %60, label %61, label %70, !prof !1

; <label>:61                                      ; preds = %42
  %62 = fcmp uno float %59, %59
  br i1 %62, label %63, label %70, !prof !1

; <label>:63                                      ; preds = %61
  %64 = call <2 x float> @__mulsc3(float %51, float %53, float 0.000000e+00, float 1.000000e+00) #4
  %65 = bitcast { float, float }* %3 to <2 x float>*
  store <2 x float> %64, <2 x float>* %65, align 1
  %66 = getelementptr inbounds { float, float }* %3, i32 0, i32 0
  %67 = load float* %66, align 4
  %68 = getelementptr inbounds { float, float }* %3, i32 0, i32 1
  %69 = load float* %68, align 4
  br label %70

; <label>:70                                      ; preds = %63, %61, %42
  %71 = phi float [ %58, %42 ], [ %58, %61 ], [ %67, %63 ]
  %72 = phi float [ %59, %42 ], [ %59, %61 ], [ %69, %63 ]
  %73 = getelementptr inbounds { float, float }* %49, i32 0, i32 0
  %74 = getelementptr inbounds { float, float }* %49, i32 0, i32 1
  store float %71, float* %73, align 4
  store float %72, float* %74, align 4
  br label %108

; <label>:75                                      ; preds = %16
  %76 = load i32* %i, align 4
  %77 = sext i32 %76 to i64
  %78 = load %struct.quantum_reg_struct** %2, align 8
  %79 = getelementptr inbounds %struct.quantum_reg_struct* %78, i32 0, i32 3
  %80 = load %struct.quantum_reg_node_struct** %79, align 8
  %81 = getelementptr inbounds %struct.quantum_reg_node_struct* %80, i64 %77
  %82 = getelementptr inbounds %struct.quantum_reg_node_struct* %81, i32 0, i32 0
  %83 = getelementptr inbounds { float, float }* %82, i32 0, i32 0
  %84 = load float* %83, align 4
  %85 = getelementptr inbounds { float, float }* %82, i32 0, i32 1
  %86 = load float* %85, align 4
  %87 = fmul float %84, -0.000000e+00
  %88 = fmul float %86, -1.000000e+00
  %89 = fmul float %84, -1.000000e+00
  %90 = fmul float %86, -0.000000e+00
  %91 = fsub float %87, %88
  %92 = fadd float %89, %90
  %93 = fcmp uno float %91, %91
  br i1 %93, label %94, label %103, !prof !1

; <label>:94                                      ; preds = %75
  %95 = fcmp uno float %92, %92
  br i1 %95, label %96, label %103, !prof !1

; <label>:96                                      ; preds = %94
  %97 = call <2 x float> @__mulsc3(float %84, float %86, float -0.000000e+00, float -1.000000e+00) #4
  %98 = bitcast { float, float }* %4 to <2 x float>*
  store <2 x float> %97, <2 x float>* %98, align 1
  %99 = getelementptr inbounds { float, float }* %4, i32 0, i32 0
  %100 = load float* %99, align 4
  %101 = getelementptr inbounds { float, float }* %4, i32 0, i32 1
  %102 = load float* %101, align 4
  br label %103

; <label>:103                                     ; preds = %96, %94, %75
  %104 = phi float [ %91, %75 ], [ %91, %94 ], [ %100, %96 ]
  %105 = phi float [ %92, %75 ], [ %92, %94 ], [ %102, %96 ]
  %106 = getelementptr inbounds { float, float }* %82, i32 0, i32 0
  %107 = getelementptr inbounds { float, float }* %82, i32 0, i32 1
  store float %104, float* %106, align 4
  store float %105, float* %107, align 4
  br label %108

; <label>:108                                     ; preds = %103, %70
  br label %109

; <label>:109                                     ; preds = %108
  %110 = load i32* %i, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %i, align 4
  br label %10

; <label>:112                                     ; preds = %10
  %113 = load %struct.quantum_reg_struct** %2, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %113)
  br label %114

; <label>:114                                     ; preds = %112, %8
  ret void
}

declare <2 x float> @__mulsc3(float, float, float, float)

; Function Attrs: nounwind uwtable
define void @quantum_sigma_z(i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %3 = alloca { float, float }, align 4
  store i32 %target, i32* %1, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %2, align 8
  %4 = load i32* %1, align 4
  %5 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 5, i32 %4)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %68

; <label>:8                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %63, %8
  %10 = load i32* %i, align 4
  %11 = load %struct.quantum_reg_struct** %2, align 8
  %12 = getelementptr inbounds %struct.quantum_reg_struct* %11, i32 0, i32 1
  %13 = load i32* %12, align 4
  %14 = icmp slt i32 %10, %13
  br i1 %14, label %15, label %66

; <label>:15                                      ; preds = %9
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load %struct.quantum_reg_struct** %2, align 8
  %19 = getelementptr inbounds %struct.quantum_reg_struct* %18, i32 0, i32 3
  %20 = load %struct.quantum_reg_node_struct** %19, align 8
  %21 = getelementptr inbounds %struct.quantum_reg_node_struct* %20, i64 %17
  %22 = getelementptr inbounds %struct.quantum_reg_node_struct* %21, i32 0, i32 1
  %23 = load i64* %22, align 8
  %24 = load i32* %1, align 4
  %25 = zext i32 %24 to i64
  %26 = shl i64 1, %25
  %27 = and i64 %23, %26
  %28 = icmp ne i64 %27, 0
  br i1 %28, label %29, label %62

; <label>:29                                      ; preds = %15
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = load %struct.quantum_reg_struct** %2, align 8
  %33 = getelementptr inbounds %struct.quantum_reg_struct* %32, i32 0, i32 3
  %34 = load %struct.quantum_reg_node_struct** %33, align 8
  %35 = getelementptr inbounds %struct.quantum_reg_node_struct* %34, i64 %31
  %36 = getelementptr inbounds %struct.quantum_reg_node_struct* %35, i32 0, i32 0
  %37 = getelementptr inbounds { float, float }* %36, i32 0, i32 0
  %38 = load float* %37, align 4
  %39 = getelementptr inbounds { float, float }* %36, i32 0, i32 1
  %40 = load float* %39, align 4
  %41 = fmul float %38, -1.000000e+00
  %42 = fmul float %40, 0.000000e+00
  %43 = fmul float %38, 0.000000e+00
  %44 = fmul float %40, -1.000000e+00
  %45 = fsub float %41, %42
  %46 = fadd float %43, %44
  %47 = fcmp uno float %45, %45
  br i1 %47, label %48, label %57, !prof !1

; <label>:48                                      ; preds = %29
  %49 = fcmp uno float %46, %46
  br i1 %49, label %50, label %57, !prof !1

; <label>:50                                      ; preds = %48
  %51 = call <2 x float> @__mulsc3(float %38, float %40, float -1.000000e+00, float 0.000000e+00) #4
  %52 = bitcast { float, float }* %3 to <2 x float>*
  store <2 x float> %51, <2 x float>* %52, align 1
  %53 = getelementptr inbounds { float, float }* %3, i32 0, i32 0
  %54 = load float* %53, align 4
  %55 = getelementptr inbounds { float, float }* %3, i32 0, i32 1
  %56 = load float* %55, align 4
  br label %57

; <label>:57                                      ; preds = %50, %48, %29
  %58 = phi float [ %45, %29 ], [ %45, %48 ], [ %54, %50 ]
  %59 = phi float [ %46, %29 ], [ %46, %48 ], [ %56, %50 ]
  %60 = getelementptr inbounds { float, float }* %36, i32 0, i32 0
  %61 = getelementptr inbounds { float, float }* %36, i32 0, i32 1
  store float %58, float* %60, align 4
  store float %59, float* %61, align 4
  br label %62

; <label>:62                                      ; preds = %57, %15
  br label %63

; <label>:63                                      ; preds = %62
  %64 = load i32* %i, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %i, align 4
  br label %9

; <label>:66                                      ; preds = %9
  %67 = load %struct.quantum_reg_struct** %2, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %67)
  br label %68

; <label>:68                                      ; preds = %66, %7
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_swaptheleads(i32 %width, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %pat1 = alloca i32, align 4
  %pat2 = alloca i32, align 4
  %qec = alloca i32, align 4
  %l = alloca i64, align 8
  store i32 %width, i32* %1, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %2, align 8
  call void @quantum_qec_get_status(i32* %qec, i32* null)
  %3 = load i32* %qec, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %30

; <label>:5                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %26, %5
  %7 = load i32* %i, align 4
  %8 = load i32* %1, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %29

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = load i32* %1, align 4
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %12, %13
  %15 = load %struct.quantum_reg_struct** %2, align 8
  call void @quantum_cnot(i32 %11, i32 %14, %struct.quantum_reg_struct* %15)
  %16 = load i32* %1, align 4
  %17 = load i32* %i, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32* %i, align 4
  %20 = load %struct.quantum_reg_struct** %2, align 8
  call void @quantum_cnot(i32 %18, i32 %19, %struct.quantum_reg_struct* %20)
  %21 = load i32* %i, align 4
  %22 = load i32* %1, align 4
  %23 = load i32* %i, align 4
  %24 = add nsw i32 %22, %23
  %25 = load %struct.quantum_reg_struct** %2, align 8
  call void @quantum_cnot(i32 %21, i32 %24, %struct.quantum_reg_struct* %25)
  br label %26

; <label>:26                                      ; preds = %10
  %27 = load i32* %i, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %i, align 4
  br label %6

; <label>:29                                      ; preds = %6
  br label %120

; <label>:30                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %31

; <label>:31                                      ; preds = %116, %30
  %32 = load i32* %i, align 4
  %33 = load %struct.quantum_reg_struct** %2, align 8
  %34 = getelementptr inbounds %struct.quantum_reg_struct* %33, i32 0, i32 1
  %35 = load i32* %34, align 4
  %36 = icmp slt i32 %32, %35
  br i1 %36, label %37, label %119

; <label>:37                                      ; preds = %31
  %38 = load i32* %1, align 4
  %39 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 14, i32 %38)
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %37
  br label %120

; <label>:42                                      ; preds = %37
  %43 = load i32* %i, align 4
  %44 = sext i32 %43 to i64
  %45 = load %struct.quantum_reg_struct** %2, align 8
  %46 = getelementptr inbounds %struct.quantum_reg_struct* %45, i32 0, i32 3
  %47 = load %struct.quantum_reg_node_struct** %46, align 8
  %48 = getelementptr inbounds %struct.quantum_reg_node_struct* %47, i64 %44
  %49 = getelementptr inbounds %struct.quantum_reg_node_struct* %48, i32 0, i32 1
  %50 = load i64* %49, align 8
  %51 = load i32* %1, align 4
  %52 = zext i32 %51 to i64
  %53 = shl i64 1, %52
  %54 = urem i64 %50, %53
  %55 = trunc i64 %54 to i32
  store i32 %55, i32* %pat1, align 4
  store i32 0, i32* %pat2, align 4
  store i32 0, i32* %j, align 4
  br label %56

; <label>:56                                      ; preds = %79, %42
  %57 = load i32* %j, align 4
  %58 = load i32* %1, align 4
  %59 = icmp slt i32 %57, %58
  br i1 %59, label %60, label %82

; <label>:60                                      ; preds = %56
  %61 = load i32* %i, align 4
  %62 = sext i32 %61 to i64
  %63 = load %struct.quantum_reg_struct** %2, align 8
  %64 = getelementptr inbounds %struct.quantum_reg_struct* %63, i32 0, i32 3
  %65 = load %struct.quantum_reg_node_struct** %64, align 8
  %66 = getelementptr inbounds %struct.quantum_reg_node_struct* %65, i64 %62
  %67 = getelementptr inbounds %struct.quantum_reg_node_struct* %66, i32 0, i32 1
  %68 = load i64* %67, align 8
  %69 = load i32* %1, align 4
  %70 = load i32* %j, align 4
  %71 = add nsw i32 %69, %70
  %72 = zext i32 %71 to i64
  %73 = shl i64 1, %72
  %74 = and i64 %68, %73
  %75 = load i32* %pat2, align 4
  %76 = sext i32 %75 to i64
  %77 = add i64 %76, %74
  %78 = trunc i64 %77 to i32
  store i32 %78, i32* %pat2, align 4
  br label %79

; <label>:79                                      ; preds = %60
  %80 = load i32* %j, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %j, align 4
  br label %56

; <label>:82                                      ; preds = %56
  %83 = load i32* %i, align 4
  %84 = sext i32 %83 to i64
  %85 = load %struct.quantum_reg_struct** %2, align 8
  %86 = getelementptr inbounds %struct.quantum_reg_struct* %85, i32 0, i32 3
  %87 = load %struct.quantum_reg_node_struct** %86, align 8
  %88 = getelementptr inbounds %struct.quantum_reg_node_struct* %87, i64 %84
  %89 = getelementptr inbounds %struct.quantum_reg_node_struct* %88, i32 0, i32 1
  %90 = load i64* %89, align 8
  %91 = load i32* %pat1, align 4
  %92 = load i32* %pat2, align 4
  %93 = add nsw i32 %91, %92
  %94 = sext i32 %93 to i64
  %95 = sub i64 %90, %94
  store i64 %95, i64* %l, align 8
  %96 = load i32* %pat1, align 4
  %97 = load i32* %1, align 4
  %98 = shl i32 %96, %97
  %99 = sext i32 %98 to i64
  %100 = load i64* %l, align 8
  %101 = add i64 %100, %99
  store i64 %101, i64* %l, align 8
  %102 = load i32* %pat2, align 4
  %103 = load i32* %1, align 4
  %104 = ashr i32 %102, %103
  %105 = sext i32 %104 to i64
  %106 = load i64* %l, align 8
  %107 = add i64 %106, %105
  store i64 %107, i64* %l, align 8
  %108 = load i64* %l, align 8
  %109 = load i32* %i, align 4
  %110 = sext i32 %109 to i64
  %111 = load %struct.quantum_reg_struct** %2, align 8
  %112 = getelementptr inbounds %struct.quantum_reg_struct* %111, i32 0, i32 3
  %113 = load %struct.quantum_reg_node_struct** %112, align 8
  %114 = getelementptr inbounds %struct.quantum_reg_node_struct* %113, i64 %110
  %115 = getelementptr inbounds %struct.quantum_reg_node_struct* %114, i32 0, i32 1
  store i64 %108, i64* %115, align 8
  br label %116

; <label>:116                                     ; preds = %82
  %117 = load i32* %i, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %i, align 4
  br label %31

; <label>:119                                     ; preds = %31
  br label %120

; <label>:120                                     ; preds = %41, %119, %29
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_swaptheleads_omuln_controlled(i32 %control, i32 %width, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  store i32 %control, i32* %1, align 4
  store i32 %width, i32* %2, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %3, align 8
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %39, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %2, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %42

; <label>:8                                       ; preds = %4
  %9 = load i32* %1, align 4
  %10 = load i32* %2, align 4
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %10, %11
  %13 = load i32* %2, align 4
  %14 = mul nsw i32 2, %13
  %15 = load i32* %i, align 4
  %16 = add nsw i32 %14, %15
  %17 = add nsw i32 %16, 2
  %18 = load %struct.quantum_reg_struct** %3, align 8
  call void @quantum_toffoli(i32 %9, i32 %12, i32 %17, %struct.quantum_reg_struct* %18)
  %19 = load i32* %1, align 4
  %20 = load i32* %2, align 4
  %21 = mul nsw i32 2, %20
  %22 = load i32* %i, align 4
  %23 = add nsw i32 %21, %22
  %24 = add nsw i32 %23, 2
  %25 = load i32* %2, align 4
  %26 = load i32* %i, align 4
  %27 = add nsw i32 %25, %26
  %28 = load %struct.quantum_reg_struct** %3, align 8
  call void @quantum_toffoli(i32 %19, i32 %24, i32 %27, %struct.quantum_reg_struct* %28)
  %29 = load i32* %1, align 4
  %30 = load i32* %2, align 4
  %31 = load i32* %i, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32* %2, align 4
  %34 = mul nsw i32 2, %33
  %35 = load i32* %i, align 4
  %36 = add nsw i32 %34, %35
  %37 = add nsw i32 %36, 2
  %38 = load %struct.quantum_reg_struct** %3, align 8
  call void @quantum_toffoli(i32 %29, i32 %32, i32 %37, %struct.quantum_reg_struct* %38)
  br label %39

; <label>:39                                      ; preds = %8
  %40 = load i32* %i, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %i, align 4
  br label %4

; <label>:42                                      ; preds = %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_gate1(i32 %target, i64 %m.coerce0, { float, float }* %m.coerce1, %struct.quantum_reg_struct* %reg) #0 {
  %m = alloca %struct.quantum_matrix_struct, align 8
  %1 = alloca i32, align 4
  %2 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %iset = alloca i32, align 4
  %addsize = alloca i32, align 4
  %decsize = alloca i32, align 4
  %t = alloca { float, float }, align 4
  %tnot = alloca { float, float }, align 4
  %limit = alloca float, align 4
  %done = alloca i8*, align 8
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
  %16 = alloca { float, float }, align 4
  %17 = alloca { float, float }, align 4
  %18 = bitcast %struct.quantum_matrix_struct* %m to { i64, { float, float }* }*
  %19 = getelementptr { i64, { float, float }* }* %18, i32 0, i32 0
  store i64 %m.coerce0, i64* %19
  %20 = getelementptr { i64, { float, float }* }* %18, i32 0, i32 1
  store { float, float }* %m.coerce1, { float, float }** %20
  store i32 %target, i32* %1, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %2, align 8
  store i32 0, i32* %addsize, align 4
  store i32 0, i32* %decsize, align 4
  %21 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %22 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  store float 0.000000e+00, float* %21, align 4
  store float 0.000000e+00, float* %22, align 4
  %23 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 1
  %24 = load i32* %23, align 4
  %25 = icmp ne i32 %24, 2
  br i1 %25, label %30, label %26

; <label>:26                                      ; preds = %0
  %27 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 0
  %28 = load i32* %27, align 4
  %29 = icmp ne i32 %28, 2
  br i1 %29, label %30, label %32

; <label>:30                                      ; preds = %26, %0
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:32                                      ; preds = %26
  store i32 0, i32* %i, align 4
  br label %33

; <label>:33                                      ; preds = %47, %32
  %34 = load i32* %i, align 4
  %35 = load %struct.quantum_reg_struct** %2, align 8
  %36 = getelementptr inbounds %struct.quantum_reg_struct* %35, i32 0, i32 2
  %37 = load i32* %36, align 4
  %38 = shl i32 1, %37
  %39 = icmp slt i32 %34, %38
  br i1 %39, label %40, label %50

; <label>:40                                      ; preds = %33
  %41 = load i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = load %struct.quantum_reg_struct** %2, align 8
  %44 = getelementptr inbounds %struct.quantum_reg_struct* %43, i32 0, i32 4
  %45 = load i32** %44, align 8
  %46 = getelementptr inbounds i32* %45, i64 %42
  store i32 0, i32* %46, align 4
  br label %47

; <label>:47                                      ; preds = %40
  %48 = load i32* %i, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %i, align 4
  br label %33

; <label>:50                                      ; preds = %33
  store i32 0, i32* %i, align 4
  br label %51

; <label>:51                                      ; preds = %68, %50
  %52 = load i32* %i, align 4
  %53 = load %struct.quantum_reg_struct** %2, align 8
  %54 = getelementptr inbounds %struct.quantum_reg_struct* %53, i32 0, i32 1
  %55 = load i32* %54, align 4
  %56 = icmp slt i32 %52, %55
  br i1 %56, label %57, label %71

; <label>:57                                      ; preds = %51
  %58 = load i32* %i, align 4
  %59 = sext i32 %58 to i64
  %60 = load %struct.quantum_reg_struct** %2, align 8
  %61 = getelementptr inbounds %struct.quantum_reg_struct* %60, i32 0, i32 3
  %62 = load %struct.quantum_reg_node_struct** %61, align 8
  %63 = getelementptr inbounds %struct.quantum_reg_node_struct* %62, i64 %59
  %64 = getelementptr inbounds %struct.quantum_reg_node_struct* %63, i32 0, i32 1
  %65 = load i64* %64, align 8
  %66 = load i32* %i, align 4
  %67 = load %struct.quantum_reg_struct** %2, align 8
  call void @quantum_add_hash(i64 %65, i32 %66, %struct.quantum_reg_struct* %67)
  br label %68

; <label>:68                                      ; preds = %57
  %69 = load i32* %i, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %i, align 4
  br label %51

; <label>:71                                      ; preds = %51
  store i32 0, i32* %i, align 4
  br label %72

; <label>:72                                      ; preds = %161, %71
  %73 = load i32* %i, align 4
  %74 = load %struct.quantum_reg_struct** %2, align 8
  %75 = getelementptr inbounds %struct.quantum_reg_struct* %74, i32 0, i32 1
  %76 = load i32* %75, align 4
  %77 = icmp slt i32 %73, %76
  br i1 %77, label %78, label %164

; <label>:78                                      ; preds = %72
  %79 = load i32* %i, align 4
  %80 = sext i32 %79 to i64
  %81 = load %struct.quantum_reg_struct** %2, align 8
  %82 = getelementptr inbounds %struct.quantum_reg_struct* %81, i32 0, i32 3
  %83 = load %struct.quantum_reg_node_struct** %82, align 8
  %84 = getelementptr inbounds %struct.quantum_reg_node_struct* %83, i64 %80
  %85 = getelementptr inbounds %struct.quantum_reg_node_struct* %84, i32 0, i32 1
  %86 = load i64* %85, align 8
  %87 = load i32* %1, align 4
  %88 = zext i32 %87 to i64
  %89 = shl i64 1, %88
  %90 = xor i64 %86, %89
  %91 = load %struct.quantum_reg_struct** %2, align 8
  %92 = call i32 @quantum_get_state(i64 %90, %struct.quantum_reg_struct* byval align 8 %91)
  store i32 %92, i32* %j, align 4
  %93 = load i32* %j, align 4
  %94 = icmp eq i32 %93, -1
  br i1 %94, label %95, label %160

; <label>:95                                      ; preds = %78
  %96 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %97 = load { float, float }** %96, align 8
  %98 = getelementptr inbounds { float, float }* %97, i64 1
  %99 = getelementptr inbounds { float, float }* %98, i32 0, i32 0
  %100 = load float* %99, align 4
  %101 = getelementptr inbounds { float, float }* %98, i32 0, i32 1
  %102 = load float* %101, align 4
  %103 = getelementptr inbounds { float, float }* %3, i32 0, i32 0
  %104 = getelementptr inbounds { float, float }* %3, i32 0, i32 1
  store float %100, float* %103, align 4
  store float %102, float* %104, align 4
  %105 = bitcast { float, float }* %3 to <2 x float>*
  %106 = load <2 x float>* %105, align 1
  %107 = call float @quantum_prob_inline(<2 x float> %106)
  %108 = fpext float %107 to double
  %109 = fcmp ogt double %108, 1.000000e-09
  br i1 %109, label %110, label %127

; <label>:110                                     ; preds = %95
  %111 = load i32* %i, align 4
  %112 = sext i32 %111 to i64
  %113 = load %struct.quantum_reg_struct** %2, align 8
  %114 = getelementptr inbounds %struct.quantum_reg_struct* %113, i32 0, i32 3
  %115 = load %struct.quantum_reg_node_struct** %114, align 8
  %116 = getelementptr inbounds %struct.quantum_reg_node_struct* %115, i64 %112
  %117 = getelementptr inbounds %struct.quantum_reg_node_struct* %116, i32 0, i32 1
  %118 = load i64* %117, align 8
  %119 = load i32* %1, align 4
  %120 = zext i32 %119 to i64
  %121 = shl i64 1, %120
  %122 = and i64 %118, %121
  %123 = icmp ne i64 %122, 0
  br i1 %123, label %124, label %127

; <label>:124                                     ; preds = %110
  %125 = load i32* %addsize, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %addsize, align 4
  br label %127

; <label>:127                                     ; preds = %124, %110, %95
  %128 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %129 = load { float, float }** %128, align 8
  %130 = getelementptr inbounds { float, float }* %129, i64 2
  %131 = getelementptr inbounds { float, float }* %130, i32 0, i32 0
  %132 = load float* %131, align 4
  %133 = getelementptr inbounds { float, float }* %130, i32 0, i32 1
  %134 = load float* %133, align 4
  %135 = getelementptr inbounds { float, float }* %4, i32 0, i32 0
  %136 = getelementptr inbounds { float, float }* %4, i32 0, i32 1
  store float %132, float* %135, align 4
  store float %134, float* %136, align 4
  %137 = bitcast { float, float }* %4 to <2 x float>*
  %138 = load <2 x float>* %137, align 1
  %139 = call float @quantum_prob_inline(<2 x float> %138)
  %140 = fpext float %139 to double
  %141 = fcmp ogt double %140, 1.000000e-09
  br i1 %141, label %142, label %159

; <label>:142                                     ; preds = %127
  %143 = load i32* %i, align 4
  %144 = sext i32 %143 to i64
  %145 = load %struct.quantum_reg_struct** %2, align 8
  %146 = getelementptr inbounds %struct.quantum_reg_struct* %145, i32 0, i32 3
  %147 = load %struct.quantum_reg_node_struct** %146, align 8
  %148 = getelementptr inbounds %struct.quantum_reg_node_struct* %147, i64 %144
  %149 = getelementptr inbounds %struct.quantum_reg_node_struct* %148, i32 0, i32 1
  %150 = load i64* %149, align 8
  %151 = load i32* %1, align 4
  %152 = zext i32 %151 to i64
  %153 = shl i64 1, %152
  %154 = and i64 %150, %153
  %155 = icmp ne i64 %154, 0
  br i1 %155, label %159, label %156

; <label>:156                                     ; preds = %142
  %157 = load i32* %addsize, align 4
  %158 = add nsw i32 %157, 1
  store i32 %158, i32* %addsize, align 4
  br label %159

; <label>:159                                     ; preds = %156, %142, %127
  br label %160

; <label>:160                                     ; preds = %159, %78
  br label %161

; <label>:161                                     ; preds = %160
  %162 = load i32* %i, align 4
  %163 = add nsw i32 %162, 1
  store i32 %163, i32* %i, align 4
  br label %72

; <label>:164                                     ; preds = %72
  %165 = load %struct.quantum_reg_struct** %2, align 8
  %166 = getelementptr inbounds %struct.quantum_reg_struct* %165, i32 0, i32 3
  %167 = load %struct.quantum_reg_node_struct** %166, align 8
  %168 = bitcast %struct.quantum_reg_node_struct* %167 to i8*
  %169 = load %struct.quantum_reg_struct** %2, align 8
  %170 = getelementptr inbounds %struct.quantum_reg_struct* %169, i32 0, i32 1
  %171 = load i32* %170, align 4
  %172 = load i32* %addsize, align 4
  %173 = add nsw i32 %171, %172
  %174 = sext i32 %173 to i64
  %175 = mul i64 %174, 16
  %176 = call i8* @realloc(i8* %168, i64 %175) #4
  %177 = bitcast i8* %176 to %struct.quantum_reg_node_struct*
  %178 = load %struct.quantum_reg_struct** %2, align 8
  %179 = getelementptr inbounds %struct.quantum_reg_struct* %178, i32 0, i32 3
  store %struct.quantum_reg_node_struct* %177, %struct.quantum_reg_node_struct** %179, align 8
  %180 = load %struct.quantum_reg_struct** %2, align 8
  %181 = getelementptr inbounds %struct.quantum_reg_struct* %180, i32 0, i32 3
  %182 = load %struct.quantum_reg_node_struct** %181, align 8
  %183 = icmp ne %struct.quantum_reg_node_struct* %182, null
  br i1 %183, label %191, label %184

; <label>:184                                     ; preds = %164
  %185 = load %struct.quantum_reg_struct** %2, align 8
  %186 = getelementptr inbounds %struct.quantum_reg_struct* %185, i32 0, i32 1
  %187 = load i32* %186, align 4
  %188 = load i32* %addsize, align 4
  %189 = add nsw i32 %187, %188
  %190 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i32 0, i32 0), i32 %189)
  call void @exit(i32 1) #6
  unreachable

; <label>:191                                     ; preds = %164
  %192 = load i32* %addsize, align 4
  %193 = sext i32 %192 to i64
  %194 = mul i64 %193, 16
  %195 = call i64 @quantum_memman(i64 %194)
  store i32 0, i32* %i, align 4
  br label %196

; <label>:196                                     ; preds = %225, %191
  %197 = load i32* %i, align 4
  %198 = load i32* %addsize, align 4
  %199 = icmp slt i32 %197, %198
  br i1 %199, label %200, label %228

; <label>:200                                     ; preds = %196
  %201 = load i32* %i, align 4
  %202 = load %struct.quantum_reg_struct** %2, align 8
  %203 = getelementptr inbounds %struct.quantum_reg_struct* %202, i32 0, i32 1
  %204 = load i32* %203, align 4
  %205 = add nsw i32 %201, %204
  %206 = sext i32 %205 to i64
  %207 = load %struct.quantum_reg_struct** %2, align 8
  %208 = getelementptr inbounds %struct.quantum_reg_struct* %207, i32 0, i32 3
  %209 = load %struct.quantum_reg_node_struct** %208, align 8
  %210 = getelementptr inbounds %struct.quantum_reg_node_struct* %209, i64 %206
  %211 = getelementptr inbounds %struct.quantum_reg_node_struct* %210, i32 0, i32 1
  store i64 0, i64* %211, align 8
  %212 = load i32* %i, align 4
  %213 = load %struct.quantum_reg_struct** %2, align 8
  %214 = getelementptr inbounds %struct.quantum_reg_struct* %213, i32 0, i32 1
  %215 = load i32* %214, align 4
  %216 = add nsw i32 %212, %215
  %217 = sext i32 %216 to i64
  %218 = load %struct.quantum_reg_struct** %2, align 8
  %219 = getelementptr inbounds %struct.quantum_reg_struct* %218, i32 0, i32 3
  %220 = load %struct.quantum_reg_node_struct** %219, align 8
  %221 = getelementptr inbounds %struct.quantum_reg_node_struct* %220, i64 %217
  %222 = getelementptr inbounds %struct.quantum_reg_node_struct* %221, i32 0, i32 0
  %223 = getelementptr inbounds { float, float }* %222, i32 0, i32 0
  %224 = getelementptr inbounds { float, float }* %222, i32 0, i32 1
  store float 0.000000e+00, float* %223, align 4
  store float 0.000000e+00, float* %224, align 4
  br label %225

; <label>:225                                     ; preds = %200
  %226 = load i32* %i, align 4
  %227 = add nsw i32 %226, 1
  store i32 %227, i32* %i, align 4
  br label %196

; <label>:228                                     ; preds = %196
  %229 = load %struct.quantum_reg_struct** %2, align 8
  %230 = getelementptr inbounds %struct.quantum_reg_struct* %229, i32 0, i32 1
  %231 = load i32* %230, align 4
  %232 = load i32* %addsize, align 4
  %233 = add nsw i32 %231, %232
  %234 = sext i32 %233 to i64
  %235 = call noalias i8* @calloc(i64 %234, i64 1) #4
  store i8* %235, i8** %done, align 8
  %236 = load i8** %done, align 8
  %237 = icmp ne i8* %236, null
  br i1 %237, label %247, label %238

; <label>:238                                     ; preds = %228
  %239 = load %struct.quantum_reg_struct** %2, align 8
  %240 = getelementptr inbounds %struct.quantum_reg_struct* %239, i32 0, i32 1
  %241 = load i32* %240, align 4
  %242 = load i32* %addsize, align 4
  %243 = add nsw i32 %241, %242
  %244 = sext i32 %243 to i64
  %245 = mul i64 %244, 1
  %246 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str3, i32 0, i32 0), i64 %245)
  call void @exit(i32 1) #6
  unreachable

; <label>:247                                     ; preds = %228
  %248 = load %struct.quantum_reg_struct** %2, align 8
  %249 = getelementptr inbounds %struct.quantum_reg_struct* %248, i32 0, i32 1
  %250 = load i32* %249, align 4
  %251 = sext i32 %250 to i64
  %252 = load i32* %addsize, align 4
  %253 = sext i32 %252 to i64
  %254 = mul i64 %253, 1
  %255 = add i64 %251, %254
  %256 = call i64 @quantum_memman(i64 %255)
  %257 = load %struct.quantum_reg_struct** %2, align 8
  %258 = getelementptr inbounds %struct.quantum_reg_struct* %257, i32 0, i32 1
  %259 = load i32* %258, align 4
  store i32 %259, i32* %k, align 4
  %260 = load %struct.quantum_reg_struct** %2, align 8
  %261 = getelementptr inbounds %struct.quantum_reg_struct* %260, i32 0, i32 0
  %262 = load i32* %261, align 4
  %263 = zext i32 %262 to i64
  %264 = shl i64 1, %263
  %265 = uitofp i64 %264 to double
  %266 = fdiv double 1.000000e+00, %265
  %267 = fdiv double %266, 1.000000e+06
  %268 = fptrunc double %267 to float
  store float %268, float* %limit, align 4
  store i32 0, i32* %i, align 4
  br label %269

; <label>:269                                     ; preds = %792, %247
  %270 = load i32* %i, align 4
  %271 = load %struct.quantum_reg_struct** %2, align 8
  %272 = getelementptr inbounds %struct.quantum_reg_struct* %271, i32 0, i32 1
  %273 = load i32* %272, align 4
  %274 = icmp slt i32 %270, %273
  br i1 %274, label %275, label %795

; <label>:275                                     ; preds = %269
  %276 = load i32* %i, align 4
  %277 = sext i32 %276 to i64
  %278 = load i8** %done, align 8
  %279 = getelementptr inbounds i8* %278, i64 %277
  %280 = load i8* %279, align 1
  %281 = icmp ne i8 %280, 0
  br i1 %281, label %791, label %282

; <label>:282                                     ; preds = %275
  %283 = load i32* %i, align 4
  %284 = sext i32 %283 to i64
  %285 = load %struct.quantum_reg_struct** %2, align 8
  %286 = getelementptr inbounds %struct.quantum_reg_struct* %285, i32 0, i32 3
  %287 = load %struct.quantum_reg_node_struct** %286, align 8
  %288 = getelementptr inbounds %struct.quantum_reg_node_struct* %287, i64 %284
  %289 = getelementptr inbounds %struct.quantum_reg_node_struct* %288, i32 0, i32 1
  %290 = load i64* %289, align 8
  %291 = load i32* %1, align 4
  %292 = zext i32 %291 to i64
  %293 = shl i64 1, %292
  %294 = and i64 %290, %293
  %295 = trunc i64 %294 to i32
  store i32 %295, i32* %iset, align 4
  %296 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %297 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  store float 0.000000e+00, float* %296, align 4
  store float 0.000000e+00, float* %297, align 4
  %298 = load i32* %i, align 4
  %299 = sext i32 %298 to i64
  %300 = load %struct.quantum_reg_struct** %2, align 8
  %301 = getelementptr inbounds %struct.quantum_reg_struct* %300, i32 0, i32 3
  %302 = load %struct.quantum_reg_node_struct** %301, align 8
  %303 = getelementptr inbounds %struct.quantum_reg_node_struct* %302, i64 %299
  %304 = getelementptr inbounds %struct.quantum_reg_node_struct* %303, i32 0, i32 1
  %305 = load i64* %304, align 8
  %306 = load i32* %1, align 4
  %307 = zext i32 %306 to i64
  %308 = shl i64 1, %307
  %309 = xor i64 %305, %308
  %310 = load %struct.quantum_reg_struct** %2, align 8
  %311 = call i32 @quantum_get_state(i64 %309, %struct.quantum_reg_struct* byval align 8 %310)
  store i32 %311, i32* %j, align 4
  %312 = load i32* %i, align 4
  %313 = sext i32 %312 to i64
  %314 = load %struct.quantum_reg_struct** %2, align 8
  %315 = getelementptr inbounds %struct.quantum_reg_struct* %314, i32 0, i32 3
  %316 = load %struct.quantum_reg_node_struct** %315, align 8
  %317 = getelementptr inbounds %struct.quantum_reg_node_struct* %316, i64 %313
  %318 = getelementptr inbounds %struct.quantum_reg_node_struct* %317, i32 0, i32 0
  %319 = getelementptr inbounds { float, float }* %318, i32 0, i32 0
  %320 = load float* %319, align 4
  %321 = getelementptr inbounds { float, float }* %318, i32 0, i32 1
  %322 = load float* %321, align 4
  %323 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %324 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  store float %320, float* %323, align 4
  store float %322, float* %324, align 4
  %325 = load i32* %j, align 4
  %326 = icmp sge i32 %325, 0
  br i1 %326, label %327, label %341

; <label>:327                                     ; preds = %282
  %328 = load i32* %j, align 4
  %329 = sext i32 %328 to i64
  %330 = load %struct.quantum_reg_struct** %2, align 8
  %331 = getelementptr inbounds %struct.quantum_reg_struct* %330, i32 0, i32 3
  %332 = load %struct.quantum_reg_node_struct** %331, align 8
  %333 = getelementptr inbounds %struct.quantum_reg_node_struct* %332, i64 %329
  %334 = getelementptr inbounds %struct.quantum_reg_node_struct* %333, i32 0, i32 0
  %335 = getelementptr inbounds { float, float }* %334, i32 0, i32 0
  %336 = load float* %335, align 4
  %337 = getelementptr inbounds { float, float }* %334, i32 0, i32 1
  %338 = load float* %337, align 4
  %339 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %340 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  store float %336, float* %339, align 4
  store float %338, float* %340, align 4
  br label %341

; <label>:341                                     ; preds = %327, %282
  %342 = load i32* %iset, align 4
  %343 = icmp ne i32 %342, 0
  br i1 %343, label %344, label %416

; <label>:344                                     ; preds = %341
  %345 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %346 = load { float, float }** %345, align 8
  %347 = getelementptr inbounds { float, float }* %346, i64 2
  %348 = getelementptr inbounds { float, float }* %347, i32 0, i32 0
  %349 = load float* %348, align 4
  %350 = getelementptr inbounds { float, float }* %347, i32 0, i32 1
  %351 = load float* %350, align 4
  %352 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %353 = load float* %352, align 4
  %354 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %355 = load float* %354, align 4
  %356 = fmul float %349, %353
  %357 = fmul float %351, %355
  %358 = fmul float %349, %355
  %359 = fmul float %351, %353
  %360 = fsub float %356, %357
  %361 = fadd float %358, %359
  %362 = fcmp uno float %360, %360
  br i1 %362, label %363, label %372, !prof !1

; <label>:363                                     ; preds = %344
  %364 = fcmp uno float %361, %361
  br i1 %364, label %365, label %372, !prof !1

; <label>:365                                     ; preds = %363
  %366 = call <2 x float> @__mulsc3(float %349, float %351, float %353, float %355) #4
  %367 = bitcast { float, float }* %5 to <2 x float>*
  store <2 x float> %366, <2 x float>* %367, align 1
  %368 = getelementptr inbounds { float, float }* %5, i32 0, i32 0
  %369 = load float* %368, align 4
  %370 = getelementptr inbounds { float, float }* %5, i32 0, i32 1
  %371 = load float* %370, align 4
  br label %372

; <label>:372                                     ; preds = %365, %363, %344
  %373 = phi float [ %360, %344 ], [ %360, %363 ], [ %369, %365 ]
  %374 = phi float [ %361, %344 ], [ %361, %363 ], [ %371, %365 ]
  %375 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %376 = load { float, float }** %375, align 8
  %377 = getelementptr inbounds { float, float }* %376, i64 3
  %378 = getelementptr inbounds { float, float }* %377, i32 0, i32 0
  %379 = load float* %378, align 4
  %380 = getelementptr inbounds { float, float }* %377, i32 0, i32 1
  %381 = load float* %380, align 4
  %382 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %383 = load float* %382, align 4
  %384 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %385 = load float* %384, align 4
  %386 = fmul float %379, %383
  %387 = fmul float %381, %385
  %388 = fmul float %379, %385
  %389 = fmul float %381, %383
  %390 = fsub float %386, %387
  %391 = fadd float %388, %389
  %392 = fcmp uno float %390, %390
  br i1 %392, label %393, label %402, !prof !1

; <label>:393                                     ; preds = %372
  %394 = fcmp uno float %391, %391
  br i1 %394, label %395, label %402, !prof !1

; <label>:395                                     ; preds = %393
  %396 = call <2 x float> @__mulsc3(float %379, float %381, float %383, float %385) #4
  %397 = bitcast { float, float }* %6 to <2 x float>*
  store <2 x float> %396, <2 x float>* %397, align 1
  %398 = getelementptr inbounds { float, float }* %6, i32 0, i32 0
  %399 = load float* %398, align 4
  %400 = getelementptr inbounds { float, float }* %6, i32 0, i32 1
  %401 = load float* %400, align 4
  br label %402

; <label>:402                                     ; preds = %395, %393, %372
  %403 = phi float [ %390, %372 ], [ %390, %393 ], [ %399, %395 ]
  %404 = phi float [ %391, %372 ], [ %391, %393 ], [ %401, %395 ]
  %405 = fadd float %373, %403
  %406 = fadd float %374, %404
  %407 = load i32* %i, align 4
  %408 = sext i32 %407 to i64
  %409 = load %struct.quantum_reg_struct** %2, align 8
  %410 = getelementptr inbounds %struct.quantum_reg_struct* %409, i32 0, i32 3
  %411 = load %struct.quantum_reg_node_struct** %410, align 8
  %412 = getelementptr inbounds %struct.quantum_reg_node_struct* %411, i64 %408
  %413 = getelementptr inbounds %struct.quantum_reg_node_struct* %412, i32 0, i32 0
  %414 = getelementptr inbounds { float, float }* %413, i32 0, i32 0
  %415 = getelementptr inbounds { float, float }* %413, i32 0, i32 1
  store float %405, float* %414, align 4
  store float %406, float* %415, align 4
  br label %488

; <label>:416                                     ; preds = %341
  %417 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %418 = load { float, float }** %417, align 8
  %419 = getelementptr inbounds { float, float }* %418, i64 0
  %420 = getelementptr inbounds { float, float }* %419, i32 0, i32 0
  %421 = load float* %420, align 4
  %422 = getelementptr inbounds { float, float }* %419, i32 0, i32 1
  %423 = load float* %422, align 4
  %424 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %425 = load float* %424, align 4
  %426 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %427 = load float* %426, align 4
  %428 = fmul float %421, %425
  %429 = fmul float %423, %427
  %430 = fmul float %421, %427
  %431 = fmul float %423, %425
  %432 = fsub float %428, %429
  %433 = fadd float %430, %431
  %434 = fcmp uno float %432, %432
  br i1 %434, label %435, label %444, !prof !1

; <label>:435                                     ; preds = %416
  %436 = fcmp uno float %433, %433
  br i1 %436, label %437, label %444, !prof !1

; <label>:437                                     ; preds = %435
  %438 = call <2 x float> @__mulsc3(float %421, float %423, float %425, float %427) #4
  %439 = bitcast { float, float }* %7 to <2 x float>*
  store <2 x float> %438, <2 x float>* %439, align 1
  %440 = getelementptr inbounds { float, float }* %7, i32 0, i32 0
  %441 = load float* %440, align 4
  %442 = getelementptr inbounds { float, float }* %7, i32 0, i32 1
  %443 = load float* %442, align 4
  br label %444

; <label>:444                                     ; preds = %437, %435, %416
  %445 = phi float [ %432, %416 ], [ %432, %435 ], [ %441, %437 ]
  %446 = phi float [ %433, %416 ], [ %433, %435 ], [ %443, %437 ]
  %447 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %448 = load { float, float }** %447, align 8
  %449 = getelementptr inbounds { float, float }* %448, i64 1
  %450 = getelementptr inbounds { float, float }* %449, i32 0, i32 0
  %451 = load float* %450, align 4
  %452 = getelementptr inbounds { float, float }* %449, i32 0, i32 1
  %453 = load float* %452, align 4
  %454 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %455 = load float* %454, align 4
  %456 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %457 = load float* %456, align 4
  %458 = fmul float %451, %455
  %459 = fmul float %453, %457
  %460 = fmul float %451, %457
  %461 = fmul float %453, %455
  %462 = fsub float %458, %459
  %463 = fadd float %460, %461
  %464 = fcmp uno float %462, %462
  br i1 %464, label %465, label %474, !prof !1

; <label>:465                                     ; preds = %444
  %466 = fcmp uno float %463, %463
  br i1 %466, label %467, label %474, !prof !1

; <label>:467                                     ; preds = %465
  %468 = call <2 x float> @__mulsc3(float %451, float %453, float %455, float %457) #4
  %469 = bitcast { float, float }* %8 to <2 x float>*
  store <2 x float> %468, <2 x float>* %469, align 1
  %470 = getelementptr inbounds { float, float }* %8, i32 0, i32 0
  %471 = load float* %470, align 4
  %472 = getelementptr inbounds { float, float }* %8, i32 0, i32 1
  %473 = load float* %472, align 4
  br label %474

; <label>:474                                     ; preds = %467, %465, %444
  %475 = phi float [ %462, %444 ], [ %462, %465 ], [ %471, %467 ]
  %476 = phi float [ %463, %444 ], [ %463, %465 ], [ %473, %467 ]
  %477 = fadd float %445, %475
  %478 = fadd float %446, %476
  %479 = load i32* %i, align 4
  %480 = sext i32 %479 to i64
  %481 = load %struct.quantum_reg_struct** %2, align 8
  %482 = getelementptr inbounds %struct.quantum_reg_struct* %481, i32 0, i32 3
  %483 = load %struct.quantum_reg_node_struct** %482, align 8
  %484 = getelementptr inbounds %struct.quantum_reg_node_struct* %483, i64 %480
  %485 = getelementptr inbounds %struct.quantum_reg_node_struct* %484, i32 0, i32 0
  %486 = getelementptr inbounds { float, float }* %485, i32 0, i32 0
  %487 = getelementptr inbounds { float, float }* %485, i32 0, i32 1
  store float %477, float* %486, align 4
  store float %478, float* %487, align 4
  br label %488

; <label>:488                                     ; preds = %474, %402
  %489 = load i32* %j, align 4
  %490 = icmp sge i32 %489, 0
  br i1 %490, label %491, label %639

; <label>:491                                     ; preds = %488
  %492 = load i32* %iset, align 4
  %493 = icmp ne i32 %492, 0
  br i1 %493, label %494, label %566

; <label>:494                                     ; preds = %491
  %495 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %496 = load { float, float }** %495, align 8
  %497 = getelementptr inbounds { float, float }* %496, i64 0
  %498 = getelementptr inbounds { float, float }* %497, i32 0, i32 0
  %499 = load float* %498, align 4
  %500 = getelementptr inbounds { float, float }* %497, i32 0, i32 1
  %501 = load float* %500, align 4
  %502 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %503 = load float* %502, align 4
  %504 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %505 = load float* %504, align 4
  %506 = fmul float %499, %503
  %507 = fmul float %501, %505
  %508 = fmul float %499, %505
  %509 = fmul float %501, %503
  %510 = fsub float %506, %507
  %511 = fadd float %508, %509
  %512 = fcmp uno float %510, %510
  br i1 %512, label %513, label %522, !prof !1

; <label>:513                                     ; preds = %494
  %514 = fcmp uno float %511, %511
  br i1 %514, label %515, label %522, !prof !1

; <label>:515                                     ; preds = %513
  %516 = call <2 x float> @__mulsc3(float %499, float %501, float %503, float %505) #4
  %517 = bitcast { float, float }* %9 to <2 x float>*
  store <2 x float> %516, <2 x float>* %517, align 1
  %518 = getelementptr inbounds { float, float }* %9, i32 0, i32 0
  %519 = load float* %518, align 4
  %520 = getelementptr inbounds { float, float }* %9, i32 0, i32 1
  %521 = load float* %520, align 4
  br label %522

; <label>:522                                     ; preds = %515, %513, %494
  %523 = phi float [ %510, %494 ], [ %510, %513 ], [ %519, %515 ]
  %524 = phi float [ %511, %494 ], [ %511, %513 ], [ %521, %515 ]
  %525 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %526 = load { float, float }** %525, align 8
  %527 = getelementptr inbounds { float, float }* %526, i64 1
  %528 = getelementptr inbounds { float, float }* %527, i32 0, i32 0
  %529 = load float* %528, align 4
  %530 = getelementptr inbounds { float, float }* %527, i32 0, i32 1
  %531 = load float* %530, align 4
  %532 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %533 = load float* %532, align 4
  %534 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %535 = load float* %534, align 4
  %536 = fmul float %529, %533
  %537 = fmul float %531, %535
  %538 = fmul float %529, %535
  %539 = fmul float %531, %533
  %540 = fsub float %536, %537
  %541 = fadd float %538, %539
  %542 = fcmp uno float %540, %540
  br i1 %542, label %543, label %552, !prof !1

; <label>:543                                     ; preds = %522
  %544 = fcmp uno float %541, %541
  br i1 %544, label %545, label %552, !prof !1

; <label>:545                                     ; preds = %543
  %546 = call <2 x float> @__mulsc3(float %529, float %531, float %533, float %535) #4
  %547 = bitcast { float, float }* %10 to <2 x float>*
  store <2 x float> %546, <2 x float>* %547, align 1
  %548 = getelementptr inbounds { float, float }* %10, i32 0, i32 0
  %549 = load float* %548, align 4
  %550 = getelementptr inbounds { float, float }* %10, i32 0, i32 1
  %551 = load float* %550, align 4
  br label %552

; <label>:552                                     ; preds = %545, %543, %522
  %553 = phi float [ %540, %522 ], [ %540, %543 ], [ %549, %545 ]
  %554 = phi float [ %541, %522 ], [ %541, %543 ], [ %551, %545 ]
  %555 = fadd float %523, %553
  %556 = fadd float %524, %554
  %557 = load i32* %j, align 4
  %558 = sext i32 %557 to i64
  %559 = load %struct.quantum_reg_struct** %2, align 8
  %560 = getelementptr inbounds %struct.quantum_reg_struct* %559, i32 0, i32 3
  %561 = load %struct.quantum_reg_node_struct** %560, align 8
  %562 = getelementptr inbounds %struct.quantum_reg_node_struct* %561, i64 %558
  %563 = getelementptr inbounds %struct.quantum_reg_node_struct* %562, i32 0, i32 0
  %564 = getelementptr inbounds { float, float }* %563, i32 0, i32 0
  %565 = getelementptr inbounds { float, float }* %563, i32 0, i32 1
  store float %555, float* %564, align 4
  store float %556, float* %565, align 4
  br label %638

; <label>:566                                     ; preds = %491
  %567 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %568 = load { float, float }** %567, align 8
  %569 = getelementptr inbounds { float, float }* %568, i64 2
  %570 = getelementptr inbounds { float, float }* %569, i32 0, i32 0
  %571 = load float* %570, align 4
  %572 = getelementptr inbounds { float, float }* %569, i32 0, i32 1
  %573 = load float* %572, align 4
  %574 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %575 = load float* %574, align 4
  %576 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %577 = load float* %576, align 4
  %578 = fmul float %571, %575
  %579 = fmul float %573, %577
  %580 = fmul float %571, %577
  %581 = fmul float %573, %575
  %582 = fsub float %578, %579
  %583 = fadd float %580, %581
  %584 = fcmp uno float %582, %582
  br i1 %584, label %585, label %594, !prof !1

; <label>:585                                     ; preds = %566
  %586 = fcmp uno float %583, %583
  br i1 %586, label %587, label %594, !prof !1

; <label>:587                                     ; preds = %585
  %588 = call <2 x float> @__mulsc3(float %571, float %573, float %575, float %577) #4
  %589 = bitcast { float, float }* %11 to <2 x float>*
  store <2 x float> %588, <2 x float>* %589, align 1
  %590 = getelementptr inbounds { float, float }* %11, i32 0, i32 0
  %591 = load float* %590, align 4
  %592 = getelementptr inbounds { float, float }* %11, i32 0, i32 1
  %593 = load float* %592, align 4
  br label %594

; <label>:594                                     ; preds = %587, %585, %566
  %595 = phi float [ %582, %566 ], [ %582, %585 ], [ %591, %587 ]
  %596 = phi float [ %583, %566 ], [ %583, %585 ], [ %593, %587 ]
  %597 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %598 = load { float, float }** %597, align 8
  %599 = getelementptr inbounds { float, float }* %598, i64 3
  %600 = getelementptr inbounds { float, float }* %599, i32 0, i32 0
  %601 = load float* %600, align 4
  %602 = getelementptr inbounds { float, float }* %599, i32 0, i32 1
  %603 = load float* %602, align 4
  %604 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %605 = load float* %604, align 4
  %606 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %607 = load float* %606, align 4
  %608 = fmul float %601, %605
  %609 = fmul float %603, %607
  %610 = fmul float %601, %607
  %611 = fmul float %603, %605
  %612 = fsub float %608, %609
  %613 = fadd float %610, %611
  %614 = fcmp uno float %612, %612
  br i1 %614, label %615, label %624, !prof !1

; <label>:615                                     ; preds = %594
  %616 = fcmp uno float %613, %613
  br i1 %616, label %617, label %624, !prof !1

; <label>:617                                     ; preds = %615
  %618 = call <2 x float> @__mulsc3(float %601, float %603, float %605, float %607) #4
  %619 = bitcast { float, float }* %12 to <2 x float>*
  store <2 x float> %618, <2 x float>* %619, align 1
  %620 = getelementptr inbounds { float, float }* %12, i32 0, i32 0
  %621 = load float* %620, align 4
  %622 = getelementptr inbounds { float, float }* %12, i32 0, i32 1
  %623 = load float* %622, align 4
  br label %624

; <label>:624                                     ; preds = %617, %615, %594
  %625 = phi float [ %612, %594 ], [ %612, %615 ], [ %621, %617 ]
  %626 = phi float [ %613, %594 ], [ %613, %615 ], [ %623, %617 ]
  %627 = fadd float %595, %625
  %628 = fadd float %596, %626
  %629 = load i32* %j, align 4
  %630 = sext i32 %629 to i64
  %631 = load %struct.quantum_reg_struct** %2, align 8
  %632 = getelementptr inbounds %struct.quantum_reg_struct* %631, i32 0, i32 3
  %633 = load %struct.quantum_reg_node_struct** %632, align 8
  %634 = getelementptr inbounds %struct.quantum_reg_node_struct* %633, i64 %630
  %635 = getelementptr inbounds %struct.quantum_reg_node_struct* %634, i32 0, i32 0
  %636 = getelementptr inbounds { float, float }* %635, i32 0, i32 0
  %637 = getelementptr inbounds { float, float }* %635, i32 0, i32 1
  store float %627, float* %636, align 4
  store float %628, float* %637, align 4
  br label %638

; <label>:638                                     ; preds = %624, %552
  br label %782

; <label>:639                                     ; preds = %488
  %640 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %641 = load { float, float }** %640, align 8
  %642 = getelementptr inbounds { float, float }* %641, i64 1
  %643 = getelementptr inbounds { float, float }* %642, i32 0, i32 0
  %644 = load float* %643, align 4
  %645 = getelementptr inbounds { float, float }* %642, i32 0, i32 1
  %646 = load float* %645, align 4
  %647 = getelementptr inbounds { float, float }* %13, i32 0, i32 0
  %648 = getelementptr inbounds { float, float }* %13, i32 0, i32 1
  store float %644, float* %647, align 4
  store float %646, float* %648, align 4
  %649 = bitcast { float, float }* %13 to <2 x float>*
  %650 = load <2 x float>* %649, align 1
  %651 = call float @quantum_prob_inline(<2 x float> %650)
  %652 = fpext float %651 to double
  %653 = fcmp olt double %652, 1.000000e-09
  br i1 %653, label %654, label %658

; <label>:654                                     ; preds = %639
  %655 = load i32* %iset, align 4
  %656 = icmp ne i32 %655, 0
  br i1 %656, label %657, label %658

; <label>:657                                     ; preds = %654
  br label %795

; <label>:658                                     ; preds = %654, %639
  %659 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %660 = load { float, float }** %659, align 8
  %661 = getelementptr inbounds { float, float }* %660, i64 2
  %662 = getelementptr inbounds { float, float }* %661, i32 0, i32 0
  %663 = load float* %662, align 4
  %664 = getelementptr inbounds { float, float }* %661, i32 0, i32 1
  %665 = load float* %664, align 4
  %666 = getelementptr inbounds { float, float }* %14, i32 0, i32 0
  %667 = getelementptr inbounds { float, float }* %14, i32 0, i32 1
  store float %663, float* %666, align 4
  store float %665, float* %667, align 4
  %668 = bitcast { float, float }* %14 to <2 x float>*
  %669 = load <2 x float>* %668, align 1
  %670 = call float @quantum_prob_inline(<2 x float> %669)
  %671 = fpext float %670 to double
  %672 = fcmp olt double %671, 1.000000e-09
  br i1 %672, label %673, label %677

; <label>:673                                     ; preds = %658
  %674 = load i32* %iset, align 4
  %675 = icmp ne i32 %674, 0
  br i1 %675, label %677, label %676

; <label>:676                                     ; preds = %673
  br label %795

; <label>:677                                     ; preds = %673, %658
  %678 = load i32* %i, align 4
  %679 = sext i32 %678 to i64
  %680 = load %struct.quantum_reg_struct** %2, align 8
  %681 = getelementptr inbounds %struct.quantum_reg_struct* %680, i32 0, i32 3
  %682 = load %struct.quantum_reg_node_struct** %681, align 8
  %683 = getelementptr inbounds %struct.quantum_reg_node_struct* %682, i64 %679
  %684 = getelementptr inbounds %struct.quantum_reg_node_struct* %683, i32 0, i32 1
  %685 = load i64* %684, align 8
  %686 = load i32* %1, align 4
  %687 = zext i32 %686 to i64
  %688 = shl i64 1, %687
  %689 = xor i64 %685, %688
  %690 = load i32* %k, align 4
  %691 = sext i32 %690 to i64
  %692 = load %struct.quantum_reg_struct** %2, align 8
  %693 = getelementptr inbounds %struct.quantum_reg_struct* %692, i32 0, i32 3
  %694 = load %struct.quantum_reg_node_struct** %693, align 8
  %695 = getelementptr inbounds %struct.quantum_reg_node_struct* %694, i64 %691
  %696 = getelementptr inbounds %struct.quantum_reg_node_struct* %695, i32 0, i32 1
  store i64 %689, i64* %696, align 8
  %697 = load i32* %iset, align 4
  %698 = icmp ne i32 %697, 0
  br i1 %698, label %699, label %739

; <label>:699                                     ; preds = %677
  %700 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %701 = load { float, float }** %700, align 8
  %702 = getelementptr inbounds { float, float }* %701, i64 1
  %703 = getelementptr inbounds { float, float }* %702, i32 0, i32 0
  %704 = load float* %703, align 4
  %705 = getelementptr inbounds { float, float }* %702, i32 0, i32 1
  %706 = load float* %705, align 4
  %707 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %708 = load float* %707, align 4
  %709 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %710 = load float* %709, align 4
  %711 = fmul float %704, %708
  %712 = fmul float %706, %710
  %713 = fmul float %704, %710
  %714 = fmul float %706, %708
  %715 = fsub float %711, %712
  %716 = fadd float %713, %714
  %717 = fcmp uno float %715, %715
  br i1 %717, label %718, label %727, !prof !1

; <label>:718                                     ; preds = %699
  %719 = fcmp uno float %716, %716
  br i1 %719, label %720, label %727, !prof !1

; <label>:720                                     ; preds = %718
  %721 = call <2 x float> @__mulsc3(float %704, float %706, float %708, float %710) #4
  %722 = bitcast { float, float }* %15 to <2 x float>*
  store <2 x float> %721, <2 x float>* %722, align 1
  %723 = getelementptr inbounds { float, float }* %15, i32 0, i32 0
  %724 = load float* %723, align 4
  %725 = getelementptr inbounds { float, float }* %15, i32 0, i32 1
  %726 = load float* %725, align 4
  br label %727

; <label>:727                                     ; preds = %720, %718, %699
  %728 = phi float [ %715, %699 ], [ %715, %718 ], [ %724, %720 ]
  %729 = phi float [ %716, %699 ], [ %716, %718 ], [ %726, %720 ]
  %730 = load i32* %k, align 4
  %731 = sext i32 %730 to i64
  %732 = load %struct.quantum_reg_struct** %2, align 8
  %733 = getelementptr inbounds %struct.quantum_reg_struct* %732, i32 0, i32 3
  %734 = load %struct.quantum_reg_node_struct** %733, align 8
  %735 = getelementptr inbounds %struct.quantum_reg_node_struct* %734, i64 %731
  %736 = getelementptr inbounds %struct.quantum_reg_node_struct* %735, i32 0, i32 0
  %737 = getelementptr inbounds { float, float }* %736, i32 0, i32 0
  %738 = getelementptr inbounds { float, float }* %736, i32 0, i32 1
  store float %728, float* %737, align 4
  store float %729, float* %738, align 4
  br label %779

; <label>:739                                     ; preds = %677
  %740 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %741 = load { float, float }** %740, align 8
  %742 = getelementptr inbounds { float, float }* %741, i64 2
  %743 = getelementptr inbounds { float, float }* %742, i32 0, i32 0
  %744 = load float* %743, align 4
  %745 = getelementptr inbounds { float, float }* %742, i32 0, i32 1
  %746 = load float* %745, align 4
  %747 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %748 = load float* %747, align 4
  %749 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %750 = load float* %749, align 4
  %751 = fmul float %744, %748
  %752 = fmul float %746, %750
  %753 = fmul float %744, %750
  %754 = fmul float %746, %748
  %755 = fsub float %751, %752
  %756 = fadd float %753, %754
  %757 = fcmp uno float %755, %755
  br i1 %757, label %758, label %767, !prof !1

; <label>:758                                     ; preds = %739
  %759 = fcmp uno float %756, %756
  br i1 %759, label %760, label %767, !prof !1

; <label>:760                                     ; preds = %758
  %761 = call <2 x float> @__mulsc3(float %744, float %746, float %748, float %750) #4
  %762 = bitcast { float, float }* %16 to <2 x float>*
  store <2 x float> %761, <2 x float>* %762, align 1
  %763 = getelementptr inbounds { float, float }* %16, i32 0, i32 0
  %764 = load float* %763, align 4
  %765 = getelementptr inbounds { float, float }* %16, i32 0, i32 1
  %766 = load float* %765, align 4
  br label %767

; <label>:767                                     ; preds = %760, %758, %739
  %768 = phi float [ %755, %739 ], [ %755, %758 ], [ %764, %760 ]
  %769 = phi float [ %756, %739 ], [ %756, %758 ], [ %766, %760 ]
  %770 = load i32* %k, align 4
  %771 = sext i32 %770 to i64
  %772 = load %struct.quantum_reg_struct** %2, align 8
  %773 = getelementptr inbounds %struct.quantum_reg_struct* %772, i32 0, i32 3
  %774 = load %struct.quantum_reg_node_struct** %773, align 8
  %775 = getelementptr inbounds %struct.quantum_reg_node_struct* %774, i64 %771
  %776 = getelementptr inbounds %struct.quantum_reg_node_struct* %775, i32 0, i32 0
  %777 = getelementptr inbounds { float, float }* %776, i32 0, i32 0
  %778 = getelementptr inbounds { float, float }* %776, i32 0, i32 1
  store float %768, float* %777, align 4
  store float %769, float* %778, align 4
  br label %779

; <label>:779                                     ; preds = %767, %727
  %780 = load i32* %k, align 4
  %781 = add nsw i32 %780, 1
  store i32 %781, i32* %k, align 4
  br label %782

; <label>:782                                     ; preds = %779, %638
  %783 = load i32* %j, align 4
  %784 = icmp sge i32 %783, 0
  br i1 %784, label %785, label %790

; <label>:785                                     ; preds = %782
  %786 = load i32* %j, align 4
  %787 = sext i32 %786 to i64
  %788 = load i8** %done, align 8
  %789 = getelementptr inbounds i8* %788, i64 %787
  store i8 1, i8* %789, align 1
  br label %790

; <label>:790                                     ; preds = %785, %782
  br label %791

; <label>:791                                     ; preds = %790, %275
  br label %792

; <label>:792                                     ; preds = %791
  %793 = load i32* %i, align 4
  %794 = add nsw i32 %793, 1
  store i32 %794, i32* %i, align 4
  br label %269

; <label>:795                                     ; preds = %676, %657, %269
  %796 = load i32* %addsize, align 4
  %797 = load %struct.quantum_reg_struct** %2, align 8
  %798 = getelementptr inbounds %struct.quantum_reg_struct* %797, i32 0, i32 1
  %799 = load i32* %798, align 4
  %800 = add nsw i32 %799, %796
  store i32 %800, i32* %798, align 4
  %801 = load i8** %done, align 8
  call void @free(i8* %801) #4
  %802 = load %struct.quantum_reg_struct** %2, align 8
  %803 = getelementptr inbounds %struct.quantum_reg_struct* %802, i32 0, i32 1
  %804 = load i32* %803, align 4
  %805 = sub nsw i32 0, %804
  %806 = sext i32 %805 to i64
  %807 = mul i64 %806, 1
  %808 = call i64 @quantum_memman(i64 %807)
  store i32 0, i32* %i, align 4
  store i32 0, i32* %j, align 4
  br label %809

; <label>:809                                     ; preds = %884, %795
  %810 = load i32* %i, align 4
  %811 = load %struct.quantum_reg_struct** %2, align 8
  %812 = getelementptr inbounds %struct.quantum_reg_struct* %811, i32 0, i32 1
  %813 = load i32* %812, align 4
  %814 = icmp slt i32 %810, %813
  br i1 %814, label %815, label %887

; <label>:815                                     ; preds = %809
  %816 = load i32* %i, align 4
  %817 = sext i32 %816 to i64
  %818 = load %struct.quantum_reg_struct** %2, align 8
  %819 = getelementptr inbounds %struct.quantum_reg_struct* %818, i32 0, i32 3
  %820 = load %struct.quantum_reg_node_struct** %819, align 8
  %821 = getelementptr inbounds %struct.quantum_reg_node_struct* %820, i64 %817
  %822 = getelementptr inbounds %struct.quantum_reg_node_struct* %821, i32 0, i32 0
  %823 = getelementptr inbounds { float, float }* %822, i32 0, i32 0
  %824 = load float* %823, align 4
  %825 = getelementptr inbounds { float, float }* %822, i32 0, i32 1
  %826 = load float* %825, align 4
  %827 = getelementptr inbounds { float, float }* %17, i32 0, i32 0
  %828 = getelementptr inbounds { float, float }* %17, i32 0, i32 1
  store float %824, float* %827, align 4
  store float %826, float* %828, align 4
  %829 = bitcast { float, float }* %17 to <2 x float>*
  %830 = load <2 x float>* %829, align 1
  %831 = call float @quantum_prob_inline(<2 x float> %830)
  %832 = load float* %limit, align 4
  %833 = fcmp olt float %831, %832
  br i1 %833, label %834, label %839

; <label>:834                                     ; preds = %815
  %835 = load i32* %j, align 4
  %836 = add nsw i32 %835, 1
  store i32 %836, i32* %j, align 4
  %837 = load i32* %decsize, align 4
  %838 = add nsw i32 %837, 1
  store i32 %838, i32* %decsize, align 4
  br label %883

; <label>:839                                     ; preds = %815
  %840 = load i32* %j, align 4
  %841 = icmp ne i32 %840, 0
  br i1 %841, label %842, label %882

; <label>:842                                     ; preds = %839
  %843 = load i32* %i, align 4
  %844 = sext i32 %843 to i64
  %845 = load %struct.quantum_reg_struct** %2, align 8
  %846 = getelementptr inbounds %struct.quantum_reg_struct* %845, i32 0, i32 3
  %847 = load %struct.quantum_reg_node_struct** %846, align 8
  %848 = getelementptr inbounds %struct.quantum_reg_node_struct* %847, i64 %844
  %849 = getelementptr inbounds %struct.quantum_reg_node_struct* %848, i32 0, i32 1
  %850 = load i64* %849, align 8
  %851 = load i32* %i, align 4
  %852 = load i32* %j, align 4
  %853 = sub nsw i32 %851, %852
  %854 = sext i32 %853 to i64
  %855 = load %struct.quantum_reg_struct** %2, align 8
  %856 = getelementptr inbounds %struct.quantum_reg_struct* %855, i32 0, i32 3
  %857 = load %struct.quantum_reg_node_struct** %856, align 8
  %858 = getelementptr inbounds %struct.quantum_reg_node_struct* %857, i64 %854
  %859 = getelementptr inbounds %struct.quantum_reg_node_struct* %858, i32 0, i32 1
  store i64 %850, i64* %859, align 8
  %860 = load i32* %i, align 4
  %861 = sext i32 %860 to i64
  %862 = load %struct.quantum_reg_struct** %2, align 8
  %863 = getelementptr inbounds %struct.quantum_reg_struct* %862, i32 0, i32 3
  %864 = load %struct.quantum_reg_node_struct** %863, align 8
  %865 = getelementptr inbounds %struct.quantum_reg_node_struct* %864, i64 %861
  %866 = getelementptr inbounds %struct.quantum_reg_node_struct* %865, i32 0, i32 0
  %867 = getelementptr inbounds { float, float }* %866, i32 0, i32 0
  %868 = load float* %867, align 4
  %869 = getelementptr inbounds { float, float }* %866, i32 0, i32 1
  %870 = load float* %869, align 4
  %871 = load i32* %i, align 4
  %872 = load i32* %j, align 4
  %873 = sub nsw i32 %871, %872
  %874 = sext i32 %873 to i64
  %875 = load %struct.quantum_reg_struct** %2, align 8
  %876 = getelementptr inbounds %struct.quantum_reg_struct* %875, i32 0, i32 3
  %877 = load %struct.quantum_reg_node_struct** %876, align 8
  %878 = getelementptr inbounds %struct.quantum_reg_node_struct* %877, i64 %874
  %879 = getelementptr inbounds %struct.quantum_reg_node_struct* %878, i32 0, i32 0
  %880 = getelementptr inbounds { float, float }* %879, i32 0, i32 0
  %881 = getelementptr inbounds { float, float }* %879, i32 0, i32 1
  store float %868, float* %880, align 4
  store float %870, float* %881, align 4
  br label %882

; <label>:882                                     ; preds = %842, %839
  br label %883

; <label>:883                                     ; preds = %882, %834
  br label %884

; <label>:884                                     ; preds = %883
  %885 = load i32* %i, align 4
  %886 = add nsw i32 %885, 1
  store i32 %886, i32* %i, align 4
  br label %809

; <label>:887                                     ; preds = %809
  %888 = load i32* %decsize, align 4
  %889 = icmp ne i32 %888, 0
  br i1 %889, label %890, label %926

; <label>:890                                     ; preds = %887
  %891 = load i32* %decsize, align 4
  %892 = load %struct.quantum_reg_struct** %2, align 8
  %893 = getelementptr inbounds %struct.quantum_reg_struct* %892, i32 0, i32 1
  %894 = load i32* %893, align 4
  %895 = sub nsw i32 %894, %891
  store i32 %895, i32* %893, align 4
  %896 = load %struct.quantum_reg_struct** %2, align 8
  %897 = getelementptr inbounds %struct.quantum_reg_struct* %896, i32 0, i32 3
  %898 = load %struct.quantum_reg_node_struct** %897, align 8
  %899 = bitcast %struct.quantum_reg_node_struct* %898 to i8*
  %900 = load %struct.quantum_reg_struct** %2, align 8
  %901 = getelementptr inbounds %struct.quantum_reg_struct* %900, i32 0, i32 1
  %902 = load i32* %901, align 4
  %903 = sext i32 %902 to i64
  %904 = mul i64 %903, 16
  %905 = call i8* @realloc(i8* %899, i64 %904) #4
  %906 = bitcast i8* %905 to %struct.quantum_reg_node_struct*
  %907 = load %struct.quantum_reg_struct** %2, align 8
  %908 = getelementptr inbounds %struct.quantum_reg_struct* %907, i32 0, i32 3
  store %struct.quantum_reg_node_struct* %906, %struct.quantum_reg_node_struct** %908, align 8
  %909 = load %struct.quantum_reg_struct** %2, align 8
  %910 = getelementptr inbounds %struct.quantum_reg_struct* %909, i32 0, i32 3
  %911 = load %struct.quantum_reg_node_struct** %910, align 8
  %912 = icmp ne %struct.quantum_reg_node_struct* %911, null
  br i1 %912, label %920, label %913

; <label>:913                                     ; preds = %890
  %914 = load %struct.quantum_reg_struct** %2, align 8
  %915 = getelementptr inbounds %struct.quantum_reg_struct* %914, i32 0, i32 1
  %916 = load i32* %915, align 4
  %917 = load i32* %addsize, align 4
  %918 = add nsw i32 %916, %917
  %919 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i32 0, i32 0), i32 %918)
  call void @exit(i32 1) #6
  unreachable

; <label>:920                                     ; preds = %890
  %921 = load i32* %decsize, align 4
  %922 = sub nsw i32 0, %921
  %923 = sext i32 %922 to i64
  %924 = mul i64 %923, 16
  %925 = call i64 @quantum_memman(i64 %924)
  br label %926

; <label>:926                                     ; preds = %920, %887
  %927 = load %struct.quantum_reg_struct** %2, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %927)
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal void @quantum_add_hash(i64 %a, i32 %pos, %struct.quantum_reg_struct* %reg) #5 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  %3 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  store i64 %a, i64* %1, align 8
  store i32 %pos, i32* %2, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %3, align 8
  %4 = load i64* %1, align 8
  %5 = load %struct.quantum_reg_struct** %3, align 8
  %6 = getelementptr inbounds %struct.quantum_reg_struct* %5, i32 0, i32 2
  %7 = load i32* %6, align 4
  %8 = call i32 @quantum_hash64(i64 %4, i32 %7)
  store i32 %8, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %28, %0
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load %struct.quantum_reg_struct** %3, align 8
  %13 = getelementptr inbounds %struct.quantum_reg_struct* %12, i32 0, i32 4
  %14 = load i32** %13, align 8
  %15 = getelementptr inbounds i32* %14, i64 %11
  %16 = load i32* %15, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %29

; <label>:18                                      ; preds = %9
  %19 = load i32* %i, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %i, align 4
  %21 = load i32* %i, align 4
  %22 = load %struct.quantum_reg_struct** %3, align 8
  %23 = getelementptr inbounds %struct.quantum_reg_struct* %22, i32 0, i32 2
  %24 = load i32* %23, align 4
  %25 = shl i32 1, %24
  %26 = icmp eq i32 %21, %25
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %18
  store i32 0, i32* %i, align 4
  br label %28

; <label>:28                                      ; preds = %27, %18
  br label %9

; <label>:29                                      ; preds = %9
  %30 = load i32* %2, align 4
  %31 = add nsw i32 %30, 1
  %32 = load i32* %i, align 4
  %33 = sext i32 %32 to i64
  %34 = load %struct.quantum_reg_struct** %3, align 8
  %35 = getelementptr inbounds %struct.quantum_reg_struct* %34, i32 0, i32 4
  %36 = load i32** %35, align 8
  %37 = getelementptr inbounds i32* %36, i64 %33
  store i32 %31, i32* %37, align 4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @quantum_get_state(i64 %a, %struct.quantum_reg_struct* byval align 8 %reg) #5 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %a, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 2
  %5 = load i32* %4, align 4
  %6 = call i32 @quantum_hash64(i64 %3, i32 %5)
  store i32 %6, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %48, %0
  %8 = load i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 4
  %11 = load i32** %10, align 8
  %12 = getelementptr inbounds i32* %11, i64 %9
  %13 = load i32* %12, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %49

; <label>:15                                      ; preds = %7
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 4
  %19 = load i32** %18, align 8
  %20 = getelementptr inbounds i32* %19, i64 %17
  %21 = load i32* %20, align 4
  %22 = sub nsw i32 %21, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 3
  %25 = load %struct.quantum_reg_node_struct** %24, align 8
  %26 = getelementptr inbounds %struct.quantum_reg_node_struct* %25, i64 %23
  %27 = getelementptr inbounds %struct.quantum_reg_node_struct* %26, i32 0, i32 1
  %28 = load i64* %27, align 8
  %29 = load i64* %2, align 8
  %30 = icmp eq i64 %28, %29
  br i1 %30, label %31, label %39

; <label>:31                                      ; preds = %15
  %32 = load i32* %i, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 4
  %35 = load i32** %34, align 8
  %36 = getelementptr inbounds i32* %35, i64 %33
  %37 = load i32* %36, align 4
  %38 = sub nsw i32 %37, 1
  store i32 %38, i32* %1
  br label %50

; <label>:39                                      ; preds = %15
  %40 = load i32* %i, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %i, align 4
  %42 = load i32* %i, align 4
  %43 = getelementptr inbounds %struct.quantum_reg_struct* %reg, i32 0, i32 2
  %44 = load i32* %43, align 4
  %45 = shl i32 1, %44
  %46 = icmp eq i32 %42, %45
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %39
  store i32 0, i32* %i, align 4
  br label %48

; <label>:48                                      ; preds = %47, %39
  br label %7

; <label>:49                                      ; preds = %7
  store i32 -1, i32* %1
  br label %50

; <label>:50                                      ; preds = %49, %31
  %51 = load i32* %1
  ret i32 %51
}

; Function Attrs: inlinehint nounwind uwtable
define internal float @quantum_prob_inline(<2 x float> %a.coerce) #5 {
  %a = alloca { float, float }, align 8
  %r = alloca float, align 4
  %i = alloca float, align 4
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
  store float %12, float* %r, align 4
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
  store float %21, float* %i, align 4
  %22 = load float* %r, align 4
  %23 = load float* %r, align 4
  %24 = fmul float %22, %23
  %25 = load float* %i, align 4
  %26 = load float* %i, align 4
  %27 = fmul float %25, %26
  %28 = fadd float %24, %27
  ret float %28
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #2

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind uwtable
define void @quantum_gate2(i32 %control, i32 %target, i64 %m.coerce0, { float, float }* %m.coerce1, %struct.quantum_reg_struct* %reg) #0 {
  %m = alloca %struct.quantum_matrix_struct, align 8
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %iset = alloca i32, align 4
  %addsize = alloca i32, align 4
  %decsize = alloca i32, align 4
  %t = alloca { float, float }, align 4
  %tnot = alloca { float, float }, align 4
  %limit = alloca float, align 4
  %done = alloca i8*, align 8
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
  %15 = bitcast %struct.quantum_matrix_struct* %m to { i64, { float, float }* }*
  %16 = getelementptr { i64, { float, float }* }* %15, i32 0, i32 0
  store i64 %m.coerce0, i64* %16
  %17 = getelementptr { i64, { float, float }* }* %15, i32 0, i32 1
  store { float, float }* %m.coerce1, { float, float }** %17
  store i32 %control, i32* %1, align 4
  store i32 %target, i32* %2, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %3, align 8
  store i32 0, i32* %addsize, align 4
  store i32 0, i32* %decsize, align 4
  %18 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %19 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  store float 0.000000e+00, float* %18, align 4
  store float 0.000000e+00, float* %19, align 4
  %20 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 1
  %21 = load i32* %20, align 4
  %22 = icmp ne i32 %21, 4
  br i1 %22, label %27, label %23

; <label>:23                                      ; preds = %0
  %24 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 0
  %25 = load i32* %24, align 4
  %26 = icmp ne i32 %25, 4
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %23, %0
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:29                                      ; preds = %23
  store i32 0, i32* %i, align 4
  br label %30

; <label>:30                                      ; preds = %44, %29
  %31 = load i32* %i, align 4
  %32 = load %struct.quantum_reg_struct** %3, align 8
  %33 = getelementptr inbounds %struct.quantum_reg_struct* %32, i32 0, i32 2
  %34 = load i32* %33, align 4
  %35 = shl i32 1, %34
  %36 = icmp slt i32 %31, %35
  br i1 %36, label %37, label %47

; <label>:37                                      ; preds = %30
  %38 = load i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = load %struct.quantum_reg_struct** %3, align 8
  %41 = getelementptr inbounds %struct.quantum_reg_struct* %40, i32 0, i32 4
  %42 = load i32** %41, align 8
  %43 = getelementptr inbounds i32* %42, i64 %39
  store i32 0, i32* %43, align 4
  br label %44

; <label>:44                                      ; preds = %37
  %45 = load i32* %i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %30

; <label>:47                                      ; preds = %30
  store i32 0, i32* %i, align 4
  br label %48

; <label>:48                                      ; preds = %65, %47
  %49 = load i32* %i, align 4
  %50 = load %struct.quantum_reg_struct** %3, align 8
  %51 = getelementptr inbounds %struct.quantum_reg_struct* %50, i32 0, i32 1
  %52 = load i32* %51, align 4
  %53 = icmp slt i32 %49, %52
  br i1 %53, label %54, label %68

; <label>:54                                      ; preds = %48
  %55 = load i32* %i, align 4
  %56 = sext i32 %55 to i64
  %57 = load %struct.quantum_reg_struct** %3, align 8
  %58 = getelementptr inbounds %struct.quantum_reg_struct* %57, i32 0, i32 3
  %59 = load %struct.quantum_reg_node_struct** %58, align 8
  %60 = getelementptr inbounds %struct.quantum_reg_node_struct* %59, i64 %56
  %61 = getelementptr inbounds %struct.quantum_reg_node_struct* %60, i32 0, i32 1
  %62 = load i64* %61, align 8
  %63 = load i32* %i, align 4
  %64 = load %struct.quantum_reg_struct** %3, align 8
  call void @quantum_add_hash(i64 %62, i32 %63, %struct.quantum_reg_struct* %64)
  br label %65

; <label>:65                                      ; preds = %54
  %66 = load i32* %i, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %i, align 4
  br label %48

; <label>:68                                      ; preds = %48
  store i32 0, i32* %i, align 4
  br label %69

; <label>:69                                      ; preds = %150, %68
  %70 = load i32* %i, align 4
  %71 = load %struct.quantum_reg_struct** %3, align 8
  %72 = getelementptr inbounds %struct.quantum_reg_struct* %71, i32 0, i32 1
  %73 = load i32* %72, align 4
  %74 = icmp slt i32 %70, %73
  br i1 %74, label %75, label %153

; <label>:75                                      ; preds = %69
  %76 = load i32* %i, align 4
  %77 = sext i32 %76 to i64
  %78 = load %struct.quantum_reg_struct** %3, align 8
  %79 = getelementptr inbounds %struct.quantum_reg_struct* %78, i32 0, i32 3
  %80 = load %struct.quantum_reg_node_struct** %79, align 8
  %81 = getelementptr inbounds %struct.quantum_reg_node_struct* %80, i64 %77
  %82 = getelementptr inbounds %struct.quantum_reg_node_struct* %81, i32 0, i32 1
  %83 = load i64* %82, align 8
  %84 = load i32* %2, align 4
  %85 = zext i32 %84 to i64
  %86 = shl i64 1, %85
  %87 = xor i64 %83, %86
  %88 = load %struct.quantum_reg_struct** %3, align 8
  %89 = call i32 @quantum_get_state(i64 %87, %struct.quantum_reg_struct* byval align 8 %88)
  store i32 %89, i32* %j, align 4
  %90 = load i32* %j, align 4
  %91 = icmp eq i32 %90, -1
  br i1 %91, label %92, label %149

; <label>:92                                      ; preds = %75
  %93 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %94 = load { float, float }** %93, align 8
  %95 = getelementptr inbounds { float, float }* %94, i64 1
  %96 = getelementptr inbounds { float, float }* %95, i32 0, i32 0
  %97 = load float* %96, align 4
  %98 = getelementptr inbounds { float, float }* %95, i32 0, i32 1
  %99 = load float* %98, align 4
  %100 = fcmp une float %97, 0.000000e+00
  %101 = fcmp une float %99, 0.000000e+00
  %102 = or i1 %100, %101
  br i1 %102, label %103, label %120

; <label>:103                                     ; preds = %92
  %104 = load i32* %i, align 4
  %105 = sext i32 %104 to i64
  %106 = load %struct.quantum_reg_struct** %3, align 8
  %107 = getelementptr inbounds %struct.quantum_reg_struct* %106, i32 0, i32 3
  %108 = load %struct.quantum_reg_node_struct** %107, align 8
  %109 = getelementptr inbounds %struct.quantum_reg_node_struct* %108, i64 %105
  %110 = getelementptr inbounds %struct.quantum_reg_node_struct* %109, i32 0, i32 1
  %111 = load i64* %110, align 8
  %112 = load i32* %2, align 4
  %113 = zext i32 %112 to i64
  %114 = shl i64 1, %113
  %115 = and i64 %111, %114
  %116 = icmp ne i64 %115, 0
  br i1 %116, label %117, label %120

; <label>:117                                     ; preds = %103
  %118 = load i32* %addsize, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %addsize, align 4
  br label %120

; <label>:120                                     ; preds = %117, %103, %92
  %121 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %122 = load { float, float }** %121, align 8
  %123 = getelementptr inbounds { float, float }* %122, i64 2
  %124 = getelementptr inbounds { float, float }* %123, i32 0, i32 0
  %125 = load float* %124, align 4
  %126 = getelementptr inbounds { float, float }* %123, i32 0, i32 1
  %127 = load float* %126, align 4
  %128 = fcmp une float %125, 0.000000e+00
  %129 = fcmp une float %127, 0.000000e+00
  %130 = or i1 %128, %129
  br i1 %130, label %131, label %148

; <label>:131                                     ; preds = %120
  %132 = load i32* %i, align 4
  %133 = sext i32 %132 to i64
  %134 = load %struct.quantum_reg_struct** %3, align 8
  %135 = getelementptr inbounds %struct.quantum_reg_struct* %134, i32 0, i32 3
  %136 = load %struct.quantum_reg_node_struct** %135, align 8
  %137 = getelementptr inbounds %struct.quantum_reg_node_struct* %136, i64 %133
  %138 = getelementptr inbounds %struct.quantum_reg_node_struct* %137, i32 0, i32 1
  %139 = load i64* %138, align 8
  %140 = load i32* %2, align 4
  %141 = zext i32 %140 to i64
  %142 = shl i64 1, %141
  %143 = and i64 %139, %142
  %144 = icmp ne i64 %143, 0
  br i1 %144, label %148, label %145

; <label>:145                                     ; preds = %131
  %146 = load i32* %addsize, align 4
  %147 = add nsw i32 %146, 1
  store i32 %147, i32* %addsize, align 4
  br label %148

; <label>:148                                     ; preds = %145, %131, %120
  br label %149

; <label>:149                                     ; preds = %148, %75
  br label %150

; <label>:150                                     ; preds = %149
  %151 = load i32* %i, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, i32* %i, align 4
  br label %69

; <label>:153                                     ; preds = %69
  %154 = load %struct.quantum_reg_struct** %3, align 8
  %155 = getelementptr inbounds %struct.quantum_reg_struct* %154, i32 0, i32 3
  %156 = load %struct.quantum_reg_node_struct** %155, align 8
  %157 = bitcast %struct.quantum_reg_node_struct* %156 to i8*
  %158 = load %struct.quantum_reg_struct** %3, align 8
  %159 = getelementptr inbounds %struct.quantum_reg_struct* %158, i32 0, i32 1
  %160 = load i32* %159, align 4
  %161 = load i32* %addsize, align 4
  %162 = add nsw i32 %160, %161
  %163 = sext i32 %162 to i64
  %164 = mul i64 %163, 16
  %165 = call i8* @realloc(i8* %157, i64 %164) #4
  %166 = bitcast i8* %165 to %struct.quantum_reg_node_struct*
  %167 = load %struct.quantum_reg_struct** %3, align 8
  %168 = getelementptr inbounds %struct.quantum_reg_struct* %167, i32 0, i32 3
  store %struct.quantum_reg_node_struct* %166, %struct.quantum_reg_node_struct** %168, align 8
  %169 = load %struct.quantum_reg_struct** %3, align 8
  %170 = getelementptr inbounds %struct.quantum_reg_struct* %169, i32 0, i32 3
  %171 = load %struct.quantum_reg_node_struct** %170, align 8
  %172 = icmp ne %struct.quantum_reg_node_struct* %171, null
  br i1 %172, label %180, label %173

; <label>:173                                     ; preds = %153
  %174 = load %struct.quantum_reg_struct** %3, align 8
  %175 = getelementptr inbounds %struct.quantum_reg_struct* %174, i32 0, i32 1
  %176 = load i32* %175, align 4
  %177 = load i32* %addsize, align 4
  %178 = add nsw i32 %176, %177
  %179 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i32 0, i32 0), i32 %178)
  call void @exit(i32 1) #6
  unreachable

; <label>:180                                     ; preds = %153
  %181 = load i32* %addsize, align 4
  %182 = sext i32 %181 to i64
  %183 = mul i64 %182, 16
  %184 = call i64 @quantum_memman(i64 %183)
  store i32 0, i32* %i, align 4
  br label %185

; <label>:185                                     ; preds = %214, %180
  %186 = load i32* %i, align 4
  %187 = load i32* %addsize, align 4
  %188 = icmp slt i32 %186, %187
  br i1 %188, label %189, label %217

; <label>:189                                     ; preds = %185
  %190 = load i32* %i, align 4
  %191 = load %struct.quantum_reg_struct** %3, align 8
  %192 = getelementptr inbounds %struct.quantum_reg_struct* %191, i32 0, i32 1
  %193 = load i32* %192, align 4
  %194 = add nsw i32 %190, %193
  %195 = sext i32 %194 to i64
  %196 = load %struct.quantum_reg_struct** %3, align 8
  %197 = getelementptr inbounds %struct.quantum_reg_struct* %196, i32 0, i32 3
  %198 = load %struct.quantum_reg_node_struct** %197, align 8
  %199 = getelementptr inbounds %struct.quantum_reg_node_struct* %198, i64 %195
  %200 = getelementptr inbounds %struct.quantum_reg_node_struct* %199, i32 0, i32 1
  store i64 0, i64* %200, align 8
  %201 = load i32* %i, align 4
  %202 = load %struct.quantum_reg_struct** %3, align 8
  %203 = getelementptr inbounds %struct.quantum_reg_struct* %202, i32 0, i32 1
  %204 = load i32* %203, align 4
  %205 = add nsw i32 %201, %204
  %206 = sext i32 %205 to i64
  %207 = load %struct.quantum_reg_struct** %3, align 8
  %208 = getelementptr inbounds %struct.quantum_reg_struct* %207, i32 0, i32 3
  %209 = load %struct.quantum_reg_node_struct** %208, align 8
  %210 = getelementptr inbounds %struct.quantum_reg_node_struct* %209, i64 %206
  %211 = getelementptr inbounds %struct.quantum_reg_node_struct* %210, i32 0, i32 0
  %212 = getelementptr inbounds { float, float }* %211, i32 0, i32 0
  %213 = getelementptr inbounds { float, float }* %211, i32 0, i32 1
  store float 0.000000e+00, float* %212, align 4
  store float 0.000000e+00, float* %213, align 4
  br label %214

; <label>:214                                     ; preds = %189
  %215 = load i32* %i, align 4
  %216 = add nsw i32 %215, 1
  store i32 %216, i32* %i, align 4
  br label %185

; <label>:217                                     ; preds = %185
  %218 = load %struct.quantum_reg_struct** %3, align 8
  %219 = getelementptr inbounds %struct.quantum_reg_struct* %218, i32 0, i32 1
  %220 = load i32* %219, align 4
  %221 = load i32* %addsize, align 4
  %222 = add nsw i32 %220, %221
  %223 = sext i32 %222 to i64
  %224 = call noalias i8* @calloc(i64 %223, i64 1) #4
  store i8* %224, i8** %done, align 8
  %225 = load i8** %done, align 8
  %226 = icmp ne i8* %225, null
  br i1 %226, label %236, label %227

; <label>:227                                     ; preds = %217
  %228 = load %struct.quantum_reg_struct** %3, align 8
  %229 = getelementptr inbounds %struct.quantum_reg_struct* %228, i32 0, i32 1
  %230 = load i32* %229, align 4
  %231 = load i32* %addsize, align 4
  %232 = add nsw i32 %230, %231
  %233 = sext i32 %232 to i64
  %234 = mul i64 %233, 1
  %235 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str3, i32 0, i32 0), i64 %234)
  call void @exit(i32 1) #6
  unreachable

; <label>:236                                     ; preds = %217
  %237 = load %struct.quantum_reg_struct** %3, align 8
  %238 = getelementptr inbounds %struct.quantum_reg_struct* %237, i32 0, i32 1
  %239 = load i32* %238, align 4
  %240 = sext i32 %239 to i64
  %241 = load i32* %addsize, align 4
  %242 = sext i32 %241 to i64
  %243 = mul i64 %242, 1
  %244 = add i64 %240, %243
  %245 = call i64 @quantum_memman(i64 %244)
  %246 = load %struct.quantum_reg_struct** %3, align 8
  %247 = getelementptr inbounds %struct.quantum_reg_struct* %246, i32 0, i32 1
  %248 = load i32* %247, align 4
  store i32 %248, i32* %k, align 4
  %249 = load %struct.quantum_reg_struct** %3, align 8
  %250 = getelementptr inbounds %struct.quantum_reg_struct* %249, i32 0, i32 0
  %251 = load i32* %250, align 4
  %252 = zext i32 %251 to i64
  %253 = shl i64 1, %252
  %254 = uitofp i64 %253 to double
  %255 = fdiv double 1.000000e+00, %254
  %256 = fdiv double %255, 1.000000e+06
  %257 = fptrunc double %256 to float
  store float %257, float* %limit, align 4
  store i32 0, i32* %i, align 4
  br label %258

; <label>:258                                     ; preds = %773, %236
  %259 = load i32* %i, align 4
  %260 = load %struct.quantum_reg_struct** %3, align 8
  %261 = getelementptr inbounds %struct.quantum_reg_struct* %260, i32 0, i32 1
  %262 = load i32* %261, align 4
  %263 = icmp slt i32 %259, %262
  br i1 %263, label %264, label %776

; <label>:264                                     ; preds = %258
  %265 = load i32* %i, align 4
  %266 = sext i32 %265 to i64
  %267 = load i8** %done, align 8
  %268 = getelementptr inbounds i8* %267, i64 %266
  %269 = load i8* %268, align 1
  %270 = icmp ne i8 %269, 0
  br i1 %270, label %772, label %271

; <label>:271                                     ; preds = %264
  %272 = load i32* %i, align 4
  %273 = sext i32 %272 to i64
  %274 = load %struct.quantum_reg_struct** %3, align 8
  %275 = getelementptr inbounds %struct.quantum_reg_struct* %274, i32 0, i32 3
  %276 = load %struct.quantum_reg_node_struct** %275, align 8
  %277 = getelementptr inbounds %struct.quantum_reg_node_struct* %276, i64 %273
  %278 = getelementptr inbounds %struct.quantum_reg_node_struct* %277, i32 0, i32 1
  %279 = load i64* %278, align 8
  %280 = load i32* %2, align 4
  %281 = zext i32 %280 to i64
  %282 = shl i64 1, %281
  %283 = and i64 %279, %282
  %284 = trunc i64 %283 to i32
  store i32 %284, i32* %iset, align 4
  %285 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %286 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  store float 0.000000e+00, float* %285, align 4
  store float 0.000000e+00, float* %286, align 4
  %287 = load i32* %i, align 4
  %288 = sext i32 %287 to i64
  %289 = load %struct.quantum_reg_struct** %3, align 8
  %290 = getelementptr inbounds %struct.quantum_reg_struct* %289, i32 0, i32 3
  %291 = load %struct.quantum_reg_node_struct** %290, align 8
  %292 = getelementptr inbounds %struct.quantum_reg_node_struct* %291, i64 %288
  %293 = getelementptr inbounds %struct.quantum_reg_node_struct* %292, i32 0, i32 1
  %294 = load i64* %293, align 8
  %295 = load i32* %2, align 4
  %296 = zext i32 %295 to i64
  %297 = shl i64 1, %296
  %298 = xor i64 %294, %297
  %299 = load %struct.quantum_reg_struct** %3, align 8
  %300 = call i32 @quantum_get_state(i64 %298, %struct.quantum_reg_struct* byval align 8 %299)
  store i32 %300, i32* %j, align 4
  %301 = load i32* %i, align 4
  %302 = sext i32 %301 to i64
  %303 = load %struct.quantum_reg_struct** %3, align 8
  %304 = getelementptr inbounds %struct.quantum_reg_struct* %303, i32 0, i32 3
  %305 = load %struct.quantum_reg_node_struct** %304, align 8
  %306 = getelementptr inbounds %struct.quantum_reg_node_struct* %305, i64 %302
  %307 = getelementptr inbounds %struct.quantum_reg_node_struct* %306, i32 0, i32 0
  %308 = getelementptr inbounds { float, float }* %307, i32 0, i32 0
  %309 = load float* %308, align 4
  %310 = getelementptr inbounds { float, float }* %307, i32 0, i32 1
  %311 = load float* %310, align 4
  %312 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %313 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  store float %309, float* %312, align 4
  store float %311, float* %313, align 4
  %314 = load i32* %j, align 4
  %315 = icmp sge i32 %314, 0
  br i1 %315, label %316, label %330

; <label>:316                                     ; preds = %271
  %317 = load i32* %j, align 4
  %318 = sext i32 %317 to i64
  %319 = load %struct.quantum_reg_struct** %3, align 8
  %320 = getelementptr inbounds %struct.quantum_reg_struct* %319, i32 0, i32 3
  %321 = load %struct.quantum_reg_node_struct** %320, align 8
  %322 = getelementptr inbounds %struct.quantum_reg_node_struct* %321, i64 %318
  %323 = getelementptr inbounds %struct.quantum_reg_node_struct* %322, i32 0, i32 0
  %324 = getelementptr inbounds { float, float }* %323, i32 0, i32 0
  %325 = load float* %324, align 4
  %326 = getelementptr inbounds { float, float }* %323, i32 0, i32 1
  %327 = load float* %326, align 4
  %328 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %329 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  store float %325, float* %328, align 4
  store float %327, float* %329, align 4
  br label %330

; <label>:330                                     ; preds = %316, %271
  %331 = load i32* %iset, align 4
  %332 = icmp ne i32 %331, 0
  br i1 %332, label %333, label %405

; <label>:333                                     ; preds = %330
  %334 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %335 = load { float, float }** %334, align 8
  %336 = getelementptr inbounds { float, float }* %335, i64 2
  %337 = getelementptr inbounds { float, float }* %336, i32 0, i32 0
  %338 = load float* %337, align 4
  %339 = getelementptr inbounds { float, float }* %336, i32 0, i32 1
  %340 = load float* %339, align 4
  %341 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %342 = load float* %341, align 4
  %343 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %344 = load float* %343, align 4
  %345 = fmul float %338, %342
  %346 = fmul float %340, %344
  %347 = fmul float %338, %344
  %348 = fmul float %340, %342
  %349 = fsub float %345, %346
  %350 = fadd float %347, %348
  %351 = fcmp uno float %349, %349
  br i1 %351, label %352, label %361, !prof !1

; <label>:352                                     ; preds = %333
  %353 = fcmp uno float %350, %350
  br i1 %353, label %354, label %361, !prof !1

; <label>:354                                     ; preds = %352
  %355 = call <2 x float> @__mulsc3(float %338, float %340, float %342, float %344) #4
  %356 = bitcast { float, float }* %4 to <2 x float>*
  store <2 x float> %355, <2 x float>* %356, align 1
  %357 = getelementptr inbounds { float, float }* %4, i32 0, i32 0
  %358 = load float* %357, align 4
  %359 = getelementptr inbounds { float, float }* %4, i32 0, i32 1
  %360 = load float* %359, align 4
  br label %361

; <label>:361                                     ; preds = %354, %352, %333
  %362 = phi float [ %349, %333 ], [ %349, %352 ], [ %358, %354 ]
  %363 = phi float [ %350, %333 ], [ %350, %352 ], [ %360, %354 ]
  %364 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %365 = load { float, float }** %364, align 8
  %366 = getelementptr inbounds { float, float }* %365, i64 3
  %367 = getelementptr inbounds { float, float }* %366, i32 0, i32 0
  %368 = load float* %367, align 4
  %369 = getelementptr inbounds { float, float }* %366, i32 0, i32 1
  %370 = load float* %369, align 4
  %371 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %372 = load float* %371, align 4
  %373 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %374 = load float* %373, align 4
  %375 = fmul float %368, %372
  %376 = fmul float %370, %374
  %377 = fmul float %368, %374
  %378 = fmul float %370, %372
  %379 = fsub float %375, %376
  %380 = fadd float %377, %378
  %381 = fcmp uno float %379, %379
  br i1 %381, label %382, label %391, !prof !1

; <label>:382                                     ; preds = %361
  %383 = fcmp uno float %380, %380
  br i1 %383, label %384, label %391, !prof !1

; <label>:384                                     ; preds = %382
  %385 = call <2 x float> @__mulsc3(float %368, float %370, float %372, float %374) #4
  %386 = bitcast { float, float }* %5 to <2 x float>*
  store <2 x float> %385, <2 x float>* %386, align 1
  %387 = getelementptr inbounds { float, float }* %5, i32 0, i32 0
  %388 = load float* %387, align 4
  %389 = getelementptr inbounds { float, float }* %5, i32 0, i32 1
  %390 = load float* %389, align 4
  br label %391

; <label>:391                                     ; preds = %384, %382, %361
  %392 = phi float [ %379, %361 ], [ %379, %382 ], [ %388, %384 ]
  %393 = phi float [ %380, %361 ], [ %380, %382 ], [ %390, %384 ]
  %394 = fadd float %362, %392
  %395 = fadd float %363, %393
  %396 = load i32* %i, align 4
  %397 = sext i32 %396 to i64
  %398 = load %struct.quantum_reg_struct** %3, align 8
  %399 = getelementptr inbounds %struct.quantum_reg_struct* %398, i32 0, i32 3
  %400 = load %struct.quantum_reg_node_struct** %399, align 8
  %401 = getelementptr inbounds %struct.quantum_reg_node_struct* %400, i64 %397
  %402 = getelementptr inbounds %struct.quantum_reg_node_struct* %401, i32 0, i32 0
  %403 = getelementptr inbounds { float, float }* %402, i32 0, i32 0
  %404 = getelementptr inbounds { float, float }* %402, i32 0, i32 1
  store float %394, float* %403, align 4
  store float %395, float* %404, align 4
  br label %477

; <label>:405                                     ; preds = %330
  %406 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %407 = load { float, float }** %406, align 8
  %408 = getelementptr inbounds { float, float }* %407, i64 0
  %409 = getelementptr inbounds { float, float }* %408, i32 0, i32 0
  %410 = load float* %409, align 4
  %411 = getelementptr inbounds { float, float }* %408, i32 0, i32 1
  %412 = load float* %411, align 4
  %413 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %414 = load float* %413, align 4
  %415 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %416 = load float* %415, align 4
  %417 = fmul float %410, %414
  %418 = fmul float %412, %416
  %419 = fmul float %410, %416
  %420 = fmul float %412, %414
  %421 = fsub float %417, %418
  %422 = fadd float %419, %420
  %423 = fcmp uno float %421, %421
  br i1 %423, label %424, label %433, !prof !1

; <label>:424                                     ; preds = %405
  %425 = fcmp uno float %422, %422
  br i1 %425, label %426, label %433, !prof !1

; <label>:426                                     ; preds = %424
  %427 = call <2 x float> @__mulsc3(float %410, float %412, float %414, float %416) #4
  %428 = bitcast { float, float }* %6 to <2 x float>*
  store <2 x float> %427, <2 x float>* %428, align 1
  %429 = getelementptr inbounds { float, float }* %6, i32 0, i32 0
  %430 = load float* %429, align 4
  %431 = getelementptr inbounds { float, float }* %6, i32 0, i32 1
  %432 = load float* %431, align 4
  br label %433

; <label>:433                                     ; preds = %426, %424, %405
  %434 = phi float [ %421, %405 ], [ %421, %424 ], [ %430, %426 ]
  %435 = phi float [ %422, %405 ], [ %422, %424 ], [ %432, %426 ]
  %436 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %437 = load { float, float }** %436, align 8
  %438 = getelementptr inbounds { float, float }* %437, i64 1
  %439 = getelementptr inbounds { float, float }* %438, i32 0, i32 0
  %440 = load float* %439, align 4
  %441 = getelementptr inbounds { float, float }* %438, i32 0, i32 1
  %442 = load float* %441, align 4
  %443 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %444 = load float* %443, align 4
  %445 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %446 = load float* %445, align 4
  %447 = fmul float %440, %444
  %448 = fmul float %442, %446
  %449 = fmul float %440, %446
  %450 = fmul float %442, %444
  %451 = fsub float %447, %448
  %452 = fadd float %449, %450
  %453 = fcmp uno float %451, %451
  br i1 %453, label %454, label %463, !prof !1

; <label>:454                                     ; preds = %433
  %455 = fcmp uno float %452, %452
  br i1 %455, label %456, label %463, !prof !1

; <label>:456                                     ; preds = %454
  %457 = call <2 x float> @__mulsc3(float %440, float %442, float %444, float %446) #4
  %458 = bitcast { float, float }* %7 to <2 x float>*
  store <2 x float> %457, <2 x float>* %458, align 1
  %459 = getelementptr inbounds { float, float }* %7, i32 0, i32 0
  %460 = load float* %459, align 4
  %461 = getelementptr inbounds { float, float }* %7, i32 0, i32 1
  %462 = load float* %461, align 4
  br label %463

; <label>:463                                     ; preds = %456, %454, %433
  %464 = phi float [ %451, %433 ], [ %451, %454 ], [ %460, %456 ]
  %465 = phi float [ %452, %433 ], [ %452, %454 ], [ %462, %456 ]
  %466 = fadd float %434, %464
  %467 = fadd float %435, %465
  %468 = load i32* %i, align 4
  %469 = sext i32 %468 to i64
  %470 = load %struct.quantum_reg_struct** %3, align 8
  %471 = getelementptr inbounds %struct.quantum_reg_struct* %470, i32 0, i32 3
  %472 = load %struct.quantum_reg_node_struct** %471, align 8
  %473 = getelementptr inbounds %struct.quantum_reg_node_struct* %472, i64 %469
  %474 = getelementptr inbounds %struct.quantum_reg_node_struct* %473, i32 0, i32 0
  %475 = getelementptr inbounds { float, float }* %474, i32 0, i32 0
  %476 = getelementptr inbounds { float, float }* %474, i32 0, i32 1
  store float %466, float* %475, align 4
  store float %467, float* %476, align 4
  br label %477

; <label>:477                                     ; preds = %463, %391
  %478 = load i32* %j, align 4
  %479 = icmp sge i32 %478, 0
  br i1 %479, label %480, label %628

; <label>:480                                     ; preds = %477
  %481 = load i32* %iset, align 4
  %482 = icmp ne i32 %481, 0
  br i1 %482, label %483, label %555

; <label>:483                                     ; preds = %480
  %484 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %485 = load { float, float }** %484, align 8
  %486 = getelementptr inbounds { float, float }* %485, i64 0
  %487 = getelementptr inbounds { float, float }* %486, i32 0, i32 0
  %488 = load float* %487, align 4
  %489 = getelementptr inbounds { float, float }* %486, i32 0, i32 1
  %490 = load float* %489, align 4
  %491 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %492 = load float* %491, align 4
  %493 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %494 = load float* %493, align 4
  %495 = fmul float %488, %492
  %496 = fmul float %490, %494
  %497 = fmul float %488, %494
  %498 = fmul float %490, %492
  %499 = fsub float %495, %496
  %500 = fadd float %497, %498
  %501 = fcmp uno float %499, %499
  br i1 %501, label %502, label %511, !prof !1

; <label>:502                                     ; preds = %483
  %503 = fcmp uno float %500, %500
  br i1 %503, label %504, label %511, !prof !1

; <label>:504                                     ; preds = %502
  %505 = call <2 x float> @__mulsc3(float %488, float %490, float %492, float %494) #4
  %506 = bitcast { float, float }* %8 to <2 x float>*
  store <2 x float> %505, <2 x float>* %506, align 1
  %507 = getelementptr inbounds { float, float }* %8, i32 0, i32 0
  %508 = load float* %507, align 4
  %509 = getelementptr inbounds { float, float }* %8, i32 0, i32 1
  %510 = load float* %509, align 4
  br label %511

; <label>:511                                     ; preds = %504, %502, %483
  %512 = phi float [ %499, %483 ], [ %499, %502 ], [ %508, %504 ]
  %513 = phi float [ %500, %483 ], [ %500, %502 ], [ %510, %504 ]
  %514 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %515 = load { float, float }** %514, align 8
  %516 = getelementptr inbounds { float, float }* %515, i64 1
  %517 = getelementptr inbounds { float, float }* %516, i32 0, i32 0
  %518 = load float* %517, align 4
  %519 = getelementptr inbounds { float, float }* %516, i32 0, i32 1
  %520 = load float* %519, align 4
  %521 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %522 = load float* %521, align 4
  %523 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %524 = load float* %523, align 4
  %525 = fmul float %518, %522
  %526 = fmul float %520, %524
  %527 = fmul float %518, %524
  %528 = fmul float %520, %522
  %529 = fsub float %525, %526
  %530 = fadd float %527, %528
  %531 = fcmp uno float %529, %529
  br i1 %531, label %532, label %541, !prof !1

; <label>:532                                     ; preds = %511
  %533 = fcmp uno float %530, %530
  br i1 %533, label %534, label %541, !prof !1

; <label>:534                                     ; preds = %532
  %535 = call <2 x float> @__mulsc3(float %518, float %520, float %522, float %524) #4
  %536 = bitcast { float, float }* %9 to <2 x float>*
  store <2 x float> %535, <2 x float>* %536, align 1
  %537 = getelementptr inbounds { float, float }* %9, i32 0, i32 0
  %538 = load float* %537, align 4
  %539 = getelementptr inbounds { float, float }* %9, i32 0, i32 1
  %540 = load float* %539, align 4
  br label %541

; <label>:541                                     ; preds = %534, %532, %511
  %542 = phi float [ %529, %511 ], [ %529, %532 ], [ %538, %534 ]
  %543 = phi float [ %530, %511 ], [ %530, %532 ], [ %540, %534 ]
  %544 = fadd float %512, %542
  %545 = fadd float %513, %543
  %546 = load i32* %j, align 4
  %547 = sext i32 %546 to i64
  %548 = load %struct.quantum_reg_struct** %3, align 8
  %549 = getelementptr inbounds %struct.quantum_reg_struct* %548, i32 0, i32 3
  %550 = load %struct.quantum_reg_node_struct** %549, align 8
  %551 = getelementptr inbounds %struct.quantum_reg_node_struct* %550, i64 %547
  %552 = getelementptr inbounds %struct.quantum_reg_node_struct* %551, i32 0, i32 0
  %553 = getelementptr inbounds { float, float }* %552, i32 0, i32 0
  %554 = getelementptr inbounds { float, float }* %552, i32 0, i32 1
  store float %544, float* %553, align 4
  store float %545, float* %554, align 4
  br label %627

; <label>:555                                     ; preds = %480
  %556 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %557 = load { float, float }** %556, align 8
  %558 = getelementptr inbounds { float, float }* %557, i64 2
  %559 = getelementptr inbounds { float, float }* %558, i32 0, i32 0
  %560 = load float* %559, align 4
  %561 = getelementptr inbounds { float, float }* %558, i32 0, i32 1
  %562 = load float* %561, align 4
  %563 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %564 = load float* %563, align 4
  %565 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %566 = load float* %565, align 4
  %567 = fmul float %560, %564
  %568 = fmul float %562, %566
  %569 = fmul float %560, %566
  %570 = fmul float %562, %564
  %571 = fsub float %567, %568
  %572 = fadd float %569, %570
  %573 = fcmp uno float %571, %571
  br i1 %573, label %574, label %583, !prof !1

; <label>:574                                     ; preds = %555
  %575 = fcmp uno float %572, %572
  br i1 %575, label %576, label %583, !prof !1

; <label>:576                                     ; preds = %574
  %577 = call <2 x float> @__mulsc3(float %560, float %562, float %564, float %566) #4
  %578 = bitcast { float, float }* %10 to <2 x float>*
  store <2 x float> %577, <2 x float>* %578, align 1
  %579 = getelementptr inbounds { float, float }* %10, i32 0, i32 0
  %580 = load float* %579, align 4
  %581 = getelementptr inbounds { float, float }* %10, i32 0, i32 1
  %582 = load float* %581, align 4
  br label %583

; <label>:583                                     ; preds = %576, %574, %555
  %584 = phi float [ %571, %555 ], [ %571, %574 ], [ %580, %576 ]
  %585 = phi float [ %572, %555 ], [ %572, %574 ], [ %582, %576 ]
  %586 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %587 = load { float, float }** %586, align 8
  %588 = getelementptr inbounds { float, float }* %587, i64 3
  %589 = getelementptr inbounds { float, float }* %588, i32 0, i32 0
  %590 = load float* %589, align 4
  %591 = getelementptr inbounds { float, float }* %588, i32 0, i32 1
  %592 = load float* %591, align 4
  %593 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 0
  %594 = load float* %593, align 4
  %595 = getelementptr inbounds { float, float }* %tnot, i32 0, i32 1
  %596 = load float* %595, align 4
  %597 = fmul float %590, %594
  %598 = fmul float %592, %596
  %599 = fmul float %590, %596
  %600 = fmul float %592, %594
  %601 = fsub float %597, %598
  %602 = fadd float %599, %600
  %603 = fcmp uno float %601, %601
  br i1 %603, label %604, label %613, !prof !1

; <label>:604                                     ; preds = %583
  %605 = fcmp uno float %602, %602
  br i1 %605, label %606, label %613, !prof !1

; <label>:606                                     ; preds = %604
  %607 = call <2 x float> @__mulsc3(float %590, float %592, float %594, float %596) #4
  %608 = bitcast { float, float }* %11 to <2 x float>*
  store <2 x float> %607, <2 x float>* %608, align 1
  %609 = getelementptr inbounds { float, float }* %11, i32 0, i32 0
  %610 = load float* %609, align 4
  %611 = getelementptr inbounds { float, float }* %11, i32 0, i32 1
  %612 = load float* %611, align 4
  br label %613

; <label>:613                                     ; preds = %606, %604, %583
  %614 = phi float [ %601, %583 ], [ %601, %604 ], [ %610, %606 ]
  %615 = phi float [ %602, %583 ], [ %602, %604 ], [ %612, %606 ]
  %616 = fadd float %584, %614
  %617 = fadd float %585, %615
  %618 = load i32* %j, align 4
  %619 = sext i32 %618 to i64
  %620 = load %struct.quantum_reg_struct** %3, align 8
  %621 = getelementptr inbounds %struct.quantum_reg_struct* %620, i32 0, i32 3
  %622 = load %struct.quantum_reg_node_struct** %621, align 8
  %623 = getelementptr inbounds %struct.quantum_reg_node_struct* %622, i64 %619
  %624 = getelementptr inbounds %struct.quantum_reg_node_struct* %623, i32 0, i32 0
  %625 = getelementptr inbounds { float, float }* %624, i32 0, i32 0
  %626 = getelementptr inbounds { float, float }* %624, i32 0, i32 1
  store float %616, float* %625, align 4
  store float %617, float* %626, align 4
  br label %627

; <label>:627                                     ; preds = %613, %541
  br label %763

; <label>:628                                     ; preds = %477
  %629 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %630 = load { float, float }** %629, align 8
  %631 = getelementptr inbounds { float, float }* %630, i64 1
  %632 = getelementptr inbounds { float, float }* %631, i32 0, i32 0
  %633 = load float* %632, align 4
  %634 = getelementptr inbounds { float, float }* %631, i32 0, i32 1
  %635 = load float* %634, align 4
  %636 = fcmp oeq float %633, 0.000000e+00
  %637 = fcmp oeq float %635, 0.000000e+00
  %638 = and i1 %636, %637
  br i1 %638, label %639, label %643

; <label>:639                                     ; preds = %628
  %640 = load i32* %iset, align 4
  %641 = icmp ne i32 %640, 0
  br i1 %641, label %642, label %643

; <label>:642                                     ; preds = %639
  br label %776

; <label>:643                                     ; preds = %639, %628
  %644 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %645 = load { float, float }** %644, align 8
  %646 = getelementptr inbounds { float, float }* %645, i64 2
  %647 = getelementptr inbounds { float, float }* %646, i32 0, i32 0
  %648 = load float* %647, align 4
  %649 = getelementptr inbounds { float, float }* %646, i32 0, i32 1
  %650 = load float* %649, align 4
  %651 = fcmp oeq float %648, 0.000000e+00
  %652 = fcmp oeq float %650, 0.000000e+00
  %653 = and i1 %651, %652
  br i1 %653, label %654, label %658

; <label>:654                                     ; preds = %643
  %655 = load i32* %iset, align 4
  %656 = icmp ne i32 %655, 0
  br i1 %656, label %658, label %657

; <label>:657                                     ; preds = %654
  br label %776

; <label>:658                                     ; preds = %654, %643
  %659 = load i32* %i, align 4
  %660 = sext i32 %659 to i64
  %661 = load %struct.quantum_reg_struct** %3, align 8
  %662 = getelementptr inbounds %struct.quantum_reg_struct* %661, i32 0, i32 3
  %663 = load %struct.quantum_reg_node_struct** %662, align 8
  %664 = getelementptr inbounds %struct.quantum_reg_node_struct* %663, i64 %660
  %665 = getelementptr inbounds %struct.quantum_reg_node_struct* %664, i32 0, i32 1
  %666 = load i64* %665, align 8
  %667 = load i32* %2, align 4
  %668 = zext i32 %667 to i64
  %669 = shl i64 1, %668
  %670 = xor i64 %666, %669
  %671 = load i32* %k, align 4
  %672 = sext i32 %671 to i64
  %673 = load %struct.quantum_reg_struct** %3, align 8
  %674 = getelementptr inbounds %struct.quantum_reg_struct* %673, i32 0, i32 3
  %675 = load %struct.quantum_reg_node_struct** %674, align 8
  %676 = getelementptr inbounds %struct.quantum_reg_node_struct* %675, i64 %672
  %677 = getelementptr inbounds %struct.quantum_reg_node_struct* %676, i32 0, i32 1
  store i64 %670, i64* %677, align 8
  %678 = load i32* %iset, align 4
  %679 = icmp ne i32 %678, 0
  br i1 %679, label %680, label %720

; <label>:680                                     ; preds = %658
  %681 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %682 = load { float, float }** %681, align 8
  %683 = getelementptr inbounds { float, float }* %682, i64 1
  %684 = getelementptr inbounds { float, float }* %683, i32 0, i32 0
  %685 = load float* %684, align 4
  %686 = getelementptr inbounds { float, float }* %683, i32 0, i32 1
  %687 = load float* %686, align 4
  %688 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %689 = load float* %688, align 4
  %690 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %691 = load float* %690, align 4
  %692 = fmul float %685, %689
  %693 = fmul float %687, %691
  %694 = fmul float %685, %691
  %695 = fmul float %687, %689
  %696 = fsub float %692, %693
  %697 = fadd float %694, %695
  %698 = fcmp uno float %696, %696
  br i1 %698, label %699, label %708, !prof !1

; <label>:699                                     ; preds = %680
  %700 = fcmp uno float %697, %697
  br i1 %700, label %701, label %708, !prof !1

; <label>:701                                     ; preds = %699
  %702 = call <2 x float> @__mulsc3(float %685, float %687, float %689, float %691) #4
  %703 = bitcast { float, float }* %12 to <2 x float>*
  store <2 x float> %702, <2 x float>* %703, align 1
  %704 = getelementptr inbounds { float, float }* %12, i32 0, i32 0
  %705 = load float* %704, align 4
  %706 = getelementptr inbounds { float, float }* %12, i32 0, i32 1
  %707 = load float* %706, align 4
  br label %708

; <label>:708                                     ; preds = %701, %699, %680
  %709 = phi float [ %696, %680 ], [ %696, %699 ], [ %705, %701 ]
  %710 = phi float [ %697, %680 ], [ %697, %699 ], [ %707, %701 ]
  %711 = load i32* %k, align 4
  %712 = sext i32 %711 to i64
  %713 = load %struct.quantum_reg_struct** %3, align 8
  %714 = getelementptr inbounds %struct.quantum_reg_struct* %713, i32 0, i32 3
  %715 = load %struct.quantum_reg_node_struct** %714, align 8
  %716 = getelementptr inbounds %struct.quantum_reg_node_struct* %715, i64 %712
  %717 = getelementptr inbounds %struct.quantum_reg_node_struct* %716, i32 0, i32 0
  %718 = getelementptr inbounds { float, float }* %717, i32 0, i32 0
  %719 = getelementptr inbounds { float, float }* %717, i32 0, i32 1
  store float %709, float* %718, align 4
  store float %710, float* %719, align 4
  br label %760

; <label>:720                                     ; preds = %658
  %721 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %722 = load { float, float }** %721, align 8
  %723 = getelementptr inbounds { float, float }* %722, i64 2
  %724 = getelementptr inbounds { float, float }* %723, i32 0, i32 0
  %725 = load float* %724, align 4
  %726 = getelementptr inbounds { float, float }* %723, i32 0, i32 1
  %727 = load float* %726, align 4
  %728 = getelementptr inbounds { float, float }* %t, i32 0, i32 0
  %729 = load float* %728, align 4
  %730 = getelementptr inbounds { float, float }* %t, i32 0, i32 1
  %731 = load float* %730, align 4
  %732 = fmul float %725, %729
  %733 = fmul float %727, %731
  %734 = fmul float %725, %731
  %735 = fmul float %727, %729
  %736 = fsub float %732, %733
  %737 = fadd float %734, %735
  %738 = fcmp uno float %736, %736
  br i1 %738, label %739, label %748, !prof !1

; <label>:739                                     ; preds = %720
  %740 = fcmp uno float %737, %737
  br i1 %740, label %741, label %748, !prof !1

; <label>:741                                     ; preds = %739
  %742 = call <2 x float> @__mulsc3(float %725, float %727, float %729, float %731) #4
  %743 = bitcast { float, float }* %13 to <2 x float>*
  store <2 x float> %742, <2 x float>* %743, align 1
  %744 = getelementptr inbounds { float, float }* %13, i32 0, i32 0
  %745 = load float* %744, align 4
  %746 = getelementptr inbounds { float, float }* %13, i32 0, i32 1
  %747 = load float* %746, align 4
  br label %748

; <label>:748                                     ; preds = %741, %739, %720
  %749 = phi float [ %736, %720 ], [ %736, %739 ], [ %745, %741 ]
  %750 = phi float [ %737, %720 ], [ %737, %739 ], [ %747, %741 ]
  %751 = load i32* %k, align 4
  %752 = sext i32 %751 to i64
  %753 = load %struct.quantum_reg_struct** %3, align 8
  %754 = getelementptr inbounds %struct.quantum_reg_struct* %753, i32 0, i32 3
  %755 = load %struct.quantum_reg_node_struct** %754, align 8
  %756 = getelementptr inbounds %struct.quantum_reg_node_struct* %755, i64 %752
  %757 = getelementptr inbounds %struct.quantum_reg_node_struct* %756, i32 0, i32 0
  %758 = getelementptr inbounds { float, float }* %757, i32 0, i32 0
  %759 = getelementptr inbounds { float, float }* %757, i32 0, i32 1
  store float %749, float* %758, align 4
  store float %750, float* %759, align 4
  br label %760

; <label>:760                                     ; preds = %748, %708
  %761 = load i32* %k, align 4
  %762 = add nsw i32 %761, 1
  store i32 %762, i32* %k, align 4
  br label %763

; <label>:763                                     ; preds = %760, %627
  %764 = load i32* %j, align 4
  %765 = icmp sge i32 %764, 0
  br i1 %765, label %766, label %771

; <label>:766                                     ; preds = %763
  %767 = load i32* %j, align 4
  %768 = sext i32 %767 to i64
  %769 = load i8** %done, align 8
  %770 = getelementptr inbounds i8* %769, i64 %768
  store i8 1, i8* %770, align 1
  br label %771

; <label>:771                                     ; preds = %766, %763
  br label %772

; <label>:772                                     ; preds = %771, %264
  br label %773

; <label>:773                                     ; preds = %772
  %774 = load i32* %i, align 4
  %775 = add nsw i32 %774, 1
  store i32 %775, i32* %i, align 4
  br label %258

; <label>:776                                     ; preds = %657, %642, %258
  %777 = load i32* %addsize, align 4
  %778 = load %struct.quantum_reg_struct** %3, align 8
  %779 = getelementptr inbounds %struct.quantum_reg_struct* %778, i32 0, i32 1
  %780 = load i32* %779, align 4
  %781 = add nsw i32 %780, %777
  store i32 %781, i32* %779, align 4
  %782 = load i8** %done, align 8
  call void @free(i8* %782) #4
  %783 = load %struct.quantum_reg_struct** %3, align 8
  %784 = getelementptr inbounds %struct.quantum_reg_struct* %783, i32 0, i32 1
  %785 = load i32* %784, align 4
  %786 = sub nsw i32 0, %785
  %787 = sext i32 %786 to i64
  %788 = mul i64 %787, 1
  %789 = call i64 @quantum_memman(i64 %788)
  store i32 0, i32* %i, align 4
  store i32 0, i32* %j, align 4
  br label %790

; <label>:790                                     ; preds = %865, %776
  %791 = load i32* %i, align 4
  %792 = load %struct.quantum_reg_struct** %3, align 8
  %793 = getelementptr inbounds %struct.quantum_reg_struct* %792, i32 0, i32 1
  %794 = load i32* %793, align 4
  %795 = icmp slt i32 %791, %794
  br i1 %795, label %796, label %868

; <label>:796                                     ; preds = %790
  %797 = load i32* %i, align 4
  %798 = sext i32 %797 to i64
  %799 = load %struct.quantum_reg_struct** %3, align 8
  %800 = getelementptr inbounds %struct.quantum_reg_struct* %799, i32 0, i32 3
  %801 = load %struct.quantum_reg_node_struct** %800, align 8
  %802 = getelementptr inbounds %struct.quantum_reg_node_struct* %801, i64 %798
  %803 = getelementptr inbounds %struct.quantum_reg_node_struct* %802, i32 0, i32 0
  %804 = getelementptr inbounds { float, float }* %803, i32 0, i32 0
  %805 = load float* %804, align 4
  %806 = getelementptr inbounds { float, float }* %803, i32 0, i32 1
  %807 = load float* %806, align 4
  %808 = getelementptr inbounds { float, float }* %14, i32 0, i32 0
  %809 = getelementptr inbounds { float, float }* %14, i32 0, i32 1
  store float %805, float* %808, align 4
  store float %807, float* %809, align 4
  %810 = bitcast { float, float }* %14 to <2 x float>*
  %811 = load <2 x float>* %810, align 1
  %812 = call float @quantum_prob_inline(<2 x float> %811)
  %813 = load float* %limit, align 4
  %814 = fcmp olt float %812, %813
  br i1 %814, label %815, label %820

; <label>:815                                     ; preds = %796
  %816 = load i32* %j, align 4
  %817 = add nsw i32 %816, 1
  store i32 %817, i32* %j, align 4
  %818 = load i32* %decsize, align 4
  %819 = add nsw i32 %818, 1
  store i32 %819, i32* %decsize, align 4
  br label %864

; <label>:820                                     ; preds = %796
  %821 = load i32* %j, align 4
  %822 = icmp ne i32 %821, 0
  br i1 %822, label %823, label %863

; <label>:823                                     ; preds = %820
  %824 = load i32* %i, align 4
  %825 = sext i32 %824 to i64
  %826 = load %struct.quantum_reg_struct** %3, align 8
  %827 = getelementptr inbounds %struct.quantum_reg_struct* %826, i32 0, i32 3
  %828 = load %struct.quantum_reg_node_struct** %827, align 8
  %829 = getelementptr inbounds %struct.quantum_reg_node_struct* %828, i64 %825
  %830 = getelementptr inbounds %struct.quantum_reg_node_struct* %829, i32 0, i32 1
  %831 = load i64* %830, align 8
  %832 = load i32* %i, align 4
  %833 = load i32* %j, align 4
  %834 = sub nsw i32 %832, %833
  %835 = sext i32 %834 to i64
  %836 = load %struct.quantum_reg_struct** %3, align 8
  %837 = getelementptr inbounds %struct.quantum_reg_struct* %836, i32 0, i32 3
  %838 = load %struct.quantum_reg_node_struct** %837, align 8
  %839 = getelementptr inbounds %struct.quantum_reg_node_struct* %838, i64 %835
  %840 = getelementptr inbounds %struct.quantum_reg_node_struct* %839, i32 0, i32 1
  store i64 %831, i64* %840, align 8
  %841 = load i32* %i, align 4
  %842 = sext i32 %841 to i64
  %843 = load %struct.quantum_reg_struct** %3, align 8
  %844 = getelementptr inbounds %struct.quantum_reg_struct* %843, i32 0, i32 3
  %845 = load %struct.quantum_reg_node_struct** %844, align 8
  %846 = getelementptr inbounds %struct.quantum_reg_node_struct* %845, i64 %842
  %847 = getelementptr inbounds %struct.quantum_reg_node_struct* %846, i32 0, i32 0
  %848 = getelementptr inbounds { float, float }* %847, i32 0, i32 0
  %849 = load float* %848, align 4
  %850 = getelementptr inbounds { float, float }* %847, i32 0, i32 1
  %851 = load float* %850, align 4
  %852 = load i32* %i, align 4
  %853 = load i32* %j, align 4
  %854 = sub nsw i32 %852, %853
  %855 = sext i32 %854 to i64
  %856 = load %struct.quantum_reg_struct** %3, align 8
  %857 = getelementptr inbounds %struct.quantum_reg_struct* %856, i32 0, i32 3
  %858 = load %struct.quantum_reg_node_struct** %857, align 8
  %859 = getelementptr inbounds %struct.quantum_reg_node_struct* %858, i64 %855
  %860 = getelementptr inbounds %struct.quantum_reg_node_struct* %859, i32 0, i32 0
  %861 = getelementptr inbounds { float, float }* %860, i32 0, i32 0
  %862 = getelementptr inbounds { float, float }* %860, i32 0, i32 1
  store float %849, float* %861, align 4
  store float %851, float* %862, align 4
  br label %863

; <label>:863                                     ; preds = %823, %820
  br label %864

; <label>:864                                     ; preds = %863, %815
  br label %865

; <label>:865                                     ; preds = %864
  %866 = load i32* %i, align 4
  %867 = add nsw i32 %866, 1
  store i32 %867, i32* %i, align 4
  br label %790

; <label>:868                                     ; preds = %790
  %869 = load i32* %decsize, align 4
  %870 = icmp ne i32 %869, 0
  br i1 %870, label %871, label %907

; <label>:871                                     ; preds = %868
  %872 = load i32* %decsize, align 4
  %873 = load %struct.quantum_reg_struct** %3, align 8
  %874 = getelementptr inbounds %struct.quantum_reg_struct* %873, i32 0, i32 1
  %875 = load i32* %874, align 4
  %876 = sub nsw i32 %875, %872
  store i32 %876, i32* %874, align 4
  %877 = load %struct.quantum_reg_struct** %3, align 8
  %878 = getelementptr inbounds %struct.quantum_reg_struct* %877, i32 0, i32 3
  %879 = load %struct.quantum_reg_node_struct** %878, align 8
  %880 = bitcast %struct.quantum_reg_node_struct* %879 to i8*
  %881 = load %struct.quantum_reg_struct** %3, align 8
  %882 = getelementptr inbounds %struct.quantum_reg_struct* %881, i32 0, i32 1
  %883 = load i32* %882, align 4
  %884 = sext i32 %883 to i64
  %885 = mul i64 %884, 16
  %886 = call i8* @realloc(i8* %880, i64 %885) #4
  %887 = bitcast i8* %886 to %struct.quantum_reg_node_struct*
  %888 = load %struct.quantum_reg_struct** %3, align 8
  %889 = getelementptr inbounds %struct.quantum_reg_struct* %888, i32 0, i32 3
  store %struct.quantum_reg_node_struct* %887, %struct.quantum_reg_node_struct** %889, align 8
  %890 = load %struct.quantum_reg_struct** %3, align 8
  %891 = getelementptr inbounds %struct.quantum_reg_struct* %890, i32 0, i32 3
  %892 = load %struct.quantum_reg_node_struct** %891, align 8
  %893 = icmp ne %struct.quantum_reg_node_struct* %892, null
  br i1 %893, label %901, label %894

; <label>:894                                     ; preds = %871
  %895 = load %struct.quantum_reg_struct** %3, align 8
  %896 = getelementptr inbounds %struct.quantum_reg_struct* %895, i32 0, i32 1
  %897 = load i32* %896, align 4
  %898 = load i32* %addsize, align 4
  %899 = add nsw i32 %897, %898
  %900 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i32 0, i32 0), i32 %899)
  call void @exit(i32 1) #6
  unreachable

; <label>:901                                     ; preds = %871
  %902 = load i32* %decsize, align 4
  %903 = sub nsw i32 0, %902
  %904 = sext i32 %903 to i64
  %905 = mul i64 %904, 16
  %906 = call i64 @quantum_memman(i64 %905)
  br label %907

; <label>:907                                     ; preds = %901, %868
  %908 = load %struct.quantum_reg_struct** %3, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %908)
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_hadamard(i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.quantum_reg_struct*, align 8
  %m = alloca %struct.quantum_matrix_struct, align 8
  %3 = alloca %struct.quantum_matrix_struct, align 8
  store i32 %target, i32* %1, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %2, align 8
  %4 = load i32* %1, align 4
  %5 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 6, i32 %4)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %53

; <label>:8                                       ; preds = %0
  %9 = call { i64, { float, float }* } @quantum_new_matrix(i32 2, i32 2)
  %10 = bitcast %struct.quantum_matrix_struct* %3 to { i64, { float, float }* }*
  %11 = getelementptr { i64, { float, float }* }* %10, i32 0, i32 0
  %12 = extractvalue { i64, { float, float }* } %9, 0
  store i64 %12, i64* %11, align 1
  %13 = getelementptr { i64, { float, float }* }* %10, i32 0, i32 1
  %14 = extractvalue { i64, { float, float }* } %9, 1
  store { float, float }* %14, { float, float }** %13, align 1
  %15 = bitcast %struct.quantum_matrix_struct* %m to i8*
  %16 = bitcast %struct.quantum_matrix_struct* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* %16, i64 16, i32 8, i1 false)
  %17 = call double @sqrt(double 5.000000e-01) #4
  %18 = fptrunc double %17 to float
  %19 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %20 = load { float, float }** %19, align 8
  %21 = getelementptr inbounds { float, float }* %20, i64 0
  %22 = getelementptr inbounds { float, float }* %21, i32 0, i32 0
  %23 = getelementptr inbounds { float, float }* %21, i32 0, i32 1
  store float %18, float* %22, align 4
  store float 0.000000e+00, float* %23, align 4
  %24 = call double @sqrt(double 5.000000e-01) #4
  %25 = fptrunc double %24 to float
  %26 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %27 = load { float, float }** %26, align 8
  %28 = getelementptr inbounds { float, float }* %27, i64 1
  %29 = getelementptr inbounds { float, float }* %28, i32 0, i32 0
  %30 = getelementptr inbounds { float, float }* %28, i32 0, i32 1
  store float %25, float* %29, align 4
  store float 0.000000e+00, float* %30, align 4
  %31 = call double @sqrt(double 5.000000e-01) #4
  %32 = fptrunc double %31 to float
  %33 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %34 = load { float, float }** %33, align 8
  %35 = getelementptr inbounds { float, float }* %34, i64 2
  %36 = getelementptr inbounds { float, float }* %35, i32 0, i32 0
  %37 = getelementptr inbounds { float, float }* %35, i32 0, i32 1
  store float %32, float* %36, align 4
  store float 0.000000e+00, float* %37, align 4
  %38 = call double @sqrt(double 5.000000e-01) #4
  %39 = fsub double -0.000000e+00, %38
  %40 = fptrunc double %39 to float
  %41 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %42 = load { float, float }** %41, align 8
  %43 = getelementptr inbounds { float, float }* %42, i64 3
  %44 = getelementptr inbounds { float, float }* %43, i32 0, i32 0
  %45 = getelementptr inbounds { float, float }* %43, i32 0, i32 1
  store float %40, float* %44, align 4
  store float 0.000000e+00, float* %45, align 4
  %46 = load i32* %1, align 4
  %47 = load %struct.quantum_reg_struct** %2, align 8
  %48 = bitcast %struct.quantum_matrix_struct* %m to { i64, { float, float }* }*
  %49 = getelementptr { i64, { float, float }* }* %48, i32 0, i32 0
  %50 = load i64* %49, align 1
  %51 = getelementptr { i64, { float, float }* }* %48, i32 0, i32 1
  %52 = load { float, float }** %51, align 1
  call void @quantum_gate1(i32 %46, i64 %50, { float, float }* %52, %struct.quantum_reg_struct* %47)
  call void @quantum_delete_matrix(%struct.quantum_matrix_struct* %m)
  br label %53

; <label>:53                                      ; preds = %8, %7
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
  %1 = alloca i32, align 4
  %2 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  store i32 %width, i32* %1, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %10, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %1, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %13

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = load %struct.quantum_reg_struct** %2, align 8
  call void @quantum_hadamard(i32 %8, %struct.quantum_reg_struct* %9)
  br label %10

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %3

; <label>:13                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_r_x(i32 %target, float %gamma, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca %struct.quantum_reg_struct*, align 8
  %m = alloca %struct.quantum_matrix_struct, align 8
  %4 = alloca %struct.quantum_matrix_struct, align 8
  store i32 %target, i32* %1, align 4
  store float %gamma, float* %2, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %3, align 8
  %5 = load i32* %1, align 4
  %6 = load float* %2, align 4
  %7 = fpext float %6 to double
  %8 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 7, i32 %5, double %7)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  br label %73

; <label>:11                                      ; preds = %0
  %12 = call { i64, { float, float }* } @quantum_new_matrix(i32 2, i32 2)
  %13 = bitcast %struct.quantum_matrix_struct* %4 to { i64, { float, float }* }*
  %14 = getelementptr { i64, { float, float }* }* %13, i32 0, i32 0
  %15 = extractvalue { i64, { float, float }* } %12, 0
  store i64 %15, i64* %14, align 1
  %16 = getelementptr { i64, { float, float }* }* %13, i32 0, i32 1
  %17 = extractvalue { i64, { float, float }* } %12, 1
  store { float, float }* %17, { float, float }** %16, align 1
  %18 = bitcast %struct.quantum_matrix_struct* %m to i8*
  %19 = bitcast %struct.quantum_matrix_struct* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 16, i32 8, i1 false)
  %20 = load float* %2, align 4
  %21 = fdiv float %20, 2.000000e+00
  %22 = fpext float %21 to double
  %23 = call double @cos(double %22) #4
  %24 = fptrunc double %23 to float
  %25 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %26 = load { float, float }** %25, align 8
  %27 = getelementptr inbounds { float, float }* %26, i64 0
  %28 = getelementptr inbounds { float, float }* %27, i32 0, i32 0
  %29 = getelementptr inbounds { float, float }* %27, i32 0, i32 1
  store float %24, float* %28, align 4
  store float 0.000000e+00, float* %29, align 4
  %30 = load float* %2, align 4
  %31 = fdiv float %30, 2.000000e+00
  %32 = fpext float %31 to double
  %33 = call double @sin(double %32) #4
  %34 = fmul double -0.000000e+00, %33
  %35 = fmul double -1.000000e+00, %33
  %36 = fptrunc double %34 to float
  %37 = fptrunc double %35 to float
  %38 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %39 = load { float, float }** %38, align 8
  %40 = getelementptr inbounds { float, float }* %39, i64 1
  %41 = getelementptr inbounds { float, float }* %40, i32 0, i32 0
  %42 = getelementptr inbounds { float, float }* %40, i32 0, i32 1
  store float %36, float* %41, align 4
  store float %37, float* %42, align 4
  %43 = load float* %2, align 4
  %44 = fdiv float %43, 2.000000e+00
  %45 = fpext float %44 to double
  %46 = call double @sin(double %45) #4
  %47 = fmul double -0.000000e+00, %46
  %48 = fmul double -1.000000e+00, %46
  %49 = fptrunc double %47 to float
  %50 = fptrunc double %48 to float
  %51 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %52 = load { float, float }** %51, align 8
  %53 = getelementptr inbounds { float, float }* %52, i64 2
  %54 = getelementptr inbounds { float, float }* %53, i32 0, i32 0
  %55 = getelementptr inbounds { float, float }* %53, i32 0, i32 1
  store float %49, float* %54, align 4
  store float %50, float* %55, align 4
  %56 = load float* %2, align 4
  %57 = fdiv float %56, 2.000000e+00
  %58 = fpext float %57 to double
  %59 = call double @cos(double %58) #4
  %60 = fptrunc double %59 to float
  %61 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %62 = load { float, float }** %61, align 8
  %63 = getelementptr inbounds { float, float }* %62, i64 3
  %64 = getelementptr inbounds { float, float }* %63, i32 0, i32 0
  %65 = getelementptr inbounds { float, float }* %63, i32 0, i32 1
  store float %60, float* %64, align 4
  store float 0.000000e+00, float* %65, align 4
  %66 = load i32* %1, align 4
  %67 = load %struct.quantum_reg_struct** %3, align 8
  %68 = bitcast %struct.quantum_matrix_struct* %m to { i64, { float, float }* }*
  %69 = getelementptr { i64, { float, float }* }* %68, i32 0, i32 0
  %70 = load i64* %69, align 1
  %71 = getelementptr { i64, { float, float }* }* %68, i32 0, i32 1
  %72 = load { float, float }** %71, align 1
  call void @quantum_gate1(i32 %66, i64 %70, { float, float }* %72, %struct.quantum_reg_struct* %67)
  call void @quantum_delete_matrix(%struct.quantum_matrix_struct* %m)
  br label %73

; <label>:73                                      ; preds = %11, %10
  ret void
}

; Function Attrs: nounwind
declare double @cos(double) #2

; Function Attrs: nounwind
declare double @sin(double) #2

; Function Attrs: nounwind uwtable
define void @quantum_r_y(i32 %target, float %gamma, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca %struct.quantum_reg_struct*, align 8
  %m = alloca %struct.quantum_matrix_struct, align 8
  %4 = alloca %struct.quantum_matrix_struct, align 8
  store i32 %target, i32* %1, align 4
  store float %gamma, float* %2, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %3, align 8
  %5 = load i32* %1, align 4
  %6 = load float* %2, align 4
  %7 = fpext float %6 to double
  %8 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 8, i32 %5, double %7)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  br label %68

; <label>:11                                      ; preds = %0
  %12 = call { i64, { float, float }* } @quantum_new_matrix(i32 2, i32 2)
  %13 = bitcast %struct.quantum_matrix_struct* %4 to { i64, { float, float }* }*
  %14 = getelementptr { i64, { float, float }* }* %13, i32 0, i32 0
  %15 = extractvalue { i64, { float, float }* } %12, 0
  store i64 %15, i64* %14, align 1
  %16 = getelementptr { i64, { float, float }* }* %13, i32 0, i32 1
  %17 = extractvalue { i64, { float, float }* } %12, 1
  store { float, float }* %17, { float, float }** %16, align 1
  %18 = bitcast %struct.quantum_matrix_struct* %m to i8*
  %19 = bitcast %struct.quantum_matrix_struct* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 16, i32 8, i1 false)
  %20 = load float* %2, align 4
  %21 = fdiv float %20, 2.000000e+00
  %22 = fpext float %21 to double
  %23 = call double @cos(double %22) #4
  %24 = fptrunc double %23 to float
  %25 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %26 = load { float, float }** %25, align 8
  %27 = getelementptr inbounds { float, float }* %26, i64 0
  %28 = getelementptr inbounds { float, float }* %27, i32 0, i32 0
  %29 = getelementptr inbounds { float, float }* %27, i32 0, i32 1
  store float %24, float* %28, align 4
  store float 0.000000e+00, float* %29, align 4
  %30 = load float* %2, align 4
  %31 = fdiv float %30, 2.000000e+00
  %32 = fpext float %31 to double
  %33 = call double @sin(double %32) #4
  %34 = fsub double -0.000000e+00, %33
  %35 = fptrunc double %34 to float
  %36 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %37 = load { float, float }** %36, align 8
  %38 = getelementptr inbounds { float, float }* %37, i64 1
  %39 = getelementptr inbounds { float, float }* %38, i32 0, i32 0
  %40 = getelementptr inbounds { float, float }* %38, i32 0, i32 1
  store float %35, float* %39, align 4
  store float 0.000000e+00, float* %40, align 4
  %41 = load float* %2, align 4
  %42 = fdiv float %41, 2.000000e+00
  %43 = fpext float %42 to double
  %44 = call double @sin(double %43) #4
  %45 = fptrunc double %44 to float
  %46 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %47 = load { float, float }** %46, align 8
  %48 = getelementptr inbounds { float, float }* %47, i64 2
  %49 = getelementptr inbounds { float, float }* %48, i32 0, i32 0
  %50 = getelementptr inbounds { float, float }* %48, i32 0, i32 1
  store float %45, float* %49, align 4
  store float 0.000000e+00, float* %50, align 4
  %51 = load float* %2, align 4
  %52 = fdiv float %51, 2.000000e+00
  %53 = fpext float %52 to double
  %54 = call double @cos(double %53) #4
  %55 = fptrunc double %54 to float
  %56 = getelementptr inbounds %struct.quantum_matrix_struct* %m, i32 0, i32 2
  %57 = load { float, float }** %56, align 8
  %58 = getelementptr inbounds { float, float }* %57, i64 3
  %59 = getelementptr inbounds { float, float }* %58, i32 0, i32 0
  %60 = getelementptr inbounds { float, float }* %58, i32 0, i32 1
  store float %55, float* %59, align 4
  store float 0.000000e+00, float* %60, align 4
  %61 = load i32* %1, align 4
  %62 = load %struct.quantum_reg_struct** %3, align 8
  %63 = bitcast %struct.quantum_matrix_struct* %m to { i64, { float, float }* }*
  %64 = getelementptr { i64, { float, float }* }* %63, i32 0, i32 0
  %65 = load i64* %64, align 1
  %66 = getelementptr { i64, { float, float }* }* %63, i32 0, i32 1
  %67 = load { float, float }** %66, align 1
  call void @quantum_gate1(i32 %61, i64 %65, { float, float }* %67, %struct.quantum_reg_struct* %62)
  call void @quantum_delete_matrix(%struct.quantum_matrix_struct* %m)
  br label %68

; <label>:68                                      ; preds = %11, %10
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_r_z(i32 %target, float %gamma, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %z = alloca { float, float }, align 4
  %4 = alloca { float, float }, align 4
  %5 = alloca { float, float }, align 4
  %6 = alloca { float, float }, align 4
  store i32 %target, i32* %1, align 4
  store float %gamma, float* %2, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %3, align 8
  %7 = load i32* %1, align 4
  %8 = load float* %2, align 4
  %9 = fpext float %8 to double
  %10 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 9, i32 %7, double %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  br label %111

; <label>:13                                      ; preds = %0
  %14 = load float* %2, align 4
  %15 = fdiv float %14, 2.000000e+00
  %16 = call <2 x float> @quantum_cexp(float %15)
  %17 = bitcast { float, float }* %4 to <2 x float>*
  store <2 x float> %16, <2 x float>* %17, align 1
  %18 = getelementptr inbounds { float, float }* %4, i32 0, i32 0
  %19 = load float* %18, align 4
  %20 = getelementptr inbounds { float, float }* %4, i32 0, i32 1
  %21 = load float* %20, align 4
  %22 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %23 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  store float %19, float* %22, align 4
  store float %21, float* %23, align 4
  store i32 0, i32* %i, align 4
  br label %24

; <label>:24                                      ; preds = %106, %13
  %25 = load i32* %i, align 4
  %26 = load %struct.quantum_reg_struct** %3, align 8
  %27 = getelementptr inbounds %struct.quantum_reg_struct* %26, i32 0, i32 1
  %28 = load i32* %27, align 4
  %29 = icmp slt i32 %25, %28
  br i1 %29, label %30, label %109

; <label>:30                                      ; preds = %24
  %31 = load i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = load %struct.quantum_reg_struct** %3, align 8
  %34 = getelementptr inbounds %struct.quantum_reg_struct* %33, i32 0, i32 3
  %35 = load %struct.quantum_reg_node_struct** %34, align 8
  %36 = getelementptr inbounds %struct.quantum_reg_node_struct* %35, i64 %32
  %37 = getelementptr inbounds %struct.quantum_reg_node_struct* %36, i32 0, i32 1
  %38 = load i64* %37, align 8
  %39 = load i32* %1, align 4
  %40 = zext i32 %39 to i64
  %41 = shl i64 1, %40
  %42 = and i64 %38, %41
  %43 = icmp ne i64 %42, 0
  br i1 %43, label %44, label %81

; <label>:44                                      ; preds = %30
  %45 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %46 = load float* %45, align 4
  %47 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %48 = load float* %47, align 4
  %49 = load i32* %i, align 4
  %50 = sext i32 %49 to i64
  %51 = load %struct.quantum_reg_struct** %3, align 8
  %52 = getelementptr inbounds %struct.quantum_reg_struct* %51, i32 0, i32 3
  %53 = load %struct.quantum_reg_node_struct** %52, align 8
  %54 = getelementptr inbounds %struct.quantum_reg_node_struct* %53, i64 %50
  %55 = getelementptr inbounds %struct.quantum_reg_node_struct* %54, i32 0, i32 0
  %56 = getelementptr inbounds { float, float }* %55, i32 0, i32 0
  %57 = load float* %56, align 4
  %58 = getelementptr inbounds { float, float }* %55, i32 0, i32 1
  %59 = load float* %58, align 4
  %60 = fmul float %57, %46
  %61 = fmul float %59, %48
  %62 = fmul float %57, %48
  %63 = fmul float %59, %46
  %64 = fsub float %60, %61
  %65 = fadd float %62, %63
  %66 = fcmp uno float %64, %64
  br i1 %66, label %67, label %76, !prof !1

; <label>:67                                      ; preds = %44
  %68 = fcmp uno float %65, %65
  br i1 %68, label %69, label %76, !prof !1

; <label>:69                                      ; preds = %67
  %70 = call <2 x float> @__mulsc3(float %57, float %59, float %46, float %48) #4
  %71 = bitcast { float, float }* %5 to <2 x float>*
  store <2 x float> %70, <2 x float>* %71, align 1
  %72 = getelementptr inbounds { float, float }* %5, i32 0, i32 0
  %73 = load float* %72, align 4
  %74 = getelementptr inbounds { float, float }* %5, i32 0, i32 1
  %75 = load float* %74, align 4
  br label %76

; <label>:76                                      ; preds = %69, %67, %44
  %77 = phi float [ %64, %44 ], [ %64, %67 ], [ %73, %69 ]
  %78 = phi float [ %65, %44 ], [ %65, %67 ], [ %75, %69 ]
  %79 = getelementptr inbounds { float, float }* %55, i32 0, i32 0
  %80 = getelementptr inbounds { float, float }* %55, i32 0, i32 1
  store float %77, float* %79, align 4
  store float %78, float* %80, align 4
  br label %105

; <label>:81                                      ; preds = %30
  %82 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %83 = load float* %82, align 4
  %84 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %85 = load float* %84, align 4
  %86 = load i32* %i, align 4
  %87 = sext i32 %86 to i64
  %88 = load %struct.quantum_reg_struct** %3, align 8
  %89 = getelementptr inbounds %struct.quantum_reg_struct* %88, i32 0, i32 3
  %90 = load %struct.quantum_reg_node_struct** %89, align 8
  %91 = getelementptr inbounds %struct.quantum_reg_node_struct* %90, i64 %87
  %92 = getelementptr inbounds %struct.quantum_reg_node_struct* %91, i32 0, i32 0
  %93 = getelementptr inbounds { float, float }* %92, i32 0, i32 0
  %94 = load float* %93, align 4
  %95 = getelementptr inbounds { float, float }* %92, i32 0, i32 1
  %96 = load float* %95, align 4
  %97 = call <2 x float> @__divsc3(float %94, float %96, float %83, float %85) #4
  %98 = bitcast { float, float }* %6 to <2 x float>*
  store <2 x float> %97, <2 x float>* %98, align 1
  %99 = getelementptr inbounds { float, float }* %6, i32 0, i32 0
  %100 = load float* %99, align 4
  %101 = getelementptr inbounds { float, float }* %6, i32 0, i32 1
  %102 = load float* %101, align 4
  %103 = getelementptr inbounds { float, float }* %92, i32 0, i32 0
  %104 = getelementptr inbounds { float, float }* %92, i32 0, i32 1
  store float %100, float* %103, align 4
  store float %102, float* %104, align 4
  br label %105

; <label>:105                                     ; preds = %81, %76
  br label %106

; <label>:106                                     ; preds = %105
  %107 = load i32* %i, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %i, align 4
  br label %24

; <label>:109                                     ; preds = %24
  %110 = load %struct.quantum_reg_struct** %3, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %110)
  br label %111

; <label>:111                                     ; preds = %109, %12
  ret void
}

declare <2 x float> @quantum_cexp(float) #1

declare <2 x float> @__divsc3(float, float, float, float)

; Function Attrs: nounwind uwtable
define void @quantum_phase_scale(i32 %target, float %gamma, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %z = alloca { float, float }, align 4
  %4 = alloca { float, float }, align 4
  %5 = alloca { float, float }, align 4
  store i32 %target, i32* %1, align 4
  store float %gamma, float* %2, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %3, align 8
  %6 = load i32* %1, align 4
  %7 = load float* %2, align 4
  %8 = fpext float %7 to double
  %9 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 11, i32 %6, double %8)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  br label %70

; <label>:12                                      ; preds = %0
  %13 = load float* %2, align 4
  %14 = call <2 x float> @quantum_cexp(float %13)
  %15 = bitcast { float, float }* %4 to <2 x float>*
  store <2 x float> %14, <2 x float>* %15, align 1
  %16 = getelementptr inbounds { float, float }* %4, i32 0, i32 0
  %17 = load float* %16, align 4
  %18 = getelementptr inbounds { float, float }* %4, i32 0, i32 1
  %19 = load float* %18, align 4
  %20 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %21 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  store float %17, float* %20, align 4
  store float %19, float* %21, align 4
  store i32 0, i32* %i, align 4
  br label %22

; <label>:22                                      ; preds = %65, %12
  %23 = load i32* %i, align 4
  %24 = load %struct.quantum_reg_struct** %3, align 8
  %25 = getelementptr inbounds %struct.quantum_reg_struct* %24, i32 0, i32 1
  %26 = load i32* %25, align 4
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %68

; <label>:28                                      ; preds = %22
  %29 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %30 = load float* %29, align 4
  %31 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %32 = load float* %31, align 4
  %33 = load i32* %i, align 4
  %34 = sext i32 %33 to i64
  %35 = load %struct.quantum_reg_struct** %3, align 8
  %36 = getelementptr inbounds %struct.quantum_reg_struct* %35, i32 0, i32 3
  %37 = load %struct.quantum_reg_node_struct** %36, align 8
  %38 = getelementptr inbounds %struct.quantum_reg_node_struct* %37, i64 %34
  %39 = getelementptr inbounds %struct.quantum_reg_node_struct* %38, i32 0, i32 0
  %40 = getelementptr inbounds { float, float }* %39, i32 0, i32 0
  %41 = load float* %40, align 4
  %42 = getelementptr inbounds { float, float }* %39, i32 0, i32 1
  %43 = load float* %42, align 4
  %44 = fmul float %41, %30
  %45 = fmul float %43, %32
  %46 = fmul float %41, %32
  %47 = fmul float %43, %30
  %48 = fsub float %44, %45
  %49 = fadd float %46, %47
  %50 = fcmp uno float %48, %48
  br i1 %50, label %51, label %60, !prof !1

; <label>:51                                      ; preds = %28
  %52 = fcmp uno float %49, %49
  br i1 %52, label %53, label %60, !prof !1

; <label>:53                                      ; preds = %51
  %54 = call <2 x float> @__mulsc3(float %41, float %43, float %30, float %32) #4
  %55 = bitcast { float, float }* %5 to <2 x float>*
  store <2 x float> %54, <2 x float>* %55, align 1
  %56 = getelementptr inbounds { float, float }* %5, i32 0, i32 0
  %57 = load float* %56, align 4
  %58 = getelementptr inbounds { float, float }* %5, i32 0, i32 1
  %59 = load float* %58, align 4
  br label %60

; <label>:60                                      ; preds = %53, %51, %28
  %61 = phi float [ %48, %28 ], [ %48, %51 ], [ %57, %53 ]
  %62 = phi float [ %49, %28 ], [ %49, %51 ], [ %59, %53 ]
  %63 = getelementptr inbounds { float, float }* %39, i32 0, i32 0
  %64 = getelementptr inbounds { float, float }* %39, i32 0, i32 1
  store float %61, float* %63, align 4
  store float %62, float* %64, align 4
  br label %65

; <label>:65                                      ; preds = %60
  %66 = load i32* %i, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %i, align 4
  br label %22

; <label>:68                                      ; preds = %22
  %69 = load %struct.quantum_reg_struct** %3, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %69)
  br label %70

; <label>:70                                      ; preds = %68, %11
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_phase_kick(i32 %target, float %gamma, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %z = alloca { float, float }, align 4
  %4 = alloca { float, float }, align 4
  %5 = alloca { float, float }, align 4
  store i32 %target, i32* %1, align 4
  store float %gamma, float* %2, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %3, align 8
  %6 = load i32* %1, align 4
  %7 = load float* %2, align 4
  %8 = fpext float %7 to double
  %9 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 10, i32 %6, double %8)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  br label %85

; <label>:12                                      ; preds = %0
  %13 = load float* %2, align 4
  %14 = call <2 x float> @quantum_cexp(float %13)
  %15 = bitcast { float, float }* %4 to <2 x float>*
  store <2 x float> %14, <2 x float>* %15, align 1
  %16 = getelementptr inbounds { float, float }* %4, i32 0, i32 0
  %17 = load float* %16, align 4
  %18 = getelementptr inbounds { float, float }* %4, i32 0, i32 1
  %19 = load float* %18, align 4
  %20 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %21 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  store float %17, float* %20, align 4
  store float %19, float* %21, align 4
  store i32 0, i32* %i, align 4
  br label %22

; <label>:22                                      ; preds = %80, %12
  %23 = load i32* %i, align 4
  %24 = load %struct.quantum_reg_struct** %3, align 8
  %25 = getelementptr inbounds %struct.quantum_reg_struct* %24, i32 0, i32 1
  %26 = load i32* %25, align 4
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %83

; <label>:28                                      ; preds = %22
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load %struct.quantum_reg_struct** %3, align 8
  %32 = getelementptr inbounds %struct.quantum_reg_struct* %31, i32 0, i32 3
  %33 = load %struct.quantum_reg_node_struct** %32, align 8
  %34 = getelementptr inbounds %struct.quantum_reg_node_struct* %33, i64 %30
  %35 = getelementptr inbounds %struct.quantum_reg_node_struct* %34, i32 0, i32 1
  %36 = load i64* %35, align 8
  %37 = load i32* %1, align 4
  %38 = zext i32 %37 to i64
  %39 = shl i64 1, %38
  %40 = and i64 %36, %39
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %79

; <label>:42                                      ; preds = %28
  %43 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %44 = load float* %43, align 4
  %45 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %46 = load float* %45, align 4
  %47 = load i32* %i, align 4
  %48 = sext i32 %47 to i64
  %49 = load %struct.quantum_reg_struct** %3, align 8
  %50 = getelementptr inbounds %struct.quantum_reg_struct* %49, i32 0, i32 3
  %51 = load %struct.quantum_reg_node_struct** %50, align 8
  %52 = getelementptr inbounds %struct.quantum_reg_node_struct* %51, i64 %48
  %53 = getelementptr inbounds %struct.quantum_reg_node_struct* %52, i32 0, i32 0
  %54 = getelementptr inbounds { float, float }* %53, i32 0, i32 0
  %55 = load float* %54, align 4
  %56 = getelementptr inbounds { float, float }* %53, i32 0, i32 1
  %57 = load float* %56, align 4
  %58 = fmul float %55, %44
  %59 = fmul float %57, %46
  %60 = fmul float %55, %46
  %61 = fmul float %57, %44
  %62 = fsub float %58, %59
  %63 = fadd float %60, %61
  %64 = fcmp uno float %62, %62
  br i1 %64, label %65, label %74, !prof !1

; <label>:65                                      ; preds = %42
  %66 = fcmp uno float %63, %63
  br i1 %66, label %67, label %74, !prof !1

; <label>:67                                      ; preds = %65
  %68 = call <2 x float> @__mulsc3(float %55, float %57, float %44, float %46) #4
  %69 = bitcast { float, float }* %5 to <2 x float>*
  store <2 x float> %68, <2 x float>* %69, align 1
  %70 = getelementptr inbounds { float, float }* %5, i32 0, i32 0
  %71 = load float* %70, align 4
  %72 = getelementptr inbounds { float, float }* %5, i32 0, i32 1
  %73 = load float* %72, align 4
  br label %74

; <label>:74                                      ; preds = %67, %65, %42
  %75 = phi float [ %62, %42 ], [ %62, %65 ], [ %71, %67 ]
  %76 = phi float [ %63, %42 ], [ %63, %65 ], [ %73, %67 ]
  %77 = getelementptr inbounds { float, float }* %53, i32 0, i32 0
  %78 = getelementptr inbounds { float, float }* %53, i32 0, i32 1
  store float %75, float* %77, align 4
  store float %76, float* %78, align 4
  br label %79

; <label>:79                                      ; preds = %74, %28
  br label %80

; <label>:80                                      ; preds = %79
  %81 = load i32* %i, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %i, align 4
  br label %22

; <label>:83                                      ; preds = %22
  %84 = load %struct.quantum_reg_struct** %3, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %84)
  br label %85

; <label>:85                                      ; preds = %83, %11
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_cond_phase(i32 %control, i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %z = alloca { float, float }, align 4
  %4 = alloca { float, float }, align 4
  %5 = alloca { float, float }, align 4
  store i32 %control, i32* %1, align 4
  store i32 %target, i32* %2, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %3, align 8
  %6 = load i32* %1, align 4
  %7 = load i32* %2, align 4
  %8 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 12, i32 %6, i32 %7)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  br label %106

; <label>:11                                      ; preds = %0
  %12 = load i32* %1, align 4
  %13 = load i32* %2, align 4
  %14 = sub nsw i32 %12, %13
  %15 = zext i32 %14 to i64
  %16 = shl i64 1, %15
  %17 = uitofp i64 %16 to double
  %18 = fdiv double 0x400921FB54524550, %17
  %19 = fptrunc double %18 to float
  %20 = call <2 x float> @quantum_cexp(float %19)
  %21 = bitcast { float, float }* %4 to <2 x float>*
  store <2 x float> %20, <2 x float>* %21, align 1
  %22 = getelementptr inbounds { float, float }* %4, i32 0, i32 0
  %23 = load float* %22, align 4
  %24 = getelementptr inbounds { float, float }* %4, i32 0, i32 1
  %25 = load float* %24, align 4
  %26 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %27 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  store float %23, float* %26, align 4
  store float %25, float* %27, align 4
  store i32 0, i32* %i, align 4
  br label %28

; <label>:28                                      ; preds = %101, %11
  %29 = load i32* %i, align 4
  %30 = load %struct.quantum_reg_struct** %3, align 8
  %31 = getelementptr inbounds %struct.quantum_reg_struct* %30, i32 0, i32 1
  %32 = load i32* %31, align 4
  %33 = icmp slt i32 %29, %32
  br i1 %33, label %34, label %104

; <label>:34                                      ; preds = %28
  %35 = load i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = load %struct.quantum_reg_struct** %3, align 8
  %38 = getelementptr inbounds %struct.quantum_reg_struct* %37, i32 0, i32 3
  %39 = load %struct.quantum_reg_node_struct** %38, align 8
  %40 = getelementptr inbounds %struct.quantum_reg_node_struct* %39, i64 %36
  %41 = getelementptr inbounds %struct.quantum_reg_node_struct* %40, i32 0, i32 1
  %42 = load i64* %41, align 8
  %43 = load i32* %1, align 4
  %44 = zext i32 %43 to i64
  %45 = shl i64 1, %44
  %46 = and i64 %42, %45
  %47 = icmp ne i64 %46, 0
  br i1 %47, label %48, label %100

; <label>:48                                      ; preds = %34
  %49 = load i32* %i, align 4
  %50 = sext i32 %49 to i64
  %51 = load %struct.quantum_reg_struct** %3, align 8
  %52 = getelementptr inbounds %struct.quantum_reg_struct* %51, i32 0, i32 3
  %53 = load %struct.quantum_reg_node_struct** %52, align 8
  %54 = getelementptr inbounds %struct.quantum_reg_node_struct* %53, i64 %50
  %55 = getelementptr inbounds %struct.quantum_reg_node_struct* %54, i32 0, i32 1
  %56 = load i64* %55, align 8
  %57 = load i32* %2, align 4
  %58 = zext i32 %57 to i64
  %59 = shl i64 1, %58
  %60 = and i64 %56, %59
  %61 = icmp ne i64 %60, 0
  br i1 %61, label %62, label %99

; <label>:62                                      ; preds = %48
  %63 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %64 = load float* %63, align 4
  %65 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %66 = load float* %65, align 4
  %67 = load i32* %i, align 4
  %68 = sext i32 %67 to i64
  %69 = load %struct.quantum_reg_struct** %3, align 8
  %70 = getelementptr inbounds %struct.quantum_reg_struct* %69, i32 0, i32 3
  %71 = load %struct.quantum_reg_node_struct** %70, align 8
  %72 = getelementptr inbounds %struct.quantum_reg_node_struct* %71, i64 %68
  %73 = getelementptr inbounds %struct.quantum_reg_node_struct* %72, i32 0, i32 0
  %74 = getelementptr inbounds { float, float }* %73, i32 0, i32 0
  %75 = load float* %74, align 4
  %76 = getelementptr inbounds { float, float }* %73, i32 0, i32 1
  %77 = load float* %76, align 4
  %78 = fmul float %75, %64
  %79 = fmul float %77, %66
  %80 = fmul float %75, %66
  %81 = fmul float %77, %64
  %82 = fsub float %78, %79
  %83 = fadd float %80, %81
  %84 = fcmp uno float %82, %82
  br i1 %84, label %85, label %94, !prof !1

; <label>:85                                      ; preds = %62
  %86 = fcmp uno float %83, %83
  br i1 %86, label %87, label %94, !prof !1

; <label>:87                                      ; preds = %85
  %88 = call <2 x float> @__mulsc3(float %75, float %77, float %64, float %66) #4
  %89 = bitcast { float, float }* %5 to <2 x float>*
  store <2 x float> %88, <2 x float>* %89, align 1
  %90 = getelementptr inbounds { float, float }* %5, i32 0, i32 0
  %91 = load float* %90, align 4
  %92 = getelementptr inbounds { float, float }* %5, i32 0, i32 1
  %93 = load float* %92, align 4
  br label %94

; <label>:94                                      ; preds = %87, %85, %62
  %95 = phi float [ %82, %62 ], [ %82, %85 ], [ %91, %87 ]
  %96 = phi float [ %83, %62 ], [ %83, %85 ], [ %93, %87 ]
  %97 = getelementptr inbounds { float, float }* %73, i32 0, i32 0
  %98 = getelementptr inbounds { float, float }* %73, i32 0, i32 1
  store float %95, float* %97, align 4
  store float %96, float* %98, align 4
  br label %99

; <label>:99                                      ; preds = %94, %48
  br label %100

; <label>:100                                     ; preds = %99, %34
  br label %101

; <label>:101                                     ; preds = %100
  %102 = load i32* %i, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %i, align 4
  br label %28

; <label>:104                                     ; preds = %28
  %105 = load %struct.quantum_reg_struct** %3, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %105)
  br label %106

; <label>:106                                     ; preds = %104, %10
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_cond_phase_inv(i32 %control, i32 %target, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %z = alloca { float, float }, align 4
  %4 = alloca { float, float }, align 4
  %5 = alloca { float, float }, align 4
  store i32 %control, i32* %1, align 4
  store i32 %target, i32* %2, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %3, align 8
  %6 = load i32* %1, align 4
  %7 = load i32* %2, align 4
  %8 = sub nsw i32 %6, %7
  %9 = zext i32 %8 to i64
  %10 = shl i64 1, %9
  %11 = uitofp i64 %10 to double
  %12 = fdiv double 0xC00921FB54524550, %11
  %13 = fptrunc double %12 to float
  %14 = call <2 x float> @quantum_cexp(float %13)
  %15 = bitcast { float, float }* %4 to <2 x float>*
  store <2 x float> %14, <2 x float>* %15, align 1
  %16 = getelementptr inbounds { float, float }* %4, i32 0, i32 0
  %17 = load float* %16, align 4
  %18 = getelementptr inbounds { float, float }* %4, i32 0, i32 1
  %19 = load float* %18, align 4
  %20 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %21 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  store float %17, float* %20, align 4
  store float %19, float* %21, align 4
  store i32 0, i32* %i, align 4
  br label %22

; <label>:22                                      ; preds = %95, %0
  %23 = load i32* %i, align 4
  %24 = load %struct.quantum_reg_struct** %3, align 8
  %25 = getelementptr inbounds %struct.quantum_reg_struct* %24, i32 0, i32 1
  %26 = load i32* %25, align 4
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %98

; <label>:28                                      ; preds = %22
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load %struct.quantum_reg_struct** %3, align 8
  %32 = getelementptr inbounds %struct.quantum_reg_struct* %31, i32 0, i32 3
  %33 = load %struct.quantum_reg_node_struct** %32, align 8
  %34 = getelementptr inbounds %struct.quantum_reg_node_struct* %33, i64 %30
  %35 = getelementptr inbounds %struct.quantum_reg_node_struct* %34, i32 0, i32 1
  %36 = load i64* %35, align 8
  %37 = load i32* %1, align 4
  %38 = zext i32 %37 to i64
  %39 = shl i64 1, %38
  %40 = and i64 %36, %39
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %94

; <label>:42                                      ; preds = %28
  %43 = load i32* %i, align 4
  %44 = sext i32 %43 to i64
  %45 = load %struct.quantum_reg_struct** %3, align 8
  %46 = getelementptr inbounds %struct.quantum_reg_struct* %45, i32 0, i32 3
  %47 = load %struct.quantum_reg_node_struct** %46, align 8
  %48 = getelementptr inbounds %struct.quantum_reg_node_struct* %47, i64 %44
  %49 = getelementptr inbounds %struct.quantum_reg_node_struct* %48, i32 0, i32 1
  %50 = load i64* %49, align 8
  %51 = load i32* %2, align 4
  %52 = zext i32 %51 to i64
  %53 = shl i64 1, %52
  %54 = and i64 %50, %53
  %55 = icmp ne i64 %54, 0
  br i1 %55, label %56, label %93

; <label>:56                                      ; preds = %42
  %57 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %58 = load float* %57, align 4
  %59 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %60 = load float* %59, align 4
  %61 = load i32* %i, align 4
  %62 = sext i32 %61 to i64
  %63 = load %struct.quantum_reg_struct** %3, align 8
  %64 = getelementptr inbounds %struct.quantum_reg_struct* %63, i32 0, i32 3
  %65 = load %struct.quantum_reg_node_struct** %64, align 8
  %66 = getelementptr inbounds %struct.quantum_reg_node_struct* %65, i64 %62
  %67 = getelementptr inbounds %struct.quantum_reg_node_struct* %66, i32 0, i32 0
  %68 = getelementptr inbounds { float, float }* %67, i32 0, i32 0
  %69 = load float* %68, align 4
  %70 = getelementptr inbounds { float, float }* %67, i32 0, i32 1
  %71 = load float* %70, align 4
  %72 = fmul float %69, %58
  %73 = fmul float %71, %60
  %74 = fmul float %69, %60
  %75 = fmul float %71, %58
  %76 = fsub float %72, %73
  %77 = fadd float %74, %75
  %78 = fcmp uno float %76, %76
  br i1 %78, label %79, label %88, !prof !1

; <label>:79                                      ; preds = %56
  %80 = fcmp uno float %77, %77
  br i1 %80, label %81, label %88, !prof !1

; <label>:81                                      ; preds = %79
  %82 = call <2 x float> @__mulsc3(float %69, float %71, float %58, float %60) #4
  %83 = bitcast { float, float }* %5 to <2 x float>*
  store <2 x float> %82, <2 x float>* %83, align 1
  %84 = getelementptr inbounds { float, float }* %5, i32 0, i32 0
  %85 = load float* %84, align 4
  %86 = getelementptr inbounds { float, float }* %5, i32 0, i32 1
  %87 = load float* %86, align 4
  br label %88

; <label>:88                                      ; preds = %81, %79, %56
  %89 = phi float [ %76, %56 ], [ %76, %79 ], [ %85, %81 ]
  %90 = phi float [ %77, %56 ], [ %77, %79 ], [ %87, %81 ]
  %91 = getelementptr inbounds { float, float }* %67, i32 0, i32 0
  %92 = getelementptr inbounds { float, float }* %67, i32 0, i32 1
  store float %89, float* %91, align 4
  store float %90, float* %92, align 4
  br label %93

; <label>:93                                      ; preds = %88, %42
  br label %94

; <label>:94                                      ; preds = %93, %28
  br label %95

; <label>:95                                      ; preds = %94
  %96 = load i32* %i, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %i, align 4
  br label %22

; <label>:98                                      ; preds = %22
  %99 = load %struct.quantum_reg_struct** %3, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %99)
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantum_cond_phase_kick(i32 %control, i32 %target, float %gamma, %struct.quantum_reg_struct* %reg) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca %struct.quantum_reg_struct*, align 8
  %i = alloca i32, align 4
  %z = alloca { float, float }, align 4
  %5 = alloca { float, float }, align 4
  %6 = alloca { float, float }, align 4
  store i32 %control, i32* %1, align 4
  store i32 %target, i32* %2, align 4
  store float %gamma, float* %3, align 4
  store %struct.quantum_reg_struct* %reg, %struct.quantum_reg_struct** %4, align 8
  %7 = load i32* %1, align 4
  %8 = load i32* %2, align 4
  %9 = load float* %3, align 4
  %10 = fpext float %9 to double
  %11 = call i32 (i8, ...)* @quantum_objcode_put(i8 zeroext 12, i32 %7, i32 %8, double %10)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %0
  br label %102

; <label>:14                                      ; preds = %0
  %15 = load float* %3, align 4
  %16 = call <2 x float> @quantum_cexp(float %15)
  %17 = bitcast { float, float }* %5 to <2 x float>*
  store <2 x float> %16, <2 x float>* %17, align 1
  %18 = getelementptr inbounds { float, float }* %5, i32 0, i32 0
  %19 = load float* %18, align 4
  %20 = getelementptr inbounds { float, float }* %5, i32 0, i32 1
  %21 = load float* %20, align 4
  %22 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %23 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  store float %19, float* %22, align 4
  store float %21, float* %23, align 4
  store i32 0, i32* %i, align 4
  br label %24

; <label>:24                                      ; preds = %97, %14
  %25 = load i32* %i, align 4
  %26 = load %struct.quantum_reg_struct** %4, align 8
  %27 = getelementptr inbounds %struct.quantum_reg_struct* %26, i32 0, i32 1
  %28 = load i32* %27, align 4
  %29 = icmp slt i32 %25, %28
  br i1 %29, label %30, label %100

; <label>:30                                      ; preds = %24
  %31 = load i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = load %struct.quantum_reg_struct** %4, align 8
  %34 = getelementptr inbounds %struct.quantum_reg_struct* %33, i32 0, i32 3
  %35 = load %struct.quantum_reg_node_struct** %34, align 8
  %36 = getelementptr inbounds %struct.quantum_reg_node_struct* %35, i64 %32
  %37 = getelementptr inbounds %struct.quantum_reg_node_struct* %36, i32 0, i32 1
  %38 = load i64* %37, align 8
  %39 = load i32* %1, align 4
  %40 = zext i32 %39 to i64
  %41 = shl i64 1, %40
  %42 = and i64 %38, %41
  %43 = icmp ne i64 %42, 0
  br i1 %43, label %44, label %96

; <label>:44                                      ; preds = %30
  %45 = load i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = load %struct.quantum_reg_struct** %4, align 8
  %48 = getelementptr inbounds %struct.quantum_reg_struct* %47, i32 0, i32 3
  %49 = load %struct.quantum_reg_node_struct** %48, align 8
  %50 = getelementptr inbounds %struct.quantum_reg_node_struct* %49, i64 %46
  %51 = getelementptr inbounds %struct.quantum_reg_node_struct* %50, i32 0, i32 1
  %52 = load i64* %51, align 8
  %53 = load i32* %2, align 4
  %54 = zext i32 %53 to i64
  %55 = shl i64 1, %54
  %56 = and i64 %52, %55
  %57 = icmp ne i64 %56, 0
  br i1 %57, label %58, label %95

; <label>:58                                      ; preds = %44
  %59 = getelementptr inbounds { float, float }* %z, i32 0, i32 0
  %60 = load float* %59, align 4
  %61 = getelementptr inbounds { float, float }* %z, i32 0, i32 1
  %62 = load float* %61, align 4
  %63 = load i32* %i, align 4
  %64 = sext i32 %63 to i64
  %65 = load %struct.quantum_reg_struct** %4, align 8
  %66 = getelementptr inbounds %struct.quantum_reg_struct* %65, i32 0, i32 3
  %67 = load %struct.quantum_reg_node_struct** %66, align 8
  %68 = getelementptr inbounds %struct.quantum_reg_node_struct* %67, i64 %64
  %69 = getelementptr inbounds %struct.quantum_reg_node_struct* %68, i32 0, i32 0
  %70 = getelementptr inbounds { float, float }* %69, i32 0, i32 0
  %71 = load float* %70, align 4
  %72 = getelementptr inbounds { float, float }* %69, i32 0, i32 1
  %73 = load float* %72, align 4
  %74 = fmul float %71, %60
  %75 = fmul float %73, %62
  %76 = fmul float %71, %62
  %77 = fmul float %73, %60
  %78 = fsub float %74, %75
  %79 = fadd float %76, %77
  %80 = fcmp uno float %78, %78
  br i1 %80, label %81, label %90, !prof !1

; <label>:81                                      ; preds = %58
  %82 = fcmp uno float %79, %79
  br i1 %82, label %83, label %90, !prof !1

; <label>:83                                      ; preds = %81
  %84 = call <2 x float> @__mulsc3(float %71, float %73, float %60, float %62) #4
  %85 = bitcast { float, float }* %6 to <2 x float>*
  store <2 x float> %84, <2 x float>* %85, align 1
  %86 = getelementptr inbounds { float, float }* %6, i32 0, i32 0
  %87 = load float* %86, align 4
  %88 = getelementptr inbounds { float, float }* %6, i32 0, i32 1
  %89 = load float* %88, align 4
  br label %90

; <label>:90                                      ; preds = %83, %81, %58
  %91 = phi float [ %78, %58 ], [ %78, %81 ], [ %87, %83 ]
  %92 = phi float [ %79, %58 ], [ %79, %81 ], [ %89, %83 ]
  %93 = getelementptr inbounds { float, float }* %69, i32 0, i32 0
  %94 = getelementptr inbounds { float, float }* %69, i32 0, i32 1
  store float %91, float* %93, align 4
  store float %92, float* %94, align 4
  br label %95

; <label>:95                                      ; preds = %90, %44
  br label %96

; <label>:96                                      ; preds = %95, %30
  br label %97

; <label>:97                                      ; preds = %96
  %98 = load i32* %i, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %i, align 4
  br label %24

; <label>:100                                     ; preds = %24
  %101 = load %struct.quantum_reg_struct** %4, align 8
  call void @quantum_decohere(%struct.quantum_reg_struct* %101)
  br label %102

; <label>:102                                     ; preds = %100, %13
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @quantum_gate_counter(i32 %inc) #0 {
  %1 = alloca i32, align 4
  store i32 %inc, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4
  %6 = load i32* @quantum_gate_counter.counter, align 4
  %7 = add nsw i32 %6, %5
  store i32 %7, i32* @quantum_gate_counter.counter, align 4
  br label %13

; <label>:8                                       ; preds = %0
  %9 = load i32* %1, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8
  store i32 0, i32* @quantum_gate_counter.counter, align 4
  br label %12

; <label>:12                                      ; preds = %11, %8
  br label %13

; <label>:13                                      ; preds = %12, %4
  %14 = load i32* @quantum_gate_counter.counter, align 4
  ret i32 %14
}

; Function Attrs: inlinehint nounwind uwtable
define internal float @quantum_real(<2 x float> %a.coerce) #5 {
  %a = alloca { float, float }, align 8
  %p = alloca float*, align 8
  %1 = bitcast { float, float }* %a to <2 x float>*
  store <2 x float> %a.coerce, <2 x float>* %1, align 1
  %2 = bitcast { float, float }* %a to float*
  store float* %2, float** %p, align 8
  %3 = load float** %p, align 8
  %4 = getelementptr inbounds float* %3, i64 0
  %5 = load float* %4, align 4
  ret float %5
}

; Function Attrs: inlinehint nounwind uwtable
define internal float @quantum_imag(<2 x float> %a.coerce) #5 {
  %a = alloca { float, float }, align 8
  %p = alloca float*, align 8
  %1 = bitcast { float, float }* %a to <2 x float>*
  store <2 x float> %a.coerce, <2 x float>* %1, align 1
  %2 = bitcast { float, float }* %a to float*
  store float* %2, float** %p, align 8
  %3 = load float** %p, align 8
  %4 = getelementptr inbounds float* %3, i64 1
  %5 = load float* %4, align 4
  ret float %5
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @quantum_hash64(i64 %key, i32 %width) #5 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  %k32 = alloca i32, align 4
  store i64 %key, i64* %1, align 8
  store i32 %width, i32* %2, align 4
  %3 = load i64* %1, align 8
  %4 = and i64 %3, 4294967295
  %5 = load i64* %1, align 8
  %6 = lshr i64 %5, 32
  %7 = xor i64 %4, %6
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* %k32, align 4
  %9 = load i32* %k32, align 4
  %10 = zext i32 %9 to i64
  %11 = mul i64 %10, 2654404609
  %12 = trunc i64 %11 to i32
  store i32 %12, i32* %k32, align 4
  %13 = load i32* %k32, align 4
  %14 = load i32* %2, align 4
  %15 = sub nsw i32 32, %14
  %16 = lshr i32 %13, %15
  store i32 %16, i32* %k32, align 4
  %17 = load i32* %k32, align 4
  ret i32 %17
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
