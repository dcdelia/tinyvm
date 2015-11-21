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
  store i32 0, i32* @nplies, align 4
  store i64 0, i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 1), align 8
  store i64 0, i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 0), align 8
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 7
  br i1 %3, label %4, label %14

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = mul nsw i32 7, %5
  %7 = trunc i32 %6 to i8
  %8 = load i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %9
  store i8 %7, i8* %10, align 1
  br label %11

; <label>:11                                      ; preds = %4
  %12 = load i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %1

; <label>:14                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define i64 @positioncode() #0 {
  %1 = load i32* @nplies, align 4
  %2 = and i32 %1, 1
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %3
  %5 = load i64* %4, align 8
  %6 = load i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 0), align 8
  %7 = add i64 %5, %6
  %8 = load i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 1), align 8
  %9 = add i64 %7, %8
  %10 = add i64 %9, 4432676798593
  ret i64 %10
}

; Function Attrs: nounwind uwtable
define void @printMoves() #0 {
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %12, %0
  %2 = load i32* %i, align 4
  %3 = load i32* @nplies, align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %1
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [42 x i32]* @moves, i32 0, i64 %7
  %9 = load i32* %8, align 4
  %10 = add nsw i32 1, %9
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %10)
  br label %12

; <label>:12                                      ; preds = %5
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %1

; <label>:15                                      ; preds = %1
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @islegal(i64 %newboard) #0 {
  %1 = alloca i64, align 8
  store i64 %newboard, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = and i64 %2, 283691315109952
  %4 = icmp eq i64 %3, 0
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @isplayable(i32 %col) #0 {
  %1 = alloca i32, align 4
  store i32 %col, i32* %1, align 4
  %2 = load i32* @nplies, align 4
  %3 = and i32 %2, 1
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %4
  %6 = load i64* %5, align 8
  %7 = load i32* %1, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %8
  %10 = load i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = zext i32 %11 to i64
  %13 = shl i64 1, %12
  %14 = or i64 %6, %13
  %15 = call i32 @islegal(i64 %14)
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define i64 @haswon(i64 %newboard) #0 {
  %1 = alloca i64, align 8
  %diag1 = alloca i64, align 8
  %hori = alloca i64, align 8
  %diag2 = alloca i64, align 8
  %vert = alloca i64, align 8
  store i64 %newboard, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = load i64* %1, align 8
  %4 = lshr i64 %3, 6
  %5 = and i64 %2, %4
  store i64 %5, i64* %diag1, align 8
  %6 = load i64* %1, align 8
  %7 = load i64* %1, align 8
  %8 = lshr i64 %7, 7
  %9 = and i64 %6, %8
  store i64 %9, i64* %hori, align 8
  %10 = load i64* %1, align 8
  %11 = load i64* %1, align 8
  %12 = lshr i64 %11, 8
  %13 = and i64 %10, %12
  store i64 %13, i64* %diag2, align 8
  %14 = load i64* %1, align 8
  %15 = load i64* %1, align 8
  %16 = lshr i64 %15, 1
  %17 = and i64 %14, %16
  store i64 %17, i64* %vert, align 8
  %18 = load i64* %diag1, align 8
  %19 = load i64* %diag1, align 8
  %20 = lshr i64 %19, 12
  %21 = and i64 %18, %20
  %22 = load i64* %hori, align 8
  %23 = load i64* %hori, align 8
  %24 = lshr i64 %23, 14
  %25 = and i64 %22, %24
  %26 = or i64 %21, %25
  %27 = load i64* %diag2, align 8
  %28 = load i64* %diag2, align 8
  %29 = lshr i64 %28, 16
  %30 = and i64 %27, %29
  %31 = or i64 %26, %30
  %32 = load i64* %vert, align 8
  %33 = load i64* %vert, align 8
  %34 = lshr i64 %33, 2
  %35 = and i64 %32, %34
  %36 = or i64 %31, %35
  ret i64 %36
}

; Function Attrs: nounwind uwtable
define i32 @islegalhaswon(i64 %newboard) #0 {
  %1 = alloca i64, align 8
  store i64 %newboard, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = call i32 @islegal(i64 %2)
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  %7 = call i64 @haswon(i64 %6)
  %8 = icmp ne i64 %7, 0
  br label %9

; <label>:9                                       ; preds = %5, %0
  %10 = phi i1 [ false, %0 ], [ %8, %5 ]
  %11 = zext i1 %10 to i32
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define void @backmove() #0 {
  %n = alloca i32, align 4
  %1 = load i32* @nplies, align 4
  %2 = add nsw i32 %1, -1
  store i32 %2, i32* @nplies, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [42 x i32]* @moves, i32 0, i64 %3
  %5 = load i32* %4, align 4
  store i32 %5, i32* %n, align 4
  %6 = load i32* %n, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = add i8 %9, -1
  store i8 %10, i8* %8, align 1
  %11 = sext i8 %10 to i32
  %12 = zext i32 %11 to i64
  %13 = shl i64 1, %12
  %14 = load i32* @nplies, align 4
  %15 = and i32 %14, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %16
  %18 = load i64* %17, align 8
  %19 = xor i64 %18, %13
  store i64 %19, i64* %17, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @makemove(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = add i8 %5, 1
  store i8 %6, i8* %4, align 1
  %7 = sext i8 %5 to i32
  %8 = zext i32 %7 to i64
  %9 = shl i64 1, %8
  %10 = load i32* @nplies, align 4
  %11 = and i32 %10, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %12
  %14 = load i64* %13, align 8
  %15 = xor i64 %14, %9
  store i64 %15, i64* %13, align 8
  %16 = load i32* %1, align 4
  %17 = load i32* @nplies, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* @nplies, align 4
  %19 = sext i32 %17 to i64
  %20 = getelementptr inbounds [42 x i32]* @moves, i32 0, i64 %19
  store i32 %16, i32* %20, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @trans_init() #0 {
  %1 = call noalias i8* @calloc(i64 8306069, i64 8) #4
  %2 = bitcast i8* %1 to %struct.hashentry*
  store %struct.hashentry* %2, %struct.hashentry** @ht, align 8
  %3 = load %struct.hashentry** @ht, align 8
  %4 = icmp ne %struct.hashentry* %3, null
  br i1 %4, label %7, label %5

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i32 0, i32 0), i64 66448552)
  call void @exit(i32 0) #5
  unreachable

