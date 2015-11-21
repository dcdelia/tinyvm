; ModuleID = 'SearchGame.ll'
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
  store i32 0, i32* @nplies, align 4
  store i64 0, i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 1), align 8
  store i64 0, i64* getelementptr inbounds ([2 x i64]* @color, i32 0, i64 0), align 8
  br label %1

; <label>:1                                       ; preds = %8, %0
  %i.0 = phi i32 [ 0, %0 ], [ %9, %8 ]
  %2 = icmp slt i32 %i.0, 7
  br i1 %2, label %3, label %10

; <label>:3                                       ; preds = %1
  %4 = mul nsw i32 7, %i.0
  %5 = trunc i32 %4 to i8
  %6 = sext i32 %i.0 to i64
  %7 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %6
  store i8 %5, i8* %7, align 1
  br label %8

; <label>:8                                       ; preds = %3
  %9 = add nsw i32 %i.0, 1
  br label %1

; <label>:10                                      ; preds = %1
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
  br label %1

; <label>:1                                       ; preds = %10, %0
  %i.0 = phi i32 [ 0, %0 ], [ %11, %10 ]
  %2 = load i32* @nplies, align 4
  %3 = icmp slt i32 %i.0, %2
  br i1 %3, label %4, label %12

; <label>:4                                       ; preds = %1
  %5 = sext i32 %i.0 to i64
  %6 = getelementptr inbounds [42 x i32]* @moves, i32 0, i64 %5
  %7 = load i32* %6, align 4
  %8 = add nsw i32 1, %7
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %8)
  br label %10

; <label>:10                                      ; preds = %4
  %11 = add nsw i32 %i.0, 1
  br label %1

; <label>:12                                      ; preds = %1
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @islegal(i64 %newboard) #0 {
  %1 = and i64 %newboard, 283691315109952
  %2 = icmp eq i64 %1, 0
  %3 = zext i1 %2 to i32
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @isplayable(i32 %col) #0 {
  %1 = load i32* @nplies, align 4
  %2 = and i32 %1, 1
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %3
  %5 = load i64* %4, align 8
  %6 = sext i32 %col to i64
  %7 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %6
  %8 = load i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = zext i32 %9 to i64
  %11 = shl i64 1, %10
  %12 = or i64 %5, %11
  %13 = call i32 @islegal(i64 %12)
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i64 @haswon(i64 %newboard) #0 {
  %1 = lshr i64 %newboard, 6
  %2 = and i64 %newboard, %1
  %3 = lshr i64 %newboard, 7
  %4 = and i64 %newboard, %3
  %5 = lshr i64 %newboard, 8
  %6 = and i64 %newboard, %5
  %7 = lshr i64 %newboard, 1
  %8 = and i64 %newboard, %7
  %9 = lshr i64 %2, 12
  %10 = and i64 %2, %9
  %11 = lshr i64 %4, 14
  %12 = and i64 %4, %11
  %13 = or i64 %10, %12
  %14 = lshr i64 %6, 16
  %15 = and i64 %6, %14
  %16 = or i64 %13, %15
  %17 = lshr i64 %8, 2
  %18 = and i64 %8, %17
  %19 = or i64 %16, %18
  ret i64 %19
}

; Function Attrs: nounwind uwtable
define i32 @islegalhaswon(i64 %newboard) #0 {
  %1 = call i32 @islegal(i64 %newboard)
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %6

; <label>:3                                       ; preds = %0
  %4 = call i64 @haswon(i64 %newboard)
  %5 = icmp ne i64 %4, 0
  br label %6

; <label>:6                                       ; preds = %3, %0
  %7 = phi i1 [ false, %0 ], [ %5, %3 ]
  %8 = zext i1 %7 to i32
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define void @backmove() #0 {
  %1 = load i32* @nplies, align 4
  %2 = add nsw i32 %1, -1
  store i32 %2, i32* @nplies, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [42 x i32]* @moves, i32 0, i64 %3
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %6
  %8 = load i8* %7, align 1
  %9 = add i8 %8, -1
  store i8 %9, i8* %7, align 1
  %10 = sext i8 %9 to i32
  %11 = zext i32 %10 to i64
  %12 = shl i64 1, %11
  %13 = load i32* @nplies, align 4
  %14 = and i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %15
  %17 = load i64* %16, align 8
  %18 = xor i64 %17, %12
  store i64 %18, i64* %16, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @makemove(i32 %n) #0 {
  %1 = sext i32 %n to i64
  %2 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = add i8 %3, 1
  store i8 %4, i8* %2, align 1
  %5 = sext i8 %3 to i32
  %6 = zext i32 %5 to i64
  %7 = shl i64 1, %6
  %8 = load i32* @nplies, align 4
  %9 = and i32 %8, 1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %10
  %12 = load i64* %11, align 8
  %13 = xor i64 %12, %7
  store i64 %13, i64* %11, align 8
  %14 = load i32* @nplies, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* @nplies, align 4
  %16 = sext i32 %14 to i64
  %17 = getelementptr inbounds [42 x i32]* @moves, i32 0, i64 %16
  store i32 %n, i32* %17, align 4
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
  %1 = alloca %struct.hashentry, align 4
  br label %2

; <label>:2                                       ; preds = %25, %0
  %i.0 = phi i32 [ 0, %0 ], [ %26, %25 ]
  %3 = icmp slt i32 %i.0, 8306069
  br i1 %3, label %4, label %27

