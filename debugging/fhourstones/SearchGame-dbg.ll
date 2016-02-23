; ModuleID = 'SearchGame.c'
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
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !105, metadata !106), !dbg !107
  store i32 0, i32* @nplies, align 4, !dbg !108
  store i64 0, i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 1), align 8, !dbg !109
  store i64 0, i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 0), align 8, !dbg !110
  store i32 0, i32* %i, align 4, !dbg !111
  br label %1, !dbg !111

; <label>:1                                       ; preds = %11, %0
  %2 = load i32* %i, align 4, !dbg !113
  %3 = icmp slt i32 %2, 7, !dbg !113
  br i1 %3, label %4, label %14, !dbg !117

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4, !dbg !118
  %6 = mul nsw i32 7, %5, !dbg !119
  %7 = trunc i32 %6 to i8, !dbg !120
  %8 = load i32* %i, align 4, !dbg !121
  %9 = sext i32 %8 to i64, !dbg !122
  %10 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %9, !dbg !122
  store i8 %7, i8* %10, align 1, !dbg !122
  br label %11, !dbg !122

; <label>:11                                      ; preds = %4
  %12 = load i32* %i, align 4, !dbg !123
  %13 = add nsw i32 %12, 1, !dbg !123
  store i32 %13, i32* %i, align 4, !dbg !123
  br label %1, !dbg !124

; <label>:14                                      ; preds = %1
  ret void, !dbg !125
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @positioncode() #0 {
  %1 = load i32* @nplies, align 4, !dbg !126
  %2 = and i32 %1, 1, !dbg !126
  %3 = sext i32 %2 to i64, !dbg !127
  %4 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %3, !dbg !127
  %5 = load i64* %4, align 8, !dbg !127
  %6 = load i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 0), align 8, !dbg !128
  %7 = add i64 %5, %6, !dbg !127
  %8 = load i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 1), align 8, !dbg !129
  %9 = add i64 %7, %8, !dbg !127
  %10 = add i64 %9, 4432676798593, !dbg !127
  ret i64 %10, !dbg !130
}

; Function Attrs: nounwind uwtable
define void @printMoves() #0 {
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !131, metadata !106), !dbg !132
  store i32 0, i32* %i, align 4, !dbg !133
  br label %1, !dbg !133

; <label>:1                                       ; preds = %12, %0
  %2 = load i32* %i, align 4, !dbg !135
  %3 = load i32* @nplies, align 4, !dbg !139
  %4 = icmp slt i32 %2, %3, !dbg !140
  br i1 %4, label %5, label %15, !dbg !141

; <label>:5                                       ; preds = %1
  %6 = load i32* %i, align 4, !dbg !142
  %7 = sext i32 %6 to i64, !dbg !143
  %8 = getelementptr inbounds [42 x i32]* @moves, i32 0, i64 %7, !dbg !143
  %9 = load i32* %8, align 4, !dbg !143
  %10 = add nsw i32 1, %9, !dbg !144
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %10), !dbg !145
  br label %12, !dbg !145

; <label>:12                                      ; preds = %5
  %13 = load i32* %i, align 4, !dbg !146
  %14 = add nsw i32 %13, 1, !dbg !146
  store i32 %14, i32* %i, align 4, !dbg !146
  br label %1, !dbg !147

; <label>:15                                      ; preds = %1
  ret void, !dbg !148
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @islegal(i64 %newboard) #0 {
  %1 = alloca i64, align 8
  store i64 %newboard, i64* %1, align 8
  call void @llvm.dbg.declare(metadata i64* %1, metadata !149, metadata !106), !dbg !150
  %2 = load i64* %1, align 8, !dbg !151
  %3 = and i64 %2, 283691315109952, !dbg !151
  %4 = icmp eq i64 %3, 0, !dbg !152
  %5 = zext i1 %4 to i32, !dbg !152
  ret i32 %5, !dbg !153
}

; Function Attrs: nounwind uwtable
define i32 @isplayable(i32 %col) #0 {
  %1 = alloca i32, align 4
  store i32 %col, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !154, metadata !106), !dbg !155
  %2 = load i32* @nplies, align 4, !dbg !156
  %3 = and i32 %2, 1, !dbg !156
  %4 = sext i32 %3 to i64, !dbg !157
  %5 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %4, !dbg !157
  %6 = load i64* %5, align 8, !dbg !157
  %7 = load i32* %1, align 4, !dbg !158
  %8 = sext i32 %7 to i64, !dbg !159
  %9 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %8, !dbg !159
  %10 = load i8* %9, align 1, !dbg !159
  %11 = sext i8 %10 to i32, !dbg !159
  %12 = zext i32 %11 to i64, !dbg !160
  %13 = shl i64 1, %12, !dbg !160
  %14 = or i64 %6, %13, !dbg !157
  %15 = call i32 @islegal(i64 %14), !dbg !161
  ret i32 %15, !dbg !162
}

; Function Attrs: nounwind uwtable
define i64 @haswon(i64 %newboard) #0 {
  %1 = alloca i64, align 8
  %diag1 = alloca i64, align 8
  %hori = alloca i64, align 8
  %diag2 = alloca i64, align 8
  %vert = alloca i64, align 8
  store i64 %newboard, i64* %1, align 8
  call void @llvm.dbg.declare(metadata i64* %1, metadata !163, metadata !106), !dbg !164
  call void @llvm.dbg.declare(metadata i64* %diag1, metadata !165, metadata !106), !dbg !166
  %2 = load i64* %1, align 8, !dbg !167
  %3 = load i64* %1, align 8, !dbg !168
  %4 = lshr i64 %3, 6, !dbg !168
  %5 = and i64 %2, %4, !dbg !167
  store i64 %5, i64* %diag1, align 8, !dbg !166
  call void @llvm.dbg.declare(metadata i64* %hori, metadata !169, metadata !106), !dbg !170
  %6 = load i64* %1, align 8, !dbg !171
  %7 = load i64* %1, align 8, !dbg !172
  %8 = lshr i64 %7, 7, !dbg !172
  %9 = and i64 %6, %8, !dbg !171
  store i64 %9, i64* %hori, align 8, !dbg !170
  call void @llvm.dbg.declare(metadata i64* %diag2, metadata !173, metadata !106), !dbg !174
  %10 = load i64* %1, align 8, !dbg !175
  %11 = load i64* %1, align 8, !dbg !176
  %12 = lshr i64 %11, 8, !dbg !176
  %13 = and i64 %10, %12, !dbg !175
  store i64 %13, i64* %diag2, align 8, !dbg !174
  call void @llvm.dbg.declare(metadata i64* %vert, metadata !177, metadata !106), !dbg !178
  %14 = load i64* %1, align 8, !dbg !179
  %15 = load i64* %1, align 8, !dbg !180
  %16 = lshr i64 %15, 1, !dbg !180
  %17 = and i64 %14, %16, !dbg !179
  store i64 %17, i64* %vert, align 8, !dbg !178
  %18 = load i64* %diag1, align 8, !dbg !181
  %19 = load i64* %diag1, align 8, !dbg !182
  %20 = lshr i64 %19, 12, !dbg !182
  %21 = and i64 %18, %20, !dbg !181
  %22 = load i64* %hori, align 8, !dbg !183
  %23 = load i64* %hori, align 8, !dbg !184
  %24 = lshr i64 %23, 14, !dbg !184
  %25 = and i64 %22, %24, !dbg !183
  %26 = or i64 %21, %25, !dbg !185
  %27 = load i64* %diag2, align 8, !dbg !186
  %28 = load i64* %diag2, align 8, !dbg !187
  %29 = lshr i64 %28, 16, !dbg !187
  %30 = and i64 %27, %29, !dbg !186
  %31 = or i64 %26, %30, !dbg !185
  %32 = load i64* %vert, align 8, !dbg !188
  %33 = load i64* %vert, align 8, !dbg !189
  %34 = lshr i64 %33, 2, !dbg !189
  %35 = and i64 %32, %34, !dbg !188
  %36 = or i64 %31, %35, !dbg !185
  ret i64 %36, !dbg !190
}

; Function Attrs: nounwind uwtable
define i32 @islegalhaswon(i64 %newboard) #0 {
  %1 = alloca i64, align 8
  store i64 %newboard, i64* %1, align 8
  call void @llvm.dbg.declare(metadata i64* %1, metadata !191, metadata !106), !dbg !192
  %2 = load i64* %1, align 8, !dbg !193
  %3 = call i32 @islegal(i64 %2), !dbg !194
  %4 = icmp ne i32 %3, 0, !dbg !194
  br i1 %4, label %5, label %9, !dbg !194

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8, !dbg !195
  %7 = call i64 @haswon(i64 %6), !dbg !197
  %8 = icmp ne i64 %7, 0, !dbg !194
  br label %9

; <label>:9                                       ; preds = %5, %0
  %10 = phi i1 [ false, %0 ], [ %8, %5 ]
  %11 = zext i1 %10 to i32, !dbg !198
  ret i32 %11, !dbg !200
}

; Function Attrs: nounwind uwtable
define void @backmove() #0 {
  %n = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !201, metadata !106), !dbg !202
  %1 = load i32* @nplies, align 4, !dbg !203
  %2 = add nsw i32 %1, -1, !dbg !203
  store i32 %2, i32* @nplies, align 4, !dbg !203
  %3 = sext i32 %2 to i64, !dbg !204
  %4 = getelementptr inbounds [42 x i32]* @moves, i32 0, i64 %3, !dbg !204
  %5 = load i32* %4, align 4, !dbg !204
  store i32 %5, i32* %n, align 4, !dbg !205
  %6 = load i32* %n, align 4, !dbg !206
  %7 = sext i32 %6 to i64, !dbg !207
  %8 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %7, !dbg !207
  %9 = load i8* %8, align 1, !dbg !207
  %10 = add i8 %9, -1, !dbg !207
  store i8 %10, i8* %8, align 1, !dbg !207
  %11 = sext i8 %10 to i32, !dbg !207
  %12 = zext i32 %11 to i64, !dbg !208
  %13 = shl i64 1, %12, !dbg !208
  %14 = load i32* @nplies, align 4, !dbg !209
  %15 = and i32 %14, 1, !dbg !209
  %16 = sext i32 %15 to i64, !dbg !210
  %17 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %16, !dbg !210
  %18 = load i64* %17, align 8, !dbg !210
  %19 = xor i64 %18, %13, !dbg !210
  store i64 %19, i64* %17, align 8, !dbg !210
  ret void, !dbg !211
}

; Function Attrs: nounwind uwtable
define void @makemove(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !212, metadata !106), !dbg !213
  %2 = load i32* %1, align 4, !dbg !214
  %3 = sext i32 %2 to i64, !dbg !215
  %4 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %3, !dbg !215
  %5 = load i8* %4, align 1, !dbg !215
  %6 = add i8 %5, 1, !dbg !215
  store i8 %6, i8* %4, align 1, !dbg !215
  %7 = sext i8 %5 to i32, !dbg !215
  %8 = zext i32 %7 to i64, !dbg !216
  %9 = shl i64 1, %8, !dbg !216
  %10 = load i32* @nplies, align 4, !dbg !217
  %11 = and i32 %10, 1, !dbg !217
  %12 = sext i32 %11 to i64, !dbg !218
  %13 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %12, !dbg !218
  %14 = load i64* %13, align 8, !dbg !218
  %15 = xor i64 %14, %9, !dbg !218
  store i64 %15, i64* %13, align 8, !dbg !218
  %16 = load i32* %1, align 4, !dbg !219
  %17 = load i32* @nplies, align 4, !dbg !220
  %18 = add nsw i32 %17, 1, !dbg !220
  store i32 %18, i32* @nplies, align 4, !dbg !220
  %19 = sext i32 %17 to i64, !dbg !221
  %20 = getelementptr inbounds [42 x i32]* @moves, i32 0, i64 %19, !dbg !221
  store i32 %16, i32* %20, align 4, !dbg !221
  ret void, !dbg !222
}

; Function Attrs: nounwind uwtable
define void @trans_init() #0 {
  %1 = call noalias i8* @calloc(i64 8306069, i64 8) #5, !dbg !223
  %2 = bitcast i8* %1 to %struct.hashentry*, !dbg !224
  store %struct.hashentry* %2, %struct.hashentry** @ht, align 8, !dbg !225
  %3 = load %struct.hashentry** @ht, align 8, !dbg !226
  %4 = icmp ne %struct.hashentry* %3, null, !dbg !228
  br i1 %4, label %7, label %5, !dbg !228

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i32 0, i32 0), i64 66448552), !dbg !229
  call void @exit(i32 0) #6, !dbg !231
  unreachable, !dbg !231

; <label>:7                                       ; preds = %0
  ret void, !dbg !232
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind uwtable
define void @emptyTT() #0 {
  %i = alloca i32, align 4
  %1 = alloca %struct.hashentry, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !233, metadata !106), !dbg !234
  store i32 0, i32* %i, align 4, !dbg !235
  br label %2, !dbg !235

; <label>:2                                       ; preds = %27, %0
  %3 = load i32* %i, align 4, !dbg !237
  %4 = icmp slt i32 %3, 8306069, !dbg !237
  br i1 %4, label %5, label %30, !dbg !241

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4, !dbg !242
  %7 = sext i32 %6 to i64, !dbg !244
  %8 = load %struct.hashentry** @ht, align 8, !dbg !244
  %9 = getelementptr inbounds %struct.hashentry* %8, i64 %7, !dbg !244
  %10 = bitcast %struct.hashentry* %1 to i64*, !dbg !244
  %11 = load i64* %10, align 4, !dbg !244
  %12 = and i64 %11, -67108864, !dbg !244
  store i64 %12, i64* %10, align 4, !dbg !244
  %13 = bitcast %struct.hashentry* %1 to i64*, !dbg !244
  %14 = load i64* %13, align 4, !dbg !244
  %15 = and i64 %14, -4227858433, !dbg !244
  store i64 %15, i64* %13, align 4, !dbg !244
  %16 = bitcast %struct.hashentry* %1 to i64*, !dbg !244
  %17 = load i64* %16, align 4, !dbg !244
  %18 = and i64 %17, -288230371856744449, !dbg !244
  store i64 %18, i64* %16, align 4, !dbg !244
  %19 = bitcast %struct.hashentry* %1 to i64*, !dbg !244
  %20 = load i64* %19, align 4, !dbg !244
  %21 = and i64 %20, -2017612633061982209, !dbg !244
  store i64 %21, i64* %19, align 4, !dbg !244
  %22 = bitcast %struct.hashentry* %1 to i64*, !dbg !244
  %23 = load i64* %22, align 4, !dbg !244
  %24 = and i64 %23, 2305843009213693951, !dbg !244
  store i64 %24, i64* %22, align 4, !dbg !244
  %25 = bitcast %struct.hashentry* %9 to i8*, !dbg !244
  %26 = bitcast %struct.hashentry* %1 to i8*, !dbg !244
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %26, i64 8, i32 4, i1 false), !dbg !244
  br label %27, !dbg !245

; <label>:27                                      ; preds = %5
  %28 = load i32* %i, align 4, !dbg !246
  %29 = add nsw i32 %28, 1, !dbg !246
  store i32 %29, i32* %i, align 4, !dbg !246
  br label %2, !dbg !247

; <label>:30                                      ; preds = %2
  store i64 0, i64* @posed, align 8, !dbg !248
  ret void, !dbg !249
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: nounwind uwtable
define void @hash() #0 {
  %htmp = alloca i64, align 8
  %htemp = alloca i64, align 8
  %htemp2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %htmp, metadata !250, metadata !106), !dbg !251
  call void @llvm.dbg.declare(metadata i64* %htemp, metadata !252, metadata !106), !dbg !253
  %1 = call i64 @positioncode(), !dbg !254
  store i64 %1, i64* %htemp, align 8, !dbg !253
  %2 = load i32* @nplies, align 4, !dbg !255
  %3 = icmp slt i32 %2, 10, !dbg !255
  br i1 %3, label %4, label %25, !dbg !257

; <label>:4                                       ; preds = %0
  call void @llvm.dbg.declare(metadata i64* %htemp2, metadata !258, metadata !106), !dbg !260
  store i64 0, i64* %htemp2, align 8, !dbg !260
  %5 = load i64* %htemp, align 8, !dbg !261
  store i64 %5, i64* %htmp, align 8, !dbg !263
  br label %6, !dbg !263

; <label>:6                                       ; preds = %15, %4
  %7 = load i64* %htmp, align 8, !dbg !264
  %8 = icmp ne i64 %7, 0, !dbg !264
  br i1 %8, label %9, label %18, !dbg !268

; <label>:9                                       ; preds = %6
  %10 = load i64* %htemp2, align 8, !dbg !269
  %11 = shl i64 %10, 7, !dbg !269
  %12 = load i64* %htmp, align 8, !dbg !270
  %13 = and i64 %12, 127, !dbg !270
  %14 = or i64 %11, %13, !dbg !269
  store i64 %14, i64* %htemp2, align 8, !dbg !271
  br label %15, !dbg !271

; <label>:15                                      ; preds = %9
  %16 = load i64* %htmp, align 8, !dbg !272
  %17 = lshr i64 %16, 7, !dbg !272
  store i64 %17, i64* %htmp, align 8, !dbg !272
  br label %6, !dbg !273

; <label>:18                                      ; preds = %6
  %19 = load i64* %htemp2, align 8, !dbg !274
  %20 = load i64* %htemp, align 8, !dbg !276
  %21 = icmp ult i64 %19, %20, !dbg !274
  br i1 %21, label %22, label %24, !dbg !277

; <label>:22                                      ; preds = %18
  %23 = load i64* %htemp2, align 8, !dbg !278
  store i64 %23, i64* %htemp, align 8, !dbg !279
  br label %24, !dbg !279

; <label>:24                                      ; preds = %22, %18
  br label %25, !dbg !280

; <label>:25                                      ; preds = %24, %0
  %26 = load i64* %htemp, align 8, !dbg !281
  %27 = lshr i64 %26, 23, !dbg !281
  %28 = trunc i64 %27 to i32, !dbg !282
  store i32 %28, i32* @lock, align 4, !dbg !283
  %29 = load i64* %htemp, align 8, !dbg !284
  %30 = urem i64 %29, 8306069, !dbg !284
  %31 = trunc i64 %30 to i32, !dbg !285
  store i32 %31, i32* @htindex, align 4, !dbg !286
  ret void, !dbg !287
}

; Function Attrs: nounwind uwtable
define i32 @transpose() #0 {
  %1 = alloca i32, align 4
  %he = alloca %struct.hashentry, align 4
  call void @llvm.dbg.declare(metadata %struct.hashentry* %he, metadata !288, metadata !106), !dbg !289
  call void @hash(), !dbg !290
  %2 = load i32* @htindex, align 4, !dbg !291
  %3 = zext i32 %2 to i64, !dbg !292
  %4 = load %struct.hashentry** @ht, align 8, !dbg !293
  %5 = getelementptr inbounds %struct.hashentry* %4, i64 %3, !dbg !292
  %6 = bitcast %struct.hashentry* %he to i8*, !dbg !292
  %7 = bitcast %struct.hashentry* %5 to i8*, !dbg !292
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 4, i1 false), !dbg !292
  %8 = bitcast %struct.hashentry* %he to i64*, !dbg !294
  %9 = load i64* %8, align 4, !dbg !294
  %10 = and i64 %9, 67108863, !dbg !294
  %11 = trunc i64 %10 to i32, !dbg !294
  %12 = load i32* @lock, align 4, !dbg !296
  %13 = icmp eq i32 %11, %12, !dbg !294
  br i1 %13, label %14, label %19, !dbg !297

; <label>:14                                      ; preds = %0
  %15 = bitcast %struct.hashentry* %he to i64*, !dbg !298
  %16 = load i64* %15, align 4, !dbg !298
  %17 = lshr i64 %16, 61, !dbg !298
  %18 = trunc i64 %17 to i32, !dbg !298
  store i32 %18, i32* %1, !dbg !299
  br label %34, !dbg !299

; <label>:19                                      ; preds = %0
  %20 = bitcast %struct.hashentry* %he to i64*, !dbg !300
  %21 = load i64* %20, align 4, !dbg !300
  %22 = lshr i64 %21, 32, !dbg !300
  %23 = and i64 %22, 67108863, !dbg !300
  %24 = trunc i64 %23 to i32, !dbg !300
  %25 = load i32* @lock, align 4, !dbg !302
  %26 = icmp eq i32 %24, %25, !dbg !300
  br i1 %26, label %27, label %33, !dbg !303

