; ModuleID = 'code.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies_orig = global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @advance(i32 %nbodies, %struct.planet* %bodies, double %dt) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.planet*, align 8
  %3 = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %b = alloca %struct.planet*, align 8
  %b2 = alloca %struct.planet*, align 8
  %dx = alloca double, align 8
  %dy = alloca double, align 8
  %dz = alloca double, align 8
  %distance = alloca double, align 8
  %mag = alloca double, align 8
  %b1 = alloca %struct.planet*, align 8
  store i32 %nbodies, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !37, metadata !38), !dbg !39
  store %struct.planet* %bodies, %struct.planet** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.planet** %2, metadata !40, metadata !38), !dbg !41
  store double %dt, double* %3, align 8
  call void @llvm.dbg.declare(metadata double* %3, metadata !42, metadata !38), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %i, metadata !44, metadata !38), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %j, metadata !46, metadata !38), !dbg !47
  store i32 0, i32* %i, align 4, !dbg !48
  br label %4, !dbg !48

; <label>:4                                       ; preds = %134, %0
  %5 = load i32* %i, align 4, !dbg !50
  %6 = load i32* %1, align 4, !dbg !54
  %7 = icmp slt i32 %5, %6, !dbg !55
  br i1 %7, label %8, label %137, !dbg !56

; <label>:8                                       ; preds = %4
  call void @llvm.dbg.declare(metadata %struct.planet** %b, metadata !57, metadata !38), !dbg !59
  %9 = load i32* %i, align 4, !dbg !60
  %10 = sext i32 %9 to i64, !dbg !61
  %11 = load %struct.planet** %2, align 8, !dbg !62
  %12 = getelementptr inbounds %struct.planet* %11, i64 %10, !dbg !61
  store %struct.planet* %12, %struct.planet** %b, align 8, !dbg !59
  %13 = load i32* %i, align 4, !dbg !63
  %14 = add nsw i32 %13, 1, !dbg !63
  store i32 %14, i32* %j, align 4, !dbg !65
  br label %15, !dbg !65

; <label>:15                                      ; preds = %130, %8
  %16 = load i32* %j, align 4, !dbg !66
  %17 = load i32* %1, align 4, !dbg !70
  %18 = icmp slt i32 %16, %17, !dbg !71
  br i1 %18, label %19, label %133, !dbg !72

; <label>:19                                      ; preds = %15
  call void @llvm.dbg.declare(metadata %struct.planet** %b2, metadata !73, metadata !38), !dbg !75
  %20 = load i32* %j, align 4, !dbg !76
  %21 = sext i32 %20 to i64, !dbg !77
  %22 = load %struct.planet** %2, align 8, !dbg !78
  %23 = getelementptr inbounds %struct.planet* %22, i64 %21, !dbg !77
  store %struct.planet* %23, %struct.planet** %b2, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata double* %dx, metadata !79, metadata !38), !dbg !80
  %24 = load %struct.planet** %b, align 8, !dbg !81
  %25 = getelementptr inbounds %struct.planet* %24, i32 0, i32 0, !dbg !81
  %26 = load double* %25, align 8, !dbg !81
  %27 = load %struct.planet** %b2, align 8, !dbg !82
  %28 = getelementptr inbounds %struct.planet* %27, i32 0, i32 0, !dbg !82
  %29 = load double* %28, align 8, !dbg !82
  %30 = fsub double %26, %29, !dbg !81
  store double %30, double* %dx, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata double* %dy, metadata !83, metadata !38), !dbg !84
  %31 = load %struct.planet** %b, align 8, !dbg !85
  %32 = getelementptr inbounds %struct.planet* %31, i32 0, i32 1, !dbg !85
  %33 = load double* %32, align 8, !dbg !85
  %34 = load %struct.planet** %b2, align 8, !dbg !86
  %35 = getelementptr inbounds %struct.planet* %34, i32 0, i32 1, !dbg !86
  %36 = load double* %35, align 8, !dbg !86
  %37 = fsub double %33, %36, !dbg !85
  store double %37, double* %dy, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata double* %dz, metadata !87, metadata !38), !dbg !88
  %38 = load %struct.planet** %b, align 8, !dbg !89
  %39 = getelementptr inbounds %struct.planet* %38, i32 0, i32 2, !dbg !89
  %40 = load double* %39, align 8, !dbg !89
  %41 = load %struct.planet** %b2, align 8, !dbg !90
  %42 = getelementptr inbounds %struct.planet* %41, i32 0, i32 2, !dbg !90
  %43 = load double* %42, align 8, !dbg !90
  %44 = fsub double %40, %43, !dbg !89
  store double %44, double* %dz, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata double* %distance, metadata !91, metadata !38), !dbg !92
  %45 = load double* %dx, align 8, !dbg !93
  %46 = load double* %dx, align 8, !dbg !94
  %47 = fmul double %45, %46, !dbg !93
  %48 = load double* %dy, align 8, !dbg !95
  %49 = load double* %dy, align 8, !dbg !96
  %50 = fmul double %48, %49, !dbg !95
  %51 = fadd double %47, %50, !dbg !93
  %52 = load double* %dz, align 8, !dbg !97
  %53 = load double* %dz, align 8, !dbg !98
  %54 = fmul double %52, %53, !dbg !97
  %55 = fadd double %51, %54, !dbg !93
  %56 = call double @sqrt(double %55) #3, !dbg !99
  store double %56, double* %distance, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata double* %mag, metadata !100, metadata !38), !dbg !101
  %57 = load double* %3, align 8, !dbg !102
  %58 = load double* %distance, align 8, !dbg !103
  %59 = load double* %distance, align 8, !dbg !104
  %60 = fmul double %58, %59, !dbg !103
  %61 = load double* %distance, align 8, !dbg !105
  %62 = fmul double %60, %61, !dbg !103
  %63 = fdiv double %57, %62, !dbg !102
  store double %63, double* %mag, align 8, !dbg !101
  %64 = load double* %dx, align 8, !dbg !106
  %65 = load %struct.planet** %b2, align 8, !dbg !107
  %66 = getelementptr inbounds %struct.planet* %65, i32 0, i32 6, !dbg !107
  %67 = load double* %66, align 8, !dbg !107
  %68 = fmul double %64, %67, !dbg !106
  %69 = load double* %mag, align 8, !dbg !108
  %70 = fmul double %68, %69, !dbg !106
  %71 = load %struct.planet** %b, align 8, !dbg !109
  %72 = getelementptr inbounds %struct.planet* %71, i32 0, i32 3, !dbg !109
  %73 = load double* %72, align 8, !dbg !109
  %74 = fsub double %73, %70, !dbg !109
  store double %74, double* %72, align 8, !dbg !109
  %75 = load double* %dy, align 8, !dbg !110
  %76 = load %struct.planet** %b2, align 8, !dbg !111
  %77 = getelementptr inbounds %struct.planet* %76, i32 0, i32 6, !dbg !111
  %78 = load double* %77, align 8, !dbg !111
  %79 = fmul double %75, %78, !dbg !110
  %80 = load double* %mag, align 8, !dbg !112
  %81 = fmul double %79, %80, !dbg !110
  %82 = load %struct.planet** %b, align 8, !dbg !113
  %83 = getelementptr inbounds %struct.planet* %82, i32 0, i32 4, !dbg !113
  %84 = load double* %83, align 8, !dbg !113
  %85 = fsub double %84, %81, !dbg !113
  store double %85, double* %83, align 8, !dbg !113
  %86 = load double* %dz, align 8, !dbg !114
  %87 = load %struct.planet** %b2, align 8, !dbg !115
  %88 = getelementptr inbounds %struct.planet* %87, i32 0, i32 6, !dbg !115
  %89 = load double* %88, align 8, !dbg !115
  %90 = fmul double %86, %89, !dbg !114
  %91 = load double* %mag, align 8, !dbg !116
  %92 = fmul double %90, %91, !dbg !114
  %93 = load %struct.planet** %b, align 8, !dbg !117
  %94 = getelementptr inbounds %struct.planet* %93, i32 0, i32 5, !dbg !117
  %95 = load double* %94, align 8, !dbg !117
  %96 = fsub double %95, %92, !dbg !117
  store double %96, double* %94, align 8, !dbg !117
  %97 = load double* %dx, align 8, !dbg !118
  %98 = load %struct.planet** %b, align 8, !dbg !119
  %99 = getelementptr inbounds %struct.planet* %98, i32 0, i32 6, !dbg !119
  %100 = load double* %99, align 8, !dbg !119
  %101 = fmul double %97, %100, !dbg !118
  %102 = load double* %mag, align 8, !dbg !120
  %103 = fmul double %101, %102, !dbg !118
  %104 = load %struct.planet** %b2, align 8, !dbg !121
  %105 = getelementptr inbounds %struct.planet* %104, i32 0, i32 3, !dbg !121
  %106 = load double* %105, align 8, !dbg !121
  %107 = fadd double %106, %103, !dbg !121
  store double %107, double* %105, align 8, !dbg !121
  %108 = load double* %dy, align 8, !dbg !122
  %109 = load %struct.planet** %b, align 8, !dbg !123
  %110 = getelementptr inbounds %struct.planet* %109, i32 0, i32 6, !dbg !123
  %111 = load double* %110, align 8, !dbg !123
  %112 = fmul double %108, %111, !dbg !122
  %113 = load double* %mag, align 8, !dbg !124
  %114 = fmul double %112, %113, !dbg !122
  %115 = load %struct.planet** %b2, align 8, !dbg !125
  %116 = getelementptr inbounds %struct.planet* %115, i32 0, i32 4, !dbg !125
  %117 = load double* %116, align 8, !dbg !125
  %118 = fadd double %117, %114, !dbg !125
  store double %118, double* %116, align 8, !dbg !125
  %119 = load double* %dz, align 8, !dbg !126
  %120 = load %struct.planet** %b, align 8, !dbg !127
  %121 = getelementptr inbounds %struct.planet* %120, i32 0, i32 6, !dbg !127
  %122 = load double* %121, align 8, !dbg !127
  %123 = fmul double %119, %122, !dbg !126
  %124 = load double* %mag, align 8, !dbg !128
  %125 = fmul double %123, %124, !dbg !126
  %126 = load %struct.planet** %b2, align 8, !dbg !129
  %127 = getelementptr inbounds %struct.planet* %126, i32 0, i32 5, !dbg !129
  %128 = load double* %127, align 8, !dbg !129
  %129 = fadd double %128, %125, !dbg !129
  store double %129, double* %127, align 8, !dbg !129
  br label %130, !dbg !130