; <label>:7                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define void @emptyTT() #0 {
  %i = alloca i32, align 4
  %1 = alloca %struct.hashentry, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %27, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8306069
  br i1 %4, label %5, label %30

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = load %struct.hashentry** @ht, align 8
  %9 = getelementptr inbounds %struct.hashentry* %8, i64 %7
  %10 = bitcast %struct.hashentry* %1 to i64*
  %11 = load i64* %10, align 4
  %12 = and i64 %11, -67108864
  store i64 %12, i64* %10, align 4
  %13 = bitcast %struct.hashentry* %1 to i64*
  %14 = load i64* %13, align 4
  %15 = and i64 %14, -4227858433
  store i64 %15, i64* %13, align 4
  %16 = bitcast %struct.hashentry* %1 to i64*
  %17 = load i64* %16, align 4
  %18 = and i64 %17, -288230371856744449
  store i64 %18, i64* %16, align 4
  %19 = bitcast %struct.hashentry* %1 to i64*
  %20 = load i64* %19, align 4
  %21 = and i64 %20, -2017612633061982209
  store i64 %21, i64* %19, align 4
  %22 = bitcast %struct.hashentry* %1 to i64*
  %23 = load i64* %22, align 4
  %24 = and i64 %23, 2305843009213693951
  store i64 %24, i64* %22, align 4
  %25 = bitcast %struct.hashentry* %9 to i8*
  %26 = bitcast %struct.hashentry* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %26, i64 8, i32 4, i1 false)
  br label %27

; <label>:27                                      ; preds = %5
  %28 = load i32* %i, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %i, align 4
  br label %2

; <label>:30                                      ; preds = %2
  store i64 0, i64* @posed, align 8
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define void @hash() #0 {
  %htmp = alloca i64, align 8
  %htemp = alloca i64, align 8
  %htemp2 = alloca i64, align 8
  %1 = call i64 @positioncode()
  store i64 %1, i64* %htemp, align 8
  %2 = load i32* @nplies, align 4
  %3 = icmp slt i32 %2, 10
  br i1 %3, label %4, label %25

; <label>:4                                       ; preds = %0
  store i64 0, i64* %htemp2, align 8
  %5 = load i64* %htemp, align 8
  store i64 %5, i64* %htmp, align 8
  br label %6

; <label>:6                                       ; preds = %15, %4
  %7 = load i64* %htmp, align 8
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %9, label %18

; <label>:9                                       ; preds = %6
  %10 = load i64* %htemp2, align 8
  %11 = shl i64 %10, 7
  %12 = load i64* %htmp, align 8
  %13 = and i64 %12, 127
  %14 = or i64 %11, %13
  store i64 %14, i64* %htemp2, align 8
  br label %15

; <label>:15                                      ; preds = %9
  %16 = load i64* %htmp, align 8
  %17 = lshr i64 %16, 7
  store i64 %17, i64* %htmp, align 8
  br label %6

; <label>:18                                      ; preds = %6
  %19 = load i64* %htemp2, align 8
  %20 = load i64* %htemp, align 8
  %21 = icmp ult i64 %19, %20
  br i1 %21, label %22, label %24

; <label>:22                                      ; preds = %18
  %23 = load i64* %htemp2, align 8
  store i64 %23, i64* %htemp, align 8
  br label %24

; <label>:24                                      ; preds = %22, %18
  br label %25

; <label>:25                                      ; preds = %24, %0
  %26 = load i64* %htemp, align 8
  %27 = lshr i64 %26, 23
  %28 = trunc i64 %27 to i32
  store i32 %28, i32* @lock, align 4
  %29 = load i64* %htemp, align 8
  %30 = urem i64 %29, 8306069
  %31 = trunc i64 %30 to i32
  store i32 %31, i32* @htindex, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @transpose() #0 {
  %1 = alloca i32, align 4
  %he = alloca %struct.hashentry, align 4
  call void @hash()
  %2 = load i32* @htindex, align 4
  %3 = zext i32 %2 to i64
  %4 = load %struct.hashentry** @ht, align 8
  %5 = getelementptr inbounds %struct.hashentry* %4, i64 %3
  %6 = bitcast %struct.hashentry* %he to i8*
  %7 = bitcast %struct.hashentry* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 4, i1 false)
  %8 = bitcast %struct.hashentry* %he to i64*
  %9 = load i64* %8, align 4
  %10 = and i64 %9, 67108863
  %11 = trunc i64 %10 to i32
  %12 = load i32* @lock, align 4
  %13 = icmp eq i32 %11, %12
  br i1 %13, label %14, label %19

; <label>:14                                      ; preds = %0
  %15 = bitcast %struct.hashentry* %he to i64*
  %16 = load i64* %15, align 4
  %17 = lshr i64 %16, 61
  %18 = trunc i64 %17 to i32
  store i32 %18, i32* %1
  br label %34

; <label>:19                                      ; preds = %0
  %20 = bitcast %struct.hashentry* %he to i64*
  %21 = load i64* %20, align 4
  %22 = lshr i64 %21, 32
  %23 = and i64 %22, 67108863
  %24 = trunc i64 %23 to i32
  %25 = load i32* @lock, align 4
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %27, label %33

; <label>:27                                      ; preds = %19
  %28 = bitcast %struct.hashentry* %he to i64*
  %29 = load i64* %28, align 4
  %30 = lshr i64 %29, 58
  %31 = and i64 %30, 7
  %32 = trunc i64 %31 to i32
  store i32 %32, i32* %1
  br label %34

; <label>:33                                      ; preds = %19
  store i32 0, i32* %1
  br label %34

; <label>:34                                      ; preds = %33, %27, %14
  %35 = load i32* %1
  ret i32 %35
}

