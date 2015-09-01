; ModuleID = 'code.ll'
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
  call void @llvm.dbg.value(metadata i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), i64 0, metadata !30, metadata !32), !dbg !33
  call void @llvm.dbg.value(metadata i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i32 0), i64 0, metadata !34, metadata !32), !dbg !35
  %1 = load i32* @max_n, align 4, !dbg !36
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !38, metadata !32), !dbg !39
  br label %2, !dbg !40

; <label>:2                                       ; preds = %5, %0
  %y.0 = phi i32* [ getelementptr inbounds ([16 x i32]* @s, i32 0, i32 0), %0 ], [ %6, %5 ]
  %x.0 = phi i32* [ getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), %0 ], [ %8, %5 ]
  %i.0 = phi i32 [ %1, %0 ], [ %3, %5 ]
  %3 = add nsw i32 %i.0, -1, !dbg !41
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !38, metadata !32), !dbg !39
  %4 = icmp ne i32 %i.0, 0, !dbg !45
  br i1 %4, label %5, label %9, !dbg !45

; <label>:5                                       ; preds = %2
  %6 = getelementptr inbounds i32* %y.0, i32 1, !dbg !46
  call void @llvm.dbg.value(metadata i32* %6, i64 0, metadata !34, metadata !32), !dbg !35
  %7 = load i32* %y.0, align 4, !dbg !47
  %8 = getelementptr inbounds i32* %x.0, i32 1, !dbg !48
  call void @llvm.dbg.value(metadata i32* %8, i64 0, metadata !30, metadata !32), !dbg !33
  store i32 %7, i32* %x.0, align 4, !dbg !49
  br label %2, !dbg !50

; <label>:9                                       ; preds = %2
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !38, metadata !32), !dbg !39
  br label %10, !dbg !51

; <label>:10                                      ; preds = %23, %9
  %i.1 = phi i32 [ 1, %9 ], [ %22, %23 ]
  call void @llvm.dbg.value(metadata i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), i64 0, metadata !30, metadata !32), !dbg !33
  %11 = load i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i64 0), align 4, !dbg !52
  %12 = sext i32 %11 to i64, !dbg !55
  %13 = getelementptr inbounds i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), i64 %12, !dbg !55
  call void @llvm.dbg.value(metadata i32* %13, i64 0, metadata !34, metadata !32), !dbg !35
  br label %14, !dbg !56

; <label>:14                                      ; preds = %16, %10
  %y.1 = phi i32* [ %13, %10 ], [ %20, %16 ]
  %x.1 = phi i32* [ getelementptr inbounds ([16 x i32]* @t, i32 0, i32 0), %10 ], [ %19, %16 ]
  %15 = icmp ult i32* %x.1, %y.1, !dbg !57
  br i1 %15, label %16, label %21, !dbg !59

; <label>:16                                      ; preds = %14
  %17 = load i32* %x.1, align 4, !dbg !60
  call void @llvm.dbg.value(metadata i32 %17, i64 0, metadata !61, metadata !32), !dbg !62
  %18 = load i32* %y.1, align 4, !dbg !63
  %19 = getelementptr inbounds i32* %x.1, i32 1, !dbg !64
  call void @llvm.dbg.value(metadata i32* %19, i64 0, metadata !30, metadata !32), !dbg !33
  store i32 %18, i32* %x.1, align 4, !dbg !65
  %20 = getelementptr inbounds i32* %y.1, i32 -1, !dbg !66
  call void @llvm.dbg.value(metadata i32* %20, i64 0, metadata !34, metadata !32), !dbg !35
  store i32 %17, i32* %y.1, align 4, !dbg !67
  br label %14, !dbg !68

; <label>:21                                      ; preds = %14
  %22 = add nsw i32 %i.1, 1, !dbg !69
  call void @llvm.dbg.value(metadata i32 %22, i64 0, metadata !38, metadata !32), !dbg !39
  br label %23, !dbg !70

