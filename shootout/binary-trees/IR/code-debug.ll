; ModuleID = 'code.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tn = type { %struct.tn*, %struct.tn*, i64 }

@.str = private unnamed_addr constant [38 x i8] c"stretch tree of depth %u\09 check: %li\0A\00", align 1
@.str1 = private unnamed_addr constant [36 x i8] c"%li\09 trees of depth %u\09 check: %li\0A\00", align 1
@.str2 = private unnamed_addr constant [41 x i8] c"long lived tree of depth %u\09 check: %li\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.tn* @NewTreeNode(%struct.tn* %left, %struct.tn* %right, i64 %item) #0 {
  %1 = alloca %struct.tn*, align 8
  %2 = alloca %struct.tn*, align 8
  %3 = alloca i64, align 8
  %new = alloca %struct.tn*, align 8
  store %struct.tn* %left, %struct.tn** %1, align 8
  call void @llvm.dbg.declare(metadata %struct.tn** %1, metadata !36, metadata !37), !dbg !38
  store %struct.tn* %right, %struct.tn** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.tn** %2, metadata !39, metadata !37), !dbg !40
  store i64 %item, i64* %3, align 8
  call void @llvm.dbg.declare(metadata i64* %3, metadata !41, metadata !37), !dbg !42
  call void @llvm.dbg.declare(metadata %struct.tn** %new, metadata !43, metadata !37), !dbg !44
  %4 = call noalias i8* @malloc(i64 24) #4, !dbg !45
  %5 = bitcast i8* %4 to %struct.tn*, !dbg !46
  store %struct.tn* %5, %struct.tn** %new, align 8, !dbg !47
  %6 = load %struct.tn** %1, align 8, !dbg !48
  %7 = load %struct.tn** %new, align 8, !dbg !49
  %8 = getelementptr inbounds %struct.tn* %7, i32 0, i32 0, !dbg !49
  store %struct.tn* %6, %struct.tn** %8, align 8, !dbg !49
  %9 = load %struct.tn** %2, align 8, !dbg !50
  %10 = load %struct.tn** %new, align 8, !dbg !51
  %11 = getelementptr inbounds %struct.tn* %10, i32 0, i32 1, !dbg !51
  store %struct.tn* %9, %struct.tn** %11, align 8, !dbg !51
  %12 = load i64* %3, align 8, !dbg !52
  %13 = load %struct.tn** %new, align 8, !dbg !53
  %14 = getelementptr inbounds %struct.tn* %13, i32 0, i32 2, !dbg !53
  store i64 %12, i64* %14, align 8, !dbg !53
  %15 = load %struct.tn** %new, align 8, !dbg !54
  ret %struct.tn* %15, !dbg !55
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define i64 @ItemCheck(%struct.tn* %tree) #0 {
  %1 = alloca i64, align 8
  %2 = alloca %struct.tn*, align 8
  store %struct.tn* %tree, %struct.tn** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.tn** %2, metadata !56, metadata !37), !dbg !57
  %3 = load %struct.tn** %2, align 8, !dbg !58
  %4 = getelementptr inbounds %struct.tn* %3, i32 0, i32 0, !dbg !58
  %5 = load %struct.tn** %4, align 8, !dbg !58
  %6 = icmp eq %struct.tn* %5, null, !dbg !58
  br i1 %6, label %7, label %11, !dbg !60

; <label>:7                                       ; preds = %0
  %8 = load %struct.tn** %2, align 8, !dbg !61
  %9 = getelementptr inbounds %struct.tn* %8, i32 0, i32 2, !dbg !61
  %10 = load i64* %9, align 8, !dbg !61
  store i64 %10, i64* %1, !dbg !62
  br label %25, !dbg !62

; <label>:11                                      ; preds = %0
  %12 = load %struct.tn** %2, align 8, !dbg !63
  %13 = getelementptr inbounds %struct.tn* %12, i32 0, i32 2, !dbg !63
  %14 = load i64* %13, align 8, !dbg !63
  %15 = load %struct.tn** %2, align 8, !dbg !64
  %16 = getelementptr inbounds %struct.tn* %15, i32 0, i32 0, !dbg !64
  %17 = load %struct.tn** %16, align 8, !dbg !64
  %18 = call i64 @ItemCheck(%struct.tn* %17), !dbg !65
  %19 = add nsw i64 %14, %18, !dbg !63
  %20 = load %struct.tn** %2, align 8, !dbg !66
  %21 = getelementptr inbounds %struct.tn* %20, i32 0, i32 1, !dbg !66
  %22 = load %struct.tn** %21, align 8, !dbg !66
  %23 = call i64 @ItemCheck(%struct.tn* %22), !dbg !67
  %24 = sub nsw i64 %19, %23, !dbg !63
  store i64 %24, i64* %1, !dbg !68
  br label %25, !dbg !68