; Function Attrs: nounwind uwtable
define void @transtore(i32 %x, i32 %lock, i32 %score, i32 %work) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %he = alloca %struct.hashentry, align 4
  store i32 %x, i32* %1, align 4
  store i32 %lock, i32* %2, align 4
  store i32 %score, i32* %3, align 4
  store i32 %work, i32* %4, align 4
  %5 = load i64* @posed, align 8
  %6 = add i64 %5, 1
  store i64 %6, i64* @posed, align 8
  %7 = load i32* %1, align 4
  %8 = sext i32 %7 to i64
  %9 = load %struct.hashentry** @ht, align 8
  %10 = getelementptr inbounds %struct.hashentry* %9, i64 %8
  %11 = bitcast %struct.hashentry* %he to i8*
  %12 = bitcast %struct.hashentry* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 8, i32 4, i1 false)
  %13 = bitcast %struct.hashentry* %he to i64*
  %14 = load i64* %13, align 4
  %15 = and i64 %14, 67108863
  %16 = trunc i64 %15 to i32
  %17 = load i32* %2, align 4
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %27, label %19

; <label>:19                                      ; preds = %0
  %20 = load i32* %4, align 4
  %21 = bitcast %struct.hashentry* %he to i64*
  %22 = load i64* %21, align 4
  %23 = lshr i64 %22, 26
  %24 = and i64 %23, 63
  %25 = trunc i64 %24 to i32
  %26 = icmp sge i32 %20, %25
  br i1 %26, label %27, label %54

; <label>:27                                      ; preds = %19, %0
  %28 = load i32* %2, align 4
  %29 = bitcast %struct.hashentry* %he to i64*
  %30 = zext i32 %28 to i64
  %31 = load i64* %29, align 4
  %32 = and i64 %30, 67108863
  %33 = and i64 %31, -67108864
  %34 = or i64 %33, %32
  store i64 %34, i64* %29, align 4
  %35 = trunc i64 %32 to i32
  %36 = load i32* %3, align 4
  %37 = bitcast %struct.hashentry* %he to i64*
  %38 = zext i32 %36 to i64
  %39 = load i64* %37, align 4
  %40 = and i64 %38, 7
  %41 = shl i64 %40, 61
  %42 = and i64 %39, 2305843009213693951
  %43 = or i64 %42, %41
  store i64 %43, i64* %37, align 4
  %44 = trunc i64 %40 to i32
  %45 = load i32* %4, align 4
  %46 = bitcast %struct.hashentry* %he to i64*
  %47 = zext i32 %45 to i64
  %48 = load i64* %46, align 4
  %49 = and i64 %47, 63
  %50 = shl i64 %49, 26
  %51 = and i64 %48, -4227858433
  %52 = or i64 %51, %50
  store i64 %52, i64* %46, align 4
  %53 = trunc i64 %49 to i32
  br label %73

; <label>:54                                      ; preds = %19
  %55 = load i32* %2, align 4
  %56 = bitcast %struct.hashentry* %he to i64*
  %57 = zext i32 %55 to i64
  %58 = load i64* %56, align 4
  %59 = and i64 %57, 67108863
  %60 = shl i64 %59, 32
  %61 = and i64 %58, -288230371856744449
  %62 = or i64 %61, %60
  store i64 %62, i64* %56, align 4
  %63 = trunc i64 %59 to i32
  %64 = load i32* %3, align 4
  %65 = bitcast %struct.hashentry* %he to i64*
  %66 = zext i32 %64 to i64
  %67 = load i64* %65, align 4
  %68 = and i64 %66, 7
  %69 = shl i64 %68, 58
  %70 = and i64 %67, -2017612633061982209
  %71 = or i64 %70, %69
  store i64 %71, i64* %65, align 4
  %72 = trunc i64 %68 to i32
  br label %73

; <label>:73                                      ; preds = %54, %27
  %74 = load i32* %1, align 4
  %75 = sext i32 %74 to i64
  %76 = load %struct.hashentry** @ht, align 8
  %77 = getelementptr inbounds %struct.hashentry* %76, i64 %75
  %78 = bitcast %struct.hashentry* %77 to i8*
  %79 = bitcast %struct.hashentry* %he to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %78, i8* %79, i64 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define void @htstat() #0 {
  %total = alloca i32, align 4
  %i = alloca i32, align 4
  %typecnt = alloca [8 x i32], align 16
  %he = alloca %struct.hashentry, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 8
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %6
  store i32 0, i32* %7, align 4
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %i, align 4
  br label %1

; <label>:11                                      ; preds = %1
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %54, %11
  %13 = load i32* %i, align 4
  %14 = icmp slt i32 %13, 8306069
  br i1 %14, label %15, label %57

; <label>:15                                      ; preds = %12
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load %struct.hashentry** @ht, align 8
  %19 = getelementptr inbounds %struct.hashentry* %18, i64 %17
  %20 = bitcast %struct.hashentry* %he to i8*
  %21 = bitcast %struct.hashentry* %19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %21, i64 8, i32 4, i1 false)
  %22 = bitcast %struct.hashentry* %he to i64*
  %23 = load i64* %22, align 4
  %24 = and i64 %23, 67108863
  %25 = trunc i64 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %36

; <label>:27                                      ; preds = %15
  %28 = bitcast %struct.hashentry* %he to i64*
  %29 = load i64* %28, align 4
  %30 = lshr i64 %29, 61
  %31 = trunc i64 %30 to i32
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %32
  %34 = load i32* %33, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %33, align 4
  br label %36

; <label>:36                                      ; preds = %27, %15
  %37 = bitcast %struct.hashentry* %he to i64*
  %38 = load i64* %37, align 4
  %39 = lshr i64 %38, 32
  %40 = and i64 %39, 67108863
  %41 = trunc i64 %40 to i32
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %53

; <label>:43                                      ; preds = %36
  %44 = bitcast %struct.hashentry* %he to i64*
  %45 = load i64* %44, align 4
  %46 = lshr i64 %45, 58
  %47 = and i64 %46, 7
  %48 = trunc i64 %47 to i32
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %49
  %51 = load i32* %50, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %50, align 4
  br label %53

