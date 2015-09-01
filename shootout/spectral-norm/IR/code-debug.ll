; ModuleID = 'code.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @eval_A(i32 %i, i32 %j) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !24, metadata !25), !dbg !26
  store i32 %j, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !27, metadata !25), !dbg !28
  %3 = load i32* %1, align 4, !dbg !29
  %4 = load i32* %2, align 4, !dbg !30
  %5 = add nsw i32 %3, %4, !dbg !29
  %6 = load i32* %1, align 4, !dbg !31
  %7 = load i32* %2, align 4, !dbg !32
  %8 = add nsw i32 %6, %7, !dbg !31
  %9 = add nsw i32 %8, 1, !dbg !31
  %10 = mul nsw i32 %5, %9, !dbg !33
  %11 = sdiv i32 %10, 2, !dbg !33
  %12 = load i32* %1, align 4, !dbg !34
  %13 = add nsw i32 %11, %12, !dbg !33
  %14 = add nsw i32 %13, 1, !dbg !33
  %15 = sitofp i32 %14 to double, !dbg !35
  %16 = fdiv double 1.000000e+00, %15, !dbg !36
  ret double %16, !dbg !37
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @eval_A_times_u(i32 %N, double* %u, double* %Au) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !38, metadata !25), !dbg !39
  store double* %u, double** %2, align 8
  call void @llvm.dbg.declare(metadata double** %2, metadata !40, metadata !25), !dbg !41
  store double* %Au, double** %3, align 8
  call void @llvm.dbg.declare(metadata double** %3, metadata !42, metadata !25), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %i, metadata !44, metadata !25), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %j, metadata !46, metadata !25), !dbg !47
  store i32 0, i32* %i, align 4, !dbg !48
  br label %4, !dbg !48

; <label>:4                                       ; preds = %37, %0
  %5 = load i32* %i, align 4, !dbg !50
  %6 = load i32* %1, align 4, !dbg !54
  %7 = icmp slt i32 %5, %6, !dbg !55
  br i1 %7, label %8, label %40, !dbg !56

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4, !dbg !57
  %10 = sext i32 %9 to i64, !dbg !59
  %11 = load double** %3, align 8, !dbg !59
  %12 = getelementptr inbounds double* %11, i64 %10, !dbg !59
  store double 0.000000e+00, double* %12, align 8, !dbg !59
  store i32 0, i32* %j, align 4, !dbg !60
  br label %13, !dbg !60

; <label>:13                                      ; preds = %33, %8
  %14 = load i32* %j, align 4, !dbg !62
  %15 = load i32* %1, align 4, !dbg !66
  %16 = icmp slt i32 %14, %15, !dbg !67
  br i1 %16, label %17, label %36, !dbg !68

; <label>:17                                      ; preds = %13
  %18 = load i32* %i, align 4, !dbg !69
  %19 = load i32* %j, align 4, !dbg !71
  %20 = call double @eval_A(i32 %18, i32 %19), !dbg !72
  %21 = load i32* %j, align 4, !dbg !73
  %22 = sext i32 %21 to i64, !dbg !74
  %23 = load double** %2, align 8, !dbg !74
  %24 = getelementptr inbounds double* %23, i64 %22, !dbg !74
  %25 = load double* %24, align 8, !dbg !74
  %26 = fmul double %20, %25, !dbg !72
  %27 = load i32* %i, align 4, !dbg !75
  %28 = sext i32 %27 to i64, !dbg !76
  %29 = load double** %3, align 8, !dbg !76
  %30 = getelementptr inbounds double* %29, i64 %28, !dbg !76
  %31 = load double* %30, align 8, !dbg !76
  %32 = fadd double %31, %26, !dbg !76
  store double %32, double* %30, align 8, !dbg !76
  br label %33, !dbg !76

; <label>:33                                      ; preds = %17
  %34 = load i32* %j, align 4, !dbg !77
  %35 = add nsw i32 %34, 1, !dbg !77
  store i32 %35, i32* %j, align 4, !dbg !77
  br label %13, !dbg !79

; <label>:36                                      ; preds = %13
  br label %37, !dbg !80

; <label>:37                                      ; preds = %36
  %38 = load i32* %i, align 4, !dbg !81
  %39 = add nsw i32 %38, 1, !dbg !81
  store i32 %39, i32* %i, align 4, !dbg !81
  br label %4, !dbg !82

