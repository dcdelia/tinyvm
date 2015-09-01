; ModuleID = 'code.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [22 x i8] c"\0A*** Error: %s [%d]!\0A\00", align 1
@.str1 = private unnamed_addr constant [46 x i8] c"shootout/reverse-complement/revcomp-input.txt\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"r+\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"revcomp-output.txt\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@bench.xtab = private unnamed_addr constant [256 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00TVGH\00\00CD\00\00M\00KN\00\00\00YSA\00BW\00R\00\00\00\00\00\00\00TVGH\00\00CD\00\00M\00KN\00\00\00YSA\00BW\00R\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str5 = private unnamed_addr constant [18 x i8] c"Buffer allocation\00", align 1
@.str6 = private unnamed_addr constant [14 x i8] c"No input data\00", align 1
@.str7 = private unnamed_addr constant [17 x i8] c"1st char not '>'\00", align 1
@.str8 = private unnamed_addr constant [14 x i8] c"Out of memory\00", align 1

; Function Attrs: nounwind uwtable
define i32 @errex(i8* %s, i32 %n) #0 {
  call void @llvm.dbg.value(metadata i8* %s, i64 0, metadata !19, metadata !20), !dbg !21
  call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !22, metadata !20), !dbg !23
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !24
  %2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* %s, i32 %n), !dbg !25
  ret i32 1, !dbg !26
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @bench() #0 {
  %xtab = alloca [256 x i8], align 16
  %1 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([46 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0)), !dbg !27
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %1, i64 0, metadata !28, metadata !20), !dbg !89
  %2 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0)), !dbg !90
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %2, i64 0, metadata !91, metadata !20), !dbg !92
  %3 = call noalias i8* @malloc(i64 82) #4, !dbg !93
  call void @llvm.dbg.value(metadata i8* %3, i64 0, metadata !94, metadata !20), !dbg !95
  %4 = call noalias i8* @malloc(i64 5200) #4, !dbg !96
  call void @llvm.dbg.value(metadata i8* %4, i64 0, metadata !97, metadata !20), !dbg !98
  %5 = getelementptr inbounds i8* %4, i64 5200, !dbg !99
  call void @llvm.dbg.value(metadata i8* %5, i64 0, metadata !100, metadata !20), !dbg !101
  call void @llvm.dbg.declare(metadata [256 x i8]* %xtab, metadata !102, metadata !20), !dbg !106
  %6 = bitcast [256 x i8]* %xtab to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* getelementptr inbounds ([256 x i8]* @bench.xtab, i32 0, i32 0), i64 256, i32 16, i1 false), !dbg !106
  %7 = icmp ne i8* %3, null, !dbg !107
  br i1 %7, label %8, label %10, !dbg !107

; <label>:8                                       ; preds = %0
  %9 = icmp ne i8* %4, null, !dbg !107
  br i1 %9, label %19, label %10, !dbg !107

; <label>:10                                      ; preds = %8, %0
  %11 = icmp ne i8* %3, null, !dbg !108
  %12 = xor i1 %11, true, !dbg !108
  %13 = zext i1 %12 to i32, !dbg !108
  %14 = icmp ne i8* %4, null, !dbg !110
  %15 = xor i1 %14, true, !dbg !110
  %16 = zext i1 %15 to i32, !dbg !110
  %17 = add nsw i32 %13, %16, !dbg !108
  %18 = call i32 @errex(i8* getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 %17), !dbg !111
  br label %119, !dbg !112

; <label>:19                                      ; preds = %8
  %20 = call i8* @fgets(i8* %3, i32 82, %struct._IO_FILE* %1), !dbg !113
  call void @llvm.dbg.value(metadata i8* %20, i64 0, metadata !114, metadata !20), !dbg !115
  %21 = icmp ne i8* %20, null, !dbg !116
  br i1 %21, label %24, label %22, !dbg !116

; <label>:22                                      ; preds = %19
  %23 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str6, i32 0, i32 0), i32 0), !dbg !117
  br label %119, !dbg !119

; <label>:24                                      ; preds = %19
  %25 = load i8* %3, align 1, !dbg !120
  %26 = sext i8 %25 to i32, !dbg !120
  %27 = icmp ne i32 %26, 62, !dbg !120
  br i1 %27, label %28, label %30, !dbg !122