; <label>:25                                      ; preds = %11, %7
  %26 = load i64* %1, !dbg !69
  ret i64 %26, !dbg !69
}

; Function Attrs: nounwind uwtable
define %struct.tn* @BottomUpTree(i64 %item, i32 %depth) #0 {
  %1 = alloca %struct.tn*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %item, i64* %2, align 8
  call void @llvm.dbg.declare(metadata i64* %2, metadata !70, metadata !37), !dbg !71
  store i32 %depth, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !72, metadata !37), !dbg !73
  %4 = load i32* %3, align 4, !dbg !74
  %5 = icmp ugt i32 %4, 0, !dbg !74
  br i1 %5, label %6, label %20, !dbg !76

; <label>:6                                       ; preds = %0
  %7 = load i64* %2, align 8, !dbg !77
  %8 = mul nsw i64 2, %7, !dbg !78
  %9 = sub nsw i64 %8, 1, !dbg !78
  %10 = load i32* %3, align 4, !dbg !79
  %11 = sub i32 %10, 1, !dbg !79
  %12 = call %struct.tn* @BottomUpTree(i64 %9, i32 %11), !dbg !80
  %13 = load i64* %2, align 8, !dbg !81
  %14 = mul nsw i64 2, %13, !dbg !82
  %15 = load i32* %3, align 4, !dbg !83
  %16 = sub i32 %15, 1, !dbg !83
  %17 = call %struct.tn* @BottomUpTree(i64 %14, i32 %16), !dbg !84
  %18 = load i64* %2, align 8, !dbg !85
  %19 = call %struct.tn* @NewTreeNode(%struct.tn* %12, %struct.tn* %17, i64 %18), !dbg !86
  store %struct.tn* %19, %struct.tn** %1, !dbg !87
  br label %23, !dbg !87

; <label>:20                                      ; preds = %0
  %21 = load i64* %2, align 8, !dbg !88
  %22 = call %struct.tn* @NewTreeNode(%struct.tn* null, %struct.tn* null, i64 %21), !dbg !89
  store %struct.tn* %22, %struct.tn** %1, !dbg !90
  br label %23, !dbg !90

; <label>:23                                      ; preds = %20, %6
  %24 = load %struct.tn** %1, !dbg !91
  ret %struct.tn* %24, !dbg !91
}

; Function Attrs: nounwind uwtable
define void @DeleteTree(%struct.tn* %tree) #0 {
  %1 = alloca %struct.tn*, align 8
  store %struct.tn* %tree, %struct.tn** %1, align 8
  call void @llvm.dbg.declare(metadata %struct.tn** %1, metadata !92, metadata !37), !dbg !93
  %2 = load %struct.tn** %1, align 8, !dbg !94
  %3 = getelementptr inbounds %struct.tn* %2, i32 0, i32 0, !dbg !94
  %4 = load %struct.tn** %3, align 8, !dbg !94
  %5 = icmp ne %struct.tn* %4, null, !dbg !94
  br i1 %5, label %6, label %13, !dbg !96

; <label>:6                                       ; preds = %0
  %7 = load %struct.tn** %1, align 8, !dbg !97
  %8 = getelementptr inbounds %struct.tn* %7, i32 0, i32 0, !dbg !97
  %9 = load %struct.tn** %8, align 8, !dbg !97
  call void @DeleteTree(%struct.tn* %9), !dbg !99
  %10 = load %struct.tn** %1, align 8, !dbg !100
  %11 = getelementptr inbounds %struct.tn* %10, i32 0, i32 1, !dbg !100
  %12 = load %struct.tn** %11, align 8, !dbg !100
  call void @DeleteTree(%struct.tn* %12), !dbg !101
  br label %13, !dbg !102

