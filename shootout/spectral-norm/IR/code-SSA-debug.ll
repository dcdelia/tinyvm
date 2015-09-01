; ModuleID = 'code.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @eval_A(i32 %i, i32 %j) #0 {
  call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !24, metadata !25), !dbg !26
  call void @llvm.dbg.value(metadata i32 %j, i64 0, metadata !27, metadata !25), !dbg !28
  %1 = add nsw i32 %i, %j, !dbg !29
  %2 = add nsw i32 %i, %j, !dbg !30
  %3 = add nsw i32 %2, 1, !dbg !30
  %4 = mul nsw i32 %1, %3, !dbg !31
  %5 = sdiv i32 %4, 2, !dbg !31
  %6 = add nsw i32 %5, %i, !dbg !31
  %7 = add nsw i32 %6, 1, !dbg !31
  %8 = sitofp i32 %7 to double, !dbg !32
  %9 = fdiv double 1.000000e+00, %8, !dbg !33
  ret double %9, !dbg !34
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @eval_A_times_u(i32 %N, double* %u, double* %Au) #0 {
  call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !35, metadata !25), !dbg !36
  call void @llvm.dbg.value(metadata double* %u, i64 0, metadata !37, metadata !25), !dbg !38
  call void @llvm.dbg.value(metadata double* %Au, i64 0, metadata !39, metadata !25), !dbg !40
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !41, metadata !25), !dbg !42
  br label %1, !dbg !43

; <label>:1                                       ; preds = %21, %0
  %i.0 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %2 = icmp slt i32 %i.0, %N, !dbg !45
  br i1 %2, label %3, label %23, !dbg !47

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64, !dbg !48
  %5 = getelementptr inbounds double* %Au, i64 %4, !dbg !48
  store double 0.000000e+00, double* %5, align 8, !dbg !48
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !50, metadata !25), !dbg !51
  br label %6, !dbg !52

; <label>:6                                       ; preds = %18, %3
  %j.0 = phi i32 [ 0, %3 ], [ %19, %18 ]
  %7 = icmp slt i32 %j.0, %N, !dbg !54
  br i1 %7, label %8, label %20, !dbg !56

; <label>:8                                       ; preds = %6
  %9 = call double @eval_A(i32 %i.0, i32 %j.0), !dbg !57
  %10 = sext i32 %j.0 to i64, !dbg !58
  %11 = getelementptr inbounds double* %u, i64 %10, !dbg !58
  %12 = load double* %11, align 8, !dbg !58
  %13 = fmul double %9, %12, !dbg !57
  %14 = sext i32 %i.0 to i64, !dbg !59
  %15 = getelementptr inbounds double* %Au, i64 %14, !dbg !59
  %16 = load double* %15, align 8, !dbg !59
  %17 = fadd double %16, %13, !dbg !59
  store double %17, double* %15, align 8, !dbg !59
  br label %18, !dbg !59

; <label>:18                                      ; preds = %8
  %19 = add nsw i32 %j.0, 1, !dbg !60
  call void @llvm.dbg.value(metadata i32 %19, i64 0, metadata !50, metadata !25), !dbg !51
  br label %6, !dbg !62

; <label>:20                                      ; preds = %6
  br label %21, !dbg !63

; <label>:21                                      ; preds = %20
  %22 = add nsw i32 %i.0, 1, !dbg !64
  call void @llvm.dbg.value(metadata i32 %22, i64 0, metadata !41, metadata !25), !dbg !42
  br label %1, !dbg !65

; <label>:23                                      ; preds = %1
  ret void, !dbg !66
}

; Function Attrs: nounwind uwtable
define void @eval_At_times_u(i32 %N, double* %u, double* %Au) #0 {
  call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !67, metadata !25), !dbg !68
  call void @llvm.dbg.value(metadata double* %u, i64 0, metadata !69, metadata !25), !dbg !70
  call void @llvm.dbg.value(metadata double* %Au, i64 0, metadata !71, metadata !25), !dbg !72
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !73, metadata !25), !dbg !74
  br label %1, !dbg !75

