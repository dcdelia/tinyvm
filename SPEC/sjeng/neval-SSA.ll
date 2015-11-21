; ModuleID = 'neval.ll'
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
  br label %1

; <label>:1                                       ; preds = %35, %0
  %a.0 = phi i32 [ 1, %0 ], [ %a.1, %35 ]
  %j.0 = phi i32 [ 1, %0 ], [ %36, %35 ]
  %xnum_pieces.0 = phi i32 [ 0, %0 ], [ %xnum_pieces.2, %35 ]
  %2 = load i32* @piece_count, align 4
  %3 = icmp sle i32 %a.0, %2
  br i1 %3, label %4, label %37

; <label>:4                                       ; preds = %1
  %5 = sext i32 %j.0 to i64
  %6 = getelementptr inbounds [62 x i32]* @pieces, i32 0, i64 %5
  %7 = load i32* %6, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %10, label %9

; <label>:9                                       ; preds = %4
  br label %35

; <label>:10                                      ; preds = %4
  %11 = add nsw i32 %a.0, 1
  br label %12

; <label>:12                                      ; preds = %10
  %13 = sext i32 %7 to i64
  %14 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %13
  %15 = load i32* %14, align 4
  %16 = icmp ne i32 %15, 1
  br i1 %16, label %17, label %34

; <label>:17                                      ; preds = %12
  %18 = sext i32 %7 to i64
  %19 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %18
  %20 = load i32* %19, align 4
  %21 = icmp ne i32 %20, 2
  br i1 %21, label %22, label %34

; <label>:22                                      ; preds = %17
  %23 = sext i32 %7 to i64
  %24 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %23
  %25 = load i32* %24, align 4
  %26 = icmp ne i32 %25, 13
  br i1 %26, label %27, label %34

; <label>:27                                      ; preds = %22
  %28 = sext i32 %7 to i64
  %29 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %28
  %30 = load i32* %29, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32                                      ; preds = %27
  %33 = add nsw i32 %xnum_pieces.0, 1
  br label %34

; <label>:34                                      ; preds = %32, %27, %22, %17, %12
  %xnum_pieces.1 = phi i32 [ %33, %32 ], [ %xnum_pieces.0, %27 ], [ %xnum_pieces.0, %22 ], [ %xnum_pieces.0, %17 ], [ %xnum_pieces.0, %12 ]
  br label %35

; <label>:35                                      ; preds = %34, %9
  %a.1 = phi i32 [ %11, %34 ], [ %a.0, %9 ]
  %xnum_pieces.2 = phi i32 [ %xnum_pieces.1, %34 ], [ %xnum_pieces.0, %9 ]
  %36 = add nsw i32 %j.0, 1
  br label %1

; <label>:37                                      ; preds = %1
  %38 = icmp sge i32 %xnum_pieces.0, 12
  br i1 %38, label %39, label %52

; <label>:39                                      ; preds = %37
  %40 = load i32* @white_castled, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %45

; <label>:42                                      ; preds = %39
  %43 = load i32* @black_castled, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %52, label %45

; <label>:45                                      ; preds = %42, %39
  %46 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 30), align 4
  %47 = icmp eq i32 %46, 5
  br i1 %47, label %51, label %48

; <label>:48                                      ; preds = %45
  %49 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 114), align 4
  %50 = icmp eq i32 %49, 6
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %48, %45
  store i32 0, i32* @phase, align 4
  br label %57

; <label>:52                                      ; preds = %48, %42, %37
  %53 = icmp sle i32 %xnum_pieces.0, 6
  br i1 %53, label %54, label %55

; <label>:54                                      ; preds = %52
  store i32 2, i32* @phase, align 4
  br label %56

; <label>:55                                      ; preds = %52
  store i32 1, i32* @phase, align 4
  br label %56

; <label>:56                                      ; preds = %55, %54
  br label %57

; <label>:57                                      ; preds = %56, %51
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @King(i32 %sq, i32 %c) #0 {
  %1 = sext i32 %sq to i64
  %2 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1
  %3 = load i32* %2, align 4
  %4 = icmp sge i32 %3, 6
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %0
  %6 = sub nsw i32 %sq, 1
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %7
  %9 = load i32* %8, align 4
  %10 = add nsw i32 %9, 1
  %11 = ashr i32 %10, 1
  %12 = icmp eq i32 %11, 4
  br i1 %12, label %13, label %23

; <label>:13                                      ; preds = %5
  %14 = sub nsw i32 %sq, 1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %15
  %17 = load i32* %16, align 4
  %18 = add nsw i32 %17, 1
  %19 = and i32 %18, 1
  %20 = icmp eq i32 %19, %c
  br i1 %20, label %21, label %23

; <label>:21                                      ; preds = %13
  %22 = add nsw i32 0, 2
  br label %23

; <label>:23                                      ; preds = %21, %13, %5, %0
  %s.0 = phi i32 [ %22, %21 ], [ 0, %13 ], [ 0, %5 ], [ 0, %0 ]
  %24 = sext i32 %sq to i64
  %25 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %24
  %26 = load i32* %25, align 4
  %27 = icmp sge i32 %26, 6
  br i1 %27, label %28, label %46

; <label>:28                                      ; preds = %23
  %29 = add nsw i32 %sq, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %30
  %32 = load i32* %31, align 4
  %33 = add nsw i32 %32, 1
  %34 = ashr i32 %33, 1
  %35 = icmp eq i32 %34, 4
  br i1 %35, label %36, label %46

; <label>:36                                      ; preds = %28
  %37 = add nsw i32 %sq, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %38
  %40 = load i32* %39, align 4
  %41 = add nsw i32 %40, 1
  %42 = and i32 %41, 1
  %43 = icmp eq i32 %42, %c
  br i1 %43, label %44, label %46

; <label>:44                                      ; preds = %36
  %45 = add nsw i32 %s.0, 2
  br label %46

; <label>:46                                      ; preds = %44, %36, %28, %23
  %s.1 = phi i32 [ %45, %44 ], [ %s.0, %36 ], [ %s.0, %28 ], [ %s.0, %23 ]
  %47 = icmp eq i32 %c, 1
  br i1 %47, label %48, label %50

; <label>:48                                      ; preds = %46
  %49 = sub nsw i32 0, %s.1
  br label %50

; <label>:50                                      ; preds = %48, %46
  %s.2 = phi i32 [ %49, %48 ], [ %s.1, %46 ]
  ret i32 %s.2
}

; Function Attrs: nounwind uwtable
define i32 @Queen(i32 %sq, i32 %c) #0 {
  %1 = xor i32 %c, 1
  %2 = add nsw i32 0, 900
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %3
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = sext i32 %sq to i64
  %8 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %7
  %9 = getelementptr inbounds [144 x i32]* %8, i32 0, i64 %6
  %10 = load i32* %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [8 x i32]* @std_q_tropism, i32 0, i64 %11
  %13 = load i32* %12, align 4
  %14 = add nsw i32 %2, %13
  %15 = call i32 @rook_mobility(i32 %sq)
  %16 = shl i32 %15, 1
  %17 = call i32 @bishop_mobility(i32 %sq)
  %18 = shl i32 %17, 1
  %19 = add nsw i32 %16, %18
  %20 = icmp sle i32 %19, 4
  br i1 %20, label %21, label %33

; <label>:21                                      ; preds = %0
  %22 = icmp eq i32 %19, 0
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %21
  %24 = sub nsw i32 %19, 15
  br label %32

; <label>:25                                      ; preds = %21
  %26 = icmp eq i32 %19, 2
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %25
  %28 = sub nsw i32 %19, 10
  br label %31

; <label>:29                                      ; preds = %25
  %30 = sub nsw i32 %19, 5
  br label %31

; <label>:31                                      ; preds = %29, %27
  %mob.0 = phi i32 [ %28, %27 ], [ %30, %29 ]
  br label %32

; <label>:32                                      ; preds = %31, %23
  %mob.1 = phi i32 [ %24, %23 ], [ %mob.0, %31 ]
  br label %33

; <label>:33                                      ; preds = %32, %0
  %mob.2 = phi i32 [ %mob.1, %32 ], [ %19, %0 ]
  %34 = add nsw i32 %14, %mob.2
  %35 = icmp eq i32 %c, 1
  br i1 %35, label %36, label %38

; <label>:36                                      ; preds = %33
  %37 = sub nsw i32 0, %34
  br label %38

; <label>:38                                      ; preds = %36, %33
  %s.0 = phi i32 [ %37, %36 ], [ %34, %33 ]
  ret i32 %s.0
}

; Function Attrs: nounwind uwtable
define internal i32 @rook_mobility(i32 %square) #0 {
  br label %1

; <label>:1                                       ; preds = %21, %0
  %m.0 = phi i32 [ 0, %0 ], [ %m.1, %21 ]
  %diridx.0 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %2 = icmp slt i32 %diridx.0, 4
  br i1 %2, label %3, label %23

; <label>:3                                       ; preds = %1
  %4 = sext i32 %diridx.0 to i64
  %5 = getelementptr inbounds [4 x i32]* @rook_mobility.dir, i32 0, i64 %4
  %6 = load i32* %5, align 4
  %7 = add nsw i32 %square, %6
  br label %8

; <label>:8                                       ; preds = %15, %3
  %m.1 = phi i32 [ %m.0, %3 ], [ %14, %15 ]
  %l.0 = phi i32 [ %7, %3 ], [ %19, %15 ]
  %9 = sext i32 %l.0 to i64
  %10 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %9
  %11 = load i32* %10, align 4
  %12 = icmp eq i32 %11, 13
  br i1 %12, label %13, label %20

; <label>:13                                      ; preds = %8
  %14 = add nsw i32 %m.1, 1
  br label %15

; <label>:15                                      ; preds = %13
  %16 = sext i32 %diridx.0 to i64
  %17 = getelementptr inbounds [4 x i32]* @rook_mobility.dir, i32 0, i64 %16
  %18 = load i32* %17, align 4
  %19 = add nsw i32 %l.0, %18
  br label %8

; <label>:20                                      ; preds = %8
  br label %21

; <label>:21                                      ; preds = %20
  %22 = add nsw i32 %diridx.0, 1
  br label %1

; <label>:23                                      ; preds = %1
  ret i32 %m.0
}

; Function Attrs: nounwind uwtable
define internal i32 @bishop_mobility(i32 %square) #0 {
  br label %1

; <label>:1                                       ; preds = %21, %0
  %m.0 = phi i32 [ 0, %0 ], [ %m.1, %21 ]
  %diridx.0 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %2 = icmp slt i32 %diridx.0, 4
  br i1 %2, label %3, label %23

; <label>:3                                       ; preds = %1
  %4 = sext i32 %diridx.0 to i64
  %5 = getelementptr inbounds [4 x i32]* @bishop_mobility.dir, i32 0, i64 %4
  %6 = load i32* %5, align 4
  %7 = add nsw i32 %square, %6
  br label %8

; <label>:8                                       ; preds = %15, %3
  %m.1 = phi i32 [ %m.0, %3 ], [ %14, %15 ]
  %l.0 = phi i32 [ %7, %3 ], [ %19, %15 ]
  %9 = sext i32 %l.0 to i64
  %10 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %9
  %11 = load i32* %10, align 4
  %12 = icmp eq i32 %11, 13
  br i1 %12, label %13, label %20

; <label>:13                                      ; preds = %8
  %14 = add nsw i32 %m.1, 1
  br label %15

; <label>:15                                      ; preds = %13
  %16 = sext i32 %diridx.0 to i64
  %17 = getelementptr inbounds [4 x i32]* @bishop_mobility.dir, i32 0, i64 %16
  %18 = load i32* %17, align 4
  %19 = add nsw i32 %l.0, %18
  br label %8

; <label>:20                                      ; preds = %8
  br label %21

; <label>:21                                      ; preds = %20
  %22 = add nsw i32 %diridx.0, 1
  br label %1

; <label>:23                                      ; preds = %1
  ret i32 %m.0
}

; Function Attrs: nounwind uwtable
define i32 @Rook(i32 %sq, i32 %c) #0 {
  %1 = xor i32 %c, 1
  %2 = add nsw i32 0, 500
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %3
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = sext i32 %sq to i64
  %8 = getelementptr inbounds [144 x [144 x i32]]* @rookdistance, i32 0, i64 %7
  %9 = getelementptr inbounds [144 x i32]* %8, i32 0, i64 %6
  %10 = load i32* %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [16 x i32]* @std_r_tropism, i32 0, i64 %11
  %13 = load i32* %12, align 4
  %14 = add nsw i32 %2, %13
  %15 = call i32 @rook_mobility(i32 %sq)
  %16 = shl i32 %15, 1
  %17 = icmp sle i32 %16, 2
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %0
  %19 = sub nsw i32 %16, 5
  br label %20

; <label>:20                                      ; preds = %18, %0
  %mob.0 = phi i32 [ %19, %18 ], [ %16, %0 ]
  %21 = add nsw i32 %14, %mob.0
  %22 = sub nsw i32 %sq, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %23
  %25 = load i32* %24, align 4
  %26 = icmp ne i32 %25, 13
  br i1 %26, label %27, label %35

; <label>:27                                      ; preds = %20
  %28 = add nsw i32 %sq, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %29
  %31 = load i32* %30, align 4
  %32 = icmp ne i32 %31, 13
  br i1 %32, label %33, label %35

; <label>:33                                      ; preds = %27
  %34 = sub nsw i32 %21, 5
  br label %35

; <label>:35                                      ; preds = %33, %27, %20
  %s.0 = phi i32 [ %34, %33 ], [ %21, %27 ], [ %21, %20 ]
  %36 = load i32* @wmat, align 4
  %37 = icmp ne i32 %36, 1300
  br i1 %37, label %41, label %38

; <label>:38                                      ; preds = %35
  %39 = load i32* @bmat, align 4
  %40 = icmp ne i32 %39, 1300
  br i1 %40, label %41, label %81

; <label>:41                                      ; preds = %38, %35
  %42 = sext i32 %c to i64
  %43 = getelementptr inbounds [2 x i32]* @Rook.square_d1, i32 0, i64 %42
  %44 = load i32* %43, align 4
  %45 = icmp eq i32 %sq, %44
  br i1 %45, label %46, label %72

; <label>:46                                      ; preds = %41
  %47 = add nsw i32 %s.0, 10
  %48 = sext i32 %c to i64
  %49 = getelementptr inbounds [2 x i32]* @Rook.square_d1, i32 0, i64 %48
  %50 = load i32* %49, align 4
  %51 = add nsw i32 %50, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %52
  %54 = load i32* %53, align 4
  %55 = add nsw i32 %54, 1
  %56 = ashr i32 %55, 1
  %57 = icmp eq i32 %56, 4
  br i1 %57, label %58, label %71

; <label>:58                                      ; preds = %46
  %59 = sext i32 %c to i64
  %60 = getelementptr inbounds [2 x i32]* @Rook.square_d1, i32 0, i64 %59
  %61 = load i32* %60, align 4
  %62 = add nsw i32 %61, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %63
  %65 = load i32* %64, align 4
  %66 = add nsw i32 %65, 1
  %67 = and i32 %66, 1
  %68 = icmp eq i32 %67, %c
  br i1 %68, label %69, label %71

; <label>:69                                      ; preds = %58
  %70 = add nsw i32 %47, 5
  br label %71

; <label>:71                                      ; preds = %69, %58, %46
  %s.1 = phi i32 [ %70, %69 ], [ %47, %58 ], [ %47, %46 ]
  br label %72

; <label>:72                                      ; preds = %71, %41
  %s.2 = phi i32 [ %s.1, %71 ], [ %s.0, %41 ]
  %73 = sext i32 %c to i64
  %74 = getelementptr inbounds [2 x i32]* @Rook.square_d1, i32 0, i64 %73
  %75 = load i32* %74, align 4
  %76 = add nsw i32 %75, 1
  %77 = icmp eq i32 %sq, %76
  br i1 %77, label %78, label %80

; <label>:78                                      ; preds = %72
  %79 = add nsw i32 %s.2, 10
  br label %80

; <label>:80                                      ; preds = %78, %72
  %s.3 = phi i32 [ %79, %78 ], [ %s.2, %72 ]
  br label %81

; <label>:81                                      ; preds = %80, %38
  %s.4 = phi i32 [ %s.3, %80 ], [ %s.0, %38 ]
  %82 = icmp eq i32 %c, 1
  br i1 %82, label %83, label %85

; <label>:83                                      ; preds = %81
  %84 = sub nsw i32 0, %s.4
  br label %85

; <label>:85                                      ; preds = %83, %81
  %s.5 = phi i32 [ %84, %83 ], [ %s.4, %81 ]
  ret i32 %s.5
}