; <label>:27                                      ; preds = %19
  %28 = bitcast %struct.hashentry* %he to i64*, !dbg !304
  %29 = load i64* %28, align 4, !dbg !304
  %30 = lshr i64 %29, 58, !dbg !304
  %31 = and i64 %30, 7, !dbg !304
  %32 = trunc i64 %31 to i32, !dbg !304
  store i32 %32, i32* %1, !dbg !305
  br label %34, !dbg !305

; <label>:33                                      ; preds = %19
  store i32 0, i32* %1, !dbg !306
  br label %34, !dbg !306

; <label>:34                                      ; preds = %33, %27, %14
  %35 = load i32* %1, !dbg !307
  ret i32 %35, !dbg !307
}

; Function Attrs: nounwind uwtable
define void @transtore(i32 %x, i32 %lock, i32 %score, i32 %work) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %he = alloca %struct.hashentry, align 4
  store i32 %x, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !308, metadata !106), !dbg !309
  store i32 %lock, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !310, metadata !106), !dbg !311
  store i32 %score, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !312, metadata !106), !dbg !313
  store i32 %work, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !314, metadata !106), !dbg !315
  call void @llvm.dbg.declare(metadata %struct.hashentry* %he, metadata !316, metadata !106), !dbg !317
  %5 = load i64* @posed, align 8, !dbg !318
  %6 = add i64 %5, 1, !dbg !318
  store i64 %6, i64* @posed, align 8, !dbg !318
  %7 = load i32* %1, align 4, !dbg !319
  %8 = sext i32 %7 to i64, !dbg !320
  %9 = load %struct.hashentry** @ht, align 8, !dbg !321
  %10 = getelementptr inbounds %struct.hashentry* %9, i64 %8, !dbg !320
  %11 = bitcast %struct.hashentry* %he to i8*, !dbg !320
  %12 = bitcast %struct.hashentry* %10 to i8*, !dbg !320
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 8, i32 4, i1 false), !dbg !320
  %13 = bitcast %struct.hashentry* %he to i64*, !dbg !322
  %14 = load i64* %13, align 4, !dbg !322
  %15 = and i64 %14, 67108863, !dbg !322
  %16 = trunc i64 %15 to i32, !dbg !322
  %17 = load i32* %2, align 4, !dbg !324
  %18 = icmp eq i32 %16, %17, !dbg !322
  br i1 %18, label %27, label %19, !dbg !325

; <label>:19                                      ; preds = %0
  %20 = load i32* %4, align 4, !dbg !326
  %21 = bitcast %struct.hashentry* %he to i64*, !dbg !328
  %22 = load i64* %21, align 4, !dbg !328
  %23 = lshr i64 %22, 26, !dbg !328
  %24 = and i64 %23, 63, !dbg !328
  %25 = trunc i64 %24 to i32, !dbg !328
  %26 = icmp sge i32 %20, %25, !dbg !329
  br i1 %26, label %27, label %54, !dbg !325

; <label>:27                                      ; preds = %19, %0
  %28 = load i32* %2, align 4, !dbg !330
  %29 = bitcast %struct.hashentry* %he to i64*, !dbg !332
  %30 = zext i32 %28 to i64, !dbg !332
  %31 = load i64* %29, align 4, !dbg !332
  %32 = and i64 %30, 67108863, !dbg !332
  %33 = and i64 %31, -67108864, !dbg !332
  %34 = or i64 %33, %32, !dbg !332
  store i64 %34, i64* %29, align 4, !dbg !332
  %35 = trunc i64 %32 to i32, !dbg !332
  %36 = load i32* %3, align 4, !dbg !333
  %37 = bitcast %struct.hashentry* %he to i64*, !dbg !334
  %38 = zext i32 %36 to i64, !dbg !334
  %39 = load i64* %37, align 4, !dbg !334
  %40 = and i64 %38, 7, !dbg !334
  %41 = shl i64 %40, 61, !dbg !334
  %42 = and i64 %39, 2305843009213693951, !dbg !334
  %43 = or i64 %42, %41, !dbg !334
  store i64 %43, i64* %37, align 4, !dbg !334
  %44 = trunc i64 %40 to i32, !dbg !334
  %45 = load i32* %4, align 4, !dbg !335
  %46 = bitcast %struct.hashentry* %he to i64*, !dbg !336
  %47 = zext i32 %45 to i64, !dbg !336
  %48 = load i64* %46, align 4, !dbg !336
  %49 = and i64 %47, 63, !dbg !336
  %50 = shl i64 %49, 26, !dbg !336
  %51 = and i64 %48, -4227858433, !dbg !336
  %52 = or i64 %51, %50, !dbg !336
  store i64 %52, i64* %46, align 4, !dbg !336
  %53 = trunc i64 %49 to i32, !dbg !336
  br label %73, !dbg !337

; <label>:54                                      ; preds = %19
  %55 = load i32* %2, align 4, !dbg !338
  %56 = bitcast %struct.hashentry* %he to i64*, !dbg !340
  %57 = zext i32 %55 to i64, !dbg !340
  %58 = load i64* %56, align 4, !dbg !340
  %59 = and i64 %57, 67108863, !dbg !340
  %60 = shl i64 %59, 32, !dbg !340
  %61 = and i64 %58, -288230371856744449, !dbg !340
  %62 = or i64 %61, %60, !dbg !340
  store i64 %62, i64* %56, align 4, !dbg !340
  %63 = trunc i64 %59 to i32, !dbg !340
  %64 = load i32* %3, align 4, !dbg !341
  %65 = bitcast %struct.hashentry* %he to i64*, !dbg !342
  %66 = zext i32 %64 to i64, !dbg !342
  %67 = load i64* %65, align 4, !dbg !342
  %68 = and i64 %66, 7, !dbg !342
  %69 = shl i64 %68, 58, !dbg !342
  %70 = and i64 %67, -2017612633061982209, !dbg !342
  %71 = or i64 %70, %69, !dbg !342
  store i64 %71, i64* %65, align 4, !dbg !342
  %72 = trunc i64 %68 to i32, !dbg !342
  br label %73

; <label>:73                                      ; preds = %54, %27
  %74 = load i32* %1, align 4, !dbg !343
  %75 = sext i32 %74 to i64, !dbg !344
  %76 = load %struct.hashentry** @ht, align 8, !dbg !344
  %77 = getelementptr inbounds %struct.hashentry* %76, i64 %75, !dbg !344
  %78 = bitcast %struct.hashentry* %77 to i8*, !dbg !344
  %79 = bitcast %struct.hashentry* %he to i8*, !dbg !344
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %78, i8* %79, i64 8, i32 4, i1 false), !dbg !344
  ret void, !dbg !345
}

; Function Attrs: nounwind uwtable
define void @htstat() #0 {
  %total = alloca i32, align 4
  %i = alloca i32, align 4
  %typecnt = alloca [8 x i32], align 16
  %he = alloca %struct.hashentry, align 4
  call void @llvm.dbg.declare(metadata i32* %total, metadata !346, metadata !106), !dbg !347
  call void @llvm.dbg.declare(metadata i32* %i, metadata !348, metadata !106), !dbg !349
  call void @llvm.dbg.declare(metadata [8 x i32]* %typecnt, metadata !350, metadata !106), !dbg !354
  call void @llvm.dbg.declare(metadata %struct.hashentry* %he, metadata !355, metadata !106), !dbg !356
  store i32 0, i32* %i, align 4, !dbg !357
  br label %1, !dbg !357

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4, !dbg !359
  %3 = icmp slt i32 %2, 8, !dbg !359
  br i1 %3, label %4, label %11, !dbg !363

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4, !dbg !364
  %6 = sext i32 %5 to i64, !dbg !365
  %7 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %6, !dbg !365
  store i32 0, i32* %7, align 4, !dbg !365
  br label %8, !dbg !365

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4, !dbg !366
  %10 = add nsw i32 %9, 1, !dbg !366
  store i32 %10, i32* %i, align 4, !dbg !366
  br label %1, !dbg !367

; <label>:11                                      ; preds = %1
  store i32 0, i32* %i, align 4, !dbg !368
  br label %12, !dbg !368

; <label>:12                                      ; preds = %54, %11
  %13 = load i32* %i, align 4, !dbg !370
  %14 = icmp slt i32 %13, 8306069, !dbg !370
  br i1 %14, label %15, label %57, !dbg !374

; <label>:15                                      ; preds = %12
  %16 = load i32* %i, align 4, !dbg !375
  %17 = sext i32 %16 to i64, !dbg !377
  %18 = load %struct.hashentry** @ht, align 8, !dbg !378
  %19 = getelementptr inbounds %struct.hashentry* %18, i64 %17, !dbg !377
  %20 = bitcast %struct.hashentry* %he to i8*, !dbg !377
  %21 = bitcast %struct.hashentry* %19 to i8*, !dbg !377
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %21, i64 8, i32 4, i1 false), !dbg !377
  %22 = bitcast %struct.hashentry* %he to i64*, !dbg !379
  %23 = load i64* %22, align 4, !dbg !379
  %24 = and i64 %23, 67108863, !dbg !379
  %25 = trunc i64 %24 to i32, !dbg !379
  %26 = icmp ne i32 %25, 0, !dbg !379
  br i1 %26, label %27, label %36, !dbg !381

; <label>:27                                      ; preds = %15
  %28 = bitcast %struct.hashentry* %he to i64*, !dbg !382
  %29 = load i64* %28, align 4, !dbg !382
  %30 = lshr i64 %29, 61, !dbg !382
  %31 = trunc i64 %30 to i32, !dbg !382
  %32 = zext i32 %31 to i64, !dbg !383
  %33 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %32, !dbg !383
  %34 = load i32* %33, align 4, !dbg !383
  %35 = add nsw i32 %34, 1, !dbg !383
  store i32 %35, i32* %33, align 4, !dbg !383
  br label %36, !dbg !383

; <label>:36                                      ; preds = %27, %15
  %37 = bitcast %struct.hashentry* %he to i64*, !dbg !384
  %38 = load i64* %37, align 4, !dbg !384
  %39 = lshr i64 %38, 32, !dbg !384
  %40 = and i64 %39, 67108863, !dbg !384
  %41 = trunc i64 %40 to i32, !dbg !384
  %42 = icmp ne i32 %41, 0, !dbg !384
  br i1 %42, label %43, label %53, !dbg !386

; <label>:43                                      ; preds = %36
  %44 = bitcast %struct.hashentry* %he to i64*, !dbg !387
  %45 = load i64* %44, align 4, !dbg !387
  %46 = lshr i64 %45, 58, !dbg !387
  %47 = and i64 %46, 7, !dbg !387
  %48 = trunc i64 %47 to i32, !dbg !387
  %49 = zext i32 %48 to i64, !dbg !388
  %50 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %49, !dbg !388
  %51 = load i32* %50, align 4, !dbg !388
  %52 = add nsw i32 %51, 1, !dbg !388
  store i32 %52, i32* %50, align 4, !dbg !388
  br label %53, !dbg !388

; <label>:53                                      ; preds = %43, %36
  br label %54, !dbg !389

; <label>:54                                      ; preds = %53
  %55 = load i32* %i, align 4, !dbg !390
  %56 = add nsw i32 %55, 1, !dbg !390
  store i32 %56, i32* %i, align 4, !dbg !390
  br label %12, !dbg !391

; <label>:57                                      ; preds = %12
  store i32 0, i32* %total, align 4, !dbg !392
  store i32 1, i32* %i, align 4, !dbg !394
  br label %58, !dbg !392

; <label>:58                                      ; preds = %68, %57
  %59 = load i32* %i, align 4, !dbg !395
  %60 = icmp sle i32 %59, 5, !dbg !395
  br i1 %60, label %61, label %71, !dbg !399

; <label>:61                                      ; preds = %58
  %62 = load i32* %i, align 4, !dbg !400
  %63 = sext i32 %62 to i64, !dbg !401
  %64 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %63, !dbg !401
  %65 = load i32* %64, align 4, !dbg !401
  %66 = load i32* %total, align 4, !dbg !402
  %67 = add nsw i32 %66, %65, !dbg !402
  store i32 %67, i32* %total, align 4, !dbg !402
  br label %68, !dbg !402

; <label>:68                                      ; preds = %61
  %69 = load i32* %i, align 4, !dbg !403
  %70 = add nsw i32 %69, 1, !dbg !403
  store i32 %70, i32* %i, align 4, !dbg !403
  br label %58, !dbg !404

; <label>:71                                      ; preds = %58
  %72 = load i32* %total, align 4, !dbg !405
  %73 = icmp sgt i32 %72, 0, !dbg !405
  br i1 %73, label %74, label %106, !dbg !407

; <label>:74                                      ; preds = %71
  %75 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 1, !dbg !408
  %76 = load i32* %75, align 4, !dbg !408
  %77 = sitofp i32 %76 to double, !dbg !408
  %78 = load i32* %total, align 4, !dbg !410
  %79 = sitofp i32 %78 to double, !dbg !411
  %80 = fdiv double %77, %79, !dbg !408
  %81 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 2, !dbg !412
  %82 = load i32* %81, align 4, !dbg !412
  %83 = sitofp i32 %82 to double, !dbg !412
  %84 = load i32* %total, align 4, !dbg !413
  %85 = sitofp i32 %84 to double, !dbg !414
  %86 = fdiv double %83, %85, !dbg !412
  %87 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 3, !dbg !415
  %88 = load i32* %87, align 4, !dbg !415
  %89 = sitofp i32 %88 to double, !dbg !415
  %90 = load i32* %total, align 4, !dbg !416
  %91 = sitofp i32 %90 to double, !dbg !417
  %92 = fdiv double %89, %91, !dbg !415
  %93 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 4, !dbg !418
  %94 = load i32* %93, align 4, !dbg !418
  %95 = sitofp i32 %94 to double, !dbg !418
  %96 = load i32* %total, align 4, !dbg !419
  %97 = sitofp i32 %96 to double, !dbg !420
  %98 = fdiv double %95, %97, !dbg !418
  %99 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 5, !dbg !421
  %100 = load i32* %99, align 4, !dbg !421
  %101 = sitofp i32 %100 to double, !dbg !421
  %102 = load i32* %total, align 4, !dbg !422
  %103 = sitofp i32 %102 to double, !dbg !423
  %104 = fdiv double %101, %103, !dbg !421
  %105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str2, i32 0, i32 0), double %80, double %86, double %92, double %98, double %104), !dbg !424
  br label %106, !dbg !425

; <label>:106                                     ; preds = %74, %71
  ret void, !dbg !426
}

; Function Attrs: nounwind uwtable
define i64 @millisecs() #0 {
  %rusage = alloca %struct.rusage, align 8
  call void @llvm.dbg.declare(metadata %struct.rusage* %rusage, metadata !427, metadata !106), !dbg !512
  %1 = call i32 @getrusage(i32 0, %struct.rusage* %rusage) #5, !dbg !513
  %2 = getelementptr inbounds %struct.rusage* %rusage, i32 0, i32 0, !dbg !514
  %3 = getelementptr inbounds %struct.timeval* %2, i32 0, i32 0, !dbg !514
  %4 = load i64* %3, align 8, !dbg !514
  %5 = mul nsw i64 %4, 1000, !dbg !514
  %6 = getelementptr inbounds %struct.rusage* %rusage, i32 0, i32 0, !dbg !515
  %7 = getelementptr inbounds %struct.timeval* %6, i32 0, i32 1, !dbg !515
  %8 = load i64* %7, align 8, !dbg !515
  %9 = sdiv i64 %8, 1000, !dbg !515
  %10 = add nsw i64 %5, %9, !dbg !514
  ret i64 %10, !dbg !516
}

; Function Attrs: nounwind
declare i32 @getrusage(i32, %struct.rusage*) #3

; Function Attrs: nounwind uwtable
define i32 @min(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !517, metadata !106), !dbg !518
  store i32 %y, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !519, metadata !106), !dbg !520
  %3 = load i32* %1, align 4, !dbg !521
  %4 = load i32* %2, align 4, !dbg !522
  %5 = icmp slt i32 %3, %4, !dbg !521
  br i1 %5, label %6, label %8, !dbg !521

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4, !dbg !523
  br label %10, !dbg !521

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4, !dbg !525
  br label %10, !dbg !521

; <label>:10                                      ; preds = %8, %6
  %11 = phi i32 [ %7, %6 ], [ %9, %8 ], !dbg !521
  ret i32 %11, !dbg !527
}

; Function Attrs: nounwind uwtable
define i32 @max(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !530, metadata !106), !dbg !531
  store i32 %y, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !532, metadata !106), !dbg !533
  %3 = load i32* %1, align 4, !dbg !534
  %4 = load i32* %2, align 4, !dbg !535
  %5 = icmp sgt i32 %3, %4, !dbg !534
  br i1 %5, label %6, label %8, !dbg !534

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4, !dbg !536
  br label %10, !dbg !534

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4, !dbg !538
  br label %10, !dbg !534

; <label>:10                                      ; preds = %8, %6
  %11 = phi i32 [ %7, %6 ], [ %9, %8 ], !dbg !534
  ret i32 %11, !dbg !540
}

; Function Attrs: nounwind uwtable
define void @inithistory() #0 {
  %side = alloca i32, align 4
  %i = alloca i32, align 4
  %h = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %side, metadata !543, metadata !106), !dbg !544
  call void @llvm.dbg.declare(metadata i32* %i, metadata !545, metadata !106), !dbg !546
  call void @llvm.dbg.declare(metadata i32* %h, metadata !547, metadata !106), !dbg !548
  store i32 0, i32* %side, align 4, !dbg !549
  br label %1, !dbg !549

; <label>:1                                       ; preds = %82, %0
  %2 = load i32* %side, align 4, !dbg !551
  %3 = icmp slt i32 %2, 2, !dbg !551
  br i1 %3, label %4, label %85, !dbg !555

; <label>:4                                       ; preds = %1
  store i32 0, i32* %i, align 4, !dbg !556
  br label %5, !dbg !556

; <label>:5                                       ; preds = %78, %4
  %6 = load i32* %i, align 4, !dbg !558
  %7 = icmp slt i32 %6, 4, !dbg !558
  br i1 %7, label %8, label %81, !dbg !562

; <label>:8                                       ; preds = %5
  store i32 0, i32* %h, align 4, !dbg !563
  br label %9, !dbg !563

; <label>:9                                       ; preds = %74, %8
  %10 = load i32* %h, align 4, !dbg !565
  %11 = icmp slt i32 %10, 3, !dbg !565
  br i1 %11, label %12, label %77, !dbg !569

