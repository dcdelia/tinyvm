; ModuleID = 'code.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [18 x i8] c"mandelbrot-%d.txt\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"P4\0A%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @bench(i32 %inputN) #0 {
  %1 = alloca i32, align 4
  %w = alloca i32, align 4
  %h = alloca i32, align 4
  %bit_num = alloca i32, align 4
  %byte_acc = alloca i8, align 1
  %i = alloca i32, align 4
  %iter = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  %limit = alloca double, align 8
  %Zr = alloca double, align 8
  %Zi = alloca double, align 8
  %Cr = alloca double, align 8
  %Ci = alloca double, align 8
  %Tr = alloca double, align 8
  %Ti = alloca double, align 8
  %filename = alloca [64 x i8], align 16
  %outStream = alloca %struct._IO_FILE*, align 8
  store i32 %inputN, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !12, metadata !13), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %w, metadata !15, metadata !13), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !17, metadata !13), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %bit_num, metadata !19, metadata !13), !dbg !20
  store i32 0, i32* %bit_num, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i8* %byte_acc, metadata !21, metadata !13), !dbg !23
  store i8 0, i8* %byte_acc, align 1, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !13), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %iter, metadata !26, metadata !13), !dbg !27
  store i32 50, i32* %iter, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata double* %x, metadata !28, metadata !13), !dbg !30
  call void @llvm.dbg.declare(metadata double* %y, metadata !31, metadata !13), !dbg !32
  call void @llvm.dbg.declare(metadata double* %limit, metadata !33, metadata !13), !dbg !34
  store double 2.000000e+00, double* %limit, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata double* %Zr, metadata !35, metadata !13), !dbg !36
  call void @llvm.dbg.declare(metadata double* %Zi, metadata !37, metadata !13), !dbg !38
  call void @llvm.dbg.declare(metadata double* %Cr, metadata !39, metadata !13), !dbg !40
  call void @llvm.dbg.declare(metadata double* %Ci, metadata !41, metadata !13), !dbg !42
  call void @llvm.dbg.declare(metadata double* %Tr, metadata !43, metadata !13), !dbg !44
  call void @llvm.dbg.declare(metadata double* %Ti, metadata !45, metadata !13), !dbg !46
  %2 = load i32* %1, align 4, !dbg !47
  store i32 %2, i32* %h, align 4, !dbg !48
  store i32 %2, i32* %w, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata [64 x i8]* %filename, metadata !50, metadata !13), !dbg !54
  %3 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0, !dbg !55
  %4 = load i32* %w, align 4, !dbg !56
  %5 = call i32 (i8*, i8*, ...)* @sprintf(i8* %3, i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0), i32 %4) #4, !dbg !57
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %outStream, metadata !58, metadata !13), !dbg !120
  %6 = getelementptr inbounds [64 x i8]* %filename, i32 0, i32 0, !dbg !121
  %7 = call %struct._IO_FILE* @fopen(i8* %6, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0)), !dbg !122
  store %struct._IO_FILE* %7, %struct._IO_FILE** %outStream, align 8, !dbg !120
  %8 = load i32* %w, align 4, !dbg !123
  %9 = load i32* %h, align 4, !dbg !124
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %8, i32 %9), !dbg !125
  store double 0.000000e+00, double* %y, align 8, !dbg !126
  br label %11, !dbg !126

; <label>:11                                      ; preds = %121, %0
  %12 = load double* %y, align 8, !dbg !128
  %13 = load i32* %h, align 4, !dbg !132
  %14 = sitofp i32 %13 to double, !dbg !132
  %15 = fcmp olt double %12, %14, !dbg !133
  br i1 %15, label %16, label %124, !dbg !134

; <label>:16                                      ; preds = %11
  store double 0.000000e+00, double* %x, align 8, !dbg !135
  br label %17, !dbg !135

; <label>:17                                      ; preds = %117, %16
  %18 = load double* %x, align 8, !dbg !138
  %19 = load i32* %w, align 4, !dbg !142
  %20 = sitofp i32 %19 to double, !dbg !142
  %21 = fcmp olt double %18, %20, !dbg !143
  br i1 %21, label %22, label %120, !dbg !144

