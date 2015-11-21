; ModuleID = 'neval.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@std_p_tropism = constant [8 x i32] [i32 9999, i32 15, i32 10, i32 7, i32 2, i32 0, i32 0, i32 0], align 16
@std_own_p_tropism = constant [8 x i32] [i32 9999, i32 30, i32 10, i32 2, i32 0, i32 0, i32 0, i32 0], align 16
@std_r_tropism = constant [16 x i32] [i32 9999, i32 0, i32 15, i32 5, i32 2, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@std_n_tropism = constant [8 x i32] [i32 9999, i32 14, i32 9, i32 6, i32 1, i32 0, i32 0, i32 0], align 16
@std_q_tropism = constant [8 x i32] [i32 9999, i32 200, i32 50, i32 15, i32 3, i32 2, i32 1, i32 0], align 16
@std_b_tropism = constant [8 x i32] [i32 9999, i32 12, i32 7, i32 5, i32 0, i32 0, i32 0, i32 0], align 16
@piece_count = external global i32
@pieces = external global [62 x i32]
@board = external global [144 x i32]
@white_castled = external global i32
@black_castled = external global i32
@phase = external global i32
@Xfile = external constant [144 x i32]
@king_locs = common global [2 x i32] zeroinitializer, align 4
@distance = common global [144 x [144 x i32]] zeroinitializer, align 16
@Rook.square_d1 = internal constant [2 x i32] [i32 29, i32 113], align 4
@rookdistance = common global [144 x [144 x i32]] zeroinitializer, align 16
@wmat = common global i32 0, align 4
@bmat = common global i32 0, align 4
@sbishop = internal global [144 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -2, i32 -2, i32 -2, i32 -2, i32 -2, i32 -2, i32 -2, i32 -2, i32 0, i32 0, i32 0, i32 0, i32 -2, i32 8, i32 5, i32 5, i32 5, i32 5, i32 8, i32 -2, i32 0, i32 0, i32 0, i32 0, i32 -2, i32 3, i32 3, i32 5, i32 5, i32 3, i32 3, i32 -2, i32 0, i32 0, i32 0, i32 0, i32 -2, i32 2, i32 5, i32 4, i32 4, i32 5, i32 2, i32 -2, i32 0, i32 0, i32 0, i32 0, i32 -2, i32 2, i32 5, i32 4, i32 4, i32 5, i32 2, i32 -2, i32 0, i32 0, i32 0, i32 0, i32 -2, i32 3, i32 3, i32 5, i32 5, i32 3, i32 3, i32 -2, i32 0, i32 0, i32 0, i32 0, i32 -2, i32 8, i32 5, i32 5, i32 5, i32 5, i32 8, i32 -2, i32 0, i32 0, i32 0, i32 0, i32 -2, i32 -2, i32 -2, i32 -2, i32 -2, i32 -2, i32 -2, i32 -2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@sknight = internal global [144 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -20, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -20, i32 0, i32 0, i32 0, i32 0, i32 -10, i32 0, i32 0, i32 3, i32 3, i32 0, i32 0, i32 -10, i32 0, i32 0, i32 0, i32 0, i32 -10, i32 0, i32 5, i32 5, i32 5, i32 5, i32 0, i32 -10, i32 0, i32 0, i32 0, i32 0, i32 -10, i32 0, i32 5, i32 10, i32 10, i32 5, i32 0, i32 -10, i32 0, i32 0, i32 0, i32 0, i32 -10, i32 0, i32 5, i32 10, i32 10, i32 5, i32 0, i32 -10, i32 0, i32 0, i32 0, i32 0, i32 -10, i32 0, i32 5, i32 5, i32 5, i32 5, i32 0, i32 -10, i32 0, i32 0, i32 0, i32 0, i32 -10, i32 0, i32 0, i32 3, i32 3, i32 0, i32 0, i32 -10, i32 0, i32 0, i32 0, i32 0, i32 -20, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -20, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@.str = private unnamed_addr constant [35 x i8] c"Illegal piece detected sq=%i c=%i\0A\00", align 1
@white_to_move = external global i32
@Material = external global i32
@maxposdiff = common global i32 0, align 4
@wking_loc = external global i32
@bking_loc = external global i32
@.str1 = private unnamed_addr constant [21 x i8] c"(i > 0) && (i < 145)\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"neval.c\00", align 1
@__PRETTY_FUNCTION__.std_eval = private unnamed_addr constant [23 x i8] c"int std_eval(int, int)\00", align 1
@material = external global [14 x i32]
@Xrank = external constant [144 x i32]
@evalRoutines = internal global [7 x i32 (i32, i32)*] [i32 (i32, i32)* @ErrorIt, i32 (i32, i32)* @Pawn, i32 (i32, i32)* @Knight, i32 (i32, i32)* @King, i32 (i32, i32)* @Rook, i32 (i32, i32)* @Queen, i32 (i32, i32)* @Bishop], align 16
@swhite_pawn = internal global [144 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 2, i32 3, i32 10, i32 10, i32 3, i32 2, i32 1, i32 0, i32 0, i32 0, i32 0, i32 2, i32 4, i32 6, i32 12, i32 12, i32 6, i32 4, i32 2, i32 0, i32 0, i32 0, i32 0, i32 3, i32 6, i32 9, i32 14, i32 14, i32 9, i32 6, i32 3, i32 0, i32 0, i32 0, i32 0, i32 10, i32 12, i32 14, i32 16, i32 16, i32 14, i32 12, i32 10, i32 0, i32 0, i32 0, i32 0, i32 20, i32 22, i32 24, i32 26, i32 26, i32 24, i32 22, i32 20, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@sblack_pawn = internal global [144 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 20, i32 22, i32 24, i32 26, i32 26, i32 24, i32 22, i32 20, i32 0, i32 0, i32 0, i32 0, i32 10, i32 12, i32 14, i32 16, i32 16, i32 14, i32 12, i32 10, i32 0, i32 0, i32 0, i32 0, i32 3, i32 6, i32 9, i32 14, i32 14, i32 9, i32 6, i32 3, i32 0, i32 0, i32 0, i32 0, i32 2, i32 4, i32 6, i32 12, i32 12, i32 6, i32 4, i32 2, i32 0, i32 0, i32 0, i32 0, i32 1, i32 2, i32 3, i32 10, i32 10, i32 3, i32 2, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@swhite_king = internal global [144 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2, i32 14, i32 0, i32 0, i32 0, i32 9, i32 14, i32 2, i32 0, i32 0, i32 0, i32 0, i32 -3, i32 -5, i32 -6, i32 -6, i32 -6, i32 -6, i32 -5, i32 -3, i32 0, i32 0, i32 0, i32 0, i32 -5, i32 -5, i32 -8, i32 -8, i32 -8, i32 -8, i32 -5, i32 -5, i32 0, i32 0, i32 0, i32 0, i32 -8, i32 -8, i32 -13, i32 -13, i32 -13, i32 -13, i32 -8, i32 -8, i32 0, i32 0, i32 0, i32 0, i32 -13, i32 -13, i32 -21, i32 -21, i32 -21, i32 -21, i32 -13, i32 -13, i32 0, i32 0, i32 0, i32 0, i32 -21, i32 -21, i32 -34, i32 -34, i32 -34, i32 -34, i32 -21, i32 -21, i32 0, i32 0, i32 0, i32 0, i32 -34, i32 -34, i32 -55, i32 -55, i32 -55, i32 -55, i32 -34, i32 -34, i32 0, i32 0, i32 0, i32 0, i32 -55, i32 -55, i32 -89, i32 -89, i32 -89, i32 -89, i32 -55, i32 -55, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@moved = external global [144 x i32]
@send_king = internal global [144 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -5, i32 -3, i32 -1, i32 0, i32 0, i32 -1, i32 -3, i32 -5, i32 0, i32 0, i32 0, i32 0, i32 -3, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 -3, i32 0, i32 0, i32 0, i32 0, i32 -1, i32 10, i32 25, i32 25, i32 25, i32 25, i32 10, i32 -1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 10, i32 25, i32 50, i32 50, i32 25, i32 10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 10, i32 25, i32 50, i32 50, i32 25, i32 10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -1, i32 10, i32 25, i32 25, i32 25, i32 25, i32 10, i32 -1, i32 0, i32 0, i32 0, i32 0, i32 -3, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 -3, i32 0, i32 0, i32 0, i32 0, i32 -5, i32 -3, i32 -1, i32 0, i32 0, i32 -1, i32 -3, i32 -5, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@sblack_king = internal global [144 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -55, i32 -55, i32 -89, i32 -89, i32 -89, i32 -89, i32 -55, i32 -55, i32 0, i32 0, i32 0, i32 0, i32 -34, i32 -34, i32 -55, i32 -55, i32 -55, i32 -55, i32 -34, i32 -34, i32 0, i32 0, i32 0, i32 0, i32 -21, i32 -21, i32 -34, i32 -34, i32 -34, i32 -34, i32 -21, i32 -21, i32 0, i32 0, i32 0, i32 0, i32 -13, i32 -13, i32 -21, i32 -21, i32 -21, i32 -21, i32 -13, i32 -13, i32 0, i32 0, i32 0, i32 0, i32 -8, i32 -8, i32 -13, i32 -13, i32 -13, i32 -13, i32 -8, i32 -8, i32 0, i32 0, i32 0, i32 0, i32 -5, i32 -5, i32 -8, i32 -8, i32 -8, i32 -8, i32 -5, i32 -5, i32 0, i32 0, i32 0, i32 0, i32 -3, i32 -5, i32 -6, i32 -6, i32 -6, i32 -6, i32 -5, i32 -3, i32 0, i32 0, i32 0, i32 0, i32 2, i32 14, i32 0, i32 0, i32 0, i32 9, i32 14, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@srev_rank = internal constant [9 x i32] [i32 0, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1], align 16
@bishop_mobility.dir = internal constant [4 x i32] [i32 -13, i32 -11, i32 11, i32 13], align 16
@rook_mobility.dir = internal constant [4 x i32] [i32 -1, i32 1, i32 12, i32 -12], align 16

; Function Attrs: nounwind uwtable
define void @check_phase() #0 {
  %xnum_pieces = alloca i32, align 4
  %j = alloca i32, align 4
  %a = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %xnum_pieces, align 4
  store i32 1, i32* %j, align 4
  store i32 1, i32* %a, align 4
  br label %1

; <label>:1                                       ; preds = %44, %0
  %2 = load i32* %a, align 4
  %3 = load i32* @piece_count, align 4
  %4 = icmp sle i32 %2, %3
  br i1 %4, label %5, label %47

; <label>:5                                       ; preds = %1
  %6 = load i32* %j, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [62 x i32]* @pieces, i32 0, i64 %7
  %9 = load i32* %8, align 4
  store i32 %9, i32* %i, align 4
  %10 = load i32* %i, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %5
  br label %44

; <label>:13                                      ; preds = %5
  %14 = load i32* %a, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %a, align 4
  br label %16

; <label>:16                                      ; preds = %13
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %18
  %20 = load i32* %19, align 4
  %21 = icmp ne i32 %20, 1
  br i1 %21, label %22, label %43

; <label>:22                                      ; preds = %16
  %23 = load i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %24
  %26 = load i32* %25, align 4
  %27 = icmp ne i32 %26, 2
  br i1 %27, label %28, label %43

; <label>:28                                      ; preds = %22
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %30
  %32 = load i32* %31, align 4
  %33 = icmp ne i32 %32, 13
  br i1 %33, label %34, label %43

; <label>:34                                      ; preds = %28
  %35 = load i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %36
  %38 = load i32* %37, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %43

; <label>:40                                      ; preds = %34
  %41 = load i32* %xnum_pieces, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %xnum_pieces, align 4
  br label %43

; <label>:43                                      ; preds = %40, %34, %28, %22, %16
  br label %44

; <label>:44                                      ; preds = %43, %12
  %45 = load i32* %j, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %j, align 4
  br label %1

; <label>:47                                      ; preds = %1
  %48 = load i32* %xnum_pieces, align 4
  %49 = icmp sge i32 %48, 12
  br i1 %49, label %50, label %63

; <label>:50                                      ; preds = %47
  %51 = load i32* @white_castled, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %56

; <label>:53                                      ; preds = %50
  %54 = load i32* @black_castled, align 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %63, label %56

; <label>:56                                      ; preds = %53, %50
  %57 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 30), align 4
  %58 = icmp eq i32 %57, 5
  br i1 %58, label %62, label %59

; <label>:59                                      ; preds = %56
  %60 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 114), align 4
  %61 = icmp eq i32 %60, 6
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %59, %56
  store i32 0, i32* @phase, align 4
  br label %69

; <label>:63                                      ; preds = %59, %53, %47
  %64 = load i32* %xnum_pieces, align 4
  %65 = icmp sle i32 %64, 6
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %63
  store i32 2, i32* @phase, align 4
  br label %68

; <label>:67                                      ; preds = %63
  store i32 1, i32* @phase, align 4
  br label %68

; <label>:68                                      ; preds = %67, %66
  br label %69

; <label>:69                                      ; preds = %68, %62
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @King(i32 %sq, i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %s = alloca i32, align 4
  store i32 %sq, i32* %1, align 4
  store i32 %c, i32* %2, align 4
  store i32 0, i32* %s, align 4
  %3 = load i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %4
  %6 = load i32* %5, align 4
  %7 = icmp sge i32 %6, 6
  br i1 %7, label %8, label %30

; <label>:8                                       ; preds = %0
  %9 = load i32* %1, align 4
  %10 = sub nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %11
  %13 = load i32* %12, align 4
  %14 = add nsw i32 %13, 1
  %15 = ashr i32 %14, 1
  %16 = icmp eq i32 %15, 4
  br i1 %16, label %17, label %30

; <label>:17                                      ; preds = %8
  %18 = load i32* %1, align 4
  %19 = sub nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %20
  %22 = load i32* %21, align 4
  %23 = add nsw i32 %22, 1
  %24 = and i32 %23, 1
  %25 = load i32* %2, align 4
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %27, label %30

; <label>:27                                      ; preds = %17
  %28 = load i32* %s, align 4
  %29 = add nsw i32 %28, 2
  store i32 %29, i32* %s, align 4
  br label %30

; <label>:30                                      ; preds = %27, %17, %8, %0
  %31 = load i32* %1, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %32
  %34 = load i32* %33, align 4
  %35 = icmp sge i32 %34, 6
  br i1 %35, label %36, label %58

; <label>:36                                      ; preds = %30
  %37 = load i32* %1, align 4
  %38 = add nsw i32 %37, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %39
  %41 = load i32* %40, align 4
  %42 = add nsw i32 %41, 1
  %43 = ashr i32 %42, 1
  %44 = icmp eq i32 %43, 4
  br i1 %44, label %45, label %58

; <label>:45                                      ; preds = %36
  %46 = load i32* %1, align 4
  %47 = add nsw i32 %46, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %48
  %50 = load i32* %49, align 4
  %51 = add nsw i32 %50, 1
  %52 = and i32 %51, 1
  %53 = load i32* %2, align 4
  %54 = icmp eq i32 %52, %53
  br i1 %54, label %55, label %58

; <label>:55                                      ; preds = %45
  %56 = load i32* %s, align 4
  %57 = add nsw i32 %56, 2
  store i32 %57, i32* %s, align 4
  br label %58

; <label>:58                                      ; preds = %55, %45, %36, %30
  %59 = load i32* %2, align 4
  %60 = icmp eq i32 %59, 1
  br i1 %60, label %61, label %64

; <label>:61                                      ; preds = %58
  %62 = load i32* %s, align 4
  %63 = sub nsw i32 0, %62
  store i32 %63, i32* %s, align 4
  br label %64

; <label>:64                                      ; preds = %61, %58
  %65 = load i32* %s, align 4
  ret i32 %65
}

; Function Attrs: nounwind uwtable
define i32 @Queen(i32 %sq, i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %s = alloca i32, align 4
  %mob = alloca i32, align 4
  %xside = alloca i32, align 4
  store i32 %sq, i32* %1, align 4
  store i32 %c, i32* %2, align 4
  store i32 0, i32* %s, align 4
  %3 = load i32* %2, align 4
  %4 = xor i32 %3, 1
  store i32 %4, i32* %xside, align 4
  %5 = load i32* %s, align 4
  %6 = add nsw i32 %5, 900
  store i32 %6, i32* %s, align 4
  %7 = load i32* %xside, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %13
  %15 = getelementptr inbounds [144 x i32]* %14, i32 0, i64 %11
  %16 = load i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [8 x i32]* @std_q_tropism, i32 0, i64 %17
  %19 = load i32* %18, align 4
  %20 = load i32* %s, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, i32* %s, align 4
  %22 = load i32* %1, align 4
  %23 = call i32 @rook_mobility(i32 %22)
  %24 = shl i32 %23, 1
  store i32 %24, i32* %mob, align 4
  %25 = load i32* %1, align 4
  %26 = call i32 @bishop_mobility(i32 %25)
  %27 = shl i32 %26, 1
  %28 = load i32* %mob, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, i32* %mob, align 4
  %30 = load i32* %mob, align 4
  %31 = icmp sle i32 %30, 4
  br i1 %31, label %32, label %49

; <label>:32                                      ; preds = %0
  %33 = load i32* %mob, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %38

; <label>:35                                      ; preds = %32
  %36 = load i32* %mob, align 4
  %37 = sub nsw i32 %36, 15
  store i32 %37, i32* %mob, align 4
  br label %48

; <label>:38                                      ; preds = %32
  %39 = load i32* %mob, align 4
  %40 = icmp eq i32 %39, 2
  br i1 %40, label %41, label %44

; <label>:41                                      ; preds = %38
  %42 = load i32* %mob, align 4
  %43 = sub nsw i32 %42, 10
  store i32 %43, i32* %mob, align 4
  br label %47

; <label>:44                                      ; preds = %38
  %45 = load i32* %mob, align 4
  %46 = sub nsw i32 %45, 5
  store i32 %46, i32* %mob, align 4
  br label %47

; <label>:47                                      ; preds = %44, %41
  br label %48

; <label>:48                                      ; preds = %47, %35
  br label %49

; <label>:49                                      ; preds = %48, %0
  %50 = load i32* %mob, align 4
  %51 = load i32* %s, align 4
  %52 = add nsw i32 %51, %50
  store i32 %52, i32* %s, align 4
  %53 = load i32* %2, align 4
  %54 = icmp eq i32 %53, 1
  br i1 %54, label %55, label %58

; <label>:55                                      ; preds = %49
  %56 = load i32* %s, align 4
  %57 = sub nsw i32 0, %56
  store i32 %57, i32* %s, align 4
  br label %58

; <label>:58                                      ; preds = %55, %49
  %59 = load i32* %s, align 4
  ret i32 %59
}

; Function Attrs: nounwind uwtable
define internal i32 @rook_mobility(i32 %square) #0 {
  %1 = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %diridx = alloca i32, align 4
  store i32 %square, i32* %1, align 4
  store i32 0, i32* %m, align 4
  store i32 0, i32* %diridx, align 4
  br label %2

; <label>:2                                       ; preds = %29, %0
  %3 = load i32* %diridx, align 4
  %4 = icmp slt i32 %3, 4
  br i1 %4, label %5, label %32

; <label>:5                                       ; preds = %2
  %6 = load i32* %1, align 4
  %7 = load i32* %diridx, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [4 x i32]* @rook_mobility.dir, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = add nsw i32 %6, %10
  store i32 %11, i32* %l, align 4
  br label %12

; <label>:12                                      ; preds = %21, %5
  %13 = load i32* %l, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %14
  %16 = load i32* %15, align 4
  %17 = icmp eq i32 %16, 13
  br i1 %17, label %18, label %28

; <label>:18                                      ; preds = %12
  %19 = load i32* %m, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %m, align 4
  br label %21

; <label>:21                                      ; preds = %18
  %22 = load i32* %diridx, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [4 x i32]* @rook_mobility.dir, i32 0, i64 %23
  %25 = load i32* %24, align 4
  %26 = load i32* %l, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, i32* %l, align 4
  br label %12

; <label>:28                                      ; preds = %12
  br label %29

; <label>:29                                      ; preds = %28
  %30 = load i32* %diridx, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %diridx, align 4
  br label %2

; <label>:32                                      ; preds = %2
  %33 = load i32* %m, align 4
  ret i32 %33
}

; Function Attrs: nounwind uwtable
define internal i32 @bishop_mobility(i32 %square) #0 {
  %1 = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %diridx = alloca i32, align 4
  store i32 %square, i32* %1, align 4
  store i32 0, i32* %m, align 4
  store i32 0, i32* %diridx, align 4
  br label %2

; <label>:2                                       ; preds = %29, %0
  %3 = load i32* %diridx, align 4
  %4 = icmp slt i32 %3, 4
  br i1 %4, label %5, label %32

; <label>:5                                       ; preds = %2
  %6 = load i32* %1, align 4
  %7 = load i32* %diridx, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [4 x i32]* @bishop_mobility.dir, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = add nsw i32 %6, %10
  store i32 %11, i32* %l, align 4
  br label %12

; <label>:12                                      ; preds = %21, %5
  %13 = load i32* %l, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %14
  %16 = load i32* %15, align 4
  %17 = icmp eq i32 %16, 13
  br i1 %17, label %18, label %28

; <label>:18                                      ; preds = %12
  %19 = load i32* %m, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %m, align 4
  br label %21

; <label>:21                                      ; preds = %18
  %22 = load i32* %diridx, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [4 x i32]* @bishop_mobility.dir, i32 0, i64 %23
  %25 = load i32* %24, align 4
  %26 = load i32* %l, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, i32* %l, align 4
  br label %12

; <label>:28                                      ; preds = %12
  br label %29

; <label>:29                                      ; preds = %28
  %30 = load i32* %diridx, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %diridx, align 4
  br label %2

; <label>:32                                      ; preds = %2
  %33 = load i32* %m, align 4
  ret i32 %33
}

; Function Attrs: nounwind uwtable
define i32 @Rook(i32 %sq, i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %s = alloca i32, align 4
  %mob = alloca i32, align 4
  %xside = alloca i32, align 4
  store i32 %sq, i32* %1, align 4
  store i32 %c, i32* %2, align 4
  store i32 0, i32* %s, align 4
  %3 = load i32* %2, align 4
  %4 = xor i32 %3, 1
  store i32 %4, i32* %xside, align 4
  %5 = load i32* %s, align 4
  %6 = add nsw i32 %5, 500
  store i32 %6, i32* %s, align 4
  %7 = load i32* %xside, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [144 x [144 x i32]]* @rookdistance, i32 0, i64 %13
  %15 = getelementptr inbounds [144 x i32]* %14, i32 0, i64 %11
  %16 = load i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [16 x i32]* @std_r_tropism, i32 0, i64 %17
  %19 = load i32* %18, align 4
  %20 = load i32* %s, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, i32* %s, align 4
  %22 = load i32* %1, align 4
  %23 = call i32 @rook_mobility(i32 %22)
  %24 = shl i32 %23, 1
  store i32 %24, i32* %mob, align 4
  %25 = load i32* %mob, align 4
  %26 = icmp sle i32 %25, 2
  br i1 %26, label %27, label %30

; <label>:27                                      ; preds = %0
  %28 = load i32* %mob, align 4
  %29 = sub nsw i32 %28, 5
  store i32 %29, i32* %mob, align 4
  br label %30

; <label>:30                                      ; preds = %27, %0
  %31 = load i32* %mob, align 4
  %32 = load i32* %s, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, i32* %s, align 4
  %34 = load i32* %1, align 4
  %35 = sub nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %36
  %38 = load i32* %37, align 4
  %39 = icmp ne i32 %38, 13
  br i1 %39, label %40, label %50

; <label>:40                                      ; preds = %30
  %41 = load i32* %1, align 4
  %42 = add nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %43
  %45 = load i32* %44, align 4
  %46 = icmp ne i32 %45, 13
  br i1 %46, label %47, label %50

; <label>:47                                      ; preds = %40
  %48 = load i32* %s, align 4
  %49 = sub nsw i32 %48, 5
  store i32 %49, i32* %s, align 4
  br label %50

; <label>:50                                      ; preds = %47, %40, %30
  %51 = load i32* @wmat, align 4
  %52 = icmp ne i32 %51, 1300
  br i1 %52, label %56, label %53

; <label>:53                                      ; preds = %50
  %54 = load i32* @bmat, align 4
  %55 = icmp ne i32 %54, 1300
  br i1 %55, label %56, label %106

; <label>:56                                      ; preds = %53, %50
  %57 = load i32* %1, align 4
  %58 = load i32* %2, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [2 x i32]* @Rook.square_d1, i32 0, i64 %59
  %61 = load i32* %60, align 4
  %62 = icmp eq i32 %57, %61
  br i1 %62, label %63, label %94

; <label>:63                                      ; preds = %56
  %64 = load i32* %s, align 4
  %65 = add nsw i32 %64, 10
  store i32 %65, i32* %s, align 4
  %66 = load i32* %2, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [2 x i32]* @Rook.square_d1, i32 0, i64 %67
  %69 = load i32* %68, align 4
  %70 = add nsw i32 %69, 1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %71
  %73 = load i32* %72, align 4
  %74 = add nsw i32 %73, 1
  %75 = ashr i32 %74, 1
  %76 = icmp eq i32 %75, 4
  br i1 %76, label %77, label %93

; <label>:77                                      ; preds = %63
  %78 = load i32* %2, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [2 x i32]* @Rook.square_d1, i32 0, i64 %79
  %81 = load i32* %80, align 4
  %82 = add nsw i32 %81, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %83
  %85 = load i32* %84, align 4
  %86 = add nsw i32 %85, 1
  %87 = and i32 %86, 1
  %88 = load i32* %2, align 4
  %89 = icmp eq i32 %87, %88
  br i1 %89, label %90, label %93

; <label>:90                                      ; preds = %77
  %91 = load i32* %s, align 4
  %92 = add nsw i32 %91, 5
  store i32 %92, i32* %s, align 4
  br label %93

; <label>:93                                      ; preds = %90, %77, %63
  br label %94

; <label>:94                                      ; preds = %93, %56
  %95 = load i32* %1, align 4
  %96 = load i32* %2, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [2 x i32]* @Rook.square_d1, i32 0, i64 %97
  %99 = load i32* %98, align 4
  %100 = add nsw i32 %99, 1
  %101 = icmp eq i32 %95, %100
  br i1 %101, label %102, label %105

; <label>:102                                     ; preds = %94
  %103 = load i32* %s, align 4
  %104 = add nsw i32 %103, 10
  store i32 %104, i32* %s, align 4
  br label %105

; <label>:105                                     ; preds = %102, %94
  br label %106

; <label>:106                                     ; preds = %105, %53
  %107 = load i32* %2, align 4
  %108 = icmp eq i32 %107, 1
  br i1 %108, label %109, label %112

; <label>:109                                     ; preds = %106
  %110 = load i32* %s, align 4
  %111 = sub nsw i32 0, %110
  store i32 %111, i32* %s, align 4
  br label %112

; <label>:112                                     ; preds = %109, %106
  %113 = load i32* %s, align 4
  ret i32 %113
}

; Function Attrs: nounwind uwtable
define i32 @Bishop(i32 %sq, i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %s = alloca i32, align 4
  %mob = alloca i32, align 4
  %xside = alloca i32, align 4
  store i32 %sq, i32* %1, align 4
  store i32 %c, i32* %2, align 4
  store i32 0, i32* %s, align 4
  %3 = load i32* %2, align 4
  %4 = xor i32 %3, 1
  store i32 %4, i32* %xside, align 4
  %5 = load i32* %s, align 4
  %6 = add nsw i32 %5, 325
  store i32 %6, i32* %s, align 4
  %7 = load i32* %1, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [144 x i32]* @sbishop, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = load i32* %s, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, i32* %s, align 4
  %13 = load i32* %xside, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %14
  %16 = load i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = load i32* %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %19
  %21 = getelementptr inbounds [144 x i32]* %20, i32 0, i64 %17
  %22 = load i32* %21, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x i32]* @std_b_tropism, i32 0, i64 %23
  %25 = load i32* %24, align 4
  %26 = load i32* %s, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, i32* %s, align 4
  %28 = load i32* %1, align 4
  %29 = call i32 @bishop_mobility(i32 %28)
  %30 = shl i32 %29, 1
  store i32 %30, i32* %mob, align 4
  %31 = load i32* %mob, align 4
  %32 = icmp sle i32 %31, 2
  br i1 %32, label %33, label %36

; <label>:33                                      ; preds = %0
  %34 = load i32* %mob, align 4
  %35 = sub nsw i32 %34, 5
  store i32 %35, i32* %mob, align 4
  br label %36

; <label>:36                                      ; preds = %33, %0
  %37 = load i32* %mob, align 4
  %38 = load i32* %s, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, i32* %s, align 4
  %40 = load i32* %2, align 4
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %48

; <label>:42                                      ; preds = %36
  %43 = load i32* %1, align 4
  %44 = icmp eq i32 %43, 39
  br i1 %44, label %45, label %48

; <label>:45                                      ; preds = %42
  %46 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 52), align 4
  %47 = icmp eq i32 %46, 1
  br i1 %47, label %57, label %48

; <label>:48                                      ; preds = %45, %42, %36
  %49 = load i32* %2, align 4
  %50 = icmp eq i32 %49, 1
  br i1 %50, label %51, label %60

; <label>:51                                      ; preds = %48
  %52 = load i32* %1, align 4
  %53 = icmp eq i32 %52, 99
  br i1 %53, label %54, label %60

; <label>:54                                      ; preds = %51
  %55 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 88), align 4
  %56 = icmp eq i32 %55, 2
  br i1 %56, label %57, label %60

; <label>:57                                      ; preds = %54, %45
  %58 = load i32* %s, align 4
  %59 = sub nsw i32 %58, 5
  store i32 %59, i32* %s, align 4
  br label %60

; <label>:60                                      ; preds = %57, %54, %51, %48
  %61 = load i32* %2, align 4
  %62 = icmp eq i32 %61, 1
  br i1 %62, label %63, label %66

; <label>:63                                      ; preds = %60
  %64 = load i32* %s, align 4
  %65 = sub nsw i32 0, %64
  store i32 %65, i32* %s, align 4
  br label %66

; <label>:66                                      ; preds = %63, %60
  %67 = load i32* %s, align 4
  ret i32 %67
}

; Function Attrs: nounwind uwtable
define i32 @Knight(i32 %sq, i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %s = alloca i32, align 4
  %xside = alloca i32, align 4
  store i32 %sq, i32* %1, align 4
  store i32 %c, i32* %2, align 4
  store i32 0, i32* %s, align 4
  %3 = load i32* %2, align 4
  %4 = xor i32 %3, 1
  store i32 %4, i32* %xside, align 4
  %5 = load i32* %s, align 4
  %6 = add nsw i32 %5, 310
  store i32 %6, i32* %s, align 4
  %7 = load i32* %1, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [144 x i32]* @sknight, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = load i32* %s, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, i32* %s, align 4
  %13 = load i32* %xside, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %14
  %16 = load i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = load i32* %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %19
  %21 = getelementptr inbounds [144 x i32]* %20, i32 0, i64 %17
  %22 = load i32* %21, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x i32]* @std_n_tropism, i32 0, i64 %23
  %25 = load i32* %24, align 4
  %26 = load i32* %s, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, i32* %s, align 4
  %28 = load i32* %2, align 4
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %30, label %33

; <label>:30                                      ; preds = %0
  %31 = load i32* %s, align 4
  %32 = sub nsw i32 0, %31
  store i32 %32, i32* %s, align 4
  br label %33

; <label>:33                                      ; preds = %30, %0
  %34 = load i32* %s, align 4
  ret i32 %34
}

