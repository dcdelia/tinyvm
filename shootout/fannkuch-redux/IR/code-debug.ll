; ModuleID = 'code.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@t = common global [16 x i32] zeroinitializer, align 16
@s = common global [16 x i32] zeroinitializer, align 16
@max_n = common global i32 0, align 4
@odd = common global i32 0, align 4
@maxflips = common global i32 0, align 4
@checksum = common global i32 0, align 4
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [29 x i8] c"range: must be 3 <= n <= 12\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"%d\0APfannkuchen(%d) = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @flip() #0 {
  %i = alloca i32, align 4
  %x = alloca i32*, align 8
  %y = alloca i32*, align 8
  %c = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !31), !dbg !32
  call void @llvm.dbg.declare(metadata i32** %x, metadata !33, metadata !31), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %y, metadata !36, metadata !31), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %c, metadata !38, metadata !31), !dbg !39
  store i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), i32** %x, align 8, !dbg !40
  store i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i32 0), i32** %y, align 8, !dbg !42
  %1 = load i32* @max_n, align 4, !dbg !43
  store i32 %1, i32* %i, align 4, !dbg !44
  br label %2, !dbg !40

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %i, align 4, !dbg !45
  %4 = add nsw i32 %3, -1, !dbg !45
  store i32 %4, i32* %i, align 4, !dbg !45
  %5 = icmp ne i32 %3, 0, !dbg !49
  br i1 %5, label %6, label %12, !dbg !49

; <label>:6                                       ; preds = %2
  %7 = load i32** %y, align 8, !dbg !50
  %8 = getelementptr inbounds i32* %7, i32 1, !dbg !50
  store i32* %8, i32** %y, align 8, !dbg !50
  %9 = load i32* %7, align 4, !dbg !51
  %10 = load i32** %x, align 8, !dbg !52
  %11 = getelementptr inbounds i32* %10, i32 1, !dbg !52
  store i32* %11, i32** %x, align 8, !dbg !52
  store i32 %9, i32* %10, align 4, !dbg !53
  br label %2, !dbg !54

; <label>:12                                      ; preds = %2
  store i32 1, i32* %i, align 4, !dbg !55
  br label %13, !dbg !56

; <label>:13                                      ; preds = %34, %12
  store i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), i32** %x, align 8, !dbg !57
  %14 = load i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i64 0), align 4, !dbg !60
  %15 = sext i32 %14 to i64, !dbg !61
  %16 = getelementptr inbounds i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), i64 %15, !dbg !61
  store i32* %16, i32** %y, align 8, !dbg !62
  br label %17, !dbg !57

; <label>:17                                      ; preds = %21, %13
  %18 = load i32** %x, align 8, !dbg !63
  %19 = load i32** %y, align 8, !dbg !67
  %20 = icmp ult i32* %18, %19, !dbg !68
  br i1 %20, label %21, label %31, !dbg !69

; <label>:21                                      ; preds = %17
  %22 = load i32** %x, align 8, !dbg !70
  %23 = load i32* %22, align 4, !dbg !71
  store i32 %23, i32* %c, align 4, !dbg !72
  %24 = load i32** %y, align 8, !dbg !73
  %25 = load i32* %24, align 4, !dbg !74
  %26 = load i32** %x, align 8, !dbg !75
  %27 = getelementptr inbounds i32* %26, i32 1, !dbg !75
  store i32* %27, i32** %x, align 8, !dbg !75
  store i32 %25, i32* %26, align 4, !dbg !76
  %28 = load i32* %c, align 4, !dbg !77
  %29 = load i32** %y, align 8, !dbg !78
  %30 = getelementptr inbounds i32* %29, i32 -1, !dbg !78
  store i32* %30, i32** %y, align 8, !dbg !78
  store i32 %28, i32* %29, align 4, !dbg !79
  br label %17, !dbg !80