; <label>:22                                      ; preds = %17
  store double 0.000000e+00, double* %Ti, align 8, !dbg !145
  store double 0.000000e+00, double* %Tr, align 8, !dbg !147
  store double 0.000000e+00, double* %Zi, align 8, !dbg !148
  store double 0.000000e+00, double* %Zr, align 8, !dbg !149
  %23 = load double* %x, align 8, !dbg !150
  %24 = fmul double 2.000000e+00, %23, !dbg !151
  %25 = load i32* %w, align 4, !dbg !152
  %26 = sitofp i32 %25 to double, !dbg !152
  %27 = fdiv double %24, %26, !dbg !151
  %28 = fsub double %27, 1.500000e+00, !dbg !151
  store double %28, double* %Cr, align 8, !dbg !153
  %29 = load double* %y, align 8, !dbg !154
  %30 = fmul double 2.000000e+00, %29, !dbg !155
  %31 = load i32* %h, align 4, !dbg !156
  %32 = sitofp i32 %31 to double, !dbg !156
  %33 = fdiv double %30, %32, !dbg !155
  %34 = fsub double %33, 1.000000e+00, !dbg !155
  store double %34, double* %Ci, align 8, !dbg !157
  store i32 0, i32* %i, align 4, !dbg !158
  br label %35, !dbg !158

; <label>:35                                      ; preds = %67, %22
  %36 = load i32* %i, align 4, !dbg !160
  %37 = load i32* %iter, align 4, !dbg !164
  %38 = icmp slt i32 %36, %37, !dbg !165
  br i1 %38, label %39, label %47, !dbg !165

; <label>:39                                      ; preds = %35
  %40 = load double* %Tr, align 8, !dbg !166
  %41 = load double* %Ti, align 8, !dbg !168
  %42 = fadd double %40, %41, !dbg !169
  %43 = load double* %limit, align 8, !dbg !170
  %44 = load double* %limit, align 8, !dbg !171
  %45 = fmul double %43, %44, !dbg !170
  %46 = fcmp ole double %42, %45, !dbg !169
  br label %47

; <label>:47                                      ; preds = %39, %35
  %48 = phi i1 [ false, %35 ], [ %46, %39 ]
  br i1 %48, label %49, label %70, !dbg !172

; <label>:49                                      ; preds = %47
  %50 = load double* %Zr, align 8, !dbg !174
  %51 = fmul double 2.000000e+00, %50, !dbg !176
  %52 = load double* %Zi, align 8, !dbg !177
  %53 = fmul double %51, %52, !dbg !176
  %54 = load double* %Ci, align 8, !dbg !178
  %55 = fadd double %53, %54, !dbg !176
  store double %55, double* %Zi, align 8, !dbg !179
  %56 = load double* %Tr, align 8, !dbg !180
  %57 = load double* %Ti, align 8, !dbg !181
  %58 = fsub double %56, %57, !dbg !180
  %59 = load double* %Cr, align 8, !dbg !182
  %60 = fadd double %58, %59, !dbg !180
  store double %60, double* %Zr, align 8, !dbg !183
  %61 = load double* %Zr, align 8, !dbg !184
  %62 = load double* %Zr, align 8, !dbg !185
  %63 = fmul double %61, %62, !dbg !184
  store double %63, double* %Tr, align 8, !dbg !186
  %64 = load double* %Zi, align 8, !dbg !187
  %65 = load double* %Zi, align 8, !dbg !188
  %66 = fmul double %64, %65, !dbg !187
  store double %66, double* %Ti, align 8, !dbg !189
  br label %67, !dbg !190

; <label>:67                                      ; preds = %49
  %68 = load i32* %i, align 4, !dbg !191
  %69 = add nsw i32 %68, 1, !dbg !191
  store i32 %69, i32* %i, align 4, !dbg !191
  br label %35, !dbg !192

; <label>:70                                      ; preds = %47
  %71 = load i8* %byte_acc, align 1, !dbg !193
  %72 = sext i8 %71 to i32, !dbg !193
  %73 = shl i32 %72, 1, !dbg !193
  %74 = trunc i32 %73 to i8, !dbg !193
  store i8 %74, i8* %byte_acc, align 1, !dbg !193
  %75 = load double* %Tr, align 8, !dbg !194
  %76 = load double* %Ti, align 8, !dbg !196
  %77 = fadd double %75, %76, !dbg !194
  %78 = load double* %limit, align 8, !dbg !197
  %79 = load double* %limit, align 8, !dbg !198
  %80 = fmul double %78, %79, !dbg !197
  %81 = fcmp ole double %77, %80, !dbg !194
  br i1 %81, label %82, label %87, !dbg !199