; <label>:4                                       ; preds = %2
  %5 = sext i32 %i.0 to i64
  %6 = load %struct.hashentry** @ht, align 8
  %7 = getelementptr inbounds %struct.hashentry* %6, i64 %5
  %8 = bitcast %struct.hashentry* %1 to i64*
  %9 = load i64* %8, align 4
  %10 = and i64 %9, -67108864
  store i64 %10, i64* %8, align 4
  %11 = bitcast %struct.hashentry* %1 to i64*
  %12 = load i64* %11, align 4
  %13 = and i64 %12, -4227858433
  store i64 %13, i64* %11, align 4
  %14 = bitcast %struct.hashentry* %1 to i64*
  %15 = load i64* %14, align 4
  %16 = and i64 %15, -288230371856744449
  store i64 %16, i64* %14, align 4
  %17 = bitcast %struct.hashentry* %1 to i64*
  %18 = load i64* %17, align 4
  %19 = and i64 %18, -2017612633061982209
  store i64 %19, i64* %17, align 4
  %20 = bitcast %struct.hashentry* %1 to i64*
  %21 = load i64* %20, align 4
  %22 = and i64 %21, 2305843009213693951
  store i64 %22, i64* %20, align 4
  %23 = bitcast %struct.hashentry* %7 to i8*
  %24 = bitcast %struct.hashentry* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %24, i64 8, i32 4, i1 false)
  br label %25

; <label>:25                                      ; preds = %4
  %26 = add nsw i32 %i.0, 1
  br label %2

; <label>:27                                      ; preds = %2
  store i64 0, i64* @posed, align 8
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define void @hash() #0 {
  %1 = call i64 @positioncode()
  %2 = load i32* @nplies, align 4
  %3 = icmp slt i32 %2, 10
  br i1 %3, label %4, label %17

; <label>:4                                       ; preds = %0
  br label %5

; <label>:5                                       ; preds = %11, %4
  %htemp2.0 = phi i64 [ 0, %4 ], [ %10, %11 ]
  %htmp.0 = phi i64 [ %1, %4 ], [ %12, %11 ]
  %6 = icmp ne i64 %htmp.0, 0
  br i1 %6, label %7, label %13

; <label>:7                                       ; preds = %5
  %8 = shl i64 %htemp2.0, 7
  %9 = and i64 %htmp.0, 127
  %10 = or i64 %8, %9
  br label %11

; <label>:11                                      ; preds = %7
  %12 = lshr i64 %htmp.0, 7
  br label %5

; <label>:13                                      ; preds = %5
  %14 = icmp ult i64 %htemp2.0, %1
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %13
  br label %16

; <label>:16                                      ; preds = %15, %13
  %htemp.0 = phi i64 [ %htemp2.0, %15 ], [ %1, %13 ]
  br label %17

; <label>:17                                      ; preds = %16, %0
  %htemp.1 = phi i64 [ %htemp.0, %16 ], [ %1, %0 ]
  %18 = lshr i64 %htemp.1, 23
  %19 = trunc i64 %18 to i32
  store i32 %19, i32* @lock, align 4
  %20 = urem i64 %htemp.1, 8306069
  %21 = trunc i64 %20 to i32
  store i32 %21, i32* @htindex, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @transpose() #0 {
  %he = alloca %struct.hashentry, align 4
  call void @hash()
  %1 = load i32* @htindex, align 4
  %2 = zext i32 %1 to i64
  %3 = load %struct.hashentry** @ht, align 8
  %4 = getelementptr inbounds %struct.hashentry* %3, i64 %2
  %5 = bitcast %struct.hashentry* %he to i8*
  %6 = bitcast %struct.hashentry* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 8, i32 4, i1 false)
  %7 = bitcast %struct.hashentry* %he to i64*
  %8 = load i64* %7, align 4
  %9 = and i64 %8, 67108863
  %10 = trunc i64 %9 to i32
  %11 = load i32* @lock, align 4
  %12 = icmp eq i32 %10, %11
  br i1 %12, label %13, label %18

; <label>:13                                      ; preds = %0
  %14 = bitcast %struct.hashentry* %he to i64*
  %15 = load i64* %14, align 4
  %16 = lshr i64 %15, 61
  %17 = trunc i64 %16 to i32
  br label %33

; <label>:18                                      ; preds = %0
  %19 = bitcast %struct.hashentry* %he to i64*
  %20 = load i64* %19, align 4
  %21 = lshr i64 %20, 32
  %22 = and i64 %21, 67108863
  %23 = trunc i64 %22 to i32
  %24 = load i32* @lock, align 4
  %25 = icmp eq i32 %23, %24
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %18
  %27 = bitcast %struct.hashentry* %he to i64*
  %28 = load i64* %27, align 4
  %29 = lshr i64 %28, 58
  %30 = and i64 %29, 7
  %31 = trunc i64 %30 to i32
  br label %33

; <label>:32                                      ; preds = %18
  br label %33

; <label>:33                                      ; preds = %32, %26, %13
  %.0 = phi i32 [ %17, %13 ], [ %31, %26 ], [ 0, %32 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define void @transtore(i32 %x, i32 %lock, i32 %score, i32 %work) #0 {
  %he = alloca %struct.hashentry, align 4
  %1 = load i64* @posed, align 8
  %2 = add i64 %1, 1
  store i64 %2, i64* @posed, align 8
  %3 = sext i32 %x to i64
  %4 = load %struct.hashentry** @ht, align 8
  %5 = getelementptr inbounds %struct.hashentry* %4, i64 %3
  %6 = bitcast %struct.hashentry* %he to i8*
  %7 = bitcast %struct.hashentry* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 4, i1 false)
  %8 = bitcast %struct.hashentry* %he to i64*
  %9 = load i64* %8, align 4
  %10 = and i64 %9, 67108863
  %11 = trunc i64 %10 to i32
  %12 = icmp eq i32 %11, %lock
  br i1 %12, label %20, label %13