; Function Attrs: nounwind uwtable
define i32 @Bishop(i32 %sq, i32 %c) #0 {
  %1 = xor i32 %c, 1
  %2 = add nsw i32 0, 325
  %3 = sext i32 %sq to i64
  %4 = getelementptr inbounds [144 x i32]* @sbishop, i32 0, i64 %3
  %5 = load i32* %4, align 4
  %6 = add nsw i32 %2, %5
  %7 = sext i32 %1 to i64
  %8 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %7
  %9 = load i32* %8, align 4
  %10 = sext i32 %9 to i64
  %11 = sext i32 %sq to i64
  %12 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %11
  %13 = getelementptr inbounds [144 x i32]* %12, i32 0, i64 %10
  %14 = load i32* %13, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [8 x i32]* @std_b_tropism, i32 0, i64 %15
  %17 = load i32* %16, align 4
  %18 = add nsw i32 %6, %17
  %19 = call i32 @bishop_mobility(i32 %sq)
  %20 = shl i32 %19, 1
  %21 = icmp sle i32 %20, 2
  br i1 %21, label %22, label %24

; <label>:22                                      ; preds = %0
  %23 = sub nsw i32 %20, 5
  br label %24

; <label>:24                                      ; preds = %22, %0
  %mob.0 = phi i32 [ %23, %22 ], [ %20, %0 ]
  %25 = add nsw i32 %18, %mob.0
  %26 = icmp eq i32 %c, 0
  br i1 %26, label %27, label %32

; <label>:27                                      ; preds = %24
  %28 = icmp eq i32 %sq, 39
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %27
  %30 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 52), align 4
  %31 = icmp eq i32 %30, 1
  br i1 %31, label %39, label %32

; <label>:32                                      ; preds = %29, %27, %24
  %33 = icmp eq i32 %c, 1
  br i1 %33, label %34, label %41

; <label>:34                                      ; preds = %32
  %35 = icmp eq i32 %sq, 99
  br i1 %35, label %36, label %41

; <label>:36                                      ; preds = %34
  %37 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 88), align 4
  %38 = icmp eq i32 %37, 2
  br i1 %38, label %39, label %41

; <label>:39                                      ; preds = %36, %29
  %40 = sub nsw i32 %25, 5
  br label %41

; <label>:41                                      ; preds = %39, %36, %34, %32
  %s.0 = phi i32 [ %40, %39 ], [ %25, %36 ], [ %25, %34 ], [ %25, %32 ]
  %42 = icmp eq i32 %c, 1
  br i1 %42, label %43, label %45

; <label>:43                                      ; preds = %41
  %44 = sub nsw i32 0, %s.0
  br label %45

; <label>:45                                      ; preds = %43, %41
  %s.1 = phi i32 [ %44, %43 ], [ %s.0, %41 ]
  ret i32 %s.1
}

; Function Attrs: nounwind uwtable
define i32 @Knight(i32 %sq, i32 %c) #0 {
  %1 = xor i32 %c, 1
  %2 = add nsw i32 0, 310
  %3 = sext i32 %sq to i64
  %4 = getelementptr inbounds [144 x i32]* @sknight, i32 0, i64 %3
  %5 = load i32* %4, align 4
  %6 = add nsw i32 %2, %5
  %7 = sext i32 %1 to i64
  %8 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %7
  %9 = load i32* %8, align 4
  %10 = sext i32 %9 to i64
  %11 = sext i32 %sq to i64
  %12 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %11
  %13 = getelementptr inbounds [144 x i32]* %12, i32 0, i64 %10
  %14 = load i32* %13, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [8 x i32]* @std_n_tropism, i32 0, i64 %15
  %17 = load i32* %16, align 4
  %18 = add nsw i32 %6, %17
  %19 = icmp eq i32 %c, 1
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %0
  %21 = sub nsw i32 0, %18
  br label %22

; <label>:22                                      ; preds = %20, %0
  %s.0 = phi i32 [ %21, %20 ], [ %18, %0 ]
  ret i32 %s.0
}

; Function Attrs: nounwind uwtable
define i32 @Pawn(i32 %sq, i32 %c) #0 {
  %1 = xor i32 %c, 1
  %2 = add nsw i32 0, 100
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %3
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = sext i32 %sq to i64
  %8 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %7
  %9 = getelementptr inbounds [144 x i32]* %8, i32 0, i64 %6
  %10 = load i32* %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [8 x i32]* @std_p_tropism, i32 0, i64 %11
  %13 = load i32* %12, align 4
  %14 = add nsw i32 %2, %13
  %15 = sext i32 %c to i64
  %16 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %15
  %17 = load i32* %16, align 4
  %18 = sext i32 %17 to i64
  %19 = sext i32 %sq to i64
  %20 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %19
  %21 = getelementptr inbounds [144 x i32]* %20, i32 0, i64 %18
  %22 = load i32* %21, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x i32]* @std_own_p_tropism, i32 0, i64 %23
  %25 = load i32* %24, align 4
  %26 = add nsw i32 %14, %25
  %27 = add nsw i32 %sq, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %28
  %30 = load i32* %29, align 4
  %31 = add nsw i32 %30, 1
  %32 = ashr i32 %31, 1
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %34, label %44

; <label>:34                                      ; preds = %0
  %35 = add nsw i32 %sq, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %36
  %38 = load i32* %37, align 4
  %39 = add nsw i32 %38, 1
  %40 = and i32 %39, 1
  %41 = icmp eq i32 %40, %c
  br i1 %41, label %42, label %44

; <label>:42                                      ; preds = %34
  %43 = add nsw i32 %26, 5
  br label %44

; <label>:44                                      ; preds = %42, %34, %0
  %s.0 = phi i32 [ %43, %42 ], [ %26, %34 ], [ %26, %0 ]
  %45 = add nsw i32 %sq, 11
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %46
  %48 = load i32* %47, align 4
  %49 = add nsw i32 %48, 1
  %50 = ashr i32 %49, 1
  %51 = icmp eq i32 %50, 1
  br i1 %51, label %52, label %62

; <label>:52                                      ; preds = %44
  %53 = add nsw i32 %sq, 11
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %54
  %56 = load i32* %55, align 4
  %57 = add nsw i32 %56, 1
  %58 = and i32 %57, 1
  %59 = icmp eq i32 %58, %c
  br i1 %59, label %60, label %62

; <label>:60                                      ; preds = %52
  %61 = add nsw i32 %s.0, 1
  br label %81

; <label>:62                                      ; preds = %52, %44
  %63 = add nsw i32 %sq, 13
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %64
  %66 = load i32* %65, align 4
  %67 = add nsw i32 %66, 1
  %68 = ashr i32 %67, 1
  %69 = icmp eq i32 %68, 1
  br i1 %69, label %70, label %80

; <label>:70                                      ; preds = %62
  %71 = add nsw i32 %sq, 13
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %72
  %74 = load i32* %73, align 4
  %75 = add nsw i32 %74, 1
  %76 = and i32 %75, 1
  %77 = icmp eq i32 %76, %c
  br i1 %77, label %78, label %80

; <label>:78                                      ; preds = %70
  %79 = add nsw i32 %s.0, 1
  br label %80

; <label>:80                                      ; preds = %78, %70, %62
  %s.1 = phi i32 [ %79, %78 ], [ %s.0, %70 ], [ %s.0, %62 ]
  br label %81

; <label>:81                                      ; preds = %80, %60
  %s.2 = phi i32 [ %61, %60 ], [ %s.1, %80 ]
  %82 = icmp eq i32 %c, 1
  br i1 %82, label %83, label %85

; <label>:83                                      ; preds = %81
  %84 = sub nsw i32 0, %s.2
  br label %85

; <label>:85                                      ; preds = %83, %81
  %s.3 = phi i32 [ %84, %83 ], [ %s.2, %81 ]
  ret i32 %s.3
}

; Function Attrs: nounwind uwtable
define i32 @ErrorIt(i32 %sq, i32 %c) #0 {
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str, i32 0, i32 0), i32 %sq, i32 %c)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @std_eval(i32 %alpha, i32 %beta) #0 {
  %pawns = alloca [2 x [11 x i32]], align 16
  %white_back_pawn = alloca [11 x i32], align 16
  %black_back_pawn = alloca [11 x i32], align 16
  %score = alloca i32, align 4
  %in_cache = alloca i32, align 4
  store i32 0, i32* %score, align 4
  %1 = load i32* @white_to_move, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = load i32* @Material, align 4
  br label %8

; <label>:5                                       ; preds = %0
  %6 = load i32* @Material, align 4
  %7 = sub nsw i32 0, %6
  br label %8

; <label>:8                                       ; preds = %5, %3
  %9 = phi i32 [ %4, %3 ], [ %7, %5 ]
  %10 = load i32* @maxposdiff, align 4
  %11 = sub nsw i32 %9, %10
  %12 = icmp sge i32 %11, %beta
  br i1 %12, label %13, label %25

; <label>:13                                      ; preds = %8
  %14 = load i32* @white_to_move, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16                                      ; preds = %13
  %17 = load i32* @Material, align 4
  br label %21

; <label>:18                                      ; preds = %13
  %19 = load i32* @Material, align 4
  %20 = sub nsw i32 0, %19
  br label %21

; <label>:21                                      ; preds = %18, %16
  %22 = phi i32 [ %17, %16 ], [ %20, %18 ]
  %23 = load i32* @maxposdiff, align 4
  %24 = sub nsw i32 %22, %23
  br label %1744

; <label>:25                                      ; preds = %8
  %26 = load i32* @white_to_move, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %30

; <label>:28                                      ; preds = %25
  %29 = load i32* @Material, align 4
  br label %33

; <label>:30                                      ; preds = %25
  %31 = load i32* @Material, align 4
  %32 = sub nsw i32 0, %31
  br label %33

; <label>:33                                      ; preds = %30, %28
  %34 = phi i32 [ %29, %28 ], [ %32, %30 ]
  %35 = load i32* @maxposdiff, align 4
  %36 = add nsw i32 %34, %35
  %37 = icmp sle i32 %36, %alpha
  br i1 %37, label %38, label %50

; <label>:38                                      ; preds = %33
  %39 = load i32* @white_to_move, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41                                      ; preds = %38
  %42 = load i32* @Material, align 4
  br label %46

; <label>:43                                      ; preds = %38
  %44 = load i32* @Material, align 4
  %45 = sub nsw i32 0, %44
  br label %46

; <label>:46                                      ; preds = %43, %41
  %47 = phi i32 [ %42, %41 ], [ %45, %43 ]
  %48 = load i32* @maxposdiff, align 4
  %49 = add nsw i32 %47, %48
  br label %1744

; <label>:50                                      ; preds = %33
  store i32 0, i32* %in_cache, align 4
  call void @checkECache(i32* %score, i32* %in_cache)
  %51 = load i32* %in_cache, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %61

; <label>:53                                      ; preds = %50
  %54 = load i32* @white_to_move, align 4
  %55 = icmp eq i32 %54, 1
  br i1 %55, label %56, label %58

; <label>:56                                      ; preds = %53
  %57 = load i32* %score, align 4
  br label %1744

; <label>:58                                      ; preds = %53
  %59 = load i32* %score, align 4
  %60 = sub nsw i32 0, %59
  br label %1744

; <label>:61                                      ; preds = %50
  %62 = bitcast [2 x [11 x i32]]* %pawns to i8*
  call void @llvm.memset.p0i8.i64(i8* %62, i8 0, i64 88, i32 16, i1 false)
  br label %63

; <label>:63                                      ; preds = %70, %61
  %i.0 = phi i32 [ 0, %61 ], [ %71, %70 ]
  %64 = icmp slt i32 %i.0, 11
  br i1 %64, label %65, label %72

; <label>:65                                      ; preds = %63
  %66 = sext i32 %i.0 to i64
  %67 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %66
  store i32 7, i32* %67, align 4
  %68 = sext i32 %i.0 to i64
  %69 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %68
  store i32 2, i32* %69, align 4
  br label %70

; <label>:70                                      ; preds = %65
  %71 = add nsw i32 %i.0, 1
  br label %63

; <label>:72                                      ; preds = %63
  store i32 0, i32* @wmat, align 4
  store i32 0, i32* @bmat, align 4
  %73 = load i32* @wking_loc, align 4
  store i32 %73, i32* getelementptr inbounds ([2 x i32]* @king_locs, i32 0, i64 0), align 4
  %74 = load i32* @bking_loc, align 4
  store i32 %74, i32* getelementptr inbounds ([2 x i32]* @king_locs, i32 0, i64 1), align 4
  br label %75

; <label>:75                                      ; preds = %185, %72
  %j.0 = phi i32 [ 1, %72 ], [ %186, %185 ]
  %a.0 = phi i32 [ 1, %72 ], [ %a.1, %185 ]
  %76 = load i32* @piece_count, align 4
  %77 = icmp sle i32 %a.0, %76
  br i1 %77, label %78, label %187

; <label>:78                                      ; preds = %75
  %79 = sext i32 %j.0 to i64
  %80 = getelementptr inbounds [62 x i32]* @pieces, i32 0, i64 %79
  %81 = load i32* %80, align 4
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %84, label %83

; <label>:83                                      ; preds = %78
  br label %185

; <label>:84                                      ; preds = %78
  %85 = add nsw i32 %a.0, 1
  br label %86

; <label>:86                                      ; preds = %84
  %87 = icmp sgt i32 %81, 0
  br i1 %87, label %88, label %91

; <label>:88                                      ; preds = %86
  %89 = icmp slt i32 %81, 145
  br i1 %89, label %90, label %91

; <label>:90                                      ; preds = %88
  br label %93

; <label>:91                                      ; preds = %88, %86
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i32 440, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.std_eval, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %93

; <label>:93                                      ; preds = %92, %90
  %94 = sext i32 %81 to i64
  %95 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %94
  %96 = load i32* %95, align 4
  %97 = add nsw i32 %96, 1
  %98 = ashr i32 %97, 1
  %99 = icmp ne i32 %98, 1
  br i1 %99, label %100, label %134

; <label>:100                                     ; preds = %93
  %101 = sext i32 %81 to i64
  %102 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %101
  %103 = load i32* %102, align 4
  %104 = add nsw i32 %103, 1
  %105 = ashr i32 %104, 1
  %106 = icmp ne i32 %105, 3
  br i1 %106, label %107, label %134

; <label>:107                                     ; preds = %100
  %108 = sext i32 %81 to i64
  %109 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %108
  %110 = load i32* %109, align 4
  %111 = add nsw i32 %110, 1
  %112 = and i32 %111, 1
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %114, label %123

; <label>:114                                     ; preds = %107
  %115 = sext i32 %81 to i64
  %116 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %115
  %117 = load i32* %116, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [14 x i32]* @material, i32 0, i64 %118
  %120 = load i32* %119, align 4
  %121 = load i32* @wmat, align 4
  %122 = add nsw i32 %121, %120
  store i32 %122, i32* @wmat, align 4
  br label %133

; <label>:123                                     ; preds = %107
  %124 = sext i32 %81 to i64
  %125 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %124
  %126 = load i32* %125, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [14 x i32]* @material, i32 0, i64 %127
  %129 = load i32* %128, align 4
  %130 = call i32 @abs(i32 %129) #6
  %131 = load i32* @bmat, align 4
  %132 = add nsw i32 %131, %130
  store i32 %132, i32* @bmat, align 4
  br label %133

; <label>:133                                     ; preds = %123, %114
  br label %134

; <label>:134                                     ; preds = %133, %100, %93
  %135 = sext i32 %81 to i64
  %136 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %135
  %137 = load i32* %136, align 4
  %138 = add nsw i32 %137, 1
  %139 = ashr i32 %138, 1
  %140 = icmp eq i32 %139, 1
  br i1 %140, label %141, label %184

; <label>:141                                     ; preds = %134
  %142 = sext i32 %81 to i64
  %143 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %142
  %144 = load i32* %143, align 4
  %145 = add nsw i32 %144, 1
  %146 = sext i32 %81 to i64
  %147 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %146
  %148 = load i32* %147, align 4
  %149 = sext i32 %81 to i64
  %150 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %149
  %151 = load i32* %150, align 4
  %152 = add nsw i32 %151, 1
  %153 = and i32 %152, 1
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %155, label %169

; <label>:155                                     ; preds = %141
  %156 = sext i32 %145 to i64
  %157 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %158 = getelementptr inbounds [11 x i32]* %157, i32 0, i64 %156
  %159 = load i32* %158, align 4
  %160 = add nsw i32 %159, 1
  store i32 %160, i32* %158, align 4
  %161 = sext i32 %145 to i64
  %162 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %161
  %163 = load i32* %162, align 4
  %164 = icmp slt i32 %148, %163
  br i1 %164, label %165, label %168

; <label>:165                                     ; preds = %155
  %166 = sext i32 %145 to i64
  %167 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %166
  store i32 %148, i32* %167, align 4
  br label %168

; <label>:168                                     ; preds = %165, %155
  br label %183