; <label>:53                                      ; preds = %43, %36
  br label %54

; <label>:54                                      ; preds = %53
  %55 = load i32* %i, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %i, align 4
  br label %12

; <label>:57                                      ; preds = %12
  store i32 0, i32* %total, align 4
  store i32 1, i32* %i, align 4
  br label %58

; <label>:58                                      ; preds = %68, %57
  %59 = load i32* %i, align 4
  %60 = icmp sle i32 %59, 5
  br i1 %60, label %61, label %71

; <label>:61                                      ; preds = %58
  %62 = load i32* %i, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %63
  %65 = load i32* %64, align 4
  %66 = load i32* %total, align 4
  %67 = add nsw i32 %66, %65
  store i32 %67, i32* %total, align 4
  br label %68

; <label>:68                                      ; preds = %61
  %69 = load i32* %i, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %i, align 4
  br label %58

; <label>:71                                      ; preds = %58
  %72 = load i32* %total, align 4
  %73 = icmp sgt i32 %72, 0
  br i1 %73, label %74, label %106

; <label>:74                                      ; preds = %71
  %75 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 1
  %76 = load i32* %75, align 4
  %77 = sitofp i32 %76 to double
  %78 = load i32* %total, align 4
  %79 = sitofp i32 %78 to double
  %80 = fdiv double %77, %79
  %81 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 2
  %82 = load i32* %81, align 4
  %83 = sitofp i32 %82 to double
  %84 = load i32* %total, align 4
  %85 = sitofp i32 %84 to double
  %86 = fdiv double %83, %85
  %87 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 3
  %88 = load i32* %87, align 4
  %89 = sitofp i32 %88 to double
  %90 = load i32* %total, align 4
  %91 = sitofp i32 %90 to double
  %92 = fdiv double %89, %91
  %93 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 4
  %94 = load i32* %93, align 4
  %95 = sitofp i32 %94 to double
  %96 = load i32* %total, align 4
  %97 = sitofp i32 %96 to double
  %98 = fdiv double %95, %97
  %99 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 5
  %100 = load i32* %99, align 4
  %101 = sitofp i32 %100 to double
  %102 = load i32* %total, align 4
  %103 = sitofp i32 %102 to double
  %104 = fdiv double %101, %103
  %105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str2, i32 0, i32 0), double %80, double %86, double %92, double %98, double %104)
  br label %106

; <label>:106                                     ; preds = %74, %71
  ret void
}

; Function Attrs: nounwind uwtable
define i64 @millisecs() #0 {
  %rusage = alloca %struct.rusage, align 8
  %1 = call i32 @getrusage(i32 0, %struct.rusage* %rusage) #4
  %2 = getelementptr inbounds %struct.rusage* %rusage, i32 0, i32 0
  %3 = getelementptr inbounds %struct.timeval* %2, i32 0, i32 0
  %4 = load i64* %3, align 8
  %5 = mul nsw i64 %4, 1000
  %6 = getelementptr inbounds %struct.rusage* %rusage, i32 0, i32 0
  %7 = getelementptr inbounds %struct.timeval* %6, i32 0, i32 1
  %8 = load i64* %7, align 8
  %9 = sdiv i64 %8, 1000
  %10 = add nsw i64 %5, %9
  ret i64 %10
}

; Function Attrs: nounwind
declare i32 @getrusage(i32, %struct.rusage*) #2