; Function Attrs: nounwind uwtable
define i32 @Pawn(i32 %sq, i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %s = alloca i32, align 4
  %xside = alloca i32, align 4
  store i32 %sq, i32* %1, align 4
  store i32 %c, i32* %2, align 4
  store i32 0, i32* %s, align 4
  %3 = load i32* %2, align 4
  %4 = xor i32 %3, 1
  store i32 %4, i32* %xside, align 4
  %5 = load i32* %s, align 4
  %6 = add nsw i32 %5, 100
  store i32 %6, i32* %s, align 4
  %7 = load i32* %xside, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %13
  %15 = getelementptr inbounds [144 x i32]* %14, i32 0, i64 %11
  %16 = load i32* %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [8 x i32]* @std_p_tropism, i32 0, i64 %17
  %19 = load i32* %18, align 4
  %20 = load i32* %s, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, i32* %s, align 4
  %22 = load i32* %2, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %23
  %25 = load i32* %24, align 4
  %26 = sext i32 %25 to i64
  %27 = load i32* %1, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %28
  %30 = getelementptr inbounds [144 x i32]* %29, i32 0, i64 %26
  %31 = load i32* %30, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [8 x i32]* @std_own_p_tropism, i32 0, i64 %32
  %34 = load i32* %33, align 4
  %35 = load i32* %s, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, i32* %s, align 4
  %37 = load i32* %1, align 4
  %38 = add nsw i32 %37, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %39
  %41 = load i32* %40, align 4
  %42 = add nsw i32 %41, 1
  %43 = ashr i32 %42, 1
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %45, label %58

; <label>:45                                      ; preds = %0
  %46 = load i32* %1, align 4
  %47 = add nsw i32 %46, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %48
  %50 = load i32* %49, align 4
  %51 = add nsw i32 %50, 1
  %52 = and i32 %51, 1
  %53 = load i32* %2, align 4
  %54 = icmp eq i32 %52, %53
  br i1 %54, label %55, label %58

; <label>:55                                      ; preds = %45
  %56 = load i32* %s, align 4
  %57 = add nsw i32 %56, 5
  store i32 %57, i32* %s, align 4
  br label %58

; <label>:58                                      ; preds = %55, %45, %0
  %59 = load i32* %1, align 4
  %60 = add nsw i32 %59, 11
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %61
  %63 = load i32* %62, align 4
  %64 = add nsw i32 %63, 1
  %65 = ashr i32 %64, 1
  %66 = icmp eq i32 %65, 1
  br i1 %66, label %67, label %80

; <label>:67                                      ; preds = %58
  %68 = load i32* %1, align 4
  %69 = add nsw i32 %68, 11
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %70
  %72 = load i32* %71, align 4
  %73 = add nsw i32 %72, 1
  %74 = and i32 %73, 1
  %75 = load i32* %2, align 4
  %76 = icmp eq i32 %74, %75
  br i1 %76, label %77, label %80

; <label>:77                                      ; preds = %67
  %78 = load i32* %s, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %s, align 4
  br label %103

; <label>:80                                      ; preds = %67, %58
  %81 = load i32* %1, align 4
  %82 = add nsw i32 %81, 13
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %83
  %85 = load i32* %84, align 4
  %86 = add nsw i32 %85, 1
  %87 = ashr i32 %86, 1
  %88 = icmp eq i32 %87, 1
  br i1 %88, label %89, label %102

; <label>:89                                      ; preds = %80
  %90 = load i32* %1, align 4
  %91 = add nsw i32 %90, 13
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %92
  %94 = load i32* %93, align 4
  %95 = add nsw i32 %94, 1
  %96 = and i32 %95, 1
  %97 = load i32* %2, align 4
  %98 = icmp eq i32 %96, %97
  br i1 %98, label %99, label %102

; <label>:99                                      ; preds = %89
  %100 = load i32* %s, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %s, align 4
  br label %102

; <label>:102                                     ; preds = %99, %89, %80
  br label %103

; <label>:103                                     ; preds = %102, %77
  %104 = load i32* %2, align 4
  %105 = icmp eq i32 %104, 1
  br i1 %105, label %106, label %109

; <label>:106                                     ; preds = %103
  %107 = load i32* %s, align 4
  %108 = sub nsw i32 0, %107
  store i32 %108, i32* %s, align 4
  br label %109

; <label>:109                                     ; preds = %106, %103
  %110 = load i32* %s, align 4
  ret i32 %110
}

; Function Attrs: nounwind uwtable
define i32 @ErrorIt(i32 %sq, i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %sq, i32* %1, align 4
  store i32 %c, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str, i32 0, i32 0), i32 %3, i32 %4)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @std_eval(i32 %alpha, i32 %beta) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca i32, align 4
  %pawn_file = alloca i32, align 4
  %pawns = alloca [2 x [11 x i32]], align 16
  %white_back_pawn = alloca [11 x i32], align 16
  %black_back_pawn = alloca [11 x i32], align 16
  %srank = alloca i32, align 4
  %wking_pawn_file = alloca i32, align 4
  %bking_pawn_file = alloca i32, align 4
  %j = alloca i32, align 4
  %score = alloca i32, align 4
  %isolated = alloca i32, align 4
  %backwards = alloca i32, align 4
  %in_cache = alloca i32, align 4
  %wp = alloca i32, align 4
  %bp = alloca i32, align 4
  %wn = alloca i32, align 4
  %bn = alloca i32, align 4
  %wb = alloca i32, align 4
  %bb = alloca i32, align 4
  %wq = alloca i32, align 4
  %bq = alloca i32, align 4
  %wr = alloca i32, align 4
  %br = alloca i32, align 4
  %rbrook = alloca i32, align 4
  %fbrook = alloca i32, align 4
  %rwrook = alloca i32, align 4
  %fwrook = alloca i32, align 4
  %wpotential = alloca i32, align 4
  %bpotential = alloca i32, align 4
  %tmp = alloca i32, align 4
  %wksafety = alloca i32, align 4
  %bksafety = alloca i32, align 4
  store i32 %alpha, i32* %2, align 4
  store i32 %beta, i32* %3, align 4
  store i32 0, i32* %score, align 4
  %4 = load i32* @white_to_move, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load i32* @Material, align 4
  br label %11

