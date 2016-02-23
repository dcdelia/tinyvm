; ModuleID = 'SearchGame-dbg.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.hashentry = type { i64 }
%struct.rusage = type { %struct.timeval, %struct.timeval, %union.anon, %union.anon.0, %union.anon.1, %union.anon.2, %union.anon.3, %union.anon.4, %union.anon.5, %union.anon.6, %union.anon.7, %union.anon.8, %union.anon.9, %union.anon.10, %union.anon.11, %union.anon.12 }
%struct.timeval = type { i64, i64 }
%union.anon = type { i64 }
%union.anon.0 = type { i64 }
%union.anon.1 = type { i64 }
%union.anon.2 = type { i64 }
%union.anon.3 = type { i64 }
%union.anon.4 = type { i64 }
%union.anon.5 = type { i64 }
%union.anon.6 = type { i64 }
%union.anon.7 = type { i64 }
%union.anon.8 = type { i64 }
%union.anon.9 = type { i64 }
%union.anon.10 = type { i64 }
%union.anon.11 = type { i64 }
%union.anon.12 = type { i64 }

@nplies = common global i32 0, align 4
@color = common global [2 x i64] zeroinitializer, align 16
@height = common global [7 x i8] zeroinitializer, align 1
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@moves = common global [42 x i32] zeroinitializer, align 16
@ht = common global %struct.hashentry* null, align 8
@.str1 = private unnamed_addr constant [30 x i8] c"Failed to allocate %lu bytes\0A\00", align 1
@posed = common global i64 0, align 8
@lock = common global i32 0, align 4
@htindex = common global i32 0, align 4
@.str2 = private unnamed_addr constant [45 x i8] c"- %5.3f  < %5.3f  = %5.3f  > %5.3f  + %5.3f\0A\00", align 1
@history = common global [2 x [49 x i32]] zeroinitializer, align 16
@nodes = common global i64 0, align 8
@bookply = common global i32 0, align 4
@reportply = common global i32 0, align 4
@.str3 = private unnamed_addr constant [6 x i8] c"%c%d\0A\00", align 1
@.str4 = private unnamed_addr constant [7 x i8] c"#-<=>+\00", align 1
@msecs = common global i64 0, align 8
@.str5 = private unnamed_addr constant [20 x i8] c"Fhourstones 3.2 (C)\00", align 1
@.str6 = private unnamed_addr constant [19 x i8] c"Boardsize = %dx%d\0A\00", align 1
@.str7 = private unnamed_addr constant [51 x i8] c"Using %d transposition table entries of size %lu.\0A\00", align 1
@.str8 = private unnamed_addr constant [32 x i8] c"\0ASolving %d-ply position after \00", align 1
@.str9 = private unnamed_addr constant [7 x i8] c" . . .\00", align 1
@.str10 = private unnamed_addr constant [28 x i8] c"score = %d (%c)  work = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [36 x i8] c"%lu pos / %lu msec = %.1f Kpos/sec\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @reset() #0 {
  store i32 0, i32* @nplies, align 4, !dbg !105
  store i64 0, i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 1), align 8, !dbg !106
  store i64 0, i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 0), align 8, !dbg !107
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !108, metadata !109), !dbg !110
  br label %1, !dbg !111

; <label>:1                                       ; preds = %8, %0
  %i.0 = phi i32 [ 0, %0 ], [ %9, %8 ]
  %2 = icmp slt i32 %i.0, 7, !dbg !113
  br i1 %2, label %3, label %10, !dbg !117

; <label>:3                                       ; preds = %1
  %4 = mul nsw i32 7, %i.0, !dbg !118
  %5 = trunc i32 %4 to i8, !dbg !119
  %6 = sext i32 %i.0 to i64, !dbg !120
  %7 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %6, !dbg !120
  store i8 %5, i8* %7, align 1, !dbg !120
  br label %8, !dbg !120

; <label>:8                                       ; preds = %3
  %9 = add nsw i32 %i.0, 1, !dbg !121
  call void @llvm.dbg.value(metadata i32 %9, i64 0, metadata !108, metadata !109), !dbg !110
  br label %1, !dbg !122

; <label>:10                                      ; preds = %1
  ret void, !dbg !123
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @positioncode() #0 {
  %1 = load i32* @nplies, align 4, !dbg !124
  %2 = and i32 %1, 1, !dbg !124
  %3 = sext i32 %2 to i64, !dbg !125
  %4 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %3, !dbg !125
  %5 = load i64* %4, align 8, !dbg !125
  %6 = load i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 0), align 8, !dbg !126
  %7 = add i64 %5, %6, !dbg !125
  %8 = load i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 1), align 8, !dbg !127
  %9 = add i64 %7, %8, !dbg !125
  %10 = add i64 %9, 4432676798593, !dbg !125
  ret i64 %10, !dbg !128
}

; Function Attrs: nounwind uwtable
define void @printMoves() #0 {
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !129, metadata !109), !dbg !130
  br label %1, !dbg !131

; <label>:1                                       ; preds = %10, %0
  %i.0 = phi i32 [ 0, %0 ], [ %11, %10 ]
  %2 = load i32* @nplies, align 4, !dbg !133
  %3 = icmp slt i32 %i.0, %2, !dbg !135
  br i1 %3, label %4, label %12, !dbg !136

; <label>:4                                       ; preds = %1
  %5 = sext i32 %i.0 to i64, !dbg !137
  %6 = getelementptr inbounds [42 x i32]* @moves, i32 0, i64 %5, !dbg !137
  %7 = load i32* %6, align 4, !dbg !137
  %8 = add nsw i32 1, %7, !dbg !138
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %8), !dbg !139
  br label %10, !dbg !139

; <label>:10                                      ; preds = %4
  %11 = add nsw i32 %i.0, 1, !dbg !140
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !129, metadata !109), !dbg !130
  br label %1, !dbg !141

; <label>:12                                      ; preds = %1
  ret void, !dbg !142
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @islegal(i64 %newboard) #0 {
  call void @llvm.dbg.value(metadata i64 %newboard, i64 0, metadata !143, metadata !109), !dbg !144
  %1 = and i64 %newboard, 283691315109952, !dbg !145
  %2 = icmp eq i64 %1, 0, !dbg !146
  %3 = zext i1 %2 to i32, !dbg !146
  ret i32 %3, !dbg !147
}

; Function Attrs: nounwind uwtable
define i32 @isplayable(i32 %col) #0 {
  call void @llvm.dbg.value(metadata i32 %col, i64 0, metadata !148, metadata !109), !dbg !149
  %1 = load i32* @nplies, align 4, !dbg !150
  %2 = and i32 %1, 1, !dbg !150
  %3 = sext i32 %2 to i64, !dbg !151
  %4 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %3, !dbg !151
  %5 = load i64* %4, align 8, !dbg !151
  %6 = sext i32 %col to i64, !dbg !152
  %7 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %6, !dbg !152
  %8 = load i8* %7, align 1, !dbg !152
  %9 = sext i8 %8 to i32, !dbg !152
  %10 = zext i32 %9 to i64, !dbg !153
  %11 = shl i64 1, %10, !dbg !153
  %12 = or i64 %5, %11, !dbg !151
  %13 = call i32 @islegal(i64 %12), !dbg !154
  ret i32 %13, !dbg !155
}

; Function Attrs: nounwind uwtable
define i64 @haswon(i64 %newboard) #0 {
  call void @llvm.dbg.value(metadata i64 %newboard, i64 0, metadata !156, metadata !109), !dbg !157
  %1 = lshr i64 %newboard, 6, !dbg !158
  %2 = and i64 %newboard, %1, !dbg !159
  call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !160, metadata !109), !dbg !161
  %3 = lshr i64 %newboard, 7, !dbg !162
  %4 = and i64 %newboard, %3, !dbg !163
  call void @llvm.dbg.value(metadata i64 %4, i64 0, metadata !164, metadata !109), !dbg !165
  %5 = lshr i64 %newboard, 8, !dbg !166
  %6 = and i64 %newboard, %5, !dbg !167
  call void @llvm.dbg.value(metadata i64 %6, i64 0, metadata !168, metadata !109), !dbg !169
  %7 = lshr i64 %newboard, 1, !dbg !170
  %8 = and i64 %newboard, %7, !dbg !171
  call void @llvm.dbg.value(metadata i64 %8, i64 0, metadata !172, metadata !109), !dbg !173
  %9 = lshr i64 %2, 12, !dbg !174
  %10 = and i64 %2, %9, !dbg !175
  %11 = lshr i64 %4, 14, !dbg !176
  %12 = and i64 %4, %11, !dbg !177
  %13 = or i64 %10, %12, !dbg !178
  %14 = lshr i64 %6, 16, !dbg !179
  %15 = and i64 %6, %14, !dbg !180
  %16 = or i64 %13, %15, !dbg !178
  %17 = lshr i64 %8, 2, !dbg !181
  %18 = and i64 %8, %17, !dbg !182
  %19 = or i64 %16, %18, !dbg !178
  ret i64 %19, !dbg !183
}

; Function Attrs: nounwind uwtable
define i32 @islegalhaswon(i64 %newboard) #0 {
  call void @llvm.dbg.value(metadata i64 %newboard, i64 0, metadata !184, metadata !109), !dbg !185
  %1 = call i32 @islegal(i64 %newboard), !dbg !186
  %2 = icmp ne i32 %1, 0, !dbg !186
  br i1 %2, label %3, label %6, !dbg !186

; <label>:3                                       ; preds = %0
  %4 = call i64 @haswon(i64 %newboard), !dbg !187
  %5 = icmp ne i64 %4, 0, !dbg !186
  br label %6

; <label>:6                                       ; preds = %3, %0
  %7 = phi i1 [ false, %0 ], [ %5, %3 ]
  %8 = zext i1 %7 to i32, !dbg !188
  ret i32 %8, !dbg !190
}

; Function Attrs: nounwind uwtable
define void @backmove() #0 {
  %1 = load i32* @nplies, align 4, !dbg !191
  %2 = add nsw i32 %1, -1, !dbg !191
  store i32 %2, i32* @nplies, align 4, !dbg !191
  %3 = sext i32 %2 to i64, !dbg !192
  %4 = getelementptr inbounds [42 x i32]* @moves, i32 0, i64 %3, !dbg !192
  %5 = load i32* %4, align 4, !dbg !192
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !193, metadata !109), !dbg !194
  %6 = sext i32 %5 to i64, !dbg !195
  %7 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %6, !dbg !195
  %8 = load i8* %7, align 1, !dbg !195
  %9 = add i8 %8, -1, !dbg !195
  store i8 %9, i8* %7, align 1, !dbg !195
  %10 = sext i8 %9 to i32, !dbg !195
  %11 = zext i32 %10 to i64, !dbg !196
  %12 = shl i64 1, %11, !dbg !196
  %13 = load i32* @nplies, align 4, !dbg !197
  %14 = and i32 %13, 1, !dbg !197
  %15 = sext i32 %14 to i64, !dbg !198
  %16 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %15, !dbg !198
  %17 = load i64* %16, align 8, !dbg !198
  %18 = xor i64 %17, %12, !dbg !198
  store i64 %18, i64* %16, align 8, !dbg !198
  ret void, !dbg !199
}

; Function Attrs: nounwind uwtable
define void @makemove(i32 %n) #0 {
  call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !200, metadata !109), !dbg !201
  %1 = sext i32 %n to i64, !dbg !202
  %2 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %1, !dbg !202
  %3 = load i8* %2, align 1, !dbg !202
  %4 = add i8 %3, 1, !dbg !202
  store i8 %4, i8* %2, align 1, !dbg !202
  %5 = sext i8 %3 to i32, !dbg !202
  %6 = zext i32 %5 to i64, !dbg !203
  %7 = shl i64 1, %6, !dbg !203
  %8 = load i32* @nplies, align 4, !dbg !204
  %9 = and i32 %8, 1, !dbg !204
  %10 = sext i32 %9 to i64, !dbg !205
  %11 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %10, !dbg !205
  %12 = load i64* %11, align 8, !dbg !205
  %13 = xor i64 %12, %7, !dbg !205
  store i64 %13, i64* %11, align 8, !dbg !205
  %14 = load i32* @nplies, align 4, !dbg !206
  %15 = add nsw i32 %14, 1, !dbg !206
  store i32 %15, i32* @nplies, align 4, !dbg !206
  %16 = sext i32 %14 to i64, !dbg !207
  %17 = getelementptr inbounds [42 x i32]* @moves, i32 0, i64 %16, !dbg !207
  store i32 %n, i32* %17, align 4, !dbg !207
  ret void, !dbg !208
}

; Function Attrs: nounwind uwtable
define void @trans_init() #0 {
  %1 = call noalias i8* @calloc(i64 8306069, i64 8) #5, !dbg !209
  %2 = bitcast i8* %1 to %struct.hashentry*, !dbg !210
  store %struct.hashentry* %2, %struct.hashentry** @ht, align 8, !dbg !211
  %3 = load %struct.hashentry** @ht, align 8, !dbg !212
  %4 = icmp ne %struct.hashentry* %3, null, !dbg !214
  br i1 %4, label %7, label %5, !dbg !214

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i32 0, i32 0), i64 66448552), !dbg !215
  call void @exit(i32 0) #6, !dbg !217
  unreachable, !dbg !217

; <label>:7                                       ; preds = %0
  ret void, !dbg !218
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind uwtable
define void @emptyTT() #0 {
  %1 = alloca %struct.hashentry, align 4
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !219, metadata !109), !dbg !220
  br label %2, !dbg !221

; <label>:2                                       ; preds = %25, %0
  %i.0 = phi i32 [ 0, %0 ], [ %26, %25 ]
  %3 = icmp slt i32 %i.0, 8306069, !dbg !223
  br i1 %3, label %4, label %27, !dbg !227

; <label>:4                                       ; preds = %2
  %5 = sext i32 %i.0 to i64, !dbg !228
  %6 = load %struct.hashentry** @ht, align 8, !dbg !228
  %7 = getelementptr inbounds %struct.hashentry* %6, i64 %5, !dbg !228
  %8 = bitcast %struct.hashentry* %1 to i64*, !dbg !228
  %9 = load i64* %8, align 4, !dbg !228
  %10 = and i64 %9, -67108864, !dbg !228
  store i64 %10, i64* %8, align 4, !dbg !228
  %11 = bitcast %struct.hashentry* %1 to i64*, !dbg !228
  %12 = load i64* %11, align 4, !dbg !228
  %13 = and i64 %12, -4227858433, !dbg !228
  store i64 %13, i64* %11, align 4, !dbg !228
  %14 = bitcast %struct.hashentry* %1 to i64*, !dbg !228
  %15 = load i64* %14, align 4, !dbg !228
  %16 = and i64 %15, -288230371856744449, !dbg !228
  store i64 %16, i64* %14, align 4, !dbg !228
  %17 = bitcast %struct.hashentry* %1 to i64*, !dbg !228
  %18 = load i64* %17, align 4, !dbg !228
  %19 = and i64 %18, -2017612633061982209, !dbg !228
  store i64 %19, i64* %17, align 4, !dbg !228
  %20 = bitcast %struct.hashentry* %1 to i64*, !dbg !228
  %21 = load i64* %20, align 4, !dbg !228
  %22 = and i64 %21, 2305843009213693951, !dbg !228
  store i64 %22, i64* %20, align 4, !dbg !228
  %23 = bitcast %struct.hashentry* %7 to i8*, !dbg !228
  %24 = bitcast %struct.hashentry* %1 to i8*, !dbg !228
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %24, i64 8, i32 4, i1 false), !dbg !228
  br label %25, !dbg !230

; <label>:25                                      ; preds = %4
  %26 = add nsw i32 %i.0, 1, !dbg !231
  call void @llvm.dbg.value(metadata i32 %26, i64 0, metadata !219, metadata !109), !dbg !220
  br label %2, !dbg !232

; <label>:27                                      ; preds = %2
  store i64 0, i64* @posed, align 8, !dbg !233
  ret void, !dbg !234
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: nounwind uwtable
define void @hash() #0 {
  %1 = call i64 @positioncode(), !dbg !235
  call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !236, metadata !109), !dbg !237
  %2 = load i32* @nplies, align 4, !dbg !238
  %3 = icmp slt i32 %2, 10, !dbg !238
  br i1 %3, label %4, label %17, !dbg !240

; <label>:4                                       ; preds = %0
  call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !241, metadata !109), !dbg !243
  call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !244, metadata !109), !dbg !245
  br label %5, !dbg !246

; <label>:5                                       ; preds = %11, %4
  %htemp2.0 = phi i64 [ 0, %4 ], [ %10, %11 ]
  %htmp.0 = phi i64 [ %1, %4 ], [ %12, %11 ]
  %6 = icmp ne i64 %htmp.0, 0, !dbg !248
  br i1 %6, label %7, label %13, !dbg !252

; <label>:7                                       ; preds = %5
  %8 = shl i64 %htemp2.0, 7, !dbg !253
  %9 = and i64 %htmp.0, 127, !dbg !254
  %10 = or i64 %8, %9, !dbg !253
  call void @llvm.dbg.value(metadata i64 %10, i64 0, metadata !241, metadata !109), !dbg !243
  br label %11, !dbg !255

; <label>:11                                      ; preds = %7
  %12 = lshr i64 %htmp.0, 7, !dbg !256
  call void @llvm.dbg.value(metadata i64 %12, i64 0, metadata !244, metadata !109), !dbg !245
  br label %5, !dbg !257

; <label>:13                                      ; preds = %5
  %14 = icmp ult i64 %htemp2.0, %1, !dbg !258
  br i1 %14, label %15, label %16, !dbg !260

; <label>:15                                      ; preds = %13
  call void @llvm.dbg.value(metadata i64 %htemp2.0, i64 0, metadata !236, metadata !109), !dbg !237
  br label %16, !dbg !261

; <label>:16                                      ; preds = %15, %13
  %htemp.0 = phi i64 [ %htemp2.0, %15 ], [ %1, %13 ]
  br label %17, !dbg !262

; <label>:17                                      ; preds = %16, %0
  %htemp.1 = phi i64 [ %htemp.0, %16 ], [ %1, %0 ]
  %18 = lshr i64 %htemp.1, 23, !dbg !263
  %19 = trunc i64 %18 to i32, !dbg !264
  store i32 %19, i32* @lock, align 4, !dbg !265
  %20 = urem i64 %htemp.1, 8306069, !dbg !266
  %21 = trunc i64 %20 to i32, !dbg !267
  store i32 %21, i32* @htindex, align 4, !dbg !268
  ret void, !dbg !269
}

; Function Attrs: nounwind uwtable
define i32 @transpose() #0 {
  %he = alloca %struct.hashentry, align 4
  call void @llvm.dbg.declare(metadata %struct.hashentry* %he, metadata !270, metadata !109), !dbg !271
  call void @hash(), !dbg !272
  %1 = load i32* @htindex, align 4, !dbg !273
  %2 = zext i32 %1 to i64, !dbg !274
  %3 = load %struct.hashentry** @ht, align 8, !dbg !275
  %4 = getelementptr inbounds %struct.hashentry* %3, i64 %2, !dbg !274
  %5 = bitcast %struct.hashentry* %he to i8*, !dbg !274
  %6 = bitcast %struct.hashentry* %4 to i8*, !dbg !274
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 8, i32 4, i1 false), !dbg !274
  %7 = bitcast %struct.hashentry* %he to i64*, !dbg !276
  %8 = load i64* %7, align 4, !dbg !276
  %9 = and i64 %8, 67108863, !dbg !276
  %10 = trunc i64 %9 to i32, !dbg !276
  %11 = load i32* @lock, align 4, !dbg !278
  %12 = icmp eq i32 %10, %11, !dbg !276
  br i1 %12, label %13, label %18, !dbg !279