; <label>:12                                      ; preds = %9
  %13 = load i32* %i, align 4, !dbg !570
  %14 = call i32 @min(i32 3, i32 %13), !dbg !571
  %15 = add nsw i32 4, %14, !dbg !572
  %16 = load i32* %h, align 4, !dbg !573
  %17 = call i32 @min(i32 3, i32 %16), !dbg !574
  %18 = load i32* %i, align 4, !dbg !575
  %19 = sub nsw i32 3, %18, !dbg !576
  %20 = call i32 @max(i32 0, i32 %19), !dbg !577
  %21 = sub nsw i32 %17, %20, !dbg !574
  %22 = call i32 @max(i32 -1, i32 %21), !dbg !578
  %23 = add nsw i32 %15, %22, !dbg !572
  %24 = load i32* %i, align 4, !dbg !579
  %25 = load i32* %h, align 4, !dbg !580
  %26 = call i32 @min(i32 %24, i32 %25), !dbg !581
  %27 = call i32 @min(i32 3, i32 %26), !dbg !582
  %28 = add nsw i32 %23, %27, !dbg !572
  %29 = load i32* %h, align 4, !dbg !583
  %30 = call i32 @min(i32 3, i32 %29), !dbg !584
  %31 = add nsw i32 %28, %30, !dbg !572
  %32 = load i32* %i, align 4, !dbg !585
  %33 = sub nsw i32 6, %32, !dbg !586
  %34 = mul nsw i32 7, %33, !dbg !587
  %35 = load i32* %h, align 4, !dbg !588
  %36 = add nsw i32 %34, %35, !dbg !587
  %37 = sext i32 %36 to i64, !dbg !589
  %38 = load i32* %side, align 4, !dbg !590
  %39 = sext i32 %38 to i64, !dbg !589
  %40 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %39, !dbg !589
  %41 = getelementptr inbounds [49 x i32]* %40, i32 0, i64 %37, !dbg !589
  store i32 %31, i32* %41, align 4, !dbg !589
  %42 = load i32* %i, align 4, !dbg !591
  %43 = mul nsw i32 7, %42, !dbg !592
  %44 = add nsw i32 %43, 6, !dbg !592
  %45 = sub nsw i32 %44, 1, !dbg !592
  %46 = load i32* %h, align 4, !dbg !593
  %47 = sub nsw i32 %45, %46, !dbg !592
  %48 = sext i32 %47 to i64, !dbg !594
  %49 = load i32* %side, align 4, !dbg !595
  %50 = sext i32 %49 to i64, !dbg !594
  %51 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %50, !dbg !594
  %52 = getelementptr inbounds [49 x i32]* %51, i32 0, i64 %48, !dbg !594
  store i32 %31, i32* %52, align 4, !dbg !594
  %53 = load i32* %i, align 4, !dbg !596
  %54 = sub nsw i32 6, %53, !dbg !597
  %55 = mul nsw i32 7, %54, !dbg !598
  %56 = add nsw i32 %55, 6, !dbg !598
  %57 = sub nsw i32 %56, 1, !dbg !598
  %58 = load i32* %h, align 4, !dbg !599
  %59 = sub nsw i32 %57, %58, !dbg !598
  %60 = sext i32 %59 to i64, !dbg !600
  %61 = load i32* %side, align 4, !dbg !601
  %62 = sext i32 %61 to i64, !dbg !600
  %63 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %62, !dbg !600
  %64 = getelementptr inbounds [49 x i32]* %63, i32 0, i64 %60, !dbg !600
  store i32 %31, i32* %64, align 4, !dbg !600
  %65 = load i32* %i, align 4, !dbg !602
  %66 = mul nsw i32 7, %65, !dbg !603
  %67 = load i32* %h, align 4, !dbg !604
  %68 = add nsw i32 %66, %67, !dbg !603
  %69 = sext i32 %68 to i64, !dbg !605
  %70 = load i32* %side, align 4, !dbg !606
  %71 = sext i32 %70 to i64, !dbg !605
  %72 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %71, !dbg !605
  %73 = getelementptr inbounds [49 x i32]* %72, i32 0, i64 %69, !dbg !605
  store i32 %31, i32* %73, align 4, !dbg !605
  br label %74, !dbg !605

; <label>:74                                      ; preds = %12
  %75 = load i32* %h, align 4, !dbg !607
  %76 = add nsw i32 %75, 1, !dbg !607
  store i32 %76, i32* %h, align 4, !dbg !607
  br label %9, !dbg !608

; <label>:77                                      ; preds = %9
  br label %78, !dbg !609

; <label>:78                                      ; preds = %77
  %79 = load i32* %i, align 4, !dbg !610
  %80 = add nsw i32 %79, 1, !dbg !610
  store i32 %80, i32* %i, align 4, !dbg !610
  br label %5, !dbg !611

; <label>:81                                      ; preds = %5
  br label %82, !dbg !612

; <label>:82                                      ; preds = %81
  %83 = load i32* %side, align 4, !dbg !613
  %84 = add nsw i32 %83, 1, !dbg !613
  store i32 %84, i32* %side, align 4, !dbg !613
  br label %1, !dbg !614

; <label>:85                                      ; preds = %1
  ret void, !dbg !615
}

; Function Attrs: nounwind uwtable
define i32 @ab(i32 %alpha, i32 %beta) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %besti = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l = alloca i32, align 4
  %v = alloca i32, align 4
  %val = alloca i32, align 4
  %score = alloca i32, align 4
  %ttscore = alloca i32, align 4
  %winontop = alloca i32, align 4
  %work = alloca i32, align 4
  %nav = alloca i32, align 4
  %av = alloca [7 x i32], align 16
  %poscnt = alloca i64, align 8
  %newbrd = alloca i64, align 8
  %other = alloca i64, align 8
  %side = alloca i32, align 4
  %otherside = alloca i32, align 4
  %hashindx = alloca i32, align 4
  %hashlock = alloca i32, align 4
  store i32 %alpha, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !616, metadata !106), !dbg !617
  store i32 %beta, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !618, metadata !106), !dbg !619
  call void @llvm.dbg.declare(metadata i32* %besti, metadata !620, metadata !106), !dbg !621
  call void @llvm.dbg.declare(metadata i32* %i, metadata !622, metadata !106), !dbg !623
  call void @llvm.dbg.declare(metadata i32* %j, metadata !624, metadata !106), !dbg !625
  call void @llvm.dbg.declare(metadata i32* %l, metadata !626, metadata !106), !dbg !627
  call void @llvm.dbg.declare(metadata i32* %v, metadata !628, metadata !106), !dbg !629
  call void @llvm.dbg.declare(metadata i32* %val, metadata !630, metadata !106), !dbg !631
  call void @llvm.dbg.declare(metadata i32* %score, metadata !632, metadata !106), !dbg !633
  call void @llvm.dbg.declare(metadata i32* %ttscore, metadata !634, metadata !106), !dbg !635
  call void @llvm.dbg.declare(metadata i32* %winontop, metadata !636, metadata !106), !dbg !637
  call void @llvm.dbg.declare(metadata i32* %work, metadata !638, metadata !106), !dbg !639
  call void @llvm.dbg.declare(metadata i32* %nav, metadata !640, metadata !106), !dbg !641
  call void @llvm.dbg.declare(metadata [7 x i32]* %av, metadata !642, metadata !106), !dbg !644
  call void @llvm.dbg.declare(metadata i64* %poscnt, metadata !645, metadata !106), !dbg !646
  call void @llvm.dbg.declare(metadata i64* %newbrd, metadata !647, metadata !106), !dbg !648
  call void @llvm.dbg.declare(metadata i64* %other, metadata !649, metadata !106), !dbg !650
  call void @llvm.dbg.declare(metadata i32* %side, metadata !651, metadata !106), !dbg !652
  call void @llvm.dbg.declare(metadata i32* %otherside, metadata !653, metadata !106), !dbg !654
  call void @llvm.dbg.declare(metadata i32* %hashindx, metadata !655, metadata !106), !dbg !656
  call void @llvm.dbg.declare(metadata i32* %hashlock, metadata !657, metadata !106), !dbg !658
  %4 = load i64* @nodes, align 8, !dbg !659
  %5 = add i64 %4, 1, !dbg !659
  store i64 %5, i64* @nodes, align 8, !dbg !659
  %6 = load i32* @nplies, align 4, !dbg !660
  %7 = icmp eq i32 %6, 41, !dbg !660
  br i1 %7, label %8, label %9, !dbg !662

; <label>:8                                       ; preds = %0
  store i32 3, i32* %1, !dbg !663
  br label %334, !dbg !663

; <label>:9                                       ; preds = %0
  %10 = load i32* @nplies, align 4, !dbg !664
  %11 = and i32 %10, 1, !dbg !664
  store i32 %11, i32* %side, align 4, !dbg !665
  %12 = xor i32 %11, 1, !dbg !666
  store i32 %12, i32* %otherside, align 4, !dbg !667
  %13 = load i32* %otherside, align 4, !dbg !668
  %14 = sext i32 %13 to i64, !dbg !669
  %15 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %14, !dbg !669
  %16 = load i64* %15, align 8, !dbg !669
  store i64 %16, i64* %other, align 8, !dbg !670
  store i32 0, i32* %nav, align 4, !dbg !671
  store i32 0, i32* %i, align 4, !dbg !673
  br label %17, !dbg !673

; <label>:17                                      ; preds = %87, %9
  %18 = load i32* %i, align 4, !dbg !674
  %19 = icmp slt i32 %18, 7, !dbg !674
  br i1 %19, label %20, label %90, !dbg !678

; <label>:20                                      ; preds = %17
  %21 = load i64* %other, align 8, !dbg !679
  %22 = load i32* %i, align 4, !dbg !681
  %23 = sext i32 %22 to i64, !dbg !682
  %24 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %23, !dbg !682
  %25 = load i8* %24, align 1, !dbg !682
  %26 = sext i8 %25 to i32, !dbg !682
  %27 = zext i32 %26 to i64, !dbg !683
  %28 = shl i64 1, %27, !dbg !683
  %29 = or i64 %21, %28, !dbg !679
  store i64 %29, i64* %newbrd, align 8, !dbg !684
  %30 = load i64* %newbrd, align 8, !dbg !685
  %31 = call i32 @islegal(i64 %30), !dbg !687
  %32 = icmp ne i32 %31, 0, !dbg !688
  br i1 %32, label %34, label %33, !dbg !688

; <label>:33                                      ; preds = %20
  br label %87, !dbg !689

; <label>:34                                      ; preds = %20
  %35 = load i64* %other, align 8, !dbg !690
  %36 = load i32* %i, align 4, !dbg !691
  %37 = sext i32 %36 to i64, !dbg !692
  %38 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %37, !dbg !692
  %39 = load i8* %38, align 1, !dbg !692
  %40 = sext i8 %39 to i32, !dbg !692
  %41 = zext i32 %40 to i64, !dbg !693
  %42 = shl i64 2, %41, !dbg !693
  %43 = or i64 %35, %42, !dbg !690
  %44 = call i32 @islegalhaswon(i64 %43), !dbg !694
  store i32 %44, i32* %winontop, align 4, !dbg !695
  %45 = load i64* %newbrd, align 8, !dbg !696
  %46 = call i64 @haswon(i64 %45), !dbg !698
  %47 = icmp ne i64 %46, 0, !dbg !699
  br i1 %47, label %48, label %77, !dbg !699

; <label>:48                                      ; preds = %34
  %49 = load i32* %winontop, align 4, !dbg !700
  %50 = icmp ne i32 %49, 0, !dbg !703
  br i1 %50, label %51, label %52, !dbg !703

; <label>:51                                      ; preds = %48
  store i32 1, i32* %1, !dbg !704
  br label %334, !dbg !704

; <label>:52                                      ; preds = %48
  store i32 0, i32* %nav, align 4, !dbg !705
  %53 = load i32* %i, align 4, !dbg !706
  %54 = load i32* %nav, align 4, !dbg !707
  %55 = add nsw i32 %54, 1, !dbg !707
  store i32 %55, i32* %nav, align 4, !dbg !707
  %56 = sext i32 %54 to i64, !dbg !708
  %57 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %56, !dbg !708
  store i32 %53, i32* %57, align 4, !dbg !708
  br label %58, !dbg !709

; <label>:58                                      ; preds = %75, %52
  %59 = load i32* %i, align 4, !dbg !710
  %60 = add nsw i32 %59, 1, !dbg !710
  store i32 %60, i32* %i, align 4, !dbg !710
  %61 = icmp slt i32 %60, 7, !dbg !710
  br i1 %61, label %62, label %76, !dbg !709

; <label>:62                                      ; preds = %58
  %63 = load i64* %other, align 8, !dbg !713
  %64 = load i32* %i, align 4, !dbg !715
  %65 = sext i32 %64 to i64, !dbg !716
  %66 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %65, !dbg !716
  %67 = load i8* %66, align 1, !dbg !716
  %68 = sext i8 %67 to i32, !dbg !716
  %69 = zext i32 %68 to i64, !dbg !717
  %70 = shl i64 1, %69, !dbg !717
  %71 = or i64 %63, %70, !dbg !713
  %72 = call i32 @islegalhaswon(i64 %71), !dbg !718
  %73 = icmp ne i32 %72, 0, !dbg !719
  br i1 %73, label %74, label %75, !dbg !719

; <label>:74                                      ; preds = %62
  store i32 1, i32* %1, !dbg !720
  br label %334, !dbg !720

; <label>:75                                      ; preds = %62
  br label %58, !dbg !709

; <label>:76                                      ; preds = %58
  br label %90, !dbg !721

; <label>:77                                      ; preds = %34
  %78 = load i32* %winontop, align 4, !dbg !722
  %79 = icmp ne i32 %78, 0, !dbg !724
  br i1 %79, label %86, label %80, !dbg !724

; <label>:80                                      ; preds = %77
  %81 = load i32* %i, align 4, !dbg !725
  %82 = load i32* %nav, align 4, !dbg !726
  %83 = add nsw i32 %82, 1, !dbg !726
  store i32 %83, i32* %nav, align 4, !dbg !726
  %84 = sext i32 %82 to i64, !dbg !727
  %85 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %84, !dbg !727
  store i32 %81, i32* %85, align 4, !dbg !727
  br label %86, !dbg !727

; <label>:86                                      ; preds = %80, %77
  br label %87, !dbg !728

; <label>:87                                      ; preds = %86, %33
  %88 = load i32* %i, align 4, !dbg !729
  %89 = add nsw i32 %88, 1, !dbg !729
  store i32 %89, i32* %i, align 4, !dbg !729
  br label %17, !dbg !730

; <label>:90                                      ; preds = %76, %17
  %91 = load i32* %nav, align 4, !dbg !731
  %92 = icmp eq i32 %91, 0, !dbg !731
  br i1 %92, label %93, label %94, !dbg !733

; <label>:93                                      ; preds = %90
  store i32 1, i32* %1, !dbg !734
  br label %334, !dbg !734

; <label>:94                                      ; preds = %90
  %95 = load i32* @nplies, align 4, !dbg !735
  %96 = icmp eq i32 %95, 40, !dbg !735
  br i1 %96, label %97, label %98, !dbg !737

; <label>:97                                      ; preds = %94
  store i32 3, i32* %1, !dbg !738
  br label %334, !dbg !738

; <label>:98                                      ; preds = %94
  %99 = load i32* %nav, align 4, !dbg !739
  %100 = icmp eq i32 %99, 1, !dbg !739
  br i1 %100, label %101, label %111, !dbg !741

; <label>:101                                     ; preds = %98
  %102 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 0, !dbg !742
  %103 = load i32* %102, align 4, !dbg !742
  call void @makemove(i32 %103), !dbg !744
  %104 = load i32* %3, align 4, !dbg !745
  %105 = sub nsw i32 6, %104, !dbg !746
  %106 = load i32* %2, align 4, !dbg !747
  %107 = sub nsw i32 6, %106, !dbg !748
  %108 = call i32 @ab(i32 %105, i32 %107), !dbg !749
  %109 = sub nsw i32 6, %108, !dbg !750
  store i32 %109, i32* %score, align 4, !dbg !751
  call void @backmove(), !dbg !752
  %110 = load i32* %score, align 4, !dbg !753
  store i32 %110, i32* %1, !dbg !754
  br label %334, !dbg !754

; <label>:111                                     ; preds = %98
  %112 = call i32 @transpose(), !dbg !755
  store i32 %112, i32* %ttscore, align 4, !dbg !756
  %113 = load i32* %ttscore, align 4, !dbg !757
  %114 = icmp ne i32 %113, 0, !dbg !757
  br i1 %114, label %115, label %137, !dbg !759

; <label>:115                                     ; preds = %111
  %116 = load i32* %ttscore, align 4, !dbg !760
  %117 = icmp eq i32 %116, 2, !dbg !760
  br i1 %117, label %118, label %124, !dbg !763

; <label>:118                                     ; preds = %115
  store i32 3, i32* %3, align 4, !dbg !764
  %119 = load i32* %2, align 4, !dbg !767
  %120 = icmp sle i32 3, %119, !dbg !768
  br i1 %120, label %121, label %123, !dbg !769

; <label>:121                                     ; preds = %118
  %122 = load i32* %ttscore, align 4, !dbg !770
  store i32 %122, i32* %1, !dbg !771
  br label %334, !dbg !771

; <label>:123                                     ; preds = %118
  br label %136, !dbg !772

; <label>:124                                     ; preds = %115
  %125 = load i32* %ttscore, align 4, !dbg !773
  %126 = icmp eq i32 %125, 4, !dbg !773
  br i1 %126, label %127, label %133, !dbg !775

; <label>:127                                     ; preds = %124
  store i32 3, i32* %2, align 4, !dbg !776
  %128 = load i32* %3, align 4, !dbg !779
  %129 = icmp sge i32 3, %128, !dbg !780
  br i1 %129, label %130, label %132, !dbg !781

; <label>:130                                     ; preds = %127
  %131 = load i32* %ttscore, align 4, !dbg !782
  store i32 %131, i32* %1, !dbg !783
  br label %334, !dbg !783

; <label>:132                                     ; preds = %127
  br label %135, !dbg !784

; <label>:133                                     ; preds = %124
  %134 = load i32* %ttscore, align 4, !dbg !785
  store i32 %134, i32* %1, !dbg !786
  br label %334, !dbg !786

; <label>:135                                     ; preds = %132
  br label %136

; <label>:136                                     ; preds = %135, %123
  br label %137, !dbg !787

; <label>:137                                     ; preds = %136, %111
  %138 = load i32* @htindex, align 4, !dbg !788
  store i32 %138, i32* %hashindx, align 4, !dbg !789
  %139 = load i32* @lock, align 4, !dbg !790
  store i32 %139, i32* %hashlock, align 4, !dbg !791
  %140 = load i64* @posed, align 8, !dbg !792
  store i64 %140, i64* %poscnt, align 8, !dbg !793
  store i32 0, i32* %besti, align 4, !dbg !794
  store i32 1, i32* %score, align 4, !dbg !795
  store i32 0, i32* %i, align 4, !dbg !796
  br label %141, !dbg !796

; <label>:141                                     ; preds = %295, %137
  %142 = load i32* %i, align 4, !dbg !798
  %143 = load i32* %nav, align 4, !dbg !802
  %144 = icmp slt i32 %142, %143, !dbg !803
  br i1 %144, label %145, label %298, !dbg !804

; <label>:145                                     ; preds = %141
  %146 = load i32* %i, align 4, !dbg !805
  store i32 %146, i32* %l, align 4, !dbg !807
  %147 = sext i32 %146 to i64, !dbg !808
  %148 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %147, !dbg !808
  %149 = load i32* %148, align 4, !dbg !808
  %150 = sext i32 %149 to i64, !dbg !809
  %151 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %150, !dbg !809
  %152 = load i8* %151, align 1, !dbg !809
  %153 = sext i8 %152 to i32, !dbg !810
  %154 = sext i32 %153 to i64, !dbg !811
  %155 = load i32* %side, align 4, !dbg !812
  %156 = sext i32 %155 to i64, !dbg !811
  %157 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %156, !dbg !811
  %158 = getelementptr inbounds [49 x i32]* %157, i32 0, i64 %154, !dbg !811
  %159 = load i32* %158, align 4, !dbg !811
  store i32 %159, i32* %val, align 4, !dbg !813
  %160 = load i32* %i, align 4, !dbg !814
  %161 = add nsw i32 %160, 1, !dbg !814
  store i32 %161, i32* %j, align 4, !dbg !816
  br label %162, !dbg !816

; <label>:162                                     ; preds = %188, %145
  %163 = load i32* %j, align 4, !dbg !817
  %164 = load i32* %nav, align 4, !dbg !821
  %165 = icmp slt i32 %163, %164, !dbg !822
  br i1 %165, label %166, label %191, !dbg !823

; <label>:166                                     ; preds = %162
  %167 = load i32* %j, align 4, !dbg !824
  %168 = sext i32 %167 to i64, !dbg !826
  %169 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %168, !dbg !826
  %170 = load i32* %169, align 4, !dbg !826
  %171 = sext i32 %170 to i64, !dbg !827
  %172 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %171, !dbg !827
  %173 = load i8* %172, align 1, !dbg !827
  %174 = sext i8 %173 to i32, !dbg !828
  %175 = sext i32 %174 to i64, !dbg !829
  %176 = load i32* %side, align 4, !dbg !830
  %177 = sext i32 %176 to i64, !dbg !829
  %178 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %177, !dbg !829
  %179 = getelementptr inbounds [49 x i32]* %178, i32 0, i64 %175, !dbg !829
  %180 = load i32* %179, align 4, !dbg !829
  store i32 %180, i32* %v, align 4, !dbg !831
  %181 = load i32* %v, align 4, !dbg !832
  %182 = load i32* %val, align 4, !dbg !834
  %183 = icmp sgt i32 %181, %182, !dbg !832
  br i1 %183, label %184, label %187, !dbg !835

; <label>:184                                     ; preds = %166
  %185 = load i32* %v, align 4, !dbg !836
  store i32 %185, i32* %val, align 4, !dbg !838
  %186 = load i32* %j, align 4, !dbg !839
  store i32 %186, i32* %l, align 4, !dbg !840
  br label %187, !dbg !841