; <label>:8                                       ; preds = %0
  %9 = load i32* @Material, align 4
  %10 = sub nsw i32 0, %9
  br label %11

; <label>:11                                      ; preds = %8, %6
  %12 = phi i32 [ %7, %6 ], [ %10, %8 ]
  %13 = load i32* @maxposdiff, align 4
  %14 = sub nsw i32 %12, %13
  %15 = load i32* %3, align 4
  %16 = icmp sge i32 %14, %15
  br i1 %16, label %17, label %29

; <label>:17                                      ; preds = %11
  %18 = load i32* @white_to_move, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %17
  %21 = load i32* @Material, align 4
  br label %25

; <label>:22                                      ; preds = %17
  %23 = load i32* @Material, align 4
  %24 = sub nsw i32 0, %23
  br label %25

; <label>:25                                      ; preds = %22, %20
  %26 = phi i32 [ %21, %20 ], [ %24, %22 ]
  %27 = load i32* @maxposdiff, align 4
  %28 = sub nsw i32 %26, %27
  store i32 %28, i32* %1
  br label %2094

; <label>:29                                      ; preds = %11
  %30 = load i32* @white_to_move, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32                                      ; preds = %29
  %33 = load i32* @Material, align 4
  br label %37

; <label>:34                                      ; preds = %29
  %35 = load i32* @Material, align 4
  %36 = sub nsw i32 0, %35
  br label %37

; <label>:37                                      ; preds = %34, %32
  %38 = phi i32 [ %33, %32 ], [ %36, %34 ]
  %39 = load i32* @maxposdiff, align 4
  %40 = add nsw i32 %38, %39
  %41 = load i32* %2, align 4
  %42 = icmp sle i32 %40, %41
  br i1 %42, label %43, label %55

; <label>:43                                      ; preds = %37
  %44 = load i32* @white_to_move, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %48

; <label>:46                                      ; preds = %43
  %47 = load i32* @Material, align 4
  br label %51

; <label>:48                                      ; preds = %43
  %49 = load i32* @Material, align 4
  %50 = sub nsw i32 0, %49
  br label %51

; <label>:51                                      ; preds = %48, %46
  %52 = phi i32 [ %47, %46 ], [ %50, %48 ]
  %53 = load i32* @maxposdiff, align 4
  %54 = add nsw i32 %52, %53
  store i32 %54, i32* %1
  br label %2094

; <label>:55                                      ; preds = %37
  store i32 0, i32* %in_cache, align 4
  call void @checkECache(i32* %score, i32* %in_cache)
  %56 = load i32* %in_cache, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %66

; <label>:58                                      ; preds = %55
  %59 = load i32* @white_to_move, align 4
  %60 = icmp eq i32 %59, 1
  br i1 %60, label %61, label %63

; <label>:61                                      ; preds = %58
  %62 = load i32* %score, align 4
  store i32 %62, i32* %1
  br label %2094

; <label>:63                                      ; preds = %58
  %64 = load i32* %score, align 4
  %65 = sub nsw i32 0, %64
  store i32 %65, i32* %1
  br label %2094