; Function Attrs: nounwind uwtable
define i32 @min(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = phi i32 [ %7, %6 ], [ %9, %8 ]
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @max(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = icmp sgt i32 %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = phi i32 [ %7, %6 ], [ %9, %8 ]
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define void @inithistory() #0 {
  %side = alloca i32, align 4
  %i = alloca i32, align 4
  %h = alloca i32, align 4
  store i32 0, i32* %side, align 4
  br label %1

; <label>:1                                       ; preds = %82, %0
  %2 = load i32* %side, align 4
  %3 = icmp slt i32 %2, 2
  br i1 %3, label %4, label %85

; <label>:4                                       ; preds = %1
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %78, %4
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 4
  br i1 %7, label %8, label %81

; <label>:8                                       ; preds = %5
  store i32 0, i32* %h, align 4
  br label %9

; <label>:9                                       ; preds = %74, %8
  %10 = load i32* %h, align 4
  %11 = icmp slt i32 %10, 3
  br i1 %11, label %12, label %77

; <label>:12                                      ; preds = %9
  %13 = load i32* %i, align 4
  %14 = call i32 @min(i32 3, i32 %13)
  %15 = add nsw i32 4, %14
  %16 = load i32* %h, align 4
  %17 = call i32 @min(i32 3, i32 %16)
  %18 = load i32* %i, align 4
  %19 = sub nsw i32 3, %18
  %20 = call i32 @max(i32 0, i32 %19)
  %21 = sub nsw i32 %17, %20
  %22 = call i32 @max(i32 -1, i32 %21)
  %23 = add nsw i32 %15, %22
  %24 = load i32* %i, align 4
  %25 = load i32* %h, align 4
  %26 = call i32 @min(i32 %24, i32 %25)
  %27 = call i32 @min(i32 3, i32 %26)
  %28 = add nsw i32 %23, %27
  %29 = load i32* %h, align 4
  %30 = call i32 @min(i32 3, i32 %29)
  %31 = add nsw i32 %28, %30
  %32 = load i32* %i, align 4
  %33 = sub nsw i32 6, %32
  %34 = mul nsw i32 7, %33
  %35 = load i32* %h, align 4
  %36 = add nsw i32 %34, %35
  %37 = sext i32 %36 to i64
  %38 = load i32* %side, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %39
  %41 = getelementptr inbounds [49 x i32]* %40, i32 0, i64 %37
  store i32 %31, i32* %41, align 4
  %42 = load i32* %i, align 4
  %43 = mul nsw i32 7, %42
  %44 = add nsw i32 %43, 6
  %45 = sub nsw i32 %44, 1
  %46 = load i32* %h, align 4
  %47 = sub nsw i32 %45, %46
  %48 = sext i32 %47 to i64
  %49 = load i32* %side, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %50
  %52 = getelementptr inbounds [49 x i32]* %51, i32 0, i64 %48
  store i32 %31, i32* %52, align 4
  %53 = load i32* %i, align 4
  %54 = sub nsw i32 6, %53
  %55 = mul nsw i32 7, %54
  %56 = add nsw i32 %55, 6
  %57 = sub nsw i32 %56, 1
  %58 = load i32* %h, align 4
  %59 = sub nsw i32 %57, %58
  %60 = sext i32 %59 to i64
  %61 = load i32* %side, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %62
  %64 = getelementptr inbounds [49 x i32]* %63, i32 0, i64 %60
  store i32 %31, i32* %64, align 4
  %65 = load i32* %i, align 4
  %66 = mul nsw i32 7, %65
  %67 = load i32* %h, align 4
  %68 = add nsw i32 %66, %67
  %69 = sext i32 %68 to i64
  %70 = load i32* %side, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %71
  %73 = getelementptr inbounds [49 x i32]* %72, i32 0, i64 %69
  store i32 %31, i32* %73, align 4
  br label %74

; <label>:74                                      ; preds = %12
  %75 = load i32* %h, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %h, align 4
  br label %9

; <label>:77                                      ; preds = %9
  br label %78

; <label>:78                                      ; preds = %77
  %79 = load i32* %i, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %i, align 4
  br label %5

; <label>:81                                      ; preds = %5
  br label %82

; <label>:82                                      ; preds = %81
  %83 = load i32* %side, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %side, align 4
  br label %1

; <label>:85                                      ; preds = %1
  ret void
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
  store i32 %beta, i32* %3, align 4
  %4 = load i64* @nodes, align 8
  %5 = add i64 %4, 1
  store i64 %5, i64* @nodes, align 8
  %6 = load i32* @nplies, align 4
  %7 = icmp eq i32 %6, 41
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  store i32 3, i32* %1
  br label %334

; <label>:9                                       ; preds = %0
  %10 = load i32* @nplies, align 4
  %11 = and i32 %10, 1
  store i32 %11, i32* %side, align 4
  %12 = xor i32 %11, 1
  store i32 %12, i32* %otherside, align 4
  %13 = load i32* %otherside, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %14
  %16 = load i64* %15, align 8
  store i64 %16, i64* %other, align 8
  store i32 0, i32* %nav, align 4
  store i32 0, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %87, %9
  %18 = load i32* %i, align 4
  %19 = icmp slt i32 %18, 7
  br i1 %19, label %20, label %90

; <label>:20                                      ; preds = %17
  %21 = load i64* %other, align 8
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %23
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = zext i32 %26 to i64
  %28 = shl i64 1, %27
  %29 = or i64 %21, %28
  store i64 %29, i64* %newbrd, align 8
  %30 = load i64* %newbrd, align 8
  %31 = call i32 @islegal(i64 %30)
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %34, label %33

; <label>:33                                      ; preds = %20
  br label %87

; <label>:34                                      ; preds = %20
  %35 = load i64* %other, align 8
  %36 = load i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %37
  %39 = load i8* %38, align 1
  %40 = sext i8 %39 to i32
  %41 = zext i32 %40 to i64
  %42 = shl i64 2, %41
  %43 = or i64 %35, %42
  %44 = call i32 @islegalhaswon(i64 %43)
  store i32 %44, i32* %winontop, align 4
  %45 = load i64* %newbrd, align 8
  %46 = call i64 @haswon(i64 %45)
  %47 = icmp ne i64 %46, 0
  br i1 %47, label %48, label %77

; <label>:48                                      ; preds = %34
  %49 = load i32* %winontop, align 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %48
  store i32 1, i32* %1
  br label %334

; <label>:52                                      ; preds = %48
  store i32 0, i32* %nav, align 4
  %53 = load i32* %i, align 4
  %54 = load i32* %nav, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %nav, align 4
  %56 = sext i32 %54 to i64
  %57 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %56
  store i32 %53, i32* %57, align 4
  br label %58

; <label>:58                                      ; preds = %75, %52
  %59 = load i32* %i, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %i, align 4
  %61 = icmp slt i32 %60, 7
  br i1 %61, label %62, label %76

; <label>:62                                      ; preds = %58
  %63 = load i64* %other, align 8
  %64 = load i32* %i, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %65
  %67 = load i8* %66, align 1
  %68 = sext i8 %67 to i32
  %69 = zext i32 %68 to i64
  %70 = shl i64 1, %69
  %71 = or i64 %63, %70
  %72 = call i32 @islegalhaswon(i64 %71)
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %62
  store i32 1, i32* %1
  br label %334

; <label>:75                                      ; preds = %62
  br label %58

; <label>:76                                      ; preds = %58
  br label %90

; <label>:77                                      ; preds = %34
  %78 = load i32* %winontop, align 4
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %86, label %80

; <label>:80                                      ; preds = %77
  %81 = load i32* %i, align 4
  %82 = load i32* %nav, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %nav, align 4
  %84 = sext i32 %82 to i64
  %85 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %84
  store i32 %81, i32* %85, align 4
  br label %86

; <label>:86                                      ; preds = %80, %77
  br label %87

; <label>:87                                      ; preds = %86, %33
  %88 = load i32* %i, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %i, align 4
  br label %17

; <label>:90                                      ; preds = %76, %17
  %91 = load i32* %nav, align 4
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %93, label %94

; <label>:93                                      ; preds = %90
  store i32 1, i32* %1
  br label %334

; <label>:94                                      ; preds = %90
  %95 = load i32* @nplies, align 4
  %96 = icmp eq i32 %95, 40
  br i1 %96, label %97, label %98

; <label>:97                                      ; preds = %94
  store i32 3, i32* %1
  br label %334

; <label>:98                                      ; preds = %94
  %99 = load i32* %nav, align 4
  %100 = icmp eq i32 %99, 1
  br i1 %100, label %101, label %111

; <label>:101                                     ; preds = %98
  %102 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 0
  %103 = load i32* %102, align 4
  call void @makemove(i32 %103)
  %104 = load i32* %3, align 4
  %105 = sub nsw i32 6, %104
  %106 = load i32* %2, align 4
  %107 = sub nsw i32 6, %106
  %108 = call i32 @ab(i32 %105, i32 %107)
  %109 = sub nsw i32 6, %108
  store i32 %109, i32* %score, align 4
  call void @backmove()
  %110 = load i32* %score, align 4
  store i32 %110, i32* %1
  br label %334

; <label>:111                                     ; preds = %98
  %112 = call i32 @transpose()
  store i32 %112, i32* %ttscore, align 4
  %113 = load i32* %ttscore, align 4
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %137

; <label>:115                                     ; preds = %111
  %116 = load i32* %ttscore, align 4
  %117 = icmp eq i32 %116, 2
  br i1 %117, label %118, label %124

; <label>:118                                     ; preds = %115
  store i32 3, i32* %3, align 4
  %119 = load i32* %2, align 4
  %120 = icmp sle i32 3, %119
  br i1 %120, label %121, label %123

; <label>:121                                     ; preds = %118
  %122 = load i32* %ttscore, align 4
  store i32 %122, i32* %1
  br label %334

; <label>:123                                     ; preds = %118
  br label %136

; <label>:124                                     ; preds = %115
  %125 = load i32* %ttscore, align 4
  %126 = icmp eq i32 %125, 4
  br i1 %126, label %127, label %133

; <label>:127                                     ; preds = %124
  store i32 3, i32* %2, align 4
  %128 = load i32* %3, align 4
  %129 = icmp sge i32 3, %128
  br i1 %129, label %130, label %132

; <label>:130                                     ; preds = %127
  %131 = load i32* %ttscore, align 4
  store i32 %131, i32* %1
  br label %334

; <label>:132                                     ; preds = %127
  br label %135

; <label>:133                                     ; preds = %124
  %134 = load i32* %ttscore, align 4
  store i32 %134, i32* %1
  br label %334

; <label>:135                                     ; preds = %132
  br label %136

; <label>:136                                     ; preds = %135, %123
  br label %137

; <label>:137                                     ; preds = %136, %111
  %138 = load i32* @htindex, align 4
  store i32 %138, i32* %hashindx, align 4
  %139 = load i32* @lock, align 4
  store i32 %139, i32* %hashlock, align 4
  %140 = load i64* @posed, align 8
  store i64 %140, i64* %poscnt, align 8
  store i32 0, i32* %besti, align 4
  store i32 1, i32* %score, align 4
  store i32 0, i32* %i, align 4
  br label %141

; <label>:141                                     ; preds = %295, %137
  %142 = load i32* %i, align 4
  %143 = load i32* %nav, align 4
  %144 = icmp slt i32 %142, %143
  br i1 %144, label %145, label %298

; <label>:145                                     ; preds = %141
  %146 = load i32* %i, align 4
  store i32 %146, i32* %l, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %147
  %149 = load i32* %148, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %150
  %152 = load i8* %151, align 1
  %153 = sext i8 %152 to i32
  %154 = sext i32 %153 to i64
  %155 = load i32* %side, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %156
  %158 = getelementptr inbounds [49 x i32]* %157, i32 0, i64 %154
  %159 = load i32* %158, align 4
  store i32 %159, i32* %val, align 4
  %160 = load i32* %i, align 4
  %161 = add nsw i32 %160, 1
  store i32 %161, i32* %j, align 4
  br label %162

; <label>:162                                     ; preds = %188, %145
  %163 = load i32* %j, align 4
  %164 = load i32* %nav, align 4
  %165 = icmp slt i32 %163, %164
  br i1 %165, label %166, label %191

; <label>:166                                     ; preds = %162
  %167 = load i32* %j, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %168
  %170 = load i32* %169, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %171
  %173 = load i8* %172, align 1
  %174 = sext i8 %173 to i32
  %175 = sext i32 %174 to i64
  %176 = load i32* %side, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %177
  %179 = getelementptr inbounds [49 x i32]* %178, i32 0, i64 %175
  %180 = load i32* %179, align 4
  store i32 %180, i32* %v, align 4
  %181 = load i32* %v, align 4
  %182 = load i32* %val, align 4
  %183 = icmp sgt i32 %181, %182
  br i1 %183, label %184, label %187

; <label>:184                                     ; preds = %166
  %185 = load i32* %v, align 4
  store i32 %185, i32* %val, align 4
  %186 = load i32* %j, align 4
  store i32 %186, i32* %l, align 4
  br label %187

; <label>:187                                     ; preds = %184, %166
  br label %188

; <label>:188                                     ; preds = %187
  %189 = load i32* %j, align 4
  %190 = add nsw i32 %189, 1
  store i32 %190, i32* %j, align 4
  br label %162

; <label>:191                                     ; preds = %162
  %192 = load i32* %l, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %193
  %195 = load i32* %194, align 4
  store i32 %195, i32* %j, align 4
  br label %196

; <label>:196                                     ; preds = %209, %191
  %197 = load i32* %l, align 4
  %198 = load i32* %i, align 4
  %199 = icmp sgt i32 %197, %198
  br i1 %199, label %200, label %212

; <label>:200                                     ; preds = %196
  %201 = load i32* %l, align 4
  %202 = sub nsw i32 %201, 1
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %203
  %205 = load i32* %204, align 4
  %206 = load i32* %l, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %207
  store i32 %205, i32* %208, align 4
  br label %209

; <label>:209                                     ; preds = %200
  %210 = load i32* %l, align 4
  %211 = add nsw i32 %210, -1
  store i32 %211, i32* %l, align 4
  br label %196

; <label>:212                                     ; preds = %196
  %213 = load i32* %j, align 4
  %214 = load i32* %i, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %215
  store i32 %213, i32* %216, align 4
  call void @makemove(i32 %213)
  %217 = load i32* %3, align 4
  %218 = sub nsw i32 6, %217
  %219 = load i32* %2, align 4
  %220 = sub nsw i32 6, %219
  %221 = call i32 @ab(i32 %218, i32 %220)
  %222 = sub nsw i32 6, %221
  store i32 %222, i32* %val, align 4
  call void @backmove()
  %223 = load i32* %val, align 4
  %224 = load i32* %score, align 4
  %225 = icmp sgt i32 %223, %224
  br i1 %225, label %226, label %294

; <label>:226                                     ; preds = %212
  %227 = load i32* %i, align 4
  store i32 %227, i32* %besti, align 4
  %228 = load i32* %val, align 4
  store i32 %228, i32* %score, align 4
  %229 = load i32* %2, align 4
  %230 = icmp sgt i32 %228, %229
  br i1 %230, label %231, label %293

; <label>:231                                     ; preds = %226
  %232 = load i32* @nplies, align 4
  %233 = load i32* @bookply, align 4
  %234 = icmp sge i32 %232, %233
  br i1 %234, label %235, label %293

; <label>:235                                     ; preds = %231
  %236 = load i32* %val, align 4
  store i32 %236, i32* %2, align 4
  %237 = load i32* %3, align 4
  %238 = icmp sge i32 %236, %237
  br i1 %238, label %239, label %293

; <label>:239                                     ; preds = %235
  %240 = load i32* %score, align 4
  %241 = icmp eq i32 %240, 3
  br i1 %241, label %242, label %248

; <label>:242                                     ; preds = %239
  %243 = load i32* %i, align 4
  %244 = load i32* %nav, align 4
  %245 = sub nsw i32 %244, 1
  %246 = icmp slt i32 %243, %245
  br i1 %246, label %247, label %248

; <label>:247                                     ; preds = %242
  store i32 4, i32* %score, align 4
  br label %248

; <label>:248                                     ; preds = %247, %242, %239
  %249 = load i32* %besti, align 4
  %250 = icmp sgt i32 %249, 0
  br i1 %250, label %251, label %292

; <label>:251                                     ; preds = %248
  store i32 0, i32* %i, align 4
  br label %252

; <label>:252                                     ; preds = %272, %251
  %253 = load i32* %i, align 4
  %254 = load i32* %besti, align 4
  %255 = icmp slt i32 %253, %254
  br i1 %255, label %256, label %275

; <label>:256                                     ; preds = %252
  %257 = load i32* %i, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %258
  %260 = load i32* %259, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %261
  %263 = load i8* %262, align 1
  %264 = sext i8 %263 to i32
  %265 = sext i32 %264 to i64
  %266 = load i32* %side, align 4
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %267
  %269 = getelementptr inbounds [49 x i32]* %268, i32 0, i64 %265
  %270 = load i32* %269, align 4
  %271 = add nsw i32 %270, -1
  store i32 %271, i32* %269, align 4
  br label %272

; <label>:272                                     ; preds = %256
  %273 = load i32* %i, align 4
  %274 = add nsw i32 %273, 1
  store i32 %274, i32* %i, align 4
  br label %252

; <label>:275                                     ; preds = %252
  %276 = load i32* %besti, align 4
  %277 = load i32* %besti, align 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %278
  %280 = load i32* %279, align 4
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %281
  %283 = load i8* %282, align 1
  %284 = sext i8 %283 to i32
  %285 = sext i32 %284 to i64
  %286 = load i32* %side, align 4
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %287
  %289 = getelementptr inbounds [49 x i32]* %288, i32 0, i64 %285
  %290 = load i32* %289, align 4
  %291 = add nsw i32 %290, %276
  store i32 %291, i32* %289, align 4
  br label %292

; <label>:292                                     ; preds = %275, %248
  br label %298

; <label>:293                                     ; preds = %235, %231, %226
  br label %294

; <label>:294                                     ; preds = %293, %212
  br label %295

; <label>:295                                     ; preds = %294
  %296 = load i32* %i, align 4
  %297 = add nsw i32 %296, 1
  store i32 %297, i32* %i, align 4
  br label %141

; <label>:298                                     ; preds = %292, %141
  %299 = load i32* %score, align 4
  %300 = load i32* %ttscore, align 4
  %301 = sub nsw i32 6, %300
  %302 = icmp eq i32 %299, %301
  br i1 %302, label %303, label %304

; <label>:303                                     ; preds = %298
  store i32 3, i32* %score, align 4
  br label %304

; <label>:304                                     ; preds = %303, %298
  %305 = load i64* @posed, align 8
  %306 = load i64* %poscnt, align 8
  %307 = sub i64 %305, %306
  store i64 %307, i64* %poscnt, align 8
  store i32 0, i32* %work, align 4
  br label %308

; <label>:308                                     ; preds = %313, %304
  %309 = load i64* %poscnt, align 8
  %310 = lshr i64 %309, 1
  store i64 %310, i64* %poscnt, align 8
  %311 = icmp ne i64 %310, 0
  br i1 %311, label %312, label %316

; <label>:312                                     ; preds = %308
  br label %313

; <label>:313                                     ; preds = %312
  %314 = load i32* %work, align 4
  %315 = add nsw i32 %314, 1
  store i32 %315, i32* %work, align 4
  br label %308

; <label>:316                                     ; preds = %308
  %317 = load i32* %hashindx, align 4
  %318 = load i32* %hashlock, align 4
  %319 = load i32* %score, align 4
  %320 = load i32* %work, align 4
  call void @transtore(i32 %317, i32 %318, i32 %319, i32 %320)
  %321 = load i32* @nplies, align 4
  %322 = load i32* @reportply, align 4
  %323 = icmp sle i32 %321, %322
  br i1 %323, label %324, label %332

; <label>:324                                     ; preds = %316
  call void @printMoves()
  %325 = load i32* %score, align 4
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds [7 x i8]* @.str4, i32 0, i64 %326
  %328 = load i8* %327, align 1
  %329 = sext i8 %328 to i32
  %330 = load i32* %work, align 4
  %331 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0), i32 %329, i32 %330)
  br label %332