; <label>:23                                      ; preds = %21
  %24 = load i32* getelementptr inbounds ([16 x i32]* @t, i32 0, i64 0), align 4, !dbg !71
  %25 = sext i32 %24 to i64, !dbg !73
  %26 = getelementptr inbounds [16 x i32]* @t, i32 0, i64 %25, !dbg !73
  %27 = load i32* %26, align 4, !dbg !73
  %28 = icmp ne i32 %27, 0, !dbg !70
  br i1 %28, label %10, label %29, !dbg !70

; <label>:29                                      ; preds = %23
  ret i32 %22, !dbg !74
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @rotate(i32 %n) #0 {
  call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !75, metadata !32), !dbg !76
  %1 = load i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i64 0), align 4, !dbg !77
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !78, metadata !32), !dbg !79
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !80, metadata !32), !dbg !81
  br label %2, !dbg !82

; <label>:2                                       ; preds = %11, %0
  %i.0 = phi i32 [ 1, %0 ], [ %12, %11 ]
  %3 = icmp sle i32 %i.0, %n, !dbg !84
  br i1 %3, label %4, label %13, !dbg !86

; <label>:4                                       ; preds = %2
  %5 = sext i32 %i.0 to i64, !dbg !87
  %6 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %5, !dbg !87
  %7 = load i32* %6, align 4, !dbg !87
  %8 = sub nsw i32 %i.0, 1, !dbg !88
  %9 = sext i32 %8 to i64, !dbg !89
  %10 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %9, !dbg !89
  store i32 %7, i32* %10, align 4, !dbg !89
  br label %11, !dbg !89

; <label>:11                                      ; preds = %4
  %12 = add nsw i32 %i.0, 1, !dbg !90
  call void @llvm.dbg.value(metadata i32 %12, i64 0, metadata !80, metadata !32), !dbg !81
  br label %2, !dbg !92

; <label>:13                                      ; preds = %2
  %14 = sext i32 %n to i64, !dbg !93
  %15 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %14, !dbg !93
  store i32 %1, i32* %15, align 4, !dbg !93
  ret void, !dbg !94
}

; Function Attrs: nounwind uwtable
define void @tk(i32 %n) #0 {
  %c = alloca [16 x i32], align 16
  call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !95, metadata !32), !dbg !96
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !97, metadata !32), !dbg !98
  call void @llvm.dbg.declare(metadata [16 x i32]* %c, metadata !99, metadata !32), !dbg !100
  %1 = bitcast [16 x i32]* %c to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 64, i32 16, i1 false), !dbg !100
  br label %2, !dbg !101

; <label>:2                                       ; preds = %46, %9, %0
  %i.0 = phi i32 [ 0, %0 ], [ %10, %9 ], [ 1, %46 ]
  %3 = icmp slt i32 %i.0, %n, !dbg !102
  br i1 %3, label %4, label %47, !dbg !101

; <label>:4                                       ; preds = %2
  call void @rotate(i32 %i.0), !dbg !103
  %5 = sext i32 %i.0 to i64, !dbg !105
  %6 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %5, !dbg !105
  %7 = load i32* %6, align 4, !dbg !105
  %8 = icmp sge i32 %7, %i.0, !dbg !105
  br i1 %8, label %9, label %13, !dbg !107

; <label>:9                                       ; preds = %4
  %10 = add nsw i32 %i.0, 1, !dbg !108
  call void @llvm.dbg.value(metadata i32 %10, i64 0, metadata !97, metadata !32), !dbg !98
  %11 = sext i32 %i.0 to i64, !dbg !110
  %12 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %11, !dbg !110
  store i32 0, i32* %12, align 4, !dbg !110
  br label %2, !dbg !111

; <label>:13                                      ; preds = %4
  %14 = sext i32 %i.0 to i64, !dbg !112
  %15 = getelementptr inbounds [16 x i32]* %c, i32 0, i64 %14, !dbg !112
  %16 = load i32* %15, align 4, !dbg !112
  %17 = add nsw i32 %16, 1, !dbg !112
  store i32 %17, i32* %15, align 4, !dbg !112
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !97, metadata !32), !dbg !98
  %18 = load i32* @odd, align 4, !dbg !113
  %19 = xor i32 %18, -1, !dbg !114
  store i32 %19, i32* @odd, align 4, !dbg !115
  %20 = load i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i32 0), align 4, !dbg !116
  %21 = icmp ne i32 %20, 0, !dbg !118
  br i1 %21, label %22, label %46, !dbg !118