; <label>:66                                      ; preds = %55
  %67 = bitcast [2 x [11 x i32]]* %pawns to i8*
  call void @llvm.memset.p0i8.i64(i8* %67, i8 0, i64 88, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %68

; <label>:68                                      ; preds = %78, %66
  %69 = load i32* %i, align 4
  %70 = icmp slt i32 %69, 11
  br i1 %70, label %71, label %81

; <label>:71                                      ; preds = %68
  %72 = load i32* %i, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %73
  store i32 7, i32* %74, align 4
  %75 = load i32* %i, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %76
  store i32 2, i32* %77, align 4
  br label %78

; <label>:78                                      ; preds = %71
  %79 = load i32* %i, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %i, align 4
  br label %68

; <label>:81                                      ; preds = %68
  store i32 0, i32* @wmat, align 4
  store i32 0, i32* @bmat, align 4
  %82 = load i32* @wking_loc, align 4
  store i32 %82, i32* getelementptr inbounds ([2 x i32]* @king_locs, i32 0, i64 0), align 4
  %83 = load i32* @bking_loc, align 4
  store i32 %83, i32* getelementptr inbounds ([2 x i32]* @king_locs, i32 0, i64 1), align 4
  store i32 1, i32* %j, align 4
  store i32 1, i32* %a, align 4
  br label %84

; <label>:84                                      ; preds = %219, %81
  %85 = load i32* %a, align 4
  %86 = load i32* @piece_count, align 4
  %87 = icmp sle i32 %85, %86
  br i1 %87, label %88, label %222

; <label>:88                                      ; preds = %84
  %89 = load i32* %j, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [62 x i32]* @pieces, i32 0, i64 %90
  %92 = load i32* %91, align 4
  store i32 %92, i32* %i, align 4
  %93 = load i32* %i, align 4
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %96, label %95

; <label>:95                                      ; preds = %88
  br label %219

; <label>:96                                      ; preds = %88
  %97 = load i32* %a, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %a, align 4
  br label %99

; <label>:99                                      ; preds = %96
  %100 = load i32* %i, align 4
  %101 = icmp sgt i32 %100, 0
  br i1 %101, label %102, label %106

; <label>:102                                     ; preds = %99
  %103 = load i32* %i, align 4
  %104 = icmp slt i32 %103, 145
  br i1 %104, label %105, label %106

; <label>:105                                     ; preds = %102
  br label %108

; <label>:106                                     ; preds = %102, %99
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i32 440, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.std_eval, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %108

; <label>:108                                     ; preds = %107, %105
  %109 = load i32* %i, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %110
  %112 = load i32* %111, align 4
  %113 = add nsw i32 %112, 1
  %114 = ashr i32 %113, 1
  %115 = icmp ne i32 %114, 1
  br i1 %115, label %116, label %154

; <label>:116                                     ; preds = %108
  %117 = load i32* %i, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %118
  %120 = load i32* %119, align 4
  %121 = add nsw i32 %120, 1
  %122 = ashr i32 %121, 1
  %123 = icmp ne i32 %122, 3
  br i1 %123, label %124, label %154

; <label>:124                                     ; preds = %116
  %125 = load i32* %i, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %126
  %128 = load i32* %127, align 4
  %129 = add nsw i32 %128, 1
  %130 = and i32 %129, 1
  %131 = icmp eq i32 %130, 0
  br i1 %131, label %132, label %142

; <label>:132                                     ; preds = %124
  %133 = load i32* %i, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %134
  %136 = load i32* %135, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [14 x i32]* @material, i32 0, i64 %137
  %139 = load i32* %138, align 4
  %140 = load i32* @wmat, align 4
  %141 = add nsw i32 %140, %139
  store i32 %141, i32* @wmat, align 4
  br label %153

; <label>:142                                     ; preds = %124
  %143 = load i32* %i, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %144
  %146 = load i32* %145, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [14 x i32]* @material, i32 0, i64 %147
  %149 = load i32* %148, align 4
  %150 = call i32 @abs(i32 %149) #6
  %151 = load i32* @bmat, align 4
  %152 = add nsw i32 %151, %150
  store i32 %152, i32* @bmat, align 4
  br label %153

; <label>:153                                     ; preds = %142, %132
  br label %154

; <label>:154                                     ; preds = %153, %116, %108
  %155 = load i32* %i, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %156
  %158 = load i32* %157, align 4
  %159 = add nsw i32 %158, 1
  %160 = ashr i32 %159, 1
  %161 = icmp eq i32 %160, 1
  br i1 %161, label %162, label %218

; <label>:162                                     ; preds = %154
  %163 = load i32* %i, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %164
  %166 = load i32* %165, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, i32* %pawn_file, align 4
  %168 = load i32* %i, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %169
  %171 = load i32* %170, align 4
  store i32 %171, i32* %srank, align 4
  %172 = load i32* %i, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %173
  %175 = load i32* %174, align 4
  %176 = add nsw i32 %175, 1
  %177 = and i32 %176, 1
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %179, label %198

; <label>:179                                     ; preds = %162
  %180 = load i32* %pawn_file, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %183 = getelementptr inbounds [11 x i32]* %182, i32 0, i64 %181
  %184 = load i32* %183, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %183, align 4
  %186 = load i32* %srank, align 4
  %187 = load i32* %pawn_file, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %188
  %190 = load i32* %189, align 4
  %191 = icmp slt i32 %186, %190
  br i1 %191, label %192, label %197

; <label>:192                                     ; preds = %179
  %193 = load i32* %srank, align 4
  %194 = load i32* %pawn_file, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %195
  store i32 %193, i32* %196, align 4
  br label %197

; <label>:197                                     ; preds = %192, %179
  br label %217

; <label>:198                                     ; preds = %162
  %199 = load i32* %pawn_file, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %202 = getelementptr inbounds [11 x i32]* %201, i32 0, i64 %200
  %203 = load i32* %202, align 4
  %204 = add nsw i32 %203, 1
  store i32 %204, i32* %202, align 4
  %205 = load i32* %srank, align 4
  %206 = load i32* %pawn_file, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %207
  %209 = load i32* %208, align 4
  %210 = icmp sgt i32 %205, %209
  br i1 %210, label %211, label %216

; <label>:211                                     ; preds = %198
  %212 = load i32* %srank, align 4
  %213 = load i32* %pawn_file, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %214
  store i32 %212, i32* %215, align 4
  br label %216

; <label>:216                                     ; preds = %211, %198
  br label %217

; <label>:217                                     ; preds = %216, %197
  br label %218

; <label>:218                                     ; preds = %217, %154
  br label %219

; <label>:219                                     ; preds = %218, %95
  %220 = load i32* %j, align 4
  %221 = add nsw i32 %220, 1
  store i32 %221, i32* %j, align 4
  br label %84

; <label>:222                                     ; preds = %84
  store i32 0, i32* %wpotential, align 4
  store i32 0, i32* %bpotential, align 4
  store i32 0, i32* %wksafety, align 4
  store i32 0, i32* %bksafety, align 4
  store i32 0, i32* %rbrook, align 4
  store i32 0, i32* %fbrook, align 4
  store i32 0, i32* %rwrook, align 4
  store i32 0, i32* %fwrook, align 4
  store i32 0, i32* %wp, align 4
  store i32 0, i32* %bp, align 4
  store i32 0, i32* %wb, align 4
  store i32 0, i32* %bb, align 4
  store i32 0, i32* %wn, align 4
  store i32 0, i32* %bn, align 4
  store i32 0, i32* %wr, align 4
  store i32 0, i32* %br, align 4
  store i32 0, i32* %wq, align 4
  store i32 0, i32* %bq, align 4
  store i32 1, i32* %j, align 4
  store i32 1, i32* %a, align 4
  br label %223

; <label>:223                                     ; preds = %1531, %222
  %224 = load i32* %a, align 4
  %225 = load i32* @piece_count, align 4
  %226 = icmp sle i32 %224, %225
  br i1 %226, label %227, label %1534

; <label>:227                                     ; preds = %223
  %228 = load i32* %j, align 4
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [62 x i32]* @pieces, i32 0, i64 %229
  %231 = load i32* %230, align 4
  store i32 %231, i32* %i, align 4
  %232 = load i32* %i, align 4
  %233 = icmp ne i32 %232, 0
  br i1 %233, label %235, label %234

; <label>:234                                     ; preds = %227
  br label %1531

; <label>:235                                     ; preds = %227
  %236 = load i32* %a, align 4
  %237 = add nsw i32 %236, 1
  store i32 %237, i32* %a, align 4
  br label %238

; <label>:238                                     ; preds = %235
  %239 = load i32* %i, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %240
  %242 = load i32* %241, align 4
  %243 = add nsw i32 %242, 1
  %244 = ashr i32 %243, 1
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [7 x i32 (i32, i32)*]* @evalRoutines, i32 0, i64 %245
  %247 = load i32 (i32, i32)** %246, align 8
  %248 = load i32* %i, align 4
  %249 = load i32* %i, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %250
  %252 = load i32* %251, align 4
  %253 = add nsw i32 %252, 1
  %254 = and i32 %253, 1
  %255 = call i32 %247(i32 %248, i32 %254)
  %256 = load i32* %score, align 4
  %257 = add nsw i32 %256, %255
  store i32 %257, i32* %score, align 4
  %258 = load i32* %i, align 4
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %259
  %261 = load i32* %260, align 4
  %262 = add nsw i32 %261, 1
  store i32 %262, i32* %pawn_file, align 4
  %263 = load i32* %i, align 4
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %264
  %266 = load i32* %265, align 4
  store i32 %266, i32* %srank, align 4
  %267 = load i32* %i, align 4
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %268
  %270 = load i32* %269, align 4
  switch i32 %270, label %1530 [
    i32 1, label %271
    i32 2, label %669
    i32 7, label %1069
    i32 8, label %1132
    i32 11, label %1195
    i32 12, label %1198
    i32 3, label %1201
    i32 4, label %1204
    i32 9, label %1207
    i32 10, label %1210
    i32 5, label %1213
    i32 6, label %1367
  ]

; <label>:271                                     ; preds = %238
  store i32 0, i32* %isolated, align 4
  store i32 0, i32* %backwards, align 4
  %272 = load i32* %i, align 4
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [144 x i32]* @swhite_pawn, i32 0, i64 %273
  %275 = load i32* %274, align 4
  %276 = load i32* %score, align 4
  %277 = add nsw i32 %276, %275
  store i32 %277, i32* %score, align 4
  %278 = load i32* %wp, align 4
  %279 = add nsw i32 %278, 1
  store i32 %279, i32* %wp, align 4
  %280 = load i32* %pawn_file, align 4
  %281 = add nsw i32 %280, 1
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %282
  %284 = load i32* %283, align 4
  %285 = load i32* %srank, align 4
  %286 = icmp sgt i32 %284, %285
  br i1 %286, label %287, label %317

; <label>:287                                     ; preds = %271
  %288 = load i32* %pawn_file, align 4
  %289 = sub nsw i32 %288, 1
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %290
  %292 = load i32* %291, align 4
  %293 = load i32* %srank, align 4
  %294 = icmp sgt i32 %292, %293
  br i1 %294, label %295, label %317

; <label>:295                                     ; preds = %287
  %296 = load i32* %score, align 4
  %297 = sub nsw i32 %296, 8
  store i32 %297, i32* %score, align 4
  store i32 1, i32* %backwards, align 4
  %298 = load i32* %pawn_file, align 4
  %299 = add nsw i32 %298, 1
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %302 = getelementptr inbounds [11 x i32]* %301, i32 0, i64 %300
  %303 = load i32* %302, align 4
  %304 = icmp ne i32 %303, 0
  br i1 %304, label %316, label %305

; <label>:305                                     ; preds = %295
  %306 = load i32* %pawn_file, align 4
  %307 = sub nsw i32 %306, 1
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %310 = getelementptr inbounds [11 x i32]* %309, i32 0, i64 %308
  %311 = load i32* %310, align 4
  %312 = icmp ne i32 %311, 0
  br i1 %312, label %316, label %313

; <label>:313                                     ; preds = %305
  %314 = load i32* %score, align 4
  %315 = sub nsw i32 %314, 5
  store i32 %315, i32* %score, align 4
  store i32 1, i32* %isolated, align 4
  br label %316

; <label>:316                                     ; preds = %313, %305, %295
  br label %317

; <label>:317                                     ; preds = %316, %287, %271
  %318 = load i32* %pawn_file, align 4
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %321 = getelementptr inbounds [11 x i32]* %320, i32 0, i64 %319
  %322 = load i32* %321, align 4
  %323 = icmp ne i32 %322, 0
  br i1 %323, label %337, label %324

; <label>:324                                     ; preds = %317
  %325 = load i32* %backwards, align 4
  %326 = icmp ne i32 %325, 0
  br i1 %326, label %327, label %330

; <label>:327                                     ; preds = %324
  %328 = load i32* %score, align 4
  %329 = sub nsw i32 %328, 3
  store i32 %329, i32* %score, align 4
  br label %330

; <label>:330                                     ; preds = %327, %324
  %331 = load i32* %isolated, align 4
  %332 = icmp ne i32 %331, 0
  br i1 %332, label %333, label %336

; <label>:333                                     ; preds = %330
  %334 = load i32* %score, align 4
  %335 = sub nsw i32 %334, 5
  store i32 %335, i32* %score, align 4
  br label %336

; <label>:336                                     ; preds = %333, %330
  br label %337

; <label>:337                                     ; preds = %336, %317
  %338 = load i32* %pawn_file, align 4
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %341 = getelementptr inbounds [11 x i32]* %340, i32 0, i64 %339
  %342 = load i32* %341, align 4
  %343 = icmp sgt i32 %342, 1
  br i1 %343, label %344, label %354

; <label>:344                                     ; preds = %337
  %345 = load i32* %pawn_file, align 4
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %348 = getelementptr inbounds [11 x i32]* %347, i32 0, i64 %346
  %349 = load i32* %348, align 4
  %350 = sub nsw i32 %349, 1
  %351 = mul nsw i32 3, %350
  %352 = load i32* %score, align 4
  %353 = sub nsw i32 %352, %351
  store i32 %353, i32* %score, align 4
  br label %354

; <label>:354                                     ; preds = %344, %337
  %355 = load i32* %pawn_file, align 4
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %358 = getelementptr inbounds [11 x i32]* %357, i32 0, i64 %356
  %359 = load i32* %358, align 4
  %360 = icmp ne i32 %359, 0
  br i1 %360, label %657, label %361

; <label>:361                                     ; preds = %354
  %362 = load i32* %srank, align 4
  %363 = load i32* %pawn_file, align 4
  %364 = sub nsw i32 %363, 1
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %365
  %367 = load i32* %366, align 4
  %368 = icmp sge i32 %362, %367
  br i1 %368, label %369, label %657

; <label>:369                                     ; preds = %361
  %370 = load i32* %srank, align 4
  %371 = load i32* %pawn_file, align 4
  %372 = add nsw i32 %371, 1
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %373
  %375 = load i32* %374, align 4
  %376 = icmp sge i32 %370, %375
  br i1 %376, label %377, label %657

; <label>:377                                     ; preds = %369
  %378 = load i32* %i, align 4
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds [144 x i32]* @swhite_pawn, i32 0, i64 %379
  %381 = load i32* %380, align 4
  %382 = mul nsw i32 3, %381
  %383 = add nsw i32 30, %382
  %384 = load i32* %score, align 4
  %385 = add nsw i32 %384, %383
  store i32 %385, i32* %score, align 4
  %386 = load i32* @white_to_move, align 4
  %387 = icmp ne i32 %386, 0
  br i1 %387, label %388, label %455

; <label>:388                                     ; preds = %377
  %389 = load i32* %i, align 4
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %390
  %392 = load i32* %391, align 4
  %393 = add nsw i32 110, %392
  %394 = sub nsw i32 %393, 1
  store i32 %394, i32* %tmp, align 4
  %395 = load i32* @bking_loc, align 4
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %396
  %398 = load i32* %397, align 4
  %399 = load i32* %tmp, align 4
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %400
  %402 = load i32* %401, align 4
  %403 = sub nsw i32 %398, %402
  %404 = call i32 @abs(i32 %403) #6
  %405 = load i32* @bking_loc, align 4
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %406
  %408 = load i32* %407, align 4
  %409 = load i32* %tmp, align 4
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %410
  %412 = load i32* %411, align 4
  %413 = sub nsw i32 %408, %412
  %414 = call i32 @abs(i32 %413) #6
  %415 = icmp sgt i32 %404, %414
  br i1 %415, label %416, label %427

; <label>:416                                     ; preds = %388
  %417 = load i32* @bking_loc, align 4
  %418 = sext i32 %417 to i64
  %419 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %418
  %420 = load i32* %419, align 4
  %421 = load i32* %tmp, align 4
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %422
  %424 = load i32* %423, align 4
  %425 = sub nsw i32 %420, %424
  %426 = call i32 @abs(i32 %425) #6
  br label %438

; <label>:427                                     ; preds = %388
  %428 = load i32* @bking_loc, align 4
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %429
  %431 = load i32* %430, align 4
  %432 = load i32* %tmp, align 4
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %433
  %435 = load i32* %434, align 4
  %436 = sub nsw i32 %431, %435
  %437 = call i32 @abs(i32 %436) #6
  br label %438

; <label>:438                                     ; preds = %427, %416
  %439 = phi i32 [ %426, %416 ], [ %437, %427 ]
  %440 = load i32* %tmp, align 4
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %441
  %443 = load i32* %442, align 4
  %444 = load i32* %i, align 4
  %445 = sext i32 %444 to i64
  %446 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %445
  %447 = load i32* %446, align 4
  %448 = sub nsw i32 %443, %447
  %449 = call i32 @abs(i32 %448) #6
  %450 = icmp sgt i32 %439, %449
  br i1 %450, label %451, label %454

; <label>:451                                     ; preds = %438
  %452 = load i32* %wpotential, align 4
  %453 = add nsw i32 %452, 800
  store i32 %453, i32* %wpotential, align 4
  br label %454

; <label>:454                                     ; preds = %451, %438
  br label %523

; <label>:455                                     ; preds = %377
  %456 = load i32* %i, align 4
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %457
  %459 = load i32* %458, align 4
  %460 = add nsw i32 110, %459
  %461 = sub nsw i32 %460, 1
  store i32 %461, i32* %tmp, align 4
  %462 = load i32* @bking_loc, align 4
  %463 = sext i32 %462 to i64
  %464 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %463
  %465 = load i32* %464, align 4
  %466 = load i32* %tmp, align 4
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %467
  %469 = load i32* %468, align 4
  %470 = sub nsw i32 %465, %469
  %471 = call i32 @abs(i32 %470) #6
  %472 = load i32* @bking_loc, align 4
  %473 = sext i32 %472 to i64
  %474 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %473
  %475 = load i32* %474, align 4
  %476 = load i32* %tmp, align 4
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %477
  %479 = load i32* %478, align 4
  %480 = sub nsw i32 %475, %479
  %481 = call i32 @abs(i32 %480) #6
  %482 = icmp sgt i32 %471, %481
  br i1 %482, label %483, label %494

; <label>:483                                     ; preds = %455
  %484 = load i32* @bking_loc, align 4
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %485
  %487 = load i32* %486, align 4
  %488 = load i32* %tmp, align 4
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %489
  %491 = load i32* %490, align 4
  %492 = sub nsw i32 %487, %491
  %493 = call i32 @abs(i32 %492) #6
  br label %505

; <label>:494                                     ; preds = %455
  %495 = load i32* @bking_loc, align 4
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %496
  %498 = load i32* %497, align 4
  %499 = load i32* %tmp, align 4
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %500
  %502 = load i32* %501, align 4
  %503 = sub nsw i32 %498, %502
  %504 = call i32 @abs(i32 %503) #6
  br label %505

; <label>:505                                     ; preds = %494, %483
  %506 = phi i32 [ %493, %483 ], [ %504, %494 ]
  %507 = sub nsw i32 %506, 1
  %508 = load i32* %tmp, align 4
  %509 = sext i32 %508 to i64
  %510 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %509
  %511 = load i32* %510, align 4
  %512 = load i32* %i, align 4
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %513
  %515 = load i32* %514, align 4
  %516 = sub nsw i32 %511, %515
  %517 = call i32 @abs(i32 %516) #6
  %518 = icmp sgt i32 %507, %517
  br i1 %518, label %519, label %522

; <label>:519                                     ; preds = %505
  %520 = load i32* %wpotential, align 4
  %521 = add nsw i32 %520, 800
  store i32 %521, i32* %wpotential, align 4
  br label %522

; <label>:522                                     ; preds = %519, %505
  br label %523

; <label>:523                                     ; preds = %522, %454
  %524 = load i32* %i, align 4
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %525
  %527 = load i32* %526, align 4
  %528 = icmp eq i32 %527, 1
  br i1 %528, label %535, label %529

; <label>:529                                     ; preds = %523
  %530 = load i32* %i, align 4
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %531
  %533 = load i32* %532, align 4
  %534 = icmp eq i32 %533, 8
  br i1 %534, label %535, label %544

; <label>:535                                     ; preds = %529, %523
  %536 = load i32* %i, align 4
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds [144 x i32]* @swhite_pawn, i32 0, i64 %537
  %539 = load i32* %538, align 4
  %540 = mul nsw i32 2, %539
  %541 = add nsw i32 12, %540
  %542 = load i32* %score, align 4
  %543 = add nsw i32 %542, %541
  store i32 %543, i32* %score, align 4
  br label %544

; <label>:544                                     ; preds = %535, %529
  %545 = load i32* %isolated, align 4
  %546 = icmp ne i32 %545, 0
  br i1 %546, label %656, label %547

; <label>:547                                     ; preds = %544
  %548 = load i32* %score, align 4
  %549 = add nsw i32 %548, 12
  store i32 %549, i32* %score, align 4
  %550 = load i32* %pawn_file, align 4
  %551 = add nsw i32 %550, 1
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %554 = getelementptr inbounds [11 x i32]* %553, i32 0, i64 %552
  %555 = load i32* %554, align 4
  %556 = icmp ne i32 %555, 0
  br i1 %556, label %557, label %602

; <label>:557                                     ; preds = %547
  %558 = load i32* %pawn_file, align 4
  %559 = add nsw i32 %558, 1
  %560 = sext i32 %559 to i64
  %561 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %562 = getelementptr inbounds [11 x i32]* %561, i32 0, i64 %560
  %563 = load i32* %562, align 4
  %564 = icmp ne i32 %563, 0
  br i1 %564, label %601, label %565

; <label>:565                                     ; preds = %557
  %566 = load i32* %pawn_file, align 4
  %567 = add nsw i32 %566, 1
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %568
  %570 = load i32* %569, align 4
  %571 = load i32* %pawn_file, align 4
  %572 = add nsw i32 %571, 2
  %573 = sext i32 %572 to i64
  %574 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %573
  %575 = load i32* %574, align 4
  %576 = icmp sge i32 %570, %575
  br i1 %576, label %577, label %601

; <label>:577                                     ; preds = %565
  %578 = load i32* %i, align 4
  %579 = sext i32 %578 to i64
  %580 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %579
  %581 = load i32* %580, align 4
  %582 = mul nsw i32 7, %581
  %583 = load i32* %score, align 4
  %584 = add nsw i32 %583, %582
  store i32 %584, i32* %score, align 4
  %585 = load i32* %i, align 4
  %586 = sext i32 %585 to i64
  %587 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %586
  %588 = load i32* %587, align 4
  %589 = icmp eq i32 %588, 7
  br i1 %589, label %590, label %600

; <label>:590                                     ; preds = %577
  %591 = load i32* %pawn_file, align 4
  %592 = add nsw i32 %591, 1
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %593
  %595 = load i32* %594, align 4
  %596 = icmp sge i32 %595, 6
  br i1 %596, label %597, label %600

; <label>:597                                     ; preds = %590
  %598 = load i32* %score, align 4
  %599 = add nsw i32 %598, 50
  store i32 %599, i32* %score, align 4
  br label %600

; <label>:600                                     ; preds = %597, %590, %577
  br label %601

; <label>:601                                     ; preds = %600, %565, %557
  br label %602

; <label>:602                                     ; preds = %601, %547
  %603 = load i32* %pawn_file, align 4
  %604 = sub nsw i32 %603, 1
  %605 = sext i32 %604 to i64
  %606 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %607 = getelementptr inbounds [11 x i32]* %606, i32 0, i64 %605
  %608 = load i32* %607, align 4
  %609 = icmp ne i32 %608, 0
  br i1 %609, label %610, label %655

; <label>:610                                     ; preds = %602
  %611 = load i32* %pawn_file, align 4
  %612 = sub nsw i32 %611, 1
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %615 = getelementptr inbounds [11 x i32]* %614, i32 0, i64 %613
  %616 = load i32* %615, align 4
  %617 = icmp ne i32 %616, 0
  br i1 %617, label %654, label %618

; <label>:618                                     ; preds = %610
  %619 = load i32* %pawn_file, align 4
  %620 = add nsw i32 %619, 1
  %621 = sext i32 %620 to i64
  %622 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %621
  %623 = load i32* %622, align 4
  %624 = load i32* %pawn_file, align 4
  %625 = sub nsw i32 %624, 2
  %626 = sext i32 %625 to i64
  %627 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %626
  %628 = load i32* %627, align 4
  %629 = icmp sge i32 %623, %628
  br i1 %629, label %630, label %654

; <label>:630                                     ; preds = %618
  %631 = load i32* %i, align 4
  %632 = sext i32 %631 to i64
  %633 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %632
  %634 = load i32* %633, align 4
  %635 = mul nsw i32 7, %634
  %636 = load i32* %score, align 4
  %637 = add nsw i32 %636, %635
  store i32 %637, i32* %score, align 4
  %638 = load i32* %i, align 4
  %639 = sext i32 %638 to i64
  %640 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %639
  %641 = load i32* %640, align 4
  %642 = icmp eq i32 %641, 7
  br i1 %642, label %643, label %653

; <label>:643                                     ; preds = %630
  %644 = load i32* %pawn_file, align 4
  %645 = sub nsw i32 %644, 1
  %646 = sext i32 %645 to i64
  %647 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %646
  %648 = load i32* %647, align 4
  %649 = icmp sge i32 %648, 6
  br i1 %649, label %650, label %653

; <label>:650                                     ; preds = %643
  %651 = load i32* %score, align 4
  %652 = add nsw i32 %651, 50
  store i32 %652, i32* %score, align 4
  br label %653

; <label>:653                                     ; preds = %650, %643, %630
  br label %654

; <label>:654                                     ; preds = %653, %618, %610
  br label %655

; <label>:655                                     ; preds = %654, %602
  br label %656

; <label>:656                                     ; preds = %655, %544
  br label %657

; <label>:657                                     ; preds = %656, %369, %361, %354
  %658 = load i32* %pawn_file, align 4
  %659 = sub nsw i32 %658, 1
  %660 = sext i32 %659 to i64
  %661 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %662 = getelementptr inbounds [11 x i32]* %661, i32 0, i64 %660
  %663 = load i32* %662, align 4
  %664 = icmp ne i32 %663, 0
  br i1 %664, label %668, label %665

; <label>:665                                     ; preds = %657
  %666 = load i32* %score, align 4
  %667 = sub nsw i32 %666, 7
  store i32 %667, i32* %score, align 4
  br label %668

; <label>:668                                     ; preds = %665, %657
  br label %1530

; <label>:669                                     ; preds = %238
  store i32 0, i32* %isolated, align 4
  store i32 0, i32* %backwards, align 4
  %670 = load i32* %i, align 4
  %671 = sext i32 %670 to i64
  %672 = getelementptr inbounds [144 x i32]* @sblack_pawn, i32 0, i64 %671
  %673 = load i32* %672, align 4
  %674 = load i32* %score, align 4
  %675 = sub nsw i32 %674, %673
  store i32 %675, i32* %score, align 4
  %676 = load i32* %bp, align 4
  %677 = add nsw i32 %676, 1
  store i32 %677, i32* %bp, align 4
  %678 = load i32* %pawn_file, align 4
  %679 = add nsw i32 %678, 1
  %680 = sext i32 %679 to i64
  %681 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %680
  %682 = load i32* %681, align 4
  %683 = load i32* %srank, align 4
  %684 = icmp slt i32 %682, %683
  br i1 %684, label %685, label %715

; <label>:685                                     ; preds = %669
  %686 = load i32* %pawn_file, align 4
  %687 = sub nsw i32 %686, 1
  %688 = sext i32 %687 to i64
  %689 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %688
  %690 = load i32* %689, align 4
  %691 = load i32* %srank, align 4
  %692 = icmp slt i32 %690, %691
  br i1 %692, label %693, label %715

; <label>:693                                     ; preds = %685
  %694 = load i32* %score, align 4
  %695 = add nsw i32 %694, 8
  store i32 %695, i32* %score, align 4
  store i32 1, i32* %backwards, align 4
  %696 = load i32* %pawn_file, align 4
  %697 = add nsw i32 %696, 1
  %698 = sext i32 %697 to i64
  %699 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %700 = getelementptr inbounds [11 x i32]* %699, i32 0, i64 %698
  %701 = load i32* %700, align 4
  %702 = icmp ne i32 %701, 0
  br i1 %702, label %714, label %703

; <label>:703                                     ; preds = %693
  %704 = load i32* %pawn_file, align 4
  %705 = sub nsw i32 %704, 1
  %706 = sext i32 %705 to i64
  %707 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %708 = getelementptr inbounds [11 x i32]* %707, i32 0, i64 %706
  %709 = load i32* %708, align 4
  %710 = icmp ne i32 %709, 0
  br i1 %710, label %714, label %711

; <label>:711                                     ; preds = %703
  %712 = load i32* %score, align 4
  %713 = add nsw i32 %712, 5
  store i32 %713, i32* %score, align 4
  store i32 1, i32* %isolated, align 4
  br label %714

; <label>:714                                     ; preds = %711, %703, %693
  br label %715

; <label>:715                                     ; preds = %714, %685, %669
  %716 = load i32* %pawn_file, align 4
  %717 = sext i32 %716 to i64
  %718 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %719 = getelementptr inbounds [11 x i32]* %718, i32 0, i64 %717
  %720 = load i32* %719, align 4
  %721 = icmp ne i32 %720, 0
  br i1 %721, label %735, label %722

; <label>:722                                     ; preds = %715
  %723 = load i32* %backwards, align 4
  %724 = icmp ne i32 %723, 0
  br i1 %724, label %725, label %728

; <label>:725                                     ; preds = %722
  %726 = load i32* %score, align 4
  %727 = add nsw i32 %726, 3
  store i32 %727, i32* %score, align 4
  br label %728

; <label>:728                                     ; preds = %725, %722
  %729 = load i32* %isolated, align 4
  %730 = icmp ne i32 %729, 0
  br i1 %730, label %731, label %734

; <label>:731                                     ; preds = %728
  %732 = load i32* %score, align 4
  %733 = add nsw i32 %732, 5
  store i32 %733, i32* %score, align 4
  br label %734

; <label>:734                                     ; preds = %731, %728
  br label %735

; <label>:735                                     ; preds = %734, %715
  %736 = load i32* %pawn_file, align 4
  %737 = sext i32 %736 to i64
  %738 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %739 = getelementptr inbounds [11 x i32]* %738, i32 0, i64 %737
  %740 = load i32* %739, align 4
  %741 = icmp sgt i32 %740, 1
  br i1 %741, label %742, label %752

; <label>:742                                     ; preds = %735
  %743 = load i32* %pawn_file, align 4
  %744 = sext i32 %743 to i64
  %745 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %746 = getelementptr inbounds [11 x i32]* %745, i32 0, i64 %744
  %747 = load i32* %746, align 4
  %748 = sub nsw i32 %747, 1
  %749 = mul nsw i32 3, %748
  %750 = load i32* %score, align 4
  %751 = add nsw i32 %750, %749
  store i32 %751, i32* %score, align 4
  br label %752

; <label>:752                                     ; preds = %742, %735
  %753 = load i32* %pawn_file, align 4
  %754 = sext i32 %753 to i64
  %755 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %756 = getelementptr inbounds [11 x i32]* %755, i32 0, i64 %754
  %757 = load i32* %756, align 4
  %758 = icmp ne i32 %757, 0
  br i1 %758, label %1057, label %759

; <label>:759                                     ; preds = %752
  %760 = load i32* %srank, align 4
  %761 = load i32* %pawn_file, align 4
  %762 = sub nsw i32 %761, 1
  %763 = sext i32 %762 to i64
  %764 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %763
  %765 = load i32* %764, align 4
  %766 = icmp sle i32 %760, %765
  br i1 %766, label %767, label %1057

; <label>:767                                     ; preds = %759
  %768 = load i32* %srank, align 4
  %769 = load i32* %pawn_file, align 4
  %770 = add nsw i32 %769, 1
  %771 = sext i32 %770 to i64
  %772 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %771
  %773 = load i32* %772, align 4
  %774 = icmp sle i32 %768, %773
  br i1 %774, label %775, label %1057

; <label>:775                                     ; preds = %767
  %776 = load i32* %i, align 4
  %777 = sext i32 %776 to i64
  %778 = getelementptr inbounds [144 x i32]* @sblack_pawn, i32 0, i64 %777
  %779 = load i32* %778, align 4
  %780 = mul nsw i32 3, %779
  %781 = add nsw i32 30, %780
  %782 = load i32* %score, align 4
  %783 = sub nsw i32 %782, %781
  store i32 %783, i32* %score, align 4
  %784 = load i32* @white_to_move, align 4
  %785 = icmp ne i32 %784, 0
  br i1 %785, label %853, label %786

; <label>:786                                     ; preds = %775
  %787 = load i32* %i, align 4
  %788 = sext i32 %787 to i64
  %789 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %788
  %790 = load i32* %789, align 4
  %791 = add nsw i32 26, %790
  %792 = sub nsw i32 %791, 1
  store i32 %792, i32* %tmp, align 4
  %793 = load i32* @wking_loc, align 4
  %794 = sext i32 %793 to i64
  %795 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %794
  %796 = load i32* %795, align 4
  %797 = load i32* %tmp, align 4
  %798 = sext i32 %797 to i64
  %799 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %798
  %800 = load i32* %799, align 4
  %801 = sub nsw i32 %796, %800
  %802 = call i32 @abs(i32 %801) #6
  %803 = load i32* @wking_loc, align 4
  %804 = sext i32 %803 to i64
  %805 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %804
  %806 = load i32* %805, align 4
  %807 = load i32* %tmp, align 4
  %808 = sext i32 %807 to i64
  %809 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %808
  %810 = load i32* %809, align 4
  %811 = sub nsw i32 %806, %810
  %812 = call i32 @abs(i32 %811) #6
  %813 = icmp sgt i32 %802, %812
  br i1 %813, label %814, label %825

; <label>:814                                     ; preds = %786
  %815 = load i32* @wking_loc, align 4
  %816 = sext i32 %815 to i64
  %817 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %816
  %818 = load i32* %817, align 4
  %819 = load i32* %tmp, align 4
  %820 = sext i32 %819 to i64
  %821 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %820
  %822 = load i32* %821, align 4
  %823 = sub nsw i32 %818, %822
  %824 = call i32 @abs(i32 %823) #6
  br label %836

; <label>:825                                     ; preds = %786
  %826 = load i32* @wking_loc, align 4
  %827 = sext i32 %826 to i64
  %828 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %827
  %829 = load i32* %828, align 4
  %830 = load i32* %tmp, align 4
  %831 = sext i32 %830 to i64
  %832 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %831
  %833 = load i32* %832, align 4
  %834 = sub nsw i32 %829, %833
  %835 = call i32 @abs(i32 %834) #6
  br label %836

; <label>:836                                     ; preds = %825, %814
  %837 = phi i32 [ %824, %814 ], [ %835, %825 ]
  %838 = load i32* %tmp, align 4
  %839 = sext i32 %838 to i64
  %840 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %839
  %841 = load i32* %840, align 4
  %842 = load i32* %i, align 4
  %843 = sext i32 %842 to i64
  %844 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %843
  %845 = load i32* %844, align 4
  %846 = sub nsw i32 %841, %845
  %847 = call i32 @abs(i32 %846) #6
  %848 = icmp sgt i32 %837, %847
  br i1 %848, label %849, label %852

; <label>:849                                     ; preds = %836
  %850 = load i32* %bpotential, align 4
  %851 = sub nsw i32 %850, 800
  store i32 %851, i32* %bpotential, align 4
  br label %852

; <label>:852                                     ; preds = %849, %836
  br label %921

; <label>:853                                     ; preds = %775
  %854 = load i32* %i, align 4
  %855 = sext i32 %854 to i64
  %856 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %855
  %857 = load i32* %856, align 4
  %858 = add nsw i32 26, %857
  %859 = sub nsw i32 %858, 1
  store i32 %859, i32* %tmp, align 4
  %860 = load i32* @wking_loc, align 4
  %861 = sext i32 %860 to i64
  %862 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %861
  %863 = load i32* %862, align 4
  %864 = load i32* %tmp, align 4
  %865 = sext i32 %864 to i64
  %866 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %865
  %867 = load i32* %866, align 4
  %868 = sub nsw i32 %863, %867
  %869 = call i32 @abs(i32 %868) #6
  %870 = load i32* @wking_loc, align 4
  %871 = sext i32 %870 to i64
  %872 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %871
  %873 = load i32* %872, align 4
  %874 = load i32* %tmp, align 4
  %875 = sext i32 %874 to i64
  %876 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %875
  %877 = load i32* %876, align 4
  %878 = sub nsw i32 %873, %877
  %879 = call i32 @abs(i32 %878) #6
  %880 = icmp sgt i32 %869, %879
  br i1 %880, label %881, label %892

; <label>:881                                     ; preds = %853
  %882 = load i32* @wking_loc, align 4
  %883 = sext i32 %882 to i64
  %884 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %883
  %885 = load i32* %884, align 4
  %886 = load i32* %tmp, align 4
  %887 = sext i32 %886 to i64
  %888 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %887
  %889 = load i32* %888, align 4
  %890 = sub nsw i32 %885, %889
  %891 = call i32 @abs(i32 %890) #6
  br label %903

; <label>:892                                     ; preds = %853
  %893 = load i32* @wking_loc, align 4
  %894 = sext i32 %893 to i64
  %895 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %894
  %896 = load i32* %895, align 4
  %897 = load i32* %tmp, align 4
  %898 = sext i32 %897 to i64
  %899 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %898
  %900 = load i32* %899, align 4
  %901 = sub nsw i32 %896, %900
  %902 = call i32 @abs(i32 %901) #6
  br label %903

; <label>:903                                     ; preds = %892, %881
  %904 = phi i32 [ %891, %881 ], [ %902, %892 ]
  %905 = sub nsw i32 %904, 1
  %906 = load i32* %tmp, align 4
  %907 = sext i32 %906 to i64
  %908 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %907
  %909 = load i32* %908, align 4
  %910 = load i32* %i, align 4
  %911 = sext i32 %910 to i64
  %912 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %911
  %913 = load i32* %912, align 4
  %914 = sub nsw i32 %909, %913
  %915 = call i32 @abs(i32 %914) #6
  %916 = icmp sgt i32 %905, %915
  br i1 %916, label %917, label %920

; <label>:917                                     ; preds = %903
  %918 = load i32* %bpotential, align 4
  %919 = sub nsw i32 %918, 800
  store i32 %919, i32* %bpotential, align 4
  br label %920

; <label>:920                                     ; preds = %917, %903
  br label %921

; <label>:921                                     ; preds = %920, %852
  %922 = load i32* %i, align 4
  %923 = sext i32 %922 to i64
  %924 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %923
  %925 = load i32* %924, align 4
  %926 = icmp eq i32 %925, 1
  br i1 %926, label %933, label %927

; <label>:927                                     ; preds = %921
  %928 = load i32* %i, align 4
  %929 = sext i32 %928 to i64
  %930 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %929
  %931 = load i32* %930, align 4
  %932 = icmp eq i32 %931, 8
  br i1 %932, label %933, label %942

; <label>:933                                     ; preds = %927, %921
  %934 = load i32* %i, align 4
  %935 = sext i32 %934 to i64
  %936 = getelementptr inbounds [144 x i32]* @sblack_pawn, i32 0, i64 %935
  %937 = load i32* %936, align 4
  %938 = mul nsw i32 2, %937
  %939 = add nsw i32 12, %938
  %940 = load i32* %score, align 4
  %941 = sub nsw i32 %940, %939
  store i32 %941, i32* %score, align 4
  br label %942

; <label>:942                                     ; preds = %933, %927
  %943 = load i32* %isolated, align 4
  %944 = icmp ne i32 %943, 0
  br i1 %944, label %1056, label %945

; <label>:945                                     ; preds = %942
  %946 = load i32* %score, align 4
  %947 = sub nsw i32 %946, 12
  store i32 %947, i32* %score, align 4
  %948 = load i32* %pawn_file, align 4
  %949 = add nsw i32 %948, 1
  %950 = sext i32 %949 to i64
  %951 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %952 = getelementptr inbounds [11 x i32]* %951, i32 0, i64 %950
  %953 = load i32* %952, align 4
  %954 = icmp ne i32 %953, 0
  br i1 %954, label %955, label %1001

; <label>:955                                     ; preds = %945
  %956 = load i32* %pawn_file, align 4
  %957 = add nsw i32 %956, 1
  %958 = sext i32 %957 to i64
  %959 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %960 = getelementptr inbounds [11 x i32]* %959, i32 0, i64 %958
  %961 = load i32* %960, align 4
  %962 = icmp ne i32 %961, 0
  br i1 %962, label %1000, label %963

; <label>:963                                     ; preds = %955
  %964 = load i32* %pawn_file, align 4
  %965 = add nsw i32 %964, 1
  %966 = sext i32 %965 to i64
  %967 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %966
  %968 = load i32* %967, align 4
  %969 = load i32* %pawn_file, align 4
  %970 = add nsw i32 %969, 2
  %971 = sext i32 %970 to i64
  %972 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %971
  %973 = load i32* %972, align 4
  %974 = icmp sle i32 %968, %973
  br i1 %974, label %975, label %1000

; <label>:975                                     ; preds = %963
  %976 = load i32* %i, align 4
  %977 = sext i32 %976 to i64
  %978 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %977
  %979 = load i32* %978, align 4
  %980 = sub nsw i32 9, %979
  %981 = mul nsw i32 7, %980
  %982 = load i32* %score, align 4
  %983 = sub nsw i32 %982, %981
  store i32 %983, i32* %score, align 4
  %984 = load i32* %i, align 4
  %985 = sext i32 %984 to i64
  %986 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %985
  %987 = load i32* %986, align 4
  %988 = icmp eq i32 %987, 2
  br i1 %988, label %989, label %999

; <label>:989                                     ; preds = %975
  %990 = load i32* %pawn_file, align 4
  %991 = add nsw i32 %990, 1
  %992 = sext i32 %991 to i64
  %993 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %992
  %994 = load i32* %993, align 4
  %995 = icmp sle i32 %994, 3
  br i1 %995, label %996, label %999

; <label>:996                                     ; preds = %989
  %997 = load i32* %score, align 4
  %998 = sub nsw i32 %997, 50
  store i32 %998, i32* %score, align 4
  br label %999

; <label>:999                                     ; preds = %996, %989, %975
  br label %1000

; <label>:1000                                    ; preds = %999, %963, %955
  br label %1001

; <label>:1001                                    ; preds = %1000, %945
  %1002 = load i32* %pawn_file, align 4
  %1003 = sub nsw i32 %1002, 1
  %1004 = sext i32 %1003 to i64
  %1005 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1006 = getelementptr inbounds [11 x i32]* %1005, i32 0, i64 %1004
  %1007 = load i32* %1006, align 4
  %1008 = icmp ne i32 %1007, 0
  br i1 %1008, label %1009, label %1055

; <label>:1009                                    ; preds = %1001
  %1010 = load i32* %pawn_file, align 4
  %1011 = sub nsw i32 %1010, 1
  %1012 = sext i32 %1011 to i64
  %1013 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1014 = getelementptr inbounds [11 x i32]* %1013, i32 0, i64 %1012
  %1015 = load i32* %1014, align 4
  %1016 = icmp ne i32 %1015, 0
  br i1 %1016, label %1054, label %1017

; <label>:1017                                    ; preds = %1009
  %1018 = load i32* %pawn_file, align 4
  %1019 = sub nsw i32 %1018, 1
  %1020 = sext i32 %1019 to i64
  %1021 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1020
  %1022 = load i32* %1021, align 4
  %1023 = load i32* %pawn_file, align 4
  %1024 = sub nsw i32 %1023, 2
  %1025 = sext i32 %1024 to i64
  %1026 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1025
  %1027 = load i32* %1026, align 4
  %1028 = icmp sle i32 %1022, %1027
  br i1 %1028, label %1029, label %1054

; <label>:1029                                    ; preds = %1017
  %1030 = load i32* %i, align 4
  %1031 = sext i32 %1030 to i64
  %1032 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %1031
  %1033 = load i32* %1032, align 4
  %1034 = sub nsw i32 9, %1033
  %1035 = mul nsw i32 7, %1034
  %1036 = load i32* %score, align 4
  %1037 = sub nsw i32 %1036, %1035
  store i32 %1037, i32* %score, align 4
  %1038 = load i32* %i, align 4
  %1039 = sext i32 %1038 to i64
  %1040 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %1039
  %1041 = load i32* %1040, align 4
  %1042 = icmp eq i32 %1041, 2
  br i1 %1042, label %1043, label %1053

; <label>:1043                                    ; preds = %1029
  %1044 = load i32* %pawn_file, align 4
  %1045 = sub nsw i32 %1044, 1
  %1046 = sext i32 %1045 to i64
  %1047 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1046
  %1048 = load i32* %1047, align 4
  %1049 = icmp sle i32 %1048, 3
  br i1 %1049, label %1050, label %1053

; <label>:1050                                    ; preds = %1043
  %1051 = load i32* %score, align 4
  %1052 = sub nsw i32 %1051, 50
  store i32 %1052, i32* %score, align 4
  br label %1053

; <label>:1053                                    ; preds = %1050, %1043, %1029
  br label %1054

; <label>:1054                                    ; preds = %1053, %1017, %1009
  br label %1055

; <label>:1055                                    ; preds = %1054, %1001
  br label %1056

; <label>:1056                                    ; preds = %1055, %942
  br label %1057

; <label>:1057                                    ; preds = %1056, %767, %759, %752
  %1058 = load i32* %pawn_file, align 4
  %1059 = sub nsw i32 %1058, 1
  %1060 = sext i32 %1059 to i64
  %1061 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1062 = getelementptr inbounds [11 x i32]* %1061, i32 0, i64 %1060
  %1063 = load i32* %1062, align 4
  %1064 = icmp ne i32 %1063, 0
  br i1 %1064, label %1068, label %1065

; <label>:1065                                    ; preds = %1057
  %1066 = load i32* %score, align 4
  %1067 = add nsw i32 %1066, 7
  store i32 %1067, i32* %score, align 4
  br label %1068

; <label>:1068                                    ; preds = %1065, %1057
  br label %1530

; <label>:1069                                    ; preds = %238
  %1070 = load i32* %wr, align 4
  %1071 = add nsw i32 %1070, 1
  store i32 %1071, i32* %wr, align 4
  %1072 = load i32* %wr, align 4
  %1073 = icmp eq i32 %1072, 1
  br i1 %1073, label %1074, label %1083

; <label>:1074                                    ; preds = %1069
  %1075 = load i32* %i, align 4
  %1076 = sext i32 %1075 to i64
  %1077 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1076
  %1078 = load i32* %1077, align 4
  store i32 %1078, i32* %fwrook, align 4
  %1079 = load i32* %i, align 4
  %1080 = sext i32 %1079 to i64
  %1081 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %1080
  %1082 = load i32* %1081, align 4
  store i32 %1082, i32* %rwrook, align 4
  br label %1083

; <label>:1083                                    ; preds = %1074, %1069
  %1084 = load i32* %srank, align 4
  %1085 = icmp eq i32 %1084, 7
  br i1 %1085, label %1086, label %1098

; <label>:1086                                    ; preds = %1083
  %1087 = load i32* %score, align 4
  %1088 = add nsw i32 %1087, 25
  store i32 %1088, i32* %score, align 4
  %1089 = load i32* %wr, align 4
  %1090 = icmp eq i32 %1089, 2
  br i1 %1090, label %1091, label %1097

; <label>:1091                                    ; preds = %1086
  %1092 = load i32* %rwrook, align 4
  %1093 = icmp eq i32 %1092, 7
  br i1 %1093, label %1094, label %1097

; <label>:1094                                    ; preds = %1091
  %1095 = load i32* %score, align 4
  %1096 = add nsw i32 %1095, 10
  store i32 %1096, i32* %score, align 4
  br label %1097

; <label>:1097                                    ; preds = %1094, %1091, %1086
  br label %1098

; <label>:1098                                    ; preds = %1097, %1083
  %1099 = load i32* %pawn_file, align 4
  %1100 = sext i32 %1099 to i64
  %1101 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1102 = getelementptr inbounds [11 x i32]* %1101, i32 0, i64 %1100
  %1103 = load i32* %1102, align 4
  %1104 = icmp ne i32 %1103, 0
  br i1 %1104, label %1131, label %1105

; <label>:1105                                    ; preds = %1098
  %1106 = load i32* %score, align 4
  %1107 = add nsw i32 %1106, 5
  store i32 %1107, i32* %score, align 4
  %1108 = load i32* %wr, align 4
  %1109 = icmp eq i32 %1108, 2
  br i1 %1109, label %1110, label %1120

; <label>:1110                                    ; preds = %1105
  %1111 = load i32* %i, align 4
  %1112 = sext i32 %1111 to i64
  %1113 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1112
  %1114 = load i32* %1113, align 4
  %1115 = load i32* %fwrook, align 4
  %1116 = icmp eq i32 %1114, %1115
  br i1 %1116, label %1117, label %1120

; <label>:1117                                    ; preds = %1110
  %1118 = load i32* %score, align 4
  %1119 = add nsw i32 %1118, 12
  store i32 %1119, i32* %score, align 4
  br label %1120

; <label>:1120                                    ; preds = %1117, %1110, %1105
  %1121 = load i32* %pawn_file, align 4
  %1122 = sext i32 %1121 to i64
  %1123 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1124 = getelementptr inbounds [11 x i32]* %1123, i32 0, i64 %1122
  %1125 = load i32* %1124, align 4
  %1126 = icmp ne i32 %1125, 0
  br i1 %1126, label %1130, label %1127

; <label>:1127                                    ; preds = %1120
  %1128 = load i32* %score, align 4
  %1129 = add nsw i32 %1128, 3
  store i32 %1129, i32* %score, align 4
  br label %1130

; <label>:1130                                    ; preds = %1127, %1120
  br label %1131

; <label>:1131                                    ; preds = %1130, %1098
  br label %1530

; <label>:1132                                    ; preds = %238
  %1133 = load i32* %br, align 4
  %1134 = add nsw i32 %1133, 1
  store i32 %1134, i32* %br, align 4
  %1135 = load i32* %br, align 4
  %1136 = icmp eq i32 %1135, 1
  br i1 %1136, label %1137, label %1146

; <label>:1137                                    ; preds = %1132
  %1138 = load i32* %i, align 4
  %1139 = sext i32 %1138 to i64
  %1140 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1139
  %1141 = load i32* %1140, align 4
  store i32 %1141, i32* %fbrook, align 4
  %1142 = load i32* %i, align 4
  %1143 = sext i32 %1142 to i64
  %1144 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %1143
  %1145 = load i32* %1144, align 4
  store i32 %1145, i32* %rbrook, align 4
  br label %1146

; <label>:1146                                    ; preds = %1137, %1132
  %1147 = load i32* %srank, align 4
  %1148 = icmp eq i32 %1147, 2
  br i1 %1148, label %1149, label %1161

; <label>:1149                                    ; preds = %1146
  %1150 = load i32* %score, align 4
  %1151 = sub nsw i32 %1150, 25
  store i32 %1151, i32* %score, align 4
  %1152 = load i32* %wr, align 4
  %1153 = icmp eq i32 %1152, 2
  br i1 %1153, label %1154, label %1160

; <label>:1154                                    ; preds = %1149
  %1155 = load i32* %rbrook, align 4
  %1156 = icmp eq i32 %1155, 2
  br i1 %1156, label %1157, label %1160

; <label>:1157                                    ; preds = %1154
  %1158 = load i32* %score, align 4
  %1159 = sub nsw i32 %1158, 10
  store i32 %1159, i32* %score, align 4
  br label %1160

; <label>:1160                                    ; preds = %1157, %1154, %1149
  br label %1161

; <label>:1161                                    ; preds = %1160, %1146
  %1162 = load i32* %pawn_file, align 4
  %1163 = sext i32 %1162 to i64
  %1164 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1165 = getelementptr inbounds [11 x i32]* %1164, i32 0, i64 %1163
  %1166 = load i32* %1165, align 4
  %1167 = icmp ne i32 %1166, 0
  br i1 %1167, label %1194, label %1168

; <label>:1168                                    ; preds = %1161
  %1169 = load i32* %score, align 4
  %1170 = sub nsw i32 %1169, 5
  store i32 %1170, i32* %score, align 4
  %1171 = load i32* %br, align 4
  %1172 = icmp eq i32 %1171, 2
  br i1 %1172, label %1173, label %1183

; <label>:1173                                    ; preds = %1168
  %1174 = load i32* %i, align 4
  %1175 = sext i32 %1174 to i64
  %1176 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1175
  %1177 = load i32* %1176, align 4
  %1178 = load i32* %fbrook, align 4
  %1179 = icmp eq i32 %1177, %1178
  br i1 %1179, label %1180, label %1183

; <label>:1180                                    ; preds = %1173
  %1181 = load i32* %score, align 4
  %1182 = sub nsw i32 %1181, 12
  store i32 %1182, i32* %score, align 4
  br label %1183

; <label>:1183                                    ; preds = %1180, %1173, %1168
  %1184 = load i32* %pawn_file, align 4
  %1185 = sext i32 %1184 to i64
  %1186 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1187 = getelementptr inbounds [11 x i32]* %1186, i32 0, i64 %1185
  %1188 = load i32* %1187, align 4
  %1189 = icmp ne i32 %1188, 0
  br i1 %1189, label %1193, label %1190

; <label>:1190                                    ; preds = %1183
  %1191 = load i32* %score, align 4
  %1192 = sub nsw i32 %1191, 3
  store i32 %1192, i32* %score, align 4
  br label %1193

; <label>:1193                                    ; preds = %1190, %1183
  br label %1194

; <label>:1194                                    ; preds = %1193, %1161
  br label %1530

; <label>:1195                                    ; preds = %238
  %1196 = load i32* %wb, align 4
  %1197 = add nsw i32 %1196, 1
  store i32 %1197, i32* %wb, align 4
  br label %1530

; <label>:1198                                    ; preds = %238
  %1199 = load i32* %bb, align 4
  %1200 = add nsw i32 %1199, 1
  store i32 %1200, i32* %bb, align 4
  br label %1530

; <label>:1201                                    ; preds = %238
  %1202 = load i32* %wn, align 4
  %1203 = add nsw i32 %1202, 1
  store i32 %1203, i32* %wn, align 4
  br label %1530

; <label>:1204                                    ; preds = %238
  %1205 = load i32* %bn, align 4
  %1206 = add nsw i32 %1205, 1
  store i32 %1206, i32* %bn, align 4
  br label %1530

; <label>:1207                                    ; preds = %238
  %1208 = load i32* %wq, align 4
  %1209 = add nsw i32 %1208, 1
  store i32 %1209, i32* %wq, align 4
  br label %1530

; <label>:1210                                    ; preds = %238
  %1211 = load i32* %bq, align 4
  %1212 = add nsw i32 %1211, 1
  store i32 %1212, i32* %bq, align 4
  br label %1530

; <label>:1213                                    ; preds = %238
  %1214 = load i32* @wmat, align 4
  %1215 = icmp sgt i32 %1214, 1300
  br i1 %1215, label %1216, label %1359

; <label>:1216                                    ; preds = %1213
  %1217 = load i32* %i, align 4
  %1218 = sext i32 %1217 to i64
  %1219 = getelementptr inbounds [144 x i32]* @swhite_king, i32 0, i64 %1218
  %1220 = load i32* %1219, align 4
  %1221 = load i32* %score, align 4
  %1222 = add nsw i32 %1221, %1220
  store i32 %1222, i32* %score, align 4
  %1223 = load i32* @white_castled, align 4
  %1224 = icmp eq i32 %1223, 2
  br i1 %1224, label %1225, label %1228

; <label>:1225                                    ; preds = %1216
  %1226 = load i32* %score, align 4
  %1227 = add nsw i32 %1226, 15
  store i32 %1227, i32* %score, align 4
  br label %1252

; <label>:1228                                    ; preds = %1216
  %1229 = load i32* @white_castled, align 4
  %1230 = icmp eq i32 %1229, 1
  br i1 %1230, label %1231, label %1234

; <label>:1231                                    ; preds = %1228
  %1232 = load i32* %score, align 4
  %1233 = add nsw i32 %1232, 25
  store i32 %1233, i32* %score, align 4
  br label %1251

; <label>:1234                                    ; preds = %1228
  %1235 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 30), align 4
  %1236 = icmp ne i32 %1235, 0
  br i1 %1236, label %1237, label %1250