; <label>:13                                      ; preds = %0
  %14 = bitcast %struct.hashentry* %he to i64*, !dbg !280
  %15 = load i64* %14, align 4, !dbg !280
  %16 = lshr i64 %15, 61, !dbg !280
  %17 = trunc i64 %16 to i32, !dbg !280
  br label %33, !dbg !281

; <label>:18                                      ; preds = %0
  %19 = bitcast %struct.hashentry* %he to i64*, !dbg !282
  %20 = load i64* %19, align 4, !dbg !282
  %21 = lshr i64 %20, 32, !dbg !282
  %22 = and i64 %21, 67108863, !dbg !282
  %23 = trunc i64 %22 to i32, !dbg !282
  %24 = load i32* @lock, align 4, !dbg !284
  %25 = icmp eq i32 %23, %24, !dbg !282
  br i1 %25, label %26, label %32, !dbg !285

; <label>:26                                      ; preds = %18
  %27 = bitcast %struct.hashentry* %he to i64*, !dbg !286
  %28 = load i64* %27, align 4, !dbg !286
  %29 = lshr i64 %28, 58, !dbg !286
  %30 = and i64 %29, 7, !dbg !286
  %31 = trunc i64 %30 to i32, !dbg !286
  br label %33, !dbg !287

; <label>:32                                      ; preds = %18
  br label %33, !dbg !288

; <label>:33                                      ; preds = %32, %26, %13
  %.0 = phi i32 [ %17, %13 ], [ %31, %26 ], [ 0, %32 ]
  ret i32 %.0, !dbg !289
}

; Function Attrs: nounwind uwtable
define void @transtore(i32 %x, i32 %lock, i32 %score, i32 %work) #0 {
  %he = alloca %struct.hashentry, align 4
  call void @llvm.dbg.value(metadata i32 %x, i64 0, metadata !290, metadata !109), !dbg !291
  call void @llvm.dbg.value(metadata i32 %lock, i64 0, metadata !292, metadata !109), !dbg !293
  call void @llvm.dbg.value(metadata i32 %score, i64 0, metadata !294, metadata !109), !dbg !295
  call void @llvm.dbg.value(metadata i32 %work, i64 0, metadata !296, metadata !109), !dbg !297
  call void @llvm.dbg.declare(metadata %struct.hashentry* %he, metadata !298, metadata !109), !dbg !299
  %1 = load i64* @posed, align 8, !dbg !300
  %2 = add i64 %1, 1, !dbg !300
  store i64 %2, i64* @posed, align 8, !dbg !300
  %3 = sext i32 %x to i64, !dbg !301
  %4 = load %struct.hashentry** @ht, align 8, !dbg !302
  %5 = getelementptr inbounds %struct.hashentry* %4, i64 %3, !dbg !301
  %6 = bitcast %struct.hashentry* %he to i8*, !dbg !301
  %7 = bitcast %struct.hashentry* %5 to i8*, !dbg !301
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 4, i1 false), !dbg !301
  %8 = bitcast %struct.hashentry* %he to i64*, !dbg !303
  %9 = load i64* %8, align 4, !dbg !303
  %10 = and i64 %9, 67108863, !dbg !303
  %11 = trunc i64 %10 to i32, !dbg !303
  %12 = icmp eq i32 %11, %lock, !dbg !303
  br i1 %12, label %20, label %13, !dbg !305

; <label>:13                                      ; preds = %0
  %14 = bitcast %struct.hashentry* %he to i64*, !dbg !306
  %15 = load i64* %14, align 4, !dbg !306
  %16 = lshr i64 %15, 26, !dbg !306
  %17 = and i64 %16, 63, !dbg !306
  %18 = trunc i64 %17 to i32, !dbg !306
  %19 = icmp sge i32 %work, %18, !dbg !307
  br i1 %19, label %20, label %44, !dbg !305

; <label>:20                                      ; preds = %13, %0
  %21 = bitcast %struct.hashentry* %he to i64*, !dbg !308
  %22 = zext i32 %lock to i64, !dbg !308
  %23 = load i64* %21, align 4, !dbg !308
  %24 = and i64 %22, 67108863, !dbg !308
  %25 = and i64 %23, -67108864, !dbg !308
  %26 = or i64 %25, %24, !dbg !308
  store i64 %26, i64* %21, align 4, !dbg !308
  %27 = trunc i64 %24 to i32, !dbg !308
  %28 = bitcast %struct.hashentry* %he to i64*, !dbg !310
  %29 = zext i32 %score to i64, !dbg !310
  %30 = load i64* %28, align 4, !dbg !310
  %31 = and i64 %29, 7, !dbg !310
  %32 = shl i64 %31, 61, !dbg !310
  %33 = and i64 %30, 2305843009213693951, !dbg !310
  %34 = or i64 %33, %32, !dbg !310
  store i64 %34, i64* %28, align 4, !dbg !310
  %35 = trunc i64 %31 to i32, !dbg !310
  %36 = bitcast %struct.hashentry* %he to i64*, !dbg !311
  %37 = zext i32 %work to i64, !dbg !311
  %38 = load i64* %36, align 4, !dbg !311
  %39 = and i64 %37, 63, !dbg !311
  %40 = shl i64 %39, 26, !dbg !311
  %41 = and i64 %38, -4227858433, !dbg !311
  %42 = or i64 %41, %40, !dbg !311
  store i64 %42, i64* %36, align 4, !dbg !311
  %43 = trunc i64 %39 to i32, !dbg !311
  br label %61, !dbg !312

; <label>:44                                      ; preds = %13
  %45 = bitcast %struct.hashentry* %he to i64*, !dbg !313
  %46 = zext i32 %lock to i64, !dbg !313
  %47 = load i64* %45, align 4, !dbg !313
  %48 = and i64 %46, 67108863, !dbg !313
  %49 = shl i64 %48, 32, !dbg !313
  %50 = and i64 %47, -288230371856744449, !dbg !313
  %51 = or i64 %50, %49, !dbg !313
  store i64 %51, i64* %45, align 4, !dbg !313
  %52 = trunc i64 %48 to i32, !dbg !313
  %53 = bitcast %struct.hashentry* %he to i64*, !dbg !315
  %54 = zext i32 %score to i64, !dbg !315
  %55 = load i64* %53, align 4, !dbg !315
  %56 = and i64 %54, 7, !dbg !315
  %57 = shl i64 %56, 58, !dbg !315
  %58 = and i64 %55, -2017612633061982209, !dbg !315
  %59 = or i64 %58, %57, !dbg !315
  store i64 %59, i64* %53, align 4, !dbg !315
  %60 = trunc i64 %56 to i32, !dbg !315
  br label %61

; <label>:61                                      ; preds = %44, %20
  %62 = sext i32 %x to i64, !dbg !316
  %63 = load %struct.hashentry** @ht, align 8, !dbg !316
  %64 = getelementptr inbounds %struct.hashentry* %63, i64 %62, !dbg !316
  %65 = bitcast %struct.hashentry* %64 to i8*, !dbg !316
  %66 = bitcast %struct.hashentry* %he to i8*, !dbg !316
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %65, i8* %66, i64 8, i32 4, i1 false), !dbg !316
  ret void, !dbg !317
}

; Function Attrs: nounwind uwtable
define void @htstat() #0 {
  %typecnt = alloca [8 x i32], align 16
  %he = alloca %struct.hashentry, align 4
  call void @llvm.dbg.declare(metadata [8 x i32]* %typecnt, metadata !318, metadata !109), !dbg !322
  call void @llvm.dbg.declare(metadata %struct.hashentry* %he, metadata !323, metadata !109), !dbg !324
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !325, metadata !109), !dbg !326
  br label %1, !dbg !327

; <label>:1                                       ; preds = %6, %0
  %i.0 = phi i32 [ 0, %0 ], [ %7, %6 ]
  %2 = icmp slt i32 %i.0, 8, !dbg !329
  br i1 %2, label %3, label %8, !dbg !333

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64, !dbg !334
  %5 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %4, !dbg !334
  store i32 0, i32* %5, align 4, !dbg !334
  br label %6, !dbg !334

; <label>:6                                       ; preds = %3
  %7 = add nsw i32 %i.0, 1, !dbg !335
  call void @llvm.dbg.value(metadata i32 %7, i64 0, metadata !325, metadata !109), !dbg !326
  br label %1, !dbg !336

; <label>:8                                       ; preds = %1
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !325, metadata !109), !dbg !326
  br label %9, !dbg !337

; <label>:9                                       ; preds = %49, %8
  %i.1 = phi i32 [ 0, %8 ], [ %50, %49 ]
  %10 = icmp slt i32 %i.1, 8306069, !dbg !339
  br i1 %10, label %11, label %51, !dbg !343

; <label>:11                                      ; preds = %9
  %12 = sext i32 %i.1 to i64, !dbg !344
  %13 = load %struct.hashentry** @ht, align 8, !dbg !346
  %14 = getelementptr inbounds %struct.hashentry* %13, i64 %12, !dbg !344
  %15 = bitcast %struct.hashentry* %he to i8*, !dbg !344
  %16 = bitcast %struct.hashentry* %14 to i8*, !dbg !344
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* %16, i64 8, i32 4, i1 false), !dbg !344
  %17 = bitcast %struct.hashentry* %he to i64*, !dbg !347
  %18 = load i64* %17, align 4, !dbg !347
  %19 = and i64 %18, 67108863, !dbg !347
  %20 = trunc i64 %19 to i32, !dbg !347
  %21 = icmp ne i32 %20, 0, !dbg !347
  br i1 %21, label %22, label %31, !dbg !349

; <label>:22                                      ; preds = %11
  %23 = bitcast %struct.hashentry* %he to i64*, !dbg !350
  %24 = load i64* %23, align 4, !dbg !350
  %25 = lshr i64 %24, 61, !dbg !350
  %26 = trunc i64 %25 to i32, !dbg !350
  %27 = zext i32 %26 to i64, !dbg !351
  %28 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %27, !dbg !351
  %29 = load i32* %28, align 4, !dbg !351
  %30 = add nsw i32 %29, 1, !dbg !351
  store i32 %30, i32* %28, align 4, !dbg !351
  br label %31, !dbg !351

; <label>:31                                      ; preds = %22, %11
  %32 = bitcast %struct.hashentry* %he to i64*, !dbg !352
  %33 = load i64* %32, align 4, !dbg !352
  %34 = lshr i64 %33, 32, !dbg !352
  %35 = and i64 %34, 67108863, !dbg !352
  %36 = trunc i64 %35 to i32, !dbg !352
  %37 = icmp ne i32 %36, 0, !dbg !352
  br i1 %37, label %38, label %48, !dbg !354

; <label>:38                                      ; preds = %31
  %39 = bitcast %struct.hashentry* %he to i64*, !dbg !355
  %40 = load i64* %39, align 4, !dbg !355
  %41 = lshr i64 %40, 58, !dbg !355
  %42 = and i64 %41, 7, !dbg !355
  %43 = trunc i64 %42 to i32, !dbg !355
  %44 = zext i32 %43 to i64, !dbg !356
  %45 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %44, !dbg !356
  %46 = load i32* %45, align 4, !dbg !356
  %47 = add nsw i32 %46, 1, !dbg !356
  store i32 %47, i32* %45, align 4, !dbg !356
  br label %48, !dbg !356

; <label>:48                                      ; preds = %38, %31
  br label %49, !dbg !357

; <label>:49                                      ; preds = %48
  %50 = add nsw i32 %i.1, 1, !dbg !358
  call void @llvm.dbg.value(metadata i32 %50, i64 0, metadata !325, metadata !109), !dbg !326
  br label %9, !dbg !359

; <label>:51                                      ; preds = %9
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !360, metadata !109), !dbg !361
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !325, metadata !109), !dbg !326
  br label %52, !dbg !362

; <label>:52                                      ; preds = %59, %51
  %i.2 = phi i32 [ 1, %51 ], [ %60, %59 ]
  %total.0 = phi i32 [ 0, %51 ], [ %58, %59 ]
  %53 = icmp sle i32 %i.2, 5, !dbg !364
  br i1 %53, label %54, label %61, !dbg !368

; <label>:54                                      ; preds = %52
  %55 = sext i32 %i.2 to i64, !dbg !369
  %56 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %55, !dbg !369
  %57 = load i32* %56, align 4, !dbg !369
  %58 = add nsw i32 %total.0, %57, !dbg !370
  call void @llvm.dbg.value(metadata i32 %58, i64 0, metadata !360, metadata !109), !dbg !361
  br label %59, !dbg !370

; <label>:59                                      ; preds = %54
  %60 = add nsw i32 %i.2, 1, !dbg !371
  call void @llvm.dbg.value(metadata i32 %60, i64 0, metadata !325, metadata !109), !dbg !326
  br label %52, !dbg !372

; <label>:61                                      ; preds = %52
  %62 = icmp sgt i32 %total.0, 0, !dbg !373
  br i1 %62, label %63, label %90, !dbg !375

; <label>:63                                      ; preds = %61
  %64 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 1, !dbg !376
  %65 = load i32* %64, align 4, !dbg !376
  %66 = sitofp i32 %65 to double, !dbg !376
  %67 = sitofp i32 %total.0 to double, !dbg !378
  %68 = fdiv double %66, %67, !dbg !376
  %69 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 2, !dbg !379
  %70 = load i32* %69, align 4, !dbg !379
  %71 = sitofp i32 %70 to double, !dbg !379
  %72 = sitofp i32 %total.0 to double, !dbg !380
  %73 = fdiv double %71, %72, !dbg !379
  %74 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 3, !dbg !381
  %75 = load i32* %74, align 4, !dbg !381
  %76 = sitofp i32 %75 to double, !dbg !381
  %77 = sitofp i32 %total.0 to double, !dbg !382
  %78 = fdiv double %76, %77, !dbg !381
  %79 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 4, !dbg !383
  %80 = load i32* %79, align 4, !dbg !383
  %81 = sitofp i32 %80 to double, !dbg !383
  %82 = sitofp i32 %total.0 to double, !dbg !384
  %83 = fdiv double %81, %82, !dbg !383
  %84 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 5, !dbg !385
  %85 = load i32* %84, align 4, !dbg !385
  %86 = sitofp i32 %85 to double, !dbg !385
  %87 = sitofp i32 %total.0 to double, !dbg !386
  %88 = fdiv double %86, %87, !dbg !385
  %89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str2, i32 0, i32 0), double %68, double %73, double %78, double %83, double %88), !dbg !387
  br label %90, !dbg !388

; <label>:90                                      ; preds = %63, %61
  ret void, !dbg !389
}

; Function Attrs: nounwind uwtable
define i64 @millisecs() #0 {
  %rusage = alloca %struct.rusage, align 8
  call void @llvm.dbg.declare(metadata %struct.rusage* %rusage, metadata !390, metadata !109), !dbg !475
  %1 = call i32 @getrusage(i32 0, %struct.rusage* %rusage) #5, !dbg !476
  %2 = getelementptr inbounds %struct.rusage* %rusage, i32 0, i32 0, !dbg !477
  %3 = getelementptr inbounds %struct.timeval* %2, i32 0, i32 0, !dbg !477
  %4 = load i64* %3, align 8, !dbg !477
  %5 = mul nsw i64 %4, 1000, !dbg !477
  %6 = getelementptr inbounds %struct.rusage* %rusage, i32 0, i32 0, !dbg !478
  %7 = getelementptr inbounds %struct.timeval* %6, i32 0, i32 1, !dbg !478
  %8 = load i64* %7, align 8, !dbg !478
  %9 = sdiv i64 %8, 1000, !dbg !478
  %10 = add nsw i64 %5, %9, !dbg !477
  ret i64 %10, !dbg !479
}

; Function Attrs: nounwind
declare i32 @getrusage(i32, %struct.rusage*) #3

; Function Attrs: nounwind uwtable
define i32 @min(i32 %x, i32 %y) #0 {
  call void @llvm.dbg.value(metadata i32 %x, i64 0, metadata !480, metadata !109), !dbg !481
  call void @llvm.dbg.value(metadata i32 %y, i64 0, metadata !482, metadata !109), !dbg !483
  %1 = icmp slt i32 %x, %y, !dbg !484
  br i1 %1, label %2, label %3, !dbg !484

; <label>:2                                       ; preds = %0
  br label %4, !dbg !484

; <label>:3                                       ; preds = %0
  br label %4, !dbg !484

; <label>:4                                       ; preds = %3, %2
  %5 = phi i32 [ %x, %2 ], [ %y, %3 ], !dbg !484
  ret i32 %5, !dbg !485
}

; Function Attrs: nounwind uwtable
define i32 @max(i32 %x, i32 %y) #0 {
  call void @llvm.dbg.value(metadata i32 %x, i64 0, metadata !488, metadata !109), !dbg !489
  call void @llvm.dbg.value(metadata i32 %y, i64 0, metadata !490, metadata !109), !dbg !491
  %1 = icmp sgt i32 %x, %y, !dbg !492
  br i1 %1, label %2, label %3, !dbg !492

; <label>:2                                       ; preds = %0
  br label %4, !dbg !492

; <label>:3                                       ; preds = %0
  br label %4, !dbg !492

; <label>:4                                       ; preds = %3, %2
  %5 = phi i32 [ %x, %2 ], [ %y, %3 ], !dbg !492
  ret i32 %5, !dbg !493
}

; Function Attrs: nounwind uwtable
define void @inithistory() #0 {
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !496, metadata !109), !dbg !497
  br label %1, !dbg !498

; <label>:1                                       ; preds = %59, %0
  %side.0 = phi i32 [ 0, %0 ], [ %60, %59 ]
  %2 = icmp slt i32 %side.0, 2, !dbg !500
  br i1 %2, label %3, label %61, !dbg !504

; <label>:3                                       ; preds = %1
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !505, metadata !109), !dbg !506
  br label %4, !dbg !507

; <label>:4                                       ; preds = %56, %3
  %i.0 = phi i32 [ 0, %3 ], [ %57, %56 ]
  %5 = icmp slt i32 %i.0, 4, !dbg !509
  br i1 %5, label %6, label %58, !dbg !513

; <label>:6                                       ; preds = %4
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !514, metadata !109), !dbg !515
  br label %7, !dbg !516

; <label>:7                                       ; preds = %53, %6
  %h.0 = phi i32 [ 0, %6 ], [ %54, %53 ]
  %8 = icmp slt i32 %h.0, 3, !dbg !518
  br i1 %8, label %9, label %55, !dbg !522