; <label>:13                                      ; preds = %0
  %14 = bitcast %struct.hashentry* %he to i64*
  %15 = load i64* %14, align 4
  %16 = lshr i64 %15, 26
  %17 = and i64 %16, 63
  %18 = trunc i64 %17 to i32
  %19 = icmp sge i32 %work, %18
  br i1 %19, label %20, label %44

; <label>:20                                      ; preds = %13, %0
  %21 = bitcast %struct.hashentry* %he to i64*
  %22 = zext i32 %lock to i64
  %23 = load i64* %21, align 4
  %24 = and i64 %22, 67108863
  %25 = and i64 %23, -67108864
  %26 = or i64 %25, %24
  store i64 %26, i64* %21, align 4
  %27 = trunc i64 %24 to i32
  %28 = bitcast %struct.hashentry* %he to i64*
  %29 = zext i32 %score to i64
  %30 = load i64* %28, align 4
  %31 = and i64 %29, 7
  %32 = shl i64 %31, 61
  %33 = and i64 %30, 2305843009213693951
  %34 = or i64 %33, %32
  store i64 %34, i64* %28, align 4
  %35 = trunc i64 %31 to i32
  %36 = bitcast %struct.hashentry* %he to i64*
  %37 = zext i32 %work to i64
  %38 = load i64* %36, align 4
  %39 = and i64 %37, 63
  %40 = shl i64 %39, 26
  %41 = and i64 %38, -4227858433
  %42 = or i64 %41, %40
  store i64 %42, i64* %36, align 4
  %43 = trunc i64 %39 to i32
  br label %61

; <label>:44                                      ; preds = %13
  %45 = bitcast %struct.hashentry* %he to i64*
  %46 = zext i32 %lock to i64
  %47 = load i64* %45, align 4
  %48 = and i64 %46, 67108863
  %49 = shl i64 %48, 32
  %50 = and i64 %47, -288230371856744449
  %51 = or i64 %50, %49
  store i64 %51, i64* %45, align 4
  %52 = trunc i64 %48 to i32
  %53 = bitcast %struct.hashentry* %he to i64*
  %54 = zext i32 %score to i64
  %55 = load i64* %53, align 4
  %56 = and i64 %54, 7
  %57 = shl i64 %56, 58
  %58 = and i64 %55, -2017612633061982209
  %59 = or i64 %58, %57
  store i64 %59, i64* %53, align 4
  %60 = trunc i64 %56 to i32
  br label %61

; <label>:61                                      ; preds = %44, %20
  %62 = sext i32 %x to i64
  %63 = load %struct.hashentry** @ht, align 8
  %64 = getelementptr inbounds %struct.hashentry* %63, i64 %62
  %65 = bitcast %struct.hashentry* %64 to i8*
  %66 = bitcast %struct.hashentry* %he to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %65, i8* %66, i64 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define void @htstat() #0 {
  %typecnt = alloca [8 x i32], align 16
  %he = alloca %struct.hashentry, align 4
  br label %1

; <label>:1                                       ; preds = %6, %0
  %i.0 = phi i32 [ 0, %0 ], [ %7, %6 ]
  %2 = icmp slt i32 %i.0, 8
  br i1 %2, label %3, label %8

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64
  %5 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %4
  store i32 0, i32* %5, align 4
  br label %6

; <label>:6                                       ; preds = %3
  %7 = add nsw i32 %i.0, 1
  br label %1

; <label>:8                                       ; preds = %1
  br label %9

; <label>:9                                       ; preds = %49, %8
  %i.1 = phi i32 [ 0, %8 ], [ %50, %49 ]
  %10 = icmp slt i32 %i.1, 8306069
  br i1 %10, label %11, label %51

; <label>:11                                      ; preds = %9
  %12 = sext i32 %i.1 to i64
  %13 = load %struct.hashentry** @ht, align 8
  %14 = getelementptr inbounds %struct.hashentry* %13, i64 %12
  %15 = bitcast %struct.hashentry* %he to i8*
  %16 = bitcast %struct.hashentry* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* %16, i64 8, i32 4, i1 false)
  %17 = bitcast %struct.hashentry* %he to i64*
  %18 = load i64* %17, align 4
  %19 = and i64 %18, 67108863
  %20 = trunc i64 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %31

; <label>:22                                      ; preds = %11
  %23 = bitcast %struct.hashentry* %he to i64*
  %24 = load i64* %23, align 4
  %25 = lshr i64 %24, 61
  %26 = trunc i64 %25 to i32
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %27
  %29 = load i32* %28, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %28, align 4
  br label %31

; <label>:31                                      ; preds = %22, %11
  %32 = bitcast %struct.hashentry* %he to i64*
  %33 = load i64* %32, align 4
  %34 = lshr i64 %33, 32
  %35 = and i64 %34, 67108863
  %36 = trunc i64 %35 to i32
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %48