; <label>:1237                                    ; preds = %1234
  %1238 = load i32* %score, align 4
  %1239 = sub nsw i32 %1238, 10
  store i32 %1239, i32* %score, align 4
  %1240 = load i32* %pawn_file, align 4
  %1241 = sext i32 %1240 to i64
  %1242 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1243 = getelementptr inbounds [11 x i32]* %1242, i32 0, i64 %1241
  %1244 = load i32* %1243, align 4
  %1245 = icmp ne i32 %1244, 0
  br i1 %1245, label %1249, label %1246

; <label>:1246                                    ; preds = %1237
  %1247 = load i32* %score, align 4
  %1248 = sub nsw i32 %1247, 15
  store i32 %1248, i32* %score, align 4
  br label %1249

; <label>:1249                                    ; preds = %1246, %1237
  br label %1250

; <label>:1250                                    ; preds = %1249, %1234
  br label %1251

; <label>:1251                                    ; preds = %1250, %1231
  br label %1252

; <label>:1252                                    ; preds = %1251, %1225
  %1253 = load i32* @wking_loc, align 4
  %1254 = sext i32 %1253 to i64
  %1255 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1254
  %1256 = load i32* %1255, align 4
  %1257 = icmp ne i32 %1256, 4
  br i1 %1257, label %1258, label %1355