; <label>:169                                     ; preds = %141
  %170 = sext i32 %145 to i64
  %171 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %172 = getelementptr inbounds [11 x i32]* %171, i32 0, i64 %170
  %173 = load i32* %172, align 4
  %174 = add nsw i32 %173, 1
  store i32 %174, i32* %172, align 4
  %175 = sext i32 %145 to i64
  %176 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %175
  %177 = load i32* %176, align 4
  %178 = icmp sgt i32 %148, %177
  br i1 %178, label %179, label %182

; <label>:179                                     ; preds = %169
  %180 = sext i32 %145 to i64
  %181 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %180
  store i32 %148, i32* %181, align 4
  br label %182

; <label>:182                                     ; preds = %179, %169
  br label %183

; <label>:183                                     ; preds = %182, %168
  br label %184

; <label>:184                                     ; preds = %183, %134
  br label %185

; <label>:185                                     ; preds = %184, %83
  %a.1 = phi i32 [ %85, %184 ], [ %a.0, %83 ]
  %186 = add nsw i32 %j.0, 1
  br label %75

; <label>:187                                     ; preds = %75
  br label %188

; <label>:188                                     ; preds = %1312, %187
  %wpotential.0 = phi i32 [ 0, %187 ], [ %wpotential.6, %1312 ]
  %fwrook.0 = phi i32 [ 0, %187 ], [ %fwrook.3, %1312 ]
  %rwrook.0 = phi i32 [ 0, %187 ], [ %rwrook.3, %1312 ]
  %fbrook.0 = phi i32 [ 0, %187 ], [ %fbrook.3, %1312 ]
  %rbrook.0 = phi i32 [ 0, %187 ], [ %rbrook.3, %1312 ]
  %br.0 = phi i32 [ 0, %187 ], [ %br.2, %1312 ]
  %wr.0 = phi i32 [ 0, %187 ], [ %wr.2, %1312 ]
  %bq.0 = phi i32 [ 0, %187 ], [ %bq.2, %1312 ]
  %wq.0 = phi i32 [ 0, %187 ], [ %wq.2, %1312 ]
  %bb.0 = phi i32 [ 0, %187 ], [ %bb.2, %1312 ]
  %wb.0 = phi i32 [ 0, %187 ], [ %wb.2, %1312 ]
  %bn.0 = phi i32 [ 0, %187 ], [ %bn.2, %1312 ]
  %wn.0 = phi i32 [ 0, %187 ], [ %wn.2, %1312 ]
  %bp.0 = phi i32 [ 0, %187 ], [ %bp.2, %1312 ]
  %wp.0 = phi i32 [ 0, %187 ], [ %wp.2, %1312 ]
  %j.1 = phi i32 [ 1, %187 ], [ %1313, %1312 ]
  %bpotential.0 = phi i32 [ 0, %187 ], [ %bpotential.6, %1312 ]
  %a.2 = phi i32 [ 1, %187 ], [ %a.3, %1312 ]
  %189 = load i32* @piece_count, align 4
  %190 = icmp sle i32 %a.2, %189
  br i1 %190, label %191, label %1314

; <label>:191                                     ; preds = %188
  %192 = sext i32 %j.1 to i64
  %193 = getelementptr inbounds [62 x i32]* @pieces, i32 0, i64 %192
  %194 = load i32* %193, align 4
  %195 = icmp ne i32 %194, 0
  br i1 %195, label %197, label %196

; <label>:196                                     ; preds = %191
  br label %1312

; <label>:197                                     ; preds = %191
  %198 = add nsw i32 %a.2, 1
  br label %199

; <label>:199                                     ; preds = %197
  %200 = sext i32 %194 to i64
  %201 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %200
  %202 = load i32* %201, align 4
  %203 = add nsw i32 %202, 1
  %204 = ashr i32 %203, 1
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds [7 x i32 (i32, i32)*]* @evalRoutines, i32 0, i64 %205
  %207 = load i32 (i32, i32)** %206, align 8
  %208 = sext i32 %194 to i64
  %209 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %208
  %210 = load i32* %209, align 4
  %211 = add nsw i32 %210, 1
  %212 = and i32 %211, 1
  %213 = call i32 %207(i32 %194, i32 %212)
  %214 = load i32* %score, align 4
  %215 = add nsw i32 %214, %213
  store i32 %215, i32* %score, align 4
  %216 = sext i32 %194 to i64
  %217 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %216
  %218 = load i32* %217, align 4
  %219 = add nsw i32 %218, 1
  %220 = sext i32 %194 to i64
  %221 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %220
  %222 = load i32* %221, align 4
  %223 = sext i32 %194 to i64
  %224 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %223
  %225 = load i32* %224, align 4
  switch i32 %225, label %1311 [
    i32 1, label %226
    i32 2, label %570
    i32 7, label %916
    i32 8, label %967
    i32 11, label %1018
    i32 12, label %1020
    i32 3, label %1022
    i32 4, label %1024
    i32 9, label %1026
    i32 10, label %1028
    i32 5, label %1030
    i32 6, label %1166
  ]

; <label>:226                                     ; preds = %199
  %227 = sext i32 %194 to i64
  %228 = getelementptr inbounds [144 x i32]* @swhite_pawn, i32 0, i64 %227
  %229 = load i32* %228, align 4
  %230 = load i32* %score, align 4
  %231 = add nsw i32 %230, %229
  store i32 %231, i32* %score, align 4
  %232 = add nsw i32 %wp.0, 1
  %233 = add nsw i32 %219, 1
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %234
  %236 = load i32* %235, align 4
  %237 = icmp sgt i32 %236, %222
  br i1 %237, label %238, label %264

; <label>:238                                     ; preds = %226
  %239 = sub nsw i32 %219, 1
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %240
  %242 = load i32* %241, align 4
  %243 = icmp sgt i32 %242, %222
  br i1 %243, label %244, label %264

; <label>:244                                     ; preds = %238
  %245 = load i32* %score, align 4
  %246 = sub nsw i32 %245, 8
  store i32 %246, i32* %score, align 4
  %247 = add nsw i32 %219, 1
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %250 = getelementptr inbounds [11 x i32]* %249, i32 0, i64 %248
  %251 = load i32* %250, align 4
  %252 = icmp ne i32 %251, 0
  br i1 %252, label %263, label %253

; <label>:253                                     ; preds = %244
  %254 = sub nsw i32 %219, 1
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %257 = getelementptr inbounds [11 x i32]* %256, i32 0, i64 %255
  %258 = load i32* %257, align 4
  %259 = icmp ne i32 %258, 0
  br i1 %259, label %263, label %260

; <label>:260                                     ; preds = %253
  %261 = load i32* %score, align 4
  %262 = sub nsw i32 %261, 5
  store i32 %262, i32* %score, align 4
  br label %263

; <label>:263                                     ; preds = %260, %253, %244
  %isolated.0 = phi i32 [ 0, %244 ], [ 0, %253 ], [ 1, %260 ]
  br label %264

; <label>:264                                     ; preds = %263, %238, %226
  %backwards.0 = phi i32 [ 1, %263 ], [ 0, %238 ], [ 0, %226 ]
  %isolated.1 = phi i32 [ %isolated.0, %263 ], [ 0, %238 ], [ 0, %226 ]
  %265 = sext i32 %219 to i64
  %266 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %267 = getelementptr inbounds [11 x i32]* %266, i32 0, i64 %265
  %268 = load i32* %267, align 4
  %269 = icmp ne i32 %268, 0
  br i1 %269, label %281, label %270

; <label>:270                                     ; preds = %264
  %271 = icmp ne i32 %backwards.0, 0
  br i1 %271, label %272, label %275

; <label>:272                                     ; preds = %270
  %273 = load i32* %score, align 4
  %274 = sub nsw i32 %273, 3
  store i32 %274, i32* %score, align 4
  br label %275

; <label>:275                                     ; preds = %272, %270
  %276 = icmp ne i32 %isolated.1, 0
  br i1 %276, label %277, label %280

; <label>:277                                     ; preds = %275
  %278 = load i32* %score, align 4
  %279 = sub nsw i32 %278, 5
  store i32 %279, i32* %score, align 4
  br label %280

; <label>:280                                     ; preds = %277, %275
  br label %281

; <label>:281                                     ; preds = %280, %264
  %282 = sext i32 %219 to i64
  %283 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %284 = getelementptr inbounds [11 x i32]* %283, i32 0, i64 %282
  %285 = load i32* %284, align 4
  %286 = icmp sgt i32 %285, 1
  br i1 %286, label %287, label %296

; <label>:287                                     ; preds = %281
  %288 = sext i32 %219 to i64
  %289 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %290 = getelementptr inbounds [11 x i32]* %289, i32 0, i64 %288
  %291 = load i32* %290, align 4
  %292 = sub nsw i32 %291, 1
  %293 = mul nsw i32 3, %292
  %294 = load i32* %score, align 4
  %295 = sub nsw i32 %294, %293
  store i32 %295, i32* %score, align 4
  br label %296

; <label>:296                                     ; preds = %287, %281
  %297 = sext i32 %219 to i64
  %298 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %299 = getelementptr inbounds [11 x i32]* %298, i32 0, i64 %297
  %300 = load i32* %299, align 4
  %301 = icmp ne i32 %300, 0
  br i1 %301, label %559, label %302

; <label>:302                                     ; preds = %296
  %303 = sub nsw i32 %219, 1
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %304
  %306 = load i32* %305, align 4
  %307 = icmp sge i32 %222, %306
  br i1 %307, label %308, label %559

; <label>:308                                     ; preds = %302
  %309 = add nsw i32 %219, 1
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %310
  %312 = load i32* %311, align 4
  %313 = icmp sge i32 %222, %312
  br i1 %313, label %314, label %559

; <label>:314                                     ; preds = %308
  %315 = sext i32 %194 to i64
  %316 = getelementptr inbounds [144 x i32]* @swhite_pawn, i32 0, i64 %315
  %317 = load i32* %316, align 4
  %318 = mul nsw i32 3, %317
  %319 = add nsw i32 30, %318
  %320 = load i32* %score, align 4
  %321 = add nsw i32 %320, %319
  store i32 %321, i32* %score, align 4
  %322 = load i32* @white_to_move, align 4
  %323 = icmp ne i32 %322, 0
  br i1 %323, label %324, label %383

; <label>:324                                     ; preds = %314
  %325 = sext i32 %194 to i64
  %326 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %325
  %327 = load i32* %326, align 4
  %328 = add nsw i32 110, %327
  %329 = sub nsw i32 %328, 1
  %330 = load i32* @bking_loc, align 4
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %331
  %333 = load i32* %332, align 4
  %334 = sext i32 %329 to i64
  %335 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %334
  %336 = load i32* %335, align 4
  %337 = sub nsw i32 %333, %336
  %338 = call i32 @abs(i32 %337) #6
  %339 = load i32* @bking_loc, align 4
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %340
  %342 = load i32* %341, align 4
  %343 = sext i32 %329 to i64
  %344 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %343
  %345 = load i32* %344, align 4
  %346 = sub nsw i32 %342, %345
  %347 = call i32 @abs(i32 %346) #6
  %348 = icmp sgt i32 %338, %347
  br i1 %348, label %349, label %359

; <label>:349                                     ; preds = %324
  %350 = load i32* @bking_loc, align 4
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %351
  %353 = load i32* %352, align 4
  %354 = sext i32 %329 to i64
  %355 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %354
  %356 = load i32* %355, align 4
  %357 = sub nsw i32 %353, %356
  %358 = call i32 @abs(i32 %357) #6
  br label %369

; <label>:359                                     ; preds = %324
  %360 = load i32* @bking_loc, align 4
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %361
  %363 = load i32* %362, align 4
  %364 = sext i32 %329 to i64
  %365 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %364
  %366 = load i32* %365, align 4
  %367 = sub nsw i32 %363, %366
  %368 = call i32 @abs(i32 %367) #6
  br label %369

; <label>:369                                     ; preds = %359, %349
  %370 = phi i32 [ %358, %349 ], [ %368, %359 ]
  %371 = sext i32 %329 to i64
  %372 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %371
  %373 = load i32* %372, align 4
  %374 = sext i32 %194 to i64
  %375 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %374
  %376 = load i32* %375, align 4
  %377 = sub nsw i32 %373, %376
  %378 = call i32 @abs(i32 %377) #6
  %379 = icmp sgt i32 %370, %378
  br i1 %379, label %380, label %382

; <label>:380                                     ; preds = %369
  %381 = add nsw i32 %wpotential.0, 800
  br label %382

; <label>:382                                     ; preds = %380, %369
  %wpotential.1 = phi i32 [ %381, %380 ], [ %wpotential.0, %369 ]
  br label %443

; <label>:383                                     ; preds = %314
  %384 = sext i32 %194 to i64
  %385 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %384
  %386 = load i32* %385, align 4
  %387 = add nsw i32 110, %386
  %388 = sub nsw i32 %387, 1
  %389 = load i32* @bking_loc, align 4
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %390
  %392 = load i32* %391, align 4
  %393 = sext i32 %388 to i64
  %394 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %393
  %395 = load i32* %394, align 4
  %396 = sub nsw i32 %392, %395
  %397 = call i32 @abs(i32 %396) #6
  %398 = load i32* @bking_loc, align 4
  %399 = sext i32 %398 to i64
  %400 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %399
  %401 = load i32* %400, align 4
  %402 = sext i32 %388 to i64
  %403 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %402
  %404 = load i32* %403, align 4
  %405 = sub nsw i32 %401, %404
  %406 = call i32 @abs(i32 %405) #6
  %407 = icmp sgt i32 %397, %406
  br i1 %407, label %408, label %418

; <label>:408                                     ; preds = %383
  %409 = load i32* @bking_loc, align 4
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %410
  %412 = load i32* %411, align 4
  %413 = sext i32 %388 to i64
  %414 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %413
  %415 = load i32* %414, align 4
  %416 = sub nsw i32 %412, %415
  %417 = call i32 @abs(i32 %416) #6
  br label %428

; <label>:418                                     ; preds = %383
  %419 = load i32* @bking_loc, align 4
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %420
  %422 = load i32* %421, align 4
  %423 = sext i32 %388 to i64
  %424 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %423
  %425 = load i32* %424, align 4
  %426 = sub nsw i32 %422, %425
  %427 = call i32 @abs(i32 %426) #6
  br label %428

; <label>:428                                     ; preds = %418, %408
  %429 = phi i32 [ %417, %408 ], [ %427, %418 ]
  %430 = sub nsw i32 %429, 1
  %431 = sext i32 %388 to i64
  %432 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %431
  %433 = load i32* %432, align 4
  %434 = sext i32 %194 to i64
  %435 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %434
  %436 = load i32* %435, align 4
  %437 = sub nsw i32 %433, %436
  %438 = call i32 @abs(i32 %437) #6
  %439 = icmp sgt i32 %430, %438
  br i1 %439, label %440, label %442

; <label>:440                                     ; preds = %428
  %441 = add nsw i32 %wpotential.0, 800
  br label %442

; <label>:442                                     ; preds = %440, %428
  %wpotential.2 = phi i32 [ %441, %440 ], [ %wpotential.0, %428 ]
  br label %443

; <label>:443                                     ; preds = %442, %382
  %wpotential.3 = phi i32 [ %wpotential.1, %382 ], [ %wpotential.2, %442 ]
  %444 = sext i32 %194 to i64
  %445 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %444
  %446 = load i32* %445, align 4
  %447 = icmp eq i32 %446, 1
  br i1 %447, label %453, label %448

; <label>:448                                     ; preds = %443
  %449 = sext i32 %194 to i64
  %450 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %449
  %451 = load i32* %450, align 4
  %452 = icmp eq i32 %451, 8
  br i1 %452, label %453, label %461

; <label>:453                                     ; preds = %448, %443
  %454 = sext i32 %194 to i64
  %455 = getelementptr inbounds [144 x i32]* @swhite_pawn, i32 0, i64 %454
  %456 = load i32* %455, align 4
  %457 = mul nsw i32 2, %456
  %458 = add nsw i32 12, %457
  %459 = load i32* %score, align 4
  %460 = add nsw i32 %459, %458
  store i32 %460, i32* %score, align 4
  br label %461

; <label>:461                                     ; preds = %453, %448
  %462 = icmp ne i32 %isolated.1, 0
  br i1 %462, label %558, label %463

; <label>:463                                     ; preds = %461
  %464 = load i32* %score, align 4
  %465 = add nsw i32 %464, 12
  store i32 %465, i32* %score, align 4
  %466 = add nsw i32 %219, 1
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %469 = getelementptr inbounds [11 x i32]* %468, i32 0, i64 %467
  %470 = load i32* %469, align 4
  %471 = icmp ne i32 %470, 0
  br i1 %471, label %472, label %511

; <label>:472                                     ; preds = %463
  %473 = add nsw i32 %219, 1
  %474 = sext i32 %473 to i64
  %475 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %476 = getelementptr inbounds [11 x i32]* %475, i32 0, i64 %474
  %477 = load i32* %476, align 4
  %478 = icmp ne i32 %477, 0
  br i1 %478, label %510, label %479