; <label>:31                                      ; preds = %17
  %32 = load i32* %i, align 4, !dbg !81
  %33 = add nsw i32 %32, 1, !dbg !81
  store i32 %33, i32* %i, align 4, !dbg !81
  br label %34, !dbg !82

; <label>:34                                      ; preds = %31
  %35 = load i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i64 0), align 4, !dbg !83
  %36 = sext i32 %35 to i64, !dbg !85
  %37 = getelementptr inbounds [16 x i32]* @t, i32 0, i64 %36, !dbg !85
  %38 = load i32* %37, align 4, !dbg !85
  %39 = icmp ne i32 %38, 0, !dbg !82
  br i1 %39, label %13, label %40, !dbg !82

; <label>:40                                      ; preds = %34
  %41 = load i32* %i, align 4, !dbg !86
  ret i32 %41, !dbg !87
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @rotate(i32 %n) #0 {
  %1 = alloca i32, align 4
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !88, metadata !31), !dbg !89
  call void @llvm.dbg.declare(metadata i32* %c, metadata !90, metadata !31), !dbg !91
  call void @llvm.dbg.declare(metadata i32* %i, metadata !92, metadata !31), !dbg !93
  %2 = load i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i64 0), align 4, !dbg !94
  store i32 %2, i32* %c, align 4, !dbg !95
  store i32 1, i32* %i, align 4, !dbg !96
  br label %3, !dbg !96

; <label>:3                                       ; preds = %16, %0
  %4 = load i32* %i, align 4, !dbg !98
  %5 = load i32* %1, align 4, !dbg !102
  %6 = icmp sle i32 %4, %5, !dbg !103
  br i1 %6, label %7, label %19, !dbg !104

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4, !dbg !105
  %9 = sext i32 %8 to i64, !dbg !107
  %10 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %9, !dbg !107
  %11 = load i32* %10, align 4, !dbg !107
  %12 = load i32* %i, align 4, !dbg !108
  %13 = sub nsw i32 %12, 1, !dbg !108
  %14 = sext i32 %13 to i64, !dbg !109
  %15 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %14, !dbg !109
  store i32 %11, i32* %15, align 4, !dbg !109
  br label %16, !dbg !109

; <label>:16                                      ; preds = %7
  %17 = load i32* %i, align 4, !dbg !110
  %18 = add nsw i32 %17, 1, !dbg !110
  store i32 %18, i32* %i, align 4, !dbg !110
  br label %3, !dbg !112

; <label>:19                                      ; preds = %3
  %20 = load i32* %c, align 4, !dbg !113
  %21 = load i32* %1, align 4, !dbg !114
  %22 = sext i32 %21 to i64, !dbg !115
  %23 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %22, !dbg !115
  store i32 %20, i32* %23, align 4, !dbg !115
  ret void, !dbg !116
}

; Function Attrs: nounwind uwtable
define void @tk(i32 %n) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %f = alloca i32, align 4
  %c = alloca [16 x i32], align 16
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !117, metadata !31), !dbg !118
  call void @llvm.dbg.declare(metadata i32* %i, metadata !119, metadata !31), !dbg !120
  store i32 0, i32* %i, align 4, !dbg !120
  call void @llvm.dbg.declare(metadata i32* %f, metadata !121, metadata !31), !dbg !122
  call void @llvm.dbg.declare(metadata [16 x i32]* %c, metadata !123, metadata !31), !dbg !124
  %2 = bitcast [16 x i32]* %c to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 64, i32 16, i1 false), !dbg !124
  br label %3, !dbg !125

; <label>:3                                       ; preds = %58, %15, %0
  %4 = load i32* %i, align 4, !dbg !126
  %5 = load i32* %1, align 4, !dbg !129
  %6 = icmp slt i32 %4, %5, !dbg !130
  br i1 %6, label %7, label %59, !dbg !125

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4, !dbg !131
  call void @rotate(i32 %8), !dbg !133
  %9 = load i32* %i, align 4, !dbg !134
  %10 = sext i32 %9 to i64, !dbg !136
  %11 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %10, !dbg !136
  %12 = load i32* %11, align 4, !dbg !136
  %13 = load i32* %i, align 4, !dbg !137
  %14 = icmp sge i32 %12, %13, !dbg !136
  br i1 %14, label %15, label %20, !dbg !138