; <label>:28                                      ; preds = %24
  %29 = call i32 @errex(i8* getelementptr inbounds ([17 x i8]* @.str7, i32 0, i32 0), i32 0), !dbg !123
  br label %119, !dbg !124

; <label>:30                                      ; preds = %24
  br label %31, !dbg !125

; <label>:31                                      ; preds = %111, %30
  %qqq.0 = phi i8* [ %4, %30 ], [ %qqq.1, %111 ]
  %pj.0 = phi i8* [ %20, %30 ], [ %37, %111 ]
  %pqstop.0 = phi i8* [ %5, %30 ], [ %pqstop.1, %111 ]
  %32 = icmp ne i8* %pj.0, null, !dbg !125
  br i1 %32, label %33, label %116, !dbg !125

; <label>:33                                      ; preds = %31
  %34 = call i32 @fputs(i8* %3, %struct._IO_FILE* %2), !dbg !126
  %35 = getelementptr inbounds i8* %qqq.0, i64 1, !dbg !128
  call void @llvm.dbg.value(metadata i8* %35, i64 0, metadata !130, metadata !20), !dbg !131
  call void @llvm.dbg.value(metadata i8* %pqstop.0, i64 0, metadata !132, metadata !20), !dbg !133
  br label %36, !dbg !134

; <label>:36                                      ; preds = %91, %33
  %qqq.1 = phi i8* [ %qqq.0, %33 ], [ %qqq.3, %91 ]
  %pr.0 = phi i8* [ %pqstop.0, %33 ], [ %pr.3, %91 ]
  %pq.0 = phi i8* [ %35, %33 ], [ %92, %91 ]
  %pqstop.1 = phi i8* [ %pqstop.0, %33 ], [ %pqstop.3, %91 ]
  %37 = call i8* @fgets(i8* %3, i32 82, %struct._IO_FILE* %1), !dbg !135
  call void @llvm.dbg.value(metadata i8* %37, i64 0, metadata !114, metadata !20), !dbg !115
  %38 = icmp ne i8* %37, null, !dbg !138
  br i1 %38, label %39, label %43, !dbg !138

; <label>:39                                      ; preds = %36
  %40 = load i8* %3, align 1, !dbg !139
  %41 = sext i8 %40 to i32, !dbg !139
  %42 = icmp eq i32 %41, 62, !dbg !139
  br i1 %42, label %43, label %44, !dbg !138

; <label>:43                                      ; preds = %39, %36
  br label %93, !dbg !141

; <label>:44                                      ; preds = %39
  %45 = getelementptr inbounds i8* %pq.0, i64 61, !dbg !144
  %46 = icmp ule i8* %pr.0, %45, !dbg !146
  br i1 %46, label %47, label %76, !dbg !147

; <label>:47                                      ; preds = %44
  %48 = getelementptr inbounds i8* %pqstop.1, i64 12777888, !dbg !148
  call void @llvm.dbg.value(metadata i8* %48, i64 0, metadata !150, metadata !20), !dbg !151
  %49 = ptrtoint i8* %48 to i64, !dbg !152
  %50 = ptrtoint i8* %qqq.1 to i64, !dbg !152
  %51 = sub i64 %49, %50, !dbg !152
  %52 = call i8* @realloc(i8* %qqq.1, i64 %51) #4, !dbg !153
  call void @llvm.dbg.value(metadata i8* %52, i64 0, metadata !154, metadata !20), !dbg !155
  %53 = icmp ne i8* %52, null, !dbg !156
  br i1 %53, label %56, label %54, !dbg !156

; <label>:54                                      ; preds = %47
  %55 = call i32 @errex(i8* getelementptr inbounds ([14 x i8]* @.str8, i32 0, i32 0), i32 0), !dbg !157
  br label %119, !dbg !159

; <label>:56                                      ; preds = %47
  %57 = icmp ne i8* %52, %qqq.1, !dbg !160
  br i1 %57, label %58, label %67, !dbg !162