; <label>:1                                       ; preds = %21, %0
  %i.0 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %2 = icmp slt i32 %i.0, %N, !dbg !77
  br i1 %2, label %3, label %23, !dbg !79

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64, !dbg !80
  %5 = getelementptr inbounds double* %Au, i64 %4, !dbg !80
  store double 0.000000e+00, double* %5, align 8, !dbg !80
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !82, metadata !25), !dbg !83
  br label %6, !dbg !84

; <label>:6                                       ; preds = %18, %3
  %j.0 = phi i32 [ 0, %3 ], [ %19, %18 ]
  %7 = icmp slt i32 %j.0, %N, !dbg !86
  br i1 %7, label %8, label %20, !dbg !88

; <label>:8                                       ; preds = %6
  %9 = call double @eval_A(i32 %j.0, i32 %i.0), !dbg !89
  %10 = sext i32 %j.0 to i64, !dbg !90
  %11 = getelementptr inbounds double* %u, i64 %10, !dbg !90
  %12 = load double* %11, align 8, !dbg !90
  %13 = fmul double %9, %12, !dbg !89
  %14 = sext i32 %i.0 to i64, !dbg !91
  %15 = getelementptr inbounds double* %Au, i64 %14, !dbg !91
  %16 = load double* %15, align 8, !dbg !91
  %17 = fadd double %16, %13, !dbg !91
  store double %17, double* %15, align 8, !dbg !91
  br label %18, !dbg !91

; <label>:18                                      ; preds = %8
  %19 = add nsw i32 %j.0, 1, !dbg !92
  call void @llvm.dbg.value(metadata i32 %19, i64 0, metadata !82, metadata !25), !dbg !83
  br label %6, !dbg !94

; <label>:20                                      ; preds = %6
  br label %21, !dbg !95

; <label>:21                                      ; preds = %20
  %22 = add nsw i32 %i.0, 1, !dbg !96
  call void @llvm.dbg.value(metadata i32 %22, i64 0, metadata !73, metadata !25), !dbg !74
  br label %1, !dbg !97

; <label>:23                                      ; preds = %1
  ret void, !dbg !98
}

; Function Attrs: nounwind uwtable
define void @eval_AtA_times_u(i32 %N, double* %u, double* %AtAu) #0 {
  call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !99, metadata !25), !dbg !100
  call void @llvm.dbg.value(metadata double* %u, i64 0, metadata !101, metadata !25), !dbg !102
  call void @llvm.dbg.value(metadata double* %AtAu, i64 0, metadata !103, metadata !25), !dbg !104
  %1 = zext i32 %N to i64, !dbg !105
  %2 = call i8* @llvm.stacksave(), !dbg !105
  %3 = alloca double, i64 %1, align 16, !dbg !105
  call void @llvm.dbg.declare(metadata double* %3, metadata !106, metadata !25), !dbg !110
  call void @eval_A_times_u(i32 %N, double* %u, double* %3), !dbg !111
  call void @eval_At_times_u(i32 %N, double* %3, double* %AtAu), !dbg !112
  call void @llvm.stackrestore(i8* %2), !dbg !113
  ret void, !dbg !113
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  call void @llvm.dbg.value(metadata i32 %inputN, i64 0, metadata !114, metadata !25), !dbg !115
  %1 = icmp sgt i32 %inputN, 0, !dbg !116
  br i1 %1, label %2, label %3, !dbg !117

; <label>:2                                       ; preds = %0
  br label %4, !dbg !117

; <label>:3                                       ; preds = %0
  br label %4, !dbg !118

; <label>:4                                       ; preds = %3, %2
  %5 = phi i32 [ %inputN, %2 ], [ 2000, %3 ], !dbg !117
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !120, metadata !25), !dbg !122
  %6 = zext i32 %5 to i64, !dbg !123
  %7 = call i8* @llvm.stacksave(), !dbg !123
  %8 = alloca double, i64 %6, align 16, !dbg !123
  call void @llvm.dbg.declare(metadata double* %8, metadata !124, metadata !25), !dbg !125
  %9 = zext i32 %5 to i64, !dbg !123
  %10 = alloca double, i64 %9, align 16, !dbg !123
  call void @llvm.dbg.declare(metadata double* %10, metadata !126, metadata !25), !dbg !127
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !128, metadata !25), !dbg !129
  br label %11, !dbg !130

