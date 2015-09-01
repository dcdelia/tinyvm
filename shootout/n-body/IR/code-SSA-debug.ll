; ModuleID = 'code.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies_orig = global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @advance(i32 %nbodies, %struct.planet* %bodies, double %dt) #0 {
  call void @llvm.dbg.value(metadata i32 %nbodies, i64 0, metadata !37, metadata !38), !dbg !39
  call void @llvm.dbg.value(metadata %struct.planet* %bodies, i64 0, metadata !40, metadata !38), !dbg !41
  call void @llvm.dbg.value(metadata double %dt, i64 0, metadata !42, metadata !38), !dbg !43
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !44, metadata !38), !dbg !45
  br label %1, !dbg !46

; <label>:1                                       ; preds = %81, %0
  %i.0 = phi i32 [ 0, %0 ], [ %82, %81 ]
  %2 = icmp slt i32 %i.0, %nbodies, !dbg !48
  br i1 %2, label %3, label %83, !dbg !50

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64, !dbg !51
  %5 = getelementptr inbounds %struct.planet* %bodies, i64 %4, !dbg !51
  call void @llvm.dbg.value(metadata %struct.planet* %5, i64 0, metadata !53, metadata !38), !dbg !54
  %6 = add nsw i32 %i.0, 1, !dbg !55
  call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !57, metadata !38), !dbg !58
  br label %7, !dbg !59

; <label>:7                                       ; preds = %78, %3
  %j.0 = phi i32 [ %6, %3 ], [ %79, %78 ]
  %8 = icmp slt i32 %j.0, %nbodies, !dbg !60
  br i1 %8, label %9, label %80, !dbg !62

; <label>:9                                       ; preds = %7
  %10 = sext i32 %j.0 to i64, !dbg !63
  %11 = getelementptr inbounds %struct.planet* %bodies, i64 %10, !dbg !63
  call void @llvm.dbg.value(metadata %struct.planet* %11, i64 0, metadata !65, metadata !38), !dbg !66
  %12 = getelementptr inbounds %struct.planet* %5, i32 0, i32 0, !dbg !67
  %13 = load double* %12, align 8, !dbg !67
  %14 = getelementptr inbounds %struct.planet* %11, i32 0, i32 0, !dbg !68
  %15 = load double* %14, align 8, !dbg !68
  %16 = fsub double %13, %15, !dbg !67
  call void @llvm.dbg.value(metadata double %16, i64 0, metadata !69, metadata !38), !dbg !70
  %17 = getelementptr inbounds %struct.planet* %5, i32 0, i32 1, !dbg !71
  %18 = load double* %17, align 8, !dbg !71
  %19 = getelementptr inbounds %struct.planet* %11, i32 0, i32 1, !dbg !72
  %20 = load double* %19, align 8, !dbg !72
  %21 = fsub double %18, %20, !dbg !71
  call void @llvm.dbg.value(metadata double %21, i64 0, metadata !73, metadata !38), !dbg !74
  %22 = getelementptr inbounds %struct.planet* %5, i32 0, i32 2, !dbg !75
  %23 = load double* %22, align 8, !dbg !75
  %24 = getelementptr inbounds %struct.planet* %11, i32 0, i32 2, !dbg !76
  %25 = load double* %24, align 8, !dbg !76
  %26 = fsub double %23, %25, !dbg !75
  call void @llvm.dbg.value(metadata double %26, i64 0, metadata !77, metadata !38), !dbg !78
  %27 = fmul double %16, %16, !dbg !79
  %28 = fmul double %21, %21, !dbg !80
  %29 = fadd double %27, %28, !dbg !79
  %30 = fmul double %26, %26, !dbg !81
  %31 = fadd double %29, %30, !dbg !79
  %32 = call double @sqrt(double %31) #3, !dbg !82
  call void @llvm.dbg.value(metadata double %32, i64 0, metadata !83, metadata !38), !dbg !84
  %33 = fmul double %32, %32, !dbg !85
  %34 = fmul double %33, %32, !dbg !85
  %35 = fdiv double %dt, %34, !dbg !86
  call void @llvm.dbg.value(metadata double %35, i64 0, metadata !87, metadata !38), !dbg !88
  %36 = getelementptr inbounds %struct.planet* %11, i32 0, i32 6, !dbg !89
  %37 = load double* %36, align 8, !dbg !89
  %38 = fmul double %16, %37, !dbg !90
  %39 = fmul double %38, %35, !dbg !90
  %40 = getelementptr inbounds %struct.planet* %5, i32 0, i32 3, !dbg !91
  %41 = load double* %40, align 8, !dbg !91
  %42 = fsub double %41, %39, !dbg !91
  store double %42, double* %40, align 8, !dbg !91
  %43 = getelementptr inbounds %struct.planet* %11, i32 0, i32 6, !dbg !92
  %44 = load double* %43, align 8, !dbg !92
  %45 = fmul double %21, %44, !dbg !93
  %46 = fmul double %45, %35, !dbg !93
  %47 = getelementptr inbounds %struct.planet* %5, i32 0, i32 4, !dbg !94
  %48 = load double* %47, align 8, !dbg !94
  %49 = fsub double %48, %46, !dbg !94
  store double %49, double* %47, align 8, !dbg !94
  %50 = getelementptr inbounds %struct.planet* %11, i32 0, i32 6, !dbg !95
  %51 = load double* %50, align 8, !dbg !95
  %52 = fmul double %26, %51, !dbg !96
  %53 = fmul double %52, %35, !dbg !96
  %54 = getelementptr inbounds %struct.planet* %5, i32 0, i32 5, !dbg !97
  %55 = load double* %54, align 8, !dbg !97
  %56 = fsub double %55, %53, !dbg !97
  store double %56, double* %54, align 8, !dbg !97
  %57 = getelementptr inbounds %struct.planet* %5, i32 0, i32 6, !dbg !98
  %58 = load double* %57, align 8, !dbg !98
  %59 = fmul double %16, %58, !dbg !99
  %60 = fmul double %59, %35, !dbg !99
  %61 = getelementptr inbounds %struct.planet* %11, i32 0, i32 3, !dbg !100
  %62 = load double* %61, align 8, !dbg !100
  %63 = fadd double %62, %60, !dbg !100
  store double %63, double* %61, align 8, !dbg !100
  %64 = getelementptr inbounds %struct.planet* %5, i32 0, i32 6, !dbg !101
  %65 = load double* %64, align 8, !dbg !101
  %66 = fmul double %21, %65, !dbg !102
  %67 = fmul double %66, %35, !dbg !102
  %68 = getelementptr inbounds %struct.planet* %11, i32 0, i32 4, !dbg !103
  %69 = load double* %68, align 8, !dbg !103
  %70 = fadd double %69, %67, !dbg !103
  store double %70, double* %68, align 8, !dbg !103
  %71 = getelementptr inbounds %struct.planet* %5, i32 0, i32 6, !dbg !104
  %72 = load double* %71, align 8, !dbg !104
  %73 = fmul double %26, %72, !dbg !105
  %74 = fmul double %73, %35, !dbg !105
  %75 = getelementptr inbounds %struct.planet* %11, i32 0, i32 5, !dbg !106
  %76 = load double* %75, align 8, !dbg !106
  %77 = fadd double %76, %74, !dbg !106
  store double %77, double* %75, align 8, !dbg !106
  br label %78, !dbg !107

