; ModuleID = 'neval-dbg.ll'
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
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !84, metadata !85), !dbg !86
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !87, metadata !85), !dbg !88
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !89, metadata !85), !dbg !90
  br label %1, !dbg !91

; <label>:1                                       ; preds = %35, %0
  %a.0 = phi i32 [ 1, %0 ], [ %a.1, %35 ]
  %j.0 = phi i32 [ 1, %0 ], [ %36, %35 ]
  %xnum_pieces.0 = phi i32 [ 0, %0 ], [ %xnum_pieces.2, %35 ]
  %2 = load i32* @piece_count, align 4, !dbg !93
  %3 = icmp sle i32 %a.0, %2, !dbg !95
  br i1 %3, label %4, label %37, !dbg !96

; <label>:4                                       ; preds = %1
  %5 = sext i32 %j.0 to i64, !dbg !97
  %6 = getelementptr inbounds [62 x i32]* @pieces, i32 0, i64 %5, !dbg !97
  %7 = load i32* %6, align 4, !dbg !97
  call void @llvm.dbg.value(metadata i32 %7, i64 0, metadata !99, metadata !85), !dbg !100
  %8 = icmp ne i32 %7, 0, !dbg !101
  br i1 %8, label %10, label %9, !dbg !101

; <label>:9                                       ; preds = %4
  br label %35, !dbg !102

; <label>:10                                      ; preds = %4
  %11 = add nsw i32 %a.0, 1, !dbg !104
  call void @llvm.dbg.value(metadata i32 %11, i64 0, metadata !89, metadata !85), !dbg !90
  br label %12

; <label>:12                                      ; preds = %10
  %13 = sext i32 %7 to i64, !dbg !105
  %14 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %13, !dbg !105
  %15 = load i32* %14, align 4, !dbg !105
  %16 = icmp ne i32 %15, 1, !dbg !105
  br i1 %16, label %17, label %34, !dbg !107

; <label>:17                                      ; preds = %12
  %18 = sext i32 %7 to i64, !dbg !108
  %19 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %18, !dbg !108
  %20 = load i32* %19, align 4, !dbg !108
  %21 = icmp ne i32 %20, 2, !dbg !108
  br i1 %21, label %22, label %34, !dbg !107

; <label>:22                                      ; preds = %17
  %23 = sext i32 %7 to i64, !dbg !109
  %24 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %23, !dbg !109
  %25 = load i32* %24, align 4, !dbg !109
  %26 = icmp ne i32 %25, 13, !dbg !109
  br i1 %26, label %27, label %34, !dbg !107

; <label>:27                                      ; preds = %22
  %28 = sext i32 %7 to i64, !dbg !110
  %29 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %28, !dbg !110
  %30 = load i32* %29, align 4, !dbg !110
  %31 = icmp ne i32 %30, 0, !dbg !110
  br i1 %31, label %32, label %34, !dbg !107

; <label>:32                                      ; preds = %27
  %33 = add nsw i32 %xnum_pieces.0, 1, !dbg !111
  call void @llvm.dbg.value(metadata i32 %33, i64 0, metadata !84, metadata !85), !dbg !86
  br label %34, !dbg !113

; <label>:34                                      ; preds = %32, %27, %22, %17, %12
  %xnum_pieces.1 = phi i32 [ %33, %32 ], [ %xnum_pieces.0, %27 ], [ %xnum_pieces.0, %22 ], [ %xnum_pieces.0, %17 ], [ %xnum_pieces.0, %12 ]
  br label %35, !dbg !114

; <label>:35                                      ; preds = %34, %9
  %a.1 = phi i32 [ %11, %34 ], [ %a.0, %9 ]
  %xnum_pieces.2 = phi i32 [ %xnum_pieces.1, %34 ], [ %xnum_pieces.0, %9 ]
  %36 = add nsw i32 %j.0, 1, !dbg !115
  call void @llvm.dbg.value(metadata i32 %36, i64 0, metadata !87, metadata !85), !dbg !88
  br label %1, !dbg !116

; <label>:37                                      ; preds = %1
  %38 = icmp sge i32 %xnum_pieces.0, 12, !dbg !117
  br i1 %38, label %39, label %52, !dbg !119

; <label>:39                                      ; preds = %37
  %40 = load i32* @white_castled, align 4, !dbg !120
  %41 = icmp ne i32 %40, 0, !dbg !119
  br i1 %41, label %42, label %45, !dbg !119

; <label>:42                                      ; preds = %39
  %43 = load i32* @black_castled, align 4, !dbg !121
  %44 = icmp ne i32 %43, 0, !dbg !119
  br i1 %44, label %52, label %45, !dbg !119

; <label>:45                                      ; preds = %42, %39
  %46 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 30), align 4, !dbg !122
  %47 = icmp eq i32 %46, 5, !dbg !122
  br i1 %47, label %51, label %48, !dbg !119

; <label>:48                                      ; preds = %45
  %49 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 114), align 4, !dbg !123
  %50 = icmp eq i32 %49, 6, !dbg !123
  br i1 %50, label %51, label %52, !dbg !119

; <label>:51                                      ; preds = %48, %45
  store i32 0, i32* @phase, align 4, !dbg !124
  br label %57, !dbg !126

; <label>:52                                      ; preds = %48, %42, %37
  %53 = icmp sle i32 %xnum_pieces.0, 6, !dbg !127
  br i1 %53, label %54, label %55, !dbg !129

; <label>:54                                      ; preds = %52
  store i32 2, i32* @phase, align 4, !dbg !130
  br label %56, !dbg !132

; <label>:55                                      ; preds = %52
  store i32 1, i32* @phase, align 4, !dbg !133
  br label %56

; <label>:56                                      ; preds = %55, %54
  br label %57

; <label>:57                                      ; preds = %56, %51
  ret void, !dbg !134
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @King(i32 %sq, i32 %c) #0 {
  call void @llvm.dbg.value(metadata i32 %sq, i64 0, metadata !135, metadata !85), !dbg !136
  call void @llvm.dbg.value(metadata i32 %c, i64 0, metadata !137, metadata !85), !dbg !138
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !139, metadata !85), !dbg !140
  %1 = sext i32 %sq to i64, !dbg !141
  %2 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1, !dbg !141
  %3 = load i32* %2, align 4, !dbg !141
  %4 = icmp sge i32 %3, 6, !dbg !141
  br i1 %4, label %5, label %23, !dbg !143

; <label>:5                                       ; preds = %0
  %6 = sub nsw i32 %sq, 1, !dbg !144
  %7 = sext i32 %6 to i64, !dbg !144
  %8 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %7, !dbg !144
  %9 = load i32* %8, align 4, !dbg !144
  %10 = add nsw i32 %9, 1, !dbg !144
  %11 = ashr i32 %10, 1, !dbg !144
  %12 = icmp eq i32 %11, 4, !dbg !144
  br i1 %12, label %13, label %23, !dbg !143

; <label>:13                                      ; preds = %5
  %14 = sub nsw i32 %sq, 1, !dbg !145
  %15 = sext i32 %14 to i64, !dbg !145
  %16 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %15, !dbg !145
  %17 = load i32* %16, align 4, !dbg !145
  %18 = add nsw i32 %17, 1, !dbg !145
  %19 = and i32 %18, 1, !dbg !145
  %20 = icmp eq i32 %19, %c, !dbg !145
  br i1 %20, label %21, label %23, !dbg !143

; <label>:21                                      ; preds = %13
  %22 = add nsw i32 0, 2, !dbg !146
  call void @llvm.dbg.value(metadata i32 %22, i64 0, metadata !139, metadata !85), !dbg !140
  br label %23, !dbg !148

; <label>:23                                      ; preds = %21, %13, %5, %0
  %s.0 = phi i32 [ %22, %21 ], [ 0, %13 ], [ 0, %5 ], [ 0, %0 ]
  %24 = sext i32 %sq to i64, !dbg !149
  %25 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %24, !dbg !149
  %26 = load i32* %25, align 4, !dbg !149
  %27 = icmp sge i32 %26, 6, !dbg !149
  br i1 %27, label %28, label %46, !dbg !151

; <label>:28                                      ; preds = %23
  %29 = add nsw i32 %sq, 1, !dbg !152
  %30 = sext i32 %29 to i64, !dbg !152
  %31 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %30, !dbg !152
  %32 = load i32* %31, align 4, !dbg !152
  %33 = add nsw i32 %32, 1, !dbg !152
  %34 = ashr i32 %33, 1, !dbg !152
  %35 = icmp eq i32 %34, 4, !dbg !152
  br i1 %35, label %36, label %46, !dbg !151

; <label>:36                                      ; preds = %28
  %37 = add nsw i32 %sq, 1, !dbg !153
  %38 = sext i32 %37 to i64, !dbg !153
  %39 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %38, !dbg !153
  %40 = load i32* %39, align 4, !dbg !153
  %41 = add nsw i32 %40, 1, !dbg !153
  %42 = and i32 %41, 1, !dbg !153
  %43 = icmp eq i32 %42, %c, !dbg !153
  br i1 %43, label %44, label %46, !dbg !151

; <label>:44                                      ; preds = %36
  %45 = add nsw i32 %s.0, 2, !dbg !154
  call void @llvm.dbg.value(metadata i32 %45, i64 0, metadata !139, metadata !85), !dbg !140
  br label %46, !dbg !156

; <label>:46                                      ; preds = %44, %36, %28, %23
  %s.1 = phi i32 [ %45, %44 ], [ %s.0, %36 ], [ %s.0, %28 ], [ %s.0, %23 ]
  %47 = icmp eq i32 %c, 1, !dbg !157
  br i1 %47, label %48, label %50, !dbg !159

; <label>:48                                      ; preds = %46
  %49 = sub nsw i32 0, %s.1, !dbg !160
  call void @llvm.dbg.value(metadata i32 %49, i64 0, metadata !139, metadata !85), !dbg !140
  br label %50, !dbg !161

; <label>:50                                      ; preds = %48, %46
  %s.2 = phi i32 [ %49, %48 ], [ %s.1, %46 ]
  ret i32 %s.2, !dbg !162
}

; Function Attrs: nounwind uwtable
define i32 @Queen(i32 %sq, i32 %c) #0 {
  call void @llvm.dbg.value(metadata i32 %sq, i64 0, metadata !163, metadata !85), !dbg !164
  call void @llvm.dbg.value(metadata i32 %c, i64 0, metadata !165, metadata !85), !dbg !166
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !167, metadata !85), !dbg !168
  %1 = xor i32 %c, 1, !dbg !169
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !170, metadata !85), !dbg !171
  %2 = add nsw i32 0, 900, !dbg !172
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !167, metadata !85), !dbg !168
  %3 = sext i32 %1 to i64, !dbg !173
  %4 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %3, !dbg !173
  %5 = load i32* %4, align 4, !dbg !173
  %6 = sext i32 %5 to i64, !dbg !174
  %7 = sext i32 %sq to i64, !dbg !174
  %8 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %7, !dbg !174
  %9 = getelementptr inbounds [144 x i32]* %8, i32 0, i64 %6, !dbg !174
  %10 = load i32* %9, align 4, !dbg !174
  %11 = sext i32 %10 to i64, !dbg !175
  %12 = getelementptr inbounds [8 x i32]* @std_q_tropism, i32 0, i64 %11, !dbg !175
  %13 = load i32* %12, align 4, !dbg !175
  %14 = add nsw i32 %2, %13, !dbg !176
  call void @llvm.dbg.value(metadata i32 %14, i64 0, metadata !167, metadata !85), !dbg !168
  %15 = call i32 @rook_mobility(i32 %sq), !dbg !177
  %16 = shl i32 %15, 1, !dbg !177
  call void @llvm.dbg.value(metadata i32 %16, i64 0, metadata !178, metadata !85), !dbg !179
  %17 = call i32 @bishop_mobility(i32 %sq), !dbg !180
  %18 = shl i32 %17, 1, !dbg !180
  %19 = add nsw i32 %16, %18, !dbg !181
  call void @llvm.dbg.value(metadata i32 %19, i64 0, metadata !178, metadata !85), !dbg !179
  %20 = icmp sle i32 %19, 4, !dbg !182
  br i1 %20, label %21, label %33, !dbg !184

; <label>:21                                      ; preds = %0
  %22 = icmp eq i32 %19, 0, !dbg !185
  br i1 %22, label %23, label %25, !dbg !188

; <label>:23                                      ; preds = %21
  %24 = sub nsw i32 %19, 15, !dbg !189
  call void @llvm.dbg.value(metadata i32 %24, i64 0, metadata !178, metadata !85), !dbg !179
  br label %32, !dbg !189

; <label>:25                                      ; preds = %21
  %26 = icmp eq i32 %19, 2, !dbg !190
  br i1 %26, label %27, label %29, !dbg !192

; <label>:27                                      ; preds = %25
  %28 = sub nsw i32 %19, 10, !dbg !193
  call void @llvm.dbg.value(metadata i32 %28, i64 0, metadata !178, metadata !85), !dbg !179
  br label %31, !dbg !193

; <label>:29                                      ; preds = %25
  %30 = sub nsw i32 %19, 5, !dbg !194
  call void @llvm.dbg.value(metadata i32 %30, i64 0, metadata !178, metadata !85), !dbg !179
  br label %31

; <label>:31                                      ; preds = %29, %27
  %mob.0 = phi i32 [ %28, %27 ], [ %30, %29 ]
  br label %32

; <label>:32                                      ; preds = %31, %23
  %mob.1 = phi i32 [ %24, %23 ], [ %mob.0, %31 ]
  br label %33, !dbg !195

; <label>:33                                      ; preds = %32, %0
  %mob.2 = phi i32 [ %mob.1, %32 ], [ %19, %0 ]
  %34 = add nsw i32 %14, %mob.2, !dbg !196
  call void @llvm.dbg.value(metadata i32 %34, i64 0, metadata !167, metadata !85), !dbg !168
  %35 = icmp eq i32 %c, 1, !dbg !197
  br i1 %35, label %36, label %38, !dbg !199

; <label>:36                                      ; preds = %33
  %37 = sub nsw i32 0, %34, !dbg !200
  call void @llvm.dbg.value(metadata i32 %37, i64 0, metadata !167, metadata !85), !dbg !168
  br label %38, !dbg !201

; <label>:38                                      ; preds = %36, %33
  %s.0 = phi i32 [ %37, %36 ], [ %34, %33 ]
  ret i32 %s.0, !dbg !202
}

; Function Attrs: nounwind uwtable
define internal i32 @rook_mobility(i32 %square) #0 {
  call void @llvm.dbg.value(metadata i32 %square, i64 0, metadata !203, metadata !85), !dbg !204
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !205, metadata !85), !dbg !206
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !207, metadata !85), !dbg !208
  br label %1, !dbg !209

; <label>:1                                       ; preds = %21, %0
  %m.0 = phi i32 [ 0, %0 ], [ %m.1, %21 ]
  %diridx.0 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %2 = icmp slt i32 %diridx.0, 4, !dbg !211
  br i1 %2, label %3, label %23, !dbg !215

; <label>:3                                       ; preds = %1
  %4 = sext i32 %diridx.0 to i64, !dbg !216
  %5 = getelementptr inbounds [4 x i32]* @rook_mobility.dir, i32 0, i64 %4, !dbg !216
  %6 = load i32* %5, align 4, !dbg !216
  %7 = add nsw i32 %square, %6, !dbg !219
  call void @llvm.dbg.value(metadata i32 %7, i64 0, metadata !220, metadata !85), !dbg !221
  br label %8, !dbg !222

; <label>:8                                       ; preds = %15, %3
  %m.1 = phi i32 [ %m.0, %3 ], [ %14, %15 ]
  %l.0 = phi i32 [ %7, %3 ], [ %19, %15 ]
  %9 = sext i32 %l.0 to i64, !dbg !223
  %10 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %9, !dbg !223
  %11 = load i32* %10, align 4, !dbg !223
  %12 = icmp eq i32 %11, 13, !dbg !223
  br i1 %12, label %13, label %20, !dbg !225

; <label>:13                                      ; preds = %8
  %14 = add nsw i32 %m.1, 1, !dbg !226
  call void @llvm.dbg.value(metadata i32 %14, i64 0, metadata !205, metadata !85), !dbg !206
  br label %15, !dbg !226

; <label>:15                                      ; preds = %13
  %16 = sext i32 %diridx.0 to i64, !dbg !227
  %17 = getelementptr inbounds [4 x i32]* @rook_mobility.dir, i32 0, i64 %16, !dbg !227
  %18 = load i32* %17, align 4, !dbg !227
  %19 = add nsw i32 %l.0, %18, !dbg !228
  call void @llvm.dbg.value(metadata i32 %19, i64 0, metadata !220, metadata !85), !dbg !221
  br label %8, !dbg !229

; <label>:20                                      ; preds = %8
  br label %21, !dbg !230

; <label>:21                                      ; preds = %20
  %22 = add nsw i32 %diridx.0, 1, !dbg !231
  call void @llvm.dbg.value(metadata i32 %22, i64 0, metadata !207, metadata !85), !dbg !208
  br label %1, !dbg !232

; <label>:23                                      ; preds = %1
  ret i32 %m.0, !dbg !233
}

; Function Attrs: nounwind uwtable
define internal i32 @bishop_mobility(i32 %square) #0 {
  call void @llvm.dbg.value(metadata i32 %square, i64 0, metadata !234, metadata !85), !dbg !235
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !236, metadata !85), !dbg !237
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !238, metadata !85), !dbg !239
  br label %1, !dbg !240

; <label>:1                                       ; preds = %21, %0
  %m.0 = phi i32 [ 0, %0 ], [ %m.1, %21 ]
  %diridx.0 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %2 = icmp slt i32 %diridx.0, 4, !dbg !242
  br i1 %2, label %3, label %23, !dbg !246

; <label>:3                                       ; preds = %1
  %4 = sext i32 %diridx.0 to i64, !dbg !247
  %5 = getelementptr inbounds [4 x i32]* @bishop_mobility.dir, i32 0, i64 %4, !dbg !247
  %6 = load i32* %5, align 4, !dbg !247
  %7 = add nsw i32 %square, %6, !dbg !250
  call void @llvm.dbg.value(metadata i32 %7, i64 0, metadata !251, metadata !85), !dbg !252
  br label %8, !dbg !253

; <label>:8                                       ; preds = %15, %3
  %m.1 = phi i32 [ %m.0, %3 ], [ %14, %15 ]
  %l.0 = phi i32 [ %7, %3 ], [ %19, %15 ]
  %9 = sext i32 %l.0 to i64, !dbg !254
  %10 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %9, !dbg !254
  %11 = load i32* %10, align 4, !dbg !254
  %12 = icmp eq i32 %11, 13, !dbg !254
  br i1 %12, label %13, label %20, !dbg !256

; <label>:13                                      ; preds = %8
  %14 = add nsw i32 %m.1, 1, !dbg !257
  call void @llvm.dbg.value(metadata i32 %14, i64 0, metadata !236, metadata !85), !dbg !237
  br label %15, !dbg !257

; <label>:15                                      ; preds = %13
  %16 = sext i32 %diridx.0 to i64, !dbg !258
  %17 = getelementptr inbounds [4 x i32]* @bishop_mobility.dir, i32 0, i64 %16, !dbg !258
  %18 = load i32* %17, align 4, !dbg !258
  %19 = add nsw i32 %l.0, %18, !dbg !259
  call void @llvm.dbg.value(metadata i32 %19, i64 0, metadata !251, metadata !85), !dbg !252
  br label %8, !dbg !260

; <label>:20                                      ; preds = %8
  br label %21, !dbg !261

; <label>:21                                      ; preds = %20
  %22 = add nsw i32 %diridx.0, 1, !dbg !262
  call void @llvm.dbg.value(metadata i32 %22, i64 0, metadata !238, metadata !85), !dbg !239
  br label %1, !dbg !263

; <label>:23                                      ; preds = %1
  ret i32 %m.0, !dbg !264
}

; Function Attrs: nounwind uwtable
define i32 @Rook(i32 %sq, i32 %c) #0 {
  call void @llvm.dbg.value(metadata i32 %sq, i64 0, metadata !265, metadata !85), !dbg !266
  call void @llvm.dbg.value(metadata i32 %c, i64 0, metadata !267, metadata !85), !dbg !268
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !269, metadata !85), !dbg !270
  %1 = xor i32 %c, 1, !dbg !271
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !272, metadata !85), !dbg !273
  %2 = add nsw i32 0, 500, !dbg !274
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !269, metadata !85), !dbg !270
  %3 = sext i32 %1 to i64, !dbg !275
  %4 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %3, !dbg !275
  %5 = load i32* %4, align 4, !dbg !275
  %6 = sext i32 %5 to i64, !dbg !276
  %7 = sext i32 %sq to i64, !dbg !276
  %8 = getelementptr inbounds [144 x [144 x i32]]* @rookdistance, i32 0, i64 %7, !dbg !276
  %9 = getelementptr inbounds [144 x i32]* %8, i32 0, i64 %6, !dbg !276
  %10 = load i32* %9, align 4, !dbg !276
  %11 = sext i32 %10 to i64, !dbg !277
  %12 = getelementptr inbounds [16 x i32]* @std_r_tropism, i32 0, i64 %11, !dbg !277
  %13 = load i32* %12, align 4, !dbg !277
  %14 = add nsw i32 %2, %13, !dbg !278
  call void @llvm.dbg.value(metadata i32 %14, i64 0, metadata !269, metadata !85), !dbg !270
  %15 = call i32 @rook_mobility(i32 %sq), !dbg !279
  %16 = shl i32 %15, 1, !dbg !279
  call void @llvm.dbg.value(metadata i32 %16, i64 0, metadata !280, metadata !85), !dbg !281
  %17 = icmp sle i32 %16, 2, !dbg !282
  br i1 %17, label %18, label %20, !dbg !284

; <label>:18                                      ; preds = %0
  %19 = sub nsw i32 %16, 5, !dbg !285
  call void @llvm.dbg.value(metadata i32 %19, i64 0, metadata !280, metadata !85), !dbg !281
  br label %20, !dbg !285

; <label>:20                                      ; preds = %18, %0
  %mob.0 = phi i32 [ %19, %18 ], [ %16, %0 ]
  %21 = add nsw i32 %14, %mob.0, !dbg !287
  call void @llvm.dbg.value(metadata i32 %21, i64 0, metadata !269, metadata !85), !dbg !270
  %22 = sub nsw i32 %sq, 1, !dbg !288
  %23 = sext i32 %22 to i64, !dbg !290
  %24 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %23, !dbg !290
  %25 = load i32* %24, align 4, !dbg !290
  %26 = icmp ne i32 %25, 13, !dbg !290
  br i1 %26, label %27, label %35, !dbg !291

; <label>:27                                      ; preds = %20
  %28 = add nsw i32 %sq, 1, !dbg !292
  %29 = sext i32 %28 to i64, !dbg !294
  %30 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %29, !dbg !294
  %31 = load i32* %30, align 4, !dbg !294
  %32 = icmp ne i32 %31, 13, !dbg !294
  br i1 %32, label %33, label %35, !dbg !291

; <label>:33                                      ; preds = %27
  %34 = sub nsw i32 %21, 5, !dbg !295
  call void @llvm.dbg.value(metadata i32 %34, i64 0, metadata !269, metadata !85), !dbg !270
  br label %35, !dbg !297

; <label>:35                                      ; preds = %33, %27, %20
  %s.0 = phi i32 [ %34, %33 ], [ %21, %27 ], [ %21, %20 ]
  %36 = load i32* @wmat, align 4, !dbg !298
  %37 = icmp ne i32 %36, 1300, !dbg !298
  br i1 %37, label %41, label %38, !dbg !300

; <label>:38                                      ; preds = %35
  %39 = load i32* @bmat, align 4, !dbg !301
  %40 = icmp ne i32 %39, 1300, !dbg !301
  br i1 %40, label %41, label %81, !dbg !300

; <label>:41                                      ; preds = %38, %35
  %42 = sext i32 %c to i64, !dbg !303
  %43 = getelementptr inbounds [2 x i32]* @Rook.square_d1, i32 0, i64 %42, !dbg !303
  %44 = load i32* %43, align 4, !dbg !303
  %45 = icmp eq i32 %sq, %44, !dbg !306
  br i1 %45, label %46, label %72, !dbg !307

; <label>:46                                      ; preds = %41
  %47 = add nsw i32 %s.0, 10, !dbg !308
  call void @llvm.dbg.value(metadata i32 %47, i64 0, metadata !269, metadata !85), !dbg !270
  %48 = sext i32 %c to i64, !dbg !310
  %49 = getelementptr inbounds [2 x i32]* @Rook.square_d1, i32 0, i64 %48, !dbg !310
  %50 = load i32* %49, align 4, !dbg !310
  %51 = add nsw i32 %50, 1, !dbg !310
  %52 = sext i32 %51 to i64, !dbg !310
  %53 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %52, !dbg !310
  %54 = load i32* %53, align 4, !dbg !310
  %55 = add nsw i32 %54, 1, !dbg !310
  %56 = ashr i32 %55, 1, !dbg !310
  %57 = icmp eq i32 %56, 4, !dbg !310
  br i1 %57, label %58, label %71, !dbg !312

; <label>:58                                      ; preds = %46
  %59 = sext i32 %c to i64, !dbg !313
  %60 = getelementptr inbounds [2 x i32]* @Rook.square_d1, i32 0, i64 %59, !dbg !313
  %61 = load i32* %60, align 4, !dbg !313
  %62 = add nsw i32 %61, 1, !dbg !313
  %63 = sext i32 %62 to i64, !dbg !313
  %64 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %63, !dbg !313
  %65 = load i32* %64, align 4, !dbg !313
  %66 = add nsw i32 %65, 1, !dbg !313
  %67 = and i32 %66, 1, !dbg !313
  %68 = icmp eq i32 %67, %c, !dbg !313
  br i1 %68, label %69, label %71, !dbg !312

; <label>:69                                      ; preds = %58
  %70 = add nsw i32 %47, 5, !dbg !314
  call void @llvm.dbg.value(metadata i32 %70, i64 0, metadata !269, metadata !85), !dbg !270
  br label %71, !dbg !316

; <label>:71                                      ; preds = %69, %58, %46
  %s.1 = phi i32 [ %70, %69 ], [ %47, %58 ], [ %47, %46 ]
  br label %72, !dbg !317

; <label>:72                                      ; preds = %71, %41
  %s.2 = phi i32 [ %s.1, %71 ], [ %s.0, %41 ]
  %73 = sext i32 %c to i64, !dbg !318
  %74 = getelementptr inbounds [2 x i32]* @Rook.square_d1, i32 0, i64 %73, !dbg !318
  %75 = load i32* %74, align 4, !dbg !318
  %76 = add nsw i32 %75, 1, !dbg !318
  %77 = icmp eq i32 %sq, %76, !dbg !320
  br i1 %77, label %78, label %80, !dbg !321

; <label>:78                                      ; preds = %72
  %79 = add nsw i32 %s.2, 10, !dbg !322
  call void @llvm.dbg.value(metadata i32 %79, i64 0, metadata !269, metadata !85), !dbg !270
  br label %80, !dbg !324

; <label>:80                                      ; preds = %78, %72
  %s.3 = phi i32 [ %79, %78 ], [ %s.2, %72 ]
  br label %81, !dbg !325

; <label>:81                                      ; preds = %80, %38
  %s.4 = phi i32 [ %s.3, %80 ], [ %s.0, %38 ]
  %82 = icmp eq i32 %c, 1, !dbg !326
  br i1 %82, label %83, label %85, !dbg !328

; <label>:83                                      ; preds = %81
  %84 = sub nsw i32 0, %s.4, !dbg !329
  call void @llvm.dbg.value(metadata i32 %84, i64 0, metadata !269, metadata !85), !dbg !270
  br label %85, !dbg !330

; <label>:85                                      ; preds = %83, %81
  %s.5 = phi i32 [ %84, %83 ], [ %s.4, %81 ]
  ret i32 %s.5, !dbg !331
}

; Function Attrs: nounwind uwtable
define i32 @Bishop(i32 %sq, i32 %c) #0 {
  call void @llvm.dbg.value(metadata i32 %sq, i64 0, metadata !332, metadata !85), !dbg !333
  call void @llvm.dbg.value(metadata i32 %c, i64 0, metadata !334, metadata !85), !dbg !335
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !336, metadata !85), !dbg !337
  %1 = xor i32 %c, 1, !dbg !338
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !339, metadata !85), !dbg !340
  %2 = add nsw i32 0, 325, !dbg !341
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !336, metadata !85), !dbg !337
  %3 = sext i32 %sq to i64, !dbg !342
  %4 = getelementptr inbounds [144 x i32]* @sbishop, i32 0, i64 %3, !dbg !342
  %5 = load i32* %4, align 4, !dbg !342
  %6 = add nsw i32 %2, %5, !dbg !343
  call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !336, metadata !85), !dbg !337
  %7 = sext i32 %1 to i64, !dbg !344
  %8 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %7, !dbg !344
  %9 = load i32* %8, align 4, !dbg !344
  %10 = sext i32 %9 to i64, !dbg !345
  %11 = sext i32 %sq to i64, !dbg !345
  %12 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %11, !dbg !345
  %13 = getelementptr inbounds [144 x i32]* %12, i32 0, i64 %10, !dbg !345
  %14 = load i32* %13, align 4, !dbg !345
  %15 = sext i32 %14 to i64, !dbg !346
  %16 = getelementptr inbounds [8 x i32]* @std_b_tropism, i32 0, i64 %15, !dbg !346
  %17 = load i32* %16, align 4, !dbg !346
  %18 = add nsw i32 %6, %17, !dbg !347
  call void @llvm.dbg.value(metadata i32 %18, i64 0, metadata !336, metadata !85), !dbg !337
  %19 = call i32 @bishop_mobility(i32 %sq), !dbg !348
  %20 = shl i32 %19, 1, !dbg !348
  call void @llvm.dbg.value(metadata i32 %20, i64 0, metadata !349, metadata !85), !dbg !350
  %21 = icmp sle i32 %20, 2, !dbg !351
  br i1 %21, label %22, label %24, !dbg !353

; <label>:22                                      ; preds = %0
  %23 = sub nsw i32 %20, 5, !dbg !354
  call void @llvm.dbg.value(metadata i32 %23, i64 0, metadata !349, metadata !85), !dbg !350
  br label %24, !dbg !354

; <label>:24                                      ; preds = %22, %0
  %mob.0 = phi i32 [ %23, %22 ], [ %20, %0 ]
  %25 = add nsw i32 %18, %mob.0, !dbg !356
  call void @llvm.dbg.value(metadata i32 %25, i64 0, metadata !336, metadata !85), !dbg !337
  %26 = icmp eq i32 %c, 0, !dbg !357
  br i1 %26, label %27, label %32, !dbg !359

; <label>:27                                      ; preds = %24
  %28 = icmp eq i32 %sq, 39, !dbg !360
  br i1 %28, label %29, label %32, !dbg !359

; <label>:29                                      ; preds = %27
  %30 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 52), align 4, !dbg !362
  %31 = icmp eq i32 %30, 1, !dbg !362
  br i1 %31, label %39, label %32, !dbg !359

; <label>:32                                      ; preds = %29, %27, %24
  %33 = icmp eq i32 %c, 1, !dbg !364
  br i1 %33, label %34, label %41, !dbg !359

; <label>:34                                      ; preds = %32
  %35 = icmp eq i32 %sq, 99, !dbg !365
  br i1 %35, label %36, label %41, !dbg !359

; <label>:36                                      ; preds = %34
  %37 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 88), align 4, !dbg !366
  %38 = icmp eq i32 %37, 2, !dbg !366
  br i1 %38, label %39, label %41, !dbg !359

; <label>:39                                      ; preds = %36, %29
  %40 = sub nsw i32 %25, 5, !dbg !367
  call void @llvm.dbg.value(metadata i32 %40, i64 0, metadata !336, metadata !85), !dbg !337
  br label %41, !dbg !367

; <label>:41                                      ; preds = %39, %36, %34, %32
  %s.0 = phi i32 [ %40, %39 ], [ %25, %36 ], [ %25, %34 ], [ %25, %32 ]
  %42 = icmp eq i32 %c, 1, !dbg !368
  br i1 %42, label %43, label %45, !dbg !370

; <label>:43                                      ; preds = %41
  %44 = sub nsw i32 0, %s.0, !dbg !371
  call void @llvm.dbg.value(metadata i32 %44, i64 0, metadata !336, metadata !85), !dbg !337
  br label %45, !dbg !372

; <label>:45                                      ; preds = %43, %41
  %s.1 = phi i32 [ %44, %43 ], [ %s.0, %41 ]
  ret i32 %s.1, !dbg !373
}

; Function Attrs: nounwind uwtable
define i32 @Knight(i32 %sq, i32 %c) #0 {
  call void @llvm.dbg.value(metadata i32 %sq, i64 0, metadata !374, metadata !85), !dbg !375
  call void @llvm.dbg.value(metadata i32 %c, i64 0, metadata !376, metadata !85), !dbg !377
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !378, metadata !85), !dbg !379
  %1 = xor i32 %c, 1, !dbg !380
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !381, metadata !85), !dbg !382
  %2 = add nsw i32 0, 310, !dbg !383
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !378, metadata !85), !dbg !379
  %3 = sext i32 %sq to i64, !dbg !384
  %4 = getelementptr inbounds [144 x i32]* @sknight, i32 0, i64 %3, !dbg !384
  %5 = load i32* %4, align 4, !dbg !384
  %6 = add nsw i32 %2, %5, !dbg !385
  call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !378, metadata !85), !dbg !379
  %7 = sext i32 %1 to i64, !dbg !386
  %8 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %7, !dbg !386
  %9 = load i32* %8, align 4, !dbg !386
  %10 = sext i32 %9 to i64, !dbg !387
  %11 = sext i32 %sq to i64, !dbg !387
  %12 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %11, !dbg !387
  %13 = getelementptr inbounds [144 x i32]* %12, i32 0, i64 %10, !dbg !387
  %14 = load i32* %13, align 4, !dbg !387
  %15 = sext i32 %14 to i64, !dbg !388
  %16 = getelementptr inbounds [8 x i32]* @std_n_tropism, i32 0, i64 %15, !dbg !388
  %17 = load i32* %16, align 4, !dbg !388
  %18 = add nsw i32 %6, %17, !dbg !389
  call void @llvm.dbg.value(metadata i32 %18, i64 0, metadata !378, metadata !85), !dbg !379
  %19 = icmp eq i32 %c, 1, !dbg !390
  br i1 %19, label %20, label %22, !dbg !392

; <label>:20                                      ; preds = %0
  %21 = sub nsw i32 0, %18, !dbg !393
  call void @llvm.dbg.value(metadata i32 %21, i64 0, metadata !378, metadata !85), !dbg !379
  br label %22, !dbg !394

; <label>:22                                      ; preds = %20, %0
  %s.0 = phi i32 [ %21, %20 ], [ %18, %0 ]
  ret i32 %s.0, !dbg !395
}

; Function Attrs: nounwind uwtable
define i32 @Pawn(i32 %sq, i32 %c) #0 {
  call void @llvm.dbg.value(metadata i32 %sq, i64 0, metadata !396, metadata !85), !dbg !397
  call void @llvm.dbg.value(metadata i32 %c, i64 0, metadata !398, metadata !85), !dbg !399
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !400, metadata !85), !dbg !401
  %1 = xor i32 %c, 1, !dbg !402
  call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !403, metadata !85), !dbg !404
  %2 = add nsw i32 0, 100, !dbg !405
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !400, metadata !85), !dbg !401
  %3 = sext i32 %1 to i64, !dbg !406
  %4 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %3, !dbg !406
  %5 = load i32* %4, align 4, !dbg !406
  %6 = sext i32 %5 to i64, !dbg !407
  %7 = sext i32 %sq to i64, !dbg !407
  %8 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %7, !dbg !407
  %9 = getelementptr inbounds [144 x i32]* %8, i32 0, i64 %6, !dbg !407
  %10 = load i32* %9, align 4, !dbg !407
  %11 = sext i32 %10 to i64, !dbg !408
  %12 = getelementptr inbounds [8 x i32]* @std_p_tropism, i32 0, i64 %11, !dbg !408
  %13 = load i32* %12, align 4, !dbg !408
  %14 = add nsw i32 %2, %13, !dbg !409
  call void @llvm.dbg.value(metadata i32 %14, i64 0, metadata !400, metadata !85), !dbg !401
  %15 = sext i32 %c to i64, !dbg !410
  %16 = getelementptr inbounds [2 x i32]* @king_locs, i32 0, i64 %15, !dbg !410
  %17 = load i32* %16, align 4, !dbg !410
  %18 = sext i32 %17 to i64, !dbg !411
  %19 = sext i32 %sq to i64, !dbg !411
  %20 = getelementptr inbounds [144 x [144 x i32]]* @distance, i32 0, i64 %19, !dbg !411
  %21 = getelementptr inbounds [144 x i32]* %20, i32 0, i64 %18, !dbg !411
  %22 = load i32* %21, align 4, !dbg !411
  %23 = sext i32 %22 to i64, !dbg !412
  %24 = getelementptr inbounds [8 x i32]* @std_own_p_tropism, i32 0, i64 %23, !dbg !412
  %25 = load i32* %24, align 4, !dbg !412
  %26 = add nsw i32 %14, %25, !dbg !413
  call void @llvm.dbg.value(metadata i32 %26, i64 0, metadata !400, metadata !85), !dbg !401
  %27 = add nsw i32 %sq, 1, !dbg !414
  %28 = sext i32 %27 to i64, !dbg !414
  %29 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %28, !dbg !414
  %30 = load i32* %29, align 4, !dbg !414
  %31 = add nsw i32 %30, 1, !dbg !414
  %32 = ashr i32 %31, 1, !dbg !414
  %33 = icmp eq i32 %32, 1, !dbg !414
  br i1 %33, label %34, label %44, !dbg !416

; <label>:34                                      ; preds = %0
  %35 = add nsw i32 %sq, 1, !dbg !417
  %36 = sext i32 %35 to i64, !dbg !417
  %37 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %36, !dbg !417
  %38 = load i32* %37, align 4, !dbg !417
  %39 = add nsw i32 %38, 1, !dbg !417
  %40 = and i32 %39, 1, !dbg !417
  %41 = icmp eq i32 %40, %c, !dbg !417
  br i1 %41, label %42, label %44, !dbg !416