; <label>:130                                     ; preds = %19
  %131 = load i32* %j, align 4, !dbg !131
  %132 = add nsw i32 %131, 1, !dbg !131
  store i32 %132, i32* %j, align 4, !dbg !131
  br label %15, !dbg !132

; <label>:133                                     ; preds = %15
  br label %134, !dbg !133

; <label>:134                                     ; preds = %133
  %135 = load i32* %i, align 4, !dbg !134
  %136 = add nsw i32 %135, 1, !dbg !134
  store i32 %136, i32* %i, align 4, !dbg !134
  br label %4, !dbg !135

; <label>:137                                     ; preds = %4
  store i32 0, i32* %i, align 4, !dbg !136
  br label %138, !dbg !136

; <label>:138                                     ; preds = %174, %137
  %139 = load i32* %i, align 4, !dbg !138
  %140 = load i32* %1, align 4, !dbg !142
  %141 = icmp slt i32 %139, %140, !dbg !143
  br i1 %141, label %142, label %177, !dbg !144

; <label>:142                                     ; preds = %138
  call void @llvm.dbg.declare(metadata %struct.planet** %b1, metadata !145, metadata !38), !dbg !147
  %143 = load i32* %i, align 4, !dbg !148
  %144 = sext i32 %143 to i64, !dbg !149
  %145 = load %struct.planet** %2, align 8, !dbg !150
  %146 = getelementptr inbounds %struct.planet* %145, i64 %144, !dbg !149
  store %struct.planet* %146, %struct.planet** %b1, align 8, !dbg !147
  %147 = load double* %3, align 8, !dbg !151
  %148 = load %struct.planet** %b1, align 8, !dbg !152
  %149 = getelementptr inbounds %struct.planet* %148, i32 0, i32 3, !dbg !152
  %150 = load double* %149, align 8, !dbg !152
  %151 = fmul double %147, %150, !dbg !151
  %152 = load %struct.planet** %b1, align 8, !dbg !153
  %153 = getelementptr inbounds %struct.planet* %152, i32 0, i32 0, !dbg !153
  %154 = load double* %153, align 8, !dbg !153
  %155 = fadd double %154, %151, !dbg !153
  store double %155, double* %153, align 8, !dbg !153
  %156 = load double* %3, align 8, !dbg !154
  %157 = load %struct.planet** %b1, align 8, !dbg !155
  %158 = getelementptr inbounds %struct.planet* %157, i32 0, i32 4, !dbg !155
  %159 = load double* %158, align 8, !dbg !155
  %160 = fmul double %156, %159, !dbg !154
  %161 = load %struct.planet** %b1, align 8, !dbg !156
  %162 = getelementptr inbounds %struct.planet* %161, i32 0, i32 1, !dbg !156
  %163 = load double* %162, align 8, !dbg !156
  %164 = fadd double %163, %160, !dbg !156
  store double %164, double* %162, align 8, !dbg !156
  %165 = load double* %3, align 8, !dbg !157
  %166 = load %struct.planet** %b1, align 8, !dbg !158
  %167 = getelementptr inbounds %struct.planet* %166, i32 0, i32 5, !dbg !158
  %168 = load double* %167, align 8, !dbg !158
  %169 = fmul double %165, %168, !dbg !157
  %170 = load %struct.planet** %b1, align 8, !dbg !159
  %171 = getelementptr inbounds %struct.planet* %170, i32 0, i32 2, !dbg !159
  %172 = load double* %171, align 8, !dbg !159
  %173 = fadd double %172, %169, !dbg !159
  store double %173, double* %171, align 8, !dbg !159
  br label %174, !dbg !160