; <label>:332                                     ; preds = %324, %316
  %333 = load i32* %score, align 4
  store i32 %333, i32* %1
  br label %334

; <label>:334                                     ; preds = %332, %133, %130, %121, %101, %97, %93, %74, %51, %8
  %335 = load i32* %1
  ret i32 %335
}

; Function Attrs: nounwind uwtable
define i32 @solve() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %side = alloca i32, align 4
  %otherside = alloca i32, align 4
  %score = alloca i32, align 4
  %2 = load i32* @nplies, align 4
  %3 = and i32 %2, 1
  store i32 %3, i32* %side, align 4
  %4 = load i32* %side, align 4
  %5 = xor i32 %4, 1
  store i32 %5, i32* %otherside, align 4
  store i64 0, i64* @nodes, align 8
  store i64 1, i64* @msecs, align 8
  %6 = load i32* %otherside, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %7
  %9 = load i64* %8, align 8
  %10 = call i64 @haswon(i64 %9)
  %11 = icmp ne i64 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  store i32 1, i32* %1
  br label %49

; <label>:13                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %34, %13
  %15 = load i32* %i, align 4
  %16 = icmp slt i32 %15, 7
  br i1 %16, label %17, label %37

; <label>:17                                      ; preds = %14
  %18 = load i32* %side, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %19
  %21 = load i64* %20, align 8
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %23
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = zext i32 %26 to i64
  %28 = shl i64 1, %27
  %29 = or i64 %21, %28
  %30 = call i32 @islegalhaswon(i64 %29)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %17
  store i32 5, i32* %1
  br label %49