; <label>:479                                     ; preds = %472
  %480 = add nsw i32 %219, 1
  %481 = sext i32 %480 to i64
  %482 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %481
  %483 = load i32* %482, align 4
  %484 = add nsw i32 %219, 2
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %485
  %487 = load i32* %486, align 4
  %488 = icmp sge i32 %483, %487
  br i1 %488, label %489, label %510

; <label>:489                                     ; preds = %479
  %490 = sext i32 %194 to i64
  %491 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %490
  %492 = load i32* %491, align 4
  %493 = mul nsw i32 7, %492
  %494 = load i32* %score, align 4
  %495 = add nsw i32 %494, %493
  store i32 %495, i32* %score, align 4
  %496 = sext i32 %194 to i64
  %497 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %496
  %498 = load i32* %497, align 4
  %499 = icmp eq i32 %498, 7
  br i1 %499, label %500, label %509

; <label>:500                                     ; preds = %489
  %501 = add nsw i32 %219, 1
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %502
  %504 = load i32* %503, align 4
  %505 = icmp sge i32 %504, 6
  br i1 %505, label %506, label %509

; <label>:506                                     ; preds = %500
  %507 = load i32* %score, align 4
  %508 = add nsw i32 %507, 50
  store i32 %508, i32* %score, align 4
  br label %509

; <label>:509                                     ; preds = %506, %500, %489
  br label %510

; <label>:510                                     ; preds = %509, %479, %472
  br label %511

; <label>:511                                     ; preds = %510, %463
  %512 = sub nsw i32 %219, 1
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %515 = getelementptr inbounds [11 x i32]* %514, i32 0, i64 %513
  %516 = load i32* %515, align 4
  %517 = icmp ne i32 %516, 0
  br i1 %517, label %518, label %557

; <label>:518                                     ; preds = %511
  %519 = sub nsw i32 %219, 1
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %522 = getelementptr inbounds [11 x i32]* %521, i32 0, i64 %520
  %523 = load i32* %522, align 4
  %524 = icmp ne i32 %523, 0
  br i1 %524, label %556, label %525

; <label>:525                                     ; preds = %518
  %526 = add nsw i32 %219, 1
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %527
  %529 = load i32* %528, align 4
  %530 = sub nsw i32 %219, 2
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %531
  %533 = load i32* %532, align 4
  %534 = icmp sge i32 %529, %533
  br i1 %534, label %535, label %556

; <label>:535                                     ; preds = %525
  %536 = sext i32 %194 to i64
  %537 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %536
  %538 = load i32* %537, align 4
  %539 = mul nsw i32 7, %538
  %540 = load i32* %score, align 4
  %541 = add nsw i32 %540, %539
  store i32 %541, i32* %score, align 4
  %542 = sext i32 %194 to i64
  %543 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %542
  %544 = load i32* %543, align 4
  %545 = icmp eq i32 %544, 7
  br i1 %545, label %546, label %555

; <label>:546                                     ; preds = %535
  %547 = sub nsw i32 %219, 1
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %548
  %550 = load i32* %549, align 4
  %551 = icmp sge i32 %550, 6
  br i1 %551, label %552, label %555

; <label>:552                                     ; preds = %546
  %553 = load i32* %score, align 4
  %554 = add nsw i32 %553, 50
  store i32 %554, i32* %score, align 4
  br label %555

; <label>:555                                     ; preds = %552, %546, %535
  br label %556

; <label>:556                                     ; preds = %555, %525, %518
  br label %557

; <label>:557                                     ; preds = %556, %511
  br label %558

; <label>:558                                     ; preds = %557, %461
  br label %559

; <label>:559                                     ; preds = %558, %308, %302, %296
  %wpotential.4 = phi i32 [ %wpotential.0, %296 ], [ %wpotential.3, %558 ], [ %wpotential.0, %308 ], [ %wpotential.0, %302 ]
  %560 = sub nsw i32 %219, 1
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %563 = getelementptr inbounds [11 x i32]* %562, i32 0, i64 %561
  %564 = load i32* %563, align 4
  %565 = icmp ne i32 %564, 0
  br i1 %565, label %569, label %566

; <label>:566                                     ; preds = %559
  %567 = load i32* %score, align 4
  %568 = sub nsw i32 %567, 7
  store i32 %568, i32* %score, align 4
  br label %569

; <label>:569                                     ; preds = %566, %559
  br label %1311

; <label>:570                                     ; preds = %199
  %571 = sext i32 %194 to i64
  %572 = getelementptr inbounds [144 x i32]* @sblack_pawn, i32 0, i64 %571
  %573 = load i32* %572, align 4
  %574 = load i32* %score, align 4
  %575 = sub nsw i32 %574, %573
  store i32 %575, i32* %score, align 4
  %576 = add nsw i32 %bp.0, 1
  %577 = add nsw i32 %219, 1
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %578
  %580 = load i32* %579, align 4
  %581 = icmp slt i32 %580, %222
  br i1 %581, label %582, label %608

; <label>:582                                     ; preds = %570
  %583 = sub nsw i32 %219, 1
  %584 = sext i32 %583 to i64
  %585 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %584
  %586 = load i32* %585, align 4
  %587 = icmp slt i32 %586, %222
  br i1 %587, label %588, label %608

; <label>:588                                     ; preds = %582
  %589 = load i32* %score, align 4
  %590 = add nsw i32 %589, 8
  store i32 %590, i32* %score, align 4
  %591 = add nsw i32 %219, 1
  %592 = sext i32 %591 to i64
  %593 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %594 = getelementptr inbounds [11 x i32]* %593, i32 0, i64 %592
  %595 = load i32* %594, align 4
  %596 = icmp ne i32 %595, 0
  br i1 %596, label %607, label %597

; <label>:597                                     ; preds = %588
  %598 = sub nsw i32 %219, 1
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %601 = getelementptr inbounds [11 x i32]* %600, i32 0, i64 %599
  %602 = load i32* %601, align 4
  %603 = icmp ne i32 %602, 0
  br i1 %603, label %607, label %604

; <label>:604                                     ; preds = %597
  %605 = load i32* %score, align 4
  %606 = add nsw i32 %605, 5
  store i32 %606, i32* %score, align 4
  br label %607

; <label>:607                                     ; preds = %604, %597, %588
  %isolated.2 = phi i32 [ 0, %588 ], [ 0, %597 ], [ 1, %604 ]
  br label %608

; <label>:608                                     ; preds = %607, %582, %570
  %backwards.1 = phi i32 [ 1, %607 ], [ 0, %582 ], [ 0, %570 ]
  %isolated.3 = phi i32 [ %isolated.2, %607 ], [ 0, %582 ], [ 0, %570 ]
  %609 = sext i32 %219 to i64
  %610 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %611 = getelementptr inbounds [11 x i32]* %610, i32 0, i64 %609
  %612 = load i32* %611, align 4
  %613 = icmp ne i32 %612, 0
  br i1 %613, label %625, label %614

; <label>:614                                     ; preds = %608
  %615 = icmp ne i32 %backwards.1, 0
  br i1 %615, label %616, label %619

; <label>:616                                     ; preds = %614
  %617 = load i32* %score, align 4
  %618 = add nsw i32 %617, 3
  store i32 %618, i32* %score, align 4
  br label %619

; <label>:619                                     ; preds = %616, %614
  %620 = icmp ne i32 %isolated.3, 0
  br i1 %620, label %621, label %624

; <label>:621                                     ; preds = %619
  %622 = load i32* %score, align 4
  %623 = add nsw i32 %622, 5
  store i32 %623, i32* %score, align 4
  br label %624

; <label>:624                                     ; preds = %621, %619
  br label %625

; <label>:625                                     ; preds = %624, %608
  %626 = sext i32 %219 to i64
  %627 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %628 = getelementptr inbounds [11 x i32]* %627, i32 0, i64 %626
  %629 = load i32* %628, align 4
  %630 = icmp sgt i32 %629, 1
  br i1 %630, label %631, label %640

; <label>:631                                     ; preds = %625
  %632 = sext i32 %219 to i64
  %633 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %634 = getelementptr inbounds [11 x i32]* %633, i32 0, i64 %632
  %635 = load i32* %634, align 4
  %636 = sub nsw i32 %635, 1
  %637 = mul nsw i32 3, %636
  %638 = load i32* %score, align 4
  %639 = add nsw i32 %638, %637
  store i32 %639, i32* %score, align 4
  br label %640

; <label>:640                                     ; preds = %631, %625
  %641 = sext i32 %219 to i64
  %642 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %643 = getelementptr inbounds [11 x i32]* %642, i32 0, i64 %641
  %644 = load i32* %643, align 4
  %645 = icmp ne i32 %644, 0
  br i1 %645, label %905, label %646

; <label>:646                                     ; preds = %640
  %647 = sub nsw i32 %219, 1
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %648
  %650 = load i32* %649, align 4
  %651 = icmp sle i32 %222, %650
  br i1 %651, label %652, label %905

; <label>:652                                     ; preds = %646
  %653 = add nsw i32 %219, 1
  %654 = sext i32 %653 to i64
  %655 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %654
  %656 = load i32* %655, align 4
  %657 = icmp sle i32 %222, %656
  br i1 %657, label %658, label %905

; <label>:658                                     ; preds = %652
  %659 = sext i32 %194 to i64
  %660 = getelementptr inbounds [144 x i32]* @sblack_pawn, i32 0, i64 %659
  %661 = load i32* %660, align 4
  %662 = mul nsw i32 3, %661
  %663 = add nsw i32 30, %662
  %664 = load i32* %score, align 4
  %665 = sub nsw i32 %664, %663
  store i32 %665, i32* %score, align 4
  %666 = load i32* @white_to_move, align 4
  %667 = icmp ne i32 %666, 0
  br i1 %667, label %727, label %668

; <label>:668                                     ; preds = %658
  %669 = sext i32 %194 to i64
  %670 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %669
  %671 = load i32* %670, align 4
  %672 = add nsw i32 26, %671
  %673 = sub nsw i32 %672, 1
  %674 = load i32* @wking_loc, align 4
  %675 = sext i32 %674 to i64
  %676 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %675
  %677 = load i32* %676, align 4
  %678 = sext i32 %673 to i64
  %679 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %678
  %680 = load i32* %679, align 4
  %681 = sub nsw i32 %677, %680
  %682 = call i32 @abs(i32 %681) #6
  %683 = load i32* @wking_loc, align 4
  %684 = sext i32 %683 to i64
  %685 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %684
  %686 = load i32* %685, align 4
  %687 = sext i32 %673 to i64
  %688 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %687
  %689 = load i32* %688, align 4
  %690 = sub nsw i32 %686, %689
  %691 = call i32 @abs(i32 %690) #6
  %692 = icmp sgt i32 %682, %691
  br i1 %692, label %693, label %703

; <label>:693                                     ; preds = %668
  %694 = load i32* @wking_loc, align 4
  %695 = sext i32 %694 to i64
  %696 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %695
  %697 = load i32* %696, align 4
  %698 = sext i32 %673 to i64
  %699 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %698
  %700 = load i32* %699, align 4
  %701 = sub nsw i32 %697, %700
  %702 = call i32 @abs(i32 %701) #6
  br label %713

; <label>:703                                     ; preds = %668
  %704 = load i32* @wking_loc, align 4
  %705 = sext i32 %704 to i64
  %706 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %705
  %707 = load i32* %706, align 4
  %708 = sext i32 %673 to i64
  %709 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %708
  %710 = load i32* %709, align 4
  %711 = sub nsw i32 %707, %710
  %712 = call i32 @abs(i32 %711) #6
  br label %713

; <label>:713                                     ; preds = %703, %693
  %714 = phi i32 [ %702, %693 ], [ %712, %703 ]
  %715 = sext i32 %673 to i64
  %716 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %715
  %717 = load i32* %716, align 4
  %718 = sext i32 %194 to i64
  %719 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %718
  %720 = load i32* %719, align 4
  %721 = sub nsw i32 %717, %720
  %722 = call i32 @abs(i32 %721) #6
  %723 = icmp sgt i32 %714, %722
  br i1 %723, label %724, label %726

; <label>:724                                     ; preds = %713
  %725 = sub nsw i32 %bpotential.0, 800
  br label %726

; <label>:726                                     ; preds = %724, %713
  %bpotential.1 = phi i32 [ %725, %724 ], [ %bpotential.0, %713 ]
  br label %787

; <label>:727                                     ; preds = %658
  %728 = sext i32 %194 to i64
  %729 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %728
  %730 = load i32* %729, align 4
  %731 = add nsw i32 26, %730
  %732 = sub nsw i32 %731, 1
  %733 = load i32* @wking_loc, align 4
  %734 = sext i32 %733 to i64
  %735 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %734
  %736 = load i32* %735, align 4
  %737 = sext i32 %732 to i64
  %738 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %737
  %739 = load i32* %738, align 4
  %740 = sub nsw i32 %736, %739
  %741 = call i32 @abs(i32 %740) #6
  %742 = load i32* @wking_loc, align 4
  %743 = sext i32 %742 to i64
  %744 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %743
  %745 = load i32* %744, align 4
  %746 = sext i32 %732 to i64
  %747 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %746
  %748 = load i32* %747, align 4
  %749 = sub nsw i32 %745, %748
  %750 = call i32 @abs(i32 %749) #6
  %751 = icmp sgt i32 %741, %750
  br i1 %751, label %752, label %762

; <label>:752                                     ; preds = %727
  %753 = load i32* @wking_loc, align 4
  %754 = sext i32 %753 to i64
  %755 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %754
  %756 = load i32* %755, align 4
  %757 = sext i32 %732 to i64
  %758 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %757
  %759 = load i32* %758, align 4
  %760 = sub nsw i32 %756, %759
  %761 = call i32 @abs(i32 %760) #6
  br label %772

; <label>:762                                     ; preds = %727
  %763 = load i32* @wking_loc, align 4
  %764 = sext i32 %763 to i64
  %765 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %764
  %766 = load i32* %765, align 4
  %767 = sext i32 %732 to i64
  %768 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %767
  %769 = load i32* %768, align 4
  %770 = sub nsw i32 %766, %769
  %771 = call i32 @abs(i32 %770) #6
  br label %772

; <label>:772                                     ; preds = %762, %752
  %773 = phi i32 [ %761, %752 ], [ %771, %762 ]
  %774 = sub nsw i32 %773, 1
  %775 = sext i32 %732 to i64
  %776 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %775
  %777 = load i32* %776, align 4
  %778 = sext i32 %194 to i64
  %779 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %778
  %780 = load i32* %779, align 4
  %781 = sub nsw i32 %777, %780
  %782 = call i32 @abs(i32 %781) #6
  %783 = icmp sgt i32 %774, %782
  br i1 %783, label %784, label %786

; <label>:784                                     ; preds = %772
  %785 = sub nsw i32 %bpotential.0, 800
  br label %786

; <label>:786                                     ; preds = %784, %772
  %bpotential.2 = phi i32 [ %785, %784 ], [ %bpotential.0, %772 ]
  br label %787

; <label>:787                                     ; preds = %786, %726
  %bpotential.3 = phi i32 [ %bpotential.2, %786 ], [ %bpotential.1, %726 ]
  %788 = sext i32 %194 to i64
  %789 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %788
  %790 = load i32* %789, align 4
  %791 = icmp eq i32 %790, 1
  br i1 %791, label %797, label %792

; <label>:792                                     ; preds = %787
  %793 = sext i32 %194 to i64
  %794 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %793
  %795 = load i32* %794, align 4
  %796 = icmp eq i32 %795, 8
  br i1 %796, label %797, label %805

; <label>:797                                     ; preds = %792, %787
  %798 = sext i32 %194 to i64
  %799 = getelementptr inbounds [144 x i32]* @sblack_pawn, i32 0, i64 %798
  %800 = load i32* %799, align 4
  %801 = mul nsw i32 2, %800
  %802 = add nsw i32 12, %801
  %803 = load i32* %score, align 4
  %804 = sub nsw i32 %803, %802
  store i32 %804, i32* %score, align 4
  br label %805

; <label>:805                                     ; preds = %797, %792
  %806 = icmp ne i32 %isolated.3, 0
  br i1 %806, label %904, label %807

; <label>:807                                     ; preds = %805
  %808 = load i32* %score, align 4
  %809 = sub nsw i32 %808, 12
  store i32 %809, i32* %score, align 4
  %810 = add nsw i32 %219, 1
  %811 = sext i32 %810 to i64
  %812 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %813 = getelementptr inbounds [11 x i32]* %812, i32 0, i64 %811
  %814 = load i32* %813, align 4
  %815 = icmp ne i32 %814, 0
  br i1 %815, label %816, label %856