; <label>:22                                      ; preds = %13
  %23 = load i32* getelementptr inbounds ([16 x i32]* @s, i32 0, i64 0), align 4, !dbg !119
  %24 = sext i32 %23 to i64, !dbg !121
  %25 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %24, !dbg !121
  %26 = load i32* %25, align 4, !dbg !121
  %27 = icmp ne i32 %26, 0, !dbg !121
  br i1 %27, label %28, label %30, !dbg !121

; <label>:28                                      ; preds = %22
  %29 = call i32 @flip(), !dbg !122
  br label %31, !dbg !121

; <label>:30                                      ; preds = %22
  br label %31, !dbg !124

; <label>:31                                      ; preds = %30, %28
  %32 = phi i32 [ %29, %28 ], [ 1, %30 ], !dbg !121
  call void @llvm.dbg.value(metadata i32 %32, i64 0, metadata !126, metadata !32), !dbg !127
  %33 = load i32* @maxflips, align 4, !dbg !128
  %34 = icmp sgt i32 %32, %33, !dbg !130
  br i1 %34, label %35, label %36, !dbg !131

; <label>:35                                      ; preds = %31
  store i32 %32, i32* @maxflips, align 4, !dbg !132
  br label %36, !dbg !132

; <label>:36                                      ; preds = %35, %31
  %37 = load i32* @odd, align 4, !dbg !133
  %38 = icmp ne i32 %37, 0, !dbg !133
  br i1 %38, label %39, label %41, !dbg !133

; <label>:39                                      ; preds = %36
  %40 = sub nsw i32 0, %32, !dbg !134
  br label %42, !dbg !133

; <label>:41                                      ; preds = %36
  br label %42, !dbg !133

; <label>:42                                      ; preds = %41, %39
  %43 = phi i32 [ %40, %39 ], [ %32, %41 ], !dbg !133
  %44 = load i32* @checksum, align 4, !dbg !135
  %45 = add nsw i32 %44, %43, !dbg !135
  store i32 %45, i32* @checksum, align 4, !dbg !135
  br label %46, !dbg !138

; <label>:46                                      ; preds = %42, %13
  br label %2, !dbg !101

; <label>:47                                      ; preds = %2
  ret void, !dbg !139
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  call void @llvm.dbg.value(metadata i32 %inputN, i64 0, metadata !140, metadata !32), !dbg !141
  store i32 %inputN, i32* @max_n, align 4, !dbg !142
  %1 = load i32* @max_n, align 4, !dbg !143
  %2 = icmp slt i32 %1, 3, !dbg !143
  br i1 %2, label %6, label %3, !dbg !145

; <label>:3                                       ; preds = %0
  %4 = load i32* @max_n, align 4, !dbg !146
  %5 = icmp sgt i32 %4, 15, !dbg !146
  br i1 %5, label %6, label %9, !dbg !145

; <label>:6                                       ; preds = %3, %0
  %7 = load %struct._IO_FILE** @stderr, align 8, !dbg !148
  %8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([29 x i8]* @.str, i32 0, i32 0)), !dbg !150
  call void @exit(i32 1) #5, !dbg !151
  unreachable, !dbg !151

; <label>:9                                       ; preds = %3
  store i32 0, i32* @maxflips, align 4, !dbg !152
  store i32 0, i32* @odd, align 4, !dbg !153
  store i32 0, i32* @checksum, align 4, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* bitcast ([16 x i32]* @t to i8*), i8 0, i64 64, i32 16, i1 false), !dbg !155
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !156, metadata !32), !dbg !157
  br label %10, !dbg !158