; <label>:1258                                    ; preds = %1252
  %1259 = load i32* @wking_loc, align 4
  %1260 = sext i32 %1259 to i64
  %1261 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1260
  %1262 = load i32* %1261, align 4
  %1263 = icmp ne i32 %1262, 5
  br i1 %1263, label %1264, label %1355

; <label>:1264                                    ; preds = %1258
  %1265 = load i32* %srank, align 4
  %1266 = load i32* %pawn_file, align 4
  %1267 = sext i32 %1266 to i64
  %1268 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1267
  %1269 = load i32* %1268, align 4
  %1270 = icmp slt i32 %1265, %1269
  br i1 %1270, label %1271, label %1289

; <label>:1271                                    ; preds = %1264
  %1272 = load i32* %pawn_file, align 4
  %1273 = sext i32 %1272 to i64
  %1274 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1275 = getelementptr inbounds [11 x i32]* %1274, i32 0, i64 %1273
  %1276 = load i32* %1275, align 4
  %1277 = icmp ne i32 %1276, 0
  br i1 %1277, label %1278, label %1289

; <label>:1278                                    ; preds = %1271
  %1279 = load i32* %pawn_file, align 4
  %1280 = sext i32 %1279 to i64
  %1281 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1280
  %1282 = load i32* %1281, align 4
  %1283 = load i32* %srank, align 4
  %1284 = sub nsw i32 %1282, %1283
  %1285 = sub nsw i32 %1284, 1
  %1286 = mul nsw i32 9, %1285
  %1287 = load i32* %score, align 4
  %1288 = sub nsw i32 %1287, %1286
  store i32 %1288, i32* %score, align 4
  br label %1292

; <label>:1289                                    ; preds = %1271, %1264
  %1290 = load i32* %score, align 4
  %1291 = sub nsw i32 %1290, 22
  store i32 %1291, i32* %score, align 4
  br label %1292

; <label>:1292                                    ; preds = %1289, %1278
  %1293 = load i32* %srank, align 4
  %1294 = load i32* %pawn_file, align 4
  %1295 = add nsw i32 %1294, 1
  %1296 = sext i32 %1295 to i64
  %1297 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1296
  %1298 = load i32* %1297, align 4
  %1299 = icmp slt i32 %1293, %1298
  br i1 %1299, label %1300, label %1320

; <label>:1300                                    ; preds = %1292
  %1301 = load i32* %pawn_file, align 4
  %1302 = add nsw i32 %1301, 1
  %1303 = sext i32 %1302 to i64
  %1304 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1305 = getelementptr inbounds [11 x i32]* %1304, i32 0, i64 %1303
  %1306 = load i32* %1305, align 4
  %1307 = icmp ne i32 %1306, 0
  br i1 %1307, label %1308, label %1320

; <label>:1308                                    ; preds = %1300
  %1309 = load i32* %pawn_file, align 4
  %1310 = add nsw i32 %1309, 1
  %1311 = sext i32 %1310 to i64
  %1312 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1311
  %1313 = load i32* %1312, align 4
  %1314 = load i32* %srank, align 4
  %1315 = sub nsw i32 %1313, %1314
  %1316 = sub nsw i32 %1315, 1
  %1317 = mul nsw i32 8, %1316
  %1318 = load i32* %score, align 4
  %1319 = sub nsw i32 %1318, %1317
  store i32 %1319, i32* %score, align 4
  br label %1323

; <label>:1320                                    ; preds = %1300, %1292
  %1321 = load i32* %score, align 4
  %1322 = sub nsw i32 %1321, 16
  store i32 %1322, i32* %score, align 4
  br label %1323

; <label>:1323                                    ; preds = %1320, %1308
  %1324 = load i32* %srank, align 4
  %1325 = load i32* %pawn_file, align 4
  %1326 = sub nsw i32 %1325, 1
  %1327 = sext i32 %1326 to i64
  %1328 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1327
  %1329 = load i32* %1328, align 4
  %1330 = icmp slt i32 %1324, %1329
  br i1 %1330, label %1331, label %1351

; <label>:1331                                    ; preds = %1323
  %1332 = load i32* %pawn_file, align 4
  %1333 = sub nsw i32 %1332, 1
  %1334 = sext i32 %1333 to i64
  %1335 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1336 = getelementptr inbounds [11 x i32]* %1335, i32 0, i64 %1334
  %1337 = load i32* %1336, align 4
  %1338 = icmp ne i32 %1337, 0
  br i1 %1338, label %1339, label %1351

; <label>:1339                                    ; preds = %1331
  %1340 = load i32* %pawn_file, align 4
  %1341 = sub nsw i32 %1340, 1
  %1342 = sext i32 %1341 to i64
  %1343 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1342
  %1344 = load i32* %1343, align 4
  %1345 = load i32* %srank, align 4
  %1346 = sub nsw i32 %1344, %1345
  %1347 = sub nsw i32 %1346, 1
  %1348 = mul nsw i32 8, %1347
  %1349 = load i32* %score, align 4
  %1350 = sub nsw i32 %1349, %1348
  store i32 %1350, i32* %score, align 4
  br label %1354

; <label>:1351                                    ; preds = %1331, %1323
  %1352 = load i32* %score, align 4
  %1353 = sub nsw i32 %1352, 16
  store i32 %1353, i32* %score, align 4
  br label %1354

; <label>:1354                                    ; preds = %1351, %1339
  br label %1358

; <label>:1355                                    ; preds = %1258, %1252
  %1356 = load i32* %score, align 4
  %1357 = sub nsw i32 %1356, 10
  store i32 %1357, i32* %score, align 4
  br label %1358

; <label>:1358                                    ; preds = %1355, %1354
  br label %1366

; <label>:1359                                    ; preds = %1213
  %1360 = load i32* %i, align 4
  %1361 = sext i32 %1360 to i64
  %1362 = getelementptr inbounds [144 x i32]* @send_king, i32 0, i64 %1361
  %1363 = load i32* %1362, align 4
  %1364 = load i32* %score, align 4
  %1365 = add nsw i32 %1364, %1363
  store i32 %1365, i32* %score, align 4
  br label %1366

; <label>:1366                                    ; preds = %1359, %1358
  br label %1530

; <label>:1367                                    ; preds = %238
  %1368 = load i32* @bmat, align 4
  %1369 = icmp sgt i32 %1368, 1300
  br i1 %1369, label %1370, label %1522

; <label>:1370                                    ; preds = %1367
  %1371 = load i32* %i, align 4
  %1372 = sext i32 %1371 to i64
  %1373 = getelementptr inbounds [144 x i32]* @sblack_king, i32 0, i64 %1372
  %1374 = load i32* %1373, align 4
  %1375 = load i32* %score, align 4
  %1376 = sub nsw i32 %1375, %1374
  store i32 %1376, i32* %score, align 4
  %1377 = load i32* @black_castled, align 4
  %1378 = icmp eq i32 %1377, 4
  br i1 %1378, label %1379, label %1382

; <label>:1379                                    ; preds = %1370
  %1380 = load i32* %score, align 4
  %1381 = sub nsw i32 %1380, 15
  store i32 %1381, i32* %score, align 4
  br label %1406

; <label>:1382                                    ; preds = %1370
  %1383 = load i32* @black_castled, align 4
  %1384 = icmp eq i32 %1383, 3
  br i1 %1384, label %1385, label %1388

; <label>:1385                                    ; preds = %1382
  %1386 = load i32* %score, align 4
  %1387 = sub nsw i32 %1386, 25
  store i32 %1387, i32* %score, align 4
  br label %1405

; <label>:1388                                    ; preds = %1382
  %1389 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 114), align 4
  %1390 = icmp ne i32 %1389, 0
  br i1 %1390, label %1391, label %1404

; <label>:1391                                    ; preds = %1388
  %1392 = load i32* %score, align 4
  %1393 = add nsw i32 %1392, 10
  store i32 %1393, i32* %score, align 4
  %1394 = load i32* %pawn_file, align 4
  %1395 = sext i32 %1394 to i64
  %1396 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1397 = getelementptr inbounds [11 x i32]* %1396, i32 0, i64 %1395
  %1398 = load i32* %1397, align 4
  %1399 = icmp ne i32 %1398, 0
  br i1 %1399, label %1403, label %1400

; <label>:1400                                    ; preds = %1391
  %1401 = load i32* %score, align 4
  %1402 = add nsw i32 %1401, 15
  store i32 %1402, i32* %score, align 4
  br label %1403

; <label>:1403                                    ; preds = %1400, %1391
  br label %1404

; <label>:1404                                    ; preds = %1403, %1388
  br label %1405

; <label>:1405                                    ; preds = %1404, %1385
  br label %1406

; <label>:1406                                    ; preds = %1405, %1379
  %1407 = load i32* @bking_loc, align 4
  %1408 = sext i32 %1407 to i64
  %1409 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1408
  %1410 = load i32* %1409, align 4
  %1411 = icmp ne i32 %1410, 4
  br i1 %1411, label %1412, label %1518

; <label>:1412                                    ; preds = %1406
  %1413 = load i32* @bking_loc, align 4
  %1414 = sext i32 %1413 to i64
  %1415 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1414
  %1416 = load i32* %1415, align 4
  %1417 = icmp ne i32 %1416, 5
  br i1 %1417, label %1418, label %1518

; <label>:1418                                    ; preds = %1412
  %1419 = load i32* %srank, align 4
  %1420 = load i32* %pawn_file, align 4
  %1421 = sext i32 %1420 to i64
  %1422 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1421
  %1423 = load i32* %1422, align 4
  %1424 = icmp sgt i32 %1419, %1423
  br i1 %1424, label %1425, label %1446

; <label>:1425                                    ; preds = %1418
  %1426 = load i32* %pawn_file, align 4
  %1427 = sext i32 %1426 to i64
  %1428 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1429 = getelementptr inbounds [11 x i32]* %1428, i32 0, i64 %1427
  %1430 = load i32* %1429, align 4
  %1431 = icmp ne i32 %1430, 0
  br i1 %1431, label %1432, label %1446

; <label>:1432                                    ; preds = %1425
  %1433 = load i32* %srank, align 4
  %1434 = load i32* %pawn_file, align 4
  %1435 = sext i32 %1434 to i64
  %1436 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1435
  %1437 = load i32* %1436, align 4
  %1438 = sub nsw i32 %1433, %1437
  %1439 = sub nsw i32 %1438, 1
  %1440 = sext i32 %1439 to i64
  %1441 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1440
  %1442 = load i32* %1441, align 4
  %1443 = mul nsw i32 9, %1442
  %1444 = load i32* %score, align 4
  %1445 = add nsw i32 %1444, %1443
  store i32 %1445, i32* %score, align 4
  br label %1449

; <label>:1446                                    ; preds = %1425, %1418
  %1447 = load i32* %score, align 4
  %1448 = add nsw i32 %1447, 22
  store i32 %1448, i32* %score, align 4
  br label %1449

; <label>:1449                                    ; preds = %1446, %1432
  %1450 = load i32* %srank, align 4
  %1451 = load i32* %pawn_file, align 4
  %1452 = add nsw i32 %1451, 1
  %1453 = sext i32 %1452 to i64
  %1454 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1453
  %1455 = load i32* %1454, align 4
  %1456 = icmp sgt i32 %1450, %1455
  br i1 %1456, label %1457, label %1480

; <label>:1457                                    ; preds = %1449
  %1458 = load i32* %pawn_file, align 4
  %1459 = add nsw i32 %1458, 1
  %1460 = sext i32 %1459 to i64
  %1461 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1462 = getelementptr inbounds [11 x i32]* %1461, i32 0, i64 %1460
  %1463 = load i32* %1462, align 4
  %1464 = icmp ne i32 %1463, 0
  br i1 %1464, label %1465, label %1480

; <label>:1465                                    ; preds = %1457
  %1466 = load i32* %srank, align 4
  %1467 = load i32* %pawn_file, align 4
  %1468 = add nsw i32 %1467, 1
  %1469 = sext i32 %1468 to i64
  %1470 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1469
  %1471 = load i32* %1470, align 4
  %1472 = sub nsw i32 %1466, %1471
  %1473 = sub nsw i32 %1472, 1
  %1474 = sext i32 %1473 to i64
  %1475 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1474
  %1476 = load i32* %1475, align 4
  %1477 = mul nsw i32 8, %1476
  %1478 = load i32* %score, align 4
  %1479 = add nsw i32 %1478, %1477
  store i32 %1479, i32* %score, align 4
  br label %1483

; <label>:1480                                    ; preds = %1457, %1449
  %1481 = load i32* %score, align 4
  %1482 = add nsw i32 %1481, 16
  store i32 %1482, i32* %score, align 4
  br label %1483