; <label>:33                                      ; preds = %17
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i32* %i, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %i, align 4
  br label %14

; <label>:37                                      ; preds = %14
  call void @inithistory()
  %38 = load i32* @nplies, align 4
  %39 = add nsw i32 %38, 2
  store i32 %39, i32* @reportply, align 4
  %40 = load i32* @nplies, align 4
  %41 = add nsw i32 %40, 0
  store i32 %41, i32* @bookply, align 4
  %42 = call i64 @millisecs()
  store i64 %42, i64* @msecs, align 8
  %43 = call i32 @ab(i32 1, i32 5)
  store i32 %43, i32* %score, align 4
  %44 = call i64 @millisecs()
  %45 = add i64 1, %44
  %46 = load i64* @msecs, align 8
  %47 = sub i64 %45, %46
  store i64 %47, i64* @msecs, align 8
  %48 = load i32* %score, align 4
  store i32 %48, i32* %1
  br label %49

; <label>:49                                      ; preds = %37, %32, %12
  %50 = load i32* %1
  ret i32 %50
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %c = alloca i32, align 4
  %result = alloca i32, align 4
  %work = alloca i32, align 4
  %poscnt = alloca i64, align 8
  store i32 0, i32* %1
  call void @trans_init()
  %2 = call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0))
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str6, i32 0, i32 0), i32 7, i32 6)
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([51 x i8]* @.str7, i32 0, i32 0), i32 8306069, i64 8)
  br label %5

