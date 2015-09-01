; ModuleID = 'code.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [18 x i8] c"mandelbrot-%d.txt\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"P4\0A%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %filename = alloca [64 x i8], align 16
  call void @llvm.dbg.value(metadata i32 %inputN, i64 0, metadata !12, metadata !13), !dbg !14
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !13), !dbg !16
  call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !17, metadata !13), !dbg !19
  call void @llvm.dbg.value(metadata i32 50, i64 0, metadata !20, metadata !13), !dbg !21
  call void @llvm.dbg.value(metadata double 2.000000e+00, i64 0, metadata !22, metadata !13), !dbg !24
  call void @llvm.dbg.value(metadata i32 %inputN, i64 0, metadata !25, metadata !13), !dbg !26
  call void @llvm.dbg.value(metadata i32 %inputN, i64 0, metadata !27, metadata !13), !dbg !28
  call void @llvm.dbg.declare(metadata [64 x i8]* %filename, metadata !29, metadata !13), !dbg !33
  %1 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0, !dbg !34
  %2 = call i32 (i8*, i8*, ...)* @sprintf(i8* %1, i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0), i32 %inputN) #4, !dbg !35
  %3 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0, !dbg !36
  %4 = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0)), !dbg !37
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %4, i64 0, metadata !38, metadata !13), !dbg !100
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %inputN, i32 %inputN), !dbg !101
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !102, metadata !13), !dbg !103
  br label %6, !dbg !104

; <label>:6                                       ; preds = %74, %0
  %y.0 = phi double [ 0.000000e+00, %0 ], [ %75, %74 ]
  %byte_acc.0 = phi i8 [ 0, %0 ], [ %byte_acc.1, %74 ]
  %bit_num.0 = phi i32 [ 0, %0 ], [ %bit_num.1, %74 ]
  %7 = sitofp i32 %inputN to double, !dbg !106
  %8 = fcmp olt double %y.0, %7, !dbg !108
  br i1 %8, label %9, label %76, !dbg !109

; <label>:9                                       ; preds = %6
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !110, metadata !13), !dbg !111
  br label %10, !dbg !112

; <label>:10                                      ; preds = %71, %9
  %x.0 = phi double [ 0.000000e+00, %9 ], [ %72, %71 ]
  %byte_acc.1 = phi i8 [ %byte_acc.0, %9 ], [ %byte_acc.4, %71 ]
  %bit_num.1 = phi i32 [ %bit_num.0, %9 ], [ %bit_num.3, %71 ]
  %11 = sitofp i32 %inputN to double, !dbg !115
  %12 = fcmp olt double %x.0, %11, !dbg !117
  br i1 %12, label %13, label %73, !dbg !118

; <label>:13                                      ; preds = %10
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !119, metadata !13), !dbg !120
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !121, metadata !13), !dbg !122
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !123, metadata !13), !dbg !124
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !125, metadata !13), !dbg !126
  %14 = fmul double 2.000000e+00, %x.0, !dbg !127
  %15 = sitofp i32 %inputN to double, !dbg !129
  %16 = fdiv double %14, %15, !dbg !127
  %17 = fsub double %16, 1.500000e+00, !dbg !127
  call void @llvm.dbg.value(metadata double %17, i64 0, metadata !130, metadata !13), !dbg !131
  %18 = fmul double 2.000000e+00, %y.0, !dbg !132
  %19 = sitofp i32 %inputN to double, !dbg !133
  %20 = fdiv double %18, %19, !dbg !132
  %21 = fsub double %20, 1.000000e+00, !dbg !132
  call void @llvm.dbg.value(metadata double %21, i64 0, metadata !134, metadata !13), !dbg !135
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !136, metadata !13), !dbg !137
  br label %22, !dbg !138

; <label>:22                                      ; preds = %38, %13
  %Zr.0 = phi double [ 0.000000e+00, %13 ], [ %35, %38 ]
  %i.0 = phi i32 [ 0, %13 ], [ %39, %38 ]
  %Zi.0 = phi double [ 0.000000e+00, %13 ], [ %33, %38 ]
  %Tr.0 = phi double [ 0.000000e+00, %13 ], [ %36, %38 ]
  %Ti.0 = phi double [ 0.000000e+00, %13 ], [ %37, %38 ]
  %23 = icmp slt i32 %i.0, 50, !dbg !140
  br i1 %23, label %24, label %28, !dbg !140