; <label>:1483                                    ; preds = %1480, %1465
  %1484 = load i32* %srank, align 4
  %1485 = load i32* %pawn_file, align 4
  %1486 = sub nsw i32 %1485, 1
  %1487 = sext i32 %1486 to i64
  %1488 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1487
  %1489 = load i32* %1488, align 4
  %1490 = icmp sgt i32 %1484, %1489
  br i1 %1490, label %1491, label %1514

; <label>:1491                                    ; preds = %1483
  %1492 = load i32* %pawn_file, align 4
  %1493 = sub nsw i32 %1492, 1
  %1494 = sext i32 %1493 to i64
  %1495 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1496 = getelementptr inbounds [11 x i32]* %1495, i32 0, i64 %1494
  %1497 = load i32* %1496, align 4
  %1498 = icmp ne i32 %1497, 0
  br i1 %1498, label %1499, label %1514

; <label>:1499                                    ; preds = %1491
  %1500 = load i32* %srank, align 4
  %1501 = load i32* %pawn_file, align 4
  %1502 = sub nsw i32 %1501, 1
  %1503 = sext i32 %1502 to i64
  %1504 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1503
  %1505 = load i32* %1504, align 4
  %1506 = sub nsw i32 %1500, %1505
  %1507 = sub nsw i32 %1506, 1
  %1508 = sext i32 %1507 to i64
  %1509 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1508
  %1510 = load i32* %1509, align 4
  %1511 = mul nsw i32 8, %1510
  %1512 = load i32* %score, align 4
  %1513 = add nsw i32 %1512, %1511
  store i32 %1513, i32* %score, align 4
  br label %1517

; <label>:1514                                    ; preds = %1491, %1483
  %1515 = load i32* %score, align 4
  %1516 = add nsw i32 %1515, 16
  store i32 %1516, i32* %score, align 4
  br label %1517

; <label>:1517                                    ; preds = %1514, %1499
  br label %1521

; <label>:1518                                    ; preds = %1412, %1406
  %1519 = load i32* %score, align 4
  %1520 = add nsw i32 %1519, 10
  store i32 %1520, i32* %score, align 4
  br label %1521

; <label>:1521                                    ; preds = %1518, %1517
  br label %1529

; <label>:1522                                    ; preds = %1367
  %1523 = load i32* %i, align 4
  %1524 = sext i32 %1523 to i64
  %1525 = getelementptr inbounds [144 x i32]* @send_king, i32 0, i64 %1524
  %1526 = load i32* %1525, align 4
  %1527 = load i32* %score, align 4
  %1528 = sub nsw i32 %1527, %1526
  store i32 %1528, i32* %score, align 4
  br label %1529

; <label>:1529                                    ; preds = %1522, %1521
  br label %1530

; <label>:1530                                    ; preds = %238, %1529, %1366, %1210, %1207, %1204, %1201, %1198, %1195, %1194, %1131, %1068, %668
  br label %1531

; <label>:1531                                    ; preds = %1530, %234
  %1532 = load i32* %j, align 4
  %1533 = add nsw i32 %1532, 1
  store i32 %1533, i32* %j, align 4
  br label %223

; <label>:1534                                    ; preds = %223
  %1535 = load i32* @wmat, align 4
  %1536 = icmp sgt i32 %1535, 2200
  br i1 %1536, label %1540, label %1537

; <label>:1537                                    ; preds = %1534
  %1538 = load i32* @bmat, align 4
  %1539 = icmp sgt i32 %1538, 2200
  br i1 %1539, label %1540, label %1577

; <label>:1540                                    ; preds = %1537, %1534
  %1541 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 41), align 4
  %1542 = icmp ne i32 %1541, 0
  br i1 %1542, label %1549, label %1543

; <label>:1543                                    ; preds = %1540
  %1544 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 53), align 4
  %1545 = icmp ne i32 %1544, 13
  br i1 %1545, label %1546, label %1549

; <label>:1546                                    ; preds = %1543
  %1547 = load i32* %score, align 4
  %1548 = sub nsw i32 %1547, 5
  store i32 %1548, i32* %score, align 4
  br label %1549

; <label>:1549                                    ; preds = %1546, %1543, %1540
  %1550 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 42), align 4
  %1551 = icmp ne i32 %1550, 0
  br i1 %1551, label %1558, label %1552

; <label>:1552                                    ; preds = %1549
  %1553 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 54), align 4
  %1554 = icmp ne i32 %1553, 13
  br i1 %1554, label %1555, label %1558

; <label>:1555                                    ; preds = %1552
  %1556 = load i32* %score, align 4
  %1557 = sub nsw i32 %1556, 5
  store i32 %1557, i32* %score, align 4
  br label %1558

; <label>:1558                                    ; preds = %1555, %1552, %1549
  %1559 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 101), align 4
  %1560 = icmp ne i32 %1559, 0
  br i1 %1560, label %1567, label %1561

; <label>:1561                                    ; preds = %1558
  %1562 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 89), align 4
  %1563 = icmp ne i32 %1562, 13
  br i1 %1563, label %1564, label %1567

; <label>:1564                                    ; preds = %1561
  %1565 = load i32* %score, align 4
  %1566 = add nsw i32 %1565, 5
  store i32 %1566, i32* %score, align 4
  br label %1567

; <label>:1567                                    ; preds = %1564, %1561, %1558
  %1568 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 102), align 4
  %1569 = icmp ne i32 %1568, 0
  br i1 %1569, label %1576, label %1570

; <label>:1570                                    ; preds = %1567
  %1571 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 90), align 4
  %1572 = icmp ne i32 %1571, 13
  br i1 %1572, label %1573, label %1576

; <label>:1573                                    ; preds = %1570
  %1574 = load i32* %score, align 4
  %1575 = add nsw i32 %1574, 5
  store i32 %1575, i32* %score, align 4
  br label %1576

; <label>:1576                                    ; preds = %1573, %1570, %1567
  br label %1577

; <label>:1577                                    ; preds = %1576, %1537
  %1578 = load i32* @wmat, align 4
  %1579 = icmp sgt i32 %1578, 1300
  br i1 %1579, label %1583, label %1580

; <label>:1580                                    ; preds = %1577
  %1581 = load i32* @bmat, align 4
  %1582 = icmp sgt i32 %1581, 1300
  br i1 %1582, label %1583, label %1726

; <label>:1583                                    ; preds = %1580, %1577
  %1584 = load i32* @wking_loc, align 4
  %1585 = sext i32 %1584 to i64
  %1586 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1585
  %1587 = load i32* %1586, align 4
  %1588 = add nsw i32 %1587, 1
  store i32 %1588, i32* %wking_pawn_file, align 4
  %1589 = load i32* @bking_loc, align 4
  %1590 = sext i32 %1589 to i64
  %1591 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1590
  %1592 = load i32* %1591, align 4
  %1593 = add nsw i32 %1592, 1
  store i32 %1593, i32* %bking_pawn_file, align 4
  %1594 = load i32* %wking_pawn_file, align 4
  %1595 = load i32* %bking_pawn_file, align 4
  %1596 = sub nsw i32 %1594, %1595
  %1597 = call i32 @abs(i32 %1596) #6
  %1598 = icmp sgt i32 %1597, 2
  br i1 %1598, label %1599, label %1725

; <label>:1599                                    ; preds = %1583
  %1600 = load i32* %wking_pawn_file, align 4
  %1601 = sext i32 %1600 to i64
  %1602 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1601
  %1603 = load i32* %1602, align 4
  %1604 = sext i32 %1603 to i64
  %1605 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1604
  %1606 = load i32* %1605, align 4
  %1607 = sub nsw i32 %1606, 2
  %1608 = mul nsw i32 3, %1607
  %1609 = load i32* %wksafety, align 4
  %1610 = add nsw i32 %1609, %1608
  store i32 %1610, i32* %wksafety, align 4
  %1611 = load i32* %wking_pawn_file, align 4
  %1612 = add nsw i32 %1611, 1
  %1613 = sext i32 %1612 to i64
  %1614 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1613
  %1615 = load i32* %1614, align 4
  %1616 = sext i32 %1615 to i64
  %1617 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1616
  %1618 = load i32* %1617, align 4
  %1619 = sub nsw i32 %1618, 2
  %1620 = mul nsw i32 3, %1619
  %1621 = load i32* %wksafety, align 4
  %1622 = add nsw i32 %1621, %1620
  store i32 %1622, i32* %wksafety, align 4
  %1623 = load i32* %wking_pawn_file, align 4
  %1624 = sub nsw i32 %1623, 1
  %1625 = sext i32 %1624 to i64
  %1626 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1625
  %1627 = load i32* %1626, align 4
  %1628 = sext i32 %1627 to i64
  %1629 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1628
  %1630 = load i32* %1629, align 4
  %1631 = sub nsw i32 %1630, 2
  %1632 = mul nsw i32 3, %1631
  %1633 = load i32* %wksafety, align 4
  %1634 = add nsw i32 %1633, %1632
  store i32 %1634, i32* %wksafety, align 4
  %1635 = load i32* %bking_pawn_file, align 4
  %1636 = sext i32 %1635 to i64
  %1637 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1636
  %1638 = load i32* %1637, align 4
  %1639 = sub nsw i32 %1638, 2
  %1640 = mul nsw i32 3, %1639
  %1641 = load i32* %bksafety, align 4
  %1642 = add nsw i32 %1641, %1640
  store i32 %1642, i32* %bksafety, align 4
  %1643 = load i32* %bking_pawn_file, align 4
  %1644 = add nsw i32 %1643, 1
  %1645 = sext i32 %1644 to i64
  %1646 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1645
  %1647 = load i32* %1646, align 4
  %1648 = sub nsw i32 %1647, 2
  %1649 = mul nsw i32 3, %1648
  %1650 = load i32* %bksafety, align 4
  %1651 = add nsw i32 %1650, %1649
  store i32 %1651, i32* %bksafety, align 4
  %1652 = load i32* %bking_pawn_file, align 4
  %1653 = sub nsw i32 %1652, 1
  %1654 = sext i32 %1653 to i64
  %1655 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1654
  %1656 = load i32* %1655, align 4
  %1657 = sub nsw i32 %1656, 2
  %1658 = mul nsw i32 3, %1657
  %1659 = load i32* %bksafety, align 4
  %1660 = add nsw i32 %1659, %1658
  store i32 %1660, i32* %bksafety, align 4
  %1661 = load i32* %wking_pawn_file, align 4
  %1662 = sext i32 %1661 to i64
  %1663 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1664 = getelementptr inbounds [11 x i32]* %1663, i32 0, i64 %1662
  %1665 = load i32* %1664, align 4
  %1666 = icmp ne i32 %1665, 0
  br i1 %1666, label %1670, label %1667

; <label>:1667                                    ; preds = %1599
  %1668 = load i32* %wksafety, align 4
  %1669 = add nsw i32 %1668, 8
  store i32 %1669, i32* %wksafety, align 4
  br label %1670

; <label>:1670                                    ; preds = %1667, %1599
  %1671 = load i32* %wking_pawn_file, align 4
  %1672 = add nsw i32 %1671, 1
  %1673 = sext i32 %1672 to i64
  %1674 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1675 = getelementptr inbounds [11 x i32]* %1674, i32 0, i64 %1673
  %1676 = load i32* %1675, align 4
  %1677 = icmp ne i32 %1676, 0
  br i1 %1677, label %1681, label %1678

; <label>:1678                                    ; preds = %1670
  %1679 = load i32* %wksafety, align 4
  %1680 = add nsw i32 %1679, 6
  store i32 %1680, i32* %wksafety, align 4
  br label %1681

; <label>:1681                                    ; preds = %1678, %1670
  %1682 = load i32* %wking_pawn_file, align 4
  %1683 = sub nsw i32 %1682, 1
  %1684 = sext i32 %1683 to i64
  %1685 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1686 = getelementptr inbounds [11 x i32]* %1685, i32 0, i64 %1684
  %1687 = load i32* %1686, align 4
  %1688 = icmp ne i32 %1687, 0
  br i1 %1688, label %1692, label %1689

; <label>:1689                                    ; preds = %1681
  %1690 = load i32* %wksafety, align 4
  %1691 = add nsw i32 %1690, 6
  store i32 %1691, i32* %wksafety, align 4
  br label %1692

; <label>:1692                                    ; preds = %1689, %1681
  %1693 = load i32* %bking_pawn_file, align 4
  %1694 = sext i32 %1693 to i64
  %1695 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1696 = getelementptr inbounds [11 x i32]* %1695, i32 0, i64 %1694
  %1697 = load i32* %1696, align 4
  %1698 = icmp ne i32 %1697, 0
  br i1 %1698, label %1702, label %1699

; <label>:1699                                    ; preds = %1692
  %1700 = load i32* %bksafety, align 4
  %1701 = add nsw i32 %1700, 8
  store i32 %1701, i32* %bksafety, align 4
  br label %1702

; <label>:1702                                    ; preds = %1699, %1692
  %1703 = load i32* %bking_pawn_file, align 4
  %1704 = add nsw i32 %1703, 1
  %1705 = sext i32 %1704 to i64
  %1706 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1707 = getelementptr inbounds [11 x i32]* %1706, i32 0, i64 %1705
  %1708 = load i32* %1707, align 4
  %1709 = icmp ne i32 %1708, 0
  br i1 %1709, label %1713, label %1710

; <label>:1710                                    ; preds = %1702
  %1711 = load i32* %bksafety, align 4
  %1712 = add nsw i32 %1711, 6
  store i32 %1712, i32* %bksafety, align 4
  br label %1713

; <label>:1713                                    ; preds = %1710, %1702
  %1714 = load i32* %bking_pawn_file, align 4
  %1715 = sub nsw i32 %1714, 1
  %1716 = sext i32 %1715 to i64
  %1717 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1718 = getelementptr inbounds [11 x i32]* %1717, i32 0, i64 %1716
  %1719 = load i32* %1718, align 4
  %1720 = icmp ne i32 %1719, 0
  br i1 %1720, label %1724, label %1721

; <label>:1721                                    ; preds = %1713
  %1722 = load i32* %bksafety, align 4
  %1723 = add nsw i32 %1722, 6
  store i32 %1723, i32* %bksafety, align 4
  br label %1724

; <label>:1724                                    ; preds = %1721, %1713
  br label %1725

; <label>:1725                                    ; preds = %1724, %1583
  br label %1726

; <label>:1726                                    ; preds = %1725, %1580
  %1727 = load i32* @bmat, align 4
  %1728 = icmp sgt i32 %1727, 1300
  br i1 %1728, label %1729, label %1736

; <label>:1729                                    ; preds = %1726
  %1730 = load i32* %bq, align 4
  %1731 = icmp ne i32 %1730, 0
  br i1 %1731, label %1732, label %1736

; <label>:1732                                    ; preds = %1729
  %1733 = load i32* %wksafety, align 4
  %1734 = load i32* %score, align 4
  %1735 = sub nsw i32 %1734, %1733
  store i32 %1735, i32* %score, align 4
  br label %1736

; <label>:1736                                    ; preds = %1732, %1729, %1726
  %1737 = load i32* @wmat, align 4
  %1738 = icmp sgt i32 %1737, 1300
  br i1 %1738, label %1739, label %1746

; <label>:1739                                    ; preds = %1736
  %1740 = load i32* %wq, align 4
  %1741 = icmp ne i32 %1740, 0
  br i1 %1741, label %1742, label %1746

; <label>:1742                                    ; preds = %1739
  %1743 = load i32* %bksafety, align 4
  %1744 = load i32* %score, align 4
  %1745 = add nsw i32 %1744, %1743
  store i32 %1745, i32* %score, align 4
  br label %1746

; <label>:1746                                    ; preds = %1742, %1739, %1736
  %1747 = load i32* %wr, align 4
  %1748 = icmp ne i32 %1747, 0
  br i1 %1748, label %1762, label %1749

; <label>:1749                                    ; preds = %1746
  %1750 = load i32* %wq, align 4
  %1751 = icmp ne i32 %1750, 0
  br i1 %1751, label %1762, label %1752

; <label>:1752                                    ; preds = %1749
  %1753 = load i32* %wb, align 4
  %1754 = icmp ne i32 %1753, 0
  br i1 %1754, label %1762, label %1755

; <label>:1755                                    ; preds = %1752
  %1756 = load i32* %wn, align 4
  %1757 = icmp ne i32 %1756, 0
  br i1 %1757, label %1762, label %1758

; <label>:1758                                    ; preds = %1755
  %1759 = load i32* %bpotential, align 4
  %1760 = load i32* %score, align 4
  %1761 = add nsw i32 %1760, %1759
  store i32 %1761, i32* %score, align 4
  br label %1762

; <label>:1762                                    ; preds = %1758, %1755, %1752, %1749, %1746
  %1763 = load i32* %br, align 4
  %1764 = icmp ne i32 %1763, 0
  br i1 %1764, label %1778, label %1765

; <label>:1765                                    ; preds = %1762
  %1766 = load i32* %bq, align 4
  %1767 = icmp ne i32 %1766, 0
  br i1 %1767, label %1778, label %1768

; <label>:1768                                    ; preds = %1765
  %1769 = load i32* %bb, align 4
  %1770 = icmp ne i32 %1769, 0
  br i1 %1770, label %1778, label %1771

; <label>:1771                                    ; preds = %1768
  %1772 = load i32* %bn, align 4
  %1773 = icmp ne i32 %1772, 0
  br i1 %1773, label %1778, label %1774

; <label>:1774                                    ; preds = %1771
  %1775 = load i32* %wpotential, align 4
  %1776 = load i32* %score, align 4
  %1777 = add nsw i32 %1776, %1775
  store i32 %1777, i32* %score, align 4
  br label %1778

; <label>:1778                                    ; preds = %1774, %1771, %1768, %1765, %1762
  %1779 = load i32* %wp, align 4
  %1780 = icmp ne i32 %1779, 0
  br i1 %1780, label %1928, label %1781

; <label>:1781                                    ; preds = %1778
  %1782 = load i32* %bp, align 4
  %1783 = icmp ne i32 %1782, 0
  br i1 %1783, label %1928, label %1784

; <label>:1784                                    ; preds = %1781
  %1785 = load i32* %wr, align 4
  %1786 = icmp ne i32 %1785, 0
  br i1 %1786, label %1853, label %1787

; <label>:1787                                    ; preds = %1784
  %1788 = load i32* %br, align 4
  %1789 = icmp ne i32 %1788, 0
  br i1 %1789, label %1853, label %1790

; <label>:1790                                    ; preds = %1787
  %1791 = load i32* %wq, align 4
  %1792 = icmp ne i32 %1791, 0
  br i1 %1792, label %1853, label %1793

; <label>:1793                                    ; preds = %1790
  %1794 = load i32* %bq, align 4
  %1795 = icmp ne i32 %1794, 0
  br i1 %1795, label %1853, label %1796