; <label>:9                                       ; preds = %7
  %10 = call i32 @min(i32 3, i32 %i.0), !dbg !523
  %11 = add nsw i32 4, %10, !dbg !524
  %12 = call i32 @min(i32 3, i32 %h.0), !dbg !525
  %13 = sub nsw i32 3, %i.0, !dbg !526
  %14 = call i32 @max(i32 0, i32 %13), !dbg !527
  %15 = sub nsw i32 %12, %14, !dbg !525
  %16 = call i32 @max(i32 -1, i32 %15), !dbg !528
  %17 = add nsw i32 %11, %16, !dbg !524
  %18 = call i32 @min(i32 %i.0, i32 %h.0), !dbg !529
  %19 = call i32 @min(i32 3, i32 %18), !dbg !530
  %20 = add nsw i32 %17, %19, !dbg !524
  %21 = call i32 @min(i32 3, i32 %h.0), !dbg !531
  %22 = add nsw i32 %20, %21, !dbg !524
  %23 = sub nsw i32 6, %i.0, !dbg !532
  %24 = mul nsw i32 7, %23, !dbg !533
  %25 = add nsw i32 %24, %h.0, !dbg !533
  %26 = sext i32 %25 to i64, !dbg !534
  %27 = sext i32 %side.0 to i64, !dbg !534
  %28 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %27, !dbg !534
  %29 = getelementptr inbounds [49 x i32]* %28, i32 0, i64 %26, !dbg !534
  store i32 %22, i32* %29, align 4, !dbg !534
  %30 = mul nsw i32 7, %i.0, !dbg !535
  %31 = add nsw i32 %30, 6, !dbg !535
  %32 = sub nsw i32 %31, 1, !dbg !535
  %33 = sub nsw i32 %32, %h.0, !dbg !535
  %34 = sext i32 %33 to i64, !dbg !536
  %35 = sext i32 %side.0 to i64, !dbg !536
  %36 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %35, !dbg !536
  %37 = getelementptr inbounds [49 x i32]* %36, i32 0, i64 %34, !dbg !536
  store i32 %22, i32* %37, align 4, !dbg !536
  %38 = sub nsw i32 6, %i.0, !dbg !537
  %39 = mul nsw i32 7, %38, !dbg !538
  %40 = add nsw i32 %39, 6, !dbg !538
  %41 = sub nsw i32 %40, 1, !dbg !538
  %42 = sub nsw i32 %41, %h.0, !dbg !538
  %43 = sext i32 %42 to i64, !dbg !539
  %44 = sext i32 %side.0 to i64, !dbg !539
  %45 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %44, !dbg !539
  %46 = getelementptr inbounds [49 x i32]* %45, i32 0, i64 %43, !dbg !539
  store i32 %22, i32* %46, align 4, !dbg !539
  %47 = mul nsw i32 7, %i.0, !dbg !540
  %48 = add nsw i32 %47, %h.0, !dbg !540
  %49 = sext i32 %48 to i64, !dbg !541
  %50 = sext i32 %side.0 to i64, !dbg !541
  %51 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %50, !dbg !541
  %52 = getelementptr inbounds [49 x i32]* %51, i32 0, i64 %49, !dbg !541
  store i32 %22, i32* %52, align 4, !dbg !541
  br label %53, !dbg !541

; <label>:53                                      ; preds = %9
  %54 = add nsw i32 %h.0, 1, !dbg !542
  call void @llvm.dbg.value(metadata i32 %54, i64 0, metadata !514, metadata !109), !dbg !515
  br label %7, !dbg !543

; <label>:55                                      ; preds = %7
  br label %56, !dbg !544

; <label>:56                                      ; preds = %55
  %57 = add nsw i32 %i.0, 1, !dbg !545
  call void @llvm.dbg.value(metadata i32 %57, i64 0, metadata !505, metadata !109), !dbg !506
  br label %4, !dbg !546

; <label>:58                                      ; preds = %4
  br label %59, !dbg !547

; <label>:59                                      ; preds = %58
  %60 = add nsw i32 %side.0, 1, !dbg !548
  call void @llvm.dbg.value(metadata i32 %60, i64 0, metadata !496, metadata !109), !dbg !497
  br label %1, !dbg !549

; <label>:61                                      ; preds = %1
  ret void, !dbg !550
}

; Function Attrs: nounwind uwtable
define i32 @ab(i32 %alpha, i32 %beta) #0 {
  %av = alloca [7 x i32], align 16
  call void @llvm.dbg.value(metadata i32 %alpha, i64 0, metadata !551, metadata !109), !dbg !552
  call void @llvm.dbg.value(metadata i32 %beta, i64 0, metadata !553, metadata !109), !dbg !554
  call void @llvm.dbg.declare(metadata [7 x i32]* %av, metadata !555, metadata !109), !dbg !557
  %1 = load i64* @nodes, align 8, !dbg !558
  %2 = add i64 %1, 1, !dbg !558
  store i64 %2, i64* @nodes, align 8, !dbg !558
  %3 = load i32* @nplies, align 4, !dbg !559
  %4 = icmp eq i32 %3, 41, !dbg !559
  br i1 %4, label %5, label %6, !dbg !561

; <label>:5                                       ; preds = %0
  br label %244, !dbg !562

; <label>:6                                       ; preds = %0
  %7 = load i32* @nplies, align 4, !dbg !563
  %8 = and i32 %7, 1, !dbg !563
  call void @llvm.dbg.value(metadata i32 %8, i64 0, metadata !564, metadata !109), !dbg !565
  %9 = xor i32 %8, 1, !dbg !566
  call void @llvm.dbg.value(metadata i32 %9, i64 0, metadata !567, metadata !109), !dbg !568
  %10 = sext i32 %9 to i64, !dbg !569
  %11 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %10, !dbg !569
  %12 = load i64* %11, align 8, !dbg !569
  call void @llvm.dbg.value(metadata i64 %12, i64 0, metadata !570, metadata !109), !dbg !571
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !572, metadata !109), !dbg !573
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !574, metadata !109), !dbg !575
  br label %13, !dbg !576

; <label>:13                                      ; preds = %67, %6
  %nav.0 = phi i32 [ 0, %6 ], [ %nav.2, %67 ]
  %i.0 = phi i32 [ 0, %6 ], [ %68, %67 ]
  %14 = icmp slt i32 %i.0, 7, !dbg !578
  br i1 %14, label %15, label %69, !dbg !582

; <label>:15                                      ; preds = %13
  %16 = sext i32 %i.0 to i64, !dbg !583
  %17 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %16, !dbg !583
  %18 = load i8* %17, align 1, !dbg !583
  %19 = sext i8 %18 to i32, !dbg !583
  %20 = zext i32 %19 to i64, !dbg !585
  %21 = shl i64 1, %20, !dbg !585
  %22 = or i64 %12, %21, !dbg !586
  call void @llvm.dbg.value(metadata i64 %22, i64 0, metadata !587, metadata !109), !dbg !588
  %23 = call i32 @islegal(i64 %22), !dbg !589
  %24 = icmp ne i32 %23, 0, !dbg !591
  br i1 %24, label %26, label %25, !dbg !591

; <label>:25                                      ; preds = %15
  br label %67, !dbg !592

; <label>:26                                      ; preds = %15
  %27 = sext i32 %i.0 to i64, !dbg !593
  %28 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %27, !dbg !593
  %29 = load i8* %28, align 1, !dbg !593
  %30 = sext i8 %29 to i32, !dbg !593
  %31 = zext i32 %30 to i64, !dbg !594
  %32 = shl i64 2, %31, !dbg !594
  %33 = or i64 %12, %32, !dbg !595
  %34 = call i32 @islegalhaswon(i64 %33), !dbg !596
  call void @llvm.dbg.value(metadata i32 %34, i64 0, metadata !597, metadata !109), !dbg !598
  %35 = call i64 @haswon(i64 %22), !dbg !599
  %36 = icmp ne i64 %35, 0, !dbg !601
  br i1 %36, label %37, label %60, !dbg !601

; <label>:37                                      ; preds = %26
  %38 = icmp ne i32 %34, 0, !dbg !602
  br i1 %38, label %39, label %40, !dbg !602

; <label>:39                                      ; preds = %37
  br label %244, !dbg !604

; <label>:40                                      ; preds = %37
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !572, metadata !109), !dbg !573
  %41 = add nsw i32 0, 1, !dbg !606
  call void @llvm.dbg.value(metadata i32 %41, i64 0, metadata !572, metadata !109), !dbg !573
  %42 = sext i32 0 to i64, !dbg !607
  %43 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %42, !dbg !607
  store i32 %i.0, i32* %43, align 4, !dbg !607
  br label %44, !dbg !608

; <label>:44                                      ; preds = %58, %40
  %i.1 = phi i32 [ %i.0, %40 ], [ %45, %58 ]
  %45 = add nsw i32 %i.1, 1, !dbg !609
  call void @llvm.dbg.value(metadata i32 %45, i64 0, metadata !574, metadata !109), !dbg !575
  %46 = icmp slt i32 %45, 7, !dbg !609
  br i1 %46, label %47, label %59, !dbg !608

; <label>:47                                      ; preds = %44
  %48 = sext i32 %45 to i64, !dbg !612
  %49 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %48, !dbg !612
  %50 = load i8* %49, align 1, !dbg !612
  %51 = sext i8 %50 to i32, !dbg !612
  %52 = zext i32 %51 to i64, !dbg !614
  %53 = shl i64 1, %52, !dbg !614
  %54 = or i64 %12, %53, !dbg !615
  %55 = call i32 @islegalhaswon(i64 %54), !dbg !616
  %56 = icmp ne i32 %55, 0, !dbg !617
  br i1 %56, label %57, label %58, !dbg !617

; <label>:57                                      ; preds = %47
  br label %244, !dbg !618

; <label>:58                                      ; preds = %47
  br label %44, !dbg !608

; <label>:59                                      ; preds = %44
  br label %69, !dbg !619

; <label>:60                                      ; preds = %26
  %61 = icmp ne i32 %34, 0, !dbg !620
  br i1 %61, label %66, label %62, !dbg !620

; <label>:62                                      ; preds = %60
  %63 = add nsw i32 %nav.0, 1, !dbg !621
  call void @llvm.dbg.value(metadata i32 %63, i64 0, metadata !572, metadata !109), !dbg !573
  %64 = sext i32 %nav.0 to i64, !dbg !623
  %65 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %64, !dbg !623
  store i32 %i.0, i32* %65, align 4, !dbg !623
  br label %66, !dbg !623

; <label>:66                                      ; preds = %62, %60
  %nav.1 = phi i32 [ %nav.0, %60 ], [ %63, %62 ]
  br label %67, !dbg !624

; <label>:67                                      ; preds = %66, %25
  %nav.2 = phi i32 [ %nav.1, %66 ], [ %nav.0, %25 ]
  %68 = add nsw i32 %i.0, 1, !dbg !625
  call void @llvm.dbg.value(metadata i32 %68, i64 0, metadata !574, metadata !109), !dbg !575
  br label %13, !dbg !626

; <label>:69                                      ; preds = %59, %13
  %nav.3 = phi i32 [ %41, %59 ], [ %nav.0, %13 ]
  %70 = icmp eq i32 %nav.3, 0, !dbg !627
  br i1 %70, label %71, label %72, !dbg !629

; <label>:71                                      ; preds = %69
  br label %244, !dbg !630

; <label>:72                                      ; preds = %69
  %73 = load i32* @nplies, align 4, !dbg !631
  %74 = icmp eq i32 %73, 40, !dbg !631
  br i1 %74, label %75, label %76, !dbg !633

; <label>:75                                      ; preds = %72
  br label %244, !dbg !634

; <label>:76                                      ; preds = %72
  %77 = icmp eq i32 %nav.3, 1, !dbg !635
  br i1 %77, label %78, label %85, !dbg !637

; <label>:78                                      ; preds = %76
  %79 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 0, !dbg !638
  %80 = load i32* %79, align 4, !dbg !638
  call void @makemove(i32 %80), !dbg !640
  %81 = sub nsw i32 6, %beta, !dbg !641
  %82 = sub nsw i32 6, %alpha, !dbg !642
  %83 = call i32 @ab(i32 %81, i32 %82), !dbg !643
  %84 = sub nsw i32 6, %83, !dbg !644
  call void @llvm.dbg.value(metadata i32 %84, i64 0, metadata !645, metadata !109), !dbg !646
  call void @backmove(), !dbg !647
  br label %244, !dbg !648

; <label>:85                                      ; preds = %76
  %86 = call i32 @transpose(), !dbg !649
  call void @llvm.dbg.value(metadata i32 %86, i64 0, metadata !650, metadata !109), !dbg !651
  %87 = icmp ne i32 %86, 0, !dbg !652
  br i1 %87, label %88, label %103, !dbg !654

; <label>:88                                      ; preds = %85
  %89 = icmp eq i32 %86, 2, !dbg !655
  br i1 %89, label %90, label %94, !dbg !658

; <label>:90                                      ; preds = %88
  call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !553, metadata !109), !dbg !554
  %91 = icmp sle i32 3, %alpha, !dbg !659
  br i1 %91, label %92, label %93, !dbg !662

; <label>:92                                      ; preds = %90
  br label %244, !dbg !663

; <label>:93                                      ; preds = %90
  br label %102, !dbg !664

; <label>:94                                      ; preds = %88
  %95 = icmp eq i32 %86, 4, !dbg !665
  br i1 %95, label %96, label %100, !dbg !667

; <label>:96                                      ; preds = %94
  call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !551, metadata !109), !dbg !552
  %97 = icmp sge i32 3, %beta, !dbg !668
  br i1 %97, label %98, label %99, !dbg !671

; <label>:98                                      ; preds = %96
  br label %244, !dbg !672

; <label>:99                                      ; preds = %96
  br label %101, !dbg !673

; <label>:100                                     ; preds = %94
  br label %244, !dbg !674

; <label>:101                                     ; preds = %99
  br label %102

; <label>:102                                     ; preds = %101, %93
  %.02 = phi i32 [ 3, %93 ], [ %beta, %101 ]
  %.01 = phi i32 [ %alpha, %93 ], [ 3, %101 ]
  br label %103, !dbg !675

; <label>:103                                     ; preds = %102, %85
  %.13 = phi i32 [ %.02, %102 ], [ %beta, %85 ]
  %.1 = phi i32 [ %.01, %102 ], [ %alpha, %85 ]
  %104 = load i32* @htindex, align 4, !dbg !676
  call void @llvm.dbg.value(metadata i32 %104, i64 0, metadata !677, metadata !109), !dbg !678
  %105 = load i32* @lock, align 4, !dbg !679
  call void @llvm.dbg.value(metadata i32 %105, i64 0, metadata !680, metadata !109), !dbg !681
  %106 = load i64* @posed, align 8, !dbg !682
  call void @llvm.dbg.value(metadata i64 %106, i64 0, metadata !683, metadata !109), !dbg !684
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !685, metadata !109), !dbg !686
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !645, metadata !109), !dbg !646
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !574, metadata !109), !dbg !575
  br label %107, !dbg !687

; <label>:107                                     ; preds = %218, %103
  %score.0 = phi i32 [ 1, %103 ], [ %score.2, %218 ]
  %i.2 = phi i32 [ 0, %103 ], [ %219, %218 ]
  %.2 = phi i32 [ %.1, %103 ], [ %.4, %218 ]
  %108 = icmp slt i32 %i.2, %nav.3, !dbg !689
  br i1 %108, label %109, label %220, !dbg !691

; <label>:109                                     ; preds = %107
  call void @llvm.dbg.value(metadata i32 %i.2, i64 0, metadata !692, metadata !109), !dbg !693
  %110 = sext i32 %i.2 to i64, !dbg !694
  %111 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %110, !dbg !694
  %112 = load i32* %111, align 4, !dbg !694
  %113 = sext i32 %112 to i64, !dbg !696
  %114 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %113, !dbg !696
  %115 = load i8* %114, align 1, !dbg !696
  %116 = sext i8 %115 to i32, !dbg !697
  %117 = sext i32 %116 to i64, !dbg !698
  %118 = sext i32 %8 to i64, !dbg !698
  %119 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %118, !dbg !698
  %120 = getelementptr inbounds [49 x i32]* %119, i32 0, i64 %117, !dbg !698
  %121 = load i32* %120, align 4, !dbg !698
  call void @llvm.dbg.value(metadata i32 %121, i64 0, metadata !699, metadata !109), !dbg !700
  %122 = add nsw i32 %i.2, 1, !dbg !701
  call void @llvm.dbg.value(metadata i32 %122, i64 0, metadata !703, metadata !109), !dbg !704
  br label %123, !dbg !705

; <label>:123                                     ; preds = %141, %109
  %val.0 = phi i32 [ %121, %109 ], [ %val.1, %141 ]
  %l.0 = phi i32 [ %i.2, %109 ], [ %l.1, %141 ]
  %j.0 = phi i32 [ %122, %109 ], [ %142, %141 ]
  %124 = icmp slt i32 %j.0, %nav.3, !dbg !706
  br i1 %124, label %125, label %143, !dbg !708

; <label>:125                                     ; preds = %123
  %126 = sext i32 %j.0 to i64, !dbg !709
  %127 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %126, !dbg !709
  %128 = load i32* %127, align 4, !dbg !709
  %129 = sext i32 %128 to i64, !dbg !711
  %130 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %129, !dbg !711
  %131 = load i8* %130, align 1, !dbg !711
  %132 = sext i8 %131 to i32, !dbg !712
  %133 = sext i32 %132 to i64, !dbg !713
  %134 = sext i32 %8 to i64, !dbg !713
  %135 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %134, !dbg !713
  %136 = getelementptr inbounds [49 x i32]* %135, i32 0, i64 %133, !dbg !713
  %137 = load i32* %136, align 4, !dbg !713
  call void @llvm.dbg.value(metadata i32 %137, i64 0, metadata !714, metadata !109), !dbg !715
  %138 = icmp sgt i32 %137, %val.0, !dbg !716
  br i1 %138, label %139, label %140, !dbg !718

; <label>:139                                     ; preds = %125
  call void @llvm.dbg.value(metadata i32 %137, i64 0, metadata !699, metadata !109), !dbg !700
  call void @llvm.dbg.value(metadata i32 %j.0, i64 0, metadata !692, metadata !109), !dbg !693
  br label %140, !dbg !719

; <label>:140                                     ; preds = %139, %125
  %val.1 = phi i32 [ %137, %139 ], [ %val.0, %125 ]
  %l.1 = phi i32 [ %j.0, %139 ], [ %l.0, %125 ]
  br label %141, !dbg !721

; <label>:141                                     ; preds = %140
  %142 = add nsw i32 %j.0, 1, !dbg !722
  call void @llvm.dbg.value(metadata i32 %142, i64 0, metadata !703, metadata !109), !dbg !704
  br label %123, !dbg !723

; <label>:143                                     ; preds = %123
  %144 = sext i32 %l.0 to i64, !dbg !724
  %145 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %144, !dbg !724
  %146 = load i32* %145, align 4, !dbg !724
  call void @llvm.dbg.value(metadata i32 %146, i64 0, metadata !703, metadata !109), !dbg !704
  br label %147, !dbg !726

; <label>:147                                     ; preds = %156, %143
  %l.2 = phi i32 [ %l.0, %143 ], [ %157, %156 ]
  %148 = icmp sgt i32 %l.2, %i.2, !dbg !727
  br i1 %148, label %149, label %158, !dbg !729

; <label>:149                                     ; preds = %147
  %150 = sub nsw i32 %l.2, 1, !dbg !730
  %151 = sext i32 %150 to i64, !dbg !731
  %152 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %151, !dbg !731
  %153 = load i32* %152, align 4, !dbg !731
  %154 = sext i32 %l.2 to i64, !dbg !732
  %155 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %154, !dbg !732
  store i32 %153, i32* %155, align 4, !dbg !732
  br label %156, !dbg !732

; <label>:156                                     ; preds = %149
  %157 = add nsw i32 %l.2, -1, !dbg !733
  call void @llvm.dbg.value(metadata i32 %157, i64 0, metadata !692, metadata !109), !dbg !693
  br label %147, !dbg !734

; <label>:158                                     ; preds = %147
  %159 = sext i32 %i.2 to i64, !dbg !735
  %160 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %159, !dbg !735
  store i32 %146, i32* %160, align 4, !dbg !735
  call void @makemove(i32 %146), !dbg !736
  %161 = sub nsw i32 6, %.13, !dbg !737
  %162 = sub nsw i32 6, %.2, !dbg !738
  %163 = call i32 @ab(i32 %161, i32 %162), !dbg !739
  %164 = sub nsw i32 6, %163, !dbg !740
  call void @llvm.dbg.value(metadata i32 %164, i64 0, metadata !699, metadata !109), !dbg !700
  call void @backmove(), !dbg !741
  %165 = icmp sgt i32 %164, %score.0, !dbg !742
  br i1 %165, label %166, label %217, !dbg !744

; <label>:166                                     ; preds = %158
  call void @llvm.dbg.value(metadata i32 %i.2, i64 0, metadata !685, metadata !109), !dbg !686
  call void @llvm.dbg.value(metadata i32 %164, i64 0, metadata !645, metadata !109), !dbg !646
  %167 = icmp sgt i32 %164, %.2, !dbg !745
  br i1 %167, label %168, label %216, !dbg !748