; <label>:24                                      ; preds = %22
  %25 = fadd double %Tr.0, %Ti.0, !dbg !142
  %26 = fmul double 2.000000e+00, 2.000000e+00, !dbg !143
  %27 = fcmp ole double %25, %26, !dbg !142
  br label %28

; <label>:28                                      ; preds = %24, %22
  %29 = phi i1 [ false, %22 ], [ %27, %24 ]
  br i1 %29, label %30, label %40, !dbg !144

; <label>:30                                      ; preds = %28
  %31 = fmul double 2.000000e+00, %Zr.0, !dbg !146
  %32 = fmul double %31, %Zi.0, !dbg !146
  %33 = fadd double %32, %21, !dbg !146
  call void @llvm.dbg.value(metadata double %33, i64 0, metadata !123, metadata !13), !dbg !124
  %34 = fsub double %Tr.0, %Ti.0, !dbg !148
  %35 = fadd double %34, %17, !dbg !148
  call void @llvm.dbg.value(metadata double %35, i64 0, metadata !125, metadata !13), !dbg !126
  %36 = fmul double %35, %35, !dbg !149
  call void @llvm.dbg.value(metadata double %36, i64 0, metadata !121, metadata !13), !dbg !122
  %37 = fmul double %33, %33, !dbg !150
  call void @llvm.dbg.value(metadata double %37, i64 0, metadata !119, metadata !13), !dbg !120
  br label %38, !dbg !151

; <label>:38                                      ; preds = %30
  %39 = add nsw i32 %i.0, 1, !dbg !152
  call void @llvm.dbg.value(metadata i32 %39, i64 0, metadata !136, metadata !13), !dbg !137
  br label %22, !dbg !153

; <label>:40                                      ; preds = %28
  %41 = sext i8 %byte_acc.1 to i32, !dbg !154
  %42 = shl i32 %41, 1, !dbg !154
  %43 = trunc i32 %42 to i8, !dbg !154
  call void @llvm.dbg.value(metadata i8 %43, i64 0, metadata !17, metadata !13), !dbg !19
  %44 = fadd double %Tr.0, %Ti.0, !dbg !155
  %45 = fmul double 2.000000e+00, 2.000000e+00, !dbg !157
  %46 = fcmp ole double %44, %45, !dbg !155
  br i1 %46, label %47, label %51, !dbg !158

; <label>:47                                      ; preds = %40
  %48 = sext i8 %43 to i32, !dbg !159
  %49 = or i32 %48, 1, !dbg !159
  %50 = trunc i32 %49 to i8, !dbg !159
  call void @llvm.dbg.value(metadata i8 %50, i64 0, metadata !17, metadata !13), !dbg !19
  br label %51, !dbg !159

; <label>:51                                      ; preds = %47, %40
  %byte_acc.2 = phi i8 [ %50, %47 ], [ %43, %40 ]
  %52 = add nsw i32 %bit_num.1, 1, !dbg !161
  call void @llvm.dbg.value(metadata i32 %52, i64 0, metadata !15, metadata !13), !dbg !16
  %53 = icmp eq i32 %52, 8, !dbg !162
  br i1 %53, label %54, label %57, !dbg !164

; <label>:54                                      ; preds = %51
  %55 = sext i8 %byte_acc.2 to i32, !dbg !165
  %56 = call i32 @_IO_putc(i32 %55, %struct._IO_FILE* %4), !dbg !165
  call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !17, metadata !13), !dbg !19
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !13), !dbg !16
  br label %70, !dbg !167

; <label>:57                                      ; preds = %51
  %58 = sub nsw i32 %inputN, 1, !dbg !168
  %59 = sitofp i32 %58 to double, !dbg !168
  %60 = fcmp oeq double %x.0, %59, !dbg !170
  br i1 %60, label %61, label %69, !dbg !171