; <label>:40                                      ; preds = %4
  ret void, !dbg !83
}

; Function Attrs: nounwind uwtable
define void @eval_At_times_u(i32 %N, double* %u, double* %Au) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !84, metadata !25), !dbg !85
  store double* %u, double** %2, align 8
  call void @llvm.dbg.declare(metadata double** %2, metadata !86, metadata !25), !dbg !87
  store double* %Au, double** %3, align 8
  call void @llvm.dbg.declare(metadata double** %3, metadata !88, metadata !25), !dbg !89
  call void @llvm.dbg.declare(metadata i32* %i, metadata !90, metadata !25), !dbg !91
  call void @llvm.dbg.declare(metadata i32* %j, metadata !92, metadata !25), !dbg !93
  store i32 0, i32* %i, align 4, !dbg !94
  br label %4, !dbg !94

; <label>:4                                       ; preds = %37, %0
  %5 = load i32* %i, align 4, !dbg !96
  %6 = load i32* %1, align 4, !dbg !100
  %7 = icmp slt i32 %5, %6, !dbg !101
  br i1 %7, label %8, label %40, !dbg !102

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4, !dbg !103
  %10 = sext i32 %9 to i64, !dbg !105
  %11 = load double** %3, align 8, !dbg !105
  %12 = getelementptr inbounds double* %11, i64 %10, !dbg !105
  store double 0.000000e+00, double* %12, align 8, !dbg !105
  store i32 0, i32* %j, align 4, !dbg !106
  br label %13, !dbg !106

; <label>:13                                      ; preds = %33, %8
  %14 = load i32* %j, align 4, !dbg !108
  %15 = load i32* %1, align 4, !dbg !112
  %16 = icmp slt i32 %14, %15, !dbg !113
  br i1 %16, label %17, label %36, !dbg !114

; <label>:17                                      ; preds = %13
  %18 = load i32* %j, align 4, !dbg !115
  %19 = load i32* %i, align 4, !dbg !117
  %20 = call double @eval_A(i32 %18, i32 %19), !dbg !118
  %21 = load i32* %j, align 4, !dbg !119
  %22 = sext i32 %21 to i64, !dbg !120
  %23 = load double** %2, align 8, !dbg !120
  %24 = getelementptr inbounds double* %23, i64 %22, !dbg !120
  %25 = load double* %24, align 8, !dbg !120
  %26 = fmul double %20, %25, !dbg !118
  %27 = load i32* %i, align 4, !dbg !121
  %28 = sext i32 %27 to i64, !dbg !122
  %29 = load double** %3, align 8, !dbg !122
  %30 = getelementptr inbounds double* %29, i64 %28, !dbg !122
  %31 = load double* %30, align 8, !dbg !122
  %32 = fadd double %31, %26, !dbg !122
  store double %32, double* %30, align 8, !dbg !122
  br label %33, !dbg !122

; <label>:33                                      ; preds = %17
  %34 = load i32* %j, align 4, !dbg !123
  %35 = add nsw i32 %34, 1, !dbg !123
  store i32 %35, i32* %j, align 4, !dbg !123
  br label %13, !dbg !125

; <label>:36                                      ; preds = %13
  br label %37, !dbg !126

; <label>:37                                      ; preds = %36
  %38 = load i32* %i, align 4, !dbg !127
  %39 = add nsw i32 %38, 1, !dbg !127
  store i32 %39, i32* %i, align 4, !dbg !127
  br label %4, !dbg !128

; <label>:40                                      ; preds = %4
  ret void, !dbg !129
}