; <label>:38                                      ; preds = %31
  %39 = bitcast %struct.hashentry* %he to i64*
  %40 = load i64* %39, align 4
  %41 = lshr i64 %40, 58
  %42 = and i64 %41, 7
  %43 = trunc i64 %42 to i32
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %44
  %46 = load i32* %45, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %45, align 4
  br label %48

; <label>:48                                      ; preds = %38, %31
  br label %49

; <label>:49                                      ; preds = %48
  %50 = add nsw i32 %i.1, 1
  br label %9

; <label>:51                                      ; preds = %9
  br label %52

; <label>:52                                      ; preds = %59, %51
  %i.2 = phi i32 [ 1, %51 ], [ %60, %59 ]
  %total.0 = phi i32 [ 0, %51 ], [ %58, %59 ]
  %53 = icmp sle i32 %i.2, 5
  br i1 %53, label %54, label %61

; <label>:54                                      ; preds = %52
  %55 = sext i32 %i.2 to i64
  %56 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 %55
  %57 = load i32* %56, align 4
  %58 = add nsw i32 %total.0, %57
  br label %59

; <label>:59                                      ; preds = %54
  %60 = add nsw i32 %i.2, 1
  br label %52

; <label>:61                                      ; preds = %52
  %62 = icmp sgt i32 %total.0, 0
  br i1 %62, label %63, label %90

; <label>:63                                      ; preds = %61
  %64 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 1
  %65 = load i32* %64, align 4
  %66 = sitofp i32 %65 to double
  %67 = sitofp i32 %total.0 to double
  %68 = fdiv double %66, %67
  %69 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 2
  %70 = load i32* %69, align 4
  %71 = sitofp i32 %70 to double
  %72 = sitofp i32 %total.0 to double
  %73 = fdiv double %71, %72
  %74 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 3
  %75 = load i32* %74, align 4
  %76 = sitofp i32 %75 to double
  %77 = sitofp i32 %total.0 to double
  %78 = fdiv double %76, %77
  %79 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 4
  %80 = load i32* %79, align 4
  %81 = sitofp i32 %80 to double
  %82 = sitofp i32 %total.0 to double
  %83 = fdiv double %81, %82
  %84 = getelementptr inbounds [8 x i32]* %typecnt, i32 0, i64 5
  %85 = load i32* %84, align 4
  %86 = sitofp i32 %85 to double
  %87 = sitofp i32 %total.0 to double
  %88 = fdiv double %86, %87
  %89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str2, i32 0, i32 0), double %68, double %73, double %78, double %83, double %88)
  br label %90

; <label>:90                                      ; preds = %63, %61
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
  %1 = icmp slt i32 %x, %y
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %4

; <label>:3                                       ; preds = %0
  br label %4

; <label>:4                                       ; preds = %3, %2
  %5 = phi i32 [ %x, %2 ], [ %y, %3 ]
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @max(i32 %x, i32 %y) #0 {
  %1 = icmp sgt i32 %x, %y
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %4

; <label>:3                                       ; preds = %0
  br label %4

; <label>:4                                       ; preds = %3, %2
  %5 = phi i32 [ %x, %2 ], [ %y, %3 ]
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define void @inithistory() #0 {
  br label %1

; <label>:1                                       ; preds = %59, %0
  %side.0 = phi i32 [ 0, %0 ], [ %60, %59 ]
  %2 = icmp slt i32 %side.0, 2
  br i1 %2, label %3, label %61

; <label>:3                                       ; preds = %1
  br label %4

; <label>:4                                       ; preds = %56, %3
  %i.0 = phi i32 [ 0, %3 ], [ %57, %56 ]
  %5 = icmp slt i32 %i.0, 4
  br i1 %5, label %6, label %58

; <label>:6                                       ; preds = %4
  br label %7

; <label>:7                                       ; preds = %53, %6
  %h.0 = phi i32 [ 0, %6 ], [ %54, %53 ]
  %8 = icmp slt i32 %h.0, 3
  br i1 %8, label %9, label %55

; <label>:9                                       ; preds = %7
  %10 = call i32 @min(i32 3, i32 %i.0)
  %11 = add nsw i32 4, %10
  %12 = call i32 @min(i32 3, i32 %h.0)
  %13 = sub nsw i32 3, %i.0
  %14 = call i32 @max(i32 0, i32 %13)
  %15 = sub nsw i32 %12, %14
  %16 = call i32 @max(i32 -1, i32 %15)
  %17 = add nsw i32 %11, %16
  %18 = call i32 @min(i32 %i.0, i32 %h.0)
  %19 = call i32 @min(i32 3, i32 %18)
  %20 = add nsw i32 %17, %19
  %21 = call i32 @min(i32 3, i32 %h.0)
  %22 = add nsw i32 %20, %21
  %23 = sub nsw i32 6, %i.0
  %24 = mul nsw i32 7, %23
  %25 = add nsw i32 %24, %h.0
  %26 = sext i32 %25 to i64
  %27 = sext i32 %side.0 to i64
  %28 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %27
  %29 = getelementptr inbounds [49 x i32]* %28, i32 0, i64 %26
  store i32 %22, i32* %29, align 4
  %30 = mul nsw i32 7, %i.0
  %31 = add nsw i32 %30, 6
  %32 = sub nsw i32 %31, 1
  %33 = sub nsw i32 %32, %h.0
  %34 = sext i32 %33 to i64
  %35 = sext i32 %side.0 to i64
  %36 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %35
  %37 = getelementptr inbounds [49 x i32]* %36, i32 0, i64 %34
  store i32 %22, i32* %37, align 4
  %38 = sub nsw i32 6, %i.0
  %39 = mul nsw i32 7, %38
  %40 = add nsw i32 %39, 6
  %41 = sub nsw i32 %40, 1
  %42 = sub nsw i32 %41, %h.0
  %43 = sext i32 %42 to i64
  %44 = sext i32 %side.0 to i64
  %45 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %44
  %46 = getelementptr inbounds [49 x i32]* %45, i32 0, i64 %43
  store i32 %22, i32* %46, align 4
  %47 = mul nsw i32 7, %i.0
  %48 = add nsw i32 %47, %h.0
  %49 = sext i32 %48 to i64
  %50 = sext i32 %side.0 to i64
  %51 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %50
  %52 = getelementptr inbounds [49 x i32]* %51, i32 0, i64 %49
  store i32 %22, i32* %52, align 4
  br label %53

