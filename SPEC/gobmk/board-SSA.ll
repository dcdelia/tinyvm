; ModuleID = 'board.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Hash_data = type { [1 x i64] }
%struct.SGFTree_t = type { %struct.SGFNode_t*, %struct.SGFNode_t* }
%struct.SGFNode_t = type { %struct.SGFProperty_t*, %struct.SGFNode_t*, %struct.SGFNode_t*, %struct.SGFNode_t* }
%struct.SGFProperty_t = type { %struct.SGFProperty_t*, i16, i8* }
%struct.stats_data = type { i32, i32, i32, i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.string_data = type { i32, i32, i32, i32, [20 x i32], i32, [160 x i32], i32 }
%struct.change_stack_entry = type { i32*, i32 }
%struct.vertex_stack_entry = type { i8*, i32 }
%struct.board_state = type { i32, [421 x i8], i32, i32, i32, [421 x i8], i32, i32, i32, [500 x i32], [500 x i32], i32, float, i32 }

@deltai = global [8 x i32] [i32 1, i32 0, i32 -1, i32 0, i32 1, i32 -1, i32 -1, i32 1], align 16
@deltaj = global [8 x i32] [i32 0, i32 -1, i32 0, i32 1, i32 -1, i32 -1, i32 1, i32 1], align 16
@delta = global [8 x i32] [i32 20, i32 -1, i32 -20, i32 1, i32 19, i32 -21, i32 -19, i32 21], align 16
@stackp = external global i32
@.str = private unnamed_addr constant [8 x i8] c"board.c\00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c"stackp == 0\00", align 1
@board_size = external global i32
@board = external global [421 x i8]
@initial_board = external global [421 x i8]
@board_ko_pos = external global i32
@white_captured = external global i32
@black_captured = external global i32
@initial_board_ko_pos = external global i32
@initial_white_captured = external global i32
@initial_black_captured = external global i32
@move_history_pointer = external global i32
@move_history_color = external global [500 x i32]
@move_history_pos = external global [500 x i32]
@komi = external global float
@movenum = external global i32
@hashdata = external global %struct.Hash_data
@.str2 = private unnamed_addr constant [35 x i8] c"board_size > 0 && board_size <= 19\00", align 1
@sgf_dumptree = external global %struct.SGFTree_t*
@.str3 = private unnamed_addr constant [8 x i8] c"UNKNOWN\00", align 1
@.str4 = private unnamed_addr constant [44 x i8] c"%s (variation %d, hash %lx, komaster %s:%s)\00", align 1
@count_variations = external global i32
@.str5 = private unnamed_addr constant [28 x i8] c"%s (variation %d, hash %lx)\00", align 1
@.str6 = private unnamed_addr constant [50 x i8] c"%s at %s (variation %d, hash %lx, komaster %s:%s)\00", align 1
@.str7 = private unnamed_addr constant [34 x i8] c"%s at %s (variation %d, hash %lx)\00", align 1
@stats = external global %struct.stats_data
@.str8 = private unnamed_addr constant [55 x i8] c"%s in semeai %s-%s (variation %d, value %d, owl_phase)\00", align 1
@.str9 = private unnamed_addr constant [46 x i8] c"tryko: %s (variation %d, %lx, komaster %s:%s)\00", align 1
@.str10 = private unnamed_addr constant [30 x i8] c"tryko: %s (variation %d, %lx)\00", align 1
@.str11 = private unnamed_addr constant [19 x i8] c"tenuki (ko threat)\00", align 1
@.str12 = private unnamed_addr constant [27 x i8] c"tenuki (answers ko threat)\00", align 1
@hashdata_stack = internal global [361 x %struct.Hash_data] zeroinitializer, align 16
@.str13 = private unnamed_addr constant [21 x i8] c"(next variation: %d)\00", align 1
@.str14 = private unnamed_addr constant [10 x i8] c"%o%s:%1m \00", align 1
@move_color = internal global [361 x i32] zeroinitializer, align 16
@.str15 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str16 = private unnamed_addr constant [2 x i8] c"W\00", align 1
@stack = internal global [361 x i32] zeroinitializer, align 16
@.str17 = private unnamed_addr constant [18 x i8] c"%o (variation %d)\00", align 1
@.str18 = private unnamed_addr constant [4 x i8] c"%o\0A\00", align 1
@stdout = external global %struct._IO_FILE*
@stderr = external global %struct._IO_FILE*
@.str19 = private unnamed_addr constant [15 x i8] c"ON_BOARD1(pos)\00", align 1
@.str20 = private unnamed_addr constant [20 x i8] c"board[pos] == EMPTY\00", align 1
@.str21 = private unnamed_addr constant [21 x i8] c"IS_STONE(board[pos])\00", align 1
@.str22 = private unnamed_addr constant [33 x i8] c"color == WHITE || color == BLACK\00", align 1
@.str23 = private unnamed_addr constant [35 x i8] c"pos == PASS_MOVE || ON_BOARD1(pos)\00", align 1
@.str24 = private unnamed_addr constant [40 x i8] c"pos == PASS_MOVE || board[pos] == EMPTY\00", align 1
@.str25 = private unnamed_addr constant [62 x i8] c"gnugo: Truncating search. This is beyond my reading ability!\0A\00", align 1
@allow_suicide = external global i32
@string_number = internal global [400 x i32] zeroinitializer, align 16
@string = internal global [240 x %struct.string_data] zeroinitializer, align 16
@.str26 = private unnamed_addr constant [21 x i8] c"IS_STONE(board[str])\00", align 1
@.str27 = private unnamed_addr constant [13 x i8] c"libs != NULL\00", align 1
@liberty_mark = internal global i32 0, align 4
@ml = internal global [400 x i32] zeroinitializer, align 16
@next_stone = internal global [400 x i32] zeroinitializer, align 16
@.str28 = private unnamed_addr constant [16 x i8] c"IS_STONE(color)\00", align 1
@string_mark = internal global i32 0, align 4
@.str29 = private unnamed_addr constant [16 x i8] c"ON_BOARD1(str1)\00", align 1
@.str30 = private unnamed_addr constant [16 x i8] c"ON_BOARD1(str2)\00", align 1
@.str31 = private unnamed_addr constant [22 x i8] c"IS_STONE(board[str1])\00", align 1
@.str32 = private unnamed_addr constant [22 x i8] c"IS_STONE(board[str2])\00", align 1
@.str33 = private unnamed_addr constant [15 x i8] c"ON_BOARD1(str)\00", align 1
@.str34 = private unnamed_addr constant [11 x i8] c"k < stackp\00", align 1
@stones_on_board.stone_count_for_position = internal global i32 -1, align 4
@stones_on_board.white_stones = internal global i32 0, align 4
@stones_on_board.black_stones = internal global i32 0, align 4
@position_number = external global i32
@trymove_counter = internal global i32 0, align 4
@next_string = internal global i32 0, align 4
@change_stack = internal global [28880 x %struct.change_stack_entry] zeroinitializer, align 16
@change_stack_pointer = internal global %struct.change_stack_entry* null, align 8
@vertex_stack = internal global [28880 x %struct.vertex_stack_entry] zeroinitializer, align 16
@vertex_stack_pointer = internal global %struct.vertex_stack_entry* null, align 8
@.str35 = private unnamed_addr constant [7 x i8] c"s >= 0\00", align 1
@.str36 = private unnamed_addr constant [22 x i8] c"s < (2 * 19 * 19 / 3)\00", align 1
@.str37 = private unnamed_addr constant [5 x i8] c"done\00", align 1
@.str38 = private unnamed_addr constant [52 x i8] c"change_stack_pointer - change_stack <= 80 * 19 * 19\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"color == 2 || color == 1\00", align 1
@shadow = external global [400 x i8]
@verbose = external global i32
@.str40 = private unnamed_addr constant [6 x i8] c"empty\00", align 1
@.str41 = private unnamed_addr constant [6 x i8] c"white\00", align 1
@.str42 = private unnamed_addr constant [6 x i8] c"black\00", align 1
@.str43 = private unnamed_addr constant [5 x i8] c"gray\00", align 1
@.str44 = private unnamed_addr constant [11 x i8] c"gray_white\00", align 1
@.str45 = private unnamed_addr constant [11 x i8] c"gray_black\00", align 1
@.str46 = private unnamed_addr constant [8 x i8] c"weak_ko\00", align 1
@komaster_to_string.b = private unnamed_addr constant [7 x i8*] [i8* getelementptr inbounds ([6 x i8]* @.str40, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str41, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str42, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str43, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str44, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str45, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str46, i32 0, i32 0)], align 16
@.str47 = private unnamed_addr constant [31 x i8] c"komaster >= 0 && komaster <= 6\00", align 1

; Function Attrs: nounwind uwtable
define void @store_board(%struct.board_state* %state) #0 {
  %1 = load i32* @stackp, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %5

; <label>:4                                       ; preds = %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 327, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 -1, i32 -1)
  br label %5

; <label>:5                                       ; preds = %4, %3
  %6 = load i32* @board_size, align 4
  %7 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 0
  store i32 %6, i32* %7, align 4
  %8 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 1
  %9 = bitcast [421 x i8]* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i64 421, i32 4, i1 false)
  %10 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 5
  %11 = bitcast [421 x i8]* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* getelementptr inbounds ([421 x i8]* @initial_board, i32 0, i32 0), i64 421, i32 4, i1 false)
  %12 = load i32* @board_ko_pos, align 4
  %13 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 2
  store i32 %12, i32* %13, align 4
  %14 = load i32* @white_captured, align 4
  %15 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 4
  store i32 %14, i32* %15, align 4
  %16 = load i32* @black_captured, align 4
  %17 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 3
  store i32 %16, i32* %17, align 4
  %18 = load i32* @initial_board_ko_pos, align 4
  %19 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 6
  store i32 %18, i32* %19, align 4
  %20 = load i32* @initial_white_captured, align 4
  %21 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 7
  store i32 %20, i32* %21, align 4
  %22 = load i32* @initial_black_captured, align 4
  %23 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 8
  store i32 %22, i32* %23, align 4
  %24 = load i32* @move_history_pointer, align 4
  %25 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 11
  store i32 %24, i32* %25, align 4
  br label %26

; <label>:26                                      ; preds = %42, %5
  %k.0 = phi i32 [ 0, %5 ], [ %43, %42 ]
  %27 = load i32* @move_history_pointer, align 4
  %28 = icmp slt i32 %k.0, %27
  br i1 %28, label %29, label %44

; <label>:29                                      ; preds = %26
  %30 = sext i32 %k.0 to i64
  %31 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %30
  %32 = load i32* %31, align 4
  %33 = sext i32 %k.0 to i64
  %34 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 9
  %35 = getelementptr inbounds [500 x i32]* %34, i32 0, i64 %33
  store i32 %32, i32* %35, align 4
  %36 = sext i32 %k.0 to i64
  %37 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %36
  %38 = load i32* %37, align 4
  %39 = sext i32 %k.0 to i64
  %40 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 10
  %41 = getelementptr inbounds [500 x i32]* %40, i32 0, i64 %39
  store i32 %38, i32* %41, align 4
  br label %42

; <label>:42                                      ; preds = %29
  %43 = add nsw i32 %k.0, 1
  br label %26

; <label>:44                                      ; preds = %26
  %45 = load float* @komi, align 4
  %46 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 12
  store float %45, float* %46, align 4
  %47 = load i32* @movenum, align 4
  %48 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 13
  store i32 %47, i32* %48, align 4
  ret void
}

declare void @abortgo(i8*, i32, i8*, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define void @restore_board(%struct.board_state* %state) #0 {
  %1 = load i32* @stackp, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %5

; <label>:4                                       ; preds = %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 362, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 -1, i32 -1)
  br label %5

; <label>:5                                       ; preds = %4, %3
  %6 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 0
  %7 = load i32* %6, align 4
  store i32 %7, i32* @board_size, align 4
  %8 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 1
  %9 = bitcast [421 x i8]* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i8* %9, i64 421, i32 4, i1 false)
  %10 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 5
  %11 = bitcast [421 x i8]* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @initial_board, i32 0, i32 0), i8* %11, i64 421, i32 4, i1 false)
  %12 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 2
  %13 = load i32* %12, align 4
  store i32 %13, i32* @board_ko_pos, align 4
  %14 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 4
  %15 = load i32* %14, align 4
  store i32 %15, i32* @white_captured, align 4
  %16 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 3
  %17 = load i32* %16, align 4
  store i32 %17, i32* @black_captured, align 4
  %18 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 6
  %19 = load i32* %18, align 4
  store i32 %19, i32* @initial_board_ko_pos, align 4
  %20 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 7
  %21 = load i32* %20, align 4
  store i32 %21, i32* @initial_white_captured, align 4
  %22 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 8
  %23 = load i32* %22, align 4
  store i32 %23, i32* @initial_black_captured, align 4
  %24 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 11
  %25 = load i32* %24, align 4
  store i32 %25, i32* @move_history_pointer, align 4
  br label %26

; <label>:26                                      ; preds = %42, %5
  %k.0 = phi i32 [ 0, %5 ], [ %43, %42 ]
  %27 = load i32* @move_history_pointer, align 4
  %28 = icmp slt i32 %k.0, %27
  br i1 %28, label %29, label %44

; <label>:29                                      ; preds = %26
  %30 = sext i32 %k.0 to i64
  %31 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 9
  %32 = getelementptr inbounds [500 x i32]* %31, i32 0, i64 %30
  %33 = load i32* %32, align 4
  %34 = sext i32 %k.0 to i64
  %35 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %34
  store i32 %33, i32* %35, align 4
  %36 = sext i32 %k.0 to i64
  %37 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 10
  %38 = getelementptr inbounds [500 x i32]* %37, i32 0, i64 %36
  %39 = load i32* %38, align 4
  %40 = sext i32 %k.0 to i64
  %41 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %40
  store i32 %39, i32* %41, align 4
  br label %42

; <label>:42                                      ; preds = %29
  %43 = add nsw i32 %k.0, 1
  br label %26

; <label>:44                                      ; preds = %26
  %45 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 12
  %46 = load float* %45, align 4
  store float %46, float* @komi, align 4
  %47 = getelementptr inbounds %struct.board_state* %state, i32 0, i32 13
  %48 = load i32* %47, align 4
  store i32 %48, i32* @movenum, align 4
  %49 = load i32* @board_ko_pos, align 4
  call void @hashdata_recalc(%struct.Hash_data* @hashdata, i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i32 %49)
  call void @new_position()
  ret void
}

declare void @hashdata_recalc(%struct.Hash_data*, i8*, i32) #1

; Function Attrs: nounwind uwtable
define internal void @new_position() #0 {
  %1 = load i32* @position_number, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, i32* @position_number, align 4
  store i32 0, i32* @next_string, align 4
  store i32 0, i32* @liberty_mark, align 4
  store i32 0, i32* @string_mark, align 4
  store %struct.change_stack_entry* getelementptr inbounds ([28880 x %struct.change_stack_entry]* @change_stack, i32 0, i32 0), %struct.change_stack_entry** @change_stack_pointer, align 8
  store %struct.vertex_stack_entry* getelementptr inbounds ([28880 x %struct.vertex_stack_entry]* @vertex_stack, i32 0, i32 0), %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  call void @llvm.memset.p0i8.i64(i8* bitcast ([240 x %struct.string_data]* @string to i8*), i8 0, i64 178560, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([400 x i32]* @ml to i8*), i8 0, i64 1600, i32 16, i1 false)
  br label %3

; <label>:3                                       ; preds = %15, %0
  %pos.0 = phi i32 [ 21, %0 ], [ %16, %15 ]
  %4 = icmp slt i32 %pos.0, 400
  br i1 %4, label %5, label %17

; <label>:5                                       ; preds = %3
  %6 = sext i32 %pos.0 to i64
  %7 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %6
  %8 = load i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = icmp ne i32 %9, 3
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %5
  %12 = sext i32 %pos.0 to i64
  %13 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %12
  store i32 -1, i32* %13, align 4
  br label %14

; <label>:14                                      ; preds = %11, %5
  br label %15

; <label>:15                                      ; preds = %14
  %16 = add nsw i32 %pos.0, 1
  br label %3

; <label>:17                                      ; preds = %3
  br label %18

; <label>:18                                      ; preds = %72, %17
  %pos.1 = phi i32 [ 21, %17 ], [ %73, %72 ]
  %19 = icmp slt i32 %pos.1, 400
  br i1 %19, label %20, label %74

; <label>:20                                      ; preds = %18
  %21 = sext i32 %pos.1 to i64
  %22 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %21
  %23 = load i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp ne i32 %24, 3
  br i1 %25, label %27, label %26

; <label>:26                                      ; preds = %20
  br label %72

; <label>:27                                      ; preds = %20
  %28 = sext i32 %pos.1 to i64
  %29 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %28
  %30 = load i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = icmp eq i32 %31, 1
  br i1 %32, label %39, label %33

; <label>:33                                      ; preds = %27
  %34 = sext i32 %pos.1 to i64
  %35 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %34
  %36 = load i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = icmp eq i32 %37, 2
  br i1 %38, label %39, label %71

; <label>:39                                      ; preds = %33, %27
  %40 = sext i32 %pos.1 to i64
  %41 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %40
  %42 = load i32* %41, align 4
  %43 = icmp eq i32 %42, -1
  br i1 %43, label %44, label %71

; <label>:44                                      ; preds = %39
  %45 = load i32* @next_string, align 4
  %46 = sext i32 %pos.1 to i64
  %47 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %46
  store i32 %45, i32* %47, align 4
  %48 = call i32 @propagate_string(i32 %pos.1, i32 %pos.1)
  %49 = load i32* @next_string, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %50
  %52 = getelementptr inbounds %struct.string_data* %51, i32 0, i32 1
  store i32 %48, i32* %52, align 4
  %53 = sext i32 %pos.1 to i64
  %54 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %53
  %55 = load i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = load i32* @next_string, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %58
  %60 = getelementptr inbounds %struct.string_data* %59, i32 0, i32 0
  store i32 %56, i32* %60, align 4
  %61 = load i32* @next_string, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %62
  %64 = getelementptr inbounds %struct.string_data* %63, i32 0, i32 2
  store i32 %pos.1, i32* %64, align 4
  %65 = load i32* @next_string, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %66
  %68 = getelementptr inbounds %struct.string_data* %67, i32 0, i32 7
  store i32 0, i32* %68, align 4
  %69 = load i32* @next_string, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* @next_string, align 4
  br label %71

; <label>:71                                      ; preds = %44, %39, %33
  br label %72

; <label>:72                                      ; preds = %71, %26
  %73 = add nsw i32 %pos.1, 1
  br label %18

; <label>:74                                      ; preds = %18
  br label %75

; <label>:75                                      ; preds = %79, %74
  %s.0 = phi i32 [ 0, %74 ], [ %80, %79 ]
  %76 = load i32* @next_string, align 4
  %77 = icmp slt i32 %s.0, %76
  br i1 %77, label %78, label %81

; <label>:78                                      ; preds = %75
  call void @find_liberties_and_neighbors(i32 %s.0)
  br label %79

; <label>:79                                      ; preds = %78
  %80 = add nsw i32 %s.0, 1
  br label %75

; <label>:81                                      ; preds = %75
  ret void
}

; Function Attrs: nounwind uwtable
define void @clear_board() #0 {
  %1 = load i32* @board_size, align 4
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %7

; <label>:3                                       ; preds = %0
  %4 = load i32* @board_size, align 4
  %5 = icmp sle i32 %4, 19
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %3
  br label %8

; <label>:7                                       ; preds = %3, %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 400, i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0), i32 -1, i32 -1)
  br label %8

; <label>:8                                       ; preds = %7, %6
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i8 0, i64 421, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @initial_board, i32 0, i32 0), i8 0, i64 421, i32 16, i1 false)
  br label %9

; <label>:9                                       ; preds = %27, %8
  %k.0 = phi i32 [ 0, %8 ], [ %28, %27 ]
  %10 = icmp slt i32 %k.0, 421
  br i1 %10, label %11, label %29

; <label>:11                                      ; preds = %9
  %12 = sdiv i32 %k.0, 20
  %13 = sub nsw i32 %12, 1
  %14 = load i32* @board_size, align 4
  %15 = icmp ult i32 %13, %14
  br i1 %15, label %16, label %21

; <label>:16                                      ; preds = %11
  %17 = srem i32 %k.0, 20
  %18 = sub nsw i32 %17, 1
  %19 = load i32* @board_size, align 4
  %20 = icmp ult i32 %18, %19
  br i1 %20, label %26, label %21

; <label>:21                                      ; preds = %16, %11
  %22 = sext i32 %k.0 to i64
  %23 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %22
  store i8 3, i8* %23, align 1
  %24 = sext i32 %k.0 to i64
  %25 = getelementptr inbounds [421 x i8]* @initial_board, i32 0, i64 %24
  store i8 3, i8* %25, align 1
  br label %26

; <label>:26                                      ; preds = %21, %16
  br label %27

; <label>:27                                      ; preds = %26
  %28 = add nsw i32 %k.0, 1
  br label %9

; <label>:29                                      ; preds = %9
  store i32 0, i32* @board_ko_pos, align 4
  store i32 0, i32* @white_captured, align 4
  store i32 0, i32* @black_captured, align 4
  store i32 0, i32* @initial_board_ko_pos, align 4
  store i32 0, i32* @initial_white_captured, align 4
  store i32 0, i32* @initial_black_captured, align 4
  store i32 0, i32* @move_history_pointer, align 4
  store i32 0, i32* @movenum, align 4
  %30 = load i32* @board_ko_pos, align 4
  call void @hashdata_recalc(%struct.Hash_data* @hashdata, i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i32 %30)
  call void @new_position()
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @test_gray_border() #0 {
  %1 = load i32* @board_size, align 4
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %7

; <label>:3                                       ; preds = %0
  %4 = load i32* @board_size, align 4
  %5 = icmp sle i32 %4, 19
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %3
  br label %8

; <label>:7                                       ; preds = %3, %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 432, i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0), i32 -1, i32 -1)
  br label %8

; <label>:8                                       ; preds = %7, %6
  br label %9

; <label>:9                                       ; preds = %30, %8
  %k.0 = phi i32 [ 0, %8 ], [ %31, %30 ]
  %10 = icmp slt i32 %k.0, 421
  br i1 %10, label %11, label %32

; <label>:11                                      ; preds = %9
  %12 = sdiv i32 %k.0, 20
  %13 = sub nsw i32 %12, 1
  %14 = load i32* @board_size, align 4
  %15 = icmp ult i32 %13, %14
  br i1 %15, label %16, label %21

; <label>:16                                      ; preds = %11
  %17 = srem i32 %k.0, 20
  %18 = sub nsw i32 %17, 1
  %19 = load i32* @board_size, align 4
  %20 = icmp ult i32 %18, %19
  br i1 %20, label %29, label %21

; <label>:21                                      ; preds = %16, %11
  %22 = sext i32 %k.0 to i64
  %23 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %22
  %24 = load i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = icmp ne i32 %25, 3
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %21
  br label %33

; <label>:28                                      ; preds = %21
  br label %29

; <label>:29                                      ; preds = %28, %16
  br label %30

; <label>:30                                      ; preds = %29
  %31 = add nsw i32 %k.0, 1
  br label %9

; <label>:32                                      ; preds = %9
  br label %33

; <label>:33                                      ; preds = %32, %27
  %.0 = phi i32 [ %k.0, %27 ], [ -1, %32 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @trymove(i32 %pos, i32 %color, i8* %message, i32 %str, i32 %komaster, i32 %kom_pos) #0 {
  %buf = alloca [100 x i8], align 16
  %1 = call i32 @do_trymove(i32 %pos, i32 %color, i32 0)
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %4, label %3

; <label>:3                                       ; preds = %0
  br label %57

; <label>:4                                       ; preds = %0
  %5 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %6 = icmp ne %struct.SGFTree_t* %5, null
  br i1 %6, label %7, label %48

; <label>:7                                       ; preds = %4
  %8 = icmp eq i8* %message, null
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %7
  br label %10

; <label>:10                                      ; preds = %9, %7
  %.01 = phi i8* [ getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), %9 ], [ %message, %7 ]
  %11 = icmp eq i32 %str, 0
  br i1 %11, label %12, label %25

; <label>:12                                      ; preds = %10
  %13 = icmp ne i32 %komaster, 0
  br i1 %13, label %14, label %20

; <label>:14                                      ; preds = %12
  %15 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %16 = load i32* @count_variations, align 4
  %17 = load i64* getelementptr inbounds (%struct.Hash_data* @hashdata, i32 0, i32 0, i64 0), align 8
  %18 = call i8* @komaster_to_string(i32 %komaster)
  %19 = call i8* @location_to_string(i32 %kom_pos)
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %15, i64 100, i8* getelementptr inbounds ([44 x i8]* @.str4, i32 0, i32 0), i8* %.01, i32 %16, i64 %17, i8* %18, i8* %19)
  br label %24

; <label>:20                                      ; preds = %12
  %21 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %22 = load i32* @count_variations, align 4
  %23 = load i64* getelementptr inbounds (%struct.Hash_data* @hashdata, i32 0, i32 0, i64 0), align 8
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %21, i64 100, i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i8* %.01, i32 %22, i64 %23)
  br label %24

; <label>:24                                      ; preds = %20, %14
  br label %40

; <label>:25                                      ; preds = %10
  %26 = icmp ne i32 %komaster, 0
  br i1 %26, label %27, label %34

; <label>:27                                      ; preds = %25
  %28 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %29 = call i8* @location_to_string(i32 %str)
  %30 = load i32* @count_variations, align 4
  %31 = load i64* getelementptr inbounds (%struct.Hash_data* @hashdata, i32 0, i32 0, i64 0), align 8
  %32 = call i8* @komaster_to_string(i32 %komaster)
  %33 = call i8* @location_to_string(i32 %kom_pos)
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %28, i64 100, i8* getelementptr inbounds ([50 x i8]* @.str6, i32 0, i32 0), i8* %.01, i8* %29, i32 %30, i64 %31, i8* %32, i8* %33)
  br label %39

; <label>:34                                      ; preds = %25
  %35 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %36 = call i8* @location_to_string(i32 %str)
  %37 = load i32* @count_variations, align 4
  %38 = load i64* getelementptr inbounds (%struct.Hash_data* @hashdata, i32 0, i32 0, i64 0), align 8
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %35, i64 100, i8* getelementptr inbounds ([34 x i8]* @.str7, i32 0, i32 0), i8* %.01, i8* %36, i32 %37, i64 %38)
  br label %39

; <label>:39                                      ; preds = %34, %27
  br label %40

; <label>:40                                      ; preds = %39, %24
  %41 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %42 = sdiv i32 %pos, 20
  %43 = sub nsw i32 %42, 1
  %44 = srem i32 %pos, 20
  %45 = sub nsw i32 %44, 1
  call void @sgftreeAddPlayLast(%struct.SGFTree_t* %41, i32 %color, i32 %43, i32 %45)
  %46 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %47 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  call void @sgftreeAddComment(%struct.SGFTree_t* %46, i8* %47)
  br label %48

; <label>:48                                      ; preds = %40, %4
  %49 = load i32* @count_variations, align 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %54

; <label>:51                                      ; preds = %48
  %52 = load i32* @count_variations, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* @count_variations, align 4
  br label %54

; <label>:54                                      ; preds = %51, %48
  %55 = load i32* getelementptr inbounds (%struct.stats_data* @stats, i32 0, i32 0), align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* getelementptr inbounds (%struct.stats_data* @stats, i32 0, i32 0), align 4
  br label %57

; <label>:57                                      ; preds = %54, %3
  %.0 = phi i32 [ 1, %54 ], [ 0, %3 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define internal i32 @do_trymove(i32 %pos, i32 %color, i32 %ignore_ko) #0 {
  %1 = icmp ult i32 %pos, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %pos to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %pos, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %pos, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 646, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = icmp eq i32 %color, 2
  br i1 %15, label %18, label %16

; <label>:16                                      ; preds = %14
  %17 = icmp eq i32 %color, 1
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %16, %14
  br label %20

; <label>:19                                      ; preds = %16
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 647, i8* getelementptr inbounds ([25 x i8]* @.str39, i32 0, i32 0), i32 -1, i32 -1)
  br label %20

; <label>:20                                      ; preds = %19, %18
  %21 = sext i32 %pos to i64
  %22 = getelementptr inbounds [400 x i8]* @shadow, i32 0, i64 %21
  store i8 1, i8* %22, align 1
  %23 = sext i32 %pos to i64
  %24 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %23
  %25 = load i8* %24, align 1
  %26 = zext i8 %25 to i32
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %20
  br label %118

; <label>:29                                      ; preds = %20
  %30 = icmp ne i32 %ignore_ko, 0
  br i1 %30, label %52, label %31

; <label>:31                                      ; preds = %29
  %32 = load i32* @board_ko_pos, align 4
  %33 = icmp eq i32 %pos, %32
  br i1 %33, label %34, label %52

; <label>:34                                      ; preds = %31
  %35 = sub nsw i32 %pos, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %36
  %38 = load i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = sub nsw i32 3, %color
  %41 = icmp eq i32 %39, %40
  br i1 %41, label %50, label %42

; <label>:42                                      ; preds = %34
  %43 = add nsw i32 %pos, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %44
  %46 = load i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = sub nsw i32 3, %color
  %49 = icmp eq i32 %47, %48
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %42, %34
  br label %118

; <label>:51                                      ; preds = %42
  br label %52

; <label>:52                                      ; preds = %51, %31, %29
  %53 = call i32 @is_suicide(i32 %pos, i32 %color)
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %52
  br label %118

; <label>:56                                      ; preds = %52
  %57 = load i32* @stackp, align 4
  %58 = icmp sge i32 %57, 359
  br i1 %58, label %59, label %70

; <label>:59                                      ; preds = %56
  %60 = load %struct._IO_FILE** @stderr, align 8
  %61 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([62 x i8]* @.str25, i32 0, i32 0))
  %62 = load i32* @verbose, align 4
  %63 = icmp sgt i32 %62, 0
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %59
  call void @showboard(i32 0)
  call void @dump_stack()
  br label %65

; <label>:65                                      ; preds = %64, %59
  %66 = load %struct._IO_FILE** @stdout, align 8
  %67 = call i32 @fflush(%struct._IO_FILE* %66)
  %68 = load %struct._IO_FILE** @stderr, align 8
  %69 = call i32 @fflush(%struct._IO_FILE* %68)
  br label %118

; <label>:70                                      ; preds = %56
  %71 = load i32* @trymove_counter, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* @trymove_counter, align 4
  %73 = load i32* @stackp, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [361 x i32]* @stack, i32 0, i64 %74
  store i32 %pos, i32* %75, align 4
  %76 = load i32* @stackp, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [361 x i32]* @move_color, i32 0, i64 %77
  store i32 %color, i32* %78, align 4
  %79 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %80 = getelementptr inbounds %struct.change_stack_entry* %79, i32 1
  store %struct.change_stack_entry* %80, %struct.change_stack_entry** @change_stack_pointer, align 8
  %81 = getelementptr inbounds %struct.change_stack_entry* %79, i32 0, i32 0
  store i32* null, i32** %81, align 8
  %82 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %83 = getelementptr inbounds %struct.vertex_stack_entry* %82, i32 1
  store %struct.vertex_stack_entry* %83, %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %84 = getelementptr inbounds %struct.vertex_stack_entry* %82, i32 0, i32 0
  store i8* null, i8** %84, align 8
  %85 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %86 = getelementptr inbounds %struct.change_stack_entry* %85, i32 0, i32 0
  store i32* @board_ko_pos, i32** %86, align 8
  %87 = load i32* @board_ko_pos, align 4
  %88 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %89 = getelementptr inbounds %struct.change_stack_entry* %88, i32 1
  store %struct.change_stack_entry* %89, %struct.change_stack_entry** @change_stack_pointer, align 8
  %90 = getelementptr inbounds %struct.change_stack_entry* %88, i32 0, i32 1
  store i32 %87, i32* %90, align 4
  %91 = load i32* @stackp, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [361 x %struct.Hash_data]* @hashdata_stack, i32 0, i64 %92
  %94 = bitcast %struct.Hash_data* %93 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %94, i8* bitcast (%struct.Hash_data* @hashdata to i8*), i64 8, i32 8, i1 false)
  %95 = load i32* @board_ko_pos, align 4
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %99

; <label>:97                                      ; preds = %70
  %98 = load i32* @board_ko_pos, align 4
  call void @hashdata_invert_ko(%struct.Hash_data* @hashdata, i32 %98)
  br label %99

; <label>:99                                      ; preds = %97, %70
  store i32 0, i32* @board_ko_pos, align 4
  %100 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %101 = getelementptr inbounds %struct.change_stack_entry* %100, i32 0, i32 0
  store i32* @black_captured, i32** %101, align 8
  %102 = load i32* @black_captured, align 4
  %103 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %104 = getelementptr inbounds %struct.change_stack_entry* %103, i32 1
  store %struct.change_stack_entry* %104, %struct.change_stack_entry** @change_stack_pointer, align 8
  %105 = getelementptr inbounds %struct.change_stack_entry* %103, i32 0, i32 1
  store i32 %102, i32* %105, align 4
  %106 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %107 = getelementptr inbounds %struct.change_stack_entry* %106, i32 0, i32 0
  store i32* @white_captured, i32** %107, align 8
  %108 = load i32* @white_captured, align 4
  %109 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %110 = getelementptr inbounds %struct.change_stack_entry* %109, i32 1
  store %struct.change_stack_entry* %110, %struct.change_stack_entry** @change_stack_pointer, align 8
  %111 = getelementptr inbounds %struct.change_stack_entry* %109, i32 0, i32 1
  store i32 %108, i32* %111, align 4
  %112 = load i32* @stackp, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* @stackp, align 4
  %114 = load i32* @verbose, align 4
  %115 = icmp eq i32 %114, 4
  br i1 %115, label %116, label %117

; <label>:116                                     ; preds = %99
  call void @dump_stack()
  br label %117

; <label>:117                                     ; preds = %116, %99
  call void @do_play_move(i32 %pos, i32 %color)
  br label %118

; <label>:118                                     ; preds = %117, %65, %55, %50, %28
  %.0 = phi i32 [ 0, %28 ], [ 0, %55 ], [ 0, %65 ], [ 1, %117 ], [ 0, %50 ]
  ret i32 %.0
}

declare void @gg_snprintf(i8*, i64, i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal i8* @komaster_to_string(i32 %komaster) #0 {
  %b = alloca [7 x i8*], align 16
  %1 = bitcast [7 x i8*]* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([7 x i8*]* @komaster_to_string.b to i8*), i64 56, i32 16, i1 false)
  %2 = icmp sge i32 %komaster, 0
  br i1 %2, label %3, label %6

; <label>:3                                       ; preds = %0
  %4 = icmp sle i32 %komaster, 6
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %3
  br label %7

; <label>:6                                       ; preds = %3, %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 462, i8* getelementptr inbounds ([31 x i8]* @.str47, i32 0, i32 0), i32 -1, i32 -1)
  br label %7

; <label>:7                                       ; preds = %6, %5
  %8 = sext i32 %komaster to i64
  %9 = getelementptr inbounds [7 x i8*]* %b, i32 0, i64 %8
  %10 = load i8** %9, align 8
  ret i8* %10
}

declare i8* @location_to_string(i32) #1

declare void @sgftreeAddPlayLast(%struct.SGFTree_t*, i32, i32, i32) #1

declare void @sgftreeAddComment(%struct.SGFTree_t*, i8*) #1

; Function Attrs: nounwind uwtable
define i32 @semeai_trymove(i32 %pos, i32 %color, i8* %message, i32 %str1, i32 %str2, i32 %owl_phase, i32 %value) #0 {
  %buf = alloca [100 x i8], align 16
  %sbuf1 = alloca [5 x i8], align 1
  %sbuf2 = alloca [5 x i8], align 1
  %1 = call i32 @do_trymove(i32 %pos, i32 %color, i32 0)
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %4, label %3

; <label>:3                                       ; preds = %0
  br label %41

; <label>:4                                       ; preds = %0
  %5 = icmp eq i8* %message, null
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %4
  br label %7

; <label>:7                                       ; preds = %6, %4
  %.01 = phi i8* [ getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), %6 ], [ %message, %4 ]
  %8 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %9 = icmp ne %struct.SGFTree_t* %8, null
  br i1 %9, label %10, label %32

; <label>:10                                      ; preds = %7
  %11 = getelementptr inbounds [5 x i8]* %sbuf1, i32 0, i32 0
  call void @location_to_buffer(i32 %str1, i8* %11)
  %12 = getelementptr inbounds [5 x i8]* %sbuf2, i32 0, i32 0
  call void @location_to_buffer(i32 %str2, i8* %12)
  %13 = icmp ne i32 %owl_phase, 0
  br i1 %13, label %14, label %19

; <label>:14                                      ; preds = %10
  %15 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %16 = getelementptr inbounds [5 x i8]* %sbuf1, i32 0, i32 0
  %17 = getelementptr inbounds [5 x i8]* %sbuf2, i32 0, i32 0
  %18 = load i32* @count_variations, align 4
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %15, i64 100, i8* getelementptr inbounds ([55 x i8]* @.str8, i32 0, i32 0), i8* %.01, i8* %16, i8* %17, i32 %18, i32 %value)
  br label %24

; <label>:19                                      ; preds = %10
  %20 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %21 = getelementptr inbounds [5 x i8]* %sbuf1, i32 0, i32 0
  %22 = getelementptr inbounds [5 x i8]* %sbuf2, i32 0, i32 0
  %23 = load i32* @count_variations, align 4
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %20, i64 100, i8* %.01, i8* %21, i8* %22, i32 %23, i32 %value)
  br label %24

; <label>:24                                      ; preds = %19, %14
  %25 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %26 = sdiv i32 %pos, 20
  %27 = sub nsw i32 %26, 1
  %28 = srem i32 %pos, 20
  %29 = sub nsw i32 %28, 1
  call void @sgftreeAddPlayLast(%struct.SGFTree_t* %25, i32 %color, i32 %27, i32 %29)
  %30 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %31 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  call void @sgftreeAddComment(%struct.SGFTree_t* %30, i8* %31)
  br label %32

; <label>:32                                      ; preds = %24, %7
  %33 = load i32* @count_variations, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %38

; <label>:35                                      ; preds = %32
  %36 = load i32* @count_variations, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* @count_variations, align 4
  br label %38

; <label>:38                                      ; preds = %35, %32
  %39 = load i32* getelementptr inbounds (%struct.stats_data* @stats, i32 0, i32 0), align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* getelementptr inbounds (%struct.stats_data* @stats, i32 0, i32 0), align 4
  br label %41

; <label>:41                                      ; preds = %38, %3
  %.0 = phi i32 [ 1, %38 ], [ 0, %3 ]
  ret i32 %.0
}

declare void @location_to_buffer(i32, i8*) #1

; Function Attrs: nounwind uwtable
define i32 @tryko(i32 %pos, i32 %color, i8* %message, i32 %komaster, i32 %kom_pos) #0 {
  %buf = alloca [100 x i8], align 16
  %1 = call i32 @do_trymove(i32 %pos, i32 %color, i32 1)
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %4, label %3

; <label>:3                                       ; preds = %0
  br label %44

; <label>:4                                       ; preds = %0
  %5 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %6 = icmp ne %struct.SGFTree_t* %5, null
  br i1 %6, label %7, label %35

; <label>:7                                       ; preds = %4
  %8 = icmp eq i8* %message, null
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %7
  br label %10

; <label>:10                                      ; preds = %9, %7
  %.01 = phi i8* [ getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), %9 ], [ %message, %7 ]
  %11 = icmp ne i32 %komaster, 0
  br i1 %11, label %12, label %18

; <label>:12                                      ; preds = %10
  %13 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %14 = load i32* @count_variations, align 4
  %15 = load i64* getelementptr inbounds (%struct.Hash_data* @hashdata, i32 0, i32 0, i64 0), align 8
  %16 = call i8* @komaster_to_string(i32 %komaster)
  %17 = call i8* @location_to_string(i32 %kom_pos)
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %13, i64 100, i8* getelementptr inbounds ([46 x i8]* @.str9, i32 0, i32 0), i8* %.01, i32 %14, i64 %15, i8* %16, i8* %17)
  br label %22

; <label>:18                                      ; preds = %10
  %19 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %20 = load i32* @count_variations, align 4
  %21 = load i64* getelementptr inbounds (%struct.Hash_data* @hashdata, i32 0, i32 0, i64 0), align 8
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %19, i64 100, i8* getelementptr inbounds ([30 x i8]* @.str10, i32 0, i32 0), i8* %.01, i32 %20, i64 %21)
  br label %22

; <label>:22                                      ; preds = %18, %12
  %23 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  call void @sgftreeAddPlayLast(%struct.SGFTree_t* %23, i32 %color, i32 -1, i32 -1)
  %24 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  call void @sgftreeAddComment(%struct.SGFTree_t* %24, i8* getelementptr inbounds ([19 x i8]* @.str11, i32 0, i32 0))
  %25 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %26 = sub nsw i32 3, %color
  call void @sgftreeAddPlayLast(%struct.SGFTree_t* %25, i32 %26, i32 -1, i32 -1)
  %27 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  call void @sgftreeAddComment(%struct.SGFTree_t* %27, i8* getelementptr inbounds ([27 x i8]* @.str12, i32 0, i32 0))
  %28 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %29 = sdiv i32 %pos, 20
  %30 = sub nsw i32 %29, 1
  %31 = srem i32 %pos, 20
  %32 = sub nsw i32 %31, 1
  call void @sgftreeAddPlayLast(%struct.SGFTree_t* %28, i32 %color, i32 %30, i32 %32)
  %33 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %34 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  call void @sgftreeAddComment(%struct.SGFTree_t* %33, i8* %34)
  br label %35

; <label>:35                                      ; preds = %22, %4
  %36 = load i32* @count_variations, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %41

; <label>:38                                      ; preds = %35
  %39 = load i32* @count_variations, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* @count_variations, align 4
  br label %41

; <label>:41                                      ; preds = %38, %35
  %42 = load i32* getelementptr inbounds (%struct.stats_data* @stats, i32 0, i32 0), align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* getelementptr inbounds (%struct.stats_data* @stats, i32 0, i32 0), align 4
  br label %44

; <label>:44                                      ; preds = %41, %3
  %.0 = phi i32 [ 1, %41 ], [ 0, %3 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define void @popgo() #0 {
  %buf = alloca [100 x i8], align 16
  %1 = load i32* @stackp, align 4
  %2 = add nsw i32 %1, -1
  store i32 %2, i32* @stackp, align 4
  call void @undo_trymove()
  %3 = load i32* @stackp, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [361 x %struct.Hash_data]* @hashdata_stack, i32 0, i64 %4
  %6 = bitcast %struct.Hash_data* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.Hash_data* @hashdata to i8*), i8* %6, i64 8, i32 8, i1 false)
  %7 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %8 = icmp ne %struct.SGFTree_t* %7, null
  br i1 %8, label %9, label %37

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %11 = load i32* @count_variations, align 4
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %10, i64 100, i8* getelementptr inbounds ([21 x i8]* @.str13, i32 0, i32 0), i32 %11)
  %12 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %13 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  call void @sgftreeAddComment(%struct.SGFTree_t* %12, i8* %13)
  %14 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %15 = getelementptr inbounds %struct.SGFTree_t* %14, i32 0, i32 1
  %16 = load %struct.SGFNode_t** %15, align 8
  %17 = getelementptr inbounds %struct.SGFNode_t* %16, i32 0, i32 1
  %18 = load %struct.SGFNode_t** %17, align 8
  %19 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %20 = getelementptr inbounds %struct.SGFTree_t* %19, i32 0, i32 1
  store %struct.SGFNode_t* %18, %struct.SGFNode_t** %20, align 8
  br label %21

; <label>:21                                      ; preds = %28, %9
  %22 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %23 = getelementptr inbounds %struct.SGFTree_t* %22, i32 0, i32 1
  %24 = load %struct.SGFNode_t** %23, align 8
  %25 = load i32* @board_size, align 4
  %26 = call i32 @is_pass_node(%struct.SGFNode_t* %24, i32 %25)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %36

; <label>:28                                      ; preds = %21
  %29 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %30 = getelementptr inbounds %struct.SGFTree_t* %29, i32 0, i32 1
  %31 = load %struct.SGFNode_t** %30, align 8
  %32 = getelementptr inbounds %struct.SGFNode_t* %31, i32 0, i32 1
  %33 = load %struct.SGFNode_t** %32, align 8
  %34 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %35 = getelementptr inbounds %struct.SGFTree_t* %34, i32 0, i32 1
  store %struct.SGFNode_t* %33, %struct.SGFNode_t** %35, align 8
  br label %21

; <label>:36                                      ; preds = %21
  br label %37

; <label>:37                                      ; preds = %36, %0
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @undo_trymove() #0 {
  %1 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %2 = ptrtoint %struct.change_stack_entry* %1 to i64
  %3 = sub i64 %2, ptrtoint ([28880 x %struct.change_stack_entry]* @change_stack to i64)
  %4 = sdiv exact i64 %3, 16
  %5 = icmp sle i64 %4, 28880
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %8

; <label>:7                                       ; preds = %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 766, i8* getelementptr inbounds ([52 x i8]* @.str38, i32 0, i32 0), i32 -1, i32 -1)
  br label %8

; <label>:8                                       ; preds = %7, %6
  br label %9

; <label>:9                                       ; preds = %15, %8
  %10 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %11 = getelementptr inbounds %struct.change_stack_entry* %10, i32 -1
  store %struct.change_stack_entry* %11, %struct.change_stack_entry** @change_stack_pointer, align 8
  %12 = getelementptr inbounds %struct.change_stack_entry* %11, i32 0, i32 0
  %13 = load i32** %12, align 8
  %14 = icmp ne i32* %13, null
  br i1 %14, label %15, label %22

; <label>:15                                      ; preds = %9
  %16 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %17 = getelementptr inbounds %struct.change_stack_entry* %16, i32 0, i32 1
  %18 = load i32* %17, align 4
  %19 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %20 = getelementptr inbounds %struct.change_stack_entry* %19, i32 0, i32 0
  %21 = load i32** %20, align 8
  store i32 %18, i32* %21, align 4
  br label %9

; <label>:22                                      ; preds = %9
  br label %23

; <label>:23                                      ; preds = %29, %22
  %24 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %25 = getelementptr inbounds %struct.vertex_stack_entry* %24, i32 -1
  store %struct.vertex_stack_entry* %25, %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %26 = getelementptr inbounds %struct.vertex_stack_entry* %25, i32 0, i32 0
  %27 = load i8** %26, align 8
  %28 = icmp ne i8* %27, null
  br i1 %28, label %29, label %37

; <label>:29                                      ; preds = %23
  %30 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %31 = getelementptr inbounds %struct.vertex_stack_entry* %30, i32 0, i32 1
  %32 = load i32* %31, align 4
  %33 = trunc i32 %32 to i8
  %34 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %35 = getelementptr inbounds %struct.vertex_stack_entry* %34, i32 0, i32 0
  %36 = load i8** %35, align 8
  store i8 %33, i8* %36, align 1
  br label %23

; <label>:37                                      ; preds = %23
  ret void
}

declare i32 @is_pass_node(%struct.SGFNode_t*, i32) #1

; Function Attrs: nounwind uwtable
define void @dump_stack() #0 {
  br label %1

; <label>:1                                       ; preds = %14, %0
  %n.0 = phi i32 [ 0, %0 ], [ %15, %14 ]
  %2 = load i32* @stackp, align 4
  %3 = icmp slt i32 %n.0, %2
  br i1 %3, label %4, label %16

; <label>:4                                       ; preds = %1
  %5 = sext i32 %n.0 to i64
  %6 = getelementptr inbounds [361 x i32]* @move_color, i32 0, i64 %5
  %7 = load i32* %6, align 4
  %8 = icmp eq i32 %7, 2
  %9 = select i1 %8, i8* getelementptr inbounds ([2 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str16, i32 0, i32 0)
  %10 = sext i32 %n.0 to i64
  %11 = getelementptr inbounds [361 x i32]* @stack, i32 0, i64 %10
  %12 = load i32* %11, align 4
  %13 = call i32 (i8*, ...)* @gprintf(i8* getelementptr inbounds ([10 x i8]* @.str14, i32 0, i32 0), i8* %9, i32 %12)
  br label %14

; <label>:14                                      ; preds = %4
  %15 = add nsw i32 %n.0, 1
  br label %1

; <label>:16                                      ; preds = %1
  %17 = load i32* @count_variations, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %23

; <label>:19                                      ; preds = %16
  %20 = load i32* @count_variations, align 4
  %21 = sub nsw i32 %20, 1
  %22 = call i32 (i8*, ...)* @gprintf(i8* getelementptr inbounds ([18 x i8]* @.str17, i32 0, i32 0), i32 %21)
  br label %23

; <label>:23                                      ; preds = %19, %16
  %24 = call i32 (i8*, ...)* @gprintf(i8* getelementptr inbounds ([4 x i8]* @.str18, i32 0, i32 0))
  %25 = load %struct._IO_FILE** @stdout, align 8
  %26 = call i32 @fflush(%struct._IO_FILE* %25)
  %27 = load %struct._IO_FILE** @stderr, align 8
  %28 = call i32 @fflush(%struct._IO_FILE* %27)
  ret void
}

declare i32 @gprintf(i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @add_stone(i32 %pos, i32 %color) #0 {
  %1 = load i32* @stackp, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %9

; <label>:4                                       ; preds = %0
  %5 = sdiv i32 %pos, 20
  %6 = sub nsw i32 %5, 1
  %7 = srem i32 %pos, 20
  %8 = sub nsw i32 %7, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 823, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 %6, i32 %8)
  br label %9

; <label>:9                                       ; preds = %4, %3
  %10 = icmp ult i32 %pos, 421
  br i1 %10, label %11, label %18

; <label>:11                                      ; preds = %9
  %12 = sext i32 %pos to i64
  %13 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %12
  %14 = load i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp ne i32 %15, 3
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %11
  br label %23

; <label>:18                                      ; preds = %11, %9
  %19 = sdiv i32 %pos, 20
  %20 = sub nsw i32 %19, 1
  %21 = srem i32 %pos, 20
  %22 = sub nsw i32 %21, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 824, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %20, i32 %22)
  br label %23

; <label>:23                                      ; preds = %18, %17
  %24 = sext i32 %pos to i64
  %25 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %24
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %23
  br label %35

; <label>:30                                      ; preds = %23
  %31 = sdiv i32 %pos, 20
  %32 = sub nsw i32 %31, 1
  %33 = srem i32 %pos, 20
  %34 = sub nsw i32 %33, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 825, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %32, i32 %34)
  br label %35

; <label>:35                                      ; preds = %30, %29
  %36 = trunc i32 %color to i8
  %37 = sext i32 %pos to i64
  %38 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %37
  store i8 %36, i8* %38, align 1
  call void @hashdata_invert_stone(%struct.Hash_data* @hashdata, i32 %pos, i32 %color)
  call void @reset_move_history()
  call void @new_position()
  ret void
}

declare void @hashdata_invert_stone(%struct.Hash_data*, i32, i32) #1

; Function Attrs: nounwind uwtable
define internal void @reset_move_history() #0 {
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @initial_board, i32 0, i32 0), i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i64 421, i32 16, i1 false)
  %1 = load i32* @board_ko_pos, align 4
  store i32 %1, i32* @initial_board_ko_pos, align 4
  %2 = load i32* @white_captured, align 4
  store i32 %2, i32* @initial_white_captured, align 4
  %3 = load i32* @black_captured, align 4
  store i32 %3, i32* @initial_black_captured, align 4
  store i32 0, i32* @move_history_pointer, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @remove_stone(i32 %pos) #0 {
  %1 = load i32* @stackp, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %9

; <label>:4                                       ; preds = %0
  %5 = sdiv i32 %pos, 20
  %6 = sub nsw i32 %5, 1
  %7 = srem i32 %pos, 20
  %8 = sub nsw i32 %7, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 841, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 %6, i32 %8)
  br label %9

; <label>:9                                       ; preds = %4, %3
  %10 = icmp ult i32 %pos, 421
  br i1 %10, label %11, label %18

; <label>:11                                      ; preds = %9
  %12 = sext i32 %pos to i64
  %13 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %12
  %14 = load i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp ne i32 %15, 3
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %11
  br label %23

; <label>:18                                      ; preds = %11, %9
  %19 = sdiv i32 %pos, 20
  %20 = sub nsw i32 %19, 1
  %21 = srem i32 %pos, 20
  %22 = sub nsw i32 %21, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 842, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %20, i32 %22)
  br label %23

; <label>:23                                      ; preds = %18, %17
  %24 = sext i32 %pos to i64
  %25 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %24
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, 1
  br i1 %28, label %35, label %29

; <label>:29                                      ; preds = %23
  %30 = sext i32 %pos to i64
  %31 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %30
  %32 = load i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = icmp eq i32 %33, 2
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %29, %23
  br label %41

; <label>:36                                      ; preds = %29
  %37 = sdiv i32 %pos, 20
  %38 = sub nsw i32 %37, 1
  %39 = srem i32 %pos, 20
  %40 = sub nsw i32 %39, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 843, i8* getelementptr inbounds ([21 x i8]* @.str21, i32 0, i32 0), i32 %38, i32 %40)
  br label %41

; <label>:41                                      ; preds = %36, %35
  %42 = sext i32 %pos to i64
  %43 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %42
  %44 = load i8* %43, align 1
  %45 = zext i8 %44 to i32
  call void @hashdata_invert_stone(%struct.Hash_data* @hashdata, i32 %pos, i32 %45)
  %46 = sext i32 %pos to i64
  %47 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %46
  store i8 0, i8* %47, align 1
  call void @reset_move_history()
  call void @new_position()
  ret void
}

; Function Attrs: nounwind uwtable
define void @play_move(i32 %pos, i32 %color) #0 {
  %saved_board = alloca [421 x i8], align 16
  %1 = load i32* @stackp, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %9

; <label>:4                                       ; preds = %0
  %5 = sdiv i32 %pos, 20
  %6 = sub nsw i32 %5, 1
  %7 = srem i32 %pos, 20
  %8 = sub nsw i32 %7, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 924, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 %6, i32 %8)
  br label %9

; <label>:9                                       ; preds = %4, %3
  %10 = icmp eq i32 %color, 1
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %9
  %12 = icmp eq i32 %color, 2
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %11, %9
  br label %19

; <label>:14                                      ; preds = %11
  %15 = sdiv i32 %pos, 20
  %16 = sub nsw i32 %15, 1
  %17 = srem i32 %pos, 20
  %18 = sub nsw i32 %17, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 925, i8* getelementptr inbounds ([33 x i8]* @.str22, i32 0, i32 0), i32 %16, i32 %18)
  br label %19

; <label>:19                                      ; preds = %14, %13
  %20 = icmp eq i32 %pos, 0
  br i1 %20, label %29, label %21

; <label>:21                                      ; preds = %19
  %22 = icmp ult i32 %pos, 421
  br i1 %22, label %23, label %30

; <label>:23                                      ; preds = %21
  %24 = sext i32 %pos to i64
  %25 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %24
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp ne i32 %27, 3
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %23, %19
  br label %35

; <label>:30                                      ; preds = %23, %21
  %31 = sdiv i32 %pos, 20
  %32 = sub nsw i32 %31, 1
  %33 = srem i32 %pos, 20
  %34 = sub nsw i32 %33, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 926, i8* getelementptr inbounds ([35 x i8]* @.str23, i32 0, i32 0), i32 %32, i32 %34)
  br label %35

; <label>:35                                      ; preds = %30, %29
  %36 = icmp eq i32 %pos, 0
  br i1 %36, label %43, label %37

; <label>:37                                      ; preds = %35
  %38 = sext i32 %pos to i64
  %39 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %38
  %40 = load i8* %39, align 1
  %41 = zext i8 %40 to i32
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %37, %35
  br label %49

; <label>:44                                      ; preds = %37
  %45 = sdiv i32 %pos, 20
  %46 = sub nsw i32 %45, 1
  %47 = srem i32 %pos, 20
  %48 = sub nsw i32 %47, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 927, i8* getelementptr inbounds ([40 x i8]* @.str24, i32 0, i32 0), i32 %46, i32 %48)
  br label %49

; <label>:49                                      ; preds = %44, %43
  %50 = load i32* @move_history_pointer, align 4
  %51 = icmp sge i32 %50, 500
  br i1 %51, label %52, label %82

; <label>:52                                      ; preds = %49
  %53 = load i32* @board_ko_pos, align 4
  %54 = load i32* @white_captured, align 4
  %55 = load i32* @black_captured, align 4
  %56 = bitcast [421 x i8]* %saved_board to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %56, i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i64 421, i32 16, i1 false)
  call void @replay_move_history(i32 51)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @initial_board, i32 0, i32 0), i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i64 421, i32 16, i1 false)
  %57 = load i32* @board_ko_pos, align 4
  store i32 %57, i32* @initial_board_ko_pos, align 4
  %58 = load i32* @white_captured, align 4
  store i32 %58, i32* @initial_white_captured, align 4
  %59 = load i32* @black_captured, align 4
  store i32 %59, i32* @initial_black_captured, align 4
  br label %60

; <label>:60                                      ; preds = %76, %52
  %k.0 = phi i32 [ 51, %52 ], [ %77, %76 ]
  %61 = load i32* @move_history_pointer, align 4
  %62 = icmp slt i32 %k.0, %61
  br i1 %62, label %63, label %78

; <label>:63                                      ; preds = %60
  %64 = sext i32 %k.0 to i64
  %65 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %64
  %66 = load i32* %65, align 4
  %67 = sub nsw i32 %k.0, 51
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %68
  store i32 %66, i32* %69, align 4
  %70 = sext i32 %k.0 to i64
  %71 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %70
  %72 = load i32* %71, align 4
  %73 = sub nsw i32 %k.0, 51
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %74
  store i32 %72, i32* %75, align 4
  br label %76

; <label>:76                                      ; preds = %63
  %77 = add nsw i32 %k.0, 1
  br label %60

; <label>:78                                      ; preds = %60
  %79 = load i32* @move_history_pointer, align 4
  %80 = sub nsw i32 %79, 51
  store i32 %80, i32* @move_history_pointer, align 4
  %81 = bitcast [421 x i8]* %saved_board to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i8* %81, i64 421, i32 16, i1 false)
  store i32 %53, i32* @board_ko_pos, align 4
  store i32 %54, i32* @white_captured, align 4
  store i32 %55, i32* @black_captured, align 4
  br label %82

; <label>:82                                      ; preds = %78, %49
  %83 = load i32* @move_history_pointer, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %84
  store i32 %color, i32* %85, align 4
  %86 = load i32* @move_history_pointer, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %87
  store i32 %pos, i32* %88, align 4
  %89 = load i32* @move_history_pointer, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* @move_history_pointer, align 4
  call void @play_move_no_history(i32 %pos, i32 %color)
  %91 = load i32* @movenum, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* @movenum, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @replay_move_history(i32 %n) #0 {
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i8* getelementptr inbounds ([421 x i8]* @initial_board, i32 0, i32 0), i64 421, i32 16, i1 false)
  %1 = load i32* @initial_board_ko_pos, align 4
  store i32 %1, i32* @board_ko_pos, align 4
  %2 = load i32* @initial_white_captured, align 4
  store i32 %2, i32* @white_captured, align 4
  %3 = load i32* @initial_black_captured, align 4
  store i32 %3, i32* @black_captured, align 4
  call void @new_position()
  br label %4

; <label>:4                                       ; preds = %13, %0
  %k.0 = phi i32 [ 0, %0 ], [ %14, %13 ]
  %5 = icmp slt i32 %k.0, %n
  br i1 %5, label %6, label %15

; <label>:6                                       ; preds = %4
  %7 = sext i32 %k.0 to i64
  %8 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %7
  %9 = load i32* %8, align 4
  %10 = sext i32 %k.0 to i64
  %11 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %10
  %12 = load i32* %11, align 4
  call void @play_move_no_history(i32 %9, i32 %12)
  br label %13

; <label>:13                                      ; preds = %6
  %14 = add nsw i32 %k.0, 1
  br label %4

; <label>:15                                      ; preds = %4
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @play_move_no_history(i32 %pos, i32 %color) #0 {
  %1 = load i32* @board_ko_pos, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = load i32* @board_ko_pos, align 4
  call void @hashdata_invert_ko(%struct.Hash_data* @hashdata, i32 %4)
  br label %5

; <label>:5                                       ; preds = %3, %0
  store i32 0, i32* @board_ko_pos, align 4
  %6 = icmp ne i32 %pos, 0
  br i1 %6, label %7, label %34

; <label>:7                                       ; preds = %5
  %8 = icmp ult i32 %pos, 421
  br i1 %8, label %9, label %16

; <label>:9                                       ; preds = %7
  %10 = sext i32 %pos to i64
  %11 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %10
  %12 = load i8* %11, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp ne i32 %13, 3
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %9
  br label %21

; <label>:16                                      ; preds = %9, %7
  %17 = sdiv i32 %pos, 20
  %18 = sub nsw i32 %17, 1
  %19 = srem i32 %pos, 20
  %20 = sub nsw i32 %19, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 872, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %18, i32 %20)
  br label %21

; <label>:21                                      ; preds = %16, %15
  %22 = sext i32 %pos to i64
  %23 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %22
  %24 = load i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %21
  br label %33

; <label>:28                                      ; preds = %21
  %29 = sdiv i32 %pos, 20
  %30 = sub nsw i32 %29, 1
  %31 = srem i32 %pos, 20
  %32 = sub nsw i32 %31, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 873, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %30, i32 %32)
  br label %33

; <label>:33                                      ; preds = %28, %27
  call void @do_play_move(i32 %pos, i32 %color)
  br label %34

; <label>:34                                      ; preds = %33, %5
  call void @new_position()
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @undo_move(i32 %n) #0 {
  %1 = load i32* @stackp, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %5

; <label>:4                                       ; preds = %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 976, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 -1, i32 -1)
  br label %5

; <label>:5                                       ; preds = %4, %3
  %6 = load i32* @move_history_pointer, align 4
  %7 = icmp slt i32 %6, %n
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  br label %16

; <label>:9                                       ; preds = %5
  %10 = load i32* @move_history_pointer, align 4
  %11 = sub nsw i32 %10, %n
  call void @replay_move_history(i32 %11)
  %12 = load i32* @move_history_pointer, align 4
  %13 = sub nsw i32 %12, %n
  store i32 %13, i32* @move_history_pointer, align 4
  %14 = load i32* @movenum, align 4
  %15 = sub nsw i32 %14, %n
  store i32 %15, i32* @movenum, align 4
  br label %16

; <label>:16                                      ; preds = %9, %8
  %.0 = phi i32 [ 0, %8 ], [ 1, %9 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @get_last_opponent_move(i32 %color) #0 {
  %1 = load i32* @move_history_pointer, align 4
  %2 = sub nsw i32 %1, 1
  br label %3

; <label>:3                                       ; preds = %16, %0
  %k.0 = phi i32 [ %2, %0 ], [ %17, %16 ]
  %4 = icmp sge i32 %k.0, 0
  br i1 %4, label %5, label %18

; <label>:5                                       ; preds = %3
  %6 = sext i32 %k.0 to i64
  %7 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %6
  %8 = load i32* %7, align 4
  %9 = sub nsw i32 3, %color
  %10 = icmp eq i32 %8, %9
  br i1 %10, label %11, label %15

; <label>:11                                      ; preds = %5
  %12 = sext i32 %k.0 to i64
  %13 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %12
  %14 = load i32* %13, align 4
  br label %19

; <label>:15                                      ; preds = %5
  br label %16

; <label>:16                                      ; preds = %15
  %17 = add nsw i32 %k.0, -1
  br label %3

; <label>:18                                      ; preds = %3
  br label %19

; <label>:19                                      ; preds = %18, %11
  %.0 = phi i32 [ %14, %11 ], [ 0, %18 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @get_last_move() #0 {
  %1 = load i32* @move_history_pointer, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %10

; <label>:4                                       ; preds = %0
  %5 = load i32* @move_history_pointer, align 4
  %6 = sub nsw i32 %5, 1
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %7
  %9 = load i32* %8, align 4
  br label %10

; <label>:10                                      ; preds = %4, %3
  %.0 = phi i32 [ 0, %3 ], [ %9, %4 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @get_last_player() #0 {
  %1 = load i32* @move_history_pointer, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %10

; <label>:4                                       ; preds = %0
  %5 = load i32* @move_history_pointer, align 4
  %6 = sub nsw i32 %5, 1
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %7
  %9 = load i32* %8, align 4
  br label %10

; <label>:10                                      ; preds = %4, %3
  %.0 = phi i32 [ 0, %3 ], [ %9, %4 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @is_pass(i32 %pos) #0 {
  %1 = icmp eq i32 %pos, 0
  %2 = zext i1 %1 to i32
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @is_legal(i32 %pos, i32 %color) #0 {
  %1 = icmp eq i32 %pos, 0
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %59

; <label>:3                                       ; preds = %0
  %4 = icmp ult i32 %pos, 421
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %3
  %6 = sext i32 %pos to i64
  %7 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %6
  %8 = load i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = icmp ne i32 %9, 3
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %5
  br label %17

; <label>:12                                      ; preds = %5, %3
  %13 = sdiv i32 %pos, 20
  %14 = sub nsw i32 %13, 1
  %15 = srem i32 %pos, 20
  %16 = sub nsw i32 %15, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1059, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %14, i32 %16)
  br label %17

; <label>:17                                      ; preds = %12, %11
  %18 = sext i32 %pos to i64
  %19 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %18
  %20 = load i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %17
  br label %59

; <label>:24                                      ; preds = %17
  %25 = load i32* @board_ko_pos, align 4
  %26 = icmp eq i32 %pos, %25
  br i1 %26, label %27, label %45

; <label>:27                                      ; preds = %24
  %28 = sub nsw i32 %pos, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %29
  %31 = load i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = sub nsw i32 3, %color
  %34 = icmp eq i32 %32, %33
  br i1 %34, label %43, label %35

; <label>:35                                      ; preds = %27
  %36 = add nsw i32 %pos, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %37
  %39 = load i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = sub nsw i32 3, %color
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %35, %27
  br label %59

; <label>:44                                      ; preds = %35
  br label %45

; <label>:45                                      ; preds = %44, %24
  %46 = load i32* @stackp, align 4
  %47 = icmp sge i32 %46, 359
  br i1 %47, label %48, label %51

; <label>:48                                      ; preds = %45
  %49 = load %struct._IO_FILE** @stderr, align 8
  %50 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([62 x i8]* @.str25, i32 0, i32 0))
  br label %59

; <label>:51                                      ; preds = %45
  %52 = load i32* @allow_suicide, align 4
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %58, label %54

; <label>:54                                      ; preds = %51
  %55 = call i32 @is_suicide(i32 %pos, i32 %color)
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %58

; <label>:57                                      ; preds = %54
  br label %59

; <label>:58                                      ; preds = %54, %51
  br label %59

; <label>:59                                      ; preds = %58, %57, %48, %43, %23, %2
  %.0 = phi i32 [ 1, %2 ], [ 0, %23 ], [ 0, %43 ], [ 0, %48 ], [ 1, %58 ], [ 0, %57 ]
  ret i32 %.0
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @is_suicide(i32 %pos, i32 %color) #0 {
  %1 = icmp ult i32 %pos, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %pos to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %pos, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %pos, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1104, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = sext i32 %pos to i64
  %16 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %15
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %14
  br label %26

; <label>:21                                      ; preds = %14
  %22 = sdiv i32 %pos, 20
  %23 = sub nsw i32 %22, 1
  %24 = srem i32 %pos, 20
  %25 = sub nsw i32 %24, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1105, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %23, i32 %25)
  br label %26

; <label>:26                                      ; preds = %21, %20
  %27 = add nsw i32 %pos, 20
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %28
  %30 = load i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %60, label %33

; <label>:33                                      ; preds = %26
  %34 = add nsw i32 %pos, 20
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp ne i32 %38, 3
  br i1 %39, label %40, label %61

; <label>:40                                      ; preds = %33
  %41 = add nsw i32 %pos, 20
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %42
  %44 = load i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = icmp eq i32 %45, %color
  %47 = zext i1 %46 to i32
  %48 = add nsw i32 %pos, 20
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %49
  %51 = load i32* %50, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %52
  %54 = getelementptr inbounds %struct.string_data* %53, i32 0, i32 3
  %55 = load i32* %54, align 4
  %56 = icmp eq i32 %55, 1
  %57 = zext i1 %56 to i32
  %58 = xor i32 %47, %57
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %40, %26
  br label %167

; <label>:61                                      ; preds = %40, %33
  %62 = sub nsw i32 %pos, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %63
  %65 = load i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %95, label %68

; <label>:68                                      ; preds = %61
  %69 = sub nsw i32 %pos, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %70
  %72 = load i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = icmp ne i32 %73, 3
  br i1 %74, label %75, label %96

; <label>:75                                      ; preds = %68
  %76 = sub nsw i32 %pos, 1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %77
  %79 = load i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = icmp eq i32 %80, %color
  %82 = zext i1 %81 to i32
  %83 = sub nsw i32 %pos, 1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %84
  %86 = load i32* %85, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %87
  %89 = getelementptr inbounds %struct.string_data* %88, i32 0, i32 3
  %90 = load i32* %89, align 4
  %91 = icmp eq i32 %90, 1
  %92 = zext i1 %91 to i32
  %93 = xor i32 %82, %92
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %96

; <label>:95                                      ; preds = %75, %61
  br label %167

; <label>:96                                      ; preds = %75, %68
  %97 = sub nsw i32 %pos, 20
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %98
  %100 = load i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %130, label %103

; <label>:103                                     ; preds = %96
  %104 = sub nsw i32 %pos, 20
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %105
  %107 = load i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = icmp ne i32 %108, 3
  br i1 %109, label %110, label %131

; <label>:110                                     ; preds = %103
  %111 = sub nsw i32 %pos, 20
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %112
  %114 = load i8* %113, align 1
  %115 = zext i8 %114 to i32
  %116 = icmp eq i32 %115, %color
  %117 = zext i1 %116 to i32
  %118 = sub nsw i32 %pos, 20
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %119
  %121 = load i32* %120, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %122
  %124 = getelementptr inbounds %struct.string_data* %123, i32 0, i32 3
  %125 = load i32* %124, align 4
  %126 = icmp eq i32 %125, 1
  %127 = zext i1 %126 to i32
  %128 = xor i32 %117, %127
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %130, label %131

; <label>:130                                     ; preds = %110, %96
  br label %167

; <label>:131                                     ; preds = %110, %103
  %132 = add nsw i32 %pos, 1
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %133
  %135 = load i8* %134, align 1
  %136 = zext i8 %135 to i32
  %137 = icmp eq i32 %136, 0
  br i1 %137, label %165, label %138

; <label>:138                                     ; preds = %131
  %139 = add nsw i32 %pos, 1
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %140
  %142 = load i8* %141, align 1
  %143 = zext i8 %142 to i32
  %144 = icmp ne i32 %143, 3
  br i1 %144, label %145, label %166

; <label>:145                                     ; preds = %138
  %146 = add nsw i32 %pos, 1
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %147
  %149 = load i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = icmp eq i32 %150, %color
  %152 = zext i1 %151 to i32
  %153 = add nsw i32 %pos, 1
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %154
  %156 = load i32* %155, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %157
  %159 = getelementptr inbounds %struct.string_data* %158, i32 0, i32 3
  %160 = load i32* %159, align 4
  %161 = icmp eq i32 %160, 1
  %162 = zext i1 %161 to i32
  %163 = xor i32 %152, %162
  %164 = icmp ne i32 %163, 0
  br i1 %164, label %165, label %166

; <label>:165                                     ; preds = %145, %131
  br label %167

; <label>:166                                     ; preds = %145, %138
  br label %167

; <label>:167                                     ; preds = %166, %165, %130, %95, %60
  %.0 = phi i32 [ 0, %60 ], [ 0, %95 ], [ 0, %130 ], [ 0, %165 ], [ 1, %166 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @is_illegal_ko_capture(i32 %pos, i32 %color) #0 {
  %1 = icmp ult i32 %pos, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %pos to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %pos, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %pos, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1139, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = sext i32 %pos to i64
  %16 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %15
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %14
  br label %26

; <label>:21                                      ; preds = %14
  %22 = sdiv i32 %pos, 20
  %23 = sub nsw i32 %22, 1
  %24 = srem i32 %pos, 20
  %25 = sub nsw i32 %24, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1140, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %23, i32 %25)
  br label %26

; <label>:26                                      ; preds = %21, %20
  %27 = load i32* @board_ko_pos, align 4
  %28 = icmp eq i32 %pos, %27
  br i1 %28, label %29, label %47

; <label>:29                                      ; preds = %26
  %30 = sub nsw i32 %pos, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %31
  %33 = load i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = sub nsw i32 3, %color
  %36 = icmp eq i32 %34, %35
  br i1 %36, label %45, label %37

; <label>:37                                      ; preds = %29
  %38 = add nsw i32 %pos, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %39
  %41 = load i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = sub nsw i32 3, %color
  %44 = icmp eq i32 %42, %43
  br label %45

; <label>:45                                      ; preds = %37, %29
  %46 = phi i1 [ true, %29 ], [ %44, %37 ]
  br label %47

; <label>:47                                      ; preds = %45, %26
  %48 = phi i1 [ false, %26 ], [ %46, %45 ]
  %49 = zext i1 %48 to i32
  ret i32 %49
}

; Function Attrs: nounwind uwtable
define i32 @komaster_trymove(i32 %pos, i32 %color, i8* %message, i32 %str, i32 %komaster, i32 %kom_pos, i32* %new_komaster, i32* %new_kom_pos, i32* %is_conditional_ko, i32 %consider_conditional_ko) #0 {
  %kpos = alloca i32, align 4
  %1 = sub nsw i32 3, %color
  %2 = load i32* @board_ko_pos, align 4
  %3 = icmp eq i32 %komaster, 1
  br i1 %3, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = icmp eq i32 %komaster, 4
  br i1 %5, label %6, label %24

; <label>:6                                       ; preds = %4, %0
  %7 = sext i32 %kom_pos to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %46, label %12

; <label>:12                                      ; preds = %6
  %13 = sext i32 %kom_pos to i64
  %14 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %13
  %15 = load i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = icmp eq i32 %16, 2
  br i1 %17, label %46, label %18

; <label>:18                                      ; preds = %12
  %19 = call i32 @is_ko(i32 %kom_pos, i32 2, i32* null)
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %24, label %21

; <label>:21                                      ; preds = %18
  %22 = call i32 @is_suicide(i32 %kom_pos, i32 2)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %46, label %24

; <label>:24                                      ; preds = %21, %18, %4
  %25 = icmp eq i32 %komaster, 2
  br i1 %25, label %28, label %26

; <label>:26                                      ; preds = %24
  %27 = icmp eq i32 %komaster, 5
  br i1 %27, label %28, label %47

; <label>:28                                      ; preds = %26, %24
  %29 = sext i32 %kom_pos to i64
  %30 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %29
  %31 = load i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %46, label %34

; <label>:34                                      ; preds = %28
  %35 = sext i32 %kom_pos to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp eq i32 %38, 2
  br i1 %39, label %46, label %40

; <label>:40                                      ; preds = %34
  %41 = call i32 @is_ko(i32 %kom_pos, i32 1, i32* null)
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %47, label %43

; <label>:43                                      ; preds = %40
  %44 = call i32 @is_suicide(i32 %kom_pos, i32 1)
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %43, %34, %28, %21, %12, %6
  br label %47

; <label>:47                                      ; preds = %46, %43, %40, %26
  %.02 = phi i32 [ 0, %46 ], [ %komaster, %40 ], [ %komaster, %43 ], [ %komaster, %26 ]
  %.01 = phi i32 [ 0, %46 ], [ %kom_pos, %40 ], [ %kom_pos, %43 ], [ %kom_pos, %26 ]
  store i32 %.02, i32* %new_komaster, align 4
  store i32 %.01, i32* %new_kom_pos, align 4
  store i32 0, i32* %is_conditional_ko, align 4
  %48 = call i32 @is_ko(i32 %pos, i32 %color, i32* %kpos)
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %54, label %50

; <label>:50                                      ; preds = %47
  %51 = icmp eq i32 %.02, 6
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %50
  store i32 0, i32* %new_komaster, align 4
  store i32 0, i32* %new_kom_pos, align 4
  br label %53

; <label>:53                                      ; preds = %52, %50
  br label %115

; <label>:54                                      ; preds = %47
  %55 = icmp eq i32 %.02, %1
  br i1 %55, label %56, label %59

; <label>:56                                      ; preds = %54
  %57 = icmp eq i32 %pos, %.01
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %56
  br label %152

; <label>:59                                      ; preds = %56, %54
  %60 = icmp eq i32 %.02, 4
  br i1 %60, label %63, label %61

; <label>:61                                      ; preds = %59
  %62 = icmp eq i32 %.02, 5
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %61, %59
  br label %152

; <label>:64                                      ; preds = %61
  %65 = icmp eq i32 %.02, %color
  br i1 %65, label %66, label %87

; <label>:66                                      ; preds = %64
  %67 = load i32* %kpos, align 4
  %68 = add nsw i32 %.01, 20
  %69 = sub nsw i32 %68, 1
  %70 = icmp eq i32 %67, %69
  br i1 %70, label %87, label %71

; <label>:71                                      ; preds = %66
  %72 = load i32* %kpos, align 4
  %73 = sub nsw i32 %.01, 20
  %74 = sub nsw i32 %73, 1
  %75 = icmp eq i32 %72, %74
  br i1 %75, label %87, label %76

; <label>:76                                      ; preds = %71
  %77 = load i32* %kpos, align 4
  %78 = sub nsw i32 %.01, 20
  %79 = add nsw i32 %78, 1
  %80 = icmp eq i32 %77, %79
  br i1 %80, label %87, label %81

; <label>:81                                      ; preds = %76
  %82 = load i32* %kpos, align 4
  %83 = add nsw i32 %.01, 20
  %84 = add nsw i32 %83, 1
  %85 = icmp eq i32 %82, %84
  br i1 %85, label %87, label %86

; <label>:86                                      ; preds = %81
  br label %152

; <label>:87                                      ; preds = %81, %76, %71, %66, %64
  %88 = icmp eq i32 %.02, 6
  br i1 %88, label %89, label %114

; <label>:89                                      ; preds = %87
  %90 = load i32* @board_ko_pos, align 4
  %91 = icmp ne i32 %pos, %90
  br i1 %91, label %92, label %113

; <label>:92                                      ; preds = %89
  %93 = load i32* %kpos, align 4
  %94 = add nsw i32 %.01, 20
  %95 = sub nsw i32 %94, 1
  %96 = icmp eq i32 %93, %95
  br i1 %96, label %113, label %97

; <label>:97                                      ; preds = %92
  %98 = load i32* %kpos, align 4
  %99 = sub nsw i32 %.01, 20
  %100 = sub nsw i32 %99, 1
  %101 = icmp eq i32 %98, %100
  br i1 %101, label %113, label %102

; <label>:102                                     ; preds = %97
  %103 = load i32* %kpos, align 4
  %104 = sub nsw i32 %.01, 20
  %105 = add nsw i32 %104, 1
  %106 = icmp eq i32 %103, %105
  br i1 %106, label %113, label %107

; <label>:107                                     ; preds = %102
  %108 = load i32* %kpos, align 4
  %109 = add nsw i32 %.01, 20
  %110 = add nsw i32 %109, 1
  %111 = icmp eq i32 %108, %110
  br i1 %111, label %113, label %112

; <label>:112                                     ; preds = %107
  br label %152

; <label>:113                                     ; preds = %107, %102, %97, %92, %89
  br label %114

; <label>:114                                     ; preds = %113, %87
  br label %115

; <label>:115                                     ; preds = %114, %53
  %116 = call i32 @trymove(i32 %pos, i32 %color, i8* %message, i32 %str, i32 %.02, i32 %.01)
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %132, label %118

; <label>:118                                     ; preds = %115
  %119 = icmp ne i32 %consider_conditional_ko, 0
  br i1 %119, label %121, label %120

; <label>:120                                     ; preds = %118
  br label %152

; <label>:121                                     ; preds = %118
  %122 = call i32 @tryko(i32 %pos, i32 %color, i8* %message, i32 %.02, i32 %.01)
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %125, label %124

; <label>:124                                     ; preds = %121
  br label %152

; <label>:125                                     ; preds = %121
  store i32 1, i32* %is_conditional_ko, align 4
  %126 = icmp eq i32 %.02, 0
  br i1 %126, label %129, label %127

; <label>:127                                     ; preds = %125
  %128 = icmp eq i32 %.02, 6
  br i1 %128, label %129, label %131

; <label>:129                                     ; preds = %127, %125
  store i32 %color, i32* %new_komaster, align 4
  %130 = load i32* %kpos, align 4
  store i32 %130, i32* %new_kom_pos, align 4
  br label %152

; <label>:131                                     ; preds = %127
  br label %132

; <label>:132                                     ; preds = %131, %115
  %133 = icmp ne i32 %48, 0
  br i1 %133, label %135, label %134

; <label>:134                                     ; preds = %132
  br label %152

; <label>:135                                     ; preds = %132
  %136 = icmp eq i32 %.02, %1
  br i1 %136, label %137, label %142

; <label>:137                                     ; preds = %135
  %138 = icmp eq i32 %color, 1
  br i1 %138, label %139, label %140

; <label>:139                                     ; preds = %137
  store i32 5, i32* %new_komaster, align 4
  br label %141

; <label>:140                                     ; preds = %137
  store i32 4, i32* %new_komaster, align 4
  br label %141

; <label>:141                                     ; preds = %140, %139
  br label %151

; <label>:142                                     ; preds = %135
  %143 = icmp eq i32 %.02, %color
  br i1 %143, label %144, label %146

; <label>:144                                     ; preds = %142
  %145 = load i32* %kpos, align 4
  store i32 %145, i32* %new_kom_pos, align 4
  br label %150

; <label>:146                                     ; preds = %142
  %147 = icmp ne i32 %2, 0
  br i1 %147, label %148, label %149

; <label>:148                                     ; preds = %146
  store i32 6, i32* %new_komaster, align 4
  store i32 %2, i32* %new_kom_pos, align 4
  br label %149

; <label>:149                                     ; preds = %148, %146
  br label %150

; <label>:150                                     ; preds = %149, %144
  br label %151

; <label>:151                                     ; preds = %150, %141
  br label %152

; <label>:152                                     ; preds = %151, %134, %129, %124, %120, %112, %86, %63, %58
  %.0 = phi i32 [ 0, %58 ], [ 0, %63 ], [ 1, %151 ], [ 1, %134 ], [ 1, %129 ], [ 0, %124 ], [ 0, %120 ], [ 0, %112 ], [ 0, %86 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @is_ko(i32 %pos, i32 %color, i32* %ko_pos) #0 {
  %1 = sub nsw i32 3, %color
  %2 = icmp ult i32 %pos, 421
  br i1 %2, label %3, label %10

; <label>:3                                       ; preds = %0
  %4 = sext i32 %pos to i64
  %5 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %4
  %6 = load i8* %5, align 1
  %7 = zext i8 %6 to i32
  %8 = icmp ne i32 %7, 3
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %3
  br label %15

; <label>:10                                      ; preds = %3, %0
  %11 = sdiv i32 %pos, 20
  %12 = sub nsw i32 %11, 1
  %13 = srem i32 %pos, 20
  %14 = sub nsw i32 %13, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2501, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %12, i32 %14)
  br label %15

; <label>:15                                      ; preds = %10, %9
  %16 = icmp eq i32 %color, 1
  br i1 %16, label %19, label %17

; <label>:17                                      ; preds = %15
  %18 = icmp eq i32 %color, 2
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %17, %15
  br label %25

; <label>:20                                      ; preds = %17
  %21 = sdiv i32 %pos, 20
  %22 = sub nsw i32 %21, 1
  %23 = srem i32 %pos, 20
  %24 = sub nsw i32 %23, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2502, i8* getelementptr inbounds ([33 x i8]* @.str22, i32 0, i32 0), i32 %22, i32 %24)
  br label %25

; <label>:25                                      ; preds = %20, %19
  %26 = add nsw i32 %pos, 20
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %27
  %29 = load i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = icmp ne i32 %30, 3
  br i1 %31, label %32, label %66

; <label>:32                                      ; preds = %25
  %33 = add nsw i32 %pos, 20
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %34
  %36 = load i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = icmp ne i32 %37, %1
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %32
  br label %196

; <label>:40                                      ; preds = %32
  %41 = add nsw i32 %pos, 20
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %42
  %44 = load i32* %43, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %45
  %47 = getelementptr inbounds %struct.string_data* %46, i32 0, i32 3
  %48 = load i32* %47, align 4
  %49 = icmp eq i32 %48, 1
  br i1 %49, label %50, label %64

; <label>:50                                      ; preds = %40
  %51 = add nsw i32 %pos, 20
  %52 = add nsw i32 %pos, 20
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %53
  %55 = load i32* %54, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %56
  %58 = getelementptr inbounds %struct.string_data* %57, i32 0, i32 1
  %59 = load i32* %58, align 4
  %60 = add nsw i32 0, %59
  %61 = icmp sgt i32 %60, 1
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %50
  br label %196

; <label>:63                                      ; preds = %50
  br label %64

; <label>:64                                      ; preds = %63, %40
  %captures.0 = phi i32 [ %60, %63 ], [ 0, %40 ]
  %kpos.0 = phi i32 [ %51, %63 ], [ 0, %40 ]
  br label %65

; <label>:65                                      ; preds = %64
  br label %66

; <label>:66                                      ; preds = %65, %25
  %captures.1 = phi i32 [ %captures.0, %65 ], [ 0, %25 ]
  %kpos.1 = phi i32 [ %kpos.0, %65 ], [ 0, %25 ]
  %67 = sub nsw i32 %pos, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %68
  %70 = load i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = icmp ne i32 %71, 3
  br i1 %72, label %73, label %107

; <label>:73                                      ; preds = %66
  %74 = sub nsw i32 %pos, 1
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %75
  %77 = load i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = icmp ne i32 %78, %1
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %73
  br label %196

; <label>:81                                      ; preds = %73
  %82 = sub nsw i32 %pos, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %83
  %85 = load i32* %84, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %86
  %88 = getelementptr inbounds %struct.string_data* %87, i32 0, i32 3
  %89 = load i32* %88, align 4
  %90 = icmp eq i32 %89, 1
  br i1 %90, label %91, label %105

; <label>:91                                      ; preds = %81
  %92 = sub nsw i32 %pos, 1
  %93 = sub nsw i32 %pos, 1
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %94
  %96 = load i32* %95, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %97
  %99 = getelementptr inbounds %struct.string_data* %98, i32 0, i32 1
  %100 = load i32* %99, align 4
  %101 = add nsw i32 %captures.1, %100
  %102 = icmp sgt i32 %101, 1
  br i1 %102, label %103, label %104

; <label>:103                                     ; preds = %91
  br label %196

; <label>:104                                     ; preds = %91
  br label %105

; <label>:105                                     ; preds = %104, %81
  %captures.2 = phi i32 [ %101, %104 ], [ %captures.1, %81 ]
  %kpos.2 = phi i32 [ %92, %104 ], [ %kpos.1, %81 ]
  br label %106

; <label>:106                                     ; preds = %105
  br label %107

; <label>:107                                     ; preds = %106, %66
  %captures.3 = phi i32 [ %captures.2, %106 ], [ %captures.1, %66 ]
  %kpos.3 = phi i32 [ %kpos.2, %106 ], [ %kpos.1, %66 ]
  %108 = sub nsw i32 %pos, 20
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %109
  %111 = load i8* %110, align 1
  %112 = zext i8 %111 to i32
  %113 = icmp ne i32 %112, 3
  br i1 %113, label %114, label %148

; <label>:114                                     ; preds = %107
  %115 = sub nsw i32 %pos, 20
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %116
  %118 = load i8* %117, align 1
  %119 = zext i8 %118 to i32
  %120 = icmp ne i32 %119, %1
  br i1 %120, label %121, label %122

; <label>:121                                     ; preds = %114
  br label %196

; <label>:122                                     ; preds = %114
  %123 = sub nsw i32 %pos, 20
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %124
  %126 = load i32* %125, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %127
  %129 = getelementptr inbounds %struct.string_data* %128, i32 0, i32 3
  %130 = load i32* %129, align 4
  %131 = icmp eq i32 %130, 1
  br i1 %131, label %132, label %146

; <label>:132                                     ; preds = %122
  %133 = sub nsw i32 %pos, 20
  %134 = sub nsw i32 %pos, 20
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %135
  %137 = load i32* %136, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %138
  %140 = getelementptr inbounds %struct.string_data* %139, i32 0, i32 1
  %141 = load i32* %140, align 4
  %142 = add nsw i32 %captures.3, %141
  %143 = icmp sgt i32 %142, 1
  br i1 %143, label %144, label %145

; <label>:144                                     ; preds = %132
  br label %196

; <label>:145                                     ; preds = %132
  br label %146

; <label>:146                                     ; preds = %145, %122
  %captures.4 = phi i32 [ %142, %145 ], [ %captures.3, %122 ]
  %kpos.4 = phi i32 [ %133, %145 ], [ %kpos.3, %122 ]
  br label %147

; <label>:147                                     ; preds = %146
  br label %148

; <label>:148                                     ; preds = %147, %107
  %captures.5 = phi i32 [ %captures.4, %147 ], [ %captures.3, %107 ]
  %kpos.5 = phi i32 [ %kpos.4, %147 ], [ %kpos.3, %107 ]
  %149 = add nsw i32 %pos, 1
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %150
  %152 = load i8* %151, align 1
  %153 = zext i8 %152 to i32
  %154 = icmp ne i32 %153, 3
  br i1 %154, label %155, label %189

; <label>:155                                     ; preds = %148
  %156 = add nsw i32 %pos, 1
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %157
  %159 = load i8* %158, align 1
  %160 = zext i8 %159 to i32
  %161 = icmp ne i32 %160, %1
  br i1 %161, label %162, label %163

; <label>:162                                     ; preds = %155
  br label %196

; <label>:163                                     ; preds = %155
  %164 = add nsw i32 %pos, 1
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %165
  %167 = load i32* %166, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %168
  %170 = getelementptr inbounds %struct.string_data* %169, i32 0, i32 3
  %171 = load i32* %170, align 4
  %172 = icmp eq i32 %171, 1
  br i1 %172, label %173, label %187

; <label>:173                                     ; preds = %163
  %174 = add nsw i32 %pos, 1
  %175 = add nsw i32 %pos, 1
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %176
  %178 = load i32* %177, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %179
  %181 = getelementptr inbounds %struct.string_data* %180, i32 0, i32 1
  %182 = load i32* %181, align 4
  %183 = add nsw i32 %captures.5, %182
  %184 = icmp sgt i32 %183, 1
  br i1 %184, label %185, label %186

; <label>:185                                     ; preds = %173
  br label %196

; <label>:186                                     ; preds = %173
  br label %187

; <label>:187                                     ; preds = %186, %163
  %captures.6 = phi i32 [ %183, %186 ], [ %captures.5, %163 ]
  %kpos.6 = phi i32 [ %174, %186 ], [ %kpos.5, %163 ]
  br label %188

; <label>:188                                     ; preds = %187
  br label %189

; <label>:189                                     ; preds = %188, %148
  %captures.7 = phi i32 [ %captures.6, %188 ], [ %captures.5, %148 ]
  %kpos.7 = phi i32 [ %kpos.6, %188 ], [ %kpos.5, %148 ]
  %190 = icmp eq i32 %captures.7, 1
  br i1 %190, label %191, label %195

; <label>:191                                     ; preds = %189
  %192 = icmp ne i32* %ko_pos, null
  br i1 %192, label %193, label %194

; <label>:193                                     ; preds = %191
  store i32 %kpos.7, i32* %ko_pos, align 4
  br label %194

; <label>:194                                     ; preds = %193, %191
  br label %196

; <label>:195                                     ; preds = %189
  br label %196

; <label>:196                                     ; preds = %195, %194, %185, %162, %144, %121, %103, %80, %62, %39
  %.0 = phi i32 [ 0, %39 ], [ 0, %62 ], [ 0, %80 ], [ 0, %103 ], [ 0, %121 ], [ 0, %144 ], [ 0, %162 ], [ 0, %185 ], [ 1, %194 ], [ 0, %195 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @is_edge_vertex(i32 %pos) #0 {
  %1 = icmp ult i32 %pos, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %pos to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %pos, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %pos, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1309, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = add nsw i32 %pos, 20
  %16 = sub nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %17
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %30

; <label>:22                                      ; preds = %14
  %23 = sub nsw i32 %pos, 20
  %24 = add nsw i32 %23, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %25
  %27 = load i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = icmp ne i32 %28, 3
  br i1 %29, label %31, label %30

; <label>:30                                      ; preds = %22, %14
  br label %32

; <label>:31                                      ; preds = %22
  br label %32

; <label>:32                                      ; preds = %31, %30
  %.0 = phi i32 [ 0, %31 ], [ 1, %30 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @countlib(i32 %str) #0 {
  %1 = sext i32 %str to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = sext i32 %str to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %6, %0
  br label %18

; <label>:13                                      ; preds = %6
  %14 = sdiv i32 %str, 20
  %15 = sub nsw i32 %14, 1
  %16 = srem i32 %str, 20
  %17 = sub nsw i32 %16, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1325, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %15, i32 %17)
  br label %18

; <label>:18                                      ; preds = %13, %12
  %19 = sext i32 %str to i64
  %20 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %22
  %24 = getelementptr inbounds %struct.string_data* %23, i32 0, i32 3
  %25 = load i32* %24, align 4
  ret i32 %25
}

; Function Attrs: nounwind uwtable
define i32 @findlib(i32 %str, i32 %maxlib, i32* %libs) #0 {
  %1 = sext i32 %str to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = sext i32 %str to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %6, %0
  br label %18

; <label>:13                                      ; preds = %6
  %14 = sdiv i32 %str, 20
  %15 = sub nsw i32 %14, 1
  %16 = srem i32 %str, 20
  %17 = sub nsw i32 %16, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1348, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %15, i32 %17)
  br label %18

; <label>:18                                      ; preds = %13, %12
  %19 = icmp ne i32* %libs, null
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %18
  br label %26

; <label>:21                                      ; preds = %18
  %22 = sdiv i32 %str, 20
  %23 = sub nsw i32 %22, 1
  %24 = srem i32 %str, 20
  %25 = sub nsw i32 %24, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1349, i8* getelementptr inbounds ([13 x i8]* @.str27, i32 0, i32 0), i32 %23, i32 %25)
  br label %26

; <label>:26                                      ; preds = %21, %20
  %27 = sext i32 %str to i64
  %28 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %27
  %29 = load i32* %28, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %30
  %32 = getelementptr inbounds %struct.string_data* %31, i32 0, i32 3
  %33 = load i32* %32, align 4
  %34 = icmp sle i32 %33, 20
  br i1 %34, label %37, label %35

; <label>:35                                      ; preds = %26
  %36 = icmp sle i32 %maxlib, 20
  br i1 %36, label %37, label %56

; <label>:37                                      ; preds = %35, %26
  br label %38

; <label>:38                                      ; preds = %53, %37
  %k.0 = phi i32 [ 0, %37 ], [ %54, %53 ]
  %39 = icmp slt i32 %k.0, %maxlib
  br i1 %39, label %40, label %42

; <label>:40                                      ; preds = %38
  %41 = icmp slt i32 %k.0, %33
  br label %42

; <label>:42                                      ; preds = %40, %38
  %43 = phi i1 [ false, %38 ], [ %41, %40 ]
  br i1 %43, label %44, label %55

; <label>:44                                      ; preds = %42
  %45 = sext i32 %k.0 to i64
  %46 = sext i32 %29 to i64
  %47 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %46
  %48 = getelementptr inbounds %struct.string_data* %47, i32 0, i32 4
  %49 = getelementptr inbounds [20 x i32]* %48, i32 0, i64 %45
  %50 = load i32* %49, align 4
  %51 = sext i32 %k.0 to i64
  %52 = getelementptr inbounds i32* %libs, i64 %51
  store i32 %50, i32* %52, align 4
  br label %53

; <label>:53                                      ; preds = %44
  %54 = add nsw i32 %k.0, 1
  br label %38

; <label>:55                                      ; preds = %42
  br label %179

; <label>:56                                      ; preds = %35
  %57 = load i32* @liberty_mark, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* @liberty_mark, align 4
  %59 = sext i32 %29 to i64
  %60 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %59
  %61 = getelementptr inbounds %struct.string_data* %60, i32 0, i32 2
  %62 = load i32* %61, align 4
  br label %63

; <label>:63                                      ; preds = %174, %56
  %k.1 = phi i32 [ 0, %56 ], [ %k.5, %174 ]
  %pos.0 = phi i32 [ %62, %56 ], [ %177, %174 ]
  %64 = icmp slt i32 %k.1, %maxlib
  br i1 %64, label %65, label %67

; <label>:65                                      ; preds = %63
  %66 = icmp slt i32 %k.1, %33
  br label %67

; <label>:67                                      ; preds = %65, %63
  %68 = phi i1 [ false, %63 ], [ %66, %65 ]
  br i1 %68, label %69, label %178

; <label>:69                                      ; preds = %67
  %70 = add nsw i32 %pos.0, 20
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %71
  %73 = load i8* %72, align 1
  %74 = zext i8 %73 to i32
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %95

; <label>:76                                      ; preds = %69
  %77 = add nsw i32 %pos.0, 20
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %78
  %80 = load i32* %79, align 4
  %81 = load i32* @liberty_mark, align 4
  %82 = icmp ne i32 %80, %81
  br i1 %82, label %83, label %95

; <label>:83                                      ; preds = %76
  %84 = add nsw i32 %pos.0, 20
  %85 = add nsw i32 %k.1, 1
  %86 = sext i32 %k.1 to i64
  %87 = getelementptr inbounds i32* %libs, i64 %86
  store i32 %84, i32* %87, align 4
  %88 = load i32* @liberty_mark, align 4
  %89 = add nsw i32 %pos.0, 20
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %90
  store i32 %88, i32* %91, align 4
  %92 = icmp sge i32 %85, %maxlib
  br i1 %92, label %93, label %94

; <label>:93                                      ; preds = %83
  br label %178

; <label>:94                                      ; preds = %83
  br label %95

; <label>:95                                      ; preds = %94, %76, %69
  %k.2 = phi i32 [ %85, %94 ], [ %k.1, %76 ], [ %k.1, %69 ]
  %96 = sub nsw i32 %pos.0, 1
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %97
  %99 = load i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %102, label %121

; <label>:102                                     ; preds = %95
  %103 = sub nsw i32 %pos.0, 1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %104
  %106 = load i32* %105, align 4
  %107 = load i32* @liberty_mark, align 4
  %108 = icmp ne i32 %106, %107
  br i1 %108, label %109, label %121

; <label>:109                                     ; preds = %102
  %110 = sub nsw i32 %pos.0, 1
  %111 = add nsw i32 %k.2, 1
  %112 = sext i32 %k.2 to i64
  %113 = getelementptr inbounds i32* %libs, i64 %112
  store i32 %110, i32* %113, align 4
  %114 = load i32* @liberty_mark, align 4
  %115 = sub nsw i32 %pos.0, 1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %116
  store i32 %114, i32* %117, align 4
  %118 = icmp sge i32 %111, %maxlib
  br i1 %118, label %119, label %120

; <label>:119                                     ; preds = %109
  br label %178

; <label>:120                                     ; preds = %109
  br label %121

; <label>:121                                     ; preds = %120, %102, %95
  %k.3 = phi i32 [ %111, %120 ], [ %k.2, %102 ], [ %k.2, %95 ]
  %122 = sub nsw i32 %pos.0, 20
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %123
  %125 = load i8* %124, align 1
  %126 = zext i8 %125 to i32
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %128, label %147

; <label>:128                                     ; preds = %121
  %129 = sub nsw i32 %pos.0, 20
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %130
  %132 = load i32* %131, align 4
  %133 = load i32* @liberty_mark, align 4
  %134 = icmp ne i32 %132, %133
  br i1 %134, label %135, label %147

; <label>:135                                     ; preds = %128
  %136 = sub nsw i32 %pos.0, 20
  %137 = add nsw i32 %k.3, 1
  %138 = sext i32 %k.3 to i64
  %139 = getelementptr inbounds i32* %libs, i64 %138
  store i32 %136, i32* %139, align 4
  %140 = load i32* @liberty_mark, align 4
  %141 = sub nsw i32 %pos.0, 20
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %142
  store i32 %140, i32* %143, align 4
  %144 = icmp sge i32 %137, %maxlib
  br i1 %144, label %145, label %146

; <label>:145                                     ; preds = %135
  br label %178

; <label>:146                                     ; preds = %135
  br label %147

; <label>:147                                     ; preds = %146, %128, %121
  %k.4 = phi i32 [ %137, %146 ], [ %k.3, %128 ], [ %k.3, %121 ]
  %148 = add nsw i32 %pos.0, 1
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %149
  %151 = load i8* %150, align 1
  %152 = zext i8 %151 to i32
  %153 = icmp eq i32 %152, 0
  br i1 %153, label %154, label %173

; <label>:154                                     ; preds = %147
  %155 = add nsw i32 %pos.0, 1
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %156
  %158 = load i32* %157, align 4
  %159 = load i32* @liberty_mark, align 4
  %160 = icmp ne i32 %158, %159
  br i1 %160, label %161, label %173

; <label>:161                                     ; preds = %154
  %162 = add nsw i32 %pos.0, 1
  %163 = add nsw i32 %k.4, 1
  %164 = sext i32 %k.4 to i64
  %165 = getelementptr inbounds i32* %libs, i64 %164
  store i32 %162, i32* %165, align 4
  %166 = load i32* @liberty_mark, align 4
  %167 = add nsw i32 %pos.0, 1
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %168
  store i32 %166, i32* %169, align 4
  %170 = icmp sge i32 %163, %maxlib
  br i1 %170, label %171, label %172

; <label>:171                                     ; preds = %161
  br label %178

; <label>:172                                     ; preds = %161
  br label %173

; <label>:173                                     ; preds = %172, %154, %147
  %k.5 = phi i32 [ %163, %172 ], [ %k.4, %154 ], [ %k.4, %147 ]
  br label %174

; <label>:174                                     ; preds = %173
  %175 = sext i32 %pos.0 to i64
  %176 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %175
  %177 = load i32* %176, align 4
  br label %63

; <label>:178                                     ; preds = %171, %145, %119, %93, %67
  br label %179

; <label>:179                                     ; preds = %178, %55
  ret i32 %33
}

; Function Attrs: nounwind uwtable
define i32 @fastlib(i32 %pos, i32 %color, i32 %ignore_captures) #0 {
  %1 = sext i32 %pos to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %12

; <label>:7                                       ; preds = %0
  %8 = sdiv i32 %pos, 20
  %9 = sub nsw i32 %8, 1
  %10 = srem i32 %pos, 20
  %11 = sub nsw i32 %10, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1435, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %9, i32 %11)
  br label %12

; <label>:12                                      ; preds = %7, %6
  %13 = icmp eq i32 %color, 1
  br i1 %13, label %16, label %14

; <label>:14                                      ; preds = %12
  %15 = icmp eq i32 %color, 2
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %14, %12
  br label %22

; <label>:17                                      ; preds = %14
  %18 = sdiv i32 %pos, 20
  %19 = sub nsw i32 %18, 1
  %20 = srem i32 %pos, 20
  %21 = sub nsw i32 %20, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1436, i8* getelementptr inbounds ([16 x i8]* @.str28, i32 0, i32 0), i32 %19, i32 %21)
  br label %22

; <label>:22                                      ; preds = %17, %16
  %23 = add nsw i32 %pos, 20
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %24
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, %color
  br i1 %28, label %29, label %120

; <label>:29                                      ; preds = %22
  %30 = add nsw i32 %pos, 20
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %31
  %33 = load i32* %32, align 4
  %34 = sub nsw i32 %pos, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp eq i32 %38, %color
  br i1 %39, label %40, label %71

; <label>:40                                      ; preds = %29
  %41 = sub nsw i32 %pos, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %42
  %44 = load i32* %43, align 4
  %45 = icmp ne i32 %44, %33
  br i1 %45, label %46, label %71

; <label>:46                                      ; preds = %40
  %47 = sub nsw i32 %pos, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %48
  %50 = load i32* %49, align 4
  %51 = sub nsw i32 %pos, 20
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %52
  %54 = load i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = icmp eq i32 %55, %color
  br i1 %56, label %57, label %70

; <label>:57                                      ; preds = %46
  %58 = sub nsw i32 %pos, 20
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %59
  %61 = load i32* %60, align 4
  %62 = icmp ne i32 %61, %33
  br i1 %62, label %63, label %70

; <label>:63                                      ; preds = %57
  %64 = sub nsw i32 %pos, 20
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = icmp ne i32 %67, %50
  br i1 %68, label %69, label %70

; <label>:69                                      ; preds = %63
  br label %1109

; <label>:70                                      ; preds = %63, %57, %46
  br label %90

; <label>:71                                      ; preds = %40, %29
  %72 = sub nsw i32 %pos, 20
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %73
  %75 = load i8* %74, align 1
  %76 = zext i8 %75 to i32
  %77 = icmp eq i32 %76, %color
  br i1 %77, label %78, label %89

; <label>:78                                      ; preds = %71
  %79 = sub nsw i32 %pos, 20
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %80
  %82 = load i32* %81, align 4
  %83 = icmp ne i32 %82, %33
  br i1 %83, label %84, label %89

; <label>:84                                      ; preds = %78
  %85 = sub nsw i32 %pos, 20
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %86
  %88 = load i32* %87, align 4
  br label %89

; <label>:89                                      ; preds = %84, %78, %71
  %ally2.0 = phi i32 [ %88, %84 ], [ -1, %78 ], [ -1, %71 ]
  br label %90

; <label>:90                                      ; preds = %89, %70
  %ally2.1 = phi i32 [ %50, %70 ], [ %ally2.0, %89 ]
  %91 = add nsw i32 %pos, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %92
  %94 = load i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = icmp eq i32 %95, %color
  br i1 %96, label %97, label %119

; <label>:97                                      ; preds = %90
  %98 = add nsw i32 %pos, 1
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %99
  %101 = load i32* %100, align 4
  %102 = icmp ne i32 %101, %33
  br i1 %102, label %103, label %119

; <label>:103                                     ; preds = %97
  %104 = icmp slt i32 %ally2.1, 0
  br i1 %104, label %105, label %110

; <label>:105                                     ; preds = %103
  %106 = add nsw i32 %pos, 1
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %107
  %109 = load i32* %108, align 4
  br label %118

; <label>:110                                     ; preds = %103
  %111 = add nsw i32 %pos, 1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %112
  %114 = load i32* %113, align 4
  %115 = icmp ne i32 %114, %ally2.1
  br i1 %115, label %116, label %117

; <label>:116                                     ; preds = %110
  br label %1109

; <label>:117                                     ; preds = %110
  br label %118

; <label>:118                                     ; preds = %117, %105
  %ally2.2 = phi i32 [ %109, %105 ], [ %ally2.1, %117 ]
  br label %119

; <label>:119                                     ; preds = %118, %97, %90
  %ally2.3 = phi i32 [ %ally2.2, %118 ], [ %ally2.1, %97 ], [ %ally2.1, %90 ]
  br label %234

; <label>:120                                     ; preds = %22
  %121 = sub nsw i32 %pos, 1
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %122
  %124 = load i8* %123, align 1
  %125 = zext i8 %124 to i32
  %126 = icmp eq i32 %125, %color
  br i1 %126, label %127, label %189

; <label>:127                                     ; preds = %120
  %128 = sub nsw i32 %pos, 1
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %129
  %131 = load i32* %130, align 4
  %132 = sub nsw i32 %pos, 20
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %133
  %135 = load i8* %134, align 1
  %136 = zext i8 %135 to i32
  %137 = icmp eq i32 %136, %color
  br i1 %137, label %138, label %169

; <label>:138                                     ; preds = %127
  %139 = sub nsw i32 %pos, 20
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %140
  %142 = load i32* %141, align 4
  %143 = icmp ne i32 %142, %131
  br i1 %143, label %144, label %169

; <label>:144                                     ; preds = %138
  %145 = sub nsw i32 %pos, 20
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %146
  %148 = load i32* %147, align 4
  %149 = add nsw i32 %pos, 1
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %150
  %152 = load i8* %151, align 1
  %153 = zext i8 %152 to i32
  %154 = icmp eq i32 %153, %color
  br i1 %154, label %155, label %168

; <label>:155                                     ; preds = %144
  %156 = add nsw i32 %pos, 1
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %157
  %159 = load i32* %158, align 4
  %160 = icmp ne i32 %159, %131
  br i1 %160, label %161, label %168

; <label>:161                                     ; preds = %155
  %162 = add nsw i32 %pos, 1
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %163
  %165 = load i32* %164, align 4
  %166 = icmp ne i32 %165, %148
  br i1 %166, label %167, label %168

; <label>:167                                     ; preds = %161
  br label %1109

; <label>:168                                     ; preds = %161, %155, %144
  br label %188

; <label>:169                                     ; preds = %138, %127
  %170 = add nsw i32 %pos, 1
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %171
  %173 = load i8* %172, align 1
  %174 = zext i8 %173 to i32
  %175 = icmp eq i32 %174, %color
  br i1 %175, label %176, label %187

; <label>:176                                     ; preds = %169
  %177 = add nsw i32 %pos, 1
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %178
  %180 = load i32* %179, align 4
  %181 = icmp ne i32 %180, %131
  br i1 %181, label %182, label %187

; <label>:182                                     ; preds = %176
  %183 = add nsw i32 %pos, 1
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %184
  %186 = load i32* %185, align 4
  br label %187

; <label>:187                                     ; preds = %182, %176, %169
  %ally2.4 = phi i32 [ %186, %182 ], [ -1, %176 ], [ -1, %169 ]
  br label %188

; <label>:188                                     ; preds = %187, %168
  %ally2.5 = phi i32 [ %148, %168 ], [ %ally2.4, %187 ]
  br label %233

; <label>:189                                     ; preds = %120
  %190 = sub nsw i32 %pos, 20
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %191
  %193 = load i8* %192, align 1
  %194 = zext i8 %193 to i32
  %195 = icmp eq i32 %194, %color
  br i1 %195, label %196, label %219

; <label>:196                                     ; preds = %189
  %197 = sub nsw i32 %pos, 20
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %198
  %200 = load i32* %199, align 4
  %201 = add nsw i32 %pos, 1
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %202
  %204 = load i8* %203, align 1
  %205 = zext i8 %204 to i32
  %206 = icmp eq i32 %205, %color
  br i1 %206, label %207, label %218

; <label>:207                                     ; preds = %196
  %208 = add nsw i32 %pos, 1
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %209
  %211 = load i32* %210, align 4
  %212 = icmp ne i32 %211, %200
  br i1 %212, label %213, label %218

; <label>:213                                     ; preds = %207
  %214 = add nsw i32 %pos, 1
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %215
  %217 = load i32* %216, align 4
  br label %218

; <label>:218                                     ; preds = %213, %207, %196
  %ally2.6 = phi i32 [ %217, %213 ], [ -1, %207 ], [ -1, %196 ]
  br label %232

; <label>:219                                     ; preds = %189
  %220 = add nsw i32 %pos, 1
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %221
  %223 = load i8* %222, align 1
  %224 = zext i8 %223 to i32
  %225 = icmp eq i32 %224, %color
  br i1 %225, label %226, label %231

; <label>:226                                     ; preds = %219
  %227 = add nsw i32 %pos, 1
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %228
  %230 = load i32* %229, align 4
  br label %231

; <label>:231                                     ; preds = %226, %219
  %ally1.0 = phi i32 [ %230, %226 ], [ -1, %219 ]
  br label %232

; <label>:232                                     ; preds = %231, %218
  %ally1.1 = phi i32 [ %200, %218 ], [ %ally1.0, %231 ]
  %ally2.7 = phi i32 [ %ally2.6, %218 ], [ -1, %231 ]
  br label %233

; <label>:233                                     ; preds = %232, %188
  %ally1.2 = phi i32 [ %131, %188 ], [ %ally1.1, %232 ]
  %ally2.8 = phi i32 [ %ally2.5, %188 ], [ %ally2.7, %232 ]
  br label %234

; <label>:234                                     ; preds = %233, %119
  %ally1.3 = phi i32 [ %33, %119 ], [ %ally1.2, %233 ]
  %ally2.9 = phi i32 [ %ally2.3, %119 ], [ %ally2.8, %233 ]
  %235 = icmp ne i32 %ignore_captures, 0
  br i1 %235, label %236, label %920

; <label>:236                                     ; preds = %234
  %237 = icmp slt i32 %ally1.3, 0
  br i1 %237, label %238, label %275

; <label>:238                                     ; preds = %236
  %239 = add nsw i32 %pos, 20
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %240
  %242 = load i8* %241, align 1
  %243 = zext i8 %242 to i32
  %244 = icmp eq i32 %243, 0
  br i1 %244, label %245, label %247

; <label>:245                                     ; preds = %238
  %246 = add nsw i32 0, 1
  br label %247

; <label>:247                                     ; preds = %245, %238
  %fast_liberties.0 = phi i32 [ %246, %245 ], [ 0, %238 ]
  %248 = sub nsw i32 %pos, 1
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %249
  %251 = load i8* %250, align 1
  %252 = zext i8 %251 to i32
  %253 = icmp eq i32 %252, 0
  br i1 %253, label %254, label %256

; <label>:254                                     ; preds = %247
  %255 = add nsw i32 %fast_liberties.0, 1
  br label %256

; <label>:256                                     ; preds = %254, %247
  %fast_liberties.1 = phi i32 [ %255, %254 ], [ %fast_liberties.0, %247 ]
  %257 = sub nsw i32 %pos, 20
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %258
  %260 = load i8* %259, align 1
  %261 = zext i8 %260 to i32
  %262 = icmp eq i32 %261, 0
  br i1 %262, label %263, label %265

; <label>:263                                     ; preds = %256
  %264 = add nsw i32 %fast_liberties.1, 1
  br label %265

; <label>:265                                     ; preds = %263, %256
  %fast_liberties.2 = phi i32 [ %264, %263 ], [ %fast_liberties.1, %256 ]
  %266 = add nsw i32 %pos, 1
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %267
  %269 = load i8* %268, align 1
  %270 = zext i8 %269 to i32
  %271 = icmp eq i32 %270, 0
  br i1 %271, label %272, label %274

; <label>:272                                     ; preds = %265
  %273 = add nsw i32 %fast_liberties.2, 1
  br label %274

; <label>:274                                     ; preds = %272, %265
  %fast_liberties.3 = phi i32 [ %273, %272 ], [ %fast_liberties.2, %265 ]
  br label %919

; <label>:275                                     ; preds = %236
  %276 = icmp slt i32 %ally2.9, 0
  br i1 %276, label %277, label %500

; <label>:277                                     ; preds = %275
  %278 = add nsw i32 %pos, 20
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %279
  %281 = load i8* %280, align 1
  %282 = zext i8 %281 to i32
  %283 = icmp eq i32 %282, 0
  br i1 %283, label %284, label %331

; <label>:284                                     ; preds = %277
  %285 = add nsw i32 %pos, 20
  %286 = add nsw i32 %285, 20
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %287
  %289 = load i8* %288, align 1
  %290 = zext i8 %289 to i32
  %291 = icmp eq i32 %290, %color
  br i1 %291, label %292, label %299

; <label>:292                                     ; preds = %284
  %293 = add nsw i32 %pos, 20
  %294 = add nsw i32 %293, 20
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %295
  %297 = load i32* %296, align 4
  %298 = icmp eq i32 %297, %ally1.3
  br i1 %298, label %331, label %299

; <label>:299                                     ; preds = %292, %284
  %300 = add nsw i32 %pos, 20
  %301 = sub nsw i32 %300, 1
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %302
  %304 = load i8* %303, align 1
  %305 = zext i8 %304 to i32
  %306 = icmp eq i32 %305, %color
  br i1 %306, label %307, label %314

; <label>:307                                     ; preds = %299
  %308 = add nsw i32 %pos, 20
  %309 = sub nsw i32 %308, 1
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %310
  %312 = load i32* %311, align 4
  %313 = icmp eq i32 %312, %ally1.3
  br i1 %313, label %331, label %314

; <label>:314                                     ; preds = %307, %299
  %315 = add nsw i32 %pos, 20
  %316 = add nsw i32 %315, 1
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %317
  %319 = load i8* %318, align 1
  %320 = zext i8 %319 to i32
  %321 = icmp eq i32 %320, %color
  br i1 %321, label %322, label %329

; <label>:322                                     ; preds = %314
  %323 = add nsw i32 %pos, 20
  %324 = add nsw i32 %323, 1
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %325
  %327 = load i32* %326, align 4
  %328 = icmp eq i32 %327, %ally1.3
  br i1 %328, label %331, label %329

; <label>:329                                     ; preds = %322, %314
  %330 = add nsw i32 0, 1
  br label %331

; <label>:331                                     ; preds = %329, %322, %307, %292, %277
  %fast_liberties.4 = phi i32 [ 0, %292 ], [ 0, %307 ], [ 0, %322 ], [ %330, %329 ], [ 0, %277 ]
  %332 = sub nsw i32 %pos, 1
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %333
  %335 = load i8* %334, align 1
  %336 = zext i8 %335 to i32
  %337 = icmp eq i32 %336, 0
  br i1 %337, label %338, label %385

; <label>:338                                     ; preds = %331
  %339 = sub nsw i32 %pos, 1
  %340 = sub nsw i32 %339, 1
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %341
  %343 = load i8* %342, align 1
  %344 = zext i8 %343 to i32
  %345 = icmp eq i32 %344, %color
  br i1 %345, label %346, label %353

; <label>:346                                     ; preds = %338
  %347 = sub nsw i32 %pos, 1
  %348 = sub nsw i32 %347, 1
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %349
  %351 = load i32* %350, align 4
  %352 = icmp eq i32 %351, %ally1.3
  br i1 %352, label %385, label %353

; <label>:353                                     ; preds = %346, %338
  %354 = sub nsw i32 %pos, 1
  %355 = sub nsw i32 %354, 20
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %356
  %358 = load i8* %357, align 1
  %359 = zext i8 %358 to i32
  %360 = icmp eq i32 %359, %color
  br i1 %360, label %361, label %368

; <label>:361                                     ; preds = %353
  %362 = sub nsw i32 %pos, 1
  %363 = sub nsw i32 %362, 20
  %364 = sext i32 %363 to i64
  %365 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %364
  %366 = load i32* %365, align 4
  %367 = icmp eq i32 %366, %ally1.3
  br i1 %367, label %385, label %368

; <label>:368                                     ; preds = %361, %353
  %369 = sub nsw i32 %pos, 1
  %370 = add nsw i32 %369, 20
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %371
  %373 = load i8* %372, align 1
  %374 = zext i8 %373 to i32
  %375 = icmp eq i32 %374, %color
  br i1 %375, label %376, label %383

; <label>:376                                     ; preds = %368
  %377 = sub nsw i32 %pos, 1
  %378 = add nsw i32 %377, 20
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %379
  %381 = load i32* %380, align 4
  %382 = icmp eq i32 %381, %ally1.3
  br i1 %382, label %385, label %383

; <label>:383                                     ; preds = %376, %368
  %384 = add nsw i32 %fast_liberties.4, 1
  br label %385

; <label>:385                                     ; preds = %383, %376, %361, %346, %331
  %fast_liberties.5 = phi i32 [ %fast_liberties.4, %346 ], [ %fast_liberties.4, %361 ], [ %fast_liberties.4, %376 ], [ %384, %383 ], [ %fast_liberties.4, %331 ]
  %386 = sub nsw i32 %pos, 20
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %387
  %389 = load i8* %388, align 1
  %390 = zext i8 %389 to i32
  %391 = icmp eq i32 %390, 0
  br i1 %391, label %392, label %439

; <label>:392                                     ; preds = %385
  %393 = sub nsw i32 %pos, 20
  %394 = sub nsw i32 %393, 20
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %395
  %397 = load i8* %396, align 1
  %398 = zext i8 %397 to i32
  %399 = icmp eq i32 %398, %color
  br i1 %399, label %400, label %407

; <label>:400                                     ; preds = %392
  %401 = sub nsw i32 %pos, 20
  %402 = sub nsw i32 %401, 20
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %403
  %405 = load i32* %404, align 4
  %406 = icmp eq i32 %405, %ally1.3
  br i1 %406, label %439, label %407

; <label>:407                                     ; preds = %400, %392
  %408 = sub nsw i32 %pos, 20
  %409 = add nsw i32 %408, 1
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %410
  %412 = load i8* %411, align 1
  %413 = zext i8 %412 to i32
  %414 = icmp eq i32 %413, %color
  br i1 %414, label %415, label %422

; <label>:415                                     ; preds = %407
  %416 = sub nsw i32 %pos, 20
  %417 = add nsw i32 %416, 1
  %418 = sext i32 %417 to i64
  %419 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %418
  %420 = load i32* %419, align 4
  %421 = icmp eq i32 %420, %ally1.3
  br i1 %421, label %439, label %422

; <label>:422                                     ; preds = %415, %407
  %423 = sub nsw i32 %pos, 20
  %424 = sub nsw i32 %423, 1
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %425
  %427 = load i8* %426, align 1
  %428 = zext i8 %427 to i32
  %429 = icmp eq i32 %428, %color
  br i1 %429, label %430, label %437

; <label>:430                                     ; preds = %422
  %431 = sub nsw i32 %pos, 20
  %432 = sub nsw i32 %431, 1
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %433
  %435 = load i32* %434, align 4
  %436 = icmp eq i32 %435, %ally1.3
  br i1 %436, label %439, label %437

; <label>:437                                     ; preds = %430, %422
  %438 = add nsw i32 %fast_liberties.5, 1
  br label %439

; <label>:439                                     ; preds = %437, %430, %415, %400, %385
  %fast_liberties.6 = phi i32 [ %fast_liberties.5, %400 ], [ %fast_liberties.5, %415 ], [ %fast_liberties.5, %430 ], [ %438, %437 ], [ %fast_liberties.5, %385 ]
  %440 = add nsw i32 %pos, 1
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %441
  %443 = load i8* %442, align 1
  %444 = zext i8 %443 to i32
  %445 = icmp eq i32 %444, 0
  br i1 %445, label %446, label %493

; <label>:446                                     ; preds = %439
  %447 = add nsw i32 %pos, 1
  %448 = add nsw i32 %447, 1
  %449 = sext i32 %448 to i64
  %450 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %449
  %451 = load i8* %450, align 1
  %452 = zext i8 %451 to i32
  %453 = icmp eq i32 %452, %color
  br i1 %453, label %454, label %461

; <label>:454                                     ; preds = %446
  %455 = add nsw i32 %pos, 1
  %456 = add nsw i32 %455, 1
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %457
  %459 = load i32* %458, align 4
  %460 = icmp eq i32 %459, %ally1.3
  br i1 %460, label %493, label %461

; <label>:461                                     ; preds = %454, %446
  %462 = add nsw i32 %pos, 1
  %463 = add nsw i32 %462, 20
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %464
  %466 = load i8* %465, align 1
  %467 = zext i8 %466 to i32
  %468 = icmp eq i32 %467, %color
  br i1 %468, label %469, label %476

; <label>:469                                     ; preds = %461
  %470 = add nsw i32 %pos, 1
  %471 = add nsw i32 %470, 20
  %472 = sext i32 %471 to i64
  %473 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %472
  %474 = load i32* %473, align 4
  %475 = icmp eq i32 %474, %ally1.3
  br i1 %475, label %493, label %476

; <label>:476                                     ; preds = %469, %461
  %477 = add nsw i32 %pos, 1
  %478 = sub nsw i32 %477, 20
  %479 = sext i32 %478 to i64
  %480 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %479
  %481 = load i8* %480, align 1
  %482 = zext i8 %481 to i32
  %483 = icmp eq i32 %482, %color
  br i1 %483, label %484, label %491

; <label>:484                                     ; preds = %476
  %485 = add nsw i32 %pos, 1
  %486 = sub nsw i32 %485, 20
  %487 = sext i32 %486 to i64
  %488 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %487
  %489 = load i32* %488, align 4
  %490 = icmp eq i32 %489, %ally1.3
  br i1 %490, label %493, label %491

; <label>:491                                     ; preds = %484, %476
  %492 = add nsw i32 %fast_liberties.6, 1
  br label %493

; <label>:493                                     ; preds = %491, %484, %469, %454, %439
  %fast_liberties.7 = phi i32 [ %fast_liberties.6, %454 ], [ %fast_liberties.6, %469 ], [ %fast_liberties.6, %484 ], [ %492, %491 ], [ %fast_liberties.6, %439 ]
  %494 = sext i32 %ally1.3 to i64
  %495 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %494
  %496 = getelementptr inbounds %struct.string_data* %495, i32 0, i32 3
  %497 = load i32* %496, align 4
  %498 = sub nsw i32 %497, 1
  %499 = add nsw i32 %fast_liberties.7, %498
  br label %918

; <label>:500                                     ; preds = %275
  %501 = add nsw i32 %pos, 20
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %502
  %504 = load i8* %503, align 1
  %505 = zext i8 %504 to i32
  %506 = icmp eq i32 %505, 0
  br i1 %506, label %507, label %599

; <label>:507                                     ; preds = %500
  %508 = add nsw i32 %pos, 20
  %509 = add nsw i32 %508, 20
  %510 = sext i32 %509 to i64
  %511 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %510
  %512 = load i8* %511, align 1
  %513 = zext i8 %512 to i32
  %514 = icmp eq i32 %513, %color
  br i1 %514, label %515, label %522

; <label>:515                                     ; preds = %507
  %516 = add nsw i32 %pos, 20
  %517 = add nsw i32 %516, 20
  %518 = sext i32 %517 to i64
  %519 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %518
  %520 = load i32* %519, align 4
  %521 = icmp eq i32 %520, %ally1.3
  br i1 %521, label %599, label %522

; <label>:522                                     ; preds = %515, %507
  %523 = add nsw i32 %pos, 20
  %524 = sub nsw i32 %523, 1
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %525
  %527 = load i8* %526, align 1
  %528 = zext i8 %527 to i32
  %529 = icmp eq i32 %528, %color
  br i1 %529, label %530, label %537

; <label>:530                                     ; preds = %522
  %531 = add nsw i32 %pos, 20
  %532 = sub nsw i32 %531, 1
  %533 = sext i32 %532 to i64
  %534 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %533
  %535 = load i32* %534, align 4
  %536 = icmp eq i32 %535, %ally1.3
  br i1 %536, label %599, label %537

; <label>:537                                     ; preds = %530, %522
  %538 = add nsw i32 %pos, 20
  %539 = add nsw i32 %538, 1
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %540
  %542 = load i8* %541, align 1
  %543 = zext i8 %542 to i32
  %544 = icmp eq i32 %543, %color
  br i1 %544, label %545, label %552

; <label>:545                                     ; preds = %537
  %546 = add nsw i32 %pos, 20
  %547 = add nsw i32 %546, 1
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %548
  %550 = load i32* %549, align 4
  %551 = icmp eq i32 %550, %ally1.3
  br i1 %551, label %599, label %552

; <label>:552                                     ; preds = %545, %537
  %553 = add nsw i32 %pos, 20
  %554 = add nsw i32 %553, 20
  %555 = sext i32 %554 to i64
  %556 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %555
  %557 = load i8* %556, align 1
  %558 = zext i8 %557 to i32
  %559 = icmp eq i32 %558, %color
  br i1 %559, label %560, label %567

; <label>:560                                     ; preds = %552
  %561 = add nsw i32 %pos, 20
  %562 = add nsw i32 %561, 20
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %563
  %565 = load i32* %564, align 4
  %566 = icmp eq i32 %565, %ally2.9
  br i1 %566, label %599, label %567

; <label>:567                                     ; preds = %560, %552
  %568 = add nsw i32 %pos, 20
  %569 = sub nsw i32 %568, 1
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %570
  %572 = load i8* %571, align 1
  %573 = zext i8 %572 to i32
  %574 = icmp eq i32 %573, %color
  br i1 %574, label %575, label %582

; <label>:575                                     ; preds = %567
  %576 = add nsw i32 %pos, 20
  %577 = sub nsw i32 %576, 1
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %578
  %580 = load i32* %579, align 4
  %581 = icmp eq i32 %580, %ally2.9
  br i1 %581, label %599, label %582

; <label>:582                                     ; preds = %575, %567
  %583 = add nsw i32 %pos, 20
  %584 = add nsw i32 %583, 1
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %585
  %587 = load i8* %586, align 1
  %588 = zext i8 %587 to i32
  %589 = icmp eq i32 %588, %color
  br i1 %589, label %590, label %597

; <label>:590                                     ; preds = %582
  %591 = add nsw i32 %pos, 20
  %592 = add nsw i32 %591, 1
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %593
  %595 = load i32* %594, align 4
  %596 = icmp eq i32 %595, %ally2.9
  br i1 %596, label %599, label %597

; <label>:597                                     ; preds = %590, %582
  %598 = add nsw i32 0, 1
  br label %599

; <label>:599                                     ; preds = %597, %590, %575, %560, %545, %530, %515, %500
  %fast_liberties.8 = phi i32 [ 0, %515 ], [ 0, %530 ], [ 0, %545 ], [ 0, %560 ], [ 0, %575 ], [ 0, %590 ], [ %598, %597 ], [ 0, %500 ]
  %600 = sub nsw i32 %pos, 1
  %601 = sext i32 %600 to i64
  %602 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %601
  %603 = load i8* %602, align 1
  %604 = zext i8 %603 to i32
  %605 = icmp eq i32 %604, 0
  br i1 %605, label %606, label %698

; <label>:606                                     ; preds = %599
  %607 = sub nsw i32 %pos, 1
  %608 = sub nsw i32 %607, 1
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %609
  %611 = load i8* %610, align 1
  %612 = zext i8 %611 to i32
  %613 = icmp eq i32 %612, %color
  br i1 %613, label %614, label %621

; <label>:614                                     ; preds = %606
  %615 = sub nsw i32 %pos, 1
  %616 = sub nsw i32 %615, 1
  %617 = sext i32 %616 to i64
  %618 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %617
  %619 = load i32* %618, align 4
  %620 = icmp eq i32 %619, %ally1.3
  br i1 %620, label %698, label %621

; <label>:621                                     ; preds = %614, %606
  %622 = sub nsw i32 %pos, 1
  %623 = sub nsw i32 %622, 20
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %624
  %626 = load i8* %625, align 1
  %627 = zext i8 %626 to i32
  %628 = icmp eq i32 %627, %color
  br i1 %628, label %629, label %636

; <label>:629                                     ; preds = %621
  %630 = sub nsw i32 %pos, 1
  %631 = sub nsw i32 %630, 20
  %632 = sext i32 %631 to i64
  %633 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %632
  %634 = load i32* %633, align 4
  %635 = icmp eq i32 %634, %ally1.3
  br i1 %635, label %698, label %636

; <label>:636                                     ; preds = %629, %621
  %637 = sub nsw i32 %pos, 1
  %638 = add nsw i32 %637, 20
  %639 = sext i32 %638 to i64
  %640 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %639
  %641 = load i8* %640, align 1
  %642 = zext i8 %641 to i32
  %643 = icmp eq i32 %642, %color
  br i1 %643, label %644, label %651

; <label>:644                                     ; preds = %636
  %645 = sub nsw i32 %pos, 1
  %646 = add nsw i32 %645, 20
  %647 = sext i32 %646 to i64
  %648 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %647
  %649 = load i32* %648, align 4
  %650 = icmp eq i32 %649, %ally1.3
  br i1 %650, label %698, label %651

; <label>:651                                     ; preds = %644, %636
  %652 = sub nsw i32 %pos, 1
  %653 = sub nsw i32 %652, 1
  %654 = sext i32 %653 to i64
  %655 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %654
  %656 = load i8* %655, align 1
  %657 = zext i8 %656 to i32
  %658 = icmp eq i32 %657, %color
  br i1 %658, label %659, label %666

; <label>:659                                     ; preds = %651
  %660 = sub nsw i32 %pos, 1
  %661 = sub nsw i32 %660, 1
  %662 = sext i32 %661 to i64
  %663 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %662
  %664 = load i32* %663, align 4
  %665 = icmp eq i32 %664, %ally2.9
  br i1 %665, label %698, label %666

; <label>:666                                     ; preds = %659, %651
  %667 = sub nsw i32 %pos, 1
  %668 = sub nsw i32 %667, 20
  %669 = sext i32 %668 to i64
  %670 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %669
  %671 = load i8* %670, align 1
  %672 = zext i8 %671 to i32
  %673 = icmp eq i32 %672, %color
  br i1 %673, label %674, label %681

; <label>:674                                     ; preds = %666
  %675 = sub nsw i32 %pos, 1
  %676 = sub nsw i32 %675, 20
  %677 = sext i32 %676 to i64
  %678 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %677
  %679 = load i32* %678, align 4
  %680 = icmp eq i32 %679, %ally2.9
  br i1 %680, label %698, label %681

; <label>:681                                     ; preds = %674, %666
  %682 = sub nsw i32 %pos, 1
  %683 = add nsw i32 %682, 20
  %684 = sext i32 %683 to i64
  %685 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %684
  %686 = load i8* %685, align 1
  %687 = zext i8 %686 to i32
  %688 = icmp eq i32 %687, %color
  br i1 %688, label %689, label %696

; <label>:689                                     ; preds = %681
  %690 = sub nsw i32 %pos, 1
  %691 = add nsw i32 %690, 20
  %692 = sext i32 %691 to i64
  %693 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %692
  %694 = load i32* %693, align 4
  %695 = icmp eq i32 %694, %ally2.9
  br i1 %695, label %698, label %696

; <label>:696                                     ; preds = %689, %681
  %697 = add nsw i32 %fast_liberties.8, 1
  br label %698

; <label>:698                                     ; preds = %696, %689, %674, %659, %644, %629, %614, %599
  %fast_liberties.9 = phi i32 [ %fast_liberties.8, %614 ], [ %fast_liberties.8, %629 ], [ %fast_liberties.8, %644 ], [ %fast_liberties.8, %659 ], [ %fast_liberties.8, %674 ], [ %fast_liberties.8, %689 ], [ %697, %696 ], [ %fast_liberties.8, %599 ]
  %699 = sub nsw i32 %pos, 20
  %700 = sext i32 %699 to i64
  %701 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %700
  %702 = load i8* %701, align 1
  %703 = zext i8 %702 to i32
  %704 = icmp eq i32 %703, 0
  br i1 %704, label %705, label %797

; <label>:705                                     ; preds = %698
  %706 = sub nsw i32 %pos, 20
  %707 = sub nsw i32 %706, 20
  %708 = sext i32 %707 to i64
  %709 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %708
  %710 = load i8* %709, align 1
  %711 = zext i8 %710 to i32
  %712 = icmp eq i32 %711, %color
  br i1 %712, label %713, label %720

; <label>:713                                     ; preds = %705
  %714 = sub nsw i32 %pos, 20
  %715 = sub nsw i32 %714, 20
  %716 = sext i32 %715 to i64
  %717 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %716
  %718 = load i32* %717, align 4
  %719 = icmp eq i32 %718, %ally1.3
  br i1 %719, label %797, label %720

; <label>:720                                     ; preds = %713, %705
  %721 = sub nsw i32 %pos, 20
  %722 = add nsw i32 %721, 1
  %723 = sext i32 %722 to i64
  %724 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %723
  %725 = load i8* %724, align 1
  %726 = zext i8 %725 to i32
  %727 = icmp eq i32 %726, %color
  br i1 %727, label %728, label %735

; <label>:728                                     ; preds = %720
  %729 = sub nsw i32 %pos, 20
  %730 = add nsw i32 %729, 1
  %731 = sext i32 %730 to i64
  %732 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %731
  %733 = load i32* %732, align 4
  %734 = icmp eq i32 %733, %ally1.3
  br i1 %734, label %797, label %735

; <label>:735                                     ; preds = %728, %720
  %736 = sub nsw i32 %pos, 20
  %737 = sub nsw i32 %736, 1
  %738 = sext i32 %737 to i64
  %739 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %738
  %740 = load i8* %739, align 1
  %741 = zext i8 %740 to i32
  %742 = icmp eq i32 %741, %color
  br i1 %742, label %743, label %750

; <label>:743                                     ; preds = %735
  %744 = sub nsw i32 %pos, 20
  %745 = sub nsw i32 %744, 1
  %746 = sext i32 %745 to i64
  %747 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %746
  %748 = load i32* %747, align 4
  %749 = icmp eq i32 %748, %ally1.3
  br i1 %749, label %797, label %750

; <label>:750                                     ; preds = %743, %735
  %751 = sub nsw i32 %pos, 20
  %752 = sub nsw i32 %751, 20
  %753 = sext i32 %752 to i64
  %754 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %753
  %755 = load i8* %754, align 1
  %756 = zext i8 %755 to i32
  %757 = icmp eq i32 %756, %color
  br i1 %757, label %758, label %765

; <label>:758                                     ; preds = %750
  %759 = sub nsw i32 %pos, 20
  %760 = sub nsw i32 %759, 20
  %761 = sext i32 %760 to i64
  %762 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %761
  %763 = load i32* %762, align 4
  %764 = icmp eq i32 %763, %ally2.9
  br i1 %764, label %797, label %765

; <label>:765                                     ; preds = %758, %750
  %766 = sub nsw i32 %pos, 20
  %767 = add nsw i32 %766, 1
  %768 = sext i32 %767 to i64
  %769 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %768
  %770 = load i8* %769, align 1
  %771 = zext i8 %770 to i32
  %772 = icmp eq i32 %771, %color
  br i1 %772, label %773, label %780

; <label>:773                                     ; preds = %765
  %774 = sub nsw i32 %pos, 20
  %775 = add nsw i32 %774, 1
  %776 = sext i32 %775 to i64
  %777 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %776
  %778 = load i32* %777, align 4
  %779 = icmp eq i32 %778, %ally2.9
  br i1 %779, label %797, label %780

; <label>:780                                     ; preds = %773, %765
  %781 = sub nsw i32 %pos, 20
  %782 = sub nsw i32 %781, 1
  %783 = sext i32 %782 to i64
  %784 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %783
  %785 = load i8* %784, align 1
  %786 = zext i8 %785 to i32
  %787 = icmp eq i32 %786, %color
  br i1 %787, label %788, label %795

; <label>:788                                     ; preds = %780
  %789 = sub nsw i32 %pos, 20
  %790 = sub nsw i32 %789, 1
  %791 = sext i32 %790 to i64
  %792 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %791
  %793 = load i32* %792, align 4
  %794 = icmp eq i32 %793, %ally2.9
  br i1 %794, label %797, label %795

; <label>:795                                     ; preds = %788, %780
  %796 = add nsw i32 %fast_liberties.9, 1
  br label %797

; <label>:797                                     ; preds = %795, %788, %773, %758, %743, %728, %713, %698
  %fast_liberties.10 = phi i32 [ %fast_liberties.9, %713 ], [ %fast_liberties.9, %728 ], [ %fast_liberties.9, %743 ], [ %fast_liberties.9, %758 ], [ %fast_liberties.9, %773 ], [ %fast_liberties.9, %788 ], [ %796, %795 ], [ %fast_liberties.9, %698 ]
  %798 = add nsw i32 %pos, 1
  %799 = sext i32 %798 to i64
  %800 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %799
  %801 = load i8* %800, align 1
  %802 = zext i8 %801 to i32
  %803 = icmp eq i32 %802, 0
  br i1 %803, label %804, label %896

; <label>:804                                     ; preds = %797
  %805 = add nsw i32 %pos, 1
  %806 = add nsw i32 %805, 1
  %807 = sext i32 %806 to i64
  %808 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %807
  %809 = load i8* %808, align 1
  %810 = zext i8 %809 to i32
  %811 = icmp eq i32 %810, %color
  br i1 %811, label %812, label %819

; <label>:812                                     ; preds = %804
  %813 = add nsw i32 %pos, 1
  %814 = add nsw i32 %813, 1
  %815 = sext i32 %814 to i64
  %816 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %815
  %817 = load i32* %816, align 4
  %818 = icmp eq i32 %817, %ally1.3
  br i1 %818, label %896, label %819

; <label>:819                                     ; preds = %812, %804
  %820 = add nsw i32 %pos, 1
  %821 = add nsw i32 %820, 20
  %822 = sext i32 %821 to i64
  %823 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %822
  %824 = load i8* %823, align 1
  %825 = zext i8 %824 to i32
  %826 = icmp eq i32 %825, %color
  br i1 %826, label %827, label %834

; <label>:827                                     ; preds = %819
  %828 = add nsw i32 %pos, 1
  %829 = add nsw i32 %828, 20
  %830 = sext i32 %829 to i64
  %831 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %830
  %832 = load i32* %831, align 4
  %833 = icmp eq i32 %832, %ally1.3
  br i1 %833, label %896, label %834

; <label>:834                                     ; preds = %827, %819
  %835 = add nsw i32 %pos, 1
  %836 = sub nsw i32 %835, 20
  %837 = sext i32 %836 to i64
  %838 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %837
  %839 = load i8* %838, align 1
  %840 = zext i8 %839 to i32
  %841 = icmp eq i32 %840, %color
  br i1 %841, label %842, label %849

; <label>:842                                     ; preds = %834
  %843 = add nsw i32 %pos, 1
  %844 = sub nsw i32 %843, 20
  %845 = sext i32 %844 to i64
  %846 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %845
  %847 = load i32* %846, align 4
  %848 = icmp eq i32 %847, %ally1.3
  br i1 %848, label %896, label %849

; <label>:849                                     ; preds = %842, %834
  %850 = add nsw i32 %pos, 1
  %851 = add nsw i32 %850, 1
  %852 = sext i32 %851 to i64
  %853 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %852
  %854 = load i8* %853, align 1
  %855 = zext i8 %854 to i32
  %856 = icmp eq i32 %855, %color
  br i1 %856, label %857, label %864

; <label>:857                                     ; preds = %849
  %858 = add nsw i32 %pos, 1
  %859 = add nsw i32 %858, 1
  %860 = sext i32 %859 to i64
  %861 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %860
  %862 = load i32* %861, align 4
  %863 = icmp eq i32 %862, %ally2.9
  br i1 %863, label %896, label %864

; <label>:864                                     ; preds = %857, %849
  %865 = add nsw i32 %pos, 1
  %866 = add nsw i32 %865, 20
  %867 = sext i32 %866 to i64
  %868 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %867
  %869 = load i8* %868, align 1
  %870 = zext i8 %869 to i32
  %871 = icmp eq i32 %870, %color
  br i1 %871, label %872, label %879

; <label>:872                                     ; preds = %864
  %873 = add nsw i32 %pos, 1
  %874 = add nsw i32 %873, 20
  %875 = sext i32 %874 to i64
  %876 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %875
  %877 = load i32* %876, align 4
  %878 = icmp eq i32 %877, %ally2.9
  br i1 %878, label %896, label %879

; <label>:879                                     ; preds = %872, %864
  %880 = add nsw i32 %pos, 1
  %881 = sub nsw i32 %880, 20
  %882 = sext i32 %881 to i64
  %883 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %882
  %884 = load i8* %883, align 1
  %885 = zext i8 %884 to i32
  %886 = icmp eq i32 %885, %color
  br i1 %886, label %887, label %894

; <label>:887                                     ; preds = %879
  %888 = add nsw i32 %pos, 1
  %889 = sub nsw i32 %888, 20
  %890 = sext i32 %889 to i64
  %891 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %890
  %892 = load i32* %891, align 4
  %893 = icmp eq i32 %892, %ally2.9
  br i1 %893, label %896, label %894

; <label>:894                                     ; preds = %887, %879
  %895 = add nsw i32 %fast_liberties.10, 1
  br label %896

; <label>:896                                     ; preds = %894, %887, %872, %857, %842, %827, %812, %797
  %fast_liberties.11 = phi i32 [ %fast_liberties.10, %812 ], [ %fast_liberties.10, %827 ], [ %fast_liberties.10, %842 ], [ %fast_liberties.10, %857 ], [ %fast_liberties.10, %872 ], [ %fast_liberties.10, %887 ], [ %895, %894 ], [ %fast_liberties.10, %797 ]
  %897 = sext i32 %ally1.3 to i64
  %898 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %897
  %899 = getelementptr inbounds %struct.string_data* %898, i32 0, i32 3
  %900 = load i32* %899, align 4
  %901 = sext i32 %ally2.9 to i64
  %902 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %901
  %903 = getelementptr inbounds %struct.string_data* %902, i32 0, i32 3
  %904 = load i32* %903, align 4
  %905 = add nsw i32 %900, %904
  %906 = sext i32 %ally1.3 to i64
  %907 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %906
  %908 = getelementptr inbounds %struct.string_data* %907, i32 0, i32 2
  %909 = load i32* %908, align 4
  %910 = sext i32 %ally2.9 to i64
  %911 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %910
  %912 = getelementptr inbounds %struct.string_data* %911, i32 0, i32 2
  %913 = load i32* %912, align 4
  %914 = call i32 @count_common_libs(i32 %909, i32 %913)
  %915 = sub nsw i32 %905, %914
  %916 = sub nsw i32 %915, 1
  %917 = add nsw i32 %fast_liberties.11, %916
  br label %918

; <label>:918                                     ; preds = %896, %493
  %fast_liberties.12 = phi i32 [ %499, %493 ], [ %917, %896 ]
  br label %919

; <label>:919                                     ; preds = %918, %274
  %fast_liberties.13 = phi i32 [ %fast_liberties.3, %274 ], [ %fast_liberties.12, %918 ]
  br label %1108

; <label>:920                                     ; preds = %234
  br label %921

; <label>:921                                     ; preds = %1078, %920
  %fast_liberties.14 = phi i32 [ 0, %920 ], [ %fast_liberties.16, %1078 ]
  %k.0 = phi i32 [ 0, %920 ], [ %1079, %1078 ]
  %922 = icmp slt i32 %k.0, 4
  br i1 %922, label %923, label %1080

; <label>:923                                     ; preds = %921
  %924 = sext i32 %k.0 to i64
  %925 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %924
  %926 = load i32* %925, align 4
  %927 = add nsw i32 %pos, %926
  %928 = sext i32 %927 to i64
  %929 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %928
  %930 = load i8* %929, align 1
  %931 = zext i8 %930 to i32
  %932 = icmp eq i32 %931, 0
  br i1 %932, label %933, label %1043

; <label>:933                                     ; preds = %923
  %934 = icmp slt i32 %ally1.3, 0
  br i1 %934, label %987, label %935

; <label>:935                                     ; preds = %933
  %936 = add nsw i32 %927, 20
  %937 = sext i32 %936 to i64
  %938 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %937
  %939 = load i8* %938, align 1
  %940 = zext i8 %939 to i32
  %941 = icmp eq i32 %940, %color
  br i1 %941, label %942, label %948

; <label>:942                                     ; preds = %935
  %943 = add nsw i32 %927, 20
  %944 = sext i32 %943 to i64
  %945 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %944
  %946 = load i32* %945, align 4
  %947 = icmp eq i32 %946, %ally1.3
  br i1 %947, label %1043, label %948

; <label>:948                                     ; preds = %942, %935
  %949 = sub nsw i32 %927, 1
  %950 = sext i32 %949 to i64
  %951 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %950
  %952 = load i8* %951, align 1
  %953 = zext i8 %952 to i32
  %954 = icmp eq i32 %953, %color
  br i1 %954, label %955, label %961

; <label>:955                                     ; preds = %948
  %956 = sub nsw i32 %927, 1
  %957 = sext i32 %956 to i64
  %958 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %957
  %959 = load i32* %958, align 4
  %960 = icmp eq i32 %959, %ally1.3
  br i1 %960, label %1043, label %961

; <label>:961                                     ; preds = %955, %948
  %962 = sub nsw i32 %927, 20
  %963 = sext i32 %962 to i64
  %964 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %963
  %965 = load i8* %964, align 1
  %966 = zext i8 %965 to i32
  %967 = icmp eq i32 %966, %color
  br i1 %967, label %968, label %974

; <label>:968                                     ; preds = %961
  %969 = sub nsw i32 %927, 20
  %970 = sext i32 %969 to i64
  %971 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %970
  %972 = load i32* %971, align 4
  %973 = icmp eq i32 %972, %ally1.3
  br i1 %973, label %1043, label %974

; <label>:974                                     ; preds = %968, %961
  %975 = add nsw i32 %927, 1
  %976 = sext i32 %975 to i64
  %977 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %976
  %978 = load i8* %977, align 1
  %979 = zext i8 %978 to i32
  %980 = icmp eq i32 %979, %color
  br i1 %980, label %981, label %987

; <label>:981                                     ; preds = %974
  %982 = add nsw i32 %927, 1
  %983 = sext i32 %982 to i64
  %984 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %983
  %985 = load i32* %984, align 4
  %986 = icmp eq i32 %985, %ally1.3
  br i1 %986, label %1043, label %987

; <label>:987                                     ; preds = %981, %974, %933
  %988 = icmp slt i32 %ally2.9, 0
  br i1 %988, label %1041, label %989

; <label>:989                                     ; preds = %987
  %990 = add nsw i32 %927, 20
  %991 = sext i32 %990 to i64
  %992 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %991
  %993 = load i8* %992, align 1
  %994 = zext i8 %993 to i32
  %995 = icmp eq i32 %994, %color
  br i1 %995, label %996, label %1002

; <label>:996                                     ; preds = %989
  %997 = add nsw i32 %927, 20
  %998 = sext i32 %997 to i64
  %999 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %998
  %1000 = load i32* %999, align 4
  %1001 = icmp eq i32 %1000, %ally2.9
  br i1 %1001, label %1043, label %1002

; <label>:1002                                    ; preds = %996, %989
  %1003 = sub nsw i32 %927, 1
  %1004 = sext i32 %1003 to i64
  %1005 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1004
  %1006 = load i8* %1005, align 1
  %1007 = zext i8 %1006 to i32
  %1008 = icmp eq i32 %1007, %color
  br i1 %1008, label %1009, label %1015

; <label>:1009                                    ; preds = %1002
  %1010 = sub nsw i32 %927, 1
  %1011 = sext i32 %1010 to i64
  %1012 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1011
  %1013 = load i32* %1012, align 4
  %1014 = icmp eq i32 %1013, %ally2.9
  br i1 %1014, label %1043, label %1015

; <label>:1015                                    ; preds = %1009, %1002
  %1016 = sub nsw i32 %927, 20
  %1017 = sext i32 %1016 to i64
  %1018 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1017
  %1019 = load i8* %1018, align 1
  %1020 = zext i8 %1019 to i32
  %1021 = icmp eq i32 %1020, %color
  br i1 %1021, label %1022, label %1028

; <label>:1022                                    ; preds = %1015
  %1023 = sub nsw i32 %927, 20
  %1024 = sext i32 %1023 to i64
  %1025 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1024
  %1026 = load i32* %1025, align 4
  %1027 = icmp eq i32 %1026, %ally2.9
  br i1 %1027, label %1043, label %1028

; <label>:1028                                    ; preds = %1022, %1015
  %1029 = add nsw i32 %927, 1
  %1030 = sext i32 %1029 to i64
  %1031 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1030
  %1032 = load i8* %1031, align 1
  %1033 = zext i8 %1032 to i32
  %1034 = icmp eq i32 %1033, %color
  br i1 %1034, label %1035, label %1041

; <label>:1035                                    ; preds = %1028
  %1036 = add nsw i32 %927, 1
  %1037 = sext i32 %1036 to i64
  %1038 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1037
  %1039 = load i32* %1038, align 4
  %1040 = icmp eq i32 %1039, %ally2.9
  br i1 %1040, label %1043, label %1041

; <label>:1041                                    ; preds = %1035, %1028, %987
  %1042 = add nsw i32 %fast_liberties.14, 1
  br label %1077

; <label>:1043                                    ; preds = %1035, %1022, %1009, %996, %981, %968, %955, %942, %923
  %1044 = sext i32 %927 to i64
  %1045 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1044
  %1046 = load i8* %1045, align 1
  %1047 = zext i8 %1046 to i32
  %1048 = sub nsw i32 3, %color
  %1049 = icmp eq i32 %1047, %1048
  br i1 %1049, label %1050, label %1076

; <label>:1050                                    ; preds = %1043
  %1051 = sext i32 %927 to i64
  %1052 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1051
  %1053 = load i32* %1052, align 4
  %1054 = sext i32 %1053 to i64
  %1055 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1054
  %1056 = getelementptr inbounds %struct.string_data* %1055, i32 0, i32 3
  %1057 = load i32* %1056, align 4
  %1058 = icmp eq i32 %1057, 1
  br i1 %1058, label %1059, label %1076

; <label>:1059                                    ; preds = %1050
  %1060 = sext i32 %927 to i64
  %1061 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1060
  %1062 = load i32* %1061, align 4
  %1063 = sext i32 %1062 to i64
  %1064 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1063
  %1065 = getelementptr inbounds %struct.string_data* %1064, i32 0, i32 1
  %1066 = load i32* %1065, align 4
  %1067 = icmp eq i32 %1066, 1
  br i1 %1067, label %1072, label %1068

; <label>:1068                                    ; preds = %1059
  %1069 = icmp eq i32 %1066, 2
  br i1 %1069, label %1070, label %1074

; <label>:1070                                    ; preds = %1068
  %1071 = icmp slt i32 %ally1.3, 0
  br i1 %1071, label %1072, label %1074

; <label>:1072                                    ; preds = %1070, %1059
  %1073 = add nsw i32 %fast_liberties.14, 1
  br label %1075

; <label>:1074                                    ; preds = %1070, %1068
  br label %1109

; <label>:1075                                    ; preds = %1072
  br label %1076

; <label>:1076                                    ; preds = %1075, %1050, %1043
  %fast_liberties.15 = phi i32 [ %1073, %1075 ], [ %fast_liberties.14, %1050 ], [ %fast_liberties.14, %1043 ]
  br label %1077

; <label>:1077                                    ; preds = %1076, %1041
  %fast_liberties.16 = phi i32 [ %1042, %1041 ], [ %fast_liberties.15, %1076 ]
  br label %1078

; <label>:1078                                    ; preds = %1077
  %1079 = add nsw i32 %k.0, 1
  br label %921

; <label>:1080                                    ; preds = %921
  %1081 = icmp sge i32 %ally1.3, 0
  br i1 %1081, label %1082, label %1107

; <label>:1082                                    ; preds = %1080
  %1083 = sext i32 %ally1.3 to i64
  %1084 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1083
  %1085 = getelementptr inbounds %struct.string_data* %1084, i32 0, i32 3
  %1086 = load i32* %1085, align 4
  %1087 = sub nsw i32 %1086, 1
  %1088 = add nsw i32 %fast_liberties.14, %1087
  %1089 = icmp sge i32 %ally2.9, 0
  br i1 %1089, label %1090, label %1106

; <label>:1090                                    ; preds = %1082
  %1091 = sext i32 %ally2.9 to i64
  %1092 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1091
  %1093 = getelementptr inbounds %struct.string_data* %1092, i32 0, i32 3
  %1094 = load i32* %1093, align 4
  %1095 = sext i32 %ally1.3 to i64
  %1096 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1095
  %1097 = getelementptr inbounds %struct.string_data* %1096, i32 0, i32 2
  %1098 = load i32* %1097, align 4
  %1099 = sext i32 %ally2.9 to i64
  %1100 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1099
  %1101 = getelementptr inbounds %struct.string_data* %1100, i32 0, i32 2
  %1102 = load i32* %1101, align 4
  %1103 = call i32 @count_common_libs(i32 %1098, i32 %1102)
  %1104 = sub nsw i32 %1094, %1103
  %1105 = add nsw i32 %1088, %1104
  br label %1106

; <label>:1106                                    ; preds = %1090, %1082
  %fast_liberties.17 = phi i32 [ %1105, %1090 ], [ %1088, %1082 ]
  br label %1107

; <label>:1107                                    ; preds = %1106, %1080
  %fast_liberties.18 = phi i32 [ %fast_liberties.17, %1106 ], [ %fast_liberties.14, %1080 ]
  br label %1108

; <label>:1108                                    ; preds = %1107, %919
  %fast_liberties.19 = phi i32 [ %fast_liberties.13, %919 ], [ %fast_liberties.18, %1107 ]
  br label %1109

; <label>:1109                                    ; preds = %1108, %1074, %167, %116, %69
  %.0 = phi i32 [ -1, %69 ], [ %fast_liberties.19, %1108 ], [ -1, %1074 ], [ -1, %116 ], [ -1, %167 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @count_common_libs(i32 %str1, i32 %str2) #0 {
  %all_libs1 = alloca [241 x i32], align 16
  %1 = icmp ult i32 %str1, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %str1 to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %str1, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %str1, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1914, i8* getelementptr inbounds ([16 x i8]* @.str29, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = icmp ult i32 %str2, 421
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %14
  %17 = sext i32 %str2 to i64
  %18 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %17
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %16
  br label %28

; <label>:23                                      ; preds = %16, %14
  %24 = sdiv i32 %str2, 20
  %25 = sub nsw i32 %24, 1
  %26 = srem i32 %str2, 20
  %27 = sub nsw i32 %26, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1915, i8* getelementptr inbounds ([16 x i8]* @.str30, i32 0, i32 0), i32 %25, i32 %27)
  br label %28

; <label>:28                                      ; preds = %23, %22
  %29 = sext i32 %str1 to i64
  %30 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %29
  %31 = load i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %40, label %34

; <label>:34                                      ; preds = %28
  %35 = sext i32 %str1 to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp eq i32 %38, 2
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %34, %28
  br label %46

; <label>:41                                      ; preds = %34
  %42 = sdiv i32 %str1, 20
  %43 = sub nsw i32 %42, 1
  %44 = srem i32 %str1, 20
  %45 = sub nsw i32 %44, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1916, i8* getelementptr inbounds ([22 x i8]* @.str31, i32 0, i32 0), i32 %43, i32 %45)
  br label %46

; <label>:46                                      ; preds = %41, %40
  %47 = sext i32 %str2 to i64
  %48 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %47
  %49 = load i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %50, 1
  br i1 %51, label %58, label %52

; <label>:52                                      ; preds = %46
  %53 = sext i32 %str2 to i64
  %54 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %53
  %55 = load i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = icmp eq i32 %56, 2
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %52, %46
  br label %64

; <label>:59                                      ; preds = %52
  %60 = sdiv i32 %str2, 20
  %61 = sub nsw i32 %60, 1
  %62 = srem i32 %str2, 20
  %63 = sub nsw i32 %62, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1917, i8* getelementptr inbounds ([22 x i8]* @.str32, i32 0, i32 0), i32 %61, i32 %63)
  br label %64

; <label>:64                                      ; preds = %59, %58
  %65 = sext i32 %str1 to i64
  %66 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %68
  %70 = getelementptr inbounds %struct.string_data* %69, i32 0, i32 3
  %71 = load i32* %70, align 4
  %72 = sext i32 %str2 to i64
  %73 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %72
  %74 = load i32* %73, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %75
  %77 = getelementptr inbounds %struct.string_data* %76, i32 0, i32 3
  %78 = load i32* %77, align 4
  %79 = icmp sgt i32 %71, %78
  br i1 %79, label %80, label %88

; <label>:80                                      ; preds = %64
  %81 = sext i32 %str2 to i64
  %82 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %81
  %83 = load i32* %82, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %84
  %86 = getelementptr inbounds %struct.string_data* %85, i32 0, i32 3
  %87 = load i32* %86, align 4
  br label %88

; <label>:88                                      ; preds = %80, %64
  %n.0 = phi i32 [ %83, %80 ], [ %67, %64 ]
  %liberties1.0 = phi i32 [ %87, %80 ], [ %71, %64 ]
  %.02 = phi i32 [ %str1, %80 ], [ %str2, %64 ]
  %.01 = phi i32 [ %str2, %80 ], [ %str1, %64 ]
  %89 = icmp sle i32 %liberties1.0, 20
  br i1 %89, label %90, label %149

; <label>:90                                      ; preds = %88
  %91 = sext i32 %n.0 to i64
  %92 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %91
  %93 = getelementptr inbounds %struct.string_data* %92, i32 0, i32 4
  %94 = getelementptr inbounds [20 x i32]* %93, i32 0, i32 0
  %95 = sext i32 %.02 to i64
  %96 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %95
  %97 = load i32* %96, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %98
  %100 = getelementptr inbounds %struct.string_data* %99, i32 0, i32 3
  %101 = load i32* %100, align 4
  %102 = icmp sle i32 %101, 20
  br i1 %102, label %103, label %148

; <label>:103                                     ; preds = %90
  %104 = load i32* @liberty_mark, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* @liberty_mark, align 4
  br label %106

; <label>:106                                     ; preds = %115, %103
  %k.0 = phi i32 [ 0, %103 ], [ %116, %115 ]
  %107 = icmp slt i32 %k.0, %liberties1.0
  br i1 %107, label %108, label %117

; <label>:108                                     ; preds = %106
  %109 = load i32* @liberty_mark, align 4
  %110 = sext i32 %k.0 to i64
  %111 = getelementptr inbounds i32* %94, i64 %110
  %112 = load i32* %111, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %113
  store i32 %109, i32* %114, align 4
  br label %115

; <label>:115                                     ; preds = %108
  %116 = add nsw i32 %k.0, 1
  br label %106

; <label>:117                                     ; preds = %106
  %118 = sext i32 %97 to i64
  %119 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %118
  %120 = getelementptr inbounds %struct.string_data* %119, i32 0, i32 4
  %121 = getelementptr inbounds [20 x i32]* %120, i32 0, i32 0
  br label %122

; <label>:122                                     ; preds = %145, %117
  %k.1 = phi i32 [ 0, %117 ], [ %146, %145 ]
  %commonlibs.0 = phi i32 [ 0, %117 ], [ %commonlibs.1, %145 ]
  %123 = icmp slt i32 %k.1, %101
  br i1 %123, label %124, label %147

; <label>:124                                     ; preds = %122
  %125 = sext i32 %k.1 to i64
  %126 = getelementptr inbounds i32* %121, i64 %125
  %127 = load i32* %126, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %128
  %130 = load i8* %129, align 1
  %131 = zext i8 %130 to i32
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %133, label %142

; <label>:133                                     ; preds = %124
  %134 = sext i32 %k.1 to i64
  %135 = getelementptr inbounds i32* %121, i64 %134
  %136 = load i32* %135, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %137
  %139 = load i32* %138, align 4
  %140 = load i32* @liberty_mark, align 4
  %141 = icmp ne i32 %139, %140
  br i1 %141, label %144, label %142

; <label>:142                                     ; preds = %133, %124
  %143 = add nsw i32 %commonlibs.0, 1
  br label %144

; <label>:144                                     ; preds = %142, %133
  %commonlibs.1 = phi i32 [ %commonlibs.0, %133 ], [ %143, %142 ]
  br label %145

; <label>:145                                     ; preds = %144
  %146 = add nsw i32 %k.1, 1
  br label %122

; <label>:147                                     ; preds = %122
  br label %266

; <label>:148                                     ; preds = %90
  br label %153

; <label>:149                                     ; preds = %88
  %150 = getelementptr inbounds [241 x i32]* %all_libs1, i32 0, i32 0
  %151 = call i32 @findlib(i32 %.01, i32 241, i32* %150)
  %152 = getelementptr inbounds [241 x i32]* %all_libs1, i32 0, i32 0
  br label %153

; <label>:153                                     ; preds = %149, %148
  %libs1.0 = phi i32* [ %94, %148 ], [ %152, %149 ]
  br label %154

; <label>:154                                     ; preds = %263, %153
  %k.2 = phi i32 [ 0, %153 ], [ %264, %263 ]
  %commonlibs.2 = phi i32 [ 0, %153 ], [ %commonlibs.3, %263 ]
  %155 = icmp slt i32 %k.2, %liberties1.0
  br i1 %155, label %156, label %265

; <label>:156                                     ; preds = %154
  %157 = sext i32 %k.2 to i64
  %158 = getelementptr inbounds i32* %libs1.0, i64 %157
  %159 = load i32* %158, align 4
  %160 = add nsw i32 %159, 20
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %161
  %163 = load i8* %162, align 1
  %164 = zext i8 %163 to i32
  %165 = sext i32 %.02 to i64
  %166 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %165
  %167 = load i8* %166, align 1
  %168 = zext i8 %167 to i32
  %169 = icmp eq i32 %164, %168
  br i1 %169, label %170, label %182

; <label>:170                                     ; preds = %156
  %171 = sext i32 %k.2 to i64
  %172 = getelementptr inbounds i32* %libs1.0, i64 %171
  %173 = load i32* %172, align 4
  %174 = add nsw i32 %173, 20
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %175
  %177 = load i32* %176, align 4
  %178 = sext i32 %.02 to i64
  %179 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %178
  %180 = load i32* %179, align 4
  %181 = icmp eq i32 %177, %180
  br i1 %181, label %260, label %182

; <label>:182                                     ; preds = %170, %156
  %183 = sext i32 %k.2 to i64
  %184 = getelementptr inbounds i32* %libs1.0, i64 %183
  %185 = load i32* %184, align 4
  %186 = sub nsw i32 %185, 1
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %187
  %189 = load i8* %188, align 1
  %190 = zext i8 %189 to i32
  %191 = sext i32 %.02 to i64
  %192 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %191
  %193 = load i8* %192, align 1
  %194 = zext i8 %193 to i32
  %195 = icmp eq i32 %190, %194
  br i1 %195, label %196, label %208

; <label>:196                                     ; preds = %182
  %197 = sext i32 %k.2 to i64
  %198 = getelementptr inbounds i32* %libs1.0, i64 %197
  %199 = load i32* %198, align 4
  %200 = sub nsw i32 %199, 1
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %201
  %203 = load i32* %202, align 4
  %204 = sext i32 %.02 to i64
  %205 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %204
  %206 = load i32* %205, align 4
  %207 = icmp eq i32 %203, %206
  br i1 %207, label %260, label %208

; <label>:208                                     ; preds = %196, %182
  %209 = sext i32 %k.2 to i64
  %210 = getelementptr inbounds i32* %libs1.0, i64 %209
  %211 = load i32* %210, align 4
  %212 = sub nsw i32 %211, 20
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %213
  %215 = load i8* %214, align 1
  %216 = zext i8 %215 to i32
  %217 = sext i32 %.02 to i64
  %218 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %217
  %219 = load i8* %218, align 1
  %220 = zext i8 %219 to i32
  %221 = icmp eq i32 %216, %220
  br i1 %221, label %222, label %234

; <label>:222                                     ; preds = %208
  %223 = sext i32 %k.2 to i64
  %224 = getelementptr inbounds i32* %libs1.0, i64 %223
  %225 = load i32* %224, align 4
  %226 = sub nsw i32 %225, 20
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %227
  %229 = load i32* %228, align 4
  %230 = sext i32 %.02 to i64
  %231 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %230
  %232 = load i32* %231, align 4
  %233 = icmp eq i32 %229, %232
  br i1 %233, label %260, label %234

; <label>:234                                     ; preds = %222, %208
  %235 = sext i32 %k.2 to i64
  %236 = getelementptr inbounds i32* %libs1.0, i64 %235
  %237 = load i32* %236, align 4
  %238 = add nsw i32 %237, 1
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %239
  %241 = load i8* %240, align 1
  %242 = zext i8 %241 to i32
  %243 = sext i32 %.02 to i64
  %244 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %243
  %245 = load i8* %244, align 1
  %246 = zext i8 %245 to i32
  %247 = icmp eq i32 %242, %246
  br i1 %247, label %248, label %262

; <label>:248                                     ; preds = %234
  %249 = sext i32 %k.2 to i64
  %250 = getelementptr inbounds i32* %libs1.0, i64 %249
  %251 = load i32* %250, align 4
  %252 = add nsw i32 %251, 1
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %253
  %255 = load i32* %254, align 4
  %256 = sext i32 %.02 to i64
  %257 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %256
  %258 = load i32* %257, align 4
  %259 = icmp eq i32 %255, %258
  br i1 %259, label %260, label %262

; <label>:260                                     ; preds = %248, %222, %196, %170
  %261 = add nsw i32 %commonlibs.2, 1
  br label %262

; <label>:262                                     ; preds = %260, %248, %234
  %commonlibs.3 = phi i32 [ %261, %260 ], [ %commonlibs.2, %248 ], [ %commonlibs.2, %234 ]
  br label %263

; <label>:263                                     ; preds = %262
  %264 = add nsw i32 %k.2, 1
  br label %154

; <label>:265                                     ; preds = %154
  br label %266

; <label>:266                                     ; preds = %265, %147
  %.0 = phi i32 [ %commonlibs.0, %147 ], [ %commonlibs.2, %265 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @approxlib(i32 %pos, i32 %color, i32 %maxlib, i32* %libs) #0 {
  %1 = sext i32 %pos to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %12

; <label>:7                                       ; preds = %0
  %8 = sdiv i32 %pos, 20
  %9 = sub nsw i32 %8, 1
  %10 = srem i32 %pos, 20
  %11 = sub nsw i32 %10, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1595, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %9, i32 %11)
  br label %12

; <label>:12                                      ; preds = %7, %6
  %13 = icmp eq i32 %color, 1
  br i1 %13, label %16, label %14

; <label>:14                                      ; preds = %12
  %15 = icmp eq i32 %color, 2
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %14, %12
  br label %22

; <label>:17                                      ; preds = %14
  %18 = sdiv i32 %pos, 20
  %19 = sub nsw i32 %18, 1
  %20 = srem i32 %pos, 20
  %21 = sub nsw i32 %20, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1596, i8* getelementptr inbounds ([16 x i8]* @.str28, i32 0, i32 0), i32 %19, i32 %21)
  br label %22

; <label>:22                                      ; preds = %17, %16
  %23 = icmp ne i32* %libs, null
  br i1 %23, label %29, label %24

; <label>:24                                      ; preds = %22
  %25 = call i32 @fastlib(i32 %pos, i32 %color, i32 1)
  %26 = icmp sge i32 %25, 0
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %24
  br label %367

; <label>:28                                      ; preds = %24
  br label %29

; <label>:29                                      ; preds = %28, %22
  %30 = icmp sgt i32 %maxlib, 20
  br i1 %30, label %31, label %33

; <label>:31                                      ; preds = %29
  %32 = call i32 @slow_approxlib(i32 %pos, i32 %color, i32 %maxlib, i32* %libs)
  br label %367

; <label>:33                                      ; preds = %29
  %34 = load i32* @liberty_mark, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* @liberty_mark, align 4
  %36 = load i32* @liberty_mark, align 4
  %37 = sext i32 %pos to i64
  %38 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %37
  store i32 %36, i32* %38, align 4
  %39 = add nsw i32 %pos, 20
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %40
  %42 = load i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %67

; <label>:45                                      ; preds = %33
  %46 = add nsw i32 %pos, 20
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %47
  %49 = load i32* %48, align 4
  %50 = load i32* @liberty_mark, align 4
  %51 = icmp ne i32 %49, %50
  br i1 %51, label %52, label %67

; <label>:52                                      ; preds = %45
  %53 = icmp ne i32* %libs, null
  br i1 %53, label %54, label %58

; <label>:54                                      ; preds = %52
  %55 = add nsw i32 %pos, 20
  %56 = sext i32 0 to i64
  %57 = getelementptr inbounds i32* %libs, i64 %56
  store i32 %55, i32* %57, align 4
  br label %58

; <label>:58                                      ; preds = %54, %52
  %59 = add nsw i32 0, 1
  %60 = icmp sge i32 %59, %maxlib
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %58
  br label %367

; <label>:62                                      ; preds = %58
  %63 = load i32* @liberty_mark, align 4
  %64 = add nsw i32 %pos, 20
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %65
  store i32 %63, i32* %66, align 4
  br label %121

; <label>:67                                      ; preds = %45, %33
  %68 = add nsw i32 %pos, 20
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %69
  %71 = load i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = icmp eq i32 %72, %color
  br i1 %73, label %74, label %120

; <label>:74                                      ; preds = %67
  %75 = add nsw i32 %pos, 20
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %76
  %78 = load i32* %77, align 4
  br label %79

; <label>:79                                      ; preds = %117, %74
  %k.0 = phi i32 [ 0, %74 ], [ %118, %117 ]
  %liberties.0 = phi i32 [ 0, %74 ], [ %liberties.1, %117 ]
  %80 = sext i32 %78 to i64
  %81 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %80
  %82 = getelementptr inbounds %struct.string_data* %81, i32 0, i32 3
  %83 = load i32* %82, align 4
  %84 = icmp slt i32 %k.0, %83
  br i1 %84, label %85, label %119

; <label>:85                                      ; preds = %79
  %86 = sext i32 %k.0 to i64
  %87 = sext i32 %78 to i64
  %88 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %87
  %89 = getelementptr inbounds %struct.string_data* %88, i32 0, i32 4
  %90 = getelementptr inbounds [20 x i32]* %89, i32 0, i64 %86
  %91 = load i32* %90, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %92
  %94 = load i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %97, label %116

; <label>:97                                      ; preds = %85
  %98 = sext i32 %91 to i64
  %99 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %98
  %100 = load i32* %99, align 4
  %101 = load i32* @liberty_mark, align 4
  %102 = icmp ne i32 %100, %101
  br i1 %102, label %103, label %116

; <label>:103                                     ; preds = %97
  %104 = icmp ne i32* %libs, null
  br i1 %104, label %105, label %108

; <label>:105                                     ; preds = %103
  %106 = sext i32 %liberties.0 to i64
  %107 = getelementptr inbounds i32* %libs, i64 %106
  store i32 %91, i32* %107, align 4
  br label %108

; <label>:108                                     ; preds = %105, %103
  %109 = add nsw i32 %liberties.0, 1
  %110 = icmp sge i32 %109, %maxlib
  br i1 %110, label %111, label %112

; <label>:111                                     ; preds = %108
  br label %367

; <label>:112                                     ; preds = %108
  %113 = load i32* @liberty_mark, align 4
  %114 = sext i32 %91 to i64
  %115 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %114
  store i32 %113, i32* %115, align 4
  br label %116

; <label>:116                                     ; preds = %112, %97, %85
  %liberties.1 = phi i32 [ %109, %112 ], [ %liberties.0, %97 ], [ %liberties.0, %85 ]
  br label %117

; <label>:117                                     ; preds = %116
  %118 = add nsw i32 %k.0, 1
  br label %79

; <label>:119                                     ; preds = %79
  br label %120

; <label>:120                                     ; preds = %119, %67
  %liberties.2 = phi i32 [ %liberties.0, %119 ], [ 0, %67 ]
  br label %121

; <label>:121                                     ; preds = %120, %62
  %liberties.3 = phi i32 [ %59, %62 ], [ %liberties.2, %120 ]
  %122 = sub nsw i32 %pos, 1
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %123
  %125 = load i8* %124, align 1
  %126 = zext i8 %125 to i32
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %128, label %150

; <label>:128                                     ; preds = %121
  %129 = sub nsw i32 %pos, 1
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %130
  %132 = load i32* %131, align 4
  %133 = load i32* @liberty_mark, align 4
  %134 = icmp ne i32 %132, %133
  br i1 %134, label %135, label %150

; <label>:135                                     ; preds = %128
  %136 = icmp ne i32* %libs, null
  br i1 %136, label %137, label %141

; <label>:137                                     ; preds = %135
  %138 = sub nsw i32 %pos, 1
  %139 = sext i32 %liberties.3 to i64
  %140 = getelementptr inbounds i32* %libs, i64 %139
  store i32 %138, i32* %140, align 4
  br label %141

; <label>:141                                     ; preds = %137, %135
  %142 = add nsw i32 %liberties.3, 1
  %143 = icmp sge i32 %142, %maxlib
  br i1 %143, label %144, label %145

; <label>:144                                     ; preds = %141
  br label %367

; <label>:145                                     ; preds = %141
  %146 = load i32* @liberty_mark, align 4
  %147 = sub nsw i32 %pos, 1
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %148
  store i32 %146, i32* %149, align 4
  br label %204

; <label>:150                                     ; preds = %128, %121
  %151 = sub nsw i32 %pos, 1
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %152
  %154 = load i8* %153, align 1
  %155 = zext i8 %154 to i32
  %156 = icmp eq i32 %155, %color
  br i1 %156, label %157, label %203

; <label>:157                                     ; preds = %150
  %158 = sub nsw i32 %pos, 1
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %159
  %161 = load i32* %160, align 4
  br label %162

; <label>:162                                     ; preds = %200, %157
  %k.1 = phi i32 [ 0, %157 ], [ %201, %200 ]
  %liberties.4 = phi i32 [ %liberties.3, %157 ], [ %liberties.5, %200 ]
  %163 = sext i32 %161 to i64
  %164 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %163
  %165 = getelementptr inbounds %struct.string_data* %164, i32 0, i32 3
  %166 = load i32* %165, align 4
  %167 = icmp slt i32 %k.1, %166
  br i1 %167, label %168, label %202

; <label>:168                                     ; preds = %162
  %169 = sext i32 %k.1 to i64
  %170 = sext i32 %161 to i64
  %171 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %170
  %172 = getelementptr inbounds %struct.string_data* %171, i32 0, i32 4
  %173 = getelementptr inbounds [20 x i32]* %172, i32 0, i64 %169
  %174 = load i32* %173, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %175
  %177 = load i8* %176, align 1
  %178 = zext i8 %177 to i32
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %180, label %199

; <label>:180                                     ; preds = %168
  %181 = sext i32 %174 to i64
  %182 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %181
  %183 = load i32* %182, align 4
  %184 = load i32* @liberty_mark, align 4
  %185 = icmp ne i32 %183, %184
  br i1 %185, label %186, label %199

; <label>:186                                     ; preds = %180
  %187 = icmp ne i32* %libs, null
  br i1 %187, label %188, label %191

; <label>:188                                     ; preds = %186
  %189 = sext i32 %liberties.4 to i64
  %190 = getelementptr inbounds i32* %libs, i64 %189
  store i32 %174, i32* %190, align 4
  br label %191

; <label>:191                                     ; preds = %188, %186
  %192 = add nsw i32 %liberties.4, 1
  %193 = icmp sge i32 %192, %maxlib
  br i1 %193, label %194, label %195

; <label>:194                                     ; preds = %191
  br label %367

; <label>:195                                     ; preds = %191
  %196 = load i32* @liberty_mark, align 4
  %197 = sext i32 %174 to i64
  %198 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %197
  store i32 %196, i32* %198, align 4
  br label %199

; <label>:199                                     ; preds = %195, %180, %168
  %liberties.5 = phi i32 [ %192, %195 ], [ %liberties.4, %180 ], [ %liberties.4, %168 ]
  br label %200

; <label>:200                                     ; preds = %199
  %201 = add nsw i32 %k.1, 1
  br label %162

; <label>:202                                     ; preds = %162
  br label %203

; <label>:203                                     ; preds = %202, %150
  %liberties.6 = phi i32 [ %liberties.4, %202 ], [ %liberties.3, %150 ]
  br label %204

; <label>:204                                     ; preds = %203, %145
  %liberties.7 = phi i32 [ %142, %145 ], [ %liberties.6, %203 ]
  %205 = sub nsw i32 %pos, 20
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %206
  %208 = load i8* %207, align 1
  %209 = zext i8 %208 to i32
  %210 = icmp eq i32 %209, 0
  br i1 %210, label %211, label %233

; <label>:211                                     ; preds = %204
  %212 = sub nsw i32 %pos, 20
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %213
  %215 = load i32* %214, align 4
  %216 = load i32* @liberty_mark, align 4
  %217 = icmp ne i32 %215, %216
  br i1 %217, label %218, label %233

; <label>:218                                     ; preds = %211
  %219 = icmp ne i32* %libs, null
  br i1 %219, label %220, label %224

; <label>:220                                     ; preds = %218
  %221 = sub nsw i32 %pos, 20
  %222 = sext i32 %liberties.7 to i64
  %223 = getelementptr inbounds i32* %libs, i64 %222
  store i32 %221, i32* %223, align 4
  br label %224

; <label>:224                                     ; preds = %220, %218
  %225 = add nsw i32 %liberties.7, 1
  %226 = icmp sge i32 %225, %maxlib
  br i1 %226, label %227, label %228

; <label>:227                                     ; preds = %224
  br label %367

; <label>:228                                     ; preds = %224
  %229 = load i32* @liberty_mark, align 4
  %230 = sub nsw i32 %pos, 20
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %231
  store i32 %229, i32* %232, align 4
  br label %287

; <label>:233                                     ; preds = %211, %204
  %234 = sub nsw i32 %pos, 20
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %235
  %237 = load i8* %236, align 1
  %238 = zext i8 %237 to i32
  %239 = icmp eq i32 %238, %color
  br i1 %239, label %240, label %286

; <label>:240                                     ; preds = %233
  %241 = sub nsw i32 %pos, 20
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %242
  %244 = load i32* %243, align 4
  br label %245

; <label>:245                                     ; preds = %283, %240
  %k.2 = phi i32 [ 0, %240 ], [ %284, %283 ]
  %liberties.8 = phi i32 [ %liberties.7, %240 ], [ %liberties.9, %283 ]
  %246 = sext i32 %244 to i64
  %247 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %246
  %248 = getelementptr inbounds %struct.string_data* %247, i32 0, i32 3
  %249 = load i32* %248, align 4
  %250 = icmp slt i32 %k.2, %249
  br i1 %250, label %251, label %285

; <label>:251                                     ; preds = %245
  %252 = sext i32 %k.2 to i64
  %253 = sext i32 %244 to i64
  %254 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %253
  %255 = getelementptr inbounds %struct.string_data* %254, i32 0, i32 4
  %256 = getelementptr inbounds [20 x i32]* %255, i32 0, i64 %252
  %257 = load i32* %256, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %258
  %260 = load i8* %259, align 1
  %261 = zext i8 %260 to i32
  %262 = icmp eq i32 %261, 0
  br i1 %262, label %263, label %282

; <label>:263                                     ; preds = %251
  %264 = sext i32 %257 to i64
  %265 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %264
  %266 = load i32* %265, align 4
  %267 = load i32* @liberty_mark, align 4
  %268 = icmp ne i32 %266, %267
  br i1 %268, label %269, label %282

; <label>:269                                     ; preds = %263
  %270 = icmp ne i32* %libs, null
  br i1 %270, label %271, label %274

; <label>:271                                     ; preds = %269
  %272 = sext i32 %liberties.8 to i64
  %273 = getelementptr inbounds i32* %libs, i64 %272
  store i32 %257, i32* %273, align 4
  br label %274

; <label>:274                                     ; preds = %271, %269
  %275 = add nsw i32 %liberties.8, 1
  %276 = icmp sge i32 %275, %maxlib
  br i1 %276, label %277, label %278

; <label>:277                                     ; preds = %274
  br label %367

; <label>:278                                     ; preds = %274
  %279 = load i32* @liberty_mark, align 4
  %280 = sext i32 %257 to i64
  %281 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %280
  store i32 %279, i32* %281, align 4
  br label %282

; <label>:282                                     ; preds = %278, %263, %251
  %liberties.9 = phi i32 [ %275, %278 ], [ %liberties.8, %263 ], [ %liberties.8, %251 ]
  br label %283

; <label>:283                                     ; preds = %282
  %284 = add nsw i32 %k.2, 1
  br label %245

; <label>:285                                     ; preds = %245
  br label %286

; <label>:286                                     ; preds = %285, %233
  %liberties.10 = phi i32 [ %liberties.8, %285 ], [ %liberties.7, %233 ]
  br label %287

; <label>:287                                     ; preds = %286, %228
  %liberties.11 = phi i32 [ %225, %228 ], [ %liberties.10, %286 ]
  %288 = add nsw i32 %pos, 1
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %289
  %291 = load i8* %290, align 1
  %292 = zext i8 %291 to i32
  %293 = icmp eq i32 %292, 0
  br i1 %293, label %294, label %312

; <label>:294                                     ; preds = %287
  %295 = add nsw i32 %pos, 1
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %296
  %298 = load i32* %297, align 4
  %299 = load i32* @liberty_mark, align 4
  %300 = icmp ne i32 %298, %299
  br i1 %300, label %301, label %312

; <label>:301                                     ; preds = %294
  %302 = icmp ne i32* %libs, null
  br i1 %302, label %303, label %307

; <label>:303                                     ; preds = %301
  %304 = add nsw i32 %pos, 1
  %305 = sext i32 %liberties.11 to i64
  %306 = getelementptr inbounds i32* %libs, i64 %305
  store i32 %304, i32* %306, align 4
  br label %307

; <label>:307                                     ; preds = %303, %301
  %308 = add nsw i32 %liberties.11, 1
  %309 = icmp sge i32 %308, %maxlib
  br i1 %309, label %310, label %311

; <label>:310                                     ; preds = %307
  br label %367

; <label>:311                                     ; preds = %307
  br label %366

; <label>:312                                     ; preds = %294, %287
  %313 = add nsw i32 %pos, 1
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %314
  %316 = load i8* %315, align 1
  %317 = zext i8 %316 to i32
  %318 = icmp eq i32 %317, %color
  br i1 %318, label %319, label %365

; <label>:319                                     ; preds = %312
  %320 = add nsw i32 %pos, 1
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %321
  %323 = load i32* %322, align 4
  br label %324

; <label>:324                                     ; preds = %362, %319
  %k.3 = phi i32 [ 0, %319 ], [ %363, %362 ]
  %liberties.12 = phi i32 [ %liberties.11, %319 ], [ %liberties.13, %362 ]
  %325 = sext i32 %323 to i64
  %326 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %325
  %327 = getelementptr inbounds %struct.string_data* %326, i32 0, i32 3
  %328 = load i32* %327, align 4
  %329 = icmp slt i32 %k.3, %328
  br i1 %329, label %330, label %364

; <label>:330                                     ; preds = %324
  %331 = sext i32 %k.3 to i64
  %332 = sext i32 %323 to i64
  %333 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %332
  %334 = getelementptr inbounds %struct.string_data* %333, i32 0, i32 4
  %335 = getelementptr inbounds [20 x i32]* %334, i32 0, i64 %331
  %336 = load i32* %335, align 4
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %337
  %339 = load i8* %338, align 1
  %340 = zext i8 %339 to i32
  %341 = icmp eq i32 %340, 0
  br i1 %341, label %342, label %361

; <label>:342                                     ; preds = %330
  %343 = sext i32 %336 to i64
  %344 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %343
  %345 = load i32* %344, align 4
  %346 = load i32* @liberty_mark, align 4
  %347 = icmp ne i32 %345, %346
  br i1 %347, label %348, label %361

; <label>:348                                     ; preds = %342
  %349 = icmp ne i32* %libs, null
  br i1 %349, label %350, label %353

; <label>:350                                     ; preds = %348
  %351 = sext i32 %liberties.12 to i64
  %352 = getelementptr inbounds i32* %libs, i64 %351
  store i32 %336, i32* %352, align 4
  br label %353

; <label>:353                                     ; preds = %350, %348
  %354 = add nsw i32 %liberties.12, 1
  %355 = icmp sge i32 %354, %maxlib
  br i1 %355, label %356, label %357

; <label>:356                                     ; preds = %353
  br label %367

; <label>:357                                     ; preds = %353
  %358 = load i32* @liberty_mark, align 4
  %359 = sext i32 %336 to i64
  %360 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %359
  store i32 %358, i32* %360, align 4
  br label %361

; <label>:361                                     ; preds = %357, %342, %330
  %liberties.13 = phi i32 [ %354, %357 ], [ %liberties.12, %342 ], [ %liberties.12, %330 ]
  br label %362

; <label>:362                                     ; preds = %361
  %363 = add nsw i32 %k.3, 1
  br label %324

; <label>:364                                     ; preds = %324
  br label %365

; <label>:365                                     ; preds = %364, %312
  %liberties.14 = phi i32 [ %liberties.12, %364 ], [ %liberties.11, %312 ]
  br label %366

; <label>:366                                     ; preds = %365, %311
  %liberties.15 = phi i32 [ %308, %311 ], [ %liberties.14, %365 ]
  br label %367

; <label>:367                                     ; preds = %366, %356, %310, %277, %227, %194, %144, %111, %61, %31, %27
  %.0 = phi i32 [ %32, %31 ], [ %59, %61 ], [ %142, %144 ], [ %225, %227 ], [ %308, %310 ], [ %liberties.15, %366 ], [ %354, %356 ], [ %275, %277 ], [ %192, %194 ], [ %109, %111 ], [ %25, %27 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define internal i32 @slow_approxlib(i32 %pos, i32 %color, i32 %maxlib, i32* %libs) #0 {
  %1 = load i32* @liberty_mark, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, i32* @liberty_mark, align 4
  %3 = load i32* @liberty_mark, align 4
  %4 = sext i32 %pos to i64
  %5 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %4
  store i32 %3, i32* %5, align 4
  %6 = load i32* @string_mark, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* @string_mark, align 4
  br label %8

; <label>:8                                       ; preds = %129, %0
  %liberties.0 = phi i32 [ 0, %0 ], [ %liberties.5, %129 ]
  %k.0 = phi i32 [ 0, %0 ], [ %130, %129 ]
  %9 = icmp slt i32 %k.0, 4
  br i1 %9, label %10, label %131

; <label>:10                                      ; preds = %8
  %11 = sext i32 %k.0 to i64
  %12 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %11
  %13 = load i32* %12, align 4
  %14 = add nsw i32 %pos, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %15
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %42

; <label>:20                                      ; preds = %10
  %21 = add nsw i32 %pos, %13
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %22
  %24 = load i32* %23, align 4
  %25 = load i32* @liberty_mark, align 4
  %26 = icmp ne i32 %24, %25
  br i1 %26, label %27, label %42

; <label>:27                                      ; preds = %20
  %28 = icmp ne i32* %libs, null
  br i1 %28, label %29, label %33

; <label>:29                                      ; preds = %27
  %30 = add nsw i32 %pos, %13
  %31 = sext i32 %liberties.0 to i64
  %32 = getelementptr inbounds i32* %libs, i64 %31
  store i32 %30, i32* %32, align 4
  br label %33

; <label>:33                                      ; preds = %29, %27
  %34 = add nsw i32 %liberties.0, 1
  %35 = icmp eq i32 %34, %maxlib
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  br label %132

; <label>:37                                      ; preds = %33
  %38 = load i32* @liberty_mark, align 4
  %39 = add nsw i32 %pos, %13
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %40
  store i32 %38, i32* %41, align 4
  br label %128

; <label>:42                                      ; preds = %20, %10
  %43 = add nsw i32 %pos, %13
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %44
  %46 = load i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = icmp eq i32 %47, %color
  br i1 %48, label %49, label %127

; <label>:49                                      ; preds = %42
  %50 = add nsw i32 %pos, %13
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %51
  %53 = load i32* %52, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %54
  %56 = getelementptr inbounds %struct.string_data* %55, i32 0, i32 7
  %57 = load i32* %56, align 4
  %58 = load i32* @string_mark, align 4
  %59 = icmp ne i32 %57, %58
  br i1 %59, label %60, label %127

; <label>:60                                      ; preds = %49
  %61 = add nsw i32 %pos, %13
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %62
  %64 = load i32* %63, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %65
  %67 = getelementptr inbounds %struct.string_data* %66, i32 0, i32 2
  %68 = load i32* %67, align 4
  br label %69

; <label>:69                                      ; preds = %111, %60
  %liberties.1 = phi i32 [ %liberties.0, %60 ], [ %liberties.2, %111 ]
  %pos2.0 = phi i32 [ %68, %60 ], [ %110, %111 ]
  br label %70

; <label>:70                                      ; preds = %105, %69
  %liberties.2 = phi i32 [ %liberties.1, %69 ], [ %liberties.3, %105 ]
  %l.0 = phi i32 [ 0, %69 ], [ %106, %105 ]
  %71 = icmp slt i32 %l.0, 4
  br i1 %71, label %72, label %107

; <label>:72                                      ; preds = %70
  %73 = sext i32 %l.0 to i64
  %74 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %73
  %75 = load i32* %74, align 4
  %76 = add nsw i32 %pos2.0, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %77
  %79 = load i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %82, label %104

; <label>:82                                      ; preds = %72
  %83 = add nsw i32 %pos2.0, %75
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %84
  %86 = load i32* %85, align 4
  %87 = load i32* @liberty_mark, align 4
  %88 = icmp ne i32 %86, %87
  br i1 %88, label %89, label %104

; <label>:89                                      ; preds = %82
  %90 = icmp ne i32* %libs, null
  br i1 %90, label %91, label %95

; <label>:91                                      ; preds = %89
  %92 = add nsw i32 %pos2.0, %75
  %93 = sext i32 %liberties.2 to i64
  %94 = getelementptr inbounds i32* %libs, i64 %93
  store i32 %92, i32* %94, align 4
  br label %95

; <label>:95                                      ; preds = %91, %89
  %96 = add nsw i32 %liberties.2, 1
  %97 = icmp eq i32 %96, %maxlib
  br i1 %97, label %98, label %99

; <label>:98                                      ; preds = %95
  br label %132

; <label>:99                                      ; preds = %95
  %100 = load i32* @liberty_mark, align 4
  %101 = add nsw i32 %pos2.0, %75
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %102
  store i32 %100, i32* %103, align 4
  br label %104

; <label>:104                                     ; preds = %99, %82, %72
  %liberties.3 = phi i32 [ %96, %99 ], [ %liberties.2, %82 ], [ %liberties.2, %72 ]
  br label %105

; <label>:105                                     ; preds = %104
  %106 = add nsw i32 %l.0, 1
  br label %70

; <label>:107                                     ; preds = %70
  %108 = sext i32 %pos2.0 to i64
  %109 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %108
  %110 = load i32* %109, align 4
  br label %111

; <label>:111                                     ; preds = %107
  %112 = sext i32 %64 to i64
  %113 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %112
  %114 = getelementptr inbounds %struct.string_data* %113, i32 0, i32 2
  %115 = load i32* %114, align 4
  %116 = icmp eq i32 %110, %115
  %117 = xor i1 %116, true
  br i1 %117, label %69, label %118

; <label>:118                                     ; preds = %111
  %119 = load i32* @string_mark, align 4
  %120 = add nsw i32 %pos, %13
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %121
  %123 = load i32* %122, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %124
  %126 = getelementptr inbounds %struct.string_data* %125, i32 0, i32 7
  store i32 %119, i32* %126, align 4
  br label %127

; <label>:127                                     ; preds = %118, %49, %42
  %liberties.4 = phi i32 [ %liberties.2, %118 ], [ %liberties.0, %49 ], [ %liberties.0, %42 ]
  br label %128

; <label>:128                                     ; preds = %127, %37
  %liberties.5 = phi i32 [ %34, %37 ], [ %liberties.4, %127 ]
  br label %129

; <label>:129                                     ; preds = %128
  %130 = add nsw i32 %k.0, 1
  br label %8

; <label>:131                                     ; preds = %8
  br label %132

; <label>:132                                     ; preds = %131, %98, %36
  %.0 = phi i32 [ %34, %36 ], [ %96, %98 ], [ %liberties.0, %131 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @accuratelib(i32 %pos, i32 %color, i32 %maxlib, i32* %libs) #0 {
  %captured = alloca [4 x i32], align 16
  %1 = sext i32 %pos to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %12

; <label>:7                                       ; preds = %0
  %8 = sdiv i32 %pos, 20
  %9 = sub nsw i32 %8, 1
  %10 = srem i32 %pos, 20
  %11 = sub nsw i32 %10, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1745, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %9, i32 %11)
  br label %12

; <label>:12                                      ; preds = %7, %6
  %13 = icmp eq i32 %color, 1
  br i1 %13, label %16, label %14

; <label>:14                                      ; preds = %12
  %15 = icmp eq i32 %color, 2
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %14, %12
  br label %22

; <label>:17                                      ; preds = %14
  %18 = sdiv i32 %pos, 20
  %19 = sub nsw i32 %18, 1
  %20 = srem i32 %pos, 20
  %21 = sub nsw i32 %20, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1746, i8* getelementptr inbounds ([16 x i8]* @.str28, i32 0, i32 0), i32 %19, i32 %21)
  br label %22

; <label>:22                                      ; preds = %17, %16
  %23 = icmp ne i32* %libs, null
  br i1 %23, label %29, label %24

; <label>:24                                      ; preds = %22
  %25 = call i32 @fastlib(i32 %pos, i32 %color, i32 0)
  %26 = icmp sge i32 %25, 0
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %24
  br label %495

; <label>:28                                      ; preds = %24
  br label %29

; <label>:29                                      ; preds = %28, %22
  %30 = load i32* @string_mark, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* @string_mark, align 4
  %32 = load i32* @liberty_mark, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* @liberty_mark, align 4
  %34 = load i32* @liberty_mark, align 4
  %35 = sext i32 %pos to i64
  %36 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %35
  store i32 %34, i32* %36, align 4
  br label %37

; <label>:37                                      ; preds = %288, %29
  %k.0 = phi i32 [ 0, %29 ], [ %289, %288 ]
  %liberties.0 = phi i32 [ 0, %29 ], [ %liberties.10, %288 ]
  %captures.0 = phi i32 [ 0, %29 ], [ %captures.3, %288 ]
  %38 = icmp slt i32 %k.0, 4
  br i1 %38, label %39, label %290

; <label>:39                                      ; preds = %37
  %40 = sext i32 %k.0 to i64
  %41 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %40
  %42 = load i32* %41, align 4
  %43 = add nsw i32 %pos, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %44
  %46 = load i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %68

; <label>:49                                      ; preds = %39
  %50 = sext i32 %43 to i64
  %51 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %50
  %52 = load i32* %51, align 4
  %53 = load i32* @liberty_mark, align 4
  %54 = icmp ne i32 %52, %53
  br i1 %54, label %55, label %68

; <label>:55                                      ; preds = %49
  %56 = icmp ne i32* %libs, null
  br i1 %56, label %57, label %60

; <label>:57                                      ; preds = %55
  %58 = sext i32 %liberties.0 to i64
  %59 = getelementptr inbounds i32* %libs, i64 %58
  store i32 %43, i32* %59, align 4
  br label %60

; <label>:60                                      ; preds = %57, %55
  %61 = add nsw i32 %liberties.0, 1
  %62 = icmp sge i32 %61, %maxlib
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %60
  br label %495

; <label>:64                                      ; preds = %60
  %65 = load i32* @liberty_mark, align 4
  %66 = sext i32 %43 to i64
  %67 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %66
  store i32 %65, i32* %67, align 4
  br label %287

; <label>:68                                      ; preds = %49, %39
  %69 = sext i32 %43 to i64
  %70 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %69
  %71 = load i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = icmp eq i32 %72, %color
  br i1 %73, label %74, label %265

; <label>:74                                      ; preds = %68
  %75 = sext i32 %43 to i64
  %76 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %75
  %77 = load i32* %76, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %78
  %80 = getelementptr inbounds %struct.string_data* %79, i32 0, i32 7
  %81 = load i32* %80, align 4
  %82 = load i32* @string_mark, align 4
  %83 = icmp ne i32 %81, %82
  br i1 %83, label %84, label %265

; <label>:84                                      ; preds = %74
  %85 = sext i32 %43 to i64
  %86 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %85
  %87 = load i32* %86, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %88
  %90 = getelementptr inbounds %struct.string_data* %89, i32 0, i32 3
  %91 = load i32* %90, align 4
  %92 = icmp sle i32 %91, 20
  br i1 %92, label %95, label %93

; <label>:93                                      ; preds = %84
  %94 = icmp sle i32 %maxlib, 19
  br i1 %94, label %95, label %133

; <label>:95                                      ; preds = %93, %84
  br label %96

; <label>:96                                      ; preds = %130, %95
  %l.0 = phi i32 [ 0, %95 ], [ %131, %130 ]
  %liberties.1 = phi i32 [ %liberties.0, %95 ], [ %liberties.2, %130 ]
  %97 = getelementptr inbounds %struct.string_data* %89, i32 0, i32 3
  %98 = load i32* %97, align 4
  %99 = icmp slt i32 %l.0, %98
  br i1 %99, label %100, label %132

; <label>:100                                     ; preds = %96
  %101 = sext i32 %l.0 to i64
  %102 = getelementptr inbounds %struct.string_data* %89, i32 0, i32 4
  %103 = getelementptr inbounds [20 x i32]* %102, i32 0, i64 %101
  %104 = load i32* %103, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %105
  %107 = load i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %129

; <label>:110                                     ; preds = %100
  %111 = sext i32 %104 to i64
  %112 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %111
  %113 = load i32* %112, align 4
  %114 = load i32* @liberty_mark, align 4
  %115 = icmp ne i32 %113, %114
  br i1 %115, label %116, label %129

; <label>:116                                     ; preds = %110
  %117 = icmp ne i32* %libs, null
  br i1 %117, label %118, label %121

; <label>:118                                     ; preds = %116
  %119 = sext i32 %liberties.1 to i64
  %120 = getelementptr inbounds i32* %libs, i64 %119
  store i32 %104, i32* %120, align 4
  br label %121

; <label>:121                                     ; preds = %118, %116
  %122 = add nsw i32 %liberties.1, 1
  %123 = icmp sge i32 %122, %maxlib
  br i1 %123, label %124, label %125

; <label>:124                                     ; preds = %121
  br label %495

; <label>:125                                     ; preds = %121
  %126 = load i32* @liberty_mark, align 4
  %127 = sext i32 %104 to i64
  %128 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %127
  store i32 %126, i32* %128, align 4
  br label %129

; <label>:129                                     ; preds = %125, %110, %100
  %liberties.2 = phi i32 [ %122, %125 ], [ %liberties.1, %110 ], [ %liberties.1, %100 ]
  br label %130

; <label>:130                                     ; preds = %129
  %131 = add nsw i32 %l.0, 1
  br label %96

; <label>:132                                     ; preds = %96
  br label %257

; <label>:133                                     ; preds = %93
  br label %134

; <label>:134                                     ; preds = %254, %133
  %liberties.3 = phi i32 [ %liberties.0, %133 ], [ %liberties.7, %254 ]
  %stone.0 = phi i32 [ %43, %133 ], [ %253, %254 ]
  %135 = add nsw i32 %stone.0, 20
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %136
  %138 = load i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %141, label %163

; <label>:141                                     ; preds = %134
  %142 = add nsw i32 %stone.0, 20
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %143
  %145 = load i32* %144, align 4
  %146 = load i32* @liberty_mark, align 4
  %147 = icmp ne i32 %145, %146
  br i1 %147, label %148, label %163

; <label>:148                                     ; preds = %141
  %149 = icmp ne i32* %libs, null
  br i1 %149, label %150, label %154

; <label>:150                                     ; preds = %148
  %151 = add nsw i32 %stone.0, 20
  %152 = sext i32 %liberties.3 to i64
  %153 = getelementptr inbounds i32* %libs, i64 %152
  store i32 %151, i32* %153, align 4
  br label %154

; <label>:154                                     ; preds = %150, %148
  %155 = add nsw i32 %liberties.3, 1
  %156 = icmp sge i32 %155, %maxlib
  br i1 %156, label %157, label %158

; <label>:157                                     ; preds = %154
  br label %495

; <label>:158                                     ; preds = %154
  %159 = load i32* @liberty_mark, align 4
  %160 = add nsw i32 %stone.0, 20
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %161
  store i32 %159, i32* %162, align 4
  br label %163

; <label>:163                                     ; preds = %158, %141, %134
  %liberties.4 = phi i32 [ %155, %158 ], [ %liberties.3, %141 ], [ %liberties.3, %134 ]
  %164 = sub nsw i32 %stone.0, 1
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %165
  %167 = load i8* %166, align 1
  %168 = zext i8 %167 to i32
  %169 = icmp eq i32 %168, 0
  br i1 %169, label %170, label %192

; <label>:170                                     ; preds = %163
  %171 = sub nsw i32 %stone.0, 1
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %172
  %174 = load i32* %173, align 4
  %175 = load i32* @liberty_mark, align 4
  %176 = icmp ne i32 %174, %175
  br i1 %176, label %177, label %192

; <label>:177                                     ; preds = %170
  %178 = icmp ne i32* %libs, null
  br i1 %178, label %179, label %183

; <label>:179                                     ; preds = %177
  %180 = sub nsw i32 %stone.0, 1
  %181 = sext i32 %liberties.4 to i64
  %182 = getelementptr inbounds i32* %libs, i64 %181
  store i32 %180, i32* %182, align 4
  br label %183

; <label>:183                                     ; preds = %179, %177
  %184 = add nsw i32 %liberties.4, 1
  %185 = icmp sge i32 %184, %maxlib
  br i1 %185, label %186, label %187

; <label>:186                                     ; preds = %183
  br label %495

; <label>:187                                     ; preds = %183
  %188 = load i32* @liberty_mark, align 4
  %189 = sub nsw i32 %stone.0, 1
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %190
  store i32 %188, i32* %191, align 4
  br label %192

; <label>:192                                     ; preds = %187, %170, %163
  %liberties.5 = phi i32 [ %184, %187 ], [ %liberties.4, %170 ], [ %liberties.4, %163 ]
  %193 = sub nsw i32 %stone.0, 20
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %194
  %196 = load i8* %195, align 1
  %197 = zext i8 %196 to i32
  %198 = icmp eq i32 %197, 0
  br i1 %198, label %199, label %221

; <label>:199                                     ; preds = %192
  %200 = sub nsw i32 %stone.0, 20
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %201
  %203 = load i32* %202, align 4
  %204 = load i32* @liberty_mark, align 4
  %205 = icmp ne i32 %203, %204
  br i1 %205, label %206, label %221

; <label>:206                                     ; preds = %199
  %207 = icmp ne i32* %libs, null
  br i1 %207, label %208, label %212

; <label>:208                                     ; preds = %206
  %209 = sub nsw i32 %stone.0, 20
  %210 = sext i32 %liberties.5 to i64
  %211 = getelementptr inbounds i32* %libs, i64 %210
  store i32 %209, i32* %211, align 4
  br label %212

; <label>:212                                     ; preds = %208, %206
  %213 = add nsw i32 %liberties.5, 1
  %214 = icmp sge i32 %213, %maxlib
  br i1 %214, label %215, label %216

; <label>:215                                     ; preds = %212
  br label %495

; <label>:216                                     ; preds = %212
  %217 = load i32* @liberty_mark, align 4
  %218 = sub nsw i32 %stone.0, 20
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %219
  store i32 %217, i32* %220, align 4
  br label %221

; <label>:221                                     ; preds = %216, %199, %192
  %liberties.6 = phi i32 [ %213, %216 ], [ %liberties.5, %199 ], [ %liberties.5, %192 ]
  %222 = add nsw i32 %stone.0, 1
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %223
  %225 = load i8* %224, align 1
  %226 = zext i8 %225 to i32
  %227 = icmp eq i32 %226, 0
  br i1 %227, label %228, label %250

; <label>:228                                     ; preds = %221
  %229 = add nsw i32 %stone.0, 1
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %230
  %232 = load i32* %231, align 4
  %233 = load i32* @liberty_mark, align 4
  %234 = icmp ne i32 %232, %233
  br i1 %234, label %235, label %250

; <label>:235                                     ; preds = %228
  %236 = icmp ne i32* %libs, null
  br i1 %236, label %237, label %241

; <label>:237                                     ; preds = %235
  %238 = add nsw i32 %stone.0, 1
  %239 = sext i32 %liberties.6 to i64
  %240 = getelementptr inbounds i32* %libs, i64 %239
  store i32 %238, i32* %240, align 4
  br label %241

; <label>:241                                     ; preds = %237, %235
  %242 = add nsw i32 %liberties.6, 1
  %243 = icmp sge i32 %242, %maxlib
  br i1 %243, label %244, label %245

; <label>:244                                     ; preds = %241
  br label %495

; <label>:245                                     ; preds = %241
  %246 = load i32* @liberty_mark, align 4
  %247 = add nsw i32 %stone.0, 1
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %248
  store i32 %246, i32* %249, align 4
  br label %250

; <label>:250                                     ; preds = %245, %228, %221
  %liberties.7 = phi i32 [ %242, %245 ], [ %liberties.6, %228 ], [ %liberties.6, %221 ]
  %251 = sext i32 %stone.0 to i64
  %252 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %251
  %253 = load i32* %252, align 4
  br label %254

; <label>:254                                     ; preds = %250
  %255 = icmp ne i32 %253, %43
  br i1 %255, label %134, label %256

; <label>:256                                     ; preds = %254
  br label %257

; <label>:257                                     ; preds = %256, %132
  %liberties.8 = phi i32 [ %liberties.1, %132 ], [ %liberties.7, %256 ]
  %258 = load i32* @string_mark, align 4
  %259 = sext i32 %43 to i64
  %260 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %259
  %261 = load i32* %260, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %262
  %264 = getelementptr inbounds %struct.string_data* %263, i32 0, i32 7
  store i32 %258, i32* %264, align 4
  br label %286

; <label>:265                                     ; preds = %74, %68
  %266 = sext i32 %43 to i64
  %267 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %266
  %268 = load i8* %267, align 1
  %269 = zext i8 %268 to i32
  %270 = sub nsw i32 3, %color
  %271 = icmp eq i32 %269, %270
  br i1 %271, label %272, label %285

; <label>:272                                     ; preds = %265
  %273 = sext i32 %43 to i64
  %274 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %273
  %275 = load i32* %274, align 4
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %276
  %278 = getelementptr inbounds %struct.string_data* %277, i32 0, i32 3
  %279 = load i32* %278, align 4
  %280 = icmp eq i32 %279, 1
  br i1 %280, label %281, label %285

; <label>:281                                     ; preds = %272
  %282 = add nsw i32 %captures.0, 1
  %283 = sext i32 %captures.0 to i64
  %284 = getelementptr inbounds [4 x i32]* %captured, i32 0, i64 %283
  store i32 %43, i32* %284, align 4
  br label %285

; <label>:285                                     ; preds = %281, %272, %265
  %captures.1 = phi i32 [ %282, %281 ], [ %captures.0, %272 ], [ %captures.0, %265 ]
  br label %286

; <label>:286                                     ; preds = %285, %257
  %liberties.9 = phi i32 [ %liberties.8, %257 ], [ %liberties.0, %285 ]
  %captures.2 = phi i32 [ %captures.0, %257 ], [ %captures.1, %285 ]
  br label %287

; <label>:287                                     ; preds = %286, %64
  %liberties.10 = phi i32 [ %61, %64 ], [ %liberties.9, %286 ]
  %captures.3 = phi i32 [ %captures.0, %64 ], [ %captures.2, %286 ]
  br label %288

; <label>:288                                     ; preds = %287
  %289 = add nsw i32 %k.0, 1
  br label %37

; <label>:290                                     ; preds = %37
  br label %291

; <label>:291                                     ; preds = %492, %290
  %k.1 = phi i32 [ 0, %290 ], [ %493, %492 ]
  %liberties.11 = phi i32 [ %liberties.0, %290 ], [ %liberties.15, %492 ]
  %292 = icmp slt i32 %k.1, %captures.0
  br i1 %292, label %293, label %494

; <label>:293                                     ; preds = %291
  %294 = sext i32 %k.1 to i64
  %295 = getelementptr inbounds [4 x i32]* %captured, i32 0, i64 %294
  %296 = load i32* %295, align 4
  %297 = add nsw i32 %296, 20
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %298
  %300 = load i8* %299, align 1
  %301 = zext i8 %300 to i32
  %302 = icmp eq i32 %301, %color
  br i1 %302, label %303, label %314

; <label>:303                                     ; preds = %293
  %304 = add nsw i32 %296, 20
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %305
  %307 = load i32* %306, align 4
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %308
  %310 = getelementptr inbounds %struct.string_data* %309, i32 0, i32 7
  %311 = load i32* %310, align 4
  %312 = load i32* @string_mark, align 4
  %313 = icmp eq i32 %311, %312
  br i1 %313, label %378, label %314

; <label>:314                                     ; preds = %303, %293
  %315 = sub nsw i32 %296, 1
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %316
  %318 = load i8* %317, align 1
  %319 = zext i8 %318 to i32
  %320 = icmp eq i32 %319, %color
  br i1 %320, label %321, label %332

; <label>:321                                     ; preds = %314
  %322 = sub nsw i32 %296, 1
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %323
  %325 = load i32* %324, align 4
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %326
  %328 = getelementptr inbounds %struct.string_data* %327, i32 0, i32 7
  %329 = load i32* %328, align 4
  %330 = load i32* @string_mark, align 4
  %331 = icmp eq i32 %329, %330
  br i1 %331, label %378, label %332

; <label>:332                                     ; preds = %321, %314
  %333 = sub nsw i32 %296, 20
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %334
  %336 = load i8* %335, align 1
  %337 = zext i8 %336 to i32
  %338 = icmp eq i32 %337, %color
  br i1 %338, label %339, label %350

; <label>:339                                     ; preds = %332
  %340 = sub nsw i32 %296, 20
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %341
  %343 = load i32* %342, align 4
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %344
  %346 = getelementptr inbounds %struct.string_data* %345, i32 0, i32 7
  %347 = load i32* %346, align 4
  %348 = load i32* @string_mark, align 4
  %349 = icmp eq i32 %347, %348
  br i1 %349, label %378, label %350

; <label>:350                                     ; preds = %339, %332
  %351 = add nsw i32 %296, 1
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %352
  %354 = load i8* %353, align 1
  %355 = zext i8 %354 to i32
  %356 = icmp eq i32 %355, %color
  br i1 %356, label %357, label %368

; <label>:357                                     ; preds = %350
  %358 = add nsw i32 %296, 1
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %359
  %361 = load i32* %360, align 4
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %362
  %364 = getelementptr inbounds %struct.string_data* %363, i32 0, i32 7
  %365 = load i32* %364, align 4
  %366 = load i32* @string_mark, align 4
  %367 = icmp eq i32 %365, %366
  br i1 %367, label %378, label %368

; <label>:368                                     ; preds = %357, %350
  %369 = icmp ne i32* %libs, null
  br i1 %369, label %370, label %373

; <label>:370                                     ; preds = %368
  %371 = sext i32 %liberties.11 to i64
  %372 = getelementptr inbounds i32* %libs, i64 %371
  store i32 %296, i32* %372, align 4
  br label %373

; <label>:373                                     ; preds = %370, %368
  %374 = add nsw i32 %liberties.11, 1
  %375 = icmp sge i32 %374, %maxlib
  br i1 %375, label %376, label %377

; <label>:376                                     ; preds = %373
  br label %495

; <label>:377                                     ; preds = %373
  br label %378

; <label>:378                                     ; preds = %377, %357, %339, %321, %303
  %liberties.12 = phi i32 [ %liberties.11, %303 ], [ %liberties.11, %321 ], [ %liberties.11, %339 ], [ %liberties.11, %357 ], [ %374, %377 ]
  br label %379

; <label>:379                                     ; preds = %394, %378
  %l.1 = phi i32 [ 0, %378 ], [ %395, %394 ]
  %380 = icmp slt i32 %l.1, %k.1
  br i1 %380, label %381, label %396

; <label>:381                                     ; preds = %379
  %382 = sext i32 %l.1 to i64
  %383 = getelementptr inbounds [4 x i32]* %captured, i32 0, i64 %382
  %384 = load i32* %383, align 4
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %385
  %387 = load i32* %386, align 4
  %388 = sext i32 %296 to i64
  %389 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %388
  %390 = load i32* %389, align 4
  %391 = icmp eq i32 %387, %390
  br i1 %391, label %392, label %393

; <label>:392                                     ; preds = %381
  br label %396

; <label>:393                                     ; preds = %381
  br label %394

; <label>:394                                     ; preds = %393
  %395 = add nsw i32 %l.1, 1
  br label %379

; <label>:396                                     ; preds = %392, %379
  %397 = icmp eq i32 %l.1, %k.1
  br i1 %397, label %398, label %491

; <label>:398                                     ; preds = %396
  br label %399

; <label>:399                                     ; preds = %485, %398
  %liberties.13 = phi i32 [ %liberties.12, %398 ], [ %liberties.14, %485 ]
  %lib.0 = phi i32 [ %296, %398 ], [ %484, %485 ]
  %400 = add nsw i32 %lib.0, 20
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %401
  %403 = load i8* %402, align 1
  %404 = zext i8 %403 to i32
  %405 = icmp eq i32 %404, %color
  br i1 %405, label %406, label %417

; <label>:406                                     ; preds = %399
  %407 = add nsw i32 %lib.0, 20
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %408
  %410 = load i32* %409, align 4
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %411
  %413 = getelementptr inbounds %struct.string_data* %412, i32 0, i32 7
  %414 = load i32* %413, align 4
  %415 = load i32* @string_mark, align 4
  %416 = icmp eq i32 %414, %415
  br i1 %416, label %471, label %417

; <label>:417                                     ; preds = %406, %399
  %418 = sub nsw i32 %lib.0, 1
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %419
  %421 = load i8* %420, align 1
  %422 = zext i8 %421 to i32
  %423 = icmp eq i32 %422, %color
  br i1 %423, label %424, label %435

; <label>:424                                     ; preds = %417
  %425 = sub nsw i32 %lib.0, 1
  %426 = sext i32 %425 to i64
  %427 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %426
  %428 = load i32* %427, align 4
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %429
  %431 = getelementptr inbounds %struct.string_data* %430, i32 0, i32 7
  %432 = load i32* %431, align 4
  %433 = load i32* @string_mark, align 4
  %434 = icmp eq i32 %432, %433
  br i1 %434, label %471, label %435

; <label>:435                                     ; preds = %424, %417
  %436 = sub nsw i32 %lib.0, 20
  %437 = sext i32 %436 to i64
  %438 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %437
  %439 = load i8* %438, align 1
  %440 = zext i8 %439 to i32
  %441 = icmp eq i32 %440, %color
  br i1 %441, label %442, label %453

; <label>:442                                     ; preds = %435
  %443 = sub nsw i32 %lib.0, 20
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %444
  %446 = load i32* %445, align 4
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %447
  %449 = getelementptr inbounds %struct.string_data* %448, i32 0, i32 7
  %450 = load i32* %449, align 4
  %451 = load i32* @string_mark, align 4
  %452 = icmp eq i32 %450, %451
  br i1 %452, label %471, label %453

; <label>:453                                     ; preds = %442, %435
  %454 = add nsw i32 %lib.0, 1
  %455 = sext i32 %454 to i64
  %456 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %455
  %457 = load i8* %456, align 1
  %458 = zext i8 %457 to i32
  %459 = icmp eq i32 %458, %color
  br i1 %459, label %460, label %481

; <label>:460                                     ; preds = %453
  %461 = add nsw i32 %lib.0, 1
  %462 = sext i32 %461 to i64
  %463 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %462
  %464 = load i32* %463, align 4
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %465
  %467 = getelementptr inbounds %struct.string_data* %466, i32 0, i32 7
  %468 = load i32* %467, align 4
  %469 = load i32* @string_mark, align 4
  %470 = icmp eq i32 %468, %469
  br i1 %470, label %471, label %481

; <label>:471                                     ; preds = %460, %442, %424, %406
  %472 = icmp ne i32* %libs, null
  br i1 %472, label %473, label %476

; <label>:473                                     ; preds = %471
  %474 = sext i32 %liberties.13 to i64
  %475 = getelementptr inbounds i32* %libs, i64 %474
  store i32 %lib.0, i32* %475, align 4
  br label %476

; <label>:476                                     ; preds = %473, %471
  %477 = add nsw i32 %liberties.13, 1
  %478 = icmp sge i32 %477, %maxlib
  br i1 %478, label %479, label %480

; <label>:479                                     ; preds = %476
  br label %495

; <label>:480                                     ; preds = %476
  br label %481

; <label>:481                                     ; preds = %480, %460, %453
  %liberties.14 = phi i32 [ %477, %480 ], [ %liberties.13, %460 ], [ %liberties.13, %453 ]
  %482 = sext i32 %lib.0 to i64
  %483 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %482
  %484 = load i32* %483, align 4
  br label %485

; <label>:485                                     ; preds = %481
  %486 = sext i32 %k.1 to i64
  %487 = getelementptr inbounds [4 x i32]* %captured, i32 0, i64 %486
  %488 = load i32* %487, align 4
  %489 = icmp ne i32 %484, %488
  br i1 %489, label %399, label %490

; <label>:490                                     ; preds = %485
  br label %491

; <label>:491                                     ; preds = %490, %396
  %liberties.15 = phi i32 [ %liberties.14, %490 ], [ %liberties.12, %396 ]
  br label %492

; <label>:492                                     ; preds = %491
  %493 = add nsw i32 %k.1, 1
  br label %291

; <label>:494                                     ; preds = %291
  br label %495

; <label>:495                                     ; preds = %494, %479, %376, %244, %215, %186, %157, %124, %63, %27
  %.0 = phi i32 [ %61, %63 ], [ %122, %124 ], [ %155, %157 ], [ %184, %186 ], [ %213, %215 ], [ %242, %244 ], [ %477, %479 ], [ %374, %376 ], [ %liberties.11, %494 ], [ %25, %27 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @find_common_libs(i32 %str1, i32 %str2, i32 %maxlib, i32* %libs) #0 {
  %all_libs1 = alloca [241 x i32], align 16
  %1 = icmp ult i32 %str1, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %str1 to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %str1, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %str1, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1981, i8* getelementptr inbounds ([16 x i8]* @.str29, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = icmp ult i32 %str2, 421
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %14
  %17 = sext i32 %str2 to i64
  %18 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %17
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %16
  br label %28

; <label>:23                                      ; preds = %16, %14
  %24 = sdiv i32 %str2, 20
  %25 = sub nsw i32 %24, 1
  %26 = srem i32 %str2, 20
  %27 = sub nsw i32 %26, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1982, i8* getelementptr inbounds ([16 x i8]* @.str30, i32 0, i32 0), i32 %25, i32 %27)
  br label %28

; <label>:28                                      ; preds = %23, %22
  %29 = sext i32 %str1 to i64
  %30 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %29
  %31 = load i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %40, label %34

; <label>:34                                      ; preds = %28
  %35 = sext i32 %str1 to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp eq i32 %38, 2
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %34, %28
  br label %46

; <label>:41                                      ; preds = %34
  %42 = sdiv i32 %str1, 20
  %43 = sub nsw i32 %42, 1
  %44 = srem i32 %str1, 20
  %45 = sub nsw i32 %44, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1983, i8* getelementptr inbounds ([22 x i8]* @.str31, i32 0, i32 0), i32 %43, i32 %45)
  br label %46

; <label>:46                                      ; preds = %41, %40
  %47 = sext i32 %str2 to i64
  %48 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %47
  %49 = load i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %50, 1
  br i1 %51, label %58, label %52

; <label>:52                                      ; preds = %46
  %53 = sext i32 %str2 to i64
  %54 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %53
  %55 = load i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = icmp eq i32 %56, 2
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %52, %46
  br label %64

; <label>:59                                      ; preds = %52
  %60 = sdiv i32 %str2, 20
  %61 = sub nsw i32 %60, 1
  %62 = srem i32 %str2, 20
  %63 = sub nsw i32 %62, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1984, i8* getelementptr inbounds ([22 x i8]* @.str32, i32 0, i32 0), i32 %61, i32 %63)
  br label %64

; <label>:64                                      ; preds = %59, %58
  %65 = icmp ne i32* %libs, null
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %64
  br label %72

; <label>:67                                      ; preds = %64
  %68 = sdiv i32 %str1, 20
  %69 = sub nsw i32 %68, 1
  %70 = srem i32 %str1, 20
  %71 = sub nsw i32 %70, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1985, i8* getelementptr inbounds ([13 x i8]* @.str27, i32 0, i32 0), i32 %69, i32 %71)
  br label %72

; <label>:72                                      ; preds = %67, %66
  %73 = sext i32 %str1 to i64
  %74 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %73
  %75 = load i32* %74, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %76
  %78 = getelementptr inbounds %struct.string_data* %77, i32 0, i32 3
  %79 = load i32* %78, align 4
  %80 = sext i32 %str2 to i64
  %81 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %80
  %82 = load i32* %81, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %83
  %85 = getelementptr inbounds %struct.string_data* %84, i32 0, i32 3
  %86 = load i32* %85, align 4
  %87 = icmp sgt i32 %79, %86
  br i1 %87, label %88, label %96

; <label>:88                                      ; preds = %72
  %89 = sext i32 %str2 to i64
  %90 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %89
  %91 = load i32* %90, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %92
  %94 = getelementptr inbounds %struct.string_data* %93, i32 0, i32 3
  %95 = load i32* %94, align 4
  br label %96

; <label>:96                                      ; preds = %88, %72
  %liberties1.0 = phi i32 [ %95, %88 ], [ %79, %72 ]
  %n.0 = phi i32 [ %91, %88 ], [ %75, %72 ]
  %.02 = phi i32 [ %str1, %88 ], [ %str2, %72 ]
  %.01 = phi i32 [ %str2, %88 ], [ %str1, %72 ]
  %97 = icmp sle i32 %liberties1.0, 20
  br i1 %97, label %98, label %165

; <label>:98                                      ; preds = %96
  %99 = sext i32 %n.0 to i64
  %100 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %99
  %101 = getelementptr inbounds %struct.string_data* %100, i32 0, i32 4
  %102 = getelementptr inbounds [20 x i32]* %101, i32 0, i32 0
  %103 = sext i32 %.02 to i64
  %104 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %103
  %105 = load i32* %104, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %106
  %108 = getelementptr inbounds %struct.string_data* %107, i32 0, i32 3
  %109 = load i32* %108, align 4
  %110 = icmp sle i32 %109, 20
  br i1 %110, label %111, label %164

; <label>:111                                     ; preds = %98
  %112 = load i32* @liberty_mark, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* @liberty_mark, align 4
  br label %114

; <label>:114                                     ; preds = %123, %111
  %k.0 = phi i32 [ 0, %111 ], [ %124, %123 ]
  %115 = icmp slt i32 %k.0, %liberties1.0
  br i1 %115, label %116, label %125

; <label>:116                                     ; preds = %114
  %117 = load i32* @liberty_mark, align 4
  %118 = sext i32 %k.0 to i64
  %119 = getelementptr inbounds i32* %102, i64 %118
  %120 = load i32* %119, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %121
  store i32 %117, i32* %122, align 4
  br label %123

; <label>:123                                     ; preds = %116
  %124 = add nsw i32 %k.0, 1
  br label %114

; <label>:125                                     ; preds = %114
  %126 = sext i32 %105 to i64
  %127 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %126
  %128 = getelementptr inbounds %struct.string_data* %127, i32 0, i32 4
  %129 = getelementptr inbounds [20 x i32]* %128, i32 0, i32 0
  br label %130

; <label>:130                                     ; preds = %161, %125
  %commonlibs.0 = phi i32 [ 0, %125 ], [ %commonlibs.1, %161 ]
  %k.1 = phi i32 [ 0, %125 ], [ %162, %161 ]
  %131 = icmp slt i32 %k.1, %109
  br i1 %131, label %132, label %163

; <label>:132                                     ; preds = %130
  %133 = sext i32 %k.1 to i64
  %134 = getelementptr inbounds i32* %129, i64 %133
  %135 = load i32* %134, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %136
  %138 = load i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %141, label %150

; <label>:141                                     ; preds = %132
  %142 = sext i32 %k.1 to i64
  %143 = getelementptr inbounds i32* %129, i64 %142
  %144 = load i32* %143, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %145
  %147 = load i32* %146, align 4
  %148 = load i32* @liberty_mark, align 4
  %149 = icmp ne i32 %147, %148
  br i1 %149, label %160, label %150

; <label>:150                                     ; preds = %141, %132
  %151 = icmp slt i32 %commonlibs.0, %maxlib
  br i1 %151, label %152, label %158

; <label>:152                                     ; preds = %150
  %153 = sext i32 %k.1 to i64
  %154 = getelementptr inbounds i32* %129, i64 %153
  %155 = load i32* %154, align 4
  %156 = sext i32 %commonlibs.0 to i64
  %157 = getelementptr inbounds i32* %libs, i64 %156
  store i32 %155, i32* %157, align 4
  br label %158

; <label>:158                                     ; preds = %152, %150
  %159 = add nsw i32 %commonlibs.0, 1
  br label %160

; <label>:160                                     ; preds = %158, %141
  %commonlibs.1 = phi i32 [ %commonlibs.0, %141 ], [ %159, %158 ]
  br label %161

; <label>:161                                     ; preds = %160
  %162 = add nsw i32 %k.1, 1
  br label %130

; <label>:163                                     ; preds = %130
  br label %290

; <label>:164                                     ; preds = %98
  br label %169

; <label>:165                                     ; preds = %96
  %166 = getelementptr inbounds [241 x i32]* %all_libs1, i32 0, i32 0
  %167 = call i32 @findlib(i32 %.01, i32 241, i32* %166)
  %168 = getelementptr inbounds [241 x i32]* %all_libs1, i32 0, i32 0
  br label %169

; <label>:169                                     ; preds = %165, %164
  %libs1.0 = phi i32* [ %102, %164 ], [ %168, %165 ]
  br label %170

; <label>:170                                     ; preds = %287, %169
  %commonlibs.2 = phi i32 [ 0, %169 ], [ %commonlibs.3, %287 ]
  %k.2 = phi i32 [ 0, %169 ], [ %288, %287 ]
  %171 = icmp slt i32 %k.2, %liberties1.0
  br i1 %171, label %172, label %289

; <label>:172                                     ; preds = %170
  %173 = sext i32 %k.2 to i64
  %174 = getelementptr inbounds i32* %libs1.0, i64 %173
  %175 = load i32* %174, align 4
  %176 = add nsw i32 %175, 20
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %177
  %179 = load i8* %178, align 1
  %180 = zext i8 %179 to i32
  %181 = sext i32 %.02 to i64
  %182 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %181
  %183 = load i8* %182, align 1
  %184 = zext i8 %183 to i32
  %185 = icmp eq i32 %180, %184
  br i1 %185, label %186, label %198

; <label>:186                                     ; preds = %172
  %187 = sext i32 %k.2 to i64
  %188 = getelementptr inbounds i32* %libs1.0, i64 %187
  %189 = load i32* %188, align 4
  %190 = add nsw i32 %189, 20
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %191
  %193 = load i32* %192, align 4
  %194 = sext i32 %.02 to i64
  %195 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %194
  %196 = load i32* %195, align 4
  %197 = icmp eq i32 %193, %196
  br i1 %197, label %276, label %198

; <label>:198                                     ; preds = %186, %172
  %199 = sext i32 %k.2 to i64
  %200 = getelementptr inbounds i32* %libs1.0, i64 %199
  %201 = load i32* %200, align 4
  %202 = sub nsw i32 %201, 1
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %203
  %205 = load i8* %204, align 1
  %206 = zext i8 %205 to i32
  %207 = sext i32 %.02 to i64
  %208 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %207
  %209 = load i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = icmp eq i32 %206, %210
  br i1 %211, label %212, label %224

; <label>:212                                     ; preds = %198
  %213 = sext i32 %k.2 to i64
  %214 = getelementptr inbounds i32* %libs1.0, i64 %213
  %215 = load i32* %214, align 4
  %216 = sub nsw i32 %215, 1
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %217
  %219 = load i32* %218, align 4
  %220 = sext i32 %.02 to i64
  %221 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %220
  %222 = load i32* %221, align 4
  %223 = icmp eq i32 %219, %222
  br i1 %223, label %276, label %224

; <label>:224                                     ; preds = %212, %198
  %225 = sext i32 %k.2 to i64
  %226 = getelementptr inbounds i32* %libs1.0, i64 %225
  %227 = load i32* %226, align 4
  %228 = sub nsw i32 %227, 20
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %229
  %231 = load i8* %230, align 1
  %232 = zext i8 %231 to i32
  %233 = sext i32 %.02 to i64
  %234 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %233
  %235 = load i8* %234, align 1
  %236 = zext i8 %235 to i32
  %237 = icmp eq i32 %232, %236
  br i1 %237, label %238, label %250

; <label>:238                                     ; preds = %224
  %239 = sext i32 %k.2 to i64
  %240 = getelementptr inbounds i32* %libs1.0, i64 %239
  %241 = load i32* %240, align 4
  %242 = sub nsw i32 %241, 20
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %243
  %245 = load i32* %244, align 4
  %246 = sext i32 %.02 to i64
  %247 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %246
  %248 = load i32* %247, align 4
  %249 = icmp eq i32 %245, %248
  br i1 %249, label %276, label %250

; <label>:250                                     ; preds = %238, %224
  %251 = sext i32 %k.2 to i64
  %252 = getelementptr inbounds i32* %libs1.0, i64 %251
  %253 = load i32* %252, align 4
  %254 = add nsw i32 %253, 1
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %255
  %257 = load i8* %256, align 1
  %258 = zext i8 %257 to i32
  %259 = sext i32 %.02 to i64
  %260 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %259
  %261 = load i8* %260, align 1
  %262 = zext i8 %261 to i32
  %263 = icmp eq i32 %258, %262
  br i1 %263, label %264, label %286

; <label>:264                                     ; preds = %250
  %265 = sext i32 %k.2 to i64
  %266 = getelementptr inbounds i32* %libs1.0, i64 %265
  %267 = load i32* %266, align 4
  %268 = add nsw i32 %267, 1
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %269
  %271 = load i32* %270, align 4
  %272 = sext i32 %.02 to i64
  %273 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %272
  %274 = load i32* %273, align 4
  %275 = icmp eq i32 %271, %274
  br i1 %275, label %276, label %286

; <label>:276                                     ; preds = %264, %238, %212, %186
  %277 = icmp slt i32 %commonlibs.2, %maxlib
  br i1 %277, label %278, label %284

; <label>:278                                     ; preds = %276
  %279 = sext i32 %k.2 to i64
  %280 = getelementptr inbounds i32* %libs1.0, i64 %279
  %281 = load i32* %280, align 4
  %282 = sext i32 %commonlibs.2 to i64
  %283 = getelementptr inbounds i32* %libs, i64 %282
  store i32 %281, i32* %283, align 4
  br label %284

; <label>:284                                     ; preds = %278, %276
  %285 = add nsw i32 %commonlibs.2, 1
  br label %286

; <label>:286                                     ; preds = %284, %264, %250
  %commonlibs.3 = phi i32 [ %285, %284 ], [ %commonlibs.2, %264 ], [ %commonlibs.2, %250 ]
  br label %287

; <label>:287                                     ; preds = %286
  %288 = add nsw i32 %k.2, 1
  br label %170

; <label>:289                                     ; preds = %170
  br label %290

; <label>:290                                     ; preds = %289, %163
  %.0 = phi i32 [ %commonlibs.0, %163 ], [ %commonlibs.2, %289 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @have_common_lib(i32 %str1, i32 %str2, i32* %lib) #0 {
  %all_libs1 = alloca [241 x i32], align 16
  %1 = icmp ult i32 %str1, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %str1 to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %str1, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %str1, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2049, i8* getelementptr inbounds ([16 x i8]* @.str29, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = icmp ult i32 %str2, 421
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %14
  %17 = sext i32 %str2 to i64
  %18 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %17
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %16
  br label %28

; <label>:23                                      ; preds = %16, %14
  %24 = sdiv i32 %str2, 20
  %25 = sub nsw i32 %24, 1
  %26 = srem i32 %str2, 20
  %27 = sub nsw i32 %26, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2050, i8* getelementptr inbounds ([16 x i8]* @.str30, i32 0, i32 0), i32 %25, i32 %27)
  br label %28

; <label>:28                                      ; preds = %23, %22
  %29 = sext i32 %str1 to i64
  %30 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %29
  %31 = load i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %40, label %34

; <label>:34                                      ; preds = %28
  %35 = sext i32 %str1 to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp eq i32 %38, 2
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %34, %28
  br label %46

; <label>:41                                      ; preds = %34
  %42 = sdiv i32 %str1, 20
  %43 = sub nsw i32 %42, 1
  %44 = srem i32 %str1, 20
  %45 = sub nsw i32 %44, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2051, i8* getelementptr inbounds ([22 x i8]* @.str31, i32 0, i32 0), i32 %43, i32 %45)
  br label %46

; <label>:46                                      ; preds = %41, %40
  %47 = sext i32 %str2 to i64
  %48 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %47
  %49 = load i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %50, 1
  br i1 %51, label %58, label %52

; <label>:52                                      ; preds = %46
  %53 = sext i32 %str2 to i64
  %54 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %53
  %55 = load i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = icmp eq i32 %56, 2
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %52, %46
  br label %64

; <label>:59                                      ; preds = %52
  %60 = sdiv i32 %str2, 20
  %61 = sub nsw i32 %60, 1
  %62 = srem i32 %str2, 20
  %63 = sub nsw i32 %62, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2052, i8* getelementptr inbounds ([22 x i8]* @.str32, i32 0, i32 0), i32 %61, i32 %63)
  br label %64

; <label>:64                                      ; preds = %59, %58
  %65 = sext i32 %str1 to i64
  %66 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %68
  %70 = getelementptr inbounds %struct.string_data* %69, i32 0, i32 3
  %71 = load i32* %70, align 4
  %72 = sext i32 %str2 to i64
  %73 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %72
  %74 = load i32* %73, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %75
  %77 = getelementptr inbounds %struct.string_data* %76, i32 0, i32 3
  %78 = load i32* %77, align 4
  %79 = icmp sgt i32 %71, %78
  br i1 %79, label %80, label %88

; <label>:80                                      ; preds = %64
  %81 = sext i32 %str2 to i64
  %82 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %81
  %83 = load i32* %82, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %84
  %86 = getelementptr inbounds %struct.string_data* %85, i32 0, i32 3
  %87 = load i32* %86, align 4
  br label %88

; <label>:88                                      ; preds = %80, %64
  %liberties1.0 = phi i32 [ %87, %80 ], [ %71, %64 ]
  %n.0 = phi i32 [ %83, %80 ], [ %67, %64 ]
  %.02 = phi i32 [ %str1, %80 ], [ %str2, %64 ]
  %.01 = phi i32 [ %str2, %80 ], [ %str1, %64 ]
  %89 = icmp sle i32 %liberties1.0, 20
  br i1 %89, label %90, label %95

; <label>:90                                      ; preds = %88
  %91 = sext i32 %n.0 to i64
  %92 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %91
  %93 = getelementptr inbounds %struct.string_data* %92, i32 0, i32 4
  %94 = getelementptr inbounds [20 x i32]* %93, i32 0, i32 0
  br label %99

; <label>:95                                      ; preds = %88
  %96 = getelementptr inbounds [241 x i32]* %all_libs1, i32 0, i32 0
  %97 = call i32 @findlib(i32 %.01, i32 241, i32* %96)
  %98 = getelementptr inbounds [241 x i32]* %all_libs1, i32 0, i32 0
  br label %99

; <label>:99                                      ; preds = %95, %90
  %libs1.0 = phi i32* [ %94, %90 ], [ %98, %95 ]
  br label %100

; <label>:100                                     ; preds = %214, %99
  %k.0 = phi i32 [ 0, %99 ], [ %215, %214 ]
  %101 = icmp slt i32 %k.0, %liberties1.0
  br i1 %101, label %102, label %216

; <label>:102                                     ; preds = %100
  %103 = sext i32 %k.0 to i64
  %104 = getelementptr inbounds i32* %libs1.0, i64 %103
  %105 = load i32* %104, align 4
  %106 = add nsw i32 %105, 20
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %107
  %109 = load i8* %108, align 1
  %110 = zext i8 %109 to i32
  %111 = sext i32 %.02 to i64
  %112 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %111
  %113 = load i8* %112, align 1
  %114 = zext i8 %113 to i32
  %115 = icmp eq i32 %110, %114
  br i1 %115, label %116, label %128

; <label>:116                                     ; preds = %102
  %117 = sext i32 %k.0 to i64
  %118 = getelementptr inbounds i32* %libs1.0, i64 %117
  %119 = load i32* %118, align 4
  %120 = add nsw i32 %119, 20
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %121
  %123 = load i32* %122, align 4
  %124 = sext i32 %.02 to i64
  %125 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %124
  %126 = load i32* %125, align 4
  %127 = icmp eq i32 %123, %126
  br i1 %127, label %206, label %128

; <label>:128                                     ; preds = %116, %102
  %129 = sext i32 %k.0 to i64
  %130 = getelementptr inbounds i32* %libs1.0, i64 %129
  %131 = load i32* %130, align 4
  %132 = sub nsw i32 %131, 1
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %133
  %135 = load i8* %134, align 1
  %136 = zext i8 %135 to i32
  %137 = sext i32 %.02 to i64
  %138 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %137
  %139 = load i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = icmp eq i32 %136, %140
  br i1 %141, label %142, label %154

; <label>:142                                     ; preds = %128
  %143 = sext i32 %k.0 to i64
  %144 = getelementptr inbounds i32* %libs1.0, i64 %143
  %145 = load i32* %144, align 4
  %146 = sub nsw i32 %145, 1
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %147
  %149 = load i32* %148, align 4
  %150 = sext i32 %.02 to i64
  %151 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %150
  %152 = load i32* %151, align 4
  %153 = icmp eq i32 %149, %152
  br i1 %153, label %206, label %154

; <label>:154                                     ; preds = %142, %128
  %155 = sext i32 %k.0 to i64
  %156 = getelementptr inbounds i32* %libs1.0, i64 %155
  %157 = load i32* %156, align 4
  %158 = sub nsw i32 %157, 20
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %159
  %161 = load i8* %160, align 1
  %162 = zext i8 %161 to i32
  %163 = sext i32 %.02 to i64
  %164 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %163
  %165 = load i8* %164, align 1
  %166 = zext i8 %165 to i32
  %167 = icmp eq i32 %162, %166
  br i1 %167, label %168, label %180

; <label>:168                                     ; preds = %154
  %169 = sext i32 %k.0 to i64
  %170 = getelementptr inbounds i32* %libs1.0, i64 %169
  %171 = load i32* %170, align 4
  %172 = sub nsw i32 %171, 20
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %173
  %175 = load i32* %174, align 4
  %176 = sext i32 %.02 to i64
  %177 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %176
  %178 = load i32* %177, align 4
  %179 = icmp eq i32 %175, %178
  br i1 %179, label %206, label %180

; <label>:180                                     ; preds = %168, %154
  %181 = sext i32 %k.0 to i64
  %182 = getelementptr inbounds i32* %libs1.0, i64 %181
  %183 = load i32* %182, align 4
  %184 = add nsw i32 %183, 1
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %185
  %187 = load i8* %186, align 1
  %188 = zext i8 %187 to i32
  %189 = sext i32 %.02 to i64
  %190 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %189
  %191 = load i8* %190, align 1
  %192 = zext i8 %191 to i32
  %193 = icmp eq i32 %188, %192
  br i1 %193, label %194, label %213

; <label>:194                                     ; preds = %180
  %195 = sext i32 %k.0 to i64
  %196 = getelementptr inbounds i32* %libs1.0, i64 %195
  %197 = load i32* %196, align 4
  %198 = add nsw i32 %197, 1
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %199
  %201 = load i32* %200, align 4
  %202 = sext i32 %.02 to i64
  %203 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %202
  %204 = load i32* %203, align 4
  %205 = icmp eq i32 %201, %204
  br i1 %205, label %206, label %213

; <label>:206                                     ; preds = %194, %168, %142, %116
  %207 = icmp ne i32* %lib, null
  br i1 %207, label %208, label %212

; <label>:208                                     ; preds = %206
  %209 = sext i32 %k.0 to i64
  %210 = getelementptr inbounds i32* %libs1.0, i64 %209
  %211 = load i32* %210, align 4
  store i32 %211, i32* %lib, align 4
  br label %212

; <label>:212                                     ; preds = %208, %206
  br label %217

; <label>:213                                     ; preds = %194, %180
  br label %214

; <label>:214                                     ; preds = %213
  %215 = add nsw i32 %k.0, 1
  br label %100

; <label>:216                                     ; preds = %100
  br label %217

; <label>:217                                     ; preds = %216, %212
  %.0 = phi i32 [ 1, %212 ], [ 0, %216 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @countstones(i32 %str) #0 {
  %1 = icmp ult i32 %str, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %str to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %str, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %str, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2093, i8* getelementptr inbounds ([15 x i8]* @.str33, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = sext i32 %str to i64
  %16 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %15
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %26, label %20

; <label>:20                                      ; preds = %14
  %21 = sext i32 %str to i64
  %22 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %21
  %23 = load i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp eq i32 %24, 2
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %20, %14
  br label %32

; <label>:27                                      ; preds = %20
  %28 = sdiv i32 %str, 20
  %29 = sub nsw i32 %28, 1
  %30 = srem i32 %str, 20
  %31 = sub nsw i32 %30, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2094, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %29, i32 %31)
  br label %32

; <label>:32                                      ; preds = %27, %26
  %33 = sext i32 %str to i64
  %34 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %33
  %35 = load i32* %34, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %36
  %38 = getelementptr inbounds %struct.string_data* %37, i32 0, i32 1
  %39 = load i32* %38, align 4
  ret i32 %39
}

; Function Attrs: nounwind uwtable
define i32 @findstones(i32 %str, i32 %maxstones, i32* %stones) #0 {
  %1 = icmp ult i32 %str, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %str to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %str, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %str, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2113, i8* getelementptr inbounds ([15 x i8]* @.str33, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = sext i32 %str to i64
  %16 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %15
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %26, label %20

; <label>:20                                      ; preds = %14
  %21 = sext i32 %str to i64
  %22 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %21
  %23 = load i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp eq i32 %24, 2
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %20, %14
  br label %32

; <label>:27                                      ; preds = %20
  %28 = sdiv i32 %str, 20
  %29 = sub nsw i32 %28, 1
  %30 = srem i32 %str, 20
  %31 = sub nsw i32 %30, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2114, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %29, i32 %31)
  br label %32

; <label>:32                                      ; preds = %27, %26
  %33 = sext i32 %str to i64
  %34 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %33
  %35 = load i32* %34, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %36
  %38 = getelementptr inbounds %struct.string_data* %37, i32 0, i32 1
  %39 = load i32* %38, align 4
  %40 = sext i32 %35 to i64
  %41 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %40
  %42 = getelementptr inbounds %struct.string_data* %41, i32 0, i32 2
  %43 = load i32* %42, align 4
  br label %44

; <label>:44                                      ; preds = %56, %32
  %pos.0 = phi i32 [ %43, %32 ], [ %55, %56 ]
  %k.0 = phi i32 [ 0, %32 ], [ %57, %56 ]
  %45 = icmp slt i32 %k.0, %maxstones
  br i1 %45, label %46, label %48

; <label>:46                                      ; preds = %44
  %47 = icmp slt i32 %k.0, %39
  br label %48

; <label>:48                                      ; preds = %46, %44
  %49 = phi i1 [ false, %44 ], [ %47, %46 ]
  br i1 %49, label %50, label %58

; <label>:50                                      ; preds = %48
  %51 = sext i32 %k.0 to i64
  %52 = getelementptr inbounds i32* %stones, i64 %51
  store i32 %pos.0, i32* %52, align 4
  %53 = sext i32 %pos.0 to i64
  %54 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %53
  %55 = load i32* %54, align 4
  br label %56

; <label>:56                                      ; preds = %50
  %57 = add nsw i32 %k.0, 1
  br label %44

; <label>:58                                      ; preds = %48
  ret i32 %39
}

; Function Attrs: nounwind uwtable
define i32 @chainlinks(i32 %str, i32* %adj) #0 {
  %1 = sext i32 %str to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = sext i32 %str to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %6, %0
  br label %18

; <label>:13                                      ; preds = %6
  %14 = sdiv i32 %str, 20
  %15 = sub nsw i32 %14, 1
  %16 = srem i32 %str, 20
  %17 = sub nsw i32 %16, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2140, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %15, i32 %17)
  br label %18

; <label>:18                                      ; preds = %13, %12
  %19 = sext i32 %str to i64
  %20 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %22
  br label %24

; <label>:24                                      ; preds = %39, %18
  %k.0 = phi i32 [ 0, %18 ], [ %40, %39 ]
  %25 = getelementptr inbounds %struct.string_data* %23, i32 0, i32 5
  %26 = load i32* %25, align 4
  %27 = icmp slt i32 %k.0, %26
  br i1 %27, label %28, label %41

; <label>:28                                      ; preds = %24
  %29 = sext i32 %k.0 to i64
  %30 = getelementptr inbounds %struct.string_data* %23, i32 0, i32 6
  %31 = getelementptr inbounds [160 x i32]* %30, i32 0, i64 %29
  %32 = load i32* %31, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %33
  %35 = getelementptr inbounds %struct.string_data* %34, i32 0, i32 2
  %36 = load i32* %35, align 4
  %37 = sext i32 %k.0 to i64
  %38 = getelementptr inbounds i32* %adj, i64 %37
  store i32 %36, i32* %38, align 4
  br label %39

; <label>:39                                      ; preds = %28
  %40 = add nsw i32 %k.0, 1
  br label %24

; <label>:41                                      ; preds = %24
  %42 = getelementptr inbounds %struct.string_data* %23, i32 0, i32 5
  %43 = load i32* %42, align 4
  ret i32 %43
}

; Function Attrs: nounwind uwtable
define i32 @chainlinks2(i32 %str, i32* %adj, i32 %lib) #0 {
  %1 = sext i32 %str to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = sext i32 %str to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %6, %0
  br label %18

; <label>:13                                      ; preds = %6
  %14 = sdiv i32 %str, 20
  %15 = sub nsw i32 %14, 1
  %16 = srem i32 %str, 20
  %17 = sub nsw i32 %16, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2165, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %15, i32 %17)
  br label %18

; <label>:18                                      ; preds = %13, %12
  %19 = sext i32 %str to i64
  %20 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %22
  br label %24

; <label>:24                                      ; preds = %45, %18
  %k.0 = phi i32 [ 0, %18 ], [ %46, %45 ]
  %neighbors.0 = phi i32 [ 0, %18 ], [ %neighbors.1, %45 ]
  %25 = getelementptr inbounds %struct.string_data* %23, i32 0, i32 5
  %26 = load i32* %25, align 4
  %27 = icmp slt i32 %k.0, %26
  br i1 %27, label %28, label %47

; <label>:28                                      ; preds = %24
  %29 = sext i32 %k.0 to i64
  %30 = getelementptr inbounds %struct.string_data* %23, i32 0, i32 6
  %31 = getelementptr inbounds [160 x i32]* %30, i32 0, i64 %29
  %32 = load i32* %31, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %33
  %35 = getelementptr inbounds %struct.string_data* %34, i32 0, i32 3
  %36 = load i32* %35, align 4
  %37 = icmp eq i32 %36, %lib
  br i1 %37, label %38, label %44

; <label>:38                                      ; preds = %28
  %39 = getelementptr inbounds %struct.string_data* %34, i32 0, i32 2
  %40 = load i32* %39, align 4
  %41 = add nsw i32 %neighbors.0, 1
  %42 = sext i32 %neighbors.0 to i64
  %43 = getelementptr inbounds i32* %adj, i64 %42
  store i32 %40, i32* %43, align 4
  br label %44

; <label>:44                                      ; preds = %38, %28
  %neighbors.1 = phi i32 [ %41, %38 ], [ %neighbors.0, %28 ]
  br label %45

; <label>:45                                      ; preds = %44
  %46 = add nsw i32 %k.0, 1
  br label %24

; <label>:47                                      ; preds = %24
  ret i32 %neighbors.0
}

; Function Attrs: nounwind uwtable
define i32 @chainlinks3(i32 %str, i32* %adj, i32 %lib) #0 {
  %1 = sext i32 %str to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = sext i32 %str to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %6, %0
  br label %18

; <label>:13                                      ; preds = %6
  %14 = sdiv i32 %str, 20
  %15 = sub nsw i32 %14, 1
  %16 = srem i32 %str, 20
  %17 = sub nsw i32 %16, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2193, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %15, i32 %17)
  br label %18

; <label>:18                                      ; preds = %13, %12
  %19 = sext i32 %str to i64
  %20 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %22
  br label %24

; <label>:24                                      ; preds = %45, %18
  %k.0 = phi i32 [ 0, %18 ], [ %46, %45 ]
  %neighbors.0 = phi i32 [ 0, %18 ], [ %neighbors.1, %45 ]
  %25 = getelementptr inbounds %struct.string_data* %23, i32 0, i32 5
  %26 = load i32* %25, align 4
  %27 = icmp slt i32 %k.0, %26
  br i1 %27, label %28, label %47

; <label>:28                                      ; preds = %24
  %29 = sext i32 %k.0 to i64
  %30 = getelementptr inbounds %struct.string_data* %23, i32 0, i32 6
  %31 = getelementptr inbounds [160 x i32]* %30, i32 0, i64 %29
  %32 = load i32* %31, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %33
  %35 = getelementptr inbounds %struct.string_data* %34, i32 0, i32 3
  %36 = load i32* %35, align 4
  %37 = icmp sle i32 %36, %lib
  br i1 %37, label %38, label %44

; <label>:38                                      ; preds = %28
  %39 = getelementptr inbounds %struct.string_data* %34, i32 0, i32 2
  %40 = load i32* %39, align 4
  %41 = add nsw i32 %neighbors.0, 1
  %42 = sext i32 %neighbors.0 to i64
  %43 = getelementptr inbounds i32* %adj, i64 %42
  store i32 %40, i32* %43, align 4
  br label %44

; <label>:44                                      ; preds = %38, %28
  %neighbors.1 = phi i32 [ %41, %38 ], [ %neighbors.0, %28 ]
  br label %45

; <label>:45                                      ; preds = %44
  %46 = add nsw i32 %k.0, 1
  br label %24

; <label>:47                                      ; preds = %24
  ret i32 %neighbors.0
}

; Function Attrs: nounwind uwtable
define i32 @extended_chainlinks(i32 %str, i32* %adj, i32 %both_colors) #0 {
  %libs = alloca [241 x i32], align 16
  %1 = sext i32 %str to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = sext i32 %str to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %6, %0
  br label %18

; <label>:13                                      ; preds = %6
  %14 = sdiv i32 %str, 20
  %15 = sub nsw i32 %14, 1
  %16 = srem i32 %str, 20
  %17 = sub nsw i32 %16, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2227, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %15, i32 %17)
  br label %18

; <label>:18                                      ; preds = %13, %12
  %19 = sext i32 %str to i64
  %20 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %22
  %24 = load i32* @string_mark, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* @string_mark, align 4
  br label %26

; <label>:26                                      ; preds = %51, %18
  %n.0 = phi i32 [ 0, %18 ], [ %52, %51 ]
  %27 = getelementptr inbounds %struct.string_data* %23, i32 0, i32 5
  %28 = load i32* %27, align 4
  %29 = icmp slt i32 %n.0, %28
  br i1 %29, label %30, label %53

; <label>:30                                      ; preds = %26
  %31 = sext i32 %n.0 to i64
  %32 = getelementptr inbounds %struct.string_data* %23, i32 0, i32 6
  %33 = getelementptr inbounds [160 x i32]* %32, i32 0, i64 %31
  %34 = load i32* %33, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %35
  %37 = getelementptr inbounds %struct.string_data* %36, i32 0, i32 2
  %38 = load i32* %37, align 4
  %39 = sext i32 %n.0 to i64
  %40 = getelementptr inbounds i32* %adj, i64 %39
  store i32 %38, i32* %40, align 4
  %41 = load i32* @string_mark, align 4
  %42 = sext i32 %n.0 to i64
  %43 = getelementptr inbounds i32* %adj, i64 %42
  %44 = load i32* %43, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %45
  %47 = load i32* %46, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %48
  %50 = getelementptr inbounds %struct.string_data* %49, i32 0, i32 7
  store i32 %41, i32* %50, align 4
  br label %51

; <label>:51                                      ; preds = %30
  %52 = add nsw i32 %n.0, 1
  br label %26

; <label>:53                                      ; preds = %26
  %54 = getelementptr inbounds [241 x i32]* %libs, i32 0, i32 0
  %55 = call i32 @findlib(i32 %str, i32 241, i32* %54)
  br label %56

; <label>:56                                      ; preds = %147, %53
  %n.1 = phi i32 [ %n.0, %53 ], [ %n.2, %147 ]
  %r.0 = phi i32 [ 0, %53 ], [ %148, %147 ]
  %57 = icmp slt i32 %r.0, %55
  br i1 %57, label %58, label %149

; <label>:58                                      ; preds = %56
  br label %59

; <label>:59                                      ; preds = %144, %58
  %n.2 = phi i32 [ %n.1, %58 ], [ %n.3, %144 ]
  %k.0 = phi i32 [ 0, %58 ], [ %145, %144 ]
  %60 = icmp slt i32 %k.0, 4
  br i1 %60, label %61, label %146

; <label>:61                                      ; preds = %59
  %62 = sext i32 %r.0 to i64
  %63 = getelementptr inbounds [241 x i32]* %libs, i32 0, i64 %62
  %64 = load i32* %63, align 4
  %65 = sext i32 %k.0 to i64
  %66 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = add nsw i32 %64, %67
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %69
  %71 = load i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = sext i32 %str to i64
  %74 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %73
  %75 = load i8* %74, align 1
  %76 = zext i8 %75 to i32
  %77 = sub nsw i32 3, %76
  %78 = icmp eq i32 %72, %77
  br i1 %78, label %98, label %79

; <label>:79                                      ; preds = %61
  %80 = icmp ne i32 %both_colors, 0
  br i1 %80, label %81, label %143

; <label>:81                                      ; preds = %79
  %82 = sext i32 %r.0 to i64
  %83 = getelementptr inbounds [241 x i32]* %libs, i32 0, i64 %82
  %84 = load i32* %83, align 4
  %85 = sext i32 %k.0 to i64
  %86 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %85
  %87 = load i32* %86, align 4
  %88 = add nsw i32 %84, %87
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %89
  %91 = load i8* %90, align 1
  %92 = zext i8 %91 to i32
  %93 = sext i32 %str to i64
  %94 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %93
  %95 = load i8* %94, align 1
  %96 = zext i8 %95 to i32
  %97 = icmp eq i32 %92, %96
  br i1 %97, label %98, label %143

; <label>:98                                      ; preds = %81, %61
  %99 = sext i32 %r.0 to i64
  %100 = getelementptr inbounds [241 x i32]* %libs, i32 0, i64 %99
  %101 = load i32* %100, align 4
  %102 = sext i32 %k.0 to i64
  %103 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %102
  %104 = load i32* %103, align 4
  %105 = add nsw i32 %101, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %106
  %108 = load i32* %107, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %109
  %111 = getelementptr inbounds %struct.string_data* %110, i32 0, i32 7
  %112 = load i32* %111, align 4
  %113 = load i32* @string_mark, align 4
  %114 = icmp ne i32 %112, %113
  br i1 %114, label %115, label %143

; <label>:115                                     ; preds = %98
  %116 = sext i32 %r.0 to i64
  %117 = getelementptr inbounds [241 x i32]* %libs, i32 0, i64 %116
  %118 = load i32* %117, align 4
  %119 = sext i32 %k.0 to i64
  %120 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %119
  %121 = load i32* %120, align 4
  %122 = add nsw i32 %118, %121
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %123
  %125 = load i32* %124, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %126
  %128 = getelementptr inbounds %struct.string_data* %127, i32 0, i32 2
  %129 = load i32* %128, align 4
  %130 = sext i32 %n.2 to i64
  %131 = getelementptr inbounds i32* %adj, i64 %130
  store i32 %129, i32* %131, align 4
  %132 = load i32* @string_mark, align 4
  %133 = sext i32 %n.2 to i64
  %134 = getelementptr inbounds i32* %adj, i64 %133
  %135 = load i32* %134, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %136
  %138 = load i32* %137, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %139
  %141 = getelementptr inbounds %struct.string_data* %140, i32 0, i32 7
  store i32 %132, i32* %141, align 4
  %142 = add nsw i32 %n.2, 1
  br label %143

; <label>:143                                     ; preds = %115, %98, %81, %79
  %n.3 = phi i32 [ %142, %115 ], [ %n.2, %98 ], [ %n.2, %81 ], [ %n.2, %79 ]
  br label %144

; <label>:144                                     ; preds = %143
  %145 = add nsw i32 %k.0, 1
  br label %59

; <label>:146                                     ; preds = %59
  br label %147

; <label>:147                                     ; preds = %146
  %148 = add nsw i32 %r.0, 1
  br label %56

; <label>:149                                     ; preds = %56
  ret i32 %n.1
}

; Function Attrs: nounwind uwtable
define i32 @find_origin(i32 %str) #0 {
  %1 = sext i32 %str to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = sext i32 %str to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %6, %0
  br label %18

; <label>:13                                      ; preds = %6
  %14 = sdiv i32 %str, 20
  %15 = sub nsw i32 %14, 1
  %16 = srem i32 %str, 20
  %17 = sub nsw i32 %16, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2270, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %15, i32 %17)
  br label %18

; <label>:18                                      ; preds = %13, %12
  %19 = sext i32 %str to i64
  %20 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %22
  %24 = getelementptr inbounds %struct.string_data* %23, i32 0, i32 2
  %25 = load i32* %24, align 4
  ret i32 %25
}

; Function Attrs: nounwind uwtable
define i32 @is_self_atari(i32 %pos, i32 %color) #0 {
  %1 = sub nsw i32 3, %color
  %2 = icmp ult i32 %pos, 421
  br i1 %2, label %3, label %10

; <label>:3                                       ; preds = %0
  %4 = sext i32 %pos to i64
  %5 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %4
  %6 = load i8* %5, align 1
  %7 = zext i8 %6 to i32
  %8 = icmp ne i32 %7, 3
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %3
  br label %15

; <label>:10                                      ; preds = %3, %0
  %11 = sdiv i32 %pos, 20
  %12 = sub nsw i32 %11, 1
  %13 = srem i32 %pos, 20
  %14 = sub nsw i32 %13, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2294, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %12, i32 %14)
  br label %15

; <label>:15                                      ; preds = %10, %9
  %16 = sext i32 %pos to i64
  %17 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %16
  %18 = load i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %15
  br label %27

; <label>:22                                      ; preds = %15
  %23 = sdiv i32 %pos, 20
  %24 = sub nsw i32 %23, 1
  %25 = srem i32 %pos, 20
  %26 = sub nsw i32 %25, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2295, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %24, i32 %26)
  br label %27

; <label>:27                                      ; preds = %22, %21
  %28 = icmp eq i32 %color, 1
  br i1 %28, label %31, label %29

; <label>:29                                      ; preds = %27
  %30 = icmp eq i32 %color, 2
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %29, %27
  br label %37

; <label>:32                                      ; preds = %29
  %33 = sdiv i32 %pos, 20
  %34 = sub nsw i32 %33, 1
  %35 = srem i32 %pos, 20
  %36 = sub nsw i32 %35, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2296, i8* getelementptr inbounds ([16 x i8]* @.str28, i32 0, i32 0), i32 %34, i32 %36)
  br label %37

; <label>:37                                      ; preds = %32, %31
  %38 = load i32* @string_mark, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* @string_mark, align 4
  %40 = add nsw i32 %pos, 20
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %41
  %43 = load i8* %42, align 1
  %44 = zext i8 %43 to i32
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %48

; <label>:46                                      ; preds = %37
  %47 = add nsw i32 0, 1
  br label %119

; <label>:48                                      ; preds = %37
  %49 = add nsw i32 %pos, 20
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %50
  %52 = load i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = icmp eq i32 %53, %color
  br i1 %54, label %55, label %79

; <label>:55                                      ; preds = %48
  %56 = add nsw i32 %pos, 20
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %57
  %59 = load i32* %58, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %60
  %62 = getelementptr inbounds %struct.string_data* %61, i32 0, i32 3
  %63 = load i32* %62, align 4
  %64 = icmp sgt i32 %63, 2
  br i1 %64, label %65, label %66

; <label>:65                                      ; preds = %55
  br label %371

; <label>:66                                      ; preds = %55
  %67 = add nsw i32 %pos, 20
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %68
  %70 = load i32* %69, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %71
  %73 = getelementptr inbounds %struct.string_data* %72, i32 0, i32 3
  %74 = load i32* %73, align 4
  %75 = icmp eq i32 %74, 2
  br i1 %75, label %76, label %78

; <label>:76                                      ; preds = %66
  %77 = add nsw i32 0, 1
  br label %78

; <label>:78                                      ; preds = %76, %66
  %far_liberties.0 = phi i32 [ %77, %76 ], [ 0, %66 ]
  br label %118

; <label>:79                                      ; preds = %48
  %80 = add nsw i32 %pos, 20
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %81
  %83 = load i8* %82, align 1
  %84 = zext i8 %83 to i32
  %85 = icmp eq i32 %84, %1
  br i1 %85, label %86, label %117

; <label>:86                                      ; preds = %79
  %87 = add nsw i32 %pos, 20
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %88
  %90 = load i32* %89, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %91
  %93 = getelementptr inbounds %struct.string_data* %92, i32 0, i32 3
  %94 = load i32* %93, align 4
  %95 = icmp eq i32 %94, 1
  br i1 %95, label %96, label %117

; <label>:96                                      ; preds = %86
  %97 = add nsw i32 %pos, 20
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %98
  %100 = load i32* %99, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %101
  %103 = getelementptr inbounds %struct.string_data* %102, i32 0, i32 7
  %104 = load i32* %103, align 4
  %105 = load i32* @string_mark, align 4
  %106 = icmp ne i32 %104, %105
  br i1 %106, label %107, label %117

; <label>:107                                     ; preds = %96
  %108 = add nsw i32 0, 1
  %109 = load i32* @string_mark, align 4
  %110 = add nsw i32 %pos, 20
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %111
  %113 = load i32* %112, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %114
  %116 = getelementptr inbounds %struct.string_data* %115, i32 0, i32 7
  store i32 %109, i32* %116, align 4
  br label %117

; <label>:117                                     ; preds = %107, %96, %86, %79
  %captures.0 = phi i32 [ %108, %107 ], [ 0, %96 ], [ 0, %86 ], [ 0, %79 ]
  br label %118

; <label>:118                                     ; preds = %117, %78
  %captures.1 = phi i32 [ 0, %78 ], [ %captures.0, %117 ]
  %far_liberties.1 = phi i32 [ %far_liberties.0, %78 ], [ 0, %117 ]
  br label %119

; <label>:119                                     ; preds = %118, %46
  %trivial_liberties.0 = phi i32 [ %47, %46 ], [ 0, %118 ]
  %captures.2 = phi i32 [ 0, %46 ], [ %captures.1, %118 ]
  %far_liberties.2 = phi i32 [ 0, %46 ], [ %far_liberties.1, %118 ]
  %120 = sub nsw i32 %pos, 1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %121
  %123 = load i8* %122, align 1
  %124 = zext i8 %123 to i32
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %128

; <label>:126                                     ; preds = %119
  %127 = add nsw i32 %trivial_liberties.0, 1
  br label %199

; <label>:128                                     ; preds = %119
  %129 = sub nsw i32 %pos, 1
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %130
  %132 = load i8* %131, align 1
  %133 = zext i8 %132 to i32
  %134 = icmp eq i32 %133, %color
  br i1 %134, label %135, label %159

; <label>:135                                     ; preds = %128
  %136 = sub nsw i32 %pos, 1
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %137
  %139 = load i32* %138, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %140
  %142 = getelementptr inbounds %struct.string_data* %141, i32 0, i32 3
  %143 = load i32* %142, align 4
  %144 = icmp sgt i32 %143, 2
  br i1 %144, label %145, label %146

; <label>:145                                     ; preds = %135
  br label %371

; <label>:146                                     ; preds = %135
  %147 = sub nsw i32 %pos, 1
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %148
  %150 = load i32* %149, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %151
  %153 = getelementptr inbounds %struct.string_data* %152, i32 0, i32 3
  %154 = load i32* %153, align 4
  %155 = icmp eq i32 %154, 2
  br i1 %155, label %156, label %158

; <label>:156                                     ; preds = %146
  %157 = add nsw i32 %far_liberties.2, 1
  br label %158

; <label>:158                                     ; preds = %156, %146
  %far_liberties.3 = phi i32 [ %157, %156 ], [ %far_liberties.2, %146 ]
  br label %198

; <label>:159                                     ; preds = %128
  %160 = sub nsw i32 %pos, 1
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %161
  %163 = load i8* %162, align 1
  %164 = zext i8 %163 to i32
  %165 = icmp eq i32 %164, %1
  br i1 %165, label %166, label %197

; <label>:166                                     ; preds = %159
  %167 = sub nsw i32 %pos, 1
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %168
  %170 = load i32* %169, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %171
  %173 = getelementptr inbounds %struct.string_data* %172, i32 0, i32 3
  %174 = load i32* %173, align 4
  %175 = icmp eq i32 %174, 1
  br i1 %175, label %176, label %197

; <label>:176                                     ; preds = %166
  %177 = sub nsw i32 %pos, 1
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %178
  %180 = load i32* %179, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %181
  %183 = getelementptr inbounds %struct.string_data* %182, i32 0, i32 7
  %184 = load i32* %183, align 4
  %185 = load i32* @string_mark, align 4
  %186 = icmp ne i32 %184, %185
  br i1 %186, label %187, label %197

; <label>:187                                     ; preds = %176
  %188 = add nsw i32 %captures.2, 1
  %189 = load i32* @string_mark, align 4
  %190 = sub nsw i32 %pos, 1
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %191
  %193 = load i32* %192, align 4
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %194
  %196 = getelementptr inbounds %struct.string_data* %195, i32 0, i32 7
  store i32 %189, i32* %196, align 4
  br label %197

; <label>:197                                     ; preds = %187, %176, %166, %159
  %captures.3 = phi i32 [ %188, %187 ], [ %captures.2, %176 ], [ %captures.2, %166 ], [ %captures.2, %159 ]
  br label %198

; <label>:198                                     ; preds = %197, %158
  %captures.4 = phi i32 [ %captures.2, %158 ], [ %captures.3, %197 ]
  %far_liberties.4 = phi i32 [ %far_liberties.3, %158 ], [ %far_liberties.2, %197 ]
  br label %199

; <label>:199                                     ; preds = %198, %126
  %trivial_liberties.1 = phi i32 [ %127, %126 ], [ %trivial_liberties.0, %198 ]
  %captures.5 = phi i32 [ %captures.2, %126 ], [ %captures.4, %198 ]
  %far_liberties.5 = phi i32 [ %far_liberties.2, %126 ], [ %far_liberties.4, %198 ]
  %200 = sub nsw i32 %pos, 20
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %201
  %203 = load i8* %202, align 1
  %204 = zext i8 %203 to i32
  %205 = icmp eq i32 %204, 0
  br i1 %205, label %206, label %208

; <label>:206                                     ; preds = %199
  %207 = add nsw i32 %trivial_liberties.1, 1
  br label %279

; <label>:208                                     ; preds = %199
  %209 = sub nsw i32 %pos, 20
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %210
  %212 = load i8* %211, align 1
  %213 = zext i8 %212 to i32
  %214 = icmp eq i32 %213, %color
  br i1 %214, label %215, label %239

; <label>:215                                     ; preds = %208
  %216 = sub nsw i32 %pos, 20
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %217
  %219 = load i32* %218, align 4
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %220
  %222 = getelementptr inbounds %struct.string_data* %221, i32 0, i32 3
  %223 = load i32* %222, align 4
  %224 = icmp sgt i32 %223, 2
  br i1 %224, label %225, label %226

; <label>:225                                     ; preds = %215
  br label %371

; <label>:226                                     ; preds = %215
  %227 = sub nsw i32 %pos, 20
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %228
  %230 = load i32* %229, align 4
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %231
  %233 = getelementptr inbounds %struct.string_data* %232, i32 0, i32 3
  %234 = load i32* %233, align 4
  %235 = icmp eq i32 %234, 2
  br i1 %235, label %236, label %238

; <label>:236                                     ; preds = %226
  %237 = add nsw i32 %far_liberties.5, 1
  br label %238

; <label>:238                                     ; preds = %236, %226
  %far_liberties.6 = phi i32 [ %237, %236 ], [ %far_liberties.5, %226 ]
  br label %278

; <label>:239                                     ; preds = %208
  %240 = sub nsw i32 %pos, 20
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %241
  %243 = load i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = icmp eq i32 %244, %1
  br i1 %245, label %246, label %277

; <label>:246                                     ; preds = %239
  %247 = sub nsw i32 %pos, 20
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %248
  %250 = load i32* %249, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %251
  %253 = getelementptr inbounds %struct.string_data* %252, i32 0, i32 3
  %254 = load i32* %253, align 4
  %255 = icmp eq i32 %254, 1
  br i1 %255, label %256, label %277

; <label>:256                                     ; preds = %246
  %257 = sub nsw i32 %pos, 20
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %258
  %260 = load i32* %259, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %261
  %263 = getelementptr inbounds %struct.string_data* %262, i32 0, i32 7
  %264 = load i32* %263, align 4
  %265 = load i32* @string_mark, align 4
  %266 = icmp ne i32 %264, %265
  br i1 %266, label %267, label %277

; <label>:267                                     ; preds = %256
  %268 = add nsw i32 %captures.5, 1
  %269 = load i32* @string_mark, align 4
  %270 = sub nsw i32 %pos, 20
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %271
  %273 = load i32* %272, align 4
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %274
  %276 = getelementptr inbounds %struct.string_data* %275, i32 0, i32 7
  store i32 %269, i32* %276, align 4
  br label %277

; <label>:277                                     ; preds = %267, %256, %246, %239
  %captures.6 = phi i32 [ %268, %267 ], [ %captures.5, %256 ], [ %captures.5, %246 ], [ %captures.5, %239 ]
  br label %278

; <label>:278                                     ; preds = %277, %238
  %captures.7 = phi i32 [ %captures.5, %238 ], [ %captures.6, %277 ]
  %far_liberties.7 = phi i32 [ %far_liberties.6, %238 ], [ %far_liberties.5, %277 ]
  br label %279

; <label>:279                                     ; preds = %278, %206
  %trivial_liberties.2 = phi i32 [ %207, %206 ], [ %trivial_liberties.1, %278 ]
  %captures.8 = phi i32 [ %captures.5, %206 ], [ %captures.7, %278 ]
  %far_liberties.8 = phi i32 [ %far_liberties.5, %206 ], [ %far_liberties.7, %278 ]
  %280 = add nsw i32 %pos, 1
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %281
  %283 = load i8* %282, align 1
  %284 = zext i8 %283 to i32
  %285 = icmp eq i32 %284, 0
  br i1 %285, label %286, label %288

; <label>:286                                     ; preds = %279
  %287 = add nsw i32 %trivial_liberties.2, 1
  br label %351

; <label>:288                                     ; preds = %279
  %289 = add nsw i32 %pos, 1
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %290
  %292 = load i8* %291, align 1
  %293 = zext i8 %292 to i32
  %294 = icmp eq i32 %293, %color
  br i1 %294, label %295, label %319

; <label>:295                                     ; preds = %288
  %296 = add nsw i32 %pos, 1
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %297
  %299 = load i32* %298, align 4
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %300
  %302 = getelementptr inbounds %struct.string_data* %301, i32 0, i32 3
  %303 = load i32* %302, align 4
  %304 = icmp sgt i32 %303, 2
  br i1 %304, label %305, label %306

; <label>:305                                     ; preds = %295
  br label %371

; <label>:306                                     ; preds = %295
  %307 = add nsw i32 %pos, 1
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %308
  %310 = load i32* %309, align 4
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %311
  %313 = getelementptr inbounds %struct.string_data* %312, i32 0, i32 3
  %314 = load i32* %313, align 4
  %315 = icmp eq i32 %314, 2
  br i1 %315, label %316, label %318

; <label>:316                                     ; preds = %306
  %317 = add nsw i32 %far_liberties.8, 1
  br label %318

; <label>:318                                     ; preds = %316, %306
  %far_liberties.9 = phi i32 [ %317, %316 ], [ %far_liberties.8, %306 ]
  br label %350

; <label>:319                                     ; preds = %288
  %320 = add nsw i32 %pos, 1
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %321
  %323 = load i8* %322, align 1
  %324 = zext i8 %323 to i32
  %325 = icmp eq i32 %324, %1
  br i1 %325, label %326, label %349

; <label>:326                                     ; preds = %319
  %327 = add nsw i32 %pos, 1
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %328
  %330 = load i32* %329, align 4
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %331
  %333 = getelementptr inbounds %struct.string_data* %332, i32 0, i32 3
  %334 = load i32* %333, align 4
  %335 = icmp eq i32 %334, 1
  br i1 %335, label %336, label %349

; <label>:336                                     ; preds = %326
  %337 = add nsw i32 %pos, 1
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %338
  %340 = load i32* %339, align 4
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %341
  %343 = getelementptr inbounds %struct.string_data* %342, i32 0, i32 7
  %344 = load i32* %343, align 4
  %345 = load i32* @string_mark, align 4
  %346 = icmp ne i32 %344, %345
  br i1 %346, label %347, label %349

; <label>:347                                     ; preds = %336
  %348 = add nsw i32 %captures.8, 1
  br label %349

; <label>:349                                     ; preds = %347, %336, %326, %319
  %captures.9 = phi i32 [ %348, %347 ], [ %captures.8, %336 ], [ %captures.8, %326 ], [ %captures.8, %319 ]
  br label %350

; <label>:350                                     ; preds = %349, %318
  %captures.10 = phi i32 [ %captures.8, %318 ], [ %captures.9, %349 ]
  %far_liberties.10 = phi i32 [ %far_liberties.9, %318 ], [ %far_liberties.8, %349 ]
  br label %351

; <label>:351                                     ; preds = %350, %286
  %trivial_liberties.3 = phi i32 [ %287, %286 ], [ %trivial_liberties.2, %350 ]
  %captures.11 = phi i32 [ %captures.8, %286 ], [ %captures.10, %350 ]
  %far_liberties.11 = phi i32 [ %far_liberties.8, %286 ], [ %far_liberties.10, %350 ]
  %352 = add nsw i32 %trivial_liberties.3, %captures.11
  %353 = icmp sge i32 %352, 2
  br i1 %353, label %354, label %355

; <label>:354                                     ; preds = %351
  br label %371

; <label>:355                                     ; preds = %351
  %356 = icmp sgt i32 %far_liberties.11, 0
  %357 = zext i1 %356 to i32
  %358 = add nsw i32 %357, %captures.11
  %359 = icmp sge i32 %358, 2
  br i1 %359, label %360, label %361

; <label>:360                                     ; preds = %355
  br label %371

; <label>:361                                     ; preds = %355
  %362 = icmp eq i32 %captures.11, 0
  br i1 %362, label %363, label %367

; <label>:363                                     ; preds = %361
  %364 = add nsw i32 %far_liberties.11, %trivial_liberties.3
  %365 = icmp sle i32 %364, 1
  br i1 %365, label %366, label %367

; <label>:366                                     ; preds = %363
  br label %371

; <label>:367                                     ; preds = %363, %361
  %368 = call i32 @accuratelib(i32 %pos, i32 %color, i32 2, i32* null)
  %369 = icmp sle i32 %368, 1
  %370 = zext i1 %369 to i32
  br label %371

; <label>:371                                     ; preds = %367, %366, %360, %354, %305, %225, %145, %65
  %.0 = phi i32 [ 0, %354 ], [ 0, %360 ], [ 1, %366 ], [ %370, %367 ], [ 0, %305 ], [ 0, %225 ], [ 0, %145 ], [ 0, %65 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @liberty_of_string(i32 %pos, i32 %str) #0 {
  %1 = icmp ult i32 %pos, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %pos to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %pos, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %pos, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2381, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = icmp ult i32 %str, 421
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %14
  %17 = sext i32 %str to i64
  %18 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %17
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %16
  br label %28

; <label>:23                                      ; preds = %16, %14
  %24 = sdiv i32 %str, 20
  %25 = sub nsw i32 %24, 1
  %26 = srem i32 %str, 20
  %27 = sub nsw i32 %26, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2382, i8* getelementptr inbounds ([15 x i8]* @.str33, i32 0, i32 0), i32 %25, i32 %27)
  br label %28

; <label>:28                                      ; preds = %23, %22
  %29 = sext i32 %pos to i64
  %30 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %29
  %31 = load i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %40, label %34

; <label>:34                                      ; preds = %28
  %35 = sext i32 %pos to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp eq i32 %38, 2
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %34, %28
  br label %126

; <label>:41                                      ; preds = %34
  %42 = add nsw i32 %pos, 20
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %43
  %45 = load i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = sext i32 %str to i64
  %48 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %47
  %49 = load i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %46, %50
  br i1 %51, label %52, label %61

; <label>:52                                      ; preds = %41
  %53 = add nsw i32 %pos, 20
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %54
  %56 = load i32* %55, align 4
  %57 = sext i32 %str to i64
  %58 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %57
  %59 = load i32* %58, align 4
  %60 = icmp eq i32 %56, %59
  br i1 %60, label %123, label %61

; <label>:61                                      ; preds = %52, %41
  %62 = sub nsw i32 %pos, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %63
  %65 = load i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = sext i32 %str to i64
  %68 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %67
  %69 = load i8* %68, align 1
  %70 = zext i8 %69 to i32
  %71 = icmp eq i32 %66, %70
  br i1 %71, label %72, label %81

; <label>:72                                      ; preds = %61
  %73 = sub nsw i32 %pos, 1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %74
  %76 = load i32* %75, align 4
  %77 = sext i32 %str to i64
  %78 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %77
  %79 = load i32* %78, align 4
  %80 = icmp eq i32 %76, %79
  br i1 %80, label %123, label %81

; <label>:81                                      ; preds = %72, %61
  %82 = sub nsw i32 %pos, 20
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %83
  %85 = load i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = sext i32 %str to i64
  %88 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %87
  %89 = load i8* %88, align 1
  %90 = zext i8 %89 to i32
  %91 = icmp eq i32 %86, %90
  br i1 %91, label %92, label %101

; <label>:92                                      ; preds = %81
  %93 = sub nsw i32 %pos, 20
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %94
  %96 = load i32* %95, align 4
  %97 = sext i32 %str to i64
  %98 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %97
  %99 = load i32* %98, align 4
  %100 = icmp eq i32 %96, %99
  br i1 %100, label %123, label %101

; <label>:101                                     ; preds = %92, %81
  %102 = add nsw i32 %pos, 1
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %103
  %105 = load i8* %104, align 1
  %106 = zext i8 %105 to i32
  %107 = sext i32 %str to i64
  %108 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %107
  %109 = load i8* %108, align 1
  %110 = zext i8 %109 to i32
  %111 = icmp eq i32 %106, %110
  br i1 %111, label %112, label %121

; <label>:112                                     ; preds = %101
  %113 = add nsw i32 %pos, 1
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %114
  %116 = load i32* %115, align 4
  %117 = sext i32 %str to i64
  %118 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %117
  %119 = load i32* %118, align 4
  %120 = icmp eq i32 %116, %119
  br label %121

; <label>:121                                     ; preds = %112, %101
  %122 = phi i1 [ false, %101 ], [ %120, %112 ]
  br label %123

; <label>:123                                     ; preds = %121, %92, %72, %52
  %124 = phi i1 [ true, %92 ], [ true, %72 ], [ true, %52 ], [ %122, %121 ]
  %125 = zext i1 %124 to i32
  br label %126

; <label>:126                                     ; preds = %123, %40
  %.0 = phi i32 [ 0, %40 ], [ %125, %123 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @second_order_liberty_of_string(i32 %pos, i32 %str) #0 {
  %1 = icmp ult i32 %pos, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %pos to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %pos, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %pos, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2397, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = icmp ult i32 %str, 421
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %14
  %17 = sext i32 %str to i64
  %18 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %17
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %16
  br label %28

; <label>:23                                      ; preds = %16, %14
  %24 = sdiv i32 %str, 20
  %25 = sub nsw i32 %24, 1
  %26 = srem i32 %str, 20
  %27 = sub nsw i32 %26, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2398, i8* getelementptr inbounds ([15 x i8]* @.str33, i32 0, i32 0), i32 %25, i32 %27)
  br label %28

; <label>:28                                      ; preds = %23, %22
  br label %29

; <label>:29                                      ; preds = %155, %28
  %k.0 = phi i32 [ 0, %28 ], [ %156, %155 ]
  %30 = icmp slt i32 %k.0, 4
  br i1 %30, label %31, label %157

; <label>:31                                      ; preds = %29
  %32 = sext i32 %k.0 to i64
  %33 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %32
  %34 = load i32* %33, align 4
  %35 = add nsw i32 %pos, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %36
  %38 = load i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %154

; <label>:41                                      ; preds = %31
  %42 = sext i32 %k.0 to i64
  %43 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %42
  %44 = load i32* %43, align 4
  %45 = add nsw i32 %pos, %44
  %46 = add nsw i32 %45, 20
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %47
  %49 = load i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = sext i32 %str to i64
  %52 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %51
  %53 = load i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = icmp eq i32 %50, %54
  br i1 %55, label %56, label %69

; <label>:56                                      ; preds = %41
  %57 = sext i32 %k.0 to i64
  %58 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %57
  %59 = load i32* %58, align 4
  %60 = add nsw i32 %pos, %59
  %61 = add nsw i32 %60, 20
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %62
  %64 = load i32* %63, align 4
  %65 = sext i32 %str to i64
  %66 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = icmp eq i32 %64, %67
  br i1 %68, label %153, label %69

; <label>:69                                      ; preds = %56, %41
  %70 = sext i32 %k.0 to i64
  %71 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %70
  %72 = load i32* %71, align 4
  %73 = add nsw i32 %pos, %72
  %74 = sub nsw i32 %73, 1
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %75
  %77 = load i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = sext i32 %str to i64
  %80 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %79
  %81 = load i8* %80, align 1
  %82 = zext i8 %81 to i32
  %83 = icmp eq i32 %78, %82
  br i1 %83, label %84, label %97

; <label>:84                                      ; preds = %69
  %85 = sext i32 %k.0 to i64
  %86 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %85
  %87 = load i32* %86, align 4
  %88 = add nsw i32 %pos, %87
  %89 = sub nsw i32 %88, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %90
  %92 = load i32* %91, align 4
  %93 = sext i32 %str to i64
  %94 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %93
  %95 = load i32* %94, align 4
  %96 = icmp eq i32 %92, %95
  br i1 %96, label %153, label %97

; <label>:97                                      ; preds = %84, %69
  %98 = sext i32 %k.0 to i64
  %99 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %98
  %100 = load i32* %99, align 4
  %101 = add nsw i32 %pos, %100
  %102 = sub nsw i32 %101, 20
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %103
  %105 = load i8* %104, align 1
  %106 = zext i8 %105 to i32
  %107 = sext i32 %str to i64
  %108 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %107
  %109 = load i8* %108, align 1
  %110 = zext i8 %109 to i32
  %111 = icmp eq i32 %106, %110
  br i1 %111, label %112, label %125

; <label>:112                                     ; preds = %97
  %113 = sext i32 %k.0 to i64
  %114 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %113
  %115 = load i32* %114, align 4
  %116 = add nsw i32 %pos, %115
  %117 = sub nsw i32 %116, 20
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %118
  %120 = load i32* %119, align 4
  %121 = sext i32 %str to i64
  %122 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %121
  %123 = load i32* %122, align 4
  %124 = icmp eq i32 %120, %123
  br i1 %124, label %153, label %125

; <label>:125                                     ; preds = %112, %97
  %126 = sext i32 %k.0 to i64
  %127 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %126
  %128 = load i32* %127, align 4
  %129 = add nsw i32 %pos, %128
  %130 = add nsw i32 %129, 1
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %131
  %133 = load i8* %132, align 1
  %134 = zext i8 %133 to i32
  %135 = sext i32 %str to i64
  %136 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %135
  %137 = load i8* %136, align 1
  %138 = zext i8 %137 to i32
  %139 = icmp eq i32 %134, %138
  br i1 %139, label %140, label %154

; <label>:140                                     ; preds = %125
  %141 = sext i32 %k.0 to i64
  %142 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %141
  %143 = load i32* %142, align 4
  %144 = add nsw i32 %pos, %143
  %145 = add nsw i32 %144, 1
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %146
  %148 = load i32* %147, align 4
  %149 = sext i32 %str to i64
  %150 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %149
  %151 = load i32* %150, align 4
  %152 = icmp eq i32 %148, %151
  br i1 %152, label %153, label %154

; <label>:153                                     ; preds = %140, %112, %84, %56
  br label %158

; <label>:154                                     ; preds = %140, %125, %31
  br label %155

; <label>:155                                     ; preds = %154
  %156 = add nsw i32 %k.0, 1
  br label %29

; <label>:157                                     ; preds = %29
  br label %158

; <label>:158                                     ; preds = %157, %153
  %.0 = phi i32 [ 1, %153 ], [ 0, %157 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @neighbor_of_string(i32 %pos, i32 %str) #0 {
  %1 = sext i32 %str to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %8, label %6

; <label>:6                                       ; preds = %0
  %7 = icmp eq i32 %4, 2
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %6, %0
  br label %14

; <label>:9                                       ; preds = %6
  %10 = sdiv i32 %str, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %str, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2418, i8* getelementptr inbounds ([16 x i8]* @.str28, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = icmp ult i32 %pos, 421
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %14
  %17 = sext i32 %pos to i64
  %18 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %17
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %16
  br label %28

; <label>:23                                      ; preds = %16, %14
  %24 = sdiv i32 %pos, 20
  %25 = sub nsw i32 %24, 1
  %26 = srem i32 %pos, 20
  %27 = sub nsw i32 %26, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2419, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %25, i32 %27)
  br label %28

; <label>:28                                      ; preds = %23, %22
  %29 = add nsw i32 %pos, 20
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %30
  %32 = load i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = icmp eq i32 %33, %4
  br i1 %34, label %35, label %44

; <label>:35                                      ; preds = %28
  %36 = add nsw i32 %pos, 20
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %37
  %39 = load i32* %38, align 4
  %40 = sext i32 %str to i64
  %41 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %40
  %42 = load i32* %41, align 4
  %43 = icmp eq i32 %39, %42
  br i1 %43, label %94, label %44

; <label>:44                                      ; preds = %35, %28
  %45 = sub nsw i32 %pos, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %46
  %48 = load i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = icmp eq i32 %49, %4
  br i1 %50, label %51, label %60

; <label>:51                                      ; preds = %44
  %52 = sub nsw i32 %pos, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %53
  %55 = load i32* %54, align 4
  %56 = sext i32 %str to i64
  %57 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %56
  %58 = load i32* %57, align 4
  %59 = icmp eq i32 %55, %58
  br i1 %59, label %94, label %60

; <label>:60                                      ; preds = %51, %44
  %61 = sub nsw i32 %pos, 20
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %62
  %64 = load i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = icmp eq i32 %65, %4
  br i1 %66, label %67, label %76

; <label>:67                                      ; preds = %60
  %68 = sub nsw i32 %pos, 20
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %69
  %71 = load i32* %70, align 4
  %72 = sext i32 %str to i64
  %73 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %72
  %74 = load i32* %73, align 4
  %75 = icmp eq i32 %71, %74
  br i1 %75, label %94, label %76

; <label>:76                                      ; preds = %67, %60
  %77 = add nsw i32 %pos, 1
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %78
  %80 = load i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = icmp eq i32 %81, %4
  br i1 %82, label %83, label %92

; <label>:83                                      ; preds = %76
  %84 = add nsw i32 %pos, 1
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %85
  %87 = load i32* %86, align 4
  %88 = sext i32 %str to i64
  %89 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %88
  %90 = load i32* %89, align 4
  %91 = icmp eq i32 %87, %90
  br label %92

; <label>:92                                      ; preds = %83, %76
  %93 = phi i1 [ false, %76 ], [ %91, %83 ]
  br label %94

; <label>:94                                      ; preds = %92, %67, %51, %35
  %95 = phi i1 [ true, %67 ], [ true, %51 ], [ true, %35 ], [ %93, %92 ]
  %96 = zext i1 %95 to i32
  ret i32 %96
}

; Function Attrs: nounwind uwtable
define i32 @has_neighbor(i32 %pos, i32 %color) #0 {
  %1 = icmp ult i32 %pos, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %pos to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %pos, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %pos, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2431, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = icmp eq i32 %color, 1
  br i1 %15, label %18, label %16

; <label>:16                                      ; preds = %14
  %17 = icmp eq i32 %color, 2
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %16, %14
  br label %24

; <label>:19                                      ; preds = %16
  %20 = sdiv i32 %pos, 20
  %21 = sub nsw i32 %20, 1
  %22 = srem i32 %pos, 20
  %23 = sub nsw i32 %22, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2432, i8* getelementptr inbounds ([16 x i8]* @.str28, i32 0, i32 0), i32 %21, i32 %23)
  br label %24

; <label>:24                                      ; preds = %19, %18
  %25 = add nsw i32 %pos, 20
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %26
  %28 = load i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp eq i32 %29, %color
  br i1 %30, label %52, label %31

; <label>:31                                      ; preds = %24
  %32 = sub nsw i32 %pos, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %33
  %35 = load i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = icmp eq i32 %36, %color
  br i1 %37, label %52, label %38

; <label>:38                                      ; preds = %31
  %39 = sub nsw i32 %pos, 20
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %40
  %42 = load i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = icmp eq i32 %43, %color
  br i1 %44, label %52, label %45

; <label>:45                                      ; preds = %38
  %46 = add nsw i32 %pos, 1
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %47
  %49 = load i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %50, %color
  br label %52

; <label>:52                                      ; preds = %45, %38, %31, %24
  %53 = phi i1 [ true, %38 ], [ true, %31 ], [ true, %24 ], [ %51, %45 ]
  %54 = zext i1 %53 to i32
  ret i32 %54
}

; Function Attrs: nounwind uwtable
define i32 @same_string(i32 %str1, i32 %str2) #0 {
  %1 = icmp ult i32 %str1, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %str1 to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %str1, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %str1, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2447, i8* getelementptr inbounds ([16 x i8]* @.str29, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = icmp ult i32 %str2, 421
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %14
  %17 = sext i32 %str2 to i64
  %18 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %17
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %16
  br label %28

; <label>:23                                      ; preds = %16, %14
  %24 = sdiv i32 %str2, 20
  %25 = sub nsw i32 %24, 1
  %26 = srem i32 %str2, 20
  %27 = sub nsw i32 %26, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2448, i8* getelementptr inbounds ([16 x i8]* @.str30, i32 0, i32 0), i32 %25, i32 %27)
  br label %28

; <label>:28                                      ; preds = %23, %22
  %29 = sext i32 %str1 to i64
  %30 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %29
  %31 = load i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %40, label %34

; <label>:34                                      ; preds = %28
  %35 = sext i32 %str1 to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp eq i32 %38, 2
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %34, %28
  br label %46

; <label>:41                                      ; preds = %34
  %42 = sdiv i32 %str1, 20
  %43 = sub nsw i32 %42, 1
  %44 = srem i32 %str1, 20
  %45 = sub nsw i32 %44, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2449, i8* getelementptr inbounds ([22 x i8]* @.str31, i32 0, i32 0), i32 %43, i32 %45)
  br label %46

; <label>:46                                      ; preds = %41, %40
  %47 = sext i32 %str2 to i64
  %48 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %47
  %49 = load i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %50, 1
  br i1 %51, label %58, label %52

; <label>:52                                      ; preds = %46
  %53 = sext i32 %str2 to i64
  %54 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %53
  %55 = load i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = icmp eq i32 %56, 2
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %52, %46
  br label %64

; <label>:59                                      ; preds = %52
  %60 = sdiv i32 %str2, 20
  %61 = sub nsw i32 %60, 1
  %62 = srem i32 %str2, 20
  %63 = sub nsw i32 %62, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2450, i8* getelementptr inbounds ([22 x i8]* @.str32, i32 0, i32 0), i32 %61, i32 %63)
  br label %64

; <label>:64                                      ; preds = %59, %58
  %65 = sext i32 %str1 to i64
  %66 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = sext i32 %str2 to i64
  %69 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %68
  %70 = load i32* %69, align 4
  %71 = icmp eq i32 %67, %70
  %72 = zext i1 %71 to i32
  ret i32 %72
}

; Function Attrs: nounwind uwtable
define i32 @adjacent_strings(i32 %str1, i32 %str2) #0 {
  %1 = icmp ult i32 %str1, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %str1 to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %str1, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %str1, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2466, i8* getelementptr inbounds ([16 x i8]* @.str29, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = icmp ult i32 %str2, 421
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %14
  %17 = sext i32 %str2 to i64
  %18 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %17
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %16
  br label %28

; <label>:23                                      ; preds = %16, %14
  %24 = sdiv i32 %str2, 20
  %25 = sub nsw i32 %24, 1
  %26 = srem i32 %str2, 20
  %27 = sub nsw i32 %26, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2467, i8* getelementptr inbounds ([16 x i8]* @.str30, i32 0, i32 0), i32 %25, i32 %27)
  br label %28

; <label>:28                                      ; preds = %23, %22
  %29 = sext i32 %str1 to i64
  %30 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %29
  %31 = load i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %40, label %34

; <label>:34                                      ; preds = %28
  %35 = sext i32 %str1 to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp eq i32 %38, 2
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %34, %28
  br label %46

; <label>:41                                      ; preds = %34
  %42 = sdiv i32 %str1, 20
  %43 = sub nsw i32 %42, 1
  %44 = srem i32 %str1, 20
  %45 = sub nsw i32 %44, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2468, i8* getelementptr inbounds ([22 x i8]* @.str31, i32 0, i32 0), i32 %43, i32 %45)
  br label %46

; <label>:46                                      ; preds = %41, %40
  %47 = sext i32 %str2 to i64
  %48 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %47
  %49 = load i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %50, 1
  br i1 %51, label %58, label %52

; <label>:52                                      ; preds = %46
  %53 = sext i32 %str2 to i64
  %54 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %53
  %55 = load i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = icmp eq i32 %56, 2
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %52, %46
  br label %64

; <label>:59                                      ; preds = %52
  %60 = sdiv i32 %str2, 20
  %61 = sub nsw i32 %60, 1
  %62 = srem i32 %str2, 20
  %63 = sub nsw i32 %62, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2469, i8* getelementptr inbounds ([22 x i8]* @.str32, i32 0, i32 0), i32 %61, i32 %63)
  br label %64

; <label>:64                                      ; preds = %59, %58
  %65 = sext i32 %str1 to i64
  %66 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = sext i32 %str2 to i64
  %69 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %68
  %70 = load i32* %69, align 4
  br label %71

; <label>:71                                      ; preds = %87, %64
  %k.0 = phi i32 [ 0, %64 ], [ %88, %87 ]
  %72 = sext i32 %67 to i64
  %73 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %72
  %74 = getelementptr inbounds %struct.string_data* %73, i32 0, i32 5
  %75 = load i32* %74, align 4
  %76 = icmp slt i32 %k.0, %75
  br i1 %76, label %77, label %89

; <label>:77                                      ; preds = %71
  %78 = sext i32 %k.0 to i64
  %79 = sext i32 %67 to i64
  %80 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %79
  %81 = getelementptr inbounds %struct.string_data* %80, i32 0, i32 6
  %82 = getelementptr inbounds [160 x i32]* %81, i32 0, i64 %78
  %83 = load i32* %82, align 4
  %84 = icmp eq i32 %83, %70
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %77
  br label %90

; <label>:86                                      ; preds = %77
  br label %87

; <label>:87                                      ; preds = %86
  %88 = add nsw i32 %k.0, 1
  br label %71

; <label>:89                                      ; preds = %71
  br label %90

; <label>:90                                      ; preds = %89, %85
  %.0 = phi i32 [ 1, %85 ], [ 0, %89 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @is_ko_point(i32 %pos) #0 {
  %1 = icmp ult i32 %pos, 421
  br i1 %1, label %2, label %9

; <label>:2                                       ; preds = %0
  %3 = sext i32 %pos to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %2
  br label %14

; <label>:9                                       ; preds = %2, %0
  %10 = sdiv i32 %pos, 20
  %11 = sub nsw i32 %10, 1
  %12 = srem i32 %pos, 20
  %13 = sub nsw i32 %12, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2563, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %11, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = sext i32 %pos to i64
  %16 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %15
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %49

; <label>:20                                      ; preds = %14
  %21 = add nsw i32 %pos, 20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %22
  %24 = load i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = icmp ne i32 %25, 3
  br i1 %26, label %27, label %33

; <label>:27                                      ; preds = %20
  %28 = add nsw i32 %pos, 20
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %29
  %31 = load i8* %30, align 1
  %32 = zext i8 %31 to i32
  br label %39

; <label>:33                                      ; preds = %20
  %34 = sub nsw i32 %pos, 20
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  br label %39

; <label>:39                                      ; preds = %33, %27
  %color.0 = phi i32 [ %32, %27 ], [ %38, %33 ]
  %40 = icmp eq i32 %color.0, 1
  br i1 %40, label %43, label %41

; <label>:41                                      ; preds = %39
  %42 = icmp eq i32 %color.0, 2
  br i1 %42, label %43, label %48

; <label>:43                                      ; preds = %41, %39
  %44 = sub nsw i32 3, %color.0
  %45 = call i32 @is_ko(i32 %pos, i32 %44, i32* null)
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %43
  br label %74

; <label>:48                                      ; preds = %43, %41
  br label %73

; <label>:49                                      ; preds = %14
  %50 = sext i32 %pos to i64
  %51 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %50
  %52 = load i32* %51, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %53
  %55 = getelementptr inbounds %struct.string_data* %54, i32 0, i32 3
  %56 = load i32* %55, align 4
  %57 = icmp eq i32 %56, 1
  br i1 %57, label %58, label %72

; <label>:58                                      ; preds = %49
  %59 = getelementptr inbounds %struct.string_data* %54, i32 0, i32 1
  %60 = load i32* %59, align 4
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %62, label %72

; <label>:62                                      ; preds = %58
  %63 = getelementptr inbounds %struct.string_data* %54, i32 0, i32 4
  %64 = getelementptr inbounds [20 x i32]* %63, i32 0, i64 0
  %65 = load i32* %64, align 4
  %66 = getelementptr inbounds %struct.string_data* %54, i32 0, i32 0
  %67 = load i32* %66, align 4
  %68 = sub nsw i32 3, %67
  %69 = call i32 @is_ko(i32 %65, i32 %68, i32* null)
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %62
  br label %74

; <label>:72                                      ; preds = %62, %58, %49
  br label %73

; <label>:73                                      ; preds = %72, %48
  br label %74

; <label>:74                                      ; preds = %73, %71, %47
  %.0 = phi i32 [ 1, %47 ], [ 0, %73 ], [ 1, %71 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @does_capture_something(i32 %pos, i32 %color) #0 {
  %1 = sub nsw i32 3, %color
  %2 = sext i32 %pos to i64
  %3 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %2
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %13

; <label>:8                                       ; preds = %0
  %9 = sdiv i32 %pos, 20
  %10 = sub nsw i32 %9, 1
  %11 = srem i32 %pos, 20
  %12 = sub nsw i32 %11, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2592, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %10, i32 %12)
  br label %13

; <label>:13                                      ; preds = %8, %7
  %14 = add nsw i32 %pos, 20
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %15
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, %1
  br i1 %19, label %20, label %31

; <label>:20                                      ; preds = %13
  %21 = add nsw i32 %pos, 20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %22
  %24 = load i32* %23, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %25
  %27 = getelementptr inbounds %struct.string_data* %26, i32 0, i32 3
  %28 = load i32* %27, align 4
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %20
  br label %86

; <label>:31                                      ; preds = %20, %13
  %32 = sub nsw i32 %pos, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %33
  %35 = load i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = icmp eq i32 %36, %1
  br i1 %37, label %38, label %49

; <label>:38                                      ; preds = %31
  %39 = sub nsw i32 %pos, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %40
  %42 = load i32* %41, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %43
  %45 = getelementptr inbounds %struct.string_data* %44, i32 0, i32 3
  %46 = load i32* %45, align 4
  %47 = icmp eq i32 %46, 1
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %38
  br label %86

; <label>:49                                      ; preds = %38, %31
  %50 = sub nsw i32 %pos, 20
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %51
  %53 = load i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = icmp eq i32 %54, %1
  br i1 %55, label %56, label %67

; <label>:56                                      ; preds = %49
  %57 = sub nsw i32 %pos, 20
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %58
  %60 = load i32* %59, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %61
  %63 = getelementptr inbounds %struct.string_data* %62, i32 0, i32 3
  %64 = load i32* %63, align 4
  %65 = icmp eq i32 %64, 1
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %56
  br label %86

; <label>:67                                      ; preds = %56, %49
  %68 = add nsw i32 %pos, 1
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %69
  %71 = load i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = icmp eq i32 %72, %1
  br i1 %73, label %74, label %85

; <label>:74                                      ; preds = %67
  %75 = add nsw i32 %pos, 1
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %76
  %78 = load i32* %77, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %79
  %81 = getelementptr inbounds %struct.string_data* %80, i32 0, i32 3
  %82 = load i32* %81, align 4
  %83 = icmp eq i32 %82, 1
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %74
  br label %86

; <label>:85                                      ; preds = %74, %67
  br label %86

; <label>:86                                      ; preds = %85, %84, %66, %48, %30
  %.0 = phi i32 [ 1, %30 ], [ 1, %48 ], [ 1, %66 ], [ 1, %84 ], [ 0, %85 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define void @mark_string(i32 %str, i8* %mx, i8 signext %mark) #0 {
  %1 = sext i32 %str to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = sext i32 %str to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %6, %0
  br label %18

; <label>:13                                      ; preds = %6
  %14 = sdiv i32 %str, 20
  %15 = sub nsw i32 %14, 1
  %16 = srem i32 %str, 20
  %17 = sub nsw i32 %16, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2621, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %15, i32 %17)
  br label %18

; <label>:18                                      ; preds = %13, %12
  br label %19

; <label>:19                                      ; preds = %25, %18
  %pos.0 = phi i32 [ %str, %18 ], [ %24, %25 ]
  %20 = sext i32 %pos.0 to i64
  %21 = getelementptr inbounds i8* %mx, i64 %20
  store i8 %mark, i8* %21, align 1
  %22 = sext i32 %pos.0 to i64
  %23 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %22
  %24 = load i32* %23, align 4
  br label %25

; <label>:25                                      ; preds = %19
  %26 = icmp ne i32 %24, %str
  br i1 %26, label %19, label %27

; <label>:27                                      ; preds = %25
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @move_in_stack(i32 %pos, i32 %cutoff) #0 {
  br label %1

; <label>:1                                       ; preds = %11, %0
  %k.0 = phi i32 [ %cutoff, %0 ], [ %12, %11 ]
  %2 = load i32* @stackp, align 4
  %3 = icmp slt i32 %k.0, %2
  br i1 %3, label %4, label %13

; <label>:4                                       ; preds = %1
  %5 = sext i32 %k.0 to i64
  %6 = getelementptr inbounds [361 x i32]* @stack, i32 0, i64 %5
  %7 = load i32* %6, align 4
  %8 = icmp eq i32 %7, %pos
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %4
  br label %14

; <label>:10                                      ; preds = %4
  br label %11

; <label>:11                                      ; preds = %10
  %12 = add nsw i32 %k.0, 1
  br label %1

; <label>:13                                      ; preds = %1
  br label %14

; <label>:14                                      ; preds = %13, %9
  %.0 = phi i32 [ 1, %9 ], [ 0, %13 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define void @get_move_from_stack(i32 %k, i32* %move, i32* %color) #0 {
  %1 = load i32* @stackp, align 4
  %2 = icmp slt i32 %k, %1
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %5

; <label>:4                                       ; preds = %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2649, i8* getelementptr inbounds ([11 x i8]* @.str34, i32 0, i32 0), i32 -1, i32 -1)
  br label %5

; <label>:5                                       ; preds = %4, %3
  %6 = sext i32 %k to i64
  %7 = getelementptr inbounds [361 x i32]* @stack, i32 0, i64 %6
  %8 = load i32* %7, align 4
  store i32 %8, i32* %move, align 4
  %9 = sext i32 %k to i64
  %10 = getelementptr inbounds [361 x i32]* @move_color, i32 0, i64 %9
  %11 = load i32* %10, align 4
  store i32 %11, i32* %color, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @stones_on_board(i32 %color) #0 {
  %1 = load i32* @stackp, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %5

; <label>:4                                       ; preds = %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2666, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 -1, i32 -1)
  br label %5

; <label>:5                                       ; preds = %4, %3
  %6 = load i32* @stones_on_board.stone_count_for_position, align 4
  %7 = load i32* @position_number, align 4
  %8 = icmp ne i32 %6, %7
  br i1 %8, label %9, label %36

; <label>:9                                       ; preds = %5
  store i32 0, i32* @stones_on_board.white_stones, align 4
  store i32 0, i32* @stones_on_board.black_stones, align 4
  br label %10

; <label>:10                                      ; preds = %32, %9
  %pos.0 = phi i32 [ 21, %9 ], [ %33, %32 ]
  %11 = icmp slt i32 %pos.0, 400
  br i1 %11, label %12, label %34

; <label>:12                                      ; preds = %10
  %13 = sext i32 %pos.0 to i64
  %14 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %13
  %15 = load i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = icmp eq i32 %16, 1
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %12
  %19 = load i32* @stones_on_board.white_stones, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* @stones_on_board.white_stones, align 4
  br label %31

; <label>:21                                      ; preds = %12
  %22 = sext i32 %pos.0 to i64
  %23 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %22
  %24 = load i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = icmp eq i32 %25, 2
  br i1 %26, label %27, label %30

; <label>:27                                      ; preds = %21
  %28 = load i32* @stones_on_board.black_stones, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* @stones_on_board.black_stones, align 4
  br label %30

; <label>:30                                      ; preds = %27, %21
  br label %31

; <label>:31                                      ; preds = %30, %18
  br label %32

; <label>:32                                      ; preds = %31
  %33 = add nsw i32 %pos.0, 1
  br label %10

; <label>:34                                      ; preds = %10
  %35 = load i32* @position_number, align 4
  store i32 %35, i32* @stones_on_board.stone_count_for_position, align 4
  br label %36

; <label>:36                                      ; preds = %34, %5
  %37 = and i32 %color, 2
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %41

; <label>:39                                      ; preds = %36
  %40 = load i32* @stones_on_board.black_stones, align 4
  br label %42

; <label>:41                                      ; preds = %36
  br label %42

; <label>:42                                      ; preds = %41, %39
  %43 = phi i32 [ %40, %39 ], [ 0, %41 ]
  %44 = and i32 %color, 1
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %48

; <label>:46                                      ; preds = %42
  %47 = load i32* @stones_on_board.white_stones, align 4
  br label %49

; <label>:48                                      ; preds = %42
  br label %49

; <label>:49                                      ; preds = %48, %46
  %50 = phi i32 [ %47, %46 ], [ 0, %48 ]
  %51 = add nsw i32 %43, %50
  ret i32 %51
}

; Function Attrs: nounwind uwtable
define void @reset_trymove_counter() #0 {
  store i32 0, i32* @trymove_counter, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @get_trymove_counter() #0 {
  %1 = load i32* @trymove_counter, align 4
  ret i32 %1
}

; Function Attrs: nounwind uwtable
define void @incremental_order_moves(i32 %move, i32 %color, i32 %str, i32* %number_edges, i32* %number_same_string, i32* %number_own, i32* %number_opponent, i32* %captured_stones, i32* %threatened_stones, i32* %saved_stones, i32* %number_open) #0 {
  %1 = load i32* @string_mark, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, i32* @string_mark, align 4
  %3 = add nsw i32 %move, 20
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %4
  %6 = load i8* %5, align 1
  %7 = zext i8 %6 to i32
  %8 = icmp ne i32 %7, 3
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %0
  %10 = load i32* %number_edges, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %number_edges, align 4
  br label %135

; <label>:12                                      ; preds = %0
  %13 = add nsw i32 %move, 20
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %14
  %16 = load i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %22

; <label>:19                                      ; preds = %12
  %20 = load i32* %number_open, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %number_open, align 4
  br label %134

; <label>:22                                      ; preds = %12
  %23 = add nsw i32 %move, 20
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %24
  %26 = load i32* %25, align 4
  %27 = sext i32 %str to i64
  %28 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %27
  %29 = load i32* %28, align 4
  %30 = icmp eq i32 %29, %26
  br i1 %30, label %31, label %34

; <label>:31                                      ; preds = %22
  %32 = load i32* %number_same_string, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %number_same_string, align 4
  br label %34

; <label>:34                                      ; preds = %31, %22
  %35 = add nsw i32 %move, 20
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %36
  %38 = load i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = icmp eq i32 %39, %color
  br i1 %40, label %41, label %57

; <label>:41                                      ; preds = %34
  %42 = load i32* %number_own, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %number_own, align 4
  %44 = sext i32 %26 to i64
  %45 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %44
  %46 = getelementptr inbounds %struct.string_data* %45, i32 0, i32 3
  %47 = load i32* %46, align 4
  %48 = icmp eq i32 %47, 1
  br i1 %48, label %49, label %56

; <label>:49                                      ; preds = %41
  %50 = sext i32 %26 to i64
  %51 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %50
  %52 = getelementptr inbounds %struct.string_data* %51, i32 0, i32 1
  %53 = load i32* %52, align 4
  %54 = load i32* %saved_stones, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, i32* %saved_stones, align 4
  br label %56

; <label>:56                                      ; preds = %49, %41
  br label %133

; <label>:57                                      ; preds = %34
  %58 = load i32* %number_opponent, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %number_opponent, align 4
  %60 = sext i32 %26 to i64
  %61 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %60
  %62 = getelementptr inbounds %struct.string_data* %61, i32 0, i32 3
  %63 = load i32* %62, align 4
  %64 = icmp eq i32 %63, 1
  br i1 %64, label %65, label %99

; <label>:65                                      ; preds = %57
  %66 = sext i32 %26 to i64
  %67 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %66
  %68 = getelementptr inbounds %struct.string_data* %67, i32 0, i32 1
  %69 = load i32* %68, align 4
  %70 = load i32* %captured_stones, align 4
  %71 = add nsw i32 %70, %69
  store i32 %71, i32* %captured_stones, align 4
  br label %72

; <label>:72                                      ; preds = %96, %65
  %r.0 = phi i32 [ 0, %65 ], [ %97, %96 ]
  %73 = sext i32 %26 to i64
  %74 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %73
  %75 = getelementptr inbounds %struct.string_data* %74, i32 0, i32 5
  %76 = load i32* %75, align 4
  %77 = icmp slt i32 %r.0, %76
  br i1 %77, label %78, label %98

; <label>:78                                      ; preds = %72
  %79 = sext i32 %r.0 to i64
  %80 = sext i32 %26 to i64
  %81 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %80
  %82 = getelementptr inbounds %struct.string_data* %81, i32 0, i32 6
  %83 = getelementptr inbounds [160 x i32]* %82, i32 0, i64 %79
  %84 = load i32* %83, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %85
  %87 = getelementptr inbounds %struct.string_data* %86, i32 0, i32 3
  %88 = load i32* %87, align 4
  %89 = icmp eq i32 %88, 1
  br i1 %89, label %90, label %95

; <label>:90                                      ; preds = %78
  %91 = getelementptr inbounds %struct.string_data* %86, i32 0, i32 1
  %92 = load i32* %91, align 4
  %93 = load i32* %saved_stones, align 4
  %94 = add nsw i32 %93, %92
  store i32 %94, i32* %saved_stones, align 4
  br label %95

; <label>:95                                      ; preds = %90, %78
  br label %96

; <label>:96                                      ; preds = %95
  %97 = add nsw i32 %r.0, 1
  br label %72

; <label>:98                                      ; preds = %72
  br label %132

; <label>:99                                      ; preds = %57
  %100 = sext i32 %26 to i64
  %101 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %100
  %102 = getelementptr inbounds %struct.string_data* %101, i32 0, i32 3
  %103 = load i32* %102, align 4
  %104 = icmp eq i32 %103, 2
  br i1 %104, label %105, label %131

; <label>:105                                     ; preds = %99
  %106 = add nsw i32 %move, 20
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %107
  %109 = load i32* %108, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %110
  %112 = getelementptr inbounds %struct.string_data* %111, i32 0, i32 7
  %113 = load i32* %112, align 4
  %114 = load i32* @string_mark, align 4
  %115 = icmp ne i32 %113, %114
  br i1 %115, label %116, label %131

; <label>:116                                     ; preds = %105
  %117 = sext i32 %26 to i64
  %118 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %117
  %119 = getelementptr inbounds %struct.string_data* %118, i32 0, i32 1
  %120 = load i32* %119, align 4
  %121 = load i32* %threatened_stones, align 4
  %122 = add nsw i32 %121, %120
  store i32 %122, i32* %threatened_stones, align 4
  %123 = load i32* @string_mark, align 4
  %124 = add nsw i32 %move, 20
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %125
  %127 = load i32* %126, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %128
  %130 = getelementptr inbounds %struct.string_data* %129, i32 0, i32 7
  store i32 %123, i32* %130, align 4
  br label %131

; <label>:131                                     ; preds = %116, %105, %99
  br label %132

; <label>:132                                     ; preds = %131, %98
  br label %133

; <label>:133                                     ; preds = %132, %56
  br label %134

; <label>:134                                     ; preds = %133, %19
  br label %135

; <label>:135                                     ; preds = %134, %9
  %136 = sub nsw i32 %move, 1
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %137
  %139 = load i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = icmp ne i32 %140, 3
  br i1 %141, label %145, label %142

; <label>:142                                     ; preds = %135
  %143 = load i32* %number_edges, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* %number_edges, align 4
  br label %268

; <label>:145                                     ; preds = %135
  %146 = sub nsw i32 %move, 1
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %147
  %149 = load i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = icmp eq i32 %150, 0
  br i1 %151, label %152, label %155

; <label>:152                                     ; preds = %145
  %153 = load i32* %number_open, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, i32* %number_open, align 4
  br label %267

; <label>:155                                     ; preds = %145
  %156 = sub nsw i32 %move, 1
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %157
  %159 = load i32* %158, align 4
  %160 = sext i32 %str to i64
  %161 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %160
  %162 = load i32* %161, align 4
  %163 = icmp eq i32 %162, %159
  br i1 %163, label %164, label %167

; <label>:164                                     ; preds = %155
  %165 = load i32* %number_same_string, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %number_same_string, align 4
  br label %167

; <label>:167                                     ; preds = %164, %155
  %168 = sub nsw i32 %move, 1
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %169
  %171 = load i8* %170, align 1
  %172 = zext i8 %171 to i32
  %173 = icmp eq i32 %172, %color
  br i1 %173, label %174, label %190

; <label>:174                                     ; preds = %167
  %175 = load i32* %number_own, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, i32* %number_own, align 4
  %177 = sext i32 %159 to i64
  %178 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %177
  %179 = getelementptr inbounds %struct.string_data* %178, i32 0, i32 3
  %180 = load i32* %179, align 4
  %181 = icmp eq i32 %180, 1
  br i1 %181, label %182, label %189

; <label>:182                                     ; preds = %174
  %183 = sext i32 %159 to i64
  %184 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %183
  %185 = getelementptr inbounds %struct.string_data* %184, i32 0, i32 1
  %186 = load i32* %185, align 4
  %187 = load i32* %saved_stones, align 4
  %188 = add nsw i32 %187, %186
  store i32 %188, i32* %saved_stones, align 4
  br label %189

; <label>:189                                     ; preds = %182, %174
  br label %266

; <label>:190                                     ; preds = %167
  %191 = load i32* %number_opponent, align 4
  %192 = add nsw i32 %191, 1
  store i32 %192, i32* %number_opponent, align 4
  %193 = sext i32 %159 to i64
  %194 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %193
  %195 = getelementptr inbounds %struct.string_data* %194, i32 0, i32 3
  %196 = load i32* %195, align 4
  %197 = icmp eq i32 %196, 1
  br i1 %197, label %198, label %232

; <label>:198                                     ; preds = %190
  %199 = sext i32 %159 to i64
  %200 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %199
  %201 = getelementptr inbounds %struct.string_data* %200, i32 0, i32 1
  %202 = load i32* %201, align 4
  %203 = load i32* %captured_stones, align 4
  %204 = add nsw i32 %203, %202
  store i32 %204, i32* %captured_stones, align 4
  br label %205

; <label>:205                                     ; preds = %229, %198
  %r2.0 = phi i32 [ 0, %198 ], [ %230, %229 ]
  %206 = sext i32 %159 to i64
  %207 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %206
  %208 = getelementptr inbounds %struct.string_data* %207, i32 0, i32 5
  %209 = load i32* %208, align 4
  %210 = icmp slt i32 %r2.0, %209
  br i1 %210, label %211, label %231

; <label>:211                                     ; preds = %205
  %212 = sext i32 %r2.0 to i64
  %213 = sext i32 %159 to i64
  %214 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %213
  %215 = getelementptr inbounds %struct.string_data* %214, i32 0, i32 6
  %216 = getelementptr inbounds [160 x i32]* %215, i32 0, i64 %212
  %217 = load i32* %216, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %218
  %220 = getelementptr inbounds %struct.string_data* %219, i32 0, i32 3
  %221 = load i32* %220, align 4
  %222 = icmp eq i32 %221, 1
  br i1 %222, label %223, label %228

; <label>:223                                     ; preds = %211
  %224 = getelementptr inbounds %struct.string_data* %219, i32 0, i32 1
  %225 = load i32* %224, align 4
  %226 = load i32* %saved_stones, align 4
  %227 = add nsw i32 %226, %225
  store i32 %227, i32* %saved_stones, align 4
  br label %228

; <label>:228                                     ; preds = %223, %211
  br label %229

; <label>:229                                     ; preds = %228
  %230 = add nsw i32 %r2.0, 1
  br label %205

; <label>:231                                     ; preds = %205
  br label %265

; <label>:232                                     ; preds = %190
  %233 = sext i32 %159 to i64
  %234 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %233
  %235 = getelementptr inbounds %struct.string_data* %234, i32 0, i32 3
  %236 = load i32* %235, align 4
  %237 = icmp eq i32 %236, 2
  br i1 %237, label %238, label %264

; <label>:238                                     ; preds = %232
  %239 = sub nsw i32 %move, 1
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %240
  %242 = load i32* %241, align 4
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %243
  %245 = getelementptr inbounds %struct.string_data* %244, i32 0, i32 7
  %246 = load i32* %245, align 4
  %247 = load i32* @string_mark, align 4
  %248 = icmp ne i32 %246, %247
  br i1 %248, label %249, label %264

; <label>:249                                     ; preds = %238
  %250 = sext i32 %159 to i64
  %251 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %250
  %252 = getelementptr inbounds %struct.string_data* %251, i32 0, i32 1
  %253 = load i32* %252, align 4
  %254 = load i32* %threatened_stones, align 4
  %255 = add nsw i32 %254, %253
  store i32 %255, i32* %threatened_stones, align 4
  %256 = load i32* @string_mark, align 4
  %257 = sub nsw i32 %move, 1
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %258
  %260 = load i32* %259, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %261
  %263 = getelementptr inbounds %struct.string_data* %262, i32 0, i32 7
  store i32 %256, i32* %263, align 4
  br label %264

; <label>:264                                     ; preds = %249, %238, %232
  br label %265

; <label>:265                                     ; preds = %264, %231
  br label %266

; <label>:266                                     ; preds = %265, %189
  br label %267

; <label>:267                                     ; preds = %266, %152
  br label %268

; <label>:268                                     ; preds = %267, %142
  %269 = sub nsw i32 %move, 20
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %270
  %272 = load i8* %271, align 1
  %273 = zext i8 %272 to i32
  %274 = icmp ne i32 %273, 3
  br i1 %274, label %278, label %275

; <label>:275                                     ; preds = %268
  %276 = load i32* %number_edges, align 4
  %277 = add nsw i32 %276, 1
  store i32 %277, i32* %number_edges, align 4
  br label %401

; <label>:278                                     ; preds = %268
  %279 = sub nsw i32 %move, 20
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %280
  %282 = load i8* %281, align 1
  %283 = zext i8 %282 to i32
  %284 = icmp eq i32 %283, 0
  br i1 %284, label %285, label %288

; <label>:285                                     ; preds = %278
  %286 = load i32* %number_open, align 4
  %287 = add nsw i32 %286, 1
  store i32 %287, i32* %number_open, align 4
  br label %400

; <label>:288                                     ; preds = %278
  %289 = sub nsw i32 %move, 20
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %290
  %292 = load i32* %291, align 4
  %293 = sext i32 %str to i64
  %294 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %293
  %295 = load i32* %294, align 4
  %296 = icmp eq i32 %295, %292
  br i1 %296, label %297, label %300

; <label>:297                                     ; preds = %288
  %298 = load i32* %number_same_string, align 4
  %299 = add nsw i32 %298, 1
  store i32 %299, i32* %number_same_string, align 4
  br label %300

; <label>:300                                     ; preds = %297, %288
  %301 = sub nsw i32 %move, 20
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %302
  %304 = load i8* %303, align 1
  %305 = zext i8 %304 to i32
  %306 = icmp eq i32 %305, %color
  br i1 %306, label %307, label %323

; <label>:307                                     ; preds = %300
  %308 = load i32* %number_own, align 4
  %309 = add nsw i32 %308, 1
  store i32 %309, i32* %number_own, align 4
  %310 = sext i32 %292 to i64
  %311 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %310
  %312 = getelementptr inbounds %struct.string_data* %311, i32 0, i32 3
  %313 = load i32* %312, align 4
  %314 = icmp eq i32 %313, 1
  br i1 %314, label %315, label %322

; <label>:315                                     ; preds = %307
  %316 = sext i32 %292 to i64
  %317 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %316
  %318 = getelementptr inbounds %struct.string_data* %317, i32 0, i32 1
  %319 = load i32* %318, align 4
  %320 = load i32* %saved_stones, align 4
  %321 = add nsw i32 %320, %319
  store i32 %321, i32* %saved_stones, align 4
  br label %322

; <label>:322                                     ; preds = %315, %307
  br label %399

; <label>:323                                     ; preds = %300
  %324 = load i32* %number_opponent, align 4
  %325 = add nsw i32 %324, 1
  store i32 %325, i32* %number_opponent, align 4
  %326 = sext i32 %292 to i64
  %327 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %326
  %328 = getelementptr inbounds %struct.string_data* %327, i32 0, i32 3
  %329 = load i32* %328, align 4
  %330 = icmp eq i32 %329, 1
  br i1 %330, label %331, label %365

; <label>:331                                     ; preds = %323
  %332 = sext i32 %292 to i64
  %333 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %332
  %334 = getelementptr inbounds %struct.string_data* %333, i32 0, i32 1
  %335 = load i32* %334, align 4
  %336 = load i32* %captured_stones, align 4
  %337 = add nsw i32 %336, %335
  store i32 %337, i32* %captured_stones, align 4
  br label %338

; <label>:338                                     ; preds = %362, %331
  %r5.0 = phi i32 [ 0, %331 ], [ %363, %362 ]
  %339 = sext i32 %292 to i64
  %340 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %339
  %341 = getelementptr inbounds %struct.string_data* %340, i32 0, i32 5
  %342 = load i32* %341, align 4
  %343 = icmp slt i32 %r5.0, %342
  br i1 %343, label %344, label %364

; <label>:344                                     ; preds = %338
  %345 = sext i32 %r5.0 to i64
  %346 = sext i32 %292 to i64
  %347 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %346
  %348 = getelementptr inbounds %struct.string_data* %347, i32 0, i32 6
  %349 = getelementptr inbounds [160 x i32]* %348, i32 0, i64 %345
  %350 = load i32* %349, align 4
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %351
  %353 = getelementptr inbounds %struct.string_data* %352, i32 0, i32 3
  %354 = load i32* %353, align 4
  %355 = icmp eq i32 %354, 1
  br i1 %355, label %356, label %361

; <label>:356                                     ; preds = %344
  %357 = getelementptr inbounds %struct.string_data* %352, i32 0, i32 1
  %358 = load i32* %357, align 4
  %359 = load i32* %saved_stones, align 4
  %360 = add nsw i32 %359, %358
  store i32 %360, i32* %saved_stones, align 4
  br label %361

; <label>:361                                     ; preds = %356, %344
  br label %362

; <label>:362                                     ; preds = %361
  %363 = add nsw i32 %r5.0, 1
  br label %338

; <label>:364                                     ; preds = %338
  br label %398

; <label>:365                                     ; preds = %323
  %366 = sext i32 %292 to i64
  %367 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %366
  %368 = getelementptr inbounds %struct.string_data* %367, i32 0, i32 3
  %369 = load i32* %368, align 4
  %370 = icmp eq i32 %369, 2
  br i1 %370, label %371, label %397

; <label>:371                                     ; preds = %365
  %372 = sub nsw i32 %move, 20
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %373
  %375 = load i32* %374, align 4
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %376
  %378 = getelementptr inbounds %struct.string_data* %377, i32 0, i32 7
  %379 = load i32* %378, align 4
  %380 = load i32* @string_mark, align 4
  %381 = icmp ne i32 %379, %380
  br i1 %381, label %382, label %397

; <label>:382                                     ; preds = %371
  %383 = sext i32 %292 to i64
  %384 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %383
  %385 = getelementptr inbounds %struct.string_data* %384, i32 0, i32 1
  %386 = load i32* %385, align 4
  %387 = load i32* %threatened_stones, align 4
  %388 = add nsw i32 %387, %386
  store i32 %388, i32* %threatened_stones, align 4
  %389 = load i32* @string_mark, align 4
  %390 = sub nsw i32 %move, 20
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %391
  %393 = load i32* %392, align 4
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %394
  %396 = getelementptr inbounds %struct.string_data* %395, i32 0, i32 7
  store i32 %389, i32* %396, align 4
  br label %397

; <label>:397                                     ; preds = %382, %371, %365
  br label %398

; <label>:398                                     ; preds = %397, %364
  br label %399

; <label>:399                                     ; preds = %398, %322
  br label %400

; <label>:400                                     ; preds = %399, %285
  br label %401

; <label>:401                                     ; preds = %400, %275
  %402 = add nsw i32 %move, 1
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %403
  %405 = load i8* %404, align 1
  %406 = zext i8 %405 to i32
  %407 = icmp ne i32 %406, 3
  br i1 %407, label %411, label %408

; <label>:408                                     ; preds = %401
  %409 = load i32* %number_edges, align 4
  %410 = add nsw i32 %409, 1
  store i32 %410, i32* %number_edges, align 4
  br label %534

; <label>:411                                     ; preds = %401
  %412 = add nsw i32 %move, 1
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %413
  %415 = load i8* %414, align 1
  %416 = zext i8 %415 to i32
  %417 = icmp eq i32 %416, 0
  br i1 %417, label %418, label %421

; <label>:418                                     ; preds = %411
  %419 = load i32* %number_open, align 4
  %420 = add nsw i32 %419, 1
  store i32 %420, i32* %number_open, align 4
  br label %533

; <label>:421                                     ; preds = %411
  %422 = add nsw i32 %move, 1
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %423
  %425 = load i32* %424, align 4
  %426 = sext i32 %str to i64
  %427 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %426
  %428 = load i32* %427, align 4
  %429 = icmp eq i32 %428, %425
  br i1 %429, label %430, label %433

; <label>:430                                     ; preds = %421
  %431 = load i32* %number_same_string, align 4
  %432 = add nsw i32 %431, 1
  store i32 %432, i32* %number_same_string, align 4
  br label %433

; <label>:433                                     ; preds = %430, %421
  %434 = add nsw i32 %move, 1
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %435
  %437 = load i8* %436, align 1
  %438 = zext i8 %437 to i32
  %439 = icmp eq i32 %438, %color
  br i1 %439, label %440, label %456

; <label>:440                                     ; preds = %433
  %441 = load i32* %number_own, align 4
  %442 = add nsw i32 %441, 1
  store i32 %442, i32* %number_own, align 4
  %443 = sext i32 %425 to i64
  %444 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %443
  %445 = getelementptr inbounds %struct.string_data* %444, i32 0, i32 3
  %446 = load i32* %445, align 4
  %447 = icmp eq i32 %446, 1
  br i1 %447, label %448, label %455

; <label>:448                                     ; preds = %440
  %449 = sext i32 %425 to i64
  %450 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %449
  %451 = getelementptr inbounds %struct.string_data* %450, i32 0, i32 1
  %452 = load i32* %451, align 4
  %453 = load i32* %saved_stones, align 4
  %454 = add nsw i32 %453, %452
  store i32 %454, i32* %saved_stones, align 4
  br label %455

; <label>:455                                     ; preds = %448, %440
  br label %532

; <label>:456                                     ; preds = %433
  %457 = load i32* %number_opponent, align 4
  %458 = add nsw i32 %457, 1
  store i32 %458, i32* %number_opponent, align 4
  %459 = sext i32 %425 to i64
  %460 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %459
  %461 = getelementptr inbounds %struct.string_data* %460, i32 0, i32 3
  %462 = load i32* %461, align 4
  %463 = icmp eq i32 %462, 1
  br i1 %463, label %464, label %498

; <label>:464                                     ; preds = %456
  %465 = sext i32 %425 to i64
  %466 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %465
  %467 = getelementptr inbounds %struct.string_data* %466, i32 0, i32 1
  %468 = load i32* %467, align 4
  %469 = load i32* %captured_stones, align 4
  %470 = add nsw i32 %469, %468
  store i32 %470, i32* %captured_stones, align 4
  br label %471

; <label>:471                                     ; preds = %495, %464
  %r8.0 = phi i32 [ 0, %464 ], [ %496, %495 ]
  %472 = sext i32 %425 to i64
  %473 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %472
  %474 = getelementptr inbounds %struct.string_data* %473, i32 0, i32 5
  %475 = load i32* %474, align 4
  %476 = icmp slt i32 %r8.0, %475
  br i1 %476, label %477, label %497

; <label>:477                                     ; preds = %471
  %478 = sext i32 %r8.0 to i64
  %479 = sext i32 %425 to i64
  %480 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %479
  %481 = getelementptr inbounds %struct.string_data* %480, i32 0, i32 6
  %482 = getelementptr inbounds [160 x i32]* %481, i32 0, i64 %478
  %483 = load i32* %482, align 4
  %484 = sext i32 %483 to i64
  %485 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %484
  %486 = getelementptr inbounds %struct.string_data* %485, i32 0, i32 3
  %487 = load i32* %486, align 4
  %488 = icmp eq i32 %487, 1
  br i1 %488, label %489, label %494

; <label>:489                                     ; preds = %477
  %490 = getelementptr inbounds %struct.string_data* %485, i32 0, i32 1
  %491 = load i32* %490, align 4
  %492 = load i32* %saved_stones, align 4
  %493 = add nsw i32 %492, %491
  store i32 %493, i32* %saved_stones, align 4
  br label %494

; <label>:494                                     ; preds = %489, %477
  br label %495

; <label>:495                                     ; preds = %494
  %496 = add nsw i32 %r8.0, 1
  br label %471

; <label>:497                                     ; preds = %471
  br label %531

; <label>:498                                     ; preds = %456
  %499 = sext i32 %425 to i64
  %500 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %499
  %501 = getelementptr inbounds %struct.string_data* %500, i32 0, i32 3
  %502 = load i32* %501, align 4
  %503 = icmp eq i32 %502, 2
  br i1 %503, label %504, label %530

; <label>:504                                     ; preds = %498
  %505 = add nsw i32 %move, 1
  %506 = sext i32 %505 to i64
  %507 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %506
  %508 = load i32* %507, align 4
  %509 = sext i32 %508 to i64
  %510 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %509
  %511 = getelementptr inbounds %struct.string_data* %510, i32 0, i32 7
  %512 = load i32* %511, align 4
  %513 = load i32* @string_mark, align 4
  %514 = icmp ne i32 %512, %513
  br i1 %514, label %515, label %530

; <label>:515                                     ; preds = %504
  %516 = sext i32 %425 to i64
  %517 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %516
  %518 = getelementptr inbounds %struct.string_data* %517, i32 0, i32 1
  %519 = load i32* %518, align 4
  %520 = load i32* %threatened_stones, align 4
  %521 = add nsw i32 %520, %519
  store i32 %521, i32* %threatened_stones, align 4
  %522 = load i32* @string_mark, align 4
  %523 = add nsw i32 %move, 1
  %524 = sext i32 %523 to i64
  %525 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %524
  %526 = load i32* %525, align 4
  %527 = sext i32 %526 to i64
  %528 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %527
  %529 = getelementptr inbounds %struct.string_data* %528, i32 0, i32 7
  store i32 %522, i32* %529, align 4
  br label %530

; <label>:530                                     ; preds = %515, %504, %498
  br label %531

; <label>:531                                     ; preds = %530, %497
  br label %532

; <label>:532                                     ; preds = %531, %455
  br label %533

; <label>:533                                     ; preds = %532, %418
  br label %534

; <label>:534                                     ; preds = %533, %408
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @propagate_string(i32 %stone, i32 %str) #0 {
  %1 = icmp eq i32 %stone, %str
  br i1 %1, label %2, label %5

; <label>:2                                       ; preds = %0
  %3 = sext i32 %stone to i64
  %4 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %3
  store i32 %stone, i32* %4, align 4
  br label %18

; <label>:5                                       ; preds = %0
  %6 = sext i32 %str to i64
  %7 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %6
  %8 = load i32* %7, align 4
  %9 = sext i32 %stone to i64
  %10 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %9
  store i32 %8, i32* %10, align 4
  %11 = sext i32 %str to i64
  %12 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %11
  %13 = load i32* %12, align 4
  %14 = sext i32 %stone to i64
  %15 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %14
  store i32 %13, i32* %15, align 4
  %16 = sext i32 %str to i64
  %17 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %16
  store i32 %stone, i32* %17, align 4
  br label %18

; <label>:18                                      ; preds = %5, %2
  br label %19

; <label>:19                                      ; preds = %53, %18
  %size.0 = phi i32 [ 1, %18 ], [ %size.1, %53 ]
  %k.0 = phi i32 [ 0, %18 ], [ %54, %53 ]
  %20 = icmp slt i32 %k.0, 4
  br i1 %20, label %21, label %55

; <label>:21                                      ; preds = %19
  %22 = sext i32 %k.0 to i64
  %23 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %22
  %24 = load i32* %23, align 4
  %25 = add nsw i32 %stone, %24
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %26
  %28 = load i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp ne i32 %29, 3
  br i1 %30, label %31, label %52

; <label>:31                                      ; preds = %21
  %32 = add nsw i32 %stone, %24
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %33
  %35 = load i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = sext i32 %stone to i64
  %38 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %37
  %39 = load i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = icmp eq i32 %36, %40
  br i1 %41, label %42, label %52

; <label>:42                                      ; preds = %31
  %43 = add nsw i32 %stone, %24
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %44
  %46 = load i32* %45, align 4
  %47 = icmp eq i32 %46, -1
  br i1 %47, label %48, label %52

; <label>:48                                      ; preds = %42
  %49 = add nsw i32 %stone, %24
  %50 = call i32 @propagate_string(i32 %49, i32 %str)
  %51 = add nsw i32 %size.0, %50
  br label %52

; <label>:52                                      ; preds = %48, %42, %31, %21
  %size.1 = phi i32 [ %51, %48 ], [ %size.0, %42 ], [ %size.0, %31 ], [ %size.0, %21 ]
  br label %53

; <label>:53                                      ; preds = %52
  %54 = add nsw i32 %k.0, 1
  br label %19

; <label>:55                                      ; preds = %19
  ret i32 %size.0
}

; Function Attrs: nounwind uwtable
define internal void @find_liberties_and_neighbors(i32 %s) #0 {
  %1 = sext i32 %s to i64
  %2 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1
  %3 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = sub nsw i32 3, %4
  %6 = load i32* @liberty_mark, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* @liberty_mark, align 4
  %8 = load i32* @string_mark, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* @string_mark, align 4
  %10 = sext i32 %s to i64
  %11 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %10
  %12 = getelementptr inbounds %struct.string_data* %11, i32 0, i32 2
  %13 = load i32* %12, align 4
  br label %14

; <label>:14                                      ; preds = %358, %0
  %pos.0 = phi i32 [ %13, %0 ], [ %357, %358 ]
  %15 = add nsw i32 %pos.0, 20
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %16
  %18 = load i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %57

; <label>:21                                      ; preds = %14
  %22 = add nsw i32 %pos.0, 20
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %23
  %25 = load i32* %24, align 4
  %26 = load i32* @liberty_mark, align 4
  %27 = icmp ne i32 %25, %26
  br i1 %27, label %28, label %57

; <label>:28                                      ; preds = %21
  br label %29

; <label>:29                                      ; preds = %28
  %30 = sext i32 %s to i64
  %31 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %30
  %32 = getelementptr inbounds %struct.string_data* %31, i32 0, i32 3
  %33 = load i32* %32, align 4
  %34 = icmp slt i32 %33, 20
  br i1 %34, label %35, label %46

; <label>:35                                      ; preds = %29
  %36 = add nsw i32 %pos.0, 20
  %37 = sext i32 %s to i64
  %38 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %37
  %39 = getelementptr inbounds %struct.string_data* %38, i32 0, i32 3
  %40 = load i32* %39, align 4
  %41 = sext i32 %40 to i64
  %42 = sext i32 %s to i64
  %43 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %42
  %44 = getelementptr inbounds %struct.string_data* %43, i32 0, i32 4
  %45 = getelementptr inbounds [20 x i32]* %44, i32 0, i64 %41
  store i32 %36, i32* %45, align 4
  br label %46

; <label>:46                                      ; preds = %35, %29
  %47 = sext i32 %s to i64
  %48 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %47
  %49 = getelementptr inbounds %struct.string_data* %48, i32 0, i32 3
  %50 = load i32* %49, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %49, align 4
  %52 = load i32* @liberty_mark, align 4
  %53 = add nsw i32 %pos.0, 20
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %54
  store i32 %52, i32* %55, align 4
  br label %56

; <label>:56                                      ; preds = %46
  br label %99

; <label>:57                                      ; preds = %21, %14
  %58 = add nsw i32 %pos.0, 20
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %59
  %61 = load i8* %60, align 1
  %62 = zext i8 %61 to i32
  %63 = icmp eq i32 %62, %5
  br i1 %63, label %64, label %98

; <label>:64                                      ; preds = %57
  %65 = add nsw i32 %pos.0, 20
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %66
  %68 = load i32* %67, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %69
  %71 = getelementptr inbounds %struct.string_data* %70, i32 0, i32 7
  %72 = load i32* %71, align 4
  %73 = load i32* @string_mark, align 4
  %74 = icmp ne i32 %72, %73
  br i1 %74, label %75, label %98

; <label>:75                                      ; preds = %64
  %76 = add nsw i32 %pos.0, 20
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %77
  %79 = load i32* %78, align 4
  %80 = sext i32 %s to i64
  %81 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %80
  %82 = getelementptr inbounds %struct.string_data* %81, i32 0, i32 5
  %83 = load i32* %82, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %82, align 4
  %85 = sext i32 %83 to i64
  %86 = sext i32 %s to i64
  %87 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %86
  %88 = getelementptr inbounds %struct.string_data* %87, i32 0, i32 6
  %89 = getelementptr inbounds [160 x i32]* %88, i32 0, i64 %85
  store i32 %79, i32* %89, align 4
  %90 = load i32* @string_mark, align 4
  %91 = add nsw i32 %pos.0, 20
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %92
  %94 = load i32* %93, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %95
  %97 = getelementptr inbounds %struct.string_data* %96, i32 0, i32 7
  store i32 %90, i32* %97, align 4
  br label %98

; <label>:98                                      ; preds = %75, %64, %57
  br label %99

; <label>:99                                      ; preds = %98, %56
  %100 = sub nsw i32 %pos.0, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %101
  %103 = load i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %106, label %142

; <label>:106                                     ; preds = %99
  %107 = sub nsw i32 %pos.0, 1
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %108
  %110 = load i32* %109, align 4
  %111 = load i32* @liberty_mark, align 4
  %112 = icmp ne i32 %110, %111
  br i1 %112, label %113, label %142

; <label>:113                                     ; preds = %106
  br label %114

; <label>:114                                     ; preds = %113
  %115 = sext i32 %s to i64
  %116 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %115
  %117 = getelementptr inbounds %struct.string_data* %116, i32 0, i32 3
  %118 = load i32* %117, align 4
  %119 = icmp slt i32 %118, 20
  br i1 %119, label %120, label %131

; <label>:120                                     ; preds = %114
  %121 = sub nsw i32 %pos.0, 1
  %122 = sext i32 %s to i64
  %123 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %122
  %124 = getelementptr inbounds %struct.string_data* %123, i32 0, i32 3
  %125 = load i32* %124, align 4
  %126 = sext i32 %125 to i64
  %127 = sext i32 %s to i64
  %128 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %127
  %129 = getelementptr inbounds %struct.string_data* %128, i32 0, i32 4
  %130 = getelementptr inbounds [20 x i32]* %129, i32 0, i64 %126
  store i32 %121, i32* %130, align 4
  br label %131

; <label>:131                                     ; preds = %120, %114
  %132 = sext i32 %s to i64
  %133 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %132
  %134 = getelementptr inbounds %struct.string_data* %133, i32 0, i32 3
  %135 = load i32* %134, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, i32* %134, align 4
  %137 = load i32* @liberty_mark, align 4
  %138 = sub nsw i32 %pos.0, 1
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %139
  store i32 %137, i32* %140, align 4
  br label %141

; <label>:141                                     ; preds = %131
  br label %184

; <label>:142                                     ; preds = %106, %99
  %143 = sub nsw i32 %pos.0, 1
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %144
  %146 = load i8* %145, align 1
  %147 = zext i8 %146 to i32
  %148 = icmp eq i32 %147, %5
  br i1 %148, label %149, label %183

; <label>:149                                     ; preds = %142
  %150 = sub nsw i32 %pos.0, 1
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %151
  %153 = load i32* %152, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %154
  %156 = getelementptr inbounds %struct.string_data* %155, i32 0, i32 7
  %157 = load i32* %156, align 4
  %158 = load i32* @string_mark, align 4
  %159 = icmp ne i32 %157, %158
  br i1 %159, label %160, label %183

; <label>:160                                     ; preds = %149
  %161 = sub nsw i32 %pos.0, 1
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %162
  %164 = load i32* %163, align 4
  %165 = sext i32 %s to i64
  %166 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %165
  %167 = getelementptr inbounds %struct.string_data* %166, i32 0, i32 5
  %168 = load i32* %167, align 4
  %169 = add nsw i32 %168, 1
  store i32 %169, i32* %167, align 4
  %170 = sext i32 %168 to i64
  %171 = sext i32 %s to i64
  %172 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %171
  %173 = getelementptr inbounds %struct.string_data* %172, i32 0, i32 6
  %174 = getelementptr inbounds [160 x i32]* %173, i32 0, i64 %170
  store i32 %164, i32* %174, align 4
  %175 = load i32* @string_mark, align 4
  %176 = sub nsw i32 %pos.0, 1
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %177
  %179 = load i32* %178, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %180
  %182 = getelementptr inbounds %struct.string_data* %181, i32 0, i32 7
  store i32 %175, i32* %182, align 4
  br label %183

; <label>:183                                     ; preds = %160, %149, %142
  br label %184

; <label>:184                                     ; preds = %183, %141
  %185 = sub nsw i32 %pos.0, 20
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %186
  %188 = load i8* %187, align 1
  %189 = zext i8 %188 to i32
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %191, label %227

; <label>:191                                     ; preds = %184
  %192 = sub nsw i32 %pos.0, 20
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %193
  %195 = load i32* %194, align 4
  %196 = load i32* @liberty_mark, align 4
  %197 = icmp ne i32 %195, %196
  br i1 %197, label %198, label %227

; <label>:198                                     ; preds = %191
  br label %199

; <label>:199                                     ; preds = %198
  %200 = sext i32 %s to i64
  %201 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %200
  %202 = getelementptr inbounds %struct.string_data* %201, i32 0, i32 3
  %203 = load i32* %202, align 4
  %204 = icmp slt i32 %203, 20
  br i1 %204, label %205, label %216

; <label>:205                                     ; preds = %199
  %206 = sub nsw i32 %pos.0, 20
  %207 = sext i32 %s to i64
  %208 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %207
  %209 = getelementptr inbounds %struct.string_data* %208, i32 0, i32 3
  %210 = load i32* %209, align 4
  %211 = sext i32 %210 to i64
  %212 = sext i32 %s to i64
  %213 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %212
  %214 = getelementptr inbounds %struct.string_data* %213, i32 0, i32 4
  %215 = getelementptr inbounds [20 x i32]* %214, i32 0, i64 %211
  store i32 %206, i32* %215, align 4
  br label %216

; <label>:216                                     ; preds = %205, %199
  %217 = sext i32 %s to i64
  %218 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %217
  %219 = getelementptr inbounds %struct.string_data* %218, i32 0, i32 3
  %220 = load i32* %219, align 4
  %221 = add nsw i32 %220, 1
  store i32 %221, i32* %219, align 4
  %222 = load i32* @liberty_mark, align 4
  %223 = sub nsw i32 %pos.0, 20
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %224
  store i32 %222, i32* %225, align 4
  br label %226

; <label>:226                                     ; preds = %216
  br label %269

; <label>:227                                     ; preds = %191, %184
  %228 = sub nsw i32 %pos.0, 20
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %229
  %231 = load i8* %230, align 1
  %232 = zext i8 %231 to i32
  %233 = icmp eq i32 %232, %5
  br i1 %233, label %234, label %268

; <label>:234                                     ; preds = %227
  %235 = sub nsw i32 %pos.0, 20
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %236
  %238 = load i32* %237, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %239
  %241 = getelementptr inbounds %struct.string_data* %240, i32 0, i32 7
  %242 = load i32* %241, align 4
  %243 = load i32* @string_mark, align 4
  %244 = icmp ne i32 %242, %243
  br i1 %244, label %245, label %268

; <label>:245                                     ; preds = %234
  %246 = sub nsw i32 %pos.0, 20
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %247
  %249 = load i32* %248, align 4
  %250 = sext i32 %s to i64
  %251 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %250
  %252 = getelementptr inbounds %struct.string_data* %251, i32 0, i32 5
  %253 = load i32* %252, align 4
  %254 = add nsw i32 %253, 1
  store i32 %254, i32* %252, align 4
  %255 = sext i32 %253 to i64
  %256 = sext i32 %s to i64
  %257 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %256
  %258 = getelementptr inbounds %struct.string_data* %257, i32 0, i32 6
  %259 = getelementptr inbounds [160 x i32]* %258, i32 0, i64 %255
  store i32 %249, i32* %259, align 4
  %260 = load i32* @string_mark, align 4
  %261 = sub nsw i32 %pos.0, 20
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %262
  %264 = load i32* %263, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %265
  %267 = getelementptr inbounds %struct.string_data* %266, i32 0, i32 7
  store i32 %260, i32* %267, align 4
  br label %268

; <label>:268                                     ; preds = %245, %234, %227
  br label %269

; <label>:269                                     ; preds = %268, %226
  %270 = add nsw i32 %pos.0, 1
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %271
  %273 = load i8* %272, align 1
  %274 = zext i8 %273 to i32
  %275 = icmp eq i32 %274, 0
  br i1 %275, label %276, label %312

; <label>:276                                     ; preds = %269
  %277 = add nsw i32 %pos.0, 1
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %278
  %280 = load i32* %279, align 4
  %281 = load i32* @liberty_mark, align 4
  %282 = icmp ne i32 %280, %281
  br i1 %282, label %283, label %312

; <label>:283                                     ; preds = %276
  br label %284

; <label>:284                                     ; preds = %283
  %285 = sext i32 %s to i64
  %286 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %285
  %287 = getelementptr inbounds %struct.string_data* %286, i32 0, i32 3
  %288 = load i32* %287, align 4
  %289 = icmp slt i32 %288, 20
  br i1 %289, label %290, label %301

; <label>:290                                     ; preds = %284
  %291 = add nsw i32 %pos.0, 1
  %292 = sext i32 %s to i64
  %293 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %292
  %294 = getelementptr inbounds %struct.string_data* %293, i32 0, i32 3
  %295 = load i32* %294, align 4
  %296 = sext i32 %295 to i64
  %297 = sext i32 %s to i64
  %298 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %297
  %299 = getelementptr inbounds %struct.string_data* %298, i32 0, i32 4
  %300 = getelementptr inbounds [20 x i32]* %299, i32 0, i64 %296
  store i32 %291, i32* %300, align 4
  br label %301

; <label>:301                                     ; preds = %290, %284
  %302 = sext i32 %s to i64
  %303 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %302
  %304 = getelementptr inbounds %struct.string_data* %303, i32 0, i32 3
  %305 = load i32* %304, align 4
  %306 = add nsw i32 %305, 1
  store i32 %306, i32* %304, align 4
  %307 = load i32* @liberty_mark, align 4
  %308 = add nsw i32 %pos.0, 1
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %309
  store i32 %307, i32* %310, align 4
  br label %311

; <label>:311                                     ; preds = %301
  br label %354

; <label>:312                                     ; preds = %276, %269
  %313 = add nsw i32 %pos.0, 1
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %314
  %316 = load i8* %315, align 1
  %317 = zext i8 %316 to i32
  %318 = icmp eq i32 %317, %5
  br i1 %318, label %319, label %353

; <label>:319                                     ; preds = %312
  %320 = add nsw i32 %pos.0, 1
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %321
  %323 = load i32* %322, align 4
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %324
  %326 = getelementptr inbounds %struct.string_data* %325, i32 0, i32 7
  %327 = load i32* %326, align 4
  %328 = load i32* @string_mark, align 4
  %329 = icmp ne i32 %327, %328
  br i1 %329, label %330, label %353

; <label>:330                                     ; preds = %319
  %331 = add nsw i32 %pos.0, 1
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %332
  %334 = load i32* %333, align 4
  %335 = sext i32 %s to i64
  %336 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %335
  %337 = getelementptr inbounds %struct.string_data* %336, i32 0, i32 5
  %338 = load i32* %337, align 4
  %339 = add nsw i32 %338, 1
  store i32 %339, i32* %337, align 4
  %340 = sext i32 %338 to i64
  %341 = sext i32 %s to i64
  %342 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %341
  %343 = getelementptr inbounds %struct.string_data* %342, i32 0, i32 6
  %344 = getelementptr inbounds [160 x i32]* %343, i32 0, i64 %340
  store i32 %334, i32* %344, align 4
  %345 = load i32* @string_mark, align 4
  %346 = add nsw i32 %pos.0, 1
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %347
  %349 = load i32* %348, align 4
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %350
  %352 = getelementptr inbounds %struct.string_data* %351, i32 0, i32 7
  store i32 %345, i32* %352, align 4
  br label %353

; <label>:353                                     ; preds = %330, %319, %312
  br label %354

; <label>:354                                     ; preds = %353, %311
  %355 = sext i32 %pos.0 to i64
  %356 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %355
  %357 = load i32* %356, align 4
  br label %358

; <label>:358                                     ; preds = %354
  %359 = sext i32 %s to i64
  %360 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %359
  %361 = getelementptr inbounds %struct.string_data* %360, i32 0, i32 2
  %362 = load i32* %361, align 4
  %363 = icmp eq i32 %357, %362
  %364 = xor i1 %363, true
  br i1 %364, label %14, label %365

; <label>:365                                     ; preds = %358
  ret void
}

declare void @hashdata_invert_ko(%struct.Hash_data*, i32) #1

; Function Attrs: nounwind uwtable
define internal void @do_play_move(i32 %pos, i32 %color) #0 {
  %1 = sub nsw i32 3, %color
  %2 = add nsw i32 %pos, 20
  %3 = sub nsw i32 %pos, 1
  %4 = sub nsw i32 %pos, 20
  %5 = add nsw i32 %pos, 1
  %6 = sext i32 %2 to i64
  %7 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %6
  %8 = load i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = icmp eq i32 %9, %1
  br i1 %10, label %11, label %26

; <label>:11                                      ; preds = %0
  %12 = sext i32 %2 to i64
  %13 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %12
  %14 = load i32* %13, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %15
  %17 = getelementptr inbounds %struct.string_data* %16, i32 0, i32 3
  %18 = load i32* %17, align 4
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %20, label %26

; <label>:20                                      ; preds = %11
  %21 = sext i32 %2 to i64
  %22 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %21
  %23 = load i32* %22, align 4
  %24 = call i32 @do_remove_string(i32 %23)
  %25 = add nsw i32 0, %24
  br label %26

; <label>:26                                      ; preds = %20, %11, %0
  %captured_stones.0 = phi i32 [ %25, %20 ], [ 0, %11 ], [ 0, %0 ]
  %27 = sext i32 %3 to i64
  %28 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %27
  %29 = load i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = icmp eq i32 %30, %1
  br i1 %31, label %32, label %47

; <label>:32                                      ; preds = %26
  %33 = sext i32 %3 to i64
  %34 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %33
  %35 = load i32* %34, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %36
  %38 = getelementptr inbounds %struct.string_data* %37, i32 0, i32 3
  %39 = load i32* %38, align 4
  %40 = icmp eq i32 %39, 1
  br i1 %40, label %41, label %47

; <label>:41                                      ; preds = %32
  %42 = sext i32 %3 to i64
  %43 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %42
  %44 = load i32* %43, align 4
  %45 = call i32 @do_remove_string(i32 %44)
  %46 = add nsw i32 %captured_stones.0, %45
  br label %47

; <label>:47                                      ; preds = %41, %32, %26
  %captured_stones.1 = phi i32 [ %46, %41 ], [ %captured_stones.0, %32 ], [ %captured_stones.0, %26 ]
  %48 = sext i32 %4 to i64
  %49 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %48
  %50 = load i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = icmp eq i32 %51, %1
  br i1 %52, label %53, label %68

; <label>:53                                      ; preds = %47
  %54 = sext i32 %4 to i64
  %55 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %54
  %56 = load i32* %55, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %57
  %59 = getelementptr inbounds %struct.string_data* %58, i32 0, i32 3
  %60 = load i32* %59, align 4
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %62, label %68

; <label>:62                                      ; preds = %53
  %63 = sext i32 %4 to i64
  %64 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %63
  %65 = load i32* %64, align 4
  %66 = call i32 @do_remove_string(i32 %65)
  %67 = add nsw i32 %captured_stones.1, %66
  br label %68

; <label>:68                                      ; preds = %62, %53, %47
  %captured_stones.2 = phi i32 [ %67, %62 ], [ %captured_stones.1, %53 ], [ %captured_stones.1, %47 ]
  %69 = sext i32 %5 to i64
  %70 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %69
  %71 = load i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = icmp eq i32 %72, %1
  br i1 %73, label %74, label %89

; <label>:74                                      ; preds = %68
  %75 = sext i32 %5 to i64
  %76 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %75
  %77 = load i32* %76, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %78
  %80 = getelementptr inbounds %struct.string_data* %79, i32 0, i32 3
  %81 = load i32* %80, align 4
  %82 = icmp eq i32 %81, 1
  br i1 %82, label %83, label %89

; <label>:83                                      ; preds = %74
  %84 = sext i32 %5 to i64
  %85 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %84
  %86 = load i32* %85, align 4
  %87 = call i32 @do_remove_string(i32 %86)
  %88 = add nsw i32 %captured_stones.2, %87
  br label %89

; <label>:89                                      ; preds = %83, %74, %68
  %captured_stones.3 = phi i32 [ %88, %83 ], [ %captured_stones.2, %74 ], [ %captured_stones.2, %68 ]
  %90 = icmp eq i32 %captured_stones.3, 0
  br i1 %90, label %91, label %183

; <label>:91                                      ; preds = %89
  %92 = sext i32 %2 to i64
  %93 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %92
  %94 = load i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %112, label %97

; <label>:97                                      ; preds = %91
  %98 = sext i32 %2 to i64
  %99 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %98
  %100 = load i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = icmp eq i32 %101, %color
  br i1 %102, label %103, label %113

; <label>:103                                     ; preds = %97
  %104 = sext i32 %2 to i64
  %105 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %104
  %106 = load i32* %105, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %107
  %109 = getelementptr inbounds %struct.string_data* %108, i32 0, i32 3
  %110 = load i32* %109, align 4
  %111 = icmp sgt i32 %110, 1
  br i1 %111, label %112, label %113

; <label>:112                                     ; preds = %103, %91
  br label %182

; <label>:113                                     ; preds = %103, %97
  %114 = sext i32 %3 to i64
  %115 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %114
  %116 = load i8* %115, align 1
  %117 = zext i8 %116 to i32
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %134, label %119

; <label>:119                                     ; preds = %113
  %120 = sext i32 %3 to i64
  %121 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %120
  %122 = load i8* %121, align 1
  %123 = zext i8 %122 to i32
  %124 = icmp eq i32 %123, %color
  br i1 %124, label %125, label %135

; <label>:125                                     ; preds = %119
  %126 = sext i32 %3 to i64
  %127 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %126
  %128 = load i32* %127, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %129
  %131 = getelementptr inbounds %struct.string_data* %130, i32 0, i32 3
  %132 = load i32* %131, align 4
  %133 = icmp sgt i32 %132, 1
  br i1 %133, label %134, label %135

; <label>:134                                     ; preds = %125, %113
  br label %181

; <label>:135                                     ; preds = %125, %119
  %136 = sext i32 %4 to i64
  %137 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %136
  %138 = load i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %156, label %141

; <label>:141                                     ; preds = %135
  %142 = sext i32 %4 to i64
  %143 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %142
  %144 = load i8* %143, align 1
  %145 = zext i8 %144 to i32
  %146 = icmp eq i32 %145, %color
  br i1 %146, label %147, label %157

; <label>:147                                     ; preds = %141
  %148 = sext i32 %4 to i64
  %149 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %148
  %150 = load i32* %149, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %151
  %153 = getelementptr inbounds %struct.string_data* %152, i32 0, i32 3
  %154 = load i32* %153, align 4
  %155 = icmp sgt i32 %154, 1
  br i1 %155, label %156, label %157

; <label>:156                                     ; preds = %147, %135
  br label %180

; <label>:157                                     ; preds = %147, %141
  %158 = sext i32 %5 to i64
  %159 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %158
  %160 = load i8* %159, align 1
  %161 = zext i8 %160 to i32
  %162 = icmp eq i32 %161, 0
  br i1 %162, label %178, label %163

; <label>:163                                     ; preds = %157
  %164 = sext i32 %5 to i64
  %165 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %164
  %166 = load i8* %165, align 1
  %167 = zext i8 %166 to i32
  %168 = icmp eq i32 %167, %color
  br i1 %168, label %169, label %179

; <label>:169                                     ; preds = %163
  %170 = sext i32 %5 to i64
  %171 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %170
  %172 = load i32* %171, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %173
  %175 = getelementptr inbounds %struct.string_data* %174, i32 0, i32 3
  %176 = load i32* %175, align 4
  %177 = icmp sgt i32 %176, 1
  br i1 %177, label %178, label %179

; <label>:178                                     ; preds = %169, %157
  br label %179

; <label>:179                                     ; preds = %178, %169, %163
  %have_liberties.0 = phi i32 [ 1, %178 ], [ 0, %169 ], [ 0, %163 ]
  br label %180

; <label>:180                                     ; preds = %179, %156
  %have_liberties.1 = phi i32 [ 1, %156 ], [ %have_liberties.0, %179 ]
  br label %181

; <label>:181                                     ; preds = %180, %134
  %have_liberties.2 = phi i32 [ 1, %134 ], [ %have_liberties.1, %180 ]
  br label %182

; <label>:182                                     ; preds = %181, %112
  %have_liberties.3 = phi i32 [ 1, %112 ], [ %have_liberties.2, %181 ]
  br label %184

; <label>:183                                     ; preds = %89
  br label %184

; <label>:184                                     ; preds = %183, %182
  %have_liberties.4 = phi i32 [ %have_liberties.3, %182 ], [ 1, %183 ]
  %185 = icmp eq i32 %have_liberties.4, 0
  br i1 %185, label %186, label %189

; <label>:186                                     ; preds = %184
  %187 = icmp eq i32 %captured_stones.3, 0
  br i1 %187, label %188, label %189

; <label>:188                                     ; preds = %186
  call void @do_commit_suicide(i32 %pos, i32 %color)
  br label %457

; <label>:189                                     ; preds = %186, %184
  br label %190

; <label>:190                                     ; preds = %189
  %191 = sext i32 %pos to i64
  %192 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %191
  %193 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %194 = getelementptr inbounds %struct.vertex_stack_entry* %193, i32 0, i32 0
  store i8* %192, i8** %194, align 8
  %195 = sext i32 %pos to i64
  %196 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %195
  %197 = load i8* %196, align 1
  %198 = zext i8 %197 to i32
  %199 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %200 = getelementptr inbounds %struct.vertex_stack_entry* %199, i32 1
  store %struct.vertex_stack_entry* %200, %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %201 = getelementptr inbounds %struct.vertex_stack_entry* %199, i32 0, i32 1
  store i32 %198, i32* %201, align 4
  %202 = trunc i32 %color to i8
  %203 = sext i32 %pos to i64
  %204 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %203
  store i8 %202, i8* %204, align 1
  call void @hashdata_invert_stone(%struct.Hash_data* @hashdata, i32 %pos, i32 %color)
  br label %205

; <label>:205                                     ; preds = %190
  %206 = load i32* @string_mark, align 4
  %207 = add nsw i32 %206, 1
  store i32 %207, i32* @string_mark, align 4
  %208 = sext i32 %2 to i64
  %209 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %208
  %210 = load i8* %209, align 1
  %211 = zext i8 %210 to i32
  %212 = icmp eq i32 %211, %color
  br i1 %212, label %213, label %235

; <label>:213                                     ; preds = %205
  %214 = sext i32 %2 to i64
  %215 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %214
  %216 = load i32* %215, align 4
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %217
  %219 = getelementptr inbounds %struct.string_data* %218, i32 0, i32 7
  %220 = load i32* %219, align 4
  %221 = load i32* @string_mark, align 4
  %222 = icmp ne i32 %220, %221
  br i1 %222, label %223, label %235

; <label>:223                                     ; preds = %213
  %224 = add nsw i32 0, 1
  %225 = sext i32 %2 to i64
  %226 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %225
  %227 = load i32* %226, align 4
  %228 = load i32* @string_mark, align 4
  %229 = sext i32 %2 to i64
  %230 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %229
  %231 = load i32* %230, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %232
  %234 = getelementptr inbounds %struct.string_data* %233, i32 0, i32 7
  store i32 %228, i32* %234, align 4
  br label %263

; <label>:235                                     ; preds = %213, %205
  %236 = sext i32 %2 to i64
  %237 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %236
  %238 = load i8* %237, align 1
  %239 = zext i8 %238 to i32
  %240 = icmp eq i32 %239, %1
  br i1 %240, label %241, label %262

; <label>:241                                     ; preds = %235
  %242 = sext i32 %2 to i64
  %243 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %242
  %244 = load i32* %243, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %245
  %247 = getelementptr inbounds %struct.string_data* %246, i32 0, i32 7
  %248 = load i32* %247, align 4
  %249 = load i32* @string_mark, align 4
  %250 = icmp ne i32 %248, %249
  br i1 %250, label %251, label %262

; <label>:251                                     ; preds = %241
  %252 = sext i32 %2 to i64
  %253 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %252
  %254 = load i32* %253, align 4
  call void @remove_liberty(i32 %254, i32 %pos)
  %255 = load i32* @string_mark, align 4
  %256 = sext i32 %2 to i64
  %257 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %256
  %258 = load i32* %257, align 4
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %259
  %261 = getelementptr inbounds %struct.string_data* %260, i32 0, i32 7
  store i32 %255, i32* %261, align 4
  br label %262

; <label>:262                                     ; preds = %251, %241, %235
  br label %263

; <label>:263                                     ; preds = %262, %223
  %neighbor_allies.0 = phi i32 [ %224, %223 ], [ 0, %262 ]
  %s.0 = phi i32 [ %227, %223 ], [ -1, %262 ]
  %264 = sext i32 %3 to i64
  %265 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %264
  %266 = load i8* %265, align 1
  %267 = zext i8 %266 to i32
  %268 = icmp eq i32 %267, %color
  br i1 %268, label %269, label %291

; <label>:269                                     ; preds = %263
  %270 = sext i32 %3 to i64
  %271 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %270
  %272 = load i32* %271, align 4
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %273
  %275 = getelementptr inbounds %struct.string_data* %274, i32 0, i32 7
  %276 = load i32* %275, align 4
  %277 = load i32* @string_mark, align 4
  %278 = icmp ne i32 %276, %277
  br i1 %278, label %279, label %291

; <label>:279                                     ; preds = %269
  %280 = add nsw i32 %neighbor_allies.0, 1
  %281 = sext i32 %3 to i64
  %282 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %281
  %283 = load i32* %282, align 4
  %284 = load i32* @string_mark, align 4
  %285 = sext i32 %3 to i64
  %286 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %285
  %287 = load i32* %286, align 4
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %288
  %290 = getelementptr inbounds %struct.string_data* %289, i32 0, i32 7
  store i32 %284, i32* %290, align 4
  br label %319

; <label>:291                                     ; preds = %269, %263
  %292 = sext i32 %3 to i64
  %293 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %292
  %294 = load i8* %293, align 1
  %295 = zext i8 %294 to i32
  %296 = icmp eq i32 %295, %1
  br i1 %296, label %297, label %318

; <label>:297                                     ; preds = %291
  %298 = sext i32 %3 to i64
  %299 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %298
  %300 = load i32* %299, align 4
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %301
  %303 = getelementptr inbounds %struct.string_data* %302, i32 0, i32 7
  %304 = load i32* %303, align 4
  %305 = load i32* @string_mark, align 4
  %306 = icmp ne i32 %304, %305
  br i1 %306, label %307, label %318

; <label>:307                                     ; preds = %297
  %308 = sext i32 %3 to i64
  %309 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %308
  %310 = load i32* %309, align 4
  call void @remove_liberty(i32 %310, i32 %pos)
  %311 = load i32* @string_mark, align 4
  %312 = sext i32 %3 to i64
  %313 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %312
  %314 = load i32* %313, align 4
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %315
  %317 = getelementptr inbounds %struct.string_data* %316, i32 0, i32 7
  store i32 %311, i32* %317, align 4
  br label %318

; <label>:318                                     ; preds = %307, %297, %291
  br label %319

; <label>:319                                     ; preds = %318, %279
  %neighbor_allies.1 = phi i32 [ %280, %279 ], [ %neighbor_allies.0, %318 ]
  %s.1 = phi i32 [ %283, %279 ], [ %s.0, %318 ]
  %320 = sext i32 %4 to i64
  %321 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %320
  %322 = load i8* %321, align 1
  %323 = zext i8 %322 to i32
  %324 = icmp eq i32 %323, %color
  br i1 %324, label %325, label %347

; <label>:325                                     ; preds = %319
  %326 = sext i32 %4 to i64
  %327 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %326
  %328 = load i32* %327, align 4
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %329
  %331 = getelementptr inbounds %struct.string_data* %330, i32 0, i32 7
  %332 = load i32* %331, align 4
  %333 = load i32* @string_mark, align 4
  %334 = icmp ne i32 %332, %333
  br i1 %334, label %335, label %347

; <label>:335                                     ; preds = %325
  %336 = add nsw i32 %neighbor_allies.1, 1
  %337 = sext i32 %4 to i64
  %338 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %337
  %339 = load i32* %338, align 4
  %340 = load i32* @string_mark, align 4
  %341 = sext i32 %4 to i64
  %342 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %341
  %343 = load i32* %342, align 4
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %344
  %346 = getelementptr inbounds %struct.string_data* %345, i32 0, i32 7
  store i32 %340, i32* %346, align 4
  br label %375

; <label>:347                                     ; preds = %325, %319
  %348 = sext i32 %4 to i64
  %349 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %348
  %350 = load i8* %349, align 1
  %351 = zext i8 %350 to i32
  %352 = icmp eq i32 %351, %1
  br i1 %352, label %353, label %374

; <label>:353                                     ; preds = %347
  %354 = sext i32 %4 to i64
  %355 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %354
  %356 = load i32* %355, align 4
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %357
  %359 = getelementptr inbounds %struct.string_data* %358, i32 0, i32 7
  %360 = load i32* %359, align 4
  %361 = load i32* @string_mark, align 4
  %362 = icmp ne i32 %360, %361
  br i1 %362, label %363, label %374

; <label>:363                                     ; preds = %353
  %364 = sext i32 %4 to i64
  %365 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %364
  %366 = load i32* %365, align 4
  call void @remove_liberty(i32 %366, i32 %pos)
  %367 = load i32* @string_mark, align 4
  %368 = sext i32 %4 to i64
  %369 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %368
  %370 = load i32* %369, align 4
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %371
  %373 = getelementptr inbounds %struct.string_data* %372, i32 0, i32 7
  store i32 %367, i32* %373, align 4
  br label %374

; <label>:374                                     ; preds = %363, %353, %347
  br label %375

; <label>:375                                     ; preds = %374, %335
  %neighbor_allies.2 = phi i32 [ %336, %335 ], [ %neighbor_allies.1, %374 ]
  %s.2 = phi i32 [ %339, %335 ], [ %s.1, %374 ]
  %376 = sext i32 %5 to i64
  %377 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %376
  %378 = load i8* %377, align 1
  %379 = zext i8 %378 to i32
  %380 = icmp eq i32 %379, %color
  br i1 %380, label %381, label %396

; <label>:381                                     ; preds = %375
  %382 = sext i32 %5 to i64
  %383 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %382
  %384 = load i32* %383, align 4
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %385
  %387 = getelementptr inbounds %struct.string_data* %386, i32 0, i32 7
  %388 = load i32* %387, align 4
  %389 = load i32* @string_mark, align 4
  %390 = icmp ne i32 %388, %389
  br i1 %390, label %391, label %396

; <label>:391                                     ; preds = %381
  %392 = add nsw i32 %neighbor_allies.2, 1
  %393 = sext i32 %5 to i64
  %394 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %393
  %395 = load i32* %394, align 4
  br label %417

; <label>:396                                     ; preds = %381, %375
  %397 = sext i32 %5 to i64
  %398 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %397
  %399 = load i8* %398, align 1
  %400 = zext i8 %399 to i32
  %401 = icmp eq i32 %400, %1
  br i1 %401, label %402, label %416

; <label>:402                                     ; preds = %396
  %403 = sext i32 %5 to i64
  %404 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %403
  %405 = load i32* %404, align 4
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %406
  %408 = getelementptr inbounds %struct.string_data* %407, i32 0, i32 7
  %409 = load i32* %408, align 4
  %410 = load i32* @string_mark, align 4
  %411 = icmp ne i32 %409, %410
  br i1 %411, label %412, label %416

; <label>:412                                     ; preds = %402
  %413 = sext i32 %5 to i64
  %414 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %413
  %415 = load i32* %414, align 4
  call void @remove_liberty(i32 %415, i32 %pos)
  br label %416

; <label>:416                                     ; preds = %412, %402, %396
  br label %417

; <label>:417                                     ; preds = %416, %391
  %neighbor_allies.3 = phi i32 [ %392, %391 ], [ %neighbor_allies.2, %416 ]
  %s.3 = phi i32 [ %395, %391 ], [ %s.2, %416 ]
  %418 = icmp eq i32 %neighbor_allies.3, 0
  br i1 %418, label %419, label %420

; <label>:419                                     ; preds = %417
  call void @create_new_string(i32 %pos)
  br label %428

; <label>:420                                     ; preds = %417
  %421 = icmp eq i32 %neighbor_allies.3, 1
  br i1 %421, label %422, label %427

; <label>:422                                     ; preds = %420
  %423 = icmp sge i32 %s.3, 0
  br i1 %423, label %424, label %425

; <label>:424                                     ; preds = %422
  br label %426

; <label>:425                                     ; preds = %422
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 3498, i8* getelementptr inbounds ([7 x i8]* @.str35, i32 0, i32 0), i32 -1, i32 -1)
  br label %426

; <label>:426                                     ; preds = %425, %424
  call void @extend_neighbor_string(i32 %pos, i32 %s.3)
  br label %457

; <label>:427                                     ; preds = %420
  call void @assimilate_neighbor_strings(i32 %pos)
  br label %457

; <label>:428                                     ; preds = %419
  %429 = sext i32 %pos to i64
  %430 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %429
  %431 = load i32* %430, align 4
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %432
  %434 = getelementptr inbounds %struct.string_data* %433, i32 0, i32 3
  %435 = load i32* %434, align 4
  %436 = icmp eq i32 %435, 1
  br i1 %436, label %437, label %457

; <label>:437                                     ; preds = %428
  %438 = sext i32 %431 to i64
  %439 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %438
  %440 = getelementptr inbounds %struct.string_data* %439, i32 0, i32 1
  %441 = load i32* %440, align 4
  %442 = icmp eq i32 %441, 1
  br i1 %442, label %443, label %457

; <label>:443                                     ; preds = %437
  %444 = icmp eq i32 %captured_stones.3, 1
  br i1 %444, label %445, label %457

; <label>:445                                     ; preds = %443
  %446 = load i32* @board_ko_pos, align 4
  %447 = icmp ne i32 %446, 0
  br i1 %447, label %448, label %450

; <label>:448                                     ; preds = %445
  %449 = load i32* @board_ko_pos, align 4
  call void @hashdata_invert_ko(%struct.Hash_data* @hashdata, i32 %449)
  br label %450

; <label>:450                                     ; preds = %448, %445
  %451 = sext i32 %431 to i64
  %452 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %451
  %453 = getelementptr inbounds %struct.string_data* %452, i32 0, i32 4
  %454 = getelementptr inbounds [20 x i32]* %453, i32 0, i64 0
  %455 = load i32* %454, align 4
  store i32 %455, i32* @board_ko_pos, align 4
  %456 = load i32* @board_ko_pos, align 4
  call void @hashdata_invert_ko(%struct.Hash_data* @hashdata, i32 %456)
  br label %457

; <label>:457                                     ; preds = %450, %443, %437, %428, %427, %426, %188
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @do_remove_string(i32 %s) #0 {
  %1 = sext i32 %s to i64
  %2 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1
  %3 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 2
  %4 = load i32* %3, align 4
  br label %5

; <label>:5                                       ; preds = %48, %0
  %pos.0 = phi i32 [ %4, %0 ], [ %47, %48 ]
  %6 = sext i32 %pos.0 to i64
  %7 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %6
  %8 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %9 = getelementptr inbounds %struct.change_stack_entry* %8, i32 0, i32 0
  store i32* %7, i32** %9, align 8
  %10 = sext i32 %pos.0 to i64
  %11 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %10
  %12 = load i32* %11, align 4
  %13 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %14 = getelementptr inbounds %struct.change_stack_entry* %13, i32 1
  store %struct.change_stack_entry* %14, %struct.change_stack_entry** @change_stack_pointer, align 8
  %15 = getelementptr inbounds %struct.change_stack_entry* %13, i32 0, i32 1
  store i32 %12, i32* %15, align 4
  %16 = sext i32 %pos.0 to i64
  %17 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %16
  %18 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %19 = getelementptr inbounds %struct.change_stack_entry* %18, i32 0, i32 0
  store i32* %17, i32** %19, align 8
  %20 = sext i32 %pos.0 to i64
  %21 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %20
  %22 = load i32* %21, align 4
  %23 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %24 = getelementptr inbounds %struct.change_stack_entry* %23, i32 1
  store %struct.change_stack_entry* %24, %struct.change_stack_entry** @change_stack_pointer, align 8
  %25 = getelementptr inbounds %struct.change_stack_entry* %23, i32 0, i32 1
  store i32 %22, i32* %25, align 4
  br label %26

; <label>:26                                      ; preds = %5
  %27 = sext i32 %pos.0 to i64
  %28 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %27
  %29 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %30 = getelementptr inbounds %struct.vertex_stack_entry* %29, i32 0, i32 0
  store i8* %28, i8** %30, align 8
  %31 = sext i32 %pos.0 to i64
  %32 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %31
  %33 = load i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %36 = getelementptr inbounds %struct.vertex_stack_entry* %35, i32 1
  store %struct.vertex_stack_entry* %36, %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %37 = getelementptr inbounds %struct.vertex_stack_entry* %35, i32 0, i32 1
  store i32 %34, i32* %37, align 4
  %38 = sext i32 %pos.0 to i64
  %39 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %38
  %40 = load i8* %39, align 1
  %41 = zext i8 %40 to i32
  call void @hashdata_invert_stone(%struct.Hash_data* @hashdata, i32 %pos.0, i32 %41)
  %42 = sext i32 %pos.0 to i64
  %43 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %42
  store i8 0, i8* %43, align 1
  br label %44

; <label>:44                                      ; preds = %26
  %45 = sext i32 %pos.0 to i64
  %46 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %45
  %47 = load i32* %46, align 4
  br label %48

; <label>:48                                      ; preds = %44
  %49 = sext i32 %s to i64
  %50 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %49
  %51 = getelementptr inbounds %struct.string_data* %50, i32 0, i32 2
  %52 = load i32* %51, align 4
  %53 = icmp eq i32 %47, %52
  %54 = xor i1 %53, true
  br i1 %54, label %5, label %55

; <label>:55                                      ; preds = %48
  br label %56

; <label>:56                                      ; preds = %75, %55
  %k.0 = phi i32 [ 0, %55 ], [ %76, %75 ]
  %57 = sext i32 %s to i64
  %58 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %57
  %59 = getelementptr inbounds %struct.string_data* %58, i32 0, i32 5
  %60 = load i32* %59, align 4
  %61 = icmp slt i32 %k.0, %60
  br i1 %61, label %62, label %77

; <label>:62                                      ; preds = %56
  %63 = sext i32 %k.0 to i64
  %64 = sext i32 %s to i64
  %65 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %64
  %66 = getelementptr inbounds %struct.string_data* %65, i32 0, i32 6
  %67 = getelementptr inbounds [160 x i32]* %66, i32 0, i64 %63
  %68 = load i32* %67, align 4
  call void @remove_neighbor(i32 %68, i32 %s)
  %69 = sext i32 %k.0 to i64
  %70 = sext i32 %s to i64
  %71 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %70
  %72 = getelementptr inbounds %struct.string_data* %71, i32 0, i32 6
  %73 = getelementptr inbounds [160 x i32]* %72, i32 0, i64 %69
  %74 = load i32* %73, align 4
  call void @update_liberties(i32 %74)
  br label %75

; <label>:75                                      ; preds = %62
  %76 = add nsw i32 %k.0, 1
  br label %56

; <label>:77                                      ; preds = %56
  %78 = sext i32 %s to i64
  %79 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %78
  %80 = getelementptr inbounds %struct.string_data* %79, i32 0, i32 0
  %81 = load i32* %80, align 4
  %82 = icmp eq i32 %81, 1
  br i1 %82, label %83, label %90

; <label>:83                                      ; preds = %77
  %84 = sext i32 %s to i64
  %85 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %84
  %86 = getelementptr inbounds %struct.string_data* %85, i32 0, i32 1
  %87 = load i32* %86, align 4
  %88 = load i32* @white_captured, align 4
  %89 = add nsw i32 %88, %87
  store i32 %89, i32* @white_captured, align 4
  br label %97

; <label>:90                                      ; preds = %77
  %91 = sext i32 %s to i64
  %92 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %91
  %93 = getelementptr inbounds %struct.string_data* %92, i32 0, i32 1
  %94 = load i32* %93, align 4
  %95 = load i32* @black_captured, align 4
  %96 = add nsw i32 %95, %94
  store i32 %96, i32* @black_captured, align 4
  br label %97

; <label>:97                                      ; preds = %90, %83
  %98 = sext i32 %s to i64
  %99 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %98
  %100 = getelementptr inbounds %struct.string_data* %99, i32 0, i32 1
  %101 = load i32* %100, align 4
  ret i32 %101
}

; Function Attrs: nounwind uwtable
define internal void @do_commit_suicide(i32 %pos, i32 %color) #0 {
  %1 = add nsw i32 %pos, 20
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %2
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = icmp eq i32 %5, %color
  br i1 %6, label %7, label %13

; <label>:7                                       ; preds = %0
  %8 = add nsw i32 %pos, 20
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %9
  %11 = load i32* %10, align 4
  %12 = call i32 @do_remove_string(i32 %11)
  br label %13

; <label>:13                                      ; preds = %7, %0
  %14 = sub nsw i32 %pos, 1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %15
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, %color
  br i1 %19, label %20, label %26

; <label>:20                                      ; preds = %13
  %21 = sub nsw i32 %pos, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %22
  %24 = load i32* %23, align 4
  %25 = call i32 @do_remove_string(i32 %24)
  br label %26

; <label>:26                                      ; preds = %20, %13
  %27 = sub nsw i32 %pos, 20
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %28
  %30 = load i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = icmp eq i32 %31, %color
  br i1 %32, label %33, label %39

; <label>:33                                      ; preds = %26
  %34 = sub nsw i32 %pos, 20
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %35
  %37 = load i32* %36, align 4
  %38 = call i32 @do_remove_string(i32 %37)
  br label %39

; <label>:39                                      ; preds = %33, %26
  %40 = add nsw i32 %pos, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %41
  %43 = load i8* %42, align 1
  %44 = zext i8 %43 to i32
  %45 = icmp eq i32 %44, %color
  br i1 %45, label %46, label %52

; <label>:46                                      ; preds = %39
  %47 = add nsw i32 %pos, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %48
  %50 = load i32* %49, align 4
  %51 = call i32 @do_remove_string(i32 %50)
  br label %52

; <label>:52                                      ; preds = %46, %39
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @remove_liberty(i32 %str_number, i32 %pos) #0 {
  %1 = sext i32 %str_number to i64
  %2 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1
  %3 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 3
  %4 = load i32* %3, align 4
  %5 = icmp sgt i32 %4, 20
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @update_liberties(i32 %str_number)
  br label %74

; <label>:7                                       ; preds = %0
  br label %8

; <label>:8                                       ; preds = %71, %7
  %k.0 = phi i32 [ 0, %7 ], [ %72, %71 ]
  %9 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 3
  %10 = load i32* %9, align 4
  %11 = icmp slt i32 %k.0, %10
  br i1 %11, label %12, label %73

; <label>:12                                      ; preds = %8
  %13 = sext i32 %k.0 to i64
  %14 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 4
  %15 = getelementptr inbounds [20 x i32]* %14, i32 0, i64 %13
  %16 = load i32* %15, align 4
  %17 = icmp eq i32 %16, %pos
  br i1 %17, label %18, label %70

; <label>:18                                      ; preds = %12
  %19 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 3
  %20 = load i32* %19, align 4
  %21 = sub nsw i32 %20, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 4
  %24 = getelementptr inbounds [20 x i32]* %23, i32 0, i64 %22
  %25 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %26 = getelementptr inbounds %struct.change_stack_entry* %25, i32 0, i32 0
  store i32* %24, i32** %26, align 8
  %27 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 3
  %28 = load i32* %27, align 4
  %29 = sub nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 4
  %32 = getelementptr inbounds [20 x i32]* %31, i32 0, i64 %30
  %33 = load i32* %32, align 4
  %34 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %35 = getelementptr inbounds %struct.change_stack_entry* %34, i32 1
  store %struct.change_stack_entry* %35, %struct.change_stack_entry** @change_stack_pointer, align 8
  %36 = getelementptr inbounds %struct.change_stack_entry* %34, i32 0, i32 1
  store i32 %33, i32* %36, align 4
  %37 = sext i32 %k.0 to i64
  %38 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 4
  %39 = getelementptr inbounds [20 x i32]* %38, i32 0, i64 %37
  %40 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %41 = getelementptr inbounds %struct.change_stack_entry* %40, i32 0, i32 0
  store i32* %39, i32** %41, align 8
  %42 = sext i32 %k.0 to i64
  %43 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 4
  %44 = getelementptr inbounds [20 x i32]* %43, i32 0, i64 %42
  %45 = load i32* %44, align 4
  %46 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %47 = getelementptr inbounds %struct.change_stack_entry* %46, i32 1
  store %struct.change_stack_entry* %47, %struct.change_stack_entry** @change_stack_pointer, align 8
  %48 = getelementptr inbounds %struct.change_stack_entry* %46, i32 0, i32 1
  store i32 %45, i32* %48, align 4
  %49 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 3
  %50 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %51 = getelementptr inbounds %struct.change_stack_entry* %50, i32 0, i32 0
  store i32* %49, i32** %51, align 8
  %52 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 3
  %53 = load i32* %52, align 4
  %54 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %55 = getelementptr inbounds %struct.change_stack_entry* %54, i32 1
  store %struct.change_stack_entry* %55, %struct.change_stack_entry** @change_stack_pointer, align 8
  %56 = getelementptr inbounds %struct.change_stack_entry* %54, i32 0, i32 1
  store i32 %53, i32* %56, align 4
  %57 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 3
  %58 = load i32* %57, align 4
  %59 = sub nsw i32 %58, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 4
  %62 = getelementptr inbounds [20 x i32]* %61, i32 0, i64 %60
  %63 = load i32* %62, align 4
  %64 = sext i32 %k.0 to i64
  %65 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 4
  %66 = getelementptr inbounds [20 x i32]* %65, i32 0, i64 %64
  store i32 %63, i32* %66, align 4
  %67 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 3
  %68 = load i32* %67, align 4
  %69 = add nsw i32 %68, -1
  store i32 %69, i32* %67, align 4
  br label %73

; <label>:70                                      ; preds = %12
  br label %71

; <label>:71                                      ; preds = %70
  %72 = add nsw i32 %k.0, 1
  br label %8

; <label>:73                                      ; preds = %18, %8
  br label %74

; <label>:74                                      ; preds = %73, %6
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @create_new_string(i32 %pos) #0 {
  %1 = sext i32 %pos to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = sub nsw i32 3, %4
  %6 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %7 = getelementptr inbounds %struct.change_stack_entry* %6, i32 0, i32 0
  store i32* @next_string, i32** %7, align 8
  %8 = load i32* @next_string, align 4
  %9 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %10 = getelementptr inbounds %struct.change_stack_entry* %9, i32 1
  store %struct.change_stack_entry* %10, %struct.change_stack_entry** @change_stack_pointer, align 8
  %11 = getelementptr inbounds %struct.change_stack_entry* %9, i32 0, i32 1
  store i32 %8, i32* %11, align 4
  %12 = load i32* @next_string, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* @next_string, align 4
  %14 = sext i32 %pos to i64
  %15 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %14
  store i32 %12, i32* %15, align 4
  %16 = sext i32 %pos to i64
  %17 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %16
  store i32 %pos, i32* %17, align 4
  %18 = sext i32 %12 to i64
  %19 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %18
  %20 = getelementptr inbounds %struct.string_data* %19, i32 0, i32 0
  store i32 %4, i32* %20, align 4
  %21 = sext i32 %12 to i64
  %22 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %21
  %23 = getelementptr inbounds %struct.string_data* %22, i32 0, i32 1
  store i32 1, i32* %23, align 4
  %24 = sext i32 %12 to i64
  %25 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %24
  %26 = getelementptr inbounds %struct.string_data* %25, i32 0, i32 2
  store i32 %pos, i32* %26, align 4
  %27 = sext i32 %12 to i64
  %28 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %27
  %29 = getelementptr inbounds %struct.string_data* %28, i32 0, i32 3
  store i32 0, i32* %29, align 4
  %30 = sext i32 %12 to i64
  %31 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %30
  %32 = getelementptr inbounds %struct.string_data* %31, i32 0, i32 5
  store i32 0, i32* %32, align 4
  %33 = sext i32 %12 to i64
  %34 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %33
  %35 = getelementptr inbounds %struct.string_data* %34, i32 0, i32 7
  store i32 0, i32* %35, align 4
  %36 = load i32* @string_mark, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* @string_mark, align 4
  %38 = add nsw i32 %pos, 20
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %39
  %41 = load i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %69

; <label>:44                                      ; preds = %0
  br label %45

; <label>:45                                      ; preds = %44
  %46 = sext i32 %12 to i64
  %47 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %46
  %48 = getelementptr inbounds %struct.string_data* %47, i32 0, i32 3
  %49 = load i32* %48, align 4
  %50 = icmp slt i32 %49, 20
  br i1 %50, label %51, label %62

; <label>:51                                      ; preds = %45
  %52 = add nsw i32 %pos, 20
  %53 = sext i32 %12 to i64
  %54 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %53
  %55 = getelementptr inbounds %struct.string_data* %54, i32 0, i32 3
  %56 = load i32* %55, align 4
  %57 = sext i32 %56 to i64
  %58 = sext i32 %12 to i64
  %59 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %58
  %60 = getelementptr inbounds %struct.string_data* %59, i32 0, i32 4
  %61 = getelementptr inbounds [20 x i32]* %60, i32 0, i64 %57
  store i32 %52, i32* %61, align 4
  br label %62

; <label>:62                                      ; preds = %51, %45
  %63 = sext i32 %12 to i64
  %64 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %63
  %65 = getelementptr inbounds %struct.string_data* %64, i32 0, i32 3
  %66 = load i32* %65, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %65, align 4
  br label %68

; <label>:68                                      ; preds = %62
  br label %140

; <label>:69                                      ; preds = %0
  %70 = add nsw i32 %pos, 20
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %71
  %73 = load i8* %72, align 1
  %74 = zext i8 %73 to i32
  %75 = icmp eq i32 %74, %5
  br i1 %75, label %76, label %139

; <label>:76                                      ; preds = %69
  %77 = add nsw i32 %pos, 20
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %78
  %80 = load i32* %79, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %81
  %83 = getelementptr inbounds %struct.string_data* %82, i32 0, i32 7
  %84 = load i32* %83, align 4
  %85 = load i32* @string_mark, align 4
  %86 = icmp ne i32 %84, %85
  br i1 %86, label %87, label %139

; <label>:87                                      ; preds = %76
  %88 = add nsw i32 %pos, 20
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %89
  %91 = load i32* %90, align 4
  %92 = add nsw i32 %pos, 20
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %93
  %95 = load i32* %94, align 4
  %96 = sext i32 %12 to i64
  %97 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %96
  %98 = getelementptr inbounds %struct.string_data* %97, i32 0, i32 5
  %99 = load i32* %98, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %98, align 4
  %101 = sext i32 %99 to i64
  %102 = sext i32 %12 to i64
  %103 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %102
  %104 = getelementptr inbounds %struct.string_data* %103, i32 0, i32 6
  %105 = getelementptr inbounds [160 x i32]* %104, i32 0, i64 %101
  store i32 %95, i32* %105, align 4
  %106 = sext i32 %91 to i64
  %107 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %106
  %108 = getelementptr inbounds %struct.string_data* %107, i32 0, i32 5
  %109 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %110 = getelementptr inbounds %struct.change_stack_entry* %109, i32 0, i32 0
  store i32* %108, i32** %110, align 8
  %111 = sext i32 %91 to i64
  %112 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %111
  %113 = getelementptr inbounds %struct.string_data* %112, i32 0, i32 5
  %114 = load i32* %113, align 4
  %115 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %116 = getelementptr inbounds %struct.change_stack_entry* %115, i32 1
  store %struct.change_stack_entry* %116, %struct.change_stack_entry** @change_stack_pointer, align 8
  %117 = getelementptr inbounds %struct.change_stack_entry* %115, i32 0, i32 1
  store i32 %114, i32* %117, align 4
  %118 = sext i32 %pos to i64
  %119 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %118
  %120 = load i32* %119, align 4
  %121 = sext i32 %91 to i64
  %122 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %121
  %123 = getelementptr inbounds %struct.string_data* %122, i32 0, i32 5
  %124 = load i32* %123, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %123, align 4
  %126 = sext i32 %124 to i64
  %127 = sext i32 %91 to i64
  %128 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %127
  %129 = getelementptr inbounds %struct.string_data* %128, i32 0, i32 6
  %130 = getelementptr inbounds [160 x i32]* %129, i32 0, i64 %126
  store i32 %120, i32* %130, align 4
  %131 = load i32* @string_mark, align 4
  %132 = add nsw i32 %pos, 20
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %133
  %135 = load i32* %134, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %136
  %138 = getelementptr inbounds %struct.string_data* %137, i32 0, i32 7
  store i32 %131, i32* %138, align 4
  br label %139

; <label>:139                                     ; preds = %87, %76, %69
  br label %140

; <label>:140                                     ; preds = %139, %68
  %141 = sub nsw i32 %pos, 1
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %142
  %144 = load i8* %143, align 1
  %145 = zext i8 %144 to i32
  %146 = icmp eq i32 %145, 0
  br i1 %146, label %147, label %172

; <label>:147                                     ; preds = %140
  br label %148

; <label>:148                                     ; preds = %147
  %149 = sext i32 %12 to i64
  %150 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %149
  %151 = getelementptr inbounds %struct.string_data* %150, i32 0, i32 3
  %152 = load i32* %151, align 4
  %153 = icmp slt i32 %152, 20
  br i1 %153, label %154, label %165

; <label>:154                                     ; preds = %148
  %155 = sub nsw i32 %pos, 1
  %156 = sext i32 %12 to i64
  %157 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %156
  %158 = getelementptr inbounds %struct.string_data* %157, i32 0, i32 3
  %159 = load i32* %158, align 4
  %160 = sext i32 %159 to i64
  %161 = sext i32 %12 to i64
  %162 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %161
  %163 = getelementptr inbounds %struct.string_data* %162, i32 0, i32 4
  %164 = getelementptr inbounds [20 x i32]* %163, i32 0, i64 %160
  store i32 %155, i32* %164, align 4
  br label %165

; <label>:165                                     ; preds = %154, %148
  %166 = sext i32 %12 to i64
  %167 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %166
  %168 = getelementptr inbounds %struct.string_data* %167, i32 0, i32 3
  %169 = load i32* %168, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, i32* %168, align 4
  br label %171

; <label>:171                                     ; preds = %165
  br label %243

; <label>:172                                     ; preds = %140
  %173 = sub nsw i32 %pos, 1
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %174
  %176 = load i8* %175, align 1
  %177 = zext i8 %176 to i32
  %178 = icmp eq i32 %177, %5
  br i1 %178, label %179, label %242

; <label>:179                                     ; preds = %172
  %180 = sub nsw i32 %pos, 1
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %181
  %183 = load i32* %182, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %184
  %186 = getelementptr inbounds %struct.string_data* %185, i32 0, i32 7
  %187 = load i32* %186, align 4
  %188 = load i32* @string_mark, align 4
  %189 = icmp ne i32 %187, %188
  br i1 %189, label %190, label %242

; <label>:190                                     ; preds = %179
  %191 = sub nsw i32 %pos, 1
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %192
  %194 = load i32* %193, align 4
  %195 = sub nsw i32 %pos, 1
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %196
  %198 = load i32* %197, align 4
  %199 = sext i32 %12 to i64
  %200 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %199
  %201 = getelementptr inbounds %struct.string_data* %200, i32 0, i32 5
  %202 = load i32* %201, align 4
  %203 = add nsw i32 %202, 1
  store i32 %203, i32* %201, align 4
  %204 = sext i32 %202 to i64
  %205 = sext i32 %12 to i64
  %206 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %205
  %207 = getelementptr inbounds %struct.string_data* %206, i32 0, i32 6
  %208 = getelementptr inbounds [160 x i32]* %207, i32 0, i64 %204
  store i32 %198, i32* %208, align 4
  %209 = sext i32 %194 to i64
  %210 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %209
  %211 = getelementptr inbounds %struct.string_data* %210, i32 0, i32 5
  %212 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %213 = getelementptr inbounds %struct.change_stack_entry* %212, i32 0, i32 0
  store i32* %211, i32** %213, align 8
  %214 = sext i32 %194 to i64
  %215 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %214
  %216 = getelementptr inbounds %struct.string_data* %215, i32 0, i32 5
  %217 = load i32* %216, align 4
  %218 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %219 = getelementptr inbounds %struct.change_stack_entry* %218, i32 1
  store %struct.change_stack_entry* %219, %struct.change_stack_entry** @change_stack_pointer, align 8
  %220 = getelementptr inbounds %struct.change_stack_entry* %218, i32 0, i32 1
  store i32 %217, i32* %220, align 4
  %221 = sext i32 %pos to i64
  %222 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %221
  %223 = load i32* %222, align 4
  %224 = sext i32 %194 to i64
  %225 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %224
  %226 = getelementptr inbounds %struct.string_data* %225, i32 0, i32 5
  %227 = load i32* %226, align 4
  %228 = add nsw i32 %227, 1
  store i32 %228, i32* %226, align 4
  %229 = sext i32 %227 to i64
  %230 = sext i32 %194 to i64
  %231 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %230
  %232 = getelementptr inbounds %struct.string_data* %231, i32 0, i32 6
  %233 = getelementptr inbounds [160 x i32]* %232, i32 0, i64 %229
  store i32 %223, i32* %233, align 4
  %234 = load i32* @string_mark, align 4
  %235 = sub nsw i32 %pos, 1
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %236
  %238 = load i32* %237, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %239
  %241 = getelementptr inbounds %struct.string_data* %240, i32 0, i32 7
  store i32 %234, i32* %241, align 4
  br label %242

; <label>:242                                     ; preds = %190, %179, %172
  br label %243

; <label>:243                                     ; preds = %242, %171
  %244 = sub nsw i32 %pos, 20
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %245
  %247 = load i8* %246, align 1
  %248 = zext i8 %247 to i32
  %249 = icmp eq i32 %248, 0
  br i1 %249, label %250, label %275

; <label>:250                                     ; preds = %243
  br label %251

; <label>:251                                     ; preds = %250
  %252 = sext i32 %12 to i64
  %253 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %252
  %254 = getelementptr inbounds %struct.string_data* %253, i32 0, i32 3
  %255 = load i32* %254, align 4
  %256 = icmp slt i32 %255, 20
  br i1 %256, label %257, label %268

; <label>:257                                     ; preds = %251
  %258 = sub nsw i32 %pos, 20
  %259 = sext i32 %12 to i64
  %260 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %259
  %261 = getelementptr inbounds %struct.string_data* %260, i32 0, i32 3
  %262 = load i32* %261, align 4
  %263 = sext i32 %262 to i64
  %264 = sext i32 %12 to i64
  %265 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %264
  %266 = getelementptr inbounds %struct.string_data* %265, i32 0, i32 4
  %267 = getelementptr inbounds [20 x i32]* %266, i32 0, i64 %263
  store i32 %258, i32* %267, align 4
  br label %268

; <label>:268                                     ; preds = %257, %251
  %269 = sext i32 %12 to i64
  %270 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %269
  %271 = getelementptr inbounds %struct.string_data* %270, i32 0, i32 3
  %272 = load i32* %271, align 4
  %273 = add nsw i32 %272, 1
  store i32 %273, i32* %271, align 4
  br label %274

; <label>:274                                     ; preds = %268
  br label %346

; <label>:275                                     ; preds = %243
  %276 = sub nsw i32 %pos, 20
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %277
  %279 = load i8* %278, align 1
  %280 = zext i8 %279 to i32
  %281 = icmp eq i32 %280, %5
  br i1 %281, label %282, label %345

; <label>:282                                     ; preds = %275
  %283 = sub nsw i32 %pos, 20
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %284
  %286 = load i32* %285, align 4
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %287
  %289 = getelementptr inbounds %struct.string_data* %288, i32 0, i32 7
  %290 = load i32* %289, align 4
  %291 = load i32* @string_mark, align 4
  %292 = icmp ne i32 %290, %291
  br i1 %292, label %293, label %345

; <label>:293                                     ; preds = %282
  %294 = sub nsw i32 %pos, 20
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %295
  %297 = load i32* %296, align 4
  %298 = sub nsw i32 %pos, 20
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %299
  %301 = load i32* %300, align 4
  %302 = sext i32 %12 to i64
  %303 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %302
  %304 = getelementptr inbounds %struct.string_data* %303, i32 0, i32 5
  %305 = load i32* %304, align 4
  %306 = add nsw i32 %305, 1
  store i32 %306, i32* %304, align 4
  %307 = sext i32 %305 to i64
  %308 = sext i32 %12 to i64
  %309 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %308
  %310 = getelementptr inbounds %struct.string_data* %309, i32 0, i32 6
  %311 = getelementptr inbounds [160 x i32]* %310, i32 0, i64 %307
  store i32 %301, i32* %311, align 4
  %312 = sext i32 %297 to i64
  %313 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %312
  %314 = getelementptr inbounds %struct.string_data* %313, i32 0, i32 5
  %315 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %316 = getelementptr inbounds %struct.change_stack_entry* %315, i32 0, i32 0
  store i32* %314, i32** %316, align 8
  %317 = sext i32 %297 to i64
  %318 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %317
  %319 = getelementptr inbounds %struct.string_data* %318, i32 0, i32 5
  %320 = load i32* %319, align 4
  %321 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %322 = getelementptr inbounds %struct.change_stack_entry* %321, i32 1
  store %struct.change_stack_entry* %322, %struct.change_stack_entry** @change_stack_pointer, align 8
  %323 = getelementptr inbounds %struct.change_stack_entry* %321, i32 0, i32 1
  store i32 %320, i32* %323, align 4
  %324 = sext i32 %pos to i64
  %325 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %324
  %326 = load i32* %325, align 4
  %327 = sext i32 %297 to i64
  %328 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %327
  %329 = getelementptr inbounds %struct.string_data* %328, i32 0, i32 5
  %330 = load i32* %329, align 4
  %331 = add nsw i32 %330, 1
  store i32 %331, i32* %329, align 4
  %332 = sext i32 %330 to i64
  %333 = sext i32 %297 to i64
  %334 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %333
  %335 = getelementptr inbounds %struct.string_data* %334, i32 0, i32 6
  %336 = getelementptr inbounds [160 x i32]* %335, i32 0, i64 %332
  store i32 %326, i32* %336, align 4
  %337 = load i32* @string_mark, align 4
  %338 = sub nsw i32 %pos, 20
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %339
  %341 = load i32* %340, align 4
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %342
  %344 = getelementptr inbounds %struct.string_data* %343, i32 0, i32 7
  store i32 %337, i32* %344, align 4
  br label %345

; <label>:345                                     ; preds = %293, %282, %275
  br label %346

; <label>:346                                     ; preds = %345, %274
  %347 = add nsw i32 %pos, 1
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %348
  %350 = load i8* %349, align 1
  %351 = zext i8 %350 to i32
  %352 = icmp eq i32 %351, 0
  br i1 %352, label %353, label %378

; <label>:353                                     ; preds = %346
  br label %354

; <label>:354                                     ; preds = %353
  %355 = sext i32 %12 to i64
  %356 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %355
  %357 = getelementptr inbounds %struct.string_data* %356, i32 0, i32 3
  %358 = load i32* %357, align 4
  %359 = icmp slt i32 %358, 20
  br i1 %359, label %360, label %371

; <label>:360                                     ; preds = %354
  %361 = add nsw i32 %pos, 1
  %362 = sext i32 %12 to i64
  %363 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %362
  %364 = getelementptr inbounds %struct.string_data* %363, i32 0, i32 3
  %365 = load i32* %364, align 4
  %366 = sext i32 %365 to i64
  %367 = sext i32 %12 to i64
  %368 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %367
  %369 = getelementptr inbounds %struct.string_data* %368, i32 0, i32 4
  %370 = getelementptr inbounds [20 x i32]* %369, i32 0, i64 %366
  store i32 %361, i32* %370, align 4
  br label %371

; <label>:371                                     ; preds = %360, %354
  %372 = sext i32 %12 to i64
  %373 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %372
  %374 = getelementptr inbounds %struct.string_data* %373, i32 0, i32 3
  %375 = load i32* %374, align 4
  %376 = add nsw i32 %375, 1
  store i32 %376, i32* %374, align 4
  br label %377

; <label>:377                                     ; preds = %371
  br label %441

; <label>:378                                     ; preds = %346
  %379 = add nsw i32 %pos, 1
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %380
  %382 = load i8* %381, align 1
  %383 = zext i8 %382 to i32
  %384 = icmp eq i32 %383, %5
  br i1 %384, label %385, label %440

; <label>:385                                     ; preds = %378
  %386 = add nsw i32 %pos, 1
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %387
  %389 = load i32* %388, align 4
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %390
  %392 = getelementptr inbounds %struct.string_data* %391, i32 0, i32 7
  %393 = load i32* %392, align 4
  %394 = load i32* @string_mark, align 4
  %395 = icmp ne i32 %393, %394
  br i1 %395, label %396, label %440

; <label>:396                                     ; preds = %385
  %397 = add nsw i32 %pos, 1
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %398
  %400 = load i32* %399, align 4
  %401 = add nsw i32 %pos, 1
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %402
  %404 = load i32* %403, align 4
  %405 = sext i32 %12 to i64
  %406 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %405
  %407 = getelementptr inbounds %struct.string_data* %406, i32 0, i32 5
  %408 = load i32* %407, align 4
  %409 = add nsw i32 %408, 1
  store i32 %409, i32* %407, align 4
  %410 = sext i32 %408 to i64
  %411 = sext i32 %12 to i64
  %412 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %411
  %413 = getelementptr inbounds %struct.string_data* %412, i32 0, i32 6
  %414 = getelementptr inbounds [160 x i32]* %413, i32 0, i64 %410
  store i32 %404, i32* %414, align 4
  %415 = sext i32 %400 to i64
  %416 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %415
  %417 = getelementptr inbounds %struct.string_data* %416, i32 0, i32 5
  %418 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %419 = getelementptr inbounds %struct.change_stack_entry* %418, i32 0, i32 0
  store i32* %417, i32** %419, align 8
  %420 = sext i32 %400 to i64
  %421 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %420
  %422 = getelementptr inbounds %struct.string_data* %421, i32 0, i32 5
  %423 = load i32* %422, align 4
  %424 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %425 = getelementptr inbounds %struct.change_stack_entry* %424, i32 1
  store %struct.change_stack_entry* %425, %struct.change_stack_entry** @change_stack_pointer, align 8
  %426 = getelementptr inbounds %struct.change_stack_entry* %424, i32 0, i32 1
  store i32 %423, i32* %426, align 4
  %427 = sext i32 %pos to i64
  %428 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %427
  %429 = load i32* %428, align 4
  %430 = sext i32 %400 to i64
  %431 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %430
  %432 = getelementptr inbounds %struct.string_data* %431, i32 0, i32 5
  %433 = load i32* %432, align 4
  %434 = add nsw i32 %433, 1
  store i32 %434, i32* %432, align 4
  %435 = sext i32 %433 to i64
  %436 = sext i32 %400 to i64
  %437 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %436
  %438 = getelementptr inbounds %struct.string_data* %437, i32 0, i32 6
  %439 = getelementptr inbounds [160 x i32]* %438, i32 0, i64 %435
  store i32 %429, i32* %439, align 4
  br label %440

; <label>:440                                     ; preds = %396, %385, %378
  br label %441

; <label>:441                                     ; preds = %440, %377
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @extend_neighbor_string(i32 %pos, i32 %s) #0 {
  %1 = sext i32 %pos to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = sub nsw i32 3, %4
  %6 = sext i32 %s to i64
  %7 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %6
  %8 = getelementptr inbounds %struct.string_data* %7, i32 0, i32 2
  %9 = load i32* %8, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %10
  %12 = load i32* %11, align 4
  %13 = sext i32 %pos to i64
  %14 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %13
  store i32 %12, i32* %14, align 4
  %15 = sext i32 %9 to i64
  %16 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %15
  %17 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %18 = getelementptr inbounds %struct.change_stack_entry* %17, i32 0, i32 0
  store i32* %16, i32** %18, align 8
  %19 = sext i32 %9 to i64
  %20 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %23 = getelementptr inbounds %struct.change_stack_entry* %22, i32 1
  store %struct.change_stack_entry* %23, %struct.change_stack_entry** @change_stack_pointer, align 8
  %24 = getelementptr inbounds %struct.change_stack_entry* %22, i32 0, i32 1
  store i32 %21, i32* %24, align 4
  %25 = sext i32 %9 to i64
  %26 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %25
  store i32 %pos, i32* %26, align 4
  %27 = icmp slt i32 %pos, %9
  br i1 %27, label %28, label %44

; <label>:28                                      ; preds = %0
  %29 = sext i32 %s to i64
  %30 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %29
  %31 = getelementptr inbounds %struct.string_data* %30, i32 0, i32 2
  %32 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %33 = getelementptr inbounds %struct.change_stack_entry* %32, i32 0, i32 0
  store i32* %31, i32** %33, align 8
  %34 = sext i32 %s to i64
  %35 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %34
  %36 = getelementptr inbounds %struct.string_data* %35, i32 0, i32 2
  %37 = load i32* %36, align 4
  %38 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %39 = getelementptr inbounds %struct.change_stack_entry* %38, i32 1
  store %struct.change_stack_entry* %39, %struct.change_stack_entry** @change_stack_pointer, align 8
  %40 = getelementptr inbounds %struct.change_stack_entry* %38, i32 0, i32 1
  store i32 %37, i32* %40, align 4
  %41 = sext i32 %s to i64
  %42 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %41
  %43 = getelementptr inbounds %struct.string_data* %42, i32 0, i32 2
  store i32 %pos, i32* %43, align 4
  br label %44

; <label>:44                                      ; preds = %28, %0
  %45 = sext i32 %pos to i64
  %46 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %45
  store i32 %s, i32* %46, align 4
  %47 = sext i32 %s to i64
  %48 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %47
  %49 = getelementptr inbounds %struct.string_data* %48, i32 0, i32 1
  %50 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %51 = getelementptr inbounds %struct.change_stack_entry* %50, i32 0, i32 0
  store i32* %49, i32** %51, align 8
  %52 = sext i32 %s to i64
  %53 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %52
  %54 = getelementptr inbounds %struct.string_data* %53, i32 0, i32 1
  %55 = load i32* %54, align 4
  %56 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %57 = getelementptr inbounds %struct.change_stack_entry* %56, i32 1
  store %struct.change_stack_entry* %57, %struct.change_stack_entry** @change_stack_pointer, align 8
  %58 = getelementptr inbounds %struct.change_stack_entry* %56, i32 0, i32 1
  store i32 %55, i32* %58, align 4
  %59 = sext i32 %s to i64
  %60 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %59
  %61 = getelementptr inbounds %struct.string_data* %60, i32 0, i32 1
  %62 = load i32* %61, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %61, align 4
  %64 = sext i32 %s to i64
  %65 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %64
  %66 = getelementptr inbounds %struct.string_data* %65, i32 0, i32 3
  %67 = load i32* %66, align 4
  %68 = icmp sgt i32 %67, 20
  br i1 %68, label %69, label %70

; <label>:69                                      ; preds = %44
  call void @update_liberties(i32 %s)
  br label %71

; <label>:70                                      ; preds = %44
  call void @remove_liberty(i32 %s, i32 %pos)
  br label %71

; <label>:71                                      ; preds = %70, %69
  %liberties_updated.0 = phi i32 [ 1, %69 ], [ 0, %70 ]
  %72 = load i32* @string_mark, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* @string_mark, align 4
  br label %74

; <label>:74                                      ; preds = %91, %71
  %k.0 = phi i32 [ 0, %71 ], [ %92, %91 ]
  %75 = sext i32 %s to i64
  %76 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %75
  %77 = getelementptr inbounds %struct.string_data* %76, i32 0, i32 5
  %78 = load i32* %77, align 4
  %79 = icmp slt i32 %k.0, %78
  br i1 %79, label %80, label %93

; <label>:80                                      ; preds = %74
  %81 = load i32* @string_mark, align 4
  %82 = sext i32 %k.0 to i64
  %83 = sext i32 %s to i64
  %84 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %83
  %85 = getelementptr inbounds %struct.string_data* %84, i32 0, i32 6
  %86 = getelementptr inbounds [160 x i32]* %85, i32 0, i64 %82
  %87 = load i32* %86, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %88
  %90 = getelementptr inbounds %struct.string_data* %89, i32 0, i32 7
  store i32 %81, i32* %90, align 4
  br label %91

; <label>:91                                      ; preds = %80
  %92 = add nsw i32 %k.0, 1
  br label %74

; <label>:93                                      ; preds = %74
  %94 = add nsw i32 %pos, 20
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %95
  %97 = load i8* %96, align 1
  %98 = zext i8 %97 to i32
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %173

; <label>:100                                     ; preds = %93
  %101 = icmp ne i32 %liberties_updated.0, 0
  br i1 %101, label %172, label %102

; <label>:102                                     ; preds = %100
  %103 = add nsw i32 %pos, 20
  %104 = add nsw i32 %103, 20
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %105
  %107 = load i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = icmp eq i32 %108, %4
  br i1 %109, label %110, label %117

; <label>:110                                     ; preds = %102
  %111 = add nsw i32 %pos, 20
  %112 = add nsw i32 %111, 20
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %113
  %115 = load i32* %114, align 4
  %116 = icmp eq i32 %115, %s
  br i1 %116, label %172, label %117

; <label>:117                                     ; preds = %110, %102
  %118 = add nsw i32 %pos, 20
  %119 = sub nsw i32 %118, 1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %120
  %122 = load i8* %121, align 1
  %123 = zext i8 %122 to i32
  %124 = icmp eq i32 %123, %4
  br i1 %124, label %125, label %132

; <label>:125                                     ; preds = %117
  %126 = add nsw i32 %pos, 20
  %127 = sub nsw i32 %126, 1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %128
  %130 = load i32* %129, align 4
  %131 = icmp eq i32 %130, %s
  br i1 %131, label %172, label %132

; <label>:132                                     ; preds = %125, %117
  %133 = add nsw i32 %pos, 20
  %134 = add nsw i32 %133, 1
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %135
  %137 = load i8* %136, align 1
  %138 = zext i8 %137 to i32
  %139 = icmp eq i32 %138, %4
  br i1 %139, label %140, label %147

; <label>:140                                     ; preds = %132
  %141 = add nsw i32 %pos, 20
  %142 = add nsw i32 %141, 1
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %143
  %145 = load i32* %144, align 4
  %146 = icmp eq i32 %145, %s
  br i1 %146, label %172, label %147

; <label>:147                                     ; preds = %140, %132
  br label %148

; <label>:148                                     ; preds = %147
  %149 = sext i32 %s to i64
  %150 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %149
  %151 = getelementptr inbounds %struct.string_data* %150, i32 0, i32 3
  %152 = load i32* %151, align 4
  %153 = icmp slt i32 %152, 20
  br i1 %153, label %154, label %165

; <label>:154                                     ; preds = %148
  %155 = add nsw i32 %pos, 20
  %156 = sext i32 %s to i64
  %157 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %156
  %158 = getelementptr inbounds %struct.string_data* %157, i32 0, i32 3
  %159 = load i32* %158, align 4
  %160 = sext i32 %159 to i64
  %161 = sext i32 %s to i64
  %162 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %161
  %163 = getelementptr inbounds %struct.string_data* %162, i32 0, i32 4
  %164 = getelementptr inbounds [20 x i32]* %163, i32 0, i64 %160
  store i32 %155, i32* %164, align 4
  br label %165

; <label>:165                                     ; preds = %154, %148
  %166 = sext i32 %s to i64
  %167 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %166
  %168 = getelementptr inbounds %struct.string_data* %167, i32 0, i32 3
  %169 = load i32* %168, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, i32* %168, align 4
  br label %171

; <label>:171                                     ; preds = %165
  br label %172

; <label>:172                                     ; preds = %171, %140, %125, %110, %100
  br label %256

; <label>:173                                     ; preds = %93
  %174 = add nsw i32 %pos, 20
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %175
  %177 = load i8* %176, align 1
  %178 = zext i8 %177 to i32
  %179 = icmp eq i32 %178, %5
  br i1 %179, label %180, label %255

; <label>:180                                     ; preds = %173
  %181 = add nsw i32 %pos, 20
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %182
  %184 = load i32* %183, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %185
  %187 = getelementptr inbounds %struct.string_data* %186, i32 0, i32 7
  %188 = load i32* %187, align 4
  %189 = load i32* @string_mark, align 4
  %190 = icmp ne i32 %188, %189
  br i1 %190, label %191, label %255

; <label>:191                                     ; preds = %180
  %192 = add nsw i32 %pos, 20
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %193
  %195 = load i32* %194, align 4
  %196 = sext i32 %s to i64
  %197 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %196
  %198 = getelementptr inbounds %struct.string_data* %197, i32 0, i32 5
  %199 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %200 = getelementptr inbounds %struct.change_stack_entry* %199, i32 0, i32 0
  store i32* %198, i32** %200, align 8
  %201 = sext i32 %s to i64
  %202 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %201
  %203 = getelementptr inbounds %struct.string_data* %202, i32 0, i32 5
  %204 = load i32* %203, align 4
  %205 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %206 = getelementptr inbounds %struct.change_stack_entry* %205, i32 1
  store %struct.change_stack_entry* %206, %struct.change_stack_entry** @change_stack_pointer, align 8
  %207 = getelementptr inbounds %struct.change_stack_entry* %205, i32 0, i32 1
  store i32 %204, i32* %207, align 4
  %208 = add nsw i32 %pos, 20
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %209
  %211 = load i32* %210, align 4
  %212 = sext i32 %s to i64
  %213 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %212
  %214 = getelementptr inbounds %struct.string_data* %213, i32 0, i32 5
  %215 = load i32* %214, align 4
  %216 = add nsw i32 %215, 1
  store i32 %216, i32* %214, align 4
  %217 = sext i32 %215 to i64
  %218 = sext i32 %s to i64
  %219 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %218
  %220 = getelementptr inbounds %struct.string_data* %219, i32 0, i32 6
  %221 = getelementptr inbounds [160 x i32]* %220, i32 0, i64 %217
  store i32 %211, i32* %221, align 4
  %222 = sext i32 %195 to i64
  %223 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %222
  %224 = getelementptr inbounds %struct.string_data* %223, i32 0, i32 5
  %225 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %226 = getelementptr inbounds %struct.change_stack_entry* %225, i32 0, i32 0
  store i32* %224, i32** %226, align 8
  %227 = sext i32 %195 to i64
  %228 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %227
  %229 = getelementptr inbounds %struct.string_data* %228, i32 0, i32 5
  %230 = load i32* %229, align 4
  %231 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %232 = getelementptr inbounds %struct.change_stack_entry* %231, i32 1
  store %struct.change_stack_entry* %232, %struct.change_stack_entry** @change_stack_pointer, align 8
  %233 = getelementptr inbounds %struct.change_stack_entry* %231, i32 0, i32 1
  store i32 %230, i32* %233, align 4
  %234 = sext i32 %pos to i64
  %235 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %234
  %236 = load i32* %235, align 4
  %237 = sext i32 %195 to i64
  %238 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %237
  %239 = getelementptr inbounds %struct.string_data* %238, i32 0, i32 5
  %240 = load i32* %239, align 4
  %241 = add nsw i32 %240, 1
  store i32 %241, i32* %239, align 4
  %242 = sext i32 %240 to i64
  %243 = sext i32 %195 to i64
  %244 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %243
  %245 = getelementptr inbounds %struct.string_data* %244, i32 0, i32 6
  %246 = getelementptr inbounds [160 x i32]* %245, i32 0, i64 %242
  store i32 %236, i32* %246, align 4
  %247 = load i32* @string_mark, align 4
  %248 = add nsw i32 %pos, 20
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %249
  %251 = load i32* %250, align 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %252
  %254 = getelementptr inbounds %struct.string_data* %253, i32 0, i32 7
  store i32 %247, i32* %254, align 4
  br label %255

; <label>:255                                     ; preds = %191, %180, %173
  br label %256

; <label>:256                                     ; preds = %255, %172
  %257 = sub nsw i32 %pos, 1
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %258
  %260 = load i8* %259, align 1
  %261 = zext i8 %260 to i32
  %262 = icmp eq i32 %261, 0
  br i1 %262, label %263, label %336

; <label>:263                                     ; preds = %256
  %264 = icmp ne i32 %liberties_updated.0, 0
  br i1 %264, label %335, label %265

; <label>:265                                     ; preds = %263
  %266 = sub nsw i32 %pos, 1
  %267 = sub nsw i32 %266, 1
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %268
  %270 = load i8* %269, align 1
  %271 = zext i8 %270 to i32
  %272 = icmp eq i32 %271, %4
  br i1 %272, label %273, label %280

; <label>:273                                     ; preds = %265
  %274 = sub nsw i32 %pos, 1
  %275 = sub nsw i32 %274, 1
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %276
  %278 = load i32* %277, align 4
  %279 = icmp eq i32 %278, %s
  br i1 %279, label %335, label %280

; <label>:280                                     ; preds = %273, %265
  %281 = sub nsw i32 %pos, 1
  %282 = sub nsw i32 %281, 20
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %283
  %285 = load i8* %284, align 1
  %286 = zext i8 %285 to i32
  %287 = icmp eq i32 %286, %4
  br i1 %287, label %288, label %295

; <label>:288                                     ; preds = %280
  %289 = sub nsw i32 %pos, 1
  %290 = sub nsw i32 %289, 20
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %291
  %293 = load i32* %292, align 4
  %294 = icmp eq i32 %293, %s
  br i1 %294, label %335, label %295

; <label>:295                                     ; preds = %288, %280
  %296 = sub nsw i32 %pos, 1
  %297 = add nsw i32 %296, 20
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %298
  %300 = load i8* %299, align 1
  %301 = zext i8 %300 to i32
  %302 = icmp eq i32 %301, %4
  br i1 %302, label %303, label %310

; <label>:303                                     ; preds = %295
  %304 = sub nsw i32 %pos, 1
  %305 = add nsw i32 %304, 20
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %306
  %308 = load i32* %307, align 4
  %309 = icmp eq i32 %308, %s
  br i1 %309, label %335, label %310

; <label>:310                                     ; preds = %303, %295
  br label %311

; <label>:311                                     ; preds = %310
  %312 = sext i32 %s to i64
  %313 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %312
  %314 = getelementptr inbounds %struct.string_data* %313, i32 0, i32 3
  %315 = load i32* %314, align 4
  %316 = icmp slt i32 %315, 20
  br i1 %316, label %317, label %328

; <label>:317                                     ; preds = %311
  %318 = sub nsw i32 %pos, 1
  %319 = sext i32 %s to i64
  %320 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %319
  %321 = getelementptr inbounds %struct.string_data* %320, i32 0, i32 3
  %322 = load i32* %321, align 4
  %323 = sext i32 %322 to i64
  %324 = sext i32 %s to i64
  %325 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %324
  %326 = getelementptr inbounds %struct.string_data* %325, i32 0, i32 4
  %327 = getelementptr inbounds [20 x i32]* %326, i32 0, i64 %323
  store i32 %318, i32* %327, align 4
  br label %328

; <label>:328                                     ; preds = %317, %311
  %329 = sext i32 %s to i64
  %330 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %329
  %331 = getelementptr inbounds %struct.string_data* %330, i32 0, i32 3
  %332 = load i32* %331, align 4
  %333 = add nsw i32 %332, 1
  store i32 %333, i32* %331, align 4
  br label %334

; <label>:334                                     ; preds = %328
  br label %335

; <label>:335                                     ; preds = %334, %303, %288, %273, %263
  br label %419

; <label>:336                                     ; preds = %256
  %337 = sub nsw i32 %pos, 1
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %338
  %340 = load i8* %339, align 1
  %341 = zext i8 %340 to i32
  %342 = icmp eq i32 %341, %5
  br i1 %342, label %343, label %418

; <label>:343                                     ; preds = %336
  %344 = sub nsw i32 %pos, 1
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %345
  %347 = load i32* %346, align 4
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %348
  %350 = getelementptr inbounds %struct.string_data* %349, i32 0, i32 7
  %351 = load i32* %350, align 4
  %352 = load i32* @string_mark, align 4
  %353 = icmp ne i32 %351, %352
  br i1 %353, label %354, label %418

; <label>:354                                     ; preds = %343
  %355 = sub nsw i32 %pos, 1
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %356
  %358 = load i32* %357, align 4
  %359 = sext i32 %s to i64
  %360 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %359
  %361 = getelementptr inbounds %struct.string_data* %360, i32 0, i32 5
  %362 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %363 = getelementptr inbounds %struct.change_stack_entry* %362, i32 0, i32 0
  store i32* %361, i32** %363, align 8
  %364 = sext i32 %s to i64
  %365 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %364
  %366 = getelementptr inbounds %struct.string_data* %365, i32 0, i32 5
  %367 = load i32* %366, align 4
  %368 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %369 = getelementptr inbounds %struct.change_stack_entry* %368, i32 1
  store %struct.change_stack_entry* %369, %struct.change_stack_entry** @change_stack_pointer, align 8
  %370 = getelementptr inbounds %struct.change_stack_entry* %368, i32 0, i32 1
  store i32 %367, i32* %370, align 4
  %371 = sub nsw i32 %pos, 1
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %372
  %374 = load i32* %373, align 4
  %375 = sext i32 %s to i64
  %376 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %375
  %377 = getelementptr inbounds %struct.string_data* %376, i32 0, i32 5
  %378 = load i32* %377, align 4
  %379 = add nsw i32 %378, 1
  store i32 %379, i32* %377, align 4
  %380 = sext i32 %378 to i64
  %381 = sext i32 %s to i64
  %382 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %381
  %383 = getelementptr inbounds %struct.string_data* %382, i32 0, i32 6
  %384 = getelementptr inbounds [160 x i32]* %383, i32 0, i64 %380
  store i32 %374, i32* %384, align 4
  %385 = sext i32 %358 to i64
  %386 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %385
  %387 = getelementptr inbounds %struct.string_data* %386, i32 0, i32 5
  %388 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %389 = getelementptr inbounds %struct.change_stack_entry* %388, i32 0, i32 0
  store i32* %387, i32** %389, align 8
  %390 = sext i32 %358 to i64
  %391 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %390
  %392 = getelementptr inbounds %struct.string_data* %391, i32 0, i32 5
  %393 = load i32* %392, align 4
  %394 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %395 = getelementptr inbounds %struct.change_stack_entry* %394, i32 1
  store %struct.change_stack_entry* %395, %struct.change_stack_entry** @change_stack_pointer, align 8
  %396 = getelementptr inbounds %struct.change_stack_entry* %394, i32 0, i32 1
  store i32 %393, i32* %396, align 4
  %397 = sext i32 %pos to i64
  %398 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %397
  %399 = load i32* %398, align 4
  %400 = sext i32 %358 to i64
  %401 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %400
  %402 = getelementptr inbounds %struct.string_data* %401, i32 0, i32 5
  %403 = load i32* %402, align 4
  %404 = add nsw i32 %403, 1
  store i32 %404, i32* %402, align 4
  %405 = sext i32 %403 to i64
  %406 = sext i32 %358 to i64
  %407 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %406
  %408 = getelementptr inbounds %struct.string_data* %407, i32 0, i32 6
  %409 = getelementptr inbounds [160 x i32]* %408, i32 0, i64 %405
  store i32 %399, i32* %409, align 4
  %410 = load i32* @string_mark, align 4
  %411 = sub nsw i32 %pos, 1
  %412 = sext i32 %411 to i64
  %413 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %412
  %414 = load i32* %413, align 4
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %415
  %417 = getelementptr inbounds %struct.string_data* %416, i32 0, i32 7
  store i32 %410, i32* %417, align 4
  br label %418

; <label>:418                                     ; preds = %354, %343, %336
  br label %419

; <label>:419                                     ; preds = %418, %335
  %420 = sub nsw i32 %pos, 20
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %421
  %423 = load i8* %422, align 1
  %424 = zext i8 %423 to i32
  %425 = icmp eq i32 %424, 0
  br i1 %425, label %426, label %499

; <label>:426                                     ; preds = %419
  %427 = icmp ne i32 %liberties_updated.0, 0
  br i1 %427, label %498, label %428

; <label>:428                                     ; preds = %426
  %429 = sub nsw i32 %pos, 20
  %430 = sub nsw i32 %429, 20
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %431
  %433 = load i8* %432, align 1
  %434 = zext i8 %433 to i32
  %435 = icmp eq i32 %434, %4
  br i1 %435, label %436, label %443

; <label>:436                                     ; preds = %428
  %437 = sub nsw i32 %pos, 20
  %438 = sub nsw i32 %437, 20
  %439 = sext i32 %438 to i64
  %440 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %439
  %441 = load i32* %440, align 4
  %442 = icmp eq i32 %441, %s
  br i1 %442, label %498, label %443

; <label>:443                                     ; preds = %436, %428
  %444 = sub nsw i32 %pos, 20
  %445 = add nsw i32 %444, 1
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %446
  %448 = load i8* %447, align 1
  %449 = zext i8 %448 to i32
  %450 = icmp eq i32 %449, %4
  br i1 %450, label %451, label %458

; <label>:451                                     ; preds = %443
  %452 = sub nsw i32 %pos, 20
  %453 = add nsw i32 %452, 1
  %454 = sext i32 %453 to i64
  %455 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %454
  %456 = load i32* %455, align 4
  %457 = icmp eq i32 %456, %s
  br i1 %457, label %498, label %458

; <label>:458                                     ; preds = %451, %443
  %459 = sub nsw i32 %pos, 20
  %460 = sub nsw i32 %459, 1
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %461
  %463 = load i8* %462, align 1
  %464 = zext i8 %463 to i32
  %465 = icmp eq i32 %464, %4
  br i1 %465, label %466, label %473

; <label>:466                                     ; preds = %458
  %467 = sub nsw i32 %pos, 20
  %468 = sub nsw i32 %467, 1
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %469
  %471 = load i32* %470, align 4
  %472 = icmp eq i32 %471, %s
  br i1 %472, label %498, label %473

; <label>:473                                     ; preds = %466, %458
  br label %474

; <label>:474                                     ; preds = %473
  %475 = sext i32 %s to i64
  %476 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %475
  %477 = getelementptr inbounds %struct.string_data* %476, i32 0, i32 3
  %478 = load i32* %477, align 4
  %479 = icmp slt i32 %478, 20
  br i1 %479, label %480, label %491

; <label>:480                                     ; preds = %474
  %481 = sub nsw i32 %pos, 20
  %482 = sext i32 %s to i64
  %483 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %482
  %484 = getelementptr inbounds %struct.string_data* %483, i32 0, i32 3
  %485 = load i32* %484, align 4
  %486 = sext i32 %485 to i64
  %487 = sext i32 %s to i64
  %488 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %487
  %489 = getelementptr inbounds %struct.string_data* %488, i32 0, i32 4
  %490 = getelementptr inbounds [20 x i32]* %489, i32 0, i64 %486
  store i32 %481, i32* %490, align 4
  br label %491

; <label>:491                                     ; preds = %480, %474
  %492 = sext i32 %s to i64
  %493 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %492
  %494 = getelementptr inbounds %struct.string_data* %493, i32 0, i32 3
  %495 = load i32* %494, align 4
  %496 = add nsw i32 %495, 1
  store i32 %496, i32* %494, align 4
  br label %497

; <label>:497                                     ; preds = %491
  br label %498

; <label>:498                                     ; preds = %497, %466, %451, %436, %426
  br label %582

; <label>:499                                     ; preds = %419
  %500 = sub nsw i32 %pos, 20
  %501 = sext i32 %500 to i64
  %502 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %501
  %503 = load i8* %502, align 1
  %504 = zext i8 %503 to i32
  %505 = icmp eq i32 %504, %5
  br i1 %505, label %506, label %581

; <label>:506                                     ; preds = %499
  %507 = sub nsw i32 %pos, 20
  %508 = sext i32 %507 to i64
  %509 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %508
  %510 = load i32* %509, align 4
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %511
  %513 = getelementptr inbounds %struct.string_data* %512, i32 0, i32 7
  %514 = load i32* %513, align 4
  %515 = load i32* @string_mark, align 4
  %516 = icmp ne i32 %514, %515
  br i1 %516, label %517, label %581

; <label>:517                                     ; preds = %506
  %518 = sub nsw i32 %pos, 20
  %519 = sext i32 %518 to i64
  %520 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %519
  %521 = load i32* %520, align 4
  %522 = sext i32 %s to i64
  %523 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %522
  %524 = getelementptr inbounds %struct.string_data* %523, i32 0, i32 5
  %525 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %526 = getelementptr inbounds %struct.change_stack_entry* %525, i32 0, i32 0
  store i32* %524, i32** %526, align 8
  %527 = sext i32 %s to i64
  %528 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %527
  %529 = getelementptr inbounds %struct.string_data* %528, i32 0, i32 5
  %530 = load i32* %529, align 4
  %531 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %532 = getelementptr inbounds %struct.change_stack_entry* %531, i32 1
  store %struct.change_stack_entry* %532, %struct.change_stack_entry** @change_stack_pointer, align 8
  %533 = getelementptr inbounds %struct.change_stack_entry* %531, i32 0, i32 1
  store i32 %530, i32* %533, align 4
  %534 = sub nsw i32 %pos, 20
  %535 = sext i32 %534 to i64
  %536 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %535
  %537 = load i32* %536, align 4
  %538 = sext i32 %s to i64
  %539 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %538
  %540 = getelementptr inbounds %struct.string_data* %539, i32 0, i32 5
  %541 = load i32* %540, align 4
  %542 = add nsw i32 %541, 1
  store i32 %542, i32* %540, align 4
  %543 = sext i32 %541 to i64
  %544 = sext i32 %s to i64
  %545 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %544
  %546 = getelementptr inbounds %struct.string_data* %545, i32 0, i32 6
  %547 = getelementptr inbounds [160 x i32]* %546, i32 0, i64 %543
  store i32 %537, i32* %547, align 4
  %548 = sext i32 %521 to i64
  %549 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %548
  %550 = getelementptr inbounds %struct.string_data* %549, i32 0, i32 5
  %551 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %552 = getelementptr inbounds %struct.change_stack_entry* %551, i32 0, i32 0
  store i32* %550, i32** %552, align 8
  %553 = sext i32 %521 to i64
  %554 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %553
  %555 = getelementptr inbounds %struct.string_data* %554, i32 0, i32 5
  %556 = load i32* %555, align 4
  %557 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %558 = getelementptr inbounds %struct.change_stack_entry* %557, i32 1
  store %struct.change_stack_entry* %558, %struct.change_stack_entry** @change_stack_pointer, align 8
  %559 = getelementptr inbounds %struct.change_stack_entry* %557, i32 0, i32 1
  store i32 %556, i32* %559, align 4
  %560 = sext i32 %pos to i64
  %561 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %560
  %562 = load i32* %561, align 4
  %563 = sext i32 %521 to i64
  %564 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %563
  %565 = getelementptr inbounds %struct.string_data* %564, i32 0, i32 5
  %566 = load i32* %565, align 4
  %567 = add nsw i32 %566, 1
  store i32 %567, i32* %565, align 4
  %568 = sext i32 %566 to i64
  %569 = sext i32 %521 to i64
  %570 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %569
  %571 = getelementptr inbounds %struct.string_data* %570, i32 0, i32 6
  %572 = getelementptr inbounds [160 x i32]* %571, i32 0, i64 %568
  store i32 %562, i32* %572, align 4
  %573 = load i32* @string_mark, align 4
  %574 = sub nsw i32 %pos, 20
  %575 = sext i32 %574 to i64
  %576 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %575
  %577 = load i32* %576, align 4
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %578
  %580 = getelementptr inbounds %struct.string_data* %579, i32 0, i32 7
  store i32 %573, i32* %580, align 4
  br label %581

; <label>:581                                     ; preds = %517, %506, %499
  br label %582

; <label>:582                                     ; preds = %581, %498
  %583 = add nsw i32 %pos, 1
  %584 = sext i32 %583 to i64
  %585 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %584
  %586 = load i8* %585, align 1
  %587 = zext i8 %586 to i32
  %588 = icmp eq i32 %587, 0
  br i1 %588, label %589, label %662

; <label>:589                                     ; preds = %582
  %590 = icmp ne i32 %liberties_updated.0, 0
  br i1 %590, label %661, label %591

; <label>:591                                     ; preds = %589
  %592 = add nsw i32 %pos, 1
  %593 = add nsw i32 %592, 1
  %594 = sext i32 %593 to i64
  %595 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %594
  %596 = load i8* %595, align 1
  %597 = zext i8 %596 to i32
  %598 = icmp eq i32 %597, %4
  br i1 %598, label %599, label %606

; <label>:599                                     ; preds = %591
  %600 = add nsw i32 %pos, 1
  %601 = add nsw i32 %600, 1
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %602
  %604 = load i32* %603, align 4
  %605 = icmp eq i32 %604, %s
  br i1 %605, label %661, label %606

; <label>:606                                     ; preds = %599, %591
  %607 = add nsw i32 %pos, 1
  %608 = add nsw i32 %607, 20
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %609
  %611 = load i8* %610, align 1
  %612 = zext i8 %611 to i32
  %613 = icmp eq i32 %612, %4
  br i1 %613, label %614, label %621

; <label>:614                                     ; preds = %606
  %615 = add nsw i32 %pos, 1
  %616 = add nsw i32 %615, 20
  %617 = sext i32 %616 to i64
  %618 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %617
  %619 = load i32* %618, align 4
  %620 = icmp eq i32 %619, %s
  br i1 %620, label %661, label %621

; <label>:621                                     ; preds = %614, %606
  %622 = add nsw i32 %pos, 1
  %623 = sub nsw i32 %622, 20
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %624
  %626 = load i8* %625, align 1
  %627 = zext i8 %626 to i32
  %628 = icmp eq i32 %627, %4
  br i1 %628, label %629, label %636

; <label>:629                                     ; preds = %621
  %630 = add nsw i32 %pos, 1
  %631 = sub nsw i32 %630, 20
  %632 = sext i32 %631 to i64
  %633 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %632
  %634 = load i32* %633, align 4
  %635 = icmp eq i32 %634, %s
  br i1 %635, label %661, label %636

; <label>:636                                     ; preds = %629, %621
  br label %637

; <label>:637                                     ; preds = %636
  %638 = sext i32 %s to i64
  %639 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %638
  %640 = getelementptr inbounds %struct.string_data* %639, i32 0, i32 3
  %641 = load i32* %640, align 4
  %642 = icmp slt i32 %641, 20
  br i1 %642, label %643, label %654

; <label>:643                                     ; preds = %637
  %644 = add nsw i32 %pos, 1
  %645 = sext i32 %s to i64
  %646 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %645
  %647 = getelementptr inbounds %struct.string_data* %646, i32 0, i32 3
  %648 = load i32* %647, align 4
  %649 = sext i32 %648 to i64
  %650 = sext i32 %s to i64
  %651 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %650
  %652 = getelementptr inbounds %struct.string_data* %651, i32 0, i32 4
  %653 = getelementptr inbounds [20 x i32]* %652, i32 0, i64 %649
  store i32 %644, i32* %653, align 4
  br label %654

; <label>:654                                     ; preds = %643, %637
  %655 = sext i32 %s to i64
  %656 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %655
  %657 = getelementptr inbounds %struct.string_data* %656, i32 0, i32 3
  %658 = load i32* %657, align 4
  %659 = add nsw i32 %658, 1
  store i32 %659, i32* %657, align 4
  br label %660

; <label>:660                                     ; preds = %654
  br label %661

; <label>:661                                     ; preds = %660, %629, %614, %599, %589
  br label %737

; <label>:662                                     ; preds = %582
  %663 = add nsw i32 %pos, 1
  %664 = sext i32 %663 to i64
  %665 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %664
  %666 = load i8* %665, align 1
  %667 = zext i8 %666 to i32
  %668 = icmp eq i32 %667, %5
  br i1 %668, label %669, label %736

; <label>:669                                     ; preds = %662
  %670 = add nsw i32 %pos, 1
  %671 = sext i32 %670 to i64
  %672 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %671
  %673 = load i32* %672, align 4
  %674 = sext i32 %673 to i64
  %675 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %674
  %676 = getelementptr inbounds %struct.string_data* %675, i32 0, i32 7
  %677 = load i32* %676, align 4
  %678 = load i32* @string_mark, align 4
  %679 = icmp ne i32 %677, %678
  br i1 %679, label %680, label %736

; <label>:680                                     ; preds = %669
  %681 = add nsw i32 %pos, 1
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %682
  %684 = load i32* %683, align 4
  %685 = sext i32 %s to i64
  %686 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %685
  %687 = getelementptr inbounds %struct.string_data* %686, i32 0, i32 5
  %688 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %689 = getelementptr inbounds %struct.change_stack_entry* %688, i32 0, i32 0
  store i32* %687, i32** %689, align 8
  %690 = sext i32 %s to i64
  %691 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %690
  %692 = getelementptr inbounds %struct.string_data* %691, i32 0, i32 5
  %693 = load i32* %692, align 4
  %694 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %695 = getelementptr inbounds %struct.change_stack_entry* %694, i32 1
  store %struct.change_stack_entry* %695, %struct.change_stack_entry** @change_stack_pointer, align 8
  %696 = getelementptr inbounds %struct.change_stack_entry* %694, i32 0, i32 1
  store i32 %693, i32* %696, align 4
  %697 = add nsw i32 %pos, 1
  %698 = sext i32 %697 to i64
  %699 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %698
  %700 = load i32* %699, align 4
  %701 = sext i32 %s to i64
  %702 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %701
  %703 = getelementptr inbounds %struct.string_data* %702, i32 0, i32 5
  %704 = load i32* %703, align 4
  %705 = add nsw i32 %704, 1
  store i32 %705, i32* %703, align 4
  %706 = sext i32 %704 to i64
  %707 = sext i32 %s to i64
  %708 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %707
  %709 = getelementptr inbounds %struct.string_data* %708, i32 0, i32 6
  %710 = getelementptr inbounds [160 x i32]* %709, i32 0, i64 %706
  store i32 %700, i32* %710, align 4
  %711 = sext i32 %684 to i64
  %712 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %711
  %713 = getelementptr inbounds %struct.string_data* %712, i32 0, i32 5
  %714 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %715 = getelementptr inbounds %struct.change_stack_entry* %714, i32 0, i32 0
  store i32* %713, i32** %715, align 8
  %716 = sext i32 %684 to i64
  %717 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %716
  %718 = getelementptr inbounds %struct.string_data* %717, i32 0, i32 5
  %719 = load i32* %718, align 4
  %720 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %721 = getelementptr inbounds %struct.change_stack_entry* %720, i32 1
  store %struct.change_stack_entry* %721, %struct.change_stack_entry** @change_stack_pointer, align 8
  %722 = getelementptr inbounds %struct.change_stack_entry* %720, i32 0, i32 1
  store i32 %719, i32* %722, align 4
  %723 = sext i32 %pos to i64
  %724 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %723
  %725 = load i32* %724, align 4
  %726 = sext i32 %684 to i64
  %727 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %726
  %728 = getelementptr inbounds %struct.string_data* %727, i32 0, i32 5
  %729 = load i32* %728, align 4
  %730 = add nsw i32 %729, 1
  store i32 %730, i32* %728, align 4
  %731 = sext i32 %729 to i64
  %732 = sext i32 %684 to i64
  %733 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %732
  %734 = getelementptr inbounds %struct.string_data* %733, i32 0, i32 6
  %735 = getelementptr inbounds [160 x i32]* %734, i32 0, i64 %731
  store i32 %725, i32* %735, align 4
  br label %736

; <label>:736                                     ; preds = %680, %669, %662
  br label %737

; <label>:737                                     ; preds = %736, %661
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @assimilate_neighbor_strings(i32 %pos) #0 {
  %1 = sext i32 %pos to i64
  %2 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = sub nsw i32 3, %4
  %6 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %7 = getelementptr inbounds %struct.change_stack_entry* %6, i32 0, i32 0
  store i32* @next_string, i32** %7, align 8
  %8 = load i32* @next_string, align 4
  %9 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %10 = getelementptr inbounds %struct.change_stack_entry* %9, i32 1
  store %struct.change_stack_entry* %10, %struct.change_stack_entry** @change_stack_pointer, align 8
  %11 = getelementptr inbounds %struct.change_stack_entry* %9, i32 0, i32 1
  store i32 %8, i32* %11, align 4
  %12 = load i32* @next_string, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* @next_string, align 4
  %14 = icmp slt i32 %12, 240
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %0
  br label %21

; <label>:16                                      ; preds = %0
  %17 = sdiv i32 %pos, 20
  %18 = sub nsw i32 %17, 1
  %19 = srem i32 %pos, 20
  %20 = sub nsw i32 %19, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 3296, i8* getelementptr inbounds ([22 x i8]* @.str36, i32 0, i32 0), i32 %18, i32 %20)
  br label %21

; <label>:21                                      ; preds = %16, %15
  %22 = sext i32 %pos to i64
  %23 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %22
  store i32 %12, i32* %23, align 4
  %24 = sext i32 %pos to i64
  %25 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %24
  store i32 %pos, i32* %25, align 4
  %26 = sext i32 %12 to i64
  %27 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %26
  %28 = getelementptr inbounds %struct.string_data* %27, i32 0, i32 0
  store i32 %4, i32* %28, align 4
  %29 = sext i32 %12 to i64
  %30 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %29
  %31 = getelementptr inbounds %struct.string_data* %30, i32 0, i32 1
  store i32 1, i32* %31, align 4
  %32 = sext i32 %12 to i64
  %33 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %32
  %34 = getelementptr inbounds %struct.string_data* %33, i32 0, i32 2
  store i32 %pos, i32* %34, align 4
  %35 = sext i32 %12 to i64
  %36 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %35
  %37 = getelementptr inbounds %struct.string_data* %36, i32 0, i32 3
  store i32 0, i32* %37, align 4
  %38 = sext i32 %12 to i64
  %39 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %38
  %40 = getelementptr inbounds %struct.string_data* %39, i32 0, i32 5
  store i32 0, i32* %40, align 4
  %41 = load i32* @liberty_mark, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* @liberty_mark, align 4
  %43 = load i32* @string_mark, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* @string_mark, align 4
  %45 = load i32* @string_mark, align 4
  %46 = sext i32 %12 to i64
  %47 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %46
  %48 = getelementptr inbounds %struct.string_data* %47, i32 0, i32 7
  store i32 %45, i32* %48, align 4
  %49 = add nsw i32 %pos, 20
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %50
  %52 = load i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %91

; <label>:55                                      ; preds = %21
  %56 = add nsw i32 %pos, 20
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %57
  %59 = load i32* %58, align 4
  %60 = load i32* @liberty_mark, align 4
  %61 = icmp ne i32 %59, %60
  br i1 %61, label %62, label %91

; <label>:62                                      ; preds = %55
  br label %63

; <label>:63                                      ; preds = %62
  %64 = sext i32 %12 to i64
  %65 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %64
  %66 = getelementptr inbounds %struct.string_data* %65, i32 0, i32 3
  %67 = load i32* %66, align 4
  %68 = icmp slt i32 %67, 20
  br i1 %68, label %69, label %80

; <label>:69                                      ; preds = %63
  %70 = add nsw i32 %pos, 20
  %71 = sext i32 %12 to i64
  %72 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %71
  %73 = getelementptr inbounds %struct.string_data* %72, i32 0, i32 3
  %74 = load i32* %73, align 4
  %75 = sext i32 %74 to i64
  %76 = sext i32 %12 to i64
  %77 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %76
  %78 = getelementptr inbounds %struct.string_data* %77, i32 0, i32 4
  %79 = getelementptr inbounds [20 x i32]* %78, i32 0, i64 %75
  store i32 %70, i32* %79, align 4
  br label %80

; <label>:80                                      ; preds = %69, %63
  %81 = sext i32 %12 to i64
  %82 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %81
  %83 = getelementptr inbounds %struct.string_data* %82, i32 0, i32 3
  %84 = load i32* %83, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %83, align 4
  %86 = load i32* @liberty_mark, align 4
  %87 = add nsw i32 %pos, 20
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %88
  store i32 %86, i32* %89, align 4
  br label %90

; <label>:90                                      ; preds = %80
  br label %195

; <label>:91                                      ; preds = %55, %21
  %92 = add nsw i32 %pos, 20
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %93
  %95 = load i8* %94, align 1
  %96 = zext i8 %95 to i32
  %97 = icmp eq i32 %96, %5
  br i1 %97, label %98, label %173

; <label>:98                                      ; preds = %91
  %99 = add nsw i32 %pos, 20
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %100
  %102 = load i32* %101, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %103
  %105 = getelementptr inbounds %struct.string_data* %104, i32 0, i32 7
  %106 = load i32* %105, align 4
  %107 = load i32* @string_mark, align 4
  %108 = icmp ne i32 %106, %107
  br i1 %108, label %109, label %173

; <label>:109                                     ; preds = %98
  %110 = add nsw i32 %pos, 20
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %111
  %113 = load i32* %112, align 4
  %114 = sext i32 %12 to i64
  %115 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %114
  %116 = getelementptr inbounds %struct.string_data* %115, i32 0, i32 5
  %117 = load i32* %116, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %116, align 4
  %119 = sext i32 %117 to i64
  %120 = sext i32 %12 to i64
  %121 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %120
  %122 = getelementptr inbounds %struct.string_data* %121, i32 0, i32 6
  %123 = getelementptr inbounds [160 x i32]* %122, i32 0, i64 %119
  store i32 %113, i32* %123, align 4
  %124 = add nsw i32 %pos, 20
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %125
  %127 = load i32* %126, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %128
  %130 = getelementptr inbounds %struct.string_data* %129, i32 0, i32 5
  %131 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %132 = getelementptr inbounds %struct.change_stack_entry* %131, i32 0, i32 0
  store i32* %130, i32** %132, align 8
  %133 = add nsw i32 %pos, 20
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %134
  %136 = load i32* %135, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %137
  %139 = getelementptr inbounds %struct.string_data* %138, i32 0, i32 5
  %140 = load i32* %139, align 4
  %141 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %142 = getelementptr inbounds %struct.change_stack_entry* %141, i32 1
  store %struct.change_stack_entry* %142, %struct.change_stack_entry** @change_stack_pointer, align 8
  %143 = getelementptr inbounds %struct.change_stack_entry* %141, i32 0, i32 1
  store i32 %140, i32* %143, align 4
  %144 = sext i32 %pos to i64
  %145 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %144
  %146 = load i32* %145, align 4
  %147 = add nsw i32 %pos, 20
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %148
  %150 = load i32* %149, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %151
  %153 = getelementptr inbounds %struct.string_data* %152, i32 0, i32 5
  %154 = load i32* %153, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %153, align 4
  %156 = sext i32 %154 to i64
  %157 = add nsw i32 %pos, 20
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %158
  %160 = load i32* %159, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %161
  %163 = getelementptr inbounds %struct.string_data* %162, i32 0, i32 6
  %164 = getelementptr inbounds [160 x i32]* %163, i32 0, i64 %156
  store i32 %146, i32* %164, align 4
  %165 = load i32* @string_mark, align 4
  %166 = add nsw i32 %pos, 20
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %167
  %169 = load i32* %168, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %170
  %172 = getelementptr inbounds %struct.string_data* %171, i32 0, i32 7
  store i32 %165, i32* %172, align 4
  br label %194

; <label>:173                                     ; preds = %98, %91
  %174 = add nsw i32 %pos, 20
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %175
  %177 = load i8* %176, align 1
  %178 = zext i8 %177 to i32
  %179 = icmp eq i32 %178, %4
  br i1 %179, label %180, label %193

; <label>:180                                     ; preds = %173
  %181 = add nsw i32 %pos, 20
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %182
  %184 = load i32* %183, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %185
  %187 = getelementptr inbounds %struct.string_data* %186, i32 0, i32 7
  %188 = load i32* %187, align 4
  %189 = load i32* @string_mark, align 4
  %190 = icmp ne i32 %188, %189
  br i1 %190, label %191, label %193

; <label>:191                                     ; preds = %180
  %192 = add nsw i32 %pos, 20
  call void @assimilate_string(i32 %12, i32 %192)
  br label %193

; <label>:193                                     ; preds = %191, %180, %173
  br label %194

; <label>:194                                     ; preds = %193, %109
  br label %195

; <label>:195                                     ; preds = %194, %90
  %196 = sub nsw i32 %pos, 1
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %197
  %199 = load i8* %198, align 1
  %200 = zext i8 %199 to i32
  %201 = icmp eq i32 %200, 0
  br i1 %201, label %202, label %238

; <label>:202                                     ; preds = %195
  %203 = sub nsw i32 %pos, 1
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %204
  %206 = load i32* %205, align 4
  %207 = load i32* @liberty_mark, align 4
  %208 = icmp ne i32 %206, %207
  br i1 %208, label %209, label %238

; <label>:209                                     ; preds = %202
  br label %210

; <label>:210                                     ; preds = %209
  %211 = sext i32 %12 to i64
  %212 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %211
  %213 = getelementptr inbounds %struct.string_data* %212, i32 0, i32 3
  %214 = load i32* %213, align 4
  %215 = icmp slt i32 %214, 20
  br i1 %215, label %216, label %227

; <label>:216                                     ; preds = %210
  %217 = sub nsw i32 %pos, 1
  %218 = sext i32 %12 to i64
  %219 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %218
  %220 = getelementptr inbounds %struct.string_data* %219, i32 0, i32 3
  %221 = load i32* %220, align 4
  %222 = sext i32 %221 to i64
  %223 = sext i32 %12 to i64
  %224 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %223
  %225 = getelementptr inbounds %struct.string_data* %224, i32 0, i32 4
  %226 = getelementptr inbounds [20 x i32]* %225, i32 0, i64 %222
  store i32 %217, i32* %226, align 4
  br label %227

; <label>:227                                     ; preds = %216, %210
  %228 = sext i32 %12 to i64
  %229 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %228
  %230 = getelementptr inbounds %struct.string_data* %229, i32 0, i32 3
  %231 = load i32* %230, align 4
  %232 = add nsw i32 %231, 1
  store i32 %232, i32* %230, align 4
  %233 = load i32* @liberty_mark, align 4
  %234 = sub nsw i32 %pos, 1
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %235
  store i32 %233, i32* %236, align 4
  br label %237

; <label>:237                                     ; preds = %227
  br label %342

; <label>:238                                     ; preds = %202, %195
  %239 = sub nsw i32 %pos, 1
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %240
  %242 = load i8* %241, align 1
  %243 = zext i8 %242 to i32
  %244 = icmp eq i32 %243, %5
  br i1 %244, label %245, label %320

; <label>:245                                     ; preds = %238
  %246 = sub nsw i32 %pos, 1
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %247
  %249 = load i32* %248, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %250
  %252 = getelementptr inbounds %struct.string_data* %251, i32 0, i32 7
  %253 = load i32* %252, align 4
  %254 = load i32* @string_mark, align 4
  %255 = icmp ne i32 %253, %254
  br i1 %255, label %256, label %320

; <label>:256                                     ; preds = %245
  %257 = sub nsw i32 %pos, 1
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %258
  %260 = load i32* %259, align 4
  %261 = sext i32 %12 to i64
  %262 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %261
  %263 = getelementptr inbounds %struct.string_data* %262, i32 0, i32 5
  %264 = load i32* %263, align 4
  %265 = add nsw i32 %264, 1
  store i32 %265, i32* %263, align 4
  %266 = sext i32 %264 to i64
  %267 = sext i32 %12 to i64
  %268 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %267
  %269 = getelementptr inbounds %struct.string_data* %268, i32 0, i32 6
  %270 = getelementptr inbounds [160 x i32]* %269, i32 0, i64 %266
  store i32 %260, i32* %270, align 4
  %271 = sub nsw i32 %pos, 1
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %272
  %274 = load i32* %273, align 4
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %275
  %277 = getelementptr inbounds %struct.string_data* %276, i32 0, i32 5
  %278 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %279 = getelementptr inbounds %struct.change_stack_entry* %278, i32 0, i32 0
  store i32* %277, i32** %279, align 8
  %280 = sub nsw i32 %pos, 1
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %281
  %283 = load i32* %282, align 4
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %284
  %286 = getelementptr inbounds %struct.string_data* %285, i32 0, i32 5
  %287 = load i32* %286, align 4
  %288 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %289 = getelementptr inbounds %struct.change_stack_entry* %288, i32 1
  store %struct.change_stack_entry* %289, %struct.change_stack_entry** @change_stack_pointer, align 8
  %290 = getelementptr inbounds %struct.change_stack_entry* %288, i32 0, i32 1
  store i32 %287, i32* %290, align 4
  %291 = sext i32 %pos to i64
  %292 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %291
  %293 = load i32* %292, align 4
  %294 = sub nsw i32 %pos, 1
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %295
  %297 = load i32* %296, align 4
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %298
  %300 = getelementptr inbounds %struct.string_data* %299, i32 0, i32 5
  %301 = load i32* %300, align 4
  %302 = add nsw i32 %301, 1
  store i32 %302, i32* %300, align 4
  %303 = sext i32 %301 to i64
  %304 = sub nsw i32 %pos, 1
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %305
  %307 = load i32* %306, align 4
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %308
  %310 = getelementptr inbounds %struct.string_data* %309, i32 0, i32 6
  %311 = getelementptr inbounds [160 x i32]* %310, i32 0, i64 %303
  store i32 %293, i32* %311, align 4
  %312 = load i32* @string_mark, align 4
  %313 = sub nsw i32 %pos, 1
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %314
  %316 = load i32* %315, align 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %317
  %319 = getelementptr inbounds %struct.string_data* %318, i32 0, i32 7
  store i32 %312, i32* %319, align 4
  br label %341

; <label>:320                                     ; preds = %245, %238
  %321 = sub nsw i32 %pos, 1
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %322
  %324 = load i8* %323, align 1
  %325 = zext i8 %324 to i32
  %326 = icmp eq i32 %325, %4
  br i1 %326, label %327, label %340

; <label>:327                                     ; preds = %320
  %328 = sub nsw i32 %pos, 1
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %329
  %331 = load i32* %330, align 4
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %332
  %334 = getelementptr inbounds %struct.string_data* %333, i32 0, i32 7
  %335 = load i32* %334, align 4
  %336 = load i32* @string_mark, align 4
  %337 = icmp ne i32 %335, %336
  br i1 %337, label %338, label %340

; <label>:338                                     ; preds = %327
  %339 = sub nsw i32 %pos, 1
  call void @assimilate_string(i32 %12, i32 %339)
  br label %340

; <label>:340                                     ; preds = %338, %327, %320
  br label %341

; <label>:341                                     ; preds = %340, %256
  br label %342

; <label>:342                                     ; preds = %341, %237
  %343 = sub nsw i32 %pos, 20
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %344
  %346 = load i8* %345, align 1
  %347 = zext i8 %346 to i32
  %348 = icmp eq i32 %347, 0
  br i1 %348, label %349, label %385

; <label>:349                                     ; preds = %342
  %350 = sub nsw i32 %pos, 20
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %351
  %353 = load i32* %352, align 4
  %354 = load i32* @liberty_mark, align 4
  %355 = icmp ne i32 %353, %354
  br i1 %355, label %356, label %385

; <label>:356                                     ; preds = %349
  br label %357

; <label>:357                                     ; preds = %356
  %358 = sext i32 %12 to i64
  %359 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %358
  %360 = getelementptr inbounds %struct.string_data* %359, i32 0, i32 3
  %361 = load i32* %360, align 4
  %362 = icmp slt i32 %361, 20
  br i1 %362, label %363, label %374

; <label>:363                                     ; preds = %357
  %364 = sub nsw i32 %pos, 20
  %365 = sext i32 %12 to i64
  %366 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %365
  %367 = getelementptr inbounds %struct.string_data* %366, i32 0, i32 3
  %368 = load i32* %367, align 4
  %369 = sext i32 %368 to i64
  %370 = sext i32 %12 to i64
  %371 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %370
  %372 = getelementptr inbounds %struct.string_data* %371, i32 0, i32 4
  %373 = getelementptr inbounds [20 x i32]* %372, i32 0, i64 %369
  store i32 %364, i32* %373, align 4
  br label %374

; <label>:374                                     ; preds = %363, %357
  %375 = sext i32 %12 to i64
  %376 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %375
  %377 = getelementptr inbounds %struct.string_data* %376, i32 0, i32 3
  %378 = load i32* %377, align 4
  %379 = add nsw i32 %378, 1
  store i32 %379, i32* %377, align 4
  %380 = load i32* @liberty_mark, align 4
  %381 = sub nsw i32 %pos, 20
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %382
  store i32 %380, i32* %383, align 4
  br label %384

; <label>:384                                     ; preds = %374
  br label %489

; <label>:385                                     ; preds = %349, %342
  %386 = sub nsw i32 %pos, 20
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %387
  %389 = load i8* %388, align 1
  %390 = zext i8 %389 to i32
  %391 = icmp eq i32 %390, %5
  br i1 %391, label %392, label %467

; <label>:392                                     ; preds = %385
  %393 = sub nsw i32 %pos, 20
  %394 = sext i32 %393 to i64
  %395 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %394
  %396 = load i32* %395, align 4
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %397
  %399 = getelementptr inbounds %struct.string_data* %398, i32 0, i32 7
  %400 = load i32* %399, align 4
  %401 = load i32* @string_mark, align 4
  %402 = icmp ne i32 %400, %401
  br i1 %402, label %403, label %467

; <label>:403                                     ; preds = %392
  %404 = sub nsw i32 %pos, 20
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %405
  %407 = load i32* %406, align 4
  %408 = sext i32 %12 to i64
  %409 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %408
  %410 = getelementptr inbounds %struct.string_data* %409, i32 0, i32 5
  %411 = load i32* %410, align 4
  %412 = add nsw i32 %411, 1
  store i32 %412, i32* %410, align 4
  %413 = sext i32 %411 to i64
  %414 = sext i32 %12 to i64
  %415 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %414
  %416 = getelementptr inbounds %struct.string_data* %415, i32 0, i32 6
  %417 = getelementptr inbounds [160 x i32]* %416, i32 0, i64 %413
  store i32 %407, i32* %417, align 4
  %418 = sub nsw i32 %pos, 20
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %419
  %421 = load i32* %420, align 4
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %422
  %424 = getelementptr inbounds %struct.string_data* %423, i32 0, i32 5
  %425 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %426 = getelementptr inbounds %struct.change_stack_entry* %425, i32 0, i32 0
  store i32* %424, i32** %426, align 8
  %427 = sub nsw i32 %pos, 20
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %428
  %430 = load i32* %429, align 4
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %431
  %433 = getelementptr inbounds %struct.string_data* %432, i32 0, i32 5
  %434 = load i32* %433, align 4
  %435 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %436 = getelementptr inbounds %struct.change_stack_entry* %435, i32 1
  store %struct.change_stack_entry* %436, %struct.change_stack_entry** @change_stack_pointer, align 8
  %437 = getelementptr inbounds %struct.change_stack_entry* %435, i32 0, i32 1
  store i32 %434, i32* %437, align 4
  %438 = sext i32 %pos to i64
  %439 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %438
  %440 = load i32* %439, align 4
  %441 = sub nsw i32 %pos, 20
  %442 = sext i32 %441 to i64
  %443 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %442
  %444 = load i32* %443, align 4
  %445 = sext i32 %444 to i64
  %446 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %445
  %447 = getelementptr inbounds %struct.string_data* %446, i32 0, i32 5
  %448 = load i32* %447, align 4
  %449 = add nsw i32 %448, 1
  store i32 %449, i32* %447, align 4
  %450 = sext i32 %448 to i64
  %451 = sub nsw i32 %pos, 20
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %452
  %454 = load i32* %453, align 4
  %455 = sext i32 %454 to i64
  %456 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %455
  %457 = getelementptr inbounds %struct.string_data* %456, i32 0, i32 6
  %458 = getelementptr inbounds [160 x i32]* %457, i32 0, i64 %450
  store i32 %440, i32* %458, align 4
  %459 = load i32* @string_mark, align 4
  %460 = sub nsw i32 %pos, 20
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %461
  %463 = load i32* %462, align 4
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %464
  %466 = getelementptr inbounds %struct.string_data* %465, i32 0, i32 7
  store i32 %459, i32* %466, align 4
  br label %488

; <label>:467                                     ; preds = %392, %385
  %468 = sub nsw i32 %pos, 20
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %469
  %471 = load i8* %470, align 1
  %472 = zext i8 %471 to i32
  %473 = icmp eq i32 %472, %4
  br i1 %473, label %474, label %487

; <label>:474                                     ; preds = %467
  %475 = sub nsw i32 %pos, 20
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %476
  %478 = load i32* %477, align 4
  %479 = sext i32 %478 to i64
  %480 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %479
  %481 = getelementptr inbounds %struct.string_data* %480, i32 0, i32 7
  %482 = load i32* %481, align 4
  %483 = load i32* @string_mark, align 4
  %484 = icmp ne i32 %482, %483
  br i1 %484, label %485, label %487

; <label>:485                                     ; preds = %474
  %486 = sub nsw i32 %pos, 20
  call void @assimilate_string(i32 %12, i32 %486)
  br label %487

; <label>:487                                     ; preds = %485, %474, %467
  br label %488

; <label>:488                                     ; preds = %487, %403
  br label %489

; <label>:489                                     ; preds = %488, %384
  %490 = add nsw i32 %pos, 1
  %491 = sext i32 %490 to i64
  %492 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %491
  %493 = load i8* %492, align 1
  %494 = zext i8 %493 to i32
  %495 = icmp eq i32 %494, 0
  br i1 %495, label %496, label %528

; <label>:496                                     ; preds = %489
  %497 = add nsw i32 %pos, 1
  %498 = sext i32 %497 to i64
  %499 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %498
  %500 = load i32* %499, align 4
  %501 = load i32* @liberty_mark, align 4
  %502 = icmp ne i32 %500, %501
  br i1 %502, label %503, label %528

; <label>:503                                     ; preds = %496
  br label %504

; <label>:504                                     ; preds = %503
  %505 = sext i32 %12 to i64
  %506 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %505
  %507 = getelementptr inbounds %struct.string_data* %506, i32 0, i32 3
  %508 = load i32* %507, align 4
  %509 = icmp slt i32 %508, 20
  br i1 %509, label %510, label %521

; <label>:510                                     ; preds = %504
  %511 = add nsw i32 %pos, 1
  %512 = sext i32 %12 to i64
  %513 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %512
  %514 = getelementptr inbounds %struct.string_data* %513, i32 0, i32 3
  %515 = load i32* %514, align 4
  %516 = sext i32 %515 to i64
  %517 = sext i32 %12 to i64
  %518 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %517
  %519 = getelementptr inbounds %struct.string_data* %518, i32 0, i32 4
  %520 = getelementptr inbounds [20 x i32]* %519, i32 0, i64 %516
  store i32 %511, i32* %520, align 4
  br label %521

; <label>:521                                     ; preds = %510, %504
  %522 = sext i32 %12 to i64
  %523 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %522
  %524 = getelementptr inbounds %struct.string_data* %523, i32 0, i32 3
  %525 = load i32* %524, align 4
  %526 = add nsw i32 %525, 1
  store i32 %526, i32* %524, align 4
  br label %527

; <label>:527                                     ; preds = %521
  br label %624

; <label>:528                                     ; preds = %496, %489
  %529 = add nsw i32 %pos, 1
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %530
  %532 = load i8* %531, align 1
  %533 = zext i8 %532 to i32
  %534 = icmp eq i32 %533, %5
  br i1 %534, label %535, label %602

; <label>:535                                     ; preds = %528
  %536 = add nsw i32 %pos, 1
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %537
  %539 = load i32* %538, align 4
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %540
  %542 = getelementptr inbounds %struct.string_data* %541, i32 0, i32 7
  %543 = load i32* %542, align 4
  %544 = load i32* @string_mark, align 4
  %545 = icmp ne i32 %543, %544
  br i1 %545, label %546, label %602

; <label>:546                                     ; preds = %535
  %547 = add nsw i32 %pos, 1
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %548
  %550 = load i32* %549, align 4
  %551 = sext i32 %12 to i64
  %552 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %551
  %553 = getelementptr inbounds %struct.string_data* %552, i32 0, i32 5
  %554 = load i32* %553, align 4
  %555 = add nsw i32 %554, 1
  store i32 %555, i32* %553, align 4
  %556 = sext i32 %554 to i64
  %557 = sext i32 %12 to i64
  %558 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %557
  %559 = getelementptr inbounds %struct.string_data* %558, i32 0, i32 6
  %560 = getelementptr inbounds [160 x i32]* %559, i32 0, i64 %556
  store i32 %550, i32* %560, align 4
  %561 = add nsw i32 %pos, 1
  %562 = sext i32 %561 to i64
  %563 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %562
  %564 = load i32* %563, align 4
  %565 = sext i32 %564 to i64
  %566 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %565
  %567 = getelementptr inbounds %struct.string_data* %566, i32 0, i32 5
  %568 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %569 = getelementptr inbounds %struct.change_stack_entry* %568, i32 0, i32 0
  store i32* %567, i32** %569, align 8
  %570 = add nsw i32 %pos, 1
  %571 = sext i32 %570 to i64
  %572 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %571
  %573 = load i32* %572, align 4
  %574 = sext i32 %573 to i64
  %575 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %574
  %576 = getelementptr inbounds %struct.string_data* %575, i32 0, i32 5
  %577 = load i32* %576, align 4
  %578 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %579 = getelementptr inbounds %struct.change_stack_entry* %578, i32 1
  store %struct.change_stack_entry* %579, %struct.change_stack_entry** @change_stack_pointer, align 8
  %580 = getelementptr inbounds %struct.change_stack_entry* %578, i32 0, i32 1
  store i32 %577, i32* %580, align 4
  %581 = sext i32 %pos to i64
  %582 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %581
  %583 = load i32* %582, align 4
  %584 = add nsw i32 %pos, 1
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %585
  %587 = load i32* %586, align 4
  %588 = sext i32 %587 to i64
  %589 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %588
  %590 = getelementptr inbounds %struct.string_data* %589, i32 0, i32 5
  %591 = load i32* %590, align 4
  %592 = add nsw i32 %591, 1
  store i32 %592, i32* %590, align 4
  %593 = sext i32 %591 to i64
  %594 = add nsw i32 %pos, 1
  %595 = sext i32 %594 to i64
  %596 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %595
  %597 = load i32* %596, align 4
  %598 = sext i32 %597 to i64
  %599 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %598
  %600 = getelementptr inbounds %struct.string_data* %599, i32 0, i32 6
  %601 = getelementptr inbounds [160 x i32]* %600, i32 0, i64 %593
  store i32 %583, i32* %601, align 4
  br label %623

; <label>:602                                     ; preds = %535, %528
  %603 = add nsw i32 %pos, 1
  %604 = sext i32 %603 to i64
  %605 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %604
  %606 = load i8* %605, align 1
  %607 = zext i8 %606 to i32
  %608 = icmp eq i32 %607, %4
  br i1 %608, label %609, label %622

; <label>:609                                     ; preds = %602
  %610 = add nsw i32 %pos, 1
  %611 = sext i32 %610 to i64
  %612 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %611
  %613 = load i32* %612, align 4
  %614 = sext i32 %613 to i64
  %615 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %614
  %616 = getelementptr inbounds %struct.string_data* %615, i32 0, i32 7
  %617 = load i32* %616, align 4
  %618 = load i32* @string_mark, align 4
  %619 = icmp ne i32 %617, %618
  br i1 %619, label %620, label %622

; <label>:620                                     ; preds = %609
  %621 = add nsw i32 %pos, 1
  call void @assimilate_string(i32 %12, i32 %621)
  br label %622

; <label>:622                                     ; preds = %620, %609, %602
  br label %623

; <label>:623                                     ; preds = %622, %546
  br label %624

; <label>:624                                     ; preds = %623, %527
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @assimilate_string(i32 %s, i32 %pos) #0 {
  %1 = sext i32 %pos to i64
  %2 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1
  %3 = load i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %4
  %6 = getelementptr inbounds %struct.string_data* %5, i32 0, i32 1
  %7 = load i32* %6, align 4
  %8 = sext i32 %s to i64
  %9 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %8
  %10 = getelementptr inbounds %struct.string_data* %9, i32 0, i32 1
  %11 = load i32* %10, align 4
  %12 = add nsw i32 %11, %7
  store i32 %12, i32* %10, align 4
  %13 = sext i32 %3 to i64
  %14 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %13
  %15 = getelementptr inbounds %struct.string_data* %14, i32 0, i32 2
  %16 = load i32* %15, align 4
  br label %17

; <label>:17                                      ; preds = %33, %0
  %.0 = phi i32 [ %16, %0 ], [ %32, %33 ]
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %18
  %20 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %21 = getelementptr inbounds %struct.change_stack_entry* %20, i32 0, i32 0
  store i32* %19, i32** %21, align 8
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %22
  %24 = load i32* %23, align 4
  %25 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %26 = getelementptr inbounds %struct.change_stack_entry* %25, i32 1
  store %struct.change_stack_entry* %26, %struct.change_stack_entry** @change_stack_pointer, align 8
  %27 = getelementptr inbounds %struct.change_stack_entry* %25, i32 0, i32 1
  store i32 %24, i32* %27, align 4
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %28
  store i32 %s, i32* %29, align 4
  %30 = sext i32 %.0 to i64
  %31 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %30
  %32 = load i32* %31, align 4
  br label %33

; <label>:33                                      ; preds = %17
  %34 = sext i32 %3 to i64
  %35 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %34
  %36 = getelementptr inbounds %struct.string_data* %35, i32 0, i32 2
  %37 = load i32* %36, align 4
  %38 = icmp eq i32 %32, %37
  %39 = xor i1 %38, true
  br i1 %39, label %17, label %40

; <label>:40                                      ; preds = %33
  %41 = sext i32 %s to i64
  %42 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %41
  %43 = getelementptr inbounds %struct.string_data* %42, i32 0, i32 2
  %44 = load i32* %43, align 4
  %45 = sext i32 %.0 to i64
  %46 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %45
  %47 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %48 = getelementptr inbounds %struct.change_stack_entry* %47, i32 0, i32 0
  store i32* %46, i32** %48, align 8
  %49 = sext i32 %.0 to i64
  %50 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %49
  %51 = load i32* %50, align 4
  %52 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %53 = getelementptr inbounds %struct.change_stack_entry* %52, i32 1
  store %struct.change_stack_entry* %53, %struct.change_stack_entry** @change_stack_pointer, align 8
  %54 = getelementptr inbounds %struct.change_stack_entry* %52, i32 0, i32 1
  store i32 %51, i32* %54, align 4
  %55 = sext i32 %44 to i64
  %56 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %55
  %57 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %58 = getelementptr inbounds %struct.change_stack_entry* %57, i32 0, i32 0
  store i32* %56, i32** %58, align 8
  %59 = sext i32 %44 to i64
  %60 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %59
  %61 = load i32* %60, align 4
  %62 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %63 = getelementptr inbounds %struct.change_stack_entry* %62, i32 1
  store %struct.change_stack_entry* %63, %struct.change_stack_entry** @change_stack_pointer, align 8
  %64 = getelementptr inbounds %struct.change_stack_entry* %62, i32 0, i32 1
  store i32 %61, i32* %64, align 4
  %65 = sext i32 %44 to i64
  %66 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = sext i32 %.0 to i64
  %69 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %68
  store i32 %67, i32* %69, align 4
  %70 = sext i32 %3 to i64
  %71 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %70
  %72 = getelementptr inbounds %struct.string_data* %71, i32 0, i32 2
  %73 = load i32* %72, align 4
  %74 = sext i32 %44 to i64
  %75 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %74
  store i32 %73, i32* %75, align 4
  %76 = sext i32 %3 to i64
  %77 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %76
  %78 = getelementptr inbounds %struct.string_data* %77, i32 0, i32 2
  %79 = load i32* %78, align 4
  %80 = icmp slt i32 %79, %44
  br i1 %80, label %81, label %89

; <label>:81                                      ; preds = %40
  %82 = sext i32 %3 to i64
  %83 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %82
  %84 = getelementptr inbounds %struct.string_data* %83, i32 0, i32 2
  %85 = load i32* %84, align 4
  %86 = sext i32 %s to i64
  %87 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %86
  %88 = getelementptr inbounds %struct.string_data* %87, i32 0, i32 2
  store i32 %85, i32* %88, align 4
  br label %89

; <label>:89                                      ; preds = %81, %40
  %90 = sext i32 %3 to i64
  %91 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %90
  %92 = getelementptr inbounds %struct.string_data* %91, i32 0, i32 3
  %93 = load i32* %92, align 4
  %94 = icmp sle i32 %93, 20
  br i1 %94, label %95, label %151

; <label>:95                                      ; preds = %89
  br label %96

; <label>:96                                      ; preds = %148, %95
  %k.0 = phi i32 [ 0, %95 ], [ %149, %148 ]
  %97 = sext i32 %3 to i64
  %98 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %97
  %99 = getelementptr inbounds %struct.string_data* %98, i32 0, i32 3
  %100 = load i32* %99, align 4
  %101 = icmp slt i32 %k.0, %100
  br i1 %101, label %102, label %150

; <label>:102                                     ; preds = %96
  %103 = sext i32 %k.0 to i64
  %104 = sext i32 %3 to i64
  %105 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %104
  %106 = getelementptr inbounds %struct.string_data* %105, i32 0, i32 4
  %107 = getelementptr inbounds [20 x i32]* %106, i32 0, i64 %103
  %108 = load i32* %107, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %109
  %111 = load i8* %110, align 1
  %112 = zext i8 %111 to i32
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %114, label %147

; <label>:114                                     ; preds = %102
  %115 = sext i32 %108 to i64
  %116 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %115
  %117 = load i32* %116, align 4
  %118 = load i32* @liberty_mark, align 4
  %119 = icmp ne i32 %117, %118
  br i1 %119, label %120, label %147

; <label>:120                                     ; preds = %114
  br label %121

; <label>:121                                     ; preds = %120
  %122 = sext i32 %s to i64
  %123 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %122
  %124 = getelementptr inbounds %struct.string_data* %123, i32 0, i32 3
  %125 = load i32* %124, align 4
  %126 = icmp slt i32 %125, 20
  br i1 %126, label %127, label %137

; <label>:127                                     ; preds = %121
  %128 = sext i32 %s to i64
  %129 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %128
  %130 = getelementptr inbounds %struct.string_data* %129, i32 0, i32 3
  %131 = load i32* %130, align 4
  %132 = sext i32 %131 to i64
  %133 = sext i32 %s to i64
  %134 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %133
  %135 = getelementptr inbounds %struct.string_data* %134, i32 0, i32 4
  %136 = getelementptr inbounds [20 x i32]* %135, i32 0, i64 %132
  store i32 %108, i32* %136, align 4
  br label %137

; <label>:137                                     ; preds = %127, %121
  %138 = sext i32 %s to i64
  %139 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %138
  %140 = getelementptr inbounds %struct.string_data* %139, i32 0, i32 3
  %141 = load i32* %140, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, i32* %140, align 4
  %143 = load i32* @liberty_mark, align 4
  %144 = sext i32 %108 to i64
  %145 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %144
  store i32 %143, i32* %145, align 4
  br label %146

; <label>:146                                     ; preds = %137
  br label %147

; <label>:147                                     ; preds = %146, %114, %102
  br label %148

; <label>:148                                     ; preds = %147
  %149 = add nsw i32 %k.0, 1
  br label %96

; <label>:150                                     ; preds = %96
  br label %157

; <label>:151                                     ; preds = %89
  %152 = load i32* @liberty_mark, align 4
  %153 = add nsw i32 %152, 1
  store i32 %153, i32* @liberty_mark, align 4
  %154 = sext i32 %s to i64
  %155 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %154
  %156 = getelementptr inbounds %struct.string_data* %155, i32 0, i32 3
  store i32 0, i32* %156, align 4
  call void @update_liberties(i32 %s)
  br label %157

; <label>:157                                     ; preds = %151, %150
  br label %158

; <label>:158                                     ; preds = %215, %157
  %k.1 = phi i32 [ 0, %157 ], [ %216, %215 ]
  %159 = sext i32 %3 to i64
  %160 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %159
  %161 = getelementptr inbounds %struct.string_data* %160, i32 0, i32 5
  %162 = load i32* %161, align 4
  %163 = icmp slt i32 %k.1, %162
  br i1 %163, label %164, label %217

; <label>:164                                     ; preds = %158
  %165 = sext i32 %k.1 to i64
  %166 = sext i32 %3 to i64
  %167 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %166
  %168 = getelementptr inbounds %struct.string_data* %167, i32 0, i32 6
  %169 = getelementptr inbounds [160 x i32]* %168, i32 0, i64 %165
  %170 = load i32* %169, align 4
  call void @remove_neighbor(i32 %170, i32 %3)
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %171
  %173 = getelementptr inbounds %struct.string_data* %172, i32 0, i32 7
  %174 = load i32* %173, align 4
  %175 = load i32* @string_mark, align 4
  %176 = icmp ne i32 %174, %175
  br i1 %176, label %177, label %214

; <label>:177                                     ; preds = %164
  %178 = sext i32 %170 to i64
  %179 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %178
  %180 = getelementptr inbounds %struct.string_data* %179, i32 0, i32 5
  %181 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %182 = getelementptr inbounds %struct.change_stack_entry* %181, i32 0, i32 0
  store i32* %180, i32** %182, align 8
  %183 = sext i32 %170 to i64
  %184 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %183
  %185 = getelementptr inbounds %struct.string_data* %184, i32 0, i32 5
  %186 = load i32* %185, align 4
  %187 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %188 = getelementptr inbounds %struct.change_stack_entry* %187, i32 1
  store %struct.change_stack_entry* %188, %struct.change_stack_entry** @change_stack_pointer, align 8
  %189 = getelementptr inbounds %struct.change_stack_entry* %187, i32 0, i32 1
  store i32 %186, i32* %189, align 4
  %190 = sext i32 %170 to i64
  %191 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %190
  %192 = getelementptr inbounds %struct.string_data* %191, i32 0, i32 5
  %193 = load i32* %192, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* %192, align 4
  %195 = sext i32 %193 to i64
  %196 = sext i32 %170 to i64
  %197 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %196
  %198 = getelementptr inbounds %struct.string_data* %197, i32 0, i32 6
  %199 = getelementptr inbounds [160 x i32]* %198, i32 0, i64 %195
  store i32 %s, i32* %199, align 4
  %200 = sext i32 %s to i64
  %201 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %200
  %202 = getelementptr inbounds %struct.string_data* %201, i32 0, i32 5
  %203 = load i32* %202, align 4
  %204 = add nsw i32 %203, 1
  store i32 %204, i32* %202, align 4
  %205 = sext i32 %203 to i64
  %206 = sext i32 %s to i64
  %207 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %206
  %208 = getelementptr inbounds %struct.string_data* %207, i32 0, i32 6
  %209 = getelementptr inbounds [160 x i32]* %208, i32 0, i64 %205
  store i32 %170, i32* %209, align 4
  %210 = load i32* @string_mark, align 4
  %211 = sext i32 %170 to i64
  %212 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %211
  %213 = getelementptr inbounds %struct.string_data* %212, i32 0, i32 7
  store i32 %210, i32* %213, align 4
  br label %214

; <label>:214                                     ; preds = %177, %164
  br label %215

; <label>:215                                     ; preds = %214
  %216 = add nsw i32 %k.1, 1
  br label %158

; <label>:217                                     ; preds = %158
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @update_liberties(i32 %s) #0 {
  %1 = sext i32 %s to i64
  %2 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1
  %3 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 3
  %4 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %5 = getelementptr inbounds %struct.change_stack_entry* %4, i32 0, i32 0
  store i32* %3, i32** %5, align 8
  %6 = sext i32 %s to i64
  %7 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %6
  %8 = getelementptr inbounds %struct.string_data* %7, i32 0, i32 3
  %9 = load i32* %8, align 4
  %10 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %11 = getelementptr inbounds %struct.change_stack_entry* %10, i32 1
  store %struct.change_stack_entry* %11, %struct.change_stack_entry** @change_stack_pointer, align 8
  %12 = getelementptr inbounds %struct.change_stack_entry* %10, i32 0, i32 1
  store i32 %9, i32* %12, align 4
  br label %13

; <label>:13                                      ; preds = %40, %0
  %k.0 = phi i32 [ 0, %0 ], [ %41, %40 ]
  %14 = sext i32 %s to i64
  %15 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %14
  %16 = getelementptr inbounds %struct.string_data* %15, i32 0, i32 3
  %17 = load i32* %16, align 4
  %18 = icmp slt i32 %k.0, %17
  br i1 %18, label %19, label %21

; <label>:19                                      ; preds = %13
  %20 = icmp slt i32 %k.0, 20
  br label %21

; <label>:21                                      ; preds = %19, %13
  %22 = phi i1 [ false, %13 ], [ %20, %19 ]
  br i1 %22, label %23, label %42

; <label>:23                                      ; preds = %21
  %24 = sext i32 %k.0 to i64
  %25 = sext i32 %s to i64
  %26 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %25
  %27 = getelementptr inbounds %struct.string_data* %26, i32 0, i32 4
  %28 = getelementptr inbounds [20 x i32]* %27, i32 0, i64 %24
  %29 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %30 = getelementptr inbounds %struct.change_stack_entry* %29, i32 0, i32 0
  store i32* %28, i32** %30, align 8
  %31 = sext i32 %k.0 to i64
  %32 = sext i32 %s to i64
  %33 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %32
  %34 = getelementptr inbounds %struct.string_data* %33, i32 0, i32 4
  %35 = getelementptr inbounds [20 x i32]* %34, i32 0, i64 %31
  %36 = load i32* %35, align 4
  %37 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %38 = getelementptr inbounds %struct.change_stack_entry* %37, i32 1
  store %struct.change_stack_entry* %38, %struct.change_stack_entry** @change_stack_pointer, align 8
  %39 = getelementptr inbounds %struct.change_stack_entry* %37, i32 0, i32 1
  store i32 %36, i32* %39, align 4
  br label %40

; <label>:40                                      ; preds = %23
  %41 = add nsw i32 %k.0, 1
  br label %13

; <label>:42                                      ; preds = %21
  %43 = sext i32 %s to i64
  %44 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %43
  %45 = getelementptr inbounds %struct.string_data* %44, i32 0, i32 3
  store i32 0, i32* %45, align 4
  %46 = load i32* @liberty_mark, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* @liberty_mark, align 4
  %48 = sext i32 %s to i64
  %49 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %48
  %50 = getelementptr inbounds %struct.string_data* %49, i32 0, i32 2
  %51 = load i32* %50, align 4
  br label %52

; <label>:52                                      ; preds = %228, %42
  %pos.0 = phi i32 [ %51, %42 ], [ %227, %228 ]
  %53 = add nsw i32 %pos.0, 20
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %54
  %56 = load i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %95

; <label>:59                                      ; preds = %52
  %60 = add nsw i32 %pos.0, 20
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %61
  %63 = load i32* %62, align 4
  %64 = load i32* @liberty_mark, align 4
  %65 = icmp ne i32 %63, %64
  br i1 %65, label %66, label %95

; <label>:66                                      ; preds = %59
  br label %67

; <label>:67                                      ; preds = %66
  %68 = sext i32 %s to i64
  %69 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %68
  %70 = getelementptr inbounds %struct.string_data* %69, i32 0, i32 3
  %71 = load i32* %70, align 4
  %72 = icmp slt i32 %71, 20
  br i1 %72, label %73, label %84

; <label>:73                                      ; preds = %67
  %74 = add nsw i32 %pos.0, 20
  %75 = sext i32 %s to i64
  %76 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %75
  %77 = getelementptr inbounds %struct.string_data* %76, i32 0, i32 3
  %78 = load i32* %77, align 4
  %79 = sext i32 %78 to i64
  %80 = sext i32 %s to i64
  %81 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %80
  %82 = getelementptr inbounds %struct.string_data* %81, i32 0, i32 4
  %83 = getelementptr inbounds [20 x i32]* %82, i32 0, i64 %79
  store i32 %74, i32* %83, align 4
  br label %84

; <label>:84                                      ; preds = %73, %67
  %85 = sext i32 %s to i64
  %86 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %85
  %87 = getelementptr inbounds %struct.string_data* %86, i32 0, i32 3
  %88 = load i32* %87, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %87, align 4
  %90 = load i32* @liberty_mark, align 4
  %91 = add nsw i32 %pos.0, 20
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %92
  store i32 %90, i32* %93, align 4
  br label %94

; <label>:94                                      ; preds = %84
  br label %95

; <label>:95                                      ; preds = %94, %59, %52
  %96 = sub nsw i32 %pos.0, 1
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %97
  %99 = load i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %102, label %138

; <label>:102                                     ; preds = %95
  %103 = sub nsw i32 %pos.0, 1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %104
  %106 = load i32* %105, align 4
  %107 = load i32* @liberty_mark, align 4
  %108 = icmp ne i32 %106, %107
  br i1 %108, label %109, label %138

; <label>:109                                     ; preds = %102
  br label %110

; <label>:110                                     ; preds = %109
  %111 = sext i32 %s to i64
  %112 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %111
  %113 = getelementptr inbounds %struct.string_data* %112, i32 0, i32 3
  %114 = load i32* %113, align 4
  %115 = icmp slt i32 %114, 20
  br i1 %115, label %116, label %127

; <label>:116                                     ; preds = %110
  %117 = sub nsw i32 %pos.0, 1
  %118 = sext i32 %s to i64
  %119 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %118
  %120 = getelementptr inbounds %struct.string_data* %119, i32 0, i32 3
  %121 = load i32* %120, align 4
  %122 = sext i32 %121 to i64
  %123 = sext i32 %s to i64
  %124 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %123
  %125 = getelementptr inbounds %struct.string_data* %124, i32 0, i32 4
  %126 = getelementptr inbounds [20 x i32]* %125, i32 0, i64 %122
  store i32 %117, i32* %126, align 4
  br label %127

; <label>:127                                     ; preds = %116, %110
  %128 = sext i32 %s to i64
  %129 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %128
  %130 = getelementptr inbounds %struct.string_data* %129, i32 0, i32 3
  %131 = load i32* %130, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %130, align 4
  %133 = load i32* @liberty_mark, align 4
  %134 = sub nsw i32 %pos.0, 1
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %135
  store i32 %133, i32* %136, align 4
  br label %137

; <label>:137                                     ; preds = %127
  br label %138

; <label>:138                                     ; preds = %137, %102, %95
  %139 = sub nsw i32 %pos.0, 20
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %140
  %142 = load i8* %141, align 1
  %143 = zext i8 %142 to i32
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %145, label %181

; <label>:145                                     ; preds = %138
  %146 = sub nsw i32 %pos.0, 20
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %147
  %149 = load i32* %148, align 4
  %150 = load i32* @liberty_mark, align 4
  %151 = icmp ne i32 %149, %150
  br i1 %151, label %152, label %181

; <label>:152                                     ; preds = %145
  br label %153

; <label>:153                                     ; preds = %152
  %154 = sext i32 %s to i64
  %155 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %154
  %156 = getelementptr inbounds %struct.string_data* %155, i32 0, i32 3
  %157 = load i32* %156, align 4
  %158 = icmp slt i32 %157, 20
  br i1 %158, label %159, label %170

; <label>:159                                     ; preds = %153
  %160 = sub nsw i32 %pos.0, 20
  %161 = sext i32 %s to i64
  %162 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %161
  %163 = getelementptr inbounds %struct.string_data* %162, i32 0, i32 3
  %164 = load i32* %163, align 4
  %165 = sext i32 %164 to i64
  %166 = sext i32 %s to i64
  %167 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %166
  %168 = getelementptr inbounds %struct.string_data* %167, i32 0, i32 4
  %169 = getelementptr inbounds [20 x i32]* %168, i32 0, i64 %165
  store i32 %160, i32* %169, align 4
  br label %170

; <label>:170                                     ; preds = %159, %153
  %171 = sext i32 %s to i64
  %172 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %171
  %173 = getelementptr inbounds %struct.string_data* %172, i32 0, i32 3
  %174 = load i32* %173, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, i32* %173, align 4
  %176 = load i32* @liberty_mark, align 4
  %177 = sub nsw i32 %pos.0, 20
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %178
  store i32 %176, i32* %179, align 4
  br label %180

; <label>:180                                     ; preds = %170
  br label %181

; <label>:181                                     ; preds = %180, %145, %138
  %182 = add nsw i32 %pos.0, 1
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %183
  %185 = load i8* %184, align 1
  %186 = zext i8 %185 to i32
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %188, label %224

; <label>:188                                     ; preds = %181
  %189 = add nsw i32 %pos.0, 1
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %190
  %192 = load i32* %191, align 4
  %193 = load i32* @liberty_mark, align 4
  %194 = icmp ne i32 %192, %193
  br i1 %194, label %195, label %224

; <label>:195                                     ; preds = %188
  br label %196

; <label>:196                                     ; preds = %195
  %197 = sext i32 %s to i64
  %198 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %197
  %199 = getelementptr inbounds %struct.string_data* %198, i32 0, i32 3
  %200 = load i32* %199, align 4
  %201 = icmp slt i32 %200, 20
  br i1 %201, label %202, label %213

; <label>:202                                     ; preds = %196
  %203 = add nsw i32 %pos.0, 1
  %204 = sext i32 %s to i64
  %205 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %204
  %206 = getelementptr inbounds %struct.string_data* %205, i32 0, i32 3
  %207 = load i32* %206, align 4
  %208 = sext i32 %207 to i64
  %209 = sext i32 %s to i64
  %210 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %209
  %211 = getelementptr inbounds %struct.string_data* %210, i32 0, i32 4
  %212 = getelementptr inbounds [20 x i32]* %211, i32 0, i64 %208
  store i32 %203, i32* %212, align 4
  br label %213

; <label>:213                                     ; preds = %202, %196
  %214 = sext i32 %s to i64
  %215 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %214
  %216 = getelementptr inbounds %struct.string_data* %215, i32 0, i32 3
  %217 = load i32* %216, align 4
  %218 = add nsw i32 %217, 1
  store i32 %218, i32* %216, align 4
  %219 = load i32* @liberty_mark, align 4
  %220 = add nsw i32 %pos.0, 1
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %221
  store i32 %219, i32* %222, align 4
  br label %223

; <label>:223                                     ; preds = %213
  br label %224

; <label>:224                                     ; preds = %223, %188, %181
  %225 = sext i32 %pos.0 to i64
  %226 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %225
  %227 = load i32* %226, align 4
  br label %228

; <label>:228                                     ; preds = %224
  %229 = sext i32 %s to i64
  %230 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %229
  %231 = getelementptr inbounds %struct.string_data* %230, i32 0, i32 2
  %232 = load i32* %231, align 4
  %233 = icmp eq i32 %227, %232
  %234 = xor i1 %233, true
  br i1 %234, label %52, label %235

; <label>:235                                     ; preds = %228
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @remove_neighbor(i32 %str_number, i32 %n) #0 {
  %1 = sext i32 %str_number to i64
  %2 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1
  br label %3

; <label>:3                                       ; preds = %66, %0
  %k.0 = phi i32 [ 0, %0 ], [ %67, %66 ]
  %4 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 5
  %5 = load i32* %4, align 4
  %6 = icmp slt i32 %k.0, %5
  br i1 %6, label %7, label %68

; <label>:7                                       ; preds = %3
  %8 = sext i32 %k.0 to i64
  %9 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 6
  %10 = getelementptr inbounds [160 x i32]* %9, i32 0, i64 %8
  %11 = load i32* %10, align 4
  %12 = icmp eq i32 %11, %n
  br i1 %12, label %13, label %65

; <label>:13                                      ; preds = %7
  %14 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 5
  %15 = load i32* %14, align 4
  %16 = sub nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 6
  %19 = getelementptr inbounds [160 x i32]* %18, i32 0, i64 %17
  %20 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %21 = getelementptr inbounds %struct.change_stack_entry* %20, i32 0, i32 0
  store i32* %19, i32** %21, align 8
  %22 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 5
  %23 = load i32* %22, align 4
  %24 = sub nsw i32 %23, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 6
  %27 = getelementptr inbounds [160 x i32]* %26, i32 0, i64 %25
  %28 = load i32* %27, align 4
  %29 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %30 = getelementptr inbounds %struct.change_stack_entry* %29, i32 1
  store %struct.change_stack_entry* %30, %struct.change_stack_entry** @change_stack_pointer, align 8
  %31 = getelementptr inbounds %struct.change_stack_entry* %29, i32 0, i32 1
  store i32 %28, i32* %31, align 4
  %32 = sext i32 %k.0 to i64
  %33 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 6
  %34 = getelementptr inbounds [160 x i32]* %33, i32 0, i64 %32
  %35 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %36 = getelementptr inbounds %struct.change_stack_entry* %35, i32 0, i32 0
  store i32* %34, i32** %36, align 8
  %37 = sext i32 %k.0 to i64
  %38 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 6
  %39 = getelementptr inbounds [160 x i32]* %38, i32 0, i64 %37
  %40 = load i32* %39, align 4
  %41 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %42 = getelementptr inbounds %struct.change_stack_entry* %41, i32 1
  store %struct.change_stack_entry* %42, %struct.change_stack_entry** @change_stack_pointer, align 8
  %43 = getelementptr inbounds %struct.change_stack_entry* %41, i32 0, i32 1
  store i32 %40, i32* %43, align 4
  %44 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 5
  %45 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %46 = getelementptr inbounds %struct.change_stack_entry* %45, i32 0, i32 0
  store i32* %44, i32** %46, align 8
  %47 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 5
  %48 = load i32* %47, align 4
  %49 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %50 = getelementptr inbounds %struct.change_stack_entry* %49, i32 1
  store %struct.change_stack_entry* %50, %struct.change_stack_entry** @change_stack_pointer, align 8
  %51 = getelementptr inbounds %struct.change_stack_entry* %49, i32 0, i32 1
  store i32 %48, i32* %51, align 4
  %52 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 5
  %53 = load i32* %52, align 4
  %54 = sub nsw i32 %53, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 6
  %57 = getelementptr inbounds [160 x i32]* %56, i32 0, i64 %55
  %58 = load i32* %57, align 4
  %59 = sext i32 %k.0 to i64
  %60 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 6
  %61 = getelementptr inbounds [160 x i32]* %60, i32 0, i64 %59
  store i32 %58, i32* %61, align 4
  %62 = getelementptr inbounds %struct.string_data* %2, i32 0, i32 5
  %63 = load i32* %62, align 4
  %64 = add nsw i32 %63, -1
  store i32 %64, i32* %62, align 4
  br label %68

; <label>:65                                      ; preds = %7
  br label %66

; <label>:66                                      ; preds = %65
  %67 = add nsw i32 %k.0, 1
  br label %3

; <label>:68                                      ; preds = %13, %3
  %done.0 = phi i32 [ 1, %13 ], [ 0, %3 ]
  %69 = icmp ne i32 %done.0, 0
  br i1 %69, label %70, label %71

; <label>:70                                      ; preds = %68
  br label %72

; <label>:71                                      ; preds = %68
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2930, i8* getelementptr inbounds ([5 x i8]* @.str37, i32 0, i32 0), i32 -1, i32 -1)
  br label %72

; <label>:72                                      ; preds = %71, %70
  ret void
}

declare void @showboard(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