; <label>:13                                      ; preds = %6, %0
  %14 = load %struct.tn** %1, align 8, !dbg !103
  %15 = bitcast %struct.tn* %14 to i8*, !dbg !103
  call void @free(i8* %15) #4, !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %N = alloca i32, align 4
  %depth = alloca i32, align 4
  %minDepth = alloca i32, align 4
  %maxDepth = alloca i32, align 4
  %stretchDepth = alloca i32, align 4
  %stretchTree = alloca %struct.tn*, align 8
  %longLivedTree = alloca %struct.tn*, align 8
  %tempTree = alloca %struct.tn*, align 8
  %i = alloca i64, align 8
  %iterations = alloca i64, align 8
  %check = alloca i64, align 8
  store i32 %inputN, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !106, metadata !37), !dbg !107
  call void @llvm.dbg.declare(metadata i32* %N, metadata !108, metadata !37), !dbg !109
  call void @llvm.dbg.declare(metadata i32* %depth, metadata !110, metadata !37), !dbg !111
  call void @llvm.dbg.declare(metadata i32* %minDepth, metadata !112, metadata !37), !dbg !113
  call void @llvm.dbg.declare(metadata i32* %maxDepth, metadata !114, metadata !37), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %stretchDepth, metadata !116, metadata !37), !dbg !117
  call void @llvm.dbg.declare(metadata %struct.tn** %stretchTree, metadata !118, metadata !37), !dbg !119
  call void @llvm.dbg.declare(metadata %struct.tn** %longLivedTree, metadata !120, metadata !37), !dbg !121
  call void @llvm.dbg.declare(metadata %struct.tn** %tempTree, metadata !122, metadata !37), !dbg !123
  %2 = load i32* %1, align 4, !dbg !124
  store i32 %2, i32* %N, align 4, !dbg !125
  store i32 4, i32* %minDepth, align 4, !dbg !126
  %3 = load i32* %minDepth, align 4, !dbg !127
  %4 = add i32 %3, 2, !dbg !127
  %5 = load i32* %N, align 4, !dbg !129
  %6 = icmp ugt i32 %4, %5, !dbg !130
  br i1 %6, label %7, label %10, !dbg !131

; <label>:7                                       ; preds = %0
  %8 = load i32* %minDepth, align 4, !dbg !132
  %9 = add i32 %8, 2, !dbg !132
  store i32 %9, i32* %maxDepth, align 4, !dbg !133
  br label %12, !dbg !133

; <label>:10                                      ; preds = %0
  %11 = load i32* %N, align 4, !dbg !134
  store i32 %11, i32* %maxDepth, align 4, !dbg !135
  br label %12

; <label>:12                                      ; preds = %10, %7
  %13 = load i32* %maxDepth, align 4, !dbg !136
  %14 = add i32 %13, 1, !dbg !136
  store i32 %14, i32* %stretchDepth, align 4, !dbg !137
  %15 = load i32* %stretchDepth, align 4, !dbg !138
  %16 = call %struct.tn* @BottomUpTree(i64 0, i32 %15), !dbg !139
  store %struct.tn* %16, %struct.tn** %stretchTree, align 8, !dbg !140
  %17 = load i32* %stretchDepth, align 4, !dbg !141
  %18 = load %struct.tn** %stretchTree, align 8, !dbg !142
  %19 = call i64 @ItemCheck(%struct.tn* %18), !dbg !143
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str, i32 0, i32 0), i32 %17, i64 %19), !dbg !144
  %21 = load %struct.tn** %stretchTree, align 8, !dbg !145
  call void @DeleteTree(%struct.tn* %21), !dbg !146
  %22 = load i32* %maxDepth, align 4, !dbg !147
  %23 = call %struct.tn* @BottomUpTree(i64 0, i32 %22), !dbg !148
  store %struct.tn* %23, %struct.tn** %longLivedTree, align 8, !dbg !149
  %24 = load i32* %minDepth, align 4, !dbg !150
  store i32 %24, i32* %depth, align 4, !dbg !152
  br label %25, !dbg !152

; <label>:25                                      ; preds = %69, %12
  %26 = load i32* %depth, align 4, !dbg !153
  %27 = load i32* %maxDepth, align 4, !dbg !157
  %28 = icmp ule i32 %26, %27, !dbg !158
  br i1 %28, label %29, label %72, !dbg !159