; <label>:53                                      ; preds = %9
  %54 = add nsw i32 %h.0, 1
  br label %7

; <label>:55                                      ; preds = %7
  br label %56

; <label>:56                                      ; preds = %55
  %57 = add nsw i32 %i.0, 1
  br label %4

; <label>:58                                      ; preds = %4
  br label %59

; <label>:59                                      ; preds = %58
  %60 = add nsw i32 %side.0, 1
  br label %1

; <label>:61                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @ab(i32 %alpha, i32 %beta) #0 {
  %av = alloca [7 x i32], align 16
  %1 = load i64* @nodes, align 8
  %2 = add i64 %1, 1
  store i64 %2, i64* @nodes, align 8
  %3 = load i32* @nplies, align 4
  %4 = icmp eq i32 %3, 41
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %244

; <label>:6                                       ; preds = %0
  %7 = load i32* @nplies, align 4
  %8 = and i32 %7, 1
  %9 = xor i32 %8, 1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %10
  %12 = load i64* %11, align 8
  br label %13

; <label>:13                                      ; preds = %67, %6
  %nav.0 = phi i32 [ 0, %6 ], [ %nav.2, %67 ]
  %i.0 = phi i32 [ 0, %6 ], [ %68, %67 ]
  %14 = icmp slt i32 %i.0, 7
  br i1 %14, label %15, label %69

; <label>:15                                      ; preds = %13
  %16 = sext i32 %i.0 to i64
  %17 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %16
  %18 = load i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = zext i32 %19 to i64
  %21 = shl i64 1, %20
  %22 = or i64 %12, %21
  %23 = call i32 @islegal(i64 %22)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %26, label %25

; <label>:25                                      ; preds = %15
  br label %67

; <label>:26                                      ; preds = %15
  %27 = sext i32 %i.0 to i64
  %28 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %27
  %29 = load i8* %28, align 1
  %30 = sext i8 %29 to i32
  %31 = zext i32 %30 to i64
  %32 = shl i64 2, %31
  %33 = or i64 %12, %32
  %34 = call i32 @islegalhaswon(i64 %33)
  %35 = call i64 @haswon(i64 %22)
  %36 = icmp ne i64 %35, 0
  br i1 %36, label %37, label %60

; <label>:37                                      ; preds = %26
  %38 = icmp ne i32 %34, 0
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %37
  br label %244

; <label>:40                                      ; preds = %37
  %41 = add nsw i32 0, 1
  %42 = sext i32 0 to i64
  %43 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %42
  store i32 %i.0, i32* %43, align 4
  br label %44

; <label>:44                                      ; preds = %58, %40
  %i.1 = phi i32 [ %i.0, %40 ], [ %45, %58 ]
  %45 = add nsw i32 %i.1, 1
  %46 = icmp slt i32 %45, 7
  br i1 %46, label %47, label %59

; <label>:47                                      ; preds = %44
  %48 = sext i32 %45 to i64
  %49 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %48
  %50 = load i8* %49, align 1
  %51 = sext i8 %50 to i32
  %52 = zext i32 %51 to i64
  %53 = shl i64 1, %52
  %54 = or i64 %12, %53
  %55 = call i32 @islegalhaswon(i64 %54)
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %58

; <label>:57                                      ; preds = %47
  br label %244

; <label>:58                                      ; preds = %47
  br label %44

; <label>:59                                      ; preds = %44
  br label %69

; <label>:60                                      ; preds = %26
  %61 = icmp ne i32 %34, 0
  br i1 %61, label %66, label %62

; <label>:62                                      ; preds = %60
  %63 = add nsw i32 %nav.0, 1
  %64 = sext i32 %nav.0 to i64
  %65 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %64
  store i32 %i.0, i32* %65, align 4
  br label %66

; <label>:66                                      ; preds = %62, %60
  %nav.1 = phi i32 [ %nav.0, %60 ], [ %63, %62 ]
  br label %67

; <label>:67                                      ; preds = %66, %25
  %nav.2 = phi i32 [ %nav.1, %66 ], [ %nav.0, %25 ]
  %68 = add nsw i32 %i.0, 1
  br label %13

; <label>:69                                      ; preds = %59, %13
  %nav.3 = phi i32 [ %41, %59 ], [ %nav.0, %13 ]
  %70 = icmp eq i32 %nav.3, 0
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %69
  br label %244

; <label>:72                                      ; preds = %69
  %73 = load i32* @nplies, align 4
  %74 = icmp eq i32 %73, 40
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %72
  br label %244