; <label>:174                                     ; preds = %142
  %175 = load i32* %i, align 4, !dbg !161
  %176 = add nsw i32 %175, 1, !dbg !161
  store i32 %176, i32* %i, align 4, !dbg !161
  br label %138, !dbg !162

; <label>:177                                     ; preds = %138
  ret void, !dbg !163
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind uwtable
define double @energy(i32 %nbodies, %struct.planet* %bodies) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.planet*, align 8
  %e = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %b = alloca %struct.planet*, align 8
  %b2 = alloca %struct.planet*, align 8
  %dx = alloca double, align 8
  %dy = alloca double, align 8
  %dz = alloca double, align 8
  %distance = alloca double, align 8
  store i32 %nbodies, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !164, metadata !38), !dbg !165
  store %struct.planet* %bodies, %struct.planet** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.planet** %2, metadata !166, metadata !38), !dbg !167
  call void @llvm.dbg.declare(metadata double* %e, metadata !168, metadata !38), !dbg !169
  call void @llvm.dbg.declare(metadata i32* %i, metadata !170, metadata !38), !dbg !171
  call void @llvm.dbg.declare(metadata i32* %j, metadata !172, metadata !38), !dbg !173
  store double 0.000000e+00, double* %e, align 8, !dbg !174
  store i32 0, i32* %i, align 4, !dbg !175
  br label %3, !dbg !175

; <label>:3                                       ; preds = %101, %0
  %4 = load i32* %i, align 4, !dbg !177
  %5 = load i32* %1, align 4, !dbg !181
  %6 = icmp slt i32 %4, %5, !dbg !182
  br i1 %6, label %7, label %104, !dbg !183

; <label>:7                                       ; preds = %3
  call void @llvm.dbg.declare(metadata %struct.planet** %b, metadata !184, metadata !38), !dbg !186
  %8 = load i32* %i, align 4, !dbg !187
  %9 = sext i32 %8 to i64, !dbg !188
  %10 = load %struct.planet** %2, align 8, !dbg !189
  %11 = getelementptr inbounds %struct.planet* %10, i64 %9, !dbg !188
  store %struct.planet* %11, %struct.planet** %b, align 8, !dbg !186
  %12 = load %struct.planet** %b, align 8, !dbg !190
  %13 = getelementptr inbounds %struct.planet* %12, i32 0, i32 6, !dbg !190
  %14 = load double* %13, align 8, !dbg !190
  %15 = fmul double 5.000000e-01, %14, !dbg !191
  %16 = load %struct.planet** %b, align 8, !dbg !192
  %17 = getelementptr inbounds %struct.planet* %16, i32 0, i32 3, !dbg !192
  %18 = load double* %17, align 8, !dbg !192
  %19 = load %struct.planet** %b, align 8, !dbg !193
  %20 = getelementptr inbounds %struct.planet* %19, i32 0, i32 3, !dbg !193
  %21 = load double* %20, align 8, !dbg !193
  %22 = fmul double %18, %21, !dbg !192
  %23 = load %struct.planet** %b, align 8, !dbg !194
  %24 = getelementptr inbounds %struct.planet* %23, i32 0, i32 4, !dbg !194
  %25 = load double* %24, align 8, !dbg !194
  %26 = load %struct.planet** %b, align 8, !dbg !195
  %27 = getelementptr inbounds %struct.planet* %26, i32 0, i32 4, !dbg !195
  %28 = load double* %27, align 8, !dbg !195
  %29 = fmul double %25, %28, !dbg !194
  %30 = fadd double %22, %29, !dbg !192
  %31 = load %struct.planet** %b, align 8, !dbg !196
  %32 = getelementptr inbounds %struct.planet* %31, i32 0, i32 5, !dbg !196
  %33 = load double* %32, align 8, !dbg !196
  %34 = load %struct.planet** %b, align 8, !dbg !197
  %35 = getelementptr inbounds %struct.planet* %34, i32 0, i32 5, !dbg !197
  %36 = load double* %35, align 8, !dbg !197
  %37 = fmul double %33, %36, !dbg !196
  %38 = fadd double %30, %37, !dbg !192
  %39 = fmul double %15, %38, !dbg !191
  %40 = load double* %e, align 8, !dbg !198
  %41 = fadd double %40, %39, !dbg !198
  store double %41, double* %e, align 8, !dbg !198
  %42 = load i32* %i, align 4, !dbg !199
  %43 = add nsw i32 %42, 1, !dbg !199
  store i32 %43, i32* %j, align 4, !dbg !201
  br label %44, !dbg !201

; <label>:44                                      ; preds = %97, %7
  %45 = load i32* %j, align 4, !dbg !202
  %46 = load i32* %1, align 4, !dbg !206
  %47 = icmp slt i32 %45, %46, !dbg !207
  br i1 %47, label %48, label %100, !dbg !208