; <label>:11                                      ; preds = %16, %4
  %i.0 = phi i32 [ 0, %4 ], [ %17, %16 ]
  %12 = icmp slt i32 %i.0, %5, !dbg !132
  br i1 %12, label %13, label %18, !dbg !134

; <label>:13                                      ; preds = %11
  %14 = sext i32 %i.0 to i64, !dbg !135
  %15 = getelementptr inbounds double* %8, i64 %14, !dbg !135
  store double 1.000000e+00, double* %15, align 8, !dbg !135
  br label %16, !dbg !135

; <label>:16                                      ; preds = %13
  %17 = add nsw i32 %i.0, 1, !dbg !136
  call void @llvm.dbg.value(metadata i32 %17, i64 0, metadata !128, metadata !25), !dbg !129
  br label %11, !dbg !138

; <label>:18                                      ; preds = %11
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !128, metadata !25), !dbg !129
  br label %19, !dbg !139

; <label>:19                                      ; preds = %22, %18
  %i.1 = phi i32 [ 0, %18 ], [ %23, %22 ]
  %20 = icmp slt i32 %i.1, 10, !dbg !141
  br i1 %20, label %21, label %24, !dbg !145

; <label>:21                                      ; preds = %19
  call void @eval_AtA_times_u(i32 %5, double* %8, double* %10), !dbg !146
  call void @eval_AtA_times_u(i32 %5, double* %10, double* %8), !dbg !148
  br label %22, !dbg !149

; <label>:22                                      ; preds = %21
  %23 = add nsw i32 %i.1, 1, !dbg !150
  call void @llvm.dbg.value(metadata i32 %23, i64 0, metadata !128, metadata !25), !dbg !129
  br label %19, !dbg !151

; <label>:24                                      ; preds = %19
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !152, metadata !25), !dbg !153
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !154, metadata !25), !dbg !155
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !128, metadata !25), !dbg !129
  br label %25, !dbg !156

; <label>:25                                      ; preds = %44, %24
  %vBv.0 = phi double [ 0.000000e+00, %24 ], [ %35, %44 ]
  %i.2 = phi i32 [ 0, %24 ], [ %45, %44 ]
  %vv.0 = phi double [ 0.000000e+00, %24 ], [ %43, %44 ]
  %26 = icmp slt i32 %i.2, %5, !dbg !158
  br i1 %26, label %27, label %46, !dbg !160

; <label>:27                                      ; preds = %25
  %28 = sext i32 %i.2 to i64, !dbg !161
  %29 = getelementptr inbounds double* %8, i64 %28, !dbg !161
  %30 = load double* %29, align 8, !dbg !161
  %31 = sext i32 %i.2 to i64, !dbg !163
  %32 = getelementptr inbounds double* %10, i64 %31, !dbg !163
  %33 = load double* %32, align 8, !dbg !163
  %34 = fmul double %30, %33, !dbg !161
  %35 = fadd double %vBv.0, %34, !dbg !164
  call void @llvm.dbg.value(metadata double %35, i64 0, metadata !154, metadata !25), !dbg !155
  %36 = sext i32 %i.2 to i64, !dbg !165
  %37 = getelementptr inbounds double* %10, i64 %36, !dbg !165
  %38 = load double* %37, align 8, !dbg !165
  %39 = sext i32 %i.2 to i64, !dbg !166
  %40 = getelementptr inbounds double* %10, i64 %39, !dbg !166
  %41 = load double* %40, align 8, !dbg !166
  %42 = fmul double %38, %41, !dbg !165
  %43 = fadd double %vv.0, %42, !dbg !167
  call void @llvm.dbg.value(metadata double %43, i64 0, metadata !152, metadata !25), !dbg !153
  br label %44, !dbg !168

; <label>:44                                      ; preds = %27
  %45 = add nsw i32 %i.2, 1, !dbg !169
  call void @llvm.dbg.value(metadata i32 %45, i64 0, metadata !128, metadata !25), !dbg !129
  br label %25, !dbg !171