; <label>:76                                      ; preds = %72
  %77 = icmp eq i32 %nav.3, 1
  br i1 %77, label %78, label %85

; <label>:78                                      ; preds = %76
  %79 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 0
  %80 = load i32* %79, align 4
  call void @makemove(i32 %80)
  %81 = sub nsw i32 6, %beta
  %82 = sub nsw i32 6, %alpha
  %83 = call i32 @ab(i32 %81, i32 %82)
  %84 = sub nsw i32 6, %83
  call void @backmove()
  br label %244

; <label>:85                                      ; preds = %76
  %86 = call i32 @transpose()
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %103

; <label>:88                                      ; preds = %85
  %89 = icmp eq i32 %86, 2
  br i1 %89, label %90, label %94

; <label>:90                                      ; preds = %88
  %91 = icmp sle i32 3, %alpha
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %90
  br label %244

; <label>:93                                      ; preds = %90
  br label %102

; <label>:94                                      ; preds = %88
  %95 = icmp eq i32 %86, 4
  br i1 %95, label %96, label %100

; <label>:96                                      ; preds = %94
  %97 = icmp sge i32 3, %beta
  br i1 %97, label %98, label %99

; <label>:98                                      ; preds = %96
  br label %244

; <label>:99                                      ; preds = %96
  br label %101

; <label>:100                                     ; preds = %94
  br label %244

; <label>:101                                     ; preds = %99
  br label %102

; <label>:102                                     ; preds = %101, %93
  %.02 = phi i32 [ 3, %93 ], [ %beta, %101 ]
  %.01 = phi i32 [ %alpha, %93 ], [ 3, %101 ]
  br label %103

; <label>:103                                     ; preds = %102, %85
  %.13 = phi i32 [ %.02, %102 ], [ %beta, %85 ]
  %.1 = phi i32 [ %.01, %102 ], [ %alpha, %85 ]
  %104 = load i32* @htindex, align 4
  %105 = load i32* @lock, align 4
  %106 = load i64* @posed, align 8
  br label %107

; <label>:107                                     ; preds = %218, %103
  %score.0 = phi i32 [ 1, %103 ], [ %score.2, %218 ]
  %i.2 = phi i32 [ 0, %103 ], [ %219, %218 ]
  %.2 = phi i32 [ %.1, %103 ], [ %.4, %218 ]
  %108 = icmp slt i32 %i.2, %nav.3
  br i1 %108, label %109, label %220

; <label>:109                                     ; preds = %107
  %110 = sext i32 %i.2 to i64
  %111 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %110
  %112 = load i32* %111, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %113
  %115 = load i8* %114, align 1
  %116 = sext i8 %115 to i32
  %117 = sext i32 %116 to i64
  %118 = sext i32 %8 to i64
  %119 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %118
  %120 = getelementptr inbounds [49 x i32]* %119, i32 0, i64 %117
  %121 = load i32* %120, align 4
  %122 = add nsw i32 %i.2, 1
  br label %123

; <label>:123                                     ; preds = %141, %109
  %val.0 = phi i32 [ %121, %109 ], [ %val.1, %141 ]
  %l.0 = phi i32 [ %i.2, %109 ], [ %l.1, %141 ]
  %j.0 = phi i32 [ %122, %109 ], [ %142, %141 ]
  %124 = icmp slt i32 %j.0, %nav.3
  br i1 %124, label %125, label %143

; <label>:125                                     ; preds = %123
  %126 = sext i32 %j.0 to i64
  %127 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %126
  %128 = load i32* %127, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %129
  %131 = load i8* %130, align 1
  %132 = sext i8 %131 to i32
  %133 = sext i32 %132 to i64
  %134 = sext i32 %8 to i64
  %135 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %134
  %136 = getelementptr inbounds [49 x i32]* %135, i32 0, i64 %133
  %137 = load i32* %136, align 4
  %138 = icmp sgt i32 %137, %val.0
  br i1 %138, label %139, label %140

; <label>:139                                     ; preds = %125
  br label %140

; <label>:140                                     ; preds = %139, %125
  %val.1 = phi i32 [ %137, %139 ], [ %val.0, %125 ]
  %l.1 = phi i32 [ %j.0, %139 ], [ %l.0, %125 ]
  br label %141

; <label>:141                                     ; preds = %140
  %142 = add nsw i32 %j.0, 1
  br label %123

; <label>:143                                     ; preds = %123
  %144 = sext i32 %l.0 to i64
  %145 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %144
  %146 = load i32* %145, align 4
  br label %147

; <label>:147                                     ; preds = %156, %143
  %l.2 = phi i32 [ %l.0, %143 ], [ %157, %156 ]
  %148 = icmp sgt i32 %l.2, %i.2
  br i1 %148, label %149, label %158

; <label>:149                                     ; preds = %147
  %150 = sub nsw i32 %l.2, 1
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %151
  %153 = load i32* %152, align 4
  %154 = sext i32 %l.2 to i64
  %155 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %154
  store i32 %153, i32* %155, align 4
  br label %156

; <label>:156                                     ; preds = %149
  %157 = add nsw i32 %l.2, -1
  br label %147

; <label>:158                                     ; preds = %147
  %159 = sext i32 %i.2 to i64
  %160 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %159
  store i32 %146, i32* %160, align 4
  call void @makemove(i32 %146)
  %161 = sub nsw i32 6, %.13
  %162 = sub nsw i32 6, %.2
  %163 = call i32 @ab(i32 %161, i32 %162)
  %164 = sub nsw i32 6, %163
  call void @backmove()
  %165 = icmp sgt i32 %164, %score.0
  br i1 %165, label %166, label %217