; <label>:48                                      ; preds = %44
  call void @llvm.dbg.declare(metadata %struct.planet** %b2, metadata !209, metadata !38), !dbg !211
  %49 = load i32* %j, align 4, !dbg !212
  %50 = sext i32 %49 to i64, !dbg !213
  %51 = load %struct.planet** %2, align 8, !dbg !214
  %52 = getelementptr inbounds %struct.planet* %51, i64 %50, !dbg !213
  store %struct.planet* %52, %struct.planet** %b2, align 8, !dbg !211
  call void @llvm.dbg.declare(metadata double* %dx, metadata !215, metadata !38), !dbg !216
  %53 = load %struct.planet** %b, align 8, !dbg !217
  %54 = getelementptr inbounds %struct.planet* %53, i32 0, i32 0, !dbg !217
  %55 = load double* %54, align 8, !dbg !217
  %56 = load %struct.planet** %b2, align 8, !dbg !218
  %57 = getelementptr inbounds %struct.planet* %56, i32 0, i32 0, !dbg !218
  %58 = load double* %57, align 8, !dbg !218
  %59 = fsub double %55, %58, !dbg !217
  store double %59, double* %dx, align 8, !dbg !216
  call void @llvm.dbg.declare(metadata double* %dy, metadata !219, metadata !38), !dbg !220
  %60 = load %struct.planet** %b, align 8, !dbg !221
  %61 = getelementptr inbounds %struct.planet* %60, i32 0, i32 1, !dbg !221
  %62 = load double* %61, align 8, !dbg !221
  %63 = load %struct.planet** %b2, align 8, !dbg !222
  %64 = getelementptr inbounds %struct.planet* %63, i32 0, i32 1, !dbg !222
  %65 = load double* %64, align 8, !dbg !222
  %66 = fsub double %62, %65, !dbg !221
  store double %66, double* %dy, align 8, !dbg !220
  call void @llvm.dbg.declare(metadata double* %dz, metadata !223, metadata !38), !dbg !224
  %67 = load %struct.planet** %b, align 8, !dbg !225
  %68 = getelementptr inbounds %struct.planet* %67, i32 0, i32 2, !dbg !225
  %69 = load double* %68, align 8, !dbg !225
  %70 = load %struct.planet** %b2, align 8, !dbg !226
  %71 = getelementptr inbounds %struct.planet* %70, i32 0, i32 2, !dbg !226
  %72 = load double* %71, align 8, !dbg !226
  %73 = fsub double %69, %72, !dbg !225
  store double %73, double* %dz, align 8, !dbg !224
  call void @llvm.dbg.declare(metadata double* %distance, metadata !227, metadata !38), !dbg !228
  %74 = load double* %dx, align 8, !dbg !229
  %75 = load double* %dx, align 8, !dbg !230
  %76 = fmul double %74, %75, !dbg !229
  %77 = load double* %dy, align 8, !dbg !231
  %78 = load double* %dy, align 8, !dbg !232
  %79 = fmul double %77, %78, !dbg !231
  %80 = fadd double %76, %79, !dbg !229
  %81 = load double* %dz, align 8, !dbg !233
  %82 = load double* %dz, align 8, !dbg !234
  %83 = fmul double %81, %82, !dbg !233
  %84 = fadd double %80, %83, !dbg !229
  %85 = call double @sqrt(double %84) #3, !dbg !235
  store double %85, double* %distance, align 8, !dbg !228
  %86 = load %struct.planet** %b, align 8, !dbg !236
  %87 = getelementptr inbounds %struct.planet* %86, i32 0, i32 6, !dbg !236
  %88 = load double* %87, align 8, !dbg !236
  %89 = load %struct.planet** %b2, align 8, !dbg !237
  %90 = getelementptr inbounds %struct.planet* %89, i32 0, i32 6, !dbg !237
  %91 = load double* %90, align 8, !dbg !237
  %92 = fmul double %88, %91, !dbg !236
  %93 = load double* %distance, align 8, !dbg !238
  %94 = fdiv double %92, %93, !dbg !239
  %95 = load double* %e, align 8, !dbg !240
  %96 = fsub double %95, %94, !dbg !240
  store double %96, double* %e, align 8, !dbg !240
  br label %97, !dbg !241

; <label>:97                                      ; preds = %48
  %98 = load i32* %j, align 4, !dbg !242
  %99 = add nsw i32 %98, 1, !dbg !242
  store i32 %99, i32* %j, align 4, !dbg !242
  br label %44, !dbg !243

; <label>:100                                     ; preds = %44
  br label %101, !dbg !244

; <label>:101                                     ; preds = %100
  %102 = load i32* %i, align 4, !dbg !245
  %103 = add nsw i32 %102, 1, !dbg !245
  store i32 %103, i32* %i, align 4, !dbg !245
  br label %3, !dbg !246

; <label>:104                                     ; preds = %3
  %105 = load double* %e, align 8, !dbg !247
  ret double %105, !dbg !248
}

; Function Attrs: nounwind uwtable
define void @offset_momentum(i32 %nbodies, %struct.planet* %bodies) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.planet*, align 8
  %px = alloca double, align 8
  %py = alloca double, align 8
  %pz = alloca double, align 8
  %i = alloca i32, align 4
  store i32 %nbodies, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !249, metadata !38), !dbg !250
  store %struct.planet* %bodies, %struct.planet** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.planet** %2, metadata !251, metadata !38), !dbg !252
  call void @llvm.dbg.declare(metadata double* %px, metadata !253, metadata !38), !dbg !254
  store double 0.000000e+00, double* %px, align 8, !dbg !254
  call void @llvm.dbg.declare(metadata double* %py, metadata !255, metadata !38), !dbg !256
  store double 0.000000e+00, double* %py, align 8, !dbg !256
  call void @llvm.dbg.declare(metadata double* %pz, metadata !257, metadata !38), !dbg !258
  store double 0.000000e+00, double* %pz, align 8, !dbg !258
  call void @llvm.dbg.declare(metadata i32* %i, metadata !259, metadata !38), !dbg !260
  store i32 0, i32* %i, align 4, !dbg !261
  br label %3, !dbg !261

; <label>:3                                       ; preds = %53, %0
  %4 = load i32* %i, align 4, !dbg !263
  %5 = load i32* %1, align 4, !dbg !267
  %6 = icmp slt i32 %4, %5, !dbg !268
  br i1 %6, label %7, label %56, !dbg !269

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4, !dbg !270
  %9 = sext i32 %8 to i64, !dbg !272
  %10 = load %struct.planet** %2, align 8, !dbg !272
  %11 = getelementptr inbounds %struct.planet* %10, i64 %9, !dbg !272
  %12 = getelementptr inbounds %struct.planet* %11, i32 0, i32 3, !dbg !272
  %13 = load double* %12, align 8, !dbg !272
  %14 = load i32* %i, align 4, !dbg !273
  %15 = sext i32 %14 to i64, !dbg !274
  %16 = load %struct.planet** %2, align 8, !dbg !274
  %17 = getelementptr inbounds %struct.planet* %16, i64 %15, !dbg !274
  %18 = getelementptr inbounds %struct.planet* %17, i32 0, i32 6, !dbg !274
  %19 = load double* %18, align 8, !dbg !274
  %20 = fmul double %13, %19, !dbg !272
  %21 = load double* %px, align 8, !dbg !275
  %22 = fadd double %21, %20, !dbg !275
  store double %22, double* %px, align 8, !dbg !275
  %23 = load i32* %i, align 4, !dbg !276
  %24 = sext i32 %23 to i64, !dbg !277
  %25 = load %struct.planet** %2, align 8, !dbg !277
  %26 = getelementptr inbounds %struct.planet* %25, i64 %24, !dbg !277
  %27 = getelementptr inbounds %struct.planet* %26, i32 0, i32 4, !dbg !277
  %28 = load double* %27, align 8, !dbg !277
  %29 = load i32* %i, align 4, !dbg !278
  %30 = sext i32 %29 to i64, !dbg !279
  %31 = load %struct.planet** %2, align 8, !dbg !279
  %32 = getelementptr inbounds %struct.planet* %31, i64 %30, !dbg !279
  %33 = getelementptr inbounds %struct.planet* %32, i32 0, i32 6, !dbg !279
  %34 = load double* %33, align 8, !dbg !279
  %35 = fmul double %28, %34, !dbg !277
  %36 = load double* %py, align 8, !dbg !280
  %37 = fadd double %36, %35, !dbg !280
  store double %37, double* %py, align 8, !dbg !280
  %38 = load i32* %i, align 4, !dbg !281
  %39 = sext i32 %38 to i64, !dbg !282
  %40 = load %struct.planet** %2, align 8, !dbg !282
  %41 = getelementptr inbounds %struct.planet* %40, i64 %39, !dbg !282
  %42 = getelementptr inbounds %struct.planet* %41, i32 0, i32 5, !dbg !282
  %43 = load double* %42, align 8, !dbg !282
  %44 = load i32* %i, align 4, !dbg !283
  %45 = sext i32 %44 to i64, !dbg !284
  %46 = load %struct.planet** %2, align 8, !dbg !284
  %47 = getelementptr inbounds %struct.planet* %46, i64 %45, !dbg !284
  %48 = getelementptr inbounds %struct.planet* %47, i32 0, i32 6, !dbg !284
  %49 = load double* %48, align 8, !dbg !284
  %50 = fmul double %43, %49, !dbg !282
  %51 = load double* %pz, align 8, !dbg !285
  %52 = fadd double %51, %50, !dbg !285
  store double %52, double* %pz, align 8, !dbg !285
  br label %53, !dbg !286