; <label>:58                                      ; preds = %56
  %59 = ptrtoint i8* %52 to i64, !dbg !163
  %60 = ptrtoint i8* %qqq.1 to i64, !dbg !163
  %61 = sub i64 %59, %60, !dbg !163
  call void @llvm.dbg.value(metadata i64 %61, i64 0, metadata !165, metadata !20), !dbg !166
  %62 = getelementptr inbounds i8* %pq.0, i64 %61, !dbg !167
  call void @llvm.dbg.value(metadata i8* %62, i64 0, metadata !130, metadata !20), !dbg !131
  %63 = getelementptr inbounds i8* %pr.0, i64 %61, !dbg !168
  call void @llvm.dbg.value(metadata i8* %63, i64 0, metadata !132, metadata !20), !dbg !133
  %64 = getelementptr inbounds i8* %qqq.1, i64 %61, !dbg !169
  call void @llvm.dbg.value(metadata i8* %64, i64 0, metadata !97, metadata !20), !dbg !98
  %65 = getelementptr inbounds i8* %48, i64 %61, !dbg !170
  call void @llvm.dbg.value(metadata i8* %65, i64 0, metadata !150, metadata !20), !dbg !151
  %66 = getelementptr inbounds i8* %pqstop.1, i64 %61, !dbg !171
  call void @llvm.dbg.value(metadata i8* %66, i64 0, metadata !100, metadata !20), !dbg !101
  br label %67, !dbg !172

; <label>:67                                      ; preds = %58, %56
  %qqq.2 = phi i8* [ %64, %58 ], [ %qqq.1, %56 ]
  %pr.1 = phi i8* [ %63, %58 ], [ %pr.0, %56 ]
  %pq.1 = phi i8* [ %62, %58 ], [ %pq.0, %56 ]
  %pqstop.2 = phi i8* [ %66, %58 ], [ %pqstop.1, %56 ]
  %newstop.0 = phi i8* [ %65, %58 ], [ %48, %56 ]
  %68 = ptrtoint i8* %pqstop.2 to i64, !dbg !173
  %69 = ptrtoint i8* %pr.1 to i64, !dbg !173
  %70 = sub i64 %68, %69, !dbg !173
  %71 = sub i64 0, %70, !dbg !174
  %72 = getelementptr inbounds i8* %newstop.0, i64 %71, !dbg !174
  %73 = ptrtoint i8* %pqstop.2 to i64, !dbg !175
  %74 = ptrtoint i8* %pr.1 to i64, !dbg !175
  %75 = sub i64 %73, %74, !dbg !175
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %72, i8* %pr.1, i64 %75, i32 1, i1 false), !dbg !176
  call void @llvm.dbg.value(metadata i8* %72, i64 0, metadata !132, metadata !20), !dbg !133
  call void @llvm.dbg.value(metadata i8* %newstop.0, i64 0, metadata !100, metadata !20), !dbg !101
  br label %76, !dbg !177

; <label>:76                                      ; preds = %67, %44
  %qqq.3 = phi i8* [ %qqq.2, %67 ], [ %qqq.1, %44 ]
  %pr.2 = phi i8* [ %72, %67 ], [ %pr.0, %44 ]
  %pq.2 = phi i8* [ %pq.1, %67 ], [ %pq.0, %44 ]
  %pqstop.3 = phi i8* [ %newstop.0, %67 ], [ %pqstop.1, %44 ]
  br label %77, !dbg !178

; <label>:77                                      ; preds = %89, %76
  %pr.3 = phi i8* [ %pr.2, %76 ], [ %pr.4, %89 ]
  %pj.1 = phi i8* [ %37, %76 ], [ %81, %89 ]
  %78 = load i8* %pj.1, align 1, !dbg !179
  %79 = icmp ne i8 %78, 0, !dbg !178
  br i1 %79, label %80, label %90, !dbg !178

; <label>:80                                      ; preds = %77
  %81 = getelementptr inbounds i8* %pj.1, i32 1, !dbg !180
  call void @llvm.dbg.value(metadata i8* %81, i64 0, metadata !114, metadata !20), !dbg !115
  %82 = load i8* %pj.1, align 1, !dbg !182
  %83 = zext i8 %82 to i64, !dbg !183
  %84 = getelementptr inbounds [256 x i8]* %xtab, i32 0, i64 %83, !dbg !183
  %85 = load i8* %84, align 1, !dbg !183
  call void @llvm.dbg.value(metadata i8 %85, i64 0, metadata !184, metadata !20), !dbg !185
  %86 = icmp ne i8 %85, 0, !dbg !186
  br i1 %86, label %87, label %89, !dbg !186

; <label>:87                                      ; preds = %80
  %88 = getelementptr inbounds i8* %pr.3, i32 -1, !dbg !187
  call void @llvm.dbg.value(metadata i8* %88, i64 0, metadata !132, metadata !20), !dbg !133
  store i8 %85, i8* %88, align 1, !dbg !189
  br label %89, !dbg !189