; <label>:166                                     ; preds = %158
  %167 = icmp sgt i32 %164, %.2
  br i1 %167, label %168, label %216

; <label>:168                                     ; preds = %166
  %169 = load i32* @nplies, align 4
  %170 = load i32* @bookply, align 4
  %171 = icmp sge i32 %169, %170
  br i1 %171, label %172, label %216

; <label>:172                                     ; preds = %168
  %173 = icmp sge i32 %164, %.13
  br i1 %173, label %174, label %216

; <label>:174                                     ; preds = %172
  %175 = icmp eq i32 %164, 3
  br i1 %175, label %176, label %180

; <label>:176                                     ; preds = %174
  %177 = sub nsw i32 %nav.3, 1
  %178 = icmp slt i32 %i.2, %177
  br i1 %178, label %179, label %180

; <label>:179                                     ; preds = %176
  br label %180

; <label>:180                                     ; preds = %179, %176, %174
  %score.1 = phi i32 [ 4, %179 ], [ %164, %176 ], [ %164, %174 ]
  %181 = icmp sgt i32 %i.2, 0
  br i1 %181, label %182, label %215

; <label>:182                                     ; preds = %180
  br label %183

; <label>:183                                     ; preds = %199, %182
  %i.3 = phi i32 [ 0, %182 ], [ %200, %199 ]
  %184 = icmp slt i32 %i.3, %i.2
  br i1 %184, label %185, label %201

; <label>:185                                     ; preds = %183
  %186 = sext i32 %i.3 to i64
  %187 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %186
  %188 = load i32* %187, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %189
  %191 = load i8* %190, align 1
  %192 = sext i8 %191 to i32
  %193 = sext i32 %192 to i64
  %194 = sext i32 %8 to i64
  %195 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %194
  %196 = getelementptr inbounds [49 x i32]* %195, i32 0, i64 %193
  %197 = load i32* %196, align 4
  %198 = add nsw i32 %197, -1
  store i32 %198, i32* %196, align 4
  br label %199

; <label>:199                                     ; preds = %185
  %200 = add nsw i32 %i.3, 1
  br label %183

; <label>:201                                     ; preds = %183
  %202 = sext i32 %i.2 to i64
  %203 = getelementptr inbounds [7 x i32]* %av, i32 0, i64 %202
  %204 = load i32* %203, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %205
  %207 = load i8* %206, align 1
  %208 = sext i8 %207 to i32
  %209 = sext i32 %208 to i64
  %210 = sext i32 %8 to i64
  %211 = getelementptr inbounds [2 x [49 x i32]]* @history, i32 0, i64 %210
  %212 = getelementptr inbounds [49 x i32]* %211, i32 0, i64 %209
  %213 = load i32* %212, align 4
  %214 = add nsw i32 %213, %i.2
  store i32 %214, i32* %212, align 4
  br label %215

; <label>:215                                     ; preds = %201, %180
  br label %220

; <label>:216                                     ; preds = %172, %168, %166
  %.3 = phi i32 [ %164, %172 ], [ %.2, %168 ], [ %.2, %166 ]
  br label %217

; <label>:217                                     ; preds = %216, %158
  %score.2 = phi i32 [ %164, %216 ], [ %score.0, %158 ]
  %.4 = phi i32 [ %.3, %216 ], [ %.2, %158 ]
  br label %218

; <label>:218                                     ; preds = %217
  %219 = add nsw i32 %i.2, 1
  br label %107

; <label>:220                                     ; preds = %215, %107
  %score.3 = phi i32 [ %score.1, %215 ], [ %score.0, %107 ]
  %221 = sub nsw i32 6, %86
  %222 = icmp eq i32 %score.3, %221
  br i1 %222, label %223, label %224

; <label>:223                                     ; preds = %220
  br label %224

; <label>:224                                     ; preds = %223, %220
  %score.4 = phi i32 [ 3, %223 ], [ %score.3, %220 ]
  %225 = load i64* @posed, align 8
  %226 = sub i64 %225, %106
  br label %227

; <label>:227                                     ; preds = %231, %224
  %work.0 = phi i32 [ 0, %224 ], [ %232, %231 ]
  %poscnt.0 = phi i64 [ %226, %224 ], [ %228, %231 ]
  %228 = lshr i64 %poscnt.0, 1
  %229 = icmp ne i64 %228, 0
  br i1 %229, label %230, label %233

; <label>:230                                     ; preds = %227
  br label %231

; <label>:231                                     ; preds = %230
  %232 = add nsw i32 %work.0, 1
  br label %227

; <label>:233                                     ; preds = %227
  call void @transtore(i32 %104, i32 %105, i32 %score.4, i32 %work.0)
  %234 = load i32* @nplies, align 4
  %235 = load i32* @reportply, align 4
  %236 = icmp sle i32 %234, %235
  br i1 %236, label %237, label %243

; <label>:237                                     ; preds = %233
  call void @printMoves()
  %238 = sext i32 %score.4 to i64
  %239 = getelementptr inbounds [7 x i8]* @.str4, i32 0, i64 %238
  %240 = load i8* %239, align 1
  %241 = sext i8 %240 to i32
  %242 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0), i32 %241, i32 %work.0)
  br label %243

; <label>:243                                     ; preds = %237, %233
  br label %244