; Function Attrs: nounwind uwtable
define void @eval_AtA_times_u(i32 %N, double* %u, double* %AtAu) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  %4 = alloca i8*
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !130, metadata !25), !dbg !131
  store double* %u, double** %2, align 8
  call void @llvm.dbg.declare(metadata double** %2, metadata !132, metadata !25), !dbg !133
  store double* %AtAu, double** %3, align 8
  call void @llvm.dbg.declare(metadata double** %3, metadata !134, metadata !25), !dbg !135
  %5 = load i32* %1, align 4, !dbg !136
  %6 = zext i32 %5 to i64, !dbg !137
  %7 = call i8* @llvm.stacksave(), !dbg !137
  store i8* %7, i8** %4, !dbg !137
  %8 = alloca double, i64 %6, align 16, !dbg !137
  call void @llvm.dbg.declare(metadata double* %8, metadata !138, metadata !25), !dbg !142
  %9 = load i32* %1, align 4, !dbg !143
  %10 = load double** %2, align 8, !dbg !144
  call void @eval_A_times_u(i32 %9, double* %10, double* %8), !dbg !145
  %11 = load i32* %1, align 4, !dbg !146
  %12 = load double** %3, align 8, !dbg !147
  call void @eval_At_times_u(i32 %11, double* %8, double* %12), !dbg !148
  %13 = load i8** %4, !dbg !149
  call void @llvm.stackrestore(i8* %13), !dbg !149
  ret void, !dbg !149
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %N = alloca i32, align 4
  %2 = alloca i8*
  %vBv = alloca double, align 8
  %vv = alloca double, align 8
  %3 = alloca i32
  store i32 %inputN, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !150, metadata !25), !dbg !151
  call void @llvm.dbg.declare(metadata i32* %i, metadata !152, metadata !25), !dbg !153
  call void @llvm.dbg.declare(metadata i32* %N, metadata !154, metadata !25), !dbg !156
  %4 = load i32* %1, align 4, !dbg !157
  %5 = icmp sgt i32 %4, 0, !dbg !157
  br i1 %5, label %6, label %8, !dbg !158

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4, !dbg !159
  br label %9, !dbg !158

; <label>:8                                       ; preds = %0
  br label %9, !dbg !161

; <label>:9                                       ; preds = %8, %6
  %10 = phi i32 [ %7, %6 ], [ 2000, %8 ], !dbg !158
  store i32 %10, i32* %N, align 4, !dbg !163
  %11 = load i32* %N, align 4, !dbg !166
  %12 = zext i32 %11 to i64, !dbg !167
  %13 = call i8* @llvm.stacksave(), !dbg !167
  store i8* %13, i8** %2, !dbg !167
  %14 = alloca double, i64 %12, align 16, !dbg !167
  call void @llvm.dbg.declare(metadata double* %14, metadata !168, metadata !25), !dbg !169
  %15 = load i32* %N, align 4, !dbg !170
  %16 = zext i32 %15 to i64, !dbg !167
  %17 = alloca double, i64 %16, align 16, !dbg !167
  call void @llvm.dbg.declare(metadata double* %17, metadata !171, metadata !25), !dbg !172
  call void @llvm.dbg.declare(metadata double* %vBv, metadata !173, metadata !25), !dbg !174
  call void @llvm.dbg.declare(metadata double* %vv, metadata !175, metadata !25), !dbg !176
  store i32 0, i32* %i, align 4, !dbg !177
  br label %18, !dbg !177

; <label>:18                                      ; preds = %26, %9
  %19 = load i32* %i, align 4, !dbg !179
  %20 = load i32* %N, align 4, !dbg !183
  %21 = icmp slt i32 %19, %20, !dbg !184
  br i1 %21, label %22, label %29, !dbg !185

; <label>:22                                      ; preds = %18
  %23 = load i32* %i, align 4, !dbg !186
  %24 = sext i32 %23 to i64, !dbg !188
  %25 = getelementptr inbounds double* %14, i64 %24, !dbg !188
  store double 1.000000e+00, double* %25, align 8, !dbg !188
  br label %26, !dbg !188

; <label>:26                                      ; preds = %22
  %27 = load i32* %i, align 4, !dbg !189
  %28 = add nsw i32 %27, 1, !dbg !189
  store i32 %28, i32* %i, align 4, !dbg !189
  br label %18, !dbg !191

; <label>:29                                      ; preds = %18
  store i32 0, i32* %i, align 4, !dbg !192
  br label %30, !dbg !192

; <label>:30                                      ; preds = %36, %29
  %31 = load i32* %i, align 4, !dbg !194
  %32 = icmp slt i32 %31, 10, !dbg !194
  br i1 %32, label %33, label %39, !dbg !198

; <label>:33                                      ; preds = %30
  %34 = load i32* %N, align 4, !dbg !199
  call void @eval_AtA_times_u(i32 %34, double* %14, double* %17), !dbg !201
  %35 = load i32* %N, align 4, !dbg !202
  call void @eval_AtA_times_u(i32 %35, double* %17, double* %14), !dbg !203
  br label %36, !dbg !204