; <label>:15                                      ; preds = %7
  %16 = load i32* %i, align 4, !dbg !139
  %17 = add nsw i32 %16, 1, !dbg !139
  store i32 %17, i32* %i, align 4, !dbg !139
  %18 = sext i32 %16 to i64, !dbg !141
  %19 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %18, !dbg !141
  store i32 0, i32* %19, align 4, !dbg !141
  br label %3, !dbg !142

; <label>:20                                      ; preds = %7
  %21 = load i32* %i, align 4, !dbg !143
  %22 = sext i32 %21 to i64, !dbg !144
  %23 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %22, !dbg !144
  %24 = load i32* %23, align 4, !dbg !144
  %25 = add nsw i32 %24, 1, !dbg !144
  store i32 %25, i32* %23, align 4, !dbg !144
  store i32 1, i32* %i, align 4, !dbg !145
  %26 = load i32* @odd, align 4, !dbg !146
  %27 = xor i32 %26, -1, !dbg !147
  store i32 %27, i32* @odd, align 4, !dbg !148
  %28 = load i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i32 0), align 4, !dbg !149
  %29 = icmp ne i32 %28, 0, !dbg !151
  br i1 %29, label %30, label %58, !dbg !151

; <label>:30                                      ; preds = %20
  %31 = load i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i64 0), align 4, !dbg !152
  %32 = sext i32 %31 to i64, !dbg !154
  %33 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %32, !dbg !154
  %34 = load i32* %33, align 4, !dbg !154
  %35 = icmp ne i32 %34, 0, !dbg !154
  br i1 %35, label %36, label %38, !dbg !154

; <label>:36                                      ; preds = %30
  %37 = call i32 @flip(), !dbg !155
  br label %39, !dbg !154

; <label>:38                                      ; preds = %30
  br label %39, !dbg !157

; <label>:39                                      ; preds = %38, %36
  %40 = phi i32 [ %37, %36 ], [ 1, %38 ], !dbg !154
  store i32 %40, i32* %f, align 4, !dbg !159
  %41 = load i32* %f, align 4, !dbg !162
  %42 = load i32* @maxflips, align 4, !dbg !164
  %43 = icmp sgt i32 %41, %42, !dbg !162
  br i1 %43, label %44, label %46, !dbg !165

; <label>:44                                      ; preds = %39
  %45 = load i32* %f, align 4, !dbg !166
  store i32 %45, i32* @maxflips, align 4, !dbg !168
  br label %46, !dbg !168

; <label>:46                                      ; preds = %44, %39
  %47 = load i32* @odd, align 4, !dbg !169
  %48 = icmp ne i32 %47, 0, !dbg !169
  br i1 %48, label %49, label %52, !dbg !169

; <label>:49                                      ; preds = %46
  %50 = load i32* %f, align 4, !dbg !170
  %51 = sub nsw i32 0, %50, !dbg !171
  br label %54, !dbg !169

; <label>:52                                      ; preds = %46
  %53 = load i32* %f, align 4, !dbg !172
  br label %54, !dbg !169

; <label>:54                                      ; preds = %52, %49
  %55 = phi i32 [ %51, %49 ], [ %53, %52 ], !dbg !169
  %56 = load i32* @checksum, align 4, !dbg !173
  %57 = add nsw i32 %56, %55, !dbg !173
  store i32 %57, i32* @checksum, align 4, !dbg !173
  br label %58, !dbg !174

; <label>:58                                      ; preds = %54, %20
  br label %3, !dbg !125