; <label>:168                                     ; preds = %166
  %169 = load i32* @nplies, align 4, !dbg !749
  %170 = load i32* @bookply, align 4, !dbg !751
  %171 = icmp sge i32 %169, %170, !dbg !752
  br i1 %171, label %172, label %216, !dbg !748

; <label>:172                                     ; preds = %168
  call void @llvm.dbg.value(metadata i32 %164, i64 0, metadata !551, metadata !109), !dbg !552
  %173 = icmp sge i32 %164, %.13, !dbg !753
  br i1 %173, label %174, label %216, !dbg !748

; <label>:174                                     ; preds = %172
  %175 = icmp eq i32 %164, 3, !dbg !754
  br i1 %175, label %176, label %180, !dbg !757

; <label>:176                                     ; preds = %174
  %177 = sub nsw i32 %nav.3, 1, !dbg !758
  %178 = icmp slt i32 %i.2, %177, !dbg !759
  br i1 %178, label %179, label %180, !dbg !757

; <label>:179                                     ; preds = %176
  call void @llvm.dbg.value(metadata i32 4, i64 0, metadata !645, metadata !109), !dbg !646
  br label %180, !dbg !760

; <label>:180                                     ; preds = %179, %176, %174
  %score.1 = phi i32 [ 4, %179 ], [ %164, %176 ], [ %164, %174 ]
  %181 = icmp sgt i32 %i.2, 0, !dbg !761
  br i1 %181, label %182, label %215, !dbg !763

; <label>:182                                     ; preds = %180
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !574, metadata !109), !dbg !575
  br label %183, !dbg !764

; <label>:183                                     ; preds = %199, %182
  %i.3 = phi i32 [ 0, %182 ], [ %200, %199 ]
  %184 = icmp slt i32 %i.3, %i.2, !dbg !767
  br i1 %184, label %185, label %201, !dbg !769

; <label>:185                                     ; preds = %183
  %186 = sext i32 %i.3 to i64, !dbg !770
  %187 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %186, !dbg !770
  %188 = load i32* %187, align 4, !dbg !770
  %189 = sext i32 %188 to i64, !dbg !771
  %190 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %189, !dbg !771
  %191 = load i8* %190, align 1, !dbg !771
  %192 = sext i8 %191 to i32, !dbg !772
  %193 = sext i32 %192 to i64, !dbg !773
  %194 = sext i32 %8 to i64, !dbg !773
  %195 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %194, !dbg !773
  %196 = getelementptr inbounds [49 x i32]* %195, i32 0, i64 %193, !dbg !773
  %197 = load i32* %196, align 4, !dbg !773
  %198 = add nsw i32 %197, -1, !dbg !773
  store i32 %198, i32* %196, align 4, !dbg !773
  br label %199, !dbg !773

; <label>:199                                     ; preds = %185
  %200 = add nsw i32 %i.3, 1, !dbg !774
  call void @llvm.dbg.value(metadata i32 %200, i64 0, metadata !574, metadata !109), !dbg !575
  br label %183, !dbg !775

; <label>:201                                     ; preds = %183
  %202 = sext i32 %i.2 to i64, !dbg !776
  %203 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %202, !dbg !776
  %204 = load i32* %203, align 4, !dbg !776
  %205 = sext i32 %204 to i64, !dbg !777
  %206 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %205, !dbg !777
  %207 = load i8* %206, align 1, !dbg !777
  %208 = sext i8 %207 to i32, !dbg !778
  %209 = sext i32 %208 to i64, !dbg !779
  %210 = sext i32 %8 to i64, !dbg !779
  %211 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %210, !dbg !779
  %212 = getelementptr inbounds [49 x i32]* %211, i32 0, i64 %209, !dbg !779
  %213 = load i32* %212, align 4, !dbg !779
  %214 = add nsw i32 %213, %i.2, !dbg !779
  store i32 %214, i32* %212, align 4, !dbg !779
  br label %215, !dbg !780

; <label>:215                                     ; preds = %201, %180
  br label %220, !dbg !781

; <label>:216                                     ; preds = %172, %168, %166
  %.3 = phi i32 [ %164, %172 ], [ %.2, %168 ], [ %.2, %166 ]
  br label %217, !dbg !782

; <label>:217                                     ; preds = %216, %158
  %score.2 = phi i32 [ %164, %216 ], [ %score.0, %158 ]
  %.4 = phi i32 [ %.3, %216 ], [ %.2, %158 ]
  br label %218, !dbg !783

; <label>:218                                     ; preds = %217
  %219 = add nsw i32 %i.2, 1, !dbg !784
  call void @llvm.dbg.value(metadata i32 %219, i64 0, metadata !574, metadata !109), !dbg !575
  br label %107, !dbg !785

; <label>:220                                     ; preds = %215, %107
  %score.3 = phi i32 [ %score.1, %215 ], [ %score.0, %107 ]
  %221 = sub nsw i32 6, %86, !dbg !786
  %222 = icmp eq i32 %score.3, %221, !dbg !788
  br i1 %222, label %223, label %224, !dbg !789

; <label>:223                                     ; preds = %220
  call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !645, metadata !109), !dbg !646
  br label %224, !dbg !790

; <label>:224                                     ; preds = %223, %220
  %score.4 = phi i32 [ 3, %223 ], [ %score.3, %220 ]
  %225 = load i64* @posed, align 8, !dbg !791
  %226 = sub i64 %225, %106, !dbg !791
  call void @llvm.dbg.value(metadata i64 %226, i64 0, metadata !683, metadata !109), !dbg !684
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !792, metadata !109), !dbg !793
  br label %227, !dbg !794

; <label>:227                                     ; preds = %231, %224
  %work.0 = phi i32 [ 0, %224 ], [ %232, %231 ]
  %poscnt.0 = phi i64 [ %226, %224 ], [ %228, %231 ]
  %228 = lshr i64 %poscnt.0, 1, !dbg !796
  call void @llvm.dbg.value(metadata i64 %228, i64 0, metadata !683, metadata !109), !dbg !684
  %229 = icmp ne i64 %228, 0, !dbg !800
  br i1 %229, label %230, label %233, !dbg !801

; <label>:230                                     ; preds = %227
  br label %231, !dbg !802

; <label>:231                                     ; preds = %230
  %232 = add nsw i32 %work.0, 1, !dbg !804
  call void @llvm.dbg.value(metadata i32 %232, i64 0, metadata !792, metadata !109), !dbg !793
  br label %227, !dbg !806

; <label>:233                                     ; preds = %227
  call void @transtore(i32 %104, i32 %105, i32 %score.4, i32 %work.0), !dbg !807
  %234 = load i32* @nplies, align 4, !dbg !808
  %235 = load i32* @reportply, align 4, !dbg !810
  %236 = icmp sle i32 %234, %235, !dbg !808
  br i1 %236, label %237, label %243, !dbg !811

; <label>:237                                     ; preds = %233
  call void @printMoves(), !dbg !812
  %238 = sext i32 %score.4 to i64, !dbg !814
  %239 = getelementptr inbounds [7 x i8]* @.str4, i32 0, i64 %238, !dbg !814
  %240 = load i8* %239, align 1, !dbg !814
  %241 = sext i8 %240 to i32, !dbg !814
  %242 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0), i32 %241, i32 %work.0), !dbg !815
  br label %243, !dbg !816

; <label>:243                                     ; preds = %237, %233
  br label %244, !dbg !817

; <label>:244                                     ; preds = %243, %100, %98, %92, %78, %75, %71, %57, %39, %5
  %.0 = phi i32 [ 3, %5 ], [ 1, %39 ], [ 1, %57 ], [ 1, %71 ], [ 3, %75 ], [ %84, %78 ], [ %86, %92 ], [ %score.4, %243 ], [ %86, %98 ], [ %86, %100 ]
  ret i32 %.0, !dbg !818
}

; Function Attrs: nounwind uwtable
define i32 @solve() #0 {
  %1 = load i32* @nplies, align 4, !dbg !819
  %2 = and i32 %1, 1, !dbg !819
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !820, metadata !109), !dbg !821
  %3 = xor i32 %2, 1, !dbg !822
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !823, metadata !109), !dbg !824
  store i64 0, i64* @nodes, align 8, !dbg !825
  store i64 1, i64* @msecs, align 8, !dbg !826
  %4 = sext i32 %3 to i64, !dbg !827
  %5 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %4, !dbg !827
  %6 = load i64* %5, align 8, !dbg !827
  %7 = call i64 @haswon(i64 %6), !dbg !829
  %8 = icmp ne i64 %7, 0, !dbg !830
  br i1 %8, label %9, label %10, !dbg !830

; <label>:9                                       ; preds = %0
  br label %41, !dbg !831

; <label>:10                                      ; preds = %0
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !832, metadata !109), !dbg !833
  br label %11, !dbg !834

; <label>:11                                      ; preds = %28, %10
  %i.0 = phi i32 [ 0, %10 ], [ %29, %28 ]
  %12 = icmp slt i32 %i.0, 7, !dbg !836
  br i1 %12, label %13, label %30, !dbg !840

; <label>:13                                      ; preds = %11
  %14 = sext i32 %2 to i64, !dbg !841
  %15 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %14, !dbg !841
  %16 = load i64* %15, align 8, !dbg !841
  %17 = sext i32 %i.0 to i64, !dbg !843
  %18 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %17, !dbg !843
  %19 = load i8* %18, align 1, !dbg !843
  %20 = sext i8 %19 to i32, !dbg !843
  %21 = zext i32 %20 to i64, !dbg !844
  %22 = shl i64 1, %21, !dbg !844
  %23 = or i64 %16, %22, !dbg !841
  %24 = call i32 @islegalhaswon(i64 %23), !dbg !845
  %25 = icmp ne i32 %24, 0, !dbg !846
  br i1 %25, label %26, label %27, !dbg !846

; <label>:26                                      ; preds = %13
  br label %41, !dbg !847

; <label>:27                                      ; preds = %13
  br label %28, !dbg !848

; <label>:28                                      ; preds = %27
  %29 = add nsw i32 %i.0, 1, !dbg !850
  call void @llvm.dbg.value(metadata i32 %29, i64 0, metadata !832, metadata !109), !dbg !833
  br label %11, !dbg !851

; <label>:30                                      ; preds = %11
  call void @inithistory(), !dbg !852
  %31 = load i32* @nplies, align 4, !dbg !853
  %32 = add nsw i32 %31, 2, !dbg !853
  store i32 %32, i32* @reportply, align 4, !dbg !854
  %33 = load i32* @nplies, align 4, !dbg !855
  %34 = add nsw i32 %33, 0, !dbg !855
  store i32 %34, i32* @bookply, align 4, !dbg !856
  %35 = call i64 @millisecs(), !dbg !857
  store i64 %35, i64* @msecs, align 8, !dbg !858
  %36 = call i32 @ab(i32 1, i32 5), !dbg !859
  call void @llvm.dbg.value(metadata i32 %36, i64 0, metadata !860, metadata !109), !dbg !861
  %37 = call i64 @millisecs(), !dbg !862
  %38 = add i64 1, %37, !dbg !863
  %39 = load i64* @msecs, align 8, !dbg !864
  %40 = sub i64 %38, %39, !dbg !863
  store i64 %40, i64* @msecs, align 8, !dbg !865
  br label %41, !dbg !866

; <label>:41                                      ; preds = %30, %26, %9
  %.0 = phi i32 [ 1, %9 ], [ 5, %26 ], [ %36, %30 ]
  ret i32 %.0, !dbg !867
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  call void @trans_init(), !dbg !868
  %1 = call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0)), !dbg !869
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str6, i32 0, i32 0), i32 7, i32 6), !dbg !870
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([51 x i8]* @.str7, i32 0, i32 0), i32 8306069, i64 8), !dbg !871
  br label %4, !dbg !872

; <label>:4                                       ; preds = %34, %0
  call void @reset(), !dbg !873
  br label %5, !dbg !877

; <label>:5                                       ; preds = %18, %4
  %6 = call i32 @getchar(), !dbg !878
  call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !881, metadata !109), !dbg !882
  %7 = icmp ne i32 %6, -1, !dbg !883
  br i1 %7, label %8, label %19, !dbg !877

; <label>:8                                       ; preds = %5
  %9 = icmp sge i32 %6, 49, !dbg !884
  br i1 %9, label %10, label %14, !dbg !887

; <label>:10                                      ; preds = %8
  %11 = icmp sle i32 %6, 55, !dbg !888
  br i1 %11, label %12, label %14, !dbg !887

; <label>:12                                      ; preds = %10
  %13 = sub nsw i32 %6, 49, !dbg !890
  call void @makemove(i32 %13), !dbg !891
  br label %18, !dbg !891

; <label>:14                                      ; preds = %10, %8
  %15 = icmp eq i32 %6, 10, !dbg !892
  br i1 %15, label %16, label %17, !dbg !894

; <label>:16                                      ; preds = %14
  br label %19, !dbg !895

; <label>:17                                      ; preds = %14
  br label %18

; <label>:18                                      ; preds = %17, %12
  br label %5, !dbg !877

; <label>:19                                      ; preds = %16, %5
  %20 = icmp eq i32 %6, -1, !dbg !896
  br i1 %20, label %21, label %22, !dbg !898

; <label>:21                                      ; preds = %19
  br label %48, !dbg !899

; <label>:22                                      ; preds = %19
  %23 = load i32* @nplies, align 4, !dbg !900
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), i32 %23), !dbg !901
  call void @printMoves(), !dbg !902
  %25 = call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @.str9, i32 0, i32 0)), !dbg !903
  call void @emptyTT(), !dbg !904
  %26 = call i32 @solve(), !dbg !905
  call void @llvm.dbg.value(metadata i32 %26, i64 0, metadata !906, metadata !109), !dbg !907
  %27 = load i64* @posed, align 8, !dbg !908
  call void @llvm.dbg.value(metadata i64 %27, i64 0, metadata !909, metadata !109), !dbg !910
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !911, metadata !109), !dbg !912
  br label %28, !dbg !913

; <label>:28                                      ; preds = %32, %22
  %work.0 = phi i32 [ 0, %22 ], [ %33, %32 ]
  %poscnt.0 = phi i64 [ %27, %22 ], [ %29, %32 ]
  %29 = lshr i64 %poscnt.0, 1, !dbg !915
  call void @llvm.dbg.value(metadata i64 %29, i64 0, metadata !909, metadata !109), !dbg !910
  %30 = icmp ne i64 %29, 0, !dbg !919
  br i1 %30, label %31, label %34, !dbg !920

; <label>:31                                      ; preds = %28
  br label %32, !dbg !921

; <label>:32                                      ; preds = %31
  %33 = add nsw i32 %work.0, 1, !dbg !923
  call void @llvm.dbg.value(metadata i32 %33, i64 0, metadata !911, metadata !109), !dbg !912
  br label %28, !dbg !925

; <label>:34                                      ; preds = %28
  %35 = sext i32 %26 to i64, !dbg !926
  %36 = getelementptr inbounds [7 x i8]* @.str4, i32 0, i64 %35, !dbg !926
  %37 = load i8* %36, align 1, !dbg !926
  %38 = sext i8 %37 to i32, !dbg !926
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i32 0, i32 0), i32 %26, i32 %38, i32 %work.0), !dbg !927
  %40 = load i64* @nodes, align 8, !dbg !928
  %41 = load i64* @msecs, align 8, !dbg !929
  %42 = load i64* @nodes, align 8, !dbg !930
  %43 = uitofp i64 %42 to double, !dbg !931
  %44 = load i64* @msecs, align 8, !dbg !932
  %45 = uitofp i64 %44 to double, !dbg !932
  %46 = fdiv double %43, %45, !dbg !931
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str11, i32 0, i32 0), i64 %40, i64 %41, double %46), !dbg !933
  call void @htstat(), !dbg !934
  br label %4, !dbg !935

; <label>:48                                      ; preds = %21
  ret i32 0, !dbg !936
}

declare i32 @puts(i8*) #2