; <label>:10                                      ; preds = %16, %9
  %i.0 = phi i32 [ 0, %9 ], [ %17, %16 ]
  %11 = load i32* @max_n, align 4, !dbg !160
  %12 = icmp slt i32 %i.0, %11, !dbg !162
  br i1 %12, label %13, label %18, !dbg !163

; <label>:13                                      ; preds = %10
  %14 = sext i32 %i.0 to i64, !dbg !164
  %15 = getelementptr inbounds [16 x i32]* @s, i32 0, i64 %14, !dbg !164
  store i32 %i.0, i32* %15, align 4, !dbg !164
  br label %16, !dbg !164

; <label>:16                                      ; preds = %13
  %17 = add nsw i32 %i.0, 1, !dbg !165
  call void @llvm.dbg.value(metadata i32 %17, i64 0, metadata !156, metadata !32), !dbg !157
  br label %10, !dbg !167

; <label>:18                                      ; preds = %10
  %19 = load i32* @max_n, align 4, !dbg !168
  call void @tk(i32 %19), !dbg !169
  %20 = load i32* @checksum, align 4, !dbg !170
  %21 = load i32* @max_n, align 4, !dbg !171
  %22 = load i32* @maxflips, align 4, !dbg !172
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %20, i32 %21, i32 %22), !dbg !173
  ret i32 0, !dbg !174
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

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
!30 = !{!"0x100\00x\0024\000", !4, !5, !31}       ; [ DW_TAG_auto_variable ] [x] [line 24]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from elem]
!32 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!33 = !MDLocation(line: 24, column: 19, scope: !4)
!34 = !{!"0x100\00y\0024\000", !4, !5, !31}       ; [ DW_TAG_auto_variable ] [y] [line 24]
!35 = !MDLocation(line: 24, column: 23, scope: !4)
!36 = !MDLocation(line: 26, column: 27, scope: !37)
!37 = !{!"0xb\0026\004\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!38 = !{!"0x100\00i\0023\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 23]
!39 = !MDLocation(line: 23, column: 17, scope: !4)
!40 = !MDLocation(line: 26, column: 9, scope: !37)
!41 = !MDLocation(line: 26, column: 34, scope: !42)
!42 = !{!"0xb\002", !1, !43}                      ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!43 = !{!"0xb\001", !1, !44}                      ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!44 = !{!"0xb\0026\004\001", !1, !37}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!45 = !MDLocation(line: 26, column: 4, scope: !37)
!46 = !MDLocation(line: 27, column: 15, scope: !44)
!47 = !MDLocation(line: 27, column: 14, scope: !44)
!48 = !MDLocation(line: 27, column: 8, scope: !44)
!49 = !MDLocation(line: 27, column: 7, scope: !44)
!50 = !MDLocation(line: 26, column: 4, scope: !44)
!51 = !MDLocation(line: 29, column: 4, scope: !4)
!52 = !MDLocation(line: 30, column: 27, scope: !53)
!53 = !{!"0xb\0030\007\003", !1, !54}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!54 = !{!"0xb\0029\007\002", !1, !4}              ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!55 = !MDLocation(line: 30, column: 23, scope: !53)
!56 = !MDLocation(line: 30, column: 12, scope: !53)
!57 = !MDLocation(line: 30, column: 33, scope: !58)
!58 = !{!"0xb\0030\007\004", !1, !53}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!59 = !MDLocation(line: 30, column: 7, scope: !53)
!60 = !MDLocation(line: 31, column: 14, scope: !58)
!61 = !{!"0x100\00c\0024\000", !4, !5, !19}       ; [ DW_TAG_auto_variable ] [c] [line 24]
!62 = !MDLocation(line: 24, column: 26, scope: !4)
!63 = !MDLocation(line: 31, column: 25, scope: !58)
!64 = !MDLocation(line: 31, column: 19, scope: !58)
!65 = !MDLocation(line: 31, column: 18, scope: !58)
!66 = !MDLocation(line: 31, column: 30, scope: !58)
!67 = !MDLocation(line: 31, column: 29, scope: !58)
!68 = !MDLocation(line: 30, column: 7, scope: !58)
!69 = !MDLocation(line: 32, column: 7, scope: !54)
!70 = !MDLocation(line: 33, column: 4, scope: !54)
!71 = !MDLocation(line: 33, column: 15, scope: !72)
!72 = !{!"0xb\001", !1, !4}                       ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!73 = !MDLocation(line: 33, column: 13, scope: !4)
!74 = !MDLocation(line: 34, column: 4, scope: !4)
!75 = !{!"0x101\00n\0016777254\000", !9, !5, !8}  ; [ DW_TAG_arg_variable ] [n] [line 38]
!76 = !MDLocation(line: 38, column: 17, scope: !9)
!77 = !MDLocation(line: 42, column: 8, scope: !9)
!78 = !{!"0x100\00c\0040\000", !9, !5, !19}       ; [ DW_TAG_auto_variable ] [c] [line 40]
!79 = !MDLocation(line: 40, column: 9, scope: !9)
!80 = !{!"0x100\00i\0041\000", !9, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 41]
!81 = !MDLocation(line: 41, column: 17, scope: !9)
!82 = !MDLocation(line: 43, column: 9, scope: !83)
!83 = !{!"0xb\0043\004\005", !1, !9}              ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!84 = !MDLocation(line: 43, column: 16, scope: !85)
!85 = !{!"0xb\0043\004\006", !1, !83}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!86 = !MDLocation(line: 43, column: 4, scope: !83)
!87 = !MDLocation(line: 43, column: 38, scope: !85)
!88 = !MDLocation(line: 43, column: 31, scope: !85)
!89 = !MDLocation(line: 43, column: 29, scope: !85)
!90 = !MDLocation(line: 43, column: 24, scope: !91)
!91 = !{!"0xb\003", !1, !85}                      ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!92 = !MDLocation(line: 43, column: 4, scope: !85)
!93 = !MDLocation(line: 44, column: 4, scope: !9)
!94 = !MDLocation(line: 45, column: 1, scope: !9)
!95 = !{!"0x101\00n\0016777264\000", !12, !5, !8} ; [ DW_TAG_arg_variable ] [n] [line 48]
!96 = !MDLocation(line: 48, column: 13, scope: !12)
!97 = !{!"0x100\00i\0050\000", !12, !5, !8}       ; [ DW_TAG_auto_variable ] [i] [line 50]
!98 = !MDLocation(line: 50, column: 8, scope: !12)
!99 = !{!"0x100\00c\0051\000", !12, !5, !18}      ; [ DW_TAG_auto_variable ] [c] [line 51]
!100 = !MDLocation(line: 51, column: 9, scope: !12)
!101 = !MDLocation(line: 53, column: 4, scope: !12)
!102 = !MDLocation(line: 53, column: 11, scope: !12)
!103 = !MDLocation(line: 54, column: 7, scope: !104)
!104 = !{!"0xb\0053\0018\007", !1, !12}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!105 = !MDLocation(line: 55, column: 11, scope: !106)
!106 = !{!"0xb\0055\0011\008", !1, !104}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!107 = !MDLocation(line: 55, column: 11, scope: !104)
!108 = !MDLocation(line: 56, column: 12, scope: !109)
!109 = !{!"0xb\0055\0022\009", !1, !106}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!110 = !MDLocation(line: 56, column: 10, scope: !109)
!111 = !MDLocation(line: 57, column: 10, scope: !109)
!112 = !MDLocation(line: 60, column: 7, scope: !104)
!113 = !MDLocation(line: 62, column: 14, scope: !104)
!114 = !MDLocation(line: 62, column: 13, scope: !104)
!115 = !MDLocation(line: 62, column: 7, scope: !104)
!116 = !MDLocation(line: 63, column: 11, scope: !117)
!117 = !{!"0xb\0063\0011\0010", !1, !104}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!118 = !MDLocation(line: 63, column: 11, scope: !104)
!119 = !MDLocation(line: 64, column: 16, scope: !120)
!120 = !{!"0xb\0063\0015\0011", !1, !117}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!121 = !MDLocation(line: 64, column: 14, scope: !120)
!122 = !MDLocation(line: 64, column: 24, scope: !123)
!123 = !{!"0xb\001", !1, !120}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!124 = !MDLocation(line: 64, column: 14, scope: !125)
!125 = !{!"0xb\002", !1, !120}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!126 = !{!"0x100\00f\0050\000", !12, !5, !8}      ; [ DW_TAG_auto_variable ] [f] [line 50]
!127 = !MDLocation(line: 50, column: 15, scope: !12)
!128 = !MDLocation(line: 65, column: 18, scope: !129)
!129 = !{!"0xb\0065\0014\0012", !1, !120}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!130 = !MDLocation(line: 65, column: 14, scope: !129)
!131 = !MDLocation(line: 65, column: 14, scope: !120)
!132 = !MDLocation(line: 65, column: 28, scope: !129)
!133 = !MDLocation(line: 66, column: 22, scope: !120)
!134 = !MDLocation(line: 66, column: 28, scope: !120)
!135 = !MDLocation(line: 66, column: 10, scope: !136)
!136 = !{!"0xb\004", !1, !137}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!137 = !{!"0xb\003", !1, !120}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!138 = !MDLocation(line: 67, column: 7, scope: !120)
!139 = !MDLocation(line: 69, column: 1, scope: !12)
!140 = !{!"0x101\00inputN\0016777287\000", !13, !5, !8} ; [ DW_TAG_arg_variable ] [inputN] [line 71]
!141 = !MDLocation(line: 71, column: 15, scope: !13)
!142 = !MDLocation(line: 75, column: 4, scope: !13)
!143 = !MDLocation(line: 76, column: 8, scope: !144)
!144 = !{!"0xb\0076\008\0013", !1, !13}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!145 = !MDLocation(line: 76, column: 8, scope: !13)
!146 = !MDLocation(line: 76, column: 21, scope: !147)
!147 = !{!"0xb\001", !1, !144}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!148 = !MDLocation(line: 77, column: 15, scope: !149)
!149 = !{!"0xb\0076\0033\0014", !1, !144}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!150 = !MDLocation(line: 77, column: 7, scope: !149)
!151 = !MDLocation(line: 78, column: 7, scope: !149)
!152 = !MDLocation(line: 82, column: 4, scope: !13)
!153 = !MDLocation(line: 83, column: 4, scope: !13)
!154 = !MDLocation(line: 84, column: 4, scope: !13)
!155 = !MDLocation(line: 85, column: 4, scope: !13)
!156 = !{!"0x100\00i\0073\000", !13, !5, !8}      ; [ DW_TAG_auto_variable ] [i] [line 73]
!157 = !MDLocation(line: 73, column: 8, scope: !13)
!158 = !MDLocation(line: 87, column: 9, scope: !159)
!159 = !{!"0xb\0087\004\0015", !1, !13}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!160 = !MDLocation(line: 87, column: 20, scope: !161)
!161 = !{!"0xb\0087\004\0016", !1, !159}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!162 = !MDLocation(line: 87, column: 16, scope: !161)
!163 = !MDLocation(line: 87, column: 4, scope: !159)
!164 = !MDLocation(line: 87, column: 32, scope: !161)
!165 = !MDLocation(line: 87, column: 27, scope: !166)
!166 = !{!"0xb\003", !1, !161}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/fannkuch-redux/C/code.c]
!167 = !MDLocation(line: 87, column: 4, scope: !161)
!168 = !MDLocation(line: 88, column: 7, scope: !13)
!169 = !MDLocation(line: 88, column: 4, scope: !13)
!170 = !MDLocation(line: 90, column: 41, scope: !13)
!171 = !MDLocation(line: 90, column: 51, scope: !13)
!172 = !MDLocation(line: 90, column: 58, scope: !13)
!173 = !MDLocation(line: 90, column: 4, scope: !13)
!174 = !MDLocation(line: 92, column: 4, scope: !13)