; <label>:78                                      ; preds = %9
  %79 = add nsw i32 %j.0, 1, !dbg !108
  call void @llvm.dbg.value(metadata i32 %79, i64 0, metadata !57, metadata !38), !dbg !58
  br label %7, !dbg !109

; <label>:80                                      ; preds = %7
  br label %81, !dbg !110

; <label>:81                                      ; preds = %80
  %82 = add nsw i32 %i.0, 1, !dbg !111
  call void @llvm.dbg.value(metadata i32 %82, i64 0, metadata !44, metadata !38), !dbg !45
  br label %1, !dbg !112

; <label>:83                                      ; preds = %1
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !44, metadata !38), !dbg !45
  br label %84, !dbg !113

; <label>:84                                      ; preds = %107, %83
  %i.1 = phi i32 [ 0, %83 ], [ %108, %107 ]
  %85 = icmp slt i32 %i.1, %nbodies, !dbg !115
  br i1 %85, label %86, label %109, !dbg !117

; <label>:86                                      ; preds = %84
  %87 = sext i32 %i.1 to i64, !dbg !118
  %88 = getelementptr inbounds %struct.planet* %bodies, i64 %87, !dbg !118
  call void @llvm.dbg.value(metadata %struct.planet* %88, i64 0, metadata !120, metadata !38), !dbg !121
  %89 = getelementptr inbounds %struct.planet* %88, i32 0, i32 3, !dbg !122
  %90 = load double* %89, align 8, !dbg !122
  %91 = fmul double %dt, %90, !dbg !123
  %92 = getelementptr inbounds %struct.planet* %88, i32 0, i32 0, !dbg !124
  %93 = load double* %92, align 8, !dbg !124
  %94 = fadd double %93, %91, !dbg !124
  store double %94, double* %92, align 8, !dbg !124
  %95 = getelementptr inbounds %struct.planet* %88, i32 0, i32 4, !dbg !125
  %96 = load double* %95, align 8, !dbg !125
  %97 = fmul double %dt, %96, !dbg !126
  %98 = getelementptr inbounds %struct.planet* %88, i32 0, i32 1, !dbg !127
  %99 = load double* %98, align 8, !dbg !127
  %100 = fadd double %99, %97, !dbg !127
  store double %100, double* %98, align 8, !dbg !127
  %101 = getelementptr inbounds %struct.planet* %88, i32 0, i32 5, !dbg !128
  %102 = load double* %101, align 8, !dbg !128
  %103 = fmul double %dt, %102, !dbg !129
  %104 = getelementptr inbounds %struct.planet* %88, i32 0, i32 2, !dbg !130
  %105 = load double* %104, align 8, !dbg !130
  %106 = fadd double %105, %103, !dbg !130
  store double %106, double* %104, align 8, !dbg !130
  br label %107, !dbg !131

; <label>:107                                     ; preds = %86
  %108 = add nsw i32 %i.1, 1, !dbg !132
  call void @llvm.dbg.value(metadata i32 %108, i64 0, metadata !44, metadata !38), !dbg !45
  br label %84, !dbg !133

; <label>:109                                     ; preds = %84
  ret void, !dbg !134
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind uwtable
define double @energy(i32 %nbodies, %struct.planet* %bodies) #0 {
  call void @llvm.dbg.value(metadata i32 %nbodies, i64 0, metadata !135, metadata !38), !dbg !136
  call void @llvm.dbg.value(metadata %struct.planet* %bodies, i64 0, metadata !137, metadata !38), !dbg !138
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !139, metadata !38), !dbg !140
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !141, metadata !38), !dbg !142
  br label %1, !dbg !143