; <label>:82                                      ; preds = %70
  %83 = load i8* %byte_acc, align 1, !dbg !200
  %84 = sext i8 %83 to i32, !dbg !200
  %85 = or i32 %84, 1, !dbg !200
  %86 = trunc i32 %85 to i8, !dbg !200
  store i8 %86, i8* %byte_acc, align 1, !dbg !200
  br label %87, !dbg !200

; <label>:87                                      ; preds = %82, %70
  %88 = load i32* %bit_num, align 4, !dbg !202
  %89 = add nsw i32 %88, 1, !dbg !202
  store i32 %89, i32* %bit_num, align 4, !dbg !202
  %90 = load i32* %bit_num, align 4, !dbg !203
  %91 = icmp eq i32 %90, 8, !dbg !203
  br i1 %91, label %92, label %97, !dbg !205

; <label>:92                                      ; preds = %87
  %93 = load i8* %byte_acc, align 1, !dbg !206
  %94 = sext i8 %93 to i32, !dbg !206
  %95 = load %struct._IO_FILE** %outStream, align 8, !dbg !206
  %96 = call i32 @_IO_putc(i32 %94, %struct._IO_FILE* %95), !dbg !206
  store i8 0, i8* %byte_acc, align 1, !dbg !208
  store i32 0, i32* %bit_num, align 4, !dbg !209
  br label %116, !dbg !210

; <label>:97                                      ; preds = %87
  %98 = load double* %x, align 8, !dbg !211
  %99 = load i32* %w, align 4, !dbg !213
  %100 = sub nsw i32 %99, 1, !dbg !213
  %101 = sitofp i32 %100 to double, !dbg !213
  %102 = fcmp oeq double %98, %101, !dbg !211
  br i1 %102, label %103, label %115, !dbg !214

; <label>:103                                     ; preds = %97
  %104 = load i32* %w, align 4, !dbg !215
  %105 = srem i32 %104, 8, !dbg !215
  %106 = sub nsw i32 8, %105, !dbg !217
  %107 = load i8* %byte_acc, align 1, !dbg !218
  %108 = sext i8 %107 to i32, !dbg !218
  %109 = shl i32 %108, %106, !dbg !218
  %110 = trunc i32 %109 to i8, !dbg !218
  store i8 %110, i8* %byte_acc, align 1, !dbg !218
  %111 = load i8* %byte_acc, align 1, !dbg !219
  %112 = sext i8 %111 to i32, !dbg !219
  %113 = load %struct._IO_FILE** %outStream, align 8, !dbg !219
  %114 = call i32 @_IO_putc(i32 %112, %struct._IO_FILE* %113), !dbg !219
  store i8 0, i8* %byte_acc, align 1, !dbg !220
  store i32 0, i32* %bit_num, align 4, !dbg !221
  br label %115, !dbg !222

; <label>:115                                     ; preds = %103, %97
  br label %116

; <label>:116                                     ; preds = %115, %92
  br label %117, !dbg !223

; <label>:117                                     ; preds = %116
  %118 = load double* %x, align 8, !dbg !224
  %119 = fadd double %118, 1.000000e+00, !dbg !224
  store double %119, double* %x, align 8, !dbg !224
  br label %17, !dbg !225

; <label>:120                                     ; preds = %17
  br label %121, !dbg !226

; <label>:121                                     ; preds = %120
  %122 = load double* %y, align 8, !dbg !227
  %123 = fadd double %122, 1.000000e+00, !dbg !227
  store double %123, double* %y, align 8, !dbg !227
  br label %11, !dbg !228

; <label>:124                                     ; preds = %11
  %125 = load %struct._IO_FILE** %outStream, align 8, !dbg !229
  %126 = call i32 @fclose(%struct._IO_FILE* %125), !dbg !230
  ret i32 0, !dbg !231
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

declare i32 @printf(i8*, ...) #3

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #3