; <label>:1796                                    ; preds = %1793
  %1797 = load i32* %bb, align 4
  %1798 = icmp ne i32 %1797, 0
  br i1 %1798, label %1810, label %1799

; <label>:1799                                    ; preds = %1796
  %1800 = load i32* %wb, align 4
  %1801 = icmp ne i32 %1800, 0
  br i1 %1801, label %1810, label %1802

; <label>:1802                                    ; preds = %1799
  %1803 = load i32* %wn, align 4
  %1804 = icmp slt i32 %1803, 3
  br i1 %1804, label %1805, label %1809

; <label>:1805                                    ; preds = %1802
  %1806 = load i32* %bn, align 4
  %1807 = icmp slt i32 %1806, 3
  br i1 %1807, label %1808, label %1809

; <label>:1808                                    ; preds = %1805
  store i32 0, i32* %score, align 4
  br label %1809

; <label>:1809                                    ; preds = %1808, %1805, %1802
  br label %1852

; <label>:1810                                    ; preds = %1799, %1796
  %1811 = load i32* %wn, align 4
  %1812 = icmp ne i32 %1811, 0
  br i1 %1812, label %1824, label %1813

; <label>:1813                                    ; preds = %1810
  %1814 = load i32* %bn, align 4
  %1815 = icmp ne i32 %1814, 0
  br i1 %1815, label %1824, label %1816

; <label>:1816                                    ; preds = %1813
  %1817 = load i32* %wb, align 4
  %1818 = load i32* %bb, align 4
  %1819 = sub nsw i32 %1817, %1818
  %1820 = call i32 @abs(i32 %1819) #6
  %1821 = icmp slt i32 %1820, 2
  br i1 %1821, label %1822, label %1823

; <label>:1822                                    ; preds = %1816
  store i32 0, i32* %score, align 4
  br label %1823

; <label>:1823                                    ; preds = %1822, %1816
  br label %1851

; <label>:1824                                    ; preds = %1813, %1810
  %1825 = load i32* %wn, align 4
  %1826 = icmp slt i32 %1825, 3
  br i1 %1826, label %1827, label %1830

; <label>:1827                                    ; preds = %1824
  %1828 = load i32* %wb, align 4
  %1829 = icmp ne i32 %1828, 0
  br i1 %1829, label %1830, label %1836

; <label>:1830                                    ; preds = %1827, %1824
  %1831 = load i32* %wb, align 4
  %1832 = icmp eq i32 %1831, 1
  br i1 %1832, label %1833, label %1850

; <label>:1833                                    ; preds = %1830
  %1834 = load i32* %wn, align 4
  %1835 = icmp ne i32 %1834, 0
  br i1 %1835, label %1850, label %1836

; <label>:1836                                    ; preds = %1833, %1827
  %1837 = load i32* %bn, align 4
  %1838 = icmp slt i32 %1837, 3
  br i1 %1838, label %1839, label %1842

; <label>:1839                                    ; preds = %1836
  %1840 = load i32* %bb, align 4
  %1841 = icmp ne i32 %1840, 0
  br i1 %1841, label %1842, label %1848

; <label>:1842                                    ; preds = %1839, %1836
  %1843 = load i32* %bb, align 4
  %1844 = icmp eq i32 %1843, 1
  br i1 %1844, label %1845, label %1849

; <label>:1845                                    ; preds = %1842
  %1846 = load i32* %bn, align 4
  %1847 = icmp ne i32 %1846, 0
  br i1 %1847, label %1849, label %1848

; <label>:1848                                    ; preds = %1845, %1839
  store i32 0, i32* %score, align 4
  br label %1849

; <label>:1849                                    ; preds = %1848, %1845, %1842
  br label %1850

; <label>:1850                                    ; preds = %1849, %1833, %1830
  br label %1851

; <label>:1851                                    ; preds = %1850, %1823
  br label %1852

; <label>:1852                                    ; preds = %1851, %1809
  br label %1927

; <label>:1853                                    ; preds = %1793, %1790, %1787, %1784
  %1854 = load i32* %wq, align 4
  %1855 = icmp ne i32 %1854, 0
  br i1 %1855, label %1926, label %1856

; <label>:1856                                    ; preds = %1853
  %1857 = load i32* %bq, align 4
  %1858 = icmp ne i32 %1857, 0
  br i1 %1858, label %1926, label %1859

; <label>:1859                                    ; preds = %1856
  %1860 = load i32* %wr, align 4
  %1861 = icmp eq i32 %1860, 1
  br i1 %1861, label %1862, label %1877

; <label>:1862                                    ; preds = %1859
  %1863 = load i32* %br, align 4
  %1864 = icmp eq i32 %1863, 1
  br i1 %1864, label %1865, label %1877

; <label>:1865                                    ; preds = %1862
  %1866 = load i32* %wn, align 4
  %1867 = load i32* %wb, align 4
  %1868 = add nsw i32 %1866, %1867
  %1869 = icmp slt i32 %1868, 2
  br i1 %1869, label %1870, label %1876

; <label>:1870                                    ; preds = %1865
  %1871 = load i32* %bn, align 4
  %1872 = load i32* %bb, align 4
  %1873 = add nsw i32 %1871, %1872
  %1874 = icmp slt i32 %1873, 2
  br i1 %1874, label %1875, label %1876

; <label>:1875                                    ; preds = %1870
  store i32 0, i32* %score, align 4
  br label %1876

; <label>:1876                                    ; preds = %1875, %1870, %1865
  br label %1925

; <label>:1877                                    ; preds = %1862, %1859
  %1878 = load i32* %wr, align 4
  %1879 = icmp eq i32 %1878, 1
  br i1 %1879, label %1880, label %1900

; <label>:1880                                    ; preds = %1877
  %1881 = load i32* %br, align 4
  %1882 = icmp ne i32 %1881, 0
  br i1 %1882, label %1900, label %1883

; <label>:1883                                    ; preds = %1880
  %1884 = load i32* %wn, align 4
  %1885 = load i32* %wb, align 4
  %1886 = add nsw i32 %1884, %1885
  %1887 = icmp eq i32 %1886, 0
  br i1 %1887, label %1888, label %1899

; <label>:1888                                    ; preds = %1883
  %1889 = load i32* %bn, align 4
  %1890 = load i32* %bb, align 4
  %1891 = add nsw i32 %1889, %1890
  %1892 = icmp eq i32 %1891, 1
  br i1 %1892, label %1898, label %1893

; <label>:1893                                    ; preds = %1888
  %1894 = load i32* %bn, align 4
  %1895 = load i32* %bb, align 4
  %1896 = add nsw i32 %1894, %1895
  %1897 = icmp eq i32 %1896, 2
  br i1 %1897, label %1898, label %1899

; <label>:1898                                    ; preds = %1893, %1888
  store i32 0, i32* %score, align 4
  br label %1899

; <label>:1899                                    ; preds = %1898, %1893, %1883
  br label %1924

; <label>:1900                                    ; preds = %1880, %1877
  %1901 = load i32* %br, align 4
  %1902 = icmp eq i32 %1901, 1
  br i1 %1902, label %1903, label %1923

; <label>:1903                                    ; preds = %1900
  %1904 = load i32* %wr, align 4
  %1905 = icmp ne i32 %1904, 0
  br i1 %1905, label %1923, label %1906

; <label>:1906                                    ; preds = %1903
  %1907 = load i32* %bn, align 4
  %1908 = load i32* %bb, align 4
  %1909 = add nsw i32 %1907, %1908
  %1910 = icmp eq i32 %1909, 0
  br i1 %1910, label %1911, label %1922

; <label>:1911                                    ; preds = %1906
  %1912 = load i32* %wn, align 4
  %1913 = load i32* %wb, align 4
  %1914 = add nsw i32 %1912, %1913
  %1915 = icmp eq i32 %1914, 1
  br i1 %1915, label %1921, label %1916

; <label>:1916                                    ; preds = %1911
  %1917 = load i32* %wn, align 4
  %1918 = load i32* %wb, align 4
  %1919 = add nsw i32 %1917, %1918
  %1920 = icmp eq i32 %1919, 2
  br i1 %1920, label %1921, label %1922

; <label>:1921                                    ; preds = %1916, %1911
  store i32 0, i32* %score, align 4
  br label %1922

; <label>:1922                                    ; preds = %1921, %1916, %1906
  br label %1923

; <label>:1923                                    ; preds = %1922, %1903, %1900
  br label %1924

; <label>:1924                                    ; preds = %1923, %1899
  br label %1925

; <label>:1925                                    ; preds = %1924, %1876
  br label %1926

; <label>:1926                                    ; preds = %1925, %1856, %1853
  br label %1927

; <label>:1927                                    ; preds = %1926, %1852
  br label %2064

; <label>:1928                                    ; preds = %1781, %1778
  %1929 = load i32* %wn, align 4
  %1930 = load i32* %wb, align 4
  %1931 = add nsw i32 %1929, %1930
  %1932 = load i32* %bn, align 4
  %1933 = load i32* %bb, align 4
  %1934 = add nsw i32 %1932, %1933
  %1935 = icmp ne i32 %1931, %1934
  br i1 %1935, label %1936, label %2034

; <label>:1936                                    ; preds = %1928
  %1937 = load i32* %wq, align 4
  %1938 = load i32* %wr, align 4
  %1939 = add nsw i32 %1937, %1938
  %1940 = load i32* %bq, align 4
  %1941 = load i32* %br, align 4
  %1942 = add nsw i32 %1940, %1941
  %1943 = icmp eq i32 %1939, %1942
  br i1 %1943, label %1944, label %1959

; <label>:1944                                    ; preds = %1936
  %1945 = load i32* %wn, align 4
  %1946 = load i32* %wb, align 4
  %1947 = add nsw i32 %1945, %1946
  %1948 = load i32* %bn, align 4
  %1949 = load i32* %bb, align 4
  %1950 = add nsw i32 %1948, %1949
  %1951 = icmp sgt i32 %1947, %1950
  br i1 %1951, label %1952, label %1955

; <label>:1952                                    ; preds = %1944
  %1953 = load i32* %score, align 4
  %1954 = add nsw i32 %1953, 120
  store i32 %1954, i32* %score, align 4
  br label %1958

; <label>:1955                                    ; preds = %1944
  %1956 = load i32* %score, align 4
  %1957 = sub nsw i32 %1956, 120
  store i32 %1957, i32* %score, align 4
  br label %1958

; <label>:1958                                    ; preds = %1955, %1952
  br label %2033

; <label>:1959                                    ; preds = %1936
  %1960 = load i32* %wr, align 4
  %1961 = load i32* %wq, align 4
  %1962 = add nsw i32 %1960, %1961
  %1963 = load i32* %br, align 4
  %1964 = load i32* %bq, align 4
  %1965 = add nsw i32 %1963, %1964
  %1966 = sub nsw i32 %1962, %1965
  %1967 = call i32 @abs(i32 %1966) #6
  %1968 = icmp eq i32 %1967, 1
  br i1 %1968, label %1969, label %1995

; <label>:1969                                    ; preds = %1959
  %1970 = load i32* %wb, align 4
  %1971 = load i32* %wn, align 4
  %1972 = add nsw i32 %1970, %1971
  %1973 = load i32* %bb, align 4
  %1974 = load i32* %bn, align 4
  %1975 = add nsw i32 %1973, %1974
  %1976 = add nsw i32 %1975, 1
  %1977 = icmp sgt i32 %1972, %1976
  br i1 %1977, label %1978, label %1981

; <label>:1978                                    ; preds = %1969
  %1979 = load i32* %score, align 4
  %1980 = add nsw i32 %1979, 120
  store i32 %1980, i32* %score, align 4
  br label %1994

; <label>:1981                                    ; preds = %1969
  %1982 = load i32* %bb, align 4
  %1983 = load i32* %bn, align 4
  %1984 = add nsw i32 %1982, %1983
  %1985 = load i32* %wb, align 4
  %1986 = load i32* %wn, align 4
  %1987 = add nsw i32 %1985, %1986
  %1988 = add nsw i32 %1987, 1
  %1989 = icmp sgt i32 %1984, %1988
  br i1 %1989, label %1990, label %1993

; <label>:1990                                    ; preds = %1981
  %1991 = load i32* %score, align 4
  %1992 = sub nsw i32 %1991, 120
  store i32 %1992, i32* %score, align 4
  br label %1993

; <label>:1993                                    ; preds = %1990, %1981
  br label %1994

; <label>:1994                                    ; preds = %1993, %1978
  br label %2032

; <label>:1995                                    ; preds = %1959
  %1996 = load i32* %wr, align 4
  %1997 = load i32* %wq, align 4
  %1998 = add nsw i32 %1996, %1997
  %1999 = load i32* %br, align 4
  %2000 = load i32* %bq, align 4
  %2001 = add nsw i32 %1999, %2000
  %2002 = sub nsw i32 %1998, %2001
  %2003 = call i32 @abs(i32 %2002) #6
  %2004 = icmp eq i32 %2003, 2
  br i1 %2004, label %2005, label %2031

; <label>:2005                                    ; preds = %1995
  %2006 = load i32* %wb, align 4
  %2007 = load i32* %wn, align 4
  %2008 = add nsw i32 %2006, %2007
  %2009 = load i32* %bb, align 4
  %2010 = load i32* %bn, align 4
  %2011 = add nsw i32 %2009, %2010
  %2012 = add nsw i32 %2011, 2
  %2013 = icmp sgt i32 %2008, %2012
  br i1 %2013, label %2014, label %2017

; <label>:2014                                    ; preds = %2005
  %2015 = load i32* %score, align 4
  %2016 = add nsw i32 %2015, 120
  store i32 %2016, i32* %score, align 4
  br label %2030

; <label>:2017                                    ; preds = %2005
  %2018 = load i32* %bb, align 4
  %2019 = load i32* %bn, align 4
  %2020 = add nsw i32 %2018, %2019
  %2021 = load i32* %wb, align 4
  %2022 = load i32* %wn, align 4
  %2023 = add nsw i32 %2021, %2022
  %2024 = add nsw i32 %2023, 2
  %2025 = icmp sgt i32 %2020, %2024
  br i1 %2025, label %2026, label %2029

; <label>:2026                                    ; preds = %2017
  %2027 = load i32* %score, align 4
  %2028 = sub nsw i32 %2027, 120
  store i32 %2028, i32* %score, align 4
  br label %2029

; <label>:2029                                    ; preds = %2026, %2017
  br label %2030

; <label>:2030                                    ; preds = %2029, %2014
  br label %2031

; <label>:2031                                    ; preds = %2030, %1995
  br label %2032

; <label>:2032                                    ; preds = %2031, %1994
  br label %2033

; <label>:2033                                    ; preds = %2032, %1958
  br label %2063

; <label>:2034                                    ; preds = %1928
  %2035 = load i32* %wq, align 4
  %2036 = load i32* %wr, align 4
  %2037 = add nsw i32 %2035, %2036
  %2038 = load i32* %bq, align 4
  %2039 = load i32* %br, align 4
  %2040 = add nsw i32 %2038, %2039
  %2041 = icmp eq i32 %2037, %2040
  br i1 %2041, label %2042, label %2062

; <label>:2042                                    ; preds = %2034
  %2043 = load i32* %wq, align 4
  %2044 = icmp ne i32 %2043, 0
  br i1 %2044, label %2045, label %2051

; <label>:2045                                    ; preds = %2042
  %2046 = load i32* %bq, align 4
  %2047 = icmp ne i32 %2046, 0
  br i1 %2047, label %2051, label %2048

; <label>:2048                                    ; preds = %2045
  %2049 = load i32* %score, align 4
  %2050 = add nsw i32 %2049, 120
  store i32 %2050, i32* %score, align 4
  br label %2061

; <label>:2051                                    ; preds = %2045, %2042
  %2052 = load i32* %wq, align 4
  %2053 = icmp ne i32 %2052, 0
  br i1 %2053, label %2060, label %2054

; <label>:2054                                    ; preds = %2051
  %2055 = load i32* %bq, align 4
  %2056 = icmp ne i32 %2055, 0
  br i1 %2056, label %2057, label %2060

; <label>:2057                                    ; preds = %2054
  %2058 = load i32* %score, align 4
  %2059 = sub nsw i32 %2058, 120
  store i32 %2059, i32* %score, align 4
  br label %2060

; <label>:2060                                    ; preds = %2057, %2054, %2051
  br label %2061

; <label>:2061                                    ; preds = %2060, %2048
  br label %2062

; <label>:2062                                    ; preds = %2061, %2034
  br label %2063

; <label>:2063                                    ; preds = %2062, %2033
  br label %2064

; <label>:2064                                    ; preds = %2063, %1927
  %2065 = load i32* %score, align 4
  call void @storeECache(i32 %2065)
  %2066 = load i32* @Material, align 4
  %2067 = load i32* %score, align 4
  %2068 = sub nsw i32 %2066, %2067
  %2069 = call i32 @abs(i32 %2068) #6
  %2070 = load i32* @maxposdiff, align 4
  %2071 = icmp sgt i32 %2069, %2070
  br i1 %2071, label %2072, label %2086

; <label>:2072                                    ; preds = %2064
  %2073 = load i32* @Material, align 4
  %2074 = load i32* %score, align 4
  %2075 = sub nsw i32 %2073, %2074
  %2076 = call i32 @abs(i32 %2075) #6
  %2077 = icmp slt i32 1000, %2076
  br i1 %2077, label %2078, label %2079

; <label>:2078                                    ; preds = %2072
  br label %2084

; <label>:2079                                    ; preds = %2072
  %2080 = load i32* @Material, align 4
  %2081 = load i32* %score, align 4
  %2082 = sub nsw i32 %2080, %2081
  %2083 = call i32 @abs(i32 %2082) #6
  br label %2084

; <label>:2084                                    ; preds = %2079, %2078
  %2085 = phi i32 [ 1000, %2078 ], [ %2083, %2079 ]
  store i32 %2085, i32* @maxposdiff, align 4
  br label %2086

; <label>:2086                                    ; preds = %2084, %2064
  %2087 = load i32* @white_to_move, align 4
  %2088 = icmp eq i32 %2087, 1
  br i1 %2088, label %2089, label %2091

; <label>:2089                                    ; preds = %2086
  %2090 = load i32* %score, align 4
  store i32 %2090, i32* %1
  br label %2094

; <label>:2091                                    ; preds = %2086
  %2092 = load i32* %score, align 4
  %2093 = sub nsw i32 0, %2092
  store i32 %2093, i32* %1
  br label %2094

; <label>:2094                                    ; preds = %2091, %2089, %63, %61, %51, %25
  %2095 = load i32* %1
  ret i32 %2095
}

declare void @checkECache(i32*, i32*) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #4

declare void @storeECache(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