; <label>:36                                      ; preds = %33
  %37 = load i32* %i, align 4, !dbg !205
  %38 = add nsw i32 %37, 1, !dbg !205
  store i32 %38, i32* %i, align 4, !dbg !205
  br label %30, !dbg !206

; <label>:39                                      ; preds = %30
  store double 0.000000e+00, double* %vv, align 8, !dbg !207
  store double 0.000000e+00, double* %vBv, align 8, !dbg !208
  store i32 0, i32* %i, align 4, !dbg !209
  br label %40, !dbg !209

; <label>:40                                      ; preds = %67, %39
  %41 = load i32* %i, align 4, !dbg !211
  %42 = load i32* %N, align 4, !dbg !215
  %43 = icmp slt i32 %41, %42, !dbg !216
  br i1 %43, label %44, label %70, !dbg !217

; <label>:44                                      ; preds = %40
  %45 = load i32* %i, align 4, !dbg !218
  %46 = sext i32 %45 to i64, !dbg !221
  %47 = getelementptr inbounds double* %14, i64 %46, !dbg !221
  %48 = load double* %47, align 8, !dbg !221
  %49 = load i32* %i, align 4, !dbg !222
  %50 = sext i32 %49 to i64, !dbg !223
  %51 = getelementptr inbounds double* %17, i64 %50, !dbg !223
  %52 = load double* %51, align 8, !dbg !223
  %53 = fmul double %48, %52, !dbg !221
  %54 = load double* %vBv, align 8, !dbg !224
  %55 = fadd double %54, %53, !dbg !224
  store double %55, double* %vBv, align 8, !dbg !224
  %56 = load i32* %i, align 4, !dbg !225
  %57 = sext i32 %56 to i64, !dbg !226
  %58 = getelementptr inbounds double* %17, i64 %57, !dbg !226
  %59 = load double* %58, align 8, !dbg !226
  %60 = load i32* %i, align 4, !dbg !227
  %61 = sext i32 %60 to i64, !dbg !228
  %62 = getelementptr inbounds double* %17, i64 %61, !dbg !228
  %63 = load double* %62, align 8, !dbg !228
  %64 = fmul double %59, %63, !dbg !226
  %65 = load double* %vv, align 8, !dbg !229
  %66 = fadd double %65, %64, !dbg !229
  store double %66, double* %vv, align 8, !dbg !229
  br label %67, !dbg !230

; <label>:67                                      ; preds = %44
  %68 = load i32* %i, align 4, !dbg !231
  %69 = add nsw i32 %68, 1, !dbg !231
  store i32 %69, i32* %i, align 4, !dbg !231
  br label %40, !dbg !233