; <label>:816                                     ; preds = %807
  %817 = add nsw i32 %219, 1
  %818 = sext i32 %817 to i64
  %819 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %820 = getelementptr inbounds [11 x i32]* %819, i32 0, i64 %818
  %821 = load i32* %820, align 4
  %822 = icmp ne i32 %821, 0
  br i1 %822, label %855, label %823

; <label>:823                                     ; preds = %816
  %824 = add nsw i32 %219, 1
  %825 = sext i32 %824 to i64
  %826 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %825
  %827 = load i32* %826, align 4
  %828 = add nsw i32 %219, 2
  %829 = sext i32 %828 to i64
  %830 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %829
  %831 = load i32* %830, align 4
  %832 = icmp sle i32 %827, %831
  br i1 %832, label %833, label %855

; <label>:833                                     ; preds = %823
  %834 = sext i32 %194 to i64
  %835 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %834
  %836 = load i32* %835, align 4
  %837 = sub nsw i32 9, %836
  %838 = mul nsw i32 7, %837
  %839 = load i32* %score, align 4
  %840 = sub nsw i32 %839, %838
  store i32 %840, i32* %score, align 4
  %841 = sext i32 %194 to i64
  %842 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %841
  %843 = load i32* %842, align 4
  %844 = icmp eq i32 %843, 2
  br i1 %844, label %845, label %854

; <label>:845                                     ; preds = %833
  %846 = add nsw i32 %219, 1
  %847 = sext i32 %846 to i64
  %848 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %847
  %849 = load i32* %848, align 4
  %850 = icmp sle i32 %849, 3
  br i1 %850, label %851, label %854

; <label>:851                                     ; preds = %845
  %852 = load i32* %score, align 4
  %853 = sub nsw i32 %852, 50
  store i32 %853, i32* %score, align 4
  br label %854

; <label>:854                                     ; preds = %851, %845, %833
  br label %855

; <label>:855                                     ; preds = %854, %823, %816
  br label %856

; <label>:856                                     ; preds = %855, %807
  %857 = sub nsw i32 %219, 1
  %858 = sext i32 %857 to i64
  %859 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %860 = getelementptr inbounds [11 x i32]* %859, i32 0, i64 %858
  %861 = load i32* %860, align 4
  %862 = icmp ne i32 %861, 0
  br i1 %862, label %863, label %903

; <label>:863                                     ; preds = %856
  %864 = sub nsw i32 %219, 1
  %865 = sext i32 %864 to i64
  %866 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %867 = getelementptr inbounds [11 x i32]* %866, i32 0, i64 %865
  %868 = load i32* %867, align 4
  %869 = icmp ne i32 %868, 0
  br i1 %869, label %902, label %870

; <label>:870                                     ; preds = %863
  %871 = sub nsw i32 %219, 1
  %872 = sext i32 %871 to i64
  %873 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %872
  %874 = load i32* %873, align 4
  %875 = sub nsw i32 %219, 2
  %876 = sext i32 %875 to i64
  %877 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %876
  %878 = load i32* %877, align 4
  %879 = icmp sle i32 %874, %878
  br i1 %879, label %880, label %902

; <label>:880                                     ; preds = %870
  %881 = sext i32 %194 to i64
  %882 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %881
  %883 = load i32* %882, align 4
  %884 = sub nsw i32 9, %883
  %885 = mul nsw i32 7, %884
  %886 = load i32* %score, align 4
  %887 = sub nsw i32 %886, %885
  store i32 %887, i32* %score, align 4
  %888 = sext i32 %194 to i64
  %889 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %888
  %890 = load i32* %889, align 4
  %891 = icmp eq i32 %890, 2
  br i1 %891, label %892, label %901

; <label>:892                                     ; preds = %880
  %893 = sub nsw i32 %219, 1
  %894 = sext i32 %893 to i64
  %895 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %894
  %896 = load i32* %895, align 4
  %897 = icmp sle i32 %896, 3
  br i1 %897, label %898, label %901

; <label>:898                                     ; preds = %892
  %899 = load i32* %score, align 4
  %900 = sub nsw i32 %899, 50
  store i32 %900, i32* %score, align 4
  br label %901

; <label>:901                                     ; preds = %898, %892, %880
  br label %902

; <label>:902                                     ; preds = %901, %870, %863
  br label %903

; <label>:903                                     ; preds = %902, %856
  br label %904

; <label>:904                                     ; preds = %903, %805
  br label %905

; <label>:905                                     ; preds = %904, %652, %646, %640
  %bpotential.4 = phi i32 [ %bpotential.0, %640 ], [ %bpotential.3, %904 ], [ %bpotential.0, %652 ], [ %bpotential.0, %646 ]
  %906 = sub nsw i32 %219, 1
  %907 = sext i32 %906 to i64
  %908 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %909 = getelementptr inbounds [11 x i32]* %908, i32 0, i64 %907
  %910 = load i32* %909, align 4
  %911 = icmp ne i32 %910, 0
  br i1 %911, label %915, label %912

; <label>:912                                     ; preds = %905
  %913 = load i32* %score, align 4
  %914 = add nsw i32 %913, 7
  store i32 %914, i32* %score, align 4
  br label %915

; <label>:915                                     ; preds = %912, %905
  br label %1311

; <label>:916                                     ; preds = %199
  %917 = add nsw i32 %wr.0, 1
  %918 = icmp eq i32 %917, 1
  br i1 %918, label %919, label %926

; <label>:919                                     ; preds = %916
  %920 = sext i32 %194 to i64
  %921 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %920
  %922 = load i32* %921, align 4
  %923 = sext i32 %194 to i64
  %924 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %923
  %925 = load i32* %924, align 4
  br label %926

; <label>:926                                     ; preds = %919, %916
  %fwrook.1 = phi i32 [ %922, %919 ], [ %fwrook.0, %916 ]
  %rwrook.1 = phi i32 [ %925, %919 ], [ %rwrook.0, %916 ]
  %927 = icmp eq i32 %222, 7
  br i1 %927, label %928, label %938

; <label>:928                                     ; preds = %926
  %929 = load i32* %score, align 4
  %930 = add nsw i32 %929, 25
  store i32 %930, i32* %score, align 4
  %931 = icmp eq i32 %917, 2
  br i1 %931, label %932, label %937

; <label>:932                                     ; preds = %928
  %933 = icmp eq i32 %rwrook.1, 7
  br i1 %933, label %934, label %937

; <label>:934                                     ; preds = %932
  %935 = load i32* %score, align 4
  %936 = add nsw i32 %935, 10
  store i32 %936, i32* %score, align 4
  br label %937

; <label>:937                                     ; preds = %934, %932, %928
  br label %938

; <label>:938                                     ; preds = %937, %926
  %939 = sext i32 %219 to i64
  %940 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %941 = getelementptr inbounds [11 x i32]* %940, i32 0, i64 %939
  %942 = load i32* %941, align 4
  %943 = icmp ne i32 %942, 0
  br i1 %943, label %966, label %944

; <label>:944                                     ; preds = %938
  %945 = load i32* %score, align 4
  %946 = add nsw i32 %945, 5
  store i32 %946, i32* %score, align 4
  %947 = icmp eq i32 %917, 2
  br i1 %947, label %948, label %956

; <label>:948                                     ; preds = %944
  %949 = sext i32 %194 to i64
  %950 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %949
  %951 = load i32* %950, align 4
  %952 = icmp eq i32 %951, %fwrook.1
  br i1 %952, label %953, label %956

; <label>:953                                     ; preds = %948
  %954 = load i32* %score, align 4
  %955 = add nsw i32 %954, 12
  store i32 %955, i32* %score, align 4
  br label %956

; <label>:956                                     ; preds = %953, %948, %944
  %957 = sext i32 %219 to i64
  %958 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %959 = getelementptr inbounds [11 x i32]* %958, i32 0, i64 %957
  %960 = load i32* %959, align 4
  %961 = icmp ne i32 %960, 0
  br i1 %961, label %965, label %962

; <label>:962                                     ; preds = %956
  %963 = load i32* %score, align 4
  %964 = add nsw i32 %963, 3
  store i32 %964, i32* %score, align 4
  br label %965

; <label>:965                                     ; preds = %962, %956
  br label %966

; <label>:966                                     ; preds = %965, %938
  br label %1311

; <label>:967                                     ; preds = %199
  %968 = add nsw i32 %br.0, 1
  %969 = icmp eq i32 %968, 1
  br i1 %969, label %970, label %977

; <label>:970                                     ; preds = %967
  %971 = sext i32 %194 to i64
  %972 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %971
  %973 = load i32* %972, align 4
  %974 = sext i32 %194 to i64
  %975 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %974
  %976 = load i32* %975, align 4
  br label %977

; <label>:977                                     ; preds = %970, %967
  %fbrook.1 = phi i32 [ %973, %970 ], [ %fbrook.0, %967 ]
  %rbrook.1 = phi i32 [ %976, %970 ], [ %rbrook.0, %967 ]
  %978 = icmp eq i32 %222, 2
  br i1 %978, label %979, label %989

; <label>:979                                     ; preds = %977
  %980 = load i32* %score, align 4
  %981 = sub nsw i32 %980, 25
  store i32 %981, i32* %score, align 4
  %982 = icmp eq i32 %wr.0, 2
  br i1 %982, label %983, label %988

; <label>:983                                     ; preds = %979
  %984 = icmp eq i32 %rbrook.1, 2
  br i1 %984, label %985, label %988

; <label>:985                                     ; preds = %983
  %986 = load i32* %score, align 4
  %987 = sub nsw i32 %986, 10
  store i32 %987, i32* %score, align 4
  br label %988

; <label>:988                                     ; preds = %985, %983, %979
  br label %989

; <label>:989                                     ; preds = %988, %977
  %990 = sext i32 %219 to i64
  %991 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %992 = getelementptr inbounds [11 x i32]* %991, i32 0, i64 %990
  %993 = load i32* %992, align 4
  %994 = icmp ne i32 %993, 0
  br i1 %994, label %1017, label %995

; <label>:995                                     ; preds = %989
  %996 = load i32* %score, align 4
  %997 = sub nsw i32 %996, 5
  store i32 %997, i32* %score, align 4
  %998 = icmp eq i32 %968, 2
  br i1 %998, label %999, label %1007

; <label>:999                                     ; preds = %995
  %1000 = sext i32 %194 to i64
  %1001 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1000
  %1002 = load i32* %1001, align 4
  %1003 = icmp eq i32 %1002, %fbrook.1
  br i1 %1003, label %1004, label %1007

; <label>:1004                                    ; preds = %999
  %1005 = load i32* %score, align 4
  %1006 = sub nsw i32 %1005, 12
  store i32 %1006, i32* %score, align 4
  br label %1007

; <label>:1007                                    ; preds = %1004, %999, %995
  %1008 = sext i32 %219 to i64
  %1009 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1010 = getelementptr inbounds [11 x i32]* %1009, i32 0, i64 %1008
  %1011 = load i32* %1010, align 4
  %1012 = icmp ne i32 %1011, 0
  br i1 %1012, label %1016, label %1013

; <label>:1013                                    ; preds = %1007
  %1014 = load i32* %score, align 4
  %1015 = sub nsw i32 %1014, 3
  store i32 %1015, i32* %score, align 4
  br label %1016

; <label>:1016                                    ; preds = %1013, %1007
  br label %1017

; <label>:1017                                    ; preds = %1016, %989
  br label %1311

; <label>:1018                                    ; preds = %199
  %1019 = add nsw i32 %wb.0, 1
  br label %1311

; <label>:1020                                    ; preds = %199
  %1021 = add nsw i32 %bb.0, 1
  br label %1311

; <label>:1022                                    ; preds = %199
  %1023 = add nsw i32 %wn.0, 1
  br label %1311

; <label>:1024                                    ; preds = %199
  %1025 = add nsw i32 %bn.0, 1
  br label %1311

; <label>:1026                                    ; preds = %199
  %1027 = add nsw i32 %wq.0, 1
  br label %1311

; <label>:1028                                    ; preds = %199
  %1029 = add nsw i32 %bq.0, 1
  br label %1311

; <label>:1030                                    ; preds = %199
  %1031 = load i32* @wmat, align 4
  %1032 = icmp sgt i32 %1031, 1300
  br i1 %1032, label %1033, label %1159

; <label>:1033                                    ; preds = %1030
  %1034 = sext i32 %194 to i64
  %1035 = getelementptr inbounds [144 x i32]* @swhite_king, i32 0, i64 %1034
  %1036 = load i32* %1035, align 4
  %1037 = load i32* %score, align 4
  %1038 = add nsw i32 %1037, %1036
  store i32 %1038, i32* %score, align 4
  %1039 = load i32* @white_castled, align 4
  %1040 = icmp eq i32 %1039, 2
  br i1 %1040, label %1041, label %1044

; <label>:1041                                    ; preds = %1033
  %1042 = load i32* %score, align 4
  %1043 = add nsw i32 %1042, 15
  store i32 %1043, i32* %score, align 4
  br label %1067

; <label>:1044                                    ; preds = %1033
  %1045 = load i32* @white_castled, align 4
  %1046 = icmp eq i32 %1045, 1
  br i1 %1046, label %1047, label %1050

; <label>:1047                                    ; preds = %1044
  %1048 = load i32* %score, align 4
  %1049 = add nsw i32 %1048, 25
  store i32 %1049, i32* %score, align 4
  br label %1066

; <label>:1050                                    ; preds = %1044
  %1051 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 30), align 4
  %1052 = icmp ne i32 %1051, 0
  br i1 %1052, label %1053, label %1065

; <label>:1053                                    ; preds = %1050
  %1054 = load i32* %score, align 4
  %1055 = sub nsw i32 %1054, 10
  store i32 %1055, i32* %score, align 4
  %1056 = sext i32 %219 to i64
  %1057 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1058 = getelementptr inbounds [11 x i32]* %1057, i32 0, i64 %1056
  %1059 = load i32* %1058, align 4
  %1060 = icmp ne i32 %1059, 0
  br i1 %1060, label %1064, label %1061

; <label>:1061                                    ; preds = %1053
  %1062 = load i32* %score, align 4
  %1063 = sub nsw i32 %1062, 15
  store i32 %1063, i32* %score, align 4
  br label %1064

; <label>:1064                                    ; preds = %1061, %1053
  br label %1065

; <label>:1065                                    ; preds = %1064, %1050
  br label %1066

; <label>:1066                                    ; preds = %1065, %1047
  br label %1067

; <label>:1067                                    ; preds = %1066, %1041
  %1068 = load i32* @wking_loc, align 4
  %1069 = sext i32 %1068 to i64
  %1070 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1069
  %1071 = load i32* %1070, align 4
  %1072 = icmp ne i32 %1071, 4
  br i1 %1072, label %1073, label %1155

; <label>:1073                                    ; preds = %1067
  %1074 = load i32* @wking_loc, align 4
  %1075 = sext i32 %1074 to i64
  %1076 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1075
  %1077 = load i32* %1076, align 4
  %1078 = icmp ne i32 %1077, 5
  br i1 %1078, label %1079, label %1155

; <label>:1079                                    ; preds = %1073
  %1080 = sext i32 %219 to i64
  %1081 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1080
  %1082 = load i32* %1081, align 4
  %1083 = icmp slt i32 %222, %1082
  br i1 %1083, label %1084, label %1099

; <label>:1084                                    ; preds = %1079
  %1085 = sext i32 %219 to i64
  %1086 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1087 = getelementptr inbounds [11 x i32]* %1086, i32 0, i64 %1085
  %1088 = load i32* %1087, align 4
  %1089 = icmp ne i32 %1088, 0
  br i1 %1089, label %1090, label %1099

; <label>:1090                                    ; preds = %1084
  %1091 = sext i32 %219 to i64
  %1092 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1091
  %1093 = load i32* %1092, align 4
  %1094 = sub nsw i32 %1093, %222
  %1095 = sub nsw i32 %1094, 1
  %1096 = mul nsw i32 9, %1095
  %1097 = load i32* %score, align 4
  %1098 = sub nsw i32 %1097, %1096
  store i32 %1098, i32* %score, align 4
  br label %1102

; <label>:1099                                    ; preds = %1084, %1079
  %1100 = load i32* %score, align 4
  %1101 = sub nsw i32 %1100, 22
  store i32 %1101, i32* %score, align 4
  br label %1102

; <label>:1102                                    ; preds = %1099, %1090
  %1103 = add nsw i32 %219, 1
  %1104 = sext i32 %1103 to i64
  %1105 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1104
  %1106 = load i32* %1105, align 4
  %1107 = icmp slt i32 %222, %1106
  br i1 %1107, label %1108, label %1125

; <label>:1108                                    ; preds = %1102
  %1109 = add nsw i32 %219, 1
  %1110 = sext i32 %1109 to i64
  %1111 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1112 = getelementptr inbounds [11 x i32]* %1111, i32 0, i64 %1110
  %1113 = load i32* %1112, align 4
  %1114 = icmp ne i32 %1113, 0
  br i1 %1114, label %1115, label %1125