; <label>:53                                      ; preds = %7
  %54 = load i32* %i, align 4, !dbg !287
  %55 = add nsw i32 %54, 1, !dbg !287
  store i32 %55, i32* %i, align 4, !dbg !287
  br label %3, !dbg !288

; <label>:56                                      ; preds = %3
  %57 = load double* %px, align 8, !dbg !289
  %58 = fsub double -0.000000e+00, %57, !dbg !290
  %59 = fdiv double %58, 0x4043BD3CC9BE45DE, !dbg !290
  %60 = load %struct.planet** %2, align 8, !dbg !291
  %61 = getelementptr inbounds %struct.planet* %60, i64 0, !dbg !291
  %62 = getelementptr inbounds %struct.planet* %61, i32 0, i32 3, !dbg !291
  store double %59, double* %62, align 8, !dbg !291
  %63 = load double* %py, align 8, !dbg !292
  %64 = fsub double -0.000000e+00, %63, !dbg !293
  %65 = fdiv double %64, 0x4043BD3CC9BE45DE, !dbg !293
  %66 = load %struct.planet** %2, align 8, !dbg !294
  %67 = getelementptr inbounds %struct.planet* %66, i64 0, !dbg !294
  %68 = getelementptr inbounds %struct.planet* %67, i32 0, i32 4, !dbg !294
  store double %65, double* %68, align 8, !dbg !294
  %69 = load double* %pz, align 8, !dbg !295
  %70 = fsub double -0.000000e+00, %69, !dbg !296
  %71 = fdiv double %70, 0x4043BD3CC9BE45DE, !dbg !296
  %72 = load %struct.planet** %2, align 8, !dbg !297
  %73 = getelementptr inbounds %struct.planet* %72, i64 0, !dbg !297
  %74 = getelementptr inbounds %struct.planet* %73, i32 0, i32 5, !dbg !297
  store double %71, double* %74, align 8, !dbg !297
  ret void, !dbg !298
}

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %bodies = alloca [5 x %struct.planet], align 16
  store i32 %inputN, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !299, metadata !38), !dbg !300
  call void @llvm.dbg.declare(metadata i32* %n, metadata !301, metadata !38), !dbg !302
  %2 = load i32* %1, align 4, !dbg !303
  store i32 %2, i32* %n, align 4, !dbg !302
  call void @llvm.dbg.declare(metadata i32* %i, metadata !304, metadata !38), !dbg !305
  call void @llvm.dbg.declare(metadata [5 x %struct.planet]* %bodies, metadata !306, metadata !38), !dbg !307
  %3 = bitcast [5 x %struct.planet]* %bodies to i8*, !dbg !308
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([5 x %struct.planet]* @bodies_orig to i8*), i64 280, i32 16, i1 false), !dbg !308
  %4 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0, !dbg !309
  call void @offset_momentum(i32 5, %struct.planet* %4), !dbg !310
  %5 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0, !dbg !311
  %6 = call double @energy(i32 5, %struct.planet* %5), !dbg !312
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %6), !dbg !313
  store i32 1, i32* %i, align 4, !dbg !314
  br label %8, !dbg !314

; <label>:8                                       ; preds = %14, %0
  %9 = load i32* %i, align 4, !dbg !316
  %10 = load i32* %n, align 4, !dbg !320
  %11 = icmp sle i32 %9, %10, !dbg !321
  br i1 %11, label %12, label %17, !dbg !322

; <label>:12                                      ; preds = %8
  %13 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0, !dbg !323
  call void @advance(i32 5, %struct.planet* %13, double 1.000000e-02), !dbg !324
  br label %14, !dbg !324

; <label>:14                                      ; preds = %12
  %15 = load i32* %i, align 4, !dbg !325
  %16 = add nsw i32 %15, 1, !dbg !325
  store i32 %16, i32* %i, align 4, !dbg !325
  br label %8, !dbg !326

; <label>:17                                      ; preds = %8
  %18 = getelementptr inbounds [5 x %struct.planet]* %bodies, i32 0, i32 0, !dbg !327
  %19 = call double @energy(i32 5, %struct.planet* %18), !dbg !328
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %19), !dbg !329
  ret i32 0, !dbg !330
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