; <label>:187                                     ; preds = %184, %166
  br label %188, !dbg !842

; <label>:188                                     ; preds = %187
  %189 = load i32* %j, align 4, !dbg !843
  %190 = add nsw i32 %189, 1, !dbg !843
  store i32 %190, i32* %j, align 4, !dbg !843
  br label %162, !dbg !844

; <label>:191                                     ; preds = %162
  %192 = load i32* %l, align 4, !dbg !845
  %193 = sext i32 %192 to i64, !dbg !847
  %194 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %193, !dbg !847
  %195 = load i32* %194, align 4, !dbg !847
  store i32 %195, i32* %j, align 4, !dbg !848
  br label %196, !dbg !848

; <label>:196                                     ; preds = %209, %191
  %197 = load i32* %l, align 4, !dbg !849
  %198 = load i32* %i, align 4, !dbg !853
  %199 = icmp sgt i32 %197, %198, !dbg !854
  br i1 %199, label %200, label %212, !dbg !855

; <label>:200                                     ; preds = %196
  %201 = load i32* %l, align 4, !dbg !856
  %202 = sub nsw i32 %201, 1, !dbg !856
  %203 = sext i32 %202 to i64, !dbg !857
  %204 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %203, !dbg !857
  %205 = load i32* %204, align 4, !dbg !857
  %206 = load i32* %l, align 4, !dbg !858
  %207 = sext i32 %206 to i64, !dbg !859
  %208 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %207, !dbg !859
  store i32 %205, i32* %208, align 4, !dbg !859
  br label %209, !dbg !859

; <label>:209                                     ; preds = %200
  %210 = load i32* %l, align 4, !dbg !860
  %211 = add nsw i32 %210, -1, !dbg !860
  store i32 %211, i32* %l, align 4, !dbg !860
  br label %196, !dbg !861

; <label>:212                                     ; preds = %196
  %213 = load i32* %j, align 4, !dbg !862
  %214 = load i32* %i, align 4, !dbg !863
  %215 = sext i32 %214 to i64, !dbg !864
  %216 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %215, !dbg !864
  store i32 %213, i32* %216, align 4, !dbg !864
  call void @makemove(i32 %213), !dbg !865
  %217 = load i32* %3, align 4, !dbg !866
  %218 = sub nsw i32 6, %217, !dbg !867
  %219 = load i32* %2, align 4, !dbg !868
  %220 = sub nsw i32 6, %219, !dbg !869
  %221 = call i32 @ab(i32 %218, i32 %220), !dbg !870
  %222 = sub nsw i32 6, %221, !dbg !871
  store i32 %222, i32* %val, align 4, !dbg !872
  call void @backmove(), !dbg !873
  %223 = load i32* %val, align 4, !dbg !874
  %224 = load i32* %score, align 4, !dbg !876
  %225 = icmp sgt i32 %223, %224, !dbg !874
  br i1 %225, label %226, label %294, !dbg !877

; <label>:226                                     ; preds = %212
  %227 = load i32* %i, align 4, !dbg !878
  store i32 %227, i32* %besti, align 4, !dbg !880
  %228 = load i32* %val, align 4, !dbg !881
  store i32 %228, i32* %score, align 4, !dbg !883
  %229 = load i32* %2, align 4, !dbg !884
  %230 = icmp sgt i32 %228, %229, !dbg !885
  br i1 %230, label %231, label %293, !dbg !886

; <label>:231                                     ; preds = %226
  %232 = load i32* @nplies, align 4, !dbg !887
  %233 = load i32* @bookply, align 4, !dbg !889
  %234 = icmp sge i32 %232, %233, !dbg !890
  br i1 %234, label %235, label %293, !dbg !886

; <label>:235                                     ; preds = %231
  %236 = load i32* %val, align 4, !dbg !891
  store i32 %236, i32* %2, align 4, !dbg !893
  %237 = load i32* %3, align 4, !dbg !894
  %238 = icmp sge i32 %236, %237, !dbg !895
  br i1 %238, label %239, label %293, !dbg !886

; <label>:239                                     ; preds = %235
  %240 = load i32* %score, align 4, !dbg !896
  %241 = icmp eq i32 %240, 3, !dbg !896
  br i1 %241, label %242, label %248, !dbg !899

; <label>:242                                     ; preds = %239
  %243 = load i32* %i, align 4, !dbg !900
  %244 = load i32* %nav, align 4, !dbg !902
  %245 = sub nsw i32 %244, 1, !dbg !902
  %246 = icmp slt i32 %243, %245, !dbg !903
  br i1 %246, label %247, label %248, !dbg !899

; <label>:247                                     ; preds = %242
  store i32 4, i32* %score, align 4, !dbg !904
  br label %248, !dbg !904

; <label>:248                                     ; preds = %247, %242, %239
  %249 = load i32* %besti, align 4, !dbg !905
  %250 = icmp sgt i32 %249, 0, !dbg !905
  br i1 %250, label %251, label %292, !dbg !907

; <label>:251                                     ; preds = %248
  store i32 0, i32* %i, align 4, !dbg !908
  br label %252, !dbg !908

; <label>:252                                     ; preds = %272, %251
  %253 = load i32* %i, align 4, !dbg !911
  %254 = load i32* %besti, align 4, !dbg !915
  %255 = icmp slt i32 %253, %254, !dbg !916
  br i1 %255, label %256, label %275, !dbg !917

; <label>:256                                     ; preds = %252
  %257 = load i32* %i, align 4, !dbg !918
  %258 = sext i32 %257 to i64, !dbg !919
  %259 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %258, !dbg !919
  %260 = load i32* %259, align 4, !dbg !919
  %261 = sext i32 %260 to i64, !dbg !920
  %262 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %261, !dbg !920
  %263 = load i8* %262, align 1, !dbg !920
  %264 = sext i8 %263 to i32, !dbg !921
  %265 = sext i32 %264 to i64, !dbg !922
  %266 = load i32* %side, align 4, !dbg !923
  %267 = sext i32 %266 to i64, !dbg !922
  %268 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %267, !dbg !922
  %269 = getelementptr inbounds [49 x i32]* %268, i32 0, i64 %265, !dbg !922
  %270 = load i32* %269, align 4, !dbg !922
  %271 = add nsw i32 %270, -1, !dbg !922
  store i32 %271, i32* %269, align 4, !dbg !922
  br label %272, !dbg !922

; <label>:272                                     ; preds = %256
  %273 = load i32* %i, align 4, !dbg !924
  %274 = add nsw i32 %273, 1, !dbg !924
  store i32 %274, i32* %i, align 4, !dbg !924
  br label %252, !dbg !925

; <label>:275                                     ; preds = %252
  %276 = load i32* %besti, align 4, !dbg !926
  %277 = load i32* %besti, align 4, !dbg !927
  %278 = sext i32 %277 to i64, !dbg !928
  %279 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %278, !dbg !928
  %280 = load i32* %279, align 4, !dbg !928
  %281 = sext i32 %280 to i64, !dbg !929
  %282 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %281, !dbg !929
  %283 = load i8* %282, align 1, !dbg !929
  %284 = sext i8 %283 to i32, !dbg !930
  %285 = sext i32 %284 to i64, !dbg !931
  %286 = load i32* %side, align 4, !dbg !932
  %287 = sext i32 %286 to i64, !dbg !931
  %288 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %287, !dbg !931
  %289 = getelementptr inbounds [49 x i32]* %288, i32 0, i64 %285, !dbg !931
  %290 = load i32* %289, align 4, !dbg !931
  %291 = add nsw i32 %290, %276, !dbg !931
  store i32 %291, i32* %289, align 4, !dbg !931
  br label %292, !dbg !933

; <label>:292                                     ; preds = %275, %248
  br label %298, !dbg !934

; <label>:293                                     ; preds = %235, %231, %226
  br label %294, !dbg !935

; <label>:294                                     ; preds = %293, %212
  br label %295, !dbg !936

; <label>:295                                     ; preds = %294
  %296 = load i32* %i, align 4, !dbg !937
  %297 = add nsw i32 %296, 1, !dbg !937
  store i32 %297, i32* %i, align 4, !dbg !937
  br label %141, !dbg !938

; <label>:298                                     ; preds = %292, %141
  %299 = load i32* %score, align 4, !dbg !939
  %300 = load i32* %ttscore, align 4, !dbg !941
  %301 = sub nsw i32 6, %300, !dbg !942
  %302 = icmp eq i32 %299, %301, !dbg !939
  br i1 %302, label %303, label %304, !dbg !943

; <label>:303                                     ; preds = %298
  store i32 3, i32* %score, align 4, !dbg !944
  br label %304, !dbg !944

; <label>:304                                     ; preds = %303, %298
  %305 = load i64* @posed, align 8, !dbg !945
  %306 = load i64* %poscnt, align 8, !dbg !946
  %307 = sub i64 %305, %306, !dbg !945
  store i64 %307, i64* %poscnt, align 8, !dbg !947
  store i32 0, i32* %work, align 4, !dbg !948
  br label %308, !dbg !948

; <label>:308                                     ; preds = %313, %304
  %309 = load i64* %poscnt, align 8, !dbg !950
  %310 = lshr i64 %309, 1, !dbg !950
  store i64 %310, i64* %poscnt, align 8, !dbg !950
  %311 = icmp ne i64 %310, 0, !dbg !954
  br i1 %311, label %312, label %316, !dbg !955

; <label>:312                                     ; preds = %308
  br label %313, !dbg !956

; <label>:313                                     ; preds = %312
  %314 = load i32* %work, align 4, !dbg !958
  %315 = add nsw i32 %314, 1, !dbg !958
  store i32 %315, i32* %work, align 4, !dbg !958
  br label %308, !dbg !960

; <label>:316                                     ; preds = %308
  %317 = load i32* %hashindx, align 4, !dbg !961
  %318 = load i32* %hashlock, align 4, !dbg !962
  %319 = load i32* %score, align 4, !dbg !963
  %320 = load i32* %work, align 4, !dbg !964
  call void @transtore(i32 %317, i32 %318, i32 %319, i32 %320), !dbg !965
  %321 = load i32* @nplies, align 4, !dbg !966
  %322 = load i32* @reportply, align 4, !dbg !968
  %323 = icmp sle i32 %321, %322, !dbg !966
  br i1 %323, label %324, label %332, !dbg !969

; <label>:324                                     ; preds = %316
  call void @printMoves(), !dbg !970
  %325 = load i32* %score, align 4, !dbg !972
  %326 = sext i32 %325 to i64, !dbg !973
  %327 = getelementptr inbounds [7 x i8]* @.str4, i32 0, i64 %326, !dbg !973
  %328 = load i8* %327, align 1, !dbg !973
  %329 = sext i8 %328 to i32, !dbg !973
  %330 = load i32* %work, align 4, !dbg !974
  %331 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0), i32 %329, i32 %330), !dbg !975
  br label %332, !dbg !976

; <label>:332                                     ; preds = %324, %316
  %333 = load i32* %score, align 4, !dbg !977
  store i32 %333, i32* %1, !dbg !978
  br label %334, !dbg !978

; <label>:334                                     ; preds = %332, %133, %130, %121, %101, %97, %93, %74, %51, %8
  %335 = load i32* %1, !dbg !979
  ret i32 %335, !dbg !979
}

; Function Attrs: nounwind uwtable
define i32 @solve() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %side = alloca i32, align 4
  %otherside = alloca i32, align 4
  %score = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !980, metadata !106), !dbg !981
  call void @llvm.dbg.declare(metadata i32* %side, metadata !982, metadata !106), !dbg !983
  %2 = load i32* @nplies, align 4, !dbg !984
  %3 = and i32 %2, 1, !dbg !984
  store i32 %3, i32* %side, align 4, !dbg !983
  call void @llvm.dbg.declare(metadata i32* %otherside, metadata !985, metadata !106), !dbg !986
  %4 = load i32* %side, align 4, !dbg !987
  %5 = xor i32 %4, 1, !dbg !987
  store i32 %5, i32* %otherside, align 4, !dbg !986
  call void @llvm.dbg.declare(metadata i32* %score, metadata !988, metadata !106), !dbg !989
  store i64 0, i64* @nodes, align 8, !dbg !990
  store i64 1, i64* @msecs, align 8, !dbg !991
  %6 = load i32* %otherside, align 4, !dbg !992
  %7 = sext i32 %6 to i64, !dbg !994
  %8 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %7, !dbg !994
  %9 = load i64* %8, align 8, !dbg !994
  %10 = call i64 @haswon(i64 %9), !dbg !995
  %11 = icmp ne i64 %10, 0, !dbg !996
  br i1 %11, label %12, label %13, !dbg !996

; <label>:12                                      ; preds = %0
  store i32 1, i32* %1, !dbg !997
  br label %49, !dbg !997

; <label>:13                                      ; preds = %0
  store i32 0, i32* %i, align 4, !dbg !998
  br label %14, !dbg !998

; <label>:14                                      ; preds = %34, %13
  %15 = load i32* %i, align 4, !dbg !1000
  %16 = icmp slt i32 %15, 7, !dbg !1000
  br i1 %16, label %17, label %37, !dbg !1004

; <label>:17                                      ; preds = %14
  %18 = load i32* %side, align 4, !dbg !1005
  %19 = sext i32 %18 to i64, !dbg !1007
  %20 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %19, !dbg !1007
  %21 = load i64* %20, align 8, !dbg !1007
  %22 = load i32* %i, align 4, !dbg !1008
  %23 = sext i32 %22 to i64, !dbg !1009
  %24 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %23, !dbg !1009
  %25 = load i8* %24, align 1, !dbg !1009
  %26 = sext i8 %25 to i32, !dbg !1009
  %27 = zext i32 %26 to i64, !dbg !1010
  %28 = shl i64 1, %27, !dbg !1010
  %29 = or i64 %21, %28, !dbg !1007
  %30 = call i32 @islegalhaswon(i64 %29), !dbg !1011
  %31 = icmp ne i32 %30, 0, !dbg !1012
  br i1 %31, label %32, label %33, !dbg !1012

; <label>:32                                      ; preds = %17
  store i32 5, i32* %1, !dbg !1013
  br label %49, !dbg !1013

; <label>:33                                      ; preds = %17
  br label %34, !dbg !1014

; <label>:34                                      ; preds = %33
  %35 = load i32* %i, align 4, !dbg !1016
  %36 = add nsw i32 %35, 1, !dbg !1016
  store i32 %36, i32* %i, align 4, !dbg !1016
  br label %14, !dbg !1017

; <label>:37                                      ; preds = %14
  call void @inithistory(), !dbg !1018
  %38 = load i32* @nplies, align 4, !dbg !1019
  %39 = add nsw i32 %38, 2, !dbg !1019
  store i32 %39, i32* @reportply, align 4, !dbg !1020
  %40 = load i32* @nplies, align 4, !dbg !1021
  %41 = add nsw i32 %40, 0, !dbg !1021
  store i32 %41, i32* @bookply, align 4, !dbg !1022
  %42 = call i64 @millisecs(), !dbg !1023
  store i64 %42, i64* @msecs, align 8, !dbg !1024
  %43 = call i32 @ab(i32 1, i32 5), !dbg !1025
  store i32 %43, i32* %score, align 4, !dbg !1026
  %44 = call i64 @millisecs(), !dbg !1027
  %45 = add i64 1, %44, !dbg !1028
  %46 = load i64* @msecs, align 8, !dbg !1029
  %47 = sub i64 %45, %46, !dbg !1028
  store i64 %47, i64* @msecs, align 8, !dbg !1030
  %48 = load i32* %score, align 4, !dbg !1031
  store i32 %48, i32* %1, !dbg !1032
  br label %49, !dbg !1032

; <label>:49                                      ; preds = %37, %32, %12
  %50 = load i32* %1, !dbg !1033
  ret i32 %50, !dbg !1033
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %c = alloca i32, align 4
  %result = alloca i32, align 4
  %work = alloca i32, align 4
  %poscnt = alloca i64, align 8
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata i32* %c, metadata !1034, metadata !106), !dbg !1035
  call void @llvm.dbg.declare(metadata i32* %result, metadata !1036, metadata !106), !dbg !1037
  call void @llvm.dbg.declare(metadata i32* %work, metadata !1038, metadata !106), !dbg !1039
  call void @llvm.dbg.declare(metadata i64* %poscnt, metadata !1040, metadata !106), !dbg !1041
  call void @trans_init(), !dbg !1042
  %2 = call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0)), !dbg !1043
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str6, i32 0, i32 0), i32 7, i32 6), !dbg !1044
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([51 x i8]* @.str7, i32 0, i32 0), i32 8306069, i64 8), !dbg !1045
  br label %5, !dbg !1046

; <label>:5                                       ; preds = %42, %0
  call void @reset(), !dbg !1047
  br label %6, !dbg !1051

; <label>:6                                       ; preds = %23, %5
  %7 = call i32 @getchar(), !dbg !1052
  store i32 %7, i32* %c, align 4, !dbg !1055
  %8 = icmp ne i32 %7, -1, !dbg !1056
  br i1 %8, label %9, label %24, !dbg !1051

; <label>:9                                       ; preds = %6
  %10 = load i32* %c, align 4, !dbg !1057
  %11 = icmp sge i32 %10, 49, !dbg !1057
  br i1 %11, label %12, label %18, !dbg !1060

; <label>:12                                      ; preds = %9
  %13 = load i32* %c, align 4, !dbg !1061
  %14 = icmp sle i32 %13, 55, !dbg !1061
  br i1 %14, label %15, label %18, !dbg !1060

; <label>:15                                      ; preds = %12
  %16 = load i32* %c, align 4, !dbg !1063
  %17 = sub nsw i32 %16, 49, !dbg !1063
  call void @makemove(i32 %17), !dbg !1064
  br label %23, !dbg !1064

; <label>:18                                      ; preds = %12, %9
  %19 = load i32* %c, align 4, !dbg !1065
  %20 = icmp eq i32 %19, 10, !dbg !1065
  br i1 %20, label %21, label %22, !dbg !1067

; <label>:21                                      ; preds = %18
  br label %24, !dbg !1068

; <label>:22                                      ; preds = %18
  br label %23

; <label>:23                                      ; preds = %22, %15
  br label %6, !dbg !1051

; <label>:24                                      ; preds = %21, %6
  %25 = load i32* %c, align 4, !dbg !1069
  %26 = icmp eq i32 %25, -1, !dbg !1069
  br i1 %26, label %27, label %28, !dbg !1071

; <label>:27                                      ; preds = %24
  br label %59, !dbg !1072

; <label>:28                                      ; preds = %24
  %29 = load i32* @nplies, align 4, !dbg !1073
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), i32 %29), !dbg !1074
  call void @printMoves(), !dbg !1075
  %31 = call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @.str9, i32 0, i32 0)), !dbg !1076
  call void @emptyTT(), !dbg !1077
  %32 = call i32 @solve(), !dbg !1078
  store i32 %32, i32* %result, align 4, !dbg !1079
  %33 = load i64* @posed, align 8, !dbg !1080
  store i64 %33, i64* %poscnt, align 8, !dbg !1081
  store i32 0, i32* %work, align 4, !dbg !1082
  br label %34, !dbg !1082

; <label>:34                                      ; preds = %39, %28
  %35 = load i64* %poscnt, align 8, !dbg !1084
  %36 = lshr i64 %35, 1, !dbg !1084
  store i64 %36, i64* %poscnt, align 8, !dbg !1084
  %37 = icmp ne i64 %36, 0, !dbg !1088
  br i1 %37, label %38, label %42, !dbg !1089

; <label>:38                                      ; preds = %34
  br label %39, !dbg !1090

; <label>:39                                      ; preds = %38
  %40 = load i32* %work, align 4, !dbg !1092
  %41 = add nsw i32 %40, 1, !dbg !1092
  store i32 %41, i32* %work, align 4, !dbg !1092
  br label %34, !dbg !1094