; <label>:89                                      ; preds = %87, %80
  %pr.4 = phi i8* [ %88, %87 ], [ %pr.3, %80 ]
  br label %77, !dbg !178

; <label>:90                                      ; preds = %77
  br label %91, !dbg !190

; <label>:91                                      ; preds = %90
  %92 = getelementptr inbounds i8* %pq.2, i32 1, !dbg !191
  call void @llvm.dbg.value(metadata i8* %92, i64 0, metadata !130, metadata !20), !dbg !131
  br label %36, !dbg !192

; <label>:93                                      ; preds = %43
  call void @llvm.dbg.value(metadata i8* %qqq.1, i64 0, metadata !130, metadata !20), !dbg !131
  br label %94, !dbg !193

; <label>:94                                      ; preds = %106, %93
  %pr.5 = phi i8* [ %pr.0, %93 ], [ %108, %106 ]
  %pq.3 = phi i8* [ %qqq.1, %93 ], [ %110, %106 ]
  %95 = icmp ult i8* %pr.5, %pqstop.1, !dbg !195
  br i1 %95, label %96, label %111, !dbg !197

; <label>:96                                      ; preds = %94
  %97 = ptrtoint i8* %pqstop.1 to i64, !dbg !198
  %98 = ptrtoint i8* %pr.5 to i64, !dbg !198
  %99 = sub i64 %97, %98, !dbg !198
  %100 = icmp slt i64 %99, 60, !dbg !200
  br i1 %100, label %101, label %105, !dbg !200

; <label>:101                                     ; preds = %96
  %102 = ptrtoint i8* %pqstop.1 to i64, !dbg !201
  %103 = ptrtoint i8* %pr.5 to i64, !dbg !201
  %104 = sub i64 %102, %103, !dbg !201
  br label %106, !dbg !200

; <label>:105                                     ; preds = %96
  br label %106, !dbg !202

; <label>:106                                     ; preds = %105, %101
  %107 = phi i64 [ %104, %101 ], [ 60, %105 ], !dbg !200
  call void @llvm.dbg.value(metadata i64 %107, i64 0, metadata !204, metadata !20), !dbg !205
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %pq.3, i8* %pr.5, i64 %107, i32 1, i1 false), !dbg !206
  %108 = getelementptr inbounds i8* %pr.5, i64 %107, !dbg !207
  call void @llvm.dbg.value(metadata i8* %108, i64 0, metadata !132, metadata !20), !dbg !133
  %109 = getelementptr inbounds i8* %pq.3, i64 %107, !dbg !208
  call void @llvm.dbg.value(metadata i8* %109, i64 0, metadata !130, metadata !20), !dbg !131
  %110 = getelementptr inbounds i8* %109, i32 1, !dbg !209
  call void @llvm.dbg.value(metadata i8* %110, i64 0, metadata !130, metadata !20), !dbg !131
  store i8 10, i8* %109, align 1, !dbg !210
  br label %94, !dbg !211

; <label>:111                                     ; preds = %94
  %112 = ptrtoint i8* %pq.3 to i64, !dbg !212
  %113 = ptrtoint i8* %qqq.1 to i64, !dbg !212
  %114 = sub i64 %112, %113, !dbg !212
  %115 = call i64 @fwrite(i8* %qqq.1, i64 1, i64 %114, %struct._IO_FILE* %2), !dbg !213
  br label %31, !dbg !125

; <label>:116                                     ; preds = %31
  %117 = call i32 @fclose(%struct._IO_FILE* %1), !dbg !214
  %118 = call i32 @fclose(%struct._IO_FILE* %2), !dbg !215
  br label %119, !dbg !216

; <label>:119                                     ; preds = %116, %54, %28, %22, %10
  %.0 = phi i32 [ %29, %28 ], [ %55, %54 ], [ 0, %116 ], [ %23, %22 ], [ %18, %10 ]
  ret i32 %.0, !dbg !217
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

declare i32 @fputs(i8*, %struct._IO_FILE*) #2

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #3