; <label>:61                                      ; preds = %57
  %62 = srem i32 %inputN, 8, !dbg !172
  %63 = sub nsw i32 8, %62, !dbg !174
  %64 = sext i8 %byte_acc.2 to i32, !dbg !175
  %65 = shl i32 %64, %63, !dbg !175
  %66 = trunc i32 %65 to i8, !dbg !175
  call void @llvm.dbg.value(metadata i8 %66, i64 0, metadata !17, metadata !13), !dbg !19
  %67 = sext i8 %66 to i32, !dbg !176
  %68 = call i32 @_IO_putc(i32 %67, %struct._IO_FILE* %4), !dbg !176
  call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !17, metadata !13), !dbg !19
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !13), !dbg !16
  br label %69, !dbg !177

; <label>:69                                      ; preds = %61, %57
  %byte_acc.3 = phi i8 [ 0, %61 ], [ %byte_acc.2, %57 ]
  %bit_num.2 = phi i32 [ 0, %61 ], [ %52, %57 ]
  br label %70

; <label>:70                                      ; preds = %69, %54
  %byte_acc.4 = phi i8 [ 0, %54 ], [ %byte_acc.3, %69 ]
  %bit_num.3 = phi i32 [ 0, %54 ], [ %bit_num.2, %69 ]
  br label %71, !dbg !178

; <label>:71                                      ; preds = %70
  %72 = fadd double %x.0, 1.000000e+00, !dbg !179
  call void @llvm.dbg.value(metadata double %72, i64 0, metadata !110, metadata !13), !dbg !111
  br label %10, !dbg !180

; <label>:73                                      ; preds = %10
  br label %74, !dbg !181

; <label>:74                                      ; preds = %73
  %75 = fadd double %y.0, 1.000000e+00, !dbg !182
  call void @llvm.dbg.value(metadata double %75, i64 0, metadata !102, metadata !13), !dbg !103
  br label %6, !dbg !183

; <label>:76                                      ; preds = %6
  %77 = call i32 @fclose(%struct._IO_FILE* %4), !dbg !184
  ret i32 0, !dbg !185
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

declare i32 @printf(i8*, ...) #3

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #3