; <label>:1                                       ; preds = %65, %0
  %e.0 = phi double [ 0.000000e+00, %0 ], [ %e.1, %65 ]
  %i.0 = phi i32 [ 0, %0 ], [ %66, %65 ]
  %2 = icmp slt i32 %i.0, %nbodies, !dbg !145
  br i1 %2, label %3, label %67, !dbg !147

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64, !dbg !148
  %5 = getelementptr inbounds %struct.planet* %bodies, i64 %4, !dbg !148
  call void @llvm.dbg.value(metadata %struct.planet* %5, i64 0, metadata !150, metadata !38), !dbg !151
  %6 = getelementptr inbounds %struct.planet* %5, i32 0, i32 6, !dbg !152
  %7 = load double* %6, align 8, !dbg !152
  %8 = fmul double 5.000000e-01, %7, !dbg !153
  %9 = getelementptr inbounds %struct.planet* %5, i32 0, i32 3, !dbg !154
  %10 = load double* %9, align 8, !dbg !154
  %11 = getelementptr inbounds %struct.planet* %5, i32 0, i32 3, !dbg !155
  %12 = load double* %11, align 8, !dbg !155
  %13 = fmul double %10, %12, !dbg !154
  %14 = getelementptr inbounds %struct.planet* %5, i32 0, i32 4, !dbg !156
  %15 = load double* %14, align 8, !dbg !156
  %16 = getelementptr inbounds %struct.planet* %5, i32 0, i32 4, !dbg !157
  %17 = load double* %16, align 8, !dbg !157
  %18 = fmul double %15, %17, !dbg !156
  %19 = fadd double %13, %18, !dbg !154
  %20 = getelementptr inbounds %struct.planet* %5, i32 0, i32 5, !dbg !158
  %21 = load double* %20, align 8, !dbg !158
  %22 = getelementptr inbounds %struct.planet* %5, i32 0, i32 5, !dbg !159
  %23 = load double* %22, align 8, !dbg !159
  %24 = fmul double %21, %23, !dbg !158
  %25 = fadd double %19, %24, !dbg !154
  %26 = fmul double %8, %25, !dbg !153
  %27 = fadd double %e.0, %26, !dbg !160
  call void @llvm.dbg.value(metadata double %27, i64 0, metadata !139, metadata !38), !dbg !140
  %28 = add nsw i32 %i.0, 1, !dbg !161
  call void @llvm.dbg.value(metadata i32 %28, i64 0, metadata !163, metadata !38), !dbg !164
  br label %29, !dbg !165

; <label>:29                                      ; preds = %62, %3
  %e.1 = phi double [ %27, %3 ], [ %61, %62 ]
  %j.0 = phi i32 [ %28, %3 ], [ %63, %62 ]
  %30 = icmp slt i32 %j.0, %nbodies, !dbg !166
  br i1 %30, label %31, label %64, !dbg !168

; <label>:31                                      ; preds = %29
  %32 = sext i32 %j.0 to i64, !dbg !169
  %33 = getelementptr inbounds %struct.planet* %bodies, i64 %32, !dbg !169
  call void @llvm.dbg.value(metadata %struct.planet* %33, i64 0, metadata !171, metadata !38), !dbg !172
  %34 = getelementptr inbounds %struct.planet* %5, i32 0, i32 0, !dbg !173
  %35 = load double* %34, align 8, !dbg !173
  %36 = getelementptr inbounds %struct.planet* %33, i32 0, i32 0, !dbg !174
  %37 = load double* %36, align 8, !dbg !174
  %38 = fsub double %35, %37, !dbg !173
  call void @llvm.dbg.value(metadata double %38, i64 0, metadata !175, metadata !38), !dbg !176
  %39 = getelementptr inbounds %struct.planet* %5, i32 0, i32 1, !dbg !177
  %40 = load double* %39, align 8, !dbg !177
  %41 = getelementptr inbounds %struct.planet* %33, i32 0, i32 1, !dbg !178
  %42 = load double* %41, align 8, !dbg !178
  %43 = fsub double %40, %42, !dbg !177
  call void @llvm.dbg.value(metadata double %43, i64 0, metadata !179, metadata !38), !dbg !180
  %44 = getelementptr inbounds %struct.planet* %5, i32 0, i32 2, !dbg !181
  %45 = load double* %44, align 8, !dbg !181
  %46 = getelementptr inbounds %struct.planet* %33, i32 0, i32 2, !dbg !182
  %47 = load double* %46, align 8, !dbg !182
  %48 = fsub double %45, %47, !dbg !181
  call void @llvm.dbg.value(metadata double %48, i64 0, metadata !183, metadata !38), !dbg !184
  %49 = fmul double %38, %38, !dbg !185
  %50 = fmul double %43, %43, !dbg !186
  %51 = fadd double %49, %50, !dbg !185
  %52 = fmul double %48, %48, !dbg !187
  %53 = fadd double %51, %52, !dbg !185
  %54 = call double @sqrt(double %53) #3, !dbg !188
  call void @llvm.dbg.value(metadata double %54, i64 0, metadata !189, metadata !38), !dbg !190
  %55 = getelementptr inbounds %struct.planet* %5, i32 0, i32 6, !dbg !191
  %56 = load double* %55, align 8, !dbg !191
  %57 = getelementptr inbounds %struct.planet* %33, i32 0, i32 6, !dbg !192
  %58 = load double* %57, align 8, !dbg !192
  %59 = fmul double %56, %58, !dbg !191
  %60 = fdiv double %59, %54, !dbg !193
  %61 = fsub double %e.1, %60, !dbg !194
  call void @llvm.dbg.value(metadata double %61, i64 0, metadata !139, metadata !38), !dbg !140
  br label %62, !dbg !195

; <label>:62                                      ; preds = %31
  %63 = add nsw i32 %j.0, 1, !dbg !196
  call void @llvm.dbg.value(metadata i32 %63, i64 0, metadata !163, metadata !38), !dbg !164
  br label %29, !dbg !197

; <label>:64                                      ; preds = %29
  br label %65, !dbg !198

; <label>:65                                      ; preds = %64
  %66 = add nsw i32 %i.0, 1, !dbg !199
  call void @llvm.dbg.value(metadata i32 %66, i64 0, metadata !141, metadata !38), !dbg !142
  br label %1, !dbg !200

; <label>:67                                      ; preds = %1
  ret double %e.0, !dbg !201
}