; Function Attrs: nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c] [DW_LANG_C99]
!1 = !{!"code.c", !"/media/llvm/OSR/shootout/reverse-complement/C"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!5 = !{!6, !13}
!6 = !{!"0x2e\00errex\00errex\00\0016\000\001\000\000\00256\000\0016", !1, !7, !8, null, i32 (i8*, i32)* @errex, null, null, !2} ; [ DW_TAG_subprogram ] [line 16] [def] [errex]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!10, !11, !10}
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = !{!"0x2e\00bench\00bench\00\0021\000\001\000\000\000\000\0021", !1, !7, !14, null, i32 ()* @bench, null, null, !2} ; [ DW_TAG_subprogram ] [line 21] [def] [bench]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{!10}
!16 = !{i32 2, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 2}
!18 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!19 = !{!"0x101\00s\0016777232\000", !6, !7, !11} ; [ DW_TAG_arg_variable ] [s] [line 16]
!20 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!21 = !MDLocation(line: 16, column: 17, scope: !6)
!22 = !{!"0x101\00n\0033554448\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [n] [line 16]
!23 = !MDLocation(line: 16, column: 24, scope: !6)
!24 = !MDLocation(line: 17, column: 11, scope: !6)
!25 = !MDLocation(line: 17, column: 3, scope: !6)
!26 = !MDLocation(line: 18, column: 3, scope: !6)
!27 = !MDLocation(line: 22, column: 21, scope: !13)
!28 = !{!"0x100\00inputFile\0022\000", !13, !7, !29} ; [ DW_TAG_auto_variable ] [inputFile] [line 22]
!29 = !{!"0xf\00\000\0064\0064\000\000", null, null, !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!30 = !{!"0x16\00FILE\0048\000\000\000\000", !31, null, !32} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!31 = !{!"/usr/include/stdio.h", !"/media/llvm/OSR/shootout/reverse-complement/C"}
!32 = !{!"0x13\00_IO_FILE\00245\001728\0064\000\000\000", !33, null, null, !34, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!33 = !{!"/usr/include/libio.h", !"/media/llvm/OSR/shootout/reverse-complement/C"}
!34 = !{!35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !55, !56, !57, !58, !62, !64, !66, !70, !73, !75, !77, !78, !79, !80, !84, !85}
!35 = !{!"0xd\00_flags\00246\0032\0032\000\000", !33, !32, !10} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!36 = !{!"0xd\00_IO_read_ptr\00251\0064\0064\0064\000", !33, !32, !11} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!37 = !{!"0xd\00_IO_read_end\00252\0064\0064\00128\000", !33, !32, !11} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!38 = !{!"0xd\00_IO_read_base\00253\0064\0064\00192\000", !33, !32, !11} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!39 = !{!"0xd\00_IO_write_base\00254\0064\0064\00256\000", !33, !32, !11} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!40 = !{!"0xd\00_IO_write_ptr\00255\0064\0064\00320\000", !33, !32, !11} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!41 = !{!"0xd\00_IO_write_end\00256\0064\0064\00384\000", !33, !32, !11} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!42 = !{!"0xd\00_IO_buf_base\00257\0064\0064\00448\000", !33, !32, !11} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!43 = !{!"0xd\00_IO_buf_end\00258\0064\0064\00512\000", !33, !32, !11} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!44 = !{!"0xd\00_IO_save_base\00260\0064\0064\00576\000", !33, !32, !11} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!45 = !{!"0xd\00_IO_backup_base\00261\0064\0064\00640\000", !33, !32, !11} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!46 = !{!"0xd\00_IO_save_end\00262\0064\0064\00704\000", !33, !32, !11} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!47 = !{!"0xd\00_markers\00264\0064\0064\00768\000", !33, !32, !48} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!48 = !{!"0xf\00\000\0064\0064\000\000", null, null, !49} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!49 = !{!"0x13\00_IO_marker\00160\00192\0064\000\000\000", !33, null, null, !50, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [def] [from ]
!50 = !{!51, !52, !54}
!51 = !{!"0xd\00_next\00161\0064\0064\000\000", !33, !49, !48} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!52 = !{!"0xd\00_sbuf\00162\0064\0064\0064\000", !33, !49, !53} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!53 = !{!"0xf\00\000\0064\0064\000\000", null, null, !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!54 = !{!"0xd\00_pos\00166\0032\0032\00128\000", !33, !49, !10} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!55 = !{!"0xd\00_chain\00266\0064\0064\00832\000", !33, !32, !53} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!56 = !{!"0xd\00_fileno\00268\0032\0032\00896\000", !33, !32, !10} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!57 = !{!"0xd\00_flags2\00272\0032\0032\00928\000", !33, !32, !10} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!58 = !{!"0xd\00_old_offset\00274\0064\0064\00960\000", !33, !32, !59} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!59 = !{!"0x16\00__off_t\00131\000\000\000\000", !60, null, !61} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!60 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/media/llvm/OSR/shootout/reverse-complement/C"}
!61 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!62 = !{!"0xd\00_cur_column\00278\0016\0016\001024\000", !33, !32, !63} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!63 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!64 = !{!"0xd\00_vtable_offset\00279\008\008\001040\000", !33, !32, !65} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!65 = !{!"0x24\00signed char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!66 = !{!"0xd\00_shortbuf\00280\008\008\001048\000", !33, !32, !67} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!67 = !{!"0x1\00\000\008\008\000\000\000", null, null, !12, !68, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!68 = !{!69}
!69 = !{!"0x21\000\001"}                          ; [ DW_TAG_subrange_type ] [0, 0]
!70 = !{!"0xd\00_lock\00284\0064\0064\001088\000", !33, !32, !71} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!71 = !{!"0xf\00\000\0064\0064\000\000", null, null, !72} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_lock_t]
!72 = !{!"0x16\00_IO_lock_t\00154\000\000\000\000", !33, null, null} ; [ DW_TAG_typedef ] [_IO_lock_t] [line 154, size 0, align 0, offset 0] [from ]
!73 = !{!"0xd\00_offset\00293\0064\0064\001152\000", !33, !32, !74} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!74 = !{!"0x16\00__off64_t\00132\000\000\000\000", !60, null, !61} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!75 = !{!"0xd\00__pad1\00302\0064\0064\001216\000", !33, !32, !76} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!76 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!77 = !{!"0xd\00__pad2\00303\0064\0064\001280\000", !33, !32, !76} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!78 = !{!"0xd\00__pad3\00304\0064\0064\001344\000", !33, !32, !76} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!79 = !{!"0xd\00__pad4\00305\0064\0064\001408\000", !33, !32, !76} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!80 = !{!"0xd\00__pad5\00306\0064\0064\001472\000", !33, !32, !81} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!81 = !{!"0x16\00size_t\0062\000\000\000\000", !82, null, !83} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!82 = !{!"/usr/local/bin/../lib/clang/3.6.2/include/stddef.h", !"/media/llvm/OSR/shootout/reverse-complement/C"}
!83 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!84 = !{!"0xd\00_mode\00308\0032\0032\001536\000", !33, !32, !10} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!85 = !{!"0xd\00_unused2\00310\00160\008\001568\000", !33, !32, !86} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!86 = !{!"0x1\00\000\00160\008\000\000\000", null, null, !12, !87, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!87 = !{!88}
!88 = !{!"0x21\000\0020"}                         ; [ DW_TAG_subrange_type ] [0, 19]
!89 = !MDLocation(line: 22, column: 9, scope: !13)
!90 = !MDLocation(line: 23, column: 21, scope: !13)
!91 = !{!"0x100\00outStream\0023\000", !13, !7, !29} ; [ DW_TAG_auto_variable ] [outStream] [line 23]
!92 = !MDLocation(line: 23, column: 9, scope: !13)
!93 = !MDLocation(line: 25, column: 15, scope: !13)
!94 = !{!"0x100\00jjj\0025\000", !13, !7, !11}    ; [ DW_TAG_auto_variable ] [jjj] [line 25]
!95 = !MDLocation(line: 25, column: 9, scope: !13)
!96 = !MDLocation(line: 26, column: 15, scope: !13)
!97 = !{!"0x100\00qqq\0026\000", !13, !7, !11}    ; [ DW_TAG_auto_variable ] [qqq] [line 26]
!98 = !MDLocation(line: 26, column: 9, scope: !13)
!99 = !MDLocation(line: 27, column: 18, scope: !13)
!100 = !{!"0x100\00pqstop\0027\000", !13, !7, !11} ; [ DW_TAG_auto_variable ] [pqstop] [line 27]
!101 = !MDLocation(line: 27, column: 9, scope: !13)
!102 = !{!"0x100\00xtab\0028\000", !13, !7, !103} ; [ DW_TAG_auto_variable ] [xtab] [line 28]
!103 = !{!"0x1\00\000\002048\008\000\000\000", null, null, !12, !104, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!104 = !{!105}
!105 = !{!"0x21\000\00256"}                       ; [ DW_TAG_subrange_type ] [0, 255]
!106 = !MDLocation(line: 28, column: 8, scope: !13)
!107 = !MDLocation(line: 30, column: 7, scope: !13)
!108 = !MDLocation(line: 31, column: 39, scope: !109)
!109 = !{!"0xb\0030\007\000", !1, !13}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!110 = !MDLocation(line: 31, column: 46, scope: !109)
!111 = !MDLocation(line: 31, column: 12, scope: !109)
!112 = !MDLocation(line: 31, column: 5, scope: !109)
!113 = !MDLocation(line: 32, column: 8, scope: !13)
!114 = !{!"0x100\00pj\0024\000", !13, !7, !11}    ; [ DW_TAG_auto_variable ] [pj] [line 24]
!115 = !MDLocation(line: 24, column: 9, scope: !13)
!116 = !MDLocation(line: 33, column: 7, scope: !13)
!117 = !MDLocation(line: 34, column: 12, scope: !118)
!118 = !{!"0xb\0033\007\001", !1, !13}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!119 = !MDLocation(line: 34, column: 5, scope: !118)
!120 = !MDLocation(line: 35, column: 7, scope: !121)
!121 = !{!"0xb\0035\007\002", !1, !13}            ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!122 = !MDLocation(line: 35, column: 7, scope: !13)
!123 = !MDLocation(line: 36, column: 12, scope: !121)
!124 = !MDLocation(line: 36, column: 5, scope: !121)
!125 = !MDLocation(line: 38, column: 3, scope: !13)
!126 = !MDLocation(line: 39, column: 5, scope: !127)
!127 = !{!"0xb\0038\0014\003", !1, !13}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!128 = !MDLocation(line: 41, column: 13, scope: !129)
!129 = !{!"0xb\0041\005\004", !1, !127}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!130 = !{!"0x100\00pq\0024\000", !13, !7, !11}    ; [ DW_TAG_auto_variable ] [pq] [line 24]
!131 = !MDLocation(line: 24, column: 14, scope: !13)
!132 = !{!"0x100\00pr\0024\000", !13, !7, !11}    ; [ DW_TAG_auto_variable ] [pr] [line 24]
!133 = !MDLocation(line: 24, column: 19, scope: !13)
!134 = !MDLocation(line: 41, column: 10, scope: !129)
!135 = !MDLocation(line: 42, column: 12, scope: !136)
!136 = !{!"0xb\0041\0039\006", !1, !137}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!137 = !{!"0xb\0041\005\005", !1, !129}           ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!138 = !MDLocation(line: 43, column: 11, scope: !136)
!139 = !MDLocation(line: 43, column: 19, scope: !140)
!140 = !{!"0xb\0043\0011\007", !1, !136}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!141 = !MDLocation(line: 43, column: 32, scope: !142)
!142 = !{!"0xb\003", !1, !143}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!143 = !{!"0xb\002", !1, !140}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!144 = !MDLocation(line: 44, column: 18, scope: !145)
!145 = !{!"0xb\0044\0011\008", !1, !136}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!146 = !MDLocation(line: 44, column: 11, scope: !145)
!147 = !MDLocation(line: 44, column: 11, scope: !136)
!148 = !MDLocation(line: 45, column: 25, scope: !149)
!149 = !{!"0xb\0044\0026\009", !1, !145}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!150 = !{!"0x100\00newstop\0045\000", !149, !7, !11} ; [ DW_TAG_auto_variable ] [newstop] [line 45]
!151 = !MDLocation(line: 45, column: 15, scope: !149)
!152 = !MDLocation(line: 46, column: 38, scope: !149)
!153 = !MDLocation(line: 46, column: 25, scope: !149)
!154 = !{!"0x100\00newptr\0046\000", !149, !7, !11} ; [ DW_TAG_auto_variable ] [newptr] [line 46]
!155 = !MDLocation(line: 46, column: 15, scope: !149)
!156 = !MDLocation(line: 47, column: 13, scope: !149)
!157 = !MDLocation(line: 48, column: 18, scope: !158)
!158 = !{!"0xb\0047\0013\0010", !1, !149}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!159 = !MDLocation(line: 48, column: 11, scope: !158)
!160 = !MDLocation(line: 49, column: 13, scope: !161)
!161 = !{!"0xb\0049\0013\0011", !1, !149}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!162 = !MDLocation(line: 49, column: 13, scope: !149)
!163 = !MDLocation(line: 50, column: 22, scope: !164)
!164 = !{!"0xb\0049\0028\0012", !1, !161}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!165 = !{!"0x100\00x\0050\000", !164, !7, !81}    ; [ DW_TAG_auto_variable ] [x] [line 50]
!166 = !MDLocation(line: 50, column: 18, scope: !164)
!167 = !MDLocation(line: 51, column: 11, scope: !164)
!168 = !MDLocation(line: 51, column: 19, scope: !164)
!169 = !MDLocation(line: 51, column: 27, scope: !164)
!170 = !MDLocation(line: 52, column: 11, scope: !164)
!171 = !MDLocation(line: 52, column: 24, scope: !164)
!172 = !MDLocation(line: 53, column: 9, scope: !164)
!173 = !MDLocation(line: 54, column: 41, scope: !149)
!174 = !MDLocation(line: 54, column: 32, scope: !149)
!175 = !MDLocation(line: 54, column: 57, scope: !149)
!176 = !MDLocation(line: 54, column: 14, scope: !149)
!177 = !MDLocation(line: 56, column: 7, scope: !149)
!178 = !MDLocation(line: 57, column: 7, scope: !136)
!179 = !MDLocation(line: 57, column: 14, scope: !136)
!180 = !MDLocation(line: 58, column: 40, scope: !181)
!181 = !{!"0xb\0057\0019\0013", !1, !136}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!182 = !MDLocation(line: 58, column: 39, scope: !181)
!183 = !MDLocation(line: 58, column: 18, scope: !181)
!184 = !{!"0x100\00c\0058\000", !181, !7, !12}    ; [ DW_TAG_auto_variable ] [c] [line 58]
!185 = !MDLocation(line: 58, column: 14, scope: !181)
!186 = !MDLocation(line: 59, column: 13, scope: !181)
!187 = !MDLocation(line: 60, column: 13, scope: !188)
!188 = !{!"0xb\0059\0013\0014", !1, !181}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!189 = !MDLocation(line: 60, column: 11, scope: !188)
!190 = !MDLocation(line: 62, column: 5, scope: !136)
!191 = !MDLocation(line: 41, column: 33, scope: !137)
!192 = !MDLocation(line: 41, column: 5, scope: !137)
!193 = !MDLocation(line: 64, column: 10, scope: !194)
!194 = !{!"0xb\0064\005\0015", !1, !127}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!195 = !MDLocation(line: 64, column: 20, scope: !196)
!196 = !{!"0xb\0064\005\0016", !1, !194}          ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!197 = !MDLocation(line: 64, column: 5, scope: !194)
!198 = !MDLocation(line: 65, column: 19, scope: !199)
!199 = !{!"0xb\0064\0033\0017", !1, !196}         ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!200 = !MDLocation(line: 65, column: 18, scope: !199)
!201 = !MDLocation(line: 65, column: 35, scope: !199)
!202 = !MDLocation(line: 65, column: 18, scope: !203)
!203 = !{!"0xb\002", !1, !199}                    ; [ DW_TAG_lexical_block ] [/media/llvm/OSR/shootout/reverse-complement/C/code.c]
!204 = !{!"0x100\00x\0065\000", !199, !7, !81}    ; [ DW_TAG_auto_variable ] [x] [line 65]
!205 = !MDLocation(line: 65, column: 14, scope: !199)
!206 = !MDLocation(line: 66, column: 7, scope: !199)
!207 = !MDLocation(line: 67, column: 7, scope: !199)
!208 = !MDLocation(line: 67, column: 15, scope: !199)
!209 = !MDLocation(line: 67, column: 25, scope: !199)
!210 = !MDLocation(line: 67, column: 23, scope: !199)
!211 = !MDLocation(line: 64, column: 5, scope: !196)
!212 = !MDLocation(line: 69, column: 20, scope: !127)
!213 = !MDLocation(line: 69, column: 5, scope: !127)
!214 = !MDLocation(line: 72, column: 3, scope: !13)
!215 = !MDLocation(line: 73, column: 3, scope: !13)
!216 = !MDLocation(line: 74, column: 3, scope: !13)
!217 = !MDLocation(line: 75, column: 1, scope: !13)