; <label>:29                                      ; preds = %25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !160, metadata !37), !dbg !162
  call void @llvm.dbg.declare(metadata i64* %iterations, metadata !163, metadata !37), !dbg !164
  call void @llvm.dbg.declare(metadata i64* %check, metadata !165, metadata !37), !dbg !166
  %30 = load i32* %maxDepth, align 4, !dbg !167
  %31 = load i32* %depth, align 4, !dbg !168
  %32 = sub i32 %30, %31, !dbg !167
  %33 = load i32* %minDepth, align 4, !dbg !169
  %34 = add i32 %32, %33, !dbg !167
  %35 = uitofp i32 %34 to double, !dbg !167
  %36 = call double @pow(double 2.000000e+00, double %35) #4, !dbg !170
  %37 = fptosi double %36 to i64, !dbg !170
  store i64 %37, i64* %iterations, align 8, !dbg !171
  store i64 0, i64* %check, align 8, !dbg !172
  store i64 1, i64* %i, align 8, !dbg !173
  br label %38, !dbg !173

; <label>:38                                      ; preds = %60, %29
  %39 = load i64* %i, align 8, !dbg !175
  %40 = load i64* %iterations, align 8, !dbg !179
  %41 = icmp sle i64 %39, %40, !dbg !180
  br i1 %41, label %42, label %63, !dbg !181

; <label>:42                                      ; preds = %38
  %43 = load i64* %i, align 8, !dbg !182
  %44 = load i32* %depth, align 4, !dbg !184
  %45 = call %struct.tn* @BottomUpTree(i64 %43, i32 %44), !dbg !185
  store %struct.tn* %45, %struct.tn** %tempTree, align 8, !dbg !186
  %46 = load %struct.tn** %tempTree, align 8, !dbg !187
  %47 = call i64 @ItemCheck(%struct.tn* %46), !dbg !188
  %48 = load i64* %check, align 8, !dbg !189
  %49 = add nsw i64 %48, %47, !dbg !189
  store i64 %49, i64* %check, align 8, !dbg !189
  %50 = load %struct.tn** %tempTree, align 8, !dbg !190
  call void @DeleteTree(%struct.tn* %50), !dbg !191
  %51 = load i64* %i, align 8, !dbg !192
  %52 = sub nsw i64 0, %51, !dbg !193
  %53 = load i32* %depth, align 4, !dbg !194
  %54 = call %struct.tn* @BottomUpTree(i64 %52, i32 %53), !dbg !195
  store %struct.tn* %54, %struct.tn** %tempTree, align 8, !dbg !196
  %55 = load %struct.tn** %tempTree, align 8, !dbg !197
  %56 = call i64 @ItemCheck(%struct.tn* %55), !dbg !198
  %57 = load i64* %check, align 8, !dbg !199
  %58 = add nsw i64 %57, %56, !dbg !199
  store i64 %58, i64* %check, align 8, !dbg !199
  %59 = load %struct.tn** %tempTree, align 8, !dbg !200
  call void @DeleteTree(%struct.tn* %59), !dbg !201
  br label %60, !dbg !202

; <label>:60                                      ; preds = %42
  %61 = load i64* %i, align 8, !dbg !203
  %62 = add nsw i64 %61, 1, !dbg !203
  store i64 %62, i64* %i, align 8, !dbg !203
  br label %38, !dbg !204

; <label>:63                                      ; preds = %38
  %64 = load i64* %iterations, align 8, !dbg !205
  %65 = mul nsw i64 %64, 2, !dbg !205
  %66 = load i32* %depth, align 4, !dbg !206
  %67 = load i64* %check, align 8, !dbg !207
  %68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str1, i32 0, i32 0), i64 %65, i32 %66, i64 %67), !dbg !208
  br label %69, !dbg !209

; <label>:69                                      ; preds = %63
  %70 = load i32* %depth, align 4, !dbg !210
  %71 = add i32 %70, 2, !dbg !210
  store i32 %71, i32* %depth, align 4, !dbg !210
  br label %25, !dbg !211