declare i32 @printf(i8*, ...) #4

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
!46 = !{!"0x100\00j\0025\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [j] [line 25]
!47 = !MDLocation(line: 25, column: 10, scope: !4)
!48 = !MDLocation(line: 27, column: 8, scope: !49)
!49 = !{!"0xb\0027\003\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!50 = !MDLocation(line: 27, column: 15, scope: !51)
!51 = !{!"0xb\002", !1, !52}                      ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!52 = !{!"0xb\001", !1, !53}                      ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!53 = !{!"0xb\0027\003\001", !1, !49}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!54 = !MDLocation(line: 27, column: 19, scope: !53)
!55 = !MDLocation(line: 27, column: 15, scope: !53)
!56 = !MDLocation(line: 27, column: 3, scope: !49)
!57 = !{!"0x100\00b\0028\000", !58, !5, !9}       ; [ DW_TAG_auto_variable ] [b] [line 28]
!58 = !{!"0xb\0027\0033\002", !1, !53}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!59 = !MDLocation(line: 28, column: 21, scope: !58)
!60 = !MDLocation(line: 28, column: 34, scope: !58)
!61 = !MDLocation(line: 28, column: 25, scope: !58)
!62 = !MDLocation(line: 28, column: 27, scope: !58)
!63 = !MDLocation(line: 29, column: 14, scope: !64)
!64 = !{!"0xb\0029\005\003", !1, !58}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!65 = !MDLocation(line: 29, column: 10, scope: !64)
!66 = !MDLocation(line: 29, column: 21, scope: !67)
!67 = !{!"0xb\002", !1, !68}                      ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!68 = !{!"0xb\001", !1, !69}                      ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!69 = !{!"0xb\0029\005\004", !1, !64}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!70 = !MDLocation(line: 29, column: 25, scope: !69)
!71 = !MDLocation(line: 29, column: 21, scope: !69)
!72 = !MDLocation(line: 29, column: 5, scope: !64)
!73 = !{!"0x100\00b2\0030\000", !74, !5, !9}      ; [ DW_TAG_auto_variable ] [b2] [line 30]
!74 = !{!"0xb\0029\0039\005", !1, !69}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!75 = !MDLocation(line: 30, column: 23, scope: !74)
!76 = !MDLocation(line: 30, column: 37, scope: !74)
!77 = !MDLocation(line: 30, column: 28, scope: !74)
!78 = !MDLocation(line: 30, column: 30, scope: !74)
!79 = !{!"0x100\00dx\0031\000", !74, !5, !13}     ; [ DW_TAG_auto_variable ] [dx] [line 31]
!80 = !MDLocation(line: 31, column: 14, scope: !74)
!81 = !MDLocation(line: 31, column: 19, scope: !74)
!82 = !MDLocation(line: 31, column: 26, scope: !74)
!83 = !{!"0x100\00dy\0032\000", !74, !5, !13}     ; [ DW_TAG_auto_variable ] [dy] [line 32]
!84 = !MDLocation(line: 32, column: 14, scope: !74)
!85 = !MDLocation(line: 32, column: 19, scope: !74)
!86 = !MDLocation(line: 32, column: 26, scope: !74)
!87 = !{!"0x100\00dz\0033\000", !74, !5, !13}     ; [ DW_TAG_auto_variable ] [dz] [line 33]
!88 = !MDLocation(line: 33, column: 14, scope: !74)
!89 = !MDLocation(line: 33, column: 19, scope: !74)
!90 = !MDLocation(line: 33, column: 26, scope: !74)
!91 = !{!"0x100\00distance\0034\000", !74, !5, !13} ; [ DW_TAG_auto_variable ] [distance] [line 34]
!92 = !MDLocation(line: 34, column: 14, scope: !74)
!93 = !MDLocation(line: 34, column: 30, scope: !74)
!94 = !MDLocation(line: 34, column: 35, scope: !74)
!95 = !MDLocation(line: 34, column: 40, scope: !74)
!96 = !MDLocation(line: 34, column: 45, scope: !74)
!97 = !MDLocation(line: 34, column: 50, scope: !74)
!98 = !MDLocation(line: 34, column: 55, scope: !74)
!99 = !MDLocation(line: 34, column: 25, scope: !74)
!100 = !{!"0x100\00mag\0035\000", !74, !5, !13}   ; [ DW_TAG_auto_variable ] [mag] [line 35]
!101 = !MDLocation(line: 35, column: 14, scope: !74)
!102 = !MDLocation(line: 35, column: 20, scope: !74)
!103 = !MDLocation(line: 35, column: 26, scope: !74)
!104 = !MDLocation(line: 35, column: 37, scope: !74)
!105 = !MDLocation(line: 35, column: 48, scope: !74)
!106 = !MDLocation(line: 36, column: 16, scope: !74)
!107 = !MDLocation(line: 36, column: 21, scope: !74)
!108 = !MDLocation(line: 36, column: 32, scope: !74)
!109 = !MDLocation(line: 36, column: 7, scope: !74)
!110 = !MDLocation(line: 37, column: 16, scope: !74)
!111 = !MDLocation(line: 37, column: 21, scope: !74)
!112 = !MDLocation(line: 37, column: 32, scope: !74)
!113 = !MDLocation(line: 37, column: 7, scope: !74)
!114 = !MDLocation(line: 38, column: 16, scope: !74)
!115 = !MDLocation(line: 38, column: 21, scope: !74)
!116 = !MDLocation(line: 38, column: 32, scope: !74)
!117 = !MDLocation(line: 38, column: 7, scope: !74)
!118 = !MDLocation(line: 39, column: 17, scope: !74)
!119 = !MDLocation(line: 39, column: 22, scope: !74)
!120 = !MDLocation(line: 39, column: 32, scope: !74)
!121 = !MDLocation(line: 39, column: 7, scope: !74)
!122 = !MDLocation(line: 40, column: 17, scope: !74)
!123 = !MDLocation(line: 40, column: 22, scope: !74)
!124 = !MDLocation(line: 40, column: 32, scope: !74)
!125 = !MDLocation(line: 40, column: 7, scope: !74)
!126 = !MDLocation(line: 41, column: 17, scope: !74)
!127 = !MDLocation(line: 41, column: 22, scope: !74)
!128 = !MDLocation(line: 41, column: 32, scope: !74)
!129 = !MDLocation(line: 41, column: 7, scope: !74)
!130 = !MDLocation(line: 42, column: 5, scope: !74)
!131 = !MDLocation(line: 29, column: 34, scope: !69)
!132 = !MDLocation(line: 29, column: 5, scope: !69)
!133 = !MDLocation(line: 43, column: 3, scope: !58)
!134 = !MDLocation(line: 27, column: 28, scope: !53)
!135 = !MDLocation(line: 27, column: 3, scope: !53)
!136 = !MDLocation(line: 44, column: 8, scope: !137)
!137 = !{!"0xb\0044\003\006", !1, !4}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!138 = !MDLocation(line: 44, column: 15, scope: !139)
!139 = !{!"0xb\002", !1, !140}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!140 = !{!"0xb\001", !1, !141}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!141 = !{!"0xb\0044\003\007", !1, !137}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!142 = !MDLocation(line: 44, column: 19, scope: !141)
!143 = !MDLocation(line: 44, column: 15, scope: !141)
!144 = !MDLocation(line: 44, column: 3, scope: !137)
!145 = !{!"0x100\00b\0045\000", !146, !5, !9}     ; [ DW_TAG_auto_variable ] [b] [line 45]
!146 = !{!"0xb\0044\0033\008", !1, !141}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!147 = !MDLocation(line: 45, column: 21, scope: !146)
!148 = !MDLocation(line: 45, column: 34, scope: !146)
!149 = !MDLocation(line: 45, column: 25, scope: !146)
!150 = !MDLocation(line: 45, column: 27, scope: !146)
!151 = !MDLocation(line: 46, column: 13, scope: !146)
!152 = !MDLocation(line: 46, column: 18, scope: !146)
!153 = !MDLocation(line: 46, column: 5, scope: !146)
!154 = !MDLocation(line: 47, column: 13, scope: !146)
!155 = !MDLocation(line: 47, column: 18, scope: !146)
!156 = !MDLocation(line: 47, column: 5, scope: !146)
!157 = !MDLocation(line: 48, column: 13, scope: !146)
!158 = !MDLocation(line: 48, column: 18, scope: !146)
!159 = !MDLocation(line: 48, column: 5, scope: !146)
!160 = !MDLocation(line: 49, column: 3, scope: !146)
!161 = !MDLocation(line: 44, column: 28, scope: !141)
!162 = !MDLocation(line: 44, column: 3, scope: !141)
!163 = !MDLocation(line: 50, column: 1, scope: !4)
!164 = !{!"0x101\00nbodies\0016777268\000", !20, !5, !8} ; [ DW_TAG_arg_variable ] [nbodies] [line 52]
!165 = !MDLocation(line: 52, column: 19, scope: !20)
!166 = !{!"0x101\00bodies\0033554484\000", !20, !5, !9} ; [ DW_TAG_arg_variable ] [bodies] [line 52]
!167 = !MDLocation(line: 52, column: 44, scope: !20)
!168 = !{!"0x100\00e\0054\000", !20, !5, !13}     ; [ DW_TAG_auto_variable ] [e] [line 54]
!169 = !MDLocation(line: 54, column: 10, scope: !20)
!170 = !{!"0x100\00i\0055\000", !20, !5, !8}      ; [ DW_TAG_auto_variable ] [i] [line 55]
!171 = !MDLocation(line: 55, column: 7, scope: !20)
!172 = !{!"0x100\00j\0055\000", !20, !5, !8}      ; [ DW_TAG_auto_variable ] [j] [line 55]
!173 = !MDLocation(line: 55, column: 10, scope: !20)
!174 = !MDLocation(line: 57, column: 3, scope: !20)
!175 = !MDLocation(line: 58, column: 8, scope: !176)
!176 = !{!"0xb\0058\003\009", !1, !20}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!177 = !MDLocation(line: 58, column: 15, scope: !178)
!178 = !{!"0xb\002", !1, !179}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!179 = !{!"0xb\001", !1, !180}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!180 = !{!"0xb\0058\003\0010", !1, !176}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!181 = !MDLocation(line: 58, column: 19, scope: !180)
!182 = !MDLocation(line: 58, column: 15, scope: !180)
!183 = !MDLocation(line: 58, column: 3, scope: !176)
!184 = !{!"0x100\00b\0059\000", !185, !5, !9}     ; [ DW_TAG_auto_variable ] [b] [line 59]
!185 = !{!"0xb\0058\0033\0011", !1, !180}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!186 = !MDLocation(line: 59, column: 21, scope: !185)
!187 = !MDLocation(line: 59, column: 34, scope: !185)
!188 = !MDLocation(line: 59, column: 25, scope: !185)
!189 = !MDLocation(line: 59, column: 27, scope: !185)
!190 = !MDLocation(line: 60, column: 16, scope: !185)
!191 = !MDLocation(line: 60, column: 10, scope: !185)
!192 = !MDLocation(line: 60, column: 27, scope: !185)
!193 = !MDLocation(line: 60, column: 35, scope: !185)
!194 = !MDLocation(line: 60, column: 43, scope: !185)
!195 = !MDLocation(line: 60, column: 51, scope: !185)
!196 = !MDLocation(line: 60, column: 59, scope: !185)
!197 = !MDLocation(line: 60, column: 67, scope: !185)
!198 = !MDLocation(line: 60, column: 5, scope: !185)
!199 = !MDLocation(line: 61, column: 14, scope: !200)
!200 = !{!"0xb\0061\005\0012", !1, !185}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!201 = !MDLocation(line: 61, column: 10, scope: !200)
!202 = !MDLocation(line: 61, column: 21, scope: !203)
!203 = !{!"0xb\002", !1, !204}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!204 = !{!"0xb\001", !1, !205}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!205 = !{!"0xb\0061\005\0013", !1, !200}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!206 = !MDLocation(line: 61, column: 25, scope: !205)
!207 = !MDLocation(line: 61, column: 21, scope: !205)
!208 = !MDLocation(line: 61, column: 5, scope: !200)
!209 = !{!"0x100\00b2\0062\000", !210, !5, !9}    ; [ DW_TAG_auto_variable ] [b2] [line 62]
!210 = !{!"0xb\0061\0039\0014", !1, !205}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!211 = !MDLocation(line: 62, column: 23, scope: !210)
!212 = !MDLocation(line: 62, column: 37, scope: !210)
!213 = !MDLocation(line: 62, column: 28, scope: !210)
!214 = !MDLocation(line: 62, column: 30, scope: !210)
!215 = !{!"0x100\00dx\0063\000", !210, !5, !13}   ; [ DW_TAG_auto_variable ] [dx] [line 63]
!216 = !MDLocation(line: 63, column: 14, scope: !210)
!217 = !MDLocation(line: 63, column: 19, scope: !210)
!218 = !MDLocation(line: 63, column: 26, scope: !210)
!219 = !{!"0x100\00dy\0064\000", !210, !5, !13}   ; [ DW_TAG_auto_variable ] [dy] [line 64]
!220 = !MDLocation(line: 64, column: 14, scope: !210)
!221 = !MDLocation(line: 64, column: 19, scope: !210)
!222 = !MDLocation(line: 64, column: 26, scope: !210)
!223 = !{!"0x100\00dz\0065\000", !210, !5, !13}   ; [ DW_TAG_auto_variable ] [dz] [line 65]
!224 = !MDLocation(line: 65, column: 14, scope: !210)
!225 = !MDLocation(line: 65, column: 19, scope: !210)
!226 = !MDLocation(line: 65, column: 26, scope: !210)
!227 = !{!"0x100\00distance\0066\000", !210, !5, !13} ; [ DW_TAG_auto_variable ] [distance] [line 66]
!228 = !MDLocation(line: 66, column: 14, scope: !210)
!229 = !MDLocation(line: 66, column: 30, scope: !210)
!230 = !MDLocation(line: 66, column: 35, scope: !210)
!231 = !MDLocation(line: 66, column: 40, scope: !210)
!232 = !MDLocation(line: 66, column: 45, scope: !210)
!233 = !MDLocation(line: 66, column: 50, scope: !210)
!234 = !MDLocation(line: 66, column: 55, scope: !210)
!235 = !MDLocation(line: 66, column: 25, scope: !210)
!236 = !MDLocation(line: 67, column: 13, scope: !210)
!237 = !MDLocation(line: 67, column: 23, scope: !210)
!238 = !MDLocation(line: 67, column: 35, scope: !210)
!239 = !MDLocation(line: 67, column: 12, scope: !210)
!240 = !MDLocation(line: 67, column: 7, scope: !210)
!241 = !MDLocation(line: 68, column: 5, scope: !210)
!242 = !MDLocation(line: 61, column: 34, scope: !205)
!243 = !MDLocation(line: 61, column: 5, scope: !205)
!244 = !MDLocation(line: 69, column: 3, scope: !185)
!245 = !MDLocation(line: 58, column: 28, scope: !180)
!246 = !MDLocation(line: 58, column: 3, scope: !180)
!247 = !MDLocation(line: 70, column: 10, scope: !20)
!248 = !MDLocation(line: 70, column: 3, scope: !20)
!249 = !{!"0x101\00nbodies\0016777289\000", !23, !5, !8} ; [ DW_TAG_arg_variable ] [nbodies] [line 73]
!250 = !MDLocation(line: 73, column: 26, scope: !23)
!251 = !{!"0x101\00bodies\0033554505\000", !23, !5, !9} ; [ DW_TAG_arg_variable ] [bodies] [line 73]
!252 = !MDLocation(line: 73, column: 51, scope: !23)
!253 = !{!"0x100\00px\0075\000", !23, !5, !13}    ; [ DW_TAG_auto_variable ] [px] [line 75]
!254 = !MDLocation(line: 75, column: 10, scope: !23)
!255 = !{!"0x100\00py\0075\000", !23, !5, !13}    ; [ DW_TAG_auto_variable ] [py] [line 75]
!256 = !MDLocation(line: 75, column: 20, scope: !23)
!257 = !{!"0x100\00pz\0075\000", !23, !5, !13}    ; [ DW_TAG_auto_variable ] [pz] [line 75]
!258 = !MDLocation(line: 75, column: 30, scope: !23)
!259 = !{!"0x100\00i\0076\000", !23, !5, !8}      ; [ DW_TAG_auto_variable ] [i] [line 76]
!260 = !MDLocation(line: 76, column: 7, scope: !23)
!261 = !MDLocation(line: 77, column: 8, scope: !262)
!262 = !{!"0xb\0077\003\0015", !1, !23}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!263 = !MDLocation(line: 77, column: 15, scope: !264)
!264 = !{!"0xb\002", !1, !265}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!265 = !{!"0xb\001", !1, !266}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!266 = !{!"0xb\0077\003\0016", !1, !262}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!267 = !MDLocation(line: 77, column: 19, scope: !266)
!268 = !MDLocation(line: 77, column: 15, scope: !266)
!269 = !MDLocation(line: 77, column: 3, scope: !262)
!270 = !MDLocation(line: 78, column: 18, scope: !271)
!271 = !{!"0xb\0077\0033\0017", !1, !266}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!272 = !MDLocation(line: 78, column: 11, scope: !271)
!273 = !MDLocation(line: 78, column: 33, scope: !271)
!274 = !MDLocation(line: 78, column: 26, scope: !271)
!275 = !MDLocation(line: 78, column: 5, scope: !271)
!276 = !MDLocation(line: 79, column: 18, scope: !271)
!277 = !MDLocation(line: 79, column: 11, scope: !271)
!278 = !MDLocation(line: 79, column: 33, scope: !271)
!279 = !MDLocation(line: 79, column: 26, scope: !271)
!280 = !MDLocation(line: 79, column: 5, scope: !271)
!281 = !MDLocation(line: 80, column: 18, scope: !271)
!282 = !MDLocation(line: 80, column: 11, scope: !271)
!283 = !MDLocation(line: 80, column: 33, scope: !271)
!284 = !MDLocation(line: 80, column: 26, scope: !271)
!285 = !MDLocation(line: 80, column: 5, scope: !271)
!286 = !MDLocation(line: 81, column: 3, scope: !271)
!287 = !MDLocation(line: 77, column: 28, scope: !266)
!288 = !MDLocation(line: 77, column: 3, scope: !266)
!289 = !MDLocation(line: 82, column: 20, scope: !23)
!290 = !MDLocation(line: 82, column: 18, scope: !23)
!291 = !MDLocation(line: 82, column: 3, scope: !23)
!292 = !MDLocation(line: 83, column: 20, scope: !23)
!293 = !MDLocation(line: 83, column: 18, scope: !23)
!294 = !MDLocation(line: 83, column: 3, scope: !23)
!295 = !MDLocation(line: 84, column: 20, scope: !23)
!296 = !MDLocation(line: 84, column: 18, scope: !23)
!297 = !MDLocation(line: 84, column: 3, scope: !23)
!298 = !MDLocation(line: 85, column: 1, scope: !23)
!299 = !{!"0x101\00inputN\0016777346\000", !26, !5, !8} ; [ DW_TAG_arg_variable ] [inputN] [line 130]
!300 = !MDLocation(line: 130, column: 15, scope: !26)
!301 = !{!"0x100\00n\00132\000", !26, !5, !8}     ; [ DW_TAG_auto_variable ] [n] [line 132]
!302 = !MDLocation(line: 132, column: 7, scope: !26)
!303 = !MDLocation(line: 132, column: 11, scope: !26)
!304 = !{!"0x100\00i\00133\000", !26, !5, !8}     ; [ DW_TAG_auto_variable ] [i] [line 133]
!305 = !MDLocation(line: 133, column: 7, scope: !26)
!306 = !{!"0x100\00bodies\00136\000", !26, !5, !31} ; [ DW_TAG_auto_variable ] [bodies] [line 136]
!307 = !MDLocation(line: 136, column: 17, scope: !26)
!308 = !MDLocation(line: 137, column: 3, scope: !26)
!309 = !MDLocation(line: 139, column: 28, scope: !26)
!310 = !MDLocation(line: 139, column: 3, scope: !26)
!311 = !MDLocation(line: 140, column: 37, scope: !26)
!312 = !MDLocation(line: 140, column: 21, scope: !26)
!313 = !MDLocation(line: 140, column: 3, scope: !26)
!314 = !MDLocation(line: 141, column: 8, scope: !315)
!315 = !{!"0xb\00141\003\0018", !1, !26}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!316 = !MDLocation(line: 141, column: 15, scope: !317)
!317 = !{!"0xb\002", !1, !318}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!318 = !{!"0xb\001", !1, !319}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!319 = !{!"0xb\00141\003\0019", !1, !315}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/n-body/code.c]
!320 = !MDLocation(line: 141, column: 20, scope: !319)
!321 = !MDLocation(line: 141, column: 15, scope: !319)
!322 = !MDLocation(line: 141, column: 3, scope: !315)
!323 = !MDLocation(line: 142, column: 22, scope: !319)
!324 = !MDLocation(line: 142, column: 5, scope: !319)
!325 = !MDLocation(line: 141, column: 23, scope: !319)
!326 = !MDLocation(line: 141, column: 3, scope: !319)
!327 = !MDLocation(line: 143, column: 37, scope: !26)
!328 = !MDLocation(line: 143, column: 21, scope: !26)
!329 = !MDLocation(line: 143, column: 3, scope: !26)
!330 = !MDLocation(line: 144, column: 3, scope: !26)