declare i32 @getchar() #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!102, !103}
!llvm.ident = !{!104}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !8, !29, !76, !34} ; [ DW_TAG_compile_unit ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c] [DW_LANG_C99]
!1 = !{!"SearchGame.c", !"/media/sf_shared/Phoronix/fhourstones"}
!2 = !{!3}
!3 = !{!"0x4\00__rusage_who\00158\0032\0032\000\000\000", !4, null, null, !5, null, null, null} ; [ DW_TAG_enumeration_type ] [__rusage_who] [line 158, size 32, align 32, offset 0] [def] [from ]
!4 = !{!"/usr/include/x86_64-linux-gnu/bits/resource.h", !"/media/sf_shared/Phoronix/fhourstones"}
!5 = !{!6, !7}
!6 = !{!"0x28\00RUSAGE_SELF\000"}                 ; [ DW_TAG_enumerator ] [RUSAGE_SELF :: 0]
!7 = !{!"0x28\00RUSAGE_CHILDREN\00-1"}            ; [ DW_TAG_enumerator ] [RUSAGE_CHILDREN :: -1]
!8 = !{!9, !10, !16, !22, !27, !28}
!9 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!10 = !{!"0x16\00bitboard\0044\000\000\000\000", !11, null, !12} ; [ DW_TAG_typedef ] [bitboard] [line 44, size 0, align 0, offset 0] [from uint64]
!11 = !{!"./Game.c", !"/media/sf_shared/Phoronix/fhourstones"}
!12 = !{!"0x16\00uint64\0041\000\000\000\000", !11, null, !13} ; [ DW_TAG_typedef ] [uint64] [line 41, size 0, align 0, offset 0] [from u_int64_t]
!13 = !{!"0x16\00u_int64_t\00203\000\000\000\000", !14, null, !15} ; [ DW_TAG_typedef ] [u_int64_t] [line 203, size 0, align 0, offset 0] [from long unsigned int]
!14 = !{!"/usr/include/x86_64-linux-gnu/sys/types.h", !"/media/sf_shared/Phoronix/fhourstones"}
!15 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from hashentry]
!17 = !{!"0x16\00hashentry\0051\000\000\000\000", !18, null, !19} ; [ DW_TAG_typedef ] [hashentry] [line 51, size 0, align 0, offset 0] [from ]
!18 = !{!"./TransGame.c", !"/media/sf_shared/Phoronix/fhourstones"}
!19 = !{!"0x13\00\0039\0064\0032\000\000\000", !18, null, null, !20, null, null, null} ; [ DW_TAG_structure_type ] [line 39, size 64, align 32, offset 0] [def] [from ]
!20 = !{!21, !23, !24, !25, !26}
!21 = !{!"0xd\00biglock\0041\0026\0032\000\000", !18, !19, !22} ; [ DW_TAG_member ] [biglock] [line 41, size 26, align 32, offset 0] [from unsigned int]
!22 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!23 = !{!"0xd\00bigwork\0042\006\0032\0026\000", !18, !19, !22} ; [ DW_TAG_member ] [bigwork] [line 42, size 6, align 32, offset 26] [from unsigned int]
!24 = !{!"0xd\00newlock\0043\0026\0032\0032\000", !18, !19, !22} ; [ DW_TAG_member ] [newlock] [line 43, size 26, align 32, offset 32] [from unsigned int]
!25 = !{!"0xd\00newscore\0049\003\0032\0058\000", !18, !19, !22} ; [ DW_TAG_member ] [newscore] [line 49, size 3, align 32, offset 58] [from unsigned int]
!26 = !{!"0xd\00bigscore\0050\003\0032\0061\000", !18, !19, !22} ; [ DW_TAG_member ] [bigscore] [line 50, size 3, align 32, offset 61] [from unsigned int]
!27 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!28 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!29 = !{!30, !35, !38, !39, !42, !45, !48, !49, !50, !53, !55, !56, !57, !60, !63, !64, !68, !71, !72, !73, !74, !75}
!30 = !{!"0x2e\00reset\00reset\00\0064\000\001\000\000\000\000\0065", !11, !31, !32, null, void ()* @reset, null, null, !34} ; [ DW_TAG_subprogram ] [line 64] [def] [scope 65] [reset]
!31 = !{!"0x29", !11}                             ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!32 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !33, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = !{null}
!34 = !{}
!35 = !{!"0x2e\00positioncode\00positioncode\00\0073\000\001\000\000\000\000\0074", !11, !31, !36, null, i64 ()* @positioncode, null, null, !34} ; [ DW_TAG_subprogram ] [line 73] [def] [scope 74] [positioncode]
!36 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !37, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = !{!10}
!38 = !{!"0x2e\00printMoves\00printMoves\00\0080\000\001\000\000\000\000\0081", !11, !31, !32, null, void ()* @printMoves, null, null, !34} ; [ DW_TAG_subprogram ] [line 80] [def] [scope 81] [printMoves]
!39 = !{!"0x2e\00islegal\00islegal\00\0089\000\001\000\000\00256\000\0090", !11, !31, !40, null, i32 (i64)* @islegal, null, null, !34} ; [ DW_TAG_subprogram ] [line 89] [def] [scope 90] [islegal]
!40 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !41, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = !{!28, !10}
!42 = !{!"0x2e\00isplayable\00isplayable\00\0095\000\001\000\000\00256\000\0096", !11, !31, !43, null, i32 (i32)* @isplayable, null, null, !34} ; [ DW_TAG_subprogram ] [line 95] [def] [scope 96] [isplayable]
!43 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !44, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = !{!28, !28}
!45 = !{!"0x2e\00haswon\00haswon\00\00101\000\001\000\000\00256\000\00102", !11, !31, !46, null, i64 (i64)* @haswon, null, null, !34} ; [ DW_TAG_subprogram ] [line 101] [def] [scope 102] [haswon]
!46 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !47, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = !{!10, !10}
!48 = !{!"0x2e\00islegalhaswon\00islegalhaswon\00\00114\000\001\000\000\00256\000\00115", !11, !31, !40, null, i32 (i64)* @islegalhaswon, null, null, !34} ; [ DW_TAG_subprogram ] [line 114] [def] [scope 115] [islegalhaswon]
!49 = !{!"0x2e\00backmove\00backmove\00\00119\000\001\000\000\000\000\00120", !11, !31, !32, null, void ()* @backmove, null, null, !34} ; [ DW_TAG_subprogram ] [line 119] [def] [scope 120] [backmove]
!50 = !{!"0x2e\00makemove\00makemove\00\00127\000\001\000\000\00256\000\00128", !11, !31, !51, null, void (i32)* @makemove, null, null, !34} ; [ DW_TAG_subprogram ] [line 127] [def] [scope 128] [makemove]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{null, !28}
!53 = !{!"0x2e\00trans_init\00trans_init\00\0058\000\001\000\000\000\000\0059", !18, !54, !32, null, void ()* @trans_init, null, null, !34} ; [ DW_TAG_subprogram ] [line 58] [def] [scope 59] [trans_init]
!54 = !{!"0x29", !18}                             ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!55 = !{!"0x2e\00emptyTT\00emptyTT\00\0067\000\001\000\000\000\000\0068", !18, !54, !32, null, void ()* @emptyTT, null, null, !34} ; [ DW_TAG_subprogram ] [line 67] [def] [scope 68] [emptyTT]
!56 = !{!"0x2e\00hash\00hash\00\0077\000\001\000\000\000\000\0078", !18, !54, !32, null, void ()* @hash, null, null, !34} ; [ DW_TAG_subprogram ] [line 77] [def] [scope 78] [hash]
!57 = !{!"0x2e\00transpose\00transpose\00\0091\000\001\000\000\000\000\0092", !18, !54, !58, null, i32 ()* @transpose, null, null, !34} ; [ DW_TAG_subprogram ] [line 91] [def] [scope 92] [transpose]
!58 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !59, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = !{!28}
!60 = !{!"0x2e\00transtore\00transtore\00\00104\000\001\000\000\00256\000\00105", !18, !54, !61, null, void (i32, i32, i32, i32)* @transtore, null, null, !34} ; [ DW_TAG_subprogram ] [line 104] [def] [scope 105] [transtore]
!61 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !62, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = !{null, !28, !22, !28, !28}
!63 = !{!"0x2e\00htstat\00htstat\00\00121\000\001\000\000\000\000\00122", !18, !54, !32, null, void ()* @htstat, null, null, !34} ; [ DW_TAG_subprogram ] [line 121] [def] [scope 122] [htstat]
!64 = !{!"0x2e\00millisecs\00millisecs\00\0020\000\001\000\000\000\000\0021", !1, !65, !66, null, i64 ()* @millisecs, null, null, !34} ; [ DW_TAG_subprogram ] [line 20] [def] [scope 21] [millisecs]
!65 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!66 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !67, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!67 = !{!12}
!68 = !{!"0x2e\00min\00min\00\0031\000\001\000\000\00256\000\0031", !1, !65, !69, null, i32 (i32, i32)* @min, null, null, !34} ; [ DW_TAG_subprogram ] [line 31] [def] [min]
!69 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !70, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = !{!28, !28, !28}
!71 = !{!"0x2e\00max\00max\00\0032\000\001\000\000\00256\000\0032", !1, !65, !69, null, i32 (i32, i32)* @max, null, null, !34} ; [ DW_TAG_subprogram ] [line 32] [def] [max]
!72 = !{!"0x2e\00inithistory\00inithistory\00\0034\000\001\000\000\000\000\0035", !1, !65, !32, null, void ()* @inithistory, null, null, !34} ; [ DW_TAG_subprogram ] [line 34] [def] [scope 35] [inithistory]
!73 = !{!"0x2e\00ab\00ab\00\0045\000\001\000\000\00256\000\0046", !1, !65, !69, null, i32 (i32, i32)* @ab, null, null, !34} ; [ DW_TAG_subprogram ] [line 45] [def] [scope 46] [ab]
!74 = !{!"0x2e\00solve\00solve\00\00142\000\001\000\000\000\000\00143", !1, !65, !58, null, i32 ()* @solve, null, null, !34} ; [ DW_TAG_subprogram ] [line 142] [def] [scope 143] [solve]
!75 = !{!"0x2e\00main\00main\00\00162\000\001\000\000\000\000\00163", !1, !65, !58, null, i32 ()* @main, null, null, !34} ; [ DW_TAG_subprogram ] [line 162] [def] [scope 163] [main]
!76 = !{!77, !81, !85, !86, !90, !91, !92, !93, !94, !98, !99, !100, !101}
!77 = !{!"0x34\00color\00color\00\0060\000\001", null, !31, !78, [2 x i64]* @color, null} ; [ DW_TAG_variable ] [color] [line 60] [def]
!78 = !{!"0x1\00\000\00128\0064\000\000\000", null, null, !10, !79, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 64, offset 0] [from bitboard]
!79 = !{!80}
!80 = !{!"0x21\000\002"}                          ; [ DW_TAG_subrange_type ] [0, 1]
!81 = !{!"0x34\00moves\00moves\00\0061\000\001", null, !31, !82, [42 x i32]* @moves, null} ; [ DW_TAG_variable ] [moves] [line 61] [def]
!82 = !{!"0x1\00\000\001344\0032\000\000\000", null, null, !28, !83, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1344, align 32, offset 0] [from int]
!83 = !{!84}
!84 = !{!"0x21\000\0042"}                         ; [ DW_TAG_subrange_type ] [0, 41]
!85 = !{!"0x34\00nplies\00nplies\00\0061\000\001", null, !31, !28, i32* @nplies, null} ; [ DW_TAG_variable ] [nplies] [line 61] [def]
!86 = !{!"0x34\00height\00height\00\0062\000\001", null, !31, !87, [7 x i8]* @height, null} ; [ DW_TAG_variable ] [height] [line 62] [def]
!87 = !{!"0x1\00\000\0056\008\000\000\000", null, null, !9, !88, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 56, align 8, offset 0] [from char]
!88 = !{!89}
!89 = !{!"0x21\000\007"}                          ; [ DW_TAG_subrange_type ] [0, 6]
!90 = !{!"0x34\00htindex\00htindex\00\0053\000\001", null, !54, !22, i32* @htindex, null} ; [ DW_TAG_variable ] [htindex] [line 53] [def]
!91 = !{!"0x34\00lock\00lock\00\0053\000\001", null, !54, !22, i32* @lock, null} ; [ DW_TAG_variable ] [lock] [line 53] [def]
!92 = !{!"0x34\00ht\00ht\00\0054\000\001", null, !54, !16, %struct.hashentry** @ht, null} ; [ DW_TAG_variable ] [ht] [line 54] [def]
!93 = !{!"0x34\00posed\00posed\00\0056\000\001", null, !54, !12, i64* @posed, null} ; [ DW_TAG_variable ] [posed] [line 56] [def]
!94 = !{!"0x34\00history\00history\00\0027\000\001", null, !65, !95, [2 x [49 x i32]]* @history, null} ; [ DW_TAG_variable ] [history] [line 27] [def]
!95 = !{!"0x1\00\000\003136\0032\000\000\000", null, null, !28, !96, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3136, align 32, offset 0] [from int]
!96 = !{!80, !97}
!97 = !{!"0x21\000\0049"}                         ; [ DW_TAG_subrange_type ] [0, 48]
!98 = !{!"0x34\00nodes\00nodes\00\0028\000\001", null, !65, !12, i64* @nodes, null} ; [ DW_TAG_variable ] [nodes] [line 28] [def]
!99 = !{!"0x34\00msecs\00msecs\00\0028\000\001", null, !65, !12, i64* @msecs, null} ; [ DW_TAG_variable ] [msecs] [line 28] [def]
!100 = !{!"0x34\00bookply\00bookply\00\0029\000\001", null, !65, !28, i32* @bookply, null} ; [ DW_TAG_variable ] [bookply] [line 29] [def]
!101 = !{!"0x34\00reportply\00reportply\00\0029\000\001", null, !65, !28, i32* @reportply, null} ; [ DW_TAG_variable ] [reportply] [line 29] [def]
!102 = !{i32 2, !"Dwarf Version", i32 4}
!103 = !{i32 2, !"Debug Info Version", i32 2}
!104 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!105 = !MDLocation(line: 67, column: 3, scope: !30)
!106 = !MDLocation(line: 68, column: 14, scope: !30)
!107 = !MDLocation(line: 68, column: 3, scope: !30)
!108 = !{!"0x100\00i\0066\000", !30, !31, !28}    ; [ DW_TAG_auto_variable ] [i] [line 66]
!109 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!110 = !MDLocation(line: 66, column: 7, scope: !30)
!111 = !MDLocation(line: 69, column: 8, scope: !112)
!112 = !{!"0xb\0069\003\000", !11, !30}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!113 = !MDLocation(line: 69, column: 13, scope: !114)
!114 = !{!"0xb\002", !11, !115}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!115 = !{!"0xb\001", !11, !116}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!116 = !{!"0xb\0069\003\001", !11, !112}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!117 = !MDLocation(line: 69, column: 3, scope: !112)
!118 = !MDLocation(line: 70, column: 24, scope: !116)
!119 = !MDLocation(line: 70, column: 17, scope: !116)
!120 = !MDLocation(line: 70, column: 5, scope: !116)
!121 = !MDLocation(line: 69, column: 22, scope: !116)
!122 = !MDLocation(line: 69, column: 3, scope: !116)
!123 = !MDLocation(line: 71, column: 1, scope: !30)
!124 = !MDLocation(line: 75, column: 16, scope: !35)
!125 = !MDLocation(line: 75, column: 10, scope: !35)
!126 = !MDLocation(line: 75, column: 28, scope: !35)
!127 = !MDLocation(line: 75, column: 39, scope: !35)
!128 = !MDLocation(line: 75, column: 3, scope: !35)
!129 = !{!"0x100\00i\0082\000", !38, !31, !28}    ; [ DW_TAG_auto_variable ] [i] [line 82]
!130 = !MDLocation(line: 82, column: 7, scope: !38)
!131 = !MDLocation(line: 84, column: 8, scope: !132)
!132 = !{!"0xb\0084\003\002", !11, !38}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!133 = !MDLocation(line: 84, column: 15, scope: !134)
!134 = !{!"0xb\0084\003\003", !11, !132}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!135 = !MDLocation(line: 84, column: 13, scope: !134)
!136 = !MDLocation(line: 84, column: 3, scope: !132)
!137 = !MDLocation(line: 85, column: 20, scope: !134)
!138 = !MDLocation(line: 85, column: 18, scope: !134)
!139 = !MDLocation(line: 85, column: 5, scope: !134)
!140 = !MDLocation(line: 84, column: 23, scope: !134)
!141 = !MDLocation(line: 84, column: 3, scope: !134)
!142 = !MDLocation(line: 86, column: 1, scope: !38)
!143 = !{!"0x101\00newboard\0016777305\000", !39, !31, !10} ; [ DW_TAG_arg_variable ] [newboard] [line 89]
!144 = !MDLocation(line: 89, column: 22, scope: !39)
!145 = !MDLocation(line: 91, column: 11, scope: !39)
!146 = !MDLocation(line: 91, column: 10, scope: !39)
!147 = !MDLocation(line: 91, column: 3, scope: !39)
!148 = !{!"0x101\00col\0016777311\000", !42, !31, !28} ; [ DW_TAG_arg_variable ] [col] [line 95]
!149 = !MDLocation(line: 95, column: 20, scope: !42)
!150 = !MDLocation(line: 97, column: 24, scope: !42)
!151 = !MDLocation(line: 97, column: 18, scope: !42)
!152 = !MDLocation(line: 97, column: 52, scope: !42)
!153 = !MDLocation(line: 97, column: 37, scope: !42)
!154 = !MDLocation(line: 97, column: 10, scope: !42)
!155 = !MDLocation(line: 97, column: 3, scope: !42)
!156 = !{!"0x101\00newboard\0016777317\000", !45, !31, !10} ; [ DW_TAG_arg_variable ] [newboard] [line 101]
!157 = !MDLocation(line: 101, column: 26, scope: !45)
!158 = !MDLocation(line: 103, column: 32, scope: !45)
!159 = !MDLocation(line: 103, column: 20, scope: !45)
!160 = !{!"0x100\00diag1\00103\000", !45, !31, !10} ; [ DW_TAG_auto_variable ] [diag1] [line 103]
!161 = !MDLocation(line: 103, column: 12, scope: !45)
!162 = !MDLocation(line: 104, column: 31, scope: !45)
!163 = !MDLocation(line: 104, column: 19, scope: !45)
!164 = !{!"0x100\00hori\00104\000", !45, !31, !10} ; [ DW_TAG_auto_variable ] [hori] [line 104]
!165 = !MDLocation(line: 104, column: 12, scope: !45)
!166 = !MDLocation(line: 105, column: 32, scope: !45)
!167 = !MDLocation(line: 105, column: 20, scope: !45)
!168 = !{!"0x100\00diag2\00105\000", !45, !31, !10} ; [ DW_TAG_auto_variable ] [diag2] [line 105]
!169 = !MDLocation(line: 105, column: 12, scope: !45)
!170 = !MDLocation(line: 106, column: 31, scope: !45)
!171 = !MDLocation(line: 106, column: 19, scope: !45)
!172 = !{!"0x100\00vert\00106\000", !45, !31, !10} ; [ DW_TAG_auto_variable ] [vert] [line 106]
!173 = !MDLocation(line: 106, column: 12, scope: !45)
!174 = !MDLocation(line: 107, column: 21, scope: !45)
!175 = !MDLocation(line: 107, column: 12, scope: !45)
!176 = !MDLocation(line: 108, column: 20, scope: !45)
!177 = !MDLocation(line: 108, column: 12, scope: !45)
!178 = !MDLocation(line: 107, column: 11, scope: !45)
!179 = !MDLocation(line: 109, column: 21, scope: !45)
!180 = !MDLocation(line: 109, column: 12, scope: !45)
!181 = !MDLocation(line: 110, column: 20, scope: !45)
!182 = !MDLocation(line: 110, column: 12, scope: !45)
!183 = !MDLocation(line: 107, column: 3, scope: !45)
!184 = !{!"0x101\00newboard\0016777330\000", !48, !31, !10} ; [ DW_TAG_arg_variable ] [newboard] [line 114]
!185 = !MDLocation(line: 114, column: 28, scope: !48)
!186 = !MDLocation(line: 116, column: 10, scope: !48)
!187 = !MDLocation(line: 116, column: 31, scope: !48)
!188 = !MDLocation(line: 116, column: 10, scope: !189)
!189 = !{!"0xb\002", !11, !48}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!190 = !MDLocation(line: 116, column: 3, scope: !48)
!191 = !MDLocation(line: 123, column: 13, scope: !49)
!192 = !MDLocation(line: 123, column: 7, scope: !49)
!193 = !{!"0x100\00n\00121\000", !49, !31, !28}   ; [ DW_TAG_auto_variable ] [n] [line 121]
!194 = !MDLocation(line: 121, column: 7, scope: !49)
!195 = !MDLocation(line: 124, column: 35, scope: !49)
!196 = !MDLocation(line: 124, column: 22, scope: !49)
!197 = !MDLocation(line: 124, column: 9, scope: !49)
!198 = !MDLocation(line: 124, column: 3, scope: !49)
!199 = !MDLocation(line: 125, column: 1, scope: !49)
!200 = !{!"0x101\00n\0016777343\000", !50, !31, !28} ; [ DW_TAG_arg_variable ] [n] [line 127]
!201 = !MDLocation(line: 127, column: 19, scope: !50)
!202 = !MDLocation(line: 129, column: 35, scope: !50)
!203 = !MDLocation(line: 129, column: 22, scope: !50)
!204 = !MDLocation(line: 129, column: 9, scope: !50)
!205 = !MDLocation(line: 129, column: 3, scope: !50)
!206 = !MDLocation(line: 130, column: 9, scope: !50)
!207 = !MDLocation(line: 130, column: 3, scope: !50)
!208 = !MDLocation(line: 131, column: 1, scope: !50)
!209 = !MDLocation(line: 60, column: 21, scope: !53)
!210 = !MDLocation(line: 60, column: 8, scope: !53)
!211 = !MDLocation(line: 60, column: 3, scope: !53)
!212 = !MDLocation(line: 61, column: 8, scope: !213)
!213 = !{!"0xb\0061\007\004", !18, !53}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!214 = !MDLocation(line: 61, column: 7, scope: !53)
!215 = !MDLocation(line: 62, column: 5, scope: !216)
!216 = !{!"0xb\0061\0012\005", !18, !213}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!217 = !MDLocation(line: 63, column: 5, scope: !216)
!218 = !MDLocation(line: 65, column: 1, scope: !53)
!219 = !{!"0x100\00i\0069\000", !55, !54, !28}    ; [ DW_TAG_auto_variable ] [i] [line 69]
!220 = !MDLocation(line: 69, column: 7, scope: !55)
!221 = !MDLocation(line: 71, column: 8, scope: !222)
!222 = !{!"0xb\0071\003\006", !18, !55}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!223 = !MDLocation(line: 71, column: 13, scope: !224)
!224 = !{!"0xb\002", !18, !225}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!225 = !{!"0xb\001", !18, !226}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!226 = !{!"0xb\0071\003\007", !18, !222}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!227 = !MDLocation(line: 71, column: 3, scope: !222)
!228 = !MDLocation(line: 72, column: 5, scope: !229)
!229 = !{!"0xb\0071\0030\008", !18, !226}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!230 = !MDLocation(line: 73, column: 3, scope: !229)
!231 = !MDLocation(line: 71, column: 25, scope: !226)
!232 = !MDLocation(line: 71, column: 3, scope: !226)
!233 = !MDLocation(line: 74, column: 3, scope: !55)
!234 = !MDLocation(line: 75, column: 1, scope: !55)
!235 = !MDLocation(line: 79, column: 26, scope: !56)
!236 = !{!"0x100\00htemp\0079\000", !56, !54, !10} ; [ DW_TAG_auto_variable ] [htemp] [line 79]
!237 = !MDLocation(line: 79, column: 18, scope: !56)
!238 = !MDLocation(line: 80, column: 7, scope: !239)
!239 = !{!"0xb\0080\007\009", !18, !56}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!240 = !MDLocation(line: 80, column: 7, scope: !56)
!241 = !{!"0x100\00htemp2\0081\000", !242, !54, !10} ; [ DW_TAG_auto_variable ] [htemp2] [line 81]
!242 = !{!"0xb\0080\0025\0010", !18, !239}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!243 = !MDLocation(line: 81, column: 14, scope: !242)
!244 = !{!"0x100\00htmp\0079\000", !56, !54, !10} ; [ DW_TAG_auto_variable ] [htmp] [line 79]
!245 = !MDLocation(line: 79, column: 12, scope: !56)
!246 = !MDLocation(line: 82, column: 10, scope: !247)
!247 = !{!"0xb\0082\005\0011", !18, !242}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!248 = !MDLocation(line: 82, column: 22, scope: !249)
!249 = !{!"0xb\002", !18, !250}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!250 = !{!"0xb\001", !18, !251}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!251 = !{!"0xb\0082\005\0012", !18, !247}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!252 = !MDLocation(line: 82, column: 5, scope: !247)
!253 = !MDLocation(line: 83, column: 16, scope: !251)
!254 = !MDLocation(line: 83, column: 30, scope: !251)
!255 = !MDLocation(line: 83, column: 7, scope: !251)
!256 = !MDLocation(line: 82, column: 31, scope: !251)
!257 = !MDLocation(line: 82, column: 5, scope: !251)
!258 = !MDLocation(line: 84, column: 9, scope: !259)
!259 = !{!"0xb\0084\009\0013", !18, !242}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!260 = !MDLocation(line: 84, column: 9, scope: !242)
!261 = !MDLocation(line: 85, column: 7, scope: !259)
!262 = !MDLocation(line: 86, column: 3, scope: !242)
!263 = !MDLocation(line: 87, column: 42, scope: !56)
!264 = !MDLocation(line: 87, column: 10, scope: !56)
!265 = !MDLocation(line: 87, column: 3, scope: !56)
!266 = !MDLocation(line: 88, column: 28, scope: !56)
!267 = !MDLocation(line: 88, column: 13, scope: !56)
!268 = !MDLocation(line: 88, column: 3, scope: !56)
!269 = !MDLocation(line: 89, column: 1, scope: !56)
!270 = !{!"0x100\00he\0093\000", !57, !54, !17}   ; [ DW_TAG_auto_variable ] [he] [line 93]
!271 = !MDLocation(line: 93, column: 13, scope: !57)
!272 = !MDLocation(line: 95, column: 3, scope: !57)
!273 = !MDLocation(line: 96, column: 11, scope: !57)
!274 = !MDLocation(line: 96, column: 3, scope: !57)
!275 = !MDLocation(line: 96, column: 8, scope: !57)
!276 = !MDLocation(line: 97, column: 7, scope: !277)
!277 = !{!"0xb\0097\007\0014", !18, !57}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!278 = !MDLocation(line: 97, column: 21, scope: !277)
!279 = !MDLocation(line: 97, column: 7, scope: !57)
!280 = !MDLocation(line: 98, column: 12, scope: !277)
!281 = !MDLocation(line: 98, column: 5, scope: !277)
!282 = !MDLocation(line: 99, column: 7, scope: !283)
!283 = !{!"0xb\0099\007\0015", !18, !57}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!284 = !MDLocation(line: 99, column: 21, scope: !283)
!285 = !MDLocation(line: 99, column: 7, scope: !57)
!286 = !MDLocation(line: 100, column: 12, scope: !283)
!287 = !MDLocation(line: 100, column: 5, scope: !283)
!288 = !MDLocation(line: 101, column: 3, scope: !57)
!289 = !MDLocation(line: 102, column: 1, scope: !57)
!290 = !{!"0x101\00x\0016777320\000", !60, !54, !28} ; [ DW_TAG_arg_variable ] [x] [line 104]
!291 = !MDLocation(line: 104, column: 20, scope: !60)
!292 = !{!"0x101\00lock\0033554536\000", !60, !54, !22} ; [ DW_TAG_arg_variable ] [lock] [line 104]
!293 = !MDLocation(line: 104, column: 36, scope: !60)
!294 = !{!"0x101\00score\0050331752\000", !60, !54, !28} ; [ DW_TAG_arg_variable ] [score] [line 104]
!295 = !MDLocation(line: 104, column: 46, scope: !60)
!296 = !{!"0x101\00work\0067108968\000", !60, !54, !28} ; [ DW_TAG_arg_variable ] [work] [line 104]
!297 = !MDLocation(line: 104, column: 57, scope: !60)
!298 = !{!"0x100\00he\00106\000", !60, !54, !17}  ; [ DW_TAG_auto_variable ] [he] [line 106]
!299 = !MDLocation(line: 106, column: 13, scope: !60)
!300 = !MDLocation(line: 108, column: 3, scope: !60)
!301 = !MDLocation(line: 109, column: 3, scope: !60)
!302 = !MDLocation(line: 109, column: 8, scope: !60)
!303 = !MDLocation(line: 110, column: 7, scope: !304)
!304 = !{!"0xb\00110\007\0016", !18, !60}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!305 = !MDLocation(line: 110, column: 7, scope: !60)
!306 = !MDLocation(line: 110, column: 37, scope: !304)
!307 = !MDLocation(line: 110, column: 29, scope: !304)
!308 = !MDLocation(line: 111, column: 5, scope: !309)
!309 = !{!"0xb\00110\0049\0017", !18, !304}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!310 = !MDLocation(line: 112, column: 5, scope: !309)
!311 = !MDLocation(line: 113, column: 5, scope: !309)
!312 = !MDLocation(line: 114, column: 3, scope: !309)
!313 = !MDLocation(line: 115, column: 5, scope: !314)
!314 = !{!"0xb\00114\0010\0018", !18, !304}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!315 = !MDLocation(line: 116, column: 5, scope: !314)
!316 = !MDLocation(line: 118, column: 3, scope: !60)
!317 = !MDLocation(line: 119, column: 1, scope: !60)
!318 = !{!"0x100\00typecnt\00124\000", !63, !54, !319} ; [ DW_TAG_auto_variable ] [typecnt] [line 124]
!319 = !{!"0x1\00\000\00256\0032\000\000\000", null, null, !28, !320, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 32, offset 0] [from int]
!320 = !{!321}
!321 = !{!"0x21\000\008"}                         ; [ DW_TAG_subrange_type ] [0, 7]
!322 = !MDLocation(line: 124, column: 7, scope: !63)
!323 = !{!"0x100\00he\00125\000", !63, !54, !17}  ; [ DW_TAG_auto_variable ] [he] [line 125]
!324 = !MDLocation(line: 125, column: 13, scope: !63)
!325 = !{!"0x100\00i\00123\000", !63, !54, !28}   ; [ DW_TAG_auto_variable ] [i] [line 123]
!326 = !MDLocation(line: 123, column: 14, scope: !63)
!327 = !MDLocation(line: 127, column: 8, scope: !328)
!328 = !{!"0xb\00127\003\0019", !18, !63}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!329 = !MDLocation(line: 127, column: 13, scope: !330)
!330 = !{!"0xb\002", !18, !331}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!331 = !{!"0xb\001", !18, !332}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!332 = !{!"0xb\00127\003\0020", !18, !328}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!333 = !MDLocation(line: 127, column: 3, scope: !328)
!334 = !MDLocation(line: 128, column: 5, scope: !332)
!335 = !MDLocation(line: 127, column: 18, scope: !332)
!336 = !MDLocation(line: 127, column: 3, scope: !332)
!337 = !MDLocation(line: 129, column: 8, scope: !338)
!338 = !{!"0xb\00129\003\0021", !18, !63}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!339 = !MDLocation(line: 129, column: 13, scope: !340)
!340 = !{!"0xb\002", !18, !341}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!341 = !{!"0xb\001", !18, !342}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!342 = !{!"0xb\00129\003\0022", !18, !338}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!343 = !MDLocation(line: 129, column: 3, scope: !338)
!344 = !MDLocation(line: 130, column: 5, scope: !345)
!345 = !{!"0xb\00129\0030\0023", !18, !342}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!346 = !MDLocation(line: 130, column: 10, scope: !345)
!347 = !MDLocation(line: 131, column: 9, scope: !348)
!348 = !{!"0xb\00131\009\0024", !18, !345}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!349 = !MDLocation(line: 131, column: 9, scope: !345)
!350 = !MDLocation(line: 132, column: 15, scope: !348)
!351 = !MDLocation(line: 132, column: 7, scope: !348)
!352 = !MDLocation(line: 133, column: 9, scope: !353)
!353 = !{!"0xb\00133\009\0025", !18, !345}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!354 = !MDLocation(line: 133, column: 9, scope: !345)
!355 = !MDLocation(line: 134, column: 15, scope: !353)
!356 = !MDLocation(line: 134, column: 7, scope: !353)
!357 = !MDLocation(line: 135, column: 3, scope: !345)
!358 = !MDLocation(line: 129, column: 25, scope: !342)
!359 = !MDLocation(line: 129, column: 3, scope: !342)
!360 = !{!"0x100\00total\00123\000", !63, !54, !28} ; [ DW_TAG_auto_variable ] [total] [line 123]
!361 = !MDLocation(line: 123, column: 7, scope: !63)
!362 = !MDLocation(line: 136, column: 8, scope: !363)
!363 = !{!"0xb\00136\003\0026", !18, !63}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!364 = !MDLocation(line: 136, column: 24, scope: !365)
!365 = !{!"0xb\002", !18, !366}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!366 = !{!"0xb\001", !18, !367}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!367 = !{!"0xb\00136\003\0027", !18, !363}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!368 = !MDLocation(line: 136, column: 3, scope: !363)
!369 = !MDLocation(line: 137, column: 14, scope: !367)
!370 = !MDLocation(line: 137, column: 5, scope: !367)
!371 = !MDLocation(line: 136, column: 32, scope: !367)
!372 = !MDLocation(line: 136, column: 3, scope: !367)
!373 = !MDLocation(line: 138, column: 7, scope: !374)
!374 = !{!"0xb\00138\007\0028", !18, !63}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!375 = !MDLocation(line: 138, column: 7, scope: !63)
!376 = !MDLocation(line: 140, column: 7, scope: !377)
!377 = !{!"0xb\00138\0018\0029", !18, !374}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!378 = !MDLocation(line: 140, column: 21, scope: !377)
!379 = !MDLocation(line: 140, column: 36, scope: !377)
!380 = !MDLocation(line: 140, column: 54, scope: !377)
!381 = !MDLocation(line: 141, column: 7, scope: !377)
!382 = !MDLocation(line: 141, column: 21, scope: !377)
!383 = !MDLocation(line: 141, column: 36, scope: !377)
!384 = !MDLocation(line: 141, column: 53, scope: !377)
!385 = !MDLocation(line: 142, column: 7, scope: !377)
!386 = !MDLocation(line: 142, column: 20, scope: !377)
!387 = !MDLocation(line: 139, column: 5, scope: !377)
!388 = !MDLocation(line: 143, column: 3, scope: !377)
!389 = !MDLocation(line: 144, column: 1, scope: !63)
!390 = !{!"0x100\00rusage\0022\000", !64, !65, !391} ; [ DW_TAG_auto_variable ] [rusage] [line 22]
!391 = !{!"0x13\00rusage\00187\001152\0064\000\000\000", !4, null, null, !392, null, null, null} ; [ DW_TAG_structure_type ] [rusage] [line 187, size 1152, align 64, offset 0] [def] [from ]
!392 = !{!393, !403, !404, !410, !415, !420, !425, !430, !435, !440, !445, !450, !455, !460, !465, !470}
!393 = !{!"0xd\00ru_utime\00190\00128\0064\000\000", !4, !391, !394} ; [ DW_TAG_member ] [ru_utime] [line 190, size 128, align 64, offset 0] [from timeval]
!394 = !{!"0x13\00timeval\0030\00128\0064\000\000\000", !395, null, null, !396, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!395 = !{!"/usr/include/x86_64-linux-gnu/bits/time.h", !"/media/sf_shared/Phoronix/fhourstones"}
!396 = !{!397, !401}
!397 = !{!"0xd\00tv_sec\0032\0064\0064\000\000", !395, !394, !398} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!398 = !{!"0x16\00__time_t\00139\000\000\000\000", !399, null, !400} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!399 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/media/sf_shared/Phoronix/fhourstones"}
!400 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!401 = !{!"0xd\00tv_usec\0033\0064\0064\0064\000", !395, !394, !402} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!402 = !{!"0x16\00__suseconds_t\00141\000\000\000\000", !399, null, !400} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!403 = !{!"0xd\00ru_stime\00192\00128\0064\00128\000", !4, !391, !394} ; [ DW_TAG_member ] [ru_stime] [line 192, size 128, align 64, offset 128] [from timeval]
!404 = !{!"0xd\00\00194\0064\0064\00256\000", !4, !391, !405} ; [ DW_TAG_member ] [line 194, size 64, align 64, offset 256] [from ]
!405 = !{!"0x17\00\00194\0064\0064\000\000\000", !4, !391, null, !406, null, null, null} ; [ DW_TAG_union_type ] [line 194, size 64, align 64, offset 0] [def] [from ]
!406 = !{!407, !408}
!407 = !{!"0xd\00ru_maxrss\00196\0064\0064\000\000", !4, !405, !400} ; [ DW_TAG_member ] [ru_maxrss] [line 196, size 64, align 64, offset 0] [from long int]
!408 = !{!"0xd\00__ru_maxrss_word\00197\0064\0064\000\000", !4, !405, !409} ; [ DW_TAG_member ] [__ru_maxrss_word] [line 197, size 64, align 64, offset 0] [from __syscall_slong_t]
!409 = !{!"0x16\00__syscall_slong_t\00175\000\000\000\000", !399, null, !400} ; [ DW_TAG_typedef ] [__syscall_slong_t] [line 175, size 0, align 0, offset 0] [from long int]
!410 = !{!"0xd\00\00202\0064\0064\00320\000", !4, !391, !411} ; [ DW_TAG_member ] [line 202, size 64, align 64, offset 320] [from ]
!411 = !{!"0x17\00\00202\0064\0064\000\000\000", !4, !391, null, !412, null, null, null} ; [ DW_TAG_union_type ] [line 202, size 64, align 64, offset 0] [def] [from ]
!412 = !{!413, !414}
!413 = !{!"0xd\00ru_ixrss\00204\0064\0064\000\000", !4, !411, !400} ; [ DW_TAG_member ] [ru_ixrss] [line 204, size 64, align 64, offset 0] [from long int]
!414 = !{!"0xd\00__ru_ixrss_word\00205\0064\0064\000\000", !4, !411, !409} ; [ DW_TAG_member ] [__ru_ixrss_word] [line 205, size 64, align 64, offset 0] [from __syscall_slong_t]
!415 = !{!"0xd\00\00208\0064\0064\00384\000", !4, !391, !416} ; [ DW_TAG_member ] [line 208, size 64, align 64, offset 384] [from ]
!416 = !{!"0x17\00\00208\0064\0064\000\000\000", !4, !391, null, !417, null, null, null} ; [ DW_TAG_union_type ] [line 208, size 64, align 64, offset 0] [def] [from ]
!417 = !{!418, !419}
!418 = !{!"0xd\00ru_idrss\00210\0064\0064\000\000", !4, !416, !400} ; [ DW_TAG_member ] [ru_idrss] [line 210, size 64, align 64, offset 0] [from long int]
!419 = !{!"0xd\00__ru_idrss_word\00211\0064\0064\000\000", !4, !416, !409} ; [ DW_TAG_member ] [__ru_idrss_word] [line 211, size 64, align 64, offset 0] [from __syscall_slong_t]
!420 = !{!"0xd\00\00214\0064\0064\00448\000", !4, !391, !421} ; [ DW_TAG_member ] [line 214, size 64, align 64, offset 448] [from ]
!421 = !{!"0x17\00\00214\0064\0064\000\000\000", !4, !391, null, !422, null, null, null} ; [ DW_TAG_union_type ] [line 214, size 64, align 64, offset 0] [def] [from ]
!422 = !{!423, !424}
!423 = !{!"0xd\00ru_isrss\00216\0064\0064\000\000", !4, !421, !400} ; [ DW_TAG_member ] [ru_isrss] [line 216, size 64, align 64, offset 0] [from long int]
!424 = !{!"0xd\00__ru_isrss_word\00217\0064\0064\000\000", !4, !421, !409} ; [ DW_TAG_member ] [__ru_isrss_word] [line 217, size 64, align 64, offset 0] [from __syscall_slong_t]
!425 = !{!"0xd\00\00221\0064\0064\00512\000", !4, !391, !426} ; [ DW_TAG_member ] [line 221, size 64, align 64, offset 512] [from ]
!426 = !{!"0x17\00\00221\0064\0064\000\000\000", !4, !391, null, !427, null, null, null} ; [ DW_TAG_union_type ] [line 221, size 64, align 64, offset 0] [def] [from ]
!427 = !{!428, !429}
!428 = !{!"0xd\00ru_minflt\00223\0064\0064\000\000", !4, !426, !400} ; [ DW_TAG_member ] [ru_minflt] [line 223, size 64, align 64, offset 0] [from long int]
!429 = !{!"0xd\00__ru_minflt_word\00224\0064\0064\000\000", !4, !426, !409} ; [ DW_TAG_member ] [__ru_minflt_word] [line 224, size 64, align 64, offset 0] [from __syscall_slong_t]
!430 = !{!"0xd\00\00227\0064\0064\00576\000", !4, !391, !431} ; [ DW_TAG_member ] [line 227, size 64, align 64, offset 576] [from ]
!431 = !{!"0x17\00\00227\0064\0064\000\000\000", !4, !391, null, !432, null, null, null} ; [ DW_TAG_union_type ] [line 227, size 64, align 64, offset 0] [def] [from ]
!432 = !{!433, !434}
!433 = !{!"0xd\00ru_majflt\00229\0064\0064\000\000", !4, !431, !400} ; [ DW_TAG_member ] [ru_majflt] [line 229, size 64, align 64, offset 0] [from long int]
!434 = !{!"0xd\00__ru_majflt_word\00230\0064\0064\000\000", !4, !431, !409} ; [ DW_TAG_member ] [__ru_majflt_word] [line 230, size 64, align 64, offset 0] [from __syscall_slong_t]
!435 = !{!"0xd\00\00233\0064\0064\00640\000", !4, !391, !436} ; [ DW_TAG_member ] [line 233, size 64, align 64, offset 640] [from ]
!436 = !{!"0x17\00\00233\0064\0064\000\000\000", !4, !391, null, !437, null, null, null} ; [ DW_TAG_union_type ] [line 233, size 64, align 64, offset 0] [def] [from ]
!437 = !{!438, !439}
!438 = !{!"0xd\00ru_nswap\00235\0064\0064\000\000", !4, !436, !400} ; [ DW_TAG_member ] [ru_nswap] [line 235, size 64, align 64, offset 0] [from long int]
!439 = !{!"0xd\00__ru_nswap_word\00236\0064\0064\000\000", !4, !436, !409} ; [ DW_TAG_member ] [__ru_nswap_word] [line 236, size 64, align 64, offset 0] [from __syscall_slong_t]
!440 = !{!"0xd\00\00240\0064\0064\00704\000", !4, !391, !441} ; [ DW_TAG_member ] [line 240, size 64, align 64, offset 704] [from ]
!441 = !{!"0x17\00\00240\0064\0064\000\000\000", !4, !391, null, !442, null, null, null} ; [ DW_TAG_union_type ] [line 240, size 64, align 64, offset 0] [def] [from ]
!442 = !{!443, !444}
!443 = !{!"0xd\00ru_inblock\00242\0064\0064\000\000", !4, !441, !400} ; [ DW_TAG_member ] [ru_inblock] [line 242, size 64, align 64, offset 0] [from long int]
!444 = !{!"0xd\00__ru_inblock_word\00243\0064\0064\000\000", !4, !441, !409} ; [ DW_TAG_member ] [__ru_inblock_word] [line 243, size 64, align 64, offset 0] [from __syscall_slong_t]
!445 = !{!"0xd\00\00246\0064\0064\00768\000", !4, !391, !446} ; [ DW_TAG_member ] [line 246, size 64, align 64, offset 768] [from ]
!446 = !{!"0x17\00\00246\0064\0064\000\000\000", !4, !391, null, !447, null, null, null} ; [ DW_TAG_union_type ] [line 246, size 64, align 64, offset 0] [def] [from ]
!447 = !{!448, !449}
!448 = !{!"0xd\00ru_oublock\00248\0064\0064\000\000", !4, !446, !400} ; [ DW_TAG_member ] [ru_oublock] [line 248, size 64, align 64, offset 0] [from long int]
!449 = !{!"0xd\00__ru_oublock_word\00249\0064\0064\000\000", !4, !446, !409} ; [ DW_TAG_member ] [__ru_oublock_word] [line 249, size 64, align 64, offset 0] [from __syscall_slong_t]
!450 = !{!"0xd\00\00252\0064\0064\00832\000", !4, !391, !451} ; [ DW_TAG_member ] [line 252, size 64, align 64, offset 832] [from ]
!451 = !{!"0x17\00\00252\0064\0064\000\000\000", !4, !391, null, !452, null, null, null} ; [ DW_TAG_union_type ] [line 252, size 64, align 64, offset 0] [def] [from ]
!452 = !{!453, !454}
!453 = !{!"0xd\00ru_msgsnd\00254\0064\0064\000\000", !4, !451, !400} ; [ DW_TAG_member ] [ru_msgsnd] [line 254, size 64, align 64, offset 0] [from long int]
!454 = !{!"0xd\00__ru_msgsnd_word\00255\0064\0064\000\000", !4, !451, !409} ; [ DW_TAG_member ] [__ru_msgsnd_word] [line 255, size 64, align 64, offset 0] [from __syscall_slong_t]
!455 = !{!"0xd\00\00258\0064\0064\00896\000", !4, !391, !456} ; [ DW_TAG_member ] [line 258, size 64, align 64, offset 896] [from ]
!456 = !{!"0x17\00\00258\0064\0064\000\000\000", !4, !391, null, !457, null, null, null} ; [ DW_TAG_union_type ] [line 258, size 64, align 64, offset 0] [def] [from ]
!457 = !{!458, !459}
!458 = !{!"0xd\00ru_msgrcv\00260\0064\0064\000\000", !4, !456, !400} ; [ DW_TAG_member ] [ru_msgrcv] [line 260, size 64, align 64, offset 0] [from long int]
!459 = !{!"0xd\00__ru_msgrcv_word\00261\0064\0064\000\000", !4, !456, !409} ; [ DW_TAG_member ] [__ru_msgrcv_word] [line 261, size 64, align 64, offset 0] [from __syscall_slong_t]
!460 = !{!"0xd\00\00264\0064\0064\00960\000", !4, !391, !461} ; [ DW_TAG_member ] [line 264, size 64, align 64, offset 960] [from ]
!461 = !{!"0x17\00\00264\0064\0064\000\000\000", !4, !391, null, !462, null, null, null} ; [ DW_TAG_union_type ] [line 264, size 64, align 64, offset 0] [def] [from ]
!462 = !{!463, !464}
!463 = !{!"0xd\00ru_nsignals\00266\0064\0064\000\000", !4, !461, !400} ; [ DW_TAG_member ] [ru_nsignals] [line 266, size 64, align 64, offset 0] [from long int]
!464 = !{!"0xd\00__ru_nsignals_word\00267\0064\0064\000\000", !4, !461, !409} ; [ DW_TAG_member ] [__ru_nsignals_word] [line 267, size 64, align 64, offset 0] [from __syscall_slong_t]
!465 = !{!"0xd\00\00272\0064\0064\001024\000", !4, !391, !466} ; [ DW_TAG_member ] [line 272, size 64, align 64, offset 1024] [from ]
!466 = !{!"0x17\00\00272\0064\0064\000\000\000", !4, !391, null, !467, null, null, null} ; [ DW_TAG_union_type ] [line 272, size 64, align 64, offset 0] [def] [from ]
!467 = !{!468, !469}
!468 = !{!"0xd\00ru_nvcsw\00274\0064\0064\000\000", !4, !466, !400} ; [ DW_TAG_member ] [ru_nvcsw] [line 274, size 64, align 64, offset 0] [from long int]
!469 = !{!"0xd\00__ru_nvcsw_word\00275\0064\0064\000\000", !4, !466, !409} ; [ DW_TAG_member ] [__ru_nvcsw_word] [line 275, size 64, align 64, offset 0] [from __syscall_slong_t]
!470 = !{!"0xd\00\00279\0064\0064\001088\000", !4, !391, !471} ; [ DW_TAG_member ] [line 279, size 64, align 64, offset 1088] [from ]
!471 = !{!"0x17\00\00279\0064\0064\000\000\000", !4, !391, null, !472, null, null, null} ; [ DW_TAG_union_type ] [line 279, size 64, align 64, offset 0] [def] [from ]
!472 = !{!473, !474}
!473 = !{!"0xd\00ru_nivcsw\00281\0064\0064\000\000", !4, !471, !400} ; [ DW_TAG_member ] [ru_nivcsw] [line 281, size 64, align 64, offset 0] [from long int]
!474 = !{!"0xd\00__ru_nivcsw_word\00282\0064\0064\000\000", !4, !471, !409} ; [ DW_TAG_member ] [__ru_nivcsw_word] [line 282, size 64, align 64, offset 0] [from __syscall_slong_t]
!475 = !MDLocation(line: 22, column: 17, scope: !64)
!476 = !MDLocation(line: 23, column: 3, scope: !64)
!477 = !MDLocation(line: 24, column: 10, scope: !64)
!478 = !MDLocation(line: 24, column: 42, scope: !64)
!479 = !MDLocation(line: 24, column: 3, scope: !64)
!480 = !{!"0x101\00x\0016777247\000", !68, !65, !28} ; [ DW_TAG_arg_variable ] [x] [line 31]
!481 = !MDLocation(line: 31, column: 13, scope: !68)
!482 = !{!"0x101\00y\0033554463\000", !68, !65, !28} ; [ DW_TAG_arg_variable ] [y] [line 31]
!483 = !MDLocation(line: 31, column: 20, scope: !68)
!484 = !MDLocation(line: 31, column: 32, scope: !68)
!485 = !MDLocation(line: 31, column: 25, scope: !486)
!486 = !{!"0xb\004", !1, !487}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!487 = !{!"0xb\003", !1, !68}                     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!488 = !{!"0x101\00x\0016777248\000", !71, !65, !28} ; [ DW_TAG_arg_variable ] [x] [line 32]
!489 = !MDLocation(line: 32, column: 13, scope: !71)
!490 = !{!"0x101\00y\0033554464\000", !71, !65, !28} ; [ DW_TAG_arg_variable ] [y] [line 32]
!491 = !MDLocation(line: 32, column: 20, scope: !71)
!492 = !MDLocation(line: 32, column: 32, scope: !71)
!493 = !MDLocation(line: 32, column: 25, scope: !494)
!494 = !{!"0xb\004", !1, !495}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!495 = !{!"0xb\003", !1, !71}                     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!496 = !{!"0x100\00side\0036\000", !72, !65, !28} ; [ DW_TAG_auto_variable ] [side] [line 36]
!497 = !MDLocation(line: 36, column: 7, scope: !72)
!498 = !MDLocation(line: 37, column: 8, scope: !499)
!499 = !{!"0xb\0037\003\0030", !1, !72}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!500 = !MDLocation(line: 37, column: 16, scope: !501)
!501 = !{!"0xb\002", !1, !502}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!502 = !{!"0xb\001", !1, !503}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!503 = !{!"0xb\0037\003\0031", !1, !499}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!504 = !MDLocation(line: 37, column: 3, scope: !499)
!505 = !{!"0x100\00i\0036\000", !72, !65, !28}    ; [ DW_TAG_auto_variable ] [i] [line 36]
!506 = !MDLocation(line: 36, column: 12, scope: !72)
!507 = !MDLocation(line: 38, column: 10, scope: !508)
!508 = !{!"0xb\0038\005\0032", !1, !503}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!509 = !MDLocation(line: 38, column: 15, scope: !510)
!510 = !{!"0xb\002", !1, !511}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!511 = !{!"0xb\001", !1, !512}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!512 = !{!"0xb\0038\005\0033", !1, !508}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!513 = !MDLocation(line: 38, column: 5, scope: !508)
!514 = !{!"0x100\00h\0036\000", !72, !65, !28}    ; [ DW_TAG_auto_variable ] [h] [line 36]
!515 = !MDLocation(line: 36, column: 14, scope: !72)
!516 = !MDLocation(line: 39, column: 12, scope: !517)
!517 = !{!"0xb\0039\007\0034", !1, !512}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!518 = !MDLocation(line: 39, column: 17, scope: !519)
!519 = !{!"0xb\002", !1, !520}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!520 = !{!"0xb\001", !1, !521}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!521 = !{!"0xb\0039\007\0035", !1, !517}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!522 = !MDLocation(line: 39, column: 7, scope: !517)
!523 = !MDLocation(line: 42, column: 12, scope: !521)
!524 = !MDLocation(line: 42, column: 10, scope: !521)
!525 = !MDLocation(line: 42, column: 30, scope: !521)
!526 = !MDLocation(line: 42, column: 45, scope: !521)
!527 = !MDLocation(line: 42, column: 39, scope: !521)
!528 = !MDLocation(line: 42, column: 23, scope: !521)
!529 = !MDLocation(line: 42, column: 59, scope: !521)
!530 = !MDLocation(line: 42, column: 53, scope: !521)
!531 = !MDLocation(line: 42, column: 71, scope: !521)
!532 = !MDLocation(line: 41, column: 60, scope: !521)
!533 = !MDLocation(line: 41, column: 56, scope: !521)
!534 = !MDLocation(line: 41, column: 42, scope: !521)
!535 = !MDLocation(line: 41, column: 23, scope: !521)
!536 = !MDLocation(line: 41, column: 9, scope: !521)
!537 = !MDLocation(line: 40, column: 51, scope: !521)
!538 = !MDLocation(line: 40, column: 47, scope: !521)
!539 = !MDLocation(line: 40, column: 33, scope: !521)
!540 = !MDLocation(line: 40, column: 23, scope: !521)
!541 = !MDLocation(line: 40, column: 9, scope: !521)
!542 = !MDLocation(line: 39, column: 25, scope: !521)
!543 = !MDLocation(line: 39, column: 7, scope: !521)
!544 = !MDLocation(line: 42, column: 78, scope: !517)
!545 = !MDLocation(line: 38, column: 30, scope: !512)
!546 = !MDLocation(line: 38, column: 5, scope: !512)
!547 = !MDLocation(line: 42, column: 78, scope: !508)
!548 = !MDLocation(line: 37, column: 24, scope: !503)
!549 = !MDLocation(line: 37, column: 3, scope: !503)
!550 = !MDLocation(line: 43, column: 1, scope: !72)
!551 = !{!"0x101\00alpha\0016777261\000", !73, !65, !28} ; [ DW_TAG_arg_variable ] [alpha] [line 45]
!552 = !MDLocation(line: 45, column: 12, scope: !73)
!553 = !{!"0x101\00beta\0033554477\000", !73, !65, !28} ; [ DW_TAG_arg_variable ] [beta] [line 45]
!554 = !MDLocation(line: 45, column: 23, scope: !73)
!555 = !{!"0x100\00av\0049\000", !73, !65, !556}  ; [ DW_TAG_auto_variable ] [av] [line 49]
!556 = !{!"0x1\00\000\00224\0032\000\000\000", null, null, !28, !88, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 224, align 32, offset 0] [from int]
!557 = !MDLocation(line: 49, column: 11, scope: !73)
!558 = !MDLocation(line: 55, column: 3, scope: !73)
!559 = !MDLocation(line: 56, column: 7, scope: !560)
!560 = !{!"0xb\0056\007\0036", !1, !73}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!561 = !MDLocation(line: 56, column: 7, scope: !73)
!562 = !MDLocation(line: 57, column: 5, scope: !560)
!563 = !MDLocation(line: 58, column: 23, scope: !73)
!564 = !{!"0x100\00side\0052\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [side] [line 52]
!565 = !MDLocation(line: 52, column: 7, scope: !73)
!566 = !MDLocation(line: 58, column: 15, scope: !73)
!567 = !{!"0x100\00otherside\0052\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [otherside] [line 52]
!568 = !MDLocation(line: 52, column: 12, scope: !73)
!569 = !MDLocation(line: 59, column: 11, scope: !73)
!570 = !{!"0x100\00other\0051\000", !73, !65, !10} ; [ DW_TAG_auto_variable ] [other] [line 51]
!571 = !MDLocation(line: 51, column: 19, scope: !73)
!572 = !{!"0x100\00nav\0049\000", !73, !65, !28}  ; [ DW_TAG_auto_variable ] [nav] [line 49]
!573 = !MDLocation(line: 49, column: 7, scope: !73)
!574 = !{!"0x100\00i\0047\000", !73, !65, !28}    ; [ DW_TAG_auto_variable ] [i] [line 47]
!575 = !MDLocation(line: 47, column: 13, scope: !73)
!576 = !MDLocation(line: 60, column: 8, scope: !577)
!577 = !{!"0xb\0060\003\0037", !1, !73}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!578 = !MDLocation(line: 60, column: 21, scope: !579)
!579 = !{!"0xb\002", !1, !580}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!580 = !{!"0xb\001", !1, !581}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!581 = !{!"0xb\0060\003\0038", !1, !577}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!582 = !MDLocation(line: 60, column: 3, scope: !577)
!583 = !MDLocation(line: 61, column: 38, scope: !584)
!584 = !{!"0xb\0060\0037\0039", !1, !581}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!585 = !MDLocation(line: 61, column: 23, scope: !584)
!586 = !MDLocation(line: 61, column: 14, scope: !584)
!587 = !{!"0x100\00newbrd\0051\000", !73, !65, !10} ; [ DW_TAG_auto_variable ] [newbrd] [line 51]
!588 = !MDLocation(line: 51, column: 12, scope: !73)
!589 = !MDLocation(line: 62, column: 10, scope: !590)
!590 = !{!"0xb\0062\009\0040", !1, !584}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!591 = !MDLocation(line: 62, column: 9, scope: !584)
!592 = !MDLocation(line: 63, column: 7, scope: !590)
!593 = !MDLocation(line: 64, column: 54, scope: !584)
!594 = !MDLocation(line: 64, column: 39, scope: !584)
!595 = !MDLocation(line: 64, column: 30, scope: !584)
!596 = !MDLocation(line: 64, column: 16, scope: !584)
!597 = !{!"0x100\00winontop\0048\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [winontop] [line 48]
!598 = !MDLocation(line: 48, column: 7, scope: !73)
!599 = !MDLocation(line: 65, column: 9, scope: !600)
!600 = !{!"0xb\0065\009\0041", !1, !584}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!601 = !MDLocation(line: 65, column: 9, scope: !584)
!602 = !MDLocation(line: 66, column: 11, scope: !603)
!603 = !{!"0xb\0065\0025\0042", !1, !600}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!604 = !MDLocation(line: 67, column: 9, scope: !605)
!605 = !{!"0xb\0066\0011\0043", !1, !603}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!606 = !MDLocation(line: 69, column: 10, scope: !603)
!607 = !MDLocation(line: 69, column: 7, scope: !603)
!608 = !MDLocation(line: 70, column: 7, scope: !603)
!609 = !MDLocation(line: 70, column: 14, scope: !610)
!610 = !{!"0xb\002", !1, !611}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!611 = !{!"0xb\001", !1, !603}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!612 = !MDLocation(line: 71, column: 51, scope: !613)
!613 = !{!"0xb\0071\0013\0044", !1, !603}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!614 = !MDLocation(line: 71, column: 36, scope: !613)
!615 = !MDLocation(line: 71, column: 27, scope: !613)
!616 = !MDLocation(line: 71, column: 13, scope: !613)
!617 = !MDLocation(line: 71, column: 13, scope: !603)
!618 = !MDLocation(line: 72, column: 11, scope: !613)
!619 = !MDLocation(line: 73, column: 7, scope: !603)
!620 = !MDLocation(line: 75, column: 9, scope: !584)
!621 = !MDLocation(line: 76, column: 10, scope: !622)
!622 = !{!"0xb\0075\009\0045", !1, !584}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!623 = !MDLocation(line: 76, column: 7, scope: !622)
!624 = !MDLocation(line: 77, column: 3, scope: !584)
!625 = !MDLocation(line: 60, column: 32, scope: !581)
!626 = !MDLocation(line: 60, column: 3, scope: !581)
!627 = !MDLocation(line: 78, column: 7, scope: !628)
!628 = !{!"0xb\0078\007\0046", !1, !73}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!629 = !MDLocation(line: 78, column: 7, scope: !73)
!630 = !MDLocation(line: 79, column: 5, scope: !628)
!631 = !MDLocation(line: 80, column: 7, scope: !632)
!632 = !{!"0xb\0080\007\0047", !1, !73}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!633 = !MDLocation(line: 80, column: 7, scope: !73)
!634 = !MDLocation(line: 81, column: 5, scope: !632)
!635 = !MDLocation(line: 82, column: 7, scope: !636)
!636 = !{!"0xb\0082\007\0048", !1, !73}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!637 = !MDLocation(line: 82, column: 7, scope: !73)
!638 = !MDLocation(line: 83, column: 14, scope: !639)
!639 = !{!"0xb\0082\0017\0049", !1, !636}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!640 = !MDLocation(line: 83, column: 5, scope: !639)
!641 = !MDLocation(line: 84, column: 24, scope: !639)
!642 = !MDLocation(line: 84, column: 37, scope: !639)
!643 = !MDLocation(line: 84, column: 21, scope: !639)
!644 = !MDLocation(line: 84, column: 13, scope: !639)
!645 = !{!"0x100\00score\0047\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [score] [line 47]
!646 = !MDLocation(line: 47, column: 25, scope: !73)
!647 = !MDLocation(line: 85, column: 5, scope: !639)
!648 = !MDLocation(line: 86, column: 5, scope: !639)
!649 = !MDLocation(line: 88, column: 13, scope: !73)
!650 = !{!"0x100\00ttscore\0047\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [ttscore] [line 47]
!651 = !MDLocation(line: 47, column: 31, scope: !73)
!652 = !MDLocation(line: 89, column: 7, scope: !653)
!653 = !{!"0xb\0089\007\0050", !1, !73}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!654 = !MDLocation(line: 89, column: 7, scope: !73)
!655 = !MDLocation(line: 90, column: 9, scope: !656)
!656 = !{!"0xb\0090\009\0052", !1, !657}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!657 = !{!"0xb\0089\0027\0051", !1, !653}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!658 = !MDLocation(line: 90, column: 9, scope: !657)
!659 = !MDLocation(line: 91, column: 11, scope: !660)
!660 = !{!"0xb\0091\0011\0054", !1, !661}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!661 = !{!"0xb\0090\0030\0053", !1, !656}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!662 = !MDLocation(line: 91, column: 11, scope: !661)
!663 = !MDLocation(line: 92, column: 9, scope: !660)
!664 = !MDLocation(line: 93, column: 5, scope: !661)
!665 = !MDLocation(line: 93, column: 16, scope: !666)
!666 = !{!"0xb\0093\0016\0055", !1, !656}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!667 = !MDLocation(line: 93, column: 16, scope: !656)
!668 = !MDLocation(line: 94, column: 11, scope: !669)
!669 = !{!"0xb\0094\0011\0057", !1, !670}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!670 = !{!"0xb\0093\0036\0056", !1, !666}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!671 = !MDLocation(line: 94, column: 11, scope: !670)
!672 = !MDLocation(line: 95, column: 9, scope: !669)
!673 = !MDLocation(line: 96, column: 5, scope: !670)
!674 = !MDLocation(line: 96, column: 12, scope: !666)
!675 = !MDLocation(line: 97, column: 3, scope: !657)
!676 = !MDLocation(line: 98, column: 14, scope: !73)
!677 = !{!"0x100\00hashindx\0053\000", !73, !65, !22} ; [ DW_TAG_auto_variable ] [hashindx] [line 53]
!678 = !MDLocation(line: 53, column: 16, scope: !73)
!679 = !MDLocation(line: 99, column: 14, scope: !73)
!680 = !{!"0x100\00hashlock\0053\000", !73, !65, !22} ; [ DW_TAG_auto_variable ] [hashlock] [line 53]
!681 = !MDLocation(line: 53, column: 25, scope: !73)
!682 = !MDLocation(line: 100, column: 12, scope: !73)
!683 = !{!"0x100\00poscnt\0050\000", !73, !65, !12} ; [ DW_TAG_auto_variable ] [poscnt] [line 50]
!684 = !MDLocation(line: 50, column: 10, scope: !73)
!685 = !{!"0x100\00besti\0047\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [besti] [line 47]
!686 = !MDLocation(line: 47, column: 7, scope: !73)
!687 = !MDLocation(line: 103, column: 8, scope: !688)
!688 = !{!"0xb\00103\003\0058", !1, !73}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!689 = !MDLocation(line: 103, column: 15, scope: !690)
!690 = !{!"0xb\00103\003\0059", !1, !688}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!691 = !MDLocation(line: 103, column: 3, scope: !688)
!692 = !{!"0x100\00l\0047\000", !73, !65, !28}    ; [ DW_TAG_auto_variable ] [l] [line 47]
!693 = !MDLocation(line: 47, column: 17, scope: !73)
!694 = !MDLocation(line: 104, column: 37, scope: !695)
!695 = !{!"0xb\00103\0029\0060", !1, !690}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!696 = !MDLocation(line: 104, column: 30, scope: !695)
!697 = !MDLocation(line: 104, column: 25, scope: !695)
!698 = !MDLocation(line: 104, column: 11, scope: !695)
!699 = !{!"0x100\00val\0047\000", !73, !65, !28}  ; [ DW_TAG_auto_variable ] [val] [line 47]
!700 = !MDLocation(line: 47, column: 21, scope: !73)
!701 = !MDLocation(line: 105, column: 14, scope: !702)
!702 = !{!"0xb\00105\005\0061", !1, !695}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!703 = !{!"0x100\00j\0047\000", !73, !65, !28}    ; [ DW_TAG_auto_variable ] [j] [line 47]
!704 = !MDLocation(line: 47, column: 15, scope: !73)
!705 = !MDLocation(line: 105, column: 10, scope: !702)
!706 = !MDLocation(line: 105, column: 19, scope: !707)
!707 = !{!"0xb\00105\005\0062", !1, !702}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!708 = !MDLocation(line: 105, column: 5, scope: !702)
!709 = !MDLocation(line: 106, column: 37, scope: !710)
!710 = !{!"0xb\00105\0033\0063", !1, !707}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!711 = !MDLocation(line: 106, column: 30, scope: !710)
!712 = !MDLocation(line: 106, column: 25, scope: !710)
!713 = !MDLocation(line: 106, column: 11, scope: !710)
!714 = !{!"0x100\00v\0047\000", !73, !65, !28}    ; [ DW_TAG_auto_variable ] [v] [line 47]
!715 = !MDLocation(line: 47, column: 19, scope: !73)
!716 = !MDLocation(line: 107, column: 11, scope: !717)
!717 = !{!"0xb\00107\0011\0064", !1, !710}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!718 = !MDLocation(line: 107, column: 11, scope: !710)
!719 = !MDLocation(line: 109, column: 7, scope: !720)
!720 = !{!"0xb\00107\0020\0065", !1, !717}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!721 = !MDLocation(line: 110, column: 5, scope: !710)
!722 = !MDLocation(line: 105, column: 28, scope: !707)
!723 = !MDLocation(line: 105, column: 5, scope: !707)
!724 = !MDLocation(line: 111, column: 14, scope: !725)
!725 = !{!"0xb\00111\005\0066", !1, !695}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!726 = !MDLocation(line: 111, column: 10, scope: !725)
!727 = !MDLocation(line: 111, column: 21, scope: !728)
!728 = !{!"0xb\00111\005\0067", !1, !725}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!729 = !MDLocation(line: 111, column: 5, scope: !725)
!730 = !MDLocation(line: 112, column: 18, scope: !728)
!731 = !MDLocation(line: 112, column: 15, scope: !728)
!732 = !MDLocation(line: 112, column: 7, scope: !728)
!733 = !MDLocation(line: 111, column: 26, scope: !728)
!734 = !MDLocation(line: 111, column: 5, scope: !728)
!735 = !MDLocation(line: 113, column: 14, scope: !695)
!736 = !MDLocation(line: 113, column: 5, scope: !695)
!737 = !MDLocation(line: 114, column: 22, scope: !695)
!738 = !MDLocation(line: 114, column: 35, scope: !695)
!739 = !MDLocation(line: 114, column: 19, scope: !695)
!740 = !MDLocation(line: 114, column: 11, scope: !695)
!741 = !MDLocation(line: 115, column: 5, scope: !695)
!742 = !MDLocation(line: 116, column: 9, scope: !743)
!743 = !{!"0xb\00116\009\0068", !1, !695}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!744 = !MDLocation(line: 116, column: 9, scope: !695)
!745 = !MDLocation(line: 118, column: 11, scope: !746)
!746 = !{!"0xb\00118\0011\0070", !1, !747}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!747 = !{!"0xb\00116\0022\0069", !1, !743}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!748 = !MDLocation(line: 118, column: 11, scope: !747)
!749 = !MDLocation(line: 118, column: 34, scope: !750)
!750 = !{!"0xb\001", !1, !746}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!751 = !MDLocation(line: 118, column: 44, scope: !746)
!752 = !MDLocation(line: 118, column: 34, scope: !746)
!753 = !MDLocation(line: 118, column: 55, scope: !746)
!754 = !MDLocation(line: 119, column: 13, scope: !755)
!755 = !{!"0xb\00119\0013\0072", !1, !756}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!756 = !{!"0xb\00118\0076\0071", !1, !746}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!757 = !MDLocation(line: 119, column: 13, scope: !756)
!758 = !MDLocation(line: 119, column: 34, scope: !755)
!759 = !MDLocation(line: 119, column: 30, scope: !755)
!760 = !MDLocation(line: 120, column: 11, scope: !755)
!761 = !MDLocation(line: 121, column: 13, scope: !762)
!762 = !{!"0xb\00121\0013\0073", !1, !756}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!763 = !MDLocation(line: 121, column: 13, scope: !756)
!764 = !MDLocation(line: 122, column: 16, scope: !765)
!765 = !{!"0xb\00122\0011\0075", !1, !766}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!766 = !{!"0xb\00121\0024\0074", !1, !762}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!767 = !MDLocation(line: 122, column: 23, scope: !768)
!768 = !{!"0xb\00122\0011\0076", !1, !765}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!769 = !MDLocation(line: 122, column: 11, scope: !765)
!770 = !MDLocation(line: 123, column: 39, scope: !768)
!771 = !MDLocation(line: 123, column: 32, scope: !768)
!772 = !MDLocation(line: 123, column: 27, scope: !768)
!773 = !MDLocation(line: 123, column: 13, scope: !768)
!774 = !MDLocation(line: 122, column: 34, scope: !768)
!775 = !MDLocation(line: 122, column: 11, scope: !768)
!776 = !MDLocation(line: 124, column: 37, scope: !766)
!777 = !MDLocation(line: 124, column: 30, scope: !766)
!778 = !MDLocation(line: 124, column: 25, scope: !766)
!779 = !MDLocation(line: 124, column: 11, scope: !766)
!780 = !MDLocation(line: 125, column: 9, scope: !766)
!781 = !MDLocation(line: 126, column: 9, scope: !756)
!782 = !MDLocation(line: 128, column: 5, scope: !747)
!783 = !MDLocation(line: 129, column: 3, scope: !695)
!784 = !MDLocation(line: 103, column: 24, scope: !690)
!785 = !MDLocation(line: 103, column: 3, scope: !690)
!786 = !MDLocation(line: 130, column: 16, scope: !787)
!787 = !{!"0xb\00130\007\0077", !1, !73}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!788 = !MDLocation(line: 130, column: 7, scope: !787)
!789 = !MDLocation(line: 130, column: 7, scope: !73)
!790 = !MDLocation(line: 131, column: 5, scope: !787)
!791 = !MDLocation(line: 132, column: 12, scope: !73)
!792 = !{!"0x100\00work\0048\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [work] [line 48]
!793 = !MDLocation(line: 48, column: 16, scope: !73)
!794 = !MDLocation(line: 133, column: 8, scope: !795)
!795 = !{!"0xb\00133\003\0078", !1, !73}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!796 = !MDLocation(line: 133, column: 17, scope: !797)
!797 = !{!"0xb\004", !1, !798}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!798 = !{!"0xb\001", !1, !799}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!799 = !{!"0xb\00133\003\0079", !1, !795}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!800 = !MDLocation(line: 133, column: 16, scope: !799)
!801 = !MDLocation(line: 133, column: 3, scope: !795)
!802 = !MDLocation(line: 133, column: 3, scope: !803)
!803 = !{!"0xb\002", !1, !795}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!804 = !MDLocation(line: 133, column: 35, scope: !805)
!805 = !{!"0xb\003", !1, !799}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!806 = !MDLocation(line: 133, column: 3, scope: !799)
!807 = !MDLocation(line: 134, column: 3, scope: !73)
!808 = !MDLocation(line: 135, column: 7, scope: !809)
!809 = !{!"0xb\00135\007\0080", !1, !73}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!810 = !MDLocation(line: 135, column: 17, scope: !809)
!811 = !MDLocation(line: 135, column: 7, scope: !73)
!812 = !MDLocation(line: 136, column: 5, scope: !813)
!813 = !{!"0xb\00135\0028\0081", !1, !809}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!814 = !MDLocation(line: 137, column: 22, scope: !813)
!815 = !MDLocation(line: 137, column: 5, scope: !813)
!816 = !MDLocation(line: 138, column: 3, scope: !813)
!817 = !MDLocation(line: 139, column: 3, scope: !73)
!818 = !MDLocation(line: 140, column: 1, scope: !73)
!819 = !MDLocation(line: 144, column: 17, scope: !74)
!820 = !{!"0x100\00side\00144\000", !74, !65, !28} ; [ DW_TAG_auto_variable ] [side] [line 144]
!821 = !MDLocation(line: 144, column: 10, scope: !74)
!822 = !MDLocation(line: 144, column: 41, scope: !74)
!823 = !{!"0x100\00otherside\00144\000", !74, !65, !28} ; [ DW_TAG_auto_variable ] [otherside] [line 144]
!824 = !MDLocation(line: 144, column: 29, scope: !74)
!825 = !MDLocation(line: 146, column: 3, scope: !74)
!826 = !MDLocation(line: 147, column: 3, scope: !74)
!827 = !MDLocation(line: 148, column: 14, scope: !828)
!828 = !{!"0xb\00148\007\0082", !1, !74}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!829 = !MDLocation(line: 148, column: 7, scope: !828)
!830 = !MDLocation(line: 148, column: 7, scope: !74)
!831 = !MDLocation(line: 149, column: 7, scope: !828)
!832 = !{!"0x100\00i\00144\000", !74, !65, !28}   ; [ DW_TAG_auto_variable ] [i] [line 144]
!833 = !MDLocation(line: 144, column: 7, scope: !74)
!834 = !MDLocation(line: 150, column: 8, scope: !835)
!835 = !{!"0xb\00150\003\0083", !1, !74}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!836 = !MDLocation(line: 150, column: 15, scope: !837)
!837 = !{!"0xb\002", !1, !838}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!838 = !{!"0xb\001", !1, !839}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!839 = !{!"0xb\00150\003\0084", !1, !835}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!840 = !MDLocation(line: 150, column: 3, scope: !835)
!841 = !MDLocation(line: 151, column: 23, scope: !842)
!842 = !{!"0xb\00151\009\0085", !1, !839}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!843 = !MDLocation(line: 151, column: 53, scope: !842)
!844 = !MDLocation(line: 151, column: 38, scope: !842)
!845 = !MDLocation(line: 151, column: 9, scope: !842)
!846 = !MDLocation(line: 151, column: 9, scope: !839)
!847 = !MDLocation(line: 152, column: 7, scope: !842)
!848 = !MDLocation(line: 151, column: 63, scope: !849)
!849 = !{!"0xb\001", !1, !842}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!850 = !MDLocation(line: 150, column: 26, scope: !839)
!851 = !MDLocation(line: 150, column: 3, scope: !839)
!852 = !MDLocation(line: 153, column: 3, scope: !74)
!853 = !MDLocation(line: 154, column: 15, scope: !74)
!854 = !MDLocation(line: 154, column: 3, scope: !74)
!855 = !MDLocation(line: 155, column: 13, scope: !74)
!856 = !MDLocation(line: 155, column: 3, scope: !74)
!857 = !MDLocation(line: 156, column: 11, scope: !74)
!858 = !MDLocation(line: 156, column: 3, scope: !74)
!859 = !MDLocation(line: 157, column: 11, scope: !74)
!860 = !{!"0x100\00score\00144\000", !74, !65, !28} ; [ DW_TAG_auto_variable ] [score] [line 144]
!861 = !MDLocation(line: 144, column: 51, scope: !74)
!862 = !MDLocation(line: 158, column: 16, scope: !74)
!863 = !MDLocation(line: 158, column: 11, scope: !74)
!864 = !MDLocation(line: 158, column: 30, scope: !74)
!865 = !MDLocation(line: 158, column: 3, scope: !74)
!866 = !MDLocation(line: 159, column: 3, scope: !74)
!867 = !MDLocation(line: 160, column: 1, scope: !74)
!868 = !MDLocation(line: 175, column: 3, scope: !75)
!869 = !MDLocation(line: 176, column: 3, scope: !75)
!870 = !MDLocation(line: 177, column: 3, scope: !75)
!871 = !MDLocation(line: 178, column: 3, scope: !75)
!872 = !MDLocation(line: 180, column: 3, scope: !75)
!873 = !MDLocation(line: 181, column: 5, scope: !874)
!874 = !{!"0xb\00180\0012\0090", !1, !875}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!875 = !{!"0xb\00180\003\0089", !1, !876}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!876 = !{!"0xb\00180\003\0088", !1, !75}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!877 = !MDLocation(line: 182, column: 5, scope: !874)
!878 = !MDLocation(line: 182, column: 17, scope: !879)
!879 = !{!"0xb\002", !1, !880}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!880 = !{!"0xb\001", !1, !874}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!881 = !{!"0x100\00c\00164\000", !75, !65, !28}   ; [ DW_TAG_auto_variable ] [c] [line 164]
!882 = !MDLocation(line: 164, column: 7, scope: !75)
!883 = !MDLocation(line: 182, column: 12, scope: !874)
!884 = !MDLocation(line: 183, column: 11, scope: !885)
!885 = !{!"0xb\00183\0011\0092", !1, !886}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!886 = !{!"0xb\00182\0035\0091", !1, !874}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!887 = !MDLocation(line: 183, column: 11, scope: !886)
!888 = !MDLocation(line: 183, column: 23, scope: !889)
!889 = !{!"0xb\001", !1, !885}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!890 = !MDLocation(line: 184, column: 18, scope: !885)
!891 = !MDLocation(line: 184, column: 9, scope: !885)
!892 = !MDLocation(line: 185, column: 16, scope: !893)
!893 = !{!"0xb\00185\0016\0093", !1, !885}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!894 = !MDLocation(line: 185, column: 16, scope: !885)
!895 = !MDLocation(line: 186, column: 9, scope: !893)
!896 = !MDLocation(line: 188, column: 9, scope: !897)
!897 = !{!"0xb\00188\009\0094", !1, !874}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!898 = !MDLocation(line: 188, column: 9, scope: !874)
!899 = !MDLocation(line: 189, column: 7, scope: !897)
!900 = !MDLocation(line: 190, column: 48, scope: !874)
!901 = !MDLocation(line: 190, column: 5, scope: !874)
!902 = !MDLocation(line: 191, column: 5, scope: !874)
!903 = !MDLocation(line: 192, column: 5, scope: !874)
!904 = !MDLocation(line: 194, column: 5, scope: !874)
!905 = !MDLocation(line: 195, column: 14, scope: !874)
!906 = !{!"0x100\00result\00164\000", !75, !65, !28} ; [ DW_TAG_auto_variable ] [result] [line 164]
!907 = !MDLocation(line: 164, column: 10, scope: !75)
!908 = !MDLocation(line: 196, column: 14, scope: !874)
!909 = !{!"0x100\00poscnt\00165\000", !75, !65, !12} ; [ DW_TAG_auto_variable ] [poscnt] [line 165]
!910 = !MDLocation(line: 165, column: 10, scope: !75)
!911 = !{!"0x100\00work\00164\000", !75, !65, !28} ; [ DW_TAG_auto_variable ] [work] [line 164]
!912 = !MDLocation(line: 164, column: 18, scope: !75)
!913 = !MDLocation(line: 197, column: 10, scope: !914)
!914 = !{!"0xb\00197\005\0095", !1, !874}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!915 = !MDLocation(line: 197, column: 19, scope: !916)
!916 = !{!"0xb\004", !1, !917}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!917 = !{!"0xb\001", !1, !918}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!918 = !{!"0xb\00197\005\0096", !1, !914}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!919 = !MDLocation(line: 197, column: 18, scope: !918)
!920 = !MDLocation(line: 197, column: 5, scope: !914)
!921 = !MDLocation(line: 197, column: 5, scope: !922)
!922 = !{!"0xb\002", !1, !914}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!923 = !MDLocation(line: 197, column: 37, scope: !924)
!924 = !{!"0xb\003", !1, !918}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!925 = !MDLocation(line: 197, column: 5, scope: !918)
!926 = !MDLocation(line: 199, column: 15, scope: !874)
!927 = !MDLocation(line: 198, column: 5, scope: !874)
!928 = !MDLocation(line: 201, column: 7, scope: !874)
!929 = !MDLocation(line: 201, column: 14, scope: !874)
!930 = !MDLocation(line: 201, column: 29, scope: !874)
!931 = !MDLocation(line: 201, column: 21, scope: !874)
!932 = !MDLocation(line: 201, column: 35, scope: !874)
!933 = !MDLocation(line: 200, column: 5, scope: !874)
!934 = !MDLocation(line: 202, column: 5, scope: !874)
!935 = !MDLocation(line: 180, column: 3, scope: !875)
!936 = !MDLocation(line: 204, column: 3, scope: !75)