; <label>:72                                      ; preds = %25
  %73 = load i32* %maxDepth, align 4, !dbg !212
  %74 = load %struct.tn** %longLivedTree, align 8, !dbg !213
  %75 = call i64 @ItemCheck(%struct.tn* %74), !dbg !214
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str2, i32 0, i32 0), i32 %73, i64 %75), !dbg !215
  ret i32 0, !dbg !216
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare double @pow(double, double) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!33, !34}
!llvm.ident = !{!35}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !3, !14, !2, !2} ; [ DW_TAG_compile_unit ] [/media/llvm/OSR/shootout/binary-trees/C/code.c] [DW_LANG_C99]
!1 = !{!"code.c", !"/media/llvm/OSR/shootout/binary-trees/C"}
!2 = !{}
!3 = !{!4, !13}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from treeNode]
!5 = !{!"0x16\00treeNode\0020\000\000\000\000", !1, null, !6} ; [ DW_TAG_typedef ] [treeNode] [line 20, size 0, align 0, offset 0] [from tn]
!6 = !{!"0x13\00tn\0016\00192\0064\000\000\000", !1, null, null, !7, null, null, null} ; [ DW_TAG_structure_type ] [tn] [line 16, size 192, align 64, offset 0] [def] [from ]
!7 = !{!8, !10, !11}
!8 = !{!"0xd\00left\0017\0064\0064\000\000", !1, !6, !9} ; [ DW_TAG_member ] [left] [line 17, size 64, align 64, offset 0] [from ]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from tn]
!10 = !{!"0xd\00right\0018\0064\0064\0064\000", !1, !6, !9} ; [ DW_TAG_member ] [right] [line 18, size 64, align 64, offset 64] [from ]
!11 = !{!"0xd\00item\0019\0064\0064\00128\000", !1, !6, !12} ; [ DW_TAG_member ] [item] [line 19, size 64, align 64, offset 128] [from long int]
!12 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!13 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = !{!15, !19, !22, !26, !29}
!15 = !{!"0x2e\00NewTreeNode\00NewTreeNode\00\0023\000\001\000\000\00256\000\0024", !1, !16, !17, null, %struct.tn* (%struct.tn*, %struct.tn*, i64)* @NewTreeNode, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 24] [NewTreeNode]
!16 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!17 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !18, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = !{!4, !4, !4, !12}
!19 = !{!"0x2e\00ItemCheck\00ItemCheck\00\0037\000\001\000\000\00256\000\0038", !1, !16, !20, null, i64 (%struct.tn*)* @ItemCheck, null, null, !2} ; [ DW_TAG_subprogram ] [line 37] [def] [scope 38] [ItemCheck]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{!12, !4}
!22 = !{!"0x2e\00BottomUpTree\00BottomUpTree\00\0046\000\001\000\000\00256\000\0047", !1, !16, !23, null, %struct.tn* (i64, i32)* @BottomUpTree, null, null, !2} ; [ DW_TAG_subprogram ] [line 46] [def] [scope 47] [BottomUpTree]
!23 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !24, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = !{!4, !12, !25}
!25 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!26 = !{!"0x2e\00DeleteTree\00DeleteTree\00\0060\000\001\000\000\00256\000\0061", !1, !16, !27, null, void (%struct.tn*)* @DeleteTree, null, null, !2} ; [ DW_TAG_subprogram ] [line 60] [def] [scope 61] [DeleteTree]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{null, !4}
!29 = !{!"0x2e\00bench\00bench\00\0072\000\001\000\000\00256\000\0073", !1, !16, !30, null, i32 (i32)* @bench, null, null, !2} ; [ DW_TAG_subprogram ] [line 72] [def] [scope 73] [bench]
!30 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !31, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = !{!32, !32}
!32 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!33 = !{i32 2, !"Dwarf Version", i32 4}
!34 = !{i32 2, !"Debug Info Version", i32 2}
!35 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!36 = !{!"0x101\00left\0016777239\000", !15, !16, !4} ; [ DW_TAG_arg_variable ] [left] [line 23]
!37 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!38 = !MDLocation(line: 23, column: 33, scope: !15)
!39 = !{!"0x101\00right\0033554455\000", !15, !16, !4} ; [ DW_TAG_arg_variable ] [right] [line 23]
!40 = !MDLocation(line: 23, column: 49, scope: !15)
!41 = !{!"0x101\00item\0050331671\000", !15, !16, !12} ; [ DW_TAG_arg_variable ] [item] [line 23]
!42 = !MDLocation(line: 23, column: 61, scope: !15)
!43 = !{!"0x100\00new\0025\000", !15, !16, !4}    ; [ DW_TAG_auto_variable ] [new] [line 25]
!44 = !MDLocation(line: 25, column: 18, scope: !15)
!45 = !MDLocation(line: 27, column: 22, scope: !15)
!46 = !MDLocation(line: 27, column: 11, scope: !15)
!47 = !MDLocation(line: 27, column: 5, scope: !15)
!48 = !MDLocation(line: 29, column: 17, scope: !15)
!49 = !MDLocation(line: 29, column: 5, scope: !15)
!50 = !MDLocation(line: 30, column: 18, scope: !15)
!51 = !MDLocation(line: 30, column: 5, scope: !15)
!52 = !MDLocation(line: 31, column: 17, scope: !15)
!53 = !MDLocation(line: 31, column: 5, scope: !15)
!54 = !MDLocation(line: 33, column: 12, scope: !15)
!55 = !MDLocation(line: 33, column: 5, scope: !15)
!56 = !{!"0x101\00tree\0016777253\000", !19, !16, !4} ; [ DW_TAG_arg_variable ] [tree] [line 37]
!57 = !MDLocation(line: 37, column: 26, scope: !19)
!58 = !MDLocation(line: 39, column: 9, scope: !59)
!59 = !{!"0xb\0039\009\000", !1, !19}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!60 = !MDLocation(line: 39, column: 9, scope: !19)
!61 = !MDLocation(line: 40, column: 16, scope: !59)
!62 = !MDLocation(line: 40, column: 9, scope: !59)
!63 = !MDLocation(line: 42, column: 16, scope: !59)
!64 = !MDLocation(line: 42, column: 39, scope: !59)
!65 = !MDLocation(line: 42, column: 29, scope: !59)
!66 = !MDLocation(line: 42, column: 63, scope: !59)
!67 = !MDLocation(line: 42, column: 53, scope: !59)
!68 = !MDLocation(line: 42, column: 9, scope: !59)
!69 = !MDLocation(line: 43, column: 1, scope: !19)
!70 = !{!"0x101\00item\0016777262\000", !22, !16, !12} ; [ DW_TAG_arg_variable ] [item] [line 46]
!71 = !MDLocation(line: 46, column: 29, scope: !22)
!72 = !{!"0x101\00depth\0033554478\000", !22, !16, !25} ; [ DW_TAG_arg_variable ] [depth] [line 46]
!73 = !MDLocation(line: 46, column: 44, scope: !22)
!74 = !MDLocation(line: 48, column: 9, scope: !75)
!75 = !{!"0xb\0048\009\001", !1, !22}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!76 = !MDLocation(line: 48, column: 9, scope: !22)
!77 = !MDLocation(line: 51, column: 30, scope: !75)
!78 = !MDLocation(line: 51, column: 26, scope: !75)
!79 = !MDLocation(line: 51, column: 40, scope: !75)
!80 = !MDLocation(line: 51, column: 13, scope: !75)
!81 = !MDLocation(line: 52, column: 30, scope: !75)
!82 = !MDLocation(line: 52, column: 26, scope: !75)
!83 = !MDLocation(line: 52, column: 36, scope: !75)
!84 = !MDLocation(line: 52, column: 13, scope: !75)
!85 = !MDLocation(line: 53, column: 13, scope: !75)
!86 = !MDLocation(line: 49, column: 16, scope: !75)
!87 = !MDLocation(line: 49, column: 9, scope: !75)
!88 = !MDLocation(line: 56, column: 40, scope: !75)
!89 = !MDLocation(line: 56, column: 16, scope: !75)
!90 = !MDLocation(line: 56, column: 9, scope: !75)
!91 = !MDLocation(line: 57, column: 1, scope: !22)
!92 = !{!"0x101\00tree\0016777276\000", !26, !16, !4} ; [ DW_TAG_arg_variable ] [tree] [line 60]
!93 = !MDLocation(line: 60, column: 27, scope: !26)
!94 = !MDLocation(line: 62, column: 9, scope: !95)
!95 = !{!"0xb\0062\009\002", !1, !26}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!96 = !MDLocation(line: 62, column: 9, scope: !26)
!97 = !MDLocation(line: 64, column: 20, scope: !98)
!98 = !{!"0xb\0063\005\003", !1, !95}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!99 = !MDLocation(line: 64, column: 9, scope: !98)
!100 = !MDLocation(line: 65, column: 20, scope: !98)
!101 = !MDLocation(line: 65, column: 9, scope: !98)
!102 = !MDLocation(line: 66, column: 5, scope: !98)
!103 = !MDLocation(line: 68, column: 10, scope: !26)
!104 = !MDLocation(line: 68, column: 5, scope: !26)
!105 = !MDLocation(line: 69, column: 1, scope: !26)
!106 = !{!"0x101\00inputN\0016777288\000", !29, !16, !32} ; [ DW_TAG_arg_variable ] [inputN] [line 72]
!107 = !MDLocation(line: 72, column: 15, scope: !29)
!108 = !{!"0x100\00N\0074\000", !29, !16, !25}    ; [ DW_TAG_auto_variable ] [N] [line 74]
!109 = !MDLocation(line: 74, column: 16, scope: !29)
!110 = !{!"0x100\00depth\0074\000", !29, !16, !25} ; [ DW_TAG_auto_variable ] [depth] [line 74]
!111 = !MDLocation(line: 74, column: 19, scope: !29)
!112 = !{!"0x100\00minDepth\0074\000", !29, !16, !25} ; [ DW_TAG_auto_variable ] [minDepth] [line 74]
!113 = !MDLocation(line: 74, column: 26, scope: !29)
!114 = !{!"0x100\00maxDepth\0074\000", !29, !16, !25} ; [ DW_TAG_auto_variable ] [maxDepth] [line 74]
!115 = !MDLocation(line: 74, column: 36, scope: !29)
!116 = !{!"0x100\00stretchDepth\0074\000", !29, !16, !25} ; [ DW_TAG_auto_variable ] [stretchDepth] [line 74]
!117 = !MDLocation(line: 74, column: 46, scope: !29)
!118 = !{!"0x100\00stretchTree\0075\000", !29, !16, !4} ; [ DW_TAG_auto_variable ] [stretchTree] [line 75]
!119 = !MDLocation(line: 75, column: 17, scope: !29)
!120 = !{!"0x100\00longLivedTree\0075\000", !29, !16, !4} ; [ DW_TAG_auto_variable ] [longLivedTree] [line 75]
!121 = !MDLocation(line: 75, column: 31, scope: !29)
!122 = !{!"0x100\00tempTree\0075\000", !29, !16, !4} ; [ DW_TAG_auto_variable ] [tempTree] [line 75]
!123 = !MDLocation(line: 75, column: 47, scope: !29)
!124 = !MDLocation(line: 77, column: 9, scope: !29)
!125 = !MDLocation(line: 77, column: 5, scope: !29)
!126 = !MDLocation(line: 79, column: 5, scope: !29)
!127 = !MDLocation(line: 81, column: 10, scope: !128)
!128 = !{!"0xb\0081\009\004", !1, !29}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!129 = !MDLocation(line: 81, column: 26, scope: !128)
!130 = !MDLocation(line: 81, column: 9, scope: !128)
!131 = !MDLocation(line: 81, column: 9, scope: !29)
!132 = !MDLocation(line: 82, column: 20, scope: !128)
!133 = !MDLocation(line: 82, column: 9, scope: !128)
!134 = !MDLocation(line: 84, column: 20, scope: !128)
!135 = !MDLocation(line: 84, column: 9, scope: !128)
!136 = !MDLocation(line: 86, column: 20, scope: !29)
!137 = !MDLocation(line: 86, column: 5, scope: !29)
!138 = !MDLocation(line: 88, column: 35, scope: !29)
!139 = !MDLocation(line: 88, column: 19, scope: !29)
!140 = !MDLocation(line: 88, column: 5, scope: !29)
!141 = !MDLocation(line: 92, column: 9, scope: !29)
!142 = !MDLocation(line: 93, column: 19, scope: !29)
!143 = !MDLocation(line: 93, column: 9, scope: !29)
!144 = !MDLocation(line: 89, column: 5, scope: !29)
!145 = !MDLocation(line: 96, column: 16, scope: !29)
!146 = !MDLocation(line: 96, column: 5, scope: !29)
!147 = !MDLocation(line: 98, column: 37, scope: !29)
!148 = !MDLocation(line: 98, column: 21, scope: !29)
!149 = !MDLocation(line: 98, column: 5, scope: !29)
!150 = !MDLocation(line: 100, column: 18, scope: !151)
!151 = !{!"0xb\00100\005\005", !1, !29}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!152 = !MDLocation(line: 100, column: 10, scope: !151)
!153 = !MDLocation(line: 100, column: 28, scope: !154)
!154 = !{!"0xb\002", !1, !155}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!155 = !{!"0xb\001", !1, !156}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!156 = !{!"0xb\00100\005\006", !1, !151}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!157 = !MDLocation(line: 100, column: 37, scope: !156)
!158 = !MDLocation(line: 100, column: 28, scope: !156)
!159 = !MDLocation(line: 100, column: 5, scope: !151)
!160 = !{!"0x100\00i\00102\000", !161, !16, !12}  ; [ DW_TAG_auto_variable ] [i] [line 102]
!161 = !{!"0xb\00101\005\007", !1, !156}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!162 = !MDLocation(line: 102, column: 17, scope: !161)
!163 = !{!"0x100\00iterations\00102\000", !161, !16, !12} ; [ DW_TAG_auto_variable ] [iterations] [line 102]
!164 = !MDLocation(line: 102, column: 20, scope: !161)
!165 = !{!"0x100\00check\00102\000", !161, !16, !12} ; [ DW_TAG_auto_variable ] [check] [line 102]
!166 = !MDLocation(line: 102, column: 32, scope: !161)
!167 = !MDLocation(line: 104, column: 29, scope: !161)
!168 = !MDLocation(line: 104, column: 40, scope: !161)
!169 = !MDLocation(line: 104, column: 48, scope: !161)
!170 = !MDLocation(line: 104, column: 22, scope: !161)
!171 = !MDLocation(line: 104, column: 9, scope: !161)
!172 = !MDLocation(line: 106, column: 9, scope: !161)
!173 = !MDLocation(line: 108, column: 14, scope: !174)
!174 = !{!"0xb\00108\009\008", !1, !161}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!175 = !MDLocation(line: 108, column: 21, scope: !176)
!176 = !{!"0xb\002", !1, !177}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!177 = !{!"0xb\001", !1, !178}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!178 = !{!"0xb\00108\009\009", !1, !174}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!179 = !MDLocation(line: 108, column: 26, scope: !178)
!180 = !MDLocation(line: 108, column: 21, scope: !178)
!181 = !MDLocation(line: 108, column: 9, scope: !174)
!182 = !MDLocation(line: 110, column: 37, scope: !183)
!183 = !{!"0xb\00109\009\0010", !1, !178}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/binary-trees/C/code.c]
!184 = !MDLocation(line: 110, column: 40, scope: !183)
!185 = !MDLocation(line: 110, column: 24, scope: !183)
!186 = !MDLocation(line: 110, column: 13, scope: !183)
!187 = !MDLocation(line: 111, column: 32, scope: !183)
!188 = !MDLocation(line: 111, column: 22, scope: !183)
!189 = !MDLocation(line: 111, column: 13, scope: !183)
!190 = !MDLocation(line: 112, column: 24, scope: !183)
!191 = !MDLocation(line: 112, column: 13, scope: !183)
!192 = !MDLocation(line: 114, column: 38, scope: !183)
!193 = !MDLocation(line: 114, column: 37, scope: !183)
!194 = !MDLocation(line: 114, column: 41, scope: !183)
!195 = !MDLocation(line: 114, column: 24, scope: !183)
!196 = !MDLocation(line: 114, column: 13, scope: !183)
!197 = !MDLocation(line: 115, column: 32, scope: !183)
!198 = !MDLocation(line: 115, column: 22, scope: !183)
!199 = !MDLocation(line: 115, column: 13, scope: !183)
!200 = !MDLocation(line: 116, column: 24, scope: !183)
!201 = !MDLocation(line: 116, column: 13, scope: !183)
!202 = !MDLocation(line: 117, column: 9, scope: !183)
!203 = !MDLocation(line: 108, column: 38, scope: !178)
!204 = !MDLocation(line: 108, column: 9, scope: !178)
!205 = !MDLocation(line: 122, column: 13, scope: !161)
!206 = !MDLocation(line: 123, column: 13, scope: !161)
!207 = !MDLocation(line: 124, column: 13, scope: !161)
!208 = !MDLocation(line: 119, column: 9, scope: !161)
!209 = !MDLocation(line: 126, column: 5, scope: !161)
!210 = !MDLocation(line: 100, column: 47, scope: !156)
!211 = !MDLocation(line: 100, column: 5, scope: !156)
!212 = !MDLocation(line: 131, column: 9, scope: !29)
!213 = !MDLocation(line: 132, column: 19, scope: !29)
!214 = !MDLocation(line: 132, column: 9, scope: !29)
!215 = !MDLocation(line: 128, column: 5, scope: !29)
!216 = !MDLocation(line: 135, column: 5, scope: !29)