; <label>:42                                      ; preds = %34
  %43 = add nsw i32 %26, 5, !dbg !418
  call void @llvm.dbg.value(metadata i32 %43, i64 0, metadata !400, metadata !85), !dbg !401
  br label %44, !dbg !418

; <label>:44                                      ; preds = %42, %34, %0
  %s.0 = phi i32 [ %43, %42 ], [ %26, %34 ], [ %26, %0 ]
  %45 = add nsw i32 %sq, 11, !dbg !419
  %46 = sext i32 %45 to i64, !dbg !419
  %47 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %46, !dbg !419
  %48 = load i32* %47, align 4, !dbg !419
  %49 = add nsw i32 %48, 1, !dbg !419
  %50 = ashr i32 %49, 1, !dbg !419
  %51 = icmp eq i32 %50, 1, !dbg !419
  br i1 %51, label %52, label %62, !dbg !421

; <label>:52                                      ; preds = %44
  %53 = add nsw i32 %sq, 11, !dbg !422
  %54 = sext i32 %53 to i64, !dbg !422
  %55 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %54, !dbg !422
  %56 = load i32* %55, align 4, !dbg !422
  %57 = add nsw i32 %56, 1, !dbg !422
  %58 = and i32 %57, 1, !dbg !422
  %59 = icmp eq i32 %58, %c, !dbg !422
  br i1 %59, label %60, label %62, !dbg !421

; <label>:60                                      ; preds = %52
  %61 = add nsw i32 %s.0, 1, !dbg !423
  call void @llvm.dbg.value(metadata i32 %61, i64 0, metadata !400, metadata !85), !dbg !401
  br label %81, !dbg !423

; <label>:62                                      ; preds = %52, %44
  %63 = add nsw i32 %sq, 13, !dbg !424
  %64 = sext i32 %63 to i64, !dbg !424
  %65 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %64, !dbg !424
  %66 = load i32* %65, align 4, !dbg !424
  %67 = add nsw i32 %66, 1, !dbg !424
  %68 = ashr i32 %67, 1, !dbg !424
  %69 = icmp eq i32 %68, 1, !dbg !424
  br i1 %69, label %70, label %80, !dbg !426

; <label>:70                                      ; preds = %62
  %71 = add nsw i32 %sq, 13, !dbg !427
  %72 = sext i32 %71 to i64, !dbg !427
  %73 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %72, !dbg !427
  %74 = load i32* %73, align 4, !dbg !427
  %75 = add nsw i32 %74, 1, !dbg !427
  %76 = and i32 %75, 1, !dbg !427
  %77 = icmp eq i32 %76, %c, !dbg !427
  br i1 %77, label %78, label %80, !dbg !426

; <label>:78                                      ; preds = %70
  %79 = add nsw i32 %s.0, 1, !dbg !428
  call void @llvm.dbg.value(metadata i32 %79, i64 0, metadata !400, metadata !85), !dbg !401
  br label %80, !dbg !428

; <label>:80                                      ; preds = %78, %70, %62
  %s.1 = phi i32 [ %79, %78 ], [ %s.0, %70 ], [ %s.0, %62 ]
  br label %81

; <label>:81                                      ; preds = %80, %60
  %s.2 = phi i32 [ %61, %60 ], [ %s.1, %80 ]
  %82 = icmp eq i32 %c, 1, !dbg !429
  br i1 %82, label %83, label %85, !dbg !431

; <label>:83                                      ; preds = %81
  %84 = sub nsw i32 0, %s.2, !dbg !432
  call void @llvm.dbg.value(metadata i32 %84, i64 0, metadata !400, metadata !85), !dbg !401
  br label %85, !dbg !433

; <label>:85                                      ; preds = %83, %81
  %s.3 = phi i32 [ %84, %83 ], [ %s.2, %81 ]
  ret i32 %s.3, !dbg !434
}

; Function Attrs: nounwind uwtable
define i32 @ErrorIt(i32 %sq, i32 %c) #0 {
  call void @llvm.dbg.value(metadata i32 %sq, i64 0, metadata !435, metadata !85), !dbg !436
  call void @llvm.dbg.value(metadata i32 %c, i64 0, metadata !437, metadata !85), !dbg !438
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str, i32 0, i32 0), i32 %sq, i32 %c), !dbg !439
  ret i32 0, !dbg !440
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @std_eval(i32 %alpha, i32 %beta) #0 {
  %pawns = alloca [2 x [11 x i32]], align 16
  %white_back_pawn = alloca [11 x i32], align 16
  %black_back_pawn = alloca [11 x i32], align 16
  %score = alloca i32, align 4
  %in_cache = alloca i32, align 4
  call void @llvm.dbg.value(metadata i32 %alpha, i64 0, metadata !441, metadata !85), !dbg !442
  call void @llvm.dbg.value(metadata i32 %beta, i64 0, metadata !443, metadata !85), !dbg !444
  call void @llvm.dbg.declare(metadata [2 x [11 x i32]]* %pawns, metadata !445, metadata !85), !dbg !449
  call void @llvm.dbg.declare(metadata [11 x i32]* %white_back_pawn, metadata !450, metadata !85), !dbg !453
  call void @llvm.dbg.declare(metadata [11 x i32]* %black_back_pawn, metadata !454, metadata !85), !dbg !455
  call void @llvm.dbg.declare(metadata i32* %score, metadata !456, metadata !85), !dbg !457
  store i32 0, i32* %score, align 4, !dbg !457
  call void @llvm.dbg.declare(metadata i32* %in_cache, metadata !458, metadata !85), !dbg !459
  %1 = load i32* @white_to_move, align 4, !dbg !460
  %2 = icmp ne i32 %1, 0, !dbg !460
  br i1 %2, label %3, label %5, !dbg !460

; <label>:3                                       ; preds = %0
  %4 = load i32* @Material, align 4, !dbg !462
  br label %8, !dbg !460

; <label>:5                                       ; preds = %0
  %6 = load i32* @Material, align 4, !dbg !464
  %7 = sub nsw i32 0, %6, !dbg !466
  br label %8, !dbg !460

; <label>:8                                       ; preds = %5, %3
  %9 = phi i32 [ %4, %3 ], [ %7, %5 ], !dbg !460
  %10 = load i32* @maxposdiff, align 4, !dbg !467
  %11 = sub nsw i32 %9, %10, !dbg !470
  %12 = icmp sge i32 %11, %beta, !dbg !470
  br i1 %12, label %13, label %25, !dbg !471

; <label>:13                                      ; preds = %8
  %14 = load i32* @white_to_move, align 4, !dbg !472
  %15 = icmp ne i32 %14, 0, !dbg !472
  br i1 %15, label %16, label %18, !dbg !472

; <label>:16                                      ; preds = %13
  %17 = load i32* @Material, align 4, !dbg !473
  br label %21, !dbg !472

; <label>:18                                      ; preds = %13
  %19 = load i32* @Material, align 4, !dbg !474
  %20 = sub nsw i32 0, %19, !dbg !475
  br label %21, !dbg !472

; <label>:21                                      ; preds = %18, %16
  %22 = phi i32 [ %17, %16 ], [ %20, %18 ], !dbg !472
  %23 = load i32* @maxposdiff, align 4, !dbg !476
  %24 = sub nsw i32 %22, %23, !dbg !477
  br label %1744, !dbg !478

; <label>:25                                      ; preds = %8
  %26 = load i32* @white_to_move, align 4, !dbg !479
  %27 = icmp ne i32 %26, 0, !dbg !479
  br i1 %27, label %28, label %30, !dbg !479

; <label>:28                                      ; preds = %25
  %29 = load i32* @Material, align 4, !dbg !481
  br label %33, !dbg !479

; <label>:30                                      ; preds = %25
  %31 = load i32* @Material, align 4, !dbg !483
  %32 = sub nsw i32 0, %31, !dbg !485
  br label %33, !dbg !479

; <label>:33                                      ; preds = %30, %28
  %34 = phi i32 [ %29, %28 ], [ %32, %30 ], !dbg !479
  %35 = load i32* @maxposdiff, align 4, !dbg !486
  %36 = add nsw i32 %34, %35, !dbg !489
  %37 = icmp sle i32 %36, %alpha, !dbg !489
  br i1 %37, label %38, label %50, !dbg !490

; <label>:38                                      ; preds = %33
  %39 = load i32* @white_to_move, align 4, !dbg !491
  %40 = icmp ne i32 %39, 0, !dbg !491
  br i1 %40, label %41, label %43, !dbg !491

; <label>:41                                      ; preds = %38
  %42 = load i32* @Material, align 4, !dbg !492
  br label %46, !dbg !491

; <label>:43                                      ; preds = %38
  %44 = load i32* @Material, align 4, !dbg !493
  %45 = sub nsw i32 0, %44, !dbg !494
  br label %46, !dbg !491

; <label>:46                                      ; preds = %43, %41
  %47 = phi i32 [ %42, %41 ], [ %45, %43 ], !dbg !491
  %48 = load i32* @maxposdiff, align 4, !dbg !495
  %49 = add nsw i32 %47, %48, !dbg !496
  br label %1744, !dbg !497

; <label>:50                                      ; preds = %33
  store i32 0, i32* %in_cache, align 4, !dbg !498
  call void @checkECache(i32* %score, i32* %in_cache), !dbg !499
  %51 = load i32* %in_cache, align 4, !dbg !500
  %52 = icmp ne i32 %51, 0, !dbg !502
  br i1 %52, label %53, label %61, !dbg !502

; <label>:53                                      ; preds = %50
  %54 = load i32* @white_to_move, align 4, !dbg !503
  %55 = icmp eq i32 %54, 1, !dbg !503
  br i1 %55, label %56, label %58, !dbg !506

; <label>:56                                      ; preds = %53
  %57 = load i32* %score, align 4, !dbg !507
  br label %1744, !dbg !509

; <label>:58                                      ; preds = %53
  %59 = load i32* %score, align 4, !dbg !510
  %60 = sub nsw i32 0, %59, !dbg !511
  br label %1744, !dbg !512

; <label>:61                                      ; preds = %50
  %62 = bitcast [2 x [11 x i32]]* %pawns to i8*, !dbg !513
  call void @llvm.memset.p0i8.i64(i8* %62, i8 0, i64 88, i32 16, i1 false), !dbg !513
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !514, metadata !85), !dbg !515
  br label %63, !dbg !516

; <label>:63                                      ; preds = %70, %61
  %i.0 = phi i32 [ 0, %61 ], [ %71, %70 ]
  %64 = icmp slt i32 %i.0, 11, !dbg !518
  br i1 %64, label %65, label %72, !dbg !522

; <label>:65                                      ; preds = %63
  %66 = sext i32 %i.0 to i64, !dbg !523
  %67 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %66, !dbg !523
  store i32 7, i32* %67, align 4, !dbg !523
  %68 = sext i32 %i.0 to i64, !dbg !525
  %69 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %68, !dbg !525
  store i32 2, i32* %69, align 4, !dbg !525
  br label %70, !dbg !526

; <label>:70                                      ; preds = %65
  %71 = add nsw i32 %i.0, 1, !dbg !527
  call void @llvm.dbg.value(metadata i32 %71, i64 0, metadata !514, metadata !85), !dbg !515
  br label %63, !dbg !528

; <label>:72                                      ; preds = %63
  store i32 0, i32* @wmat, align 4, !dbg !529
  store i32 0, i32* @bmat, align 4, !dbg !530
  %73 = load i32* @wking_loc, align 4, !dbg !531
  store i32 %73, i32* getelementptr inbounds ([2 x i32]* @king_locs, i32 0, i64 0), align 4, !dbg !532
  %74 = load i32* @bking_loc, align 4, !dbg !533
  store i32 %74, i32* getelementptr inbounds ([2 x i32]* @king_locs, i32 0, i64 1), align 4, !dbg !534
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !535, metadata !85), !dbg !536
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !537, metadata !85), !dbg !538
  br label %75, !dbg !539

; <label>:75                                      ; preds = %185, %72
  %j.0 = phi i32 [ 1, %72 ], [ %186, %185 ]
  %a.0 = phi i32 [ 1, %72 ], [ %a.1, %185 ]
  %76 = load i32* @piece_count, align 4, !dbg !541
  %77 = icmp sle i32 %a.0, %76, !dbg !543
  br i1 %77, label %78, label %187, !dbg !544

; <label>:78                                      ; preds = %75
  %79 = sext i32 %j.0 to i64, !dbg !545
  %80 = getelementptr inbounds [62 x i32]* @pieces, i32 0, i64 %79, !dbg !545
  %81 = load i32* %80, align 4, !dbg !545
  call void @llvm.dbg.value(metadata i32 %81, i64 0, metadata !514, metadata !85), !dbg !515
  %82 = icmp ne i32 %81, 0, !dbg !547
  br i1 %82, label %84, label %83, !dbg !547

; <label>:83                                      ; preds = %78
  br label %185, !dbg !548

; <label>:84                                      ; preds = %78
  %85 = add nsw i32 %a.0, 1, !dbg !550
  call void @llvm.dbg.value(metadata i32 %85, i64 0, metadata !537, metadata !85), !dbg !538
  br label %86

; <label>:86                                      ; preds = %84
  %87 = icmp sgt i32 %81, 0, !dbg !551
  br i1 %87, label %88, label %91, !dbg !551

; <label>:88                                      ; preds = %86
  %89 = icmp slt i32 %81, 145, !dbg !552
  br i1 %89, label %90, label %91, !dbg !552

; <label>:90                                      ; preds = %88
  br label %93, !dbg !554

; <label>:91                                      ; preds = %88, %86
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i32 440, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.std_eval, i32 0, i32 0)) #6, !dbg !556
  unreachable, !dbg !556
                                                  ; No predecessors!
  br label %93, !dbg !551

; <label>:93                                      ; preds = %92, %90
  %94 = sext i32 %81 to i64, !dbg !559
  %95 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %94, !dbg !559
  %96 = load i32* %95, align 4, !dbg !559
  %97 = add nsw i32 %96, 1, !dbg !559
  %98 = ashr i32 %97, 1, !dbg !559
  %99 = icmp ne i32 %98, 1, !dbg !559
  br i1 %99, label %100, label %134, !dbg !561

; <label>:100                                     ; preds = %93
  %101 = sext i32 %81 to i64, !dbg !562
  %102 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %101, !dbg !562
  %103 = load i32* %102, align 4, !dbg !562
  %104 = add nsw i32 %103, 1, !dbg !562
  %105 = ashr i32 %104, 1, !dbg !562
  %106 = icmp ne i32 %105, 3, !dbg !562
  br i1 %106, label %107, label %134, !dbg !561

; <label>:107                                     ; preds = %100
  %108 = sext i32 %81 to i64, !dbg !564
  %109 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %108, !dbg !564
  %110 = load i32* %109, align 4, !dbg !564
  %111 = add nsw i32 %110, 1, !dbg !564
  %112 = and i32 %111, 1, !dbg !564
  %113 = icmp eq i32 %112, 0, !dbg !564
  br i1 %113, label %114, label %123, !dbg !567

; <label>:114                                     ; preds = %107
  %115 = sext i32 %81 to i64, !dbg !568
  %116 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %115, !dbg !568
  %117 = load i32* %116, align 4, !dbg !568
  %118 = sext i32 %117 to i64, !dbg !569
  %119 = getelementptr inbounds [14 x i32]* @material, i32 0, i64 %118, !dbg !569
  %120 = load i32* %119, align 4, !dbg !569
  %121 = load i32* @wmat, align 4, !dbg !570
  %122 = add nsw i32 %121, %120, !dbg !570
  store i32 %122, i32* @wmat, align 4, !dbg !570
  br label %133, !dbg !570

; <label>:123                                     ; preds = %107
  %124 = sext i32 %81 to i64, !dbg !571
  %125 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %124, !dbg !571
  %126 = load i32* %125, align 4, !dbg !571
  %127 = sext i32 %126 to i64, !dbg !572
  %128 = getelementptr inbounds [14 x i32]* @material, i32 0, i64 %127, !dbg !572
  %129 = load i32* %128, align 4, !dbg !572
  %130 = call i32 @abs(i32 %129) #1, !dbg !573
  %131 = load i32* @bmat, align 4, !dbg !574
  %132 = add nsw i32 %131, %130, !dbg !574
  store i32 %132, i32* @bmat, align 4, !dbg !574
  br label %133

; <label>:133                                     ; preds = %123, %114
  br label %134, !dbg !575

; <label>:134                                     ; preds = %133, %100, %93
  %135 = sext i32 %81 to i64, !dbg !576
  %136 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %135, !dbg !576
  %137 = load i32* %136, align 4, !dbg !576
  %138 = add nsw i32 %137, 1, !dbg !576
  %139 = ashr i32 %138, 1, !dbg !576
  %140 = icmp eq i32 %139, 1, !dbg !576
  br i1 %140, label %141, label %184, !dbg !578

; <label>:141                                     ; preds = %134
  %142 = sext i32 %81 to i64, !dbg !579
  %143 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %142, !dbg !579
  %144 = load i32* %143, align 4, !dbg !579
  %145 = add nsw i32 %144, 1, !dbg !579
  call void @llvm.dbg.value(metadata i32 %145, i64 0, metadata !581, metadata !85), !dbg !582
  %146 = sext i32 %81 to i64, !dbg !583
  %147 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %146, !dbg !583
  %148 = load i32* %147, align 4, !dbg !583
  call void @llvm.dbg.value(metadata i32 %148, i64 0, metadata !584, metadata !85), !dbg !585
  %149 = sext i32 %81 to i64, !dbg !586
  %150 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %149, !dbg !586
  %151 = load i32* %150, align 4, !dbg !586
  %152 = add nsw i32 %151, 1, !dbg !586
  %153 = and i32 %152, 1, !dbg !586
  %154 = icmp eq i32 %153, 0, !dbg !586
  br i1 %154, label %155, label %169, !dbg !588

; <label>:155                                     ; preds = %141
  %156 = sext i32 %145 to i64, !dbg !589
  %157 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !589
  %158 = getelementptr inbounds [11 x i32]* %157, i32 0, i64 %156, !dbg !589
  %159 = load i32* %158, align 4, !dbg !589
  %160 = add nsw i32 %159, 1, !dbg !589
  store i32 %160, i32* %158, align 4, !dbg !589
  %161 = sext i32 %145 to i64, !dbg !591
  %162 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %161, !dbg !591
  %163 = load i32* %162, align 4, !dbg !591
  %164 = icmp slt i32 %148, %163, !dbg !593
  br i1 %164, label %165, label %168, !dbg !594

; <label>:165                                     ; preds = %155
  %166 = sext i32 %145 to i64, !dbg !595
  %167 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %166, !dbg !595
  store i32 %148, i32* %167, align 4, !dbg !595
  br label %168, !dbg !597

; <label>:168                                     ; preds = %165, %155
  br label %183, !dbg !598

; <label>:169                                     ; preds = %141
  %170 = sext i32 %145 to i64, !dbg !599
  %171 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !599
  %172 = getelementptr inbounds [11 x i32]* %171, i32 0, i64 %170, !dbg !599
  %173 = load i32* %172, align 4, !dbg !599
  %174 = add nsw i32 %173, 1, !dbg !599
  store i32 %174, i32* %172, align 4, !dbg !599
  %175 = sext i32 %145 to i64, !dbg !601
  %176 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %175, !dbg !601
  %177 = load i32* %176, align 4, !dbg !601
  %178 = icmp sgt i32 %148, %177, !dbg !603
  br i1 %178, label %179, label %182, !dbg !604

; <label>:179                                     ; preds = %169
  %180 = sext i32 %145 to i64, !dbg !605
  %181 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %180, !dbg !605
  store i32 %148, i32* %181, align 4, !dbg !605
  br label %182, !dbg !607

; <label>:182                                     ; preds = %179, %169
  br label %183

; <label>:183                                     ; preds = %182, %168
  br label %184, !dbg !608

; <label>:184                                     ; preds = %183, %134
  br label %185, !dbg !609

; <label>:185                                     ; preds = %184, %83
  %a.1 = phi i32 [ %85, %184 ], [ %a.0, %83 ]
  %186 = add nsw i32 %j.0, 1, !dbg !610
  call void @llvm.dbg.value(metadata i32 %186, i64 0, metadata !535, metadata !85), !dbg !536
  br label %75, !dbg !611

; <label>:187                                     ; preds = %75
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !612, metadata !85), !dbg !613
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !614, metadata !85), !dbg !615
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !616, metadata !85), !dbg !617
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !618, metadata !85), !dbg !619
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !620, metadata !85), !dbg !621
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !622, metadata !85), !dbg !623
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !624, metadata !85), !dbg !625
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !626, metadata !85), !dbg !627
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !628, metadata !85), !dbg !629
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !630, metadata !85), !dbg !631
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !632, metadata !85), !dbg !633
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !634, metadata !85), !dbg !635
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !636, metadata !85), !dbg !637
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !638, metadata !85), !dbg !639
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !640, metadata !85), !dbg !641
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !642, metadata !85), !dbg !643
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !644, metadata !85), !dbg !645
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !646, metadata !85), !dbg !647
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !535, metadata !85), !dbg !536
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !537, metadata !85), !dbg !538
  br label %188, !dbg !648

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
  %189 = load i32* @piece_count, align 4, !dbg !650
  %190 = icmp sle i32 %a.2, %189, !dbg !652
  br i1 %190, label %191, label %1314, !dbg !653

; <label>:191                                     ; preds = %188
  %192 = sext i32 %j.1 to i64, !dbg !654
  %193 = getelementptr inbounds [62 x i32]* @pieces, i32 0, i64 %192, !dbg !654
  %194 = load i32* %193, align 4, !dbg !654
  call void @llvm.dbg.value(metadata i32 %194, i64 0, metadata !514, metadata !85), !dbg !515
  %195 = icmp ne i32 %194, 0, !dbg !656
  br i1 %195, label %197, label %196, !dbg !656

; <label>:196                                     ; preds = %191
  br label %1312, !dbg !657

; <label>:197                                     ; preds = %191
  %198 = add nsw i32 %a.2, 1, !dbg !659
  call void @llvm.dbg.value(metadata i32 %198, i64 0, metadata !537, metadata !85), !dbg !538
  br label %199

; <label>:199                                     ; preds = %197
  %200 = sext i32 %194 to i64, !dbg !660
  %201 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %200, !dbg !660
  %202 = load i32* %201, align 4, !dbg !660
  %203 = add nsw i32 %202, 1, !dbg !660
  %204 = ashr i32 %203, 1, !dbg !660
  %205 = sext i32 %204 to i64, !dbg !661
  %206 = getelementptr inbounds [7 x i32 (i32, i32)*]* @evalRoutines, i32 0, i64 %205, !dbg !661
  %207 = load i32 (i32, i32)** %206, align 8, !dbg !661
  %208 = sext i32 %194 to i64, !dbg !662
  %209 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %208, !dbg !662
  %210 = load i32* %209, align 4, !dbg !662
  %211 = add nsw i32 %210, 1, !dbg !662
  %212 = and i32 %211, 1, !dbg !662
  %213 = call i32 %207(i32 %194, i32 %212), !dbg !660
  %214 = load i32* %score, align 4, !dbg !663
  %215 = add nsw i32 %214, %213, !dbg !663
  store i32 %215, i32* %score, align 4, !dbg !663
  %216 = sext i32 %194 to i64, !dbg !664
  %217 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %216, !dbg !664
  %218 = load i32* %217, align 4, !dbg !664
  %219 = add nsw i32 %218, 1, !dbg !664
  call void @llvm.dbg.value(metadata i32 %219, i64 0, metadata !581, metadata !85), !dbg !582
  %220 = sext i32 %194 to i64, !dbg !665
  %221 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %220, !dbg !665
  %222 = load i32* %221, align 4, !dbg !665
  call void @llvm.dbg.value(metadata i32 %222, i64 0, metadata !584, metadata !85), !dbg !585
  %223 = sext i32 %194 to i64, !dbg !666
  %224 = getelementptr inbounds [144 x i32]* @board, i32 0, i64 %223, !dbg !666
  %225 = load i32* %224, align 4, !dbg !666
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
  ], !dbg !667

; <label>:226                                     ; preds = %199
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !668, metadata !85), !dbg !670
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !671, metadata !85), !dbg !672
  %227 = sext i32 %194 to i64, !dbg !673
  %228 = getelementptr inbounds [144 x i32]* @swhite_pawn, i32 0, i64 %227, !dbg !673
  %229 = load i32* %228, align 4, !dbg !673
  %230 = load i32* %score, align 4, !dbg !675
  %231 = add nsw i32 %230, %229, !dbg !675
  store i32 %231, i32* %score, align 4, !dbg !675
  %232 = add nsw i32 %wp.0, 1, !dbg !676
  call void @llvm.dbg.value(metadata i32 %232, i64 0, metadata !628, metadata !85), !dbg !629
  %233 = add nsw i32 %219, 1, !dbg !677
  %234 = sext i32 %233 to i64, !dbg !679
  %235 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %234, !dbg !679
  %236 = load i32* %235, align 4, !dbg !679
  %237 = icmp sgt i32 %236, %222, !dbg !679
  br i1 %237, label %238, label %264, !dbg !680

; <label>:238                                     ; preds = %226
  %239 = sub nsw i32 %219, 1, !dbg !681
  %240 = sext i32 %239 to i64, !dbg !682
  %241 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %240, !dbg !682
  %242 = load i32* %241, align 4, !dbg !682
  %243 = icmp sgt i32 %242, %222, !dbg !682
  br i1 %243, label %244, label %264, !dbg !680

; <label>:244                                     ; preds = %238
  %245 = load i32* %score, align 4, !dbg !683
  %246 = sub nsw i32 %245, 8, !dbg !683
  store i32 %246, i32* %score, align 4, !dbg !683
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !671, metadata !85), !dbg !672
  %247 = add nsw i32 %219, 1, !dbg !685
  %248 = sext i32 %247 to i64, !dbg !687
  %249 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !687
  %250 = getelementptr inbounds [11 x i32]* %249, i32 0, i64 %248, !dbg !687
  %251 = load i32* %250, align 4, !dbg !687
  %252 = icmp ne i32 %251, 0, !dbg !688
  br i1 %252, label %263, label %253, !dbg !688

; <label>:253                                     ; preds = %244
  %254 = sub nsw i32 %219, 1, !dbg !689
  %255 = sext i32 %254 to i64, !dbg !691
  %256 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !691
  %257 = getelementptr inbounds [11 x i32]* %256, i32 0, i64 %255, !dbg !691
  %258 = load i32* %257, align 4, !dbg !691
  %259 = icmp ne i32 %258, 0, !dbg !688
  br i1 %259, label %263, label %260, !dbg !688

; <label>:260                                     ; preds = %253
  %261 = load i32* %score, align 4, !dbg !692
  %262 = sub nsw i32 %261, 5, !dbg !692
  store i32 %262, i32* %score, align 4, !dbg !692
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !668, metadata !85), !dbg !670
  br label %263, !dbg !694

; <label>:263                                     ; preds = %260, %253, %244
  %isolated.0 = phi i32 [ 0, %244 ], [ 0, %253 ], [ 1, %260 ]
  br label %264, !dbg !695

; <label>:264                                     ; preds = %263, %238, %226
  %backwards.0 = phi i32 [ 1, %263 ], [ 0, %238 ], [ 0, %226 ]
  %isolated.1 = phi i32 [ %isolated.0, %263 ], [ 0, %238 ], [ 0, %226 ]
  %265 = sext i32 %219 to i64, !dbg !696
  %266 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !696
  %267 = getelementptr inbounds [11 x i32]* %266, i32 0, i64 %265, !dbg !696
  %268 = load i32* %267, align 4, !dbg !696
  %269 = icmp ne i32 %268, 0, !dbg !698
  br i1 %269, label %281, label %270, !dbg !698

; <label>:270                                     ; preds = %264
  %271 = icmp ne i32 %backwards.0, 0, !dbg !699
  br i1 %271, label %272, label %275, !dbg !699

; <label>:272                                     ; preds = %270
  %273 = load i32* %score, align 4, !dbg !701
  %274 = sub nsw i32 %273, 3, !dbg !701
  store i32 %274, i32* %score, align 4, !dbg !701
  br label %275, !dbg !701

; <label>:275                                     ; preds = %272, %270
  %276 = icmp ne i32 %isolated.1, 0, !dbg !704
  br i1 %276, label %277, label %280, !dbg !704

; <label>:277                                     ; preds = %275
  %278 = load i32* %score, align 4, !dbg !705
  %279 = sub nsw i32 %278, 5, !dbg !705
  store i32 %279, i32* %score, align 4, !dbg !705
  br label %280, !dbg !705

; <label>:280                                     ; preds = %277, %275
  br label %281, !dbg !708

; <label>:281                                     ; preds = %280, %264
  %282 = sext i32 %219 to i64, !dbg !709
  %283 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !709
  %284 = getelementptr inbounds [11 x i32]* %283, i32 0, i64 %282, !dbg !709
  %285 = load i32* %284, align 4, !dbg !709
  %286 = icmp sgt i32 %285, 1, !dbg !709
  br i1 %286, label %287, label %296, !dbg !711

; <label>:287                                     ; preds = %281
  %288 = sext i32 %219 to i64, !dbg !712
  %289 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !712
  %290 = getelementptr inbounds [11 x i32]* %289, i32 0, i64 %288, !dbg !712
  %291 = load i32* %290, align 4, !dbg !712
  %292 = sub nsw i32 %291, 1, !dbg !712
  %293 = mul nsw i32 3, %292, !dbg !713
  %294 = load i32* %score, align 4, !dbg !714
  %295 = sub nsw i32 %294, %293, !dbg !714
  store i32 %295, i32* %score, align 4, !dbg !714
  br label %296, !dbg !714

; <label>:296                                     ; preds = %287, %281
  %297 = sext i32 %219 to i64, !dbg !715
  %298 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !715
  %299 = getelementptr inbounds [11 x i32]* %298, i32 0, i64 %297, !dbg !715
  %300 = load i32* %299, align 4, !dbg !715
  %301 = icmp ne i32 %300, 0, !dbg !717
  br i1 %301, label %559, label %302, !dbg !717

; <label>:302                                     ; preds = %296
  %303 = sub nsw i32 %219, 1, !dbg !718
  %304 = sext i32 %303 to i64, !dbg !719
  %305 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %304, !dbg !719
  %306 = load i32* %305, align 4, !dbg !719
  %307 = icmp sge i32 %222, %306, !dbg !720
  br i1 %307, label %308, label %559, !dbg !717

; <label>:308                                     ; preds = %302
  %309 = add nsw i32 %219, 1, !dbg !721
  %310 = sext i32 %309 to i64, !dbg !722
  %311 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %310, !dbg !722
  %312 = load i32* %311, align 4, !dbg !722
  %313 = icmp sge i32 %222, %312, !dbg !723
  br i1 %313, label %314, label %559, !dbg !717

; <label>:314                                     ; preds = %308
  %315 = sext i32 %194 to i64, !dbg !724
  %316 = getelementptr inbounds [144 x i32]* @swhite_pawn, i32 0, i64 %315, !dbg !724
  %317 = load i32* %316, align 4, !dbg !724
  %318 = mul nsw i32 3, %317, !dbg !726
  %319 = add nsw i32 30, %318, !dbg !727
  %320 = load i32* %score, align 4, !dbg !728
  %321 = add nsw i32 %320, %319, !dbg !728
  store i32 %321, i32* %score, align 4, !dbg !728
  %322 = load i32* @white_to_move, align 4, !dbg !729
  %323 = icmp ne i32 %322, 0, !dbg !731
  br i1 %323, label %324, label %383, !dbg !731

; <label>:324                                     ; preds = %314
  %325 = sext i32 %194 to i64, !dbg !732
  %326 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %325, !dbg !732
  %327 = load i32* %326, align 4, !dbg !732
  %328 = add nsw i32 110, %327, !dbg !734
  %329 = sub nsw i32 %328, 1, !dbg !734
  call void @llvm.dbg.value(metadata i32 %329, i64 0, metadata !735, metadata !85), !dbg !736
  %330 = load i32* @bking_loc, align 4, !dbg !737
  %331 = sext i32 %330 to i64, !dbg !737
  %332 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %331, !dbg !737
  %333 = load i32* %332, align 4, !dbg !737
  %334 = sext i32 %329 to i64, !dbg !737
  %335 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %334, !dbg !737
  %336 = load i32* %335, align 4, !dbg !737
  %337 = sub nsw i32 %333, %336, !dbg !737
  %338 = call i32 @abs(i32 %337) #1, !dbg !737
  %339 = load i32* @bking_loc, align 4, !dbg !737
  %340 = sext i32 %339 to i64, !dbg !737
  %341 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %340, !dbg !737
  %342 = load i32* %341, align 4, !dbg !737
  %343 = sext i32 %329 to i64, !dbg !737
  %344 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %343, !dbg !737
  %345 = load i32* %344, align 4, !dbg !737
  %346 = sub nsw i32 %342, %345, !dbg !737
  %347 = call i32 @abs(i32 %346) #1, !dbg !737
  %348 = icmp sgt i32 %338, %347, !dbg !737
  br i1 %348, label %349, label %359, !dbg !737

; <label>:349                                     ; preds = %324
  %350 = load i32* @bking_loc, align 4, !dbg !739
  %351 = sext i32 %350 to i64, !dbg !739
  %352 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %351, !dbg !739
  %353 = load i32* %352, align 4, !dbg !739
  %354 = sext i32 %329 to i64, !dbg !739
  %355 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %354, !dbg !739
  %356 = load i32* %355, align 4, !dbg !739
  %357 = sub nsw i32 %353, %356, !dbg !739
  %358 = call i32 @abs(i32 %357) #1, !dbg !739
  br label %369, !dbg !739

; <label>:359                                     ; preds = %324
  %360 = load i32* @bking_loc, align 4, !dbg !741
  %361 = sext i32 %360 to i64, !dbg !741
  %362 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %361, !dbg !741
  %363 = load i32* %362, align 4, !dbg !741
  %364 = sext i32 %329 to i64, !dbg !741
  %365 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %364, !dbg !741
  %366 = load i32* %365, align 4, !dbg !741
  %367 = sub nsw i32 %363, %366, !dbg !741
  %368 = call i32 @abs(i32 %367) #1, !dbg !741
  br label %369, !dbg !741

; <label>:369                                     ; preds = %359, %349
  %370 = phi i32 [ %358, %349 ], [ %368, %359 ], !dbg !737
  %371 = sext i32 %329 to i64, !dbg !743
  %372 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %371, !dbg !743
  %373 = load i32* %372, align 4, !dbg !743
  %374 = sext i32 %194 to i64, !dbg !744
  %375 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %374, !dbg !744
  %376 = load i32* %375, align 4, !dbg !744
  %377 = sub nsw i32 %373, %376, !dbg !743
  %378 = call i32 @abs(i32 %377) #1, !dbg !745
  %379 = icmp sgt i32 %370, %378, !dbg !737
  br i1 %379, label %380, label %382, !dbg !746

; <label>:380                                     ; preds = %369
  %381 = add nsw i32 %wpotential.0, 800, !dbg !747
  call void @llvm.dbg.value(metadata i32 %381, i64 0, metadata !612, metadata !85), !dbg !613
  br label %382, !dbg !749

; <label>:382                                     ; preds = %380, %369
  %wpotential.1 = phi i32 [ %381, %380 ], [ %wpotential.0, %369 ]
  br label %443, !dbg !750

; <label>:383                                     ; preds = %314
  %384 = sext i32 %194 to i64, !dbg !751
  %385 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %384, !dbg !751
  %386 = load i32* %385, align 4, !dbg !751
  %387 = add nsw i32 110, %386, !dbg !753
  %388 = sub nsw i32 %387, 1, !dbg !753
  call void @llvm.dbg.value(metadata i32 %388, i64 0, metadata !735, metadata !85), !dbg !736
  %389 = load i32* @bking_loc, align 4, !dbg !754
  %390 = sext i32 %389 to i64, !dbg !754
  %391 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %390, !dbg !754
  %392 = load i32* %391, align 4, !dbg !754
  %393 = sext i32 %388 to i64, !dbg !754
  %394 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %393, !dbg !754
  %395 = load i32* %394, align 4, !dbg !754
  %396 = sub nsw i32 %392, %395, !dbg !754
  %397 = call i32 @abs(i32 %396) #1, !dbg !754
  %398 = load i32* @bking_loc, align 4, !dbg !754
  %399 = sext i32 %398 to i64, !dbg !754
  %400 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %399, !dbg !754
  %401 = load i32* %400, align 4, !dbg !754
  %402 = sext i32 %388 to i64, !dbg !754
  %403 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %402, !dbg !754
  %404 = load i32* %403, align 4, !dbg !754
  %405 = sub nsw i32 %401, %404, !dbg !754
  %406 = call i32 @abs(i32 %405) #1, !dbg !754
  %407 = icmp sgt i32 %397, %406, !dbg !754
  br i1 %407, label %408, label %418, !dbg !754

; <label>:408                                     ; preds = %383
  %409 = load i32* @bking_loc, align 4, !dbg !756
  %410 = sext i32 %409 to i64, !dbg !756
  %411 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %410, !dbg !756
  %412 = load i32* %411, align 4, !dbg !756
  %413 = sext i32 %388 to i64, !dbg !756
  %414 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %413, !dbg !756
  %415 = load i32* %414, align 4, !dbg !756
  %416 = sub nsw i32 %412, %415, !dbg !756
  %417 = call i32 @abs(i32 %416) #1, !dbg !756
  br label %428, !dbg !756

; <label>:418                                     ; preds = %383
  %419 = load i32* @bking_loc, align 4, !dbg !758
  %420 = sext i32 %419 to i64, !dbg !758
  %421 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %420, !dbg !758
  %422 = load i32* %421, align 4, !dbg !758
  %423 = sext i32 %388 to i64, !dbg !758
  %424 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %423, !dbg !758
  %425 = load i32* %424, align 4, !dbg !758
  %426 = sub nsw i32 %422, %425, !dbg !758
  %427 = call i32 @abs(i32 %426) #1, !dbg !758
  br label %428, !dbg !758