; <label>:1115                                    ; preds = %1108
  %1116 = add nsw i32 %219, 1
  %1117 = sext i32 %1116 to i64
  %1118 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1117
  %1119 = load i32* %1118, align 4
  %1120 = sub nsw i32 %1119, %222
  %1121 = sub nsw i32 %1120, 1
  %1122 = mul nsw i32 8, %1121
  %1123 = load i32* %score, align 4
  %1124 = sub nsw i32 %1123, %1122
  store i32 %1124, i32* %score, align 4
  br label %1128

; <label>:1125                                    ; preds = %1108, %1102
  %1126 = load i32* %score, align 4
  %1127 = sub nsw i32 %1126, 16
  store i32 %1127, i32* %score, align 4
  br label %1128

; <label>:1128                                    ; preds = %1125, %1115
  %1129 = sub nsw i32 %219, 1
  %1130 = sext i32 %1129 to i64
  %1131 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1130
  %1132 = load i32* %1131, align 4
  %1133 = icmp slt i32 %222, %1132
  br i1 %1133, label %1134, label %1151

; <label>:1134                                    ; preds = %1128
  %1135 = sub nsw i32 %219, 1
  %1136 = sext i32 %1135 to i64
  %1137 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1138 = getelementptr inbounds [11 x i32]* %1137, i32 0, i64 %1136
  %1139 = load i32* %1138, align 4
  %1140 = icmp ne i32 %1139, 0
  br i1 %1140, label %1141, label %1151

; <label>:1141                                    ; preds = %1134
  %1142 = sub nsw i32 %219, 1
  %1143 = sext i32 %1142 to i64
  %1144 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1143
  %1145 = load i32* %1144, align 4
  %1146 = sub nsw i32 %1145, %222
  %1147 = sub nsw i32 %1146, 1
  %1148 = mul nsw i32 8, %1147
  %1149 = load i32* %score, align 4
  %1150 = sub nsw i32 %1149, %1148
  store i32 %1150, i32* %score, align 4
  br label %1154

; <label>:1151                                    ; preds = %1134, %1128
  %1152 = load i32* %score, align 4
  %1153 = sub nsw i32 %1152, 16
  store i32 %1153, i32* %score, align 4
  br label %1154

; <label>:1154                                    ; preds = %1151, %1141
  br label %1158

; <label>:1155                                    ; preds = %1073, %1067
  %1156 = load i32* %score, align 4
  %1157 = sub nsw i32 %1156, 10
  store i32 %1157, i32* %score, align 4
  br label %1158

; <label>:1158                                    ; preds = %1155, %1154
  br label %1165

; <label>:1159                                    ; preds = %1030
  %1160 = sext i32 %194 to i64
  %1161 = getelementptr inbounds [144 x i32]* @send_king, i32 0, i64 %1160
  %1162 = load i32* %1161, align 4
  %1163 = load i32* %score, align 4
  %1164 = add nsw i32 %1163, %1162
  store i32 %1164, i32* %score, align 4
  br label %1165

; <label>:1165                                    ; preds = %1159, %1158
  br label %1311

; <label>:1166                                    ; preds = %199
  %1167 = load i32* @bmat, align 4
  %1168 = icmp sgt i32 %1167, 1300
  br i1 %1168, label %1169, label %1304

; <label>:1169                                    ; preds = %1166
  %1170 = sext i32 %194 to i64
  %1171 = getelementptr inbounds [144 x i32]* @sblack_king, i32 0, i64 %1170
  %1172 = load i32* %1171, align 4
  %1173 = load i32* %score, align 4
  %1174 = sub nsw i32 %1173, %1172
  store i32 %1174, i32* %score, align 4
  %1175 = load i32* @black_castled, align 4
  %1176 = icmp eq i32 %1175, 4
  br i1 %1176, label %1177, label %1180

; <label>:1177                                    ; preds = %1169
  %1178 = load i32* %score, align 4
  %1179 = sub nsw i32 %1178, 15
  store i32 %1179, i32* %score, align 4
  br label %1203

; <label>:1180                                    ; preds = %1169
  %1181 = load i32* @black_castled, align 4
  %1182 = icmp eq i32 %1181, 3
  br i1 %1182, label %1183, label %1186

; <label>:1183                                    ; preds = %1180
  %1184 = load i32* %score, align 4
  %1185 = sub nsw i32 %1184, 25
  store i32 %1185, i32* %score, align 4
  br label %1202

; <label>:1186                                    ; preds = %1180
  %1187 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 114), align 4
  %1188 = icmp ne i32 %1187, 0
  br i1 %1188, label %1189, label %1201

; <label>:1189                                    ; preds = %1186
  %1190 = load i32* %score, align 4
  %1191 = add nsw i32 %1190, 10
  store i32 %1191, i32* %score, align 4
  %1192 = sext i32 %219 to i64
  %1193 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1194 = getelementptr inbounds [11 x i32]* %1193, i32 0, i64 %1192
  %1195 = load i32* %1194, align 4
  %1196 = icmp ne i32 %1195, 0
  br i1 %1196, label %1200, label %1197

; <label>:1197                                    ; preds = %1189
  %1198 = load i32* %score, align 4
  %1199 = add nsw i32 %1198, 15
  store i32 %1199, i32* %score, align 4
  br label %1200

; <label>:1200                                    ; preds = %1197, %1189
  br label %1201

; <label>:1201                                    ; preds = %1200, %1186
  br label %1202

; <label>:1202                                    ; preds = %1201, %1183
  br label %1203

; <label>:1203                                    ; preds = %1202, %1177
  %1204 = load i32* @bking_loc, align 4
  %1205 = sext i32 %1204 to i64
  %1206 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1205
  %1207 = load i32* %1206, align 4
  %1208 = icmp ne i32 %1207, 4
  br i1 %1208, label %1209, label %1300

; <label>:1209                                    ; preds = %1203
  %1210 = load i32* @bking_loc, align 4
  %1211 = sext i32 %1210 to i64
  %1212 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1211
  %1213 = load i32* %1212, align 4
  %1214 = icmp ne i32 %1213, 5
  br i1 %1214, label %1215, label %1300

; <label>:1215                                    ; preds = %1209
  %1216 = sext i32 %219 to i64
  %1217 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1216
  %1218 = load i32* %1217, align 4
  %1219 = icmp sgt i32 %222, %1218
  br i1 %1219, label %1220, label %1238

; <label>:1220                                    ; preds = %1215
  %1221 = sext i32 %219 to i64
  %1222 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1223 = getelementptr inbounds [11 x i32]* %1222, i32 0, i64 %1221
  %1224 = load i32* %1223, align 4
  %1225 = icmp ne i32 %1224, 0
  br i1 %1225, label %1226, label %1238

; <label>:1226                                    ; preds = %1220
  %1227 = sext i32 %219 to i64
  %1228 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1227
  %1229 = load i32* %1228, align 4
  %1230 = sub nsw i32 %222, %1229
  %1231 = sub nsw i32 %1230, 1
  %1232 = sext i32 %1231 to i64
  %1233 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1232
  %1234 = load i32* %1233, align 4
  %1235 = mul nsw i32 9, %1234
  %1236 = load i32* %score, align 4
  %1237 = add nsw i32 %1236, %1235
  store i32 %1237, i32* %score, align 4
  br label %1241

; <label>:1238                                    ; preds = %1220, %1215
  %1239 = load i32* %score, align 4
  %1240 = add nsw i32 %1239, 22
  store i32 %1240, i32* %score, align 4
  br label %1241

; <label>:1241                                    ; preds = %1238, %1226
  %1242 = add nsw i32 %219, 1
  %1243 = sext i32 %1242 to i64
  %1244 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1243
  %1245 = load i32* %1244, align 4
  %1246 = icmp sgt i32 %222, %1245
  br i1 %1246, label %1247, label %1267

; <label>:1247                                    ; preds = %1241
  %1248 = add nsw i32 %219, 1
  %1249 = sext i32 %1248 to i64
  %1250 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1251 = getelementptr inbounds [11 x i32]* %1250, i32 0, i64 %1249
  %1252 = load i32* %1251, align 4
  %1253 = icmp ne i32 %1252, 0
  br i1 %1253, label %1254, label %1267

; <label>:1254                                    ; preds = %1247
  %1255 = add nsw i32 %219, 1
  %1256 = sext i32 %1255 to i64
  %1257 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1256
  %1258 = load i32* %1257, align 4
  %1259 = sub nsw i32 %222, %1258
  %1260 = sub nsw i32 %1259, 1
  %1261 = sext i32 %1260 to i64
  %1262 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1261
  %1263 = load i32* %1262, align 4
  %1264 = mul nsw i32 8, %1263
  %1265 = load i32* %score, align 4
  %1266 = add nsw i32 %1265, %1264
  store i32 %1266, i32* %score, align 4
  br label %1270

; <label>:1267                                    ; preds = %1247, %1241
  %1268 = load i32* %score, align 4
  %1269 = add nsw i32 %1268, 16
  store i32 %1269, i32* %score, align 4
  br label %1270

; <label>:1270                                    ; preds = %1267, %1254
  %1271 = sub nsw i32 %219, 1
  %1272 = sext i32 %1271 to i64
  %1273 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1272
  %1274 = load i32* %1273, align 4
  %1275 = icmp sgt i32 %222, %1274
  br i1 %1275, label %1276, label %1296

; <label>:1276                                    ; preds = %1270
  %1277 = sub nsw i32 %219, 1
  %1278 = sext i32 %1277 to i64
  %1279 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1280 = getelementptr inbounds [11 x i32]* %1279, i32 0, i64 %1278
  %1281 = load i32* %1280, align 4
  %1282 = icmp ne i32 %1281, 0
  br i1 %1282, label %1283, label %1296

; <label>:1283                                    ; preds = %1276
  %1284 = sub nsw i32 %219, 1
  %1285 = sext i32 %1284 to i64
  %1286 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1285
  %1287 = load i32* %1286, align 4
  %1288 = sub nsw i32 %222, %1287
  %1289 = sub nsw i32 %1288, 1
  %1290 = sext i32 %1289 to i64
  %1291 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1290
  %1292 = load i32* %1291, align 4
  %1293 = mul nsw i32 8, %1292
  %1294 = load i32* %score, align 4
  %1295 = add nsw i32 %1294, %1293
  store i32 %1295, i32* %score, align 4
  br label %1299

; <label>:1296                                    ; preds = %1276, %1270
  %1297 = load i32* %score, align 4
  %1298 = add nsw i32 %1297, 16
  store i32 %1298, i32* %score, align 4
  br label %1299

; <label>:1299                                    ; preds = %1296, %1283
  br label %1303

; <label>:1300                                    ; preds = %1209, %1203
  %1301 = load i32* %score, align 4
  %1302 = add nsw i32 %1301, 10
  store i32 %1302, i32* %score, align 4
  br label %1303

; <label>:1303                                    ; preds = %1300, %1299
  br label %1310

; <label>:1304                                    ; preds = %1166
  %1305 = sext i32 %194 to i64
  %1306 = getelementptr inbounds [144 x i32]* @send_king, i32 0, i64 %1305
  %1307 = load i32* %1306, align 4
  %1308 = load i32* %score, align 4
  %1309 = sub nsw i32 %1308, %1307
  store i32 %1309, i32* %score, align 4
  br label %1310

; <label>:1310                                    ; preds = %1304, %1303
  br label %1311

; <label>:1311                                    ; preds = %1310, %1165, %1028, %1026, %1024, %1022, %1020, %1018, %1017, %966, %915, %569, %199
  %wpotential.5 = phi i32 [ %wpotential.0, %199 ], [ %wpotential.0, %1310 ], [ %wpotential.0, %1165 ], [ %wpotential.0, %1028 ], [ %wpotential.0, %1026 ], [ %wpotential.0, %1024 ], [ %wpotential.0, %1022 ], [ %wpotential.0, %1020 ], [ %wpotential.0, %1018 ], [ %wpotential.0, %1017 ], [ %wpotential.0, %966 ], [ %wpotential.0, %915 ], [ %wpotential.4, %569 ]
  %fwrook.2 = phi i32 [ %fwrook.0, %199 ], [ %fwrook.0, %1310 ], [ %fwrook.0, %1165 ], [ %fwrook.0, %1028 ], [ %fwrook.0, %1026 ], [ %fwrook.0, %1024 ], [ %fwrook.0, %1022 ], [ %fwrook.0, %1020 ], [ %fwrook.0, %1018 ], [ %fwrook.0, %1017 ], [ %fwrook.1, %966 ], [ %fwrook.0, %915 ], [ %fwrook.0, %569 ]
  %rwrook.2 = phi i32 [ %rwrook.0, %199 ], [ %rwrook.0, %1310 ], [ %rwrook.0, %1165 ], [ %rwrook.0, %1028 ], [ %rwrook.0, %1026 ], [ %rwrook.0, %1024 ], [ %rwrook.0, %1022 ], [ %rwrook.0, %1020 ], [ %rwrook.0, %1018 ], [ %rwrook.0, %1017 ], [ %rwrook.1, %966 ], [ %rwrook.0, %915 ], [ %rwrook.0, %569 ]
  %fbrook.2 = phi i32 [ %fbrook.0, %199 ], [ %fbrook.0, %1310 ], [ %fbrook.0, %1165 ], [ %fbrook.0, %1028 ], [ %fbrook.0, %1026 ], [ %fbrook.0, %1024 ], [ %fbrook.0, %1022 ], [ %fbrook.0, %1020 ], [ %fbrook.0, %1018 ], [ %fbrook.1, %1017 ], [ %fbrook.0, %966 ], [ %fbrook.0, %915 ], [ %fbrook.0, %569 ]
  %rbrook.2 = phi i32 [ %rbrook.0, %199 ], [ %rbrook.0, %1310 ], [ %rbrook.0, %1165 ], [ %rbrook.0, %1028 ], [ %rbrook.0, %1026 ], [ %rbrook.0, %1024 ], [ %rbrook.0, %1022 ], [ %rbrook.0, %1020 ], [ %rbrook.0, %1018 ], [ %rbrook.1, %1017 ], [ %rbrook.0, %966 ], [ %rbrook.0, %915 ], [ %rbrook.0, %569 ]
  %br.1 = phi i32 [ %br.0, %199 ], [ %br.0, %1310 ], [ %br.0, %1165 ], [ %br.0, %1028 ], [ %br.0, %1026 ], [ %br.0, %1024 ], [ %br.0, %1022 ], [ %br.0, %1020 ], [ %br.0, %1018 ], [ %968, %1017 ], [ %br.0, %966 ], [ %br.0, %915 ], [ %br.0, %569 ]
  %wr.1 = phi i32 [ %wr.0, %199 ], [ %wr.0, %1310 ], [ %wr.0, %1165 ], [ %wr.0, %1028 ], [ %wr.0, %1026 ], [ %wr.0, %1024 ], [ %wr.0, %1022 ], [ %wr.0, %1020 ], [ %wr.0, %1018 ], [ %wr.0, %1017 ], [ %917, %966 ], [ %wr.0, %915 ], [ %wr.0, %569 ]
  %bq.1 = phi i32 [ %bq.0, %199 ], [ %bq.0, %1310 ], [ %bq.0, %1165 ], [ %1029, %1028 ], [ %bq.0, %1026 ], [ %bq.0, %1024 ], [ %bq.0, %1022 ], [ %bq.0, %1020 ], [ %bq.0, %1018 ], [ %bq.0, %1017 ], [ %bq.0, %966 ], [ %bq.0, %915 ], [ %bq.0, %569 ]
  %wq.1 = phi i32 [ %wq.0, %199 ], [ %wq.0, %1310 ], [ %wq.0, %1165 ], [ %wq.0, %1028 ], [ %1027, %1026 ], [ %wq.0, %1024 ], [ %wq.0, %1022 ], [ %wq.0, %1020 ], [ %wq.0, %1018 ], [ %wq.0, %1017 ], [ %wq.0, %966 ], [ %wq.0, %915 ], [ %wq.0, %569 ]
  %bb.1 = phi i32 [ %bb.0, %199 ], [ %bb.0, %1310 ], [ %bb.0, %1165 ], [ %bb.0, %1028 ], [ %bb.0, %1026 ], [ %bb.0, %1024 ], [ %bb.0, %1022 ], [ %1021, %1020 ], [ %bb.0, %1018 ], [ %bb.0, %1017 ], [ %bb.0, %966 ], [ %bb.0, %915 ], [ %bb.0, %569 ]
  %wb.1 = phi i32 [ %wb.0, %199 ], [ %wb.0, %1310 ], [ %wb.0, %1165 ], [ %wb.0, %1028 ], [ %wb.0, %1026 ], [ %wb.0, %1024 ], [ %wb.0, %1022 ], [ %wb.0, %1020 ], [ %1019, %1018 ], [ %wb.0, %1017 ], [ %wb.0, %966 ], [ %wb.0, %915 ], [ %wb.0, %569 ]
  %bn.1 = phi i32 [ %bn.0, %199 ], [ %bn.0, %1310 ], [ %bn.0, %1165 ], [ %bn.0, %1028 ], [ %bn.0, %1026 ], [ %1025, %1024 ], [ %bn.0, %1022 ], [ %bn.0, %1020 ], [ %bn.0, %1018 ], [ %bn.0, %1017 ], [ %bn.0, %966 ], [ %bn.0, %915 ], [ %bn.0, %569 ]
  %wn.1 = phi i32 [ %wn.0, %199 ], [ %wn.0, %1310 ], [ %wn.0, %1165 ], [ %wn.0, %1028 ], [ %wn.0, %1026 ], [ %wn.0, %1024 ], [ %1023, %1022 ], [ %wn.0, %1020 ], [ %wn.0, %1018 ], [ %wn.0, %1017 ], [ %wn.0, %966 ], [ %wn.0, %915 ], [ %wn.0, %569 ]
  %bp.1 = phi i32 [ %bp.0, %199 ], [ %bp.0, %1310 ], [ %bp.0, %1165 ], [ %bp.0, %1028 ], [ %bp.0, %1026 ], [ %bp.0, %1024 ], [ %bp.0, %1022 ], [ %bp.0, %1020 ], [ %bp.0, %1018 ], [ %bp.0, %1017 ], [ %bp.0, %966 ], [ %576, %915 ], [ %bp.0, %569 ]
  %wp.1 = phi i32 [ %wp.0, %199 ], [ %wp.0, %1310 ], [ %wp.0, %1165 ], [ %wp.0, %1028 ], [ %wp.0, %1026 ], [ %wp.0, %1024 ], [ %wp.0, %1022 ], [ %wp.0, %1020 ], [ %wp.0, %1018 ], [ %wp.0, %1017 ], [ %wp.0, %966 ], [ %wp.0, %915 ], [ %232, %569 ]
  %bpotential.5 = phi i32 [ %bpotential.0, %199 ], [ %bpotential.0, %1310 ], [ %bpotential.0, %1165 ], [ %bpotential.0, %1028 ], [ %bpotential.0, %1026 ], [ %bpotential.0, %1024 ], [ %bpotential.0, %1022 ], [ %bpotential.0, %1020 ], [ %bpotential.0, %1018 ], [ %bpotential.0, %1017 ], [ %bpotential.0, %966 ], [ %bpotential.4, %915 ], [ %bpotential.0, %569 ]
  br label %1312