; <label>:5                                       ; preds = %42, %0
  call void @reset()
  br label %6

; <label>:6                                       ; preds = %23, %5
  %7 = call i32 @getchar()
  store i32 %7, i32* %c, align 4
  %8 = icmp ne i32 %7, -1
  br i1 %8, label %9, label %24

; <label>:9                                       ; preds = %6
  %10 = load i32* %c, align 4
  %11 = icmp sge i32 %10, 49
  br i1 %11, label %12, label %18

; <label>:12                                      ; preds = %9
  %13 = load i32* %c, align 4
  %14 = icmp sle i32 %13, 55
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %12
  %16 = load i32* %c, align 4
  %17 = sub nsw i32 %16, 49
  call void @makemove(i32 %17)
  br label %23

; <label>:18                                      ; preds = %12, %9
  %19 = load i32* %c, align 4
  %20 = icmp eq i32 %19, 10
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  br label %24

; <label>:22                                      ; preds = %18
  br label %23

; <label>:23                                      ; preds = %22, %15
  br label %6

; <label>:24                                      ; preds = %21, %6
  %25 = load i32* %c, align 4
  %26 = icmp eq i32 %25, -1
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %24
  br label %59

; <label>:28                                      ; preds = %24
  %29 = load i32* @nplies, align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), i32 %29)
  call void @printMoves()
  %31 = call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @.str9, i32 0, i32 0))
  call void @emptyTT()
  %32 = call i32 @solve()
  store i32 %32, i32* %result, align 4
  %33 = load i64* @posed, align 8
  store i64 %33, i64* %poscnt, align 8
  store i32 0, i32* %work, align 4
  br label %34

; <label>:34                                      ; preds = %39, %28
  %35 = load i64* %poscnt, align 8
  %36 = lshr i64 %35, 1
  store i64 %36, i64* %poscnt, align 8
  %37 = icmp ne i64 %36, 0
  br i1 %37, label %38, label %42

; <label>:38                                      ; preds = %34
  br label %39

; <label>:39                                      ; preds = %38
  %40 = load i32* %work, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %work, align 4
  br label %34

; <label>:42                                      ; preds = %34
  %43 = load i32* %result, align 4
  %44 = load i32* %result, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [7 x i8]* @.str4, i32 0, i64 %45
  %47 = load i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = load i32* %work, align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i32 0, i32 0), i32 %43, i32 %48, i32 %49)
  %51 = load i64* @nodes, align 8
  %52 = load i64* @msecs, align 8
  %53 = load i64* @nodes, align 8
  %54 = uitofp i64 %53 to double
  %55 = load i64* @msecs, align 8
  %56 = uitofp i64 %55 to double
  %57 = fdiv double %54, %56
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str11, i32 0, i32 0), i64 %51, i64 %52, double %57)
  call void @htstat()
  br label %5

; <label>:59                                      ; preds = %27
  ret i32 0
}

declare i32 @puts(i8*) #1

declare i32 @getchar() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