; <label>:428                                     ; preds = %418, %408
  %429 = phi i32 [ %417, %408 ], [ %427, %418 ], !dbg !754
  %430 = sub nsw i32 %429, 1, !dbg !760
  %431 = sext i32 %388 to i64, !dbg !763
  %432 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %431, !dbg !763
  %433 = load i32* %432, align 4, !dbg !763
  %434 = sext i32 %194 to i64, !dbg !764
  %435 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %434, !dbg !764
  %436 = load i32* %435, align 4, !dbg !764
  %437 = sub nsw i32 %433, %436, !dbg !763
  %438 = call i32 @abs(i32 %437) #1, !dbg !765
  %439 = icmp sgt i32 %430, %438, !dbg !766
  br i1 %439, label %440, label %442, !dbg !767

; <label>:440                                     ; preds = %428
  %441 = add nsw i32 %wpotential.0, 800, !dbg !768
  call void @llvm.dbg.value(metadata i32 %441, i64 0, metadata !612, metadata !85), !dbg !613
  br label %442, !dbg !770

; <label>:442                                     ; preds = %440, %428
  %wpotential.2 = phi i32 [ %441, %440 ], [ %wpotential.0, %428 ]
  br label %443

; <label>:443                                     ; preds = %442, %382
  %wpotential.3 = phi i32 [ %wpotential.1, %382 ], [ %wpotential.2, %442 ]
  %444 = sext i32 %194 to i64, !dbg !771
  %445 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %444, !dbg !771
  %446 = load i32* %445, align 4, !dbg !771
  %447 = icmp eq i32 %446, 1, !dbg !771
  br i1 %447, label %453, label %448, !dbg !773

; <label>:448                                     ; preds = %443
  %449 = sext i32 %194 to i64, !dbg !774
  %450 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %449, !dbg !774
  %451 = load i32* %450, align 4, !dbg !774
  %452 = icmp eq i32 %451, 8, !dbg !774
  br i1 %452, label %453, label %461, !dbg !773

; <label>:453                                     ; preds = %448, %443
  %454 = sext i32 %194 to i64, !dbg !776
  %455 = getelementptr inbounds [144 x i32]* @swhite_pawn, i32 0, i64 %454, !dbg !776
  %456 = load i32* %455, align 4, !dbg !776
  %457 = mul nsw i32 2, %456, !dbg !777
  %458 = add nsw i32 12, %457, !dbg !778
  %459 = load i32* %score, align 4, !dbg !779
  %460 = add nsw i32 %459, %458, !dbg !779
  store i32 %460, i32* %score, align 4, !dbg !779
  br label %461, !dbg !779

; <label>:461                                     ; preds = %453, %448
  %462 = icmp ne i32 %isolated.1, 0, !dbg !780
  br i1 %462, label %558, label %463, !dbg !780

; <label>:463                                     ; preds = %461
  %464 = load i32* %score, align 4, !dbg !781
  %465 = add nsw i32 %464, 12, !dbg !781
  store i32 %465, i32* %score, align 4, !dbg !781
  %466 = add nsw i32 %219, 1, !dbg !784
  %467 = sext i32 %466 to i64, !dbg !786
  %468 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !786
  %469 = getelementptr inbounds [11 x i32]* %468, i32 0, i64 %467, !dbg !786
  %470 = load i32* %469, align 4, !dbg !786
  %471 = icmp ne i32 %470, 0, !dbg !787
  br i1 %471, label %472, label %511, !dbg !787

; <label>:472                                     ; preds = %463
  %473 = add nsw i32 %219, 1, !dbg !788
  %474 = sext i32 %473 to i64, !dbg !791
  %475 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !791
  %476 = getelementptr inbounds [11 x i32]* %475, i32 0, i64 %474, !dbg !791
  %477 = load i32* %476, align 4, !dbg !791
  %478 = icmp ne i32 %477, 0, !dbg !792
  br i1 %478, label %510, label %479, !dbg !792

; <label>:479                                     ; preds = %472
  %480 = add nsw i32 %219, 1, !dbg !793
  %481 = sext i32 %480 to i64, !dbg !794
  %482 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %481, !dbg !794
  %483 = load i32* %482, align 4, !dbg !794
  %484 = add nsw i32 %219, 2, !dbg !795
  %485 = sext i32 %484 to i64, !dbg !796
  %486 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %485, !dbg !796
  %487 = load i32* %486, align 4, !dbg !796
  %488 = icmp sge i32 %483, %487, !dbg !794
  br i1 %488, label %489, label %510, !dbg !792

; <label>:489                                     ; preds = %479
  %490 = sext i32 %194 to i64, !dbg !797
  %491 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %490, !dbg !797
  %492 = load i32* %491, align 4, !dbg !797
  %493 = mul nsw i32 7, %492, !dbg !799
  %494 = load i32* %score, align 4, !dbg !800
  %495 = add nsw i32 %494, %493, !dbg !800
  store i32 %495, i32* %score, align 4, !dbg !800
  %496 = sext i32 %194 to i64, !dbg !801
  %497 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %496, !dbg !801
  %498 = load i32* %497, align 4, !dbg !801
  %499 = icmp eq i32 %498, 7, !dbg !801
  br i1 %499, label %500, label %509, !dbg !803

; <label>:500                                     ; preds = %489
  %501 = add nsw i32 %219, 1, !dbg !804
  %502 = sext i32 %501 to i64, !dbg !806
  %503 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %502, !dbg !806
  %504 = load i32* %503, align 4, !dbg !806
  %505 = icmp sge i32 %504, 6, !dbg !806
  br i1 %505, label %506, label %509, !dbg !803

; <label>:506                                     ; preds = %500
  %507 = load i32* %score, align 4, !dbg !807
  %508 = add nsw i32 %507, 50, !dbg !807
  store i32 %508, i32* %score, align 4, !dbg !807
  br label %509, !dbg !809

; <label>:509                                     ; preds = %506, %500, %489
  br label %510, !dbg !810

; <label>:510                                     ; preds = %509, %479, %472
  br label %511, !dbg !811

; <label>:511                                     ; preds = %510, %463
  %512 = sub nsw i32 %219, 1, !dbg !812
  %513 = sext i32 %512 to i64, !dbg !814
  %514 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !814
  %515 = getelementptr inbounds [11 x i32]* %514, i32 0, i64 %513, !dbg !814
  %516 = load i32* %515, align 4, !dbg !814
  %517 = icmp ne i32 %516, 0, !dbg !815
  br i1 %517, label %518, label %557, !dbg !815

; <label>:518                                     ; preds = %511
  %519 = sub nsw i32 %219, 1, !dbg !816
  %520 = sext i32 %519 to i64, !dbg !819
  %521 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !819
  %522 = getelementptr inbounds [11 x i32]* %521, i32 0, i64 %520, !dbg !819
  %523 = load i32* %522, align 4, !dbg !819
  %524 = icmp ne i32 %523, 0, !dbg !820
  br i1 %524, label %556, label %525, !dbg !820

; <label>:525                                     ; preds = %518
  %526 = add nsw i32 %219, 1, !dbg !821
  %527 = sext i32 %526 to i64, !dbg !822
  %528 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %527, !dbg !822
  %529 = load i32* %528, align 4, !dbg !822
  %530 = sub nsw i32 %219, 2, !dbg !823
  %531 = sext i32 %530 to i64, !dbg !824
  %532 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %531, !dbg !824
  %533 = load i32* %532, align 4, !dbg !824
  %534 = icmp sge i32 %529, %533, !dbg !822
  br i1 %534, label %535, label %556, !dbg !820

; <label>:535                                     ; preds = %525
  %536 = sext i32 %194 to i64, !dbg !825
  %537 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %536, !dbg !825
  %538 = load i32* %537, align 4, !dbg !825
  %539 = mul nsw i32 7, %538, !dbg !827
  %540 = load i32* %score, align 4, !dbg !828
  %541 = add nsw i32 %540, %539, !dbg !828
  store i32 %541, i32* %score, align 4, !dbg !828
  %542 = sext i32 %194 to i64, !dbg !829
  %543 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %542, !dbg !829
  %544 = load i32* %543, align 4, !dbg !829
  %545 = icmp eq i32 %544, 7, !dbg !829
  br i1 %545, label %546, label %555, !dbg !831

; <label>:546                                     ; preds = %535
  %547 = sub nsw i32 %219, 1, !dbg !832
  %548 = sext i32 %547 to i64, !dbg !834
  %549 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %548, !dbg !834
  %550 = load i32* %549, align 4, !dbg !834
  %551 = icmp sge i32 %550, 6, !dbg !834
  br i1 %551, label %552, label %555, !dbg !831

; <label>:552                                     ; preds = %546
  %553 = load i32* %score, align 4, !dbg !835
  %554 = add nsw i32 %553, 50, !dbg !835
  store i32 %554, i32* %score, align 4, !dbg !835
  br label %555, !dbg !837

; <label>:555                                     ; preds = %552, %546, %535
  br label %556, !dbg !838

; <label>:556                                     ; preds = %555, %525, %518
  br label %557, !dbg !839

; <label>:557                                     ; preds = %556, %511
  br label %558, !dbg !840

; <label>:558                                     ; preds = %557, %461
  br label %559, !dbg !841

; <label>:559                                     ; preds = %558, %308, %302, %296
  %wpotential.4 = phi i32 [ %wpotential.0, %296 ], [ %wpotential.3, %558 ], [ %wpotential.0, %308 ], [ %wpotential.0, %302 ]
  %560 = sub nsw i32 %219, 1, !dbg !842
  %561 = sext i32 %560 to i64, !dbg !844
  %562 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !844
  %563 = getelementptr inbounds [11 x i32]* %562, i32 0, i64 %561, !dbg !844
  %564 = load i32* %563, align 4, !dbg !844
  %565 = icmp ne i32 %564, 0, !dbg !845
  br i1 %565, label %569, label %566, !dbg !845

; <label>:566                                     ; preds = %559
  %567 = load i32* %score, align 4, !dbg !846
  %568 = sub nsw i32 %567, 7, !dbg !846
  store i32 %568, i32* %score, align 4, !dbg !846
  br label %569, !dbg !846

; <label>:569                                     ; preds = %566, %559
  br label %1311, !dbg !847

; <label>:570                                     ; preds = %199
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !668, metadata !85), !dbg !670
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !671, metadata !85), !dbg !672
  %571 = sext i32 %194 to i64, !dbg !848
  %572 = getelementptr inbounds [144 x i32]* @sblack_pawn, i32 0, i64 %571, !dbg !848
  %573 = load i32* %572, align 4, !dbg !848
  %574 = load i32* %score, align 4, !dbg !849
  %575 = sub nsw i32 %574, %573, !dbg !849
  store i32 %575, i32* %score, align 4, !dbg !849
  %576 = add nsw i32 %bp.0, 1, !dbg !850
  call void @llvm.dbg.value(metadata i32 %576, i64 0, metadata !630, metadata !85), !dbg !631
  %577 = add nsw i32 %219, 1, !dbg !851
  %578 = sext i32 %577 to i64, !dbg !853
  %579 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %578, !dbg !853
  %580 = load i32* %579, align 4, !dbg !853
  %581 = icmp slt i32 %580, %222, !dbg !853
  br i1 %581, label %582, label %608, !dbg !854

; <label>:582                                     ; preds = %570
  %583 = sub nsw i32 %219, 1, !dbg !855
  %584 = sext i32 %583 to i64, !dbg !856
  %585 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %584, !dbg !856
  %586 = load i32* %585, align 4, !dbg !856
  %587 = icmp slt i32 %586, %222, !dbg !856
  br i1 %587, label %588, label %608, !dbg !854

; <label>:588                                     ; preds = %582
  %589 = load i32* %score, align 4, !dbg !857
  %590 = add nsw i32 %589, 8, !dbg !857
  store i32 %590, i32* %score, align 4, !dbg !857
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !671, metadata !85), !dbg !672
  %591 = add nsw i32 %219, 1, !dbg !859
  %592 = sext i32 %591 to i64, !dbg !861
  %593 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !861
  %594 = getelementptr inbounds [11 x i32]* %593, i32 0, i64 %592, !dbg !861
  %595 = load i32* %594, align 4, !dbg !861
  %596 = icmp ne i32 %595, 0, !dbg !862
  br i1 %596, label %607, label %597, !dbg !862

; <label>:597                                     ; preds = %588
  %598 = sub nsw i32 %219, 1, !dbg !863
  %599 = sext i32 %598 to i64, !dbg !865
  %600 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !865
  %601 = getelementptr inbounds [11 x i32]* %600, i32 0, i64 %599, !dbg !865
  %602 = load i32* %601, align 4, !dbg !865
  %603 = icmp ne i32 %602, 0, !dbg !862
  br i1 %603, label %607, label %604, !dbg !862

; <label>:604                                     ; preds = %597
  %605 = load i32* %score, align 4, !dbg !866
  %606 = add nsw i32 %605, 5, !dbg !866
  store i32 %606, i32* %score, align 4, !dbg !866
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !668, metadata !85), !dbg !670
  br label %607, !dbg !868

; <label>:607                                     ; preds = %604, %597, %588
  %isolated.2 = phi i32 [ 0, %588 ], [ 0, %597 ], [ 1, %604 ]
  br label %608, !dbg !869

; <label>:608                                     ; preds = %607, %582, %570
  %backwards.1 = phi i32 [ 1, %607 ], [ 0, %582 ], [ 0, %570 ]
  %isolated.3 = phi i32 [ %isolated.2, %607 ], [ 0, %582 ], [ 0, %570 ]
  %609 = sext i32 %219 to i64, !dbg !870
  %610 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !870
  %611 = getelementptr inbounds [11 x i32]* %610, i32 0, i64 %609, !dbg !870
  %612 = load i32* %611, align 4, !dbg !870
  %613 = icmp ne i32 %612, 0, !dbg !872
  br i1 %613, label %625, label %614, !dbg !872

; <label>:614                                     ; preds = %608
  %615 = icmp ne i32 %backwards.1, 0, !dbg !873
  br i1 %615, label %616, label %619, !dbg !873

; <label>:616                                     ; preds = %614
  %617 = load i32* %score, align 4, !dbg !875
  %618 = add nsw i32 %617, 3, !dbg !875
  store i32 %618, i32* %score, align 4, !dbg !875
  br label %619, !dbg !875

; <label>:619                                     ; preds = %616, %614
  %620 = icmp ne i32 %isolated.3, 0, !dbg !878
  br i1 %620, label %621, label %624, !dbg !878

; <label>:621                                     ; preds = %619
  %622 = load i32* %score, align 4, !dbg !879
  %623 = add nsw i32 %622, 5, !dbg !879
  store i32 %623, i32* %score, align 4, !dbg !879
  br label %624, !dbg !879

; <label>:624                                     ; preds = %621, %619
  br label %625, !dbg !882

; <label>:625                                     ; preds = %624, %608
  %626 = sext i32 %219 to i64, !dbg !883
  %627 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !883
  %628 = getelementptr inbounds [11 x i32]* %627, i32 0, i64 %626, !dbg !883
  %629 = load i32* %628, align 4, !dbg !883
  %630 = icmp sgt i32 %629, 1, !dbg !883
  br i1 %630, label %631, label %640, !dbg !885

; <label>:631                                     ; preds = %625
  %632 = sext i32 %219 to i64, !dbg !886
  %633 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !886
  %634 = getelementptr inbounds [11 x i32]* %633, i32 0, i64 %632, !dbg !886
  %635 = load i32* %634, align 4, !dbg !886
  %636 = sub nsw i32 %635, 1, !dbg !886
  %637 = mul nsw i32 3, %636, !dbg !887
  %638 = load i32* %score, align 4, !dbg !888
  %639 = add nsw i32 %638, %637, !dbg !888
  store i32 %639, i32* %score, align 4, !dbg !888
  br label %640, !dbg !888

; <label>:640                                     ; preds = %631, %625
  %641 = sext i32 %219 to i64, !dbg !889
  %642 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !889
  %643 = getelementptr inbounds [11 x i32]* %642, i32 0, i64 %641, !dbg !889
  %644 = load i32* %643, align 4, !dbg !889
  %645 = icmp ne i32 %644, 0, !dbg !891
  br i1 %645, label %905, label %646, !dbg !891

; <label>:646                                     ; preds = %640
  %647 = sub nsw i32 %219, 1, !dbg !892
  %648 = sext i32 %647 to i64, !dbg !893
  %649 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %648, !dbg !893
  %650 = load i32* %649, align 4, !dbg !893
  %651 = icmp sle i32 %222, %650, !dbg !894
  br i1 %651, label %652, label %905, !dbg !891

; <label>:652                                     ; preds = %646
  %653 = add nsw i32 %219, 1, !dbg !895
  %654 = sext i32 %653 to i64, !dbg !896
  %655 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %654, !dbg !896
  %656 = load i32* %655, align 4, !dbg !896
  %657 = icmp sle i32 %222, %656, !dbg !897
  br i1 %657, label %658, label %905, !dbg !891

; <label>:658                                     ; preds = %652
  %659 = sext i32 %194 to i64, !dbg !898
  %660 = getelementptr inbounds [144 x i32]* @sblack_pawn, i32 0, i64 %659, !dbg !898
  %661 = load i32* %660, align 4, !dbg !898
  %662 = mul nsw i32 3, %661, !dbg !900
  %663 = add nsw i32 30, %662, !dbg !901
  %664 = load i32* %score, align 4, !dbg !902
  %665 = sub nsw i32 %664, %663, !dbg !902
  store i32 %665, i32* %score, align 4, !dbg !902
  %666 = load i32* @white_to_move, align 4, !dbg !903
  %667 = icmp ne i32 %666, 0, !dbg !905
  br i1 %667, label %727, label %668, !dbg !905

; <label>:668                                     ; preds = %658
  %669 = sext i32 %194 to i64, !dbg !906
  %670 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %669, !dbg !906
  %671 = load i32* %670, align 4, !dbg !906
  %672 = add nsw i32 26, %671, !dbg !908
  %673 = sub nsw i32 %672, 1, !dbg !908
  call void @llvm.dbg.value(metadata i32 %673, i64 0, metadata !735, metadata !85), !dbg !736
  %674 = load i32* @wking_loc, align 4, !dbg !909
  %675 = sext i32 %674 to i64, !dbg !909
  %676 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %675, !dbg !909
  %677 = load i32* %676, align 4, !dbg !909
  %678 = sext i32 %673 to i64, !dbg !909
  %679 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %678, !dbg !909
  %680 = load i32* %679, align 4, !dbg !909
  %681 = sub nsw i32 %677, %680, !dbg !909
  %682 = call i32 @abs(i32 %681) #1, !dbg !909
  %683 = load i32* @wking_loc, align 4, !dbg !909
  %684 = sext i32 %683 to i64, !dbg !909
  %685 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %684, !dbg !909
  %686 = load i32* %685, align 4, !dbg !909
  %687 = sext i32 %673 to i64, !dbg !909
  %688 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %687, !dbg !909
  %689 = load i32* %688, align 4, !dbg !909
  %690 = sub nsw i32 %686, %689, !dbg !909
  %691 = call i32 @abs(i32 %690) #1, !dbg !909
  %692 = icmp sgt i32 %682, %691, !dbg !909
  br i1 %692, label %693, label %703, !dbg !909

; <label>:693                                     ; preds = %668
  %694 = load i32* @wking_loc, align 4, !dbg !911
  %695 = sext i32 %694 to i64, !dbg !911
  %696 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %695, !dbg !911
  %697 = load i32* %696, align 4, !dbg !911
  %698 = sext i32 %673 to i64, !dbg !911
  %699 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %698, !dbg !911
  %700 = load i32* %699, align 4, !dbg !911
  %701 = sub nsw i32 %697, %700, !dbg !911
  %702 = call i32 @abs(i32 %701) #1, !dbg !911
  br label %713, !dbg !911

; <label>:703                                     ; preds = %668
  %704 = load i32* @wking_loc, align 4, !dbg !913
  %705 = sext i32 %704 to i64, !dbg !913
  %706 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %705, !dbg !913
  %707 = load i32* %706, align 4, !dbg !913
  %708 = sext i32 %673 to i64, !dbg !913
  %709 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %708, !dbg !913
  %710 = load i32* %709, align 4, !dbg !913
  %711 = sub nsw i32 %707, %710, !dbg !913
  %712 = call i32 @abs(i32 %711) #1, !dbg !913
  br label %713, !dbg !913

; <label>:713                                     ; preds = %703, %693
  %714 = phi i32 [ %702, %693 ], [ %712, %703 ], !dbg !909
  %715 = sext i32 %673 to i64, !dbg !915
  %716 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %715, !dbg !915
  %717 = load i32* %716, align 4, !dbg !915
  %718 = sext i32 %194 to i64, !dbg !916
  %719 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %718, !dbg !916
  %720 = load i32* %719, align 4, !dbg !916
  %721 = sub nsw i32 %717, %720, !dbg !915
  %722 = call i32 @abs(i32 %721) #1, !dbg !917
  %723 = icmp sgt i32 %714, %722, !dbg !909
  br i1 %723, label %724, label %726, !dbg !918

; <label>:724                                     ; preds = %713
  %725 = sub nsw i32 %bpotential.0, 800, !dbg !919
  call void @llvm.dbg.value(metadata i32 %725, i64 0, metadata !614, metadata !85), !dbg !615
  br label %726, !dbg !921

; <label>:726                                     ; preds = %724, %713
  %bpotential.1 = phi i32 [ %725, %724 ], [ %bpotential.0, %713 ]
  br label %787, !dbg !922

; <label>:727                                     ; preds = %658
  %728 = sext i32 %194 to i64, !dbg !923
  %729 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %728, !dbg !923
  %730 = load i32* %729, align 4, !dbg !923
  %731 = add nsw i32 26, %730, !dbg !925
  %732 = sub nsw i32 %731, 1, !dbg !925
  call void @llvm.dbg.value(metadata i32 %732, i64 0, metadata !735, metadata !85), !dbg !736
  %733 = load i32* @wking_loc, align 4, !dbg !926
  %734 = sext i32 %733 to i64, !dbg !926
  %735 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %734, !dbg !926
  %736 = load i32* %735, align 4, !dbg !926
  %737 = sext i32 %732 to i64, !dbg !926
  %738 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %737, !dbg !926
  %739 = load i32* %738, align 4, !dbg !926
  %740 = sub nsw i32 %736, %739, !dbg !926
  %741 = call i32 @abs(i32 %740) #1, !dbg !926
  %742 = load i32* @wking_loc, align 4, !dbg !926
  %743 = sext i32 %742 to i64, !dbg !926
  %744 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %743, !dbg !926
  %745 = load i32* %744, align 4, !dbg !926
  %746 = sext i32 %732 to i64, !dbg !926
  %747 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %746, !dbg !926
  %748 = load i32* %747, align 4, !dbg !926
  %749 = sub nsw i32 %745, %748, !dbg !926
  %750 = call i32 @abs(i32 %749) #1, !dbg !926
  %751 = icmp sgt i32 %741, %750, !dbg !926
  br i1 %751, label %752, label %762, !dbg !926

; <label>:752                                     ; preds = %727
  %753 = load i32* @wking_loc, align 4, !dbg !928
  %754 = sext i32 %753 to i64, !dbg !928
  %755 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %754, !dbg !928
  %756 = load i32* %755, align 4, !dbg !928
  %757 = sext i32 %732 to i64, !dbg !928
  %758 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %757, !dbg !928
  %759 = load i32* %758, align 4, !dbg !928
  %760 = sub nsw i32 %756, %759, !dbg !928
  %761 = call i32 @abs(i32 %760) #1, !dbg !928
  br label %772, !dbg !928

; <label>:762                                     ; preds = %727
  %763 = load i32* @wking_loc, align 4, !dbg !930
  %764 = sext i32 %763 to i64, !dbg !930
  %765 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %764, !dbg !930
  %766 = load i32* %765, align 4, !dbg !930
  %767 = sext i32 %732 to i64, !dbg !930
  %768 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %767, !dbg !930
  %769 = load i32* %768, align 4, !dbg !930
  %770 = sub nsw i32 %766, %769, !dbg !930
  %771 = call i32 @abs(i32 %770) #1, !dbg !930
  br label %772, !dbg !930

; <label>:772                                     ; preds = %762, %752
  %773 = phi i32 [ %761, %752 ], [ %771, %762 ], !dbg !926
  %774 = sub nsw i32 %773, 1, !dbg !932
  %775 = sext i32 %732 to i64, !dbg !935
  %776 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %775, !dbg !935
  %777 = load i32* %776, align 4, !dbg !935
  %778 = sext i32 %194 to i64, !dbg !936
  %779 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %778, !dbg !936
  %780 = load i32* %779, align 4, !dbg !936
  %781 = sub nsw i32 %777, %780, !dbg !935
  %782 = call i32 @abs(i32 %781) #1, !dbg !937
  %783 = icmp sgt i32 %774, %782, !dbg !938
  br i1 %783, label %784, label %786, !dbg !939

; <label>:784                                     ; preds = %772
  %785 = sub nsw i32 %bpotential.0, 800, !dbg !940
  call void @llvm.dbg.value(metadata i32 %785, i64 0, metadata !614, metadata !85), !dbg !615
  br label %786, !dbg !942

; <label>:786                                     ; preds = %784, %772
  %bpotential.2 = phi i32 [ %785, %784 ], [ %bpotential.0, %772 ]
  br label %787

; <label>:787                                     ; preds = %786, %726
  %bpotential.3 = phi i32 [ %bpotential.2, %786 ], [ %bpotential.1, %726 ]
  %788 = sext i32 %194 to i64, !dbg !943
  %789 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %788, !dbg !943
  %790 = load i32* %789, align 4, !dbg !943
  %791 = icmp eq i32 %790, 1, !dbg !943
  br i1 %791, label %797, label %792, !dbg !945

; <label>:792                                     ; preds = %787
  %793 = sext i32 %194 to i64, !dbg !946
  %794 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %793, !dbg !946
  %795 = load i32* %794, align 4, !dbg !946
  %796 = icmp eq i32 %795, 8, !dbg !946
  br i1 %796, label %797, label %805, !dbg !945

; <label>:797                                     ; preds = %792, %787
  %798 = sext i32 %194 to i64, !dbg !948
  %799 = getelementptr inbounds [144 x i32]* @sblack_pawn, i32 0, i64 %798, !dbg !948
  %800 = load i32* %799, align 4, !dbg !948
  %801 = mul nsw i32 2, %800, !dbg !949
  %802 = add nsw i32 12, %801, !dbg !950
  %803 = load i32* %score, align 4, !dbg !951
  %804 = sub nsw i32 %803, %802, !dbg !951
  store i32 %804, i32* %score, align 4, !dbg !951
  br label %805, !dbg !951

; <label>:805                                     ; preds = %797, %792
  %806 = icmp ne i32 %isolated.3, 0, !dbg !952
  br i1 %806, label %904, label %807, !dbg !952

; <label>:807                                     ; preds = %805
  %808 = load i32* %score, align 4, !dbg !953
  %809 = sub nsw i32 %808, 12, !dbg !953
  store i32 %809, i32* %score, align 4, !dbg !953
  %810 = add nsw i32 %219, 1, !dbg !956
  %811 = sext i32 %810 to i64, !dbg !958
  %812 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !958
  %813 = getelementptr inbounds [11 x i32]* %812, i32 0, i64 %811, !dbg !958
  %814 = load i32* %813, align 4, !dbg !958
  %815 = icmp ne i32 %814, 0, !dbg !959
  br i1 %815, label %816, label %856, !dbg !959

; <label>:816                                     ; preds = %807
  %817 = add nsw i32 %219, 1, !dbg !960
  %818 = sext i32 %817 to i64, !dbg !963
  %819 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !963
  %820 = getelementptr inbounds [11 x i32]* %819, i32 0, i64 %818, !dbg !963
  %821 = load i32* %820, align 4, !dbg !963
  %822 = icmp ne i32 %821, 0, !dbg !964
  br i1 %822, label %855, label %823, !dbg !964

; <label>:823                                     ; preds = %816
  %824 = add nsw i32 %219, 1, !dbg !965
  %825 = sext i32 %824 to i64, !dbg !966
  %826 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %825, !dbg !966
  %827 = load i32* %826, align 4, !dbg !966
  %828 = add nsw i32 %219, 2, !dbg !967
  %829 = sext i32 %828 to i64, !dbg !968
  %830 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %829, !dbg !968
  %831 = load i32* %830, align 4, !dbg !968
  %832 = icmp sle i32 %827, %831, !dbg !966
  br i1 %832, label %833, label %855, !dbg !964

; <label>:833                                     ; preds = %823
  %834 = sext i32 %194 to i64, !dbg !969
  %835 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %834, !dbg !969
  %836 = load i32* %835, align 4, !dbg !969
  %837 = sub nsw i32 9, %836, !dbg !971
  %838 = mul nsw i32 7, %837, !dbg !972
  %839 = load i32* %score, align 4, !dbg !973
  %840 = sub nsw i32 %839, %838, !dbg !973
  store i32 %840, i32* %score, align 4, !dbg !973
  %841 = sext i32 %194 to i64, !dbg !974
  %842 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %841, !dbg !974
  %843 = load i32* %842, align 4, !dbg !974
  %844 = icmp eq i32 %843, 2, !dbg !974
  br i1 %844, label %845, label %854, !dbg !976

; <label>:845                                     ; preds = %833
  %846 = add nsw i32 %219, 1, !dbg !977
  %847 = sext i32 %846 to i64, !dbg !979
  %848 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %847, !dbg !979
  %849 = load i32* %848, align 4, !dbg !979
  %850 = icmp sle i32 %849, 3, !dbg !979
  br i1 %850, label %851, label %854, !dbg !976

; <label>:851                                     ; preds = %845
  %852 = load i32* %score, align 4, !dbg !980
  %853 = sub nsw i32 %852, 50, !dbg !980
  store i32 %853, i32* %score, align 4, !dbg !980
  br label %854, !dbg !982

; <label>:854                                     ; preds = %851, %845, %833
  br label %855, !dbg !983

; <label>:855                                     ; preds = %854, %823, %816
  br label %856, !dbg !984

; <label>:856                                     ; preds = %855, %807
  %857 = sub nsw i32 %219, 1, !dbg !985
  %858 = sext i32 %857 to i64, !dbg !987
  %859 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !987
  %860 = getelementptr inbounds [11 x i32]* %859, i32 0, i64 %858, !dbg !987
  %861 = load i32* %860, align 4, !dbg !987
  %862 = icmp ne i32 %861, 0, !dbg !988
  br i1 %862, label %863, label %903, !dbg !988

; <label>:863                                     ; preds = %856
  %864 = sub nsw i32 %219, 1, !dbg !989
  %865 = sext i32 %864 to i64, !dbg !992
  %866 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !992
  %867 = getelementptr inbounds [11 x i32]* %866, i32 0, i64 %865, !dbg !992
  %868 = load i32* %867, align 4, !dbg !992
  %869 = icmp ne i32 %868, 0, !dbg !993
  br i1 %869, label %902, label %870, !dbg !993

; <label>:870                                     ; preds = %863
  %871 = sub nsw i32 %219, 1, !dbg !994
  %872 = sext i32 %871 to i64, !dbg !995
  %873 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %872, !dbg !995
  %874 = load i32* %873, align 4, !dbg !995
  %875 = sub nsw i32 %219, 2, !dbg !996
  %876 = sext i32 %875 to i64, !dbg !997
  %877 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %876, !dbg !997
  %878 = load i32* %877, align 4, !dbg !997
  %879 = icmp sle i32 %874, %878, !dbg !995
  br i1 %879, label %880, label %902, !dbg !993

; <label>:880                                     ; preds = %870
  %881 = sext i32 %194 to i64, !dbg !998
  %882 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %881, !dbg !998
  %883 = load i32* %882, align 4, !dbg !998
  %884 = sub nsw i32 9, %883, !dbg !1000
  %885 = mul nsw i32 7, %884, !dbg !1001
  %886 = load i32* %score, align 4, !dbg !1002
  %887 = sub nsw i32 %886, %885, !dbg !1002
  store i32 %887, i32* %score, align 4, !dbg !1002
  %888 = sext i32 %194 to i64, !dbg !1003
  %889 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %888, !dbg !1003
  %890 = load i32* %889, align 4, !dbg !1003
  %891 = icmp eq i32 %890, 2, !dbg !1003
  br i1 %891, label %892, label %901, !dbg !1005

; <label>:892                                     ; preds = %880
  %893 = sub nsw i32 %219, 1, !dbg !1006
  %894 = sext i32 %893 to i64, !dbg !1008
  %895 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %894, !dbg !1008
  %896 = load i32* %895, align 4, !dbg !1008
  %897 = icmp sle i32 %896, 3, !dbg !1008
  br i1 %897, label %898, label %901, !dbg !1005

; <label>:898                                     ; preds = %892
  %899 = load i32* %score, align 4, !dbg !1009
  %900 = sub nsw i32 %899, 50, !dbg !1009
  store i32 %900, i32* %score, align 4, !dbg !1009
  br label %901, !dbg !1011

; <label>:901                                     ; preds = %898, %892, %880
  br label %902, !dbg !1012

; <label>:902                                     ; preds = %901, %870, %863
  br label %903, !dbg !1013

; <label>:903                                     ; preds = %902, %856
  br label %904, !dbg !1014

; <label>:904                                     ; preds = %903, %805
  br label %905, !dbg !1015

; <label>:905                                     ; preds = %904, %652, %646, %640
  %bpotential.4 = phi i32 [ %bpotential.0, %640 ], [ %bpotential.3, %904 ], [ %bpotential.0, %652 ], [ %bpotential.0, %646 ]
  %906 = sub nsw i32 %219, 1, !dbg !1016
  %907 = sext i32 %906 to i64, !dbg !1018
  %908 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !1018
  %909 = getelementptr inbounds [11 x i32]* %908, i32 0, i64 %907, !dbg !1018
  %910 = load i32* %909, align 4, !dbg !1018
  %911 = icmp ne i32 %910, 0, !dbg !1019
  br i1 %911, label %915, label %912, !dbg !1019

; <label>:912                                     ; preds = %905
  %913 = load i32* %score, align 4, !dbg !1020
  %914 = add nsw i32 %913, 7, !dbg !1020
  store i32 %914, i32* %score, align 4, !dbg !1020
  br label %915, !dbg !1020

; <label>:915                                     ; preds = %912, %905
  br label %1311, !dbg !1021

; <label>:916                                     ; preds = %199
  %917 = add nsw i32 %wr.0, 1, !dbg !1022
  call void @llvm.dbg.value(metadata i32 %917, i64 0, metadata !640, metadata !85), !dbg !641
  %918 = icmp eq i32 %917, 1, !dbg !1023
  br i1 %918, label %919, label %926, !dbg !1025

; <label>:919                                     ; preds = %916
  %920 = sext i32 %194 to i64, !dbg !1026
  %921 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %920, !dbg !1026
  %922 = load i32* %921, align 4, !dbg !1026
  call void @llvm.dbg.value(metadata i32 %922, i64 0, metadata !626, metadata !85), !dbg !627
  %923 = sext i32 %194 to i64, !dbg !1028
  %924 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %923, !dbg !1028
  %925 = load i32* %924, align 4, !dbg !1028
  call void @llvm.dbg.value(metadata i32 %925, i64 0, metadata !624, metadata !85), !dbg !625
  br label %926, !dbg !1029

; <label>:926                                     ; preds = %919, %916
  %fwrook.1 = phi i32 [ %922, %919 ], [ %fwrook.0, %916 ]
  %rwrook.1 = phi i32 [ %925, %919 ], [ %rwrook.0, %916 ]
  %927 = icmp eq i32 %222, 7, !dbg !1030
  br i1 %927, label %928, label %938, !dbg !1032

; <label>:928                                     ; preds = %926
  %929 = load i32* %score, align 4, !dbg !1033
  %930 = add nsw i32 %929, 25, !dbg !1033
  store i32 %930, i32* %score, align 4, !dbg !1033
  %931 = icmp eq i32 %917, 2, !dbg !1035
  br i1 %931, label %932, label %937, !dbg !1037

; <label>:932                                     ; preds = %928
  %933 = icmp eq i32 %rwrook.1, 7, !dbg !1038
  br i1 %933, label %934, label %937, !dbg !1037

; <label>:934                                     ; preds = %932
  %935 = load i32* %score, align 4, !dbg !1040
  %936 = add nsw i32 %935, 10, !dbg !1040
  store i32 %936, i32* %score, align 4, !dbg !1040
  br label %937, !dbg !1042

; <label>:937                                     ; preds = %934, %932, %928
  br label %938, !dbg !1043

; <label>:938                                     ; preds = %937, %926
  %939 = sext i32 %219 to i64, !dbg !1044
  %940 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !1044
  %941 = getelementptr inbounds [11 x i32]* %940, i32 0, i64 %939, !dbg !1044
  %942 = load i32* %941, align 4, !dbg !1044
  %943 = icmp ne i32 %942, 0, !dbg !1046
  br i1 %943, label %966, label %944, !dbg !1046

; <label>:944                                     ; preds = %938
  %945 = load i32* %score, align 4, !dbg !1047
  %946 = add nsw i32 %945, 5, !dbg !1047
  store i32 %946, i32* %score, align 4, !dbg !1047
  %947 = icmp eq i32 %917, 2, !dbg !1049
  br i1 %947, label %948, label %956, !dbg !1051

; <label>:948                                     ; preds = %944
  %949 = sext i32 %194 to i64, !dbg !1052
  %950 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %949, !dbg !1052
  %951 = load i32* %950, align 4, !dbg !1052
  %952 = icmp eq i32 %951, %fwrook.1, !dbg !1054
  br i1 %952, label %953, label %956, !dbg !1051

; <label>:953                                     ; preds = %948
  %954 = load i32* %score, align 4, !dbg !1055
  %955 = add nsw i32 %954, 12, !dbg !1055
  store i32 %955, i32* %score, align 4, !dbg !1055
  br label %956, !dbg !1057

; <label>:956                                     ; preds = %953, %948, %944
  %957 = sext i32 %219 to i64, !dbg !1058
  %958 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !1058
  %959 = getelementptr inbounds [11 x i32]* %958, i32 0, i64 %957, !dbg !1058
  %960 = load i32* %959, align 4, !dbg !1058
  %961 = icmp ne i32 %960, 0, !dbg !1060
  br i1 %961, label %965, label %962, !dbg !1060