; <label>:1312                                    ; preds = %1311, %196
  %wpotential.6 = phi i32 [ %wpotential.5, %1311 ], [ %wpotential.0, %196 ]
  %fwrook.3 = phi i32 [ %fwrook.2, %1311 ], [ %fwrook.0, %196 ]
  %rwrook.3 = phi i32 [ %rwrook.2, %1311 ], [ %rwrook.0, %196 ]
  %fbrook.3 = phi i32 [ %fbrook.2, %1311 ], [ %fbrook.0, %196 ]
  %rbrook.3 = phi i32 [ %rbrook.2, %1311 ], [ %rbrook.0, %196 ]
  %br.2 = phi i32 [ %br.1, %1311 ], [ %br.0, %196 ]
  %wr.2 = phi i32 [ %wr.1, %1311 ], [ %wr.0, %196 ]
  %bq.2 = phi i32 [ %bq.1, %1311 ], [ %bq.0, %196 ]
  %wq.2 = phi i32 [ %wq.1, %1311 ], [ %wq.0, %196 ]
  %bb.2 = phi i32 [ %bb.1, %1311 ], [ %bb.0, %196 ]
  %wb.2 = phi i32 [ %wb.1, %1311 ], [ %wb.0, %196 ]
  %bn.2 = phi i32 [ %bn.1, %1311 ], [ %bn.0, %196 ]
  %wn.2 = phi i32 [ %wn.1, %1311 ], [ %wn.0, %196 ]
  %bp.2 = phi i32 [ %bp.1, %1311 ], [ %bp.0, %196 ]
  %wp.2 = phi i32 [ %wp.1, %1311 ], [ %wp.0, %196 ]
  %bpotential.6 = phi i32 [ %bpotential.5, %1311 ], [ %bpotential.0, %196 ]
  %a.3 = phi i32 [ %198, %1311 ], [ %a.2, %196 ]
  %1313 = add nsw i32 %j.1, 1
  br label %188

; <label>:1314                                    ; preds = %188
  %1315 = load i32* @wmat, align 4
  %1316 = icmp sgt i32 %1315, 2200
  br i1 %1316, label %1320, label %1317

; <label>:1317                                    ; preds = %1314
  %1318 = load i32* @bmat, align 4
  %1319 = icmp sgt i32 %1318, 2200
  br i1 %1319, label %1320, label %1357

; <label>:1320                                    ; preds = %1317, %1314
  %1321 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 41), align 4
  %1322 = icmp ne i32 %1321, 0
  br i1 %1322, label %1329, label %1323

; <label>:1323                                    ; preds = %1320
  %1324 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 53), align 4
  %1325 = icmp ne i32 %1324, 13
  br i1 %1325, label %1326, label %1329

; <label>:1326                                    ; preds = %1323
  %1327 = load i32* %score, align 4
  %1328 = sub nsw i32 %1327, 5
  store i32 %1328, i32* %score, align 4
  br label %1329

; <label>:1329                                    ; preds = %1326, %1323, %1320
  %1330 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 42), align 4
  %1331 = icmp ne i32 %1330, 0
  br i1 %1331, label %1338, label %1332

; <label>:1332                                    ; preds = %1329
  %1333 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 54), align 4
  %1334 = icmp ne i32 %1333, 13
  br i1 %1334, label %1335, label %1338

; <label>:1335                                    ; preds = %1332
  %1336 = load i32* %score, align 4
  %1337 = sub nsw i32 %1336, 5
  store i32 %1337, i32* %score, align 4
  br label %1338

; <label>:1338                                    ; preds = %1335, %1332, %1329
  %1339 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 101), align 4
  %1340 = icmp ne i32 %1339, 0
  br i1 %1340, label %1347, label %1341

; <label>:1341                                    ; preds = %1338
  %1342 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 89), align 4
  %1343 = icmp ne i32 %1342, 13
  br i1 %1343, label %1344, label %1347

; <label>:1344                                    ; preds = %1341
  %1345 = load i32* %score, align 4
  %1346 = add nsw i32 %1345, 5
  store i32 %1346, i32* %score, align 4
  br label %1347

; <label>:1347                                    ; preds = %1344, %1341, %1338
  %1348 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 102), align 4
  %1349 = icmp ne i32 %1348, 0
  br i1 %1349, label %1356, label %1350

; <label>:1350                                    ; preds = %1347
  %1351 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 90), align 4
  %1352 = icmp ne i32 %1351, 13
  br i1 %1352, label %1353, label %1356

; <label>:1353                                    ; preds = %1350
  %1354 = load i32* %score, align 4
  %1355 = add nsw i32 %1354, 5
  store i32 %1355, i32* %score, align 4
  br label %1356

; <label>:1356                                    ; preds = %1353, %1350, %1347
  br label %1357

; <label>:1357                                    ; preds = %1356, %1317
  %1358 = load i32* @wmat, align 4
  %1359 = icmp sgt i32 %1358, 1300
  br i1 %1359, label %1363, label %1360

; <label>:1360                                    ; preds = %1357
  %1361 = load i32* @bmat, align 4
  %1362 = icmp sgt i32 %1361, 1300
  br i1 %1362, label %1363, label %1480

; <label>:1363                                    ; preds = %1360, %1357
  %1364 = load i32* @wking_loc, align 4
  %1365 = sext i32 %1364 to i64
  %1366 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1365
  %1367 = load i32* %1366, align 4
  %1368 = add nsw i32 %1367, 1
  %1369 = load i32* @bking_loc, align 4
  %1370 = sext i32 %1369 to i64
  %1371 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1370
  %1372 = load i32* %1371, align 4
  %1373 = add nsw i32 %1372, 1
  %1374 = sub nsw i32 %1368, %1373
  %1375 = call i32 @abs(i32 %1374) #6
  %1376 = icmp sgt i32 %1375, 2
  br i1 %1376, label %1377, label %1479

; <label>:1377                                    ; preds = %1363
  %1378 = sext i32 %1368 to i64
  %1379 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1378
  %1380 = load i32* %1379, align 4
  %1381 = sext i32 %1380 to i64
  %1382 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1381
  %1383 = load i32* %1382, align 4
  %1384 = sub nsw i32 %1383, 2
  %1385 = mul nsw i32 3, %1384
  %1386 = add nsw i32 0, %1385
  %1387 = add nsw i32 %1368, 1
  %1388 = sext i32 %1387 to i64
  %1389 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1388
  %1390 = load i32* %1389, align 4
  %1391 = sext i32 %1390 to i64
  %1392 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1391
  %1393 = load i32* %1392, align 4
  %1394 = sub nsw i32 %1393, 2
  %1395 = mul nsw i32 3, %1394
  %1396 = add nsw i32 %1386, %1395
  %1397 = sub nsw i32 %1368, 1
  %1398 = sext i32 %1397 to i64
  %1399 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1398
  %1400 = load i32* %1399, align 4
  %1401 = sext i32 %1400 to i64
  %1402 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1401
  %1403 = load i32* %1402, align 4
  %1404 = sub nsw i32 %1403, 2
  %1405 = mul nsw i32 3, %1404
  %1406 = add nsw i32 %1396, %1405
  %1407 = sext i32 %1373 to i64
  %1408 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1407
  %1409 = load i32* %1408, align 4
  %1410 = sub nsw i32 %1409, 2
  %1411 = mul nsw i32 3, %1410
  %1412 = add nsw i32 0, %1411
  %1413 = add nsw i32 %1373, 1
  %1414 = sext i32 %1413 to i64
  %1415 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1414
  %1416 = load i32* %1415, align 4
  %1417 = sub nsw i32 %1416, 2
  %1418 = mul nsw i32 3, %1417
  %1419 = add nsw i32 %1412, %1418
  %1420 = sub nsw i32 %1373, 1
  %1421 = sext i32 %1420 to i64
  %1422 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1421
  %1423 = load i32* %1422, align 4
  %1424 = sub nsw i32 %1423, 2
  %1425 = mul nsw i32 3, %1424
  %1426 = add nsw i32 %1419, %1425
  %1427 = sext i32 %1368 to i64
  %1428 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1429 = getelementptr inbounds [11 x i32]* %1428, i32 0, i64 %1427
  %1430 = load i32* %1429, align 4
  %1431 = icmp ne i32 %1430, 0
  br i1 %1431, label %1434, label %1432

; <label>:1432                                    ; preds = %1377
  %1433 = add nsw i32 %1406, 8
  br label %1434

; <label>:1434                                    ; preds = %1432, %1377
  %wksafety.0 = phi i32 [ %1406, %1377 ], [ %1433, %1432 ]
  %1435 = add nsw i32 %1368, 1
  %1436 = sext i32 %1435 to i64
  %1437 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1438 = getelementptr inbounds [11 x i32]* %1437, i32 0, i64 %1436
  %1439 = load i32* %1438, align 4
  %1440 = icmp ne i32 %1439, 0
  br i1 %1440, label %1443, label %1441

; <label>:1441                                    ; preds = %1434
  %1442 = add nsw i32 %wksafety.0, 6
  br label %1443

; <label>:1443                                    ; preds = %1441, %1434
  %wksafety.1 = phi i32 [ %wksafety.0, %1434 ], [ %1442, %1441 ]
  %1444 = sub nsw i32 %1368, 1
  %1445 = sext i32 %1444 to i64
  %1446 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0
  %1447 = getelementptr inbounds [11 x i32]* %1446, i32 0, i64 %1445
  %1448 = load i32* %1447, align 4
  %1449 = icmp ne i32 %1448, 0
  br i1 %1449, label %1452, label %1450

; <label>:1450                                    ; preds = %1443
  %1451 = add nsw i32 %wksafety.1, 6
  br label %1452

; <label>:1452                                    ; preds = %1450, %1443
  %wksafety.2 = phi i32 [ %wksafety.1, %1443 ], [ %1451, %1450 ]
  %1453 = sext i32 %1373 to i64
  %1454 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1455 = getelementptr inbounds [11 x i32]* %1454, i32 0, i64 %1453
  %1456 = load i32* %1455, align 4
  %1457 = icmp ne i32 %1456, 0
  br i1 %1457, label %1460, label %1458

; <label>:1458                                    ; preds = %1452
  %1459 = add nsw i32 %1426, 8
  br label %1460

; <label>:1460                                    ; preds = %1458, %1452
  %bksafety.0 = phi i32 [ %1426, %1452 ], [ %1459, %1458 ]
  %1461 = add nsw i32 %1373, 1
  %1462 = sext i32 %1461 to i64
  %1463 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1464 = getelementptr inbounds [11 x i32]* %1463, i32 0, i64 %1462
  %1465 = load i32* %1464, align 4
  %1466 = icmp ne i32 %1465, 0
  br i1 %1466, label %1469, label %1467

; <label>:1467                                    ; preds = %1460
  %1468 = add nsw i32 %bksafety.0, 6
  br label %1469

; <label>:1469                                    ; preds = %1467, %1460
  %bksafety.1 = phi i32 [ %bksafety.0, %1460 ], [ %1468, %1467 ]
  %1470 = sub nsw i32 %1373, 1
  %1471 = sext i32 %1470 to i64
  %1472 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1
  %1473 = getelementptr inbounds [11 x i32]* %1472, i32 0, i64 %1471
  %1474 = load i32* %1473, align 4
  %1475 = icmp ne i32 %1474, 0
  br i1 %1475, label %1478, label %1476

; <label>:1476                                    ; preds = %1469
  %1477 = add nsw i32 %bksafety.1, 6
  br label %1478

; <label>:1478                                    ; preds = %1476, %1469
  %bksafety.2 = phi i32 [ %bksafety.1, %1469 ], [ %1477, %1476 ]
  br label %1479

; <label>:1479                                    ; preds = %1478, %1363
  %wksafety.3 = phi i32 [ %wksafety.2, %1478 ], [ 0, %1363 ]
  %bksafety.3 = phi i32 [ %bksafety.2, %1478 ], [ 0, %1363 ]
  br label %1480

; <label>:1480                                    ; preds = %1479, %1360
  %wksafety.4 = phi i32 [ %wksafety.3, %1479 ], [ 0, %1360 ]
  %bksafety.4 = phi i32 [ %bksafety.3, %1479 ], [ 0, %1360 ]
  %1481 = load i32* @bmat, align 4
  %1482 = icmp sgt i32 %1481, 1300
  br i1 %1482, label %1483, label %1488

; <label>:1483                                    ; preds = %1480
  %1484 = icmp ne i32 %bq.0, 0
  br i1 %1484, label %1485, label %1488

; <label>:1485                                    ; preds = %1483
  %1486 = load i32* %score, align 4
  %1487 = sub nsw i32 %1486, %wksafety.4
  store i32 %1487, i32* %score, align 4
  br label %1488

; <label>:1488                                    ; preds = %1485, %1483, %1480
  %1489 = load i32* @wmat, align 4
  %1490 = icmp sgt i32 %1489, 1300
  br i1 %1490, label %1491, label %1496

; <label>:1491                                    ; preds = %1488
  %1492 = icmp ne i32 %wq.0, 0
  br i1 %1492, label %1493, label %1496

; <label>:1493                                    ; preds = %1491
  %1494 = load i32* %score, align 4
  %1495 = add nsw i32 %1494, %bksafety.4
  store i32 %1495, i32* %score, align 4
  br label %1496

; <label>:1496                                    ; preds = %1493, %1491, %1488
  %1497 = icmp ne i32 %wr.0, 0
  br i1 %1497, label %1507, label %1498

; <label>:1498                                    ; preds = %1496
  %1499 = icmp ne i32 %wq.0, 0
  br i1 %1499, label %1507, label %1500

; <label>:1500                                    ; preds = %1498
  %1501 = icmp ne i32 %wb.0, 0
  br i1 %1501, label %1507, label %1502

; <label>:1502                                    ; preds = %1500
  %1503 = icmp ne i32 %wn.0, 0
  br i1 %1503, label %1507, label %1504

; <label>:1504                                    ; preds = %1502
  %1505 = load i32* %score, align 4
  %1506 = add nsw i32 %1505, %bpotential.0
  store i32 %1506, i32* %score, align 4
  br label %1507

; <label>:1507                                    ; preds = %1504, %1502, %1500, %1498, %1496
  %1508 = icmp ne i32 %br.0, 0
  br i1 %1508, label %1518, label %1509

; <label>:1509                                    ; preds = %1507
  %1510 = icmp ne i32 %bq.0, 0
  br i1 %1510, label %1518, label %1511