; <label>:244                                     ; preds = %243, %100, %98, %92, %78, %75, %71, %57, %39, %5
  %.0 = phi i32 [ 3, %5 ], [ 1, %39 ], [ 1, %57 ], [ 1, %71 ], [ 3, %75 ], [ %84, %78 ], [ %86, %92 ], [ %score.4, %243 ], [ %86, %98 ], [ %86, %100 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @solve() #0 {
  %1 = load i32* @nplies, align 4
  %2 = and i32 %1, 1
  %3 = xor i32 %2, 1
  store i64 0, i64* @nodes, align 8
  store i64 1, i64* @msecs, align 8
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %4
  %6 = load i64* %5, align 8
  %7 = call i64 @haswon(i64 %6)
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  br label %41

; <label>:10                                      ; preds = %0
  br label %11

; <label>:11                                      ; preds = %28, %10
  %i.0 = phi i32 [ 0, %10 ], [ %29, %28 ]
  %12 = icmp slt i32 %i.0, 7
  br i1 %12, label %13, label %30

; <label>:13                                      ; preds = %11
  %14 = sext i32 %2 to i64
  %15 = getelementptr inbounds [2 x i64]* @color, i32 0, i64 %14
  %16 = load i64* %15, align 8
  %17 = sext i32 %i.0 to i64
  %18 = getelementptr inbounds [7 x i8]* @height, i32 0, i64 %17
  %19 = load i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = zext i32 %20 to i64
  %22 = shl i64 1, %21
  %23 = or i64 %16, %22
  %24 = call i32 @islegalhaswon(i64 %23)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %13
  br label %41

; <label>:27                                      ; preds = %13
  br label %28

; <label>:28                                      ; preds = %27
  %29 = add nsw i32 %i.0, 1
  br label %11

; <label>:30                                      ; preds = %11
  call void @inithistory()
  %31 = load i32* @nplies, align 4
  %32 = add nsw i32 %31, 2
  store i32 %32, i32* @reportply, align 4
  %33 = load i32* @nplies, align 4
  %34 = add nsw i32 %33, 0
  store i32 %34, i32* @bookply, align 4
  %35 = call i64 @millisecs()
  store i64 %35, i64* @msecs, align 8
  %36 = call i32 @ab(i32 1, i32 5)
  %37 = call i64 @millisecs()
  %38 = add i64 1, %37
  %39 = load i64* @msecs, align 8
  %40 = sub i64 %38, %39
  store i64 %40, i64* @msecs, align 8
  br label %41

; <label>:41                                      ; preds = %30, %26, %9
  %.0 = phi i32 [ 1, %9 ], [ 5, %26 ], [ %36, %30 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  call void @trans_init()
  %1 = call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0))
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str6, i32 0, i32 0), i32 7, i32 6)
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([51 x i8]* @.str7, i32 0, i32 0), i32 8306069, i64 8)
  br label %4

; <label>:4                                       ; preds = %34, %0
  call void @reset()
  br label %5

; <label>:5                                       ; preds = %18, %4
  %6 = call i32 @getchar()
  %7 = icmp ne i32 %6, -1
  br i1 %7, label %8, label %19

; <label>:8                                       ; preds = %5
  %9 = icmp sge i32 %6, 49
  br i1 %9, label %10, label %14

; <label>:10                                      ; preds = %8
  %11 = icmp sle i32 %6, 55
  br i1 %11, label %12, label %14

; <label>:12                                      ; preds = %10
  %13 = sub nsw i32 %6, 49
  call void @makemove(i32 %13)
  br label %18

; <label>:14                                      ; preds = %10, %8
  %15 = icmp eq i32 %6, 10
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %14
  br label %19

; <label>:17                                      ; preds = %14
  br label %18

; <label>:18                                      ; preds = %17, %12
  br label %5

; <label>:19                                      ; preds = %16, %5
  %20 = icmp eq i32 %6, -1
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %19
  br label %48

; <label>:22                                      ; preds = %19
  %23 = load i32* @nplies, align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), i32 %23)
  call void @printMoves()
  %25 = call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @.str9, i32 0, i32 0))
  call void @emptyTT()
  %26 = call i32 @solve()
  %27 = load i64* @posed, align 8
  br label %28

; <label>:28                                      ; preds = %32, %22
  %work.0 = phi i32 [ 0, %22 ], [ %33, %32 ]
  %poscnt.0 = phi i64 [ %27, %22 ], [ %29, %32 ]
  %29 = lshr i64 %poscnt.0, 1
  %30 = icmp ne i64 %29, 0
  br i1 %30, label %31, label %34

; <label>:31                                      ; preds = %28
  br label %32

; <label>:32                                      ; preds = %31
  %33 = add nsw i32 %work.0, 1
  br label %28

; <label>:34                                      ; preds = %28
  %35 = sext i32 %26 to i64
  %36 = getelementptr inbounds [7 x i8]* @.str4, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i32 0, i32 0), i32 %26, i32 %38, i32 %work.0)
  %40 = load i64* @nodes, align 8
  %41 = load i64* @msecs, align 8
  %42 = load i64* @nodes, align 8
  %43 = uitofp i64 %42 to double
  %44 = load i64* @msecs, align 8
  %45 = uitofp i64 %44 to double
  %46 = fdiv double %43, %45
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str11, i32 0, i32 0), i64 %40, i64 %41, double %46)
  call void @htstat()
  br label %4

; <label>:48                                      ; preds = %21
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