; <label>:962                                     ; preds = %956
  %963 = load i32* %score, align 4, !dbg !1061
  %964 = add nsw i32 %963, 3, !dbg !1061
  store i32 %964, i32* %score, align 4, !dbg !1061
  br label %965, !dbg !1063

; <label>:965                                     ; preds = %962, %956
  br label %966, !dbg !1064

; <label>:966                                     ; preds = %965, %938
  br label %1311, !dbg !1065

; <label>:967                                     ; preds = %199
  %968 = add nsw i32 %br.0, 1, !dbg !1066
  call void @llvm.dbg.value(metadata i32 %968, i64 0, metadata !642, metadata !85), !dbg !643
  %969 = icmp eq i32 %968, 1, !dbg !1067
  br i1 %969, label %970, label %977, !dbg !1069

; <label>:970                                     ; preds = %967
  %971 = sext i32 %194 to i64, !dbg !1070
  %972 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %971, !dbg !1070
  %973 = load i32* %972, align 4, !dbg !1070
  call void @llvm.dbg.value(metadata i32 %973, i64 0, metadata !622, metadata !85), !dbg !623
  %974 = sext i32 %194 to i64, !dbg !1072
  %975 = getelementptr inbounds [144 x i32]* @Xrank, i32 0, i64 %974, !dbg !1072
  %976 = load i32* %975, align 4, !dbg !1072
  call void @llvm.dbg.value(metadata i32 %976, i64 0, metadata !620, metadata !85), !dbg !621
  br label %977, !dbg !1073

; <label>:977                                     ; preds = %970, %967
  %fbrook.1 = phi i32 [ %973, %970 ], [ %fbrook.0, %967 ]
  %rbrook.1 = phi i32 [ %976, %970 ], [ %rbrook.0, %967 ]
  %978 = icmp eq i32 %222, 2, !dbg !1074
  br i1 %978, label %979, label %989, !dbg !1076

; <label>:979                                     ; preds = %977
  %980 = load i32* %score, align 4, !dbg !1077
  %981 = sub nsw i32 %980, 25, !dbg !1077
  store i32 %981, i32* %score, align 4, !dbg !1077
  %982 = icmp eq i32 %wr.0, 2, !dbg !1079
  br i1 %982, label %983, label %988, !dbg !1081

; <label>:983                                     ; preds = %979
  %984 = icmp eq i32 %rbrook.1, 2, !dbg !1082
  br i1 %984, label %985, label %988, !dbg !1081

; <label>:985                                     ; preds = %983
  %986 = load i32* %score, align 4, !dbg !1084
  %987 = sub nsw i32 %986, 10, !dbg !1084
  store i32 %987, i32* %score, align 4, !dbg !1084
  br label %988, !dbg !1086

; <label>:988                                     ; preds = %985, %983, %979
  br label %989, !dbg !1087

; <label>:989                                     ; preds = %988, %977
  %990 = sext i32 %219 to i64, !dbg !1088
  %991 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !1088
  %992 = getelementptr inbounds [11 x i32]* %991, i32 0, i64 %990, !dbg !1088
  %993 = load i32* %992, align 4, !dbg !1088
  %994 = icmp ne i32 %993, 0, !dbg !1090
  br i1 %994, label %1017, label %995, !dbg !1090

; <label>:995                                     ; preds = %989
  %996 = load i32* %score, align 4, !dbg !1091
  %997 = sub nsw i32 %996, 5, !dbg !1091
  store i32 %997, i32* %score, align 4, !dbg !1091
  %998 = icmp eq i32 %968, 2, !dbg !1093
  br i1 %998, label %999, label %1007, !dbg !1095

; <label>:999                                     ; preds = %995
  %1000 = sext i32 %194 to i64, !dbg !1096
  %1001 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1000, !dbg !1096
  %1002 = load i32* %1001, align 4, !dbg !1096
  %1003 = icmp eq i32 %1002, %fbrook.1, !dbg !1098
  br i1 %1003, label %1004, label %1007, !dbg !1095

; <label>:1004                                    ; preds = %999
  %1005 = load i32* %score, align 4, !dbg !1099
  %1006 = sub nsw i32 %1005, 12, !dbg !1099
  store i32 %1006, i32* %score, align 4, !dbg !1099
  br label %1007, !dbg !1101

; <label>:1007                                    ; preds = %1004, %999, %995
  %1008 = sext i32 %219 to i64, !dbg !1102
  %1009 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !1102
  %1010 = getelementptr inbounds [11 x i32]* %1009, i32 0, i64 %1008, !dbg !1102
  %1011 = load i32* %1010, align 4, !dbg !1102
  %1012 = icmp ne i32 %1011, 0, !dbg !1104
  br i1 %1012, label %1016, label %1013, !dbg !1104

; <label>:1013                                    ; preds = %1007
  %1014 = load i32* %score, align 4, !dbg !1105
  %1015 = sub nsw i32 %1014, 3, !dbg !1105
  store i32 %1015, i32* %score, align 4, !dbg !1105
  br label %1016, !dbg !1107

; <label>:1016                                    ; preds = %1013, %1007
  br label %1017, !dbg !1108

; <label>:1017                                    ; preds = %1016, %989
  br label %1311, !dbg !1109

; <label>:1018                                    ; preds = %199
  %1019 = add nsw i32 %wb.0, 1, !dbg !1110
  call void @llvm.dbg.value(metadata i32 %1019, i64 0, metadata !632, metadata !85), !dbg !633
  br label %1311, !dbg !1111

; <label>:1020                                    ; preds = %199
  %1021 = add nsw i32 %bb.0, 1, !dbg !1112
  call void @llvm.dbg.value(metadata i32 %1021, i64 0, metadata !634, metadata !85), !dbg !635
  br label %1311, !dbg !1113

; <label>:1022                                    ; preds = %199
  %1023 = add nsw i32 %wn.0, 1, !dbg !1114
  call void @llvm.dbg.value(metadata i32 %1023, i64 0, metadata !636, metadata !85), !dbg !637
  br label %1311, !dbg !1115

; <label>:1024                                    ; preds = %199
  %1025 = add nsw i32 %bn.0, 1, !dbg !1116
  call void @llvm.dbg.value(metadata i32 %1025, i64 0, metadata !638, metadata !85), !dbg !639
  br label %1311, !dbg !1117

; <label>:1026                                    ; preds = %199
  %1027 = add nsw i32 %wq.0, 1, !dbg !1118
  call void @llvm.dbg.value(metadata i32 %1027, i64 0, metadata !644, metadata !85), !dbg !645
  br label %1311, !dbg !1119

; <label>:1028                                    ; preds = %199
  %1029 = add nsw i32 %bq.0, 1, !dbg !1120
  call void @llvm.dbg.value(metadata i32 %1029, i64 0, metadata !646, metadata !85), !dbg !647
  br label %1311, !dbg !1121

; <label>:1030                                    ; preds = %199
  %1031 = load i32* @wmat, align 4, !dbg !1122
  %1032 = icmp sgt i32 %1031, 1300, !dbg !1122
  br i1 %1032, label %1033, label %1159, !dbg !1124

; <label>:1033                                    ; preds = %1030
  %1034 = sext i32 %194 to i64, !dbg !1125
  %1035 = getelementptr inbounds [144 x i32]* @swhite_king, i32 0, i64 %1034, !dbg !1125
  %1036 = load i32* %1035, align 4, !dbg !1125
  %1037 = load i32* %score, align 4, !dbg !1127
  %1038 = add nsw i32 %1037, %1036, !dbg !1127
  store i32 %1038, i32* %score, align 4, !dbg !1127
  %1039 = load i32* @white_castled, align 4, !dbg !1128
  %1040 = icmp eq i32 %1039, 2, !dbg !1128
  br i1 %1040, label %1041, label %1044, !dbg !1130

; <label>:1041                                    ; preds = %1033
  %1042 = load i32* %score, align 4, !dbg !1131
  %1043 = add nsw i32 %1042, 15, !dbg !1131
  store i32 %1043, i32* %score, align 4, !dbg !1131
  br label %1067, !dbg !1131

; <label>:1044                                    ; preds = %1033
  %1045 = load i32* @white_castled, align 4, !dbg !1132
  %1046 = icmp eq i32 %1045, 1, !dbg !1132
  br i1 %1046, label %1047, label %1050, !dbg !1134

; <label>:1047                                    ; preds = %1044
  %1048 = load i32* %score, align 4, !dbg !1135
  %1049 = add nsw i32 %1048, 25, !dbg !1135
  store i32 %1049, i32* %score, align 4, !dbg !1135
  br label %1066, !dbg !1135

; <label>:1050                                    ; preds = %1044
  %1051 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 30), align 4, !dbg !1136
  %1052 = icmp ne i32 %1051, 0, !dbg !1138
  br i1 %1052, label %1053, label %1065, !dbg !1138

; <label>:1053                                    ; preds = %1050
  %1054 = load i32* %score, align 4, !dbg !1139
  %1055 = sub nsw i32 %1054, 10, !dbg !1139
  store i32 %1055, i32* %score, align 4, !dbg !1139
  %1056 = sext i32 %219 to i64, !dbg !1141
  %1057 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !1141
  %1058 = getelementptr inbounds [11 x i32]* %1057, i32 0, i64 %1056, !dbg !1141
  %1059 = load i32* %1058, align 4, !dbg !1141
  %1060 = icmp ne i32 %1059, 0, !dbg !1143
  br i1 %1060, label %1064, label %1061, !dbg !1143

; <label>:1061                                    ; preds = %1053
  %1062 = load i32* %score, align 4, !dbg !1144
  %1063 = sub nsw i32 %1062, 15, !dbg !1144
  store i32 %1063, i32* %score, align 4, !dbg !1144
  br label %1064, !dbg !1144

; <label>:1064                                    ; preds = %1061, %1053
  br label %1065, !dbg !1145

; <label>:1065                                    ; preds = %1064, %1050
  br label %1066

; <label>:1066                                    ; preds = %1065, %1047
  br label %1067

; <label>:1067                                    ; preds = %1066, %1041
  %1068 = load i32* @wking_loc, align 4, !dbg !1146
  %1069 = sext i32 %1068 to i64, !dbg !1146
  %1070 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1069, !dbg !1146
  %1071 = load i32* %1070, align 4, !dbg !1146
  %1072 = icmp ne i32 %1071, 4, !dbg !1146
  br i1 %1072, label %1073, label %1155, !dbg !1148

; <label>:1073                                    ; preds = %1067
  %1074 = load i32* @wking_loc, align 4, !dbg !1149
  %1075 = sext i32 %1074 to i64, !dbg !1149
  %1076 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1075, !dbg !1149
  %1077 = load i32* %1076, align 4, !dbg !1149
  %1078 = icmp ne i32 %1077, 5, !dbg !1149
  br i1 %1078, label %1079, label %1155, !dbg !1148

; <label>:1079                                    ; preds = %1073
  %1080 = sext i32 %219 to i64, !dbg !1151
  %1081 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1080, !dbg !1151
  %1082 = load i32* %1081, align 4, !dbg !1151
  %1083 = icmp slt i32 %222, %1082, !dbg !1154
  br i1 %1083, label %1084, label %1099, !dbg !1155

; <label>:1084                                    ; preds = %1079
  %1085 = sext i32 %219 to i64, !dbg !1156
  %1086 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !1156
  %1087 = getelementptr inbounds [11 x i32]* %1086, i32 0, i64 %1085, !dbg !1156
  %1088 = load i32* %1087, align 4, !dbg !1156
  %1089 = icmp ne i32 %1088, 0, !dbg !1155
  br i1 %1089, label %1090, label %1099, !dbg !1155

; <label>:1090                                    ; preds = %1084
  %1091 = sext i32 %219 to i64, !dbg !1157
  %1092 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1091, !dbg !1157
  %1093 = load i32* %1092, align 4, !dbg !1157
  %1094 = sub nsw i32 %1093, %222, !dbg !1157
  %1095 = sub nsw i32 %1094, 1, !dbg !1157
  %1096 = mul nsw i32 9, %1095, !dbg !1158
  %1097 = load i32* %score, align 4, !dbg !1159
  %1098 = sub nsw i32 %1097, %1096, !dbg !1159
  store i32 %1098, i32* %score, align 4, !dbg !1159
  br label %1102, !dbg !1159

; <label>:1099                                    ; preds = %1084, %1079
  %1100 = load i32* %score, align 4, !dbg !1160
  %1101 = sub nsw i32 %1100, 22, !dbg !1160
  store i32 %1101, i32* %score, align 4, !dbg !1160
  br label %1102

; <label>:1102                                    ; preds = %1099, %1090
  %1103 = add nsw i32 %219, 1, !dbg !1161
  %1104 = sext i32 %1103 to i64, !dbg !1163
  %1105 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1104, !dbg !1163
  %1106 = load i32* %1105, align 4, !dbg !1163
  %1107 = icmp slt i32 %222, %1106, !dbg !1164
  br i1 %1107, label %1108, label %1125, !dbg !1165

; <label>:1108                                    ; preds = %1102
  %1109 = add nsw i32 %219, 1, !dbg !1166
  %1110 = sext i32 %1109 to i64, !dbg !1168
  %1111 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !1168
  %1112 = getelementptr inbounds [11 x i32]* %1111, i32 0, i64 %1110, !dbg !1168
  %1113 = load i32* %1112, align 4, !dbg !1168
  %1114 = icmp ne i32 %1113, 0, !dbg !1165
  br i1 %1114, label %1115, label %1125, !dbg !1165

; <label>:1115                                    ; preds = %1108
  %1116 = add nsw i32 %219, 1, !dbg !1169
  %1117 = sext i32 %1116 to i64, !dbg !1170
  %1118 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1117, !dbg !1170
  %1119 = load i32* %1118, align 4, !dbg !1170
  %1120 = sub nsw i32 %1119, %222, !dbg !1170
  %1121 = sub nsw i32 %1120, 1, !dbg !1170
  %1122 = mul nsw i32 8, %1121, !dbg !1171
  %1123 = load i32* %score, align 4, !dbg !1172
  %1124 = sub nsw i32 %1123, %1122, !dbg !1172
  store i32 %1124, i32* %score, align 4, !dbg !1172
  br label %1128, !dbg !1172

; <label>:1125                                    ; preds = %1108, %1102
  %1126 = load i32* %score, align 4, !dbg !1173
  %1127 = sub nsw i32 %1126, 16, !dbg !1173
  store i32 %1127, i32* %score, align 4, !dbg !1173
  br label %1128

; <label>:1128                                    ; preds = %1125, %1115
  %1129 = sub nsw i32 %219, 1, !dbg !1174
  %1130 = sext i32 %1129 to i64, !dbg !1176
  %1131 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1130, !dbg !1176
  %1132 = load i32* %1131, align 4, !dbg !1176
  %1133 = icmp slt i32 %222, %1132, !dbg !1177
  br i1 %1133, label %1134, label %1151, !dbg !1178

; <label>:1134                                    ; preds = %1128
  %1135 = sub nsw i32 %219, 1, !dbg !1179
  %1136 = sext i32 %1135 to i64, !dbg !1181
  %1137 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !1181
  %1138 = getelementptr inbounds [11 x i32]* %1137, i32 0, i64 %1136, !dbg !1181
  %1139 = load i32* %1138, align 4, !dbg !1181
  %1140 = icmp ne i32 %1139, 0, !dbg !1178
  br i1 %1140, label %1141, label %1151, !dbg !1178

; <label>:1141                                    ; preds = %1134
  %1142 = sub nsw i32 %219, 1, !dbg !1182
  %1143 = sext i32 %1142 to i64, !dbg !1183
  %1144 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1143, !dbg !1183
  %1145 = load i32* %1144, align 4, !dbg !1183
  %1146 = sub nsw i32 %1145, %222, !dbg !1183
  %1147 = sub nsw i32 %1146, 1, !dbg !1183
  %1148 = mul nsw i32 8, %1147, !dbg !1184
  %1149 = load i32* %score, align 4, !dbg !1185
  %1150 = sub nsw i32 %1149, %1148, !dbg !1185
  store i32 %1150, i32* %score, align 4, !dbg !1185
  br label %1154, !dbg !1185

; <label>:1151                                    ; preds = %1134, %1128
  %1152 = load i32* %score, align 4, !dbg !1186
  %1153 = sub nsw i32 %1152, 16, !dbg !1186
  store i32 %1153, i32* %score, align 4, !dbg !1186
  br label %1154

; <label>:1154                                    ; preds = %1151, %1141
  br label %1158, !dbg !1187

; <label>:1155                                    ; preds = %1073, %1067
  %1156 = load i32* %score, align 4, !dbg !1188
  %1157 = sub nsw i32 %1156, 10, !dbg !1188
  store i32 %1157, i32* %score, align 4, !dbg !1188
  br label %1158

; <label>:1158                                    ; preds = %1155, %1154
  br label %1165, !dbg !1190

; <label>:1159                                    ; preds = %1030
  %1160 = sext i32 %194 to i64, !dbg !1191
  %1161 = getelementptr inbounds [144 x i32]* @send_king, i32 0, i64 %1160, !dbg !1191
  %1162 = load i32* %1161, align 4, !dbg !1191
  %1163 = load i32* %score, align 4, !dbg !1193
  %1164 = add nsw i32 %1163, %1162, !dbg !1193
  store i32 %1164, i32* %score, align 4, !dbg !1193
  br label %1165

; <label>:1165                                    ; preds = %1159, %1158
  br label %1311, !dbg !1194

; <label>:1166                                    ; preds = %199
  %1167 = load i32* @bmat, align 4, !dbg !1195
  %1168 = icmp sgt i32 %1167, 1300, !dbg !1195
  br i1 %1168, label %1169, label %1304, !dbg !1197

; <label>:1169                                    ; preds = %1166
  %1170 = sext i32 %194 to i64, !dbg !1198
  %1171 = getelementptr inbounds [144 x i32]* @sblack_king, i32 0, i64 %1170, !dbg !1198
  %1172 = load i32* %1171, align 4, !dbg !1198
  %1173 = load i32* %score, align 4, !dbg !1200
  %1174 = sub nsw i32 %1173, %1172, !dbg !1200
  store i32 %1174, i32* %score, align 4, !dbg !1200
  %1175 = load i32* @black_castled, align 4, !dbg !1201
  %1176 = icmp eq i32 %1175, 4, !dbg !1201
  br i1 %1176, label %1177, label %1180, !dbg !1203

; <label>:1177                                    ; preds = %1169
  %1178 = load i32* %score, align 4, !dbg !1204
  %1179 = sub nsw i32 %1178, 15, !dbg !1204
  store i32 %1179, i32* %score, align 4, !dbg !1204
  br label %1203, !dbg !1204

; <label>:1180                                    ; preds = %1169
  %1181 = load i32* @black_castled, align 4, !dbg !1205
  %1182 = icmp eq i32 %1181, 3, !dbg !1205
  br i1 %1182, label %1183, label %1186, !dbg !1207

; <label>:1183                                    ; preds = %1180
  %1184 = load i32* %score, align 4, !dbg !1208
  %1185 = sub nsw i32 %1184, 25, !dbg !1208
  store i32 %1185, i32* %score, align 4, !dbg !1208
  br label %1202, !dbg !1208

; <label>:1186                                    ; preds = %1180
  %1187 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 114), align 4, !dbg !1209
  %1188 = icmp ne i32 %1187, 0, !dbg !1211
  br i1 %1188, label %1189, label %1201, !dbg !1211

; <label>:1189                                    ; preds = %1186
  %1190 = load i32* %score, align 4, !dbg !1212
  %1191 = add nsw i32 %1190, 10, !dbg !1212
  store i32 %1191, i32* %score, align 4, !dbg !1212
  %1192 = sext i32 %219 to i64, !dbg !1214
  %1193 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !1214
  %1194 = getelementptr inbounds [11 x i32]* %1193, i32 0, i64 %1192, !dbg !1214
  %1195 = load i32* %1194, align 4, !dbg !1214
  %1196 = icmp ne i32 %1195, 0, !dbg !1216
  br i1 %1196, label %1200, label %1197, !dbg !1216

; <label>:1197                                    ; preds = %1189
  %1198 = load i32* %score, align 4, !dbg !1217
  %1199 = add nsw i32 %1198, 15, !dbg !1217
  store i32 %1199, i32* %score, align 4, !dbg !1217
  br label %1200, !dbg !1217

; <label>:1200                                    ; preds = %1197, %1189
  br label %1201, !dbg !1218

; <label>:1201                                    ; preds = %1200, %1186
  br label %1202

; <label>:1202                                    ; preds = %1201, %1183
  br label %1203

; <label>:1203                                    ; preds = %1202, %1177
  %1204 = load i32* @bking_loc, align 4, !dbg !1219
  %1205 = sext i32 %1204 to i64, !dbg !1219
  %1206 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1205, !dbg !1219
  %1207 = load i32* %1206, align 4, !dbg !1219
  %1208 = icmp ne i32 %1207, 4, !dbg !1219
  br i1 %1208, label %1209, label %1300, !dbg !1221

; <label>:1209                                    ; preds = %1203
  %1210 = load i32* @bking_loc, align 4, !dbg !1222
  %1211 = sext i32 %1210 to i64, !dbg !1222
  %1212 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1211, !dbg !1222
  %1213 = load i32* %1212, align 4, !dbg !1222
  %1214 = icmp ne i32 %1213, 5, !dbg !1222
  br i1 %1214, label %1215, label %1300, !dbg !1221

; <label>:1215                                    ; preds = %1209
  %1216 = sext i32 %219 to i64, !dbg !1224
  %1217 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1216, !dbg !1224
  %1218 = load i32* %1217, align 4, !dbg !1224
  %1219 = icmp sgt i32 %222, %1218, !dbg !1227
  br i1 %1219, label %1220, label %1238, !dbg !1228

; <label>:1220                                    ; preds = %1215
  %1221 = sext i32 %219 to i64, !dbg !1229
  %1222 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !1229
  %1223 = getelementptr inbounds [11 x i32]* %1222, i32 0, i64 %1221, !dbg !1229
  %1224 = load i32* %1223, align 4, !dbg !1229
  %1225 = icmp ne i32 %1224, 0, !dbg !1228
  br i1 %1225, label %1226, label %1238, !dbg !1228

; <label>:1226                                    ; preds = %1220
  %1227 = sext i32 %219 to i64, !dbg !1230
  %1228 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1227, !dbg !1230
  %1229 = load i32* %1228, align 4, !dbg !1230
  %1230 = sub nsw i32 %222, %1229, !dbg !1231
  %1231 = sub nsw i32 %1230, 1, !dbg !1231
  %1232 = sext i32 %1231 to i64, !dbg !1232
  %1233 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1232, !dbg !1232
  %1234 = load i32* %1233, align 4, !dbg !1232
  %1235 = mul nsw i32 9, %1234, !dbg !1233
  %1236 = load i32* %score, align 4, !dbg !1234
  %1237 = add nsw i32 %1236, %1235, !dbg !1234
  store i32 %1237, i32* %score, align 4, !dbg !1234
  br label %1241, !dbg !1234

; <label>:1238                                    ; preds = %1220, %1215
  %1239 = load i32* %score, align 4, !dbg !1235
  %1240 = add nsw i32 %1239, 22, !dbg !1235
  store i32 %1240, i32* %score, align 4, !dbg !1235
  br label %1241

; <label>:1241                                    ; preds = %1238, %1226
  %1242 = add nsw i32 %219, 1, !dbg !1236
  %1243 = sext i32 %1242 to i64, !dbg !1238
  %1244 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1243, !dbg !1238
  %1245 = load i32* %1244, align 4, !dbg !1238
  %1246 = icmp sgt i32 %222, %1245, !dbg !1239
  br i1 %1246, label %1247, label %1267, !dbg !1240

; <label>:1247                                    ; preds = %1241
  %1248 = add nsw i32 %219, 1, !dbg !1241
  %1249 = sext i32 %1248 to i64, !dbg !1243
  %1250 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !1243
  %1251 = getelementptr inbounds [11 x i32]* %1250, i32 0, i64 %1249, !dbg !1243
  %1252 = load i32* %1251, align 4, !dbg !1243
  %1253 = icmp ne i32 %1252, 0, !dbg !1240
  br i1 %1253, label %1254, label %1267, !dbg !1240

; <label>:1254                                    ; preds = %1247
  %1255 = add nsw i32 %219, 1, !dbg !1244
  %1256 = sext i32 %1255 to i64, !dbg !1245
  %1257 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1256, !dbg !1245
  %1258 = load i32* %1257, align 4, !dbg !1245
  %1259 = sub nsw i32 %222, %1258, !dbg !1246
  %1260 = sub nsw i32 %1259, 1, !dbg !1246
  %1261 = sext i32 %1260 to i64, !dbg !1247
  %1262 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1261, !dbg !1247
  %1263 = load i32* %1262, align 4, !dbg !1247
  %1264 = mul nsw i32 8, %1263, !dbg !1248
  %1265 = load i32* %score, align 4, !dbg !1249
  %1266 = add nsw i32 %1265, %1264, !dbg !1249
  store i32 %1266, i32* %score, align 4, !dbg !1249
  br label %1270, !dbg !1249

; <label>:1267                                    ; preds = %1247, %1241
  %1268 = load i32* %score, align 4, !dbg !1250
  %1269 = add nsw i32 %1268, 16, !dbg !1250
  store i32 %1269, i32* %score, align 4, !dbg !1250
  br label %1270

; <label>:1270                                    ; preds = %1267, %1254
  %1271 = sub nsw i32 %219, 1, !dbg !1251
  %1272 = sext i32 %1271 to i64, !dbg !1253
  %1273 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1272, !dbg !1253
  %1274 = load i32* %1273, align 4, !dbg !1253
  %1275 = icmp sgt i32 %222, %1274, !dbg !1254
  br i1 %1275, label %1276, label %1296, !dbg !1255

; <label>:1276                                    ; preds = %1270
  %1277 = sub nsw i32 %219, 1, !dbg !1256
  %1278 = sext i32 %1277 to i64, !dbg !1258
  %1279 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !1258
  %1280 = getelementptr inbounds [11 x i32]* %1279, i32 0, i64 %1278, !dbg !1258
  %1281 = load i32* %1280, align 4, !dbg !1258
  %1282 = icmp ne i32 %1281, 0, !dbg !1255
  br i1 %1282, label %1283, label %1296, !dbg !1255

; <label>:1283                                    ; preds = %1276
  %1284 = sub nsw i32 %219, 1, !dbg !1259
  %1285 = sext i32 %1284 to i64, !dbg !1260
  %1286 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1285, !dbg !1260
  %1287 = load i32* %1286, align 4, !dbg !1260
  %1288 = sub nsw i32 %222, %1287, !dbg !1261
  %1289 = sub nsw i32 %1288, 1, !dbg !1261
  %1290 = sext i32 %1289 to i64, !dbg !1262
  %1291 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1290, !dbg !1262
  %1292 = load i32* %1291, align 4, !dbg !1262
  %1293 = mul nsw i32 8, %1292, !dbg !1263
  %1294 = load i32* %score, align 4, !dbg !1264
  %1295 = add nsw i32 %1294, %1293, !dbg !1264
  store i32 %1295, i32* %score, align 4, !dbg !1264
  br label %1299, !dbg !1264

; <label>:1296                                    ; preds = %1276, %1270
  %1297 = load i32* %score, align 4, !dbg !1265
  %1298 = add nsw i32 %1297, 16, !dbg !1265
  store i32 %1298, i32* %score, align 4, !dbg !1265
  br label %1299

; <label>:1299                                    ; preds = %1296, %1283
  br label %1303, !dbg !1266

; <label>:1300                                    ; preds = %1209, %1203
  %1301 = load i32* %score, align 4, !dbg !1267
  %1302 = add nsw i32 %1301, 10, !dbg !1267
  store i32 %1302, i32* %score, align 4, !dbg !1267
  br label %1303

; <label>:1303                                    ; preds = %1300, %1299
  br label %1310, !dbg !1269

; <label>:1304                                    ; preds = %1166
  %1305 = sext i32 %194 to i64, !dbg !1270
  %1306 = getelementptr inbounds [144 x i32]* @send_king, i32 0, i64 %1305, !dbg !1270
  %1307 = load i32* %1306, align 4, !dbg !1270
  %1308 = load i32* %score, align 4, !dbg !1272
  %1309 = sub nsw i32 %1308, %1307, !dbg !1272
  store i32 %1309, i32* %score, align 4, !dbg !1272
  br label %1310

; <label>:1310                                    ; preds = %1304, %1303
  br label %1311, !dbg !1273

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
  br label %1312, !dbg !1274

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
  %1313 = add nsw i32 %j.1, 1, !dbg !1275
  call void @llvm.dbg.value(metadata i32 %1313, i64 0, metadata !535, metadata !85), !dbg !536
  br label %188, !dbg !1276

; <label>:1314                                    ; preds = %188
  %1315 = load i32* @wmat, align 4, !dbg !1277
  %1316 = icmp sgt i32 %1315, 2200, !dbg !1277
  br i1 %1316, label %1320, label %1317, !dbg !1279

; <label>:1317                                    ; preds = %1314
  %1318 = load i32* @bmat, align 4, !dbg !1280
  %1319 = icmp sgt i32 %1318, 2200, !dbg !1280
  br i1 %1319, label %1320, label %1357, !dbg !1279

; <label>:1320                                    ; preds = %1317, %1314
  %1321 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 41), align 4, !dbg !1282
  %1322 = icmp ne i32 %1321, 0, !dbg !1285
  br i1 %1322, label %1329, label %1323, !dbg !1285

; <label>:1323                                    ; preds = %1320
  %1324 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 53), align 4, !dbg !1286
  %1325 = icmp ne i32 %1324, 13, !dbg !1286
  br i1 %1325, label %1326, label %1329, !dbg !1285

; <label>:1326                                    ; preds = %1323
  %1327 = load i32* %score, align 4, !dbg !1288
  %1328 = sub nsw i32 %1327, 5, !dbg !1288
  store i32 %1328, i32* %score, align 4, !dbg !1288
  br label %1329, !dbg !1288

; <label>:1329                                    ; preds = %1326, %1323, %1320
  %1330 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 42), align 4, !dbg !1289
  %1331 = icmp ne i32 %1330, 0, !dbg !1291
  br i1 %1331, label %1338, label %1332, !dbg !1291

; <label>:1332                                    ; preds = %1329
  %1333 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 54), align 4, !dbg !1292
  %1334 = icmp ne i32 %1333, 13, !dbg !1292
  br i1 %1334, label %1335, label %1338, !dbg !1291

; <label>:1335                                    ; preds = %1332
  %1336 = load i32* %score, align 4, !dbg !1294
  %1337 = sub nsw i32 %1336, 5, !dbg !1294
  store i32 %1337, i32* %score, align 4, !dbg !1294
  br label %1338, !dbg !1294

; <label>:1338                                    ; preds = %1335, %1332, %1329
  %1339 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 101), align 4, !dbg !1295
  %1340 = icmp ne i32 %1339, 0, !dbg !1297
  br i1 %1340, label %1347, label %1341, !dbg !1297

; <label>:1341                                    ; preds = %1338
  %1342 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 89), align 4, !dbg !1298
  %1343 = icmp ne i32 %1342, 13, !dbg !1298
  br i1 %1343, label %1344, label %1347, !dbg !1297

; <label>:1344                                    ; preds = %1341
  %1345 = load i32* %score, align 4, !dbg !1300
  %1346 = add nsw i32 %1345, 5, !dbg !1300
  store i32 %1346, i32* %score, align 4, !dbg !1300
  br label %1347, !dbg !1300

; <label>:1347                                    ; preds = %1344, %1341, %1338
  %1348 = load i32* getelementptr inbounds ([144 x i32]* @moved, i32 0, i64 102), align 4, !dbg !1301
  %1349 = icmp ne i32 %1348, 0, !dbg !1303
  br i1 %1349, label %1356, label %1350, !dbg !1303

; <label>:1350                                    ; preds = %1347
  %1351 = load i32* getelementptr inbounds ([144 x i32]* @board, i32 0, i64 90), align 4, !dbg !1304
  %1352 = icmp ne i32 %1351, 13, !dbg !1304
  br i1 %1352, label %1353, label %1356, !dbg !1303

; <label>:1353                                    ; preds = %1350
  %1354 = load i32* %score, align 4, !dbg !1306
  %1355 = add nsw i32 %1354, 5, !dbg !1306
  store i32 %1355, i32* %score, align 4, !dbg !1306
  br label %1356, !dbg !1306

; <label>:1356                                    ; preds = %1353, %1350, %1347
  br label %1357, !dbg !1307

; <label>:1357                                    ; preds = %1356, %1317
  %1358 = load i32* @wmat, align 4, !dbg !1308
  %1359 = icmp sgt i32 %1358, 1300, !dbg !1308
  br i1 %1359, label %1363, label %1360, !dbg !1310

; <label>:1360                                    ; preds = %1357
  %1361 = load i32* @bmat, align 4, !dbg !1311
  %1362 = icmp sgt i32 %1361, 1300, !dbg !1311
  br i1 %1362, label %1363, label %1480, !dbg !1310

; <label>:1363                                    ; preds = %1360, %1357
  %1364 = load i32* @wking_loc, align 4, !dbg !1313
  %1365 = sext i32 %1364 to i64, !dbg !1313
  %1366 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1365, !dbg !1313
  %1367 = load i32* %1366, align 4, !dbg !1313
  %1368 = add nsw i32 %1367, 1, !dbg !1313
  call void @llvm.dbg.value(metadata i32 %1368, i64 0, metadata !1315, metadata !85), !dbg !1316
  %1369 = load i32* @bking_loc, align 4, !dbg !1317
  %1370 = sext i32 %1369 to i64, !dbg !1317
  %1371 = getelementptr inbounds [144 x i32]* @Xfile, i32 0, i64 %1370, !dbg !1317
  %1372 = load i32* %1371, align 4, !dbg !1317
  %1373 = add nsw i32 %1372, 1, !dbg !1317
  call void @llvm.dbg.value(metadata i32 %1373, i64 0, metadata !1318, metadata !85), !dbg !1319
  %1374 = sub nsw i32 %1368, %1373, !dbg !1320
  %1375 = call i32 @abs(i32 %1374) #1, !dbg !1322
  %1376 = icmp sgt i32 %1375, 2, !dbg !1322
  br i1 %1376, label %1377, label %1479, !dbg !1323

; <label>:1377                                    ; preds = %1363
  %1378 = sext i32 %1368 to i64, !dbg !1324
  %1379 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1378, !dbg !1324
  %1380 = load i32* %1379, align 4, !dbg !1324
  %1381 = sext i32 %1380 to i64, !dbg !1326
  %1382 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1381, !dbg !1326
  %1383 = load i32* %1382, align 4, !dbg !1326
  %1384 = sub nsw i32 %1383, 2, !dbg !1326
  %1385 = mul nsw i32 3, %1384, !dbg !1327
  %1386 = add nsw i32 0, %1385, !dbg !1328
  call void @llvm.dbg.value(metadata i32 %1386, i64 0, metadata !616, metadata !85), !dbg !617
  %1387 = add nsw i32 %1368, 1, !dbg !1329
  %1388 = sext i32 %1387 to i64, !dbg !1330
  %1389 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1388, !dbg !1330
  %1390 = load i32* %1389, align 4, !dbg !1330
  %1391 = sext i32 %1390 to i64, !dbg !1331
  %1392 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1391, !dbg !1331
  %1393 = load i32* %1392, align 4, !dbg !1331
  %1394 = sub nsw i32 %1393, 2, !dbg !1331
  %1395 = mul nsw i32 3, %1394, !dbg !1332
  %1396 = add nsw i32 %1386, %1395, !dbg !1333
  call void @llvm.dbg.value(metadata i32 %1396, i64 0, metadata !616, metadata !85), !dbg !617
  %1397 = sub nsw i32 %1368, 1, !dbg !1334
  %1398 = sext i32 %1397 to i64, !dbg !1335
  %1399 = getelementptr inbounds [11 x i32]* %black_back_pawn, i32 0, i64 %1398, !dbg !1335
  %1400 = load i32* %1399, align 4, !dbg !1335
  %1401 = sext i32 %1400 to i64, !dbg !1336
  %1402 = getelementptr inbounds [9 x i32]* @srev_rank, i32 0, i64 %1401, !dbg !1336
  %1403 = load i32* %1402, align 4, !dbg !1336
  %1404 = sub nsw i32 %1403, 2, !dbg !1336
  %1405 = mul nsw i32 3, %1404, !dbg !1337
  %1406 = add nsw i32 %1396, %1405, !dbg !1338
  call void @llvm.dbg.value(metadata i32 %1406, i64 0, metadata !616, metadata !85), !dbg !617
  %1407 = sext i32 %1373 to i64, !dbg !1339
  %1408 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1407, !dbg !1339
  %1409 = load i32* %1408, align 4, !dbg !1339
  %1410 = sub nsw i32 %1409, 2, !dbg !1339
  %1411 = mul nsw i32 3, %1410, !dbg !1340
  %1412 = add nsw i32 0, %1411, !dbg !1341
  call void @llvm.dbg.value(metadata i32 %1412, i64 0, metadata !618, metadata !85), !dbg !619
  %1413 = add nsw i32 %1373, 1, !dbg !1342
  %1414 = sext i32 %1413 to i64, !dbg !1343
  %1415 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1414, !dbg !1343
  %1416 = load i32* %1415, align 4, !dbg !1343
  %1417 = sub nsw i32 %1416, 2, !dbg !1343
  %1418 = mul nsw i32 3, %1417, !dbg !1344
  %1419 = add nsw i32 %1412, %1418, !dbg !1345
  call void @llvm.dbg.value(metadata i32 %1419, i64 0, metadata !618, metadata !85), !dbg !619
  %1420 = sub nsw i32 %1373, 1, !dbg !1346
  %1421 = sext i32 %1420 to i64, !dbg !1347
  %1422 = getelementptr inbounds [11 x i32]* %white_back_pawn, i32 0, i64 %1421, !dbg !1347
  %1423 = load i32* %1422, align 4, !dbg !1347
  %1424 = sub nsw i32 %1423, 2, !dbg !1347
  %1425 = mul nsw i32 3, %1424, !dbg !1348
  %1426 = add nsw i32 %1419, %1425, !dbg !1349
  call void @llvm.dbg.value(metadata i32 %1426, i64 0, metadata !618, metadata !85), !dbg !619
  %1427 = sext i32 %1368 to i64, !dbg !1350
  %1428 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !1350
  %1429 = getelementptr inbounds [11 x i32]* %1428, i32 0, i64 %1427, !dbg !1350
  %1430 = load i32* %1429, align 4, !dbg !1350
  %1431 = icmp ne i32 %1430, 0, !dbg !1352
  br i1 %1431, label %1434, label %1432, !dbg !1352