; <label>:59                                      ; preds = %3
  ret void, !dbg !175
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %inputN, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !176, metadata !31), !dbg !177
  call void @llvm.dbg.declare(metadata i32* %i, metadata !178, metadata !31), !dbg !179
  %2 = load i32* %1, align 4, !dbg !180
  store i32 %2, i32* @max_n, align 4, !dbg !181
  %3 = load i32* @max_n, align 4, !dbg !182
  %4 = icmp slt i32 %3, 3, !dbg !182
  br i1 %4, label %8, label %5, !dbg !184

; <label>:5                                       ; preds = %0
  %6 = load i32* @max_n, align 4, !dbg !185
  %7 = icmp sgt i32 %6, 15, !dbg !185
  br i1 %7, label %8, label %11, !dbg !184

; <label>:8                                       ; preds = %5, %0
  %9 = load %struct._IO_FILE** @stderr, align 8, !dbg !187
  %10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([29 x i8]* @.str, i32 0, i32 0)), !dbg !189
  call void @exit(i32 1) #5, !dbg !190
  unreachable, !dbg !190

; <label>:11                                      ; preds = %5
  store i32 0, i32* @maxflips, align 4, !dbg !191
  store i32 0, i32* @odd, align 4, !dbg !192
  store i32 0, i32* @checksum, align 4, !dbg !193
  call void @llvm.memset.p0i8.i64(i8* bitcast ([16 x i32]* @t to i8*), i8 0, i64 64, i32 16, i1 false), !dbg !194
  store i32 0, i32* %i, align 4, !dbg !195
  br label %12, !dbg !195

; <label>:12                                      ; preds = %21, %11
  %13 = load i32* %i, align 4, !dbg !197
  %14 = load i32* @max_n, align 4, !dbg !201
  %15 = icmp slt i32 %13, %14, !dbg !202
  br i1 %15, label %16, label %24, !dbg !203

; <label>:16                                      ; preds = %12
  %17 = load i32* %i, align 4, !dbg !204
  %18 = load i32* %i, align 4, !dbg !206
  %19 = sext i32 %18 to i64, !dbg !207
  %20 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %19, !dbg !207
  store i32 %17, i32* %20, align 4, !dbg !207
  br label %21, !dbg !207

; <label>:21                                      ; preds = %16
  %22 = load i32* %i, align 4, !dbg !208
  %23 = add nsw i32 %22, 1, !dbg !208
  store i32 %23, i32* %i, align 4, !dbg !208
  br label %12, !dbg !210