; <label>:1511                                    ; preds = %1509
  %1512 = icmp ne i32 %bb.0, 0
  br i1 %1512, label %1518, label %1513

; <label>:1513                                    ; preds = %1511
  %1514 = icmp ne i32 %bn.0, 0
  br i1 %1514, label %1518, label %1515

; <label>:1515                                    ; preds = %1513
  %1516 = load i32* %score, align 4
  %1517 = add nsw i32 %1516, %wpotential.0
  store i32 %1517, i32* %score, align 4
  br label %1518

; <label>:1518                                    ; preds = %1515, %1513, %1511, %1509, %1507
  %1519 = icmp ne i32 %wp.0, 0
  br i1 %1519, label %1622, label %1520

; <label>:1520                                    ; preds = %1518
  %1521 = icmp ne i32 %bp.0, 0
  br i1 %1521, label %1622, label %1522

; <label>:1522                                    ; preds = %1520
  %1523 = icmp ne i32 %wr.0, 0
  br i1 %1523, label %1571, label %1524

; <label>:1524                                    ; preds = %1522
  %1525 = icmp ne i32 %br.0, 0
  br i1 %1525, label %1571, label %1526

; <label>:1526                                    ; preds = %1524
  %1527 = icmp ne i32 %wq.0, 0
  br i1 %1527, label %1571, label %1528

; <label>:1528                                    ; preds = %1526
  %1529 = icmp ne i32 %bq.0, 0
  br i1 %1529, label %1571, label %1530

; <label>:1530                                    ; preds = %1528
  %1531 = icmp ne i32 %bb.0, 0
  br i1 %1531, label %1540, label %1532

; <label>:1532                                    ; preds = %1530
  %1533 = icmp ne i32 %wb.0, 0
  br i1 %1533, label %1540, label %1534

; <label>:1534                                    ; preds = %1532
  %1535 = icmp slt i32 %wn.0, 3
  br i1 %1535, label %1536, label %1539

; <label>:1536                                    ; preds = %1534
  %1537 = icmp slt i32 %bn.0, 3
  br i1 %1537, label %1538, label %1539

; <label>:1538                                    ; preds = %1536
  store i32 0, i32* %score, align 4
  br label %1539

; <label>:1539                                    ; preds = %1538, %1536, %1534
  br label %1570

; <label>:1540                                    ; preds = %1532, %1530
  %1541 = icmp ne i32 %wn.0, 0
  br i1 %1541, label %1550, label %1542

; <label>:1542                                    ; preds = %1540
  %1543 = icmp ne i32 %bn.0, 0
  br i1 %1543, label %1550, label %1544

; <label>:1544                                    ; preds = %1542
  %1545 = sub nsw i32 %wb.0, %bb.0
  %1546 = call i32 @abs(i32 %1545) #6
  %1547 = icmp slt i32 %1546, 2
  br i1 %1547, label %1548, label %1549

; <label>:1548                                    ; preds = %1544
  store i32 0, i32* %score, align 4
  br label %1549

; <label>:1549                                    ; preds = %1548, %1544
  br label %1569

; <label>:1550                                    ; preds = %1542, %1540
  %1551 = icmp slt i32 %wn.0, 3
  br i1 %1551, label %1552, label %1554

; <label>:1552                                    ; preds = %1550
  %1553 = icmp ne i32 %wb.0, 0
  br i1 %1553, label %1554, label %1558

; <label>:1554                                    ; preds = %1552, %1550
  %1555 = icmp eq i32 %wb.0, 1
  br i1 %1555, label %1556, label %1568

; <label>:1556                                    ; preds = %1554
  %1557 = icmp ne i32 %wn.0, 0
  br i1 %1557, label %1568, label %1558

; <label>:1558                                    ; preds = %1556, %1552
  %1559 = icmp slt i32 %bn.0, 3
  br i1 %1559, label %1560, label %1562

; <label>:1560                                    ; preds = %1558
  %1561 = icmp ne i32 %bb.0, 0
  br i1 %1561, label %1562, label %1566

; <label>:1562                                    ; preds = %1560, %1558
  %1563 = icmp eq i32 %bb.0, 1
  br i1 %1563, label %1564, label %1567

; <label>:1564                                    ; preds = %1562
  %1565 = icmp ne i32 %bn.0, 0
  br i1 %1565, label %1567, label %1566

; <label>:1566                                    ; preds = %1564, %1560
  store i32 0, i32* %score, align 4
  br label %1567

; <label>:1567                                    ; preds = %1566, %1564, %1562
  br label %1568

; <label>:1568                                    ; preds = %1567, %1556, %1554
  br label %1569

; <label>:1569                                    ; preds = %1568, %1549
  br label %1570

; <label>:1570                                    ; preds = %1569, %1539
  br label %1621

; <label>:1571                                    ; preds = %1528, %1526, %1524, %1522
  %1572 = icmp ne i32 %wq.0, 0
  br i1 %1572, label %1620, label %1573

; <label>:1573                                    ; preds = %1571
  %1574 = icmp ne i32 %bq.0, 0
  br i1 %1574, label %1620, label %1575

; <label>:1575                                    ; preds = %1573
  %1576 = icmp eq i32 %wr.0, 1
  br i1 %1576, label %1577, label %1587

; <label>:1577                                    ; preds = %1575
  %1578 = icmp eq i32 %br.0, 1
  br i1 %1578, label %1579, label %1587

; <label>:1579                                    ; preds = %1577
  %1580 = add nsw i32 %wn.0, %wb.0
  %1581 = icmp slt i32 %1580, 2
  br i1 %1581, label %1582, label %1586

; <label>:1582                                    ; preds = %1579
  %1583 = add nsw i32 %bn.0, %bb.0
  %1584 = icmp slt i32 %1583, 2
  br i1 %1584, label %1585, label %1586

; <label>:1585                                    ; preds = %1582
  store i32 0, i32* %score, align 4
  br label %1586

; <label>:1586                                    ; preds = %1585, %1582, %1579
  br label %1619

; <label>:1587                                    ; preds = %1577, %1575
  %1588 = icmp eq i32 %wr.0, 1
  br i1 %1588, label %1589, label %1602

; <label>:1589                                    ; preds = %1587
  %1590 = icmp ne i32 %br.0, 0
  br i1 %1590, label %1602, label %1591

; <label>:1591                                    ; preds = %1589
  %1592 = add nsw i32 %wn.0, %wb.0
  %1593 = icmp eq i32 %1592, 0
  br i1 %1593, label %1594, label %1601

; <label>:1594                                    ; preds = %1591
  %1595 = add nsw i32 %bn.0, %bb.0
  %1596 = icmp eq i32 %1595, 1
  br i1 %1596, label %1600, label %1597

; <label>:1597                                    ; preds = %1594
  %1598 = add nsw i32 %bn.0, %bb.0
  %1599 = icmp eq i32 %1598, 2
  br i1 %1599, label %1600, label %1601

; <label>:1600                                    ; preds = %1597, %1594
  store i32 0, i32* %score, align 4
  br label %1601

; <label>:1601                                    ; preds = %1600, %1597, %1591
  br label %1618

; <label>:1602                                    ; preds = %1589, %1587
  %1603 = icmp eq i32 %br.0, 1
  br i1 %1603, label %1604, label %1617

; <label>:1604                                    ; preds = %1602
  %1605 = icmp ne i32 %wr.0, 0
  br i1 %1605, label %1617, label %1606

; <label>:1606                                    ; preds = %1604
  %1607 = add nsw i32 %bn.0, %bb.0
  %1608 = icmp eq i32 %1607, 0
  br i1 %1608, label %1609, label %1616

; <label>:1609                                    ; preds = %1606
  %1610 = add nsw i32 %wn.0, %wb.0
  %1611 = icmp eq i32 %1610, 1
  br i1 %1611, label %1615, label %1612

; <label>:1612                                    ; preds = %1609
  %1613 = add nsw i32 %wn.0, %wb.0
  %1614 = icmp eq i32 %1613, 2
  br i1 %1614, label %1615, label %1616

; <label>:1615                                    ; preds = %1612, %1609
  store i32 0, i32* %score, align 4
  br label %1616

; <label>:1616                                    ; preds = %1615, %1612, %1606
  br label %1617

; <label>:1617                                    ; preds = %1616, %1604, %1602
  br label %1618

; <label>:1618                                    ; preds = %1617, %1601
  br label %1619

; <label>:1619                                    ; preds = %1618, %1586
  br label %1620

; <label>:1620                                    ; preds = %1619, %1573, %1571
  br label %1621

; <label>:1621                                    ; preds = %1620, %1570
  br label %1714

; <label>:1622                                    ; preds = %1520, %1518
  %1623 = add nsw i32 %wn.0, %wb.0
  %1624 = add nsw i32 %bn.0, %bb.0
  %1625 = icmp ne i32 %1623, %1624
  br i1 %1625, label %1626, label %1692

; <label>:1626                                    ; preds = %1622
  %1627 = add nsw i32 %wq.0, %wr.0
  %1628 = add nsw i32 %bq.0, %br.0
  %1629 = icmp eq i32 %1627, %1628
  br i1 %1629, label %1630, label %1641

; <label>:1630                                    ; preds = %1626
  %1631 = add nsw i32 %wn.0, %wb.0
  %1632 = add nsw i32 %bn.0, %bb.0
  %1633 = icmp sgt i32 %1631, %1632
  br i1 %1633, label %1634, label %1637

; <label>:1634                                    ; preds = %1630
  %1635 = load i32* %score, align 4
  %1636 = add nsw i32 %1635, 120
  store i32 %1636, i32* %score, align 4
  br label %1640

; <label>:1637                                    ; preds = %1630
  %1638 = load i32* %score, align 4
  %1639 = sub nsw i32 %1638, 120
  store i32 %1639, i32* %score, align 4
  br label %1640

; <label>:1640                                    ; preds = %1637, %1634
  br label %1691

; <label>:1641                                    ; preds = %1626
  %1642 = add nsw i32 %wr.0, %wq.0
  %1643 = add nsw i32 %br.0, %bq.0
  %1644 = sub nsw i32 %1642, %1643
  %1645 = call i32 @abs(i32 %1644) #6
  %1646 = icmp eq i32 %1645, 1
  br i1 %1646, label %1647, label %1665

; <label>:1647                                    ; preds = %1641
  %1648 = add nsw i32 %wb.0, %wn.0
  %1649 = add nsw i32 %bb.0, %bn.0
  %1650 = add nsw i32 %1649, 1
  %1651 = icmp sgt i32 %1648, %1650
  br i1 %1651, label %1652, label %1655

; <label>:1652                                    ; preds = %1647
  %1653 = load i32* %score, align 4
  %1654 = add nsw i32 %1653, 120
  store i32 %1654, i32* %score, align 4
  br label %1664

; <label>:1655                                    ; preds = %1647
  %1656 = add nsw i32 %bb.0, %bn.0
  %1657 = add nsw i32 %wb.0, %wn.0
  %1658 = add nsw i32 %1657, 1
  %1659 = icmp sgt i32 %1656, %1658
  br i1 %1659, label %1660, label %1663

; <label>:1660                                    ; preds = %1655
  %1661 = load i32* %score, align 4
  %1662 = sub nsw i32 %1661, 120
  store i32 %1662, i32* %score, align 4
  br label %1663

; <label>:1663                                    ; preds = %1660, %1655
  br label %1664

; <label>:1664                                    ; preds = %1663, %1652
  br label %1690

; <label>:1665                                    ; preds = %1641
  %1666 = add nsw i32 %wr.0, %wq.0
  %1667 = add nsw i32 %br.0, %bq.0
  %1668 = sub nsw i32 %1666, %1667
  %1669 = call i32 @abs(i32 %1668) #6
  %1670 = icmp eq i32 %1669, 2
  br i1 %1670, label %1671, label %1689

; <label>:1671                                    ; preds = %1665
  %1672 = add nsw i32 %wb.0, %wn.0
  %1673 = add nsw i32 %bb.0, %bn.0
  %1674 = add nsw i32 %1673, 2
  %1675 = icmp sgt i32 %1672, %1674
  br i1 %1675, label %1676, label %1679

; <label>:1676                                    ; preds = %1671
  %1677 = load i32* %score, align 4
  %1678 = add nsw i32 %1677, 120
  store i32 %1678, i32* %score, align 4
  br label %1688

; <label>:1679                                    ; preds = %1671
  %1680 = add nsw i32 %bb.0, %bn.0
  %1681 = add nsw i32 %wb.0, %wn.0
  %1682 = add nsw i32 %1681, 2
  %1683 = icmp sgt i32 %1680, %1682
  br i1 %1683, label %1684, label %1687

; <label>:1684                                    ; preds = %1679
  %1685 = load i32* %score, align 4
  %1686 = sub nsw i32 %1685, 120
  store i32 %1686, i32* %score, align 4
  br label %1687

; <label>:1687                                    ; preds = %1684, %1679
  br label %1688

; <label>:1688                                    ; preds = %1687, %1676
  br label %1689

; <label>:1689                                    ; preds = %1688, %1665
  br label %1690

; <label>:1690                                    ; preds = %1689, %1664
  br label %1691

; <label>:1691                                    ; preds = %1690, %1640
  br label %1713

; <label>:1692                                    ; preds = %1622
  %1693 = add nsw i32 %wq.0, %wr.0
  %1694 = add nsw i32 %bq.0, %br.0
  %1695 = icmp eq i32 %1693, %1694
  br i1 %1695, label %1696, label %1712

; <label>:1696                                    ; preds = %1692
  %1697 = icmp ne i32 %wq.0, 0
  br i1 %1697, label %1698, label %1703

; <label>:1698                                    ; preds = %1696
  %1699 = icmp ne i32 %bq.0, 0
  br i1 %1699, label %1703, label %1700

; <label>:1700                                    ; preds = %1698
  %1701 = load i32* %score, align 4
  %1702 = add nsw i32 %1701, 120
  store i32 %1702, i32* %score, align 4
  br label %1711

; <label>:1703                                    ; preds = %1698, %1696
  %1704 = icmp ne i32 %wq.0, 0
  br i1 %1704, label %1710, label %1705

; <label>:1705                                    ; preds = %1703
  %1706 = icmp ne i32 %bq.0, 0
  br i1 %1706, label %1707, label %1710

; <label>:1707                                    ; preds = %1705
  %1708 = load i32* %score, align 4
  %1709 = sub nsw i32 %1708, 120
  store i32 %1709, i32* %score, align 4
  br label %1710

; <label>:1710                                    ; preds = %1707, %1705, %1703
  br label %1711

; <label>:1711                                    ; preds = %1710, %1700
  br label %1712

; <label>:1712                                    ; preds = %1711, %1692
  br label %1713

; <label>:1713                                    ; preds = %1712, %1691
  br label %1714

; <label>:1714                                    ; preds = %1713, %1621
  %1715 = load i32* %score, align 4
  call void @storeECache(i32 %1715)
  %1716 = load i32* @Material, align 4
  %1717 = load i32* %score, align 4
  %1718 = sub nsw i32 %1716, %1717
  %1719 = call i32 @abs(i32 %1718) #6
  %1720 = load i32* @maxposdiff, align 4
  %1721 = icmp sgt i32 %1719, %1720
  br i1 %1721, label %1722, label %1736

; <label>:1722                                    ; preds = %1714
  %1723 = load i32* @Material, align 4
  %1724 = load i32* %score, align 4
  %1725 = sub nsw i32 %1723, %1724
  %1726 = call i32 @abs(i32 %1725) #6
  %1727 = icmp slt i32 1000, %1726
  br i1 %1727, label %1728, label %1729

; <label>:1728                                    ; preds = %1722
  br label %1734

; <label>:1729                                    ; preds = %1722
  %1730 = load i32* @Material, align 4
  %1731 = load i32* %score, align 4
  %1732 = sub nsw i32 %1730, %1731
  %1733 = call i32 @abs(i32 %1732) #6
  br label %1734

; <label>:1734                                    ; preds = %1729, %1728
  %1735 = phi i32 [ 1000, %1728 ], [ %1733, %1729 ]
  store i32 %1735, i32* @maxposdiff, align 4
  br label %1736

; <label>:1736                                    ; preds = %1734, %1714
  %1737 = load i32* @white_to_move, align 4
  %1738 = icmp eq i32 %1737, 1
  br i1 %1738, label %1739, label %1741

; <label>:1739                                    ; preds = %1736
  %1740 = load i32* %score, align 4
  br label %1744

; <label>:1741                                    ; preds = %1736
  %1742 = load i32* %score, align 4
  %1743 = sub nsw i32 0, %1742
  br label %1744

; <label>:1744                                    ; preds = %1741, %1739, %58, %56, %46, %21
  %.0 = phi i32 [ %24, %21 ], [ %49, %46 ], [ %57, %56 ], [ %60, %58 ], [ %1740, %1739 ], [ %1743, %1741 ]
  ret i32 %.0
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