; <label>:1432                                    ; preds = %1377
  %1433 = add nsw i32 %1406, 8, !dbg !1353
  call void @llvm.dbg.value(metadata i32 %1433, i64 0, metadata !616, metadata !85), !dbg !617
  br label %1434, !dbg !1353

; <label>:1434                                    ; preds = %1432, %1377
  %wksafety.0 = phi i32 [ %1406, %1377 ], [ %1433, %1432 ]
  %1435 = add nsw i32 %1368, 1, !dbg !1354
  %1436 = sext i32 %1435 to i64, !dbg !1356
  %1437 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !1356
  %1438 = getelementptr inbounds [11 x i32]* %1437, i32 0, i64 %1436, !dbg !1356
  %1439 = load i32* %1438, align 4, !dbg !1356
  %1440 = icmp ne i32 %1439, 0, !dbg !1357
  br i1 %1440, label %1443, label %1441, !dbg !1357

; <label>:1441                                    ; preds = %1434
  %1442 = add nsw i32 %wksafety.0, 6, !dbg !1358
  call void @llvm.dbg.value(metadata i32 %1442, i64 0, metadata !616, metadata !85), !dbg !617
  br label %1443, !dbg !1358

; <label>:1443                                    ; preds = %1441, %1434
  %wksafety.1 = phi i32 [ %wksafety.0, %1434 ], [ %1442, %1441 ]
  %1444 = sub nsw i32 %1368, 1, !dbg !1359
  %1445 = sext i32 %1444 to i64, !dbg !1361
  %1446 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 0, !dbg !1361
  %1447 = getelementptr inbounds [11 x i32]* %1446, i32 0, i64 %1445, !dbg !1361
  %1448 = load i32* %1447, align 4, !dbg !1361
  %1449 = icmp ne i32 %1448, 0, !dbg !1362
  br i1 %1449, label %1452, label %1450, !dbg !1362

; <label>:1450                                    ; preds = %1443
  %1451 = add nsw i32 %wksafety.1, 6, !dbg !1363
  call void @llvm.dbg.value(metadata i32 %1451, i64 0, metadata !616, metadata !85), !dbg !617
  br label %1452, !dbg !1363

; <label>:1452                                    ; preds = %1450, %1443
  %wksafety.2 = phi i32 [ %wksafety.1, %1443 ], [ %1451, %1450 ]
  %1453 = sext i32 %1373 to i64, !dbg !1364
  %1454 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !1364
  %1455 = getelementptr inbounds [11 x i32]* %1454, i32 0, i64 %1453, !dbg !1364
  %1456 = load i32* %1455, align 4, !dbg !1364
  %1457 = icmp ne i32 %1456, 0, !dbg !1366
  br i1 %1457, label %1460, label %1458, !dbg !1366

; <label>:1458                                    ; preds = %1452
  %1459 = add nsw i32 %1426, 8, !dbg !1367
  call void @llvm.dbg.value(metadata i32 %1459, i64 0, metadata !618, metadata !85), !dbg !619
  br label %1460, !dbg !1367

; <label>:1460                                    ; preds = %1458, %1452
  %bksafety.0 = phi i32 [ %1426, %1452 ], [ %1459, %1458 ]
  %1461 = add nsw i32 %1373, 1, !dbg !1368
  %1462 = sext i32 %1461 to i64, !dbg !1370
  %1463 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !1370
  %1464 = getelementptr inbounds [11 x i32]* %1463, i32 0, i64 %1462, !dbg !1370
  %1465 = load i32* %1464, align 4, !dbg !1370
  %1466 = icmp ne i32 %1465, 0, !dbg !1371
  br i1 %1466, label %1469, label %1467, !dbg !1371

; <label>:1467                                    ; preds = %1460
  %1468 = add nsw i32 %bksafety.0, 6, !dbg !1372
  call void @llvm.dbg.value(metadata i32 %1468, i64 0, metadata !618, metadata !85), !dbg !619
  br label %1469, !dbg !1372

; <label>:1469                                    ; preds = %1467, %1460
  %bksafety.1 = phi i32 [ %bksafety.0, %1460 ], [ %1468, %1467 ]
  %1470 = sub nsw i32 %1373, 1, !dbg !1373
  %1471 = sext i32 %1470 to i64, !dbg !1375
  %1472 = getelementptr inbounds [2 x [11 x i32]]* %pawns, i32 0, i64 1, !dbg !1375
  %1473 = getelementptr inbounds [11 x i32]* %1472, i32 0, i64 %1471, !dbg !1375
  %1474 = load i32* %1473, align 4, !dbg !1375
  %1475 = icmp ne i32 %1474, 0, !dbg !1376
  br i1 %1475, label %1478, label %1476, !dbg !1376

; <label>:1476                                    ; preds = %1469
  %1477 = add nsw i32 %bksafety.1, 6, !dbg !1377
  call void @llvm.dbg.value(metadata i32 %1477, i64 0, metadata !618, metadata !85), !dbg !619
  br label %1478, !dbg !1377

; <label>:1478                                    ; preds = %1476, %1469
  %bksafety.2 = phi i32 [ %bksafety.1, %1469 ], [ %1477, %1476 ]
  br label %1479, !dbg !1378

; <label>:1479                                    ; preds = %1478, %1363
  %wksafety.3 = phi i32 [ %wksafety.2, %1478 ], [ 0, %1363 ]
  %bksafety.3 = phi i32 [ %bksafety.2, %1478 ], [ 0, %1363 ]
  br label %1480, !dbg !1379

; <label>:1480                                    ; preds = %1479, %1360
  %wksafety.4 = phi i32 [ %wksafety.3, %1479 ], [ 0, %1360 ]
  %bksafety.4 = phi i32 [ %bksafety.3, %1479 ], [ 0, %1360 ]
  %1481 = load i32* @bmat, align 4, !dbg !1380
  %1482 = icmp sgt i32 %1481, 1300, !dbg !1380
  br i1 %1482, label %1483, label %1488, !dbg !1382

; <label>:1483                                    ; preds = %1480
  %1484 = icmp ne i32 %bq.0, 0, !dbg !1382
  br i1 %1484, label %1485, label %1488, !dbg !1382

; <label>:1485                                    ; preds = %1483
  %1486 = load i32* %score, align 4, !dbg !1383
  %1487 = sub nsw i32 %1486, %wksafety.4, !dbg !1383
  store i32 %1487, i32* %score, align 4, !dbg !1383
  br label %1488, !dbg !1385

; <label>:1488                                    ; preds = %1485, %1483, %1480
  %1489 = load i32* @wmat, align 4, !dbg !1386
  %1490 = icmp sgt i32 %1489, 1300, !dbg !1386
  br i1 %1490, label %1491, label %1496, !dbg !1388

; <label>:1491                                    ; preds = %1488
  %1492 = icmp ne i32 %wq.0, 0, !dbg !1388
  br i1 %1492, label %1493, label %1496, !dbg !1388

; <label>:1493                                    ; preds = %1491
  %1494 = load i32* %score, align 4, !dbg !1389
  %1495 = add nsw i32 %1494, %bksafety.4, !dbg !1389
  store i32 %1495, i32* %score, align 4, !dbg !1389
  br label %1496, !dbg !1391

; <label>:1496                                    ; preds = %1493, %1491, %1488
  %1497 = icmp ne i32 %wr.0, 0, !dbg !1392
  br i1 %1497, label %1507, label %1498, !dbg !1392

; <label>:1498                                    ; preds = %1496
  %1499 = icmp ne i32 %wq.0, 0, !dbg !1392
  br i1 %1499, label %1507, label %1500, !dbg !1392

; <label>:1500                                    ; preds = %1498
  %1501 = icmp ne i32 %wb.0, 0, !dbg !1392
  br i1 %1501, label %1507, label %1502, !dbg !1392

; <label>:1502                                    ; preds = %1500
  %1503 = icmp ne i32 %wn.0, 0, !dbg !1392
  br i1 %1503, label %1507, label %1504, !dbg !1392

; <label>:1504                                    ; preds = %1502
  %1505 = load i32* %score, align 4, !dbg !1393
  %1506 = add nsw i32 %1505, %bpotential.0, !dbg !1393
  store i32 %1506, i32* %score, align 4, !dbg !1393
  br label %1507, !dbg !1396

; <label>:1507                                    ; preds = %1504, %1502, %1500, %1498, %1496
  %1508 = icmp ne i32 %br.0, 0, !dbg !1397
  br i1 %1508, label %1518, label %1509, !dbg !1397

; <label>:1509                                    ; preds = %1507
  %1510 = icmp ne i32 %bq.0, 0, !dbg !1397
  br i1 %1510, label %1518, label %1511, !dbg !1397

; <label>:1511                                    ; preds = %1509
  %1512 = icmp ne i32 %bb.0, 0, !dbg !1397
  br i1 %1512, label %1518, label %1513, !dbg !1397

; <label>:1513                                    ; preds = %1511
  %1514 = icmp ne i32 %bn.0, 0, !dbg !1397
  br i1 %1514, label %1518, label %1515, !dbg !1397

; <label>:1515                                    ; preds = %1513
  %1516 = load i32* %score, align 4, !dbg !1398
  %1517 = add nsw i32 %1516, %wpotential.0, !dbg !1398
  store i32 %1517, i32* %score, align 4, !dbg !1398
  br label %1518, !dbg !1401

; <label>:1518                                    ; preds = %1515, %1513, %1511, %1509, %1507
  %1519 = icmp ne i32 %wp.0, 0, !dbg !1402
  br i1 %1519, label %1622, label %1520, !dbg !1402

; <label>:1520                                    ; preds = %1518
  %1521 = icmp ne i32 %bp.0, 0, !dbg !1402
  br i1 %1521, label %1622, label %1522, !dbg !1402

; <label>:1522                                    ; preds = %1520
  %1523 = icmp ne i32 %wr.0, 0, !dbg !1403
  br i1 %1523, label %1571, label %1524, !dbg !1403

; <label>:1524                                    ; preds = %1522
  %1525 = icmp ne i32 %br.0, 0, !dbg !1403
  br i1 %1525, label %1571, label %1526, !dbg !1403

; <label>:1526                                    ; preds = %1524
  %1527 = icmp ne i32 %wq.0, 0, !dbg !1403
  br i1 %1527, label %1571, label %1528, !dbg !1403

; <label>:1528                                    ; preds = %1526
  %1529 = icmp ne i32 %bq.0, 0, !dbg !1403
  br i1 %1529, label %1571, label %1530, !dbg !1403

; <label>:1530                                    ; preds = %1528
  %1531 = icmp ne i32 %bb.0, 0, !dbg !1406
  br i1 %1531, label %1540, label %1532, !dbg !1406

; <label>:1532                                    ; preds = %1530
  %1533 = icmp ne i32 %wb.0, 0, !dbg !1406
  br i1 %1533, label %1540, label %1534, !dbg !1406

; <label>:1534                                    ; preds = %1532
  %1535 = icmp slt i32 %wn.0, 3, !dbg !1409
  br i1 %1535, label %1536, label %1539, !dbg !1413

; <label>:1536                                    ; preds = %1534
  %1537 = icmp slt i32 %bn.0, 3, !dbg !1414
  br i1 %1537, label %1538, label %1539, !dbg !1413

; <label>:1538                                    ; preds = %1536
  store i32 0, i32* %score, align 4, !dbg !1416
  br label %1539, !dbg !1418

; <label>:1539                                    ; preds = %1538, %1536, %1534
  br label %1570, !dbg !1419

; <label>:1540                                    ; preds = %1532, %1530
  %1541 = icmp ne i32 %wn.0, 0, !dbg !1420
  br i1 %1541, label %1550, label %1542, !dbg !1420

; <label>:1542                                    ; preds = %1540
  %1543 = icmp ne i32 %bn.0, 0, !dbg !1420
  br i1 %1543, label %1550, label %1544, !dbg !1420

; <label>:1544                                    ; preds = %1542
  %1545 = sub nsw i32 %wb.0, %bb.0, !dbg !1421
  %1546 = call i32 @abs(i32 %1545) #1, !dbg !1425
  %1547 = icmp slt i32 %1546, 2, !dbg !1425
  br i1 %1547, label %1548, label %1549, !dbg !1426

; <label>:1548                                    ; preds = %1544
  store i32 0, i32* %score, align 4, !dbg !1427
  br label %1549, !dbg !1429

; <label>:1549                                    ; preds = %1548, %1544
  br label %1569, !dbg !1430

; <label>:1550                                    ; preds = %1542, %1540
  %1551 = icmp slt i32 %wn.0, 3, !dbg !1431
  br i1 %1551, label %1552, label %1554, !dbg !1433

; <label>:1552                                    ; preds = %1550
  %1553 = icmp ne i32 %wb.0, 0, !dbg !1433
  br i1 %1553, label %1554, label %1558, !dbg !1433

; <label>:1554                                    ; preds = %1552, %1550
  %1555 = icmp eq i32 %wb.0, 1, !dbg !1434
  br i1 %1555, label %1556, label %1568, !dbg !1433

; <label>:1556                                    ; preds = %1554
  %1557 = icmp ne i32 %wn.0, 0, !dbg !1433
  br i1 %1557, label %1568, label %1558, !dbg !1433

; <label>:1558                                    ; preds = %1556, %1552
  %1559 = icmp slt i32 %bn.0, 3, !dbg !1437
  br i1 %1559, label %1560, label %1562, !dbg !1440

; <label>:1560                                    ; preds = %1558
  %1561 = icmp ne i32 %bb.0, 0, !dbg !1440
  br i1 %1561, label %1562, label %1566, !dbg !1440

; <label>:1562                                    ; preds = %1560, %1558
  %1563 = icmp eq i32 %bb.0, 1, !dbg !1441
  br i1 %1563, label %1564, label %1567, !dbg !1440

; <label>:1564                                    ; preds = %1562
  %1565 = icmp ne i32 %bn.0, 0, !dbg !1440
  br i1 %1565, label %1567, label %1566, !dbg !1440

; <label>:1566                                    ; preds = %1564, %1560
  store i32 0, i32* %score, align 4, !dbg !1444
  br label %1567, !dbg !1446

; <label>:1567                                    ; preds = %1566, %1564, %1562
  br label %1568, !dbg !1447

; <label>:1568                                    ; preds = %1567, %1556, %1554
  br label %1569

; <label>:1569                                    ; preds = %1568, %1549
  br label %1570

; <label>:1570                                    ; preds = %1569, %1539
  br label %1621, !dbg !1448

; <label>:1571                                    ; preds = %1528, %1526, %1524, %1522
  %1572 = icmp ne i32 %wq.0, 0, !dbg !1449
  br i1 %1572, label %1620, label %1573, !dbg !1449

; <label>:1573                                    ; preds = %1571
  %1574 = icmp ne i32 %bq.0, 0, !dbg !1449
  br i1 %1574, label %1620, label %1575, !dbg !1449

; <label>:1575                                    ; preds = %1573
  %1576 = icmp eq i32 %wr.0, 1, !dbg !1450
  br i1 %1576, label %1577, label %1587, !dbg !1454

; <label>:1577                                    ; preds = %1575
  %1578 = icmp eq i32 %br.0, 1, !dbg !1455
  br i1 %1578, label %1579, label %1587, !dbg !1454

; <label>:1579                                    ; preds = %1577
  %1580 = add nsw i32 %wn.0, %wb.0, !dbg !1457
  %1581 = icmp slt i32 %1580, 2, !dbg !1460
  br i1 %1581, label %1582, label %1586, !dbg !1461

; <label>:1582                                    ; preds = %1579
  %1583 = add nsw i32 %bn.0, %bb.0, !dbg !1462
  %1584 = icmp slt i32 %1583, 2, !dbg !1463
  br i1 %1584, label %1585, label %1586, !dbg !1461

; <label>:1585                                    ; preds = %1582
  store i32 0, i32* %score, align 4, !dbg !1464
  br label %1586, !dbg !1466

; <label>:1586                                    ; preds = %1585, %1582, %1579
  br label %1619, !dbg !1467

; <label>:1587                                    ; preds = %1577, %1575
  %1588 = icmp eq i32 %wr.0, 1, !dbg !1468
  br i1 %1588, label %1589, label %1602, !dbg !1470

; <label>:1589                                    ; preds = %1587
  %1590 = icmp ne i32 %br.0, 0, !dbg !1470
  br i1 %1590, label %1602, label %1591, !dbg !1470

; <label>:1591                                    ; preds = %1589
  %1592 = add nsw i32 %wn.0, %wb.0, !dbg !1471
  %1593 = icmp eq i32 %1592, 0, !dbg !1471
  br i1 %1593, label %1594, label %1601, !dbg !1474

; <label>:1594                                    ; preds = %1591
  %1595 = add nsw i32 %bn.0, %bb.0, !dbg !1475
  %1596 = icmp eq i32 %1595, 1, !dbg !1476
  br i1 %1596, label %1600, label %1597, !dbg !1474

; <label>:1597                                    ; preds = %1594
  %1598 = add nsw i32 %bn.0, %bb.0, !dbg !1477
  %1599 = icmp eq i32 %1598, 2, !dbg !1478
  br i1 %1599, label %1600, label %1601, !dbg !1474

; <label>:1600                                    ; preds = %1597, %1594
  store i32 0, i32* %score, align 4, !dbg !1479
  br label %1601, !dbg !1481

; <label>:1601                                    ; preds = %1600, %1597, %1591
  br label %1618, !dbg !1482

; <label>:1602                                    ; preds = %1589, %1587
  %1603 = icmp eq i32 %br.0, 1, !dbg !1483
  br i1 %1603, label %1604, label %1617, !dbg !1485

; <label>:1604                                    ; preds = %1602
  %1605 = icmp ne i32 %wr.0, 0, !dbg !1485
  br i1 %1605, label %1617, label %1606, !dbg !1485

; <label>:1606                                    ; preds = %1604
  %1607 = add nsw i32 %bn.0, %bb.0, !dbg !1486
  %1608 = icmp eq i32 %1607, 0, !dbg !1486
  br i1 %1608, label %1609, label %1616, !dbg !1489

; <label>:1609                                    ; preds = %1606
  %1610 = add nsw i32 %wn.0, %wb.0, !dbg !1490
  %1611 = icmp eq i32 %1610, 1, !dbg !1491
  br i1 %1611, label %1615, label %1612, !dbg !1489

; <label>:1612                                    ; preds = %1609
  %1613 = add nsw i32 %wn.0, %wb.0, !dbg !1492
  %1614 = icmp eq i32 %1613, 2, !dbg !1493
  br i1 %1614, label %1615, label %1616, !dbg !1489

; <label>:1615                                    ; preds = %1612, %1609
  store i32 0, i32* %score, align 4, !dbg !1494
  br label %1616, !dbg !1496

; <label>:1616                                    ; preds = %1615, %1612, %1606
  br label %1617, !dbg !1497

; <label>:1617                                    ; preds = %1616, %1604, %1602
  br label %1618

; <label>:1618                                    ; preds = %1617, %1601
  br label %1619

; <label>:1619                                    ; preds = %1618, %1586
  br label %1620, !dbg !1498

; <label>:1620                                    ; preds = %1619, %1573, %1571
  br label %1621

; <label>:1621                                    ; preds = %1620, %1570
  br label %1714, !dbg !1499

; <label>:1622                                    ; preds = %1520, %1518
  %1623 = add nsw i32 %wn.0, %wb.0, !dbg !1500
  %1624 = add nsw i32 %bn.0, %bb.0, !dbg !1503
  %1625 = icmp ne i32 %1623, %1624, !dbg !1504
  br i1 %1625, label %1626, label %1692, !dbg !1505

; <label>:1626                                    ; preds = %1622
  %1627 = add nsw i32 %wq.0, %wr.0, !dbg !1506
  %1628 = add nsw i32 %bq.0, %br.0, !dbg !1509
  %1629 = icmp eq i32 %1627, %1628, !dbg !1510
  br i1 %1629, label %1630, label %1641, !dbg !1511

; <label>:1630                                    ; preds = %1626
  %1631 = add nsw i32 %wn.0, %wb.0, !dbg !1512
  %1632 = add nsw i32 %bn.0, %bb.0, !dbg !1515
  %1633 = icmp sgt i32 %1631, %1632, !dbg !1516
  br i1 %1633, label %1634, label %1637, !dbg !1517

; <label>:1634                                    ; preds = %1630
  %1635 = load i32* %score, align 4, !dbg !1518
  %1636 = add nsw i32 %1635, 120, !dbg !1518
  store i32 %1636, i32* %score, align 4, !dbg !1518
  br label %1640, !dbg !1520

; <label>:1637                                    ; preds = %1630
  %1638 = load i32* %score, align 4, !dbg !1521
  %1639 = sub nsw i32 %1638, 120, !dbg !1521
  store i32 %1639, i32* %score, align 4, !dbg !1521
  br label %1640

; <label>:1640                                    ; preds = %1637, %1634
  br label %1691, !dbg !1523

; <label>:1641                                    ; preds = %1626
  %1642 = add nsw i32 %wr.0, %wq.0, !dbg !1524
  %1643 = add nsw i32 %br.0, %bq.0, !dbg !1526
  %1644 = sub nsw i32 %1642, %1643, !dbg !1527
  %1645 = call i32 @abs(i32 %1644) #1, !dbg !1528
  %1646 = icmp eq i32 %1645, 1, !dbg !1528
  br i1 %1646, label %1647, label %1665, !dbg !1529

; <label>:1647                                    ; preds = %1641
  %1648 = add nsw i32 %wb.0, %wn.0, !dbg !1530
  %1649 = add nsw i32 %bb.0, %bn.0, !dbg !1533
  %1650 = add nsw i32 %1649, 1, !dbg !1533
  %1651 = icmp sgt i32 %1648, %1650, !dbg !1534
  br i1 %1651, label %1652, label %1655, !dbg !1535

; <label>:1652                                    ; preds = %1647
  %1653 = load i32* %score, align 4, !dbg !1536
  %1654 = add nsw i32 %1653, 120, !dbg !1536
  store i32 %1654, i32* %score, align 4, !dbg !1536
  br label %1664, !dbg !1538

; <label>:1655                                    ; preds = %1647
  %1656 = add nsw i32 %bb.0, %bn.0, !dbg !1539
  %1657 = add nsw i32 %wb.0, %wn.0, !dbg !1541
  %1658 = add nsw i32 %1657, 1, !dbg !1541
  %1659 = icmp sgt i32 %1656, %1658, !dbg !1542
  br i1 %1659, label %1660, label %1663, !dbg !1543

; <label>:1660                                    ; preds = %1655
  %1661 = load i32* %score, align 4, !dbg !1544
  %1662 = sub nsw i32 %1661, 120, !dbg !1544
  store i32 %1662, i32* %score, align 4, !dbg !1544
  br label %1663, !dbg !1546

; <label>:1663                                    ; preds = %1660, %1655
  br label %1664

; <label>:1664                                    ; preds = %1663, %1652
  br label %1690, !dbg !1547

; <label>:1665                                    ; preds = %1641
  %1666 = add nsw i32 %wr.0, %wq.0, !dbg !1548
  %1667 = add nsw i32 %br.0, %bq.0, !dbg !1550
  %1668 = sub nsw i32 %1666, %1667, !dbg !1551
  %1669 = call i32 @abs(i32 %1668) #1, !dbg !1552
  %1670 = icmp eq i32 %1669, 2, !dbg !1552
  br i1 %1670, label %1671, label %1689, !dbg !1553

; <label>:1671                                    ; preds = %1665
  %1672 = add nsw i32 %wb.0, %wn.0, !dbg !1554
  %1673 = add nsw i32 %bb.0, %bn.0, !dbg !1557
  %1674 = add nsw i32 %1673, 2, !dbg !1557
  %1675 = icmp sgt i32 %1672, %1674, !dbg !1558
  br i1 %1675, label %1676, label %1679, !dbg !1559

; <label>:1676                                    ; preds = %1671
  %1677 = load i32* %score, align 4, !dbg !1560
  %1678 = add nsw i32 %1677, 120, !dbg !1560
  store i32 %1678, i32* %score, align 4, !dbg !1560
  br label %1688, !dbg !1562

; <label>:1679                                    ; preds = %1671
  %1680 = add nsw i32 %bb.0, %bn.0, !dbg !1563
  %1681 = add nsw i32 %wb.0, %wn.0, !dbg !1565
  %1682 = add nsw i32 %1681, 2, !dbg !1565
  %1683 = icmp sgt i32 %1680, %1682, !dbg !1566
  br i1 %1683, label %1684, label %1687, !dbg !1567

; <label>:1684                                    ; preds = %1679
  %1685 = load i32* %score, align 4, !dbg !1568
  %1686 = sub nsw i32 %1685, 120, !dbg !1568
  store i32 %1686, i32* %score, align 4, !dbg !1568
  br label %1687, !dbg !1570

; <label>:1687                                    ; preds = %1684, %1679
  br label %1688

; <label>:1688                                    ; preds = %1687, %1676
  br label %1689, !dbg !1571

; <label>:1689                                    ; preds = %1688, %1665
  br label %1690

; <label>:1690                                    ; preds = %1689, %1664
  br label %1691

; <label>:1691                                    ; preds = %1690, %1640
  br label %1713, !dbg !1572

; <label>:1692                                    ; preds = %1622
  %1693 = add nsw i32 %wq.0, %wr.0, !dbg !1573
  %1694 = add nsw i32 %bq.0, %br.0, !dbg !1575
  %1695 = icmp eq i32 %1693, %1694, !dbg !1576
  br i1 %1695, label %1696, label %1712, !dbg !1577

; <label>:1696                                    ; preds = %1692
  %1697 = icmp ne i32 %wq.0, 0, !dbg !1578
  br i1 %1697, label %1698, label %1703, !dbg !1578

; <label>:1698                                    ; preds = %1696
  %1699 = icmp ne i32 %bq.0, 0, !dbg !1578
  br i1 %1699, label %1703, label %1700, !dbg !1578

; <label>:1700                                    ; preds = %1698
  %1701 = load i32* %score, align 4, !dbg !1580
  %1702 = add nsw i32 %1701, 120, !dbg !1580
  store i32 %1702, i32* %score, align 4, !dbg !1580
  br label %1711, !dbg !1583

; <label>:1703                                    ; preds = %1698, %1696
  %1704 = icmp ne i32 %wq.0, 0, !dbg !1584
  br i1 %1704, label %1710, label %1705, !dbg !1584

; <label>:1705                                    ; preds = %1703
  %1706 = icmp ne i32 %bq.0, 0, !dbg !1584
  br i1 %1706, label %1707, label %1710, !dbg !1584

; <label>:1707                                    ; preds = %1705
  %1708 = load i32* %score, align 4, !dbg !1585
  %1709 = sub nsw i32 %1708, 120, !dbg !1585
  store i32 %1709, i32* %score, align 4, !dbg !1585
  br label %1710, !dbg !1588

; <label>:1710                                    ; preds = %1707, %1705, %1703
  br label %1711

; <label>:1711                                    ; preds = %1710, %1700
  br label %1712, !dbg !1589

; <label>:1712                                    ; preds = %1711, %1692
  br label %1713

; <label>:1713                                    ; preds = %1712, %1691
  br label %1714

; <label>:1714                                    ; preds = %1713, %1621
  %1715 = load i32* %score, align 4, !dbg !1590
  call void @storeECache(i32 %1715), !dbg !1591
  %1716 = load i32* @Material, align 4, !dbg !1592
  %1717 = load i32* %score, align 4, !dbg !1594
  %1718 = sub nsw i32 %1716, %1717, !dbg !1592
  %1719 = call i32 @abs(i32 %1718) #1, !dbg !1595
  %1720 = load i32* @maxposdiff, align 4, !dbg !1596
  %1721 = icmp sgt i32 %1719, %1720, !dbg !1595
  br i1 %1721, label %1722, label %1736, !dbg !1597

; <label>:1722                                    ; preds = %1714
  %1723 = load i32* @Material, align 4, !dbg !1598
  %1724 = load i32* %score, align 4, !dbg !1598
  %1725 = sub nsw i32 %1723, %1724, !dbg !1598
  %1726 = call i32 @abs(i32 %1725) #1, !dbg !1598
  %1727 = icmp slt i32 1000, %1726, !dbg !1598
  br i1 %1727, label %1728, label %1729, !dbg !1598

; <label>:1728                                    ; preds = %1722
  br label %1734, !dbg !1599

; <label>:1729                                    ; preds = %1722
  %1730 = load i32* @Material, align 4, !dbg !1601
  %1731 = load i32* %score, align 4, !dbg !1601
  %1732 = sub nsw i32 %1730, %1731, !dbg !1601
  %1733 = call i32 @abs(i32 %1732) #1, !dbg !1601
  br label %1734, !dbg !1601

; <label>:1734                                    ; preds = %1729, %1728
  %1735 = phi i32 [ 1000, %1728 ], [ %1733, %1729 ], !dbg !1598
  store i32 %1735, i32* @maxposdiff, align 4, !dbg !1603
  br label %1736, !dbg !1603

; <label>:1736                                    ; preds = %1734, %1714
  %1737 = load i32* @white_to_move, align 4, !dbg !1606
  %1738 = icmp eq i32 %1737, 1, !dbg !1606
  br i1 %1738, label %1739, label %1741, !dbg !1608

; <label>:1739                                    ; preds = %1736
  %1740 = load i32* %score, align 4, !dbg !1609
  br label %1744, !dbg !1611

; <label>:1741                                    ; preds = %1736
  %1742 = load i32* %score, align 4, !dbg !1612
  %1743 = sub nsw i32 0, %1742, !dbg !1614
  br label %1744, !dbg !1615

; <label>:1744                                    ; preds = %1741, %1739, %58, %56, %46, %21
  %.0 = phi i32 [ %24, %21 ], [ %49, %46 ], [ %57, %56 ], [ %60, %58 ], [ %1740, %1739 ], [ %1743, %1741 ]
  ret i32 %.0, !dbg !1616
}

declare void @checkECache(i32*, i32*) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #5