; <label>:46                                      ; preds = %25
  %47 = fdiv double %vBv.0, %vv.0, !dbg !172
  %48 = call double @sqrt(double %47) #2, !dbg !173
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), double %48), !dbg !174
  call void @llvm.stackrestore(i8* %7), !dbg !175
  ret i32 0, !dbg !176
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

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
!30 = !MDLocation(line: 11, column: 50, scope: !4)
!31 = !MDLocation(line: 11, column: 43, scope: !4)
!32 = !MDLocation(line: 11, column: 42, scope: !4)
!33 = !MDLocation(line: 11, column: 38, scope: !4)
!34 = !MDLocation(line: 11, column: 31, scope: !4)
!35 = !{!"0x101\00N\0016777229\000", !10, !5, !9} ; [ DW_TAG_arg_variable ] [N] [line 13]
!36 = !MDLocation(line: 13, column: 25, scope: !10)
!37 = !{!"0x101\00u\0033554445\000", !10, !5, !13} ; [ DW_TAG_arg_variable ] [u] [line 13]
!38 = !MDLocation(line: 13, column: 41, scope: !10)
!39 = !{!"0x101\00Au\0050331661\000", !10, !5, !15} ; [ DW_TAG_arg_variable ] [Au] [line 13]
!40 = !MDLocation(line: 13, column: 53, scope: !10)
!41 = !{!"0x100\00i\0015\000", !10, !5, !9}       ; [ DW_TAG_auto_variable ] [i] [line 15]
!42 = !MDLocation(line: 15, column: 7, scope: !10)
!43 = !MDLocation(line: 16, column: 7, scope: !44)
!44 = !{!"0xb\0016\003\000", !1, !10}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!45 = !MDLocation(line: 16, column: 11, scope: !46)
!46 = !{!"0xb\0016\003\001", !1, !44}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!47 = !MDLocation(line: 16, column: 3, scope: !44)
!48 = !MDLocation(line: 18, column: 7, scope: !49)
!49 = !{!"0xb\0017\005\002", !1, !46}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!50 = !{!"0x100\00j\0015\000", !10, !5, !9}       ; [ DW_TAG_auto_variable ] [j] [line 15]
!51 = !MDLocation(line: 15, column: 9, scope: !10)
!52 = !MDLocation(line: 19, column: 11, scope: !53)
!53 = !{!"0xb\0019\007\003", !1, !49}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!54 = !MDLocation(line: 19, column: 15, scope: !55)
!55 = !{!"0xb\0019\007\004", !1, !53}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!56 = !MDLocation(line: 19, column: 7, scope: !53)
!57 = !MDLocation(line: 19, column: 31, scope: !55)
!58 = !MDLocation(line: 19, column: 43, scope: !55)
!59 = !MDLocation(line: 19, column: 24, scope: !55)
!60 = !MDLocation(line: 19, column: 19, scope: !61)
!61 = !{!"0xb\003", !1, !55}                      ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!62 = !MDLocation(line: 19, column: 7, scope: !55)
!63 = !MDLocation(line: 20, column: 5, scope: !49)
!64 = !MDLocation(line: 16, column: 15, scope: !46)
!65 = !MDLocation(line: 16, column: 3, scope: !46)
!66 = !MDLocation(line: 21, column: 1, scope: !10)
!67 = !{!"0x101\00N\0016777239\000", !16, !5, !9} ; [ DW_TAG_arg_variable ] [N] [line 23]
!68 = !MDLocation(line: 23, column: 26, scope: !16)
!69 = !{!"0x101\00u\0033554455\000", !16, !5, !13} ; [ DW_TAG_arg_variable ] [u] [line 23]
!70 = !MDLocation(line: 23, column: 42, scope: !16)
!71 = !{!"0x101\00Au\0050331671\000", !16, !5, !15} ; [ DW_TAG_arg_variable ] [Au] [line 23]
!72 = !MDLocation(line: 23, column: 54, scope: !16)
!73 = !{!"0x100\00i\0025\000", !16, !5, !9}       ; [ DW_TAG_auto_variable ] [i] [line 25]
!74 = !MDLocation(line: 25, column: 7, scope: !16)
!75 = !MDLocation(line: 26, column: 7, scope: !76)
!76 = !{!"0xb\0026\003\005", !1, !16}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!77 = !MDLocation(line: 26, column: 11, scope: !78)
!78 = !{!"0xb\0026\003\006", !1, !76}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!79 = !MDLocation(line: 26, column: 3, scope: !76)
!80 = !MDLocation(line: 28, column: 7, scope: !81)
!81 = !{!"0xb\0027\005\007", !1, !78}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!82 = !{!"0x100\00j\0025\000", !16, !5, !9}       ; [ DW_TAG_auto_variable ] [j] [line 25]
!83 = !MDLocation(line: 25, column: 9, scope: !16)
!84 = !MDLocation(line: 29, column: 11, scope: !85)
!85 = !{!"0xb\0029\007\008", !1, !81}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!86 = !MDLocation(line: 29, column: 15, scope: !87)
!87 = !{!"0xb\0029\007\009", !1, !85}             ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!88 = !MDLocation(line: 29, column: 7, scope: !85)
!89 = !MDLocation(line: 29, column: 31, scope: !87)
!90 = !MDLocation(line: 29, column: 43, scope: !87)
!91 = !MDLocation(line: 29, column: 24, scope: !87)
!92 = !MDLocation(line: 29, column: 19, scope: !93)
!93 = !{!"0xb\003", !1, !87}                      ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!94 = !MDLocation(line: 29, column: 7, scope: !87)
!95 = !MDLocation(line: 30, column: 5, scope: !81)
!96 = !MDLocation(line: 26, column: 15, scope: !78)
!97 = !MDLocation(line: 26, column: 3, scope: !78)
!98 = !MDLocation(line: 31, column: 1, scope: !16)
!99 = !{!"0x101\00N\0016777249\000", !17, !5, !9} ; [ DW_TAG_arg_variable ] [N] [line 33]
!100 = !MDLocation(line: 33, column: 27, scope: !17)
!101 = !{!"0x101\00u\0033554465\000", !17, !5, !13} ; [ DW_TAG_arg_variable ] [u] [line 33]
!102 = !MDLocation(line: 33, column: 43, scope: !17)
!103 = !{!"0x101\00AtAu\0050331681\000", !17, !5, !15} ; [ DW_TAG_arg_variable ] [AtAu] [line 33]
!104 = !MDLocation(line: 33, column: 55, scope: !17)
!105 = !MDLocation(line: 34, column: 3, scope: !17)
!106 = !{!"0x100\00v\0034\008192", !17, !5, !107} ; [ DW_TAG_auto_variable ] [v] [line 34]
!107 = !{!"0x1\00\000\000\0064\000\000\000", null, null, !8, !108, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 64, offset 0] [from double]
!108 = !{!109}
!109 = !{!"0x21\000\00-1"}                        ; [ DW_TAG_subrange_type ] [unbounded]
!110 = !MDLocation(line: 34, column: 10, scope: !17)
!111 = !MDLocation(line: 34, column: 16, scope: !17)
!112 = !MDLocation(line: 34, column: 39, scope: !17)
!113 = !MDLocation(line: 34, column: 66, scope: !17)
!114 = !{!"0x101\00inputN\0016777252\000", !18, !5, !9} ; [ DW_TAG_arg_variable ] [inputN] [line 36]
!115 = !MDLocation(line: 36, column: 15, scope: !18)
!116 = !MDLocation(line: 39, column: 19, scope: !18)
!117 = !MDLocation(line: 39, column: 18, scope: !18)
!118 = !MDLocation(line: 39, column: 18, scope: !119)
!119 = !{!"0xb\002", !1, !18}                     ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!120 = !{!"0x100\00N\0039\000", !18, !5, !121}    ; [ DW_TAG_auto_variable ] [N] [line 39]
!121 = !{!"0x26\00\000\000\000\000\000", null, null, !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!122 = !MDLocation(line: 39, column: 13, scope: !18)
!123 = !MDLocation(line: 40, column: 3, scope: !18)
!124 = !{!"0x100\00u\0040\008192", !18, !5, !107} ; [ DW_TAG_auto_variable ] [u] [line 40]
!125 = !MDLocation(line: 40, column: 10, scope: !18)
!126 = !{!"0x100\00v\0040\008192", !18, !5, !107} ; [ DW_TAG_auto_variable ] [v] [line 40]
!127 = !MDLocation(line: 40, column: 15, scope: !18)
!128 = !{!"0x100\00i\0038\000", !18, !5, !9}      ; [ DW_TAG_auto_variable ] [i] [line 38]
!129 = !MDLocation(line: 38, column: 7, scope: !18)
!130 = !MDLocation(line: 41, column: 7, scope: !131)
!131 = !{!"0xb\0041\003\0010", !1, !18}           ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!132 = !MDLocation(line: 41, column: 11, scope: !133)
!133 = !{!"0xb\0041\003\0011", !1, !131}          ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!134 = !MDLocation(line: 41, column: 3, scope: !131)
!135 = !MDLocation(line: 41, column: 20, scope: !133)
!136 = !MDLocation(line: 41, column: 15, scope: !137)
!137 = !{!"0xb\003", !1, !133}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!138 = !MDLocation(line: 41, column: 3, scope: !133)
!139 = !MDLocation(line: 42, column: 7, scope: !140)
!140 = !{!"0xb\0042\003\0012", !1, !18}           ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!141 = !MDLocation(line: 42, column: 11, scope: !142)
!142 = !{!"0xb\002", !1, !143}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!143 = !{!"0xb\001", !1, !144}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!144 = !{!"0xb\0042\003\0013", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!145 = !MDLocation(line: 42, column: 3, scope: !140)
!146 = !MDLocation(line: 44, column: 7, scope: !147)
!147 = !{!"0xb\0043\005\0014", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!148 = !MDLocation(line: 45, column: 7, scope: !147)
!149 = !MDLocation(line: 46, column: 5, scope: !147)
!150 = !MDLocation(line: 42, column: 16, scope: !144)
!151 = !MDLocation(line: 42, column: 3, scope: !144)
!152 = !{!"0x100\00vv\0040\000", !18, !5, !8}     ; [ DW_TAG_auto_variable ] [vv] [line 40]
!153 = !MDLocation(line: 40, column: 24, scope: !18)
!154 = !{!"0x100\00vBv\0040\000", !18, !5, !8}    ; [ DW_TAG_auto_variable ] [vBv] [line 40]
!155 = !MDLocation(line: 40, column: 20, scope: !18)
!156 = !MDLocation(line: 48, column: 7, scope: !157)
!157 = !{!"0xb\0048\003\0015", !1, !18}           ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!158 = !MDLocation(line: 48, column: 11, scope: !159)
!159 = !{!"0xb\0048\003\0016", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!160 = !MDLocation(line: 48, column: 3, scope: !157)
!161 = !MDLocation(line: 48, column: 27, scope: !162)
!162 = !{!"0xb\0048\0020\0017", !1, !159}         ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!163 = !MDLocation(line: 48, column: 32, scope: !162)
!164 = !MDLocation(line: 48, column: 22, scope: !162)
!165 = !MDLocation(line: 48, column: 42, scope: !162)
!166 = !MDLocation(line: 48, column: 47, scope: !162)
!167 = !MDLocation(line: 48, column: 38, scope: !162)
!168 = !MDLocation(line: 48, column: 53, scope: !162)
!169 = !MDLocation(line: 48, column: 15, scope: !170)
!170 = !{!"0xb\003", !1, !159}                    ; [ DW_TAG_lexical_block ] [/home/pctips/Dropbox/OSR/TinyVM/shootout/spectral-norm/C/code.c]
!171 = !MDLocation(line: 48, column: 3, scope: !159)
!172 = !MDLocation(line: 49, column: 25, scope: !18)
!173 = !MDLocation(line: 49, column: 20, scope: !18)
!174 = !MDLocation(line: 49, column: 3, scope: !18)
!175 = !MDLocation(line: 50, column: 3, scope: !18)
!176 = !MDLocation(line: 51, column: 1, scope: !18)