; <label>:42                                      ; preds = %34
  %43 = load i32* %result, align 4, !dbg !1095
  %44 = load i32* %result, align 4, !dbg !1096
  %45 = sext i32 %44 to i64, !dbg !1097
  %46 = getelementptr inbounds [7 x i8]* @.str4, i32 0, i64 %45, !dbg !1097
  %47 = load i8* %46, align 1, !dbg !1097
  %48 = sext i8 %47 to i32, !dbg !1097
  %49 = load i32* %work, align 4, !dbg !1098
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i32 0, i32 0), i32 %43, i32 %48, i32 %49), !dbg !1099
  %51 = load i64* @nodes, align 8, !dbg !1100
  %52 = load i64* @msecs, align 8, !dbg !1101
  %53 = load i64* @nodes, align 8, !dbg !1102
  %54 = uitofp i64 %53 to double, !dbg !1103
  %55 = load i64* @msecs, align 8, !dbg !1104
  %56 = uitofp i64 %55 to double, !dbg !1104
  %57 = fdiv double %54, %56, !dbg !1103
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str11, i32 0, i32 0), i64 %51, i64 %52, double %57), !dbg !1105
  call void @htstat(), !dbg !1106
  br label %5, !dbg !1107

; <label>:59                                      ; preds = %27
  ret i32 0, !dbg !1108
}

declare i32 @puts(i8*) #2