declare i32 @fclose(%struct._IO_FILE*) #3

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
!15 = !{!"0x100\00w\0017\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [w] [line 17]
!16 = !MDLocation(line: 17, column: 9, scope: !4)
!17 = !{!"0x100\00h\0017\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [h] [line 17]
!18 = !MDLocation(line: 17, column: 12, scope: !4)
!19 = !{!"0x100\00bit_num\0017\000", !4, !5, !8}  ; [ DW_TAG_auto_variable ] [bit_num] [line 17]
!20 = !MDLocation(line: 17, column: 15, scope: !4)
!21 = !{!"0x100\00byte_acc\0018\000", !4, !5, !22} ; [ DW_TAG_auto_variable ] [byte_acc] [line 18]
!22 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!23 = !MDLocation(line: 18, column: 10, scope: !4)
!24 = !{!"0x100\00i\0019\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 19]
!25 = !MDLocation(line: 19, column: 9, scope: !4)
!26 = !{!"0x100\00iter\0019\000", !4, !5, !8}     ; [ DW_TAG_auto_variable ] [iter] [line 19]
!27 = !MDLocation(line: 19, column: 12, scope: !4)
!28 = !{!"0x100\00x\0020\000", !4, !5, !29}       ; [ DW_TAG_auto_variable ] [x] [line 20]
!29 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!30 = !MDLocation(line: 20, column: 12, scope: !4)
!31 = !{!"0x100\00y\0020\000", !4, !5, !29}       ; [ DW_TAG_auto_variable ] [y] [line 20]
!32 = !MDLocation(line: 20, column: 15, scope: !4)
!33 = !{!"0x100\00limit\0020\000", !4, !5, !29}   ; [ DW_TAG_auto_variable ] [limit] [line 20]
!34 = !MDLocation(line: 20, column: 18, scope: !4)
!35 = !{!"0x100\00Zr\0021\000", !4, !5, !29}      ; [ DW_TAG_auto_variable ] [Zr] [line 21]
!36 = !MDLocation(line: 21, column: 12, scope: !4)
!37 = !{!"0x100\00Zi\0021\000", !4, !5, !29}      ; [ DW_TAG_auto_variable ] [Zi] [line 21]
!38 = !MDLocation(line: 21, column: 16, scope: !4)
!39 = !{!"0x100\00Cr\0021\000", !4, !5, !29}      ; [ DW_TAG_auto_variable ] [Cr] [line 21]
!40 = !MDLocation(line: 21, column: 20, scope: !4)
!41 = !{!"0x100\00Ci\0021\000", !4, !5, !29}      ; [ DW_TAG_auto_variable ] [Ci] [line 21]
!42 = !MDLocation(line: 21, column: 24, scope: !4)
!43 = !{!"0x100\00Tr\0021\000", !4, !5, !29}      ; [ DW_TAG_auto_variable ] [Tr] [line 21]
!44 = !MDLocation(line: 21, column: 28, scope: !4)
!45 = !{!"0x100\00Ti\0021\000", !4, !5, !29}      ; [ DW_TAG_auto_variable ] [Ti] [line 21]
!46 = !MDLocation(line: 21, column: 32, scope: !4)
!47 = !MDLocation(line: 23, column: 13, scope: !4)
!48 = !MDLocation(line: 23, column: 9, scope: !4)
!49 = !MDLocation(line: 23, column: 5, scope: !4)
!50 = !{!"0x100\00filename\0025\000", !4, !5, !51} ; [ DW_TAG_auto_variable ] [filename] [line 25]
!51 = !{!"0x1\00\000\00512\008\000\000\000", null, null, !22, !52, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!52 = !{!53}
!53 = !{!"0x21\000\0064"}                         ; [ DW_TAG_subrange_type ] [0, 63]
!54 = !MDLocation(line: 25, column: 10, scope: !4)
!55 = !MDLocation(line: 26, column: 13, scope: !4)
!56 = !MDLocation(line: 26, column: 44, scope: !4)
!57 = !MDLocation(line: 26, column: 5, scope: !4)
!58 = !{!"0x100\00outStream\0027\000", !4, !5, !59} ; [ DW_TAG_auto_variable ] [outStream] [line 27]
!59 = !{!"0xf\00\000\0064\0064\000\000", null, null, !60} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!60 = !{!"0x16\00FILE\0048\000\000\000\000", !61, null, !62} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!61 = !{!"/usr/include/stdio.h", !"/media/llvm/OSR/shootout/mandelbrot"}
!62 = !{!"0x13\00_IO_FILE\00245\001728\0064\000\000\000", !63, null, null, !64, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!63 = !{!"/usr/include/libio.h", !"/media/llvm/OSR/shootout/mandelbrot"}
!64 = !{!65, !66, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !86, !87, !88, !89, !93, !95, !97, !101, !104, !106, !108, !109, !110, !111, !115, !116}
!65 = !{!"0xd\00_flags\00246\0032\0032\000\000", !63, !62, !8} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!66 = !{!"0xd\00_IO_read_ptr\00251\0064\0064\0064\000", !63, !62, !67} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!67 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!68 = !{!"0xd\00_IO_read_end\00252\0064\0064\00128\000", !63, !62, !67} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!69 = !{!"0xd\00_IO_read_base\00253\0064\0064\00192\000", !63, !62, !67} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!70 = !{!"0xd\00_IO_write_base\00254\0064\0064\00256\000", !63, !62, !67} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!71 = !{!"0xd\00_IO_write_ptr\00255\0064\0064\00320\000", !63, !62, !67} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!72 = !{!"0xd\00_IO_write_end\00256\0064\0064\00384\000", !63, !62, !67} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!73 = !{!"0xd\00_IO_buf_base\00257\0064\0064\00448\000", !63, !62, !67} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!74 = !{!"0xd\00_IO_buf_end\00258\0064\0064\00512\000", !63, !62, !67} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!75 = !{!"0xd\00_IO_save_base\00260\0064\0064\00576\000", !63, !62, !67} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!76 = !{!"0xd\00_IO_backup_base\00261\0064\0064\00640\000", !63, !62, !67} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!77 = !{!"0xd\00_IO_save_end\00262\0064\0064\00704\000", !63, !62, !67} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!78 = !{!"0xd\00_markers\00264\0064\0064\00768\000", !63, !62, !79} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!79 = !{!"0xf\00\000\0064\0064\000\000", null, null, !80} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!80 = !{!"0x13\00_IO_marker\00160\00192\0064\000\000\000", !63, null, null, !81, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!81 = !{!82, !83, !85}
!82 = !{!"0xd\00_next\00161\0064\0064\000\000", !63, !80, !79} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!83 = !{!"0xd\00_sbuf\00162\0064\0064\0064\000", !63, !80, !84} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!84 = !{!"0xf\00\000\0064\0064\000\000", null, null, !62} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!85 = !{!"0xd\00_pos\00166\0032\0032\00128\000", !63, !80, !8} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!86 = !{!"0xd\00_chain\00266\0064\0064\00832\000", !63, !62, !84} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!87 = !{!"0xd\00_fileno\00268\0032\0032\00896\000", !63, !62, !8} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!88 = !{!"0xd\00_flags2\00272\0032\0032\00928\000", !63, !62, !8} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!89 = !{!"0xd\00_old_offset\00274\0064\0064\00960\000", !63, !62, !90} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!90 = !{!"0x16\00__off_t\00131\000\000\000\000", !91, null, !92} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!91 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/media/llvm/OSR/shootout/mandelbrot"}
!92 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!93 = !{!"0xd\00_cur_column\00278\0016\0016\001024\000", !63, !62, !94} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!94 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!95 = !{!"0xd\00_vtable_offset\00279\008\008\001040\000", !63, !62, !96} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!96 = !{!"0x24\00signed char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!97 = !{!"0xd\00_shortbuf\00280\008\008\001048\000", !63, !62, !98} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!98 = !{!"0x1\00\000\008\008\000\000\000", null, null, !22, !99, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!99 = !{!100}
!100 = !{!"0x21\000\001"}                         ; [ DW_TAG_subrange_type ] [0, 0]
!101 = !{!"0xd\00_lock\00284\0064\0064\001088\000", !63, !62, !102} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!102 = !{!"0xf\00\000\0064\0064\000\000", null, null, !103} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_lock_t]
!103 = !{!"0x16\00_IO_lock_t\00154\000\000\000\000", !63, null, null} ; [ DW_TAG_typedef ] [_IO_lock_t] [line 154, size 0, align 0, offset 0] [from ]
!104 = !{!"0xd\00_offset\00293\0064\0064\001152\000", !63, !62, !105} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!105 = !{!"0x16\00__off64_t\00132\000\000\000\000", !91, null, !92} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!106 = !{!"0xd\00__pad1\00302\0064\0064\001216\000", !63, !62, !107} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!107 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!108 = !{!"0xd\00__pad2\00303\0064\0064\001280\000", !63, !62, !107} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!109 = !{!"0xd\00__pad3\00304\0064\0064\001344\000", !63, !62, !107} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!110 = !{!"0xd\00__pad4\00305\0064\0064\001408\000", !63, !62, !107} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!111 = !{!"0xd\00__pad5\00306\0064\0064\001472\000", !63, !62, !112} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!112 = !{!"0x16\00size_t\0062\000\000\000\000", !113, null, !114} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!113 = !{!"/usr/local/bin/../lib/clang/3.6.2/include/stddef.h", !"/media/llvm/OSR/shootout/mandelbrot"}
!114 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!115 = !{!"0xd\00_mode\00308\0032\0032\001536\000", !63, !62, !8} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!116 = !{!"0xd\00_unused2\00310\00160\008\001568\000", !63, !62, !117} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!117 = !{!"0x1\00\000\00160\008\000\000\000", null, null, !22, !118, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!118 = !{!119}
!119 = !{!"0x21\000\0020"}                        ; [ DW_TAG_subrange_type ] [0, 19]
!120 = !MDLocation(line: 27, column: 11, scope: !4)
!121 = !MDLocation(line: 27, column: 29, scope: !4)
!122 = !MDLocation(line: 27, column: 23, scope: !4)
!123 = !MDLocation(line: 29, column: 26, scope: !4)
!124 = !MDLocation(line: 29, column: 28, scope: !4)
!125 = !MDLocation(line: 29, column: 5, scope: !4)
!126 = !MDLocation(line: 31, column: 9, scope: !127)
!127 = !{!"0xb\0031\005\000", !1, !4}             ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!128 = !MDLocation(line: 31, column: 13, scope: !129)
!129 = !{!"0xb\002", !1, !130}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!130 = !{!"0xb\001", !1, !131}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!131 = !{!"0xb\0031\005\001", !1, !127}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!132 = !MDLocation(line: 31, column: 15, scope: !131)
!133 = !MDLocation(line: 31, column: 13, scope: !131)
!134 = !MDLocation(line: 31, column: 5, scope: !127)
!135 = !MDLocation(line: 33, column: 13, scope: !136)
!136 = !{!"0xb\0033\009\003", !1, !137}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!137 = !{!"0xb\0032\005\002", !1, !131}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!138 = !MDLocation(line: 33, column: 17, scope: !139)
!139 = !{!"0xb\002", !1, !140}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!140 = !{!"0xb\001", !1, !141}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!141 = !{!"0xb\0033\009\004", !1, !136}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!142 = !MDLocation(line: 33, column: 19, scope: !141)
!143 = !MDLocation(line: 33, column: 17, scope: !141)
!144 = !MDLocation(line: 33, column: 9, scope: !136)
!145 = !MDLocation(line: 35, column: 28, scope: !146)
!146 = !{!"0xb\0034\009\005", !1, !141}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!147 = !MDLocation(line: 35, column: 23, scope: !146)
!148 = !MDLocation(line: 35, column: 18, scope: !146)
!149 = !MDLocation(line: 35, column: 13, scope: !146)
!150 = !MDLocation(line: 36, column: 23, scope: !146)
!151 = !MDLocation(line: 36, column: 19, scope: !146)
!152 = !MDLocation(line: 36, column: 25, scope: !146)
!153 = !MDLocation(line: 36, column: 13, scope: !146)
!154 = !MDLocation(line: 36, column: 43, scope: !146)
!155 = !MDLocation(line: 36, column: 39, scope: !146)
!156 = !MDLocation(line: 36, column: 45, scope: !146)
!157 = !MDLocation(line: 36, column: 35, scope: !146)
!158 = !MDLocation(line: 38, column: 18, scope: !159)
!159 = !{!"0xb\0038\0013\006", !1, !146}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!160 = !MDLocation(line: 38, column: 22, scope: !161)
!161 = !{!"0xb\004", !1, !162}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!162 = !{!"0xb\001", !1, !163}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!163 = !{!"0xb\0038\0013\007", !1, !159}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!164 = !MDLocation(line: 38, column: 24, scope: !163)
!165 = !MDLocation(line: 38, column: 22, scope: !163)
!166 = !MDLocation(line: 38, column: 33, scope: !167)
!167 = !{!"0xb\002", !1, !163}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!168 = !MDLocation(line: 38, column: 36, scope: !163)
!169 = !MDLocation(line: 38, column: 33, scope: !163)
!170 = !MDLocation(line: 38, column: 42, scope: !163)
!171 = !MDLocation(line: 38, column: 48, scope: !163)
!172 = !MDLocation(line: 38, column: 13, scope: !173)
!173 = !{!"0xb\003", !1, !159}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!174 = !MDLocation(line: 40, column: 26, scope: !175)
!175 = !{!"0xb\0039\0013\008", !1, !163}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!176 = !MDLocation(line: 40, column: 22, scope: !175)
!177 = !MDLocation(line: 40, column: 29, scope: !175)
!178 = !MDLocation(line: 40, column: 34, scope: !175)
!179 = !MDLocation(line: 40, column: 17, scope: !175)
!180 = !MDLocation(line: 41, column: 22, scope: !175)
!181 = !MDLocation(line: 41, column: 27, scope: !175)
!182 = !MDLocation(line: 41, column: 32, scope: !175)
!183 = !MDLocation(line: 41, column: 17, scope: !175)
!184 = !MDLocation(line: 42, column: 22, scope: !175)
!185 = !MDLocation(line: 42, column: 27, scope: !175)
!186 = !MDLocation(line: 42, column: 17, scope: !175)
!187 = !MDLocation(line: 43, column: 22, scope: !175)
!188 = !MDLocation(line: 43, column: 27, scope: !175)
!189 = !MDLocation(line: 43, column: 17, scope: !175)
!190 = !MDLocation(line: 44, column: 13, scope: !175)
!191 = !MDLocation(line: 38, column: 55, scope: !163)
!192 = !MDLocation(line: 38, column: 13, scope: !163)
!193 = !MDLocation(line: 46, column: 13, scope: !146)
!194 = !MDLocation(line: 47, column: 16, scope: !195)
!195 = !{!"0xb\0047\0016\009", !1, !146}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!196 = !MDLocation(line: 47, column: 19, scope: !195)
!197 = !MDLocation(line: 47, column: 25, scope: !195)
!198 = !MDLocation(line: 47, column: 31, scope: !195)
!199 = !MDLocation(line: 47, column: 16, scope: !146)
!200 = !MDLocation(line: 47, column: 38, scope: !201)
!201 = !{!"0xb\001", !1, !195}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!202 = !MDLocation(line: 49, column: 13, scope: !146)
!203 = !MDLocation(line: 51, column: 16, scope: !204)
!204 = !{!"0xb\0051\0016\0010", !1, !146}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!205 = !MDLocation(line: 51, column: 16, scope: !146)
!206 = !MDLocation(line: 53, column: 17, scope: !207)
!207 = !{!"0xb\0052\0013\0011", !1, !204}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!208 = !MDLocation(line: 54, column: 17, scope: !207)
!209 = !MDLocation(line: 55, column: 17, scope: !207)
!210 = !MDLocation(line: 56, column: 13, scope: !207)
!211 = !MDLocation(line: 57, column: 21, scope: !212)
!212 = !{!"0xb\0057\0021\0012", !1, !204}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!213 = !MDLocation(line: 57, column: 26, scope: !212)
!214 = !MDLocation(line: 57, column: 21, scope: !204)
!215 = !MDLocation(line: 59, column: 33, scope: !216)
!216 = !{!"0xb\0058\0013\0013", !1, !212}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/mandelbrot/code.c]
!217 = !MDLocation(line: 59, column: 31, scope: !216)
!218 = !MDLocation(line: 59, column: 17, scope: !216)
!219 = !MDLocation(line: 60, column: 17, scope: !216)
!220 = !MDLocation(line: 61, column: 17, scope: !216)
!221 = !MDLocation(line: 62, column: 17, scope: !216)
!222 = !MDLocation(line: 63, column: 13, scope: !216)
!223 = !MDLocation(line: 64, column: 9, scope: !146)
!224 = !MDLocation(line: 33, column: 21, scope: !141)
!225 = !MDLocation(line: 33, column: 9, scope: !141)
!226 = !MDLocation(line: 65, column: 5, scope: !137)
!227 = !MDLocation(line: 31, column: 17, scope: !131)
!228 = !MDLocation(line: 31, column: 5, scope: !131)
!229 = !MDLocation(line: 67, column: 12, scope: !4)
!230 = !MDLocation(line: 67, column: 5, scope: !4)
!231 = !MDLocation(line: 69, column: 5, scope: !4)