; <label>:70                                      ; preds = %40
  %71 = load double* %vBv, align 8, !dbg !234
  %72 = load double* %vv, align 8, !dbg !235
  %73 = fdiv double %71, %72, !dbg !234
  %74 = call double @sqrt(double %73) #2, !dbg !236
  %75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), double %74), !dbg !237
  store i32 1, i32* %3
  %76 = load i8** %2, !dbg !238
  call void @llvm.stackrestore(i8* %76), !dbg !238
  ret i32 0, !dbg !239
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare double @sqrt(double) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22}
!llvm.ident = !{!23}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c] [DW_LANG_C99]
!1 = !{!"code.c", !"/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C"}
!2 = !{}
!3 = !{!4, !10, !16, !17, !18}
!4 = !{!"0x2e\00eval_A\00eval_A\00\0011\000\001\000\000\00256\000\0011", !1, !5, !6, null, double (i32, i32)* @eval_A, null, null, !2} ; [ DW_TAG_subprogram ] [line 11] [def] [eval_A]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !9, !9}
!8 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = !{!"0x2e\00eval_A_times_u\00eval_A_times_u\00\0013\000\001\000\000\00256\000\0014", !1, !5, !11, null, void (i32, double*, double*)* @eval_A_times_u, null, null, !2} ; [ DW_TAG_subprogram ] [line 13] [def] [scope 14] [eval_A_times_u]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !12, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{null, !9, !13, !15}
!13 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = !{!"0x26\00\000\000\000\000\000", null, null, !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!16 = !{!"0x2e\00eval_At_times_u\00eval_At_times_u\00\0023\000\001\000\000\00256\000\0024", !1, !5, !11, null, void (i32, double*, double*)* @eval_At_times_u, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 24] [eval_At_times_u]
!17 = !{!"0x2e\00eval_AtA_times_u\00eval_AtA_times_u\00\0033\000\001\000\000\00256\000\0034", !1, !5, !11, null, void (i32, double*, double*)* @eval_AtA_times_u, null, null, !2} ; [ DW_TAG_subprogram ] [line 33] [def] [scope 34] [eval_AtA_times_u]
!18 = !{!"0x2e\00bench\00bench\00\0036\000\001\000\000\00256\000\0037", !1, !5, !19, null, i32 (i32)* @bench, null, null, !2} ; [ DW_TAG_subprogram ] [line 36] [def] [scope 37] [bench]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{!9, !9}
!21 = !{i32 2, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 2}
!23 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!24 = !{!"0x101\00i\0016777227\000", !4, !5, !9}  ; [ DW_TAG_arg_variable ] [i] [line 11]
!25 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!26 = !MDLocation(line: 11, column: 19, scope: !4)
!27 = !{!"0x101\00j\0033554443\000", !4, !5, !9}  ; [ DW_TAG_arg_variable ] [j] [line 11]
!28 = !MDLocation(line: 11, column: 26, scope: !4)
!29 = !MDLocation(line: 11, column: 44, scope: !4)
!30 = !MDLocation(line: 11, column: 46, scope: !4)
!31 = !MDLocation(line: 11, column: 50, scope: !4)
!32 = !MDLocation(line: 11, column: 52, scope: !4)
!33 = !MDLocation(line: 11, column: 43, scope: !4)
!34 = !MDLocation(line: 11, column: 59, scope: !4)
!35 = !MDLocation(line: 11, column: 42, scope: !4)
!36 = !MDLocation(line: 11, column: 38, scope: !4)
!37 = !MDLocation(line: 11, column: 31, scope: !4)
!38 = !{!"0x101\00N\0016777229\000", !10, !5, !9} ; [ DW_TAG_arg_variable ] [N] [line 13]
!39 = !MDLocation(line: 13, column: 25, scope: !10)
!40 = !{!"0x101\00u\0033554445\000", !10, !5, !13} ; [ DW_TAG_arg_variable ] [u] [line 13]
!41 = !MDLocation(line: 13, column: 41, scope: !10)
!42 = !{!"0x101\00Au\0050331661\000", !10, !5, !15} ; [ DW_TAG_arg_variable ] [Au] [line 13]
!43 = !MDLocation(line: 13, column: 53, scope: !10)
!44 = !{!"0x100\00i\0015\000", !10, !5, !9}       ; [ DW_TAG_auto_variable ] [i] [line 15]
!45 = !MDLocation(line: 15, column: 7, scope: !10)
!46 = !{!"0x100\00j\0015\000", !10, !5, !9}       ; [ DW_TAG_auto_variable ] [j] [line 15]
!47 = !MDLocation(line: 15, column: 9, scope: !10)
!48 = !MDLocation(line: 16, column: 7, scope: !49)
!49 = !{!"0xb\0016\003\000", !1, !10}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!50 = !MDLocation(line: 16, column: 11, scope: !51)
!51 = !{!"0xb\002", !1, !52}                      ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!52 = !{!"0xb\001", !1, !53}                      ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!53 = !{!"0xb\0016\003\001", !1, !49}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!54 = !MDLocation(line: 16, column: 13, scope: !53)
!55 = !MDLocation(line: 16, column: 11, scope: !53)
!56 = !MDLocation(line: 16, column: 3, scope: !49)
!57 = !MDLocation(line: 18, column: 10, scope: !58)
!58 = !{!"0xb\0017\005\002", !1, !53}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!59 = !MDLocation(line: 18, column: 7, scope: !58)
!60 = !MDLocation(line: 19, column: 11, scope: !61)
!61 = !{!"0xb\0019\007\003", !1, !58}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!62 = !MDLocation(line: 19, column: 15, scope: !63)
!63 = !{!"0xb\004", !1, !64}                      ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!64 = !{!"0xb\001", !1, !65}                      ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!65 = !{!"0xb\0019\007\004", !1, !61}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!66 = !MDLocation(line: 19, column: 17, scope: !65)
!67 = !MDLocation(line: 19, column: 15, scope: !65)
!68 = !MDLocation(line: 19, column: 7, scope: !61)
!69 = !MDLocation(line: 19, column: 38, scope: !70)
!70 = !{!"0xb\002", !1, !65}                      ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!71 = !MDLocation(line: 19, column: 40, scope: !65)
!72 = !MDLocation(line: 19, column: 31, scope: !65)
!73 = !MDLocation(line: 19, column: 45, scope: !65)
!74 = !MDLocation(line: 19, column: 43, scope: !65)
!75 = !MDLocation(line: 19, column: 27, scope: !65)
!76 = !MDLocation(line: 19, column: 24, scope: !65)
!77 = !MDLocation(line: 19, column: 19, scope: !78)
!78 = !{!"0xb\003", !1, !65}                      ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!79 = !MDLocation(line: 19, column: 7, scope: !65)
!80 = !MDLocation(line: 20, column: 5, scope: !58)
!81 = !MDLocation(line: 16, column: 15, scope: !53)
!82 = !MDLocation(line: 16, column: 3, scope: !53)
!83 = !MDLocation(line: 21, column: 1, scope: !10)
!84 = !{!"0x101\00N\0016777239\000", !16, !5, !9} ; [ DW_TAG_arg_variable ] [N] [line 23]
!85 = !MDLocation(line: 23, column: 26, scope: !16)
!86 = !{!"0x101\00u\0033554455\000", !16, !5, !13} ; [ DW_TAG_arg_variable ] [u] [line 23]
!87 = !MDLocation(line: 23, column: 42, scope: !16)
!88 = !{!"0x101\00Au\0050331671\000", !16, !5, !15} ; [ DW_TAG_arg_variable ] [Au] [line 23]
!89 = !MDLocation(line: 23, column: 54, scope: !16)
!90 = !{!"0x100\00i\0025\000", !16, !5, !9}       ; [ DW_TAG_auto_variable ] [i] [line 25]
!91 = !MDLocation(line: 25, column: 7, scope: !16)
!92 = !{!"0x100\00j\0025\000", !16, !5, !9}       ; [ DW_TAG_auto_variable ] [j] [line 25]
!93 = !MDLocation(line: 25, column: 9, scope: !16)
!94 = !MDLocation(line: 26, column: 7, scope: !95)
!95 = !{!"0xb\0026\003\005", !1, !16}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!96 = !MDLocation(line: 26, column: 11, scope: !97)
!97 = !{!"0xb\002", !1, !98}                      ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!98 = !{!"0xb\001", !1, !99}                      ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!99 = !{!"0xb\0026\003\006", !1, !95}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!100 = !MDLocation(line: 26, column: 13, scope: !99)
!101 = !MDLocation(line: 26, column: 11, scope: !99)
!102 = !MDLocation(line: 26, column: 3, scope: !95)
!103 = !MDLocation(line: 28, column: 10, scope: !104)
!104 = !{!"0xb\0027\005\007", !1, !99}            ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!105 = !MDLocation(line: 28, column: 7, scope: !104)
!106 = !MDLocation(line: 29, column: 11, scope: !107)
!107 = !{!"0xb\0029\007\008", !1, !104}           ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!108 = !MDLocation(line: 29, column: 15, scope: !109)
!109 = !{!"0xb\004", !1, !110}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!110 = !{!"0xb\001", !1, !111}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!111 = !{!"0xb\0029\007\009", !1, !107}           ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!112 = !MDLocation(line: 29, column: 17, scope: !111)
!113 = !MDLocation(line: 29, column: 15, scope: !111)
!114 = !MDLocation(line: 29, column: 7, scope: !107)
!115 = !MDLocation(line: 29, column: 38, scope: !116)
!116 = !{!"0xb\002", !1, !111}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!117 = !MDLocation(line: 29, column: 40, scope: !111)
!118 = !MDLocation(line: 29, column: 31, scope: !111)
!119 = !MDLocation(line: 29, column: 45, scope: !111)
!120 = !MDLocation(line: 29, column: 43, scope: !111)
!121 = !MDLocation(line: 29, column: 27, scope: !111)
!122 = !MDLocation(line: 29, column: 24, scope: !111)
!123 = !MDLocation(line: 29, column: 19, scope: !124)
!124 = !{!"0xb\003", !1, !111}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!125 = !MDLocation(line: 29, column: 7, scope: !111)
!126 = !MDLocation(line: 30, column: 5, scope: !104)
!127 = !MDLocation(line: 26, column: 15, scope: !99)
!128 = !MDLocation(line: 26, column: 3, scope: !99)
!129 = !MDLocation(line: 31, column: 1, scope: !16)
!130 = !{!"0x101\00N\0016777249\000", !17, !5, !9} ; [ DW_TAG_arg_variable ] [N] [line 33]
!131 = !MDLocation(line: 33, column: 27, scope: !17)
!132 = !{!"0x101\00u\0033554465\000", !17, !5, !13} ; [ DW_TAG_arg_variable ] [u] [line 33]
!133 = !MDLocation(line: 33, column: 43, scope: !17)
!134 = !{!"0x101\00AtAu\0050331681\000", !17, !5, !15} ; [ DW_TAG_arg_variable ] [AtAu] [line 33]
!135 = !MDLocation(line: 33, column: 55, scope: !17)
!136 = !MDLocation(line: 34, column: 12, scope: !17)
!137 = !MDLocation(line: 34, column: 3, scope: !17)
!138 = !{!"0x100\00v\0034\008192", !17, !5, !139} ; [ DW_TAG_auto_variable ] [v] [line 34]
!139 = !{!"0x1\00\000\000\0064\000\000\000", null, null, !8, !140, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 64, offset 0] [from double]
!140 = !{!141}
!141 = !{!"0x21\000\00-1"}                        ; [ DW_TAG_subrange_type ] [unbounded]
!142 = !MDLocation(line: 34, column: 10, scope: !17)
!143 = !MDLocation(line: 34, column: 31, scope: !17)
!144 = !MDLocation(line: 34, column: 33, scope: !17)
!145 = !MDLocation(line: 34, column: 16, scope: !17)
!146 = !MDLocation(line: 34, column: 55, scope: !17)
!147 = !MDLocation(line: 34, column: 59, scope: !17)
!148 = !MDLocation(line: 34, column: 39, scope: !17)
!149 = !MDLocation(line: 34, column: 66, scope: !17)
!150 = !{!"0x101\00inputN\0016777252\000", !18, !5, !9} ; [ DW_TAG_arg_variable ] [inputN] [line 36]
!151 = !MDLocation(line: 36, column: 15, scope: !18)
!152 = !{!"0x100\00i\0038\000", !18, !5, !9}      ; [ DW_TAG_auto_variable ] [i] [line 38]
!153 = !MDLocation(line: 38, column: 7, scope: !18)
!154 = !{!"0x100\00N\0039\000", !18, !5, !155}    ; [ DW_TAG_auto_variable ] [N] [line 39]
!155 = !{!"0x26\00\000\000\000\000\000", null, null, !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!156 = !MDLocation(line: 39, column: 13, scope: !18)
!157 = !MDLocation(line: 39, column: 19, scope: !18)
!158 = !MDLocation(line: 39, column: 18, scope: !18)
!159 = !MDLocation(line: 39, column: 33, scope: !160)
!160 = !{!"0xb\001", !1, !18}                     ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!161 = !MDLocation(line: 39, column: 18, scope: !162)
!162 = !{!"0xb\002", !1, !18}                     ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!163 = !MDLocation(line: 39, column: 13, scope: !164)
!164 = !{!"0xb\004", !1, !165}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!165 = !{!"0xb\003", !1, !18}                     ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!166 = !MDLocation(line: 40, column: 12, scope: !18)
!167 = !MDLocation(line: 40, column: 3, scope: !18)
!168 = !{!"0x100\00u\0040\008192", !18, !5, !139} ; [ DW_TAG_auto_variable ] [u] [line 40]
!169 = !MDLocation(line: 40, column: 10, scope: !18)
!170 = !MDLocation(line: 40, column: 17, scope: !18)
!171 = !{!"0x100\00v\0040\008192", !18, !5, !139} ; [ DW_TAG_auto_variable ] [v] [line 40]
!172 = !MDLocation(line: 40, column: 15, scope: !18)
!173 = !{!"0x100\00vBv\0040\000", !18, !5, !8}    ; [ DW_TAG_auto_variable ] [vBv] [line 40]
!174 = !MDLocation(line: 40, column: 20, scope: !18)
!175 = !{!"0x100\00vv\0040\000", !18, !5, !8}     ; [ DW_TAG_auto_variable ] [vv] [line 40]
!176 = !MDLocation(line: 40, column: 24, scope: !18)
!177 = !MDLocation(line: 41, column: 7, scope: !178)
!178 = !{!"0xb\0041\003\0010", !1, !18}           ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!179 = !MDLocation(line: 41, column: 11, scope: !180)
!180 = !{!"0xb\004", !1, !181}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!181 = !{!"0xb\001", !1, !182}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!182 = !{!"0xb\0041\003\0011", !1, !178}          ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!183 = !MDLocation(line: 41, column: 13, scope: !182)
!184 = !MDLocation(line: 41, column: 11, scope: !182)
!185 = !MDLocation(line: 41, column: 3, scope: !178)
!186 = !MDLocation(line: 41, column: 22, scope: !187)
!187 = !{!"0xb\002", !1, !182}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!188 = !MDLocation(line: 41, column: 20, scope: !182)
!189 = !MDLocation(line: 41, column: 15, scope: !190)
!190 = !{!"0xb\003", !1, !182}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!191 = !MDLocation(line: 41, column: 3, scope: !182)
!192 = !MDLocation(line: 42, column: 7, scope: !193)
!193 = !{!"0xb\0042\003\0012", !1, !18}           ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!194 = !MDLocation(line: 42, column: 11, scope: !195)
!195 = !{!"0xb\002", !1, !196}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!196 = !{!"0xb\001", !1, !197}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!197 = !{!"0xb\0042\003\0013", !1, !193}          ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!198 = !MDLocation(line: 42, column: 3, scope: !193)
!199 = !MDLocation(line: 44, column: 24, scope: !200)
!200 = !{!"0xb\0043\005\0014", !1, !197}          ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!201 = !MDLocation(line: 44, column: 7, scope: !200)
!202 = !MDLocation(line: 45, column: 24, scope: !200)
!203 = !MDLocation(line: 45, column: 7, scope: !200)
!204 = !MDLocation(line: 46, column: 5, scope: !200)
!205 = !MDLocation(line: 42, column: 16, scope: !197)
!206 = !MDLocation(line: 42, column: 3, scope: !197)
!207 = !MDLocation(line: 47, column: 7, scope: !18)
!208 = !MDLocation(line: 47, column: 3, scope: !18)
!209 = !MDLocation(line: 48, column: 7, scope: !210)
!210 = !{!"0xb\0048\003\0015", !1, !18}           ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!211 = !MDLocation(line: 48, column: 11, scope: !212)
!212 = !{!"0xb\004", !1, !213}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!213 = !{!"0xb\001", !1, !214}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!214 = !{!"0xb\0048\003\0016", !1, !210}          ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!215 = !MDLocation(line: 48, column: 13, scope: !214)
!216 = !MDLocation(line: 48, column: 11, scope: !214)
!217 = !MDLocation(line: 48, column: 3, scope: !210)
!218 = !MDLocation(line: 48, column: 29, scope: !219)
!219 = !{!"0xb\002", !1, !220}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!220 = !{!"0xb\0048\0020\0017", !1, !214}         ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!221 = !MDLocation(line: 48, column: 27, scope: !220)
!222 = !MDLocation(line: 48, column: 34, scope: !220)
!223 = !MDLocation(line: 48, column: 32, scope: !220)
!224 = !MDLocation(line: 48, column: 22, scope: !220)
!225 = !MDLocation(line: 48, column: 44, scope: !220)
!226 = !MDLocation(line: 48, column: 42, scope: !220)
!227 = !MDLocation(line: 48, column: 49, scope: !220)
!228 = !MDLocation(line: 48, column: 47, scope: !220)
!229 = !MDLocation(line: 48, column: 38, scope: !220)
!230 = !MDLocation(line: 48, column: 53, scope: !220)
!231 = !MDLocation(line: 48, column: 15, scope: !232)
!232 = !{!"0xb\003", !1, !214}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!233 = !MDLocation(line: 48, column: 3, scope: !214)
!234 = !MDLocation(line: 49, column: 25, scope: !18)
!235 = !MDLocation(line: 49, column: 29, scope: !18)
!236 = !MDLocation(line: 49, column: 20, scope: !18)
!237 = !MDLocation(line: 49, column: 3, scope: !18)
!238 = !MDLocation(line: 50, column: 3, scope: !18)
!239 = !MDLocation(line: 51, column: 1, scope: !18)