; Function Attrs: nounwind uwtable
define void @offset_momentum(i32 %nbodies, %struct.planet* %bodies) #0 {
  call void @llvm.dbg.value(metadata i32 %nbodies, i64 0, metadata !202, metadata !38), !dbg !203
  call void @llvm.dbg.value(metadata %struct.planet* %bodies, i64 0, metadata !204, metadata !38), !dbg !205
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !206, metadata !38), !dbg !207
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !208, metadata !38), !dbg !209
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !210, metadata !38), !dbg !211
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !212, metadata !38), !dbg !213
  br label %1, !dbg !214

; <label>:1                                       ; preds = %34, %0
  %py.0 = phi double [ 0.000000e+00, %0 ], [ %23, %34 ]
  %px.0 = phi double [ 0.000000e+00, %0 ], [ %13, %34 ]
  %pz.0 = phi double [ 0.000000e+00, %0 ], [ %33, %34 ]
  %i.0 = phi i32 [ 0, %0 ], [ %35, %34 ]
  %2 = icmp slt i32 %i.0, %nbodies, !dbg !216
  br i1 %2, label %3, label %36, !dbg !218

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64, !dbg !219
  %5 = getelementptr inbounds %struct.planet* %bodies, i64 %4, !dbg !219
  %6 = getelementptr inbounds %struct.planet* %5, i32 0, i32 3, !dbg !219
  %7 = load double* %6, align 8, !dbg !219
  %8 = sext i32 %i.0 to i64, !dbg !221
  %9 = getelementptr inbounds %struct.planet* %bodies, i64 %8, !dbg !221
  %10 = getelementptr inbounds %struct.planet* %9, i32 0, i32 6, !dbg !221
  %11 = load double* %10, align 8, !dbg !221
  %12 = fmul double %7, %11, !dbg !219
  %13 = fadd double %px.0, %12, !dbg !222
  call void @llvm.dbg.value(metadata double %13, i64 0, metadata !206, metadata !38), !dbg !207
  %14 = sext i32 %i.0 to i64, !dbg !223
  %15 = getelementptr inbounds %struct.planet* %bodies, i64 %14, !dbg !223
  %16 = getelementptr inbounds %struct.planet* %15, i32 0, i32 4, !dbg !223
  %17 = load double* %16, align 8, !dbg !223
  %18 = sext i32 %i.0 to i64, !dbg !224
  %19 = getelementptr inbounds %struct.planet* %bodies, i64 %18, !dbg !224
  %20 = getelementptr inbounds %struct.planet* %19, i32 0, i32 6, !dbg !224
  %21 = load double* %20, align 8, !dbg !224
  %22 = fmul double %17, %21, !dbg !223
  %23 = fadd double %py.0, %22, !dbg !225
  call void @llvm.dbg.value(metadata double %23, i64 0, metadata !208, metadata !38), !dbg !209
  %24 = sext i32 %i.0 to i64, !dbg !226
  %25 = getelementptr inbounds %struct.planet* %bodies, i64 %24, !dbg !226
  %26 = getelementptr inbounds %struct.planet* %25, i32 0, i32 5, !dbg !226
  %27 = load double* %26, align 8, !dbg !226
  %28 = sext i32 %i.0 to i64, !dbg !227
  %29 = getelementptr inbounds %struct.planet* %bodies, i64 %28, !dbg !227
  %30 = getelementptr inbounds %struct.planet* %29, i32 0, i32 6, !dbg !227
  %31 = load double* %30, align 8, !dbg !227
  %32 = fmul double %27, %31, !dbg !226
  %33 = fadd double %pz.0, %32, !dbg !228
  call void @llvm.dbg.value(metadata double %33, i64 0, metadata !210, metadata !38), !dbg !211
  br label %34, !dbg !229

; <label>:34                                      ; preds = %3
  %35 = add nsw i32 %i.0, 1, !dbg !230
  call void @llvm.dbg.value(metadata i32 %35, i64 0, metadata !212, metadata !38), !dbg !213
  br label %1, !dbg !231

; <label>:36                                      ; preds = %1
  %37 = fsub double -0.000000e+00, %px.0, !dbg !232
  %38 = fdiv double %37, 0x4043BD3CC9BE45DE, !dbg !232
  %39 = getelementptr inbounds %struct.planet* %bodies, i64 0, !dbg !233
  %40 = getelementptr inbounds %struct.planet* %39, i32 0, i32 3, !dbg !233
  store double %38, double* %40, align 8, !dbg !233
  %41 = fsub double -0.000000e+00, %py.0, !dbg !234
  %42 = fdiv double %41, 0x4043BD3CC9BE45DE, !dbg !234
  %43 = getelementptr inbounds %struct.planet* %bodies, i64 0, !dbg !235
  %44 = getelementptr inbounds %struct.planet* %43, i32 0, i32 4, !dbg !235
  store double %42, double* %44, align 8, !dbg !235
  %45 = fsub double -0.000000e+00, %pz.0, !dbg !236
  %46 = fdiv double %45, 0x4043BD3CC9BE45DE, !dbg !236
  %47 = getelementptr inbounds %struct.planet* %bodies, i64 0, !dbg !237
  %48 = getelementptr inbounds %struct.planet* %47, i32 0, i32 5, !dbg !237
  store double %46, double* %48, align 8, !dbg !237
  ret void, !dbg !238
}

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %bodies = alloca [5 x %struct.planet], align 16
  call void @llvm.dbg.value(metadata i32 %inputN, i64 0, metadata !239, metadata !38), !dbg !240
  call void @llvm.dbg.value(metadata i32 %inputN, i64 0, metadata !241, metadata !38), !dbg !242
  call void @llvm.dbg.declare(metadata [5 x %struct.planet]* %bodies, metadata !243, metadata !38), !dbg !244
  %1 = bitcast [5 x %struct.planet]* %bodies to i8*, !dbg !245
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([5 x %struct.planet]* @bodies_orig to i8*), i64 280, i32 16, i1 false), !dbg !245
  %2 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0, !dbg !246
  call void @offset_momentum(i32 5, %struct.planet* %2), !dbg !247
  %3 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0, !dbg !248
  %4 = call double @energy(i32 5, %struct.planet* %3), !dbg !249
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %4), !dbg !250
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !251, metadata !38), !dbg !252
  br label %6, !dbg !253