declare i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/media/llvm/OSR/shootout/mandelbrot/code.c] [DW_LANG_C99]
!1 = !{!"code.c", !"/media/llvm/OSR/shootout/mandelbrot"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x2e\00bench\00bench\00\0015\000\001\000\000\00256\000\0016", !1, !5, !6, null, i32 (i32)* @bench, null, null, !2} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [bench]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 2}
!11 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!12 = !{!"0x101\00inputN\0016777231\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [inputN] [line 15]
!13 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!14 = !MDLocation(line: 15, column: 15, scope: !4)
!15 = !{!"0x100\00bit_num\0017\000", !4, !5, !8}  ; [ DW_TAG_auto_variable ] [bit_num] [line 17]
!16 = !MDLocation(line: 17, column: 15, scope: !4)
!17 = !{!"0x100\00byte_acc\0018\000", !4, !5, !18} ; [ DW_TAG_auto_variable ] [byte_acc] [line 18]
!18 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = !MDLocation(line: 18, column: 10, scope: !4)
!20 = !{!"0x100\00iter\0019\000", !4, !5, !8}     ; [ DW_TAG_auto_variable ] [iter] [line 19]
!21 = !MDLocation(line: 19, column: 12, scope: !4)
!22 = !{!"0x100\00limit\0020\000", !4, !5, !23}   ; [ DW_TAG_auto_variable ] [limit] [line 20]
!23 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!24 = !MDLocation(line: 20, column: 18, scope: !4)
!25 = !{!"0x100\00h\0017\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [h] [line 17]
!26 = !MDLocation(line: 17, column: 12, scope: !4)
!27 = !{!"0x100\00w\0017\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [w] [line 17]
!28 = !MDLocation(line: 17, column: 9, scope: !4)
!29 = !{!"0x100\00filename\0025\000", !4, !5, !30} ; [ DW_TAG_auto_variable ] [filename] [line 25]
!30 = !{!"0x1\00\000\00512\008\000\000\000", null, null, !18, !31, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!31 = !{!32}
!32 = !{!"0x21\000\0064"}                         ; [ DW_TAG_subrange_type ] [0, 63]
!33 = !MDLocation(line: 25, column: 10, scope: !4)
!34 = !MDLocation(line: 26, column: 13, scope: !4)
!35 = !MDLocation(line: 26, column: 5, scope: !4)
!36 = !MDLocation(line: 27, column: 29, scope: !4)
!37 = !MDLocation(line: 27, column: 23, scope: !4)
!38 = !{!"0x100\00outStream\0027\000", !4, !5, !39} ; [ DW_TAG_auto_variable ] [outStream] [line 27]
!39 = !{!"0xf\00\000\0064\0064\000\000", null, null, !40} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!40 = !{!"0x16\00FILE\0048\000\000\000\000", !41, null, !42} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!41 = !{!"/usr/include/stdio.h", !"/media/llvm/OSR/shootout/mandelbrot"}
!42 = !{!"0x13\00_IO_FILE\00245\001728\0064\000\000\000", !43, null, null, !44, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!43 = !{!"/usr/include/libio.h", !"/media/llvm/OSR/shootout/mandelbrot"}
!44 = !{!45, !46, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !66, !67, !68, !69, !73, !75, !77, !81, !84, !86, !88, !89, !90, !91, !95, !96}
!45 = !{!"0xd\00_flags\00246\0032\0032\000\000", !43, !42, !8} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!46 = !{!"0xd\00_IO_read_ptr\00251\0064\0064\0064\000", !43, !42, !47} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!47 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!48 = !{!"0xd\00_IO_read_end\00252\0064\0064\00128\000", !43, !42, !47} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!49 = !{!"0xd\00_IO_read_base\00253\0064\0064\00192\000", !43, !42, !47} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!50 = !{!"0xd\00_IO_write_base\00254\0064\0064\00256\000", !43, !42, !47} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!51 = !{!"0xd\00_IO_write_ptr\00255\0064\0064\00320\000", !43, !42, !47} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!52 = !{!"0xd\00_IO_write_end\00256\0064\0064\00384\000", !43, !42, !47} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!53 = !{!"0xd\00_IO_buf_base\00257\0064\0064\00448\000", !43, !42, !47} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!54 = !{!"0xd\00_IO_buf_end\00258\0064\0064\00512\000", !43, !42, !47} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!55 = !{!"0xd\00_IO_save_base\00260\0064\0064\00576\000", !43, !42, !47} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!56 = !{!"0xd\00_IO_backup_base\00261\0064\0064\00640\000", !43, !42, !47} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!57 = !{!"0xd\00_IO_save_end\00262\0064\0064\00704\000", !43, !42, !47} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!58 = !{!"0xd\00_markers\00264\0064\0064\00768\000", !43, !42, !59} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!59 = !{!"0xf\00\000\0064\0064\000\000", null, null, !60} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!60 = !{!"0x13\00_IO_marker\00160\00192\0064\000\000\000", !43, null, null, !61, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!61 = !{!62, !63, !65}
!62 = !{!"0xd\00_next\00161\0064\0064\000\000", !43, !60, !59} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!63 = !{!"0xd\00_sbuf\00162\0064\0064\0064\000", !43, !60, !64} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!64 = !{!"0xf\00\000\0064\0064\000\000", null, null, !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!65 = !{!"0xd\00_pos\00166\0032\0032\00128\000", !43, !60, !8} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!66 = !{!"0xd\00_chain\00266\0064\0064\00832\000", !43, !42, !64} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!67 = !{!"0xd\00_fileno\00268\0032\0032\00896\000", !43, !42, !8} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!68 = !{!"0xd\00_flags2\00272\0032\0032\00928\000", !43, !42, !8} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!69 = !{!"0xd\00_old_offset\00274\0064\0064\00960\000", !43, !42, !70} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!70 = !{!"0x16\00__off_t\00131\000\000\000\000", !71, null, !72} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!71 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/media/llvm/OSR/shootout/mandelbrot"}
!72 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!73 = !{!"0xd\00_cur_column\00278\0016\0016\001024\000", !43, !42, !74} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!74 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!75 = !{!"0xd\00_vtable_offset\00279\008\008\001040\000", !43, !42, !76} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!76 = !{!"0x24\00signed char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!77 = !{!"0xd\00_shortbuf\00280\008\008\001048\000", !43, !42, !78} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!78 = !{!"0x1\00\000\008\008\000\000\000", null, null, !18, !79, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!79 = !{!80}
!80 = !{!"0x21\000\001"}                          ; [ DW_TAG_subrange_type ] [0, 0]
!81 = !{!"0xd\00_lock\00284\0064\0064\001088\000", !43, !42, !82} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!82 = !{!"0xf\00\000\0064\0064\000\000", null, null, !83} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_lock_t]
!83 = !{!"0x16\00_IO_lock_t\00154\000\000\000\000", !43, null, null} ; [ DW_TAG_typedef ] [_IO_lock_t] [line 154, size 0, align 0, offset 0] [from ]
!84 = !{!"0xd\00_offset\00293\0064\0064\001152\000", !43, !42, !85} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!85 = !{!"0x16\00__off64_t\00132\000\000\000\000", !71, null, !72} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!86 = !{!"0xd\00__pad1\00302\0064\0064\001216\000", !43, !42, !87} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!87 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!88 = !{!"0xd\00__pad2\00303\0064\0064\001280\000", !43, !42, !87} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!89 = !{!"0xd\00__pad3\00304\0064\0064\001344\000", !43, !42, !87} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!90 = !{!"0xd\00__pad4\00305\0064\0064\001408\000", !43, !42, !87} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!91 = !{!"0xd\00__pad5\00306\0064\0064\001472\000", !43, !42, !92} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!92 = !{!"0x16\00size_t\0062\000\000\000\000", !93, null, !94} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!93 = !{!"/usr/local/bin/../lib/clang/3.6.2/include/stddef.h", !"/media/llvm/OSR/shootout/mandelbrot"}
!94 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!95 = !{!"0xd\00_mode\00308\0032\0032\001536\000", !43, !42, !8} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!96 = !{!"0xd\00_unused2\00310\00160\008\001568\000", !43, !42, !97} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!97 = !{!"0x1\00\000\00160\008\000\000\000", null, null, !18, !98, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!98 = !{!99}
!99 = !{!"0x21\000\0020"}                         ; [ DW_TAG_subrange_type ] [0, 19]
!100 = !MDLocation(line: 27, column: 11, scope: !4)
!101 = !MDLocation(line: 29, column: 5, scope: !4)
!102 = !{!"0x100\00y\0020\000", !4, !5, !23}      ; [ DW_TAG_auto_variable ] [y] [line 20]
!103 = !MDLocation(line: 20, column: 15, scope: !4)
!104 = !MDLocation(line: 31, column: 9, scope: !105)
!105 = !{!"0xb\0031\005\000", !1, !4}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!106 = !MDLocation(line: 31, column: 15, scope: !107)
!107 = !{!"0xb\0031\005\001", !1, !105}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!108 = !MDLocation(line: 31, column: 13, scope: !107)
!109 = !MDLocation(line: 31, column: 5, scope: !105)
!110 = !{!"0x100\00x\0020\000", !4, !5, !23}      ; [ DW_TAG_auto_variable ] [x] [line 20]
!111 = !MDLocation(line: 20, column: 12, scope: !4)
!112 = !MDLocation(line: 33, column: 13, scope: !113)
!113 = !{!"0xb\0033\009\003", !1, !114}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!114 = !{!"0xb\0032\005\002", !1, !107}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!115 = !MDLocation(line: 33, column: 19, scope: !116)
!116 = !{!"0xb\0033\009\004", !1, !113}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!117 = !MDLocation(line: 33, column: 17, scope: !116)
!118 = !MDLocation(line: 33, column: 9, scope: !113)
!119 = !{!"0x100\00Ti\0021\000", !4, !5, !23}     ; [ DW_TAG_auto_variable ] [Ti] [line 21]
!120 = !MDLocation(line: 21, column: 32, scope: !4)
!121 = !{!"0x100\00Tr\0021\000", !4, !5, !23}     ; [ DW_TAG_auto_variable ] [Tr] [line 21]
!122 = !MDLocation(line: 21, column: 28, scope: !4)
!123 = !{!"0x100\00Zi\0021\000", !4, !5, !23}     ; [ DW_TAG_auto_variable ] [Zi] [line 21]
!124 = !MDLocation(line: 21, column: 16, scope: !4)
!125 = !{!"0x100\00Zr\0021\000", !4, !5, !23}     ; [ DW_TAG_auto_variable ] [Zr] [line 21]
!126 = !MDLocation(line: 21, column: 12, scope: !4)
!127 = !MDLocation(line: 36, column: 19, scope: !128)
!128 = !{!"0xb\0034\009\005", !1, !116}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!129 = !MDLocation(line: 36, column: 25, scope: !128)
!130 = !{!"0x100\00Cr\0021\000", !4, !5, !23}     ; [ DW_TAG_auto_variable ] [Cr] [line 21]
!131 = !MDLocation(line: 21, column: 20, scope: !4)
!132 = !MDLocation(line: 36, column: 39, scope: !128)
!133 = !MDLocation(line: 36, column: 45, scope: !128)
!134 = !{!"0x100\00Ci\0021\000", !4, !5, !23}     ; [ DW_TAG_auto_variable ] [Ci] [line 21]
!135 = !MDLocation(line: 21, column: 24, scope: !4)
!136 = !{!"0x100\00i\0019\000", !4, !5, !8}       ; [ DW_TAG_auto_variable ] [i] [line 19]
!137 = !MDLocation(line: 19, column: 9, scope: !4)
!138 = !MDLocation(line: 38, column: 18, scope: !139)
!139 = !{!"0xb\0038\0013\006", !1, !128}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!140 = !MDLocation(line: 38, column: 22, scope: !141)
!141 = !{!"0xb\0038\0013\007", !1, !139}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!142 = !MDLocation(line: 38, column: 33, scope: !141)
!143 = !MDLocation(line: 38, column: 42, scope: !141)
!144 = !MDLocation(line: 38, column: 13, scope: !145)
!145 = !{!"0xb\003", !1, !139}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!146 = !MDLocation(line: 40, column: 22, scope: !147)
!147 = !{!"0xb\0039\0013\008", !1, !141}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!148 = !MDLocation(line: 41, column: 22, scope: !147)
!149 = !MDLocation(line: 42, column: 22, scope: !147)
!150 = !MDLocation(line: 43, column: 22, scope: !147)
!151 = !MDLocation(line: 44, column: 13, scope: !147)
!152 = !MDLocation(line: 38, column: 55, scope: !141)
!153 = !MDLocation(line: 38, column: 13, scope: !141)
!154 = !MDLocation(line: 46, column: 13, scope: !128)
!155 = !MDLocation(line: 47, column: 16, scope: !156)
!156 = !{!"0xb\0047\0016\009", !1, !128}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!157 = !MDLocation(line: 47, column: 25, scope: !156)
!158 = !MDLocation(line: 47, column: 16, scope: !128)
!159 = !MDLocation(line: 47, column: 38, scope: !160)
!160 = !{!"0xb\001", !1, !156}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!161 = !MDLocation(line: 49, column: 13, scope: !128)
!162 = !MDLocation(line: 51, column: 16, scope: !163)
!163 = !{!"0xb\0051\0016\0010", !1, !128}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!164 = !MDLocation(line: 51, column: 16, scope: !128)
!165 = !MDLocation(line: 53, column: 17, scope: !166)
!166 = !{!"0xb\0052\0013\0011", !1, !163}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!167 = !MDLocation(line: 56, column: 13, scope: !166)
!168 = !MDLocation(line: 57, column: 26, scope: !169)
!169 = !{!"0xb\0057\0021\0012", !1, !163}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!170 = !MDLocation(line: 57, column: 21, scope: !169)
!171 = !MDLocation(line: 57, column: 21, scope: !163)
!172 = !MDLocation(line: 59, column: 33, scope: !173)
!173 = !{!"0xb\0058\0013\0013", !1, !169}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!174 = !MDLocation(line: 59, column: 31, scope: !173)
!175 = !MDLocation(line: 59, column: 17, scope: !173)
!176 = !MDLocation(line: 60, column: 17, scope: !173)
!177 = !MDLocation(line: 63, column: 13, scope: !173)
!178 = !MDLocation(line: 64, column: 9, scope: !128)
!179 = !MDLocation(line: 33, column: 21, scope: !116)
!180 = !MDLocation(line: 33, column: 9, scope: !116)
!181 = !MDLocation(line: 65, column: 5, scope: !114)
!182 = !MDLocation(line: 31, column: 17, scope: !107)
!183 = !MDLocation(line: 31, column: 5, scope: !107)
!184 = !MDLocation(line: 67, column: 5, scope: !4)
!185 = !MDLocation(line: 69, column: 5, scope: !4)