declare i32 @getchar() #2

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
!105 = !{!"0x100\00i\0066\000", !30, !31, !28}    ; [ DW_TAG_auto_variable ] [i] [line 66]
!106 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!107 = !MDLocation(line: 66, column: 7, scope: !30)
!108 = !MDLocation(line: 67, column: 3, scope: !30)
!109 = !MDLocation(line: 68, column: 14, scope: !30)
!110 = !MDLocation(line: 68, column: 3, scope: !30)
!111 = !MDLocation(line: 69, column: 8, scope: !112)
!112 = !{!"0xb\0069\003\000", !11, !30}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!113 = !MDLocation(line: 69, column: 13, scope: !114)
!114 = !{!"0xb\002", !11, !115}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!115 = !{!"0xb\001", !11, !116}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!116 = !{!"0xb\0069\003\001", !11, !112}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!117 = !MDLocation(line: 69, column: 3, scope: !112)
!118 = !MDLocation(line: 70, column: 27, scope: !116)
!119 = !MDLocation(line: 70, column: 24, scope: !116)
!120 = !MDLocation(line: 70, column: 17, scope: !116)
!121 = !MDLocation(line: 70, column: 12, scope: !116)
!122 = !MDLocation(line: 70, column: 5, scope: !116)
!123 = !MDLocation(line: 69, column: 22, scope: !116)
!124 = !MDLocation(line: 69, column: 3, scope: !116)
!125 = !MDLocation(line: 71, column: 1, scope: !30)
!126 = !MDLocation(line: 75, column: 16, scope: !35)
!127 = !MDLocation(line: 75, column: 10, scope: !35)
!128 = !MDLocation(line: 75, column: 28, scope: !35)
!129 = !MDLocation(line: 75, column: 39, scope: !35)
!130 = !MDLocation(line: 75, column: 3, scope: !35)
!131 = !{!"0x100\00i\0082\000", !38, !31, !28}    ; [ DW_TAG_auto_variable ] [i] [line 82]
!132 = !MDLocation(line: 82, column: 7, scope: !38)
!133 = !MDLocation(line: 84, column: 8, scope: !134)
!134 = !{!"0xb\0084\003\002", !11, !38}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!135 = !MDLocation(line: 84, column: 13, scope: !136)
!136 = !{!"0xb\002", !11, !137}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!137 = !{!"0xb\001", !11, !138}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!138 = !{!"0xb\0084\003\003", !11, !134}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!139 = !MDLocation(line: 84, column: 15, scope: !138)
!140 = !MDLocation(line: 84, column: 13, scope: !138)
!141 = !MDLocation(line: 84, column: 3, scope: !134)
!142 = !MDLocation(line: 85, column: 26, scope: !138)
!143 = !MDLocation(line: 85, column: 20, scope: !138)
!144 = !MDLocation(line: 85, column: 18, scope: !138)
!145 = !MDLocation(line: 85, column: 5, scope: !138)
!146 = !MDLocation(line: 84, column: 23, scope: !138)
!147 = !MDLocation(line: 84, column: 3, scope: !138)
!148 = !MDLocation(line: 86, column: 1, scope: !38)
!149 = !{!"0x101\00newboard\0016777305\000", !39, !31, !10} ; [ DW_TAG_arg_variable ] [newboard] [line 89]
!150 = !MDLocation(line: 89, column: 22, scope: !39)
!151 = !MDLocation(line: 91, column: 11, scope: !39)
!152 = !MDLocation(line: 91, column: 10, scope: !39)
!153 = !MDLocation(line: 91, column: 3, scope: !39)
!154 = !{!"0x101\00col\0016777311\000", !42, !31, !28} ; [ DW_TAG_arg_variable ] [col] [line 95]
!155 = !MDLocation(line: 95, column: 20, scope: !42)
!156 = !MDLocation(line: 97, column: 24, scope: !42)
!157 = !MDLocation(line: 97, column: 18, scope: !42)
!158 = !MDLocation(line: 97, column: 59, scope: !42)
!159 = !MDLocation(line: 97, column: 52, scope: !42)
!160 = !MDLocation(line: 97, column: 37, scope: !42)
!161 = !MDLocation(line: 97, column: 10, scope: !42)
!162 = !MDLocation(line: 97, column: 3, scope: !42)
!163 = !{!"0x101\00newboard\0016777317\000", !45, !31, !10} ; [ DW_TAG_arg_variable ] [newboard] [line 101]
!164 = !MDLocation(line: 101, column: 26, scope: !45)
!165 = !{!"0x100\00diag1\00103\000", !45, !31, !10} ; [ DW_TAG_auto_variable ] [diag1] [line 103]
!166 = !MDLocation(line: 103, column: 12, scope: !45)
!167 = !MDLocation(line: 103, column: 20, scope: !45)
!168 = !MDLocation(line: 103, column: 32, scope: !45)
!169 = !{!"0x100\00hori\00104\000", !45, !31, !10} ; [ DW_TAG_auto_variable ] [hori] [line 104]
!170 = !MDLocation(line: 104, column: 12, scope: !45)
!171 = !MDLocation(line: 104, column: 19, scope: !45)
!172 = !MDLocation(line: 104, column: 31, scope: !45)
!173 = !{!"0x100\00diag2\00105\000", !45, !31, !10} ; [ DW_TAG_auto_variable ] [diag2] [line 105]
!174 = !MDLocation(line: 105, column: 12, scope: !45)
!175 = !MDLocation(line: 105, column: 20, scope: !45)
!176 = !MDLocation(line: 105, column: 32, scope: !45)
!177 = !{!"0x100\00vert\00106\000", !45, !31, !10} ; [ DW_TAG_auto_variable ] [vert] [line 106]
!178 = !MDLocation(line: 106, column: 12, scope: !45)
!179 = !MDLocation(line: 106, column: 19, scope: !45)
!180 = !MDLocation(line: 106, column: 31, scope: !45)
!181 = !MDLocation(line: 107, column: 12, scope: !45)
!182 = !MDLocation(line: 107, column: 21, scope: !45)
!183 = !MDLocation(line: 108, column: 12, scope: !45)
!184 = !MDLocation(line: 108, column: 20, scope: !45)
!185 = !MDLocation(line: 107, column: 11, scope: !45)
!186 = !MDLocation(line: 109, column: 12, scope: !45)
!187 = !MDLocation(line: 109, column: 21, scope: !45)
!188 = !MDLocation(line: 110, column: 12, scope: !45)
!189 = !MDLocation(line: 110, column: 20, scope: !45)
!190 = !MDLocation(line: 107, column: 3, scope: !45)
!191 = !{!"0x101\00newboard\0016777330\000", !48, !31, !10} ; [ DW_TAG_arg_variable ] [newboard] [line 114]
!192 = !MDLocation(line: 114, column: 28, scope: !48)
!193 = !MDLocation(line: 116, column: 18, scope: !48)
!194 = !MDLocation(line: 116, column: 10, scope: !48)
!195 = !MDLocation(line: 116, column: 38, scope: !196)
!196 = !{!"0xb\001", !11, !48}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!197 = !MDLocation(line: 116, column: 31, scope: !48)
!198 = !MDLocation(line: 116, column: 10, scope: !199)
!199 = !{!"0xb\002", !11, !48}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./Game.c]
!200 = !MDLocation(line: 116, column: 3, scope: !48)
!201 = !{!"0x100\00n\00121\000", !49, !31, !28}   ; [ DW_TAG_auto_variable ] [n] [line 121]
!202 = !MDLocation(line: 121, column: 7, scope: !49)
!203 = !MDLocation(line: 123, column: 13, scope: !49)
!204 = !MDLocation(line: 123, column: 7, scope: !49)
!205 = !MDLocation(line: 123, column: 3, scope: !49)
!206 = !MDLocation(line: 124, column: 44, scope: !49)
!207 = !MDLocation(line: 124, column: 35, scope: !49)
!208 = !MDLocation(line: 124, column: 22, scope: !49)
!209 = !MDLocation(line: 124, column: 9, scope: !49)
!210 = !MDLocation(line: 124, column: 3, scope: !49)
!211 = !MDLocation(line: 125, column: 1, scope: !49)
!212 = !{!"0x101\00n\0016777343\000", !50, !31, !28} ; [ DW_TAG_arg_variable ] [n] [line 127]
!213 = !MDLocation(line: 127, column: 19, scope: !50)
!214 = !MDLocation(line: 129, column: 42, scope: !50)
!215 = !MDLocation(line: 129, column: 35, scope: !50)
!216 = !MDLocation(line: 129, column: 22, scope: !50)
!217 = !MDLocation(line: 129, column: 9, scope: !50)
!218 = !MDLocation(line: 129, column: 3, scope: !50)
!219 = !MDLocation(line: 130, column: 21, scope: !50)
!220 = !MDLocation(line: 130, column: 9, scope: !50)
!221 = !MDLocation(line: 130, column: 3, scope: !50)
!222 = !MDLocation(line: 131, column: 1, scope: !50)
!223 = !MDLocation(line: 60, column: 21, scope: !53)
!224 = !MDLocation(line: 60, column: 8, scope: !53)
!225 = !MDLocation(line: 60, column: 3, scope: !53)
!226 = !MDLocation(line: 61, column: 8, scope: !227)
!227 = !{!"0xb\0061\007\004", !18, !53}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!228 = !MDLocation(line: 61, column: 7, scope: !53)
!229 = !MDLocation(line: 62, column: 5, scope: !230)
!230 = !{!"0xb\0061\0012\005", !18, !227}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!231 = !MDLocation(line: 63, column: 5, scope: !230)
!232 = !MDLocation(line: 65, column: 1, scope: !53)
!233 = !{!"0x100\00i\0069\000", !55, !54, !28}    ; [ DW_TAG_auto_variable ] [i] [line 69]
!234 = !MDLocation(line: 69, column: 7, scope: !55)
!235 = !MDLocation(line: 71, column: 8, scope: !236)
!236 = !{!"0xb\0071\003\006", !18, !55}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!237 = !MDLocation(line: 71, column: 13, scope: !238)
!238 = !{!"0xb\002", !18, !239}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!239 = !{!"0xb\001", !18, !240}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!240 = !{!"0xb\0071\003\007", !18, !236}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!241 = !MDLocation(line: 71, column: 3, scope: !236)
!242 = !MDLocation(line: 72, column: 8, scope: !243)
!243 = !{!"0xb\0071\0030\008", !18, !240}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!244 = !MDLocation(line: 72, column: 5, scope: !243)
!245 = !MDLocation(line: 73, column: 3, scope: !243)
!246 = !MDLocation(line: 71, column: 25, scope: !240)
!247 = !MDLocation(line: 71, column: 3, scope: !240)
!248 = !MDLocation(line: 74, column: 3, scope: !55)
!249 = !MDLocation(line: 75, column: 1, scope: !55)
!250 = !{!"0x100\00htmp\0079\000", !56, !54, !10} ; [ DW_TAG_auto_variable ] [htmp] [line 79]
!251 = !MDLocation(line: 79, column: 12, scope: !56)
!252 = !{!"0x100\00htemp\0079\000", !56, !54, !10} ; [ DW_TAG_auto_variable ] [htemp] [line 79]
!253 = !MDLocation(line: 79, column: 18, scope: !56)
!254 = !MDLocation(line: 79, column: 26, scope: !56)
!255 = !MDLocation(line: 80, column: 7, scope: !256)
!256 = !{!"0xb\0080\007\009", !18, !56}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!257 = !MDLocation(line: 80, column: 7, scope: !56)
!258 = !{!"0x100\00htemp2\0081\000", !259, !54, !10} ; [ DW_TAG_auto_variable ] [htemp2] [line 81]
!259 = !{!"0xb\0080\0025\0010", !18, !256}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!260 = !MDLocation(line: 81, column: 14, scope: !259)
!261 = !MDLocation(line: 82, column: 15, scope: !262)
!262 = !{!"0xb\0082\005\0011", !18, !259}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!263 = !MDLocation(line: 82, column: 10, scope: !262)
!264 = !MDLocation(line: 82, column: 22, scope: !265)
!265 = !{!"0xb\002", !18, !266}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!266 = !{!"0xb\001", !18, !267}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!267 = !{!"0xb\0082\005\0012", !18, !262}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!268 = !MDLocation(line: 82, column: 5, scope: !262)
!269 = !MDLocation(line: 83, column: 16, scope: !267)
!270 = !MDLocation(line: 83, column: 30, scope: !267)
!271 = !MDLocation(line: 83, column: 7, scope: !267)
!272 = !MDLocation(line: 82, column: 31, scope: !267)
!273 = !MDLocation(line: 82, column: 5, scope: !267)
!274 = !MDLocation(line: 84, column: 9, scope: !275)
!275 = !{!"0xb\0084\009\0013", !18, !259}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!276 = !MDLocation(line: 84, column: 18, scope: !275)
!277 = !MDLocation(line: 84, column: 9, scope: !259)
!278 = !MDLocation(line: 85, column: 15, scope: !275)
!279 = !MDLocation(line: 85, column: 7, scope: !275)
!280 = !MDLocation(line: 86, column: 3, scope: !259)
!281 = !MDLocation(line: 87, column: 42, scope: !56)
!282 = !MDLocation(line: 87, column: 10, scope: !56)
!283 = !MDLocation(line: 87, column: 3, scope: !56)
!284 = !MDLocation(line: 88, column: 28, scope: !56)
!285 = !MDLocation(line: 88, column: 13, scope: !56)
!286 = !MDLocation(line: 88, column: 3, scope: !56)
!287 = !MDLocation(line: 89, column: 1, scope: !56)
!288 = !{!"0x100\00he\0093\000", !57, !54, !17}   ; [ DW_TAG_auto_variable ] [he] [line 93]
!289 = !MDLocation(line: 93, column: 13, scope: !57)
!290 = !MDLocation(line: 95, column: 3, scope: !57)
!291 = !MDLocation(line: 96, column: 11, scope: !57)
!292 = !MDLocation(line: 96, column: 3, scope: !57)
!293 = !MDLocation(line: 96, column: 8, scope: !57)
!294 = !MDLocation(line: 97, column: 7, scope: !295)
!295 = !{!"0xb\0097\007\0014", !18, !57}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!296 = !MDLocation(line: 97, column: 21, scope: !295)
!297 = !MDLocation(line: 97, column: 7, scope: !57)
!298 = !MDLocation(line: 98, column: 12, scope: !295)
!299 = !MDLocation(line: 98, column: 5, scope: !295)
!300 = !MDLocation(line: 99, column: 7, scope: !301)
!301 = !{!"0xb\0099\007\0015", !18, !57}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!302 = !MDLocation(line: 99, column: 21, scope: !301)
!303 = !MDLocation(line: 99, column: 7, scope: !57)
!304 = !MDLocation(line: 100, column: 12, scope: !301)
!305 = !MDLocation(line: 100, column: 5, scope: !301)
!306 = !MDLocation(line: 101, column: 3, scope: !57)
!307 = !MDLocation(line: 102, column: 1, scope: !57)
!308 = !{!"0x101\00x\0016777320\000", !60, !54, !28} ; [ DW_TAG_arg_variable ] [x] [line 104]
!309 = !MDLocation(line: 104, column: 20, scope: !60)
!310 = !{!"0x101\00lock\0033554536\000", !60, !54, !22} ; [ DW_TAG_arg_variable ] [lock] [line 104]
!311 = !MDLocation(line: 104, column: 36, scope: !60)
!312 = !{!"0x101\00score\0050331752\000", !60, !54, !28} ; [ DW_TAG_arg_variable ] [score] [line 104]
!313 = !MDLocation(line: 104, column: 46, scope: !60)
!314 = !{!"0x101\00work\0067108968\000", !60, !54, !28} ; [ DW_TAG_arg_variable ] [work] [line 104]
!315 = !MDLocation(line: 104, column: 57, scope: !60)
!316 = !{!"0x100\00he\00106\000", !60, !54, !17}  ; [ DW_TAG_auto_variable ] [he] [line 106]
!317 = !MDLocation(line: 106, column: 13, scope: !60)
!318 = !MDLocation(line: 108, column: 3, scope: !60)
!319 = !MDLocation(line: 109, column: 11, scope: !60)
!320 = !MDLocation(line: 109, column: 3, scope: !60)
!321 = !MDLocation(line: 109, column: 8, scope: !60)
!322 = !MDLocation(line: 110, column: 7, scope: !323)
!323 = !{!"0xb\00110\007\0016", !18, !60}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!324 = !MDLocation(line: 110, column: 21, scope: !323)
!325 = !MDLocation(line: 110, column: 7, scope: !60)
!326 = !MDLocation(line: 110, column: 29, scope: !327)
!327 = !{!"0xb\001", !18, !323}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!328 = !MDLocation(line: 110, column: 37, scope: !323)
!329 = !MDLocation(line: 110, column: 29, scope: !323)
!330 = !MDLocation(line: 111, column: 18, scope: !331)
!331 = !{!"0xb\00110\0049\0017", !18, !323}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!332 = !MDLocation(line: 111, column: 5, scope: !331)
!333 = !MDLocation(line: 112, column: 19, scope: !331)
!334 = !MDLocation(line: 112, column: 5, scope: !331)
!335 = !MDLocation(line: 113, column: 18, scope: !331)
!336 = !MDLocation(line: 113, column: 5, scope: !331)
!337 = !MDLocation(line: 114, column: 3, scope: !331)
!338 = !MDLocation(line: 115, column: 18, scope: !339)
!339 = !{!"0xb\00114\0010\0018", !18, !323}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!340 = !MDLocation(line: 115, column: 5, scope: !339)
!341 = !MDLocation(line: 116, column: 19, scope: !339)
!342 = !MDLocation(line: 116, column: 5, scope: !339)
!343 = !MDLocation(line: 118, column: 6, scope: !60)
!344 = !MDLocation(line: 118, column: 3, scope: !60)
!345 = !MDLocation(line: 119, column: 1, scope: !60)
!346 = !{!"0x100\00total\00123\000", !63, !54, !28} ; [ DW_TAG_auto_variable ] [total] [line 123]
!347 = !MDLocation(line: 123, column: 7, scope: !63)
!348 = !{!"0x100\00i\00123\000", !63, !54, !28}   ; [ DW_TAG_auto_variable ] [i] [line 123]
!349 = !MDLocation(line: 123, column: 14, scope: !63)
!350 = !{!"0x100\00typecnt\00124\000", !63, !54, !351} ; [ DW_TAG_auto_variable ] [typecnt] [line 124]
!351 = !{!"0x1\00\000\00256\0032\000\000\000", null, null, !28, !352, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 32, offset 0] [from int]
!352 = !{!353}
!353 = !{!"0x21\000\008"}                         ; [ DW_TAG_subrange_type ] [0, 7]
!354 = !MDLocation(line: 124, column: 7, scope: !63)
!355 = !{!"0x100\00he\00125\000", !63, !54, !17}  ; [ DW_TAG_auto_variable ] [he] [line 125]
!356 = !MDLocation(line: 125, column: 13, scope: !63)
!357 = !MDLocation(line: 127, column: 8, scope: !358)
!358 = !{!"0xb\00127\003\0019", !18, !63}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!359 = !MDLocation(line: 127, column: 13, scope: !360)
!360 = !{!"0xb\002", !18, !361}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!361 = !{!"0xb\001", !18, !362}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!362 = !{!"0xb\00127\003\0020", !18, !358}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!363 = !MDLocation(line: 127, column: 3, scope: !358)
!364 = !MDLocation(line: 128, column: 13, scope: !362)
!365 = !MDLocation(line: 128, column: 5, scope: !362)
!366 = !MDLocation(line: 127, column: 18, scope: !362)
!367 = !MDLocation(line: 127, column: 3, scope: !362)
!368 = !MDLocation(line: 129, column: 8, scope: !369)
!369 = !{!"0xb\00129\003\0021", !18, !63}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!370 = !MDLocation(line: 129, column: 13, scope: !371)
!371 = !{!"0xb\002", !18, !372}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!372 = !{!"0xb\001", !18, !373}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!373 = !{!"0xb\00129\003\0022", !18, !369}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!374 = !MDLocation(line: 129, column: 3, scope: !369)
!375 = !MDLocation(line: 130, column: 13, scope: !376)
!376 = !{!"0xb\00129\0030\0023", !18, !373}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!377 = !MDLocation(line: 130, column: 5, scope: !376)
!378 = !MDLocation(line: 130, column: 10, scope: !376)
!379 = !MDLocation(line: 131, column: 9, scope: !380)
!380 = !{!"0xb\00131\009\0024", !18, !376}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!381 = !MDLocation(line: 131, column: 9, scope: !376)
!382 = !MDLocation(line: 132, column: 15, scope: !380)
!383 = !MDLocation(line: 132, column: 7, scope: !380)
!384 = !MDLocation(line: 133, column: 9, scope: !385)
!385 = !{!"0xb\00133\009\0025", !18, !376}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!386 = !MDLocation(line: 133, column: 9, scope: !376)
!387 = !MDLocation(line: 134, column: 15, scope: !385)
!388 = !MDLocation(line: 134, column: 7, scope: !385)
!389 = !MDLocation(line: 135, column: 3, scope: !376)
!390 = !MDLocation(line: 129, column: 25, scope: !373)
!391 = !MDLocation(line: 129, column: 3, scope: !373)
!392 = !MDLocation(line: 136, column: 8, scope: !393)
!393 = !{!"0xb\00136\003\0026", !18, !63}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!394 = !MDLocation(line: 136, column: 16, scope: !393)
!395 = !MDLocation(line: 136, column: 24, scope: !396)
!396 = !{!"0xb\002", !18, !397}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!397 = !{!"0xb\001", !18, !398}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!398 = !{!"0xb\00136\003\0027", !18, !393}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!399 = !MDLocation(line: 136, column: 3, scope: !393)
!400 = !MDLocation(line: 137, column: 22, scope: !398)
!401 = !MDLocation(line: 137, column: 14, scope: !398)
!402 = !MDLocation(line: 137, column: 5, scope: !398)
!403 = !MDLocation(line: 136, column: 32, scope: !398)
!404 = !MDLocation(line: 136, column: 3, scope: !398)
!405 = !MDLocation(line: 138, column: 7, scope: !406)
!406 = !{!"0xb\00138\007\0028", !18, !63}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!407 = !MDLocation(line: 138, column: 7, scope: !63)
!408 = !MDLocation(line: 140, column: 7, scope: !409)
!409 = !{!"0xb\00138\0018\0029", !18, !406}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/./TransGame.c]
!410 = !MDLocation(line: 140, column: 29, scope: !409)
!411 = !MDLocation(line: 140, column: 21, scope: !409)
!412 = !MDLocation(line: 140, column: 36, scope: !409)
!413 = !MDLocation(line: 140, column: 62, scope: !409)
!414 = !MDLocation(line: 140, column: 54, scope: !409)
!415 = !MDLocation(line: 141, column: 7, scope: !409)
!416 = !MDLocation(line: 141, column: 29, scope: !409)
!417 = !MDLocation(line: 141, column: 21, scope: !409)
!418 = !MDLocation(line: 141, column: 36, scope: !409)
!419 = !MDLocation(line: 141, column: 61, scope: !409)
!420 = !MDLocation(line: 141, column: 53, scope: !409)
!421 = !MDLocation(line: 142, column: 7, scope: !409)
!422 = !MDLocation(line: 142, column: 28, scope: !409)
!423 = !MDLocation(line: 142, column: 20, scope: !409)
!424 = !MDLocation(line: 139, column: 5, scope: !409)
!425 = !MDLocation(line: 143, column: 3, scope: !409)
!426 = !MDLocation(line: 144, column: 1, scope: !63)
!427 = !{!"0x100\00rusage\0022\000", !64, !65, !428} ; [ DW_TAG_auto_variable ] [rusage] [line 22]
!428 = !{!"0x13\00rusage\00187\001152\0064\000\000\000", !4, null, null, !429, null, null, null} ; [ DW_TAG_structure_type ] [rusage] [line 187, size 1152, align 64, offset 0] [def] [from ]
!429 = !{!430, !440, !441, !447, !452, !457, !462, !467, !472, !477, !482, !487, !492, !497, !502, !507}
!430 = !{!"0xd\00ru_utime\00190\00128\0064\000\000", !4, !428, !431} ; [ DW_TAG_member ] [ru_utime] [line 190, size 128, align 64, offset 0] [from timeval]
!431 = !{!"0x13\00timeval\0030\00128\0064\000\000\000", !432, null, null, !433, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!432 = !{!"/usr/include/x86_64-linux-gnu/bits/time.h", !"/media/sf_shared/Phoronix/fhourstones"}
!433 = !{!434, !438}
!434 = !{!"0xd\00tv_sec\0032\0064\0064\000\000", !432, !431, !435} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!435 = !{!"0x16\00__time_t\00139\000\000\000\000", !436, null, !437} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!436 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/media/sf_shared/Phoronix/fhourstones"}
!437 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!438 = !{!"0xd\00tv_usec\0033\0064\0064\0064\000", !432, !431, !439} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!439 = !{!"0x16\00__suseconds_t\00141\000\000\000\000", !436, null, !437} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!440 = !{!"0xd\00ru_stime\00192\00128\0064\00128\000", !4, !428, !431} ; [ DW_TAG_member ] [ru_stime] [line 192, size 128, align 64, offset 128] [from timeval]
!441 = !{!"0xd\00\00194\0064\0064\00256\000", !4, !428, !442} ; [ DW_TAG_member ] [line 194, size 64, align 64, offset 256] [from ]
!442 = !{!"0x17\00\00194\0064\0064\000\000\000", !4, !428, null, !443, null, null, null} ; [ DW_TAG_union_type ] [line 194, size 64, align 64, offset 0] [def] [from ]
!443 = !{!444, !445}
!444 = !{!"0xd\00ru_maxrss\00196\0064\0064\000\000", !4, !442, !437} ; [ DW_TAG_member ] [ru_maxrss] [line 196, size 64, align 64, offset 0] [from long int]
!445 = !{!"0xd\00__ru_maxrss_word\00197\0064\0064\000\000", !4, !442, !446} ; [ DW_TAG_member ] [__ru_maxrss_word] [line 197, size 64, align 64, offset 0] [from __syscall_slong_t]
!446 = !{!"0x16\00__syscall_slong_t\00175\000\000\000\000", !436, null, !437} ; [ DW_TAG_typedef ] [__syscall_slong_t] [line 175, size 0, align 0, offset 0] [from long int]
!447 = !{!"0xd\00\00202\0064\0064\00320\000", !4, !428, !448} ; [ DW_TAG_member ] [line 202, size 64, align 64, offset 320] [from ]
!448 = !{!"0x17\00\00202\0064\0064\000\000\000", !4, !428, null, !449, null, null, null} ; [ DW_TAG_union_type ] [line 202, size 64, align 64, offset 0] [def] [from ]
!449 = !{!450, !451}
!450 = !{!"0xd\00ru_ixrss\00204\0064\0064\000\000", !4, !448, !437} ; [ DW_TAG_member ] [ru_ixrss] [line 204, size 64, align 64, offset 0] [from long int]
!451 = !{!"0xd\00__ru_ixrss_word\00205\0064\0064\000\000", !4, !448, !446} ; [ DW_TAG_member ] [__ru_ixrss_word] [line 205, size 64, align 64, offset 0] [from __syscall_slong_t]
!452 = !{!"0xd\00\00208\0064\0064\00384\000", !4, !428, !453} ; [ DW_TAG_member ] [line 208, size 64, align 64, offset 384] [from ]
!453 = !{!"0x17\00\00208\0064\0064\000\000\000", !4, !428, null, !454, null, null, null} ; [ DW_TAG_union_type ] [line 208, size 64, align 64, offset 0] [def] [from ]
!454 = !{!455, !456}
!455 = !{!"0xd\00ru_idrss\00210\0064\0064\000\000", !4, !453, !437} ; [ DW_TAG_member ] [ru_idrss] [line 210, size 64, align 64, offset 0] [from long int]
!456 = !{!"0xd\00__ru_idrss_word\00211\0064\0064\000\000", !4, !453, !446} ; [ DW_TAG_member ] [__ru_idrss_word] [line 211, size 64, align 64, offset 0] [from __syscall_slong_t]
!457 = !{!"0xd\00\00214\0064\0064\00448\000", !4, !428, !458} ; [ DW_TAG_member ] [line 214, size 64, align 64, offset 448] [from ]
!458 = !{!"0x17\00\00214\0064\0064\000\000\000", !4, !428, null, !459, null, null, null} ; [ DW_TAG_union_type ] [line 214, size 64, align 64, offset 0] [def] [from ]
!459 = !{!460, !461}
!460 = !{!"0xd\00ru_isrss\00216\0064\0064\000\000", !4, !458, !437} ; [ DW_TAG_member ] [ru_isrss] [line 216, size 64, align 64, offset 0] [from long int]
!461 = !{!"0xd\00__ru_isrss_word\00217\0064\0064\000\000", !4, !458, !446} ; [ DW_TAG_member ] [__ru_isrss_word] [line 217, size 64, align 64, offset 0] [from __syscall_slong_t]
!462 = !{!"0xd\00\00221\0064\0064\00512\000", !4, !428, !463} ; [ DW_TAG_member ] [line 221, size 64, align 64, offset 512] [from ]
!463 = !{!"0x17\00\00221\0064\0064\000\000\000", !4, !428, null, !464, null, null, null} ; [ DW_TAG_union_type ] [line 221, size 64, align 64, offset 0] [def] [from ]
!464 = !{!465, !466}
!465 = !{!"0xd\00ru_minflt\00223\0064\0064\000\000", !4, !463, !437} ; [ DW_TAG_member ] [ru_minflt] [line 223, size 64, align 64, offset 0] [from long int]
!466 = !{!"0xd\00__ru_minflt_word\00224\0064\0064\000\000", !4, !463, !446} ; [ DW_TAG_member ] [__ru_minflt_word] [line 224, size 64, align 64, offset 0] [from __syscall_slong_t]
!467 = !{!"0xd\00\00227\0064\0064\00576\000", !4, !428, !468} ; [ DW_TAG_member ] [line 227, size 64, align 64, offset 576] [from ]
!468 = !{!"0x17\00\00227\0064\0064\000\000\000", !4, !428, null, !469, null, null, null} ; [ DW_TAG_union_type ] [line 227, size 64, align 64, offset 0] [def] [from ]
!469 = !{!470, !471}
!470 = !{!"0xd\00ru_majflt\00229\0064\0064\000\000", !4, !468, !437} ; [ DW_TAG_member ] [ru_majflt] [line 229, size 64, align 64, offset 0] [from long int]
!471 = !{!"0xd\00__ru_majflt_word\00230\0064\0064\000\000", !4, !468, !446} ; [ DW_TAG_member ] [__ru_majflt_word] [line 230, size 64, align 64, offset 0] [from __syscall_slong_t]
!472 = !{!"0xd\00\00233\0064\0064\00640\000", !4, !428, !473} ; [ DW_TAG_member ] [line 233, size 64, align 64, offset 640] [from ]
!473 = !{!"0x17\00\00233\0064\0064\000\000\000", !4, !428, null, !474, null, null, null} ; [ DW_TAG_union_type ] [line 233, size 64, align 64, offset 0] [def] [from ]
!474 = !{!475, !476}
!475 = !{!"0xd\00ru_nswap\00235\0064\0064\000\000", !4, !473, !437} ; [ DW_TAG_member ] [ru_nswap] [line 235, size 64, align 64, offset 0] [from long int]
!476 = !{!"0xd\00__ru_nswap_word\00236\0064\0064\000\000", !4, !473, !446} ; [ DW_TAG_member ] [__ru_nswap_word] [line 236, size 64, align 64, offset 0] [from __syscall_slong_t]
!477 = !{!"0xd\00\00240\0064\0064\00704\000", !4, !428, !478} ; [ DW_TAG_member ] [line 240, size 64, align 64, offset 704] [from ]
!478 = !{!"0x17\00\00240\0064\0064\000\000\000", !4, !428, null, !479, null, null, null} ; [ DW_TAG_union_type ] [line 240, size 64, align 64, offset 0] [def] [from ]
!479 = !{!480, !481}
!480 = !{!"0xd\00ru_inblock\00242\0064\0064\000\000", !4, !478, !437} ; [ DW_TAG_member ] [ru_inblock] [line 242, size 64, align 64, offset 0] [from long int]
!481 = !{!"0xd\00__ru_inblock_word\00243\0064\0064\000\000", !4, !478, !446} ; [ DW_TAG_member ] [__ru_inblock_word] [line 243, size 64, align 64, offset 0] [from __syscall_slong_t]
!482 = !{!"0xd\00\00246\0064\0064\00768\000", !4, !428, !483} ; [ DW_TAG_member ] [line 246, size 64, align 64, offset 768] [from ]
!483 = !{!"0x17\00\00246\0064\0064\000\000\000", !4, !428, null, !484, null, null, null} ; [ DW_TAG_union_type ] [line 246, size 64, align 64, offset 0] [def] [from ]
!484 = !{!485, !486}
!485 = !{!"0xd\00ru_oublock\00248\0064\0064\000\000", !4, !483, !437} ; [ DW_TAG_member ] [ru_oublock] [line 248, size 64, align 64, offset 0] [from long int]
!486 = !{!"0xd\00__ru_oublock_word\00249\0064\0064\000\000", !4, !483, !446} ; [ DW_TAG_member ] [__ru_oublock_word] [line 249, size 64, align 64, offset 0] [from __syscall_slong_t]
!487 = !{!"0xd\00\00252\0064\0064\00832\000", !4, !428, !488} ; [ DW_TAG_member ] [line 252, size 64, align 64, offset 832] [from ]
!488 = !{!"0x17\00\00252\0064\0064\000\000\000", !4, !428, null, !489, null, null, null} ; [ DW_TAG_union_type ] [line 252, size 64, align 64, offset 0] [def] [from ]
!489 = !{!490, !491}
!490 = !{!"0xd\00ru_msgsnd\00254\0064\0064\000\000", !4, !488, !437} ; [ DW_TAG_member ] [ru_msgsnd] [line 254, size 64, align 64, offset 0] [from long int]
!491 = !{!"0xd\00__ru_msgsnd_word\00255\0064\0064\000\000", !4, !488, !446} ; [ DW_TAG_member ] [__ru_msgsnd_word] [line 255, size 64, align 64, offset 0] [from __syscall_slong_t]
!492 = !{!"0xd\00\00258\0064\0064\00896\000", !4, !428, !493} ; [ DW_TAG_member ] [line 258, size 64, align 64, offset 896] [from ]
!493 = !{!"0x17\00\00258\0064\0064\000\000\000", !4, !428, null, !494, null, null, null} ; [ DW_TAG_union_type ] [line 258, size 64, align 64, offset 0] [def] [from ]
!494 = !{!495, !496}
!495 = !{!"0xd\00ru_msgrcv\00260\0064\0064\000\000", !4, !493, !437} ; [ DW_TAG_member ] [ru_msgrcv] [line 260, size 64, align 64, offset 0] [from long int]
!496 = !{!"0xd\00__ru_msgrcv_word\00261\0064\0064\000\000", !4, !493, !446} ; [ DW_TAG_member ] [__ru_msgrcv_word] [line 261, size 64, align 64, offset 0] [from __syscall_slong_t]
!497 = !{!"0xd\00\00264\0064\0064\00960\000", !4, !428, !498} ; [ DW_TAG_member ] [line 264, size 64, align 64, offset 960] [from ]
!498 = !{!"0x17\00\00264\0064\0064\000\000\000", !4, !428, null, !499, null, null, null} ; [ DW_TAG_union_type ] [line 264, size 64, align 64, offset 0] [def] [from ]
!499 = !{!500, !501}
!500 = !{!"0xd\00ru_nsignals\00266\0064\0064\000\000", !4, !498, !437} ; [ DW_TAG_member ] [ru_nsignals] [line 266, size 64, align 64, offset 0] [from long int]
!501 = !{!"0xd\00__ru_nsignals_word\00267\0064\0064\000\000", !4, !498, !446} ; [ DW_TAG_member ] [__ru_nsignals_word] [line 267, size 64, align 64, offset 0] [from __syscall_slong_t]
!502 = !{!"0xd\00\00272\0064\0064\001024\000", !4, !428, !503} ; [ DW_TAG_member ] [line 272, size 64, align 64, offset 1024] [from ]
!503 = !{!"0x17\00\00272\0064\0064\000\000\000", !4, !428, null, !504, null, null, null} ; [ DW_TAG_union_type ] [line 272, size 64, align 64, offset 0] [def] [from ]
!504 = !{!505, !506}
!505 = !{!"0xd\00ru_nvcsw\00274\0064\0064\000\000", !4, !503, !437} ; [ DW_TAG_member ] [ru_nvcsw] [line 274, size 64, align 64, offset 0] [from long int]
!506 = !{!"0xd\00__ru_nvcsw_word\00275\0064\0064\000\000", !4, !503, !446} ; [ DW_TAG_member ] [__ru_nvcsw_word] [line 275, size 64, align 64, offset 0] [from __syscall_slong_t]
!507 = !{!"0xd\00\00279\0064\0064\001088\000", !4, !428, !508} ; [ DW_TAG_member ] [line 279, size 64, align 64, offset 1088] [from ]
!508 = !{!"0x17\00\00279\0064\0064\000\000\000", !4, !428, null, !509, null, null, null} ; [ DW_TAG_union_type ] [line 279, size 64, align 64, offset 0] [def] [from ]
!509 = !{!510, !511}
!510 = !{!"0xd\00ru_nivcsw\00281\0064\0064\000\000", !4, !508, !437} ; [ DW_TAG_member ] [ru_nivcsw] [line 281, size 64, align 64, offset 0] [from long int]
!511 = !{!"0xd\00__ru_nivcsw_word\00282\0064\0064\000\000", !4, !508, !446} ; [ DW_TAG_member ] [__ru_nivcsw_word] [line 282, size 64, align 64, offset 0] [from __syscall_slong_t]
!512 = !MDLocation(line: 22, column: 17, scope: !64)
!513 = !MDLocation(line: 23, column: 3, scope: !64)
!514 = !MDLocation(line: 24, column: 10, scope: !64)
!515 = !MDLocation(line: 24, column: 42, scope: !64)
!516 = !MDLocation(line: 24, column: 3, scope: !64)
!517 = !{!"0x101\00x\0016777247\000", !68, !65, !28} ; [ DW_TAG_arg_variable ] [x] [line 31]
!518 = !MDLocation(line: 31, column: 13, scope: !68)
!519 = !{!"0x101\00y\0033554463\000", !68, !65, !28} ; [ DW_TAG_arg_variable ] [y] [line 31]
!520 = !MDLocation(line: 31, column: 20, scope: !68)
!521 = !MDLocation(line: 31, column: 32, scope: !68)
!522 = !MDLocation(line: 31, column: 34, scope: !68)
!523 = !MDLocation(line: 31, column: 38, scope: !524)
!524 = !{!"0xb\001", !1, !68}                     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!525 = !MDLocation(line: 31, column: 42, scope: !526)
!526 = !{!"0xb\002", !1, !68}                     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!527 = !MDLocation(line: 31, column: 25, scope: !528)
!528 = !{!"0xb\004", !1, !529}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!529 = !{!"0xb\003", !1, !68}                     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!530 = !{!"0x101\00x\0016777248\000", !71, !65, !28} ; [ DW_TAG_arg_variable ] [x] [line 32]
!531 = !MDLocation(line: 32, column: 13, scope: !71)
!532 = !{!"0x101\00y\0033554464\000", !71, !65, !28} ; [ DW_TAG_arg_variable ] [y] [line 32]
!533 = !MDLocation(line: 32, column: 20, scope: !71)
!534 = !MDLocation(line: 32, column: 32, scope: !71)
!535 = !MDLocation(line: 32, column: 34, scope: !71)
!536 = !MDLocation(line: 32, column: 38, scope: !537)
!537 = !{!"0xb\001", !1, !71}                     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!538 = !MDLocation(line: 32, column: 42, scope: !539)
!539 = !{!"0xb\002", !1, !71}                     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!540 = !MDLocation(line: 32, column: 25, scope: !541)
!541 = !{!"0xb\004", !1, !542}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!542 = !{!"0xb\003", !1, !71}                     ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!543 = !{!"0x100\00side\0036\000", !72, !65, !28} ; [ DW_TAG_auto_variable ] [side] [line 36]
!544 = !MDLocation(line: 36, column: 7, scope: !72)
!545 = !{!"0x100\00i\0036\000", !72, !65, !28}    ; [ DW_TAG_auto_variable ] [i] [line 36]
!546 = !MDLocation(line: 36, column: 12, scope: !72)
!547 = !{!"0x100\00h\0036\000", !72, !65, !28}    ; [ DW_TAG_auto_variable ] [h] [line 36]
!548 = !MDLocation(line: 36, column: 14, scope: !72)
!549 = !MDLocation(line: 37, column: 8, scope: !550)
!550 = !{!"0xb\0037\003\0030", !1, !72}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!551 = !MDLocation(line: 37, column: 16, scope: !552)
!552 = !{!"0xb\002", !1, !553}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!553 = !{!"0xb\001", !1, !554}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!554 = !{!"0xb\0037\003\0031", !1, !550}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!555 = !MDLocation(line: 37, column: 3, scope: !550)
!556 = !MDLocation(line: 38, column: 10, scope: !557)
!557 = !{!"0xb\0038\005\0032", !1, !554}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!558 = !MDLocation(line: 38, column: 15, scope: !559)
!559 = !{!"0xb\002", !1, !560}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!560 = !{!"0xb\001", !1, !561}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!561 = !{!"0xb\0038\005\0033", !1, !557}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!562 = !MDLocation(line: 38, column: 5, scope: !557)
!563 = !MDLocation(line: 39, column: 12, scope: !564)
!564 = !{!"0xb\0039\007\0034", !1, !561}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!565 = !MDLocation(line: 39, column: 17, scope: !566)
!566 = !{!"0xb\002", !1, !567}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!567 = !{!"0xb\001", !1, !568}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!568 = !{!"0xb\0039\007\0035", !1, !564}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!569 = !MDLocation(line: 39, column: 7, scope: !564)
!570 = !MDLocation(line: 42, column: 18, scope: !568)
!571 = !MDLocation(line: 42, column: 12, scope: !568)
!572 = !MDLocation(line: 42, column: 10, scope: !568)
!573 = !MDLocation(line: 42, column: 36, scope: !568)
!574 = !MDLocation(line: 42, column: 30, scope: !568)
!575 = !MDLocation(line: 42, column: 47, scope: !568)
!576 = !MDLocation(line: 42, column: 45, scope: !568)
!577 = !MDLocation(line: 42, column: 39, scope: !568)
!578 = !MDLocation(line: 42, column: 23, scope: !568)
!579 = !MDLocation(line: 42, column: 63, scope: !568)
!580 = !MDLocation(line: 42, column: 65, scope: !568)
!581 = !MDLocation(line: 42, column: 59, scope: !568)
!582 = !MDLocation(line: 42, column: 53, scope: !568)
!583 = !MDLocation(line: 42, column: 77, scope: !568)
!584 = !MDLocation(line: 42, column: 71, scope: !568)
!585 = !MDLocation(line: 41, column: 68, scope: !568)
!586 = !MDLocation(line: 41, column: 60, scope: !568)
!587 = !MDLocation(line: 41, column: 56, scope: !568)
!588 = !MDLocation(line: 41, column: 71, scope: !568)
!589 = !MDLocation(line: 41, column: 42, scope: !568)
!590 = !MDLocation(line: 41, column: 50, scope: !568)
!591 = !MDLocation(line: 41, column: 26, scope: !568)
!592 = !MDLocation(line: 41, column: 23, scope: !568)
!593 = !MDLocation(line: 41, column: 37, scope: !568)
!594 = !MDLocation(line: 41, column: 9, scope: !568)
!595 = !MDLocation(line: 41, column: 17, scope: !568)
!596 = !MDLocation(line: 40, column: 59, scope: !568)
!597 = !MDLocation(line: 40, column: 51, scope: !568)
!598 = !MDLocation(line: 40, column: 47, scope: !568)
!599 = !MDLocation(line: 40, column: 71, scope: !568)
!600 = !MDLocation(line: 40, column: 33, scope: !568)
!601 = !MDLocation(line: 40, column: 41, scope: !568)
!602 = !MDLocation(line: 40, column: 26, scope: !568)
!603 = !MDLocation(line: 40, column: 23, scope: !568)
!604 = !MDLocation(line: 40, column: 28, scope: !568)
!605 = !MDLocation(line: 40, column: 9, scope: !568)
!606 = !MDLocation(line: 40, column: 17, scope: !568)
!607 = !MDLocation(line: 39, column: 25, scope: !568)
!608 = !MDLocation(line: 39, column: 7, scope: !568)
!609 = !MDLocation(line: 42, column: 78, scope: !564)
!610 = !MDLocation(line: 38, column: 30, scope: !561)
!611 = !MDLocation(line: 38, column: 5, scope: !561)
!612 = !MDLocation(line: 42, column: 78, scope: !557)
!613 = !MDLocation(line: 37, column: 24, scope: !554)
!614 = !MDLocation(line: 37, column: 3, scope: !554)
!615 = !MDLocation(line: 43, column: 1, scope: !72)
!616 = !{!"0x101\00alpha\0016777261\000", !73, !65, !28} ; [ DW_TAG_arg_variable ] [alpha] [line 45]
!617 = !MDLocation(line: 45, column: 12, scope: !73)
!618 = !{!"0x101\00beta\0033554477\000", !73, !65, !28} ; [ DW_TAG_arg_variable ] [beta] [line 45]
!619 = !MDLocation(line: 45, column: 23, scope: !73)
!620 = !{!"0x100\00besti\0047\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [besti] [line 47]
!621 = !MDLocation(line: 47, column: 7, scope: !73)
!622 = !{!"0x100\00i\0047\000", !73, !65, !28}    ; [ DW_TAG_auto_variable ] [i] [line 47]
!623 = !MDLocation(line: 47, column: 13, scope: !73)
!624 = !{!"0x100\00j\0047\000", !73, !65, !28}    ; [ DW_TAG_auto_variable ] [j] [line 47]
!625 = !MDLocation(line: 47, column: 15, scope: !73)
!626 = !{!"0x100\00l\0047\000", !73, !65, !28}    ; [ DW_TAG_auto_variable ] [l] [line 47]
!627 = !MDLocation(line: 47, column: 17, scope: !73)
!628 = !{!"0x100\00v\0047\000", !73, !65, !28}    ; [ DW_TAG_auto_variable ] [v] [line 47]
!629 = !MDLocation(line: 47, column: 19, scope: !73)
!630 = !{!"0x100\00val\0047\000", !73, !65, !28}  ; [ DW_TAG_auto_variable ] [val] [line 47]
!631 = !MDLocation(line: 47, column: 21, scope: !73)
!632 = !{!"0x100\00score\0047\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [score] [line 47]
!633 = !MDLocation(line: 47, column: 25, scope: !73)
!634 = !{!"0x100\00ttscore\0047\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [ttscore] [line 47]
!635 = !MDLocation(line: 47, column: 31, scope: !73)
!636 = !{!"0x100\00winontop\0048\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [winontop] [line 48]
!637 = !MDLocation(line: 48, column: 7, scope: !73)
!638 = !{!"0x100\00work\0048\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [work] [line 48]
!639 = !MDLocation(line: 48, column: 16, scope: !73)
!640 = !{!"0x100\00nav\0049\000", !73, !65, !28}  ; [ DW_TAG_auto_variable ] [nav] [line 49]
!641 = !MDLocation(line: 49, column: 7, scope: !73)
!642 = !{!"0x100\00av\0049\000", !73, !65, !643}  ; [ DW_TAG_auto_variable ] [av] [line 49]
!643 = !{!"0x1\00\000\00224\0032\000\000\000", null, null, !28, !88, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 224, align 32, offset 0] [from int]
!644 = !MDLocation(line: 49, column: 11, scope: !73)
!645 = !{!"0x100\00poscnt\0050\000", !73, !65, !12} ; [ DW_TAG_auto_variable ] [poscnt] [line 50]
!646 = !MDLocation(line: 50, column: 10, scope: !73)
!647 = !{!"0x100\00newbrd\0051\000", !73, !65, !10} ; [ DW_TAG_auto_variable ] [newbrd] [line 51]
!648 = !MDLocation(line: 51, column: 12, scope: !73)
!649 = !{!"0x100\00other\0051\000", !73, !65, !10} ; [ DW_TAG_auto_variable ] [other] [line 51]
!650 = !MDLocation(line: 51, column: 19, scope: !73)
!651 = !{!"0x100\00side\0052\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [side] [line 52]
!652 = !MDLocation(line: 52, column: 7, scope: !73)
!653 = !{!"0x100\00otherside\0052\000", !73, !65, !28} ; [ DW_TAG_auto_variable ] [otherside] [line 52]
!654 = !MDLocation(line: 52, column: 12, scope: !73)
!655 = !{!"0x100\00hashindx\0053\000", !73, !65, !22} ; [ DW_TAG_auto_variable ] [hashindx] [line 53]
!656 = !MDLocation(line: 53, column: 16, scope: !73)
!657 = !{!"0x100\00hashlock\0053\000", !73, !65, !22} ; [ DW_TAG_auto_variable ] [hashlock] [line 53]
!658 = !MDLocation(line: 53, column: 25, scope: !73)
!659 = !MDLocation(line: 55, column: 3, scope: !73)
!660 = !MDLocation(line: 56, column: 7, scope: !661)
!661 = !{!"0xb\0056\007\0036", !1, !73}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!662 = !MDLocation(line: 56, column: 7, scope: !73)
!663 = !MDLocation(line: 57, column: 5, scope: !661)
!664 = !MDLocation(line: 58, column: 23, scope: !73)
!665 = !MDLocation(line: 58, column: 16, scope: !73)
!666 = !MDLocation(line: 58, column: 15, scope: !73)
!667 = !MDLocation(line: 58, column: 3, scope: !73)
!668 = !MDLocation(line: 59, column: 17, scope: !73)
!669 = !MDLocation(line: 59, column: 11, scope: !73)
!670 = !MDLocation(line: 59, column: 3, scope: !73)
!671 = !MDLocation(line: 60, column: 12, scope: !672)
!672 = !{!"0xb\0060\003\0037", !1, !73}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!673 = !MDLocation(line: 60, column: 8, scope: !672)
!674 = !MDLocation(line: 60, column: 21, scope: !675)
!675 = !{!"0xb\002", !1, !676}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!676 = !{!"0xb\001", !1, !677}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!677 = !{!"0xb\0060\003\0038", !1, !672}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!678 = !MDLocation(line: 60, column: 3, scope: !672)
!679 = !MDLocation(line: 61, column: 14, scope: !680)
!680 = !{!"0xb\0060\0037\0039", !1, !677}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!681 = !MDLocation(line: 61, column: 45, scope: !680)
!682 = !MDLocation(line: 61, column: 38, scope: !680)
!683 = !MDLocation(line: 61, column: 23, scope: !680)
!684 = !MDLocation(line: 61, column: 5, scope: !680)
!685 = !MDLocation(line: 62, column: 18, scope: !686)
!686 = !{!"0xb\0062\009\0040", !1, !680}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!687 = !MDLocation(line: 62, column: 10, scope: !686)
!688 = !MDLocation(line: 62, column: 9, scope: !680)
!689 = !MDLocation(line: 63, column: 7, scope: !686)
!690 = !MDLocation(line: 64, column: 30, scope: !680)
!691 = !MDLocation(line: 64, column: 61, scope: !680)
!692 = !MDLocation(line: 64, column: 54, scope: !680)
!693 = !MDLocation(line: 64, column: 39, scope: !680)
!694 = !MDLocation(line: 64, column: 16, scope: !680)
!695 = !MDLocation(line: 64, column: 5, scope: !680)
!696 = !MDLocation(line: 65, column: 16, scope: !697)
!697 = !{!"0xb\0065\009\0041", !1, !680}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!698 = !MDLocation(line: 65, column: 9, scope: !697)
!699 = !MDLocation(line: 65, column: 9, scope: !680)
!700 = !MDLocation(line: 66, column: 11, scope: !701)
!701 = !{!"0xb\0066\0011\0043", !1, !702}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!702 = !{!"0xb\0065\0025\0042", !1, !697}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!703 = !MDLocation(line: 66, column: 11, scope: !702)
!704 = !MDLocation(line: 67, column: 9, scope: !701)
!705 = !MDLocation(line: 68, column: 7, scope: !702)
!706 = !MDLocation(line: 69, column: 19, scope: !702)
!707 = !MDLocation(line: 69, column: 10, scope: !702)
!708 = !MDLocation(line: 69, column: 7, scope: !702)
!709 = !MDLocation(line: 70, column: 7, scope: !702)
!710 = !MDLocation(line: 70, column: 14, scope: !711)
!711 = !{!"0xb\002", !1, !712}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!712 = !{!"0xb\001", !1, !702}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!713 = !MDLocation(line: 71, column: 27, scope: !714)
!714 = !{!"0xb\0071\0013\0044", !1, !702}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!715 = !MDLocation(line: 71, column: 58, scope: !714)
!716 = !MDLocation(line: 71, column: 51, scope: !714)
!717 = !MDLocation(line: 71, column: 36, scope: !714)
!718 = !MDLocation(line: 71, column: 13, scope: !714)
!719 = !MDLocation(line: 71, column: 13, scope: !702)
!720 = !MDLocation(line: 72, column: 11, scope: !714)
!721 = !MDLocation(line: 73, column: 7, scope: !702)
!722 = !MDLocation(line: 75, column: 10, scope: !723)
!723 = !{!"0xb\0075\009\0045", !1, !680}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!724 = !MDLocation(line: 75, column: 9, scope: !680)
!725 = !MDLocation(line: 76, column: 19, scope: !723)
!726 = !MDLocation(line: 76, column: 10, scope: !723)
!727 = !MDLocation(line: 76, column: 7, scope: !723)
!728 = !MDLocation(line: 77, column: 3, scope: !680)
!729 = !MDLocation(line: 60, column: 32, scope: !677)
!730 = !MDLocation(line: 60, column: 3, scope: !677)
!731 = !MDLocation(line: 78, column: 7, scope: !732)
!732 = !{!"0xb\0078\007\0046", !1, !73}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!733 = !MDLocation(line: 78, column: 7, scope: !73)
!734 = !MDLocation(line: 79, column: 5, scope: !732)
!735 = !MDLocation(line: 80, column: 7, scope: !736)
!736 = !{!"0xb\0080\007\0047", !1, !73}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!737 = !MDLocation(line: 80, column: 7, scope: !73)
!738 = !MDLocation(line: 81, column: 5, scope: !736)
!739 = !MDLocation(line: 82, column: 7, scope: !740)
!740 = !{!"0xb\0082\007\0048", !1, !73}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!741 = !MDLocation(line: 82, column: 7, scope: !73)
!742 = !MDLocation(line: 83, column: 14, scope: !743)
!743 = !{!"0xb\0082\0017\0049", !1, !740}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!744 = !MDLocation(line: 83, column: 5, scope: !743)
!745 = !MDLocation(line: 84, column: 32, scope: !743)
!746 = !MDLocation(line: 84, column: 24, scope: !743)
!747 = !MDLocation(line: 84, column: 45, scope: !743)
!748 = !MDLocation(line: 84, column: 37, scope: !743)
!749 = !MDLocation(line: 84, column: 21, scope: !743)
!750 = !MDLocation(line: 84, column: 13, scope: !743)
!751 = !MDLocation(line: 84, column: 5, scope: !743)
!752 = !MDLocation(line: 85, column: 5, scope: !743)
!753 = !MDLocation(line: 86, column: 12, scope: !743)
!754 = !MDLocation(line: 86, column: 5, scope: !743)
!755 = !MDLocation(line: 88, column: 13, scope: !73)
!756 = !MDLocation(line: 88, column: 3, scope: !73)
!757 = !MDLocation(line: 89, column: 7, scope: !758)
!758 = !{!"0xb\0089\007\0050", !1, !73}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!759 = !MDLocation(line: 89, column: 7, scope: !73)
!760 = !MDLocation(line: 90, column: 9, scope: !761)
!761 = !{!"0xb\0090\009\0052", !1, !762}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!762 = !{!"0xb\0089\0027\0051", !1, !758}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!763 = !MDLocation(line: 90, column: 9, scope: !762)
!764 = !MDLocation(line: 91, column: 12, scope: !765)
!765 = !{!"0xb\0091\0011\0054", !1, !766}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!766 = !{!"0xb\0090\0030\0053", !1, !761}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!767 = !MDLocation(line: 91, column: 28, scope: !765)
!768 = !MDLocation(line: 91, column: 11, scope: !765)
!769 = !MDLocation(line: 91, column: 11, scope: !766)
!770 = !MDLocation(line: 92, column: 16, scope: !765)
!771 = !MDLocation(line: 92, column: 9, scope: !765)
!772 = !MDLocation(line: 93, column: 5, scope: !766)
!773 = !MDLocation(line: 93, column: 16, scope: !774)
!774 = !{!"0xb\0093\0016\0055", !1, !761}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!775 = !MDLocation(line: 93, column: 16, scope: !761)
!776 = !MDLocation(line: 94, column: 12, scope: !777)
!777 = !{!"0xb\0094\0011\0057", !1, !778}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!778 = !{!"0xb\0093\0036\0056", !1, !774}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!779 = !MDLocation(line: 94, column: 29, scope: !777)
!780 = !MDLocation(line: 94, column: 11, scope: !777)
!781 = !MDLocation(line: 94, column: 11, scope: !778)
!782 = !MDLocation(line: 95, column: 16, scope: !777)
!783 = !MDLocation(line: 95, column: 9, scope: !777)
!784 = !MDLocation(line: 96, column: 5, scope: !778)
!785 = !MDLocation(line: 96, column: 19, scope: !774)
!786 = !MDLocation(line: 96, column: 12, scope: !774)
!787 = !MDLocation(line: 97, column: 3, scope: !762)
!788 = !MDLocation(line: 98, column: 14, scope: !73)
!789 = !MDLocation(line: 98, column: 3, scope: !73)
!790 = !MDLocation(line: 99, column: 14, scope: !73)
!791 = !MDLocation(line: 99, column: 3, scope: !73)
!792 = !MDLocation(line: 100, column: 12, scope: !73)
!793 = !MDLocation(line: 100, column: 3, scope: !73)
!794 = !MDLocation(line: 101, column: 3, scope: !73)
!795 = !MDLocation(line: 102, column: 3, scope: !73)
!796 = !MDLocation(line: 103, column: 8, scope: !797)
!797 = !{!"0xb\00103\003\0058", !1, !73}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!798 = !MDLocation(line: 103, column: 15, scope: !799)
!799 = !{!"0xb\002", !1, !800}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!800 = !{!"0xb\001", !1, !801}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!801 = !{!"0xb\00103\003\0059", !1, !797}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!802 = !MDLocation(line: 103, column: 19, scope: !801)
!803 = !MDLocation(line: 103, column: 15, scope: !801)
!804 = !MDLocation(line: 103, column: 3, scope: !797)
!805 = !MDLocation(line: 104, column: 44, scope: !806)
!806 = !{!"0xb\00103\0029\0060", !1, !801}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!807 = !MDLocation(line: 104, column: 40, scope: !806)
!808 = !MDLocation(line: 104, column: 37, scope: !806)
!809 = !MDLocation(line: 104, column: 30, scope: !806)
!810 = !MDLocation(line: 104, column: 25, scope: !806)
!811 = !MDLocation(line: 104, column: 11, scope: !806)
!812 = !MDLocation(line: 104, column: 19, scope: !806)
!813 = !MDLocation(line: 104, column: 5, scope: !806)
!814 = !MDLocation(line: 105, column: 14, scope: !815)
!815 = !{!"0xb\00105\005\0061", !1, !806}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!816 = !MDLocation(line: 105, column: 10, scope: !815)
!817 = !MDLocation(line: 105, column: 19, scope: !818)
!818 = !{!"0xb\002", !1, !819}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!819 = !{!"0xb\001", !1, !820}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!820 = !{!"0xb\00105\005\0062", !1, !815}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!821 = !MDLocation(line: 105, column: 23, scope: !820)
!822 = !MDLocation(line: 105, column: 19, scope: !820)
!823 = !MDLocation(line: 105, column: 5, scope: !815)
!824 = !MDLocation(line: 106, column: 40, scope: !825)
!825 = !{!"0xb\00105\0033\0063", !1, !820}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!826 = !MDLocation(line: 106, column: 37, scope: !825)
!827 = !MDLocation(line: 106, column: 30, scope: !825)
!828 = !MDLocation(line: 106, column: 25, scope: !825)
!829 = !MDLocation(line: 106, column: 11, scope: !825)
!830 = !MDLocation(line: 106, column: 19, scope: !825)
!831 = !MDLocation(line: 106, column: 7, scope: !825)
!832 = !MDLocation(line: 107, column: 11, scope: !833)
!833 = !{!"0xb\00107\0011\0064", !1, !825}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!834 = !MDLocation(line: 107, column: 15, scope: !833)
!835 = !MDLocation(line: 107, column: 11, scope: !825)
!836 = !MDLocation(line: 108, column: 15, scope: !837)
!837 = !{!"0xb\00107\0020\0065", !1, !833}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!838 = !MDLocation(line: 108, column: 9, scope: !837)
!839 = !MDLocation(line: 108, column: 22, scope: !837)
!840 = !MDLocation(line: 108, column: 18, scope: !837)
!841 = !MDLocation(line: 109, column: 7, scope: !837)
!842 = !MDLocation(line: 110, column: 5, scope: !825)
!843 = !MDLocation(line: 105, column: 28, scope: !820)
!844 = !MDLocation(line: 105, column: 5, scope: !820)
!845 = !MDLocation(line: 111, column: 17, scope: !846)
!846 = !{!"0xb\00111\005\0066", !1, !806}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!847 = !MDLocation(line: 111, column: 14, scope: !846)
!848 = !MDLocation(line: 111, column: 10, scope: !846)
!849 = !MDLocation(line: 111, column: 21, scope: !850)
!850 = !{!"0xb\002", !1, !851}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!851 = !{!"0xb\001", !1, !852}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!852 = !{!"0xb\00111\005\0067", !1, !846}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!853 = !MDLocation(line: 111, column: 23, scope: !852)
!854 = !MDLocation(line: 111, column: 21, scope: !852)
!855 = !MDLocation(line: 111, column: 5, scope: !846)
!856 = !MDLocation(line: 112, column: 18, scope: !852)
!857 = !MDLocation(line: 112, column: 15, scope: !852)
!858 = !MDLocation(line: 112, column: 10, scope: !852)
!859 = !MDLocation(line: 112, column: 7, scope: !852)
!860 = !MDLocation(line: 111, column: 26, scope: !852)
!861 = !MDLocation(line: 111, column: 5, scope: !852)
!862 = !MDLocation(line: 113, column: 22, scope: !806)
!863 = !MDLocation(line: 113, column: 17, scope: !806)
!864 = !MDLocation(line: 113, column: 14, scope: !806)
!865 = !MDLocation(line: 113, column: 5, scope: !806)
!866 = !MDLocation(line: 114, column: 30, scope: !806)
!867 = !MDLocation(line: 114, column: 22, scope: !806)
!868 = !MDLocation(line: 114, column: 43, scope: !806)
!869 = !MDLocation(line: 114, column: 35, scope: !806)
!870 = !MDLocation(line: 114, column: 19, scope: !806)
!871 = !MDLocation(line: 114, column: 11, scope: !806)
!872 = !MDLocation(line: 114, column: 5, scope: !806)
!873 = !MDLocation(line: 115, column: 5, scope: !806)
!874 = !MDLocation(line: 116, column: 9, scope: !875)
!875 = !{!"0xb\00116\009\0068", !1, !806}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!876 = !MDLocation(line: 116, column: 15, scope: !875)
!877 = !MDLocation(line: 116, column: 9, scope: !806)
!878 = !MDLocation(line: 117, column: 15, scope: !879)
!879 = !{!"0xb\00116\0022\0069", !1, !875}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!880 = !MDLocation(line: 117, column: 7, scope: !879)
!881 = !MDLocation(line: 118, column: 18, scope: !882)
!882 = !{!"0xb\00118\0011\0070", !1, !879}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!883 = !MDLocation(line: 118, column: 12, scope: !882)
!884 = !MDLocation(line: 118, column: 25, scope: !882)
!885 = !MDLocation(line: 118, column: 11, scope: !882)
!886 = !MDLocation(line: 118, column: 11, scope: !879)
!887 = !MDLocation(line: 118, column: 34, scope: !888)
!888 = !{!"0xb\001", !1, !882}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!889 = !MDLocation(line: 118, column: 44, scope: !882)
!890 = !MDLocation(line: 118, column: 34, scope: !882)
!891 = !MDLocation(line: 118, column: 62, scope: !892)
!892 = !{!"0xb\002", !1, !882}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!893 = !MDLocation(line: 118, column: 56, scope: !882)
!894 = !MDLocation(line: 118, column: 70, scope: !882)
!895 = !MDLocation(line: 118, column: 55, scope: !882)
!896 = !MDLocation(line: 119, column: 13, scope: !897)
!897 = !{!"0xb\00119\0013\0072", !1, !898}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!898 = !{!"0xb\00118\0076\0071", !1, !882}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!899 = !MDLocation(line: 119, column: 13, scope: !898)
!900 = !MDLocation(line: 119, column: 30, scope: !901)
!901 = !{!"0xb\001", !1, !897}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!902 = !MDLocation(line: 119, column: 34, scope: !897)
!903 = !MDLocation(line: 119, column: 30, scope: !897)
!904 = !MDLocation(line: 120, column: 11, scope: !897)
!905 = !MDLocation(line: 121, column: 13, scope: !906)
!906 = !{!"0xb\00121\0013\0073", !1, !898}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!907 = !MDLocation(line: 121, column: 13, scope: !898)
!908 = !MDLocation(line: 122, column: 16, scope: !909)
!909 = !{!"0xb\00122\0011\0075", !1, !910}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!910 = !{!"0xb\00121\0024\0074", !1, !906}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!911 = !MDLocation(line: 122, column: 23, scope: !912)
!912 = !{!"0xb\002", !1, !913}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!913 = !{!"0xb\001", !1, !914}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!914 = !{!"0xb\00122\0011\0076", !1, !909}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!915 = !MDLocation(line: 122, column: 27, scope: !914)
!916 = !MDLocation(line: 122, column: 23, scope: !914)
!917 = !MDLocation(line: 122, column: 11, scope: !909)
!918 = !MDLocation(line: 123, column: 42, scope: !914)
!919 = !MDLocation(line: 123, column: 39, scope: !914)
!920 = !MDLocation(line: 123, column: 32, scope: !914)
!921 = !MDLocation(line: 123, column: 27, scope: !914)
!922 = !MDLocation(line: 123, column: 13, scope: !914)
!923 = !MDLocation(line: 123, column: 21, scope: !914)
!924 = !MDLocation(line: 122, column: 34, scope: !914)
!925 = !MDLocation(line: 122, column: 11, scope: !914)
!926 = !MDLocation(line: 124, column: 52, scope: !910)
!927 = !MDLocation(line: 124, column: 40, scope: !910)
!928 = !MDLocation(line: 124, column: 37, scope: !910)
!929 = !MDLocation(line: 124, column: 30, scope: !910)
!930 = !MDLocation(line: 124, column: 25, scope: !910)
!931 = !MDLocation(line: 124, column: 11, scope: !910)
!932 = !MDLocation(line: 124, column: 19, scope: !910)
!933 = !MDLocation(line: 125, column: 9, scope: !910)
!934 = !MDLocation(line: 126, column: 9, scope: !898)
!935 = !MDLocation(line: 128, column: 5, scope: !879)
!936 = !MDLocation(line: 129, column: 3, scope: !806)
!937 = !MDLocation(line: 103, column: 24, scope: !801)
!938 = !MDLocation(line: 103, column: 3, scope: !801)
!939 = !MDLocation(line: 130, column: 7, scope: !940)
!940 = !{!"0xb\00130\007\0077", !1, !73}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!941 = !MDLocation(line: 130, column: 24, scope: !940)
!942 = !MDLocation(line: 130, column: 16, scope: !940)
!943 = !MDLocation(line: 130, column: 7, scope: !73)
!944 = !MDLocation(line: 131, column: 5, scope: !940)
!945 = !MDLocation(line: 132, column: 12, scope: !73)
!946 = !MDLocation(line: 132, column: 20, scope: !73)
!947 = !MDLocation(line: 132, column: 3, scope: !73)
!948 = !MDLocation(line: 133, column: 8, scope: !949)
!949 = !{!"0xb\00133\003\0078", !1, !73}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!950 = !MDLocation(line: 133, column: 17, scope: !951)
!951 = !{!"0xb\004", !1, !952}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!952 = !{!"0xb\001", !1, !953}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!953 = !{!"0xb\00133\003\0079", !1, !949}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!954 = !MDLocation(line: 133, column: 16, scope: !953)
!955 = !MDLocation(line: 133, column: 3, scope: !949)
!956 = !MDLocation(line: 133, column: 3, scope: !957)
!957 = !{!"0xb\002", !1, !949}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!958 = !MDLocation(line: 133, column: 35, scope: !959)
!959 = !{!"0xb\003", !1, !953}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!960 = !MDLocation(line: 133, column: 3, scope: !953)
!961 = !MDLocation(line: 134, column: 13, scope: !73)
!962 = !MDLocation(line: 134, column: 23, scope: !73)
!963 = !MDLocation(line: 134, column: 33, scope: !73)
!964 = !MDLocation(line: 134, column: 40, scope: !73)
!965 = !MDLocation(line: 134, column: 3, scope: !73)
!966 = !MDLocation(line: 135, column: 7, scope: !967)
!967 = !{!"0xb\00135\007\0080", !1, !73}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!968 = !MDLocation(line: 135, column: 17, scope: !967)
!969 = !MDLocation(line: 135, column: 7, scope: !73)
!970 = !MDLocation(line: 136, column: 5, scope: !971)
!971 = !{!"0xb\00135\0028\0081", !1, !967}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!972 = !MDLocation(line: 137, column: 31, scope: !971)
!973 = !MDLocation(line: 137, column: 22, scope: !971)
!974 = !MDLocation(line: 137, column: 39, scope: !971)
!975 = !MDLocation(line: 137, column: 5, scope: !971)
!976 = !MDLocation(line: 138, column: 3, scope: !971)
!977 = !MDLocation(line: 139, column: 10, scope: !73)
!978 = !MDLocation(line: 139, column: 3, scope: !73)
!979 = !MDLocation(line: 140, column: 1, scope: !73)
!980 = !{!"0x100\00i\00144\000", !74, !65, !28}   ; [ DW_TAG_auto_variable ] [i] [line 144]
!981 = !MDLocation(line: 144, column: 7, scope: !74)
!982 = !{!"0x100\00side\00144\000", !74, !65, !28} ; [ DW_TAG_auto_variable ] [side] [line 144]
!983 = !MDLocation(line: 144, column: 10, scope: !74)
!984 = !MDLocation(line: 144, column: 17, scope: !74)
!985 = !{!"0x100\00otherside\00144\000", !74, !65, !28} ; [ DW_TAG_auto_variable ] [otherside] [line 144]
!986 = !MDLocation(line: 144, column: 29, scope: !74)
!987 = !MDLocation(line: 144, column: 41, scope: !74)
!988 = !{!"0x100\00score\00144\000", !74, !65, !28} ; [ DW_TAG_auto_variable ] [score] [line 144]
!989 = !MDLocation(line: 144, column: 51, scope: !74)
!990 = !MDLocation(line: 146, column: 3, scope: !74)
!991 = !MDLocation(line: 147, column: 3, scope: !74)
!992 = !MDLocation(line: 148, column: 20, scope: !993)
!993 = !{!"0xb\00148\007\0082", !1, !74}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!994 = !MDLocation(line: 148, column: 14, scope: !993)
!995 = !MDLocation(line: 148, column: 7, scope: !993)
!996 = !MDLocation(line: 148, column: 7, scope: !74)
!997 = !MDLocation(line: 149, column: 7, scope: !993)
!998 = !MDLocation(line: 150, column: 8, scope: !999)
!999 = !{!"0xb\00150\003\0083", !1, !74}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1000 = !MDLocation(line: 150, column: 15, scope: !1001)
!1001 = !{!"0xb\002", !1, !1002}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1002 = !{!"0xb\001", !1, !1003}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1003 = !{!"0xb\00150\003\0084", !1, !999}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1004 = !MDLocation(line: 150, column: 3, scope: !999)
!1005 = !MDLocation(line: 151, column: 29, scope: !1006)
!1006 = !{!"0xb\00151\009\0085", !1, !1003}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1007 = !MDLocation(line: 151, column: 23, scope: !1006)
!1008 = !MDLocation(line: 151, column: 60, scope: !1006)
!1009 = !MDLocation(line: 151, column: 53, scope: !1006)
!1010 = !MDLocation(line: 151, column: 38, scope: !1006)
!1011 = !MDLocation(line: 151, column: 9, scope: !1006)
!1012 = !MDLocation(line: 151, column: 9, scope: !1003)
!1013 = !MDLocation(line: 152, column: 7, scope: !1006)
!1014 = !MDLocation(line: 151, column: 63, scope: !1015)
!1015 = !{!"0xb\001", !1, !1006}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1016 = !MDLocation(line: 150, column: 26, scope: !1003)
!1017 = !MDLocation(line: 150, column: 3, scope: !1003)
!1018 = !MDLocation(line: 153, column: 3, scope: !74)
!1019 = !MDLocation(line: 154, column: 15, scope: !74)
!1020 = !MDLocation(line: 154, column: 3, scope: !74)
!1021 = !MDLocation(line: 155, column: 13, scope: !74)
!1022 = !MDLocation(line: 155, column: 3, scope: !74)
!1023 = !MDLocation(line: 156, column: 11, scope: !74)
!1024 = !MDLocation(line: 156, column: 3, scope: !74)
!1025 = !MDLocation(line: 157, column: 11, scope: !74)
!1026 = !MDLocation(line: 157, column: 3, scope: !74)
!1027 = !MDLocation(line: 158, column: 16, scope: !74)
!1028 = !MDLocation(line: 158, column: 11, scope: !74)
!1029 = !MDLocation(line: 158, column: 30, scope: !74)
!1030 = !MDLocation(line: 158, column: 3, scope: !74)
!1031 = !MDLocation(line: 159, column: 10, scope: !74)
!1032 = !MDLocation(line: 159, column: 3, scope: !74)
!1033 = !MDLocation(line: 160, column: 1, scope: !74)
!1034 = !{!"0x100\00c\00164\000", !75, !65, !28}  ; [ DW_TAG_auto_variable ] [c] [line 164]
!1035 = !MDLocation(line: 164, column: 7, scope: !75)
!1036 = !{!"0x100\00result\00164\000", !75, !65, !28} ; [ DW_TAG_auto_variable ] [result] [line 164]
!1037 = !MDLocation(line: 164, column: 10, scope: !75)
!1038 = !{!"0x100\00work\00164\000", !75, !65, !28} ; [ DW_TAG_auto_variable ] [work] [line 164]
!1039 = !MDLocation(line: 164, column: 18, scope: !75)
!1040 = !{!"0x100\00poscnt\00165\000", !75, !65, !12} ; [ DW_TAG_auto_variable ] [poscnt] [line 165]
!1041 = !MDLocation(line: 165, column: 10, scope: !75)
!1042 = !MDLocation(line: 175, column: 3, scope: !75)
!1043 = !MDLocation(line: 176, column: 3, scope: !75)
!1044 = !MDLocation(line: 177, column: 3, scope: !75)
!1045 = !MDLocation(line: 178, column: 3, scope: !75)
!1046 = !MDLocation(line: 180, column: 3, scope: !75)
!1047 = !MDLocation(line: 181, column: 5, scope: !1048)
!1048 = !{!"0xb\00180\0012\0090", !1, !1049}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1049 = !{!"0xb\00180\003\0089", !1, !1050}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1050 = !{!"0xb\00180\003\0088", !1, !75}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1051 = !MDLocation(line: 182, column: 5, scope: !1048)
!1052 = !MDLocation(line: 182, column: 17, scope: !1053)
!1053 = !{!"0xb\002", !1, !1054}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1054 = !{!"0xb\001", !1, !1048}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1055 = !MDLocation(line: 182, column: 13, scope: !1048)
!1056 = !MDLocation(line: 182, column: 12, scope: !1048)
!1057 = !MDLocation(line: 183, column: 11, scope: !1058)
!1058 = !{!"0xb\00183\0011\0092", !1, !1059}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1059 = !{!"0xb\00182\0035\0091", !1, !1048}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1060 = !MDLocation(line: 183, column: 11, scope: !1059)
!1061 = !MDLocation(line: 183, column: 23, scope: !1062)
!1062 = !{!"0xb\001", !1, !1058}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1063 = !MDLocation(line: 184, column: 18, scope: !1058)
!1064 = !MDLocation(line: 184, column: 9, scope: !1058)
!1065 = !MDLocation(line: 185, column: 16, scope: !1066)
!1066 = !{!"0xb\00185\0016\0093", !1, !1058}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1067 = !MDLocation(line: 185, column: 16, scope: !1058)
!1068 = !MDLocation(line: 186, column: 9, scope: !1066)
!1069 = !MDLocation(line: 188, column: 9, scope: !1070)
!1070 = !{!"0xb\00188\009\0094", !1, !1048}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1071 = !MDLocation(line: 188, column: 9, scope: !1048)
!1072 = !MDLocation(line: 189, column: 7, scope: !1070)
!1073 = !MDLocation(line: 190, column: 48, scope: !1048)
!1074 = !MDLocation(line: 190, column: 5, scope: !1048)
!1075 = !MDLocation(line: 191, column: 5, scope: !1048)
!1076 = !MDLocation(line: 192, column: 5, scope: !1048)
!1077 = !MDLocation(line: 194, column: 5, scope: !1048)
!1078 = !MDLocation(line: 195, column: 14, scope: !1048)
!1079 = !MDLocation(line: 195, column: 5, scope: !1048)
!1080 = !MDLocation(line: 196, column: 14, scope: !1048)
!1081 = !MDLocation(line: 196, column: 5, scope: !1048)
!1082 = !MDLocation(line: 197, column: 10, scope: !1083)
!1083 = !{!"0xb\00197\005\0095", !1, !1048}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1084 = !MDLocation(line: 197, column: 19, scope: !1085)
!1085 = !{!"0xb\004", !1, !1086}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1086 = !{!"0xb\001", !1, !1087}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1087 = !{!"0xb\00197\005\0096", !1, !1083}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1088 = !MDLocation(line: 197, column: 18, scope: !1087)
!1089 = !MDLocation(line: 197, column: 5, scope: !1083)
!1090 = !MDLocation(line: 197, column: 5, scope: !1091)
!1091 = !{!"0xb\002", !1, !1083}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1092 = !MDLocation(line: 197, column: 37, scope: !1093)
!1093 = !{!"0xb\003", !1, !1087}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/fhourstones/SearchGame.c]
!1094 = !MDLocation(line: 197, column: 5, scope: !1087)
!1095 = !MDLocation(line: 199, column: 7, scope: !1048)
!1096 = !MDLocation(line: 199, column: 24, scope: !1048)
!1097 = !MDLocation(line: 199, column: 15, scope: !1048)
!1098 = !MDLocation(line: 199, column: 33, scope: !1048)
!1099 = !MDLocation(line: 198, column: 5, scope: !1048)
!1100 = !MDLocation(line: 201, column: 7, scope: !1048)
!1101 = !MDLocation(line: 201, column: 14, scope: !1048)
!1102 = !MDLocation(line: 201, column: 29, scope: !1048)
!1103 = !MDLocation(line: 201, column: 21, scope: !1048)
!1104 = !MDLocation(line: 201, column: 35, scope: !1048)
!1105 = !MDLocation(line: 200, column: 5, scope: !1048)
!1106 = !MDLocation(line: 202, column: 5, scope: !1048)
!1107 = !MDLocation(line: 180, column: 3, scope: !1049)
!1108 = !MDLocation(line: 204, column: 3, scope: !75)