; <label>:6                                       ; preds = %10, %0
  %i.0 = phi i32 [ 1, %0 ], [ %11, %10 ]
  %7 = icmp sle i32 %i.0, %inputN, !dbg !255
  br i1 %7, label %8, label %12, !dbg !257

; <label>:8                                       ; preds = %6
  %9 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0, !dbg !258
  call void @advance(i32 5, %struct.planet* %9, double 1.000000e-02), !dbg !259
  br label %10, !dbg !259

; <label>:10                                      ; preds = %8
  %11 = add nsw i32 %i.0, 1, !dbg !260
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !251, metadata !38), !dbg !252
  br label %6, !dbg !261

; <label>:12                                      ; preds = %6
  %13 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0, !dbg !262
  %14 = call double @energy(i32 5, %struct.planet* %13), !dbg !263
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %14), !dbg !264
  ret i32 0, !dbg !265
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!34, !35}
!llvm.ident = !{!36}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !2, !3, !29, !2} ; [ DW_TAG_compile_unit ] [/media/llvm/OSR/shootout/n-body/code.c] [DW_LANG_C99]
!1 = !{!"code.c", !"/media/llvm/OSR/shootout/n-body"}
!2 = !{}
!3 = !{!4, !20, !23, !26}
!4 = !{!"0x2e\00advance\00advance\00\0023\000\001\000\000\00256\000\0024", !1, !5, !6, null, void (i32, %struct.planet*, double)* @advance, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 24] [advance]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/media/llvm/OSR/shootout/n-body/code.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{null, !8, !9, !13}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from planet]
!10 = !{!"0x13\00planet\0017\00448\0064\000\000\000", !1, null, null, !11, null, null, null} ; [ DW_TAG_structure_type ] [planet] [line 17, size 448, align 64, offset 0] [def] [from ]
!11 = !{!12, !14, !15, !16, !17, !18, !19}
!12 = !{!"0xd\00x\0018\0064\0064\000\000", !1, !10, !13} ; [ DW_TAG_member ] [x] [line 18, size 64, align 64, offset 0] [from double]
!13 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!14 = !{!"0xd\00y\0018\0064\0064\0064\000", !1, !10, !13} ; [ DW_TAG_member ] [y] [line 18, size 64, align 64, offset 64] [from double]
!15 = !{!"0xd\00z\0018\0064\0064\00128\000", !1, !10, !13} ; [ DW_TAG_member ] [z] [line 18, size 64, align 64, offset 128] [from double]
!16 = !{!"0xd\00vx\0019\0064\0064\00192\000", !1, !10, !13} ; [ DW_TAG_member ] [vx] [line 19, size 64, align 64, offset 192] [from double]
!17 = !{!"0xd\00vy\0019\0064\0064\00256\000", !1, !10, !13} ; [ DW_TAG_member ] [vy] [line 19, size 64, align 64, offset 256] [from double]
!18 = !{!"0xd\00vz\0019\0064\0064\00320\000", !1, !10, !13} ; [ DW_TAG_member ] [vz] [line 19, size 64, align 64, offset 320] [from double]
!19 = !{!"0xd\00mass\0020\0064\0064\00384\000", !1, !10, !13} ; [ DW_TAG_member ] [mass] [line 20, size 64, align 64, offset 384] [from double]
!20 = !{!"0x2e\00energy\00energy\00\0052\000\001\000\000\00256\000\0053", !1, !5, !21, null, double (i32, %struct.planet*)* @energy, null, null, !2} ; [ DW_TAG_subprogram ] [line 52] [def] [scope 53] [energy]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{!13, !8, !9}
!23 = !{!"0x2e\00offset_momentum\00offset_momentum\00\0073\000\001\000\000\00256\000\0074", !1, !5, !24, null, void (i32, %struct.planet*)* @offset_momentum, null, null, !2} ; [ DW_TAG_subprogram ] [line 73] [def] [scope 74] [offset_momentum]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{null, !8, !9}
!26 = !{!"0x2e\00bench\00bench\00\00130\000\001\000\000\00256\000\00131", !1, !5, !27, null, i32 (i32)* @bench, null, null, !2} ; [ DW_TAG_subprogram ] [line 130] [def] [scope 131] [bench]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!8, !8}
!29 = !{!30}
!30 = !{!"0x34\00bodies_orig\00bodies_orig\00\0088\000\001", null, !5, !31, [5 x %struct.planet]* @bodies_orig, null} ; [ DW_TAG_variable ] [bodies_orig] [line 88] [def]
!31 = !{!"0x1\00\000\002240\0064\000\000\000", null, null, !10, !32, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2240, align 64, offset 0] [from planet]
!32 = !{!33}
!33 = !{!"0x21\000\005"}                          ; [ DW_TAG_subrange_type ] [0, 4]
!34 = !{i32 2, !"Dwarf Version", i32 4}
!35 = !{i32 2, !"Debug Info Version", i32 2}
!36 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!37 = !{!"0x101\00nbodies\0016777239\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [nbodies] [line 23]
!38 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!39 = !MDLocation(line: 23, column: 18, scope: !4)
!40 = !{!"0x101\00bodies\0033554455\000", !4, !5, !9} ; [ DW_TAG_arg_variable ] [bodies] [line 23]
!41 = !MDLocation(line: 23, column: 43, scope: !4)
!42 = !{!"0x101\00dt\0050331671\000", !4, !5, !13} ; [ DW_TAG_arg_variable ] [dt] [line 23]
!43 = !MDLocation(line: 23, column: 58, scope: !4)
!44 = !{!"0x100\00i\0025\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 25]
!45 = !MDLocation(line: 25, column: 7, scope: !4)
!46 = !MDLocation(line: 27, column: 8, scope: !47)
!47 = !{!"0xb\0027\003\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!48 = !MDLocation(line: 27, column: 15, scope: !49)
!49 = !{!"0xb\0027\003\001", !1, !47}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!50 = !MDLocation(line: 27, column: 3, scope: !47)
!51 = !MDLocation(line: 28, column: 25, scope: !52)
!52 = !{!"0xb\0027\0033\002", !1, !49}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!53 = !{!"0x100\00b\0028\000", !52, !5, !9}       ; [ DW_TAG_auto_variable ] [b] [line 28]
!54 = !MDLocation(line: 28, column: 21, scope: !52)
!55 = !MDLocation(line: 29, column: 14, scope: !56)
!56 = !{!"0xb\0029\005\003", !1, !52}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!57 = !{!"0x100\00j\0025\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [j] [line 25]
!58 = !MDLocation(line: 25, column: 10, scope: !4)
!59 = !MDLocation(line: 29, column: 10, scope: !56)
!60 = !MDLocation(line: 29, column: 21, scope: !61)
!61 = !{!"0xb\0029\005\004", !1, !56}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!62 = !MDLocation(line: 29, column: 5, scope: !56)
!63 = !MDLocation(line: 30, column: 28, scope: !64)
!64 = !{!"0xb\0029\0039\005", !1, !61}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!65 = !{!"0x100\00b2\0030\000", !64, !5, !9}      ; [ DW_TAG_auto_variable ] [b2] [line 30]
!66 = !MDLocation(line: 30, column: 23, scope: !64)
!67 = !MDLocation(line: 31, column: 19, scope: !64)
!68 = !MDLocation(line: 31, column: 26, scope: !64)
!69 = !{!"0x100\00dx\0031\000", !64, !5, !13}     ; [ DW_TAG_auto_variable ] [dx] [line 31]
!70 = !MDLocation(line: 31, column: 14, scope: !64)
!71 = !MDLocation(line: 32, column: 19, scope: !64)
!72 = !MDLocation(line: 32, column: 26, scope: !64)
!73 = !{!"0x100\00dy\0032\000", !64, !5, !13}     ; [ DW_TAG_auto_variable ] [dy] [line 32]
!74 = !MDLocation(line: 32, column: 14, scope: !64)
!75 = !MDLocation(line: 33, column: 19, scope: !64)
!76 = !MDLocation(line: 33, column: 26, scope: !64)
!77 = !{!"0x100\00dz\0033\000", !64, !5, !13}     ; [ DW_TAG_auto_variable ] [dz] [line 33]
!78 = !MDLocation(line: 33, column: 14, scope: !64)
!79 = !MDLocation(line: 34, column: 30, scope: !64)
!80 = !MDLocation(line: 34, column: 40, scope: !64)
!81 = !MDLocation(line: 34, column: 50, scope: !64)
!82 = !MDLocation(line: 34, column: 25, scope: !64)
!83 = !{!"0x100\00distance\0034\000", !64, !5, !13} ; [ DW_TAG_auto_variable ] [distance] [line 34]
!84 = !MDLocation(line: 34, column: 14, scope: !64)
!85 = !MDLocation(line: 35, column: 26, scope: !64)
!86 = !MDLocation(line: 35, column: 20, scope: !64)
!87 = !{!"0x100\00mag\0035\000", !64, !5, !13}    ; [ DW_TAG_auto_variable ] [mag] [line 35]
!88 = !MDLocation(line: 35, column: 14, scope: !64)
!89 = !MDLocation(line: 36, column: 21, scope: !64)
!90 = !MDLocation(line: 36, column: 16, scope: !64)
!91 = !MDLocation(line: 36, column: 7, scope: !64)
!92 = !MDLocation(line: 37, column: 21, scope: !64)
!93 = !MDLocation(line: 37, column: 16, scope: !64)
!94 = !MDLocation(line: 37, column: 7, scope: !64)
!95 = !MDLocation(line: 38, column: 21, scope: !64)
!96 = !MDLocation(line: 38, column: 16, scope: !64)
!97 = !MDLocation(line: 38, column: 7, scope: !64)
!98 = !MDLocation(line: 39, column: 22, scope: !64)
!99 = !MDLocation(line: 39, column: 17, scope: !64)
!100 = !MDLocation(line: 39, column: 7, scope: !64)
!101 = !MDLocation(line: 40, column: 22, scope: !64)
!102 = !MDLocation(line: 40, column: 17, scope: !64)
!103 = !MDLocation(line: 40, column: 7, scope: !64)
!104 = !MDLocation(line: 41, column: 22, scope: !64)
!105 = !MDLocation(line: 41, column: 17, scope: !64)
!106 = !MDLocation(line: 41, column: 7, scope: !64)
!107 = !MDLocation(line: 42, column: 5, scope: !64)
!108 = !MDLocation(line: 29, column: 34, scope: !61)
!109 = !MDLocation(line: 29, column: 5, scope: !61)
!110 = !MDLocation(line: 43, column: 3, scope: !52)
!111 = !MDLocation(line: 27, column: 28, scope: !49)
!112 = !MDLocation(line: 27, column: 3, scope: !49)
!113 = !MDLocation(line: 44, column: 8, scope: !114)
!114 = !{!"0xb\0044\003\006", !1, !4}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!115 = !MDLocation(line: 44, column: 15, scope: !116)
!116 = !{!"0xb\0044\003\007", !1, !114}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!117 = !MDLocation(line: 44, column: 3, scope: !114)
!118 = !MDLocation(line: 45, column: 25, scope: !119)
!119 = !{!"0xb\0044\0033\008", !1, !116}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!120 = !{!"0x100\00b\0045\000", !119, !5, !9}     ; [ DW_TAG_auto_variable ] [b] [line 45]
!121 = !MDLocation(line: 45, column: 21, scope: !119)
!122 = !MDLocation(line: 46, column: 18, scope: !119)
!123 = !MDLocation(line: 46, column: 13, scope: !119)
!124 = !MDLocation(line: 46, column: 5, scope: !119)
!125 = !MDLocation(line: 47, column: 18, scope: !119)
!126 = !MDLocation(line: 47, column: 13, scope: !119)
!127 = !MDLocation(line: 47, column: 5, scope: !119)
!128 = !MDLocation(line: 48, column: 18, scope: !119)
!129 = !MDLocation(line: 48, column: 13, scope: !119)
!130 = !MDLocation(line: 48, column: 5, scope: !119)
!131 = !MDLocation(line: 49, column: 3, scope: !119)
!132 = !MDLocation(line: 44, column: 28, scope: !116)
!133 = !MDLocation(line: 44, column: 3, scope: !116)
!134 = !MDLocation(line: 50, column: 1, scope: !4)
!135 = !{!"0x101\00nbodies\0016777268\000", !20, !5, !8} ; [ DW_TAG_arg_variable ] [nbodies] [line 52]
!136 = !MDLocation(line: 52, column: 19, scope: !20)
!137 = !{!"0x101\00bodies\0033554484\000", !20, !5, !9} ; [ DW_TAG_arg_variable ] [bodies] [line 52]
!138 = !MDLocation(line: 52, column: 44, scope: !20)
!139 = !{!"0x100\00e\0054\000", !20, !5, !13}     ; [ DW_TAG_auto_variable ] [e] [line 54]
!140 = !MDLocation(line: 54, column: 10, scope: !20)
!141 = !{!"0x100\00i\0055\000", !20, !5, !8}      ; [ DW_TAG_auto_variable ] [i] [line 55]
!142 = !MDLocation(line: 55, column: 7, scope: !20)
!143 = !MDLocation(line: 58, column: 8, scope: !144)
!144 = !{!"0xb\0058\003\009", !1, !20}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!145 = !MDLocation(line: 58, column: 15, scope: !146)
!146 = !{!"0xb\0058\003\0010", !1, !144}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!147 = !MDLocation(line: 58, column: 3, scope: !144)
!148 = !MDLocation(line: 59, column: 25, scope: !149)
!149 = !{!"0xb\0058\0033\0011", !1, !146}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!150 = !{!"0x100\00b\0059\000", !149, !5, !9}     ; [ DW_TAG_auto_variable ] [b] [line 59]
!151 = !MDLocation(line: 59, column: 21, scope: !149)
!152 = !MDLocation(line: 60, column: 16, scope: !149)
!153 = !MDLocation(line: 60, column: 10, scope: !149)
!154 = !MDLocation(line: 60, column: 27, scope: !149)
!155 = !MDLocation(line: 60, column: 35, scope: !149)
!156 = !MDLocation(line: 60, column: 43, scope: !149)
!157 = !MDLocation(line: 60, column: 51, scope: !149)
!158 = !MDLocation(line: 60, column: 59, scope: !149)
!159 = !MDLocation(line: 60, column: 67, scope: !149)
!160 = !MDLocation(line: 60, column: 5, scope: !149)
!161 = !MDLocation(line: 61, column: 14, scope: !162)
!162 = !{!"0xb\0061\005\0012", !1, !149}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!163 = !{!"0x100\00j\0055\000", !20, !5, !8}      ; [ DW_TAG_auto_variable ] [j] [line 55]
!164 = !MDLocation(line: 55, column: 10, scope: !20)
!165 = !MDLocation(line: 61, column: 10, scope: !162)
!166 = !MDLocation(line: 61, column: 21, scope: !167)
!167 = !{!"0xb\0061\005\0013", !1, !162}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!168 = !MDLocation(line: 61, column: 5, scope: !162)
!169 = !MDLocation(line: 62, column: 28, scope: !170)
!170 = !{!"0xb\0061\0039\0014", !1, !167}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!171 = !{!"0x100\00b2\0062\000", !170, !5, !9}    ; [ DW_TAG_auto_variable ] [b2] [line 62]
!172 = !MDLocation(line: 62, column: 23, scope: !170)
!173 = !MDLocation(line: 63, column: 19, scope: !170)
!174 = !MDLocation(line: 63, column: 26, scope: !170)
!175 = !{!"0x100\00dx\0063\000", !170, !5, !13}   ; [ DW_TAG_auto_variable ] [dx] [line 63]
!176 = !MDLocation(line: 63, column: 14, scope: !170)
!177 = !MDLocation(line: 64, column: 19, scope: !170)
!178 = !MDLocation(line: 64, column: 26, scope: !170)
!179 = !{!"0x100\00dy\0064\000", !170, !5, !13}   ; [ DW_TAG_auto_variable ] [dy] [line 64]
!180 = !MDLocation(line: 64, column: 14, scope: !170)
!181 = !MDLocation(line: 65, column: 19, scope: !170)
!182 = !MDLocation(line: 65, column: 26, scope: !170)
!183 = !{!"0x100\00dz\0065\000", !170, !5, !13}   ; [ DW_TAG_auto_variable ] [dz] [line 65]
!184 = !MDLocation(line: 65, column: 14, scope: !170)
!185 = !MDLocation(line: 66, column: 30, scope: !170)
!186 = !MDLocation(line: 66, column: 40, scope: !170)
!187 = !MDLocation(line: 66, column: 50, scope: !170)
!188 = !MDLocation(line: 66, column: 25, scope: !170)
!189 = !{!"0x100\00distance\0066\000", !170, !5, !13} ; [ DW_TAG_auto_variable ] [distance] [line 66]
!190 = !MDLocation(line: 66, column: 14, scope: !170)
!191 = !MDLocation(line: 67, column: 13, scope: !170)
!192 = !MDLocation(line: 67, column: 23, scope: !170)
!193 = !MDLocation(line: 67, column: 12, scope: !170)
!194 = !MDLocation(line: 67, column: 7, scope: !170)
!195 = !MDLocation(line: 68, column: 5, scope: !170)
!196 = !MDLocation(line: 61, column: 34, scope: !167)
!197 = !MDLocation(line: 61, column: 5, scope: !167)
!198 = !MDLocation(line: 69, column: 3, scope: !149)
!199 = !MDLocation(line: 58, column: 28, scope: !146)
!200 = !MDLocation(line: 58, column: 3, scope: !146)
!201 = !MDLocation(line: 70, column: 3, scope: !20)
!202 = !{!"0x101\00nbodies\0016777289\000", !23, !5, !8} ; [ DW_TAG_arg_variable ] [nbodies] [line 73]
!203 = !MDLocation(line: 73, column: 26, scope: !23)
!204 = !{!"0x101\00bodies\0033554505\000", !23, !5, !9} ; [ DW_TAG_arg_variable ] [bodies] [line 73]
!205 = !MDLocation(line: 73, column: 51, scope: !23)
!206 = !{!"0x100\00px\0075\000", !23, !5, !13}    ; [ DW_TAG_auto_variable ] [px] [line 75]
!207 = !MDLocation(line: 75, column: 10, scope: !23)
!208 = !{!"0x100\00py\0075\000", !23, !5, !13}    ; [ DW_TAG_auto_variable ] [py] [line 75]
!209 = !MDLocation(line: 75, column: 20, scope: !23)
!210 = !{!"0x100\00pz\0075\000", !23, !5, !13}    ; [ DW_TAG_auto_variable ] [pz] [line 75]
!211 = !MDLocation(line: 75, column: 30, scope: !23)
!212 = !{!"0x100\00i\0076\000", !23, !5, !8}      ; [ DW_TAG_auto_variable ] [i] [line 76]
!213 = !MDLocation(line: 76, column: 7, scope: !23)
!214 = !MDLocation(line: 77, column: 8, scope: !215)
!215 = !{!"0xb\0077\003\0015", !1, !23}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!216 = !MDLocation(line: 77, column: 15, scope: !217)
!217 = !{!"0xb\0077\003\0016", !1, !215}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!218 = !MDLocation(line: 77, column: 3, scope: !215)
!219 = !MDLocation(line: 78, column: 11, scope: !220)
!220 = !{!"0xb\0077\0033\0017", !1, !217}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!221 = !MDLocation(line: 78, column: 26, scope: !220)
!222 = !MDLocation(line: 78, column: 5, scope: !220)
!223 = !MDLocation(line: 79, column: 11, scope: !220)
!224 = !MDLocation(line: 79, column: 26, scope: !220)
!225 = !MDLocation(line: 79, column: 5, scope: !220)
!226 = !MDLocation(line: 80, column: 11, scope: !220)
!227 = !MDLocation(line: 80, column: 26, scope: !220)
!228 = !MDLocation(line: 80, column: 5, scope: !220)
!229 = !MDLocation(line: 81, column: 3, scope: !220)
!230 = !MDLocation(line: 77, column: 28, scope: !217)
!231 = !MDLocation(line: 77, column: 3, scope: !217)
!232 = !MDLocation(line: 82, column: 18, scope: !23)
!233 = !MDLocation(line: 82, column: 3, scope: !23)
!234 = !MDLocation(line: 83, column: 18, scope: !23)
!235 = !MDLocation(line: 83, column: 3, scope: !23)
!236 = !MDLocation(line: 84, column: 18, scope: !23)
!237 = !MDLocation(line: 84, column: 3, scope: !23)
!238 = !MDLocation(line: 85, column: 1, scope: !23)
!239 = !{!"0x101\00inputN\0016777346\000", !26, !5, !8} ; [ DW_TAG_arg_variable ] [inputN] [line 130]
!240 = !MDLocation(line: 130, column: 15, scope: !26)
!241 = !{!"0x100\00n\00132\000", !26, !5, !8}     ; [ DW_TAG_auto_variable ] [n] [line 132]
!242 = !MDLocation(line: 132, column: 7, scope: !26)
!243 = !{!"0x100\00bodies\00136\000", !26, !5, !31} ; [ DW_TAG_auto_variable ] [bodies] [line 136]
!244 = !MDLocation(line: 136, column: 17, scope: !26)
!245 = !MDLocation(line: 137, column: 3, scope: !26)
!246 = !MDLocation(line: 139, column: 28, scope: !26)
!247 = !MDLocation(line: 139, column: 3, scope: !26)
!248 = !MDLocation(line: 140, column: 37, scope: !26)
!249 = !MDLocation(line: 140, column: 21, scope: !26)
!250 = !MDLocation(line: 140, column: 3, scope: !26)
!251 = !{!"0x100\00i\00133\000", !26, !5, !8}     ; [ DW_TAG_auto_variable ] [i] [line 133]
!252 = !MDLocation(line: 133, column: 7, scope: !26)
!253 = !MDLocation(line: 141, column: 8, scope: !254)
!254 = !{!"0xb\00141\003\0018", !1, !26}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!255 = !MDLocation(line: 141, column: 15, scope: !256)
!256 = !{!"0xb\00141\003\0019", !1, !254}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!257 = !MDLocation(line: 141, column: 3, scope: !254)
!258 = !MDLocation(line: 142, column: 22, scope: !256)
!259 = !MDLocation(line: 142, column: 5, scope: !256)
!260 = !MDLocation(line: 141, column: 23, scope: !256)
!261 = !MDLocation(line: 141, column: 3, scope: !256)
!262 = !MDLocation(line: 143, column: 37, scope: !26)
!263 = !MDLocation(line: 143, column: 21, scope: !26)
!264 = !MDLocation(line: 143, column: 3, scope: !26)
!265 = !MDLocation(line: 144, column: 3, scope: !26)