; <label>:24                                      ; preds = %12
  %25 = load i32* @max_n, align 4, !dbg !211
  call void @tk(i32 %25), !dbg !212
  %26 = load i32* @checksum, align 4, !dbg !213
  %27 = load i32* @max_n, align 4, !dbg !214
  %28 = load i32* @maxflips, align 4, !dbg !215
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %26, i32 %27, i32 %28), !dbg !216
  ret i32 0, !dbg !217
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!27, !28}
!llvm.ident = !{!29}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !2, !3, !16, !2} ; [ DW_TAG_compile_unit ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c] [DW_LANG_C99]
!1 = !{!"code.c", !"/media/llvm/OSR/shootout/fannkuch-redux/C"}
!2 = !{}
!3 = !{!4, !9, !12, !13}
!4 = !{!"0x2e\00flip\00flip\00\0021\000\001\000\000\000\000\0022", !1, !5, !6, null, i32 ()* @flip, null, null, !2} ; [ DW_TAG_subprogram ] [line 21] [def] [scope 22] [flip]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0x2e\00rotate\00rotate\00\0038\000\001\000\000\00256\000\0039", !1, !5, !10, null, void (i32)* @rotate, null, null, !2} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [rotate]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{null, !8}
!12 = !{!"0x2e\00tk\00tk\00\0048\000\001\000\000\00256\000\0049", !1, !5, !10, null, void (i32)* @tk, null, null, !2} ; [ DW_TAG_subprogram ] [line 48] [def] [scope 49] [tk]
!13 = !{!"0x2e\00bench\00bench\00\0071\000\001\000\000\00256\000\0072", !1, !5, !14, null, i32 (i32)* @bench, null, null, !2} ; [ DW_TAG_subprogram ] [line 71] [def] [scope 72] [bench]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{!8, !8}
!16 = !{!17, !22, !23, !24, !25, !26}
!17 = !{!"0x34\00s\00s\00\0018\000\001", null, !5, !18, [16 x i32]* @s, null} ; [ DW_TAG_variable ] [s] [line 18] [def]
!18 = !{!"0x1\00\000\00512\0032\000\000\000", null, null, !19, !20, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 32, offset 0] [from elem]
!19 = !{!"0x16\00elem\0016\000\000\000\000", !1, null, !8} ; [ DW_TAG_typedef ] [elem] [line 16, size 0, align 0, offset 0] [from int]
!20 = !{!21}
!21 = !{!"0x21\000\0016"}                         ; [ DW_TAG_subrange_type ] [0, 15]
!22 = !{!"0x34\00t\00t\00\0018\000\001", null, !5, !18, [16 x i32]* @t, null} ; [ DW_TAG_variable ] [t] [line 18] [def]
!23 = !{!"0x34\00maxflips\00maxflips\00\0019\000\001", null, !5, !8, i32* @maxflips, null} ; [ DW_TAG_variable ] [maxflips] [line 19] [def]
!24 = !{!"0x34\00max_n\00max_n\00\0019\000\001", null, !5, !8, i32* @max_n, null} ; [ DW_TAG_variable ] [max_n] [line 19] [def]
!25 = !{!"0x34\00odd\00odd\00\0019\000\001", null, !5, !8, i32* @odd, null} ; [ DW_TAG_variable ] [odd] [line 19] [def]
!26 = !{!"0x34\00checksum\00checksum\00\0019\000\001", null, !5, !8, i32* @checksum, null} ; [ DW_TAG_variable ] [checksum] [line 19] [def]
!27 = !{i32 2, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 2}
!29 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!30 = !{!"0x100\00i\0023\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 23]
!31 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!32 = !MDLocation(line: 23, column: 17, scope: !4)
!33 = !{!"0x100\00x\0024\000", !4, !5, !34}       ; [ DW_TAG_auto_variable ] [x] [line 24]
!34 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from elem]
!35 = !MDLocation(line: 24, column: 19, scope: !4)
!36 = !{!"0x100\00y\0024\000", !4, !5, !34}       ; [ DW_TAG_auto_variable ] [y] [line 24]
!37 = !MDLocation(line: 24, column: 23, scope: !4)
!38 = !{!"0x100\00c\0024\000", !4, !5, !19}       ; [ DW_TAG_auto_variable ] [c] [line 24]
!39 = !MDLocation(line: 24, column: 26, scope: !4)
!40 = !MDLocation(line: 26, column: 9, scope: !41)
!41 = !{!"0xb\0026\004\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!42 = !MDLocation(line: 26, column: 16, scope: !41)
!43 = !MDLocation(line: 26, column: 27, scope: !41)
!44 = !MDLocation(line: 26, column: 23, scope: !41)
!45 = !MDLocation(line: 26, column: 34, scope: !46)
!46 = !{!"0xb\002", !1, !47}                      ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!47 = !{!"0xb\001", !1, !48}                      ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!48 = !{!"0xb\0026\004\001", !1, !41}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!49 = !MDLocation(line: 26, column: 4, scope: !41)
!50 = !MDLocation(line: 27, column: 15, scope: !48)
!51 = !MDLocation(line: 27, column: 14, scope: !48)
!52 = !MDLocation(line: 27, column: 8, scope: !48)
!53 = !MDLocation(line: 27, column: 7, scope: !48)
!54 = !MDLocation(line: 26, column: 4, scope: !48)
!55 = !MDLocation(line: 28, column: 4, scope: !4)
!56 = !MDLocation(line: 29, column: 4, scope: !4)
!57 = !MDLocation(line: 30, column: 12, scope: !58)
!58 = !{!"0xb\0030\007\003", !1, !59}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!59 = !{!"0xb\0029\007\002", !1, !4}              ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!60 = !MDLocation(line: 30, column: 27, scope: !58)
!61 = !MDLocation(line: 30, column: 23, scope: !58)
!62 = !MDLocation(line: 30, column: 19, scope: !58)
!63 = !MDLocation(line: 30, column: 33, scope: !64)
!64 = !{!"0xb\002", !1, !65}                      ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!65 = !{!"0xb\001", !1, !66}                      ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!66 = !{!"0xb\0030\007\004", !1, !58}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!67 = !MDLocation(line: 30, column: 37, scope: !66)
!68 = !MDLocation(line: 30, column: 33, scope: !66)
!69 = !MDLocation(line: 30, column: 7, scope: !58)
!70 = !MDLocation(line: 31, column: 15, scope: !66)
!71 = !MDLocation(line: 31, column: 14, scope: !66)
!72 = !MDLocation(line: 31, column: 10, scope: !66)
!73 = !MDLocation(line: 31, column: 26, scope: !66)
!74 = !MDLocation(line: 31, column: 25, scope: !66)
!75 = !MDLocation(line: 31, column: 19, scope: !66)
!76 = !MDLocation(line: 31, column: 18, scope: !66)
!77 = !MDLocation(line: 31, column: 36, scope: !66)
!78 = !MDLocation(line: 31, column: 30, scope: !66)
!79 = !MDLocation(line: 31, column: 29, scope: !66)
!80 = !MDLocation(line: 30, column: 7, scope: !66)
!81 = !MDLocation(line: 32, column: 7, scope: !59)
!82 = !MDLocation(line: 33, column: 4, scope: !59)
!83 = !MDLocation(line: 33, column: 15, scope: !84)
!84 = !{!"0xb\001", !1, !4}                       ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!85 = !MDLocation(line: 33, column: 13, scope: !4)
!86 = !MDLocation(line: 34, column: 11, scope: !4)
!87 = !MDLocation(line: 34, column: 4, scope: !4)
!88 = !{!"0x101\00n\0016777254\000", !9, !5, !8}  ; [ DW_TAG_arg_variable ] [n] [line 38]
!89 = !MDLocation(line: 38, column: 17, scope: !9)
!90 = !{!"0x100\00c\0040\000", !9, !5, !19}       ; [ DW_TAG_auto_variable ] [c] [line 40]
!91 = !MDLocation(line: 40, column: 9, scope: !9)
!92 = !{!"0x100\00i\0041\000", !9, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 41]
!93 = !MDLocation(line: 41, column: 17, scope: !9)
!94 = !MDLocation(line: 42, column: 8, scope: !9)
!95 = !MDLocation(line: 42, column: 4, scope: !9)
!96 = !MDLocation(line: 43, column: 9, scope: !97)
!97 = !{!"0xb\0043\004\005", !1, !9}              ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!98 = !MDLocation(line: 43, column: 16, scope: !99)
!99 = !{!"0xb\004", !1, !100}                     ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!100 = !{!"0xb\001", !1, !101}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!101 = !{!"0xb\0043\004\006", !1, !97}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!102 = !MDLocation(line: 43, column: 21, scope: !101)
!103 = !MDLocation(line: 43, column: 16, scope: !101)
!104 = !MDLocation(line: 43, column: 4, scope: !97)
!105 = !MDLocation(line: 43, column: 40, scope: !106)
!106 = !{!"0xb\002", !1, !101}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!107 = !MDLocation(line: 43, column: 38, scope: !101)
!108 = !MDLocation(line: 43, column: 31, scope: !101)
!109 = !MDLocation(line: 43, column: 29, scope: !101)
!110 = !MDLocation(line: 43, column: 24, scope: !111)
!111 = !{!"0xb\003", !1, !101}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!112 = !MDLocation(line: 43, column: 4, scope: !101)
!113 = !MDLocation(line: 44, column: 11, scope: !9)
!114 = !MDLocation(line: 44, column: 6, scope: !9)
!115 = !MDLocation(line: 44, column: 4, scope: !9)
!116 = !MDLocation(line: 45, column: 1, scope: !9)
!117 = !{!"0x101\00n\0016777264\000", !12, !5, !8} ; [ DW_TAG_arg_variable ] [n] [line 48]
!118 = !MDLocation(line: 48, column: 13, scope: !12)
!119 = !{!"0x100\00i\0050\000", !12, !5, !8}      ; [ DW_TAG_auto_variable ] [i] [line 50]
!120 = !MDLocation(line: 50, column: 8, scope: !12)
!121 = !{!"0x100\00f\0050\000", !12, !5, !8}      ; [ DW_TAG_auto_variable ] [f] [line 50]
!122 = !MDLocation(line: 50, column: 15, scope: !12)
!123 = !{!"0x100\00c\0051\000", !12, !5, !18}     ; [ DW_TAG_auto_variable ] [c] [line 51]
!124 = !MDLocation(line: 51, column: 9, scope: !12)
!125 = !MDLocation(line: 53, column: 4, scope: !12)
!126 = !MDLocation(line: 53, column: 11, scope: !127)
!127 = !{!"0xb\002", !1, !128}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!128 = !{!"0xb\001", !1, !12}                     ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!129 = !MDLocation(line: 53, column: 15, scope: !12)
!130 = !MDLocation(line: 53, column: 11, scope: !12)
!131 = !MDLocation(line: 54, column: 14, scope: !132)
!132 = !{!"0xb\0053\0018\007", !1, !12}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!133 = !MDLocation(line: 54, column: 7, scope: !132)
!134 = !MDLocation(line: 55, column: 13, scope: !135)
!135 = !{!"0xb\0055\0011\008", !1, !132}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!136 = !MDLocation(line: 55, column: 11, scope: !135)
!137 = !MDLocation(line: 55, column: 19, scope: !135)
!138 = !MDLocation(line: 55, column: 11, scope: !132)
!139 = !MDLocation(line: 56, column: 12, scope: !140)
!140 = !{!"0xb\0055\0022\009", !1, !135}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!141 = !MDLocation(line: 56, column: 10, scope: !140)
!142 = !MDLocation(line: 57, column: 10, scope: !140)
!143 = !MDLocation(line: 60, column: 9, scope: !132)
!144 = !MDLocation(line: 60, column: 7, scope: !132)
!145 = !MDLocation(line: 61, column: 7, scope: !132)
!146 = !MDLocation(line: 62, column: 14, scope: !132)
!147 = !MDLocation(line: 62, column: 13, scope: !132)
!148 = !MDLocation(line: 62, column: 7, scope: !132)
!149 = !MDLocation(line: 63, column: 11, scope: !150)
!150 = !{!"0xb\0063\0011\0010", !1, !132}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!151 = !MDLocation(line: 63, column: 11, scope: !132)
!152 = !MDLocation(line: 64, column: 16, scope: !153)
!153 = !{!"0xb\0063\0015\0011", !1, !150}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!154 = !MDLocation(line: 64, column: 14, scope: !153)
!155 = !MDLocation(line: 64, column: 24, scope: !156)
!156 = !{!"0xb\001", !1, !153}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!157 = !MDLocation(line: 64, column: 14, scope: !158)
!158 = !{!"0xb\002", !1, !153}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!159 = !MDLocation(line: 64, column: 10, scope: !160)
!160 = !{!"0xb\004", !1, !161}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!161 = !{!"0xb\003", !1, !153}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!162 = !MDLocation(line: 65, column: 14, scope: !163)
!163 = !{!"0xb\0065\0014\0012", !1, !153}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!164 = !MDLocation(line: 65, column: 18, scope: !163)
!165 = !MDLocation(line: 65, column: 14, scope: !153)
!166 = !MDLocation(line: 65, column: 39, scope: !167)
!167 = !{!"0xb\001", !1, !163}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!168 = !MDLocation(line: 65, column: 28, scope: !163)
!169 = !MDLocation(line: 66, column: 22, scope: !153)
!170 = !MDLocation(line: 66, column: 29, scope: !156)
!171 = !MDLocation(line: 66, column: 28, scope: !153)
!172 = !MDLocation(line: 66, column: 33, scope: !158)
!173 = !MDLocation(line: 66, column: 10, scope: !160)
!174 = !MDLocation(line: 67, column: 7, scope: !153)
!175 = !MDLocation(line: 69, column: 1, scope: !12)
!176 = !{!"0x101\00inputN\0016777287\000", !13, !5, !8} ; [ DW_TAG_arg_variable ] [inputN] [line 71]
!177 = !MDLocation(line: 71, column: 15, scope: !13)
!178 = !{!"0x100\00i\0073\000", !13, !5, !8}      ; [ DW_TAG_auto_variable ] [i] [line 73]
!179 = !MDLocation(line: 73, column: 8, scope: !13)
!180 = !MDLocation(line: 75, column: 12, scope: !13)
!181 = !MDLocation(line: 75, column: 4, scope: !13)
!182 = !MDLocation(line: 76, column: 8, scope: !183)
!183 = !{!"0xb\0076\008\0013", !1, !13}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!184 = !MDLocation(line: 76, column: 8, scope: !13)
!185 = !MDLocation(line: 76, column: 21, scope: !186)
!186 = !{!"0xb\001", !1, !183}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!187 = !MDLocation(line: 77, column: 15, scope: !188)
!188 = !{!"0xb\0076\0033\0014", !1, !183}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!189 = !MDLocation(line: 77, column: 7, scope: !188)
!190 = !MDLocation(line: 78, column: 7, scope: !188)
!191 = !MDLocation(line: 82, column: 4, scope: !13)
!192 = !MDLocation(line: 83, column: 4, scope: !13)
!193 = !MDLocation(line: 84, column: 4, scope: !13)
!194 = !MDLocation(line: 85, column: 4, scope: !13)
!195 = !MDLocation(line: 87, column: 9, scope: !196)
!196 = !{!"0xb\0087\004\0015", !1, !13}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!197 = !MDLocation(line: 87, column: 16, scope: !198)
!198 = !{!"0xb\004", !1, !199}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!199 = !{!"0xb\001", !1, !200}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!200 = !{!"0xb\0087\004\0016", !1, !196}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!201 = !MDLocation(line: 87, column: 20, scope: !200)
!202 = !MDLocation(line: 87, column: 16, scope: !200)
!203 = !MDLocation(line: 87, column: 4, scope: !196)
!204 = !MDLocation(line: 87, column: 39, scope: !205)
!205 = !{!"0xb\002", !1, !200}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!206 = !MDLocation(line: 87, column: 34, scope: !200)
!207 = !MDLocation(line: 87, column: 32, scope: !200)
!208 = !MDLocation(line: 87, column: 27, scope: !209)
!209 = !{!"0xb\003", !1, !200}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!210 = !MDLocation(line: 87, column: 4, scope: !200)
!211 = !MDLocation(line: 88, column: 7, scope: !13)
!212 = !MDLocation(line: 88, column: 4, scope: !13)
!213 = !MDLocation(line: 90, column: 41, scope: !13)
!214 = !MDLocation(line: 90, column: 51, scope: !13)
!215 = !MDLocation(line: 90, column: 58, scope: !13)
!216 = !MDLocation(line: 90, column: 4, scope: !13)
!217 = !MDLocation(line: 92, column: 4, scope: !13)