declare void @storeECache(i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!81, !82}
!llvm.ident = !{!83}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !8, !9, !29, !13} ; [ DW_TAG_compile_unit ] [/media/sf_shared/SPEC/C/sjeng/neval.c] [DW_LANG_C99]
!1 = !{!"neval.c", !"/media/sf_shared/SPEC/C/sjeng"}
!2 = !{!3}
!3 = !{!"0x4\00\0014\0032\0032\000\000\000", !4, null, null, !5, null, null, null} ; [ DW_TAG_enumeration_type ] [line 14, size 32, align 32, offset 0] [def] [from ]
!4 = !{!"./sjeng.h", !"/media/sf_shared/SPEC/C/sjeng"}
!5 = !{!6, !7}
!6 = !{!"0x28\00FALSE\000"}                       ; [ DW_TAG_enumerator ] [FALSE :: 0]
!7 = !{!"0x28\00TRUE\001"}                        ; [ DW_TAG_enumerator ] [TRUE :: 1]
!8 = !{null}
!9 = !{!10, !14, !18, !19, !20, !21, !22, !23, !24, !25, !28}
!10 = !{!"0x2e\00check_phase\00check_phase\00\00168\000\001\000\000\00256\000\00169", !1, !11, !12, null, void ()* @check_phase, null, null, !13} ; [ DW_TAG_subprogram ] [line 168] [def] [scope 169] [check_phase]
!11 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !8, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{}
!14 = !{!"0x2e\00King\00King\00\00235\000\001\000\000\00256\000\00235", !1, !11, !15, null, i32 (i32, i32)* @King, null, null, !13} ; [ DW_TAG_subprogram ] [line 235] [def] [King]
!15 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !16, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = !{!17, !17, !17}
!17 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!18 = !{!"0x2e\00Queen\00Queen\00\00255\000\001\000\000\00256\000\00255", !1, !11, !15, null, i32 (i32, i32)* @Queen, null, null, !13} ; [ DW_TAG_subprogram ] [line 255] [def] [Queen]
!19 = !{!"0x2e\00Rook\00Rook\00\00283\000\001\000\000\00256\000\00283", !1, !11, !15, null, i32 (i32, i32)* @Rook, null, null, !13} ; [ DW_TAG_subprogram ] [line 283] [def] [Rook]
!20 = !{!"0x2e\00Bishop\00Bishop\00\00322\000\001\000\000\00256\000\00322", !1, !11, !15, null, i32 (i32, i32)* @Bishop, null, null, !13} ; [ DW_TAG_subprogram ] [line 322] [def] [Bishop]
!21 = !{!"0x2e\00Knight\00Knight\00\00346\000\001\000\000\00256\000\00346", !1, !11, !15, null, i32 (i32, i32)* @Knight, null, null, !13} ; [ DW_TAG_subprogram ] [line 346] [def] [Knight]
!22 = !{!"0x2e\00Pawn\00Pawn\00\00360\000\001\000\000\00256\000\00360", !1, !11, !15, null, i32 (i32, i32)* @Pawn, null, null, !13} ; [ DW_TAG_subprogram ] [line 360] [def] [Pawn]
!23 = !{!"0x2e\00ErrorIt\00ErrorIt\00\00387\000\001\000\000\00256\000\00387", !1, !11, !15, null, i32 (i32, i32)* @ErrorIt, null, null, !13} ; [ DW_TAG_subprogram ] [line 387] [def] [ErrorIt]
!24 = !{!"0x2e\00std_eval\00std_eval\00\00392\000\001\000\000\00256\000\00392", !1, !11, !15, null, i32 (i32, i32)* @std_eval, null, null, !13} ; [ DW_TAG_subprogram ] [line 392] [def] [std_eval]
!25 = !{!"0x2e\00bishop_mobility\00bishop_mobility\00\00205\001\001\000\000\00256\000\00206", !1, !11, !26, null, i32 (i32)* @bishop_mobility, null, null, !13} ; [ DW_TAG_subprogram ] [line 205] [local] [def] [scope 206] [bishop_mobility]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{!17, !17}
!28 = !{!"0x2e\00rook_mobility\00rook_mobility\00\00220\001\001\000\000\00256\000\00221", !1, !11, !26, null, i32 (i32)* @rook_mobility, null, null, !13} ; [ DW_TAG_subprogram ] [line 220] [local] [def] [scope 221] [rook_mobility]
!29 = !{!30, !35, !36, !40, !41, !42, !43, !47, !48, !52, !53, !55, !56, !57, !61, !64, !65, !66, !67, !68, !74, !75, !76, !80}
!30 = !{!"0x34\00std_p_tropism\00std_p_tropism\00\00150\000\001", null, !11, !31, [8 x i32]* @std_p_tropism, null} ; [ DW_TAG_variable ] [std_p_tropism] [line 150] [def]
!31 = !{!"0x1\00\000\00256\0032\000\000\000", null, null, !32, !33, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 32, offset 0] [from ]
!32 = !{!"0x26\00\000\000\000\000\000", null, null, !17} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!33 = !{!34}
!34 = !{!"0x21\000\008"}                          ; [ DW_TAG_subrange_type ] [0, 7]
!35 = !{!"0x34\00std_own_p_tropism\00std_own_p_tropism\00\00153\000\001", null, !11, !31, [8 x i32]* @std_own_p_tropism, null} ; [ DW_TAG_variable ] [std_own_p_tropism] [line 153] [def]
!36 = !{!"0x34\00std_r_tropism\00std_r_tropism\00\00156\000\001", null, !11, !37, [16 x i32]* @std_r_tropism, null} ; [ DW_TAG_variable ] [std_r_tropism] [line 156] [def]
!37 = !{!"0x1\00\000\00512\0032\000\000\000", null, null, !32, !38, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 32, offset 0] [from ]
!38 = !{!39}
!39 = !{!"0x21\000\0016"}                         ; [ DW_TAG_subrange_type ] [0, 15]
!40 = !{!"0x34\00std_n_tropism\00std_n_tropism\00\00159\000\001", null, !11, !31, [8 x i32]* @std_n_tropism, null} ; [ DW_TAG_variable ] [std_n_tropism] [line 159] [def]
!41 = !{!"0x34\00std_q_tropism\00std_q_tropism\00\00162\000\001", null, !11, !31, [8 x i32]* @std_q_tropism, null} ; [ DW_TAG_variable ] [std_q_tropism] [line 162] [def]
!42 = !{!"0x34\00std_b_tropism\00std_b_tropism\00\00165\000\001", null, !11, !31, [8 x i32]* @std_b_tropism, null} ; [ DW_TAG_variable ] [std_b_tropism] [line 165] [def]
!43 = !{!"0x34\00square_d1\00square_d1\00\00284\001\001", !19, !11, !44, [2 x i32]* @Rook.square_d1, null} ; [ DW_TAG_variable ] [square_d1] [line 284] [local] [def]
!44 = !{!"0x1\00\000\0064\0032\000\000\000", null, null, !32, !45, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from ]
!45 = !{!46}
!46 = !{!"0x21\000\002"}                          ; [ DW_TAG_subrange_type ] [0, 1]
!47 = !{!"0x34\00maxposdiff\00maxposdiff\00\0033\000\001", null, !11, !17, i32* @maxposdiff, null} ; [ DW_TAG_variable ] [maxposdiff] [line 33] [def]
!48 = !{!"0x34\00distance\00distance\00\0038\000\001", null, !11, !49, [144 x [144 x i32]]* @distance, null} ; [ DW_TAG_variable ] [distance] [line 38] [def]
!49 = !{!"0x1\00\000\00663552\0032\000\000\000", null, null, !17, !50, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 663552, align 32, offset 0] [from int]
!50 = !{!51, !51}
!51 = !{!"0x21\000\00144"}                        ; [ DW_TAG_subrange_type ] [0, 143]
!52 = !{!"0x34\00rookdistance\00rookdistance\00\0039\000\001", null, !11, !49, [144 x [144 x i32]]* @rookdistance, null} ; [ DW_TAG_variable ] [rookdistance] [line 39] [def]
!53 = !{!"0x34\00king_locs\00king_locs\00\0040\000\001", null, !11, !54, [2 x i32]* @king_locs, null} ; [ DW_TAG_variable ] [king_locs] [line 40] [def]
!54 = !{!"0x1\00\000\0064\0032\000\000\000", null, null, !17, !45, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!55 = !{!"0x34\00wmat\00wmat\00\0041\000\001", null, !11, !17, i32* @wmat, null} ; [ DW_TAG_variable ] [wmat] [line 41] [def]
!56 = !{!"0x34\00bmat\00bmat\00\0041\000\001", null, !11, !17, i32* @bmat, null} ; [ DW_TAG_variable ] [bmat] [line 41] [def]
!57 = !{!"0x34\00srev_rank\00srev_rank\00\00147\001\001", null, !11, !58, [9 x i32]* @srev_rank, null} ; [ DW_TAG_variable ] [srev_rank] [line 147] [local] [def]
!58 = !{!"0x1\00\000\00288\0032\000\000\000", null, null, !32, !59, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 288, align 32, offset 0] [from ]
!59 = !{!60}
!60 = !{!"0x21\000\009"}                          ; [ DW_TAG_subrange_type ] [0, 8]
!61 = !{!"0x34\00sblack_king\00sblack_king\00\00117\001\001", null, !11, !62, [144 x i32]* @sblack_king, null} ; [ DW_TAG_variable ] [sblack_king] [line 117] [local] [def]
!62 = !{!"0x1\00\000\004608\0032\000\000\000", null, null, !17, !63, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 4608, align 32, offset 0] [from int]
!63 = !{!51}
!64 = !{!"0x34\00send_king\00send_king\00\00132\001\001", null, !11, !62, [144 x i32]* @send_king, null} ; [ DW_TAG_variable ] [send_king] [line 132] [local] [def]
!65 = !{!"0x34\00swhite_king\00swhite_king\00\00102\001\001", null, !11, !62, [144 x i32]* @swhite_king, null} ; [ DW_TAG_variable ] [swhite_king] [line 102] [local] [def]
!66 = !{!"0x34\00sblack_pawn\00sblack_pawn\00\0087\001\001", null, !11, !62, [144 x i32]* @sblack_pawn, null} ; [ DW_TAG_variable ] [sblack_pawn] [line 87] [local] [def]
!67 = !{!"0x34\00swhite_pawn\00swhite_pawn\00\0073\001\001", null, !11, !62, [144 x i32]* @swhite_pawn, null} ; [ DW_TAG_variable ] [swhite_pawn] [line 73] [local] [def]
!68 = !{!"0x34\00evalRoutines\00evalRoutines\00\0024\001\001", null, !11, !69, [7 x i32 (i32, i32)*]* @evalRoutines, null} ; [ DW_TAG_variable ] [evalRoutines] [line 24] [local] [def]
!69 = !{!"0x1\00\000\00448\0064\000\000\000", null, null, !70, !72, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 448, align 64, offset 0] [from EVALFUNC]
!70 = !{!"0x16\00EVALFUNC\0023\000\000\000\000", !1, null, !71} ; [ DW_TAG_typedef ] [EVALFUNC] [line 23, size 0, align 0, offset 0] [from ]
!71 = !{!"0xf\00\000\0064\0064\000\000", null, null, !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!72 = !{!73}
!73 = !{!"0x21\000\007"}                          ; [ DW_TAG_subrange_type ] [0, 6]
!74 = !{!"0x34\00sknight\00sknight\00\0059\001\001", null, !11, !62, [144 x i32]* @sknight, null} ; [ DW_TAG_variable ] [sknight] [line 59] [local] [def]
!75 = !{!"0x34\00sbishop\00sbishop\00\0045\001\001", null, !11, !62, [144 x i32]* @sbishop, null} ; [ DW_TAG_variable ] [sbishop] [line 45] [local] [def]
!76 = !{!"0x34\00dir\00dir\00\00210\001\001", !25, !11, !77, [4 x i32]* @bishop_mobility.dir, null} ; [ DW_TAG_variable ] [dir] [line 210] [local] [def]
!77 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !32, !78, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from ]
!78 = !{!79}
!79 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!80 = !{!"0x34\00dir\00dir\00\00225\001\001", !28, !11, !77, [4 x i32]* @rook_mobility.dir, null} ; [ DW_TAG_variable ] [dir] [line 225] [local] [def]
!81 = !{i32 2, !"Dwarf Version", i32 4}
!82 = !{i32 2, !"Debug Info Version", i32 2}
!83 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!84 = !{!"0x100\00xnum_pieces\00170\000", !10, !11, !17} ; [ DW_TAG_auto_variable ] [xnum_pieces] [line 170]
!85 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!86 = !MDLocation(line: 170, column: 7, scope: !10)
!87 = !{!"0x100\00j\00171\000", !10, !11, !17}    ; [ DW_TAG_auto_variable ] [j] [line 171]
!88 = !MDLocation(line: 171, column: 7, scope: !10)
!89 = !{!"0x100\00a\00171\000", !10, !11, !17}    ; [ DW_TAG_auto_variable ] [a] [line 171]
!90 = !MDLocation(line: 171, column: 10, scope: !10)
!91 = !MDLocation(line: 173, column: 8, scope: !92)
!92 = !{!"0xb\00173\003\000", !1, !10}            ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!93 = !MDLocation(line: 173, column: 28, scope: !94)
!94 = !{!"0xb\00173\003\001", !1, !92}            ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!95 = !MDLocation(line: 173, column: 23, scope: !94)
!96 = !MDLocation(line: 173, column: 3, scope: !92)
!97 = !MDLocation(line: 175, column: 11, scope: !98)
!98 = !{!"0xb\00174\005\002", !1, !94}            ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!99 = !{!"0x100\00i\00171\000", !10, !11, !17}    ; [ DW_TAG_auto_variable ] [i] [line 171]
!100 = !MDLocation(line: 171, column: 13, scope: !10)
!101 = !MDLocation(line: 177, column: 11, scope: !98)
!102 = !MDLocation(line: 178, column: 2, scope: !103)
!103 = !{!"0xb\00177\0011\003", !1, !98}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!104 = !MDLocation(line: 180, column: 2, scope: !103)
!105 = !MDLocation(line: 182, column: 11, scope: !106)
!106 = !{!"0xb\00182\0011\004", !1, !98}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!107 = !MDLocation(line: 182, column: 11, scope: !98)
!108 = !MDLocation(line: 182, column: 32, scope: !106)
!109 = !MDLocation(line: 183, column: 4, scope: !106)
!110 = !MDLocation(line: 183, column: 26, scope: !106)
!111 = !MDLocation(line: 185, column: 4, scope: !112)
!112 = !{!"0xb\00184\002\005", !1, !106}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!113 = !MDLocation(line: 186, column: 2, scope: !112)
!114 = !MDLocation(line: 187, column: 5, scope: !98)
!115 = !MDLocation(line: 173, column: 42, scope: !94)
!116 = !MDLocation(line: 173, column: 3, scope: !94)
!117 = !MDLocation(line: 188, column: 8, scope: !118)
!118 = !{!"0xb\00188\007\006", !1, !10}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!119 = !MDLocation(line: 188, column: 7, scope: !10)
!120 = !MDLocation(line: 190, column: 12, scope: !118)
!121 = !MDLocation(line: 190, column: 30, scope: !118)
!122 = !MDLocation(line: 192, column: 11, scope: !118)
!123 = !MDLocation(line: 192, column: 33, scope: !118)
!124 = !MDLocation(line: 194, column: 7, scope: !125)
!125 = !{!"0xb\00193\005\007", !1, !118}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!126 = !MDLocation(line: 195, column: 5, scope: !125)
!127 = !MDLocation(line: 196, column: 12, scope: !128)
!128 = !{!"0xb\00196\0012\008", !1, !118}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!129 = !MDLocation(line: 196, column: 12, scope: !118)
!130 = !MDLocation(line: 198, column: 7, scope: !131)
!131 = !{!"0xb\00197\005\009", !1, !128}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!132 = !MDLocation(line: 199, column: 5, scope: !131)
!133 = !MDLocation(line: 201, column: 5, scope: !128)
!134 = !MDLocation(line: 203, column: 1, scope: !10)
!135 = !{!"0x101\00sq\0016777451\000", !14, !11, !17} ; [ DW_TAG_arg_variable ] [sq] [line 235]
!136 = !MDLocation(line: 235, column: 15, scope: !14)
!137 = !{!"0x101\00c\0033554667\000", !14, !11, !17} ; [ DW_TAG_arg_variable ] [c] [line 235]
!138 = !MDLocation(line: 235, column: 22, scope: !14)
!139 = !{!"0x100\00s\00236\000", !14, !11, !17}   ; [ DW_TAG_auto_variable ] [s] [line 236]
!140 = !MDLocation(line: 236, column: 7, scope: !14)
!141 = !MDLocation(line: 238, column: 7, scope: !142)
!142 = !{!"0xb\00238\007\0010", !1, !14}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!143 = !MDLocation(line: 238, column: 7, scope: !14)
!144 = !MDLocation(line: 239, column: 7, scope: !142)
!145 = !MDLocation(line: 240, column: 7, scope: !142)
!146 = !MDLocation(line: 241, column: 5, scope: !147)
!147 = !{!"0xb\00240\0030\0011", !1, !142}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!148 = !MDLocation(line: 242, column: 3, scope: !147)
!149 = !MDLocation(line: 244, column: 7, scope: !150)
!150 = !{!"0xb\00244\007\0012", !1, !14}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!151 = !MDLocation(line: 244, column: 7, scope: !14)
!152 = !MDLocation(line: 245, column: 7, scope: !150)
!153 = !MDLocation(line: 246, column: 7, scope: !150)
!154 = !MDLocation(line: 247, column: 5, scope: !155)
!155 = !{!"0xb\00246\0030\0013", !1, !150}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!156 = !MDLocation(line: 248, column: 3, scope: !155)
!157 = !MDLocation(line: 250, column: 7, scope: !158)
!158 = !{!"0xb\00250\007\0014", !1, !14}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!159 = !MDLocation(line: 250, column: 7, scope: !14)
!160 = !MDLocation(line: 251, column: 9, scope: !158)
!161 = !MDLocation(line: 251, column: 5, scope: !158)
!162 = !MDLocation(line: 252, column: 3, scope: !14)
!163 = !{!"0x101\00sq\0016777471\000", !18, !11, !17} ; [ DW_TAG_arg_variable ] [sq] [line 255]
!164 = !MDLocation(line: 255, column: 16, scope: !18)
!165 = !{!"0x101\00c\0033554687\000", !18, !11, !17} ; [ DW_TAG_arg_variable ] [c] [line 255]
!166 = !MDLocation(line: 255, column: 23, scope: !18)
!167 = !{!"0x100\00s\00256\000", !18, !11, !17}   ; [ DW_TAG_auto_variable ] [s] [line 256]
!168 = !MDLocation(line: 256, column: 7, scope: !18)
!169 = !MDLocation(line: 258, column: 15, scope: !18)
!170 = !{!"0x100\00xside\00258\000", !18, !11, !17} ; [ DW_TAG_auto_variable ] [xside] [line 258]
!171 = !MDLocation(line: 258, column: 7, scope: !18)
!172 = !MDLocation(line: 260, column: 3, scope: !18)
!173 = !MDLocation(line: 262, column: 35, scope: !18)
!174 = !MDLocation(line: 262, column: 22, scope: !18)
!175 = !MDLocation(line: 262, column: 8, scope: !18)
!176 = !MDLocation(line: 262, column: 3, scope: !18)
!177 = !MDLocation(line: 264, column: 9, scope: !18)
!178 = !{!"0x100\00mob\00257\000", !18, !11, !17} ; [ DW_TAG_auto_variable ] [mob] [line 257]
!179 = !MDLocation(line: 257, column: 7, scope: !18)
!180 = !MDLocation(line: 265, column: 10, scope: !18)
!181 = !MDLocation(line: 265, column: 3, scope: !18)
!182 = !MDLocation(line: 267, column: 7, scope: !183)
!183 = !{!"0xb\00267\007\0015", !1, !18}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!184 = !MDLocation(line: 267, column: 7, scope: !18)
!185 = !MDLocation(line: 268, column: 10, scope: !186)
!186 = !{!"0xb\00268\0010\0017", !1, !187}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!187 = !{!"0xb\00267\0017\0016", !1, !183}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!188 = !MDLocation(line: 268, column: 10, scope: !187)
!189 = !MDLocation(line: 269, column: 2, scope: !186)
!190 = !MDLocation(line: 270, column: 15, scope: !191)
!191 = !{!"0xb\00270\0015\0018", !1, !186}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!192 = !MDLocation(line: 270, column: 15, scope: !186)
!193 = !MDLocation(line: 271, column: 2, scope: !191)
!194 = !MDLocation(line: 273, column: 2, scope: !191)
!195 = !MDLocation(line: 274, column: 3, scope: !187)
!196 = !MDLocation(line: 276, column: 3, scope: !18)
!197 = !MDLocation(line: 278, column: 7, scope: !198)
!198 = !{!"0xb\00278\007\0019", !1, !18}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!199 = !MDLocation(line: 278, column: 7, scope: !18)
!200 = !MDLocation(line: 279, column: 9, scope: !198)
!201 = !MDLocation(line: 279, column: 5, scope: !198)
!202 = !MDLocation(line: 280, column: 3, scope: !18)
!203 = !{!"0x101\00square\0016777436\000", !28, !11, !17} ; [ DW_TAG_arg_variable ] [square] [line 220]
!204 = !MDLocation(line: 220, column: 30, scope: !28)
!205 = !{!"0x100\00m\00223\000", !28, !11, !17}   ; [ DW_TAG_auto_variable ] [m] [line 223]
!206 = !MDLocation(line: 223, column: 16, scope: !28)
!207 = !{!"0x100\00diridx\00224\000", !28, !11, !17} ; [ DW_TAG_auto_variable ] [diridx] [line 224]
!208 = !MDLocation(line: 224, column: 16, scope: !28)
!209 = !MDLocation(line: 227, column: 8, scope: !210)
!210 = !{!"0xb\00227\003\00278", !1, !28}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!211 = !MDLocation(line: 227, column: 20, scope: !212)
!212 = !{!"0xb\002", !1, !213}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!213 = !{!"0xb\001", !1, !214}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!214 = !{!"0xb\00227\003\00279", !1, !210}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!215 = !MDLocation(line: 227, column: 3, scope: !210)
!216 = !MDLocation(line: 229, column: 22, scope: !217)
!217 = !{!"0xb\00229\006\00281", !1, !218}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!218 = !{!"0xb\00228\003\00280", !1, !214}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!219 = !MDLocation(line: 229, column: 15, scope: !217)
!220 = !{!"0x100\00l\00222\000", !28, !11, !17}   ; [ DW_TAG_auto_variable ] [l] [line 222]
!221 = !MDLocation(line: 222, column: 16, scope: !28)
!222 = !MDLocation(line: 229, column: 11, scope: !217)
!223 = !MDLocation(line: 229, column: 35, scope: !224)
!224 = !{!"0xb\00229\006\00282", !1, !217}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!225 = !MDLocation(line: 229, column: 6, scope: !217)
!226 = !MDLocation(line: 230, column: 9, scope: !224)
!227 = !MDLocation(line: 229, column: 58, scope: !224)
!228 = !MDLocation(line: 229, column: 55, scope: !224)
!229 = !MDLocation(line: 229, column: 6, scope: !224)
!230 = !MDLocation(line: 231, column: 3, scope: !218)
!231 = !MDLocation(line: 227, column: 32, scope: !214)
!232 = !MDLocation(line: 227, column: 3, scope: !214)
!233 = !MDLocation(line: 232, column: 3, scope: !28)
!234 = !{!"0x101\00square\0016777421\000", !25, !11, !17} ; [ DW_TAG_arg_variable ] [square] [line 205]
!235 = !MDLocation(line: 205, column: 32, scope: !25)
!236 = !{!"0x100\00m\00208\000", !25, !11, !17}   ; [ DW_TAG_auto_variable ] [m] [line 208]
!237 = !MDLocation(line: 208, column: 16, scope: !25)
!238 = !{!"0x100\00diridx\00209\000", !25, !11, !17} ; [ DW_TAG_auto_variable ] [diridx] [line 209]
!239 = !MDLocation(line: 209, column: 16, scope: !25)
!240 = !MDLocation(line: 212, column: 8, scope: !241)
!241 = !{!"0xb\00212\003\00273", !1, !25}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!242 = !MDLocation(line: 212, column: 20, scope: !243)
!243 = !{!"0xb\002", !1, !244}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!244 = !{!"0xb\001", !1, !245}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!245 = !{!"0xb\00212\003\00274", !1, !241}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!246 = !MDLocation(line: 212, column: 3, scope: !241)
!247 = !MDLocation(line: 214, column: 22, scope: !248)
!248 = !{!"0xb\00214\006\00276", !1, !249}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!249 = !{!"0xb\00213\003\00275", !1, !245}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!250 = !MDLocation(line: 214, column: 15, scope: !248)
!251 = !{!"0x100\00l\00207\000", !25, !11, !17}   ; [ DW_TAG_auto_variable ] [l] [line 207]
!252 = !MDLocation(line: 207, column: 16, scope: !25)
!253 = !MDLocation(line: 214, column: 11, scope: !248)
!254 = !MDLocation(line: 214, column: 35, scope: !255)
!255 = !{!"0xb\00214\006\00277", !1, !248}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!256 = !MDLocation(line: 214, column: 6, scope: !248)
!257 = !MDLocation(line: 215, column: 9, scope: !255)
!258 = !MDLocation(line: 214, column: 58, scope: !255)
!259 = !MDLocation(line: 214, column: 55, scope: !255)
!260 = !MDLocation(line: 214, column: 6, scope: !255)
!261 = !MDLocation(line: 216, column: 3, scope: !249)
!262 = !MDLocation(line: 212, column: 32, scope: !245)
!263 = !MDLocation(line: 212, column: 3, scope: !245)
!264 = !MDLocation(line: 217, column: 3, scope: !25)
!265 = !{!"0x101\00sq\0016777499\000", !19, !11, !17} ; [ DW_TAG_arg_variable ] [sq] [line 283]
!266 = !MDLocation(line: 283, column: 14, scope: !19)
!267 = !{!"0x101\00c\0033554715\000", !19, !11, !17} ; [ DW_TAG_arg_variable ] [c] [line 283]
!268 = !MDLocation(line: 283, column: 21, scope: !19)
!269 = !{!"0x100\00s\00285\000", !19, !11, !17}   ; [ DW_TAG_auto_variable ] [s] [line 285]
!270 = !MDLocation(line: 285, column: 7, scope: !19)
!271 = !MDLocation(line: 287, column: 15, scope: !19)
!272 = !{!"0x100\00xside\00287\000", !19, !11, !17} ; [ DW_TAG_auto_variable ] [xside] [line 287]
!273 = !MDLocation(line: 287, column: 7, scope: !19)
!274 = !MDLocation(line: 289, column: 3, scope: !19)
!275 = !MDLocation(line: 291, column: 39, scope: !19)
!276 = !MDLocation(line: 291, column: 22, scope: !19)
!277 = !MDLocation(line: 291, column: 8, scope: !19)
!278 = !MDLocation(line: 291, column: 3, scope: !19)
!279 = !MDLocation(line: 293, column: 9, scope: !19)
!280 = !{!"0x100\00mob\00286\000", !19, !11, !17} ; [ DW_TAG_auto_variable ] [mob] [line 286]
!281 = !MDLocation(line: 286, column: 7, scope: !19)
!282 = !MDLocation(line: 294, column: 7, scope: !283)
!283 = !{!"0xb\00294\007\0020", !1, !19}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!284 = !MDLocation(line: 294, column: 7, scope: !19)
!285 = !MDLocation(line: 294, column: 17, scope: !286)
!286 = !{!"0xb\001", !1, !283}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!287 = !MDLocation(line: 295, column: 3, scope: !19)
!288 = !MDLocation(line: 298, column: 13, scope: !289)
!289 = !{!"0xb\00298\007\0021", !1, !19}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!290 = !MDLocation(line: 298, column: 7, scope: !289)
!291 = !MDLocation(line: 298, column: 7, scope: !19)
!292 = !MDLocation(line: 298, column: 38, scope: !293)
!293 = !{!"0xb\001", !1, !289}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!294 = !MDLocation(line: 298, column: 32, scope: !289)
!295 = !MDLocation(line: 299, column: 7, scope: !296)
!296 = !{!"0xb\00298\0055\0022", !1, !289}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!297 = !MDLocation(line: 300, column: 3, scope: !296)
!298 = !MDLocation(line: 303, column: 7, scope: !299)
!299 = !{!"0xb\00303\007\0023", !1, !19}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!300 = !MDLocation(line: 303, column: 7, scope: !19)
!301 = !MDLocation(line: 303, column: 30, scope: !302)
!302 = !{!"0xb\001", !1, !299}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!303 = !MDLocation(line: 304, column: 15, scope: !304)
!304 = !{!"0xb\00304\009\0025", !1, !305}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!305 = !{!"0xb\00303\0052\0024", !1, !299}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!306 = !MDLocation(line: 304, column: 9, scope: !304)
!307 = !MDLocation(line: 304, column: 9, scope: !305)
!308 = !MDLocation(line: 305, column: 7, scope: !309)
!309 = !{!"0xb\00304\0030\0026", !1, !304}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!310 = !MDLocation(line: 306, column: 13, scope: !311)
!311 = !{!"0xb\00306\0013\0027", !1, !309}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!312 = !MDLocation(line: 306, column: 13, scope: !309)
!313 = !MDLocation(line: 307, column: 14, scope: !311)
!314 = !MDLocation(line: 309, column: 10, scope: !315)
!315 = !{!"0xb\00308\008\0028", !1, !311}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!316 = !MDLocation(line: 310, column: 8, scope: !315)
!317 = !MDLocation(line: 311, column: 7, scope: !309)
!318 = !MDLocation(line: 312, column: 15, scope: !319)
!319 = !{!"0xb\00312\009\0029", !1, !305}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!320 = !MDLocation(line: 312, column: 9, scope: !319)
!321 = !MDLocation(line: 312, column: 9, scope: !305)
!322 = !MDLocation(line: 313, column: 7, scope: !323)
!323 = !{!"0xb\00312\0032\0030", !1, !319}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!324 = !MDLocation(line: 314, column: 5, scope: !323)
!325 = !MDLocation(line: 315, column: 3, scope: !305)
!326 = !MDLocation(line: 317, column: 7, scope: !327)
!327 = !{!"0xb\00317\007\0031", !1, !19}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!328 = !MDLocation(line: 317, column: 7, scope: !19)
!329 = !MDLocation(line: 318, column: 9, scope: !327)
!330 = !MDLocation(line: 318, column: 5, scope: !327)
!331 = !MDLocation(line: 319, column: 3, scope: !19)
!332 = !{!"0x101\00sq\0016777538\000", !20, !11, !17} ; [ DW_TAG_arg_variable ] [sq] [line 322]
!333 = !MDLocation(line: 322, column: 17, scope: !20)
!334 = !{!"0x101\00c\0033554754\000", !20, !11, !17} ; [ DW_TAG_arg_variable ] [c] [line 322]
!335 = !MDLocation(line: 322, column: 24, scope: !20)
!336 = !{!"0x100\00s\00323\000", !20, !11, !17}   ; [ DW_TAG_auto_variable ] [s] [line 323]
!337 = !MDLocation(line: 323, column: 7, scope: !20)
!338 = !MDLocation(line: 325, column: 15, scope: !20)
!339 = !{!"0x100\00xside\00325\000", !20, !11, !17} ; [ DW_TAG_auto_variable ] [xside] [line 325]
!340 = !MDLocation(line: 325, column: 7, scope: !20)
!341 = !MDLocation(line: 327, column: 3, scope: !20)
!342 = !MDLocation(line: 328, column: 8, scope: !20)
!343 = !MDLocation(line: 328, column: 3, scope: !20)
!344 = !MDLocation(line: 330, column: 35, scope: !20)
!345 = !MDLocation(line: 330, column: 22, scope: !20)
!346 = !MDLocation(line: 330, column: 8, scope: !20)
!347 = !MDLocation(line: 330, column: 3, scope: !20)
!348 = !MDLocation(line: 332, column: 9, scope: !20)
!349 = !{!"0x100\00mob\00324\000", !20, !11, !17} ; [ DW_TAG_auto_variable ] [mob] [line 324]
!350 = !MDLocation(line: 324, column: 7, scope: !20)
!351 = !MDLocation(line: 333, column: 7, scope: !352)
!352 = !{!"0xb\00333\007\0032", !1, !20}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!353 = !MDLocation(line: 333, column: 7, scope: !20)
!354 = !MDLocation(line: 333, column: 17, scope: !355)
!355 = !{!"0xb\001", !1, !352}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!356 = !MDLocation(line: 334, column: 3, scope: !20)
!357 = !MDLocation(line: 336, column: 8, scope: !358)
!358 = !{!"0xb\00336\007\0033", !1, !20}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!359 = !MDLocation(line: 336, column: 7, scope: !20)
!360 = !MDLocation(line: 336, column: 22, scope: !361)
!361 = !{!"0xb\001", !1, !358}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!362 = !MDLocation(line: 336, column: 34, scope: !363)
!363 = !{!"0xb\002", !1, !358}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!364 = !MDLocation(line: 338, column: 8, scope: !358)
!365 = !MDLocation(line: 338, column: 22, scope: !358)
!366 = !MDLocation(line: 338, column: 34, scope: !358)
!367 = !MDLocation(line: 339, column: 7, scope: !358)
!368 = !MDLocation(line: 341, column: 7, scope: !369)
!369 = !{!"0xb\00341\007\0034", !1, !20}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!370 = !MDLocation(line: 341, column: 7, scope: !20)
!371 = !MDLocation(line: 342, column: 9, scope: !369)
!372 = !MDLocation(line: 342, column: 5, scope: !369)
!373 = !MDLocation(line: 343, column: 3, scope: !20)
!374 = !{!"0x101\00sq\0016777562\000", !21, !11, !17} ; [ DW_TAG_arg_variable ] [sq] [line 346]
!375 = !MDLocation(line: 346, column: 17, scope: !21)
!376 = !{!"0x101\00c\0033554778\000", !21, !11, !17} ; [ DW_TAG_arg_variable ] [c] [line 346]
!377 = !MDLocation(line: 346, column: 24, scope: !21)
!378 = !{!"0x100\00s\00347\000", !21, !11, !17}   ; [ DW_TAG_auto_variable ] [s] [line 347]
!379 = !MDLocation(line: 347, column: 7, scope: !21)
!380 = !MDLocation(line: 348, column: 15, scope: !21)
!381 = !{!"0x100\00xside\00348\000", !21, !11, !17} ; [ DW_TAG_auto_variable ] [xside] [line 348]
!382 = !MDLocation(line: 348, column: 7, scope: !21)
!383 = !MDLocation(line: 350, column: 3, scope: !21)
!384 = !MDLocation(line: 351, column: 8, scope: !21)
!385 = !MDLocation(line: 351, column: 3, scope: !21)
!386 = !MDLocation(line: 353, column: 35, scope: !21)
!387 = !MDLocation(line: 353, column: 22, scope: !21)
!388 = !MDLocation(line: 353, column: 8, scope: !21)
!389 = !MDLocation(line: 353, column: 3, scope: !21)
!390 = !MDLocation(line: 355, column: 7, scope: !391)
!391 = !{!"0xb\00355\007\0035", !1, !21}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!392 = !MDLocation(line: 355, column: 7, scope: !21)
!393 = !MDLocation(line: 356, column: 9, scope: !391)
!394 = !MDLocation(line: 356, column: 5, scope: !391)
!395 = !MDLocation(line: 357, column: 3, scope: !21)
!396 = !{!"0x101\00sq\0016777576\000", !22, !11, !17} ; [ DW_TAG_arg_variable ] [sq] [line 360]
!397 = !MDLocation(line: 360, column: 15, scope: !22)
!398 = !{!"0x101\00c\0033554792\000", !22, !11, !17} ; [ DW_TAG_arg_variable ] [c] [line 360]
!399 = !MDLocation(line: 360, column: 22, scope: !22)
!400 = !{!"0x100\00s\00361\000", !22, !11, !17}   ; [ DW_TAG_auto_variable ] [s] [line 361]
!401 = !MDLocation(line: 361, column: 7, scope: !22)
!402 = !MDLocation(line: 362, column: 15, scope: !22)
!403 = !{!"0x100\00xside\00362\000", !22, !11, !17} ; [ DW_TAG_auto_variable ] [xside] [line 362]
!404 = !MDLocation(line: 362, column: 7, scope: !22)
!405 = !MDLocation(line: 364, column: 3, scope: !22)
!406 = !MDLocation(line: 366, column: 35, scope: !22)
!407 = !MDLocation(line: 366, column: 22, scope: !22)
!408 = !MDLocation(line: 366, column: 8, scope: !22)
!409 = !MDLocation(line: 366, column: 3, scope: !22)
!410 = !MDLocation(line: 367, column: 39, scope: !22)
!411 = !MDLocation(line: 367, column: 26, scope: !22)
!412 = !MDLocation(line: 367, column: 8, scope: !22)
!413 = !MDLocation(line: 367, column: 3, scope: !22)
!414 = !MDLocation(line: 370, column: 7, scope: !415)
!415 = !{!"0xb\00370\007\0036", !1, !22}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!416 = !MDLocation(line: 370, column: 7, scope: !22)
!417 = !MDLocation(line: 371, column: 10, scope: !415)
!418 = !MDLocation(line: 372, column: 7, scope: !415)
!419 = !MDLocation(line: 375, column: 6, scope: !420)
!420 = !{!"0xb\00375\006\0037", !1, !22}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!421 = !MDLocation(line: 375, column: 6, scope: !22)
!422 = !MDLocation(line: 376, column: 9, scope: !420)
!423 = !MDLocation(line: 377, column: 6, scope: !420)
!424 = !MDLocation(line: 378, column: 12, scope: !425)
!425 = !{!"0xb\00378\0012\0038", !1, !420}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!426 = !MDLocation(line: 378, column: 12, scope: !420)
!427 = !MDLocation(line: 379, column: 15, scope: !425)
!428 = !MDLocation(line: 380, column: 6, scope: !425)
!429 = !MDLocation(line: 382, column: 7, scope: !430)
!430 = !{!"0xb\00382\007\0039", !1, !22}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!431 = !MDLocation(line: 382, column: 7, scope: !22)
!432 = !MDLocation(line: 383, column: 9, scope: !430)
!433 = !MDLocation(line: 383, column: 5, scope: !430)
!434 = !MDLocation(line: 384, column: 3, scope: !22)
!435 = !{!"0x101\00sq\0016777603\000", !23, !11, !17} ; [ DW_TAG_arg_variable ] [sq] [line 387]
!436 = !MDLocation(line: 387, column: 18, scope: !23)
!437 = !{!"0x101\00c\0033554819\000", !23, !11, !17} ; [ DW_TAG_arg_variable ] [c] [line 387]
!438 = !MDLocation(line: 387, column: 25, scope: !23)
!439 = !MDLocation(line: 388, column: 3, scope: !23)
!440 = !MDLocation(line: 389, column: 3, scope: !23)
!441 = !{!"0x101\00alpha\0016777608\000", !24, !11, !17} ; [ DW_TAG_arg_variable ] [alpha] [line 392]
!442 = !MDLocation(line: 392, column: 19, scope: !24)
!443 = !{!"0x101\00beta\0033554824\000", !24, !11, !17} ; [ DW_TAG_arg_variable ] [beta] [line 392]
!444 = !MDLocation(line: 392, column: 30, scope: !24)
!445 = !{!"0x100\00pawns\00394\000", !24, !11, !446} ; [ DW_TAG_auto_variable ] [pawns] [line 394]
!446 = !{!"0x1\00\000\00704\0032\000\000\000", null, null, !17, !447, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 704, align 32, offset 0] [from int]
!447 = !{!46, !448}
!448 = !{!"0x21\000\0011"}                        ; [ DW_TAG_subrange_type ] [0, 10]
!449 = !MDLocation(line: 394, column: 24, scope: !24)
!450 = !{!"0x100\00white_back_pawn\00394\000", !24, !11, !451} ; [ DW_TAG_auto_variable ] [white_back_pawn] [line 394]
!451 = !{!"0x1\00\000\00352\0032\000\000\000", null, null, !17, !452, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!452 = !{!448}
!453 = !MDLocation(line: 394, column: 38, scope: !24)
!454 = !{!"0x100\00black_back_pawn\00394\000", !24, !11, !451} ; [ DW_TAG_auto_variable ] [black_back_pawn] [line 394]
!455 = !MDLocation(line: 394, column: 59, scope: !24)
!456 = !{!"0x100\00score\00396\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [score] [line 396]
!457 = !MDLocation(line: 396, column: 7, scope: !24)
!458 = !{!"0x100\00in_cache\00398\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [in_cache] [line 398]
!459 = !MDLocation(line: 398, column: 7, scope: !24)
!460 = !MDLocation(line: 404, column: 8, scope: !461)
!461 = !{!"0xb\00404\007\0040", !1, !24}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!462 = !MDLocation(line: 404, column: 22, scope: !463)
!463 = !{!"0xb\001", !1, !461}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!464 = !MDLocation(line: 404, column: 32, scope: !465)
!465 = !{!"0xb\002", !1, !461}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!466 = !MDLocation(line: 404, column: 31, scope: !461)
!467 = !MDLocation(line: 404, column: 44, scope: !468)
!468 = !{!"0xb\004", !1, !469}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!469 = !{!"0xb\003", !1, !461}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!470 = !MDLocation(line: 404, column: 7, scope: !461)
!471 = !MDLocation(line: 404, column: 7, scope: !24)
!472 = !MDLocation(line: 405, column: 12, scope: !461)
!473 = !MDLocation(line: 405, column: 26, scope: !463)
!474 = !MDLocation(line: 405, column: 36, scope: !465)
!475 = !MDLocation(line: 405, column: 35, scope: !461)
!476 = !MDLocation(line: 405, column: 48, scope: !468)
!477 = !MDLocation(line: 405, column: 11, scope: !461)
!478 = !MDLocation(line: 405, column: 4, scope: !461)
!479 = !MDLocation(line: 406, column: 8, scope: !480)
!480 = !{!"0xb\00406\007\0041", !1, !24}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!481 = !MDLocation(line: 406, column: 22, scope: !482)
!482 = !{!"0xb\001", !1, !480}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!483 = !MDLocation(line: 406, column: 32, scope: !484)
!484 = !{!"0xb\002", !1, !480}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!485 = !MDLocation(line: 406, column: 31, scope: !480)
!486 = !MDLocation(line: 406, column: 44, scope: !487)
!487 = !{!"0xb\004", !1, !488}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!488 = !{!"0xb\003", !1, !480}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!489 = !MDLocation(line: 406, column: 7, scope: !480)
!490 = !MDLocation(line: 406, column: 7, scope: !24)
!491 = !MDLocation(line: 407, column: 12, scope: !480)
!492 = !MDLocation(line: 407, column: 26, scope: !482)
!493 = !MDLocation(line: 407, column: 36, scope: !484)
!494 = !MDLocation(line: 407, column: 35, scope: !480)
!495 = !MDLocation(line: 407, column: 48, scope: !487)
!496 = !MDLocation(line: 407, column: 11, scope: !480)
!497 = !MDLocation(line: 407, column: 4, scope: !480)
!498 = !MDLocation(line: 409, column: 3, scope: !24)
!499 = !MDLocation(line: 411, column: 3, scope: !24)
!500 = !MDLocation(line: 413, column: 6, scope: !501)
!501 = !{!"0xb\00413\006\0042", !1, !24}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!502 = !MDLocation(line: 413, column: 6, scope: !24)
!503 = !MDLocation(line: 415, column: 11, scope: !504)
!504 = !{!"0xb\00415\0011\0044", !1, !505}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!505 = !{!"0xb\00414\005\0043", !1, !501}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!506 = !MDLocation(line: 415, column: 11, scope: !505)
!507 = !MDLocation(line: 415, column: 38, scope: !508)
!508 = !{!"0xb\001", !1, !504}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!509 = !MDLocation(line: 415, column: 31, scope: !504)
!510 = !MDLocation(line: 416, column: 15, scope: !505)
!511 = !MDLocation(line: 416, column: 14, scope: !505)
!512 = !MDLocation(line: 416, column: 7, scope: !505)
!513 = !MDLocation(line: 419, column: 3, scope: !24)
!514 = !{!"0x100\00i\00394\000", !24, !11, !17}   ; [ DW_TAG_auto_variable ] [i] [line 394]
!515 = !MDLocation(line: 394, column: 7, scope: !24)
!516 = !MDLocation(line: 420, column: 8, scope: !517)
!517 = !{!"0xb\00420\003\0045", !1, !24}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!518 = !MDLocation(line: 420, column: 15, scope: !519)
!519 = !{!"0xb\002", !1, !520}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!520 = !{!"0xb\001", !1, !521}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!521 = !{!"0xb\00420\003\0046", !1, !517}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!522 = !MDLocation(line: 420, column: 3, scope: !517)
!523 = !MDLocation(line: 421, column: 5, scope: !524)
!524 = !{!"0xb\00420\0028\0047", !1, !521}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!525 = !MDLocation(line: 422, column: 5, scope: !524)
!526 = !MDLocation(line: 423, column: 3, scope: !524)
!527 = !MDLocation(line: 420, column: 23, scope: !521)
!528 = !MDLocation(line: 420, column: 3, scope: !521)
!529 = !MDLocation(line: 425, column: 3, scope: !24)
!530 = !MDLocation(line: 426, column: 3, scope: !24)
!531 = !MDLocation(line: 428, column: 22, scope: !24)
!532 = !MDLocation(line: 428, column: 3, scope: !24)
!533 = !MDLocation(line: 429, column: 22, scope: !24)
!534 = !MDLocation(line: 429, column: 3, scope: !24)
!535 = !{!"0x100\00j\00395\000", !24, !11, !17}   ; [ DW_TAG_auto_variable ] [j] [line 395]
!536 = !MDLocation(line: 395, column: 48, scope: !24)
!537 = !{!"0x100\00a\00394\000", !24, !11, !17}   ; [ DW_TAG_auto_variable ] [a] [line 394]
!538 = !MDLocation(line: 394, column: 10, scope: !24)
!539 = !MDLocation(line: 432, column: 8, scope: !540)
!540 = !{!"0xb\00432\003\0048", !1, !24}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!541 = !MDLocation(line: 432, column: 28, scope: !542)
!542 = !{!"0xb\00432\003\0049", !1, !540}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!543 = !MDLocation(line: 432, column: 23, scope: !542)
!544 = !MDLocation(line: 432, column: 3, scope: !540)
!545 = !MDLocation(line: 433, column: 9, scope: !546)
!546 = !{!"0xb\00432\0047\0050", !1, !542}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!547 = !MDLocation(line: 435, column: 9, scope: !546)
!548 = !MDLocation(line: 436, column: 7, scope: !549)
!549 = !{!"0xb\00435\009\0051", !1, !546}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!550 = !MDLocation(line: 438, column: 7, scope: !549)
!551 = !MDLocation(line: 440, column: 5, scope: !546)
!552 = !MDLocation(line: 440, column: 5, scope: !553)
!553 = !{!"0xb\001", !1, !546}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!554 = !MDLocation(line: 440, column: 5, scope: !555)
!555 = !{!"0xb\003", !1, !546}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!556 = !MDLocation(line: 440, column: 5, scope: !557)
!557 = !{!"0xb\004", !1, !558}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!558 = !{!"0xb\002", !1, !546}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!559 = !MDLocation(line: 442, column: 9, scope: !560)
!560 = !{!"0xb\00442\009\0052", !1, !546}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!561 = !MDLocation(line: 442, column: 9, scope: !546)
!562 = !MDLocation(line: 442, column: 30, scope: !563)
!563 = !{!"0xb\001", !1, !560}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!564 = !MDLocation(line: 444, column: 13, scope: !565)
!565 = !{!"0xb\00444\0013\0054", !1, !566}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!566 = !{!"0xb\00443\005\0053", !1, !560}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!567 = !MDLocation(line: 444, column: 13, scope: !566)
!568 = !MDLocation(line: 445, column: 27, scope: !565)
!569 = !MDLocation(line: 445, column: 18, scope: !565)
!570 = !MDLocation(line: 445, column: 10, scope: !565)
!571 = !MDLocation(line: 447, column: 27, scope: !565)
!572 = !MDLocation(line: 447, column: 18, scope: !565)
!573 = !MDLocation(line: 447, column: 14, scope: !565)
!574 = !MDLocation(line: 447, column: 6, scope: !565)
!575 = !MDLocation(line: 448, column: 5, scope: !566)
!576 = !MDLocation(line: 450, column: 9, scope: !577)
!577 = !{!"0xb\00450\009\0055", !1, !546}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!578 = !MDLocation(line: 450, column: 9, scope: !546)
!579 = !MDLocation(line: 452, column: 19, scope: !580)
!580 = !{!"0xb\00451\005\0056", !1, !577}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!581 = !{!"0x100\00pawn_file\00394\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [pawn_file] [line 394]
!582 = !MDLocation(line: 394, column: 13, scope: !24)
!583 = !MDLocation(line: 453, column: 15, scope: !580)
!584 = !{!"0x100\00srank\00395\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [srank] [line 395]
!585 = !MDLocation(line: 395, column: 7, scope: !24)
!586 = !MDLocation(line: 455, column: 11, scope: !587)
!587 = !{!"0xb\00455\0011\0057", !1, !580}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!588 = !MDLocation(line: 455, column: 11, scope: !580)
!589 = !MDLocation(line: 457, column: 8, scope: !590)
!590 = !{!"0xb\00456\007\0058", !1, !587}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!591 = !MDLocation(line: 458, column: 20, scope: !592)
!592 = !{!"0xb\00458\0012\0059", !1, !590}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!593 = !MDLocation(line: 458, column: 12, scope: !592)
!594 = !MDLocation(line: 458, column: 12, scope: !590)
!595 = !MDLocation(line: 459, column: 3, scope: !596)
!596 = !{!"0xb\00458\0048\0060", !1, !592}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!597 = !MDLocation(line: 460, column: 8, scope: !596)
!598 = !MDLocation(line: 461, column: 7, scope: !590)
!599 = !MDLocation(line: 464, column: 8, scope: !600)
!600 = !{!"0xb\00463\007\0061", !1, !587}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!601 = !MDLocation(line: 465, column: 20, scope: !602)
!602 = !{!"0xb\00465\0012\0062", !1, !600}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!603 = !MDLocation(line: 465, column: 12, scope: !602)
!604 = !MDLocation(line: 465, column: 12, scope: !600)
!605 = !MDLocation(line: 466, column: 3, scope: !606)
!606 = !{!"0xb\00465\0048\0063", !1, !602}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!607 = !MDLocation(line: 467, column: 8, scope: !606)
!608 = !MDLocation(line: 469, column: 5, scope: !580)
!609 = !MDLocation(line: 470, column: 3, scope: !546)
!610 = !MDLocation(line: 432, column: 42, scope: !542)
!611 = !MDLocation(line: 432, column: 3, scope: !542)
!612 = !{!"0x100\00wpotential\00401\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [wpotential] [line 401]
!613 = !MDLocation(line: 401, column: 7, scope: !24)
!614 = !{!"0x100\00bpotential\00401\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [bpotential] [line 401]
!615 = !MDLocation(line: 401, column: 19, scope: !24)
!616 = !{!"0x100\00wksafety\00402\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [wksafety] [line 402]
!617 = !MDLocation(line: 402, column: 7, scope: !24)
!618 = !{!"0x100\00bksafety\00402\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [bksafety] [line 402]
!619 = !MDLocation(line: 402, column: 17, scope: !24)
!620 = !{!"0x100\00rbrook\00400\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [rbrook] [line 400]
!621 = !MDLocation(line: 400, column: 7, scope: !24)
!622 = !{!"0x100\00fbrook\00400\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [fbrook] [line 400]
!623 = !MDLocation(line: 400, column: 15, scope: !24)
!624 = !{!"0x100\00rwrook\00400\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [rwrook] [line 400]
!625 = !MDLocation(line: 400, column: 23, scope: !24)
!626 = !{!"0x100\00fwrook\00400\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [fwrook] [line 400]
!627 = !MDLocation(line: 400, column: 31, scope: !24)
!628 = !{!"0x100\00wp\00399\000", !24, !11, !17}  ; [ DW_TAG_auto_variable ] [wp] [line 399]
!629 = !MDLocation(line: 399, column: 7, scope: !24)
!630 = !{!"0x100\00bp\00399\000", !24, !11, !17}  ; [ DW_TAG_auto_variable ] [bp] [line 399]
!631 = !MDLocation(line: 399, column: 11, scope: !24)
!632 = !{!"0x100\00wb\00399\000", !24, !11, !17}  ; [ DW_TAG_auto_variable ] [wb] [line 399]
!633 = !MDLocation(line: 399, column: 23, scope: !24)
!634 = !{!"0x100\00bb\00399\000", !24, !11, !17}  ; [ DW_TAG_auto_variable ] [bb] [line 399]
!635 = !MDLocation(line: 399, column: 27, scope: !24)
!636 = !{!"0x100\00wn\00399\000", !24, !11, !17}  ; [ DW_TAG_auto_variable ] [wn] [line 399]
!637 = !MDLocation(line: 399, column: 15, scope: !24)
!638 = !{!"0x100\00bn\00399\000", !24, !11, !17}  ; [ DW_TAG_auto_variable ] [bn] [line 399]
!639 = !MDLocation(line: 399, column: 19, scope: !24)
!640 = !{!"0x100\00wr\00399\000", !24, !11, !17}  ; [ DW_TAG_auto_variable ] [wr] [line 399]
!641 = !MDLocation(line: 399, column: 39, scope: !24)
!642 = !{!"0x100\00br\00399\000", !24, !11, !17}  ; [ DW_TAG_auto_variable ] [br] [line 399]
!643 = !MDLocation(line: 399, column: 43, scope: !24)
!644 = !{!"0x100\00wq\00399\000", !24, !11, !17}  ; [ DW_TAG_auto_variable ] [wq] [line 399]
!645 = !MDLocation(line: 399, column: 31, scope: !24)
!646 = !{!"0x100\00bq\00399\000", !24, !11, !17}  ; [ DW_TAG_auto_variable ] [bq] [line 399]
!647 = !MDLocation(line: 399, column: 35, scope: !24)
!648 = !MDLocation(line: 493, column: 8, scope: !649)
!649 = !{!"0xb\00493\003\0064", !1, !24}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!650 = !MDLocation(line: 493, column: 28, scope: !651)
!651 = !{!"0xb\00493\003\0065", !1, !649}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!652 = !MDLocation(line: 493, column: 23, scope: !651)
!653 = !MDLocation(line: 493, column: 3, scope: !649)
!654 = !MDLocation(line: 494, column: 9, scope: !655)
!655 = !{!"0xb\00493\0047\0066", !1, !651}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!656 = !MDLocation(line: 495, column: 9, scope: !655)
!657 = !MDLocation(line: 496, column: 7, scope: !658)
!658 = !{!"0xb\00495\009\0067", !1, !655}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!659 = !MDLocation(line: 498, column: 7, scope: !658)
!660 = !MDLocation(line: 500, column: 30, scope: !655)
!661 = !MDLocation(line: 500, column: 17, scope: !655)
!662 = !MDLocation(line: 500, column: 45, scope: !655)
!663 = !MDLocation(line: 500, column: 5, scope: !655)
!664 = !MDLocation(line: 502, column: 17, scope: !655)
!665 = !MDLocation(line: 503, column: 13, scope: !655)
!666 = !MDLocation(line: 504, column: 13, scope: !655)
!667 = !MDLocation(line: 504, column: 5, scope: !655)
!668 = !{!"0x100\00isolated\00397\000", !24, !11, !669} ; [ DW_TAG_auto_variable ] [isolated] [line 397]
!669 = !{!"0x16\00xbool\0014\000\000\000\000", !4, null, !3} ; [ DW_TAG_typedef ] [xbool] [line 14, size 0, align 0, offset 0] [from ]
!670 = !MDLocation(line: 397, column: 9, scope: !24)
!671 = !{!"0x100\00backwards\00397\000", !24, !11, !669} ; [ DW_TAG_auto_variable ] [backwards] [line 397]
!672 = !MDLocation(line: 397, column: 19, scope: !24)
!673 = !MDLocation(line: 508, column: 11, scope: !674)
!674 = !{!"0xb\00504\0023\0068", !1, !655}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!675 = !MDLocation(line: 508, column: 2, scope: !674)
!676 = !MDLocation(line: 509, column: 2, scope: !674)
!677 = !MDLocation(line: 512, column: 22, scope: !678)
!678 = !{!"0xb\00512\006\0069", !1, !674}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!679 = !MDLocation(line: 512, column: 6, scope: !678)
!680 = !MDLocation(line: 512, column: 6, scope: !674)
!681 = !MDLocation(line: 513, column: 25, scope: !678)
!682 = !MDLocation(line: 513, column: 9, scope: !678)
!683 = !MDLocation(line: 514, column: 4, scope: !684)
!684 = !{!"0xb\00513\0047\0070", !1, !678}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!685 = !MDLocation(line: 517, column: 18, scope: !686)
!686 = !{!"0xb\00517\008\0071", !1, !684}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!687 = !MDLocation(line: 517, column: 9, scope: !686)
!688 = !MDLocation(line: 517, column: 8, scope: !684)
!689 = !MDLocation(line: 517, column: 44, scope: !690)
!690 = !{!"0xb\001", !1, !686}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!691 = !MDLocation(line: 517, column: 35, scope: !686)
!692 = !MDLocation(line: 518, column: 6, scope: !693)
!693 = !{!"0xb\00517\0058\0072", !1, !686}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!694 = !MDLocation(line: 520, column: 4, scope: !693)
!695 = !MDLocation(line: 521, column: 2, scope: !684)
!696 = !MDLocation(line: 524, column: 7, scope: !697)
!697 = !{!"0xb\00524\006\0073", !1, !674}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!698 = !MDLocation(line: 524, column: 6, scope: !674)
!699 = !MDLocation(line: 525, column: 8, scope: !700)
!700 = !{!"0xb\00524\0028\0074", !1, !697}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!701 = !MDLocation(line: 525, column: 19, scope: !702)
!702 = !{!"0xb\001", !1, !703}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!703 = !{!"0xb\00525\008\0075", !1, !700}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!704 = !MDLocation(line: 526, column: 8, scope: !700)
!705 = !MDLocation(line: 526, column: 18, scope: !706)
!706 = !{!"0xb\001", !1, !707}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!707 = !{!"0xb\00526\008\0076", !1, !700}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!708 = !MDLocation(line: 527, column: 2, scope: !700)
!709 = !MDLocation(line: 530, column: 6, scope: !710)
!710 = !{!"0xb\00530\006\0077", !1, !674}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!711 = !MDLocation(line: 530, column: 6, scope: !674)
!712 = !MDLocation(line: 531, column: 16, scope: !710)
!713 = !MDLocation(line: 531, column: 13, scope: !710)
!714 = !MDLocation(line: 531, column: 4, scope: !710)
!715 = !MDLocation(line: 534, column: 7, scope: !716)
!716 = !{!"0xb\00534\006\0078", !1, !674}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!717 = !MDLocation(line: 534, column: 6, scope: !674)
!718 = !MDLocation(line: 534, column: 55, scope: !716)
!719 = !MDLocation(line: 534, column: 39, scope: !716)
!720 = !MDLocation(line: 534, column: 30, scope: !716)
!721 = !MDLocation(line: 535, column: 31, scope: !716)
!722 = !MDLocation(line: 535, column: 15, scope: !716)
!723 = !MDLocation(line: 535, column: 6, scope: !716)
!724 = !MDLocation(line: 536, column: 20, scope: !725)
!725 = !{!"0xb\00535\0045\0079", !1, !716}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!726 = !MDLocation(line: 536, column: 18, scope: !725)
!727 = !MDLocation(line: 536, column: 13, scope: !725)
!728 = !MDLocation(line: 536, column: 4, scope: !725)
!729 = !MDLocation(line: 538, column: 8, scope: !730)
!730 = !{!"0xb\00538\008\0080", !1, !725}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!731 = !MDLocation(line: 538, column: 8, scope: !725)
!732 = !MDLocation(line: 542, column: 17, scope: !733)
!733 = !{!"0xb\00539\004\0081", !1, !730}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!734 = !MDLocation(line: 542, column: 12, scope: !733)
!735 = !{!"0x100\00tmp\00401\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [tmp] [line 401]
!736 = !MDLocation(line: 401, column: 31, scope: !24)
!737 = !MDLocation(line: 544, column: 10, scope: !738)
!738 = !{!"0xb\00544\0010\0082", !1, !733}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!739 = !MDLocation(line: 544, column: 10, scope: !740)
!740 = !{!"0xb\001", !1, !738}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!741 = !MDLocation(line: 544, column: 10, scope: !742)
!742 = !{!"0xb\002", !1, !738}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!743 = !MDLocation(line: 545, column: 10, scope: !738)
!744 = !MDLocation(line: 545, column: 22, scope: !738)
!745 = !MDLocation(line: 545, column: 6, scope: !738)
!746 = !MDLocation(line: 544, column: 10, scope: !733)
!747 = !MDLocation(line: 547, column: 8, scope: !748)
!748 = !{!"0xb\00546\006\0083", !1, !738}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!749 = !MDLocation(line: 548, column: 6, scope: !748)
!750 = !MDLocation(line: 549, column: 4, scope: !733)
!751 = !MDLocation(line: 554, column: 17, scope: !752)
!752 = !{!"0xb\00551\004\0084", !1, !730}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!753 = !MDLocation(line: 554, column: 12, scope: !752)
!754 = !MDLocation(line: 556, column: 11, scope: !755)
!755 = !{!"0xb\00556\0010\0085", !1, !752}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!756 = !MDLocation(line: 556, column: 11, scope: !757)
!757 = !{!"0xb\001", !1, !755}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!758 = !MDLocation(line: 556, column: 11, scope: !759)
!759 = !{!"0xb\002", !1, !755}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!760 = !MDLocation(line: 556, column: 11, scope: !761)
!761 = !{!"0xb\004", !1, !762}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!762 = !{!"0xb\003", !1, !755}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!763 = !MDLocation(line: 557, column: 10, scope: !755)
!764 = !MDLocation(line: 557, column: 22, scope: !755)
!765 = !MDLocation(line: 557, column: 6, scope: !755)
!766 = !MDLocation(line: 556, column: 10, scope: !755)
!767 = !MDLocation(line: 556, column: 10, scope: !752)
!768 = !MDLocation(line: 559, column: 8, scope: !769)
!769 = !{!"0xb\00558\006\0086", !1, !755}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!770 = !MDLocation(line: 560, column: 6, scope: !769)
!771 = !MDLocation(line: 564, column: 8, scope: !772)
!772 = !{!"0xb\00564\008\0087", !1, !725}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!773 = !MDLocation(line: 564, column: 8, scope: !725)
!774 = !MDLocation(line: 564, column: 24, scope: !775)
!775 = !{!"0xb\001", !1, !772}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!776 = !MDLocation(line: 565, column: 22, scope: !772)
!777 = !MDLocation(line: 565, column: 20, scope: !772)
!778 = !MDLocation(line: 565, column: 15, scope: !772)
!779 = !MDLocation(line: 565, column: 6, scope: !772)
!780 = !MDLocation(line: 568, column: 8, scope: !725)
!781 = !MDLocation(line: 570, column: 8, scope: !782)
!782 = !{!"0xb\00569\006\0089", !1, !783}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!783 = !{!"0xb\00568\008\0088", !1, !725}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!784 = !MDLocation(line: 573, column: 21, scope: !785)
!785 = !{!"0xb\00573\0012\0090", !1, !782}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!786 = !MDLocation(line: 573, column: 12, scope: !785)
!787 = !MDLocation(line: 573, column: 12, scope: !782)
!788 = !MDLocation(line: 575, column: 19, scope: !789)
!789 = !{!"0xb\00575\009\0092", !1, !790}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!790 = !{!"0xb\00574\003\0091", !1, !785}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!791 = !MDLocation(line: 575, column: 10, scope: !789)
!792 = !MDLocation(line: 575, column: 9, scope: !790)
!793 = !MDLocation(line: 576, column: 28, scope: !789)
!794 = !MDLocation(line: 576, column: 12, scope: !789)
!795 = !MDLocation(line: 576, column: 60, scope: !789)
!796 = !MDLocation(line: 576, column: 44, scope: !789)
!797 = !MDLocation(line: 578, column: 20, scope: !798)
!798 = !{!"0xb\00577\007\0093", !1, !789}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!799 = !MDLocation(line: 578, column: 18, scope: !798)
!800 = !MDLocation(line: 578, column: 9, scope: !798)
!801 = !MDLocation(line: 581, column: 13, scope: !802)
!802 = !{!"0xb\00581\0013\0094", !1, !798}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!803 = !MDLocation(line: 581, column: 13, scope: !798)
!804 = !MDLocation(line: 581, column: 45, scope: !805)
!805 = !{!"0xb\001", !1, !802}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!806 = !MDLocation(line: 581, column: 29, scope: !802)
!807 = !MDLocation(line: 583, column: 6, scope: !808)
!808 = !{!"0xb\00582\004\0095", !1, !802}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!809 = !MDLocation(line: 584, column: 4, scope: !808)
!810 = !MDLocation(line: 585, column: 7, scope: !798)
!811 = !MDLocation(line: 586, column: 3, scope: !790)
!812 = !MDLocation(line: 587, column: 21, scope: !813)
!813 = !{!"0xb\00587\0012\0096", !1, !782}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!814 = !MDLocation(line: 587, column: 12, scope: !813)
!815 = !MDLocation(line: 587, column: 12, scope: !782)
!816 = !MDLocation(line: 589, column: 20, scope: !817)
!817 = !{!"0xb\00589\0010\0098", !1, !818}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!818 = !{!"0xb\00588\003\0097", !1, !813}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!819 = !MDLocation(line: 589, column: 11, scope: !817)
!820 = !MDLocation(line: 589, column: 10, scope: !818)
!821 = !MDLocation(line: 590, column: 28, scope: !817)
!822 = !MDLocation(line: 590, column: 12, scope: !817)
!823 = !MDLocation(line: 590, column: 60, scope: !817)
!824 = !MDLocation(line: 590, column: 44, scope: !817)
!825 = !MDLocation(line: 592, column: 20, scope: !826)
!826 = !{!"0xb\00591\007\0099", !1, !817}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!827 = !MDLocation(line: 592, column: 18, scope: !826)
!828 = !MDLocation(line: 592, column: 9, scope: !826)
!829 = !MDLocation(line: 595, column: 13, scope: !830)
!830 = !{!"0xb\00595\0013\00100", !1, !826}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!831 = !MDLocation(line: 595, column: 13, scope: !826)
!832 = !MDLocation(line: 595, column: 45, scope: !833)
!833 = !{!"0xb\001", !1, !830}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!834 = !MDLocation(line: 595, column: 29, scope: !830)
!835 = !MDLocation(line: 597, column: 6, scope: !836)
!836 = !{!"0xb\00596\004\00101", !1, !830}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!837 = !MDLocation(line: 598, column: 4, scope: !836)
!838 = !MDLocation(line: 599, column: 7, scope: !826)
!839 = !MDLocation(line: 600, column: 3, scope: !818)
!840 = !MDLocation(line: 601, column: 6, scope: !782)
!841 = !MDLocation(line: 602, column: 2, scope: !725)
!842 = !MDLocation(line: 604, column: 16, scope: !843)
!843 = !{!"0xb\00604\006\00102", !1, !674}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!844 = !MDLocation(line: 604, column: 7, scope: !843)
!845 = !MDLocation(line: 604, column: 6, scope: !674)
!846 = !MDLocation(line: 605, column: 4, scope: !843)
!847 = !MDLocation(line: 607, column: 2, scope: !674)
!848 = !MDLocation(line: 612, column: 11, scope: !674)
!849 = !MDLocation(line: 612, column: 2, scope: !674)
!850 = !MDLocation(line: 613, column: 2, scope: !674)
!851 = !MDLocation(line: 617, column: 22, scope: !852)
!852 = !{!"0xb\00617\006\00103", !1, !674}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!853 = !MDLocation(line: 617, column: 6, scope: !852)
!854 = !MDLocation(line: 617, column: 6, scope: !674)
!855 = !MDLocation(line: 618, column: 25, scope: !852)
!856 = !MDLocation(line: 618, column: 9, scope: !852)
!857 = !MDLocation(line: 619, column: 4, scope: !858)
!858 = !{!"0xb\00618\0047\00104", !1, !852}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!859 = !MDLocation(line: 622, column: 18, scope: !860)
!860 = !{!"0xb\00622\008\00105", !1, !858}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!861 = !MDLocation(line: 622, column: 9, scope: !860)
!862 = !MDLocation(line: 622, column: 8, scope: !858)
!863 = !MDLocation(line: 622, column: 44, scope: !864)
!864 = !{!"0xb\001", !1, !860}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!865 = !MDLocation(line: 622, column: 35, scope: !860)
!866 = !MDLocation(line: 623, column: 6, scope: !867)
!867 = !{!"0xb\00622\0058\00106", !1, !860}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!868 = !MDLocation(line: 625, column: 4, scope: !867)
!869 = !MDLocation(line: 626, column: 2, scope: !858)
!870 = !MDLocation(line: 629, column: 7, scope: !871)
!871 = !{!"0xb\00629\006\00107", !1, !674}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!872 = !MDLocation(line: 629, column: 6, scope: !674)
!873 = !MDLocation(line: 630, column: 8, scope: !874)
!874 = !{!"0xb\00629\0028\00108", !1, !871}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!875 = !MDLocation(line: 630, column: 19, scope: !876)
!876 = !{!"0xb\001", !1, !877}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!877 = !{!"0xb\00630\008\00109", !1, !874}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!878 = !MDLocation(line: 631, column: 8, scope: !874)
!879 = !MDLocation(line: 631, column: 18, scope: !880)
!880 = !{!"0xb\001", !1, !881}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!881 = !{!"0xb\00631\008\00110", !1, !874}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!882 = !MDLocation(line: 632, column: 2, scope: !874)
!883 = !MDLocation(line: 635, column: 6, scope: !884)
!884 = !{!"0xb\00635\006\00111", !1, !674}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!885 = !MDLocation(line: 635, column: 6, scope: !674)
!886 = !MDLocation(line: 636, column: 16, scope: !884)
!887 = !MDLocation(line: 636, column: 13, scope: !884)
!888 = !MDLocation(line: 636, column: 4, scope: !884)
!889 = !MDLocation(line: 639, column: 7, scope: !890)
!890 = !{!"0xb\00639\006\00112", !1, !674}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!891 = !MDLocation(line: 639, column: 6, scope: !674)
!892 = !MDLocation(line: 639, column: 55, scope: !890)
!893 = !MDLocation(line: 639, column: 39, scope: !890)
!894 = !MDLocation(line: 639, column: 30, scope: !890)
!895 = !MDLocation(line: 640, column: 31, scope: !890)
!896 = !MDLocation(line: 640, column: 15, scope: !890)
!897 = !MDLocation(line: 640, column: 6, scope: !890)
!898 = !MDLocation(line: 641, column: 20, scope: !899)
!899 = !{!"0xb\00640\0045\00113", !1, !890}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!900 = !MDLocation(line: 641, column: 18, scope: !899)
!901 = !MDLocation(line: 641, column: 13, scope: !899)
!902 = !MDLocation(line: 641, column: 4, scope: !899)
!903 = !MDLocation(line: 643, column: 9, scope: !904)
!904 = !{!"0xb\00643\008\00114", !1, !899}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!905 = !MDLocation(line: 643, column: 8, scope: !899)
!906 = !MDLocation(line: 647, column: 17, scope: !907)
!907 = !{!"0xb\00644\004\00115", !1, !904}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!908 = !MDLocation(line: 647, column: 12, scope: !907)
!909 = !MDLocation(line: 649, column: 10, scope: !910)
!910 = !{!"0xb\00649\0010\00116", !1, !907}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!911 = !MDLocation(line: 649, column: 10, scope: !912)
!912 = !{!"0xb\001", !1, !910}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!913 = !MDLocation(line: 649, column: 10, scope: !914)
!914 = !{!"0xb\002", !1, !910}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!915 = !MDLocation(line: 650, column: 10, scope: !910)
!916 = !MDLocation(line: 650, column: 23, scope: !910)
!917 = !MDLocation(line: 650, column: 6, scope: !910)
!918 = !MDLocation(line: 649, column: 10, scope: !907)
!919 = !MDLocation(line: 652, column: 8, scope: !920)
!920 = !{!"0xb\00651\006\00117", !1, !910}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!921 = !MDLocation(line: 653, column: 6, scope: !920)
!922 = !MDLocation(line: 654, column: 4, scope: !907)
!923 = !MDLocation(line: 659, column: 17, scope: !924)
!924 = !{!"0xb\00656\004\00118", !1, !904}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!925 = !MDLocation(line: 659, column: 12, scope: !924)
!926 = !MDLocation(line: 661, column: 11, scope: !927)
!927 = !{!"0xb\00661\0010\00119", !1, !924}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!928 = !MDLocation(line: 661, column: 11, scope: !929)
!929 = !{!"0xb\001", !1, !927}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!930 = !MDLocation(line: 661, column: 11, scope: !931)
!931 = !{!"0xb\002", !1, !927}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!932 = !MDLocation(line: 661, column: 11, scope: !933)
!933 = !{!"0xb\004", !1, !934}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!934 = !{!"0xb\003", !1, !927}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!935 = !MDLocation(line: 662, column: 10, scope: !927)
!936 = !MDLocation(line: 662, column: 22, scope: !927)
!937 = !MDLocation(line: 662, column: 5, scope: !927)
!938 = !MDLocation(line: 661, column: 10, scope: !927)
!939 = !MDLocation(line: 661, column: 10, scope: !924)
!940 = !MDLocation(line: 664, column: 8, scope: !941)
!941 = !{!"0xb\00663\006\00120", !1, !927}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!942 = !MDLocation(line: 665, column: 6, scope: !941)
!943 = !MDLocation(line: 669, column: 8, scope: !944)
!944 = !{!"0xb\00669\008\00121", !1, !899}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!945 = !MDLocation(line: 669, column: 8, scope: !899)
!946 = !MDLocation(line: 669, column: 24, scope: !947)
!947 = !{!"0xb\001", !1, !944}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!948 = !MDLocation(line: 670, column: 22, scope: !944)
!949 = !MDLocation(line: 670, column: 20, scope: !944)
!950 = !MDLocation(line: 670, column: 15, scope: !944)
!951 = !MDLocation(line: 670, column: 6, scope: !944)
!952 = !MDLocation(line: 673, column: 8, scope: !899)
!953 = !MDLocation(line: 675, column: 8, scope: !954)
!954 = !{!"0xb\00674\006\00123", !1, !955}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!955 = !{!"0xb\00673\008\00122", !1, !899}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!956 = !MDLocation(line: 678, column: 21, scope: !957)
!957 = !{!"0xb\00678\0012\00124", !1, !954}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!958 = !MDLocation(line: 678, column: 12, scope: !957)
!959 = !MDLocation(line: 678, column: 12, scope: !954)
!960 = !MDLocation(line: 680, column: 19, scope: !961)
!961 = !{!"0xb\00680\009\00126", !1, !962}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!962 = !{!"0xb\00679\003\00125", !1, !957}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!963 = !MDLocation(line: 680, column: 10, scope: !961)
!964 = !MDLocation(line: 680, column: 9, scope: !962)
!965 = !MDLocation(line: 681, column: 28, scope: !961)
!966 = !MDLocation(line: 681, column: 12, scope: !961)
!967 = !MDLocation(line: 681, column: 60, scope: !961)
!968 = !MDLocation(line: 681, column: 44, scope: !961)
!969 = !MDLocation(line: 683, column: 23, scope: !970)
!970 = !{!"0xb\00682\007\00127", !1, !961}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!971 = !MDLocation(line: 683, column: 21, scope: !970)
!972 = !MDLocation(line: 683, column: 18, scope: !970)
!973 = !MDLocation(line: 683, column: 9, scope: !970)
!974 = !MDLocation(line: 686, column: 13, scope: !975)
!975 = !{!"0xb\00686\0013\00128", !1, !970}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!976 = !MDLocation(line: 686, column: 13, scope: !970)
!977 = !MDLocation(line: 686, column: 45, scope: !978)
!978 = !{!"0xb\001", !1, !975}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!979 = !MDLocation(line: 686, column: 29, scope: !975)
!980 = !MDLocation(line: 688, column: 6, scope: !981)
!981 = !{!"0xb\00687\004\00129", !1, !975}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!982 = !MDLocation(line: 689, column: 4, scope: !981)
!983 = !MDLocation(line: 690, column: 7, scope: !970)
!984 = !MDLocation(line: 691, column: 3, scope: !962)
!985 = !MDLocation(line: 692, column: 21, scope: !986)
!986 = !{!"0xb\00692\0012\00130", !1, !954}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!987 = !MDLocation(line: 692, column: 12, scope: !986)
!988 = !MDLocation(line: 692, column: 12, scope: !954)
!989 = !MDLocation(line: 694, column: 20, scope: !990)
!990 = !{!"0xb\00694\0010\00132", !1, !991}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!991 = !{!"0xb\00693\003\00131", !1, !986}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!992 = !MDLocation(line: 694, column: 11, scope: !990)
!993 = !MDLocation(line: 694, column: 10, scope: !991)
!994 = !MDLocation(line: 695, column: 28, scope: !990)
!995 = !MDLocation(line: 695, column: 12, scope: !990)
!996 = !MDLocation(line: 695, column: 60, scope: !990)
!997 = !MDLocation(line: 695, column: 44, scope: !990)
!998 = !MDLocation(line: 697, column: 23, scope: !999)
!999 = !{!"0xb\00696\007\00133", !1, !990}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1000 = !MDLocation(line: 697, column: 21, scope: !999)
!1001 = !MDLocation(line: 697, column: 18, scope: !999)
!1002 = !MDLocation(line: 697, column: 9, scope: !999)
!1003 = !MDLocation(line: 700, column: 13, scope: !1004)
!1004 = !{!"0xb\00700\0013\00134", !1, !999}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1005 = !MDLocation(line: 700, column: 13, scope: !999)
!1006 = !MDLocation(line: 700, column: 45, scope: !1007)
!1007 = !{!"0xb\001", !1, !1004}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1008 = !MDLocation(line: 700, column: 29, scope: !1004)
!1009 = !MDLocation(line: 702, column: 6, scope: !1010)
!1010 = !{!"0xb\00701\004\00135", !1, !1004}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1011 = !MDLocation(line: 703, column: 4, scope: !1010)
!1012 = !MDLocation(line: 705, column: 7, scope: !999)
!1013 = !MDLocation(line: 706, column: 3, scope: !991)
!1014 = !MDLocation(line: 707, column: 6, scope: !954)
!1015 = !MDLocation(line: 708, column: 2, scope: !899)
!1016 = !MDLocation(line: 710, column: 16, scope: !1017)
!1017 = !{!"0xb\00710\006\00136", !1, !674}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1018 = !MDLocation(line: 710, column: 7, scope: !1017)
!1019 = !MDLocation(line: 710, column: 6, scope: !674)
!1020 = !MDLocation(line: 711, column: 4, scope: !1017)
!1021 = !MDLocation(line: 713, column: 2, scope: !674)
!1022 = !MDLocation(line: 716, column: 2, scope: !674)
!1023 = !MDLocation(line: 718, column: 6, scope: !1024)
!1024 = !{!"0xb\00718\006\00137", !1, !674}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1025 = !MDLocation(line: 718, column: 6, scope: !674)
!1026 = !MDLocation(line: 720, column: 12, scope: !1027)
!1027 = !{!"0xb\00719\006\00138", !1, !1024}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1028 = !MDLocation(line: 721, column: 12, scope: !1027)
!1029 = !MDLocation(line: 722, column: 6, scope: !1027)
!1030 = !MDLocation(line: 726, column: 6, scope: !1031)
!1031 = !{!"0xb\00726\006\00139", !1, !674}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1032 = !MDLocation(line: 726, column: 6, scope: !674)
!1033 = !MDLocation(line: 728, column: 8, scope: !1034)
!1034 = !{!"0xb\00727\006\00140", !1, !1031}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1035 = !MDLocation(line: 729, column: 19, scope: !1036)
!1036 = !{!"0xb\00729\0019\00141", !1, !1034}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1037 = !MDLocation(line: 729, column: 19, scope: !1034)
!1038 = !MDLocation(line: 729, column: 30, scope: !1039)
!1039 = !{!"0xb\001", !1, !1036}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1040 = !MDLocation(line: 731, column: 3, scope: !1041)
!1041 = !{!"0xb\00730\008\00142", !1, !1036}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1042 = !MDLocation(line: 732, column: 8, scope: !1041)
!1043 = !MDLocation(line: 734, column: 6, scope: !1034)
!1044 = !MDLocation(line: 737, column: 7, scope: !1045)
!1045 = !{!"0xb\00737\006\00143", !1, !674}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1046 = !MDLocation(line: 737, column: 6, scope: !674)
!1047 = !MDLocation(line: 739, column: 4, scope: !1048)
!1048 = !{!"0xb\00737\0028\00144", !1, !1045}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1049 = !MDLocation(line: 741, column: 8, scope: !1050)
!1050 = !{!"0xb\00741\008\00145", !1, !1048}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1051 = !MDLocation(line: 741, column: 8, scope: !1048)
!1052 = !MDLocation(line: 741, column: 19, scope: !1053)
!1053 = !{!"0xb\001", !1, !1050}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1054 = !MDLocation(line: 741, column: 19, scope: !1050)
!1055 = !MDLocation(line: 743, column: 3, scope: !1056)
!1056 = !{!"0xb\00742\008\00146", !1, !1050}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1057 = !MDLocation(line: 744, column: 8, scope: !1056)
!1058 = !MDLocation(line: 746, column: 9, scope: !1059)
!1059 = !{!"0xb\00746\008\00147", !1, !1048}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1060 = !MDLocation(line: 746, column: 8, scope: !1048)
!1061 = !MDLocation(line: 748, column: 6, scope: !1062)
!1062 = !{!"0xb\00746\0030\00148", !1, !1059}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1063 = !MDLocation(line: 749, column: 4, scope: !1062)
!1064 = !MDLocation(line: 750, column: 2, scope: !1048)
!1065 = !MDLocation(line: 752, column: 2, scope: !674)
!1066 = !MDLocation(line: 755, column: 2, scope: !674)
!1067 = !MDLocation(line: 756, column: 6, scope: !1068)
!1068 = !{!"0xb\00756\006\00149", !1, !674}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1069 = !MDLocation(line: 756, column: 6, scope: !674)
!1070 = !MDLocation(line: 758, column: 12, scope: !1071)
!1071 = !{!"0xb\00757\006\00150", !1, !1068}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1072 = !MDLocation(line: 759, column: 12, scope: !1071)
!1073 = !MDLocation(line: 760, column: 6, scope: !1071)
!1074 = !MDLocation(line: 763, column: 6, scope: !1075)
!1075 = !{!"0xb\00763\006\00151", !1, !674}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1076 = !MDLocation(line: 763, column: 6, scope: !674)
!1077 = !MDLocation(line: 765, column: 3, scope: !1078)
!1078 = !{!"0xb\00764\006\00152", !1, !1075}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1079 = !MDLocation(line: 766, column: 19, scope: !1080)
!1080 = !{!"0xb\00766\0019\00153", !1, !1078}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1081 = !MDLocation(line: 766, column: 19, scope: !1078)
!1082 = !MDLocation(line: 766, column: 30, scope: !1083)
!1083 = !{!"0xb\001", !1, !1080}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1084 = !MDLocation(line: 768, column: 3, scope: !1085)
!1085 = !{!"0xb\00767\008\00154", !1, !1080}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1086 = !MDLocation(line: 769, column: 8, scope: !1085)
!1087 = !MDLocation(line: 770, column: 6, scope: !1078)
!1088 = !MDLocation(line: 773, column: 7, scope: !1089)
!1089 = !{!"0xb\00773\006\00155", !1, !674}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1090 = !MDLocation(line: 773, column: 6, scope: !674)
!1091 = !MDLocation(line: 775, column: 4, scope: !1092)
!1092 = !{!"0xb\00773\0028\00156", !1, !1089}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1093 = !MDLocation(line: 777, column: 8, scope: !1094)
!1094 = !{!"0xb\00777\008\00157", !1, !1092}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1095 = !MDLocation(line: 777, column: 8, scope: !1092)
!1096 = !MDLocation(line: 777, column: 19, scope: !1097)
!1097 = !{!"0xb\001", !1, !1094}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1098 = !MDLocation(line: 777, column: 19, scope: !1094)
!1099 = !MDLocation(line: 779, column: 3, scope: !1100)
!1100 = !{!"0xb\00778\008\00158", !1, !1094}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1101 = !MDLocation(line: 780, column: 8, scope: !1100)
!1102 = !MDLocation(line: 782, column: 9, scope: !1103)
!1103 = !{!"0xb\00782\008\00159", !1, !1092}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1104 = !MDLocation(line: 782, column: 8, scope: !1092)
!1105 = !MDLocation(line: 784, column: 6, scope: !1106)
!1106 = !{!"0xb\00782\0030\00160", !1, !1103}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1107 = !MDLocation(line: 785, column: 4, scope: !1106)
!1108 = !MDLocation(line: 786, column: 2, scope: !1092)
!1109 = !MDLocation(line: 788, column: 2, scope: !674)
!1110 = !MDLocation(line: 791, column: 2, scope: !674)
!1111 = !MDLocation(line: 792, column: 2, scope: !674)
!1112 = !MDLocation(line: 795, column: 2, scope: !674)
!1113 = !MDLocation(line: 796, column: 2, scope: !674)
!1114 = !MDLocation(line: 799, column: 2, scope: !674)
!1115 = !MDLocation(line: 800, column: 2, scope: !674)
!1116 = !MDLocation(line: 803, column: 2, scope: !674)
!1117 = !MDLocation(line: 804, column: 2, scope: !674)
!1118 = !MDLocation(line: 807, column: 2, scope: !674)
!1119 = !MDLocation(line: 808, column: 2, scope: !674)
!1120 = !MDLocation(line: 811, column: 2, scope: !674)
!1121 = !MDLocation(line: 812, column: 2, scope: !674)
!1122 = !MDLocation(line: 815, column: 6, scope: !1123)
!1123 = !{!"0xb\00815\006\00161", !1, !674}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1124 = !MDLocation(line: 815, column: 6, scope: !674)
!1125 = !MDLocation(line: 817, column: 12, scope: !1126)
!1126 = !{!"0xb\00816\002\00162", !1, !1123}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1127 = !MDLocation(line: 817, column: 3, scope: !1126)
!1128 = !MDLocation(line: 821, column: 7, scope: !1129)
!1129 = !{!"0xb\00821\007\00163", !1, !1126}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1130 = !MDLocation(line: 821, column: 7, scope: !1126)
!1131 = !MDLocation(line: 822, column: 5, scope: !1129)
!1132 = !MDLocation(line: 823, column: 12, scope: !1133)
!1133 = !{!"0xb\00823\0012\00164", !1, !1129}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1134 = !MDLocation(line: 823, column: 12, scope: !1129)
!1135 = !MDLocation(line: 824, column: 5, scope: !1133)
!1136 = !MDLocation(line: 825, column: 12, scope: !1137)
!1137 = !{!"0xb\00825\0012\00165", !1, !1133}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1138 = !MDLocation(line: 825, column: 12, scope: !1133)
!1139 = !MDLocation(line: 826, column: 5, scope: !1140)
!1140 = !{!"0xb\00825\0023\00166", !1, !1137}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1141 = !MDLocation(line: 830, column: 10, scope: !1142)
!1142 = !{!"0xb\00830\009\00167", !1, !1140}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1143 = !MDLocation(line: 830, column: 9, scope: !1140)
!1144 = !MDLocation(line: 831, column: 7, scope: !1142)
!1145 = !MDLocation(line: 832, column: 3, scope: !1140)
!1146 = !MDLocation(line: 837, column: 7, scope: !1147)
!1147 = !{!"0xb\00837\007\00168", !1, !1126}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1148 = !MDLocation(line: 837, column: 7, scope: !1126)
!1149 = !MDLocation(line: 837, column: 31, scope: !1150)
!1150 = !{!"0xb\001", !1, !1147}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1151 = !MDLocation(line: 839, column: 15, scope: !1152)
!1152 = !{!"0xb\00839\007\00170", !1, !1153}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1153 = !{!"0xb\00838\003\00169", !1, !1147}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1154 = !MDLocation(line: 839, column: 7, scope: !1152)
!1155 = !MDLocation(line: 839, column: 7, scope: !1153)
!1156 = !MDLocation(line: 839, column: 45, scope: !1152)
!1157 = !MDLocation(line: 840, column: 17, scope: !1152)
!1158 = !MDLocation(line: 840, column: 14, scope: !1152)
!1159 = !MDLocation(line: 840, column: 5, scope: !1152)
!1160 = !MDLocation(line: 842, column: 5, scope: !1152)
!1161 = !MDLocation(line: 843, column: 31, scope: !1162)
!1162 = !{!"0xb\00843\007\00171", !1, !1153}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1163 = !MDLocation(line: 843, column: 15, scope: !1162)
!1164 = !MDLocation(line: 843, column: 7, scope: !1162)
!1165 = !MDLocation(line: 843, column: 7, scope: !1153)
!1166 = !MDLocation(line: 843, column: 56, scope: !1167)
!1167 = !{!"0xb\001", !1, !1162}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1168 = !MDLocation(line: 843, column: 47, scope: !1162)
!1169 = !MDLocation(line: 844, column: 33, scope: !1162)
!1170 = !MDLocation(line: 844, column: 17, scope: !1162)
!1171 = !MDLocation(line: 844, column: 14, scope: !1162)
!1172 = !MDLocation(line: 844, column: 5, scope: !1162)
!1173 = !MDLocation(line: 846, column: 5, scope: !1162)
!1174 = !MDLocation(line: 847, column: 31, scope: !1175)
!1175 = !{!"0xb\00847\007\00172", !1, !1153}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1176 = !MDLocation(line: 847, column: 15, scope: !1175)
!1177 = !MDLocation(line: 847, column: 7, scope: !1175)
!1178 = !MDLocation(line: 847, column: 7, scope: !1153)
!1179 = !MDLocation(line: 847, column: 56, scope: !1180)
!1180 = !{!"0xb\001", !1, !1175}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1181 = !MDLocation(line: 847, column: 47, scope: !1175)
!1182 = !MDLocation(line: 848, column: 33, scope: !1175)
!1183 = !MDLocation(line: 848, column: 17, scope: !1175)
!1184 = !MDLocation(line: 848, column: 14, scope: !1175)
!1185 = !MDLocation(line: 848, column: 5, scope: !1175)
!1186 = !MDLocation(line: 850, column: 5, scope: !1175)
!1187 = !MDLocation(line: 851, column: 3, scope: !1153)
!1188 = !MDLocation(line: 855, column: 4, scope: !1189)
!1189 = !{!"0xb\00853\003\00173", !1, !1147}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1190 = !MDLocation(line: 857, column: 2, scope: !1126)
!1191 = !MDLocation(line: 860, column: 12, scope: !1192)
!1192 = !{!"0xb\00859\002\00174", !1, !1123}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1193 = !MDLocation(line: 860, column: 3, scope: !1192)
!1194 = !MDLocation(line: 862, column: 2, scope: !674)
!1195 = !MDLocation(line: 865, column: 6, scope: !1196)
!1196 = !{!"0xb\00865\006\00175", !1, !674}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1197 = !MDLocation(line: 865, column: 6, scope: !674)
!1198 = !MDLocation(line: 867, column: 12, scope: !1199)
!1199 = !{!"0xb\00866\002\00176", !1, !1196}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1200 = !MDLocation(line: 867, column: 3, scope: !1199)
!1201 = !MDLocation(line: 871, column: 7, scope: !1202)
!1202 = !{!"0xb\00871\007\00177", !1, !1199}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1203 = !MDLocation(line: 871, column: 7, scope: !1199)
!1204 = !MDLocation(line: 872, column: 5, scope: !1202)
!1205 = !MDLocation(line: 873, column: 12, scope: !1206)
!1206 = !{!"0xb\00873\0012\00178", !1, !1202}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1207 = !MDLocation(line: 873, column: 12, scope: !1202)
!1208 = !MDLocation(line: 874, column: 5, scope: !1206)
!1209 = !MDLocation(line: 875, column: 12, scope: !1210)
!1210 = !{!"0xb\00875\0012\00179", !1, !1206}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1211 = !MDLocation(line: 875, column: 12, scope: !1206)
!1212 = !MDLocation(line: 876, column: 5, scope: !1213)
!1213 = !{!"0xb\00875\0024\00180", !1, !1210}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1214 = !MDLocation(line: 880, column: 10, scope: !1215)
!1215 = !{!"0xb\00880\009\00181", !1, !1213}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1216 = !MDLocation(line: 880, column: 9, scope: !1213)
!1217 = !MDLocation(line: 881, column: 7, scope: !1215)
!1218 = !MDLocation(line: 882, column: 3, scope: !1213)
!1219 = !MDLocation(line: 887, column: 7, scope: !1220)
!1220 = !{!"0xb\00887\007\00182", !1, !1199}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1221 = !MDLocation(line: 887, column: 7, scope: !1199)
!1222 = !MDLocation(line: 887, column: 31, scope: !1223)
!1223 = !{!"0xb\001", !1, !1220}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1224 = !MDLocation(line: 889, column: 15, scope: !1225)
!1225 = !{!"0xb\00889\007\00184", !1, !1226}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1226 = !{!"0xb\00888\003\00183", !1, !1220}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1227 = !MDLocation(line: 889, column: 7, scope: !1225)
!1228 = !MDLocation(line: 889, column: 7, scope: !1226)
!1229 = !MDLocation(line: 889, column: 45, scope: !1225)
!1230 = !MDLocation(line: 890, column: 33, scope: !1225)
!1231 = !MDLocation(line: 890, column: 27, scope: !1225)
!1232 = !MDLocation(line: 890, column: 17, scope: !1225)
!1233 = !MDLocation(line: 890, column: 14, scope: !1225)
!1234 = !MDLocation(line: 890, column: 5, scope: !1225)
!1235 = !MDLocation(line: 892, column: 5, scope: !1225)
!1236 = !MDLocation(line: 893, column: 31, scope: !1237)
!1237 = !{!"0xb\00893\007\00185", !1, !1226}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1238 = !MDLocation(line: 893, column: 15, scope: !1237)
!1239 = !MDLocation(line: 893, column: 7, scope: !1237)
!1240 = !MDLocation(line: 893, column: 7, scope: !1226)
!1241 = !MDLocation(line: 893, column: 56, scope: !1242)
!1242 = !{!"0xb\001", !1, !1237}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1243 = !MDLocation(line: 893, column: 47, scope: !1237)
!1244 = !MDLocation(line: 894, column: 49, scope: !1237)
!1245 = !MDLocation(line: 894, column: 33, scope: !1237)
!1246 = !MDLocation(line: 894, column: 27, scope: !1237)
!1247 = !MDLocation(line: 894, column: 17, scope: !1237)
!1248 = !MDLocation(line: 894, column: 14, scope: !1237)
!1249 = !MDLocation(line: 894, column: 5, scope: !1237)
!1250 = !MDLocation(line: 896, column: 5, scope: !1237)
!1251 = !MDLocation(line: 897, column: 31, scope: !1252)
!1252 = !{!"0xb\00897\007\00186", !1, !1226}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1253 = !MDLocation(line: 897, column: 15, scope: !1252)
!1254 = !MDLocation(line: 897, column: 7, scope: !1252)
!1255 = !MDLocation(line: 897, column: 7, scope: !1226)
!1256 = !MDLocation(line: 897, column: 56, scope: !1257)
!1257 = !{!"0xb\001", !1, !1252}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1258 = !MDLocation(line: 897, column: 47, scope: !1252)
!1259 = !MDLocation(line: 898, column: 49, scope: !1252)
!1260 = !MDLocation(line: 898, column: 33, scope: !1252)
!1261 = !MDLocation(line: 898, column: 27, scope: !1252)
!1262 = !MDLocation(line: 898, column: 17, scope: !1252)
!1263 = !MDLocation(line: 898, column: 14, scope: !1252)
!1264 = !MDLocation(line: 898, column: 5, scope: !1252)
!1265 = !MDLocation(line: 900, column: 5, scope: !1252)
!1266 = !MDLocation(line: 901, column: 3, scope: !1226)
!1267 = !MDLocation(line: 904, column: 5, scope: !1268)
!1268 = !{!"0xb\00903\003\00187", !1, !1220}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1269 = !MDLocation(line: 906, column: 2, scope: !1199)
!1270 = !MDLocation(line: 909, column: 12, scope: !1271)
!1271 = !{!"0xb\00908\002\00188", !1, !1196}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1272 = !MDLocation(line: 909, column: 3, scope: !1271)
!1273 = !MDLocation(line: 911, column: 2, scope: !674)
!1274 = !MDLocation(line: 913, column: 3, scope: !655)
!1275 = !MDLocation(line: 493, column: 42, scope: !651)
!1276 = !MDLocation(line: 493, column: 3, scope: !651)
!1277 = !MDLocation(line: 916, column: 7, scope: !1278)
!1278 = !{!"0xb\00916\007\00189", !1, !24}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1279 = !MDLocation(line: 916, column: 7, scope: !24)
!1280 = !MDLocation(line: 916, column: 29, scope: !1281)
!1281 = !{!"0xb\001", !1, !1278}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1282 = !MDLocation(line: 919, column: 10, scope: !1283)
!1283 = !{!"0xb\00919\009\00191", !1, !1284}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1284 = !{!"0xb\00917\003\00190", !1, !1278}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1285 = !MDLocation(line: 919, column: 9, scope: !1284)
!1286 = !MDLocation(line: 919, column: 23, scope: !1287)
!1287 = !{!"0xb\001", !1, !1283}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1288 = !MDLocation(line: 920, column: 7, scope: !1283)
!1289 = !MDLocation(line: 921, column: 10, scope: !1290)
!1290 = !{!"0xb\00921\009\00192", !1, !1284}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1291 = !MDLocation(line: 921, column: 9, scope: !1284)
!1292 = !MDLocation(line: 921, column: 23, scope: !1293)
!1293 = !{!"0xb\001", !1, !1290}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1294 = !MDLocation(line: 922, column: 7, scope: !1290)
!1295 = !MDLocation(line: 923, column: 10, scope: !1296)
!1296 = !{!"0xb\00923\009\00193", !1, !1284}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1297 = !MDLocation(line: 923, column: 9, scope: !1284)
!1298 = !MDLocation(line: 923, column: 24, scope: !1299)
!1299 = !{!"0xb\001", !1, !1296}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1300 = !MDLocation(line: 924, column: 7, scope: !1296)
!1301 = !MDLocation(line: 925, column: 10, scope: !1302)
!1302 = !{!"0xb\00925\009\00194", !1, !1284}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1303 = !MDLocation(line: 925, column: 9, scope: !1284)
!1304 = !MDLocation(line: 925, column: 24, scope: !1305)
!1305 = !{!"0xb\001", !1, !1302}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1306 = !MDLocation(line: 926, column: 7, scope: !1302)
!1307 = !MDLocation(line: 927, column: 3, scope: !1284)
!1308 = !MDLocation(line: 929, column: 7, scope: !1309)
!1309 = !{!"0xb\00929\007\00195", !1, !24}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1310 = !MDLocation(line: 929, column: 7, scope: !24)
!1311 = !MDLocation(line: 929, column: 29, scope: !1312)
!1312 = !{!"0xb\001", !1, !1309}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1313 = !MDLocation(line: 932, column: 23, scope: !1314)
!1314 = !{!"0xb\00930\003\00196", !1, !1309}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1315 = !{!"0x100\00wking_pawn_file\00395\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [wking_pawn_file] [line 395]
!1316 = !MDLocation(line: 395, column: 14, scope: !24)
!1317 = !MDLocation(line: 933, column: 23, scope: !1314)
!1318 = !{!"0x100\00bking_pawn_file\00395\000", !24, !11, !17} ; [ DW_TAG_auto_variable ] [bking_pawn_file] [line 395]
!1319 = !MDLocation(line: 395, column: 31, scope: !24)
!1320 = !MDLocation(line: 937, column: 13, scope: !1321)
!1321 = !{!"0xb\00937\009\00197", !1, !1314}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1322 = !MDLocation(line: 937, column: 9, scope: !1321)
!1323 = !MDLocation(line: 937, column: 9, scope: !1314)
!1324 = !MDLocation(line: 939, column: 32, scope: !1325)
!1325 = !{!"0xb\00937\0051\00198", !1, !1321}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1326 = !MDLocation(line: 939, column: 22, scope: !1325)
!1327 = !MDLocation(line: 939, column: 19, scope: !1325)
!1328 = !MDLocation(line: 939, column: 7, scope: !1325)
!1329 = !MDLocation(line: 940, column: 48, scope: !1325)
!1330 = !MDLocation(line: 940, column: 32, scope: !1325)
!1331 = !MDLocation(line: 940, column: 22, scope: !1325)
!1332 = !MDLocation(line: 940, column: 19, scope: !1325)
!1333 = !MDLocation(line: 940, column: 7, scope: !1325)
!1334 = !MDLocation(line: 941, column: 48, scope: !1325)
!1335 = !MDLocation(line: 941, column: 32, scope: !1325)
!1336 = !MDLocation(line: 941, column: 22, scope: !1325)
!1337 = !MDLocation(line: 941, column: 19, scope: !1325)
!1338 = !MDLocation(line: 941, column: 7, scope: !1325)
!1339 = !MDLocation(line: 944, column: 22, scope: !1325)
!1340 = !MDLocation(line: 944, column: 19, scope: !1325)
!1341 = !MDLocation(line: 944, column: 7, scope: !1325)
!1342 = !MDLocation(line: 945, column: 38, scope: !1325)
!1343 = !MDLocation(line: 945, column: 22, scope: !1325)
!1344 = !MDLocation(line: 945, column: 19, scope: !1325)
!1345 = !MDLocation(line: 945, column: 7, scope: !1325)
!1346 = !MDLocation(line: 946, column: 38, scope: !1325)
!1347 = !MDLocation(line: 946, column: 22, scope: !1325)
!1348 = !MDLocation(line: 946, column: 19, scope: !1325)
!1349 = !MDLocation(line: 946, column: 7, scope: !1325)
!1350 = !MDLocation(line: 949, column: 12, scope: !1351)
!1351 = !{!"0xb\00949\0011\00199", !1, !1325}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1352 = !MDLocation(line: 949, column: 11, scope: !1325)
!1353 = !MDLocation(line: 950, column: 9, scope: !1351)
!1354 = !MDLocation(line: 951, column: 21, scope: !1355)
!1355 = !{!"0xb\00951\0011\00200", !1, !1325}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1356 = !MDLocation(line: 951, column: 12, scope: !1355)
!1357 = !MDLocation(line: 951, column: 11, scope: !1325)
!1358 = !MDLocation(line: 952, column: 9, scope: !1355)
!1359 = !MDLocation(line: 953, column: 21, scope: !1360)
!1360 = !{!"0xb\00953\0011\00201", !1, !1325}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1361 = !MDLocation(line: 953, column: 12, scope: !1360)
!1362 = !MDLocation(line: 953, column: 11, scope: !1325)
!1363 = !MDLocation(line: 954, column: 9, scope: !1360)
!1364 = !MDLocation(line: 957, column: 12, scope: !1365)
!1365 = !{!"0xb\00957\0011\00202", !1, !1325}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1366 = !MDLocation(line: 957, column: 11, scope: !1325)
!1367 = !MDLocation(line: 958, column: 9, scope: !1365)
!1368 = !MDLocation(line: 959, column: 21, scope: !1369)
!1369 = !{!"0xb\00959\0011\00203", !1, !1325}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1370 = !MDLocation(line: 959, column: 12, scope: !1369)
!1371 = !MDLocation(line: 959, column: 11, scope: !1325)
!1372 = !MDLocation(line: 960, column: 9, scope: !1369)
!1373 = !MDLocation(line: 961, column: 21, scope: !1374)
!1374 = !{!"0xb\00961\0011\00204", !1, !1325}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1375 = !MDLocation(line: 961, column: 12, scope: !1374)
!1376 = !MDLocation(line: 961, column: 11, scope: !1325)
!1377 = !MDLocation(line: 962, column: 9, scope: !1374)
!1378 = !MDLocation(line: 963, column: 5, scope: !1325)
!1379 = !MDLocation(line: 964, column: 3, scope: !1314)
!1380 = !MDLocation(line: 966, column: 7, scope: !1381)
!1381 = !{!"0xb\00966\007\00205", !1, !24}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1382 = !MDLocation(line: 966, column: 7, scope: !24)
!1383 = !MDLocation(line: 968, column: 4, scope: !1384)
!1384 = !{!"0xb\00967\003\00206", !1, !1381}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1385 = !MDLocation(line: 969, column: 3, scope: !1384)
!1386 = !MDLocation(line: 970, column: 7, scope: !1387)
!1387 = !{!"0xb\00970\007\00207", !1, !24}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1388 = !MDLocation(line: 970, column: 7, scope: !24)
!1389 = !MDLocation(line: 972, column: 4, scope: !1390)
!1390 = !{!"0xb\00971\003\00208", !1, !1387}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1391 = !MDLocation(line: 973, column: 3, scope: !1390)
!1392 = !MDLocation(line: 978, column: 6, scope: !24)
!1393 = !MDLocation(line: 980, column: 4, scope: !1394)
!1394 = !{!"0xb\00979\002\00210", !1, !1395}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1395 = !{!"0xb\00978\006\00209", !1, !24}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1396 = !MDLocation(line: 981, column: 2, scope: !1394)
!1397 = !MDLocation(line: 983, column: 6, scope: !24)
!1398 = !MDLocation(line: 985, column: 4, scope: !1399)
!1399 = !{!"0xb\00984\002\00212", !1, !1400}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1400 = !{!"0xb\00983\006\00211", !1, !24}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1401 = !MDLocation(line: 986, column: 2, scope: !1399)
!1402 = !MDLocation(line: 989, column: 6, scope: !24)
!1403 = !MDLocation(line: 992, column: 11, scope: !1404)
!1404 = !{!"0xb\00990\005\00214", !1, !1405}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1405 = !{!"0xb\00989\006\00213", !1, !24}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1406 = !MDLocation(line: 994, column: 8, scope: !1407)
!1407 = !{!"0xb\00993\002\00216", !1, !1408}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1408 = !{!"0xb\00992\0011\00215", !1, !1404}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1409 = !MDLocation(line: 998, column: 12, scope: !1410)
!1410 = !{!"0xb\00998\0012\00219", !1, !1411}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1411 = !{!"0xb\00995\006\00218", !1, !1412}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1412 = !{!"0xb\00994\008\00217", !1, !1407}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1413 = !MDLocation(line: 998, column: 12, scope: !1411)
!1414 = !MDLocation(line: 998, column: 22, scope: !1415)
!1415 = !{!"0xb\001", !1, !1410}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1416 = !MDLocation(line: 1000, column: 5, scope: !1417)
!1417 = !{!"0xb\00999\003\00220", !1, !1410}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1418 = !MDLocation(line: 1001, column: 3, scope: !1417)
!1419 = !MDLocation(line: 1002, column: 6, scope: !1411)
!1420 = !MDLocation(line: 1003, column: 13, scope: !1412)
!1421 = !MDLocation(line: 1008, column: 16, scope: !1422)
!1422 = !{!"0xb\001008\0012\00223", !1, !1423}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1423 = !{!"0xb\001004\006\00222", !1, !1424}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1424 = !{!"0xb\001003\0013\00221", !1, !1412}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1425 = !MDLocation(line: 1008, column: 12, scope: !1422)
!1426 = !MDLocation(line: 1008, column: 12, scope: !1423)
!1427 = !MDLocation(line: 1010, column: 5, scope: !1428)
!1428 = !{!"0xb\001009\003\00224", !1, !1422}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1429 = !MDLocation(line: 1011, column: 3, scope: !1428)
!1430 = !MDLocation(line: 1012, column: 6, scope: !1423)
!1431 = !MDLocation(line: 1013, column: 14, scope: !1432)
!1432 = !{!"0xb\001013\0013\00225", !1, !1424}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1433 = !MDLocation(line: 1013, column: 13, scope: !1424)
!1434 = !MDLocation(line: 1013, column: 33, scope: !1435)
!1435 = !{!"0xb\003", !1, !1436}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1436 = !{!"0xb\002", !1, !1432}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1437 = !MDLocation(line: 1016, column: 13, scope: !1438)
!1438 = !{!"0xb\001016\0012\00227", !1, !1439}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1439 = !{!"0xb\001014\006\00226", !1, !1432}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1440 = !MDLocation(line: 1016, column: 12, scope: !1439)
!1441 = !MDLocation(line: 1016, column: 32, scope: !1442)
!1442 = !{!"0xb\003", !1, !1443}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1443 = !{!"0xb\002", !1, !1438}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1444 = !MDLocation(line: 1019, column: 5, scope: !1445)
!1445 = !{!"0xb\001017\003\00228", !1, !1438}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1446 = !MDLocation(line: 1020, column: 3, scope: !1445)
!1447 = !MDLocation(line: 1021, column: 6, scope: !1439)
!1448 = !MDLocation(line: 1022, column: 2, scope: !1407)
!1449 = !MDLocation(line: 1023, column: 16, scope: !1408)
!1450 = !MDLocation(line: 1025, column: 8, scope: !1451)
!1451 = !{!"0xb\001025\008\00231", !1, !1452}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1452 = !{!"0xb\001024\002\00230", !1, !1453}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1453 = !{!"0xb\001023\0016\00229", !1, !1408}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1454 = !MDLocation(line: 1025, column: 8, scope: !1452)
!1455 = !MDLocation(line: 1025, column: 19, scope: !1456)
!1456 = !{!"0xb\001", !1, !1451}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1457 = !MDLocation(line: 1028, column: 13, scope: !1458)
!1458 = !{!"0xb\001028\0012\00233", !1, !1459}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1459 = !{!"0xb\001026\006\00232", !1, !1451}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1460 = !MDLocation(line: 1028, column: 12, scope: !1458)
!1461 = !MDLocation(line: 1028, column: 12, scope: !1459)
!1462 = !MDLocation(line: 1028, column: 30, scope: !1458)
!1463 = !MDLocation(line: 1028, column: 29, scope: !1458)
!1464 = !MDLocation(line: 1032, column: 5, scope: !1465)
!1465 = !{!"0xb\001029\003\00234", !1, !1458}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1466 = !MDLocation(line: 1033, column: 3, scope: !1465)
!1467 = !MDLocation(line: 1034, column: 6, scope: !1459)
!1468 = !MDLocation(line: 1035, column: 13, scope: !1469)
!1469 = !{!"0xb\001035\0013\00235", !1, !1451}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1470 = !MDLocation(line: 1035, column: 13, scope: !1451)
!1471 = !MDLocation(line: 1040, column: 13, scope: !1472)
!1472 = !{!"0xb\001040\0012\00237", !1, !1473}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1473 = !{!"0xb\001036\006\00236", !1, !1469}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1474 = !MDLocation(line: 1040, column: 12, scope: !1473)
!1475 = !MDLocation(line: 1040, column: 33, scope: !1472)
!1476 = !MDLocation(line: 1040, column: 32, scope: !1472)
!1477 = !MDLocation(line: 1040, column: 53, scope: !1472)
!1478 = !MDLocation(line: 1040, column: 52, scope: !1472)
!1479 = !MDLocation(line: 1042, column: 5, scope: !1480)
!1480 = !{!"0xb\001041\003\00238", !1, !1472}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1481 = !MDLocation(line: 1043, column: 3, scope: !1480)
!1482 = !MDLocation(line: 1044, column: 6, scope: !1473)
!1483 = !MDLocation(line: 1045, column: 13, scope: !1484)
!1484 = !{!"0xb\001045\0013\00239", !1, !1469}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1485 = !MDLocation(line: 1045, column: 13, scope: !1469)
!1486 = !MDLocation(line: 1050, column: 13, scope: !1487)
!1487 = !{!"0xb\001050\0012\00241", !1, !1488}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1488 = !{!"0xb\001046\006\00240", !1, !1484}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1489 = !MDLocation(line: 1050, column: 12, scope: !1488)
!1490 = !MDLocation(line: 1050, column: 33, scope: !1487)
!1491 = !MDLocation(line: 1050, column: 32, scope: !1487)
!1492 = !MDLocation(line: 1050, column: 53, scope: !1487)
!1493 = !MDLocation(line: 1050, column: 52, scope: !1487)
!1494 = !MDLocation(line: 1052, column: 5, scope: !1495)
!1495 = !{!"0xb\001051\003\00242", !1, !1487}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1496 = !MDLocation(line: 1053, column: 3, scope: !1495)
!1497 = !MDLocation(line: 1054, column: 6, scope: !1488)
!1498 = !MDLocation(line: 1055, column: 2, scope: !1452)
!1499 = !MDLocation(line: 1056, column: 5, scope: !1404)
!1500 = !MDLocation(line: 1060, column: 12, scope: !1501)
!1501 = !{!"0xb\001060\0011\00244", !1, !1502}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1502 = !{!"0xb\001058\005\00243", !1, !1405}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1503 = !MDLocation(line: 1060, column: 25, scope: !1501)
!1504 = !MDLocation(line: 1060, column: 11, scope: !1501)
!1505 = !MDLocation(line: 1060, column: 11, scope: !1502)
!1506 = !MDLocation(line: 1063, column: 9, scope: !1507)
!1507 = !{!"0xb\001063\008\00246", !1, !1508}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1508 = !{!"0xb\001061\002\00245", !1, !1501}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1509 = !MDLocation(line: 1063, column: 22, scope: !1507)
!1510 = !MDLocation(line: 1063, column: 8, scope: !1507)
!1511 = !MDLocation(line: 1063, column: 8, scope: !1508)
!1512 = !MDLocation(line: 1065, column: 13, scope: !1513)
!1513 = !{!"0xb\001065\0012\00248", !1, !1514}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1514 = !{!"0xb\001064\006\00247", !1, !1507}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1515 = !MDLocation(line: 1065, column: 25, scope: !1513)
!1516 = !MDLocation(line: 1065, column: 12, scope: !1513)
!1517 = !MDLocation(line: 1065, column: 12, scope: !1514)
!1518 = !MDLocation(line: 1068, column: 5, scope: !1519)
!1519 = !{!"0xb\001066\003\00249", !1, !1513}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1520 = !MDLocation(line: 1069, column: 3, scope: !1519)
!1521 = !MDLocation(line: 1073, column: 5, scope: !1522)
!1522 = !{!"0xb\001071\003\00250", !1, !1513}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1523 = !MDLocation(line: 1075, column: 6, scope: !1514)
!1524 = !MDLocation(line: 1076, column: 18, scope: !1525)
!1525 = !{!"0xb\001076\0013\00251", !1, !1507}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1526 = !MDLocation(line: 1076, column: 30, scope: !1525)
!1527 = !MDLocation(line: 1076, column: 17, scope: !1525)
!1528 = !MDLocation(line: 1076, column: 13, scope: !1525)
!1529 = !MDLocation(line: 1076, column: 13, scope: !1507)
!1530 = !MDLocation(line: 1080, column: 13, scope: !1531)
!1531 = !{!"0xb\001080\0012\00253", !1, !1532}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1532 = !{!"0xb\001077\006\00252", !1, !1525}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1533 = !MDLocation(line: 1080, column: 25, scope: !1531)
!1534 = !MDLocation(line: 1080, column: 12, scope: !1531)
!1535 = !MDLocation(line: 1080, column: 12, scope: !1532)
!1536 = !MDLocation(line: 1083, column: 5, scope: !1537)
!1537 = !{!"0xb\001081\003\00254", !1, !1531}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1538 = !MDLocation(line: 1084, column: 3, scope: !1537)
!1539 = !MDLocation(line: 1085, column: 18, scope: !1540)
!1540 = !{!"0xb\001085\0017\00255", !1, !1531}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1541 = !MDLocation(line: 1085, column: 30, scope: !1540)
!1542 = !MDLocation(line: 1085, column: 17, scope: !1540)
!1543 = !MDLocation(line: 1085, column: 17, scope: !1531)
!1544 = !MDLocation(line: 1087, column: 5, scope: !1545)
!1545 = !{!"0xb\001086\003\00256", !1, !1540}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1546 = !MDLocation(line: 1088, column: 3, scope: !1545)
!1547 = !MDLocation(line: 1089, column: 6, scope: !1532)
!1548 = !MDLocation(line: 1090, column: 18, scope: !1549)
!1549 = !{!"0xb\001090\0013\00257", !1, !1525}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1550 = !MDLocation(line: 1090, column: 30, scope: !1549)
!1551 = !MDLocation(line: 1090, column: 17, scope: !1549)
!1552 = !MDLocation(line: 1090, column: 13, scope: !1549)
!1553 = !MDLocation(line: 1090, column: 13, scope: !1525)
!1554 = !MDLocation(line: 1094, column: 13, scope: !1555)
!1555 = !{!"0xb\001094\0012\00259", !1, !1556}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1556 = !{!"0xb\001091\006\00258", !1, !1549}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1557 = !MDLocation(line: 1094, column: 25, scope: !1555)
!1558 = !MDLocation(line: 1094, column: 12, scope: !1555)
!1559 = !MDLocation(line: 1094, column: 12, scope: !1556)
!1560 = !MDLocation(line: 1097, column: 5, scope: !1561)
!1561 = !{!"0xb\001095\003\00260", !1, !1555}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1562 = !MDLocation(line: 1098, column: 3, scope: !1561)
!1563 = !MDLocation(line: 1099, column: 18, scope: !1564)
!1564 = !{!"0xb\001099\0017\00261", !1, !1555}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1565 = !MDLocation(line: 1099, column: 30, scope: !1564)
!1566 = !MDLocation(line: 1099, column: 17, scope: !1564)
!1567 = !MDLocation(line: 1099, column: 17, scope: !1555)
!1568 = !MDLocation(line: 1101, column: 5, scope: !1569)
!1569 = !{!"0xb\001100\003\00262", !1, !1564}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1570 = !MDLocation(line: 1102, column: 3, scope: !1569)
!1571 = !MDLocation(line: 1104, column: 6, scope: !1556)
!1572 = !MDLocation(line: 1105, column: 2, scope: !1508)
!1573 = !MDLocation(line: 1106, column: 17, scope: !1574)
!1574 = !{!"0xb\001106\0016\00263", !1, !1501}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1575 = !MDLocation(line: 1106, column: 30, scope: !1574)
!1576 = !MDLocation(line: 1106, column: 16, scope: !1574)
!1577 = !MDLocation(line: 1106, column: 16, scope: !1501)
!1578 = !MDLocation(line: 1108, column: 8, scope: !1579)
!1579 = !{!"0xb\001107\002\00264", !1, !1574}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1580 = !MDLocation(line: 1110, column: 8, scope: !1581)
!1581 = !{!"0xb\001109\006\00266", !1, !1582}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1582 = !{!"0xb\001108\008\00265", !1, !1579}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1583 = !MDLocation(line: 1111, column: 6, scope: !1581)
!1584 = !MDLocation(line: 1112, column: 13, scope: !1582)
!1585 = !MDLocation(line: 1114, column: 8, scope: !1586)
!1586 = !{!"0xb\001113\006\00268", !1, !1587}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1587 = !{!"0xb\001112\0013\00267", !1, !1582}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1588 = !MDLocation(line: 1115, column: 6, scope: !1586)
!1589 = !MDLocation(line: 1116, column: 2, scope: !1579)
!1590 = !MDLocation(line: 1119, column: 16, scope: !24)
!1591 = !MDLocation(line: 1119, column: 4, scope: !24)
!1592 = !MDLocation(line: 1121, column: 12, scope: !1593)
!1593 = !{!"0xb\001121\008\00269", !1, !24}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1594 = !MDLocation(line: 1121, column: 23, scope: !1593)
!1595 = !MDLocation(line: 1121, column: 8, scope: !1593)
!1596 = !MDLocation(line: 1121, column: 32, scope: !1593)
!1597 = !MDLocation(line: 1121, column: 8, scope: !24)
!1598 = !MDLocation(line: 1122, column: 20, scope: !1593)
!1599 = !MDLocation(line: 1122, column: 20, scope: !1600)
!1600 = !{!"0xb\001", !1, !1593}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1601 = !MDLocation(line: 1122, column: 20, scope: !1602)
!1602 = !{!"0xb\002", !1, !1593}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1603 = !MDLocation(line: 1122, column: 7, scope: !1604)
!1604 = !{!"0xb\004", !1, !1605}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1605 = !{!"0xb\003", !1, !1593}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1606 = !MDLocation(line: 1125, column: 7, scope: !1607)
!1607 = !{!"0xb\001125\007\00270", !1, !24}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1608 = !MDLocation(line: 1125, column: 7, scope: !24)
!1609 = !MDLocation(line: 1126, column: 12, scope: !1610)
!1610 = !{!"0xb\001125\0027\00271", !1, !1607}    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1611 = !MDLocation(line: 1126, column: 5, scope: !1610)
!1612 = !MDLocation(line: 1129, column: 13, scope: !1613)
!1613 = !{!"0xb\001128\008\00272", !1, !1607}     ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/sjeng/neval.c]
!1614 = !MDLocation(line: 1129, column: 12, scope: !1613)
!1615 = !MDLocation(line: 1129, column: 5, scope: !1613)
!1616 = !MDLocation(line: 1131, column: 1, scope: !24)
